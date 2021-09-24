<?php
require_once(SLN_CLASS_PATH . 'SLN_C_Member.php');
require_once(SLN_CLASS_PATH . 'SLN_C_Util.php');
if (is_file(PLUGIN_UPLOAD_REALDIR . 'SLNTerm217/SLNTerm.php')) {
	require_once(PLUGIN_UPLOAD_REALDIR . 'SLNTerm217/SLNTerm.php');
}

/**
 * SLN_Coreクラス（本体からのHOOK連動用）
 *
 * @package ソニーペイメントサービス決済モジュール
 * @author Sony Payment Services Inc.
 * @version 2.0.0
 */
class SLN_Core {

	function actionPrefilterTransform($class_name, &$source, &$objectPage, $filename, $objectPlugin) {

		// 会員登録機能が選ばれていなければ置き換え処理は必要ない
		$objectMdl =& SLN::getInstance();
		$subData = $objectMdl->getConfigs();
		if ($subData["member_regist"] == 1) {
			$enableMember = true;
		} else {
			$enableMember = false;
		}

		switch($objectPage->arrPageLayout['device_type_id']){
			case DEVICE_TYPE_MOBILE:
			case DEVICE_TYPE_SMARTPHONE:
			case DEVICE_TYPE_PC:
				if (preg_match('/^LC_Page_Mypage.*_Ex$/', $class_name) && $enableMember) {
					$objectTransform = new SC_Helper_Transform($source);
					$tpl_file = 'sln_mypage_navi_changecard.tpl';
					switch($objectPage->arrPageLayout['device_type_id']){
						case DEVICE_TYPE_MOBILE:
							$tpl_dir = SLN_TEMPLATE_PATH . 'mobile/';
							break;
						case DEVICE_TYPE_SMARTPHONE:
							$tpl_dir = SLN_TEMPLATE_PATH . 'sphone/';
							$objectTransform->select('#mypage_nav',NULL, false)->insertAfter(file_get_contents($tpl_dir . $tpl_file));
							break;
						case DEVICE_TYPE_PC:
						default:
							$tpl_dir = SLN_TEMPLATE_PATH . 'default/';
							$objectTransform->select('h2',NULL, false)->appendChild(file_get_contents($tpl_dir . $tpl_file));
							break;
					}
					$source = $objectTransform->getHTML();
				}
				break;
			case DEVICE_TYPE_ADMIN:
			default:
				if(preg_match('/^LC_Page_Admin.*_Ex$/', $class_name) && strpos($filename, 'mail_templates') === FALSE) {
					$tpl_dir = SLN_TEMPLATE_PATH . 'admin/';
					$objectTransform = new SC_Helper_Transform($source);
					$tpl_file = 'sln_admin_addmenu.tpl';
					$objectTransform->select('head')->appendChild(file_get_contents($tpl_dir . $tpl_file));
					$source = $objectTransform->getHTML();
				}

				switch(true){
					case (strpos($filename, 'order/status.tpl') !== false):
						$tpl_dir = SLN_TEMPLATE_PATH . 'admin/';

						$tpl_file = 'sln_order_status_js.tpl';
						$source .= file_get_contents($tpl_dir . $tpl_file);

						$objectTransform = new SC_Helper_Transform($source);

						$tpl_file = 'sln_order_status_oneactionmenu.tpl';
						$objectTransform->select('p.remark')->insertBefore(file_get_contents($tpl_dir . $tpl_file));

						$tpl_file = 'sln_order_status_head.tpl';
						$objectTransform->select('table.list > tr > th:last')->appendChild(file_get_contents($tpl_dir . $tpl_file));

						$tpl_file = 'sln_order_status_status.tpl';
						$objectTransform->select('table.list > tr', 1)->appendChild(file_get_contents($tpl_dir . $tpl_file));

						$tpl_file = 'sln_order_status_colwidth.tpl';
						$objectTransform->select('table.list > col')->removeElement();
						$objectTransform->select('table.list')->appendFirst(file_get_contents($tpl_dir . $tpl_file));

						$source = $objectTransform->getHTML();
						break;
					case (strpos($filename, 'order/index.tpl') !== false):
						$tpl_dir = SLN_TEMPLATE_PATH . 'admin/';
						$objectTransform = new SC_Helper_Transform($source);

						$tpl_file = 'sln_order_index_baseoneactionmenu.tpl';
						$objectTransform->select('#form1 > div.btn')->appendChild(file_get_contents($tpl_dir . $tpl_file));

						$tpl_file = 'sln_order_index_oneactionmenu.tpl';
						$objectTransform->select('table.list > tr > th:last')->appendChild(file_get_contents($tpl_dir . $tpl_file));

						$tpl_file = 'sln_order_index_list.tpl';
						$objectTransform->select('table.list > tr', 1)->appendChild(file_get_contents($tpl_dir . $tpl_file));

						$tpl_file = 'sln_order_index_list_colwidth.tpl';
						$objectTransform->select('table.list > col', 1)->removeElement();
						$objectTransform->select('table.list')->appendFirst(file_get_contents($tpl_dir . $tpl_file));

						$source = $objectTransform->getHTML();
						break;
					case (strpos($filename, 'order/edit.tpl') !== false):
						$tpl_dir = SLN_TEMPLATE_PATH . 'admin/';
						$tpl_file = 'sln_order_edit_top.tpl';
						$objectTransform = new SC_Helper_Transform($source);
						$objectTransform->select('table', 0)->insertAfter(file_get_contents($tpl_dir . $tpl_file));

						$tpl_file = 'sln_order_edit_changealert.tpl';
						$objectTransform->select('div#order')->appendChild(file_get_contents($tpl_dir . $tpl_file));

						$source = $objectTransform->getHTML();
						break;
					default:
						break;
				}
				break;
		}

		// クイック決済が選ばれていなければ置き換え処理は必要ない
		$objectMdl =& SLN::getInstance();
		$subData = $objectMdl->getConfigs();
		if ($subData["quick_accounts"] == 1) {
			$enableQuick = true;
		} else {
			$enableQuick = false;
		}

		// 定期購入商品があるかどうかの確認
		$productIdArray = array();
		$objCartSess = new SC_CartSession_Ex();
		$cartHashDetailsArrayArray = $objCartSess->getAllCartList();
		foreach ($cartHashDetailsArrayArray as $cartHashDetailsArray) {
		    foreach ($cartHashDetailsArray as $cartHashDetails) {
		      $productIdArray[] = $cartHashDetails['productsClass']['product_id'];
		    }
		}

		// 定期購入ではクイックは利用できない
		if (!empty($productIdArray) && class_exists(SLNTerm_SC_Helper_Purchase) && SLNTerm_SC_Helper_Purchase::hasTerminalProductByProductIds($productIdArray)) {
		   $enableQuick = false;
		}

		// SLN決済以外は置き換えは必要はない
		$objPurchase = new SC_Helper_Purchase_Ex();
		$objCartSess = new SC_CartSession_Ex();
		$objSiteSess = new SC_SiteSession_Ex();
		$uniqid = $objSiteSess->getUniqId();
		$arrOrderTemp = $objPurchase->getOrderTemp($uniqid);
		if (!in_array($arrOrderTemp['payment_id'], array(SLN_PAYID_CREDIT, SLN_PAYID_REGIST_CREDIT, SLN_PAYID_CVS))) {
			$enableNextBtn = false;
		} else {
			$enableNextBtn = true;
		}

		if($enableQuick && (strpos($filename, 'cart/index.tpl') !== false)) {

			$tpl_file = 'sln_cart_index_quickbtn.tpl';
			$objectTransform = new SC_Helper_Transform($source);
			switch($objectPage->arrPageLayout['device_type_id']){
				case DEVICE_TYPE_MOBILE:
					$tpl_dir = SLN_TEMPLATE_PATH . 'mobile/';
					$objectTransform->select('form')->insertAfter(file_get_contents($tpl_dir . $tpl_file));
					$objectSess = new SC_Session_Ex();
					if($objectSess->GetSession('plg_slnquick_payment')) {
						$objectTransform->select('div.btn_area > ul > li:first')->removeElement();
					}
					break;
				case DEVICE_TYPE_SMARTPHONE:
					$tpl_dir = SLN_TEMPLATE_PATH . 'sphone/';
					$objectTransform->select('div.btn_area_btm')->appendChild(file_get_contents($tpl_dir . $tpl_file));
					break;
				case DEVICE_TYPE_PC:
					$tpl_dir = SLN_TEMPLATE_PATH . 'default/';
					$objectTransform->select('div.btn_area')->replaceElement(file_get_contents($tpl_dir . $tpl_file));
					break;
				default:
					break;
			}

			$source = $objectTransform->getHTML();
			//クイック決済またはクレジット決済 入力内容の確認ページ
		} else if($enableNextBtn && $enableQuick && (strpos($filename, 'shopping/confirm.tpl') !== false)) {
			$tpl_file = 'sln_shopping_confirm_quick.tpl';
			$objectTransform = new SC_Helper_Transform($source);
			if ($objectPage->arrPageLayout['device_type_id'] == DEVICE_TYPE_PC){
				$tpl_dir = SLN_TEMPLATE_PATH . 'default/';
				//ボタンの変更
				$objectTransform->select('div.btn_area > ul',0)->replaceElement(file_get_contents($tpl_dir . $tpl_file));
				$objectTransform->select('div.btn_area > ul',1)->replaceElement(file_get_contents($tpl_dir . $tpl_file));

			}
			$source = $objectTransform->getHTML();
		}
		
		// 2.17.1対応
		if (strpos(ECCUBE_VERSION, '2.17.0') === false) {
		    if (strpos($filename, 'site_frame.tpl') !== false) {
		        $objectTransform = new SC_Helper_Transform($source);
		        $objectTransform->select('head')->appendChild('<script type="text/javascript" src="<!--{$smarty.const.ROOT_URLPATH}-->js/eccube.legacy.js"></script>');
		        $source = $objectTransform->getHTML();
		    }
		    if (strpos($filename, 'main_frame.tpl') !== false) {
		        $objectTransform = new SC_Helper_Transform($source);
		        $objectTransform->select('head')->appendChild('<script type="text/javascript" src="<!--{$smarty.const.ROOT_URLPATH}-->js/eccube.legacy.js"></script>');
		        $source = $objectTransform->getHTML();
		    }
		}
	}

