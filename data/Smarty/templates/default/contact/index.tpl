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
        <a href="<!--{$smarty.const.TOP_URL}--><!--{if $tpl_login}-->other/<!--{else}-->mypage/login.php<!--{/if}-->" aria-label="戻る" class="c-btn--header-nav"></a>
        <h1 class="c-header-title">お問い合わせ</h1>
    </header>

    <p class="u-mb--4">内容によっては回答をさしあげるのにお時間をいただくこともございます。<br />
    また、休業日は翌営業日以降の対応となりますのでご了承ください。</p>

    <form name="form1" id="form1" method="post" action="?">
        <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
        <input type="hidden" name="mode" value="confirm" />

        <dl class="c-list--dl u-mb--4">
            <dt>姓<span class="attention">※必須</span></dt>
            <dd>
                <input type="text" class="c-form-parts" name="name01" value="<!--{$arrForm.name01.value|default:$arrData.name01|h}-->" maxlengdt="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr.name01|sfGetErrorColor}-->; ime-mode: active;" />
                <span class="attention"><!--{$arrErr.name01}--></span>
            </dd>
            <dt>名<span class="attention">※必須</span></dt>
            <dd>
                <input type="text" class="c-form-parts" name="name02" value="<!--{$arrForm.name02.value|default:$arrData.name02|h}-->" maxlengdt="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr.name02|sfGetErrorColor}-->; ime-mode: active;" />
                <span class="attention"><!--{$arrErr.name02}--></span>
            </dd>

            <dt>セイ<span class="attention">※必須</span></dt>
            <dd>
                <input type="text" class="c-form-parts" name="kana01" value="<!--{$arrForm.kana01.value|default:$arrData.kana01|h}-->" maxlengdt="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr.kana01|sfGetErrorColor}-->; ime-mode: active;" />
                <span class="attention"><!--{$arrErr.kana01}--></span>
            </dd>
            <dt>メイ<span class="attention">※必須</span></dt>
            <dd><input type="text" class="c-form-parts" name="kana02" value="<!--{$arrForm.kana02.value|default:$arrData.kana02|h}-->" maxlengdt="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr.kana02|sfGetErrorColor}-->; ime-mode: active;" />
                <span class="attention"><!--{$arrErr.kana01}--><!--{$arrErr.kana02}--></span>
            </dd>

            <dt>郵便番号<!--{if !$smarty.const.FORM_COUNTRY_ENABLE}--><span class="attention">※必須</span><!--{/if}--></dt><dl>
            <dd>
                <span class="attention"><!--{$arrErr.zip01}--><!--{$arrErr.zip02}--></span>
                    <p class="u-mb--2 c-form-parts--zip">
                    <span class="c-form-parts"><input type="text" name="zip01" class="box60" value="<!--{$arrForm.zip01.value|default:$arrData.zip01|h}-->" maxlengdt="<!--{$smarty.const.ZIP01_LEN}-->" style="<!--{$arrErr.zip01|sfGetErrorColor}-->; ime-mode: disabled;" />-
                    <input type="text" name="zip02" class="box60" value="<!--{$arrForm.zip02.value|default:$arrData.zip02|h}-->" maxlengdt="<!--{$smarty.const.ZIP02_LEN}-->" style="<!--{$arrErr.zip02|sfGetErrorColor}-->; ime-mode: disabled;" />　</span>
                    <a href="javascript:eccube.getAddress('<!--{$smarty.const.INPUT_ZIP_URLPAdt}-->', 'zip01', 'zip02', 'pref', 'addr01');" target="_blank" class="c-btn--default">郵便番号検索</a>
                </p>
                <p><small>郵便番号自動検索がうまくいかない場合は<a href="https://www.post.japanpost.jp/zipcode/" target="_blank"><span class="mini">こちらから</span></a>検索してください。</small></p>
            </dd>

            <dt>住所<span class="attention">※必須</span></dt>
            <dd>

                <div class="c-form-parts--select u-mb--1"><select name="pref" style="<!--{$arrErr.pref|sfGetErrorColor}-->" >
                <option value="">都道府県を選択</option><!--{html_options options=$arrPref selected=$arrForm.pref.value|default:$arrData.pref}--></select></div>

                    <p class="u-mb--1">
                    <input type="text" class="c-form-parts" name="addr01" value="<!--{$arrForm.addr01.value|default:$arrData.addr01|h}-->" style="<!--{$arrErr.addr01|sfGetErrorColor}-->; ime-mode: active;" placeholder="<!--{$smarty.const.SAMPLE_ADDRESS1}-->">
                </p>

                <p>
                    <input type="text" class="c-form-parts" name="addr02" value="<!--{$arrForm.addr02.value|default:$arrData.addr02|h}-->" style="<!--{$arrErr.addr02|sfGetErrorColor}-->; ime-mode: active;" placeholder="<!--{$smarty.const.SAMPLE_ADDRESS2}-->">
                </p>
                <p>
                    <input type="text" class="c-form-parts" name="addr03" value="<!--{$arrForm.addr03.value|default:$arrData.addr03|h}-->" style="<!--{$arrErr.addr03|sfGetErrorColor}-->; ime-mode: active;" placeholder="<!--{$smarty.const.SAMPLE_ADDRESS3}-->">
                </p>
                <span class="attention"><!--{$arrErr.pref}--><!--{$arrErr.addr01}--><!--{$arrErr.addr02}--><!--{$arrErr.addr03}--></span>

                <p class="mini"><span class="attention">住所は2つに分けてご記入ください。マンション名は必ず記入してください。</span></p>
            </dd>

            <dt>電話番号<span class="attention">※必須</span></dt>
            <dd>
                <div class="c-form-parts--tell"><input type="text" class="next_form" name="tel01" value="<!--{$arrForm.tel01.value|default:$arrData.tel01|h}-->" maxlengdt="<!--{$smarty.const.TEL_ITEM_LEN}-->" style="<!--{$arrErr.tel01|sfGetErrorColor}-->; ime-mode: disabled;" />&nbsp;-&nbsp;
                <input type="text" class="next_form" name="tel02" value="<!--{$arrForm.tel02.value|default:$arrData.tel02|h}-->" maxlengdt="<!--{$smarty.const.TEL_ITEM_LEN}-->" style="<!--{$arrErr.tel02|sfGetErrorColor}-->; ime-mode: disabled;" />&nbsp;-&nbsp;
                <input type="text" class="box60" name="tel03" value="<!--{$arrForm.tel03.value|default:$arrData.tel03|h}-->" maxlengdt="<!--{$smarty.const.TEL_ITEM_LEN}-->" style="<!--{$arrErr.tel03|sfGetErrorColor}-->; ime-mode: disabled;" /></div>
                <span class="attention"><!--{$arrErr.tel01}--><!--{$arrErr.tel02}--><!--{$arrErr.tel03}--></span>
            </dd>

            <dt>メールアドレス<span class="attention">※</span></dt>
            <dd>
                <input type="text" class="c-form-parts" name="email" value="<!--{$arrForm.email.value|default:$arrData.email|h}-->" style="<!--{$arrErr.email|sfGetErrorColor}-->; ime-mode: disabled;" />
                <span class="attention"><!--{$arrErr.email}--></span>
            </dd>

            <dt>お問い合わせ内容<span class="attention">※必須</span></dt>
            <dd>
                <span class="attention"><!--{$arrErr.contents}--></span>
                <textarea name="contents" class="c-form-parts" cols="10" rows="8" style="<!--{$arrErr.contents.value|h|sfGetErrorColor}-->; ime-mode: active;" placeholder="全角<!--{$smarty.const.MLTEXT_LEN}-->字以下）"><!--{"\n"}--><!--{$arrForm.contents.value|h}--></textarea>
            </dd>
        </dl>

        <button class="c-btn--primary"  name="confirm">確認ページへ</button>

    </form>
</section>
