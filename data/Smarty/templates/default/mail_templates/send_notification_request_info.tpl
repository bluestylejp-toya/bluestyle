<!--{$name}-->
<!--{$kana}-->
<!--{$nickname}-->

<!--{foreach key=key item=val from=$requestItemByCustomer}-->
    <!--{if $key >= 10}-->
        <!--{break}-->
    <!--{/if}-->
    <!--{var_dump($val)}-->
<!--{/foreach}-->

<!--{if $requestItemCount >= 10}-->
<!--{/if}-->