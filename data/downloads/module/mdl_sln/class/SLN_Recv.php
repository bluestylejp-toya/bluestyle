<?php
require_once CLASS_EX_REALDIR . 'page_extends/LC_Page_Ex.php';
require_once(MODULE_REALDIR . 'mdl_sln/defines.php');

/**
 * SLN_Recvクラス（収納代行の通知受け実処理）
 *
 * @package ソニーペイメントサービス決済モジュール
 * @author Sony Payment Services Inc.
 * @version 2.0.0
*/
class SLN_Recv extends LC_Page_Ex {

	var $objectMdl;
	var $arrConfigs;

	function init() {

		//キャッシュしない(念のため)
		header("Paragrama: no-cache");

		// ブラウザテスト用
		$_POST[TRANSACTION_ID_NAME] = $_REQUEST[TRANSACTION_ID_NAME] = $_SESSION[TRANSACTION_ID_NAME] = SC_Helper_Session_Ex::getToken();

		parent::init();
	}

	function process() {
		$this->action();
	}

	function action() {
		$objectFormParam = new SC_FormParam();
		$this->initParam($objectFormParam);
		$objectFormParam->setParam($_REQUEST);
		$objectFormParam->convParam();
		$arrErr = $this->checkError($objectFormParam);
		if (SC_Utils::isBlank($arrErr)) {
			$transactionId = $objectFormParam->getValue('TransactionId');
			if (SC_Utils_Ex::isBlank($transactionId)) {
				$this->sendMailNoOrder($objectFormParam->getHashArray());
				echo '1';
				SC_Response::actionExit();
			}

			$orderHash = SLN_Util::getOrderPayHashByTransactionId($transactionId);

			if (SC_Utils::isBlank($orderHash)) {
				$this->sendMailNoOrder($objectFormParam->getHashArray());
				echo '1';
				SC_Response::actionExit();
			}

			$res = $this->execReceive($objectFormParam->getHashArray(), $orderHash);
			if($res) {
				echo '0';
			} else {
				echo '1';
			}

			SC_Response::actionExit();
		} else {
			$this->sendMailNoOrder($objectFormParam->getHashArray());
			echo '1';
			SC_Response::actionExit();
		}
	}

	function execReceive(&$paramHash, &$orderHash) {

		$order_status = null;
		$sqlval = array('del_flg' => 0);
		$order_status = ORDER_PRE_END;
		$paramHash['pay_status'] = SLN_PAY_STATUS_PAY_SUCCESS;

		$objectPurchase = new SC_Helper_Purchase();
		$objectQuery =& SC_Query::getSingletonInstance();
		$objectQuery->begin();
		$objectPurchase->sfUpdateOrderStatus($orderHash['order_id'], $order_status, null, null, $sqlval);
		$objectQuery->commit();

		unset($paramHash['MerchantPass']);
		$paramHash['Convenience'] = $paramHash['CvsCd'];
		SLN_Util::setOrderPayHash($orderHash, $paramHash);

		return true;
	}


	function getOrderId($param_OrderID) {
		list($order_id, $dummy) = explode('-', $param_OrderID);
		if (SC_Utils::isBlank($order_id) && !SC_Utils::sfIsInt($order_id)) {
			return;
		} else {
			return $order_id;
		}
	}

	function initParam(&$objectFormParam) {
		$objectFormParam->addParam("MerchantId", "MerchantId", 13, 'a', array("MAX_LENGTH_CHECK", "ALNUM_CHECK", "EXIST_CHECK"));
		$objectFormParam->addParam("TransactionId", "TransactionId", 27, 'a', array("MAX_LENGTH_CHECK", "GRAPH_CHECK", "EXIST_CHECK"));
		$objectFormParam->addParam("CvsCd", "CvsCd", 5, 'a', array("MAX_LENGTH_CHECK", "GRAPH_CHECK"));
	}

	function checkError(&$objectFormParam) {
		$errorObject = new SC_CheckError($objectFormParam->getHashArray());
		$errorObject->arrErr = $objectFormParam->checkError();
		$objectMdl =& SLN::getInstance();
		$slnSettingHash = $objectMdl->getConfigs();
		if ($objectFormParam->getValue('MerchantId') != $slnSettingHash['MerchantId']) {
			$errorObject->arrErr['MerchantId'] = '※MerchantIdが一致しません。';
		}
		return $errorObject->arrErr;
	}

	function sendMailNoOrder($paramHash) {
		if (!SC_Utils::isBlank($paramHash['ErrCode']) and !SC_Utils::isBlank($paramHash['ErrInfo'])){
			return;
		}

		$paramHash['order_id'] = $this->getOrderId($paramHash['OrderID']);

		$objectPage = new LC_Page_Ex();
		$objectPage->paramHash = $paramHash;
		$objectPage->orderHash = $orderHash;

		$objectMailView = new SC_SiteView();
		$basicHash = SC_Helper_DB::sfGetBasisData();
		$objectMailView->assignobj($objectPage);

		$tplpath = SLN_TEMPLATE_PATH . 'mail/sln_no_order.tpl';
		$body = $objectMailView->fetch($tplpath);

		// 管理者に通知する
		$objectSendMail = new SC_SendMail();
		$objectSendMail->setItem($basicHash['email02'], ' 不一致データ検出', $body, $basicHash['email03'], $basicHash['shop_name'], $from, $basicHash['email04'], $basicHash['email04']);
		$objectSendMail->sendMail();
	}
}