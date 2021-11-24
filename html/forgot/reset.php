<?php
require_once '../require.php';
require_once CLASS_EX_REALDIR . 'page_extends/forgot/LC_Page_Forgot_Reset_Ex.php';

$objPage = new LC_Page_Forgot_Reset_Ex();
$objPage->init();
$objPage->process();
