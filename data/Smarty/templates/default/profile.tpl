<!--{strip}-->
    <dl>
        <dt>ニックネーム</dt>
        <dd><!--{$arrCustomer.nickname|h}--></dd>
    </dl>
    <dl>
        <dt>紹介文</dt>
        <dd><!--{$arrCustomer.self_introduction|h|nl2br}--></dd>
    </dl>
    <!--{if strlen($arrCustomer.profile_image) >= 1}-->
        <dl>
            <dt>画像</dt>
            <dd><img src="<!--{$smarty.const.IMAGE_SAVE_URLPATH|h}-->../save_profile_image/<!--{$arrCustomer.profile_image|h}-->"></dd>
        </dl>
    <!--{/if}-->
    <dl>
        <dt>趣味</dt>
        <dd><!--{$arrCustomer.hobbies|h}--></dd>
    </dl>
    <dl>
        <dt>都道府県</dt>
        <dd><!--{$arrPref[$arrCustomer.pref]|h}--></dd>
    </dl>
    <div>
        <a href="<!--{$smarty.const.ROOT_URLPATH|h}-->mypage/profile.php">編集</a>
    </div>
<!--{/strip}-->
