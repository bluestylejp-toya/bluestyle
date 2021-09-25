<?php
require_once('../require.php');
require_once(MODULE_REALDIR . 'mdl_sln/defines.php');
require_once(SLN_CLASS_PATH . 'SLN_ChangeCard.php');
/*
 ** カード情報設定
 *
 * @package ソニーペイメントサービス決済プラグイン
 * @author Sony Payment Services Inc.
 * @version 2.0.0
*/
$objectPage = new SLN_ChangeCard();
$objectPage->init();
$objectPage->process();
