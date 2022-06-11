<?php
// +----------------------------------------------------------------------
// | 自动发卡平台
// +----------------------------------------------------------------------
// | author: Veris.
// +----------------------------------------------------------------------
if(version_compare(PHP_VERSION,'7.0.0','<'))  die('本系统要求PHP版本 >= 7.0.0，当前PHP版本为：'.PHP_VERSION . '，请到虚拟主机控制面板里切换PHP版本，或联系空间商协助切换。<a href="http://www.mfxw.cc/" target="_blank">购买自动发卡平台源码请到</a>');
// +----------------------------------------------------------------------
if(version_compare(PHP_VERSION,'7.0.99','>'))  die('本系统不能高于PHP7.0版，请降低您的PHP版本，当前PHP版本为：'.PHP_VERSION . '，请到虚拟主机控制面板里切换PHP版本，或联系空间商协助切换。<a href="http://www.mfxw.cc" target="_blank">购买自动发卡平台源码请到</a>');
// error_reporting(E_ALL ^ E_NOTICE);//显示除去 E_NOTICE 之外的所有错误信息
error_reporting(E_ERROR | E_WARNING | E_PARSE);//报告运行时错误

// 检测是否已安装EyouCMS系统
if(file_exists("./install/") && !file_exists("./install/install.lock")){
    header('Location:./install/index.php');
    exit(); 
}
/* SESSION会话名称 */
session_name('s' . substr(md5(__FILE__), 0, 8));

/* 定义应用目录 */
define('APP_PATH', __DIR__ . '/application/');

/* 定义Runtime运行目录 */
define('RUNTIME_PATH', __DIR__ . '/runtime/');

/* 加载框架引导文件 */
require __DIR__ . '/framework/start.php';
