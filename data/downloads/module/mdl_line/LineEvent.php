<?php

require __DIR__ . '/Controller/LineLoginIntegrationController.php';
require __DIR__ . '/Service/LineLoginService.php';

class LineEvent
{

    const PLUGIN_LINE_LOGIN_INTEGRATION_SSO_STATE = 'plugin.line_login_integration.sso.state';
    const PLUGIN_LINE_LOGIN_INTEGRATION_SSO_USERID = 'plugin.line_login_integration.sso.userid';

    public function __construct()
    {
    }

    public function login()
    {
        $obj = new Line();
        $obj->login();
    }

    public function loginCallback()
    {
        $obj = new Line();
        $obj->loginCallback();
    }

    /**
     * @param $postValues
     * @param $customerId
     * @return void
     */
    public function sendMessage($postValues, $customerId)
    {
        $objLineService = new LineLoginService();
        $objLineService->sendMessage($postValues, $customerId);
    }

    /**
     * 会員情報変更画面を表示します
     * @param TemplateEvent $event
     */
    public function onRenderMypageChange(TemplateEvent $event)
    {
        if (!$this->isLineSettingCompleted()) {
            return;
        }

        // v3でも $customerId の取得方法がかなり強引……
        $form = ($event->getParameters())["form"];
        $customerId = $form->vars['form']->vars['value']['id'];
        $lineLoginIntegrationRepository = $this->app['eccube.plugin.line_login_integration.repository.line_login_integration'];

        $lineLoginIntegration = $lineLoginIntegrationRepository->findOneBy(array('customer_id' => $customerId));
        $lineIdBySession = $this->app['session']->get(LineLoginIntegrationController::PLUGIN_LINE_LOGIN_INTEGRATION_SSO_USERID);

        // LINEとの紐づけがないとき
        if (empty($lineLoginIntegration)) {
            // LINEのログインボタン表示
            $linkUrl = $this->app->url('plugin_line_login');
            $imgUrl = $this->app->url('homepage') . 'plugin/line_login_integration/assets/img/btn_register_base.png';
            $snipet = '<div class="col-md-3 col-md-offset-1"><a href="' . $linkUrl . '" class="line-button"><img src="' . $imgUrl . '"></a></div>';
            $snipet .= PHP_EOL;
            $snipet .= '<div class="col-md-7" style="margin-bottom:10px;"><p style="margin-top:10px; margin-bottom:10px;">LINEアカウントと連携するには「LINEで登録」ボタンを押してください</p></div>';
            $snipet .= PHP_EOL;
        } // LINEとの紐づけがあっても、現在LINEにログインしていないっぽいとき
        else {
            if (empty($lineIdBySession)) {
                // LINEのログインボタン表示
                $linkUrl = $this->app->url('plugin_line_login');
                $imgUrl = $this->app->url('homepage') . 'plugin/line_login_integration/assets/img/btn_login_base.png';
                $snipet = '<div class="col-md-3 col-md-offset-1"><a href="' . $linkUrl . '" class="line-button"><img src="' . $imgUrl . '"></a></div>';
                $snipet .= PHP_EOL;
                $snipet .= '<div class="col-md-7" style="margin-bottom:10px;">LINEアカウントと連携済みですが、現在LINEでログインしていません。<br>';
                $snipet .= '連係解除をするには、LINEでログインしてください</div>';
            } // LINEとの紐づけがあって、かつLINEにログイン中のとき
            else {
                // 連携解除項目を追加
                $this->replaceMypageForm($event, 'detail_box__job');

                // 上部にLINE連携済みである旨を通知
                $snipet = '<div class="col-md-10 col-md-offset-1" style="margin-bottom:10px;">LINEアカウント連携済です。連携を解除したい場合は「LINE 連携解除」をチェックして「変更する」をボタンを押してください。</div><br>';
                $snipet .= PHP_EOL;
            }
        }

        $search = '<div id="detail_box" class="row">';
        $replace = $search . $snipet;
        $source = str_replace($search, $replace, $event->getSource());
        $event->setSource($source);
    }

    /**
     * 新規会員登録画面を表示します
     * @param TemplateEvent $event
     */
    public function onRenderEntryIndex(TemplateEvent $event)
    {
        if (!$this->isLineSettingCompleted()) {
            return;
        }
        
    }

    /**
     * 新規会員登録確認画面を表示します.
     *
     * @param TemplateEvent $event
     */
    public function onRenderEntryConfirm(TemplateEvent $event)
    {
        if (!$this->isLineSettingCompleted()) {
            return;
        }

    }

