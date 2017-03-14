/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50711
Source Host           : localhost:3306
Source Database       : mysql-ztcloud

Target Server Type    : MYSQL
Target Server Version : 50711
File Encoding         : 65001

Date: 2017-03-09 22:09:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for resource
-- ----------------------------
DROP TABLE IF EXISTS `resource`;
CREATE TABLE `resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of resource
-- ----------------------------

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------

-- ----------------------------
-- Table structure for role_resource
-- ----------------------------
DROP TABLE IF EXISTS `role_resource`;
CREATE TABLE `role_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_resource
-- ----------------------------

-- ----------------------------
-- Table structure for tb_exam
-- ----------------------------
DROP TABLE IF EXISTS `tb_exam`;
CREATE TABLE `tb_exam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `DURATION` int(11) DEFAULT NULL,
  `EXAM_TIME` datetime DEFAULT NULL,
  `REMARK` varchar(255) DEFAULT NULL,
  `SCORE` int(11) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_exam
-- ----------------------------
INSERT INTO `tb_exam` VALUES ('1', '30', '2017-03-09 14:44:39', null, '99', '1');
INSERT INTO `tb_exam` VALUES ('3', '15', '2017-03-09 14:45:16', null, '90', '2');

-- ----------------------------
-- Table structure for tb_questionbank
-- ----------------------------
DROP TABLE IF EXISTS `tb_questionbank`;
CREATE TABLE `tb_questionbank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ANSWER_KEYS` longtext,
  `CHAPTER` varchar(255) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `ITEM_A` varchar(255) DEFAULT NULL,
  `ITEM_B` varchar(255) DEFAULT NULL,
  `ITEM_C` varchar(255) DEFAULT NULL,
  `ITEM_D` varchar(255) DEFAULT NULL,
  `REMARK` varchar(255) DEFAULT NULL,
  `RIGHT_ANSWER` varchar(255) DEFAULT NULL,
  `TITLE` varchar(255) DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_questionbank
-- ----------------------------
INSERT INTO `tb_questionbank` VALUES ('14', '《道路交通事故处理程序规定》第十三条：对应当自行撤离现场而未撤离的，交通警察应当责令当事人撤离现场；造成交通堵塞的，对驾驶人处以200元罚款；驾驶人有其他道路交通安全违法行为的，依法一并处罚。', '1', '2017-03-09 18:52:28', '机动车发生财产损失交通事故，对应当自行撤离现场而未撤离造成交通堵塞的，可以对驾驶人处以200元罚款。', '对', '错', '无', '无', '无', 'a', '判断题', '交通标志类');
INSERT INTO `tb_questionbank` VALUES ('15', '前方有行人和自行车，道路较窄，驾驶机动车遇到这种情况，可以轻按喇叭提醒前方非机动车和行人后方有来车，这样更加安全。', '2', '2017-03-09 18:56:54', '如图所示，驾驶机动车遇到这种情况，可以轻按喇叭提醒前方非机动车和行人后方有来车。', '对', '错', '无', '无', 'jsp/common/question/02.png', 'a', '判断题', '其他类');
INSERT INTO `tb_questionbank` VALUES ('16', '警告标志傍山险路。用以提醒车辆驾驶人小心驾驶。设在傍山险路路段以前适当位置。', '3', '2017-03-09 18:58:24', '这个标志的含义是提醒车辆驾驶人前方是堤坝路段。', '对', '错', '无', '无', 'jsp/common/question/03.png', 'b', '判断题', '交通标志类');
INSERT INTO `tb_questionbank` VALUES ('17', '《公安部令第123号》第六十五条规定：机动车驾驶人在实习期内不得驾驶公共汽车、营运客车或者执行任务的警车、消防车、救护车、工程救险车以及载有爆炸物品、易燃易爆化学物品、剧毒或者放射性等危险物品的机动车；驾驶的机动车不得牵引挂车。', '4', '2017-03-09 18:59:35', '机动车驾驶人在实习期内驾驶机动车不得牵引挂车。', '对', '错', '无', '无', '无', 'a', '判断题', '其他类');
INSERT INTO `tb_questionbank` VALUES ('18', '机动车不得在人行横道上停车。', '5', '2017-03-09 19:01:23', '图中深色车辆在该地点临时停车是可以的。', '对', '错', '无', '无', 'jsp/common/question/05.png', 'b', '判断题', '其他类');
INSERT INTO `tb_questionbank` VALUES ('19', '三个先行原则：转弯的机动车让直行的车辆先行，右方道路来车先行，右转弯车让左转弯车先行。', '6', '2017-03-09 19:02:40', '如图所示，A车具有优先通行权。', '对', '错', '无', '无', 'jsp/common/question/06.png', 'b', '判断题', '其他类');
INSERT INTO `tb_questionbank` VALUES ('20', '《中华人民共和国道路交通安全法实施条例》第八十一条：机动车在高速公路上行驶，遇有雾、雨、雪、沙尘、冰雹等低能见度气象条件时，应当遵守下列规定：能见度小于200米时，开启雾灯、近光灯、示廓灯和前后位灯，车速不得超过每小时60公里，与同车道前车保持100米以上的距离。', '7', '2017-03-09 19:03:26', '驾驶机动车在高速公路上行驶，能见度小于200米时，车速不得超过每小时60公里。', '对', '错', '无', '无', '无', 'a', '判断题', '速度类');
INSERT INTO `tb_questionbank` VALUES ('21', '根据《机动车登记规定》第四十四条的规定：机动车号牌、行驶证灭失、丢失或者损毁的，机动车所有人应当向登记地车辆管理所申请补领、换领。申请时，机动车所有人应当填写申请表并提交身份证明。', '8', '2017-03-09 19:04:23', '机动车登记证书、号牌、行驶证灭失、丢失或者损毁的，机动车所有人应当向居住地车辆管理所申请补领、换领。', '对', '错', '无', '无', '无', 'b', '判断题', '其他类');
INSERT INTO `tb_questionbank` VALUES ('22', '警告标志连续弯路。用以警告车辆驾驶人减速慢行。设置位置为连续弯路起点的外面，当连续弯路总长度大于500m时，应重复设置。', '9', '2017-03-09 19:05:21', '这个标志的含义是警告前方有两个相邻的反向转弯道路。', '对', '错', '无', '无', 'jsp/common/question/09.png', 'b', '判断题', '交通标志类');
INSERT INTO `tb_questionbank` VALUES ('23', '前雾灯是朝左，后雾灯是朝右。所以图中是后雾灯！', '10', '2017-03-09 19:06:38', '打开前雾灯开关，（如图所示）亮起。', '对', '错', '无', '无', 'jsp/common/question/10.png', 'b', '判断题', '交通标志类');
INSERT INTO `tb_questionbank` VALUES ('24', '在进出环形路口或路口变更车道时，都必须让在原车道内行驶的车辆(包括非机动车)先行，并保证安全。', '1', '2017-03-09 19:07:55', '如图所示，在这种情况下准备进入环形路口时，为了保证车后车流的通畅，应加速超越红车进入路口。', '对', '错', '无', '无', 'jsp/common/question/11.png', 'b', '判断题', '速度类');
INSERT INTO `tb_questionbank` VALUES ('25', '《道路交通安全法》第九十五条：上道路行驶的机动车未悬挂机动车号牌，未放置检验合格标志、保险标志，或者未随车携带行驶证、驾驶证的，公安机关交通管理部门应当扣留机动车，通知当事人提供相应的牌证、标志或者补办相应手续，并可以依照本法第九十条的规定予以处罚。当事人提供相应的牌证、标志或者补办相应手续的，应当及时退还机动车。故意遮挡、污损或者不按规定安装机动车号牌的，依照本法第九十条的规定予以处罚。', '2', '2017-03-09 19:09:12', '交通警察对未放置保险标志上道路行驶的车辆可依法扣留行驶证。', '对', '错', '无', '无', '无', 'b', '判断题', '其他类');
INSERT INTO `tb_questionbank` VALUES ('26', '这是错误的行车方法，不论在何种情况下变更车道或者转弯，都必须开启转向灯，安全第一。', '3', '2017-03-09 19:09:45', '驾驶人在观察后方无来车的情况下，未开转向灯就变更车道也是合理的。', '对', '错', '无', '无', '无', 'b', '判断题', '其他类');
INSERT INTO `tb_questionbank` VALUES ('27', '《道路交通安全法》第七十条：在道路上发生交通事故，车辆驾驶人应当立即停车，保护现场；造成人身伤亡的，车辆驾驶人应当立即抢救受伤人员，并迅速报告执勤的交通警察或者公安机关交通管理部门。因抢救受伤人员变动现场的，应当标明位置。乘车人、过往车辆驾驶人、过往行人应当予以协助。在道路上发生交通事故，未造成人身伤亡，当事人对事实及成因无争议的，可以即行撤离现场，恢复交通，自行协商处理损害赔偿事宜；不即行撤离现场的，应当迅速报告执勤的交通警察或者公安机关交通管理部门。在道路上发生交通事故，仅造成轻微财产损失，并且基本事实清楚的，当事人应当先撤离现场再进行协商处理。', '4', '2017-03-09 19:14:07', '驾驶机动车在道路上发生交通事故要立即将车移到路边。', '对', '错', '无', '无', '无', 'b', '判断题', '其他类');
INSERT INTO `tb_questionbank` VALUES ('28', '这个警告标志是向右急转弯。', '5', '2017-03-09 19:15:27', '这个标志的含义是警告前方道路有障碍物，车辆减速绕行。', '对', '错', '无', '无', 'jsp/common/question/15.png', 'b', '判断题', '交通标志类');
INSERT INTO `tb_questionbank` VALUES ('29', '因为左侧便于观察，有利于安全，所以法律才规定左侧超车，所以快车道才在左侧。因此本题是对的。', '6', '2017-03-09 19:16:27', '超车时应从前车的左侧超越，是因为左侧超车便于观察，有利于安全。', '对', '对', '无', '无', '无', 'a', '判断题', '其他类');
INSERT INTO `tb_questionbank` VALUES ('30', '全国统一的交通信号分为：交通信号灯、交通标志、交通标线和交通警察的指挥。', '7', '2017-03-09 19:17:07', '交通信号包括交通信号灯、交通标志、交通标线和交通警察的指挥。', '对', '错', '无', '无', '无', 'a', '判断题', '交通标志类');
INSERT INTO `tb_questionbank` VALUES ('31', '灯光刺行人眼看不清会发生事故。因此本题是对的。', '灯光刺行人眼看不清会发生事故。因此本题是对的。', '2017-03-09 19:17:43', '夜间行车，遇对面来车未关闭远光灯时，应减速行驶，以防两车灯光的交汇处有行人通过时发生事故。', '对', '错', '无', '无', '无', '无', '判断题', '其他类');
INSERT INTO `tb_questionbank` VALUES ('32', '《中华人民共和国道路交通安全法》第五十四条条明确规定：道路养护车辆、工程作业车进行作业时，在不影响过往车辆通行的前提下，其行驶路线和方向不受交通标志、标线限制，过往车辆和人员应当注意避让。', '9', '2017-03-09 19:19:14', '如图所示，驾驶机动车遇到这种情况时，A车应当注意避让。', '对', '错', '无', '无', 'jsp/common/question/19.png', 'a', '判断题', '速度类');
INSERT INTO `tb_questionbank` VALUES ('33', '警告标志注意施工。用以告示前方道路施工，车辆应减速慢行或绕道行驶。该标志可以作为临时标志支设在施工路段以前适当位置。', '10', '2017-03-09 19:20:09', '这个标志的含义是告示前方是塌方路段，车辆应绕道行驶。', '对', '错', '无', '无', 'jsp/common/question/20.png', '无', '判断题', '交通标志类');
INSERT INTO `tb_questionbank` VALUES ('34', '交叉路口标志的作用是：警告车辆驾驶人谨慎慢行，注意横向来车。', '1', '2017-03-09 19:21:06', '这个标志的作用是用以警告车辆驾驶人谨慎慢行，注意横向来车。', '对', '错', '无', '无', 'jsp/common/question/21.png', 'a', '判断题', '交通标志类');
INSERT INTO `tb_questionbank` VALUES ('35', '在夜间会车时开远光灯，容易造成对方驾驶员10米左右出现盲区，这种视线受阻一般可持续四五秒，而这四五秒极有可能酿成车祸。冬天冰雪路面光滑，会车时如果再开远光灯更容易造成事故。所以，会车150米以内应使用近光灯。', '1', '2017-03-09 19:22:16', '夜间会车规定150米以内使用近光灯的原因是什么？', '提示后方车辆', '两车之间相互提示', '使用远光灯会造成驾驶人出现眩目，易引发危险', '驾驶人的操作习惯行为', '无', 'c', '选择题', '其他类');
INSERT INTO `tb_questionbank` VALUES ('36', '直行和向右转弯：表示只准一切车辆直行和向右转弯。此标志设在车辆必须直行和向右转弯的路口以前适当位置', '2', '2017-03-09 19:23:23', '这个标志是何含义？', '直行和向右转弯', '直行和向左转弯', '禁止直行和向右转弯', '只准向左和向右转弯', 'jsp/common/question/32.png', 'a', '选择题', '交通标志类');
INSERT INTO `tb_questionbank` VALUES ('37', '高速公路加速车道最低行驶速度60公里每小时！ 《道路交通安全法实施条例》第78条规定：“高速公路最高车速不得超过每小时120公里，最低车速不得低于每小时60公里。”', '3', '2017-03-09 19:24:10', '驾驶车辆进入高速公路加速车道后，应尽快将车速提高到每小时多少公里以上？', '30', '40', '50', '60', '无', 'd', '选择题', '速度类');
INSERT INTO `tb_questionbank` VALUES ('38', '根据123号令第六章法律责任的规定：申请人在考试过程中有贿赂、舞弊行为的，取消考试资格，已经通过考试的其他科目成绩无效；申请人在一年内不得再次申领机动车驾驶证。', '4', '2017-03-09 19:24:52', '申请人在考试过程中有贿赂、舞弊行为的，申请人在多少年内不得再次申领机动车驾驶证？', '1年', '2年', '3年', '4年', '无', 'a', '选择题', '其他类');
INSERT INTO `tb_questionbank` VALUES ('39', '机动车行驶中遇有下列情形之一的，最高行驶速度不得超过每小时30公里，其中拖拉机、电瓶车、轮式专用机械车不得超过每小时15公里：　　  （一）进出非机动车道，通过铁路道口、急弯路、窄路、窄桥时；　　  （二）掉头、转弯、下陡坡时；　　  （三）遇雾、雨、雪、沙尘、冰雹，能见度在50米以内时；　　  （四）在冰雪、泥泞的道路上行驶时；', '5', '2017-03-09 19:25:38', '驾驶机动车在泥泞道路行驶时，最高速度不能超过多少？', '15公里/小时', '20公里/小时', '30公里/小时', '40公里/小时', '无', 'c', '选择题', '速度类');
INSERT INTO `tb_questionbank` VALUES ('40', '多股铁路与道路相交，则应在铁路道口标志上方设置叉形符号。叉形符号交叉点到警告标志三角形顶点的距离为40cm。', '6', '2017-03-09 19:26:39', '这个标志是何含义？', '注意避让火车', '有人看守铁路道口', '无人看守铁路道口', '多股铁路与道路相交', 'jsp/common/question/36.png', 'd', '选择题', '通标志类');
INSERT INTO `tb_questionbank` VALUES ('41', '超车只能从左侧超越。因为驾驶员在左边，左边超车，驾驶员能观察到相对行驶车道有无来车。而右方超车驾驶员是看不到前方是否来车或速度慢的车辆', '7', '2017-03-09 19:28:53', '这种情况超车时，从前车的哪一侧超越？', '从前车的右侧超越', '左右两侧均可超越', '从前车的左侧超越', '从前车的左侧超越', 'jsp/common/question/37.png', 'c', '选择题', '其他类');
INSERT INTO `tb_questionbank` VALUES ('42', '驾驶证遗失、损毁无法辨认时驾驶员应当向驾驶证核发地车辆管理所申请补发。', '8', '2017-03-09 19:29:28', '机动车驾驶证遗失的，机动车驾驶人应当向哪里的车辆管理所申请补发？', '核发地', '暂住地', '居住地', '户籍地', '无', 'a', '选择题', '其他类');
INSERT INTO `tb_questionbank` VALUES ('43', '燃油表上有个加油站里的加油机的标志', '9', '2017-03-09 19:30:33', '选择题', '图1', '图2', '图3', '图4', 'jsp/common/question/39.png', 'd', '选择题', '其他类');
INSERT INTO `tb_questionbank` VALUES ('44', '直行和向左转弯：表示只准一切车辆直行和向左转弯。此标志设在车辆必须直行和向左转弯的路口以前适当位置。', '10', '2017-03-09 19:31:47', '这个标志是何含义？', '直行和向右转弯', '直行和向右转弯', '禁止直行和向左转弯', '禁止直行和向左转弯', 'jsp/common/question/40.png', 'b', '选择题', '交通标志类');
INSERT INTO `tb_questionbank` VALUES ('45', '车门锁住开锁', '1', '2017-03-09 19:33:39', '（如图所示）这个符号的开关控制什么装置？', '儿童安全锁', '两侧车窗玻璃', '两侧车窗玻璃', '车门锁住开锁', 'jsp/common/question/41.png', 'd', '选择题', '其他类');
INSERT INTO `tb_questionbank` VALUES ('46', '和谐第一，礼让优先。', '2', '2017-03-09 19:34:17', '在一般道路倒车时，若发现有过往车辆通过，应怎样做？', '继续倒车', '鸣喇叭示意', '主动停车避让', '加速倒车', '无', 'c', '选择题', '其他类');
INSERT INTO `tb_questionbank` VALUES ('47', '驾驶技能准考证明的有效期为三年，申请人应当在有效期内完成科目二和科目三考试。未在有效期内完成考试的，已考试合格的科目成绩作废。', '3', '2017-03-09 19:34:56', '驾驶技能准考证明的有效期是多久？', '1年', '2年', '3年', '4年', '无', 'c', '选择题', '其他类');
INSERT INTO `tb_questionbank` VALUES ('48', '看图，直行跟左转都是红灯，只有右转是绿灯，所以只能向右转弯。', '4', '2017-03-09 19:35:49', '这个路口允许车辆怎样行驶？', '直行', '直行', '直行或向左转弯', '向左转弯', 'jsp/common/question/44.png', 'b', '选择题', '速度类');
INSERT INTO `tb_questionbank` VALUES ('49', '黄底为警告标志，此标志表示注意合流。用以警告车辆驾驶人注意前方有车辆汇合进来。', '5', '2017-03-09 19:36:58', '这个标志是何含义？', 'Y型交叉口', '主路让行', '主路让行', '注意合流', 'jsp/common/question/45.png', 'd', '选择题', '交通标志类');
INSERT INTO `tb_questionbank` VALUES ('50', '易滑路段：此标志设在路面的摩擦系数不能满足相应行驶速度下要求紧急刹车距离的路段前适当位置。行驶至此路段必须减速慢行。', '6', '2017-03-09 19:38:16', '这个标志是何含义？', '急转弯路', '易滑路段', '试车路段', '曲线路段', 'jsp/common/question/46.png', 'b', '选择题', '交通标志类');
INSERT INTO `tb_questionbank` VALUES ('51', '泥泞路面特别松软和粘稠，车辆行驶阻力大，附着力减小，车轮极易划转和侧滑。', '7', '2017-03-09 19:39:04', '泥泞道路对安全行车的主要影响是什么？', '行驶阻力变小', '车轮极易滑转和侧滑', '见度低，视野模糊', '路面附着力增大', '无', 'b', '选择题', '其他类');
INSERT INTO `tb_questionbank` VALUES ('52', '前方有行人，有路口，安全第一，一定要减速或者停车避让行人！', '8', '2017-03-09 19:39:58', '如图所示，在这种情况下通过前方路口，应该怎么行驶？', '加速通过', '减速或停车避让行人', '赶在行人前通过', '赶在行人前通过', 'jsp/common/question/48.png', 'b', '选择题', '其他类');
INSERT INTO `tb_questionbank` VALUES ('53', '红圈白底限制最高速度，此路段最高车速是120公里每小时。', '9', '2017-03-09 19:41:24', '在这段高速公路上行驶的最高车速是多少？', '120公里/小时', '100公里/小时', '90公里/小时', '90公里/小时', 'jsp/common/question/49.png', 'a', '选择题', '速度类');
INSERT INTO `tb_questionbank` VALUES ('55', '此标志为多乘员车辆专用车道，比机动车专用车道标志上的小车多了2个小人，所以它是多乘员车辆专用车道。', '1', '2017-03-09 19:44:23', '这个标志是何含义？', '这个标志是何含义？', '机动车专用车道', '多乘员车辆专用车道', '多乘员车辆专用车道', 'jsp/common/question/51.png', 'c', '选择题', '交通标志类');
INSERT INTO `tb_questionbank` VALUES ('56', '图1表示向左急转弯，警告驾驶人减速慢行；图2表示连续弯路，警告驾驶人减速慢行；图3表示反向弯路，警告驾驶人减速慢行；图4表示下坡路，提醒驾驶人下陡坡小心驾驶。', '2', '2017-03-09 19:45:41', '下列哪个标志提示驾驶人下陡坡？', '图1', '图2', '图3', '图4', 'jsp/common/question/52.png', 'd', '选择题', '交通标志类');
INSERT INTO `tb_questionbank` VALUES ('57', '先看箭头不是从中间直行，而是向右绕行。再看红色的圈，是限高4米。结合起来就是，超过4米需按箭头指示路线绕行，所以是超高绕行。', '3', '2017-03-09 19:46:37', '这个标志是何含义？', '禁止左转', '此路不通', '禁止通行', '超高绕行', 'jsp/common/question/53.png', 'd', '选择题', '交通标志类');
INSERT INTO `tb_questionbank` VALUES ('58', '行车中遇到执行任务的消防车、救护车、工程救险车时要及时让行。', '4', '2017-03-09 19:47:50', '如图所示，当A车后方有执行任务的救护车驶来时以下做法正确的是什么？', '不必理会，继续行驶', '靠右减速让路', '向左转弯让路', '立即停车让路', 'jsp/common/question/54.png', 'b', '选择题', '其他类');
INSERT INTO `tb_questionbank` VALUES ('59', '此标志为应当鸣喇叭，故选择A', '5', '2017-03-09 19:49:07', '这个标志是何含义？', '应当鸣喇叭', '应当鸣喇叭', '禁止鸣高音喇叭', '禁止鸣低音喇叭', 'jsp/common/question/55.png', 'a', '选择题', '交通标志类');

-- ----------------------------
-- Table structure for tb_questioncollection
-- ----------------------------
DROP TABLE IF EXISTS `tb_questioncollection`;
CREATE TABLE `tb_questioncollection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `QUESTION_ID` int(11) DEFAULT NULL,
  `REMARK` varchar(255) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_questioncollection
