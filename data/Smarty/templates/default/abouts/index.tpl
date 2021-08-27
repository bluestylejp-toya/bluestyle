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
    <header class="l-header__inner">
        <a href="#" aria-label="戻る" class="c-btn--header-nav"></a>
        <h1 class="c-header-title">Chainについて</h1>
    </header>
    <table class="c-table l-full">
        <tbody>

            <!--{if strlen($arrSiteInfo.shop_name)}-->
                <tr>
                    <th>運営会社</th>
                    <td><!--{$arrSiteInfo.shop_name|h}--></td>
                </tr>
            <!--{/if}-->
            <!--{if strlen($arrSiteInfo.company_name)}-->
                <tr>
                    <th>会社名</th>
                    <td><!--{$arrSiteInfo.company_name|h}--></td>
                </tr>
            <!--{/if}-->
            <!--{if strlen($arrSiteInfo.zip01)}-->
                <tr>
                    <th>所在地</th>
                    <td>〒<!--{$arrSiteInfo.zip01|h}-->-<!--{$arrSiteInfo.zip02|h}--><br /><!--{$arrPref[$arrSiteInfo.pref]|h}--><!--{$arrSiteInfo.addr01|h}--><!--{$arrSiteInfo.addr02|h}--></td>
                </tr>
            <!--{/if}-->
            <!--{if strlen($arrSiteInfo.tel01)}-->
                <tr>
                    <th>電話番号</th>
                    <td><!--{$arrSiteInfo.tel01|h}-->-<!--{$arrSiteInfo.tel02|h}-->-<!--{$arrSiteInfo.tel03|h}--></td>
                </tr>
            <!--{/if}-->
            <!--{if strlen($arrSiteInfo.fax01)}-->
                <tr>
                    <th>FAX番号</th>
                    <td><!--{$arrSiteInfo.fax01|h}-->-<!--{$arrSiteInfo.fax02|h}-->-<!--{$arrSiteInfo.fax03|h}--></td>
                </tr>
            <!--{/if}-->
            <!--{if strlen($arrSiteInfo.email02)}-->
                <tr>
                    <th>メールアドレス</th>
                    <td><a href="mailto:<!--{$arrSiteInfo.email02|escape:'hex'}-->"><!--{$arrSiteInfo.email02|escape:'hexentity'}--></a></td>
                </tr>
            <!--{/if}-->
            <!--{if strlen($arrSiteInfo.business_hour)}-->
                <tr>
                    <th>営業時間</th>
                    <td><!--{$arrSiteInfo.business_hour|h}--></td>
                </tr>
            <!--{/if}-->
            <!--{if strlen($arrSiteInfo.good_traded)}-->
                <tr>
                    <th>取扱商品</th>
                    <td><!--{$arrSiteInfo.good_traded|h|nl2br}--></td>
                </tr>
            <!--{/if}-->
            <!--{if strlen($arrSiteInfo.message)}-->
                <tr>
                    <th>メッセージ</th>
                    <td><!--{$arrSiteInfo.message|h|nl2br}--></td>
                </tr>
            <!--{/if}-->
        </tbody>
    </table>
</section>
