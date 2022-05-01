<!--{*
/*
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
 */
*}-->

<section>
    <div class="l-header__inner u-mb--4">
        <a href="<!--{$smarty.const.TOP_URL}-->mypage/" aria-label="戻る" class="c-btn--header-nav"></a>
        <h1 class="c-header-title">ほしいアイテム</h1>
    </div>
    <div id="mycontents_area">
        <form name="form1" id="form1" method="post" action="?">
            <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
            <input type="hidden" name="order_id" value="" />
            <input type="hidden" name="pageno" value="<!--{$tpl_pageno}-->" />
            <input type="hidden" name="mode" value="" />
            <input type="hidden" name="product_id" value="" />

            <!--{if $tpl_linemax > 0}-->

                <p><!--{$tpl_linemax}-->件のほしいアイテムがあります。</p>

                <ul>
					<!--{assign var=id value=''}-->
                    <!--{section name=cnt loop=$arrFavorite}-->
                        <!--{assign var=product_id value="`$arrFavorite[cnt].product_id`"}-->
						<!--{if $id != $product_id}-->
						<!--{assign var=id value=`$product_id`}-->
                        <li >
							<a href="<!--{$smarty.const.TOP_URL}-->products/detail.php?product_id=<!--{$product_id|u}-->&open=true" class="c-item">
								<figure class="<!--{if $item.progress_percent == 100}-->chained<!--{/if}-->"><img src="<!--{$smarty.const.IMAGE_SAVE_URLPATH}--><!--{$arrFavorite[cnt].sub_large_image1|sfNoImageMainList|h}-->" alt="<!--{$arrFavorite[cnt].name|h}-->" class="c-item__img"/></figure>
								<div class="c-item__main">
									<p class="c-item__title"><!--{$arrFavorite[cnt].name|h}--></p>
									<span class="c-item__request"><!--{$arrFavorite[cnt].count_of_favorite|n2s|h}--></span>
								</div>
							</a>
                        </li>
                    <!--{/if}-->
                    <!--{/section}-->
                </ul>

            <!--{else}-->
                <p>まだほしいアイテムはありません。</p>
            <!--{/if}-->
        </form>
    </div>
</div>
