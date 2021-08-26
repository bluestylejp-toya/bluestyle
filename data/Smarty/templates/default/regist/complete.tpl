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

    <!-- 分岐する -->
    <!--{$send=false}-->
    <!--{if $send}-->
    <section>
    <div class="c-entry-kv">
        <img src="<!--{$TPL_URLPATH}-->img/entry/entry-send-mail.png" class="" />
    </div>
    <h1 class="c-heading--md u-color--gray">登録情報を送信しました！</h1>
    <p class="u-mb--4 u-color--gray">
        xxxxxxxxxxx@xxxx.xxx
        へ、確認用のメールを送信いたしました。メールをご確認いただき、メールに記載されたURLをタップして、Chainへの登録を完了してください。
    </p>

    <!-- LINE友達追加ボタン -->
    <p class="u-mb--4">
        <a href="https://lin.ee/NGSPD7f" class="c-btn--line" target="blank" rel="noopener">友だち追加</a>
    </p>
    <hr class="u-mb--4" />
    <h2 class="c-heading--subtitle">メールが届かない場合</h2>
    <p class="u-color--gray"></p>
    <ul class="u-color--gray c-list--dot">
        <li>迷惑メールフォルダに振り分けられていたり、フィルタや転送の設定によって受信ボックス以外の場所に保管されていないかご確認ください。</li>

        <li>メールの配信に時間がかかる場合があります。数分待ってから再度届いているかご確認ください。</li>
        <li>登録にご使用のメールアドレス xxxxxxxxxxx@xxxx.xxx が正しいかどうかご確認ください。正しくない場合は、改めてご登録ください。</li>
    </ul>
    <!--{else}-->
    <div class="l-header__inner u-mb--0">
        <a href="<!--{$smarty.const.TOP_URL}-->products/list.php" aria-label="戻る" class="c-btn--header-nav"></a>
        <h1 class="c-header-title"><!--{$tpl_title|h}--></h1>
    </div>
    <div class="c-entry-kv">
        <img src="<!--{$TPL_URLPATH}-->img/entry/entry-complete.png" class="" />
    </div>
    <h1 class="c-heading--md u-color--gray u-mb--4">
        おめでとうございます！<br />登録完了しました
    </h1>
    <p>
        <a href="<!--{$smarty.const.TOP_URL}-->products/list.php" class="c-btn--primary"
        >ホームへ</a
        >
    </p>
    <!--{/if}-->
    </section>
