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
        $customer_id = $_REQUEST['customer_id'];
        $this->arrCustomer = SC_Helper_Customer_Ex::sfGetCustomerData($customer_id);
        $this->arrCustomerProducts = $this->getCustomerProducts($customer_id);
        $this->arrFavoriteProducts = $this->getFavoriteProducts($customer_id);
    }

    /**
     * 指定された会員の商品を取得する
     *
     * @return array
     */
    public function getCustomerProducts($customer_id)
    {
        $objQuery = SC_Query_Ex::getSingletonInstance();
        $objProduct = new SC_Product_Ex();

        $objQuery->setWhere('alldtl.customer_id = ?', [$customer_id]);
        $objQuery->andWhere('alldtl.del_flg = 0');
        $objQuery->andWhere('alldtl.status = 1');
        $objQuery->setOrder('alldtl.product_id DESC');
        $objQuery->setLimit(10);

        $addCols = ['count_of_favorite'];
        $arrProducts = $objProduct->lists($objQuery, [], $addCols);

        return $arrProducts;
    }

    /**
     * 指定された会員のお気に入り商品を取得する
     *
     * @return array
     */
    public function getFavoriteProducts($customer_id)
    {
        $objQuery = SC_Query_Ex::getSingletonInstance();
        $objProduct = new SC_Product_Ex();

        $objQuery->setWhere('EXISTS(SELECT * FROM dtb_customer_favorite_products WHERE customer_id = ? AND product_id = alldtl.product_id)', [$customer_id]);
        $objQuery->andWhere('alldtl.del_flg = 0');
        $objQuery->andWhere('alldtl.status = 1');
        $objQuery->setOrder('alldtl.product_id DESC');
        $objQuery->setLimit(10);

        $addCols = ['count_of_favorite'];
        $arrProducts = $objProduct->lists($objQuery, [], $addCols);

        return $arrProducts;
    }
}
