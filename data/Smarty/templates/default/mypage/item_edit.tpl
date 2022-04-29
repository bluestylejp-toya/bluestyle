<!--{strip}-->
    <section>
        <!--{capture assign='require_mark'}--><span class="attention">※</span><!--{/capture}-->
        <header class="l-header__inner<!--{if $arrForm.status.value == 2}--> u-mb--0<!--{/if}-->">
            <a href="<!--{$smarty.const.TOP_URL}-->mypage/item-list.php" aria-label="戻る" class="c-btn--header-nav"></a>
            <p class="c-header-title">アイテム編集</p>
        </header>
		<div class="c-item-edit__bg"></div>

        <!--{assign var=key value="status"}-->
        <p class="c-message--alert<!--{if $arrForm.status.value != 2}--> --hidden<!--{/if}-->">このアイテムは公開されていません</p>
        <!--{if $tpl_lock_because_on_loop}-->
            <p class="c-message--alert">このアイテムはChain処理中のため編集することができません</p>
            <div class="disabled">
        <!--{/if}-->

        <button type="button" class="c-btn--default c-prohibited__btn u-mb--4">禁止アイテムについて</button>

        <form name="form1" id="form1" method="post" action="?" enctype="multipart/form-data">
            <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME|h}-->" value="<!--{$transactionid|h}-->" />
            <input type="hidden" name="mode" value="edit" />
            <input type="hidden" name="image_key" value="" />
            <input type="hidden" name="product_id" value="<!--{$arrForm.product_id.value|h}-->" />
            <input type="hidden" name="product_class_id" value="<!--{$arrForm.product_class_id.value|h}-->" /><!--{* ★脆弱性懸念 *}-->
            <!--{foreach key=key item=item from=$arrHidden}-->
                <input type="hidden" name="<!--{$key|h}-->" value="<!--{$item|h}-->" />
            <!--{/foreach}-->
            <h2 class="c-heading-subtitle u-text--left u-color--gray">詳細写真とキャプション</h2>

            <ul class="sub_large_images u-mb--4">
                <!--{section name=cnt loop=$smarty.const.PRODUCTSUB_MAX}-->
					<!--{assign var=id value=`$smarty.section.cnt.iteration`}-->

                    <!--{assign var=key value="sub_large_image`$smarty.section.cnt.iteration`"}-->
                    <!--{assign var=image value=$arrFile[$key].filepath}-->
                    <li data-item_id="<!--{$smarty.section.cnt.iteration}-->" class="c-item-edit<!--{if $smarty.section.cnt.iteration > 1 && count($arrFile[$key]) === 1}--> --hidden<!--{/if}-->">
                        <!--{if strlen($arrErr[$key]) >= 1}-->
                            <div class="attention"><!--{$arrErr[$key]}--></div>
                        <!--{/if}-->

						<button class="c-item-edit__sort-btn" type="button"<!--{if $smarty.section.cnt.iteration == 1}--> disabled<!--{/if}-->></button>

						<div class="c-item-edit__img">
							<span class="loading-item"></span>
							<img src="<!--{if count($arrFile[$key]) > 1}--><!--{$arrFile[$key].filepath|h}--><!--{/if}-->" alt=""/>
						</div>

						<!--{assign var=key value="sub_title`$smarty.section.cnt.iteration`"}-->
						<textarea name="<!--{$key|h}-->" style="<!--{$arrErr[$key]|sfGetErrorColor}-->" placeholder="（キャプションがありません）" class="c-item-edit__caption"  maxlength="<!--{$arrForm[$key].length|h}-->"><!--{$arrForm[$key].value|h}--></textarea>
						<button class="c-item-edit__controll-btn" type="button"></button>
						<!--{assign var=key value="sub_large_image`$smarty.section.cnt.iteration`"}-->
						<ul class="c-item-edit__popup">
							<li><label class="upload__image">画像変更<input type="file" name="<!--{$key|h}-->" size="40" style="<!--{$arrErr[$key]|sfGetErrorColor}-->"/></label></li>
							<li><button type="button" class="delete_item" data-item_delete="<!--{$smarty.section.cnt.iteration}-->"<!--{if $id == 1}--> disabled<!--{/if}-->>削除</button></li>
						</ul>
                    </li>
                <!--{/section}-->
            </ul>
			<p><button type="button" class="c-btn--add"><svg width="19" height="20" viewBox="0 0 19 20" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M18.6789 11.3337H10.6789V19.3337H8.01221V11.3337H0.012207V8.66699H8.01221V0.666992H10.6789V8.66699H18.6789V11.3337Z" fill="#333"/></svg></button></p>



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
                        <!--{if !$tpl_lock_because_on_loop}-->
                <button onclick="document.form1.submit(); return false;" class="c-btn--primary">確認ページへ</button>
            <!--{/if}-->
        </form>
        <!--{if $tpl_lock_because_on_loop}-->
            </div>
        <!--{/if}-->
        <div class="c-prohibited__content">
        <p>Chain では以下のアイテムの出品を禁止しています。</p>
        <ul>
            <li>偽ブランド品、正規品と確証のないもの</li>
            <li>盗品やそれに類する物品</li>
            <li>犯罪や違法行為に使用される可能性があるもの</li>
            <li>殺傷能力があり武器として使用されるもの</li>
            <li>銃刀法などの法律に違反するおそれのあるもの</li>
            <li>用途が明確な生活用の刃物</li>
            <li>児童ポルノやそれに類するとみなされるもの</li>
            <li>18禁、アダルト関連</li>
            <li>医薬品、医療機器</li>
            <li>許可なく製造した化粧品類や小分けした化粧品類</li>
            <li>法令に抵触するサプリメント類</li>
            <li>安全面、衛生面に問題のある食品類</li>
            <li>農薬、肥料</li>
            <li>受け渡しに伴う手続きが複雑なもの</li>
            <li>手元にないもの</li>
            <li>規制薬物・危険ドラッグ類</li>
            <li>個人情報を含む出品・投稿、個人情報の不正利用</li>
            <li>外国為替及び外国貿易法（外為法）に抵触する物品について</li>
            <li>その他、不適切と判断されるもの</li>
        </ul>
        <p>管理会社が禁止出品物に当てはまると判断したものは、弊社の判断で掲載を取りやめる、商品情報を削除するものとします。</p>
        <button type="button" class="c-prohibited__close-btn c-btn--default">閉じる</button>
    </div>

    </section>
