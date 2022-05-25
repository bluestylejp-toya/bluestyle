<script type="text/javascript">//<![CDATA[
    $(function(){
        $('li#navi-order ul:first li:last').after('<li id="navi-order-payment_status"><a href="<!--{$smarty.const.ROOT_URLPATH}--><!--{$smarty.const.ADMIN_DIR}-->order/payment_status.php"><span>決済状況管理</span></a></li>');

    });
//]]></script>
<script type="text/javascript">
<!--
function fnIsSelectBoxChecked(fm)
{
    if (fm["move[]"].length > 0) {
        for (var i = 0; i < fm["move[]"].length; ++i) {
            if (fm["move[]"][i].checked == true){
                return true;
            }
        }
    } else {
        if(fm["move[]"].checked == true) {
            return true;
        }
    }
    return false;
}

function slnSubmitSubMode(sln_sub_mode)
{
    if (!fnIsSelectBoxChecked(document.form1)) {
        alert('チェックボックスが選択されていません');
        return false;
    }

    document.form1.mode.value = 'sln_sub_mode';
    document.form1.sln_sub_mode.value = sln_sub_mode;
    document.form1.submit();
}


function fnSelectCheckSubmit(change_status)
{
    if (!fnIsSelectBoxChecked(document.form1)) {
        alert('チェックボックスが選択されていません');
        return false;
    }

    var i;
    var fm = document.form1;
    var checkflagNoSent = 0;
    var max = fm["move[]"].length;

    if (change_status == 5) {
        if (max) {
            for (i=0;i<max;i++){
            	if ((fm["move[]"][i].checked == true) && (fm["sln_paystatus[]"].item(i).value != "") && (fm["sln_paystatus[]"].item(i).value != "1") &&  (fm["sln_paystatus[]"].item(i).value != <!--{$smarty.const.SLN_PAY_STATUS_COMMIT}-->) && (fm["sln_paystatus[]"].item(i).value != <!--{$smarty.const.SLN_PAY_STATUS_CAPTURE}-->) && (fm["sln_paystatus[]"].item(i).value != <!--{$smarty.const.SLN_PAY_STATUS_PAY_SUCCESS}-->)) {
                	checkflagNoSent = 1;
                }
            }
        } else {
        	if ((fm["move[]"].checked == true) && (fm["sln_paystatus[]"].val != "")  && (fm["sln_paystatus[]"].val != "1") &&  (fm["sln_paystatus[]"].val != <!--{$smarty.const.SLN_PAY_STATUS_COMMIT}-->) && (fm["sln_paystatus[]"].val != <!--{$smarty.const.SLN_PAY_STATUS_CAPTURE}-->) && (fm["sln_paystatus[]"].val != <!--{$smarty.const.SLN_PAY_STATUS_PAY_SUCCESS}-->)) {
            	checkflagNoSent = 1;
            }
        }
    }

    if (checkflagNoSent == 1){
        alert('取引ステータスが実売上済み/即時売上済みでないと発送済みに変更できません');
        return false;
    }

    document.form1.mode.value = 'update';
    document.form1.change_status.value = change_status;
    document.form1.submit();
}
//-->
</script>
<div id="order" class="contents-main">
<form name="search_form" id="search_form" method="post" action="?">
<input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
<input type="hidden" name="mode" value="search" />
    <h2>検索条件設定</h2>
    <!--{* 検索条件設定テーブルここから *}-->
    <table>
        <tr>
            <th>注文番号</th>
            <td>
                <!--{assign var=key1 value="search_order_id1"}-->
                <!--{assign var=key2 value="search_order_id2"}-->
                <span class="attention"><!--{$arrErr[$key1]}--></span>
                <span class="attention"><!--{$arrErr[$key2]}--></span>
                <input type="text" name="<!--{$key1}-->" value="<!--{$arrForm[$key1].value|h}-->" maxlength="<!--{$arrForm[$key1].length}-->" style="<!--{$arrErr[$key1]|sfGetErrorColor}-->" size="6" class="box6" />
                ～
                <input type="text" name="<!--{$key2}-->" value="<!--{$arrForm[$key2].value|h}-->" maxlength="<!--{$arrForm[$key2].length}-->" style="<!--{$arrErr[$key2]|sfGetErrorColor}-->" size="6" class="box6" />
            </td>
            <th>対応状況</th>
            <td>
                <!--{assign var=key value="search_order_status"}-->
                <span class="attention"><!--{$arrErr[$key]}--></span>
                <select name="<!--{$key}-->" style="<!--{$arrErr[$key]|sfGetErrorColor}-->">
                <option value="">選択してください</option>
                <!--{html_options options=$arrORDERSTATUS selected=$arrForm[$key].value}-->
                </select>
            </td>
        </tr>
        <tr>
            <th>お名前</th>
            <td>
            <!--{assign var=key value="search_order_name"}-->
            <span class="attention"><!--{$arrErr[$key]}--></span>
            <input type="text" name="<!--{$key}-->" value="<!--{$arrForm[$key].value|h}-->" maxlength="<!--{$arrForm[$key].length}-->" style="<!--{$arrErr[$key]|sfGetErrorColor}-->" size="30" class="box30" />
            </td>
            <th>お名前(フリガナ)</th>
            <td>
            <!--{assign var=key value="search_order_kana"}-->
            <span class="attention"><!--{$arrErr[$key]}--></span>
            <input type="text" name="<!--{$key}-->" value="<!--{$arrForm[$key].value|h}-->" maxlength="<!--{$arrForm[$key].length}-->" style="<!--{$arrErr[$key]|sfGetErrorColor}-->" size="30" class="box30" />
            </td>
        </tr>
        <tr>
            <th>メールアドレス</th>
            <td>
                <!--{assign var=key value="search_order_email"}-->
                <span class="attention"><!--{$arrErr[$key]}--></span>
                <input type="text" name="<!--{$key}-->" value="<!--{$arrForm[$key].value|h}-->" maxlength="<!--{$arrForm[$key].length}-->" style="<!--{$arrErr[$key]|sfGetErrorColor}-->" size="30" class="box30" />
            </td>
            <th>TEL</th>
            <td>
                <!--{assign var=key value="search_order_tel"}-->
                <span class="attention"><!--{$arrErr[$key]}--></span>
                <input type="text" name="<!--{$key}-->" value="<!--{$arrForm[$key].value|h}-->" maxlength="<!--{$arrForm[$key].length}-->" style="<!--{$arrErr[$key]|sfGetErrorColor}-->" size="30" class="box30" />
            </td>
        </tr>
        <tr>
            <th>生年月日</th>
            <td colspan="3">
                <span class="attention"><!--{$arrErr.search_sbirthyear}--></span>
                <span class="attention"><!--{$arrErr.search_ebirthyear}--></span>
                <select name="search_sbirthyear" style="<!--{$arrErr.search_sbirthyear|sfGetErrorColor}-->">
                <option value="">----</option>
                <!--{html_options options=$arrBirthYear selected=$arrForm.search_sbirthyear.value}-->
                </select>年
                <select name="search_sbirthmonth" style="<!--{$arrErr.search_sbirthyear|sfGetErrorColor}-->">
                <option value="">--</option>
                <!--{html_options options=$arrMonth selected=$arrForm.search_sbirthmonth.value}-->
                </select>月
                <select name="search_sbirthday" style="<!--{$arrErr.search_sbirthyear|sfGetErrorColor}-->">
                <option value="">--</option>
                <!--{html_options options=$arrDay selected=$arrForm.search_sbirthday.value}-->
                </select>日～
                <select name="search_ebirthyear" style="<!--{$arrErr.search_ebirthyear|sfGetErrorColor}-->">
                <option value="">----</option>
                <!--{html_options options=$arrBirthYear selected=$arrForm.search_ebirthyear.value}-->
                </select>年
                <select name="search_ebirthmonth" style="<!--{$arrErr.search_ebirthyear|sfGetErrorColor}-->">
                <option value="">--</option>
                <!--{html_options options=$arrMonth selected=$arrForm.search_ebirthmonth.value}-->
                </select>月
                <select name="search_ebirthday" style="<!--{$arrErr.search_ebirthyear|sfGetErrorColor}-->">
                <option value="">--</option>
                <!--{html_options options=$arrDay selected=$arrForm.search_ebirthday.value}-->
                </select>日
            </td>
        </tr>
        <tr>
            <th>性別</th>
            <td colspan="3">
            <!--{assign var=key value="search_order_sex"}-->
            <span class="attention"><!--{$arrErr[$key]}--></span>
            <!--{html_checkboxes name="$key" options=$arrSex selected=$arrForm[$key].value}-->
            </td>
        </tr>
			<tr>
				<th>支払方法</th>
				<td colspan="3">
					<!--{assign var=key value="search_payment_id"}-->
					<span class="attention"> <!--{$arrErr[$key]|h}--></span>
					<!--{html_checkboxes name="$key" options=$arrPayments selected=$arrForm[$key].value}-->
				</td>
			</tr>
			<tr>
				<th>決済状況</th>
				<td colspan="3">
					<!--{assign var=key value="search_payment_status"}-->
					<span class="attention"> <!--{$arrErr[$key]|h}--></span>
					<!--{html_checkboxes name="$key" options=$arrPaymentStatus selected=$arrForm[$key].value}-->
				</td>
			</tr>
			<tr>
        <tr>
            <th>受注日</th>
            <td colspan="3">
                <!--{if $arrErr.search_sorderyear}--><span class="attention"><!--{$arrErr.search_sorderyear}--></span><!--{/if}-->
                <!--{if $arrErr.search_eorderyear}--><span class="attention"><!--{$arrErr.search_eorderyear}--></span><!--{/if}-->
                <select name="search_sorderyear" style="<!--{$arrErr.search_sorderyear|sfGetErrorColor}-->">
                <option value="">----</option>
                <!--{html_options options=$arrRegistYear selected=$arrForm.search_sorderyear.value}-->
                </select>年
                <select name="search_sordermonth" style="<!--{$arrErr.search_sorderyear|sfGetErrorColor}-->">
                <option value="">--</option>
                <!--{html_options options=$arrMonth selected=$arrForm.search_sordermonth.value}-->
                </select>月
                <select name="search_sorderday" style="<!--{$arrErr.search_sorderyear|sfGetErrorColor}-->">
                <option value="">--</option>
                <!--{html_options options=$arrDay selected=$arrForm.search_sorderday.value}-->
                </select>日～
                <select name="search_eorderyear" style="<!--{$arrErr.search_eorderyear|sfGetErrorColor}-->">
                <option value="">----</option>
                <!--{html_options options=$arrRegistYear selected=$arrForm.search_eorderyear.value}-->
                </select>年
                <select name="search_eordermonth" style="<!--{$arrErr.search_eorderyear|sfGetErrorColor}-->">
                <option value="">--</option>
                <!--{html_options options=$arrMonth selected=$arrForm.search_eordermonth.value}-->
                </select>月
                <select name="search_eorderday" style="<!--{$arrErr.search_eorderyear|sfGetErrorColor}-->">
                <option value="">--</option>
                <!--{html_options options=$arrDay selected=$arrForm.search_eorderday.value}-->
                </select>日
            </td>
        </tr>
        <tr>
            <th>更新日</th>
            <td colspan="3">
                <!--{if $arrErr.search_supdateyear}--><span class="attention"><!--{$arrErr.search_supdateyear}--></span><!--{/if}-->
                <!--{if $arrErr.search_eupdateyear}--><span class="attention"><!--{$arrErr.search_eupdateyear}--></span><!--{/if}-->
                <select name="search_supdateyear" style="<!--{$arrErr.search_supdateyear|sfGetErrorColor}-->">
                    <option value="">----</option>
                    <!--{html_options options=$arrRegistYear selected=$arrForm.search_supdateyear.value}-->
                </select>年
                <select name="search_supdatemonth" style="<!--{$arrErr.search_supdateyear|sfGetErrorColor}-->">
                    <option value="">--</option>
                    <!--{html_options options=$arrMonth selected=$arrForm.search_supdatemonth.value}-->
                </select>月
                <select name="search_supdateday" style="<!--{$arrErr.search_supdateyear|sfGetErrorColor}-->">
                    <option value="">--</option>
                    <!--{html_options options=$arrDay selected=$arrForm.search_supdateday.value}-->
                </select>日～
                <select name="search_eupdateyear" style="<!--{$arrErr.search_eupdateyear|sfGetErrorColor}-->">
                    <option value="">----</option>
                    <!--{html_options options=$arrRegistYear selected=$arrForm.search_eupdateyear.value}-->
                </select>年
                <select name="search_eupdatemonth" style="<!--{$arrErr.search_eupdateyear|sfGetErrorColor}-->">
                    <option value="">--</option>
                    <!--{html_options options=$arrMonth selected=$arrForm.search_eupdatemonth.value}-->
                </select>月
                <select name="search_eupdateday" style="<!--{$arrErr.search_eupdateyear|sfGetErrorColor}-->">
                    <option value="">--</option>
                    <!--{html_options options=$arrDay selected=$arrForm.search_eupdateday.value}-->
                </select>日
            </td>
        </tr>
        <tr>
            <th>購入金額</th>
            <td>
                <!--{assign var=key1 value="search_total1"}-->
                <!--{assign var=key2 value="search_total2"}-->
                <span class="attention"><!--{$arrErr[$key1]}--></span>
                <span class="attention"><!--{$arrErr[$key2]}--></span>
                <input type="text" name="<!--{$key1}-->" value="<!--{$arrForm[$key1].value|h}-->" maxlength="<!--{$arrForm[$key1].length}-->" style="<!--{$arrErr[$key1]|sfGetErrorColor}-->" size="6" class="box6" />
                円 ～
                <input type="text" name="<!--{$key2}-->" value="<!--{$arrForm[$key2].value|h}-->" maxlength="<!--{$arrForm[$key2].length}-->" style="<!--{$arrErr[$key2]|sfGetErrorColor}-->" size="6" class="box6" />
                円
            </td>
            <th>購入商品</th>
            <td>
                <!--{assign var=key value="search_product_name"}-->
                <!--{if $arrErr[$key]}--><span class="attention"><!--{$arrErr[$key]}--></span><!--{/if}-->
                <input type="text" name="<!--{$key}-->" value="<!--{$arrForm[$key].value|h}-->" maxlength="<!--{$arrForm[$key].length}-->" style="<!--{$arrErr[$key]|sfGetErrorColor}-->" size="6" class="box30" />
            </td>
        </tr>
    </table>

    <div class="btn">
        <p class="page_rows">検索結果表示件数
        <!--{assign var=key value="search_page_max"}-->
        <span class="attention"><!--{$arrErr[$key]}--></span>
        <select name="<!--{$arrForm[$key].keyname}-->" style="<!--{$arrErr[$key]|sfGetErrorColor}-->">
        <!--{html_options options=$arrPageMax selected=$arrForm[$key].value}-->
        </select> 件</p>
        <div class="btn-area">
            <ul>
                <li><a class="btn-action" href="javascript:;" onclick="fnFormModeSubmit('search_form', 'search', '', ''); return false;"><span class="btn-next">この条件で検索する</span></a></li>
            </ul>
        </div>
    </div>
    <!--検索条件設定テーブルここまで-->
