<?php

namespace app\common\model;

use think\Model;
use traits\model\SoftDelete;

class SrateGroup extends Model {

    use SoftDelete;
    protected $deleteTime = 'delete_at';

    //费率规则
    public function rateRules()
    {
        return $this->hasMany('SrateGroupRule','group_id','id');
    }

}
