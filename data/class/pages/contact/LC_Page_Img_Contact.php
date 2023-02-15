<?php
/*
 * This file is part of EC-CUBE
 *
 * Copyright(c) 2000-2013 LOCKON CO.,LTD. All Rights Reserved.
 *
 * http://www.lockon.co.jp/
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
 * お問い合わせ のページクラス.
 *
 * @package Page
 * @author LOCKON CO.,LTD.
 * @version $Id: LC_Page_Contact.php 23124 2013-08-24 14:33:52Z kimoto $
 */
class LC_Page_Img_Contact extends LC_Page_Ex
{
    /**
     * Page を初期化する.
     *
     * @return void
     */
    public function init()
    {
        parent::init();
        if (SC_Display_Ex::detectDevice() == DEVICE_TYPE_MOBILE) {
            $this->tpl_title = 'Amazon報告';
        } else {
            $this->tpl_title = 'Amazon報告(入力ページ)';
        }
        $this->httpCacheControl('nocache');

        $masterData = new SC_DB_MasterData_Ex();
        $this->arrPref = $masterData->getMasterData('mtb_pref');

        if (SC_Display_Ex::detectDevice() == DEVICE_TYPE_MOBILE) {
            // @deprecated EC-CUBE 2.11 テンプレート互換用
            $this->CONF = SC_Helper_DB_Ex::sfGetBasisData();
        }
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
    function action()
    {
        $objFormParam = new SC_FormParam_Ex();

        $this->arrData = isset($_SESSION['customer']) ? $_SESSION['customer'] : [];

        // アップロードファイル情報の初期化
        $objUpFile = new SC_UploadFile_Ex(IMAGE_TEMP_REALDIR, IMAGE_SAVE_REALDIR);
        $this->lfInitFile($objUpFile);
        $objUpFile->setHiddenFileList($_POST);

        $mode = $this->getMode();
        switch ($mode) {
            case 'confirm':
                // エラーチェック
                $this->lfInitParam($objFormParam);
                $objFormParam->setParam($_POST);
                $objFormParam->convParam();
                $objFormParam->toLower('email');
                $this->arrErr = $this->lfCheckError($objFormParam);
                // 入力値の取得
                $this->arrForm = $objFormParam->getFormParamList();

                if (SC_Utils_Ex::isBlank($this->arrErr)) {
                    // エラー無しで完了画面
                    $this->tpl_mainpage = 'contact/img_contact_confirm.tpl';
                    $this->tpl_title = 'Amazon報告(確認ページ)';
                }

                break;

            // 画像のアップロード
            case 'upload_image':
            case 'delete_image':
                // パラメーター初期化
                $this->lfInitParam($objFormParam);
                $objFormParam->setParam($_POST);
                $this->arrErr = $objFormParam->checkError();
                $this->arrForm = $objFormParam->getFormParamList();

                switch ($mode) {
                    case 'upload_image':
                        // ファイルを一時ディレクトリにアップロード
                        $this->arrErr[$this->arrForm['image_key']['value']] = $objUpFile->makeTempFile($this->arrForm['image_key']['value'], IMAGE_RENAME);
                        if ($this->arrErr[$this->arrForm['image_key']['value']] == '') {
                            $img_temp_fullname = $objUpFile->temp_dir.'/'.$objUpFile->temp_file;
                        }
                        break;
                    case 'delete_image':
                        // ファイル削除
                        $this->lfDeleteTempFile($objUpFile, $this->arrForm['image_key']['value']);
                        break;
                    default:
                        break;
                }

                // 入力画面表示設定
                // アップロードファイル情報取得(Hidden用)
                $this->arrHidden = $objUpFile->getHiddenFileList();
                // 画像ファイル表示用データ取得
                $this->arrFile = $objUpFile->getFormFileList(IMAGE_TEMP_URLPATH, IMAGE_SAVE_URLPATH);

                break;

            case 'return':
                $this->lfInitParam($objFormParam);
                $objFormParam->setParam($_POST);
                $this->arrForm = $objFormParam->getFormParamList();

                break;

            case 'complete':
                $this->lfInitParam($objFormParam);
                $objFormParam->setParam($_POST);
                $this->arrErr = $objFormParam->checkError();
                $this->arrForm = $objFormParam->getFormParamList();
                if (SC_Utils_Ex::isBlank($this->arrErr)) {
                    $this->lfSendMail($this);

                    // 完了ページへ移動する
                    SC_Response_Ex::sendRedirect('img_contact_complete.php');
                    SC_Response_Ex::actionExit();
                } else {
                    SC_Utils_Ex::sfDispSiteError(CUSTOMER_ERROR);
                    SC_Response_Ex::actionExit();
                }
                break;

            default:

                break;
        }
    }

    /**
     * お問い合わせ入力時のパラメーター情報の初期化を行う.
     *
     * @param  SC_FormParam $objFormParam SC_FormParam インスタンス
     * @return void
     */
    public function lfInitParam(&$objFormParam)
    {
        $objFormParam->addParam('お名前(姓)', 'name01', STEXT_LEN, 'KVa', array('EXIST_CHECK', 'SPTAB_CHECK', 'MAX_LENGTH_CHECK'));
        $objFormParam->addParam('お名前(名)', 'name02', STEXT_LEN, 'KVa', array('EXIST_CHECK', 'SPTAB_CHECK', 'MAX_LENGTH_CHECK'));
        $objFormParam->addParam('お名前(フリガナ・姓)', 'kana01', STEXT_LEN, 'KVCa', array('EXIST_CHECK', 'SPTAB_CHECK', 'MAX_LENGTH_CHECK', 'KANA_CHECK'));
        $objFormParam->addParam('お名前(フリガナ・名)', 'kana02', STEXT_LEN, 'KVCa', array('EXIST_CHECK', 'SPTAB_CHECK', 'MAX_LENGTH_CHECK', 'KANA_CHECK'));
        $objFormParam->addParam('郵便番号1', 'zip01', ZIP01_LEN, 'n', array('SPTAB_CHECK', 'NUM_CHECK', 'NUM_COUNT_CHECK'));
        $objFormParam->addParam('郵便番号2', 'zip02', ZIP02_LEN, 'n', array('SPTAB_CHECK', 'NUM_CHECK', 'NUM_COUNT_CHECK'));
        $objFormParam->addParam('都道府県', 'pref', INT_LEN, 'n', array('MAX_LENGTH_CHECK', 'NUM_CHECK'));
        $objFormParam->addParam('住所1', 'addr01', MTEXT_LEN, 'KVa', array('SPTAB_CHECK', 'MAX_LENGTH_CHECK'));
        $objFormParam->addParam('住所2', 'addr02', MTEXT_LEN, 'KVa', array('SPTAB_CHECK', 'MAX_LENGTH_CHECK'));
        $objFormParam->addParam('Amazonメールアドレス', 'contents', null, 'KVa', array('EMAIL_CHAR_CHECK', 'EMAIL_CHAR_CHECK'));
        $objFormParam->addParam('メールアドレス', 'email', null, 'KVa', array('EXIST_CHECK', 'EMAIL_CHECK', 'EMAIL_CHAR_CHECK'));
        $objFormParam->addParam('お電話番号1', 'tel01', TEL_ITEM_LEN, 'n', array('NUM_CHECK', 'MAX_LENGTH_CHECK'));
        $objFormParam->addParam('お電話番号2', 'tel02', TEL_ITEM_LEN, 'n', array('NUM_CHECK', 'MAX_LENGTH_CHECK'));
        $objFormParam->addParam('お電話番号3', 'tel03', TEL_ITEM_LEN, 'n', array('NUM_CHECK', 'MAX_LENGTH_CHECK'));
        $objFormParam->addParam('image_key', 'image_key', '', '', array());
        $objFormParam->addParam('Amazonスクリーンショットファイル', 'sample_image', '', '', array());
        $objFormParam->addParam('Amazonスクリーンショット', 'sample_image_realpath', '', '', array('EXIST_CHECK'));
        $objFormParam->addParam('sample_image_urlpath', 'sample_image_urlpath', '', '', array());
    }

    /**
     * 入力内容のチェックを行なう.
     *
     * @param  SC_FormParam $objFormParam SC_FormParam インスタンス
     * @return array        入力チェック結果の配列
     */
    public function lfCheckError(&$objFormParam)
    {
        // 入力データを渡す。
        $arrForm =  $objFormParam->getHashArray();
        $objErr = new SC_CheckError_Ex($arrForm);
        $objErr->arrErr = $objFormParam->checkError();

        return $objErr->arrErr;
    }

    /**
     * アップロードファイルパラメーター情報の初期化
     * - 画像ファイル用
     *
     * @param  SC_UploadFile_Ex $objUpFile SC_UploadFileインスタンス
     * @return void
     */
    public function lfInitFile(&$objUpFile)
    {
        $objUpFile->addFile('画像', 'sample_image', array('jpg', 'gif', 'png','JPG', 'JPEG', 'jpeg', 'GIF', 'PNG'), IMAGE_SIZE, false, LARGE_IMAGE_WIDTH, LARGE_IMAGE_HEIGHT);
    }

    /**
     * アップロードファイルパラメーター情報から削除
     * 一時ディレクトリに保存されている実ファイルも削除する
     *
     * @param  SC_UploadFile_Ex $objUpFile SC_UploadFileインスタンス
     * @param  string $image_key 画像ファイルキー
     * @return void
     */
    public function lfDeleteTempFile(&$objUpFile, $image_key)
    {
        // TODO: SC_UploadFile::deleteFileの画像削除条件見直し要
        $arrTempFile = $objUpFile->temp_file;
        $arrKeyName = $objUpFile->keyname;

        foreach ($arrKeyName as $key => $keyname) {
            if ($keyname != $image_key) continue;

            if (!empty($arrTempFile[$key])) {
                $temp_file = $arrTempFile[$key];
                $arrTempFile[$key] = '';

                if (!in_array($temp_file, $arrTempFile)) {
                    $objUpFile->deleteFile($image_key);
                } else {
                    $objUpFile->temp_file[$key] = '';
                    $objUpFile->save_file[$key] = '';
                }
            } else {
                $objUpFile->temp_file[$key] = '';
                $objUpFile->save_file[$key] = '';
            }
        }
    }

    /**
     * メールの送信を行う。
     *
     * @param LC_Page_Contact $objPage
     * @return void
     */
    public function lfSendMail(&$objPage)
    {
        $CONF = SC_Helper_DB_Ex::sfGetBasisData();
        $objPage->tpl_shopname = $CONF['shop_name'];
        $objPage->tpl_infoemail = $CONF['email02'];
        $attachment = $objPage->arrForm['sample_image_realpath']['value'];
        $helperMail = new SC_Helper_Mail_Ex();
        $helperMail->setPage($this);
        $helperMail->sfSendTemplateMail(
            $objPage->arrForm['email']['value'],            // to
            $objPage->arrForm['name01']['value'] .' 様',    // to_name
            5,                                              // template_id
            $objPage,                                       // objPage
            $attachment,                                    // attachment
            $CONF['email03'],                               // from_address
            $CONF['shop_name'],                             // from_name
            $CONF['email02'],                               // reply_to
            $CONF['email02']                               // bcc
        );
    }
}
