<section>
    <div id="mycontents_area">
        <form name="form1" id="form1" method="post" action="?">
            <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->"/>
            <input type="hidden" name="pageno" value="<!--{$tpl_pageno}-->"/>
            <input type="hidden" name="mode" value="complete"/>
            <input type="hidden" name="source_id" value="<!--{$source_id}-->">
            <h2 class="c-heading--sm">アイテム</h2>


            <!-- リクエストされる商品 -->
            <!--{$arrSourceProduct.name}-->
            <img src="<!--{$smarty.const.IMAGE_SAVE_URLPATH}--><!--{$arrSourceProduct.sub_large_image1|sfNoImageMainList|h}-->"
                 style="max-width: 65px;max-height: 65px;" alt="<!--{$arrSourceProduct.name|h}-->"
                 class="c-item__img"/>

            <br />
            <br />
            <br />

            <!-- 交換するアイテム一覧 -->
            <!--{if $tpl_linemax > 0}-->

            <!--{foreach from=$arrTargetProducts item=$arrProduct}-->
            <input type="radio" name="target_id" value="<!--{$arrProduct.product_id|h}-->">
            <label for="huey">
                <img src="<!--{$smarty.const.IMAGE_SAVE_URLPATH}--><!--{$arrProduct.sub_large_image1|sfNoImageMainList|h}-->"
                     style="max-width: 65px;max-height: 65px;" alt="<!--{$arrProduct.name|h}-->"
                     class="c-item__img"/>
                <p class="c-item__title"><!--{$arrProduct.name|h}--></p>
            </label>
            <!--{/foreach}-->

            <div class="favorite_area" name="aaa" value="send">送信</div>

    <!--▲ページナビ-->
    <!--{else}-->
    <p>アイテムが登録されておりません。</p>
    <!--{/if}-->
    </form>
    </div>
    </div>

    <script>

        $('.favorite_area').on('click', function(){
            if ($("input[name='target_id']:checked").val() === undefined){
                alert('交換対象商品を選択してください');
                return false;
            }
            let $this = $(this);
            init_favorite($this);
        })
        function init_favorite($this){
            let postData = {
                mode: "add_favorite_ajax",
                product_id: $("input[name='source_id']").val(),
                favorite_product_id:  $("input[name='source_id']").val(),
                target_id: $("input[name='target_id']:checked").val()
            };
            postData[<!--{$smarty.const.TRANSACTION_ID_NAME|@json_encode}-->] = <!--{$transactionid|@json_encode}-->;
            $.ajax({
                url: "/products/detail.php",
                method: "POST",
                data: postData,
                dataType: "json",
            }).done(function (data, textStatus, jqXHR) {
                let postData = {
                    mode: "api_add_favorite_ajax",
                    product_id: $("input[name='source_id']").val(),
                    favorite_product_id:  $("input[name='source_id']").val(),
                    target_id: $("input[name='target_id']:checked").val()
                };
                postData[<!--{$smarty.const.TRANSACTION_ID_NAME|@json_encode}-->] = <!--{$transactionid|@json_encode}-->;
                $.ajax({
                    url: "/products/detail.php",
                    method: "POST",
                    data: postData,
                    dataType: "json",
                }).done(function (data, textStatus, jqXHR) {
                    location.href = "/products/detail.php?product_id=" + $("input[name='source_id']").val() + '&mode=select_product_success'
                    return false;
                }).fail(function(jqXHR, textStatus, errorThrown){
                    // エラーの場合処理
                });
            }).fail(function(jqXHR, textStatus, errorThrown){
                // エラーの場合処理
            });
        }

    </script>
