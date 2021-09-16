<?php

require_once(MODULE_REALDIR . 'mdl_sln/defines.php');
require_once(SLN_CLASS_PATH . 'SLN_C_Base.php');
require_once(SLN_CLASS_PATH . 'SLN_C_Member.php');

/**
 * SLN_C_Utilクラス（管理者向け）
 *
 * @package ソニーペイメントサービス決済モジュール
 * @author Sony Payment Services Inc.
 * @version 2.0.0
*/
class SLN_C_Util extends SLN_C_Base {

	function exec4MemAdd($orderHash, $paramHash = array(), $admin = false) {
		$arrCustomer = SC_Helper_Customer::sfGetCustomerData($orderHash['customer_id']);

		$objectMdl =& SLN::getInstance();
		$slnSettingHash = $objectMdl->getConfigs();

		$orderHash = SLN_Util::getOrderPayHash($orderHash['order_id']);

		$accessUrl = $slnSettingHash['credit_connection_place2'];

		$sendKeyHash = array(
				'MerchantId',
				'MerchantPass',
				'TenantId',
				'TransactionDate',
				'OperateId',
				'KaiinId',
				'KaiinPass',
				'CardNo',
				'CardExp',
				'MerchantFree1',
				'MerchantFree2',
				'MerchantFree3',
		);

		$paramHash['OperateId'] = '4MemAdd';

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

		$sendDataHash = $this->getSendData($sendKeyHash, $orderHash, $paramHash, $slnSettingHash);

		$ret = $this->accessSlnServer($accessUrl, $sendDataHash, $admin);
		if (!$ret || (!SC_Utils::isBlank($this->getError()))) {
			return false;
		}

		return true;
	}

	function exec1Change($orderHash, $admin = false) {

		$objectMdl =& SLN::getInstance();
		$slnSettingHash = $objectMdl->getConfigs();

		$orderHash = SLN_Util::getOrderPayHash($orderHash['order_id']);

		if ($orderHash[SLN_ORDER_COL_PAYID] == SLN_PAYID_CREDIT
		|| $orderHash[SLN_ORDER_COL_PAYID] == SLN_PAYID_REGIST_CREDIT
		) {

			$accessUrl = $slnSettingHash['credit_connection_place1']; //カード決済 オンライン取引

			$sendKeyHash = array(
					'MerchantId',
					'MerchantPass',
					'TenantId',
					'TransactionDate',
					'OperateId',
					'ProcessId',
					'ProcessPass',
					'Amount',
					'MerchantFree1',
					'MerchantFree2',
					'MerchantFree3',
			);

			$paramHash['OperateId'] = '1Change';

		} else {
			$msg = '決済金額の変更はできません。金額変更に対応していない決済です。';
			$this->setError($msg);
			return false;
		}

		// 登録済みカード（クイック含む）の場合は、KaiinId/KaiinPassを含める
		if ($orderHash[SLN_ORDER_COL_PAYID] == SLN_PAYID_REGIST_CREDIT) {
			$sendKeyHash[] = 'KaiinId';
			$sendKeyHash[] = 'KaiinPass';
		}

		$sendDataHash = $this->getSendData($sendKeyHash, $orderHash, $paramHash, $slnSettingHash);

		$ret = $this->accessSlnServer($accessUrl, $sendDataHash, $admin);
		if (!$ret || (!SC_Utils::isBlank($this->getError()))) {
		    $results = $this->getResults();
		   
		    if ($results['ResponseCd'] == "K80") {//バグ対応
		        
		        $this->arrError = array();
		        $this->request_error = null;
		        $this->netError = false;
		        $this->arrResults = null;
		        
		        $sendKeyHash[] = 'KaiinId';
		        $sendKeyHash[] = 'KaiinPass';
		        
		        $sendDataHash = $this->getSendData($sendKeyHash, $orderHash, $paramHash, $slnSettingHash);
		        
		        $ret = $this->accessSlnServer($accessUrl, $sendDataHash, $admin);
		        if (!$ret || (!SC_Utils::isBlank($this->getError()))) {
		            return false;
		        }
		    } else {
		        return false;
		    }
		}

		$arrResults = $this->getResults();

		// Pay_Statusは変更しない。金額が変わるのみ
		$arrResults['Amount'] = $orderHash['payment_total'];

		SLN_Util::setOrderPayHash($orderHash, $arrResults);
		return true;
	}

