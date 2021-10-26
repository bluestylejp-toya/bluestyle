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

    <div class="p-item-detail favorite_area<!--{if $is_favorite}--> registered_favorite<!--{/if}-->">
        <div class="p-item-detail__head">
            <header class="l-header__inner u-mb--0">
                <a href="<!--{$smarty.const.TOP_URL}-->products/list.php?orderby=date" aria-label="戻る" class="c-btn--header-nav"></a>
                <p class="c-header-title"><!--{$arrProduct.name|h}--></p>
            </header>

            <!--{if $hasUnselectdProductFlg}-->
            <div class="c-btn--mypage__wrapper">
                <a href="/mypage/myitem/myitem_list.php" class="c-btn--mypage--unselected">交換するアイテム選んでね</a>
            </div>
            <!--{/if}-->

            <!--{if $tpl_my_product}--><div class="c-message--primary u-mb--0">出品中のアイテムです</div><!--{/if}-->
            <!--{assign var=key value="sub_large_image1"}-->
            <div class="c-notification--secondary notification">リクエストを送信しました</div>
            <!--★画像★-->
            <div data-img_id="0" class="p-item-detail__head__inner"><img src="<!--{$arrFile[$key].filepath|h}-->" width="<!--{$arrFile[$key].width}-->" height="<!--{$arrFile[$key].height}-->" alt="<!--{$arrProduct.name|h}-->" class="p-item-detail__head__img" /></div>
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
                <span class="label"><!--{if $is_favorite}-->済<!--{else}-->ほしい<!--{/if}--></span>
                </button>
                <!--{if $arrErr[$add_favorite]}-->
                    <div class="attention"><!--{$arrErr[$add_favorite]}--></div>
                <!--{/if}-->

            <!--{/if}-->
            <div class="slideup_bg"></div>
        </div>
        <!--/key visual-->
        <div class="p-item-detail__body">
            <div class="p-item-detail__body__main">
                <h1 class="c-heading--detail"><!--{$arrProduct.name|mb_substr:0:30|h|nl2br}--><!--{if $arrProduct.name|mb_strlen > 30}-->...<!--{/if}--></h1>
                <p class="c-item-request count_of_favorite u-mb--4">
                    <svg class="icon" width="150px" height="150px" viewBox="0 0 500 500">
                        <path class="heart" d="M250,187.4c-31.8-47.8-95.5-19.8-95.5,32.2c0,35.2,31.8,60.3,55.7,79.2c24.9,19.7,31.8,23.9,39.8,31.8 c7.9-7.9,14.6-12.6,39.8-31.8c24.3-18.5,55.7-44.4,55.7-79.6C345.5,167.6,281.8,139.7,250,187.4z" fill="#2A7DA7"/>
                    </svg>
                    <span class="num"><!--{$arrProduct.count_of_favorite|h}--></span>
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
                <h2 class="c-heading--lg">出品者の情報</h2>
                <div class="c-profile-header u-mb--2"><!--{if strlen($arrProduct.arrCustomer.profile_image) >= 1}--><img src="<!--{$smarty.const.IMAGE_SAVE_URLPATH|h}-->../save_profile_image/<!--{$arrProduct.arrCustomer.profile_image|h}-->" class="c-profile-header__img"><!--{/if}--><span class="c-profile-header__name"><!--{$arrProduct.arrCustomer.nickname|h}--></span></div>
                <dl class="p-item-detail__info u-mb--2">
                    <dt>紹介文</dt>
                    <dd><!--{$arrProduct.arrCustomer.self_introduction|h|nl2br}--></dd>
                    <dt>趣味</dt>
                    <dd><!--{$arrProduct.arrCustomer.hobbies|h}--></dd>
                    <!--<dt class="full">出品中アイテム</dt>
                    <dd class="full">
                        <ul>
                            <!--{assign var=id value=`$arrProduct.product_id`}-->
                            <!--{foreach from=$arrProduct.arrCustomerProducts item=arrCustomerProduct}-->
                                <!--{if $id != $arrCustomerProduct.product_id}-->
                                    <li>
                                        <a href="<!--{$smarty.const.P_DETAIL_URLPATH|h}--><!--{$arrCustomerProduct.product_id|u|h}-->" class="c-item--has-icon">
                                            <img src="<!--{$smarty.const.IMAGE_SAVE_URLPATH|h}--><!--{$arrCustomerProduct.sub_large_image1|sfNoImageMainList|h}-->" alt="<!--{$arrCustomerProduct.name|h}--> 画像(1)" class="c-item__img"/>
                                            <div class="c-item__main">
                                                <p class="c-item__title"><!--{$arrCustomerProduct.name|h}--></p>
                                                <p class="c-item__request"><!--{$arrCustomerProduct.count_of_favorite|n2s|h}--></p>
                                            </div>
                                        </a>
                                    </li>
                                <!--{/if}-->
                            <!--{/foreach}-->
                        </ul>
                    </dd>-->
                </dl>

                    <button class="u-mb--4 report_btn c-btn--default--sm" type="button">その他</button>
                    <div class="l-popup" data-item_mode="false">
                        <div class="l-popup__inner u-text--left">
                            <p class="u-mb--2 report_message u-weight--bold">その他</p>
                            <!--{if !$tpl_my_product}--><!--通報するボタン-->
                            <button type="button" class="report_submit">通報する</button>
                            <input type="hidden" name="report_title" value="出品アイテムの違反報告です">
                            <input type="hidden" name="reporter" value="リポートしたユーザーのIDが入るように">
                            <input type="hidden" name="report_url" value="<!--{$smarty.const.TOP_URL}-->/detail.php?product_id=<!--{$tpl_product_id}-->">
                            <!--/下のJSの「通報の処理」に送信処理を追加願います-->
                            <!--{else}-->
                            <a href="<!--{$smarty.const.TOP_URL}-->mypage/item_edit.php?mode=pre_edit&product_id=<!--{$arrProduct.product_id|h}-->" class="c--btn--text">編集する</a>
                            <!--{/if}-->
                        </div>
                        <div class="l-popup__close"></div>
                        <p class="c-notification--secondary notification">このアイテムを通報しました</p>
                    </div>
                <div class="history">
                    <h2 class="c-heading--lg history_title">閲覧履歴</h2>
                </div>
            </div>
            <!--/.p-item-detail__body__main-->

            <div class="p-item-detail__body__slideup --hidden">
                <span class="c-btn--request p-item-detail__request-btn">
                    <svg class="likeButton" width="150px" height="150px" viewBox="0 0 500 500">
                    <g class="particleLayer">
                        <circle fill="#2A7DA7" cx="130" cy="126.5" r="12.5"></circle>
                        <circle fill="#009FCF" cx="411" cy="313.5" r="12.5"></circle>
                        <circle fill="#FD0000" cx="279" cy="86.5" r="12.5"></circle>
                        <circle fill="#79A52B" cx="155" cy="390.5" r="12.5"></circle>
                        <circle fill="#FFDD00" cx="89" cy="292.5" r="10.5"></circle>
                        <circle fill="#34B1E2" cx="414" cy="282.5" r="10.5"></circle>
                        <circle fill="#34B1E2" cx="115" cy="149.5" r="10.5"></circle>
                        <circle fill="#FF7878" cx="250" cy="80.5" r="10.5"></circle>
                        <circle fill="#FFAF33" cx="78" cy="261.5" r="10.5"></circle>
                        <circle fill="#96D8E9" cx="182" cy="402.5" r="10.5"></circle>
                        <circle fill="#FFDD00" cx="401.5" cy="166" r="13"></circle>
                        <circle fill="#FFAF33" cx="379" cy="141.5" r="10.5"></circle>
                        <circle fill="#FD0000" cx="327" cy="397.5" r="10.5"></circle>
                        <circle fill="#FF7878" cx="296" cy="392.5" r="10.5"></circle>
                    </g>
                    <path class="heart" d="M250,187.4c-31.8-47.8-95.5-19.8-95.5,32.2c0,35.2,31.8,60.3,55.7,79.2c24.9,19.7,31.8,23.9,39.8,31.8 c7.9-7.9,14.6-12.6,39.8-31.8c24.3-18.5,55.7-44.4,55.7-79.6C345.5,167.6,281.8,139.7,250,187.4z" fill="#fff"></path>
                    </svg>
                    <span class="label">ほしい</span>
                </span>
                <div>
                    <h2 class="c-heading--sm u-text--center">交換に出すアイテムを選んでください</h2>
                    <p>チェックしたアイテムの中から1対1の交換です。数が多いほど、Chainが成立する確率が高くなります。</p>
                    <svg width="52" height="46" viewBox="0 0 68 61" fill="none" xmlns="http://www.w3.org/2000/svg" class="select_status">
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
                <!--/自分のアイテムをfor文で出力-->

                <!-- 交換するアイテム一覧 -->
                <!--{if $tpl_linemax > 0}-->
                    <ul class="u-mb--4">
                        <!--{foreach from=$arrTargetProducts item=$arrProduct}-->
                            <li class="c-card">
                                <label data-product_id="<!--{$tpl_product_id|h}-->" data-target_id="<!--{$arrProduct.product_id|h}-->">
                                    <input type="checkbox" name="my_product" value="<!--{$arrProduct.product_id|h}-->" data-product_id="<!--{$tpl_product_id|h}-->" data-target_id="<!--{$arrProduct.product_id|h}-->">
                                    <div class="c-card__main">
                                        <!--{*
                                        <img src="<!--{$smarty.const.IMAGE_SAVE_URLPATH}--><!--{$arrProduct.sub_large_image1|sfNoImageMainList|h}-->" alt="<!--{$arrProduct.name|h}-->" decoding="async" loading="lazy" class="c-card__img"/>
                                        *}-->
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
                <div class="l-floating-btn">
                    <button class="c-btn--primary--outline u-mb--1 slide-close_btn" id="cancel-button">キャンセル</button>
                    <button class="c-btn--primary send-request_btn" disabled data-product_id="<!--{$tpl_product_id|h}-->" id="decision-button">決定</button>
                </div>
            </div>
            <!--/.p-item-detail__body__slideup-->
        </div>
        <!--/.p-item-detail__body-->
    </div>
    <!-- 決定ボタン -->

    <!--/.c-item-detail-->
    <div class="c-modal" data-modal_mode="false">
        <button class="c-modal__close-btn" type="button">close</button>
        <!-- スライダーのメインコンテナの div 要素 -->
        <div class="c-modal__inner"></div>
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
    <!--/.c-modal-->
