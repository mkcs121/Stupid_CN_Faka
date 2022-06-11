<?php

namespace app\common\model;
use think\Model;

/**
 * 商户切换类型审核记录
 * Class UserAudit
 * @package app\common\model
 */
class UserAudit extends Model
{
    public function user()
    {
        return $this->belongsTo('User');
    }
}
