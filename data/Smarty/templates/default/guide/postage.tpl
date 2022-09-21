<section>
    <header class="l-header__inner">
        <a href="<!--{$smarty.const.TOP_URL}-->olier/" aria-label="戻る" class="c-btn--header-nav"></a>
        <h1 class="c-header-title">支払い方法</h1>
    </header>
    <div class="chain-yamato-howto">
        <p>A4サイズは全国一律<span class="houwto_touch">385円</span>です。</p>
    <p><!--{$arrPref[$tpl_pref_id]|h}-->までかかる宅配便の送料になります。</p>
    </div>
    <p class="c-postage_table_small">（単位：円）</p>
    <!--{if $tpl_pref_id == 1}-->
    <div class="c-postage_table">
        <ul class="c-postage_table_title">
            <li>サイズ</li>
            <li>60</li>
            <li>80</li>
            <li>100</li>
            <li>120</li>
            <li>140</li>
            <li>160</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">北海道</li>
            <li>924</li>
            <li>1,144</li>
            <li>1,386</li>
            <li>1,606</li>
            <li>1,848</li>
            <li>2,068</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">北東北</li>
            <li>1,144</li>
            <li>1,364</li>
            <li>1,606</li>
            <li>1,826</li>
            <li>2,068</li>
            <li>2,288</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">南東北</li>
            <li>1,254</li>
            <li>1,474</li>
            <li>1,716</li>
            <li>1,936</li>
            <li>2,178</li>
            <li>2,398</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">関東</li>
            <li>1,364</li>
            <li>1,584</li>
            <li>1,826</li>
            <li>2,046</li>
            <li>2,288</li>
            <li>2,508</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">信越</li>
            <li>1,364</li>
            <li>1,584</li>
            <li>1,826</li>
            <li>2,046</li>
            <li>2,288</li>
            <li>2,508</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">北陸</li>
            <li>1,474</li>
            <li>1,694</li>
            <li>1,936</li>
            <li>2,156</li>
            <li>2,398</li>
            <li>2,618</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">中部</li>
            <li>1,474</li>
            <li>1,694</li>
            <li>1,936</li>
            <li>2,156</li>
            <li>2,398</li>
            <li>2,618</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">関西</li>
            <li>1,694</li>
            <li>1,914</li>
            <li>2,156</li>
            <li>2,376</li>
            <li>2,618</li>
            <li>2,838</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">中国</li>
            <li>1,804</li>
            <li>2,024</li>
            <li>2,266</li>
            <li>2,486</li>
            <li>2,728</li>
            <li>2,948</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">四国</li>
            <li>1,804</li>
            <li>2,024</li>
            <li>2,266</li>
            <li>2,486</li>
            <li>2,728</li>
            <li>2,948</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">九州</li>
            <li>2,024</li>
            <li>2,244</li>
            <li>2,486</li>
            <li>2,706</li>
            <li>2,948</li>
            <li>3,168</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">沖縄</li>
            <li>2,024</li>
            <li>2,574</li>
            <li>3,146</li>
            <li>3,696</li>
            <li>4,268</li>
            <li>4,818</li>
        </ul>
    </div>
    <!--{elseif $tpl_pref_id == 2 || $tpl_pref_id == 3 || $tpl_pref_id == 5}-->
    <div class="c-postage_table">
        <ul class="c-postage_table_title">
            <li>サイズ</li>
            <li>60</li>
            <li>80</li>
            <li>100</li>
            <li>120</li>
            <li>140</li>
            <li>160</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">北海道</li>
            <li>1,144</li>
            <li>1,364</li>
            <li>1,606</li>
            <li>1,826</li>
            <li>2,068</li>
            <li>2,288</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">北東北</li>
            <li>924</li>
            <li>1,144</li>
            <li>1,386</li>
            <li>1,606</li>
            <li>1,848</li>
            <li>2,068</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">南東北</li>
            <li>924</li>
            <li>1,144</li>
            <li>1,386</li>
            <li>1,606</li>
            <li>1,848</li>
            <li>2,068</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">関東</li>
            <li>1,034</li>
            <li>1,254</li>
            <li>1,496</li>
            <li>1,716</li>
            <li>1,958</li>
            <li>2,178</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">信越</li>
            <li>1,034</li>
            <li>1,254</li>
            <li>1,496</li>
            <li>1,716</li>
            <li>1,958</li>
            <li>2,178</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">北陸</li>
            <li>1,144</li>
            <li>1,364</li>
            <li>1,606</li>
            <li>1,826</li>
            <li>2,068</li>
            <li>2,288</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">中部</li>
            <li>1,144</li>
            <li>1,364</li>
            <li>1,606</li>
            <li>1,826</li>
            <li>2,068</li>
            <li>2,288</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">関西</li>
            <li>1,254</li>
            <li>1,474</li>
            <li>1,716</li>
            <li>1,936</li>
            <li>2,178</li>
            <li>2,398</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">中国</li>
            <li>1,364</li>
            <li>1,584</li>
            <li>1,826</li>
            <li>2,046</li>
            <li>2,288</li>
            <li>2,508</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">四国</li>
            <li>1,364</li>
            <li>1,584</li>
            <li>1,826</li>
            <li>2,046</li>
            <li>2,288</li>
            <li>2,508</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">九州</li>
            <li>1,584</li>
            <li>1,804</li>
            <li>2,046</li>
            <li>2,266</li>
            <li>2,508</li>
            <li>2,728</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">沖縄</li>
            <li>1,694</li>
            <li>2,244</li>
            <li>2,816</li>
            <li>3,366</li>
            <li>3,938</li>
            <li>4,488</li>
        </ul>
    </div>
    <!--{elseif $tpl_pref_id == 4 || $tpl_pref_id == 6 || $tpl_pref_id == 7}-->
    <div class="c-postage_table">
        <ul class="c-postage_table_title">
            <li>サイズ</li>
            <li>60</li>
            <li>80</li>
            <li>100</li>
            <li>120</li>
            <li>140</li>
            <li>160</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">北海道</li>
            <li>1,254</li>
            <li>1,474</li>
            <li>1,716</li>
            <li>1,936</li>
            <li>2,178</li>
            <li>2,398</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">北東北</li>
            <li>924</li>
            <li>1,144</li>
            <li>1,386</li>
            <li>1,606</li>
            <li>1,848</li>
            <li>2,068</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">南東北</li>
            <li>924</li>
            <li>1,144</li>
            <li>1,386</li>
            <li>1,606</li>
            <li>1,848</li>
            <li>2,068</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">関東</li>
            <li>1,034</li>
            <li>1,254</li>
            <li>1,496</li>
            <li>1,716</li>
            <li>1,958</li>
            <li>2,178</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">信越</li>
            <li>1,034</li>
            <li>1,254</li>
            <li>1,496</li>
            <li>1,716</li>
            <li>1,958</li>
            <li>2,178</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">北陸</li>
            <li>1,144</li>
            <li>1,364</li>
            <li>1,606</li>
            <li>1,826</li>
            <li>2,068</li>
            <li>2,288</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">中部</li>
            <li>1,144</li>
            <li>1,364</li>
            <li>1,606</li>
            <li>1,826</li>
            <li>2,068</li>
            <li>2,288</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">関西</li>
            <li>1,254</li>
            <li>1,474</li>
            <li>1,716</li>
            <li>1,936</li>
            <li>2,178</li>
            <li>2,398</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">中国</li>
            <li>1,364</li>
            <li>1,584</li>
            <li>1,826</li>
            <li>2,046</li>
            <li>2,288</li>
            <li>2,508</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">四国</li>
            <li>1,364</li>
            <li>1,584</li>
            <li>1,826</li>
            <li>2,046</li>
            <li>2,288</li>
            <li>2,508</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">九州</li>
            <li>1,584</li>
            <li>1,804</li>
            <li>2,046</li>
            <li>2,266</li>
            <li>2,508</li>
            <li>2,728</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">沖縄</li>
            <li>1,584</li>
            <li>2,134</li>
            <li>2,706</li>
            <li>3,256</li>
            <li>3,828</li>
            <li>4,378</li>
        </ul>
    </div>
    <!--{elseif $tpl_pref_id == 8 || $tpl_pref_id == 9 || $tpl_pref_id == 10 || $tpl_pref_id == 11 || $tpl_pref_id == 12 || $tpl_pref_id == 13 || $tpl_pref_id == 14 || $tpl_pref_id == 19}-->
    <div class="c-postage_table">
        <ul class="c-postage_table_title">
            <li>サイズ</li>
            <li>60</li>
            <li>80</li>
            <li>100</li>
            <li>120</li>
            <li>140</li>
            <li>160</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">北海道</li>
            <li>1,364</li>
            <li>1,584</li>
            <li>1,826</li>
            <li>2,046</li>
            <li>2,288</li>
            <li>2,508</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">北東北</li>
            <li>1,034</li>
            <li>1,254</li>
            <li>1,496</li>
            <li>1,716</li>
            <li>1,958</li>
            <li>2,178</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">南東北</li>
            <li>924</li>
            <li>1,144</li>
            <li>1,386</li>
            <li>1,606</li>
            <li>1,848</li>
            <li>2,068</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">関東</li>
            <li>924</li>
            <li>1,144</li>
            <li>1,386</li>
            <li>1,606</li>
            <li>1,848</li>
            <li>2,068</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">信越</li>
            <li>924</li>
            <li>1,144</li>
            <li>1,386</li>
            <li>1,606</li>
            <li>1,848</li>
            <li>2,068</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">北陸</li>
            <li>924</li>
            <li>1,144</li>
            <li>1,386</li>
            <li>1,606</li>
            <li>1,848</li>
            <li>2,068</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">中部</li>
            <li>924</li>
            <li>1,144</li>
            <li>1,386</li>
            <li>1,606</li>
            <li>1,848</li>
            <li>2,068</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">関西</li>
            <li>1,034</li>
            <li>1,254</li>
            <li>1,496</li>
            <li>1,716</li>
            <li>1,958</li>
            <li>2,178</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">中国</li>
            <li>1,144</li>
            <li>1,364</li>
            <li>1,606</li>
            <li>1,826</li>
            <li>2,068</li>
            <li>2,288</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">四国</li>
            <li>1,144</li>
            <li>1,364</li>
            <li>1,606</li>
            <li>1,826</li>
            <li>2,068</li>
            <li>2,288</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">九州</li>
            <li>1,364</li>
            <li>1,584</li>
            <li>1,826</li>
            <li>2,046</li>
            <li>2,288</li>
            <li>2,508</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">沖縄</li>
            <li>1,364</li>
            <li>1,914</li>
            <li>2,486</li>
            <li>3,036</li>
            <li>3,608</li>
            <li>4,158</li>
        </ul>
    </div>
    <!--{elseif $tpl_pref_id == 15 || $tpl_pref_id == 20}-->
    <div class="c-postage_table">
        <ul class="c-postage_table_title">
            <li>サイズ</li>
            <li>60</li>
            <li>80</li>
            <li>100</li>
            <li>120</li>
            <li>140</li>
            <li>160</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">北海道</li>
            <li>1,364</li>
            <li>1,584</li>
            <li>1,826</li>
            <li>2,046</li>
            <li>2,288</li>
            <li>2,508</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">北東北</li>
            <li>1,034</li>
            <li>1,254</li>
            <li>1,496</li>
            <li>1,716</li>
            <li>1,958</li>
            <li>2,178</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">南東北</li>
            <li>924</li>
            <li>1,144</li>
            <li>1,386</li>
            <li>1,606</li>
            <li>1,848</li>
            <li>2,068</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">関東</li>
            <li>924</li>
            <li>1,144</li>
            <li>1,386</li>
            <li>1,606</li>
            <li>1,848</li>
            <li>2,068</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">信越</li>
            <li>924</li>
            <li>1,144</li>
            <li>1,386</li>
            <li>1,606</li>
            <li>1,848</li>
            <li>2,068</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">北陸</li>
            <li>924</li>
            <li>1,144</li>
            <li>1,386</li>
            <li>1,606</li>
            <li>1,848</li>
            <li>2,068</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">中部</li>
            <li>924</li>
            <li>1,144</li>
            <li>1,386</li>
            <li>1,606</li>
            <li>1,848</li>
            <li>2,068</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">関西</li>
            <li>1,034</li>
            <li>1,254</li>
            <li>1,496</li>
            <li>1,716</li>
            <li>1,958</li>
            <li>2,178</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">中国</li>
            <li>1,144</li>
            <li>1,364</li>
            <li>1,606</li>
            <li>1,826</li>
            <li>2,068</li>
            <li>2,288</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">四国</li>
            <li>1,144</li>
            <li>1,364</li>
            <li>1,606</li>
            <li>1,826</li>
            <li>2,068</li>
            <li>2,288</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">九州</li>
            <li>1,364</li>
            <li>1,584</li>
            <li>1,826</li>
            <li>2,046</li>
            <li>2,288</li>
            <li>2,508</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">沖縄</li>
            <li>1,474</li>
            <li>2,024</li>
            <li>2,596</li>
            <li>3,146</li>
            <li>3,718</li>
            <li>4,268</li>
        </ul>
    </div>
    <!--{elseif $tpl_pref_id == 16 || $tpl_pref_id == 17 || $tpl_pref_id == 18}-->
    <div class="c-postage_table">
        <ul class="c-postage_table_title">
            <li>サイズ</li>
            <li>60</li>
            <li>80</li>
            <li>100</li>
            <li>120</li>
            <li>140</li>
            <li>160</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">北海道</li>
            <li>1,474</li>
            <li>1,694</li>
            <li>1,936</li>
            <li>2,156</li>
            <li>2,398</li>
            <li>2,618</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">北東北</li>
            <li>1,144</li>
            <li>1,364</li>
            <li>1,606</li>
            <li>1,826</li>
            <li>2,068</li>
            <li>2,288</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">南東北</li>
            <li>1,034</li>
            <li>1,254</li>
            <li>1,496</li>
            <li>1,716</li>
            <li>1,958</li>
            <li>2,178</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">関東</li>
            <li>924</li>
            <li>1,144</li>
            <li>1,386</li>
            <li>1,606</li>
            <li>1,848</li>
            <li>2,068</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">信越</li>
            <li>924</li>
            <li>1,144</li>
            <li>1,386</li>
            <li>1,606</li>
            <li>1,848</li>
            <li>2,068</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">北陸</li>
            <li>924</li>
            <li>1,144</li>
            <li>1,386</li>
            <li>1,606</li>
            <li>1,848</li>
            <li>2,068</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">中部</li>
            <li>924</li>
            <li>1,144</li>
            <li>1,386</li>
            <li>1,606</li>
            <li>1,848</li>
            <li>2,068</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">関西</li>
            <li>924</li>
            <li>1,144</li>
            <li>1,386</li>
            <li>1,606</li>
            <li>1,848</li>
            <li>2,068</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">中国</li>
            <li>1,034</li>
            <li>1,254</li>
            <li>1,496</li>
            <li>1,716</li>
            <li>1,958</li>
            <li>2,178</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">四国</li>
            <li>1,034</li>
            <li>1,254</li>
            <li>1,496</li>
            <li>1,716</li>
            <li>1,958</li>
            <li>2,178</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">九州</li>
            <li>1,144</li>
            <li>1,364</li>
            <li>1,606</li>
            <li>1,826</li>
            <li>2,068</li>
            <li>2,288</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">沖縄</li>
            <li>1,474</li>
            <li>2,024</li>
            <li>2,596</li>
            <li>3,146</li>
            <li>3,718</li>
            <li>4,268</li>
        </ul>
    </div>
    <!--{elseif $tpl_pref_id == 21 || $tpl_pref_id == 22 || $tpl_pref_id == 23 || $tpl_pref_id == 24}-->
    <div class="c-postage_table">
        <ul class="c-postage_table_title">
            <li>サイズ</li>
            <li>60</li>
            <li>80</li>
            <li>100</li>
            <li>120</li>
            <li>140</li>
            <li>160</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">北海道</li>
            <li>1,694</li>
            <li>1,914</li>
            <li>2,156</li>
            <li>2,376</li>
            <li>2,618</li>
            <li>2,838</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">北東北</li>
            <li>1,254</li>
            <li>1,474</li>
            <li>1,716</li>
            <li>1,936</li>
            <li>2,178</li>
            <li>2,398</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">南東北</li>
            <li>1,144</li>
            <li>1,364</li>
            <li>1,606</li>
            <li>1,826</li>
            <li>2,068</li>
            <li>2,288</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">関東</li>
            <li>1,034</li>
            <li>1,254</li>
            <li>1,496</li>
            <li>1,716</li>
            <li>1,958</li>
            <li>2,178</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">信越</li>
            <li>1,034</li>
            <li>1,254</li>
            <li>1,496</li>
            <li>1,716</li>
            <li>1,958</li>
            <li>2,178</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">北陸</li>
            <li>924</li>
            <li>1,144</li>
            <li>1,386</li>
            <li>1,606</li>
            <li>1,848</li>
            <li>2,068</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">中部</li>
            <li>924</li>
            <li>1,144</li>
            <li>1,386</li>
            <li>1,606</li>
            <li>1,848</li>
            <li>2,068</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">関西</li>
            <li>924</li>
            <li>1,144</li>
            <li>1,386</li>
            <li>1,606</li>
            <li>1,848</li>
            <li>2,068</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">中国</li>
            <li>924</li>
            <li>1,144</li>
            <li>1,386</li>
            <li>1,606</li>
            <li>1,848</li>
            <li>2,068</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">四国</li>
            <li>924</li>
            <li>1,144</li>
            <li>1,386</li>
            <li>1,606</li>
            <li>1,848</li>
            <li>2,068</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">九州</li>
            <li>1,034</li>
            <li>1,254</li>
            <li>1,496</li>
            <li>1,716</li>
            <li>1,958</li>
            <li>2,178</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">沖縄</li>
            <li>1,364</li>
            <li>1,914</li>
            <li>2,486</li>
            <li>3,036</li>
            <li>3,608</li>
            <li>4,158</li>
        </ul>
    </div>
    <!--{elseif $tpl_pref_id == 25 || $tpl_pref_id == 26 || $tpl_pref_id == 27 || $tpl_pref_id == 28 || $tpl_pref_id == 29 || $tpl_pref_id == 30}-->
    <div class="c-postage_table">
        <ul class="c-postage_table_title">
            <li>サイズ</li>
            <li>60</li>
            <li>80</li>
            <li>100</li>
            <li>120</li>
            <li>140</li>
            <li>160</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">北海道</li>
            <li>1,694</li>
            <li>1,914</li>
            <li>2,156</li>
            <li>2,376</li>
            <li>2,618</li>
            <li>2,838</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">北東北</li>
            <li>1,254</li>
            <li>1,474</li>
            <li>1,716</li>
            <li>1,936</li>
            <li>2,178</li>
            <li>2,398</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">南東北</li>
            <li>1,144</li>
            <li>1,364</li>
            <li>1,606</li>
            <li>1,826</li>
            <li>2,068</li>
            <li>2,288</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">関東</li>
            <li>1,034</li>
            <li>1,254</li>
            <li>1,496</li>
            <li>1,716</li>
            <li>1,958</li>
            <li>2,178</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">信越</li>
            <li>1,034</li>
            <li>1,254</li>
            <li>1,496</li>
            <li>1,716</li>
            <li>1,958</li>
            <li>2,178</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">北陸</li>
            <li>924</li>
            <li>1,144</li>
            <li>1,386</li>
            <li>1,606</li>
            <li>1,848</li>
            <li>2,068</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">中部</li>
            <li>924</li>
            <li>1,144</li>
            <li>1,386</li>
            <li>1,606</li>
            <li>1,848</li>
            <li>2,068</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">関西</li>
            <li>924</li>
            <li>1,144</li>
            <li>1,386</li>
            <li>1,606</li>
            <li>1,848</li>
            <li>2,068</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">中国</li>
            <li>924</li>
            <li>1,144</li>
            <li>1,386</li>
            <li>1,606</li>
            <li>1,848</li>
            <li>2,068</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">四国</li>
            <li>924</li>
            <li>1,144</li>
            <li>1,386</li>
            <li>1,606</li>
            <li>1,848</li>
            <li>2,068</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">九州</li>
            <li>1,034</li>
            <li>1,254</li>
            <li>1,496</li>
            <li>1,716</li>
            <li>1,958</li>
            <li>2,178</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">沖縄</li>
            <li>1,364</li>
            <li>1,914</li>
            <li>2,486</li>
            <li>3,036</li>
            <li>3,608</li>
            <li>4,158</li>
        </ul>
    </div>
    <!--{elseif $tpl_pref_id == 31 || $tpl_pref_id == 32 || $tpl_pref_id == 33 || $tpl_pref_id == 34 || $tpl_pref_id == 35}-->
    <div class="c-postage_table">
        <ul class="c-postage_table_title">
            <li>サイズ</li>
            <li>60</li>
            <li>80</li>
            <li>100</li>
            <li>120</li>
            <li>140</li>
            <li>160</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">北海道</li>
            <li>1,804</li>
            <li>2,024</li>
            <li>2,266</li>
            <li>2,486</li>
            <li>2,728</li>
            <li>2,948</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">北東北</li>
            <li>1,364</li>
            <li>1,584</li>
            <li>1,826</li>
            <li>2,046</li>
            <li>2,288</li>
            <li>2,508</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">南東北</li>
            <li>1,364</li>
            <li>1,584</li>
            <li>1,826</li>
            <li>2,046</li>
            <li>2,288</li>
            <li>2,508</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">関東</li>
            <li>1,144</li>
            <li>1,364</li>
            <li>1,606</li>
            <li>1,826</li>
            <li>2,068</li>
            <li>2,288</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">信越</li>
            <li>1,144</li>
            <li>1,364</li>
            <li>1,606</li>
            <li>1,826</li>
            <li>2,068</li>
            <li>2,288</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">北陸</li>
            <li>1,034</li>
            <li>1,254</li>
            <li>1,496</li>
            <li>1,716</li>
            <li>1,958</li>
            <li>2,178</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">中部</li>
            <li>1,034</li>
            <li>1,254</li>
            <li>1,496</li>
            <li>1,716</li>
            <li>1,958</li>
            <li>2,178</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">関西</li>
            <li>924</li>
            <li>1,144</li>
            <li>1,386</li>
            <li>1,606</li>
            <li>1,848</li>
            <li>2,068</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">中国</li>
            <li>924</li>
            <li>1,144</li>
            <li>1,386</li>
            <li>1,606</li>
            <li>1,848</li>
            <li>2,068</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">四国</li>
            <li>924</li>
            <li>1,144</li>
            <li>1,386</li>
            <li>1,606</li>
            <li>1,848</li>
            <li>2,068</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">九州</li>
            <li>924</li>
            <li>1,144</li>
            <li>1,386</li>
            <li>1,606</li>
            <li>1,848</li>
            <li>2,068</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">沖縄</li>
            <li>1,364</li>
            <li>1,914</li>
            <li>2,486</li>
            <li>3,036</li>
            <li>3,608</li>
            <li>4,158</li>
        </ul>
    </div>
    <!--{elseif $tpl_pref_id == 36 || $tpl_pref_id == 37 || $tpl_pref_id == 38 || $tpl_pref_id == 39}-->
    <div class="c-postage_table">
        <ul class="c-postage_table_title">
            <li>サイズ</li>
            <li>60</li>
            <li>80</li>
            <li>100</li>
            <li>120</li>
            <li>140</li>
            <li>160</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">北海道</li>
            <li>1,804</li>
            <li>2,024</li>
            <li>2,266</li>
            <li>2,486</li>
            <li>2,728</li>
            <li>2,948</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">北東北</li>
            <li>1,364</li>
            <li>1,584</li>
            <li>1,826</li>
            <li>2,046</li>
            <li>2,288</li>
            <li>2,508</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">南東北</li>
            <li>1,364</li>
            <li>1,584</li>
            <li>1,826</li>
            <li>2,046</li>
            <li>2,288</li>
            <li>2,508</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">関東</li>
            <li>1,144</li>
            <li>1,364</li>
            <li>1,606</li>
            <li>1,826</li>
            <li>2,068</li>
            <li>2,288</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">信越</li>
            <li>1,144</li>
            <li>1,364</li>
            <li>1,606</li>
            <li>1,826</li>
            <li>2,068</li>
            <li>2,288</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">北陸</li>
            <li>1,034</li>
            <li>1,254</li>
            <li>1,496</li>
            <li>1,716</li>
            <li>1,958</li>
            <li>2,178</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">中部</li>
            <li>1,034</li>
            <li>1,254</li>
            <li>1,496</li>
            <li>1,716</li>
            <li>1,958</li>
            <li>2,178</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">関西</li>
            <li>924</li>
            <li>1,144</li>
            <li>1,386</li>
            <li>1,606</li>
            <li>1,848</li>
            <li>2,068</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">中国</li>
            <li>924</li>
            <li>1,144</li>
            <li>1,386</li>
            <li>1,606</li>
            <li>1,848</li>
            <li>2,068</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">四国</li>
            <li>924</li>
            <li>1,144</li>
            <li>1,386</li>
            <li>1,606</li>
            <li>1,848</li>
            <li>2,068</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">九州</li>
            <li>1,034</li>
            <li>1,254</li>
            <li>1,496</li>
            <li>1,716</li>
            <li>1,958</li>
            <li>2,178</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">沖縄</li>
            <li>1,364</li>
            <li>1,914</li>
            <li>2,486</li>
            <li>3,036</li>
            <li>3,608</li>
            <li>4,158</li>
        </ul>
    </div>
    <!--{elseif $tpl_pref_id == 40 || $tpl_pref_id == 41 || $tpl_pref_id == 42 || $tpl_pref_id == 43 || $tpl_pref_id == 44 || $tpl_pref_id == 45 || $tpl_pref_id == 46}-->
    <div class="c-postage_table">
        <ul class="c-postage_table_title">
            <li>サイズ</li>
            <li>60</li>
            <li>80</li>
            <li>100</li>
            <li>120</li>
            <li>140</li>
            <li>160</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">北海道</li>
            <li>2,024</li>
            <li>2,244</li>
            <li>2,486</li>
            <li>2,706</li>
            <li>2,948</li>
            <li>3,168</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">北東北</li>
            <li>1,584</li>
            <li>1,804</li>
            <li>2,046</li>
            <li>2,266</li>
            <li>2,508</li>
            <li>2,728</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">南東北</li>
            <li>1,584</li>
            <li>1,804</li>
            <li>2,046</li>
            <li>2,266</li>
            <li>2,508</li>
            <li>2,728</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">関東</li>
            <li>1,364</li>
            <li>1,584</li>
            <li>1,826</li>
            <li>2,046</li>
            <li>2,288</li>
            <li>2,508</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">信越</li>
            <li>1,364</li>
            <li>1,584</li>
            <li>1,826</li>
            <li>2,046</li>
            <li>2,288</li>
            <li>2,508</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">北陸</li>
            <li>1,144</li>
            <li>1,364</li>
            <li>1,606</li>
            <li>1,826</li>
            <li>2,068</li>
            <li>2,288</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">中部</li>
            <li>1,144</li>
            <li>1,364</li>
            <li>1,606</li>
            <li>1,826</li>
            <li>2,068</li>
            <li>2,288</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">関西</li>
            <li>1,034</li>
            <li>1,254</li>
            <li>1,496</li>
            <li>1,716</li>
            <li>1,958</li>
            <li>2,178</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">中国</li>
            <li>924</li>
            <li>1,144</li>
            <li>1,386</li>
            <li>1,606</li>
            <li>1,848</li>
            <li>2,068</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">四国</li>
            <li>1,034</li>
            <li>1,254</li>
            <li>1,496</li>
            <li>1,716</li>
            <li>1,958</li>
            <li>2,178</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">九州</li>
            <li>924</li>
            <li>1,144</li>
            <li>1,386</li>
            <li>1,606</li>
            <li>1,848</li>
            <li>2,068</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">沖縄</li>
            <li>1,254</li>
            <li>1,804</li>
            <li>2,376</li>
            <li>2,926</li>
            <li>3,498</li>
            <li>4,048</li>
        </ul>
    </div>
    <!--{elseif $tpl_pref_id == 47}-->
    <div class="c-postage_table">
        <ul class="c-postage_table_title">
            <li>サイズ</li>
            <li>60</li>
            <li>80</li>
            <li>100</li>
            <li>120</li>
            <li>140</li>
            <li>160</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">北海道</li>
            <li>2,024</li>
            <li>2,574</li>
            <li>3,146</li>
            <li>3,696</li>
            <li>4,268</li>
            <li>4,818</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">北東北</li>
            <li>1,694</li>
            <li>2,244</li>
            <li>2,816</li>
            <li>3,366</li>
            <li>3,938</li>
            <li>4,488</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">南東北</li>
            <li>1,584</li>
            <li>2134</li>
            <li>2,706</li>
            <li>3,256</li>
            <li>3,828</li>
            <li>4,378</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">関東</li>
            <li>1,364</li>
            <li>1,914</li>
            <li>2,486</li>
            <li>3,036</li>
            <li>3,608</li>
            <li>4,158</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">信越</li>
            <li>1,474</li>
            <li>2,024</li>
            <li>2,596</li>
            <li>3,146</li>
            <li>3,718</li>
            <li>4,268</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">北陸</li>
            <li>1,474</li>
            <li>2,024</li>
            <li>2,596</li>
            <li>3,146</li>
            <li>3,718</li>
            <li>4,268</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">中部</li>
            <li>1,364</li>
            <li>1,914</li>
            <li>2,486</li>
            <li>3,036</li>
            <li>3,608</li>
            <li>4,158</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">関西</li>
            <li>1,364</li>
            <li>1,914</li>
            <li>2,486</li>
            <li>3,036</li>
            <li>3,608</li>
            <li>4,158</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">中国</li>
            <li>1,364</li>
            <li>1,914</li>
            <li>2,486</li>
            <li>3,036</li>
            <li>3,608</li>
            <li>4,158</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">四国</li>
            <li>1,364</li>
            <li>1,914</li>
            <li>2,486</li>
            <li>3,036</li>
            <li>3,608</li>
            <li>4,158</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">九州</li>
            <li>1,254</li>
            <li>1,804</li>
            <li>2,376</li>
            <li>2,926</li>
            <li>3,498</li>
            <li>4,048</li>
        </ul>
        <ul>
            <li class="c-postage_table_title_pref">沖縄</li>
            <li>924</li>
            <li>1,144</li>
            <li>1,386</li>
            <li>1,606</li>
            <li>1,848</li>
            <li>2,068</li>
        </ul>
    </div>
    <!--{else}-->
    <div class="chain-yamato-howto">
        <p>送料を表示するには住所を入力してください。</p>
    </div>
    <!--{/if}-->
</section>
