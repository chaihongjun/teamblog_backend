-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2020-07-06 10:38:39
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
(1, 'admin', '0dfc7612f607db6c17fd99388e9e5f9c', 1, '2016-10-18 15:28:37', '2020-07-02 11:30:13', '127.0.0.1');

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
  `keywords` varchar(255) NOT NULL COMMENT '文章关键词',
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

INSERT INTO `os_article` (`id`, `cid`, `title`, `shorttitle`, `keywords`, `introduction`, `content`, `author`, `status`, `reading`, `thumb`, `photo`, `is_top`, `is_recommend`, `sort`, `create_time`, `publish_time`) VALUES
(1, 1, '云适配获千万美金B轮融资，将开发移动端企业安全浏览器', '云适配获千万美金B轮融资', '移动端,融资', '不论是打车，买菜，交水电费，乃至于按摩，现在几乎你能想到的消费行为都能通过移动端进行操作——事实已经证明移动端的对消费者服务是个大市场。那么对企业移动端的服务的市场又怎样呢？至少近日晨兴创投和 IDG 资本对云适配千万美元级的投资能告诉我们，风险资本觉得这个市场正在变好。', '<p><img src="https://demo.themebetter.com/dux/wp-content/uploads/sites/3/2015/06/110.jpg"/></p><p>不论是打车，买菜，交水电费，乃至于按摩，现在几乎你能想到的消费行为都能通过移动端进行操作——事实已经证明移动端的对消费者服务是个大市场。那么对企业移动端的服务的市场又怎样呢？至少近日晨兴创投和 IDG 资本对云适配千万美元级的投资能告诉我们，风险资本觉得这个市场正在变好。</p><p>云适配创立于 2012 年，主要业务是通过网页内容的抓取和适配，将PC端的网页自动转化为适合移动端的网页。通过这项名为跨屏云 Xcloud 的服务，企业用户不用修改任何网页的前端设计便能把让本不支持移动端浏览的网页获得适应移动端排版和布局。 三年来，云适配的技术被用在了超过 30 万的企业网站上，其中包括中国政府网，北京大学官网，联想海信的官网等。<br/></p><p>大部分企业用户的网页再适配都是在公有云完成，这部分服务云适配免费提供。不过一些对信息安全极为重视的客户，比如政府和金融企业等，会选择将跨屏云部署在自己的私有云上，云适配会向这些用户收取一定的费用。<br/></p><p>除了网页适配外，云适配的另一项服务是开源的 HTML 5 前端框架 Amaze UI。Amaze UI 是一款类似 Bootsrap 的前端模块库，相较于 Twitter 驰名天下的 Boostrap，Amaze UI 做了更多针对中文和国内主流浏览器的优化。目前Amaze UI 在 GitHub上 有 4000 多的收藏和 1000 多的fork。利用 Amaze UI，开发者能使用和修改现成的 HTML 5 模块，从而加速开发。<br/></p><p>当然，一个仅仅是现金流良好的自动化网页适配公司并不需要千万美元级的 B轮融资。云适配正在开发一款移动安全浏览器，试图利用跨屏云带来的用户基础进入更深层的企业服务市场。这款安全浏览器支持缓存数据沙盒化，以及VPN 网络沙盒化等功能，从而在网页端提供一个安全的移动互联网办公环境。目前这款浏览器尚在开发中，预计今年九月发布。<br/></p><p>对于这次的融资，云适配的创始人，前微软 IE 工程师陈本峰说道，“因为我自己是 HTML 5 的中国区布道师，所以我觉得我们这次融资不仅是对这个企业，也是市场对 HTML 5 在更宽广的应用前景上的认可。”<br/></p><p><br/></p>', 'admin', 1, 0, '', NULL, 0, 0, 0, '2017-04-11 14:10:10', '2017-04-11 14:09:45'),
(2, 4, '除了做智能手机 谷歌还开发了个智能手机壳', '', '谷歌', '', '<p><img src="https://demo.themebetter.com/dux/wp-content/uploads/sites/3/2015/06/11.jpg"/></p><p>在手机如此智能的年代，你有没有想过手机壳也玩玩智能？显然谷歌想到了。</p><p>谷歌正在跟多位艺人合作，开发一系列全新手机壳，其中第一款产品称为“Editions”，由DJ Skrillex设计。</p><p>这系列手机壳可以通过NFC与手机相连，自动识别手机壁纸，并更新在保护壳上。你还可以选择谷歌发射的卫星所拍摄的地球图片，或者用户手机所在位置可以看到的星座图像。</p><p>目前该手机壳在谷歌官方商城上上架销售，售价40美元。支持Nexus 5、6以及三星Galaxy S5、S6和Note 4。</p><p><br/></p>', 'admin', 1, 0, '', NULL, 0, 0, 0, '2020-05-27 15:38:22', '2020-05-27 15:37:37'),
(3, 1, '亚马逊对用户评论系统做出重大更新，引入机器学习平台', '', '亚马逊', '今天，亚马逊对美国地区的用户评论系统做出重大改变，借助亚马逊内部自行研发的全新机器学习平台，可以将那些最新、最有用的评论置顶显示', '<p>今天，亚马逊对美国地区的用户评论系统做出重大改变，借助亚马逊内部自行研发的全新机器学习平台，可以将那些最新、最有用的评论置顶显示。</p><p><img src="https://demo.themebetter.com/dux/wp-content/uploads/sites/3/2015/06/e1.jpg"/></p><p>“这套系统能够分辨出哪些评论对用户来说是最有用的，而且它的这一能力还会日渐精进。”亚马逊发言人Julie Law在一次采访中说道。据称，此次改版自周五开始施行，一开始会比较不明显。新系统会给新评论、亚马逊认证买家评论和被赞最多的评论以更高权重。</p><p>至于亚马逊的5星打分体系，它在此前就只是对所有评分求个平均数，此次改版后，5分打分体系也会按照上述的权重进行改动，因此一样物品的分数可能是变动不居的。目前我们尚不清楚这套新系统什么时候在其他国家推出。</p><p>用户评论系统作为亚马逊网站的一个重要部分，已经存在了超过20年。它的文字评论和5分打分体系是买家的重要参照，可以让买家在入手前知晓产品的受欢迎程度和质量好坏。正由于这个评价系统太重要了，因此亚马逊对其做出任何改变都会非常谨慎。另外，四月份亚马逊刚刚起诉了一票刷分网站。</p><p>Law并未透露开发这套系统花了多长时间，但她表示亚马逊对此非常重视。“因为这能让人们做出更好的决策。”</p><p>比如，有时卖家会对产品做出一些小改变或者处理一些用户纠纷，在产品尚未在官方层面进行升级或更新的情况下，有了新系统，因为它是按时序排列，卖家就能将这些信息及时传达出去了。</p><p><br/></p>', 'admin', 1, 0, '', NULL, 0, 0, 0, '2020-05-27 15:39:02', '2020-05-27 15:38:23'),
(4, 4, 'Airbnb即将完成15亿美金融资，估值达240亿美元', '', 'Airbnb', '', '<p><img src="https://demo.themebetter.com/dux/wp-content/uploads/sites/3/2015/06/e2.jpg"/></p><p>FT报道称，房屋共享平台Airbnb即将完成一笔“巨额”15亿美元的融资，融资完成之后其估值将达到240亿美元。这笔融资将由投资过美团和呷哺呷哺的General Atlantic领投，高瓴资本和Tiger Global跟投，知情人士称两家跟投的规模也相当可观，而且这三家公司全部是Airbnb的新晋投资者。</p><p>其他的投资者包括来自英国的Baillie Gifford，美国的Wellington以及以前曾经投资过Airbnb的Fidelity和T Rowe Price两家基金。</p><p>一旦完成，这笔融资将匹配历史上最大的一些对于一家非上市公司的股权投资，而之前如此大手笔都来自于互联网公司——Facebook在2012年上市之前完成的最后一轮融资募集了15亿美元，Uber也正在寻求一笔15亿美元的融资（这将使得其估值达到500亿美元，之前消息称高瓴资本投资了10亿美元）。</p><p>这笔融资进一步体现了Airbnb的国际化扩张节奏，Airbnb非常看好亚洲市场快速增长的需求，因此也将这一地区作为扩张的重点。</p><p>根据本轮融资的数据可以分析出，融资之前Airbnb的估值已经达到240亿美元，远高于15个月之前其完成4.75亿美元融资时100亿美元的估值。</p><p>此前曾有消息称Airbnb正在开展一轮10亿美元的融资。</p><p><br/></p>', 'admin', 1, 0, '', NULL, 0, 0, 0, '2020-05-27 15:39:52', '2020-05-27 15:39:11'),
(5, 4, 'ORB潜水头盔 回收自己氧气在水下呼吸', '', '', '', '<p><span style="color: rgb(85, 85, 85); font-family: ">ORB是一个潜水头盔，采用现代技术称为“呼吸”回收你自己的氧气在水下呼吸。大多数的呼吸器都很笨重，戴上会感到很不舒服，但ORB轻便，易于移动，戴上它你会感觉相当轻松，毫无压力，可以大大增加潜水的体验度。更加贴心的是，它配备了内置的蓝牙，可以满足潜水者与其他潜水员随时针对水下环境进行沟通和互动。</span></p>', 'admin', 1, 0, '', NULL, 0, 0, 0, '2020-05-27 15:42:16', '2020-05-27 15:39:54'),
(6, 1, '饿了么融资6.3亿美元被指造假 实际不足4亿美元', '', '饿了么,融资', '', '<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; text-indent: 30px; color: rgb(85, 85, 85); font-family: ">网易科技讯 9月6日消息，外卖订餐平台饿了么本月4日宣布其获得一笔6.3亿美元的新一轮融资，并号称是全球外卖平台金额最高的一笔融资，使得其市值大涨。然而据外媒VentureBeat报道，相关知情人士透露，饿了么实际融资总额少于4亿美元，远低于其对外宣称的6.3亿美元。</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; text-indent: 30px; color: rgb(85, 85, 85); font-family: ">某著名风险投资公司匿名知情人士表示：“‘饿了么’实际估值为15亿美元。虽然还是一只‘独角兽’，但夸张的是，该公司向外宣称的估值30亿美元是实际的2倍……而且，公司的总融资额低于4亿美元。”</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; text-indent: 30px; color: rgb(85, 85, 85); font-family: ">对此，“饿了么”向媒体表示：“这个数字（6.3亿美元）是正确的，那是个谣言。”</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; text-indent: 30px; color: rgb(85, 85, 85); font-family: ">在知情人士看来，“饿了么”的O2O商业模式是“发疯似的”烧钱，而该公司其实已经“捉襟见肘”了。</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; text-indent: 30px; color: rgb(85, 85, 85); font-family: ">报道还指出，膨胀的数字在国内的融资轮中并不少见，此问题在业内也是人尽皆知。外界之所以对此了解甚少，是因为似乎很少见到这些公司会因此而酿成什么严重后果。创业孵化项目Chinaaccelerator总经理William Bao Bean表示，通过夸大估值总额来吓唬对手，这是“中国式的心理战”。</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; text-indent: 30px; color: rgb(85, 85, 85); font-family: ">“饿了么”的投资方红杉资本和经纬创投尚未回应此消息的置评请求。</p><p><br/></p>', 'admin', 1, 0, '', NULL, 0, 0, 0, '2020-06-05 14:39:30', '2020-06-05 14:39:09'),
(7, 1, '辛苦创业赚的钱不受银行待见，于是我们做了“企业活期宝”', '', '', '', '<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; text-indent: 30px; color: rgb(85, 85, 85); font-family: &quot;Microsoft Yahei&quot;; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);">写下这个标题的时候，我是很心酸的。每天和创业者打交道让我深切地感受到创业的艰难和创业者们时时刻刻都在经历的焦虑。很多人只看到“创业”这两个字带来的光环，却不知道创业者背后付出的艰辛。最令人难过的是，很多大型企业轻而易举就能获得的服务，对于创业者来说都是天方夜谭，比如企业现金管理。</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; text-indent: 30px; color: rgb(85, 85, 85); font-family: &quot;Microsoft Yahei&quot;; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);">连续创业者刘勇告诉36氪，他们之前创办的公司盈利之后账户上有了很多现金，于是他们希望银行能够帮助他们管理这些钱，产生更多收益。然而在和银行打交道的过程中，刘勇发现银行不仅手续繁琐、效率低、服务差，而且不对资金额度小于1000万的企业提供专门的客户经理服务。很多银行还利用信息不对称甚至小恩小惠来诱导企业把钱存在利息只有0.35%的活期账户里，方便银行赚取利差。</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; text-indent: 30px; color: rgb(85, 85, 85); font-family: &quot;Microsoft Yahei&quot;; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);">在余额宝问世之后，刘勇和他的创业伙伴杨祥吉和李洋发现余额宝对接的货币基金产品既有活期般的流动性和安全性，又有活期存款10倍的收益，但是余额宝只针对个人用户，企业不能使用。当时市场上没有像余额宝一样使用方便并且针对企业用户的理财产品，刘勇就希望阿里能尽快推出一款企业版的余额宝，可却迟迟没有动静：</p><blockquote style="box-sizing: border-box; padding: 15px 20px; margin: 30px; border-left: 5px solid rgb(238, 238, 238); color: rgb(153, 153, 153); font-family: &quot;Microsoft Yahei&quot;; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);"><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; overflow-wrap: break-word; padding: 0px; text-indent: 30px;">“阿里巴巴是最适合做企业理财服务的公司，我们一直希望阿里来做这件事情，但阿里不知道什么原因一直不做。”</p></blockquote><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; text-indent: 30px; color: rgb(85, 85, 85); font-family: &quot;Microsoft Yahei&quot;; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);">体会到创业公司理财的困难和被动等待阿里推出企业版余额宝的无望，这三个连续创业者决定做互联网创客最擅长的事儿：做个App解决自己的问题。“企业活期宝”就这样诞生了。</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; text-indent: 30px; color: rgb(85, 85, 85); font-family: &quot;Microsoft Yahei&quot;; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);"><img class="alignnone size-full wp-image-68" src="http://demo.themebetter.com/dux/wp-content/uploads/sites/3/2015/06/24.jpg" alt="2" width="640" height="287"/><br/>“企业活期宝”让公司能够拍照开户，对接汇添富货币基金，获得活期存款10倍的收益率和近似的流动性（T+1）。另外，“企业活期宝”还针对创业公司设计了能让创始人和投资人都可以查看一个或多个公司理财情况的功能。</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; text-indent: 30px; color: rgb(85, 85, 85); font-family: &quot;Microsoft Yahei&quot;; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);">据刘勇介绍，团队刚做出“企业活期宝”时只是想自己使用，但是很多创业者朋友听说后都要求试用产品。现在，App刚刚试运营2个月时间还处于Beta版本，就已经有了E代驾、荔枝FM、百词斩、天天投、51信托等10多家企业用户，管理资金规模将近2亿元。“企业活期宝”已经在今天正式登陆各大iOS和安卓应用商店。</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; text-indent: 30px; color: rgb(85, 85, 85); font-family: &quot;Microsoft Yahei&quot;; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);">据中国人民银行统计，2015年5月中国非金融类企业的活期存款规模约为14万亿元，而这些活期存款很大一部分都有资产管理的需求，但目前市场上并没有简单易用的产品来帮助企业管理这些现金。对于创业公司来说，账户上的现金如果能产生更多收益也许意味着公司可以多为员工提供一些福利甚至多招一些人。在“大众创业、万众创新”的大背景下，针对创业公司的企业服务是一个增量市场，相信很快会出现更多玩家。</p><p><br/></p>', 'admin', 1, 0, '', NULL, 0, 0, 0, '2020-06-05 14:39:57', '2020-06-05 14:39:31'),
(8, 1, '给前端开发者的5点建议', '', '前端', '', '<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: ">最近接触了很多前端的小伙伴，和他们谈了很多职业发展的问题，大部分是做了一到三年的前端新手。</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: ">在交流中发现了一个很有意思的现象，同样是入门不足三年，有部分人觉得前端很有前途，甚至有人年薪已经30W以上，但也有部分人觉得前端薪资不高，技术体系庞杂，迭代速度飞快，苦于学习各种不断更新的技术和框架，心神俱疲。</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: "><span style="box-sizing: border-box; font-weight: 700;">同样是前端工程师，技术体系是相同的，工作年限也是相近的，为什么差别这么大？</span>我在前端领域摸爬滚打也有五年了，如何跟上前端技术飞速更新的步伐，我认为学习方法一定要找对，抓住学习的重点才能事半功倍。<span style="box-sizing: border-box; font-weight: 700;">我总结了几个学习中要注意的点，和各位技术水平卡在瓶颈，苦恼于怎么提高的年轻工程师们分享。</span></p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: ">&nbsp;</p><h2 style="box-sizing: border-box; font-family: "><span style="box-sizing: border-box;">第一点 夯实基础</span></h2><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: ">基础一定要掌握牢固，基础知识一问三不知，就是贻笑大方。css，js基础知识一定要掌握得很熟练。</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: ">到什么程度可以称为熟练？你能使用css实现斑马条纹背景，毛玻璃效果吗？能给图片实现滤镜效果，能实现所有自适应布局效果吗？原型，原型链，闭包是实现设计模式的必备知识，你真的弄懂了吗？闭包导致内存泄漏的原因是什么，你弄明白了吗？ajax跨域的解决方案你可以说几种？9102年了，你还是只告诉我jsonp吗？http协议有了解过吗？</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: ">现在是9102年了，这些问题老掉牙了。可是我要告诉你的是，掌握好这些老掉牙的基础，就是很重要。<span style="box-sizing: border-box; font-weight: 700;">上层的技术可以变更的很快，基础变动很慢，投入时间学好基础，性价比很高。</span></p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: ">&nbsp;</p><h2 style="box-sizing: border-box; font-family: "><span style="box-sizing: border-box;">第二点 深究原理</span></h2><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: ">Angular，React,Vue框架和脚手架的普及，越来越多的前端工程师浮于表面，调用框架的API完成任务就完事。要成为一名优秀的前端，绝不能成为单纯的”API调用工程师”，一定要掌握框架背后的原理性知识。</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: ">Virtual DOM diff算法，双向绑定原理等等框架背后的机制都值得我们去学习。<span style="box-sizing: border-box; font-weight: 700;">框架API可以更新很快，而他们背后的原理都是相似的，学好原理既可以让我们对框架底层了解更深入，又可以使我们迅速掌握不断更新的框架表层。只会用框架永远也成不了大神。</span></p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: ">&nbsp;</p><h2 style="box-sizing: border-box; font-family: "><span style="box-sizing: border-box;">第三点 注意细节</span></h2><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: ">“代码能用就行”的认识往往是初级程序员的通病。<span style="box-sizing: border-box; font-weight: 700;">作为有在技术道路上有理想的工程师，一定要对自己的代码严格要求，精益求精。</span></p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: ">比如HTML一定要注意语义化以方便SEO优化，该用</p><section>，</section><p></p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: ">“代码千万行，注释第一行。命名不规范，同事两行泪。“一首流行诗，饱含了多少程序员的血与泪。</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: ">&nbsp;</p><h2 style="box-sizing: border-box; font-family: "><span style="box-sizing: border-box;">第四点 登高见远</span></h2><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: ">前端经历了这么多年的飞速发展，早已成为浩瀚的大海。如果闷着头独自钻研苦学，那无疑是很慢的。</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: "><img class="alignnone size-full wp-image-6870" src="/public/uploads/images/20200605/1591346637215244.png" alt="" width="1082" height="288"/></p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: ">技能图谱</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: ">如果我们直接去跟随大神学习，那将会使我们快速成长。github上有很多优秀的前端项目，仔细研读这些项目的代码，在commit记录中查看编程思想和逻辑的进化过程，就是一场与大神直接的面对面交流，是一场绝妙的学习之旅。</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: ">&nbsp;</p><h2 style="box-sizing: border-box; font-family: "><span style="box-sizing: border-box;">第五点 福利分享</span></h2><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: ">再回到开头举得例子，同样的工作年限，到后来却是不同的发展路径，每个人的学习习惯很重要。愿意去突破自己是一回事，知道怎么才能更好的帮助自己是另一回事。<span style="box-sizing: border-box; font-weight: 700;">推荐网易云课堂的前端进阶免费直播课，由网易资深前端工程师每天晚上8点直播2小时，深度剖析JavaScript、分析实战经验、面试技巧。</span></p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: ">下面是4月8日-4月14日每天的直播主题和大纲，都是一些干货分享并且不收费，建议想进阶的同学坚持学习。扫码添加云课堂助教微信（weizhuanye042）就可以免费听这个直播，希望各位在技术之路上能有所收获。</p><p><br/></p>', 'admin', 1, 0, '', NULL, 0, 0, 0, '2020-06-05 16:44:00', '2020-06-05 16:43:30'),
(9, 3, 'Windows node版本管理器–nvm', '', '', '', '<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: ">众所周知，node版本众多，但是由于项目需要或其他原因我们需要切换node版本，这个时候就需要node版本管理器啦。目前比较流行的两个是‘n’和‘nvm’（ps：试了‘n’，未安装成功，查了一下据说不支持window），所以改用nvm了，所以就介绍这个了。</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: ">&nbsp; &nbsp; NVM for Windows请戳–&gt;<a href="https://github.com/coreybutler/nvm-windows" style="box-sizing: border-box; background: 0px 0px; color: rgb(69, 182, 247); transition: color 0.25s ease 0s, background-color 0.25s ease 0s;">nvm-windows</a>，需要注意的是安装前需要卸载现有的nodej.s和npm安装位置。</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: "><span style="box-sizing: border-box; font-weight: 700;">&nbsp; &nbsp; 常用命令：</span></p><pre class="prettyprint" style="box-sizing: border-box; overflow: auto; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 12px; line-height: 20px; font-family: ">&nbsp;nvm&nbsp;list&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/*列出node.js列表*/\r\n&nbsp;nvm&nbsp;on&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/*启用node.js版本管理*/\r\n&nbsp;nvm&nbsp;off&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/*禁用node.js版本管理（不会卸载任何东西）*/\r\n&nbsp;nvm&nbsp;use&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/*切换到使用指定的版本*/\r\n&nbsp;nvm&nbsp;version&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/*显示当前正在运行的NVM&nbsp;for&nbsp;Windows版本*/</pre><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: ">&nbsp; &nbsp; 这里只列举了几个常用命令，更多命令见<a href="https://github.com/coreybutler/nvm-windows" style="box-sizing: border-box; background: 0px 0px; color: rgb(69, 182, 247); transition: color 0.25s ease 0s, background-color 0.25s ease 0s;">nvm-windows</a>。</p><p><br/></p>', 'admin', 1, 0, '', NULL, 0, 0, 0, '2020-06-05 16:44:30', '2020-06-05 16:44:01'),
(10, 1, '阿里苦逼前端发活动数据造假感慨，想说：不是谁的错', '', '阿里,前端', '', '<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: ">知乎上看到阿里实习生对待一次活动点赞数据造假的感慨，很多网友也说出了他们的心声，有人说这很常见，有人说我也干过，有人说换做是我也就妥协了，也有人说你Y该匿个名，对于这些评论我们不能做出好差之分，每个人处的立场不一样，更重要的是每个人的出发点不一样。</p><blockquote style="box-sizing: border-box; padding: 15px 20px; margin: 30px; border-left: 5px solid rgb(238, 238, 238); color: rgb(153, 153, 153); font-family: "><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; overflow-wrap: break-word; padding: 0px;">七月份在阿里实习，职位前端工程师。做一个手机网页抽奖游戏。有个预热页面，页面上会有个大大的点赞按钮，并且会展示点赞数量。结果产品那边直接让我用js生成点赞数据。也就是点赞数量是完全前端伪造的。我当时很震惊，争取了一下说能不能做成真的啊。其实也不是很复杂啊。最终人微言轻。还是做了一个虚假的数据。</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; overflow-wrap: break-word; padding: 0px;">为此我还研究了很久，怎样伪造数据会让用户感觉比较真实。比如伪造的数据不能是随机出现的吧？要不早上是50000赞，下午成了3000赞就会有问题。解决办法是按时间去不断增加点赞的数量。而且增加的量还不能是平均的。要不每一秒增加一个也太假了。需要随机的增加。等等，最后效果还是不错的。</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; overflow-wrap: break-word; padding: 0px;">当时刚到这么著名的一家公司实习。满怀希望。结果开始就做这种事情。然后当时实习生天天晚上要写日报，写完会发给整个部门。那时带我的师兄说日报要写真实感受，不要应付。我就说，好，那就写下真实感受吧。然后在日报里写了这件事情。最后写道：大公司搞活动原来也好糊弄人。</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; overflow-wrap: break-word; padding: 0px;">结果第二天我师兄就找我谈话，当然我师兄还是好意的，希望我不要这么固执。和我师兄争论了好久。后来我还是坚持我的观点：你们要实现这样的功能，我可以给你们完成，但是不代表我认同这种做法。</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; overflow-wrap: break-word; padding: 0px;">更加气人的是，点赞功能是假的，但是用户去点赞的时候，居然会跳转到客户端下载界面。我当时完全无法理解。有用户去给你点赞，你不千恩万谢他居然会愿意给你点赞。结果直接跳转到了你的客户端下载界面。你几个意思啊。。。当然这个功能我也做了。后来又和部门领导们委婉聊起这些事情。大家都觉得很无所谓。本身阿里就是一家以运营为主的公司，产品经理的活大多也是运营兼职。他们不会在乎产品是不是合理，而是更加关注我的运营效果是否达到？比如，我搞个抢红包活动，我要实现多少新用户注册，多少客户端下载。这是最后的评价标准。其他的，至于这个产品好坏，过几天就会下线。谁也不会在意的。</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; overflow-wrap: break-word; padding: 0px;">后来觉得这么搞下去，我真的受不了了。恩，然后就没有然后了。</p></blockquote><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: "><span style="box-sizing: border-box; color: rgb(136, 136, 136);">Link To：<a href="http://www.zhihu.com/question/25951778" target="_blank" style="box-sizing: border-box; background: 0px 0px; color: rgb(69, 182, 247); transition: color 0.25s ease 0s, background-color 0.25s ease 0s;"><span style="box-sizing: border-box; color: rgb(136, 136, 136);">知乎原文</span></a></span></p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: ">感谢作者说出了自己的想法，虽然真实性无从考证，但我相信这是真的，在我服务的客户中有这样的要求，说说我的观点：</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: ">都是技术男，如果你想在所在团队得到技术上很大程度上的提高，而恰好你的团队有很多大牛能给你指引和帮助，那么吐槽这许多是错误的。这是一件小事，小到几下就能解决的事儿，不应该有如此牢骚，尤其是在一次过眼的活动中，要知道各种活动都是为了更大程度上成交或利益产出，如果造个假能让这次活动达到预期目标，为何不做。运营注重结果是必然，前端被产品牵着走是必然，产品做的再好必然是为运营结果服务。说白点，你的技术在服务活动，而活动是为了服务团队乃至公司利益，你的技术服务对象最终是你自己，除非有能力掌控这一切。</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: ">其实，应该有转折，就是团队人员的友情相告，告诉你这样做能达到很好的效果，然后这件事也就不是个事儿了。</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: ">我们都不愿意去造假，是因我们都有真实做事的心态，尤其在刚工作的时候，还有各种与团队融合的细腻问题。</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: ">万事都有本质，这件事的本质是活动需要达到预期效果，不是个人的价值观，更不是造假。</p><p><br/></p>', 'admin', 1, 0, '/public/static/uploads/20200629/c424071e7dd2c233b8a13b53ffcbda9b.jpg', NULL, 0, 0, 0, '2020-06-05 16:45:30', '2020-06-05 16:44:48'),
(11, 4, '细节思考交互设计之浮动条', '', '设计', '', '<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: &quot;Microsoft Yahei&quot;; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);"><img class="size-full wp-image-5158 aligncenter" alt="1" src="/public/uploads/images/20200605/1591346864146437.jpg" width="600" height="379"/></p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: &quot;Microsoft Yahei&quot;; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);">-顾名思义，浮动条是在页面沿一定轨迹浮动的表现形式。</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: &quot;Microsoft Yahei&quot;; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);">不再固定在某一指定位置，而是随鼠标拖动而动，巧妙的设计会使得在不妨碍网友浏览的同时，满足其增加曝光率的需求。其特殊的表现形式与传统的形式相比更能聚集网络访客的眼球，使得其影响力更深三尺。但是过度的曝光不加思考的一味所有页面都用浮动条或者叠加大量功能入口，有可能造成用户使用上的视觉干扰和产生厌烦的心理。</p><h2 style="box-sizing: border-box; font-family: &quot;Microsoft Yahei&quot;; line-height: 1.1; color: rgb(85, 85, 85); margin: 20px 0px; font-size: 18px; border-bottom: 1px solid rgb(238, 238, 238); padding-bottom: 10px; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);"><span style="box-sizing: border-box;">可用于浮动条上的功能主要有：</span></h2><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: &quot;Microsoft Yahei&quot;; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);"><span style="box-sizing: border-box; font-weight: 700;"></span>回到顶部、在线客服、用户反馈/调查问卷、分享</p><ol style="box-sizing: border-box; margin-bottom: 20px; margin-left: 50px; padding: 0px; list-style-position: initial; list-style-image: initial; color: rgb(85, 85, 85); font-family: &quot;Microsoft Yahei&quot;; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);" class=" list-paddingleft-2"><li><p>回到顶部可以帮助访客在浏览页面时，尤其是页面底部没有导航的网页，重新找到导航，或者重温一遍网页。主要用于页面比较长，需要回到顶部进行一些操作。</p></li><li><p>在线客服是基于网页的即时通讯工具,它不需要安装任何软件,只需要在浏览器窗口就可以进行实时交谈。常出现在用户在流程中比较容易产生疑问的页面。</p></li><li><p>用户反馈/调查问卷是想倾听用户对网站或业务的想法和期望，使用这些信息来改善最常使用的产品和服务，解决用户在使用中的问题，更优化的实现用户期望。用于新业务上线，改版，AB testing…</p></li><li><p>分享功能使浏览者可以方便的将网页分享到一系列SNS站点。通过分享按钮，网页将更容易被百度搜索引擎所发现，从而有机会带回更多的流量。同时也可以增加互动，拉近网民与网站的距离。常出现在活动页面，产品详情页，特色版块等。</p></li></ol><h2 style="box-sizing: border-box; font-family: &quot;Microsoft Yahei&quot;; line-height: 1.1; color: rgb(85, 85, 85); margin: 20px 0px; font-size: 18px; border-bottom: 1px solid rgb(238, 238, 238); padding-bottom: 10px; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);"><span style="box-sizing: border-box;">综合携程网站现状，我的建议是：</span></h2><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: &quot;Microsoft Yahei&quot;; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);">全站首页和机票、酒店、高铁频道首页都比较短，内容较密集。用户还在建立网站印象阶段。不建议放任何浮层。</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: &quot;Microsoft Yahei&quot;; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);">度假的首页及二级页面都比较长，且底部也无导航。建议增加“回到顶部”，可以帮助用户浏览。</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: &quot;Microsoft Yahei&quot;; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);">惠选、团购等携程的活动版块及特色产品。建议增加“分享按钮”，吸引用户，增加网站流量。</p><h2 style="box-sizing: border-box; font-family: &quot;Microsoft Yahei&quot;; line-height: 1.1; color: rgb(85, 85, 85); margin: 20px 0px; font-size: 18px; border-bottom: 1px solid rgb(238, 238, 238); padding-bottom: 10px; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);"><span style="box-sizing: border-box;">预订流程中各个功能的使用大致如下图：</span></h2><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: &quot;Microsoft Yahei&quot;; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);"><img class="alignnone size-full wp-image-5189" alt="float-2" src="/public/uploads/images/20200605/1591346865443442.jpg" width="873" height="402"/></p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: &quot;Microsoft Yahei&quot;; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);">目前网上的浮动视觉样式、位置并不统一，也没有任何的逻辑。看了一下其他的网站，也大多如此。</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: &quot;Microsoft Yahei&quot;; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);"><img class="alignnone size-full wp-image-5187" alt="float-3" src="/public/uploads/images/20200605/1591346865563501.jpg" width="644" height="415"/></p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: &quot;Microsoft Yahei&quot;; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);">我个人比较赞同的浮层设计是全站统一，局部变化。不要各个页面都杂乱无章，也不要完全一味的追求所有页面功能设计一模一样。</p><h2 style="box-sizing: border-box; font-family: &quot;Microsoft Yahei&quot;; line-height: 1.1; color: rgb(85, 85, 85); margin: 20px 0px; font-size: 18px; border-bottom: 1px solid rgb(238, 238, 238); padding-bottom: 10px; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);"><span style="box-sizing: border-box;">综合研究发现，我定义的浮层规则是：</span></h2><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: &quot;Microsoft Yahei&quot;; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);"><span style="box-sizing: border-box; font-weight: 700;">回到顶部</span></p><ul style="box-sizing: border-box; margin-bottom: 20px; margin-left: 50px; padding: 0px; list-style-position: initial; list-style-image: initial; color: rgb(85, 85, 85); font-family: &quot;Microsoft Yahei&quot;; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);" class=" list-paddingleft-2"><li><p>业务相关页面：当业务相关的版块页面长度超过两屏，则显示浮层。</p></li><li><p>流程相关页面：需要用户回到页首进行操作功能的，页面长度超过两屏的，显示浮层。</p></li></ul><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: &quot;Microsoft Yahei&quot;; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);"><span style="box-sizing: border-box; font-weight: 700;">在线客服</span></p><ul style="box-sizing: border-box; margin-bottom: 20px; margin-left: 50px; padding: 0px; list-style-position: initial; list-style-image: initial; color: rgb(85, 85, 85); font-family: &quot;Microsoft Yahei&quot;; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);" class=" list-paddingleft-2"><li><p>业务相关页面：当特色业务相关的版块上线时，用户需要培养习惯时，则显示。</p></li><li><p>流程相关页面：用户在操作过程中容易产生疑惑，错误的页面，显示。</p></li></ul><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: &quot;Microsoft Yahei&quot;; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);"><span style="box-sizing: border-box; font-weight: 700;">用户反馈/调查问卷</span></p><ul style="box-sizing: border-box; margin-bottom: 20px; margin-left: 50px; padding: 0px; list-style-position: initial; list-style-image: initial; color: rgb(85, 85, 85); font-family: &quot;Microsoft Yahei&quot;; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);" class=" list-paddingleft-2"><li><p>业务相关页面：当特色业务相关的版块上线、改版时，则显示。</p></li><li><p>流程相关页面：需要用户进行复杂操作过程的页面，显示。</p></li></ul><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: &quot;Microsoft Yahei&quot;; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);"><span style="box-sizing: border-box; font-weight: 700;">分享</span></p><ul style="box-sizing: border-box; margin-bottom: 20px; margin-left: 50px; padding: 0px; list-style-position: initial; list-style-image: initial; color: rgb(85, 85, 85); font-family: &quot;Microsoft Yahei&quot;; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);" class=" list-paddingleft-2"><li><p>业务相关页面：特色业务版块、具体的产品、网站促销活动时，则显示。</p></li><li><p>流程相关页面：不需要。</p></li></ul><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: &quot;Microsoft Yahei&quot;; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);"><span style="box-sizing: border-box; font-weight: 700;">补充规则（也是我认为最重要的一点）：</span></p><ul style="box-sizing: border-box; margin-bottom: 20px; margin-left: 50px; padding: 0px; list-style-position: initial; list-style-image: initial; color: rgb(85, 85, 85); font-family: &quot;Microsoft Yahei&quot;; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);" class=" list-paddingleft-2"><li><p>整个浮层功能不能影响用户的正常浏览习惯。</p></li></ul><p><br/></p>', 'admin', 1, 0, '', NULL, 0, 0, 0, '2020-06-05 16:47:53', '2020-06-05 16:47:27'),
(12, 4, '隐藏功能是彩蛋还是浪费', '', '', '', '<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: &quot;Microsoft Yahei&quot;; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;"><img class="alignnone size-full wp-image-5222" alt="2457331_184103799000" src="/public/uploads/images/20200605/1591346890331516.jpg" width="600" height="379"/></p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: &quot;Microsoft Yahei&quot;; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);"><a href="http://www.daqianduan.com/wp-content/uploads/2013/10/image1.jpg" style="box-sizing: border-box; background: 0px 0px; color: rgb(69, 182, 247); transition: color 0.25s ease 0s, background-color 0.25s ease 0s;"><img class=" wp-image-5134 alignleft" alt="image[1]" src="/public/uploads/images/20200605/1591346890103921.jpg" width="138" height="208"/></a>微信有一个隐藏功能，也许很多人不知道，就是在朋友圈中长按照相机icon可以直接输入文字。</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: &quot;Microsoft Yahei&quot;; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);">曾经我寻找这个功能无果，只好每篇文章发个自己相片文件夹中的照片。突然又一天居然按出来这个功能，无比高兴，总觉得自己使用该软件比别人更熟练一筹。于是我就开始思考，隐藏功能对于用户来说究竟是彩蛋还是毫无用处的功能浪费。</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: &quot;Microsoft Yahei&quot;; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);">苹果手机操作系统就有非常多的隐藏功能，比如摇一摇手机，就会出现撤销的操作提醒又比如在短信界面，用手从右往左滑动，可以查看短信的发生时间。苹果常常发明很多隐藏功能为了使用户使用一些手势来快速操作节省硬件按键的使用率。用户不仅喜欢使用隐藏功能，而且还乐此不疲的发现研究新的隐藏功能。</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: &quot;Microsoft Yahei&quot;; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);">我深入思考，发现通常隐藏此类功能大多是附属类功能，或者该功能可以通过其他使用方法被替代，他的存在与否不会影响用户主要的使用。 那么我们再重新看微信的发布文章功能，虽然这个功能是每个用户都会希望使用的功能但是他确实是可以被替代，我们可以发布图文的方式继续使用。事实也证明用户的超强适应性，用户制作了各式各样的无图的图片来应对文章中不知该放什么样图片的尴尬。但是长按编辑文章的功能杯作为口口相传的方式被一些用户追捧。虽然这个功能的隐藏造成了某些用户的使用费力，但是从另外一些角度来看却又达到了一些意想不到的效果。 但是新版上线后，微信团队增加了一个该功能可能撤销的通告，那如果真这么做，我认为无疑是让他这么长时间以来的这个功能变成了浪费。</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: &quot;Microsoft Yahei&quot;; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);">其实用户不一定会根据设计师或者产品经理规划的流程来使用网站，有时候一些隐藏的辅助功能或者一些隐藏替代类的功能会给用户一些惊喜，有寻找到彩蛋的感觉，但是无论如何不是所有的功能都可以做成隐藏类的，主流的功能做成隐藏类还是必须慎重再慎重。</p><p><br/></p>', 'admin', 1, 0, '', NULL, 0, 0, 0, '2020-06-05 16:48:12', '2020-06-05 16:47:55'),
(13, 4, '2011年Web设计最新潮流', '', '设计', '', '<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: ">在设计和编程之间只有薄薄的一线，当我们进入新的十年时，这条线变得越来越模糊。在<a title="给网页设计师的30个HTML5学习资源" href="http://www.daqianduan.com/web-design-30-html5/" style="box-sizing: border-box; background: 0px 0px; color: rgb(69, 182, 247); transition: color 0.25s ease 0s, background-color 0.25s ease 0s;">Photoshop</a>上绘制漂亮的模型就够了吗？5年以前也许如此。在今天，普通的网络用户要求的更多。所有的东西都很漂亮，但没有实质内容，过段时间人们就会厌烦。</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: ">如果你唯一的目标是用你漂亮的设计影响圈内其他设计师，你会发现你很快就落伍了。2011年不关心漂亮，而是关心功能。新的一年甚至十年的趋势是交互设计、粘度和虚拟现实。</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: ">2011年你会如何设计呢？设计师的最终目标是留住用户，而不是让人炫目。所有得到惊讶声和赞叹声的设计师都很容易被忘记。高超的设计师可以创造出一种环境，吸引并迷住用户到不想点击”返回”按钮的地步。几个元素汇聚在一起，组成一个奇妙的幻境：和谐的色彩主题、直观的设计、易用的信息和快速的反应。另外，永远不要低估简洁的力量。当然，情况一直如此，但在2011年，你将不再仅针对电脑桌面和笔记本，还要为智能手机、上网本、Tablet等等设计。你准备好了吗？</p><h3 style="box-sizing: border-box; font-family: "><span style="box-sizing: border-box;">1、更多的CSS 3+HTML 5</span></h3><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: ">多么令人满意啊！在过去几年里，<a title="CSS3仿Javascript冒泡效果 简单易用" href="http://www.daqianduan.com/css3-tip/" style="box-sizing: border-box; background: 0px 0px; color: rgb(69, 182, 247); transition: color 0.25s ease 0s, background-color 0.25s ease 0s;">CSS3</a>和<a title="Html5新标签解释及用法" href="http://www.daqianduan.com/html5-something/" style="box-sizing: border-box; background: 0px 0px; color: rgb(69, 182, 247); transition: color 0.25s ease 0s, background-color 0.25s ease 0s;">HTML5</a>只出现在网页设计那遥远的地平线上。但现在，在2011年，我们看到了它的爆发。设计师们终于开始让Flash走开。你可能感觉到，Flash和一些对你当前和潜在用户有用的最新最热技术，配合的不是很好。在2011年，你会慢慢远离Flash，拥抱被称为HTML 5的魔术。</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: ">现在已经显示，Flash和HTML 5是不相等的对手。在2011年两者都有大量的应用空间。问题是设计师们在2010年（和之前）滥用了Flash。举一个例子，很少整个网站由Flash组成，特别是这些日子。HTML 5减轻了Flash的一些负担。不过，HTML 5还不能完全取代我们由Flash实现的那些非凡的设计元素。</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: ">也许更让人兴奋的是，CSS 3在今年可以投入使用了。移开Photoshop（<a title="Flash遥遥领先HTML5" href="http://www.daqianduan.com/flash-html5-3/" style="box-sizing: border-box; background: 0px 0px; color: rgb(69, 182, 247); transition: color 0.25s ease 0s, background-color 0.25s ease 0s;">Adobe</a>还是不能休息），CSS 3可以更快实现文本阴影、圆角边框和背景透明。如果你还没有开始，现在就开始钻研了解CSS 3和HTML 5吧。</p><h3 style="box-sizing: border-box; font-family: "><span style="box-sizing: border-box;">2、简洁的配色方案</span></h3><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: ">简洁。没有什么比在安静的背景上显示清晰的消息更安静了。安静可以被解读为几种不同的方式。忘掉黑白和灰度阴影，想想绿色、黄色或甚至红色作为你的主色调。不过，限制你的调色板只有两或三种颜色，试试各种颜色不同的灰度。用少量颜色表现信息是非常了不起的。观察一下：</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: "><img class="alignnone size-full wp-image-3224" title="2011" src="http://www.daqianduan.com/wp-content/uploads/2011/02/2011.jpg" alt="" width="590" height="377"/></p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: ">绿色阴影创造了这个Twitter可视的工具。边注：这个网站是用XHTML/CSS和Javascript创建的。</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: "><img class="alignnone size-full wp-image-3225" title="20111" src="http://www.daqianduan.com/wp-content/uploads/2011/02/20111.jpg" alt="" width="590" height="414"/></p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: ">如果做的不好，红色很容易产生冲突。这个网站用高对比的易读文字克服了红色本来的特性。</p><h3 style="box-sizing: border-box; font-family: "><span style="box-sizing: border-box;">3、适用于手机</span></h3><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: ">智能手机、iPad、上网本，哦天哪！一个令人眼花缭乱的手机产量在2011年提供给消费者。这意味着你的网页设计必须适应多种窗口。</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: ">创建一个适用于手机的网站不是简单的从你的设计中去掉那些花哨的东西。这只会产生一个空虚无个性的设计。虽然不太可能，但从你的原始设计中去掉那些魔法，变成简单陈述你的品牌，这非常困难。幸运的是，技术正在快速解决这些麻烦。</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: ">借助CSS3的帮助，主要是media queries，手机网页设计有一个大的飞跃（以后详说）。最重要的一个进步是，你可以设计一个整站并允许你的编码遵从用户的可视区域。</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: ">设计一个专门的手机网站可能很有诱惑力，但这可能不再能满足你的观众了。越来越多的手机网站包含了访问原始网站的选项。如果你没有提供这一选项或你的原始网站没有为手机标准优化好，你就没有为2011年做好准备。预测显示，智能手机今年的销量将超过个人电脑。准备好你的设计，满足这一需求。</p><h3 style="box-sizing: border-box; font-family: "><span style="box-sizing: border-box;">4、视差滚动（Parallax Scrolling）</span></h3><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: ">视差滚动：不是指老早的电子游戏。如上所述，2011年这一热门设计趋势是创造一种深度感。还有什么方法比视差滚动更好吗？视差可以影响用户产生一种三维空间的错觉。它可以由一些简单的CSS技巧或jQuery插件如Spritely的帮助实现。视差滚动可以作为设计中最重要的次要元素，例如，在页头、页脚，或背景。把它放在导航可能会迷惑你的访问者。</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: "><img class="alignnone size-full wp-image-3226" title="20112" src="http://www.daqianduan.com/wp-content/uploads/2011/02/20112.jpg" alt="" width="590" height="401"/></p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: ">Old Pulteney Row to the Pole网站在背景中使用了由上至下的视差滚动效果。这增加了一种很微妙的深度和许多乐趣。</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: "><img class="alignnone size-full wp-image-3227" title="20113" src="http://www.daqianduan.com/wp-content/uploads/2011/02/20113.jpg" alt="" width="399" height="454"/></p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: ">只由CSS和HTML创建的视差滚动，由Roman Cortes创建。</p><h3 style="box-sizing: border-box; font-family: "><span style="box-sizing: border-box;">5、为触摸屏设计，而不是鼠标</span></h3><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: ">技术已经越来越变得触觉化。可用性正从抽象转向具体。这意味着，不是操作你的鼠标去远程连接，你的目的地就在你的手指尖。Tablet、大多数智能手机和一些台式机都使用触摸屏。你的设计可以容纳用手指导航吗？</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: ">你的多少设计是以鼠标为导向的？作为设计师，我们尊敬鼠标。当鼠标悬停的时候，我们的链接正在发亮。然而在触摸屏中没有悬停这回事。你的设计如何向访问者显示链接呢？下拉菜单怎么办呢？在触摸屏设计中这也是不行的。</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: ">同样的，访问者将如何细读你的网站呢？有争议的是，网站可能是为标准网页浏览器创建的，而在触摸屏中，水平滚动可能更适合。很好的适应这一情形的是杂志一样的布局，访问者几乎可以翻阅你的网站。</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: ">最后，考虑一下，将流动布局作为交互设计义务的一部分。在2011年，你不再应付屏幕分辨率的大小。访问者会从垂直的浏览方向改变到水平的浏览方向。你的设计必须是灵活的，能适应任何挑战，否则你将停留在2010年。</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: "><img class="alignnone size-full wp-image-3228" title="20114" src="http://www.daqianduan.com/wp-content/uploads/2011/02/20114.jpg" alt="" width="590" height="377"/></p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: ">婴儿在看iPad的魔术（版权属于Steve Paine，Flickr）。</p><h3 style="box-sizing: border-box; font-family: "><span style="box-sizing: border-box;">6、网页设计中的深度知觉</span></h3><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: ">不，我不是在说”我能在你的网站看到你的咖啡杯和键盘”那种两年以前的设计。深度知觉是指在网页设计中创造一种维度，让你的网站的某部分看起来更靠近浏览者。如果做的好，能让人想起一种虚拟的3D效果。还记得在看3D电影大片时的感觉吗？像阿凡达？毫不夸张的说，里面的元素简直要跳出屏幕了。</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: ">虽然3D技术还没有普及到网页设计，你仍然可以在设计中复制这种深度。</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: "><img class="alignnone size-full wp-image-3229" title="20115" src="http://www.daqianduan.com/wp-content/uploads/2011/02/20115.jpg" alt="" width="590" height="377"/></p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: ">这个好玩的网站提供了一个可旋转的3D地球，用良好的阴影和层次创造了一种深度。</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: "><img class="alignnone size-full wp-image-3230" title="20116" src="http://www.daqianduan.com/wp-content/uploads/2011/02/20116.jpg" alt="" width="590" height="377"/></p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: ">醒目，聪明，这个庆祝Jordan（不管是男人或鞋）的主题网站非常具有娱乐性。3D元素如此清晰简单，使人大吃一惊。</p><h3 style="box-sizing: border-box; font-family: "><span style="box-sizing: border-box;">7、大图背景</span></h3><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: ">大尺寸背景在2011年将会激增。这些图片会是高分辨率、并覆盖整个网站的。大照片可以瞬间抓住你的观众——他们无法不看到它并对它有一个印象。背景图片必须适应内容，只是简单放一张漂亮的图片而没有上下环境会破坏用户的体验。趋势表明，柔和的和轻微透明的背景不会盖住你的内容，而是与之协调一致。</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: "><img class="alignnone size-full wp-image-3231" title="20117" src="http://www.daqianduan.com/wp-content/uploads/2011/02/20117.jpg" alt="" width="590" height="377"/></p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: ">这个网站使用率一张高分辨率的照片，整个主色调是黄色的。</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: "><img class="alignnone size-full wp-image-3232" title="20118" src="http://www.daqianduan.com/wp-content/uploads/2011/02/20118.jpg" alt="" width="590" height="377"/></p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: ">这个网站在大尺寸背景上增加了一些好玩的动画。警告：自动播放的音乐。</p><h3 style="box-sizing: border-box; font-family: "><span style="box-sizing: border-box;">8、大胆的域名&amp;组合</span></h3><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: ">虽然严格意义上这不是网页设计的问题，还是期待看到更有创意的域名。一度令人垂涎的.com域名已经失去了许多吸引力——主要原因是你必须在注册域名时想一些别人没有想过的词语。2011年将会看到越来越多的企业不用.com而选择更稀奇古怪的域名如.me或.us。想想这种可能性，在还没有普及之前选好一个吧。</p><h3 style="box-sizing: border-box; font-family: "><span style="box-sizing: border-box;">9、QR：快速反应</span></h3><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: ">如果你在名片、杂志或其他地方看过那种弹出的方形条码，你可能已经知道这是一种2011年的热门趋势。融入到网页设计中会如何呢？令人惊讶的好，真的。</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: ">这种条码被称为QR，更短的快速反应。用你的照相手机给条码简单照张相，像变魔术一样，你的手机就会连接与条码有关联的网站。更美妙的事是你可以有无数多的方式使用它。在你的网站上放上你的QR，访问者就能更快的访问你的手机网站。你也通过在url放置与QR关联的代码，追踪你的访问者。当你在网站评论时，使用QR作为你的头像。</p><h3 style="box-sizing: border-box; font-family: "><span style="box-sizing: border-box;">10、缩略图设计</span></h3><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: ">不断进取的google已经向普通用户介绍了预览浏览。通过点击查看网站内容的日子已经过去了。今天，你只需点击那个放大镜并悬停（假设你没有用触摸屏），之后你就能奇妙的在另一端看看出现什么。</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: ">如果你的设计是基于Flash的，这肯定会是一个问题。预览不会显示你设计中的那些元素。</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: ">在2011年一般的互联网用户会更懂得上网，期待看到更多的人通过这些方式浏览。用缩略图判断一个网站实在是太有诱惑力了。</p><h3 style="box-sizing: border-box; font-family: "><span style="box-sizing: border-box;">11、粘度/生活流程</span></h3><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: ">最后，但不是最不重要的，是在网页设计中注重粘度。互联网本来是个荒凉的环境，我们通过在开放论坛上分享我们的生活使之更人性化。希望通过生活流程的形式看到更多隐私。个人博客和作品在2011年将会更明显的出现在Twitter的feed上（而不仅是Twitter页面上的一个链接）。人们会通过Foursquare让你知道他们每时每刻都去了哪里。实际上，希望通过某人的线上活动看到他专门的生活流程。2011年绝对会引出我们内心可怕的尾行者，毫无疑问。</p><p><br/></p>', 'admin', 1, 0, '/uploads/20200629/aa2a2e54e0b91c2c203a1eb28ead99be.jpg', NULL, 0, 0, 0, '2020-06-05 16:48:50', '2020-06-05 16:48:14'),
(14, 4, '创意广告：广告打在鸡蛋上', '', '', '', '<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: ">广告早已经无孔不入了，这都打到鸡蛋上了。</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: "><span style="box-sizing: border-box; font-weight: 700;">好处还是很明显的：</span></p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: ">1、流通量大，每天多少鸡蛋进出入超市和菜场啊;</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: ">2、目标受众明显，负责日常采购的中年女性，具有家庭购买的决策权;</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: ">3、打鸡蛋的时候，阅读广告的时候肯定会非常仔细，附带印上了有鸡蛋的保质日期就更有效了;</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: ">4、鸡蛋的时效性、大量性和经常采购性决定了广告投放的方式可以非常的灵活。</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: ">印制的方法倒是个问题，大概得看了一下，好像是用激光蚀刻在上面的，白鸡蛋显示的是暗色的字，褐色的鸡蛋上显示是亮色字。挺新鲜的广告形式，或许也是一个商机。：)江南春的分众传媒性质其实也是一样的，只不过投放的内容、形式有着很大的不同，市场也就会相差很大了。上次在西单看到有广告是用光投影到地上的，不过个人感觉这好像有点太霸道了。还有人在ebay上出售自己额头上的广告位，只是看到新闻，不知道卖得怎么样。</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: "><img class="size-full wp-image-3067 aligncenter" title="egg01" src="/public/uploads/images/20200605/1591346952824919.jpg" alt="" width="350" height="263"/></p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: "><img class="size-full wp-image-3068 aligncenter" title="egg02" src="/public/uploads/images/20200605/1591346953999843.jpg" alt="" width="350" height="263"/></p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: "><img class="size-full wp-image-3069 aligncenter" title="egg03" src="/public/uploads/images/20200605/1591346953335690.jpg" alt="" width="350" height="324"/></p><p><br/></p>', 'admin', 1, 0, '', NULL, 0, 0, 0, '2020-06-05 16:49:15', '2020-06-05 16:48:52');
INSERT INTO `os_article` (`id`, `cid`, `title`, `shorttitle`, `keywords`, `introduction`, `content`, `author`, `status`, `reading`, `thumb`, `photo`, `is_top`, `is_recommend`, `sort`, `create_time`, `publish_time`) VALUES
(15, 4, '设计师如何避免设计倦怠', '', '设计', '', '<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: "><a href="http://www.daqianduan.com/wp-content/uploads/2010/06/design01.jpg" style="box-sizing: border-box; background: 0px 0px; color: rgb(69, 182, 247); transition: color 0.25s ease 0s, background-color 0.25s ease 0s;"><img class="aligncenter size-full wp-image-1384" title="design01" src="/public/uploads/images/20200605/1591346992524041.jpg" alt="设计师如何避免设计倦怠" width="550" height="200"/></a></p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: ">在这个世界上，设计师的设计创新是激发未来设计的趋势。然而,它需要许多的尝试与错误，使设计者变得更接近打破平常的设计。设计师经常花费很多脑力思考他们的创造力，因此，他们的大脑需要好好的休息休息。</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: ">以下是一些方法来帮助设计师们避免设计倦怠和保持有创造性的心智！</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: "><span style="box-sizing: border-box; font-weight: 700;">如果你需要更多的技巧和灵感使你避免倦怠，这里或许你也想看看：</span></p><ul style="box-sizing: border-box; margin-bottom: 20px; margin-left: 50px; padding: 0px; list-style-position: initial; list-style-image: initial; color: rgb(85, 85, 85); font-family: " class=" list-paddingleft-2"><li><pre class="prettyprint" style="box-sizing: border-box; overflow: auto; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 12px; line-height: 20px; font-family: ">网页设计心理学</pre></li><li><pre class="prettyprint" style="box-sizing: border-box; overflow: auto; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 12px; line-height: 20px; font-family: ">设计师要会思考</pre></li><li><pre class="prettyprint" style="box-sizing: border-box; overflow: auto; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 12px; line-height: 20px; font-family: ">Web设计师如何应对客户要求</pre></li><li><pre class="prettyprint" style="box-sizing: border-box; overflow: auto; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 12px; line-height: 20px; font-family: ">网页设计10个小窍门</pre></li><li><pre class="prettyprint" style="box-sizing: border-box; overflow: auto; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 12px; line-height: 20px; font-family: ">网页设计中应用3D元素</pre></li></ul><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: "><span style="box-sizing: border-box; font-weight: 700;">请注意你的健康</span></p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: "><a href="http://www.daqianduan.com/wp-content/uploads/2010/06/design02.jpg" style="box-sizing: border-box; background: 0px 0px; color: rgb(69, 182, 247); transition: color 0.25s ease 0s, background-color 0.25s ease 0s;"><img class="aligncenter size-full wp-image-1385" title="design02" src="/public/uploads/images/20200605/1591346992120488.jpg" alt="设计师如何避免设计倦怠" width="550" height="200"/></a></p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: ">一个典型的设计师的生命可以基本上可以概述为：长时间坐在电脑前，睡眠不足，喝含糖饮料，最终走向崩溃。这已经是老生常谈了，饮食均衡将重振你的创新能力。</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: "><span style="box-sizing: border-box; font-weight: 700;">注意锻炼</span></p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: "><span style="box-sizing: border-box; font-weight: 700;"></span>锻炼给我们机会和足够的时间离开电脑，可以更好的替代清晨含咖啡因的饮料，你的能量可以促进血液循环。长时间坐在电脑前，阻止了你身体的正常循环的功能，从而抑制重要器官。</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: ">你的屁股有点麻木吗？站起来，在一个简短的步行街区、房子或办公室里走走。这时，你有充裕的时间来清理你的头脑，脑力得以良好的恢复。<br/><span style="box-sizing: border-box; font-weight: 700;">不要设计</span></p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: "><a href="http://www.daqianduan.com/wp-content/uploads/2010/06/design02.jpg" style="box-sizing: border-box; background: 0px 0px; color: rgb(69, 182, 247); transition: color 0.25s ease 0s, background-color 0.25s ease 0s;"></a><a href="http://www.daqianduan.com/wp-content/uploads/2010/06/design03.jpg" style="box-sizing: border-box; background: 0px 0px; color: rgb(69, 182, 247); transition: color 0.25s ease 0s, background-color 0.25s ease 0s;"><img class="aligncenter size-full wp-image-1386" title="design03" src="/public/uploads/images/20200605/1591346992560359.jpg" alt="设计师如何避免设计倦怠" width="550" height="200"/></a></p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: ">远离图片，远离设计！如果你是一个设计师，吃、喝、睡觉的时候都想着设计，我想你可能要命令你自己一天或者一星期远离设计。我知道这听起来有点难，但回报是非常值得的。</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: ">关掉你的创造性的大脑，暂时休息。只在早上打开电子邮件，看两则新闻，然后关闭电脑来享受这一天，自己一个人或者和所爱的人一起。每个人每周都应该至少休息一天脑力。</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: "><span style="box-sizing: border-box; font-weight: 700;">祝你好运!</span></p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: ">学习这些来避免设计倦怠对你的生活是很重要的。</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: ">这个领域前景非常好，而且还很累人，所以你需要感谢你所有的努力，更要照顾好自己。</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; color: rgb(85, 85, 85); font-family: ">英文原文：<a title="Permanent Link to Avoiding Design Burnout" href="http://sixrevisions.com/creativity/avoiding-design-burnout/" style="box-sizing: border-box; background: 0px 0px; color: rgb(69, 182, 247); transition: color 0.25s ease 0s, background-color 0.25s ease 0s;">Avoiding Design Burnout</a></p><p><br/></p>', 'admin', 1, 0, '', NULL, 0, 0, 0, '2020-06-05 16:49:54', '2020-06-05 16:49:16'),
(16, 5, '你是否希望大前端做服务器合租代管服务？', '', '前端', '主题做了有日子了，积累了不少用户，但很多都是酱油出身，玩不好服务器和各种环境配置', '<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; text-indent: 30px; color: rgb(85, 85, 85); font-family: ">主题做了有日子了，积累了不少用户，但很多都是酱油出身，玩不好服务器和各种环境配置。</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; text-indent: 30px; color: rgb(85, 85, 85); font-family: ">有人提出希望大前端能买一台或多台云服务器，然后供大前端用户使用，由大前端管理。乍一看，麻烦事儿很多，但既然入了这行，就得有负责任的心态，试想一下，你个完全不懂怎么玩服务器的人去折腾，没有多大意义；更何况大家需要更多关注网站的内容和推广，而非这种基础实务，没必要花时间去学习。</p><h2 style="box-sizing: border-box; font-family: ">我的想法：</h2><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; text-indent: 30px; color: rgb(85, 85, 85); font-family: ">先搞一台阿里云服务器，配置先不说，但需要用户的投票参与，<span style="box-sizing: border-box; font-weight: 700;">如果你希望有此合作，请直接留言，开头用“我参与！”用以表示参与此服务</span>。</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; text-indent: 30px; color: rgb(85, 85, 85); font-family: ">这只是一个不错的想法，等量配置的话按人头或站点数来计算，价格就是阿里云的价格，很透明。</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; text-indent: 30px; color: rgb(85, 85, 85); font-family: ">11月1日后我们看情况决定是否需要此服务，如果你有较好的想法，尽管拿出来。</p><p><br/></p>', 'admin', 1, 0, '', NULL, 0, 0, 0, '2020-06-08 08:53:24', '2020-06-08 08:53:01'),
(17, 5, '大前端D8主题等其他主题支持wordpress 3.8版本', '', '前端', '看道wordpress 3.8版本出来，很激动，特别喜欢平面化的设计风格，但是使用之后，感觉不怎么优秀，风格设计的不到位。', '<p>看道wordpress 3.8版本出来，很激动，特别喜欢平面化的设计风格，但是使用之后，感觉不怎么优秀，风格设计的不到位。</p><p><br/></p><p>经过多番测试，D8主题等其他大前端主题均支持wordpress 3.8版本，大家放心使用吧。建议发布稳定版本后再更新，因为3.8版本没有特别的更新什么，只是改了UI设计方面，所以不用着急。如果等不及，直接更新也是可以的，3.7版本的语言包还能正常使用。</p><p><br/></p><p>wordpress 3.8</p><p><br/></p><p>这段时间在整理很多客户返回的问题和建议，感觉一个人的战斗有些累，为了给主题用户带来更好的体验，大前端决定去个人化，吸纳优秀主题人士共筑美好未来，所以过段时间后各种相关服务均会翻倍升级。在这里还是要向对个别用户服务不到位的情况致歉，我们一直在努力做的更好。当然，如果你觉得可以做些什么，可以加入进来，haozi@daqianduan.com。</p><p><br/></p><p>除服务外，大前端决定在主题更新上加快进程，D8主题暂时定为两周一个更新，之前的主题均会逐步更新升级，可能会缓慢，但绝不是放弃，所以如果你还有什么好的建议，尽管提给我们。</p><p><br/></p>', 'admin', 1, 0, '', NULL, 0, 0, 0, '2020-06-08 08:54:19', '2020-06-08 08:53:26'),
(18, 5, '大前端和阿里百秀背后的团队', '', '阿里,前端', '大前端，最初是一个专注前端开发的垂直博客，现已发展成为WordPress中文主题开发商，业务多半是围绕WordPress而来，有网站定制的、有网站优化的等等。之前一直是我在独立维护，积累了不少主题开发和前端开发的成熟经验。', '<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; text-indent: 30px; color: rgb(85, 85, 85); font-family: ">2015年3月中旬，大前端和<a href="http://www.alibaixiu.com/" target="_blank" style="box-sizing: border-box; background: 0px 0px; color: rgb(69, 182, 247); transition: color 0.25s ease 0s, background-color 0.25s ease 0s;">阿里百秀</a>优雅合体了，背后是一个新组的团队，有了自己的办公地，这就开工了。</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; text-indent: 30px; color: rgb(85, 85, 85); font-family: "><span style="box-sizing: border-box; font-weight: 700;">大前端</span>，最初是一个专注前端开发的垂直博客，现已发展成为WordPress中文主题开发商，业务多半是围绕WordPress而来，有网站定制的、有网站优化的等等。之前一直是我在独立维护，积累了不少主题开发和前端开发的成熟经验。</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; text-indent: 30px; color: rgb(85, 85, 85); font-family: "><span style="box-sizing: border-box; font-weight: 700;">阿里百秀</span>，一个分享有趣的网站，网站的各大兴趣类频道备受广大兴趣爱好者喜欢，网站形象和内容都在不断升级，希望成为国内领先的兴趣类的网站平台。</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; text-indent: 30px; color: rgb(85, 85, 85); font-family: ">不一样的开始，不一样的路子，现在走到一起，为了更好的抱团发展，跟随自己的想法。</p><h2 style="box-sizing: border-box; font-family: ">关于团队的这些事儿：</h2><ol style="box-sizing: border-box; margin-bottom: 20px; margin-left: 50px; padding: 0px; list-style-position: initial; list-style-image: initial; color: rgb(85, 85, 85); font-family: " class=" list-paddingleft-2"><li><p>注册企业中，回头告诉大家团队名字；</p></li><li><p>目前有6个成员，3哥3妹子，包含设计师、前后端开发、编辑和推广专员（所有成员都是PM，吼吼~），家乡来自郑州、洛阳、信阳；</p></li><li><p>在信阳的一个高端大气写字楼，有自己的装修风格，有自己的团队风格；</p></li><li><p>单休，每周六的下午是团队活动时间，可以是爬山、逛街、嗨歌、桌球、篮球等各种奇葩；</p></li><li><p>上下班时间比较灵活，但目前大家基本维持一致；</p></li><li><p>每周一和三小会，明确各自任务，也会有各种小游戏，比如：分别夸其他5个伙伴；</p></li><li><p>上班期间会有平板支撑和俯卧撑对抗，也会有举桶装水来锻炼的二货行为；</p></li><li><p>如果你在这个城市，可以来耍耍……</p></li></ol><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; text-indent: 30px; color: rgb(85, 85, 85); font-family: "><span style="box-sizing: border-box; font-weight: 700;">PS：</span>由于准备各种团队化的事儿，很多邮件和评论都没有及时得到回复，我对此深表歉意，很快恢复正常！</p><p><br/></p>', 'admin', 1, 0, '', NULL, 0, 0, 0, '2020-06-08 13:37:06', '2020-06-08 13:36:36'),
(19, 5, 'DUX主题文章图片暗箱功能测试，请在手机端查看', '', '', '文章中不带链接的图片都可以 点击出现弹窗。', '<p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; text-indent: 30px; color: rgb(85, 85, 85); font-family: ">文章中不带链接的图片都可以 点击出现弹窗。</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; text-indent: 30px; color: rgb(85, 85, 85); font-family: "><img class="alignnone size-full wp-image-418" src="http://demo.themebetter.com/dux/wp-content/uploads/sites/3/2018/10/35.jpg" alt="" width="772" height="522"/></p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; text-indent: 30px; color: rgb(85, 85, 85); font-family: "><img class="alignnone size-full wp-image-417" src="http://demo.themebetter.com/dux/wp-content/uploads/sites/3/2018/10/34.jpg" alt="" width="777" height="522"/></p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; text-indent: 30px; color: rgb(85, 85, 85); font-family: "><img class="alignnone size-full wp-image-416" src="http://demo.themebetter.com/dux/wp-content/uploads/sites/3/2018/10/33.jpg" alt="" width="627" height="479"/></p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; text-indent: 30px; color: rgb(85, 85, 85); font-family: "><img class="alignnone size-full wp-image-420" src="http://demo.themebetter.com/dux/wp-content/uploads/sites/3/2018/10/37.jpg" alt="" width="657" height="551"/></p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 20px; overflow-wrap: break-word; text-indent: 30px; color: rgb(85, 85, 85); font-family: "><img class="alignnone size-full wp-image-441" src="http://demo.themebetter.com/dux/wp-content/uploads/sites/3/2018/10/43.jpg" alt="" width="527" height="553"/></p><p><br/></p>', 'admin', 1, 0, '/uploads/20200629/237897e7a29edfb34d2dcc70a9c0fc86.jpg', NULL, 0, 0, 0, '2020-06-08 13:38:28', '2020-06-08 13:37:33');

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
-- 表的结构 `os_brand`
--

