<!--{*
 * This file is part of EC-CUBE
 *
 * Copyright(c) EC-CUBE CO.,LTD. All Rights Reserved.
 *
 * http://www.ec-cube.co.jp/
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
 *}-->

<script type="text/javascript">//<![CDATA[
    // 規格2に選択肢を割り当てる。
    function fnSetClassCategories(form, classcat_id2_selected) {
        var $form = $(form);
        var product_id = $form.find('input[name=product_id]').val();
        var $sele1 = $form.find('select[name=classcategory_id1]');
        var $sele2 = $form.find('select[name=classcategory_id2]');
        eccube.setClassCategories($form, product_id, $sele1, $sele2, classcat_id2_selected);
    }
//]]></script>
<section>
    <header class="l-header__inner u-mb--0">
        <a href="<!--{$smarty.const.TOP_URL}-->products/list.php" aria-label="戻る" class="c-btn--header-nav"></a>
        <p class="c-header-title"><!--{$arrProduct.name|h}--></p>
    </header>
    <!--{if $tpl_my_product}--><div class="c-message--primary u-mb--0">出品中のアイテムです</div><!--{/if}-->
    <div class="p-item-detail favorite_area<!--{if $is_favorite}--> registered_favorite<!--{/if}-->">
        <div class="c-item-kv p-item-detail__kv">
            <!--{assign var=key value="sub_large_image1"}-->
            <!--★画像★-->

            <div data-img_id="0" class="c-item-kv__inner"><img src="<!--{$arrFile[$key].filepath|h}-->" width="<!--{$arrFile[$key].width}-->" height="<!--{$arrFile[$key].height}-->" alt="<!--{$arrProduct.name|h}-->" class="c-item-kv__img" /></div>
            <!--★お気に入り登録★-->
            <!--{if $smarty.const.OPTION_FAVORITE_PRODUCT == 1 && $tpl_login === true && !$tpl_my_product}-->

                <!--{assign var=add_favorite value="add_favorite`$product_id`"}-->
                <button type="button" id="request" class="c-btn--request p-item-detail__request-btn" data-product_id="<!--{$arrProduct.product_id|h}-->">
                <svg class="likeButton" width="150px" height="150px" viewBox="0 0 500 500">
                <g class="particleLayer">
                    <circle fill="#2A7DA7" cx="130" cy="126.5" r="12.5"/>
                    <circle fill="#009FCF" cx="411" cy="313.5" r="12.5"/>
                    <circle fill="#FD0000" cx="279" cy="86.5" r="12.5"/>
                    <circle fill="#79A52B" cx="155" cy="390.5" r="12.5"/>
                    <circle fill="#FFDD00" cx="89" cy="292.5" r="10.5"/>
                    <circle fill="#34B1E2" cx="414" cy="282.5" r="10.5"/>
                    <circle fill="#34B1E2" cx="115" cy="149.5" r="10.5"/>
                    <circle fill="#FF7878" cx="250" cy="80.5" r="10.5"/>
                    <circle fill="#FFAF33" cx="78" cy="261.5" r="10.5"/>
                    <circle fill="#96D8E9" cx="182" cy="402.5" r="10.5"/>
                    <circle fill="#FFDD00" cx="401.5" cy="166" r="13"/>
                    <circle fill="#FFAF33" cx="379" cy="141.5" r="10.5"/>
                    <circle fill="#FD0000" cx="327" cy="397.5" r="10.5"/>
                    <circle fill="#FF7878" cx="296" cy="392.5" r="10.5"/>
                </g>
                <path class="heart" d="M250,187.4c-31.8-47.8-95.5-19.8-95.5,32.2c0,35.2,31.8,60.3,55.7,79.2c24.9,19.7,31.8,23.9,39.8,31.8 c7.9-7.9,14.6-12.6,39.8-31.8c24.3-18.5,55.7-44.4,55.7-79.6C345.5,167.6,281.8,139.7,250,187.4z" fill="#fff"/>
                </svg>
                <span class="label"><!--{if $is_favorite}-->済<!--{else}-->欲しい<!--{/if}--></span>
                </button>
                <script>
                $('.favorite_area #request').init_favorite_area(<!--{$smarty.const.TRANSACTION_ID_NAME|@json_encode}-->, <!--{$transactionid|@json_encode}-->).on('click', function(){
                    $this = $(this);
                    if($('.favorite_area').hasClass('registered_favorite')) {
                        $this.removeClass('--active');
                        $('.count_of_favorite').removeClass('--active');
                    }else {
                        $this.addClass('--active');
                        $('.count_of_favorite').addClass('--active');
                    }
                    $this.children('span').text( $this.children('span').text() == '欲しい' ? '済' : '欲しい' )
                });
                </script>
                <!--{if $arrErr[$add_favorite]}-->
                    <div class="attention"><!--{$arrErr[$add_favorite]}--></div>
                <!--{/if}-->

            <!--{/if}-->
        </div>
        <div class="p-item-detail__title">
            <h1><!--{$arrProduct.name|mb_substr:0:30|h|nl2br}--><!--{if $arrProduct.name|mb_strlen > 30}-->...<!--{/if}--></h1>
            <p class="c-item-request count_of_favorite">
            <svg class="icon" width="150px" height="150px" viewBox="0 0 500 500">
                <g class="particleLayer">
                    <circle fill="#2A7DA7" cx="130" cy="126.5" r="12.5"/>
                    <circle fill="#009FCF" cx="411" cy="313.5" r="12.5"/>
                    <circle fill="#FD0000" cx="279" cy="86.5" r="12.5"/>
                    <circle fill="#79A52B" cx="155" cy="390.5" r="12.5"/>
                    <circle fill="#FFDD00" cx="89" cy="292.5" r="10.5"/>
                    <circle fill="#34B1E2" cx="414" cy="282.5" r="10.5"/>
                    <circle fill="#34B1E2" cx="115" cy="149.5" r="10.5"/>
                    <circle fill="#FF7878" cx="250" cy="80.5" r="10.5"/>
                    <circle fill="#FFAF33" cx="78" cy="261.5" r="10.5"/>
                    <circle fill="#96D8E9" cx="182" cy="402.5" r="10.5"/>
                    <circle fill="#FFDD00" cx="401.5" cy="166" r="13"/>
                    <circle fill="#FFAF33" cx="379" cy="141.5" r="10.5"/>
                    <circle fill="#FD0000" cx="327" cy="397.5" r="10.5"/>
                    <circle fill="#FF7878" cx="296" cy="392.5" r="10.5"/>
                </g>
                <path class="heart" d="M250,187.4c-31.8-47.8-95.5-19.8-95.5,32.2c0,35.2,31.8,60.3,55.7,79.2c24.9,19.7,31.8,23.9,39.8,31.8 c7.9-7.9,14.6-12.6,39.8-31.8c24.3-18.5,55.7-44.4,55.7-79.6C345.5,167.6,281.8,139.7,250,187.4z" fill="#2A7DA7"/>
            </svg>
            <span class="num"><!--{$arrProduct.count_of_favorite|h}--></span></p>
        </div>
        <!--▼サブコメント-->

        <div class="u-mb--4">
            <ul class="p-item-detail__photo l-item-list">
                <!--{section name=cnt loop=$smarty.const.PRODUCTSUB_MAX}-->
                    <!--{assign var=key value="sub_title`$smarty.section.cnt.index+1`"}-->
                    <!--{assign var=ikey value="sub_large_image`$smarty.section.cnt.index+1`"}-->
                    <!--{if $arrProduct[$key] != "" or $arrProduct[$ikey]|strlen >= 1}-->
                            <!--{assign var=ckey value="sub_comment`$smarty.section.cnt.index+1`"}-->
                            <!--▼サブ画像-->
                            <!--{assign var=lkey value="sub_large_image`$smarty.section.cnt.index+1`"}-->
                            <!--{if $arrProduct[$ikey]|strlen >= 1}-->
                                <li data-img_id="<!--{$smarty.section.cnt.index}-->">
                                    <span class="c-square"><img src="<!--{$arrFile[$ikey].filepath}-->" alt="<!--{$arrProduct.name|h}-->" width="<!--{$arrFile[$ikey].width}-->" height="<!--{$arrFile[$ikey].height}-->" /></span>
                                </li>
                            <!--{/if}-->
                            <!--▲サブ画像-->
                    <!--{/if}-->
                <!--{/section}-->
            </ul>
        </div>
        <!--▲サブコメント-->
        <h2 class="c-heading--lg">商品の情報</h2>
        <dl class="p-item-detail__info u-mb--4">
            <dt>発送元の地域</dt>
            <dd>
                <!--{$arrPref[$arrProduct.pref]|h}-->
            </dd>
            <!--▼商品ステータス-->
            <!--{assign var=ps value=$productStatus[$tpl_product_id]}-->
            <!--{if !empty($ps)}-->
                <dt>アイテムの状態</dt>
                <!--{foreach from=$ps item=status}-->
                    <dd class="product_status<!--{$status|h}-->"><!--{$arrSTATUS[$status]|h}--></dd>
                <!--{/foreach}-->
            <!--{/if}-->
            <!--▲商品ステータス-->

            <!--★関連カテゴリ★-->

            <dt>カテゴリー</dt>
            <!--{section name=r loop=$arrRelativeCat}-->
                <dd>
                    <!--{section name=s loop=$arrRelativeCat[r]}-->
                        <a href="<!--{$smarty.const.ROOT_URLPATH}-->products/list.php?category_id=<!--{$arrRelativeCat[r][s].category_id}-->"><!--{$arrRelativeCat[r][s].category_name|h}--></a>
                        <!--{if !$smarty.section.s.last}--><!--{$smarty.const.SEPA_CATNAVI}--><!--{/if}-->
                    <!--{/section}-->
                </dd>
            <!--{/section}-->
        </dl>
        <h2 class="c-heading--lg">出品者の情報</h2>
        <div class="c-profile-header u-mb--2"><!--{if strlen($arrProduct.arrCustomer.profile_image) >= 1}--><img src="<!--{$smarty.const.IMAGE_SAVE_URLPATH|h}-->../save_profile_image/<!--{$arrProduct.arrCustomer.profile_image|h}-->" class="c-profile-header__img"><!--{/if}--><span class="c-profile-header__name"><!--{$arrProduct.arrCustomer.nickname|h}--></span></div>
        <dl class="p-item-detail__info u-mb--2">
            <dt>紹介文</dt>
            <dd><!--{$arrProduct.arrCustomer.self_introduction|h|nl2br}--></dd>
            <dt>趣味</dt>
            <dd><!--{$arrProduct.arrCustomer.hobbies|h}--></dd>
            <dt>出品中アイテム</dt>
            <dd>
                <ul>
                    <!--{foreach from=$arrProduct.arrCustomerProducts item=arrCustomerProduct}-->
                        <li>
                            <div>
                                <a href="<!--{$smarty.const.P_DETAIL_URLPATH|h}--><!--{$arrCustomerProduct.product_id|u|h}-->">
                                    <!--{$arrCustomerProduct.name|h}-->
                                </a>
                            </div>
                            <dl>
                                <dt>「リクエスト（欲しい）」の数</dt>
                                <dd><!--{$arrCustomerProduct.count_of_favorite|n2s|h}--></dd>
                            </dl>
                            <div>
                                <img src="<!--{$smarty.const.IMAGE_SAVE_URLPATH|h}--><!--{$arrCustomerProduct.sub_large_image1|sfNoImageMainList|h}-->" alt="<!--{$arrCustomerProduct.name|h}--> 画像(1)" />
                            </div>
                            <dl>
                                <dt>在庫数</dt>
                                <dd><!--{$arrCustomerProduct.stock_min|n2s|h}--></dd>
                            </dl>
                        </li>
                    <!--{/foreach}-->
                </ul>
            </dd>
        </dl>
        <!--通報するボタン-->
        <p><button type="button" class="c-btn--report">通報する</button></p>
        <div class="l-popup" data-item_mode="false">
            <div class="l-popup__inner">
            <p class="u-mb--2">このアイテムについて通報しますか？</p>
                <button type="button" class="c-btn--tertiary u-mb--2">通報する</button>
                <button type="button" class="c-btn--default report__undo-btn">やめる</button>
            </div>
            <div class="l-popup__close">
            </div>
        </div>
    </div>
    <div class="c-modal">
       <button class="c-modal__close-btn">close</button>
        <!-- スライダーのメインコンテナの div 要素 -->
        <div class="swiper-container">
            <div class="swiper-wrapper">
                <!-- それぞれのスライドの div 要素 -->
                <!--{section name=cnt loop=$smarty.const.PRODUCTSUB_MAX}-->
                    <!--{assign var=ikey value="sub_large_image`$smarty.section.cnt.index+1`"}-->
                    <!--{if $arrProduct[$key] != "" or $arrProduct[$ikey]|strlen >= 1}-->
                        <!--{assign var=tkey value="sub_title`$smarty.section.cnt.index+1`"}-->
                        <!--{if $arrProduct[$ikey]|strlen >= 1}-->
                            <li class="swiper-slide">
                                <figure>
                                    <img src="<!--{$arrFile[$ikey].filepath}-->" alt="<!--{$arrProduct.name|h}-->" width="<!--{$arrFile[$ikey].width}-->" height="<!--{$arrFile[$ikey].height}-->" class="c-modal__img"/>
                                    <!--{if $arrProduct[$tkey]}-->
                                        <figcaption class="c-modal__caption"><!--{$arrProduct[$tkey]|h}--></figcaption>
                                    <!--{/if}-->
                                </figure>
                            </li>
                        <!--{/if}-->
                    <!--{/if}-->
                <!--{/section}-->
            </div>

            <!-- ナビゲーションボタンの div 要素-->
            <div class="swiper-button-prev"></div>
            <div class="swiper-button-next"></div>
        </div>
    </div>
    <div class="c-modal__bg"></div>
