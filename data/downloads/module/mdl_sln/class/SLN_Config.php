<?php
require_once(MODULE_REALDIR . 'mdl_sln/defines.php');
require_once(CLASS_EX_REALDIR . "page_extends/admin/LC_Page_Admin_Ex.php");
require_once(SLN_CLASS_PATH . "SLN_Util.php");

/**
 * SLN_Configクラス（設定情報の管理）
 *
 * @package ソニーペイメントサービス決済モジュール
 * @author Sony Payment Services Inc.
 * @version 2.0.0
*/
class SLN_Config extends LC_Page_Admin_Ex {

	function init() {
		parent::init();
		$objectMdl =& SLN::getInstance();
		$this->tpl_mainpage = SLN_TEMPLATE_PATH. 'admin/sln_config.tpl';
		$this->arrPayments = SLN_Util::getPaymentTypeNames();

		// オプションタグ設定
		$this->setOptions();
	}

	function process() {
		$this->action();
		$this->sendResponse();
	}

	function action() {
	    
	    $this->isGet3D = extension_loaded('openssl');
	    
		$objectMdl =& SLN::getInstance();
		$objectMdl->install();

		$registerResult		= $this->getDefaultMode();
		$this->arrForm		= $registerResult[0];
		$this->tpl_onload	= $registerResult[1];
		
		
		$this->is_old_config = SLN::getInstance()->getConfigs('MerchantId');
	
		if ($this->is_old_config) {
		    $this->is_add_card_mem_table = SLN::getInstance()->getSubData('add_card_mem_table');
		} else {
		    $this->is_add_card_mem_table = 1;
		}
		
		$mode = $this->getMode();
		if ($mode == 'register') {
			$registerResult		= $this->registerMode($_POST);
			$this->arrForm		= $registerResult[0];
			$this->arrErr		= $registerResult[1];
			$this->tpl_onload	= $registerResult[2];

			if (SC_Utils::isBlank($this->arrErr)) {
				$this->registPage($this->arrForm['is_tpl_init']['value']);
				$plugin_id = $this->registPlugin();
				$this->registBloc($this->arrForm['enable_payment_type']['value'], $plugin_id, $this->arrForm['is_tpl_init']['value']);
				
				if (!$this->is_old_config || !SLN::getInstance()->getSubData('add_card_mem_table')) {
				    $mode = 'add_card_mem_table';
				}
			}
		}
		
		if ($mode == 'add_card_mem_table' && !SLN::getInstance()->getSubData('add_card_mem_table')) {
		    
		    SC_Query_Ex::getSingletonInstance()->begin();
		    
		    switch(DB_TYPE){
		        case 'mysqli':
		            SC_Query_Ex::getSingletonInstance()->exec("CREATE TABLE `sln_dtb_mem_card_id` (
                                                                `customer_id` int(11) NOT NULL,
                                                                `mem_id` int(11) NOT NULL,
                                                                `update_date` datetime NOT NULL
                                                              ) ENGINE=InnoDB DEFAULT CHARSET=utf8");
		            SC_Query_Ex::getSingletonInstance()->exec("ALTER TABLE `sln_dtb_mem_card_id` ADD PRIMARY KEY (`customer_id`)");
		            break;
		        case 'pgsql':
		            SC_Query_Ex::getSingletonInstance()->exec("CREATE TABLE sln_dtb_mem_card_id (
		                                                          customer_id int NOT NULL,
		                                                          mem_id int NOT NULL,
		                                                          update_date timestamp NOT NULL,
		                                                          PRIMARY KEY (customer_id)
		                                                      )");
		            break;
		    }
		    
		    $objectMdl =& SLN::getInstance();
		    $objectMdl->registerSubData(1, 'add_card_mem_table');
		    
		    SC_Query_Ex::getSingletonInstance()->commit();
		    
		    $this->tpl_javascript = "alert('バージョンアップしました。');";
		    $this->is_add_card_mem_table = 1;
		}

		$this->tpl_is_module_regist = $this->isRegistPaymentModule();
		$this->setTemplate($this->tpl_mainpage);
		
		$this->credit_connection_destination = ARR_CREDIT_CONNECTION_DESTINATION;
		$this->threed_connection_destination = ARR_THREED_CONNECTION_DESTINATION;
		$this->cvs_connection_destination = ARR_CVS_CONNECTION_DESTINATION;
		$this->connection_destination = array(
		    1 => "試験環境",
		    2 => "本番環境"
		);
	}

	function getDefaultMode() {
		$objectMdl =& SLN::getInstance();
		$subData = $objectMdl->getConfigs();
		$tpl_onload = '';
		$objectForm = $this->initParam($subData);
		return array($objectForm->getFormParamList(), $tpl_onload);
	}

