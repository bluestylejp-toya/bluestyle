<?php
session_cache_limiter('private-no-expire');
require_once(MODULE_REALDIR . 'mdl_sln/defines.php');
require_once(SLN_CLASS_PATH . "SLN_Helper.php");

/**
 * 支払設定
 *
 * @package ソニーペイメントサービス決済モジュール
 * @author Sony Payment Services Inc.
 * @version 2.0.0
*/

$objectPage = new SLN_Helper();
$objectPage->init();
$objectPage->process();