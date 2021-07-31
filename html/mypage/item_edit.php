<?php
require_once '../require.php';
require_once CLASS_EX_REALDIR . 'page_extends/mypage/LC_Page_Mypage_ItemEdit_Ex.php';

$objPage = new LC_Page_Mypage_ItemEdit_Ex();
$objPage->init();
$objPage->process();
