<!--/*
その他、トップページ
*/-->

<!--{if $tpl_login }-->
<!--{assign var=is_login value=true}-->
<!--{else}-->
<!--{assign var=is_login value=false}-->
<!--{/if}-->
<form name="login_form" id="login_form" method="post" action="<!--{$smarty.const.HTTPS_URL}-->frontparts/login_check.php"<!--{if $tpl_login}--> onsubmit="return eccube.checkLoginFormInputted('login_form')"<!--{/if}-->>
    <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
    <input type="hidden" name="mode" value="login" />
    <input type="hidden" name="url" value="<!--{$smarty.server.REQUEST_URI|h}-->" />
    <section class="u-pt--3">
        <h2 class="c-heading--md u-text--left">サポート</h2>
        <ul class="c-nav-list u-mb--4">
            <!--{*<li><a href="<!--{$smarty.const.TOP_URL}-->news/">お知らせ<span class="c-batch--num">2</span></a></li>*}-->
            <li><a href="<!--{$smarty.const.TOP_URL}-->news/">みなさんにお知らせ</a></li>
            <li style="font-weight: 600;line-height: 60px;">交換利用料<span style="margin-left:20px;color: red;">無料</span></li>
            <li><a href="<!--{$smarty.const.TOP_URL}-->guide/guide.php">ご利用ガイド</a></li>
            <li><a href="<!--{$smarty.const.TOP_URL}-->guide/help.php">よくある質問</a></li>
            <li><a href="<!--{$smarty.const.TOP_URL}-->guide/flow.php">発送の流れ</a></li>
            <!--{if $tpl_login }-->
            <li><a href="<!--{$smarty.const.TOP_URL}-->guide/postage.php">送料について</a></li>
            <!--{/if}-->
            <li><a href="<!--{$smarty.const.TOP_URL}-->contact/">お問い合わせ</a></li>
            <!--{*
            <li><a href="<!--{$smarty.const.TOP_URL}-->guide/guide.php">ご利用方法</a></li>
            <li><a href="<!--{$smarty.const.TOP_URL}-->guide/payment.php">支払い方法</a></li>
            <li><a href="<!--{$smarty.const.TOP_URL}-->guide/help.php">ヘルプ</a></li>
            *}-->
        </ul>
        <h2 class="c-heading--md u-text--left">サービス情報</h2>
        <ul class="c-nav-list u-mb--4">
            <li><a href="<!--{$smarty.const.TOP_URL}-->guide/privacy.php">プライバシーポリシー</a></li>
            <li><a href="<!--{$smarty.const.TOP_URL}-->order/">特定商取引に関する法律に基づく表記</a></li>
            <li><a href="<!--{$smarty.const.TOP_URL}-->terms/kiyaku.php">ご利用規約</a></li>
        </ul>
        <!--{if $is_login}-->
        <ul class="c-nav-list">
            <li><button class="c-btn--logout" type="button">ログアウト</button></li>
            <li><a href="<!--{$smarty.const.TOP_URL}-->contact/">退会　<p style="margin-top: 5px" class="attention">*お問い合わせから退会の連絡をお願いします。</p></a></li>
            <!--{*
            <li><a href="<!--{$smarty.const.TOP_URL}-->mypage/refusal.php">アカウント削除</a></li>
        *}-->
        </ul>
        <div class="l-popup" data-item_mode="false">
            <div class="l-popup__inner">
                <p class="u-mb--2 report_message">ログアウトしますか？</p>
                <button type="button" class="c-btn--primary u-mb--2 report_submit" onclick="eccube.fnFormModeSubmit('login_form', 'logout', '', ''); return false;">ログアウト</button>
                <button type="button" class="c-btn--default report_undo-btn">やめる</button>
            </div>
            <div class="l-popup__close"></div>
        </div>
        <!--{/if}-->
    </section>
</form>
<script>
// 通報の処理
$('.c-btn--logout').on('click', function(){
    $('.l-popup').attr('data-item_mode', 'logout') ;
    $('body').addClass('--overflow-hidden');

    $('.l-popup .l-popup__close, .report_undo-btn').on('click', function(){
        $('body').removeClass('--overflow-hidden');
        $('.l-popup').attr('data-item_mode', 'false') ;
    })
})
</script>
