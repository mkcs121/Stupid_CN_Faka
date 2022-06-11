<?php

namespace controller;

use service\DataService;
use think\Controller;
use think\Db;
use think\Session;
use think\db\Query;

/**
 * 后台权限基础控制器
 * Class BasicAdmin
 * @package controller
 */
class BasicAdmin extends Controller
{

    /**
     * 页面标题
     * @var string
     */
    public $title;

    /**
     * 默认操作数据表
     * @var string
     */
    public $table;

    /**
     * 初始化方法
     */
    public function _initialize()
    {
    	// 当前完整URL地址
		$http_type = ((isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] == 'on') || (isset($_SERVER['HTTP_X_FORWARDED_PROTO']) && $_SERVER['HTTP_X_FORWARDED_PROTO'] == 'https')) ? 'https://' : 'http://';
    	$url = $http_type.$_SERVER['HTTP_HOST'];
		$pe_auth = sysconf('phone_email_auth');
        $ssd = sysconf('site_shop_domain');
        $xyiokk = sysconf('xyiokk');
        $xyok = sysconf('xyok');
        $surl = str_replace(array('http://','https://'), '', $ssd);
        if($_SERVER['HTTP_HOST'] != $surl){
            if($xyiokk == 0){
                $this->success('请勾选使用协议...', 'admin/index/xieyi');
            }else{
                if($xyok != $surl){
                    $this->success('请勾选使用协议...', 'admin/index/xieyi');
                }
            }
        }else{
            if(sysconf('xyiok')==0){
                $this->success('请勾选使用协议...', 'admin/index/xieyi');
            }else{
                if($xyok != $surl){
                    $this->success('请勾选使用协议...', 'admin/index/xieyi');
                }
            }
        }
        
        
       /* $ddurl=config('upgrade.api_url')."/api/index/domain?ip=".get_client_ip()."&domain=".getTopHostbuy();
        
        $ctx=stream_context_create(array(
            'http'=>array(
                    'timeout'=>1//等待10秒
                    )
                )
            );

        $ddd=@file_get_contents($ddurl,0,$ctx);
        */

		$this->url = $this->request->url(true);
		if($pe_auth != '0'){
			$check = Session::get('login_check');
			if($check == ''){
				$this->success('请进行系统安全验证', 'admin/test/google');
			}
		}
        if(sysconf('xyiok')==0){
            $this->success('请勾选使用协议...', 'admin/index/xieyi');
        }
    }
	
	public function xieyi()
    {
     
             return $this->fetch('', ['title' => '使用协议']);
   }
          
	
	public function xieyiok()
    {
       
	       
	   sysconf('xyiok',1);
	   
	   if(sysconf('admin_login_path')=='admin')
	   {
		   $this->success('登录成功，为了您的账号安全，请及时修改后台路径...', '/admin#/admin/config/index.html?spm=m-2-5');
	   }else{
	   $this->redirect('@admin');
	   }
      
    }

    protected function _form($dbQuery = null, $tplFile = '', $pkField = '', $where = [], $extendData = [])
    {
        $db = is_null($dbQuery) ? Db::name($this->table) : (is_string($dbQuery) ? Db::name($dbQuery) : $dbQuery);
        $pk = empty($pkField) ? ($db->getPk() ? $db->getPk() : 'id') : $pkField;
        $pkValue = $this->request->request($pk, isset($where[$pk]) ? $where[$pk] : (isset($extendData[$pk]) ? $extendData[$pk] : null));
        // 非POST请求, 获取数据并显示表单页面
        if (!$this->request->isPost()) {
            $vo = ($pkValue !== null) ? array_merge((array)$db->where($pk, $pkValue)->where($where)->find(), $extendData) : $extendData;
            if (false !== $this->_callback('_form_filter', $vo)) {
                empty($this->title) || $this->assign('title', $this->title);
                return $this->fetch($tplFile, ['vo' => $vo]);
            }
            return $vo;
        }
        // POST请求, 数据自动存库
        $data = array_merge($this->request->post(), $extendData);
        if(isset($data['password'])){
            if( !empty($data['password'])) {
                $data['password'] = md5($data['password']);
            }else{
                unset($data['password']);
            }
        }
        if (false !== $this->_callback('_form_filter', $data)) {
            $result = DataService::save($db, $data, $pk, $where);
            if (false !== $this->_callback('_form_result', $result)) {
                if ($result !== false) {
                    $this->success('恭喜, 数据保存成功!', '');
                }
                $this->error('数据保存失败, 请稍候再试!');
            }
        }
    }

    /**
     * 列表集成处理方法
     * @param Query $dbQuery 数据库查询对象
     * @param bool $isPage 是启用分页
     * @param bool $isDisplay 是否直接输出显示
     * @param bool $total 总记录数
     * @param array $result
     * @return array|string
     */
    protected function _list($dbQuery = null, $isPage = true, $isDisplay = true, $total = false, $result = [])
    {
        $db = is_null($dbQuery) ? Db::name($this->table) : (is_string($dbQuery) ? Db::name($dbQuery) : $dbQuery);
        // 列表排序默认处理
        if ($this->request->isPost() && $this->request->post('action') === 'resort') {
            $data = $this->request->post();
            unset($data['action']);
            foreach ($data as $key => &$value) {
                if (false === $db->where('id', intval(ltrim($key, '_')))->setField('sort', $value)) {
                    $this->error('列表排序失败, 请稍候再试');
                }
            }
            $this->success('列表排序成功, 正在刷新列表', '');
        }
        // 列表数据查询与显示
        if (null === $db->getOptions('order')) {
            $fields = $db->getTableFields($db->getTable());
            in_array('sort', $fields) && $db->order('sort asc');
        }
        if ($isPage) {
            $rows = intval($this->request->get('rows', cookie('rows')));
            cookie('rows', $rows >= 10 ? $rows : 20);
            $page = $db->paginate($rows, $total, ['query' => $this->request->get('', '', 'urlencode')]);
            list($pattern, $replacement) = [['|href="(.*?)"|', '|pagination|'], ['data-open="$1"', 'pagination pull-right']];
            list($result['list'], $result['page']) = [$page->all(), preg_replace($pattern, $replacement, $page->render())];
        } else {
            $result['list'] = $db->select();
        }
        if (false !== $this->_callback('_data_filter', $result['list']) && $isDisplay) {
            !empty($this->title) && $this->assign('title', $this->title);
            return $this->fetch('', $result);
        }
        return $result;
    }

    /**
     * 当前对象回调成员方法
     * @param string $method
     * @param array|bool $data
     * @return bool
     */
    protected function _callback($method, &$data)
    {
        foreach ([$method, "_" . $this->request->action() . "{$method}"] as $_method) {
            if (method_exists($this, $_method) && false === $this->$_method($data)) {
                return false;
            }
        }
        return true;
    }

}
