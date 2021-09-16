<?php

/** 決済モジュール設定
 *
 * @package ソニーペイメントサービス決済モジュール
 * @author Sony Payment Services Inc.
 * @version 2.0.0
*/

define('SLN', true);
define('SLN_CODE', 'mdl_sln');

/**
* モジュールパス設定
*/
define('SLN_PATH', MODULE_REALDIR.'mdl_sln/');
define('SLN_CLASS_PATH', SLN_PATH.'class/');
define('SLN_COPY_PATH', SLN_PATH.'copy/');
define('SLN_TEMPLATE_PATH', SLN_PATH.'templates/');
define('SLN_ERROR_CODE_MSG_FILE', SLN_PATH .'errors.txt');
define('SLN_DEL_FILELIST', SLN_PATH .'delfilelist.txt');
define('SLN_DEL_DIRLIST',  SLN_PATH .'deldirlist.txt');


require_once(SLN_CLASS_PATH . 'SLN.php');
require_once(SLN_CLASS_PATH . 'SLN_Util.php');

/**
* 受注データ毎の情報保存カラム設定
*/
define('SLN_ORDER_COL_PAYVIEW',			'memo02');
define('SLN_ORDER_COL_PAYID',			'memo03');
define('SLN_ORDER_COL_PAYSTATUS',		'memo04');
define('SLN_ORDER_COL_PAYDATA',			'memo05');
define('SLN_ORDER_COL_TRANSACTIONID',	'memo06');
define('SLN_ORDER_COL_PAYLOG',			'memo09');

/**
 * 決済モジュール　モジュール設定画面
 * MAXLENGTH設定
 */
define ("MERCHANTID_LEN", 20);
define ("MERCHANTPASS_LEN", 20);
define ("TENPOCODE_LEN", 4);
define ("FREEAREA_LEN", 16);
define ("ANNAI_LEN", 30);
define ("QUESTIONSAKI_LEN", 21);
define ("QUESTIONTIME_LEN", 11);
define ("CUSTANNNAITITLE_LEN", 20);
define ("MODORISAKIURL_LEN", 128);
define ("QUESTIONTEL_LEN", 12);

/**
* 支払い方法毎の情報保存カラム設定
*/
define('SLN_PAYMENT_COL_PAYID', 'memo03');

/**
* 決済タイプ
*/
define('SLN_PAYID_CREDIT', '10');
define('SLN_PAYID_REGIST_CREDIT', '11');
define('SLN_PAYID_CVS', '20');
define('SLN_PAYNAME_CREDIT', 'クレジットカード決済');
define('SLN_PAYNAME_REGIST_CREDIT', '登録済みクレジットカード決済');
define('SLN_PAYNAME_CVS', 'オンライン収納');
define('SLN_PAYCODE_CREDIT', 'Credit');
define('SLN_PAYCODE_REGIST_CREDIT', 'RegistCredit');
define('SLN_PAYCODE_CVS', 'CVS');
$GLOBALS["arrEnablePaymentType"] = array (
    SLN_PAYID_CREDIT      => "クレジットカード",
    SLN_PAYID_REGIST_CREDIT    => "登録済みクレジットカード決済",
    SLN_PAYID_CVS    => "オンライン収納"
);

/**
* 決済状態
*/
define('SLN_PAY_STATUS_UNSETTLED',       0); // 未決済
define('SLN_PAY_STATUS_REQUEST_SUCCESS', 1); // 要求成功
define('SLN_PAY_STATUS_PAY_SUCCESS',     2); // 支払い完了
define('SLN_PAY_STATUS_CANCEL',          4); // キャンセル
define('SLN_PAY_STATUS_AUTH', 			11); // 仮売上済み
define('SLN_PAY_STATUS_COMMIT', 		12); // 実売上済み
define('SLN_PAY_STATUS_CAPTURE', 		13); // 即時売上げ済み
define('SLN_PAY_STATUS_VOID', 			14); // 取消済み
define('SLN_PAY_STATUS_FAIL',           99); // 決済失敗

