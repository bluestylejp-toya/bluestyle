<!--{assign var=sln_order_col_payid value=$smarty.const.SLN_ORDER_COL_PAYID}-->
<!--{assign var=sln_order_col_paystatus value=$smarty.const.SLN_ORDER_COL_PAYSTATUS}-->

<td	class="center">
	<!--{if ($arrResults[cnt][$sln_order_col_payid] == SLN_PAYID_CREDIT || $arrResults[cnt][$sln_order_col_payid] == SLN_PAYID_REGIST_CREDIT) && ($arrResults[cnt][$sln_order_col_paystatus] == SLN_PAY_STATUS_AUTH)}-->

	<input type="checkbox" value="<!--{$arrResults[cnt].order_id}-->" id="sln_commit_order_id_<!--{$arrResults[cnt].order_id}-->" name="sln_commit_order_id[]"/>
	<label for="sln_commit_order_id_<!--{$arrResults[cnt].order_id}-->">決済一括売上</label>
	<br>
	<a href="#" onclick="fnModeSubmit('sln_commit', 'order_id', <!--{$arrResults[cnt].order_id}-->); return false;" href="./"><span class="icon_class">決済個別売上</span></a>

	<!--{else}--> &ndash; <!--{/if}-->
</td>

<td class="center">
	<!--{if ($arrResults[cnt][$sln_order_col_payid] == SLN_PAYID_CREDIT || $arrResults[cnt][$sln_order_col_payid] == SLN_PAYID_REGIST_CREDIT || $arrResults[cnt][$sln_order_col_payid] == SLN_PAYID_IDNET || $arrResults[cnt][$sln_order_col_payid] == SLN_PAYID_PAYPAL || $arrResults[cnt][$sln_order_col_payid] == SLN_PAYID_AU || $arrResults[cnt][$sln_order_col_payid] == SLN_PAYID_DOCOMO || $arrResults[cnt][$sln_order_col_payid] == SLN_PAYID_SB) && ($arrResults[cnt][$sln_order_col_paystatus] == SLN_PAY_STATUS_AUTH || $arrResults[cnt][$sln_order_col_paystatus] == SLN_PAY_STATUS_AUTH || $arrResults[cnt][$sln_order_col_paystatus] == SLN_PAY_STATUS_COMMIT || $arrResults[cnt][$sln_order_col_paystatus] == SLN_PAY_STATUS_SALES || $arrResults[cnt][$sln_order_col_paystatus] == SLN_PAY_STATUS_CAPTURE)}-->

	<input type="checkbox" id="sln_cancel_id_<!--{$arrResults[cnt].order_id}-->" value="<!--{$arrResults[cnt].order_id}-->" name="sln_cancel_order_id[]"/>
	<label for="sln_cancel_<!--{$arrResults[cnt].order_id}-->">決済一括取消</label>
	<br>
	<a href="#" onclick="fnModeSubmit('sln_cancel', 'order_id', <!--{$arrResults[cnt].order_id}-->); return false;"><span class="icon_class">決済個別取消</span></a>

	<!--{else}--> &ndash; <!--{/if}-->
</td>

