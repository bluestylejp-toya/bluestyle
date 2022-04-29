<section>
    <aside class="c-alert--yellow">
        <h2 class="c-alert__title">ご注意ください</h2>
        <p>現在、出品可能なアイテムのサイズは、ヤマト運輸のネコポスのサイズ（31.2cm x 22.8cm x 2.5cm：1kg）までに制限させていただいています。</p>
    </aside>
    <p class="l-header--btn"><a href="<!--{$smarty.const.HTTPS_URL}-->mypage/item_edit.php" class="c-btn--gradient">
            <svg width="15" height="14" viewBox="0 0 15 14" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M14.1279 8H8.12793V14H6.12793V8H0.12793V6H6.12793V0H8.12793V6H14.1279V8Z" fill="white"/>
            </svg>
            出品する</a></p>
    <div id="mycontents_area">
        <form name="form1" id="form1" method="post" action="?">
            <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->"/>
            <input type="hidden" name="pageno" value="<!--{$tpl_pageno}-->"/>
            <input type="hidden" name="mode" value=""/>
            <h2 class="c-heading--sm">アイテム</h2>
            <!--{if $tpl_linemax > 0}-->
                <ul>
                    <!--{foreach from=$arrProducts item="item"}-->
                    <li>
                        <a href="item_edit.php?mode=pre_edit&product_id=<!--{$item.product.product_id|u|h}-->"
                           class="c-item--has-icon --edit">
                            <figure class="<!--{if $item.progress_percent == 100}-->chained<!--{/if}-->"><img
                                        src="<!--{$smarty.const.IMAGE_SAVE_URLPATH}--><!--{$item.product.sub_large_image1|sfNoImageMainList|h}-->"
                                        alt="<!--{$item.product.name|h}--> 画像(1)" class="c-item__img"/></figure>
                            <div class="c-item__main">
                                <p class="c-item__title"><!--{$item.product.name|h}--></p>
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
