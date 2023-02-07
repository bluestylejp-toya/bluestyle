<!--{printXMLDeclaration}--><!DOCTYPE html>
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

<html lang="ja">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=<!--{$smarty.const.CHAR_CODE}-->" />
<title><!--{if $tpl_subtitle|strlen >= 1}--><!--{$tpl_subtitle|h}--> / <!--{elseif $tpl_title|strlen >= 1}--><!--{$tpl_title|h}--> / <!--{/if}-->みんなで気持ちよく、連鎖で交換 <!--{$arrSiteInfo.shop_name|h}--></title>
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<!--{if $arrPageLayout.author|strlen >= 1}-->
    <meta name="author" content="<!--{$arrPageLayout.author|h}-->" />
<!--{/if}-->
<!--{if $arrPageLayout.description|strlen >= 1}-->
    <meta name="description" content="<!--{$arrPageLayout.description|h}-->" />
<!--{/if}-->
<!--{if $arrPageLayout.keyword|strlen >= 1}-->
    <meta name="keywords" content="<!--{$arrPageLayout.keyword|h}-->" />
<!--{/if}-->
<!--{if $arrPageLayout.meta_robots|strlen >= 1}-->
    <meta name="robots" content="<!--{$arrPageLayout.meta_robots|h}-->" />
<!--{/if}-->
<!-- Google Tag Manager -->
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','GTM-WMZZBG3');</script>
<link rel="shortcut icon" href="<!--{$TPL_URLPATH}-->img/common/favicon.ico" type="image/x-icon">
<link rel="apple-touch-icon" href="<!--{$TPL_URLPATH}-->img/common/apple-touch-icon.png" sizes="180x180">
<link rel="icon" type="image/png" href="<!--{$TPL_URLPATH}-->img/common/android-chrome-192x192.png" sizes="192x192">
<link rel="icon" href="<!--{$TPL_URLPATH}-->img/common/favicon.ico" />

    <!--{assign var=detail value="`$smarty.const.ROOT_URLPATH`products/detail.php"}-->
    <!--{if $smarty.server.PHP_SELF==$detail}-->
<meta property="og:title" content="<!--{$arrProduct.name|h|nl2br}--> - みんなで気持ちよく、連鎖で交換 <!--{$arrSiteInfo.shop_name|h}-->">
<meta property="og:description" content="<!--{$arrProduct['sub_title1']}-->">
<meta property="og:type" content="website">
<meta property="og:image" content="https://chain.gives<!--{$arrFile['sub_large_image1'].filepath|h}-->">
<meta property="twitter:card" content="summary_large_image">
<meta name="thumbnail" content="https://chain.gives<!--{$arrFile['sub_large_image1'].filepath|h}-->">
<meta name="twitter:image" content="https://chain.gives<!--{$arrFile['sub_large_image1'].filepath|h}-->">
<meta name="twitter:title" content="<!--{$arrProduct.name|h|nl2br}--> - みんなで気持ちよく、連鎖で交換 <!--{$arrSiteInfo.shop_name|h}-->">
<meta name="twitter:description" content="<!--{$arrProduct['sub_title1']}-->">
    <!--{else}-->
    <meta property="og:title" content="みんなで気持ちよく、連鎖で交換 <!--{$arrSiteInfo.shop_name|h}-->">
    <meta property="og:description" content="<!--{$arrPageLayout.description|h}-->">
    <meta property="og:type" content="website">
    <meta property="og:image" content="<!--{$smarty.const.HTTPS_URL}-->lp/assets/img/lp/ogp.png">
    <meta property="twitter:card" content="summary_large_image">
    <meta name="thumbnail" content="<!--{$smarty.const.HTTPS_URL}-->lp/assets/img/lp/ogp.png">
    <meta name="twitter:image" content="<!--{$smarty.const.HTTPS_URL}-->lp/assets/img/lp/ogp.png">
    <meta name="twitter:title" content="みんなで気持ちよく、連鎖で交換 <!--{$arrSiteInfo.shop_name|h}--><!--{if $tpl_subtitle|strlen >= 1}--> / <!--{$tpl_subtitle|h}--><!--{elseif $tpl_title|strlen >= 1}--> / <!--{$tpl_title|h}--><!--{/if}-->">
    <meta name="twitter:description" content="<!--{$arrPageLayout.description|h}-->">
    <!--{/if}-->

  <script type="application/ld+json">
  [
    {"@context":"http://schema.org",
    "@type":"WebSite",
    "inLanguage":"ja",
    "url":"<!--{$smarty.const.HTTPS_URL}-->",
    "name":"<!--{$arrSiteInfo.shop_name|h}-->",
    "author":[
      {
        "@type":"Organization",
        "name":"<!--{$arrSiteInfo.shop_name|h}-->",
        "description":"<!--{$arrPageLayout.description|h}-->",
        "url":"<!--{$smarty.const.HTTPS_URL}-->",
        "sameAs":[
          {
            "twitter":"chain_marketnet",
            "instagram":"chain2364",
            "line":"309jmrcc"
          }
        ]
      }
    ],
    "publisher":{
      "@type":"Organization",
      "name":"<!--{$arrSiteInfo.shop_name|h}-->",
      "description":"<!--{$arrPageLayout.description|h}-->",
      "logo":{
        "@type":"ImageObject",
        "url":"<!--{$smarty.const.HTTPS_URL}-->user_data/packages/default/img/common/android-chrome-192x192.png",
        "width":192,
        "height":192
        }
      },
      "image":"<!--{$smarty.const.HTTPS_URL}-->lp/assets/img/lp/ogp.png",
      "description":"<!--{$arrPageLayout.description|h}-->"
    }
  ]</script>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+JP:wght@400;500;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="<!--{$TPL_URLPATH}-->css/main.css" media="all" />
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<link rel="stylesheet" href="<!--{$TPL_URLPATH}-->css/chain_style.css" media="all" />
<!--<link rel="stylesheet" href="<!--{$TPL_URLPATH}-->js/main.js" differ/>-->


