<section>
    <header class="l-header__inner u-mb--0">
        <a href="<!--{$smarty.const.TOP_URL}-->mypage/myitem/myitem_detail.php?product_id=<!--{$tpl_product_id|h}-->" aria-label="戻る" class="c-btn--header-nav"></a>
        <p class="c-header-title">送り状発行用QRコード</p>
    </header>
    <p class="c-message--gradient">発送してください</p>
    <p class="u-mb--2">ファミリーマートのファミポートで申込券をプリントし、30分以内にレジにお持ちください。</p>
    <div class="c-box__qr u-mb--2">
        <img src="data:image/png;base64,<!--{$qrBase64Image}-->">
    </div>
    <p><a href="<!--{$smarty.const.TOP_URL}-->guide/flow.php" class="c-btn--primary--outline">発送の流れ</a></p>
</section>
