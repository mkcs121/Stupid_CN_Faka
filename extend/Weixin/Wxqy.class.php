<?php
//微信企业号操作类
namespace Weixin;

class Wxqy {
    
	/**
     * 微信api根路径
     * @var string
     */
    private $apiURL    = 'https://qyapi.weixin.qq.com/cgi-bin';
	

    /**
     * 构造方法，用于实例化微信SDK
     * 自动回复消息时实例化该SDK
     * @param  $getcode 是否获取code 默认false
	 * @param  $getjsapi  是否获取jsapi参数 
	 * @param  $getjsapiadmin  是否获取企业管理组jsapi参数
	 * @param  $corpid 
	 * @param  $corpsecret
     */
    public function __construct($config=array()){
    	foreach ($config as $k => $v) {
    		$this->$k=$v;
    	}
		$this->corpid=isset($config['corpid'])?$config['corpid']:C('WEIXIN.corpid');
		$this->corpsecret=isset($config['corpsecret'])?$config['corpsecret']:C('WEIXIN.corpsecret');
    }
	
    
    /**
     * 获取openid
     * @return string openid
     */
    public function getOpenid(){
    	if(cookie('wxqy_openid')){
    	    return cookie('wxqy_openid');
    	}
    	$userid=$this->getUserid();
    	$re=$this->api('user/convert_to_openid','',array('userid'=>$userid),'POST');
		if(!$re['openid']){
			header("location:/v/index/model_id/1/tpl/Weixinchajian_index");
		}
		cookie('wxqy_openid',$re['openid'],86400);
		return $re['openid'];
    }
	
	
	/**
     * 获取user
     * @return string userid
     */
    public function getUserid(){
    	if(session('user_auth.username')){
    	   return session('user_auth.username');
    	}
    	if(cookie('wxqy_userid')){
    	    return cookie('wxqy_userid');
    	}
    	$code=isset($_REQUEST['code'])?$_REQUEST['code']:'';
		if(empty($code)){
			$url = "http://{$_SERVER['HTTP_HOST']}{$_SERVER['REQUEST_URI']}";
			echo '<script type="text/javascript">location.href="https://open.weixin.qq.com/connect/oauth2/authorize?appid='.$this->corpid.'&redirect_uri='.$url.'&response_type=code&scope=snsapi_base#wechat_redirect"</script>';
			die;
		}
		$param=array(
			'code'=>$code
		);
		$userinfo=$this->api('user/getuserinfo',$param);
		$userid=$userinfo['UserId'];
		cookie('wxqy_userid',$userid,86400);
		return $userid;
    }
	
	/**
     * 获取jsapi
     * @return array jsapi信息
     */
    public function getJsapiConfig(){
    	if(S('jsapi_ticket_wx_qy')){
    	    $jsapi_ticket=S('jsapi_ticket_wx_qy');
    	}else{
    		$jsapi_ticket=$this->api('get_jsapi_ticket');
			S('jsapi_ticket_wx_qy',$jsapi_ticket,3600);
    	}
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
		
		return array(
			'appId'=>$this->corpid,
			'timestamp'=>$timestamp,
			'nonceStr'=>$noncestr,
			'signature'=>sha1($signstr)
		);
    }
	
	
	
	/**
     * 获取用户信息
     * @return array
     */
    public function getUserinfo(){
    	$userid=$this->getUserid();
    	$re=$this->api('user/get',array('userid'=>$userid));
		sort($re['department']);
		$department=$this->api('department/list',array('id'=>$re['department'][0]));
		$re['department_name']=$department['department'][0]['name'];
		return $re;
    }
	
	
	/**
     * 判断是否属于某个标签
	 * @param  $tagid 标签id
     * @return boolean
     */
    public function inTag($tagid){
    	$userid=$this->getUserid();
    	$list_user=$this->api('tag/get',array('tagid'=>$tagid));
		$list_user=$list_user['userlist'];
		foreach ($list_user as $k => $v) {
			if($v['userid']==$userid){
			    return true;
			}
		}
		return false;
    }
	
	
	/**
     * 判断是否属于某个部门
	 * @param  $department 部门id
     * @return boolean
     */
    public function inDepartment($department){
    	$userinfo=$this->getUserinfo();
		if(in_array($department, $userinfo['department_id'])){
		    return true;
		}
		return false;
    }
	

    
    /**
     * 获取access_token，用于后续接口访问
     * @return array access_token信息，包含 token 和有效期
     */
    public function getAccessToken(){
    	if(S('access_token_wx_qy_'.$this->AgentId)){
    	    return S('access_token_wx_qy_'.$this->AgentId);
    	}
    	$param=array(
			'corpid'=>$this->corpid,
			'corpsecret'=>$this->corpsecret
		);
        $url = "{$this->apiURL}/gettoken";
		$token = self::http($url, $param);
		$token = json_decode($token,true);
		S('access_token_wx_qy_'.$this->AgentId,$token['access_token'],3600);
		return $token['access_token'];
    }

	
	/**
     * 调用微信api获取响应数据
     * @param  string $name   API名称
     * @param  string $data   POST请求数据
     * @param  string $method 请求方式
     * @param  string $param  GET请求参数
     * @return array          api返回结果
     */
    public function api($name, $param = '', $data = '', $method = 'GET'){
		$params['access_token']=$this->getAccessToken();
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
		$data=json_decode($data, true);
		if($data['errcode']>0){
			$params['access_token']=$this->getAccessToken();
		    $data = self::http($url, $params, $data, $method);
			$data=json_decode($data, true);
		}
        return $data;
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
