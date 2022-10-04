<?php

class Line {

    const PLUGIN_LINE_LOGIN_INTEGRATION_SSO_STATE = 'plugin.line_login_integration.sso.state';
    const PLUGIN_LINE_LOGIN_INTEGRATION_SSO_USERID = 'plugin.line_login_integration.sso.userid';

    public function __construct()
    {
    }

    /**
     * @return array
     */
    public function getLineConfig()
    {
        $objQuery = SC_Query_Ex::getSingletonInstance();
        $sql = 'SELECT * FROM plg_line_login_integration_setting';
        return $objQuery->getAll($sql, array());
    }

    public function login()
    {
        $result = $this->getLineConfig();
        if (is_array($result) and count($result) == 0){
            return false;
        }
        $LINE_CONFIG = $result[0];

        $state = uniqid();
        $Session = new SC_Session_Ex();
        $Session->SetSession(self::PLUGIN_LINE_LOGIN_INTEGRATION_SSO_STATE, $state);


        $lineChannelId = $LINE_CONFIG['line_channel_id'];

        $lineCallbackUrl = HTTPS_URL . 'test/line/line_login_callback.php';

        $lineAuthUrl = 'https://access.line.me/oauth2/v2.1/authorize?response_type=code&client_id=' . $lineChannelId . '&redirect_uri=' . rawurlencode($lineCallbackUrl) . '&state=' . $state . '&scope=profile&bot_prompt=aggressive&prompt=consent';

        header('Location: '.$lineAuthUrl);
        exit;
    }

