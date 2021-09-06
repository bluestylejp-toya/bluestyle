<!--{strip}-->
    <!--{if count($arrNewItems) > 0}-->
        <section class="l-section">
            <h2 class="c-heading--md">新着アイテム</h2>
            <ul class="p-item-detail__photo l-item-list">
            <!--{foreach from=$arrNewItems item=arrProduct name="new_items"}-->
                <li >
                    <span class="c-square"><img src="<!--{$smarty.const.IMAGE_SAVE_URLPATH}--><!--{$arrProduct.sub_large_image1|sfNoImageMainList|h}-->" alt="<!--{$arrProduct.name|h}-->" /></span>
                </li>
            <!--{/foreach}-->
        </ul>
    </div>
    <!--{/if}-->
<!--{/strip}-->
<script>
$('#new_item_area .favorite_area a').init_favorite_area(<!--{$smarty.const.TRANSACTION_ID_NAME|@json_encode}-->, <!--{$transactionid|@json_encode}-->);
</script>