/**
* 遷移URLデフォルト
*/
define("SLN_COMPLETE_URL", HTTPS_URL . "shopping/sln_payment.php");  // 信用要求成功URL
define("SLN_RETURN_URL", HTTPS_URL  . "shopping/sln_payment.php");  // キャンセル時
define("SLN_ERROR_URL", HTTPS_URL  . "shopping/sln_payment.php");  // エラー時

/**
* 処理区分
*/
$arrJobCd = array('1Auth','1Gathering');

/**
* 支払上限金額
*/
define('CONVENIENCE_PAYMENT_MAX', 299999);
define('CREDIT_PAYMENT_MAX', null);

/**
* --クレジット決済--
* 接続先
*/
define("SLN_CREDIT_CONNECTION_PLACE1", 1);
define("SLN_CREDIT_CONNECTION_PLACE2", 2);
define("SLN_CREDIT_CONNECTION_PLACE3", 3);
$GLOBALS["arrCreditConnectionPlace"] = array (
	SLN_CREDIT_CONNECTION_PLACE1      => "EC-CUBE折り返し",
	SLN_CREDIT_CONNECTION_PLACE2    => "e-SCOTT Smart テスト環境",
	SLN_CREDIT_CONNECTION_PLACE3      => "e-SCOTT Smart 本番環境"
	);

// クレジット決済接続先
define("ARR_CREDIT_CONNECTION_DESTINATION", 
    array (
        1 => array(
            "creditConnectionPlace1" => "https://www.test.e-scott.jp/online/aut/OAUT002.do",
            "creditConnectionPlace2" => "https://www.test.e-scott.jp/online/crp/OCRP005.do",
            "creditConnectionPlace7" => "https://www.test.e-scott.jp/euser/stn/CdGetJavaScript.do"
        ),
        2 => array(
            "creditConnectionPlace1" => "https://www.e-scott.jp/online/aut/OAUT002.do",
            "creditConnectionPlace2" => "https://www.e-scott.jp/online/crp/OCRP005.do",
            "creditConnectionPlace7" => "https://www.e-scott.jp/euser/stn/CdGetJavaScript.do"
        )
    )
);
// 3Dセキュア認証接続先
define("ARR_THREED_CONNECTION_DESTINATION", 
    array (
        1 => array(
            "creditConnectionPlace6" => "https://www.test.e-scott.jp/online/tds/OTDS010.do"
        ),
        2 => array(
            "creditConnectionPlace6" => "https://www.e-scott.jp/online/tds/OTDS010.do"
        )
    )
);
// オンライン収納代行接続先
define("ARR_CVS_CONNECTION_DESTINATION", 
    array (
        1 => array(
            "creditConnectionPlace3" => "https://link.kessai.info/JLPCT/JLPcon",
            "creditConnectionPlace5" => "https://www.test.e-scott.jp/online/cnv/OCNV005.do"
        ),
        2 => array(
            "creditConnectionPlace3" => "https://link.kessai.info/JLP/JLPcon",
            "creditConnectionPlace5" => "https://www.e-scott.jp/online/cnv/OCNV005.do"
        )
    )
);

