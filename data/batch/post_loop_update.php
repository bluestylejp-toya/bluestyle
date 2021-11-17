#!/usr/local/bin/php
<?php
ini_set('display_errors', '1');
chdir(dirname(__FILE__));
require_once '../../html/require.php';
while (@ob_end_flush());

define('BATCH', true);
$chain_id = $argv[1];
if (strlen($chain_id) == 0) {
    die('引数1 (chain_id) が指定されていない。');
}
echo "START\n";
echo "\$chain_id={$chain_id}\n";
$objBatch = new Batch;
$objBatch->main($chain_id);

class Batch {
    public function main($chain_id) {
        $objQuery = SC_Query_Ex::getSingletonInstance();

        try {
            $this->process($chain_id);
        }
        catch (Exception $e) {
            $this->mailShop($e, '例外を補足');
            throw $e;
        }
    }

    public function process($chain_id) {
        $objQuery = SC_Query_Ex::getSingletonInstance();
        $objPurchase = new SC_Helper_Purchase_Ex();
        $objProduct = new SC_Product_Ex();

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
            $edge = reset($chain->selection_edge_list);
            echo "分岐選択: {$edge->target_id}:\n";
            $this->mailSelectItem($edge->target_id, $chain_id);
        }

        // Chain 成立済みか
        $chained = count($chain->chain_list) == 1;
        echo '$chained = ' . var_export($chained, true) . "\n";

        if (!isset($chain->selected_edge_list)
            || !is_array($chain->selected_edge_list)
        ) {
            throw new Exception('selected_edge_list が異常。: ' . var_export($selected_edge_list ,true));
        }

        // 末尾にキャッシュ処理があるため、このループ内で continue しない。
        foreach ($chain->selected_edge_list as &$edge) {
            echo "{$edge->source_id},{$edge->target_id}\n";

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
                $order_id = $this->createOrder($chain_id, $customer_id, $product_class_id, $arrSourceProduct);
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
            // 対応状況が「新規受付」(ORDER_NEW) の場合
            if ($arrOrder['status'] == ORDER_NEW) {
                // 無料
                if ($arrOrder['payment_id'] == 7) {
                    $objQuery->begin();
                    $objPurchase->sfUpdateOrderStatus($order_id, ORDER_PRE_END);
                    $objQuery->commit();
                }
                // クレジットカード
                elseif ($arrOrder['payment_id'] == 6) {
                    SC_Helper_Purchase_Ex::payment($order_id);
                }
            }
            $arrOrder = SC_Helper_Purchase_Ex::getOrder($order_id);

            if ($arrOrder['status'] == ORDER_PAY_WAIT) { // 入金待ち
                throw new Exception("カウントアップの読み込みを中断した。: ORDER_PAY_WAIT");
            }

            // 後続の foreach で参照するためキャッシュ
            $edge->arrOrder = $arrOrder;
        }
        unset($edge);

        // Chain 成立済みの場合
        // 上のループと分けて遅延実行する https://bluestyle.backlog.jp/view/CHAIN-246#comment-126470865
        if ($chained) {
            echo "Chain 成立済み\n";
            foreach ($chain->selected_edge_list as $edge) {
                echo "{$edge->source_id},{$edge->target_id}\n";

                $arrOrder = $edge->arrOrder;

                // 注文受付メールを送信するか
                $send_order_mail = false;
                if ($arrOrder['status'] == ORDER_PRE_END) {
                    // 対応状況を更新
                    $objQuery->begin();
                    $objPurchase->sfUpdateOrderStatus($arrOrder['order_id'], ORDER_CHAIN);
                    $objQuery->commit();
                    $send_order_mail = true;
                }
                // この状態はあまり想定しにくいが、メール送信に失敗したケースか。
                elseif ($arrOrder['status'] == ORDER_CHAIN) {
                    $send_order_mail = true;
                }

                if ($send_order_mail
                    && !SC_Helper_Mail_Ex::existsOrderMailHistory($arrOrder['order_id'], 1)
                ) {
                    echo "sendOrderMail\n";
                    // 注文受付メールを送信
                    $objPurchase->sendOrderMail($arrOrder['order_id']);
                }
            }
        }
    }

    /**
     * 受注を作成する。
     *
     * トランザクション制御しない。(呼び出し元で行う。) そのため、この関数内で例外をスローすると、ロールバックされる。
     */
    function createOrder($chain_id, $customer_id, $product_class_id, $arrSourceProduct)
    {
        $objQuery = SC_Query_Ex::getSingletonInstance();
        $objPurchase = new SC_Helper_Purchase_Ex();
        $objProduct = new SC_Product_Ex();

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
            'order_addr03' => $arrCustomer['addr03'],
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
            // データベースはコミットしたいため、例外で処理しない。呼び出し元で、対応状況を基に例外をスローする(カウントアップしない)。
            $body = <<< __EOS__
在庫の減少で異常を検出しました。
・注文番号: {$order_id}
・chain_id: {$chain_id}
・product_id: {$arrSourceProduct['product_id']}
・product_class_id: {$product_class_id}
__EOS__;
            $this->mailShop($body, '在庫の減少で異常を検出');
        }

        return $order_id;
    }

    function mailShop($body, $subject = '') {
        $objHelperMail = new SC_Helper_Mail_Ex();

        $objHelperMail->sfSendMail('', $subject, $body);
    }

    /**
     * 「アイテムを選択してください」メールを送信する。
     *
     * LC_Page_Contact::lfSendMail() を基に実装。
     * @return void
     * @link https://bluestyle.backlog.jp/view/CHAIN-197
     */
    function mailSelectItem($product_id, $chain_id)
    {
        echo 'Start ' . __FUNCTION__ . "\n";

        $objPage = new LC_Page_Ex();
        $helperMail = new SC_Helper_Mail_Ex();
        $objProduct = new SC_Product_Ex();
        $objQuery = SC_Query_Ex::getSingletonInstance();

        $arrTargetProduct = $objProduct->getDetail($product_id);
        if (empty($arrTargetProduct)) {
            throw new Exception("対象の商品情報を取得できない。: {$product_id}");
        }
        $customer_id = $arrTargetProduct['customer_id'];

        // 送信済みチェック
        if ($arrTargetProduct['mailed_select_item'] === $chain_id) {
            echo "送信省略(送信済み)\n";
            return;
        }

        $arrCustomer = SC_Helper_Customer_Ex::sfGetCustomerData($customer_id);
        if (empty($arrCustomer)) {
            throw new Exception("対象の会員情報を取得できない。: {$customer_id}");
        }

        $CONF = SC_Helper_DB_Ex::sfGetBasisData();

        $objPage->tpl_url = HTTPS_URL . 'mypage/myitem/myitem_detail.php?product_id=' . $product_id;
        $helperMail->setPage($objPage);
        $helperMail->sfSendTemplateMail(
            $arrCustomer['email'],                          // to
            $arrCustomer['name01'] . ' 様',                 // to_name
            101,                                            // template_id 101:アイテムを選択してください
            $objPage,                                       // objPage
            $CONF['email03'],                               // from_address
            $CONF['shop_name'],                             // from_name
            $CONF['email02'],                               // reply_to
            $CONF['email02']                                // bcc
        );
        echo "送信\n";

        // 商品マスターに送信済みを記録
        $arrUpdate = [
            'mailed_select_item' => $chain_id,
        ];
        $where = 'product_id = ?';
        $arrWhereValue = [$product_id];
        $objQuery->update('dtb_products', $arrUpdate, $where, $arrWhereValue);
    }
}
