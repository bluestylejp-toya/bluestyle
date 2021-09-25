<?php
require_once(MODULE_REALDIR . 'mdl_sln/defines.php');
if (is_file(PLUGIN_UPLOAD_REALDIR . 'SLNTerm217/SLNTerm.php')) {
    require_once(PLUGIN_UPLOAD_REALDIR . 'SLNTerm217/SLNTerm.php');
}

/**
 * SLN_C_Baseクラス（基底）
 *
 * @package ソニーペイメントサービス決済モジュール
 * @author Sony Payment Services Inc.
 * @version 2.0.0
*/
class SLN_C_Base {

	var $arrError = array();
	var $request_error = null;
	var $netError = false;
	var $arrResults = null;

	function setError($msg = false) {
		if ($msg === false) {
			$this->arrError = array();
		} else {
			$this->arrError[] = $msg;
		}
	}

	function getError() {
		return $this->arrError;
	}

	function setResults($arrResults) {
		$this->arrResults = $arrResults;
	}

	function getResults() {
		if (SC_Utils::isBlank($this->arrResults[0]) && !SC_Utils::isBlank($this->arrResults)) {
			return $this->arrResults;
		}
		return $this->arrResults[0];
	}

	function getSendData($sendKeyHash, $orderHash, $paramHash, $slnSettingHash) {
		$sendDataHash = array();
		foreach ($sendKeyHash as $key) {
			switch ($key) {
			    case 'Token':
			        $sendDataHash[$key] = $paramHash['Token'];
			        break;
				case 'MerchantId':
					// 貴社を識別するためのID
					$sendDataHash[$key] = $slnSettingHash['MerchantId'];
					break;
				case 'MerchantPass':
					// 貴社を識別するためのパスワード
					$sendDataHash[$key] = $slnSettingHash['MerchantPass'];
					break;
				case 'TenantId':
					// テナント
					if (!SC_Utils::isBlank($slnSettingHash['TenantId'])) {
						$sendDataHash[$key] = $slnSettingHash['TenantId'];
					}
					break;
				case 'CardExp':
					// クレジットカードの有効期限
					$sendDataHash[$key] = $paramHash['CardExpYear'] . $paramHash['CardExpMonth'];
					break;
				case 'PayType':
					// 支払方法を識別するためのコード
					$sendDataHash[$key] = $paramHash['PayType'];
					break;
				case 'TransactionDate':	// 処理日付
				case 'SalesDate':	// カード利用明細に表示する利用日
					$sendDataHash[$key] = date("Ymd");
					break;
				case 'MerchantFree1':	// EC-CUBEの注文番号を入れる
					$sendDataHash[$key] = $orderHash['order_id'];
					break;
				case 'NameKanji':
					// ユーザ漢字氏名
					$sendDataHash[$key] = mb_substr(mb_convert_kana($orderHash['order_name01'] . $orderHash['order_name02'], 'KVSA', 'UTF-8'),0,20);
					break;
				case 'NameKana':
					// ユーザカナ氏名
					$sendDataHash[$key] = mb_substr(mb_convert_kana($orderHash['order_kana01'] . $orderHash['order_kana02'], 'KVSA', 'UTF-8'),0,20);;
					break;
				case 'TelNo':	// 電話番号		    
					// クレジットカードの場合は下4ケタ、オンライン収納の場合はハイフン付全部
					if (!empty($paramHash[$key])) {
						$sendDataHash[$key] = $paramHash[$key];
					} else {
						// 4桁-4桁-4桁はフォーマットエラーになる。その場合は最後の番号を消す
						if (strlen($orderHash['order_tel01'].$orderHash['order_tel02'].$orderHash['order_tel03']) >= 12) {
							$orderHash['order_tel03'] = substr($orderHash['order_tel03'],0,3);
						}
						$sendDataHash[$key] = $orderHash['order_tel01'] . '-' . $orderHash['order_tel02'] . '-' . $orderHash['order_tel03'];
					}
					
					if ($paramHash['Token']) {
					    $sendDataHash[$key] = null;
					}
					break;
				case 'ReturnURL':	// 戻り先URL
					$netUrl = new Net_URL(HTTP_URL);
					$netUrl->path = SHOPPING_COMPLETE_URLPATH;
					$sendDataHash[$key] = $netUrl->getUrl();
					if (SC_Display::detectDevice() === DEVICE_TYPE_MOBILE) {
						$sendDataHash[$key] .= '?' . ini_get("session.name") . '=' . session_id();
					}
					$sendDataHash[$key] = substr($sendDataHash[$key],0,128);
					break;
				case 'PayLimit':	// 支払期限
					$sendDataHash[$key] = date("YmdHi", strtotime("+7 day"));
					break;
				case 'Amount':	// 支払金額
					$sendDataHash[$key] = $orderHash['payment_total'];
					break;
				case 'ShouhinName':	// 商品名
					$sendDataHash[$key] = SLN_Util::getShouhinName($orderHash['order_id']);
					break;
				case 'KanaSei':
				case 'KanaMei':
					$sendDataHash[$key] = mb_convert_kana($paramHash[$key], 'kha', 'UTF-8');
					break;
				case 'KaiinId':
					if (!SC_Utils::isBlank($orderHash['customer_id']) && $orderHash['customer_id'] != '0' ) {
					    if (SLN::getInstance()->getSubData('add_card_mem_table')) {
					        $mem_id = SC_Query_Ex::getSingletonInstance()->get('mem_id', 'sln_dtb_mem_card_id', 'customer_id = ?', array($orderHash['customer_id']));
					        if (!$mem_id) {
					            $mem_id = 0;
					        }
					        
					        $sendDataHash[$key] =  sprintf("%03d%010d", 500 + $mem_id, $orderHash['customer_id']);
					    } else {
					        $sendDataHash[$key] = '500' . sprintf("%010d",$orderHash['customer_id']);
					    }
					}
					break;
				case 'KaiinPass':
					if (!SC_Utils::isBlank($orderHash['customer_id']) && $orderHash['customer_id'] != '0' ) {
						$sendDataHash[$key] = substr(preg_replace("[^0-9a-zA-Z]","",md5($orderHash['customer_id'] . AUTH_MAGIC)),0,12);
					}
					break;
				case 'SecCd':
					$sendDataHash[$key] = $paramHash['SecCd'];
					break;
				case 'ProcNo':
				    $sendDataHash[$key] = $paramHash['ProcNo'];
				    break;
				case 'RedirectUrl'://フロント側に帰る画面(メール送信しません)
				    $sendDataHash[$key] = array_key_exists('RedirectUrl', $paramHash) ? $paramHash['RedirectUrl'] : HTTPS_URL . 'shopping/sln_3d.php';
				    break;
				case 'PostUrl'://ソニーpostでデータが来ます。結果によりメール送信を行う
				    $sendDataHash[$key] = array_key_exists('PostUrl', $paramHash) ? $paramHash['PostUrl'] : HTTPS_URL . 'shopping/sln_3d_post.php';
				    break;
				case 'Free1':
				case 'Free2':
				case 'Free3':
				case 'Free4':
				case 'Free5':
				case 'Free6':
				case 'Free7':
				case 'Comment':	// ご案内1
				case 'Free8':
				case 'Free9':
				case 'Free10':
				case 'Free11':
				case 'Free12':
				case 'Free13':
				case 'Free14':
				case 'Free15':
				case 'Free16':
					$sendDataHash[$key] = mb_convert_kana($slnSettingHash[$key], 'ASK', 'UTF-8');
					break;
				case 'MerchantFree2':
					if ($orderHash['order_id']) {
						//受注IDをもつ電文
						// 定期購入番号|EC-CUBE バージョン|会員ID
						$sendDataHash[$key] = sprintf("%s|%s|%s", "0", ECCUBE_VERSION, $orderHash['customer_id'] ? $orderHash['customer_id'] : null);
					} else {
						//受注IDをもたない電文
						// EC-CUBE 0|バージョン
						$sendDataHash[$key] = sprintf("%s|%s", "0", ECCUBE_VERSION);
					}
					break;
				case 'MerchantFree3': // EC-CUBE会員ID
					$sendDataHash[$key] = $orderHash['customer_id'] ? $orderHash['customer_id'] : null;
					break;
					// あとは変数名中にあればそのまま使う
				default:
					if (isset($paramHash[$key])) {
						$sendDataHash[$key] = $paramHash[$key];
					} elseif (isset($orderHash[$key])) {
						$sendDataHash[$key] = $orderHash[$key];
					} elseif (isset($slnSettingHash[$key])) {
						$sendDataHash[$key] = $slnSettingHash[$key];
					}
			}
		}
		// 定期購入の場合には、MerchantFree2を書き換える
		if (class_exists(SLNTerm_SC_Helper_Purchase) && $orderHash['order_id']) {
			$sendDataHash = SLNTerm_SC_Helper_Purchase::setMerchantFree2($sendDataHash, $orderHash, $paramHash);
		}
		return $sendDataHash;
	}