	function actionHook($class_name, $hook_point, &$objectPage, $objectPlugin) {

		switch ($class_name) {
			case 'LC_Page_Admin_Order_Status_Ex':
				if ($hook_point == 'before') {
					$this->execAdminOrderStatusBefore($objectPage);
				}
				break;
			case 'LC_Page_Admin_Order_Ex':
				if ($hook_point == 'after') {
				} else if($hook_point == 'before') {
					$this->execAdminOrderBefore($objectPage);
				}
				break;
			case 'LC_Page_Admin_Order_Edit_Ex':
				if ($hook_point == 'after') {
					$this->execAdminOrderEditAfter($objectPage);
				} else if($hook_point == 'before') {
					$this->execAdminOrderEditBefore($objectPage);
				}
				break;
			case 'LC_Page_Admin_Customer_Ex':
				$this->execAdminCustomer($objectPage);
				break;
			case 'LC_Page_Mypage_Refusal_Ex':
				if ($hook_point == 'before') {
					$this->execMyPageRefusalBefore($objectPage);
				}
				break;
			case 'LC_Page_Products_Detail_Ex':
				if ($objectPage->getMode() == 'plg_slnquick') {
					$_REQUEST['mode'] = 'cart';
					$objectSess = new SC_Session_Ex();
					$objectSess->SetSession('plg_slnquick_payment_item', true);
				} else {
					$objectSess = new SC_Session_Ex();
					$objectSess->SetSession('plg_slnquick_payment_item', false);
				}
				break;
			case 'LC_Page_Products_List_Ex':
				if ($objectPage->getMode() == 'plg_slnquick') {
					$_REQUEST['mode'] = 'cart';
					$objectSess = new SC_Session_Ex();
					$objectSess->SetSession('plg_slnquick_payment_item', true);
				} else {
					$objectSess = new SC_Session_Ex();
					$objectSess->SetSession('plg_slnquick_payment_item', false);
				}
				break;
			case 'LC_Page_Cart_Ex':
				$objectSess = new SC_Session_Ex();
				$objectSess->SetSession('plg_slnquick_payment_confirm', false);
				if ($objectPage->getMode() == 'up'
						|| $objectPage->getMode() == 'down'
								|| $objectPage->getMode() == 'setQuantity'
										|| $objectPage->getMode() == 'delete') {
					$objectSess->SetSession('plg_slnquick_payment', false);
				} else if ($objectPage->getMode() == 'plg_slnquick') {
					$_REQUEST['mode'] = 'confirm';
					$objectSess->SetSession('plg_slnquick_payment', true);
				} else {
					if ($objectSess->GetSession('plg_slnquick_payment_item')) {
						$objectSess->SetSession('plg_slnquick_payment_item', false);

						$objectCartSess = new SC_CartSession_Ex();
						$cartKeys = $objectCartSess->getKeys();
						if (count($cartKeys) == 1) {
							$objectSess->SetSession('plg_slnquick_payment', true);
							$_REQUEST['mode'] = 'confirm';
							$_REQUEST['cartKey'] = $cartKeys[0];
							$objectSess = new SC_Session_Ex();
							$objectSess->SetSession('plg_slnquick_payment', true);
						} else {
							$objectSess->SetSession('plg_slnquick_payment', false);
						}
					} else {
						$objectSess->SetSession('plg_slnquick_payment', false);
					}
				}
				break;
			case 'LC_Page_Shopping_Ex':
				$objectSess = new SC_Session_Ex();
				$objectSess->SetSession('plg_slnquick_payment_confirm', false);
				if ($objectPage->getMode() == 'nonmember_confirm'
						|| $objectPage->getMode() == 'return'
								|| $objectPage->getMode() == 'multiple') {

					if($objectSess->GetSession('plg_slnquick_payment')) {
						$objectSess->SetSession('plg_slnquick_payment', false);
					}
				}
				break;
			case 'LC_Page_Shopping_Deliv_Ex':
				$objectSess = new SC_Session_Ex();
				$objectSess->SetSession('plg_slnquick_payment_confirm', false);
				if ($objectPage->getMode() == 'delete'
						|| $objectPage->getMode() == 'return'
								|| $objectPage->getMode() == 'multiple') {

					if($objectSess->GetSession('plg_slnquick_payment')) {
						$objectSess->SetSession('plg_slnquick_payment', false);
					}
				} else {
					if($objectSess->GetSession('plg_slnquick_payment')) {
						$_REQUEST['mode'] = 'customer_addr';
						$_POST['deliv_check'] = '-1';
					}
				}
				break;
			case 'LC_Page_Shopping_Payment_Ex':

				if ($hook_point == 'before') {
					if ($objectPage->getMode() == 'select_deliv' && SC_Display::detectDevice() != DEVICE_TYPE_MOBILE) {
						$this->execSelectedDelivJsonEncode($objectPage);
					}
				} else if($hook_point == 'after') {
					$this->lfCheckPayment($objectPage->arrPayment, $objectPage);
				}

				$objectSess = new SC_Session_Ex();
				$objectSess->SetSession('plg_slnquick_payment_confirm', false);

				if ($objectPage->getMode() == 'select_deliv'
						|| $objectPage->getMode() == 'return') {

					if($objectSess->GetSession('plg_slnquick_payment')) {
						$objectSess->SetSession('plg_slnquick_payment', false);
					}
				} else {
					if($objectSess->GetSession('plg_slnquick_payment')) {

						$objectSiteSess = new SC_SiteSession_Ex();
						$objectCartSess = new SC_CartSession_Ex();
						$objectPurchase = new SC_Helper_Purchase_Ex();
						$objectCustomer = new SC_Customer_Ex();

						$is_multiple = $objectPurchase->isMultiple();
						$arrShipping = $objectPurchase->getShippingTemp($is_multiple);
						$tpl_uniqid = $objectSiteSess->getUniqId();
						$cart_key = $objectCartSess->getKey();

						$objDelivery = new SC_Helper_Delivery_Ex();
						$arrDeliv = $objDelivery->getList($cart_key);
						$is_single_deliv = $objectPage->isSingleDeliv($arrDeliv);

						$orderHashTemp = $objectPurchase->getOrderTemp($tpl_uniqid);

						$arrPrices = $objectCartSess->calculate($cart_key, $objectCustomer);

						$deliv_id = $arrDeliv[0]['deliv_id'];

						$total = $objectCartSess->getAllProductsTotal($cart_key, $deliv_id);
						$payments_deliv = SC_Helper_Delivery_Ex::getPayments($deliv_id);
						$objPayment = new SC_Helper_Payment_Ex();
						$payments_total = $objPayment->getByPrice($total);
						$arrPayment = array();
						foreach ($payments_total as $payment) {
							if (in_array($payment['payment_id'], $payments_deliv)) {
								$arrPayment[] = $payment;
							}
						}

						if(SC_Utils_Ex::isBlank($arrPayment)) {
							$objectSess = new SC_Session_Ex();
							if($objectSess->GetSession('plg_slnquick_payment')) {
								$objectSess->SetSession('plg_slnquick_payment', false);
							}
							return;
						}
						$target_payment_id = '';
						if ($objectCustomer->isLoginSuccess(true)) {
							$objectQuery =& SC_Query_Ex::getSingletonInstance();
							$objectQuery->setOrder('create_date desc');
							$objectQuery->setLimit('1');
							$arrOldOrder = $objectQuery->getRow('*', 'dtb_order', 'customer_id = ? and del_flg = 0 and status <> ?', array($objectCustomer->getValue('customer_id'), ORDER_PENDING));
							$target_payment_id = $arrOldOrder['payment_id'];
							$paymentHash = SLN_Util::getPaymentHash($target_payment_id);
							if (!SC_Utils_Ex::isBlank($target_payment_id)) {
								if (!SC_Utils_Ex::isBlank($arrOldOrder[SLN_ORDER_COL_PAYDATA])) {
									$arrOldPayData =  unserialize($arrOldOrder[SLN_ORDER_COL_PAYDATA]);
									$objectSess = new SC_Session_Ex();
									$objectSess->SetSession('plg_slnquick_oldpaydata', $arrOldPayData);
								}

								$flag = false;
								// カード決済時のみ登録カード決済に切り替えできるか確認
								if ($paymentHash[SLN_PAYMENT_COL_PAYID] == SLN_PAYID_CREDIT) {
									$arrMulpayPayments = SLN_Util::getPayments();
									foreach ($arrMulpayPayments as $arrMulpayPaymentData) {
										if ($arrMulpayPaymentData[SLN_PAYMENT_COL_PAYID] == SLN_PAYID_REGIST_CREDIT) {
											foreach ($arrPayment as $arrPaymentData) {
												if ($arrPaymentData['payment_id'] == $arrMulpayPaymentData['payment_id']) {
													$target_payment_id = $arrMulpayPaymentData['payment_id'];
													$paymentHash = SLN_Util::getPaymentHash($target_payment_id);
													$flag = true;
													break;
												}
											}
										}
									}
								}else {
									foreach ($arrPayment as $arrPaymentData) {
										if ($arrPaymentData['payment_id'] == $target_payment_id) {
											$flag = true;
											break;
										}
									}
								}
								if (!$flag) {
									$target_payment_id = '';
								}
							}
						}
						if ($target_payment_id == '') {
							foreach ($arrPayment as $arrPaymentData) {
								$paymentHash = SLN_Util::getPaymentHash($arrPaymentData['payment_id']);
								if ($paymentHash[SLN_PAYMENT_COL_PAYID] == SLN_PAYID_REGIST_CREDIT) {
									$target_payment_id = $arrPaymentData['payment_id'];
									break;
								}
							}
						}

						if ($target_payment_id != '' && $paymentHash[SLN_PAYMENT_COL_PAYID] == SLN_PAYID_REGIST_CREDIT) {

							if($objectCustomer->isLoginSuccess(true)) {
								$objectClient = new SLN_C_Member();
								$ret = $objectClient->searchCard(array('customer_id' => $objectCustomer->getValue('customer_id')));
								if($ret) {
									$arrResults = $objectClient->getResults();
									if(!SC_Utils_Ex::isBlank($arrResults['CardNo'])) {
										$target_payment_id = $arrPaymentData['payment_id'];
										$objectSess = new SC_Session_Ex();
										$objectSess->SetSession('plg_slnquick_payment_card', false);
										if (!$objectSess->GetSession('plg_slnquick_payment_card')) {
											$objectSess->SetSession('plg_slnquick_payment_card', $arrResults);
										}
									} else {
										$target_payment_id = '';
									}
								} else {
									$target_payment_id = '';
								}
							}
						}

						if ($target_payment_id == '') {
							foreach ($arrPayment as $arrPaymentData) {
								$paymentHash = SLN_Util::getPaymentHash($arrPaymentData['payment_id']);
								if ($paymentHash[SLN_PAYMENT_COL_PAYID] == SLN_PAYID_CREDIT) {
									$target_payment_id = $arrPaymentData['payment_id'];
								}
							}
						}

						if (!SC_Utils_Ex::isBlank($target_payment_id)) {
							$_REQUEST['mode'] = 'confirm';
							$_POST['deliv_id'] = $deliv_id;
							$_POST['payment_id'] = $target_payment_id;
						}
					}
				}
				break;
			case 'LC_Page_Shopping_Confirm_Ex':
				if ($hook_point == 'before') {
					if ($objectPage->getMode() == 'return') {
						$objectSess = new SC_Session_Ex();
						if($objectSess->GetSession('plg_slnquick_payment')) {
							$objectSess->SetSession('plg_slnquick_payment', false);
						}
					} else {
						$objectSess = new SC_Session_Ex();
						if($objectSess->GetSession('plg_slnquick_payment')) {
							$objectSess->SetSession('plg_slnquick_payment', false);
							$objectSess->SetSession('plg_slnquick_payment_confirm', true);
						}
					}
				} else if ($hook_point == 'after') {
					$objectSess = new SC_Session_Ex();
					if($objectSess->GetSession('plg_slnquick_payment_confirm')) {
						$objectPage->arrForm['button_type'] = 'slnquick';
					}
				}
				break;
		}
	}

