<!--{strip}-->
    <section>
        <!--{capture assign='require_mark'}--><span class="attention">※</span><!--{/capture}-->
            <header class="l-header__inner<!--{if $arrForm.status.value == 2}--> u-mb--0<!--{/if}-->">
                <a href="<!--{$smarty.const.TOP_URL}-->mypage/item-list.php" aria-label="戻る" class="c-btn--header-nav"></a>
                <p class="c-header-title">アイテム編集</p>
            </header>

        <!--{if $tpl_lock_because_on_loop}-->
            <p class="c-message--alert">このアイテムはChain処理中のため編集することができません</p>
        <!--{/if}-->

        <!--{assign var=key value="status"}-->
        <p class="c-message--alert<!--{if $arrForm.status.value != 2}--> --hidden<!--{/if}-->">このアイテムは公開されていません</p>

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

            </dl>
            <h2 class="c-heading-subtitle u-text--left u-color--gray">詳細写真とキャプション</h2>

            <ul class="sub_large_images u-mb--4">
                <!--{section name=cnt loop=$smarty.const.PRODUCTSUB_MAX}-->

                    <!--{assign var=key value="sub_large_image`$smarty.section.cnt.iteration`"}-->
                    <li data-item_id="<!--{$smarty.section.cnt.iteration}-->" class="c-item--edit<!--{if $smarty.section.cnt.iteration > 3 && $arrFile[$key].filepath == ''}--> --hidden<!--{/if}-->">
                        <!--{if strlen($arrErr[$key]) >= 1}-->
                            <div class="attention"><!--{$arrErr[$key]}--></div>
                        <!--{/if}-->
                        <button class="c-item__back-btn" type="button">詳細写真編集</button>
                        <button class="c-item__sort-btn" type="button"></button>
                        <label class="preview">
                            <img src="<!--{$arrFile[$key].filepath|h}-->" alt="" class="c-item__img"/>
                            <span class="icon"><svg width="13" height="13" viewBox="0 0 13 13" fill="none" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M10.8307 0.236328C11.5641 0.236328 12.1641 0.836328 12.1641 1.56966V10.903C12.1641 11.6363 11.5641 12.2363 10.8307 12.2363H1.4974C0.764063 12.2363 0.164062 11.6363 0.164062 10.903V1.56966C0.164062 0.836328 0.764063 0.236328 1.4974 0.236328H10.8307ZM5.4974 9.243L3.83073 7.23633L1.4974 10.2363H10.8307L7.83073 6.23633L5.4974 9.243Z" fill="#475462"/></svg></span>

                            <span class="c-item__img<!--{if $arrFile[$key].filepath }--> --hidden<!--{/if}-->">
                                <span>画像追加</span>
                            </span>

                            <input type="file" name="<!--{$key|h}-->" size="40" style="<!--{$arrErr[$key]|sfGetErrorColor}-->" disabled/>

                        </label>


                        <div class="c-item__main">
                            <!--{assign var=key value="sub_title`$smarty.section.cnt.iteration`"}-->
                            <h2 class="c-heading-subtitle u-text--left u-color--gray">キャプション</h2>
                            <input type="text" name="<!--{$key|h}-->" value="<!--{$arrForm[$key].value|h}-->" maxlength="<!--{$arrForm[$key].length|h}-->" style="<!--{$arrErr[$key]|sfGetErrorColor}-->" class="u-mb--4" readonly/>
                            <button type="button" class="c-item__img-save-btn c-btn--primary">保存する</button>
                        </div>
                        <button class="c-item__controll-btn" type="button"></button>

                    </li>
                <!--{/section}-->
            </ul>
            <div class="l-popup" data-item_mode="false">
                <ul class="l-popup__inner">
                    <li><a href="javascript:void(0)" class="image_edit">画像の編集</a></li>
                    <li>
                        <a href="javascript:void(0)" class="delete_image" data-item_delete="">画像の削除</a>
                    </li>
                </ul>
                <div class="l-popup__close">
                </div>
            </div>
            <button class="c-btn--default u-mb--4 c-item__add-image-btn" type="button"><svg width="15" height="14" viewBox="0 0 15 14" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M14.1279 8H8.12793V14H6.12793V8H0.12793V6H6.12793V0H8.12793V6H14.1279V8Z" fill="black"/></svg>写真を追加</button>

            <!--{if !$tpl_lock_because_on_loop}-->
                <button onclick="document.form1.submit(); return false;" class="c-btn--primary">確認ページへ</button>
            <!--{/if}-->
        </form>
    </section>
