<section>
    <header class="l-header__inner">
        <a href="<!--{$smarty.const.TOP_URL}-->mypage/" aria-label="戻る" class="c-btn--header-nav"></a>
        <p class="c-header-title">マイアイテム</p>
    </header>
    <ul>
        <!--{foreach from=$arrProducts item=item}-->
        <li>
            <a href="/mypage/myitem/myitem_detail.php?product_id=<!--{$item.product.product_id|h}-->" class="c-item">
                <figure class="<!--{if $item.progress_percent == 100}-->chained<!--{/if}-->"><img src="<!--{$smarty.const.IMAGE_SAVE_URLPATH}--><!--{$item.product.sub_large_image1|sfNoImageMainList|h}-->" alt="<!--{$item.product.name|h}--> 画像(1)" class="c-item__img"/></figure>
                <div class="c-item__main">
                    <p class="c-item__title"><!--{$item.product.name|h}--></p>
                    <div class="c-item__status">

                        <!--{*<span class="status-unselected">ダミー：選択期限まであと2日</span>*}-->
                        <!--{if count($item.selection_edge_detail) > 0}-->
                            <span class="status-unselected">選択が必要な商品がございます</span>
                        <!--{elseif $item.progress_percent > 1 and $item.progress_percent < 100}-->
                            Chainまで<!--{100-$item.progress_percent}-->%
                        <!--{elseif $item.progress_percent == 100}-->
                            <span class="status-chained">Chain成立</span>
                        <!--{/if}-->
                        <i class="c-item__<!--{if $item.product.status == 2}-->unpublished<!--{else}-->published<!--{/if}-->"></i><span class="c-item__request"><!--{$item.product.count_of_favorite|n2s|h}--></span></div>
                </div>
            </a>
        </li>
        <!--{/foreach}-->
    </ul>
    <!--▼ページナビ-->
    <div class="c-pagination"><!--{$tpl_strnavi}--></div>
    <!--▲ページナビ-->

</section>