<!--{/strip}-->
<script type="text/javascript">
<!--{if $smarty.request.completeed}-->
    $(function(){
        alert('登録しました。');
    });
<!--{/if}-->
// 公開、非公開

//画像が登録された時の処理
$(function(){
	// 画像が2個以上あったら一番上のdisabled削除
	if( $('li[data-item_id].--hidden').length < 9){
		$('li[data-item_id]	').eq(0).find('.c-item-edit__sort-btn').removeAttr('disabled');
	}

	//右端コントロールボタンの制御
	$('.c-item-edit__controll-btn').on('click', function(){
		$closest = $(this).closest('li[data-item_id]')
		$closest.find('.c-item-edit__popup').fadeIn();
		$('.c-item-edit__bg').fadeIn();
		$('.c-item-edit__bg').on('click', function(){
			$closest.find('.c-item-edit__popup').fadeOut();
			$(this).fadeOut();
		})
	});
	//アイテム情報追加
	$(".c-btn--add").on('click',function(){
		$('.c-item-edit.--hidden').eq(0).removeClass('--hidden');
		$('.c-item-edit:first-child').find('.c-item-edit__sort-btn').attr('disabled', false)
		if($('.c-item-edit.--hidden').length == 0) {
			$(".c-btn--add").attr('disabled', true)
		}
	})
	//画像の登録処理
	$('.c-item-edit__img').on('click', function(){
		if($(this).find('img').attr('src') === "") {
			console.log($(this).siblings('ul').find('.upload__image input[type=file]'))
			$(this).siblings('ul').find('.upload__image input[type=file]').click();
		} else {
			$('.c-item-edit__bg').fadeIn();
			$img = ('<div class="c-item-edit__img-lg"><button type="button" class="c-item-edit__close-btn"></button><img src="'+$(this).find('img').attr('src')+'"></div>');
			$(this).closest('li[data-item_id]').append($img);
			$(document).on('click','.c-item-edit__img-lg', function(){
				$('.c-item-edit__bg').fadeOut();
				$(this).remove();
			})

			$('.c-item-edit__bg').on('click', function(){
				$(this).fadeOut();
				$('.c-item-edit__img-lg').remove();
			})
		}
	})
	// ファイルアップロード処理
    $('input[type="file"]').on('change', function(){
        if (this.files.length != 1) {
            throw this;
        }
        let $closest = $(this).closest('li[data-item_id]');
        let formData = new FormData($('#form1').get(0));
        formData.append('mode', 'upload_image_ajax');
        formData.append('image_key', this.name)

        $closest.find('.c-item-edit__img').addClass('loading')

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


    //アイテムの削除
    $('.delete_item').on('click', function(){
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
			if($closest.attr('data-item_id') != 1){
				alert('削除しました。');
				$closest.find('textarea[name=sub_title' + $closest.attr('data-item_id') + ']').val('') ;
				$closest.addClass('--hidden');
				$closest.find('img').attr('src', '');<!--{* プレビューの削除に必要な様子 *}-->
				if($('.c-item-edit.--hidden').length > 0) {
					$(".c-btn--add").removeAttr('disabled')
				}
			}
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
            $closest.find('.c-item-edit__img').removeClass('loading')
        }
        $('.c-item-edit__popup').fadeOut();
		$('.c-item-edit__bg').fadeOut();
    }

    function ajax_fail(jqXHR, textStatus, errorThrown) {
        alert('失敗しました。');
        $closest.find('.c-item-edit__img').removeClass('loading')
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

$('[data-item_id] .c-item-edit__sort-btn').each( function(index){
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
            $this    = $(this).parents('.c-item-edit')
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
			document.querySelectorAll('[data-item_delete]').forEach(function(item, index){
				if(index === 0){

					item.setAttribute('disabled', false);
				} else {
					item.removeAttribute('disabled');
				}
			})
            $('body').removeClass('--overflow-hidden');
        },
        'click': function(event) {
            if($isPc) {

                $this   = $(this).parents('.c-item-edit')
                id      = parseInt($this.attr('data-item_id'))
                length  = $('[data-item_id]').not('.--hidden').length
                current = $this.contents();

                if(event.offsetY > 30 && $this.next().length) {
                    $this.next().after($this);
                    renumberImgNum();
                    $this.addClass('--move')
                }
                if(event.offsetY <= 30 && $this.prev().length)  {
                    $this.prev().before($this);
                    renumberImgNum();
                    $this.addClass('--move')
                }
				document.querySelectorAll('[data-item_delete]').forEach(function(item, index){
					if(index === 0){

						item.setAttribute('disabled', false);
					} else {
						item.removeAttribute('disabled');
					}
				})
                setTimeout(function(){
                    $this.removeAttr('style').removeClass('--move')

                }, 300)
            }
        }
    })
});

$('.c-form-parts--toggle-btn__hidden').on('change', function(){
	$('[name=status]').val($('[name=status]').val() == 1 ? 2 :1);
	$('.c-message--alert').toggleClass('--hidden');
})

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
$('.c-prohibited__btn').on('click', function(){
    $('.c-prohibited__content').fadeIn();
    $('.c-item-edit__bg').fadeIn();
    $('.c-item-edit__bg,.c-prohibited__close-btn').on('click', function(){
        $('.c-prohibited__content').fadeOut();
    $('.c-item-edit__bg').fadeOut();
    })
})
$('.c-alert--gray .close-btn').on('click', function(){
    $('.c-alert--gray').fadeOut();
})
</script>
