<?php

namespace app\common\model;

use think\Model;

class SrateGroupRule extends Model {

    //支付渠道信息
    public function channel()
    {
        return $this->hasOne('channel','id','channel_id');
    }
}
