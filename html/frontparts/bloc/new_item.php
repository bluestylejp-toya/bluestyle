<?php
require_once realpath(dirname(__FILE__)) . '/../../require.php';
require_once CLASS_EX_REALDIR . 'page_extends/frontparts/bloc/LC_Page_FrontParts_Bloc_NewItem_Ex.php';

$objPage = new LC_Page_FrontParts_Bloc_NewItem_Ex();
$objPage->blocItems = $params['items'];
$objPage->init();
$objPage->process();
