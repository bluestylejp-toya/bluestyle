<!--{* data/Smarty/templates/default/shopping/payment.tpl からのコピー開始 *}-->
<div id="undercolumn">
    <div id="undercolumn_shopping">
        <p class="flow_area"><img src="<!--{$TPL_URLPATH}-->img/picture/img_flow_02.jpg" alt="購入手続きの流れ" /></p>
        <h2 class="title">
        <!--{$tpl_title|h}-->
        </h2>

        <form name="form1" id="form1" method="post" action="<!--{$tpl_url}-->" autocomplete="off">
        <input type="hidden" name="mode" value="register" />
        <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
        <input type="hidden" name="uniqid" value="<!--{$tpl_uniqid}-->" />
<!--{* data/Smarty/templates/default/shopping/payment.tpl からのコピー終了 *}-->

        <!--{foreach from=$arrForm item=data key=key}-->
        <input type="hidden" name="<!--{$key}-->" value="<!--{$data.value|h}-->" />
        <!--{/foreach}-->

        <div id="payment_form">
        <!--{if $tpl_form_bloc_path != ""}-->
            <!--{include file=$tpl_form_bloc_path}-->
        <!--{/if}-->
        </div>

<!--{* data/Smarty/templates/default/shopping/payment.tpl からのコピー開始 *}-->
        </form>
    </div>
</div>
<!--{* data/Smarty/templates/default/shopping/payment.tpl からのコピー終了 *}-->