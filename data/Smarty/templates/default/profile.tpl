<!--{strip}-->
<section>
    <header class="l-header__inner">
        <a href="<!--{$smarty.const.TOP_URL}-->mypage/" aria-label="戻る" class="c-btn--header-nav"></a>
        <p class="c-header-title">プロフィール</p>
    </header>
    <div class="c-profile-img--circle u-mb--4">
        <!--{if strlen($arrCustomer.profile_image) >= 1}-->
            <img src="<!--{$smarty.const.IMAGE_SAVE_URLPATH|h}-->../save_profile_image/<!--{$arrCustomer.profile_image|h}-->">
        <!--{else}-->
            <img src="<!--{$smarty.const.IMAGE_SAVE_URLPATH|h}--><!--{$tpl_profile_image|sfNoImageMainList|h}-->">
        <!--{/if}-->
    </div>
    <dl class="u-mb--4 c-list--dl">
        <dt>ニックネーム</dt>
        <dd><!--{$arrCustomer.nickname|h}--></dd>
        <dt>紹介文</dt>
        <dd><!--{$arrCustomer.self_introduction|h|nl2br}--></dd>


        <dt>趣味</dt>
        <dd><!--{$arrCustomer.hobbies|h}--></dd>
        <dt>都道府県</dt>
        <dd><!--{$arrPref[$arrCustomer.pref]|h}--></dd>
    </dl>
    <!--{if $tpl_editable}-->
        <div>
            <a href="<!--{$smarty.const.ROOT_URLPATH|h}-->mypage/profile.php" class="c-btn--primary">編集</a>
        </div>
    <!--{/if}-->
</section>
<!--{/strip}-->
