<?php

namespace app\common\model;

use think\Model;

class SelfChannelAccount extends Model
{

    public function user_channel(){
        return $this->belongsTo('UserSelfChannel', 'user_id');
    }

    public function channel()
    {
        return $this->belongsTo('SelfChannel', 'channel_id');
    }

    protected function setParamsAttr($value)
    {
        return json_encode($value);
    }

    protected function getParamsAttr($value)
    {
        return json_decode($value);
    }
}
