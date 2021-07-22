<div id="mypagecolumn">
    <h2 class="title"><!--{$tpl_title|h}--></h2>
    <!--{include file=$tpl_navi}-->
    <div id="mycontents_area">
        <h3><!--{$tpl_subtitle|h}--></h3>
        <p>下記の内容で送信してもよろしいでしょうか？<br />
            よろしければ、一番下の「完了ページへ」ボタンをクリックしてください。</p>

        <form name="form1" id="form1" method="post" action="?">
            <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
            <input type="hidden" name="mode" value="complete" />
            <!--{foreach from=$arrForm key=key item=item}-->
                <!--{if $key ne "mode" && $key ne "subm"}-->
                <input type="hidden" name="<!--{$key|h}-->" value="<!--{$item.value|h}-->" />
                <!--{/if}-->
            <!--{/foreach}-->
            <table summary=" " class="delivname">
                <col width="30%" />
                <col width="70%" />
                <tr>
                    <!--{assign var=key1 value="nickname"}-->
                    <th><!--{$arrForm[$key1].disp_name|h}--></th>
                    <td><!--{$arrForm[$key1].value|h}--></td>
                </tr>
                <tr>
                    <!--{assign var=key1 value="self_introduction"}-->
                    <th><!--{$arrForm[$key1].disp_name|h}--></th>
                    <td><!--{$arrForm[$key1].value|h|nl2br}--></td>
                </tr>
                <tr>
                    <!--{assign var=key1 value="hobbies"}-->
                    <th><!--{$arrForm[$key1].disp_name|h}--></th>
                    <td><!--{$arrForm[$key1].value|h}--></td>
                </tr>
                <tr>
                    <th>都道府県</th>
                    <td><!--{$arrPref[$tpl_pref_id]|h}--></td>
                </tr>
            </table>

            <div class="btn_area">
                <ul>
                    <li>
                        <a href="?" onclick="eccube.setModeAndSubmit('return', '', ''); return false;">
                            <img class="hover_change_image" src="<!--{$TPL_URLPATH}-->img/button/btn_back.jpg" alt="戻る" /></a>
                    </li>
                    <li>
                        <input type="image" class="hover_change_image" src="<!--{$TPL_URLPATH}-->img/button/btn_complete.jpg" alt="送信" name="complete" id="complete" />
                    </li>
                </ul>
            </div>
        </form>
    </div>
</div>
