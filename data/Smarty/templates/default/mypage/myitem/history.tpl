<section>
    <header class="l-header__inner">
        <a href="<!--{$smarty.const.TOP_URL}-->user_data/myitem.php" aria-label="戻る" class="c-btn--header-nav"></a>
        <p class="c-header-title">交換済みのアイテム</p>
    </header>
     <ul>
        <li>
            <a href="<!--{$smarty.const.TOP_URL}-->user_data/history_detail.php?product_id=1" class="c-item">
                <img src="<!--{$smarty.const.IMAGE_SAVE_URLPATH|h}--><!--{$arrCustomerProduct.sub_large_image1|sfNoImageMainList|h}-->" alt="<!--{$arrCustomerProduct.name|h}--> 画像(1)" class="c-item__img"/>
                <div class="c-item__main">
                    <p class="c-item__title">タイトル<!--{$arrCustomerProduct.name|h}--></p>
                </div>
            </a>
        </li>
        <li>
            <a href="<!--{$smarty.const.TOP_URL}-->user_data/history_detail.php?product_id=1" class="c-item">
                <img src="<!--{$smarty.const.IMAGE_SAVE_URLPATH|h}--><!--{$arrCustomerProduct.sub_large_image1|sfNoImageMainList|h}-->" alt="<!--{$arrCustomerProduct.name|h}--> 画像(1)" class="c-item__img"/>
                <div class="c-item__main">
                    <p class="c-item__title">タイトル<!--{$arrCustomerProduct.name|h}--></p>
                </div>
            </a>
        </li>
    </ul>
</section>
