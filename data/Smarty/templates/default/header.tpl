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
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.    See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA    02111-1307, USA.
 *}-->

<!--▼HEADER-->
<!--{strip}-->

<header class="l-header__lower">
    <div class="l-header__logo_frame">
	<a href="<!--{if $tpl_login}--><!--{$smarty.const.TOP_URL}-->products/list.php?orderby=date<!--{else}--><!--{$smarty.const.HTTPS_URL}--><!--{/if}-->" class="l-header__logo">
        <svg
      width="110"
      height="53"
      viewBox="0 0 110 53"
      fill="none"
      xmlns="http://www.w3.org/2000/svg"
      title="Chain"
    >
      <path
        d="M4.02416 6.65427C6.69193 3.86767 10.3876 2.47734 15.1052 2.47734C17.8621 2.47734 20.2566 3.02396 22.2945 4.12316C24.3325 5.22235 25.3485 6.59486 25.3485 8.23473C25.3485 9.29234 25.0277 10.0944 24.38 10.653C23.7324 11.2115 22.9303 11.4907 21.9618 11.4907C21.2013 11.4907 20.1377 11.1996 18.7712 10.6114C17.4105 10.0231 16.0677 9.73201 14.7487 9.73201C12.4909 9.73201 10.7679 10.4272 9.57954 11.8175C8.39122 13.2078 7.79707 15.0081 7.79707 17.2065C7.79707 19.4049 8.39122 21.1993 9.57954 22.5955C10.7679 23.9859 12.4909 24.687 14.7487 24.687C16.0677 24.687 17.4105 24.3958 18.7712 23.8076C20.1318 23.2194 21.1953 22.9283 21.9618 22.9283C22.9303 22.9283 23.7383 23.2075 24.38 23.766C25.0217 24.3245 25.3485 25.1266 25.3485 26.1842C25.3485 27.8241 24.3325 29.1966 22.2945 30.2958C20.2566 31.395 17.8621 31.9476 15.1052 31.9476C10.3876 31.9476 6.69193 30.5572 4.02416 27.7706C1.35639 24.984 0.0195312 21.4666 0.0195312 17.2184C0.0195313 12.9583 1.35639 9.44087 4.02416 6.65427ZM46.2094 12.0433C44.8013 10.4153 42.894 9.60129 40.4936 9.60129C38.2061 9.60129 36.388 10.3202 35.0392 11.7581V4.41429C35.0392 3.35669 34.7124 2.50111 34.0529 1.84159C33.3934 1.18208 32.5378 0.849344 31.4802 0.849344C30.4523 0.849344 29.6086 1.18208 28.9491 1.84159C28.2896 2.50111 27.9569 3.35669 27.9569 4.41429V27.9845C27.9569 29.0421 28.2836 29.8977 28.9491 30.5572C29.6086 31.2168 30.4642 31.5495 31.5218 31.5495C32.5497 31.5495 33.3934 31.2227 34.0529 30.5572C34.7124 29.8977 35.0392 29.0421 35.0392 27.9845V19.7198C35.0392 18.6622 35.3244 17.8244 35.8948 17.1946C36.4652 16.5648 37.2198 16.2499 38.1586 16.2499C39.0973 16.2499 39.846 16.5648 40.3985 17.1946C40.957 17.8244 41.2363 18.6682 41.2363 19.7198V27.9845C41.2363 29.0421 41.5631 29.8977 42.2226 30.5572C42.8821 31.2168 43.7377 31.5495 44.7953 31.5495C45.8232 31.5495 46.6669 31.2227 47.3264 30.5572C47.9859 29.8977 48.3187 29.0421 48.3187 27.9845V18.7513C48.3187 15.9053 47.6176 13.6713 46.2094 12.0433ZM72.798 11.0332C72.1385 10.3737 71.2829 10.041 70.2253 10.041C68.7577 10.041 67.7061 10.6292 67.0584 11.7997C65.6503 10.3321 63.7311 9.60129 61.2951 9.60129C58.4194 9.60129 56.0427 10.6648 54.1474 12.7919C52.2579 14.919 51.3132 17.5927 51.3132 20.819C51.3132 24.1285 52.2876 26.82 54.2365 28.8877C56.1853 30.9553 58.5382 31.9892 61.2951 31.9892C63.642 31.9892 65.5433 31.2108 67.0109 29.6601C67.5991 30.9197 68.6686 31.5495 70.2193 31.5495C71.2769 31.5495 72.1325 31.2227 72.792 30.5572C73.4516 29.8977 73.7843 29.0421 73.7843 27.9845V13.6059C73.7843 12.5483 73.4575 11.6927 72.798 11.0332ZM65.478 24.0453C64.6877 24.9128 63.7014 25.3405 62.5309 25.3405C61.3545 25.3405 60.3741 24.9068 59.5839 24.0453C58.7937 23.1778 58.3956 22.1024 58.3956 20.8131C58.3956 19.5237 58.7937 18.4364 59.5839 17.5571C60.3741 16.6777 61.3545 16.238 62.5309 16.238C63.7014 16.238 64.6818 16.6777 65.478 17.5571C66.2682 18.4364 66.6663 19.5237 66.6663 20.8131C66.6603 22.1024 66.2682 23.1838 65.478 24.0453ZM84.2415 1.57422C83.4512 0.79587 82.5125 0.409668 81.4252 0.409668C80.3379 0.409668 79.411 0.79587 78.6326 1.57422C77.8543 2.35256 77.4681 3.29728 77.4681 4.40835C77.4681 5.51943 77.8543 6.45819 78.6326 7.22466C79.411 7.98518 80.3379 8.37139 81.4252 8.37139C82.5422 8.37139 83.4869 7.98518 84.2593 7.20683C85.0377 6.42849 85.4239 5.5016 85.4239 4.41429C85.4298 3.29728 85.0317 2.35256 84.2415 1.57422ZM84.0038 30.5572C84.6633 29.8977 84.9901 29.0421 84.9901 27.9845V13.6059C84.9901 12.5483 84.6633 11.6927 84.0038 11.0332C83.3443 10.3737 82.4887 10.041 81.4311 10.041C80.4032 10.041 79.5654 10.3678 78.9 11.0332C78.2405 11.6927 77.9137 12.5483 77.9137 13.6059V27.9845C77.9137 29.0362 78.2405 29.8977 78.9 30.5572C79.5595 31.2168 80.4151 31.5495 81.4727 31.5495C82.5006 31.5436 83.3443 31.2168 84.0038 30.5572ZM107.336 12.0433C105.928 10.4153 104.021 9.60129 101.621 9.60129C99.0717 9.60129 97.1644 10.4391 95.9048 12.1086C95.3463 10.7302 94.2471 10.041 92.6072 10.041C91.5793 10.041 90.7356 10.3678 90.0761 11.0332C89.4166 11.6927 89.0839 12.5483 89.0839 13.6059V27.9845C89.0839 29.0421 89.4107 29.8977 90.0761 30.5572C90.7356 31.2168 91.5912 31.5495 92.6488 31.5495C93.6767 31.5495 94.5204 31.2227 95.1799 30.5572C95.8394 29.8977 96.1662 29.0421 96.1662 27.9845V19.7198C96.1662 18.6622 96.4514 17.8244 97.0218 17.1946C97.5922 16.5648 98.3468 16.2499 99.2856 16.2499C100.224 16.2499 100.973 16.5648 101.526 17.1946C102.084 17.8244 102.363 18.6682 102.363 19.7198V27.9845C102.363 29.0421 102.69 29.8977 103.35 30.5572C104.009 31.2168 104.865 31.5495 105.922 31.5495C106.95 31.5495 107.794 31.2227 108.453 30.5572C109.113 29.8977 109.446 29.0421 109.446 27.9845V18.7513C109.446 15.9053 108.739 13.6713 107.336 12.0433ZM57.4865 52.7728C72.7683 52.7728 79.4466 43.1415 79.7199 42.7316C80.7775 41.1689 80.3616 39.0418 78.799 37.9842C77.2364 36.9266 75.1093 37.3425 74.0517 38.9052C74.0041 38.9765 69.1736 45.9341 57.4865 45.9341C46.6134 45.9341 40.3569 38.9171 40.0717 38.5903C38.8418 37.1643 36.6969 36.9979 35.2591 38.2159C33.8212 39.4399 33.6489 41.5967 34.8729 43.0346C35.2175 43.4386 43.3396 52.7728 57.4865 52.7728Z"
        fill="black"
      />
    </svg></a>
    </div>

        <div class="u-mb--4">
            <input type="image" class="c-onboarding__show-btn gundam_campaign_banner" src="<!--{$TPL_URLPATH}-->img/banner/gundam_campaign.png" alt="ガンプラキャンペーンのバナー">
            <div class="c-onboarding">
                <ol>
                    <li class="--active">
                        <h2><img src="<!--{$TPL_URLPATH}-->img/banner/gundam_campaign_title.png" alt="ガンプラ祭り！のタイトル"></h2>
                        <p class="gundam_campaign_50">先着50名！</p>
                        <p><span class="gundam_campaign_text">ガンプラを出品して、「ほしい」を押したら、Amazonギフト券500円プレゼント！！</span></p>
                        <div class="gundam_campaign_howto">
                            <dl class="gundam_campaign_howto1">
                                <dt><img src="<!--{$TPL_URLPATH}-->img/banner/gundam_campaign_howto1.png" alt="ガンプラを出品するの画像"></dt>
                                <dd>①HG、MG、RGの<span class="attention_">ガンプラ</span>を出品する</dd>
                            </dl>
                            <dl class="gundam_campaign_howto2">
                                <dt><img src="<!--{$TPL_URLPATH}-->img/banner/gundam_campaign_howto2.png" alt="他の人が出品しているアイテムに「ほしい」を押すの画像"></dt>
                                <dd>②他の人が出品しているアイテムに「ほしい」を押す。</dd>
                            </dl>
                            <dl class="gundam_campaign_howto3">
                                <dt><img src="<!--{$TPL_URLPATH}-->img/banner/gundam_campaign_howto3.png" alt="Amazonアカウントをお問い合わせから連絡するの画像"></dt>
                                <dd>③Amazonアカウントのメールアドレスを<a href="<!--{$smarty.const.HTTPS_URL}-->contact/">お問い合わせ</a>から連絡する。</dd>
                            </dl>
                        </div>
                    </li>
                    <li>
                        <h2><img src="<!--{$TPL_URLPATH}-->img/banner/gundam_campaign_title.png" alt="ガンプラ祭り！のタイトル"></h2>
                        <p>＼キャンペーン内容／</p>
                        <dl class="gundam_campaign_cation">
                            <dt>2023年4月20日からの「ほしい」がキャンペーン対象になります。</dt>
                            <dt>2023年4月20日以前に出品しているガンプラも対象になります。</dt>
                            <dt>ガンプラを出品して「ほしい」を押したユーザーが50名になったらキャンペーン終了です。</dt>
                            <dt>「ほしい」を押してから1ヶ月後にChainからメールでご連絡した後、Amazonギフト券500円分を差し上げます。</dt>
                            <dt>おひとり様一度限りのプレゼントになります。</dt>
                            <dt>対象の出品アイテムは、HG、MG、RGのガンプラになります。</dt>
                            <dt>「ほしい」を押して1ヶ月経過前に、アイテムの非表示や「ほしい」の取り消しを行った場合は、キャンペーンの対象になりません。</dt>
                        </dl>
                    </li>
                </ol>

                <div class="c-onboarding__btn">
                    <button type="button" class="c-onboarding__prev-btn --hidden">前へ</button>
                    <button type="button" class="c-onboarding__next-btn">次へ</button>
                    <button type="button" class="c-onboarding__close-btn --hidden">閉じる</button>
                </div>
            </div>
            <div class="c-onboarding__bg"></div>
        </div>
    <div class="l-header__right">
		<a href="<!--{$smarty.const.TOP_URL}-->guide/guide.php" class="l-header__usage" rel="noopener">ガイド</a>
		<!--{* <button type="button" class="l-header__btn c-prohibited__btn">禁止アイテム</button> *}-->
	</div>
