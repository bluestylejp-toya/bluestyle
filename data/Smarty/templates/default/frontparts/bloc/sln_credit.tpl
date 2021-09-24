<!--{if $isToke}-->
	<script type="text/javascript"
        src="<!--{$TokenJsUrl}-->?k_TokenNinsyoCode=<!--{$TokenNinsyoCode}-->"
        callBackFunc = "setToken"
        class = "spsvToken"></script>
<!--{/if}-->

<script type="text/javascript">//<![CDATA[
var isSubmitExec = true;

function checkCardNo() {
	cardNo = $("input[data-key='card_no']").val();
	$("#card_no_error").html("");
	$("input[data-key='card_no']").css("border-color","#C4CCCE");

	if ($("input[data-key='card_no']").length) {
		if (!cardNo) {
			$("#card_no_error").html("※カード番号を入力してください<br/>")
			$("input[data-key='card_no']").css("border-color","red");
			return false;
		} else if (isNaN(cardNo)) {
			$("#card_no_error").html("※ハイフンは間に入れず、番号のみを入力してください<br/>");
			$("input[data-key='card_no']").css("border-color","red");
			return false;
		} else if (cardNo.length > 16 || cardNo.length < 14) {
			$("#card_no_error").html("※正しいカードを入力してください<br/>");
			$("input[data-key='card_no']").css("border-color","red");
			return false;
		}
	}

	return true;
}

function checkCardExp() {

	reData = true

	cardExpMonth = $("select[data-key='card_exp_month']").val();
	cardExpYear = $("select[data-key='card_exp_year']").val();

	$("#card_exp_month_error").html("");
	$("#card_exp_year_error").html("");
	$("select[data-key='card_exp_month']").css("border-color","#C4CCCE");
	$("select[data-key='card_exp_year']").css("border-color","#C4CCCE");

	if ($("select[data-key='card_exp_month']").length) {
		if (!cardExpMonth) {
			$("#card_exp_month_error").html("※カード有効期限月を入力してください<br/>");
			$("select[data-key='card_exp_month']").css("border-color","red");
			reData = false
		}
	}

	if ($("select[data-key='card_exp_year']").length) {
		if (!cardExpYear) {
			$("#card_exp_year_error").html("※カード有効期限年を入力してください<br/>");
			$("select[data-key='card_exp_year']").css("border-color","red");
			reData = false
		}
	}

	return reData;
}

function checkKana() {

	reData = true

	kanaSei = $("input[data-key='kana_sei']").val();
	kanaMei = $("input[data-key='kana_mei']").val();

	$("#kana_sei_error").html("");
	$("#kana_mei_error").html("");
	$("input[data-key='kana_sei']").css("border-color","#C4CCCE");
	$("input[data-key='kana_mei']").css("border-color","#C4CCCE");

	if ($("input[data-key='kana_sei']").length) {
		if (!kanaSei) {
			$("#kana_sei_error").html("※カード名義姓を入力してください<br/>");
			$("input[data-key='kana_sei']").css("border-color","red");
			reData = false
		} else if (!kanaSei.match(/^[\u30A0-\u30FF]+$/)) {
			$("#kana_sei_error").html("※カード名義姓をカタカナを入力してください<br/>");
			$("input[data-key='kana_sei']").css("border-color","red");
			reData = false
		}
	}

	if ($("input[data-key='kana_mei']").length) {
		if (!kanaMei) {
			$("#kana_mei_error").html("※カード名義名を入力してください<br/>");
			$("input[data-key='kana_mei']").css("border-color","red");
			reData = false
		} else if (!kanaMei.match(/^[\u30A0-\u30FF]+$/)) {
			$("#kana_mei_error").html("※カード名義名をカタカナを入力してください<br/>");
			$("input[data-key='kana_mei']").css("border-color","red");
			reData = false
		}
	}

	return reData
}

function checkSecCd() {
	secCd = $("input[data-key='sec_cd']").val();

	$("#sec_cd_error").html("");
	$("input[data-key='sec_cd']").css("border-color","#C4CCCE");

	if ($("input[data-key='sec_cd']").length) {
		if (!secCd) {
			$("#sec_cd_error").html("※セキュリティコードを入力してください<br/>");
			$("input[data-key='sec_cd']").css("border-color","red");
			return false;
		} else if (isNaN(secCd)) {
			$("#sec_cd_error").html("※セキュリティコードは数字のみを入力してください<br/>");
			$("input[data-key='sec_cd']").css("border-color","red");
			return false;
		} else if (secCd.length < 3) {
			$("#sec_cd_error").html("※セキュリティコードは3文字以上数字を入力してください<br/>");
			$("input[data-key='sec_cd']").css("border-color","red");
			return false;
		}
	}

	return true;
}