/**
* 支払回数
*/
define("SLN_PAYKBNKAISU1", "01");
define("SLN_PAYKBNKAISU2", "02");
define("SLN_PAYKBNKAISU3", "03");
define("SLN_PAYKBNKAISU4", "04");
define("SLN_PAYKBNKAISU5", "05");
define("SLN_PAYKBNKAISU6", "06");
define("SLN_PAYKBNKAISU7", "07");
define("SLN_PAYKBNKAISU8", "08");
define("SLN_PAYKBNKAISU9", "09");
define("SLN_PAYKBNKAISU10", 10);
define("SLN_PAYKBNKAISU11", 11);
define("SLN_PAYKBNKAISU12", 12);
define("SLN_PAYKBNKAISU15", 15);
define("SLN_PAYKBNKAISU16", 16);
define("SLN_PAYKBNKAISU18", 18);
define("SLN_PAYKBNKAISU20", 20);
define("SLN_PAYKBNKAISU24", 24);
define("SLN_PAYKBNKAISU30", 30);
define("SLN_PAYKBNKAISU36", 36);
define("SLN_PAYKBNKAISU48", 48);
define("SLN_PAYKBNKAISU54", 54);
define("SLN_PAYKBNKAISU60", 60);
define("SLN_PAYKBNKAISU72", 72);
define("SLN_PAYKBNKAISU88", 88);
define("SLN_PAYKBNKAISU80", 80);
$GLOBALS["arrPayKbnKaisu"] = array (
	SLN_PAYKBNKAISU1      => "一括払い",
	SLN_PAYKBNKAISU2    => "分割払い(2回)",
	SLN_PAYKBNKAISU3    => "分割払い(3回)",
	SLN_PAYKBNKAISU4    => "分割払い(4回)",
	SLN_PAYKBNKAISU5    => "分割払い(5回)",
	SLN_PAYKBNKAISU6    => "分割払い(6回)",
	SLN_PAYKBNKAISU7    => "分割払い(7回)",
	SLN_PAYKBNKAISU8    => "分割払い(8回)",
	SLN_PAYKBNKAISU9    => "分割払い(9回)",
	SLN_PAYKBNKAISU10   => "分割払い(10回)",
	SLN_PAYKBNKAISU11    => "分割払い(11回)",
	SLN_PAYKBNKAISU12    => "分割払い(12回)",
	SLN_PAYKBNKAISU15    => "分割払い(15回)",
	SLN_PAYKBNKAISU16    => "分割払い(16回)",
	SLN_PAYKBNKAISU18    => "分割払い(18回)",
	SLN_PAYKBNKAISU20    => "分割払い(20回)",
	SLN_PAYKBNKAISU24    => "分割払い(24回)",
	SLN_PAYKBNKAISU30    => "分割払い(30回)",
	SLN_PAYKBNKAISU36    => "分割払い(36回)",
	SLN_PAYKBNKAISU48    => "分割払い(48回)",
	SLN_PAYKBNKAISU54    => "分割払い(54回)",
	SLN_PAYKBNKAISU60    => "分割払い(60回)",
	SLN_PAYKBNKAISU72    => "分割払い(72回)",
	SLN_PAYKBNKAISU88    => "リボルビング払い",
	SLN_PAYKBNKAISU80    => "ボーナス一括払い"
);

/**
* セキュリティコード
*/
define("SLN_SECURITY_CODE1", 1);
define("SLN_SECURITY_CODE2", 2);
$GLOBALS["arrSecurityCode"] = array (
	SLN_SECURITY_CODE1      => "有り",
	SLN_SECURITY_CODE2    => "無し"
	);

/**
* 認証アシスト項目
*/
define("SLN_ATTESTATION_ASSISTANCE1", "KanaSei");
define("SLN_ATTESTATION_ASSISTANCE2", "BirthDay");
define("SLN_ATTESTATION_ASSISTANCE3", "TelNo");
$GLOBALS["arrAssistance"] = array (
	SLN_ATTESTATION_ASSISTANCE1    => "カナ氏名",
	SLN_ATTESTATION_ASSISTANCE2    => "生月日",
	SLN_ATTESTATION_ASSISTANCE3    => "電話番号下4桁"
	);

/**
* カード決済手続き
*/
define("SLN_CARD_PROCEDURE1", "1Auth");
define("SLN_CARD_PROCEDURE2", "1Gathering");
$GLOBALS["arrCardProcedure"] = array (
	SLN_CARD_PROCEDURE1      => "仮売上(1Auth)",
	SLN_CARD_PROCEDURE2    => "即時売上(1Gathering)"
	);

/**
 * 受注入金済み手続き
 */
define("SLN_ORDER_NEW", 0);
define("SLN_ORDER_PRE_END", 1);
$GLOBALS["arrCardPayStatus"] = array (
    SLN_ORDER_NEW      => "新規受注",
    SLN_ORDER_PRE_END    => "入金済み "
);

/**
 * 3D認証機能
 */
define("SLN_3D_PAY1", 1);
define("SLN_3D_PAY2", 2);
$GLOBALS["arr3DPay"] = array (
    SLN_3D_PAY1    => "有り",
    SLN_3D_PAY2    => "無し"
);