	function registerMode(&$paramHash) {

		$objectSess = new SC_Session();
		$objectMdl =& SLN::getInstance();

		$objectForm = $this->initParam($paramHash);
		$objectForm->arrDefault["SecCd"] = '1';
		if ($arrErr = $objectForm->checkError()) {
			return array($objectForm->getFormParamList(), $arrErr, '');
		}

		if ($arrErr = $this->checkError($objectForm)) {
			return array($objectForm->getFormParamList(), $arrErr, '');
		}

		$arrForm = $objectForm->getHashArray();
		
		// 各通信先URLを固定の値に変換
		// クレジット決済接続先
		$dst = $arrForm["credit_connection_destination"];
		if (!$dst) $dst = 1;
		$arrForm["creditConnectionPlace1"] = ARR_CREDIT_CONNECTION_DESTINATION[$dst]["credit_connection_place1"];
		$arrForm["creditConnectionPlace2"] = ARR_CREDIT_CONNECTION_DESTINATION[$dst]["credit_connection_place2"];
		$arrForm["creditConnectionPlace7"] = ARR_CREDIT_CONNECTION_DESTINATION[$dst]["credit_connection_place7"];
		// 3Dセキュア認証接続先
		$dst = $arrForm["threed_connection_destination"];
		if (!$dst) $dst = 1;
		$arrForm["creditConnectionPlace6"] = ARR_THREED_CONNECTION_DESTINATION[$dst]["credit_connection_place6"];
		// オンライン収納代行接続先
		$dst = $arrForm["cvs_connection_destination"];
		if (!$dst) $dst = 1;
		$arrForm["creditConnectionPlace3"] = ARR_CVS_CONNECTION_DESTINATION[$dst]["credit_connection_place3"];
		$arrForm["creditConnectionPlace5"] = ARR_CVS_CONNECTION_DESTINATION[$dst]["credit_connection_place5"];
		
		// in_arrayで判定するのでarray型で保存しておく
		if (empty($arrForm['attestation_assistance'])) $arrForm['attestation_assistance'] = array();
		$objectMdl->registerSubData($arrForm, 'user_settings');

		$objectQuery =& SC_Query::getSingletonInstance();
		$objectQuery->begin();
		$objectQuery->update('dtb_payment', array('del_flg' => 1), 'module_code = ?', array(SLN_CODE));

		foreach ($arrForm['enable_payment_type'] as $payment_type_id) {
			//ユーザ画面「お支払方法の指定」の文言 を設定
			if($payment_type_id == SLN_PAYID_CVS){

				//利用できるオンライン収納方法
				global $arrOnlinePaymentMethod;
				$this->arrOnlinePaymentMethod = $arrOnlinePaymentMethod;

				global $arrShortPaymentMethod;
				$this->arrOnlinePaymentMethod = $arrShortPaymentMethod;

				$paymentStr = '';
				if(!empty($arrOnlinePaymentMethod[SLN_ONLINE_PAYMENT_METHOD1]) || !empty($arrPaymentMethod[SLN_ONLINE_PAYMENT_METHOD2])){
					$paymentStr .= $arrShortPaymentMethod[SLN_ONLINE_SHORT_PAYMENT_METHOD1].' ';
				}
				if(!empty($arrOnlinePaymentMethod[SLN_ONLINE_PAYMENT_METHOD3])){
					$paymentStr .= $arrShortPaymentMethod[SLN_ONLINE_SHORT_PAYMENT_METHOD3].' ';
				}
				if(!empty($arrOnlinePaymentMethod[SLN_ONLINE_PAYMENT_METHOD4])){
					$paymentStr .= $arrShortPaymentMethod[SLN_ONLINE_SHORT_PAYMENT_METHOD4].' ';
				}
				if(!empty($arrOnlinePaymentMethod[SLN_ONLINE_PAYMENT_METHOD5])){
					$paymentStr .= $arrShortPaymentMethod[SLN_ONLINE_SHORT_PAYMENT_METHOD5].' ';
				}
				if(!empty($arrOnlinePaymentMethod[SLN_ONLINE_PAYMENT_METHOD6])){
					$paymentStr .= $arrShortPaymentMethod[SLN_ONLINE_SHORT_PAYMENT_METHOD6].' ';
				}
			} else {
				$paymentStr = $this->arrPayments[ $payment_type_id ];
			}

			$dataHash = array(
					'fix' => 3,
					'payment_method' => $paymentStr,
					'creator_id' => $objectSess->member_id,
					'update_date' => 'CURRENT_TIMESTAMP',
					'module_path' => SLN_PATH . 'payment.php',
					'module_code' => SLN_CODE,
					'del_flg' => 0
			);
			$dataHash[SLN_PAYMENT_COL_PAYID] = $payment_type_id;

			$arrPayment = $this->getPaymentFromDB($payment_type_id);

			// 初期登録か更新か
			if (count($arrPayment) > 0){
				$where = "module_code = ? AND " . SLN_PAYMENT_COL_PAYID . " = ?";
				$whereHash = array(SLN_CODE, (string)$payment_type_id);
				$objectQuery->update('dtb_payment', $dataHash, $where, $whereHash);
			} else {
				// ランクは設定可能な最大値にする
				$max_rank = $objectQuery->max('rank', 'dtb_payment');
				$dataHash["create_date"] = "CURRENT_TIMESTAMP";
				$dataHash["rank"] = $max_rank + 1;
				$dataHash['payment_id'] = $objectQuery->nextVal('dtb_payment_payment_id');
				$dataHash = array_merge($this->getDefaultPaymentConfig($payment_type_id), $dataHash);

				$objectQuery->insert("dtb_payment", $dataHash);
			}
		}

		$objectQuery->commit();

		$tpl_onload = 'alert("設定情報を保存しました。");window.close();';

		return array($objectForm->getFormParamList(), $arrErr, $tpl_onload);
	}

