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
    <h2 class="c-heading--subtitle">Amazon報告の送信が完了いたしました。</h2>
    <p class="u-mb--4">
        万一、ご回答メールが届かない場合は、トラブルの可能性もありますので<br />大変お手数ではございますがもう一度お問い合わせいただくか、お電話にてお問い合わせください。<br />
        今後ともご愛顧賜りますようよろしくお願い申し上げます。
    </p>
    <div class="shop_information">
        <h2 class="c-heading--subtitle"><!--{$arrSiteInfo.company_name|h}--></h2>
        <p class="u-mb--4">
            E-mail：<a href="mailto:<!--{$arrSiteInfo.email02|escape:'hex'}-->"><!--{$arrSiteInfo.email02|escape:'hexentity'}--></a></p>

        <a href="<!--{$smarty.const.TOP_URL}-->" class="c-btn--primary--outline">トップページへ</a>
</section>
