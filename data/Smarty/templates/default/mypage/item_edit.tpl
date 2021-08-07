<!--{strip}-->
    <!--{capture assign='require_mark'}--><span class="attention">※</span><!--{/capture}-->
    <div id="mypagecolumn">
        <h2 class="title"><!--{$tpl_title|h}--></h2>
        <!--{include file=$tpl_navi}-->
        <div id="mycontents_area">
            <h3><!--{$tpl_subtitle|h}--></h3>
            <p>下記項目にご入力ください。「<!--{$require_mark}-->」印は入力必須項目です。<br />
                入力後、一番下の「確認ページへ」ボタンをクリックしてください。</p>

            <form name="form1" id="form1" method="post" action="?" enctype="multipart/form-data">
                <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
                <input type="hidden" name="mode" value="edit" />
                <input type="hidden" name="image_key" value="" />
                <input type="hidden" name="product_id" value="<!--{$arrForm.product_id.value|h}-->" />
                <input type="hidden" name="product_class_id" value="<!--{$arrForm.product_class_id.value|h}-->" /><!--{* ★脆弱性懸念 *}-->
                <input type="hidden" name="anchor_key" value="" />
                <!--{foreach key=key item=item from=$arrHidden}-->
                    <input type="hidden" name="<!--{$key}-->" value="<!--{$item|h}-->" />
                <!--{/foreach}-->
                <div id="products" class="contents-main">
                    <table class="form">
                        <tr>
                            <!--{assign var=key value="name"}-->
                            <th><!--{$arrForm[$key].disp_name|h}--><!--{if $arrForm[$key].require}--><!--{$require_mark}--><!--{/if}--></th>
                            <td>
                                <span class="attention"><!--{$arrErr.name}--></span>
                                <input type="text" name="name" value="<!--{$arrForm.name.value|h}-->" maxlength="<!--{$smarty.const.STEXT_LEN}-->" style="<!--{if $arrErr.name != ""}-->background-color: <!--{$smarty.const.ERR_COLOR}-->;<!--{/if}-->" size="60" class="box60" />
                                <span class="attention"> (上限<!--{$smarty.const.STEXT_LEN}-->文字)</span>
                            </td>
                        </tr>
                        <tr>
                            <!--{assign var=key value="category_id"}-->
                            <th><!--{$arrForm[$key].disp_name|h}--><!--{if $arrForm[$key].require}--><!--{$require_mark}--><!--{/if}--></th>
                            <td>
                                <span class="attention"><!--{$arrErr.category_id}--></span>
                                <select name="category_id" id="category_id" style="<!--{if $arrErr.category_id != ""}-->background-color: <!--{$smarty.const.ERR_COLOR}-->;<!--{/if}-->">
                                    <option value="">選択してください</option>
                                    <!--{html_options values=$arrCatVal output=$arrCatOut selected=$arrForm.category_id.value}-->
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <!--{assign var=key value="status"}-->
                            <th><!--{$arrForm[$key].disp_name|h}--><!--{if $arrForm[$key].require}--><!--{$require_mark}--><!--{/if}--></th>
                            <td>
                                <!--{html_radios name="status" options=$arrDISP selected=$arrForm.status.value separator='&nbsp;&nbsp;'}-->
                            </td>
                        </tr>
                        <tr>
                            <!--{assign var=key value="product_status"}-->
                            <th><!--{$arrForm[$key].disp_name|h}--><!--{if $arrForm[$key].require}--><!--{$require_mark}--><!--{/if}--></th>
                            <td>
                                <!--{html_radios name="product_status" options=$arrSTATUS selected=$arrForm.product_status.value separator='&nbsp;&nbsp;'}-->
                            </td>
                        </tr>
                        <tr>
                            <!--{assign var=key value="comment3"}-->
                            <th><!--{$arrForm[$key].disp_name|h}--><!--{if $arrForm[$key].require}--><!--{$require_mark}--><!--{/if}--><br />※複数の場合は、カンマ( , )区切りで入力して下さい</th>
                            <td>
                                <span class="attention"><!--{$arrErr.comment3}--></span>
                                <textarea name="comment3" cols="60" rows="8" class="area60" maxlength="<!--{$smarty.const.LLTEXT_LEN}-->" style="<!--{$arrErr.comment3|sfGetErrorColor}-->"><!--{"\n"}--><!--{$arrForm.comment3.value|h}--></textarea><br />
                                <span class="attention"> (上限<!--{$smarty.const.LLTEXT_LEN}-->文字)</span>
                            </td>
                        </tr>
                        <tr>
                            <!--{assign var=key value="main_large_image"}-->
                            <th><!--{$arrFile[$key].disp_name|h}--><!--{if $arrForm[$key].require}--><!--{$require_mark}--><!--{/if}--><br />
                                [<!--{$smarty.const.LARGE_IMAGE_WIDTH}-->×<!--{$smarty.const.LARGE_IMAGE_HEIGHT}-->]</th>
                            <td>
                                <span class="attention"><!--{$arrErr[$key]}--></span>
                                <div class="preview" style="<!--{if strlen($arrFile[$key].filepath) == 0}-->display: none;<!--{/if}-->">
                                    <img src="<!--{$arrFile[$key].filepath}-->" alt="" />　<a href="" onclick="eccube.setModeAndSubmit('delete_image', 'image_key', '<!--{$key}-->'); return false;">[画像の取り消し]</a>
                                </div>
                                <input form='image_form' type="file" name="<!--{$key}-->" size="40" style="<!--{$arrErr[$key]|sfGetErrorColor}-->" />
                            </td>
                        </tr>
                        <!--{section name=cnt loop=$smarty.const.PRODUCTSUB_MAX}-->
                            <tr>
                                <!--{assign var=key value="sub_large_image`$smarty.section.cnt.iteration`"}-->
                                <th><!--{$arrFile[$key].disp_name|h}--><!--{if $arrForm[$key].require}--><!--{$require_mark}--><!--{/if}--><br />
                                    [<!--{$smarty.const.LARGE_SUBIMAGE_WIDTH}-->×<!--{$smarty.const.LARGE_SUBIMAGE_HEIGHT}-->]</th>
                                <td>
                                    <span class="attention"><!--{$arrErr[$key]}--></span>
                                    <div class="preview" style="<!--{if strlen($arrFile[$key].filepath) == 0}-->display: none;<!--{/if}-->">
                                        <img src="<!--{$arrFile[$key].filepath}-->" alt="" />　<a href="" onclick="eccube.setModeAndSubmit('delete_image', 'image_key', '<!--{$key}-->'); return false;">[画像の取り消し]</a>
                                    </div>
                                    <input form='image_form' type="file" name="<!--{$key}-->" size="40" style="<!--{$arrErr[$key]|sfGetErrorColor}-->"/>
                                </td>
                            </tr>
                        <!--{/section}-->
                    </table>

                    <div class="btn-area">
                        <button onclick="document.form1.submit(); return false;">確認ページへ</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <!--{* 画像は Ajax で送信する。form1 送信時に無駄に再送しないため、フォームを分ける。 *}-->
    <form id="image_form"></form>
