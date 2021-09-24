<section id="sln_form_body">
	<div class="end information">
		<!--{assign var=key_name value="payment"}-->
		<p class="attention"><!--{$arrErr[$key_name]}--></p>
	</div>
	<div class="btn_area">
		<ul class="btn_btm">
			<!--{if !$tpl_btn_next}-->
			<li><a rel="external"
				href="javascript:void(slnCheckSubmit('return'));" class="btn_back" />戻る</a>
			</li>
			<!--{/if}-->
		</ul>
	</div>

</section>
