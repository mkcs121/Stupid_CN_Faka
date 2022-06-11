<?php

namespace upgrade;

use think\Config;
use think\Db;
use think\Exception;
use ZipArchive;

/**
 * 插件服务
 * @package upgrade
 */
class Service
{

    public static function checkplug($name, $extend = [])
    {
	    set_time_limit(0); 
        
      
        $options = [
            CURLOPT_CONNECTTIMEOUT => 30,
            CURLOPT_TIMEOUT        => 30,
            CURLOPT_SSL_VERIFYPEER => false,
            CURLOPT_HTTPHEADER     => [
                'X-REQUESTED-WITH: XMLHttpRequest'
            ]
        ];
        $url=self::getServerUrl(). '/api/plug/downloadzq';
        $ret = Http::sendRequest( $url, array_merge(['name' => $name], $extend), 'GET', $options);
        if ($ret['ret']) {
            $ret['msg']=json_decode($ret['msg'], true);
            if (substr($ret['msg'], 0, 1) == '{') {
                $json = (array)json_decode($ret['msg'], true);
				if($json['code'] == '0'){
					throw new Exception($json['msg']);
				}else{
				
				}
            }
            
           
        }
       

    }
    
    /**
     * 远程下载插件
     *
     * @param   string $name 插件名称
     * @param   array $extend 扩展参数
     * @return  string
     * @throws  Exception
     */
    public static function download($name, $extend = [])
    {
	    set_time_limit(0); 
        $tp5upgradeTmpDir = RUNTIME_PATH . 'tp5upgrade' . DS;
        if (!is_dir($tp5upgradeTmpDir)) {
            @mkdir($tp5upgradeTmpDir, 0755, true);
        }
        $tmpFile = $tp5upgradeTmpDir . $name . ".zip";
        $options = [
            CURLOPT_CONNECTTIMEOUT => 30,
            CURLOPT_TIMEOUT        => 30,
            CURLOPT_SSL_VERIFYPEER => false,
            CURLOPT_HTTPHEADER     => [
                'X-REQUESTED-WITH: XMLHttpRequest'
            ]
        ];
        $url=self::getServerUrl(). '/api/index/downloadzq';
        $ret = Http::sendRequest( $url, array_merge(['name' => $name], $extend), 'GET', $options);
        if ($ret['ret']) {
            $ret['msg']=json_decode($ret['msg'], true);;
            if (substr($ret['msg'], 0, 1) == '{') {
                $json = (array)json_decode($ret['msg'], true);
                
                	if($json['code'] == '0'){
					throw new Exception($json['msg']);
				}else{
				    
                //如果传回的是一个下载链接,则再次下载
                if ($json['data'] && isset($json['data']['url'])) {
                    array_pop($options);
                    $ret = Http::sendRequest($json['data']['url'], [], 'GET', $options);
                    if (!$ret['ret']) {
                        //下载返回错误，抛出异常
                        throw new Exception($json['msg'], $json['code'], $json['data']);
                    }
                } else {
                    //下载返回错误，抛出异常
                    throw new Exception($json['msg'], $json['code'], $json['data']);
                }
			  }
            }
            if ($write = fopen($tmpFile, 'w')) {
                fwrite($write, $ret['msg']);
                fclose($write);
                return $tmpFile;
            }
            throw new Exception("没有权限写入临时文件");
        }
        throw new Exception("无法下载远程文件");
    }
	
	
	
	public static function plugdownload($name, $extend = [])
    {
	    set_time_limit(0); 
        $tp5upgradeTmpDir = RUNTIME_PATH . 'tp5upgrade' . DS;
        if (!is_dir($tp5upgradeTmpDir)) {
            @mkdir($tp5upgradeTmpDir, 0755, true);
        }
        $tmpFile = $tp5upgradeTmpDir . $name . ".zip";
        $options = [
            CURLOPT_CONNECTTIMEOUT => 30,
            CURLOPT_TIMEOUT        => 30,
            CURLOPT_SSL_VERIFYPEER => false,
            CURLOPT_HTTPHEADER     => [
                'X-REQUESTED-WITH: XMLHttpRequest'
            ]
        ];
        $url=self::getServerUrl(). '/api/plug/download';
        $ret = Http::sendRequest( $url, array_merge(['name' => $name], $extend), 'GET', $options);
        if ($ret['ret']) {
            $ret['msg']=json_decode($ret['msg'], true);
            if (substr($ret['msg'], 0, 1) == '{') {
                $json = (array)json_decode($ret['msg'], true);
				if($json['code'] == '0'){
					throw new Exception($json['msg']);
				}else{
					//如果传回的是一个下载链接,则再次下载
					if ($json['data'] && isset($json['data']['url'])) {
						array_pop($options);
						$ret = Http::sendRequest($json['data']['url'], [], 'GET', $options);
						if (!$ret['ret']) {
							//下载返回错误，抛出异常
							throw new Exception($json['msg'], $json['code'], $json['data']);
						}
					} else {
						//下载返回错误，抛出异常
						throw new Exception($json['msg'], $json['code'], $json['data']);
					}
				}
            }
            if ($write = fopen($tmpFile, 'w')) {
                fwrite($write, $ret['msg']);
                fclose($write);
                return $tmpFile;
            }
            throw new Exception("没有权限写入临时文件");
        }
        throw new Exception("无法下载远程文件");
    }

