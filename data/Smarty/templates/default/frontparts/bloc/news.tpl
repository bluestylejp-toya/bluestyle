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

<!--{strip}-->
    <section>
        <div id="news_area">
            <header class="l-header__inner">
            <a href="<!--{$smarty.const.TOP_URL}-->other/" aria-label="戻る" class="c-btn--header-nav"></a>
            <h1 class="c-header-title">新着情報</h1>
        </header>
        <ul class="c-list--news">
            <!--{section name=data loop=$arrNews}-->
            <!--{assign var="date_array" value="-"|explode:$arrNews[data].cast_news_date}-->
                <li>

                    <time class="c-list--news__date"><!--{$date_array[0]}-->年<!--{$date_array[1]}-->月<!--{$date_array[2]}-->日</time>
                    <h3 class="c-list--news__title">
                        <!--{if $arrNews[data].news_url}--><a href="<!--{$arrNews[data].news_url}-->" <!--{if $arrNews[data].link_method eq "2"}--> target="_blank"<!--{/if}-->><!--{/if}-->
                            <!--{$arrNews[data].news_title|h|nl2br}--><!--{if $arrNews[data].news_url}--></a><!--{/if}-->
                    </h3>
                    <p class="c-list--news__body"><!--{$arrNews[data].news_comment|h|nl2br}--></p>
                </li>
            <!--{/section}-->
        </ul>
    </section>
<!--{/strip}-->
<script>
$('.c-list--news li').on('click', function(){
    $(this).find('p').slideToggle(200);
    $(this).toggleClass('--open');
})
</script>
