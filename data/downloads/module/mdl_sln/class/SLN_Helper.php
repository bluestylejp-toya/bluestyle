<?php
require_once(MODULE_REALDIR . 'mdl_sln/defines.php');
require_once CLASS_EX_REALDIR . 'page_extends/LC_Page_Ex.php';

/**
 * SLN_Helperクラス（本体のクラスを上書き）
 *
 * @package ソニーペイメントサービス決済モジュール
 * @author Sony Payment Services Inc.
 * @version 2.0.0
 */
class SLN_Helper extends LC_Page_Ex {

	var $type;
	var $objectMdl;
	var $arrConfigs;

	function SLN_Helper() {
		$this->objectMdl =& SLN::getInstance();
		$this->arrConfigs = $this->objectMdl->getConfigs();
	}

	function init() {
		parent::init();
		$this->httpCacheControl('nocache');
	}

	function process() {
		$this->action();
		$this->sendResponse();
	}

	function action() {
		$objectSiteSess = new SC_SiteSession();
		$objectPurchase = new SC_Helper_Purchase();
		$objectCartSess = new SC_CartSession();
		$objectFormParam = new SC_FormParam();

		$order_id = $this->getOrderId();
		if (SC_Utils::isBlank($order_id)) {
			return SC_Utils::sfDispSiteError(FREE_ERROR_MSG, "", true, "例外エラーが発生しました。<br />注文情報の取得が出来ませんでした。");
		}

		$orderHash = $objectPurchase->getOrder($order_id);
		switch ($orderHash['status']) {
			case ORDER_PENDING:
				break;
			case ORDER_NEW:
			case ORDER_PRE_END:
				SC_Response::sendRedirect(SHOPPING_COMPLETE_URLPATH);
				SC_Response::actionExit();
				break;
			case ORDER_PAY_WAIT:
				if ($this->getMode() != 'pgreturn') {
					SC_Response::sendRedirect(SHOPPING_COMPLETE_URLPATH);
					SC_Response::actionExit();
				}
				break;
			default:
				if ($this->getMode() != 'pgreturn' && !SC_Utils::isBlank($orderHash['status'])) {
					SC_Utils::sfDispSiteError(FREE_ERROR_MSG, "", true, "例外エラーが発生しました。<br />注文情報が無効です。");
					SC_Response::actionExit();
				}
				break;
		}

		$paymentHash = SLN_Util::getPaymentHash($orderHash['payment_id']);
		if (SC_Utils::isBlank($paymentHash['payment_code'])) {
			SC_Utils::sfDispSiteError(FREE_ERROR_MSG, "", true, "例外エラーが発生しました<br />注文情報の決済方法と決済モジュールの設定が一致していません。<br />この手続きは無効となりました。<br />管理者に連絡をして下さい。");
			SC_Response::actionExit();
		}

		$this->updateOrderStatus($orderHash['order_id'], $paymentHash);

		$this->bootPaymentClass($objectFormParam, $paymentHash, $orderHash);
	}

	function lfSetToken(&$arrOrder, $pay_id) {
	}


	function getOrderId() {
		if (!SC_Utils::isBlank($_SESSION['order_id'])) {
			$order_id = $_SESSION['order_id'];
		} else if (!SC_Utils::isBlank($_REQUEST['order_id']) && SC_Utils::sfIsInt($_REQUEST['order_id'])) {
			$_SESSION['order_id'] = $order_id = $_REQUEST['order_id'];
		}
		return $order_id;
	}

	function updateOrderStatus($order_id, $paymentHash) {
		$objPurchase = new SC_Helper_Purchase();
		$sqlval[SLN_ORDER_COL_TRANSID] = SC_Helper_Session::getToken();
		$sqlval[SLN_ORDER_COL_PAYID] = $paymentHash[SLN_PAYMENT_COL_PAYID];
		$objQuery =& SC_Query::getSingletonInstance();
		$objQuery->begin();
		$objPurchase->sfUpdateOrderStatus($order_id, null, null, null, $sqlval);
		$objQuery->commit();
	}

	function bootPaymentClass($objectFormParam, $paymentHash, $orderHash) {
		$helper_name = 'SLN_' . $paymentHash['payment_code'];
		require_once(SLN_CLASS_PATH . $helper_name . '.php');
		$objectPageHelper = new $helper_name;
		$objectPageHelper->initParam($objectFormParam, $paymentHash, $orderHash);

		$objectFormParam->setParam($paymentHash);
		$objectFormParam->setParam($_REQUEST);
		$objectFormParam->convParam();

		$this->tpl_url = "?";
		if(SC_Display::detectDevice() === DEVICE_TYPE_SMARTPHONE) {
			$this->tpl_url = ROOT_URLPATH . 'shopping/load_sln_payment_module.php';
		}
		if (SC_Display::detectDevice() === DEVICE_TYPE_MOBILE) {
			if ($this->getMode() == '') $_REQUEST['mode'] = 'default';
		}

		$this->tpl_title = $orderHash['payment_method'];

		$this->paymentHash = $paymentHash;
		$objectPageHelper->actionByMode($this->getMode(), $objectFormParam, $orderHash, $this);
		$this->tpl_form_bloc_path = $objectPageHelper->getFormBloc();
		$this->arrForm = $objectFormParam->getFormParamList();
	}
}