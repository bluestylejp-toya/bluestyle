<!--{$name}--> 様

いつもChainのご利用誠にありがとうございます。
出品していただいたアイテムに<!--{$request_sum_uu}-->個の「ほしい」がありました。

<!--{foreach key=key item=val from=$requestItemByCustomer}-->
<!--{if $key >= $disp_mypage_link_count}-->
    <!--{break}-->
<!--{/if}-->
アイテム名：<!--{$val['source_product_name']|h}-->
URL：<!--{$smarty.const.HTTPS_URL}-->products/detail.php?product_id=<!--{$val['source_product_id']|h}-->

<!--{/foreach}-->
<!--{if $requestItemCount >= $disp_mypage_link_count + 1}-->
もっと見る…（出品アイテム一覧：<!--{$smarty.const.HTTPS_URL}-->mypage/myitem/myitem_list.php
<!--{/if}-->

<!--{$tpl_footer}-->