<!--{/strip}-->

<script type="text/javascript">
<!--{if $smarty.request.completeed}-->
    $(function(){
        alert('登録しました。');
    });
<!--{/if}-->

$(function(){
    $('input[type=file]').on('change', function(){
        if (this.files.length != 1) {
            throw this;
        }
        var formData = new FormData();
        formData.append(<!--{$smarty.const.TRANSACTION_ID_NAME|@json_encode}-->, <!--{$transactionid|@json_encode}-->);
        formData.append('mode', 'upload_image_ajax');
        formData.append('image_key', this.name);
        formData.append(this.name, this.files[0]);

        $.ajax({
            type: 'POST',
            contentType: false,
            processData: false,
            url: '?',
            data: formData,
            dataType: 'json',
        })
            .done((data, textStatus, jqXHR) => {
                if ('error' in data) {
                    alert(data.error);
                    return;
                }
                Object.keys(data.arrHidden).forEach((key) => {
                    let $input = $('#form1 input[name="' + key + '"]');
                    if ($input.length == 0) {
                        $input = $('<input type="hidden">').attr('name', key);
                        $('#form1').append($input);
                    }
                    $input.val(data.arrHidden[key]);
                });
                let $preview = $(this).closest('td').find('.preview');
                $preview.find('img').attr('src', data.arrFile.filepath);
                $preview.show();
            })
        ;
    });
});
</script>
