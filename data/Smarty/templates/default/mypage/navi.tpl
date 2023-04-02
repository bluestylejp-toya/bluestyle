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

<div>
    <!--{strip}-->
        <ul class="c-nav-list u-mb--4">

            <!--{* 会員状態 *}-->
            <!--{if $tpl_login}-->
                <li><a href="<!--{$smarty.const.ROOT_URLPATH|h}-->profile.php?customer_id=<!--{$arrCustomer.customer_id|h}-->" class="<!--{if $tpl_mypageno == 'profile'}--> selected<!--{/if}-->">プロフィール</a></li>
                <li><a href="<!--{$smarty.const.TOP_URL}-->mypage/change.php" class="<!--{if $tpl_mypageno == 'change'}--> selected<!--{/if}-->">アカウント</a></li>
                <li><a href="<!--{$smarty.const.TOP_URL}-->mypage/card_info.php" class="<!--{if $tpl_mypageno == 'change'}--> selected<!--{/if}-->">支払い情報</a></li>
                <!--<li><a href="./<!--{$smarty.const.DIR_INDEX_PATH}-->" class="<!--{if $tpl_mypageno == 'index'}--> selected<!--{/if}-->">
                    購入履歴一覧</a></li>-->
                <!--{if $smarty.const.OPTION_FAVORITE_PRODUCT == 1}-->
                    <!--<li><a href="favorite.php" class="<!--{if $tpl_mypageno == 'favorite'}--> selected<!--{/if}-->">
                        お気に入り一覧</a></li>-->
                <!--{/if}-->

                <!--<li><a href="item_edit.php" class="<!--{if $tpl_mypageno == 'item_edit'}--> selected<!--{/if}-->">
                    アイテム登録</a></li>-->
                <li><a href="<!--{$smarty.const.TOP_URL}-->mypage/myitem/myitem_list.php" class="<!--{if $tpl_mypageno == 'item-list'}--> selected<!--{/if}-->">
                    Chain成立アイテム<!--{*<span class="c-batch--num"><!--{$arrListingProducts|@count}--></span> *}--></a></li>
                <!--<li><a href="<!--{$smarty.const.TOP_URL}-->mypage/myitem/request_list.php" class="<!--{if $tpl_mypageno == 'item-list'}--> selected<!--{/if}-->">
                    Chain の状況<span class="c-batch--num"><!--{$arrListingProducts|@count}--></span></a></li>-->
                <!--<li><a href="delivery.php" class="<!--{if $tpl_mypageno == 'delivery'}--> selected<!--{/if}-->">
                    お届け先追加・変更</a></li>-->
                <!--<li><a href="refusal.php" class="<!--{if $tpl_mypageno == 'refusal'}--> selected<!--{/if}-->">
                    退会手続き</a></li>-->
                    <li><a href="<!--{$smarty.const.TOP_URL}-->mypage/favorite.php">ほしいアイテム</a></li>
                    <li><a href="https://lin.ee/NGSPD7f">LINE連携</a></li>

            <!--{* 退会状態 *}-->
            <!--{else}-->
                <li><a href="<!--{$smarty.const.TOP_URL}-->" class="<!--{if $tpl_mypageno == 'index'}--> selected<!--{/if}-->">
                    購入履歴一覧</a></li>
                <!--{if $smarty.const.OPTION_FAVORITE_PRODUCT == 1}-->
                    <li><a href="<!--{$smarty.const.TOP_URL}-->" class="<!--{if $tpl_mypageno == 'favorite'}--> selected<!--{/if}-->">
                        お気に入り一覧</a></li>
                <!--{/if}-->
                <li><a href="<!--{$smarty.const.TOP_URL}-->" class="<!--{if $tpl_mypageno == 'change'}--> selected<!--{/if}-->">
                    会員登録内容変更</a></li>
                <li><a href="<!--{$smarty.const.TOP_URL}-->" class="<!--{if $tpl_mypageno == 'profile'}--> selected<!--{/if}-->">
                    プロフィール編集</a></li>
                <li><a href="<!--{$smarty.const.TOP_URL}-->" class="<!--{if $tpl_mypageno == 'item_edit'}--> selected<!--{/if}-->">
                    アイテム登録</a></li>
                <li><a href="<!--{$smarty.const.TOP_URL}-->" class="<!--{if $tpl_mypageno == 'item-list'}--> selected<!--{/if}-->">
                    出品中アイテム一覧</a></li>
                <li><a href="<!--{$smarty.const.TOP_URL}-->" class="<!--{if $tpl_mypageno == 'delivery'}--> selected<!--{/if}-->">
                    お届け先追加・変更</a></li>
                <!--<li><a href="<!--{$smarty.const.TOP_URL}-->" class="<!--{if $tpl_mypageno == 'refusal'}--> selected<!--{/if}-->">
                    退会手続き</a></li>-->

            <!--{/if}-->
        </ul>

        <!--▼現在のポイント-->
        <!--{if $point_disp !== false}-->
            <!--<div class="point_announce clearfix">
                <p>ようこそ&nbsp;／&nbsp;
                    <span class="user_name"><!--{$CustomerName1|h}--> <!--{$CustomerName2|h}-->様</span>
                    <!--{if $smarty.const.USE_POINT !== false}-->&nbsp;
                        現在の所持ポイントは&nbsp;<span class="point st"><!--{$CustomerPoint|n2s|default:"0"|h}-->pt</span>&nbsp;です。
                    <!--{/if}-->
                </p>
            </div>-->
        <!--{/if}-->
        <!--▲現在のポイント-->
    <!--{/strip}-->

</div>
<!--▲NAVI-->
