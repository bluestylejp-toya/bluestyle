<?php
require_once CLASS_EX_REALDIR . 'page_extends/mypage/LC_Page_AbstractMypage_Ex.php';

/**
 * 送付状QR.
 *
 * @package Page
 */
class LC_Page_Mypage_Myitem_Qr extends LC_Page_AbstractMypage_Ex
{
    /** @var int 商品ID */
    public $tpl_product_id;

    /**
     * Page を初期化する.
     *
     * @return void
     */
    public function init()
    {
        parent::init();
        $this->tpl_subtitle = '送付状QR';
        $this->tpl_mypageno = 'qr';
    }

    /**
     * Page のプロセス.
     *
     * @return void
     */
    public function process()
    {
        parent::process();
    }

    /**
     * Page のAction.
     *
     * @return void
     */
    public function action()
    {
        $objCustomer = new SC_Customer_Ex();
        $customerId = $objCustomer->getValue('customer_id');

        $objFormParam = new SC_FormParam_Ex();
        $this->lfInitFormParam($objFormParam, $_GET);

        $productId = $objFormParam->getValue('product_id');
        $this->tpl_product_id = $productId;
        $target = $this->getTradingIds($customerId, $productId);

        $this->qrBase64Image = null;
        if (!is_null($target)) {
            $this->qrBase64Image = $this->getQrCode($customerId, $target['customer_id'], $target['order_id'], $productId);
        }
    }

    /**
     * パラメーター情報の初期化
     *
     * @param $objFormParam SC_FormParam_Ex $objFormParam SC_FormParamインスタンス
     * @param $arrGet array $_GETデータ
     */
    public function lfInitFormParam(&$objFormParam, $arrGet)
    {
        $objFormParam->addParam('商品ID', 'product_id', INT_LEN, 'n', array('NUM_CHECK', 'MAX_LENGTH_CHECK'));
        $objFormParam->setParam($arrGet);
        $objFormParam->convParam();
    }

    /**
     * 交換相手の会員IDと注文IDを返す
     *
     * @param $customerId int 会員ID
     * @param $productId int 商品ID
     * @return array|null customer_id、order_idの連想配列
     * @throws Exception
     */
    private function getTradingIds($customerId, $productId)
    {
        $objHelperApi = new SC_Helper_Api_Ex();
        $objHelperApi->setMethod('GET');

        // 自身の商品IDを含むChainIDを取得
        $objHelperApi->setUrl(API_URL . 'chain/find?' . 'id=' . $productId);
        $result = json_decode($objHelperApi->exec(), true);

        // Chainが存在しない
        if (count($result) <= 0) {
            return null;
        }

        // Chain詳細情報を取得
        $objHelperApi->setUrl(API_URL . 'chain/' . $result[0]['id']);
        $result = json_decode($objHelperApi->exec(), true);

        // 分岐選択待ち商品あり
        if (count($result['selection_edge_list']) > 0) {
            return null;
        }

        // 自身の商品を含む注文が作成されていない
        if (is_null($this->getOrderId($customerId, $productId))) {
            return null;
        }

        // Chainから自身の商品と交換対象の商品IDを取得
        $targetProductId = null;
        foreach ($result['selected_edge_list'] as $selected_edge_list) {
            if ($selected_edge_list['source_id'] == $productId) {
                $targetProductId = $selected_edge_list['target_id'];
                break;
            }
        }

        // 交換対象の商品IDが存在しない
        if (is_null($targetProductId)) {
            return null;
        }

        // 交換対象の商品詳細情報取得
        $objProduct = new SC_Product_Ex();
        $arrTargetProductDetail = $objProduct->getDetail($targetProductId);

        // 交換対象の商品を含む注文が作成されていない
        $orderId = $this->getOrderId($arrTargetProductDetail['customer_id'], $arrTargetProductDetail['product_id']);
        if (is_null($orderId)) {
            return null;
        }

        return [
            "customer_id" => $arrTargetProductDetail['customer_id'],
            "order_id" => $orderId
        ];
    }

