<?php
require_once CLASS_EX_REALDIR . 'page_extends/mypage/LC_Page_AbstractMypage_Ex.php';

/**
 * アイテム登録 のページクラス.
 *
 * @package Page
 */
class LC_Page_Mypage_ItemEdit extends LC_Page_AbstractMypage_Ex
{
    /**
     * Page を初期化する.
     *
     * @return void
     */
    public function init()
    {
        parent::init();
        $this->tpl_subtitle = 'アイテム登録(入力ページ)';
        $this->tpl_mypageno = 'ItemEdit';

        $masterData = new SC_DB_MasterData_Ex();
        $this->arrDISP = $masterData->getMasterData('mtb_disp');
        $this->arrSTATUS = $masterData->getMasterData('mtb_status');

        $this->httpCacheControl('nocache');

        $this->image_ymd_dir = date('Y/m/d/');
    }

    /**
     * Page のプロセス
     * @return void
     */
    public function action()
    {
        $objFormParam = new SC_FormParam_Ex();

        // アップロードファイル情報の初期化
        $objUpFile = new SC_UploadFile_Ex(IMAGE_TEMP_REALDIR, IMAGE_SAVE_REALDIR);
        $this->lfInitFile($objUpFile);
        $objUpFile->setHiddenFileList($_POST);

        $mode = $this->getMode();
        switch ($mode) {
            case 'pre_edit':
                $objFormParam_PreEdit = new SC_FormParam_Ex();

                // パラメーター初期化(商品ID)
                $this->lfInitFormParam_PreEdit($objFormParam_PreEdit, $_REQUEST);
                // エラーチェック
                $this->arrErr = $objFormParam_PreEdit->checkError();
                if (count($this->arrErr) > 0) {
                    trigger_error('', E_USER_ERROR);
                }

                // 商品ID取得
                $product_id = $objFormParam_PreEdit->getValue('product_id');
                // 商品データ取得
                $arrForm = $this->lfGetFormParam_PreEdit($objUpFile, $product_id);

                // パラメーター初期化
                $this->lfInitFormParam($objFormParam, $arrForm);
                // ページ表示用パラメーター設定
                $this->lfSetViewParam_InputPage($objUpFile, $objFormParam);
                break;

            case 'edit':
                // パラメーター初期化, 取得
                $this->lfInitFormParam($objFormParam, $_POST);
                $arrForm = $objFormParam->getHashArray();
                // エラーチェック
                $this->arrErr = $this->lfCheckError_Edit($objFormParam, $objUpFile, $arrForm);
                if (count($this->arrErr) == 0) {
                    // 確認画面表示設定
                    $this->tpl_mainpage = 'mypage/item_edit_confirm.tpl';
                    $this->tpl_subtitle = 'アイテム登録(確認ページ)';
                    $this->arrCatList = $this->lfGetCategoryList_Edit();
                    $this->lfSetViewParam_ConfirmPage($objUpFile, $objFormParam);
                } else {
                    // 入力画面表示設定
                    $this->lfSetViewParam_InputPage($objUpFile, $objFormParam);
                }
                break;

            case 'complete':
                // パラメーター初期化, 取得
                $this->lfInitFormParam($objFormParam, $_POST);
                $arrForm = $objFormParam->getHashArray();
                // エラーチェック
                $this->arrErr = $this->lfCheckError_Edit($objFormParam, $objUpFile, $arrForm);
                if (count($this->arrErr) == 0) {
                    // DBへデータ登録
                    $product_id = $this->lfRegistProduct($objUpFile, $arrForm);

                    // 件数カウントバッチ実行
                    $objQuery = SC_Query_Ex::getSingletonInstance();
                    $objDb = new SC_Helper_DB_Ex();
                    $objDb->sfCountCategory($objQuery);
                    $objDb->sfCountMaker($objQuery);

                    // 一時ファイルを本番ディレクトリに移動する
                    $this->lfSaveUploadFiles($objUpFile, $product_id);

                    // 入力ページに戻す (PRG)
                    SC_Response_Ex::reload(['mode' => 'pre_edit', 'completeed' => 1, 'product_id' => $product_id], true);
                } else {
                    // 入力画面表示設定
                    $this->lfSetViewParam_InputPage($objUpFile, $objFormParam);
                }
                break;

            // 画像のアップロード (Ajax)
            case 'upload_image_ajax':
            case 'delete_image_ajax':
                // パラメーター初期化
                $this->lfInitFormParam_UploadImage($objFormParam);
                $this->lfInitFormParam($objFormParam, $_POST);
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
                $arrFile = $objUpFile->getFormFileList()[$image_key];

                SC_Response_Ex::json([
                    'arrHidden' => $arrHidden,
                    'arrFile' => $arrFile,
                ]);
                break;

            // 確認ページからの戻り
            case 'confirm_return':
                // パラメーター初期化
                $this->lfInitFormParam($objFormParam, $_POST);
                // 入力画面表示設定
                $this->lfSetViewParam_InputPage($objUpFile, $objFormParam);
                break;

            default:
                // パラメーター初期化
                $this->lfInitFormParam($objFormParam, []);
                // 入力画面表示設定
                $this->lfSetViewParam_InputPage($objUpFile, $objFormParam);
                break;
        }
    }

