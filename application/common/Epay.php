<?php

namespace app\common;

use think\Request;

class Epay extends Pay
{

	public function requestForm($className,$outTradeNo,$subject,$totalAmount,$paytype='')
    {
		$apiurl = 'https://pay.69kz.com/submit.php';

        $params = array();
        $params['pid'] = $this->account->params->pid;
        $params['type'] = $paytype;
        $params['notify_url'] = sysconf("site_shop_domain").'/pay/notify/' . $className;
        $params['return_url'] = sysconf("site_shop_domain"). '/pay/page/' . $className;
		$params['out_trade_no'] = $outTradeNo;
		$params['name'] = $subject;
		$params['money'] = number_format($totalAmount,2,'.','');

        $params['sign'] = $this->sign($params);
        $params['sign_type'] = 'MD5';

        //拼装 form 表单
        $form = $this->setForm($apiurl, $params);
        
        $this->code = 0;
        $obj = new \stdClass();
        $obj->pay_url = $form;
        $obj->content_type = 3;
        return $obj;
    }

    /**
     * @param $data
     * @return string
     */
    public function setForm($apiurl, $data)
    {
        $html = "<form id='pay_form' class=\"form-inline\" method=\"post\" action=\"{$apiurl}\">";
        foreach ($data as $k => $v) {
            $html .= "<input type=\"hidden\" name=\"$k\" value=\"$v\">";
        }
        $html .= "</form>";
        $html .= "<script>document.forms['pay_form'].submit();</script>";
        return $html;
    }

    /**
     * 页面回调
     */
    public function page_callback($params, $order)
    {
        header("Location:" . url('/orderquery', ['orderid' => $order->trade_no]));
		exit;
    }

    /**
     * 服务器回调
     */
    public function notify_callback($params, $order)
    {
        $sign = $this->sign($params);

        if ($sign && $sign == $params['sign']) {

            if ($params["trade_status"] == "TRADE_SUCCESS") {
                // 金额异常检测
                if ($order->total_price != $params['money']) {
                    record_file_log('NZF_notify_error', '金额异常！' . "\r\n" . $order->trade_no . "\r\n订单金额：{$order->total_price}，已支付：{$params['amount']}");
                    die('金额异常！');
                }

                $this->completeOrder($order);
                echo 'success';
                return true;
            } else {
                exit('fail');
            }

        }
    }


    /**
     * @param $params
     * @return string
     */
    protected function sign($params)
    {
        ksort($params);

        $keyStr = '';
        foreach ($params as $key => $val) {
			if($key == "sign" || $key == "sign_type" || $val == "")continue;
            $keyStr .= "$key=$val&";
        }
		$keyStr = trim($keyStr,'&');

        $sign = md5($keyStr . $this->account->params->key);

        return $sign;
    }
}