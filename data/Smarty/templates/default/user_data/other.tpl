<!--/*
その他、トップページ
*/-->

<form name="login_form" id="login_form" method="post" action="<!--{$smarty.const.HTTPS_URL}-->frontparts/login_check.php"<!--{if $tpl_login}--> onsubmit="return eccube.checkLoginFormInputted('login_form')"<!--{/if}-->>
    <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
    <input type="hidden" name="mode" value="login" />
    <input type="hidden" name="url" value="<!--{$smarty.server.REQUEST_URI|h}-->" />
    <section class="u-pt--3">
        <h2 class="c-heading--md u-text--left">サービス情報</h2>
        <ul class="c-nav-list u-mb--4">
            <li><a href="<!--{$smarty.const.TOP_URL}-->abouts/">Chainについて</a></li>
            <li><a href="<!--{$smarty.const.TOP_URL}-->guide/privacy.php">プライバシーポリシー</a></li>
            <li><a href="<!--{$smarty.const.TOP_URL}-->order/">特定商取引に関する法律に基づく表記</a></li>
            <li><a href="<!--{$smarty.const.TOP_URL}-->user_data/kiyaku.php">ご利用規約</a></li>
        </ul>
        <h2 class="c-heading--md u-text--left">サポート</h2>
        <ul class="c-nav-list u-mb--4">
            <li><a href="<!--{$smarty.const.TOP_URL}-->user_data/news.php">お知らせ<span class="c-bach--num">2</span></a></li>
            <li><a href="<!--{$smarty.const.TOP_URL}-->contact/">お問い合わせ</a></li>
            <li><a href="<!--{$smarty.const.TOP_URL}-->user_data/guide.php">ご利用方法</a></li>
            <li><a href="<!--{$smarty.const.TOP_URL}-->user_data/flow.php">発送の流れ</a></li>
            <li><a href="<!--{$smarty.const.TOP_URL}-->user_data/payment.php">支払い方法</a></li>
            <li><a href="<!--{$smarty.const.TOP_URL}-->user_data/help.php">ヘルプ</a></li>
        </ul>
        <ul class="c-nav-list">
            <li><a onclick="eccube.fnFormModeSubmit('login_form', 'logout', '', ''); return false;">ログアウト</a></li>
            <li><a href="<!--{$smarty.const.TOP_URL}-->mypage/refusal.php">アカウント削除</a></li>
        </ul>
    </section>
</form>
