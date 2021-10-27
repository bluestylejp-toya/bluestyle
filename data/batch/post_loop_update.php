#!/usr/local/bin/php
<?php
ini_set('display_errors', '1');
chdir(dirname(__FILE__));
require_once '../../html/require.php';
while (@ob_end_flush());

$chain_id = $argv[1];
if (strlen($chain_id) == 0) {
    die('引数1 (chain_id) が指定されていない。');
}
echo "START\n";
echo "\$chain_id={$chain_id}\n";
Batch::main($chain_id);

class Batch {
    public static function main($chain_id) {
        $objQuery = SC_Query_Ex::getSingletonInstance();
        $objPurchase = new SC_Helper_Purchase_Ex();

        $chain = SC_Helper_Api_Ex::getChain($chain_id);

        // ループから外れた商品を公開とし、該当アイテムの dtb_products.chain_id を抹消する。
        // https://bluestyle.backlog.jp/view/CHAIN-184
        $objQuery->begin();
        SC_Helper_Chain_Ex::unlockProductsByChainId($chain_id);
        SC_Helper_Chain_Ex::lockProductsByChainId($chain_id);
        $objQuery->commit();

        if (!isset($chain->selection_edge_list)
            || !is_array($chain->selection_edge_list)
        ) {
            throw new Exception('selection_edge_list が異常。: ' . var_export($selection_edge_list ,true));
        }

        if (!empty($chain->selection_edge_list)) {
            echo "分岐選択:\n";
            var_export($chain->selection_edge_list);
        }

        // Chain 成立済みか
        $chained = count($chain->chain_list) == 1;
        echo '$chained = ' . var_export($chained, true) . "\n";

        if (!isset($chain->selected_edge_list)
            || !is_array($chain->selected_edge_list)
        ) {
            throw new Exception('selected_edge_list が異常。: ' . var_export($selected_edge_list ,true));
        }

        foreach ($chain->selected_edge_list as $edge) {
            echo "{$edge->source_id},{$edge->target_id}\n";

            $objProduct = new SC_Product_Ex();

            $objQuery->begin();

            $arrSourceProduct = $objProduct->getDetail($edge->source_id);
            if (empty($arrSourceProduct)) {
                throw new Exception();
            }
            $arrSourceProductsClasses = $objProduct->getProductsClassFullByProductId($edge->source_id);
            if (count($arrSourceProductsClasses) != 1) {
                throw new Exception();
            }
            $arrSourceProductsClass = reset($arrSourceProductsClasses);
            $product_class_id = $arrSourceProductsClass['product_class_id'];

            $arrTargetProduct = $objProduct->getDetail($edge->target_id);
            if (empty($arrTargetProduct)) {
                throw new Exception();
            }
            $customer_id = $arrTargetProduct['customer_id'];

            $arrOrder = SC_Helper_Purchase_Ex::getOrderByChain($chain_id, $customer_id, $product_class_id);
            if (empty($arrOrder)) {
                echo "createOrder\n";
                $order_id = self::createOrder($chain_id, $customer_id, $product_class_id, $arrSourceProduct);
                $arrOrder = SC_Helper_Purchase_Ex::getOrder($order_id);
            }
            else {
                $order_id = $arrOrder['order_id'];
            }

            $objQuery->commit();

            // 中断
            if ($arrOrder['status'] == ORDER_SUSPEND) {
                throw new Exception("カウントアップの読み込みを中断した。: ORDER_SUSPEND");
            }

            // 決済処理
            if ($arrOrder['status'] == ORDER_NEW) {
                // 無料
                if ($arrOrder['payment_id'] == 7) {
                    $objPurchase->sfUpdateOrderStatus($order_id, ORDER_PRE_END); // ループ (Chain 確定)
                }
            }
            $arrOrder = SC_Helper_Purchase_Ex::getOrder($order_id);

            // Chain 成立済みの場合
            if ($chained) {
                // 注文受付メールを送信するか
                $send_order_mail = false;
                if ($arrOrder['status'] == ORDER_CHAIN) {
                    $send_order_mail = true;
                }
                // ループ (Chain 確定)
                elseif ($arrOrder['status'] == ORDER_PRE_END) {
                    // 対応状況を更新
                    $objQuery->begin();
                    $objPurchase->sfUpdateOrderStatus($order_id, ORDER_CHAIN); // Chain 成立
                    $objQuery->commit();
                    $send_order_mail = true;
                }

                if ($send_order_mail
                    && !SC_Helper_Mail_Ex::existsOrderMailHistory($order_id, 1)
                ) {
                    echo "sendOrderMail\n";
                    // 注文受付メールを送信
                    $objPurchase->sendOrderMail($order_id);
                }
            }
        }
    }