	function initParam($dataHash = array()) {
		$objectForm = new SC_FormParam();

		$objectForm->addParam('決済方法', 'enable_payment_type', INT_LEN, 'n', array('EXIST_CHECK', 'NUM_CHECK'), isset($dataHash['enable_payment_type']) ? $dataHash['enable_payment_type'] : "");

		//共通設定
		$objectForm->addParam("マーチャントID", "MerchantId", MERCHANTID_LEN, "KVa", array("EXIST_CHECK", "MAX_LENGTH_CHECK", "SPTAB_CHECK" ,"ALNUM_CHECK"));
		$objectForm->addParam("マーチャントパスワード", "MerchantPass", MERCHANTPASS_LEN, "KVa", array("EXIST_CHECK", "MAX_LENGTH_CHECK", "SPTAB_CHECK" ,"ALNUM_CHECK"));
		$objectForm->addParam("店舗コード", "TenantId", TENPOCODE_LEN, "KVa", array("MAX_LENGTH_CHECK", "SPTAB_CHECK", "NUM_CHECK"));

		$objectForm->addParam('有効にする決済方法', 'enable_payment_type', INT_LEN, 'n', array('EXIST_CHECK', 'NUM_CHECK'), isset($dataHash['enable_payment_type']) ? $dataHash['enable_payment_type'] : "");

		//クレジットカード決済
		$objectForm->addParam("接続先", "credit_connection_place");

		$objectForm->addParam("接続先-カード決済 オンライン取引", "credit_connection_place1");
		$objectForm->addParam("接続先-会員情報登録電文", "credit_connection_place2");
		$objectForm->addParam("接続先-PC 用支払先選択画面リダイレクトURL", "credit_connection_place3");
		$objectForm->addParam("接続先-モバイル用支払先選択画面リダイレクトURL", "credit_connection_place4");
		$objectForm->addParam("接続先-オンライン取引接続用URL", "credit_connection_place5");
		$objectForm->addParam("接続先-3Dカード決済", "credit_connection_place6");
		$objectForm->addParam("接続先-トークン通信先", "credit_connection_place7");
		
		$objectForm->addParam("トークン決済認証コード", 'token_ninsyo_code');
		
		$objectForm->addParam("3Dカード決済AES暗号キー", 'credit_aes_key');
		$objectForm->addParam("3Dカード決済AESベクトル", 'credit_aes_iv');

		$objectForm->addParam("支払回数", "payKbnKaisu","","", array("EXIST_CHECK"));
		$objectForm->addParam("セキュリティコード", "SecCd","","", array("EXIST_CHECK"));
		$objectForm->addParam("認証アシスト項目", "attestation_assistance");
		$objectForm->addParam("カード決済手続き", "OperateId","","", array("EXIST_CHECK"));
		$objectForm->addParam("受注入金済み手続き", "card_order_pre_end", '', '', array("EXIST_CHECK"), 0);
		$objectForm->addParam("会員登録機能", "member_regist","","", array("EXIST_CHECK"));
		$objectForm->addParam("3Dセキュアサービス", "3d_pay","","", array("EXIST_CHECK"));
		$objectForm->addParam("クイック決済", "quick_accounts","","", array("EXIST_CHECK"));

		//オンライン収納代行
		$objectForm->addParam("利用できるオンライン収納決済方法", "OnlinePaymentMethod");
		$objectForm->addParam("フリーエリア1","Free1",FREEAREA_LEN,"KVA",array("MAX_LENGTH_CHECK", "SPTAB_CHECK"));
		$objectForm->addParam("フリーエリア2","Free2",FREEAREA_LEN,"KVA",array("MAX_LENGTH_CHECK", "SPTAB_CHECK"));
		$objectForm->addParam("フリーエリア3","Free3",FREEAREA_LEN,"KVA",array("MAX_LENGTH_CHECK", "SPTAB_CHECK"));
		$objectForm->addParam("フリーエリア4","Free4",FREEAREA_LEN,"KVA",array("MAX_LENGTH_CHECK", "SPTAB_CHECK"));
		$objectForm->addParam("フリーエリア5","Free5",FREEAREA_LEN,"KVA",array("MAX_LENGTH_CHECK", "SPTAB_CHECK"));
		$objectForm->addParam("フリーエリア6","Free6",FREEAREA_LEN,"KVA",array("MAX_LENGTH_CHECK", "SPTAB_CHECK"));
		$objectForm->addParam("フリーエリア7","Free7",FREEAREA_LEN,"KVA",array("MAX_LENGTH_CHECK", "SPTAB_CHECK"));
		$objectForm->addParam("ご案内1","Comment",ANNAI_LEN,"KVA",array("MAX_LENGTH_CHECK", "SPTAB_CHECK"));
		$objectForm->addParam("ご案内2","Free8",ANNAI_LEN,"KVA",array("MAX_LENGTH_CHECK", "SPTAB_CHECK"));
		$objectForm->addParam("ご案内3","Free9",ANNAI_LEN,"KVA",array("MAX_LENGTH_CHECK", "SPTAB_CHECK"));
		$objectForm->addParam("ご案内4","Free10",ANNAI_LEN,"KVA",array("MAX_LENGTH_CHECK", "SPTAB_CHECK"));
		$objectForm->addParam("ご案内5","Free11",ANNAI_LEN,"KVA",array("MAX_LENGTH_CHECK", "SPTAB_CHECK"));
		$objectForm->addParam("ご案内6","Free12",ANNAI_LEN,"KVA",array("MAX_LENGTH_CHECK", "SPTAB_CHECK"));
		$objectForm->addParam("ご案内7","Free13",ANNAI_LEN,"KVA",array("MAX_LENGTH_CHECK", "SPTAB_CHECK"));
		$objectForm->addParam("ご案内8","Free14",ANNAI_LEN,"KVA",array("MAX_LENGTH_CHECK", "SPTAB_CHECK"));
		$objectForm->addParam("ご案内9","Free15",ANNAI_LEN,"KVA",array("MAX_LENGTH_CHECK", "SPTAB_CHECK"));
		$objectForm->addParam("ご案内10","Free16",ANNAI_LEN,"KVA",array("MAX_LENGTH_CHECK", "SPTAB_CHECK"));
		$objectForm->addParam("問い合わせ先","Free17",QUESTIONSAKI_LEN,"",array("MAX_LENGTH_CHECK", "SPTAB_CHECK"));
		$objectForm->addParam("問合せ電話","Free18",QUESTIONTEL_LEN,"KVa",array("MAX_LENGTH_CHECK", "SPTAB_CHECK"));
		$objectForm->addParam("問い合わせ時間","Free19",QUESTIONTIME_LEN,"KVa",array("MAX_LENGTH_CHECK", "SPTAB_CHECK","GRAPH_CHECK"));
		$objectForm->addParam("ご案内タイトル","Title",CUSTANNNAITITLE_LEN ,"",array("MAX_LENGTH_CHECK", "SPTAB_CHECK"));
		$objectForm->addParam("お支払方法の指定の文言", "payOnlineWording");
		
		// 接続先
		$objectForm->addParam("接続先", "credit_connection_destination"); //クレジットカード
		$objectForm->addParam("接続先", "threed_connection_destination"); //3Dセキュア
		$objectForm->addParam("接続先", "cvs_connection_destination"); //オンライン収納

		$objectForm->setParam($dataHash);
		$objectForm->convParam();
		
		// mb_convert_kanaの"A"(半角英数字→全角変換)が効かない記号について手動で変換する
		// mb_convert_kanaの"A"を使用する項目
		$arrKeyname = array(
			'Free1', //フリーエリア1
			'Free2',
			'Free3',
			'Free4',
			'Free5',
			'Free6',
			'Free7',
			'Comment', //ご案内1
			'Free8',
			'Free9',
			'Free10',
			'Free11',
			'Free12',
			'Free13',
			'Free14',
			'Free15',
			'Free16',
		);
		SLN_Util::replaceMbConvertKanaA($objectForm, $arrKeyname);
		
		return $objectForm;
	}

