<?php

namespace app\common\model;

use think\Model;

class Complaint extends Model
{
    public function user()
    {
        return $this->belongsTo('User','user_id');
    }

    public function buyer()
    {
        return $this->belongsTo('Buyer','buyer_id');
    }

    public function order(){
        return $this->belongsTo('Order','trade_no','trade_no');
    }
}
