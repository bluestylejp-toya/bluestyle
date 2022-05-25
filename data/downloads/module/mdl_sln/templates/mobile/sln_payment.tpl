<!--{* data/Smarty/templates/mobile/shopping/payment.tpl からのコピー開始 *}-->
    <form name="form1" id="form1" method="post" action="<!--{$tpl_url}-->">
        <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->">
        <input type="hidden" name="mode" value="next">
        <input type="hidden" name="uniqid" value="<!--{$tpl_uniqid}-->">
<!--{* data/Smarty/templates/mobile/shopping/payment.tpl からのコピー終了 *}-->

        <!--{foreach from=$arrForm item=data key=key}-->
        <input type="hidden" name="<!--{$key}-->" value="<!--{$data.value|h}-->" />
        <!--{/foreach}-->

        <div id="payment_form">
        <!--{if $tpl_form_bloc_path != ""}-->
            <!--{include file=$tpl_form_bloc_path}-->
        <!--{/if}-->
        </div>

<!--{* data/Smarty/templates/mobile/shopping/payment.tpl からのコピー開始 *}-->
    </form>
<!--{* data/Smarty/templates/mobile/shopping/payment.tpl からのコピー終了 *}-->