<!--{/strip}-->
<script type="text/javascript">
<!--{if $smarty.request.completeed}-->
    $(function(){
        alert('登録しました。');
    });
<!--{/if}-->
// 公開、非公開
$(function(){
    $('.c-form-parts--toggle-btn__hidden').on('change', function(){
        $('[name=status]').val($('[name=status]').val() == 1 ? 2 :1);
        $('.c-message--alert').toggleClass('--hidden');
    })

    //画像の追加ボタン
    $('.c-item__add-image-btn').on('click', function(){
        $next = $('.c-item--edit.--hidden:first');
        $next.removeClass('--hidden');
        $next.find('.c-item__controll-btn').click();
        $('.image_edit').click();
        if ($('.c-item--edit.--hidden').length === 0) {
            $(this).remove();
        }
    })

    //画像編集
    $('[data-item_id] .c-item__controll-btn').on('click', function(){
        $parent   = $(this).closest('[data-item_id]');
        $caption   = $parent.find('[name^=sub_title]');
        $imageFile = $parent.find('[name^=sub_large_image]');
        $image     = $parent.find('img');
        $id        = $parent.closest('[data-item_id]').attr('data-item_id');

        //削除と編集のコントロール・ポップアップ
        $('.l-popup').attr('data-item_mode', 'edit') ;
        $('a.delete_image').attr('data-item_delete', $id);

        $('.l-popup .l-popup__close').on('click', function(){
            $('body').removeClass('--overflow-hidden');
            $('.l-popup').attr('data-item_mode', 'false') ;
        })

        //画像の編集処理
        $('.image_edit').on('click', function(){
            $('.l-popup').attr('data-item_mode', 'false') ;
            $parent.addClass('c-item--modal').removeClass('c-item--edit');
            $caption.attr('readonly', false);
            $imageFile.attr('disabled', false);
            $('body').addClass('--overflow-hidden');
        })

        //画像が登録されなかった場合の処理も必要
        $('.c-item__back-btn, .c-item__img-save-btn').on('click', function(){
            if($image.attr('src') == '' && $caption.val() != '') {
                // キャプションの登録があって画像がない場合
                alert('画像の登録をしてください。');
            } else {
                $parent.removeClass('c-item--modal').addClass('c-item--edit');
                $caption.attr('readonly', true);
                $imageFile.attr('disabled', true);
                $('body').removeClass('--overflow-hidden');
            }
        })
    })
})

