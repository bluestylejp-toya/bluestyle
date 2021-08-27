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
<div class="l-header--item">
    <!--検索フォーム-->
    <form name="search_form" id="search_form" method="get" action="<!--{$smarty.const.ROOT_URLPATH}-->products/list.php">
        <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
        <div class="c-form-parts--search"><input type="text" name="name" class="c-form-parts--search__box" maxlength="50" value="<!--{$smarty.get.name|h}-->" placeholder="キーワードから探す"/><button class="c-form-parts--search__btn"></button></div>
        <dl class="formlist">
            <dt>カテゴリーから探す</dt>
            <dd><input type="hidden" name="mode" value="search" />
            <select name="category_id" class="box145">
                <option label="全ての商品" value="">全ての商品</option>
                <!--{html_options options=$arrCatList selected=$category_id}-->
            </select>
            </dd>
        </dl>
        <dl class="formlist">
            <!--{if $arrMakerList}-->
            <dt>出品者の都道府県から探す</dt>
            <dd><select name="maker_id" class="box145">
                <option label="全てのメーカー" value="">全てのメーカー</option>
                <!--{html_options options=$arrMakerList selected=$maker_id}-->
            </select>
            </dd>
        </dl>
        <dl class="formlist">
            <!--{/if}-->
        </dl>
    </form>

</div>
    <script>
    const search = document.querySelector("[name=name]");
    search.oninput = function(e){console.log("input : "+e.target.value)};
    </script>
<!--{/strip}-->