    /**
     * 新規会員登録画面にLINEボタンを出力します
     * @param TemplateEvent $event
     */
    public function onRenderLineEntryButton(TemplateEvent $event)
    {
        if (!$this->isLineSettingCompleted()) {
            return;
        }

        $session = $this->app['session'];
        $lineUserId = $session->get(LineLoginIntegrationController::PLUGIN_LINE_LOGIN_INTEGRATION_SSO_USERID);

        $snipet = '';
        if (!empty($lineUserId)) {
            $snipet .= '<div class="col-md-10 col-md-offset-1">LINEログイン済みです。この会員登録が完了すると、LINEでログインできるようになります。</div>';
            $snipet .= PHP_EOL;
        } else {
            $linkUrl = $this->app->url('plugin_line_login');
            $imgUrl = $this->app->url('homepage') . 'plugin/line_login_integration/assets/img/btn_register_base.png';
            $snipet .= '<div class="col-md-3 col-md-offset-1"><a href="' . $linkUrl . '" class="line-button"><img src="' . $imgUrl . '"></a></div>';
            $snipet .= PHP_EOL;
            $snipet .= '<div class="col-md-6" style="padding-top:10px;">LINEアカウントと連携するには「LINEで登録」ボタンを押してください</div>';
            $snipet .= PHP_EOL;
        }
        $search = '<div id="top_box" class="row">';
        $replace = $search . $snipet;
        $source = str_replace($search, $replace, $event->getSource());
        $event->setSource($source);
    }

    /**
     * ログイン画面にLINEボタンを出力します
     * @param TemplateEvent $event
     */
    public function onRenderLineLoginButton(TemplateEvent $event)
    {
        if (!$this->isLineSettingCompleted()) {
            return;
        }

        $snipet = '<div class="col-sm-8 col-sm-offset-2" style="margin-bottom:5px;"><a href="' . $this->app->url('plugin_line_login') . '" class="line-button"><img src="' . $this->app->url('homepage') . 'plugin/line_login_integration/assets/img/btn_login_base.png"></a></div>' . PHP_EOL;
        $search = '<div id="login_box" class="row">';
        $replace = $search . $snipet;
        $source = str_replace($search, $replace, $event->getSource());
        $event->setSource($source);
    }

    /**
     * 管理画面から会員を削除したときにLINEの紐づけを削除
     * @param EventArgs $event
     */
    public function onCompleteCustomerDelete(EventArgs $event)
    {
        if (!$this->isLineSettingCompleted()) {
            return;
        }

        $customer = $event->getArgument('Customer');
        $customerId = $customer->getId();
        log_info("customer_id:" . $customerId . "の会員を削除します");

        // LINE情報を削除する
        $lineLoginIntegrationRepository = $this
            ->app['eccube.plugin.line_login_integration.repository.line_login_integration'];
        $lineLoginIntegration = $lineLoginIntegrationRepository
            ->findOneBy(array('customer_id' => $customerId));
        if (!empty($lineLoginIntegration)) {
            log_info("LINEとの紐づけを削除します" . $customerId);
            $lineLoginIntegrationRepository
                ->deleteLineAssociation($lineLoginIntegration);
            log_info("LINEとの紐づけを削除しました" . $customerId);
        }
    }

    /**
     * 会員の退会処理をおこないます
     * @param EventArgs $event
     */
    public function onCompleteMypageWithdraw(EventArgs $event)
    {
        if (!$this->isLineSettingCompleted()) {
            return;
        }

        log_info('退会');
        // LINE情報を削除する
        $session = $this->app['session'];
        $lineUserId = $session
            ->get(LineLoginIntegrationController::PLUGIN_LINE_LOGIN_INTEGRATION_SSO_USERID);

        $lineLoginIntegrationRepository =
            $this->app['eccube.plugin.line_login_integration.repository.line_login_integration'];
        $lineLoginIntegration = $lineLoginIntegrationRepository
            ->findOneBy(array('line_user_id' => $lineUserId));
        if (!empty($lineLoginIntegration)) {
            log_info("LINEとの紐づけを削除します");
            $lineLoginIntegrationRepository
                ->deleteLineAssociation($lineLoginIntegration);
            log_info("LINEとの紐づけを削除しました");
        }

        $session->remove(LineLoginIntegrationController::PLUGIN_LINE_LOGIN_INTEGRATION_SSO_STATE);
        $session->remove(LineLoginIntegrationController::PLUGIN_LINE_LOGIN_INTEGRATION_SSO_USERID);
    }

