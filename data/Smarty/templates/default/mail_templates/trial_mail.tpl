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
<!--{$arrForm.name01.value}-->様

<!--{$tpl_header}-->
書籍プレゼント申し込みを受付致しました。
確認して問題なければすぐに発送いたしますので、少々お待ちください。
書籍が届きましたら14日以内にChainへ出品して、欲しいアイテムに「ほしい」をお願いいたします。

■希望書籍のID
<!--{$arrForm.contents.value}-->

■お届け先の情報
お名前　：<!--{$arrForm.name01.value}--> <!--{$arrForm.name02.value}--> (<!--{$arrForm.kana01.value}--> <!--{$arrForm.kana02.value}-->) 様
郵便番号：<!--{if $arrForm.zip01.value && $arrForm.zip02.value}-->〒<!--{$arrForm.zip01.value}-->-<!--{$arrForm.zip02.value}--><!--{/if}-->

住所　　：<!--{$arrPref[$arrForm.pref.value]}--><!--{$arrForm.addr01.value}--><!--{$arrForm.addr02.value}--><!--{$arrForm.addr03.value}-->
電話番号：<!--{$arrForm.tel01.value}-->-<!--{$arrForm.tel02.value}-->-<!--{$arrForm.tel03.value}-->
メールアドレス：<!--{$arrForm.email.value}-->

※本メールは、<!--{$tpl_shopname}-->より、書籍プレゼントを希望をされた方にお送りしています。
もしお心当たりが無い場合は、 <!--{$tpl_infoemail}--> までご連絡いただければ幸いです。

<!--{$tpl_footer}-->