</form>

	<!--{if count($arrErr) == 0}-->

	<!--★★検索結果一覧★★-->
	<form name="form1" method="post" id="form1" action="?">
		<input name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" type="hidden"
			value="<!--{$transactionid}-->" /> <input name="mode" type="hidden"
			value="search" /> <input name="order_id" type="hidden" value="" />
		<!--{foreach key=key item=item from=$arrHidden}-->
		<!--{if is_array($item)}-->
		<!--{foreach item=c_item from=$item}-->
		<input type="hidden" value="<!--{$c_item|h}-->"
			name="<!--{$key|h}-->[]" />
		<!--{/foreach}-->
		<!--{else}-->
		<input name="<!--{$key|h}-->" type="hidden" value="<!--{$item|h}-->" />
		<!--{/if}-->
		<!--{/foreach}-->

		<h2>対応状況変更</h2>
		<div class="btn">
			<input type="hidden" name="change_status" value="" />
			<!--{foreach key=key item=item from=$arrORDERSTATUS}-->
			<a href="javascript:;" class="btn-normal"
				onclick="fnSelectCheckSubmit('<!--{$key}-->'); return false;"><span>
					<!--{$item}-->
			</span> </a>
			<!--{/foreach}-->
			<a href="javascript:;" class="btn-normal"
				onclick="fnSelectCheckSubmit('delete'); return false;"><span>削除</span>
			</a>
		</div>
		<span class="attention">※ <!--{$arrORDERSTATUS[$smarty.const.ORDER_CANCEL]}-->もしくは、削除に変更時には、在庫数を手動で戻して下さい。
		</span> <br /> <br />
		<h2>決済状況一括変更</h2>
		<div class="btn">
			<input name="sln_sub_mode" type="hidden" value="" /> <a
				href="javascript:;" class="btn-normal"
				onclick="slnSubmitSubMode('commit'); return false;"><span>一括売上</span>
			</a> <a href="javascript:;" class="btn-normal"
				onclick="slnSubmitSubMode('cancel'); return false;"><span>一括取消</span>
			</a> <a class="btn-normal" href="javascript:;"
				onclick="slnSubmitSubMode('reauth'); return false;"><span>一括再オーソリ</span>
			</a>
		</div>

		<!--{if $sln_msg != ""}-->
		<span class="attention"> <!--{$sln_msg}-->
		</span><br /> <br />
		<!--{/if}-->


		<h2>検索結果一覧</h2>
		<div class="btn">
			<span class="attention"> <!--検索結果数--> <!--{$tpl_linemax}-->件
			</span>&nbsp;が該当しました。
			<!--{if $smarty.const.ADMIN_MODE == '1'}-->
			<a href="javascript:;" class="btn-normal"
				onclick="fnModeSubmit('delete_all','',''); return false;"><span>検索結果をすべて削除</span>
			</a>
			<!--{/if}-->
		</div>
		<!--{if count($arrResults) > 0}-->

		<!--{include file=$tpl_pager}-->

		<table class="list center">
			<tr>
				<th>
                    <input type="checkbox" name="move_check" id="move_check"  onclick="eccube.checkAllBox(this, 'input[name=\'move[]\']')" />
				    <label for="move_check">選択</label>
				</th>
				<th>受注日</th>
				<th>注文番号</th>
				<th>お名前</th>
				<th>支払方法</th>
				<th>購入金額（円）</th>
				<th>入金日</th>
				<th>発送日</th>
				<th>対応状況</th>
				<th>決済状況</th>

			</tr>
			<!--{foreach from=$arrResults item=result}-->

			<tr style="background:<!--{$arrORDERSTATUS_COLOR[$result.status]}-->;">
				<td width="4%"><input name="move[]" type="checkbox"
					value="<!--{$result.order_id}-->"></td>
				<td width="9%">
					<!--{$result.create_date|sfDispDBDate:false}-->
				</td>
				<td width="6%"><a href="#"
					onclick="fnOpenWindow('./disp.php?order_id=<!--{$result.order_id}-->','order_disp','800','900'); return false;">
						<!--{$result.order_id}-->
				</a></td>
				<td width="14%">
					<!--{$result.order_name01|h}--> <!--{$result.order_name02|h}-->
				</td>
				<td width="15%">
					<!--{$result.payment_method|h}-->
				</td>
				<td class="right" width="11%">
					<!--{$result.total|number_format}-->
				</td>
				<td width="11%">
					<!--{if $result.payment_date != ""}--> <!--{$result.payment_date|sfDispDBDate:false}-->
					<!--{else}-->未入金<!--{/if}-->
				</td>
				<td width="11%">
					<!--{if $result.status eq 5}--> <!--{$result.commit_date|sfDispDBDate:false}-->
					<!--{else}-->未発送<!--{/if}-->
				</td>
				<td width="10%">
					<!--{$arrORDERSTATUS[$result.status]}-->
				</td>
				<td width="10%">
					<input type="hidden" name="sln_paystatus[]" value="<!--{$result.memo04}-->" />
					<!--{$arrPaymentStatus[$result.memo04]|h}-->
				</td>
			</tr>
			<!--{/foreach}-->
		</table>
		<!--{/if}-->
	</form>
	<!--{/if}-->
</div>
