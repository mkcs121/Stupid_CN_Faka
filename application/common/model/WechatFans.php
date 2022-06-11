<?php

namespace app\common\model;

use think\Model;

class WechatFans extends Model
{
    public function user()
    {
        return $this->belongsTo('User','openid','openid');
    }

    public function buyer(){
        return $this->belongsTo('Buyer','openid','openid');
    }
}