//画像が登録された時の処理
$(function(){
    $('input[type="file"]').on('change', function(){
        if (this.files.length != 1) {
            throw this;
        }
        let $closest = $(this).closest('li');
        let formData = new FormData($('#form1').get(0));
        formData.append('mode', 'upload_image_ajax');
        formData.append('image_key', this.name)

        $closest.find('.preview').addClass('loading')

        $.ajax({
            type: 'POST',
            url: '?',
            data: formData,
            contentType: false,
            processData: false,
            dataType: 'json',
        })
        .done((data, textStatus, jqXHR) => {ajax_done(data, textStatus, jqXHR, $closest)})
        .fail(ajax_fail);

        $(this).val(null);
    });

    //画像が削除された時の処理
    $('a.delete_image').on('click', function(){
        let $closest = $('li[data-item_id=' + $(this).attr('data-item_delete') + ']');
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
        .done((data, textStatus, jqXHR) => {
            ajax_done(data, textStatus, jqXHR, $closest);
            alert('画像を削除しました。');
            $('.l-popup').attr('data-item_mode', 'false');
            $closest.find('input[name=sub_title' + $closest.attr('data-item_id') + ']').val('') ;
            $closest.find('img').attr('src', '');<!--{* プレビューの削除に必要な様子 *}-->
            $closest.addClass('--hidden');
            $closest.find('span.c-item__img').removeClass('--hidden');
            $closest.parent().append($closest);
            renumberImgNum();
        })
        .fail(ajax_fail);
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


        if ('filepath' in data.arrFile && data.arrFile.filepath.length >= 1) {
            $closest.find('img').attr('src', data.arrFile.filepath);
            $closest.find('span.c-item__img').addClass('--hidden');
            $closest.find('.preview').removeClass('loading')
        }
        else {
            // if($closest.attr('data-item_id') === 1) {
            //     alert('カバー写真は削除できません。');
            // }
        }
    }

    function ajax_fail(jqXHR, textStatus, errorThrown) {
        alert('失敗しました。');
    }
});

$isPc = (navigator.userAgent.match(/(iPhone|iPad|iPod|Android)/i))? 0: 1;
let mousedown = false,
    point = "",
    $this,
    length,
    pos,
    id,
    current,
    prev,
    next,
    move;

$('[data-item_id] .c-item__sort-btn').each( function(index){
    if($isPc) {
        $(this).addClass('is-pc');
    }
    $(this).on({
         'touchstart': function (event) {
            // 初期化
            current = '';
            prev    = '';
            next    = '';
            move    = '';
            $this    = $(this).parents('.c-item--edit')
            length  = $('[data-item_id]').not('.--hidden').length
            pos     = $this.offset().top;
            id      = parseInt($this.attr('data-item_id'))

            $('body').addClass('--overflow-hidden');
        },
        'touchmove': function (event) {
            move = event.touches[0].pageY - pos;
            $this.attr('style', 'transform: translateY('+ (move < 0 ? -50 : 50)+'px)').addClass('--move')
        },
        'touchend': function (event) {
            current = $this.contents();
            $this.removeAttr('style').removeClass('--move');

            // 入れ替える
            if(move < 0 && $this.prev().length) {
                $this.prev().before($this);
                renumberImgNum();
            }
            if (move > 0 && $this.next().length) {
                $this.next().after($this);
                renumberImgNum();
            }
            $('body').removeClass('--overflow-hidden');
        },
        'click': function(event) {
            if($isPc) {
                $this   = $(this).parents('.c-item--edit')
                id      = parseInt($this.attr('data-item_id'))
                length  = $('[data-item_id]').not('.--hidden').length
                current = $this.contents();
                if(event.offsetY > 50 && $this.next().length) {
                    $this.next().after($this);
                    renumberImgNum();
                    $this.attr('style', 'transform: translateY('+  70+'px)').addClass('--move')
                }
                if(event.offsetY <= 30 && $this.prev().length)  {
                    $this.prev().before($this);
                    renumberImgNum();
                    $this.attr('style', 'transform: translateY('+  -70+'px)').addClass('--move')
                }
                setTimeout(function(){
                    $this.removeAttr('style').removeClass('--move')
                }, 300)
            }
        }
    })
});

// 画像の入れ替えに伴うフォームオブジェクトの name 属性の書き換えを行う
function postSwapImage(key_base, id1, id2) {
    [key_base, 'temp_' + key_base, 'save_' + key_base].forEach(key => {
        let $input1 = $('#form1 input[name="' + key + id1 + '"]');
        let $input2 = $('#form1 input[name="' + key + id2 + '"]');
        $input1.attr('name', key + id2);
        $input2.attr('name', key + id1);
    });
    let $cap1 = $('#form1 input[name=sub_title' + id1 + ']');
    let $cap2 = $('#form1 input[name=sub_title' + id2 + ']');
    $cap1.attr('name', 'sub_title' + id2);
    $cap2.attr('name', 'sub_title' + id1);
}

function renumberImgNum() {
    const attr_name = 'data-item_id';
    const $elements = $('ul.sub_large_images > li');
    const hidden_keys = ['sub_large_image', 'temp_sub_large_image', 'save_sub_large_image', 'sub_title'];

    // name を書き換えるフォームオブジェクトを変数に保存
    let $inputs = {};
    $elements.each((index, val) => {
        let item_id = $(val).attr(attr_name);
        $inputs[item_id] = {};
        hidden_keys.forEach(key => {
            $inputs[item_id][key] = $('#form1 input[name="' + key + item_id + '"]');
        });
    });

    $elements.each((index, val) => {
        let old_num = $(val).attr(attr_name);
        let new_num = index + 1;
        // 属性に連番を振り直す
        $(val).attr(attr_name, new_num);
        // フォームオブジェクトの name を書き換える
        Object.keys($inputs[old_num]).forEach((key) => {
            $inputs[old_num][key].attr('name', key + new_num);
        });
    });
}

</script>
