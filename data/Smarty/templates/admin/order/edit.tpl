<!--{*
/*
 * This file is part of EC-CUBE
 *
 * Copyright(c) EC-CUBE CO.,LTD. All Rights Reserved.
 *
 * http://www.ec-cube.co.jp/
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
 */
*}-->

<script type="text/javascript">
<!--
    function fnEdit(customer_id) {
        document.form1.action = '<!--{$smarty.const.ROOT_URLPATH}--><!--{$smarty.const.ADMIN_DIR}-->customer/edit.php';
        document.form1.mode.value = "edit"
        document.form1['customer_id'].value = customer_id;
        document.form1.submit();
        return false;
    }

    function fnCopyFromOrderData() {
        df = document.form1;

        // お届け先名のinputタグのnameを取得
        var shipping_data = $('input[name^=shipping_name01]').attr('name');
        var shipping_slt  = shipping_data.split("shipping_name01");

        var shipping_key = "[0]";
        if(shipping_slt.length > 1) {
            shipping_key = shipping_slt[1];
        }

        df['shipping_name01'+shipping_key].value = df.order_name01.value;
        df['shipping_name02'+shipping_key].value = df.order_name02.value;
        df['shipping_kana01'+shipping_key].value = df.order_kana01.value;
        df['shipping_kana02'+shipping_key].value = df.order_kana02.value;
        df['shipping_zip01'+shipping_key].value = df.order_zip01.value;
        df['shipping_zip02'+shipping_key].value = df.order_zip02.value;
        df['shipping_tel01'+shipping_key].value = df.order_tel01.value;
        df['shipping_tel02'+shipping_key].value = df.order_tel02.value;
        df['shipping_tel03'+shipping_key].value = df.order_tel03.value;
        <!--{if $smarty.const.FORM_COUNTRY_ENABLE}-->
            df['shipping_country_id'+shipping_key].value = df.order_country_id.value;
            df['shipping_zipcode'+shipping_key].value = df.order_zipcode.value;
        <!--{/if}-->
        df['shipping_addr01'+shipping_key].value = df.order_addr01.value;
        df['shipping_addr02'+shipping_key].value = df.order_addr02.value;
        df['shipping_addr03'+shipping_key].value = df.order_addr03.value;
        df['shipping_pref'+shipping_key].value = df.order_pref.value;
    }

    function fnFormConfirm() {
        if (eccube.doConfirm()) {
            document.form1.submit();
        }
    }

    function fnMultiple() {
        eccube.openWindow('<!--{$smarty.const.ROOT_URLPATH}--><!--{$smarty.const.ADMIN_DIR}-->order/multiple.php', 'multiple', '600', '500', {menubar:'no'});
        document.form1.anchor_key.value = "shipping";
        document.form1.mode.value = "multiple";
        document.form1.submit();
        return false;
    }

    function fnAppendShipping() {
        document.form1.anchor_key.value = "shipping";
        document.form1.mode.value = "append_shipping";
        document.form1.submit();
        return false;
    }

    $(document).ready(function() {
        var shipping_quantity = '<!--{$tpl_shipping_quantity|escape:javascript}-->';
        if (shipping_quantity > 1){
            $("input[name^='quantity[']").attr("disabled","disabled");
        }
    });

    function quantityCopyForSingleShipping(product_index){
        var product_index = parseInt(product_index);
        var input_quantity = $('input[name^="quantity[' + product_index + ']"]').val();
        $('input[name^="shipment_quantity[<!--{$top_shipping_id}-->][' + product_index + ']"]').val(input_quantity);
    }

