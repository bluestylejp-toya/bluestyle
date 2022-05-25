<br>
<form name="form<!--{$key}-->" id="form<!--{$key}-->" method="post" action="?" utn>
	<input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->">
	<input type="hidden" name="mode" value="plg_slnquick">
	<input type="hidden" name="cart_no" value="">
	<input type="hidden" name="cartKey" value="<!--{$key}-->">
	<div style="text-align:center;" align="center">
		<input type="submit" value="クイック決済で購入">
	</div>
</form>
<br>


