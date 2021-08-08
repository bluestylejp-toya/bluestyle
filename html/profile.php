<?php
require_once './require.php';
require_once CLASS_EX_REALDIR . 'page_extends/LC_Page_Profile_Ex.php';

$objPage = new LC_Page_Profile_Ex();
$objPage->init();
$objPage->process();
