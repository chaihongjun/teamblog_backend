-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2020-06-02 12:37:49
-- 服务器版本： 10.1.13-MariaDB
-- PHP Version: 5.6.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `demo`
--
CREATE DATABASE IF NOT EXISTS `demo` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `demo`;

-- --------------------------------------------------------

--
-- 表的结构 `os_admin_user`
--

DROP TABLE IF EXISTS `os_admin_user`;
CREATE TABLE `os_admin_user` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `username` varchar(20) NOT NULL DEFAULT '' COMMENT '管理员用户名',
  `password` varchar(50) NOT NULL DEFAULT '' COMMENT '管理员密码',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '状态 1 启用 0 禁用',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(20) DEFAULT NULL COMMENT '最后登录IP'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='管理员表';

--
-- 转存表中的数据 `os_admin_user`
--

INSERT INTO `os_admin_user` (`id`, `username`, `password`, `status`, `create_time`, `last_login_time`, `last_login_ip`) VALUES
(1, 'admin', '0dfc7612f607db6c17fd99388e9e5f9c', 1, '2016-10-18 15:28:37', '2020-05-29 09:56:40', '127.0.0.1');

-- --------------------------------------------------------

--
-- 表的结构 `os_article`
--

DROP TABLE IF EXISTS `os_article`;
CREATE TABLE `os_article` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '文章ID',
  `cid` smallint(5) UNSIGNED NOT NULL COMMENT '分类ID',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `shorttitle` varchar(255) NOT NULL,
  `introduction` varchar(255) DEFAULT '' COMMENT '简介',
  `content` longtext COMMENT '内容',
  `author` varchar(20) DEFAULT '' COMMENT '作者',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '状态 0 待审核  1 审核',
  `reading` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '阅读量',
  `thumb` varchar(255) DEFAULT '' COMMENT '缩略图',
  `photo` text COMMENT '图集',
  `is_top` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否置顶  0 不置顶  1 置顶',
  `is_recommend` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否推荐  0 不推荐  1 推荐',
  `sort` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `publish_time` datetime NOT NULL COMMENT '发布时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文章表';

--
-- 转存表中的数据 `os_article`
--

