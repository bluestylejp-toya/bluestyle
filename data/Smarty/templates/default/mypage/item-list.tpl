<div id="mypagecolumn">
    <h2 class="title"><!--{$tpl_title|h}--></h2>
    <!--{if $tpl_navi != ""}-->
        <!--{include file=$tpl_navi}-->
    <!--{else}-->
        <!--{include file="`$smarty.const.TEMPLATE_REALDIR`mypage/navi.tpl"}-->
    <!--{/if}-->
    <div id="mycontents_area">
        <form name="form1" id="form1" method="post" action="?">
            <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
            <input type="hidden" name="pageno" value="<!--{$tpl_pageno}-->" />
            <input type="hidden" name="mode" value="" />
            <h3><!--{$tpl_subtitle|h}--></h3>

            <!--{if $tpl_linemax > 0}-->

                <p><span class="attention"><!--{$tpl_linemax}-->件</span>の出品中アイテムがあります。</p>
                <div class="paging">
                    <!--▼ページナビ-->
                    <!--{$tpl_strnavi}-->
                    <!--▲ページナビ-->
                </div>

                <table summary="出品中アイテム">
                    <col width="30%" />
                    <col width="50%" />
                    <col width="20%" />
                    <tr>
                        <th class="alignC">アイテム写真</th>
                        <th class="alignC">アイテム名 / 「リクエスト（欲しい）」されている数 / 在庫数</th>
                        <th class="alignC">アイテム編集ページへ</th>
                    </tr>
                    <!--{foreach from=$arrProducts item=$arrProduct}-->
                        <tr>
                            <td class="alignC">
                                <img src="<!--{$smarty.const.IMAGE_SAVE_URLPATH}--><!--{$arrProduct.sub_large_image1|sfNoImageMainList|h}-->" style="max-width: 65px;max-height: 65px;" alt="<!--{$arrProduct.name|h}-->" />
                            </td>
                            <td>
                                <!--{$arrProduct.name|h}-->
                                <div class="count_of_favorite"><!--{$arrProduct.count_of_favorite|n2s|h}--> 件</div>
                                <div class="stock_min"><!--{$arrProduct.stock_min|n2s|h}--> 件</div>
                            </td>
                            <td class="alignC">
                                <a href="item_edit.php?mode=pre_edit&product_id=<!--{$arrProduct.product_id|u|h}-->">アイテム編集ページへ</a>
                            </td>
                        </tr>
                    <!--{/foreach}-->
                </table>
                <br />

            <!--{else}-->
                <p>アイテムが登録されておりません。</p>
            <!--{/if}-->
        </form>
    </div>
</div>
