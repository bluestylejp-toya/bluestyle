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
  <ul class="l-footer-nav__inner">
    <!--{if $tpl_login}-->
        <li class="l-footer-nav__item">
        <a href="<!--{$smarty.const.TOP_URL}-->products/list.php" class="c-footer-nav-item--search is-current">探す</a>
        </li>
        <li class="l-footer-nav__item">
        <a href="" class="c-footer-nav-item--listing">出品</a>
        </li>
        <li class="l-footer-nav__item">
            <a href="<!--{$smarty.const.TOP_URL}-->mypage/" class="c-footer-nav-item--mypage">マイページ</a>
        </li>
        <li class="l-footer-nav__item">
            <a href="" class="c-footer-nav-item--other">その他</a>
        </li>
    <!--{else}-->
        <li class="l-footer-nav__item">
        <a href="<!--{$smarty.const.HTTPS_URL}-->" class="c-footer-nav-item--search is-current">探す</a>
        </li>
        <li class="l-footer-nav__item">
        <a href="<!--{$smarty.const.HTTPS_URL}-->mypage/login.php" class="c-footer-nav-item--listing">出品</a>
        </li>
    <!--{/if}-->
  </ul>
</nav>
<!--{/strip}-->
<!--▲FOOTER-->
