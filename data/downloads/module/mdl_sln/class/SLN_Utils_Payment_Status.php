<?php
require_once(MODULE_REALDIR . 'mdl_sln/defines.php');
require_once(CLASS_REALDIR . "pages/admin/LC_Page_Admin.php");
require_once(SLN_CLASS_PATH . "SLN_Util.php");
require_once(SLN_CLASS_PATH . "SLN_C_Util.php");

/**
 * SLN_Utils_Payment_Statusクラス（管理画面追加ページ）
 *
 * @package ソニーペイメントサービス決済モジュール
 * @author Sony Payment Services Inc.
 * @version 2.0.0
*/
class SLN_Utils_Payment_Status extends LC_Page_Admin {


	function init() {
		parent::init();
		$this->tpl_mainpage = SLN_TEMPLATE_PATH . 'admin/sln_order_payment_body.tpl';
		$this->tpl_mainno = 'order';
		$this->tpl_subno = 'status';
		$this->tpl_pager = 'pager.tpl';
		$this->tpl_maintitle = '受注管理';
		$this->tpl_subtitle = '決済状況管理';

		$masterData = new SC_DB_MasterData_Ex();
		$this->arrORDERSTATUS = $masterData->getMasterData('mtb_order_status');
		$this->arrORDERSTATUS_COLOR = $masterData->getMasterData('mtb_order_status_color');
		$this->arrSex = $masterData->getMasterData('mtb_sex');
		$this->arrPageMax = $masterData->getMasterData('mtb_page_max');

		$objectDate = new SC_Date_Ex();
		// 登録・更新日検索用
		$objectDate->setStartYear(RELEASE_YEAR);
		$objectDate->setEndYear(DATE('Y'));
		$this->arrRegistYear = $objectDate->getYear();
		// 生年月日検索用
		$objectDate->setStartYear(BIRTH_YEAR);
		$objectDate->setEndYear(DATE('Y'));
		$this->arrBirthYear = $objectDate->getYear();
		// 月日の設定
		$this->arrMonth = $objectDate->getMonth();
		$this->arrDay = $objectDate->getDay();

		// 支払い方法の取得
		$dataHash = SLN_Util::getPayments();
		foreach ($dataHash as $payment) {
			$this->arrPaymentType[ $payment['payment_id'] ] = $payment['payment_method'];
		}
		$this->arrPayments = $this->arrPaymentType;

		$this->arrPaymentStatus = array(
				SLN_PAY_STATUS_UNSETTLED => '未決済',
				SLN_PAY_STATUS_REQUEST_SUCCESS => '要求成功',
				SLN_PAY_STATUS_PAY_SUCCESS => '支払い完了',
				SLN_PAY_STATUS_CANCEL => 'キャンセル',
				SLN_PAY_STATUS_FAIL => '決済失敗',
				SLN_PAY_STATUS_AUTH => '仮売上済み',
				SLN_PAY_STATUS_COMMIT => '実売上済み',
				SLN_PAY_STATUS_CAPTURE => '即時売上済み',
				SLN_PAY_STATUS_VOID => '取消済み',
		);

		$this->httpCacheControl('nocache');
	}

	/**
	 * Page のプロセス.
	 *
	 * @return void
	 */
	function process() {
		$this->action();
		$this->sendResponse();
	}

