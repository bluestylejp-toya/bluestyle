<!--{include file="`$smarty.const.TEMPLATE_ADMIN_REALDIR`admin_popup_header.tpl"}-->
<!--{include file='css/contents.tpl'}-->
<style type="text/css">
.info {
	font-size: 90%;
}
.form {
	width: 560px;
}

.form tr td.title {
	width: 140px;
}

.form tr td.content {
	width: 300px;
}

.checkBox input {
	margin-top: 0px;
	float: left;
	width: 5%;
	display: block;
	clear: left;
}

.checkBox label {
	line-height: 1.1rem;
	margin-top: 0px;
	display: inline-block;
	width: 92%;
	clear: left;
}

.checkBox_pay input {
	margin-top: 0px;
	float: left;
}

.checkBox_pay label {
	line-height: 1.1rem;
	margin-top: 0px;
	display: block;
	width: 11.5%;
	float: left;
}

.checkBoxWording_pay input {
	margin-top: 0px;
	float: left;
}

.checkBoxWording_pay label {
	line-height: 1.1rem;
	margin-top: 0px;
	display: block;
}

.readonly_color {
    background-color: #eee;
}
</style>

<script>
	$(function() {
		var creditConnectionDst = {};
		<!--{foreach from=$credit_connection_destination key=key item=item}-->
		creditConnectionDst[<!--{$key}-->]={};
		creditConnectionDst[<!--{$key}-->]['creditConnectionPlace1'] = "<!--{$item['creditConnectionPlace1']}-->";
		creditConnectionDst[<!--{$key}-->]['creditConnectionPlace2'] = "<!--{$item['creditConnectionPlace2']}-->";
		creditConnectionDst[<!--{$key}-->]['creditConnectionPlace7'] = "<!--{$item['creditConnectionPlace7']}-->";
		<!--{/foreach}-->
		var threedConnectionDst = {};
		<!--{foreach from=$threed_connection_destination key=key item=item}-->
		threedConnectionDst[<!--{$key}-->]={};
		threedConnectionDst[<!--{$key}-->]['creditConnectionPlace6'] = "<!--{$item['creditConnectionPlace6']}-->";
		<!--{/foreach}-->
		var cvsConnectionDst = {};
		<!--{foreach from=$cvs_connection_destination key=key item=item}-->
		cvsConnectionDst[<!--{$key}-->]={};
		cvsConnectionDst[<!--{$key}-->]['creditConnectionPlace3'] = "<!--{$item['creditConnectionPlace3']}-->";
		cvsConnectionDst[<!--{$key}-->]['creditConnectionPlace5'] = "<!--{$item['creditConnectionPlace5']}-->";
		<!--{/foreach}-->

		function updateCreditConnectionDestination() {
			var dst = $('select[name="credit_connection_destination"]').val();
			$('input[name="credit_connection_place1"]').val(creditConnectionDst[dst]['creditConnectionPlace1']);
			$('input[name="credit_connection_place2"]').val(creditConnectionDst[dst]['creditConnectionPlace2']);
			$('input[name="credit_connection_place7"]').val(creditConnectionDst[dst]['creditConnectionPlace7']);
		}
		function updateThreedConnectionDestination() {
			var dst = $('select[name="threed_connection_destination"]').val();
			$('input[name="credit_connection_place6"]').val(threedConnectionDst[dst]['creditConnectionPlace6']);
		}
		function updateCvsConnectionDestination() {
			var dst = $('select[name="cvs_connection_destination"]').val();
			$('input[name="credit_connection_place3"]').val(cvsConnectionDst[dst]['creditConnectionPlace3']);
			$('input[name="credit_connection_place5"]').val(cvsConnectionDst[dst]['creditConnectionPlace5']);
		}

		$('select[name="credit_connection_destination"]').change(function() {
			updateCreditConnectionDestination();
		});
		$('select[name="threed_connection_destination"]').change(function() {
			updateThreedConnectionDestination();
		});
		$('select[name="cvs_connection_destination"]').change(function() {
			updateCvsConnectionDestination();
		});

		updateCreditConnectionDestination();
		updateThreedConnectionDestination();
		updateCvsConnectionDestination();
	});
</script>

