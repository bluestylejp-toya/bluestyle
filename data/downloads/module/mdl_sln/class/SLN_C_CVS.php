<?php
require_once(MODULE_REALDIR . 'mdl_sln/defines.php');
require_once(SLN_CLASS_PATH . 'SLN_C_Base.php');

/**
 * SLN_C_CVSクラス（収納代行用）
 *
 * @package ソニーペイメントサービス決済モジュール
 * @author Sony Payment Services Inc.
 * @version 2.0.0
*/
class SLN_C_CVS extends SLN_C_Base {

	function requestPayment($orderHash, $paramHash) {

		$objectMdl =& SLN::getInstance();
		$slnSettingHash = $objectMdl->getConfigs();

		$accessUrl = $slnSettingHash['credit_connection_place5']; //オンライン取引接続用URL(入力ボックス)

		$sendKeyHash = array(
				'MerchantId',
				'MerchantPass',
				'TenantId',
				'TransactionDate',
				'OperateId',
				'OrderID',
				'Amount',
				'NameKanji',
				'NameKana',
				'TelNo',
				'PayLimit',
				'ShouhinName',
				'Comment',
				'ReturnURL',
				'MerchantFree1',
				'MerchantFree2',
				'MerchantFree3',
				'Free1',
				'Free2',
				'Free3',
				'Free4',
				'Free5',
				'Free6',
				'Free7',
				'Free8',
				'Free9',
				'Free10',
				'Free11',
				'Free12',
				'Free13',
				'Free14',
				'Free15',
				'Free16',
				'Free17',
				'Free18',
				'Free19',
				'Title',
		);

		$paramHash['OperateId']			= '2Add';
		$paramHash['pay_status']			= SLN_PAY_STATUS_UNSETTLED;
		$paramHash['success_pay_status'] = SLN_PAY_STATUS_REQUEST_SUCCESS;
		$paramHash['fail_pay_status']	= SLN_PAY_STATUS_FAIL;

		$ret = $this->orderRequest($accessUrl, $sendKeyHash, $orderHash, $paramHash, $slnSettingHash);
		if (!$ret) {
			SC_Utils_Ex::sfDispSiteError(FREE_ERROR_MSG, '', false, '※ 決済でエラーが発生しました。<br />' . implode('<br />', $this->getError()));

		}

		$arrResult = $this->getResults();

		if (SC_Display::detectDevice() !== DEVICE_TYPE_MOBILE) {
			$accessUrl = $slnSettingHash['credit_connection_place3']; //PC用支払先選択画面リダイレクトURL(入力ボックス)
		} else {
			$accessUrl = $slnSettingHash['credit_connection_place4']; //モバイル用支払先選択画面リダイレクトURL(入力ボックス)
		}

		// URLが空であれば、そのまま決済画面に遷移させてしまう。
		if ($accessUrl == '') {
			$accessUrl = HTTP_URL . SHOPPING_COMPLETE_URLPATH;
		} else {
			$accessUrl .= '?code='. $arrResult['FreeArea']. '&rkbn=1';
		}

		header("HTTP/1.1 301 Moved Permanently");
		header("Location: ".$accessUrl);
	}
}