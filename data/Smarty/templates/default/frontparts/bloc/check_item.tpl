<!--{if $arrCheckItems}-->
    <!--{assign var=list value="`$smarty.const.ROOT_URLPATH`products/list.php"}-->
        <!--{if $smarty.server.PHP_SELF==$list}-->
            <div class="c-item-tab__content" data-tab_item="1">
        <!--{/if}-->
        <ul class="l-item-list history_list">
            <!--{section name=cnt loop=$arrCheckItems}-->
                <li class="c-item--default">
                    <a href="<!--{$smarty.const.P_DETAIL_URLPATH}--><!--{$arrCheckItems[cnt].product_id|u}-->" class="c-item--default__img">
                        <span class="c-square"><img src="<!--{$smarty.const.IMAGE_SAVE_URLPATH}--><!--{$arrCheckItems[cnt].sub_large_image1|sfNoImageMainList|h}-->"  alt="<!--{$arrCheckItems[cnt].name|h}-->"/></span>
                        <!--{if in_array($arrCheckItems[cnt].product_id|u, $arrRequestProductId)}-->
                            <span class="favorite_area"><span class="c-item--default__request" data-product_id="<!--{$arrProduct.product_id|h}-->"></span></span>
                        <!--{/if}-->
                    <p class="c-item--default__title"><!--{$arrCheckItems[cnt].name|mb_substr:0:16|h|nl2br}--><!--{if $arrCheckItems[cnt].name|mb_strlen > 16}-->...<!--{/if}--></p>
                    </p>
                    </a>
                </li>
            <!--{/section}-->
        </ul>
    <!--{if $smarty.server.PHP_SELF==$list}-->
        </div>
    <!--{/if}-->
<!--{/if}-->
