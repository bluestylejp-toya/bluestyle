<?php
require_once CLASS_EX_REALDIR . 'page_extends/LC_Page_Ex.php';

/**
 * @package Page
 */
class LC_Page_Profile extends LC_Page_Ex
{
    /** 編集可能か */
    public $tpl_editable = false;

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
        $objCustomer = new SC_Customer_Ex();

        $customer_id = $_REQUEST['customer_id'];
        $this->arrCustomer = SC_Helper_Customer_Ex::sfGetCustomerData($customer_id);

        if ($objCustomer->isLoginSuccess(true)
            && $objCustomer->getValue('customer_id') == $customer_id
        ) {
            $this->tpl_editable = true;
        }
    }
}
