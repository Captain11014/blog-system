/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 80020
 Source Host           : localhost:3306
 Source Schema         : blog-system

 Target Server Type    : MySQL
 Target Server Version : 80020
 File Encoding         : 65001

 Date: 27/06/2023 09:03:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '文章内容',
  `user_id` bigint NULL DEFAULT NULL COMMENT '作者用户id',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '审核状态（0代表审核中 1代表审核通过 2代表审核未通过）',
  `audit_time` datetime NULL DEFAULT NULL COMMENT '审核时间',
  `audit_user_id` bigint NULL DEFAULT NULL COMMENT '审核人id',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者（作者）',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改者(审核人)',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文章博客表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES (1, '双方都', '<p class=\"ql-align-center\">沙发上</p><p class=\"ql-align-center\">fgd</p><p class=\"ql-align-center\"><br></p><p class=\"ql-align-center\">回归结果</p><p class=\"ql-align-center\"><br></p><p class=\"ql-align-center\"><img src=\"/dev-api/profile/2023/06/07/0c7b1183-3a24-48e3-bd40-f34be6d6511a2002628471.jpeg\" width=\"234\"></p><p class=\"ql-align-center\">sfjsd</p><p class=\"ql-align-center\"><br></p><p class=\"ql-align-center\"><br></p><p class=\"ql-align-center\"><br></p><p class=\"ql-align-center\"><strong class=\"ql-size-huge\">第三方发生</strong></p>', 1, '1', '2023-06-07 21:09:53', 2, '0', '张三', '2023-06-06 08:30:48', '张三（管理员）', '2023-06-10 09:15:22', '电饭锅');
