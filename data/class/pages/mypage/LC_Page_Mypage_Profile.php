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
        $objFormParam->addParam('save_profile_image', 'save_profile_image', '', '', [], '', false);
        $objFormParam->addParam('temp_profile_image', 'temp_profile_image', '', '', [], '', false);
        $objFormParam->addParam('image_key', 'image_key', '', '', [], '', false);

        $objFormParam->setParam($_POST);    // POST値の取得

        // アップロードファイル情報の初期化
        $objUpFile = new SC_UploadFile_Ex(HTML_REALDIR . 'upload/temp_profile_image/', HTML_REALDIR . 'upload/save_profile_image/');
        $this->lfInitFile($objUpFile);
        $objUpFile->setHiddenFileList($_POST);

        switch ($mode = $this->getMode()) {
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
                    $this->lfRegistCustomerData($objFormParam, $customer_id, $objUpFile);

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

            // 画像のアップロード (Ajax)
            case 'upload_image_ajax':
            case 'delete_image_ajax':
                $arrForm = $objFormParam->getHashArray();

                $image_key = $arrForm['image_key'];

                if ($mode === 'upload_image_ajax') {
                    // ファイルを一時ディレクトリにアップロード
                    $error = $objUpFile->makeTempFile($image_key, IMAGE_RENAME);
                    if (strlen($error) >= 1) {
                        SC_Response_Ex::json([
                            'error' => $error,
                        ]);
                    }
                }
                elseif ($mode === 'delete_image_ajax') {
                    // ファイル削除
                    $this->lfDeleteTempFile($objUpFile, $image_key);
                }

                // アップロードファイル情報取得(Hidden用)
                $arrHidden = $objUpFile->getHiddenFileList();

                // 画像ファイル表示用データ取得
                $arrFile = (array)$objUpFile->getFormFileList()[$image_key];

                SC_Response_Ex::json([
                    'arrHidden' => $arrHidden,
                    'arrFile' => $arrFile,
                ]);
                break;

            default:
                $arrDbData = SC_Helper_Customer_Ex::sfGetCustomerData($customer_id);
                $objFormParam->setParam($arrDbData);
                // DBデータから画像ファイル名の読込
                $objUpFile->setDBFileList($arrDbData);

                break;
        }
        $this->arrForm = $objFormParam->getFormParamList();
        $this->arrMyProducts = $this->getMyProducts($customer_id);

        // アップロードファイル情報取得(Hidden用)
        $this->arrHidden = $objUpFile->getHiddenFileList();

        // 画像ファイル表示用データ取得
        $this->arrFile = $objUpFile->getFormFileList();

        $this->tpl_pref_id = $objCustomer->getValue('pref');
    }

    /**
     *  会員情報を登録する
     *
     * @param SC_FormParam $objFormParam
     * @param mixed $customer_id
     * @return void
     */
    public function lfRegistCustomerData(&$objFormParam, $customer_id, $objUpFile)
    {
        $sqlval = $objFormParam->getDbArray();

        // 画像
        $arrRet = $objUpFile->getDBFileList();
        $sqlval = array_merge($sqlval, $arrRet);

        SC_Helper_Customer_Ex::sfEditCustomerData($sqlval, $customer_id);

        // 一時ファイルを本番ディレクトリに移動する
        $this->lfSaveUploadFiles($objUpFile, $customer_id);
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

    /**
     * アップロードファイルパラメーター情報の初期化
     * - 画像ファイル用
     *
     * @param  SC_UploadFile_Ex $objUpFile SC_UploadFileインスタンス
     * @return void
     */
    public function lfInitFile(&$objUpFile)
    {
        $objUpFile->addFile("画像", "profile_image", array('jpg', 'gif', 'png'), IMAGE_SIZE, false, LARGE_SUBIMAGE_WIDTH, LARGE_SUBIMAGE_HEIGHT);
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
     * アップロードファイルを保存する
     *
     * @param  object  $objUpFile   SC_UploadFileインスタンス
     * @return void
     */
    public function lfSaveUploadFiles(&$objUpFile)
    {
        // TODO: SC_UploadFile::moveTempFileの画像削除条件見直し要
        $objImage = new SC_Image_Ex($objUpFile->temp_dir);
        $arrKeyName = $objUpFile->keyname;
        $arrTempFile = $objUpFile->temp_file;
        $arrSaveFile = $objUpFile->save_file;
        $arrImageKey = array();
        foreach ($arrTempFile as $key => $temp_file) {
            if ($temp_file) {
                $save_dir = $objUpFile->save_dir . $this->image_ymd_dir;
                if (!SC_Utils_Ex::recursiveMkdir($save_dir)) {
                    throw new Exception;
                }
                $objImage->moveTempImage($temp_file, $save_dir);
                $arrImageKey[] = $arrKeyName[$key];
                if (!empty($arrSaveFile[$key])
                    && !in_array($temp_file, $arrSaveFile)
                ) {
                    $objImage->deleteImage($arrSaveFile[$key], $save_dir);
                }
            }
        }
    }
}