	static function checkError(SC_FormParam &$objFormParam){
		$arrErr = array();
		$arrParams = $objFormParam->getHashArray();
		if ($arrParams['Free18'] !=="" && !preg_match('/^[0-9\-]+$/', $arrParams['Free18'])) {
			$arrErr['Free18'] = '半角数字ハイフンで入力してください。';
		}
		//接続先
		$arrConnectionDestination = array(
		    1 => null, //試験環境
		    2 => null  //本番環境
		);
		
		/**
		 * $array = array(
		 *   'name'  => 'paramName',               // パラメーターの名前
		 *   'value' => '$arrParams['paramName']', // パラメーターの値
		 *   'allow' => '$arrAllowed',             // 許容される値をもつ配列
		 *   'disp'  => 'dispNmae',                // 表示名
		 * );
		 */
		$arrChecks = array(
			array (
				'name' => 'credit_connection_destination',
				'value' => $arrParams['credit_connection_destination'],
				'allow' => $arrConnectionDestination,
				'disp' => 'クレジットカード接続先',
			),
			array (
				'name' => 'threed_connection_destination',
				'value' => $arrParams['threed_connection_destination'],
				'allow' => $arrConnectionDestination,
				'disp' => '3Dセキュア接続先',
			),
			array (
				'name' => 'cvs_connection_destination',
				'value' => $arrParams['cvs_connection_destination'],
				'allow' => $arrConnectionDestination,
				'disp' => 'オンライン収納接続先',
			),
			array (
				'name' => 'enable_payment_type',
				'value' => $arrParams['enable_payment_type'],
				'allow' => $GLOBALS["arrEnablePaymentType"],
				'disp' => '有効にする決済方法',
			),
			array (
				'name' => 'payKbnKaisu',
				'value' => $arrParams['payKbnKaisu'],
				'allow' => $GLOBALS["arrPayKbnKaisu"],
				'disp' => '支払回数',
			),
			array (
				'name' => 'SecCd',
				'value' => $arrParams['SecCd'],
				'allow' => $GLOBALS["arrSecurityCode"],
				'disp' => 'セキュリティコード',
			),
			array (
				'name' => 'attestation_assistance',
				'value' => $arrParams['attestation_assistance'],
				'allow' => $GLOBALS["arrAssistance"],
				'disp' => '認証アシスト項目',
			),
			array (
				'name' => 'OperateId',
				'value' => $arrParams['OperateId'],
				'allow' => $GLOBALS["arrCardProcedure"],
				'disp' => 'カード決済手続き',
			),
			array (
				'name' => 'card_order_pre_end',
				'value' => $arrParams['card_order_pre_end'],
				'allow' => $GLOBALS["arrCardPayStatus"],
				'disp' => '受注入金済み手続き',
			),
			array (
				'name' => 'member_regist',
				'value' => $arrParams['member_regist'],
				'allow' => $GLOBALS["arrMemberRegist"],
				'disp' => '会員登録機能',
			),
			array (
				'name' => '3d_pay',
				'value' => $arrParams['3d_pay'],
				'allow' => $GLOBALS["arr3DPay"],
				'disp' => '3Dセキュアサービス',
			),
			array (
				'name' => 'quick_accounts',
				'value' => $arrParams['quick_accounts'],
				'allow' => $GLOBALS["arrQuickAccounts"],
				'disp' => 'クイック決済',
			),
			array (
				'name' => 'OnlinePaymentMethod',
				'value' => $arrParams['OnlinePaymentMethod'],
				'allow' => $GLOBALS["arrOnlinePaymentMethod"],
				'disp' => 'オンライン収納決済方法',
			),
		);
		foreach ($arrChecks as $arrCheck) {
			SLN_Util::checkAllowedParams($arrCheck['name'], $arrCheck['value'], $arrCheck['allow'], $arrCheck['disp'] ,$arrErr);
		}
		
		// 使用禁止文字列
		$arrProhibited = array(
			'&',
			'<',
			'>',
			'"',
			'\'',
			'*',
		);
		$arrProhibitedMsg = "「" . implode(" ", $arrProhibited) . "」";
		// 正規表現に影響を与える文字をエスケープ
		$arrProhibited = array_map('preg_quote', $arrProhibited);
		
		$objErr = new SC_CheckError_Ex($objFormParam->getHashArray());
		//問い合わせ先
		$value = $arrParams['Free17'];
		if ($value !== "") {
		    $objErr->doFunc(array($arrProhibitedMsg, 'Free17', $arrProhibited), array('PROHIBITED_STR_CHECK'));
			$arrErr += $objErr->arrErr;
		}
		//問い合わせ時間
		$value = $arrParams['Free19'];
		if ($value !== "") {
		    $objErr->doFunc(array($arrProhibitedMsg, 'Free19', $arrProhibited), array('PROHIBITED_STR_CHECK'));
			$arrErr += $objErr->arrErr;
		}
		//ご案内タイトル
		$value = $arrParams['Title'];
		if ($value !== "") {
		    $objErr->doFunc(array($arrProhibitedMsg, 'Title', $arrProhibited), array('PROHIBITED_STR_CHECK'));
			$arrErr += $objErr->arrErr;
		}
		
		return $arrErr;
	}