</header>
<!--{ *
<!--{assign var=card_info value="`$smarty.const.ROOT_URLPATH`mypage/card_info.php"}-->
<!--{if $tpl_login && $smarty.session.unregistered_card && $smarty.server.PHP_SELF!=$card_info}-->
    <div class="c-alert--wrapper">
        <a href="<!--{$smarty.const.HTTPS_URL|h}-->mypage/card_info.php" class="c-alert--yellow">カード情報を入力してください</a>
    </div>
<!--{/if}-->
*}-->
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

    <p><a href="<!--{$smarty.const.TOP_URL}-->terms/prohibited_items.php" class="c-btn--default">詳しく確認する</a></p>
    <p>運営事務局で禁止出品物に当てはまると判断したものは、弊社の判断で掲載を取りやめる、商品情報を削除するものとします。</p>
        <button type="button" class="c-prohibited__close-btn c-btn--default">閉じる</button>
    </div>
    <div class="c-onboarding__bg"></div>
<!--{/strip}-->
<script>
$('.c-prohibited__btn').on('click', function(){
    $('.c-prohibited__content').fadeIn();
    $('.c-onboarding__bg').fadeIn();
    $('.c-onboarding__bg,.c-prohibited__close-btn').on('click', function(){
        $('.c-prohibited__content').fadeOut();
    $('.c-onboarding__bg').fadeOut();
    })
})
$('.c-alert--gray .close-btn').on('click', function(){
    $('.c-alert--gray').fadeOut();
})
$('.c-onboarding__show-btn').on('click', function(){
    $('.c-onboarding').fadeIn();
    $('.c-onboarding__bg').fadeIn();
    $('body').addClass('--overflow-hidden');
    let $lists = $('.c-onboarding ol li');
    let $num = 0;

    $('.c-onboarding__next-btn').on('click', function(){
        if($num < ($lists.length - 1)) {
            ++$num
            $('.c-onboarding ol li').removeClass('--active')
            $('.c-onboarding ol li').eq($num).addClass('--active')

            if($num == 1) {
                $('.c-onboarding__prev-btn').removeClass('--hidden')
            }
            if($num === 3) {
                $(this).addClass('--hidden')
                $('.c-onboarding__close-btn').removeClass('--hidden')
            }
        }

    })
    $('.c-onboarding__prev-btn').on('click', function(){
        if($num !== 0) {
            --$num
            $('.c-onboarding ol li').removeClass('--active')
            $('.c-onboarding ol li').eq($num).addClass('--active')
            if($num == 0) {
                $('.c-onboarding__prev-btn').addClass('--hidden')
            }
            if($num < 4) {
                $('.c-onboarding__next-btn').removeClass('--hidden')
                $('.c-onboarding__close-btn').addClass('--hidden')
            }
        }
    })
    $('.c-onboarding__bg,.c-onboarding__close-btn').on('click', function(){
        $num = 0;
        $('.c-onboarding').fadeOut();
        $('.c-onboarding__bg').fadeOut();
        $('.c-onboarding ol li').removeClass('--active')
        $('.c-onboarding ol li').eq($num).addClass('--active')
        $('.c-onboarding__prev-btn').addClass('--hidden')
        $('.c-onboarding__next-btn').removeClass('--hidden')
        $('.c-onboarding__close-btn').addClass('--hidden')
        $('body').removeClass('--overflow-hidden');
    })
})
</script>

<!--▲HEADER-->