INSERT INTO `os_article` (`id`, `cid`, `title`, `shorttitle`, `introduction`, `content`, `author`, `status`, `reading`, `thumb`, `photo`, `is_top`, `is_recommend`, `sort`, `create_time`, `publish_time`) VALUES
(1, 1, '云适配获千万美金B轮融资，将开发移动端企业安全浏览器', '云适配获千万美金B轮融资', '不论是打车，买菜，交水电费，乃至于按摩，现在几乎你能想到的消费行为都能通过移动端进行操作——事实已经证明移动端的对消费者服务是个大市场。那么对企业移动端的服务的市场又怎样呢？至少近日晨兴创投和 IDG 资本对云适配千万美元级的投资能告诉我们，风险资本觉得这个市场正在变好。', '<p><img src="https://demo.themebetter.com/dux/wp-content/uploads/sites/3/2015/06/110.jpg"/></p><p>不论是打车，买菜，交水电费，乃至于按摩，现在几乎你能想到的消费行为都能通过移动端进行操作——事实已经证明移动端的对消费者服务是个大市场。那么对企业移动端的服务的市场又怎样呢？至少近日晨兴创投和 IDG 资本对云适配千万美元级的投资能告诉我们，风险资本觉得这个市场正在变好。</p><p>云适配创立于 2012 年，主要业务是通过网页内容的抓取和适配，将PC端的网页自动转化为适合移动端的网页。通过这项名为跨屏云 Xcloud 的服务，企业用户不用修改任何网页的前端设计便能把让本不支持移动端浏览的网页获得适应移动端排版和布局。 三年来，云适配的技术被用在了超过 30 万的企业网站上，其中包括中国政府网，北京大学官网，联想海信的官网等。<br/></p><p>大部分企业用户的网页再适配都是在公有云完成，这部分服务云适配免费提供。不过一些对信息安全极为重视的客户，比如政府和金融企业等，会选择将跨屏云部署在自己的私有云上，云适配会向这些用户收取一定的费用。<br/></p><p>除了网页适配外，云适配的另一项服务是开源的 HTML 5 前端框架 Amaze UI。Amaze UI 是一款类似 Bootsrap 的前端模块库，相较于 Twitter 驰名天下的 Boostrap，Amaze UI 做了更多针对中文和国内主流浏览器的优化。目前Amaze UI 在 GitHub上 有 4000 多的收藏和 1000 多的fork。利用 Amaze UI，开发者能使用和修改现成的 HTML 5 模块，从而加速开发。<br/></p><p>当然，一个仅仅是现金流良好的自动化网页适配公司并不需要千万美元级的 B轮融资。云适配正在开发一款移动安全浏览器，试图利用跨屏云带来的用户基础进入更深层的企业服务市场。这款安全浏览器支持缓存数据沙盒化，以及VPN 网络沙盒化等功能，从而在网页端提供一个安全的移动互联网办公环境。目前这款浏览器尚在开发中，预计今年九月发布。<br/></p><p>对于这次的融资，云适配的创始人，前微软 IE 工程师陈本峰说道，“因为我自己是 HTML 5 的中国区布道师，所以我觉得我们这次融资不仅是对这个企业，也是市场对 HTML 5 在更宽广的应用前景上的认可。”<br/></p><p><br/></p>', 'admin', 1, 0, '', NULL, 0, 0, 0, '2017-04-11 14:10:10', '2017-04-11 14:09:45'),
(2, 4, '除了做智能手机 谷歌还开发了个智能手机壳', '', '', '<p><img src="https://demo.themebetter.com/dux/wp-content/uploads/sites/3/2015/06/11.jpg"/></p><p>在手机如此智能的年代，你有没有想过手机壳也玩玩智能？显然谷歌想到了。</p><p>谷歌正在跟多位艺人合作，开发一系列全新手机壳，其中第一款产品称为“Editions”，由DJ Skrillex设计。</p><p>这系列手机壳可以通过NFC与手机相连，自动识别手机壁纸，并更新在保护壳上。你还可以选择谷歌发射的卫星所拍摄的地球图片，或者用户手机所在位置可以看到的星座图像。</p><p>目前该手机壳在谷歌官方商城上上架销售，售价40美元。支持Nexus 5、6以及三星Galaxy S5、S6和Note 4。</p><p><br/></p>', 'admin', 1, 0, '', NULL, 0, 0, 0, '2020-05-27 15:38:22', '2020-05-27 15:37:37'),
(3, 1, '亚马逊对用户评论系统做出重大更新，引入机器学习平台', '', '', '<p>今天，亚马逊对美国地区的用户评论系统做出重大改变，借助亚马逊内部自行研发的全新机器学习平台，可以将那些最新、最有用的评论置顶显示。</p><p><img src="https://demo.themebetter.com/dux/wp-content/uploads/sites/3/2015/06/e1.jpg"/></p><p>“这套系统能够分辨出哪些评论对用户来说是最有用的，而且它的这一能力还会日渐精进。”亚马逊发言人Julie Law在一次采访中说道。据称，此次改版自周五开始施行，一开始会比较不明显。新系统会给新评论、亚马逊认证买家评论和被赞最多的评论以更高权重。</p><p>至于亚马逊的5星打分体系，它在此前就只是对所有评分求个平均数，此次改版后，5分打分体系也会按照上述的权重进行改动，因此一样物品的分数可能是变动不居的。目前我们尚不清楚这套新系统什么时候在其他国家推出。</p><p>用户评论系统作为亚马逊网站的一个重要部分，已经存在了超过20年。它的文字评论和5分打分体系是买家的重要参照，可以让买家在入手前知晓产品的受欢迎程度和质量好坏。正由于这个评价系统太重要了，因此亚马逊对其做出任何改变都会非常谨慎。另外，四月份亚马逊刚刚起诉了一票刷分网站。</p><p>Law并未透露开发这套系统花了多长时间，但她表示亚马逊对此非常重视。“因为这能让人们做出更好的决策。”</p><p>比如，有时卖家会对产品做出一些小改变或者处理一些用户纠纷，在产品尚未在官方层面进行升级或更新的情况下，有了新系统，因为它是按时序排列，卖家就能将这些信息及时传达出去了。</p><p><br/></p>', 'admin', 1, 0, '', NULL, 0, 0, 0, '2020-05-27 15:39:02', '2020-05-27 15:38:23'),
(4, 4, 'Airbnb即将完成15亿美金融资，估值达240亿美元', '', '', '<p><img src="https://demo.themebetter.com/dux/wp-content/uploads/sites/3/2015/06/e2.jpg"/></p><p>FT报道称，房屋共享平台Airbnb即将完成一笔“巨额”15亿美元的融资，融资完成之后其估值将达到240亿美元。这笔融资将由投资过美团和呷哺呷哺的General Atlantic领投，高瓴资本和Tiger Global跟投，知情人士称两家跟投的规模也相当可观，而且这三家公司全部是Airbnb的新晋投资者。</p><p>其他的投资者包括来自英国的Baillie Gifford，美国的Wellington以及以前曾经投资过Airbnb的Fidelity和T Rowe Price两家基金。</p><p>一旦完成，这笔融资将匹配历史上最大的一些对于一家非上市公司的股权投资，而之前如此大手笔都来自于互联网公司——Facebook在2012年上市之前完成的最后一轮融资募集了15亿美元，Uber也正在寻求一笔15亿美元的融资（这将使得其估值达到500亿美元，之前消息称高瓴资本投资了10亿美元）。</p><p>这笔融资进一步体现了Airbnb的国际化扩张节奏，Airbnb非常看好亚洲市场快速增长的需求，因此也将这一地区作为扩张的重点。</p><p>根据本轮融资的数据可以分析出，融资之前Airbnb的估值已经达到240亿美元，远高于15个月之前其完成4.75亿美元融资时100亿美元的估值。</p><p>此前曾有消息称Airbnb正在开展一轮10亿美元的融资。</p><p><br/></p>', 'admin', 1, 0, '', NULL, 0, 0, 0, '2020-05-27 15:39:52', '2020-05-27 15:39:11'),
(5, 4, 'ORB潜水头盔 回收自己氧气在水下呼吸', '', '', '<p><span style="color: rgb(85, 85, 85); font-family: ">ORB是一个潜水头盔，采用现代技术称为“呼吸”回收你自己的氧气在水下呼吸。大多数的呼吸器都很笨重，戴上会感到很不舒服，但ORB轻便，易于移动，戴上它你会感觉相当轻松，毫无压力，可以大大增加潜水的体验度。更加贴心的是，它配备了内置的蓝牙，可以满足潜水者与其他潜水员随时针对水下环境进行沟通和互动。</span></p>', 'admin', 1, 0, '', NULL, 0, 0, 0, '2020-05-27 15:42:16', '2020-05-27 15:39:54');

