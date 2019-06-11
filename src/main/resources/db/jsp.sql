/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50562
 Source Host           : localhost:3306
 Source Schema         : jsp

 Target Server Type    : MySQL
 Target Server Version : 50562
 File Encoding         : 65001

 Date: 12/06/2019 01:07:15
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET gbk COLLATE gbk_chinese_ci DEFAULT NULL,
  `price` double(10, 2) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = gbk COLLATE = gbk_chinese_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1, '红烧排骨', 25.00);
INSERT INTO `menu` VALUES (2, '红烧肉', 25.00);
INSERT INTO `menu` VALUES (3, '辣椒炒肉', 20.00);
INSERT INTO `menu` VALUES (4, '鸡公煲', 45.00);
INSERT INTO `menu` VALUES (5, '剁椒鱼头', 50.00);
INSERT INTO `menu` VALUES (6, '卤牛肉', 45.00);
INSERT INTO `menu` VALUES (7, '皮蛋瘦肉粥', 3.00);
INSERT INTO `menu` VALUES (8, '煲仔饭', 10.00);
INSERT INTO `menu` VALUES (9, '玉米火腿炒饭', 8.00);

-- ----------------------------
-- Table structure for reserve
-- ----------------------------
DROP TABLE IF EXISTS `reserve`;
CREATE TABLE `reserve`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET gbk COLLATE gbk_chinese_ci DEFAULT NULL,
  `food` varchar(255) CHARACTER SET gbk COLLATE gbk_chinese_ci DEFAULT NULL,
  `sumprice` double(10, 2) DEFAULT NULL,
  `times` varchar(255) CHARACTER SET gbk COLLATE gbk_chinese_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET gbk COLLATE gbk_chinese_ci DEFAULT NULL,
  `YN` varchar(255) CHARACTER SET gbk COLLATE gbk_chinese_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = gbk COLLATE = gbk_chinese_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of reserve
-- ----------------------------
INSERT INTO `reserve` VALUES (5, '1', '1', 1.00, '2019-06-11 01:53:51', '1', '签收');
INSERT INTO `reserve` VALUES (6, '123456', '红烧肉,辣椒炒肉,', 45.00, '2019-06-12 00:06:42', '3期公寓', '已签收');
INSERT INTO `reserve` VALUES (7, '123456', '红烧排骨,红烧肉,辣椒炒肉,', 70.00, '2019-06-12 00:41:24', '3期公寓', '已签收');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'root', 'root', '01');
INSERT INTO `user` VALUES (3, 'test', 'test', '02');
INSERT INTO `user` VALUES (11, '111', '111', '111');
INSERT INTO `user` VALUES (12, '123456', '123456', '杨睿');

SET FOREIGN_KEY_CHECKS = 1;
