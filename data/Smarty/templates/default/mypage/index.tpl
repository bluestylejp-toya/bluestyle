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

<section>
    <header class="c-profile-header">

        <!--{if strlen($tpl_profile_image) >= 1}-->
            <img src="<!--{$smarty.const.IMAGE_SAVE_URLPATH|h}-->../save_profile_image/<!--{$tpl_profile_image|h}-->" class="c-profile-header__img">
        <!--{else}-->
            <img src="<!--{$smarty.const.IMAGE_SAVE_URLPATH|h}--><!--{$tpl_profile_image|sfNoImageMainList|h}-->" class="c-profile-header__img">
        <!--{/if}-->
        <h1 class="c-profile-header__name"><!--{$tpl_nickname|h}--></h1>
    </header>
    <!--{if $tpl_navi != ""}-->
        <!--{include file=$tpl_navi}-->
    <!--{else}-->
        <!--{include file="`$smarty.const.TEMPLATE_REALDIR`mypage/navi.tpl"}-->
    <!--{/if}-->

</section>
