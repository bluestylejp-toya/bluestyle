<!--{if $isToke}-->
	<script type="text/javascript"
        src="<!--{$TokenJsUrl}-->?k_TokenNinsyoCode=<!--{$TokenNinsyoCode}-->"
        callBackFunc = "setToken"
        class = "spsvToken"></script>
<!--{/if}-->

<script type="text/javascript" language="javascript">

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
			return false
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

var form2Submit = false;

function setToken(token, card) {

	if (token) {
		$("input[data-key='card_token']").val(token);
		form2Submit = true;
		$("#form2").submit();
	}
}

$(function() {
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
	
	$("#form2").submit(function() {
		
		<!--{if !$isToke}-->
			return true;
		<!--{/if}-->
		
		if (form2Submit) {
			return true;
		}

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
		
		$('#form2').slideToggle();
		
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
	});
});

</script>

<div id="mypagecolumn">
	<h2 class="title"><!--{$tpl_title|h}--></h2>
	<!--{include file=$tpl_navi}-->
	<div id="mycontents_area">
		<h3>登録済クレジットカード情報</h3>
		<!--{if !$dataHash || $dataHash.KaiinStatus != 0}-->
		<p>登録されているクレジットカード情報はありません。</p>
		<!--{else}-->
		<!--{if $arrErr}-->
		<div class="information">
			<!--{assign var=key value="CardSeq"}-->
			<p class="attentionSt">
				<!--{$arrErr[$key]}-->
			</p>
			<!--{assign var=key value="error"}-->
			<p class="attentionSt">
				<!--{$arrErr[$key]}-->
			</p>
		</div>
		<!--{/if}-->
		<!--{if $success}-->
		<div class="information">
			<p class="attention">更新が完了しました。</p>
		</div>
		<!--{/if}-->

		<table summary="登録済クレジットカード情報">
			<tr>
				<th class="alignC" colspan="2" style="width: 100%;">登録済クレジットカード情報</th>
			</tr>
			<!--{assign var=key1 value="CardSeq"}-->
			<tr>
				<td  class="alignR" style="width: 20%;">カード番号</td><td><!--{$dataHash.CardNo|substr:0:4}-->*********<!--{$dataHash.CardNo|substr:-3}--></td>
			</tr>
			<tr>
				<td class="alignR" style="width: 20%;">有効期限</td><td><!--{$dataHash.CardExp|substr:0:2|h}-->年<!--{$dataHash.CardExp|substr:2:2|h}-->月</td>
			</tr>
				<!--{if $dataHash.HolderName != ''}--><tr><td class="alignR" style="width: 20%;">カード名義</td><td><!--{$dataHash.HolderName}--></td></tr>
				<!--{/if}-->
			</tr>
		</table>
		<!--{/if}-->

		<!--{if !$success}-->
		<h3>
			カード情報を
			<!--{if !$dataHash}-->
			新規
			<!--{else}-->
			更新
			<!--{/if}-->
			登録
		</h3>
		<form name="form2" id="form2" method="post" action="?" autocomplete="off">
			<input type="hidden"
				name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->"
				value="<!--{$transactionid}-->" /> <input type="hidden" name="mode"
				value="<!--{if !$dataHash}-->regist<!--{else}-->change<!--{/if}-->" />
			<div class="information">
				<p>
					下記項目にご入力下さい。「<span class="attention">※</span>」印は入力必須項目です。<br />
					入力後、一番下の「登録する」ボタンをクリックして下さい。
				</p>
				<!--{assign var=key value="error2"}-->
				<p class="attentionSt">
					<!--{$arrErr[$key]}-->
				</p>
			</div>

			<table summary="クレジットカード入力">
				<tr>
					<th class="alignR" style="width: 20%;">カード番号<span class="attention">※</span>
					</th>
					<td style="width: 80%;">
						<!--{assign var=key_CardNo value="CardNo"}-->
                        <!--{if $arrErr[$key_CardNo]}-->
							<span class="attentionSt"><!--{$arrErr[$key_CardNo]}--></span>
                        <!--{else}-->
                        	<span id="card_no_error" class="attention"></span>
						<!--{/if}-->
						<input data-key="card_no" type="text" name="<!--{$key_CardNo}-->" maxlength="<!--{$arrForm[$key_CardNo].length}-->" style="ime-mode: disabled; <!--{$arrErr[$key_CardNo]|sfGetErrorColor}-->" size="16" class="box150" />
					<p class="mini">
						<span class="attention">ハイフンは間に入れず、番号のみを入力してください。</span>
					</p>
					</td>
				</tr>
				<tr>
					<th class="alignR">カード有効期限<span class="attention">※</span>
					</th>
					<td>
						<!--{assign var=key_exp_m value="CardExpMonth"}--> <!--{assign var=key_exp_y value="CardExpYear"}-->
						<!--{if $arrErr[$key_exp_m]}-->
							<span class="attentionSt"><!--{$arrErr[$key_exp_m]}--></span>
						<!--{else}-->
                        	<span id="card_exp_month_error" class="attention"></span>
                        <!--{/if}-->
                        <!--{if $arrErr[$key_exp_y]}-->
                        	<span class="attention"><!--{$arrErr[$key_exp_y]}--></span>
						<!--{else}-->
                        	<span id="card_exp_year_error" class="attention"></span>
                        <!--{/if}-->
                        <select data-key="card_exp_month" name="<!--{$key_exp_m}-->"
						style="<!--{$arrErr[$key_exp_m]|sfGetErrorColor}-->">
							<option value="">&minus;&minus;</option>
							<!--{html_options options=$arrMonth}-->
					</select>月 &nbsp;/&nbsp; 20<select data-key="card_exp_year" name="<!--{$key_exp_y}-->"
						style="<!--{$arrErr[$key_exp_y]|sfGetErrorColor}-->">
							<option value="">&minus;&minus;</option>
							<!--{html_options options=$arrYear}-->
					</select>年
					</td>
				</tr>
				<!--{if in_array('KanaSei',$arrConfigs.attestation_assistance)}-->
				<tr>
					<th class="alignR">カード名義<span class="attention">※</span>
					</th>
					<td>
						<!--{assign var=key_sei value="KanaSei"}--> <!--{assign var=key_mei value="KanaMei"}-->
						<!--{if $arrErr[$key_sei]}-->
                        	<span class="attentionSt"><!--{$arrErr[$key_sei]}--></span>
						<!--{else}-->
                        	<span id="kana_sei_error" class="attention"></span>
                        <!--{/if}-->
                        <!--{if $arrErr[$key_mei]}-->
							<span class="attentionSt"><!--{$arrErr[$key_mei]}--></span>
                        <!--{else}-->
                        	<span id="kana_mei_error" class="attention"></span>
						<!--{/if}-->
                        姓:<input data-key="kana_sei" type="text" name="<!--{$key_sei}-->" maxlength="<!--{$arrForm[$key_sei].length}-->" style="<!--{$arrErr[$key_sei]|sfGetErrorColor}-->" size="20" class="box120" /> &nbsp;
					名:
					<input type="text" data-key="kana_mei" name="<!--{$key_mei}-->" maxlength="<!--{$arrForm[$key_mei].length}-->" style="<!--{$arrErr[$key_mei]|sfGetErrorColor}-->" size="20" class="box120" />
					&nbsp全角カナ文字入力（例：ヤマダ タロウ）
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
                        	<span class="attentionSt"><!--{$arrErr[$key]}--></span>
                        <!--{else}-->
                        	<span id="sec_cd_error" class="attention"></span>
                        <!--{/if}-->
                        <input data-key="sec_cd" type="password" name="<!--{$key}-->" maxlength="<!--{$arrForm[$key].length}-->" style="ime-mode: disabled; <!--{$arrErr[$key]|sfGetErrorColor}-->" size="4" class="box60" />&nbsp半角入力 (例: 123)
						<p class="mini">
							<span class="attention">※カード裏面の署名欄(AMEXは除く）に記載されている末尾３桁～４桁の数字をご記入下さい。<br />※AMEXは表面にあります。(例: 1234)</span>
							<br /> <img
								src="<!--{$smarty.const.PLUGIN_HTML_URLPATH}-->SLNCore/security_code.jpg"
								alt="セキュリティコード" width="410" />
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
                        <input data-key="birth_day" type="text" name="<!--{$key}-->" maxlength="<!--{$arrForm[$key].length}-->" style="ime-mode: disabled; <!--{$arrErr[$key]|sfGetErrorColor}-->" size="4" class="box60" />&nbsp半角入力 (例: 0430)
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
                        <input data-key="tel_no" type="text" name="<!--{$key}-->" maxlength="<!--{$arrForm[$key].length}-->" style="ime-mode: disabled; <!--{$arrErr[$key]|sfGetErrorColor}-->" size="4" class="box60" />&nbsp半角入力 (例: 9876)
						<p class="mini">
							<span class="attention">※カード会社に登録していますご本人の電話番号下4桁をご記入下さい。</span>

					</td>
				</tr>
				<!--{/if}-->
			</table>
            <input type="hidden" name="Token" data-key="card_token" value="" />

			<!--{if $isToke}-->
            	</form>
                <div class="btn_area">
                    <ul>
                        <li><input type="submit" onclick="$('#form2').submit();" value="カード情報を登録" /></li>
                    </ul>
                </div>
            <!--{else}-->
                    <div class="btn_area">
                        <ul>
                            <li><input type="submit" value="カード情報を登録" /></li>
                        </ul>
                    </div>
                </form>
            <!--{/if}-->
		<!--{/if}-->
	</div>
</div>
