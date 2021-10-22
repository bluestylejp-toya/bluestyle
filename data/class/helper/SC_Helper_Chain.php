<?php
/**
 * Chain 関連のヘルパークラス.
 *
 * @package Helper
 */
class SC_Helper_Chain
{
    /**
     * 商品非公開
     */
    public static function lockProductsByChainId($chain_id)
    {
        $objQuery = SC_Query_Ex::getSingletonInstance();

        $chain = SC_Helper_Api_Ex::getChain($chain_id);

        // 含まれる商品IDを全て拾う
        $arrProductId = [];
        foreach ($chain->chain_list as $chain_one) {
            foreach ($chain_one as $edge) {
                $arrProductId[] = $edge->source_id;
                $arrProductId[] = $edge->target_id;
            }
        }
        $arrProductId = array_unique($arrProductId);

        // 商品マスター更新
        $arrUpdate = [
            'status' => 2, // 非公開
            'chain_id' => $chain_id,
        ];
        $where = 'product_id IN (' . SC_Utils_Ex::repeatStrWithSeparator('?', count($arrProductId)) . ')';
        $objQuery->update('dtb_products', $arrUpdate, $where, $arrProductId);
    }

    /**
     * 商品公開
     */
    public static function unlockProductsByChainId($chain_id)
    {
        $objQuery = SC_Query_Ex::getSingletonInstance();

        // 商品マスター更新
        $arrUpdate = [
            'status' => 1, // 公開
            'chain_id' => NULL,
        ];
        $where = 'status = 2 AND chain_id = ?';
        $arrWhereVal = [$chain_id];
        $objQuery->update('dtb_products', $arrUpdate, $where, $arrWhereVal);
    }

    public static function execBatchPostLoopUpdate($chain_id)
    {
        $command_realpath = DATA_REALDIR . 'batch/post_loop_update.php';
        $log_realpath = DATA_REALDIR . "logs/batch_post_loop_update.log";
        shell_exec('nohup ' . escapeshellcmd($command_realpath) . ' ' . escapeshellcmd($chain_id) . ' > ' . escapeshellcmd($log_realpath) . ' 2>&1 &');
    }
}
