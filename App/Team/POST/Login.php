<?php
/**
 * PESCMS for PHP 5.4+
 *
 * Copyright (c) 2014 PESCMS (http://www.pescms.com)
 *
 * For the full copyright and license information, please view
 * the file LICENSE.md that was distributed with this source code.
 * @core version 2.6
 * @version
 */

namespace App\Team\POST;

class Login extends \Core\Controller\Controller {

    /**
     * 执行登录
     */
    public function index() {
        $data['user_account'] = $data['user_mail'] = $this->isP('account', '请提交账号信息');
        $login = $this->db('user')->where('(user_account = :user_account OR user_mail = :user_mail) AND user_status = 1 ')->find($data);
        if (empty($login)) {
            $this->error('帐号或者密码错误，也可能您的账号被禁止登录鸟!');
        }

        $data['user_password'] = \Core\Func\CoreFunc::generatePwd($login['user_account'] . $this->isP('passwd', '请提交密码'));

        if ($login['user_password'] !== $data['user_password']) {
            $this->error('帐号或者密码错误，也可能您的账号被禁止登录鸟!');
        }

        $this->session()->set('team', $login);

        //若返回上一页为空，那么跳转到用户自定义的首页
        if (empty($_POST['back_url'])) {
            $url = $this->url(empty($login['user_home']) ? 'Team-Task-index' : $login['user_home']);
        } else {
            $url = base64_decode($_POST['back_url']);
        }

        $this->success('登录成功!', $url, -1);
    }

    /**
     * 查找密码
     */
    public function findPassword() {

        $this->checkVerify();

        $mail = $this->isP('mail', '请提交邮箱地址');
        $checkUser = \Model\Content::findContent('user', $mail, 'user_mail');
        if (empty($checkUser)) {
            $this->error('邮箱地址不存在');
        }

        $mark = \Model\Extra::getOnlyNumber();

        $this->db('findpassword')->where('findpassword_createtime < :time')->delete([
            'time' => time() - 86400
        ]);

        //创建标记
        $this->db('findpassword')->insert([
            'user_id' => $checkUser['user_id'],
            'findpassword_mark' => $mark,
            'findpassword_createtime' => time()
        ]);

        //创建邮件
        $mailContent = "<p>您已提交找回密码的请求，请点击此链接完成操作：" . \Model\Content::findContent('option', 'domain', 'option_name')['value'] . $this->url(GROUP . '-Login-setPassword', ['mark' => $mark]);
        $this->db('send')->insert([
            'send_account' => $checkUser['user_mail'],
            'sned_title' => '重置密码请求',
            'send_content' => $mailContent,
            'send_time' => time(),
            'send_type' => '1',
        ]);

        $this->success('系统已将找回密码的信息发至您的邮箱，请注意查收。');

    }

    /**
     * 重置密码
     */
    public function setPassword() {

        $this->checkVerify();

        $mark = $this->isG('mark', '请提交正确的MARK');
        $checkMark = $this->db('findpassword')->where('findpassword_createtime >= :time AND findpassword_mark = :findpassword_mark ')->find([
            'time' => time() - 86400,
            'findpassword_mark' => $mark
        ]);
        if (empty($checkMark)) {
            $this->error('MARK不存在', '/');
        }

        $password = $this->isP('passwd', '请输入新密码');
        $repasswd = $this->isP('repasswd', '请输入确认新密码');

        if ($password !== $repasswd) {
            $this->error('两次密码不正确');
        }

        $user = \Model\Content::findContent('user', $checkMark['user_id'], 'user_id');

        $data['noset']['user_id'] = $checkMark['user_id'];

        $data['user_password'] = \Core\Func\CoreFunc::generatePwd($user['user_account'] . $password, 'PRIVATE_KEY');

        $this->db('user')->where('user_id = :user_id')->update($data);

        $this->db('findpassword')->where('findpassword_id = :id')->delete([
            'id' => $checkMark['findpassword_id']
        ]);

        $this->success('密码修改成功!', $this->url(GROUP . '-Login-index'));
    }

}