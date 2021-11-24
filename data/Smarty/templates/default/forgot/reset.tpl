<!--{strip}-->
    <section>
        <h2><!--{$tpl_title|h}--></h2>

        <!--{assign var=key1 value="code"}-->
        <!--{if $arrErr[$key1]}-->
            <p><small class="attention"><!--{$arrErr[$key1]}--></small></p>
        <!--{/if}-->

        <form name="form1" id="form1" method="post" action="#">
            <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
            <input type="hidden" name="mode" value="register" />

            <dl class="c-list--dl u-mb--4">
                <dt>パスワード<span class="attention">※必須</span></dt>
                <dd>
                    <!--{assign var=key1 value="password"}-->
                    <input type="password" name="<!--{$key1}-->" value="<!--{$arrForm[$key1].value|h}-->" maxlength="<!--{$arrForm[$key1].length}-->" class="c-form-parts<!--{if $arrErr[$key1]}--> --error<!--{/if}-->" placeholder="<!--{$smarty.const.PASSWORD_MIN_LEN}-->～<!--{$smarty.const.PASSWORD_MAX_LEN}-->の半角英数字"/>
                    <!--{if $arrErr[$key1]}-->
                        <p><small class="attention"><!--{$arrErr[$key1]}--></small></p>
                    <!--{/if}-->
                </dd>
            </dl>
            <button>登録</button>
        </form>
    </section>
<!--{/strip}-->