	function getPaymentFromDB($type){
		$objectQuery =& SC_Query::getSingletonInstance();
		return $objectQuery->select("module_id", "dtb_payment", "module_code = ? AND " . SLN_PAYMENT_COL_PAYID . " = ?", array(SLN_CODE, (string)$type));
	}

	function isRegistPaymentModule() {
		$objectQuery =& SC_Query::getSingletonInstance();
		if($objectQuery->count('dtb_payment', 'module_code = ?', array(SLN_CODE))) {
			return true;
		}
		return false;
	}

	function registPlugin() {

		$arrPluginInfo = array(
				'PLUGIN_CODE' => 'SLNCore',
				'PLUGIN_NAME' => 'ソニーペイメントサービス決済プラグイン',
				'CLASS_NAME' => 'SLNCore',
				'PLUGIN_VERSION' => '1.0',
				'PLUGIN_CODE' => 'SLNCore',
				'COMPLIANT_VERSION' => '2.17.0',
				'AUTHOR' => 'ソニーペイメントサービス',
				'DESCRIPTION' => 'ソニーペイメントサービス決済モジュールの動作に必要なプラグインです。決済を利用する場合に、本プラグインの無効化や削除はしないで下さい。',
				'PLUGIN_SITE_URL' => 'http://www.sonypaymentservices.jp/',
				'AUTHOR_SITE_URL' => 'http://www.sonypaymentservices.jp/',
		);

		// フックポイント一覧
		$hook_point = array(
				array("LC_Page_Admin_Basis_PaymentInput_action_after", 'hookActionAfter'),
				array("LC_Page_Shopping_Payment_action_after", 'hookActionAfter'),
				array("LC_Page_Shopping_Payment_action_before", 'hookActionBefore'),
				array("LC_Page_Shopping_Complete_action_before", 'hookActionBefore'),
				array("LC_Page_Admin_Order_Status_action_before", 'hookActionBefore'),
				array("LC_Page_Admin_Order_Edit_action_before", 'hookActionBefore'),
				array("LC_Page_Admin_Order_Edit_action_after", 'hookActionAfter'),
				array("LC_Page_Admin_Order_action_before", 'hookActionBefore'),
				array("LC_Page_Admin_Order_action_after", 'hookActionAfter'),
				array("LC_Page_Mypage_Refusal_action_before", 'hookActionBefore'),
				array("LC_Page_Admin_Customer_action_after", 'hookActionAfter'),
				array("LC_Page_Products_Detail_action_before", 'hookActionBefore'),
				array("LC_Page_Products_List_action_before", 'hookActionBefore'),
				array("LC_Page_Cart_action_before", 'hookActionBefore'),
				array("LC_Page_Shopping_action_before", 'hookActionBefore'),
				array("LC_Page_Shopping_Payment_action_before", 'hookActionBefore'),
				array("LC_Page_Shopping_Deliv_action_before", 'hookActionBefore'),
				array("LC_Page_Shopping_Confirm_action_before", 'hookActionBefore'),
				array("LC_Page_Shopping_Confirm_action_after", 'hookActionAfter'),
				array("prefilterTransform", 'prefilterTransform')
		);

		$arr_sqlval_plugin = array();
		$arr_sqlval_plugin['plugin_name']		= $arrPluginInfo['PLUGIN_NAME'];
		$arr_sqlval_plugin['plugin_code']		= $arrPluginInfo['PLUGIN_CODE'];
		$arr_sqlval_plugin['class_name']		= $arrPluginInfo['CLASS_NAME'];
		$arr_sqlval_plugin['author']			= $arrPluginInfo['AUTHOR'];
		$arr_sqlval_plugin['author_site_url']	= $arrPluginInfo['AUTHOR_SITE_URL'];
		$arr_sqlval_plugin['plugin_site_url']	= $arrPluginInfo['PLUGIN_SITE_URL'];
		$arr_sqlval_plugin['plugin_version']	= $arrPluginInfo['PLUGIN_VERSION'];
		$arr_sqlval_plugin['compliant_version']	= $arrPluginInfo['COMPLIANT_VERSION'];
		$arr_sqlval_plugin['plugin_description'] = $arrPluginInfo['DESCRIPTION'];
		$arr_sqlval_plugin['priority']			= '0';
		$arr_sqlval_plugin['enable']			= PLUGIN_ENABLE_TRUE;
		$arr_sqlval_plugin['update_date']		= 'CURRENT_TIMESTAMP';

		// プラグインコードからIDを検索
		$pluginHash = SC_Plugin_Util::getPluginByPluginCode($arrPluginInfo['PLUGIN_CODE']);
		$plugin_id = null;
		if (!empty($pluginHash)) {
			$plugin_id = $pluginHash['plugin_id'];
		}

		// プラグイン情報をDB登録.
		$objectQuery =& SC_Query::getSingletonInstance();
		$objectQuery->begin();

		// 登録or更新
		if (SC_Utils::isBlank($plugin_id)) {
			$plugin_id = $objectQuery->nextVal('dtb_plugin_plugin_id');
			$arr_sqlval_plugin['plugin_id'] = $plugin_id;
			$objectQuery->insert('dtb_plugin', $arr_sqlval_plugin);
		} else {
			$objectQuery->update('dtb_plugin', $arr_sqlval_plugin, 'plugin_id = ?', array($plugin_id));
		}

		// フックポイント一回削除
		$objectQuery->delete('dtb_plugin_hookpoint', 'plugin_id = ?', array($plugin_id));

		// フックポイント保存
		foreach ($hook_point as $h) {
			$arr_sqlval_plugin_hookpoint = array();
			$id = $objectQuery->nextVal('dtb_plugin_hookpoint_plugin_hookpoint_id');
			$arr_sqlval_plugin_hookpoint['plugin_hookpoint_id'] = $id;
			$arr_sqlval_plugin_hookpoint['plugin_id'] = $plugin_id;
			$arr_sqlval_plugin_hookpoint['hook_point'] = $h[0];
			$arr_sqlval_plugin_hookpoint['callback'] = $h[1];
			$arr_sqlval_plugin_hookpoint['update_date'] = 'CURRENT_TIMESTAMP';
			$objectQuery->insert('dtb_plugin_hookpoint', $arr_sqlval_plugin_hookpoint);
		}
		$objectQuery->commit();

		// 親ディレクトリが無ければ作成
		if (!file_exists(PLUGIN_UPLOAD_REALDIR)) {
			mkdir(PLUGIN_UPLOAD_REALDIR, 0777);
		}
		if (!file_exists(PLUGIN_HTML_REALDIR)) {
			mkdir(PLUGIN_HTML_REALDIR, 0777);
		}

		// プラグイン用ディレクトリの作成
		$plugin_dir_path = PLUGIN_UPLOAD_REALDIR . 'SLNCore/';
		if (!file_exists($plugin_dir_path)) {
			mkdir($plugin_dir_path, 0777);
		}
		$plugin_html_dir = PLUGIN_HTML_REALDIR . 'SLNCore/';
		if (!file_exists($plugin_html_dir)) {
			mkdir($plugin_html_dir, 0777);
		}

		// 必要なファイルをコピー
		copy(SLN_COPY_PATH . "security_code.jpg", 				$plugin_html_dir . "security_code.jpg");
		copy(SLN_COPY_PATH . "btn_quick.png", 					$plugin_html_dir . "btn_quick.png");
		copy(SLN_COPY_PATH . "btn_quick_on.png", 				$plugin_html_dir . "btn_quick_on.png");
		copy(SLN_COPY_PATH . "btn_bloc_buy.jpg",				$plugin_html_dir . "btn_bloc_buy.jpg");
		copy(SLN_COPY_PATH . "btn_bloc_buy_on.jpg",				$plugin_html_dir . "btn_bloc_buy_on.jpg");
		copy(SLN_COPY_PATH . "plugin_info.php",					$plugin_dir_path . "plugin_info.php");
		copy(SLN_COPY_PATH . "SLNCore.php", 					$plugin_dir_path . "SLNCore.php");
		copy(SLN_COPY_PATH . "payment_status.php", HTML_REALDIR . ADMIN_DIR . "order/payment_status.php");
		copy(SLN_COPY_PATH . "card_info.php", 					HTML_REALDIR . "mypage/card_info.php");
		copy(SLN_COPY_PATH . "load_sln_payment_module.php",     HTML_REALDIR . "shopping/load_sln_payment_module.php");
		copy(SLN_COPY_PATH . "sln_recv.php", 					HTML_REALDIR . USER_DIR . "sln_recv.php");
		
		copy(SLN_COPY_PATH . "sln_3d.php", 	HTML_REALDIR . "shopping/sln_3d.php");
		copy(SLN_COPY_PATH . "sln_3d_post.php", HTML_REALDIR . "shopping/sln_3d_post.php");
		copy(SLN_COPY_PATH . "sln_card_3d.php", HTML_REALDIR . "mypage/sln_card_3d.php");

		// 別名コピー
		copy(HTML_REALDIR . "shopping/load_payment_module.php", HTML_REALDIR . "shopping/load_sln_payment_module.php");

		// パーミッションの設定
		chmod(HTML_REALDIR . ADMIN_DIR . "order/payment_status.php", 0644);
		chmod(HTML_REALDIR . "mypage/card_info.php", 0644);
		chmod(HTML_REALDIR . USER_DIR . "sln_recv.php", 0644);
		chmod(HTML_REALDIR . "shopping/sln_3d.php", 0644);
		chmod(HTML_REALDIR . "shopping/sln_3d_post.php", 0644);
		chmod(HTML_REALDIR . "mypage/sln_card_3d.php", 0644);

		// ページデータの保存
		$page_name = 'MYページ/登録済カード情報変更';
		$url = 'mypage/card_info.php';
		$filename = 'mypage/card_info';

		$tpl_data = file_get_contents(SLN_TEMPLATE_PATH . 'default/sln_card_info.tpl');
		$device_type_id = DEVICE_TYPE_PC;
		$page_id = $this->setPageData($tpl_data, $page_name, $url, $filename, $device_type_id);

		$tpl_data = file_get_contents(SLN_TEMPLATE_PATH . 'sphone/sln_card_info.tpl');
		$device_type_id = DEVICE_TYPE_SMARTPHONE;
		$page_id = $this->setPageData($tpl_data, $page_name, $url, $filename, $device_type_id);

		SC_Utils::clearCompliedTemplate();
		return $plugin_id;
	}

