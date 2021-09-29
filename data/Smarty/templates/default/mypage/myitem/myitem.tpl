<section>
    <header class="l-header__inner">
        <a href="<!--{$smarty.const.TOP_URL}-->mypage/" aria-label="戻る" class="c-btn--header-nav"></a>
        <p class="c-header-title">マイアイテム</p>
    </header>
    <ul>
        <li  data-modal_url="<!--{$smarty.const.TOP_URL}-->products/detail.php?product_id=9" class="c-item">
            <img src="http://localhost:8080/upload/save_image/2021/09/29/09291558_61540e96ab89a.jpg" alt="<!--{$arrCustomerProduct.name|h}--> 画像(1)" class="c-item__img"/>
            <div class="c-item__main">
                <p class="c-item__title">タイトル<!--{$arrCustomerProduct.name|h}--></p>
                <div class="c-item__status"><span class="status-unselected">選択期限まであと2日</span><i class="c-item__<!--{if $arrProduct.status == 2}-->unpublished<!--{else}-->published<!--{/if}-->"></i><span class="c-item__request"><!--{$arrProduct.count_of_favorite|n2s|h}--></span></div>
            </div>
        </li>
        <li class="c-item">
            <img src="http://localhost:8080/upload/save_image/2021/09/29/09291558_61540e96ab89a.jpg" alt="<!--{$arrCustomerProduct.name|h}--> 画像(1)" class="c-item__img"/>
            <div class="c-item__main">
                <p class="c-item__title">タイトル<!--{$arrCustomerProduct.name|h}--></p>
                <div class="c-item__status"><span class="status-unshipped">未発送</span><i class="c-item__<!--{if $arrProduct.status == 2}-->unpublished<!--{else}-->published<!--{/if}-->"></i><span class="c-item__request"><!--{$arrProduct.count_of_favorite|n2s|h}--></span></div>
            </div>
        </li>
        <li class="c-item">
            <img src="http://localhost:8080/upload/save_image/2021/09/29/09291558_61540e96ab89a.jpg" alt="<!--{$arrCustomerProduct.name|h}--> 画像(1)" class="c-item__img"/>
            <div class="c-item__main">
                <p class="c-item__title">タイトル<!--{$arrCustomerProduct.name|h}--></p>
                <div class="c-item__status"><span class="status-unselected">選択期限まであと2日</span><i class="c-item__<!--{if $arrProduct.status == 2}-->unpublished<!--{else}-->published<!--{/if}-->"></i><span class="c-item__request"><!--{$arrProduct.count_of_favorite|n2s|h}--></span></div>
            </div>
        </li>
    </ul>

</section>
