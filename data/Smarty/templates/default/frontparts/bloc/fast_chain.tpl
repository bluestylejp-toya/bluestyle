<!--{if count($arrFastChainProduct) > 0}-->
    <!--{assign var=list value="`$smarty.const.ROOT_URLPATH`products/list.php"}-->
        <!--{if $smarty.server.PHP_SELF==$list}-->
            <div class="c-item-tab__content" data-tab_item="1">
        <!--{/if}-->
        <ul class="c-list-item__main_ul">
            <!--{section name=cnt loop=$arrFastChainProduct}-->
            <!--{if $arrFastChainProduct[cnt].product_id > 0}-->
                <li>
                    <a href="<!--{$smarty.const.P_DETAIL_URLPATH}--><!--{$arrFastChainProduct[cnt].product_id|u}-->" class="c-list-item">
                        <figure class="c-list-item__img">
                            <img src="<!--{$smarty.const.IMAGE_SAVE_URLPATH}--><!--{$arrFastChainProduct[cnt].sub_large_image1|sfNoImageMainList|h}-->"  alt="<!--{$arrFastChainProduct[cnt].name|h}-->の写真"" decoding="async" loading="lazy" />
                        </figure>
                        <div class="c-list-item__main">
                            <h3 class="c-list-item__title"><!--{$arrFastChainProduct[cnt].name|mb_substr:0:16|h|nl2br}--><!--{if $arrProduct.name|mb_strlen > 16}-->...<!--{/if}--></h3>
                            <span class="c-list-item__request<!--{if $arrFastChainProduct[cnt].registered_favorite}--> --active<!--{/if}-->" data-product_id="<!--{$arrFastChainProduct[cnt].product_id|h}-->"><svg class="icon" width="24px" height="24px" viewBox="0 0 500 500">
						<path class="heart" d="M250,187.4c-31.8-47.8-95.5-19.8-95.5,32.2c0,35.2,31.8,60.3,55.7,79.2c24.9,19.7,31.8,23.9,39.8,31.8 c7.9-7.9,14.6-12.6,39.8-31.8c24.3-18.5,55.7-44.4,55.7-79.6C345.5,167.6,281.8,139.7,250,187.4z" fill="<!--{if $arrFastChainProduct[cnt].registered_favorite}-->#ffffff<!--{else}-->#72c8e2<!--{/if}-->"></path></svg><!--{$arrFastChainProduct[cnt].count_of_favorite|h}--></span>
                            <!--{* 以下にアイテム説明が入ります*}-->
                            <p class="c-list-item__description"><!--{if $arrFastChainProduct[cnt].sub_title1}--><!--{$arrFastChainProduct[cnt].sub_title1|mb_substr:0:40|h|nl2br}--><!--{if $arrFastChainProduct[cnt].sub_title1|mb_strlen > 16}-->...<!--{/if}--><!--{/if}--></p>
                            <!--{* 以下に出品者情報が入ります*}-->
                        </div>
                    </a>
                        <div  class="c-list-item__seller">
                            出品者:<a href="<!--{$smarty.const.TOP_URL}-->shopping/seller.php?seller_id=<!--{$arrFastChainProduct[cnt].customer_id|h}-->"> <!--{$arrFastChainProduct[cnt].nickname|h}--></a>
                        </div>
                        <!--{$arrFastChainProduct[cnt].sub_comment1|h}-->
                </li>
            <!--{/if}-->
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