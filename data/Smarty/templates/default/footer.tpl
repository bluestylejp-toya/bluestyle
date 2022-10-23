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

<!--▼FOOTER-->
<!--{strip}-->

<nav class="l-footer-nav">
    <!--{if $tpl_login }-->
        <!--{assign var=is_login value=true}-->
    <!--{else}-->
        <!--{assign var=is_login value=false}-->
    <!--{/if}-->
    <!--{assign var=current value="other"}-->
    <!--{if $tpl_page_class_name ==="LC_Page_Products_Detail" or $tpl_page_class_name === "LC_Page_Products_List"}-->
        <!--{assign var=current value="search"}-->
    <!--{else if $tpl_page_class_name == "LC_Page_AbstractMypage"}-->
        <!--{if $smarty.server.PHP_SELF == "`$smarty.const.ROOT_URLPATH`mypage/item-list.php" or  $smarty.server.PHP_SELF == "`$smarty.const.ROOT_URLPATH`mypage/item_edit.php"}-->
            <!--{assign var=current value="display"}-->
        <!--{else if $smarty.server.PHP_SELF == "`$smarty.const.ROOT_URLPATH`mypage/index.php" or $smarty.server.PHP_SELF == "`$smarty.const.ROOT_URLPATH`mypage/profile.php" or $smarty.server.PHP_SELF == "`$smarty.const.ROOT_URLPATH`mypage/change.php" or $smarty.server.PHP_SELF == "`$smarty.const.ROOT_URLPATH`mypage/login.php"}-->
            <!--{assign var=current value="mypage"}-->
    <!--{else if $smarty.server.PHP_SELF == "`$smarty.const.ROOT_URLPATH`mypage/change.php" or $smarty.server.PHP_SELF == "`$smarty.const.ROOT_URLPATH`mypage/profile.php" or $smarty.server.PHP_SELF == "`$smarty.const.ROOT_URLPATH`mypage/change.php" or $smarty.server.PHP_SELF == "`$smarty.const.ROOT_URLPATH`mypage/login.php"}-->
    <!--{assign var=current value="change"}-->
    <!--{else if $smarty.server.PHP_SELF == "`$smarty.const.ROOT_URLPATH`mypage/change_complete.php" or $smarty.server.PHP_SELF == "`$smarty.const.ROOT_URLPATH`mypage/profile.php" or $smarty.server.PHP_SELF == "`$smarty.const.ROOT_URLPATH`mypage/change.php" or $smarty.server.PHP_SELF == "`$smarty.const.ROOT_URLPATH`mypage/login.php"}-->
    <!--{assign var=current value="complete"}-->
        <!--{else if $smarty.server.PHP_SELF|mb_strpos:'myitem' !== false}-->
            <!--{assign var=current value="mypage"}-->
        <!--{/if}-->
    <!--{/if}-->

    <!--{if !$ok AND $current == 'search' AND $is_login}-->
    <a href="<!--{$smarty.const.HTTPS_URL}-->mypage/">
    <div class="login_member_text">
        <p>
            ①住所を入力してください
        </p>
    </div>
    </a>
    <!--{elseif $current == 'search' AND $is_login AND $smarty.session.unregistered_card && $smarty.server.PHP_SELF!=$card_info}-->
    <a href="<!--{$smarty.const.HTTPS_URL}-->mypage/card_info.php">
        <div class="login_member_text">
            <p>
                ②カード情報を入力してください
            </p>
        </div>
    </a>
    <!--{elseif $arrListingProducts|@count == 0 AND $is_login AND $current == 'search'}-->
    <a href="<!--{$smarty.const.HTTPS_URL}-->mypage/item_edit.php">
    <div class="upload_text">
        <p>
            <!--{if $arrListingProducts|@count == $tpl_linemax3}-->③<!--{/if}-->出品しましょう
        </p>
    </div>
    </a>
    <!--{elseif $current == 'search' AND $is_login AND $arrListingProducts|@count > 0 AND $tpl_linemax2 < 1}-->
    <div class="favorite_text">
        <p>
            <!--{if $arrListingProducts|@count == $tpl_linemax3}-->④<!--{/if}-->「ほしい」を押して参加しよう
        </p>
    </div>
    <!--{elseif !$is_login AND $current == 'search'}-->
    <a href="<!--{$smarty.const.HTTPS_URL}-->mypage/">
    <div class="login_member_text">
        <p>
            ログインしてください
        </p>
    </div>
    </a>
    <!--{/if}-->
        <ul class="l-footer-nav__inner --login">
            <li class="l-footer-nav__item">
                <a href="<!--{$smarty.const.TOP_URL}-->products/list.php?orderby=date" class="c-footer-nav-item--search<!--{if $current == 'search'}--> is-current<!--{/if}-->">見つける</a>
            </li>
            <li class="l-footer-nav__item c-item-icon<!--{if $current == 'display'}--> is-current_bg<!--{/if}-->">
                <a href="<!--{$smarty.const.HTTPS_URL}-->mypage/item_edit.php" class="c-footer-nav-item--listing<!--{if $current == 'display'}--> is-current<!--{/if}-->">出品</a>
            </li>
            <li class="l-footer-nav__item">
                <a href="<!--{$smarty.const.HTTPS_URL}-->mypage/" class="c-footer-nav-item--mypage<!--{if $current == 'mypage'}--> is-current<!--{/if}-->"><!--{if $is_login}-->マイページ<!--{else}-->ログイン<!--{/if}--></a>
            </li>
            <li class="l-footer-nav__item">
                <a href="<!--{$smarty.const.HTTPS_URL}-->other/" class="c-footer-nav-item--other<!--{if $current == 'other'}--> is-current<!--{/if}-->">その他</a>
            </li>
        </ul>
</nav>
<!--{/strip}-->
<!--▲FOOTER-->
