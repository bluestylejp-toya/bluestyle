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
        <a href="<!--{$smarty.const.TOP_URL}-->other/" aria-label="戻る" class="c-btn--header-nav"></a>
        <h1 class="c-header-title"><!--{$tpl_title|h}--></h1>
    </header>
    <table class="c-table l-full">
        <tbody>
            <tr>
                <th>販売業者</th>
                <td><!--{$arrOrder.law_company|h}--></td>
            </tr>
            <tr>
                <th>運営責任者</th>
                <td><!--{$arrOrder.law_manager|h}--></td>
            </tr>
            <tr>
                <th>住所</th>
                <td>〒<!--{$arrOrder.law_zip01|h}-->-<!--{$arrOrder.law_zip02|h}--><br /><!--{$arrPref[$arrOrder.law_pref]|h}--><!--{$arrOrder.law_addr01|h}--><!--{$arrOrder.law_addr02|h}--></td>
            </tr>
            <tr>
                <th>電話番号</th>
                <td>
                <div class="attention">※お電話でのお問合せは、基本的に受け付けておりません。</div>
                <!--{$arrOrder.law_tel01|h}-->-<!--{$arrOrder.law_tel02|h}-->-<!--{$arrOrder.law_tel03|h}-->
                </td>
            </tr>
            <tr>
                <th>FAX番号</th>
                <td><!--{$arrOrder.law_fax01|h}-->-<!--{$arrOrder.law_fax02|h}-->-<!--{$arrOrder.law_fax03|h}--></td>
            </tr>
            <tr>
                <th>メールアドレス</th>
                <td><a href="mailto:<!--{$arrOrder.law_email|escape:'hex'}-->"><!--{$arrOrder.law_email|escape:'hexentity'}--></a></td>
            </tr>
            <tr>
                <th>URL</th>
                <td><a href="<!--{$arrOrder.law_url|h}-->"><!--{$arrOrder.law_url|h}--></a></td>
            </tr>
            <tr>
                <th>商品以外の必要代金</th>
                <td><!--{$arrOrder.law_term01|nl2br}--></td>
            </tr>
            <tr>
                <th>注文方法</th>
                <td><!--{$arrOrder.law_term02|h|nl2br}--></td>
            </tr>
            <tr>
                <th>支払方法</th>
                <td><!--{$arrOrder.law_term03|h|nl2br}--></td>
            </tr>
            <tr>
                <th>支払期限</th>
                <td><!--{$arrOrder.law_term04|h|nl2br}--></td>
            </tr>
            <tr>
                <th>引渡し時期</th>
                <td><!--{$arrOrder.law_term05|h|nl2br}--></td>
            </tr>
            <tr>
                <th>返品・交換について</th>
                <td><!--{$arrOrder.law_term06|h|nl2br}--></td>
            </tr>
        </tbody>
    </table>
</div>
