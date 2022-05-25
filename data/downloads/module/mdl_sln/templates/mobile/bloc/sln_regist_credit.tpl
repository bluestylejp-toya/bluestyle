<!--{strip}-->
<!--{if $tpl_is_loading}-->
<b>決済処理中です。</b>
<hr>
決済処理を完了するため
<br>
「次へ」ボタンをクリックして下さい。
<br>
<font color="#FF0000">※通信状況などにより画面が切り替るまで少々時間がかかる場合があります。</font>
<br>
<br>
<div style="text-align:center;" align="center">
	<input type="submit" value="次へ">
</div>
<!--{/if}-->

<!--{if !$tpl_is_loading}-->
<!--{assign var=key1 value="payment"}-->
<!--{if $arrErr[$key1] != ""}-->
<b>決済エラー</b>
<br>
申し訳ありませんがエラーの内容をご確認のうえ、お手続きをやりなおして下さい。
<br>

<!--{assign var=key1 value="payment"}-->
<font color="#FF0000"> <!--{$arrErr[$key1]}-->
</font>

<!--{else}-->
<hr>
■支払い方法 <font color="#FF0000">*</font><br>
<!--{assign var=key1 value="PayType"}-->
<!--{if $arrErr[$key1] != ""}-->
<font color="#FF0000"><!--{$arrErr[$key1]}--></font><br>
<!--{/if}-->
<select name="<!--{$key1}-->">
<!--{html_options options=$arrPayMethod selected=$arrForm[$key1].value}-->
</select>
<br>
<br>

上記支払回数でよろしければ、下記「次へ」ボタンをクリックして下さい。
<br>
<font color="#FF0000">※通信状況などにより画面が切り替るまで少々時間がかかる場合があります。</font>

<div style="text-align:center;" align="center">
	<input type="submit" value="次へ">
</div>
<!--{/if}-->
</form>
<form action="?mode=return" method="get">
	<div style="text-align:center;" align="center">
		<input type="submit" value="戻る">
	</div>
	<input type="hidden" name="mode" value="return">
<!--{/if}-->
<!--{/strip}-->
