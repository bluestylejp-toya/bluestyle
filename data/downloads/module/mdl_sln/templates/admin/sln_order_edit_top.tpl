<!--{if $sln_payid}-->
<script type="text/javascript">
<!--
    function slnjsConfirm(mode) {
        if(window.confirm('決済操作を実行します。データを変更した場合は先に保存を行って下さい。')) {
            fnModeSubmit(mode, '', '');
        }
    }
//-->
</script>
<input type="hidden" name="sln_pay_status" value="<!--{$sln_pay_status}-->">
<h2>ソニーペイメントサービス決済情報</h2>
<table class="form" id="sln_form">
	<tr>
		<th>支払方法</th>
		<td>
			<!--{$sln_pay_name|h}-->
		</td>
	</tr>
	<tr>
		<th>取引ステータス</th>
		<td>
			<!--{if $sln_pay_status == SLN_PAY_STATUS_UNSETTLED}--> 未決済
			<!--{elseif $sln_pay_status == SLN_PAY_STATUS_REQUEST_SUCCESS}-->決済要求成功
			<!--{elseif $sln_pay_status == SLN_PAY_STATUS_PAY_SUCCESS}-->支払い完了
			<!--{elseif $sln_pay_status == SLN_PAY_STATUS_FAIL}--> 決済失敗
			<!--{elseif $sln_pay_status == SLN_PAY_STATUS_CANCEL}-->キャンセル
			<!--{elseif $sln_pay_status == SLN_PAY_STATUS_AUTH}--> 仮売上済み
			<!--{elseif $sln_pay_status == SLN_PAY_STATUS_COMMIT}-->実売上済み
			<!--{elseif $sln_pay_status == SLN_PAY_STATUS_SALES}--> 実売上済み
			<!--{elseif $sln_pay_status == SLN_PAY_STATUS_CAPTURE}-->即時売上済み
			<!--{elseif $sln_pay_status == SLN_PAY_STATUS_VOID}--> 取消済み
			<!--{else}-->不明なエラー(<!--{$sln_pay_status}-->)
			<!--{/if}-->
		</td>
	</tr>

	<!--{if $sln_error}-->
	<tr>
		<th class="attention">決済操作エラー</th>
		<td class="attention">
			<!--{$sln_error|h}-->
		</td>
	</tr>
	<!--{/if}-->
	<!--{if $arrPaymentData.OrderID != ""}-->
	<tr>
		<th>決済処理通番</th>
		<td>
			<!--{$arrPaymentData.OrderID|h}-->
		</td>
	</tr>
	<!--{/if}-->
	<!--{if $arrPaymentData.ErrInfo != ""}-->
	<tr>
		<th>最終エラーコード</th>
		<td>
			<!--{$arrPaymentData.ErrInfo|h}-->
		</td>
	</tr>
	<!--{/if}-->
	<!--{if $arrPaymentData.error_msg != ""}-->
	<tr>
		<th>最終エラーメッセージ</th>
		<td>
			<!--{$arrPaymentData.error_msg|h}-->
		</td>
	</tr>
	<!--{/if}-->
	<!--{if $sln_payid == SLN_PAYID_CVS}-->
	<tr>
		<th>支払い先</th>
		<td>
			<!--{$arrConvenience[$arrPaymentData.Convenience]|h}-->
		</td>
	</tr>
	<!--{/if}-->
	<!--{if $arrPaymentData.Amount != ""}-->
	<tr>
		<th>決済金額</th>
		<td>
			<!--{$arrPaymentData.Amount|number_format|h}-->円
			<!--{if $arrPaymentData.Amount != $arrForm.payment_total.value}--><br /><span class="attention"> ※決済金額と注文金額が一致しません。注文を修正した場合は「決済金額変更処理実行」ボタンを押してください。 </span> <!--{/if}-->
		</td>
	</tr>
	<!--{/if}-->

	<!--{if $sln_payid == SLN_PAYID_CREDIT || $sln_payid == SLN_PAYID_REGIST_CREDIT}-->
	<tr>
		<th>決済操作</th>
		<td>
			<!--{if $sln_pay_status == SLN_PAY_STATUS_AUTH}--> <a
			class="btn-normal" href="javascript:void(0);"
			onclick="slnjsConfirm('sln_commit');">売上確定処理実行</a>&nbsp;
			<!--{/if}-->
			<!--{if $sln_pay_status == SLN_PAY_STATUS_AUTH || $sln_pay_status == SLN_PAY_STATUS_COMMIT || $sln_pay_status == SLN_PAY_STATUS_SALES || $sln_pay_status == SLN_PAY_STATUS_CAPTURE}-->
			<a class="btn-normal" href="javascript:void(0);"
			onclick="slnjsConfirm('sln_cancel');">取消(返品)処理実行</a>&nbsp; <a
			class="btn-normal" href="javascript:void(0);"
			onclick="slnjsConfirm('sln_change');">決済金額変更処理実行</a>&nbsp;
			<!--{/if}-->
			<!--{if $sln_pay_status == SLN_PAY_STATUS_VOID}--> <a
			class="btn-normal" href="javascript:void(0);"
			onclick="slnjsConfirm('sln_reauth');">再オーソリ取得処理実行</a>&nbsp;
			<!--{/if}-->
		</td>
	</tr>
	<!--{/if}-->

	<!--{if $arrPaymentData.payment_log != "" && is_array($arrPaymentData.payment_log) && count($arrPaymentData.payment_log) > 0}-->
	<tr>
		<th>接続ログ</th>
		<td>
            <!--{foreach from=$arrPaymentData.payment_log item=data key=key}-->
            <table id="sln_log">

                <!--{foreach from=$data item=sdata key=skey}-->
                <tr>
                    <th>接続日時</th>
                    <td><!--{$skey|h}--></td>
                </tr>
                <tr>
                    <th>ログ内容</th>
                    <td>
                        <!--{foreach from=$sdata item=val key=vkey name=log_contents}-->
                            <!--{if $val}-->
                                <!--{$vkey|h}--> = <!--{if is_array($val)}--><!--{$val|var_dump}--><!--{else}--><!--{$val|h}--><!--{/if}-->
                                <!--{if !$smarty.foreach.log_contents.last}-->,<!--{/if}-->
                            <!--{/if}-->
                        <!--{/foreach}-->
                    </td>
                </tr>
                <!--{/foreach}-->
            </table>
            <!--{/foreach}-->
		</td>
	</tr>
	<!--{/if}-->
</table>
<!--{/if}-->
