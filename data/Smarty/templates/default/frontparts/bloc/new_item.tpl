<!--{strip}-->
    <!--{if count($arrNewItems) > 0}-->
        <div class="block_outer clearfix">
            <div id="new_item_area">
                <h2><!--{$blocItems.bloc_name|H}--></h2>
                <ul class="l-item-list">
                    <!--{foreach from=$arrNewItems item=arrProduct name="new_items"}-->
                        <div class="product_item clearfix">
                            <div class="productImage">
                                <img src="<!--{$smarty.const.IMAGE_SAVE_URLPATH}--><!--{$arrProduct.sub_large_image1|sfNoImageMainList|h}-->" style="max-width: 80px;max-height: 80px;" alt="<!--{$arrProduct.name|h}-->" />
                            </div>
                            <div class="productContents">
                                <h3>
                                    <a href="<!--{$smarty.const.P_DETAIL_URLPATH}--><!--{$arrProduct.product_id|u}-->"><!--{$arrProduct.name|h}--></a>
                                </h3>
                                <p class="sale_price">
                                    <!--{$smarty.const.SALE_PRICE_TITLE}-->(税込)： <span class="price"><!--{$arrProduct.price02_min_inctax|n2s}--> 円</span>
                                </p>
                                <p class="mini comment"><!--{$arrProduct.comment|h|nl2br}--></p>
                                <dl class="stock">
                                    <dt>在庫数</dt>
                                    <dd><!--{$arrProduct.stock_max|h}--></dd>
                                </dl>
                                <dl class="pref">
                                    <dt>出品者都道府県</dt>
                                    <dd><!--{$arrPref[$arrProduct.pref]|h}--></dd>
                                </dl>
                                <div class="favorite_area <!--{if $arrProduct.registered_favorite}-->registered_favorite<!--{/if}-->">
                                    <!--{if $smarty.const.OPTION_FAVORITE_PRODUCT == 1 && $tpl_login === true}-->
                                        <!--{* お気に入り登録・解除 *}-->
                                        <div class="for_registered">
                                            <a href="javascript:" data-product_id="<!--{$arrProduct.product_id|h}-->">
                                                お気に入り解除する</a>
                                        </div>
                                        <div class="for_unregistered">
                                            <a href="javascript:" data-product_id="<!--{$arrProduct.product_id|h}-->">
                                                お気に入り登録する</a>
                                        </div>
                                    <!--{/if}-->
                                    <dl class="count_of_favorite">
                                        <dt>お気に入りを押されている数</dt>
                                        <dd><span class="num"><!--{$arrProduct.count_of_favorite|h}--></span> 件</dd>
                                    </dl>
                                </div>
                            </div>
                        </div>
                    <!--{/foreach}-->
                </div>
            </div>
        </div>
    <!--{/if}-->
<!--{/strip}-->
<script>
$('#new_item_area .favorite_area a').init_favorite_area(<!--{$smarty.const.TRANSACTION_ID_NAME|@json_encode}-->, <!--{$transactionid|@json_encode}-->);
</script>