	/**
	 * Page のアクション.
	 *
	 * @return void
	 */
	function action() {

		$objectFormParam = new SC_FormParam_Ex();
		$this->initParam($objectFormParam);
		$objectFormParam->setParam($_POST);
		$this->arrHidden = $objectFormParam->getSearchArray();
		$this->arrForm = $objectFormParam->getFormParamList();

		$mode = $this->getMode();

		if($mode == 'update') {
			$change_status = $objectFormParam->getValue('change_status');
			if ($change_status == '') {

			} elseif ($change_status == 'delete') {
				$this->delete($objectFormParam->getValue('move'));
			} else {
				$this->statusMove($objectFormParam->getValue('change_status'), $objectFormParam->getValue('move'));
			}
			$pay_id = !is_null($_POST['pay_id']) ? $objectFormParam->getValue('pay_id') : '';
			$pay_status = !is_null($_POST['pay_status']) ? $objectFormParam->getValue('pay_status') : '';
		} elseif ($mode == 'sln_sub_mode') {
			$orderHashId = $objectFormParam->getValue('move');
			if (isset($orderHashId) && is_array($orderHashId)) {
				foreach ($orderHashId as $order_id) {
					if (!SC_Utils::sfIsInt($order_id)) {
						continue;
					}
					$orderHash = SLN_Util::getOrderPayHash($order_id);
					$objectClient = new SLN_C_Util();

					if ($_POST['sln_sub_mode'] == 'commit') {
						$ret = $objectClient->exec1Capture($orderHash);
					} else if ($_POST['sln_sub_mode'] == 'cancel') {
						$ret = $objectClient->exec1Delete($orderHash);
					} else if ($_POST['sln_sub_mode'] == 'reauth') {
						$ret = $objectClient->exec1ReAuth($orderHash);
					}

					if (!$ret) {
						$arrErr = $objectClient->getError();
						if (!SC_Utils::isBlank($objectPage->sln_msg)) {
							$this->sln_msg .= '<br />';
						}
						$this->sln_msg .= '注文番号:' .$order_id . 'の決済でエラーが発生しました。<br />';
						if (SC_Utils::isBlank($arrErr)) {
							$this->sln_msg .= '対象の変更は出来ない決済です。';
						} else {
							$this->sln_msg .= implode('<br />', $arrErr);
						}
					}
				}
				if (SC_Utils::isBlank($this->sln_msg)) {
					$this->sln_onload_message = "決済状況変更を実行しました。";
				} else {
					$this->sln_onload_message = "決済状況変更を実行しましたがエラーが発生しました。メッセージを確認して下さい。";
				}
			}
		} elseif ($mode == 'delete') {
			$this->doDelete('order_id = ?', array($objectFormParam->getValue('order_id')));
		}

		$objectFormParam->convParam();
		$objectFormParam->trimParam();
		$this->arrErr = $this->checkError($objectFormParam);
		$paramHash = $objectFormParam->getHashArray();

		$where = 'del_flg = 0';
		$whereHash = array();
		foreach ($paramHash as $key => $val) {
			if ($val == '') {
				continue;
			}
			$this->buildQuery($key, $where, $whereHash, $objectFormParam);
		}

		$order = 'update_date DESC';

		// 行数の取得
		$this->tpl_linemax = $this->getNumberOfLines($where, $whereHash);
		// ページ送りの処理
		$page_max = SC_Utils_Ex::sfGetSearchPageMax($objectFormParam->getValue('search_page_max'));

		// ページ送りの取得
		$objectNavi = new SC_PageNavi_Ex($this->arrHidden['search_pageno'],
				$this->tpl_linemax, $page_max,
				'fnNaviSearchPage', NAVI_PMAX);
		$this->arrPagenavi = $objectNavi->arrPagenavi;

		// 検索結果の取得
		$this->arrResults = $this->findOrders($where, $whereHash, $page_max, $objectNavi->start_row, $order);
	}

	/**
	 * デストラクタ.
	 *
	 * @return void
	 */
	function destroy() {
		parent::destroy();
	}

