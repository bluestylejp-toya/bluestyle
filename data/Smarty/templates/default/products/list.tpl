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
    function fnSetClassCategories(form, classcat_id2_selected) {
        var $form = $(form);
        var product_id = $form.find('input[name=product_id]').val();
        var $sele1 = $form.find('select[name=classcategory_id1]');
        var $sele2 = $form.find('select[name=classcategory_id2]');
        eccube.setClassCategories($form, product_id, $sele1, $sele2, classcat_id2_selected);
    }
    // 並び順を変更
    function fnChangeOrderby(orderby) {
        eccube.setValue('orderby', orderby);
        eccube.setValue('pageno', 1);
        eccube.submitForm();
    }
    // 表示件数を変更
    function fnChangeDispNumber(dispNumber) {
        eccube.setValue('disp_number', dispNumber);
        eccube.setValue('pageno', 1);
        eccube.submitForm();
    }
    // カゴに入れる
    function fnInCart(productForm) {
        var searchForm = $("#form1");
        var cartForm = $(productForm);
        // 検索条件を引き継ぐ
        var hiddenValues = ['mode','category_id','maker_id','name','orderby','disp_number','pageno','rnd'];
        $.each(hiddenValues, function(){
            // 商品別のフォームに検索条件の値があれば上書き
            if (cartForm.has('input[name='+this+']').length != 0) {
                cartForm.find('input[name='+this+']').val(searchForm.find('input[name='+this+']').val());
            }
            // なければ追加
            else {
                cartForm.append($('<input type="hidden" />').attr("name", this).val(searchForm.find('input[name='+this+']').val()));
            }
        });
        // 商品別のフォームを送信
        cartForm.submit();
    }
//]]></script>

