<?php
namespace app\manage\controller;

use app\common\model\SelfChannel as SelfChannelModel;
use app\common\model\SrateGroup;
use app\common\model\SrateGroupRule;
use controller\BasicAdmin;
use think\Db;
use think\Exception;

/**
 * 自签费率分组管理
 * Class Rate
 * @package app\manage\controller
 */
class Srate extends BasicAdmin
{

    /**
     * 费率分组列表
     * @return mixed
     * @throws \think\exception\DbException
     */
    public function index()
    {
        $where = [
            'title' => ['like', '%' . input('keyword/s', '') . '%'],
        ];
        //费率分组
        $rateGroup = SrateGroup::where($where)->order('id desc')->paginate(30, false);
        $this->assign('rate_group', $rateGroup);

        $currentDefaultId = SrateGroup::where('register_default',1)->value('id') ;
        // 分页
        $page = str_replace('href="', 'href="#', $rateGroup->render());
        $this->assign('page', $page);
        $this->assign('currentDefaultId', $currentDefaultId);
        $this->assign('title', '费率分组');


        return $this->fetch();
    }

    /**
     * 增加费率分组
     * @return mixed
     * @throws \think\exception\DbException
     */
    public function add()
    {
        if ($this->request->isPost()) {
            $title = input('title/s', '');
            if (empty($title)) {
                $this->error('请输入分组名');
            }
            $channels = input('channel/a', []);
            $rates = input('poundage/a', []);
            $rates_api= input('rate_api/a', []);
            $statuss= input('status/a', []);


            foreach($channels as $a){
                if($a==0){
                    return J(500, '保存失败！发卡费率不能小于0');
                    exit;
                    break;

                }}

            foreach($rates_api as $a){
                if($a==0){
                    return J(500, '保存失败！支付接口费率不能小于0');
                    exit;
                    break;

                }}

            DB::startTrans();
            try {
                $model = new SrateGroup();
                $group = $model->insert([
                    'title' => $title,
                    'create_at' => time(),
                ], false, true);

                if (!$group) {
                    DB::rollback();
                    return J(500, '保存失败！请刷新重试');
                }

                foreach ($rates as $k => $rate) {

//                    $rate_api=$rates_api[$k]/1000;
                    //未设置的
                    $res = SrateGroupRule::create([
                        'group_id' => $group,
                        'channel_id' => $channels[$k],
//                        'rate_api' => $rate_api,
                        'poundage' => $rate / 1000,
                        'status' => $statuss[$k],

                    ]);

                    if (!$res) {
                        DB::rollback();
                        return J(500, '保存失败！请刷新重试');
                    }
                }

                DB::commit();
                return J(1, '保存成功！');
            } catch (Exception $e) {
                DB::rollback();
                return J(500, '保存失败！请刷新重试');
            }
        }

        $rules = [];
        //获取已经开启的渠道 39之前
        $channels = SelfChannelModel::all(['status' => 1]);
        /* foreach ($channels as $channel) {
             array_push($rules, [
                 'id' => '',
                 'rate' => $channel['lowrate'],
                 'channel_id' => $channel['id'],
                 'channel' => $channel,
             ]);
         }*/

        foreach ($channels as $channel) {
            $rules[$channel['id']] = [
                'id' => '',
                'rate' => $channel['lowrate'],
                'rate_api' => '',
                'channel_id' => $channel['id'],
                'channel' => $channel,
                'rate_group_rule_status' => 1,
                'poundage'=>''
            ];
        }

        $this->assign('rules', $rules);

        return $this->fetch();
    }

