<!--{strip}-->
<section>
    <form name="form1" id="form1" method="post" action="?">
        <header class="l-header__inner">
            <a href="?" onclick="eccube.setModeAndSubmit('return', '', ''); return false;" aria-label="戻る" class="c-btn--header-nav"></a>
            <p class="c-header-title">プロフィール</p>
        </header>
        <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
        <input type="hidden" name="mode" value="complete" />
        <!--{foreach from=$arrForm key=key item=item}-->
            <input type="hidden" name="<!--{$key|h}-->" value="<!--{$item.value|h}-->" />
        <!--{/foreach}-->
            <!--{assign var=key1 value="profile_image"}-->
            <div class="c-profile-img u-mb--4">
                <div class="c-profile-img__inner">
                <!--{if $arrFile[$key1].filepath != ""}-->
                    <img src="<!--{$arrFile[$key1].filepath}-->" alt="" /><br />
                <!--{/if}-->
                </div>
            </div>

        <dl class="c-list--dl u-mb--4">
                <!--{assign var=key1 value="nickname"}-->
            <dt><!--{$arrForm[$key1].disp_name|h}--></dt>
            </dd><!--{$arrForm[$key1].value|h}--></dd>
                <!--{assign var=key1 value="self_introduction"}-->
            <dt><!--{$arrForm[$key1].disp_name|h}--></dt>
            <dd><!--{$arrForm[$key1].value|h|nl2br}--></dd>
                <!--{assign var=key1 value="hobbies"}-->
            <dt><!--{$arrForm[$key1].disp_name|h}--></dt>
            <dd><!--{$arrForm[$key1].value|h}--></dd>
            <dt>都道府県</dt>
            <dd><!--{$arrPref[$tpl_pref_id]|h}--></dd>
        </dl>
        <p class="u-mb--1"><button class="c-btn--primary" name="complete" id="complete">登録する</button>
        <p class="u-mb--1"><a href="?" onclick="eccube.setModeAndSubmit('return', '', ''); return false;" class="c-btn--default">戻る</a></p>
        </p>
    </form>
</section>
<!--{/strip}-->
