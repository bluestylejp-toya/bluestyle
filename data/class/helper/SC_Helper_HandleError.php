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

/**
 * エラーハンドリングのクラス
 *
 * 依存するクラスに構文エラーがあると、捕捉できない。よって、依存は最小に留めること。
 * 現状 GC_Utils_Ex(GC_Utils) に依存しているため、その中で構文エラーは捕捉できない。
 * @package Helper
 * @version $Id$
 */
class SC_Helper_HandleError
{
    /** エラー処理中か */
    static $under_error_handling = false;

    /**
     * 処理の読み込みを行う
     *
     * @return void
     */
    public static function load()
    {
        // E_DEPRECATED 定数 (for PHP < 5.3)
        // TODO バージョン互換処理に統合したい。
        if (!defined('E_DEPRECATED')) {
            define('E_DEPRECATED', 8192);
        }

        // エラーレベル設定 (PHPのログに対する指定であり、以降のエラーハンドリングには影響しない模様)
        // 開発時は -1 (全て) を推奨
        error_reporting(E_ALL & ~E_NOTICE & ~E_USER_NOTICE & ~E_DEPRECATED & ~E_STRICT);

        ini_set('log_errors_max_len', 1024 * 50);

        if (!(defined('SAFE') && SAFE === true) && !(defined('INSTALL_FUNCTION') && INSTALL_FUNCTION === true)) {
            // E_USER_ERROR または警告を捕捉した場合のエラーハンドラ
            set_error_handler(array(__CLASS__, 'handle_warning'), E_USER_ERROR | E_WARNING | E_USER_WARNING | E_CORE_WARNING | E_COMPILE_WARNING);

            // E_USER_ERROR 以外のエラーを捕捉した場合の処理用
            set_exception_handler(array(__CLASS__, 'handle_exception'));
            // 以降の処理では画面へのエラー表示は行なわない
            ini_set('display_errors', 0);
        }
    }

    /**
     * 警告や E_USER_ERROR を捕捉した場合にエラー画面を表示させるエラーハンドラ関数.
     *
     * この関数は, set_error_handler() 関数に登録するための関数である.
     * trigger_error にて E_USER_ERROR が生成されると, エラーログを出力した後,
     * エラー画面を表示させる.
     * E_WARNING, E_USER_WARNING が発生した場合、ログを記録して、true を返す。
     * (エラー画面・エラー文言は表示させない。)
     *
     * @param  integer      $errno   エラーコード
     * @param  string       $errstr  エラーメッセージ
     * @param  string       $errfile エラーが発生したファイル名
     * @param  integer      $errline エラーが発生した行番号
     * @return void|boolean E_USER_ERROR が発生した場合は, エラーページへリダイレクト;
     *                      E_WARNING, E_USER_WARNING が発生した場合、true を返す
     */
    public static function handle_warning($errno, $errstr, $errfile, $errline)
    {
        // error_reporting 設定に含まれていないエラーコードは処理しない
        if (!(error_reporting() & $errno)) {
            return;
        }

        $error_type_name = GC_Utils_Ex::getErrorTypeName($errno);

        switch ($errno) {
            case E_USER_ERROR:
                throw new ErrorException($errstr, 0, $errno, $errfile, $errline);
                break;

            case E_WARNING:
            case E_USER_WARNING:
            case E_CORE_WARNING:
            case E_COMPILE_WARNING:
                $message = "Warning($error_type_name): $errstr on [$errfile($errline)]";
                GC_Utils_Ex::gfPrintLog($message, ERROR_LOG_REALFILE);

                return true;

            default:
                break;
        }
    }

    public static function handle_exception(Throwable $e)
    {
        $errstr = (string)$e;

        // 例外メッセージにバックトレースを含むため、第3引数 ($verbose) は無効 (false) としている。厳密には、ログイン情報が出力されない欠点がある。
        GC_Utils_Ex::gfPrintLog($errstr, ERROR_LOG_REALFILE, false);

        // エラー画面を表示する
        SC_Helper_HandleError_Ex::displaySystemError($errstr);
    }

    /**
     * エラー画面を表示する
     *
     * @param  string|null $errstr エラーメッセージ
     * @return void
     */
    public static function displaySystemError($errstr = null)
    {
        SC_Helper_HandleError_Ex::$under_error_handling = true;

        ob_clean();

        if (PHP_SAPI === 'cli') {
            fwrite(STDERR, $errstr . "\n");
            exit(1);
        }

        require_once CLASS_EX_REALDIR . 'page_extends/error/LC_Page_Error_SystemError_Ex.php';
        $objPage = new LC_Page_Error_SystemError_Ex();
        $objPage->init();
        if (isset($errstr)) {
            $objPage->addDebugMsg($errstr);
        }
        $objPage->process();
    }
}
