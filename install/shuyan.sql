-- MySQL dump 10.13  Distrib 5.6.50, for Linux (x86_64)
--
-- Host: localhost    Database: faka_authh_cn
-- ------------------------------------------------------
-- Server version	5.6.50-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `announce_log`
--

DROP TABLE IF EXISTS `announce_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announce_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `article_id` int(11) NOT NULL DEFAULT '0' COMMENT '公告ID',
  `create_at` int(11) NOT NULL DEFAULT '0' COMMENT '阅读时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announce_log`
--

LOCK TABLES `announce_log` WRITE;
/*!40000 ALTER TABLE `announce_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `announce_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_menu`
--

DROP TABLE IF EXISTS `app_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `function_id` int(11) NOT NULL COMMENT '唯一值',
  `menu` text NOT NULL COMMENT '菜单项',
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_menu_id_uindex` (`id`),
  UNIQUE KEY `app_menu_function_id_uindex` (`function_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='客户端菜单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_menu`
--

LOCK TABLES `app_menu` WRITE;
/*!40000 ALTER TABLE `app_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_version`
--

DROP TABLE IF EXISTS `app_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `platform` enum('android','ios') NOT NULL COMMENT '平台',
  `package` varchar(255) NOT NULL COMMENT '安装包下载地址',
  `create_at` int(10) NOT NULL COMMENT '发布时间',
  `version` varchar(255) NOT NULL COMMENT '安装包版本',
  `remark` text NOT NULL COMMENT '更新说明',
  `create_ip` varchar(255) NOT NULL COMMENT '上传 IP',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户端版本';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_version`
--

LOCK TABLES `app_version` WRITE;
/*!40000 ALTER TABLE `app_version` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cate_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(50) NOT NULL DEFAULT '',
  `title_img` varchar(255) NOT NULL DEFAULT '' COMMENT '标题图',
  `description` text NOT NULL COMMENT '文章描述',
  `content` text NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `views` int(10) unsigned NOT NULL DEFAULT '0',
  `create_at` int(10) unsigned NOT NULL,
  `update_at` int(10) unsigned NOT NULL DEFAULT '0',
  `is_system` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1表示系统调用到的页面，禁止删除',
  `top` int(10) NOT NULL DEFAULT '0' COMMENT '置顶时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (2,2,'1.怎么入驻自动发卡平台,成为商户?','','','&lt;p&gt;通过平台的账户注册功能，即可免费入驻自动发卡平台。&lt;/p&gt;\r\n',1,1,1572354102,0,0,0),(3,2,'2.怎么登录自动发卡平台商户后台?','','','&lt;p&gt;点此右上角&amp;ldquo;登录&amp;rdquo;按钮进入&lt;/p&gt;\r\n',1,2,1572354126,0,0,0),(4,2,'4.发卡平台可以卖些什么？','','','&lt;p&gt;虚拟商品(例如软件注册码，论坛帐号等等)，不可以卖实物（例如衣服，水果等等）&lt;/p&gt;\r\n',1,2,1572354183,0,0,0),(5,2,'5.账户的金额满多少自动结算？','','','&lt;p&gt;商户账户金额满10.00元，当天晚上12点后，系统自动帮您提现，财务将于第二天12点前结算到您预留的账户，不满10.00元可以申请手动提现。&lt;/p&gt;\r\n',1,3,1572354219,0,0,0),(6,2,'6.财务结算商户方式有那些？','','','&lt;p&gt;支持支付宝、银行卡，后期我们还会增加微信结算。&lt;/p&gt;\r\n',1,4,1572354265,0,0,0),(7,2,'7.如果买家已经付款,但是他说没有收到卡密该怎么办？','','','&lt;p&gt;请直接联系自动发卡平台客服QQ解决。&lt;/p&gt;\r\n',1,7,1572354257,0,0,0),(8,2,'8.自动发卡平台安全吗？','','','&lt;p&gt;非常安全，自动发卡平台运用先进的安全技术保护用户在自动发卡平台账户中存储的个人信息、账户信息以及交易记录的安全。&lt;/p&gt;\r\n\r\n&lt;p&gt;自动发卡平台拥有完善的全监测系统，可以及时发现网站的非正常访问并做相应的安全响应&lt;/p&gt;\r\n',1,6,1572354249,0,0,0),(13,3,'注册协议','','','&lt;p&gt;&lt;b&gt;注册协议&lt;/b&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;【审慎阅读】&lt;/strong&gt;您在申请注册流程中点击同意前，应当认真阅读以下协议。&lt;strong&gt;请您务必审慎阅读、充分理解协议中相关条款内容，其中包括：&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;1、&lt;strong&gt;与您约定免除或限制责任的条款；&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;2、&lt;strong&gt;与您约定法律适用和管辖的条款；&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;3、&lt;strong&gt;其他以粗体下划线标识的重要条款。&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;如您对协议有任何疑问，可向平台客服咨询。&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;【特别提示】&lt;/strong&gt;当您按照注册页面提示填写信息、阅读并同意协议且完成全部注册程序后，即表示您已充分阅读、理解并接受协议的全部内容。如您因平台服务与自动发卡发生争议的，适用《自动发卡平台服务协议》处理。如您在使用平台服务过程中与其他用户发生争议的，依您与其他用户达成的协议处理。&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;阅读协议的过程中，如果您不同意相关协议或其中任何条款约定，您应立即停止注册程序。&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;《自动发卡平台服务协议》&lt;/p&gt;\r\n\r\n&lt;p&gt;《法律声明及隐私权政策》&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;a href=&quot;/index/index/content/id/12&quot; target=&quot;_blank&quot;&gt;《平台禁售商品目录》&lt;/a&gt;&lt;/p&gt;\r\n',1,0,1596081763,0,0,0),(14,3,'企业资质','','','&lt;p&gt;企业资质企业资质企业资质企业资质企业资质企业资质企业资质&lt;/p&gt;\r\n',1,0,1596081670,0,0,0),(15,3,'购买协议','','','&lt;p&gt;购买协议购买协议购买协议购买协议购买协议购买协议购买协议&lt;/p&gt;\r\n',1,0,1596081780,0,0,0),(16,3,'平台禁售商品类目','','','&lt;table&gt;\r\n	&lt;colgroup&gt;\r\n		&lt;col width=&quot;17%&quot; /&gt;\r\n		&lt;col width=&quot;22%&quot; /&gt;\r\n		&lt;col width=&quot;61%&quot; /&gt;\r\n	&lt;/colgroup&gt;\r\n	&lt;tbody&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;center&quot; rowspan=&quot;4&quot;&gt;政治类&lt;/td&gt;\r\n			&lt;td align=&quot;center&quot; rowspan=&quot;2&quot;&gt;反动信息&lt;/td&gt;\r\n			&lt;td align=&quot;left&quot;&gt;含有反动、破坏国家统一、破坏主权及领土完整、破坏社会稳定，涉及国家机密、扰乱社会秩序，宣扬邪教迷信，宣扬宗教、种族歧视、藏独、法轮功、违反伦理等信息，或法律法规禁止出版发行的书籍、音像制品、视频、文件资料等；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;left&quot;&gt;其他反动物品及言论等；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;center&quot; rowspan=&quot;2&quot;&gt;政治物品&lt;/td&gt;\r\n			&lt;td align=&quot;left&quot;&gt;国家机密文件资料等；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;left&quot;&gt;带有宗教歧视、种族歧视的相关商品或信息。&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;center&quot; rowspan=&quot;2&quot;&gt;军警类&lt;/td&gt;\r\n			&lt;td align=&quot;center&quot;&gt;军火武器/枪械及配件&lt;/td&gt;\r\n			&lt;td align=&quot;left&quot;&gt;枪支、弹药、军火及其相关器材、配件、附属产品，仿制品的衍生工艺品等；包括枪瞄、枪套等枪支配件以及90%大小相似的仿真枪；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;center&quot;&gt;军警用品&lt;/td&gt;\r\n			&lt;td align=&quot;left&quot;&gt;冒用警用、军用制服、标志、设备及制品；带有警用标志（警徽）物品；描述为军队、警队使用物品；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;center&quot; rowspan=&quot;8&quot;&gt;治安类（危险品）&lt;/td&gt;\r\n			&lt;td align=&quot;center&quot;&gt;危险品&lt;/td&gt;\r\n			&lt;td align=&quot;left&quot;&gt;烟花爆竹、易燃、易爆物品；介绍制作易燃易爆品方法的相关教程、书籍。&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;center&quot; rowspan=&quot;2&quot;&gt;危险武器&lt;/td&gt;\r\n			&lt;td align=&quot;left&quot;&gt;可致使他人暂时失去反抗能力，对他人身体造成重大伤害的管制器具；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;left&quot;&gt;甩棍、电棍、电击棍等危险物品；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;center&quot; rowspan=&quot;2&quot;&gt;危险化学品&lt;/td&gt;\r\n			&lt;td align=&quot;left&quot;&gt;剧毒化学品；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;left&quot;&gt;国家名录中禁止出售的危险化学品（剧毒化学品除外）；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;center&quot; rowspan=&quot;2&quot;&gt;剧毒物品&lt;/td&gt;\r\n			&lt;td align=&quot;left&quot;&gt;毒品、制毒原料、制毒化学品及致瘾性药物；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;left&quot;&gt;毒品吸食工具及配件；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;center&quot;&gt;毒品、毒品检测工具&lt;/td&gt;\r\n			&lt;td align=&quot;left&quot;&gt;毒品检测试剂准入只允许有资质的戒毒所机构。&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;center&quot; rowspan=&quot;8&quot;&gt;黄赌毒类&lt;/td&gt;\r\n			&lt;td align=&quot;center&quot; rowspan=&quot;3&quot;&gt;黄色低俗色情服务及信息&lt;/td&gt;\r\n			&lt;td align=&quot;left&quot;&gt;含有色情淫秽内容的音像制品及视频；色情陪聊服务；成人网站论坛的帐号及邀请码；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;left&quot;&gt;用于传播色情信息的软件及图片；含有情色、暴力、低俗内容的音像制品；原味内衣及相关产品；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;left&quot;&gt;含有情色、暴力、低俗内容的动漫、读物、游戏和图片；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;center&quot;&gt;赌博器具&lt;/td&gt;\r\n			&lt;td align=&quot;left&quot;&gt;如电子老虎机、百家乐桌子，或者百家乐的筹码等；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;center&quot;&gt;赌博/博彩服务&lt;/td&gt;\r\n			&lt;td align=&quot;left&quot;&gt;棋牌类网站，游戏货币能直接兑换现金。或者棋牌类网站，游戏货币能直接通过账户流转，且有专门银商收购贩卖游戏币。如：捕鱼游戏、金鲨银鲨、彩金、牛牛等；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;center&quot;&gt;私彩&lt;/td&gt;\r\n			&lt;td align=&quot;left&quot;&gt;私彩是指私人坐庄，由个人或组织发行的，以诈取钱财为目的的非法彩票。一般以公益彩票的开奖结果进行赌博，骗取高额利润，如地下六合彩，以香港六合彩的开奖号码进行变相赌博，以1赔40左右的高额赔率欺骗民众；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;center&quot;&gt;毒品、吸毒工具、毒品检测工具&lt;/td&gt;\r\n			&lt;td align=&quot;left&quot;&gt;毒品检测试剂准入只允许有资质的戒毒所机构；毒品检测工具，不允许出售。&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;center&quot;&gt;其他黄色低俗物品或服务&lt;/td&gt;\r\n			&lt;td align=&quot;left&quot;&gt;泡妞秘籍、恋足、恋童、人体摄影、丝袜、原味、捆绑等带有不正当引导倾向的；可致使他人暂时失去反抗能力、意识模糊的口服或外用的催情类商品及人造处女膜。&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;center&quot; rowspan=&quot;7&quot;&gt;侵害隐私类&lt;/td&gt;\r\n			&lt;td align=&quot;center&quot; rowspan=&quot;4&quot;&gt;间谍器材&lt;/td&gt;\r\n			&lt;td align=&quot;left&quot;&gt;用于监听、窃取隐私或机密的软件及设备；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;left&quot;&gt;用于非法摄像、录音、取证等用途的设备；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;left&quot;&gt;身份证及身份证验证、阅读设备；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;left&quot;&gt;盗取或破解账号密码的软件、工具、教程及产物。&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;center&quot; rowspan=&quot;2&quot;&gt;身份信息等其他侵犯个人隐私的信息&lt;/td&gt;\r\n			&lt;td align=&quot;left&quot;&gt;个人隐私信息及企业内部数据买卖；提供个人手机定位、电话清单查询、银行账户查询等服务；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;left&quot;&gt;出售、转让、回收，包括已作废或者作为收藏用途的银行卡；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;center&quot;&gt;其他危害隐私的物品或服务&lt;/td&gt;\r\n			&lt;td align=&quot;left&quot;&gt;如间谍服务，私人侦探等。&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;center&quot; rowspan=&quot;6&quot;&gt;医药器械类&lt;/td&gt;\r\n			&lt;td align=&quot;center&quot;&gt;麻醉药品和精神类药品&lt;/td&gt;\r\n			&lt;td align=&quot;left&quot;&gt;精神类、麻醉类、有毒类、放射类、兴奋剂类、计生类药品；非药品添加药品成分；国家公示已查处、药品监督管理局认定禁止生产、使用的药品；用于预防、治疗人体疾病的药物、血液制品或医疗器械；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;center&quot;&gt;毒性药品&lt;/td&gt;\r\n			&lt;td align=&quot;left&quot;&gt;灭鼠药、蟑螂药、兽药不做限制&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;center&quot;&gt;处方药&lt;/td&gt;\r\n			&lt;td align=&quot;left&quot;&gt;参照《互联网药品交易服务审批暂行规定》&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;center&quot;&gt;无批号药品&lt;/td&gt;\r\n			&lt;td align=&quot;left&quot;&gt;未经药品监督管理部门批准生产、进口，或未经检验即销售的药品&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;center&quot;&gt;胎儿性别鉴定&lt;/td&gt;\r\n			&lt;td align=&quot;left&quot;&gt;违反国家及世界卫生组织的人道精神，任何涉及胎儿性别鉴定商品、服务；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;center&quot;&gt;成人药品（春药）&lt;/td&gt;\r\n			&lt;td align=&quot;left&quot;&gt;口服催情类药品。&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;center&quot; rowspan=&quot;7&quot;&gt;国家保护动植物&lt;/td&gt;\r\n			&lt;td align=&quot;center&quot; rowspan=&quot;7&quot;&gt;国家保护动植物&lt;/td&gt;\r\n			&lt;td align=&quot;left&quot;&gt;人体器官、遗体；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;left&quot;&gt;国家重点保护类动物、濒危动物的活体、内脏、任何肢体、皮毛、标本或其他制成品，已灭绝动物与现有国家二级以上保护动物的化石。&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;left&quot;&gt;国家保护类植物活体（树苗除外）；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;left&quot;&gt;国家保护的有益的或者有重要经济、科学研究价值的陆生野生动物的活体、内脏、任何肢体、皮毛、标本或其他制成品；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;left&quot;&gt;捕鱼器相关设备及配件；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;left&quot;&gt;其他动物捕杀工具；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;left&quot;&gt;猫狗肉、猫狗皮毛、鱼翅、熊胆及其制品；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;center&quot; rowspan=&quot;26&quot;&gt;虚拟类&lt;/td&gt;\r\n			&lt;td align=&quot;center&quot; rowspan=&quot;10&quot;&gt;网络服务&lt;/td&gt;\r\n			&lt;td align=&quot;left&quot;&gt;未经国家备案的网络游戏、游戏点卡、货币等相关服务类商品；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;left&quot;&gt;外挂、私服相关的网游类商品；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;left&quot;&gt;官方已停止经营的游戏点卡或平台卡商品；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;left&quot;&gt;时间不可查询的虚拟服务类商品；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;left&quot;&gt;网络账户死保帐号以及腾讯QQ帐号；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;left&quot;&gt;Itunes帐号及用户充值类商品；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;left&quot;&gt;各类短信、邮件、QQ/微信群发设备、软件及服务，如短信轰炸机；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;left&quot;&gt;虚拟代刷、炒信、恶意刷店铺流量等服务类商品；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;left&quot;&gt;黑客相关&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;left&quot;&gt;涉外婚介&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;center&quot; rowspan=&quot;5&quot;&gt;电信欺诈&lt;/td&gt;\r\n			&lt;td align=&quot;left&quot;&gt;不可查询的分期返还话费类商品；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;left&quot;&gt;不限时间与流量的、时间不可查询的以及被称为漏洞卡、集团卡、内部卡、测试卡的上网资费卡或资费套餐及SIM 卡；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;left&quot;&gt;一卡多号；有蹭网功能的无线网卡，以及描述信息中有告知会员能用于蹭网的设备；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;left&quot;&gt;带破解功能的手机卡贴；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;left&quot;&gt;SP业务自消费类商品；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;center&quot; rowspan=&quot;6&quot;&gt;非法服务、票证&lt;/td&gt;\r\n			&lt;td align=&quot;left&quot;&gt;伪造变造国家机关或特定机构颁发的文件、证书、公章、防伪标签等，仅限国家机关或特定机构方可提供的服务；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;left&quot;&gt;伪造各类公章、图章扰乱市场业务；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;left&quot;&gt;尚可使用或用于报销的票据（及服务）,尚可使用的外贸单证以及代理报关、清单、商检、单证手续的服务；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;left&quot;&gt;未公开发行的国家级正式考试答案；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;left&quot;&gt;代写论文、代考试类相关服务；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;left&quot;&gt;炒作博客人气、炒作网站人气、代投票类商品或信息；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;center&quot; rowspan=&quot;5&quot;&gt;其他高风险的服务&lt;/td&gt;\r\n			&lt;td align=&quot;left&quot;&gt;弹窗广告虚假中奖信息；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;left&quot;&gt;友情链接名称涉及禁售不合作内容；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;left&quot;&gt;模板网站且网站可以打开，只有框架（无商品、无效商品、无帖子）；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;left&quot;&gt;恶意舞弊投票类型；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;left&quot;&gt;微交易，云交易类商户；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;center&quot; rowspan=&quot;20&quot;&gt;金融类&lt;/td&gt;\r\n			&lt;td align=&quot;center&quot;&gt;非法传销&lt;/td&gt;\r\n			&lt;td align=&quot;left&quot;&gt;传销，金融互助平台。虚假宣传致富，出售书籍、碟片、成功学、消费返利、多级分销、发展下线&amp;ldquo;金字塔&amp;rdquo;型提成等；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;center&quot;&gt;彩票销售&lt;/td&gt;\r\n			&lt;td align=&quot;left&quot;&gt;除O2O类的平台彩票销售；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;center&quot;&gt;虚拟货币&lt;/td&gt;\r\n			&lt;td align=&quot;left&quot;&gt;虚拟货币，比特币、莱特币、元宝币等虚拟货币交易。&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;center&quot; rowspan=&quot;10&quot;&gt;货币业务&lt;/td&gt;\r\n			&lt;td align=&quot;left&quot;&gt;假币或制造机器；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;left&quot;&gt;买卖银行账户（银行卡）；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;left&quot;&gt;非法集资；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;left&quot;&gt;外汇兑换服务；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;left&quot;&gt;境外账户中的虚拟货币；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;left&quot;&gt;期货；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;left&quot;&gt;有价证券或凭证；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;left&quot;&gt;P2P等理财类网站；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;left&quot;&gt;大量流通中的外币及外币兑换服务；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;left&quot;&gt;借贷平台，融资租赁平台，非实物众筹；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;center&quot;&gt;二清无牌机构&lt;/td&gt;\r\n			&lt;td align=&quot;left&quot;&gt;未取得《支付业务许可证》、非法开展资金支付结算业务的机构，存在挪用、占用资金的风险；禁止随意变更使用场景和范围，出租、出借、出售接口；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;center&quot; rowspan=&quot;4&quot;&gt;支付业务&lt;/td&gt;\r\n			&lt;td align=&quot;left&quot;&gt;禁止网上销售POS机具和提供POS收单业务；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;left&quot;&gt;随意变更使用场景和范围；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;left&quot;&gt;信用卡套现服务；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;left&quot;&gt;违规聚合支付业务；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;center&quot;&gt;非法交易所&lt;/td&gt;\r\n			&lt;td align=&quot;left&quot;&gt;微盘类交易；省级及以上政府批文且经营范围不符；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;center&quot;&gt;一元购&lt;/td&gt;\r\n			&lt;td align=&quot;left&quot;&gt;购买抽奖码，商户摇奖公布中奖号码，可能获得实物或是贵金属饰品等物品；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;center&quot;&gt;烟草类&lt;/td&gt;\r\n			&lt;td align=&quot;center&quot;&gt;烟草类&lt;/td&gt;\r\n			&lt;td align=&quot;left&quot;&gt;烟草专卖品及烟草专用机械（线上禁售）。可参照《烟草专用机械名录》（国烟法[2004]）。&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;center&quot; rowspan=&quot;2&quot;&gt;收藏类&lt;/td&gt;\r\n			&lt;td align=&quot;center&quot;&gt;考古文物&lt;/td&gt;\r\n			&lt;td align=&quot;left&quot;&gt;《中华人民共和国文物保护法》第五十一条第五十二条，国有文物不得买卖&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;center&quot;&gt;收藏品&lt;/td&gt;\r\n			&lt;td align=&quot;left&quot;&gt;国家禁止的集邮票品以及未经邮政行业管理部门批准制作的集邮品，以及一九四九年之后发行的包含&amp;ldquo;中华民国&amp;rdquo;字样的邮品。&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;center&quot; rowspan=&quot;3&quot;&gt;商品质量类&lt;/td&gt;\r\n			&lt;td align=&quot;center&quot; rowspan=&quot;3&quot;&gt;假冒伪劣产品&lt;/td&gt;\r\n			&lt;td align=&quot;left&quot;&gt;由不具备生产资质的生产商生产的或不符合国家、地方、行业、企业强制性标准的商品；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;left&quot;&gt;经权威质检部门或生产商认定、公布或召回的商品，国家明令淘汰或停止销售的商品，过期、失效、变质的商品，以及含有罂粟籽的食品、调味品、护肤品等制成品；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;left&quot;&gt;商品本身或外包装上所注明的产品标准、认证标志、成份及含量不符合国家规定的商品；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;center&quot; rowspan=&quot;21&quot;&gt;其他类&lt;/td&gt;\r\n			&lt;td align=&quot;center&quot; rowspan=&quot;8&quot;&gt;非法所得及非法用工具&lt;/td&gt;\r\n			&lt;td align=&quot;left&quot;&gt;走私、盗窃、抢劫等非法所得；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;left&quot;&gt;赌博用具、考试作弊工具、汽车跑表器材等非法用途工具；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;left&quot;&gt;摩卡等，蹭网卡、一卡多号的手机卡等&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;left&quot;&gt;卫星信号收发装置及软件；用于无线电信号屏蔽的仪器或设备；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;left&quot;&gt;撬锁工具、开锁服务及其相关教程、书籍；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;left&quot;&gt;涉嫌欺诈等非法用途的软件；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;left&quot;&gt;可能用于逃避交通管理的商品；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;left&quot;&gt;猫狗肉、猫狗皮毛、鱼翅、熊胆及其制品；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;center&quot; rowspan=&quot;13&quot;&gt;特殊时期特殊规定&lt;/td&gt;\r\n			&lt;td align=&quot;left&quot;&gt;未经许可的募捐类商品；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;left&quot;&gt;原油；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;left&quot;&gt;代孕服务；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;left&quot;&gt;替考、代考、代写论文服务；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;left&quot;&gt;未经许可发布的奥林匹克运动会、世界博览会、亚洲运动会等特许商品；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;left&quot;&gt;邮局包裹、EMS 专递、快递等物流单据凭证及单号；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;left&quot;&gt;国家补助或无偿发放的不得私自转让的商品；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;left&quot;&gt;军需、国家机关专供、特供等商品。&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;left&quot;&gt;股权类众筹商户；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;left&quot;&gt;购物返利类商户；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;left&quot;&gt;虚假交易；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;left&quot;&gt;套现行为；&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n		&lt;tr&gt;\r\n			&lt;td align=&quot;left&quot;&gt;其它违反法律法规、社会公序良俗而不宜接入有卡啦的物品或服务&lt;/td&gt;\r\n		&lt;/tr&gt;\r\n	&lt;/tbody&gt;\r\n&lt;/table&gt;\r\n',1,0,1596081730,0,0,0);
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_category`
--

DROP TABLE IF EXISTS `article_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `path` varchar(1024) NOT NULL,
  `name` varchar(30) NOT NULL DEFAULT '',
  `alias` varchar(30) NOT NULL DEFAULT '',
  `remark` varchar(255) NOT NULL DEFAULT '',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `create_at` int(10) unsigned NOT NULL,
  `update_at` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_category`
--

LOCK TABLES `article_category` WRITE;
/*!40000 ALTER TABLE `article_category` DISABLE KEYS */;
INSERT INTO `article_category` VALUES (1,0,'0','系统公告','notice','系统公告',1,1520268395,0),(2,0,'0','常见问题','faq','常见问题',1,1520268562,0),(3,0,'0','系统单页','single','系统单页禁止删除',1,1524220912,0),(8,0,'0','新闻动态','xwdt','新闻动态',1,1560825443,0),(9,0,'0','通知公告','tgtz','通知公告',1,1560825460,0),(10,0,'0','技术支持','jszc','技术支持',1,1560825474,0),(11,0,'0','结算公告','settlement','结算公告',1,1572355794,0),(12,0,'0','商品池公告','shangpinchi','商品池公告',1,1572355794,0);
/*!40000 ALTER TABLE `article_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auto_unfreeze`
--

DROP TABLE IF EXISTS `auto_unfreeze`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auto_unfreeze` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `money` decimal(10,3) unsigned NOT NULL DEFAULT '0.000' COMMENT '冻结金额',
  `unfreeze_time` int(11) NOT NULL DEFAULT '0' COMMENT '解冻时间',
  `created_at` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `trade_no` varchar(255) NOT NULL DEFAULT '0' COMMENT '冻结资金来源订单号',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '冻结资金记录状态，1：可用，-1：不可用（订单申诉中等情况）',
  PRIMARY KEY (`id`),
  KEY `unfreeze_time` (`unfreeze_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单金额T+1日自动解冻表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auto_unfreeze`
--

LOCK TABLES `auto_unfreeze` WRITE;
/*!40000 ALTER TABLE `auto_unfreeze` DISABLE KEYS */;
/*!40000 ALTER TABLE `auto_unfreeze` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buyer`
--

DROP TABLE IF EXISTS `buyer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `buyer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `openid` varchar(50) NOT NULL DEFAULT '' COMMENT '微信openid',
  `username` varchar(50) NOT NULL,
  `password` char(32) NOT NULL,
  `mobile` varchar(15) NOT NULL DEFAULT '' COMMENT '手机号',
  `qq` varchar(16) NOT NULL,
  `email` varchar(50) NOT NULL,
  `statis_code` varchar(1024) NOT NULL DEFAULT '' COMMENT '统计代码',
  `money` decimal(10,3) NOT NULL DEFAULT '0.000',
  `rebate` decimal(10,3) unsigned NOT NULL DEFAULT '0.000',
  `freeze_money` decimal(10,3) NOT NULL DEFAULT '0.000',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '0未审核 1已审核',
  `is_freeze` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否冻结 0否 1是',
  `create_at` int(10) unsigned NOT NULL,
  `ip` varchar(50) DEFAULT '' COMMENT 'IP地址',
  `cash_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '提现方式',
  `login_auth` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否开启安全登录',
  `login_auth_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '安全登录验证方式，1：短信，2：邮件，3：谷歌密码验证',
  `google_secret_key` varchar(128) DEFAULT '' COMMENT '谷歌令牌密钥',
  `login_key` int(11) NOT NULL DEFAULT '0' COMMENT '用户登录标记',
  `dl` int(11) NOT NULL COMMENT '登录提醒',
  `iscode` int(11) NOT NULL COMMENT '安全码开关 0为关闭 1为开启 ',
  `codes` varchar(20) NOT NULL COMMENT '安全码',
  `renzheng_name` varchar(100) DEFAULT NULL COMMENT '姓名',
  `renzheng_sfz` varchar(100) DEFAULT NULL COMMENT '身份证号码',
  `renzheng_sfz_img` varchar(200) DEFAULT NULL COMMENT '身份证照片',
  `renzheng_address` varchar(100) DEFAULT NULL COMMENT '家庭住址',
  `renzheng_mobile` varchar(100) DEFAULT NULL COMMENT '认证手机',
  `index_theme` varchar(100) DEFAULT NULL COMMENT '前台模板',
  `merchant_theme` varchar(100) DEFAULT NULL COMMENT '会员中心模板',
  `jifen` float(11,4) DEFAULT '0.0000' COMMENT '积分',
  `address` varchar(200) DEFAULT NULL COMMENT '收货地址',
  `mobile_theme` varchar(100) DEFAULT 'default' COMMENT '手机模板',
  `yyopen` int(2) DEFAULT '0' COMMENT '音乐开关',
  `yymoban` int(2) DEFAULT '1' COMMENT '音乐模板',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buyer`
--

LOCK TABLES `buyer` WRITE;
/*!40000 ALTER TABLE `buyer` DISABLE KEYS */;
/*!40000 ALTER TABLE `buyer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buyer_collect`
--

DROP TABLE IF EXISTS `buyer_collect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `buyer_collect` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '类型 1支付宝 2微信 3银行卡',
  `info` text NOT NULL,
  `create_at` int(10) unsigned NOT NULL DEFAULT '0',
  `collect_img` tinytext,
  `allow_update` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1为允许用户修改收款信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buyer_collect`
--

LOCK TABLES `buyer_collect` WRITE;
/*!40000 ALTER TABLE `buyer_collect` DISABLE KEYS */;
/*!40000 ALTER TABLE `buyer_collect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buyer_money_log`
--

DROP TABLE IF EXISTS `buyer_money_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `buyer_money_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `business_type` enum('cash_notpass','cash_success','apply_cash','admin_dec','admin_inc','fee','freeze','unfreeze','recharge') NOT NULL,
  `user_id` int(10) unsigned NOT NULL COMMENT '买家ID',
  `money` decimal(10,3) NOT NULL COMMENT '变动金额',
  `balance` decimal(10,3) NOT NULL COMMENT '剩余',
  `reason` varchar(255) NOT NULL DEFAULT '' COMMENT '变动原因',
  `create_at` int(10) unsigned NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buyer_money_log`
--

LOCK TABLES `buyer_money_log` WRITE;
/*!40000 ALTER TABLE `buyer_money_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `buyer_money_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cash`
--

DROP TABLE IF EXISTS `cash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cash` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `type` tinyint(3) unsigned NOT NULL COMMENT '收款产品类型 1支付宝 2微信',
  `collect_info` varchar(1024) NOT NULL DEFAULT '' COMMENT '提现信息',
  `money` decimal(10,2) unsigned NOT NULL COMMENT '提现金额',
  `fee` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '手续费',
  `actual_money` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '实际到账',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态 0审核中 1审核通过 2审核未通过',
  `create_at` int(10) unsigned NOT NULL COMMENT '创建时间',
  `complete_at` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '完成时间',
  `collect_img` tinytext COMMENT '收款二维码',
  `auto_cash` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1 表示自动提现',
  `bank_name` varchar(50) NOT NULL DEFAULT '' COMMENT '银行名称',
  `bank_branch` varchar(150) NOT NULL DEFAULT '' COMMENT '开户地址',
  `bank_card` varchar(50) NOT NULL DEFAULT '' COMMENT '银行卡号',
  `realname` varchar(50) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `idcard_number` varchar(50) NOT NULL DEFAULT '' COMMENT '身份证号码',
  `orderid` varchar(50) NOT NULL DEFAULT '' COMMENT '订单号',
  `account` int(11) NOT NULL DEFAULT '0' COMMENT '代付账号',
  `daifu_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '代付状态（0，未申请，1，已申请）',
  `from_user_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '提现用户类别0商家1买家',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cash`
--

LOCK TABLES `cash` WRITE;
/*!40000 ALTER TABLE `cash` DISABLE KEYS */;
/*!40000 ALTER TABLE `cash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cash_channel`
--

DROP TABLE IF EXISTS `cash_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cash_channel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL COMMENT '代付渠道名',
  `code` varchar(255) NOT NULL COMMENT '代付渠道代码',
  `account_fields` text NOT NULL COMMENT '代付所需的字段',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1支付宝，2微信，3银行',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '渠道状态，0关闭，1开启',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cash_channel`
--

LOCK TABLES `cash_channel` WRITE;
/*!40000 ALTER TABLE `cash_channel` DISABLE KEYS */;
INSERT INTO `cash_channel` VALUES (1,'支付宝官方','Alipay','AppID:AppID|AppSecret:AppSecret|alipayrsaPublicKey:alipayrsaPublicKey',1,1),(2,'微信官方','Wxpay','appid:appid|AppSecret:AppSecret|MCHID:MCHID|KEY:KEY|',2,1);
/*!40000 ALTER TABLE `cash_channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cash_channel_account`
--

DROP TABLE IF EXISTS `cash_channel_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cash_channel_account` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `channel_id` int(10) unsigned NOT NULL COMMENT '渠道ID',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '账户名',
  `params` text NOT NULL COMMENT '参数',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态 1启用 0禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cash_channel_account`
--

LOCK TABLES `cash_channel_account` WRITE;
/*!40000 ALTER TABLE `cash_channel_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `cash_channel_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channel`
--

DROP TABLE IF EXISTS `channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channel` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '通道ID',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '通道名称',
  `code` varchar(50) NOT NULL DEFAULT '' COMMENT '通道代码',
  `code_api` varchar(50) NOT NULL DEFAULT '' COMMENT '支付接口编码',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态 1 开启 0 关闭',
  `mch_id` varchar(50) NOT NULL DEFAULT '' COMMENT '商户号',
  `signkey` varchar(255) NOT NULL DEFAULT '' COMMENT '签名KEY',
  `appid` varchar(50) NOT NULL DEFAULT '' COMMENT 'APPID(账号)',
  `appsecret` varchar(50) NOT NULL DEFAULT '' COMMENT 'APPSECRET(密钥)',
  `gateway` varchar(255) NOT NULL DEFAULT '' COMMENT '网关地址',
  `return_url` varchar(255) NOT NULL DEFAULT '' COMMENT '页面通知（优先级）',
  `notify_url` varchar(255) NOT NULL DEFAULT '' COMMENT '服务器通知（优先级）',
  `lowrate` decimal(10,4) unsigned NOT NULL DEFAULT '0.0000' COMMENT '充值费率',
  `highrate` decimal(10,4) unsigned NOT NULL DEFAULT '0.0000' COMMENT '封顶费率',
  `costrate` decimal(10,4) unsigned NOT NULL DEFAULT '0.0000' COMMENT '成本费率',
  `rate_api` decimal(10,4) unsigned NOT NULL COMMENT '充值费率',
  `accounting_date` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '结算时间 1、D0 2、D1 3、T0 4、T1',
  `max_money` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '单笔限额 0为最高不限额',
  `min_money` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '单笔限额',
  `limit_time` varchar(19) NOT NULL DEFAULT '' COMMENT '限时',
  `account_fields` varchar(1024) NOT NULL DEFAULT '' COMMENT '账户字段',
  `polling` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '接口模式 0单独 1轮询',
  `account_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '账号ID',
  `weight` text COMMENT '权重',
  `updatetime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '支付类型 1 微信扫码 2 微信公众号 3 支付宝扫码 4 支付宝手机 5 网银支付 6',
  `show_name` varchar(255) NOT NULL DEFAULT '' COMMENT '前台展示名称',
  `is_available` tinyint(4) NOT NULL DEFAULT '0' COMMENT '接口可用 0通用 1手机 2电脑',
  `default_fields` varchar(1024) NOT NULL DEFAULT '' COMMENT '字段默认值',
  `applyurl` varchar(255) NOT NULL DEFAULT '' COMMENT '申请地址',
  `is_install` tinyint(4) NOT NULL DEFAULT '0',
  `sort` int(10) NOT NULL DEFAULT '0' COMMENT '渠道排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `channel_code_uindex` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=221 DEFAULT CHARSET=utf8 COMMENT='支付供应商';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel`
--

LOCK TABLES `channel` WRITE;
/*!40000 ALTER TABLE `channel` DISABLE KEYS */;
INSERT INTO `channel` VALUES (10,'支付宝支付','AlipayScan','',0,'','','','','','','',0.0200,0.0400,0.0060,0.0150,1,0.00,0.00,'','alipay_public_key:alipay_public_key|merchant_private_key:merchant_private_key|app_id:app_id|防封域名（可选）:refer',0,4,'[]',0,3,'',2,'charset=UTF-8','https://open.alipay.com/platform/homeRoleSelection.htm',1,0),(11,'支付宝当面付','AlipayQr','',0,'','','','','','','',0.0200,0.0200,0.0060,0.0200,1,0.00,0.00,'','alipay_public_key:alipay_public_key|merchant_private_key:merchant_private_key|app_id:app_id|防封域名（可选）:refer',0,4,'[]',0,19,'支付宝当面付',2,'charset=UTF-8','https://open.alipay.com/platform/homeRoleSelection.htm',1,0),(12,'支付宝H5','AlipayWap','',0,'','','','','','','',0.0200,0.0000,0.0060,0.0150,1,0.00,0.00,'','alipay_public_key:alipay_public_key|merchant_private_key:merchant_private_key|app_id:app_id|防封域名（可选）:refer',0,5,'[]',0,4,'',1,'charset=UTF-8','https://open.alipay.com/platform/homeRoleSelection.htm',1,0),(13,'微信H5支付','WxpayH5','',0,'','','','','','','',0.0200,0.0000,0.0060,0.0000,1,0.00,0.00,'','appid:appid|mch_id:mch_id|signkey:signkey|防封域名（可选）:refer',0,0,'[]',0,2,'微信公众支付',1,'','https://pay.weixin.qq.com',1,0),(14,'微信支付','WxpayScan','',0,'','','','','','','',0.0200,0.0000,0.0060,0.0150,1,0.00,0.00,'','appid:appid|mch_id:mch_id|signkey:signkey|notify_url:notify_url|防封域名（可选）:refer',0,6,'[]',0,1,'微信扫码',2,'','https://pay.weixin.qq.com',1,0),(15,'QQ钱包支付','QqNative','',0,'','','','','','','',0.0300,0.0300,0.0100,0.0200,1,0.00,0.00,'','mch_id:mch_id|key:key|防封域名（可选）:refer',0,0,'[]',0,8,'官方QQ扫码',0,'','',1,0),(16,'聚合支付','Juhezhifu','',0,'','','','','','','',0.0200,0.0000,0.0070,0.0000,1,0.00,0.00,'','商户Id:memberid|商户密钥:key|产品编号:bankcode|网关地址:geteway|防封域名（可选）:refer',0,0,'[]',0,18,'聚合支付',0,'','',1,0),(17,'易支付（支付宝）','EpayAli','',0,'','','','','','','',0.0200,0.0000,0.0100,0.0150,1,0.00,0.00,'','悠久支付商户Id:pid|易支付商户密钥:key',0,0,'[]',0,23,'易支付支付宝',0,'','https://www.mfxw.cc',1,0),(18,'易支付（微信）','EpayWx','',0,'','','','','','','',0.0200,0.0000,0.0100,0.0150,1,0.00,0.00,'','悠久支付商户Id:pid|易支付商户密钥:key',0,0,'[]',0,20,'易支付微信',0,'','https://www.mfxw.cc',1,0),(19,'易支付QQ钱包','EpayQq','',0,'','','','','','','',0.0200,0.0000,0.0100,0.0150,1,0.00,0.00,'','悠久支付商户Id:pid|易支付商户密钥:key',0,0,'[]',0,21,'易支付QQ钱包',0,'','https://www.mfxw.cc',1,0),(20,'微信H5','WxpayH6','',0,'','','','','','','',0.0200,0.0000,0.0060,0.0150,1,0.00,0.00,'','appid:appid|mch_id:mch_id|signkey:signkey|防封域名（可选）:refer',0,0,'[]',0,2,'',1,'','https://pay.weixin.qq.com',1,0),(21,'微信公众支付','WxpayJs','',0,'','','','','','','',0.0200,0.0400,0.0100,0.0150,1,0.00,0.00,'','appid:appid|mch_id:mch_id|signkey:signkey|notify_url:notify_url|防封域名（可选）:refer',0,0,'[]',0,22,'',1,'','https://pay.weixin.qq.com',1,0);
/*!40000 ALTER TABLE `channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channel_account`
--

DROP TABLE IF EXISTS `channel_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channel_account` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `channel_id` int(10) unsigned NOT NULL COMMENT '渠道ID',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '账户名',
  `params` text NOT NULL COMMENT '参数',
  `max_money` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '下线额度',
  `cur_money` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '当前额度',
  `limit_time` varchar(19) NOT NULL DEFAULT '' COMMENT '限时',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态 1启用 0禁用',
  `lowrate` decimal(10,4) unsigned NOT NULL DEFAULT '0.0000' COMMENT '充值费率',
  `highrate` decimal(10,4) unsigned NOT NULL DEFAULT '0.0000' COMMENT '封顶费率',
  `costrate` decimal(10,4) unsigned NOT NULL DEFAULT '0.0000' COMMENT '成本费率',
  `rate_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '费率设置 0 继承接口  1单独设置',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel_account`
--

LOCK TABLES `channel_account` WRITE;
/*!40000 ALTER TABLE `channel_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `channel_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complaint`
--

DROP TABLE IF EXISTS `complaint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `complaint` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `trade_no` char(50) NOT NULL DEFAULT '',
  `type` varchar(20) NOT NULL DEFAULT '',
  `qq` varchar(15) NOT NULL DEFAULT '',
  `mobile` varchar(15) NOT NULL DEFAULT '',
  `desc` varchar(1000) NOT NULL DEFAULT '',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0待处理 1已处理',
  `admin_read` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '管理员查看状态',
  `create_at` int(10) unsigned NOT NULL,
  `create_ip` varchar(15) NOT NULL DEFAULT '',
  `pwd` char(10) NOT NULL DEFAULT '123456' COMMENT '投诉单查询密码',
  `result` tinyint(4) NOT NULL DEFAULT '0' COMMENT '申诉结果',
  `expire_at` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '申诉过期时间',
  `proxy_user_id` int(11) DEFAULT '0' COMMENT '代理用户',
  `buyer_id` int(11) NOT NULL DEFAULT '0' COMMENT '买家ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complaint`
--

LOCK TABLES `complaint` WRITE;
/*!40000 ALTER TABLE `complaint` DISABLE KEYS */;
/*!40000 ALTER TABLE `complaint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complaint_message`
--

DROP TABLE IF EXISTS `complaint_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `complaint_message` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `trade_no` varchar(255) NOT NULL DEFAULT '0' COMMENT '投诉所属订单',
  `from` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发送人，0为管理员发送的消息',
  `content` varchar(1024) NOT NULL DEFAULT '' COMMENT '对话内容',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '0未读  1已读',
  `create_at` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发送时间',
  `content_type` varchar(255) NOT NULL DEFAULT '0' COMMENT '投诉内容类型：0：文本消息，1：图片消息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='投诉会话信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complaint_message`
--

LOCK TABLES `complaint_message` WRITE;
/*!40000 ALTER TABLE `complaint_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `complaint_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_code`
--

DROP TABLE IF EXISTS `email_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_code` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL DEFAULT '' COMMENT '邮箱',
  `screen` varchar(30) NOT NULL DEFAULT '' COMMENT '场景',
  `code` char(6) NOT NULL DEFAULT '' COMMENT '验证码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态：0：未使用 1：已使用',
  `create_at` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_code`
--

LOCK TABLES `email_code` WRITE;
/*!40000 ALTER TABLE `email_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods`
--

DROP TABLE IF EXISTS `goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `cate_id` int(10) unsigned NOT NULL,
  `theme` varchar(15) NOT NULL DEFAULT 'default' COMMENT '主题',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `name` varchar(500) NOT NULL DEFAULT '',
  `price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `cost_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '成本价',
  `wholesale_discount` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '批发优惠',
  `wholesale_discount_list` text NOT NULL COMMENT '批发价',
  `limit_quantity` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '起购数量',
  `inventory_notify` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '库存预警 0表示不报警',
  `inventory_notify_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '库存预警通知方式 1站内信 2邮件',
  `coupon_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '优惠券 0不支持 1支持',
  `sold_notify` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '售出通知',
  `take_card_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '取卡密码 0关闭 1必填 2选填',
  `visit_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '访问密码',
  `visit_password` varchar(30) NOT NULL DEFAULT '' COMMENT '访问密码',
  `contact_limit` enum('mobile','email','qq','any','default') NOT NULL DEFAULT 'default',
  `content` varchar(200) NOT NULL DEFAULT '' COMMENT '商品说明',
  `remark` varchar(200) NOT NULL DEFAULT '',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0下架 1上架',
  `create_at` int(10) unsigned NOT NULL DEFAULT '0',
  `is_freeze` tinyint(4) DEFAULT '0',
  `sms_payer` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '短信付费方：0买家 1商户',
  `delete_at` int(11) DEFAULT NULL COMMENT '删除标记',
  `proxy_code` varchar(100) DEFAULT '',
  `is_proxy` tinyint(4) NOT NULL DEFAULT '0',
  `can_proxy` int(11) NOT NULL DEFAULT '0',
  `proxy_id` int(20) NOT NULL DEFAULT '0',
  `proxy_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `proxy_pid` int(11) NOT NULL COMMENT '上级商家id',
  `proxy_disabled` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0:不禁止 1 禁止用户接入',
  `proxy_price_add` decimal(10,2) NOT NULL COMMENT '代理加价',
  `ckfs` int(1) DEFAULT '0' COMMENT '出卡方式',
  `mobile_theme` varchar(100) DEFAULT 'default' COMMENT '手机模板',
  `jsval` int(2) DEFAULT '0' COMMENT '自选择角色',
  `videourl` text COMMENT '视频地址',
  `goodstg_class` int(4) DEFAULT NULL COMMENT '推广分类',
  `goodstg_status` int(1) DEFAULT '0' COMMENT '是否推广',
  `goodstg_type` int(1) DEFAULT '1' COMMENT '推广地址',
  `goodstg_img` varchar(200) DEFAULT NULL COMMENT '推广图片',
  `goodstg_content` text COMMENT '推广说明',
  `goodstg_sh_status` int(1) DEFAULT '0' COMMENT '推广审核',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods`
--

LOCK TABLES `goods` WRITE;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_card`
--

DROP TABLE IF EXISTS `goods_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods_card` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `goods_id` int(10) unsigned NOT NULL,
  `number` varchar(500) NOT NULL DEFAULT '',
  `secret` varchar(500) NOT NULL DEFAULT '',
  `status` tinyint(3) NOT NULL DEFAULT '1' COMMENT '0不可用 1可用 2已使用',
  `create_at` int(10) unsigned NOT NULL DEFAULT '0',
  `delete_at` int(11) DEFAULT NULL COMMENT '删除标记',
  `sell_time` int(11) DEFAULT NULL COMMENT '售出时间',
  `you` int(1) DEFAULT '0' COMMENT '是否优先',
  PRIMARY KEY (`id`),
  KEY `goods_card_user_id_index` (`user_id`),
  KEY `goods_card_goods_id_index` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_card`
--

LOCK TABLES `goods_card` WRITE;
/*!40000 ALTER TABLE `goods_card` DISABLE KEYS */;
/*!40000 ALTER TABLE `goods_card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_category`
--

DROP TABLE IF EXISTS `goods_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `name` varchar(100) NOT NULL,
  `sort` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL,
  `create_at` int(10) unsigned NOT NULL,
  `theme` varchar(15) NOT NULL DEFAULT 'default' COMMENT '主题',
  `qq` varchar(20) DEFAULT '' COMMENT '客服QQ',
  `url` varchar(200) DEFAULT '' COMMENT '网址',
  `mobile_theme` varchar(100) DEFAULT 'default' COMMENT '手机模板',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_category`
--

LOCK TABLES `goods_category` WRITE;
/*!40000 ALTER TABLE `goods_category` DISABLE KEYS */;
INSERT INTO `goods_category` VALUES (1,10443,'ceshi',0,1,1654791421,'default','123456','','default');
/*!40000 ALTER TABLE `goods_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_chi`
--

DROP TABLE IF EXISTS `goods_chi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods_chi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `token` varchar(200) DEFAULT NULL,
  `istop` int(1) DEFAULT '0',
  `kefu` varchar(200) DEFAULT NULL,
  `toptime` int(11) DEFAULT NULL,
  `yw` varchar(200) DEFAULT NULL,
  `content` text,
  `addtime` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT '0' COMMENT '审核状态',
  `zdtime` int(11) DEFAULT '0' COMMENT '置顶时间',
  `sorts` int(4) DEFAULT '0' COMMENT '排序',
  `flsorts` int(4) DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_chi`
--

LOCK TABLES `goods_chi` WRITE;
/*!40000 ALTER TABLE `goods_chi` DISABLE KEYS */;
/*!40000 ALTER TABLE `goods_chi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_chi_price`
--

DROP TABLE IF EXISTS `goods_chi_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods_chi_price` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `money` decimal(10,2) DEFAULT '0.00',
  `hours` int(11) NOT NULL DEFAULT '0',
  `colors` varchar(20) NOT NULL,
  `status` int(1) DEFAULT '0' COMMENT '审核状态',
  `sorts` int(4) DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_chi_price`
--

LOCK TABLES `goods_chi_price` WRITE;
/*!40000 ALTER TABLE `goods_chi_price` DISABLE KEYS */;
INSERT INTO `goods_chi_price` VALUES (3,'年费置顶',1.00,1,'#f00',1,0),(4,'官方推荐',2.00,24,'#0ff',1,0),(5,'畅销产品',48.00,48,'#f0f',1,0);
/*!40000 ALTER TABLE `goods_chi_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_coupon`
--

DROP TABLE IF EXISTS `goods_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods_coupon` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `cate_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '全部',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '类型 1、元  100、%',
  `amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `code` varchar(255) NOT NULL DEFAULT '',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '备注',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '1未使用 2已用',
  `expire_at` int(10) unsigned NOT NULL,
  `create_at` int(10) unsigned NOT NULL,
  `delete_at` int(11) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_coupon`
--

LOCK TABLES `goods_coupon` WRITE;
/*!40000 ALTER TABLE `goods_coupon` DISABLE KEYS */;
/*!40000 ALTER TABLE `goods_coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goodstgclass`
--

DROP TABLE IF EXISTS `goodstgclass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goodstgclass` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `path` varchar(1024) NOT NULL,
  `name` varchar(30) NOT NULL DEFAULT '',
  `alias` varchar(30) NOT NULL DEFAULT '',
  `remark` varchar(255) NOT NULL DEFAULT '',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `create_at` int(10) unsigned NOT NULL,
  `update_at` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goodstgclass`
--

LOCK TABLES `goodstgclass` WRITE;
/*!40000 ALTER TABLE `goodstgclass` DISABLE KEYS */;
INSERT INTO `goodstgclass` VALUES (1,0,'0','系统公告','notice','系统公告',1,1520268395,0),(2,0,'0','常见问题','faq','常见问题',1,1520268562,0);
/*!40000 ALTER TABLE `goodstgclass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goodstggg`
--

DROP TABLE IF EXISTS `goodstggg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goodstggg` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '名称',
  `images` varchar(100) NOT NULL DEFAULT '' COMMENT '菜单图标',
  `url` varchar(400) NOT NULL DEFAULT '' COMMENT '链接',
  `target` varchar(20) NOT NULL DEFAULT '_self' COMMENT '链接打开方式',
  `classid` int(4) NOT NULL DEFAULT '1',
  `content` text,
  `sort` int(11) unsigned DEFAULT '0' COMMENT '菜单排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态(0:禁用,1:启用)',
  `create_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_end` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '到期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='推广广告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goodstggg`
--

LOCK TABLES `goodstggg` WRITE;
/*!40000 ALTER TABLE `goodstggg` DISABLE KEYS */;
/*!40000 ALTER TABLE `goodstggg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invite_code`
--

DROP TABLE IF EXISTS `invite_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invite_code` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL COMMENT '所有者ID',
  `code` char(32) NOT NULL DEFAULT '' COMMENT '邀请码',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '使用状态 0未使用 1已使用',
  `invite_uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '受邀用户ID',
  `invite_at` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '邀请时间',
  `create_at` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `expire_at` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invite_code`
--

LOCK TABLES `invite_code` WRITE;
/*!40000 ALTER TABLE `invite_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `invite_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip`
--

DROP TABLE IF EXISTS `ip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ip` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(20) NOT NULL DEFAULT '',
  `counts` int(10) unsigned NOT NULL,
  `address` varchar(200) DEFAULT '',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `create_at` int(10) unsigned DEFAULT NULL,
  `dongjie_at` int(10) unsigned DEFAULT NULL,
  `update_at` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip`
--

LOCK TABLES `ip` WRITE;
/*!40000 ALTER TABLE `ip` DISABLE KEYS */;
/*!40000 ALTER TABLE `ip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jifengoods`
--

DROP TABLE IF EXISTS `jifengoods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jifengoods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `img` varchar(200) DEFAULT NULL,
  `money` int(11) DEFAULT '0',
  `counts` int(4) DEFAULT '0',
  `content` text,
  `status` int(1) DEFAULT '0',
  `addtime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jifengoods`
--

LOCK TABLES `jifengoods` WRITE;
/*!40000 ALTER TABLE `jifengoods` DISABLE KEYS */;
/*!40000 ALTER TABLE `jifengoods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jifenorders`
--

DROP TABLE IF EXISTS `jifenorders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jifenorders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `orderid` varchar(50) DEFAULT NULL,
  `money` int(11) DEFAULT NULL,
  `goodsname` varchar(200) DEFAULT NULL,
  `goodsid` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `addtime` int(11) DEFAULT NULL,
  `username` varchar(200) DEFAULT NULL,
  `tel` varchar(50) DEFAULT NULL,
  `address` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jifenorders`
--

LOCK TABLES `jifenorders` WRITE;
/*!40000 ALTER TABLE `jifenorders` DISABLE KEYS */;
/*!40000 ALTER TABLE `jifenorders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `link`
--

DROP TABLE IF EXISTS `link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `link` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `relation_type` varchar(20) NOT NULL DEFAULT '',
  `relation_id` int(10) unsigned NOT NULL DEFAULT '0',
  `token` char(16) NOT NULL DEFAULT '',
  `url` varchar(100) NOT NULL DEFAULT '',
  `short_url` varchar(30) NOT NULL,
  `status` tinyint(3) unsigned NOT NULL,
  `create_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`relation_type`,`relation_id`),
  UNIQUE KEY `token_uindex` (`token`),
  UNIQUE KEY `user_link_index` (`relation_id`,`relation_type`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `link`
--

LOCK TABLES `link` WRITE;
/*!40000 ALTER TABLE `link` DISABLE KEYS */;
INSERT INTO `link` VALUES (1,10443,'goods_category',1,'B15819B8E61C2B46','','',1,1654791426);
/*!40000 ALTER TABLE `link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `business_type` varchar(20) NOT NULL DEFAULT '' COMMENT '业务类型',
  `content` text NOT NULL COMMENT '内容',
  `ua` varchar(255) NOT NULL DEFAULT '',
  `uri` varchar(255) NOT NULL DEFAULT '',
  `create_at` int(10) unsigned NOT NULL COMMENT '记录时间',
  `create_ip` varchar(15) NOT NULL DEFAULT '' COMMENT 'ip',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `merchant_log`
--

DROP TABLE IF EXISTS `merchant_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `merchant_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ip` char(15) NOT NULL DEFAULT '' COMMENT '操作者IP地址',
  `node` char(200) NOT NULL DEFAULT '' COMMENT '当前操作节点',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '操作人用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `action` varchar(200) NOT NULL DEFAULT '' COMMENT '操作行为',
  `content` text NOT NULL COMMENT '操作内容描述',
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='系统操作日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merchant_log`
--

LOCK TABLES `merchant_log` WRITE;
/*!40000 ALTER TABLE `merchant_log` DISABLE KEYS */;
INSERT INTO `merchant_log` VALUES (1,'113.122.201.18','index/user/dologin',10443,'user','登录成功','登录成功','2022-06-09 15:49:21'),(2,'113.122.201.18','index/user/dologin',10443,'user','登录成功','登录成功','2022-06-09 15:58:16'),(3,'113.122.201.18','index/user/dologin',10443,'user','登录成功','登录成功','2022-06-09 16:15:14'),(4,'113.122.201.18','merchant/goodscategory/add',10443,'user','添加商品分类成功','添加商品分类成功，ID:1，名称:ceshi','2022-06-09 16:17:02'),(5,'113.122.201.18','merchant/zhuti/index',10443,'user','模板设置','商家设置保存成功','2022-06-09 16:17:41');
/*!40000 ALTER TABLE `merchant_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `from_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '0为管理员',
  `to_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(60) NOT NULL DEFAULT '',
  `content` varchar(1024) NOT NULL DEFAULT '',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '0未读  1已读',
  `create_at` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发送时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `migration` (`migration`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nav`
--

DROP TABLE IF EXISTS `nav`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nav` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '名称',
  `node` varchar(200) NOT NULL DEFAULT '' COMMENT '节点代码',
  `icon` varchar(100) NOT NULL DEFAULT '' COMMENT '菜单图标',
  `url` varchar(400) NOT NULL DEFAULT '' COMMENT '链接',
  `params` varchar(500) DEFAULT '' COMMENT '链接参数',
  `target` varchar(20) NOT NULL DEFAULT '_self' COMMENT '链接打开方式',
  `sort` int(11) unsigned DEFAULT '0' COMMENT '菜单排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态(0:禁用,1:启用)',
  `create_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `index_system_menu_node` (`node`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='前台导航表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nav`
--

LOCK TABLES `nav` WRITE;
/*!40000 ALTER TABLE `nav` DISABLE KEYS */;
INSERT INTO `nav` VALUES (1,0,'网站首页','','','/','','0',10,1,0,'2018-03-14 17:20:50'),(2,0,'常见问题','','','/company/faq','','0',3,1,0,'2018-03-14 17:21:11'),(3,0,'联系我们','','','/company/contact','','0',4,1,0,'2018-03-14 17:21:35'),(4,0,'订单查询','','','/orderquery','','0',0,1,0,'2018-03-14 17:22:09'),(6,0,'用户注册','','','/register','','0',0,1,0,'2018-05-01 20:24:37'),(7,0,'投诉查询','','','/complaintquery','','0',0,1,0,'2018-06-12 18:53:00');
/*!40000 ALTER TABLE `nav` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `goods_id` int(10) unsigned NOT NULL,
  `trade_no` varchar(255) DEFAULT NULL,
  `transaction_id` varchar(60) NOT NULL DEFAULT '' COMMENT '流水号',
  `paytype` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `channel_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '支付渠道',
  `channel_account_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '渠道账号',
  `pay_url` varchar(10240) NOT NULL DEFAULT '' COMMENT '付款地址',
  `pay_content_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '支付参数类型 1：二维码 2：跳转链接 3：表单',
  `goods_name` varchar(500) NOT NULL DEFAULT '' COMMENT '商品名称',
  `goods_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '商品单价',
  `goods_cost_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '成本价',
  `quantity` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '数量',
  `coupon_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否使用优惠券',
  `coupon_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '优惠券ID',
  `coupon_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '优惠价格',
  `total_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '总价（买家实付款）',
  `total_cost_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '总成本价',
  `sold_notify` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '售出通知（买家）',
  `take_card_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否需要取卡密码',
  `take_card_password` varchar(20) NOT NULL DEFAULT '' COMMENT '取卡密码',
  `contact` varchar(20) NOT NULL DEFAULT '' COMMENT '联系方式',
  `email_notify` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否邮件通知',
  `email` varchar(60) NOT NULL DEFAULT '' COMMENT '邮箱号',
  `sms_notify` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否短信通知',
  `rate` decimal(10,4) unsigned NOT NULL DEFAULT '0.0000' COMMENT '手续费率',
  `fee` decimal(10,3) unsigned NOT NULL DEFAULT '0.000' COMMENT '手续费',
  `agent_rate` decimal(10,4) unsigned NOT NULL DEFAULT '0.0000' COMMENT '代理费率',
  `agent_fee` decimal(10,3) unsigned NOT NULL DEFAULT '0.000' COMMENT '代理佣金',
  `sms_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '订单状态 0未支付 1已支付 2已关闭',
  `is_freeze` tinyint(4) NOT NULL DEFAULT '0',
  `create_at` int(10) unsigned NOT NULL COMMENT '创建时间',
  `create_ip` varchar(15) NOT NULL DEFAULT '',
  `success_at` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '支付成功时间',
  `first_query` tinyint(4) NOT NULL DEFAULT '0' COMMENT '订单第一次查询无需验证码',
  `sms_payer` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '短信付费方：0买家 1商户',
  `total_product_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '商品总价（不含短信费）',
  `sendout` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '已发货数量',
  `fee_payer` tinyint(4) NOT NULL DEFAULT '1' COMMENT '订单手续费支付方，1：商家承担，2买家承担',
  `settlement_type` tinyint(4) unsigned NOT NULL DEFAULT '1' COMMENT '结算方式，1:T1结算，0:T0结算',
  `finally_money` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '商户订单最终收入（已扣除短信费，手续费）',
  `is_proxy` tinyint(4) NOT NULL DEFAULT '0',
  `proxy_id` int(20) NOT NULL DEFAULT '0',
  `proxy_user_id` int(20) NOT NULL DEFAULT '0',
  `proxy_goods_cost_price` int(20) NOT NULL DEFAULT '0',
  `category` tinyint(10) NOT NULL DEFAULT '0' COMMENT '0 发卡订单 1 接口订单',
  `notify_url` varchar(255) NOT NULL DEFAULT '' COMMENT '接口异步回调地址',
  `return_url` varchar(255) NOT NULL DEFAULT '' COMMENT '支付成功跳转地址',
  `tongzhi` tinyint(4) NOT NULL DEFAULT '0' COMMENT '支付通知 0 未通知  1 已通知',
  `orderno` varchar(50) NOT NULL DEFAULT '' COMMENT '商户订单号',
  `c_ids` text COMMENT '角色ID',
  `c_idsss` text COMMENT '角色ID',
  `buyer_id` int(11) NOT NULL DEFAULT '0' COMMENT '买家id',
  `order_type` int(11) NOT NULL DEFAULT '0' COMMENT '商户通道类别0平台1自签',
  `cz_status` int(1) DEFAULT '0' COMMENT '充值状态表',
  PRIMARY KEY (`id`),
  KEY `order_create_at_index` (`create_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_card`
--

DROP TABLE IF EXISTS `order_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_card` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL,
  `number` varchar(500) NOT NULL DEFAULT '',
  `secret` varchar(500) NOT NULL DEFAULT '',
  `card_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `order_card_order_id_index` (`order_id`),
  KEY `order_card_card_id_index` (`card_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_card`
--

LOCK TABLES `order_card` WRITE;
/*!40000 ALTER TABLE `order_card` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_type`
--

DROP TABLE IF EXISTS `pay_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pay_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '支付名',
  `product_id` tinyint(3) NOT NULL DEFAULT '0' COMMENT '支付类型',
  `logo` varchar(100) NOT NULL DEFAULT '' COMMENT 'logo',
  `ico` varchar(100) NOT NULL DEFAULT '' COMMENT '图标',
  `is_mobile` tinyint(3) NOT NULL DEFAULT '0' COMMENT '是否手机支付',
  `is_form_data` tinyint(3) NOT NULL DEFAULT '0' COMMENT '是否 form 提交',
  `target` tinyint(3) NOT NULL DEFAULT '0' COMMENT '银行支付使用，未知作用',
  `sub_lists` text COMMENT '银行支付使用，指定支持的银行列表',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=223 DEFAULT CHARSET=utf8 COMMENT='支付类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_type`
--

LOCK TABLES `pay_type` WRITE;
/*!40000 ALTER TABLE `pay_type` DISABLE KEYS */;
INSERT INTO `pay_type` VALUES (1,'微信扫码',2,'icon_wx','icon_wx',0,0,0,NULL),(2,'微信H5',2,'icon_wx','icon_wx',1,0,0,NULL),(3,'支付宝扫码',1,'icon_zfb','icon_zfb',0,1,0,NULL),(4,'支付宝H5',1,'icon_zfb','icon_zfb',1,0,0,NULL),(5,'网银跳转',6,'icon_bank','icon_bank',0,0,0,NULL),(6,'网银直连',6,'icon_bank','icon_bank',0,0,0,NULL),(7,'百度钱包',5,'baidu_logo','baidu_ico',0,0,0,NULL),(8,'QQ钱包扫码',3,'qqrcode','qqrcode',0,0,0,NULL),(9,'京东钱包',4,'jd_logo','jd_ico',0,0,0,NULL),(10,'QQ钱包H5',3,'icon_qq','icon_qq',1,0,0,NULL),(11,'支付宝PC',1,'icon_zfb','icon_zfb',0,0,0,NULL),(12,'微信刷卡',2,'icon_wx','icon_wx',0,0,0,NULL),(13,'支付宝刷卡',1,'icon_zfb','icon_zfb',0,0,0,NULL),(14,'支付宝免签',1,'icon_zfb','icon_zfb',0,0,0,NULL),(15,'微信免签',2,'icon_wx','icon_wx',0,0,0,NULL),(16,'支付宝免签',1,'icon_zfb','icon_zfb',0,1,0,NULL),(17,'微信免签',2,'icon_wx','icon_wx',0,1,0,NULL),(18,'聚合支付',1,'icon_zfb','icon_zfb',0,0,0,NULL),(19,'支付宝当面付',1,'icon_zfb','icon_zfb',0,1,0,NULL),(20,'易支付微信',2,'icon_wx','icon_wx',0,0,0,NULL),(21,'易支付QQ钱包',3,'icon_qq','icon_qq',0,0,0,NULL),(22,'微信公众支付',2,'icon_wx','icon_wx',0,0,0,NULL),(23,'易支付支付宝',1,'icon_zfb','icon_zfb',0,0,0,NULL),(27,'码支付',7,'icon_mapay','icon_mapay',0,0,0,NULL);
/*!40000 ALTER TABLE `pay_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plug`
--

DROP TABLE IF EXISTS `plug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plug` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plug_id` int(11) DEFAULT NULL,
  `version` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plug`
--

LOCK TABLES `plug` WRITE;
/*!40000 ALTER TABLE `plug` DISABLE KEYS */;
/*!40000 ALTER TABLE `plug` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL COMMENT '通道名称',
  `code` varchar(50) NOT NULL COMMENT '通道代码',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态 1 开启 0 关闭',
  `polling` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '接口模式 0单独 1轮询',
  `channel_id` int(10) unsigned NOT NULL,
  `weight` text NOT NULL COMMENT '权重',
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '支付类型 1 微信扫码 2 微信公众号 3 支付宝扫码 4 支付宝手机 5 网银支付 6',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=908 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (901,'微信公众号','WXJSAPI',0,0,0,'[]',2),(902,'微信扫码支付','WXSCAN',0,0,0,'[]',1),(903,'支付宝扫码支付','ALISCAN',0,0,14,'[]',3),(904,'支付宝手机','ALIWAP',0,0,15,'[]',4),(907,'网银支付','DBANK',0,0,0,'[]',5);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proxy`
--

DROP TABLE IF EXISTS `proxy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proxy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户id',
  `pid` int(11) NOT NULL COMMENT '上级代理id',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态 0:待审核  1:已审核 -1:拒绝',
  `qq` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proxy`
--

LOCK TABLES `proxy` WRITE;
/*!40000 ALTER TABLE `proxy` DISABLE KEYS */;
/*!40000 ALTER TABLE `proxy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rate_group`
--

DROP TABLE IF EXISTS `rate_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rate_group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL COMMENT '分组名',
  `create_at` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `delete_at` int(10) unsigned DEFAULT NULL COMMENT '删除时间',
  `register_default` int(4) DEFAULT '0' COMMENT '默认费率',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='费率分组表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rate_group`
--

LOCK TABLES `rate_group` WRITE;
/*!40000 ALTER TABLE `rate_group` DISABLE KEYS */;
INSERT INTO `rate_group` VALUES (1,'普通费率分组',1595518534,NULL,1);
/*!40000 ALTER TABLE `rate_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rate_group_rule`
--

DROP TABLE IF EXISTS `rate_group_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rate_group_rule` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL COMMENT '分组 ID',
  `channel_id` int(11) NOT NULL COMMENT '渠道 ID',
  `rate` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '渠道费率',
  `rate_api` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '支付费率',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 1：开启 0：关闭',
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分组费率规则';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rate_group_rule`
--

LOCK TABLES `rate_group_rule` WRITE;
/*!40000 ALTER TABLE `rate_group_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `rate_group_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rate_group_user`
--

DROP TABLE IF EXISTS `rate_group_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rate_group_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL COMMENT '分组 ID',
  `user_id` int(11) NOT NULL COMMENT '用户 ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分组内用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rate_group_user`
--

LOCK TABLES `rate_group_user` WRITE;
/*!40000 ALTER TABLE `rate_group_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `rate_group_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `self_channel`
--

DROP TABLE IF EXISTS `self_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `self_channel` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '通道ID',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '通道名称',
  `code` varchar(50) NOT NULL DEFAULT '' COMMENT '通道代码',
  `code_api` varchar(50) NOT NULL DEFAULT '' COMMENT '支付接口编码',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态 1 开启 0 关闭',
  `mch_id` varchar(50) NOT NULL DEFAULT '' COMMENT '商户号',
  `signkey` varchar(255) NOT NULL DEFAULT '' COMMENT '签名KEY',
  `appid` varchar(50) NOT NULL DEFAULT '' COMMENT 'APPID(账号)',
  `appsecret` varchar(50) NOT NULL DEFAULT '' COMMENT 'APPSECRET(密钥)',
  `gateway` varchar(255) NOT NULL DEFAULT '' COMMENT '网关地址',
  `return_url` varchar(255) NOT NULL DEFAULT '' COMMENT '页面通知（优先级）',
  `notify_url` varchar(255) NOT NULL DEFAULT '' COMMENT '服务器通知（优先级）',
  `lowrate` decimal(10,4) unsigned NOT NULL DEFAULT '0.0000' COMMENT '充值费率',
  `poundage` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '手续费',
  `highrate` decimal(10,4) unsigned NOT NULL DEFAULT '0.0000' COMMENT '封顶费率',
  `costrate` decimal(10,4) unsigned NOT NULL DEFAULT '0.0000' COMMENT '成本费率',
  `rate_api` decimal(10,4) unsigned NOT NULL COMMENT '充值费率',
  `max_money` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '单笔限额 0为最高不限额',
  `min_money` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '单笔限额',
  `limit_time` varchar(19) NOT NULL DEFAULT '' COMMENT '限时',
  `account_fields` varchar(1024) NOT NULL DEFAULT '' COMMENT '账户字段',
  `placeholder_fields` varchar(1024) NOT NULL COMMENT '说明',
  `polling` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '接口模式 0单独 1轮询',
  `account_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '账号ID',
  `weight` text COMMENT '权重',
  `updatetime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '支付类型 1 微信扫码 2 微信公众号 3 支付宝扫码 4 支付宝手机 5 网银支付 6',
  `show_name` varchar(255) NOT NULL DEFAULT '' COMMENT '前台展示名称',
  `is_available` tinyint(4) NOT NULL DEFAULT '0' COMMENT '接口可用 0通用 1手机 2电脑',
  `default_fields` varchar(1024) NOT NULL DEFAULT '' COMMENT '字段默认值',
  `applyurl` varchar(255) NOT NULL DEFAULT '' COMMENT '申请地址',
  `is_install` tinyint(4) NOT NULL DEFAULT '0',
  `sort` int(10) NOT NULL DEFAULT '0' COMMENT '渠道排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `channel_code_uindex` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='自签支付供应商';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `self_channel`
--

LOCK TABLES `self_channel` WRITE;
/*!40000 ALTER TABLE `self_channel` DISABLE KEYS */;
INSERT INTO `self_channel` VALUES (1,'支付宝当面付','AlipayQr','',1,'','','','','','','',0.0000,0.0060,0.0000,0.0000,0.0000,0.00,0.00,'','alipay_public_key:alipay_public_key|merchant_private_key:merchant_private_key|app_id:app_id|防封域名（可选）:refer|回调地址:notify_url','',0,0,'',0,3,'支付宝当面支付',0,'','',1,0),(2,'微信扫码支付','WxpayScan','WxpayScan',1,'','','','','','','',0.0000,0.0060,0.0000,0.0000,0.0000,0.00,0.00,'','appid:appid|mch_id:mch_id|signkey:signkey|notify_url:notify_url|防封域名（可选）:refer','',0,0,'',0,1,'微信扫码支付',0,'','',1,0),(3,'易支付','SMaPay','SMaPay',1,'','','','','','','',0.0000,0.0060,0.0000,0.0000,0.0000,0.00,0.00,'','网关地址:gateway|商户ID:mid|商户密钥:key|回调地址:notify_url|支付种类:pay_type checkbox alipay-支付宝,wxpay-微信,qqpay-QQ钱包','notify_url=支付的回调地址，默认为 http://本站域名/notify ,也可采用第三方域名地址。',0,0,'',0,27,'易支付',0,'','https://www.mfxw.cc',1,0),(4,'码支付备用','SbMaPay','SbMaPay',1,'','','','','','','',0.0000,0.0060,0.0000,0.0000,0.0000,0.00,0.00,'','网关地址:gateway|商户ID:mid|商户密钥:key|回调地址:notify_url|支付种类:pay_type checkbox alipay-支付宝,wxpay-微信,qqpay-QQ钱包','notify_url=支付的回调地址，默认为 http://本站域名/notify ,也可采用第三方域名地址。',0,0,'',0,27,'易支付',0,'','https://www.mfxw.cc',1,0);
/*!40000 ALTER TABLE `self_channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `self_channel_account`
--

DROP TABLE IF EXISTS `self_channel_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `self_channel_account` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `channel_id` int(10) unsigned NOT NULL COMMENT '渠道ID',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '账户名',
  `params` text NOT NULL COMMENT '参数',
  `max_money` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '下线额度',
  `cur_money` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '当前额度',
  `limit_time` varchar(19) NOT NULL DEFAULT '' COMMENT '限时',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态 1启用 0禁用',
  `lowrate` decimal(10,4) unsigned NOT NULL DEFAULT '0.0000' COMMENT '充值费率',
  `highrate` decimal(10,4) unsigned NOT NULL DEFAULT '0.0000' COMMENT '封顶费率',
  `costrate` decimal(10,4) unsigned NOT NULL DEFAULT '0.0000' COMMENT '成本费率',
  `rate_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '费率设置 0 继承接口  1单独设置',
  `user_id` int(11) NOT NULL COMMENT '商户ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `self_channel_account`
--

LOCK TABLES `self_channel_account` WRITE;
/*!40000 ALTER TABLE `self_channel_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `self_channel_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_code`
--

DROP TABLE IF EXISTS `sms_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_code` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mobile` varchar(15) NOT NULL DEFAULT '' COMMENT '手机号',
  `screen` varchar(30) NOT NULL DEFAULT '' COMMENT '场景',
  `code` char(6) NOT NULL DEFAULT '' COMMENT '验证码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态：0：未使用 1：已使用',
  `create_at` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `create_ip` varchar(255) NOT NULL DEFAULT '' COMMENT '请求 ip',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_code`
--

LOCK TABLES `sms_code` WRITE;
/*!40000 ALTER TABLE `sms_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `srate_group`
--

DROP TABLE IF EXISTS `srate_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `srate_group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL COMMENT '分组名',
  `create_at` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `delete_at` int(10) unsigned DEFAULT NULL COMMENT '删除时间',
  `register_default` int(4) DEFAULT '0' COMMENT '默认费率',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='自签费率分组表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `srate_group`
--

LOCK TABLES `srate_group` WRITE;
/*!40000 ALTER TABLE `srate_group` DISABLE KEYS */;
INSERT INTO `srate_group` VALUES (6,'默认分组',1630817300,NULL,0);
/*!40000 ALTER TABLE `srate_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `srate_group_rule`
--

DROP TABLE IF EXISTS `srate_group_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `srate_group_rule` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL COMMENT '分组 ID',
  `channel_id` int(11) NOT NULL COMMENT '渠道 ID',
  `rate` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '渠道费率',
  `rate_api` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '支付费率',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 1：开启 0：关闭',
  `poundage` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '手续费',
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='自签分组费率规则';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `srate_group_rule`
--

LOCK TABLES `srate_group_rule` WRITE;
/*!40000 ALTER TABLE `srate_group_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `srate_group_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `srate_group_user`
--

DROP TABLE IF EXISTS `srate_group_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `srate_group_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL COMMENT '分组 ID',
  `user_id` int(11) NOT NULL COMMENT '用户 ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分组内用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `srate_group_user`
--

LOCK TABLES `srate_group_user` WRITE;
/*!40000 ALTER TABLE `srate_group_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `srate_group_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_auth`
--

DROP TABLE IF EXISTS `system_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_auth` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL COMMENT '权限名称',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态(1:禁用,2:启用)',
  `sort` smallint(6) unsigned DEFAULT '0' COMMENT '排序权重',
  `desc` varchar(255) DEFAULT NULL COMMENT '备注说明',
  `create_by` bigint(11) unsigned DEFAULT '0' COMMENT '创建人',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_system_auth_title` (`title`) USING BTREE,
  KEY `index_system_auth_status` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='系统权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_auth`
--

LOCK TABLES `system_auth` WRITE;
/*!40000 ALTER TABLE `system_auth` DISABLE KEYS */;
INSERT INTO `system_auth` VALUES (3,'超级管理员',1,2,'超级管理员',0,'2018-04-02 11:24:49'),(4,'客服',1,3,'处理转账投诉',0,'2019-06-01 05:40:47'),(5,'全部权限',1,1,'全部权限',0,'2019-06-01 05:45:22'),(6,'seo权限',1,4,'seo权限',0,'2019-07-10 08:45:03');
/*!40000 ALTER TABLE `system_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_auth_node`
--

DROP TABLE IF EXISTS `system_auth_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_auth_node` (
  `auth` bigint(20) unsigned DEFAULT NULL COMMENT '角色ID',
  `node` varchar(200) DEFAULT NULL COMMENT '节点路径',
  KEY `index_system_auth_auth` (`auth`) USING BTREE,
  KEY `index_system_auth_node` (`node`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色与节点关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_auth_node`
--

LOCK TABLES `system_auth_node` WRITE;
/*!40000 ALTER TABLE `system_auth_node` DISABLE KEYS */;
INSERT INTO `system_auth_node` VALUES (3,'admin'),(3,'admin/config'),(3,'admin/config/index'),(3,'admin/config/file'),(3,'admin/log'),(3,'admin/log/index'),(3,'admin/log/del'),(3,'admin/menu'),(3,'admin/menu/index'),(3,'admin/menu/add'),(3,'admin/menu/edit'),(3,'admin/menu/del'),(3,'admin/menu/forbid'),(3,'admin/menu/resume'),(3,'admin/mlog'),(3,'admin/mlog/index'),(3,'admin/mlog/del'),(3,'admin/nav'),(3,'admin/nav/index'),(3,'admin/nav/add'),(3,'admin/nav/edit'),(3,'admin/nav/del'),(3,'admin/nav/forbid'),(3,'admin/nav/resume'),(3,'admin/user'),(3,'admin/user/index'),(3,'admin/user/auth'),(3,'admin/user/add'),(3,'admin/user/edit'),(3,'admin/user/del'),(3,'admin/user/forbid'),(3,'admin/user/resume'),(3,'manage'),(3,'manage/article'),(3,'manage/article/index'),(3,'manage/article/add'),(3,'manage/article/edit'),(3,'manage/article/change_status'),(3,'manage/article/del'),(3,'manage/articlecategory'),(3,'manage/articlecategory/index'),(3,'manage/articlecategory/add'),(3,'manage/articlecategory/edit'),(3,'manage/articlecategory/change_status'),(3,'manage/articlecategory/del'),(3,'manage/backup'),(3,'manage/backup/index'),(3,'manage/backup/tablist'),(3,'manage/backup/backall'),(3,'manage/backup/backtables'),(3,'manage/backup/recover'),(3,'manage/backup/deletebak'),(3,'manage/backup/downloadbak'),(3,'manage/cash'),(3,'manage/cash/index'),(3,'manage/cash/config'),(3,'manage/cash/detail'),(3,'manage/channel'),(3,'manage/channel/index'),(3,'manage/channel/add'),(3,'manage/channel/edit'),(3,'manage/channel/del'),(3,'manage/channel/change_status'),(3,'manage/channel/getlistbypaytype'),(3,'manage/channelaccount'),(3,'manage/channelaccount/index'),(3,'manage/channelaccount/add'),(3,'manage/channelaccount/edit'),(3,'manage/channelaccount/del'),(3,'manage/channelaccount/clear'),(3,'manage/channelaccount/change_status'),(3,'manage/channelaccount/getfields'),(3,'manage/complaint'),(3,'manage/complaint/index'),(3,'manage/complaint/change_status'),(3,'manage/complaint/change_admin_read'),(3,'manage/complaint/del'),(3,'manage/email'),(3,'manage/email/index'),(3,'manage/email/test'),(3,'manage/goods'),(3,'manage/goods/index'),(3,'manage/goods/change_status'),(3,'manage/index'),(3,'manage/index/main'),(3,'manage/invitecode'),(3,'manage/invitecode/index'),(3,'manage/invitecode/add'),(3,'manage/invitecode/del'),(3,'manage/invitecode/delnum'),(3,'manage/log'),(3,'manage/log/user_money'),(3,'manage/order'),(3,'manage/order/index'),(3,'manage/order/detail'),(3,'manage/order/merchant'),(3,'manage/order/channel'),(3,'manage/order/hour'),(3,'manage/order/change_freeze_status'),(3,'manage/order/del'),(3,'manage/order/del_batch'),(3,'manage/product'),(3,'manage/product/index'),(3,'manage/product/add'),(3,'manage/product/edit'),(3,'manage/product/del'),(3,'manage/product/change_status'),(3,'manage/site'),(3,'manage/site/info'),(3,'manage/site/domain'),(3,'manage/site/register'),(3,'manage/site/wordfilter'),(3,'manage/site/spread'),(3,'manage/sms'),(3,'manage/sms/index'),(3,'manage/user'),(3,'manage/user/index'),(3,'manage/user/change_status'),(3,'manage/user/change_freeze_status'),(3,'manage/user/detail'),(3,'manage/user/add'),(3,'manage/user/edit'),(3,'manage/user/del'),(3,'manage/user/manage_money'),(3,'manage/user/rate'),(3,'manage/user/login'),(3,'manage/user/message'),(3,'manage/user/loginlog'),(3,'manage/user/unlock'),(3,'wechat'),(3,'wechat/config'),(3,'wechat/config/index'),(3,'wechat/config/pay'),(3,'wechat/fans'),(3,'wechat/fans/index'),(3,'wechat/fans/back'),(3,'wechat/fans/backadd'),(3,'wechat/fans/tagset'),(3,'wechat/fans/backdel'),(3,'wechat/fans/tagadd'),(3,'wechat/fans/tagdel'),(3,'wechat/fans/sync'),(3,'wechat/keys'),(3,'wechat/keys/index'),(3,'wechat/keys/add'),(3,'wechat/keys/edit'),(3,'wechat/keys/del'),(3,'wechat/keys/forbid'),(3,'wechat/keys/resume'),(3,'wechat/keys/subscribe'),(3,'wechat/keys/defaults'),(3,'wechat/menu'),(3,'wechat/menu/index'),(3,'wechat/menu/edit'),(3,'wechat/menu/cancel'),(3,'wechat/news'),(3,'wechat/news/index'),(3,'wechat/news/select'),(3,'wechat/news/image'),(3,'wechat/news/add'),(3,'wechat/news/edit'),(3,'wechat/news/del'),(3,'wechat/news/push'),(3,'wechat/tags'),(3,'wechat/tags/index'),(3,'wechat/tags/add'),(3,'wechat/tags/edit'),(3,'wechat/tags/sync'),(3,'admin/node'),(3,'admin/node/save'),(3,'admin/node/save'),(3,'admin/auth'),(3,'admin/auth/index'),(3,'admin/auth/apply'),(3,'admin/auth/add'),(3,'admin/auth/edit'),(3,'admin/auth/forbid'),(3,'admin/auth/resume'),(3,'admin/auth/del'),(3,'admin/auth/bindgoogle'),(3,'admin/node'),(3,'admin/node/save'),(3,'admin/node/index'),(5,'admin'),(5,'admin/app'),(5,'admin/app/index'),(5,'admin/app/xieyi'),(5,'admin/app/xieyiok'),(5,'admin/auth'),(5,'admin/auth/index'),(5,'admin/auth/apply'),(5,'admin/auth/add'),(5,'admin/auth/edit'),(5,'admin/auth/forbid'),(5,'admin/auth/resume'),(5,'admin/auth/del'),(5,'admin/auth/bindgoogle'),(5,'admin/auth/xieyi'),(5,'admin/auth/xieyiok'),(5,'admin/config'),(5,'admin/config/index'),(5,'admin/config/file'),(5,'admin/config/xieyi'),(5,'admin/config/xieyiok'),(5,'admin/goodstgclass'),(5,'admin/goodstgclass/index'),(5,'admin/goodstgclass/add'),(5,'admin/goodstgclass/edit'),(5,'admin/goodstgclass/change_status'),(5,'admin/goodstgclass/del'),(5,'admin/goodstgclass/xieyi'),(5,'admin/goodstgclass/xieyiok'),(5,'admin/goodstggg'),(5,'admin/goodstggg/index'),(5,'admin/goodstggg/add'),(5,'admin/goodstggg/ady'),(5,'admin/goodstggg/edit'),(5,'admin/goodstggg/change_status'),(5,'admin/goodstggg/del'),(5,'admin/goodstggg/top'),(5,'admin/goodstggg/xieyi'),(5,'admin/goodstggg/xieyiok'),(5,'admin/goodstggl'),(5,'admin/goodstggl/index'),(5,'admin/goodstggl/detail'),(5,'admin/goodstggl/goodshsz'),(5,'admin/goodstggl/goodschi'),(5,'admin/goodstggl/goodschiprice'),(5,'admin/goodstggl/chipriceadd'),(5,'admin/goodstggl/chipriceedit'),(5,'admin/goodstggl/delchiprice'),(5,'admin/goodstggl/change_status'),(5,'admin/goodstggl/change_tgshstatus'),(5,'admin/goodstggl/change_freeze'),(5,'admin/goodstggl/change_trade_no_status'),(5,'admin/goodstggl/del'),(5,'admin/goodstggl/deldel'),(5,'admin/goodstggl/delhui'),(5,'admin/goodstggl/delbatchhsz'),(5,'admin/goodstggl/zdchi'),(5,'admin/goodstggl/shchi'),(5,'admin/goodstggl/shallchi'),(5,'admin/goodstggl/delchi'),(5,'admin/goodstggl/xieyi'),(5,'admin/goodstggl/xieyiok'),(5,'admin/goodstgset'),(5,'admin/goodstgset/index'),(5,'admin/goodstgset/xieyi'),(5,'admin/goodstgset/xieyiok'),(5,'admin/ip'),(5,'admin/ip/index'),(5,'admin/ip/forbid'),(5,'admin/ip/resume'),(5,'admin/ip/xieyi'),(5,'admin/ip/xieyiok'),(5,'admin/log'),(5,'admin/log/index'),(5,'admin/log/del'),(5,'admin/log/xieyi'),(5,'admin/log/xieyiok'),(5,'admin/menu'),(5,'admin/menu/index'),(5,'admin/menu/add'),(5,'admin/menu/edit'),(5,'admin/menu/del'),(5,'admin/menu/forbid'),(5,'admin/menu/resume'),(5,'admin/menu/xieyi'),(5,'admin/menu/xieyiok'),(5,'admin/mlog'),(5,'admin/mlog/index'),(5,'admin/mlog/del'),(5,'admin/mlog/xieyi'),(5,'admin/mlog/xieyiok'),(5,'admin/nav'),(5,'admin/nav/index'),(5,'admin/nav/add'),(5,'admin/nav/edit'),(5,'admin/nav/del'),(5,'admin/nav/forbid'),(5,'admin/nav/resume'),(5,'admin/nav/xieyi'),(5,'admin/nav/xieyiok'),(5,'admin/node'),(5,'admin/node/index'),(5,'admin/node/save'),(5,'admin/node/xieyi'),(5,'admin/node/xieyiok'),(5,'admin/plug'),(5,'admin/plug/index'),(5,'admin/plug/gettophost'),(5,'admin/plug/getversion'),(5,'admin/plug/upgrade'),(5,'admin/renzheng'),(5,'admin/renzheng/index'),(5,'admin/renzheng/xieyi'),(5,'admin/renzheng/xieyiok'),(5,'admin/shang'),(5,'admin/shang/setting'),(5,'admin/shang/index'),(5,'admin/shang/add'),(5,'admin/shang/edit'),(5,'admin/shang/change_status'),(5,'admin/shang/del'),(5,'admin/shang/delorder'),(5,'admin/shang/fahuo'),(5,'admin/shang/orders'),(5,'admin/shang/xieyi'),(5,'admin/shang/xieyiok'),(5,'admin/shengji'),(5,'admin/shengji/index'),(5,'admin/shengji/upgrade'),(5,'admin/test'),(5,'admin/test/google'),(5,'admin/test/send_code'),(5,'admin/test/checkcode'),(5,'admin/test/send_ecode'),(5,'admin/test/checkecode'),(5,'admin/user'),(5,'admin/user/index'),(5,'admin/user/auth'),(5,'admin/user/add'),(5,'admin/user/edit'),(5,'admin/user/pass'),(5,'admin/user/del'),(5,'admin/user/forbid'),(5,'admin/user/resume'),(5,'admin/user/xieyi'),(5,'admin/user/xieyiok'),(5,'admin/video'),(5,'admin/video/index'),(5,'admin/video/add'),(5,'admin/video/edit'),(5,'admin/video/del'),(5,'admin/video/forbid'),(5,'admin/video/resume'),(5,'admin/video/xieyi'),(5,'admin/video/xieyiok'),(5,'buyer'),(5,'buyer/cash'),(5,'buyer/cash/index'),(5,'buyer/cash/apply'),(5,'buyer/complaint'),(5,'buyer/complaint/index'),(5,'buyer/complaint/detail'),(5,'buyer/complaint/send'),(5,'buyer/complaint/sendimg'),(5,'buyer/complaint/changestatus'),(5,'buyer/complaint/complaintcancel'),(5,'buyer/index'),(5,'buyer/index/index'),(5,'buyer/order'),(5,'buyer/order/index'),(5,'buyer/order/cards'),(5,'buyer/order/dumpcards'),(5,'buyer/order/channelstatis'),(5,'buyer/order/fetchcard'),(5,'buyer/renzheng'),(5,'buyer/renzheng/index'),(5,'buyer/renzheng/pay'),(5,'buyer/renzheng/payok'),(5,'buyer/renzheng/paysw'),(5,'buyer/renzheng/payswok'),(5,'buyer/renzheng/buildform'),(5,'buyer/renzheng/api51_curl'),(5,'buyer/renzheng/sanwangyanzheng'),(5,'buyer/user'),(5,'buyer/user/settings'),(5,'buyer/user/balance'),(5,'buyer/user/password'),(5,'buyer/user/collect'),(5,'buyer/user/sendsmscode'),(5,'demo'),(5,'demo/plugs'),(5,'demo/plugs/file'),(5,'demo/plugs/region'),(5,'demo/plugs/editor'),(5,'manage'),(5,'manage/article'),(5,'manage/article/index'),(5,'manage/article/add'),(5,'manage/article/edit'),(5,'manage/article/change_status'),(5,'manage/article/del'),(5,'manage/article/top'),(5,'manage/article/xieyi'),(5,'manage/article/xieyiok'),(5,'manage/articlecategory'),(5,'manage/articlecategory/index'),(5,'manage/articlecategory/add'),(5,'manage/articlecategory/edit'),(5,'manage/articlecategory/change_status'),(5,'manage/articlecategory/del'),(5,'manage/articlecategory/xieyi'),(5,'manage/articlecategory/xieyiok'),(5,'manage/audit'),(5,'manage/audit/index'),(5,'manage/audit/del'),(5,'manage/audit/edit'),(5,'manage/audit/xieyi'),(5,'manage/audit/xieyiok'),(5,'manage/backup'),(5,'manage/backup/index'),(5,'manage/backup/tablist'),(5,'manage/backup/backall'),(5,'manage/backup/backtables'),(5,'manage/backup/recover'),(5,'manage/backup/deletebak'),(5,'manage/backup/downloadbak'),(5,'manage/backup/xieyi'),(5,'manage/backup/xieyiok'),(5,'manage/buyer'),(5,'manage/buyer/index'),(5,'manage/buyer/add'),(5,'manage/buyer/edit'),(5,'manage/buyer/login'),(5,'manage/buyer/del'),(5,'manage/buyer/manage_money'),(5,'manage/buyer/change_status'),(5,'manage/buyer/change_freeze_status'),(5,'manage/buyer/xieyi'),(5,'manage/buyer/xieyiok'),(5,'manage/cash'),(5,'manage/cash/getcashdata'),(5,'manage/cash/index'),(5,'manage/cash/dumpcashs'),(5,'manage/cash/config'),(5,'manage/cash/detail'),(5,'manage/cash/daifu'),(5,'manage/cash/pay_batch'),(5,'manage/cash/batch_del'),(5,'manage/cash/xieyi'),(5,'manage/cash/xieyiok'),(5,'manage/cashchannel'),(5,'manage/cashchannel/index'),(5,'manage/cashchannel/change_status'),(5,'manage/cashchannel/xieyi'),(5,'manage/cashchannel/xieyiok'),(5,'manage/cashchannelaccount'),(5,'manage/cashchannelaccount/index'),(5,'manage/cashchannelaccount/add'),(5,'manage/cashchannelaccount/edit'),(5,'manage/cashchannelaccount/del'),(5,'manage/cashchannelaccount/clear'),(5,'manage/cashchannelaccount/change_status'),(5,'manage/cashchannelaccount/getfields'),(5,'manage/channel'),(5,'manage/channel/index'),(5,'manage/channel/add'),(5,'manage/channel/edit'),(5,'manage/channel/del'),(5,'manage/channel/change_status'),(5,'manage/channel/change_available'),(5,'manage/channel/install'),(5,'manage/channel/uninstall'),(5,'manage/channel/xieyi'),(5,'manage/channel/xieyiok'),(5,'manage/channelaccount'),(5,'manage/channelaccount/index'),(5,'manage/channelaccount/add'),(5,'manage/channelaccount/edit'),(5,'manage/channelaccount/del'),(5,'manage/channelaccount/clear'),(5,'manage/channelaccount/change_status'),(5,'manage/channelaccount/getfields'),(5,'manage/channelaccount/xieyi'),(5,'manage/channelaccount/xieyiok'),(5,'manage/complaint'),(5,'manage/complaint/index'),(5,'manage/complaint/detail'),(5,'manage/complaint/send'),(5,'manage/complaint/sendimg'),(5,'manage/complaint/win'),(5,'manage/complaint/change_status'),(5,'manage/complaint/change_admin_read'),(5,'manage/complaint/del'),(5,'manage/complaint/xieyi'),(5,'manage/complaint/xieyiok'),(5,'manage/content'),(5,'manage/content/del'),(5,'manage/email'),(5,'manage/email/index'),(5,'manage/email/test'),(5,'manage/goods'),(5,'manage/goods/index'),(5,'manage/goods/detail'),(5,'manage/goods/goodshsz'),(5,'manage/goods/goodschi'),(5,'manage/goods/goodschiprice'),(5,'manage/goods/chipriceadd'),(5,'manage/goods/chipriceedit'),(5,'manage/goods/delchiprice'),(5,'manage/goods/change_status'),(5,'manage/goods/change_freeze'),(5,'manage/goods/change_trade_no_status'),(5,'manage/goods/del'),(5,'manage/goods/deldel'),(5,'manage/goods/delhui'),(5,'manage/goods/delbatchhsz'),(5,'manage/goods/zdchi'),(5,'manage/goods/shchi'),(5,'manage/goods/shallchi'),(5,'manage/goods/delchi'),(5,'manage/goods/xieyi'),(5,'manage/goods/xieyiok'),(5,'manage/index'),(5,'manage/index/banben'),(5,'manage/index/spjc'),(5,'manage/index/video'),(5,'manage/index/main'),(5,'manage/index/xieyi'),(5,'manage/index/xieyiok'),(5,'manage/invitecode'),(5,'manage/invitecode/index'),(5,'manage/invitecode/add'),(5,'manage/invitecode/del'),(5,'manage/invitecode/delnum'),(5,'manage/invitecode/xieyi'),(5,'manage/invitecode/xieyiok'),(5,'manage/log'),(5,'manage/log/user_money'),(5,'manage/log/xieyi'),(5,'manage/log/xieyiok'),(5,'manage/order'),(5,'manage/order/index'),(5,'manage/order/detail'),(5,'manage/order/merchant'),(5,'manage/order/channel'),(5,'manage/order/hour'),(5,'manage/order/change_freeze_status'),(5,'manage/order/del'),(5,'manage/order/batch_del'),(5,'manage/order/senddelbatchsms'),(5,'manage/order/del_batchmonth'),(5,'manage/order/del_batchweek'),(5,'manage/order/del_batch'),(5,'manage/order/budan'),(5,'manage/order/xieyi'),(5,'manage/order/xieyiok'),(5,'manage/product'),(5,'manage/product/index'),(5,'manage/product/add'),(5,'manage/product/edit'),(5,'manage/product/del'),(5,'manage/product/change_status'),(5,'manage/product/xieyi'),(5,'manage/product/xieyiok'),(5,'manage/rate'),(5,'manage/rate/index'),(5,'manage/rate/add'),(5,'manage/rate/detail'),(5,'manage/rate/save'),(5,'manage/rate/del'),(5,'manage/rate/change_status'),(5,'manage/selfchannel'),(5,'manage/selfchannel/index'),(5,'manage/selfchannel/add'),(5,'manage/selfchannel/edit'),(5,'manage/selfchannel/del'),(5,'manage/selfchannel/change_status'),(5,'manage/selfchannel/change_available'),(5,'manage/selfchannel/xieyi'),(5,'manage/selfchannel/xieyiok'),(5,'manage/site'),(5,'manage/site/info'),(5,'manage/site/moban'),(5,'manage/site/domain'),(5,'manage/site/register'),(5,'manage/site/wordfilter'),(5,'manage/site/spread'),(5,'manage/site/clearcache'),(5,'manage/site/xieyi'),(5,'manage/site/xieyiok'),(5,'manage/sms'),(5,'manage/sms/index'),(5,'manage/sms/xieyi'),(5,'manage/sms/xieyiok'),(5,'manage/srate'),(5,'manage/srate/index'),(5,'manage/srate/add'),(5,'manage/srate/detail'),(5,'manage/srate/save'),(5,'manage/srate/del'),(5,'manage/srate/change_status'),(5,'manage/srate/set_register_default'),(5,'manage/srate/xieyi'),(5,'manage/srate/xieyiok'),(5,'manage/updata'),(5,'manage/updata/index'),(5,'manage/user'),(5,'manage/user/index'),(5,'manage/user/change_status'),(5,'manage/user/change_freeze_status'),(5,'manage/user/detail'),(5,'manage/user/add'),(5,'manage/user/views'),(5,'manage/user/edit'),(5,'manage/user/del'),(5,'manage/user/yjdelrz'),(5,'manage/user/allow_update'),(5,'manage/user/manage_money'),(5,'manage/user/channelstatus'),(5,'manage/user/rate'),(5,'manage/user/self_rate'),(5,'manage/user/channelzustatus'),(5,'manage/user/yjsrate'),(5,'manage/user/yjrate'),(5,'manage/user/getraterouteinfo'),(5,'manage/user/login'),(5,'manage/user/message'),(5,'manage/user/loginlog'),(5,'manage/user/unlock'),(5,'manage/user/dailiduijiema'),(5,'manage/user/apikey'),(5,'manage/user/xieyi'),(5,'manage/user/xieyiok'),(5,'manage/zfbcash'),(5,'manage/zfbcash/getcashdata'),(5,'manage/zfbcash/dumpcashs'),(5,'manage/zfbcash/generate_excelzfb'),(5,'manage/zfbcash/xieyi'),(5,'manage/zfbcash/xieyiok'),(5,'payment'),(5,'payment/index'),(5,'payment/index/notify'),(5,'shop'),(5,'shop/pay'),(5,'shop/pay/auth'),(5,'shop/pay/payment'),(5,'shop/pay/getorderstatus'),(5,'shop/pay/request_post'),(5,'shop/pay/order'),(5,'shop/pay/api'),(5,'shop/pay/payway'),(5,'shop/pay/page_callback'),(5,'shop/pay/notify_callback'),(5,'shop/pay/pay_result'),(5,'shop/pay/check_order_status'),(5,'shop/pay/wx_js_api_call'),(5,'shop/pay/wx_jspay_page'),(5,'shop/pay/submit_order_form'),(5,'shop/pay/notifyzf'),(5,'shop/pay/getselfchannel'),(5,'shop/pay/self_notify'),(5,'shop/shop'),(5,'shop/shop/getprotocol'),(5,'shop/shop/popnotice'),(5,'shop/shop/index'),(5,'shop/shop/category'),(5,'shop/shop/goods'),(5,'shop/shop/getgoodslist'),(5,'shop/shop/getgoodsinfo'),(5,'shop/shop/getrate'),(5,'shop/shop/getdiscounts'),(5,'shop/shop/getdiscount'),(5,'shop/shop/checkvisitpassword'),(5,'shop/shop/checkcoupon'),(5,'wechat'),(5,'wechat/config'),(5,'wechat/config/index'),(5,'wechat/config/pay'),(5,'wechat/config/xieyi'),(5,'wechat/config/xieyiok'),(5,'wechat/fans'),(5,'wechat/fans/index'),(5,'wechat/fans/back'),(5,'wechat/fans/backadd'),(5,'wechat/fans/tagset'),(5,'wechat/fans/backdel'),(5,'wechat/fans/tagadd'),(5,'wechat/fans/tagdel'),(5,'wechat/fans/sync'),(5,'wechat/fans/xieyi'),(5,'wechat/fans/xieyiok'),(5,'wechat/keys'),(5,'wechat/keys/index'),(5,'wechat/keys/add'),(5,'wechat/keys/edit'),(5,'wechat/keys/del'),(5,'wechat/keys/forbid'),(5,'wechat/keys/resume'),(5,'wechat/keys/subscribe'),(5,'wechat/keys/defaults'),(5,'wechat/keys/xieyi'),(5,'wechat/keys/xieyiok'),(5,'wechat/menu'),(5,'wechat/menu/index'),(5,'wechat/menu/edit'),(5,'wechat/menu/cancel'),(5,'wechat/menu/xieyi'),(5,'wechat/menu/xieyiok'),(5,'wechat/news'),(5,'wechat/news/index'),(5,'wechat/news/select'),(5,'wechat/news/image'),(5,'wechat/news/add'),(5,'wechat/news/edit'),(5,'wechat/news/del'),(5,'wechat/news/push'),(5,'wechat/news/xieyi'),(5,'wechat/news/xieyiok'),(5,'wechat/tags'),(5,'wechat/tags/index'),(5,'wechat/tags/add'),(5,'wechat/tags/edit'),(5,'wechat/tags/sync'),(5,'wechat/tags/xieyi'),(5,'wechat/tags/xieyiok');
/*!40000 ALTER TABLE `system_auth_node` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_config`
--

DROP TABLE IF EXISTS `system_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL COMMENT '配置编码',
  `value` varchar(1024) DEFAULT NULL COMMENT '配置值',
  PRIMARY KEY (`id`),
  KEY `index_system_config_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=392 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统参数配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_config`
--

LOCK TABLES `system_config` WRITE;
/*!40000 ALTER TABLE `system_config` DISABLE KEYS */;
INSERT INTO `system_config` VALUES (148,'site_name','发卡平台'),(149,'site_copy','发卡平台 © 2019~2022 版权'),(164,'storage_type','local'),(165,'storage_qiniu_is_https','0'),(166,'storage_qiniu_bucket','sihuiyika'),(167,'storage_qiniu_domain','pqrc905z9.bkt.clouddn.com'),(168,'storage_qiniu_access_key','admin'),(169,'storage_qiniu_secret_key','zxc260531078'),(170,'storage_qiniu_region','华南'),(173,'app_name','自动发卡平台'),(174,'app_version','2.00 dev'),(176,'browser_icon','/static/upload/bec128d983d1ee39/2c0c5cbf7efd09b5.png'),(184,'wechat_appid','wx385fb51c855b1311'),(185,'wechat_appsecret','49505120b2aa9bb2f9ae74dc72ea5711'),(186,'wechat_token','Gwi5l2v50Kz1klh26jLR53wXV7m55R11'),(187,'wechat_encodingaeskey','zcvHFUNBWbFz07xmmVebLZS8bbQJMb3kmvPebY6XFxs'),(188,'wechat_mch_id','18711111111'),(189,'wechat_partnerkey','A82DC5BD1F3359081049C568D8502BC5'),(194,'wechat_cert_key',''),(196,'wechat_cert_cert',''),(197,'tongji_baidu_key',''),(198,'tongji_cnzz_key','1261854404'),(199,'storage_oss_bucket','think-oss'),(200,'storage_oss_keyid','WjeX0AYSfgy5VbXQ'),(201,'storage_oss_secret','hQTENHy6MYVUTgwjcgfOCq5gckm2Lp'),(202,'storage_oss_domain','think-oss.oss-cn-shanghai.aliyuncs.com'),(203,'storage_oss_is_https','1'),(204,'sms_channel','alidayu'),(205,'smsbao_user','dusir8'),(206,'smsbao_pass','147258yu'),(207,'smsbao_signature','自动发卡平台'),(208,'alidayu_key','LTAIsdYJAjlwj111'),(209,'alidayu_secret','hPNGS3fccnK1bSo5EAoKATJPyba111'),(210,'alidayu_smstpl','SMS_123798913'),(211,'alidayu_signature','友谊云'),(212,'yixin_sms_user','Daniel'),(213,'yixin_sms_pass','AAA14712345678'),(214,'yixin_sms_signature','自动发卡'),(215,'email_name','自动发卡'),(216,'email_smtp','smtp.qiye.aliyun.com'),(217,'email_port','465'),(218,'email_user','weixin@6kz.com'),(219,'email_pass','111111'),(220,'cash_min_money','1'),(221,'transaction_min_fee','0.01'),(222,'cash_fee_type','1'),(223,'cash_fee','0'),(224,'spread_rebate_rate','8'),(225,'site_keywords','发卡网,发卡平台,自动发卡,自动发卡平台,219自动发卡平台'),(226,'site_desc','信誉第一的自动发卡平台，24小时为商户提供优质稳定不间断的自动交易服务'),(227,'site_status','1'),(228,'site_subtitle','企业级自动发卡平台'),(229,'site_close_tips','站点维护中'),(230,'complaint_limit_num','1'),(231,'cash_status','1'),(232,'cash_close_tips','满100元每天12点前自动结算，无须手动结算。'),(233,'cash_limit_time_start','9'),(234,'cash_limit_time_end','18'),(235,'cash_limit_num','5'),(236,'cash_limit_num_tips','您今天提现次数已经超过三次啦，请等待自动提现或明天在申请！'),(237,'site_info_tel','010-1110000'),(238,'site_info_qq','12345678'),(239,'site_info_address','没有地址'),(240,'site_info_email','admin@qqcom'),(241,'site_info_copyright','Copyright © 2019-2022 自动发卡卡版权所有'),(242,'site_info_icp','蒙ICP备00000000号   '),(243,'site_domain',''),(244,'site_domain_res','/static'),(245,'site_register_verify','1'),(246,'site_register_status','1'),(247,'site_register_smscode_status','0'),(248,'site_wordfilter_status','1'),(249,'site_wordfilter_danger','色情|萝莉|贴吧|论坛|穿越火线|地下城与勇士|绝地求生|英雄联盟|QQ飞车|盒子|QQ|DNF|CF|LOL|透视|自瞄|锁头|连招|外挂|套现|脚本|成人|赌博|vpn|美女|快猫|猫咪'),(250,'disabled_domains','www|ftp|bbs|blog|tes'),(251,'site_domain_short',''),(252,'storage_local_exts','jpg,jpeg,gif,png,ico'),(253,'site_logo','/static/img/logo.png'),(254,'site_shop_domain',''),(255,'yixin_sms_cost','0.2'),(256,'smsbao_cost','0.2'),(257,'alidayu_cost','0.2'),(258,'index_theme','default'),(259,'1cloudsp_key','Yr8vj6XiTO7oWGrE'),(260,'1cloudsp_secret','M13FMSyTIS4xsYUpPveboZhPPjpyB111'),(261,'1cloudsp_smstpl','40997'),(262,'1cloudsp_signature','219发卡发卡平台'),(263,'1cloudsp_cost','0.2'),(264,'253sms_key','N3451234'),(265,'253sms_secret','1'),(266,'253sms_signature','1'),(267,'253sms_cost','1'),(268,'ip_register_limit','0'),(269,'is_google_auth','0'),(270,'sms_error_limit','7'),(271,'sms_error_time','10'),(272,'wrong_password_times','20'),(273,'site_statistics',''),(274,'admin_login_path','ht888'),(276,'announce_push','0'),(278,'spread_reward','0'),(279,'spread_reward_money','0'),(280,'spread_invite_code','0'),(281,'contact_us','&lt;dl&gt;\r\n	&lt;dt style=&quot;text-align: center;&quot;&gt;联系电话： &lt;font&gt;133-1234-1234&lt;/font&gt;&lt;/dt&gt;\r\n	&lt;dd style=&quot;text-align: center;&quot;&gt;客服 QQ： &lt;font&gt;12345678&lt;/font&gt;&lt;/dd&gt;\r\n	&lt;dd style=&quot;text-align: center;&quot;&gt;公司地址： 自动发卡系统&lt;/dd&gt;\r\n	&lt;dd style=&quot;text-align: center;&quot;&gt;公司名称： 自动发卡系统&lt;/dd&gt;\r\n&lt;/dl&gt;\r\n'),(282,'qqgroup',''),(283,'wx_auto_login','0'),(284,'is_need_invite_code','0'),(285,'site_register_code_type','sms'),(286,'auto_cash','1'),(287,'auto_cash_money','1'),(288,'sms_notify_channel','alidayu'),(289,'merchant_logo','/static/upload/4a28f88e9d636f57/d8ef3bae76caf1a3.png'),(290,'site_info_qrcode','/static/upload/066ee82e0929c980/a36dea357ac5d3c0.png'),(291,'cash_type','[\"1\",\"2\"]'),(292,'goods_min_price','0'),(293,'goods_max_price','500000'),(294,'auto_cash_time','0'),(295,'auto_cash_fee_type','1'),(296,'auto_cash_fee','0'),(297,'order_query_chkcode','1'),(298,'buy_protocol','&lt;p&gt;1、本站平台仅&lt;strong&gt;提供自动发卡、寄售服务&lt;/strong&gt;，并非销售商，不清楚充值卡密真实用途！&lt;/p&gt;\r\n\r\n&lt;p&gt;2、建议先咨询卖家软件用途后购买，&lt;span style=&quot;color:#ff0000;&quot;&gt;&lt;strong&gt;非卡密错误等问题本站有权驳回一切投诉与退款&lt;/strong&gt;&lt;/span&gt;。&lt;/p&gt;\r\n\r\n&lt;p&gt;3、如遇拖延时间，第二天发货的就是骗子请立即联系平台客服&lt;/p&gt;\r\n\r\n&lt;p&gt;4、如遇到&lt;span style=&quot;color:#ff0000;&quot;&gt;&lt;strong&gt;假卡/欺诈/钓鱼、等情况请在当天24点前投诉&lt;/strong&gt;&lt;/span&gt;或与我们平台QQ进行联系。&lt;/p&gt;\r\n'),(299,'login_auth','0'),(300,'login_auth_type','0'),(301,'fee_payer','1'),(302,'available_email','0'),(303,'idcard_auth_type','0'),(304,'idcard_auth_path',''),(305,'idcard_auth_appcode',''),(306,'idcard_auth_status_field','status'),(307,'idcard_auth_status_code','01'),(308,'settlement_type','1'),(309,'settlement_type','1'),(310,'settlement_type','1'),(311,'settlement_type','1'),(312,'site_info_tel_desc','(早9点30-晚18点)'),(313,'site_info_qq_desc','09:00-18:00'),(314,'site_info_qrcode_desc','商家扫描二维码关注公众号'),(315,'site_iphone_qrcode','/static/upload/9f74ac068f001013/cb636d6f672f2886.png'),(316,'site_android_qrcode','/static/upload/9f74ac068f001013/cb636d6f672f2886.png'),(317,'email_smtp1','smtp.qiye.aliyun.com'),(318,'email_port1','465'),(319,'email_user1','faka@69kz.com'),(320,'email_pass1','1111111'),(321,'email_smtp2','smtp.qiye.aliyun.com'),(322,'email_port2','465'),(323,'email_user2','admin@69kz.com'),(324,'email_pass2','11111111'),(325,'sms_complaint_channel','alidayu'),(326,'sms_complaint_notify_channel','alidayu'),(327,'alidayu_complaint_smstpl','SMS_168730312'),(328,'alidayu_complaint_notify_smstpl','SMS_168725713'),(329,'alidayu_order_smstpl','SMS_168730311'),(330,'1cloudsp_complaint_smstpl','40998'),(331,'1cloudsp_complaint_notify_smstpl','40999'),(332,'1cloudsp_order_smstpl','41000'),(333,'wechat_stock_template','F3i0XsNO_QXA-UwOlJNDs8INztcBE1Oae7slr1Oec50'),(334,'wechat_sell_template','RBPvjlbLEDNuJpJpADAOM2XWu6CYWyJK3Mo30riM4kc'),(335,'_editor_upload_62352',''),(336,'order_type','0'),(337,'user_order_profix','SY'),(340,'wechat_signin_template',''),(341,'wechat_complaint_template',''),(342,'wechat_cash_template',''),(343,'zhidingshijian',''),(344,'zhidingprice',''),(345,'zhidingcount','10'),(346,'payid','收款会员ID'),(347,'paykey','收款会员支付秘钥'),(348,'paytype',''),(349,'baidusendurl',''),(350,'baiduurl',''),(351,'dladdprice','0.5'),(352,'spcsh','1'),(353,'jiesuantixing','满100元自动结算，无须手动提现'),(354,'yqmgmsplj','http://www.aa.com'),(355,'xyok',''),(356,'merchant_theme','default'),(357,'ip_buyfail_limit','10'),(358,'yc88_url','https://www.mfxw.cc'),(359,'phone_email_auth','0'),(360,'xyiok','1'),(361,'xyiokk','1'),(362,'renzheng_kqsm','1'),(363,'renzheng_qzkqsm','0'),(364,'rul_djm_sl','10'),(365,'rul_djm_kt','YC88_'),(366,'site_jiaoseprice','2'),(367,'ycdd_status','1'),(368,'open_budan','1'),(369,'site_info_hdp1','/static/img/4042150180.png'),(370,'site_info_hdp2','/static/img/5999335.jpg'),(371,'site_info_hdp3','/static/img/5808506.jpg'),(372,'site_info_hdp4','/static/img/01.jpg'),(373,'site_info_hdp5','/static/img/02.jpg'),(374,'site_info_hdp6','/static/img/03.jpg'),(375,'site_info_url_01','https://www.mfxw.cc'),(376,'site_info_url_02','https://www.mfxw.cc'),(377,'site_info_url_03','https://www.mfxw.cc'),(378,'buy_notice','1'),(379,'buy_notice_con',''),(380,'buy_protocol_self',''),(381,'querytime','60'),(382,'querycount','5'),(383,'querydjtime','10'),(384,'site_buyer_register_status','0'),(385,'site_buyer_register_type','1'),(386,'storage_qq_is_https','0'),(387,'storage_qq_region',''),(388,'storage_qq_bucket',''),(389,'storage_qq_domain',''),(390,'storage_qq_secret_id',''),(391,'storage_oss_secret_key','');
/*!40000 ALTER TABLE `system_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_log`
--

DROP TABLE IF EXISTS `system_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ip` char(15) NOT NULL DEFAULT '' COMMENT '操作者IP地址',
  `node` char(200) NOT NULL DEFAULT '' COMMENT '当前操作节点',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '操作人用户名',
  `action` varchar(200) NOT NULL DEFAULT '' COMMENT '操作行为',
  `content` text NOT NULL COMMENT '操作内容描述',
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COMMENT='系统操作日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_log`
--

LOCK TABLES `system_log` WRITE;
/*!40000 ALTER TABLE `system_log` DISABLE KEYS */;
INSERT INTO `system_log` VALUES (14,'113.122.203.168','admin/login/index','admin','系统管理','用户登录系统成功','2022-06-08 18:26:39'),(15,'113.122.203.168','admin/login/index','admin','系统管理','用户登录系统成功','2022-06-09 04:10:13'),(16,'113.122.203.168','admin/config/index','admin','系统管理','系统参数配置成功','2022-06-09 04:10:50'),(17,'113.122.203.168','manage/site/register','admin','系统管理','修改注册设置成功','2022-06-09 04:13:24'),(18,'113.122.203.168','admin/config/file','admin','系统管理','系统参数配置成功','2022-06-09 04:14:46'),(19,'113.122.201.18','admin/login/index','admin1','系统管理','用户登录系统成功','2022-06-09 11:38:54'),(20,'113.122.201.18','admin/config/index','admin1','系统管理','系统参数配置成功','2022-06-09 12:11:15'),(21,'113.122.201.18','admin/config/index','kekewl2022','系统管理','系统参数配置成功','2022-06-09 12:30:35'),(22,'113.122.201.18','admin/config/index','kekewl2022','系统管理','系统参数配置成功','2022-06-09 12:31:27'),(23,'113.122.201.18','admin/config/index','kekewl2022','系统管理','系统参数配置成功','2022-06-09 12:32:22'),(24,'113.122.201.18','admin/config/index','kekewl2022','系统管理','系统参数配置成功','2022-06-09 12:33:23'),(25,'113.122.201.18','admin/config/index','kekewl2022','系统管理','系统参数配置成功','2022-06-09 12:33:48'),(26,'113.122.201.18','admin/config/index','kekewl2022','系统管理','系统参数配置成功','2022-06-09 12:34:24'),(27,'113.122.201.18','admin/config/index','kekewl2022','系统管理','系统参数配置成功','2022-06-09 12:35:41'),(28,'113.122.201.18','admin/config/index','kekewl2022','系统管理','系统参数配置成功','2022-06-09 12:36:42'),(29,'113.122.201.18','admin/config/index','kekewl2022','系统管理','系统参数配置成功','2022-06-09 12:37:36'),(30,'113.122.201.18','admin/config/index','kekewl2022','系统管理','系统参数配置成功','2022-06-09 15:10:07'),(31,'113.122.201.18','admin/config/index','kekewl2022','系统管理','系统参数配置成功','2022-06-09 15:10:23'),(32,'113.122.201.18','admin/login/index','admin','系统管理','用户登录系统成功','2022-06-09 15:26:28'),(33,'113.122.201.18','admin/login/index','admin','系统管理','用户登录系统成功','2022-06-09 15:33:11'),(34,'113.122.201.18','admin/config/index','admin','系统管理','系统参数配置成功','2022-06-09 15:51:49'),(35,'113.122.201.18','admin/config/index','admin','系统管理','系统参数配置成功','2022-06-09 15:54:28'),(36,'113.122.201.18','admin/config/index','admin','系统管理','系统参数配置成功','2022-06-09 15:55:56'),(37,'113.122.201.18','manage/site/info','admin','系统管理','修改网站配置成功','2022-06-09 16:09:02'),(38,'113.122.201.18','manage/site/info','admin','系统管理','修改网站配置成功','2022-06-09 16:10:02'),(39,'113.122.201.18','manage/site/info','admin','系统管理','修改网站配置成功','2022-06-09 16:10:43'),(40,'113.122.201.18','manage/site/info','admin','系统管理','修改网站配置成功','2022-06-09 16:11:31'),(41,'113.122.201.18','manage/selfchannel/edit','admin','自签通道','编辑接口成功，ID:3','2022-06-09 16:59:20'),(42,'113.122.201.18','manage/channel/edit','admin','网关通道','编辑接口成功，ID:18','2022-06-09 17:00:20'),(43,'113.122.201.18','manage/channel/edit','admin','网关通道','编辑接口成功，ID:17','2022-06-09 17:00:30'),(44,'113.122.201.18','manage/channel/edit','admin','网关通道','编辑接口成功，ID:19','2022-06-09 17:00:35');
/*!40000 ALTER TABLE `system_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_menu`
--

DROP TABLE IF EXISTS `system_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_menu` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '名称',
  `node` varchar(200) NOT NULL DEFAULT '' COMMENT '节点代码',
  `icon` varchar(100) NOT NULL DEFAULT '' COMMENT '菜单图标',
  `url` varchar(400) NOT NULL DEFAULT '' COMMENT '链接',
  `params` varchar(500) DEFAULT '' COMMENT '链接参数',
  `target` varchar(20) NOT NULL DEFAULT '_self' COMMENT '链接打开方式',
  `sort` int(11) unsigned DEFAULT '0' COMMENT '菜单排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态(0:禁用,1:启用)',
  `create_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `index_system_menu_node` (`node`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=167 DEFAULT CHARSET=utf8 COMMENT='系统菜单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_menu`
--

LOCK TABLES `system_menu` WRITE;
/*!40000 ALTER TABLE `system_menu` DISABLE KEYS */;
INSERT INTO `system_menu` VALUES (2,0,'系统管理','','fa fa-gear','#','','_self',1000,1,0,'2015-11-13 03:15:38'),(4,2,'系统配置','','','#','','_self',100,1,0,'2016-03-11 02:12:55'),(5,4,'网站参数','','fa fa-apple','admin/config/index','','_self',20,1,0,'2016-05-02 22:36:49'),(6,4,'文件存储','','fa fa-save','admin/config/file','','_self',30,1,0,'2016-05-02 22:39:43'),(9,20,'后台操作日志','','glyphicon glyphicon-console','admin/log/index','','_self',50,1,0,'2017-03-20 23:49:31'),(19,20,'权限管理','','fa fa-user-secret','admin/auth/index','','_self',10,1,0,'2015-11-13 21:18:12'),(20,2,'系统权限','','','#','','_self',200,1,0,'2016-03-11 02:11:41'),(21,20,'系统菜单','','glyphicon glyphicon-menu-hamburger','admin/menu/index','','_self',30,1,0,'2015-11-13 03:16:16'),(22,20,'节点管理','','fa fa-ellipsis-v','admin/node/index','','_self',20,1,0,'2015-11-13 03:16:16'),(29,20,'系统用户','','fa fa-users','admin/user/index','','_self',40,1,0,'2016-10-27 22:31:40'),(61,0,'微信管理','','fa fa-wechat','#','','_self',2000,1,0,'2017-03-25 19:00:21'),(62,61,'微信对接配置','','','#','','_self',100,1,0,'2017-03-25 19:03:38'),(63,62,'微信接口配置\r\n','','fa fa-usb','wechat/config/index','','_self',10,1,0,'2017-03-25 19:04:44'),(65,61,'微信粉丝管理','','','#','','_self',300,1,0,'2017-03-25 19:08:32'),(66,65,'粉丝标签','','fa fa-tags','wechat/tags/index','','_self',10,1,0,'2017-03-25 19:09:41'),(67,65,'已关注粉丝','','fa fa-wechat','wechat/fans/index','','_self',20,1,0,'2017-03-25 19:10:07'),(68,61,'微信订制','','','#','','_self',200,1,0,'2017-03-25 19:10:39'),(69,68,'微信菜单定制','','glyphicon glyphicon-phone','wechat/menu/index','','_self',40,1,0,'2017-03-25 19:11:08'),(70,68,'关键字管理','','fa fa-paw','wechat/keys/index','','_self',10,1,0,'2017-03-25 19:11:49'),(71,68,'关注自动回复','','fa fa-commenting-o','wechat/keys/subscribe','','_self',20,1,0,'2017-03-25 19:12:32'),(81,68,'无配置默认回复','','fa fa-commenting-o','wechat/keys/defaults','','_self',30,1,0,'2017-04-17 22:48:25'),(82,61,'素材资源管理','','','#','','_self',300,1,0,'2017-04-20 19:23:18'),(83,82,'添加图文','','fa fa-folder-open-o','wechat/news/add?id=1','','_self',20,1,0,'2017-04-20 19:23:40'),(85,82,'图文列表','','fa fa-file-pdf-o','wechat/news/index','','_self',10,1,0,'2017-04-20 19:25:45'),(86,65,'粉丝黑名单','','fa fa-reddit-alien','wechat/fans/back','','_self',30,1,0,'2017-05-02 00:17:03'),(87,0,'插件案例','','','#','','_self',3000,0,0,'2017-07-06 23:10:16'),(88,87,'第三方插件','','','#','','_self',0,0,0,'2017-07-06 23:10:37'),(90,88,'PCAS 省市区','','','demo/plugs/region','','_self',0,0,0,'2017-07-07 02:45:47'),(91,87,'内置插件','','','#','','_self',0,0,0,'2017-07-07 02:56:59'),(92,91,'文件上传','','','demo/plugs/file','','_self',0,0,0,'2017-07-07 02:57:22'),(93,88,'富文本编辑器','','','demo/plugs/editor','','_self',0,0,0,'2017-07-24 23:19:44'),(95,0,'网关通道','','fa fa-product-hunt','#','','_self',4000,1,0,'2018-01-14 19:08:57'),(97,95,'支付接口管理','','fa fa-futbol-o','manage/channel/index','','_self',0,1,0,'2018-01-14 19:09:53'),(99,4,'短信配置','','fa fa-envelope-o','manage/sms/index','','_self',50,1,0,'2018-01-14 19:36:42'),(100,4,'邮件配置','','fa fa-envelope-o','manage/email/index','','_self',60,1,0,'2018-01-15 21:45:19'),(101,0,'用户管理','','fa fa-users','#','','_self',5000,1,0,'2018-01-19 18:46:59'),(102,101,'商户管理','','fa fa-users','manage/user/index','','_self',0,1,0,'2018-01-19 18:47:40'),(103,0,'交易明细','','fa fa-bar-chart','#','','_self',6000,1,0,'2018-01-20 00:47:46'),(104,103,'商品订单列表','','fa fa-list-ol','manage/order/index','','_self',0,1,0,'2018-01-20 00:48:09'),(105,103,'金额变动记录','','fa fa-exchange','manage/log/user_money','','_self',100,1,0,'2018-01-20 23:02:50'),(106,0,'财务管理','','fa fa-google-wallet','#','','_self',8000,1,0,'2018-01-20 23:17:39'),(107,106,'提现管理','','fa fa-cny','manage/cash/index','','_self',0,1,0,'2018-01-20 23:18:06'),(108,4,'后台主页','','fa fa-area-chart','manage/index/main','','_self',0,1,0,'2018-01-22 22:19:38'),(109,106,'提现配置','','fa fa-google-wallet','manage/cash/config','','_self',70,1,0,'2018-01-25 23:29:43'),(110,4,'站点信息','','glyphicon glyphicon-info-sign','manage/site/info','','_self',21,1,0,'2018-01-26 00:26:24'),(111,4,'域名设置','','fa fa-at','manage/site/domain','','_self',25,1,0,'2018-01-26 00:47:15'),(112,4,'注册设置','','fa fa-cog','manage/site/register','','_self',27,1,0,'2018-01-26 02:45:43'),(113,4,'字词过滤','','fa fa-filter','manage/site/wordfilter','','_self',90,1,0,'2018-01-26 22:50:48'),(114,103,'商户分析','','fa fa-area-chart','manage/order/merchant','','_self',40,1,0,'2018-01-27 19:32:00'),(115,103,'渠道分析','','fa fa-area-chart','manage/order/channel','','_self',50,1,0,'2018-01-27 19:32:29'),(116,103,'实时数据','','fa fa-area-chart','manage/order/hour','','_self',60,1,0,'2018-01-27 19:32:57'),(117,0,'商品管理','','fa fa-shopping-bag','#','','_self',5500,1,0,'2018-01-29 02:43:51'),(118,117,'商品管理','','fa fa-shopping-bag','manage/goods/index','','_self',0,1,0,'2018-01-29 02:44:10'),(119,103,'投诉管理','','fa fa-bullhorn','manage/complaint/index','','_self',20,1,0,'2018-01-29 23:34:06'),(121,0,'内容管理','','fa fa-file-text','#','','_self',4500,1,0,'2018-02-05 18:38:43'),(122,121,'内容管理','','fa fa-file-text','manage/article/index','','_self',0,1,0,'2018-02-05 18:44:51'),(123,121,'分类管理','','fa fa-bars','manage/article_category/index','','_self',0,1,0,'2018-03-02 08:13:26'),(124,4,'备份管理','','fa fa-database','manage/backup/index','','_self',100,1,0,'2018-03-09 03:31:11'),(125,4,'前台导航','','fa fa-navicon','admin/nav/index','','_self',110,1,0,'2018-03-20 01:08:38'),(126,101,'登录解锁','','fa fa-unlock','/manage/user/unlock','','_self',0,1,0,'2018-03-23 19:15:00'),(127,20,'商户操作日志','','fa fa-thumb-tack','/admin/mlog/index','','_self',60,1,0,'2018-03-24 00:19:10'),(128,4,'推广设置','','fa fa-bullhorn','/manage/site/spread','','_self',120,1,0,'2018-03-24 03:19:29'),(129,101,'邀请码管理','','fa fa-user-plus','/manage/invite_code/index','','_self',0,1,0,'2018-03-24 03:54:29'),(130,117,'订单自定义','','fa fa-credit-card-alt','manage/goods/change_trade_no_status','','_self',0,1,0,'2018-04-16 17:03:50'),(131,101,'费率分组管理','','','manage/rate/index','','_self',0,1,0,'2018-06-16 18:53:02'),(132,4,'数据删除','','','manage/content/del','','_self',123,1,0,'2018-10-05 08:49:42'),(133,95,'安装支付接口','','fa fa-futbol-o','manage/channel/index?is_install=0','','_self',0,1,0,'2018-01-14 19:09:53'),(135,106,'代付渠道管理','','fa fa-futbol-o','manage/cashChannel/index','','_self',1000,1,0,'2018-08-04 07:50:38'),(136,103,'支付接口订单','','fa fa-bars','/manage/order/index?category=1','','_self',0,1,0,'2019-11-18 08:02:08'),(138,117,'我的商品池','','fa fa-cubes','manage/goods/goodschi','','_self',0,1,0,'2020-02-11 10:49:23'),(139,4,'视频教程','','fa fa-television','/manage/index/spjc','','_self',121,1,0,'2020-03-12 22:44:33'),(140,117,'商品池置顶价格','','fa fa-cubes','manage/goods/goodschiprice','','_self',0,1,0,'2020-02-10 02:49:23'),(141,4,'认证管理','','fa fa-key','/admin/renzheng/index','','_self',22,1,0,'2020-05-27 23:34:31'),(142,2,'在线升级','','fa fa-key','#','','_self',300,1,0,'2020-06-14 23:34:31'),(143,142,'一键升级','','fa fa-key','/admin/shengji/index','','_self',0,1,0,'2020-06-14 23:34:31'),(144,2,'插件管理','','fa fa-key','#','','_self',300,1,0,'2020-06-14 23:34:31'),(145,144,'插件列表','','fa fa-key','/admin/plug/index','','_self',0,1,0,'2020-06-14 23:34:31'),(146,0,'积分商城','','fa fa-shopping-b','#','','_self',9000,1,0,'2020-08-18 10:49:37'),(147,146,'积分设置','','fa fa-cog transition','/admin/shang/setting','','_self',0,1,0,'2020-08-18 10:49:37'),(148,146,'积分商品管理','','fa fa-shopping-bag','/admin/shang/index','','_self',0,1,0,'2020-08-18 10:49:37'),(149,146,'积分订单管理','','fa fa-bar-chart','/admin/shang/orders','','_self',0,1,0,'2020-08-18 10:49:37'),(150,117,'商品回收站','','fa fa-trash','manage/goods/goodshsz','','_self',0,1,0,'2020-02-10 02:49:23'),(151,20,'IP限制查询管理','','fa fa-user-secret','admin/ip/index','','_self',10,1,0,'2015-11-13 21:18:12'),(152,4,'视频管理','','fa fa-television','/admin/video/index','','_self',122,1,0,'2021-07-31 17:34:31'),(153,101,'买家列表','','','manage/buyer/index','','_self',0,1,0,'2021-08-06 23:42:16'),(154,106,'买家提现配置','','','manage/cash/buyerconfig','','_self',0,1,0,'2021-08-19 05:09:35'),(155,4,'自签设置','','fa fa-sticky-note-o','admin/merchant/index','','_self',28,1,0,'2021-08-21 23:07:47'),(156,101,'商户审核','','','manage/audit/index','','_self',0,1,0,'2021-08-22 00:59:45'),(157,101,'自签费率组','','','manage/srate/index','','_self',0,1,0,'2021-08-22 01:00:23'),(158,95,'自签通道管理','','','manage/self_channel/index','','_self',0,1,0,'2021-08-22 05:07:28'),(159,103,'买家金额变动记录','','','manage/log/buyer_money','','_self',101,1,0,'2021-08-31 01:48:54'),(160,103,'自签订单管理','','','manage/order/index?order_type=1','','_self',0,1,0,'2021-08-31 01:49:48'),(161,117,'推广商品设置','','fa fa-television','/admin/goodstgset/index','','_self',0,1,0,'2021-09-09 03:34:31'),(162,117,'商品分类设置','','fa fa-television','/admin/goodstgclass/index','','_self',0,1,0,'2021-09-09 03:34:31'),(163,117,'推广商品管理','','fa fa-television','/admin/goodstggl/index','','_self',0,1,0,'2021-09-09 03:34:31'),(164,117,'首页广告设置','','fa fa-television','/admin/goodstggg/index','','_self',0,1,0,'2021-09-09 03:34:31'),(166,4,'商城模板修改','','fa fa-shopping-bag','/manage/site/moban','','_self',23,1,0,'2021-09-11 16:18:45');
/*!40000 ALTER TABLE `system_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_node`
--

DROP TABLE IF EXISTS `system_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_node` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `node` varchar(100) DEFAULT NULL COMMENT '节点代码',
  `title` varchar(500) DEFAULT NULL COMMENT '节点标题',
  `is_menu` tinyint(1) unsigned DEFAULT '0' COMMENT '是否可设置为菜单',
  `is_auth` tinyint(1) unsigned DEFAULT '1' COMMENT '是否启动RBAC权限控制',
  `is_login` tinyint(1) unsigned DEFAULT '1' COMMENT '是否启动登录控制',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `index_system_node_node` (`node`)
) ENGINE=InnoDB AUTO_INCREMENT=548 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统节点表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_node`
--

LOCK TABLES `system_node` WRITE;
/*!40000 ALTER TABLE `system_node` DISABLE KEYS */;
INSERT INTO `system_node` VALUES (131,'admin/auth/index','权限列表',1,1,1,'2017-08-19 23:45:42'),(132,'admin','后台管理',0,1,1,'2017-08-19 23:45:44'),(133,'admin/auth/apply','节点授权',0,1,1,'2017-08-20 00:05:18'),(134,'admin/auth/add','添加授权',0,1,1,'2017-08-20 00:05:19'),(135,'admin/auth/edit','编辑权限',0,1,1,'2017-08-20 00:05:19'),(136,'admin/auth/forbid','禁用权限',0,1,1,'2017-08-20 00:05:20'),(137,'admin/auth/resume','启用权限',0,1,1,'2017-08-20 00:05:20'),(138,'admin/auth/del','删除权限',0,1,1,'2017-08-20 00:05:21'),(139,'admin/config/index','参数配置',1,1,1,'2017-08-20 00:05:22'),(140,'admin/config/file','文件配置',1,1,1,'2017-08-20 00:05:22'),(141,'admin/log/index','日志列表',1,1,1,'2017-08-20 00:05:23'),(142,'admin/log/del','删除日志',1,1,1,'2017-08-20 00:05:24'),(143,'admin/menu/index','菜单列表',1,1,1,'2017-08-20 00:05:25'),(144,'admin/menu/add','添加菜单',0,1,1,'2017-08-20 00:05:25'),(145,'admin/menu/edit','编辑菜单',0,1,1,'2017-08-20 00:05:26'),(146,'admin/menu/del','删除菜单',0,1,1,'2017-08-20 00:05:26'),(147,'admin/menu/forbid','禁用菜单',0,1,1,'2017-08-20 00:05:27'),(148,'admin/menu/resume','启用菜单',0,1,1,'2017-08-20 00:05:28'),(149,'admin/node/index','节点列表',1,1,1,'2017-08-20 00:05:29'),(150,'admin/node/save','节点更新',0,1,1,'2017-08-20 00:05:30'),(151,'admin/user/index','用户管理',1,1,1,'2017-08-20 00:05:31'),(152,'admin/user/auth','用户授权',0,1,1,'2017-08-20 00:05:32'),(153,'admin/user/add','添加用户',0,1,1,'2017-08-20 00:05:33'),(154,'admin/user/edit','编辑用户',0,1,1,'2017-08-20 00:05:33'),(155,'admin/user/pass','用户密码',0,1,1,'2017-08-20 00:05:34'),(156,'admin/user/del','删除用户',0,1,1,'2017-08-20 00:05:34'),(157,'admin/user/forbid','禁用用户',0,1,1,'2017-08-20 00:05:34'),(158,'admin/user/resume','启用用户',0,1,1,'2017-08-20 00:05:35'),(159,'demo/plugs/file','文件上传',1,1,1,'2017-08-20 00:05:36'),(160,'demo/plugs/region','区域选择',1,1,1,'2017-08-20 00:05:36'),(161,'demo/plugs/editor','富文本器',1,1,1,'2017-08-20 00:05:37'),(162,'wechat/config/index','微信参数',1,1,1,'2017-08-20 00:05:37'),(163,'wechat/config/pay','微信支付',0,1,1,'2017-08-20 00:05:38'),(164,'wechat/fans/index','粉丝列表',1,1,1,'2017-08-20 00:05:39'),(165,'wechat/fans/back','粉丝黑名单',1,1,1,'2017-08-20 00:05:39'),(166,'wechat/fans/backadd','移入黑名单',0,1,1,'2017-08-20 00:05:40'),(167,'wechat/fans/tagset','设置标签',0,1,1,'2017-08-20 00:05:41'),(168,'wechat/fans/backdel','移出黑名单',0,1,1,'2017-08-20 00:05:41'),(169,'wechat/fans/tagadd','添加标签',0,1,1,'2017-08-20 00:05:41'),(170,'wechat/fans/tagdel','删除标签',0,1,1,'2017-08-20 00:05:42'),(171,'wechat/fans/sync','同步粉丝',0,1,1,'2017-08-20 00:05:43'),(172,'wechat/keys/index','关键字列表',1,1,1,'2017-08-20 00:05:44'),(173,'wechat/keys/add','添加关键字',0,1,1,'2017-08-20 00:05:44'),(174,'wechat/keys/edit','编辑关键字',0,1,1,'2017-08-20 00:05:45'),(175,'wechat/keys/del','删除关键字',0,1,1,'2017-08-20 00:05:45'),(176,'wechat/keys/forbid','禁用关键字',0,1,1,'2017-08-20 00:05:46'),(177,'wechat/keys/resume','启用关键字',0,1,1,'2017-08-20 00:05:46'),(178,'wechat/keys/subscribe','关注默认回复',0,1,1,'2017-08-20 00:05:48'),(179,'wechat/keys/defaults','默认响应回复',0,1,1,'2017-08-20 00:05:49'),(180,'wechat/menu/index','微信菜单',1,1,1,'2017-08-20 00:05:51'),(181,'wechat/menu/edit','发布微信菜单',0,1,1,'2017-08-20 00:05:51'),(182,'wechat/menu/cancel','取消微信菜单',0,1,1,'2017-08-20 00:05:52'),(183,'wechat/news/index','微信图文列表',1,1,1,'2017-08-20 00:05:52'),(184,'wechat/news/select','微信图文选择',0,1,1,'2017-08-20 00:05:53'),(185,'wechat/news/image','微信图片选择',0,1,1,'2017-08-20 00:05:53'),(186,'wechat/news/add','添加图文',0,1,1,'2017-08-20 00:05:54'),(187,'wechat/news/edit','编辑图文',0,1,1,'2017-08-20 00:05:56'),(188,'wechat/news/del','删除图文',0,1,1,'2017-08-20 00:05:56'),(189,'wechat/news/push','推送图文',0,1,1,'2017-08-20 00:05:56'),(190,'wechat/tags/index','微信标签列表',1,1,1,'2017-08-20 00:05:58'),(191,'wechat/tags/add','添加微信标签',0,1,1,'2017-08-20 00:05:58'),(192,'wechat/tags/edit','编辑微信标签',0,1,1,'2017-08-20 00:05:58'),(193,'wechat/tags/sync','同步微信标签',0,1,1,'2017-08-20 00:05:59'),(194,'admin/auth','权限管理',0,1,1,'2017-08-20 00:06:58'),(195,'admin/config','系统配置',0,1,1,'2017-08-20 00:07:34'),(196,'admin/log','系统日志',0,1,1,'2017-08-20 00:07:46'),(197,'admin/menu','系统菜单',0,1,1,'2017-08-20 00:08:02'),(198,'admin/node','系统节点',0,1,1,'2017-08-20 00:08:44'),(199,'admin/user','系统用户',0,1,1,'2017-08-20 00:09:43'),(200,'demo','插件案例',0,1,1,'2017-08-20 00:10:43'),(201,'demo/plugs','插件案例',0,1,1,'2017-08-20 00:10:51'),(202,'wechat','微信管理',0,1,1,'2017-08-20 00:11:13'),(203,'wechat/config','微信配置',0,1,1,'2017-08-20 00:11:19'),(204,'wechat/fans','粉丝管理',0,1,1,'2017-08-20 00:11:36'),(205,'wechat/keys','关键字管理',0,1,1,'2017-08-20 00:13:00'),(206,'wechat/menu','微信菜单管理',0,1,1,'2017-08-20 00:14:11'),(207,'wechat/news','微信图文管理',0,1,1,'2017-08-20 00:14:40'),(208,'wechat/tags','微信标签管理',0,1,1,'2017-08-20 00:15:25'),(209,'manage/channel/index','供应商管理',0,1,1,'2018-01-15 21:53:53'),(210,'manage/channel/add','添加供应商',0,1,1,'2018-01-15 21:53:54'),(211,'manage/channel/edit','修改供应商',0,1,1,'2018-01-15 21:53:54'),(212,'manage/channel/del','删除供应商',0,1,1,'2018-01-15 21:53:54'),(213,'manage/channel/change_status','修改供应商状态',0,1,1,'2018-01-15 21:53:55'),(214,'manage/channel/getlistbypaytype','根据支付类型获取支付供应商列表',0,1,1,'2018-01-15 21:53:55'),(215,'manage/channelaccount/add','添加供应商账号',0,1,1,'2018-01-15 21:54:03'),(216,'manage/channelaccount/index','供应商账号管理',0,1,1,'2018-01-15 21:54:04'),(217,'manage/channelaccount/edit','修改供应商账号',0,1,1,'2018-01-15 21:54:05'),(218,'manage/channelaccount/del','删除供应商账号',0,1,1,'2018-01-15 21:54:06'),(219,'manage/channelaccount/clear','清除供应商账号额度',0,1,1,'2018-01-15 21:54:07'),(220,'manage/channelaccount/change_status','修改供应商账号状态',0,1,1,'2018-01-15 21:54:07'),(221,'manage/channelaccount/getfields','获取渠道账户字段',0,1,1,'2018-01-15 21:54:08'),(222,'manage/email/index','邮件配置',0,1,1,'2018-01-15 21:54:10'),(223,'manage/email/test','发信测试',0,1,1,'2018-01-15 21:54:10'),(224,'manage/product/index','支付产品管理',0,1,1,'2018-01-15 21:54:11'),(225,'manage/product/add','添加支付产品',0,1,1,'2018-01-15 21:54:12'),(226,'manage/product/edit','编辑支付产品',0,1,1,'2018-01-15 21:54:12'),(227,'manage/product/del','删除支付产品',0,1,1,'2018-01-15 21:54:14'),(228,'manage/product/change_status','修改支付产品状态',0,1,1,'2018-01-15 21:54:14'),(229,'manage/sms/index','短信配置',0,1,1,'2018-01-15 21:54:15'),(230,'manage/cash/index','提现列表',0,1,1,'2018-01-22 00:47:20'),(231,'manage/cash/detail','提现申请详情',0,1,1,'2018-01-22 00:47:20'),(232,'manage/cash/payqrcode','',0,1,1,'2018-01-22 00:47:21'),(233,'manage/log/user_money','金额变动记录',0,1,1,'2018-01-22 00:47:24'),(234,'manage/order/index','订单列表',0,1,1,'2018-01-22 00:47:25'),(235,'manage/order/detail','订单详情',0,1,1,'2018-01-22 00:47:26'),(236,'manage/user/index','商户管理',0,1,1,'2018-01-22 00:47:29'),(237,'manage/user/change_status','修改商户审核状态',0,1,1,'2018-01-22 00:47:30'),(238,'manage/user/detail','查看商户详情',0,1,1,'2018-01-22 00:47:30'),(239,'manage/user/add','添加商户',0,1,1,'2018-01-22 00:47:31'),(240,'manage/user/edit','编辑商户',0,1,1,'2018-01-22 00:47:31'),(241,'manage/user/del','删除商户',0,1,1,'2018-01-22 00:47:32'),(242,'manage/user/manage_money','商户资金管理',0,1,1,'2018-01-22 00:47:32'),(243,'manage/user/rate','设置商户费率',0,1,1,'2018-01-22 00:47:33'),(244,'manage/cash/config','提现配置',0,1,1,'2018-01-29 01:00:28'),(245,'manage/index/main','主页',0,1,1,'2018-01-29 01:00:33'),(246,'manage/order/merchant','商户分析',0,1,1,'2018-01-29 01:00:35'),(247,'manage/order/channel','渠道分析',0,1,1,'2018-01-29 01:00:36'),(248,'manage/order/hour','实时数据',0,1,1,'2018-01-29 01:00:36'),(249,'manage/site/info','站点信息配置',0,1,1,'2018-01-29 01:00:40'),(250,'manage/site/domain','域名设置',0,1,1,'2018-01-29 01:00:40'),(251,'manage/site/register','注册设置',0,1,1,'2018-01-29 01:00:41'),(252,'manage/site/wordfilter','字词过滤',0,1,1,'2018-01-29 01:00:41'),(253,'manage/user/change_freeze_status','修改商户冻结状态',0,1,1,'2018-01-29 01:00:43'),(254,'manage/user/login','商户登录',0,1,1,'2018-01-29 01:00:45'),(255,'manage/user/message','商户站内信',0,1,1,'2018-01-29 01:00:45'),(256,'merchant/cash/index','',0,0,0,'2018-01-29 01:00:48'),(257,'manage/goods/index','商品管理',0,1,1,'2018-01-29 03:33:28'),(258,'manage/goods/change_status','修改商品上架状态',0,1,1,'2018-01-29 03:33:29'),(259,'manage/complaint/index','投诉管理',0,1,1,'2018-01-30 03:46:10'),(260,'manage/complaint/change_status','修改投诉处理状态',0,1,1,'2018-01-30 03:46:11'),(261,'manage/complaint/change_admin_read','修改投诉读取状态',0,1,1,'2018-01-30 03:46:11'),(262,'manage/complaint/del','删除投诉',0,1,1,'2018-01-30 03:46:12'),(263,'manage/order/change_freeze_status','修改订单冻结状态',0,1,1,'2018-02-02 02:24:23'),(264,'manage/user/loginlog','商户登录日志',0,1,1,'2018-02-02 02:24:31'),(265,'merchant/user/closelink','',0,0,0,'2018-03-16 22:22:03'),(266,'merchant/goodscategory','',0,0,0,'2018-03-16 22:22:32'),(267,'merchant/cash/apply','',0,0,0,'2018-03-16 22:22:35'),(268,'merchant/cash','',0,0,0,'2018-03-16 22:22:38'),(269,'merchant','',0,0,0,'2018-03-16 22:23:00'),(270,'manage/article/add','添加文章',0,1,1,'2018-03-16 22:23:38'),(271,'manage/article/edit','编辑文章',0,1,1,'2018-03-16 22:23:39'),(272,'manage/article/index','内容管理',0,1,1,'2018-03-16 22:23:39'),(273,'manage/article/change_status','修改文章状态',0,1,1,'2018-03-16 22:23:40'),(274,'manage/article/del','删除文章',0,1,1,'2018-03-16 22:23:41'),(275,'manage/articlecategory/index','文章分类管理',0,1,1,'2018-03-16 22:23:53'),(276,'manage/articlecategory/add','添加文章分类',0,1,1,'2018-03-16 22:23:53'),(277,'manage/articlecategory/edit','编辑文章分类',0,1,1,'2018-03-16 22:23:54'),(278,'manage/articlecategory/change_status','修改文章分类状态',0,1,1,'2018-03-16 22:23:54'),(279,'manage/articlecategory/del','删除文章分类',0,1,1,'2018-03-16 22:23:55'),(280,'manage/backup/index','备份管理',0,1,1,'2018-03-16 22:24:04'),(281,'manage/backup/tablist','获取数据表',0,1,1,'2018-03-16 22:24:05'),(282,'manage/backup/backall','备份数据库',0,1,1,'2018-03-16 22:24:06'),(283,'manage/backup/backtables','按表备份',0,1,1,'2018-03-16 22:24:07'),(284,'manage/backup/recover','还原数据库',0,1,1,'2018-03-16 22:24:07'),(285,'manage/backup/downloadbak','下载备份文件',0,1,1,'2018-03-16 22:24:08'),(286,'manage/backup/deletebak','删除备份',0,1,1,'2018-03-16 22:24:09'),(287,'manage/article','内容管理',0,1,1,'2018-03-19 00:32:51'),(288,'admin/auth/google','',0,0,0,'2018-03-19 00:33:13'),(289,'admin/auth/bindgoogle','生成绑定谷歌身份验证器二维码',0,0,1,'2018-03-19 00:39:13'),(290,'manage/user','用户管理',0,1,1,'2018-03-19 00:41:20'),(291,'manage/sms','短信配置',0,1,1,'2018-03-19 00:44:54'),(292,'manage/site','站点信息',0,1,1,'2018-03-19 00:45:04'),(293,'manage/product','支付产品管理',0,1,1,'2018-03-19 00:47:47'),(294,'manage/order/del_batch','批量删除无效订单',0,1,1,'2018-03-19 00:48:42'),(295,'manage/order/del','删除无效订单',0,1,1,'2018-03-19 00:48:43'),(296,'manage/order','交易明细',0,1,1,'2018-03-19 00:50:10'),(297,'manage/log','金额变动记录',0,1,1,'2018-03-19 00:51:25'),(298,'manage/index','主页',0,1,1,'2018-03-19 00:51:55'),(299,'manage/goods','商品管理',0,1,1,'2018-03-19 00:52:09'),(300,'manage/email','邮件配置',0,1,1,'2018-03-19 00:53:07'),(301,'manage/complaint','投诉管理',0,1,1,'2018-03-19 00:54:06'),(302,'manage/channelaccount','供应商账号管理',0,1,1,'2018-03-19 00:54:52'),(303,'manage/channel','供应商管理',0,1,1,'2018-03-19 02:45:06'),(304,'manage/cash','提现管理',0,1,1,'2018-03-19 02:46:43'),(305,'manage/backup','备份管理',0,1,1,'2018-03-19 02:49:14'),(306,'manage/articlecategory','文章分类管理',0,1,1,'2018-03-19 02:53:43'),(307,'manage/goods/change_trade_no_status','',0,1,1,'2018-04-16 17:04:48'),(308,'shop/shop/index','',0,0,0,'2018-06-18 02:19:27'),(309,'shop/shop/category','',0,0,0,'2018-06-18 02:19:28'),(310,'shop/shop/goods','',0,0,0,'2018-06-18 02:20:39'),(311,'shop/shop/getgoodslist','',0,0,0,'2018-06-18 02:20:40'),(312,'shop/shop/getgoodsinfo','',0,0,0,'2018-06-18 02:20:41'),(313,'shop/shop/getrate','',0,0,0,'2018-06-18 02:20:41'),(314,'shop/shop/getdiscounts','',0,0,0,'2018-06-18 02:20:42'),(315,'shop/shop/getdiscount','',0,0,0,'2018-06-18 02:20:43'),(316,'shop/shop/checkvisitpassword','',0,0,0,'2018-06-18 02:20:43'),(317,'shop/shop/checkcoupon','',0,0,0,'2018-06-18 02:20:44'),(318,'admin/mlog/index','',0,1,1,'2020-03-06 19:18:42'),(319,'admin/app/index','',0,1,1,'2020-03-06 19:18:52'),(320,'admin/mlog/del','',0,1,1,'2020-03-06 19:18:56'),(321,'admin/nav/index','',0,1,1,'2020-03-06 19:18:58'),(322,'admin/nav/add','',1,1,1,'2020-03-06 19:19:00'),(323,'admin/nav/edit','',0,1,1,'2020-03-06 19:19:01'),(324,'admin/nav/del','',0,1,1,'2020-03-06 19:19:05'),(325,'admin/nav/forbid','',0,1,1,'2020-03-06 19:19:06'),(326,'admin/nav/resume','',0,1,1,'2020-03-06 19:19:07'),(327,'api/auth/login','',0,0,0,'2020-03-06 19:19:12'),(328,'api/auth/loginbyopenid','',0,0,0,'2020-03-06 19:19:14'),(329,'api/auth/refreshlogintoken','',0,0,0,'2020-03-06 19:19:16'),(330,'api/auth/register','',0,0,0,'2020-03-06 19:19:17'),(331,'api/auth/forgot','',0,0,0,'2020-03-06 19:19:17'),(332,'api/authbase/checktoken','',0,0,0,'2020-03-06 19:19:19'),(333,'api/card/lists','',0,0,0,'2020-03-06 19:19:21'),(334,'api/card/add','',0,0,0,'2020-03-06 19:19:22'),(335,'api/card/del','',0,0,0,'2020-03-06 19:19:23'),(336,'api/card/restore','',0,0,0,'2020-03-06 19:19:25'),(337,'manage/content/del','',0,1,1,'2020-03-08 08:25:44'),(338,'manage/site/spread','',0,1,1,'2020-03-08 08:26:39'),(339,'manage/site/clearcache','',0,1,1,'2020-03-08 08:26:55'),(340,'manage/user/unlock','',0,1,1,'2020-03-08 08:29:29'),(341,'manage/user/dailiduijiema','',0,0,1,'2020-03-08 08:29:30'),(342,'manage/rate/index','',0,1,1,'2020-03-08 08:30:48'),(343,'manage/rate/add','',0,1,1,'2020-03-08 08:31:20'),(344,'manage/rate/detail','',0,1,1,'2020-03-08 08:31:39'),(345,'manage/rate/save','',0,1,1,'2020-03-08 08:31:41'),(346,'manage/rate/del','',0,1,1,'2020-03-08 08:31:51'),(347,'manage/user/apikey','',0,0,1,'2020-03-08 08:33:10'),(348,'manage/user/getraterouteinfo','',0,0,1,'2020-03-08 08:33:42'),(349,'manage/order/budan','',0,1,1,'2020-03-08 08:34:30'),(350,'manage/goods/goodschi','',0,0,1,'2020-03-08 08:36:17'),(351,'manage/cash/batch_del','',0,0,1,'2020-03-08 08:39:48'),(352,'manage/cash/pay_batch','',0,0,1,'2020-03-08 08:39:54'),(353,'manage/cash/daifu','',0,0,1,'2020-03-08 08:40:02'),(354,'manage/cash/dumpcashs','',0,0,1,'2020-03-08 08:40:13'),(355,'manage/goods/change_freeze','',0,1,1,'2020-03-08 08:44:22'),(356,'manage/invitecode/add','',0,1,1,'2020-03-08 08:44:27'),(357,'manage/cashchannel','',0,1,1,'2020-03-09 23:37:00'),(358,'manage/cashchannel/index','',0,1,1,'2020-03-09 23:37:41'),(359,'manage/invitecode/index','',0,1,1,'2020-03-09 23:39:21'),(360,'manage/invitecode/del','',0,1,1,'2020-03-09 23:39:24'),(361,'manage/invitecode/delnum','',0,1,1,'2020-03-09 23:39:26'),(362,'manage/goods/del','',0,1,1,'2020-03-09 23:39:29'),(363,'manage/goods/zdchi','',0,1,1,'2020-03-09 23:39:30'),(364,'manage/goods/delchi','',0,1,1,'2020-03-09 23:39:31'),(365,'manage/order/senddelbatchsms','',0,1,1,'2020-03-09 23:39:37'),(366,'manage/rate/change_status','',0,1,1,'2020-03-09 23:39:41'),(367,'manage/complaint/detail','',0,1,1,'2020-03-09 23:40:16'),(368,'manage/complaint/win','',0,1,1,'2020-03-09 23:40:17'),(369,'manage/goods/jc','',0,0,1,'2020-03-13 21:17:55'),(370,'manage/goods/diyike','',0,0,1,'2020-03-13 21:18:11'),(371,'manage/goods/dierke','',0,0,1,'2020-03-13 21:18:12'),(372,'manage/goods/disanke','',0,0,1,'2020-03-13 21:18:13'),(373,'manage/goods/disike','',0,0,1,'2020-03-13 21:18:13'),(374,'manage/goods/diwuke','',0,0,1,'2020-03-13 21:18:14'),(375,'manage/goods/diliuke','',0,0,1,'2020-03-13 21:18:14'),(376,'manage/goods/diqike','',0,0,1,'2020-03-13 21:18:15'),(377,'admin/renzheng/index','认证管理',1,1,1,'2020-05-28 00:21:00'),(378,'manage/index/banben','',0,0,1,'2020-07-05 12:24:08'),(379,'manage/index/spjc','',0,0,1,'2020-07-05 12:24:08'),(380,'manage/index/video','',0,0,1,'2020-07-05 12:24:08'),(381,'manage/order/del_batchweek','',0,0,1,'2020-07-05 12:24:13'),(382,'manage/order/del_batchmonth','',0,0,1,'2020-07-05 12:24:13'),(383,'manage/rate/set_register_default','',0,0,1,'2020-07-05 12:24:16'),(384,'manage/user/views','',0,0,1,'2020-07-05 12:25:01'),(385,'manage/user/allow_update','',0,0,1,'2020-07-05 12:25:03'),(386,'manage/goods/delchiprice','',0,0,1,'2020-07-05 12:25:11'),(387,'manage/goods/chipriceedit','',0,0,1,'2020-07-05 12:25:24'),(388,'manage/goods/goodschiprice','',0,0,1,'2020-07-05 12:25:25'),(389,'manage/goods/chipriceadd','',0,0,1,'2020-07-05 12:25:26'),(390,'manage/complaint/send','',0,0,1,'2020-07-05 12:25:28'),(391,'manage/complaint/sendimg','',0,0,1,'2020-07-05 12:25:28'),(392,'manage/channel/uninstall','',0,0,1,'2020-07-05 12:25:30'),(393,'manage/channel/install','',0,0,1,'2020-07-05 12:25:31'),(394,'manage/channel/change_available','',0,0,1,'2020-07-05 12:25:33'),(395,'manage/cashchannelaccount/getfields','',0,0,1,'2020-07-05 12:25:35'),(396,'manage/cashchannelaccount/clear','',0,0,1,'2020-07-05 12:25:36'),(397,'manage/cashchannelaccount/change_status','',0,0,1,'2020-07-05 12:25:36'),(398,'manage/cashchannelaccount/del','',0,0,1,'2020-07-05 12:25:37'),(399,'manage/cashchannelaccount/edit','',0,0,1,'2020-07-05 12:25:37'),(400,'manage/cashchannelaccount/index','',0,0,1,'2020-07-05 12:25:38'),(401,'manage/cashchannelaccount/add','',0,0,1,'2020-07-05 12:25:39'),(402,'manage/cashchannel/change_status','',0,0,1,'2020-07-05 12:25:41'),(403,'manage/cash/getcashdata','',0,0,1,'2020-07-05 12:25:43'),(404,'manage/article/top','',0,0,1,'2020-07-05 12:25:45'),(405,'admin/shengji/upgrade','',0,0,1,'2020-07-05 12:25:48'),(406,'admin/shengji/index','',0,0,1,'2020-07-05 12:25:49'),(407,'admin/plug/upgrade','',0,0,1,'2020-07-05 12:25:59'),(408,'admin/plug/index','',0,0,1,'2020-07-05 12:26:00'),(409,'admin/plug/gettophost','',0,0,1,'2020-07-05 12:26:01'),(410,'manage/user/yjrate','一键费率',0,0,1,'2020-07-23 00:21:00'),(411,'admin/auth/xieyi','',0,0,1,'2021-02-22 09:25:53'),(412,'admin/auth/xieyiok','',0,0,1,'2021-02-22 09:25:54'),(413,'admin/config/xieyi','',0,0,1,'2021-02-22 09:25:56'),(414,'admin/config/xieyiok','',0,0,1,'2021-02-22 09:25:57'),(415,'admin/menu/xieyi','',0,0,0,'2021-02-22 09:26:01'),(416,'manage/goods/goodshsz','',0,1,1,'2021-02-22 09:26:32'),(417,'admin/renzheng/xieyi','',0,0,0,'2021-02-22 09:26:45'),(418,'admin/renzheng/xieyiok','',0,0,0,'2021-02-22 09:26:46'),(419,'manage/goods/goodshsz.html','商品回收站',1,1,1,'2020-05-28 00:21:00'),(420,'admin/ip/index','',0,1,1,'2021-03-14 03:53:51'),(421,'admin/ip/forbid','',0,1,1,'2021-03-14 03:53:51'),(422,'admin/ip/resume','',0,1,1,'2021-03-14 03:53:52'),(423,'admin/ip/xieyi','',0,1,1,'2021-03-14 03:53:52'),(424,'admin/ip/xieyiok','',0,1,1,'2021-03-14 03:53:53'),(425,'admin/video/index','视频管理',1,1,1,'2021-07-31 17:34:31'),(426,'manage/buyer','',0,1,1,'2021-08-06 23:37:29'),(427,'manage/buyer/index','',1,1,1,'2021-08-06 23:41:11'),(428,'admin/merchant/index','',1,0,1,'2021-08-21 23:24:31'),(429,'manage/buyer/add',NULL,0,1,1,'2021-09-03 20:30:27'),(430,'manage/buyer/edit',NULL,0,1,1,'2021-09-03 20:30:27'),(431,'manage/buyer/login',NULL,0,1,1,'2021-09-03 20:30:29'),(432,'manage/buyer/del',NULL,0,1,1,'2021-09-03 20:30:29'),(433,'manage/buyer/manage_money',NULL,0,1,1,'2021-09-03 20:30:30'),(434,'manage/buyer/change_status',NULL,0,1,1,'2021-09-03 20:30:31'),(435,'manage/buyer/change_freeze_status',NULL,0,1,1,'2021-09-03 20:30:32'),(436,'manage/order/batch_del',NULL,0,0,1,'2021-09-03 20:30:59'),(437,'manage/log/buyer_money',NULL,0,1,1,'2021-09-03 20:31:18'),(438,'admin/video/add',NULL,0,1,1,'2021-09-03 20:32:58'),(439,'admin/video/edit',NULL,0,1,1,'2021-09-03 20:32:59'),(440,'admin/video/del',NULL,0,1,1,'2021-09-03 20:33:00'),(441,'admin/video/forbid',NULL,0,1,1,'2021-09-03 20:33:02'),(442,'admin/video/resume',NULL,0,1,1,'2021-09-03 20:33:03'),(443,'admin/video/xieyi',NULL,0,1,1,'2021-09-03 20:33:05'),(444,'admin/shang/setting',NULL,0,1,1,'2021-09-03 20:33:27'),(445,'admin/shang/index',NULL,0,1,1,'2021-09-03 20:33:28'),(446,'admin/shang/add',NULL,0,1,1,'2021-09-03 20:33:28'),(447,'admin/shang/edit',NULL,0,1,1,'2021-09-03 20:33:29'),(448,'admin/shang/change_status',NULL,0,1,1,'2021-09-03 20:33:30'),(449,'admin/shang/del',NULL,0,1,1,'2021-09-03 20:33:32'),(450,'admin/shang/delorder',NULL,0,1,1,'2021-09-03 20:33:33'),(451,'admin/shang/fahuo',NULL,0,1,1,'2021-09-03 20:33:33'),(452,'admin/shang/orders',NULL,0,1,1,'2021-09-03 20:33:34'),(453,'admin/shang/xieyi',NULL,0,0,0,'2021-09-03 20:33:35'),(454,'admin/plug/getversion',NULL,0,0,1,'2021-09-03 20:33:51'),(455,'admin/mlog/xieyi',NULL,0,0,0,'2021-09-03 20:33:56'),(456,'admin/test/google',NULL,0,0,1,'2021-09-03 20:34:29'),(457,'admin/test/send_code',NULL,0,0,1,'2021-09-03 20:34:30'),(458,'admin/test/checkcode',NULL,0,0,1,'2021-09-03 20:34:31'),(459,'admin/test/send_ecode',NULL,0,0,1,'2021-09-03 20:34:32'),(460,'admin/test/checkecode',NULL,0,0,1,'2021-09-03 20:34:33'),(461,'manage/audit/index',NULL,0,1,1,'2021-09-03 20:35:09'),(462,'manage/audit/del',NULL,0,1,1,'2021-09-03 20:35:10'),(463,'manage/audit/edit',NULL,0,1,1,'2021-09-03 20:35:15'),(464,'manage/goods/xieyiok',NULL,0,0,1,'2021-09-03 20:36:34'),(465,'manage/goods/xieyi',NULL,0,0,1,'2021-09-03 20:36:35'),(466,'manage/goods/shallchi',NULL,0,0,1,'2021-09-03 20:36:36'),(467,'manage/goods/shchi',NULL,0,0,1,'2021-09-03 20:36:37'),(468,'manage/goods/delbatchhsz',NULL,0,0,1,'2021-09-03 20:36:38'),(469,'manage/goods/deldel',NULL,0,0,1,'2021-09-03 20:36:40'),(470,'manage/goods/delhui',NULL,0,0,1,'2021-09-03 20:36:41'),(471,'manage/srate/index',NULL,0,1,1,'2021-09-03 20:37:36'),(472,'manage/srate/add',NULL,0,1,1,'2021-09-03 20:37:37'),(473,'manage/srate/detail',NULL,0,1,1,'2021-09-03 20:37:38'),(474,'manage/srate/save',NULL,0,1,1,'2021-09-03 20:37:39'),(475,'manage/srate/del',NULL,0,1,1,'2021-09-03 20:37:40'),(476,'manage/srate/change_status',NULL,0,1,1,'2021-09-03 20:37:41'),(477,'manage/srate/set_register_default',NULL,0,1,1,'2021-09-03 20:37:42'),(478,'manage/srate/xieyi',NULL,0,0,0,'2021-09-03 20:37:43'),(479,'manage/srate/xieyiok',NULL,0,0,0,'2021-09-03 20:37:43'),(480,'manage/cash/buyerconfig',NULL,0,0,1,'2021-09-03 20:38:22'),(481,'manage/order/dd_budan',NULL,0,0,1,'2021-09-03 20:38:49'),(482,'manage/selfchannel/index',NULL,0,0,1,'2021-09-03 20:38:56'),(483,'manage/selfchannel/add',NULL,0,0,1,'2021-09-03 20:38:57'),(484,'manage/selfchannel/edit',NULL,0,0,1,'2021-09-03 20:38:58'),(485,'manage/selfchannel/del',NULL,0,0,1,'2021-09-03 20:38:59'),(486,'manage/selfchannel/change_status',NULL,0,0,1,'2021-09-03 20:39:00'),(487,'manage/selfchannel/change_available',NULL,0,0,1,'2021-09-03 20:39:01'),(488,'manage/selfchannel/xieyi',NULL,0,0,0,'2021-09-03 20:39:02'),(489,'manage/selfchannel/xieyiok',NULL,0,0,0,'2021-09-03 20:39:03'),(490,'manage/selfchannelaccount/index',NULL,0,0,1,'2021-09-03 20:39:08'),(491,'manage/selfchannelaccount/add',NULL,0,0,1,'2021-09-03 20:39:10'),(492,'manage/selfchannelaccount/edit',NULL,0,0,1,'2021-09-03 20:39:10'),(493,'manage/selfchannelaccount/del',NULL,0,0,1,'2021-09-03 20:39:11'),(494,'manage/selfchannelaccount/change_status',NULL,0,0,1,'2021-09-03 20:39:12'),(495,'manage/selfchannelaccount/getfields',NULL,0,0,1,'2021-09-03 20:39:13'),(496,'manage/selfchannelaccount/xieyi',NULL,0,0,1,'2021-09-03 20:39:14'),(497,'manage/selfchannelaccount/xieyiok',NULL,0,0,1,'2021-09-03 20:39:15'),(498,'manage/user/self_rate',NULL,0,0,1,'2021-09-03 20:39:26'),(499,'manage/user/channelzustatus',NULL,0,0,1,'2021-09-03 20:39:27'),(500,'manage/user/yjsrate',NULL,0,0,1,'2021-09-03 20:39:28'),(501,'manage/zfbcash/getcashdata',NULL,0,0,1,'2021-09-03 20:39:33'),(502,'manage/zfbcash/dumpcashs',NULL,0,0,1,'2021-09-03 20:39:34'),(503,'manage/zfbcash/generate_excelzfb',NULL,0,0,1,'2021-09-03 20:39:35'),(504,'manage/zfbcash/xieyi',NULL,0,0,1,'2021-09-03 20:39:36'),(505,'manage/zfbcash/xieyiok',NULL,0,0,1,'2021-09-03 20:39:37'),(506,'admin/shengji/gettophost',NULL,0,0,1,'2021-09-03 20:50:28'),(507,'admin/goodstgset/index','推广商品设置',1,1,1,'2021-09-09 03:34:31'),(508,'admin/goodstggg/index','首页广告设置',1,1,1,'2021-09-09 03:34:31'),(509,'admin/goodstgclass/index','商品分类设置',1,1,1,'2021-09-09 03:34:31'),(510,'admin/goodstggl/index','推广商品管理',1,1,1,'2021-09-09 03:34:31'),(511,'manage/site/moban',NULL,0,1,1,'2021-09-11 01:52:04'),(512,'admin/goodstgclass/add',NULL,0,1,1,'2021-09-12 16:14:31'),(513,'admin/goodstgclass/edit',NULL,0,1,1,'2021-09-12 16:14:32'),(514,'admin/goodstgclass/change_status',NULL,0,1,1,'2021-09-12 16:14:33'),(515,'admin/goodstgclass/del',NULL,0,1,1,'2021-09-12 16:14:34'),(516,'admin/goodstgclass/xieyi',NULL,0,1,1,'2021-09-12 16:14:34'),(517,'admin/goodstgclass/xieyiok',NULL,0,0,1,'2021-09-12 16:14:36'),(518,'admin/goodstggg/add',NULL,0,1,1,'2021-09-12 16:14:44'),(519,'admin/goodstggg/ady',NULL,0,1,1,'2021-09-12 16:14:45'),(520,'admin/goodstggg/edit',NULL,0,1,1,'2021-09-12 16:14:46'),(521,'admin/goodstggg/change_status',NULL,0,1,1,'2021-09-12 16:14:47'),(522,'admin/goodstggg/top',NULL,0,1,1,'2021-09-12 16:14:48'),(523,'admin/goodstggg/del',NULL,0,1,1,'2021-09-12 16:14:49'),(524,'admin/goodstggg/xieyi',NULL,0,1,1,'2021-09-12 16:14:55'),(525,'admin/goodstggg/xieyiok',NULL,0,1,1,'2021-09-12 16:14:57'),(526,'admin/goodstggl/detail',NULL,0,1,1,'2021-09-12 16:16:43'),(527,'admin/goodstggl/goodshsz',NULL,0,1,1,'2021-09-12 16:16:44'),(528,'admin/goodstggl/goodschi',NULL,0,1,1,'2021-09-12 16:16:45'),(529,'admin/goodstggl/goodschiprice',NULL,0,1,1,'2021-09-12 16:16:46'),(530,'admin/goodstggl/chipriceadd',NULL,0,1,1,'2021-09-12 16:16:47'),(531,'admin/goodstggl/chipriceedit',NULL,0,1,1,'2021-09-12 16:16:48'),(532,'admin/goodstggl/delchiprice',NULL,0,1,1,'2021-09-12 16:16:49'),(533,'admin/goodstggl/change_status',NULL,0,1,1,'2021-09-12 16:16:50'),(534,'admin/goodstggl/change_tgshstatus',NULL,0,1,1,'2021-09-12 16:16:51'),(535,'admin/goodstggl/change_freeze',NULL,0,1,1,'2021-09-12 16:16:51'),(536,'admin/goodstggl/change_trade_no_status',NULL,0,1,1,'2021-09-12 16:16:52'),(537,'admin/goodstggl/del',NULL,0,1,1,'2021-09-12 16:16:54'),(538,'admin/goodstggl/deldel',NULL,0,1,1,'2021-09-12 16:16:54'),(539,'admin/goodstggl/delhui',NULL,0,1,1,'2021-09-12 16:16:55'),(540,'admin/goodstggl/delbatchhsz',NULL,0,1,1,'2021-09-12 16:16:56'),(541,'admin/goodstggl/zdchi',NULL,0,1,1,'2021-09-12 16:16:57'),(542,'admin/goodstggl/shchi',NULL,0,1,1,'2021-09-12 16:16:58'),(543,'admin/goodstggl/shallchi',NULL,0,1,1,'2021-09-12 16:17:00'),(544,'admin/goodstggl/delchi',NULL,0,1,1,'2021-09-12 16:17:00'),(545,'admin/goodstggl/xieyiok',NULL,0,1,1,'2021-09-12 16:17:02'),(546,'admin/goodstggl/xieyi',NULL,0,1,1,'2021-09-12 16:17:03'),(547,'manage/goods/detail',NULL,0,0,1,'2021-09-12 16:18:11');
/*!40000 ALTER TABLE `system_node` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_sequence`
--

DROP TABLE IF EXISTS `system_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_sequence` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) DEFAULT NULL COMMENT '序号类型',
  `sequence` char(50) NOT NULL COMMENT '序号值',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_system_sequence_unique` (`type`,`sequence`) USING BTREE,
  KEY `index_system_sequence_type` (`type`),
  KEY `index_system_sequence_number` (`sequence`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统序号表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_sequence`
--

LOCK TABLES `system_sequence` WRITE;
/*!40000 ALTER TABLE `system_sequence` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_user`
--

DROP TABLE IF EXISTS `system_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL DEFAULT '' COMMENT '用户登录名',
  `password` char(32) NOT NULL DEFAULT '' COMMENT '用户登录密码',
  `qq` varchar(16) DEFAULT NULL COMMENT '联系QQ',
  `mail` varchar(32) DEFAULT NULL COMMENT '联系邮箱',
  `phone` varchar(16) DEFAULT NULL COMMENT '联系手机号',
  `desc` varchar(255) DEFAULT '' COMMENT '备注说明',
  `login_num` bigint(20) unsigned DEFAULT '0' COMMENT '登录次数',
  `login_at` datetime DEFAULT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态(0:禁用,1:启用)',
  `authorize` varchar(255) DEFAULT NULL,
  `is_deleted` tinyint(1) unsigned DEFAULT '0' COMMENT '删除状态(1:删除,0:未删)',
  `create_by` bigint(20) unsigned DEFAULT NULL COMMENT '创建人',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `google_secret_key` varchar(128) DEFAULT '' COMMENT '谷歌令牌密钥',
  `safecode` varchar(50) DEFAULT '' COMMENT '安全码',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_system_user_username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10010 DEFAULT CHARSET=utf8 COMMENT='系统用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_user`
--

LOCK TABLES `system_user` WRITE;
/*!40000 ALTER TABLE `system_user` DISABLE KEYS */;
INSERT INTO `system_user` VALUES (10005,'admin','7fef6171469e80d32c0559f88b377245',NULL,'','','demo',466,'2022-06-09 23:33:11',1,'3,4,5,6',0,NULL,'2018-04-23 16:40:09',NULL,''),(10009,'kekewl2022','7fef6171469e80d32c0559f88b377245',NULL,'','','demo',465,'2022-06-09 19:38:54',1,'3,4,5,6',0,NULL,'2018-04-23 16:40:09',NULL,'');
/*!40000 ALTER TABLE `system_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unique_orderno`
--

DROP TABLE IF EXISTS `unique_orderno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unique_orderno` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trade_no` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '订单号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_trade_no` (`trade_no`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unique_orderno`
--

LOCK TABLES `unique_orderno` WRITE;
/*!40000 ALTER TABLE `unique_orderno` DISABLE KEYS */;
/*!40000 ALTER TABLE `unique_orderno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级ID',
  `openid` varchar(50) NOT NULL DEFAULT '' COMMENT '微信openid',
  `username` varchar(50) NOT NULL,
  `password` char(32) NOT NULL,
  `mobile` varchar(15) NOT NULL DEFAULT '' COMMENT '手机号',
  `qq` varchar(16) NOT NULL,
  `email` varchar(50) NOT NULL,
  `subdomain` varchar(250) NOT NULL DEFAULT '' COMMENT '子域名',
  `shop_name` varchar(20) NOT NULL DEFAULT '' COMMENT '店铺名称',
  `shop_notice` varchar(200) NOT NULL DEFAULT '' COMMENT '公告通知',
  `statis_code` varchar(1024) NOT NULL DEFAULT '' COMMENT '统计代码',
  `pay_theme` varchar(255) NOT NULL DEFAULT 'default' COMMENT '支付页风格',
  `stock_display` tinyint(3) unsigned NOT NULL DEFAULT '2' COMMENT '库存展示方式 1实际库存 2库存范围',
  `money` decimal(10,3) NOT NULL DEFAULT '0.000',
  `rebate` decimal(10,3) unsigned NOT NULL DEFAULT '0.000',
  `freeze_money` decimal(10,3) NOT NULL DEFAULT '0.000',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '0未审核 1已审核',
  `is_freeze` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否冻结 0否 1是',
  `create_at` int(10) unsigned NOT NULL,
  `ip` varchar(50) DEFAULT '' COMMENT 'IP地址',
  `website` varchar(255) NOT NULL DEFAULT '' COMMENT '商户网站',
  `is_close` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否关闭店铺 0否 1是',
  `shop_notice_auto_pop` tinyint(4) NOT NULL DEFAULT '1' COMMENT '商家公告是否自动弹出',
  `cash_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '提现方式',
  `login_auth` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否开启安全登录',
  `login_auth_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '安全登录验证方式，1：短信，2：邮件，3：谷歌密码验证',
  `google_secret_key` varchar(128) DEFAULT '' COMMENT '谷歌令牌密钥',
  `shop_gouka_protocol_pop` tinyint(4) NOT NULL DEFAULT '1' COMMENT '购卡协议是否自动弹出',
  `user_notice_auto_pop` tinyint(4) NOT NULL DEFAULT '1' COMMENT '商家是否自动弹出',
  `login_key` int(11) NOT NULL DEFAULT '0' COMMENT '用户登录标记',
  `fee_payer` tinyint(4) NOT NULL DEFAULT '0' COMMENT '订单手续费支付方，0：跟随系统，1：商家承担，2买家承担',
  `settlement_type` tinyint(4) NOT NULL DEFAULT '-1' COMMENT '结算方式，-1：跟随系统，1:T1结算，0:T0结算',
  `daili_shenhe` tinyint(4) NOT NULL DEFAULT '0' COMMENT '代理审核方式，0：手动，1:自动',
  `daili_duijiema` varchar(50) NOT NULL DEFAULT '' COMMENT '代理对接码',
  `key` varchar(50) NOT NULL DEFAULT '' COMMENT '支付接口秘钥',
  `dl` int(11) NOT NULL COMMENT '登录提醒',
  `ts` int(11) NOT NULL COMMENT '收到投诉',
  `kc` int(11) NOT NULL COMMENT '库存不足',
  `js` int(11) NOT NULL COMMENT '结算成功',
  `jy` int(11) NOT NULL COMMENT '交易成功',
  `gg` int(11) NOT NULL COMMENT '重要公告',
  `iscode` int(11) NOT NULL COMMENT '安全码开关 0为关闭 1为开启 ',
  `codes` varchar(20) NOT NULL COMMENT '安全码',
  `renzheng_name` varchar(100) DEFAULT NULL COMMENT '姓名',
  `renzheng_sfz` varchar(100) DEFAULT NULL COMMENT '身份证号码',
  `renzheng_sfz_img` varchar(200) DEFAULT NULL COMMENT '身份证照片',
  `renzheng_address` varchar(100) DEFAULT NULL COMMENT '家庭住址',
  `renzheng_mobile` varchar(100) DEFAULT NULL COMMENT '认证手机',
  `index_theme` varchar(100) DEFAULT NULL COMMENT '前台模板',
  `merchant_theme` varchar(100) DEFAULT NULL COMMENT '会员中心模板',
  `jifen` float(11,4) DEFAULT '0.0000' COMMENT '积分',
  `address` varchar(200) DEFAULT NULL COMMENT '收货地址',
  `mobile_theme` varchar(100) DEFAULT 'default' COMMENT '手机模板',
  `yyopen` int(2) DEFAULT '0' COMMENT '音乐开关',
  `yymoban` int(2) DEFAULT '1' COMMENT '音乐模板',
  `group_type` int(1) NOT NULL DEFAULT '0' COMMENT '商户分组0平台1自签',
  `poundage` decimal(14,3) DEFAULT '0.000' COMMENT '手续费',
  `shop_yuyin` text COMMENT '自定义语音',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_mobile_uindex` (`mobile`),
  UNIQUE KEY `user_email_uindex` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=10444 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (10443,0,'','user','d0dcbf0d12a6b1e7fbfa2ce5848f3eff','13888888888','123456','kekewl2022@163.com','','','','','default',2,0.000,0.000,0.000,1,0,1654789751,'113.122.201.18','',0,1,1,0,1,'',1,1,0,0,-1,0,'','',0,0,0,0,0,0,0,'',NULL,NULL,NULL,NULL,NULL,NULL,'default',0.0000,NULL,'default',0,1,0,0.000,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_audit`
--

DROP TABLE IF EXISTS `user_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_audit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '商户id',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态0待处理1通过2取消',
  `create_at` int(11) NOT NULL COMMENT '创建时间',
  `complete_time` int(11) NOT NULL COMMENT '处理时间',
  `reason` varchar(255) NOT NULL COMMENT '取消原因',
  `type` tinyint(1) DEFAULT NULL COMMENT '申请类型',
  `ftype` tinyint(1) DEFAULT NULL COMMENT '当前类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_audit`
--

LOCK TABLES `user_audit` WRITE;
/*!40000 ALTER TABLE `user_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_channel`
--

DROP TABLE IF EXISTS `user_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_channel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `channel_id` int(10) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `htstatus` int(2) DEFAULT '0' COMMENT '后台控制状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`channel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_channel`
--

LOCK TABLES `user_channel` WRITE;
/*!40000 ALTER TABLE `user_channel` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_collect`
--

DROP TABLE IF EXISTS `user_collect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_collect` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '类型 1支付宝 2微信 3银行卡',
  `info` text NOT NULL,
  `create_at` int(10) unsigned NOT NULL DEFAULT '0',
  `collect_img` tinytext,
  `allow_update` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1为允许用户修改收款信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_collect`
--

LOCK TABLES `user_collect` WRITE;
/*!40000 ALTER TABLE `user_collect` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_collect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_login_error_log`
--

DROP TABLE IF EXISTS `user_login_error_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_login_error_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_name` varchar(50) NOT NULL DEFAULT '' COMMENT '登录名',
  `password` varchar(255) NOT NULL DEFAULT '' COMMENT '尝试密码',
  `user_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0：普通用户 1：后台管理员账号',
  `login_from` int(1) NOT NULL DEFAULT '0' COMMENT '登录来源：0：前台 1：总后台',
  `login_time` int(11) NOT NULL DEFAULT '0' COMMENT '登录时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_login_error_log`
--

LOCK TABLES `user_login_error_log` WRITE;
/*!40000 ALTER TABLE `user_login_error_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_login_error_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_login_log`
--

DROP TABLE IF EXISTS `user_login_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_login_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `ip` varchar(15) NOT NULL DEFAULT '',
  `create_at` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_login_log`
--

LOCK TABLES `user_login_log` WRITE;
/*!40000 ALTER TABLE `user_login_log` DISABLE KEYS */;
INSERT INTO `user_login_log` VALUES (1,10443,'113.122.201.18',1654789761),(2,10443,'113.122.201.18',1654790296),(3,10443,'113.122.201.18',1654791314);
/*!40000 ALTER TABLE `user_login_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_money_log`
--

DROP TABLE IF EXISTS `user_money_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_money_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `business_type` enum('sub_sold_rebate','sub_fee_rebate','cash_notpass','cash_success','apply_cash','admin_dec','admin_inc','goods_sold','fee','sub_register','freeze','unfreeze') NOT NULL,
  `user_id` int(10) unsigned NOT NULL COMMENT '用户ID',
  `money` decimal(10,3) NOT NULL COMMENT '变动金额',
  `balance` decimal(10,3) NOT NULL COMMENT '剩余',
  `reason` varchar(255) NOT NULL DEFAULT '' COMMENT '变动原因',
  `create_at` int(10) unsigned NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_money_log`
--

LOCK TABLES `user_money_log` WRITE;
/*!40000 ALTER TABLE `user_money_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_money_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_poundage_log`
--

DROP TABLE IF EXISTS `user_poundage_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_poundage_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `business_type` enum('admin_dec','admin_inc','fee','freeze','unfreeze','recharge') NOT NULL,
  `user_id` int(10) unsigned NOT NULL COMMENT '商家ID',
  `money` decimal(10,3) NOT NULL COMMENT '变动金额',
  `balance` decimal(10,3) NOT NULL COMMENT '剩余',
  `reason` varchar(255) NOT NULL DEFAULT '' COMMENT '变动原因',
  `create_at` int(10) unsigned NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_poundage_log`
--

LOCK TABLES `user_poundage_log` WRITE;
/*!40000 ALTER TABLE `user_poundage_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_poundage_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_rate`
--

DROP TABLE IF EXISTS `user_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_rate` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL COMMENT '用户ID',
  `channel_id` int(10) unsigned NOT NULL COMMENT '渠道ID',
  `rate` decimal(10,4) unsigned NOT NULL COMMENT '发卡费率',
  `rate_api` decimal(10,4) unsigned NOT NULL COMMENT '支付接口费率',
  `status` int(2) DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_rate`
--

LOCK TABLES `user_rate` WRITE;
/*!40000 ALTER TABLE `user_rate` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_self_channel`
--

DROP TABLE IF EXISTS `user_self_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_self_channel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `channel_id` int(10) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `htstatus` int(2) DEFAULT '0' COMMENT '后台控制状态',
  `appid` varchar(255) DEFAULT NULL,
  `appsecret` varchar(255) DEFAULT NULL,
  `notify` varchar(255) DEFAULT NULL COMMENT '回调地址',
  `params` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_self_channel`
--

LOCK TABLES `user_self_channel` WRITE;
/*!40000 ALTER TABLE `user_self_channel` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_self_channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_self_rate`
--

DROP TABLE IF EXISTS `user_self_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_self_rate` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL COMMENT '用户ID',
  `channel_id` int(10) unsigned NOT NULL COMMENT '渠道ID',
  `rate` decimal(10,4) unsigned NOT NULL COMMENT '发卡费率',
  `poundage` decimal(10,4) unsigned NOT NULL COMMENT '手续费',
  `rate_api` decimal(10,4) unsigned NOT NULL COMMENT '支付接口费率',
  `status` int(2) DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_self_rate`
--

LOCK TABLES `user_self_rate` WRITE;
/*!40000 ALTER TABLE `user_self_rate` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_self_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_token`
--

DROP TABLE IF EXISTS `user_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_token` (
  `user_id` int(10) unsigned NOT NULL COMMENT '用户 id',
  `token` varchar(255) NOT NULL COMMENT '用户登录凭证',
  `platform` varchar(20) NOT NULL COMMENT '用户登录平台',
  `refresh_token` varchar(255) NOT NULL COMMENT '登录凭证刷新凭证',
  `created_at` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间，即登录时间',
  `expire_at` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '凭证过期时间',
  KEY `index_login_user` (`user_id`) USING BTREE,
  KEY `index_login_token` (`token`) USING BTREE,
  KEY `index_login_platform` (`platform`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_token`
--

LOCK TABLES `user_token` WRITE;
/*!40000 ALTER TABLE `user_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `verify_email_error_log`
--

DROP TABLE IF EXISTS `verify_email_error_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `verify_email_error_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT '' COMMENT '前台用户名',
  `admin` varchar(50) DEFAULT '' COMMENT '管理员用户名',
  `email` varchar(20) DEFAULT '' COMMENT '邮箱',
  `code` varchar(10) DEFAULT '' COMMENT '输入验证码',
  `screen` varchar(20) DEFAULT '' COMMENT '使用场景',
  `type` tinyint(1) DEFAULT '0' COMMENT '1：短信验证码 2：谷歌身份验证, 0:邮箱',
  `ctime` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verify_email_error_log`
--

LOCK TABLES `verify_email_error_log` WRITE;
/*!40000 ALTER TABLE `verify_email_error_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `verify_email_error_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `verify_error_log`
--

DROP TABLE IF EXISTS `verify_error_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `verify_error_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT '' COMMENT '前台用户名',
  `admin` varchar(50) DEFAULT '' COMMENT '管理员用户名',
  `mobile` varchar(20) DEFAULT '' COMMENT '手机号码',
  `code` varchar(10) DEFAULT '' COMMENT '输入验证码',
  `screen` varchar(20) DEFAULT '' COMMENT '使用场景',
  `type` tinyint(1) DEFAULT '0' COMMENT '1：短信验证码 2：谷歌身份验证',
  `ctime` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verify_error_log`
--

LOCK TABLES `verify_error_log` WRITE;
/*!40000 ALTER TABLE `verify_error_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `verify_error_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video`
--

DROP TABLE IF EXISTS `video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL DEFAULT '',
  `url` varchar(200) DEFAULT '',
  `pid` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `sort` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `create_at` int(10) unsigned DEFAULT NULL,
  `update_at` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video`
--

LOCK TABLES `video` WRITE;
/*!40000 ALTER TABLE `video` DISABLE KEYS */;
/*!40000 ALTER TABLE `video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wechat_fans`
--

DROP TABLE IF EXISTS `wechat_fans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wechat_fans` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '粉丝表ID',
  `appid` varchar(50) DEFAULT NULL COMMENT '公众号Appid',
  `groupid` bigint(20) unsigned DEFAULT NULL COMMENT '分组ID',
  `tagid_list` varchar(100) DEFAULT '' COMMENT '标签id',
  `is_back` tinyint(1) unsigned DEFAULT '0' COMMENT '是否为黑名单用户',
  `subscribe` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '用户是否订阅该公众号，0：未关注，1：已关注',
  `openid` char(100) NOT NULL DEFAULT '' COMMENT '用户的标识，对当前公众号唯一',
  `spread_openid` char(100) DEFAULT NULL COMMENT '推荐人OPENID',
  `spread_at` datetime DEFAULT NULL,
  `nickname` varchar(100) DEFAULT NULL COMMENT '用户的昵称',
  `sex` tinyint(1) unsigned DEFAULT NULL COMMENT '用户的性别，值为1时是男性，值为2时是女性，值为0时是未知',
  `country` varchar(50) DEFAULT NULL COMMENT '用户所在国家',
  `province` varchar(50) DEFAULT NULL COMMENT '用户所在省份',
  `city` varchar(50) DEFAULT NULL COMMENT '用户所在城市',
  `language` varchar(50) DEFAULT NULL COMMENT '用户的语言，简体中文为zh_CN',
  `headimgurl` varchar(500) DEFAULT NULL COMMENT '用户头像',
  `subscribe_time` bigint(20) unsigned DEFAULT NULL COMMENT '用户关注时间',
  `subscribe_at` datetime DEFAULT NULL COMMENT '关注时间',
  `unionid` varchar(100) DEFAULT NULL COMMENT 'unionid',
  `remark` varchar(50) DEFAULT NULL COMMENT '备注',
  `expires_in` bigint(20) unsigned DEFAULT '0' COMMENT '有效时间',
  `refresh_token` varchar(200) DEFAULT NULL COMMENT '刷新token',
  `access_token` varchar(200) DEFAULT NULL COMMENT '访问token',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `index_wechat_fans_spread_openid` (`spread_openid`) USING BTREE,
  KEY `index_wechat_fans_openid` (`openid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='微信粉丝';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wechat_fans`
--

LOCK TABLES `wechat_fans` WRITE;
/*!40000 ALTER TABLE `wechat_fans` DISABLE KEYS */;
/*!40000 ALTER TABLE `wechat_fans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wechat_fans_tags`
--

DROP TABLE IF EXISTS `wechat_fans_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wechat_fans_tags` (
  `id` bigint(20) unsigned NOT NULL COMMENT '标签ID',
  `appid` char(50) DEFAULT NULL COMMENT '公众号APPID',
  `name` varchar(35) DEFAULT NULL COMMENT '标签名称',
  `count` int(11) unsigned DEFAULT NULL COMMENT '总数',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  KEY `index_wechat_fans_tags_id` (`id`) USING BTREE,
  KEY `index_wechat_fans_tags_appid` (`appid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信会员标签';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wechat_fans_tags`
--

LOCK TABLES `wechat_fans_tags` WRITE;
/*!40000 ALTER TABLE `wechat_fans_tags` DISABLE KEYS */;
INSERT INTO `wechat_fans_tags` VALUES (2,NULL,'星标组',0,'2019-11-14 02:06:26'),(100,NULL,'管理组',0,'2019-11-14 02:06:26');
/*!40000 ALTER TABLE `wechat_fans_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wechat_keys`
--

DROP TABLE IF EXISTS `wechat_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wechat_keys` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `appid` char(50) DEFAULT NULL COMMENT '公众号APPID',
  `type` varchar(20) DEFAULT NULL COMMENT '类型，text 文件消息，image 图片消息，news 图文消息',
  `keys` varchar(100) DEFAULT NULL COMMENT '关键字',
  `content` text COMMENT '文本内容',
  `image_url` varchar(255) DEFAULT NULL COMMENT '图片链接',
  `voice_url` varchar(255) DEFAULT NULL COMMENT '语音链接',
  `music_title` varchar(100) DEFAULT NULL COMMENT '音乐标题',
  `music_url` varchar(255) DEFAULT NULL COMMENT '音乐链接',
  `music_image` varchar(255) DEFAULT NULL COMMENT '音乐缩略图链接',
  `music_desc` varchar(255) DEFAULT NULL COMMENT '音乐描述',
  `video_title` varchar(100) DEFAULT NULL COMMENT '视频标题',
  `video_url` varchar(255) DEFAULT NULL COMMENT '视频URL',
  `video_desc` varchar(255) DEFAULT NULL COMMENT '视频描述',
  `news_id` bigint(20) unsigned DEFAULT NULL COMMENT '图文ID',
  `sort` bigint(20) unsigned DEFAULT '0' COMMENT '排序字段',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '0 禁用，1 启用',
  `create_by` bigint(20) unsigned DEFAULT NULL COMMENT '创建人',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT=' 微信关键字';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wechat_keys`
--

LOCK TABLES `wechat_keys` WRITE;
/*!40000 ALTER TABLE `wechat_keys` DISABLE KEYS */;
INSERT INTO `wechat_keys` VALUES (1,NULL,'text','subscribe','欢迎关注219自动发卡平台，竭诚为您提供最安全、便捷发卡服务！商家绑定账号地址：https://域名/merchant','http://域名/static/theme/default/img/image.png','','音乐标题','','http://域名/static/theme/default/img/image.png','音乐描述','视频标题','','视频描述',0,0,1,NULL,'2019-11-15 07:24:17'),(2,NULL,'text','default','您好，使用问题请联系卖家，客服不知道商品用途！！！请在网站https://域名/orderquery用联系方式或者订单号查询订单，上面有卖家qq。\r\n如有其他投诉问题请联系客服QQ：123456','http://域名/static/theme/default/img/image.png','','音乐标题','','http://域名/static/theme/default/img/image.png','音乐描述','视频标题','','视频描述',0,0,1,NULL,'2019-11-15 07:24:20'),(3,NULL,'text','邀请码','您好，219发卡平台商家注册邀请码没有可以直接空着，不用必填！其他买家商品邀请码，请查询订单联系卖家QQ！','http://域名/static/theme/default/img/image.png','','音乐标题','','http://域名/static/theme/default/img/image.png','音乐描述','视频标题','','视频描述',0,0,1,NULL,'2019-11-15 07:24:24'),(4,NULL,'text','卡','您好，买的商品卡密如果没有，请查询订单联系卖家QQ，如果不回复可以点买家服务-查询订单然后投诉，24小时内解决！','http://域名/static/theme/default/img/image.png','','音乐标题','','http://域名/static/theme/default/img/image.png','音乐描述','视频标题','','视频描述',0,0,1,NULL,'2019-11-15 07:24:26'),(5,NULL,'text','音乐','欣赏音乐请进入 https://www.69kz.com/yinyue','https://域名/static/theme/default/img/image.png','','音乐标题','','https://域名/static/theme/default/img/image.png','音乐描述','视频标题','','视频描述',0,0,1,NULL,'2019-10-28 19:57:31');
/*!40000 ALTER TABLE `wechat_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wechat_menu`
--

DROP TABLE IF EXISTS `wechat_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wechat_menu` (
  `id` bigint(16) unsigned NOT NULL AUTO_INCREMENT,
  `index` bigint(20) DEFAULT NULL,
  `pindex` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `type` varchar(24) NOT NULL DEFAULT '' COMMENT '菜单类型 null主菜单 link链接 keys关键字',
  `name` varchar(256) NOT NULL DEFAULT '' COMMENT '菜单名称',
  `content` text NOT NULL COMMENT '文字内容',
  `sort` bigint(20) unsigned DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态(0禁用1启用)',
  `create_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `index_wechat_menu_pindex` (`pindex`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=517 DEFAULT CHARSET=utf8 COMMENT='微信菜单配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wechat_menu`
--

LOCK TABLES `wechat_menu` WRITE;
/*!40000 ALTER TABLE `wechat_menu` DISABLE KEYS */;
INSERT INTO `wechat_menu` VALUES (499,1,0,'view','买家服务','http://域名/',0,1,0,'2019-11-15 07:14:18'),(500,11,1,'text','人工客服','您好，如果是卡密使用问题请先联系卖家协商！如果是其他问题联系平台客服QQ：123456',0,1,0,'2019-11-15 07:14:18'),(501,12,1,'view','投诉查询','https://域名/complaintquery',1,1,0,'2019-11-15 07:14:18'),(502,13,1,'view','订单投诉','https://域名/complaint?trade_no=',2,1,0,'2019-11-15 07:14:18'),(503,14,1,'view','查询订单','https://域名/orderquery',3,1,0,'2019-11-15 07:14:18'),(504,15,1,'text','买家帮助','1：付款后没有收到卡密怎么办？\n请在公众号点击卡密查询按钮输入T开头的订单号或者输入您下单时填写的联系方式查询卡密。\n2：卡密不能使用怎么办？\n请确保您是使用复制的方式来使用卡密的，如确定卡密无误还是不能使用，请联系卖家处理或在查询订单页面投诉订单。\n3：怎么联系卖家\n请在这里https://域名/orderquery可以用联系方式或者订单号查询订单，上面有卖家qq',4,1,0,'2019-11-15 07:14:18'),(505,2,0,'text','后台管理','',1,1,0,'2019-11-15 07:14:18'),(506,21,2,'view','卡密列表','https://域名/merchant/goods_card/index',0,1,0,'2019-11-15 07:14:18'),(507,22,2,'view','最近售出','https://域名/merchant/order/index?status=1',1,1,0,'2019-11-15 07:14:18'),(508,23,2,'view','平台费率','https://域名/merchant/user/channel',2,1,0,'2019-11-15 07:14:18'),(509,24,2,'view','商品列表','https://域名/merchant/goods/index',3,1,0,'2019-11-15 07:14:18'),(510,25,2,'view','商品分类','https://域名/merchant/goods_category/index',4,1,0,'2019-11-15 07:14:18'),(511,3,0,'text','我的账号','',2,1,0,'2019-11-15 07:14:18'),(512,31,3,'view','店铺链接','https://域名/merchant/user/link',0,1,0,'2019-11-15 07:14:18'),(513,32,3,'view','提现记录','https://域名/merchant/cash/index',1,1,0,'2019-11-15 07:14:18'),(514,33,3,'view','申请提现','https://域名/merchant/cash/apply',2,1,0,'2019-11-15 07:14:18'),(515,34,3,'view','商家设置','https://域名/merchant/user/settings',3,1,0,'2019-11-15 07:14:18'),(516,35,3,'view','商户后台','https://域名/merchant/index',4,1,0,'2019-11-15 07:14:18');
/*!40000 ALTER TABLE `wechat_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wechat_news`
--

DROP TABLE IF EXISTS `wechat_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wechat_news` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `media_id` varchar(100) DEFAULT NULL COMMENT '永久素材MediaID',
  `local_url` varchar(300) DEFAULT NULL COMMENT '永久素材显示URL',
  `article_id` varchar(60) DEFAULT NULL COMMENT '关联图文ID，用，号做分割',
  `is_deleted` tinyint(1) unsigned DEFAULT '0' COMMENT '是否删除',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`),
  KEY `index_wechat_new_artcle_id` (`article_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信图文表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wechat_news`
--

LOCK TABLES `wechat_news` WRITE;
/*!40000 ALTER TABLE `wechat_news` DISABLE KEYS */;
/*!40000 ALTER TABLE `wechat_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wechat_news_article`
--

DROP TABLE IF EXISTS `wechat_news_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wechat_news_article` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL COMMENT '素材标题',
  `local_url` varchar(300) DEFAULT NULL COMMENT '永久素材显示URL',
  `show_cover_pic` tinyint(4) unsigned DEFAULT '0' COMMENT '是否显示封面 0不显示，1 显示',
  `author` varchar(20) DEFAULT NULL COMMENT '作者',
  `digest` varchar(300) DEFAULT NULL COMMENT '摘要内容',
  `content` longtext COMMENT '图文内容',
  `content_source_url` varchar(200) DEFAULT NULL COMMENT '图文消息原文地址',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信素材表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wechat_news_article`
--

LOCK TABLES `wechat_news_article` WRITE;
/*!40000 ALTER TABLE `wechat_news_article` DISABLE KEYS */;
/*!40000 ALTER TABLE `wechat_news_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wechat_news_image`
--

DROP TABLE IF EXISTS `wechat_news_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wechat_news_image` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `md5` varchar(32) DEFAULT NULL COMMENT '文件md5',
  `local_url` varchar(300) DEFAULT NULL COMMENT '本地文件链接',
  `media_url` varchar(300) DEFAULT NULL COMMENT '远程图片链接',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `index_wechat_news_image_md5` (`md5`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信服务器图片';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wechat_news_image`
--

LOCK TABLES `wechat_news_image` WRITE;
/*!40000 ALTER TABLE `wechat_news_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `wechat_news_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wechat_news_media`
--

DROP TABLE IF EXISTS `wechat_news_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wechat_news_media` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `appid` varchar(200) DEFAULT NULL COMMENT '公众号ID',
  `md5` varchar(32) DEFAULT NULL COMMENT '文件md5',
  `type` varchar(20) DEFAULT NULL COMMENT '媒体类型',
  `media_id` varchar(100) DEFAULT NULL COMMENT '永久素材MediaID',
  `local_url` varchar(300) DEFAULT NULL COMMENT '本地文件链接',
  `media_url` varchar(300) DEFAULT NULL COMMENT '远程图片链接',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信素材表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wechat_news_media`
--

LOCK TABLES `wechat_news_media` WRITE;
/*!40000 ALTER TABLE `wechat_news_media` DISABLE KEYS */;
/*!40000 ALTER TABLE `wechat_news_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wechat_pay_notify`
--

DROP TABLE IF EXISTS `wechat_pay_notify`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wechat_pay_notify` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `appid` varchar(50) DEFAULT NULL COMMENT '公众号Appid',
  `bank_type` varchar(50) DEFAULT NULL COMMENT '银行类型',
  `cash_fee` bigint(20) DEFAULT NULL COMMENT '现金价',
  `fee_type` char(20) DEFAULT NULL COMMENT '币种，1人民币',
  `is_subscribe` char(1) DEFAULT 'N' COMMENT '是否关注，Y为关注，N为未关注',
  `mch_id` varchar(50) DEFAULT NULL COMMENT '商户MCH_ID',
  `nonce_str` varchar(32) DEFAULT NULL COMMENT '随机串',
  `openid` varchar(50) DEFAULT NULL COMMENT '微信用户openid',
  `out_trade_no` varchar(50) DEFAULT NULL COMMENT '支付平台退款交易号',
  `sign` varchar(100) DEFAULT NULL COMMENT '签名',
  `time_end` datetime DEFAULT NULL COMMENT '结束时间',
  `result_code` varchar(10) DEFAULT NULL,
  `return_code` varchar(10) DEFAULT NULL,
  `total_fee` varchar(11) DEFAULT NULL COMMENT '支付总金额，单位为分',
  `trade_type` varchar(20) DEFAULT NULL COMMENT '支付方式',
  `transaction_id` varchar(64) DEFAULT NULL COMMENT '订单号',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '本地系统时间',
  PRIMARY KEY (`id`),
  KEY `index_wechat_pay_notify_openid` (`openid`) USING BTREE,
  KEY `index_wechat_pay_notify_out_trade_no` (`out_trade_no`) USING BTREE,
  KEY `index_wechat_pay_notify_transaction_id` (`transaction_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='支付日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wechat_pay_notify`
--

LOCK TABLES `wechat_pay_notify` WRITE;
/*!40000 ALTER TABLE `wechat_pay_notify` DISABLE KEYS */;
/*!40000 ALTER TABLE `wechat_pay_notify` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wechat_pay_prepayid`
--

DROP TABLE IF EXISTS `wechat_pay_prepayid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wechat_pay_prepayid` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `appid` char(50) DEFAULT NULL COMMENT '公众号APPID',
  `from` char(32) DEFAULT 'shop' COMMENT '支付来源',
  `fee` bigint(20) unsigned DEFAULT NULL COMMENT '支付费用(分)',
  `trade_type` varchar(20) DEFAULT NULL COMMENT '订单类型',
  `order_no` varchar(50) DEFAULT NULL COMMENT '内部订单号',
  `out_trade_no` varchar(50) DEFAULT NULL COMMENT '外部订单号',
  `prepayid` varchar(500) DEFAULT NULL COMMENT '预支付码',
  `expires_in` bigint(20) unsigned DEFAULT NULL COMMENT '有效时间',
  `transaction_id` varchar(64) DEFAULT NULL COMMENT '微信平台订单号',
  `is_pay` tinyint(1) unsigned DEFAULT '0' COMMENT '1已支付，0未支退款',
  `pay_at` datetime DEFAULT NULL COMMENT '支付时间',
  `is_refund` tinyint(1) unsigned DEFAULT '0' COMMENT '是否退款，退款单号(T+原来订单)',
  `refund_at` datetime DEFAULT NULL COMMENT '退款时间',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '本地系统时间',
  PRIMARY KEY (`id`),
  KEY `index_wechat_pay_prepayid_outer_no` (`out_trade_no`) USING BTREE,
  KEY `index_wechat_pay_prepayid_order_no` (`order_no`) USING BTREE,
  KEY `index_wechat_pay_is_pay` (`is_pay`) USING BTREE,
  KEY `index_wechat_pay_is_refund` (`is_refund`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='支付订单号对应表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wechat_pay_prepayid`
--

LOCK TABLES `wechat_pay_prepayid` WRITE;
/*!40000 ALTER TABLE `wechat_pay_prepayid` DISABLE KEYS */;
/*!40000 ALTER TABLE `wechat_pay_prepayid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yinyue`
--

DROP TABLE IF EXISTS `yinyue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yinyue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(200) NOT NULL DEFAULT '',
  `url` varchar(200) DEFAULT '',
  `moban` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `create_at` int(10) unsigned DEFAULT NULL,
  `update_at` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yinyue`
--

LOCK TABLES `yinyue` WRITE;
/*!40000 ALTER TABLE `yinyue` DISABLE KEYS */;
/*!40000 ALTER TABLE `yinyue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zt_order`
--

DROP TABLE IF EXISTS `zt_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zt_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` varchar(100) DEFAULT NULL,
  `zdid` int(10) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `paytype` varchar(50) DEFAULT NULL,
  `money` float DEFAULT NULL,
  `status` int(1) DEFAULT '0',
  `trade_no` varchar(100) DEFAULT NULL,
  `paytime` int(10) DEFAULT NULL,
  `addtime` int(10) NOT NULL,
  `moneyid` int(11) DEFAULT '0' COMMENT '置顶小时',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zt_order`
--

LOCK TABLES `zt_order` WRITE;
/*!40000 ALTER TABLE `zt_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `zt_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'faka_authh_cn'
--

--
-- Dumping routines for database 'faka_authh_cn'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-10  1:05:03
