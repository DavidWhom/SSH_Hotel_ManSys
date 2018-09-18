/*
Navicat MySQL Data Transfer

Source Server         : 118.24.111.143
Source Server Version : 50626
Source Host           : 118.24.111.143:3306
Source Database       : ssh_hotel

Target Server Type    : MYSQL
Target Server Version : 50626
File Encoding         : 65001

Date: 2018-08-02 21:45:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ADMIN
-- ----------------------------
DROP TABLE IF EXISTS `ADMIN`;
CREATE TABLE `ADMIN` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `STYLE_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USABLE` int(11) DEFAULT NULL,
  `PASSWORD` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IMGPATH` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9540 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of ADMIN
-- ----------------------------
INSERT INTO `ADMIN` VALUES ('1111', 'Keri', '凯丽', '1', '111', 'hjc.jpg');
INSERT INTO `ADMIN` VALUES ('9527', 'Ian', '伊恩', '1', 'test', 'yt.png');
INSERT INTO `ADMIN` VALUES ('9528', 'AAA', 'aaa', '0', '111', 'hjc.jpg');
INSERT INTO `ADMIN` VALUES ('9529', 'B', 'b', '0', '0', 'yt.png');
INSERT INTO `ADMIN` VALUES ('9530', 'C', 'a', '0', '0', 'yt.png');
INSERT INTO `ADMIN` VALUES ('9531', 'D', 'c', '0', '0', 'yt.png');
INSERT INTO `ADMIN` VALUES ('9532', 'E', 'd', '0', '0', 'yt.png');
INSERT INTO `ADMIN` VALUES ('9533', 'F', 'f', '0', '0', 'yt.png');
INSERT INTO `ADMIN` VALUES ('9534', 'G', 'a', '0', '0', 'yt.png');
INSERT INTO `ADMIN` VALUES ('9535', 'H', 'e', '0', '0', 'yt.png');
INSERT INTO `ADMIN` VALUES ('9536', 'I', 'g', '0', '0', 'hjc.jpg');
INSERT INTO `ADMIN` VALUES ('9537', 'J', 'h', '0', '0', 'yt.png');
INSERT INTO `ADMIN` VALUES ('9538', 'K', 'j', '0', '0', 'yt.png');
INSERT INTO `ADMIN` VALUES ('9539', 'L', 'i', '0', '0', 'hjc.jpg');

-- ----------------------------
-- Table structure for RECORD
-- ----------------------------
DROP TABLE IF EXISTS `RECORD`;
CREATE TABLE `RECORD` (
  `ORDER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `PRICE` decimal(19,2) DEFAULT NULL,
  `ARRIVAL_TIME` datetime DEFAULT NULL,
  `DEPARTURE_TIME` datetime DEFAULT NULL,
  `REAL_TIME` datetime DEFAULT NULL,
  `STATES` int(11) DEFAULT NULL,
  `ROOM_ID` int(11) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ORDER_ID`),
  KEY `FK_aiaoo09m2ycl0ex758drbike` (`ROOM_ID`),
  KEY `FK_5nuql9ua44rpqe98ajjmp10vt` (`USER_ID`),
  CONSTRAINT `FK_5nuql9ua44rpqe98ajjmp10vt` FOREIGN KEY (`USER_ID`) REFERENCES `USER` (`USER_ID`),
  CONSTRAINT `FK_aiaoo09m2ycl0ex758drbike` FOREIGN KEY (`ROOM_ID`) REFERENCES `ROOM` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of RECORD
-- ----------------------------
INSERT INTO `RECORD` VALUES ('15', '99.00', '2018-07-28 21:37:14', '2018-07-29 09:37:10', '2018-07-29 00:23:54', '1', '10000', '10000010');
INSERT INTO `RECORD` VALUES ('16', '99.00', '2018-07-28 21:41:15', '2018-07-30 09:41:11', '2018-07-29 00:36:17', '1', '10012', '10000011');
INSERT INTO `RECORD` VALUES ('17', '599.00', '2018-07-28 21:43:06', '2018-07-30 09:43:04', '2018-07-29 00:38:03', '1', '10009', '10000006');
INSERT INTO `RECORD` VALUES ('18', '99.00', '2018-07-28 21:46:01', '2018-07-31 09:45:58', '2018-07-29 00:40:35', '1', '10001', '10000000');
INSERT INTO `RECORD` VALUES ('20', '599.00', '2018-07-29 00:39:26', '2018-07-31 00:39:23', '2018-07-29 23:39:21', '1', '10006', '10000010');
INSERT INTO `RECORD` VALUES ('21', '99.00', '2018-07-29 00:49:37', '2018-08-03 00:49:32', null, '0', '10001', '10000009');
INSERT INTO `RECORD` VALUES ('23', '299.00', '2018-07-29 23:14:18', '2018-07-30 11:14:15', null, '0', '10004', '10000011');
INSERT INTO `RECORD` VALUES ('24', '388.00', '2018-07-30 01:21:05', '2018-07-31 01:21:02', '2018-07-30 01:24:44', '1', '10010', '10000010');
INSERT INTO `RECORD` VALUES ('26', '299.00', '2018-07-30 17:44:33', '2018-07-31 05:44:30', '2018-07-30 18:04:20', '1', '10004', '10000005');
INSERT INTO `RECORD` VALUES ('27', '99.00', '2018-07-30 17:45:18', '2018-07-31 05:45:12', '2018-07-30 17:46:38', '1', '10000', '10000010');
INSERT INTO `RECORD` VALUES ('28', '78.00', '2018-08-01 14:54:59', '2018-08-03 02:54:48', '2018-08-01 17:17:45', '1', '10014', '10000005');
INSERT INTO `RECORD` VALUES ('29', '388.00', '2018-08-01 18:38:43', '2018-08-04 18:38:37', null, '0', '10010', '10000010');
INSERT INTO `RECORD` VALUES ('30', '199.00', '2018-08-01 18:44:33', '2018-08-02 06:44:27', '2018-08-01 18:46:22', '1', '10002', '10000004');

-- ----------------------------
-- Table structure for ROOM
-- ----------------------------
DROP TABLE IF EXISTS `ROOM`;
CREATE TABLE `ROOM` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ROOM_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `STATES` int(11) DEFAULT NULL,
  `ROOMTYPE_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_14ajxeaykg848t2okj0mfndjn` (`ROOMTYPE_ID`),
  CONSTRAINT `FK_14ajxeaykg848t2okj0mfndjn` FOREIGN KEY (`ROOMTYPE_ID`) REFERENCES `ROOMTYPE` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10015 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of ROOM
-- ----------------------------
INSERT INTO `ROOM` VALUES ('10000', 'A1001', '0', '1000');
INSERT INTO `ROOM` VALUES ('10001', 'A1002', '1', '1000');
INSERT INTO `ROOM` VALUES ('10002', 'A1003', '0', '1001');
INSERT INTO `ROOM` VALUES ('10003', 'B2001', '0', '1002');
INSERT INTO `ROOM` VALUES ('10004', 'B2002', '1', '1003');
INSERT INTO `ROOM` VALUES ('10005', 'B3001', '0', '1004');
INSERT INTO `ROOM` VALUES ('10006', 'B3002', '0', '1005');
INSERT INTO `ROOM` VALUES ('10007', 'B3003', '0', '1005');
INSERT INTO `ROOM` VALUES ('10008', 'C4002', '0', '1002');
INSERT INTO `ROOM` VALUES ('10009', 'C5003', '0', '1005');
INSERT INTO `ROOM` VALUES ('10010', 'A6001', '1', '1004');
INSERT INTO `ROOM` VALUES ('10012', 'C7000', '0', '1000');
INSERT INTO `ROOM` VALUES ('10013', 'S1001', '0', '1005');
INSERT INTO `ROOM` VALUES ('10014', 'S7000', '0', '1011');

-- ----------------------------
-- Table structure for ROOMTYPE
-- ----------------------------
DROP TABLE IF EXISTS `ROOMTYPE`;
CREATE TABLE `ROOMTYPE` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ROOMTYPE_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PEOPLES` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PRICE` decimal(19,2) DEFAULT NULL,
  `NET_INFO` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BEF_INFO` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PARK_INFO` tinyint(1) DEFAULT NULL,
  `OTHER_INFO` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ROOM_IMG` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TIMES` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1012 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of ROOMTYPE
-- ----------------------------
INSERT INTO `ROOMTYPE` VALUES ('1000', '雅致温馨大床房', '单人间', '99.00', '无线/宽带', '无早', '0', '酒店提供免费自助洗衣服务，独立自助洗衣房供客人使用，详情请到店咨询前台！大床：180cm*200cm，安静的只想就此躺下，或品茶一杯，或临窗遐想，或看看鹭岛都市的天空，告诉自己，我还未远走。如若，欣赏每一幅画，每一景，每一处，它们不语，却能读懂你的美丽。酒店提供住店客人免费客房上网服务，轻松上网，全程无忧。', 'nw_000dxexS.jpg;nw_000dxeyj.jpg;nw_0003utWp.jpg;nw_0004Vx4c.jpg;nw_0004VzBD.jpg;nw_0004VzBE.jpg;nw_0004VzBH.jpg', '3244');
INSERT INTO `ROOMTYPE` VALUES ('1001', '雅致温馨双床房', '双人间', '199.00', '无线/宽带', '无早', '0', '酒店提供免费自助洗衣服务，独立自助洗衣房供客人使用，详情请到店咨询前台！大床：180cm*200cm，安静的只想就此躺下，或品茶一杯，或临窗遐想，或看看鹭岛都市的天空，告诉自己，我还未远走。如若，欣赏每一幅画，每一景，每一处，它们不语，却能读懂你的美丽。酒店提供住店客人免费客房上网服务，轻松上网，全程无忧。', 'nw_000dxexS.jpg;nw_000dxeyj.jpg;nw_0003utWp.jpg;nw_0004Vx4c.jpg;nw_0004VzBD.jpg;nw_0004VzBE.jpg;nw_0004VzBH.jpg', '2443');
INSERT INTO `ROOMTYPE` VALUES ('1002', '商务舒适大床房', '单人间', '199.00', '无线/宽带', '双早', '0', '酒店提供免费自助洗衣服务，独立自助洗衣房供客人使用，详情请到店咨询前台！大床：180cm*200cm，安静的只想就此躺下，或品茶一杯，或临窗遐想，或看看鹭岛都市的天空，告诉自己，我还未远走。如若，欣赏每一幅画，每一景，每一处，它们不语，却能读懂你的美丽。酒店提供住店客人免费客房上网服务，轻松上网，全程无忧。', 'nw_000dxexS.jpg;nw_000dxeyj.jpg;nw_0003utWp.jpg;nw_0004Vx4c.jpg;nw_0004VzBD.jpg;nw_0004VzBE.jpg;nw_0004VzBH.jpg', '2434');
INSERT INTO `ROOMTYPE` VALUES ('1003', '商务舒适双床房', '双人间', '299.00', '无线/宽带', '双早', '0', '酒店提供', 'nw_000dxeyj.jpg;nw_0004Vx4c.jpg;nw_0004VzBE.jpg;nw_0004Vx4c.jpg;nw_0004VzBH.jpg', '3425');
INSERT INTO `ROOMTYPE` VALUES ('1004', '豪华屏风大床房', '单人间', '388.00', '无线/宽带', '双早', '0', '酒店提供免费自助洗衣服务，独立自助洗衣房供客人使用，详情请到店咨询前台！大床：180cm*200cm，安静的只想就此躺下，或品茶一杯，或临窗遐想，或看看鹭岛都市的天空，告诉自己，我还未远走。如若，欣赏每一幅画，每一景，每一处，它们不语，却能读懂你的美丽。酒店提供住店客人免费客1房上网服务，轻松上网，全程无忧。', 'nw_000dxexS.jpg;nw_000dxeyj.jpg;nw_0003utWp.jpg;nw_0004Vx4c.jpg;nw_0004VzBD.jpg;nw_0004VzBE.jpg;nw_0004VzBH.jpg', '4543');
INSERT INTO `ROOMTYPE` VALUES ('1005', '行政套房', '双人间', '599.00', '无线/宽带', '双早', '1', '酒店提供免费自助洗衣服务，独立自助洗衣房供客人使用，详情请到店咨询前台！大床：180cm*200cm，安静的只想就此躺下，或品茶一杯，或临窗遐想，或看看鹭岛都市的天空，告诉自己，我还未远走。如若，欣赏每一幅画，每一景，每一处，它们不语，却能读懂你的美丽。酒店提供住店客人免费客房上网服务，轻松上网，全程无忧。', 'nw_000dxexS.jpg;nw_000dxeyj.jpg;nw_0003utWp.jpg;nw_0004Vx4c.jpg;nw_0004VzBD.jpg;nw_0004VzBE.jpg;nw_0004VzBH.jpg', '2441');
INSERT INTO `ROOMTYPE` VALUES ('1011', '青春舒适标间', '单人间', '78.00', '无线/宽带', '无早', '0', '', '1726371723.jpg;QQ图片20180306120636.jpg', null);

-- ----------------------------
-- Table structure for TEST
-- ----------------------------
DROP TABLE IF EXISTS `TEST`;
CREATE TABLE `TEST` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IP_ADDRESS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LOGIN_TIME` datetime DEFAULT NULL,
  `HOSTNAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PORT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of TEST
-- ----------------------------
INSERT INTO `TEST` VALUES ('1', '0:0:0:0:0:0:0:1', '2018-08-02 17:41:38', '0:0:0:0:0:0:0:1', '55031');
INSERT INTO `TEST` VALUES ('2', '127.0.0.1', '2018-08-02 17:50:06', '127.0.0.1', '44380');
INSERT INTO `TEST` VALUES ('3', '127.0.0.1', '2018-08-02 19:24:52', '127.0.0.1', '46812');
INSERT INTO `TEST` VALUES ('4', '127.0.0.1', '2018-08-02 20:27:41', '127.0.0.1', '48389');
INSERT INTO `TEST` VALUES ('5', '127.0.0.1', '2018-08-02 20:52:46', '127.0.0.1', '49048');

-- ----------------------------
-- Table structure for USER
-- ----------------------------
DROP TABLE IF EXISTS `USER`;
CREATE TABLE `USER` (
  `USER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `GENDER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TEL_NUM` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMAIL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ID_CARD` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ADDRESS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PASSWORD` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HEAD_IMG` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `STYLE_IMG` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ISVIP` tinyint(1) DEFAULT NULL,
  `USABLE` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10000030 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of USER
-- ----------------------------
INSERT INTO `USER` VALUES ('10000000', '余周周', '女', '1528046978', '798801372@qq.com', '352415462518472615', '江苏常州', '1111', 'jc.jpg', 'hjc.jpg', '1', '1');
INSERT INTO `USER` VALUES ('10000001', '林杨', '男', '1801673687', '851792199@qq.com', '350527162519271827', '福建泉州', '111', 'xq.jpg', 'hyt.jpg', '1', '0');
INSERT INTO `USER` VALUES ('10000002', '马云', '女', '1528046978', '798801372@qq.com', '352415462518472615', '浙江杭州', '111', 'yt.jpg', 'hjc.jpg', '0', '1');
INSERT INTO `USER` VALUES ('10000003', '王健林', '男', '1528046978', '598801372@qq.com', '352415462518472615', '浙江杭州', '111', 'xq.jpg', 'hyt.jpg', '0', '1');
INSERT INTO `USER` VALUES ('10000004', '胡佳传', '男', '1528046978', '298801372@qq.com', '352415462518472615', '福建泉州', '111', 'jc.jpg', 'hjc.jpg', '0', '1');
INSERT INTO `USER` VALUES ('10000005', '马化腾', '男', '1528046978', '198801372@qq.com', '352415462518472615', '浙江杭州', '111', 'xq.jpg', 'hyt.jpg', '0', '1');
INSERT INTO `USER` VALUES ('10000006', '耿耿', '女', '1528046978', '998801372@qq.com', '352415462518472615', '福建泉州', '111', 'jc.jpg', 'hjc.jpg', '0', '1');
INSERT INTO `USER` VALUES ('10000007', '王泽林', '男', '1827364512', '9999291232@163.com', '214254654342312312', '福建莆田', '111', 'gs.jpg', 'hyt.jpg', '0', '0');
INSERT INTO `USER` VALUES ('10000008', '董明珠', '女', '1528046978', '198801372@qq.com', '352415462518472615', '浙江杭州', '111', 'xq.jpg', 'hyt.jpg', '0', '1');
INSERT INTO `USER` VALUES ('10000009', '余淮', '男', '1528046978', '998801372@qq.com', '352415462518472615', '福建泉州', '111', 'xq.jpg', 'hjc.jpg', '0', '1');
INSERT INTO `USER` VALUES ('10000010', '胡歌', '男', '1528046978', '998801372@qq.com', '352415462518472615', '福建泉州', '111', 'xq.jpg', 'hjc.jpg', '0', '1');
INSERT INTO `USER` VALUES ('10000011', '王俊凯', '女', '111111111', '8888@huya.com', '2132342342342342', '福建三明', '1111', 'jc.jpg', 'hjc.jpg', '1', '1');
INSERT INTO `USER` VALUES ('10000015', '胡佳传', '男', '1726731728', 'cc@123.com', '2132342342342342', '福建三明', '1111', 'yt.jpg', 'user-medium.png', '1', '0');
INSERT INTO `USER` VALUES ('10000017', '胡雨欣', '男', '1726731728', '997740098@qq.com', '2132342342342342', '福建三明', '1111', 'QQ图片20180306120636.jpg', 'QQ图片20180306120636.jpg', '0', '1');
INSERT INTO `USER` VALUES ('10000018', '吴玉琴', '男', '23056709', '23056709@hu.com', '2138719278', '福建福州', '283742', 'sy.jpg', 'hjc.jpg', '0', '1');
INSERT INTO `USER` VALUES ('10000019', '王思聪', '男', '1726731728', '997740098@qq.com', '812638716283678162', '福建福州', '1111', 'jc.jpg', 'hjc.jpg', '0', '1');
INSERT INTO `USER` VALUES ('10000020', '胡佳传', '男', '1726731728', 'cc@123.com', '2132342342342342', '福建泉州', '1111', 'jc.jpg', 'hjc.jpg', '0', '1');
INSERT INTO `USER` VALUES ('10000021', '李白', '男', '231231231', '997740098@qq.com', '812638716283678162', '江苏盐城', '222', 'jc.jpg', 'hjc.jpg', '0', '1');
INSERT INTO `USER` VALUES ('10000022', '上官康熙', '男', '223902930', '12882@wenquan.com', '872186387123', '福建安溪', '4545', 'yt.jpg', 'user2.png', '0', '1');
INSERT INTO `USER` VALUES ('10000023', '王安石', '男', '4444444', '32423468@162.com', '98792376398472', '陕西西安', '2222', 'xq.jpg', 'hjc.jpg', '0', '1');
INSERT INTO `USER` VALUES ('10000024', '韩愈', '女', '1727272222', '17627163@qq.com', '812836182631', '福建永安', '1111', 'QQ图片20180306120636.jpg', 'user-medium.png', '1', '0');
INSERT INTO `USER` VALUES ('10000025', '曾巩', '男', '1232312312', '15280469787', '812638716283678162', '福建三明1', '1111', 'QQ图片20180306120636.jpg', 'user-medium.png', '0', '1');
INSERT INTO `USER` VALUES ('10000026', '王建国', '女', '1726731728', '15280469787@193.com', '812638716283678162', '福建福州', '10000026', 'default.jpg', 'default.jpeg', '1', '1');
INSERT INTO `USER` VALUES ('10000027', '郁可唯', '女', '1232312312', '997740098@qq.com', '812638716283678162', '湖北武汉', '10000027', 'default.jpg', 'default.jpeg', '0', '1');
INSERT INTO `USER` VALUES ('10000028', '张靓颖', '男', '1232312312', '15280469787@193.com', '812638716283678162', '江苏盐城', '10000028', 'yt.jpg', 'user-medium.png', '1', '1');
