<?php
require_once CLASS_EX_REALDIR . 'page_extends/LC_Page_Ex.php';

/**
 * パスワードの再設定 のページクラス.
 *
 * @package Page
 */
class LC_Page_Forgot_Reset extends LC_Page_Ex
{
    /**
     * Page を初期化する.
     * @return void
     */
    public function init()
    {
        parent::init();
        $this->httpCacheControl('nocache');

        // POST に限定する mode
        $this->arrLimitPostMode[] = 'register';
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
     * Page のプロセス
     * @return void
     */
    public function action()
    {
        $objFormParam = new SC_FormParam_Ex();

        $objFormParam->addParam('パスワード', 'password', PASSWORD_MAX_LEN, '', ['EXIST_CHECK', 'SPTAB_CHECK', 'PASSWORD_CHAR_CHECK']);
        $objFormParam->setParam($_REQUEST);

        switch ($this->getMode()) {
            case 'register':
                $this->tpl_title .= ' (入力ページ)';
                $arrCustomer = $this->checkAndGetCustomer($_GET['code']);

                // 登録と完了画面
                $this->arrErr = $this->checkError($objFormParam);
                if (empty($this->arrErr)) {
                    $arrData = [
                        'password' => $objFormParam->getValue('password'),
                        'password_reset_code' => null,
                    ];
                    SC_Helper_Customer_Ex::sfEditCustomerData($arrData, $arrCustomer['customer_id']);

                    if (FORGOT_MAIL == 1) {
                        $this->lfSendMail($arrCustomer['email'], $arrCustomer['name01']);
                    }

                    SC_Response_Ex::reload(['mode' => 'complete'], true);
                    SC_Response_Ex::actionExit();
                }
                break;

            case 'complete':
                $this->tpl_title .= ' (完了ページ)';
                $this->tpl_mainpage = 'forgot/reset_complete.tpl';
                break;

            default:
                $this->tpl_title .= ' (入力ページ)';
                $this->checkAndGetCustomer($_GET['code']);
                break;
        }
        $this->arrForm = $objFormParam->getFormParamList();
    }

    /**
     * 入力エラーチェック
     *
     * @param SC_FormParam $objFormParam SC_FormParam インスタンス
     * @return array エラー情報の配列
     */
    public function checkError(&$objFormParam)
    {
        $objFormParam->convParam();
        $arrParams = $objFormParam->getHashArray();

        // 入力データを渡す。
        $objErr = new SC_CheckError_Ex($arrParams);
        $objErr->arrErr = $objFormParam->checkError();

        $objErr->doFunc(array('パスワード', 'password', PASSWORD_MIN_LEN, PASSWORD_MAX_LEN), array('NUM_RANGE_CHECK'));

        return $objErr->arrErr;
    }

    /**
     * パスワード変更お知らせメールを送信する.
     *
     * @param  string $email         送信先メールアドレス
     * @param  string $customer_name 送信先氏名
     * @return void
     */
    public function lfSendMail($email, $customer_name)
    {
        // パスワード変更お知らせメール送信
        $objMailText = new SC_SiteView_Ex(false);
        $objMailText->assign('customer_name', $customer_name);
        $toCustomerMail = $objMailText->fetch('mail_templates/forgot_reset_mail.tpl');

        $objHelperMail = new SC_Helper_Mail_Ex();

        // メール送信オブジェクトによる送信処理
        $objMail = new SC_SendMail_Ex();
        $objMail->setItem(
            '', //宛先
            $objHelperMail->sfMakeSubject('パスワードを変更いたしました。'),
            $toCustomerMail, //本文
            $this->arrSiteInfo['email03'], //配送元アドレス
            $this->arrSiteInfo['shop_name'], // 配送元名
            $this->arrSiteInfo['email03'], // reply to
            $this->arrSiteInfo['email04'], //return_path
            $this->arrSiteInfo['email04'] // errors_to
        );
        $objMail->setTo($email, $customer_name . ' 様');
        $objMail->sendMail();
    }

    function checkAndGetCustomer($password_reset_code)
    {
        $arrCustomer = SC_Helper_Customer_Ex::sfGetCustomerDataFromId('', 'password_reset_code = ?', [$password_reset_code]);
        if (empty($arrCustomer)) {
            $msg = '指定された code「' . htmlspecialchars($password_reset_code) . '」は無効です。';
            SC_Utils_Ex::sfDispSiteError(FREE_ERROR_MSG, '', true, $msg);
        }

        return $arrCustomer;
    }
}