	/**
	 * パラメーター情報の初期化を行う.
	 *
	 * @param SC_FormParam $objectFormParam SC_FormParam インスタンス
	 * @return void
	 */
	function initParam(&$objectFormParam) {
		$objectFormParam->addParam('注文番号1', 'search_order_id1', INT_LEN, 'n', array('MAX_LENGTH_CHECK', 'NUM_CHECK'));
		$objectFormParam->addParam('注文番号2', 'search_order_id2', INT_LEN, 'n', array('MAX_LENGTH_CHECK', 'NUM_CHECK'));
		$objectFormParam->addParam('対応状況', 'search_order_status', INT_LEN, 'n', array('MAX_LENGTH_CHECK', 'NUM_CHECK'));
		$objectFormParam->addParam('注文者 お名前', 'search_order_name', STEXT_LEN, 'KVa', array('MAX_LENGTH_CHECK'));
		$objectFormParam->addParam('注文者 お名前(フリガナ)', 'search_order_kana', STEXT_LEN, 'KVCa', array('KANA_CHECK','MAX_LENGTH_CHECK'));
		$objectFormParam->addParam('性別', 'search_order_sex', INT_LEN, 'n', array('MAX_LENGTH_CHECK'));
		$objectFormParam->addParam('年齢1', 'search_age1', INT_LEN, 'n', array('MAX_LENGTH_CHECK', 'NUM_CHECK'));
		$objectFormParam->addParam('年齢2', 'search_age2', INT_LEN, 'n', array('MAX_LENGTH_CHECK', 'NUM_CHECK'));
		$objectFormParam->addParam('メールアドレス', 'search_order_email', STEXT_LEN, 'KVa', array('MAX_LENGTH_CHECK'));
		$objectFormParam->addParam('TEL', 'search_order_tel', STEXT_LEN, 'KVa', array('MAX_LENGTH_CHECK'));
		$objectFormParam->addParam('支払い方法', 'search_payment_id', INT_LEN, 'n', array('MAX_LENGTH_CHECK', 'NUM_CHECK'));
		$objectFormParam->addParam('決済状況', 'search_payment_status', INT_LEN, 'n', array('MAX_LENGTH_CHECK', 'NUM_CHECK'));
		$objectFormParam->addParam('購入金額1', 'search_total1', INT_LEN, 'n', array('MAX_LENGTH_CHECK', 'NUM_CHECK'));
		$objectFormParam->addParam('購入金額2', 'search_total2', INT_LEN, 'n', array('MAX_LENGTH_CHECK', 'NUM_CHECK'));
		$objectFormParam->addParam('表示件数', 'search_page_max', INT_LEN, 'n', array('MAX_LENGTH_CHECK', 'NUM_CHECK'));
		// 受注日
		$objectFormParam->addParam('開始年', 'search_sorderyear', INT_LEN, 'n', array('MAX_LENGTH_CHECK', 'NUM_CHECK'));
		$objectFormParam->addParam('開始月', 'search_sordermonth', INT_LEN, 'n', array('MAX_LENGTH_CHECK', 'NUM_CHECK'));
		$objectFormParam->addParam('開始日', 'search_sorderday', INT_LEN, 'n', array('MAX_LENGTH_CHECK', 'NUM_CHECK'));
		$objectFormParam->addParam('終了年', 'search_eorderyear', INT_LEN, 'n', array('MAX_LENGTH_CHECK', 'NUM_CHECK'));
		$objectFormParam->addParam('終了月', 'search_eordermonth', INT_LEN, 'n', array('MAX_LENGTH_CHECK', 'NUM_CHECK'));
		$objectFormParam->addParam('終了日', 'search_eorderday', INT_LEN, 'n', array('MAX_LENGTH_CHECK', 'NUM_CHECK'));
		// 更新日
		$objectFormParam->addParam('開始年', 'search_supdateyear', INT_LEN, 'n', array('MAX_LENGTH_CHECK', 'NUM_CHECK'));
		$objectFormParam->addParam('開始月', 'search_supdatemonth', INT_LEN, 'n', array('MAX_LENGTH_CHECK', 'NUM_CHECK'));
		$objectFormParam->addParam('開始日', 'search_supdateday', INT_LEN, 'n', array('MAX_LENGTH_CHECK', 'NUM_CHECK'));
		$objectFormParam->addParam('終了年', 'search_eupdateyear', INT_LEN, 'n', array('MAX_LENGTH_CHECK', 'NUM_CHECK'));
		$objectFormParam->addParam('終了月', 'search_eupdatemonth', INT_LEN, 'n', array('MAX_LENGTH_CHECK', 'NUM_CHECK'));
		$objectFormParam->addParam('終了日', 'search_eupdateday', INT_LEN, 'n', array('MAX_LENGTH_CHECK', 'NUM_CHECK'));
		// 生年月日
		$objectFormParam->addParam('開始年', 'search_sbirthyear', INT_LEN, 'n', array('MAX_LENGTH_CHECK', 'NUM_CHECK'));
		$objectFormParam->addParam('開始月', 'search_sbirthmonth', INT_LEN, 'n', array('MAX_LENGTH_CHECK', 'NUM_CHECK'));
		$objectFormParam->addParam('開始日', 'search_sbirthday', INT_LEN, 'n', array('MAX_LENGTH_CHECK', 'NUM_CHECK'));
		$objectFormParam->addParam('終了年', 'search_ebirthyear', INT_LEN, 'n', array('MAX_LENGTH_CHECK', 'NUM_CHECK'));
		$objectFormParam->addParam('終了月', 'search_ebirthmonth', INT_LEN, 'n', array('MAX_LENGTH_CHECK', 'NUM_CHECK'));
		$objectFormParam->addParam('終了日', 'search_ebirthday', INT_LEN, 'n', array('MAX_LENGTH_CHECK', 'NUM_CHECK'));
		$objectFormParam->addParam('購入商品','search_product_name',STEXT_LEN,'KVa',array('MAX_LENGTH_CHECK'));
		$objectFormParam->addParam('ページ送り番号','search_pageno', INT_LEN, 'n', array('MAX_LENGTH_CHECK', 'NUM_CHECK'));
		$objectFormParam->addParam('受注ID', 'order_id', INT_LEN, 'n', array('MAX_LENGTH_CHECK', 'NUM_CHECK'));

		$objectFormParam->addParam('変更後対応状況', 'change_status', STEXT_LEN, 'KVa', array('MAX_LENGTH_CHECK', 'NUM_CHECK'));
		$objectFormParam->addParam('選択注文番号', 'move', INT_LEN, 'n', array('MAX_LENGTH_CHECK', 'NUM_CHECK'));
	}

