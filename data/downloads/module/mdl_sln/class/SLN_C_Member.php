<?php
require_once(MODULE_REALDIR . 'mdl_sln/defines.php');
require_once(SLN_CLASS_PATH . 'SLN_C_Base.php');
require_once(SLN_CLASS_PATH . 'CryptAES.php');

/**
 * SLN_C_Memberクラス（登録済みクレジットカード）
 *
 * @package ソニーペイメントサービス決済モジュール
 * @author Sony Payment Services Inc.
 * @version 2.0.0
*/
class SLN_C_Member extends SLN_C_Base {

	function searchCard($arrCustomer, $paramHash = array()) {
		if (SC_Utils::isBlank($arrCustomer['customer_id']) || $arrCustomer['customer_id'] == '0') {
			return true;
		}

		$objectMdl =& SLN::getInstance();
		$slnSettingHash = $objectMdl->getConfigs();

		$accessUrl = $slnSettingHash['credit_connection_place2'];

		$sendKeyHash = array(
				'MerchantId',
				'MerchantPass',
				'TenantId',
				'TransactionDate',
				'OperateId',
				'KaiinId',
				'KaiinPass',
				'MerchantFree2',
				'MerchantFree3',
		);

		$paramHash['OperateId'] = '4MemRefM';

		$sendDataHash = $this->getSendData($sendKeyHash, $arrCustomer, $paramHash, $slnSettingHash);

		$ret = $this->accessSlnServer($accessUrl, $sendDataHash, $admin);
		if (!$ret || (!SC_Utils::isBlank($this->getError()))) {
			return false;
		}

		return true;
	}

	function deleteMember($arrCustomer) {
		$objectMdl =& SLN::getInstance();
		$slnSettingHash = $objectMdl->getConfigs();

		$accessUrl = $slnSettingHash['credit_connection_place2'];

		$sendKeyHash = array(
				'MerchantId',
				'MerchantPass',
				'TenantId',
				'TransactionDate',
				'OperateId',
				'KaiinId',
				'KaiinPass',
				'MerchantFree2',
				'MerchantFree3',
		);

		$paramHash['OperateId'] = '4MemDel';

		$sendDataHash = $this->getSendData($sendKeyHash, $arrCustomer, $paramHash, $slnSettingHash);

		$ret = $this->accessSlnServer($accessUrl, $sendDataHash, $admin);
		if (!$ret || (!SC_Utils::isBlank($this->getError()))) {
			return false;
		}

		return true;
	}

	function unInvalCard($arrCustomer) {
		$objectMdl =& SLN::getInstance();
		$slnSettingHash = $objectMdl->getConfigs();

		$accessUrl = $slnSettingHash['credit_connection_place2'];

		$sendKeyHash = array(
				'MerchantId',
				'MerchantPass',
				'TenantId',
				'TransactionDate',
				'OperateId',
				'KaiinId',
				'KaiinPass',
				'MerchantFree2',
				'MerchantFree3',
		);

		$paramHash['OperateId'] = '4MemUnInval';

		$sendDataHash = $this->getSendData($sendKeyHash, $arrCustomer, $paramHash, $slnSettingHash);

		$ret = $this->accessSlnServer($accessUrl, $sendDataHash, $admin);
		if (!$ret || (!SC_Utils::isBlank($this->getError()))) {
			return false;
		}

		return true;
	}

	function invalCard($arrCustomer) {
		$objectMdl =& SLN::getInstance();
		$slnSettingHash = $objectMdl->getConfigs();

		$accessUrl = $slnSettingHash['credit_connection_place2'];

		$sendKeyHash = array(
				'MerchantId',
				'MerchantPass',
				'TenantId',
				'TransactionDate',
				'OperateId',
				'KaiinId',
				'KaiinPass',
				'MerchantFree2',
				'MerchantFree3',
		);

		$paramHash['OperateId'] = '4MemInval';

		$sendDataHash = $this->getSendData($sendKeyHash, $arrCustomer, $paramHash, $slnSettingHash);

		$ret = $this->accessSlnServer($accessUrl, $sendDataHash, $admin);
		if (!$ret || (!SC_Utils::isBlank($this->getError()))) {
			return false;
		}

		return true;
	}

	function saveCard($arrCustomer, $paramHash, $reUrl = null) {
		$objectMdl =& SLN::getInstance();
		$slnSettingHash = $objectMdl->getConfigs();

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
		        'Token',
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

		$sendDataHash = $this->getSendData($sendKeyHash, $arrCustomer, $paramHash, $slnSettingHash);

		if ($slnSettingHash['3d_pay'] == SLN_3D_PAY1 && $slnSettingHash['credit_connection_place6'] && false) {
		    /*
		     * 削除予定
		    $CryptAES = new CryptAES();
		    $CryptAES->setKey($slnSettingHash['credit_aes_key']);
		    $CryptAES->setIv($slnSettingHash['credit_aes_iv']);
		    
		    $this->mypageRedirect($slnSettingHash['credit_connection_place6'], $sendDataHash, $CryptAES, $reUrl);
		    */
		} else {
		    $ret = $this->accessSlnServer($accessUrl, $sendDataHash, $admin);
		    
		    if (!$ret || (!SC_Utils::isBlank($this->getError()))) {
		        return false;
		    }   
		}

		return true;
	}

	function changeCard($arrCustomer, $paramHash, $reUrl = null) {
		$objectMdl =& SLN::getInstance();
		$slnSettingHash = $objectMdl->getConfigs();

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
		        'Token',
				'MerchantFree2',
				'MerchantFree3',
		);

		$paramHash['OperateId'] = '4MemChg';

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

		$sendDataHash = $this->getSendData($sendKeyHash, $arrCustomer, $paramHash, $slnSettingHash);
        
		if ($slnSettingHash['3d_pay'] == SLN_3D_PAY1 && $slnSettingHash['credit_connection_place6'] && false) {
		    /*
		     * 削除予定
		    $CryptAES = new CryptAES();
		    $CryptAES->setKey($slnSettingHash['credit_aes_key']);
		    $CryptAES->setIv($slnSettingHash['credit_aes_iv']);
		
		    $this->mypageRedirect($slnSettingHash['credit_connection_place6'], $sendDataHash, $CryptAES, $reUrl);
		    */
		} else {
		    $ret = $this->accessSlnServer($accessUrl, $sendDataHash, $admin);
		    
		    if (!$ret || (!SC_Utils::isBlank($this->getError()))) {
		        return false;
		    }   
		}

		return true;
	}

	/**
	 * カードチェック (1Check)
	 *
	 * unInvalCard() を基に実装。
	 */
	function checkCard($arrCustomer) {
		$objectMdl =& SLN::getInstance();
		$slnSettingHash = $objectMdl->getConfigs();

		$accessUrl = $slnSettingHash['credit_connection_place1'];

		$sendKeyHash = array(
			'MerchantId',
			'MerchantPass',
			'TenantId',
			'TransactionDate',
			'OperateId',
			'KaiinId',
			'KaiinPass',
			'MerchantFree2',
			'MerchantFree3',
		);

		$paramHash['OperateId'] = '1Check';

		$sendDataHash = $this->getSendData($sendKeyHash, $arrCustomer, $paramHash, $slnSettingHash);

		$ret = $this->accessSlnServer($accessUrl, $sendDataHash, $admin);
		if (!$ret || (!SC_Utils::isBlank($this->getError()))) {
			return false;
		}

		return true;
	}
}