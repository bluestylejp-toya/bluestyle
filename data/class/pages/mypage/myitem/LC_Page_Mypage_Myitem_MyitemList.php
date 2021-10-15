<?php
require_once CLASS_EX_REALDIR . 'page_extends/mypage/LC_Page_AbstractMypage_Ex.php';

/**
 * 出品中アイテム一覧 のページクラス.
 *
 * @package Page
 */
class LC_Page_Mypage_Myitem_MyitemList extends LC_Page_AbstractMypage_Ex
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
        $this->tpl_subtitle = '出品中アイテム一覧';
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

        // ページ送り用
        if (isset($_POST['pageno'])) {
            $this->tpl_pageno = intval($_POST['pageno']);
        }
        $this->arrProducts = $this->getChainProductStatus($customer_id, $this);

    }

    /**
     * @param $customer_id
     * @return array
     * @throws Exception
     */
    private function getChainProductStatus($customer_id)
    {
        $objHelperApi = new SC_Helper_Api_Ex();
        $objHelperApi->setMethod('GET');

        $arrChainProductStatus = array();
        $arrProducts = $this->getProducts($customer_id, $this);
        $objProduct = new SC_Product_Ex();

        $index = 0;
        foreach ($arrProducts as $key => $arrProduct) {
            $objHelperApi->setUrl(API_URL . 'chain/find?' . 'id=' . $arrProduct['product_id']);
            $result = json_decode($objHelperApi->exec(), true);
            if (count($result) > 0) {
                $chainId = $result[0]['id'];
                $objHelperApi->setUrl(API_URL . 'chain/' . $result[0]['id']);
                $result = json_decode($objHelperApi->exec(), true);
                $arrTargetId = array();
                $arrSourceId = array();
                foreach ($result['selection_edge_list'] as $selection_edge_list) {
                    $arrTargetId[] = $selection_edge_list['target_id'];
                    $arrSourceId[] = $selection_edge_list['source_id'];
                }
                // source_id、target_idに出品商品が含まれているか確認する
                // https://bluestyle.backlog.jp/view/CHAIN-182#comment-123642696
                if (count(array_unique($arrTargetId)) == 1 and array_search($arrProduct['product_id'], $arrTargetId) !== false) {
                    foreach ($arrSourceId as $sourceID) {
                        $arrChainProductStatus[$key]['selection_edge_detail'][] = $objProduct->getDetail($sourceID);
                    }
                    $arrChainProductStatus[$key]['selection_edge_mode'] = 'target';
                }
                if (count(array_unique($arrSourceId)) == 1 and array_search($arrProduct['product_id'], $arrSourceId) !== false) {
                    foreach ($arrTargetId as $targetId) {
                        $arrChainProductStatus[$key]['selection_edge_detail'][] = $objProduct->getDetail($targetId);
                    }
                    $arrChainProductStatus[$key]['selection_edge_mode'] = 'source';
                }
                $arrChainProductStatus[$key]['chain_id'] = $chainId;
                $arrChainProductStatus[$key]['progress_percent'] = $result['progress_percent'];
            }
            $arrChainProductStatus[$key]['product'] = $arrProduct;
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
