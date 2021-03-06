<?php
/**
 * 官方文档：http://mp.weixin.qq.com/wiki/7/aaa137b55fb2e0456bf8dd9148dd613f.html
 * 微信支付：http://pay.weixin.qq.com/wiki/doc/api/index.php?chapter=9_1#
 * 官方示例：http://demo.open.weixin.qq.com/jssdk/sample.zip
 * 
 * 微信JSSDK类,主要修改了保存会话信息机制，示例中使用的是文件，这里使用了ThinkPHP的缓存机制，参考官方提供的示例文档 
 * 新增了调试模式,调用示例如下：
 *     	$jssdk = new JSSDK(C('WX_APPID'), C('WX_SECRET'));
 *  	$jssdk->debug = true;	//启用本地调试模式,将官方的两个json文件放到入口文件index.php同级目录即可!
 *   	$signPackage = $jssdk->GetSignPackage();
 * @命名空间版本
 * @author 
 * @date 2015-1-10 14:10
 */
namespace Weixin;

class JsSdk
{
    private $appId;
    private $appSecret;
    public $debug = false;
    public $parameters;
    //获取prepay_id时的请求参数
    //受理商ID，身份标识
    public $MCHID = '';
    //商户支付密钥Key。审核通过后，在微信发送的邮件中查看
    public $KEY = '';
    //=======【JSAPI路径设置】===================================
    //获取access_token过程中的跳转uri，通过跳转将code传入jsapi支付页面
    public $JS_API_CALL_URL = '';
    //=======【证书路径设置】=====================================
    //证书路径,注意应该填写绝对路径
    public $SSLCERT_PATH = '/xxx/xxx/xxxx/WxPayPubHelper/cacert/apiclient_cert.pem';
    public $SSLKEY_PATH = '/xxx/xxx/xxxx/WxPayPubHelper/cacert/apiclient_key.pem';
    //=======【异步通知url设置】===================================
    //异步通知url，商户根据实际开发过程设定
    //C('url')."admin.php/order/notify_url.html";
    public $NOTIFY_URL = '';
    //=======【curl超时设置】===================================
    //本例程通过curl使用HTTP POST方法，此处可修改其超时时间，默认为30秒
    public $CURL_TIMEOUT = 30;
    public $prepay_id;
	public $code;
    public function __construct($appId, $appSecret)
    {
        $this->appId = $appId;
        $this->appSecret = $appSecret;
    }
	
	/**
	 * 	作用：生成可以获得code的url
	 */
	function createOauthUrlForCode($redirectUrl,$scope="snsapi_base")
	{
		$urlObj["appid"] = $this->appId;
		$urlObj["redirect_uri"] = "$redirectUrl";
		$urlObj["response_type"] = "code";
		$urlObj["scope"] = $scope;
		$urlObj["state"] = "STATE"."#wechat_redirect";
		$bizString = $this->formatBizQueryParaMap($urlObj, false);
		return "https://open.weixin.qq.com/connect/oauth2/authorize?".$bizString;
	}

