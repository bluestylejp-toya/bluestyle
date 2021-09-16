<!--{strip}-->
<!--{if $tpl_is_loading}-->
<b>決済処理中です。</b>
<hr>
決済処理を完了するため
<br>
「購入」ボタンをクリックして下さい。
<br>
<font color="#FF0000">※通信状況などにより画面が切り替るまで少々時間がかかる場合があります。</font>
<br>
<br>
<div style="text-align:center;" align="center">
	<input type="submit" value="購入">
</div>
<!--{/if}-->

<!--{if !$tpl_is_loading}-->
<p>
	下記項目にご入力下さい。<br>
	「<font color="#FF0000">*</font>」印は入力必須項目です。<br>
	入力後、画面下部の「購入」ボタンをクリックして下さい。
</p>
<!--{assign var=key value="payment"}-->
<font color="#FF0000"> <!--{$arrErr[$key]}-->
</font>
<hr>
●カード番号
<font color="#FF0000">*</font>
<br>
<!--{assign var=key1 value="CardNo"}-->
<!--{if $arrErr[$key1]}-->
<font color="#FF0000"> <!--{$arrErr[$key1]}-->
</font>
<br>
<!--{/if}-->
<input type="text" name="<!--{$key1}-->" maxlength="<!--{$arrForm[$key1].length}-->" istyle="3" size="16">
<br>
<br>

●カード有効期限
<font color="#FF0000">*</font>
<br>
<!--{assign var=key1 value="CardExpMonth"}-->
<!--{assign var=key2 value="CardExpYear"}-->
<!--{if $arrErr[$key1]}-->
<font color="#FF0000"> <!--{$arrErr[$key1]}-->
</font>
<br>
<!--{/if}-->
<!--{if $arrErr[$key2]}-->
<font color="#FF0000"> <!--{$arrErr[$key2]}-->
</font>
<br>
<!--{/if}-->

<select name="<!--{$key1}-->">
<option value="">&minus;&minus;</option>
<!--{html_options options=$arrMonth}-->
</select>
月 &nbsp;/&nbsp; 20
<select name="<!--{$key2}-->" style="<!--{$arrErr[$key2]|sfGetErrorColor}-->">
<option value="">&minus;&minus;</option>
<!--{html_options options=$arrYear}-->
</select>
年
<br>
<br>
<!--{if in_array('KanaSei',$arrConfigs.attestation_assistance)}-->
●カード名義
<font color="#FF0000">*</font>
<br>
<!--{assign var=key1 value="KanaSei"}-->
<!--{assign var=key2 value="KanaMei"}-->
<!--{if $arrErr[$key1]}-->
<font color="#FF0000"> <!--{$arrErr[$key1]}-->
</font>
<br>
<!--{/if}-->
<!--{if $arrErr[$key2]}-->
<font color="#FF0000"> <!--{$arrErr[$key2]}-->
</font>
<br>
<!--{/if}-->

姓:
<input type="text" name="<!--{$key1}-->" maxlength="<!--{$arrForm[$key1].length}-->" istyle="3" size="20" value="">
<br>
名:
<input type="text" name="<!--{$key2}-->" maxlength="<!--{$arrForm[$key2].length}-->" istyle="3" size="20" value="">
<br>
<font color="#FF0000">カードに記載の名前をご記入下さい。ご本人名義のカードをご使用下さい。</font>
<br>
全角カナ文字入力（例：ヤマダ タロウ）
<br>
<br>
<!--{/if}-->

<!--{if $arrConfigs.SecCd == '1'}-->
●セキュリティコード
<font color="#FF0000">*</font>
<br>
<!--{assign var=key value="SecCd"}-->
<!--{if $arrErr[$key]}-->
<font color="#FF0000"> <!--{$arrErr[$key]}-->
</font>
<br>
<!--{/if}-->
<input type="text" name="<!--{$key}-->" maxlength="<!--{$arrForm[$key].length}-->" istyle="3" size="4" value="">
<br>
半角入力 (例: 123)
<br>
<font color="#FF0000">※カード裏面の署名欄に記載されている末尾３桁～４桁の数字をご記入下さい。<br>
※AMEXは表面にあります。(例: 1234)</font>
<br>
<br>
<!--{/if}-->

<!--{if in_array('BirthDay',$arrConfigs.attestation_assistance)}-->
●生月日
<font color="#FF0000">*</font>
<br>
<!--{assign var=key value="BirthDay"}-->
<!--{if $arrErr[$key]}-->
<font color="#FF0000"> <!--{$arrErr[$key]}-->
</font>
<br>
<!--{/if}-->
<input type="text" name="<!--{$key}-->" maxlength="<!--{$arrForm[$key].length}-->" istyle="3" size="4" value="">
<br>
<font color="#FF0000">※ご本人の誕生日の月日をご記入下さい(年は必要ありません)。</font>
<br>
半角入力 (例: 0430)
<br>
<br>
<!--{/if}-->

<!--{if in_array('TelNo',$arrConfigs.attestation_assistance)}-->
●電話番号(下4桁)
<font color="#FF0000">*</font>
<br>
<!--{assign var=key value="TelNo"}-->
<!--{if $arrErr[$key1]}-->
<font color="#FF0000"> <!--{$arrErr[$key1]}-->
</font>
<br>
<!--{/if}-->
<input type="text" name="<!--{$key}-->" maxlength="<!--{$arrForm[$key].length}-->" istyle="3" size="4" value="">
<br>
<font color="#FF0000">※カード会社に登録していますご本人の電話番号下4桁をご記入下さい。</font>
<br>
半角入力 (例: 9876)
<br>
<br>
<!--{/if}-->

●支払い方法
<font color="#FF0000">*</font>
<br>
<!--{assign var=key value="PayType"}-->
<!--{if $arrErr[$key]}-->
<font color="#FF0000"> <!--{$arrErr[$key]}-->
</font>
<br>
<!--{/if}-->
<select name="<!--{$key}-->">
<!--{html_options options=$arrPayMethod}-->
</select>
<br>
<br>
<!--{if $paymentHash.regist_credit && $tpl_regist_card_form && $arrConfigs.member_regist == '1'}-->
●カード情報登録
<br>
<!--{assign var=key value="register_card"}-->
<!--{if $arrErr[$key]}-->
<font color="#FF0000"> <!--{$arrErr[$key]}-->
</font>
<br>
<!--{/if}-->
<!--{if !$tpl_pg_regist_card_force}-->
<input type="checkbox" name="<!--{$key}-->" value="1" <!--{if $arrForm[$key].value != ""}-->checked<!--{/if}-->> このカードを登録する。
<!--{else}-->
<input type="hidden" name="<!--{$key}-->" value="1" />
自動でカード登録します。
<!--{/if}-->
<br>
カード情報を登録すると次回より入力無しで購入出来ます。
<br>
カード情報は当店では保管いたしません。
<br>
決済代行会社のサービスを利用して安全に保管されます。
<br>
<br>
<!--{/if}-->


以上の内容で間違いなければ、下記「購入」ボタンをクリックして下さい。
<br>
<font color="#FF0000">※通信状況などにより画面が切り替るまで少々時間がかかる場合があります。</font>

<div style="text-align:center;" align="center">
	<input type="submit" value="購入">
</div>

<!--{/if}-->
</form>


<form action="?mode=return" method="get">
	<input type="hidden" name="mode" value="return">
	<div style="text-align:center;" align="center">
		<input type="submit" value="戻る">
	</div>
</form>
<!--{/strip}-->

