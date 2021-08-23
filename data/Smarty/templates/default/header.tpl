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
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.    See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA    02111-1307, USA.
 *}-->

<!--▼HEADER-->
<!--{strip}-->
    <!-- <div id="header_wrap">
        <div id="header" class="clearfix">
            <div id="header_utility">
                <div id="headerInternalColumn">
                <!--{* ▼HeaderInternal COLUMN *}-->
                <!--{if !empty($arrPageLayout.HeaderInternalNavi)}-->
                    <!--{* ▼上ナビ *}-->
                    <!--{foreach key=HeaderInternalNaviKey item=HeaderInternalNaviItem from=$arrPageLayout.HeaderInternalNavi}-->
                        <!-- ▼<!--{$HeaderInternalNaviItem.bloc_name}--> -->
                        <!--{if $HeaderInternalNaviItem.php_path != ""}-->
                            <!--{include_php_ex file=$HeaderInternalNaviItem.php_path items=$HeaderInternalNaviItem}-->
                        <!--{else}-->
                            <!--{include file=$HeaderInternalNaviItem.tpl_path items=$HeaderInternalNaviItem}-->
                        <!--{/if}-->
                        <!-- ▲<!--{$HeaderInternalNaviItem.bloc_name}--> -->
                    <!--{/foreach}-->
                    <!--{* ▲上ナビ *}-->
                <!--{/if}-->
                <!--{* ▲HeaderInternal COLUMN *}-->
                </div>
                <div id="header_navi">
                    <ul>
                        <li class="entry">
                            img class="hover_change_image" src="<!--{$TPL_URLPATH}-->img/common/btn_header_entry.jpg" alt="会員登録" /></a>
                        </li>
                        <li>
                            <a href="<!--{$smarty.const.CART_URL}-->"><img class="hover_change_image" src="<!--{$TPL_URLPATH}-->img/common/btn_header_cart.jpg" alt="カゴの中を見る" /></a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div> -->
<!--{/strip}-->
<!--▲HEADER-->
