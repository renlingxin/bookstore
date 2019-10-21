-- phpMyAdmin SQL Dump
-- version phpStudy 2014
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2019 年 08 月 22 日 10:36
-- 服务器版本: 5.5.53
-- PHP 版本: 5.4.45

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `bookstore`
--

-- --------------------------------------------------------

--
-- 表的结构 `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(250) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) NOT NULL,
  `pass` varchar(500) NOT NULL,
  `addtime` varchar(500) NOT NULL,
  `phone` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `admin`
--

INSERT INTO `admin` (`id`, `name`, `pass`, `addtime`, `phone`) VALUES
(1, '任岭鑫', '110110ren', '2019-08-08 14:10:42.048', '18032094673'),
(5, '解丽欣', '123456ren', '2019-08-08 14:25:13.068', '18032052349');

-- --------------------------------------------------------

--
-- 表的结构 `author`
--

CREATE TABLE IF NOT EXISTS `author` (
  `id` int(250) NOT NULL AUTO_INCREMENT,
  `authorID` varchar(500) NOT NULL,
  `type` varchar(500) NOT NULL,
  `headimg` varchar(500) NOT NULL,
  `name` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `author`
--

INSERT INTO `author` (`id`, `authorID`, `type`, `headimg`, `name`) VALUES
(1, '66', '中外历史', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1564583800084&di=c88a45013139a897901fc8a86468b5e5&imgtype=0&src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F01d62d594fadd3a8012193a3194a33.jpg', '解丽欣'),
(2, '100', '都市言情', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1564583800084&di=c88a45013139a897901fc8a86468b5e5&imgtype=0&src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F01d62d594fadd3a8012193a3194a33.jpg', '碧洛心'),
(3, '101', '武侠玄幻', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1564583800084&di=c88a45013139a897901fc8a86468b5e5&imgtype=0&src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F01d62d594fadd3a8012193a3194a33.jpg', '司吉福'),
(5, '88', '人文', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1564583800084&di=c88a45013139a897901fc8a86468b5e5&imgtype=0&src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F01d62d594fadd3a8012193a3194a33.jpg', '任岭鑫');

-- --------------------------------------------------------

--
-- 表的结构 `feed`
--

CREATE TABLE IF NOT EXISTS `feed` (
  `id` int(225) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) NOT NULL,
  `quest` varchar(500) NOT NULL,
  `opinion` varchar(500) NOT NULL,
  `type` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `feed`
--

INSERT INTO `feed` (`id`, `name`, `quest`, `opinion`, `type`) VALUES
(1, '', '支付后无法显示商品信息', '可以退款吗', '2'),
(2, '', '分类界面无法正常打开', '赔我300块钱', '1');

-- --------------------------------------------------------

--
-- 表的结构 `newsdetail`
--

CREATE TABLE IF NOT EXISTS `newsdetail` (
  `id` int(250) NOT NULL AUTO_INCREMENT,
  `title` varchar(500) NOT NULL,
  `click` varchar(500) NOT NULL,
  `add_time` varchar(500) NOT NULL,
  `content` varchar(12000) NOT NULL,
  `authorID` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `newsdetail`
--

INSERT INTO `newsdetail` (`id`, `title`, `click`, `add_time`, `content`, `authorID`) VALUES
(1, '心潮澎湃，无限幻想，迎风挥击千层浪，少年不败热血！', '45', '2019-07-16T09:49:05.574Z', '<h4>天黑，别出门</h4>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;这句话在残老村流传了很多年，具体是从什么时候传下来的，已经无从考证。不过这句话却是真理，无需怀疑。</p><br>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;残老村的四个角竖着四个古老石像，石像斑驳，年代久远，即便是司婆婆也不知道这石像是何人雕琢，何时竖在这里。\n</p><br>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;黑暗降临，四个石像在黑暗中散发出幽幽的光芒，石像依旧亮着，让司婆婆和村里的老者都松了口气。村外的黑暗越发浓郁，但有了石像的光，残老村便还算是安全的。突然，司婆婆耳朵动了动，呆了呆，失声道：“你们听，外面有个孩子的哭声！”旁边的马老摇头道：“不可能，你听错了……咦，真有婴儿的哭声！”\n</p><br>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;村外的黑暗中传来婴儿的哭声，村里其他老人除了耳聋的都听到了这个哭声，老人们面面相觑，残老村偏僻荒凉，怎么会有婴儿出现在附近？”“我去看看！”司婆婆激动起来，踮着小脚跑到村子的一个石像边，马老连忙过去：“司老太婆，你疯了？天黑了，出了村就是死！”“背着这个石像出村，黑暗里的东西怕石像，我一会半会死不了！”\n</p><br>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;村外的黑暗中传来婴儿的哭声，村里其他老人除了耳聋的都听到了这个哭声，老人们面面相觑，残老村偏僻荒凉，怎么会有婴儿出现在附近？”“我去看看！”司婆婆激动起来，踮着小脚跑到村子的一个石像边，马老连忙过去：“司老太婆，你疯了？天黑了，出了村就是死！”“背着这个石像出村，黑暗里的东西怕石像，我一会半会死不了！”\n</p>', '100'),
(2, '三体之第一章疯狂年代', '788', '2019-07-16T09:49:05.574Z', '<h4>中国，1967年。</h4>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;“红色联合”对“四?二八兵团”总部大楼的攻击已持续了两天，他们的旗帜在大楼周围躁动地飘扬着，仿佛渴望干柴的火种。“红色联合”的指挥官心急如焚，他并不惧怕大楼的守卫者，那二百多名“四?二八”战士，与诞生于l966年初、经历过大检阅和大串联的“红色联合”相比要稚嫩许多。他怕的是大楼中那十几个大铁炉子，里面塞满了烈性炸药，用电雷管串联起来，他看不到它们，但能感觉到它们磁石般的存在，开关一合，玉石俱焚，而“四?二八”的那些小红卫兵们是有这个精神力量的。比起已经在风雨中成熟了许多的第一代红卫兵，新生的造反派们像火炭上的狼群，除了疯狂还是疯狂。</p><br>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;大楼顶上出现了一个娇小的身影，那个美丽的女孩子挥动着一面“四?二八”的大旗，她的出现立刻招来了一阵杂乱的枪声，射击的武器五花八门，有陈旧的美式卡宾枪、捷克式机枪和三八大盖，也有崭新的制式步枪和冲锋枪——后者是在“八月社论”发表之后从军队中偷抢来的（注：1967年8月《红旗》杂志发表“揪军内一小撮”的社论，使冲击军区、抢夺军队枪支弹药的事件愈演愈烈，全国范围的武斗也进入高潮。）——连同那些梭标和大刀等冷兵器，构成了一部浓缩的近现代史……“四?二八”的人在前面多次玩过这个游戏，在楼顶上站出来的人，除了挥舞旗帜外，有时还用喇叭筒喊口号或向下撒传单，每次他们都能在弹雨中全身而退，为自己挣到了崇高的荣誉。这次出来的女孩儿显然也相信自己还有那样的幸运她挥舞着战旗，挥动着自己燃烧的青春，敌人将在这火焰中化为灰烬，理想世界明天就会在她那沸腾的热血中诞生……她陶醉在这鲜红灿烂的梦幻中，直到被一颗步枪子弹洞穿了胸膛，十五岁少女的胸膛是那么柔嫩，那颗子弹穿过后基本上没有减速，在她身后的空中发出一声啾鸣。年轻的红卫兵同她的旗帜一起从楼顶落下，她那轻盈的身体落得甚至比旗帜还慢，仿佛小鸟眷恋着天空。\n</p>', '100'),
(3, 'js高级程序设计阅读摘录5', '66', '2019-07-16T09:49:05.574Z', '<h4>简要</h4>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;能够自动舍入的特性，使得 toFixed()方法很适合处理货币值。但需要注意的是，不同浏览器给这个方法设定的舍入规则可能会有所不同。在给 toFixed()传入 0 的情况下，IE8 及之前版本不能正确舍入范围{(-0.94,-0.5],[0.5,0.94)}之间的值。对于这个范围内的值，IE 会返回 0，而不是-1 或 1；其他浏览器都能返回正确的值。IE9 修复了这个问题。\n\n作者：day_day_up\n链接：https://www.jianshu.com/p/32b155ab9d5b\n来源：简书\n简书著作权归作者所有，任何形式的转载都请联系作者获得授权并注明出处。</p></br>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;在传递给这些方法的参数是负值的情况下，它们的行为就不尽相同了。其中， slice() 方法会将传\n入的负值与字符串的长度相加， substr() 方法将负的第一个参数加上字符串的长度，而将负的第二个\n参数转换为 0。最后， substring() 方法会把所有负值参数都转换为 0。下面来看例子。\n\n作者：day_day_up\n链接：https://www.jianshu.com/p/32b155ab9d5b\n来源：简书\n简书著作权归作者所有，任何形式的转载都请联系作者获得授权并注明出处。</p>', '101'),
(4, '毛泽东早期文稿', '35', '2019-07-16T09:49:05.574Z', '<h4>湖南受中国之累以历史及现状证明</h4>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;自有中国，就有湖南。湖南在古为蛮地，在周为楚国，在汉为长沙国，唐为节度史〈使〉地，宋为荆湖南道，至元建为行省，明清仍之，迄今不变。莽莽四千年，人类总是进化的，而湖南进化的地方在那里？春秋时，荆楚崛兴，几欲和中原大国挈长较短。其时则上无中央政府，诸国并立，各得遂其发展。虽迷于竞争侵略，用事者野心英雄的君臣而无与于小百姓，然声光赫濯，得发展一部分之特性，较之奴隶于专制黑暗的总组织者，胜得多多。不过所谓荆楚，其中心不在湖南而在湖北。潇湘片土，对于江汉，犹是卑职之于上司。所以湖南在当时之中国，仍算不得什么。长沙国，以小弱见全，可怜的国，非自立自治的国。节度史〈使〉地，荆湖南道，一言蔽之，被治的奴隶耳。五代曾为马殷〔１〕割据，陋懦殊不足道。至于行省，乃皇帝行巡宫府，举湖南而为一王之奴隶。元明历清，长夜漫漫，所得的只是至痛极惨。由此以观，四千年历史中，湖南人未尝伸过腰，吐过气。湖南的历史，只是黑暗的历史。湖南的文明，只是灰色的文明。这是四千年来湖南受中国之累，不能遂其自然发展的结果。</p></br>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;中国维新，湖南最早。丁酉戊戍〈戌〉之秋〔２〕，湖南人生气勃发，新学术之研究，新教育之建设，谭嗣同熊希龄〔３〕辈领袖其间，全国无出湖南之右。乃未久而熊逐谭杀〔４〕，亡清政府以其官力施于湖南，新锐顿挫，事业旋亡。这又是湖南受中国之累，不能遂其自然发展的结果。\n\n　　湖南有黄克强〔５〕，中国乃有实行的革命家。甲辰一役，萍醴丧亡，黄克强出遁，马福益骈首，清廷以其暴力，戮辱湘人〔６〕。湖南不克先辛亥而推倒满清，早脱臣妾之羁勒。这又是湖南受中国之累，不能遂其自然发展的结果。</p>', '101');

-- --------------------------------------------------------

--
-- 表的结构 `newslist`
--

CREATE TABLE IF NOT EXISTS `newslist` (
  `id` int(250) NOT NULL AUTO_INCREMENT,
  `title` varchar(500) NOT NULL,
  `click` varchar(500) NOT NULL,
  `add_time` varchar(500) NOT NULL,
  `img_url` varchar(500) NOT NULL,
  `authorID` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `newslist`
--

INSERT INTO `newslist` (`id`, `title`, `click`, `add_time`, `img_url`, `authorID`) VALUES
(1, '牧神记', '45', '2019-07-16T09:49:05.574Z', '//bookcover.yuewen.com/qdbimg/349573/1009704712/180\n', '100'),
(2, '三体', '788', '2019-07-16T09:49:05.574Z', 'https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=323793661,4172493770&fm=58&bpow=1280&bpoh=1597', '100'),
(3, 'JavaScript高级程序设计', '66', '2019-07-16T09:49:05.574Z', 'https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=3800318728,2097438995&fm=85&app=59&f=JPEG?w=121&h=75', '101'),
(4, '毛泽东早期文稿', '35', '2019-07-16T09:49:05.574Z', 'https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=2765552765,3618344579&fm=179&app=42&f=JPEG?w=121&h=140', '101');

-- --------------------------------------------------------

--
-- 表的结构 `photocategory`
--

CREATE TABLE IF NOT EXISTS `photocategory` (
  `id` varchar(500) NOT NULL,
  `title` varchar(500) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `photocategory`
--

INSERT INTO `photocategory` (`id`, `title`) VALUES
('0', '今日推荐'),
('1', '古今历史'),
('2', '军事战略'),
('3', '仙侠小说'),
('4', '名人传记');

-- --------------------------------------------------------

--
-- 表的结构 `photocomment`
--

CREATE TABLE IF NOT EXISTS `photocomment` (
  `id` int(225) NOT NULL AUTO_INCREMENT,
  `cid` varchar(500) NOT NULL,
  `user_name` varchar(500) NOT NULL,
  `add_time` varchar(500) NOT NULL,
  `content` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- 转存表中的数据 `photocomment`
--

INSERT INTO `photocomment` (`id`, `cid`, `user_name`, `add_time`, `content`) VALUES
(1, '0', '匿名用户', '2019-08-05T08:12:14.730Z', '任岭King次年'),
(2, '0', '匿名用户', '2019-08-05 16:14:05.180', '滚滚滚'),
(3, '1', '匿名用户', '2019-08-05 16:17:03.442', '发发发'),
(4, '0', '匿名用户', '2019-08-05 16:25:39.575', '擦擦擦'),
(5, '2', '匿名用户', '2019-08-05 16:26:27.627', '人理你'),
(6, '2', '匿名用户', '2019-08-05 16:30:51.453', 'srsrhshsrbsfbsdbsrtgsdg'),
(7, '1', '匿名用户', '2019-08-06 19:16:16.874', '你是'),
(8, '1', '匿名用户', '2019-08-09 08:42:01.148', '这个很好'),
(9, '1', '匿名用户', '2019-08-13 10:50:34.875', 'wiw '),
(10, '4', '匿名用户', '2019-08-13 11:06:49.453', '111'),
(11, '1', '匿名用户', '2019-08-22 08:37:16.776', '12');

-- --------------------------------------------------------

--
-- 表的结构 `photoimage`
--

CREATE TABLE IF NOT EXISTS `photoimage` (
  `categoryId` varchar(500) NOT NULL,
  `id` int(250) NOT NULL AUTO_INCREMENT,
  `title` varchar(500) NOT NULL,
  `img_url` varchar(500) NOT NULL,
  `zhaiyao` varchar(500) NOT NULL,
  `authorID` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `photoimage`
--

INSERT INTO `photoimage` (`categoryId`, `id`, `title`, `img_url`, `zhaiyao`, `authorID`) VALUES
('0', 1, '侯玉森', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1563007208994&di=528f20a029f0a715c9a839f550dfc8eb&imgtype=0&src=http%3A%2F%2Fa.hiphotos.baidu.com%2Fimage%2Fpic%2Fitem%2F4a36acaf2edda3ccdc0347c30fe93901203f926a.jpg', '《身边的老外》（组）', '88'),
('0', 2, '商场', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1563007346486&di=9fd9c2d619108b7f811b3cd273dd2a1d&imgtype=0&src=http%3A%2F%2Fg.hiphotos.baidu.com%2Fimage%2Fpic%2Fitem%2F83025aafa40f4bfbb5163db50d4f78f0f6361808.jpg', '灯光璀璨的都市商场', '66'),
('1', 3, '杨幂', 'http://img1.imgtn.bdimg.com/it/u=1362470089,3616253866&fm=26&gp=0.jpg', '娱乐圈明星高杨幂', '88'),
('1', 4, '邓超夫妻1', 'https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=3504028090,3118026979&fm=58&bpow=580&bpoh=740', '娱乐圈明星结婚照（邓超）', '88'),
('1', 5, '素描', 'http://img4.imgtn.bdimg.com/it/u=3067933214,986529632&fm=26&gp=0.jpg', '明星素描照，最后一张你绝对认不出来', '66'),
('2', 6, '动漫', 'http://img4.imgtn.bdimg.com/it/u=4206348751,4177014175&fm=26&gp=0.jpg', 'p站 二次元动漫美少女', '88'),
('2', 7, '#四月は君の嘘#', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1563014140015&di=756183d77874f38570ed86576e1d41ed&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201505%2F01%2F20150501054930_UmC5v.jpeg', '四月是你的谎言#二次元#动漫#人...', '88'),
('2', 8, '东京食尸鬼', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1563014140014&di=bb2cef63319aea254b0cf6b916361d16&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201612%2F14%2F20161214230902_iuKCw.jpeg', '东京食尸鬼,动漫二次元,金木研,头像,壁纸', '66'),
('0', 9, '中国铁路人', '//bookcover.yuewen.com/qdbimg/349573/c_10112704904733103/180', '从中原腹地到祖国边陲，从沿海滩涂到高原深岭，是他们用汗水建造了祖国发展的大动脉，推动列车飞驰的电网上凝结着他们青春里的日日夜夜', '88');

-- --------------------------------------------------------

--
-- 表的结构 `photoinfo`
--

CREATE TABLE IF NOT EXISTS `photoinfo` (
  `id` int(250) NOT NULL AUTO_INCREMENT,
  `title` varchar(500) NOT NULL,
  `add_time` varchar(500) NOT NULL,
  `click` varchar(500) NOT NULL,
  `content` varchar(500) NOT NULL,
  `author` varchar(500) NOT NULL,
  `types` varchar(500) NOT NULL,
  `headimg` varchar(500) NOT NULL,
  `authorID` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `photoinfo`
--

INSERT INTO `photoinfo` (`id`, `title`, `add_time`, `click`, `content`, `author`, `types`, `headimg`, `authorID`) VALUES
(1, '侯玉森', '2018-04-16T03:50:28.000Z', '886', '<h4>油价迎下半年“首涨” 加满一箱油要多花约6元</h4><p>&nbsp;&nbsp;&nbsp;&nbsp;刚刚过去的六月，油价“两连跌”让车主们欢喜不已。但是自7月9日24时起，新一轮成品油调价窗口正式开启，油价迎来上涨。这是今年下半年油价首次上调，也是年内第9次上调，车用出行成本小幅增加。</p><br><p>&nbsp;&nbsp;&nbsp;&nbsp;记者从浙江省发改委获悉，根据国家发改委公布的《国内成品油价格按机制上调》，按照现行成品油价格形成机制，浙江省自2019年7月9日24时起，汽、柴油价格（标准品）每吨分别提高150元和140元，非标准品汽、柴油最高零售价格按国家规定的品质比率也相应调整。</p>', '郭妈妈', '儿童教育', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1564583800084&di=c88a45013139a897901fc8a86468b5e5&imgtype=0&src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F01d62d594fadd3a8012193a3194a33.jpg', '88'),
(2, '商场', '2018-04-16T03:50:28.000Z', '544', '<h4>油价迎下半年“首涨” 加满一箱油要多花约6元</h4><p>&nbsp;&nbsp;&nbsp;&nbsp;刚刚过去的六月，油价“两连跌”让车主们欢喜不已。但是自7月9日24时起，新一轮成品油调价窗口正式开启，油价迎来上涨。这是今年下半年油价首次上调，也是年内第9次上调，车用出行成本小幅增加。</p><br><p>&nbsp;&nbsp;&nbsp;&nbsp;记者从浙江省发改委获悉，根据国家发改委公布的《国内成品油价格按机制上调》，按照现行成品油价格形成机制，浙江省自2019年7月9日24时起，汽、柴油价格（标准品）每吨分别提高150元和140元，非标准品汽、柴油最高零售价格按国家规定的品质比率也相应调整。</p>', '毕马马', '儿童教育', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1564583800084&di=c88a45013139a897901fc8a86468b5e5&imgtype=0&src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F01d62d594fadd3a8012193a3194a33.jpg', '66'),
(3, '杨幂', '2018-04-16T03:50:28.000Z', '3543', '<h4>油价迎下半年“首涨” 加满一箱油要多花约6元</h4><p>&nbsp;&nbsp;&nbsp;&nbsp;刚刚过去的六月，油价“两连跌”让车主们欢喜不已。但是自7月9日24时起，新一轮成品油调价窗口正式开启，油价迎来上涨。这是今年下半年油价首次上调，也是年内第9次上调，车用出行成本小幅增加。</p><br><p>&nbsp;&nbsp;&nbsp;&nbsp;记者从浙江省发改委获悉，根据国家发改委公布的《国内成品油价格按机制上调》，按照现行成品油价格形成机制，浙江省自2019年7月9日24时起，汽、柴油价格（标准品）每吨分别提高150元和140元，非标准品汽、柴油最高零售价格按国家规定的品质比率也相应调整。</p>', '胡妈妈', '儿童教育', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1564583800084&di=c88a45013139a897901fc8a86468b5e5&imgtype=0&src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F01d62d594fadd3a8012193a3194a33.jpg', '88'),
(4, '邓超夫妻', '2018-04-16T03:50:28.000Z', '343', '<h4>油价迎下半年“首涨” 加满一箱油要多花约6元</h4><p>&nbsp;&nbsp;&nbsp;&nbsp;刚刚过去的六月，油价“两连跌”让车主们欢喜不已。但是自7月9日24时起，新一轮成品油调价窗口正式开启，油价迎来上涨。这是今年下半年油价首次上调，也是年内第9次上调，车用出行成本小幅增加。</p><br><p>&nbsp;&nbsp;&nbsp;&nbsp;记者从浙江省发改委获悉，根据国家发改委公布的《国内成品油价格按机制上调》，按照现行成品油价格形成机制，浙江省自2019年7月9日24时起，汽、柴油价格（标准品）每吨分别提高150元和140元，非标准品汽、柴油最高零售价格按国家规定的品质比率也相应调整。</p>', '徐妈妈', '儿童教育', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1564583800084&di=c88a45013139a897901fc8a86468b5e5&imgtype=0&src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F01d62d594fadd3a8012193a3194a33.jpg', '88'),
(5, '素描', '2018-04-16T03:50:28.000Z', '543', '<h4>油价迎下半年“首涨” 加满一箱油要多花约6元</h4><p>&nbsp;&nbsp;&nbsp;&nbsp;刚刚过去的六月，油价“两连跌”让车主们欢喜不已。但是自7月9日24时起，新一轮成品油调价窗口正式开启，油价迎来上涨。这是今年下半年油价首次上调，也是年内第9次上调，车用出行成本小幅增加。</p><br><p>&nbsp;&nbsp;&nbsp;&nbsp;记者从浙江省发改委获悉，根据国家发改委公布的《国内成品油价格按机制上调》，按照现行成品油价格形成机制，浙江省自2019年7月9日24时起，汽、柴油价格（标准品）每吨分别提高150元和140元，非标准品汽、柴油最高零售价格按国家规定的品质比率也相应调整。</p>', '李妈妈', '儿童教育', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1564583800084&di=c88a45013139a897901fc8a86468b5e5&imgtype=0&src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F01d62d594fadd3a8012193a3194a33.jpg', '66'),
(6, '动漫', '2018-04-16T03:50:28.000Z', '44', '<h4>油价迎下半年“首涨” 加满一箱油要多花约6元</h4><p>&nbsp;&nbsp;&nbsp;&nbsp;刚刚过去的六月，油价“两连跌”让车主们欢喜不已。但是自7月9日24时起，新一轮成品油调价窗口正式开启，油价迎来上涨。这是今年下半年油价首次上调，也是年内第9次上调，车用出行成本小幅增加。</p><br><p>&nbsp;&nbsp;&nbsp;&nbsp;记者从浙江省发改委获悉，根据国家发改委公布的《国内成品油价格按机制上调》，按照现行成品油价格形成机制，浙江省自2019年7月9日24时起，汽、柴油价格（标准品）每吨分别提高150元和140元，非标准品汽、柴油最高零售价格按国家规定的品质比率也相应调整。</p>', '方妈妈', '儿童教育', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1564583800084&di=c88a45013139a897901fc8a86468b5e5&imgtype=0&src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F01d62d594fadd3a8012193a3194a33.jpg', '88'),
(7, '#四月は君の嘘#', '2018-04-16T03:50:28.000Z', '51', '<h4>油价迎下半年“首涨” 加满一箱油要多花约6元</h4><p>&nbsp;&nbsp;&nbsp;&nbsp;刚刚过去的六月，油价“两连跌”让车主们欢喜不已。但是自7月9日24时起，新一轮成品油调价窗口正式开启，油价迎来上涨。这是今年下半年油价首次上调，也是年内第9次上调，车用出行成本小幅增加。</p><br><p>&nbsp;&nbsp;&nbsp;&nbsp;记者从浙江省发改委获悉，根据国家发改委公布的《国内成品油价格按机制上调》，按照现行成品油价格形成机制，浙江省自2019年7月9日24时起，汽、柴油价格（标准品）每吨分别提高150元和140元，非标准品汽、柴油最高零售价格按国家规定的品质比率也相应调整。</p>', '华泰', '古今历史', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1564583800084&di=c88a45013139a897901fc8a86468b5e5&imgtype=0&src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F01d62d594fadd3a8012193a3194a33.jpg', '88'),
(8, '东京食尸鬼', '2018-04-16T03:50:28.000Z', '4520', '<h4>油价迎下半年“首涨” 加满一箱油要多花约6元</h4><p>&nbsp;&nbsp;&nbsp;&nbsp;刚刚过去的六月，油价“两连跌”让车主们欢喜不已。但是自7月9日24时起，新一轮成品油调价窗口正式开启，油价迎来上涨。这是今年下半年油价首次上调，也是年内第9次上调，车用出行成本小幅增加。</p><br><p>&nbsp;&nbsp;&nbsp;&nbsp;记者从浙江省发改委获悉，根据国家发改委公布的《国内成品油价格按机制上调》，按照现行成品油价格形成机制，浙江省自2019年7月9日24时起，汽、柴油价格（标准品）每吨分别提高150元和140元，非标准品汽、柴油最高零售价格按国家规定的品质比率也相应调整。</p>', '陈赫', '家庭教育', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1564583800084&di=c88a45013139a897901fc8a86468b5e5&imgtype=0&src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F01d62d594fadd3a8012193a3194a33.jpg', '66'),
(9, '中国铁路人', '2018-04-16T03:50:28.000Z', '313', '<h4>中国铁路人</h4><p>&nbsp;&nbsp;&nbsp;&nbsp;从中原腹地到祖国边陲，从沿海滩涂到高原深岭，是他们用汗水建造了祖国发展的大动脉，推动列车飞驰的电网上凝结着他们青春里的日日夜夜。 \n他们有一个共同的名字——中国铁路人。 </p><br><p>&nbsp;&nbsp;&nbsp;&nbsp;这个名字下是千千万万个有血有肉，心里惦记着姑娘，身后站着爹娘的普通人。 \n白玉传就是这千千万万个普通人之一，他的青春从铁路上开始，从一个拿着扳手钳子的电气工人到一个手握数项国家专利的铁路高工。他用自己的青春书写了铁路奔驰的篇章，也在这个岗位上成就了自己的非凡经历。 \n这是一个平凡岗位的英雄梦，英雄魂。</p>', '任岭鑫', '家庭教育', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1564583800084&di=c88a45013139a897901fc8a86468b5e5&imgtype=0&src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F01d62d594fadd3a8012193a3194a33.jpg', '66');

-- --------------------------------------------------------

--
-- 表的结构 `photothum`
--

CREATE TABLE IF NOT EXISTS `photothum` (
  `id` varchar(500) NOT NULL,
  `src` varchar(500) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `photothum`
--

INSERT INTO `photothum` (`id`, `src`) VALUES
('0', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1562844066648&di=05277afdd6a82bc7570686861f8c1687&imgtype=0&src=http%3A%2F%2Ff.hiphotos.baidu.com%2Fimage%2Fpic%2Fitem%2Fa71ea8d3fd1f4134d244519d2b1f95cad0c85ee5.jpg'),
('0', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1562844066648&di=05277afdd6a82bc7570686861f8c1687&imgtype=0&src=http%3A%2F%2Ff.hiphotos.baidu.com%2Fimage%2Fpic%2Fitem%2Fa71ea8d3fd1f4134d244519d2b1f95cad0c85ee5.jpg'),
('0', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1562844066648&di=05277afdd6a82bc7570686861f8c1687&imgtype=0&src=http%3A%2F%2Ff.hiphotos.baidu.com%2Fimage%2Fpic%2Fitem%2Fa71ea8d3fd1f4134d244519d2b1f95cad0c85ee5.jpg'),
('0', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1562844066648&di=05277afdd6a82bc7570686861f8c1687&imgtype=0&src=http%3A%2F%2Ff.hiphotos.baidu.com%2Fimage%2Fpic%2Fitem%2Fa71ea8d3fd1f4134d244519d2b1f95cad0c85ee5.jpg'),
('0', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1562844066648&di=05277afdd6a82bc7570686861f8c1687&imgtype=0&src=http%3A%2F%2Ff.hiphotos.baidu.com%2Fimage%2Fpic%2Fitem%2Fa71ea8d3fd1f4134d244519d2b1f95cad0c85ee5.jpg'),
('0', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1562844066648&di=05277afdd6a82bc7570686861f8c1687&imgtype=0&src=http%3A%2F%2Ff.hiphotos.baidu.com%2Fimage%2Fpic%2Fitem%2Fa71ea8d3fd1f4134d244519d2b1f95cad0c85ee5.jpg'),
('1', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1563007208994&di=528f20a029f0a715c9a839f550dfc8eb&imgtype=0&src=http%3A%2F%2Fa.hiphotos.baidu.com%2Fimage%2Fpic%2Fitem%2F4a36acaf2edda3ccdc0347c30fe93901203f926a.jpg'),
('1', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1563007208994&di=528f20a029f0a715c9a839f550dfc8eb&imgtype=0&src=http%3A%2F%2Fa.hiphotos.baidu.com%2Fimage%2Fpic%2Fitem%2F4a36acaf2edda3ccdc0347c30fe93901203f926a.jpg'),
('1', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1563007208994&di=528f20a029f0a715c9a839f550dfc8eb&imgtype=0&src=http%3A%2F%2Fa.hiphotos.baidu.com%2Fimage%2Fpic%2Fitem%2F4a36acaf2edda3ccdc0347c30fe93901203f926a.jpg'),
('1', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1563007208994&di=528f20a029f0a715c9a839f550dfc8eb&imgtype=0&src=http%3A%2F%2Fa.hiphotos.baidu.com%2Fimage%2Fpic%2Fitem%2F4a36acaf2edda3ccdc0347c30fe93901203f926a.jpg'),
('1', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1563007208994&di=528f20a029f0a715c9a839f550dfc8eb&imgtype=0&src=http%3A%2F%2Fa.hiphotos.baidu.com%2Fimage%2Fpic%2Fitem%2F4a36acaf2edda3ccdc0347c30fe93901203f926a.jpg'),
('1', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1563007208994&di=528f20a029f0a715c9a839f550dfc8eb&imgtype=0&src=http%3A%2F%2Fa.hiphotos.baidu.com%2Fimage%2Fpic%2Fitem%2F4a36acaf2edda3ccdc0347c30fe93901203f926a.jpg'),
('2', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1563007346486&di=9fd9c2d619108b7f811b3cd273dd2a1d&imgtype=0&src=http%3A%2F%2Fg.hiphotos.baidu.com%2Fimage%2Fpic%2Fitem%2F83025aafa40f4bfbb5163db50d4f78f0f6361808.jpg'),
('2', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1563007346486&di=9fd9c2d619108b7f811b3cd273dd2a1d&imgtype=0&src=http%3A%2F%2Fg.hiphotos.baidu.com%2Fimage%2Fpic%2Fitem%2F83025aafa40f4bfbb5163db50d4f78f0f6361808.jpg'),
('2', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1563007346486&di=9fd9c2d619108b7f811b3cd273dd2a1d&imgtype=0&src=http%3A%2F%2Fg.hiphotos.baidu.com%2Fimage%2Fpic%2Fitem%2F83025aafa40f4bfbb5163db50d4f78f0f6361808.jpg'),
('2', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1563007346486&di=9fd9c2d619108b7f811b3cd273dd2a1d&imgtype=0&src=http%3A%2F%2Fg.hiphotos.baidu.com%2Fimage%2Fpic%2Fitem%2F83025aafa40f4bfbb5163db50d4f78f0f6361808.jpg'),
('2', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1563007346486&di=9fd9c2d619108b7f811b3cd273dd2a1d&imgtype=0&src=http%3A%2F%2Fg.hiphotos.baidu.com%2Fimage%2Fpic%2Fitem%2F83025aafa40f4bfbb5163db50d4f78f0f6361808.jpg'),
('2', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1563007346486&di=9fd9c2d619108b7f811b3cd273dd2a1d&imgtype=0&src=http%3A%2F%2Fg.hiphotos.baidu.com%2Fimage%2Fpic%2Fitem%2F83025aafa40f4bfbb5163db50d4f78f0f6361808.jpg'),
('3', 'http://img1.imgtn.bdimg.com/it/u=1362470089,3616253866&fm=26&gp=0.jpg'),
('3', 'http://img1.imgtn.bdimg.com/it/u=1362470089,3616253866&fm=26&gp=0.jpg'),
('3', 'http://img1.imgtn.bdimg.com/it/u=1362470089,3616253866&fm=26&gp=0.jpg'),
('3', 'http://img1.imgtn.bdimg.com/it/u=1362470089,3616253866&fm=26&gp=0.jpg'),
('3', 'http://img1.imgtn.bdimg.com/it/u=1362470089,3616253866&fm=26&gp=0.jpg'),
('3', 'http://img1.imgtn.bdimg.com/it/u=1362470089,3616253866&fm=26&gp=0.jpg'),
('4', 'http://img1.imgtn.bdimg.com/it/u=2556094364,2293088175&fm=26&gp=0.jpg'),
('4', 'http://img1.imgtn.bdimg.com/it/u=2556094364,2293088175&fm=26&gp=0.jpg'),
('4', 'http://img1.imgtn.bdimg.com/it/u=2556094364,2293088175&fm=26&gp=0.jpg'),
('4', 'http://img1.imgtn.bdimg.com/it/u=2556094364,2293088175&fm=26&gp=0.jpg'),
('4', 'http://img1.imgtn.bdimg.com/it/u=2556094364,2293088175&fm=26&gp=0.jpg'),
('4', 'http://img1.imgtn.bdimg.com/it/u=2556094364,2293088175&fm=26&gp=0.jpg'),
('5', 'http://img4.imgtn.bdimg.com/it/u=3067933214,986529632&fm=26&gp=0.jpg'),
('5', 'http://img4.imgtn.bdimg.com/it/u=3067933214,986529632&fm=26&gp=0.jpg'),
('5', 'http://img4.imgtn.bdimg.com/it/u=3067933214,986529632&fm=26&gp=0.jpg'),
('5', 'http://img4.imgtn.bdimg.com/it/u=3067933214,986529632&fm=26&gp=0.jpg'),
('5', 'http://img4.imgtn.bdimg.com/it/u=3067933214,986529632&fm=26&gp=0.jpg'),
('5', 'http://img4.imgtn.bdimg.com/it/u=3067933214,986529632&fm=26&gp=0.jpg'),
('6', 'http://img4.imgtn.bdimg.com/it/u=4206348751,4177014175&fm=26&gp=0.jpg'),
('6', 'http://img4.imgtn.bdimg.com/it/u=4206348751,4177014175&fm=26&gp=0.jpg'),
('6', 'http://img4.imgtn.bdimg.com/it/u=4206348751,4177014175&fm=26&gp=0.jpg'),
('6', 'http://img4.imgtn.bdimg.com/it/u=4206348751,4177014175&fm=26&gp=0.jpg'),
('6', 'http://img4.imgtn.bdimg.com/it/u=4206348751,4177014175&fm=26&gp=0.jpg'),
('6', 'http://img4.imgtn.bdimg.com/it/u=4206348751,4177014175&fm=26&gp=0.jpg'),
('', ''),
('', ''),
('', ''),
('', ''),
('5', 'http://img4.imgtn.bdimg.com/it/u=3067933214,986529632&fm=26&gp=0.jpg'),
('5', 'http://img4.imgtn.bdimg.com/it/u=3067933214,986529632&fm=26&gp=0.jpg'),
('5', 'http://img4.imgtn.bdimg.com/it/u=3067933214,986529632&fm=26&gp=0.jpg'),
('5', 'http://img4.imgtn.bdimg.com/it/u=3067933214,986529632&fm=26&gp=0.jpg'),
('5', 'http://img4.imgtn.bdimg.com/it/u=3067933214,986529632&fm=26&gp=0.jpg'),
('5', 'http://img4.imgtn.bdimg.com/it/u=3067933214,986529632&fm=26&gp=0.jpg'),
('6', 'http://img4.imgtn.bdimg.com/it/u=4206348751,4177014175&fm=26&gp=0.jpg'),
('6', 'http://img4.imgtn.bdimg.com/it/u=4206348751,4177014175&fm=26&gp=0.jpg'),
('6', 'http://img4.imgtn.bdimg.com/it/u=4206348751,4177014175&fm=26&gp=0.jpg'),
('6', 'http://img4.imgtn.bdimg.com/it/u=4206348751,4177014175&fm=26&gp=0.jpg'),
('6', 'http://img4.imgtn.bdimg.com/it/u=4206348751,4177014175&fm=26&gp=0.jpg'),
('6', 'http://img4.imgtn.bdimg.com/it/u=4206348751,4177014175&fm=26&gp=0.jpg'),
('7', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1563014140015&di=756183d77874f38570ed86576e1d41ed&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201505%2F01%2F20150501054930_UmC5v.jpeg'),
('7', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1563014140015&di=756183d77874f38570ed86576e1d41ed&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201505%2F01%2F20150501054930_UmC5v.jpeg'),
('7', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1563014140015&di=756183d77874f38570ed86576e1d41ed&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201505%2F01%2F20150501054930_UmC5v.jpeg'),
('7', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1563014140015&di=756183d77874f38570ed86576e1d41ed&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201505%2F01%2F20150501054930_UmC5v.jpeg'),
('7', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1563014140015&di=756183d77874f38570ed86576e1d41ed&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201505%2F01%2F20150501054930_UmC5v.jpeg'),
('7', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1563014140015&di=756183d77874f38570ed86576e1d41ed&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201505%2F01%2F20150501054930_UmC5v.jpeg');

-- --------------------------------------------------------

--
-- 表的结构 `shopcart`
--

CREATE TABLE IF NOT EXISTS `shopcart` (
  `id` int(225) NOT NULL AUTO_INCREMENT,
  `title` varchar(500) NOT NULL,
  `price` varchar(500) NOT NULL,
  `img_url` varchar(500) NOT NULL,
  `bynum` varchar(500) NOT NULL,
  `store` varchar(500) NOT NULL,
  `cid` varchar(500) NOT NULL,
  `pay` varchar(10) NOT NULL,
  `hade` varchar(10) NOT NULL,
  `star` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `shopcart`
--

INSERT INTO `shopcart` (`id`, `title`, `price`, `img_url`, `bynum`, `store`, `cid`, `pay`, `hade`, `star`) VALUES
(1, '全20册鬼谷子全集九型人格墨菲定律人性的弱点方与圆狼道羊皮卷口才三绝为人三会修心三不无厚黑学书籍', '99', '//img10.360buyimg.com/n2/s240x240_jfs/t1/75840/27/3847/165945/5d201966E0ca583de/ee206b700e537938.jpg!q70.jpg', '1', '人人书店', '0', '1', '1', '0'),
(2, '局外人(如果你在人群中感到格格不入，一定要读《局外人》 ！精装插图珍藏版！诺奖作品，此生必读)(读客经典文库)', '44', 'https://wqimg.jd.com/imgproxy/n2/s240x240_jfs/t1/27289/23/7777/351831/5c6e18b2Ee7c48be6/77f9c8539ab40c2a.jpg!q70.jpg', '1', '人人书店', '1', '1', '1', '0'),
(3, '全20册鬼谷子全集九型人格墨菲定律人性的弱点方与圆狼道羊皮卷口才三绝为人三会修心三不无厚黑学书籍', '99', '//img10.360buyimg.com/n2/s240x240_jfs/t1/75840/27/3847/165945/5d201966E0ca583de/ee206b700e537938.jpg!q70.jpg', '1', '人人书店', '0', '1', '1', '0'),
(4, '漫长的告别（怪不得村上春树读了12遍！每每陷入困境，村上春树便打开《漫长的告别》！全新精装插图珍藏版）', '11', '//img13.360buyimg.com/mobilecms/s316x316_jfs/t29623/161/163538582/162899/4dded798/5bea3dceN10e51b04.jpg!q70.dpg.webp', '3', '人人书店', '4', '1', '1', '0'),
(9, '局外人(如果你在人群中感到格格不入，一定要读《局外人》 ！精装插图珍藏版！诺奖作品，此生必读)(读客经典文库)', '44', 'https://wqimg.jd.com/imgproxy/n2/s240x240_jfs/t1/27289/23/7777/351831/5c6e18b2Ee7c48be6/77f9c8539ab40c2a.jpg!q70.jpg', '1', '人人书店', '1', '0', '0', '0'),
(7, '局外人(如果你在人群中感到格格不入，一定要读《局外人》 ！精装插图珍藏版！诺奖作品，此生必读)(读客经典文库)', '44', 'https://wqimg.jd.com/imgproxy/n2/s240x240_jfs/t1/27289/23/7777/351831/5c6e18b2Ee7c48be6/77f9c8539ab40c2a.jpg!q70.jpg', '1', '人人书店', '1', '1', '1', '0');

-- --------------------------------------------------------

--
-- 表的结构 `shopinfo`
--

CREATE TABLE IF NOT EXISTS `shopinfo` (
  `id` varchar(500) NOT NULL,
  `title` varchar(500) NOT NULL,
  `add_time` varchar(500) NOT NULL,
  `shops_no` varchar(500) NOT NULL,
  `sell_price` varchar(500) NOT NULL,
  `market_price` varchar(500) NOT NULL,
  `stock` varchar(500) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `shopinfo`
--

INSERT INTO `shopinfo` (`id`, `title`, `add_time`, `shops_no`, `sell_price`, `market_price`, `stock`) VALUES
('0', '全20册鬼谷子全集九型人格墨菲定律人性的弱点方与圆狼道羊皮卷口才三绝为人三会修心三不无厚黑学书籍', '2019-07-16T09:49:05.574Z', '224242424242', '99', '199', '445'),
('1', '局外人(如果你在人群中感到格格不入，一定要读《局外人》 ！精装插图珍藏版！诺奖作品，此生必读)(读客经典文库)', '2019-07-16T09:49:05.574Z', '24244545', '44', '55', '213'),
('2', '余生很长，别慌张，别失望', '2019-07-16T09:49:05.574Z', '45754242', '12', '45', '212'),
('3', '我们的中国', '2019-07-16T09:49:05.574Z', '678654225', '56', '75', '131'),
('4', '漫长的告别（怪不得村上春树读了12遍！每每陷入困境，村上春树便打开《漫长的告别》！全新精装插图珍藏版）', '2019-07-16T09:49:05.574Z', '532232435', '11', '45', '121'),
('5', '余华作品：活着', '2019-07-16T09:49:05.574Z', '44534535433', '87', '125', '32'),
('6', '一看就停不下来的中国史(京东定制版)', '2019-07-16T09:49:05.574Z', '4545442424', '44', '32', '45'),
('7', '我有友情要出租（拼音版）', '2019-07-16T09:49:05.574Z', '25454243545', '87', '125', '32'),
('8', '天才在左 疯子在右：完整版(新版)', '2019-07-16T09:49:05.574Z', '445245345345343', '54', '343', '213'),
('9', '米小圈漫画成语（套装共4册）', '2019-07-16T09:49:05.574Z', '2424242442424', '112', '211', '2242');

-- --------------------------------------------------------

--
-- 表的结构 `shoplist`
--

CREATE TABLE IF NOT EXISTS `shoplist` (
  `id` int(250) NOT NULL AUTO_INCREMENT,
  `title` varchar(500) NOT NULL,
  `add_time` varchar(500) NOT NULL,
  `stock` varchar(500) NOT NULL,
  `img_url` varchar(500) NOT NULL,
  `sell_price` varchar(500) NOT NULL,
  `market_price` varchar(500) NOT NULL,
  `page` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

--
-- 转存表中的数据 `shoplist`
--

INSERT INTO `shoplist` (`id`, `title`, `add_time`, `stock`, `img_url`, `sell_price`, `market_price`, `page`) VALUES
(1, '局外人(如果你在人群中感到格格不入，一定要读《局外人》 ！精装插图珍藏版！诺奖作品，此生必读)(读客经典文库)', '2019-07-16T09:49:05.574Z', '213', 'https://wqimg.jd.com/imgproxy/n2/s240x240_jfs/t1/27289/23/7777/351831/5c6e18b2Ee7c48be6/77f9c8539ab40c2a.jpg!q70.jpg', '45', '55', '1'),
(2, '余生很长，别慌张，别失望', '2019-07-16T09:49:05.574Z', '212', '//img12.360buyimg.com/mobilecms/s316x316_jfs/t29086/155/678303512/196690/31039bd0/5bfb571bN407bfa35.jpg!q70.dpg.webp', '12', '45', '1'),
(3, '我们的中国', '2019-07-16T09:49:05.574Z', '131', '//img13.360buyimg.com/mobilecms/s316x316_jfs/t22192/17/1011997914/284933/6ac1711d/5b1f2c4fN7047d2fa.jpg!q70.dpg.webp', '56', '75', '1'),
(4, '漫长的告别（怪不得村上春树读了12遍！每每陷入困境，村上春树便打开《漫长的告别》！全新精装插图珍藏版）', '2018-04-16T03:50:28.000Z', '121', '//img13.360buyimg.com/mobilecms/s316x316_jfs/t29623/161/163538582/162899/4dded798/5bea3dceN10e51b04.jpg!q70.dpg.webp', '11', '45', '1'),
(6, '余华作品：活着', '2019-07-16T09:49:05.574Z', '54', '//img10.360buyimg.com/mobilecms/s316x316_jfs/t10162/279/1390942739/246693/50c56f9d/59e02214N37418280.jpg!q70.dpg.webp', '555', '666', '1'),
(7, '一看就停不下来的中国史(京东定制版)', '2019-07-16T09:49:05.574Z', '45', '//img10.360buyimg.com/mobilecms/s316x316_jfs/t1/3188/6/5712/618881/5ba0b625E6a0d6535/8d695a662e7732a8.jpg!q70.dpg.webp', '44', '32', '1'),
(8, '我有友情要出租（拼音版）', '2019-07-16T09:49:05.574Z', '32', '//img11.360buyimg.com/mobilecms/s316x316_jfs/t5713/277/1465255235/1655368/2c18960f/5926951eN8b92f3bb.jpg!q70.dpg.webp', '87', '125', '1'),
(9, '天才在左 疯子在右：完整版(新版)', '2019-07-16T09:49:05.574Z', '213', '//img10.360buyimg.com/mobilecms/s316x316_jfs/t21844/141/1082279706/186548/57ca96a5/5b1f9c10N493b8e20.jpg!q70.dpg.webp', '54', '343', '1'),
(10, '数学星球 让孩子爱上数学的趣味绘本', '2019-07-16T09:49:05.574Z', '554', '//img10.360buyimg.com/mobilecms/s316x316_jfs/t3460/179/626634935/90153/59f3be4b/580f1c8aNb8b5119b.jpg!q70.dpg.webp', '44', '55', '2'),
(11, '愿你历尽千帆，归来仍是少年', '2019-07-16T09:49:05.574Z', '232', '//img14.360buyimg.com/mobilecms/s316x316_jfs/t7111/307/1332683914/364446/5f863a23/598a7f36Na3f5e213.jpg!q70.dpg.webp', '22', '111', '2'),
(12, '雾都孤儿（精装名译 原版全译本 新版）', '2019-07-16T09:49:05.574Z', '12', '//img11.360buyimg.com/mobilecms/s316x316_jfs/t3985/187/499213297/77347/b73d2cba/58524ce2Nd8f4b282.jpg!q70.dpg.webp', '212', '1212', '2'),
(13, '简·爱（精装名译 原版全译本简爱）[英] 夏洛蒂·勃朗特', '2019-07-16T09:49:05.574Z', '45', '//img10.360buyimg.com/mobilecms/s316x316_jfs/t5608/311/8724956744/245102/b86fbd1f/597f0b57Nf6b8913b.jpg!q70.dpg.webp', '54', '77', '2'),
(14, '简·爱（精装名译 原版全译本简爱）[英] 夏洛蒂·勃朗特', '2019-07-16T09:49:05.574Z', '43', '//img10.360buyimg.com/mobilecms/s316x316_jfs/t5608/311/8724956744/245102/b86fbd1f/597f0b57Nf6b8913b.jpg!q70.dpg.webp', '43', '77', '2'),
(15, '简·爱（精装名译 原版全译本简爱）[英] 夏洛蒂·勃朗特', '2019-07-16T09:49:05.574Z', '554', '//img10.360buyimg.com/mobilecms/s316x316_jfs/t5608/311/8724956744/245102/b86fbd1f/597f0b57Nf6b8913b.jpg!q70.dpg.webp', '75', '99', '2'),
(16, '简·爱（精装名译 原版全译本简爱）[英] 夏洛蒂·勃朗特', '2019-07-16T09:49:05.574Z', '54', '//img10.360buyimg.com/mobilecms/s316x316_jfs/t5608/311/8724956744/245102/b86fbd1f/597f0b57Nf6b8913b.jpg!q70.dpg.webp', '34', '34', '2'),
(17, '简·爱（精装名译 原版全译本简爱）[英] 夏洛蒂·勃朗特', '2019-07-16T09:49:05.574Z', '534', '//img10.360buyimg.com/mobilecms/s316x316_jfs/t5608/311/8724956744/245102/b86fbd1f/597f0b57Nf6b8913b.jpg!q70.dpg.webp', '5435', '8943', '2'),
(18, '简·爱（精装名译 原版全译本简爱）[英] 夏洛蒂·勃朗特', '2019-07-16T09:49:05.574Z', '55', '//img14.360buyimg.com/mobilecms/s316x316_jfs/t2833/360/2356290198/499895/543de4d6/5760b6c5N8537e3b0.jpg!q70.dpg.webp', '88', '99', '2'),
(19, '简·爱（精装名译 原版全译本简爱）[英] 夏洛蒂·勃朗特', '2019-07-16T09:49:05.574Z', '225', '//img14.360buyimg.com/mobilecms/s316x316_jfs/t2833/360/2356290198/499895/543de4d6/5760b6c5N8537e3b0.jpg!q70.dpg.webp', '78', '98', '2'),
(5, '米小圈漫画成语（套装共4册）', '2019-07-16T09:49:05.574Z', '2242', '//img14.360buyimg.com/mobilecms/s316x316_jfs/t2833/360/2356290198/499895/543de4d6/5760b6c5N8537e3b0.jpg!q70.dpg.webp', '112', '211', '1'),
(22, '全20册鬼谷子全集九型人格墨菲定律人性的弱点方与圆狼道羊皮卷口才三绝为人三会修心三不无厚黑学书籍', '2019-07-16T09:49:05.574Z', '11', '//img14.360buyimg.com/mobilecms/s316x316_jfs/t2833/360/2356290198/499895/543de4d6/5760b6c5N8537e3b0.jpg!q70.dpg.webp', '22', '515', '1');

-- --------------------------------------------------------

--
-- 表的结构 `shopswipe`
--

CREATE TABLE IF NOT EXISTS `shopswipe` (
  `id` varchar(500) NOT NULL,
  `img_url` varchar(500) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `shopswipe`
--

INSERT INTO `shopswipe` (`id`, `img_url`) VALUES
('0', '//m.360buyimg.com/mobilecms/s843x843_jfs/t2701/214/2302912978/459750/19d2f8b1/5760b6ceNc22a4ce1.jpg!q70.dpg.webp'),
('0', '//m.360buyimg.com/mobilecms/s843x843_jfs/t2743/353/2300859937/510641/d85dd978/5760b6d2N9205bd1d.jpg!q70.dpg.webp'),
('0', '//m.360buyimg.com/mobilecms/s843x843_jfs/t2614/273/2299628099/464174/b93aed79/5760b6d7N297e9765.jpg!q70.dpg.webp'),
('1', '//m.360buyimg.com/mobilecms/s843x843_jfs/t2701/214/2302912978/459750/19d2f8b1/5760b6ceNc22a4ce1.jpg!q70.dpg.webp'),
('1', '/m.360buyimg.com/mobilecms/s843x843_jfs/t2743/353/2300859937/510641/d85dd978/5760b6d2N9205bd1d.jpg!q70.dpg.webp'),
('1', '//m.360buyimg.com/mobilecms/s843x843_jfs/t2614/273/2299628099/464174/b93aed79/5760b6d7N297e9765.jpg!q70.dpg.webp'),
('2', '//m.360buyimg.com/mobilecms/s843x843_jfs/t2701/214/2302912978/459750/19d2f8b1/5760b6ceNc22a4ce1.jpg!q70.dpg.webp'),
('2', '/m.360buyimg.com/mobilecms/s843x843_jfs/t2743/353/2300859937/510641/d85dd978/5760b6d2N9205bd1d.jpg!q70.dpg.webp'),
('2', '//m.360buyimg.com/mobilecms/s843x843_jfs/t2614/273/2299628099/464174/b93aed79/5760b6d7N297e9765.jpg!q70.dpg.webp'),
('3', '//m.360buyimg.com/mobilecms/s843x843_jfs/t2701/214/2302912978/459750/19d2f8b1/5760b6ceNc22a4ce1.jpg!q70.dpg.webp'),
('3', '/m.360buyimg.com/mobilecms/s843x843_jfs/t2743/353/2300859937/510641/d85dd978/5760b6d2N9205bd1d.jpg!q70.dpg.webp'),
('3', '//m.360buyimg.com/mobilecms/s843x843_jfs/t2614/273/2299628099/464174/b93aed79/5760b6d7N297e9765.jpg!q70.dpg.webp'),
('4', '//m.360buyimg.com/mobilecms/s843x843_jfs/t2701/214/2302912978/459750/19d2f8b1/5760b6ceNc22a4ce1.jpg!q70.dpg.webp'),
('4', '/m.360buyimg.com/mobilecms/s843x843_jfs/t2743/353/2300859937/510641/d85dd978/5760b6d2N9205bd1d.jpg!q70.dpg.webp'),
('4', '//m.360buyimg.com/mobilecms/s843x843_jfs/t2614/273/2299628099/464174/b93aed79/5760b6d7N297e9765.jpg!q70.dpg.webp'),
('5', '//m.360buyimg.com/mobilecms/s843x843_jfs/t2701/214/2302912978/459750/19d2f8b1/5760b6ceNc22a4ce1.jpg!q70.dpg.webp'),
('5', '/m.360buyimg.com/mobilecms/s843x843_jfs/t2743/353/2300859937/510641/d85dd978/5760b6d2N9205bd1d.jpg!q70.dpg.webp'),
('5', '//m.360buyimg.com/mobilecms/s843x843_jfs/t2614/273/2299628099/464174/b93aed79/5760b6d7N297e9765.jpg!q70.dpg.webp'),
('6', '//m.360buyimg.com/mobilecms/s843x843_jfs/t2701/214/2302912978/459750/19d2f8b1/5760b6ceNc22a4ce1.jpg!q70.dpg.webp'),
('6', '/m.360buyimg.com/mobilecms/s843x843_jfs/t2743/353/2300859937/510641/d85dd978/5760b6d2N9205bd1d.jpg!q70.dpg.webp'),
('6', '//m.360buyimg.com/mobilecms/s843x843_jfs/t2614/273/2299628099/464174/b93aed79/5760b6d7N297e9765.jpg!q70.dpg.webp'),
('7', '//m.360buyimg.com/mobilecms/s843x843_jfs/t2701/214/2302912978/459750/19d2f8b1/5760b6ceNc22a4ce1.jpg!q70.dpg.webp'),
('7', '/m.360buyimg.com/mobilecms/s843x843_jfs/t2743/353/2300859937/510641/d85dd978/5760b6d2N9205bd1d.jpg!q70.dpg.webp'),
('7', '//m.360buyimg.com/mobilecms/s843x843_jfs/t2614/273/2299628099/464174/b93aed79/5760b6d7N297e9765.jpg!q70.dpg.webp'),
('8', '//m.360buyimg.com/mobilecms/s843x843_jfs/t2701/214/2302912978/459750/19d2f8b1/5760b6ceNc22a4ce1.jpg!q70.dpg.webp'),
('8', '/m.360buyimg.com/mobilecms/s843x843_jfs/t2743/353/2300859937/510641/d85dd978/5760b6d2N9205bd1d.jpg!q70.dpg.webp'),
('8', '//m.360buyimg.com/mobilecms/s843x843_jfs/t2614/273/2299628099/464174/b93aed79/5760b6d7N297e9765.jpg!q70.dpg.webp'),
('9', '//m.360buyimg.com/mobilecms/s843x843_jfs/t2701/214/2302912978/459750/19d2f8b1/5760b6ceNc22a4ce1.jpg!q70.dpg.webp'),
('9', '/m.360buyimg.com/mobilecms/s843x843_jfs/t2743/353/2300859937/510641/d85dd978/5760b6d2N9205bd1d.jpg!q70.dpg.webp'),
('9', '//m.360buyimg.com/mobilecms/s843x843_jfs/t2614/273/2299628099/464174/b93aed79/5760b6d7N297e9765.jpg!q70.dpg.webp');

-- --------------------------------------------------------

--
-- 表的结构 `swipe`
--

CREATE TABLE IF NOT EXISTS `swipe` (
  `id` int(250) NOT NULL AUTO_INCREMENT,
  `img_url` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `swipe`
--

INSERT INTO `swipe` (`id`, `img_url`) VALUES
(1, '//m.360buyimg.com/babel/s1440x576_jfs/t1/38619/35/9491/194838/5d54d607E6aa15ec0/ef5d6a48634c9d98.jpg!q70.dpg'),
(2, '//m.360buyimg.com/babel/s1440x576_jfs/t1/55513/4/8321/170784/5d5ced68E1bc87377/284cba226936507f.jpg!q70.dpg'),
(3, '//m.360buyimg.com/babel/s1440x576_jfs/t1/54378/26/7777/191493/5d54c78bE8c56c1c5/08ff63a9c9e9e617.jpg!q70.dpg'),
(4, '//m.360buyimg.com/babel/s1440x576_jfs/t1/40243/27/14283/147136/5d552cceE5ddb9698/756deba58172f26d.jpg!q70.dpg'),
(5, '//m.360buyimg.com/babel/s1440x576_jfs/t1/60524/37/7153/145633/5d54c59aE9af60a89/234fa58cebdc613f.jpg!q70.dpg');

-- --------------------------------------------------------

--
-- 表的结构 `typelist`
--

CREATE TABLE IF NOT EXISTS `typelist` (
  `id` varchar(500) NOT NULL,
  `title` varchar(500) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `typelist`
--

INSERT INTO `typelist` (`id`, `title`) VALUES
('0', '推荐分类'),
('1', '经管理财'),
('2', '人文社科'),
('3', '科学技术'),
('4', '英文原版'),
('5', '悦享生活'),
('6', '科学技术'),
('7', '英文原版');

-- --------------------------------------------------------

--
-- 表的结构 `typeright`
--

CREATE TABLE IF NOT EXISTS `typeright` (
  `id` int(250) NOT NULL AUTO_INCREMENT,
  `tid` varchar(500) NOT NULL,
  `title` varchar(500) NOT NULL,
  `img` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- 转存表中的数据 `typeright`
--

INSERT INTO `typeright` (`id`, `tid`, `title`, `img`) VALUES
(1, '0', '童书', '//img30.360buyimg.com/focus/s140x140_jfs/t18520/109/1790543750/23751/a98be11f/5ad82a1cN400c11d1.jpg'),
(2, '0', '教材教辅', '//img13.360buyimg.com/focus/s140x140_jfs/t17050/274/1799803385/10631/fc5794e2/5ad82735N3559f4ac.jpg'),
(3, '0', '人文社科', '//img12.360buyimg.com/focus/s140x140_jfs/t17599/245/1834577586/17629/f5050ae7/5ad82741N33a7d3c9.jpg'),
(4, '0', '教育培训', '//img12.360buyimg.com/focus/s140x140_jfs/t18814/91/1828016712/4496/fe8321bc/5ad82787N36425838.jpg'),
(12, '4', '进口原版', '//img12.360buyimg.com/focus/s140x140_jfs/t19909/9/726347751/9308/21a6384a/5b07e2f0Ne5a3641d.jpg'),
(11, '3', '科普读物', '//img12.360buyimg.com/focus/s140x140_jfs/t20920/177/270369244/6700/69b32745/5b07e296N9ddfee9c.jpg'),
(5, '1', '管理', '//img11.360buyimg.com/focus/s140x140_jfs/t20158/25/263157759/5918/1e887839/5b07e1a4N1a4fe985.jpg'),
(10, '3', '计算机与互联网', '//img12.360buyimg.com/focus/s140x140_jfs/t20665/60/264141596/6573/599a8f76/5b07e286N1db53ddf.jpg'),
(7, '1', '金融投资', '//img14.360buyimg.com/focus/s140x140_jfs/t18277/334/2616806830/15376/45b1bf4f/5b07e1beN8a8ef92a.jpg'),
(8, '2', '历史', '//img14.360buyimg.com/focus/s140x140_jfs/t20671/344/265384236/11591/45d338fc/5b07e0f4Nf1f7cc0f.jpg'),
(9, '2', '宗教哲学', '//img30.360buyimg.com/focus/s140x140_jfs/t20227/114/262039812/15324/49900a28/5b07e134N6ae9693e.jpg'),
(6, '1', '经济', '//img11.360buyimg.com/focus/s140x140_jfs/t20158/25/263157759/5918/1e887839/5b07e1a4N1a4fe985.jpg'),
(14, '励志', '5', '//img14.360buyimg.com/mobilecms/s372x372_jfs/t1/78196/15/5115/457192/5d33e71fE6480eca9/38cfa358d72b6b3b.jpg!q70.dpg.webp');

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(250) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) NOT NULL,
  `pass` varchar(500) NOT NULL,
  `addtime` varchar(500) NOT NULL,
  `phone` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`id`, `name`, `pass`, `addtime`, `phone`) VALUES
(1, '跪拜ing', '222222', '2019-08-08 14:34:10.294', '13025454546'),
(3, '爱国者', '1212', '2019-08-09 08:47:16.300', '13021261615'),
(4, '任岭鑫', '110110ren', '2019-08-07 10:32:49.913', '18032094673'),
(5, '映红', '110110x', '2019-08-09 08:46:30.056', '13032094852');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
