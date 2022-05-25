<?php
require_once(MODULE_REALDIR . 'mdl_sln/defines.php');
require_once(SLN_CLASS_PATH . 'SLN_C_Base.php');
require_once(SLN_CLASS_PATH . 'CryptAES.php');

/**
 * SLN_C_Creditクラス（3Dクレジットカード用）
 *
 * @package ソニーペイメントサービス決済モジュール
 * @author Sony Payment Services Inc.
 * @version 2.0.0
*/
class SLN_C_3DCredit extends SLN_C_Base {
    
    function redirectPayment($orderHash, $paramHash) {
        $objectMdl =& SLN::getInstance();
        $slnSettingHash = $objectMdl->getConfigs();
    
        $accessUrl = $slnSettingHash['credit_connection_place6'];
        
        $sendKeyHash = array(
            'MerchantId',
            'MerchantPass',
            'TenantId',
            'OrderID',
            'Amount',
            'TdTenantName',
            'TransactionDate',
            'OperateId',
            'CardNo',
            'PayType',
            'CardExp',
            'MerchantFree1',
            'ProcNo',
            'RedirectUrl',
            'PostUrl',
            'Token',
            'MerchantFree2',
            'MerchantFree3',
        );
    
        // 設定値によって送信する内容を変更
        if (!SC_Utils::isBlank($slnSettingHash['SecCd'])) {
            $sendKeyHash[] = 'SecCd';
        }
        if (in_array('KanaSei',  $slnSettingHash['attestation_assistance'])) {
            $sendKeyHash[] = 'KanaSei';
            $sendKeyHash[] = 'KanaMei';
        }
        if (in_array('BirthDay', $slnSettingHash['attestation_assistance'])) $sendKeyHash[] = 'BirthDay';
        if (in_array('TelNo',    $slnSettingHash['attestation_assistance'])) $sendKeyHash[] = 'TelNo';
    
        $paramHash['pay_status'] = '';
        $paramHash['fail_pay_status'] = '';
    
        // 仮売上(1Auth) 即時売上(1Gathering)
        if ($slnSettingHash['OperateId'] ==  '1Auth') {
            $paramHash['OperateId'] = '1Auth';
            $paramHash['success_pay_status'] = SLN_PAY_STATUS_AUTH;
        } elseif ($slnSettingHash['OperateId'] ==  '1Gathering'){
            $paramHash['OperateId'] = '1Gathering';
            $paramHash['success_pay_status'] = SLN_PAY_STATUS_CAPTURE;
        } else {
            return false;
        }
        
        //$paramHash['ProcNo'] = sprintf("%07d", $orderHash['order_id']);
        $paramHash['ProcNo'] = "0000000";
        
        $CryptAES = new CryptAES();
        $CryptAES->setKey($slnSettingHash['credit_aes_key']);
        $CryptAES->setIv($slnSettingHash['credit_aes_iv']);
    
        $this->orderRedirect($accessUrl, $sendKeyHash, $orderHash, $paramHash, $slnSettingHash, $CryptAES);
    }
    
    function redirectMemPayment($orderHash, $paramHash) {
      
        $objectMdl =& SLN::getInstance();
        $slnSettingHash = $objectMdl->getConfigs();
    
        $accessUrl = $slnSettingHash['credit_connection_place6'];
    
        $sendKeyHash = array(
            'MerchantId',
            'MerchantPass',
            'TenantId',
            'OrderID',
            'Amount',
            'TdTenantName',
            'TransactionDate',
            'OperateId',
            'PayType',
            'MerchantFree1',
            'ProcNo',
            'RedirectUrl',
            'PostUrl',
            'Token',
            'KaiinId',
            'KaiinPass',
            'MerchantFree2',
            'MerchantFree3',
        );
    
        $paramHash['pay_status'] = '';
        $paramHash['fail_pay_status'] = '';
    
        // 仮売上(1Auth) 即時売上(1Gathering)
        if ($slnSettingHash['OperateId'] ==  '1Auth') {
            $paramHash['OperateId'] = '1Auth';
            $paramHash['success_pay_status'] = SLN_PAY_STATUS_AUTH;
        } elseif ($slnSettingHash['OperateId'] ==  '1Gathering'){
            $paramHash['OperateId'] = '1Gathering';
            $paramHash['success_pay_status'] = SLN_PAY_STATUS_CAPTURE;
        } else {
            return false;
        }
    
        //$paramHash['ProcNo'] = sprintf("%07d", $orderHash['order_id']);
        $paramHash['ProcNo'] = "0000000";
    
        $CryptAES = new CryptAES();
        $CryptAES->setKey($slnSettingHash['credit_aes_key']);
        $CryptAES->setIv($slnSettingHash['credit_aes_iv']);
    
        $this->orderRedirect($accessUrl, $sendKeyHash, $orderHash, $paramHash, $slnSettingHash, $CryptAES);
    }
}