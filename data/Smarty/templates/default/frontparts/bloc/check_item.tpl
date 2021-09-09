<!--{if $arrCheckItems}-->
<div class="c-item-tab__content" data-tab_item="1">
    <ul class="l-item-list">
        <!--{section name=cnt loop=$arrCheckItems}-->
            <li class="c-item--default">
                <a href="<!--{$smarty.const.P_DETAIL_URLPATH}--><!--{$arrCheckItems[cnt].product_id|u}-->" class="c-item--default__img">
                    <span class="c-square"><img src="<!--{$smarty.const.IMAGE_SAVE_URLPATH}--><!--{$arrProduct.sub_image1|sfNoImageMainList|h}-->"  alt="<!--{$arrCheckItems[cnt].name|h}-->"/></span>
                    <!--{if $arrCheckItems[cnt].favorite_products_count > 0}-->
                        <span class="favorite_area"><span class="c-item--default__request" data-product_id="<!--{$arrProduct.product_id|h}-->"></span></span>
                    <!--{/if}-->
                <p class="c-item--default__title"><a href="<!--{$smarty.const.P_DETAIL_URLPATH}--><!--{$arrCheckItems[cnt].product_id|u}-->"><!--{$arrCheckItems[cnt].name|mb_substr:0:16|h|nl2br}--><!--{if $arrCheckItems[cnt].name|mb_strlen > 16}-->...<!--{/if}--></a></p>
                </p>
            </li>
        <!--{/section}-->
    </ul>
</div>
<!--{/if}-->
