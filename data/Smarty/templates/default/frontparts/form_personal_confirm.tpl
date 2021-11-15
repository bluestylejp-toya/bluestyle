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

<!--{strip}-->
    <!--{if $flgFields != 93}-->
        <dt>お名前</dt>
        <dd>
            <!--{assign var=key1 value="`$prefix`name01"}-->
            <!--{assign var=key2 value="`$prefix`name02"}-->
            <!--{$arrForm[$key1].value|h}-->&nbsp;
            <!--{$arrForm[$key2].value|h}-->
        </dd>
        <dt>お名前(フリガナ)</th>
        <dd>
            <!--{assign var=key1 value="`$prefix`kana01"}-->
            <!--{assign var=key2 value="`$prefix`kana02"}-->
            <!--{$arrForm[$key1].value|h}-->&nbsp;
            <!--{$arrForm[$key2].value|h}-->
        </dd>
        <!--{if $smarty.const.FORM_COUNTRY_ENABLE}-->
        <dt>国</dt>
        <dd>
            <!--{assign var=key1 value="`$prefix`country_id"}-->
            <!--{assign var="country_id" value=$arrForm[$key1].value}-->
            <!--{$arrCountry[$country_id]|h}-->
        </dd>
        </tr>
        <dt>ZIP CODE</dt>
        <dd>
            <!--{assign var=key1 value="`$prefix`zipcode"}-->
            <!--{$arrForm[$key1].value|h}-->
        </dd>
        <!--{/if}-->
        <dt>郵便番号</dt>
        <dd>
            <!--{assign var=key1 value="`$prefix`zip01"}-->
            <!--{assign var=key2 value="`$prefix`zip02"}-->
            〒 <!--{$arrForm[$key1].value|h}--> - <!--{$arrForm[$key2].value|h}-->
        </dd>
        <dt>住所</dt>
        <dd>
            <!--{assign var=key1 value="`$prefix`pref"}-->
            <!--{assign var=key2 value="`$prefix`addr01"}-->
            <!--{assign var=key3 value="`$prefix`addr02"}-->
            <!--{assign var=key4 value="`$prefix`addr03"}-->
            <!--{assign var="pref_id" value=$arrForm[$key1].value}-->
            <!--{$arrPref[$pref_id]|h}--><!--{$arrForm[$key2].value|h}--><!--{$arrForm[$key3].value|h}--><!--{$arrForm[$key4].value|h}-->
        </dd>
        <dt>電話番号</dt>
        <dd>
            <!--{assign var=key1 value="`$prefix`tel01"}-->
            <!--{assign var=key2 value="`$prefix`tel02"}-->
            <!--{assign var=key3 value="`$prefix`tel03"}-->
            <!--{$arrForm[$key1].value|h}--> - <!--{$arrForm[$key2].value|h}--> - <!--{$arrForm[$key3].value|h}-->
        </dd>
    <!--{/if}-->
    <!--{if $flgFields != 1}-->
        <dt>メールアドレス</dt>
        <dd>
            <!--{assign var=key1 value="`$prefix`email"}-->
            <a href="mailto:<!--{$arrForm[$key1].value|escape:'hex'}-->"><!--{$arrForm[$key1].value|escape:'hexentity'}--></a>
        </dd>
    <!--{/if}-->
    <!--{if $flgFields == 2 || $flgFields == 3}-->
        <dt>生年月日</dt>
        <dd>
            <!--{assign var=key1 value="`$prefix`year"}-->
            <!--{assign var=key2 value="`$prefix`month"}-->
            <!--{assign var=key3 value="`$prefix`day"}-->
            <!--{if strlen($arrForm[$key1].value) > 0 && strlen($arrForm[$key2].value) > 0 && strlen($arrForm[$key3].value) > 0}-->
            <!--{$arrForm[$key1].value|h}-->年<!--{$arrForm[$key2].value|h}-->月<!--{$arrForm[$key3].value|h}-->日
            <!--{else}-->
            未登録
            <!--{/if}-->
        </dd>
    <!--{/if}-->
    <!--{if $flgFields == 3 || $flgFields == 93}-->
        <dt>パスワード</dt>
        <dd><!--{$passlen}--></dd>
    <!--{/if}-->
    <!--{if $flgFields == 3}-->
        <dt>お支払い方法</dt>
        <dd>
            <!--{assign var=key1 value="`$prefix`default_payment_id"}-->
            <!--{assign var="default_payment_id" value=$arrForm[$key1].value}-->
            <!--{$arrPayment[$default_payment_id]|h}-->
        </dd>
    <!--{/if}-->
    <!--{if $flgFields == 93}-->
        <!--{assign var=key1 value="nickname"}-->
        <dt><!--{$arrForm[$key1].disp_name|h}--></dt>
        <dd><!--{$arrForm[$key1].value|h}--></dd>
    <!--{/if}-->
<!--{/strip}-->
