<?php
require_once CLASS_EX_REALDIR . 'page_extends/mypage/LC_Page_AbstractMypage_Ex.php';
require_once(SLN_CLASS_PATH . 'SLN_C_Member.php');

/**
 * SLN_ChangeCardクラス（保存カード変更）
 *
 * @package ソニーペイメントサービス決済モジュール
 * @author Sony Payment Services Inc.
 * @version 2.0.0
*/
class SLN_ChangeCard extends LC_Page_AbstractMypage_Ex {

	function init() {
		parent::init();
		$this->tpl_subtitle = '登録済みカード情報変更';

		$objectDate = new SC_Date(date('Y'), date('Y') + 15);
		$this->arrYear = $objectDate->getZeroYear();
		$this->arrMonth = $objectDate->getZeroMonth();

		$this->objectMdl =& SLN::getInstance();
		$this->arrConfigs = $this->objectMdl->getConfigs();

		$this->httpCacheControl('nocache');
	}

	function process() {
		parent::process();
	}

	function action() {
	    
	    $this->isToke = false;
	     
	    //トークン決済可能判断
	    if ($this->arrConfigs['credit_connection_place7'] && $this->arrConfigs['token_ninsyo_code']) {
	        $this->isToke = true;
	         
	        $this->TokenJsUrl = $this->arrConfigs['credit_connection_place7'];
	        $this->TokenNinsyoCode = $this->arrConfigs['token_ninsyo_code'];
	    }

		$objectCustomer		= new SC_Customer();
		$objectFormParam	= new SC_FormParam();
		$objectClient		= new SLN_C_Member();

		// 現在カード情報が保存されているか確認
		$beforeResults = array();
		$customer_id = $objectCustomer->getValue('customer_id');
		$arrCustomer = SC_Helper_Customer::sfGetCustomerData($customer_id);
		$ret = $objectClient->searchCard($arrCustomer);
		if ($ret) {
			$beforeResults = $objectClient->arrResults;
		}
		$objectClient->setError(false);
		
		if ($_SERVER['REQUEST_METHOD'] == 'GET') {
		    $errorCode = $_GET['errorMess'];
		    if ($errorCode) {
		        if ($errorCode == "OK") {
		            $this->success = true;
		        } else {
		            $errorCode = urldecode(base64_decode($errorCode));
		            if ($_SESSION['sln_mypage_error']['code'] == $errorCode) {
		                $this->arrErr['error2'] = '※エラーが発生しました。<br />' . $_SESSION['sln_mypage_error']['errorMess'];
		            }
		        }
		        
		    }
		}
		switch ($this->getMode()) {
			case 'inval':
			    // 無効化処理はGETでも処理が通ってしまうため、POSTメソッド以外の場合は、無効化処理を行わない
				if ($_SERVER['REQUEST_METHOD'] == 'POST') {
					$ret = $objectClient->invalCard($arrCustomer); // 無効化
					if ($ret) {
						$this->success = true;
						
						if (SLN::getInstance()->getSubData('add_card_mem_table')) {
							$isEx = SC_Query_Ex::getSingletonInstance()->get('customer_id', 'sln_dtb_mem_card_id', 'customer_id = ?', array($customer_id));
							if ($isEx) {
								SC_Query_Ex::getSingletonInstance()->exec('UPDATE sln_dtb_mem_card_id SET mem_id = mem_id + 1 , update_date = NOW() WHERE customer_id = ?', 
									array($customer_id));
							} else {
								SC_Query_Ex::getSingletonInstance()->insert('sln_dtb_mem_card_id', 
									array('customer_id' => $customer_id, 'mem_id' => 1, 'update_date' => 'CURRENT_TIMESTAMP'));
							}   
						}
						
					} else {
						$arrErr = $objectClient->getError();
						$this->arrErr['error'] = '※ 登録クレジットカード無効化でエラーが発生しました。<br />' . implode('<br />', $arrErr);
					}
					$objectFormParam = new SC_FormParam();
					$this->registParam($objectFormParam);
					$this->arrForm = $objectFormParam->getFormParamList();
				}
				break;
			case 'uninval':
				$arrForm  = $objectFormParam->getHashArray();
				$ret = $objectClient->unInvalCard($arrCustomer); // 無効化解除
				if ($ret) {
					$this->success = true;
				} else {
					$arrErr = $objectClient->getError();
					$this->arrErr['error'] = '※ 登録クレジットカード無効化解除でエラーが発生しました。<br />' . implode('<br />', $arrErr);
				}
				$objectFormParam = new SC_FormParam();
				$this->registParam($objectFormParam);
				$this->arrForm = $objectFormParam->getFormParamList();
				break;
			case 'regist'://カード登録
				$this->registParam($objectFormParam);
				$objectFormParam->setParam($_POST);
				$this->arrErr = $objectFormParam->checkError();
				if (SC_Utils::isBlank($this->arrErr)) {

					// Login無効＋会員無効の場合は無効化解除する（失敗してもカード無効になる）
					if ($beforeResults['KaiinStatus'] == 2 || $beforeResults['KaiinStatus'] == 3) {
					    $_SESSION['sln_change_unInvalCard'] = $beforeResults['KaiinStatus'];
						$ret = $objectClient->unInvalCard($arrCustomer); // 無効化解除
						$objectClient->setError(false);
						sleep(5); // 決済サーバーからの通知待ち
					}

					$arrForm  = $objectFormParam->getHashArray();
					$ret = $objectClient->saveCard($arrCustomer, $arrForm);
					if ($ret) {
						$this->success = true;
					} else {
						$arrErr = $objectClient->getError();
						$this->arrErr['error2'] = '※ クレジットカード登録でエラーが発生しました。<br />' . implode('<br />', $arrErr);
						$this->arrForm = $objectFormParam->getFormParamList();
						if ($beforeResults['KaiinStatus'] == 3) {
							$objectClient->invalCard($arrCustomer); // 再度無効化
						}
					}
				} else {
					$this->arrForm = $objectFormParam->getFormParamList();
				}
				break;
			case 'change'://カード変更
				$this->registParam($objectFormParam);
				$objectFormParam->setParam($_POST);
				$this->arrErr = $objectFormParam->checkError();
				if (SC_Utils::isBlank($this->arrErr)) {

				    // 会員無効の場合は無効化解除する（失敗してもカード無効になる）
				    if ($beforeResults['KaiinStatus'] == 3) {
				        $_SESSION['sln_change_unInvalCard'] = $beforeResults['KaiinStatus'];
				        $objectClient->unInvalCard($arrCustomer); // 無効化解除
				        $objectClient->setError(false);
				        sleep(5); // 決済サーバーからの通知待ち
				    }

					$arrForm  = $objectFormParam->getHashArray();
					$ret = $objectClient->changeCard($arrCustomer, $arrForm);
					if ($ret) {
						$this->success = true;
					} else {
						$arrErr = $objectClient->getError();
						$this->arrErr['error2'] = '※ クレジットカード更新でエラーが発生しました。<br />' . implode('<br />', $arrErr);
						$this->arrForm = $objectFormParam->getFormParamList();
						if ($beforeResults['KaiinStatus'] == 3) {
							$objectClient->invalCard($arrCustomer); // 再度無効化
						}
					}
				} else {
					$this->arrForm = $objectFormParam->getFormParamList();
				}
				break;
			default:
				$this->registParam($objectFormParam);
				$this->arrForm = $objectFormParam->getFormParamList();
				break;
		}

		$objectClient = new SLN_C_Member();
		$ret = $objectClient->searchCard($arrCustomer);
		if ($ret) {
			$this->dataHash = $objectClient->arrResults;
		}
	}

