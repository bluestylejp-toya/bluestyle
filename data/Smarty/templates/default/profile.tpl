<!--{strip}-->
    <dl>
        <dt>ニックネーム</dt>
        <dd><!--{$arrCustomer.nickname|h}--></dd>
    </dl>
    <dl>
        <dt>紹介文</dt>
        <dd><!--{$arrCustomer.self_introduction|h|nl2br}--></dd>
    </dl>
    <!--{if strlen($arrCustomer.profile_image) >= 1}-->
        <dl>
            <dt>画像</dt>
            <dd><img src="<!--{$smarty.const.IMAGE_SAVE_URLPATH|h}-->../save_profile_image/<!--{$arrCustomer.profile_image|h}-->"></dd>
        </dl>
    <!--{/if}-->
    <dl>
        <dt>趣味</dt>
        <dd><!--{$arrCustomer.hobbies|h}--></dd>
    </dl>
    <dl>
        <dt>出品中アイテム</dt>
        <dd>
            <ul>
                <!--{foreach from=$arrCustomerProducts item=arrProduct}-->
                    <li>
                        <div>
                            <a href="<!--{$smarty.const.P_DETAIL_URLPATH|h}--><!--{$arrProduct.product_id|u|h}-->">
                                <!--{$arrProduct.name|h}-->
                            </a>
                        </div>
                        <dl>
                            <dt>「リクエスト（欲しい）」の数</dt>
                            <dd><!--{$arrProduct.count_of_favorite|n2s|h}--></dd>
                        </dl>
                        <div>
                            <img src="<!--{$smarty.const.IMAGE_SAVE_URLPATH|h}--><!--{$arrProduct.sub_large_image1|sfNoImageMainList|h}-->" alt="<!--{$arrProduct.name|h}--> 画像(1)" />
                        </div>
                        <dl>
                            <dt>在庫数</dt>
                            <dd><!--{$arrProduct.stock_min|n2s|h}--></dd>
                        </dl>
                    </li>
                <!--{/foreach}-->
            </ul>
        </dd>
    </dl>
    <dl>
        <dt>都道府県</dt>
        <dd><!--{$arrPref[$arrCustomer.pref]|h}--></dd>
    </dl>
    <dl>
        <dt>リクエストを押しているアイテム</dt>
        <dd>
            <ul>
                <!--{foreach from=$arrFavoriteProducts item=arrProduct}-->
                    <li>
                        <div>
                            <a href="<!--{$smarty.const.P_DETAIL_URLPATH|h}--><!--{$arrProduct.product_id|u|h}-->">
                                <!--{$arrProduct.name|h}-->
                            </a>
                        </div>
                        <dl>
                            <dt>「リクエスト（欲しい）」の数</dt>
                            <dd><!--{$arrProduct.count_of_favorite|n2s|h}--></dd>
                        </dl>
                        <div>
                            <img src="<!--{$smarty.const.IMAGE_SAVE_URLPATH|h}--><!--{$arrProduct.sub_large_image1|sfNoImageMainList|h}-->" alt="<!--{$arrProduct.name|h}--> 画像(1)" />
                        </div>
                    </li>
                <!--{/foreach}-->
            </ul>
        </dd>
    </dl>
    <div>
        <a href="<!--{$smarty.const.ROOT_URLPATH|h}-->mypage/profile.php">編集</a>
    </div>
<!--{/strip}-->
