<script type="text/javascript">//<![CDATA[
function slnPlgSlnquickCart(formName) {
    fnFormModeSubmit(formName, 'plg_slnquick', '', '');
}
//]]>
</script>
<div class="btn_area_btm">
    <input type="hidden" name="cartKey" value="<!--{$key}-->" />
    <input type="submit"
        onclick="slnPlgSlnquickCart('form<!--{$key}-->'); return false;"
        value="クイック決済で購入" name="confirm" class="btn data-role-none" />
</div>
