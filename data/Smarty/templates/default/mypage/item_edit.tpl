<!--{strip}-->
    <section>
        <!--{capture assign='require_mark'}--><span class="attention">※</span><!--{/capture}-->
            <header class="l-header__inner<!--{if $arrForm.status.value == 2}--> u-mb--0<!--{/if}-->">
                <a href="<!--{$smarty.const.TOP_URL}-->mypage/item-list.php" aria-label="戻る" class="c-btn--header-nav"></a>
                <p class="c-header-title">アイテム編集</p>
            </header>
        <!--{assign var=key value="status"}-->
        <!--{if $arrForm.status.value == 2}-->
            <p class="c-message--alert">このアイテムは公開されていません</p>
        <!--{/if}-->


        <form name="form1" id="form1" method="post" action="?" enctype="multipart/form-data">
            <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME|h}-->" value="<!--{$transactionid|h}-->" />
            <input type="hidden" name="mode" value="edit" />
            <input type="hidden" name="image_key" value="" />
            <input type="hidden" name="product_id" value="<!--{$arrForm.product_id.value|h}-->" />
            <input type="hidden" name="product_class_id" value="<!--{$arrForm.product_class_id.value|h}-->" /><!--{* ★脆弱性懸念 *}-->
            <!--{foreach key=key item=item from=$arrHidden}-->
                <input type="hidden" name="<!--{$key|h}-->" value="<!--{$item|h}-->" />
            <!--{/foreach}-->
            <dl class="u-mb--4 c-list--dl">

                <!--{assign var=key value="name"}-->
                <dt>アイテム名<!--{if $arrForm[$key].require}--><span class="attention">※必須</span><!--{/if}--></dt>
                <dd>
                    <input type="text" name="name" value="<!--{$arrForm.name.value|h}-->" maxlength="<!--{$arrForm[$key].length|h}-->" style="<!--{if $arrErr.name != ""}-->background-color: <!--{$smarty.const.ERR_COLOR}-->;<!--{/if}-->" size="60" class="c-form-parts --underline" />
                    <span class="attention"> (上限<!--{$arrForm[$key].length|n2s|h}-->文字)</span>
                    <span class="attention"><!--{$arrErr.name}--></span>
                </dd>


                <!--{assign var=key value="category_id"}-->
                <dt><!--{$arrForm[$key].disp_name|h}--><!--{if $arrForm[$key].require}--><span class="attention">※必須</span><!--{/if}--></dt>
                <dd>
                    <span class="attention"><!--{$arrErr.category_id}--></span>
                    <select name="category_id" id="category_id" style="<!--{if $arrErr.category_id != ""}-->background-color: <!--{$smarty.const.ERR_COLOR}-->;<!--{/if}-->" class="c-form-parts--select --underline">
                        <option value="">選択してください</option>
                        <!--{html_options values=$arrCatVal output=$arrCatOut selected=$arrForm.category_id.value}-->
                    </select>
                </dd>


                <!--{assign var=key value="status"}-->
                <dt class="c-list--dl__left">公開状態</dt>
                <dd class="c-list--dl__right">
                    <input type="checkbox" class="c-form-parts--toggle-btn__hidden" id="status"<!--{if $arrForm.status.value == 1}--> checked<!--{/if}-->>
                    <label for="status" class="c-form-parts--toggle-btn"></label>
                    <input type="hidden" value="<!--{$arrForm.status.value}-->" name="status">
                </dd>


                <!--{assign var=key value="product_status"}-->
                <dt><!--{$arrForm[$key].disp_name|h}--><!--{if $arrForm[$key].require}--><span class="attention">※必須</span><!--{/if}--></dt>
                <dd>
                    <div  class="c-form-parts--select --underline" ><!--{html_options name="product_status" options=$arrSTATUS selected=$arrForm.product_status.value}--></div>
                </dd>


                <!--{assign var=key value="comment3"}-->
                <!--<dt><!--{$arrForm[$key].disp_name|h}--><!--{if $arrForm[$key].require}--><!--{$require_mark}--><!--{/if}--><br />※複数の場合は、カンマ( , )区切りで入力して下さい</dt>
                <dd>
                    <span class="attention"><!--{$arrErr.comment3}--></span>
                    <textarea name="comment3" cols="60" rows="8" class="area60" maxlength="<!--{$arrForm[$key].length|h}-->" style="<!--{$arrErr.comment3|sfGetErrorColor}-->"><!--{"\n"}--><!--{$arrForm.comment3.value|h}--></textarea><br />
                    <span class="attention"> (上限<!--{$arrForm[$key].length|n2s|h}-->文字)</span>
                </dd>-->
            </dl>
            <h2 class="c-heading-subtitle u-text--left u-color--gray">詳細写真とキャプション</h2>

            <ul class="u-mb--4">
                <!--{section name=cnt loop=$smarty.const.PRODUCTSUB_MAX}-->

                    <!--{assign var=key value="sub_large_image`$smarty.section.cnt.iteration`"}-->
                    <li id="item<!--{$smarty.section.cnt.iteration}-->" class="c-item--edit<!--{if $smarty.section.cnt.iteration > 3 && $arrFile[$key].filepath == ''}--> --hidden<!--{/if}-->">
                        <button class="c-item__back-btn" type="button">詳細写真編集</button>
                        <button class="c-item__sort-btn" type="button"></button>
                        <label class="preview">
                            <img src="<!--{$arrFile[$key].filepath|h}-->" alt="" class="c-item__img"/>
                            <span class="icon"><svg width="13" height="13" viewBox="0 0 13 13" fill="none" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M10.8307 0.236328C11.5641 0.236328 12.1641 0.836328 12.1641 1.56966V10.903C12.1641 11.6363 11.5641 12.2363 10.8307 12.2363H1.4974C0.764063 12.2363 0.164062 11.6363 0.164062 10.903V1.56966C0.164062 0.836328 0.764063 0.236328 1.4974 0.236328H10.8307ZM5.4974 9.243L3.83073 7.23633L1.4974 10.2363H10.8307L7.83073 6.23633L5.4974 9.243Z" fill="#475462"/></svg></span>
                            <input type="hidden" name="<!--{$key|h}-->">

                            <span class="c-item__img<!--{if $arrFile[$key].filepath }--> --hidden<!--{/if}-->">
                                <span><!--{if $smarty.section.cnt.iteration == 1}-->カバー<!--{/if}-->画像追加</span>
                            </span>

                            <input type="file" name="<!--{$key|h}-->" size="40" style="<!--{$arrErr[$key]|sfGetErrorColor}-->" disabled/>
                        </label>
                        <a href="javascript:" class="delete_image c-item__delete-btn">[画像の取り消し]</a>
                        <div class="c-item__main">
                            <!--{assign var=key value="sub_title`$smarty.section.cnt.iteration`"}-->
                            <h2 class="c-heading-subtitle u-text--left u-color--gray">キャプション</h2>
                            <input type="text" name="<!--{$key|h}-->" value="<!--{$arrForm[$key].value|h}-->" maxlength="<!--{$arrForm[$key].length|h}-->" style="<!--{$arrErr[$key]|sfGetErrorColor}-->" readonly/>
                        </div>
                        <!--{assign var=key1 value="sub_large_image`$smarty.section.cnt.iteration`"}-->
                        <!--{assign var=key2 value="sub_title`$smarty.section.cnt.iteration`"}-->
                        <button class="c-item__edit-btn" type="button" data-id="<!--{$smarty.section.cnt.iteration}-->"></button>
                    </li>
                <!--{/section}-->
            </ul>
            <button class="c-btn--default u-mb--4 c-item__add-image-btn" type="button"><svg width="15" height="14" viewBox="0 0 15 14" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M14.1279 8H8.12793V14H6.12793V8H0.12793V6H6.12793V0H8.12793V6H14.1279V8Z" fill="black"/></svg>写真を追加</button>

            <button onclick="document.form1.submit(); return false;" class="c-btn--primary">確認ページへ</button>
        </form>
    </section>
