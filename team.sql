-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2015 年 04 月 03 日 11:07
-- 服务器版本: 5.5.16
-- PHP 版本: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `team`
--

-- --------------------------------------------------------

--
-- 表的结构 `pes_category`
--

CREATE TABLE IF NOT EXISTS `pes_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(128) NOT NULL,
  `category_aliases` varchar(255) NOT NULL COMMENT '别名',
  `model_id` int(11) NOT NULL,
  `category_parent` int(11) NOT NULL,
  `category_child` text NOT NULL,
  `category_keyword` varchar(255) NOT NULL,
  `category_description` text NOT NULL,
  `category_thumb` varchar(255) NOT NULL,
  `category_url` varchar(255) NOT NULL,
  `category_nav` tinyint(4) NOT NULL DEFAULT '1' COMMENT '导航',
  `category_html` tinyint(1) NOT NULL COMMENT '是否生成HTML',
  `category_theme` varchar(128) NOT NULL COMMENT '模板名称',
  `category_lang` varchar(50) NOT NULL COMMENT '语言',
  `category_listsort` int(11) NOT NULL,
  PRIMARY KEY (`category_id`),
  KEY `category_parent` (`category_parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `pes_cookie`
--

CREATE TABLE IF NOT EXISTS `pes_cookie` (
  `cookie_id` int(11) NOT NULL AUTO_INCREMENT,
  `cookie` varchar(255) NOT NULL,
  `uid` int(11) NOT NULL,
  `createtime` int(11) NOT NULL,
  PRIMARY KEY (`cookie_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `pes_department`
--

CREATE TABLE IF NOT EXISTS `pes_department` (
  `department_id` int(11) NOT NULL AUTO_INCREMENT,
  `department_listsort` int(11) NOT NULL,
  `department_lang` tinyint(4) NOT NULL,
  `department_url` varchar(255) NOT NULL,
  `department_createtime` int(11) NOT NULL,
  `department_name` varchar(255) NOT NULL,
  `department_header` varchar(255) NOT NULL,
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `pes_department`
--

INSERT INTO `pes_department` (`department_id`, `department_listsort`, `department_lang`, `department_url`, `department_createtime`, `department_name`, `department_header`) VALUES
(1, 0, 0, '/department/view/id/1.html', 0, 'IT部', '1'),
(2, 0, 0, '/Department/view/id/2.html', 0, '人事部', '3'),
(3, 0, 0, '/Department/view/id/3.html', 0, '销售部', '4');

-- --------------------------------------------------------

--
-- 表的结构 `pes_field`
--

CREATE TABLE IF NOT EXISTS `pes_field` (
  `field_id` int(11) NOT NULL AUTO_INCREMENT,
  `model_id` int(11) NOT NULL,
  `field_name` varchar(128) NOT NULL,
  `display_name` varchar(128) NOT NULL,
  `field_type` varchar(128) NOT NULL,
  `field_option` text NOT NULL,
  `field_default` varchar(128) NOT NULL,
  `field_required` tinyint(4) NOT NULL,
  `field_message` varchar(128) NOT NULL,
  `field_listsort` int(11) NOT NULL,
  `field_status` tinyint(4) NOT NULL,
  PRIMARY KEY (`field_id`),
  UNIQUE KEY `modle_id` (`model_id`,`field_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=35 ;

--
-- 转存表中的数据 `pes_field`
--

INSERT INTO `pes_field` (`field_id`, `model_id`, `field_name`, `display_name`, `field_type`, `field_option`, `field_default`, `field_required`, `field_message`, `field_listsort`, `field_status`) VALUES
(1, 6, 'status', '状态', 'radio', '{"\\u7981\\u7528":"0","\\u542f\\u7528":"1"}', '1', 1, '', 100, 1),
(2, 6, 'listsort', '排序', 'text', '', '', 0, '', 98, 1),
(3, 6, 'createtime', '发布时间', 'date', '', '', 0, '', 99, 1),
(4, 7, 'status', '状态', 'radio', '{"\\u7981\\u7528":"0","\\u542f\\u7528":"1"}', '1', 1, '', 100, 1),
(5, 7, 'account', '会员帐号', 'text', '', '', 1, '', 3, 1),
(6, 7, 'password', '会员密码', 'text', '', '', 0, '', 4, 1),
(7, 7, 'mail', '邮箱地址', 'text', '', '', 1, '', 5, 1),
(8, 7, 'name', '会员名称', 'text', '', '', 1, '', 6, 1),
(9, 7, 'group_id', '用户组', 'select', '', '', 1, '', 1, 1),
(10, 6, 'name', '用户组名称', 'text', '', '', 1, '', 1, 1),
(11, 8, 'status', '状态', 'radio', '{"\\u7981\\u7528":"0","\\u542f\\u7528":"1"}', '1', 1, '', 100, 1),
(12, 8, 'listsort', '排序', 'text', '', '', 0, '', 98, 1),
(14, 8, 'title', '项目名称', 'text', '', '', 1, '', 1, 1),
(15, 9, 'status', '状态', 'radio', '{"\\u7981\\u7528":"0","\\u542f\\u7528":"1"}', '1', 0, '', 97, 1),
(16, 9, 'listsort', '排序', 'text', '', '', 0, '', 98, 1),
(17, 9, 'createtime', '发布时间', 'date', '', '', 0, '', 99, 1),
(18, 9, 'accept_id', '属性部门', 'text', '', '', 1, '', 2, 1),
(19, 9, 'title', '任务标题', 'text', '', '', 1, '', 1, 1),
(20, 9, 'department_id', '接收部门ID', 'text', '', '', 1, '', 3, 1),
(21, 9, 'user_id', '接收用户ID', 'text', '', '', 0, '', 5, 1),
(22, 9, 'create_id', '任务发起者', 'text', '', '', 1, '', 4, 1),
(24, 9, 'content', '任务说明', 'editor', '', '', 1, '', 6, 1),
(25, 9, 'file', '任务附件', 'file', '', '', 0, '', 7, 1),
(26, 9, 'completetime', '完成时间', 'text', '', '', 0, '', 102, 1),
(27, 9, 'estimatetime', '预计时间', 'text', '', '', 0, '', 100, 1),
(28, 9, 'actiontime', '执行时间', 'text', '', '', 0, '', 101, 1),
(30, 10, 'listsort', '排序', 'text', '', '', 0, '', 98, 1),
(31, 10, 'createtime', '发布时间', 'date', '', '', 0, '', 99, 1),
(32, 10, 'name', '部门名称', 'text', '', '', 1, '', 1, 1),
(33, 10, 'header', '负责人', 'text', '', '', 1, '', 2, 1),
(34, 7, 'department_id', '部门ID', 'text', '', '', 1, '', 2, 1);

-- --------------------------------------------------------

--
-- 表的结构 `pes_lang`
--

CREATE TABLE IF NOT EXISTS `pes_lang` (
  `id` int(11) NOT NULL,
  `country` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `pes_mail_verify`
--

CREATE TABLE IF NOT EXISTS `pes_mail_verify` (
  `mail_verify_id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `createtime` int(11) NOT NULL,
  `verifytime` int(11) NOT NULL,
  `verify_status` tinyint(1) NOT NULL,
  PRIMARY KEY (`mail_verify_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `pes_menu`
--

CREATE TABLE IF NOT EXISTS `pes_menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(128) NOT NULL,
  `menu_pid` int(11) NOT NULL,
  `menu_icon` varchar(128) NOT NULL,
  `menu_url` varchar(255) NOT NULL,
  `menu_listsort` tinyint(100) NOT NULL,
  PRIMARY KEY (`menu_id`),
  KEY `menu_pid` (`menu_pid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=45 ;

--
-- 转存表中的数据 `pes_menu`
--

INSERT INTO `pes_menu` (`menu_id`, `menu_name`, `menu_pid`, `menu_icon`, `menu_url`, `menu_listsort`) VALUES
(1, '基础设置', 0, 'am-icon-tachometer', '', 0),
(4, '系统信息', 1, 'am-icon-info-circle', 'Team-Index-systemInfo', 0),
(8, '后台菜单', 1, 'am-icon-align-justify', 'Team-Index-menuList', 0),
(9, '模型管理', 0, 'am-icon-sitemap', 'Team-Model-index', 0),
(10, '模型列表', 9, 'am-icon-list-alt', 'Team-Model-index', 0),
(11, '清空缓存', 1, 'am-icon-refresh', 'Team-Index-clear', 0),
(13, '内容管理', 0, 'am-icon-database', '', 0),
(15, '会员管理', 0, 'am-icon-user', '', 0),
(16, '会员列表', 15, 'am-icon-user', 'Team-User-index', 0),
(17, '权限节点', 15, 'am-icon-unlink', 'Team-User-nodeList', 0),
(18, '用户组', 15, 'am-icon-group', 'Team-User_group-index', 0),
(19, '高级设置', 0, 'am-icon-wrench', '', 0),
(20, '系统设置', 19, 'am-icon-server', 'Team-Setting-action', 0),
(38, '项目列表', 13, 'am-icon-cubes', 'Team-Project-index', 0),
(39, '任务列表', 9, 'am-icon-tasks', 'Team-Task-index', 0),
(40, '部门列表', 15, 'am-icon-legal', 'Team-Department-index', 0),
(41, '个人中心', 0, 'am-icon-home', '', 0),
(42, '我的任务', 41, 'am-icon-tags', 'Team-task-my', 0),
(43, '日常报表', 41, 'am-icon-file-text-o', 'Team-Day-record', 0),
(44, '退出系统', 41, 'am-icon-sign-out', 'Team-Index-logout', 0);

-- --------------------------------------------------------

--
-- 表的结构 `pes_model`
--

CREATE TABLE IF NOT EXISTS `pes_model` (
  `model_id` int(11) NOT NULL AUTO_INCREMENT,
  `model_name` varchar(128) NOT NULL,
  `lang_key` varchar(128) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `is_search` tinyint(11) NOT NULL COMMENT '允许搜索',
  `model_attr` tinyint(1) NOT NULL COMMENT '模型属性 1:前台(含前台) 2:后台',
  PRIMARY KEY (`model_id`),
  UNIQUE KEY `model_name` (`model_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `pes_model`
--

INSERT INTO `pes_model` (`model_id`, `model_name`, `lang_key`, `status`, `is_search`, `model_attr`) VALUES
(6, 'User_group', '用户组列表', 1, 0, 2),
(7, 'User', '会员列表', 1, 0, 2),
(8, 'Project', '项目列表', 1, 1, 2),
(9, 'Task', '任务列表', 1, 1, 1),
(10, 'Department', '部门列表', 1, 1, 2);

-- --------------------------------------------------------

--
-- 表的结构 `pes_node`
--

CREATE TABLE IF NOT EXISTS `pes_node` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL COMMENT '规则唯一英文标识',
  `title` varchar(128) NOT NULL COMMENT '描述名称',
  `pid` int(11) NOT NULL COMMENT '父类ID',
  `child` text NOT NULL,
  `verify` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否进行权限验证',
  `mes` varchar(128) NOT NULL COMMENT '提示信息',
  `listsort` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`,`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `pes_notice`
--

CREATE TABLE IF NOT EXISTS `pes_notice` (
  `notice_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `task_id` int(11) NOT NULL COMMENT '任务ID',
  `notice_type` tinyint(1) NOT NULL COMMENT '通知类型 1:收到新任务 2.指派审核任务 3.待审核任务 4.待修改的任务 5.部门待审核指派任务 6.完成的任务',
  `notice_read` tinyint(1) NOT NULL COMMENT '是否已读：0 未读 1 已读',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统信息消息' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `pes_option`
--

CREATE TABLE IF NOT EXISTS `pes_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `option_name` varchar(128) NOT NULL,
  `name` varchar(128) NOT NULL,
  `value` text NOT NULL,
  `option_range` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- 转存表中的数据 `pes_option`
--

INSERT INTO `pes_option` (`id`, `option_name`, `name`, `value`, `option_range`) VALUES
(1, 'siteurl', '网站链接', 'http://www.cms.com', 'setting'),
(2, 'sitetitle', '网站名称', 'PESCMS', 'setting'),
(3, 'subtitle', '副标题', '', 'setting'),
(4, 'seo_keyword', '网站关键词', 'PESCMS', 'setting'),
(5, 'seo_description', '网站描述', 'PESCMS', 'setting'),
(6, 'logo', '网站logo', '/upload/20150327/5515786073efc.png', 'setting'),
(7, 'theme', '主题', 'WorkHard', 'theme'),
(8, 'fieldType', '表单类型', '{"category":"\\u5206\\u7c7b","text":"\\u5355\\u884c\\u8f93\\u5165\\u6846","radio":"\\u5355\\u9009\\u6309\\u94ae","checkbox":"\\u590d\\u9009\\u6846","select":"\\u5355\\u9009\\u4e0b\\u62c9\\u6846","textarea":"\\u591a\\u884c\\u8f93\\u5165\\u6846","editor":"\\u7f16\\u8f91\\u5668","thumb":"\\u7565\\u7f29\\u56fe","img":"\\u4e0a\\u4f20\\u56fe\\u7ec4","file":"\\u4e0a\\u4f20\\u6587\\u4ef6","date":"\\u65e5\\u671f"}', 'Miscellaneous'),
(9, 'sitestatus', '网站状态', '1', 'setting'),
(10, 'footerCode', '页脚代码', '', 'setting'),
(11, 'closeReason', '关闭原因', 'PESCMS目前正在维护升级中...\r\n您可以访问OSCGIT获取最新的代码：http://git.oschina.net/fallBirds/PESCMS2.0', 'setting'),
(12, 'system', '系统变量', '{"copyright":"\\u7248\\u6743\\u6240\\u6709\\u00a92013-2014 PESCMS\\u5f00\\u53d1\\u56e2\\u961f"}', 'system'),
(13, 'version', '系统版本', 'PESCMS V1.20140226beta', ''),
(14, 'upload_img', '图片格式', '["jpg","jpge","bmp","gif","png"]', 'upload'),
(15, 'upload_file', '文件格式', '["zip","rar","7z","doc","docx","pdf","xls","xlsx","ppt","pptx","txt","7z"]', 'upload'),
(16, 'urlModel', 'URL格式', '{"index":"1","urlModel":"3","suffix":"1"}', 'url');

-- --------------------------------------------------------

--
-- 表的结构 `pes_project`
--

CREATE TABLE IF NOT EXISTS `pes_project` (
  `project_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_listsort` int(11) NOT NULL,
  `project_status` tinyint(4) NOT NULL,
  `project_lang` tinyint(4) NOT NULL,
  `project_url` varchar(255) NOT NULL,
  `project_title` varchar(255) NOT NULL,
  PRIMARY KEY (`project_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `pes_project`
--

INSERT INTO `pes_project` (`project_id`, `project_listsort`, `project_status`, `project_lang`, `project_url`, `project_title`) VALUES
(1, 0, 1, 0, '/Project/view/id/1.html', 'PESCMS'),
(2, 0, 1, 0, '/Project/view/id/2.html', 'PESCMS TEAM');

-- --------------------------------------------------------

--
-- 表的结构 `pes_task`
--

CREATE TABLE IF NOT EXISTS `pes_task` (
  `task_id` int(11) NOT NULL AUTO_INCREMENT,
  `task_listsort` int(11) NOT NULL,
  `task_status` tinyint(4) NOT NULL,
  `task_lang` tinyint(4) NOT NULL,
  `task_url` varchar(255) NOT NULL,
  `task_createtime` int(11) NOT NULL,
  `task_accept_id` tinyint(1) NOT NULL COMMENT '0: 非本部门任务，需要对应部门负责人审核任务 1:本部门任务，直接指派内部人员',
  `task_title` varchar(255) NOT NULL,
  `task_department_id` varchar(255) NOT NULL,
  `task_user_id` varchar(255) NOT NULL,
  `task_create_id` varchar(255) NOT NULL,
  `task_content` text NOT NULL,
  `task_file` text NOT NULL,
  `task_completetime` varchar(255) NOT NULL,
  `task_estimatetime` varchar(255) NOT NULL,
  `task_actiontime` varchar(255) NOT NULL,
  PRIMARY KEY (`task_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `pes_task`
--

INSERT INTO `pes_task` (`task_id`, `task_listsort`, `task_status`, `task_lang`, `task_url`, `task_createtime`, `task_accept_id`, `task_title`, `task_department_id`, `task_user_id`, `task_create_id`, `task_content`, `task_file`, `task_completetime`, `task_estimatetime`, `task_actiontime`) VALUES
(1, 0, 1, 0, '/Task/view/id/1.html', 0, 1, '发起第一个任务', '1', '2', '1', '&lt;p&gt;dfdd&lt;/p&gt;', '', '', '', ''),
(2, 0, 1, 0, '/Task/view/id/2.html', 0, 0, 'sad', '2', '', '1', '&lt;p&gt;dd&lt;/p&gt;', '', '', '', ''),
(3, 0, 1, 0, '/Task/view/id/3.html', 0, 1, 'asdsadsad', '1', '1', '2', '&lt;p&gt;sadsad&lt;/p&gt;', '', '', '', ''),
(4, 0, 1, 0, '/Task/view/id/4.html', 0, 0, 'dsgfdhfgj', '2', '', '2', '&lt;p&gt;asdsad&lt;/p&gt;', '', '', '', ''),
(5, 0, 1, 0, '/Task/view/id/5.html', 0, 0, 'gikfghkfgk', '3', '', '2', '&lt;p&gt;adfssaf&lt;/p&gt;', '', '', '', ''),
(6, 0, 1, 0, '/Task/view/id/6.html', 0, 1, 'dsafsdgdfs', '1', '1', '2', '&lt;p&gt;asdsadsad&lt;/p&gt;', '', '', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `pes_task_check`
--

CREATE TABLE IF NOT EXISTS `pes_task_check` (
  `check_id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) NOT NULL COMMENT '任务ID',
  `check_user_id` int(11) NOT NULL COMMENT '审核人ID',
  PRIMARY KEY (`check_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `pes_task_check`
--

INSERT INTO `pes_task_check` (`check_id`, `task_id`, `check_user_id`) VALUES
(1, 1, 1),
(2, 1, 5),
(3, 2, 1),
(4, 3, 2),
(5, 4, 2),
(6, 4, 1),
(7, 5, 2),
(8, 5, 1),
(9, 6, 2);

-- --------------------------------------------------------

--
-- 表的结构 `pes_user`
--

CREATE TABLE IF NOT EXISTS `pes_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_account` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_mail` varchar(255) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `user_group_id` int(11) NOT NULL,
  `user_status` tinyint(4) NOT NULL,
  `user_createtime` int(11) NOT NULL,
  `user_last_login` int(11) NOT NULL,
  `user_department_id` varchar(255) NOT NULL,
  `user_head` varchar(255) NOT NULL COMMENT '用户头像',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `pes_user`
--

INSERT INTO `pes_user` (`user_id`, `user_account`, `user_password`, `user_mail`, `user_name`, `user_group_id`, `user_status`, `user_createtime`, `user_last_login`, `user_department_id`, `user_head`) VALUES
(1, 'admin', '75e1d83ba0f896dd29337a2539facb84', 'dev@pescms.com', '管理员', 1, 1, 1388391307, 1388391307, '1', 'http://static.oschina.net/uploads/user/728/1456141_200.jpg?t=1426432545000'),
(2, 'zhangsan', 'fa251b0c0d49590b8799af684eae070e', 'dev@pescms.com', '张三', 2, 1, 1388391307, 1388391307, '1', 'http://amui.qiniudn.com/bw-2014-06-19.jpg?imageView/1/w/1000/h/1000/q/80'),
(3, 'lisi', 'f4d91866c0fc28072ac207063197805', 'dev@pescms.com', '李四', 2, 1, 1388391307, 1388391307, '2', 'http://amui.qiniudn.com/bw-2014-06-19.jpg?imageView/1/w/1000/h/1000/q/80'),
(4, 'wangwu', '21312f866c0fc28072ac207063197805', 'dev@pescms.com', '王五', 2, 1, 1388391307, 1388391307, '3', 'http://amui.qiniudn.com/bw-2014-06-19.jpg?imageView/1/w/1000/h/1000/q/80'),
(5, 'zhaoliu', 'f4s072asdfdsf7805', 'dev@pescms.com', '赵六', 2, 1, 1388391307, 1388391307, '3', 'http://amui.qiniudn.com/bw-2014-06-19.jpg?imageView/1/w/1000/h/1000/q/80');

-- --------------------------------------------------------

--
-- 表的结构 `pes_user_group`
--

CREATE TABLE IF NOT EXISTS `pes_user_group` (
  `user_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_group_listsort` int(11) NOT NULL,
  `user_group_status` tinyint(4) NOT NULL,
  `user_group_lang` tinyint(4) NOT NULL,
  `user_group_url` varchar(255) NOT NULL,
  `user_group_createtime` int(11) NOT NULL,
  `user_group_name` varchar(255) NOT NULL,
  PRIMARY KEY (`user_group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `pes_user_group`
--

INSERT INTO `pes_user_group` (`user_group_id`, `user_group_listsort`, `user_group_status`, `user_group_lang`, `user_group_url`, `user_group_createtime`, `user_group_name`) VALUES
(1, 0, 1, 0, '/User_group/view/id/1.html', 1417273380, '管理员'),
(2, 0, 1, 0, '/User_group/view/id/2.html', 1417273440, '普通会员'),
(3, 0, 1, 0, '/User_group/view/id/3.html', 1417273440, '验证会员');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;