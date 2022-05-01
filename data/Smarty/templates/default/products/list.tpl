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
                    <div class="c-alert--gray --show u-mb--4">
                        <a target="_blank" href="https://daisy-supply-c7e.notion.site/Chain-7933936254d840a1a0ee89e0bf83e61a" class="c-btn--default">ご利用ガイド</a>
                        <button type="button" class="c-btn--default c-prohibited__btn">禁止アイテム</button>
                        <button type="button" class="close-btn"><svg width="20" height="21" viewBox="0 0 20 21" fill="none" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M0 10.9888C0 5.45877 4.47 0.98877 10 0.98877C15.53 0.98877 20 5.45877 20 10.9888C20 16.5188 15.53 20.9888 10 20.9888C4.47 20.9888 0 16.5188 0 10.9888ZM13.59 15.9888L15 14.5788L11.41 10.9888L15 7.39877L13.59 5.98877L10 9.57877L6.41 5.98877L5 7.39877L8.59 10.9888L5 14.5788L6.41 15.9888L10 12.3988L13.59 15.9888Z" fill="#9DA4B0"/></svg></button>
                    </div>

                <!--{/if}-->
                <ul>
            <!--{/if}-->

            <!--{assign var=id value=$arrProduct.product_id}-->
            <!--{assign var=arrErr value=$arrProduct.arrErr}-->
            <!--▼商品-->

			<li>
				<a href="<!--{$smarty.const.P_DETAIL_URLPATH}--><!--{$arrProduct.product_id|u}-->"  class="c-list-item">
					<figure class="c-list-item__img">
						<img src="<!--{$smarty.const.IMAGE_SAVE_URLPATH}--><!--{$arrProduct.sub_large_image1|sfNoImageMainList|h}-->" alt="<!--{$arrProduct.name|h}-->" decoding="async" loading="lazy" />
						<!--{if $arrProduct.customer_id == $customer_id}-->
							<figcaption class="c-list-item__my-item">出品中</figcaption>
						<!--{/if}-->
					</figure>
					<div class="c-list-item__main">
						<!--{$tpl_my_product}-->
						<h3 class="c-list-item__title"><!--{$arrProduct.product_id|u}--><!--{$arrProduct.name|mb_substr:0:16|h|nl2br}--><!--{if $arrProduct.name|mb_strlen > 16}-->...<!--{/if}--></h3>
						<span class="c-list-item__request<!--{if $arrProduct.registered_favorite}--> --active<!--{/if}-->" data-product_id="<!--{$arrProduct.product_id|h}-->"><svg class="icon" width="24px" height="24px" viewBox="0 0 500 500">
						<path class="heart" d="M250,187.4c-31.8-47.8-95.5-19.8-95.5,32.2c0,35.2,31.8,60.3,55.7,79.2c24.9,19.7,31.8,23.9,39.8,31.8 c7.9-7.9,14.6-12.6,39.8-31.8c24.3-18.5,55.7-44.4,55.7-79.6C345.5,167.6,281.8,139.7,250,187.4z" fill="<!--{if $arrProduct.registered_favorite}-->#ffffff<!--{else}-->#72c8e2<!--{/if}-->"></path></svg><!--{$arrProduct.count_of_favorite|h}--></span>
						<!--{* 以下にアイテム説明が入ります*}-->
						<p class="c-list-item__description"><!--{if $arrProduct.sub_title1}--><!--{$arrProduct.sub_title1|mb_substr:0:40|h|nl2br}--><!--{if $arrProduct.sub_title1|mb_strlen > 16}-->...<!--{/if}--><!--{/if}--></p>
						<!--{* 以下に出品者情報が入ります*}-->
						<p  class="c-list-item__seller">出品者:<!--{$arrProduct.nickname|h}--></p>
					</div>
					<!--{$arrProduct.sub_comment1|h}-->
				</a>
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
    <div class="c-prohibited__content">
        <p>Chain では以下のアイテムの出品を禁止しています。</p>
        <ul>
            <li>偽ブランド品、正規品と確証のないもの</li>
            <li>盗品やそれに類する物品</li>
            <li>犯罪や違法行為に使用される可能性があるもの</li>
            <li>殺傷能力があり武器として使用されるもの</li>
            <li>銃刀法などの法律に違反するおそれのあるもの</li>
            <li>用途が明確な生活用の刃物</li>
            <li>児童ポルノやそれに類するとみなされるもの</li>
            <li>18禁、アダルト関連</li>
            <li>医薬品、医療機器</li>
            <li>許可なく製造した化粧品類や小分けした化粧品類</li>
            <li>法令に抵触するサプリメント類</li>
            <li>安全面、衛生面に問題のある食品類</li>
            <li>農薬、肥料</li>
            <li>受け渡しに伴う手続きが複雑なもの</li>
            <li>手元にないもの</li>
            <li>規制薬物・危険ドラッグ類</li>
            <li>個人情報を含む出品・投稿、個人情報の不正利用</li>
            <li>外国為替及び外国貿易法（外為法）に抵触する物品について</li>
            <li>その他、不適切と判断されるもの</li>
        </ul>
        <p>管理会社が禁止出品物に当てはまると判断したものは、弊社の判断で掲載を取りやめる、商品情報を削除するものとします。</p>
        <button type="button" class="c-prohibited__close-btn c-btn--default">閉じる</button>
    </div>
    <div class="c-onboarding__bg"></div>
<!--{strip}-->

</div>
<script>
$('.c-prohibited__btn').on('click', function(){
    $('.c-prohibited__content').fadeIn();
    $('.c-onboarding__bg').fadeIn();
    $('.c-onboarding__bg,.c-prohibited__close-btn').on('click', function(){
        $('.c-prohibited__content').fadeOut();
    $('.c-onboarding__bg').fadeOut();
    })
})
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
