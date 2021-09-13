<section>
    <header class="l-header__inner u-mb--0">
        <a href="<!--{$smarty.const.TOP_URL}-->mypage/myitem/myitem.php" aria-label="戻る" class="c-btn--header-nav"></a>
        <p class="c-header-title">マイアイテム</p>
    </header>
    <div class="l-header--item">
        <ul class="c-item-tab">
            <li class="c-item-tab__item --active" data-tab_nav="0">
                <a href="javascript:void(0)">リクエストしている</a>
            </li>
            <li class="c-item-tab__item" data-tab_nav="1">
                <a href="javascript:void(0)">リクエストされている</a>
            </li>
        </ul>
    </div>
    <!--/タブメニュー-->
    <div class="c-item-tab__content --active" data-tab_item="0">
        <div class="c-notification--secondary notification">リクエストを取り消しました</div>
        <ul data-modal="myitem">
            <li class="c-item--has-icon" data-modal_url="<!--{$smarty.const.TOP_URL}-->products/detail.php?product_id=9">
             <img src="<!--{$smarty.const.IMAGE_SAVE_URLPATH|h}--><!--{$arrCustomerProduct.sub_large_image1|sfNoImageMainList|h}-->" alt="<!--{$arrCustomerProduct.name|h}--> 画像(1)" class="c-item__img"/>
                <div class="c-item__main">
                    <p class="c-item__title"><!--{$arrCustomerProduct.name|h}--></p>
                    <p class="c-item__request"><!--{$arrCustomerProduct.count_of_favorite|n2s|h}--></p>
                </div>
            </li>
            <li class="c-item--has-icon" data-modal_url="<!--{$smarty.const.TOP_URL}-->products/detail.php?product_id=9">
             <img src="<!--{$smarty.const.IMAGE_SAVE_URLPATH|h}--><!--{$arrCustomerProduct.sub_large_image1|sfNoImageMainList|h}-->" alt="<!--{$arrCustomerProduct.name|h}--> 画像(1)" class="c-item__img"/>
                <div class="c-item__main">
                    <p class="c-item__title"><!--{$arrCustomerProduct.name|h}--></p>
                    <p class="c-item__request"><!--{$arrCustomerProduct.count_of_favorite|n2s|h}--></p>
                </div>
            </li>
        </ul>
    </div>
    <!--/マイアイテム-->
    <div class="c-item-tab__content" data-tab_item="1">
        <ul data-modal="requestitem">
            <li class="c-item" data-modal_url="<!--{$smarty.const.TOP_URL}-->products/detail.php?product_id=9">
             <img src="<!--{$smarty.const.IMAGE_SAVE_URLPATH|h}--><!--{$arrCustomerProduct.sub_large_image1|sfNoImageMainList|h}-->" alt="<!--{$arrCustomerProduct.name|h}--> 画像(1)" class="c-item__img"/>
                <div class="c-item__main">
                    <p class="c-item__title"><!--{$arrCustomerProduct.name|h}--></p>
                    <p class="c-item__request"><!--{$arrCustomerProduct.count_of_favorite|n2s|h}--></p>
                </div>
            </li>
        </ul>
    </div>
    <!--/マイアイテム-->
    <div class="c-modal" data-modal_mode="false">
        <button class="c-modal__close-btn" type="button">close</button>
        <div class="c-modal__inner">
            <header class="c-modal__inner__head"></header>
            <p class="c-modal__btn"> <button class="c-btn--primary" type="button">リクエストを取り消す</button></p>
            <div class="c-modal__inner__body"></div>
        </div>
    </div>
    <div class="c-modal__bg"></div>
    <!--/モーダル-->
</section>
<script>
    $(function(){
        //タブメニュー
        $('[data-tab_nav]').each(function(index){
            $(this).on('click', function(){
                $('[data-tab_nav]').removeClass('--active');
                $('[data-tab_item]').removeClass('--active');
                $(this).addClass('--active');

                $('[data-tab_item=' + $(this).data('tab_nav') + ']').addClass('--active');
            })
        });
        //モーダルのコントロール
        $('[data-modal_url]').on('click', function(){
            $this = $(this)
            $body = $('body')
            $modal = $('.c-modal');
            $('.c-modal__inner__head').empty();
            $('.c-modal__inner__body').empty();
            $url = $this.attr('data-modal_url')
            $mode = $this.closest('[data-modal]')
            $('[data-modal_mode]').attr('data-modal_mode', $mode.attr('data-modal'))
            $('.c-modal__inner__head').load( $url + ' .p-item-detail__head__img');
            $('.c-modal__inner__body').load( $url + ' .p-item-detail__body');

             // リクエストの取り消し
             // いいねの取り消し処理が必要
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
            toggleModal();
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