	function getDefaultPaymentConfig($payment_type_id) {
		$dataHash = array();
		$dataHash['charge'] = '0';
		$dataHash['rule_max'] = '1';
		$arrDate['charge_flag'] = '2'; //支払方法設定画面の手数料を設定不可にする。

		switch ($payment_type_id) {
			case SLN_PAYID_CREDIT:
			case SLN_PAYID_REGIST_CREDIT:
				$dataHash['upper_rule'] = CREDIT_PAYMENT_MAX;
				break;
			case SLN_PAYID_CVS:
				$dataHash['upper_rule'] = CONVENIENCE_PAYMENT_MAX;
				break;
		}
		$dataHash['upper_rule_max'] = $dataHash['upper_rule'];
		return $dataHash;
	}

	function registPage() {
		$pageIdHash = array();
		// 決済画面をデザインテンプレートに足す
		$page_name = '商品購入/決済画面';
		$module_url = 'shopping/load_sln_payment_module.php';
		$filename = 'shopping/load_sln_payment_module';

		$tpl_data = file_get_contents(SLN_TEMPLATE_PATH . 'default/sln_payment.tpl');
		$device_type_id = DEVICE_TYPE_PC;
		$page_id = $this->setPageData($tpl_data, $page_name, $module_url, $filename, $device_type_id);
		$pageIdHash[ $filename ][ $device_type_id ] = $page_id;

		$tpl_data = file_get_contents(SLN_TEMPLATE_PATH . 'sphone/sln_payment.tpl');
		$device_type_id = DEVICE_TYPE_SMARTPHONE;
		$page_id = $this->setPageData($tpl_data, $page_name, $module_url, $filename, $device_type_id);
		$pageIdHash[ $filename ][ $device_type_id ] = $page_id;

		$tpl_data = file_get_contents(SLN_TEMPLATE_PATH . 'mobile/sln_payment.tpl');
		$device_type_id = DEVICE_TYPE_MOBILE;
		$page_id = $this->setPageData($tpl_data, $page_name, $module_url, $filename, $device_type_id);
		$pageIdHash[ $filename ][ $device_type_id ] = $page_id;

		$objectMdl =& SLN::getInstance();
		$objectMdl->registerSubData($pageIdHash, 'page_setting');
	}

