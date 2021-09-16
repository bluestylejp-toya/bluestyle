<?php
/** エラーメッセージ取得
 *
 * @package ソニーペイメントサービス決済モジュール
 * @author Sony Payment Services Inc.
 * @version 2.0.0
 */
class GetErrorMsg {
	public $arrError = null;

	function __construct() {
		$arrError = array();

		$text = file_get_contents(SLN_ERROR_CODE_MSG_FILE);
		$arrText = explode("\n", $text);
		foreach ($arrText as $line) {
			$errorInfo = $this->parseErrorInfo($line);
			$arrError[ $errorInfo['code'] ] = $errorInfo;
		}
		$this->arrError = $arrError;
	}

	function parseErrorInfo($line = "") {
	    $lineArray = explode("\t", $line);
		return array(
		    'no'      => (isset($lineArray[0])) ? $lineArray[0] : "",
		    'code'    => (isset($lineArray[1])) ? $lineArray[1] : "",
		    'context' => (isset($lineArray[2])) ? $lineArray[2] : "",
		    'message' => (isset($lineArray[3])) ? $lineArray[3] : "",
			'adminmessage' => (isset($lineArray[4])) ? $lineArray[4] : "");
	}

	function getErrorMessageByCode($code) {
	    if (empty($code) || empty($this->arrError) || empty($this->arrError[$code])) {
	        return false;
	    } else {
	        return $this->arrError[$code];
	    }
	}
}