	/**
	 * 	作用：生成可以获得openid的url
	 */
	function createOauthUrlForOpenid()
	{
		$urlObj["appid"] = $this->appId;
		$urlObj["secret"] = $this->appSecret;
		$urlObj["code"] = $this->code;
		$urlObj["grant_type"] = "authorization_code";
		$bizString = $this->formatBizQueryParaMap($urlObj, false);
		return "https://api.weixin.qq.com/sns/oauth2/access_token?".$bizString;
	}
	
	
	//准备废弃
	/**
	 * 	作用：通过curl向微信提交code，以获取openid
	 */
	function getOpenid()
	{
		$url = $this->createOauthUrlForOpenid();
        //初始化curl
       	$ch = curl_init();
		//设置超时
		curl_setopt($ch, CURLOP_TIMEOUT, $this->CURL_TIMEOUT);
		curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch,CURLOPT_SSL_VERIFYPEER,FALSE);
        curl_setopt($ch,CURLOPT_SSL_VERIFYHOST,FALSE);
		curl_setopt($ch, CURLOPT_HEADER, FALSE);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
		//运行curl，结果以jason形式返回
        $res = curl_exec($ch);
		curl_close($ch);
		//取出openid
		$data = json_decode($res,true);
		$this->openid = $data['openid'];
		return $this->openid;
	}
	
	
	/**
	 * 	作用：通过code换取网页授权access_token
	 */
	function get_access_token()
	{
		$url = $this->createOauthUrlForOpenid();
        //初始化curl
       	$ch = curl_init();
		//设置超时
		curl_setopt($ch, CURLOP_TIMEOUT, $this->CURL_TIMEOUT);
		curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch,CURLOPT_SSL_VERIFYPEER,FALSE);
        curl_setopt($ch,CURLOPT_SSL_VERIFYHOST,FALSE);
		curl_setopt($ch, CURLOPT_HEADER, FALSE);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
		//运行curl，结果以jason形式返回
        $res = curl_exec($ch);
		curl_close($ch);
		//取出openid
		$data = json_decode($res,true);
		return $data;
	}
	

	
	
	/**
	 * 	作用：设置code
	 */
	function setCode($code_)
	{
		$this->code = $code_;
	}
	
	
	//签名参数
    public function getSignPackage()
    {
        $jsapiTicket = $this->getJsApiTicket();
        $url = "http://{$_SERVER['HTTP_HOST']}{$_SERVER['REQUEST_URI']}";
        $timestamp = time();
        $nonceStr = $this->createNonceStr();
        // 这里参数的顺序要按照 key 值 ASCII 码升序排序
        $string = "jsapi_ticket={$jsapiTicket}&noncestr={$nonceStr}&timestamp={$timestamp}&url={$url}";
        $signature = sha1($string);
        $signPackage = array('appId' => $this->appId, 'nonceStr' => $nonceStr, 'timestamp' => $timestamp, 'url' => $url, 'signature' => $signature, 'rawString' => $string);
        return $signPackage;
    }
    /**
     * 	作用：产生随机字符串，不长于32位
     */
    private function createNonceStr($length = 16)
    {
        $chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
        $str = '';
        for ($i = 0; $i < $length; $i++) {
            $str .= substr($chars, mt_rand(0, strlen($chars) - 1), 1);
        }
        return $str;
    }
    private function getJsApiTicket()
    {
        //debug模式
        if ($this->debug) {
            // jsapi_ticket 应该全局存储与更新，以下代码以写入到文件中做示例
            $data = json_decode(file_get_contents('jsapi_ticket.json'));
        } else {
            //从cache中读取，基于ThinkPHP的缓存机制
            $data = (object) S('jsapi_ticket_json');
        }
        if ($data->expire_time < time()) {
            $accessToken = $this->getAccessToken();
            $url = "https://api.weixin.qq.com/cgi-bin/ticket/getticket?type=1&access_token={$accessToken}";
            $res = json_decode($this->httpGet($url));
            $ticket = $res->ticket;
            if ($ticket) {
                $data->expire_time = time() + 7200;
                $data->jsapi_ticket = $ticket;
                //debug模式
                if ($this->debug) {
                    $fp = fopen('jsapi_ticket.json', 'w');
                    fwrite($fp, json_encode($data));
                    fclose($fp);
                } else {
                    //将对象以数组的形式进行缓存
                    S('jsapi_ticket_json', (array) $data);
                }
            }
        } else {
            $ticket = $data->jsapi_ticket;
        }
        return $ticket;
    }
	//准备废弃
    private function getAccessToken()
    {
        //debug模式
        if ($this->debug) {
            // access_token 应该全局存储与更新，以下代码以写入到文件中做示例
            $data = json_decode(file_get_contents('access_token.json'));
            dump($data);
            die;
        } else {
            //从缓存中读取数组并转成对象
            $data = (object) S('access_token.json');
        }
        if ($data->expire_time < time()) {
            $url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid={$this->appId}&secret={$this->appSecret}";
            $res = json_decode($this->httpGet($url));
            $access_token = $res->access_token;
            if ($access_token) {
                $data->expire_time = time() + 7000;
                $data->access_token = $access_token;
                //debug模式
                if ($this->debug) {
                    $fp = fopen('access_token.json', 'w');
                    fwrite($fp, json_encode($data));
                    fclose($fp);
                } else {
                    //缓存数组
                    S('access_token.json', (array) $data);
                }
            }
        } else {
            $access_token = $data->access_token;
        }
        return $access_token;
    }
    private function httpGet($url)
    {
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($curl, CURLOPT_TIMEOUT, 500);
        curl_setopt($curl, CURLOPT_URL, $url);
        $res = curl_exec($curl);
        //错误检测
        $error = curl_error($curl);
        curl_close($curl);
        //发生错误，抛出异常
        if ($error) {
            throw new \Exception('请求发生错误(表检查是否在授权域名下访问)：' . $error);
        }
        return $res;
    }
    //微信支付相关方法
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
    /**
     * 	作用：设置jsapi的参数
     */
    public function getParameters()
    {
        $jsApiObj['appId'] = $this->appId;
        //请求生成支付签名时需要,js调起支付参数中不需要
        $timeStamp =(string) time();
        $jsApiObj['timeStamp'] = $timeStamp;
        //用大写的timeStamp参数请求生成支付签名
        $jsParamObj['timeStamp'] = $timeStamp;
        $jsParamObj['appId'] = $this->appId;
        $jsParamObj['nonceStr'] = $jsApiObj['nonceStr'] = $this->createNoncestr();
        $jsParamObj['package'] = $jsApiObj['package'] = "prepay_id={$this->prepay_id}";
        $jsParamObj['signType'] = $jsApiObj['signType'] = 'MD5';
        $jsParamObj['paySign'] = $jsApiObj['paySign'] = $this->getSign($jsApiObj);
        $jsParam = json_encode($jsParamObj);
        return $jsParam;
    }
    /**
     * 获取prepay_id
     */
    public function getPrepayId()
    {
        $result = $this->xmlToArray($this->postXml());
        $prepay_id = $result['prepay_id'];
        return $prepay_id;
    }
    /**
     * 	作用：将xml转为array
     */
    public function xmlToArray($xml)
    {
        //将XML转为array
        $array_data = json_decode(json_encode(simplexml_load_string($xml, 'SimpleXMLElement', LIBXML_NOCDATA)), true);
        return $array_data;
    }
    /**
     * 	作用：post请求xml
     */
    public function postXml()
    {
        $xml = $this->createXml();
        return $this->postXmlCurl($xml, 'https://api.mch.weixin.qq.com/pay/unifiedorder', $this->CURL_TIMEOUT);
    }
    /**
     * 	作用：以post方式提交xml到对应的接口url
     */
    public function postXmlCurl($xml, $url, $second = 30)
    {
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
     * 	作用：设置标配的请求参数，生成签名，生成接口参数xml
     */
    public function createXml()
    {
        $this->parameters['appid'] = $this->appId;
        //公众账号ID
        $this->parameters['mch_id'] = $this->MCHID;
        //商户号
        $this->parameters['nonce_str'] = $this->createNoncestr();
        //随机字符串
        $this->parameters['sign'] = $this->getSign($this->parameters);
        //签名
        return $this->arrayToXml($this->parameters);
    }
    /**
     * 	作用：array转xml
     */
    public function arrayToXml($arr)
    {
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
    public function getSign($Obj)
    {
        foreach ($Obj as $k => $v) {
            $Parameters[$k] = $v;
        }
        //签名步骤一：按字典序排序参数
        ksort($Parameters);
        $String = $this->formatBizQueryParaMap($Parameters, false);
        //echo '【string1】'.$String.'</br>';
        //签名步骤二：在string后加入KEY
        $String = $String . '&key=' . $this->KEY;
        //echo "【string2】".$String."</br>";
        //签名步骤三：MD5加密
        $String = md5($String);
        //echo "【string3】 ".$String."</br>";
        //签名步骤四：所有字符转为大写
        $result_ = strtoupper($String);
        //echo "【result】 ".$result_."</br>";
        return $result_;
    }
}