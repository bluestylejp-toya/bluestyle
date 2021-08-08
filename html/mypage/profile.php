<?php
require_once '../require.php';
require_once CLASS_EX_REALDIR . 'page_extends/mypage/LC_Page_Mypage_Profile_Ex.php';

$objPage = new LC_Page_Mypage_Profile_Ex();
$objPage->init();
$objPage->process();