-- --------------------------------------------------------

--
-- 表的结构 `os_auth_group`
--

DROP TABLE IF EXISTS `os_auth_group`;
CREATE TABLE `os_auth_group` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `title` char(100) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `rules` varchar(255) NOT NULL COMMENT '权限规则ID'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='权限组表';

--
-- 转存表中的数据 `os_auth_group`
--

INSERT INTO `os_auth_group` (`id`, `title`, `status`, `rules`) VALUES
(1, '超级管理组', 1, '1,2,3,73,74,5,6,7,8,9,10,11,12,39,40,41,42,43,14,13,20,21,22,23,24,15,25,26,27,28,29,30,16,17,44,45,46,47,48,18,49,50,51,52,53,19,31,32,33,34,35,36,37,54,55,58,59,60,61,62,56,63,64,65,66,67,57,68,69,70,71,72');

-- --------------------------------------------------------

--
-- 表的结构 `os_auth_group_access`
--

DROP TABLE IF EXISTS `os_auth_group_access`;
CREATE TABLE `os_auth_group_access` (
  `uid` mediumint(8) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='权限组规则表';

--
-- 转存表中的数据 `os_auth_group_access`
--

INSERT INTO `os_auth_group_access` (`uid`, `group_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `os_auth_rule`
--

DROP TABLE IF EXISTS `os_auth_rule`;
CREATE TABLE `os_auth_rule` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(80) NOT NULL DEFAULT '' COMMENT '规则名称',
  `title` varchar(20) NOT NULL,
  `type` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `pid` smallint(5) UNSIGNED NOT NULL COMMENT '父级ID',
  `icon` varchar(50) DEFAULT '' COMMENT '图标',
  `sort` tinyint(4) UNSIGNED NOT NULL COMMENT '排序',
  `condition` char(100) DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='规则表';

--
-- 转存表中的数据 `os_auth_rule`
--

INSERT INTO `os_auth_rule` (`id`, `name`, `title`, `type`, `status`, `pid`, `icon`, `sort`, `condition`) VALUES
(1, 'admin/System/default', '系统配置', 1, 1, 0, 'fa fa-gears', 0, ''),
(2, 'admin/System/siteConfig', '站点配置', 1, 1, 1, '', 0, ''),
(3, 'admin/System/updateSiteConfig', '更新配置', 1, 0, 1, '', 0, ''),
(5, 'admin/Menu/default', '菜单管理', 1, 1, 0, 'fa fa-bars', 0, ''),
(6, 'admin/Menu/index', '后台菜单', 1, 1, 5, '', 0, ''),
(7, 'admin/Menu/add', '添加菜单', 1, 0, 6, '', 0, ''),
(8, 'admin/Menu/save', '保存菜单', 1, 0, 6, '', 0, ''),
(9, 'admin/Menu/edit', '编辑菜单', 1, 0, 6, '', 0, ''),
(10, 'admin/Menu/update', '更新菜单', 1, 0, 6, '', 0, ''),
(11, 'admin/Menu/delete', '删除菜单', 1, 0, 6, '', 0, ''),
(12, 'admin/Nav/index', '导航管理', 1, 1, 5, '', 0, ''),
(13, 'admin/Category/index', '栏目管理', 1, 1, 14, 'fa fa-sitemap', 0, ''),
(14, 'admin/Content/default', '内容管理', 1, 1, 0, 'fa fa-file-text', 0, ''),
(15, 'admin/Article/index', '文章管理', 1, 1, 14, '', 0, ''),
(16, 'admin/User/default', '用户管理', 1, 1, 0, 'fa fa-users', 0, ''),
(17, 'admin/User/index', '普通用户', 1, 1, 16, '', 0, ''),
(18, 'admin/AdminUser/index', '管理员', 1, 1, 16, '', 0, ''),
(19, 'admin/AuthGroup/index', '权限组', 1, 1, 16, '', 0, ''),
(20, 'admin/Category/add', '添加栏目', 1, 0, 13, '', 0, ''),
(21, 'admin/Category/save', '保存栏目', 1, 0, 13, '', 0, ''),
(22, 'admin/Category/edit', '编辑栏目', 1, 0, 13, '', 0, ''),
(23, 'admin/Category/update', '更新栏目', 1, 0, 13, '', 0, ''),
(24, 'admin/Category/delete', '删除栏目', 1, 0, 13, '', 0, ''),
(25, 'admin/Article/add', '添加文章', 1, 0, 15, '', 0, ''),
(26, 'admin/Article/save', '保存文章', 1, 0, 15, '', 0, ''),
(27, 'admin/Article/edit', '编辑文章', 1, 0, 15, '', 0, ''),
(28, 'admin/Article/update', '更新文章', 1, 0, 15, '', 0, ''),
(29, 'admin/Article/delete', '删除文章', 1, 0, 15, '', 0, ''),
(30, 'admin/Article/toggle', '文章审核', 1, 0, 15, '', 0, ''),
(31, 'admin/AuthGroup/add', '添加权限组', 1, 0, 19, '', 0, ''),
(32, 'admin/AuthGroup/save', '保存权限组', 1, 0, 19, '', 0, ''),
(33, 'admin/AuthGroup/edit', '编辑权限组', 1, 0, 19, '', 0, ''),
(34, 'admin/AuthGroup/update', '更新权限组', 1, 0, 19, '', 0, ''),
(35, 'admin/AuthGroup/delete', '删除权限组', 1, 0, 19, '', 0, ''),
(36, 'admin/AuthGroup/auth', '授权', 1, 0, 19, '', 0, ''),
(37, 'admin/AuthGroup/updateAuthGroupRule', '更新权限组规则', 1, 0, 19, '', 0, ''),
(39, 'admin/Nav/add', '添加导航', 1, 0, 12, '', 0, ''),
(40, 'admin/Nav/save', '保存导航', 1, 0, 12, '', 0, ''),
(41, 'admin/Nav/edit', '编辑导航', 1, 0, 12, '', 0, ''),
(42, 'admin/Nav/update', '更新导航', 1, 0, 12, '', 0, ''),
(43, 'admin/Nav/delete', '删除导航', 1, 0, 12, '', 0, ''),
(44, 'admin/User/add', '添加用户', 1, 0, 17, '', 0, ''),
(45, 'admin/User/save', '保存用户', 1, 0, 17, '', 0, ''),
(46, 'admin/User/edit', '编辑用户', 1, 0, 17, '', 0, ''),
(47, 'admin/User/update', '更新用户', 1, 0, 17, '', 0, ''),
(48, 'admin/User/delete', '删除用户', 1, 0, 17, '', 0, ''),
(49, 'admin/AdminUser/add', '添加管理员', 1, 0, 18, '', 0, ''),
(50, 'admin/AdminUser/save', '保存管理员', 1, 0, 18, '', 0, ''),
(51, 'admin/AdminUser/edit', '编辑管理员', 1, 0, 18, '', 0, ''),
(52, 'admin/AdminUser/update', '更新管理员', 1, 0, 18, '', 0, ''),
(53, 'admin/AdminUser/delete', '删除管理员', 1, 0, 18, '', 0, ''),
(54, 'admin/Slide/default', '扩展管理', 1, 1, 0, 'fa fa-wrench', 0, ''),
(55, 'admin/SlideCategory/index', '轮播分类', 1, 1, 54, '', 0, ''),
(56, 'admin/Slide/index', '轮播图管理', 1, 1, 54, '', 0, ''),
(57, 'admin/Link/index', '友情链接', 1, 1, 54, 'fa fa-link', 0, ''),
(58, 'admin/SlideCategory/add', '添加分类', 1, 0, 55, '', 0, ''),
(59, 'admin/SlideCategory/save', '保存分类', 1, 0, 55, '', 0, ''),
(60, 'admin/SlideCategory/edit', '编辑分类', 1, 0, 55, '', 0, ''),
(61, 'admin/SlideCategory/update', '更新分类', 1, 0, 55, '', 0, ''),
(62, 'admin/SlideCategory/delete', '删除分类', 1, 0, 55, '', 0, ''),
(63, 'admin/Slide/add', '添加轮播', 1, 0, 56, '', 0, ''),
(64, 'admin/Slide/save', '保存轮播', 1, 0, 56, '', 0, ''),
(65, 'admin/Slide/edit', '编辑轮播', 1, 0, 56, '', 0, ''),
(66, 'admin/Slide/update', '更新轮播', 1, 0, 56, '', 0, ''),
(67, 'admin/Slide/delete', '删除轮播', 1, 0, 56, '', 0, ''),
(68, 'admin/Link/add', '添加链接', 1, 0, 57, '', 0, ''),
(69, 'admin/Link/save', '保存链接', 1, 0, 57, '', 0, ''),
(70, 'admin/Link/edit', '编辑链接', 1, 0, 57, '', 0, ''),
(71, 'admin/Link/update', '更新链接', 1, 0, 57, '', 0, ''),
(72, 'admin/Link/delete', '删除链接', 1, 0, 57, '', 0, ''),
(73, 'admin/ChangePassword/index', '修改密码', 1, 1, 1, '', 0, ''),
(74, 'admin/ChangePassword/updatePassword', '更新密码', 1, 0, 1, '', 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `os_category`
--

DROP TABLE IF EXISTS `os_category`;
CREATE TABLE `os_category` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '分类ID',
  `name` varchar(50) NOT NULL COMMENT '分类名称',
  `alias` varchar(50) DEFAULT '' COMMENT '导航别名',
  `content` longtext COMMENT '分类内容',
  `thumb` varchar(255) DEFAULT '' COMMENT '缩略图',
  `icon` varchar(20) DEFAULT '' COMMENT '分类图标',
  `list_template` varchar(50) DEFAULT '' COMMENT '分类列表模板',
  `detail_template` varchar(50) DEFAULT '' COMMENT '分类详情模板',
  `type` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '分类类型  1  列表  2 单页',
  `sort` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT '排序',
  `pid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `path` varchar(255) DEFAULT '' COMMENT '路径',
  `dir` varchar(255) NOT NULL COMMENT '栏目目录',
  `create_time` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='分类表';

--
-- 转存表中的数据 `os_category`
--

INSERT INTO `os_category` (`id`, `name`, `alias`, `content`, `thumb`, `icon`, `list_template`, `detail_template`, `type`, `sort`, `pid`, `path`, `dir`, `create_time`) VALUES
(1, '科技', 'tech', '<p>科技频道</p>', '', 'fa fa-code', 'techList.html', 'techDetail.html', 1, 0, 0, '0,', 'tech', '2016-12-22 18:22:24'),
(2, '产品中心', 'product', '<p>产品中心</p>', '', 'fa fa-image', '', '', 1, 0, 0, '0,', 'product', '2020-05-27 15:02:25'),
(3, '电脑', '电脑', '<p>产品中心二级</p>', '', 'fa fa-image', '', '', 1, 0, 2, '0,2,', 'computer', '2020-05-27 15:03:17'),
(4, 'pc机', 'pc机', '<p>产品中心三级</p>', '', 'fa fa-image', '', '', 1, 0, 3, '0,2,3,', 'pc', '2020-05-27 15:04:05');

-- --------------------------------------------------------

--
-- 表的结构 `os_link`
--

DROP TABLE IF EXISTS `os_link`;
CREATE TABLE `os_link` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '链接名称',
  `link` varchar(255) DEFAULT '' COMMENT '链接地址',
  `image` varchar(255) DEFAULT '' COMMENT '链接图片',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '状态 1 显示  2 隐藏',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '排序'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='友情链接表';

-- --------------------------------------------------------

--
-- 表的结构 `os_nav`
--

DROP TABLE IF EXISTS `os_nav`;
CREATE TABLE `os_nav` (
  `id` int(10) UNSIGNED NOT NULL,
  `pid` int(10) UNSIGNED NOT NULL COMMENT '父ID',
  `name` varchar(20) NOT NULL COMMENT '导航名称',
  `alias` varchar(20) DEFAULT '' COMMENT '导航别称',
  `link` varchar(255) DEFAULT '' COMMENT '导航链接',
  `icon` varchar(255) DEFAULT '' COMMENT '导航图标',
  `target` varchar(10) DEFAULT '' COMMENT '打开方式',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '状态  0 隐藏  1 显示',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='导航表';

-- --------------------------------------------------------

--
-- 表的结构 `os_slide`
--

DROP TABLE IF EXISTS `os_slide`;
CREATE TABLE `os_slide` (
  `id` int(10) UNSIGNED NOT NULL,
  `cid` int(10) UNSIGNED NOT NULL COMMENT '分类ID',
  `name` varchar(50) NOT NULL COMMENT '轮播图名称',
  `description` varchar(255) DEFAULT '' COMMENT '说明',
  `link` varchar(255) DEFAULT '' COMMENT '链接',
  `target` varchar(10) DEFAULT '' COMMENT '打开方式',
  `image` varchar(255) DEFAULT '' COMMENT '轮播图片',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '状态  1 显示  0  隐藏',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '排序'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='轮播图表';

-- --------------------------------------------------------

--
-- 表的结构 `os_slide_category`
--

DROP TABLE IF EXISTS `os_slide_category`;
CREATE TABLE `os_slide_category` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL COMMENT '轮播图分类'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='轮播图分类表';

--
-- 转存表中的数据 `os_slide_category`
--

INSERT INTO `os_slide_category` (`id`, `name`) VALUES
(1, '首页轮播');

-- --------------------------------------------------------

--
-- 表的结构 `os_system`
--

DROP TABLE IF EXISTS `os_system`;
CREATE TABLE `os_system` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL COMMENT '配置项名称',
  `value` text NOT NULL COMMENT '配置项值'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='系统配置表';

--
-- 转存表中的数据 `os_system`
--

INSERT INTO `os_system` (`id`, `name`, `value`) VALUES
(1, 'site_config', 'a:7:{s:10:"site_title";s:18:"后台管理系统";s:9:"seo_title";s:9:"SEO标题";s:11:"seo_keyword";s:12:"SEO关键字";s:15:"seo_description";s:9:"SEO说明";s:14:"site_copyright";s:0:"";s:8:"site_icp";s:14:"琼ICP18000000";s:11:"site_tongji";s:0:"";}');

-- --------------------------------------------------------

--
-- 表的结构 `os_user`
--

DROP TABLE IF EXISTS `os_user`;
CREATE TABLE `os_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `mobile` varchar(11) DEFAULT '' COMMENT '手机',
  `email` varchar(50) DEFAULT '' COMMENT '邮箱',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '用户状态  1 正常  2 禁止',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `last_login_ip` varchar(50) DEFAULT '' COMMENT '最后登录IP'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户表';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `os_admin_user`
--
ALTER TABLE `os_admin_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`) USING BTREE;

--
-- Indexes for table `os_article`
--
ALTER TABLE `os_article`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `os_auth_group`
--
ALTER TABLE `os_auth_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `os_auth_group_access`
--
ALTER TABLE `os_auth_group_access`
  ADD UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `group_id` (`group_id`);

--
-- Indexes for table `os_auth_rule`
--
ALTER TABLE `os_auth_rule`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`) USING BTREE;

--
-- Indexes for table `os_category`
--
ALTER TABLE `os_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `os_link`
--
ALTER TABLE `os_link`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `os_nav`
--
ALTER TABLE `os_nav`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `os_slide`
--
ALTER TABLE `os_slide`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `os_slide_category`
--
ALTER TABLE `os_slide_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `os_system`
--
ALTER TABLE `os_system`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `os_user`
--
ALTER TABLE `os_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `os_admin_user`
--
ALTER TABLE `os_admin_user`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `os_article`
--
ALTER TABLE `os_article`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '文章ID', AUTO_INCREMENT=6;
--
-- 使用表AUTO_INCREMENT `os_auth_group`
--
ALTER TABLE `os_auth_group`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `os_auth_rule`
--
ALTER TABLE `os_auth_rule`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;
--
-- 使用表AUTO_INCREMENT `os_category`
--
ALTER TABLE `os_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '分类ID', AUTO_INCREMENT=5;
--
-- 使用表AUTO_INCREMENT `os_link`
--
ALTER TABLE `os_link`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `os_nav`
--
ALTER TABLE `os_nav`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `os_slide`
--
ALTER TABLE `os_slide`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `os_slide_category`
--
ALTER TABLE `os_slide_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `os_system`
--
ALTER TABLE `os_system`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `os_user`
--
ALTER TABLE `os_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
