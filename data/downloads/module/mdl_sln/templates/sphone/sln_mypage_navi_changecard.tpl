<!--{if $is_already_loaded != 1}-->
<script type="text/javascript">//<![CDATA[
$(function(){
    var li = $('<li/>').attr({'class': 'nav_delivadd'}).append($('<a/>').attr({'href': 'card_info.php', 'class': 'ui-link'}).html('登録済カード情報編集'));
    $('nav#mypage_nav li:last').after(li);
});
//]]></script>
<!--{/if}-->
<!--{assign var="is_already_loaded" value="1"}-->