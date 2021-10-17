<?php
require_once CLASS_EX_REALDIR . 'page_extends/mypage/LC_Page_AbstractMypage_Ex.php';

/**
 * 出品中アイテム一覧 のページクラス.
 *
 * @package Page
 */
class LC_Page_Mypage_Myitem_UnselectedItem extends LC_Page_AbstractMypage_Ex
{
    /** ページナンバー */
    public $tpl_pageno;

    /**
     * Page を初期化する.
     *
     * @return void
     */
    public function init()
    {
        parent::init();
        $this->tpl_subtitle = '選択待ちのアイテム詳細';
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
        $objCustomer = new SC_Customer_Ex();
        $customer_id = $objCustomer->getValue('customer_id');

        // パラメーター管理クラス
        $this->objFormParam = new SC_FormParam_Ex();
        // パラメーター情報の初期化
        $this->arrForm = $this->lfInitParam($this->objFormParam);

        // プロダクトIDの正当性チェック
        $objProduct = new SC_Product_Ex();
        $product_id = $this->lfCheckProductId($this->objFormParam->getValue('product_id'), $objProduct);
        $this->tpl_product_id = $product_id;
        // プロダクトIDの正当性チェック
        $this->lfCheckMyProductId($objCustomer->getValue('customer_id'), $product_id);

        $this->arrChainProductStatus = $this->getChainProductStatus($this->objFormParam->getValue('product_id'));

        // 商品詳細を取得
        $objProduct = new SC_Product_Ex();
        $this->arrProduct = $objProduct->getDetail($this->objFormParam->getValue('product_id'));

        // ログイン判定
        if ($this->tpl_login = $objCustomer->isLoginSuccess() === true) {
            $this->nickname = $objCustomer->getValue('customer_id');
            if ($this->arrProduct['customer_id'] == $customer_id) {
                $this->tpl_my_product = true;
            }
        }
    }

    /**
     * プロダクトIDの正当性チェック
     *
     * @param string $admin_mode
     * @param int $product_id
     * @param SC_Product $objProduct
     * @return integer
     */
    public function lfCheckProductId($product_id, SC_Product $objProduct)
    {
        if (!$objProduct->isValidProductId($product_id, true)) {
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
        $objFormParam->addParam('会員ID', 'customer_id', INT_LEN, 'n', array('EXIST_CHECK', 'ZERO_CHECK', 'NUM_CHECK', 'MAX_LENGTH_CHECK'));
        $objFormParam->addParam('商品ID', 'product_id', INT_LEN, 'n', array('EXIST_CHECK', 'ZERO_CHECK', 'NUM_CHECK', 'MAX_LENGTH_CHECK'));
        $objFormParam->addParam('お気に入り商品ID', 'favorite_product_id', INT_LEN, 'n', array('ZERO_CHECK', 'NUM_CHECK', 'MAX_LENGTH_CHECK'));
        $objFormParam->addParam('交換対象商品', 'target_id', INT_LEN, 'n', array('ZERO_CHECK', 'NUM_CHECK', 'MAX_LENGTH_CHECK'));
        $objFormParam->addParam('チェーンID', 'chain_id', STEXT_LEN, 'n', array('MAX_LENGTH_CHECK'));

        // 値の取得
        $objFormParam->setParam($_REQUEST);
        // 入力値の変換
        $objFormParam->convParam();
        // 入力情報を渡す
        return $objFormParam->getFormParamList();
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
        $arrProductId = array();
        $arrListingProducts = SC_Product_Ex::getListingProducts($customer_id);
        foreach ($arrListingProducts as $arrListingProduct) {
            $arrProductId[] = $arrListingProduct['product_id'];
        }

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

    private function lfCheckMyProductId($customer_id, $product_id)
    {
        // 出品中アイテム商品ID取得
        $arrProductId = array();
        $arrListingProducts = SC_Product_Ex::getListingProducts($customer_id, true);
        foreach ($arrListingProducts as $arrListingProduct) {
            $arrProductId[] = $arrListingProduct['product_id'];
        }
        if (array_search($product_id, $arrProductId) === false){
            throw new Exception('出品者のみアクセスできるページとなります。');
        }
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

    /**
     * @param $customer_id
     * @return array
     * @throws Exception
     */
    private function getChainProductStatus($product_id)
    {
        $objHelperApi = new SC_Helper_Api_Ex();
        $objHelperApi->setMethod('GET');

        $index = 0;
        $objHelperApi->setUrl(API_URL . 'chain/find?' . 'id=' . $product_id);
        $result = json_decode($objHelperApi->exec(), true);

        $arrChainProductStatus = array();
        $arrTargetId = array();
        $arrSourceId = array();

        $objProduct = new SC_Product_Ex();

        if (count($result) > 0) {
            $chainId = $result[0]['id'];
            $objHelperApi->setUrl(API_URL . 'chain/' . $result[0]['id']);
            $result = json_decode($objHelperApi->exec(), true);
            foreach ($result['selection_edge_list'] as $selection_edge_list) {
                $arrTargetId[] = $selection_edge_list['target_id'];
                $arrSourceId[] = $selection_edge_list['source_id'];
            }
            // source_id、target_idに出品商品が含まれているか確認する
            // https://bluestyle.backlog.jp/view/CHAIN-182#comment-123642696
            if (count(array_unique($arrTargetId)) == 1 and array_search($product_id, $arrTargetId) !== false) {
                foreach ($arrSourceId as $sourceID) {
                    $arrChainProductStatus['selection_edge_detail'][] = $objProduct->getDetail($sourceID);
                }
                $arrChainProductStatus['selection_edge_mode'] = 'target';
            }
            if (count(array_unique($arrSourceId)) == 1 and array_search($product_id, $arrSourceId) !== false) {
                foreach ($arrTargetId as $targetId) {
                    $arrChainProductStatus['selection_edge_detail'][] = $objProduct->getDetail($targetId);
                }
                $arrChainProductStatus['selection_edge_mode'] = 'source';
            }
            $arrChainProductStatus['chain_id'] = $chainId;
            $arrChainProductStatus['progress_percent'] = $result['progress_percent'];
        }
        return $arrChainProductStatus;
    }
}