	/**
	 * 入力内容のチェックを行う.
	 *
	 * @param SC_FormParam $objectFormParam SC_FormParam インスタンス
	 * @return void
	 */
	function checkError(&$objectFormParam) {
		$errorObject = new SC_CheckError_Ex($objectFormParam->getHashArray());
		$errorObject->arrErr = $objectFormParam->checkError();

		// 相関チェック
		$errorObject->doFunc(array('注文番号1', '注文番号2', 'search_order_id1', 'search_order_id2'), array('GREATER_CHECK'));
		$errorObject->doFunc(array('年齢1', '年齢2', 'search_age1', 'search_age2'), array('GREATER_CHECK'));
		$errorObject->doFunc(array('購入金額1', '購入金額2', 'search_total1', 'search_total2'), array('GREATER_CHECK'));
		// 受注日
		$errorObject->doFunc(array('開始', 'search_sorderyear', 'search_sordermonth', 'search_sorderday'), array('CHECK_DATE'));
		$errorObject->doFunc(array('終了', 'search_eorderyear', 'search_eordermonth', 'search_eorderday'), array('CHECK_DATE'));
		$errorObject->doFunc(array('開始', '終了', 'search_sorderyear', 'search_sordermonth', 'search_sorderday', 'search_eorderyear', 'search_eordermonth', 'search_eorderday'), array('CHECK_SET_TERM'));
		// 更新日
		$errorObject->doFunc(array('開始', 'search_supdateyear', 'search_supdatemonth', 'search_supdateday'), array('CHECK_DATE'));
		$errorObject->doFunc(array('終了', 'search_eupdateyear', 'search_eupdatemonth', 'search_eupdateday'), array('CHECK_DATE'));
		$errorObject->doFunc(array('開始', '終了', 'search_supdateyear', 'search_supdatemonth', 'search_supdateday', 'search_eupdateyear', 'search_eupdatemonth', 'search_eupdateday'), array('CHECK_SET_TERM'));
		// 生年月日
		$errorObject->doFunc(array('開始', 'search_sbirthyear', 'search_sbirthmonth', 'search_sbirthday'), array('CHECK_DATE'));
		$errorObject->doFunc(array('終了', 'search_ebirthyear', 'search_ebirthmonth', 'search_ebirthday'), array('CHECK_DATE'));
		$errorObject->doFunc(array('開始', '終了', 'search_sbirthyear', 'search_sbirthmonth', 'search_sbirthday', 'search_ebirthyear', 'search_ebirthmonth', 'search_ebirthday'), array('CHECK_SET_TERM'));

		return $errorObject->arrErr;
	}

