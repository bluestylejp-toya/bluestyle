<?php
require_once '../require.php';
require_once(MODULE_REALDIR . 'mdl_sln/defines.php');
require_once(SLN_CLASS_PATH . "CryptAES.php");
require_once(SLN_CLASS_PATH . "SLN_C_Base.php");
require_once(SLN_CLASS_PATH . 'SLN_C_RegistCredit.php');
require_once(SLN_CLASS_PATH . 'SLN_C_Member.php');

$objectMdl =& SLN::getInstance();
$slnSettingHash = $objectMdl->getConfigs();

$CryptAES = new CryptAES();
$CryptAES->setKey($slnSettingHash['credit_aes_key']);
$CryptAES->setIv($slnSettingHash['credit_aes_iv']);

$base = new SLN_C_Base();
$data = $base->aesDeCode($_POST['EncryptValue'], $CryptAES);

function getOrderId() {
    if (!SC_Utils::isBlank($_SESSION['order_id'])) {
        $order_id = $_SESSION['order_id'];
    } else if (!SC_Utils::isBlank($_REQUEST['order_id']) && SC_Utils::sfIsInt($_REQUEST['order_id'])) {
        $_SESSION['order_id'] = $order_id = $_REQUEST['order_id'];
    }
    return $order_id;
}

if ($data['ProcNo']) {//受注データ
  
    $orderHash = SC_Query_Ex::getSingletonInstance()->getRow('*', 'dtb_order', 'order_id = ?', array(intval($data['MerchantFree1'])));
    $statusId = $orderHash['status'];
    
    if ($orderHash['order_id']) {//決済中受注存在チェック

        $errorMess = "";
        
        if ($orderHash['del_flg'] == 1 || $orderHash['status'] == ORDER_CANCEL) {
            $errorMess = "受注すでにキャンセルしました。";
        }


        if (!$errorMess) {
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
        
        if (!$errorMess) {
            
            if ($data['ResponseCd'] == "OK") {
                //決済ステータスを完了する
                if ($data['OperateId'] == "1Auth") {
                    $data['pay_status'] = SLN_PAY_STATUS_AUTH;
                } else {
                    $data['pay_status'] = SLN_PAY_STATUS_CAPTURE;
                }
                
                SLN_Util::setOrderPayHash($orderHash, $data);
                
            } else {
                $errorMess = $base->createErrCode($data['ResponseCd']);
                if (!$errorMess) {
                    $errorMess = "エラーコード:" . $data['ResponseCd'];
                }
            }
            
        }
        
        if ($errorMess) {//購入エラーを表示する
            $data['success_pay_status'] = SLN_PAY_STATUS_FAIL;
            SLN_Util::setOrderPayHash($orderHash, $data);
            
        } else {//購入完了ページを表示する   
            
            $order_status = ORDER_NEW;
            
            // 即時売上時は入金済みにする
            $objectMdl =& SLN::getInstance();
            $slnSettingHash = $objectMdl->getConfigs();
            if ($data['pay_status'] == SLN_PAY_STATUS_CAPTURE && $slnSettingHash['card_order_pre_end'] == SLN_ORDER_PRE_END) $order_status = ORDER_PRE_END;
            
            $objectPurchase = new SC_Helper_Purchase();
            $objectQuery =& SC_Query::getSingletonInstance();
            $objectQuery->begin();
            $objectPurchase->sfUpdateOrderStatus($orderHash['order_id'], $order_status);
            $objectQuery->commit();
         
            $objResponse = new SC_Response_Ex();
            $objResponse->sendRedirect(SHOPPING_COMPLETE_URLPATH);
            $objResponse->actionExit();
        }
    } else {
        //エラー処理
        $errorMess = "受注存在していません。お手数ですが再度ご購入ください。";
    }
} else {
    //エラー処理
    $errorMess = "受注存在していません。お手数ですが再度ご購入ください。";
}

//エラーメッセージを照会用
$objResponse = new SC_Response_Ex();
$_SESSION['sln_pay_error'] = array('code' => rand(1, 100000) . time(), 'errorMess' => $errorMess);
$objResponse->sendRedirect(HTTPS_URL . "shopping/load_sln_payment_module.php", array('errorMess' => urlencode(base64_encode($_SESSION['sln_pay_error']['code']))));
$objResponse->actionExit();