    /**
     * ヤマトより配送用QRコードを取得する
     *
     * @param $sourceCustomerId int ご依頼主の会員ID
     * @param $targetCustomerId int お届け先の会員ID
     * @param $orderId int 配送する商品の注文ID
     * @param $productId int 配送する商品の商品ID
     * @return string QRコードのPNG画像をBase64エンコードしたデータ
     * @throws Exception
     */
    private function getQrCode($sourceCustomerId, $targetCustomerId, $orderId, $productId)
    {
        $masterData = new SC_DB_MasterData_Ex();
        $arrPref = $masterData->getMasterData('mtb_pref');

        $arrSourceCustomer = SC_Helper_Customer_Ex::sfGetCustomerData($sourceCustomerId);
        $arrTargetCustomer = SC_Helper_Customer_Ex::sfGetCustomerData($targetCustomerId);

        $objProduct = new SC_Product_Ex();
        $arrProductDetail = $objProduct->getDetail($productId);

        $objHelperApi = new SC_Helper_Api_Ex();
        $objHelperApi->setMethod('POST');
        $objHelperApi->setUrl(API_URL . 'yamato/shipping_qr_code/create');
        $data = [
            "tradingId" => $orderId,
            "reservePwd" => sprintf('%06d', $orderId),
            // お届け先
            "dstTel1" => $arrTargetCustomer['tel01'],
            "dstTel2" => $arrTargetCustomer['tel02'],
            "dstTel3" => $arrTargetCustomer['tel03'],
            "dstZipCd" => $arrTargetCustomer['zip01'].$arrTargetCustomer['zip02'],
            "dstAddress1" => $arrPref[$arrTargetCustomer['pref']],
            "dstAddress2" => $arrTargetCustomer['addr01'],
            "dstAddress3" => $arrTargetCustomer['addr02'],
            "dstAddress4" => '',
            "dstLastNm" => $arrTargetCustomer['name01'],
            "dstFirstNm" => $arrTargetCustomer['name02'],
            // ご依頼主
            "srcTel1" => $arrSourceCustomer['tel01'],
            "srcTel2" => $arrSourceCustomer['tel02'],
            "srcTel3" => $arrSourceCustomer['tel03'],
            "srcZipCd" => $arrSourceCustomer['zip01'].$arrSourceCustomer['zip02'],
            "srcAddress1" => $arrPref[$arrSourceCustomer['pref']],
            "srcAddress2" => $arrSourceCustomer['addr01'],
            "srcAddress3" => $arrSourceCustomer['addr02'],
            "srcAddress4" => '',
            "srcLastNm" => $arrSourceCustomer['name01'],
            "srcFirstNm" => $arrSourceCustomer['name02'],
            "baggDesc2" => $this->getTextLengthLimit($arrProductDetail['name']),
            "baggHandling1" => "02",
            "baggHandling2" => "03",
        ];

//        SC_Utils::sfPrintR($data);

        $objHelperApi->setPostParam($data);
        $result = json_decode($objHelperApi->exec(), true);

        return $result['qr_code_encode'];
    }

    /**
     * 会員IDと商品IDに紐づく注文IDを取得
     *
     * @param int $customerId 会員ID
     * @param int $productId 商品ID
     * @return int|null 注文ID
     */
    private function getOrderId($customerId, $productId)
    {
        $objQuery = SC_Query_Ex::getSingletonInstance();
        $col    = 'dtb_order.order_id, dtb_order_detail.product_id, dtb_order_detail.product_name , dtb_products.customer_id';
        $table  = 'dtb_order LEFT JOIN dtb_order_detail ON dtb_order.order_id = dtb_order_detail.order_id ';
        $table  .= 'LEFT JOIN dtb_products ON dtb_order_detail.product_id = dtb_products.product_id';
        $where  = 'dtb_order_detail.product_id = ? and dtb_products.customer_id = ?';
        $arrOrderDetail = $objQuery->select($col, $table, $where, array($productId, $customerId));

        if (!is_null($arrOrderDetail)) {
            return $arrOrderDetail[0]['order_id'];
        }
        return null;
    }

    /**
     *文字列の文字数が閾値を超えた場合末尾を「...」にする
     *
     * @param string $text 対象の文字列
     * @param int $limit 文字数
     * @return string 結果
     */
    private function getTextLengthLimit($text, $limit=17) {
        if(mb_strlen($text) > $limit) {
            $text = mb_substr($text, 0, $limit - 3);
            $text .= '...';
        }
        return $text;
    }
}
