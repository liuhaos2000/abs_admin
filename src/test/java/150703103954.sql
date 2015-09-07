/*
MySQL Backup
Source Server Version: 5.6.24
Source Database: abs
Date: 2015/7/3 10:39:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
--  Table structure for `m_user`
-- ----------------------------
DROP TABLE IF EXISTS `m_user`;
CREATE TABLE `m_user` (
  `user_id` varchar(50) NOT NULL COMMENT '用户ID',
  `user_name` varchar(50) NOT NULL COMMENT '用户名',
  `user_password` varchar(100) NOT NULL COMMENT '用户密码',
  `birthday` date DEFAULT NULL COMMENT '生日',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `sys_group`
-- ----------------------------
DROP TABLE IF EXISTS `sys_group`;
CREATE TABLE `sys_group` (
  `GROUP_ID` int(12) NOT NULL AUTO_INCREMENT,
  `GROUP_NAME` varchar(100) DEFAULT NULL,
  `GROUP_NO` varchar(10) DEFAULT NULL,
  `REMARK` varchar(500) DEFAULT NULL,
  `ADD_TIME` date DEFAULT NULL,
  PRIMARY KEY (`GROUP_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `sys_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `MENU_ID` int(12) NOT NULL AUTO_INCREMENT,
  `MENU_NAME` varchar(100) NOT NULL,
  `MENU_URL` varchar(100) DEFAULT NULL,
  `PARENT_MENU_ID` int(12) DEFAULT NULL,
  `UPDATE_TIME` date DEFAULT NULL,
  PRIMARY KEY (`MENU_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `ROLE_ID` int(32) NOT NULL AUTO_INCREMENT,
  `ROLE_NAME` varchar(50) DEFAULT NULL,
  `REMARK` varchar(500) DEFAULT NULL,
  `UPDATE_TIME` date DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `sys_role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `ID` int(12) NOT NULL AUTO_INCREMENT,
  `ROLE_ID` varchar(32) DEFAULT NULL,
  `MENU_ID` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `sys_type`
-- ----------------------------
DROP TABLE IF EXISTS `sys_type`;
CREATE TABLE `sys_type` (
  `type_code` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `type_name` varchar(50) NOT NULL,
  `delete_flg` char(1) DEFAULT NULL,
  `c_user` varchar(50) DEFAULT NULL,
  `c_date` date DEFAULT NULL,
  `u_user` varchar(50) DEFAULT NULL,
  `u_date` date DEFAULT NULL,
  `ver_num` int(9) DEFAULT NULL,
  PRIMARY KEY (`type_code`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `sys_type_sub`
-- ----------------------------
DROP TABLE IF EXISTS `sys_type_sub`;
CREATE TABLE `sys_type_sub` (
  `type_code` int(3) NOT NULL DEFAULT '0',
  `sub_type_code` int(2) NOT NULL DEFAULT '0',
  `sub_type_name` varchar(50) DEFAULT NULL,
  `delete_flg` char(1) DEFAULT NULL,
  `c_user` varchar(50) DEFAULT NULL,
  `c_date` date DEFAULT NULL,
  `u_user` varchar(50) DEFAULT NULL,
  `u_date` date DEFAULT NULL,
  `ver_num` int(9) DEFAULT NULL,
  PRIMARY KEY (`type_code`,`sub_type_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `USER_ID` int(12) NOT NULL AUTO_INCREMENT,
  `USERNAME` varchar(50) DEFAULT NULL,
  `PASSWORD` varchar(40) DEFAULT NULL,
  `NAME` varchar(50) DEFAULT NULL,
  `ROLE_ID` varchar(32) DEFAULT NULL,
  `GROUP_ID` varchar(32) DEFAULT NULL,
  `ADD_TIME` date DEFAULT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records 
-- ----------------------------
INSERT INTO `m_user` VALUES ('lh','liuhao','123','2015-06-05'), ('ta','tanaka','222','2015-06-04');
INSERT INTO `sys_group` VALUES ('1','人事部','A1','人事部',NULL), ('33','开发部','B1','开发部',NULL);
INSERT INTO `sys_menu` VALUES ('1','系统管理','',NULL,NULL), ('2','角色管理','/app/page/sysrole','1',NULL), ('3','用户管理','/app/page/sysuser','1',NULL), ('4','机构管理','/app/page/sysgroup','1',NULL), ('5','修改密码','/app/page/syspasswd','1',NULL), ('6','菜单管理','/app/page/sysmenu','1',NULL), ('7','类型管理','/app/page/type','1',NULL);
INSERT INTO `sys_role` VALUES ('4','admin','超级管理员',NULL), ('5','一般用户','一般用户',NULL);
INSERT INTO `sys_role_menu` VALUES ('38','5','5'), ('39','4','2'), ('40','4','3'), ('41','4','4'), ('42','4','5'), ('43','4','6'), ('44','4','7');
INSERT INTO `sys_type` VALUES ('1','a',NULL,NULL,NULL,NULL,NULL,NULL), ('2','b',NULL,NULL,NULL,NULL,NULL,NULL), ('3','aaa',NULL,NULL,NULL,NULL,NULL,NULL), ('4','cdac',NULL,NULL,NULL,NULL,NULL,NULL), ('5','ascasc',NULL,NULL,NULL,NULL,NULL,NULL), ('6','fasf',NULL,NULL,NULL,NULL,NULL,NULL), ('7','bads',NULL,NULL,NULL,NULL,NULL,NULL), ('8','asdf',NULL,NULL,NULL,NULL,NULL,NULL), ('9','ff',NULL,NULL,NULL,NULL,NULL,NULL), ('10','fdafdsf',NULL,NULL,NULL,NULL,NULL,NULL), ('11','fasdfasdfasf',NULL,NULL,NULL,NULL,NULL,NULL), ('12','asdfasf',NULL,NULL,NULL,NULL,NULL,NULL), ('13','asfsf',NULL,NULL,NULL,NULL,NULL,NULL), ('14','asfasf',NULL,NULL,NULL,NULL,NULL,NULL), ('15','asfsfss',NULL,NULL,NULL,NULL,NULL,NULL), ('16','aa',NULL,NULL,NULL,NULL,NULL,NULL), ('17','csd',NULL,NULL,NULL,NULL,NULL,NULL), ('18','sdfsfs',NULL,NULL,NULL,NULL,NULL,NULL), ('19','sssssssss',NULL,NULL,NULL,NULL,NULL,NULL), ('20','sdfffff',NULL,NULL,NULL,NULL,NULL,NULL), ('21','asdfsf',NULL,NULL,NULL,NULL,NULL,NULL), ('22','11',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `sys_user` VALUES ('1','admin','96e79218965eb72c92a549dd5a330112','liuhai','4','1','2015-06-30'), ('2','admin1','96E79218965EB72C92A549DD5A330112','liuhai1','5','1','2015-06-30'), ('3','admin2','96E79218965EB72C92A549DD5A330112','liuhai2','5','1','2015-06-30'), ('4','admin3','96E79218965EB72C92A549DD5A330112','liuhai3','5','1','2015-06-30');
