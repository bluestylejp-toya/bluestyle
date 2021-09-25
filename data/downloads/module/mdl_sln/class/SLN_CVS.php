<?php
require_once(SLN_CLASS_PATH . 'SLN_C_CVS.php');

/**
 * SLN_CVSクラス（収納代行用）
 *
 * @package ソニーペイメントサービス決済モジュール
 * @author Sony Payment Services Inc.
 * @version 2.0.0
*/
class SLN_CVS {

	function initParam(&$objectFormParam, &$paymentHash, &$orderHash) {
	}

	function getFormBloc() {
		return;
	}

	function actionByMode($mode, &$objectFormParam, &$orderHash, &$objectPage) {

		$objectPurchase = new SC_Helper_Purchase();

		// 決済実行
		$objectClient = new SLN_C_CVS();
		$result = $objectClient->requestPayment($orderHash, array());

		// 設定情報の取得
		$objectMdl =& SLN::getInstance();
		$slnSettingHash = $objectMdl->getConfigs();
		$orderHash = SLN_Util::getOrderPayHash($orderHash['order_id']);
		$sqlval['message'] = $orderHash['message'] .
		<<<MESSAGE


以下よりご利用される支払方法のURLをクリックするとお支払い時に必要な情報をご確認いただけます。

▼PCの場合
{$slnSettingHash['credit_connection_place3']}?code={$orderHash['FreeArea']}&rkbn=1
▼携帯電話の場合
{$slnSettingHash['credit_connection_place4']}?code={$orderHash['FreeArea']}&rkbn=1

※詳細な決済処理の流れは以下をご確認ください。
https://www.sonypaymentservices.jp/consider/cv/paymethod/

MESSAGE;
		$objectPurchase->sfUpdateOrderStatus($orderHash['order_id'], ORDER_NEW, null, null, $sqlval);
		// 注文完了メールの送信
		$objectPurchase->sendOrderMail($orderHash['order_id']);

		// 元のメッセージ内容で上書きする
		$sqlval['message'] = $orderHash['message'];
		$objectPurchase->sfUpdateOrderStatus($orderHash['order_id'], null, null, null, $sqlval);
		exit;
	}
}