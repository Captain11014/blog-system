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

 Date: 29/05/2023 14:14:38
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
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核状态（0代表审核中 1代表审核通过 2代表审核未通过）',
  `audit_time` datetime NULL DEFAULT NULL COMMENT '审核时间',
  `audit_user_id` bigint NULL DEFAULT NULL COMMENT '审核人id',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者（作者）',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文章博客表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of article
-- ----------------------------

-- ----------------------------
-- Table structure for browsing_history
-- ----------------------------
DROP TABLE IF EXISTS `browsing_history`;
CREATE TABLE `browsing_history`  (
  `id` bigint NOT NULL COMMENT '主键',
  `user_id` bigint NULL DEFAULT NULL COMMENT '用户id',
  `article_id` bigint NULL DEFAULT NULL COMMENT '文章id',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '0代表存在 2代表删除',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间(浏览时间)',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '浏览记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of browsing_history
-- ----------------------------

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `parent_id` bigint NULL DEFAULT NULL COMMENT '评论父id',
  `comment_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '评论内容',
  `article_id` bigint NULL DEFAULT NULL COMMENT '文章id',
  `user_id` bigint NULL DEFAULT NULL COMMENT '评论用户id',
  `reply_user_id` bigint NULL DEFAULT NULL COMMENT '评论回复用户id',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '评论表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------

-- ----------------------------
-- Table structure for favorite
-- ----------------------------
DROP TABLE IF EXISTS `favorite`;
CREATE TABLE `favorite`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `favorite_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '默认' COMMENT '收藏夹名字',
  `user_id` bigint NULL DEFAULT NULL COMMENT '用户id',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '收藏夹' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of favorite
-- ----------------------------
INSERT INTO `favorite` VALUES (1, '张三最帅1', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (2, '张三最帅2', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (3, '张三最帅3', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (4, '张三最帅4', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (5, '张三最帅5', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (6, '张三最帅6', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (7, '张三最帅7', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (8, '张三最帅8', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (9, '张三最帅9', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (10, '张三最帅10', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (11, '张三最帅11', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (12, '张三最帅12', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (13, '张三最帅13', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (14, '张三最帅14', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (15, '张三最帅15', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (16, '张三最帅16', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (17, '张三最帅17', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (18, '张三最帅18', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (19, '张三最帅19', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (20, '张三最帅20', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (21, '张三最帅21', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (22, '张三最帅22', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (23, '张三最帅23', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (24, '张三最帅24', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (25, '张三最帅25', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (26, '张三最帅26', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (27, '张三最帅27', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (28, '张三最帅28', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (29, '张三最帅29', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (30, '张三最帅30', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (31, '张三最帅31', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (32, '张三最帅32', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (33, '张三最帅33', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (34, '张三最帅34', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (35, '张三最帅35', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (36, '张三最帅36', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (37, '张三最帅37', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (38, '张三最帅38', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (39, '张三最帅39', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (40, '张三最帅40', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (41, '张三最帅41', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (42, '张三最帅42', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (43, '张三最帅43', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (44, '张三最帅44', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (45, '张三最帅45', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (46, '张三最帅46', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (47, '张三最帅47', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (48, '张三最帅48', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (49, '张三最帅49', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (50, '张三最帅50', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (51, '张三最帅51', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (52, '张三最帅52', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (53, '张三最帅53', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (54, '张三最帅54', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (55, '张三最帅55', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (56, '张三最帅56', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (57, '张三最帅57', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (58, '张三最帅58', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (59, '张三最帅59', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (60, '张三最帅60', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (61, '张三最帅61', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (62, '张三最帅62', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (63, '张三最帅63', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (64, '张三最帅64', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (65, '张三最帅65', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (66, '张三最帅66', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (67, '张三最帅67', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (68, '张三最帅68', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (69, '张三最帅69', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (70, '张三最帅70', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (71, '张三最帅71', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (72, '张三最帅72', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (73, '张三最帅73', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (74, '张三最帅74', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (75, '张三最帅75', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (76, '张三最帅76', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (77, '张三最帅77', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (78, '张三最帅78', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (79, '张三最帅79', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (80, '张三最帅80', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (81, '张三最帅81', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (82, '张三最帅82', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (83, '张三最帅83', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (84, '张三最帅84', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (85, '张三最帅85', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (86, '张三最帅86', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (87, '张三最帅87', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (88, '张三最帅88', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (89, '张三最帅89', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (90, '张三最帅90', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (91, '张三最帅91', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (92, '张三最帅92', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (93, '张三最帅93', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (94, '张三最帅94', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (95, '张三最帅95', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (96, '张三最帅96', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (97, '张三最帅97', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (98, '张三最帅98', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (99, '张三最帅99', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (100, '张三最帅100', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);
INSERT INTO `favorite` VALUES (101, '张三最帅101', 1, '0', '张三', '2023-05-23 17:01:12', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for favorite_article
-- ----------------------------
DROP TABLE IF EXISTS `favorite_article`;
CREATE TABLE `favorite_article`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `article_id` bigint NULL DEFAULT NULL COMMENT '文章id',
  `favorite_id` bigint NULL DEFAULT NULL COMMENT '收藏夹id',
  `user_id` bigint NULL DEFAULT NULL COMMENT '用户id',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of favorite_article
-- ----------------------------

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `parent_id` bigint NOT NULL DEFAULT 0 COMMENT '所属上级',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '名称',
  `type` tinyint NOT NULL DEFAULT 0 COMMENT '类型(0:目录,1:菜单,2:按钮)',
  `path` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '路由地址',
  `component` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组件路径',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图标',
  `sort_value` int NULL DEFAULT NULL COMMENT '排序',
  `status` tinyint NULL DEFAULT NULL COMMENT '状态(0:禁止,1:正常)',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_parent_id`(`parent_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, 0, '系统管理', 0, 'system', 'Layout', NULL, 'el-icon-s-tools', 1, 1, '2021-05-31 18:05:37', '2023-05-28 21:20:12', '0');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `role_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `role_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色编码',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '管理员', 'aaa12', '等等', '2023-05-28 22:56:54', '2023-05-29 06:07:05', '0');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role_id` bigint NOT NULL DEFAULT 0,
  `menu_id` bigint NOT NULL DEFAULT 0,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_role_id`(`role_id` ASC) USING BTREE,
  INDEX `idx_menu_id`(`menu_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色菜单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------

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
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手机',
  `head_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '头像地址',
  `open_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '微信openId',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '描述',
  `status` tinyint NULL DEFAULT NULL COMMENT '状态（0：正常 1：停用）',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_username`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', 'sadsdas', '2023-05-23', 'sdads', 'a188154', 'sasda', '1', 'ghjg', 0, '2023-05-23 16:41:57', '2023-05-23 16:42:27', NULL, '0');
INSERT INTO `sys_user` VALUES (2, 'admin1', 'sadsdas', '2023-05-23', 'sdads', 'a188154', 'sasda', '1', 'ghjg', 0, '2023-05-23 16:41:57', '2023-05-23 16:41:57', NULL, '0');
INSERT INTO `sys_user` VALUES (3, 'admin3', 'sadsdas', '2023-05-23', 'sdads', 'a188154', 'sasda', '1', 'ghjg', 0, '2023-05-23 16:41:57', '2023-05-23 16:41:57', NULL, '0');
INSERT INTO `sys_user` VALUES (4, 'admin2', 'sadsdas', '2023-05-23', 'sdads', 'a188154', 'sasda', '1', 'ghjg', 0, '2023-05-23 16:41:57', '2023-05-23 16:41:57', NULL, '0');
INSERT INTO `sys_user` VALUES (5, 'admin4', 'sadsdas', '2023-05-23', 'sdads', 'a188154', 'sasda', '1', 'ghjg', 0, '2023-05-23 16:41:57', '2023-05-23 16:41:57', NULL, '0');

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户角色' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------

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

SET FOREIGN_KEY_CHECKS = 1;