function checkBirthDay() {
	birthDay = $("input[data-key='birth_day']").val();

	$("#birth_day_error").html("");
	$("input[data-key='birth_day']").css("border-color","#C4CCCE");

	if ($("input[data-key='birth_day']").length) {
		if (!birthDay) {
			$("#birth_day_error").html("※生月日を入力してください<br/>");
			$("input[data-key='birth_day']").css("border-color","red");
			return false;
		} else if (isNaN(birthDay)) {
			$("#birth_day_error").html("※生月日は数字のみを入力してください<br/>");
			$("input[data-key='birth_day']").css("border-color","red");
			return false;
		} else if (birthDay.length != 4) {
			$("#birth_day_error").html("※生月日は4文字を入力してください<br/>");
			$("input[data-key='birth_day']").css("border-color","red");
			return false;
		}
	}

	return true;
}

function checkTelNo() {
	telNo = $("input[data-key='tel_no']").val();

	$("#tel_no_error").html("");
	$("input[data-key='tel_no']").css("border-color","#C4CCCE");

	if ($("input[data-key='tel_no']").length) {
		if (!telNo) {
			$("#tel_no_error").html("※電話番号を入力してください<br/>");
			$("input[data-key='tel_no']").css("border-color","red");
			return false;
		} else if (isNaN(telNo)) {
			$("#tel_no_error").html("※電話番号は数字のみを入力してください<br/>");
			$("input[data-key='tel_no']").css("border-color","red");
			return false;
		} else if (telNo.length != 4) {
			$("#tel_no_error").html("※電話番号は下4桁をご記入下さい<br/>");
			$("input[data-key='tel_no']").css("border-color","red");
			return false;
		}
	}

	return true;
}

function setToken(token, card) {

	if (token) {
		$("input[data-key='card_token']").val(token);
		fnModeSubmit('next','','');
	}
}

function slnCheckSubmit(mode) {
	
	<!--{if $isToke}-->
	if (mode == "next") {
		cardNo = $("input[data-key='card_no']").val();
        cardExpMonth = $("select[data-key='card_exp_month']").val();
        cardExpYear = $("select[data-key='card_exp_year']").val();
        kanaSei = $("input[data-key='kana_sei']").val();
        kanaMei = $("input[data-key='kana_mei']").val();
        secCd = $("input[data-key='sec_cd']").val();
        birthDay = $("input[data-key='birth_day']").val();
        telNo = $("input[data-key='tel_no']").val();

        isSub = true;
        isSub = checkCardNo()
        if (isSub) {
            isSub = checkCardExp()
        } else {
            checkCardExp()
        }

        if (isSub) {
            isSub = checkKana()
        } else {
            checkKana()
        }

        if (isSub) {
            isSub = checkSecCd()
        } else {
            checkSecCd()
        }

        if (isSub) {
            isSub = checkBirthDay()
        } else {
            checkBirthDay()
        }

        if (isSub) {
            isSub = checkTelNo()
        } else {
            checkTelNo()
        }

        if (!isSub) {
            alert("入力項目を再度ご確認ください");
            return false;
        }
	}
		
	<!--{/if}-->

	$('#sln_form_body').slideToggle();
    if (mode == 'return') {
    	$('#sln_form_loading_return').slideToggle();
    } else {
    	$('#sln_form_loading').slideToggle();
    }

    if(isSubmitExec) {
		isSubmitExec = false;
		
		<!--{if $isToke}-->
			if (mode == "next") {
				$("input[data-key='card_no']").val('');
				$("select[data-key='card_exp_month']").val('');
				$("select[data-key='card_exp_year']").val('');
				$("input[data-key='kana_sei']").val('');
				$("input[data-key='kana_mei']").val('');
				$("input[data-key='sec_cd']").val('');
				$("input[data-key='birth_day']").val('');
				$("input[data-key='tel_no']").val('');
		
				if (birthDay) {
					birthDay1 = birthDay.substr(0, 2);
					birthDay2 = birthDay.substr(2, 2);
				} else {
					birthDay1 = null;
					birthDay2 = null;
				}
				
				try {
					//token取る処理
					SpsvApi.spsvCreateToken(cardNo, cardExpYear, cardExpMonth, secCd, birthDay1, birthDay2, telNo, kanaSei, kanaMei);
				} catch(err) {
					alert("現在決済通信障害が発生しております。後ほどお試しください。" + err);
					window.location.href = "<!--{$smarty.const.HTTPS_URL}-->";
				}
				return false;
			}
		<!--{/if}-->
		
        fnModeSubmit(mode,'','');
        return false;
    } else {
       	alert("決済処理中です。しばらくお待ち下さい。");
        return false;
    }
}