<h1>
	<span class="title">ソニーペイメントサービス決済モジュール</span>
</h1>
<h2>ソニーペイメントサービス決済モジュール</h2>
<span> ソニーペイメントサービス決済モジュールをご利用頂く為にはソニーペイメントサービスとご契約を行っていただく必要があります。<br />
	&nbsp;&nbsp;<a href="http://www.sonypaymentservices.jp/" target="_blank">
		＞＞ソニーペイメントサービスについて</a>

</span>

<h2>ソニーペイメントサービス共通設定</h2>
<form name="form1" id="form1" method="post"
	action="<!--{$smarty.server.REQUEST_URI|escape}-->">
	<input type="hidden" name="mode" value="" /> <input type="hidden"
		name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->"
		value="<!--{$transactionid}-->" />
	<table class="form">
		<!--{if $arrErr.err != ""}-->
		<tr>
			<td colspan="2"><span class="attention"> <!--{$arrErr.err}-->
			</span></td>
		</tr>
		<!--{/if}-->


		<!--{assign var=key value="MerchantId"}-->
		<tr id="<!--{$key}-->">
			<th style="width: 20%;">マーチャントID<span class="attention"> *</span>
			</th>
			<td style="width: 80%;">
				<!--{if $arrErr[$key]}--> <span class="attention"> <!--{$arrErr[$key]}-->
			</span> <!--{/if}--> <input type="text" name="<!--{$key}-->"
				style="ime-mode:disabled; <!--{$arrErr[$key]|sfGetErrorColor}-->"
				value="<!--{$arrForm[$key].value|escape}-->" class="box20"
				maxlength="<!--{$arrForm[$key].length}-->"> <br />
				ご契約後にソニーペイメントサービスより設定値をご連絡します。
			</td>
		</tr>

		<!--{assign var=key value="MerchantPass"}-->
		<tr id="<!--{$key}-->">
			<th>マーチャントパスワード<span class="attention"> *</span>
			</th>
			<td>
				<!--{if $arrErr[$key]}--> <span class="attention"> <!--{$arrErr[$key]}-->
			</span> <!--{/if}--> <input type="password" name="<!--{$key}-->"
				style="ime-mode:disabled; <!--{$arrErr[$key]|sfGetErrorColor}-->"
				value="" class="box20"
				maxlength="<!--{$arrForm[$key].length}-->"> <br />
				ご契約後にソニーペイメントサービスより設定値をご連絡します。
			</td>
		</tr>

		<!--{assign var=key value="TenantId"}-->
		<tr id="<!--{$key}-->">
			<th>店舗コード</th>
			<td>
				<!--{if $arrErr[$key]}--> <span class="attention"> <!--{$arrErr[$key]}-->
			</span> <!--{/if}--> <input type="text" name="<!--{$key}-->"
				style="ime-mode:disabled; <!--{$arrErr[$key]|sfGetErrorColor}-->"
				value="<!--{$arrForm[$key].value|escape}-->" class="box20"
				maxlength="<!--{$arrForm[$key].length}-->">
				<p>未入力の場合は店舗コード「0001」となります(半角数字 4文字)</p>
			</td>
		</tr>


		<!--{assign var=key value="enable_payment_type"}-->
		<tr id="<!--{$key}-->">
			<th>有効にする決済方法<span class="attention"> *</span>
			</th>
			<td>
				<!--{if $arrErr[$key]}--> <span class="attention"> <!--{foreach $arrErr[$key] as $err}--><!--{$err}--><!--{/foreach}-->
			</span> <!--{/if}--> <!--{html_checkboxes name="$key" options=$arrPayments selected=$arrForm[$key].value separator="<br />"}-->
				<br /> <span class="info">*決済方法毎の詳細設定は有効後に<a
					href="javascript:void(win_open('./basis/payment.php'));">支払方法設定画面</a>で行います。
			</span>
			</td>
		</tr>



		<tr>
			<td colspan="2" style="border: none;"></td>
		</tr>

		<tr id="credit_card">
			<td class="fs12n" colspan="2" width="90" bgcolor="#f3f3f3">▼クレジットカード決済</td>
		</tr>

		<!--{assign var=key value="credit_connection_place"}-->
        <tr id="<!--{$key}-->">
			<th>接続先
                <!--{html_options name=credit_connection_destination 
                    options=$connection_destination 
                    selected=$arrForm["credit_connection_destination"]["value"]
                }-->
			</th>
			<td>
            	<!--{assign var=key value="credit_connection_place7"}--> トークン通信先
            	<br />
                <input type="text" name="<!--{$key}-->"
                style="ime-mode:disabled; <!--{$arrErr[$key]|sfGetErrorColor}-->"
                value="<!--{$arrForm[$key].value|escape}-->"
                maxlength="<!--{$arrForm[$key].length}-->" class="box60 readonly_color" readonly> <br />
				<!--{assign var=key value="credit_connection_place1"}--> カード決済<br />
				<input type="text" name="<!--{$key}-->"
				style="ime-mode:disabled; <!--{$arrErr[$key]|sfGetErrorColor}-->"
				value="<!--{$arrForm[$key].value|escape}-->"
				maxlength="<!--{$arrForm[$key].length}-->" class="box60 readonly_color" readonly> <br /> 
                <!--{assign var=key value="credit_connection_place2"}-->
				会員情報登録<br /> <input type="text" name="<!--{$key}-->"
				style="ime-mode:disabled; <!--{$arrErr[$key]|sfGetErrorColor}-->"
				value="<!--{$arrForm[$key].value|escape}-->"
				maxlength="<!--{$arrForm[$key].length}-->" class="box60 readonly_color" readonly>
            </td>
        </tr>
        <tr id="<!--{$key}-->">
        </tr>
            <!--{assign var=key value="token_ninsyo_code"}-->
			<th>トークン決済認証コード
			</th>
			<td>
                <input type="text" name="<!--{$key}-->"
                    style="ime-mode:disabled; <!--{$arrErr[$key]|sfGetErrorColor}-->"
                    value="<!--{$arrForm[$key].value|escape}-->"
                    maxlength="<!--{$arrForm[$key].length}-->" class="box60">
			</td>
        <tr>
                <!--{if $isGet3D}-->
            <th>3Dセキュア認証
                    <!--{html_options name=threed_connection_destination 
                        options=$connection_destination 
                        selected=$arrForm["threed_connection_destination"]["value"]
                    }-->
            </th>
            <td>
                    <!--{assign var=key value="credit_connection_place6"}-->
                    3Dセキュア認証接続先
                    <br /> 
                    <input type="text" name="<!--{$key}-->"
                    style="ime-mode:disabled; <!--{$arrErr[$key]|sfGetErrorColor}-->"
                    value="<!--{$arrForm[$key].value|escape}-->"
                    maxlength="<!--{$arrForm[$key].length}-->" class="box60 readonly_color" readonly>
                    <!--{assign var=key value="credit_aes_key"}-->
                    3Dセキュア認証AES暗号キー<br /> <input type="text" name="<!--{$key}-->"
                    style="ime-mode:disabled; <!--{$arrErr[$key]|sfGetErrorColor}-->"
                    value="<!--{$arrForm[$key].value|escape}-->"
                    maxlength="<!--{$arrForm[$key].length}-->" class="box60">
                    <!--{assign var=key value="credit_aes_iv"}-->
                    3Dセキュア認証AESベクトル<br /> <input type="text" name="<!--{$key}-->"
                    style="ime-mode:disabled; <!--{$arrErr[$key]|sfGetErrorColor}-->"
                    value="<!--{$arrForm[$key].value|escape}-->"
                    maxlength="<!--{$arrForm[$key].length}-->" class="box60">
                <!--{else}-->
                	<span class="attention">3D認証を有効したい場合はphp opensslモジュールをインストールください。<br></span>
                <!--{/if}-->
                
				ご契約後にソニーペイメントサービスより設定値をご連絡します。
			</td>
		</tr>

		<!--{assign var=key value="payKbnKaisu"}-->
		<tr id="<!--{$key}-->">
			<th>支払回数<span class="attention"> *</span>
			</th>
			<td>
				<!--{if $arrErr[$key]}--> <span class="attention"> <!--{foreach $arrErr[$key] as $err}--><!--{$err}--><!--{/foreach}-->
			</span> <!--{/if}--> <span class="checkBox_pay"> <!--{html_checkboxes_ex name="$key" options=$arrPayKbnKaisu selected=$arrForm[$key].value style=$arrErr[$key]|sfGetErrorColor}-->
			</span>
			</td>
		</tr>

		<!--{assign var=key value="SecCd"}-->
		<tr id="<!--{$key}-->">
			<th>セキュリティコード</th>
			<td>
				<!--{if $arrErr[$key]}--> <span class="attention"> <!--{$arrErr[$key]}-->
			</span> <!--{/if}--> <!--{if $arrForm[$key].value}--> <!--{html_radios name="$key" options=$arrSecurityCode selected=$arrForm[$key].value style=$arrErr[$key]|sfGetErrorColor}-->
				<!--{else}--> <!--{html_radios name="$key" options=$arrSecurityCode selected=1 style=$arrErr[$key]|sfGetErrorColor}-->
				<!--{/if}-->
			</td>
		</tr>

		<!--{assign var=key value="attestation_assistance"}-->
		<tr id="<!--{$key}-->">
			<th>認証アシスト項目</th>
			<td>
				<!--{if $arrErr[$key]}--> <span class="attention"> <!--{$arrErr[$key]}-->
			</span> <!--{/if}--> <!--{html_checkboxes_ex name="$key" options=$arrAssistance selected=$arrForm[$key].value style=$arrErr[$key]|sfGetErrorColor}-->
				<br /> ご利用にはご契約(有料)が必要になります。
			</td>
		</tr>

		<!--{assign var=key value="OperateId"}-->
		<tr id="<!--{$key}-->">
			<th>カード決済手続き</th>
			<td>
				<!--{if $arrErr[$key]}--> <span class="attention"> <!--{$arrErr[$key]}-->
			</span> <!--{/if}--> <!--{html_radios name="$key" options=$arrCardProcedure selected=$arrForm[$key].value style=$arrErr[$key]|sfGetErrorColor}-->
				<p>
					仮売上（1Auth） ・・・ 購入申込手続きの中でクレジットカードの与信枠を<br /> &nbsp;確保し、承認番号を取得します。<br />
					&nbsp;決済を完了させるためには、別途売上処理が必要と<br /> &nbsp;なります。<br />
					&nbsp;購入申し込み後に在庫を確認して確定させる物品販<br /> &nbsp;売等はこの方法となります。 <br />
					即時売上（1Gathering) ・・・ 購入申込手続きの中で与信と同時に売上確<br /> &nbsp;定を行います。<br />
					&nbsp;購入申込時に商品提供が確定するデジタルコンテン<br /> &nbsp;ツ等は、この方法となります。
				</p>
			</td>
		</tr>
        
        <!--{assign var=key value="card_order_pre_end"}-->
		<tr id="<!--{$key}-->">
			<th>受注入金済み手続き</th>
			<td>
				<!--{if $arrErr[$key]}--> <span class="attention"> <!--{$arrErr[$key]}-->
			</span> <!--{/if}--> <!--{html_radios name="$key" options=$arrCardPayStatus selected=$arrForm[$key].value style=$arrErr[$key]|sfGetErrorColor}-->
				<p>
					「即時売上」にてカード処理いただいた場合<br />オーソリOK判定が出たあと受注の対応状況指定です。
				</p>
			</td>
		</tr>

		<!--{assign var=key value="member_regist"}-->
		<tr id="<!--{$key}-->">
			<th>会員登録機能</th>
			<td>
				<!--{if $arrErr[$key]}--> <span class="attention"> <!--{$arrErr[$key]}-->
			</span> <!--{/if}--> <!--{html_radios name="$key" options=$arrMemberRegist selected=$arrForm[$key].value style=$arrErr[$key]|sfGetErrorColor}-->
			</td>
		</tr>
        
        <!--{assign var=key value="3d_pay"}-->
		<tr id="<!--{$key}-->">
			<th>3Dセキュアサービス</th>
			<td>
				<!--{if $arrErr[$key]}--> <span class="attention"> <!--{$arrErr[$key]}-->
			</span> <!--{/if}--> <!--{html_radios name="$key" options=$arr3DPay selected=$arrForm[$key].value style=$arrErr[$key]|sfGetErrorColor}-->
			</td>
		</tr>

		<!--{assign var=key value="quick_accounts"}-->
		<tr id="<!--{$key}-->">
			<th>クイック決済</th>
			<td>
				<!--{if $arrErr[$key]}--> <span class="attention"> <!--{$arrErr[$key]}-->
			</span> <!--{/if}--> <!--{html_radios name="$key" options=$arrQuickAccounts selected=$arrForm[$key].value style=$arrErr[$key]|sfGetErrorColor}-->
			</td>
		</tr>

		<tr>
			<th>継続課金</th>
			<td>保留</td>
		</tr>

		<tr>
			<td colspan="2" style="border: none;"></td>
		</tr>

		<tr id="online">
			<td class="fs12n" colspan="2" width="90" bgcolor="#f3f3f3">▼オンライン収納代行</td>
		</tr>

		<tr>
			<th>接続先
                <!--{html_options name=cvs_connection_destination 
                    options=$connection_destination 
                    selected=$arrForm["cvs_connection_destination"]["value"]
                }-->
			</th>
			<td>
				<!--{assign var=key value="credit_connection_place5"}--> オンライン取引
				<br />
				<input type="text" name="<!--{$key}-->"
				style="ime-mode:disabled; <!--{$arrErr[$key]|sfGetErrorColor}-->"
				value="<!--{$arrForm[$key].value|escape}-->"
				maxlength="<!--{$arrForm[$key].length}-->" class="box60 readonly_color" readonly> <br /> <!--{assign var=key value="credit_connection_place3"}-->
				リダイレクト先(PC用支払選択画面)<br /> <input type="text" name="<!--{$key}-->"
				style="ime-mode:disabled; <!--{$arrErr[$key]|sfGetErrorColor}-->"
				value="<!--{$arrForm[$key].value|escape}-->"
				maxlength="<!--{$arrForm[$key].length}-->" class="box60 readonly_color" readonly> <br /> <!--{assign var=key value="credit_connection_place4"}-->
				リダイレクト先(モバイル用支払選択画面)<br /> <input type="text" name="<!--{$key}-->"
				style="ime-mode:disabled; <!--{$arrErr[$key]|sfGetErrorColor}-->"
				value="<!--{$arrForm[$key].value|escape}-->"
				maxlength="<!--{$arrForm[$key].length}-->" class="box60"> <br />
				ご契約後にソニーペイメントサービスより設定値をご連絡します。
			</td>
		</tr>
		<tr>
			<th>利用できるオンライン収納決済方法</th>
			<td>
				<!--{assign var=key value="OnlinePaymentMethod"}--> <!--{if $arrErr[$key]}-->
				<span class="attention"> <!--{$arrErr[$key]}-->
			</span> <!--{/if}--> <!--{html_checkboxes_ex name="$key" options=$arrOnlinePaymentMethod selected=$arrForm[$key].value separator="<br />" style="$arrErr[$key]|sfGetErrorColor;" }-->
			</td>
		</tr>

		<!--{assign var=key value="Free1"}-->
		<tr id="<!--{$key}-->">
			<th>フリーエリア1</th>
			<td>
				<!--{if $arrErr[$key]}--> <span class="attention"> <!--{$arrErr[$key]}-->
			</span> <!--{/if}--> <input type="text" name="<!--{$key}-->"
				style="<!--{$arrErr[$key]|sfGetErrorColor}-->"
				value="<!--{$arrForm[$key].value|escape}-->"
				maxlength="<!--{$arrForm[$key].length}-->" class="box30"> (全角16文字以内)
			</td>
		</tr>

		<!--{assign var=key value="Free2"}-->
		<tr id="<!--{$key}-->">
			<th>フリーエリア2</th>
			<td>
				<!--{if $arrErr[$key]}--> <span class="attention"> <!--{$arrErr[$key]}-->
			</span> <!--{/if}--> <input type="text" name="<!--{$key}-->"
				style="<!--{$arrErr[$key]|sfGetErrorColor}-->"
				value="<!--{$arrForm[$key].value|escape}-->"
				maxlength="<!--{$arrForm[$key].length}-->" class="box30"> (全角16文字以内)
			</td>
		</tr>

		<!--{assign var=key value="Free3"}-->
		<tr id="<!--{$key}-->">
			<th>フリーエリア3</th>
			<td>
				<!--{if $arrErr[$key]}--> <span class="attention"> <!--{$arrErr[$key]}-->
			</span> <!--{/if}--> <input type="text" name="<!--{$key}-->"
				style="<!--{$arrErr[$key]|sfGetErrorColor}-->"
				value="<!--{$arrForm[$key].value|escape}-->"
				maxlength="<!--{$arrForm[$key].length}-->" class="box30"> (全角16文字以内)
			</td>
		</tr>

		<!--{assign var=key value="Free4"}-->
		<tr id="<!--{$key}-->">
			<th>フリーエリア4</th>
			<td>
				<!--{if $arrErr[$key]}--> <span class="attention"> <!--{$arrErr[$key]}-->
			</span> <!--{/if}--> <input type="text" name="<!--{$key}-->"
				style="<!--{$arrErr[$key]|sfGetErrorColor}-->"
				value="<!--{$arrForm[$key].value|escape}-->"
				maxlength="<!--{$arrForm[$key].length}-->" class="box30"> (全角16文字以内)
			</td>
		</tr>

		<!--{assign var=key value="Free5"}-->
		<tr id="<!--{$key}-->">
			<th>フリーエリア5</th>
			<td>
				<!--{if $arrErr[$key]}--> <span class="attention"> <!--{$arrErr[$key]}-->
			</span> <!--{/if}--> <input type="text" name="<!--{$key}-->"
				style="<!--{$arrErr[$key]|sfGetErrorColor}-->"
				value="<!--{$arrForm[$key].value|escape}-->"
				maxlength="<!--{$arrForm[$key].length}-->" class="box30"> (全角16文字以内)
			</td>
		</tr>

		<!--{assign var=key value="Free6"}-->
		<tr id="<!--{$key}-->">
			<th>フリーエリア6</th>
			<td>
				<!--{if $arrErr[$key]}--> <span class="attention"> <!--{$arrErr[$key]}-->
			</span> <!--{/if}--> <input type="text" name="<!--{$key}-->"
				style="<!--{$arrErr[$key]|sfGetErrorColor}-->"
				value="<!--{$arrForm[$key].value|escape}-->"
				maxlength="<!--{$arrForm[$key].length}-->" class="box30"> (全角16文字以内)
			</td>
		</tr>

		<!--{assign var=key value="Free7"}-->
		<tr id="<!--{$key}-->">
			<th>フリーエリア7</th>
			<td>
				<!--{if $arrErr[$key]}--> <span class="attention"> <!--{$arrErr[$key]}-->
			</span> <!--{/if}--> <input type="text" name="<!--{$key}-->"
				style="<!--{$arrErr[$key]|sfGetErrorColor}-->"
				value="<!--{$arrForm[$key].value|escape}-->"
				maxlength="<!--{$arrForm[$key].length}-->" class="box30"> (全角16文字以内)
			</td>
		</tr>

		<!--{assign var=key value="Comment"}-->
		<tr id="<!--{$key}-->">
			<th>ご案内1</th>
			<td>
				<!--{if $arrErr[$key]}--> <span class="attention"> <!--{$arrErr[$key]}-->
			</span> <!--{/if}--> <input type="text" name="<!--{$key}-->"
				style="<!--{$arrErr[$key]|sfGetErrorColor}-->"
				value="<!--{$arrForm[$key].value|escape}-->"
				maxlength="<!--{$arrForm[$key].length}-->" class="box40"> (全角30文字以内)
			</td>
		</tr>

		<!--{assign var=key value="Free8"}-->
		<tr id="<!--{$key}-->">
			<th>ご案内2</th>
			<td>
				<!--{if $arrErr[$key]}--> <span class="attention"> <!--{$arrErr[$key]}-->
			</span> <!--{/if}--> <input type="text" name="<!--{$key}-->"
				style="<!--{$arrErr[$key]|sfGetErrorColor}-->"
				value="<!--{$arrForm[$key].value|escape}-->"
				maxlength="<!--{$arrForm[$key].length}-->" class="box40"> (全角30文字以内)
			</td>
		</tr>

		<!--{assign var=key value="Free9"}-->
		<tr id="<!--{$key}-->">
			<th>ご案内3</th>
			<td>
				<!--{if $arrErr[$key]}--> <span class="attention"> <!--{$arrErr[$key]}-->
			</span> <!--{/if}--> <input type="text" name="<!--{$key}-->"
				style="<!--{$arrErr[$key]|sfGetErrorColor}-->"
				value="<!--{$arrForm[$key].value|escape}-->"
				maxlength="<!--{$arrForm[$key].length}-->" class="box40"> (全角30文字以内)
			</td>
		</tr>

		<!--{assign var=key value="Free10"}-->
		<tr id="<!--{$key}-->">
			<th>ご案内4</th>
			<td>
				<!--{if $arrErr[$key]}--> <span class="attention"> <!--{$arrErr[$key]}-->
			</span> <!--{/if}--> <input type="text" name="<!--{$key}-->"
				style="<!--{$arrErr[$key]|sfGetErrorColor}-->"
				value="<!--{$arrForm[$key].value|escape}-->"
				maxlength="<!--{$arrForm[$key].length}-->" class="box40"> (全角30文字以内)
			</td>
		</tr>

		<!--{assign var=key value="Free11"}-->
		<tr id="<!--{$key}-->">
			<th>ご案内5</th>
			<td>
				<!--{if $arrErr[$key]}--> <span class="attention"> <!--{$arrErr[$key]}-->
			</span> <!--{/if}--> <input type="text" name="<!--{$key}-->"
				style="<!--{$arrErr[$key]|sfGetErrorColor}-->"
				value="<!--{$arrForm[$key].value|escape}-->"
				maxlength="<!--{$arrForm[$key].length}-->" class="box40"> (全角30文字以内)
			</td>
		</tr>

		<!--{assign var=key value="Free12"}-->
		<tr id="<!--{$key}-->">
			<th>ご案内6</th>
			<td>
				<!--{if $arrErr[$key]}--> <span class="attention"> <!--{$arrErr[$key]}-->
			</span> <!--{/if}--> <input type="text" name="<!--{$key}-->"
				style="<!--{$arrErr[$key]|sfGetErrorColor}-->"
				value="<!--{$arrForm[$key].value|escape}-->"
				maxlength="<!--{$arrForm[$key].length}-->" class="box40"> (全角30文字以内)
			</td>
		</tr>

		<!--{assign var=key value="Free13"}-->
		<tr id="<!--{$key}-->">
			<th>ご案内7</th>
			<td>
				<!--{if $arrErr[$key]}--> <span class="attention"> <!--{$arrErr[$key]}-->
			</span> <!--{/if}--> <input type="text" name="<!--{$key}-->"
				style="<!--{$arrErr[$key]|sfGetErrorColor}-->"
				value="<!--{$arrForm[$key].value|escape}-->"
				maxlength="<!--{$arrForm[$key].length}-->" class="box40"> (全角30文字以内)
			</td>
		</tr>

		<!--{assign var=key value="Free14"}-->
		<tr id="<!--{$key}-->">
			<th>ご案内8</th>
			<td>
				<!--{if $arrErr[$key]}--> <span class="attention"> <!--{$arrErr[$key]}-->
			</span> <!--{/if}--> <input type="text" name="<!--{$key}-->"
				style="<!--{$arrErr[$key]|sfGetErrorColor}-->"
				value="<!--{$arrForm[$key].value|escape}-->"
				maxlength="<!--{$arrForm[$key].length}-->" class="box40"> (全角30文字以内)
			</td>
		</tr>

		<!--{assign var=key value="Free15"}-->
		<tr id="<!--{$key}-->">
			<th>ご案内9</th>
			<td>
				<!--{if $arrErr[$key]}--> <span class="attention"> <!--{$arrErr[$key]}-->
			</span> <!--{/if}--> <input type="text" name="<!--{$key}-->"
				style="<!--{$arrErr[$key]|sfGetErrorColor}-->"
				value="<!--{$arrForm[$key].value|escape}-->"
				maxlength="<!--{$arrForm[$key].length}-->" class="box40"> (全角30文字以内)
			</td>
		</tr>

		<!--{assign var=key value="Free16"}-->
		<tr id="<!--{$key}-->">
			<th>ご案内10</th>
			<td>
				<!--{if $arrErr[$key]}--> <span class="attention"> <!--{$arrErr[$key]}-->
			</span> <!--{/if}--> <input type="text" name="<!--{$key}-->"
				style="<!--{$arrErr[$key]|sfGetErrorColor}-->"
				value="<!--{$arrForm[$key].value|escape}-->"
				maxlength="<!--{$arrForm[$key].length}-->" class="box40"> (全角30文字以内)
			</td>
		</tr>


		<!--{assign var=key value="Free17"}-->
		<tr id="<!--{$key}-->">
			<th>問い合わせ先</th>
			<td>
				<!--{if $arrErr[$key]}--> <span class="attention"> <!--{$arrErr[$key]}-->
			</span> <!--{/if}--> <input type="text" name="<!--{$key}-->"
				style="ime-mode:disabled; <!--{$arrErr[$key]|sfGetErrorColor}-->"
				value="<!--{$arrForm[$key].value|escape}-->"
				maxlength="<!--{$arrForm[$key].length}-->" class="box60"> (全半角21文字以内)
			</td>
		</tr>

		<!--{assign var=key value="Free18"}-->
		<tr id="<!--{$key}-->">
			<th>問合せ電話</th>
			<td>
				<!--{if $arrErr[$key]}--> <span class="attention"> <!--{$arrErr[$key]}-->
			</span> <!--{/if}--> <input type="text" name="<!--{$key}-->"
				style="ime-mode:disabled; <!--{$arrErr[$key]|sfGetErrorColor}-->"
				value="<!--{$arrForm[$key].value|escape}-->"
				maxlength="<!--{$arrForm[$key].length}-->" class="box60"> (半角数字とハイフン
				12文字以内)
			</td>
		</tr>

		<!--{assign var=key value="Free19"}-->
		<tr id="<!--{$key}-->">
			<th>問い合わせ時間</th>
			<td>
				<!--{if $arrErr[$key]}--> <span class="attention"> <!--{$arrErr[$key]}-->
			</span> <!--{/if}--> <input type="text" name="<!--{$key}-->"
				style="ime-mode:disabled; <!--{$arrErr[$key]|sfGetErrorColor}-->"
				value="<!--{$arrForm[$key].value|escape}-->"
				maxlength="<!--{$arrForm[$key].length}-->" class="box20"> (半角英数字記号
				11文字以内)
			</td>
		</tr>

		<!--{assign var=key value="Title"}-->
		<tr id="<!--{$key}-->">
			<th>ご案内タイトル</th>
			<td>
				<!--{if $arrErr[$key]}--> <span class="attention"> <!--{$arrErr[$key]}-->
			</span> <!--{/if}--> <input type="text" name="<!--{$key}-->"
				style="ime-mode:disabled; <!--{$arrErr[$key]|sfGetErrorColor}-->"
				value="<!--{$arrForm[$key].value|escape}-->"
				maxlength="<!--{$arrForm[$key].length}-->" class="box60">
				(全半角20文字以内)
			</td>
		</tr>

	</table>
	<div class="btn-area">
		<ul>
			<li><a class="btn-action" href="javascript:;"
				onclick="document.form1.mode.value='register';document.body.style.cursor = 'wait';document.form1.submit();return false;"><span
					class="btn-next">この内容で登録する</span> </a>
			</li>
		</ul>
		
        <!--{if !$is_add_card_mem_table}-->
            <br />
            <ul>
                <li><a class="btn-action" href="javascript:;"
                    onclick="document.form1.mode.value='add_card_mem_table';document.body.style.cursor = 'wait';document.form1.submit();return false;"><span
                        class="btn-next">バージョンアップ</span> </a>
                </li>
            </ul>
        <!--{/if}-->
	</div>
</form>
<!--{include file="`$smarty.const.TEMPLATE_ADMIN_REALDIR`admin_popup_footer.tpl"}-->