	/**
	 * 通常決済
	 * @param unknown $url
	 * @param unknown $sendKeyHash
	 * @param unknown $orderHash
	 * @param unknown $paramHash
	 * @param unknown $slnSettingHash
	 * @return boolean
	 */
	function orderRequest($url, $sendKeyHash, $orderHash, $paramHash, $slnSettingHash) {

		$orderHash = SLN_Util::setOrderIdToHash($orderHash);
		$sendDataHash = $this->getSendData($sendKeyHash, $orderHash, $paramHash, $slnSettingHash);

		$requestParamHash = $paramHash;
		$ret = $this->accessSlnServer($url, $sendDataHash);
		if ($ret) {
			$paramHash = $this->getResults();
		} else {
			$paramHash = array();
			$paramHash['request_error'] = $this->request_error;
		}

		$paramHash['OrderID'] = $orderHash['OrderID'];
		$paramHash['Amount'] = $orderHash['payment_total'];

		if (!SC_Utils::isBlank($requestParamHash['CardSeq'])) {
			$paramHash['CardSeq'] = $requestParamHash['CardSeq'];
		}

		if (!SC_Utils::isBlank($requestParamHash['pay_status'])) {
			$paramHash['pay_status'] = $requestParamHash['pay_status'];
		}
		if (!SC_Utils::isBlank($requestParamHash['success_pay_status']) && SC_Utils::isBlank($this->getError())) {
			$paramHash['pay_status'] = $requestParamHash['success_pay_status'];
		}else if (!SC_Utils::isBlank($requestParamHash['fail_pay_status']) && !SC_Utils::isBlank($this->getError())) {
			$paramHash['pay_status'] = $requestParamHash['fail_pay_status'];
		} elseif ($this->netError) {
			$paramHash['pay_status'] = SLN_PAY_STATUS_FAIL;
		}

		SLN_Util::setOrderPayHash($orderHash, $paramHash);

		if (!SC_Utils::isBlank($this->getError())) {
			return false;
		}

		return true;
	}
	
