<ul>
<!--{if $arrForm.button_type == "slnquick" }-->
<li><a href="<!--{$smarty.const.CART_URLPATH}-->"
	onmouseover="chgImg('<!--{$TPL_URLPATH}-->img/button/btn_back_on.jpg', 'back04-top')"
	onmouseout="chgImg('<!--{$TPL_URLPATH}-->img/button/btn_back.jpg', 'back04-top')">
		<img src="<!--{$TPL_URLPATH}-->img/button/btn_back_on.jpg" alt="戻る"
		border="0" name="back04-top" id="back04-top">
</a>
</li>
<li><input type="image" onclick="return slnCheckSubmit();"
	onmouseover="chgImgImageSubmit('<!--{$smarty.const.ROOT_URLPATH}-->plugin/SLNCore/btn_bloc_buy_on.jpg',this)"
	onmouseout="chgImgImageSubmit('<!--{$smarty.const.ROOT_URLPATH}-->plugin/SLNCore/btn_bloc_buy.jpg',this)"
	src="<!--{$smarty.const.ROOT_URLPATH}-->plugin/SLNCore/btn_bloc_buy.jpg"
	alt="購入" border="0" name="next-top" id="next-top" />
</li>
<!--{else}-->
<li><a href="./payment.php"
	onmouseover="chgImg('<!--{$TPL_URLPATH}-->img/button/btn_back_on.jpg', 'back04-top')"
	onmouseout="chgImg('<!--{$TPL_URLPATH}-->img/button/btn_back.jpg', 'back04-top')">
		<img src="<!--{$TPL_URLPATH}-->img/button/btn_back_on.jpg" alt="戻る"
		border="0" name="back04-top" id="back04-top">
</a>
</li>
<li><input type="image" onclick="return slnCheckSubmit();"
	onmouseover="chgImgImageSubmit('<!--{$TPL_URLPATH}-->img/button/btn_next_on.jpg',this)"
	onmouseout="chgImgImageSubmit('<!--{$TPL_URLPATH}-->img/button/btn_next.jpg',this)"
	src="<!--{$TPL_URLPATH}-->img/button/btn_next_on.jpg" alt="次へ"
	border="0" name="next-top" id="next-top" />
</li>
<!--{/if}-->
</ul>