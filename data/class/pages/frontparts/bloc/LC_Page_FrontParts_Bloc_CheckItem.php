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
        if (isset($_GET['product_id']) && self::CheckProductId($_GET['product_id'])) {
            self::setCookie($_GET['product_id']);
        }
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
                        $arrData = $objQuery->getRow('count(1) as favorite_products_count', 'dtb_customer_favorite_products', 'product_id = ?', array($arrRet['product_id']));
                        $arrRet['favorite_products_count'] = $arrData['favorite_products_count'];

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
     * 商品IDのフォーマットチェック
     * @param $product_id チェック対象の商品ID
     * @return boolean チェック結果
     */
    private function checkProductId($product_id)
    {
        if (!SC_Utils_Ex::sfIsInt($product_id)
            || SC_Utils_Ex::sfIsZeroFilling($product_id)
            || !SC_Helper_DB_Ex::sfIsRecord('dtb_products', 'product_id', array(1, $product_id), 'status = ?')
        ) {
            return false;
        }
        return true;
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
