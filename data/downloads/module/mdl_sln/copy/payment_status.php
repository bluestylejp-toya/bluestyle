<?php
require_once('../require.php');
require_once(MODULE_REALDIR . 'mdl_sln/defines.php');
require_once(SLN_CLASS_PATH . 'SLN_Utils_Payment_Status.php');

/** 管理画面　支払状況設定
 *
 * @package ソニーペイメントサービス 決済プラグイン
 * @author Sony Payment Services Inc.
 * @version 2.0.0
*/

$objectPage = new SLN_Utils_Payment_Status();
$objectPage->init();
$objectPage->process();
