<?php
require_once(MODULE_REALDIR . 'mdl_sln/defines.php');
require_once(SLN_CLASS_PATH . "SLN_Config.php");

/* 管理設定
 *
* @package ソニーペイメントサービス決済モジュール
* @author Sony Payment Services Inc.
* @version 2.0.0
*/
$objectPage = new SLN_Config();
$objectPage->init();
$objectPage->process();