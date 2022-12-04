<?php
require_once(SLN_CLASS_PATH . 'SLN_C_RegistCredit.php');
require_once(SLN_CLASS_PATH . 'SLN_C_Member.php');
require_once(SLN_CLASS_PATH . 'SLN_C_Util.php');
require_once(SLN_CLASS_PATH . 'SLN_C_3DCredit.php');

/**
 * SLN_RegistCreditクラス（登録済みクレジットカードでの購入）
 *
 * @package ソニーペイメントサービス決済モジュール
 * @author Sony Payment Services Inc.
 * @version 2.0.0
*/
class SLN_RegistCredit {

	function initParam(&$objectFormParam, &$paymentHash, &$orderHash) {
		$objectFormParam->addParam("お支払い方法", "PayType", INT_LEN, 'n', array("MAX_LENGTH_CHECK", "GRAPH_CHECK"), "");
	}

	function getFormBloc() {
		$deviceTypeId = SC_Display::detectDevice();
		$objectMdl =& SLN::getInstance();
		$arrBlocId = $objectMdl->getSubData('bloc_setting');
		$blocId = $arrBlocId['sln_regist_credit'][ $deviceTypeId ];
		if (empty($blocId)) {
			return null;
		}
		$layout = new SC_Helper_PageLayout();
		$arrBloc = $layout->getBlocs($deviceTypeId, 'bloc_id = ?', array($blocId), true);
		return $arrBloc[0]['tpl_path'];
	}

	function updateOrderStatusNew($orderId, &$objectPurchase, $arrResults = null) {

		$objectQuery =& SC_Query::getSingletonInstance();
		$order_status = ORDER_NEW;

		if ($arrResults) {
		    // 即時売上時は入金済みにする
		    $objectMdl =& SLN::getInstance();
		    $slnSettingHash = $objectMdl->getConfigs();
		    if ($arrResults['OperateId'] ==  '1Gathering' && $slnSettingHash['card_order_pre_end'] == SLN_ORDER_PRE_END) $order_status = ORDER_PRE_END;
		}

		$objectQuery->begin();
		$sqlval = array();
		$objectPurchase->sfUpdateOrderStatus($orderId, $order_status, null, null, $sqlval);
		$objectQuery->commit();
	}

	function nextAction(&$objectPage, &$objectPurchase, &$objectFormParam, &$orderHash)
	{
		$objectPage->arrErr = $objectFormParam->checkError();
		if (!SC_Utils::isBlank($objectPage->arrErr)) {
			return;
		}
		
		if ($objectPage->arrConfigs['3d_pay'] == SLN_3D_PAY1) {
		    $objectClient = new SLN_C_3DCredit();
		    $objectClient->redirectMemPayment($orderHash, $objectFormParam->getHashArray());
		}

		$objectClient = new SLN_C_RegistCredit();
		$result = $objectClient->requestPayment($orderHash, $objectFormParam->getHashArray());
		if (!$result) {
			if (defined('BATCH') && BATCH) {
				$this->updateOrderStatusPayWait($orderHash['order_id'], $objectPurchase);
				$arrErr = $objectClient->getError();
				$message = '決済処理でエラーが発生しました。';
				$message .= ": order_id = {$orderHash['order_id']}";
				$message .= ': arrErr = ' . var_export($arrErr, true);
				throw new Exception($message);
			}
			$arrErr = $objectClient->getError();
			$objectPage->arrErr['payment'] = '※ 決済処理でエラーが発生しました。<br />' . implode('<br />', $arrErr);
			return;
		}

		$arrResults = $objectClient->getResults();
		$this->updateOrderStatusNew($orderHash['order_id'], $objectPurchase, $arrResults);
		$paramHash = SLN_Util::getOrderPayHash($orderHash['order_id']);
		$this->cardRegist($orderHash, $paramHash);
		if (defined('BATCH') && BATCH) {
			// nop
		}
		else {
			SC_Response::sendRedirect(SHOPPING_COMPLETE_URLPATH);
			$objectPage->actionExit();
		}
	}

