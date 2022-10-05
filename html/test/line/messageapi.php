<?php

require_once '../../require.php';

$objLineEvent = new LineEvent();

// 送信するメッセージの下準備
$post_values = array(
    [
        "type" => "text",
        "text" => 'テストテストテスト',
    ]
);

$objCustomer = new SC_Customer_Ex();
$objLineEvent->sendMessage($post_values, $objCustomer->getValue('customer_id'));