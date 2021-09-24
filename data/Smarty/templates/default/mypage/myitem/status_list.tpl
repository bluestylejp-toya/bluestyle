<section>
    <header class="l-header__inner u-mb">
        <a href="<!--{$smarty.const.TOP_URL}-->mypage/myitem/myitem.php" aria-label="戻る" class="c-btn--header-nav"></a>
        <p class="c-header-title">Chainの状況</p>
    </header>
    <ul>
        <!--{foreach from=$arrChainProductStatus item=chain}-->
            <a href="<!--{$smarty.const.TOP_URL}-->mypage/myitem/status.php?product_id=<!--{$chain.product.product_id|h}-->"
               class="c-item">
                <img src="<!--{$smarty.const.IMAGE_SAVE_URLPATH|h}--><!--{$chain.product.sub_large_image1|sfNoImageMainList|h}-->"
                     alt="<!--{$chain.product.name|h}--> 画像(1)" class="c-item__img"/>
                <div class="c-item__main">
                    <p class="c-item__title">タイトル<!--{$chain.product.name|h}--></p>
                    <p class="c-item__achievement">あと<!--{100-$chain.progress_percent}-->%</p>
                </div>
            </a>
        <!--{/foreach}-->
    </ul>
</section>