<!--{strip}-->
    <div class="p-item-list --active" data-tab_item="0">
        <form name="form1" id="form1" method="get" action="?">
            <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
            <input type="hidden" name="mode" value="<!--{$mode|h}-->" />
            <!--{* ▼検索条件 *}-->
            <input type="hidden" name="category_id" value="<!--{$arrSearchData.category_id|h}-->" />
            <input type="hidden" name="maker_id" value="<!--{$arrSearchData.maker_id|h}-->" />
            <input type="hidden" name="name" value="<!--{$arrSearchData.name|h}-->" />
            <!--{* ▲検索条件 *}-->
            <!--{* ▼ページナビ関連 *}-->
            <input type="hidden" name="orderby" value="<!--{$orderby|h}-->" />
            <input type="hidden" name="disp_number" value="<!--{$disp_number|h}-->" />
            <input type="hidden" name="pageno" value="<!--{$tpl_pageno|h}-->" />
            <!--{* ▲ページナビ関連 *}-->
            <input type="hidden" name="rnd" value="<!--{$tpl_rnd|h}-->" />
        </form>


        <!--▼検索条件-->
        <!--{if $tpl_subtitle == "検索結果"}-->
            <!--<ul class="pagecond_area">
                <li><strong>カテゴリー：</strong><!--{$arrSearch.category|h}--></li>
                <!--{if $arrSearch.maker|strlen >= 1}--><li><strong>メーカー：</strong><!--{$arrSearch.maker|h}--></li><!--{/if}-->
                <li><strong>商品名：</strong><!--{$arrSearch.name|h}--></li>
                <li><strong>出品者の都道府県：</strong><!--{$arrSearch.pref|h}--></li>
                <li><strong>商品の状態：</strong><!--{$arrSearch.product_status|h}--></li>
            </ul>-->
        <!--{/if}-->
        <!--▲検索条件-->

        <!--{* 交換選択待ち商品あり *}-->
        <!--{if $hasUnselectdProductFlg}-->
            交換するアイテムを選んでください
        <!--{/if}-->

        <!--▼ページナビ(本文)-->
        <!--{capture name=page_navi_body}-->
            <div class="pagenumber_area clearfix">
                <div class="change">

                    <!--<select name="disp_number" onchange="javascript:fnChangeDispNumber(this.value);">
                        <!--{foreach from=$arrPRODUCTLISTMAX item="dispnum" key="num"}-->
                            <!--{if $num == $disp_number}-->
                                <option value="<!--{$num}-->" selected="selected" ><!--{$dispnum}--></option>
                            <!--{else}-->
                                <option value="<!--{$num}-->" ><!--{$dispnum}--></option>
                            <!--{/if}-->
                        <!--{/foreach}-->
                    </select>-->
                </div>
                <div class="c-pagination"><!--{$tpl_strnavi}--></div>
            </div>
        <!--{/capture}-->
        <!--▲ページナビ(本文)-->

        <!--{foreach from=$arrProducts item=arrProduct name=arrProducts}-->

            <!--{if $smarty.foreach.arrProducts.first}-->
                <!--{if $tpl_subtitle == "検索結果"}-->
                <!--▼件数-->
                    <dl class="u-mb--4 c-list--search">
                        <dt>アイテム数：</dt><dd><!--{$tpl_linemax}-->件</dd>
                        <!--{if $arrSearch.category != '指定なし' && $arrSearch.category != null}-->
                            <dt>カテゴリー：</dt><dd><!--{$arrSearch.category|h}--></dt>
                        <!--{/if}-->
                        <!--{if $arrSearch.maker != '指定なし' && $arrSearch.maker != null}-->
                            <dt>出費者の地域：</dt><dd><!--{$arrSearch.maker|h}--></dt>
                        <!--{/if}-->
                    </dl>
                    <!--▲件数-->
                <!--{/if}-->

                <!--▼ページナビ(上部)-->
                <form name="page_navi_top" id="page_navi_top" action="?">
                    <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
                </form>
                <!--▲ページナビ(上部)-->
                <!--{if $tpl_subtitle === '全商品'}-->
                    <div class="c-alert--gray --show u-mb--4"><button type="button" class="c-btn--default c-onboarding__show-btn">Chainの使い方</button><button type="button" class="close-btn"><svg width="20" height="21" viewBox="0 0 20 21" fill="none" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M0 10.9888C0 5.45877 4.47 0.98877 10 0.98877C15.53 0.98877 20 5.45877 20 10.9888C20 16.5188 15.53 20.9888 10 20.9888C4.47 20.9888 0 16.5188 0 10.9888ZM13.59 15.9888L15 14.5788L11.41 10.9888L15 7.39877L13.59 5.98877L10 9.57877L6.41 5.98877L5 7.39877L8.59 10.9888L5 14.5788L6.41 15.9888L10 12.3988L13.59 15.9888Z" fill="#9DA4B0"/></svg></button></div>
                <!--{/if}-->
                <ul class="l-item-list">
            <!--{/if}-->

            <!--{assign var=id value=$arrProduct.product_id}-->
            <!--{assign var=arrErr value=$arrProduct.arrErr}-->
            <!--▼商品-->

                <li class="c-item--default">
                    <a href="<!--{$smarty.const.P_DETAIL_URLPATH}--><!--{$arrProduct.product_id|u}-->"  class="c-item--default__img">
                        <span class="c-square"><img src="<!--{$smarty.const.IMAGE_SAVE_URLPATH}--><!--{$arrProduct.sub_large_image1|sfNoImageMainList|h}-->" alt="<!--{$arrProduct.name|h}-->" decoding="async" loading="lazy" /></span>

                    <!--{if $arrProduct.customer_id == $customer_id}-->
                        <span class="c-item--default__my-item">出品中</span>
                    <!--{/if}-->

                        <span class="favorite_area"><span class="c-item--default__request<!--{if $arrProduct.registered_favorite}--> --active<!--{/if}-->" data-product_id="<!--{$arrProduct.product_id|h}-->"><!--{$arrProduct.count_of_favorite|h}--></span></span>
                    </a>

                    <!--{$tpl_my_product}-->
                    <p class="c-item--default__title"><a href="<!--{$smarty.const.P_DETAIL_URLPATH}--><!--{$arrProduct.product_id|u}-->"><!--{$arrProduct.name|mb_substr:0:16|h|nl2br}--><!--{if $arrProduct.name|mb_strlen > 16}-->...<!--{/if}--></a></p>
                </li>
            <!--▲商品-->

            <!--{if $smarty.foreach.arrProducts.last}-->
        </ul>
        <!--▼ページナビ(下部)-->
        <form name="page_navi_bottom" id="page_navi_bottom" action="?">
            <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
            <!--{if $tpl_subtitle !== '検索結果'}-->
                <!--{if $tpl_linemax > 0}--><!--{$smarty.capture.page_navi_body nofilter}--><!--{/if}-->
            <!--{/if}-->
        </form>
        <!--▲ページナビ(下部)-->
    <!--{/if}-->

    <!--{foreachelse}-->
        <!--{include file="frontparts/search_zero.tpl"}-->
    <!--{/foreach}-->

    </div>
    <div class="c-onboarding">
        <ol>
            <li class="--active">
                <h2>出品しましょう</h2>
                <figure><img src="<!--{$TPL_URLPATH}-->img/products/on-boarding-01.png"></figure>
                <p>画面下のカメラアイコン（出品）を押して出品しましょう！</p>
            </li>
            <li>
                <h2>「ほしい」をしましょう</h2>
                <figure><img src="<!--{$TPL_URLPATH}-->img/products/on-boarding-02.png"></figure>
                <p>出品できたら、次は欲しいアイテムを見つけましょう！手に入れたいアイテムにすべて「ほしい」と意思表示しましょう。</p>
            </li>
            <li>
                <h2>「ほしい」されるのを<br>待ちましょう</h2>
                <figure><img src="<!--{$TPL_URLPATH}-->img/products/on-boarding-03.png"></figure>
                <p>自分の出品アイテムに対して誰かが「ほしい」と意思表示してくれます。<br><small class="u-color--red">※現在は、誰が「ほしい」を押したかは確認できません</small></p>
            </li>
            <li>
                <h2>Chainが成立したら<br>通知が来ます</h2>
                <figure><img src="<!--{$TPL_URLPATH}-->img/products/on-boarding-04.png"></figure>
                <p>みんなの「ほしい」が繋がって輪になることでChain（物々交換）が成立します。<br><small class="u-color--red">※通知がメールで届きます</small></p>
            </li>
        </ol>

        <div class="c-onboarding__btn">
            <button type="button" class="c-onboarding__prev-btn --hidden">前へ</button>
            <button type="button" class="c-onboarding__next-btn">次へ</button>
            <button type="button" class="c-onboarding__close-btn --hidden">閉じる</button>
        </div>
    </div>
    <div class="c-onboarding__bg"></div>
