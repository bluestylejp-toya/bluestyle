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
    <!--{if $flgFields != 93}-->
        <dt>姓<span class="attention">※必須</span></dt>
        <!--{assign var=key1 value="`$prefix`name01"}-->
        <dd><input type="text" name="<!--{$key1}-->" value="<!--{$arrForm[$key1].value|h}-->" maxlength="<!--{$arrForm[$key1].length}-->" style="<!--{$arrErr[$key1]|sfGetErrorColor}-->; ime-mode: active;" class="c-form-parts" />
        <p><small class="attention"><!--{$arrErr[$key1]}--></small></p>
        </dd>
        <dt>名<span class="attention">※必須</span></dt>
        <!--{assign var=key2 value="`$prefix`name02"}-->
        <dd><input type="text" name="<!--{$key2}-->" value="<!--{$arrForm[$key2].value|h}-->" maxlength="<!--{$arrForm[$key2].length}-->" style="<!--{$arrErr[$key2]|sfGetErrorColor}-->; ime-mode: active;" class="c-form-parts" />
        <p><small class="attention"><!--{$arrErr[$key1]}--></small></p>
        </dd>
        <dt>セイ<span class="attention">※必須</span></dt>
        <!--{assign var=key1 value="`$prefix`kana01"}-->
        <dd><input type="text" name="<!--{$key1}-->" value="<!--{$arrForm[$key1].value|h}-->" maxlength="<!--{$arrForm[$key1].length}-->" style="<!--{$arrErr[$key1]|sfGetErrorColor}-->; ime-mode: active;" class="c-form-parts" />
        <p><small class="attention"><!--{$arrErr[$key1]}--></small></p>
        </dd>
        <!--{assign var=key2 value="`$prefix`kana02"}-->
        <dt>メイ<span class="attention">※必須</span></dt>
        <dd><input type="text" name="<!--{$key2}-->" value="<!--{$arrForm[$key2].value|h}-->" maxlength="<!--{$arrForm[$key2].length}-->" style="<!--{$arrErr[$key2]|sfGetErrorColor}-->; ime-mode: active;" class="c-form-parts" />
        <p><small class="attention"><!--{$arrErr[$key1]}--></small></p>
        </dd>
        <!--{assign var=key1 value="`$prefix`zip01"}-->
        <!--{assign var=key2 value="`$prefix`zip02"}-->
        <!--{assign var=key3 value="`$prefix`pref"}-->
        <!--{assign var=key4 value="`$prefix`addr01"}-->
        <!--{assign var=key5 value="`$prefix`addr02"}-->
        <!--{assign var=key8 value="`$prefix`addr03"}-->
        <!--{assign var=key6 value="`$prefix`country_id"}-->
        <!--{assign var=key7 value="`$prefix`zipcode"}-->
        <!--{if !$smarty.const.FORM_COUNTRY_ENABLE}-->
            <input type="hidden" name="<!--{$key6}-->" value="<!--{$smarty.const.DEFAULT_COUNTRY_ID}-->" />
        <!--{else}-->
            <tr>
                <th>国<span class="attention">※必須</span></th>
            <dd>
                    <!--{if $arrErr[$key6]}-->
                        <p><small class="attention"><!--{$arrErr[$key6]}--></small></p>
                    <!--{/if}-->
                    <select name="<!--{$key6}-->" style="<!--{$arrErr[$key6]|sfGetErrorColor}-->">
                            <option value="" selected="selected">国を選択</option>
                            <!--{html_options options=$arrCountry selected=$arrForm[$key6].value|default:$smarty.const.DEFAULT_COUNTRY_ID}-->
                    </select>
            </dd>
            <dt>ZIP CODE</dt>
            <dd>
                    <!--{if $arrErr[$key7]}-->
                        <p><small class="attention"><!--{$arrErr[$key7]}--></small></p>
                    <!--{/if}-->
                    <input type="text" name="<!--{$key7}-->" value="<!--{$arrForm[$key7].value|h}-->" maxlength="<!--{$arrForm[$key7].length}-->" class="box120" style="<!--{$arrErr[$key7]|sfGetErrorColor}-->; ime-mode: disabled;" />
            </dd>
            <!--{/if}-->
            <dt>郵便番号<!--{if !$smarty.const.FORM_COUNTRY_ENABLE}--><span class="attention">※必須</span><!--{/if}--></dt>
            <dd>
                <p class="u-mb--2 c-form-parts--zip"><span class="c-form-parts"><input type="text" name="<!--{$key1}-->" value="<!--{$arrForm[$key1].value|h}-->" maxlength="<!--{$arrForm[$key1].length}-->" style="<!--{$arrErr[$key1]|sfGetErrorColor}-->; ime-mode: disabled;" class="next_form"/>-<input type="text" name="<!--{$key2}-->" value="<!--{$arrForm[$key2].value|h}-->" maxlength="<!--{$arrForm[$key2].length}-->" style="<!--{$arrErr[$key2]|sfGetErrorColor}-->; ime-mode: disabled;" class="next_form"/></span>
                    <a href="<!--{$smarty.const.ROOT_URLPATH}-->input_zip.php" onclick="eccube.getAddress('<!--{$smarty.const.INPUT_ZIP_URLPATH}-->', '<!--{$key1}-->', '<!--{$key2}-->', '<!--{$key3}-->', '<!--{$key4}-->'); return false;" target="_blank" class="c-btn--default">
                    郵便番号検索</a>
                </p>
                <p><small>郵便番号自動検索がうまくいかない場合は<a href="https://www.post.japanpost.jp/zipcode/" target="_blank"><span class="mini">こちらから</span></a>検索してください。
                </small></p>
                <!--{if $arrErr[$key1] || $arrErr[$key2]}-->
                    <p><small class="attention"><!--{$arrErr[$key1]}--><!--{$arrErr[$key2]}--></small></p>
                <!--{/if}-->
        </dd>
        <dt>住所<span class="attention">※必須</span></dt>
        <dd>

            <div class="c-form-parts--select u-mb--1">
                <select name="<!--{$key3}-->" style="<!--{$arrErr[$key3]|sfGetErrorColor}-->">
                    <option value="" selected="selected">都道府県を選択</option>
                    <!--{html_options options=$arrPref selected=$arrForm[$key3].value}-->
                </select>
            </div>
            <p class="u-mb--1"><input type="text" name="<!--{$key4}-->" value="<!--{$arrForm[$key4].value|h}-->" class="c-form-parts" style="<!--{$arrErr[$key4]|sfGetErrorColor}-->; ime-mode: active;" placeholder="<!--{$smarty.const.SAMPLE_ADDRESS1}-->"/></p>
            <p class="u-mb--1"><input type="text" name="<!--{$key5}-->" value="<!--{$arrForm[$key5].value|h}-->" class="c-form-parts" style="<!--{$arrErr[$key5]|sfGetErrorColor}-->; ime-mode: active;" placeholder="<!--{$smarty.const.SAMPLE_ADDRESS2}-->"/></p>
            <p class="u-mb--1"><input type="text" name="<!--{$key8}-->" value="<!--{$arrForm[$key8].value|h}-->" class="c-form-parts" style="<!--{$arrErr[$key5]|sfGetErrorColor}-->; ime-mode: active;" placeholder="<!--{$smarty.const.SAMPLE_ADDRESS3}-->"/></p>
            <p class="mini"><span class="attention">住所は3つに分けてご記入ください。マンション名は必ず記入してください。</span></p>
            <!--{if $arrErr[$key3] || $arrErr[$key4] || $arrErr[$key5] || $arrErr[$key8]}-->
                <p><small class="attention"><!--{$arrErr[$key3]}--><!--{$arrErr[$key4]}--><!--{$arrErr[$key5]}--><!--{$arrErr[$key8]}--></small></p>
            <!--{/if}-->
        </dd>
        <dt>電話番号<span class="attention">※必須</span></dt>
        <dd>
            <!--{assign var=key1 value="`$prefix`tel01"}-->
            <!--{assign var=key2 value="`$prefix`tel02"}-->
            <!--{assign var=key3 value="`$prefix`tel03"}-->
            <div class="c-form-parts--tell">
                <input type="text" name="<!--{$key1}-->" value="<!--{$arrForm[$key1].value|h}-->" maxlength="<!--{$arrForm[$key1].length}-->" style="<!--{$arrErr[$key1]|sfGetErrorColor}-->; ime-mode: disabled;"  class="next_form"/>-<input type="text" name="<!--{$key2}-->" value="<!--{$arrForm[$key2].value|h}-->" maxlength="<!--{$arrForm[$key2].length}-->" style="<!--{$arrErr[$key2]|sfGetErrorColor}-->; ime-mode: disabled;"  class="next_form"/>-<input type="text" name="<!--{$key3}-->" value="<!--{$arrForm[$key3].value|h}-->" maxlength="<!--{$arrForm[$key3].length}-->" style="<!--{$arrErr[$key3]|sfGetErrorColor}-->; ime-mode: disabled;"  class="next_form"/>
            </div>
                <!--{if $arrErr[$key1] || $arrErr[$key2] || $arrErr[$key3]}-->
                    <p><small class="attention"><!--{$arrErr[$key1]}--><!--{$arrErr[$key2]}--><!--{$arrErr[$key3]}--></small></p>
                <!--{/if}-->
        </dd>
    <!--{/if}-->
    <!--{if $flgFields != 1}-->
        <dt>メールアドレス<span class="attention">※必須</span></dt>
        <dd>
            <!--{assign var=key1 value="`$prefix`email"}-->
            <input type="text" name="<!--{$key1}-->" value="<!--{$arrForm[$key1].value|h}-->" style="ime-mode: disabled;" class="c-form-parts<!--{if $arrErr[$key1]}--> --error<!--{/if}-->" placeholder="〇〇文字以上の半角英数字"/>
            <!--{if $arrErr[$key1]}-->
                <p><small class="attention"><!--{$arrErr[$key1]}--></small></p>
            <!--{/if}-->
        </dd>
    <!--{/if}-->
    <!--{if $flgFields == 2 || $flgFields == 3}-->
        <!--{assign var=key1 value="`$prefix`year"}-->
        <!--{assign var=key2 value="`$prefix`month"}-->
        <!--{assign var=key3 value="`$prefix`day"}-->
        <dt>生年月日<!--{if $arrForm[$key1].require}--><span class="attention">※必須</span><!--{/if}--></dt>
        <dd>
        <div class="c-form-parts--date">
            <!--{assign var=errBirth value="`$arrErr.$key1``$arrErr.$key2``$arrErr.$key3`"}-->
            <select name="<!--{$key1}-->" style="<!--{$errBirth|sfGetErrorColor}-->" class="c-form-parts--select">
                <!--{html_options options=$arrYear selected=$arrForm[$key1].value|default:''}-->
            </select>年
            <select name="<!--{$key2}-->" style="<!--{$errBirth|sfGetErrorColor}-->" class="c-form-parts--select">
                <!--{html_options options=$arrMonth selected=$arrForm[$key2].value|default:''}-->
            </select>月
            <select name="<!--{$key3}-->" style="<!--{$errBirth|sfGetErrorColor}-->" class="c-form-parts--select">
                <!--{html_options options=$arrDay selected=$arrForm[$key3].value|default:''}-->
            </select>日
            </div>
        </dd>
        <!--{if $errBirth}-->
            <p><small class="attention"><!--{$errBirth}--></small></p>
        <!--{/if}-->

                <dt class="border_right_none">メールマガジン送付<span class="attention">※必須</span></dt>
                <dd>
                    <!--{assign var=key1 value="`$prefix`mailmaga_flg"}-->
                    <!--{if $arrErr[$key1]}-->
                    <div class="attention"><!--{$arrErr[$key1]}--></div>
                    <!--{/if}-->
                    <span style="<!--{$arrErr[$key1]|sfGetErrorColor}-->">
                        <!--{html_radios name=$key1 options=$arrMAILMAGATYPE selected=$arrForm[$key1].value separator='<br>'}-->
                    </span>
                </dd>
    <!--{/if}-->
    <!--{if $flgFields == 3 || $flgFields == 93}-->
        <dt>パスワード<span class="attention">※必須</span></dt>
        <dd>
            <!--{assign var=key1 value="`$prefix`password"}-->
            <input type="password" name="<!--{$key1}-->" value="<!--{$arrForm[$key1].value|h}-->" maxlength="<!--{$arrForm[$key1].length}-->" class="c-form-parts<!--{if $arrErr[$key1]}--> --error<!--{/if}-->" placeholder="<!--{$smarty.const.PASSWORD_MIN_LEN}-->～<!--{$smarty.const.PASSWORD_MAX_LEN}-->の半角英数字"/>
            <!--{if $arrErr[$key1]}-->
                <p><small class="attention"><!--{$arrErr[$key1]}--></small></p>
            <!--{/if}-->
        </dd>
    <!--{/if}-->
    <!--{if $flgFields == 93}-->
        <!--{assign var=key1 value="nickname"}-->
        <dt><!--{$arrForm[$key1].disp_name|h}--><!--{if $arrForm[$key1].require}--><span class="attention">※必須</span><!--{/if}--></dt>
        <dd>
            <input type="text" name="<!--{$key1|h}-->" value="<!--{$arrForm[$key1].value|h}-->" maxlength="<!--{$arrForm[$key1].length}-->" style="ime-mode: active" class="c-form-parts<!--{if $arrErr[$key1]}--> --error<!--{/if}-->" placeholder="Chain内のユーザ名"/>
            <!--{if $arrErr[$key1]}-->
                <p><small class="attention"><!--{$arrErr[$key1]}--></small></p>
            <!--{/if}-->
        </dd>

    <!--{/if}-->
<!--{/strip}-->
