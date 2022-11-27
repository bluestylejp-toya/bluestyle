<?php
require_once(SLN_CLASS_PATH . 'SLN_C_Credit.php');
require_once(SLN_CLASS_PATH . 'SLN_C_3DCredit.php');
require_once(SLN_CLASS_PATH . 'SLN_C_Util.php');
require_once(SLN_CLASS_PATH . 'SLN_C_Member.php');
require_once(SLN_CLASS_PATH . 'SLN_C_RegistCredit.php');
if (is_file(PLUGIN_UPLOAD_REALDIR . 'SLNTerm217/SLNTerm.php')) {
	require_once(PLUGIN_UPLOAD_REALDIR . 'SLNTerm217/SLNTerm.php');
}

/**
 * SLN_Creditクラス（クレジットカード用）
 *
 * @package ソニーペイメントサービス決済モジュール
 * @author Sony Payment Services Inc.
 * @version 2.0.0
 */
class SLN_Credit {

	function initParam(&$objectFormParam, &$paymentHash, &$orderHash ) {
		//インスタンス生成
		$objectQuery =& SC_Query::getSingletonInstance();
		$ret = $objectQuery->get('sub_data', 'dtb_module', 'module_code =?', array(SLN_CODE));
		$subData = unserialize($ret);

		if ($_POST['Token']) {
		    $objectFormParam->addParam("トークン", "Token");
		} else {
		    $objectFormParam->addParam("カード番号", "CardNo", 16, 'n', array("EXIST_CHECK", "MAX_LENGTH_CHECK", "NUM_CHECK"));
		    $objectFormParam->addParam("カード有効期限年", "CardExpYear", 2, 'n', array("EXIST_CHECK", "MAX_LENGTH_CHECK", "NUM_CHECK"));
		    $objectFormParam->addParam("カード有効期限月", "CardExpMonth", 2, 'n', array("EXIST_CHECK", "MAX_LENGTH_CHECK", "NUM_CHECK"));
		    if(in_array('KanaSei', $subData['user_settings']['attestation_assistance'])) {
		        $objectFormParam->addParam("カード名義:姓", "KanaSei", 10, 'KVCa', array("EXIST_CHECK", "MAX_LENGTH_CHECK", "SPTAB_CHECK", "KANA_CHECK"));
		        $objectFormParam->addParam("カード名義:名", "KanaMei", 10, 'KVCa', array("EXIST_CHECK", "MAX_LENGTH_CHECK", "SPTAB_CHECK", "KANA_CHECK"));
		    }
		    if($subData['user_settings']['SecCd'] == "1") {
		        $objectFormParam->addParam("セキュリティコード", "SecCd", 4, 'n', array("EXIST_CHECK", "MAX_LENGTH_CHECK", "NUM_CHECK"), "");
		    }
		    if(in_array('BirthDay', $subData['user_settings']['attestation_assistance'])) {
		        $objectFormParam->addParam("生月日", "BirthDay", 4, 'a', array("EXIST_CHECK", "NUM_COUNT_CHECK", "NUM_CHECK"));
		    }
		    if(in_array('TelNo', $subData['user_settings']['attestation_assistance'])) {
		        $objectFormParam->addParam("電話番号(下4桁)", "TelNo", 4, 'n', array("EXIST_CHECK", "NUM_COUNT_CHECK", "NUM_CHECK"));
		    }		    
		}

		$objectFormParam->addParam("お支払い方法", "PayType", INT_LEN, 'n', array("MAX_LENGTH_CHECK", "GRAPH_CHECK"), "");

		// 登録済みクレジットカード決済ができる場合
		$paymentHash['regist_credit'] = $this->enableCustomerRegist();
		if($paymentHash['regist_credit'] && $subData['user_settings']['member_regist'] == "1") {
			$objectFormParam->addParam("カード情報登録", "register_card", INT_LEN, 'n', array("MAX_LENGTH_CHECK", "NUM_CHECK"), "");
		}
	}

	function enableCustomerRegist() {
		$objectMdl =& SLN::getInstance();
		$objectQuery =& SC_Query::getSingletonInstance();
		$arrVal = array(SLN_CODE, (string)SLN_PAYID_REGIST_CREDIT);
		if ($objectQuery->count("dtb_payment", "module_code = ? AND " . SLN_PAYMENT_COL_PAYID . " = ? AND del_flg = 0", $arrVal)) {
			return true;
		}
		return false;
	}

