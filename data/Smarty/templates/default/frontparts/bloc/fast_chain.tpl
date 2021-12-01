<!--{if count($arrFastChainProduct) > 0}-->
    <!--{assign var=list value="`$smarty.const.ROOT_URLPATH`products/list.php"}-->
        <!--{if $smarty.server.PHP_SELF==$list}-->
            <div class="c-item-tab__content" data-tab_item="1">
        <!--{/if}-->
        <ul class="l-item-list history_list">
            <!--{section name=cnt loop=$arrFastChainProduct}-->
                <li class="c-item--default">
                    <a href="<!--{$smarty.const.P_DETAIL_URLPATH}--><!--{$arrFastChainProduct[cnt].product_id|u}-->" class="c-item--default__img">
                        <span class="c-square"><img src="<!--{$smarty.const.IMAGE_SAVE_URLPATH}--><!--{$arrFastChainProduct[cnt].sub_large_image1|sfNoImageMainList|h}-->"  alt="<!--{$arrFastChainProduct[cnt].name|h}-->"/></span>
                    <p class="c-item--default__title"><!--{$arrFastChainProduct[cnt].name|mb_substr:0:16|h|nl2br}--><!--{if $arrFastChainProduct[cnt].name|mb_strlen > 16}-->...<!--{/if}--></p>
                    </p>
                    </a>
                </li>
            <!--{/section}-->
        </ul>
    <!--{if $smarty.server.PHP_SELF==$list}-->
        </div>
    <!--{/if}-->
<!--{else}-->
<script>
    document.addEventListener('DOMContentLoaded', function() {
        $('#fast-chain').hide();
    }, false)
</script>
<!--{/if}-->