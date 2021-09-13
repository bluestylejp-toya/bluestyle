<section>
    <header class="l-header__inner">
        <a href="<!--{$smarty.const.TOP_URL}-->mypage/myitem/myitem.php" aria-label="戻る" class="c-btn--header-nav"></a>
        <p class="c-header-title">選択待ちのアイテム</p>
    </header>
    <h2 class="c-heading--lg u-mb--1 u-text--center">おめでとうございます！<br>もうすぐChainが成立しそうです。</h2>
    <p class="u-mb--4">交換するアイテムを選んで、Chain成立してください。</p>
    <ul>
        <li>
            <a href="<!--{$smarty.const.TOP_URL}-->mypage/myitem/status.php?product_id=1" class="c-item">
                <img src="<!--{$smarty.const.IMAGE_SAVE_URLPATH|h}--><!--{$arrCustomerProduct.sub_large_image1|sfNoImageMainList|h}-->" alt="<!--{$arrCustomerProduct.name|h}--> 画像(1)" class="c-item__img"/>
                <div class="c-item__main">
                    <p class="c-item__title">タイトル<!--{$arrCustomerProduct.name|h}--></p>
                    <p class="c-item__achievement">受け取り</p>
                </div>
            </a>
        </li>
        <li>
            <a href="<!--{$smarty.const.TOP_URL}-->mypage/myitem/status.php?product_id=1" class="c-item">
                <img src="<!--{$smarty.const.IMAGE_SAVE_URLPATH|h}--><!--{$arrCustomerProduct.sub_large_image1|sfNoImageMainList|h}-->" alt="<!--{$arrCustomerProduct.name|h}--> 画像(1)" class="c-item__img"/>
                <div class="c-item__main">
                    <p class="c-item__title">タイトル<!--{$arrCustomerProduct.name|h}--></p>
                    <p class="c-item__achievement">あと3時間</p>
                </div>
            </a>
        </li>
        <li>
            <a href="<!--{$smarty.const.TOP_URL}-->mypage/myitem/status.php?product_id=1" class="c-item">
                <img src="<!--{$smarty.const.IMAGE_SAVE_URLPATH|h}--><!--{$arrCustomerProduct.sub_large_image1|sfNoImageMainList|h}-->" alt="<!--{$arrCustomerProduct.name|h}--> 画像(1)" class="c-item__img"/>
                <div class="c-item__main">
                    <p class="c-item__title">タイトル<!--{$arrCustomerProduct.name|h}--></p>
                    <p class="c-item__achievement">あと2時間</p>
                </div>
            </a>
        </li>
    </ul>
</section>
