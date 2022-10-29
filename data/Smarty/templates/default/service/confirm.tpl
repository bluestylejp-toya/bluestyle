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
<section>

    <header class="l-header__inner">
        <a href="?" onclick="eccube.setModeAndSubmit('return', '', ''); return false;" aria-label="戻る" class="c-btn--header-nav"></a>
        <h1 class="c-header-title">書籍プレゼント（確認）</h1>
    </header>

    <p class="u-mb--3">下記入力内容で送信してもよろしいでしょうか？<br />
        よろしければ、一番下の「完了ページへ」ボタンをクリックしてください。</p>
    <form name="form1" id="form1" method="post" action="?">
        <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
        <input type="hidden" name="mode" value="complete" />
        <!--{foreach key=key item=item from=$arrForm}-->
            <!--{if $key ne 'mode'}-->
                <input type="hidden" name="<!--{$key}-->" value="<!--{$item.value|h}-->" />
            <!--{/if}-->
        <!--{/foreach}-->
        <dl class="c-list--dl u-mb--4">
            <dt>お名前</dt>
            <dd><!--{$arrForm.name01.value|h}-->　<!--{$arrForm.name02.value|h}--></dd>

            <dt>お名前(フリガナ)</dt>
            <dd><!--{$arrForm.kana01.value|h}-->　<!--{$arrForm.kana02.value|h}--></dd>

            <dt>郵便番号</dt>
            <dd>
                <!--{if strlen($arrForm.zip01.value) > 0 && strlen($arrForm.zip02.value) > 0}-->
                    〒<!--{$arrForm.zip01.value|h}-->-<!--{$arrForm.zip02.value|h}-->
                <!--{/if}-->
            </dd>

            <dt>住所</dt>
            <dd><!--{$arrPref[$arrForm.pref.value]}--><!--{$arrForm.addr01.value|h}--><!--{$arrForm.addr02.value|h}--><!--{$arrForm.addr03.value|h}--></dd>

            <dt>電話番号</dt>
            <dd>
                <!--{if strlen($arrForm.tel01.value) > 0 && strlen($arrForm.tel02.value) > 0 && strlen($arrForm.tel03.value) > 0}-->
                    <!--{$arrForm.tel01.value|h}-->-<!--{$arrForm.tel02.value|h}-->-<!--{$arrForm.tel03.value|h}-->
                <!--{/if}-->
            </dd>

            <dt>メールアドレス</dt>
            <dd><a href="mailto:<!--{$arrForm.email.value|escape:'hex'}-->"><!--{$arrForm.email.value|escape:'hexentity'}--></a></dd>

            <dt>欲しい書籍のID</dt>
            <dd><!--{$arrForm.contents.value|h|nl2br}--></dd>
        </dl>
        <button  class="c-btn--primary" name="send" id="send"  class="c-btn--primary">送信する</button>
        <a href="?" onclick="eccube.setModeAndSubmit('return', '', ''); return false;"  class="c-btn--default u-mb--2">戻る</a>

    </form>
</section>
