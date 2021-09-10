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

if (file_exists(MODULE_REALDIR . 'mdl_gmopg/inc/function.php')) {
    require_once MODULE_REALDIR . 'mdl_gmopg/inc/function.php';
}
/**
 * 商品詳細 のページクラス.
 *
 * @package Page
 * @author EC-CUBE CO.,LTD.
 * @version $Id$
 */
class LC_Page_Product_Select extends LC_Page_Ex
{

    /**
     * Page を初期化する.
     *
     * @return void
     */
    public function init()
    {
        parent::init();
        $masterData = new SC_DB_MasterData_Ex();
        $this->tpl_mainpage = 'products/product_select.tpl';
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
     * Page のAction.
     *
     * @return void
     */
    public function action()
    {
        // パラメーター管理クラス
        $this->objFormParam = new SC_FormParam_Ex();
        // パラメーター情報の初期化
        $this->arrForm = $this->lfInitParam($this->objFormParam);

        // プロダクトIDの正当性チェック
        $objProduct = new SC_Product_Ex();
        $this->source_id = $this->lfCheckProductId($this->objFormParam->getValue('admin'), $this->objFormParam->getValue('source_id'), $objProduct);

        switch ($this->getMode()){
            default:
                // 交換対象商品一覧を取得する
                $objCustomer = new SC_Customer_Ex();
                $this->arrTargetProducts = $this->getProducts($objCustomer->getValue('customer_id'));

                // リクエストされる商品
                $this->arrSourceProduct = $objProduct->getDetail($this->objFormParam->getValue('source_id'));
                break;
        }
    }

    /**
     * リクエストパラメーター 'mode' を取得する.
     *
     * 1. $_REQUEST['mode'] の値を取得する.
     * 2. 存在しない場合は null を返す.
     *
     * mode に, 半角英数字とアンダーバー(_) 以外の文字列が検出された場合は null を
     * 返す.
     *
     * @access protected
     * @return string|null $_REQUEST['mode'] の文字列
     */
    public function getMode()
    {
        $pattern = '/^[a-zA-Z0-9_]+$/';
        $mode = null;
        if (isset($_REQUEST['mode']) && preg_match($pattern, $_REQUEST['mode'])) {
            $mode =  $_REQUEST['mode'];
        }

        return $mode;
    }

    /**
     * プロダクトIDの正当性チェック
     *
     * @param string $admin_mode
     * @param int $product_id
     * @param SC_Product $objProduct
     * @return integer
     */
    public function lfCheckProductId($admin_mode, $product_id, SC_Product $objProduct)
    {
        // 管理機能からの確認の場合は、非公開の商品も表示する。
        if (isset($admin_mode) && $admin_mode == 'on' && SC_Utils_Ex::sfIsSuccess(new SC_Session_Ex(), false)) {
            $include_hidden = true;
        } else {
            $include_hidden = false;
        }

        if (!$objProduct->isValidProductId($product_id, $include_hidden)) {
                SC_Utils_Ex::sfDispSiteError(PRODUCT_NOT_FOUND);
        }

        return $product_id;
    }

    /**
     * パラメーター情報の初期化
     *
     * @param SC_FormParam $objFormParam
     * @return array
     */
    public function lfInitParam(SC_FormParam &$objFormParam)
    {
        $objFormParam->addParam('商品ID', 'source_id', INT_LEN, 'n', array('EXIST_CHECK', 'ZERO_CHECK', 'NUM_CHECK', 'MAX_LENGTH_CHECK'));
        // 値の取得
        $objFormParam->setParam($_REQUEST);
        // 入力値の変換
        $objFormParam->convParam();
        // 入力情報を渡す
        return $objFormParam->getFormParamList();
    }

    /* 商品規格情報の取得 */

    /**
     * @param integer $product_id
     */
    public function lfGetProductsClass($product_id)
    {
        $objProduct = new SC_Product_Ex();

        return $objProduct->getProductsClassFullByProductId($product_id);
    }

    /**
     * 出品中アイテムを取得する
     *
     * @param mixed $customer_id
     * @access private
     * @return array 出品中アイテム商品一覧
     */
    public function getProducts($customer_id)
    {
        // 出品中アイテム商品ID取得
        $arrProductId = array();
        $arrListingProducts  = SC_Product_Ex::getListingProducts($customer_id);
        foreach ($arrListingProducts as $arrListingProduct) {
            $arrProductId[] = $arrListingProduct['product_id'];
        }

        $objQuery       = SC_Query_Ex::getSingletonInstance();
        $objQuery->setWhere($this->lfMakeWhere('alldtl.', $arrProductId));
        $objProduct     = new SC_Product_Ex();
        $linemax        = $objProduct->findProductCount($objQuery);

        $this->tpl_linemax = $linemax;   // 何件が該当しました。表示用

        // ページ送りの取得
        $objNavi        = new SC_PageNavi_Ex($this->tpl_pageno, $linemax, $this->dispNumber, 'eccube.movePage', NAVI_PMAX);
        $this->tpl_strnavi = $objNavi->strnavi; // 表示文字列
        $startno        = $objNavi->start_row;

        $objQuery       = SC_Query_Ex::getSingletonInstance();
        //$objQuery->setLimitOffset($this->dispNumber, $startno);
        // 取得範囲の指定(開始行番号、行数のセット)
        $arrProductId  = array_slice($arrProductId, $startno, $this->dispNumber);

        $where = $this->lfMakeWhere('', $arrProductId);
        $where .= ' AND del_flg = 0';
        $objQuery->setWhere($where, $arrProductId);
        $addCols = ['count_of_favorite'];
        $arrProducts = $objProduct->lists($objQuery, [], $addCols);

        //取得している並び順で並び替え
        $arrProducts2 = array();
        foreach ($arrProducts as $item) {
            $arrProducts2[$item['product_id']] = $item;
        }
        $arrProductsList = array();
        foreach ($arrProductId as $product_id) {
            $arrProductsList[] = $arrProducts2[$product_id];
        }

        return $arrProductsList;
    }

    /**
     * @param string $tablename
     */
    public function lfMakeWhere($tablename, $arrProductId)
    {
        // 取得した表示すべきIDだけを指定して情報を取得。
        $where = '';
        if (is_array($arrProductId) && !empty($arrProductId)) {
            $where = $tablename . 'product_id IN (' . implode(',', $arrProductId) . ')';
        } else {
            // 一致させない
            $where = '0<>0';
        }

        return $where;
    }


    /* 入力内容のチェック */

    /**
     * @param string $mode
     * @param boolean $tpl_classcat_find1
     * @param boolean $tpl_classcat_find2
     */
    public function lfCheckError($mode, SC_FormParam &$objFormParam, $tpl_classcat_find1 = null, $tpl_classcat_find2 = null)
    {
        switch ($mode) {
        case 'add_favorite_sphone':
        case 'add_favorite':
            $objCustomer = new SC_Customer_Ex();
            $objErr = new SC_CheckError_Ex();
            $customer_id = $objCustomer->getValue('customer_id');
            $favorite_product_id = $objFormParam->getValue('favorite_product_id');
            if (SC_Helper_DB_Ex::sfDataExists('dtb_customer_favorite_products', 'customer_id = ? AND product_id = ?', array($customer_id, $favorite_product_id))) {
                $objErr->arrErr['add_favorite'.$favorite_product_id] = '※ この商品は既にお気に入りに追加されています。<br />';
            }
            break;

        case 'add_favorite_ajax':
            $objErr = new SC_CheckError_Ex();
            break;

        case 'del_favorite_ajax':
            $objErr = new SC_CheckError_Ex();
            break;

        default:
            // 入力データを渡す。
            $arrRet =  $objFormParam->getHashArray();
            $objErr = new SC_CheckError_Ex($arrRet);
            $objErr->arrErr = $objFormParam->checkError();

            // 複数項目チェック
            if ($tpl_classcat_find1) {
                $objErr->doFunc(array('規格1', 'classcategory_id1'), array('EXIST_CHECK'));
            }
            if ($tpl_classcat_find2) {
                $objErr->doFunc(array('規格2', 'classcategory_id2'), array('EXIST_CHECK'));
            }
            break;
        }

        return $objErr->arrErr;
    }

}
