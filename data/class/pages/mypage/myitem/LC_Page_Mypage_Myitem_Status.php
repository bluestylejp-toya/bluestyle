<?php
require_once CLASS_EX_REALDIR . 'page_extends/mypage/LC_Page_AbstractMypage_Ex.php';

/**
 * 出品中アイテム一覧 のページクラス.
 *
 * @package Page
 */
class LC_Page_Mypage_Myitem_Status extends LC_Page_AbstractMypage_Ex
{
    /** ページナンバー */
    public $tpl_pageno;

    /** @var SC_FormParam フォームパラメーター */
    public $objFormParam;

    /**
     * Page を初期化する.
     *
     * @return void
     */
    public function init()
    {
        parent::init();
        $this->tpl_subtitle = '選択待ちのアイテム';
        $this->tpl_mypageno = 'item-list';
        // 1ページあたりの件数
        $this->dispNumber = 10;
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
        // パラメーター管理クラス
        $this->objFormParam = new SC_FormParam_Ex();
        // パラメーター情報の初期化
        $this->arrForm = $this->lfInitParam($this->objFormParam);
        // プロダクトIDの正当性チェック
        $objProduct = new SC_Product_Ex();
        $product_id = $this->lfCheckProductId($this->objFormParam->getValue('admin'), $this->objFormParam->getValue('product_id'), $objProduct);

        $this->arrChainProduct = $this->getChainProductStatus($product_id, $this);
    }

    /**
     * プロダクトIDの正当性チェック
     *
     * @param string $admin_mode
     * @param int $product_id
     * @param SC_Product $objProduct
     * @return integer
     */
    public function lfCheckProductId($admin_mode, $product_id, SC_Product $objProduct)
    {
        // 管理機能からの確認の場合は、非公開の商品も表示する。
        if (isset($admin_mode) && $admin_mode == 'on' && SC_Utils_Ex::sfIsSuccess(new SC_Session_Ex(), false)) {
            $include_hidden = true;
        } else {
            $include_hidden = false;
        }

        if (!$objProduct->isValidProductId($product_id, $include_hidden)) {
            SC_Utils_Ex::sfDispSiteError(PRODUCT_NOT_FOUND);
        }

        return $product_id;
    }

    /**
     * パラメーター情報の初期化
     *
     * @param SC_FormParam $objFormParam
     * @return array
     */
    public function lfInitParam(SC_FormParam &$objFormParam)
    {
        $objFormParam->addParam('商品ID', 'product_id', INT_LEN, 'n', array('EXIST_CHECK', 'ZERO_CHECK', 'NUM_CHECK', 'MAX_LENGTH_CHECK'));
        // 値の取得
        $objFormParam->setParam($_REQUEST);
        // 入力値の変換
        $objFormParam->convParam();
        // 入力情報を渡す
        return $objFormParam->getFormParamList();
    }

    /**
     * @param $customer_id
     * @return array
     * @throws Exception
     */
    private function getChainProductStatus($product_id)
    {
        $objHelperApi = new SC_Helper_Api_Ex();
        $objHelperApi->setMethod('GET');

        $arrChainProductStatus = array();

        $arrProducts = $this->getProducts($product_id, $this);
        $objProduct = new SC_Product_Ex();
        foreach ($arrProducts as $arrProduct) {
            $objHelperApi->setUrl(API_URL . 'chain/find?' . 'id=' . $arrProduct['product_id']);
            $result = json_decode($objHelperApi->exec(), true);
            if (count($result) > 0) {
                $objHelperApi->setUrl(API_URL . 'chain/' . $result[0]['id']);
                $result = json_decode($objHelperApi->exec(), true);
                foreach ($result["selection_edge_list"] as $chainList) {
                    if ($chainList['source_id'] == $_GET['product_id']) {
                        $arrChainProductStatus['source_product'] = $arrProduct;
                        $arrChainProductStatus['target_product'][] = $objProduct->getDetail($chainList['target_id']);
                        $arrChainProductStatus['progress_percent'] = $result['progress_percent'];
                    }
                }
            }
        }

        return $arrChainProductStatus;
    }

    /**
     * 出品中アイテムを取得する
     *
     * @param mixed $customer_id
     * @access private
     * @return array 出品中アイテム商品一覧
     */
    public function getProducts($product_id)
    {
        // 出品中アイテム商品ID取得
        $arrProductId = array();
//        $arrListingProducts  = SC_Product_Ex::getListingProducts($customer_id);
//        foreach ($arrListingProducts as $arrListingProduct) {
//            //$arrProductId[] = $arrListingProduct['product_id'];
//        }
        $arrProductId[] = $product_id;

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
        $where .= ' AND del_flg = 0';
        $objQuery->setWhere($where, $arrProductId);
        $addCols = ['count_of_favorite'];
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
