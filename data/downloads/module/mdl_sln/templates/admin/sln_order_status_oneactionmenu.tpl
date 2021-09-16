<script type="text/javascript">
<!--
function slnIsCheckboxSelected(targetform)
{
    var selected = 0;
    if (targetform["move[]"].length > 0) {
        for (var i = 0; i < targetform["move[]"].length; ++i) {
            if (targetform["move[]"][i].checked == true){
                selected = 1;
            }
        }
    } else {
        if (targetform["move[]"].checked == true) {
            selected = 1;
        }
    }

    return selected;
}

function slnSubmitSubMode(sln_sub_mode)
{
    if (slnIsCheckboxSelected(document.form1) == 0) {
        alert('チェックボックスが選択されていません');
        return false;
    }

    document.form1.mode.value = 'sln_sub_mode';
    document.form1.sln_sub_mode.value = sln_sub_mode;
    document.form1.submit();
}
//-->
</script>
<br />
<h2>ソニーペイメントサービス決済状況一括変更</h2>
<!--{if $tpl_linemax}-->
<div class="btn">
	<input type="hidden" name="sln_sub_mode" value="" />
	<a class="btn-normal" href="javascript:void(0);" onclick="slnSubmitSubMode('commit'); return false;">
	    <span>一括売上</span>
	</a>
	<a class="btn-normal" href="javascript:void(0);" onclick="slnSubmitSubMode('cancel'); return false;">
	    <span>一括取消</span>
	</a>
</div>
<!--{/if}-->

<!--{if $sln_msg}-->
<div>
  <span class="attention"><!--{$sln_msg}--></span>
</div>
<!--{/if}-->
