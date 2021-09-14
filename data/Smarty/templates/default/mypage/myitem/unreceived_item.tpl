<section>
    <header class="l-header__inner">
        <a href="<!--{$smarty.const.TOP_URL}-->mypage/myitem/myitem.php" aria-label="戻る" class="c-btn--header-nav"></a>
        <p class="c-header-title">受け取り待ちのアイテム</p>
    </header>
    <div class="c-notification--gradient notification">交換を完了しました</div>
    <ul>
        <li  data-modal_url="<!--{$smarty.const.TOP_URL}-->products/detail.php?product_id=9" class="c-item">
            <img src="<!--{$smarty.const.IMAGE_SAVE_URLPATH|h}--><!--{$arrCustomerProduct.sub_large_image1|sfNoImageMainList|h}-->" alt="<!--{$arrCustomerProduct.name|h}--> 画像(1)" class="c-item__img"/>
            <div class="c-item__main">
                <p class="c-item__title">タイトル<!--{$arrCustomerProduct.name|h}--></p>
                <p class="c-item__achievement --active">発送待ち</p>
            </div>
        </li>
        <li class="c-item">
            <img src="<!--{$smarty.const.IMAGE_SAVE_URLPATH|h}--><!--{$arrCustomerProduct.sub_large_image1|sfNoImageMainList|h}-->" alt="<!--{$arrCustomerProduct.name|h}--> 画像(1)" class="c-item__img"/>
            <div class="c-item__main">
                <p class="c-item__title">タイトル<!--{$arrCustomerProduct.name|h}--></p>
                <p class="c-item__achievement">発送済み</p>
            </div>
        </li>
    </ul>
    <div class="c-modal" data-modal_mode="false">
        <button class="c-modal__close-btn" type="button">close</button>
        <div class="c-modal__inner">
            <header class="c-modal__inner__head"></header>
            <p class="c-modal__btn"> <button class="c-btn--primary" type="button">商品を受け取りました</button></p>
            <div class="c-modal__inner__body"></div>
        </div>
    </div>
    <div class="c-modal__bg"></div>
    <!--/モーダル-->
</section>

<script>
$(function(){
    //モーダルのコントロール
    $('[data-modal_url]').on('click', function(){
        $this = $(this)
        $body = $('body')
        $modal = $('.c-modal');
        $('.c-modal__inner__head').empty();
        $('.c-modal__inner__body').empty();
        $url = $this.attr('data-modal_url');
        $('.c-modal__inner__head').load( $url + ' .p-item-detail__head__img');
        $('.c-modal__inner__body').load( $url + ' .p-item-detail__body');
        $('.c-modal__btn').on('click', function(){
            $body.find(".notification").fadeIn(300,
                function() {
                    setTimeout(function(){
                    $body.find(".notification").fadeOut();
                    $('.c-modal').attr('data-modal_mode', 'false').removeClass('--active')
                    $('body').removeClass('--overflow-hidden');
                    $('.c-modal').on("transitionend", function() {
                        if(!$('.c-modal').hasClass('--active')){
                            $('.c-modal__inner__head').empty();
                            $('.c-modal__inner__body').empty();
                        }
                    })
                    $this.remove()
                }, 1000);
            })
        })
        toggleModal()
    })

    function toggleModal(){
        $('.c-modal').addClass('--active')
        $('body').addClass('--overflow-hidden');
        $('.c-modal__bg, .c-modal__close-btn').on('click', function(){
            $('.c-modal').attr('data-modal_mode', 'false').removeClass('--active')
            $('body').removeClass('--overflow-hidden');
            $('.c-modal').on("transitionend", function() {
                if(!$('.c-modal').hasClass('--active')){
                    $('.c-modal__inner__head').empty();
                    $('.c-modal__inner__body').empty();
                }
            })
        })
    }
})
</script>
