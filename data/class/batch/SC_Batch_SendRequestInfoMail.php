<?php
/**
 * リクエスト情報をメール送信するクラス
 * @package Batch
 * @version $Id$
 */
class SC_Batch_SendRequestInfoMail extends SC_Batch
{
    private $arrSendMailInfo = [];

    /**
     * バッチ処理を実行する.
     *
     * @param  string $target アップデータファイルのディレクトリパス
     * @return void
     */
    public function execute()
    {
//        $this->arrSendMailInfo = $this->getSendMailInfo();

        $CONF = SC_Helper_DB_Ex::sfGetBasisData();

        $subject = 'test';
        $toCustomerMail = 'test';

        $objMail = new SC_SendMail_Ex();
        $objMail->setItem(
            'kk580923@gmail.com',                     // 宛先
            $subject,               // サブジェクト
            $toCustomerMail,        // 本文
            $CONF['email03'],       // 配送元アドレス
            $CONF['shop_name'],     // 配送元 名前
            $CONF['email03'],       // reply_to
            $CONF['email04'],       // return_path
            $CONF['email04'],       // Errors_to
            $CONF['email01']        // Bcc
        );

        $objMail->sendMail();
    }

    /**
     *
     */
    private function getSendMailList()
    {
        $objQuery = SC_Query_Ex::getSingletonInstance();
        $sql = '
            select p.customer_id as 出品者 , cfp.customer_id as リクエストした会員ID, cfp.product_id as リクエストされた商品ID, cfp.create_date as リクエスト日時 
            From dtb_customer c left join dtb_customer_favorite_products cfp on c.customer_id = cfp.customer_id join dtb_products p ON cfp.product_id = p.product_id 
            where c.del_flg = 0 and c.status = 2
            and p.del_flg = 0 and p.status = 1';
        return $objQuery->getAll($sql);
    }

    /**
     * $dir を再帰的に辿ってパス名を配列で返す.
     *
     * @param string 任意のパス名
     * @param string $dir
     * @return array $dir より下層に存在するパス名の配列
     * @see http://www.php.net/glob
     */
    public function listdirs($dir)
    {
        static $alldirs = array();
        $dirs = glob($dir . '/*');
        if (is_array($dirs) && count($dirs) > 0) {
            foreach ($dirs as $d) $alldirs[] = $d;
        }
        if (is_array($dirs)) {
            foreach ($dirs as $dir) $this->listdirs($dir);
        }

        return $alldirs;
    }

    /**
     * mkdir -p
     *
     * @param string $path 絶対パス
     */
    public function lfMkdirRecursive($path)
    {
        $path = dirname($path);

        // HTML_REALDIR/DATA_REALDIRの判別
        if (preg_match("@\Q".HTML_REALDIR."\E@", $path) > 0) {
            $dir = str_replace('\\', '/', HTML_REALDIR);
            $path = preg_replace("@\Q".HTML_REALDIR."\E@", '', $path);
        } elseif (preg_match("@\Q".DATA_REALDIR."\E@", $path) > 0) {
            $dir = str_replace('\\', '/', DATA_REALDIR);
            $path = preg_replace("@\Q".DATA_REALDIR."\E@", '', $path);
        } else {
            $dir = '';
        }
        $arrDirs = explode('/', str_replace('\\', '/', $path));

        foreach ($arrDirs as $n) {
            $dir .= $n . '/';
            if (!file_exists($dir)) {
                if (!@mkdir($dir)) break;
            }
        }
    }

    public function makeDistInfo($bkupDistInfoArray)
    {
        $src = "<?php\n"
             . '$distifo = array(' . "\n";

        foreach ($bkupDistInfoArray as $key => $value) {
            $src .= "'${key}' => '${value}',\n";
        }
        $src .= ");\n?>";

        return $src;
    }

    /**
     * @param string $msg
     */
    public function printLog($msg)
    {
        GC_Utils_Ex::gfPrintLog($msg, DATA_REALDIR . 'logs/ownersstore_batch_update.log');
    }
}