<!--{strip}-->

</div>
<script>
$('.c-alert--gray .close-btn').on('click', function(){
    $('.c-alert--gray').fadeOut();
})
$('.c-onboarding__show-btn').on('click', function(){
    $('.c-onboarding').fadeIn();
    $('.c-onboarding__bg').fadeIn();
    $('body').addClass('--overflow-hidden');
    let $lists = $('.c-onboarding ol li');
    let $num = 0;

    $('.c-onboarding__next-btn').on('click', function(){
        if($num < ($lists.length - 1)) {
            ++$num
            $('.c-onboarding ol li').removeClass('--active')
            $('.c-onboarding ol li').eq($num).addClass('--active')

            if($num == 1) {
                $('.c-onboarding__prev-btn').removeClass('--hidden')
            }
            if($num === 3) {
                $(this).addClass('--hidden')
                $('.c-onboarding__close-btn').removeClass('--hidden')
            }
        }

    })
    $('.c-onboarding__prev-btn').on('click', function(){
        if($num !== 0) {
            --$num
            $('.c-onboarding ol li').removeClass('--active')
            $('.c-onboarding ol li').eq($num).addClass('--active')
            if($num == 0) {
                $('.c-onboarding__prev-btn').addClass('--hidden')
            }
            if($num < 4) {
                $('.c-onboarding__next-btn').removeClass('--hidden')
                $('.c-onboarding__close-btn').addClass('--hidden')
            }
        }
    })
    $('.c-onboarding__bg,.c-onboarding__close-btn').on('click', function(){
        $num = 0;
        $('.c-onboarding').fadeOut();
        $('.c-onboarding__bg').fadeOut();
        $('.c-onboarding ol li').removeClass('--active')
        $('.c-onboarding ol li').eq($num).addClass('--active')
        $('.c-onboarding__prev-btn').addClass('--hidden')
        $('.c-onboarding__next-btn').removeClass('--hidden')
        $('.c-onboarding__close-btn').addClass('--hidden')
        $('body').removeClass('--overflow-hidden');
    })
})
</script>
