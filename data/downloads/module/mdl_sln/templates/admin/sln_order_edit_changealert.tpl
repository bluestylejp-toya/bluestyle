<!--{if ($sln_payid == SLN_PAYID_CREDIT || $sln_payid == SLN_PAYID_REGIST_CREDIT || $sln_payid == SLN_PAYID_CVS) && $arrForm.status.value != $smarty.const.ORDER_PENDING }-->

<script type="text/javascript">//<![CDATA[
$(function() {
    var select_payment_id = $('select[name="payment_id"]').val();
    $('select[name=payment_id]').attr('onchange','');
    $('select[name=payment_id]').unbind();
    $('select[name=payment_id]').change(function() {
        $('select[name=payment_id]').val(select_payment_id);
        alert('お支払い方法の変更は行わないで下さい。');
    });
});

$(function() {
	var select_status_id = $('select[name="status"]').val();
    $('select[name=status]').attr('onchange','');
    $('select[name=status]').unbind();
    $('select[name=status]').change(function() {
    	var change_status_id = $('select[name="status"]').val();
    	var sln_pay_status = $(':hidden[name="sln_pay_status"]').val();
    	if ((change_status_id == 5) && (sln_pay_status != <!--{$smarty.const.SLN_PAY_STATUS_COMMIT}-->) && (sln_pay_status != <!--{$smarty.const.SLN_PAY_STATUS_CAPTURE}-->) && (sln_pay_status != <!--{$smarty.const.SLN_PAY_STATUS_PAY_SUCCESS}-->)) {
            $('select[name=status]').val(select_status_id);
            alert('取引ステータスが実売上済み/即時売上済みでないと発送済みに変更できません');
    	}
    });
});
//]]>
</script>

<!--{/if}-->