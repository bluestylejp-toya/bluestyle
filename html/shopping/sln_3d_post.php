<?php
require_once '../require.php';
require_once(MODULE_REALDIR . 'mdl_sln/defines.php');
require_once(SLN_CLASS_PATH . "CryptAES.php");
require_once(SLN_CLASS_PATH . "SLN_C_Base.php");

if ($_SERVER['REQUEST_METHOD'] != "POST") {
    exit;
}

$objectMdl =& SLN::getInstance();
$slnSettingHash = $objectMdl->getConfigs();

$CryptAES = new CryptAES();
$CryptAES->setKey($slnSettingHash['credit_aes_key']);
$CryptAES->setIv($slnSettingHash['credit_aes_iv']);

$base = new SLN_C_Base();
$data = $base->aesDeCode($_POST['EncryptValue'], $CryptAES);

if ($data['MerchantFree1']) {//受注データ
    sleep(10);// threeCardと同時に処理されないように念のため時間をずらす
    $orderHash = SC_Query_Ex::getSingletonInstance()->getRow('*', 'dtb_order', 'status = ? AND order_id = ?', array(ORDER_PENDING, $data['MerchantFree1']));
    $statusId = $orderHash['status'];
    
    if ($orderHash['order_id']) {//決済中受注存在チェック
        $isError = true;
        if ($data['ResponseCd'] == 'OK' && 
                $orderHash['del_flg'] == 0 && 
                $orderHash['status'] != ORDER_CANCEL) {
                    
            if ($data['OperateId'] == "1Auth") {
                $data['pay_status'] = SLN_PAY_STATUS_AUTH;
            } else {
                $data['pay_status'] = SLN_PAY_STATUS_CAPTURE;
            }
            
            SLN_Util::setOrderPayHash($orderHash, $data);
            
            $objectPurchase = new SC_Helper_Purchase();
            
            $order_status = ORDER_NEW;
            
            // 即時売上時は入金済みにする
            $objectMdl =& SLN::getInstance();
            $slnSettingHash = $objectMdl->getConfigs();
            if ($data['pay_status'] == SLN_PAY_STATUS_CAPTURE && $slnSettingHash['card_order_pre_end'] == SLN_ORDER_PRE_END) $order_status = ORDER_PRE_END;
            
            $objectQuery =& SC_Query::getSingletonInstance();
            $objectQuery->begin();
            $objectPurchase->sfUpdateOrderStatus($orderHash['order_id'], $order_status);
            $objectQuery->commit();
            
            $isError = false;
        }
        
        if ($isError) {
            $data['success_pay_status'] = SLN_PAY_STATUS_FAIL;
            SLN_Util::setOrderPayHash($orderHash, $data);
        }
    } else {
        //エラー処理
    }
} else {
    //エラー処理
}