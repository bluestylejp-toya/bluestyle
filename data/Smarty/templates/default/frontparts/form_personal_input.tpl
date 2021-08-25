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

<!--{*
$flgFields について
- 1: MYページ/配送先(EC-CUBE 標準)、非会員購入の配送先(EC-CUBE 標準)
- 2: 非会員購入の注文者(EC-CUBE 標準)
- 3: MYページ/会員情報変更(EC-CUBE 標準)
- 93: 【本サイト固有】会員登録(EC-CUBE 標準の 3 から変更)
*}-->
<!--{strip}-->
    <!--{capture assign='require_mark'}--><span class="attention">※</span><!--{/capture}-->
    <col width="30%" />
    <col width="70%" />
    <!--{if $flgFields != 93}-->
        <tr>
            <th>お名前<!--{$require_mark}--></th>
        <dd class="u-mb--2">
                <!--{assign var=key1 value="`$prefix`name01"}-->
                <!--{assign var=key2 value="`$prefix`name02"}-->
                <!--{if $arrErr[$key1] || $arrErr[$key2]}-->
                    <p><small class="attention"><!--{$arrErr[$key1]}--><!--{$arrErr[$key2]}--></small></p>
                <!--{/if}-->
                姓&nbsp;<input type="text" name="<!--{$key1}-->" value="<!--{$arrForm[$key1].value|h}-->" maxlength="<!--{$arrForm[$key1].length}-->" style="<!--{$arrErr[$key1]|sfGetErrorColor}-->; ime-mode: active;" class="box120" />&nbsp;
                名&nbsp;<input type="text" name="<!--{$key2}-->" value="<!--{$arrForm[$key2].value|h}-->" maxlength="<!--{$arrForm[$key2].length}-->" style="<!--{$arrErr[$key2]|sfGetErrorColor}-->; ime-mode: active;" class="box120" />
        </dd>
        <tr>
            <th>お名前(フリガナ)<!--{if !$smarty.const.FORM_COUNTRY_ENABLE}--><!--{$require_mark}--><!--{/if}--></th>
        <dd class="u-mb--2">
                <!--{assign var=key1 value="`$prefix`kana01"}-->
                <!--{assign var=key2 value="`$prefix`kana02"}-->
                <!--{if $arrErr[$key1] || $arrErr[$key2]}-->
                    <p><small class="attention"><!--{$arrErr[$key1]}--><!--{$arrErr[$key2]}--></small></p>
                <!--{/if}-->
                セイ&nbsp;<input type="text" name="<!--{$key1}-->" value="<!--{$arrForm[$key1].value|h}-->" maxlength="<!--{$arrForm[$key1].length}-->" style="<!--{$arrErr[$key1]|sfGetErrorColor}-->; ime-mode: active;" class="box120" />&nbsp;
                メイ&nbsp;<input type="text" name="<!--{$key2}-->" value="<!--{$arrForm[$key2].value|h}-->" maxlength="<!--{$arrForm[$key1].length}-->" style="<!--{$arrErr[$key2]|sfGetErrorColor}-->; ime-mode: active;" class="box120" />
        </dd>
        <!--{assign var=key1 value="`$prefix`zip01"}-->
        <!--{assign var=key2 value="`$prefix`zip02"}-->
        <!--{assign var=key3 value="`$prefix`pref"}-->
        <!--{assign var=key4 value="`$prefix`addr01"}-->
        <!--{assign var=key5 value="`$prefix`addr02"}-->
        <!--{assign var=key6 value="`$prefix`country_id"}-->
        <!--{assign var=key7 value="`$prefix`zipcode"}-->
        <!--{if !$smarty.const.FORM_COUNTRY_ENABLE}-->
            <input type="hidden" name="<!--{$key6}-->" value="<!--{$smarty.const.DEFAULT_COUNTRY_ID}-->" />
        <!--{else}-->
            <tr>
                <th>国<!--{$require_mark}--></th>
            <dd class="u-mb--2">
                    <!--{if $arrErr[$key6]}-->
                        <p><small class="attention"><!--{$arrErr[$key6]}--></small></p>
                    <!--{/if}-->
                    <select name="<!--{$key6}-->" style="<!--{$arrErr[$key6]|sfGetErrorColor}-->">
                            <option value="" selected="selected">国を選択</option>
                            <!--{html_options options=$arrCountry selected=$arrForm[$key6].value|default:$smarty.const.DEFAULT_COUNTRY_ID}-->
                    </select>
            </dd>
                <tr>
                <th>ZIP CODE</th>
            <dd class="u-mb--2">
                    <!--{if $arrErr[$key7]}-->
                        <p><small class="attention"><!--{$arrErr[$key7]}--></small></p>
                    <!--{/if}-->
                    <input type="text" name="<!--{$key7}-->" value="<!--{$arrForm[$key7].value|h}-->" maxlength="<!--{$arrForm[$key7].length}-->" class="box120" style="<!--{$arrErr[$key7]|sfGetErrorColor}-->; ime-mode: disabled;" />
            </dd>
            <!--{/if}-->
        <tr>
            <th>郵便番号<!--{if !$smarty.const.FORM_COUNTRY_ENABLE}--><!--{$require_mark}--><!--{/if}--></th>
        <dd class="u-mb--2">
                <!--{if $arrErr[$key1] || $arrErr[$key2]}-->
                    <p><small class="attention"><!--{$arrErr[$key1]}--><!--{$arrErr[$key2]}--></small></p>
                <!--{/if}-->
                <p class="top">〒&nbsp;<input type="text" name="<!--{$key1}-->" value="<!--{$arrForm[$key1].value|h}-->" maxlength="<!--{$arrForm[$key1].length}-->" style="<!--{$arrErr[$key1]|sfGetErrorColor}-->; ime-mode: disabled;" class="box60" />&nbsp;-&nbsp;<input type="text" name="<!--{$key2}-->" value="<!--{$arrForm[$key2].value|h}-->" maxlength="<!--{$arrForm[$key2].length}-->" style="<!--{$arrErr[$key2]|sfGetErrorColor}-->; ime-mode: disabled;" class="box60" />&nbsp;
                <a href="https://www.post.japanpost.jp/zipcode/" target="_blank"><span class="mini">郵便番号検索</span></a>
                </p>
                <p class="zipimg">
                    <a href="<!--{$smarty.const.ROOT_URLPATH}-->input_zip.php" onclick="eccube.getAddress('<!--{$smarty.const.INPUT_ZIP_URLPATH}-->', '<!--{$key1}-->', '<!--{$key2}-->', '<!--{$key3}-->', '<!--{$key4}-->'); return false;" target="_blank">
                        <img src="<!--{$TPL_URLPATH}-->img/button/btn_address_input.jpg" alt="住所自動入力" /></a>
                    &nbsp;<span class="mini">郵便番号を入力後、クリックしてください。</span>
                </p>
        </dd>
        <tr>
            <th>住所<!--{$require_mark}--></th>
        <dd class="u-mb--2">
                <!--{if $arrErr[$key3] || $arrErr[$key4] || $arrErr[$key5]}-->
                    <p><small class="attention"><!--{$arrErr[$key3]}--><!--{$arrErr[$key4]}--><!--{$arrErr[$key5]}--></small></p>
                <!--{/if}-->
                <select name="<!--{$key3}-->" style="<!--{$arrErr[$key3]|sfGetErrorColor}-->">
                        <option value="" selected="selected">都道府県を選択</option>
                        <!--{html_options options=$arrPref selected=$arrForm[$key3].value}-->
                </select>
                <p class="top"><input type="text" name="<!--{$key4}-->" value="<!--{$arrForm[$key4].value|h}-->" class="box300" style="<!--{$arrErr[$key4]|sfGetErrorColor}-->; ime-mode: active;" /><br />
                    <!--{$smarty.const.SAMPLE_ADDRESS1}--></p>
                <p class="top"><input type="text" name="<!--{$key5}-->" value="<!--{$arrForm[$key5].value|h}-->" class="box300" style="<!--{$arrErr[$key5]|sfGetErrorColor}-->; ime-mode: active;" /><br />
                    <!--{$smarty.const.SAMPLE_ADDRESS2}--></p>
                <p class="mini"><span class="attention">住所は2つに分けてご記入ください。マンション名は必ず記入してください。</span></p>
        </dd>
        <tr>
            <th>電話番号<!--{$require_mark}--></th>
        <dd class="u-mb--2">
                <!--{assign var=key1 value="`$prefix`tel01"}-->
                <!--{assign var=key2 value="`$prefix`tel02"}-->
                <!--{assign var=key3 value="`$prefix`tel03"}-->
                <!--{if $arrErr[$key1] || $arrErr[$key2] || $arrErr[$key3]}-->
                    <p><small class="attention"><!--{$arrErr[$key1]}--><!--{$arrErr[$key2]}--><!--{$arrErr[$key3]}--></small></p>
                <!--{/if}-->
                <input type="text" name="<!--{$key1}-->" value="<!--{$arrForm[$key1].value|h}-->" maxlength="<!--{$arrForm[$key1].length}-->" style="<!--{$arrErr[$key1]|sfGetErrorColor}-->; ime-mode: disabled;" class="box60" />&nbsp;-&nbsp;<input type="text" name="<!--{$key2}-->" value="<!--{$arrForm[$key2].value|h}-->" maxlength="<!--{$arrForm[$key2].length}-->" style="<!--{$arrErr[$key2]|sfGetErrorColor}-->; ime-mode: disabled;" class="box60" />&nbsp;-&nbsp;<input type="text" name="<!--{$key3}-->" value="<!--{$arrForm[$key3].value|h}-->" maxlength="<!--{$arrForm[$key3].length}-->" style="<!--{$arrErr[$key3]|sfGetErrorColor}-->; ime-mode: disabled;" class="box60" />
        </dd>
    <!--{/if}-->
    <!--{if $flgFields != 1}-->
        <dt class="c-heading--form-title">メールアドレス<!--{$require_mark}--></dt>
        <dd class="u-mb--2">
            <!--{assign var=key1 value="`$prefix`email"}-->
            <!--{if $arrErr[$key1]}-->
                <p><small class="attention"><!--{$arrErr[$key1]}--></small></p>
            <!--{/if}-->
            <input type="text" name="<!--{$key1}-->" value="<!--{$arrForm[$key1].value|h}-->" style="<!--{$arrErr[$key1]|sfGetErrorColor}-->; ime-mode: disabled;" class="c-form-parts" />
        </dd>
    <!--{/if}-->
    <!--{if $flgFields == 2 || $flgFields == 3}-->
        <tr>
            <!--{assign var=key1 value="`$prefix`year"}-->
            <!--{assign var=key2 value="`$prefix`month"}-->
            <!--{assign var=key3 value="`$prefix`day"}-->
            <th>生年月日<!--{if $arrForm[$key1].require}--><!--{$require_mark}--><!--{/if}--></th>
        <dd class="u-mb--2">
                <!--{assign var=errBirth value="`$arrErr.$key1``$arrErr.$key2``$arrErr.$key3`"}-->
                <!--{if $errBirth}-->
                    <p><small class="attention"><!--{$errBirth}--></small></p>
                <!--{/if}-->
                <select name="<!--{$key1}-->" style="<!--{$errBirth|sfGetErrorColor}-->">
                    <!--{html_options options=$arrYear selected=$arrForm[$key1].value|default:''}-->
                </select>年&nbsp;
                <select name="<!--{$key2}-->" style="<!--{$errBirth|sfGetErrorColor}-->">
                    <!--{html_options options=$arrMonth selected=$arrForm[$key2].value|default:''}-->
                </select>月&nbsp;
                <select name="<!--{$key3}-->" style="<!--{$errBirth|sfGetErrorColor}-->">
                    <!--{html_options options=$arrDay selected=$arrForm[$key3].value|default:''}-->
                </select>日
        </dd>
    <!--{/if}-->
    <!--{if $flgFields == 3 || $flgFields == 93}-->
        <dt class="c-heading--form-title">パスワード<!--{$require_mark}--></dt>
        <dd class="u-mb--2">
            <!--{assign var=key1 value="`$prefix`password"}-->
            <!--{if $arrErr[$key1]}-->
                <p><small class="attention"><!--{$arrErr[$key1]}--></small></p>
            <!--{/if}-->
            <input type="password" name="<!--{$key1}-->" value="<!--{$arrForm[$key1].value|h}-->" maxlength="<!--{$arrForm[$key1].length}-->" style="<!--{$arrErr[$key1]|sfGetErrorColor}-->" class="u-mb--1 c-form-parts" />
            <p ><small>半角英数字<!--{$smarty.const.PASSWORD_MIN_LEN}-->～<!--{$smarty.const.PASSWORD_MAX_LEN}-->文字でお願いします。（記号可）</small></p>
        </dd>
    <!--{/if}-->
    <!--{if $flgFields == 3}-->
        <dt class="c-heading--form-title">お支払い方法<!--{$require_mark}--></dt>
        <dd class="u-mb--2">
            <!--{assign var=key1 value="`$prefix`default_payment_id"}-->
            <select class="top" name="<!--{$key1|h}-->" <!--{if $arrErr[$key1]}--><!--{sfSetErrorStyle}--><!--{/if}-->>
                <option value="" selected="selected">選択してください</option>
                <!--{html_options options=$arrPayment selected=$arrForm[$key1].value}-->
            </select>
        </dd>
    <!--{/if}-->
    <!--{if $flgFields == 93}-->
        <!--{assign var=key1 value="nickname"}-->
        <dt class="c-heading--form-title"><!--{$arrForm[$key1].disp_name|h}--><!--{if $arrForm[$key1].require}--><!--{$require_mark}--><!--{/if}--></dt>
        <dd class="u-mb--2">
            <!--{if $arrErr[$key1]}-->
                <p><small class="attention"><!--{$arrErr[$key1]}--></small></p>
            <!--{/if}-->
            <input type="text" name="<!--{$key1|h}-->" value="<!--{$arrForm[$key1].value|h}-->" maxlength="<!--{$arrForm[$key1].length}-->" style="ime-mode: active;<!--{$arrErr[$key1]|sfGetErrorColor}-->; " class="c-form-parts" />
        </dd>

    <!--{/if}-->
<!--{/strip}-->
