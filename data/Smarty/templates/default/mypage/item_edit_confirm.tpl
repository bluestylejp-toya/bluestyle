<form name="form1" id="form1" method="post" action="?" enctype="multipart/form-data">
    <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
    <input type="hidden" name="mode" value="complete" />
    <!--{foreach key=key item=item from=$arrForm}-->
        <!--{if is_array($item.value)}-->
            <input type="hidden" name="<!--{$key}-->" value="<!--{$item.value|@json_encode|h}-->" />
        <!--{else}-->
            <input type="hidden" name="<!--{$key}-->" value="<!--{$item.value|h}-->" />
        <!--{/if}-->
    <!--{/foreach}-->
    <section>
        <!--{capture assign='require_mark'}--><span class="attention">※</span><!--{/capture}-->
            <header class="l-header__inner<!--{if $arrForm.status.value == 2}--> u-mb--0<!--{/if}-->">
                <a onclick="eccube.setModeAndSubmit('confirm_return','',''); return false;" aria-label="戻る" class="c-btn--header-nav"></a>
                <p class="c-header-title">アイテム編集</p>
            </header>
                    <dl class="c-list--dl">
                        <!--{assign var=key value="name"}-->
                        <dt><!--{$arrForm[$key].disp_name|h}--></dt>
                        <dd>
                            <!--{$arrForm.name.value|h}-->
                        </dd>
                        <!--{assign var=key value="category_id"}-->
                        <dt><!--{$arrForm[$key].disp_name|h}--></dt>
                        <dd>
                            <!--{$arrCatList[$arrForm.category_id.value]|sfTrim}-->
                        </dd>
                        <!--{assign var=key value="status"}-->
                        <dt><!--{$arrForm[$key].disp_name|h}--></dt>
                        <dd>
                            <!--{$arrDISP[$arrForm.status.value]|h}-->
                        </dd>
                        <!--{assign var=key value="product_status"}-->
                        <dt><!--{$arrForm[$key].disp_name|h}--></dt>
                        <dd>
                            <!--{foreach from=$arrForm.product_status.value item=status}-->
                                <!--{$arrSTATUS[$status]|h}-->
                            <!--{/foreach}-->
                        </dd>
                        <!--{assign var=key value="size_id"}-->
                        <dt><!--{$arrForm[$key].disp_name|h}--></dt>
                        <dd>
                            <!--{$arrSize[$arrForm.size_id.value]|sfTrim}-->
                        </dd>
                    </dl>
                    <h2 class="c-heading-subtitle u-text--left u-color--gray">詳細写真とキャプション</h2>
                    <ul class="u-mb--4">
                    <!--{section name=cnt loop=$smarty.const.PRODUCTSUB_MAX}-->

                        <!--{assign var=key value="sub_large_image`$smarty.section.cnt.iteration`"}-->
                        <!--{if $arrFile[$key].filepath != ""}-->
                            <li class="c-item --no-icon">
                                <img src="<!--{$arrFile[$key].filepath}-->" alt="" class="c-item__img"/>
                                <!--{assign var=key value="sub_title`$smarty.section.cnt.iteration`"}-->
                                <div class="c-item__main"><!--{$arrForm[$key].value|h}--></div>
                            </li>
                        <!--{/if}-->
                    <!--{/section}-->
                    </ul>
        <button onclick="document.form1.submit(); return false;" class="c-btn--primary">この内容で登録する</button>
        <button onclick="eccube.setModeAndSubmit('confirm_return','',''); return false;" class="c-btn--default u-mb--2">前のページに戻る</button>

    <section>
</form>
