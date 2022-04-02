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
    <div class="l-wrapper">
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
                                    <a href="javascript:void(0)"><svg width="28" height="29" viewBox="0 0 28 29" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M14.4492 28.9888C12.7671 28.9888 11.2252 27.9985 10.5195 26.4662C10.4214 26.2543 10.2428 26.0897 10.023 26.0108C9.92757 25.9767 9.82775 25.9592 9.72881 25.9592C9.59922 25.9592 9.46963 25.9881 9.35055 26.0459C8.76565 26.3287 8.13434 26.4714 7.47413 26.4714C6.32009 26.4714 5.23435 26.0222 4.41741 25.2053C3.22747 24.0154 2.83695 22.2239 3.4236 20.6408C3.50503 20.4219 3.49452 20.1793 3.39558 19.9683C3.29664 19.7573 3.11627 19.5944 2.89649 19.5174C1.16367 18.9106 0 17.2706 0 15.438C0 13.755 0.991181 12.2122 2.52436 11.5074C2.73625 11.4102 2.89999 11.2316 2.97967 11.0118C3.05848 10.792 3.04622 10.5503 2.94552 10.3402C2.15048 8.68531 2.48671 6.70295 3.78347 5.40706C4.59953 4.591 5.68528 4.14094 6.83932 4.14094C7.36031 4.14094 7.86728 4.23112 8.34711 4.40975C8.44518 4.44652 8.54762 4.46403 8.65007 4.46403C8.77615 4.46403 8.90312 4.43601 9.01957 4.38173C9.23059 4.28278 9.39345 4.10241 9.4705 3.88263C10.079 2.15157 11.719 0.98877 13.5508 0.98877C15.2328 0.98877 16.7748 1.97908 17.4805 3.51138C17.5777 3.72327 17.7572 3.88789 17.977 3.96669C18.0724 4.00084 18.1722 4.01835 18.2712 4.01835C18.4008 4.01835 18.5304 3.98946 18.6494 3.93167C19.2343 3.64972 19.8656 3.50613 20.5258 3.50613C21.6808 3.50613 22.7656 3.95618 23.5826 4.77225C24.3986 5.58831 24.8487 6.67405 24.8487 7.82897C24.8487 8.34908 24.7585 8.85693 24.5799 9.33676C24.4985 9.55566 24.509 9.7982 24.6079 10.0092C24.7068 10.2202 24.8872 10.3831 25.107 10.461C26.8381 11.0696 28.0009 12.7087 28.0009 14.5405C28.0009 16.2234 27.0097 17.7662 25.4765 18.471C25.2646 18.5682 25.1 18.7469 25.0212 18.9666C24.9424 19.1864 24.9546 19.4281 25.0553 19.6391C25.8504 21.2931 25.5141 23.2755 24.2174 24.5722C23.4013 25.3883 22.3156 25.8384 21.1607 25.8384C20.6406 25.8384 20.1327 25.7482 19.6529 25.5695C19.5548 25.5328 19.4524 25.5153 19.3499 25.5153C19.223 25.5153 19.0969 25.5433 18.9804 25.5976C18.7694 25.6965 18.6065 25.8769 18.5295 26.0967C17.9209 27.826 16.2809 28.9888 14.4492 28.9888ZM11.7401 9.30786C11.6131 9.30786 11.487 9.33588 11.3697 9.39017C11.1578 9.48999 10.9949 9.67036 10.9179 9.89189C10.7034 10.5083 10.3592 11.0556 9.89517 11.5196C9.52654 11.8883 9.10363 12.1825 8.63868 12.3961C8.42591 12.4933 8.2613 12.6728 8.1825 12.8926C8.10281 13.1124 8.11595 13.3549 8.21752 13.5659C8.50121 14.1526 8.64481 14.7821 8.64481 15.438C8.64481 15.9554 8.55375 16.4615 8.37513 16.9414C8.2937 17.1603 8.30333 17.4037 8.40315 17.6156C8.50209 17.8275 8.68334 17.9903 8.90399 18.0674C9.51691 18.281 10.0642 18.6269 10.5309 19.0936C10.8969 19.4596 11.1911 19.8825 11.4047 20.3501C11.5019 20.5629 11.6805 20.7275 11.9012 20.8071C11.9966 20.8413 12.0964 20.8588 12.1963 20.8588C12.3258 20.8588 12.4554 20.8299 12.5754 20.7721C13.1629 20.4884 13.7925 20.344 14.4492 20.344C14.9675 20.344 15.4745 20.435 15.9552 20.6145C16.0533 20.6513 16.1566 20.6697 16.2599 20.6697C16.3869 20.6697 16.513 20.6417 16.6303 20.5874C16.8422 20.4876 17.0051 20.3072 17.0821 20.0856C17.2966 19.4701 17.6407 18.922 18.1048 18.4579C18.4734 18.0893 18.8955 17.7951 19.3613 17.5814C19.5741 17.4842 19.7378 17.3056 19.8175 17.085C19.8963 16.8652 19.884 16.6226 19.7825 16.4116C19.4988 15.825 19.3552 15.1954 19.3552 14.5396C19.3552 14.0221 19.4462 13.516 19.6249 13.0353C19.7063 12.8164 19.6967 12.573 19.5968 12.3611C19.497 12.1492 19.3166 11.9863 19.096 11.9093C18.4831 11.6956 17.9349 11.3506 17.4682 10.8839C17.1005 10.5162 16.8054 10.0924 16.5918 9.62746C16.4946 9.41469 16.3151 9.25095 16.0953 9.17127C15.9999 9.13712 15.9 9.11961 15.8002 9.11961C15.6706 9.11961 15.541 9.1485 15.422 9.20629C14.8353 9.48911 14.2058 9.63359 13.5499 9.63359C13.0316 9.63359 12.5246 9.54253 12.0439 9.36303C11.9458 9.32625 11.8434 9.30786 11.7401 9.30786Z" fill="#9DA4B0"/></svg></a>
                                </li>
                                <li class="c-item-tab__item <!--{if $orderby == 'count_of_favorite'}-->--active<!--{/if}-->" data-tab_nav="2">
                                    <a href="javascript:void(0)" onclick="javascript:fnChangeOrderby('count_of_favorite');">ほしい順</a>
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
                            <div class="c-alert--gray --show u-mb--4">すぐにChainで交換できるアイテム一覧です<button type="button"><svg width="20" height="21" viewBox="0 0 20 21" fill="none" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M0 10.9888C0 5.45877 4.47 0.98877 10 0.98877C15.53 0.98877 20 5.45877 20 10.9888C20 16.5188 15.53 20.9888 10 20.9888C4.47 20.9888 0 16.5188 0 10.9888ZM13.59 15.9888L15 14.5788L11.41 10.9888L15 7.39877L13.59 5.98877L10 9.57877L6.41 5.98877L5 7.39877L8.59 10.9888L5 14.5788L6.41 15.9888L10 12.3988L13.59 15.9888Z" fill="#9DA4B0"/></svg></button></div>
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
