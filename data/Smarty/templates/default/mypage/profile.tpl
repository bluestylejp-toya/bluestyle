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
            <!--{foreach key=key item=item from=$arrHidden}-->
                <input type="hidden" name="<!--{$key|h}-->" value="<!--{$item|h}-->" />
            <!--{/foreach}-->
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
                    <!--{assign var=key1 value="profile_image"}-->
                    <th><!--{$arrFile[$key1].disp_name|h}--><!--{if $arrFile[$key1].require}--><!--{$require_mark}--><!--{/if}--><br />
                        [<!--{$smarty.const.LARGE_SUBIMAGE_WIDTH|h}-->×<!--{$smarty.const.LARGE_SUBIMAGE_HEIGHT|h}-->]</th>
                    <td>
                        <!--{if $arrErr[$key1]}-->
                            <div class="attention"><!--{$arrErr[$key1]}--></div>
                        <!--{/if}-->
                        <div class="preview" style="<!--{if strlen($arrFile[$key1].filepath) == 0}-->display: none;<!--{/if}-->">
                            <img src="<!--{$arrFile[$key1].filepath|h}-->" alt="" />　<a href="javascript:" class="delete_image">[画像の取り消し]</a>
                        </div>
                        <input type="file" name="<!--{$key1|h}-->" size="40" style="<!--{$arrErr[$key1]|sfGetErrorColor}-->"/>
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
                        <ul>
                            <!--{foreach from=$arrMyProducts item=arrProduct}-->
                                <li>
                                    <div><!--{$arrProduct.name|h}--></div>
                                    <div><a href="item_edit.php?mode=pre_edit&product_id=<!--{$arrProduct.product_id|u|h}-->">編集</a></div>
                                    <dl>
                                        <dt>「リクエスト（欲しい）」の数</dt>
                                        <dd><!--{$arrProduct.count_of_favorite|n2s|h}--></dd>
                                    </dl>
                                    <div>
                                        <!--{* メイン画像 *}-->
                                        <img src="<!--{$smarty.const.IMAGE_SAVE_URLPATH|h}--><!--{$arrProduct.sub_large_image1|sfNoImageMainList|h}-->" alt="<!--{$arrProduct.name|h}--> 画像(1)" />
                                        <!--{* サブ画像 *}-->
                                        <!--{section name=cnt loop=$smarty.const.PRODUCTSUB_MAX}-->
                                            <!--{assign var=key value="sub_large_image`$smarty.section.cnt.iteration`"}-->
                                            <!--{if strlen($arrProduct[$key]) >= 1}-->
                                                <img src="<!--{$smarty.const.IMAGE_SAVE_URLPATH|h}--><!--{$arrProduct[$key]|h}-->" alt="<!--{$arrProduct.name|h}--> 画像(<!--{$smarty.section.cnt.iteration+1|h}-->)" />
                                            <!--{/if}-->
                                        <!--{/section}-->
                                    </div>
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
<script type="text/javascript">
<!--{if $smarty.request.completeed}-->
    $(function(){
        alert('登録しました。');
    });
<!--{/if}-->

$(function(){
    $('input[type="file"]').on('change', function(){
        if (this.files.length != 1) {
            throw this;
        }
        let $closest = $(this).closest('td');
        let formData = new FormData($('#form1').get(0));
        formData.append('mode', 'upload_image_ajax');
        formData.append('image_key', this.name);

        $.ajax({
            type: 'POST',
            url: '?',
            data: formData,
            contentType: false,
            processData: false,
            dataType: 'json',
        })
            .done((data, textStatus, jqXHR) => {ajax_done(data, textStatus, jqXHR, $closest)})
            .fail(ajax_fail)
        ;

        $(this).val(null);
    });

    $('a.delete_image').on('click', function(){
        let $closest = $(this).closest('td');
        let image_key = $closest.find('input[type="file"]').attr('name');
        let formData = new FormData($('#form1').get(0));
        formData.append('mode', 'delete_image_ajax');
        formData.append('image_key', image_key);

        $.ajax({
            type: 'POST',
            url: '?',
            data: formData,
            contentType: false,
            processData: false,
            dataType: 'json',
        })
            .done((data, textStatus, jqXHR) => {ajax_done(data, textStatus, jqXHR, $closest)})
            .fail(ajax_fail)
        ;
    });

    function ajax_done(data, textStatus, jqXHR, $closest) {
        if ('error' in data) {
            alert(data.error);
            return;
        }
        $('#form1 input[type="hidden"][name^="temp_"]').remove();
        $('#form1 input[type="hidden"][name^="save_"]').remove();
        Object.keys(data.arrHidden).forEach((key) => {
            let $input = $('#form1 input[name="' + key + '"]');
            if ($input.length == 0) {
                $input = $('<input type="hidden">').attr('name', key);
                $('#form1').append($input);
            }
            $input.val(data.arrHidden[key]);
        });
        let $preview = $closest.find('.preview');
        if ('filepath' in data.arrFile && data.arrFile.filepath.length >= 1) {
            $preview.find('img').attr('src', data.arrFile.filepath);
            $preview.show();
        }
        else {
            $preview.find('img').attr('src', null);
            $preview.hide();
        }
    }

    function ajax_fail(jqXHR, textStatus, errorThrown) {
        alert('失敗しました。');
    }
});
</script>
