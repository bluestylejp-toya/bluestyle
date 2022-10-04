<?php

class LineLoginService
{
    public function __construct()
    {
        $this->LINE_PUSH_URL = "https://api.line.me/v2/bot/message/push";
    }

    /**
     * @return array
     */
    public function getLineConfig()
    {
        $objQuery = SC_Query_Ex::getSingletonInstance();
        $sql = 'SELECT * FROM plg_line_login_integration_setting';
        return $objQuery->getAll($sql, array());
    }

    /**
     * @param $customerId
     * @return array
     */
    public function getLineUserId($customerId)
    {
        $objQuery = SC_Query_Ex::getSingletonInstance();
        $sql = 'SELECT * FROM plg_line_login_integration WHERE customer_id = ? and del_flg = 0';
        return $objQuery->getAll($sql, array($customerId));
    }

    /**
     * @param $post_values
     * @param $customerId
     * @return false|void
     */
    public function sendMessage($postValues, $customerId)
    {
        $result = $this->getLineConfig();
        if (is_array($result) and count($result) == 0){
            return false;
        }
        $LINE_CONFIG = $result[0];

        $result = $this->getLineUserId($customerId);
        if (is_array($result) and count($result) == 0){
            echo $customerId;
            return false;
        }
        $LINE_USER_ID = $result[0]['line_user_id'];


        // リクエストヘッダ
        $header = [
            'Authorization: Bearer ' . $LINE_CONFIG['line_channel_access_token'],
            'Content-Type: application/json'
        ];

        // 送信するデータ
        $post_data = [
            "to" => $LINE_USER_ID,
            "messages" => $postValues
        ];

        // cURLを使った送信処理の時は true
        // file_get_contentsを使った送信処理の時は false
        $USE_CURL = false;

        if ($USE_CURL) {
            // cURLを使った送信処理
            $curl = curl_init();
            curl_setopt($curl, CURLOPT_URL, $this->LINE_PUSH_URL);
            curl_setopt($curl, CURLOPT_POST, true);
            curl_setopt($curl, CURLOPT_CUSTOMREQUEST, 'POST');
            curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($curl, CURLOPT_HTTPHEADER, $header);
            curl_setopt($curl, CURLOPT_POSTFIELDS, json_encode($post_data));
            $result = curl_exec($curl);
            curl_close($curl);
        } else {
            // file_get_contentsを使った送信処理
            $context = stream_context_create(array(
                'http' => array(
                    'method' => 'POST',
                    'header' => implode("\r\n", $header),
                    'content' => json_encode($post_data),
                    'ignore_errors' => true
                )
            ));

            $result = file_get_contents(
                $this->LINE_PUSH_URL,
                false,
                $context
            );

            var_dump($result);
        }


    }
}