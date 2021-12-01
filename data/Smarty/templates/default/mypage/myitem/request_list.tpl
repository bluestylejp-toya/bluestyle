<section>
    <header class="l-header__inner">
        <a href="<!--{$smarty.const.TOP_URL}-->mypage/" aria-label="戻る" class="c-btn--header-nav"></a>
        <p class="c-header-title">Chain の状況</p>
    </header>
    <ul>
        <li>
            <a href="/mypage/myitem/myitem_detail.php?product_id=<!--{$item.product.product_id|h}-->" class="c-item">
                <figure class="<!--{if $item.progress_percent == 100}-->chained<!--{/if}-->"><img src="<!--{$smarty.const.IMAGE_SAVE_URLPATH}--><!--{$item.product.sub_large_image1|sfNoImageMainList|h}-->" alt="<!--{$item.product.name|h}--> 画像(1)" class="c-item__img"/></figure>
                <div class="c-item__main">
                    <p class="c-item__title">アイテム名<!--{$item.product.name|h}--></p>
                </div>
            </a>
        </li>
        <li>
            <a href="/mypage/myitem/myitem_detail.php?product_id=<!--{$item.product.product_id|h}-->" class="c-item">
                <figure class="<!--{if $item.progress_percent == 100}-->chained<!--{/if}-->"><img src="<!--{$smarty.const.IMAGE_SAVE_URLPATH}--><!--{$item.product.sub_large_image1|sfNoImageMainList|h}-->" alt="<!--{$item.product.name|h}--> 画像(1)" class="c-item__img"/></figure>
                <div class="c-item__main">
                    <p class="c-item__title">アイテム名<!--{$item.product.name|h}--></p>
                    <div class="c-item__status">
                        <span class="status-proccessing">Chainまで 100%</span>
                        </div>
                </div>
            </a>
        </li>
        <li>
            <a href="/mypage/myitem/myitem_detail.php?product_id=<!--{$item.product.product_id|h}-->" class="c-item">
                <figure class="<!--{if $item.progress_percent == 100}-->chained<!--{/if}-->"><img src="<!--{$smarty.const.IMAGE_SAVE_URLPATH}--><!--{$item.product.sub_large_image1|sfNoImageMainList|h}-->" alt="<!--{$item.product.name|h}--> 画像(1)" class="c-item__img"/></figure>
                <div class="c-item__main">
                    <p class="c-item__title">アイテム名<!--{$item.product.name|h}--></p>
                    <div class="c-item__status">
                        <span class="status-unshipped">受け取りボタンを押す</span>
                        </div>
                </div>
            </a>
        </li>
    </ul>
    <!--▼ページナビ-->
    <div class="c-pagination"><!--{$tpl_strnavi}--></div>
    <!--▲ページナビ-->
    <form name="form1" id="form1" method="get" action="?">
        <input type="hidden" name="pageno" value="<!--{$tpl_pageno|h}-->" />
    </form>
</section>
