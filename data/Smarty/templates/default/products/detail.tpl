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
    <div class="p-item-detail favorite_area<!--{if $is_favorite}--> registered_favorite<!--{/if}-->">
        <div class="c-item-kv p-item-detail__kv">
            <!--{assign var=key value="sub_large_image1"}-->
            <!--★画像★-->

            <div data-modal_src="<!--{$smarty.const.IMAGE_SAVE_URLPATH}--><!--{$arrProduct.sub_large_image1|h}-->" data-modal_caption="<!--{$arrProduct.name|h}-->"><img src="<!--{$arrFile[$key].filepath|h}-->" width="<!--{$arrFile[$key].width}-->" height="<!--{$arrFile[$key].height}-->" alt="<!--{$arrProduct.name|h}-->" class="c-item-kv__img" /></div>
            <!--★お気に入り登録★-->
            <!--{if $smarty.const.OPTION_FAVORITE_PRODUCT == 1 && $tpl_login === true}-->

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
                欲しい
                </button>
                <script>
                $('.favorite_area #request').init_favorite_area(<!--{$smarty.const.TRANSACTION_ID_NAME|@json_encode}-->, <!--{$transactionid|@json_encode}-->).on('click', function(){
                    if($('.favorite_area').hasClass('registered_favorite')) {
                        $(this).removeClass('--active');
                        $('.count_of_favorite').removeClass('--active');

                    }else {
                        $(this).addClass('--active');
                        $('.count_of_favorite').addClass('--active');
                    }
                });
                </script>
                <!--{if $arrErr[$add_favorite]}-->
                    <div class="attention"><!--{$arrErr[$add_favorite]}--></div>
                <!--{/if}-->

            <!--{/if}-->
        </div>
        <div class="p-item-detail__title">
            <h1><!--{$arrProduct.name|h}--></h1>
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
                                <li>
                                    <!--{if $arrProduct[$lkey]|strlen >= 1}-->
                                        <div data-modal_src="<!--{$smarty.const.IMAGE_SAVE_URLPATH}--><!--{$arrProduct[$lkey]|h}-->" data-modal_caption="<!--{$arrProduct[$key]|h}-->">
                                    <!--{/if}-->
                                    <img src="<!--{$arrFile[$ikey].filepath}-->" alt="<!--{$arrProduct.name|h}-->" width="<!--{$arrFile[$ikey].width}-->" height="<!--{$arrFile[$ikey].height}-->" />
                                    <!--{if $arrProduct[$lkey]|strlen >= 1}-->
                                        </div>
                                    <!--{/if}-->
                                </li>
                            <!--{/if}-->
                            <!--▲サブ画像-->
                    <!--{/if}-->
                <!--{/section}-->
            </ul>
        </div>
        <!--▲サブコメント-->
        <h2 class="c-heading--lg">商品の情報</h2>
        <dl class="p-item-detail__info">
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
    <div class="c-modal">
       <button class="c-modal__close-btn">close</button>
        <figure class="c-modal__img">
            <img src="<!--{$smarty.const.IMAGE_SAVE_URLPATH}--><!--{$arrProduct.sub_large_image1|h}-->" alt="">
                <figcaption class="c-modal__caption">テストテストテストテストテストテストテストテストテストテストテストテスト</figcaption>
        </figure>
        <ul class="c-modal__controll">
            <li class="c-modal__controll__prev"><svg width="11" height="17" viewBox="0 0 11 17" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M10.5363 2.23303L8.65625 0.353027L0.65625 8.35303L8.65625 16.353L10.5363 14.473L4.42958 8.35303L10.5363 2.23303Z" fill="#000000"/></svg></li><li class="c-modal__controll__next"><svg width="11" height="17" viewBox="0 0 11 17" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M2.32238 0.353027L0.442383 2.23303L6.54905 8.35303L0.442383 14.473L2.32238 16.353L10.3224 8.35303L2.32238 0.353027Z" fill="#000000"/></svg></li>
        </ul>
    </div>
    <div class="c-modal__bg"></div>
</section>
<script>
    const imageSrc = document.querySelectorAll('[data-modal_src]');
    const modalImage = document.querySelector('.c-modal__img img');
    const body = document.querySelector('body');
    const modal = document.querySelector('.c-modal')
    const modalCaption = document.querySelector('.c-modal__caption');
    const modalCloseBtn = document.querySelector('.c-modal__close-btn');
    const modalPrevBtn = document.querySelector('.c-modal__controll__prev');
    const modalNextBtn = document.querySelector('.c-modal__controll__next');
    const modalBg = document.querySelector('.c-modal__bg');
    let imagesArr = [];
    imageSrc.forEach((item, index) => {
        imagesArr.push({'src': item.getAttribute('data-modal_src'), 'caption': item.getAttribute('data-modal_caption')});

        item.addEventListener('click', () =>{
            modal.classList.add('--active')
            body.classList.add('--overflow-hidden');
            modalImage.src = imagesArr[index].src;
            modalCaption.textContent = imagesArr[index].caption;
            let num = index;

            modalNextBtn.addEventListener('click', () =>{
                num = (num == (imagesArr.length - 1) ? 0 : num + 1);
                modalImage.src = imagesArr[num].src;
                modalCaption.textContent = imagesArr[num].caption;
            })
            modalPrevBtn.addEventListener('click', () =>{
                num = (num == 0 ? imagesArr.length - 1 : 0);
                modalImage.src = imagesArr[num].src;
                modalCaption.textContent = imagesArr[num].caption;
            })
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
