<script type="text/javascript">
<!--
function fnSelectCheckSubmit(){
    var selectflag = 0;
    var fm = document.form1;

    if (fm.change_status.options[document.form1.change_status.selectedIndex].value == "") {
        selectflag = 1;
    }

    if (selectflag == 1) {
        alert('セレクトボックスが選択されていません');
        return false;
    }
    var i;
    var checkflag = 0;
    var checkflagNoSent = 0;
    var max = fm["move[]"].length;

    if (max) {
        for (i=0;i<max;i++){
            if(fm["move[]"][i].checked == true) {
                checkflag = 1;
            }
        }
    } else {
        if (fm["move[]"].checked == true) {
            checkflag = 1;
        }
    }

    if (fm.change_status.options[document.form1.change_status.selectedIndex].value == 5) {
    if (max) {
        for (i=0;i<max;i++){
        	if ((fm["move[]"][i].checked == true) && (fm["sln_paystatus[]"].item(i).value != "") && (fm["sln_paystatus[]"].item(i).value != "1") && (fm["sln_paystatus[]"].item(i).value != <!--{$smarty.const.SLN_PAY_STATUS_COMMIT}-->) && (fm["sln_paystatus[]"].item(i).value != <!--{$smarty.const.SLN_PAY_STATUS_CAPTURE}-->) && (fm["sln_paystatus[]"].item(i).value != <!--{$smarty.const.SLN_PAY_STATUS_PAY_SUCCESS}-->)) {
            	checkflagNoSent = 1;
            }
        }
    } else {
    	if ((fm["move[]"].checked == true) && (fm["sln_paystatus[]"].val != "")  && (fm["sln_paystatus[]"].val != "1") && (fm["sln_paystatus[]"].val != <!--{$smarty.const.SLN_PAY_STATUS_COMMIT}-->) && (fm["sln_paystatus[]"].val != <!--{$smarty.const.SLN_PAY_STATUS_CAPTURE}-->) && (fm["sln_paystatus[]"].val != <!--{$smarty.const.SLN_PAY_STATUS_PAY_SUCCESS}-->)) {
        	checkflagNoSent = 1;
        }
    }
	}

    if (checkflagNoSent == 1){
        alert('取引ステータスが実売上済み/即時売上済みでないと発送済みに変更できません');
        return false;
    }

    if (checkflag == 0){
        alert('チェックボックスが選択されていません');
        return false;
    }

    if (selectflag == 0 && checkflag == 1) {
        document.form1.mode.value = 'update';
        document.form1.submit();
    }
}
//-->
</script>