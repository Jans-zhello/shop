/*
Navicat MySQL Data Transfer

Source Server         : zzz
Source Server Version : 50051
Source Host           : localhost:3306
Source Database       : shop

Target Server Type    : MYSQL
Target Server Version : 50051
File Encoding         : 65001

Date: 2017-06-09 21:23:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for classify
-- ----------------------------
DROP TABLE IF EXISTS `classify`;
CREATE TABLE `classify` (
  `id` int(11) NOT NULL auto_increment,
  `name` char(200) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of classify
-- ----------------------------
INSERT INTO `classify` VALUES ('1', '兰蔻');
INSERT INTO `classify` VALUES ('2', '娇兰');
INSERT INTO `classify` VALUES ('3', '雅诗兰黛');
INSERT INTO `classify` VALUES ('4', '倩碧');

-- ----------------------------
-- Table structure for cosmeticform
-- ----------------------------
DROP TABLE IF EXISTS `cosmeticform`;
CREATE TABLE `cosmeticform` (
  `cosmetic_number` varchar(100) NOT NULL,
  `cosmetic_name` varchar(100) default NULL,
  `cosmetic_made` varchar(100) default NULL,
  `cosmetic_price` float(10,2) default NULL,
  `cosmetic_mess` varchar(100) default NULL,
  `cosmetic_pic` char(100) NOT NULL,
  `id` int(11) NOT NULL auto_increment,
  PRIMARY KEY  (`cosmetic_number`,`cosmetic_pic`),
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of cosmeticform
-- ----------------------------
INSERT INTO `cosmeticform` VALUES ('lan_a1101', '兰蔻清滢柔肤水', '法国Lancome', '229.00', '化妆品净含量:400g', 'lan1.jpg', '1');
INSERT INTO `cosmeticform` VALUES ('lan_a10002', '兰蔻乳液', '法国Lancome', '588.00', '乳液功效:补水保湿', 'lan2.jpg', '1');
INSERT INTO `cosmeticform` VALUES ('EsteeLauder1001', '雅诗兰黛眼霜', 'EsteeLauder', '389.00', '功效:去黑眼圈', 'est1.jpg', '3');
INSERT INTO `cosmeticform` VALUES ('JiaoLan_a1001', '娇兰珍珠肌透白肤色提量乳液', '法国娇兰', '680.00', '功效:美白', 'jiaolan.jpg', '2');
INSERT INTO `cosmeticform` VALUES ('JiaoLan_a1002', '娇兰御庭兰花金兰乳霜', '法国娇兰', '520.00', '功能:护肤美白', 'jiaolan2.jpg', '2');
INSERT INTO `cosmeticform` VALUES ('QianBi_a1001', '倩碧睡眠面膜', '法国倩碧', '500.00', '功效:美白', 'qianbi.jpg', '4');
INSERT INTO `cosmeticform` VALUES ('QianBi_a1002', '倩碧护肤三部曲', '法国倩碧', '800.00', '功效:护肤', 'qianbi2.jpg', '4');
INSERT INTO `cosmeticform` VALUES ('QianBi_a1003', '倩碧水嫩保湿修颜霜', '法国倩碧', '600.00', '功效:美容修颜', 'qianbi3.jpg', '4');

-- ----------------------------
-- Table structure for orderform
-- ----------------------------
DROP TABLE IF EXISTS `orderform`;
CREATE TABLE `orderform` (
  `id` int(10) NOT NULL auto_increment,
  `logname` char(255) default NULL,
  `mess` varchar(255) default NULL,
  `sum` float(10,2) default NULL,
  PRIMARY KEY  (`id`),
  KEY `logname` (`logname`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of orderform
-- ----------------------------
INSERT INTO `orderform` VALUES ('1', 'zzz', '1:(lan_a1101,兰蔻清滢柔肤水,法国Lancome,229.0)', '229.00');
INSERT INTO `orderform` VALUES ('2', 'zzz', '1:(EsteeLauder1001,雅诗兰黛眼霜,EsteeLauder,389.0)', '389.00');
INSERT INTO `orderform` VALUES ('3', 'zbcooper', '1:(QianBi_a1001,倩碧睡眠面膜,法国倩碧,500.0)', '500.00');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `logname` varchar(255) NOT NULL,
  `password` varchar(255) default NULL,
  `phone` varchar(255) default NULL,
  `address` varchar(255) default NULL,
  `realname` varchar(255) default NULL,
  PRIMARY KEY  (`logname`)
) ENGINE=MyISAM DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('zbcooper', 'zbcooper', '18337398326', '????????????', '????°???');
INSERT INTO `user` VALUES ('zzz', 'zzz', '18337398326', '河南省新乡市', '真的爱你');
INSERT INTO `user` VALUES ('zqy', 'zqy', '18337398326', '河南省新乡市', '真的爱你');
