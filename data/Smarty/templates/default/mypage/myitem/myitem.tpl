<section>
    <header class="l-header__inner">
        <a href="<!--{$smarty.const.TOP_URL}-->mypage/" aria-label="戻る" class="c-btn--header-nav"></a>
        <p class="c-header-title">マイアイテム</p>
    </header>
    <ul>
        <!--{foreach from=$arrProducts item=item}-->
        <li>
            <a href="/mypage/myitem/myitem_detail.php?product_id=<!--{$item.product.product_id}-->" class="c-item">
                <img src="http://localhost:8080/upload/save_image/2021/09/29/09291558_61540e96ab89a.jpg" alt="<!--{$item.product.name}--> 画像(1)" class="c-item__img"/>
                <div class="c-item__main">
                    <p class="c-item__title">タイトル<!--{$item.product.name|h}--></p>
                    <div class="c-item__status"><span class="status-unselected">ダミー：選択期限まであと2日</span><i class="c-item__<!--{if $item.product.status == 2}-->unpublished<!--{else}-->published<!--{/if}-->"></i><span class="c-item__request"><!--{$arrProduct.count_of_favorite|n2s|h}--></span></div>
                    <!--{if count($item.selection_edge_list) > 0}-->
                        選択待ち商品あり
                    <!--{else}-->
                    <!--{/if}-->
                </div>
            </a>
        </li>
        <!--{/foreach}-->

        <!--{*　未発送商品ありのデザイン
        <li>
            <a href="/user_data/myitem_detail.php" class="c-item">
                <img src="http://localhost:8080/upload/save_image/2021/09/29/09291558_61540e96ab89a.jpg" alt="<!--{$arrCustomerProduct.name|h}--> 画像(1)" class="c-item__img"/>
                <div class="c-item__main">
                    <p class="c-item__title">タイトル<!--{$arrCustomerProduct.name|h}--></p>
                    <div class="c-item__status"><span class="status-unshipped">未発送</span><i class="c-item__<!--{if $arrProduct.status == 2}-->unpublished<!--{else}-->published<!--{/if}-->"></i><span class="c-item__request"><!--{$arrProduct.count_of_favorite|n2s|h}--></span></div>
                </div>
            </a>
        </li>
        *}-->
    </ul>

</section>