	function lfCheckPayment(&$arrPayment, &$objectPage) {
		$objectPage->arrPgPayConfig = array();

		// 定期販売商品があるか（確認後はずす）
		if (class_exists(plg_SLNTerm_SC_Helper_Purchase) && plg_SLNTerm_SC_Helper_Purchase::hasPeriodicalCartItem()) {
			// 定期購入の場合は登録済みクレジットカードかクレジットカードのみ
			foreach($arrPayment as $key => $data) {
				$arrPayConfig = SLN_Util::getPaymentHash($data['payment_id']);
				$objectPage->arrPgPayConfig[$payment_id] = $arrPayConfig;
				$pay_id = $arrPayConfig[SLN_PAYMENT_COL_PAYID];

				if ($pay_id != SLN_PAYID_REGIST_CREDIT && $pay_id != SLN_PAYID_CREDIT) {
					unset($arrPayment[$key]);
				}
			}
		}

		foreach($arrPayment as $key => $data) {
			$arrPayConfig = SLN_Util::getPaymentHash($data['payment_id']);
			$objectPage->arrPgPayConfig[$payment_id] = $arrPayConfig;
			$pay_id = $arrPayConfig[SLN_PAYMENT_COL_PAYID];

			if ($pay_id != SLN_PAYID_REGIST_CREDIT) continue;

			$objectCustomer = new SC_Customer();
			if(!$objectCustomer->isLoginSuccess(true)) {
				unset($arrPayment[$key]);
				continue;
			}

			$objectClient = new SLN_C_Member();
			$ret = $objectClient->searchCard(array('customer_id' => $objectCustomer->getValue('customer_id')));
			if(!$ret) {
				unset($arrPayment[$key]);
				continue;
			}

			$arrResults = $objectClient->getResults();
			if($arrResults["KaiinStatus"] != 0) {
				unset($arrPayment[$key]);
			}
		}

		$tempHash = $arrPayment;
		$arrPayment = array();
		foreach($tempHash as $data) {
			$arrPayment[] = $data;
		}
	}

