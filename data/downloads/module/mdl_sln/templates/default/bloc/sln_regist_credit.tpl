<script type="text/javascript">//<![CDATA[
$(function() {
    <!--{$tpl_payment_onload}-->
});

function slnCheckSubmit(sub_mode) {
    $('#sln_form_body').slideToggle();
    $('#sln_form_loading').slideToggle();
    fnModeSubmit(sub_mode,'','');
    return false;
}

//]]>
</script>
<div id="sln_form_loading"
	style="<!--{if !$tpl_is_loding}-->display:none;<!--{/if}-->">
	<div class="information">
		<p>決済処理中です。しばらくお待ち下さい。</p>
	</div>
</div>
<!--{assign var=key1 value="payment"}-->
<!--{if $arrErr[$key1] != ""}-->
<div id="sln_form_body"
	style="<!--{if $tpl_is_loding}-->display:none;<!--{/if}-->">
	<div class="information">
		<p>決済処理で下記のエラーが発生しました。</p>
		<!--{assign var=key_p value="payment"}-->
		<!--{assign var=key_c value="CardSeq"}-->
		<p class="attentionSt">
			<!--{$arrErr[$key_p]}-->
		</p>
	</div>
	<div class="btn_area">
		<ul>
			<li><input type="image" onmouseover="chgImg('<!--{$TPL_URLPATH}-->img/button/btn_back_on.jpg',this)"
				onmouseout="chgImg('<!--{$TPL_URLPATH}-->img/button/btn_back.jpg',this)"
				onclick="return slnCheckSubmit('return');"
				src="<!--{$TPL_URLPATH}-->img/button/btn_back.jpg" alt="戻る"
				name="back" id="back" border="0" />
			</li>
		</ul>
	</div>
</div>
<!--{else}-->
<div id="sln_form_body"
	style="<!--{if $tpl_is_loding}-->display:none;<!--{/if}-->">
	<div class="information">
		<!--{assign var=key2 value="CardSeq"}-->
		<p class="attentionSt">
			<!--{$arrErr[$key1]}-->
		</p>
		<p class="attentionSt">
			<!--{$arrErr[$key2]}-->
		</p>
	</div>
	<table summary="支払回数選択">
		<tr>
			<th class="alignR" colspan="2" style="width: 20%;">支払い回数<span class="attention">※</span>
			</th>
			<td style="width: 80%;">
				<!--{assign var=key1 value="PayType"}--> <!--{if $arrErr[$key1]}-->
				<span class="attentionSt"> <!--{$arrErr[$key1]}-->
			</span> <!--{/if}--> <select name="<!--{$key1}-->"
				style="<!--{$arrErr[$key1]|sfGetErrorColor}-->">
					<!--{html_options options=$arrPayMethod selected=$arrForm[$key1].value|escape}-->
			</select>
			</td>
		</tr>
	</table>

	<div class="information" style="border: 1px solid #CCCCCC; padding: 0.5em;">
		<p>以上の内容で間違いなければ、下記「購入」ボタンをクリックして下さい。<br />
		<span class="attention">※通信状況などにより画面が切り替るまで少々時間がかかる場合があります。</span>
		</p>
	</div>

	<div class="btn_area">
		<ul>
			<li><input type="image" onmouseover="chgImg('<!--{$TPL_URLPATH}-->img/button/btn_back_on.jpg',this)"
				onmouseout="chgImg('<!--{$TPL_URLPATH}-->img/button/btn_back.jpg',this)"
				onclick="return slnCheckSubmit('return');"
				src="<!--{$TPL_URLPATH}-->img/button/btn_back.jpg" alt="戻る"
				name="back" id="back" border="0" />
			</li>
			<li>
				<!--{if $tpl_btn_next}--> <input type="image"
				onmouseover="chgImgImageSubmit('<!--{$smarty.const.ROOT_URLPATH}-->plugin/SLNCore/btn_bloc_buy_on.jpg',this)"
				onmouseout="chgImgImageSubmit('<!--{$smarty.const.ROOT_URLPATH}-->plugin/SLNCore/btn_bloc_buy.jpg',this)"
				onclick="return slnCheckSubmit('next');"
				src="<!--{$smarty.const.ROOT_URLPATH}-->plugin/plugin/SLNCore/btn_bloc_buy.jpg"
				alt="購入" name="next" id="next" border="0" /> <!--{else}--> <input
				type="image" onmouseover="chgImgImageSubmit('<!--{$smarty.const.ROOT_URLPATH}-->plugin/SLNCore/btn_bloc_buy_on.jpg',this)"
				onmouseout="chgImgImageSubmit('<!--{$smarty.const.ROOT_URLPATH}-->plugin/SLNCore/btn_bloc_buy.jpg',this)"
				onclick="return slnCheckSubmit('next');"
				src="<!--{$smarty.const.ROOT_URLPATH}-->plugin/SLNCore/btn_bloc_buy.jpg"
				alt="購入" name="next" id="next" border="0" /> <!--{/if}-->
			</li>
		</ul>
	</div>
	<!--{/if}-->
</div>