	function registBloc($arrPaymentTypeId, $plugin_id) {
		$blocIdHash = array();
		foreach ($arrPaymentTypeId as $payment_type_id) {
			$filename = "";
			if ($payment_type_id == SLN_PAYID_CREDIT) {
				$filename ="sln_credit";
			} elseif ($payment_type_id == SLN_PAYID_REGIST_CREDIT) {
				$filename ="sln_regist_credit";
			} elseif ($payment_type_id == SLN_PAYID_CVS) {
				$filename ="sln_cvs";
			}
			$bloc_name = $this->arrPayments[$payment_type_id] . "入力フォーム";

			$bloc_data = file_get_contents(SLN_TEMPLATE_PATH . 'default/bloc/' . $filename . '.tpl');
			$device_type_id = DEVICE_TYPE_PC;
			$bloc_id = $this->setBlocData($plugin_id, $bloc_data, $device_type_id, $bloc_name, $filename, "");
			$blocIdHash[ $filename ][ $device_type_id ] = $bloc_id;

			$bloc_data = file_get_contents(SLN_TEMPLATE_PATH . 'sphone/bloc/' . $filename . '.tpl');
			$device_type_id = DEVICE_TYPE_SMARTPHONE;
			$bloc_id = $this->setBlocData($plugin_id, $bloc_data, $device_type_id, $bloc_name, $filename, "");
			$blocIdHash[ $filename ][ $device_type_id ] = $bloc_id;

			$bloc_data = file_get_contents(SLN_TEMPLATE_PATH . 'mobile/bloc/' . $filename . '.tpl');
			$device_type_id = DEVICE_TYPE_MOBILE;
			$bloc_id = $this->setBlocData($plugin_id, $bloc_data, $device_type_id, $bloc_name, $filename, "");
			$blocIdHash[ $filename ][ $device_type_id ] = $bloc_id;
		}

		$objectMdl =& SLN::getInstance();
		$objectMdl->registerSubData($blocIdHash, 'bloc_setting');
	}

