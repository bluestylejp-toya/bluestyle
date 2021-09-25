<?php

require_once '../require.php';
require_once(MODULE_REALDIR . 'mdl_sln/defines.php');
require_once(SLN_CLASS_PATH . "CryptAES.php");
require_once(SLN_CLASS_PATH . "SLN_C_Base.php");
require_once(SLN_CLASS_PATH . 'SLN_C_Member.php');

$objectMdl =& SLN::getInstance();
$slnSettingHash = $objectMdl->getConfigs();

$CryptAES = new CryptAES();
$CryptAES->setKey($slnSettingHash['credit_aes_key']);
$CryptAES->setIv($slnSettingHash['credit_aes_iv']);

$base = new SLN_C_Base();
$data = $base->aesDeCode($_POST['EncryptValue'], $CryptAES);

$objectCustomer = new SC_Customer_Ex();
if ($objectCustomer->isLoginSuccess(true) === false) {//ログイン判断
    $errorMess = "対象ユーザー存在していません。お手数ですが再度ご購入ください。";
}

if (!$errorMess) {
    $customer_id = $objectCustomer->getValue('customer_id');
    
    if (!$customer_id) {
        $errorMess = "対象ユーザー存在していません。お手数ですが再度ご購入ください。";
    }
    
    if (!$errorMess) {
        $arrCustomer = SC_Helper_Customer::sfGetCustomerData($customer_id);
        $objectClient = new SLN_C_Member();
        
        if ($data['ResponseCd'] != 'OK') {
            switch ($data['SecureResultCode']) {
                case 2://3D　パスワード未設定
                    $errorMess = "お客様カード䛾 3D セキュアパスワード未設定䛾ため 3D セキュア認証未実施です。カード会社のセキュアパスワードを設定上にまだ購入お願いいたします。";
                    break;
                case 3://カード発行会社未対応
                    $errorMess = "カード発行会社 3D セキュア未対応䛾ため 3D セキュア認証未実施です。";
                    break;
                case 8://認証システムメンテナンス中
                    $errorMess = "認証システムがメンテナンス中䛾ため 3D セキュア認証未実施です。後ほど再購入お願いいたします。";
                    break;
                case 9://認証システムエラー
                    $errorMess = "認証システムでエラーが発生したため 3D セキュア認証未実施です。";
                    break;
                default:
                    break;
            }   
        }   
    }   
}

        
if (!$errorMess) {

    if ($data['ResponseCd'] == "OK") {//操作成功 
        $objResponse = new SC_Response_Ex();
        $objResponse->sendRedirect(HTTPS_URL . 'mypage/card_info.php?errorMess=OK');
        $objResponse->actionExit();
    } else {
        $errorMess = $base->createErrCode($data['ResponseCd']);
        if (!$errorMess) {
            $errorMess = "エラーコード" . $data['ResponseCd'];
        }
    }
}

if ($errorMess) {
    if ($_SESSION['sln_change_unInvalCard'] == 3) {
        $objectClient->invalCard($arrCustomer); // 再度無効化
        unset($_SESSION['sln_change_unInvalCard']);
    }
}

//エラーメッセージを照会用
$objResponse = new SC_Response_Ex();
$_SESSION['sln_mypage_error'] = array('code' => rand(1, 100000) . time(), 'errorMess' => $errorMess);
$objResponse->sendRedirect(HTTPS_URL . "mypage/card_info.php", array('errorMess' => urlencode(base64_encode($_SESSION['sln_mypage_error']['code']))));
$objResponse->actionExit();