	/**
	 * 売上計上
	 *
	 * @param $orderHash 受注情報
	 * @return array $ret string
	 */
	function exec1Capture($orderHash, $admin = false) {
		$objectMdl =& SLN::getInstance();
		$slnSettingHash = $objectMdl->getConfigs();

		$orderHash = SLN_Util::getOrderPayHash($orderHash['order_id']);

		if ($orderHash[SLN_ORDER_COL_PAYID] == SLN_PAYID_CREDIT
		|| $orderHash[SLN_ORDER_COL_PAYID] == SLN_PAYID_REGIST_CREDIT) {

			$accessUrl = $slnSettingHash['credit_connection_place1']; //カード決済 オンライン取引(入力ボックス)

			$sendKeyHash = array(
					'MerchantId',
					'MerchantPass',
					'TenantId',
					'TransactionDate',
					'OperateId',
					'ProcessId',
					'ProcessPass',
					'SalesDate',
					'MerchantFree1',
					'MerchantFree2',
					'MerchantFree3',
			);

			$paramHash['OperateId'] = '1Capture';

		} else {
			$msg = '決済確定できません。確定処理に対応していない決済です。';
			$this->setError($msg);
			return false;
		}

		// 登録済みカード（クイック含む）の場合は、KaiinId/KaiinPassを含める
		if ($orderHash[SLN_ORDER_COL_PAYID] == SLN_PAYID_REGIST_CREDIT) {
			$sendKeyHash[] = 'KaiinId';
			$sendKeyHash[] = 'KaiinPass';
		}

		$sendDataHash = $this->getSendData($sendKeyHash, $orderHash, $paramHash, $slnSettingHash);

		$ret = $this->accessSlnServer($accessUrl, $sendDataHash, $admin);
		if (!$ret || (!SC_Utils::isBlank($this->getError()))) {
		
		    $results = $this->getResults();
		   
		    if ($results['ResponseCd'] == "K80") {//バグ対応
		        
		        $this->arrError = array();
		        $this->request_error = null;
		        $this->netError = false;
		        $this->arrResults = null;
		        
		        $sendKeyHash[] = 'KaiinId';
		        $sendKeyHash[] = 'KaiinPass';
		        
		        $sendDataHash = $this->getSendData($sendKeyHash, $orderHash, $paramHash, $slnSettingHash);
		        
		        $ret = $this->accessSlnServer($accessUrl, $sendDataHash, $admin);
		        if (!$ret || (!SC_Utils::isBlank($this->getError()))) {
		            return false;
		        }
		    } else {
		        return false;
		    }
		}

		$arrResults = $this->getResults();

		$arrResults['pay_status'] = SLN_PAY_STATUS_COMMIT;

		SLN_Util::setOrderPayHash($orderHash, $arrResults);

		return true;
	}

	/**
	 * 再オーソリ設定
	 *
	 * @param $orderHash 受注情報
	 * @return array $ret string
	 */
	function exec1ReAuth($orderHash, $admin = false) {
		$objectMdl =& SLN::getInstance();
		$slnSettingHash = $objectMdl->getConfigs();

		$orderHash = SLN_Util::getOrderPayHash($orderHash['order_id']);

		if ($orderHash['pay_status'] != SLN_PAY_STATUS_VOID) {
			$msg = '決済エラーが発生しました。取り消されていない注文は再オーソリ出来ません。';
			$this->setError($msg);
			return false;
		}

		if (!($orderHash[SLN_ORDER_COL_PAYID] == SLN_PAYID_CREDIT
				|| $orderHash[SLN_ORDER_COL_PAYID] == SLN_PAYID_REGIST_CREDIT
		)) {
			$msg = '決済エラーが発生しました。再オーソリはクレジットカード決済のみ対応しています。';
			$this->setError($msg);
			return false;
		}

		// 最初の状態の確認
		$firstOperateId = null;
		$safeOperateIds = array('1Auth', '1Gathering');
		foreach ($orderHash['payment_log'] as $paymentLogArray) {
			foreach ($paymentLogArray as $paymentLog) {
				if ($paymentLog['ResponseCd'] != 'OK') continue;
				if (in_array($paymentLog['OperateId'], $safeOperateIds)) {
					$firstOperateId = $paymentLog['OperateId'];
					break 2;
				}
			}
		}
		if ($firstOperateId == null) {
			$msg = '決済エラーが発生しました。取り消し前の状態が確認出来ません。';
			$this->setError($msg);
			return false;
		}

		$accessUrl = $slnSettingHash['credit_connection_place1']; //カード決済 オンライン取引(入力ボックス)

		$sendKeyHash = array(
				'MerchantId',
				'MerchantPass',
				'TenantId',
				'TransactionDate',
				'OperateId',
				'ProcessId',
				'ProcessPass',
				'SalesDate',
				'Amount',
				'MerchantFree1',
				'MerchantFree2',
				'MerchantFree3',
		);

		$paramHash['OperateId'] = '1ReAuth';

		// 登録済みカード（クイック含む）の場合は、KaiinId/KaiinPassを含める
		if ($orderHash[SLN_ORDER_COL_PAYID] == SLN_PAYID_REGIST_CREDIT) {
			$sendKeyHash[] = 'KaiinId';
			$sendKeyHash[] = 'KaiinPass';
		}

		$sendDataHash = $this->getSendData($sendKeyHash, $orderHash, $paramHash, $slnSettingHash);

		$ret = $this->accessSlnServer($accessUrl, $sendDataHash, $admin);
		if (!$ret || (!SC_Utils::isBlank($this->getError()))) {
		    
		    $results = $this->getResults();
		    
		    if ($results['ResponseCd'] == "K80") {//バグ対応
		        
		        $this->arrError = array();
		        $this->request_error = null;
		        $this->netError = false;
		        $this->arrResults = null;
		        
		        $sendKeyHash[] = 'KaiinId';
		        $sendKeyHash[] = 'KaiinPass';
		        
		        $sendDataHash = $this->getSendData($sendKeyHash, $orderHash, $paramHash, $slnSettingHash);
		        
		        $ret = $this->accessSlnServer($accessUrl, $sendDataHash, $admin);
		        if (!$ret || (!SC_Utils::isBlank($this->getError()))) {
		            return false;
		        }
		    } else {
		        return false;
		    }
		}

		$arrResults = $this->getResults();

		// 最初の取引種別によって仕訳
		switch ($firstOperateId) {
			case "1Auth":
				$arrResults['pay_status'] = SLN_PAY_STATUS_AUTH;
				break;
			case "1Gathering":
				$arrResults['pay_status'] = SLN_PAY_STATUS_CAPTURE;
				break;
		}

		SLN_Util::setOrderPayHash($orderHash, $arrResults);
		return true;
	}