</section>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script>
$(function(){
    $(".history_list").appendTo(".history");

    // 交換商品クリック時
    $('.send-request_btn').on('click', function () {
        let $this = $(this)
        let $closest = $(this).closest(".favorite_area");
        let $close = $('.slideup_bg');
        let $mode = $closest.hasClass("registered_favorite");
        let $wrap = $closest.parents('.l-wrapper');

        init_favorite($mode, $closest, $this)
        let $slideUp = $('.p-item-detail__body .p-item-detail__body__slideup');
        setTimeout(function () {
            slideDown($close, $slideUp, $main);
        }, 300)
        checked(true, $('.favorite_area #request'))
    })

    // 交換商品クリック時
    $('#decision-button').on('click', function () {
        // 未選択時エラー
        if ($('input[name=my_product]:checked').length == 0) {
            alert('交換商品を選択してください')
            return false;
        }
        $('input[name=my_product]:checked').map(function(){
            let $this = $(this)
            let $closest = $(this).closest(".favorite_area");
            let $mode = $closest.hasClass("registered_favorite");
            init_favorite($mode, $closest, $this)
        });
        let $main = $('.p-item-detail__body .p-item-detail__body__main');
        let $close = $('.slideup_bg');
        let $slideUp = $('.p-item-detail__body .p-item-detail__body__slideup');
        setTimeout(function () {
            slideDown($close, $slideUp, $main, $wrap);
            $('.favorite_area #request').addClass('--active');
        }, 300)
        $("span[class=label]").text('済');
        checked(true, $('.favorite_area #request'))
        $("input[type=checkbox][name=my_product]").removeAttr('checked');
    })

    // ほしいボタンクリック時
    $('.favorite_area #request').on('click', function () {
        let $this = $(this);
        let $closest = $(this).closest(".favorite_area");
        let $mode = $closest.hasClass("registered_favorite");
        let $close = $('.slideup_bg, .slide-close_btn');
        let $slideUp = $('.p-item-detail__body .p-item-detail__body__slideup');
        let $main = $('.p-item-detail__body .p-item-detail__body__main');
        let $wrap = $closest.parents('.l-wrapper');
        let $checked = $mode;
        let $checkList = $('.c-card__checkbox input');
        let $sendRequestBtn = $('.send-request_btn')

        // リクエスト取り消し
        if ($mode === true) {
            init_favorite($mode, $closest, $this);
        } else {
            slideUp($close, $slideUp, $main, $wrap);

            //選ぶのをやめる
            $close.on('click', function () {
                slideDown($close, $slideUp, $main, $wrap);
                $this.removeAttr('disabled');
            });

            //チェックを入ったらリクエストボタンをクリックできるようになる
            $checkList.on('change', function(){
                if(  $('.c-card__checkbox input:checked').length > 0) {
                    // 出品アイテムを配列に格納する
                    $target = [];
                    $checkList.each(function() {
                        if( $(this).prop('checked') == true) {
                            $target.push($(this).val());
                        }
                    })
                    $('.send-request_btn').attr('data-target_id', $target);
                    $sendRequestBtn.removeAttr('disabled');

                    return false;
                } else {
                    $sendRequestBtn.attr('disabled', true);
                }
            })

        }
    })

    function init_favorite($mode, $closest, $this){
        let postData = {
            mode: $mode
                ? "del_favorite_ajax"
                : "add_favorite_ajax",
            product_id: $this.data("product_id"),
            favorite_product_id:  $this.data("product_id"),
            target_id: $this.data("target_id"),
        };

        postData[<!--{$smarty.const.TRANSACTION_ID_NAME|@json_encode}-->] = <!--{$transactionid|@json_encode}-->;
        $.ajax({
            url: "/products/detail.php",
            method: "POST",
            data: postData,
            dataType: "json",
        }).done(function (data, textStatus, jqXHR) {
            // リクエスト送信
            if (data.registered === true) {
                let postData = {
                    mode : "api_add_favorite_ajax",
                    product_id: $this.data("product_id"),
                    favorite_product_id:  $this.data("product_id"),
                    target_id: $this.data("target_id"),
                };
                postData[<!--{$smarty.const.TRANSACTION_ID_NAME|@json_encode}-->] = <!--{$transactionid|@json_encode}-->;

                $.ajax({
                    url: "/products/detail.php",
                    method: "POST",
                    data: postData,
                    dataType: "json",
                }).done(function (data, textStatus, jqXHR) {
                    $closest.addClass("registered_favorite");
                    $this.addClass('--active');
                }).fail(function(jqXHR, textStatus, errorThrown){
                    // エラーの場合処理
                });

            // リクエスト取り消し
            } else if (data.registered === false) {
                let postData = {
                    mode : "api_remove_favorite_ajax",
                    product_id: $this.data("product_id"),
                };
                postData[<!--{$smarty.const.TRANSACTION_ID_NAME|@json_encode}-->] = <!--{$transactionid|@json_encode}-->;

                $.ajax({
                    url: "/products/detail.php",
                    method: "POST",
                    data: postData,
                    dataType: "json",
                }).done(function (data, textStatus, jqXHR) {
                    $closest.removeClass("registered_favorite");
                    $this.removeClass('--active');
                }).fail(function(jqXHR, textStatus, errorThrown){
                    // エラーの場合処理
                });
            }
            let $request = $closest.find('#request')

            $closest.find(".count_of_favorite .num").text(data.count_of_favorite);
            $request.children('span').text( $request.children('span').text() == 'ほしい' ? '済' : 'ほしい' );
            $closest.find(".notification").text($mode ? 'リクエストを取り消しました' : 'リクエストを送信しました' );

            $closest.find(".notification").fadeIn(300,
            function() {
                setTimeout(function(){
                    $closest.find(".notification").fadeOut();
                }, 1000);
            })
        }).fail(function(jqXHR, textStatus, errorThrown){
            alert('エラーが発生しました。');
            location.reload();
        });
    }
    // スライドアップ
    function slideUp($close, $slideUp, $main, $wrap){
        $close.addClass('--active');
        $slideUp.removeClass('--hidden');
        $wrap.addClass('--list-show')
    }
    // スライドダウン
    function slideDown($close, $slideUp, $main, $wrap){
        $close.removeClass('--active');
        $slideUp.addClass('--hidden');
        $wrap.removeClass('--list-show')
    }


    // 通報の処理
    $('.report_btn').on('click', function(){
        $('.l-popup').attr('data-item_mode', 'report') ;
        $('body').addClass('--overflow-hidden');
        $('.report_message').text('その他');
        $('.report_form').hide()

        $('.report_submit').on('click', function(){

            //ここに管理者へのajaxの処理をお願いします。
            // 成功した時の処理
            $('.l-popup').find('.c-notification--secondary.notification').show().delay(400).fadeOut();
            $(this).attr('disabled', 'disabled');
            setTimeout(
                function(){
                    $('body').removeClass('--overflow-hidden');
                    $('.l-popup').attr('data-item_mode', 'false');
                },
                700
            )
        })

        $('.l-popup .l-popup__close').on('click', function(){
            $('body').removeClass('--overflow-hidden');
            $('.l-popup').attr('data-item_mode', 'false');
        })
    })

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

    document.addEventListener('DOMContentLoaded', function() {
        const url = new URL(location.href);
        const params = new URLSearchParams(url.search);
        if (params.get('mode') !== undefined && params.get('mode') == 'select_product_success'){
            alert('リクエストを送信しました');
            params.delete('mode');
            history.replaceState('', '', location.href.replace('&mode=select_product_success', ''));
        }
    })
});
</script>