	function loadAction(&$objectPage, &$orderHash)
	{
		$arrCustomer = SC_Helper_Customer::sfGetCustomerData($orderHash['customer_id']);
		$objectClientMember = new SLN_C_Member();
		$ret = $objectClientMember->searchCard($arrCustomer);
		if(!$ret || $objectClientMember->arrResults['KaiinStatus'] != 0) {
			$objectPage->arrErr['payment'] = '※ 登録済みクレジットカードが見つかりませんでした。';
			return;
		}

		$objectPage->dataHash = $objectClientMember->arrResults;
		$objectSess = new SC_Session();
		if ($objectSess->GetSession('plg_slnquick_payment_confirm')) {
			$objectSess->SetSession('plg_slnquick_payment_confirm', false);
			$objectPage->tpl_payment_onload = "isSubmitExec = false; fnModeSubmit('next','','');";
			$objectPage->tpl_is_loding = true;
		}else {
			$objectPage->tpl_is_loading = false;
		}
	}

	function returnAction(&$objectPurchase) {
		$objectPurchase->rollbackOrder($_SESSION['order_id'], ORDER_CANCEL, true);
		SC_Response::sendRedirect(SHOPPING_CONFIRM_URLPATH);
		SC_Response::actionExit();
	}

	function prepareObjectPage(&$objectPage)
	{
		$arrPayMethod = SLN_Util::getCreditPayMethod();
		$objectPage->arrPayMethod = array();
		foreach ($objectPage->arrConfigs['payKbnKaisu'] as $pay_method) {
			if(!SC_Utils::isBlank($arrPayMethod[$pay_method])) {
				$objectPage->arrPayMethod[$pay_method] = $arrPayMethod[$pay_method];
			}
		}
	}

	function actionByMode($mode, &$objectFormParam, &$orderHash, &$objectPage) {
		if (defined('BATCH') && BATCH) {
			// 設定に関わらず 3D を使わない。
			$objectPage->arrConfigs['3d_pay'] = SLN_3D_PAY2;
		}

		$this->prepareObjectPage($objectPage);
		$objectPurchase = new SC_Helper_Purchase();

		switch($mode) {
			case 'next':
				// POSTメソッド以外の場合は、決済処理を行わない
				if ($_SERVER['REQUEST_METHOD'] == 'POST') {
					$this->nextAction($objectPage, $objectPurchase, $objectFormParam, $orderHash);
				}
			case 'load':
				$this->loadAction($objectPage, $orderHash);
				break;
			case 'return':
				$this->returnAction($objectPurchase);
				break;
			case 'input':
				$objectPage->tpl_payment_onload = "fnModeSubmit('load','','');";
				$objectPage->tpl_is_loding = true;
				break;
			default:
				SC_Response::sendRedirect(ROOT_URLPATH . 'shopping/load_sln_payment_module.php?mode=input');
				SC_Response::actionExit();
				break;
		}
	}

	function cardRegist($orderHash, $paramHash = array())
	{
		$arrCustomer = SC_Helper_Customer::sfGetCustomerData($orderHash['customer_id']);

		$objectClientMember = new SLN_C_Member();
		$ret = $objectClientMember->searchCard($arrCustomer);
		if (!$ret ||  $objectClientMember->arrResults['KaiinStatus'] != 0) {
			return;
		}

		$objectClient = new SLN_C_Util();
		$objectClient->exec4MemAdd($orderHash, $paramHash);
	}

    /**
     * 対応状況を「入金待ち」に更新する。
     * 
     * 決済に失敗を意味する。
     */
	function updateOrderStatusPayWait($orderId, &$objectPurchase) {
		$objectQuery =& SC_Query::getSingletonInstance();

		$objectQuery->begin();
		$objectPurchase->sfUpdateOrderStatus($orderId, ORDER_PAY_WAIT);
		$objectQuery->commit();
	}
}