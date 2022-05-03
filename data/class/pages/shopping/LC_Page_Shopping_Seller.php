<?php
/*
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
 */

require_once CLASS_EX_REALDIR . 'page_extends/LC_Page_Ex.php';

/**
 * 出品者情報のページクラス.
 *
 * @package Page
 * @author EC-CUBE CO.,LTD.
 * @version $Id$
 */
class LC_Page_Shopping_Seller extends LC_Page_Ex
{
    public $disp_number = 10;

    /**
     * Page を初期化する.
     *
     * @return void
     */
    public function init()
    {
        parent::init();
        $this->tpl_title = '出品者情報';
    }

    /**
     * Page のプロセス.
     *
     * @return void
     */
    public function process()
    {
        parent::process();
        $this->action();
        $this->sendResponse();
    }

    /**
     * Page のアクション.
     *
     * @return void
     */
    public function action()
    {
        $objFormParam = new SC_FormParam_Ex();
        $this->lfInitParam($objFormParam);
        $objFormParam->setParam($_GET);
        $objFormParam->convParam();
        $this->arrErr = $objFormParam->checkError();

        // エラーチェック
        if(count($this->arrErr) == 0){
            try {
                // 出品者ID
                $sellerId = $objFormParam->getValue('seller_id');
                // 出品者情報
                $this->arrSeller = SC_Helper_Customer_Ex::sfGetCustomerData($sellerId, true);

                // ページナビ
                $this->tpl_pageno   = $objFormParam->getValue('pageno');
                $this->tpl_linemax  = $this->getMyProducts($sellerId, false);
                $url_param           = "seller_id={$sellerId}&pageno=#page#";
                $this->objNavi      = new SC_PageNavi_Ex($this->tpl_pageno, $this->tpl_linemax, $this->disp_number, 'return true; void', NAVI_PMAX, $url_param, SC_Display_Ex::detectDevice() !== DEVICE_TYPE_MOBILE);
                $this->tpl_strnavi  = $this->objNavi->strnavi;

                // 出品アイテム情報
                $this->arrMyProducts = $this->getMyProducts($sellerId, $this->objNavi->start_row);
                $masterData         = new SC_DB_MasterData_Ex();
                $this->arrPref      = $masterData->getMasterData('mtb_pref');
            } catch (Exception $e){
                // エラー画面を表示
                SC_Utils_Ex::sfDispSiteError(null, '', true);
            }
        } else {
            // エラー画面を表示
            SC_Utils_Ex::sfDispSiteError(null, '', true);
        }
    }

    /**
     *
     * パラメーター情報の初期化
     *
     * @param SC_FormParam $objFormParam SC_FormParam インスタンス
     * @access public
     * @return void
     */
    public function lfInitParam(&$objFormParam)
    {
        $objFormParam->addParam('出品者ID', 'seller_id', ID_MAX_LEN, 'n', array('NUM_CHECK', 'MAX_LENGTH_CHECK'));
        $objFormParam->addParam('ページ番号', 'pageno', INT_LEN, 'n', array('NUM_CHECK', 'MAX_LENGTH_CHECK'));
    }

    /**
     *
     * 指定された出品者の出品アイテム情報を取得する
     *
     * @param string $sellerId
     * @param string|bool $startno false=一致件数を返す
     * @return mixed
     */
    public function getMyProducts($sellerId, $startno)
    {
        $objQuery = SC_Query_Ex::getSingletonInstance();
        $objProduct = new SC_Product_Ex();

        // [仕様] 非公開商品も表示する。
        $objQuery->setWhere('alldtl.customer_id = ?', [$sellerId]);
        $objQuery->andWhere('alldtl.del_flg = 0');
        $objQuery->setOrder('alldtl.product_id DESC');

        $addCols = ['count_of_favorite'];
        for ($cnt = 1; $cnt <= PRODUCTSUB_MAX; $cnt++) {
            $addCols[] = 'sub_large_image' . $cnt;
            $addCols[] = 'sub_title' . $cnt;
        }

        if ($startno === false) {
            $return = $objQuery->count('dtb_products alldtl');
        }
        else {
            $objQuery->setLimitOffset($this->disp_number, $startno);
            $return = $objProduct->lists($objQuery, [], $addCols);
        }

        return $return;
    }
}
