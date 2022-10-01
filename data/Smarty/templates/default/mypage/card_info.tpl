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
    <!--{if !$dataHash || $dataHash.KaiinStatus != 0}-->
    <!--{else}-->
<section style="margin-bottom: 40px">
    <header class="l-header__inner" style="margin-bottom: 40px">
        <a href="<!--{$smarty.const.TOP_URL}-->mypage/" aria-label="戻る" class="c-btn--header-nav"></a>
        <p class="c-header-title">登録しているクレジットカード</p>
    </header>
        <!--{if $arrErr}-->
            <div class="information">
                <!--{assign var=key value="CardSeq"}-->
                <p class="attention"><small><!--{$arrErr[$key]}--></small></p>
                <!--{assign var=key value="error"}-->
                <p class="attention"><small><!--{$arrErr[$key]}--></small></p>
            </div>
        <!--{/if}-->
        <!--{if $success}-->
            <div class="information">
                <p class="attention u-text--center">更新が完了しました。</p>
            </div>
        <!--{/if}-->
        <dl class="c-list--dl u-mb--4 card_comform">
            <!--{assign var=key1 value="CardSeq"}-->
            <dt>カード番号</dt>
            <dd><!--{$dataHash.CardNo|substr:0:4}-->*********<!--{$dataHash.CardNo|substr:-3}--></dd>
            <dt>有効期限</dt>
            <dd>20<!--{$dataHash.CardExp|substr:0:2|h}-->年/<!--{$dataHash.CardExp|substr:2:2|h}-->月</dd>
            <!--{if $dataHash.HolderName != ''}--><dt>カード名義</dt>
            <dd><!--{$dataHash.HolderName}--></dd><!--{/if}-->
        </dl>
</section>
    <!--{/if}-->
    <!--{if !$success}-->