	function execAdminOrderStatusBefore(&$objectPage) {

		$mode = $objectPage->getMode();
		switch ($mode) {
			case 'sln_sub_mode':
				$objectFormParam = new SC_FormParam();
				$objectPage->lfInitParam($objectFormParam);
				$objectFormParam->setParam($_POST, false);
				$objectFormParam->convParam();
				$arrErr = $objectFormParam->checkError();
				if (SC_Utils::isBlank($arrErr)) {
					$orderHashId = $_POST['move'];
					if (isset($orderHashId) && is_array($orderHashId)) {
						foreach ($orderHashId as $order_id) {
							if (!SC_Utils::sfIsInt($order_id)) {
								continue;
							}
							$orderHash = SLN_Util::getOrderPayHash($order_id);
							$objectClient = new SLN_C_Util();
							if ($_POST['sln_sub_mode'] == 'commit') {
								$ret = $objectClient->exec1Capture($orderHash, true);
							} else if ($_POST['sln_sub_mode'] == 'cancel') {
								$ret = $objectClient->exec1Delete($orderHash, true);
							}

							if (!$ret) {
								$arrErr = $objectClient->getError();
								if (!SC_Utils::isBlank($objectPage->sln_msg)) {
									$objectPage->sln_msg .= '<br />';
								}
								$objectPage->sln_msg .= '注文番号:' .$order_id . 'の決済でエラーが発生しました。<br />';
								if (SC_Utils::isBlank($arrErr)) {
									$objectPage->sln_msg .= '対象の変更は出来ない決済です。';
								} else {
									$objectPage->sln_msg .= implode('<br />', $arrErr);
								}
							}
						}
						if (SC_Utils::isBlank($objectPage->sln_msg)) {
							$objectPage->sln_onload = "alert('決済状況変更を実行しました。');" ;
						} else {
							$objectPage->sln_onload = "alert('決済状況変更を実行しましたがエラーが発生しました。メッセージを確認して下さい。');" ;
						}
					}
				}
				$_POST['mode'] = 'search';
				break;
		}
	}