<!--{if $tpl_page_class_name === "LC_Page_Products_Detail"}-->
    <link rel="stylesheet" href="<!--{$smarty.const.ROOT_URLPATH}-->js/jquery.ui/theme/jquery.ui.core.css" type="text/css" media="all" />
    <link rel="stylesheet" href="<!--{$smarty.const.ROOT_URLPATH}-->js/jquery.ui/theme/jquery.ui.tooltip.css" type="text/css" media="all" />
    <link rel="stylesheet" href="<!--{$smarty.const.ROOT_URLPATH}-->js/jquery.ui/theme/jquery.ui.theme.css" type="text/css" media="all" />
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<!--{/if}-->
<link rel="alternate" type="application/rss+xml" title="RSS" href="<!--{$smarty.const.HTTP_URL}-->rss/<!--{$smarty.const.DIR_INDEX_PATH}-->" />

<script src="<!--{$smarty.const.ROOT_URLPATH}-->js/eccube.js"></script>

<script type="text/javascript">//<![CDATA[
    <!--{$tpl_javascript}-->
    $(function(){
        <!--{$tpl_onload}-->
    });
//]]></script>

<!--{strip}-->
    <!--{* ▼Head COLUMN*}-->
    <!--{if !empty($arrPageLayout.HeadNavi)}-->
        <!--{* ▼上ナビ *}-->
        <!--{foreach key=HeadNaviKey item=HeadNaviItem from=$arrPageLayout.HeadNavi}-->
            <!--{* ▼<!--{$HeadNaviItem.bloc_name}--> *}-->
            <!--{if $HeadNaviItem.php_path != ""}-->
                <!--{include_php_ex file=$HeadNaviItem.php_path items=$HeadNaviItem}-->
            <!--{else}-->
                <!--{include file=$HeadNaviItem.tpl_path}-->
            <!--{/if}-->
            <!--{* ▲<!--{$HeadNaviItem.bloc_name}--> *}-->
        <!--{/foreach}-->
        <!--{* ▲上ナビ *}-->
    <!--{/if}-->
    <!--{* ▲Head COLUMN*}-->
<!--{/strip}-->
    <!--{* pinterestサイト確認 *}-->
    <meta name="p:domain_verify" content="8b145e1c45d2979f0e33cca08c0314ec"/>

    <!-- Pinterest Tag -->
    <script>
        !function(e){if(!window.pintrk){window.pintrk = function () {
        window.pintrk.queue.push(Array.prototype.slice.call(arguments))};var
        n=window.pintrk;n.queue=[],n.version="3.0";var
        t=document.createElement("script");t.async=!0,t.src=e;var
        r=document.getElementsByTagName("script")[0];
        r.parentNode.insertBefore(t,r)}}("https://s.pinimg.com/ct/core.js");
        pintrk('load', '2613268448573', {em: '<user_email_address>'});
        pintrk('page');
    </script>
    <noscript>
        <img height="1" width="1" style="display:none;" alt=""
             src="https://ct.pinterest.com/v3/?event=init&tid=2613268448573&pd[em]=<hashed_email_address>&noscript=1" />
    </noscript>
    <!-- end Pinterest Tag -->
</head>

<!-- ▼BODY部 スタート -->
<!--{include file='./site_main.tpl'}-->
<!-- ▲BODY部 エンド -->

</html>