<section>
    <form name="form2" id="form2" method="post" action="?" autocomplete="off">
    <header class="l-header__inner">
        <!--{if !$dataHash || $dataHash.KaiinStatus != 0}-->
        <a href="<!--{$smarty.const.TOP_URL}-->mypage/" aria-label="戻る" class="c-btn--header-nav"></a>
        <!--{/if}-->
        <h3 class="c-header-title">カード情報を<!--{if !$dataHash}-->新規登録<!--{else}-->更新<!--{/if}--></h3>
    </header>
    <p class="u-mb--4 u-text--center">クレジットカード情報を入力してください。</p>
    <div class="card_info">
        <p class="u-text--center">利用できるクレジットカード会社</p>
        <p class="u-text--center"><img src="<!--{$TPL_URLPATH}-->img/common/payment.png"></p>
    </div>
            <input type="hidden"
                name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->"
                value="<!--{$transactionid}-->" /> <input type="hidden" name="mode"
                value="<!--{if !$dataHash}-->regist<!--{else}-->change<!--{/if}-->" />
             <div class="information u-mb--4">
                <!--{assign var=key value="error2"}-->
                <p class="attention"><small><!--{$arrErr[$key]}--></small></p>
            </div>
            <dl class="c-list--dl u-mb--4">
                <dt>カード番号<span class="attention">※必須</span></dt>
                <dd>
                    <!--{assign var=key_CardNo value="CardNo"}-->
                    <!--{if $arrErr[$key_CardNo]}-->
                        <span class="attention"><!--{$arrErr[$key_CardNo]}--></span>
                    <!--{else}-->
                        <span id="card_no_error" class="attention"></span>
                    <!--{/if}-->
                    <input data-key="card_no" type="text" name="<!--{$key_CardNo}-->" maxlength="<!--{$arrForm[$key_CardNo].length}-->" style="ime-mode: disabled; <!--{$arrErr[$key_CardNo]|sfGetErrorColor}-->" class="box150 c-form-parts"  placeholder="xxxxxxxxxxxx"/>
                    <p class="mini">
                        <small class="attention">ハイフンは間に入れず、番号のみを入力してください。</small>
                    </p>
                </dd>
                <dt>有効期限<span class="attention">※必須</span></dt>
                <dd>
                    <!--{assign var=key_exp_m value="CardExpMonth"}--> <!--{assign var=key_exp_y value="CardExpYear"}-->
                    <!--{if $arrErr[$key_exp_m]}-->
                        <span class="attention"><!--{$arrErr[$key_exp_m]}--></span>
                    <!--{else}-->
                        <span id="card_exp_month_error" class="attention"></span>
                    <!--{/if}-->
                    <!--{if $arrErr[$key_exp_y]}-->
                        <span class="attention"><!--{$arrErr[$key_exp_y]}--></span>
                    <!--{else}-->
                        <span id="card_exp_year_error" class="attention"></span>
                    <!--{/if}-->
                    <div class="c-form-parts--card">
                        <div class="c-form-parts--card__item">
                            <select data-key="card_exp_month" name="<!--{$key_exp_m}-->" style="<!--{$arrErr[$key_exp_m]|sfGetErrorColor}-->" class="styled-select">
                                <option value="">&minus;&minus;</option>
                                <!--{html_options options=$arrMonth}-->
                            </select>
                        </div>月/
                        <div class="c-form-parts--card__item">
                            <span>20</span>
                            <select data-key="card_exp_year" name="<!--{$key_exp_y}-->" style="<!--{$arrErr[$key_exp_y]|sfGetErrorColor}-->" class="styled-select">
                                <option value="">&minus;&minus;</option>
                                <!--{html_options options=$arrYear}-->
                            </select>
                        </div>年
                    </div>
                </dd>
                <!--{if in_array('KanaSei',$arrConfigs.attestation_assistance)}-->
                <dt>カード名義<span class="attention">※必須</span></dt>
                <dd>
                    <!--{assign var=key_sei value="KanaSei"}--> <!--{assign var=key_mei value="KanaMei"}-->
                    <!--{if $arrErr[$key_sei]}-->
                        <span class="attention"><!--{$arrErr[$key_sei]}--></span>
                    <!--{else}-->
                        <span id="kana_sei_error" class="attention"></span>
                    <!--{/if}-->
                    <!--{if $arrErr[$key_mei]}-->
                        <span class="attentionSt"><!--{$arrErr[$key_mei]}--></span>
                    <!--{else}-->
                        <span id="kana_mei_error" class="attention"></span>
                    <!--{/if}-->
                    <p class="u-mb--2">
                        姓:
                        <input data-key="kana_sei" type="text" name="<!--{$key_sei}-->" maxlength="<!--{$arrForm[$key_sei].length}-->" style="<!--{$arrErr[$key_sei]|sfGetErrorColor}-->" size="20" class="box150 c-form-parts"  placeholder="例：ヤマダ"/>
                    </p>
                    <p class="u-mb--2">
                        名:
                        <input type="text" data-key="kana_mei" name="<!--{$key_mei}-->" maxlength="<!--{$arrForm[$key_mei].length}-->" style="<!--{$arrErr[$key_mei]|sfGetErrorColor}-->" size="20" class="box120 c-form-parts"  placeholder="例：タロウ"/>
                    </p>
                    <p class="mini">
                        <small class="attention">ご本人名義のカードをご使用下さい。</small>
                    </p>
                </dd>
                <!--{/if}-->
                <!--{if $arrConfigs.SecCd == '1'}-->
                    <dt>セキュリティコード<span class="attention">※必須</span></dt>
                    <dd>
                        <!--{assign var=key value="SecCd"}-->
                        <!--{if $arrErr[$key]}-->
                            <span class="attention"><!--{$arrErr[$key]}--></span>
                        <!--{else}-->
                            <span id="sec_cd_error" class="attention"></span>
                        <!--{/if}-->
                        <input data-key="sec_cd" type="password" name="<!--{$key}-->" maxlength="<!--{$arrForm[$key].length}-->" style="ime-mode: disabled; <!--{$arrErr[$key]|sfGetErrorColor}-->" size="4" class="box60 c-form-parts--sm" placeholder="SVC">
                        <p class="mini u-mb--2">
                            <small class="attention">※カード裏面の署名欄(AMEXは除く）に記載されている末尾３桁～４桁の数字をご記入下さい。<br />※AMEXは表面にあります。(例: 1234)</small>
                        </p>
                        <img src="<!--{$smarty.const.PLUGIN_HTML_URLPATH}-->SLNCore/security_code.jpg" alt="セキュリティコード" width="410" />
                    </dd>
                <!--{/if}-->
                <!--{if in_array('BirthDay',$arrConfigs.attestation_assistance)}-->
                    <dt>生月日<span class="attention">※必須</span></dt>
                    <dd>
                        <!--{assign var=key value="BirthDay"}-->
                        <!--{if $arrErr[$key]}-->
                            <span class="attention"><!--{$arrErr[$key]}--></span>
                        <!--{else}-->
                            <span id="birth_day_error" class="attention"></span>
                        <!--{/if}-->
                        <input data-key="birth_day" type="text" name="<!--{$key}-->" maxlength="<!--{$arrForm[$key].length}-->" style="ime-mode: disabled; <!--{$arrErr[$key]|sfGetErrorColor}-->" class="box60 c-form-parts--sm" placeholder="例: 0430"/>
                        <p class="mini">
                        <span class="attention">※ご本人の誕生日の月日をご記入下さい(年は必要ありません)。</span>
                        </p>
                    </dd>
                <!--{/if}-->
                <!--{if in_array('TelNo',$arrConfigs.attestation_assistance)}-->
                    <dt>電話番号(下4桁)<span class="attention">※必須</span></dt>
                    <dd>
                        <!--{assign var=key value="TelNo"}-->
                        <!--{if $arrErr[$key]}-->
                            <span class="attention"><!--{$arrErr[$key]}--></span>
                        <!--{else}-->
                            <span id="tel_no_error" class="attention"></span>
                        <!--{/if}-->
                        <input data-key="tel_no" type="text" name="<!--{$key}-->" maxlength="<!--{$arrForm[$key].length}-->" style="ime-mode: disabled; <!--{$arrErr[$key]|sfGetErrorColor}-->" size="4" class="box60 c-form-parts--sm" placeholder="例: 9876"/>
                        <p class="mini">
                        <span class="attention">※カード会社に登録していますご本人の電話番号下4桁をご記入下さい。</span>
                        </p>
                    </dd>
                <!--{/if}-->
                <input type="hidden" name="Token" data-key="card_token" value="" />
            </dl>

         <!--{if $isToke}-->
            </form>
            <div class="btn_area" id="btn_area">
                <ul>
                    <li><input id="button" type="submit" onclick="$('#form2').submit();" value="カード情報を<!--{if !$dataHash}-->新規登録<!--{else}-->更新<!--{/if}-->" class="c-btn--primary"/></li>
                </ul>
            </div>
        <!--{else}-->
                <div class="btn_area" id="btn_area">
                    <ul>
                        <li><input id="button" type="submit" value="カード情報を登録"  class="c-btn--primary"/></li>
                    </ul>
                </div>
            </form>
        <!--{/if}-->
</section>
    <!--{/if}-->
<style>
    .c-btn--primary {
        text-align: center;
    }
</style>
<script>
    document.addEventListener("DOMContentLoaded",function () {
        // イベントリスナーを設定した要素を指定する
        let btn = document.getElementById('button')


        let insertHtml=`
    <!-- loading -->
        <div id="loading" class="is-hide">
        <div class="cv-spinner">
        <span class="spinner"></span>
        </div>
        </div>
            <!-- loading -->
        `
    let insertCSS=`
        <style>
        #loading{
        position: fixed;
        top: 0;
        left: 0;
        z-index: 999;
        width: 100%;
        height:100%;
        background: rgba(0,0,0,0.6);
        }
        #loading .cv-spinner {
        height: 100%;
        display: flex;
        justify-content: center;
        align-items: center;
        }
        #loading .spinner {
        width: 80px;
        height: 80px;
        border: 4px #ddd solid;
        border-top: 4px #999 solid;
        border-radius: 50%;
        animation: sp-anime 0.8s infinite linear;
        }
        @keyframes sp-anime {
        0% { transform: rotate(0deg); }
        100% { transform: rotate(359deg); }
        }
        #loading.is-hide{
        display:none;
        }
        </style>
        `


    document.getElementsByTagName('head')[0]
        .insertAdjacentHTML('beforeend', insertCSS);
    document.getElementsByTagName('body')[0]
        .insertAdjacentHTML('afterbegin', insertHtml);

    let loading = document.getElementById('loading')
        loading.addEventListener("click",function(){
        hideLoading()
    })

    btn.addEventListener("click",function(){
        showLoading()
    })
});

function showLoading(){
    document.getElementById('loading').classList.remove('is-hide')
}

function hideLoading(){
    document.getElementById('loading').classList.add('is-hide')
}

function set_display() {
    if (document.getElementById('button').checked){
        document.getElementById('btn_area').style.display = 'none'
    }
}
</script>

