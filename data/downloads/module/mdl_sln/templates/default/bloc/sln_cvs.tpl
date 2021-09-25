<script type="text/javascript">//<![CDATA[
var isSubmitExec = true;

function slnCheckSubmit(sub_mode) {
    $('#sln_form_body').slideToggle();
    $('#sln_form_loading').slideToggle();

    if(isSubmitExec) {
        isSubmitExec = false;
        fnModeSubmit(sub_mode,'','');
        return false;
    } else {
        alert("決済処理中です。しばらくお待ち下さい。");
        return false;
    }
}

//]]>
</script>
<div id="sln_form_loading"
	style="<!--{if !$tpl_is_loding}-->display:none;<!--{/if}-->">
	<div class="information">
		<p>決済処理中です。そのまま、お待ち下さい。</p>
	</div>
</div>
<div id="sln_form_body"
	style="<!--{if $tpl_is_loding}-->display:none;<!--{/if}-->">
	<div class="information">
		<p>
			下記項目を選択して下さい。<br /> 選択後、画面下部の「次へ」ボタンをクリックして下さい。
		</p>
		<!--{assign var=key_p value="payment"}-->
		<!--{assign var=key_c value="conveni"}-->
		<p class="attention">
			<!--{$arrErr[$key_p]}-->
			<!--{$arrErr[$key_c]}-->
		</p>
	</div>

	<div class="btn_area">
		<ul>
			<li><input type="image" onmouseover="chgImg('<!--{$TPL_URLPATH}-->img/button/btn_back_on.jpg',this)"
				onmouseout="chgImg('<!--{$TPL_URLPATH}-->img/button/btn_back.jpg',this)"
				onclick="return slnCheckSubmit('return');"
				src="<!--{$TPL_URLPATH}-->img/button/btn_back.jpg" alt="戻る"
				id="back" name="back" border="0" />
			</li>
		</ul>
	</div>
</div>