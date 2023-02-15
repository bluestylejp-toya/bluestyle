<section>
    <div id="mycontents_area">
        <p><!--{$tpl_linemax}-->個のアイテムを出品しています。</p>
        <form name="form1" id="form1" method="post" action="?">
            <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->"/>
            <input type="hidden" name="pageno" value="<!--{$tpl_pageno}-->"/>
            <input type="hidden" name="mode" value=""/>
            <!--{if $tpl_linemax > 0}-->
            <ul class="c-list-item__main_ul">
                    <!--{foreach from=$arrProducts item="item"}-->
                    <li>
                        <a href="item_edit.php?mode=pre_edit&product_id=<!--{$item.product.product_id|u|h}-->"
                           class="c-item--has-icon --edit" style="background: none;">
                            <figure class="c-list-item__img <!--{if $item.progress_percent == 100}-->chained<!--{/if}-->"><img
                                        src="<!--{$smarty.const.IMAGE_SAVE_URLPATH}--><!--{$item.product.sub_large_image1|sfNoImageMainList|h}-->"
                                        alt="<!--{$item.product.name|h}--> 画像(1)" /></figure>
                            <div class="c-item__main">
                                <h3 class="c-item__title"><!--{$item.product.name|h}--></h3>
                                <div class="c-item__status">
                                    <!--{*<span class="status-unselected">ダミー：選択期限まであと2日</span>*}-->
                                    <!--{if count($item.selection_edge_detail) > 0}-->
                                    <span class="status-unselected">選択が必要な商品がございます</span>
                                    <!--{elseif $item.progress_percent > 1 and $item.progress_percent < 100}-->
                                    Chainまで<!--{100-$item.progress_percent}--> %
                                    <!--{elseif $item.progress_percent == 100}-->
                                    <span class="status-chained">Chain成立</span>
                                    <!--{/if}-->
                                    <i class="c-item__<!--{if $item.product.status == 2}-->unpublished<!--{else}-->published<!--{/if}-->"></i>
                                    <span class="c-item__request"><!--{$item.product.count_of_favorite|n2s|h}--></span>
                                </div>
                                <p class="c-list-item__description"><!--{if $item.product.sub_title1}--><!--{$item.product.sub_title1|mb_substr:0:36|h|nl2br}--><!--{if $item.product.sub_title1|mb_strlen > 36}-->...<!--{/if}--><!--{/if}--></p>
                                <p class="c-list-item__editicon">編集</p>
                            </div>
                        </a>
                    </li>
                    <!--{/foreach}-->
                </ul>

                <!--▼ページナビ-->
                <div class="c-pagination"><!--{$tpl_strnavi}--></div>
            <!--{else}-->
                <p>アイテムが登録されておりません。</p>
            <!--{/if}-->
    </div>
</section>
