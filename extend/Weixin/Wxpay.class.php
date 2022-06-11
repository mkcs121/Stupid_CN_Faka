<?php
/**
 * 官方文档：https://pay.weixin.qq.com/wiki/doc/api/index.html
 * 
 * @author 建站宝
 * @date 2017-08-15
 */
namespace Weixin;

class Wxpay{
    public $parameters; //提交参数，数组
	public $returnParameters;//返回参数，数组
	public $appid;
	public $secret;
	
    //证书路径,注意应该填写绝对路径
    //本例程通过curl使用HTTP POST方法，此处可修改其超时时间，默认为30秒
    public $CURL_TIMEOUT = 30;
    public function __construct($config=array()) {
    	foreach ($config as $k => $v) {
    		$this->$k=$v;
    	}
    	
    	$this->SSLCERT_PATH='';
    	$this->SSLKEY_PATH='';
		
		$this->appid=sysconf('wechat_appid');
		$this->secret=sysconf('wechat_appsecret');
		$this->mchid=sysconf('wechat_mchid');
		$this->key=sysconf('wechat_key');
    }
	
	
	/**
     * 调用微信api获取响应数据
     * @param  string $name   API名称
     * @param  string $data   POST请求数据
     * @param  string $ca   是否使用证书
     * @return array          api返回结果
     */
    public function api($name='',$data=array(),$ca=false){
    	$url="https://api.mch.weixin.qq.com/".$name;
		$xml=$this->createXml($data);
		if($ca){
		    $re = $this->postXmlSSLCurl($xml,$url,$this->CURL_TIMEOUT);
		}else{
			$re=$this->postXmlCurl($xml, $url, $this->CURL_TIMEOUT);
		}
		return $this->xmlToArray($re);
    }
    
    
    /**
     * 公众号及小程序支付
     * @param $param['title'] 支付标题
     * @param $param['orderno'] 订单号
     * @param $param['amount'] 金额
     * @param $param['notify_url'] 通知地址
     * @param $param['openid'] 微信openid
     */
    public function js($param){
    	$this->parameters['appid']=$this->appid;
		$this->parameters['mch_id']=$this->mchid;
		$this->parameters['nonce_str']=uniqid();
		$this->parameters['spbill_create_ip']=$this->get_client_ip();
		$this->parameters['trade_type']='JSAPI';
		$this->parameters['openid']=$param['openid'];
    	$this->parameters['body']=$param['title'];  
        $this->parameters['out_trade_no'] =$param['orderno']; 
        $this->parameters['total_fee'] = $param['amount']*100;
        $this->parameters['notify_url'] = $param['notify_url'];
        $re = $this->api('pay/unifiedorder',$this->parameters);
        
        $data=[
        	'appId'=>$this->appid,
        	'timeStamp'=>(string)time(),
        	'nonceStr'=>uniqid(),
        	'package'=>'prepay_id='.$re['prepay_id'],
        	'signType'=>'MD5',
        ];
        $data['paySign'] = $this->getSign($data);
        
      	return $data;
    }
    
    
    /**
     * 	作用：扫码支付
     */
    public function pc($param){
    	$this->parameters['body']=$param['title'];  
        $this->parameters['out_trade_no'] =$param['orderno']; 
        $this->parameters['total_fee'] = $param['amount']*100;
        $this->parameters['notify_url'] = $param['notify_url'];
        
        $this->parameters['appid']=$this->appid;
		$this->parameters['mch_id']=$this->mchid;
		$this->parameters['nonce_str']=uniqid();
		$this->parameters['spbill_create_ip']=$this->get_client_ip();
		$this->parameters['trade_type']='NATIVE';
        $result = $this->api('pay/unifiedorder',$this->parameters);
        return $result['code_url'];
    }
	
	/**
     * 	作用：扫码支付
     */
    public function qrcode($param){
    	$this->parameters['body']=$param['title'];  
        $this->parameters['out_trade_no'] =$param['orderno']; 
        $this->parameters['total_fee'] = $param['amount']*100;
        $this->parameters['notify_url'] = $param['notify_url'];
        
        $this->parameters['appid']=$this->appid;
		$this->parameters['mch_id']=$this->mchid;
		$this->parameters['nonce_str']=uniqid();
		$this->parameters['spbill_create_ip']=$this->get_client_ip();
		$this->parameters['trade_type']='NATIVE';
        $result = $this->api('pay/unifiedorder',$this->parameters);
        $url=$result['code_url'];
	    return [
	    	'url'=>'/pub/qrcode/index/url/'.base64_encode_url($url),
	    	'amount'=>$param['amount'],
	    	'orderinfo'=>$param,
	    	'code'=>0
	    ];
    }
	