INSERT INTO `article` VALUES (2, '震惊！', '<p>发生什么事了！</p><p>发生什么事了！</p><p>发生什么事了！发生什么事了！</p><p>发生什么事了！</p><p>发生什么事了！</p><p>发生什么事了！ccccccc</p><p>发生什么事了！</p><p>发生什么事了！</p><p>发生什么事了！发生什么事了！</p><p>发生什么事了！</p><p>发生什么事了！</p><p>发生什么事了！</p><p>发生什么事了！</p><p>发生什么事了！</p><p>发生什么事了！</p><p>发生什么事了！<img src=\"/dev-api/profile/2023/06/14/05c7df39-97ab-4521-900e-e24a9381000a微信图片_20220714145946.jpg\" width=\"385\"></p>', 7, '1', '2023-06-15 14:36:32', 1, '0', NULL, '2023-06-14 14:12:26', NULL, '2023-06-19 15:31:51', NULL);
INSERT INTO `article` VALUES (3, '发生什么事了！', '<p>滴滴！</p><p>滴滴！</p><p>滴滴！</p><p>滴滴！滴滴！</p><p>滴滴！滴滴！</p><p>滴滴！</p><p>滴滴！</p><p>滴滴！</p><p>滴滴！</p><p>滴滴！</p><p>滴滴！</p><p>滴滴！</p><p>滴滴！</p><p>滴滴！</p><p>滴滴！</p><p>滴滴！</p><p>滴滴！滴滴！</p><p>滴滴！滴滴！</p><p>滴滴！滴滴！</p><p>滴滴！</p><p>滴滴！</p>', 6, '1', '2023-06-15 21:41:14', 1, '0', NULL, '2023-06-15 13:40:58', NULL, '2023-06-15 13:41:14', NULL);
INSERT INTO `article` VALUES (4, '芜湖', '<p>复工后</p><p>的方法d dd</p><p>d </p><p>d df打分</p>', 7, '1', '2023-06-17 10:28:45', 1, '0', NULL, '2023-06-17 02:27:05', NULL, '2023-06-17 02:28:46', NULL);
INSERT INTO `article` VALUES (5, '牛啊！', '<p>牛牛牛</p>', 6, '0', '2023-06-19 15:23:54', 2, '0', NULL, '2023-06-18 11:54:13', NULL, '2023-06-19 15:23:54', NULL);
INSERT INTO `article` VALUES (6, 'fg', NULL, 7, '0', NULL, NULL, '2', NULL, '2023-06-25 12:28:06', NULL, NULL, NULL);
INSERT INTO `article` VALUES (7, 'dfg', '<p>dfgd</p>', 7, '0', NULL, NULL, '2', NULL, '2023-06-25 12:28:19', NULL, NULL, NULL);
INSERT INTO `article` VALUES (8, '测试', '<p class=\"ql-align-center\"><img src=\"/dev-api/profile/2023/06/26/520c1bd9-9059-4131-a3c6-f82446a99f77微信图片_20220714145937.jpg\" width=\"310\"></p><p class=\"ql-align-center\"><span class=\"ql-size-huge\" style=\"color: rgb(230, 0, 0);\">是的是的</span></p>', 7, '0', '2023-06-26 20:32:46', 1, '2', NULL, '2023-06-26 20:08:11', NULL, '2023-06-26 20:33:32', '请修改dshkjb sjdhfksdsdfsnfdj');
INSERT INTO `article` VALUES (9, '反反复复', '<p class=\"ql-align-center\">发发发发发</p>', 7, '0', NULL, NULL, '2', NULL, '2023-06-26 20:14:56', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for browsing_history
-- ----------------------------
DROP TABLE IF EXISTS `browsing_history`;
CREATE TABLE `browsing_history`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint NULL DEFAULT NULL COMMENT '用户id',
  `article_id` bigint NULL DEFAULT NULL COMMENT '文章id',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '0代表存在 2代表删除',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间(浏览时间)',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 396 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '浏览记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of browsing_history
-- ----------------------------
INSERT INTO `browsing_history` VALUES (3, 7, 3, '0', NULL, '2023-06-17 10:31:21', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (4, 7, 3, '0', NULL, '2023-06-17 10:36:36', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (5, 7, 3, '0', NULL, '2023-06-17 11:38:41', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (6, 7, 4, '0', NULL, '2023-06-17 14:03:45', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (7, 7, 3, '0', NULL, '2023-06-17 14:04:31', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (8, 7, 4, '0', NULL, '2023-06-17 14:05:13', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (9, 7, 3, '0', NULL, '2023-06-17 14:05:31', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (10, 7, 1, '0', NULL, '2023-06-17 14:05:48', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (11, 7, 2, '0', NULL, '2023-06-17 14:07:11', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (12, 6, 2, '0', NULL, '2023-06-17 20:06:50', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (13, 6, 4, '0', NULL, '2023-06-18 22:07:03', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (14, 6, 4, '0', NULL, '2023-06-18 22:14:14', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (15, 6, 4, '0', NULL, '2023-06-18 22:14:15', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (16, 6, 4, '0', NULL, '2023-06-18 22:14:26', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (17, 6, 4, '0', NULL, '2023-06-18 22:14:56', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (18, 6, 4, '0', NULL, '2023-06-18 22:14:57', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (19, 6, 4, '0', NULL, '2023-06-18 22:16:56', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (20, 6, 4, '0', NULL, '2023-06-18 22:17:15', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (21, 6, 4, '0', NULL, '2023-06-18 22:17:50', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (22, 6, 4, '0', NULL, '2023-06-18 22:17:52', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (23, 6, 4, '0', NULL, '2023-06-18 22:18:10', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (24, 6, 4, '0', NULL, '2023-06-18 22:20:04', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (25, 6, 4, '0', NULL, '2023-06-18 22:20:17', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (26, 6, 4, '0', NULL, '2023-06-18 22:20:28', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (27, 6, 4, '0', NULL, '2023-06-18 22:34:46', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (28, 6, 4, '0', NULL, '2023-06-18 22:35:26', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (29, 6, 4, '0', NULL, '2023-06-18 22:35:45', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (30, 6, 4, '0', NULL, '2023-06-18 22:37:03', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (31, 6, 4, '0', NULL, '2023-06-18 22:37:14', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (32, 6, 4, '0', NULL, '2023-06-18 22:37:25', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (33, 6, NULL, '0', NULL, '2023-06-18 22:37:56', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (34, 6, 4, '0', NULL, '2023-06-18 22:37:59', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (35, 6, 4, '0', NULL, '2023-06-18 22:38:05', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (36, 6, 4, '0', NULL, '2023-06-18 22:39:22', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (37, 6, 4, '0', NULL, '2023-06-18 22:39:36', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (38, 6, 4, '0', NULL, '2023-06-18 22:40:22', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (39, 6, 4, '0', NULL, '2023-06-18 22:40:28', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (40, 6, 4, '0', NULL, '2023-06-18 22:41:12', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (41, 6, 4, '0', NULL, '2023-06-18 22:41:26', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (42, 6, 4, '0', NULL, '2023-06-18 22:41:40', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (43, 6, 4, '0', NULL, '2023-06-18 22:42:09', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (44, 6, 4, '0', NULL, '2023-06-18 22:44:14', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (45, 6, 4, '0', NULL, '2023-06-18 22:45:20', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (46, 6, 4, '0', NULL, '2023-06-18 22:45:26', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (47, 6, 4, '0', NULL, '2023-06-18 22:47:34', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (48, 6, 4, '0', NULL, '2023-06-18 22:47:35', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (49, 6, 4, '0', NULL, '2023-06-18 22:50:52', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (50, 6, 4, '0', NULL, '2023-06-18 22:51:13', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (51, 6, 4, '0', NULL, '2023-06-18 22:51:27', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (52, 6, 4, '0', NULL, '2023-06-18 22:51:32', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (53, 6, 4, '0', NULL, '2023-06-18 22:52:20', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (54, 6, 4, '0', NULL, '2023-06-18 22:52:27', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (55, 6, 4, '0', NULL, '2023-06-18 22:53:34', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (56, 6, 4, '0', NULL, '2023-06-18 22:55:50', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (57, 6, 4, '0', NULL, '2023-06-18 22:55:56', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (58, 6, 4, '0', NULL, '2023-06-18 22:58:01', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (59, 6, 4, '0', NULL, '2023-06-18 22:59:22', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (60, 6, 4, '0', NULL, '2023-06-18 22:59:31', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (61, 6, 4, '0', NULL, '2023-06-18 23:01:31', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (62, 6, 4, '0', NULL, '2023-06-18 23:01:35', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (63, 6, 4, '0', NULL, '2023-06-18 23:03:09', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (64, 6, 4, '0', NULL, '2023-06-18 23:03:49', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (65, 6, 4, '0', NULL, '2023-06-18 23:04:34', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (66, 6, 4, '0', NULL, '2023-06-18 23:04:43', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (67, 6, 4, '0', NULL, '2023-06-18 23:04:43', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (68, 6, 4, '0', NULL, '2023-06-18 23:05:34', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (69, 6, 4, '0', NULL, '2023-06-18 23:06:15', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (70, 6, 4, '0', NULL, '2023-06-18 23:08:19', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (71, 6, 4, '0', NULL, '2023-06-18 23:09:35', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (72, 6, 4, '0', NULL, '2023-06-18 23:13:02', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (73, 6, 4, '0', NULL, '2023-06-18 23:13:05', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (74, 6, 4, '0', NULL, '2023-06-18 23:13:08', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (75, 6, 4, '0', NULL, '2023-06-18 23:13:10', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (76, 6, 4, '0', NULL, '2023-06-18 23:13:11', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (77, 6, 4, '0', NULL, '2023-06-18 23:13:23', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (78, 6, 4, '0', NULL, '2023-06-18 23:13:25', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (79, 6, 4, '0', NULL, '2023-06-18 23:13:57', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (80, 6, 4, '0', NULL, '2023-06-18 23:14:04', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (81, 6, 4, '0', NULL, '2023-06-18 23:14:13', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (82, 6, 4, '0', NULL, '2023-06-18 23:14:13', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (83, 6, 4, '0', NULL, '2023-06-18 23:15:41', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (84, 6, 4, '0', NULL, '2023-06-18 23:16:30', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (85, 6, 4, '0', NULL, '2023-06-18 23:17:24', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (86, 6, 4, '0', NULL, '2023-06-18 23:17:57', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (87, 6, 4, '0', NULL, '2023-06-18 23:18:04', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (88, 6, 4, '0', NULL, '2023-06-18 23:18:25', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (89, 6, 4, '0', NULL, '2023-06-18 23:18:42', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (90, 6, 4, '0', NULL, '2023-06-18 23:19:31', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (91, 6, 4, '0', NULL, '2023-06-18 23:21:32', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (92, 6, 4, '0', NULL, '2023-06-18 23:22:38', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (93, 6, 4, '0', NULL, '2023-06-18 23:24:01', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (94, 6, 4, '0', NULL, '2023-06-18 23:24:10', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (95, 6, 4, '0', NULL, '2023-06-18 23:24:13', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (96, 6, 4, '0', NULL, '2023-06-18 23:24:20', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (97, 6, 4, '0', NULL, '2023-06-18 23:24:27', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (98, 6, 4, '0', NULL, '2023-06-18 23:24:52', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (99, 6, 4, '0', NULL, '2023-06-18 23:25:03', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (100, 6, 4, '0', NULL, '2023-06-18 23:28:40', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (101, 6, 4, '0', NULL, '2023-06-18 23:28:41', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (102, 6, 4, '0', NULL, '2023-06-18 23:28:50', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (103, 6, 4, '0', NULL, '2023-06-18 23:28:56', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (104, 6, 4, '0', NULL, '2023-06-18 23:28:58', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (105, 6, 4, '0', NULL, '2023-06-18 23:29:58', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (106, 6, 4, '0', NULL, '2023-06-18 23:30:33', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (107, 6, 4, '0', NULL, '2023-06-18 23:30:37', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (108, 6, 4, '0', NULL, '2023-06-18 23:30:50', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (109, 6, 4, '0', NULL, '2023-06-18 23:31:00', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (110, 6, 4, '0', NULL, '2023-06-18 23:32:21', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (111, 6, 4, '0', NULL, '2023-06-18 23:32:37', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (112, 6, 4, '0', NULL, '2023-06-18 23:32:53', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (113, 6, 4, '0', NULL, '2023-06-18 23:34:14', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (114, 6, 4, '0', NULL, '2023-06-18 23:34:19', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (115, 6, 4, '0', NULL, '2023-06-18 23:34:27', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (116, 6, 4, '0', NULL, '2023-06-18 23:34:44', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (117, 6, 4, '0', NULL, '2023-06-18 23:35:27', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (118, 6, 4, '0', NULL, '2023-06-18 23:35:36', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (119, 6, 4, '0', NULL, '2023-06-18 23:35:45', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (120, 6, 4, '0', NULL, '2023-06-18 23:35:58', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (121, 6, 4, '0', NULL, '2023-06-18 23:36:45', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (122, 6, 4, '0', NULL, '2023-06-18 23:36:50', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (123, 6, 4, '0', NULL, '2023-06-18 23:36:53', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (124, 6, 4, '0', NULL, '2023-06-18 23:37:01', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (125, 6, 4, '0', NULL, '2023-06-18 23:39:12', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (126, 6, 4, '0', NULL, '2023-06-18 23:39:51', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (127, 6, 4, '0', NULL, '2023-06-18 23:56:13', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (128, 6, 4, '0', NULL, '2023-06-18 23:56:20', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (129, 6, 4, '0', NULL, '2023-06-18 23:56:31', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (130, 6, 4, '0', NULL, '2023-06-18 23:56:32', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (131, 6, 4, '0', NULL, '2023-06-18 23:57:01', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (132, 6, 4, '0', NULL, '2023-06-18 23:57:04', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (133, 6, 4, '0', NULL, '2023-06-18 23:57:16', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (134, 6, 4, '0', NULL, '2023-06-18 23:57:23', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (135, 6, 4, '0', NULL, '2023-06-18 23:57:53', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (136, 6, 4, '0', NULL, '2023-06-18 23:57:59', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (137, 6, 4, '0', NULL, '2023-06-18 23:58:06', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (138, 6, 4, '0', NULL, '2023-06-18 23:58:52', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (139, 6, NULL, '0', NULL, '2023-06-19 00:00:33', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (140, 6, 4, '0', NULL, '2023-06-19 00:00:34', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (141, 6, 4, '0', NULL, '2023-06-19 00:00:45', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (142, 6, 4, '0', NULL, '2023-06-19 00:00:48', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (143, 6, 4, '0', NULL, '2023-06-19 00:01:01', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (144, 6, 4, '0', NULL, '2023-06-19 00:01:09', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (145, 6, 4, '0', NULL, '2023-06-19 00:01:10', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (146, 6, 4, '0', NULL, '2023-06-19 00:02:04', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (147, 6, 4, '0', NULL, '2023-06-19 00:04:01', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (148, 6, 4, '0', NULL, '2023-06-19 00:04:04', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (149, 7, 4, '0', NULL, '2023-06-19 00:07:44', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (150, 7, 4, '0', NULL, '2023-06-19 00:09:50', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (151, 7, 4, '0', NULL, '2023-06-19 00:11:40', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (152, 7, 4, '0', NULL, '2023-06-19 00:13:29', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (153, 7, 4, '0', NULL, '2023-06-19 00:13:40', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (154, 7, 4, '0', NULL, '2023-06-19 00:13:45', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (155, 7, 4, '0', NULL, '2023-06-19 00:15:38', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (156, 7, 4, '0', NULL, '2023-06-19 00:15:45', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (157, 7, 4, '0', NULL, '2023-06-19 10:16:04', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (158, 7, 4, '0', NULL, '2023-06-19 10:17:47', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (159, 7, 4, '0', NULL, '2023-06-19 10:17:54', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (160, 7, 4, '0', NULL, '2023-06-19 10:18:03', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (161, 7, 4, '0', NULL, '2023-06-19 10:18:03', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (162, 7, 4, '0', NULL, '2023-06-19 10:18:11', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (163, 7, 4, '0', NULL, '2023-06-19 10:18:12', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (164, 7, 4, '0', NULL, '2023-06-19 10:18:31', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (165, 7, 4, '0', NULL, '2023-06-19 10:19:52', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (166, 7, 4, '0', NULL, '2023-06-19 10:19:53', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (167, 7, 4, '0', NULL, '2023-06-19 10:21:11', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (168, 7, 4, '0', NULL, '2023-06-19 10:24:38', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (169, 7, 4, '0', NULL, '2023-06-19 10:24:59', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (170, 7, 4, '0', NULL, '2023-06-19 10:26:10', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (171, 7, 4, '0', NULL, '2023-06-19 10:26:11', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (172, 7, 4, '0', NULL, '2023-06-19 10:28:48', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (173, 7, 4, '0', NULL, '2023-06-19 10:28:52', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (174, 7, 4, '0', NULL, '2023-06-19 10:28:54', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (175, 7, 4, '0', NULL, '2023-06-19 10:28:57', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (176, 7, 4, '0', NULL, '2023-06-19 10:29:00', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (177, 7, 4, '0', NULL, '2023-06-19 10:29:04', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (178, 7, 4, '0', NULL, '2023-06-19 10:32:19', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (179, 7, 4, '0', NULL, '2023-06-19 10:32:23', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (180, 7, 4, '0', NULL, '2023-06-19 10:32:25', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (181, 7, 4, '0', NULL, '2023-06-19 10:33:27', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (182, 7, 4, '0', NULL, '2023-06-19 10:39:54', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (183, 6, 4, '0', NULL, '2023-06-19 10:41:17', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (184, 6, 4, '0', NULL, '2023-06-19 10:42:14', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (185, 7, 4, '0', NULL, '2023-06-19 10:42:15', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (186, 6, 4, '0', NULL, '2023-06-19 10:42:29', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (187, 7, 4, '0', NULL, '2023-06-19 10:42:29', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (188, 6, 4, '0', NULL, '2023-06-19 10:42:36', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (189, 7, 4, '0', NULL, '2023-06-19 10:42:36', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (190, 6, 4, '0', NULL, '2023-06-19 10:42:41', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (191, 7, 4, '0', NULL, '2023-06-19 10:42:42', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (192, 6, 4, '0', NULL, '2023-06-19 10:42:42', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (193, 7, 4, '0', NULL, '2023-06-19 10:42:42', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (194, 6, 4, '0', NULL, '2023-06-19 10:43:37', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (195, 7, 4, '0', NULL, '2023-06-19 10:43:37', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (196, 6, 4, '0', NULL, '2023-06-19 10:44:00', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (197, 7, 4, '0', NULL, '2023-06-19 10:44:00', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (198, 6, 4, '0', NULL, '2023-06-19 10:44:55', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (199, 7, 4, '0', NULL, '2023-06-19 10:44:55', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (200, 6, 4, '0', NULL, '2023-06-19 10:57:40', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (201, 7, 4, '0', NULL, '2023-06-19 10:57:40', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (202, 6, 4, '0', NULL, '2023-06-19 10:57:42', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (203, 7, 4, '0', NULL, '2023-06-19 10:57:42', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (204, 6, NULL, '0', NULL, '2023-06-19 10:58:13', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (205, 7, NULL, '0', NULL, '2023-06-19 10:58:13', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (206, 6, 4, '0', NULL, '2023-06-19 10:58:17', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (207, 7, 4, '0', NULL, '2023-06-19 10:58:18', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (208, 6, 4, '0', NULL, '2023-06-19 10:58:46', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (209, 7, 4, '0', NULL, '2023-06-19 10:58:46', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (210, 6, 4, '0', NULL, '2023-06-19 11:00:23', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (211, 7, 4, '0', NULL, '2023-06-19 11:00:23', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (212, 6, 4, '0', NULL, '2023-06-19 11:00:41', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (213, 7, 4, '0', NULL, '2023-06-19 11:00:41', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (214, 6, 4, '0', NULL, '2023-06-19 11:00:45', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (215, 7, 4, '0', NULL, '2023-06-19 11:00:46', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (216, 6, 4, '0', NULL, '2023-06-19 11:00:48', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (217, 7, 4, '0', NULL, '2023-06-19 11:00:48', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (218, 6, 4, '0', NULL, '2023-06-19 11:00:49', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (219, 7, 4, '0', NULL, '2023-06-19 11:00:49', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (220, 6, 4, '0', NULL, '2023-06-19 11:00:52', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (221, 7, 4, '0', NULL, '2023-06-19 11:00:53', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (222, 6, 4, '0', NULL, '2023-06-19 11:00:54', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (223, 7, 4, '0', NULL, '2023-06-19 11:00:55', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (224, 7, 4, '0', NULL, '2023-06-19 11:01:14', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (225, 7, 3, '0', NULL, '2023-06-19 11:01:26', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (226, 7, 2, '0', NULL, '2023-06-19 11:01:32', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (227, 7, 1, '0', NULL, '2023-06-19 11:01:37', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (228, 7, 4, '0', NULL, '2023-06-19 11:01:48', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (229, 6, 4, '0', NULL, '2023-06-19 11:02:56', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (230, 7, 4, '0', NULL, '2023-06-19 11:02:57', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (231, 6, 4, '0', NULL, '2023-06-19 11:03:26', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (232, 7, 4, '0', NULL, '2023-06-19 11:03:27', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (233, 6, 4, '0', NULL, '2023-06-19 11:03:28', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (234, 7, 4, '0', NULL, '2023-06-19 11:03:28', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (235, 6, 4, '0', NULL, '2023-06-19 11:03:29', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (236, 7, 4, '0', NULL, '2023-06-19 11:03:29', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (237, 6, 4, '0', NULL, '2023-06-19 11:04:40', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (238, 7, 4, '0', NULL, '2023-06-19 11:04:41', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (239, 6, 4, '0', NULL, '2023-06-19 11:04:43', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (240, 7, 4, '0', NULL, '2023-06-19 11:04:43', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (241, 6, 4, '0', NULL, '2023-06-19 11:04:45', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (242, 7, 4, '0', NULL, '2023-06-19 11:04:45', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (243, 6, 4, '0', NULL, '2023-06-19 11:05:01', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (244, 7, 4, '0', NULL, '2023-06-19 11:05:01', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (245, 6, 4, '0', NULL, '2023-06-19 11:05:05', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (246, 7, 4, '0', NULL, '2023-06-19 11:05:05', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (247, 6, 4, '0', NULL, '2023-06-19 11:07:39', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (248, 7, 4, '0', NULL, '2023-06-19 11:07:40', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (249, 6, 4, '0', NULL, '2023-06-19 11:08:06', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (250, 7, 4, '0', NULL, '2023-06-19 11:08:06', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (251, 6, 4, '0', NULL, '2023-06-19 11:08:08', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (252, 7, 4, '0', NULL, '2023-06-19 11:08:08', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (253, 6, 4, '0', NULL, '2023-06-19 11:11:26', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (254, 7, 4, '0', NULL, '2023-06-19 11:11:27', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (255, 6, 4, '0', NULL, '2023-06-19 11:11:32', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (256, 7, 4, '0', NULL, '2023-06-19 11:11:33', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (257, 6, 4, '0', NULL, '2023-06-19 11:12:11', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (258, 7, 4, '0', NULL, '2023-06-19 11:12:12', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (259, 6, 4, '0', NULL, '2023-06-19 11:12:36', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (260, 6, 4, '0', NULL, '2023-06-19 11:12:36', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (261, 7, 4, '0', NULL, '2023-06-19 11:12:37', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (262, 7, 4, '0', NULL, '2023-06-19 11:12:37', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (263, 7, 4, '0', NULL, '2023-06-19 11:12:52', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (264, 6, 4, '0', NULL, '2023-06-19 11:13:17', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (265, 7, 4, '0', NULL, '2023-06-19 11:13:18', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (266, 6, 4, '0', NULL, '2023-06-19 11:13:32', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (267, 7, 4, '0', NULL, '2023-06-19 11:13:33', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (268, 7, 3, '0', NULL, '2023-06-19 11:14:16', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (269, 7, 3, '0', NULL, '2023-06-19 11:14:32', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (270, 7, 3, '0', NULL, '2023-06-19 11:18:48', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (271, 7, 3, '0', NULL, '2023-06-19 11:20:39', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (272, 7, 1, '0', NULL, '2023-06-19 11:20:43', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (273, 7, 1, '0', NULL, '2023-06-19 11:21:11', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (274, 7, 1, '0', NULL, '2023-06-19 11:21:45', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (275, 6, 4, '0', NULL, '2023-06-19 11:22:35', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (276, 7, 1, '0', NULL, '2023-06-19 11:22:38', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (277, 7, 3, '0', NULL, '2023-06-19 11:22:52', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (278, 7, 3, '2', NULL, '2023-06-19 11:23:27', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (279, 7, 1, '2', NULL, '2023-06-19 11:23:38', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (280, 7, 3, '2', NULL, '2023-06-19 11:23:46', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (281, 6, 4, '0', NULL, '2023-06-19 11:24:07', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (282, 7, 1, '2', NULL, '2023-06-19 11:24:08', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (283, 7, 3, '2', NULL, '2023-06-19 11:24:08', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (284, 7, 1, '2', NULL, '2023-06-19 11:24:21', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (285, 7, 3, '2', NULL, '2023-06-19 11:24:23', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (286, 7, 1, '2', NULL, '2023-06-19 11:24:53', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (287, 7, 3, '2', NULL, '2023-06-19 11:24:56', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (288, 6, 4, '0', NULL, '2023-06-19 11:27:30', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (289, 7, 1, '2', NULL, '2023-06-19 11:27:31', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (290, 7, 3, '2', NULL, '2023-06-19 11:27:31', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (291, 6, 4, '0', NULL, '2023-06-19 11:27:43', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (292, 7, 1, '2', NULL, '2023-06-19 11:27:44', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (293, 7, 3, '2', NULL, '2023-06-19 11:27:44', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (294, 6, 4, '0', NULL, '2023-06-19 11:27:46', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (295, 7, 1, '2', NULL, '2023-06-19 11:27:47', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (296, 7, 3, '2', NULL, '2023-06-19 11:27:47', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (297, 6, 4, '0', NULL, '2023-06-19 11:27:54', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (298, 7, 1, '2', NULL, '2023-06-19 11:27:54', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (299, 7, 3, '2', NULL, '2023-06-19 11:27:54', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (300, 6, 4, '0', NULL, '2023-06-19 11:29:39', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (301, 7, 1, '2', NULL, '2023-06-19 11:29:40', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (302, 7, 3, '2', NULL, '2023-06-19 11:29:40', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (303, 6, 4, '0', NULL, '2023-06-19 11:29:46', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (304, 7, 1, '2', NULL, '2023-06-19 11:29:46', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (305, 7, 3, '2', NULL, '2023-06-19 11:29:46', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (306, 6, 4, '0', NULL, '2023-06-19 11:30:49', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (307, 7, 1, '2', NULL, '2023-06-19 11:30:50', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (308, 7, 3, '2', NULL, '2023-06-19 11:30:50', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (309, 6, 4, '0', NULL, '2023-06-19 11:30:56', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (310, 7, 1, '2', NULL, '2023-06-19 11:30:57', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (311, 7, 3, '2', NULL, '2023-06-19 11:30:57', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (312, 6, 4, '0', NULL, '2023-06-19 11:31:40', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (313, 7, 1, '2', NULL, '2023-06-19 11:31:41', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (314, 7, 3, '2', NULL, '2023-06-19 11:31:41', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (315, 6, 4, '0', NULL, '2023-06-19 11:31:59', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (316, 7, 1, '2', NULL, '2023-06-19 11:31:59', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (317, 7, 3, '2', NULL, '2023-06-19 11:31:59', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (318, 7, 4, '2', NULL, '2023-06-19 11:32:56', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (319, 6, 4, '0', NULL, '2023-06-19 11:33:20', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (320, 7, 4, '2', NULL, '2023-06-19 11:33:21', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (321, 6, 4, '0', NULL, '2023-06-19 11:33:27', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (322, 7, 4, '2', NULL, '2023-06-19 11:33:28', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (323, 7, 4, '2', NULL, '2023-06-19 11:34:38', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (324, 7, 3, '2', NULL, '2023-06-19 11:36:06', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (325, 7, 4, '2', NULL, '2023-06-19 13:01:51', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (326, 6, 4, '0', NULL, '2023-06-19 13:03:10', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (327, 7, 4, '2', NULL, '2023-06-19 13:03:10', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (328, 6, 4, '0', NULL, '2023-06-19 13:03:28', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (329, 7, 4, '2', NULL, '2023-06-19 13:03:28', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (330, 6, 4, '0', NULL, '2023-06-19 13:04:19', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (331, 7, 4, '2', NULL, '2023-06-19 13:04:19', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (332, 6, 4, '0', NULL, '2023-06-19 13:04:24', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (333, 7, 4, '2', NULL, '2023-06-19 13:04:25', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (334, 6, 4, '0', NULL, '2023-06-19 13:04:53', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (335, 7, 4, '2', NULL, '2023-06-19 13:04:54', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (336, 6, 4, '0', NULL, '2023-06-19 13:04:56', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (337, 7, 4, '2', NULL, '2023-06-19 13:04:57', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (338, 6, 4, '0', NULL, '2023-06-19 13:05:01', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (339, 7, 4, '2', NULL, '2023-06-19 13:05:01', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (340, 6, 4, '0', NULL, '2023-06-19 13:05:11', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (341, 7, 4, '2', NULL, '2023-06-19 13:05:12', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (342, 6, 4, '0', NULL, '2023-06-19 13:05:16', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (343, 7, 4, '2', NULL, '2023-06-19 13:05:16', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (344, 6, 4, '0', NULL, '2023-06-19 13:06:56', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (345, 7, 4, '2', NULL, '2023-06-19 13:06:56', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (346, 6, 4, '0', NULL, '2023-06-19 13:06:57', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (347, 7, 4, '2', NULL, '2023-06-19 13:06:57', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (348, 7, 4, '2', NULL, '2023-06-19 13:10:44', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (349, 6, 4, '0', NULL, '2023-06-19 13:11:32', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (350, 7, 4, '2', NULL, '2023-06-19 13:11:32', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (351, 6, 4, '0', NULL, '2023-06-19 13:11:34', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (352, 7, 4, '2', NULL, '2023-06-19 13:11:35', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (353, 6, 4, '0', NULL, '2023-06-19 13:17:31', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (354, 7, 4, '2', NULL, '2023-06-19 13:17:31', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (355, 6, 4, '0', NULL, '2023-06-19 13:17:34', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (356, 7, 4, '2', NULL, '2023-06-19 13:17:34', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (357, 6, 4, '0', NULL, '2023-06-19 13:17:37', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (358, 7, 4, '2', NULL, '2023-06-19 13:17:38', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (359, 6, 4, '0', NULL, '2023-06-19 13:17:50', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (360, 7, 4, '2', NULL, '2023-06-19 13:17:50', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (361, 6, 4, '0', NULL, '2023-06-19 13:18:00', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (362, 7, 4, '2', NULL, '2023-06-19 13:18:00', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (363, 6, 4, '0', NULL, '2023-06-19 13:18:48', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (364, 7, 4, '2', NULL, '2023-06-19 13:18:48', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (365, 6, 4, '0', NULL, '2023-06-19 13:18:59', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (366, 7, 4, '2', NULL, '2023-06-19 13:18:59', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (367, 6, 4, '0', NULL, '2023-06-19 13:19:09', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (368, 7, 4, '2', NULL, '2023-06-19 13:19:10', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (369, 6, 4, '0', NULL, '2023-06-19 13:19:11', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (370, 7, 4, '2', NULL, '2023-06-19 13:19:11', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (371, 6, 4, '0', NULL, '2023-06-19 13:21:42', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (372, 6, 4, '0', NULL, '2023-06-19 13:27:53', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (373, 6, 3, '0', NULL, '2023-06-19 13:28:13', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (374, 7, 4, '2', NULL, '2023-06-19 15:32:20', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (375, 7, 3, '2', NULL, '2023-06-25 13:34:07', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (376, 7, 4, '2', NULL, '2023-06-25 13:34:20', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (377, 7, 4, '2', NULL, '2023-06-25 21:30:59', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (378, 7, 3, '2', NULL, '2023-06-26 10:13:42', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (379, 7, 4, '2', NULL, '2023-06-26 11:17:11', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (380, 7, 3, '2', NULL, '2023-06-26 11:17:33', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (381, 7, 3, '2', NULL, '2023-06-26 11:17:42', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (382, 7, 1, '2', NULL, '2023-06-26 11:17:46', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (383, 7, 3, '2', NULL, '2023-06-26 16:57:01', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (384, 7, 4, '2', NULL, '2023-06-26 16:57:20', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (385, 7, 4, '2', NULL, '2023-06-26 16:59:12', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (386, 7, 8, '0', NULL, '2023-06-26 20:08:30', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (387, 7, 8, '0', NULL, '2023-06-26 20:10:20', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (388, 7, 8, '0', NULL, '2023-06-26 20:10:43', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (389, 7, 8, '0', NULL, '2023-06-26 20:10:55', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (390, 7, 9, '0', NULL, '2023-06-26 20:15:27', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (391, 7, 8, '0', NULL, '2023-06-26 20:16:47', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (392, 7, 9, '0', NULL, '2023-06-26 20:19:26', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (393, 7, 8, '0', NULL, '2023-06-26 20:19:26', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (394, 7, 9, '0', NULL, '2023-06-26 20:20:01', NULL, NULL, NULL);
INSERT INTO `browsing_history` VALUES (395, 7, 3, '0', NULL, '2023-06-26 20:34:24', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '评论父id',
  `comment_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '评论内容',
  `article_id` bigint NULL DEFAULT NULL COMMENT '文章id',
  `user_id` bigint NULL DEFAULT NULL COMMENT '评论用户id',
  `reply_user_id` bigint NULL DEFAULT NULL COMMENT '评论回复用户id',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '评论表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (1, 0, '评论测试', 4, 6, NULL, '0', NULL, '2023-06-18 23:40:04', NULL, NULL, NULL);
INSERT INTO `comment` VALUES (2, 0, '再测试一条', 4, 6, NULL, '0', NULL, '2023-06-18 23:40:57', NULL, NULL, NULL);
INSERT INTO `comment` VALUES (3, 0, '我也来测试', 4, 7, NULL, '0', NULL, '2023-06-19 00:09:58', NULL, NULL, NULL);
INSERT INTO `comment` VALUES (6, 1, '我来啦', 4, 7, 6, '2', NULL, '2023-06-19 00:15:53', NULL, NULL, NULL);
INSERT INTO `comment` VALUES (7, 2, '芜湖', 4, 7, 6, '0', NULL, '2023-06-19 10:30:28', NULL, NULL, NULL);
INSERT INTO `comment` VALUES (8, 1, '奥利给', 4, 6, 7, '0', NULL, '2023-06-19 10:41:27', NULL, NULL, NULL);
INSERT INTO `comment` VALUES (9, 0, '写的真不戳尸横遍地羧甲淀粉钠角色手机电脑房间束带结发南京市羧甲淀粉钠角色是否济南市设计费胆囊结石方式济南市', 3, 7, NULL, '0', NULL, '2023-06-19 11:36:26', NULL, NULL, NULL);
INSERT INTO `comment` VALUES (10, 2, 'wuhu', 4, 7, 6, '0', NULL, '2023-06-19 15:32:34', NULL, NULL, NULL);
INSERT INTO `comment` VALUES (11, 0, 'dd', 4, 7, NULL, '0', NULL, '2023-06-25 22:04:42', NULL, NULL, NULL);
INSERT INTO `comment` VALUES (12, 0, '奥利给', 3, 7, NULL, '0', NULL, '2023-06-26 10:14:04', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for favorite_article
-- ----------------------------
DROP TABLE IF EXISTS `favorite_article`;
CREATE TABLE `favorite_article`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `article_id` bigint NULL DEFAULT NULL COMMENT '文章id',
  `user_id` bigint NULL DEFAULT NULL COMMENT '用户id',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '收藏文章记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of favorite_article
-- ----------------------------
INSERT INTO `favorite_article` VALUES (4, 1, 7, '2', NULL, '2023-06-15 13:38:43', NULL, NULL, NULL);
INSERT INTO `favorite_article` VALUES (5, 3, 7, '2', NULL, '2023-06-15 13:43:05', NULL, NULL, NULL);
INSERT INTO `favorite_article` VALUES (6, 1, 7, '2', NULL, '2023-06-15 15:23:11', NULL, NULL, NULL);
INSERT INTO `favorite_article` VALUES (7, 3, 7, '2', NULL, '2023-06-15 15:23:42', NULL, NULL, NULL);
INSERT INTO `favorite_article` VALUES (8, 1, 7, '2', NULL, '2023-06-15 15:23:51', NULL, NULL, NULL);
INSERT INTO `favorite_article` VALUES (9, 2, 6, '0', NULL, '2023-06-15 15:25:15', NULL, NULL, NULL);
INSERT INTO `favorite_article` VALUES (10, 3, 7, '0', NULL, '2023-06-19 11:36:09', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '游客' COMMENT '操作人员',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1265 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `parent_id` bigint NOT NULL DEFAULT 0 COMMENT '所属上级(0代表第一级)',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '名称',
  `type` tinyint NOT NULL DEFAULT 0 COMMENT '类型(0:目录,1:菜单,2:按钮)',
  `path` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '路由地址',
  `component` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组件路径',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图标',
  `sort_value` int NULL DEFAULT NULL COMMENT '排序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '状态(0:禁止,1:正常)',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_parent_id`(`parent_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, 0, '系统管理', 0, 'system', 'Layout', NULL, 'el-icon-s-tools', 2, '1', '2023-06-05 15:31:53', '2023-06-18 22:00:18', '0');
INSERT INTO `sys_menu` VALUES (2, 1, '角色管理', 1, 'role', 'system/role/index', NULL, 'table', 2, '1', '2023-06-05 15:34:22', '2023-06-11 06:16:27', '0');
INSERT INTO `sys_menu` VALUES (3, 1, '菜单管理', 1, 'sysMenu', 'system/sysMenu/index', NULL, 'table', 3, '1', '2023-06-05 23:38:39', '2023-06-11 06:16:21', '0');
INSERT INTO `sys_menu` VALUES (4, 1, '用户管理', 1, 'sysUser', 'system/sysUser/index', NULL, 'table', 1, '1', '2023-06-05 15:39:22', '2023-06-05 23:39:21', '0');
INSERT INTO `sys_menu` VALUES (5, 4, '分配角色', 2, 'doAssignRole', 'system/sysUser/doAssignRole', 'sys:user:doAssignRole', NULL, 1, '1', '2023-06-05 15:40:49', '2023-06-05 23:40:49', '0');
INSERT INTO `sys_menu` VALUES (6, 0, '博客管理', 0, 'blogs', 'Layout', NULL, 'el-icon-setting', 1, '1', '2023-06-06 08:15:37', '2023-06-06 16:25:57', '0');
INSERT INTO `sys_menu` VALUES (7, 6, '文章审核', 1, 'article', 'blogs/article/index', NULL, 'table', 1, '1', '2023-06-06 08:17:16', '2023-06-18 17:09:56', '0');
INSERT INTO `sys_menu` VALUES (8, 0, '日志', 0, 'log', 'Layout', NULL, 'el-icon-tickets', 3, '1', '2023-06-18 13:02:54', '2023-06-18 13:43:22', '0');
INSERT INTO `sys_menu` VALUES (9, 8, '操作日志', 1, 'index', 'log/index', NULL, 'el-icon-document-remove', 1, '1', '2023-06-18 13:07:26', '2023-06-18 13:43:53', '0');
INSERT INTO `sys_menu` VALUES (10, 6, '浏览记录', 1, 'history', 'blogs/article/browsingHistory/history', NULL, 'table', 3, '1', '2023-06-18 17:15:41', '2023-06-18 22:00:39', '0');
INSERT INTO `sys_menu` VALUES (11, 6, '评论管理', 1, 'comment', 'blogs/comment/index', NULL, 'el-icon-tickets', 1, '1', '2023-06-18 22:01:43', '2023-06-18 22:01:43', '0');
INSERT INTO `sys_menu` VALUES (13, 7, '查询', 2, NULL, '', 'article:list', NULL, 1, '1', '2023-06-19 15:09:19', '2023-06-19 15:10:05', '0');
INSERT INTO `sys_menu` VALUES (14, 7, '新增', 2, NULL, NULL, 'article:add', NULL, 1, '1', '2023-06-19 15:16:05', '2023-06-19 15:16:05', '0');
INSERT INTO `sys_menu` VALUES (15, 7, '修改', 2, NULL, NULL, 'article:update', NULL, 1, '1', '2023-06-19 15:16:44', '2023-06-19 15:16:44', '0');
INSERT INTO `sys_menu` VALUES (16, 7, '删除', 2, NULL, NULL, 'article:del', NULL, 1, '1', '2023-06-19 15:17:02', '2023-06-19 15:17:01', '0');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `role_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `role_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色编码',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '角色状态（0正常 1停用）',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', '0', '超级管理员拥有一切权限', '2023-05-28 22:56:54', '2023-06-04 15:51:53', '0');
INSERT INTO `sys_role` VALUES (2, '审核员', 'audit', '0', '审核员', '2023-06-04 08:24:25', '2023-06-19 15:23:32', '0');
INSERT INTO `sys_role` VALUES (3, '普通用户', 'ordinary', '0', '普通用户', '2023-06-04 08:24:45', '2023-06-25 12:24:49', '0');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_id` bigint NOT NULL DEFAULT 0 COMMENT '角色id',
  `menu_id` bigint NOT NULL DEFAULT 0 COMMENT '菜单id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_role_id`(`role_id` ASC) USING BTREE,
  INDEX `idx_menu_id`(`menu_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色菜单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (10, 2, 6, '2023-06-19 15:23:31', '2023-06-19 15:23:31', '0');
INSERT INTO `sys_role_menu` VALUES (11, 2, 7, '2023-06-19 15:23:31', '2023-06-19 15:23:31', '0');
INSERT INTO `sys_role_menu` VALUES (12, 2, 1, '2023-06-19 15:23:31', '2023-06-19 15:23:31', '0');
INSERT INTO `sys_role_menu` VALUES (13, 2, 15, '2023-06-19 15:23:31', '2023-06-19 15:23:31', '0');
INSERT INTO `sys_role_menu` VALUES (14, 2, 11, '2023-06-19 15:23:31', '2023-06-19 15:23:31', '0');
INSERT INTO `sys_role_menu` VALUES (15, 2, 10, '2023-06-19 15:23:31', '2023-06-19 15:23:31', '0');
INSERT INTO `sys_role_menu` VALUES (16, 2, 4, '2023-06-19 15:23:31', '2023-06-19 15:23:31', '0');
INSERT INTO `sys_role_menu` VALUES (17, 2, 5, '2023-06-19 15:23:31', '2023-06-19 15:23:31', '0');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '密码',
  `birthday` date NULL DEFAULT NULL COMMENT '出生日期',
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '昵称',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '电子邮箱',
  `head_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '头像地址',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '描述',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0：正常 1：停用）',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_username`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', '96e79218965eb72c92a549dd5a330112', '2023-05-22', '张三', '260521812@qq.com', '/profile/2023/06/18/87b5646e-1035-45ed-8924-605ec34784aa2002628471.jpeg', '大丈夫之志应如长江，东奔大海，何苦怀恋温柔之乡', '0', '2023-05-23 16:41:57', '2023-06-18 17:48:24', NULL, '0');
INSERT INTO `sys_user` VALUES (2, 'admin1', '96e79218965eb72c92a549dd5a330112', '2023-05-23', 'sdads', '260521812@qq.com', '', 'ghjg', '0', '2023-05-23 16:41:57', '2023-06-26 20:12:35', NULL, '0');
INSERT INTO `sys_user` VALUES (3, 'admin3', '96e79218965eb72c92a549dd5a330112', '2023-05-23', 'sdads', '260521812@qq.com', '', 'ghjg', '0', '2023-05-23 16:41:57', '2023-06-15 14:10:02', NULL, '0');
INSERT INTO `sys_user` VALUES (4, 'admin2', '96e79218965eb72c92a549dd5a330112', '2023-05-23', 'sdads', '260521812@qq.com', '', 'ghjg', '0', '2023-05-23 16:41:57', '2023-06-15 14:10:01', NULL, '0');
INSERT INTO `sys_user` VALUES (5, 'admin4', '96e79218965eb72c92a549dd5a330112', '2023-05-23', 'sdads', '260521812@qq.com', '', 'ghjg', '0', '2023-05-23 16:41:57', '2023-06-15 14:10:00', NULL, '0');
INSERT INTO `sys_user` VALUES (6, '12', '96e79218965eb72c92a549dd5a330112', NULL, 'captain', '12@qq.com', '/profile/2023/06/17/540d65c5-10ae-410d-81c2-d67e9c7e459d1245831337.jpeg', '世界上只有一种真正的英雄主义，那就是在看清生活的真相之后，依然热爱生活', '0', '2023-06-11 13:10:39', '2023-06-17 20:15:28', NULL, '0');
INSERT INTO `sys_user` VALUES (7, '123', '96e79218965eb72c92a549dd5a330112', NULL, '法外狂徒', '123@qq.com', '/profile/2023/06/19/99c6241c-f724-4e9a-885f-480b87bfc9d4微信图片_20220714145937.jpg', '世界上没有那么多的来日方长，我们应该及时行乐!', '0', '2023-06-11 13:15:01', '2023-06-26 20:12:17', NULL, '0');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `role_id` bigint NOT NULL DEFAULT 0 COMMENT '角色id',
  `user_id` bigint NOT NULL DEFAULT 0 COMMENT '用户id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_role_id`(`role_id` ASC) USING BTREE,
  INDEX `idx_admin_id`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户角色' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (6, 2, 2, '2023-06-06 15:51:38', '2023-06-06 15:51:38', '0');
INSERT INTO `sys_user_role` VALUES (7, 3, 7, '2023-06-12 17:24:21', '2023-06-12 17:24:21', '0');

-- ----------------------------
-- Procedure structure for testInsert
-- ----------------------------
DROP PROCEDURE IF EXISTS `testInsert`;
delimiter ;;
CREATE PROCEDURE `testInsert`()
BEGIN

	DECLARE i INT default 0;
	
	WHILE i <=100 DO
			set i = i + 1;
			insert into favorite(favorite_name,user_id) values (CONCAT('张三最帅',i),1);

	END WHILE;


END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table sys_user
-- ----------------------------
DROP TRIGGER IF EXISTS `user_insert_role`;
delimiter ;;
CREATE TRIGGER `user_insert_role` AFTER INSERT ON `sys_user` FOR EACH ROW BEGIN
	insert into sys_user_role (role_id,user_id) VALUE (3,new.id);
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