	function execAdminOrderBefore(&$objectPage) {
		$mode = $objectPage->getMode();
		switch ($mode) {
			case 'sln_commit':
			case 'sln_cancel':
				if (!SC_Utils::isBlank($_POST['order_id']) && SC_Utils::sfIsInt($_POST['order_id'])) {
					$order_id = $_POST['order_id'];
					$orderHash = SLN_Util::getOrderPayHash($order_id);
					$objectClient = new SLN_C_Util();

					switch ($mode) {
						case 'sln_commit':
							$ret = $objectClient->exec1Capture($orderHash, true);
							break;
						case 'sln_cancel':
							$ret = $objectClient->exec1Delete($orderHash, true);
							break;
					}

					if (!$ret) {
						$arrErr = $objectClient->getError();
						$objectPage->sln_error = implode('<br />', $arrErr);
					}
				}
				$_POST['mode'] = 'search';
				break;
				break;

			case 'sln_commit_all':
				if (!SC_Utils::isBlank($_POST['sln_commit_order_id'])) {
					foreach($_POST['sln_commit_order_id'] as $order_id) {
						if (SC_Utils::sfIsInt($order_id)) {
							$orderHash = SLN_Util::getOrderPayHash($order_id);
							$objectClient = new SLN_C_Util();

							$ret = $objectClient->exec1Capture($orderHash, true);

							if (!$ret) {
								$arrErr = $objectClient->getError();
								if (!SC_Utils::isBlank($objectPage->sln_error)) {
									$objectPage->sln_error .= '<br />';
								}
								$objectPage->sln_error .= '注文番号:' .$order_id . 'の決済でエラーが発生しました。<br />';
								$objectPage->sln_error .= implode('<br />', $arrErr);
							}
						}
					}
				}
				$_REQUEST['mode'] = 'search';
				break;
			case 'sln_cancel_all':
				if (!SC_Utils::isBlank($_POST['sln_cancel_order_id'])) {
					foreach($_POST['sln_cancel_order_id'] as $order_id) {
						if (SC_Utils::sfIsInt($order_id)) {
							$orderHash = SLN_Util::getOrderPayHash($order_id);
							$objectClient = new SLN_C_Util();

							$ret = $objectClient->exec1Delete($orderHash, true);

							if (!$ret) {
								$arrErr = $objectClient->getError();
								if (!SC_Utils::isBlank($objectPage->sln_error)) {
									$objectPage->sln_error .= '<br />';
								}
								$objectPage->sln_error .= implode('<br />', $arrErr);
							}
						}
					}
				}
				$_REQUEST['mode'] = 'search';
				break;
		}
		if (!SC_Utils::isBlank($objectPage->sln_error)) {
			$objectPage->tpl_onload .= "window.alert('決済処理でエラーが発生しました。エラー内容を確認して下さい。');";
		}
	}

