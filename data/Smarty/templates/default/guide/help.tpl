<section>
    <header class="l-header__inner">
        <a href="<!--{$smarty.const.TOP_URL}-->user_data/other.php" aria-label="戻る" class="c-btn--header-nav"></a>
        <h1 class="c-header-title">よくある質問</h1>
    </header>
    <div class="chain-help">
        <h2 class="c-heading--lg">Chainについて</h2>
        <dl>
            <dt>SNSや他サービスに誘導してもいいですか？</dt>
            <dd>外部サービスへの誘導は禁止されています。<br>
                <a href="<!--{$smarty.const.TOP_URL}-->terms/prohibited_activities.php">禁止されている行為</a>を参照してください。</dd>
        </dl>
        <dl>
            <dt>Chain成立とはなんですか？</dt>
            <dd>Chainでは交換が成立したことを「Chain成立」と呼んでいます。</dd>
        </dl>
        <h2 class="c-heading--lg">会員について</h2>
        <dl>
            <dt>Chainに参加するにはどうしたらいいですか？</dt>
            <dd>会員登録をしてクレジットカード情報やお名前、お住まいの住所、電話番号を入力してください。</dd>
        </dl>
        <dl>
            <dt>メールマガジンを受診したくないです。</dt>
            <dd><a href="<!--{$smarty.const.TOP_URL}-->mypage/change.php">アカウント</a>情報を編集して、「メールマガジン送付」項目の「希望しない」を選択してください。</dd>
        </dl>
        <dl>
            <dt>退会したいのですが？</dt>
            <dd>Chainでは交換が完了したことを確認してから退会用のURLをお送りしています。<br>
                <a herf="<!--{$smarty.const.TOP_URL}-->contact/">お問い合わせ</a>から退会希望の旨をご連絡ください。<br>
                2〜3営業日程度で大会用のURLをお送りいたします。
            </dd>
        </dl>
        <h2 class="c-heading--lg">お支払いについて</h2>
        <dl>
            <dt>お支払い方法は何が利用できますか？</dt>
            <dd>クレジットカード決済のみとなっております。<br>
            <a href="<!--{$smarty.const.TOP_URL}-->mypage/card_info.php">支払い情報</a>から登録してください。</dd>
        </dl>
        <h2 class="c-heading--lg">アイテムについて</h2>
        <dl>
            <dt>どんなアイテムを出品したらいいですか？</dt>
            <dd>不要になった物で、まだ使える物を出品してください。</dd>
        </dl>
        <dl>
            <dt>出品したのにアイテム一覧に表示されません。</dt>
            <dd>出品したアイテムが「非公開」になっている可能性があります。<br>
                <a herf="<!--{$smarty.const.TOP_URL}-->mypage/myitem/myitem_list.php">マイページ</a>でご確認ください。</dd>
        </dl>
        <dl>
            <dt>出品したアイテムを削除したいです。</dt>
            <dd>基本的に出品したアイテムを削除することはできません。<br>
                「非公開」にしてアイテム一覧に表示されないようにしてください。</dd>
        </dl>
        <dl>
            <dt>「ほしい」が押せません。</dt>
            <dd>アイテムを出品しないと交換することができません。</dd>
        </dl>
        <dl>
            <dt>欲しいアイテムがないです。</dt>
            <dd>申し訳ありません。<br>
                Chainはまだ、スタートしたばかりのサービスなので、不要になったアイテムを出品して、欲しいアイテムが出品されるのをお待ちください。<br>
            Chain成立が早くできるよう改善していきます。</dd>
        </dl>
        <dl>
            <dt>「ほしい」されましたがどうしたらいいですか？</dt>
            <dd>ご自身が他のアイテムに対して「ほしい」したら、Chainが成立する可能性があります。<br>また、「交換確定」タブに表示されているアイテムを「ほしい」するとChain成立します。</dd>
        </dl>
        <dl>
            <dt>禁止アイテムはなんですか？</dt>
            <dd><a href="<!--{$smarty.const.TOP_URL}-->terms/prohibited_items.php">禁止されている出品物</a>を参照してください。</dd>
        </dl>
        <h2 class="c-heading--lg">Chain成立について</h2>
        <dl>
            <dt>「もうすぐ Chain が成立します」というメールが届きました。</dt>
            <dd>「ほしい」をした複数のアイテムで連鎖が繋がりました。<br>24時間以内に候補の中からどれか一つ欲しいアイテムを選んでください。</dd>
        </dl>
        <dl>
            <dt>Chain成立したらどうしたらいいですか？</dt>
            <dd><a herf="<!--{$smarty.const.TOP_URL}-->mypage/myitem/myitem_list.php">マイページ</a>でChain成立したアイテムを確認していただき、7日以内に成立した出品物をファミリーマートから発送してください。<br>発送方法は<a href="<!--{$smarty.const.TOP_URL}-->guide/flow.php">こちら</a>を参照してください。</dd>
        </dl>
        <dl>
            <dt>Chain成立したのに10日たっても物が届きません。</dt>
            <dd>相手に確認しますのでChainへお問い合わせください。<br>
                <a herf="<!--{$smarty.const.TOP_URL}-->contact/">お問い合わせ</a><br>
                <a herf="https://lin.ee/npYW8Kp" target="_blank">LINE</a>
            </dd>
        </dl>
        <dl>
            <dt>Chain成立をキャンセルしたいのですが</dt>
            <dd>基本的にキャンセルすることはできません。</dd>
        </dl>
        <dl>
            <dt>Chain成立した相手に個人情報を伝えたくないです。</dt>
            <dd>Chainはヤマト運輸の匿名配送で発送しますので、Chain成立した相手に個人情報が知られることはありません。</dd>
        </dl>
    </div>
</section>
<script>
    $(function(){
        $(".chain-help dt").on("click", function() {
            $(this).next().slideToggle("fast");

        });
    });
</script>