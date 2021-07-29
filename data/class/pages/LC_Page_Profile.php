<?php
require_once CLASS_EX_REALDIR . 'page_extends/LC_Page_Ex.php';

/**
 * @package Page
 */
class LC_Page_Profile extends LC_Page_Ex
{
    /**
     * Page を初期化する.
     *
     * @return void
     */
    public function init()
    {
        parent::init();
    }

    /**
     * Page のプロセス.
     *
     * @return void
     */
    public function process()
    {
        parent::process();
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
        $customer_id = 2;
        $this->arrCustomer = SC_Helper_Customer_Ex::sfGetCustomerData($customer_id);
    }

    /**
     * お気に入りを取得する
     *
     * LC_Page_Mypage_Favorite::lfGetFavoriteProduct() を元に実装
     * @param mixed $customer_id
     * @param LC_Page_Mypage_Favorite $objPage
     * @access private
     * @return array お気に入り商品一覧
     */
    public function lfGetFavoriteProduct($customer_id, &$objPage)
    {
        $objQuery       = SC_Query_Ex::getSingletonInstance();
        $objProduct     = new SC_Product_Ex();

        $objQuery->setOrder('f.create_date DESC');
        $where = 'f.customer_id = ? and p.status = 1';
        if (NOSTOCK_HIDDEN) {
            $where .= ' AND EXISTS(SELECT * FROM dtb_products_class WHERE product_id = f.product_id AND del_flg = 0 AND (stock >= 1 OR stock_unlimited = 1))';
        }
        $arrProductId  = $objQuery->getCol('f.product_id', 'dtb_customer_favorite_products f inner join dtb_products p using (product_id)', $where, array($customer_id));

        $objQuery       = SC_Query_Ex::getSingletonInstance();
        $objQuery->setWhere($this->lfMakeWhere('alldtl.', $arrProductId));
        $linemax        = $objProduct->findProductCount($objQuery);

        $objPage->tpl_linemax = $linemax;   // 何件が該当しました。表示用

        // ページ送りの取得
        $objNavi        = new SC_PageNavi_Ex($objPage->tpl_pageno, $linemax, SEARCH_PMAX, 'eccube.movePage', NAVI_PMAX);
        $this->tpl_strnavi = $objNavi->strnavi; // 表示文字列
        $startno        = $objNavi->start_row;

        $objQuery       = SC_Query_Ex::getSingletonInstance();
        //$objQuery->setLimitOffset(SEARCH_PMAX, $startno);
        // 取得範囲の指定(開始行番号、行数のセット)
        $arrProductId  = array_slice($arrProductId, $startno, SEARCH_PMAX);

        $where = $this->lfMakeWhere('', $arrProductId);
        $where .= ' AND del_flg = 0';
        $objQuery->setWhere($where, $arrProductId);
        $arrProducts = $objProduct->lists($objQuery);

        //取得している並び順で並び替え
        $arrProducts2 = array();
        foreach ($arrProducts as $item) {
            $arrProducts2[$item['product_id']] = $item;
        }
        $arrProductsList = array();
        foreach ($arrProductId as $product_id) {
            $arrProductsList[] = $arrProducts2[$product_id];
        }

        // 税込金額を設定する
        SC_Product_Ex::setIncTaxToProducts($arrProductsList);

        return $arrProductsList;
    }
}
