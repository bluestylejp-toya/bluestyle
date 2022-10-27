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
                            <dt>カテゴリー：</dt><dd><!--{$arrSearch.category|h}--></dd>
                        <!--{/if}-->
                        <!--{if $arrSearch.maker != '指定なし' && $arrSearch.maker != null}-->
                            <dt>出費者の地域：</dt><dd><!--{$arrSearch.maker|h}--></dd>
                        <!--{/if}-->
                        <!--{if $arrSearch.name != '指定なし' && $arrSearch.name != null}-->
                        <dt>検索ワード：</dt><dd><!--{$arrSearch.name|h}--></dd>
                        <!--{/if}-->
                    </dl>
                    <!--▲件数-->
                <!--{/if}-->

                <!--▼ページナビ(上部)-->
                <form name="page_navi_top" id="page_navi_top" action="?">
                    <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
                </form>
                <!--▲ページナビ(上部)-->

                <ul class="c-list-item__main_ul">
            <!--{/if}-->

            <!--{assign var=id value=$arrProduct.product_id}-->
            <!--{assign var=arrErr value=$arrProduct.arrErr}-->
            <!--▼商品-->

			<li>
                <a href="<!--{$smarty.const.P_DETAIL_URLPATH}--><!--{$arrProduct.product_id|u}-->" class="c-list-item<!--{if $arrProduct.stock_max < 1}--> c-list-item__soldout_bg<!--{/if}-->">
					<figure class="c-list-item__img">
						<img src="<!--{$smarty.const.IMAGE_SAVE_URLPATH}--><!--{$arrProduct.sub_large_image1|sfNoImageMainList|h}-->" alt="<!--{$arrProduct.name|h}-->の写真" decoding="async" loading="lazy" />
						<!--{if $arrProduct.customer_id == $customer_id}-->
							<figcaption class="c-list-item__my-item">出品中</figcaption>
						<!--{/if}-->
					</figure>
					<div class="c-list-item__main">
						<!--{$tpl_my_product}-->
						<h3 class="c-list-item__title"><!--{$arrProduct.name|mb_substr:0:16|h|nl2br}--><!--{if $arrProduct.name|mb_strlen > 16}-->...<!--{/if}--></h3>
						<span class="c-list-item__request<!--{if $arrProduct.registered_favorite}--> --active<!--{/if}-->" data-product_id="<!--{$arrProduct.product_id|h}-->"><svg class="icon" width="24px" height="24px" viewBox="0 0 500 500">
						<path class="heart" d="M250,187.4c-31.8-47.8-95.5-19.8-95.5,32.2c0,35.2,31.8,60.3,55.7,79.2c24.9,19.7,31.8,23.9,39.8,31.8 c7.9-7.9,14.6-12.6,39.8-31.8c24.3-18.5,55.7-44.4,55.7-79.6C345.5,167.6,281.8,139.7,250,187.4z" fill="<!--{if $arrProduct.registered_favorite}-->#ffffff<!--{else}-->#72c8e2<!--{/if}-->"></path></svg><!--{$arrProduct.count_of_favorite|h}--></span>
						<!--{* 以下にアイテム説明が入ります*}-->
						<p class="c-list-item__description"><!--{if $arrProduct.sub_title1}--><!--{$arrProduct.sub_title1|mb_substr:0:36|h|nl2br}--><!--{if $arrProduct.sub_title1|mb_strlen > 36}-->...<!--{/if}--><!--{/if}--></p>
						<!--{* 以下に出品者情報が入ります*}-->
                    </div>
                    <!--{if $arrProduct.chain_id != ""}--><div class="c-list-item__soldout">Chain成立済み</div><!--{/if}-->
                </a>
                    <div class="c-list-item__seller">
                        <dl>
                            <dt>出品者:</dt>
                            <dd>
                                <a href="<!--{$smarty.const.TOP_URL}-->shopping/seller.php?seller_id=<!--{$arrProduct.customer_id|h}-->">
                                    <!--{$arrProduct.nickname|mb_substr:0:8|h|nl2br}--><!--{if $arrProduct.nickname|mb_strlen > 8}-->...<!--{/if}-->
                                </a>
                            </dd>
                        </dl>
					</div>
					<!--{$arrProduct.sub_comment1|h}-->
			</li>
		<!--▲商品-->

            <!--{if $smarty.foreach.arrProducts.last}-->
        </ul>
        <!--▼ページナビ(下部)-->
        <form name="page_navi_bottom" id="page_navi_bottom" action="?">
            <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
            <!--{if $tpl_subtitle !== '検索結果'}-->
                <!--{if $tpl_linemax >  $disp_number}--><!--{$smarty.capture.page_navi_body nofilter}--><!--{/if}-->
            <!--{/if}-->
        </form>
        <!--▲ページナビ(下部)-->
    <!--{/if}-->

    <!--{foreachelse}-->
        <!--{include file="frontparts/search_zero.tpl"}-->
    <!--{/foreach}-->

    </div>


<!--{strip}-->

</div>