-- ----------------------------
INSERT INTO `tb_questioncollection` VALUES ('1', '1', null, '1');
INSERT INTO `tb_questioncollection` VALUES ('3', '2', null, '2');

-- ----------------------------
-- Table structure for tb_wrongquestion
-- ----------------------------
DROP TABLE IF EXISTS `tb_wrongquestion`;
CREATE TABLE `tb_wrongquestion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `AMOUNT` int(11) DEFAULT NULL,
  `QUESTION_ID` int(11) DEFAULT NULL,
  `REMARK` varchar(255) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_wrongquestion
-- ----------------------------
INSERT INTO `tb_wrongquestion` VALUES ('1', '1', '1', null, '1');
INSERT INTO `tb_wrongquestion` VALUES ('2', '2', '2', null, '2');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `create_time` datetime NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `email` varchar(30) NOT NULL,
  `tel` varchar(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('8', 'root', '63a9f0ea7bb98050796b649e85481845', '2017-02-25 16:26:21', '0', '22', '1090909881');
INSERT INTO `user` VALUES ('15', 'test', '098f6bcd4621d373cade4e832627b4f6', '2017-03-01 10:54:32', '0', 'test', 'test');
INSERT INTO `user` VALUES ('17', '1', '698d51a19d8a121ce581499d7b701668', '2017-03-01 14:12:34', '0', '1111', '1111');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_role
-- ----------------------------
