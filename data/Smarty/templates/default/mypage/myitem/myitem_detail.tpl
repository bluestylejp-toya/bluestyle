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

    <div class="p-item-detail">
        <div class="p-item-detail__head">
            <header class="l-header__inner u-mb--0">
                <a href="<!--{$smarty.const.TOP_URL}-->mypage/myitem/myitem.php" aria-label="戻る" class="c-btn--header-nav"></a>
                <p class="c-header-title">商品名<!--{$arrProduct.name|h}--></p>
            </header>
            <!--{* ステータスごとの変数の値はダミーです。適宜修正してください。 *}-->
            <!--{assign var=status value="unlooped"}-->
            <!--{* 選択待ち *}-->
            <!--{if $status == 'unselected'}-->
                <div class="c-btn--mypage__wrapper">
                    <a href="/mypage/myitem/unselected_item.php" class="c-btn--mypage--unselected">交換するアイテム選んでね</a>
                </div>
            <!--{* Chain成立待ち *}-->
            <!--{else if $status == 'unlooped'}-->
                <div>
                    <a href="/mypage/myitem/status.php" class="c-achievement__link">
                        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 200 200">
                            <path class="cls-1" d="M103.21,200a31,31,0,0,1-28.07-18,6.24,6.24,0,0,0-3.55-3.25,6.32,6.32,0,0,0-2.1-.37,6.21,6.21,0,0,0-2.7.62,30.94,30.94,0,0,1-35.24-6,31,31,0,0,1-7.1-32.6,6.21,6.21,0,0,0-3.76-8A30.87,30.87,0,0,1,18,75.13a6.22,6.22,0,0,0,3-8.33A30.9,30.9,0,0,1,59.62,24.44a6.19,6.19,0,0,0,2.16.38,6.38,6.38,0,0,0,2.64-.58,6.22,6.22,0,0,0,3.22-3.57A30.88,30.88,0,0,1,124.86,18a6.19,6.19,0,0,0,3.54,3.25,6.36,6.36,0,0,0,2.1.37,6.25,6.25,0,0,0,2.71-.62,30.92,30.92,0,0,1,42.35,38.61,6.22,6.22,0,0,0,3.77,8A30.87,30.87,0,0,1,182,124.87a6.23,6.23,0,0,0-3,8.35,30.91,30.91,0,0,1-38.59,42.36,6,6,0,0,0-2.16-.39,6.22,6.22,0,0,0-5.86,4.15A31,31,0,0,1,103.21,200ZM83.85,59.42A6.22,6.22,0,0,0,78,63.59a30.43,30.43,0,0,1-7.3,11.63,31.17,31.17,0,0,1-9,6.26,6.22,6.22,0,0,0-3,8.36A30.79,30.79,0,0,1,59.82,114a6.22,6.22,0,0,0,3.78,8,31,31,0,0,1,17.86,16.3A6.21,6.21,0,0,0,85,141.56a6.19,6.19,0,0,0,4.81-.25A30.86,30.86,0,0,1,114,140.18a6.05,6.05,0,0,0,2.18.4,6.22,6.22,0,0,0,5.87-4.17,30.41,30.41,0,0,1,7.31-11.63,30.86,30.86,0,0,1,9-6.26,6.19,6.19,0,0,0,3.26-3.55,6.28,6.28,0,0,0-.25-4.81,30.38,30.38,0,0,1-3.05-13.37,30.86,30.86,0,0,1,1.92-10.74,6.23,6.23,0,0,0-3.77-8,30.49,30.49,0,0,1-11.63-7.32,30.91,30.91,0,0,1-6.26-9A6.27,6.27,0,0,0,115,58.45a6.19,6.19,0,0,0-4.81.25A30.86,30.86,0,0,1,86,59.82,6.09,6.09,0,0,0,83.85,59.42Z" fill="#EAECEE"/>
                            <path class="cls-1" d="M103.21,200a31,31,0,0,1-28.07-18,6.24,6.24,0,0,0-3.55-3.25,6.32,6.32,0,0,0-2.1-.37,6.21,6.21,0,0,0-2.7.62,30.94,30.94,0,0,1-35.24-6,31,31,0,0,1-7.1-32.6,6.21,6.21,0,0,0-3.76-8A30.87,30.87,0,0,1,18,75.13a6.22,6.22,0,0,0,3-8.33A30.9,30.9,0,0,1,59.62,24.44a6.19,6.19,0,0,0,2.16.38,6.38,6.38,0,0,0,2.64-.58,6.22,6.22,0,0,0,3.22-3.57A30.88,30.88,0,0,1,124.86,18a6.19,6.19,0,0,0,3.54,3.25,6.36,6.36,0,0,0,2.1.37,6.25,6.25,0,0,0,2.71-.62,30.92,30.92,0,0,1,42.35,38.61,6.22,6.22,0,0,0,3.77,8A30.87,30.87,0,0,1,182,124.87a6.23,6.23,0,0,0-3,8.35,30.91,30.91,0,0,1-38.59,42.36,6,6,0,0,0-2.16-.39,6.22,6.22,0,0,0-5.86,4.15A31,31,0,0,1,103.21,200ZM83.85,59.42A6.22,6.22,0,0,0,78,63.59a30.43,30.43,0,0,1-7.3,11.63,31.17,31.17,0,0,1-9,6.26,6.22,6.22,0,0,0-3,8.36A30.79,30.79,0,0,1,59.82,114a6.22,6.22,0,0,0,3.78,8,31,31,0,0,1,17.86,16.3A6.21,6.21,0,0,0,85,141.56a6.19,6.19,0,0,0,4.81-.25A30.86,30.86,0,0,1,114,140.18a6.05,6.05,0,0,0,2.18.4,6.22,6.22,0,0,0,5.87-4.17,30.41,30.41,0,0,1,7.31-11.63,30.86,30.86,0,0,1,9-6.26,6.19,6.19,0,0,0,3.26-3.55,6.28,6.28,0,0,0-.25-4.81,30.38,30.38,0,0,1-3.05-13.37,30.86,30.86,0,0,1,1.92-10.74,6.23,6.23,0,0,0-3.77-8,30.49,30.49,0,0,1-11.63-7.32,30.91,30.91,0,0,1-6.26-9A6.27,6.27,0,0,0,115,58.45a6.19,6.19,0,0,0-4.81.25A30.86,30.86,0,0,1,86,59.82,6.09,6.09,0,0,0,83.85,59.42Z" fill="url(#gradient)" clip-path="url(#clip)"/>
                            <defs><linearGradient id="gradient" x1="-165.21" y1="-5000.98" x2="6.99" y2="-4796.48" gradientTransform="matrix(1, 0, 0, -1, 179, -4798.59)" gradientUnits="userSpaceOnUse"><stop offset="0" stop-color="#3cf"/><stop offset="0.45" stop-color="#67cc9d"/><stop offset="0.83" stop-color="#8fcc51"/><stop offset="1" stop-color="#9fcc33"/></linearGradient></defs>
                            <clipPath id="clip">
                                <path d="M 100,100 L 100,0 A 100, 0 0 0 1 100, 0 z"></path>
                            </clipPath>
                        </svg>
                        Chainまで00%
                    </a>
                </div>
                <script>
                $(function(){
                    let $achieveRate = 45;
                    let $deg = $achieveRate * 360 /100;
                    let $r = 100;
                    let $path = $('#clip path');
                    let $pathValue = $path.attr('d');
                    let x = 100 + (100 * Math.sin( $deg / 180 * Math.PI));
                    let y = 100 - (100 * Math.cos( $deg/ 180 * Math.PI));
                    let largeArcFlag = ($deg - 0 <= 180) ? 0 : 1;
                    let $d = 'M 100,100 L 100, 0 ' +' A' + $r + ' ' + $r + ' ' + 0 + ' ' + largeArcFlag + ' ' + 1 + ' ' + x + ' ' + y + ' z';
                    $path.attr('d', $d);
                })
                </script>
            <!--{* 発送待ち *}-->
            <!--{else if $status == 'unshipped'}-->
                <div class="c-btn--mypage__wrapper">
                    <a href="/user_data/qr.php" class="c-btn--mypage--unshipped">このアイテムはChain成立しています<br>あと◯◯日以内に発送してください</a>
                </div>
            <!--{/if}-->
            <!--{assign var=key value="sub_large_image1"}-->
            <!--★画像★-->
            <div data-img_id="0" class="p-item-detail__head__inner"><img src="http://localhost:8080/upload/save_image/2021/09/29/09291558_61540e96ab89a.jpg" width="<!--{$arrFile[$key].width}-->" height="<!--{$arrFile[$key].height}-->" alt="<!--{$arrProduct.name|h}-->" class="p-item-detail__head__img" /></div>
        </div>
        <!--/key visual-->
        <div class="p-item-detail__body">
            <div class="p-item-detail__body__main">
                <h1 class="c-heading--detail">商品名<!--{$arrProduct.name|mb_substr:0:30|h|nl2br}--><!--{if $arrProduct.name|mb_strlen > 30}-->...<!--{/if}--></h1>
                <p class="c-item-request count_of_favorite u-mb--4">
                    <svg class="icon" width="150px" height="150px" viewBox="0 0 500 500">
                        <path class="heart" d="M250,187.4c-31.8-47.8-95.5-19.8-95.5,32.2c0,35.2,31.8,60.3,55.7,79.2c24.9,19.7,31.8,23.9,39.8,31.8 c7.9-7.9,14.6-12.6,39.8-31.8c24.3-18.5,55.7-44.4,55.7-79.6C345.5,167.6,281.8,139.7,250,187.4z" fill="#2A7DA7"/>
                    </svg>
                    <span class="num"><!--{$arrProduct.count_of_favorite|h}-->10</span>
                </p>
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

            </div>
            <!--/.p-item-detail__body__main-->

            <div class="p-item-detail__body__slideup --hidden">
                <svg width="68" height="61" viewBox="0 0 68 61" fill="none" xmlns="http://www.w3.org/2000/svg" class="select_status">
                    <path d="M9.99219 21.3182V40.4266H1.20508L21.9961 59.7303L42.7871 40.4266H34V20.3037H25.2129L46.0039 1L66.7949 20.3037H58.0078V39.4121" stroke="#ccc" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                    <defs>
                        <linearGradient id="paint0_linear" x1="1.20508" y1="59.7303" x2="67.308" y2="59.147" gradientUnits="userSpaceOnUse">
                        <stop stop-color="#33CCFF"/>
                        <stop offset="0.45" stop-color="#67CC9D"/>
                        <stop offset="0.83" stop-color="#8FCC51"/>
                        <stop offset="1" stop-color="#9FCC33"/>
                    </linearGradient>
                    </defs>
                </svg>
                <p class="u-text--center u-mb--2 u-color--gray">交換するアイテムを選んでください。</p>

                <!-- 交換するアイテム一覧 -->
                <!--{if $tpl_linemax > 0}-->
                    <ul class="u-mb--4">
                        <!--{foreach from=$arrTargetProducts item=$arrProduct}-->
                            <li class="c-card">
                                <label class="c-card__radio-button"><input type="radio" name="my_product" value="<!--{$arrProduct.product_id|h}-->">
                                    <div class="c-card__main">
                                    <img src="<!--{$smarty.const.IMAGE_SAVE_URLPATH}--><!--{$arrProduct.sub_large_image1|sfNoImageMainList|h}-->" alt="<!--{$arrProduct.name|h}-->" decoding="async" loading="lazy" class="c-card__img"/>
                                        <p><!--{$arrProduct.name|h}--></p>
                                        <div class="c-item__request"><!--{$arrProduct.count_of_favorite|n2s|h}--></div>
                                    </div>
                                </label>
                                <button type="button" class="c-card__detail-btn" data-page_url="./detail.php?product_id=<!--{$arrProduct.product_id|h}-->">詳細</button>
                            </li>
                        <!--{/foreach}-->
                    </ul>
                <!--{else}-->
                <p>アイテムが登録されておりません。</p>
                <!--{/if}-->
            </div>
            <!--/.p-item-detail__body__slideup-->
        </div>
        <!--/.p-item-detail__body-->
    </div>
    <!--/.c-item-detail-->
    <div class="c-modal" data-modal_mode="false">
        <button class="c-modal__close-btn" type="button">close</button>
        <!-- スライダーのメインコンテナの div 要素 -->
        <div class="swiper-container">
            <div class="swiper-wrapper">
                <!-- それぞれのスライドの div 要素 -->
                <li class="swiper-slide">
                    <figure>
                        <img src="http://localhost:8080/upload/save_image/2021/09/29/09291558_61540e96ab89a.jpg" alt="<!--{$arrProduct.name|h}-->" width="<!--{$arrFile[$ikey].width}-->" height="<!--{$arrFile[$ikey].height}-->" class="c-modal__img"/>
                        <!--{if $arrProduct[$tkey]}-->
                            <figcaption class="c-modal__caption"><!--{$arrProduct[$tkey]|h}--></figcaption>
                        <!--{/if}-->
                    </figure>
                </li>
            </div>

            <!-- ナビゲーションボタンの div 要素-->
            <div class="swiper-button-prev"></div>
            <div class="swiper-button-next"></div>
        </div>
    </div>
    <div class="c-modal__bg"></div>
    <!--/.c-modal-->
</section>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script>
$(function(){

    // スライドショー
    let mySwiper = new Swiper ('.swiper-container', {
        // オプション
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        },
    });
    const $slides = $('[data-img_id]');
    const $detailShowBtn = $('.c-card__detail-btn');

    let imagesArr = [];
    $slides.each(function() {
        $(this).on('click', function(){
            toggleModal();

            $('.c-modal').attr('data-modal_mode', 'slide')

            // スライドと同じIDから
            mySwiper.slideToLoop($(this).attr('data-img_id'));
        })
    });

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
});
</script>
