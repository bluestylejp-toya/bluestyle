<section>
    <header class="l-header__inner">
        <a href="<!--{$smarty.const.TOP_URL}-->user_data/myitem.php" aria-label="戻る" class="c-btn--header-nav"></a>
        <p class="c-header-title">交換済みのアイテム名</p>
    </header>
    <div class="c-achievement">
        <h1  class="c-achievement__heading">このChainは<br>交換が完了しています</h1>
    </div>
     <h2 class="c-heading--lg u-mb--1">あなたの交換</h2>
    <div class="c-card--blue u-mb--2">
        <p class="c-card__title">あなた</p>
        <img src="<!--{$smarty.const.IMAGE_SAVE_URLPATH|h}--><!--{$arrCustomerProduct.sub_large_image1|sfNoImageMainList|h}-->" alt="<!--{$arrCustomerProduct.name|h}--> 画像(1)" class="c-item__img"/>
        <div class="c-item__main">
            <p class="c-item__title">タイトル<!--{$arrCustomerProduct.name|h}--></p>
            <p class="c-item__request">12</p>
        </div>
    </div>
    <div class="u-text--center">
        <svg width="68" height="61" viewBox="0 0 68 61" fill="none" xmlns="http://www.w3.org/2000/svg" class="select_status">
            <path d="M9.99219 21.3182V40.4266H1.20508L21.9961 59.7303L42.7871 40.4266H34V20.3037H25.2129L46.0039 1L66.7949 20.3037H58.0078V39.4121" stroke="url(#paint0_linear)" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
            <defs>
                <linearGradient id="paint0_linear" x1="1.20508" y1="59.7303" x2="67.308" y2="59.147" gradientUnits="userSpaceOnUse">
                <stop stop-color="#33CCFF"/>
                <stop offset="0.45" stop-color="#67CC9D"/>
                <stop offset="0.83" stop-color="#8FCC51"/>
                <stop offset="1" stop-color="#9FCC33"/>
            </linearGradient>
            </defs>
        </svg>
    </div>
    <div class="c-card--white u-mb--4">
        <p class="c-card__title">交換相手</p>
        <img src="<!--{$smarty.const.IMAGE_SAVE_URLPATH|h}--><!--{$arrCustomerProduct.sub_large_image1|sfNoImageMainList|h}-->" alt="<!--{$arrCustomerProduct.name|h}--> 画像(1)" class="c-item__img"/>
        <div class="c-item__main">
            <p class="c-item__title">タイトル<!--{$arrCustomerProduct.name|h}--></p>
            <p class="c-item__request">12</p>
        </div>
    </div>
    <h2 class="c-heading--lg u-mb--1">その他のアイテム</h2>
    <ul class="u-mb--4">
        <li>
            <a href="<!--{$smarty.const.TOP_URL}-->user_data/status.php?product_id=1" class="c-item">
                <img src="<!--{$smarty.const.IMAGE_SAVE_URLPATH|h}--><!--{$arrCustomerProduct.sub_large_image1|sfNoImageMainList|h}-->" alt="<!--{$arrCustomerProduct.name|h}--> 画像(1)" class="c-item__img"/>
                <div class="c-item__main">
                    <p class="c-item__title">タイトル<!--{$arrCustomerProduct.name|h}--></p>
                </div>
            </a>
        </li>
        <li>
            <a href="<!--{$smarty.const.TOP_URL}-->user_data/status.php?product_id=1" class="c-item">
                <img src="<!--{$smarty.const.IMAGE_SAVE_URLPATH|h}--><!--{$arrCustomerProduct.sub_large_image1|sfNoImageMainList|h}-->" alt="<!--{$arrCustomerProduct.name|h}--> 画像(1)" class="c-item__img"/>
                <div class="c-item__main">
                    <p class="c-item__title">タイトル<!--{$arrCustomerProduct.name|h}--></p>
                </div>
            </a>
        </li>
    </ul>
</section>
