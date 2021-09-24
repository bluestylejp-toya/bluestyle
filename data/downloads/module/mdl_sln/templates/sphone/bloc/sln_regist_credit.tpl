<script type="text/javascript">//<![CDATA[
function slnCheckSubmit(sub_mode) {
    $('#sln_form_body').toggle();
    $('#sln_form_loading').toggle();
    fnModeSubmit(sub_mode,'','');
    return false;
}
$(function() {
    <!--{$tpl_payment_onload}-->
});

//]]>
</script>
<section id="sln_form_loading"
	style="<!--{if !$tpl_is_loding}-->display:none;<!--{/if}-->">
	<div class="end information">
		<p>決済処理中です。しばらくお待ち下さい。</p>
	</div>
</section>

<!--{assign var=key_name value="payment"}-->
<!--{if $arrErr[$key_name] != ""}-->
<section id="sln_form_body"
	style="<!--{if $tpl_is_loding}-->display:none;<!--{/if}-->">
	<div class="end information">
		<p>
			決済エラー<br /> 申し訳ありませんがエラーの内容をご確認のうえ、お手続きをやりなおして下さい。
		</p>
		<!--{assign var=key_name_p value="payment"}-->
		<!--{assign var=key_name_c value="CardSeq"}-->
		<p class="attention">
			<!--{$arrErr[$key_name_p]}-->
		</p>
	</div>

	<div class="btn_area">
		<ul class="btn_btm">
			<li><a rel="external"
				href="javascript:void(slnCheckSubmit('return'));" class="btn_back" />戻る</a>
			</li>
		</ul>
	</div>
</section>

<!--{else}-->

<section id="sln_form_body"
	style="<!--{if $tpl_is_loding}-->display:none;<!--{/if}-->">
	<div class="end information">
		<p>
			「<span class="attention">※</span>」印は入力必須項目です。<br />
			入力後、一番下の「購入」ボタンをクリックして下さい。
		</p>
		<!--{assign var=key_name_p value="payment"}-->
		<!--{assign var=key_name_c value="CardSeq"}-->
		<p class="attention">
			<!--{$arrErr[$key_name_p]}-->
		</p>
		<p class="attention">
			<!--{$arrErr[$key_name_c]}-->
		</p>
	</div>
	<h3 class="subtitle">お支払い方法</h3>
	<dl class="form_entry" title="支払回数選択">
		<dt>
			支払い回数<span class="attention">※</span>
		</dt>
		<dd>
			<!--{assign var=key_name value="PayType"}-->
			<!--{if $arrErr[$key_name]}-->
			<span class="attention"> <!--{$arrErr[$key_name]}-->
			</span>
			<!--{/if}-->
			<select name="<!--{$key_name}-->"
				style="<!--{$arrErr[$key_name]|sfGetErrorColor}-->"
				class="data-role-none">
				<!--{html_options options=$arrPayMethod selected=$arrForm[$key_name].value|default:''}-->
			</select>
		</dd>
	</dl>

	<div class="information" style="border: 1px solid #CCCCCC; padding: 0.5em;">
		<p>以上の内容で間違いなければ、「購入」ボタンをクリックして下さい。<br />
		<span class="attention">※通信状況などにより画面が切り替るまで少々時間がかかる場合があります。</span>
		</p>
	</div>

	<div class="btn_area">
		<ul class="btn_btm">

			<li>
				<!--{if $tpl_btn_next}--> <a rel="external"
				href="javascript:void(slnCheckSubmit('next'));" class="btn" />購入</a>
				<!--{else}--> <a rel="external"
				href="javascript:void(slnCheckSubmit('next'));" class="btn" />ご注文完了ページへ</a>
				<!--{/if}-->
			</li>

			<!--{if !$tpl_btn_next}-->
			<li><a rel="external"
				href="javascript:void(slnCheckSubmit('return'));" class="btn_back" />戻る</a>
			</li>
			<!--{/if}-->
		</ul>
	</div>
</section>
<!--{/if}-->

