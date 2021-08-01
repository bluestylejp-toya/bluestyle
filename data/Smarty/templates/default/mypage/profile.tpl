<!--{capture assign='require_mark'}--><span class="attention">※</span><!--{/capture}-->
<div id="mypagecolumn">
    <h2 class="title"><!--{$tpl_title|h}--></h2>
    <!--{include file=$tpl_navi}-->
    <div id="mycontents_area">
        <h3><!--{$tpl_subtitle|h}--></h3>
        <p>下記項目にご入力ください。「<!--{$require_mark}-->」印は入力必須項目です。<br />
            入力後、一番下の「確認ページへ」ボタンをクリックしてください。</p>

        <form name="form1" id="form1" method="post" action="?">
            <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
            <input type="hidden" name="mode" value="confirm" />
            <input type="hidden" name="customer_id" value="<!--{$arrForm.customer_id.value|h}-->" />
            <table summary="プロフィール編集 " class="delivname">
                <col width="30%" />
                <col width="70%" />
                <tr>
                    <!--{assign var=key1 value="nickname"}-->
                    <th><!--{$arrForm[$key1].disp_name|h}--><!--{if $arrForm[$key1].require}--><!--{$require_mark}--><!--{/if}--></th>
                    <td>
                        <!--{if $arrErr[$key1]}-->
                            <div class="attention"><!--{$arrErr[$key1]}--></div>
                        <!--{/if}-->
                        <input type="text" name="<!--{$key1|h}-->" value="<!--{$arrForm[$key1].value|h}-->" maxlength="<!--{$arrForm[$key1].length}-->" style="<!--{$arrErr[$key1]|sfGetErrorColor}-->; ime-mode: active;" class="box120" />
                    </td>
                </tr>
                <tr>
                    <!--{assign var=key1 value="self_introduction"}-->
                    <th><!--{$arrForm[$key1].disp_name|h}--><!--{if $arrForm[$key1].require}--><!--{$require_mark}--><!--{/if}--></th>
                    <td>
                        <!--{if $arrErr[$key1]}-->
                            <div class="attention"><!--{$arrErr[$key1]}--></div>
                        <!--{/if}-->
                        <textarea name="<!--{$key1|h}-->" style="<!--{$arrErr[$key1]|sfGetErrorColor}-->" cols="70" rows="8" class="txtarea" wrap="hard"><!--{"\n"}--><!--{$arrForm[$key1].value|h}--></textarea>
                        <p class="attention"> (<!--{$arrForm[$key1].length}-->文字まで)</p>
                    </td>
                </tr>
                <tr>
                    <!--{assign var=key1 value="hobbies"}-->
                    <th><!--{$arrForm[$key1].disp_name|h}--><!--{if $arrForm[$key1].require}--><!--{$require_mark}--><!--{/if}--></th>
                    <td>
                        <!--{if $arrErr[$key1]}-->
                            <div class="attention"><!--{$arrErr[$key1]}--></div>
                        <!--{/if}-->
                        <input type="text" name="<!--{$key1|h}-->" value="<!--{$arrForm[$key1].value|h}-->" maxlength="<!--{$arrForm[$key1].length}-->" style="<!--{$arrErr[$key1]|sfGetErrorColor}-->; ime-mode: active;" class="box300" />
                    </td>
                </tr>
                <tr>
                    <th>出品中アイテム</th>
                    <td>
                        <ui>
                            <!--{foreach from=$arrMyProducts item=arrProduct}-->
                                <li>
                                    <ul>
                                        <li><!--{$arrProduct.name|h}--></li>
                                    </ul>
                                </li>
                            <!--{/foreach}-->
                        </ul>
                    </td>
                </tr>
                <tr>
                    <th>都道府県</th>
                    <td><!--{$arrPref[$tpl_pref_id]|h}--></td>
                </tr>
            </table>
            <div class="btn_area">
                <ul>
                    <li>
                        <input type="image" class="hover_change_image" src="<!--{$TPL_URLPATH}-->img/button/btn_confirm.jpg" alt="確認ページへ" name="refusal" id="refusal" />
                    </li>
                </ul>
            </div>
        </form>
    </div>
</div>
<!--{if $smarty.request.completeed}-->
    <script>
    $(function(){
        alert('登録しました。');
    });
    </script>
<!--{/if}-->
