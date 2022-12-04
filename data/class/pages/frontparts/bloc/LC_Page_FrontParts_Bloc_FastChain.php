<?php
require_once CLASS_EX_REALDIR . 'page_extends/frontparts/bloc/LC_Page_FrontParts_Bloc_Ex.php';

/**
 * @package Page
 */
class LC_Page_FrontParts_Bloc_FastChain extends LC_Page_FrontParts_Bloc_Ex
{
    // 表示件数
    const DISPNUM = 10;

    // cookie保持期限
    const EXPIRESDAY = 30;

    // 保存するcookieの名前
    const COOKIENAME = 'plg_CheckedItems_product';

    /**
     * @var 閲覧商品配列
     */
    public $arrCheckItems;

    /**
     * @var リクエスト商品ID
     */
    public $arrRequestProductId = [];

    /**
     * LC_Page_FrontParts_Bloc_CheckItem constructor.
     */
    public function __construct()
    {
    }

    /**
     * Page を初期化する.
     *
     * @return void
     */
    public function init()
    {
        parent::init();
        $this->httpCacheControl('nocache');
    }

    /**
     * Page のプロセス.
     *
     * @return void
     */
    public function process()
    {
        $this->action();
        $this->sendResponse();
    }

    /**
     * Page のアクション.
     *
     * @return void
     */
    public function action()
    {
        // ファストChain商品を取得
        $objCustomer = new SC_Customer_Ex();
        if ($this->tpl_login = $objCustomer->isLoginSuccess() === true) {
            $this->arrFastChainProduct = $this->getProducts($objCustomer->getValue('customer_id'));
        }
    }

    /**
     * @param $customer_id
     * @return array
     * @throws Exception
     */
    private function getFastChainProductId($customer_id)
    {
        // 出品中アイテム商品ID取得
        $arrProductId = array();
        $arrListingProducts = SC_Product_Ex::getListingProducts($customer_id);
        foreach ($arrListingProducts as $arrListingProduct) {
            $arrProductId[] = $arrListingProduct['product_id'];
        }
        $objProduct = new SC_Product_Ex();
        $objHelperApi = new SC_Helper_Api_Ex();
        $objHelperApi->setUrl(API_URL . 'chain/edges/first');
        $objHelperApi->setMethod('POST');
        $arrFastChainProductId = array();

        $data = [];
        foreach ($arrProductId as $productId) {
            $data[] = ["id" => $productId];
        }
        $objHelperApi->setPostParam($data);

        try {
            $result_raw = $objHelperApi->exec();
            $arrResult = json_decode($result_raw, null, 512, JSON_THROW_ON_ERROR);
            if (count($arrResult) > 0) {
                foreach ($arrResult as $result) {
                    if (in_array($result->target_id, $arrProductId)) {
                        $arrFastChainProductId[] = $result->source_id;
                    }
                }
            }
        }catch (Exception $e){
            // ログ出力のみでエラー画面にしない
            GC_Utils_Ex::gfPrintLog('=== LC_Page_FrontParts_Bloc_FastChain.php getFastChainProductId start');
            GC_Utils_Ex::gfPrintLog('customer_id:' . $customer_id . "\n".'data:' . var_export($data, true) . "\n" . 'errorMessage:' .  var_export($e->getMessage(), true));
            GC_Utils_Ex::gfPrintLog('=== LC_Page_FrontParts_Bloc_FastChain.php getFastChainProductId end');
        }

        return array_unique($arrFastChainProductId);
    }

    /**
     * 出品中アイテムを取得する
     *
     * @param mixed $customer_id
     * @access private
     * @return array 出品中アイテム商品一覧
     */
    public function getProducts($customer_id)
    {
        // 出品中アイテム商品ID取得
        $arrProductId = $this->getFastChainProductId($customer_id);
        sort($arrProductId);

        $objQuery = SC_Query_Ex::getSingletonInstance();
        $objQuery->setWhere($this->lfMakeWhere('alldtl.', $arrProductId));
        $objProduct = new SC_Product_Ex();
        $linemax = $objProduct->findProductCount($objQuery);

        $this->tpl_linemax = $linemax;   // 何件が該当しました。表示用

        // ページ送りの取得
        $objNavi = new SC_PageNavi_Ex($this->tpl_pageno, $linemax, $this->dispNumber, 'eccube.movePage', NAVI_PMAX);
        $this->tpl_strnavi = $objNavi->strnavi; // 表示文字列
        $startno = $objNavi->start_row;

        $objQuery = SC_Query_Ex::getSingletonInstance();
        //$objQuery->setLimitOffset($this->dispNumber, $startno);
        // 取得範囲の指定(開始行番号、行数のセット)
        $arrProductId = array_slice($arrProductId, $startno, $this->dispNumber);

        $where = $this->lfMakeWhere('', $arrProductId);
        $where .= ' AND del_flg = 0 AND status = 1';
        $where .= ' ORDER BY product_id DESC ';
        $objQuery->setWhere($where, $arrProductId);
        $addCols = ['count_of_favorite'];
        $addCols[] = 'nickname';
        $arrProducts = $objProduct->lists($objQuery, [], $addCols);

        //取得している並び順で並び替え
        $arrProducts2 = array();
        foreach ($arrProducts as $item) {
            $arrProducts2[$item['product_id']] = $item;
        }
        $arrProductsList = array();
        foreach ($arrProductId as $product_id) {
            $arrProductsList[] = $arrProducts2[$product_id];
        }
        array_multisort(
            $arrProductsList, SORT_DESC,
            $arrProductsList
        );

        return $arrProductsList;
    }

    /* 仕方がない処理。。 */

    /**
     * @param string $tablename
     */
    public function lfMakeWhere($tablename, $arrProductId)
    {
        // 取得した表示すべきIDだけを指定して情報を取得。
        $where = '';
        if (is_array($arrProductId) && !empty($arrProductId)) {
            $where = $tablename . 'product_id IN (' . implode(',', $arrProductId) . ')';
        } else {
            // 一致させない
            $where = '0<>0';
        }

        return $where;
    }
}
