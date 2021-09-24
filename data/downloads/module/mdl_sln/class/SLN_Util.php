<?php
require_once(MODULE_REALDIR . 'mdl_sln/defines.php');

/**
 * SLN_Utilクラス（いろいろと追加しておく）
 *
 * @package ソニーペイメントサービス決済モジュール
 * @author Sony Payment Services Inc.
 * @version 2.0.0
*/
class SLN_Util {

	/**
	 * 支払回数
	 *
	 * @param 支払回数(決済モジュール管理設定から取得)配列
	 */
	function getCreditPayMethod() {

		//EC-CUBE
		$arrPayMethod = array(
				'01' => '一括払い',
				'02' => '分割払い(2回)',
				'03' => '分割払い(3回)',
				'04' => '分割払い(4回)',
				'05' => '分割払い(5回)',
				'06' => '分割払い(6回)',
				'07' => '分割払い(7回)',
				'08' => '分割払い(8回)',
				'09' => '分割払い(9回)',
				'10' => '分割払い(10回)',
				'11' => '分割払い(11回)',
				'12' => '分割払い(12回)',
				'15' => '分割払い(15回)',
				'16' => '分割払い(16回)',
				'18' => '分割払い(18回)',
				'20' => '分割払い(20回)',
				'24' => '分割払い(24回)',
				'30' => '分割払い(30回)',
				'36' => '分割払い(36回)',
				'48' => '分割払い(48回)',
				'54' => '分割払い(54回)',
				'60' => '分割払い(60回)',
				'72' => '分割払い(72回)',
				'80' => 'ボーナス一括払い',
				'88' => 'リボルビング払い',
		);

		return $arrPayMethod;
	}

	function getPaymentTypeNames() {
		return array(
				SLN_PAYID_CREDIT => SLN_PAYNAME_CREDIT,
				SLN_PAYID_REGIST_CREDIT => SLN_PAYNAME_REGIST_CREDIT,
				SLN_PAYID_CVS => SLN_PAYNAME_CVS,
		);
	}

	function getPaymentTypeCodes() {
		return array(
				SLN_PAYID_CREDIT => SLN_PAYCODE_CREDIT,
				SLN_PAYID_REGIST_CREDIT => SLN_PAYCODE_REGIST_CREDIT,
				SLN_PAYID_CVS => SLN_PAYCODE_CVS,
		);

	}

	function setOrderPayHash($orderHash, $dataHash) {
		if(isset($dataHash[0]) and is_array($dataHash[0])) {
			$tempHash = $dataHash[0];
			unset($dataHash[0]);
			$dataHash = array_merge((array)$dataHash, (array)$tempHash);
		}

		$objectPurchase = new SC_Helper_Purchase();

		$objectQuery =& SC_Query::getSingletonInstance();
		$objectQuery->begin();
		$sqlval = array();

		$orderHash = $objectPurchase->getOrder($orderHash['order_id']);
		if (SC_Utils::isBlank($orderHash[SLN_ORDER_COL_PAYLOG])) {
			$arrLog = array();
		} else {
			$arrLog = unserialize($orderHash[SLN_ORDER_COL_PAYLOG]);
		}
		$arrLog[] = array( date('Y-m-d H:i:s') => $dataHash );
		$sqlval[SLN_ORDER_COL_PAYLOG] = serialize($arrLog);

		if (SC_Utils::isBlank($orderHash[SLN_ORDER_COL_PAYDATA])) {
			$payDataHash = array();
		} else {
			$payDataHash = unserialize($orderHash[SLN_ORDER_COL_PAYDATA]);
		}

		foreach ($dataHash as $key => $val) {
			if (SC_Utils::isBlank($val) && !SC_Utils::isBlank($payDataHash[$key])) {
				unset($dataHash[$key]);
			}
		}

		$payDataHash = array_merge($payDataHash, (array)$dataHash);

		$sqlval[SLN_ORDER_COL_PAYDATA] = serialize($payDataHash);

		if (!SC_Utils::isBlank($dataHash['pay_status'])) {
			$sqlval[SLN_ORDER_COL_PAYSTATUS] = $dataHash['pay_status'];
		}

		if (!SC_Utils::isBlank($dataHash['TransactionId'])) {
			$sqlval[SLN_ORDER_COL_TRANSACTIONID] = $dataHash['TransactionId'];
		}

		$newStatus = null;
		$objectPurchase->sfUpdateOrderStatus($orderHash['order_id'], $newStatus, null, null, $sqlval);

		$objectQuery->commit();
	}

	function getOrderPayHash($order_id) {
		$objectPurchase = new SC_Helper_Purchase();
		$orderHash = $objectPurchase->getOrder($order_id);
		if ($orderHash['del_flg'] == '1') {
			return false;
		}

		$payDataHash = array();
		if (!SC_Utils::isBlank($orderHash[SLN_ORDER_COL_PAYDATA])) {
			$payDataHash = unserialize($orderHash[SLN_ORDER_COL_PAYDATA]);
		}

		$payDataHash['payment_log'] = array();
		if (!SC_Utils::isBlank($orderHash[SLN_ORDER_COL_PAYLOG])) {
			$payDataHash['payment_log'] = unserialize($orderHash[SLN_ORDER_COL_PAYLOG]);
		}

		if(isset($payDataHash[0]) && is_array($payDataHash[0])) {
			$tempHash = $payDataHash[0];
			unset($payDataHash[0]);
			$dataHash = array_merge((array)$dataHash, (array)$tempHash);
		}
		$orderHash = array_merge($orderHash, (array)$payDataHash);
		return $orderHash;
	}

