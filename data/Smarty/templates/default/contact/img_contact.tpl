<!--{*
 * This file is part of EC-CUBE
 *
 * Copyright(c) 2000-2013 LOCKON CO.,LTD. All Rights Reserved.
 *
 * http://www.lockon.co.jp/
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
        <h1 class="c-header-title"><!--{$tpl_title|h}--></h1>
    </header>

    <div id="undercolumn_contact">

        <p></p>
    <form name="form1" id="form1" method="post" enctype="multipart/form-data" action="?" class="h-adr"><span class="p-country-name" style="display:none;">Japan</span>
            <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
            <input type="hidden" name="mode" value="confirm" />
<input type="hidden" name="image_key" value="" />
        <input type="hidden" name="sample_image_realpath" value="<!--{$arrFile.sample_image.real_filepath}-->" />
        <input type="hidden" name="sample_image_urlpath" value="<!--{$arrFile.sample_image.filepath}-->" />
<!--{foreach key=key item=item from=$arrHidden}-->
<input type="hidden" name="<!--{$key}-->" value="<!--{$item|h}-->" />
<!--{/foreach}-->

        <dl class="c-list--dl u-mb--4">
            <dt>姓<span class="attention">※必須</span></dt>
            <dd>
                <input placeholder="福岡" type="text" class="c-form-parts" name="name01" value="<!--{$arrForm.name01.value|default:$arrData.name01|h}-->" maxlengdt="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr.name01|sfGetErrorColor}-->; ime-mode: active;" />
                <span class="attention"><!--{$arrErr.name01}--></span>
            </dd>
            <dt>名<span class="attention">※必須</span></dt>
            <dd>
                <input placeholder="太郎" type="text" class="c-form-parts" name="name02" value="<!--{$arrForm.name02.value|default:$arrData.name02|h}-->" maxlengdt="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr.name02|sfGetErrorColor}-->; ime-mode: active;" />
                <span class="attention"><!--{$arrErr.name02}--></span>
            </dd>

            <dt>セイ<span class="attention">※必須</span></dt>
            <dd>
                <input placeholder="フクオカ" type="text" class="c-form-parts" name="kana01" value="<!--{$arrForm.kana01.value|default:$arrData.kana01|h}-->" maxlengdt="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr.kana01|sfGetErrorColor}-->; ime-mode: active;" />
                <span class="attention"><!--{$arrErr.kana01}--></span>
            </dd>
            <dt>メイ<span class="attention">※必須</span></dt>
            <dd><input placeholder="タロウ" type="text" class="c-form-parts" name="kana02" value="<!--{$arrForm.kana02.value|default:$arrData.kana02|h}-->" maxlengdt="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{$arrErr.kana02|sfGetErrorColor}-->; ime-mode: active;" />
                <span class="attention"><!--{$arrErr.kana01}--><!--{$arrErr.kana02}--></span>
            </dd>

            <dt>郵便番号<!--{if !$smarty.const.FORM_COUNTRY_ENABLE}--><span class="attention">※必須</span><!--{/if}--></dt><dl>
                <dd>
                    <span class="attention"><!--{$arrErr.zip01}--><!--{$arrErr.zip02}--></span>
                    <p class="u-mb--2 c-form-parts--zip">
                    <span class="c-form-parts">
                        <input placeholder="813" type="text" name="zip01" class="box60" value="<!--{$arrForm.zip01.value|default:$arrData.zip01|h}-->" maxlengdt="<!--{$smarty.const.ZIP01_LEN}-->" style="<!--{$arrErr.zip01|sfGetErrorColor}-->; ime-mode: disabled;" />-
                        <input placeholder="0036" type="text" name="zip02" class="box60" value="<!--{$arrForm.zip02.value|default:$arrData.zip02|h}-->" maxlengdt="<!--{$smarty.const.ZIP02_LEN}-->" style="<!--{$arrErr.zip02|sfGetErrorColor}-->; ime-mode: disabled;" />
                    </span>
                        <a href="javascript:eccube.getAddress('<!--{$smarty.const.INPUT_ZIP_URLPAdt}-->', 'zip01', 'zip02', 'pref', 'addr01');" target="_blank" class="c-btn--default">郵便番号検索</a>
                    </p>
                    <p><small>郵便番号自動検索がうまくいかない場合は<a href="https://www.post.japanpost.jp/zipcode/" target="_blank"><span class="mini">こちらから</span></a>検索してください。</small></p>
                </dd>

                <dt>住所<span class="attention">必須</span></dt>
                <dd>

                    <div class="c-form-parts--select u-mb--1"><select name="pref" style="<!--{$arrErr.pref|sfGetErrorColor}-->" >
                            <option value="">都道府県を選択</option><!--{html_options options=$arrPref selected=$arrForm.pref.value|default:$arrData.pref}--></select></div>

                    <p class="u-mb--1">
                        <input placeholder="福岡市東区" type="text" class="c-form-parts" name="addr01" value="<!--{$arrForm.addr01.value|default:$arrData.addr01|h}-->" style="<!--{$arrErr.addr01|sfGetErrorColor}-->; ime-mode: active;" placeholder="<!--{$smarty.const.SAMPLE_ADDRESS1}-->">
                    </p>

                    <p class="u-mb--1">
                        <input placeholder="若宮4-2-38" type="text" class="c-form-parts" name="addr02" value="<!--{$arrForm.addr02.value|default:$arrData.addr02|h}-->" style="<!--{$arrErr.addr02|sfGetErrorColor}-->; ime-mode: active;" placeholder="<!--{$smarty.const.SAMPLE_ADDRESS2}-->">
                    </p>
                    <p class="u-mb--1">
                        <input placeholder="伊崎ビル3F" type="text" class="c-form-parts" name="addr03" value="<!--{$arrForm.addr03.value|default:$arrData.addr03|h}-->" style="<!--{$arrErr.addr03|sfGetErrorColor}-->; ime-mode: active;" placeholder="<!--{$smarty.const.SAMPLE_ADDRESS3}-->">
                    </p>
                    <span class="attention"><!--{$arrErr.pref}--><!--{$arrErr.addr01}--><!--{$arrErr.addr02}--><!--{$arrErr.addr03}--></span>

                    <p class="mini"><span class="attention">住所は3つに分けてご記入ください。マンション名は必ず記入してください。</span></p>
                </dd>

                <dt>電話番号<span class="attention">必須</span></dt>
                <dd>
                    <div class="c-form-parts--tell">
                        <input placeholder="000" type="text" class="next_form" name="tel01" value="<!--{$arrForm.tel01.value|default:$arrData.tel01|h}-->" maxlengdt="<!--{$smarty.const.TEL_ITEM_LEN}-->" style="<!--{$arrErr.tel01|sfGetErrorColor}-->; ime-mode: disabled;" />&nbsp;-&nbsp;
                        <input placeholder="0000" type="text" class="next_form" name="tel02" value="<!--{$arrForm.tel02.value|default:$arrData.tel02|h}-->" maxlengdt="<!--{$smarty.const.TEL_ITEM_LEN}-->" style="<!--{$arrErr.tel02|sfGetErrorColor}-->; ime-mode: disabled;" />&nbsp;-&nbsp;
                        <input placeholder="0000" type="text" class="box60" name="tel03" value="<!--{$arrForm.tel03.value|default:$arrData.tel03|h}-->" maxlengdt="<!--{$smarty.const.TEL_ITEM_LEN}-->" style="<!--{$arrErr.tel03|sfGetErrorColor}-->; ime-mode: disabled;" /></div>
                    <span class="attention"><!--{$arrErr.tel01}--><!--{$arrErr.tel02}--><!--{$arrErr.tel03}--></span>
                </dd>

                <dt>Chainに登録したメールアドレス<span class="attention">必須</span></dt>
                <dd>
                    <input placeholder="chain@chain.gives" type="text" class="c-form-parts" name="email" value="<!--{$arrForm.email.value|default:$arrData.email|h}-->" style="<!--{$arrErr.email|sfGetErrorColor}-->; ime-mode: disabled;" />
                    <span class="attention"><!--{$arrErr.email}--></span>
                </dd>
                <dt>スクリーンショット<span class="attention">必須</span></dt>
                <dd>
                    <p class="attention">Amazonの注文履歴のスクリーンショットを添付してください。(jpg/gif/png)</p>
                    <!--{if $arrFile.sample_image.filepath != ""}-->
                    <a href="<!--{$arrFile.sample_image.filepath}-->" target="_blank" class="expansion">
                        <img src="<!--{$arrFile.sample_image.filepath}-->" alt="">
                    </a><br>
                    <a href="" onclick="eccube.setModeAndSubmit('delete_image', 'image_key', 'sample_image'); return false;">
                        [画像の取り消し]
                    </a>
                    <!--{else}-->
                    <div class="amazon_image">
                        <p>①アップするスクリーンショットを選択してください</p>
                        <input type="file" name="sample_image" /><br>
                        <p>②アップロードボタンを押して登録してください</p>
                        <a class="c-btn--primary" href="javascript:;" onclick="eccube.setModeAndSubmit('upload_image', 'image_key', 'sample_image'); return false;">
                            アップロード
                        </a>
                        <br><span class="attention"><!--{$arrErr.sample_image_realpath}--></span>
                    </div>
                    <!--{/if}-->
                </dd>

                <dt>Amazonアカウントのメールアドレスが、Chainに登録したメールアドレスと異なる場合は入力してください</dt>
                <dd>
                    <span class="attention"><!--{$arrErr.contents}--></span>
                    <input placeholder="chain@chain.gives" type="text" class="c-form-parts" name="contents" value="<!--{$arrForm.contents.value|h}-->" style="<!--{$arrErr.email|sfGetErrorColor}-->; ime-mode: disabled;" />
                </dd>
            </dl>

            <button class="c-btn--primary" name="confirm">確認ページへ</button>
        </form>
    </div>
</section>
<script src="https://yubinbango.github.io/yubinbango/yubinbango.js" charset="UTF-8"></script>
