<?php
/*
 * This file is part of EC-CUBE
 *
 * Copyright(c) EC-CUBE CO.,LTD. All Rights Reserved.
 *
 * http://www.ec-cube.co.jp/
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
 */

require_once CLASS_EX_REALDIR . 'page_extends/LC_Page_Ex.php';

/**
 * パスワード発行 のページクラス.
 *
 * @package Page
 * @author EC-CUBE CO.,LTD.
 * @version $Id$
 */
class LC_Page_Forgot extends LC_Page_Ex
{
    /** エラーメッセージ */
    public $errmsg;

    /**
     * Page を初期化する.
     *
     * @return void
     */
    public function init()
    {
        $this->skip_load_page_layout = true;
        parent::init();
        $this->tpl_title = 'パスワードを忘れた方';
        $this->tpl_mainpage = 'forgot/index.tpl';
        $this->tpl_mainno = '';
        $this->device_type = SC_Display_Ex::detectDevice();
        $this->httpCacheControl('nocache');
        // デフォルトログインアドレスロード
        $objCookie = new SC_Cookie_Ex();
        $this->tpl_login_email = $objCookie->getCookie('login_email');
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
        // パラメーター管理クラス
        $objFormParam = new SC_FormParam_Ex();

        switch ($this->getMode()) {
            case 'mail_check':
                $this->lfInitMailCheckParam($objFormParam, $this->device_type);
                $objFormParam->setParam($_POST);
                $objFormParam->convParam();
                $objFormParam->toLower('email');
                $this->arrForm = $objFormParam->getHashArray();
                $this->arrErr = $objFormParam->checkError();
                if (SC_Utils_Ex::isBlank($this->arrErr)) {
                    try {
                        // 参照渡し用にリセット
                        $arrCustomer = null;
                        $this->errmsg = $this->lfCheckForgotMail($this->arrForm, $arrCustomer);
                        if (!SC_Utils_Ex::isBlank($this->errmsg)) {
                            // 入力エラー
                            break 1;
                        }

                        // パスワードリセットコードを更新する。
                        $password_reset_code = SC_Helper_Customer_Ex::updatePasswordResetCode($arrCustomer['customer_id']);

                        // メールで通知をする
                        $this->lfSendMail($arrCustomer['email'], $arrCustomer['name01'], $password_reset_code);
                    }
                    catch (NoMatchException $e) {
                        // [仕様] 表面上は有効なメールアドレスと同様とし、実際には何もしない
                        GC_Utils_Ex::gfPrintLog("無効なメールアドレスが入力された。: {$this->arrForm['email']}");
                    }

                    // 完了ページへ移動する
                    $this->tpl_mainpage = 'forgot/complete.tpl';
                    // transactionidを更新させたいので呼び出し元(ログインフォーム側)をリロード。
                    $this->tpl_onload .= 'opener.location.reload(true);';
                }
                break;
            default:
                break;
        }

        // ポップアップ用テンプレート設定
        if ($this->device_type == DEVICE_TYPE_PC) {
            $this->setTemplate($this->tpl_mainpage);
        }

    }

    /**
     * メールアドレス・名前確認
     *
     * @param  array  $arrForm     フォーム入力値
     * @return string エラー文字列 問題が無ければNULL
     */
    public function lfCheckForgotMail($arrForm, &$arrCustomer)
    {
        $errmsg = NULL;
        $objQuery = SC_Query_Ex::getSingletonInstance();
        $where = '(email = ? OR email_mobile = ?) AND del_flg = 0';
        $arrVal = array($arrForm['email'], $arrForm['email']);
        $arrCustomer = $objQuery->getRow('*', 'dtb_customer', $where, $arrVal);
        if (empty($arrCustomer)) {
            throw new NoMatchException;
        }

        // 会員状態の確認
        // 正会員
        if ($arrCustomer['status'] == '2') {
            // nop
        }
        // 仮会員
        elseif ($arrCustomer['status'] == '1') {
            $errmsg = 'ご入力のemailアドレスは現在仮登録中です。<br/>登録の際にお送りしたメールのURLにアクセスし、<br/>本会員登録をお願いします。';
        }
        else {
            throw new Exception;
        }

        return $errmsg;
    }

    /**
     * メールアドレス確認におけるパラメーター情報の初期化
     *
     * @param  SC_FormParam_Ex $objFormParam フォームパラメータークラス
     * @param  array $device_type  デバイスタイプ
     * @return void
     */
    public function lfInitMailCheckParam(&$objFormParam, $device_type)
    {
        if ($device_type === DEVICE_TYPE_MOBILE) {
            $objFormParam->addParam('メールアドレス', 'email', null, 'a', array('EXIST_CHECK', 'EMAIL_CHECK', 'NO_SPTAB', 'EMAIL_CHAR_CHECK', 'MOBILE_EMAIL_CHECK'));
        } else {
            $objFormParam->addParam('メールアドレス', 'email', null, 'a', array('NO_SPTAB', 'EXIST_CHECK', 'EMAIL_CHECK', 'SPTAB_CHECK', 'EMAIL_CHAR_CHECK'));
        }

        return;
    }

    /**
     * パスワード変更お知らせメールを送信する.
     *
     * @param  string $email         送信先メールアドレス
     * @param  string $customer_name 送信先氏名
     * @return void
     *
     * FIXME: メールテンプレート編集の方に足すのが望ましい
     */
    public function lfSendMail($email, $customer_name, $password_reset_code)
    {
        // パスワード変更お知らせメール送信
        $objMailText = new SC_SiteView_Ex(false);
        $objMailText->assign('tpl_password_reset_code', $password_reset_code);
        $toCustomerMail = $objMailText->fetch('mail_templates/forgot_mail.tpl');

        $objHelperMail = new SC_Helper_Mail_Ex();

        // メール送信オブジェクトによる送信処理
        $objMail = new SC_SendMail_Ex();
        $objMail->setItem(
            '', //宛先
            $objHelperMail->sfMakeSubject('パスワードのリセット'),
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
}
