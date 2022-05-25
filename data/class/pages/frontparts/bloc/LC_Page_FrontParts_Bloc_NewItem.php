<?php
require_once CLASS_EX_REALDIR . 'page_extends/frontparts/bloc/LC_Page_FrontParts_Bloc_Ex.php';

/**
 * @package Page
 */
class LC_Page_FrontParts_Bloc_NewItem extends LC_Page_FrontParts_Bloc_Ex
{
    /**
     * Page を初期化する.
     *
     * @return void
     */
    public function init()
    {
        parent::init();

        $masterData = new SC_DB_MasterData_Ex();
        $this->arrPref = $masterData->getMasterData('mtb_pref');
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
        $this->objCustomer = new SC_Customer_Ex();

        $this->tpl_login = $this->objCustomer->isLoginSuccess(true);
        $this->arrNewItems = $this->getNewItems();
    }

    /**
     * おすすめ商品検索.
     *
     * @return array $arrBestProducts 検索結果配列
     */
    public function getNewItems()
    {
        $objQuery = SC_Query_Ex::getSingletonInstance();
        $objProduct = new SC_Product_Ex();

//        $objQuery->setWhere('alldtl.create_date >= DATE_ADD(CURRENT_TIMESTAMP, interval -14 day)');
        $objQuery->setWhere('alldtl.del_flg = 0');
        $objQuery->andWhere('alldtl.status = 1');
        $objQuery->setOrder('alldtl.product_id DESC');
        $objQuery->setLimit(15);

        $addCols = ['count_of_favorite'];
        if ($this->tpl_login) {
            $customer_id = $this->objCustomer->getValue('customer_id');
            $addCols[] = "(CASE WHEN EXISTS (SELECT * FROM dtb_customer_favorite_products WHERE product_id = alldtl.product_id AND dtb_customer_favorite_products.customer_id = " . $objQuery->conn->escape($customer_id) . ") THEN 1 ELSE 0 END) AS registered_favorite";
        }
        $arrProducts = $objProduct->lists($objQuery, [], $addCols);

        SC_Product_Ex::setPriceTaxTo($arrProducts);

        return $arrProducts;
    }
}
