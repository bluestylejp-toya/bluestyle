<?php
require_once CLASS_EX_REALDIR . 'page_extends/mypage/LC_Page_AbstractMypage_Ex.php';

/**
 * プロフィール編集 のページクラス.
 *
 * @package Page
 */
class LC_Page_Mypage_Profile extends LC_Page_AbstractMypage_Ex
{
    /**
     * Page を初期化する.
     *
     * @return void
     */
    public function init()
    {
        parent::init();
        $this->tpl_subtitle = 'プロフィール編集(入力ページ)';
        $this->tpl_mypageno = 'profile';

        $masterData         = new SC_DB_MasterData_Ex();
        $this->arrPref      = $masterData->getMasterData('mtb_pref');
        $this->httpCacheControl('nocache');
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
     * Page のプロセス
     * @return void
     */
    public function action()
    {
        $objCustomer = new SC_Customer_Ex();
        $customer_id = $objCustomer->getValue('customer_id');

        // mobile用（戻るボタンでの遷移かどうかを判定）
        if (!empty($_POST['return'])) {
            $_REQUEST['mode'] = 'return';
        }

        // パラメーター管理クラス,パラメーター情報の初期化
        $objFormParam = new SC_FormParam_Ex();
        SC_Helper_Customer_Ex::sfCustomerProfileParam($objFormParam);
        $objFormParam->setParam($_POST);    // POST値の取得

        switch ($this->getMode()) {
            // 確認
            case 'confirm':
                $this->arrErr = $this->checkError($objFormParam);

                // 入力エラーなし
                if (empty($this->arrErr)) {
                    //パスワード表示
                    $this->passlen      = SC_Utils_Ex::sfPassLen(strlen($objFormParam->getValue('password')));

                    $this->tpl_mainpage = 'mypage/profile_confirm.tpl';
                    $this->tpl_subtitle = 'プロフィール編集(確認ページ)';
                }
                break;
            // 会員登録と完了画面
            case 'complete':
                $this->arrErr = $this->checkError($objFormParam);

                // 入力エラーなし
                if (empty($this->arrErr)) {
                    // 会員情報の登録
                    $this->lfRegistCustomerData($objFormParam, $customer_id);

                    //セッション情報を最新の状態に更新する
                    $objCustomer->updateSession();

                    // 入力ページに戻す (PRG)
                    SC_Response_Ex::reload(['completeed' => 1], true);
                }
                break;
            // 確認ページからの戻り
            case 'return':
                // quiet.
                break;
            default:
                $objFormParam->setParam(SC_Helper_Customer_Ex::sfGetCustomerData($customer_id));
                break;
        }
        $this->arrForm = $objFormParam->getFormParamList();
        $this->arrMyProducts = $this->getMyProducts($customer_id);

        $this->tpl_pref_id = $objCustomer->getValue('pref');
    }

    /**
     *  会員情報を登録する
     *
     * @param SC_FormParam $objFormParam
     * @param mixed $customer_id
     * @return void
     */
    public function lfRegistCustomerData(&$objFormParam, $customer_id)
    {
        $sqlval             = $objFormParam->getDbArray();

        SC_Helper_Customer_Ex::sfEditCustomerData($sqlval, $customer_id);
    }

    /**
     * エラーチェック
     *
     * @param SC_FormParam $objFormParam SC_FormParam インスタンス
     * @return SC_CheckError_Ex エラー情報の配列
     */
    public function checkError(&$objFormParam)
    {
        $objFormParam->convParam();
        $arrParams = $objFormParam->getHashArray();

        // 入力データを渡す。
        $objErr = new SC_CheckError_Ex($arrParams);
        $arrErr = $objFormParam->checkError();

        return $arrErr;
    }

    /**
     * 指定された会員の商品を取得する
     *
     * @return array
     */
    public function getMyProducts($customer_id)
    {
        $objQuery = SC_Query_Ex::getSingletonInstance();
        $objProduct = new SC_Product_Ex();

        // [仕様] 非公開商品も表示する。
        $objQuery->setWhere('alldtl.customer_id = ?', [$customer_id]);
        $objQuery->andWhere('alldtl.del_flg = 0');
        $objQuery->setOrder('alldtl.product_id DESC');
        $objQuery->setLimit(10);

        $addCols = ['count_of_favorite'];
        for ($cnt = 1; $cnt <= PRODUCTSUB_MAX; $cnt++) {
            $addCols[] = 'sub_large_image' . $cnt;
        }
        $arrProducts = $objProduct->lists($objQuery, [], $addCols);

        return $arrProducts;
    }
}
