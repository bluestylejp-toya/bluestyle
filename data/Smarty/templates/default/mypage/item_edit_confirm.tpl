<div id="mypagecolumn">
    <h2 class="title"><!--{$tpl_title|h}--></h2>
    <!--{include file=$tpl_navi}-->
    <div id="mycontents_area">
        <h3><!--{$tpl_subtitle|h}--></h3>
        <p>下記の内容で送信してもよろしいでしょうか？<br />
            よろしければ、一番下の「完了ページへ」ボタンをクリックしてください。</p>

        <form name="form1" id="form1" method="post" action="?" enctype="multipart/form-data">
            <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
            <input type="hidden" name="mode" value="complete" />
            <!--{foreach key=key item=item from=$arrForm}-->
                <!--{if is_array($item.value)}-->
                    <input type="hidden" name="<!--{$key}-->" value="<!--{$item.value|@json_encode|h}-->" />
                <!--{else}-->
                    <input type="hidden" name="<!--{$key}-->" value="<!--{$item.value|h}-->" />
                <!--{/if}-->
            <!--{/foreach}-->
            <div id="products" class="contents-main">

                <table>
                    <tr>
                        <!--{assign var=key value="name"}-->
                        <th><!--{$arrForm[$key].disp_name|h}--></th>
                        <td>
                            <!--{$arrForm.name.value|h}-->
                        </td>
                    </tr>
                    <tr>
                        <!--{assign var=key value="category_id"}-->
                        <th><!--{$arrForm[$key].disp_name|h}--></th>
                        <td>
                            <!--{$arrCatList[$arrForm.category_id.value]|sfTrim}-->
                        </td>
                    </tr>
                    <tr>
                        <!--{assign var=key value="status"}-->
                        <th><!--{$arrForm[$key].disp_name|h}--></th>
                        <td>
                            <!--{$arrDISP[$arrForm.status.value]|h}-->
                        </td>
                    </tr>
                    <tr>
                        <!--{assign var=key value="product_status"}-->
                        <th><!--{$arrForm[$key].disp_name|h}--></th>
                        <td>
                            <!--{foreach from=$arrForm.product_status.value item=status}-->
                                <!--{$arrSTATUS[$status]|h}-->
                            <!--{/foreach}-->
                        </td>
                    </tr>
                    <tr>
                        <!--{assign var=key value="comment3"}-->
                        <th><!--{$arrForm[$key].disp_name|h}--></th>
                        <td>
                            <!--{$arrForm.comment3.value|h}-->
                        </td>
                    </tr>
                    <!--{section name=cnt loop=$smarty.const.PRODUCTSUB_MAX}-->
                        <tr>
                            <!--{assign var=key value="sub_large_image`$smarty.section.cnt.iteration`"}-->
                            <th><!--{$arrFile[$key].disp_name|h}--></th>
                            <td>
                                <!--{if $arrFile[$key].filepath != ""}-->
                                    <img src="<!--{$arrFile[$key].filepath}-->" alt="" /><br />
                                <!--{/if}-->
                            </td>
                        </tr>
                        <tr>
                            <!--{assign var=key value="sub_title`$smarty.section.cnt.iteration`"}-->
                            <th><!--{$arrForm[$key].disp_name|h}--></th>
                            <td>
                                <!--{$arrForm[$key].value|h}-->
                            </td>
                        </tr>
                    <!--{/section}-->
                </table>

                <div class="btn-area">
                    <ul>
                        <li><button onclick="eccube.setModeAndSubmit('confirm_return','',''); return false;">前のページに戻る</button></li>
                        <li><button onclick="document.form1.submit(); return false;">この内容で登録する</button></li>
                    </ul>
                </div>
            </div>
        </form>
    </div>
</div>
