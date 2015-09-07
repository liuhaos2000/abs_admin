/*
Navicat MySQL Data Transfer

Source Server         : DB01
Source Server Version : 50200
Source Host           : localhost:3306
Source Database       : abs

Target Server Type    : MYSQL
Target Server Version : 50200
File Encoding         : 65001

Date: 2015-06-07 13:25:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for m_user
-- ----------------------------
DROP TABLE IF EXISTS `m_user`;
CREATE TABLE `m_user` (
  `user_id` varchar(50) NOT NULL,
  `user_name` varchar(50) DEFAULT NULL,
  `user_password` varchar(255) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of m_user
-- ----------------------------

-- ----------------------------
-- Table structure for sys_group
-- ----------------------------
DROP TABLE IF EXISTS `sys_group`;
CREATE TABLE `sys_group` (
  `GROUP_ID` varchar(32) DEFAULT NULL,
  `GROUP_NAME` varchar(100) DEFAULT NULL,
  `GROUP_NO` varchar(10) DEFAULT NULL,
  `REMARK` varchar(500) DEFAULT NULL,
  `ADD_TIME` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_group
-- ----------------------------
INSERT INTO `sys_group` VALUES (null, '111', '123', '安达', null);
INSERT INTO `sys_group` VALUES (null, 'bb', 'cc', 'dd', null);
INSERT INTO `sys_group` VALUES (null, 'asdf', 'asdf', 'sdf', null);
INSERT INTO `sys_group` VALUES (null, 'asdff', 'adsaf', 'sdf', null);
INSERT INTO `sys_group` VALUES (null, 'aaadf', 'df', 'df', null);
INSERT INTO `sys_group` VALUES (null, 'cc', 'ss', 'zz', null);
INSERT INTO `sys_group` VALUES (null, 'ff', 'dd', 'ds', null);
INSERT INTO `sys_group` VALUES (null, 'fs', 'asdf', 'sdf', null);
INSERT INTO `sys_group` VALUES (null, 'asdfff', 'as', 'sdf', null);
INSERT INTO `sys_group` VALUES (null, 'ww', 'asdf', 'sdf', null);
INSERT INTO `sys_group` VALUES (null, 'sdf', 'sdf', 'sdf', null);
INSERT INTO `sys_group` VALUES (null, 'gg', 'gg', 'sa', null);
INSERT INTO `sys_group` VALUES (null, 'asdfaa', 'asf', 'sdf', null);
INSERT INTO `sys_group` VALUES (null, 'aasdfff', 'sf', 'as', null);
INSERT INTO `sys_group` VALUES (null, 'xx', 'df', 'sdf', null);
INSERT INTO `sys_group` VALUES ('', 'xx1', 'df', 'sdf', null);
INSERT INTO `sys_group` VALUES ('', 'xx2', 'df', 'sdf', null);
INSERT INTO `sys_group` VALUES ('', 'xx3', 'df', 'sdf', null);
INSERT INTO `sys_group` VALUES ('', 'xx4', 'df', 'sdf', null);
INSERT INTO `sys_group` VALUES ('', 'xx5', 'df', 'sdf', null);
INSERT INTO `sys_group` VALUES ('', 'xx6', 'df', 'sdf', null);
INSERT INTO `sys_group` VALUES ('', 'xx7', 'df', 'sdf', null);
INSERT INTO `sys_group` VALUES ('', 'xx8', 'df', 'sdf', null);
INSERT INTO `sys_group` VALUES ('', 'xx9', 'df', 'sdf', null);
INSERT INTO `sys_group` VALUES ('', 'xx10', 'df', 'sdf', null);
INSERT INTO `sys_group` VALUES ('', 'xx11', 'df', 'sdf', null);
INSERT INTO `sys_group` VALUES ('', 'xx12', 'df', 'sdf', null);
INSERT INTO `sys_group` VALUES ('', 'xx13', 'df', 'sdf', null);
INSERT INTO `sys_group` VALUES ('', 'xx14', 'df', 'sdf', null);
INSERT INTO `sys_group` VALUES ('', 'xx15', 'df', 'sdf', null);

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `MENU_ID` varchar(32) NOT NULL,
  `MENU_NAME` varchar(100) NOT NULL,
  `MENU_URL` varchar(100) DEFAULT NULL,
  `PARENT_MENU_ID` varchar(32) DEFAULT NULL,
  `UPDATE_TIME` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('6E62020D770346F08A4287FF205EEB8F', '机构管理', '/app/page/sysgroup', '65E16E3E1EFC484A8CBD2AD77D8D3F92', null);
INSERT INTO `sys_menu` VALUES ('8C95B11FF4C042DDB3AF2C467B593295', '修改密码', '/app/page/syspasswd', '65E16E3E1EFC484A8CBD2AD77D8D3F92', null);
INSERT INTO `sys_menu` VALUES ('65E16E3E1EFC484A8CBD2AD77D8D3F92', '系统管理', '', '', null);
INSERT INTO `sys_menu` VALUES ('A57EF00DD8934819AE2311DC88B622C1', '菜单管理', '/app/page/sysmenu', '65E16E3E1EFC484A8CBD2AD77D8D3F92', null);
INSERT INTO `sys_menu` VALUES ('3D7C1106526F457BBB8B15E72478E983', '角色管理', '/app/page/sysrole', '65E16E3E1EFC484A8CBD2AD77D8D3F92', null);
INSERT INTO `sys_menu` VALUES ('21E4F72B9D274510AB219C33D792A4C4', '用户管理', '/app/page/sysuser', '65E16E3E1EFC484A8CBD2AD77D8D3F92', null);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `ROLE_ID` varchar(32) NOT NULL,
  `ROLE_NAME` varchar(50) DEFAULT NULL,
  `REMARK` varchar(500) DEFAULT NULL,
  `UPDATE_TIME` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('root', '超级管理员', '具有全部权限', null);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `ID` varchar(32) NOT NULL,
  `ROLE_ID` varchar(32) DEFAULT NULL,
  `MENU_ID` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('1', 'root', 'A57EF00DD8934819AE2311DC88B622C1');
INSERT INTO `sys_role_menu` VALUES ('2', 'root', '3D7C1106526F457BBB8B15E72478E983');
INSERT INTO `sys_role_menu` VALUES ('3', 'root', '21E4F72B9D274510AB219C33D792A4C4');
INSERT INTO `sys_role_menu` VALUES ('4', 'root', '6E62020D770346F08A4287FF205EEB8F');
INSERT INTO `sys_role_menu` VALUES ('5', 'root', '8C95B11FF4C042DDB3AF2C467B593295');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `USER_ID` varchar(32) NOT NULL,
  `USERNAME` varchar(50) DEFAULT NULL,
  `PASSWORD` varchar(40) DEFAULT NULL,
  `NAME` varchar(50) DEFAULT NULL,
  `ROLE_ID` varchar(32) DEFAULT NULL,
  `GROUP_ID` varchar(32) DEFAULT NULL,
  `ADD_TIME` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('001', 'admin', '96E79218965EB72C92A549DD5A330112', 'liuhai', 'root', 'admin', '2015-06-30');
INSERT INTO `sys_user` VALUES ('002', 'admin1', '96E79218965EB72C92A549DD5A330112', 'liuhai1', 'root', 'admin', '2015-06-30');
INSERT INTO `sys_user` VALUES ('003', 'admin2', '96E79218965EB72C92A549DD5A330112', 'liuhai2', 'root', 'admin', '2015-06-30');
INSERT INTO `sys_user` VALUES ('004', 'admin3', '96E79218965EB72C92A549DD5A330112', 'liuhai3', 'root', 'admin', '2015-06-30');
INSERT INTO `sys_user` VALUES ('005', 'admin4', '96E79218965EB72C92A549DD5A330112', 'liuhai4', 'root', 'admin', '2015-06-30');
INSERT INTO `sys_user` VALUES ('006', 'admin5', '96E79218965EB72C92A549DD5A330112', 'liuhai5', 'root', 'admin', '2015-06-30');
INSERT INTO `sys_user` VALUES ('007', 'admin6', '96E79218965EB72C92A549DD5A330112', 'liuhai6', 'root', 'admin', '2015-06-30');
INSERT INTO `sys_user` VALUES ('008', 'admin7', '96E79218965EB72C92A549DD5A330112', 'liuhai7', 'root', 'admin', '2015-06-30');
INSERT INTO `sys_user` VALUES ('009', 'admin8', '96E79218965EB72C92A549DD5A330112', 'liuhai8', 'root', 'admin', '2015-06-30');
INSERT INTO `sys_user` VALUES ('010', 'admin9', '96E79218965EB72C92A549DD5A330112', 'liuhai9', 'root', 'admin', '2015-06-30');
INSERT INTO `sys_user` VALUES ('011', 'admin10', '96E79218965EB72C92A549DD5A330112', 'liuhai10', 'root', 'admin', '2015-06-30');
INSERT INTO `sys_user` VALUES ('012', 'admin11', '96E79218965EB72C92A549DD5A330112', 'liuhai11', 'root', 'admin', '2015-06-30');
INSERT INTO `sys_user` VALUES ('013', 'admin12', '96E79218965EB72C92A549DD5A330112', 'liuhai12', 'root', 'admin', '2015-06-30');
INSERT INTO `sys_user` VALUES ('014', 'admin13', '96E79218965EB72C92A549DD5A330112', 'liuhai13', 'root', 'admin', '2015-06-30');
INSERT INTO `sys_user` VALUES ('015', 'admin14', '96E79218965EB72C92A549DD5A330112', 'liuhai14', 'root', 'admin', '2015-06-30');
INSERT INTO `sys_user` VALUES ('016', 'admin15', '96E79218965EB72C92A549DD5A330112', 'liuhai15', 'root', 'admin', '2015-06-30');
INSERT INTO `sys_user` VALUES ('017', 'admin16', '96E79218965EB72C92A549DD5A330112', 'liuhai16', 'root', 'admin', '2015-06-30');
INSERT INTO `sys_user` VALUES ('018', 'admin17', '96E79218965EB72C92A549DD5A330112', 'liuhai17', 'root', 'admin', '2015-06-30');
INSERT INTO `sys_user` VALUES ('019', 'admin18', '96E79218965EB72C92A549DD5A330112', 'liuhai18', 'root', 'admin', '2015-06-30');
INSERT INTO `sys_user` VALUES ('020', 'admin19', '96E79218965EB72C92A549DD5A330112', 'liuhai19', 'root', 'admin', '2015-06-30');
INSERT INTO `sys_user` VALUES ('021', 'admin20', '96E79218965EB72C92A549DD5A330112', 'liuhai20', 'root', 'admin', '2015-06-30');
INSERT INTO `sys_user` VALUES ('022', 'admin21', '96E79218965EB72C92A549DD5A330112', 'liuhai21', 'root', 'admin', '2015-06-30');
INSERT INTO `sys_user` VALUES ('023', 'admin22', '96E79218965EB72C92A549DD5A330112', 'liuhai22', 'root', 'admin', '2015-06-30');
INSERT INTO `sys_user` VALUES ('024', 'admin23', '96E79218965EB72C92A549DD5A330112', 'liuhai23', 'root', 'admin', '2015-06-30');
INSERT INTO `sys_user` VALUES ('025', 'admin24', '96E79218965EB72C92A549DD5A330112', 'liuhai24', 'root', 'admin', '2015-06-30');
INSERT INTO `sys_user` VALUES ('026', 'admin25', '96E79218965EB72C92A549DD5A330112', 'liuhai25', 'root', 'admin', '2015-06-30');
INSERT INTO `sys_user` VALUES ('027', 'admin26', '96E79218965EB72C92A549DD5A330112', 'liuhai26', 'root', 'admin', '2015-06-30');
INSERT INTO `sys_user` VALUES ('028', 'admin27', '96E79218965EB72C92A549DD5A330112', 'liuhai27', 'root', 'admin', '2015-06-30');
INSERT INTO `sys_user` VALUES ('029', 'admin28', '96E79218965EB72C92A549DD5A330112', 'liuhai28', 'root', 'admin', '2015-06-30');
INSERT INTO `sys_user` VALUES ('030', 'admin29', '96E79218965EB72C92A549DD5A330112', 'liuhai29', 'root', 'admin', '2015-06-30');
INSERT INTO `sys_user` VALUES ('031', 'admin30', '96E79218965EB72C92A549DD5A330112', 'liuhai30', 'root', 'admin', '2015-06-30');
INSERT INTO `sys_user` VALUES ('032', 'admin31', '96E79218965EB72C92A549DD5A330112', 'liuhai31', 'root', 'admin', '2015-06-30');
INSERT INTO `sys_user` VALUES ('033', 'admin32', '96E79218965EB72C92A549DD5A330112', 'liuhai32', 'root', 'admin', '2015-06-30');
INSERT INTO `sys_user` VALUES ('034', 'admin33', '96E79218965EB72C92A549DD5A330112', 'liuhai33', 'root', 'admin', '2015-06-30');
INSERT INTO `sys_user` VALUES ('035', 'admin34', '96E79218965EB72C92A549DD5A330112', 'liuhai34', 'root', 'admin', '2015-06-30');
INSERT INTO `sys_user` VALUES ('036', 'admin35', '96E79218965EB72C92A549DD5A330112', 'liuhai35', 'root', 'admin', '2015-06-30');
INSERT INTO `sys_user` VALUES ('037', 'admin36', '96E79218965EB72C92A549DD5A330112', 'liuhai36', 'root', 'admin', '2015-06-30');
INSERT INTO `sys_user` VALUES ('038', 'admin37', '96E79218965EB72C92A549DD5A330112', 'liuhai37', 'root', 'admin', '2015-06-30');
INSERT INTO `sys_user` VALUES ('039', 'admin38', '96E79218965EB72C92A549DD5A330112', 'liuhai38', 'root', 'admin', '2015-06-30');
INSERT INTO `sys_user` VALUES ('040', 'admin39', '96E79218965EB72C92A549DD5A330112', 'liuhai39', 'root', 'admin', '2015-06-30');
INSERT INTO `sys_user` VALUES ('041', 'admin40', '96E79218965EB72C92A549DD5A330112', 'liuhai40', 'root', 'admin', '2015-06-30');
INSERT INTO `sys_user` VALUES ('042', 'admin41', '96E79218965EB72C92A549DD5A330112', 'liuhai41', 'root', 'admin', '2015-06-30');
INSERT INTO `sys_user` VALUES ('043', 'admin42', '96E79218965EB72C92A549DD5A330112', 'liuhai42', 'root', 'admin', '2015-06-30');
INSERT INTO `sys_user` VALUES ('044', 'admin43', '96E79218965EB72C92A549DD5A330112', 'liuhai43', 'root', 'admin', '2015-06-30');
INSERT INTO `sys_user` VALUES ('045', 'admin44', '96E79218965EB72C92A549DD5A330112', 'liuhai44', 'root', 'admin', '2015-06-30');
INSERT INTO `sys_user` VALUES ('046', 'admin45', '96E79218965EB72C92A549DD5A330112', 'liuhai45', 'root', 'admin', '2015-06-30');
INSERT INTO `sys_user` VALUES ('047', 'admin46', '96E79218965EB72C92A549DD5A330112', 'liuhai46', 'root', 'admin', '2015-06-30');
INSERT INTO `sys_user` VALUES ('048', 'admin47', '96E79218965EB72C92A549DD5A330112', 'liuhai47', 'root', 'admin', '2015-06-30');
INSERT INTO `sys_user` VALUES ('049', 'admin48', '96E79218965EB72C92A549DD5A330112', 'liuhai48', 'root', 'admin', '2015-06-30');
INSERT INTO `sys_user` VALUES ('050', 'admin49', '96E79218965EB72C92A549DD5A330112', 'liuhai49', 'root', 'admin', '2015-06-30');
INSERT INTO `sys_user` VALUES ('051', 'admin50', '96E79218965EB72C92A549DD5A330112', 'liuhai50', 'root', 'admin', '2015-06-30');
INSERT INTO `sys_user` VALUES ('052', 'admin51', '96E79218965EB72C92A549DD5A330112', 'liuhai51', 'root', 'admin', '2015-06-30');
INSERT INTO `sys_user` VALUES ('053', 'admin52', '96E79218965EB72C92A549DD5A330112', 'liuhai52', 'root', 'admin', '2015-06-30');
INSERT INTO `sys_user` VALUES ('054', 'admin53', '96E79218965EB72C92A549DD5A330112', 'liuhai53', 'root', 'admin', '2015-06-30');
INSERT INTO `sys_user` VALUES ('055', 'admin54', '96E79218965EB72C92A549DD5A330112', 'liuhai54', 'root', 'admin', '2015-06-30');
