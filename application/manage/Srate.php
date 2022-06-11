<?php
namespace app\manage\controller;

use controller\BasicAdmin;

/**
 * 自签费率分组
 * Class Audit
 * @package app\manage\controller
 */
class Srate extends BasicAdmin{

    public function index(){

        return $this->fetch();
    }
}
