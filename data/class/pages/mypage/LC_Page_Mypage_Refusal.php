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

require_once CLASS_EX_REALDIR . 'page_extends/mypage/LC_Page_AbstractMypage_Ex.php';

/**
 * 退会手続き のページクラス.
 *
 * @package Page
 * @author EC-CUBE CO.,LTD.
 * @version $Id$
 */
class LC_Page_Mypage_Refusal extends LC_Page_AbstractMypage_Ex
{
    /**
     * Page を初期化する.
     *
     * @return void
     */
    public function init()
    {
        parent::init();
        $this->tpl_subtitle = '退会手続き(入力ページ)';
        $this->tpl_mypageno = 'refusal';
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
        $this->tpl_mainpage = 'mypage/refusal_confirm.tpl';
        $this->tpl_subtitle = '退会手続き(確認ページ)';

        // トークンを設定
        $this->refusal_transactionid = $this->getRefusalToken();

        switch ($this->getMode()) {
            case 'entry':
                break;

            case 'confirm':
                // パラメーター管理クラス,パラメーター情報の初期化
                $objFormParam = new SC_FormParam_Ex();
                $this->lfInitParam($objFormParam);
                $objFormParam->setParam($_POST);

                // エラーメッセージ表示
                $arrErr = $objFormParam->checkError();
                if (!SC_Utils_Ex::isBlank($arrErr)) {
                    $this->arrErr = $arrErr;
                    break;
                } else {
                    $this->refusal_reason = $objFormParam->getValue('refusal_reason');
                }

            case 'complete':
                // トークン入力チェック
                if (!$this->isValidRefusalToken()) {
                    // エラー画面へ遷移する
                    SC_Utils_Ex::sfDispSiteError(PAGE_ERROR, '', true);
                    SC_Response_Ex::actionExit();
                }

                $objCustomer = new SC_Customer_Ex();
                SC_Helper_Customer_Ex::sfEditCustomerData(array('refusal_reason' => $this->refusal_reason), $objCustomer->getValue('customer_id'));
                // XXXX: 仮会員は物理削除となっていたが論理削除に変更。
                $this->lfSendRefusalMail($objCustomer->getValue('customer_id'));
                $this->lfDeleteCustomer($objCustomer->getValue('customer_id'));
                $objCustomer->EndSession();

                SC_Response_Ex::sendRedirect('refusal_complete.php');
                break;

            default:
                if (SC_Display_Ex::detectDevice() == DEVICE_TYPE_MOBILE) {
                    $this->refusal_transactionid = $this->getRefusalToken();
                }
                break;
        }

    }

    /**
     * トランザクショントークンを取得する
     *
     * @return string
     */
    function getRefusalToken()
    {
        if (empty($_SESSION['refusal_transactionid'])) {
            $_SESSION['refusal_transactionid'] = SC_Helper_Session_Ex::createToken();
        }
        return $_SESSION['refusal_transactionid'];
    }

    /**
     * トランザクショントークンのチェックを行う
     */
    function isValidRefusalToken()
    {
        if (empty($_POST['refusal_transactionid'])) {
            $ret = false;
        } else {
            $ret = $_POST['refusal_transactionid'] === $_SESSION['refusal_transactionid'];
        }

        return $ret;
    }

    /**
     * トランザクショントークを破棄する
     */
    function destroyRefusalToken()
    {
        unset($_SESSION['refusal_transactionid']);
    }

    /**
     * 会員情報を削除する
     *
     * @access private
     * @return boolean
     */
    public function lfDeleteCustomer($customer_id)
    {
        return SC_Helper_Customer_Ex::delete($customer_id);
    }

    /**
     * 退会手続き完了メール送信する
     *
     * @access private
     * @param integer $customer_id 会員ID
     * @return void
     */
    public function lfSendRefusalMail($customer_id)
    {
        // 会員データの取得
        if (SC_Utils_Ex::sfIsInt($customer_id)) {
            $arrCustomerData = SC_Helper_Customer_Ex::sfGetCustomerDataFromId($customer_id);
        }
        if (SC_Utils_Ex::isBlank($arrCustomerData)) {
            return false;
        }

        $CONF = SC_Helper_DB_Ex::sfGetBasisData();

        $objMailText = new SC_SiteView_Ex();
        $objMailText->setPage($this);
        $objMailText->assign('CONF', $CONF);
        $objMailText->assign('name01', $arrCustomerData['name01']);
        $objMailText->assign('name02', $arrCustomerData['name02']);
        $objMailText->assign('nickname', $arrCustomerData['nickname']);
        $objMailText->assignobj($this);

        $objHelperMail = new SC_Helper_Mail_Ex();
        $objHelperMail->setPage($this);

        $subject = $objHelperMail->sfMakeSubject('退会手続きのご完了', $objMailText);
        $toCustomerMail = $objMailText->fetch('mail_templates/customer_refusal_mail.tpl');

        $objMail = new SC_SendMail_Ex();
        $objMail->setItem(
            '',                     // 宛先
            $subject,               // サブジェクト
            $toCustomerMail,        // 本文
            $CONF['email03'],       // 配送元アドレス
            $CONF['shop_name'],     // 配送元 名前
            $CONF['email03'],       // reply_to
            $CONF['email04'],       // return_path
            $CONF['email04'],       // Errors_to
            $CONF['email01']        // Bcc
        );
        $objMail->setTo($arrCustomerData['email'], $arrCustomerData['nickname'] . ' 様');

        $objMail->sendMail();
    }

    /*
    * フォームパラメータの初期化
    *
    * @param SC_FormParam_Ex $objFormParam
    * @return SC_FormParam
    */
    public function lfInitParam(&$objFormParam)
    {
        $objFormParam->addParam('退会理由', 'refusal_reason', MLTEXT_LEN, '', array('EXIST_CHECK', 'MAX_LENGTH_CHECK'));
    }

}
