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

<div id="home">

    <!--{* お知らせここから *}-->
    <div id="home-info">
        <!--{foreach item=info from=$arrInfo}-->
            <dl class="home-info-item">
                <dt class="date"><!--{$info.disp_date|sfDispDBDate:false|h}--></dt>
                <dt class="title"><!--{$info.title}--></dt>
                <dd class="body"><!--{$info.body}--></dd>
            </dl>
        <!--{/foreach}-->
    </div>
    <!--{* お知らせここまで *}-->

    <!--{* メインエリア *}-->
    <div id="home-main">
        <form name="form1" id="form1" method="post" action="#">
            <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />


            <!--{* ショップの状況ここから *}-->
            <h2>ショップの状況</h2>
            <table summary="ショップの状況" class="shop-info">
                <tr>
                    <th>現在の会員数</th>
                    <td><!--{$customer_cnt|default:"0"|n2s}-->名</td>
                </tr>
                <tr>
                    <th>現在の退会者数</th>
                    <td><!--{$refusalcustomer_cnt|default:"0"|n2s}-->名</td>
                </tr>
                <tr>
                    <th>ほしい総アイテム数</th>
                    <td><!--{$favorite_cnt|default:"0"|n2s}-->人</td>
                </tr>
                <tr>
                    <th>昨日のほしい総アイテム数</th>
                    <td><!--{$favorite_yesterday_cnt|default:"0"|n2s}-->人</td>
                </tr>
                <tr>
                    <th>今月のほしい総アイテム数</th>
                    <td><!--{$favorite_month_cnt|default:"0"|n2s}-->人</td>
                </tr>
                <tr>
                    <th>出品アイテム総数</th>
                    <td><!--{$Product_cnt|default:"0"|n2s}-->個</td>
                </tr>
                <tr>
                    <th>昨日の売上高</th>
                    <td><!--{$order_yesterday_amount|default:"0"|n2s}-->円</td>
                </tr>
                <tr>
                    <th><span>今月の売上高</span><span>(昨日まで) </span></th>
                    <td><!--{$order_month_amount|default:"0"|n2s}-->円</td>
                </tr>
                <tr>
                    <th>昨日のChain成立アイテム数</th>
                    <td><!--{$order_yesterday_cnt|default:"0"|n2s}-->件</td>
                </tr>
                <tr>
                    <th><span>今月のChain成立アイテム数 </span><span>(昨日まで) </span></th>
                    <td><!--{$order_month_cnt|default:"0"|n2s}-->件</td>
                </tr>
            </table>
            <!--{* ショップの状況ここまで *}-->

            <h2>「ほしい」されたアイテム</h2>
            <dev class="l-item-list history_list_admin_home">
                <div class="seller_favo_frame">
                    <ul class="seller">
                        <li class="c-item--default_admin">
                            <p class="c-item--default__img">アイテム画像</p>
                            <p class="c-item--default__title">アイテム名</p>
                            <p class="c-item--default__value">出品者</p>
                        </li>
                    </ul>
                    <ul class="favo">
                        <li class="c-item--default_admin">
                            <p class="c-item--default__img2">アイテム画像</p>
                            <p class="c-item--default__title2">アイテム名</p>
                            <p class="c-item--default__value2">ほしい人</p>
                            <p class="c-item--default__update_date">「ほしい」された日</p>
                        </li>
                    </ul>
                </div>
                <div class="seller_favo_frame">
                    <ul class="seller">
                        <!--{section name=j loop=$arrNewFavoriteProductsFavo}-->
                        <li class="c-item--default_admin">
                            <div class="c-item--default__img">
                                <figure class="<!--{if $item.progress_percent == 100}-->chained<!--{/if}-->">
                                    <img src="<!--{$smarty.const.IMAGE_SAVE_URLPATH}--><!--{$arrNewFavoriteProductsFavo[j].sub_large_image1|sfNoImageMainList|h}-->" alt="<!--{$arrNewFavoriteProductsFavo[j].name|h}-->" class="c-item__img" width="40px" />
                                </figure>
                            </div>
                            <p class="c-item--default__title">
                                <a href="<!--{$smarty.const.P_DETAIL_URLPATH}--><!--{$arrNewFavoriteProductsFavo[j].product_id}-->" target="_blank">
                                    <!--{$arrNewFavoriteProductsFavo[j].name|mb_substr:0:24|h|nl2br}--><!--{if $arrNewFavoriteProductsFavo[j].name|mb_strlen > 24}-->...<!--{/if}-->
                                </a><!--{if $arrNewFavoriteProductsFavo[j].chain_id|h}--><span>済</span><!--{/if}-->
                            </p>
                            <p class="c-item--default__value">
                                <a href="<!--{$smarty.const.TOP_URL}-->shopping/seller.php?seller_id=<!--{$arrNewFavoriteProductsFavo[j].customer_id}-->" target="_blank">
                                    <!--{$arrNewFavoriteProductsFavo[j].name01|mb_substr:0:4|h|nl2br}-->
                                    <!--{$arrNewFavoriteProductsFavo[j].name02|mb_substr:0:4|h|nl2br}-->
                                </a>
                            </p>
                        </li>
                        <!--{/section}-->
                    </ul>
                <ul class="favo">
                        <!--{section name=i loop=$arrNewFavoriteProducts}-->
                        <li class="c-item--default_admin">
                            <div class="c-item--default__img2">
                                <figure class="<!--{if $item.progress_percent == 100}-->chained<!--{/if}-->">
                                    <img src="<!--{$smarty.const.IMAGE_SAVE_URLPATH}--><!--{$arrNewFavoriteProducts[i].sub_large_image1|sfNoImageMainList|h}-->" alt="<!--{$arrNewFavoriteProducts[i].name|h}-->" class="c-item__img" width="40px" />
                                </figure>
                            </div>
                            <p class="c-item--default__title2">
                                <a href="<!--{$smarty.const.P_DETAIL_URLPATH}--><!--{$arrNewFavoriteProducts[i].product_id}-->" target="_blank">
                                    <!--{$arrNewFavoriteProducts[i].name|mb_substr:0:24|h|nl2br}--><!--{if $arrNewFavoriteProducts[i].name|mb_strlen > 24}-->...<!--{/if}-->
                                </a><!--{if $arrNewFavoriteProducts[i].chain_id|h}--><span>済</span><!--{/if}-->
                            </p>
                            <p class="c-item--default__value2">
                                <a href="<!--{$smarty.const.TOP_URL}-->shopping/seller.php?seller_id=<!--{$arrNewFavoriteProducts[i].customer_id}-->" target="_blank">
                                    <!--{$arrNewFavoriteProducts[i].name01|mb_substr:0:4|h|nl2br}-->
                                    <!--{$arrNewFavoriteProducts[i].name02|mb_substr:0:4|h|nl2br}-->
                                </a>
                            </p>
                            <p class="c-item--default__update_date">
                                <!--{if $smarty.now|date_format:"%Y%m%d" - $arrNewFavoriteProducts[i].update_date|date_format:"%Y%m%d" < 2}-->
                                <span class="attention">
                            <!--{/if}-->
                                    <!--{$arrNewFavoriteProducts[i].update_date|date_format:"%Y年%m月%d日%k時%M分"}-->
                                    <!--{if $smarty.now|date_format:"%Y%m%d" - $arrNewFavoriteProducts[i].update_date|date_format:"%Y%m%d" < 2}-->
                                </span>
                                <!--{/if}-->
                            </p>
                        </li>
                        <!--{/section}-->
                </ul>
                </div>
                    </dev>

            <!--{* 退会者一覧ここから *}-->
            <table summary="退会者コメント" id="home-order">
                <col width="5%" />
                <col width="10%" />
                <col width="10%" />
                <col width="15%" />
                <col width="15%" />
                <col width="45%" />
                <tr>
                    <th class="center">ID</th>
                    <th class="center">登録日</th>
                    <th class="center">退会日</th>
                    <th class="center">退会者ニックネーム</th>
                    <th class="center">退会者名</th>
                    <th class="center">退会理由</th>
                </tr>
            <!--{section name=r loop=$arrRefusalComment}-->

                <tr>
                    <td><!--{$arrRefusalComment[r].customer_id}--></td>
                    <td><!--{$arrRefusalComment[r].create_date}--></td>
                    <td><!--{$arrRefusalComment[r].update_date}--></td>
                    <td><!--{$arrRefusalComment[r].name01|h}--></td>
                    <td><!--{$arrRefusalComment[r].name02|h}--></td>
                    <td><!--{$arrRefusalComment[r].refusal_reason|h}--></td>
                </tr>
            <!--{/section}-->
            </table>
            <!--{* 退会者一覧ここまで *}-->

            <!--{* 新規受付一覧ここから *}-->
            <h2>新規受付一覧</h2>
            <table summary="新規受付一覧" id="home-order">
                <tr>
                    <th class="center">受注日</th>
                    <th class="center">お名前</th>
                    <th class="center">購入商品</th>
                    <th class="center">支払方法</th>
                    <th class="center">購入金額(円)</th>
                </tr>
                <!--{section name=i loop=$arrNewOrder}-->
                <tr>
                    <td><!--{$arrNewOrder[i].create_date}--></td>
                    <td><!--{$arrNewOrder[i].name01|h}--> <!--{$arrNewOrder[i].name02|h}--></td>
                    <td><!--{$arrNewOrder[i].product_name|h}--></td>
                    <td><!--{$arrNewOrder[i].payment_method|h}--></td>
                    <td class="right"><!--{$arrNewOrder[i].total|n2s}-->円</td>
                </tr>
                <!--{/section}-->
            </table>
            <!--{* 新規受付一覧ここまで *}-->

        </form>
        <!--{* システム情報ここから *}-->
        <h2>システム情報</h2>
        <table summary="システム情報" class="shop-info">
            <tr>
                <th>EC-CUBEバージョン</th>
                <td><!--{$smarty.const.ECCUBE_VERSION}--></td>
            </tr>
            <tr>
                <th>PHPバージョン</th>
                <td><!--{$php_version}--></td>
            </tr>
            <tr>
                <th>DBバージョン</th>
                <td><!--{$db_version}--></td>
            </tr>
            <tr>
                <th>詳細</th>
                <td><a href="<!--{$smarty.const.ROOT_URLPATH}--><!--{$smarty.const.ADMIN_DIR}-->system/system.php">システム設定＞システム情報</a></td>
            </tr>
        </table>
        <!--{* システム情報ここまで *}-->
    </div>
    <!--{* メインエリア *}-->

</div>