/**
* 会員登録機能
*/
define("SLN_MEMBER_REGIST1", 1);
define("SLN_MEMBER_REGIST2", 2);
$GLOBALS["arrMemberRegist"] = array (
	SLN_MEMBER_REGIST1    => "有り",
	SLN_MEMBER_REGIST2    => "無し"
	);

/**
* クイック決済
*/
define("SLN_QUICK_ACCOUNTS1", 1);
define("SLN_QUICK_ACCOUNTS2", 2);
$GLOBALS["arrQuickAccounts"] = array (
	SLN_QUICK_ACCOUNTS1    => "有り",
	SLN_QUICK_ACCOUNTS2    => "無し"
	);

/**
* --オンライン収納--
* 利用できるオンライン収納決済方法
*/
define("SLN_ONLINE_PAYMENT_METHOD1", "convenience_1");
define("SLN_ONLINE_PAYMENT_METHOD2", "convenience_seven");
define("SLN_ONLINE_PAYMENT_METHOD3", "electronic_money_edy");
define("SLN_ONLINE_PAYMENT_METHOD4", "electronic_money_suika");
define("SLN_ONLINE_PAYMENT_METHOD5", "netbank");
define("SLN_ONLINE_PAYMENT_METHOD6", "paygee");
$GLOBALS["arrOnlinePaymentMethod"] = array (
	SLN_ONLINE_PAYMENT_METHOD1    => "コンビニ決済(ローソン／ファミリーマート／サークルKサンクス／デイリーヤマザキグループ／ミニストップ／スリーエフ)",
	SLN_ONLINE_PAYMENT_METHOD2    => "コンビニ決済(セブンイレブン)",
	SLN_ONLINE_PAYMENT_METHOD3	   =>"楽天EDY",
	SLN_ONLINE_PAYMENT_METHOD4	   =>"SUICA",
	SLN_ONLINE_PAYMENT_METHOD5    =>"ネットバンク(楽天銀行／ジャパンネット銀行／じぶん銀行／住信SBIネット銀行)",
	SLN_ONLINE_PAYMENT_METHOD6    =>"ペイジー(ATM／インターネットバンキング)"
	);

/**
* --オンライン収納--
* 利用できるオンライン収納決済方法(表示Short ver)
*/
define("SLN_ONLINE_SHORT_PAYMENT_METHOD1", "convenience_1");
define("SLN_ONLINE_SHORT_PAYMENT_METHOD2", "convenience_seven");
define("SLN_ONLINE_SHORT_PAYMENT_METHOD3", "electronic_money_edy");
define("SLN_ONLINE_SHORT_PAYMENT_METHOD4", "electronic_money_suika");
define("SLN_ONLINE_SHORT_PAYMENT_METHOD5", "netbank");
define("SLN_ONLINE_SHORT_PAYMENT_METHOD6", "paygee");
$GLOBALS["arrShortPaymentMethod"] = array (
	SLN_ONLINE_SHORT_PAYMENT_METHOD1    => "コンビニ決済",
	SLN_ONLINE_SHORT_PAYMENT_METHOD2    => "コンビニ決済",
	SLN_ONLINE_SHORT_PAYMENT_METHOD3	   =>"楽天EDY",
	SLN_ONLINE_SHORT_PAYMENT_METHOD4	   =>"SUICA",
	SLN_ONLINE_SHORT_PAYMENT_METHOD5    =>"ネットバンク",
	SLN_ONLINE_SHORT_PAYMENT_METHOD6    =>"ペイジー"
	);



if (!file_exists(dirname(__FILE__) . '/v2')) {

    copy(SLN_COPY_PATH . "sln_3d.php", 	HTML_REALDIR . "shopping/sln_3d.php");
    copy(SLN_COPY_PATH . "sln_3d_post.php", HTML_REALDIR . "shopping/sln_3d_post.php");
    copy(SLN_COPY_PATH . "sln_card_3d.php", HTML_REALDIR . "mypage/sln_card_3d.php");

    file_put_contents(dirname(__FILE__) . '/v2', '1.0.0');
    SC_Utils_Ex::clearCompliedTemplate();
}