	function execAdminCustomer(&$objectPage) {
		if ($objectPage->getMode() == 'delete' && SC_Utils::isBlank($objectPage->arrErr)) {
			$customer_id = $_REQUEST['edit_customer_id'];
			$arrCustomer = SC_Helper_Customer::sfGetCustomerDataFromId($customer_id, 'del_flg = 1');
			$objectClient = new SLN_C_Member();
			$ret = $objectClient->deleteMember($arrCustomer, true);
		}
	}

	function execAdminOrderEditAfter(&$objectPage) {

		if (!SC_Utils::isBlank($objectPage->arrForm['order_id']['value'])) {
			$order_id = $objectPage->arrForm['order_id']['value'];
			$objectPage->arrPaymentData = SLN_Util::getOrderPayHash($order_id);
			if ($objectPage->arrPaymentData[SLN_ORDER_COL_PAYID]) {
				$objectPage->sln_payid = $objectPage->arrPaymentData[SLN_ORDER_COL_PAYID];
				$arrPayNames = SLN_Util::getPaymentTypeNames();
				$objectPage->sln_pay_name = $arrPayNames[$objectPage->sln_payid];
				$objectPage->sln_pay_status = $objectPage->arrPaymentData['pay_status'];
			} else {
				$arrPgPayments = SLN_Util::getPayments();
				$arrPayment = $objectPage->arrPayment;
				foreach($arrPayment as $key => $payment) {
					foreach ($arrPgPayments as $pg_payment) {
						if ($pg_payment['payment_id'] == $key) {
							unset($objectPage->arrPayment[$key]);
							break;
						}
					}
				}
			}
		} else {
			$arrPgPayments = SLN_Util::getPayments();
			$arrPayment = $objectPage->arrPayment;
			foreach($arrPayment as $key => $payment) {
				foreach ($arrPgPayments as $pg_payment) {
					if ($pg_payment['payment_id'] == $key) {
						unset($objectPage->arrPayment[$key]);
						break;
					}
				}
			}
		}

		if (!SC_Utils::isBlank($objectPage->arrForm['payment_id']['value'])) {
			$payment_id = $objectPage->arrForm['payment_id']['value'];
			$paymentHash = SLN_Util::getPaymentHash($payment_id);
			$objectPage->paymentHash = $paymentHash;
		} else {
			foreach ($objectPage->arrPayment as $payment_id => $name) {
				$arrPayConfig = SLN_Util::getPaymentHash($payment_id);
				if (!SC_Utils::isBlank($arrPayConfig[SLN_PAYMENT_COL_PAYID])) {
					unset($objectPage->arrPayment[$payment_id]);
				}
			}
		}
	}

