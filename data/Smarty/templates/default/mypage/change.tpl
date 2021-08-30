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
<section>
    <header class="l-header__inner u-mb--0">
        <a href="<!--{$smarty.const.TOP_URL}-->mypage/" aria-label="戻る" class="c-btn--header-nav"></a>
        <p class="c-header-title">アカウント情報</p>
    </header>

    <form name="form1" id="form1" method="post" action="?">
        <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
        <input type="hidden" name="mode" value="confirm" />
        <input type="hidden" name="customer_id" value="<!--{$arrForm.customer_id.value|h}-->" />
        <dl class="c-list--dl u-mb--4">
            <!--{include file="`$smarty.const.TEMPLATE_REALDIR`frontparts/form_personal_input.tpl" flgFields=3 emailMobile=true prefix=""}-->
        </dl>
        <button name="refusal" id="refusal" class="c-btn--primary">確認する</button>
    </form>
<section>
<script>
<!--{if strlen($smarty.request.message) >= 1}-->
    $(function(){
        alert(<!--{$smarty.request.message|@json_encode}-->);
    });
<!--{/if}-->
$('.next_form').on('keyup', function(){
    console.log($(this).attr('maxlength'))
    if ($(this).val().length >= $(this).attr('maxlength')) {
        $(this).next().focus();
    }
})
</script>
