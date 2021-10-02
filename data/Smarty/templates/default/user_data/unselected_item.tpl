<section>
    <header class="l-header__inner">
        <a href="<!--{$smarty.const.TOP_URL}-->user_data/myitem_detail.php" aria-label="戻る" class="c-btn--header-nav"></a>
    </header>
    <h1 class="c-heading--status u-text--center u-mb--2">もうすぐChainが成立しそうです。</h1>
    <p class="u-mb--1 u-color--gray">現在、TaroTaroさんは3つのアイテムをリクエストしています。交換するアイテムをひとつ選んでください。選択には制限時間があります。時間をすぎるとランダムに確定されます。</p>
    <p class="c-box__gray u-mb--3">あと20時間</p>
    <h1 class="c-heading--sm">あなたのアイテム</h1>
    <div class="c-card--blue u-mb--2">
        <img src="http://localhost:8080/upload/save_image/2021/09/29/09291558_61540e96ab89a.jpg" alt="<!--{$arrCustomerProduct.name|h}--> 画像(1)" class="c-item__img"/>
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
    <ul class="u-mb--4">
        <li class="c-card">
            <label class="c-card__radio-button"><input type="radio" name="my_product" value="<!--{$arrProduct.product_id|h}-->">
                <div class="c-card__main">
                <img src="http://localhost:8080/upload/save_image/2021/09/29/09291558_61540e96ab89a.jpg" alt="<!--{$arrProduct.name|h}-->" decoding="async" loading="lazy" class="c-card__img"/>
                    <p>aaaaaaaaaa<!--{$arrProduct.name|h}--></p>
                    <div class="c-item__request"><!--{$arrProduct.count_of_favorite|n2s|h}--></div>
                </div>
            </label>
            <button type="button" class="c-card__detail-btn" data-page_url="<!--{$smarty.const.TOP_URL}-->products/detail.php?product_id=4">詳細</button>
        </li>
        <li class="c-card">
            <label class="c-card__radio-button"><input type="radio" name="my_product" value="<!--{$arrProduct.product_id|h}-->">
                <div class="c-card__main">
                <img src="http://localhost:8080/upload/save_image/2021/09/29/09291558_61540e96ab89a.jpg" alt="<!--{$arrProduct.name|h}-->" decoding="async" loading="lazy" class="c-card__img"/>
                    <p>sssssssss<!--{$arrProduct.name|h}--></p>
                    <div class="c-item__request"><!--{$arrProduct.count_of_favorite|n2s|h}--></div>
                </div>
            </label>
            <button type="button" class="c-card__detail-btn" data-page_url="<!--{$smarty.const.TOP_URL}-->products/detail.php?product_id=4">詳細</button>
        </li>
    </ul>
    <p><a href="" class="c-btn--primary">決定する</a></p>
    <div class="c-modal" data-modal_mode="false">
        <button class="c-modal__close-btn" type="button">close</button>
        <div class="c-modal__inner"></div>
    </div>
    <div class="c-modal__bg"></div>
</section>
<script>
const $detailShowBtn = $('.c-card__detail-btn');
$detailShowBtn.each(function() {
    $(this).on('click', function(){
        $('.c-modal').attr('data-modal_mode', 'detail');

        $('.c-modal__inner').load( $(this).attr('data-page_url') + ' .p-item-detail');
        toggleModal();
    })
})

function toggleModal(){
    $('.c-modal').addClass('--active')
    $('body').addClass('--overflow-hidden');
    $('.c-modal__bg, .c-modal__close-btn').on('click', function(){
        $('.c-modal').attr('data-modal_mode', 'false').removeClass('--active')
        $('body').removeClass('--overflow-hidden');
        $('.c-modal__inner').empty();
    })
}
</script>