    /**
     * 查看编辑分组内费率详情
     * @return mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function detail()
    {
        $id = input('id/d', 0);
        $this->assign('id', $id);

        //获取所有渠道
        $rules = [];
        $channels = SelfChannelModel::all(['status' => 1]);
        foreach ($channels as $channel) {
            $rules[$channel['id']] = [
                'id' => '',
                'rate' => $channel['lowrate'],
                'rate_api' => '',
                'channel_id' => $channel['id'],
                'channel' => $channel,
                'rate_group_rule_status' => 1,
                'poundage'=>'',
            ];
        }

        $group = SrateGroup::get($id);

        $settings = $group->rateRules()->select();

        foreach ($settings as &$item) {

            if (isset($rules[$item['channel_id']])) {
                $rules[$item['channel_id']]['id'] = $item['id'];
                $rules[$item['channel_id']]['rate'] = $item['rate'];
                $rules[$item['channel_id']]['rate_api'] = $item['rate_api'];
                $rules[$item['channel_id']]['rate_group_rule_status'] = $item['status'];
                $rules[$item['channel_id']]['poundage'] = $item['poundage'];
            }
        }

        $group->rules = $rules;

        $this->assign('group', $group);

        return $this->fetch();
    }

    /**
     * 保存分组内渠道费率
     * @return string
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @throws \think\exception\PDOException
     */
    public function save()
    {
        $group = input('group/d', 0);
        $ids = input('id/a', []);
        $channels = input('channel/a', []);
        $rates = input('poundage/a', []);
//        $rates = input('rate/a', []);
        $rates_api = input('rate_api/a', []);

        DB::startTrans();
        try {
            $users = Db::name('srate_group_user')->field('user_id')
                ->where('group_id', $group)->select();

            if (!empty($users)) {
                $users = array_column($users, 'user_id');
            }

            foreach ($rates as $k => $rate) {
                $rate = $rate / 1000;
                //$rate_api=$rates_api[$k]/1000;

                if (!empty($k) && in_array($k, $ids)) {
                    //已经存在的
                    $res = SrateGroupRule::update(['poundage' => $rate], ['id' => $k], 'poundage');

                } else {
                    //未设置的
                    $res = SrateGroupRule::create([
                        'group_id' => $group,
                        'channel_id' => $channels[$k],
                        'poundage'=>$rate,
//                        'rate' => $rate,
//                        'rate_api' => $rate_api,
                    ]);
                }

                if (FALSE === $res) {
                    DB::rollback();
                    return J(500, '保存费率！请刷新重试');
                }

                //更新组内所有用户的通道费率
                if (!empty($users)) {
                    foreach ($users as $user) {
                        $where = [
                            'user_id' => $user,
                            'channel_id' => $channels[$k],
                        ];

                        if (Db::name('user_self_rate')->where($where)->find()) {
                            $res = Db::name('user_self_rate')->where($where)->update([
                                'rate' => $rate,
                            ]);
                            if ($res == 0) {
                                $res = true;
                            }
                        } else {
                            $res = Db::name('user_self_rate')->insert(array_merge($where, ['poundage' => $rate]));
                        }

                        if (FALSE === $res) {
                            DB::rollback();
                            return J(500, '更新用户费率失败！请刷新重试' . Db::name('user_self_rate')->getLastSql());
                        }
                    }
                }

                if (FALSE === $res) {
                    DB::rollback();
                    return J(500, '保存失败！请刷新重试');
                }
            }

            DB::commit();
            return J(1, '保存成功！');
        } catch (Exception $e) {
            DB::rollback();
            return J(500, '保存失败！请刷新重试');
        }
    }

    /**
     * 删除费率分组
     * @return string
     */
    public function del()
    {
        $id = input('id/d', 0);
        Db::startTrans();
        try {
            $res = SrateGroup::destroy($id);
            if ($res) {
                //删除规则
                Db::name('rate_group_rule')->where(['group_id' => $id])->delete();

                //删除分组，删除分组内用户费率设置
                $users = Db::name('rate_group_user')->field('user_id')
                    ->where('group_id', $id)->select();

                if (!empty($users)) {
                    $users = array_column($users, 'user_id');

                    foreach ($users as $user) {
                        //删除该用户所有的费率设置，让用户走默认费率
                        Db::name('user_rate')->where(['user_id' => $user])->delete();
                        Db::name('rate_group_user')->where(['user_id' => $user])->delete();
                    }
                }

                Db::commit();
                return J(1, '删除成功！');
            } else {
                Db::rollback();
                return J(500, '删除失败！请刷新重试');
            }
        } catch (Exception $e) {
            Db::rollback();
            return J(500, '删除失败！请刷新重试');
        }
    }

    public function change_status(){
        if(!$this->request->isAjax()){
            $this->error('错误的提交方式！');
        }
        $channel_id=input('channel_id/d',0);
        $group_id=input('group_id/d',0);
        $rate_group_rule =  Db::name('srate_group_rule')->where(['group_id' => $group_id,'channel_id' => $channel_id])->find();

        if (empty($rate_group_rule)) {
            $this->error('请先保存费率信息！');
        }

        $status=input('status/d',1);
        $res=Db::name('srate_group_rule')
            ->where(['group_id'=>$group_id, 'channel_id' => $channel_id])
            ->update([
                'status'=>$status
            ]);
        $remark = $status == 1 ? '开启' : '关闭';
        if($res!==false){
            $this->success($remark.'成功', '');
        }else{
            $this->error($remark.'失败，请重试！');
        }
    }

    /*设置默认注册用户费率组*/
    public function set_register_default(){

        if(!$this->request->isAjax()){
            $this->error('错误的提交方式！');
        }

        $channel_id=input('id/d',1);
        $default_id = input( 'did/d',0);
        $status=input('status/d',1);

        if( $default_id != $channel_id && $default_id > 0 ){
            SrateGroup::update(['id'=>$default_id,'register_default'=>0]);
        }

        $res = SrateGroup::update(['id'=>$channel_id,'register_default'=>$status]);

        /*$res=Db::name('srate_group')
            ->where(['id' => $channel_id])
            ->update([
                'register_default'=>$status
            ]);*/

        if($res!==false){
            $this->success('设置成功');
        }else{
            $this->error('设置失败');
        }
    }
}