<!--{/strip}-->
<script type="text/javascript">
<!--{if $smarty.request.completeed}-->
    $(function(){
        alert('登録しました。');
    });
<!--{/if}-->
$('.c-form-parts--toggle-btn__hidden').on('change', function(){
    $('[name=status]').val($('[name=status]').val() == 1 ? 2 :1)
})
$('.c-item__add-image-btn').on('click', function(){
    $next = $('.c-item--edit.--hidden');
    $next.first().fadeIn().removeClass('--hidden').removeAttr('style');
    if($next.length === 0 ) {
        $(this).remove();
    }
})
$('.c-item__edit-btn').on('click', function(){
    $id = $(this).data('id');
    $('#item' + $id).addClass('c-item--modal').removeClass('c-item--edit');
    $('[name=sub_title' + $id + ']').attr('readonly', false);
    $('[name=sub_large_image' + $id + ']').attr('disabled', false);
    $('body').addClass('--overflow-hidden');
    $('.c-item__back-btn').on('click', function(){
        if($('#item' + $id + ' img').attr('src') == '' && $('[name=sub_title' + $id + ']').val() != '') {
            alert('画像の登録をしてください。');
        } else {
            $('#item' + $id).removeClass('c-item--modal').addClass('c-item--edit');
            $('[name=sub_title' + $id + ']').attr('readonly', true);
            $('[name=sub_large_image' + $id + ']').attr('disabled', true);
            $('body').removeClass('--overflow-hidden');
        }
    })
})

$(function(){

    $('input[type="file"]').on('change', function(){
        if (this.files.length != 1) {
            throw this;
        }
        let $closest = $(this).closest('li');
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
        let $closest = $(this).closest('li');
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
            $preview.find('span.c-item__img').addClass('--hidden');
        }
        else {
            alert()
            $preview.find('img').attr('src', '');
            $preview.find('span.c-item__img').removeClass('--hidden');
        }
    }

    function ajax_fail(jqXHR, textStatus, errorThrown) {
        alert('失敗しました。');
    }
});
</script>