	function registParam(&$objectFormParam) {

		$objectQuery =& SC_Query::getSingletonInstance();
		$ret = $objectQuery->get('sub_data', 'dtb_module', 'module_code =?', array(SLN_CODE));
		$subData = unserialize($ret);
		
		if ($_POST['Token']) {
		    $objectFormParam->addParam("トークン", "Token");
		} else {
		    $objectFormParam->addParam(		"カード番号", 		"CardNo",		16,	'n',	array("EXIST_CHECK", "MAX_LENGTH_CHECK", "NUM_CHECK"));
		    $objectFormParam->addParam(		"カード有効期限年",	"CardExpYear",	2,	'n',	array("EXIST_CHECK", "MAX_LENGTH_CHECK", "NUM_CHECK"));
		    $objectFormParam->addParam(		"カード有効期限月",	"CardExpMonth", 2,	'n',	array("EXIST_CHECK", "MAX_LENGTH_CHECK", "NUM_CHECK"));
		    if(in_array('KanaSei', $subData['user_settings']['attestation_assistance'])) {
		        $objectFormParam->addParam(	"カード名義:姓",		"KanaSei",		10,	'KVCa',	array("EXIST_CHECK", "MAX_LENGTH_CHECK", "SPTAB_CHECK", "KANA_CHECK"));
		        $objectFormParam->addParam(	"カード名義:名",		"KanaMei",		10,	'KVCa',	array("EXIST_CHECK", "MAX_LENGTH_CHECK", "SPTAB_CHECK", "KANA_CHECK"));
		    }
		    if($subData['user_settings']['SecCd'] == "1") {
		        $objectFormParam->addParam(	"セキュリティコード",		"SecCd",		4,	'n',	array("EXIST_CHECK", "MAX_LENGTH_CHECK", "NUM_CHECK"), "");
		    }
		    if(in_array('BirthDay', $subData['user_settings']['attestation_assistance'])) {
		        $objectFormParam->addParam(	"生月日",			"BirthDay", 	4,	'a',	array("EXIST_CHECK", "MAX_LENGTH_CHECK", "NUM_CHECK"));
		    }
		    if(in_array('TelNo', $subData['user_settings']['attestation_assistance'])) {
		        $objectFormParam->addParam(	"電話番号(下4桁)",	"TelNo",		4,	'n',	array("EXIST_CHECK", "MAX_LENGTH_CHECK", "NUM_CHECK"));
		    }   
		}
	}
}