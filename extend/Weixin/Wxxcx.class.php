<?php
/**
 * 微信小程序操作类
 * @time  2016-07-24
 */
namespace Weixin;

class Wxxcx {
	
	public $appid;
	public $secret;	
	
     /**
     * 构造方法，用于实例化微信SDK
     * 自动回复消息时实例化该SDK
	 * @param  $getjsapi  是否获取jsapi参数 
	 * @param  $appid 
	 * @param  $secret
     */
    public function __construct($config=array()){
    	foreach ($config as $k => $v) {
    		$this->$k=$v;
    	}
		$this->appid=isset($config['appid'])?$config['appid']:(C('WEIXIN.XCX_AppID')?C('WEIXIN.XCX_AppID'):C('WEIXIN.AppID'));
		$this->secret=isset($config['secret'])?$config['secret']:(C('WEIXIN.XCX_AppSecret')?C('WEIXIN.XCX_AppSecret'):C('WEIXIN.AppSecret'));
    }

	/**
	 * 检验数据的真实性，并且获取解密后的明文.
	 * @param $encryptedData string 加密的用户数据
	 * @param $iv string 与用户数据一同返回的初始向量
	 * @param $data string 解密后的原文
     *
	 * @return int 成功0，失败返回对应的错误码
	 */
	public function decryptData( $encryptedData, $iv,$session_key){
		
		
		if (strlen($session_key) != 24) {
			return ErrorCode::$IllegalAesKey;
		}
		$aesKey=base64_decode($session_key);

        
		if (strlen($iv) != 24) {
			return ErrorCode::$IllegalIv;
		}
		$aesIV=base64_decode($iv);

		$aesCipher=base64_decode($encryptedData);

		$result=openssl_decrypt( $aesCipher, "AES-128-CBC", $aesKey, 1, $aesIV);

		$dataObj=json_decode( $result,true);
		
		if( $dataObj  == NULL ){
			return ErrorCode::$IllegalBuffer;
		}
		
		if( $dataObj['watermark']['appid'] != $this->appid ){
			return ErrorCode::$IllegalBuffer;
		}
		
		
		
		return $dataObj;
	}
}


/**
 * error code 说明.
 * <ul>

 *    <li>-41001: encodingAesKey 非法</li>
 *    <li>-41003: aes 解密失败</li>
 *    <li>-41004: 解密后得到的buffer非法</li>
 *    <li>-41005: base64加密失败</li>
 *    <li>-41016: base64解密失败</li>
 * </ul>
 */
class ErrorCode
{
	public static $OK = 0;
	public static $IllegalAesKey = -41001;
	public static $IllegalIv = -41002;
	public static $IllegalBuffer = -41003;
	public static $DecodeBase64Error = -41004;
}