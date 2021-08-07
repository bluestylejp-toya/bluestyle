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
                <!--{if $key == 'product_status'}-->
                    <!--{foreach item=statusVal from=$item}-->
                        <input type="hidden" name="<!--{$key}-->[]" value="<!--{$statusVal|h}-->" />
                    <!--{/foreach}-->
                <!--{elseif $key == 'arrCategoryId'}-->
                    <!--{* nop *}-->
                <!--{elseif $key == 'arrFile'}-->
                    <!--{* nop *}-->
                <!--{else}-->
                    <input type="hidden" name="<!--{$key}-->" value="<!--{$item|h}-->" />
                <!--{/if}-->
            <!--{/foreach}-->
            <div id="products" class="contents-main">

                <table>
                    <tr>
                        <th>商品名</th>
                        <td>
                            <!--{$arrForm.name|h}-->
                        </td>
                    </tr>
                    <tr>
                        <th>商品カテゴリ</th>
                        <td>
                            <!--{section name=cnt loop=$arrForm.arrCategoryId}-->
                                <!--{assign var=key value=$arrForm.arrCategoryId[cnt]}-->
                                <!--{$arrCatList[$key]|sfTrim}--><br />
                            <!--{/section}-->
                        </td>
                    </tr>
                    <tr>
                        <th>公開・非公開</th>
                        <td>
                            <!--{$arrDISP[$arrForm.status]|h}-->
                        </td>
                    </tr>
                    <tr>
                        <th>商品ステータス</th>
                        <td>
                            <!--{foreach from=$arrForm.product_status item=status}-->
                                <!--{$arrSTATUS[$status]|h}-->
                            <!--{/foreach}-->
                        </td>
                    </tr>

                    <tr>
                        <th>検索ワード</th>
                        <td>
                            <!--{$arrForm.comment3|h}-->
                        </td>
                    </tr>
                    <tr>
                        <th>詳細-メイン拡大画像</th>
                        <td>
                            <!--{assign var=key value="main_large_image"}-->
                            <!--{if $arrForm.arrFile[$key].filepath != ""}-->
                                <img src="<!--{$arrForm.arrFile[$key].filepath}-->" alt="<!--{$arrForm.name|h}-->" /><br />
                            <!--{/if}-->
                        </td>
                    </tr>
                    <!--{section name=cnt loop=$smarty.const.PRODUCTSUB_MAX}-->
                        <!--▼商品<!--{$smarty.section.cnt.iteration}-->-->
                        <tr>
                            <th>詳細-サブ拡大画像（<!--{$smarty.section.cnt.iteration}-->）</th>
                            <td>
                                <!--{assign var=key value="sub_large_image`$smarty.section.cnt.iteration`"}-->
                                <!--{if $arrForm.arrFile[$key].filepath != ""}-->
                                    <img src="<!--{$arrForm.arrFile[$key].filepath}-->" alt="<!--{$arrForm.name|h}-->" /><br />
                                <!--{/if}-->
                            </td>
                        </tr>
                        <!--▲商品<!--{$smarty.section.cnt.iteration}-->-->
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