    /**
     * 解压插件
     *
     * @param   string $name 插件名称
     * @return  string
     * @throws  Exception
     */
    public static function unzip($name)
    {
        $tp5upgradeTmpDir = RUNTIME_PATH . 'tp5upgrade' . DS;
        if (!is_dir($tp5upgradeTmpDir)) {
            @mkdir($tp5upgradeTmpDir, 0755, true);
        }
        $file = RUNTIME_PATH . 'tp5upgrade' . DS . $name . '.zip';
        $dir = UPGRADE_PATH . $name . DS;
        if (class_exists('ZipArchive')) {
            $zip = new ZipArchive;
            if ($zip->open($file) !== TRUE) {
                throw new Exception('Unable to open the zip file');
            }
            if (!$zip->extractTo($dir)) {
                $zip->close();
                throw new Exception('Unable to extract the file');
            }
            $zip->close();
            return $dir;
        }
        throw new Exception("无法执行解压操作，请确保ZipArchive安装正确");
    }
	
	public static function plugunzip($name)
    {
        $tp5upgradeTmpDir = RUNTIME_PATH . 'tp5upgrade' . DS;
        if (!is_dir($tp5upgradeTmpDir)) {
            @mkdir($tp5upgradeTmpDir, 0755, true);
        }
        $file = RUNTIME_PATH . 'tp5upgrade' . DS . $name . '.zip';
        $dir = UPGRADE_PATH . $name . DS;
        if (class_exists('ZipArchive')) {
            $zip = new ZipArchive;
            if ($zip->open($file) !== TRUE) {
                throw new Exception('请先购买授权在进行下载安装！');
            }
            if (!$zip->extractTo($dir)) {
                $zip->close();
                throw new Exception('Unable to extract the file');
            }
            $zip->close();
            return $dir;
        }
        throw new Exception("无法执行解压操作，请确保ZipArchive安装正确");
    }

    /**
     * 导入SQL
     *
     * @param   string $name 插件名称
     * @return  boolean
     */
    public static function importsql($name)
    {
        $sqlFile = UPGRADE_PATH . $name . DS . 'install.sql';
        if (is_file($sqlFile)) {
            $lines = file($sqlFile);
            $templine = '';
            foreach ($lines as $line) {
                if (substr($line, 0, 2) == '--' || $line == '' || substr($line, 0, 2) == '/*')
                    continue;

                $templine .= $line;
                if (substr(trim($line), -1, 1) == ';') {
                    $templine = str_ireplace('__PREFIX__', config('database.prefix'), $templine);
                    $templine = str_ireplace('INSERT INTO ', 'INSERT IGNORE INTO ', $templine);
                    try {
                        Db::clear();
                        //必须重连一次
                        Db::connect([], true)->query("select 1");
                        //Db::getPdo()->exec($sql);
                        Db::getPdo()->exec($templine);
                    } catch (\PDOException $e) {
                        $e->getMessage();
                    }
                    $templine = '';
                }
            }
        }
        return true;
    }

    /**
     * 升级插件
     *
     * @param string $name 插件名称
     * @param array $extend 扩展参数
     * @throws Exception
     */
    public static function upgrade($name, $extend = [])
    {

        // 远程下载插件
        $tmpFile = Service::download($name, $extend);

        // 解压插件
        $addonDir = Service::unzip($name);

        // 移除临时文件
        @unlink($tmpFile);

        foreach (self::getCheckDirs() as $k => $dir) {
            if (is_dir($addonDir . $dir)) {
                copydirs($addonDir . $dir, ROOT_PATH);
            }
        }


        // 导入
        Service::importsql($name);


        return true;
    }
	
	
	 public static function plugupgrade($name, $extend = [])
    {

        // 远程下载插件
        $tmpFile = Service::plugdownload($name, $extend);

        // 解压插件
        $addonDir = Service::plugunzip($name);

        // 移除临时文件
        @unlink($tmpFile);

        foreach (self::getCheckDirs() as $k => $dir) {
            if (is_dir($addonDir . $dir)) {
                copydirs($addonDir . $dir, ROOT_PATH);
            }
        }


        // 导入
        Service::importsql($name);


        return true;
    }

    /**
     * 获取远程服务器
     * @return  string
     */
    protected static function getServerUrl()
    {
        return config('upgrade.api_url');
    }

    /**
     * 获取检测的全局文件夹目录
     * @return  array
     */
    protected static function getCheckDirs()
    {
        return [
            Config::get('upgrade.file_dir')
        ];
    }

}