	function execAdminOrderEditBefore(&$objectPage) {
		$mode = $objectPage->getMode();
		switch ($mode) {
			case 'sln_commit':
			case 'sln_change':
			case 'sln_cancel':
			case 'sln_reauth':
				if (!SC_Utils::isBlank($_POST['order_id']) && SC_Utils::sfIsInt($_POST['order_id'])) {
					$order_id = $_POST['order_id'];
					$orderHash = SLN_Util::getOrderPayHash($order_id);
					$objectClient = new SLN_C_Util();

					switch ($mode) {
						case 'sln_commit':
							$ret = $objectClient->exec1Capture($orderHash, true);
							break;
						case 'sln_change':
							$ret = $objectClient->exec1Change($orderHash, true);
							break;
						case 'sln_cancel':
							$ret = $objectClient->exec1Delete($orderHash, true);
							break;
						case 'sln_reauth':
							$ret = $objectClient->exec1ReAuth($orderHash, true);
							break;
					}

					if (!$ret) {
						$arrErr = $objectClient->getError();
						$objectPage->sln_error = implode('<br />', $arrErr);
					}
				}
				$_GET['mode'] = 'recalculate';
				break;
		}
	}

	function execMyPageRefusalBefore(&$objectPage) {
		$mode = $objectPage->getMode();
		switch ($mode) {
			case 'complete':
				$objectCustomer = new SC_Customer();
				$customer_id = $objectCustomer->getValue('customer_id');
				$objectClient = new SLN_C_Member();
				$arrCustomer = SC_Helper_Customer::sfGetCustomerData($customer_id);

				$ret = $objectClient->invalCard($arrCustomer); // すでに無効でも無効化を発行する
				$ret = $objectClient->deleteMember($arrCustomer);
				if (!$ret) {
					$arrErr = $objectClient->getError();
					$objectPage->sln_error = implode('<br />', $arrErr);
				}
				break;
		}
	}