	/**
	 * クエリを構築する.
	 *
	 * 検索条件のキーに応じた WHERE 句と, クエリパラメーターを構築する.
	 * クエリパラメーターは, SC_FormParam の入力値から取得する.
	 *
	 * 構築内容は, 引数の $where 及び $valueHash にそれぞれ追加される.
	 *
	 * @param string $key 検索条件のキー
	 * @param string $where 構築する WHERE 句
	 * @param array $valueHash 構築するクエリパラメーター
	 * @param SC_FormParam $objectFormParam SC_FormParam インスタンス
	 * @return void
	 */
	function buildQuery($key, &$where, &$valueHash, &$objectFormParam) {
		$dbFactory = SC_DB_DBFactory_Ex::getInstance();
		switch ($key) {

			case 'search_product_name':
				$where .= ' AND EXISTS (SELECT 1 FROM dtb_order_detail od WHERE od.order_id = dtb_order.order_id AND od.product_name LIKE ?)';
				$valueHash[] = sprintf('%%%s%%', $objectFormParam->getValue($key));
				break;
			case 'search_order_name':
				$where .= ' AND ' . $dbFactory->concatColumn(array('order_name01', 'order_name02')) . ' LIKE ?';
				$valueHash[] = sprintf('%%%s%%', $objectFormParam->getValue($key));
				break;
			case 'search_order_kana':
				$where .= ' AND ' . $dbFactory->concatColumn(array('order_kana01', 'order_kana02')) . ' LIKE ?';
				$valueHash[] = sprintf('%%%s%%', $objectFormParam->getValue($key));
				break;
			case 'search_order_id1':
				$where .= ' AND order_id >= ?';
				$valueHash[] = sprintf('%d', $objectFormParam->getValue($key));
				break;
			case 'search_order_id2':
				$where .= ' AND order_id <= ?';
				$valueHash[] = sprintf('%d', $objectFormParam->getValue($key));
				break;
			case 'search_order_sex':
				$tmp = '';
				foreach ($objectFormParam->getValue($key) as $value) {
					if ($value != '') {
						if (SC_Utils_Ex::isBlank($tmp)) {
							$tmp .= ' AND (order_sex = ?';
						} else {
							$tmp .= ' OR order_sex = ?';
						}
						$valueHash[] = $value;
					}
				}

				if (!SC_Utils_Ex::isBlank($tmp)) {
					$tmp .= ')';
					$where .= " $tmp ";
				}
				break;
			case 'search_order_tel':
				$where .= ' AND (' . $dbFactory->concatColumn(array('order_tel01', 'order_tel02', 'order_tel03')) . ' LIKE ?)';
				$valueHash[] = sprintf('%%%d%%', preg_replace('/[()-]+/','', $objectFormParam->getValue($key)));
				break;
			case 'search_order_email':
				$where .= ' AND order_email LIKE ?';
				$valueHash[] = sprintf('%%%s%%', $objectFormParam->getValue($key));
				break;
			case 'search_payment_id':
				$tmp = '';
				foreach ($objectFormParam->getValue($key) as $value) {
					if ($value != '') {
						if ($tmp == '') {
							$tmp .= ' AND (payment_id = ?';
						} else {
							$tmp .= ' OR payment_id = ?';
						}
						$valueHash[] = $value;
					}
				}

				if (!SC_Utils_Ex::isBlank($tmp)) {
					$tmp .= ')';
					$where .= " $tmp ";
				}
				break;
			case 'search_payment_status':
				$tmp = '';
				foreach ($objectFormParam->getValue($key) as $value) {
					if ($value != '') {
						if ($tmp == '') {
							$tmp .= ' AND (' . SLN_ORDER_COL_PAYSTATUS. ' = ?';
						} else {
							$tmp .= ' OR ' . SLN_ORDER_COL_PAYSTATUS . ' = ?';
						}
						$valueHash[] = $value;
					}
				}

				if (!SC_Utils_Ex::isBlank($tmp)) {
					$tmp .= ')';
					$where .= " $tmp ";
				}
				break;
			case 'search_total1':
				$where .= ' AND total >= ?';
				$valueHash[] = sprintf('%d', $objectFormParam->getValue($key));
				break;
			case 'search_total2':
				$where .= ' AND total <= ?';
				$valueHash[] = sprintf('%d', $objectFormParam->getValue($key));
				break;
			case 'search_sorderyear':
				$date = SC_Utils_Ex::sfGetTimestamp($objectFormParam->getValue('search_sorderyear'),
				$objectFormParam->getValue('search_sordermonth'),
				$objectFormParam->getValue('search_sorderday'));
				$where.= ' AND create_date >= ?';
				$valueHash[] = $date;
				break;
			case 'search_eorderyear':
				$date = SC_Utils_Ex::sfGetTimestamp($objectFormParam->getValue('search_eorderyear'),
				$objectFormParam->getValue('search_eordermonth'),
				$objectFormParam->getValue('search_eorderday'), true);
				$where.= ' AND create_date <= ?';
				$valueHash[] = $date;
				break;
			case 'search_supdateyear':
				$date = SC_Utils_Ex::sfGetTimestamp($objectFormParam->getValue('search_supdateyear'),
				$objectFormParam->getValue('search_supdatemonth'),
				$objectFormParam->getValue('search_supdateday'));
				$where.= ' AND update_date >= ?';
				$valueHash[] = $date;
				break;
			case 'search_eupdateyear':
				$date = SC_Utils_Ex::sfGetTimestamp($objectFormParam->getValue('search_eupdateyear'),
				$objectFormParam->getValue('search_eupdatemonth'),
				$objectFormParam->getValue('search_eupdateday'), true);
				$where.= ' AND update_date <= ?';
				$valueHash[] = $date;
				break;
			case 'search_sbirthyear':
				$date = SC_Utils_Ex::sfGetTimestamp($objectFormParam->getValue('search_sbirthyear'),
				$objectFormParam->getValue('search_sbirthmonth'),
				$objectFormParam->getValue('search_sbirthday'));
				$where.= ' AND order_birth >= ?';
				$valueHash[] = $date;
				break;
			case 'search_ebirthyear':
				$date = SC_Utils_Ex::sfGetTimestamp($objectFormParam->getValue('search_ebirthyear'),
				$objectFormParam->getValue('search_ebirthmonth'),
				$objectFormParam->getValue('search_ebirthday'), true);
				$where.= ' AND order_birth <= ?';
				$valueHash[] = $date;
				break;
			case 'search_order_status':
				$where.= ' AND status = ?';
				$valueHash[] = $objectFormParam->getValue($key);
				break;
			default:
				break;
		}
	}

