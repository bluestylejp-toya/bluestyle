<section>
    <header class="l-header__inner">
        <a href="<!--{$smarty.const.TOP_URL}-->mypage/" aria-label="戻る" class="c-btn--header-nav"></a>
        <p class="c-header-title">出品アイテム</p>
    </header>
    <p><!--{$tpl_linemax}-->個の登録アイテムがあります</p>
    <ul>
        <!--{foreach from=$arrProducts item=item}-->
        <li class="c-myitem">
            <a href="<!--{$smarty.const.TOP_URL}-->mypage/myitem/myitem_detail.php?product_id=<!--{$item.product.product_id|h}-->" class="c-myitem__main">
                <figure class="c-myitem__img<!--{if $item.progress_percent == 100}--><!--{/if}-->"><img src="<!--{$smarty.const.IMAGE_SAVE_URLPATH}--><!--{$item.product.sub_large_image1|sfNoImageMainList|h}-->" alt="<!--{$item.product.name|h}--> 画像(1)" /></figure>
                <div class="c-myitem__content">
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
			<!--{if $item.progress_percent != 100}-->
			<a href="<!--{$smarty.const.TOP_URL}-->mypage/item_edit.php?mode=pre_edit&product_id=<!--{$item.product.product_id|h}-->" class="c-myitem__edit"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M3 17.25V21h3.75L17.81 9.94l-3.75-3.75L3 17.25zM20.71 7.04c.39-.39.39-1.02 0-1.41l-2.34-2.34a.9959.9959 0 00-1.41 0l-1.83 1.83 3.75 3.75 1.83-1.83z" fill="#9DA4B0"></path></svg></a>
			<!--{/if}-->
        </li>
        <!--{/foreach}-->
    </ul>
    <!--▼ページナビ-->
    <div class="c-pagination"><!--{$tpl_strnavi}--></div>
    <!--▲ページナビ-->
    <form name="form1" id="form1" method="get" action="?">
        <input type="hidden" name="pageno" value="<!--{$tpl_pageno|h}-->" />
    </form>
</section>