	function exec1Delete($orderHash, $admin = false) {
		$objectMdl =& SLN::getInstance();
		$slnSettingHash = $objectMdl->getConfigs();

		$orderHash = SLN_Util::getOrderPayHash($orderHash['order_id']);

		if ($orderHash[SLN_ORDER_COL_PAYID] == SLN_PAYID_CREDIT
		|| $orderHash[SLN_ORDER_COL_PAYID] == SLN_PAYID_REGIST_CREDIT
		) {
			$accessUrl = $slnSettingHash['credit_connection_place1']; //カード決済 オンライン取引

			$sendKeyHash = array(
					'MerchantId',
					'MerchantPass',
					'TenantId',
					'TransactionDate',
					'OperateId',
					'ProcessId',
					'ProcessPass',
					'MerchantFree1',
					'MerchantFree2',
					'MerchantFree3',
			);

			$paramHash['OperateId'] = '1Delete';

		} else {
			$msg = '決済キャンセル・返品エラーが発生しました。キャンセル・返品処理に対応していない決済です。';
			$this->setError($msg);
			return false;
		}

		// 登録済みカード（クイック含む）の場合は、KaiinId/KaiinPassを含める
		if ($orderHash[SLN_ORDER_COL_PAYID] == SLN_PAYID_REGIST_CREDIT) {
			$sendKeyHash[] = 'KaiinId';
			$sendKeyHash[] = 'KaiinPass';
		}

		$sendDataHash = $this->getSendData($sendKeyHash, $orderHash, $paramHash, $slnSettingHash);
		$ret = $this->accessSlnServer($accessUrl, $sendDataHash, $admin);
		if (!$ret || (!SC_Utils::isBlank($this->getError()))) {
		    $results = $this->getResults();
		   
		    if ($results['ResponseCd'] == "K80") {//バグ対応
		        
		        $this->arrError = array();
		        $this->request_error = null;
		        $this->netError = false;
		        $this->arrResults = null;
		        
		        $sendKeyHash[] = 'KaiinId';
		        $sendKeyHash[] = 'KaiinPass';
		        
		        $sendDataHash = $this->getSendData($sendKeyHash, $orderHash, $paramHash, $slnSettingHash);
		        
		        $ret = $this->accessSlnServer($accessUrl, $sendDataHash, $admin);
		        if (!$ret || (!SC_Utils::isBlank($this->getError()))) {
		            return false;
		        }
		    } else {
		        return false;
		    }
		}

		$arrResults = $this->getResults();

		$arrResults['pay_status'] = SLN_PAY_STATUS_VOID;

		SLN_Util::setOrderPayHash($orderHash, $arrResults);
		return true;
	}
}