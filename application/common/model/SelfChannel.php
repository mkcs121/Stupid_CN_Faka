<?php

namespace app\common\model;

use think\Model;

class SelfChannel extends Model
{
    public function accounts()
    {
        return $this->hasMany('SelfChannelAccount', 'channel_id');
    }

    public function orders(){
       return $this->hasMany('Order', 'channel_id');
    }

    public function user_channel(){
        return $this->hasMany('UserSelfChannel', 'channel_id');
    }

    public function rules(){
        return $this->hasOne('SrateGroupRule', 'channel_id');
    }
}
