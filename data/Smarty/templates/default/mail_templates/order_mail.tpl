<!--{*
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
 *}-->
<!--{$arrOrder.order_name01}--> <!--{$arrOrder.order_name02}--> 様

<!--{$tpl_header}-->
************************************************
　Chain 成立アイテム
************************************************

<!--{section name=cnt loop=$arrOrderDetail}-->
アイテム名: <!--{$arrOrderDetail[cnt].product_name}-->
<!--{/section}-->
<!--{* CHAIN-296
<!--{if strlen($tpl_target_id) >= 1}-->
<!--{$tpl_target_id}-->
<!--{/if}-->
*}-->

************************************************
　ここの住所に届きます
************************************************
　お名前　：<!--{$arrOrder.order_name01}--> <!--{$arrOrder.order_name02}-->　様
　郵便番号：〒<!--{$arrOrder.order_zip01}-->-<!--{$arrOrder.order_zip02}-->
　住所　　：<!--{$arrPref[$arrOrder.order_pref]}--><!--{$arrOrder.order_addr01}--><!--{$arrOrder.order_addr02}--><!--{$arrOrder.order_addr03}-->
　電話番号：<!--{$arrOrder.order_tel01}-->-<!--{$arrOrder.order_tel02}-->-<!--{$arrOrder.order_tel03}-->
<!--{$tpl_footer}-->