	/**
     * 	作用：H5支付
     */
    public function wap($param){
    	$this->parameters['body']=$param['title'];  
        $this->parameters['out_trade_no'] =$param['orderno']; 
        $this->parameters['total_fee'] = $param['amount']*100;
        $this->parameters['notify_url'] = $param['notify_url'];
        
		$this->parameters['appid']=$this->appid;
		$this->parameters['mch_id']=$this->mchid;
		$this->parameters['nonce_str']=uniqid();
		$this->parameters['spbill_create_ip']=$this->get_client_ip();
		$this->parameters['trade_type']='MWEB';
        $result = $this->api('pay/unifiedorder',$this->parameters);
        return $result['mweb_url'];
    }
    public function getH5Api(){
		$this->parameters['appid']=$this->appid;
		$this->parameters['mch_id']=$this->mchid;
		$this->parameters['nonce_str']=uniqid();
		$this->parameters['spbill_create_ip']=$this->get_client_ip();
		$this->parameters['trade_type']='MWEB';
        $result = $this->api('pay/unifiedorder',$this->parameters);
        return $result['mweb_url'];
    }
	
	
	/**
     * 	作用：扫码支付
     */
    public function getCodeApi(){
		$this->parameters['appid']=$this->appid;
		$this->parameters['mch_id']=$this->mchid;
		$this->parameters['nonce_str']=uniqid();
		$this->parameters['spbill_create_ip']=$this->get_client_ip();
		$this->parameters['trade_type']='NATIVE';
        $result = $this->api('pay/unifiedorder',$this->parameters);
        return $result['code_url'];
    }
	
	
	/**
     * 	作用：设置jsapi的参数
     */
    public function getAppApi(){
		$param['appid'] = $this->appid;
		$param['partnerid'] = $this->mchid;
		$param['prepayid']  = $this->getPrepayId();
		$param['package']  = "Sign=WXPay";
		$param['noncestr'] =  uniqid();
		$param['timestamp'] = (string)time();
		$param['sign'] = $this->getSign($param);
      	return $param;
    }
    
    
	/**
     * 	app支付
     */
    public function app($param){
    	$this->parameters['appid']=$this->appid;
		$this->parameters['mch_id']=$this->mchid;
		$this->parameters['nonce_str']=uniqid();
		$this->parameters['spbill_create_ip']=$this->get_client_ip();
		$this->parameters['trade_type']='APP';
    	$this->parameters['body']=$param['title'];  
        $this->parameters['out_trade_no'] =$param['orderno']; 
        $this->parameters['total_fee'] = $param['amount']*100;
        $this->parameters['notify_url'] = $param['notify_url'];
        $re = $this->api('pay/unifiedorder',$this->parameters);
        
        $data=[
        	'appid'=>$this->appid,
        	'noncestr'=>$re['nonce_str'],
        	'package'=>'Sign=WXPay',
        	'partnerid'=>$re['mch_id'],
        	'prepayid'=>$re['prepay_id'],
        	'timestamp'=>time(),
        ];
        
        $data['sign'] = $this->getSign($data);
        
      	return json_encode($data);
    }
	
    /**
     * 	作用：设置jsapi的参数
     */
    public function getJsApi(){
        $jsApiObj['appId'] = $this->appid;
        //请求生成支付签名时需要,js调起支付参数中不需要
        $timeStamp = (string)time();
        $jsApiObj['timeStamp'] = $timeStamp;
        //用大写的timeStamp参数请求生成支付签名
        $jsParamObj['timeStamp'] = $timeStamp;
        $jsParamObj['appId'] = $this->appid;
        $jsParamObj['nonceStr'] = $jsApiObj['nonceStr'] = uniqid();
        $jsParamObj['package'] = $jsApiObj['package'] = "prepay_id=".$this->getPrepayId();
        $jsParamObj['signType'] = $jsApiObj['signType'] = 'MD5';
        $jsParamObj['paySign'] = $jsApiObj['paySign'] = $this->getSign($jsApiObj);
        $jsParam = json_encode($jsParamObj);
        return $jsParam;
    }
    /**
     * 获取prepay_id
     */
    public function getPrepayId(){
    	$this->parameters['appid']=$this->appid;
		$this->parameters['mch_id']=$this->mchid;
		$this->parameters['nonce_str']=uniqid();
		$this->parameters['spbill_create_ip']=$this->get_client_ip();
        $result = $this->api('pay/unifiedorder',$this->parameters);
        return $result['prepay_id'];
    }
    