	function execSelectedDelivJsonEncode(&$objectPage) {

		$objectPurchase = new SC_Helper_Purchase();
		$objectPage->is_multiple = $objectPurchase->isMultiple();
		$objectPage->arrShipping = $objectPurchase->getShippingTemp($objectPage->is_multiple);

		$objectSiteSess = new SC_SiteSession();
		$objectPage->tpl_uniqid = $objectSiteSess->getUniqId();
		$orderHashTemp = $objectPurchase->getOrderTemp($objectPage->tpl_uniqid);

		$objectFormParam = new SC_FormParam();
		$objectPage->lfInitParam($objectFormParam, true, $objectPage->arrShipping);
		$objectFormParam->setParam($orderHashTemp);
		$objectFormParam->convParam();
		$objectFormParam->setParam($_POST);

		$this->arrErr = $objectFormParam->checkError();
		if (SC_Utils::isBlank($this->arrErr)) {
			$deliv_id = $objectFormParam->getValue('deliv_id');
			$objectCartSess = new SC_CartSession();
			$arrSelectedDeliv = $objectPage->getSelectedDeliv($objectCartSess, $deliv_id);
			$arrSelectedDeliv['error'] = false;

			$this->lfCheckPayment($arrSelectedDeliv['arrPayment'], $objectPage);
			echo SC_Utils::jsonEncode($arrSelectedDeliv);
			exit;
		}
	}
}