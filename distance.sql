/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : distance

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-08-08 19:26:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `order_num` varchar(50) NOT NULL,
  `productid` int(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` double(10,2) NOT NULL,
  `num` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('1', '79', '2', '夏季透气潮鞋子', '40.00', '1');
INSERT INTO `orders` VALUES ('2', '79', '3', 'UDV2016新款小白鞋', '550.00', '1');

-- ----------------------------
-- Table structure for `shopping`
-- ----------------------------
DROP TABLE IF EXISTS `shopping`;
CREATE TABLE `shopping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 NOT NULL,
  `price` double(10,2) NOT NULL,
  `address` varchar(30) COLLATE gb2312_bin NOT NULL,
  `img_name` varchar(200) COLLATE gb2312_bin NOT NULL,
  UNIQUE KEY `unique_id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=gb2312 COLLATE=gb2312_bin;

-- ----------------------------
-- Records of shopping
-- ----------------------------
INSERT INTO `shopping` VALUES ('1', '夏季透气网鞋', '99.00', '浙江温州', '1');
INSERT INTO `shopping` VALUES ('2', '夏季透气潮鞋子', '40.00', '浙江温州', '2');
INSERT INTO `shopping` VALUES ('3', 'UDV2016新款小白鞋', '550.00', '浙江杭州', '3');
INSERT INTO `shopping` VALUES ('4', '夏天新款男鞋防臭休闲鞋', '188.00', '福建泉州', '4');
INSERT INTO `shopping` VALUES ('5', '金贝勒男士运动鞋', '138.00', '福建泉州', '5');
INSERT INTO `shopping` VALUES ('6', '金贝勒男鞋透气减震鞋', '128.00', '福建莆田', '6');
INSERT INTO `shopping` VALUES ('7', '专柜2016乔丹夏季单网运动鞋', '118.00', '福建泉州', '7');
INSERT INTO `shopping` VALUES ('8', '美国代购男士休闲网面鞋 ', '449.00', '美国', '8');
INSERT INTO `shopping` VALUES ('9', '花花公子男鞋夏季透气休闲网鞋\n', '198.00', '福建厦门', '9');
INSERT INTO `shopping` VALUES ('10', '夏季男鞋透气网鞋\n', '28.00', '上海', '10');
INSERT INTO `shopping` VALUES ('11', '夏季男士网眼休闲鞋', '35.00', '上海', '11');
INSERT INTO `shopping` VALUES ('12', '户外网面系带情侣鞋运动鞋', '69.00', '福建泉州', '12');
INSERT INTO `shopping` VALUES ('13', '男鞋夏季跑步鞋防滑耐磨', '49.00', '福建泉州', '13');
INSERT INTO `shopping` VALUES ('14', '春夏季网面透气运动鞋', '99.00', '福建泉州', '14');
INSERT INTO `shopping` VALUES ('15', '夏季青少年学生板鞋', '55.00', '福建泉州', '15');
INSERT INTO `shopping` VALUES ('16', '秋春白色平底板鞋', '38.00', '上海', '16');
INSERT INTO `shopping` VALUES ('17', '新品SAUCONY圣康尼', '729.00', '江苏南通', '17');
INSERT INTO `shopping` VALUES ('18', '史密斯运动男鞋\n', '119.00', '福建泉州', '18');
INSERT INTO `shopping` VALUES ('19', '静熙男士帆布鞋', '128.00', '福建莆田', '19');
INSERT INTO `shopping` VALUES ('20', '2016新款Camel骆驼运动鞋\n', '199.00', '广东广州', '20');
INSERT INTO `shopping` VALUES ('21', '2016新款网面透气运动鞋', '68.00', '江西宜春', '21');
INSERT INTO `shopping` VALUES ('22', '夏季情侣鞋网鞋跑步鞋子', '79.00', '福建厦门', '22');
INSERT INTO `shopping` VALUES ('23', '特步男鞋荧光绿夜跑鞋', '168.00', '福建莆田', '23');
INSERT INTO `shopping` VALUES ('24', '鸿星尔克16新款跑步鞋', '139.00', '福建泉州', '24');
INSERT INTO `shopping` VALUES ('25', '夏季新款2016烽火学生跑鞋', '53.00', '福建泉州', '25');
INSERT INTO `shopping` VALUES ('26', '乔丹跑步鞋夏季2016新款', '199.00', '福建泉州', '26');
INSERT INTO `shopping` VALUES ('27', '春秋季新款运动鞋', '33.00', '上海', '27');
INSERT INTO `shopping` VALUES ('28', '伯策男鞋运动鞋', '129.00', '福建泉州', '28');
INSERT INTO `shopping` VALUES ('29', '特步男鞋夏季正品网鞋', '169.00', '福建厦门', '29');
INSERT INTO `shopping` VALUES ('30', '鸿星尔克轻便情侣慢跑鞋', '179.00', '福建厦门', '30');
INSERT INTO `shopping` VALUES ('31', '2016年最新款减震跑鞋', '59.00', '上海', '31');
INSERT INTO `shopping` VALUES ('32', '2017最新款式鞋子', '30.00', '广州番禺', '32');

-- ----------------------------
-- Table structure for `shopping_cart`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_cart`;
CREATE TABLE `shopping_cart` (
  `id` int(200) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `productid` int(200) NOT NULL,
  `name` varchar(200) NOT NULL,
  `price` double(100,2) NOT NULL,
  `num` int(100) NOT NULL,
  `sum` double(100,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_cart
-- ----------------------------
INSERT INTO `shopping_cart` VALUES ('5', '123', '2', '夏季透气潮鞋子', '40.00', '1', '40.00');
INSERT INTO `shopping_cart` VALUES ('6', '123', '3', 'UDV2016新款小白鞋', '550.00', '1', '550.00');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` char(32) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `activationCode` char(50) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('639EF1AA5FFC4FC4A316F58B938757E6', '吴子日1', '96e79218965eb72c92a549dd5a330112', '1301027194@qq.com', '1', 'A88FFF97-A2FC-4FD5-B0A6-952E386804FB');
INSERT INTO `user` VALUES ('93F86F4AE58A47598A7402C7AE86A1B2', '吴子海', '96e79218965eb72c92a549dd5a330112', '1301027194@qq.com', '1', 'A1F16DFD-E30A-41FC-862F-655CFE3168CE');
INSERT INTO `user` VALUES ('9B94158F9DE54336AE39CC7EDEA20889', 'wuziri', '96e79218965eb72c92a549dd5a330112', '111@111.com', '1', '9EA9AA8A-BDE5-4D43-8490-7BF0B6B14967');
INSERT INTO `user` VALUES ('ACAE038448094AE6A46C0F1BE0878A72', '吴子日', '96e79218965eb72c92a549dd5a330112', '1301027194@qq.com', '1', '9ED489E6-E9BB-4F0E-BAE5-055ABA9AFD53');
