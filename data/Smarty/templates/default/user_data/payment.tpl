<section>
    <header class="l-header__inner">
        <a href="<!--{$smarty.const.TOP_URL}-->mypage/" aria-label="戻る" class="c-btn--header-nav"></a>
        <p class="c-header-title">お支払い情報登録</p>
    </header>
    <div class="c-notification--secondary notification">カード情報を登録しました</div>
    <p class="u-mb--4">クレジットカード情報を入力してください。</p>
    <p class="u-mb--4 u-text--center"><img src="<!--{$TPL_URLPATH}-->img/common/payment.png" width="250"></p>
    <form>
        <dl class="c-list--dl u-mb--4">
            <dt>カード番号<span class="attention">※必須</span></dt>
            <!--{assign var=key2 value="`$prefix`name02"}-->
            <dd><input type="text" name="<!--{$key2}-->" value="<!--{$arrForm[$key2].value|h}-->" maxlength="<!--{$arrForm[$key2].length}-->" style="<!--{$arrErr[$key2]|sfGetErrorColor}-->; ime-mode: active;" class="c-form-parts"  placeholder="xxxxxxxxxxxx"/>
            <p><small class="attention"><!--{$arrErr[$key1]}--></small></p>
            </dd>
            <dt>有効期限<span class="attention">※必須</span></dt>
            <dd>
            <div class="c-form-parts--card">
                <input type="text" name="<!--{$key1}-->" value="<!--{$arrForm[$key1].value|h}-->" maxlength="<!--{$arrForm[$key1].length}-->" style="<!--{$arrErr[$key1]|sfGetErrorColor}-->; ime-mode: disabled;"  class="next_form" placeholder="MM"/>/<input type="text" name="<!--{$key2}-->" value="<!--{$arrForm[$key2].value|h}-->" maxlength="<!--{$arrForm[$key2].length}-->" style="<!--{$arrErr[$key2]|sfGetErrorColor}-->; ime-mode: disabled;"  class="next_form" placeholder="DD"/>
            </div>
            </dd>
            <dt>セキュリティコード<span class="attention">※必須</span></dt>
            <dd><input type="password" name="<!--{$key2}-->" value="<!--{$arrForm[$key2].value|h}-->" maxlength="<!--{$arrForm[$key2].length}-->" style="<!--{$arrErr[$key2]|sfGetErrorColor}-->; ime-mode: active;" class="c-form-parts--sm" placeholder="SVC">
            <p><small class="attention"><!--{$arrErr[$key1]}--></small></p>
            </dd>
        </dl>
        <button name="refusal" id="refusal" class="c-btn--primary" type="button">登録する</button>
    </form>
</section>

<script>
$('.c-btn--primary').on('click', function(){
    $('body').find(".notification").fadeIn(300,
        function() {
            setTimeout(function(){
            $('body').find(".notification").fadeOut();
            $('.c-modal').attr('data-modal_mode', 'false').removeClass('--active')
            $('body').removeClass('--overflow-hidden');
            $this.remove()
        }, 1000);
    })
})
</script>
