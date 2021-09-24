<!--{*
 **
 * 定期プラグイン の配送先選択画面　PCテンプレート
 *
 * @package ソニーペイメントサービス 定期購入プラグイン
 * @author Sony Payment Services Inc.
 * @version 1.0.0
 *
 *}-->

<div class="btn_area"><ul><li>
<!--{if $tpl_prev_url != ""}--> <a href="<!--{$tpl_prev_url|h}-->"
onmouseover="chgImg('<!--{$TPL_URLPATH}-->img/button/btn_back_on.jpg','back<!--{$key}-->');"
onmouseout="chgImg('<!--{$TPL_URLPATH}-->img/button/btn_back.jpg','back<!--{$key}-->');">
<img src="<!--{$TPL_URLPATH}-->img/button/btn_back.jpg" alt="戻る"
name="back<!--{$key}-->" />
</a> <!--{/if}-->
</li><li>
<!--{if strlen($tpl_error) == 0}--> <input type="hidden"
name="cartKey" value="<!--{$key}-->" /> <input type="image"
onmouseover="chgImgImageSubmit('<!--{$TPL_URLPATH}-->img/button/btn_buystep_on.jpg',this)"
onmouseout="chgImgImageSubmit('<!--{$TPL_URLPATH}-->img/button/btn_buystep.jpg',this)"
src="<!--{$TPL_URLPATH}-->img/button/btn_buystep.jpg" alt="購入手続きへ"
name="confirm" /> <!--{/if}-->
</li><!--{if !$SLNTerm_has_terminal_cart_item}-->
<li><a href="javascript:void(fnFormModeSubmit('form<!--{$key|h}-->', 'plg_slnquick', '', ''));"
onmouseover="chgImg('<!--{$smarty.const.ROOT_URLPATH}-->plugin/SLNCore/btn_quick_on.png','plg_slnquick')" onmouseout="chgImg('<!--{$smarty.const.ROOT_URLPATH}-->plugin/SLNCore/btn_quick.png','plg_slnquick')">
<img src="<!--{$smarty.const.ROOT_URLPATH}-->plugin/SLNCore/btn_quick.png" name="plg_slnquick" alt="クイック決済" />
</a></li><!--{/if}--></ul></div>