    /**
     * パラメーター情報の初期化
     * - 編集/複製モード
     *
     * @param  SC_FormParam_Ex $objFormParam SC_FormParamインスタンス
     * @param  array  $arrPost      $_POSTデータ
     * @return void
     */
    public function lfInitFormParam_PreEdit(&$objFormParam, $arrPost)
    {
        $objFormParam->addParam('商品ID', 'product_id', INT_LEN, 'n', array('NUM_CHECK', 'MAX_LENGTH_CHECK'));
        $objFormParam->setParam($arrPost);
        $objFormParam->convParam();
    }

    /**
     * パラメーター情報の初期化
     *
     * @param  SC_FormParam_Ex $objFormParam SC_FormParamインスタンス
     * @param  array  $arrPost      $_POSTデータ
     * @return void
     */
    public function lfInitFormParam(&$objFormParam, $arrPost)
    {
        $objFormParam->addParam('商品ID', 'product_id', INT_LEN, 'n', array('NUM_CHECK', 'MAX_LENGTH_CHECK'));
        $objFormParam->addParam('タイトル', 'name', LTEXT_LEN, 'KVa', array('EXIST_CHECK', 'SPTAB_CHECK', 'MAX_LENGTH_CHECK', 'NGWORD_CHECK'));
        $objFormParam->addParam('カテゴリ', 'category_id', INT_LEN, 'n', array('EXIST_CHECK', 'NUM_CHECK', 'MAX_LENGTH_CHECK'));
        $objFormParam->addParam('公開ステータス', 'status', INT_LEN, 'n', array('EXIST_CHECK', 'NUM_CHECK', 'MAX_LENGTH_CHECK'), DEFAULT_PRODUCT_DISP);
        $objFormParam->addParam('状態ステータス', 'product_status', INT_LEN, 'n', array('NUM_CHECK', 'MAX_LENGTH_CHECK'));
        $objFormParam->addParam('タグ', 'comment3', LTEXT_LEN, 'KVa', array('SPTAB_CHECK', 'MAX_LENGTH_CHECK', 'NGWORD_CHECK'));

        for ($cnt = 1; $cnt <= PRODUCTSUB_MAX; $cnt++) {
            $objFormParam->addParam("キャプション({$cnt})", 'sub_title' . $cnt, STEXT_LEN, 'KVa', array('SPTAB_CHECK', 'MAX_LENGTH_CHECK'));
            $objFormParam->addParam('save_sub_large_image' . $cnt, 'save_sub_large_image' . $cnt, '', '', array());
            $objFormParam->addParam('temp_sub_large_image' . $cnt, 'temp_sub_large_image' . $cnt, '', '', array());
        }

        $objFormParam->addParam('product_class_id', 'product_class_id', INT_LEN, 'n', array('NUM_CHECK', 'MAX_LENGTH_CHECK'));

        $objFormParam->setParam($arrPost);
        $objFormParam->convParam();
    }