    /**
     * 会員登録処理をおこないます
     * @param EventArgs $event
     */
    public function onCompleteEntry($customerId)
    {
        $objSess = new SC_Session_Ex();
        // 認証済みの設定
        $lineUserId = $objSess->GetSession(self::PLUGIN_LINE_LOGIN_INTEGRATION_SSO_USERID);
        if (!empty($lineUserId)) {
            // 連携テーブルのLINE IDからCustomerを取得
            $sql = 'SELECT * FROM plg_line_login_integration WHERE line_user_id = ? AND del_flg = 0';
            $objQuery = SC_Query_Ex::getSingletonInstance();
            $result = $objQuery->getAll($sql, $lineUserId);

            if (is_array($result) AND count($result) == 0) {
                // 新規登録時
                $sqlval['create_date'] = 'CURRENT_TIMESTAMP';
                $sqlval['update_date'] = 'CURRENT_TIMESTAMP';
                $sqlval['customer_id'] = $customerId;
                $sqlval['line_user_id'] = $lineUserId;
                $objQuery->insert('plg_line_login_integration', $sqlval);
            }
        } else {
        }
    }

    /**
     * 会員情報編集完了時のイベント処理を行います
     *
     * @param EventArgs $event
     */
    public function onCompleteMypageChange(EventArgs $event)
    {
        if (!$this->isLineSettingCompleted()) {
            return;
        }

        $Customer = $event['Customer'];
        $customerId = $Customer->getId();
        $form = $event['form'];

        $lineLoginIntegrationRepository =
            $this->app['eccube.plugin.line_login_integration.repository.line_login_integration'];
        $lineLoginIntegration =
            $lineLoginIntegrationRepository->findOneBy(array('customer_id' => $customerId));

        // LINEの紐づけがすでにあるとき
        if (!empty($lineLoginIntegration)) {
            // LINE情報を削除する
            if ($form->has('is_line_delete')) {
                $is_line_delete = $form->get('is_line_delete')->getData();
                if ($is_line_delete == 1) {
                    // 連携解除
                    $this->lineIdUnassociate($customerId, true);
                }
            }
        } // LINEの紐づけがないとき
        else {
            // 何もしない
            // LINEとの紐づけ処理はログインのコールバック関数(LineLoginIntegrationController.php)内で行われるのでここでは行わない
        }
    }

    /**
     * LINE設定が初期化済みかチェックします
     */
    private function isLineSettingCompleted()
    {
        $lineLoginIntegrationSettingRepository = $this
            ->app['eccube.plugin.line_login_integration.repository.line_login_integration_setting'];
        $lineLoginIntegrationSetting
            = $lineLoginIntegrationSettingRepository
            ->find(LineLoginIntegrationAdminController::LINE_LOGIN_INTEGRATION_SETTING_TABLE_ID);

        if (empty($lineLoginIntegrationSetting)) {
            log_error("Line 設定が初期化されていません。");
            return false;
        }

        $lineChannelId = $lineLoginIntegrationSetting->getLineChannelId();
        if (empty($lineChannelId)) {
            log_error("Line Channel Idが未設定です。");
            return false;
        }

        $lineChannelSecret = $lineLoginIntegrationSetting->getLineChannelSecret();
        if (empty($lineChannelSecret)) {
            log_error("Line Channel Secretが未設定です。");
            return false;
        }

        return true;
    }

    /**
     * LINEアカウントとの連携を解除する処理
     *
     * 会員IDから連携DBを検索し、該当するレコードを削除する処理。管理画面でなくフロントからのフローでは、
     * セッションを削除するのでフラグをtrueにしておく
     *
     * @param int $customerId LINEとの連携を解除したい会員ID
     * @param bool $isDeleteSession セッションまで削除する。デフォでfalse
     * @return bool                 会員がLINEと紐づけされていて、紐づけを解除したときにtrueを返す
     */
    public function lineIdUnassociate()
    {
        // ログインチェック
        $this->objCustomer = new SC_Customer_Ex();
        // ログインしていない場合は必ずログインページを表示する
        if ($this->objCustomer->isLoginSuccess(true)) {
            $objQuery = SC_Query_Ex::getSingletonInstance();
            $result = $objQuery->delete('plg_line_login_integration', 'customer_id = ?', $this->objCustomer->getValue('customer_id'));
            $Session = new SC_Session_Ex();
            $Session->UnsetSession(self::PLUGIN_LINE_LOGIN_INTEGRATION_SSO_STATE);
            $Session->UnsetSession(self::PLUGIN_LINE_LOGIN_INTEGRATION_SSO_USERID);
        }
        return true;
    }

    /**
     * エントリーフォームに「LINE解除」を追加します
     * @param TemplateEvent $event
     * @param type $elementId
     */
    private function replaceMypageForm(TemplateEvent $event, $elementId)
    {
        $snippet = $this->app['twig']->getLoader()
            ->getSource('LineLoginIntegration/Resource/template/mypage_change_add_is_line_delete.twig');
        $source = $event->getSource();

        $pattern = '/<dl id="' . $elementId . '">.*?<\/dl>/s';
        preg_match($pattern, $source, $matches);
        $search = $matches[0];
        $replace = $search . $snippet;

        $source = str_replace($search, $replace, $source);
        $event->setSource($source);
    }
}
