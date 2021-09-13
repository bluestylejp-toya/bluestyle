<?php
require_once '../../require.php';
require_once CLASS_EX_REALDIR . 'page_extends/mypage/myitem/LC_Page_Mypage_Myitem_History_Ex.php';

$objPage = new LC_Page_Mypage_Myitem_History_Ex();
$objPage->init();
$objPage->process();
