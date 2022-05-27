#!/usr/local/bin/php
<?php
ini_set('display_errors', '1');
chdir(dirname(__FILE__));
require_once '../../html/require.php';
while (@ob_end_flush());

define('BATCH', true);
$objSendNotificationRequestInfo = new SendNotificationRequestInfo();
echo "START\n";

// 2022-05-22 07:44:49
$objDateTime = new DateTime();
$start = $objDateTime->modify('-10 day')->format('Y-m-d') . ' 20:00:00';
$objDateTime = new DateTime();
$end = $objDateTime->format('Y-m-d') . ' 20:00:00';

$objSendNotificationRequestInfo->main($start, $end);
echo "END\n";

class SendNotificationRequestInfo
{
    public function __construct()
    {
        $masterData = new SC_DB_MasterData_Ex();
        $this->arrMAILTPLPATH =  $masterData->getMasterData('mtb_mail_tpl_path');

        $objDb = new SC_Helper_DB_Ex();
        $this->arrInfo = $objDb->sfGetBasisData();
    }

    public function main($start, $end)
    {
        // 特定期間にリクエストされた情報を取得
        $arrSearchRequestItem = $this->searchRequestItemInfo($start, $end);

        // お気に入りされた側の会員IDで整形
        $arrRequestItemByCustomer = array();
        foreach ($arrSearchRequestItem as $requestItem) {
            $arrRequestItemByCustomer[$requestItem['source_customer_id']][] = $requestItem;
        }

        // メールテンプレート情報の取得
        $objPage = new LC_Page_Ex();
        $objPage->disp_mypage_link_count = 2;
        $objMailtemplate = new SC_Helper_Mailtemplate_Ex();
        $mailtemplate = $objMailtemplate->get(102);
        $objPage->tpl_header = $mailtemplate['header'];
        $objPage->tpl_footer = $mailtemplate['footer'];
        $tmp_subject = $mailtemplate['subject'];
        $objMailView = new SC_SiteView_Ex();
        $objMailView->setPage($objPage);

        // メール送信処理
        $objSendMail = new SC_SendMail_Ex();
        foreach ($arrRequestItemByCustomer as $requestItemByCustomer){
            $objPage->request_sum_uu = 0;
            foreach ($requestItemByCustomer as $requestItem){
                $objPage->request_sum_uu += $requestItem['request_uu'];
            }
            $objPage->requestItemByCustomer = $requestItemByCustomer;
            $objPage->name = $requestItemByCustomer[0]['source_name01'] .' '. $requestItemByCustomer[0]['source_name02'];
            $objPage->requestItemCount = count($requestItemByCustomer);
            $objMailView->assignobj($objPage);
            $body = $objMailView->fetch($this->arrMAILTPLPATH[102]);
            $objSendMail->setItem('', $tmp_subject, $body, $this->arrInfo['email03'], $this->arrInfo['shop_name'], $this->arrInfo['email03'], $this->arrInfo['email04'], $this->arrInfo['email04'], $bcc = '');

            $to = $requestItemByCustomer[0]['source_email'];
            $to_name = $objPage->name;
            $objSendMail->setTo($to, $to_name);
            $objSendMail->sendMail();
        }
    }

    private function searchRequestItemInfo($start, $end)
    {
        $objQuery = SC_Query_Ex::getSingletonInstance();

        // target_id: str = Field(description='お気に入りする側のID')
        // source_id: str = Field(description='お気に入りされる側のID')
        $sql = 'SELECT max(favorite_products.create_date) as create_date, source_customer_id, source_name01, source_name02, source_kana01, source_kana02, source_email, source_email_mobile, source_nickname, source_product_id, source_product_name, source_sub_large_image1, count(distinct target_customer_id) as request_uu FROM '.
            '(SELECT * FROM dtb_customer_favorite_products WHERE create_date >= ? and create_date < ? ORDER BY create_date DESC) favorite_products
            JOIN (SELECT customer_id as target_customer_id, name01 as target_name01, name02 as target_name02, kana01 as target_kana01, kana02 as target_kana02, email as target_email, email_mobile as target_email_mobile, nickname as target_nickname  FROM dtb_customer WHERE del_flg = 0 and status = 2) target_customer ON target_customer.target_customer_id = favorite_products.customer_id
            JOIN (SELECT c.product_id as target_product_id, p.customer_id, p.name as target_product_name, p.sub_large_image1 as target_sub_large_image1 FROM dtb_products_class c JOIN dtb_products p ON c.product_id = p.product_id WHERE c.del_flg = 0 AND (c.stock >= 1 OR c.stock_unlimited = 1) AND p.del_flg = 0 AND p.status = 1) target_product ON target_product.target_product_id = favorite_products.target_id
            JOIN (SELECT c.product_id as source_product_id, p.customer_id, p.name as source_product_name, p.sub_large_image1 as source_sub_large_image1  FROM dtb_products_class c JOIN dtb_products p ON c.product_id = p.product_id WHERE c.del_flg = 0 AND (c.stock >= 1 OR c.stock_unlimited = 1) AND p.del_flg = 0 AND p.status = 1) source_product ON source_product.source_product_id = favorite_products.product_id
            JOIN (SELECT customer_id as source_customer_id, name01 as source_name01, name02 as source_name02, kana01 as source_kana01, kana02 as source_kana02, email as source_email, email_mobile as source_email_mobile, nickname as source_nickname FROM dtb_customer c WHERE del_flg = 0 and status = 2) source_customer ON source_customer.source_customer_id = source_product.customer_id
            group by source_customer_id, source_name01, source_name02, source_kana01, source_kana02, source_email, source_email_mobile, source_nickname, source_product_id, source_product_name, source_sub_large_image1
            ORDER BY create_date DESC;';
        return $objQuery->getAll($sql, array($start, $end));
    }
}
?>