	function setOptions() {
		//支払方法
		global $arrPaymentMethod;
		$this->arrPaymentMethod = $arrPaymentMethod;

		//接続先
		global $arrCreditConnectionPlace;
		$this->arrCreditConnectionPlace = array();
		$this->arrCreditConnectionPlace['--'] = "--";
		$this->arrCreditConnectionPlace = $arrCreditConnectionPlace;

		//支払回数(一括払い～分割72回）
		global $arrPayKbnKaisu;
		$this->arrPayKbnKaisu = $arrPayKbnKaisu;

		//支払回数(リボルビング払い、ボーナス）
		global $arrPayKbnKaisu;
		$this->arrPayKbnKaisu = $arrPayKbnKaisu;

		//セキュリティコード
		global $arrSecurityCode;
		$this->arrSecurityCode = $arrSecurityCode;

		//認証アシスト項目
		global $arrAssistance;
		$this->arrAssistance = $arrAssistance;

		//カード決済手続き
		global $arrCardProcedure;
		$this->arrCardProcedure = $arrCardProcedure;
		
		//カード決済既時売上の受注ステータス
		global $arrCardPayStatus;
		$this->arrCardPayStatus = $arrCardPayStatus;

		//会員登録機能
		global $arrMemberRegist;
		$this->arrMemberRegist = $arrMemberRegist;

		//クイック決済
		global $arrQuickAccounts;
		$this->arrQuickAccounts = $arrQuickAccounts;
		
		//3Dセキュアサービス
		global $arr3DPay;
		$this->arr3DPay = $arr3DPay;

		//オンライン収納代行 - 決済方法
		global $arrOnlinePaymentMethod;
		$this->arrOnlinePaymentMethod = $arrOnlinePaymentMethod;

		//お支払方法の指定の文言
		global $arrPayOnlineWording;
		$this->arrPayOnlineWording = $arrPayOnlineWording;
	}

	function setPageData($tpl_data, $page_name, $url, $filename, $device_type_id) {
		$objectLayout = new SC_Helper_PageLayout();
		$objectQuery =& SC_Query::getSingletonInstance();
		$objectQuery->begin();

		$tpl_dir = $objectLayout->getTemplatePath($device_type_id);
		$tpl_path = $filename . '.tpl';

		$arrExists = $objectLayout->getPageProperties($device_type_id, null, 'device_type_id = ? and filename = ?', array($device_type_id, $filename));

		$table = 'dtb_pagelayout';
		$valueHash = array(
				'device_type_id' => $device_type_id,
				'header_chk' => 1,
				'footer_chk' => 1,
				'page_name' => $page_name,
				'url' => $url,
				'filename' => $filename,
				'edit_flg' => '2',
				'update_url' => $_SERVER['HTTP_REFERER'],
				'update_date' =>  'CURRENT_TIMESTAMP'
		);

		$objectQuery->setOrder('');
		if (SC_Utils::isBlank($arrExists[0]['page_id'])) {
			$valueHash['page_id'] = 1 + $objectQuery->max('page_id', $table, 'device_type_id = ?', array($device_type_id));
			$valueHash['create_date'] = 'CURRENT_TIMESTAMP';
			$objectQuery->insert($table, $valueHash);
			$page_id = $valueHash['page_id'];
		} else {
			$objectQuery->update($table, $valueHash, 'page_id = ? AND device_type_id = ?', array($arrExists[0]['page_id'], $device_type_id));
			$page_id = $arrExists[0]['page_id'];
		}

		$tpl_path = $tpl_dir . $filename . '.tpl';

		if (!file_exists($tpl_path)) {
			if (!SC_Helper_FileManager::sfWriteFile($tpl_path, $tpl_data)) {
				$objectQuery->rollback();
				return false;
			}
		}
		$objectQuery->commit();
		return $page_id;
	}


	function setBlocData($plugin_id, $bloc_data, $device_type_id, $bloc_name, $filename, $php_path = "") {
		$objectLayout = new SC_Helper_PageLayout();
		$objectQuery = SC_Query::getSingletonInstance();
		$objectQuery->begin();

		$bloc_dir = $objectLayout->getTemplatePath($device_type_id) . BLOC_DIR;
		$tpl_path = $filename . '.tpl';

		if (!SC_Utils::isBlank($plugin_id)) {
			$where = 'filename = ?';
			$arrval = array($filename);
		} else {
			$where = 'filename = ?';
			$arrval = array($filename);
		}

		$arrExists = $objectLayout->getBlocs($device_type_id, $where, $arrval);

		$sqlHash = array(
				'device_type_id' => $device_type_id,
				'bloc_name' => $bloc_name,
				'tpl_path' => $filename . '.tpl',
				'filename' => $filename,
				'update_date' => "CURRENT_TIMESTAMP",
				'deletable_flg' => 0,
				'plugin_id' => $plugin_id
		);
		if (!SC_Utils::isBlank($php_path)) {
			$sqlHash['php_path'] = $php_path;
		}

		$objectQuery->setOrder('');

		if (SC_Utils::isBlank($arrExists[0]['bloc_id'])) {
			$sqlHash['bloc_id'] = $objectQuery->max('bloc_id', "dtb_bloc", "device_type_id = ?", array($device_type_id)) + 1;
			$sqlHash['create_date'] = "CURRENT_TIMESTAMP";
			$objectQuery->insert("dtb_bloc", $sqlHash);
			$bloc_id = $sqlHash['bloc_id'];
		} else {
			$objectQuery->update("dtb_bloc", $sqlHash, "device_type_id = ? AND bloc_id = ?", array($device_type_id, $arrExists[0]['bloc_id']));
			$bloc_id = $arrExists[0]['bloc_id'];
		}

		$bloc_path = $bloc_dir . $tpl_path;
		if (!file_exists($bloc_path)) {
			if (!SC_Helper_FileManager::sfWriteFile($bloc_path, $bloc_data)) {
				$objectQuery->rollback();
				return false;
			}
		}

		$objectQuery->commit();
		return $bloc_id;
	}
}