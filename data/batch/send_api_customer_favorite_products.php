#!/usr/local/bin/php
<?php
ini_set('display_errors', '1');
chdir(dirname(__FILE__));
require_once '../../html/require.php';
while (@ob_end_flush());

echo "START\n";
Batch::loop_minus_one();
// Batch::loop();
echo "END\n";

class Batch {
    /**
     * dtb_customer_favorite_products の内容を基に API 要求する。
     */
    public static function loop_minus_one() {
        $arrCustomerFavoriteProducts = self::getCustomerFavoriteProducts();
        foreach ($arrCustomerFavoriteProducts as $arrRow) {
            $objHelperApi = new SC_Helper_Api_Ex();
            $objHelperApi->setUrl(API_URL . 'chain/edges/add');
            $objHelperApi->setMethod('POST');
            $data = [
                "source_id" => $arrRow['product_id'],
                "target_id" => $arrRow['target_id'],
                // "date" => str_replace('+00:00', 'Z', gmdate('c', strtotime($arrRow['update_date']))),
            ];
            $objHelperApi->setPostParam($data);
            $result_raw = $objHelperApi->exec();
            $result = json_decode($result_raw, null, 512, JSON_THROW_ON_ERROR);
            var_dump($result);
        }
    }

    /**
     * loop_minus_one() と供に実行することで、Loop を成立させる。
     */
    public static function loop() {
        $objHelperApi = new SC_Helper_Api_Ex();
        $objHelperApi->setUrl(API_URL . 'chain/edges/add');
        $objHelperApi->setMethod('POST');
        $data = [
            "source_id" => 2,
            "target_id" => 1,
            // "date" => str_replace('+00:00', 'Z', gmdate('c')),
        ];
        $objHelperApi->setPostParam($data);
        $result_raw = $objHelperApi->exec();
        $result = json_decode($result_raw, null, 512, JSON_THROW_ON_ERROR);
        var_dump($result);
    }

    public static function getCustomerFavoriteProducts() {
        $objQuery       = SC_Query_Ex::getSingletonInstance();

        $objQuery->setOrder('customer_id, product_id, target_id');
        $arrReturn = $objQuery->select('*', 'dtb_customer_favorite_products');

        return $arrReturn;
    }
}
