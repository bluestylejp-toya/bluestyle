<!--{if $isToke}-->
	<script type="text/javascript"
        src="<!--{$TokenJsUrl}-->?k_TokenNinsyoCode=<!--{$TokenNinsyoCode}-->"
        callBackFunc = "setToken"
        class = "spsvToken"></script>
<!--{/if}-->

<script type="text/javascript">

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
	
	function setToken(token, card) {
	
		if (token) {
			$("input[data-key='card_token']").val(token);
			fnModeSubmit('next','','');
		}
	}

	//<![CDATA[
	var isSubmitExec = true;

	function slnCheckSubmit(sub_mode) {
		<!--{if $isToke}-->
			if (sub_mode == "next") {
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
		
		
		$('#sln_form_body').toggle();
		$('#sln_form_loading').toggle();

		if(isSubmitExec) {
			isSubmitExec = false;
			
			<!--{if $isToke}-->
				if (sub_mode == "next") {
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
			
			fnModeSubmit(sub_mode,'','');
			return false;
		} else {
			alert("決済処理中です。しばらくお待ち下さい。");
			return false;
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
	});
	
	//]]>
</script>
<section id="sln_form_loading"
	style="<!--{if !$tpl_is_loding}-->display:none;<!--{/if}-->">
	<div class="information end">
		<p>決済処理中です。しばらくお待ち下さい。</p>
	</div>
</section>
<section id="sln_form_body" style="">
	<div class="information end">
		<p>
			下記項目にクレジットカード情報をご入力下さい。<br /> 「<span class="attention">※</span>」印は入力必須項目です。<br />
			入力後、画面下部の「購入」ボタンをクリックして下さい。
		</p>
		<!--{assign var=key_name value="payment"}-->
		<p class="attention">
			<!--{$arrErr[$key_name]}-->
		</p>
	</div>
	<h3 class="subtitle">
		<!--{$tpl_title|h}-->
		入力
	</h3>
	<dl class="form_entry">
		<dt>
			カード番号<span class="attention">※</span>
		</dt>
		<dd>
			<!--{assign var=key_name value="CardNo"}-->
			<!--{if $arrErr[$key_name]}-->
				<span class="attentionSt"> <!--{$arrErr[$key_name]}--></span>
            <!--{else}-->
            	<span id="card_no_error" class="attention"></span>
			<!--{/if}-->
			<input data-key="card_no" type="text" name="<!--{$key_name}-->"
				maxlength="<!--{$arrForm[$key_name].length}-->"
				style="ime-mode: disabled; <!--{$arrErr[$key_name]|sfGetErrorColor}-->"
				size="16" class="box120" />
			<p class="mini">
				<span class="attention">ハイフンは間に入れず、番号のみを入力してください。</span>
			</p>
		</dd>

		<dt>
			カード有効期限<span class="attention">※</span>
		</dt>
		<dd>
			<!--{assign var=key_name_m value="CardExpMonth"}-->
			<!--{assign var=key_name_y value="CardExpYear"}-->
			<!--{if $arrErr[$key_name_m]}-->
				<span class="attentionSt"><!--{$arrErr[$key_name_m]}--></span>
            <!--{else}-->
            	<span id="card_exp_month_error" class="attention"></span>
			<!--{/if}-->
			<!--{if $arrErr[$key_name_y]}-->
				<span class="attentionSt"> <!--{$arrErr[$key_name_y]}--></span>
            <!--{else}-->
            	<span id="card_exp_year_error" class="attention"></span>
			<!--{/if}-->
			<select data-key="card_exp_month" name="<!--{$key_name_m}-->" style=""
				class="boxShort data-role-none">
				<option value="">&minus;&minus;</option>
				<!--{html_options options=$arrMonth}-->
			</select>月 &nbsp;/&nbsp; 20<select data-key="card_exp_year" name="<!--{$key_name_y}-->" style=""
				class="boxShort data-role-none">
				<option value="">&minus;&minus;</option>
				<!--{html_options options=$arrYear}-->
			</select>年
		</dd>


		<!--{if in_array('KanaSei',$arrConfigs.attestation_assistance)}-->
		<dt>
			カード名義<span class="attention">※</span>
		</dt>
		<dd>
			<!--{assign var=key_name_s value="KanaSei"}-->
			<!--{assign var=key_name_m value="KanaMei"}-->
			<!--{if $arrErr[$key_name_s]}-->
				<span class="attentionSt"> <!--{$arrErr[$key_name_s]}--></span>
            <!--{else}-->
            	<span id="kana_sei_error" class="attention"></span>
			<!--{/if}-->
			<!--{if $arrErr[$key_name_m]}-->
				<span class="attentionSt"> <!--{$arrErr[$key_name_m]}--></span>
            <!--{else}-->
            	<span id="kana_mei_error" class="attention"></span>
			<!--{/if}-->
			姓:<input data-key="kana_sei" type="text" name="<!--{$key_name_s}-->"
				maxlength="<!--{$arrForm[$key_name_s].length}-->" style="" size="20"
				class="box120" /> &nbsp; 名:<input data-key="kana_mei" type="text"
				name="<!--{$key_name_m}-->"
				maxlength="<!--{$arrForm[$key_name_m].length}-->" style="" size="20"
				class="box120" />
			<p class="mini">
				<span class="attention">カードに記載の名前をご記入下さい。ご本人名義のカードをご使用下さい。</span><br />全角カナ文字入力（例：ヤマダ
				タロウ）
			</p>
		</dd>
		<!--{/if}-->


		<!--{if $arrConfigs.SecCd == '1'}-->
		<dt>
			セキュリティコード<span class="attention">※</span>
		</dt>
		<dd>
			<!--{assign var=key_name value="SecCd"}-->
			<!--{if $arrErr[$key_name]}-->
				<span class="attentionSt"> <!--{$arrErr[$key_name]}--></span>
            <!--{else}-->
            	<span id="sec_cd_error" class="attention"></span>
			<!--{/if}-->
			<input data-key="sec_cd" type="password" name="<!--{$key_name}-->"
				maxlength="<!--{$arrForm[$key_name].length}-->"
				style="ime-mode: disabled; <!--{$arrErr[$key_name]|sfGetErrorColor}-->"
				size="4" class="box60" />
			<p class="mini">
				<span class="attention">※カード裏面の署名欄(AMEXは除く）に記載されている末尾３桁～４桁の数字をご記入下さい。<br />※AMEXは表面にあります。(例:
					1234)
				</span><br />半角入力 (例: 123)
			</p>
		</dd>
		<!--{/if}-->

		<!--{if in_array('BirthDay',$arrConfigs.attestation_assistance)}-->
		<dt>
			生月日<span class="attention">※</span>
		</dt>
		<dd>
			<!--{assign var=key_name value="BirthDay"}-->
			<!--{if $arrErr[$key_name]}-->
				<span class="attentionSt"> <!--{$arrErr[$key_name]}--></span>
            <!--{else}-->
            	<span id="birth_day_error" class="attention"></span>
			<!--{/if}-->
			<input data-key="birth_day" type="text" name="<!--{$key_name}-->"
				maxlength="<!--{$arrForm[$key_name].length}-->"
				style="ime-mode: disabled; <!--{$arrErr[$key_name]|sfGetErrorColor}-->"
				size="4" class="box60" />
			<p class="mini">
				<span class="attention">※ご本人の誕生日の月日をご記入下さい(年は必要ありません)。</span>半角入力
				(例: 0430)
		</dd>
		<!--{/if}-->

		<!--{if in_array('TelNo',$arrConfigs.attestation_assistance)}-->
		<dt>
			電話番号(下4桁)<span class="attention">※</span>
		</dt>
		<dd>
			<!--{assign var=key_name value="TelNo"}-->
			<!--{if $arrErr[$key_name]}-->
				<span class="attentionSt"> <!--{$arrErr[$key_name]}--></span>
            <!--{else}-->
            	<span id="tel_no_error" class="attention"></span>
			<!--{/if}-->
			<input data-key="tel_no" type="text" name="<!--{$key_name}-->"
				maxlength="<!--{$arrForm[$key_name].length}-->"
				style="ime-mode: disabled; <!--{$arrErr[$key_name]|sfGetErrorColor}-->"
				size="4" class="box60" />
			<p class="mini">
				<span class="attention">※カード会社に登録していますご本人の電話番号下4桁をご記入下さい。</span>半角入力
				(例: 9876)
		</dd>
		<!--{/if}-->

		<dt>
			支払い方法<span class="attention">※</span>
		</dt>
		<dd>

			<!--{assign var=key_name value="PayType"}-->
			<!--{if $arrErr[$key_name]}-->
			<span class="attentionSt"> <!--{$arrErr[$key_name]}-->
			</span>
			<!--{/if}-->
			<select name="<!--{$key_name}-->" style="" class="data-role-none">
				<!--{html_options options=$arrPayMethod selected=$arrForm[$key_name].value|default:''}-->
			</select>
		</dd>
		<!--{if $paymentHash.regist_credit && $tpl_regist_card_form && $arrConfigs.member_regist == '1'}-->

		<dt>カード情報登録</dt>
		<dd>
			<!--{assign var=key_name value="register_card"}-->
			<!--{if $arrErr[$key_name]}-->
			<span class="attentionSt"> <!--{$arrErr[$key_name]}-->
			</span>
			<!--{/if}-->

			<!--{if !$tpl_pg_regist_card_force}-->
			<input type="checkbox" class="data-role-none radio_btn "
				name="<!--{$key_name}-->" value="1"
			<!--{if $arrForm[$key_name].value != ""}-->
			checked
			<!--{/if}-->
			> <label for="<!--{$key_name}-->"><span class="fb">このカードを登録する。</span>
			</label>
			<!--{else}-->
			<input type="hidden" name="<!--{$key_name}-->" value="1" />
			自動でカード登録します。
			<!--{/if}-->


			<p class="mini">
				カード情報を登録すると次回より入力無しで購入出来ます。<br />カード情報は当店では保管いたしません。<br />決済代行会社のサービスを利用して安全に保管されます。
			</p>
		</dd>
		<!--{/if}-->
        <input type="hidden" name="Token" data-key="card_token" value="" />
	</dl>

	<div class="btn_area">
		<ul class="btn_btm">
			<li><a rel="external"
				href="javascript:void(slnCheckSubmit('next'));" class="btn" />購入</a></li>
			<!--{if !$tpl_btn_next}-->
			<li><a rel="external"
				href="javascript:void(slnCheckSubmit('return'));" class="btn_back" />戻る</a>
			</li>
			<!--{/if}-->
		</ul>
	</div>
</section>