    public function loginCallback()
    {
        $result = $this->getLineConfig();
        if (is_array($result) and count($result) == 0){
            return false;
        }
        $LINE_CONFIG = $result[0];

        $Session = new SC_Session_Ex();
        $code = htmlspecialchars($_GET['code']);
        $state = htmlspecialchars($_GET['state']);

        $originalState = $Session->GetSession(self::PLUGIN_LINE_LOGIN_INTEGRATION_SSO_STATE);
        $Session->UnsetSession(self::PLUGIN_LINE_LOGIN_INTEGRATION_SSO_STATE);

        if (empty($state)) {
            log_error('LINE API エラー(1)');
        }

        if (empty($originalState)) {
            log_error('LINE API エラー(2)');
        }

        if ($state != $originalState) {
            log_error('LINE API エラー(3)');
        }

        $lineChannelId = $LINE_CONFIG['line_channel_id'];
        $lineChannelSecret = $LINE_CONFIG['line_channel_secret'];

        $lineCallbackUrl = HTTPS_URL . 'test/line/line_login_callback.php';

        $accessTokenUrl = "https://api.line.me/oauth2/v2.1/token";
        $accessTokenData = array(
            "grant_type" => "authorization_code",
            "code" => $code,
            "redirect_uri" => $lineCallbackUrl,
            "client_id" => $lineChannelId,
            "client_secret" => $lineChannelSecret,
        );
        $accessTokenData = http_build_query($accessTokenData, "", "&");
        $header = array(
            "Content-Type: application/x-www-form-urlencoded",
            "Content-Length: " . strlen($accessTokenData)
        );
        $context = array(
            "http" => array(
                "method" => "POST",
                "header" => implode("\r\n", $header),
                "content" => $accessTokenData
            )
        );

        $res = file_get_contents($accessTokenUrl, false, stream_context_create($context));
        $tokenJson = json_decode($res, true);

        $accessToken = $tokenJson['access_token'];
        $lineProfileUrl = "https://api.line.me/v2/profile";
        $context = array(
            "http" => array(
                "method" => "GET",
                "header" => "Authorization: Bearer " . $accessToken
            )
        );

        $res = file_get_contents($lineProfileUrl, false, stream_context_create($context));
        $profileJson = json_decode($res, true);

        $lineUserId = $profileJson['userId'];
        $Session->SetSession(self::PLUGIN_LINE_LOGIN_INTEGRATION_SSO_USERID, $lineUserId);

        // 連携テーブルのLINE IDからCustomerを取得
        $sql = 'SELECT * FROM plg_line_login_integration WHERE line_user_id = ? AND del_flg = 0';
        $objQuery = SC_Query_Ex::getSingletonInstance();
        $result = $objQuery->getAll($sql, $lineUserId);
        if (is_array($result) AND count($result) > 0){
//            $customerRepository = $app['eccube.repository.customer'];
//            $customerId = $lineLoginIntegration['customer_id'];
//            $customer = $customerRepository->findOneBy(array('id' => $customerId));
//
//            // DB上にLINE IDの登録はあるが、Customerオブジェクトが未発見の場合、LINE IDの削除
//            if (is_null($customer)) {
//                log_info('削除されたユーザ(custome_id:' . $customerId . ')とのLINE IDのレコードを削除します');
//                $lineLoginIntegrationRepository->delete($lineLoginIntegration);
//            }
//            // 削除後はそのままスルーし、普通のフローに
        }

        // ログインチェック
        $this->objCustomer = new SC_Customer_Ex();
        // ログインしていない場合は必ずログインページを表示する
        if ($this->objCustomer->isLoginSuccess(true)) {

            //  ログインユーザーのLINE IDが保存されていない場合
            if (is_array($result) AND count($result) == 0){
                // 新規登録時
                $sqlval['create_date'] = 'CURRENT_TIMESTAMP';
                $sqlval['update_date'] = 'CURRENT_TIMESTAMP';
                $sqlval['customer_id'] = $this->objCustomer->getValue('customer_id');
                $sqlval['line_user_id'] = $lineUserId;
                $objQuery->insert('plg_line_login_integration', $sqlval);
            } else {
//                // 現在ログインしている会員IDと、連携DB上で既に紐づいている会員IDが異なるときはエラー
//                $registeredCustomerId = $customer->getId();     // 既にDBにLINE IDと紐づけられている顧客ID
//                $nowLoggedInCustomerId = $app['user']->getId(); // 新たにLINE IDと紐付けようと申請する顧客ID
//                if ($nowLoggedInCustomerId != $registeredCustomerId) {
//                    log_info('すでに連携済みのLINE IDを別のアカウントの連携に使おうとしました', array($nowLoggedInCustomerId, $registeredCustomerId));
//                    return $app->render('error.twig', array(
//                        'error_title' => '重複したLINE IDです',
//                        'error_message' => "既に別のアカウントで、同じLINE IDが登録されています。",
//                    ));
//                }
            }

            // 購入ページへ
            SC_Response_Ex::sendRedirect('/mypage/');
            SC_Response_Ex::actionExit();
        } else {
            // DB上にLINE IDの登録なし→新規登録のフロー
            if (is_array($result) AND count($result) == 0){
                // 購入ページへ
                SC_Response_Ex::sendRedirect('/entry/kiyaku.php');
                SC_Response_Ex::actionExit();
            // DB上にLINE IDの登録あり
            } else {
                // 連携テーブルのLINE IDからCustomerを取得
                $sql = 'SELECT * FROM dtb_customer WHERE customer_id = ? AND del_flg = 0 AND status = 2';
                $objQuery = SC_Query_Ex::getSingletonInstance();
                $result = $objQuery->getAll($sql, $result[0]['customer_id']);
                $this->objCustomer->customer_data = $result[0];
                $this->objCustomer->startSession();

                if (isset($_SESSION['unregistered_card']) && $_SESSION['unregistered_card']) {
                    SC_Response_Ex::sendRedirect(HTTPS_URL . 'mypage/card_info.php');
                    SC_Response_Ex::actionExit();
                } else {
                    SC_Response_Ex::sendRedirect('/mypage/');
                    SC_Response_Ex::actionExit();
                }
            }
        }

    }

    /**
     * マイページ LINEアカウント連携解除
     * @return void
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
            SC_Response_Ex::sendRedirect('/mypage/?aa');
            SC_Response_Ex::actionExit();
        }
    }

}