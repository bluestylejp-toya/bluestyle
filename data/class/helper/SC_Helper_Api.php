<?php
/*
 * This file is part of EC-CUBE
 *
 * Copyright(c) EC-CUBE CO.,LTD. All Rights Reserved.
 *
 * http://www.ec-cube.co.jp/
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
 */

/**
 * @package Helper
 * @author pineray
 * @version $Id$
 */
class SC_Helper_Api
{
    function __construct(){

        $header = [
            "accept: application/json",
            "Content-Type: application/json",
        ];

        $this->options = [];
        $this->options[CURLOPT_TIMEOUT] = 60;
        $this->options[CURLOPT_RETURNTRANSFER] = true;
        $this->options[CURLOPT_HTTPHEADER] = $header;

        if (defined('DEBUG_MODE') && DEBUG_MODE === true) {
            $this->options[CURLOPT_VERBOSE] = true;
            $this->options[CURLOPT_STDERR] = fopen(__DIR__ . '/../../logs/curl.log', 'a');
        }
    }

    /**
     * @param $url
     */
    function setUrl($url)
    {
        $this->options[CURLOPT_URL] = $url;
    }

    /**
     * @param $method
     */
    function setMethod($method)
    {
        $this->options[CURLOPT_CUSTOMREQUEST] = $method;
    }

    /**
     * POSTするデータ
     * @param $data
     */
    function setPostParam($data)
    {
        $this->options[CURLOPT_POSTFIELDS] = json_encode($data);
    }

    /**
     * API実行
     * @return bool|string
     */
    function exec()
    {
        //cURLセッションを初期化する
        $ch = curl_init();
        curl_setopt_array( $ch,  $this->options );
        //URLの情報を取得し、ブラウザに渡す
        $json = curl_exec($ch);

        if (curl_getinfo($ch, CURLINFO_RESPONSE_CODE) != 200){
            throw new Exception('');
        }

        //セッションを終了する
        curl_close($ch);
        return $json;
    }

}