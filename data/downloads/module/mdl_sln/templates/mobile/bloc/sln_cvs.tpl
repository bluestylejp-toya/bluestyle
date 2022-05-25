<!--{strip}-->
<!--{assign var=key value="payment"}-->
<font color="#FF0000"> <!--{$arrErr[$key]}--></font>
<form action="?mode=return" method="get">
	<input type="hidden" name="mode" value="return">
	<div style="text-align:center;" align="center">
		<input type="submit" value="戻る">
	</div>
</form>
<!--{/strip}-->