    /**
     * パラメーター情報の初期化
     * - 画像ファイルアップロードモード
     *
     * @param  SC_FormParam_Ex $objFormParam SC_FormParamインスタンス
     * @return void
     */
    public function lfInitFormParam_UploadImage(&$objFormParam)
    {
        $objFormParam->addParam('image_key', 'image_key', '', '', array());
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
        for ($cnt = 1; $cnt <= PRODUCTSUB_MAX; $cnt++) {
            $objUpFile->addFile("画像({$cnt})", "sub_large_image{$cnt}", array('jpg', 'gif', 'png'), IMAGE_SIZE, false, LARGE_SUBIMAGE_WIDTH, LARGE_SUBIMAGE_HEIGHT);
        }
    }

    /**
     * フォーム入力パラメーターのエラーチェック
     *
     * @param  object $objFormParam SC_FormParamインスタンス
     * @param  SC_UploadFile_Ex $objUpFile    SC_UploadFileインスタンス
     * @param  array  $arrForm      フォーム入力パラメーター配列
     * @return array  エラー情報を格納した連想配列
     */
    public function lfCheckError_Edit(&$objFormParam, &$objUpFile, $arrForm)
    {
        $objErr = new SC_CheckError_Ex($arrForm);
        $arrErr = array();

        // 入力パラメーターチェック
        $arrErr = $objFormParam->checkError();

        // アップロードファイル必須チェック
        $arrErr = array_merge((array) $arrErr, (array) $objUpFile->checkExists());

        return $arrErr;
    }

    /**
     * フォームパラメーター取得
     * - 編集/複製モード
     *
     * @param  SC_UploadFile_Ex  $objUpFile   SC_UploadFileインスタンス
     * @param  integer $product_id  商品ID
     * @return array   フォームパラメーター配列
     */
    public function lfGetFormParam_PreEdit(&$objUpFile, $product_id)
    {
        $arrForm = array();

        // DBから商品データ取得
        $arrForm = $this->lfGetProductData_FromDB($product_id);
        // DBデータから画像ファイル名の読込
        $objUpFile->setDBFileList($arrForm);

        return $arrForm;
    }

    /**
     * 表示用フォームパラメーター取得
     * - 入力画面
     *
     * @param  SC_UploadFile_Ex $objUpFile   SC_UploadFileインスタンス
     * @param  SC_FormParam_Ex $objFormParam SC_FormParamインスタンス
     * @return array  表示用フォームパラメーター配列
     */
    public function lfSetViewParam_InputPage(&$objUpFile, &$objFormParam)
    {
        // カテゴリマスターデータ取得
        $objDb = new SC_Helper_DB_Ex();

        list($this->arrCatVal, $this->arrCatOut) = $objDb->sfGetLevelCatList(false);

        $arrForm = $objFormParam->getHashArray();

        // アップロードファイル情報取得(Hidden用)
        $this->arrHidden = $objUpFile->getHiddenFileList();

        // 画像ファイル表示用データ取得
        $this->arrFile = $objUpFile->getFormFileList();

        $this->arrForm = $objFormParam->getFormParamList();
    }

