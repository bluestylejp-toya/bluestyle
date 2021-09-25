<?php
/**
 * プラグイン情報クラス
 *
 * @package ソニーペイメントサービス決済プラグイン
 * @author Sony Payment Services Inc.
 * @version 2.0.0
 */
class plugin_info{

	static $PLUGIN_CODE       = "SLNCore";
	static $PLUGIN_NAME       = "ソニーペイメントサービス決済プラグイン";
	static $CLASS_NAME        = "SLNCore";
	static $PLUGIN_VERSION    = "2.0.0";
	static $COMPLIANT_VERSION = "2.17.0";
	static $AUTHOR            = "ソニーペイメントサービス";
	static $DESCRIPTION       = "ソニーペイメントサービス決済モジュールの動作に必要なプラグインです。決済を利用する場合に、本プラグインの無効化や削除はしないで下さい。";
	static $PLUGIN_SITE_URL   = "http://www.sonypaymentservices.jp/";
	static $AUTHOR_SITE_URL   = "http://www.sonypaymentservices.jp/";

	/**
	 * フックポイント一覧
	 */
	static $HOOK_POINTS       = array(
			array("LC_Page_Admin_Basis_PaymentInput_action_after", 'hookActionAfter'),
			array("LC_Page_Shopping_Payment_action_after", 'hookActionAfter'),
			array("LC_Page_Shopping_Payment_action_before", 'hookActionBefore'),
			array("LC_Page_Shopping_Complete_action_before", 'hookActionBefore'),
			array("LC_Page_Admin_Order_Status_action_before", 'hookActionBefore'),
			array("LC_Page_Admin_Order_Edit_action_before", 'hookActionBefore'),
			array("LC_Page_Admin_Order_Edit_action_after", 'hookActionAfter'),
			array("LC_Page_Admin_Order_action_before", 'hookActionBefore'),
			array("LC_Page_Admin_Order_action_after", 'hookActionAfter'),
			array("LC_Page_Mypage_Refusal_action_before", 'hookActionBefore'),
			array("LC_Page_Admin_Customer_action_after", 'hookActionAfter'),
			array("LC_Page_Products_Detail_action_before", 'hookActionBefore'),
			array("LC_Page_Products_List_action_before", 'hookActionBefore'),
			array("LC_Page_Cart_action_before", 'hookActionBefore'),
			array("LC_Page_Shopping_action_before", 'hookActionBefore'),
			array("LC_Page_Shopping_Deliv_action_before", 'hookActionBefore'),
			array("LC_Page_Shopping_Confirm_action_before", 'hookActionBefore'),
			array("LC_Page_Shopping_Confirm_action_after", 'hookActionAfter'),
			array("prefilterTransform", 'prefilterTransform')
	);
}
