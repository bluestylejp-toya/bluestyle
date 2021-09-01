<?php
require_once CLASS_EX_REALDIR . 'page_extends/frontparts/bloc/LC_Page_FrontParts_Bloc_Ex.php';

/**
 * @package Page
 */
class LC_Page_FrontParts_Bloc_CheckItem extends LC_Page_FrontParts_Bloc_Ex
{
    // 表示件数
    const DISPNUM = 10;

    // cookie保持期限
    const EXPIRESDAY = 30;

    // 保存するcookieの名前
    const COOKIENAME = 'plg_CheckedItems_product';

    /**
     * @var 閲覧商品配列
     */
    public $arrCheckItems;

    /**
     * LC_Page_FrontParts_Bloc_CheckItem constructor.
     */
    public function __construct()
    {
    }

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
        // 閲覧商品取得
        $this->arrCheckItems = $this->getCheckItem();

        // 商品詳細ページアクセス時には閲覧商品に追加
        if (isset($_GET['product_id'])) {
            // 商品IDフォーマットチェック
            $objFormParam_PreEdit = new SC_FormParam_Ex();
            $this->lfCheckProductId($objFormParam_PreEdit, $_REQUEST);
            // エラーチェック
            $this->arrErr = $objFormParam_PreEdit->checkError();
            if (count($this->arrErr) > 0) {
                trigger_error('商品IDが不正です', E_USER_ERROR);
            }
            self::setCookie($objFormParam_PreEdit->getValue('product_id'));
        }
    }

    /**
     * パラメーター情報の初期化
     * - 編集/複製モード
     *
     * @param  SC_FormParam_Ex $objFormParam SC_FormParamインスタンス
     * @param  array $arrPost $_POSTデータ
     * @return void
     */
    public function lfCheckProductId(&$objFormParam, $arrPost)
    {
        $objFormParam->addParam('商品ID', 'product_id', INT_LEN, 'n', array('NUM_CHECK', 'MAX_LENGTH_CHECK'));
        $objFormParam->setParam($arrPost);
        $objFormParam->convParam();
    }

    /**
     * 最近チェックした商品の情報を取得
     * @return array $arrCheckItemList 最近チェックした商品配列
     */
    private function getCheckItem()
    {
        // 最近チェックした商品
        $arrCheckItemList = array();

        // 直近閲覧した商品から表示する
        $arrItem = array_reverse(Self::getCookieArray(), true);

        $cnt = 0;
        $objProduct = new SC_Product_Ex();
        $objQuery = SC_Query_Ex::getSingletonInstance();
        foreach ($arrItem as $product_id) {
            // 商品情報取得
            $arrRet = $objProduct->getDetail($product_id);
            // 未削除、公開商品のみ表示する
            if (isset($arrRet['product_id'])) {
                if ($arrRet['del_flg'] == 0 and $arrRet['status'] == 1) {
                    if ($arrRet['stock_unlimited_min'] == 1 or $arrRet['stock_min'] > 0) {
                        // お気に入り件数取得
                        $arrRet['favorite_products_count'] = SC_Product_Ex::countFavoriteByProductId($arrRet['product_id']);
                        $arrCheckItemList[$cnt] = $arrRet;
                        ++$cnt;
                    }
                }
            }
            if (self::DISPNUM <= $cnt) break;
        }
        return $arrCheckItemList;

    }

    /**
     * cookieに保存している最近チェックした商品の商品IDを取得
     * @return array $arrItems 最近チェックした商品の商品ID配列
     */
    private function getCookieArray()
    {
        $strItems = isset($_COOKIE[self::COOKIENAME]) ? $_COOKIE[self::COOKIENAME] : null;
        if ($strItems) {
            $arrItems = explode(',', $strItems);
        } else {
            $arrItems = array();
        }
        return $arrItems;
    }

    /**
     * cookieに保存する
     * @param $product_id 商品ID
     */
    private function setCookie($product_id)
    {
        $arrItems = self::getCookieArray();

        $strParam = '';
        if (!empty($arrItems)) {
            foreach ($arrItems as $idx => $val) {
                if ($val != $product_id) {
                    $arrParam[] = $val;
                }
            }
            $arrParam[] = $product_id;
            if (count($arrParam) > self::DISPNUM) {
                for ($cnt = 0; $cnt <= count($arrParam) - self::DISPNUM; $cnt++) {
                    unset($arrParam[$cnt]);
                }
            }
            $strParam = implode(',', $arrParam);
        } else {
            $strParam = $product_id;
        }

        setcookie(self::COOKIENAME, $strParam, [
            'httponly' => true,
            'expires' => time() + 60 * 60 * 24 * self::EXPIRESDAY,
            'path' => ROOT_URLPATH,
            'samesite' => 'None',
            'secure' => true,
        ]);
    }
}