    /**
	 * 付款到个人钱包
	 * @param $param['title'] 支付标题
     * @param $param['orderno'] 订单号
     * @param $param['amount'] 金额
     * @param $param['openid'] 微信openid
     * @param $param['check'] 是否验证用户姓名
     * @param $param['name'] 用户姓名
	 */
	public function pay($param){
		
		$this->parameters['mch_appid']=$this->appid;
		$this->parameters['mchid']=$this->mchid;
		$this->parameters['nonce_str']=uniqid();
		$this->parameters['spbill_create_ip']=$this->get_client_ip();
		
		$this->parameters['partner_trade_no']=$param['orderno'];
		$this->parameters['openid']=$param['openid'];
		$this->parameters['desc']=$param['title'];
		$this->parameters['amount']=$param['amount']*100;
		$this->parameters['check_name']=$param['check']?'FORCE_CHECK':'NO_CHECK';
		if($param['check']){
		    $this->parameters['re_user_name']=$param['name'];
		}
		
		
		$re=$this->api('mmpaymkttransfers/promotion/transfers',$this->parameters,true);
		if($re['return_code']=='SUCCESS' && $re['result_code']=='SUCCESS'){
		    return [
		    	'cod'=>0,
				'pay_no'=>$re['payment_no'],
				'pay_time'=>strtotime($re['payment_time']),
				'orderno'=>$re['partner_trade_no'],
			];
		}else{
			return [
				'code'=>1,
				'err_code'=>$re['err_code'],
				'err_msg'=>$re['err_code_des'],
			];
		}
		
	}
    
	
    /**
     * 	作用：以post方式提交xml到对应的接口url
     */
    public function postXmlCurl($xml, $url, $second = 30) {
        //初始化curl
        $ch = curl_init();
        //设置超时
        curl_setopt($ch, CURLOP_TIMEOUT, $this->CURL_TIMEOUT);
        //这里设置代理，如果有的话
        //curl_setopt($ch,CURLOPT_PROXY, '8.8.8.8');
        //curl_setopt($ch,CURLOPT_PROXYPORT, 8080);
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, FALSE);
        //设置header
        curl_setopt($ch, CURLOPT_HEADER, FALSE);
        //要求结果为字符串且输出到屏幕上
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
        //post提交方式
        curl_setopt($ch, CURLOPT_POST, TRUE);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $xml);
        //运行curl
        $data = curl_exec($ch);
        curl_close($ch);
        //返回结果
        if ($data) {
            curl_close($ch);
            return $data;
        } else {
            $error = curl_errno($ch);
            echo "curl出错，错误码:{$error}" . '<br>';
            echo '<a href=\'http://curl.haxx.se/libcurl/c/libcurl-errors.html\'>错误原因查询</a></br>';
            curl_close($ch);
            return false;
        }
    }

	/**
	 * 	作用：使用证书，以post方式提交xml到对应的接口url
	 */
	function postXmlSSLCurl($xml,$url,$second=30){
		$ch = curl_init();
		//超时时间
		curl_setopt($ch,CURLOPT_TIMEOUT,$second);
		//这里设置代理，如果有的话
        //curl_setopt($ch,CURLOPT_PROXY, '8.8.8.8');
        //curl_setopt($ch,CURLOPT_PROXYPORT, 8080);
        curl_setopt($ch,CURLOPT_URL, $url);
        curl_setopt($ch,CURLOPT_SSL_VERIFYPEER,FALSE);
        curl_setopt($ch,CURLOPT_SSL_VERIFYHOST,FALSE);
		//设置header
		curl_setopt($ch,CURLOPT_HEADER,FALSE);
		//要求结果为字符串且输出到屏幕上
		curl_setopt($ch,CURLOPT_RETURNTRANSFER,TRUE);
		//设置证书
		//使用证书：cert 与 key 分别属于两个.pem文件
		//默认格式为PEM，可以注释
		curl_setopt($ch,CURLOPT_SSLCERTTYPE,'PEM');
		curl_setopt($ch,CURLOPT_SSLCERT, $this->SSLCERT_PATH);
		//默认格式为PEM，可以注释
		curl_setopt($ch,CURLOPT_SSLKEYTYPE,'PEM');
		curl_setopt($ch,CURLOPT_SSLKEY, $this->SSLKEY_PATH);
		//post提交方式
		curl_setopt($ch,CURLOPT_POST, true);
		curl_setopt($ch,CURLOPT_POSTFIELDS,$xml);
		$data = curl_exec($ch);
		//返回结果
		if($data){
			curl_close($ch);
			return $data;
		}
		else { 
			$error = curl_errno($ch);
			echo "curl出错，错误码:$error"."<br>"; 
			echo "<a href='http://curl.haxx.se/libcurl/c/libcurl-errors.html'>错误原因查询</a></br>";
			curl_close($ch);
			return false;
		}
	}
	
	
    /**
     * 	作用：设置标配的请求参数，生成签名，生成接口参数xml
     */
    public function createXml($data=array()) {
		foreach ($data as $k => $v) {
			$this->parameters[$k]=$v;
		}
        $this->parameters['sign'] = $this->getSign($this->parameters);
        return $this->arrayToXml($this->parameters);
    }
	
	/**
     * 	作用：将xml转为array
     */
    public function xmlToArray($xml){
        //将XML转为array
        $array_data = json_decode(json_encode(simplexml_load_string($xml, 'SimpleXMLElement', LIBXML_NOCDATA)), true);
        return $array_data;
    }
	
    /**
     * 	作用：array转xml
     */
    public function arrayToXml($arr) {
        $xml = '<xml>';
        foreach ($arr as $key => $val) {
            if (is_numeric($val)) {
                $xml .= '<' . $key . '>' . $val . '</' . $key . '>';
            } else {
                $xml .= '<' . $key . '><![CDATA[' . $val . ']]></' . $key . '>';
            }
        }
        $xml .= '</xml>';
        return $xml;
    }
    /**
     * 	作用：生成签名
     */
    public function getSign($Obj) {
        foreach ($Obj as $k => $v) {
            $Parameters[$k] = $v;
        }
        //签名步骤一：按字典序排序参数
        ksort($Parameters);
        $String = $this->formatBizQueryParaMap($Parameters, false);
        //echo '【string1】'.$String.'</br>';
        //签名步骤二：在string后加入KEY
        $String = $String . '&key=' . $this->key;
        //echo "【string2】".$String."</br>";
        //签名步骤三：MD5加密
        $String = md5($String);
        //echo "【string3】 ".$String."</br>";
        //签名步骤四：所有字符转为大写
        $result_ = strtoupper($String);
        //echo "【result】 ".$result_."</br>";
        return $result_;
    }
	
	
	/**
	 * 验签方法 2018-04-04
	 * @return boolean
	 */
	function check(){
		$data=$this->getData();
		$tmpData = $data;
		unset($tmpData['sign']);
		$sign = $this->getSign($tmpData);
		if ($data['sign'] == $sign) {
			$redata=array(
				'orderno'=>$data['out_trade_no'],
				'amount'=>$data['total_fee']/100,
				'other'=>$data['attach'],
				'pay_no'=>$data['transaction_id'],
				'pay_way'=>'微信',
				'pay_time'=>strtotime($data['time_end']),
			);
			return $redata;
		}
		return false;
	}
	
	
	/**
     * 	获取返回数据
     */
	function getData(){
		return $this->xmlToArray(file_get_contents("php://input"));
	}
	
	/**
	 * 设置返回微信的xml数据
	 */
	function setReturnParameter($parameter, $parameterValue){
		$this->returnParameters[$this->$parameter] = $parameterValue;
	}
	
	/**
	 * 将xml数据返回微信
	 */
	function returnXml(){
		if($this->returnParameters["return_code"] == "SUCCESS"){
		   	return $this->arrayToXml($this->returnParameters);
		}
	}
	
	
    /**
     * 	作用：格式化参数，签名过程需要使用
     */
    public function formatBizQueryParaMap($paraMap, $urlencode)
    {
        $buff = '';
        ksort($paraMap);
        foreach ($paraMap as $k => $v) {
            if ($urlencode) {
                $v = urlencode($v);
            }
            //$buff .= strtolower($k) . "=" . $v . "&";
            $buff .= $k . '=' . $v . '&';
        }
        $reqPar = '';
        if (strlen($buff) > 0) {
            $reqPar = substr($buff, 0, strlen($buff) - 1);
        }
        return $reqPar;
    }
	
	
	function get_client_ip() {
	    if(getenv('HTTP_CLIENT_IP') && strcasecmp(getenv('HTTP_CLIENT_IP'), 'unknown')) {
	        $ip = getenv('HTTP_CLIENT_IP');
	    } elseif(getenv('HTTP_X_FORWARDED_FOR') && strcasecmp(getenv('HTTP_X_FORWARDED_FOR'), 'unknown')) {
	        $ip = getenv('HTTP_X_FORWARDED_FOR');
	    } elseif(getenv('REMOTE_ADDR') && strcasecmp(getenv('REMOTE_ADDR'), 'unknown')) {
	        $ip = getenv('REMOTE_ADDR');
	    } elseif(isset($_SERVER['REMOTE_ADDR']) && $_SERVER['REMOTE_ADDR'] && strcasecmp($_SERVER['REMOTE_ADDR'], 'unknown')) {
	        $ip = $_SERVER['REMOTE_ADDR'];
	    }
	    return preg_match ( '/[\d\.]{7,15}/', $ip, $matches ) ? $matches [0] : '';
	}
	
	/**
	 * 回调通知
	 */
	function notifyReturn(){
		return '<xml>
  <return_code><![CDATA[SUCCESS]]></return_code>
  <return_msg><![CDATA[OK]]></return_msg>
</xml>';
	}
}