	function getOrderPayHashByTransactionId($transactionId) {

		// トランザクションIDからの受注情報を取得する
		$objectQuery =& SC_Query_Ex::getSingletonInstance();
		$where = SLN_ORDER_COL_TRANSACTIONID . ' = ?';
		$valueHash = array($transactionId);
		$orderHash = $objectQuery->getRow('*', 'dtb_order', $where, $valueHash);

		if (SC_Utils::isBlank($orderHash[SLN_ORDER_COL_PAYDATA])) {
			$payDataHash = array();
		} else {
			$payDataHash = unserialize($orderHash[SLN_ORDER_COL_PAYDATA]);
		}
		if (SC_Utils::isBlank($orderHash[SLN_ORDER_COL_PAYLOG])) {
			$payDataHash['payment_log'] = array();
		} else {
			$payDataHash['payment_log'] = unserialize($orderHash[SLN_ORDER_COL_PAYLOG]);
		}
		if(isset($payDataHash[0]) and is_array($payDataHash[0])) {
			$tempHash = $payDataHash[0];
			unset($payDataHash[0]);
			$dataHash = array_merge((array)$dataHash, (array)$tempHash);
		}
		$orderHash = array_merge($orderHash, (array)$payDataHash);
		return $orderHash;
	}

	function getPaymentHash($payment_id) {
		$objectQuery =& SC_Query::getSingletonInstance();
		$dataHash = $objectQuery->getRow('*', 'dtb_payment', 'payment_id = ?', array($payment_id));

		$arrPaymentCode = SLN_Util::getPaymentTypeCodes();
		$dataHash['payment_code'] = $arrPaymentCode[$dataHash[SLN_PAYMENT_COL_PAYID]];
		return $dataHash;
	}

	function getPaymentHash_SecCd($module_id) {
		$objectQuery_secCd =& SC_Query::getSingletonInstance();
		$dataHash_secCd = $objectQuery_secCd->getRow('*', 'dtb_module', 'module_id = ?', array($module_id));

		$arrPaymentCode_secCd = SLN_Util::getPaymentTypeCodes();
		$dataHash_secCd['payment_code'] = $arrPaymentCode_secCd[$dataHash_secCd[sub_data]];
		return $dataHash_secCd;
	}

	function getPaymentTypeConfig_SecCd($module_id) {
		$dataHash_secCd = SLN_Util::getPaymentHash_SecCd($module_id);
		if (!SC_Utils::isBlank($dataHash_secCd[sub_data])) {
			$dataHash_secCd = array_merge($dataHash_secCd, unserialize($dataHash_secCd[sub_data]));
		}
		return $dataHash_secCd;
	}

	function getPayments() {
		$objectMdl =& SLN::getInstance();
		$objectQuery =& SC_Query::getSingletonInstance();
		$arrVal = array(SLN_CODE);
		$objectQuery->setOrder('rank desc');
		return $objectQuery->select('*', 'dtb_payment', 'module_code = ? AND del_flg = 0', $arrVal);
	}

	function getShouhinName($order_id) {
		$orderHashDetail = SC_Helper_Purchase::getOrderDetail($order_id, false);
		return mb_substr(mb_convert_kana($orderHashDetail[0]['product_name'], 'KVSA', 'UTF-8'),0,16); // 全角32バイトまで
	}

	function getActivePayMethod($payKbnKaisu) {
		$arrPayMethod = SLN_Util::getCreditPayMethod();
		$payMethodHash = array();
		foreach ($payKbnKaisu as $pay_method) {
			if(!SC_Utils::isBlank($arrPayMethod[$pay_method])) {
				$payMethodHash[$pay_method] = $arrPayMethod[$pay_method];
			}
		}

		return $payMethodHash;
	}

	function setOrderIdToHash($orderHash) {
		$orderHash = SLN_Util::getOrderPayHash($orderHash['order_id']);
		if (SC_Utils::isBlank($orderHash['OrderID'])) {
			$orderHash['OrderID'] = $orderHash['order_id'] . '-' . date('dHis');
		}
		return $orderHash;
	}
	
	/**
	 * mb_convert_kanaの"A"(半角英数字→全角変換)が効かない記号について手動で変換する
	 */
	function replaceMbConvertKanaA($objectForm, $arrKeynames){
		// mb_convert_kanaの"A"が効かない記号
		$arrMbConvertKanaAStrBefore = array(
			'"',
			'\'',
			'\\',
			'~',
		);
		// 対応する全角文字
		$arrMbConvertKanaAStrAfter = array(
			'＂',
			'＇',
			'＼',
			'～',
		);
		foreach ($arrKeynames as $key) {
			$objectForm->setValue($key, str_replace($arrMbConvertKanaAStrBefore, $arrMbConvertKanaAStrAfter, $objectForm->getValue($key)));
		}
	}
	
	/**
	 * 入力された値が配列と一致するかをチェック
	 */
	function checkAllowedParams($name, $value, $allow, $disp ,&$arrErr){
		if ($value === "") {
			return;
		}
		
		if (is_array($value)) {
			foreach ($value as $v) {
				if(!array_key_exists($v, $allow)){
					$arrErr[$name] = '※ ' . $disp . 'が不正な値です。<br />';
				}
			}
		} else {
			if(!array_key_exists($value, $allow)){
				$arrErr[$name] = '※ ' . $disp . 'が不正な値です。<br />';
			}
		}
	}
}