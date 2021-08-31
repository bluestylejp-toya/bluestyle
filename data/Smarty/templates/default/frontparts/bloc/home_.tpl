<!--{*
 * This file is part of EC-CUBE
 * トップページログイン前用のブロック
 *}-->


<!--{strip}-->
    <h2 class="c-heading--md">新着アイテム</h2>
    <ul class="l-item-list">
    <!--仮-->
    <!--{for $foo=1 to 12}-->
        <li><img src="https://placehold.jp/100x100.png" alt="<!--{$arrProduct.name|h}-->" loding="lazy" decoding="async"></li>
        <!--{/for}-->
    </ul>
    <!--{if count($arrNewItems) > 0}-->
    <!--{foreach from=$arrNewItems item=arrProduct name="new_items"}-->
    <!--{/foreach}-->
    <!--{/if}-->
<!--{/strip}-->