	/**
	 * 3D決済
	 * @param unknown $url
	 * @param unknown $sendKeyHash
	 * @param unknown $orderHash
	 * @param unknown $paramHash
	 * @param unknown $slnSettingHash
	 * @param CryptAES $CryptAES
	 */
	function orderRedirect($url, $sendKeyHash, $orderHash, $paramHash, $slnSettingHash, CryptAES $CryptAES) {
	    $orderHash = SLN_Util::setOrderIdToHash($orderHash);
	    $sendDataHash = $this->getSendData($sendKeyHash, $orderHash, $paramHash, $slnSettingHash);
	    
	    // EC-CUBE折り返し処理
	    /*
	    if ($url == "") {
	        $arrReturn = array();
	        $arrReturn['ResponseCd'] = 'OK';
	        $this->setResults($arrReturn);
	        return true;
	    }
	    */
	    
	    $encryptValue = $this->aesEnCode($sendDataHash, $CryptAES);
	    
	    $paramHash['success_pay_status'] = SLN_PAY_STATUS_UNSETTLED;
		
	    unset($sendDataHash['MerchantPass']);
		unset($sendDataHash['CardNo']);
	    unset($sendDataHash['CardExp']);
	    unset($sendDataHash['KanaSei']);
	    unset($sendDataHash['KanaMei']);
	    unset($sendDataHash['BirthDay']);
	    unset($sendDataHash['SecCd']);
	    unset($sendDataHash['TelNo']);
		
	    SLN_Util::setOrderPayHash($orderHash, $sendDataHash);
	    
	    
	    echo sprintf('<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
                <html>
                <head>
                <title></title>
                </head>
                <body onload="javascript:document.forms[\'redirectForm\'].submit();">
                	<form action="%s" method="post" id="redirectForm">
                		<input type="hidden" name="MerchantId" value="%s" />
                		<input type="hidden" name="EncryptValue" value="%s" />
                	</form>
                </body>
                </html>', $url, $sendDataHash['MerchantId'], $encryptValue);
	    
	    exit;
	}

	/***
	 * マイページによりカード登録
	 * @param unknown $url
	 * @param unknown $sendDataHash
	 * @param CryptAES $CryptAES
	 * @param unknown $reUrl
	
	function mypageRedirect($url, $sendDataHash, CryptAES $CryptAES, $reUrl = null) {
	    // EC-CUBE折り返し処理
	    
	    
	    $sendDataHash['RedirectUrl'] = $reUrl ? $reUrl : HTTPS_URL . 'mypage/sln_card_3d.php';

	    unset($sendDataHash['PostUrl']);
	    if (!$sendDataHash['ProcNo']) {
	        $sendDataHash['ProcNo'] = "0000000";
	    }
	    
	    $encryptValue = $this->aesEnCode($sendDataHash, $CryptAES);
	    
	    echo sprintf('<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
                <html>
                <head>
                <title></title>
                </head>
                <body onload="javascript:document.forms[\'redirectForm\'].submit();">
                	<form action="%s" method="post" id="redirectForm">
                		<input type="hidden" name="MerchantId" value="%s" />
                		<input type="hidden" name="EncryptValue" value="%s" />
                	</form>
                </body>
                </html>', $url, $sendDataHash['MerchantId'], $encryptValue);
	    
	    exit;
	}
	 */
	function aesEnCode($requestParamHash, CryptAES $CryptAES) {
	    $arrEnCodeData = array();
	    foreach ($requestParamHash as $key => $value) {
	        if ($key == "MerchantId") {
	            continue;
	        } else {
	            $arrEnCodeData[] = sprintf("%s=%s", $key, $this->url_encode($value));
	        }
	    }
	    
	    $str = $CryptAES->encrypt(join($arrEnCodeData, '&'));
	    return base64_encode($str);
	}
	
	function aesDeCode($body, CryptAES $CryptAES) {

        //$body = $this->url_decode($body);
	    $body = base64_decode($body);
	    $body = $CryptAES->decrypt($body);
	    
	    $data = explode('&', $body);
	    
	    $reData = array();
	    
	    foreach ($data as $str) {
	        list($key, $value) = explode('=', $str);
	        $reData[$key] = $this->url_decode($value);
	    }
	    
	    return $reData;
	}
	
	function url_encode($string){
	    return urlencode($string);
	}
	
	function url_decode($string){
	    return urldecode($string);
	}

	function accessSlnServer($url, $sendDataHash, $admin = false) {

		// EC-CUBE折り返し処理
		/*
		if ($url == "") {
			$arrReturn = array();
			$arrReturn['ResponseCd'] = 'OK';
			$this->setResults($arrReturn);
			return true;
		}
		*/

		$objectReq = new HTTP_Request($url);
		$objectReq->setMethod(HTTP_REQUEST_METHOD_POST);
		
		foreach ($sendDataHash as $key => $value) {
			$objectReq->addPostData($key, $value);
		}

		$ret = $objectReq->sendRequest();
		if (PEAR::isError($ret)) {
			$msg = '通信エラーが発生しました。:' . $ret->getMessage();
			$this->setError($msg);
			$this->netError = true;
			return false;
		}

		// レスポンスコード一覧
		// http://www.faqs.org/rfcs/rfc2616.html
		$httpcode = $objectReq->getResponseCode();
		if ($httpcode != 200) {
			$msg = '決済サーバーエラーが発生しました。:HTTPレスポンスコード:(' . $httpcode . ')';
			$this->setError($msg);
			$this->netError = true;
			return false;
		}

		$responsebody = $objectReq->getResponseBody();

		if (SC_Utils::isBlank($responsebody)) {
			$msg = 'レスポンスデータエラーが発生しました。: レスポンスが空です。';
			$this->setError($msg);
			return false;
		}

		$arrReturn = $this->parseResponse($responsebody, $admin);
 
		$this->setResults($arrReturn);
		if (!SC_Utils::isBlank($this->getError())) {
			return false;
		}

		return true;
	}

	function parseResponse($string, $admin = false) {
		$arrReturn = array();
		$arrTmpAnd = explode('&', trim($string));
		foreach($arrTmpAnd as $str) {
			list($key, $val) = explode('=', $str);
			$arrReturn[$key] = trim($val);
		}
		
		if (isset($arrReturn['ResponseCd'])  && ($arrReturn['ResponseCd'] != 'OK')) {
            $error_msg = $this->createErrCode($arrReturn['ResponseCd'], $admin);
            $request_error = $this->createErrCode($arrReturn['ResponseCd'], true);
            if (empty($error_msg)) {
                // 未定義エラー
                $error_msg = 'システムエラーが発生しました。';
                $request_error = 'システムエラーが発生しました。ソニーペイメントサービスにお問合せください。(undefined)';
            }

            $this->setError($error_msg);
            $this->request_error = $request_error;
		}
		return $arrReturn;
	}

	function createErrCode($codes, $admin = false) {
		require_once(SLN_CLASS_PATH . 'GetErrorMsg.php');

		$errorObjectMsg = new GetErrorMsg();
		$codeArray = array();
		$arrTmpl = explode('|', $codes);
		$max = count($arrTmpl);
		for($i = 0; $i < $max; $i++) {
			$codeArray[] = trim($arrTmpl[$i]);
		}

		// 表示するのは１つのみ
		$code = $codeArray[0];
		$arrErrMsg = $errorObjectMsg->getErrorMessageByCode($code) ;
		if ($admin) return $arrErrMsg['adminmessage'];
		return $arrErrMsg['message'];
	}
}