//-->
</script>
<form name="form1" id="form1" method="post" action="?">
    <input type="hidden" name="<!--{$smarty.const.TRANSACTION_ID_NAME}-->" value="<!--{$transactionid}-->" />
    <input type="hidden" name="mode" value="<!--{$tpl_mode|default:"edit"|h}-->" />
    <input type="hidden" name="order_id" value="<!--{$arrForm.order_id.value|h}-->" />
    <input type="hidden" name="edit_customer_id" value="" />
    <input type="hidden" name="anchor_key" value="" />
    <input type="hidden" id="add_product_id" name="add_product_id" value="" />
    <input type="hidden" id="add_product_class_id" name="add_product_class_id" value="" />
    <input type="hidden" id="select_shipping_id" name="select_shipping_id" value="" />
    <input type="hidden" id="edit_product_id" name="edit_product_id" value="" />
    <input type="hidden" id="edit_product_class_id" name="edit_product_class_id" value="" />
    <input type="hidden" id="no" name="no" value="" />
    <input type="hidden" id="delete_no" name="delete_no" value="" />
    <!--{foreach key=key item=item from=$arrSearchHidden}-->
        <!--{if is_array($item)}-->
            <!--{foreach item=c_item from=$item}-->
            <input type="hidden" name="<!--{$key|h}-->[]" value="<!--{$c_item|h}-->" />
            <!--{/foreach}-->
        <!--{else}-->
            <input type="hidden" name="<!--{$key|h}-->" value="<!--{$item|h}-->" />
        <!--{/if}-->
    <!--{/foreach}-->

    <div id="order" class="contents-main">

        <!--▼お客様情報ここから-->
        <table class="form">
            <!--{if $tpl_mode != 'add'}-->
            <tr>
                <th>帳票出力</th>
                <td><a class="btn-normal" href="javascript:;" onclick="eccube.openWindow('pdf.php?order_id=<!--{$arrForm.order_id.value|h}-->','pdf_input','615','650'); return false;">帳票出力</a></td>
            </tr>
            <!--{/if}-->
            <tr>
                <th>注文番号</th>
                <td><!--{$arrForm.order_id.value|h}--></td>
            </tr>
            <tr>
                <th>受注日</th>
                <td><!--{$arrForm.create_date.value|sfDispDBDate|h}--><input type="hidden" name="create_date" value="<!--{$arrForm.create_date.value|h}-->" /></td>
            </tr>
            <tr>
                <th>対応状況<span class="attention"> *</span></th>
                <td>
                    <!--{assign var=key value="status"}-->
                    <span class="attention"><!--{$arrErr[$key]}--></span>
                    <select name="<!--{$key}-->" style="<!--{$arrErr[$key]|sfGetErrorColor}-->">
                        <option value="">選択してください</option>
                        <!--{html_options options=$arrORDERSTATUS selected=$arrForm[$key].value}-->
                    </select><br />
                    <!--{if $smarty.get.mode != 'add'}-->
                        <span class="attention">※ <!--{$arrORDERSTATUS[$smarty.const.ORDER_CANCEL]}-->に変更時には、在庫数を手動で戻してください。</span>
                    <!--{/if}-->
                </td>
            </tr>
            <tr>
                <th>入金日</th>
                <td><!--{$arrForm.payment_date.value|sfDispDBDate|default:"未入金"|h}--></td>
            </tr>
            <tr>
                <th>発送日</th>
                <td><!--{$arrForm.commit_date.value|sfDispDBDate|default:"未発送"|h}--></td>
            </tr>
            <tr>
                <th>お問い合わせ番号</th>
                <td><!--{$arrYamatoDelivStatus.denpyoNo|h}--></td>
            </tr>
            <tr>
                <th>発送状況</th>
                <td><!--{$arrYamatoDelivStatus.status|h}--></td>
            </tr>
            <tr>
                <th>品名</th>
                <td><!--{$arrYamatoDelivStatus.baggDesc2|h}--></td>
            </tr>
            <tr>
                <th>発送者</th>
                <td>
                    <!--{if $arrYamatoDelivStatus.srcLastNm|h|@strlen > 0}-->
                        <!--{$arrYamatoDelivStatus.srcLastNm|h}--> <!--{$arrYamatoDelivStatus.srcFirstNm|h}-->様<br />
                        <!--{$arrYamatoDelivStatus.srcTel1|h}-->-<!--{$arrYamatoDelivStatus.srcTel2|h}-->-<!--{$arrYamatoDelivStatus.srcTel3|h}--><br />
                        <!--{$arrYamatoDelivStatus.srcZipCd|h}--><br />
                        <!--{$arrYamatoDelivStatus.srcAddress1|h}--><br />
                        <!--{$arrYamatoDelivStatus.srcAddress2|h}--><br />
                        <!--{$arrYamatoDelivStatus.srcAddress3|h}--><br />
                        <!--{$arrYamatoDelivStatus.srcAddress4|h}-->
                    <!--{/if}-->
                </td>
            </tr>
            <tr>
                <th>お届け先</th>
                <td>
                    <!--{if $arrYamatoDelivStatus.dstLastNm|h|@strlen > 0}-->
                        <!--{$arrYamatoDelivStatus.dstLastNm|h}--> <!--{$arrYamatoDelivStatus.dstFirstNm|h}-->様<br />
                        <!--{$arrYamatoDelivStatus.dstTel1|h}-->-<!--{$arrYamatoDelivStatus.dstTel2|h}-->-<!--{$arrYamatoDelivStatus.dstTel3|h}--><br />
                        <!--{$arrYamatoDelivStatus.dstZipCd|h}--><br />
                        <!--{$arrYamatoDelivStatus.dstAddress1|h}--><br />
                        <!--{$arrYamatoDelivStatus.dstAddress2|h}--><br />
                        <!--{$arrYamatoDelivStatus.dstAddress3|h}--><br />
                        <!--{$arrYamatoDelivStatus.dstAddress4|h}-->
                    <!--{/if}-->
                    <!--{$arrYamatoDelivStatus|@var_dump}-->
                </td>
            </tr>
        </table>

        <h2>注文者情報
            <!--{if $tpl_mode == 'add'}-->
                <a class="btn-normal" href="javascript:;" name="address_input" onclick="eccube.openWindow('<!--{$smarty.const.ROOT_URLPATH}--><!--{$smarty.const.ADMIN_DIR}-->customer/search_customer.php','search','600','650',{resizable:'no',focus:false}); return false;">会員検索</a>
            <!--{/if}-->
        </h2>
        <table class="form">
            <tr>
                <th>会員ID</th>
                <td>
                    <!--{if $arrForm.customer_id.value > 0}-->
                        <!--{$arrForm.customer_id.value|h}-->
                        <input type="hidden" name="customer_id" value="<!--{$arrForm.customer_id.value|h}-->" />
                    <!--{else}-->
                        (非会員)
                    <!--{/if}-->
                </td>
            </tr>
            <tr>
                <th>お名前<span class="attention"> *</span></th>
                <td>
                    <!--{assign var=key1 value="order_name01"}-->
                    <!--{assign var=key2 value="order_name02"}-->
                    <span class="attention"><!--{$arrErr[$key1]}--><!--{$arrErr[$key2]}--></span>
                    <input type="text" name="<!--{$key1}-->" value="<!--{$arrForm[$key1].value|h}-->" maxlength="<!--{$arrForm[$key1].length}-->" style="<!--{$arrErr[$key1]|sfGetErrorColor}-->" size="15" class="box15" />
                    <input type="text" name="<!--{$key2}-->" value="<!--{$arrForm[$key2].value|h}-->" maxlength="<!--{$arrForm[$key2].length}-->" style="<!--{$arrErr[$key2]|sfGetErrorColor}-->" size="15" class="box15" />
                </td>
            </tr>
            <tr>
                <th>お名前(フリガナ)</th>
                <td>
                    <!--{assign var=key1 value="order_kana01"}-->
                    <!--{assign var=key2 value="order_kana02"}-->
                    <span class="attention"><!--{$arrErr[$key1]}--><!--{$arrErr[$key2]}--></span>
                    <input type="text" name="<!--{$key1}-->" value="<!--{$arrForm[$key1].value|h}-->" maxlength="<!--{$arrForm[$key1].length}-->" style="<!--{$arrErr[$key1]|sfGetErrorColor}-->" size="15" class="box15" />
                    <input type="text" name="<!--{$key2}-->" value="<!--{$arrForm[$key2].value|h}-->" maxlength="<!--{$arrForm[$key2].length}-->" style="<!--{$arrErr[$key2]|sfGetErrorColor}-->" size="15" class="box15" />
                </td>
            </tr>
            <tr>
                <th>メールアドレス</th>
                <td>
                    <!--{assign var=key1 value="order_email"}-->
                    <span class="attention"><!--{$arrErr[$key1]}--></span>
                    <input type="text" name="<!--{$key1}-->" value="<!--{$arrForm[$key1].value|h}-->" maxlength="<!--{$arrForm[$key1].length}-->" style="<!--{$arrErr[$key1]|sfGetErrorColor}-->" size="30" class="box30" />
                </td>
            </tr>
            <tr>
                <th>TEL</th>
                <td>
                    <!--{assign var=key1 value="order_tel01"}-->
                    <!--{assign var=key2 value="order_tel02"}-->
                    <!--{assign var=key3 value="order_tel03"}-->
                    <span class="attention"><!--{$arrErr[$key1]}--></span>
                    <span class="attention"><!--{$arrErr[$key2]}--></span>
                    <span class="attention"><!--{$arrErr[$key3]}--></span>
                    <input type="text" name="<!--{$arrForm[$key1].keyname}-->" value="<!--{$arrForm[$key1].value|h}-->" maxlength="<!--{$arrForm[$key1].length}-->" style="<!--{$arrErr[$key1]|sfGetErrorColor}-->" size="6" class="box6" /> -
                    <input type="text" name="<!--{$arrForm[$key2].keyname}-->" value="<!--{$arrForm[$key2].value|h}-->" maxlength="<!--{$arrForm[$key2].length}-->" style="<!--{$arrErr[$key2]|sfGetErrorColor}-->" size="6" class="box6" /> -
                    <input type="text" name="<!--{$arrForm[$key3].keyname}-->" value="<!--{$arrForm[$key3].value|h}-->" maxlength="<!--{$arrForm[$key3].length}-->" style="<!--{$arrErr[$key3]|sfGetErrorColor}-->" size="6" class="box6" />
                </td>
            </tr>
            <tr>
                <th>生年月日</th>
                <td>
                    <!--{assign var=key1 value="order_birth_year"}-->
                    <!--{assign var=key2 value="order_birth_month"}-->
                    <!--{assign var=key3 value="order_birth_day"}-->
                    <!--{assign var=errBirth value="`$arrErr.$key1``$arrErr.$key2``$arrErr.$key3`"}-->
	                <!--{if $errBirth}-->
	                    <div class="attention"><!--{$errBirth}--></div>
	                <!--{/if}-->
                    <select name="<!--{$key1}-->" style="<!--{$errBirth|sfGetErrorColor}-->">
                        <!--{html_options options=$arrBirthYear selected=$arrForm[$key1].value|default:""}-->
                    </select>年
                    <select name="<!--{$key2}-->" style="<!--{$errBirth|sfGetErrorColor}-->">
                        <!--{html_options options=$arrBirthMonth selected=$arrForm[$key2].value|default:""}-->
                    </select>月
                    <select name="<!--{$key3}-->" style="<!--{$errBirth|sfGetErrorColor}-->">
                        <!--{html_options options=$arrBirthDay selected=$arrForm[$key3].value|default:""}-->
                    </select>日
                </td>
            </tr>

            <!--{assign var=key1 value="order_country_id"}-->
            <!--{assign var=key2 value="order_zipcode"}-->
            <!--{if !$smarty.const.FORM_COUNTRY_ENABLE}-->
            <input type="hidden" name="<!--{$key1}-->" value="<!--{$smarty.const.DEFAULT_COUNTRY_ID}-->" />
            <!--{else}-->
                <tr>
                    <th>国</th>
                    <td>
                        <span class="attention"><!--{$arrErr[$key1]}--></span>
                        <select name="<!--{$key1}-->" style="<!--{$arrErr[$key1]|sfGetErrorColor}-->">
                                <option value="" selected="selected">国を選択</option>
                                <!--{html_options options=$arrCountry selected=$arrForm[$key1].value|default:$smarty.const.DEFAULT_COUNTRY_ID}-->
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>ZIP CODE</th>
                    <td>
                        <span class="attention"><!--{$arrErr[$key2]}--></span>
                        <input type="text" name="<!--{$key2}-->" value="<!--{$arrForm[$key2].value|h}-->" maxlength="<!--{$arrForm[$key2].length}-->" style="<!--{$arrErr[$key2]|sfGetErrorColor}-->;" size="15" class="box15"/>
                    </td>
                </tr>
            <!--{/if}-->

            <tr>
                <th>住所</th>
                <td>
                    <!--{assign var=key1 value="order_zip01"}-->
                    <!--{assign var=key2 value="order_zip02"}-->
                    <span class="attention"><!--{$arrErr[$key1]}--><!--{$arrErr[$key2]}--></span>
                    〒
                    <input type="text" name="<!--{$key1}-->" value="<!--{$arrForm[$key1].value|h}-->" maxlength="<!--{$arrForm[$key1].length}-->" style="<!--{$arrErr[$key1]|sfGetErrorColor}-->" size="6" class="box6" />
                    -
                    <input type="text" name="<!--{$key2}-->" value="<!--{$arrForm[$key2].value|h}-->" maxlength="<!--{$arrForm[$key2].length}-->" style="<!--{$arrErr[$key2]|sfGetErrorColor}-->" size="6" class="box6" />
                    <a class="btn-normal" href="javascript:;" name="address_input" onclick="eccube.getAddress('<!--{$smarty.const.INPUT_ZIP_URLPATH}-->', 'order_zip01', 'order_zip02', 'order_pref', 'order_addr01'); return false;">住所入力</a><br />
                    <!--{assign var=key value="order_pref"}-->
                    <span class="attention"><!--{$arrErr[$key]}--></span>
                    <select class="top" name="<!--{$key}-->" style="<!--{$arrErr[$key]|sfGetErrorColor}-->">
                        <option value="" selected="">都道府県を選択</option>
                        <!--{html_options options=$arrPref selected=$arrForm[$key].value}-->
                    </select><br />
                    <!--{assign var=key value="order_addr01"}-->
                    <span class="attention"><!--{$arrErr[$key]}--></span>
                    <input type="text" name="<!--{$key}-->" value="<!--{$arrForm[$key].value|h}-->" size="60" class="box60 top" maxlength="<!--{$arrForm[$key].length}-->" style="<!--{$arrErr[$key]|sfGetErrorColor}-->" /><br />
                    <!--{assign var=key value="order_addr02"}-->
                    <span class="attention"><!--{$arrErr[$key]}--></span>
                    <input type="text" name="<!--{$key}-->" value="<!--{$arrForm[$key].value|h}-->" size="60" class="box60 top" maxlength="<!--{$arrForm[$key].length}-->" style="<!--{$arrErr[$key]|sfGetErrorColor}-->" /><br />
                    <!--{assign var=key value="order_addr03"}-->
                    <span class="attention"><!--{$arrErr[$key]}--></span>
                    <input type="text" name="<!--{$key}-->" value="<!--{$arrForm[$key].value|h}-->" size="60" class="box60" maxlength="<!--{$arrForm[$key].length}-->" style="<!--{$arrErr[$key]|sfGetErrorColor}-->" />
                </td>
            </tr>
            <tr>
                <th>端末種別</th>
                <td><!--{$arrDeviceType[$arrForm.device_type_id.value]|h}--></td>
            </tr>

        </table>
        <!--▲お客様情報ここまで-->

        <!--▼受注商品情報ここから-->
        <a name="order_products"></a>
        <h2 id="order_products">
            受注商品情報
            <a class="btn-normal" href="javascript:;" name="recalculate" onclick="eccube.setModeAndSubmit('recalculate','anchor_key','order_products');">計算結果の確認</a>
            <!--{if $tpl_shipping_quantity <= 1}-->
                <a class="btn-normal" href="javascript:;" name="add_product" onclick="eccube.openWindow('<!--{$smarty.const.ROOT_URLPATH}--><!--{$smarty.const.ADMIN_DIR}-->order/product_select.php?order_id=<!--{$arrForm.order_id.value|h}-->&amp;shipping_id=<!--{$top_shipping_id}-->', 'search', '615', '500', {menubar:'no'}); return false;">商品の追加</a>
            <!--{/if}-->
        </h2>

        <!--{if $arrErr.product_id}-->
            <span class="attention">※ 商品が選択されていません。</span>
        <!--{/if}-->

        <table class="list order-edit-products">
            <tr>
                <col width="35%" />
                <col width="10%" />
                <col width="10%" />
                <col width="30%" />
                <col width="15%" />
                <th class="chain_id">Chain ID</th>
                <th class="add_customer_id">出品者ID</th>
                <th class="id">商品ID</th>
                <th class="name">商品名</th>
                <th class="image">画像</th>
            </tr>
            <!--{section name=cnt loop=$arrForm.quantity.value}-->
            <!--{assign var=product_index value="`$smarty.section.cnt.index`"}-->
                <tr>
                    <td class="center"><!--{$arrForm.chain_id.value|h}--></td>
                    <td class="center"><!--{$arrForm.add_customer_id.value[$product_index]|h}--></td>
                    <td class="center">
                        <!--{$arrForm.product_id.value[$product_index]|h}-->
                        <input type="hidden" name="product_code[<!--{$product_index}-->]" value="<!--{$arrForm.product_code.value[$product_index]|h}-->" id="product_code_<!--{$product_index}-->" />
                    </td>
                    <td class="center">
                        <!--{$arrForm.product_name.value[$product_index]|h}-->
                        <input type="hidden" name="product_name[<!--{$product_index}-->]" value="<!--{$arrForm.product_name.value[$product_index]|h}-->" id="product_name_<!--{$product_index}-->" />
                        <input type="hidden" name="classcategory_name1[<!--{$product_index}-->]" value="<!--{$arrForm.classcategory_name1.value[$product_index]|h}-->" id="classcategory_name1_<!--{$product_index}-->" />
                        <input type="hidden" name="classcategory_name2[<!--{$product_index}-->]" value="<!--{$arrForm.classcategory_name2.value[$product_index]|h}-->" id="classcategory_name2_<!--{$product_index}-->" />
                    <input type="hidden" name="product_type_id[<!--{$product_index}-->]" value="<!--{$arrForm.product_type_id.value[$product_index]|h}-->" id="product_type_id_<!--{$product_index}-->" />
                    <input type="hidden" name="product_id[<!--{$product_index}-->]" value="<!--{$arrForm.product_id.value[$product_index]|h}-->" id="product_id_<!--{$product_index}-->" />
                    <input type="hidden" name="product_class_id[<!--{$product_index}-->]" value="<!--{$arrForm.product_class_id.value[$product_index]|h}-->" id="product_class_id_<!--{$product_index}-->" />
                    <input type="hidden" name="point_rate[<!--{$product_index}-->]" value="<!--{$arrForm.point_rate.value[$product_index]|h}-->" id="point_rate_<!--{$product_index}-->" />
                    </td>
                    <td class="center"><img src="<!--{$smarty.const.IMAGE_SAVE_URLPATH}--><!--{$arrForm.sub_large_image1.value[$product_index]|sfNoImageMainList|h}-->" alt="<!--{$arrProduct.name|h}-->" style="max-width:100%;"/></td>
                        <!--{assign var=key value="price"}-->
                        <input type="hidden" name="<!--{$key}-->[<!--{$product_index}-->]" value="<!--{$arrForm[$key].value[$product_index]|h}-->" id="<!--{$key}-->_<!--{$product_index}-->" />

                        <!--{assign var=key value="quantity"}-->
                        <input type="hidden" name="<!--{$key}-->[<!--{$product_index}-->]" value="<!--{$arrForm[$key].value[$product_index]|h}-->" id="<!--{$key}-->_<!--{$product_index}-->" />
                    <!--{assign var=price value="`$arrForm.price.value[$product_index]`"}-->
                    <!--{assign var=quantity value="`$arrForm.quantity.value[$product_index]`"}-->
                    <!--{assign var=tax_rate value="`$arrForm.tax_rate.value[$product_index]`"}-->
                    <!--{assign var=tax_rule value="`$arrForm.tax_rule.value[$product_index]`"}-->
                    <input type="hidden" name="tax_rule[<!--{$product_index}-->]" value="<!--{$arrForm.tax_rule.value[$product_index]|h}-->" id="tax_rule_<!--{$product_index}-->" />

                        <!--{assign var=key value="tax_rate"}-->
                        <input type="hidden" name="<!--{$key}-->[<!--{$product_index}-->]" value="<!--{$arrForm[$key].value[$product_index]|h}-->" id="<!--{$key}-->_<!--{$product_index}-->" />
                </tr>
            <!--{/section}-->
                    <!--{assign var=key value="discount"}-->
                    <input type="hidden" name="<!--{$key}-->" value="<!--{$arrForm[$key].value|h}-->" />
            <tr>
                <th colspan="4" class="column right">送料</th>
                <td class="right">
                    <!--{assign var=key value="deliv_fee"}-->
                    <span class="attention"><!--{$arrErr[$key]}--></span>
                    <input type="text" name="<!--{$key}-->" value="<!--{$arrForm[$key].value|h}-->" maxlength="<!--{$arrForm[$key].length}-->" style="<!--{$arrErr[$key]|sfGetErrorColor}-->" size="5" class="box6" />
                    円
                </td>
            </tr>
            <tr>
                <th colspan="4" class="column right">手数料</th>
                <td class="right">
                    <!--{assign var=key value="charge"}-->
                    <span class="attention"><!--{$arrErr[$key]}--></span>
                    <input type="text" name="<!--{$key}-->" value="<!--{$arrForm[$key].value|h}-->" maxlength="<!--{$arrForm[$key].length}-->" style="<!--{$arrErr[$key]|sfGetErrorColor}-->" size="5" class="box6" />
                    円
                </td>
            </tr>
            <tr>
                <th colspan="4" class="column right">合計</th>
                <td class="right">
                    <span class="attention"><!--{$arrErr.total}--></span>
                    <!--{$arrForm.total.value|default:0|n2s}--> 円
                </td>
            </tr>
            <tr>
                <th colspan="4" class="column right">お支払い合計</th>
                <td class="right">
                    <span class="attention"><!--{$arrErr.payment_total}--></span>
                    <!--{$arrForm.payment_total.value|default:0|n2s}-->
                    円
                </td>
            </tr>
        </table>
        <!--▼お届け先情報ここから-->

        <!--{foreach name=shipping from=$arrAllShipping item=arrShipping key=shipping_index}-->
            <!--{assign var=key value="shipping_id"}-->
            <input type="hidden" name="<!--{$key}-->[<!--{$shipping_index}-->]" value="<!--{$arrShipping[$key]|default:"0"|h}-->" id="<!--{$key}-->_<!--{$shipping_index}-->" />
            <!--{if $tpl_shipping_quantity > 1}-->

                <!--{if count($arrShipping.shipment_product_class_id) > 0}-->
                        <!--{section name=item loop=$arrShipping.shipment_product_class_id|@count}-->
                            <!--{assign var=item_index value="`$smarty.section.item.index`"}-->
                                    <!--{assign var=key value="shipment_product_class_id"}-->
                                    <input type="hidden" name="<!--{$key}-->[<!--{$shipping_index}-->][<!--{$item_index}-->]" value="<!--{$arrShipping[$key][$item_index]|h}-->" />
                                    <!--{assign var=key value="shipment_product_code"}-->
                                    <input type="hidden" name="<!--{$key}-->[<!--{$shipping_index}-->][<!--{$item_index}-->]" value="<!--{$arrShipping[$key][$item_index]|h}-->" />
                                    <!--{assign var=key1 value="shipment_product_name"}-->
                                    <!--{assign var=key2 value="shipment_classcategory_name1"}-->
                                    <!--{assign var=key3 value="shipment_classcategory_name2"}-->
                                    <input type="hidden" name="<!--{$key1}-->[<!--{$shipping_index}-->][<!--{$item_index}-->]" value="<!--{$arrShipping[$key1][$item_index]|h}-->" />
                                    <input type="hidden" name="<!--{$key2}-->[<!--{$shipping_index}-->][<!--{$item_index}-->]" value="<!--{$arrShipping[$key2][$item_index]|h}-->" />
                                    <input type="hidden" name="<!--{$key3}-->[<!--{$shipping_index}-->][<!--{$item_index}-->]" value="<!--{$arrShipping[$key3][$item_index]|h}-->" />
                                    <!--{assign var=key value="shipment_price"}-->
                                    <input type="hidden" name="<!--{$key}-->[<!--{$shipping_index}-->][<!--{$item_index}-->]" value="<!--{$arrShipping[$key][$item_index]|h}-->" />
                                    <!--{assign var=key value="shipment_quantity"}-->
                                    <input type="text" name="<!--{$key}-->[<!--{$shipping_index}-->][<!--{$item_index}-->]" value="<!--{$arrShipping[$key][$item_index]|h}-->" size="3" class="box3" maxlength="<!--{$arrForm[$key].length}-->" />
                        <!--{/section}-->
                <!--{/if}-->
            <!--{else}-->
                <!-- 配送先が１つでも、shipment_itemを更新するために必要 -->

                <!--{section name=item loop=$arrShipping.shipment_product_class_id|@count}-->
                    <!--{assign var=item_index value="`$smarty.section.item.index`"}-->
                    <!--{assign var=key value="shipment_product_class_id"}-->
                    <input type="hidden" name="<!--{$key}-->[<!--{$shipping_index}-->][<!--{$item_index}-->]" value="<!--{$arrShipping[$key][$item_index]|h}-->" />
                    <!--{assign var=key value="shipment_product_code"}-->
                    <input type="hidden" name="<!--{$key}-->[<!--{$shipping_index}-->][<!--{$item_index}-->]" value="<!--{$arrShipping[$key][$item_index]|h}-->" />
                    <!--{assign var=key1 value="shipment_product_name"}-->
                    <!--{assign var=key2 value="shipment_classcategory_name1"}-->
                    <!--{assign var=key3 value="shipment_classcategory_name2"}-->
                    <input type="hidden" name="<!--{$key1}-->[<!--{$shipping_index}-->][<!--{$item_index}-->]" value="<!--{$arrShipping[$key1][$item_index]|h}-->" />
                    <input type="hidden" name="<!--{$key2}-->[<!--{$shipping_index}-->][<!--{$item_index}-->]" value="<!--{$arrShipping[$key2][$item_index]|h}-->" />
                    <input type="hidden" name="<!--{$key3}-->[<!--{$shipping_index}-->][<!--{$item_index}-->]" value="<!--{$arrShipping[$key3][$item_index]|h}-->" />
                    <!--{assign var=key value="shipment_price"}-->
                    <input type="hidden" name="<!--{$key}-->[<!--{$shipping_index}-->][<!--{$item_index}-->]" value="<!--{$arrShipping[$key][$item_index]|h}-->" />
                    <!--{assign var=key value="shipment_quantity"}-->
                    <input type="hidden" name="<!--{$key}-->[<!--{$shipping_index}-->][<!--{$item_index}-->]" value="<!--{$arrShipping[$key][$item_index]|h}-->" />
                <!--{/section}-->
            <!--{/if}-->

                        <!--{assign var=key1 value="shipping_name01"}-->
                        <!--{assign var=key2 value="shipping_name02"}-->
                        <input type="hidden" name="<!--{$key1}-->[<!--{$shipping_index}-->]" value="<!--{$arrShipping[$key1]|h}-->" />
                        <input type="hidden" name="<!--{$key2}-->[<!--{$shipping_index}-->]" value="<!--{$arrShipping[$key2]|h}-->" />
                        <!--{assign var=key1 value="shipping_kana01"}-->
                        <!--{assign var=key2 value="shipping_kana02"}-->
                        <input type="hidden" name="<!--{$key1}-->[<!--{$shipping_index}-->]" value="<!--{$arrShipping[$key1]|h}-->" />
                        <input type="hidden" name="<!--{$key2}-->[<!--{$shipping_index}-->]" value="<!--{$arrShipping[$key2]|h}-->" />
                        <!--{assign var=key1 value="shipping_tel01"}-->
                        <!--{assign var=key2 value="shipping_tel02"}-->
                        <!--{assign var=key3 value="shipping_tel03"}-->
                        <input type="hidden" name="<!--{$key1}-->[<!--{$shipping_index}-->]" value="<!--{$arrShipping[$key1]|h}-->" />
                        <input type="hidden" name="<!--{$key2}-->[<!--{$shipping_index}-->]" value="<!--{$arrShipping[$key2]|h}-->" />
                        <input type="hidden" name="<!--{$key3}-->[<!--{$shipping_index}-->]" value="<!--{$arrShipping[$key3]|h}-->" />
                        <!--{assign var=key1 value="shipping_zip01"}-->
                        <!--{assign var=key2 value="shipping_zip02"}-->
                        <input type="hidden" name="<!--{$key1}-->[<!--{$shipping_index}-->]" value="<!--{$arrShipping[$key1]|h}-->" />
                        <input type="hidden" name="<!--{$key2}-->[<!--{$shipping_index}-->]" value="<!--{$arrShipping[$key2]|h}-->" />
                        <!--{assign var=key value="shipping_addr01"}-->
                        <input type="hidden" name="<!--{$key}-->[<!--{$shipping_index}-->]" value="<!--{$arrShipping[$key]|h}-->" />
                        <!--{assign var=key value="shipping_addr02"}-->
                        <input type="hidden" name="<!--{$key}-->[<!--{$shipping_index}-->]" value="<!--{$arrShipping[$key]|h}-->" />
                        <!--{assign var=key value="shipping_addr03"}-->
                        <input type="hidden" name="<!--{$key}-->[<!--{$shipping_index}-->]" value="<!--{$arrShipping[$key]|h}-->" />
        <!--{/foreach}-->
        <!--▲お届け先情報ここまで-->

        <a name="deliv"></a>
        <table class="form">
            <tr>
                <th>配送業者<span class="attention"> *</span><br /><span class="attention">(配送業者の変更に伴う送料の変更は手動にてお願いします。)</span></th>
                <td>
                    <!--{assign var=key value="deliv_id"}-->
                    <span class="attention"><!--{$arrErr[$key]}--></span>
                    <select name="<!--{$key}-->" style="<!--{$arrErr[$key]|sfGetErrorColor}-->" onchange="eccube.setModeAndSubmit('deliv','anchor_key','deliv');">
                        <option value="" selected="">選択してください</option>
                        <!--{html_options options=$arrDeliv selected=$arrForm[$key].value}-->
                    </select>
                </td>
            </tr>
            <tr>
                <th>お支払方法<span class="attention"> *</span><br /><span class="attention">(お支払方法の変更に伴う手数料の変更は手動にてお願いします。)</span></th>
                <td>
                    <!--{assign var=key value="payment_id"}-->
                    <span class="attention"><!--{$arrErr[$key]}--></span>
                    <select name="<!--{$key}-->" style="<!--{$arrErr[$key]|sfGetErrorColor}-->" onchange="eccube.setModeAndSubmit('payment','anchor_key','deliv');">
                        <option value="" selected="">選択してください</option>
                        <!--{html_options options=$arrPayment selected=$arrForm[$key].value}-->
                    </select>
                </td>
            </tr>

            <!--{if !empty($arrForm.payment_info)}-->
            <tr>
                <th><!--{$arrForm.payment_type}-->情報</th>
                <td>
                    <!--{foreach key=key item=item from=$arrForm.payment_info}-->
                    <!--{if $key != "title"}--><!--{if $item.name != ""}--><!--{$item.name}-->：<!--{/if}--><!--{$item.value}--><br/><!--{/if}-->
                    <!--{/foreach}-->
                </td>
            </tr>
            <!--{/if}-->

            <tr>
                <th>メモ</th>
                <td>
                    <!--{assign var=key value="note"}-->
                    <span class="attention"><!--{$arrErr[$key]}--></span>
                    <textarea name="<!--{$key}-->" maxlength="<!--{$arrForm[$key].length}-->" cols="80" rows="6" class="area80" style="<!--{$arrErr[$key]|sfGetErrorColor}-->" ><!--{"\n"}--><!--{$arrForm[$key].value|h}--></textarea>
                </td>
            </tr>
        </table>
        <!--▲受注商品情報ここまで-->

        <div class="btn-area">
            <ul>
                <!--{if count($arrSearchHidden) > 0}-->
                <li><a class="btn-action" href="javascript:;" onclick="eccube.changeAction('<!--{$smarty.const.ADMIN_ORDER_URLPATH}-->'); eccube.setModeAndSubmit('search','',''); return false;"><span class="btn-prev">検索画面に戻る</span></a></li>
                <!--{/if}-->
                <li><a class="btn-action" href="javascript:;" onclick="return fnFormConfirm(); return false;"><span class="btn-next">この内容で登録する</span></a></li>
            </ul>
        </div>
    </div>
    <div id="multiple"></div>
</form>
