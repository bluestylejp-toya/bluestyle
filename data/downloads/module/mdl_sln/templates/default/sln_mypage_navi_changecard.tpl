<!--{if $is_already_loaded != 1}-->
<script type="text/javascript">//<![CDATA[
$(function(){
    var li = $('<li/>').append($('<a/>').attr({'href': 'card_info.php', 'class': ''}).html('登録済カード情報編集'));
    $('div#mynavi_area li:last').after(li);
});
//]]></script>
<!--{/if}-->
<!--{assign var="is_already_loaded" value="1"}-->