	/**
	 * 受注を削除する.
	 *
	 * @param string $where 削除対象の WHERE 句
	 * @param array $paramHash 削除対象の値
	 * @return void
	 */
	function doDelete($where, $paramHash = array()) {
		$objectQuery =& SC_Query_Ex::getSingletonInstance();
		$sqlval['del_flg']     = 1;
		$sqlval['update_date'] = 'CURRENT_TIMESTAMP';
		$objectQuery->update('dtb_order', $sqlval, $where, $paramHash);
	}

	/**
	 * 検索結果の行数を取得する.
	 *
	 * @param string $where 検索条件の WHERE 句
	 * @param array $valueHash 検索条件のパラメーター
	 * @return integer 検索結果の行数
	 */
	function getNumberOfLines($where, $valueHash) {
		$objectQuery =& SC_Query_Ex::getSingletonInstance();
		return $objectQuery->count('dtb_order', $where, $valueHash);
	}

	/**
	 * 受注を検索する.
	 *
	 * @param string $where 検索条件の WHERE 句
	 * @param array $valueHash 検索条件のパラメーター
	 * @param integer $limit 表示件数
	 * @param integer $offset 開始件数
	 * @param string $order 検索結果の並び順
	 * @return array 受注の検索結果
	 */
	function findOrders($where, $valueHash, $limit, $offset, $order) {
		$objectQuery =& SC_Query_Ex::getSingletonInstance();
		$objectQuery->setLimitOffset($limit, $offset);
		$objectQuery->setOrder($order);
		return $objectQuery->select('*', 'dtb_order', $where, $valueHash);
	}

	function statusMove($statusId, $orderHashId) {
		$objectPurchase = new SC_Helper_Purchase();
		$objectQuery =& SC_Query::getSingletonInstance();

		if (!isset($orderHashId) || !is_array($orderHashId)) {
			return false;
		}
		$masterData = new SC_DB_MasterData();
		$arrORDERSTATUS = $masterData->getMasterData('mtb_order_status');

		$objectQuery->begin();
		foreach ($orderHashId as $orderId) {
			$objectPurchase->sfUpdateOrderStatus($orderId, $statusId);
		}
		$objectQuery->commit();

		$this->tpl_onload = "window.alert('選択項目を" . $arrORDERSTATUS[$statusId] . "へ移動しました。');";
		return true;
	}

	function delete($orderHashId) {
		$objectQuery =& SC_Query::getSingletonInstance();
		if (!isset($orderHashId) || !is_array($orderHashId)) {
			return false;
		}

		$sqlval = array();
		$sqlval['del_flg']     = 1;
		$sqlval['update_date'] = 'CURRENT_TIMESTAMP';

		$objectQuery->begin();
		foreach ($orderHashId as $orderId) {
			$objectQuery->update('dtb_order', $sqlval, 'order_id = ?', array($orderId));
		}
		$objectQuery->commit();

		$this->tpl_onload = "window.alert('選択項目を削除しました。');";
		return true;
	}
}