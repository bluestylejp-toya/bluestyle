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
    <!--検索フォーム-->
    <form name="search_form" id="search_form" method="get" action="<!--{$smarty.const.ROOT_URLPATH}-->products/list.php">
        <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
        <input type="hidden" name="mode" value="search" />
        <div class="p-search">
            <div class="c-form-parts--search p-search__box">
                <input type="text" name="name" class="c-form-parts--search__box" maxlength="50" value="<!--{$smarty.get.name|h}-->" placeholder="キーワードから探す"/>
                <button class="c-form-parts--search__btn" name="search" type="button"></button>
            </div>

            <div class="p-search__list">
                <ul class="c-nav-list">
                    <li>
                        <button type="button" data-menu_id="category" class="c-nav-list_cat">
                            <img src="<!--{$TPL_URLPATH}-->img/icon/c-nav-list_cat.svg">
                        </button>
                    </li>
                    <!--{*<li>
                        <button type="button" data-menu_id="maker">出品者の都道府県から探す</button>
                    </li>*}-->
                </ul>
            </div>
            <div class="p-search__menu">
                <header class="l-header__inner<!--{if $arrForm.status.value == 2}--> u-mb--0<!--{/if}-->">
                    <button aria-label="戻る" class="c-btn--header-nav menu_btn" type="button"></button>
                    <p class="c-header-title change_title"></p>
                </header>
                <ul id="category" class="c-nav-list">
                    <!--{foreach from=$arrCatList item=cate key=key}-->
                        <li class="level<!--{$cate.level|h}-->"><label>
                            <input type="radio" name="category_id" value="<!--{$cate['category_id']}-->" <!--{if $category_id[0] == $cate['category_id']}--> checked<!--{/if}-->>
                            <span><!--{$cate.category_name}--></span>
                        </label></li>
                    <!--{/foreach}-->
                </ul>
                <!--{*<ul id="maker" class="c-nav-list">
                    <!--{foreach from=$arrMakerList item=area key=key}-->
                    <li><label><input type="radio" name="maker_id" value="<!--{$key}-->" <!--{if $maker_id[0] == $key}--> checked<!--{/if}-->><span><!--{$area}--></span></label></li>
                    <!--{/foreach}-->
                </ul>*}-->
            </div>
        </div>
    </form>
    <script>
        const search = $("input[name=name]");
        const category = $("input[name=category_id], input[name=maker_id]");
        const list = $(".p-search__list");
        const slideInMenu = $(".p-search__menu");
        const slideInSubMenu = $(".p-search__sub-menu");
        const searchBtn = $(".c-form-parts--search__btn");
        const body = $("body");
        search.on('click',function(e){
            list.fadeIn();
            body.addClass('--overflow-hidden')
        });
        searchBtn.on('click',function(){
            category.removeAttr('checked');
            $('#search_form').submit();
        });
        // メニューを表示
        $('[data-menu_id]').on('click',function(){
            slideInMenu.find('.c-header-title.change_title').text($(this).text());
            slideInMenu.addClass('--show')
            $id = '#' + $(this).data('menu_id')
            $($id).addClass('--show')
            slideInMenu.find('.c-btn--header-nav.menu_btn').on('click',function(){
                slideInMenu.removeClass('--show');
                $($id).removeClass('--show');
            })
        })
        $('[data-sub_menu_id]').on('click',function(){
            $id = '#' + $(this).data('sub_menu_id');
            $($id).addClass('--show');
            // カテゴリー検索へ戻る
            slideInSubMenu.find('.c-btn--header-nav.menu_sub_btn').on('click',function(){
                $($id).removeClass('--show')
            })
        })
        category.on('click', function(){
            search.val('');
            $('#search_form').submit();
        })
    </script>
<!--{/strip}-->
