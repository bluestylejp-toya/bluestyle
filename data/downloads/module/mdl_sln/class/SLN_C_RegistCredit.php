<?php
require_once(MODULE_REALDIR . 'mdl_sln/defines.php');
require_once(SLN_CLASS_PATH . 'SLN_C_Credit.php');

/**
 * SLN_C_RegistCreditクラス（クレジットカード保存）
 *
 * @package ソニーペイメントサービス決済モジュール
 * @author Sony Payment Services Inc.
 * @version 2.0.0
*/
class SLN_C_RegistCredit extends SLN_C_Credit {

	function requestPayment($orderHash, $paramHash) {

		$objectMdl =& SLN::getInstance();
		$slnSettingHash = $objectMdl->getConfigs();

		$accessUrl = $slnSettingHash['credit_connection_place1']; //オンライン取引接続用URL(入力ボックス)

		$sendKeyHash = array(
				'MerchantId',
				'MerchantPass',
				'TenantId',
				'TransactionDate',
				'Amount',
				'OperateId',
				'KaiinId',
				'KaiinPass',
				'PayType',
				'MerchantFree1',
				'MerchantFree2',
				'MerchantFree3',
		);

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

		$paramHash['pay_status'] = '';
		$paramHash['fail_pay_status'] = '';

		$ret = $this->orderRequest($accessUrl, $sendKeyHash, $orderHash, $paramHash, $slnSettingHash);
		return $ret;
	}
}