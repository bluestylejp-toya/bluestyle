<!--{if $arrCheckItems}-->
<div id="arrCheckItems">
    <h2>最近チェックした商品</h2>
    <ul class="clearfix">
        <!--{section name=cnt loop=$arrCheckItems}-->
            <li>
                <p class="item_image">
                    <a href="<!--{$smarty.const.P_DETAIL_URLPATH}--><!--{$arrCheckItems[cnt].product_id|u}-->">
                        <img src="<!--{$smarty.const.IMAGE_SAVE_URLPATH}--><!--{$arrProduct.sub_image1|sfNoImageMainList|h}-->" style="max-width: 80px;max-height: 80px;" alt="<!--{$arrCheckItems[cnt].name|h}-->"/>
{*                        <img src="<!--{$smarty.const.IMAGE_SAVE_URLPATH}--><!--{$arrProduct.sub_image2|sfNoImageMainList|h}-->" style="max-width: 80px;max-height: 80px;" alt="<!--{$arrCheckItems[cnt].name|h}-->"/>*}
                    </a>
                </p>
                <p><a href="<!--{$smarty.const.P_DETAIL_URLPATH}--><!--{$arrCheckItems[cnt].product_id|u}-->">
                        <!--{$arrCheckItems[cnt].name|h}--></a></p>
                <p class="sale_price">
                    <!--{$smarty.const.SALE_PRICE_TITLE}-->(税込)： <span
                            class="price"><!--{$arrCheckItems[cnt].price02_min_inctax|n2s}--> 円</span>
                </p>
                <p>お気に入りを押されている数:<!--{$arrCheckItems[cnt].favorite_products_count|u}--></p>
            </li>
        <!--{/section}-->
    </ul>
</div>
<!--{/if}-->