<section>
    <div class="l-header__inner u-mb--4">
        <button type="button" aria-label="戻る" onclick="history.back();" class="c-btn--header-nav"></button>
        <p class="c-header-title">出品者情報</p>
    </div>
	<div class="c-profile-img u-mb--4">
		<figure class="c-profile-img__inner">
			<!--{if strlen($arrSeller['profile_image']) >= 1}-->
			<img src="<!--{$smarty.const.IMAGE_SAVE_URLPATH|h}-->../save_profile_image/<!--{$arrSeller['profile_image']|h}-->" class="c-profile-header__img">
			<!--{else}-->
			<img src="<!--{$smarty.const.IMAGE_SAVE_URLPATH|h}--><!--{$arrSeller['profile_image']|sfNoImageMainList|h}-->" class="c-profile-header__img">
			<!--{/if}-->
		</figure>
	</div>
	 <dl class="u-mb--4 c-list--dl">
		<!--{assign var=key1 value="nickname"}-->
		<dt>ニックネーム</dt>
		<dd><!--{$arrSeller['nickname']}--></dd>
		<dt>紹介文</dt>
		<dd><!--{$arrSeller['self_introduction']}--></dd>
		<dt>趣味</dt>
		<dd><!--{$arrSeller['hobbies']}--></dd>
		<dt>都道府県</dt>
		<dd><!--{$arrPref[$arrSeller['pref']]}--></dd>
	</dl>
	<h2 class="c-heading--lg">出品アイテム(<!--{$arrMyProducts|@count}-->)</h2>
	<ul>
		<!--{foreach from=$arrMyProducts key=key item=item}-->
		<li>
			<a href="<!--{$smarty.const.TOP_URL}-->products/detail.php?product_id=<!--{$item['product_id']|u}-->"  class="c-list-item">
				<figure class="c-list-item__img">
					<!--{if strlen($item['sub_large_image1']) >= 1}-->
					<img src="<!--{$smarty.const.IMAGE_SAVE_URLPATH|h}-->/<!--{$item['sub_large_image1']|h}-->">
					<!--{else}-->
					<img src="<!--{$smarty.const.IMAGE_SAVE_URLPATH|h}-->/<!--{$item['sub_large_image1']|sfNoImageMainList|h}-->">
					<!--{/if}-->
					<!--{if $arrProduct.customer_id == $customer_id}-->
						<figcaption class="c-list-item__my-item">出品中</figcaption>
					<!--{/if}-->
				</figure>
				<div class="c-list-item__main">
					<h3 class="c-list-item__title"><span data-product_id="<!--{$arrProduct.product_id|h}-->" class="c-list-item__id"><!--{$item['product_id']|u}--></span><!--{$arrProduct.product_id|u}--><!--{$item['name']|mb_substr:0:16|h|nl2br}--><!--{if $item['name']|mb_strlen > 16}-->...<!--{/if}--></h3>
					<span class="c-list-item__request"><svg class="icon" width="24px" height="24px" viewBox="0 0 500 500">
					<path class="heart" d="M250,187.4c-31.8-47.8-95.5-19.8-95.5,32.2c0,35.2,31.8,60.3,55.7,79.2c24.9,19.7,31.8,23.9,39.8,31.8 c7.9-7.9,14.6-12.6,39.8-31.8c24.3-18.5,55.7-44.4,55.7-79.6C345.5,167.6,281.8,139.7,250,187.4z" fill="<!--{if $arrProduct.registered_favorite}-->#ffffff<!--{else}-->#72c8e2<!--{/if}-->"></path></svg><!--{$item['count_of_favorite']}--></span>
					<!--{* 以下にアイテム説明が入ります*}-->
					<p class="c-list-item__description"><!--{if $item['sub_title1']}--><!--{$item['sub_title1']|mb_substr:0:40|h|nl2br}--><!--{if $item['sub_title1']|mb_strlen > 40}-->...<!--{/if}--><!--{/if}--></p>
				</div>
			</a>
		</li>
		<!--{/foreach}-->
		<!--▲商品-->
	</ul>
</section>
