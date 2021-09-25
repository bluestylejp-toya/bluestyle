<?php
require_once(MODULE_REALDIR . 'mdl_sln/defines.php');

/**
 * SLNクラス（ソニーペイメントサービス決済モジュール大本）
 *
 * @package ソニーペイメントサービス決済モジュール
 * @author Sony Payment Services Inc.
 * @version 2.0.0
 * ロックオン提供のサンプルコードから不要部分を削除
*/
class SLN {

	var $subData = null;
	var $installSubData = array('master_settings' => array(),'user_settings' => array());

	function &getInstance() {
		static $_objSLN;
		if (empty($_objSLN)) {
			$_objSLN = new SLN();
		}
		return $_objSLN;
	}

	function init() {
	}
	function destroy() {
	}

	function getSubData($key = null) {
		if (empty($this->subData)) {
    		$objectQuery =& SC_Query::getSingletonInstance();
	    	$ret = $objectQuery->get('sub_data', 'dtb_module', 'module_code =?', array(SLN_CODE));
		    if (!empty($ret)) {
			    $this->subData = unserialize($ret);
		    }
		}
		if (empty($this->subData)) {
		    return null;
		}

	    return is_null($key) ? $this->subData : $this->subData[$key];
	}

	function registerSubData($data, $key = null) {
		if (is_null($key)) {
			$subData = $data;
		} else {
		    $subData = $this->getSubData();
		    $subData[$key] = $data;
		}

		$objectQuery =& SC_Query::getSingletonInstance();
		$objectQuery->update('dtb_module', array('sub_data' => serialize($subData)), 'module_code = ?', array(SLN_CODE));

		$this->subData = $subData;
	}

	function getConfigs($key = null) {
	    $userSettings = $this->getSubData('user_settings');
		if (is_null($key)) {
			return !empty($userSettings) ? $userSettings : null;
		} else {
			return !empty($userSettings[$key]) ? $userSettings[$key] : null;
		}
	}

	function install($force = false) {
		$objectDB = new SC_Helper_DB();
		$objectDB->sfColumnExists('dtb_payment', 'module_code', 'text', "", true);

		$subData = $this->getSubData();
		if ($force || empty($subData)) {
			$this->registerSubdata($this->installSubData['master_settings'], 'master_settings');
		}
	}
}