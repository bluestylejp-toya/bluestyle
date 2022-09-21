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
    <!-- Google Tag Manager (noscript) -->
    <noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-WMZZBG3"
    height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
    <!-- End Google Tag Manager (noscript) -->
    <!--{$GLOBAL_ERR}-->
    <div class="l-wrapper<!--{if $smarty.get.open == true}--> --list-show<!--{/if}-->">
    <!--{if $smarty.server.PHP_SELF == "/index.php"}-->
            <!--{if $tpl_login != true}-->
            <!--{/if}-->
        <!--{else}-->
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
        <!--{/if}-->
        <main class="l-main">

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
            <!--{assign var=list value="`$smarty.const.ROOT_URLPATH`products/list.php"}-->
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
            <!--{assign var=list value="`$smarty.const.ROOT_URLPATH`products/list.php"}-->
                <!--{if $smarty.server.PHP_SELF==$list}-->
                    <!--{if $tpl_subtitle !== '検索結果'}-->
                        <div class="l-header--item">
                            <ul class="c-item-tab">
                                <li class="c-item-tab__item <!--{if $orderby == 'date' || $orderby|@strlen == 0}-->--active<!--{/if}-->" data-tab_nav="0">
                                    <a href="javascript:void(0)" onclick="javascript:fnChangeOrderby('date');">新着</a>
                                </li>
                                <li id="fast-chain" class="c-item-tab__item" data-tab_nav="1">
                                    <a href="javascript:void(0)">交換確定</a>
                                </li>
                                <li class="c-item-tab__item <!--{if $orderby == 'count_of_favorite'}-->--active<!--{/if}-->" data-tab_nav="2">
                                    <a href="javascript:void(0)" onclick="javascript:fnChangeOrderby('count_of_favorite');">人気順</a>
                                </li>
                            </ul>
                        </div>
                    <!--{/if}-->
                <!--{/if}-->

                <!-- ▼メイン -->
                <!--{if $smarty.server.PHP_SELF==$list}--><div class="c-item-tab__content --active" data-tab_item="0"><!--{/if}-->
                <!--{include file=$tpl_mainpage}-->
                <!--{if $smarty.server.PHP_SELF==$list}--></div><!--{/if}-->
                <!-- ▲メイン -->

                <!--{* ▼メイン下部 *}-->
                <!--{if !empty($arrPageLayout.MainFoot)}-->
                    <!--{foreach key=MainFootKey item=MainFootItem from=$arrPageLayout.MainFoot}-->
                        <!--{if $smarty.server.PHP_SELF==$list}--><div class="c-item-tab__content" data-tab_item="<!--{$MainFootKey+1}-->"><!--{/if}-->
                        <!--{if $MainFootKey+1 === 1 && $tpl_page_class_name === 'LC_Page_Products_List'}-->
                            <div class="c-alert--gray --show u-mb--4">このアイテムはすぐにもらえます<button type="button"><svg width="20" height="21" viewBox="0 0 20 21" fill="none" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M0 10.9888C0 5.45877 4.47 0.98877 10 0.98877C15.53 0.98877 20 5.45877 20 10.9888C20 16.5188 15.53 20.9888 10 20.9888C4.47 20.9888 0 16.5188 0 10.9888ZM13.59 15.9888L15 14.5788L11.41 10.9888L15 7.39877L13.59 5.98877L10 9.57877L6.41 5.98877L5 7.39877L8.59 10.9888L5 14.5788L6.41 15.9888L10 12.3988L13.59 15.9888Z" fill="#9DA4B0"/></svg></button></div>
                        <!--{/if}-->
                        <!-- ▼<!--{$MainFootItem.bloc_name}--> -->
                        <!--{if $MainFootItem.php_path != ""}-->
                            <!--{include_php_ex file=$MainFootItem.php_path items=$MainFootItem}-->
                        <!--{else}-->
                            <!--{include file=$MainFootItem.tpl_path items=$MainFootItem}-->
                        <!--{/if}-->
                        <!-- ▲<!--{$MainFootItem.bloc_name}--> -->
                        <!--{if $smarty.server.PHP_SELF==$list}--></div><!--{/if}-->
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
    <!--{assign var=list value="`$smarty.const.ROOT_URLPATH`products/list.php"}-->
        <!--{if $smarty.server.PHP_SELF==$list}-->
        <script>
            $(function(){
                $('[data-tab_nav]').each(function(index){
                    $(this).on('click', function(){
                        $('[data-tab_nav]').removeClass('--active');
                        $('[data-tab_item]').removeClass('--active');
                        $(this).addClass('--active');

                        $('[data-tab_item=' + $(this).data('tab_nav') + ']').addClass('--active');
                        $('.c-alert--gray button').on('click', function(){
                            $('.c-alert--gray').fadeOut();
                        })
                    })
                });
            })
        </script>
        <!--{/if}-->
</body>
<!--{/strip}-->
