<!--{assign var=sln_order_col_payid value=$smarty.const.SLN_ORDER_COL_PAYID}-->
<!--{assign var=sln_order_col_paystatus value=$smarty.const.SLN_ORDER_COL_PAYSTATUS}-->
<!--{assign var=sln_payid value=$arrStatus[cnt][$sln_order_col_payid]}-->
<!--{assign var=sln_paystatus value=$arrStatus[cnt][$sln_order_col_paystatus]}-->
<td class="center">
	<input type="hidden" name="sln_paystatus[]" value="<!--{$sln_paystatus}-->" />
	<!--{if $sln_payid}-->
		<!--{if $sln_paystatus == SLN_PAY_STATUS_UNSETTLED}-->
		    <span>未決済</span>
		<!--{elseif $sln_paystatus == SLN_PAY_STATUS_REQUEST_SUCCESS}-->
            <span>決済要求成功</span>
		<!--{elseif $sln_paystatus == SLN_PAY_STATUS_PAY_SUCCESS}-->
            <span>支払い完了</span>
		<!--{elseif $sln_paystatus == SLN_PAY_STATUS_FAIL}-->
            <span>決済失敗</span>
		<!--{elseif $sln_paystatus == SLN_PAY_STATUS_CANCEL}-->
            <span>キャンセル</span>
		<!--{elseif $sln_paystatus == SLN_PAY_STATUS_AUTH}-->
            <span>仮売上済み</span>
		<!--{elseif $sln_paystatus == SLN_PAY_STATUS_COMMIT}-->
            <span>実売上済み</span>
		<!--{elseif $sln_paystatus == SLN_PAY_STATUS_SALES}-->
            <span>実売上済み</span>
		<!--{elseif $sln_paystatus == SLN_PAY_STATUS_CAPTURE}-->
            <span>即時売上済み</span>
		<!--{elseif $sln_paystatus == SLN_PAY_STATUS_VOID}-->
            <span>取消済み</span>
		<!--{else}-->
            <span>不明な状態(<!--{$sln_paystatus}-->)</span>
		<!--{/if}-->
	<!--{else}-->
		<span>&ndash;</span>
	<!--{/if}-->
</td>