DROP TABLE IF EXISTS `os_brand`;
CREATE TABLE `os_brand` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '品牌名称',
  `mobile` varchar(255) NOT NULL DEFAULT '' COMMENT '手机号码',
  `owner` varchar(255) NOT NULL DEFAULT '' COMMENT '持有人'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `os_brand`
--

INSERT INTO `os_brand` (`id`, `name`, `mobile`, `owner`) VALUES
(1, '红妆', '1300501412', 'unknown'),
(2, '红洋坊', '1300501752', '李琳芳'),
(3, 'PS', '2222222222222', '888888888888888'),
(4, '红妆学校', '15501863922', 'unknown'),
(5, ' 红妆双美', '13016270522', 'unknown');

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
(1, '科技', 'tech', '<p>科技频道</p>', '', 'fa fa-code', 'techList.html', 'techDetail.html', 1, 0, 0, '0,', '/tech', '2016-12-22 18:22:24'),
(2, '产品中心', 'product', '<p>产品中心</p>', '', 'fa fa-image', '', '', 1, 0, 0, '0,', '/product', '2020-05-27 15:02:25'),
(3, '电脑', '电脑', '<p>产品中心二级</p>', '', 'fa fa-image', '', '', 1, 0, 2, '0,2,', '/product/computer', '2020-05-27 15:03:17'),
(4, 'pc机', 'pc机', '<p>产品中心三级</p>', '', 'fa fa-image', '', '', 1, 0, 3, '0,2,3,', '/product/computer/pc', '2020-05-27 15:04:05'),
(5, '网站公告', 'notice', '<p>这个栏目是公告栏目</p>', '', '', '', '', 1, 0, 0, '0,', '/notice', '2020-06-08 08:52:29');

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

--
-- 转存表中的数据 `os_slide`
--

INSERT INTO `os_slide` (`id`, `cid`, `name`, `description`, `link`, `target`, `image`, `status`, `sort`) VALUES
(1, 1, 'xiu主题', 'xiu主题', 'https://themebetter.com/uploads/2014/11/hs-xiu.jpg', '_blank', '', 1, 0),
(2, 1, 'tab-ent', 'tab-ent主题', 'http://www.daqianduan.com/wp-content/uploads/2017/09/tb-4.jpg', '_self', '', 1, 1),
(3, 1, '建站', '建站', 'http://www.daqianduan.com/wp-content/uploads/2017/09/tb-2.jpg', '_self', '', 1, 2),
(4, 1, '主题', '主题', 'http://www.daqianduan.com/wp-content/uploads/2017/09/tb-1.jpg', '_self', '', 1, 3);

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
-- Indexes for table `os_brand`
--
ALTER TABLE `os_brand`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '文章ID', AUTO_INCREMENT=20;
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
-- 使用表AUTO_INCREMENT `os_brand`
--
ALTER TABLE `os_brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- 使用表AUTO_INCREMENT `os_category`
--
ALTER TABLE `os_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '分类ID', AUTO_INCREMENT=6;
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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
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
