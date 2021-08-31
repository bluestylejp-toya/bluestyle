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
        <a href="<!--{$smarty.const.TOP_URL}-->mypage/refusal.php" aria-label="戻る" class="c-btn--header-nav"></a>
        <h1 class="c-header-title">アカウントを削除する（確認）</h1>
    </header>
    <form name="form1" id="form1" method="post" action="?">
        <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
        <input type="hidden" name="refusal_transactionid" value="<!--{$refusal_transactionid}-->" />
        <input type="hidden" name="mode" value="complete" />
        <p class="c-message--alert">退会手続きを実行してもよろしいでしょうか？</p>
        <p class="u-mb--4">退会手続きが完了した時点で、現在保存されている購入履歴や、<br />
        お届け先等の情報は全てなくなりますのでご注意ください。</p>
        <a href="./refusal.php" class="c-btn--default u-mb--2">アカウントを削除しません</a>

        <button name="refuse_do" id="refuse_do" class="c-btn--danger">アカウントを削除します</button>

    </form>
</section>
