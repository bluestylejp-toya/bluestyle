<?php
require_once('../require.php');
require_once(MODULE_REALDIR . 'mdl_sln/defines.php');
require_once(SLN_CLASS_PATH . "SLN_Recv.php");

/** 決済通知先設定
 *
 * @package ソニーペイメントサービス決済モジュール
 * @author Sony Payment Services Inc.
 * @version 2.0.0
*/
$objectPage = new SLN_Recv();
$objectPage->init();
$objectPage->process();