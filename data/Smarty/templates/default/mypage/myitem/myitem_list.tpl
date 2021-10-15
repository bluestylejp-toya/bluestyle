<section>
    <header class="l-header__inner">
        <a href="<!--{$smarty.const.TOP_URL}-->mypage/" aria-label="戻る" class="c-btn--header-nav"></a>
        <p class="c-header-title">マイアイテム</p>
    </header>
    <ul>
        <!--{foreach from=$arrProducts item=item}-->
        <li>
            <a href="/mypage/myitem/myitem_detail.php?product_id=<!--{$item.product.product_id|h}-->" class="c-item">
                <img src="<!--{$smarty.const.IMAGE_SAVE_URLPATH}--><!--{$item.product.sub_large_image1|sfNoImageMainList|h}-->" alt="<!--{$item.product.name|h}--> 画像(1)" class="c-item__img"/>
                <div class="c-item__main">
                    <p class="c-item__title"><!--{$item.product.name|h}--></p>
                    <div class="c-item__status">
                        <!--{*<span class="status-unselected">ダミー：選択期限まであと2日</span>*}-->
                        <i class="c-item__<!--{if $item.product.status == 2}-->unpublished<!--{else}-->published<!--{/if}-->"></i><span class="c-item__request"><!--{$item.product.count_of_favorite|n2s|h}--></span></div>
                    <!--{if count($item.selection_edge_detail) > 0}-->
                        選択待ち商品あり
                    <!--{else}-->
                    <!--{/if}-->
                </div>
            </a>
        </li>
        <!--{/foreach}-->
    </ul>

</section>
