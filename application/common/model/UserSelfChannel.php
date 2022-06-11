<?php

namespace app\common\model;

use think\Model;

class UserSelfChannel extends Model
{

    //开启的支付通道
    static $ON = 1;
    //关闭的支付通道
    static $OFF = 0;

    public function user()
    {
        return $this->belongsTo('User','user_id');
    }
    public function channel()
    {
        return $this->belongsTo('SelfChannel','channel_id');
    }

    protected function setParamsAttr($value)
    {
        return json_encode($value);
    }

    protected function getParamsAttr($value){
        return json_decode($value);
    }
}
