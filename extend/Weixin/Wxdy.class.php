<?php
/**
 * 微信订阅号操作类
 * @time  2016-07-24
 */
namespace Weixin;

class Wxdy {
	
	
	/**
     * 微信api根路径
     * @var string
     */
    private $apiURL    = 'https://api.weixin.qq.com/cgi-bin';
	
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
		$this->appid=isset($config['appid'])?$config['appid']:C('WEIXIN.AppID');
		$this->secret=isset($config['secret'])?$config['secret']:C('WEIXIN.AppSecret');
		//获取access_token
		if(!S('access_token_wx')){
			$this->get_access_token();
		}
		//jsapi初始化
    	if($this->getjsapi){
    		$param=array(
    			'type'=>'jsapi'
			);
			$jsapi_ticket=$this->api('ticket/getticket','','GET',$param);
			if(!S('jsapi_ticket')){
			    $jsapi_ticket=$this->api('ticket/getticket','','GET',$param);
			    S('jsapi_ticket',$jsapi_ticket,$jsapi_ticket['expires_in']);
			}else{
				$jsapi_ticket=S('jsapi_ticket');
			}
			$jsapi_ticket=$this->api('ticket/getticket','','GET',$param);
			$noncestr=uniqid();
			$timestamp=time();
			$url="http://{$_SERVER['HTTP_HOST']}{$_SERVER['REQUEST_URI']}";
			$param=array(
				'noncestr'=>$noncestr,
				'jsapi_ticket'=>$jsapi_ticket['ticket'],
				'timestamp'=>$timestamp,
				'url'=>$url,
			);
			ksort($param);
			
			$signstr="";
			$i=0;
			foreach ($param as $k => $v) {
				if($i==0){
				    $signstr.=$k.'='.$v;
				}else{
					$signstr.="&".$k.'='.$v;
				}
				$i++;
			}
			$this->jsapi_config=array(
				'appId'=>C('WEIXIN.AppID'),
				'timestamp'=>$timestamp,
				'nonceStr'=>$noncestr,
				'signature'=>sha1($signstr)
			);
		}
		
    }

	/**
     * 获取access_token，用于后续接口访问
     * @return array access_token信息，包含 token 和有效期
     */
    public function get_access_token($type = 'client', $code = null){
        $param = array(
            'appid'  => $this->appid,
            'secret' => $this->secret
        );

        switch ($type) {
            case 'client':
                $param['grant_type'] = 'client_credential';
                $url = "{$this->apiURL}/token";
                break;

            case 'code':
                $param['code'] = $code;
                $param['grant_type'] = 'authorization_code';
                $url = "{$this->oauthApiURL}/oauth2/access_token";
                break;
            
            default:
                throw new \Exception('不支持的grant_type类型！');
                break;
        }

        $token = self::http($url, $param);
        $token = json_decode($token, true);
		
        if(is_array($token)){
            if(isset($token['errcode'])){
                throw new \Exception($token['errmsg']);
            } else {
            	S('access_token_wx',$token['access_token'],5000);
                return $token;
            }
        } else {
            throw new \Exception('获取微信access_token失败！');
        }
    }
	
	/**
     * 调用微信api获取响应数据
     * @param  string $name   API名称
     * @param  string $data   POST请求数据
     * @param  string $method 请求方式
     * @param  string $param  GET请求参数
     * @return array          api返回结果
     */
    public function api($name, $data = '', $method = 'POST', $param = ''){
        $params = array('access_token' => S('access_token_wx'));

        if(!empty($param) && is_array($param)){
            $params = array_merge($params, $param);
        }

        $url  = "{$this->apiURL}/{$name}";
        if(!empty($data)){
            //保护中文，微信api不支持中文转义的json结构
            array_walk_recursive($data, function(&$value){
                $value = urlencode($value);
            });
            $data = urldecode(json_encode($data));
        }
        $data = self::http($url, $params, $data, $method);
        return json_decode($data, true);
    }
	
	
    /**
     * 发送HTTP请求方法，目前只支持CURL发送请求
     * @param  string $url    请求URL
     * @param  array  $param  GET参数数组
     * @param  array  $data   POST的数据，GET请求时该参数无效
     * @param  string $method 请求方法GET/POST
     * @return array          响应数据
     */
    protected static function http($url, $param, $data = '', $method = 'GET'){
        $opts = array(
            CURLOPT_TIMEOUT        => 30,
            CURLOPT_RETURNTRANSFER => 1,
            CURLOPT_SSL_VERIFYPEER => false,
            CURLOPT_SSL_VERIFYHOST => false,
        );

        /* 根据请求类型设置特定参数 */
        $opts[CURLOPT_URL] = $url . '?' . http_build_query($param);

        if(strtoupper($method) == 'POST'){
            $opts[CURLOPT_POST] = 1;
            $opts[CURLOPT_POSTFIELDS] = $data;
            
            if(is_string($data)){ //发送JSON数据
                $opts[CURLOPT_HTTPHEADER] = array(
                    'Content-Type: application/json; charset=utf-8',  
                    'Content-Length: ' . strlen($data),
                );
            }
        }

        /* 初始化并执行curl请求 */
        $ch = curl_init();
        curl_setopt_array($ch, $opts);
        $data  = curl_exec($ch);
        $error = curl_error($ch);
        curl_close($ch);

        //发生错误，抛出异常
        if($error) throw new \Exception('请求发生错误：' . $error);

        return  $data;
    }

}