    /**
     * 表示用フォームパラメーター取得
     * - 確認画面
     *
     * @param  SC_UploadFile_Ex $objUpFile   SC_UploadFileインスタンス
     * @param  SC_FormParam_Ex $objFormParam SC_FormParamインスタンス
     * @return array  表示用フォームパラメーター配列
     */
    public function lfSetViewParam_ConfirmPage(&$objUpFile, &$objFormParam)
    {
        // 画像ファイル表示用データ取得
        $this->arrFile = $objUpFile->getFormFileList();

        $this->arrForm = $objFormParam->getFormParamList();
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
     * @param  integer $product_id  商品ID
     * @return void
     */
    public function lfSaveUploadFiles(&$objUpFile, $product_id)
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
                    && !$this->lfHasSameProductImage($product_id, $arrImageKey, $arrSaveFile[$key], $objUpFile)
                    && !in_array($temp_file, $arrSaveFile)
                ) {
                    $objImage->deleteImage($arrSaveFile[$key], $save_dir);
                }
            }
        }
    }

    /**
     * 同名画像ファイル登録の有無を確認する.
     *
     * 画像ファイルの削除可否判定用。
     * 同名ファイルの登録がある場合には画像ファイルの削除を行わない。
     * 戻り値： 同名ファイル有り(true) 同名ファイル無し(false)
     *
     * @param  string  $product_id      商品ID
     * @param  string  $arrImageKey     対象としない画像カラム名
     * @param  string  $image_file_name 画像ファイル名
     * @param  SC_UploadFile_Ex $objUpFile SC_UploadFileインスタンス
     * @return boolean
     */
    public function lfHasSameProductImage($product_id, $arrImageKey, $image_file_name, $objUpFile)
    {
        if (!SC_Utils_Ex::sfIsInt($product_id)) return false;
        if (!$arrImageKey) return false;
        if (!$image_file_name) return false;

        $arrWhere = array();
        $sqlval = array('0', $product_id);
        foreach ($arrImageKey as $image_key) {
            $arrWhere[] = "{$image_key} = ?";
            $sqlval[] = $image_file_name;
        }
        $where = implode(' OR ', $arrWhere);
        $where = "del_flg = ? AND ((product_id <> ? AND ({$where}))";

        $arrKeyName = $objUpFile->keyname;
        foreach ($arrKeyName as $key => $keyname) {
            if (in_array($keyname, $arrImageKey)) continue;
            $where .= " OR {$keyname} = ?";
            $sqlval[] = $image_file_name;
        }
        $where .= ')';

        $objQuery = SC_Query_Ex::getSingletonInstance();
        $exists = $objQuery->exists('dtb_products', $where, $sqlval);

        return $exists;
    }

    /**
     * DBから商品データを取得する
     *
     * @param  integer $product_id 商品ID
     * @return string   商品データ配列
     */
    public function lfGetProductData_FromDB($product_id)
    {
        $objQuery = SC_Query_Ex::getSingletonInstance();

        // 商品データ取得
        $col = '*';
        $table = 'dtb_products';
        $where = 'product_id = ?';
        $arrProduct = $objQuery->getRow($col, $table, $where, array($product_id));

        // カテゴリID取得
        $col = 'category_id';
        $table = 'dtb_product_categories';
        $where = 'product_id = ?';
        $objQuery->setOption('');
        $arrProduct['category_id'] = $objQuery->get($col, $table, $where, array($product_id));

        // 商品規格ID取得
        $arrProduct['product_class_id'] = SC_Utils_Ex::sfGetProductClassId($product_id, '0', '0');

        // 商品ステータス取得
        $objProduct = new SC_Product_Ex();
        $productStatus = $objProduct->getProductStatus(array($product_id));
        $arrProduct['product_status'] = reset($productStatus[$product_id]);

        return $arrProduct;
    }

    /**
     * 表示用カテゴリマスターデータ配列を取得する
     * - 編集モード
     *
     * @param void
     * @return array カテゴリマスターデータ配列
     */
    public function lfGetCategoryList_Edit()
    {
        $objDb = new SC_Helper_DB_Ex();
        $arrCategoryList = array();

        list($arrCatVal, $arrCatOut) = $objDb->sfGetLevelCatList(false);
        for ($i = 0; $i < count($arrCatVal); $i++) {
            $arrCategoryList[$arrCatVal[$i]] = $arrCatOut[$i];
        }

        return $arrCategoryList;
    }

    /**
     * DBに商品データを登録する
     *
     * @param  SC_UploadFile_Ex  $objUpFile   SC_UploadFileインスタンス
     * @param  array   $arrList     フォーム入力パラメーター配列
     * @return integer 登録商品ID
     */
    public function lfRegistProduct(&$objUpFile, $arrList)
    {
        $objQuery = SC_Query_Ex::getSingletonInstance();
        $objDb = new SC_Helper_DB_Ex();

        $customer_id = $this->objCustomer->getValue('customer_id');

        // 配列の添字を定義
        $checkArray = array();
        $sqlval = [
            'name' => $arrList['name'],
            'status' => $arrList['status'],
            'comment3' => $arrList['comment3'],
        ];

        for ($cnt = 1; $cnt <= PRODUCTSUB_MAX; $cnt++) {
            $sqlval['sub_title'.$cnt] = $arrList['sub_title'.$cnt];
        }

        // INSERTする値を作成する。
        $sqlval['update_date'] = 'CURRENT_TIMESTAMP';
        $arrRet = $objUpFile->getDBFileList($this->image_ymd_dir);
        $sqlval = array_merge($sqlval, $arrRet);

        $objQuery->begin();

        // 新規登録(複製時を含む)
        if ($arrList['product_id'] == '') {
            $product_id = $objQuery->nextVal('dtb_products_product_id');
            $sqlval['product_id'] = $product_id;

            // INSERTの実行
            $sqlval['create_date'] = 'CURRENT_TIMESTAMP';
            $sqlval['customer_id'] = $customer_id;
            $objQuery->insert('dtb_products', $sqlval);

            $arrList['product_id'] = $product_id;

            // カテゴリを更新
            $objDb->updateProductCategories([$arrList['category_id']], $product_id);

            $arrList['stock_unlimited'] = UNLIMITED_FLG_LIMITED;
            $arrList['stock'] = 1;
        // 更新
        } else {
            $product_id = $arrList['product_id'];
            // 削除要求のあった既存ファイルの削除
            $arrRet = $this->lfGetProductData_FromDB($arrList['product_id']);
            // TODO: SC_UploadFile::deleteDBFileの画像削除条件見直し要
            $objImage = new SC_Image_Ex($objUpFile->temp_dir);
            $arrKeyName = $objUpFile->keyname;
            $arrSaveFile = $objUpFile->save_file;
            $arrImageKey = array();
            foreach ($arrKeyName as $key => $keyname) {
                if ($arrRet[$keyname] && !$arrSaveFile[$key]) {
                    $arrImageKey[] = $keyname;
                    $has_same_image = $this->lfHasSameProductImage($arrList['product_id'], $arrImageKey, $arrRet[$keyname], $objUpFile);
                    if (!$has_same_image) {
                        $objImage->deleteImage($arrRet[$keyname], $objUpFile->save_dir);
                    }
                }
            }
            // UPDATEの実行
            $where = 'product_id = ? AND customer_id = ?';
            $objQuery->update('dtb_products', $sqlval, $where, array($product_id, $customer_id));

            // カテゴリを更新
            $objDb->updateProductCategories([$arrList['category_id']], $product_id);
        }

        // 規格なし商品（商品規格テーブルの更新）
        $this->lfInsertDummyProductClass($arrList);

        // 商品ステータス設定
        $objProduct = new SC_Product_Ex();
        $objProduct->setProductStatus($product_id, [$arrList['product_status']]);

        $objQuery->commit();

        return $product_id;
    }

    /**
     * 規格を設定していない商品を商品規格テーブルに登録
     *
     * @param  array $arrList
     * @return void
     */
    public function lfInsertDummyProductClass($arrList)
    {
        $objQuery = SC_Query_Ex::getSingletonInstance();
        $objDb = new SC_Helper_DB_Ex();

        // 配列の添字を定義
        $checkArray = array('product_class_id', 'product_id', 'stock_unlimited', 'stock');
        $sqlval = SC_Utils_Ex::sfArrayIntersectKeys($arrList, $checkArray);

        $sqlval['product_type_id'] = DEFAULT_PRODUCT_DOWN;
        $sqlval['creator_id'] = strlen($_SESSION['member_id']) >= 1 ? $_SESSION['member_id'] : '0';

        if (strlen($sqlval['product_class_id']) == 0) {
            $sqlval['product_class_id'] = $objQuery->nextVal('dtb_products_class_product_class_id');
            $sqlval['create_date'] = 'CURRENT_TIMESTAMP';
            $sqlval['update_date'] = 'CURRENT_TIMESTAMP';
            // INSERTの実行
            $objQuery->insert('dtb_products_class', $sqlval);
        } else {
            $sqlval['update_date'] = 'CURRENT_TIMESTAMP';
            // UPDATEの実行
            $objQuery->update('dtb_products_class', $sqlval, 'product_class_id = ?', array($sqlval['product_class_id']));
        }
        return $sqlval['product_class_id'];
    }
}
