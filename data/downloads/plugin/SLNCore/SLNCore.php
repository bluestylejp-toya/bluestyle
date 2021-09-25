<?php

require_once(MODULE_REALDIR . 'mdl_sln/defines.php');
require_once(SLN_CLASS_PATH . 'SLN_Core.php');

/**
 * プラグインのメインクラス（フックを渡すためだけに作成される）
 *
 * @package ソニーペイメントサービス決済プラグイン
 * @author Sony Payment Services Inc.
 * @version 2.0.0
*/
class SLNCore extends SC_Plugin_Base {

	public function __construct(array $arrSelfInfo) {
		parent::__construct($arrSelfInfo);
	}

	function install($arrPlugin, $objPluginInstaller = null){
	}
	function uninstall($arrPlugin, $objPluginInstaller = null){
	}
	function enable($arrPlugin, $objPluginInstaller = null){
	}
	function disable($arrPlugin, $objPluginInstaller = null){
	}
	function register(SC_Helper_Plugin $objectHelperPlugin, $priority = null) {
		return parent::register($objectHelperPlugin, $priority);
	}

	function prefilterTransform(&$source, LC_Page_Ex $objectPage, $filename) {
		$class_name = get_class($objectPage);
		$object = new SLN_Core();
		$object->actionPrefilterTransform($class_name, $source, $objectPage, $filename, $this);
	}

	function hookActionBefore(LC_Page_Ex $objectPage) {
		$this->callHookAction('before', $objectPage);
	}

	function hookActionAfter(LC_Page_Ex $objectPage) {
		$this->callHookAction('after', $objectPage);
	}

	function hookActionMode(LC_Page_Ex $objectPage) {
		$this->callHookAction('mode', $objectPage);
	}

	function callHookAction($hook_point, &$objectPage) {
		$class_name = get_class($objectPage);
		$object = new SLN_Core();
		$object->actionHook($class_name, $hook_point, $objectPage, $this);
	}
}