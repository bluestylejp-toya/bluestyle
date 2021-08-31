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

<!--{strip}-->
<body class="<!--{$tpl_page_class_name|h}-->">
    <!--{$GLOBAL_ERR}-->
    <div class="l-wrapper">
    <!--{if $smarty.server.PHP_SELF == "/index.php"}-->
            <!--{if $tpl_login != true}-->
            <!--{/if}-->
        <!--{else}-->
        <header class="l-header">
        <!--{* ▼HeaderHeaderTop COLUMN*}-->
        <!--{if !empty($arrPageLayout.HeaderTopNavi)}-->
            <!--{* ▼上ナビ *}-->
            <!--{foreach key=HeaderTopNaviKey item=HeaderTopNaviItem from=$arrPageLayout.HeaderTopNavi}-->
            <!-- ▼<!--{$HeaderTopNaviItem.bloc_name}-->
            -->
            <!--{if $HeaderTopNaviItem.php_path != ""}-->
            <!--{include_php_ex file=$HeaderTopNaviItem.php_path items=$HeaderTopNaviItem}-->
            <!--{else}-->
            <!--{include file=$HeaderTopNaviItem.tpl_path items=$HeaderTopNaviItem}-->
            <!--{/if}-->
            <!-- ▲<!--{$HeaderTopNaviItem.bloc_name}-->
            -->
            <!--{/foreach}-->
            <!--{* ▲上ナビ *}-->
        <!--{/if}-->
        <!--{* ▲HeaderHeaderTop COLUMN*}-->
        <!--{* ▼HEADER *}-->
        <!--{if $arrPageLayout.header_chk != 2}-->
        <!--{include file= $header_tpl}-->
        <!--{/if}-->
        <!--{* ▲HEADER *}-->
        </header>
        <!--{/if}-->
        <main class="l-main">
            <!--{assign var=list value="`$smarty.const.ROOT_URLPATH`products/list.php"}-->
            <!--{if $smarty.server.PHP_SELF==$list}-->
            <div class="l-header--item">
                <!--{include file="frontparts/bloc/search_products.tpl"}-->
                <!--{if $tpl_subtitle !== '検索結果'}-->
                <ul class="c-item-tab">
                    <li class="c-item-tab__item --current">
                        <strong class="">新着</strong>
                    </li>
                    <li class="c-item-tab__item">
                        <a href="javascript:fnChangeOrderby('price');">ファストChain</a>
                    </li>
                    <li class="c-item-tab__item">
                        <a href="">閲覧履歴</a>
                    </li>
                </ul>
                <!--{/if}-->
            </div>
            <!--{/if}-->

            <!--{if $smarty.server.PHP_SELF==$list}-->
            <!--{/if}-->
        <!--{* ▼TOP COLUMN*}-->
        <!--{if !empty($arrPageLayout.TopNavi)}-->
        <div id="topcolumn">
            <!--{* ▼上ナビ *}-->
            <!--{foreach key=TopNaviKey item=TopNaviItem from=$arrPageLayout.TopNavi}-->
            <!-- ▼<!--{$TopNaviItem.bloc_name}-->
            -->
            <!--{if $TopNaviItem.php_path != ""}-->
            <!--{include_php_ex file=$TopNaviItem.php_path items=$TopNaviItem}-->
            <!--{else}-->
            <!--{include file=$TopNaviItem.tpl_path items=$TopNaviItem}-->
            <!--{/if}-->
            <!-- ▲<!--{$TopNaviItem.bloc_name}-->
            -->
            <!--{/foreach}-->
            <!--{* ▲上ナビ *}-->
            </div>
            <!--{/if}-->
            <!--{* ▲TOP COLUMN*}-->
            <!--{* ▼CENTER COLUMN *}-->
            <div <!--{**}-->
                class="colnum<!--{$tpl_column_num|h}-->
                    <!--{if $tpl_column_num == 2}-->
                        <!--{" "}--><!--{if empty($arrPageLayout.LeftNavi)}-->left<!--{else}-->right<!--{/if}-->
                    <!--{/if}-->
                "
            >
                <!--{* ▼メイン上部 *}-->
                <!--{if !empty($arrPageLayout.MainHead)}-->
                    <!--{foreach key=MainHeadKey item=MainHeadItem from=$arrPageLayout.MainHead}-->
                        <!-- ▼<!--{$MainHeadItem.bloc_name}--> -->
                        <!--{if $MainHeadItem.php_path != ""}-->
                            <!--{include_php_ex file=$MainHeadItem.php_path items=$MainHeadItem}-->
                        <!--{else}-->
                            <!--{include file=$MainHeadItem.tpl_path items=$MainHeadItem}-->
                        <!--{/if}-->
                        <!-- ▲<!--{$MainHeadItem.bloc_name}--> -->
                    <!--{/foreach}-->
                <!--{/if}-->
                <!--{* ▲メイン上部 *}-->

                <!-- ▼メイン -->
                <!--{include file=$tpl_mainpage}-->
                <!-- ▲メイン -->

                <!--{* ▼メイン下部 *}-->
                <!--{if !empty($arrPageLayout.MainFoot)}-->
                    <!--{foreach key=MainFootKey item=MainFootItem from=$arrPageLayout.MainFoot}-->
                        <!-- ▼<!--{$MainFootItem.bloc_name}--> -->
                        <!--{if $MainFootItem.php_path != ""}-->
                            <!--{include_php_ex file=$MainFootItem.php_path items=$MainFootItem}-->
                        <!--{else}-->
                            <!--{include file=$MainFootItem.tpl_path items=$MainFootItem}-->
                        <!--{/if}-->
                        <!-- ▲<!--{$MainFootItem.bloc_name}--> -->
                    <!--{/foreach}-->
                <!--{/if}-->
                <!--{* ▲メイン下部 *}-->
            </div>
            <!--{* ▲CENTER COLUMN *}-->


        <!--{* ▼BOTTOM COLUMN*}-->
        <!--{if !empty($arrPageLayout.BottomNavi)}-->
        <div id="bottomcolumn">
            <!--{* ▼下ナビ *}-->
            <!--{foreach key=BottomNaviKey item=BottomNaviItem from=$arrPageLayout.BottomNavi}-->
            <!-- ▼<!--{$BottomNaviItem.bloc_name}-->
            -->
            <!--{if $BottomNaviItem.php_path != ""}-->
            <!--{include_php_ex file=$BottomNaviItem.php_path items=$BottomNaviItem}-->
            <!--{else}-->
            <!--{include file=$BottomNaviItem.tpl_path items=$BottomNaviItem}-->
            <!--{/if}-->
            <!-- ▲<!--{$BottomNaviItem.bloc_name}-->
            -->
            <!--{/foreach}-->
            <!--{* ▲下ナビ *}-->
        </div>
        <!--{/if}-->
        <!--{* ▲BOTTOM COLUMN*}-->
        </main>
        <footer class="l-footer">
        <!--{* ▼FOOTER *}-->
        <!--{if $arrPageLayout.footer_chk != 2}-->
        <!--{include file=$footer_tpl}-->
        <!--{/if}-->
        <!--{* ▲FOOTER *}-->
        <!--{* ▼FooterBottom COLUMN*}-->
        <!--{if !empty($arrPageLayout.FooterBottomNavi)}-->
        <div id="footerbottomcolumn">
            <!--{* ▼上ナビ *}-->
            <!--{foreach key=FooterBottomNaviKey item=FooterBottomNaviItem from=$arrPageLayout.FooterBottomNavi}-->
            <!-- ▼<!--{$FooterBottomNaviItem.bloc_name}-->
            -->
            <!--{if $FooterBottomNaviItem.php_path != ""}-->
            <!--{include_php_ex file=$FooterBottomNaviItem.php_path items=$FooterBottomNaviItem}-->
            <!--{else}-->
            <!--{include file=$FooterBottomNaviItem.tpl_path items=$FooterBottomNaviItem}-->
            <!--{/if}-->
            <!-- ▲<!--{$FooterBottomNaviItem.bloc_name}-->
            -->
            <!--{/foreach}-->
            <!--{* ▲上ナビ *}-->
        </div>
        <!--{/if}-->
        <!--{* ▲FooterBottom COLUMN*}-->
        </footer>
    </div>
</body>
<!--{/strip}-->
