<section>
    <aside class="c-alert--yellow">
        <h2 class="c-alert__title">ご注意ください</h2>
        <p>現在、出品可能なアイテムのサイズは、ヤマト運輸のネコポスのサイズ（31.2cm x 22.8cm x 2.5cm：1kg）までに制限させていただいています。</p>
    </aside>
    <p class="l-header--btn"><a href="<!--{$smarty.const.HTTPS_URL}-->mypage/item_edit.php" class="c-btn--gradient"><svg width="15" height="14" viewBox="0 0 15 14" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M14.1279 8H8.12793V14H6.12793V8H0.12793V6H6.12793V0H8.12793V6H14.1279V8Z" fill="white"/></svg>出品する</a></p>
    <div id="mycontents_area">
        <form name="form1" id="form1" method="post" action="?">
            <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
            <input type="hidden" name="pageno" value="<!--{$tpl_pageno}-->" />
            <input type="hidden" name="mode" value="" />
            <h2 class="c-heading--sm">アイテム</h2>

            <!--{if $tpl_linemax > 0}-->

                <ul>
                    <!--{foreach from=$arrProducts item=$arrProduct}-->
                        <li>
                            <a href="item_edit.php?mode=pre_edit&product_id=<!--{$arrProduct.product_id|u|h}-->" class="c-item--has-icon --edit">
                                <img src="<!--{$smarty.const.IMAGE_SAVE_URLPATH}--><!--{$arrProduct.sub_large_image1|sfNoImageMainList|h}-->" alt="<!--{$arrProduct.name|h}-->"  class="c-item__img"/>

                                <div class="c-item__main">
                                    <p class="c-item__title"><!--{$arrProduct.name|h}--></p>
                                    <div class="c-item__status"><i class="c-item__<!--{if $arrProduct.status == 2}-->unpublished<!--{else}-->published<!--{/if}-->"></i><div class="c-item__request"><!--{$arrProduct.count_of_favorite|n2s|h}--></div></div>
                                </div>
                            </a>
                        </li>
                    <!--{/foreach}-->
                </ul>

                <!--▼ページナビ-->
                <div class="c-pagination"><!--{$tpl_strnavi}--></div>
                <!--▲ページナビ-->
            <!--{else}-->
                <p>アイテムが登録されておりません。</p>
            <!--{/if}-->
        </form>
    </div>
</div>
