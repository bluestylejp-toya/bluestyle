
■ 出品者情報<br />
プロフィール画像：
<!--{if strlen($arrSeller['profile_image']) >= 1}-->
<img src="<!--{$smarty.const.IMAGE_SAVE_URLPATH|h}-->../save_profile_image/<!--{$arrSeller['profile_image']|h}-->" class="c-profile-header__img">
<!--{else}-->
<img src="<!--{$smarty.const.IMAGE_SAVE_URLPATH|h}--><!--{$arrSeller['profile_image']|sfNoImageMainList|h}-->" class="c-profile-header__img">
<!--{/if}--><br />
ニックネーム:<!--{$arrSeller['nickname']}--><br />
紹介文:<!--{$arrSeller['self_introduction']}--><br />
趣味:<!--{$arrSeller['hobbies']}--><br />
都道府県:<!--{$arrPref[$arrSeller['pref']]}--><br />
<br />
■ 出品アイテム情報<br />
<!--{foreach from=$arrMyProducts key=key item=item}-->
アイテム<!--{$key+1}--><br />
<!--{$item['name']}--><br />
ほいし数：<!--{$item['count_of_favorite']}--><br />
<!--{if strlen($item['sub_large_image1']) >= 1}-->
<img src="<!--{$smarty.const.IMAGE_SAVE_URLPATH|h}-->/<!--{$item['sub_large_image1']|h}-->">
<!--{else}-->
<img src="<!--{$smarty.const.IMAGE_SAVE_URLPATH|h}-->/<!--{$item['sub_large_image1']|sfNoImageMainList|h}-->">
<!--{/if}--><br />

<br /><br />
<!--{/foreach}-->
