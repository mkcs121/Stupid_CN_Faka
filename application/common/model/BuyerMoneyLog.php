<?php

namespace app\common\model;

use think\Model;

class BuyerMoneyLog extends Model
{
    public function user()
    {
        return $this->belongsTo('Buyer','user_id');
    }
}