	function checkError(&$objectFormParam) {
		$paramHash = $objectFormParam->getHashArray();
		$errorObject = new SC_CheckError($paramHash);
		$errorObject->arrErr = $objectFormParam->checkError();
		
		if (!$paramHash['Token']) {//トークン決済場合　エラー判断をスキップ
		    // 追加チェックカード番号
		    if (SC_Utils::isBlank($errorObject->arrErr)) {
		        if (strlen($paramHash['CardNo']) < 11 || strlen($paramHash['CardNo']) > 16) {
		            $errorObject->arrErr['CardNo'] = '※ カード番号の桁数は12文字～16文字で入力して下さい。<br />';
		        }
		    }
		    
		    // 追加チェックカードセキュリティコード
		    if (SC_Utils::isBlank($errorObject->arrErr)) {
		        if (!SC_Utils::isBlank($paramHash['SecCd']) && (strlen($paramHash['SecCd']) < 3 || strlen($paramHash['SecCd']) > 4)) {
		            $errorObject->arrErr['SecCd'] = '※ セキュリティコードは３桁か４桁で入力して下さい。<br />';
		        }
		    }
		    
		    // 追加チェックカード有効期限
		    if (SC_Utils::isBlank($errorObject->arrErr)) {
		        if (strtotime('-1 month') > strtotime('20' . $paramHash['CardExpYear'] . '/' . $paramHash['CardExpMonth'] . '/1')) {
		            $errorObject->arrErr['CardExpYear'] = '※ カードの有効期限が過ぎています。<br />';
		        }
		    }		    
		}

		return $errorObject->arrErr;
	}