$(function() {
            <!--{$tpl_payment_onload}-->
			
		$("input[data-key='card_no']").blur(function(){
            checkCardNo();
        });

        $("select[data-key='card_exp_month']").blur(function(){
            checkCardExp();
        });

        $("select[data-key='card_exp_year']").blur(function(){
            checkCardExp();
        });

        $("input[data-key='kana_sei']").blur(function(){
            checkKana();
        });

        $("input[data-key='kana_mei']").blur(function(){
            checkKana();
        });

        $("input[data-key='sec_cd']").blur(function(){
            checkSecCd();
        });

        $("input[data-key='birth_day']").blur(function(){
            checkBirthDay();
        });

        $("input[data-key='tel_no']").blur(function(){
            checkTelNo();
        });
});
//]]>
</script>
<div id="sln_form_loading"
	style="<!--{if !$tpl_is_loding}-->display:none;<!--{/if}-->">
	<div class="information">
		<p>決済処理中です。しばらくお待ち下さい。</p>
	</div>
</div>
<div id="sln_form_loading_return"
	style="<!--{if !$tpl_is_loding}-->display:none;<!--{/if}-->">
	<div class="information">
		<p>しばらくお待ち下さい。</p>
	</div>
</div>
<div id="sln_form_body"
	style="<!--{if $tpl_is_loding}-->display:none;<!--{/if}-->">
	<div class="information">
		<p>
			下記項目にクレジットカード情報をご入力下さい。<br />
			「<span class="attention">※</span>」印は入力必須項目です。<br />
			入力後、画面下部の「購入」ボタンをクリックして下さい。
		</p>
		<!--{assign var=key value="payment"}-->
		<p class="attention">
			<!--{$arrErr[$key]}-->
		</p>
	</div>
	<table summary="クレジットカード入力">
		<tr>
			<th class="alignR" style="width: 20%;">カード番号<span class="attention">※</span>
			</th>
			<td style="width: 80%;">
				<!--{assign var=key1 value="CardNo"}-->
                <!--{if $arrErr[$key1]}-->
                	<span class="attentionSt"> <!--{$arrErr[$key1]}--></span>
                <!--{else}-->
                	<span id="card_no_error" class="attention"></span>
                <!--{/if}-->
                <input data-key="card_no" type="text" name="<!--{$key1}-->"
				value="" maxlength="<!--{$arrForm[$key1].length}-->"
				style="ime-mode: disabled; <!--{$arrErr[$key1]|sfGetErrorColor}-->"
				size="16" class="box150" />
				<p class="mini">
					<span class="attention">ハイフンは間に入れず、番号のみを入力してください。</span>
				</p>
			</td>
		</tr>
		<tr>
			<th class="alignR">カード有効期限<span class="attention">※</span>
			</th>
			<td>
				<!--{assign var=key_exp_m value="CardExpMonth"}-->
                <!--{assign var=key_exp_y value="CardExpYear"}-->
				<!--{if $arrErr[$key_exp_m]}-->
                	<span class="attentionSt"><!--{$arrErr[$key_exp_m]}--></span>
                <!--{else}-->
                	<span id="card_exp_month_error" class="attention"></span>
                <!--{/if}-->
                <!--{if $arrErr[$key_exp_y]}-->
                	<span class="attentionSt"><!--{$arrErr[$key_exp_y]}--></span>
                <!--{else}-->
                	<span id="card_exp_year_error" class="attention"></span>
                <!--{/if}-->
                <select data-key="card_exp_month" name="<!--{$key_exp_m}-->"
				style="<!--{$arrErr[$key_exp_m]|sfGetErrorColor}-->">
					<option value="">&#45;&#45;</option>
					<!--{html_options options=$arrMonth}-->
			</select>月 &nbsp;/&nbsp; 20<select data-key="card_exp_year" name="<!--{$key_exp_y}-->"
				style="<!--{$arrErr[$key_exp_y]|sfGetErrorColor}-->">
					<option value="">&#45;&#45;</option>
					<!--{html_options options=$arrYear}-->
			</select>年
			</td>
		</tr>

		<!--{if in_array('KanaSei',$arrConfigs.attestation_assistance)}-->
		<tr>
			<th class="alignR">カード名義<span class="attention">※</span>
			</th>
			<td>
				<!--{assign var=key1 value="KanaSei"}-->
                <!--{assign var=key2 value="KanaMei"}-->
				<!--{if $arrErr[$key1]}-->
                	<span class="attentionSt"><!--{$arrErr[$key1]}--></span>
                <!--{else}-->
                	<span id="kana_sei_error" class="attention"></span>	
                <!--{/if}-->
                <!--{if $arrErr[$key2]}-->
                	<span class="attentionSt"><!--{$arrErr[$key2]}--></span>
                <!--{else}-->
                	<span id="kana_mei_error" class="attention"></span>
                <!--{/if}-->
				姓:<input type="text" data-key="kana_sei" name="<!--{$key1}-->"
				maxlength="<!--{$arrForm[$key1].length}-->"
				style="<!--{$arrErr[$key1]|sfGetErrorColor}-->" size="20"
				class="box120" /> &nbsp; 名:<input type="text" data-key="kana_mei" name="<!--{$key2}-->"
				maxlength="<!--{$arrForm[$key2].length}-->"
				style="<!--{$arrErr[$key2]|sfGetErrorColor}-->" size="20"
				class="box120" />&nbsp;全角カナ文字入力（例：ヤマダ タロウ）
				<p class="mini">
					<span class="attention">ご本人名義のカードをご使用下さい。</span>
				</p>
			</td>
		</tr>
		<!--{/if}-->

		<!--{if $arrConfigs.SecCd == '1'}-->
		<tr>
			<th class="alignR">セキュリティコード<span class="attention">※</span>
			</th>
			<td>
				<!--{assign var=key value="SecCd"}-->
                <!--{if $arrErr[$key]}-->
                	<span class="attentionSt"> <!--{$arrErr[$key]}--></span>
                <!--{else}-->
                	<span id="sec_cd_error" class="attention"></span>
                <!--{/if}-->
                <input type="password" data-key="sec_cd" name="<!--{$key}-->"
				maxlength="<!--{$arrForm[$key].length}-->"
				style="ime-mode: disabled; <!--{$arrErr[$key]|sfGetErrorColor}-->"
				size="4" class="box60" />&nbsp半角入力 (例: 123)
				<p class="mini">
					<span class="attention">※カード裏面の署名欄(AMEXは除く）に記載されている末尾３桁～４桁の数字をご記入下さい。<br />※AMEXは表面にあります。(例: 1234)</span>
					<br /> <img
						src="<!--{$smarty.const.PLUGIN_HTML_URLPATH}-->SLNCore/security_code.jpg"
						alt="セキュリティコード" width="410">
				</p>
			</td>
		</tr>
		<!--{/if}-->

		<!--{if in_array('BirthDay',$arrConfigs.attestation_assistance)}-->
		<tr>
			<th class="alignR">生月日<span class="attention">※</span>
			</th>
			<td>
				<!--{assign var=key value="BirthDay"}-->
                <!--{if $arrErr[$key]}-->
                	<span class="attentionSt"><!--{$arrErr[$key]}--></span>
                <!--{else}-->
                	<span id="birth_day_error" class="attention"></span>
                <!--{/if}-->
                <input type="text" data-key="birth_day" name="<!--{$key}-->"
				maxlength="<!--{$arrForm[$key].length}-->"
				style="ime-mode: disabled; <!--{$arrErr[$key]|sfGetErrorColor}-->"
				size="4" class="box60" />&nbsp半角入力 (例: 0430)
				<p class="mini">
					<span class="attention">※ご本人の誕生日の月日をご記入下さい(年は必要ありません)。</span>

			</td>
		</tr>
		<!--{/if}-->

		<!--{if in_array('TelNo',$arrConfigs.attestation_assistance)}-->
		<tr>
			<th class="alignR">電話番号(下4桁)<span class="attention">※</span>
			</th>
			<td>
				<!--{assign var=key value="TelNo"}-->
                <!--{if $arrErr[$key]}-->
                    <span class="attentionSt"><!--{$arrErr[$key]}--></span>
                <!--{else}-->
                	<span id="tel_no_error" class="attention"></span>
                <!--{/if}-->
                <input type="text" data-key="tel_no" name="<!--{$key}-->"
				maxlength="<!--{$arrForm[$key].length}-->"
				style="ime-mode: disabled; <!--{$arrErr[$key]|sfGetErrorColor}-->"
				size="4" class="box60" />&nbsp半角入力 (例: 9876)
				<p class="mini">
					<span class="attention">※カード会社に登録していますご本人の電話番号下4桁をご記入下さい。</span>

			</td>
		</tr>
		<!--{/if}-->

		<tr>
			<th class="alignR">支払い方法<span class="attention">※</span>
			</th>
			<td>
				<!--{assign var=key1 value="PayType"}-->
                <!--{if $arrErr[$key1]}-->
					<span class="attentionSt"><!--{$arrErr[$key1]}--></span>
                <!--{/if}--> 
                <select name="<!--{$key1}-->"
				style="<!--{$arrErr[$key1]|sfGetErrorColor}-->">
					<!--{html_options options=$arrPayMethod selected=$arrForm[$key1].value|escape}-->
			</select>
			</td>
		</tr>
		<!--{if $paymentHash.regist_credit && $tpl_regist_card_form && $arrConfigs.member_regist == '1'}-->
		<tr>
			<th class="alignR">カード情報登録</th>
			<td>
				<!--{assign var=key_regist value="register_card"}--> <!--{if $arrErr[$key_regist]}-->
				<span class="attentionSt"> <!--{$arrErr[$key_regist]}-->
			</span> <!--{/if}--> <!--{if !$tpl_pg_regist_card_force}--> <input
				type="checkbox" name="<!--{$key_regist}-->" value="1"
			<!--{if $arrForm[$key_regist].value != ""}-->checked<!--{/if}--> > <label
				for="<!--{$key_regist}-->">このカードを登録する。</label> <!--{else}--> <input
				type="hidden" name="<!--{$key_regist}-->" value="1" /> 自動でカード登録します。
				<!--{/if}-->
				<p class="mini">
					カード情報を登録すると次回より入力無しで購入出来ます。<br />カード情報は当店では保管いたしません。<br />決済代行会社のサービスを利用して安全に保管されます。
				</p>
			</td>
		</tr>
		<!--{/if}-->
        <input type="hidden" name="Token" data-key="card_token" value="" />
	</table>

	<div class="information" style="border: 1px solid #CCCCCC; padding: 0.5em;">
		<p>以上の内容で間違いなければ、下記「購入」ボタンをクリックして下さい。<br />
		<span class="attention">※通信状況などにより画面が切り替るまで少々時間がかかる場合があります。</span>
		</p>
	</div>

	<div class="btn_area">
		<ul>
			<!--{if !$tpl_btn_next}-->
			<li><input type="image" onmouseover="chgImg('<!--{$TPL_URLPATH}-->img/button/btn_back_on.jpg',this)"
				onmouseout="chgImg('<!--{$TPL_URLPATH}-->img/button/btn_back.jpg',this)"
				onclick="return slnCheckSubmit('return');"
				src="<!--{$TPL_URLPATH}-->img/button/btn_back.jpg" alt="戻る"
				name="back" id="back" border="0" />
			</li>
			<!--{/if}-->
			<li>
            	<!--{if $isToke}-->
                	<img onmouseover="chgImgImageSubmit('<!--{$smarty.const.ROOT_URLPATH}-->plugin/SLNCore/btn_bloc_buy_on.jpg',this)" onmouseout="chgImgImageSubmit('<!--{$smarty.const.ROOT_URLPATH}-->plugin/SLNCore/btn_bloc_buy.jpg',this)" onclick="return slnCheckSubmit('next');" src="<!--{$smarty.const.ROOT_URLPATH}-->plugin/SLNCore/btn_bloc_buy.jpg" alt="購入" name="next" id="next" border="0" />
                <!--{else}-->
            		<input type="image" onmouseover="chgImgImageSubmit('<!--{$smarty.const.ROOT_URLPATH}-->plugin/SLNCore/btn_bloc_buy_on.jpg',this)" onmouseout="chgImgImageSubmit('<!--{$smarty.const.ROOT_URLPATH}-->plugin/SLNCore/btn_bloc_buy.jpg',this)" onclick="return slnCheckSubmit('next');" src="<!--{$smarty.const.ROOT_URLPATH}-->plugin/SLNCore/btn_bloc_buy.jpg" alt="購入" name="next" id="next" border="0" />
                <!--{/if}-->
			</li>
		</ul>
	</div>
</div>