</section>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script>
    $('.c-btn--report').on('click', function(){
        $('.l-popup').attr('data-item_mode', 'report') ;
        $('body').addClass('--overflow-hidden');

        $('.l-popup .l-popup__close, .report__undo-btn').on('click', function(){
            $('body').removeClass('--overflow-hidden');
            $('.l-popup').attr('data-item_mode', 'false') ;
        })
    })
    let mySwiper = new Swiper ('.swiper-container', {
        // オプション
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',

        },
    })
    const slides = document.querySelectorAll('[data-img_id]');
    const body = document.querySelector('body');
    const modal = document.querySelector('.c-modal')
    const modalCloseBtn = document.querySelector('.c-modal__close-btn');
    const modalBg = document.querySelector('.c-modal__bg');
    let imagesArr = [];
    slides.forEach((item) => {
        console.log(item)
        item.addEventListener('click', () =>{
            modal.classList.add('--active')
            body.classList.add('--overflow-hidden');

            // スライドと同じIDから
            mySwiper.slideToLoop(item.getAttribute('data-img_id'));

            modalCloseBtn.addEventListener('click', () =>{
                modal.classList.remove('--active')
                body.classList.remove('--overflow-hidden');
            })
            modalBg.addEventListener('click', () =>{
                modal.classList.remove('--active')
                body.classList.remove('--overflow-hidden');
            })
        })
    });
</script>