	function actionByMode($mode, &$objectFormParam, &$orderHash, &$objectPage) {
	    
	    $objectPage->isToke = false;
	    
	    //トークン決済可能判断
	    if ($objectPage->arrConfigs['credit_connection_place7'] && $objectPage->arrConfigs['token_ninsyo_code']) {
	        $objectPage->isToke = true;
	        
	        $objectPage->TokenJsUrl = $objectPage->arrConfigs['credit_connection_place7'];
	        $objectPage->TokenNinsyoCode = $objectPage->arrConfigs['token_ninsyo_code'];
	    }
	    
	    if ($_SERVER['REQUEST_METHOD'] == 'GET') {
	        $errorCode = $_GET['errorMess'];
	        if ($errorCode) {
	            $errorCode = urldecode(base64_decode($errorCode));
	            if ($_SESSION['sln_pay_error']['code'] == $errorCode) {
	                $objectPage->arrErr['payment'] = '※ 決済でエラーが発生しました。<br />' . $_SESSION['sln_pay_error']['errorMess'];
	            }    
	        }   
	    }

		// 利用可能な支払回数の取得
		$objectPage->arrPayMethod =  SLN_Util::getActivePayMethod($objectPage->arrConfigs['payKbnKaisu']);

		// 月日プルダウン
		$objectDate = new SC_Date(date('Y'), date('Y') + 20);
		$objectPage->arrYear = $objectDate->getZeroYear();
		$objectPage->arrMonth = $objectDate->getZeroMonth();

		// 登録済みクレジットカード決済が可能かどうか、またすでにカードが登録済みかどうかで表示を分ける
		if ($objectPage->paymentHash['regist_credit'] && !SC_Utils::isBlank($orderHash['customer_id']) && $orderHash['customer_id'] != 0) {
			$objectPage->tpl_regist_card_form = true;

			$objectClientMember = new SLN_C_Member();
			$ret = $objectClientMember->searchCard($orderHash);
			if ($ret && $objectClientMember->arrResults['KaiinStatus'] == 0) {
				$objectPage->tpl_regist_card_form = false;
			}
		}

		// 定期購入商品があるかどうかの確認
		$productIdArray = array();
		$orderHashDetails = SC_Helper_Purchase::getOrderDetail($orderHash['order_id'], false);
		foreach ($orderHashDetails as $orderHashDetail) {
			$productIdArray[] = $orderHashDetail['product_id'];
		}

		$objectPage->tpl_pg_regist_card_force = false;
		if (class_exists(SLNTerm_SC_Helper_Purchase) && SLNTerm_SC_Helper_Purchase::hasTerminalProductByProductIds($productIdArray)) {
			$objectPage->tpl_pg_regist_card_force = true;
		}
		
		if ($objectPage->arrErr['payment']) {
		    return;
		}


		$objectPurchase = new SC_Helper_Purchase();
		switch($mode) {
			case 'next':
			    
			    $objectPage->arrErr = $this->checkError($objectFormParam);
				// エラーがあったら後続処理は不要
				if (!SC_Utils::isBlank($objectPage->arrErr)) {
					break;
				}

				if ($objectPage->arrConfigs['3d_pay'] == SLN_3D_PAY1) {

				    if (!$objectPage->arrConfigs['credit_connection_place6']) {
				        $objectPage->arrErr['payment'] = '※ 決済でエラーが発生しました。<br />　3Dセキュア認証接続先は未設定です。';
				        break;
				    }
				    
				    if ($objectFormParam->getValue('register_card') == '1') {
				        
				        SC_Query_Ex::getSingletonInstance()->update('dtb_order', array(SLN_ORDER_COL_PAYID => SLN_PAYID_REGIST_CREDIT), 'order_id = ?', array($orderHash['order_id']));
				        
				        $objectClient = new SLN_C_Member();
				        $arrCustomer = SC_Helper_Customer::sfGetCustomerData($orderHash['customer_id']);
			            if ($objectClient->searchCard($arrCustomer)) {
			                $res = $objectClient->getResults();
			                if ($res['ResponseCd'] == "OK") {
			                    //$orderHash['ProcNo'] = sprintf("%07d", $orderHash['order_id']);
			                    //$orderHash['ProcNo'] = "0000000";
			                    
			                    if ($objectClient->arrResults['KaiinStatus'] == 2 || $objectClient->arrResults['KaiinStatus'] == 3) {
			                        $_SESSION['sln_unInvalCard'] = $objectClient->arrResults['KaiinStatus'];
			                        $ret = $objectClient->unInvalCard($arrCustomer); // 無効化解除
			                        $objectClient->setError(false);
			                        sleep(5); // 決済サーバーからの通知待ち
			                    }
			                    
			                    $result = $objectClient->changeCard($arrCustomer, $objectFormParam->getHashArray(), HTTPS_URL . 'shopping/sln_3d.php');
			                    if ($objectClient->arrResults['ResponseCd'] == "OK") {//登録成功ため決済を行う
			                        //ソニー決済ページにRedirect
			                        $objectFormParam->setValue('Token', '');
			                        $objectClient = new SLN_C_3DCredit();
			                        $objectClient->redirectMemPayment($orderHash, $objectFormParam->getHashArray());
			                        break;
			                    } else {//登録失敗ため旧かード情報を無効にする
			                        $objectClient->invalCard($arrCustomer);//カード変更失敗時に再度無効化する
			                    }
			                    
			                    $arrErr = $objectClient->getError();
			                    $objectPage->arrErr['payment'] = '※ 決済でエラーが発生しました。<br />' . implode('<br />', $arrErr);
			                    break;
			                }
			            } else {//登録チェックエラー場合
			                
			                $result = $objectClient->saveCard($arrCustomer, $objectFormParam->getHashArray(), HTTPS_URL . 'shopping/sln_3d.php');
			                if ($objectClient->arrResults['ResponseCd'] == "OK") {
			                    $objectFormParam->setValue('Token', '');
			                    $objectClient = new SLN_C_3DCredit();
			                    $objectClient->redirectMemPayment($orderHash, $objectFormParam->getHashArray());
			                    break;
				            }
			                $arrErr = $objectClient->getError();
			                $objectPage->arrErr['payment'] = '※ 決済でエラーが発生しました。<br />' . implode('<br />', $arrErr);
			                break;
			            }
				    }
				    
				    SC_Query_Ex::getSingletonInstance()->update('dtb_order', array(SLN_ORDER_COL_PAYID => SLN_PAYID_CREDIT), 'order_id = ?', array($orderHash['order_id']));
				    
				    //ソニー決済ページにRedirect
				    $objectClient = new SLN_C_3DCredit();
				    $objectClient->redirectPayment($orderHash, $objectFormParam->getHashArray());
				    
				    break;
				} else {
				    
				    $isPay = true;
				    
				    if ($objectFormParam->getValue('register_card') == '1' && $objectFormParam->getValue('Token')) {//カード登録した場合
				        // 後続処理(売上確定処理など)でのKaiinID不足によるエラー防止のため、登録済みクレジットカードに更新する。
				        SC_Query_Ex::getSingletonInstance()->update('dtb_order', array(SLN_ORDER_COL_PAYID => SLN_PAYID_REGIST_CREDIT), 'order_id = ?', array($orderHash['order_id']));
				        
				        $isPay = false;
				        
				        $objectClient = new SLN_C_Member();
				        $arrCustomer = SC_Helper_Customer::sfGetCustomerData($orderHash['customer_id']);
				        if ($objectClient->searchCard($arrCustomer)) {
				            $res = $objectClient->getResults();
				            if ($res['ResponseCd'] == "OK") { 
				                if ($objectClient->arrResults['KaiinStatus'] == 2 || $objectClient->arrResults['KaiinStatus'] == 3) {
				                    $ret = $objectClient->unInvalCard($arrCustomer); // 無効化解除
				                    $objectClient->setError(false);
				                    sleep(5); // 決済サーバーからの通知待ち
				                }
				                
				                $result = $objectClient->changeCard($arrCustomer, $objectFormParam->getHashArray());
				                if ($result) {//登録成功ため決済を行う
				                    $objectClient = new SLN_C_RegistCredit();
				                    $result = $objectClient->requestPayment($orderHash, array('PayType' => $objectFormParam->getValue('PayType')));
				                } else {//登録失敗ため旧かード情報を無効にする
				                    $objectClient->invalCard($arrCustomer);//カード変更失敗時に再度無効化する
				                }
				            }
				        } else {//カード登録していない場合
				            $objectClient->setError();
				            $result = $objectClient->saveCard($arrCustomer, $objectFormParam->getHashArray());//トークンによりカードを登録する
				            if ($result) {
				                $objectClient = new SLN_C_RegistCredit();
				                $result = $objectClient->requestPayment($orderHash, array('PayType' => $objectFormParam->getValue('PayType')));
				            }
				        }
				    }
				    
				    if ($isPay) {
				        $objectClient = new SLN_C_Credit();
				        $result = $objectClient->requestPayment($orderHash, $objectFormParam->getHashArray());
				    }
				}
				if (!$result) {
					$arrErr = $objectClient->getError();
					$objectPage->arrErr['payment'] = '※ 決済でエラーが発生しました。<br />' . implode('<br />', $arrErr);
					break;
				}

				if ($objectFormParam->getValue('register_card') == '1' && strlen($objectFormParam->getValue('Token')) == 0) {
					$paramHash[0]['register_card'] = '1';
					SLN_Util::setOrderPayHash($orderHash, $paramHash);
					$orderHash['register_card'] = '1';
				}

				$arrResults = $objectClient->getResults();
				$order_status = ORDER_NEW;

				// 即時売上時は入金済みにする
				$objectMdl =& SLN::getInstance();
				$slnSettingHash = $objectMdl->getConfigs();
				if ($arrResults['OperateId'] ==  '1Gathering' && $slnSettingHash['card_order_pre_end'] == SLN_ORDER_PRE_END) $order_status = ORDER_PRE_END;

				$objectQuery =& SC_Query::getSingletonInstance();
				$objectQuery->begin();
				$objectPurchase->sfUpdateOrderStatus($orderHash['order_id'], $order_status, null, null, $sqlval);
				$objectQuery->commit();
				if ($orderHash['register_card']) {
					$this->cardRegist($orderHash, $objectFormParam->getHashArray());
				}
				SC_Response::sendRedirect(SHOPPING_COMPLETE_URLPATH);

				$objectPage->actionExit();

				break;
			case 'return':
				$objectPurchase->rollbackOrder($_SESSION['order_id'], ORDER_CANCEL, true);
				SC_Response::sendRedirect(SHOPPING_CONFIRM_URLPATH);
				SC_Response::actionExit();
				break;
			case 'input':
				break;
			default:
				SC_Response::sendRedirect(ROOT_URLPATH . 'shopping/load_sln_payment_module.php?mode=input');
				SC_Response::actionExit();
				break;
		}
	}

	function cardRegist($orderHash, $paramHash = array()) {
		$objectClient = new SLN_C_Member();
		$arrCustomer = SC_Helper_Customer::sfGetCustomerData($orderHash['customer_id']);
		$objectClient->unInvalCard($arrCustomer);
		sleep(5); // 決済サーバーからの通知待ち
		$objectClient->changeCard($arrCustomer, $paramHash);
		$objectClient->saveCard($arrCustomer, $paramHash);
	}

	function getFormBloc() {
		$deviceTypeId = SC_Display::detectDevice();

		$objectMdl =& SLN::getInstance();
		$arrBlocId = $objectMdl->getSubData('bloc_setting');
		$blocId = $arrBlocId['sln_credit'][ $deviceTypeId ];
		if (empty($blocId)) {
			return null;
		}

		$layout = new SC_Helper_PageLayout();
		$arrBloc = $layout->getBlocs($deviceTypeId, 'bloc_id = ?', array($blocId), true);
		return $arrBloc[0]['tpl_path'];
	}
}