    static function createOrder($chain_id, $customer_id, $product_class_id, $arrSourceProduct)
    {
        $objQuery = SC_Query_Ex::getSingletonInstance();
        $objPurchase = new SC_Helper_Purchase_Ex();
        $objProduct = new SC_Product_Ex();
        $objHelperMail = new SC_Helper_Mail_Ex();

        $arrCustomer = SC_Helper_Customer_Ex::sfGetCustomerData($customer_id);
        if (empty($arrCustomer)) {
            throw new Exception();
        }

        // 在庫の減少処理
        $reduce_stock_normality = $objProduct->reduceStock($product_class_id, 1);

        $arrPayment = SC_Helper_Payment_Ex::get($arrCustomer['default_payment_id']);
        if (!is_array($arrPayment) || empty($arrPayment)) {
            throw new Exception();
        }

        // 受注情報
        $arrOrder = [
            'status' => $reduce_stock_normality ? ORDER_NEW : ORDER_SUSPEND,
            'customer_id' => $arrCustomer['customer_id'],
            'order_name01' => $arrCustomer['name01'],
            'order_name02' => $arrCustomer['name02'],
            'order_kana01' => $arrCustomer['kana01'],
            'order_kana02' => $arrCustomer['kana02'],
            'order_company_name' => $arrCustomer['company_name'],
            'order_zip01' => $arrCustomer['zip01'],
            'order_zip02' => $arrCustomer['zip02'],
            'order_zipcode' => $arrCustomer['zipcode'],
            'order_country_id' => $arrCustomer['country_id'],
            'order_pref' => $arrCustomer['pref'],
            'order_addr01' => $arrCustomer['addr01'],
            'order_addr02' => $arrCustomer['addr02'],
            'order_email' => $arrCustomer['email'],
            'order_email_mobile' => $arrCustomer['email_mobile'],
            'order_tel01' => $arrCustomer['tel01'],
            'order_tel02' => $arrCustomer['tel02'],
            'order_tel03' => $arrCustomer['tel03'],
            'order_fax01' => $arrCustomer['fax01'],
            'order_fax02' => $arrCustomer['fax02'],
            'order_fax03' => $arrCustomer['fax03'],
            'order_sex' => $arrCustomer['sex'],
            'order_job' => $arrCustomer['job'],
            'order_birth' => $arrCustomer['birth'],
            'deliv_id' => 1, // ネコポス
            'deliv_fee' => 0,
            'payment_id' => $arrPayment['payment_id'],
            'charge' => $arrPayment['charge'],
            'chain_id' => $chain_id,
            'subtotal' => 0,
            'tax' => 0,
            'discount' => 0,
            'use_point' => 0,
        ];

        // 配送業者の送料を加算
        if (OPTION_DELIV_FEE == 1
            && !SC_Utils_Ex::isBlank($arrCustomer['pref'])
            && !SC_Utils_Ex::isBlank($arrOrder['deliv_id'])
        ) {
            $arrOrder['deliv_fee'] += SC_Helper_Delivery_Ex::getDelivFee($arrCustomer['pref'], $arrOrder['deliv_id']);
        }

        $arrOrder['total'] = $arrOrder['subtotal'] - $arrOrder['discount'] + $arrOrder['deliv_fee'] + $arrOrder['charge'];
        $arrOrder['payment_total'] = $arrOrder['total'] - ($arrOrder['use_point'] * POINT_VALUE);

        $order_id = $objPurchase->registerOrder(null, $arrOrder);
        // 受注詳細情報
        $arrDetail = array();
        $arrDetail[0] = [
            'product_id' => $arrSourceProduct['product_id'],
            'product_class_id' => $product_class_id,
            'product_name' => $arrSourceProduct['name'],
            'price' => 0,
            'quantity' => 1,
        ];
        $objPurchase->registerOrderDetail($order_id, $arrDetail);

        // 在庫の減少で異常を検出
        if (!$reduce_stock_normality) {
            echo "在庫の減少で異常を検出\n";

            // メール通知 (店舗宛)
            $body = <<< __EOS__
在庫の減少で異常を検出しました。
・注文番号: {$order_id}
・chain_id: {$chain_id}
・product_id: {$arrSourceProduct['product_id']}
・product_class_id: {$product_class_id}
__EOS__;
            $objHelperMail->sfSendMail('', '在庫の減少で異常を検出', $body);
        }

        return $order_id;
    }
}
