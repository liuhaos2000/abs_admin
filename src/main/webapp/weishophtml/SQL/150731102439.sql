/*
MySQL Backup
Source Server Version: 5.6.24
Source Database: ecshop
Date: 2015/7/31 10:24:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
--  Table structure for `abs_account_log`
-- ----------------------------
DROP TABLE IF EXISTS `abs_account_log`;
CREATE TABLE `abs_account_log` (
  `log_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL,
  `user_money` decimal(10,2) NOT NULL,
  `frozen_money` decimal(10,2) NOT NULL,
  `rank_points` mediumint(9) NOT NULL,
  `pay_points` mediumint(9) NOT NULL,
  `change_time` int(10) unsigned NOT NULL,
  `change_desc` varchar(255) NOT NULL,
  `change_type` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`log_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `abs_ad`
-- ----------------------------
DROP TABLE IF EXISTS `abs_ad`;
CREATE TABLE `abs_ad` (
  `ad_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `position_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `media_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ad_name` varchar(60) NOT NULL DEFAULT '',
  `ad_link` varchar(255) NOT NULL DEFAULT '',
  `ad_code` text NOT NULL,
  `start_time` int(11) NOT NULL DEFAULT '0',
  `end_time` int(11) NOT NULL DEFAULT '0',
  `link_man` varchar(60) NOT NULL DEFAULT '',
  `link_email` varchar(60) NOT NULL DEFAULT '',
  `link_phone` varchar(60) NOT NULL DEFAULT '',
  `click_count` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `enabled` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`ad_id`),
  KEY `position_id` (`position_id`),
  KEY `enabled` (`enabled`)
) ENGINE=MyISAM AUTO_INCREMENT=194 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `abs_admin_action`
-- ----------------------------
DROP TABLE IF EXISTS `abs_admin_action`;
CREATE TABLE `abs_admin_action` (
  `action_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `action_code` varchar(20) NOT NULL DEFAULT '',
  `relevance` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`action_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=136 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `abs_admin_log`
-- ----------------------------
DROP TABLE IF EXISTS `abs_admin_log`;
CREATE TABLE `abs_admin_log` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `log_time` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `log_info` varchar(255) NOT NULL DEFAULT '',
  `ip_address` varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`log_id`),
  KEY `log_time` (`log_time`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `abs_admin_message`
-- ----------------------------
DROP TABLE IF EXISTS `abs_admin_message`;
CREATE TABLE `abs_admin_message` (
  `message_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `receiver_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `sent_time` int(11) unsigned NOT NULL DEFAULT '0',
  `read_time` int(11) unsigned NOT NULL DEFAULT '0',
  `readed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `title` varchar(150) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  PRIMARY KEY (`message_id`),
  KEY `sender_id` (`sender_id`,`receiver_id`),
  KEY `receiver_id` (`receiver_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `abs_admin_user`
-- ----------------------------
DROP TABLE IF EXISTS `abs_admin_user`;
CREATE TABLE `abs_admin_user` (
  `user_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(60) NOT NULL DEFAULT '',
  `email` varchar(60) NOT NULL DEFAULT '',
  `password` varchar(32) NOT NULL DEFAULT '',
  `ec_salt` varchar(10) DEFAULT NULL,
  `add_time` int(11) NOT NULL DEFAULT '0',
  `last_login` int(11) NOT NULL DEFAULT '0',
  `last_ip` varchar(15) NOT NULL DEFAULT '',
  `action_list` text NOT NULL,
  `nav_list` text NOT NULL,
  `lang_type` varchar(50) NOT NULL DEFAULT '',
  `agency_id` smallint(5) unsigned NOT NULL,
  `suppliers_id` smallint(5) unsigned DEFAULT '0',
  `todolist` longtext,
  `role_id` smallint(5) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `user_name` (`user_name`),
  KEY `agency_id` (`agency_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `abs_adsense`
-- ----------------------------
DROP TABLE IF EXISTS `abs_adsense`;
CREATE TABLE `abs_adsense` (
  `from_ad` smallint(5) NOT NULL DEFAULT '0',
  `referer` varchar(255) NOT NULL DEFAULT '',
  `clicks` int(10) unsigned NOT NULL DEFAULT '0',
  KEY `from_ad` (`from_ad`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `abs_ad_custom`
-- ----------------------------
DROP TABLE IF EXISTS `abs_ad_custom`;
CREATE TABLE `abs_ad_custom` (
  `ad_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `ad_type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `ad_name` varchar(60) DEFAULT NULL,
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  `content` mediumtext,
  `url` varchar(255) DEFAULT NULL,
  `ad_status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ad_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `abs_ad_position`
-- ----------------------------
DROP TABLE IF EXISTS `abs_ad_position`;
CREATE TABLE `abs_ad_position` (
  `position_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `position_name` varchar(60) NOT NULL DEFAULT '',
  `ad_width` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ad_height` smallint(5) unsigned NOT NULL DEFAULT '0',
  `position_desc` varchar(255) NOT NULL DEFAULT '',
  `position_style` text NOT NULL,
  PRIMARY KEY (`position_id`)
) ENGINE=MyISAM AUTO_INCREMENT=160 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `abs_affiliate_log`
-- ----------------------------
DROP TABLE IF EXISTS `abs_affiliate_log`;
CREATE TABLE `abs_affiliate_log` (
  `log_id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `order_id` mediumint(8) NOT NULL,
  `time` int(10) NOT NULL,
  `user_id` mediumint(8) NOT NULL,
  `user_name` varchar(60) DEFAULT NULL,
  `money` decimal(10,2) NOT NULL DEFAULT '0.00',
  `point` int(10) NOT NULL DEFAULT '0',
  `separate_type` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`log_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `abs_agency`
-- ----------------------------
DROP TABLE IF EXISTS `abs_agency`;
CREATE TABLE `abs_agency` (
  `agency_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `agency_name` varchar(255) NOT NULL,
  `agency_desc` text NOT NULL,
  PRIMARY KEY (`agency_id`),
  KEY `agency_name` (`agency_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `abs_area_region`
-- ----------------------------
DROP TABLE IF EXISTS `abs_area_region`;
CREATE TABLE `abs_area_region` (
  `shipping_area_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `region_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`shipping_area_id`,`region_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `abs_article`
-- ----------------------------
DROP TABLE IF EXISTS `abs_article`;
CREATE TABLE `abs_article` (
  `article_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `cat_id` smallint(5) NOT NULL DEFAULT '0',
  `title` varchar(150) NOT NULL DEFAULT '',
  `content` longtext NOT NULL,
  `author` varchar(30) NOT NULL DEFAULT '',
  `author_email` varchar(60) NOT NULL DEFAULT '',
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `article_type` tinyint(1) unsigned NOT NULL DEFAULT '2',
  `is_open` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  `file_url` varchar(255) NOT NULL DEFAULT '',
  `open_type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `link` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`article_id`),
  KEY `cat_id` (`cat_id`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `abs_article_cat`
-- ----------------------------
DROP TABLE IF EXISTS `abs_article_cat`;
CREATE TABLE `abs_article_cat` (
  `cat_id` smallint(5) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(255) NOT NULL DEFAULT '',
  `cat_type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `cat_desc` varchar(255) NOT NULL DEFAULT '',
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '50',
  `show_in_nav` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `parent_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cat_id`),
  KEY `cat_type` (`cat_type`),
  KEY `sort_order` (`sort_order`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `abs_attribute`
-- ----------------------------
DROP TABLE IF EXISTS `abs_attribute`;
CREATE TABLE `abs_attribute` (
  `attr_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `cat_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `attr_name` varchar(60) NOT NULL DEFAULT '',
  `attr_input_type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `attr_type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `attr_values` text NOT NULL,
  `attr_index` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `is_linked` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `attr_group` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`attr_id`),
  KEY `cat_id` (`cat_id`)
) ENGINE=MyISAM AUTO_INCREMENT=211 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `abs_auction_log`
-- ----------------------------
DROP TABLE IF EXISTS `abs_auction_log`;
CREATE TABLE `abs_auction_log` (
  `log_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `act_id` mediumint(8) unsigned NOT NULL,
  `bid_user` mediumint(8) unsigned NOT NULL,
  `bid_price` decimal(10,2) unsigned NOT NULL,
  `bid_time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`log_id`),
  KEY `act_id` (`act_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `abs_auto_manage`
-- ----------------------------
DROP TABLE IF EXISTS `abs_auto_manage`;
CREATE TABLE `abs_auto_manage` (
  `item_id` mediumint(8) NOT NULL,
  `type` varchar(10) NOT NULL,
  `starttime` int(10) NOT NULL,
  `endtime` int(10) NOT NULL,
  PRIMARY KEY (`item_id`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `abs_back_goods`
-- ----------------------------
DROP TABLE IF EXISTS `abs_back_goods`;
CREATE TABLE `abs_back_goods` (
  `rec_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `back_id` mediumint(8) unsigned DEFAULT '0',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `product_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `product_sn` varchar(60) DEFAULT NULL,
  `goods_name` varchar(120) DEFAULT NULL,
  `brand_name` varchar(60) DEFAULT NULL,
  `goods_sn` varchar(60) DEFAULT NULL,
  `is_real` tinyint(1) unsigned DEFAULT '0',
  `send_number` smallint(5) unsigned DEFAULT '0',
  `goods_attr` text,
  PRIMARY KEY (`rec_id`),
  KEY `back_id` (`back_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `abs_back_order`
-- ----------------------------
DROP TABLE IF EXISTS `abs_back_order`;
CREATE TABLE `abs_back_order` (
  `back_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `delivery_sn` varchar(20) NOT NULL,
  `order_sn` varchar(20) NOT NULL,
  `order_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `invoice_no` varchar(50) DEFAULT NULL,
  `add_time` int(10) unsigned DEFAULT '0',
  `shipping_id` tinyint(3) unsigned DEFAULT '0',
  `shipping_name` varchar(120) DEFAULT NULL,
  `user_id` mediumint(8) unsigned DEFAULT '0',
  `action_user` varchar(30) DEFAULT NULL,
  `consignee` varchar(60) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `country` smallint(5) unsigned DEFAULT '0',
  `province` smallint(5) unsigned DEFAULT '0',
  `city` smallint(5) unsigned DEFAULT '0',
  `district` smallint(5) unsigned DEFAULT '0',
  `sign_building` varchar(120) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `zipcode` varchar(60) DEFAULT NULL,
  `tel` varchar(60) DEFAULT NULL,
  `mobile` varchar(60) DEFAULT NULL,
  `best_time` varchar(120) DEFAULT NULL,
  `postscript` varchar(255) DEFAULT NULL,
  `how_oos` varchar(120) DEFAULT NULL,
  `insure_fee` decimal(10,2) unsigned DEFAULT '0.00',
  `shipping_fee` decimal(10,2) unsigned DEFAULT '0.00',
  `update_time` int(10) unsigned DEFAULT '0',
  `suppliers_id` smallint(5) DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `return_time` int(10) unsigned DEFAULT '0',
  `agency_id` smallint(5) unsigned DEFAULT '0',
  PRIMARY KEY (`back_id`),
  KEY `user_id` (`user_id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `abs_bonus_type`
-- ----------------------------
DROP TABLE IF EXISTS `abs_bonus_type`;
CREATE TABLE `abs_bonus_type` (
  `type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `type_name` varchar(60) NOT NULL DEFAULT '',
  `type_money` decimal(10,2) NOT NULL DEFAULT '0.00',
  `send_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `min_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `max_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `send_start_date` int(11) NOT NULL DEFAULT '0',
  `send_end_date` int(11) NOT NULL DEFAULT '0',
  `use_start_date` int(11) NOT NULL DEFAULT '0',
  `use_end_date` int(11) NOT NULL DEFAULT '0',
  `min_goods_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `abs_booking_goods`
-- ----------------------------
DROP TABLE IF EXISTS `abs_booking_goods`;
CREATE TABLE `abs_booking_goods` (
  `rec_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `email` varchar(60) NOT NULL DEFAULT '',
  `link_man` varchar(60) NOT NULL DEFAULT '',
  `tel` varchar(60) NOT NULL DEFAULT '',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_desc` varchar(255) NOT NULL DEFAULT '',
  `goods_number` smallint(5) unsigned NOT NULL DEFAULT '0',
  `booking_time` int(10) unsigned NOT NULL DEFAULT '0',
  `is_dispose` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dispose_user` varchar(30) NOT NULL DEFAULT '',
  `dispose_time` int(10) unsigned NOT NULL DEFAULT '0',
  `dispose_note` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`rec_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `abs_brand`
-- ----------------------------
DROP TABLE IF EXISTS `abs_brand`;
CREATE TABLE `abs_brand` (
  `brand_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(60) NOT NULL DEFAULT '',
  `brand_logo` varchar(80) NOT NULL DEFAULT '',
  `brand_desc` text NOT NULL,
  `site_url` varchar(255) NOT NULL DEFAULT '',
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '50',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`brand_id`),
  KEY `is_show` (`is_show`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `abs_card`
-- ----------------------------
DROP TABLE IF EXISTS `abs_card`;
CREATE TABLE `abs_card` (
  `card_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `card_name` varchar(120) NOT NULL DEFAULT '',
  `card_img` varchar(255) NOT NULL DEFAULT '',
  `card_fee` decimal(6,2) unsigned NOT NULL DEFAULT '0.00',
  `free_money` decimal(6,2) unsigned NOT NULL DEFAULT '0.00',
  `card_desc` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`card_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `abs_cart`
-- ----------------------------
DROP TABLE IF EXISTS `abs_cart`;
CREATE TABLE `abs_cart` (
  `rec_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `session_id` char(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_sn` varchar(60) NOT NULL DEFAULT '',
  `product_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_name` varchar(120) NOT NULL DEFAULT '',
  `market_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `goods_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `goods_number` smallint(5) unsigned NOT NULL DEFAULT '0',
  `goods_attr` text NOT NULL,
  `is_real` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `extension_code` varchar(30) NOT NULL DEFAULT '',
  `parent_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `rec_type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_gift` smallint(5) unsigned NOT NULL DEFAULT '0',
  `is_shipping` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `can_handsel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `goods_attr_id` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`rec_id`),
  KEY `session_id` (`session_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `abs_category`
-- ----------------------------
DROP TABLE IF EXISTS `abs_category`;
CREATE TABLE `abs_category` (
  `cat_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(90) NOT NULL DEFAULT '',
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `cat_desc` varchar(255) NOT NULL DEFAULT '',
  `parent_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `sort_order` tinyint(1) unsigned NOT NULL DEFAULT '50',
  `template_file` varchar(50) NOT NULL DEFAULT '',
  `measure_unit` varchar(15) NOT NULL DEFAULT '',
  `show_in_nav` tinyint(1) NOT NULL DEFAULT '0',
  `style` varchar(150) NOT NULL,
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `grade` tinyint(4) NOT NULL DEFAULT '0',
  `filter_attr` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cat_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=683 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `abs_cat_recommend`
-- ----------------------------
DROP TABLE IF EXISTS `abs_cat_recommend`;
CREATE TABLE `abs_cat_recommend` (
  `cat_id` smallint(5) NOT NULL,
  `recommend_type` tinyint(1) NOT NULL,
  PRIMARY KEY (`cat_id`,`recommend_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `abs_collect_goods`
-- ----------------------------
DROP TABLE IF EXISTS `abs_collect_goods`;
CREATE TABLE `abs_collect_goods` (
  `rec_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0',
  `is_attention` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rec_id`),
  KEY `user_id` (`user_id`),
  KEY `goods_id` (`goods_id`),
  KEY `is_attention` (`is_attention`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `abs_comment`
-- ----------------------------
DROP TABLE IF EXISTS `abs_comment`;
CREATE TABLE `abs_comment` (
  `comment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `comment_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `id_value` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `email` varchar(60) NOT NULL DEFAULT '',
  `user_name` varchar(60) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `comment_rank` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  `ip_address` varchar(15) NOT NULL DEFAULT '',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_id`),
  KEY `parent_id` (`parent_id`),
  KEY `id_value` (`id_value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `abs_crons`
-- ----------------------------
DROP TABLE IF EXISTS `abs_crons`;
CREATE TABLE `abs_crons` (
  `cron_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `cron_code` varchar(20) NOT NULL,
  `cron_name` varchar(120) NOT NULL,
  `cron_desc` text,
  `cron_order` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `cron_config` text NOT NULL,
  `thistime` int(10) NOT NULL DEFAULT '0',
  `nextime` int(10) NOT NULL,
  `day` tinyint(2) NOT NULL,
  `week` varchar(1) NOT NULL,
  `hour` varchar(2) NOT NULL,
  `minute` varchar(255) NOT NULL,
  `enable` tinyint(1) NOT NULL DEFAULT '1',
  `run_once` tinyint(1) NOT NULL DEFAULT '0',
  `allow_ip` varchar(100) NOT NULL DEFAULT '',
  `alow_files` varchar(255) NOT NULL,
  PRIMARY KEY (`cron_id`),
  KEY `nextime` (`nextime`),
  KEY `enable` (`enable`),
  KEY `cron_code` (`cron_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `abs_delivery_goods`
-- ----------------------------
DROP TABLE IF EXISTS `abs_delivery_goods`;
CREATE TABLE `abs_delivery_goods` (
  `rec_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `delivery_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `product_id` mediumint(8) unsigned DEFAULT '0',
  `product_sn` varchar(60) DEFAULT NULL,
  `goods_name` varchar(120) DEFAULT NULL,
  `brand_name` varchar(60) DEFAULT NULL,
  `goods_sn` varchar(60) DEFAULT NULL,
  `is_real` tinyint(1) unsigned DEFAULT '0',
  `extension_code` varchar(30) DEFAULT NULL,
  `parent_id` mediumint(8) unsigned DEFAULT '0',
  `send_number` smallint(5) unsigned DEFAULT '0',
  `goods_attr` text,
  PRIMARY KEY (`rec_id`),
  KEY `delivery_id` (`delivery_id`,`goods_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `abs_delivery_order`
-- ----------------------------
DROP TABLE IF EXISTS `abs_delivery_order`;
CREATE TABLE `abs_delivery_order` (
  `delivery_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `delivery_sn` varchar(20) NOT NULL,
  `order_sn` varchar(20) NOT NULL,
  `order_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `invoice_no` varchar(50) DEFAULT NULL,
  `add_time` int(10) unsigned DEFAULT '0',
  `shipping_id` tinyint(3) unsigned DEFAULT '0',
  `shipping_name` varchar(120) DEFAULT NULL,
  `user_id` mediumint(8) unsigned DEFAULT '0',
  `action_user` varchar(30) DEFAULT NULL,
  `consignee` varchar(60) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `country` smallint(5) unsigned DEFAULT '0',
  `province` smallint(5) unsigned DEFAULT '0',
  `city` smallint(5) unsigned DEFAULT '0',
  `district` smallint(5) unsigned DEFAULT '0',
  `sign_building` varchar(120) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `zipcode` varchar(60) DEFAULT NULL,
  `tel` varchar(60) DEFAULT NULL,
  `mobile` varchar(60) DEFAULT NULL,
  `best_time` varchar(120) DEFAULT NULL,
  `postscript` varchar(255) DEFAULT NULL,
  `how_oos` varchar(120) DEFAULT NULL,
  `insure_fee` decimal(10,2) unsigned DEFAULT '0.00',
  `shipping_fee` decimal(10,2) unsigned DEFAULT '0.00',
  `update_time` int(10) unsigned DEFAULT '0',
  `suppliers_id` smallint(5) DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `agency_id` smallint(5) unsigned DEFAULT '0',
  PRIMARY KEY (`delivery_id`),
  KEY `user_id` (`user_id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `abs_email_list`
-- ----------------------------
DROP TABLE IF EXISTS `abs_email_list`;
CREATE TABLE `abs_email_list` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `email` varchar(60) NOT NULL,
  `stat` tinyint(1) NOT NULL DEFAULT '0',
  `hash` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `abs_email_sendlist`
-- ----------------------------
DROP TABLE IF EXISTS `abs_email_sendlist`;
CREATE TABLE `abs_email_sendlist` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `template_id` mediumint(8) NOT NULL,
  `email_content` text NOT NULL,
  `error` tinyint(1) NOT NULL DEFAULT '0',
  `pri` tinyint(10) NOT NULL,
  `last_send` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `abs_error_log`
-- ----------------------------
DROP TABLE IF EXISTS `abs_error_log`;
CREATE TABLE `abs_error_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `info` varchar(255) NOT NULL,
  `file` varchar(100) NOT NULL,
  `time` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `time` (`time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `abs_exchange_goods`
-- ----------------------------
DROP TABLE IF EXISTS `abs_exchange_goods`;
CREATE TABLE `abs_exchange_goods` (
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `exchange_integral` int(10) unsigned NOT NULL DEFAULT '0',
  `is_exchange` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_hot` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`goods_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `abs_favourable_activity`
-- ----------------------------
DROP TABLE IF EXISTS `abs_favourable_activity`;
CREATE TABLE `abs_favourable_activity` (
  `act_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `act_name` varchar(255) NOT NULL,
  `start_time` int(10) unsigned NOT NULL,
  `end_time` int(10) unsigned NOT NULL,
  `user_rank` varchar(255) NOT NULL,
  `act_range` tinyint(3) unsigned NOT NULL,
  `act_range_ext` varchar(255) NOT NULL,
  `min_amount` decimal(10,2) unsigned NOT NULL,
  `max_amount` decimal(10,2) unsigned NOT NULL,
  `act_type` tinyint(3) unsigned NOT NULL,
  `act_type_ext` decimal(10,2) unsigned NOT NULL,
  `gift` text NOT NULL,
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '50',
  PRIMARY KEY (`act_id`),
  KEY `act_name` (`act_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `abs_feedback`
-- ----------------------------
DROP TABLE IF EXISTS `abs_feedback`;
CREATE TABLE `abs_feedback` (
  `msg_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_name` varchar(60) NOT NULL DEFAULT '',
  `user_email` varchar(60) NOT NULL DEFAULT '',
  `msg_title` varchar(200) NOT NULL DEFAULT '',
  `msg_type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `msg_status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `msg_content` text NOT NULL,
  `msg_time` int(10) unsigned NOT NULL DEFAULT '0',
  `message_img` varchar(255) NOT NULL DEFAULT '0',
  `order_id` int(11) unsigned NOT NULL DEFAULT '0',
  `msg_area` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`msg_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `abs_friend_link`
-- ----------------------------
DROP TABLE IF EXISTS `abs_friend_link`;
CREATE TABLE `abs_friend_link` (
  `link_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `link_name` varchar(255) NOT NULL DEFAULT '',
  `link_url` varchar(255) NOT NULL DEFAULT '',
  `link_logo` varchar(255) NOT NULL DEFAULT '',
  `show_order` tinyint(3) unsigned NOT NULL DEFAULT '50',
  PRIMARY KEY (`link_id`),
  KEY `show_order` (`show_order`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `abs_goods`
-- ----------------------------
DROP TABLE IF EXISTS `abs_goods`;
CREATE TABLE `abs_goods` (
  `goods_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `cat_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `goods_sn` varchar(60) NOT NULL DEFAULT '',
  `goods_name` varchar(120) NOT NULL DEFAULT '',
  `goods_name_style` varchar(60) NOT NULL DEFAULT '+',
  `click_count` int(10) unsigned NOT NULL DEFAULT '0',
  `brand_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `provider_name` varchar(100) NOT NULL DEFAULT '',
  `goods_number` smallint(5) unsigned NOT NULL DEFAULT '0',
  `goods_weight` decimal(10,3) unsigned NOT NULL DEFAULT '0.000',
  `market_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `shop_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `promote_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `promote_start_date` int(11) unsigned NOT NULL DEFAULT '0',
  `promote_end_date` int(11) unsigned NOT NULL DEFAULT '0',
  `warn_number` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `goods_brief` varchar(255) NOT NULL DEFAULT '',
  `goods_desc` text NOT NULL,
  `goods_thumb` varchar(255) NOT NULL DEFAULT '',
  `goods_img` varchar(255) NOT NULL DEFAULT '',
  `original_img` varchar(255) NOT NULL DEFAULT '',
  `is_real` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `extension_code` varchar(30) NOT NULL DEFAULT '',
  `is_on_sale` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `is_alone_sale` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `is_shipping` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `integral` int(10) unsigned NOT NULL DEFAULT '0',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  `sort_order` smallint(4) unsigned NOT NULL DEFAULT '100',
  `is_delete` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_best` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_new` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_hot` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_promote` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `bonus_type_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `last_update` int(10) unsigned NOT NULL DEFAULT '0',
  `goods_type` smallint(5) unsigned NOT NULL DEFAULT '0',
  `seller_note` varchar(255) NOT NULL DEFAULT '',
  `give_integral` int(11) NOT NULL DEFAULT '-1',
  `rank_integral` int(11) NOT NULL DEFAULT '-1',
  `suppliers_id` smallint(5) unsigned DEFAULT NULL,
  `is_check` tinyint(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`goods_id`),
  KEY `goods_sn` (`goods_sn`),
  KEY `cat_id` (`cat_id`),
  KEY `last_update` (`last_update`),
  KEY `brand_id` (`brand_id`),
  KEY `goods_weight` (`goods_weight`),
  KEY `promote_end_date` (`promote_end_date`),
  KEY `promote_start_date` (`promote_start_date`),
  KEY `goods_number` (`goods_number`),
  KEY `sort_order` (`sort_order`)
) ENGINE=MyISAM AUTO_INCREMENT=142 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `abs_goods_activity`
-- ----------------------------
DROP TABLE IF EXISTS `abs_goods_activity`;
CREATE TABLE `abs_goods_activity` (
  `act_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `act_name` varchar(255) NOT NULL,
  `act_desc` text NOT NULL,
  `act_type` tinyint(3) unsigned NOT NULL,
  `goods_id` mediumint(8) unsigned NOT NULL,
  `product_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_name` varchar(255) NOT NULL,
  `start_time` int(10) unsigned NOT NULL,
  `end_time` int(10) unsigned NOT NULL,
  `is_finished` tinyint(3) unsigned NOT NULL,
  `ext_info` text NOT NULL,
  PRIMARY KEY (`act_id`),
  KEY `act_name` (`act_name`,`act_type`,`goods_id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `abs_goods_article`
-- ----------------------------
DROP TABLE IF EXISTS `abs_goods_article`;
CREATE TABLE `abs_goods_article` (
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `article_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `admin_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`goods_id`,`article_id`,`admin_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `abs_goods_attr`
-- ----------------------------
DROP TABLE IF EXISTS `abs_goods_attr`;
CREATE TABLE `abs_goods_attr` (
  `goods_attr_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `attr_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `attr_value` text NOT NULL,
  `attr_price` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`goods_attr_id`),
  KEY `goods_id` (`goods_id`),
  KEY `attr_id` (`attr_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3791 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `abs_goods_cat`
-- ----------------------------
DROP TABLE IF EXISTS `abs_goods_cat`;
CREATE TABLE `abs_goods_cat` (
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `cat_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`goods_id`,`cat_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `abs_goods_gallery`
-- ----------------------------
DROP TABLE IF EXISTS `abs_goods_gallery`;
CREATE TABLE `abs_goods_gallery` (
  `img_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `img_url` varchar(255) NOT NULL DEFAULT '',
  `img_desc` varchar(255) NOT NULL DEFAULT '',
  `thumb_url` varchar(255) NOT NULL DEFAULT '',
  `img_original` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`img_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=MyISAM AUTO_INCREMENT=286 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `abs_goods_type`
-- ----------------------------
DROP TABLE IF EXISTS `abs_goods_type`;
CREATE TABLE `abs_goods_type` (
  `cat_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(60) NOT NULL DEFAULT '',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `attr_group` varchar(255) NOT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `abs_group_goods`
-- ----------------------------
DROP TABLE IF EXISTS `abs_group_goods`;
CREATE TABLE `abs_group_goods` (
  `parent_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `admin_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`parent_id`,`goods_id`,`admin_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `abs_keywords`
-- ----------------------------
DROP TABLE IF EXISTS `abs_keywords`;
CREATE TABLE `abs_keywords` (
  `date` date NOT NULL DEFAULT '0000-00-00',
  `searchengine` varchar(20) NOT NULL DEFAULT '',
  `keyword` varchar(90) NOT NULL DEFAULT '',
  `count` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`date`,`searchengine`,`keyword`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `abs_link_goods`
-- ----------------------------
DROP TABLE IF EXISTS `abs_link_goods`;
CREATE TABLE `abs_link_goods` (
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `link_goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `is_double` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `admin_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`goods_id`,`link_goods_id`,`admin_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `abs_mail_templates`
-- ----------------------------
DROP TABLE IF EXISTS `abs_mail_templates`;
CREATE TABLE `abs_mail_templates` (
  `template_id` tinyint(1) unsigned NOT NULL AUTO_INCREMENT,
  `template_code` varchar(30) NOT NULL DEFAULT '',
  `is_html` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `template_subject` varchar(200) NOT NULL DEFAULT '',
  `template_content` text NOT NULL,
  `last_modify` int(10) unsigned NOT NULL DEFAULT '0',
  `last_send` int(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(10) NOT NULL,
  PRIMARY KEY (`template_id`),
  UNIQUE KEY `template_code` (`template_code`),
  KEY `type` (`type`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `abs_member_price`
-- ----------------------------
DROP TABLE IF EXISTS `abs_member_price`;
CREATE TABLE `abs_member_price` (
  `price_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_rank` tinyint(3) NOT NULL DEFAULT '0',
  `user_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`price_id`),
  KEY `goods_id` (`goods_id`,`user_rank`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `abs_nav`
-- ----------------------------
DROP TABLE IF EXISTS `abs_nav`;
CREATE TABLE `abs_nav` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `ctype` varchar(10) DEFAULT NULL,
  `cid` smallint(5) unsigned DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `ifshow` tinyint(1) NOT NULL,
  `vieworder` tinyint(1) NOT NULL,
  `opennew` tinyint(1) NOT NULL,
  `url` varchar(255) NOT NULL,
  `type` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `ifshow` (`ifshow`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `abs_order_action`
-- ----------------------------
DROP TABLE IF EXISTS `abs_order_action`;
CREATE TABLE `abs_order_action` (
  `action_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `action_user` varchar(30) NOT NULL DEFAULT '',
  `order_status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `shipping_status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pay_status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `action_place` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `action_note` varchar(255) NOT NULL DEFAULT '',
  `log_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`action_id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `abs_order_goods`
-- ----------------------------
DROP TABLE IF EXISTS `abs_order_goods`;
CREATE TABLE `abs_order_goods` (
  `rec_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_name` varchar(120) NOT NULL DEFAULT '',
  `goods_sn` varchar(60) NOT NULL DEFAULT '',
  `product_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_number` smallint(5) unsigned NOT NULL DEFAULT '1',
  `market_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `goods_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `goods_attr` text NOT NULL,
  `send_number` smallint(5) unsigned NOT NULL DEFAULT '0',
  `is_real` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `extension_code` varchar(30) NOT NULL DEFAULT '',
  `parent_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `is_gift` smallint(5) unsigned NOT NULL DEFAULT '0',
  `goods_attr_id` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`rec_id`),
  KEY `order_id` (`order_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `abs_order_info`
-- ----------------------------
DROP TABLE IF EXISTS `abs_order_info`;
CREATE TABLE `abs_order_info` (
  `order_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(20) NOT NULL DEFAULT '',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `order_status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `shipping_status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pay_status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `consignee` varchar(60) NOT NULL DEFAULT '',
  `country` smallint(5) unsigned NOT NULL DEFAULT '0',
  `province` smallint(5) unsigned NOT NULL DEFAULT '0',
  `city` smallint(5) unsigned NOT NULL DEFAULT '0',
  `district` smallint(5) unsigned NOT NULL DEFAULT '0',
  `address` varchar(255) NOT NULL DEFAULT '',
  `zipcode` varchar(60) NOT NULL DEFAULT '',
  `tel` varchar(60) NOT NULL DEFAULT '',
  `mobile` varchar(60) NOT NULL DEFAULT '',
  `email` varchar(60) NOT NULL DEFAULT '',
  `best_time` varchar(120) NOT NULL DEFAULT '',
  `sign_building` varchar(120) NOT NULL DEFAULT '',
  `postscript` varchar(255) NOT NULL DEFAULT '',
  `shipping_id` tinyint(3) NOT NULL DEFAULT '0',
  `shipping_name` varchar(120) NOT NULL DEFAULT '',
  `pay_id` tinyint(3) NOT NULL DEFAULT '0',
  `pay_name` varchar(120) NOT NULL DEFAULT '',
  `how_oos` varchar(120) NOT NULL DEFAULT '',
  `how_surplus` varchar(120) NOT NULL DEFAULT '',
  `pack_name` varchar(120) NOT NULL DEFAULT '',
  `card_name` varchar(120) NOT NULL DEFAULT '',
  `card_message` varchar(255) NOT NULL DEFAULT '',
  `inv_payee` varchar(120) NOT NULL DEFAULT '',
  `inv_content` varchar(120) NOT NULL DEFAULT '',
  `goods_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `shipping_fee` decimal(10,2) NOT NULL DEFAULT '0.00',
  `insure_fee` decimal(10,2) NOT NULL DEFAULT '0.00',
  `pay_fee` decimal(10,2) NOT NULL DEFAULT '0.00',
  `pack_fee` decimal(10,2) NOT NULL DEFAULT '0.00',
  `card_fee` decimal(10,2) NOT NULL DEFAULT '0.00',
  `money_paid` decimal(10,2) NOT NULL DEFAULT '0.00',
  `surplus` decimal(10,2) NOT NULL DEFAULT '0.00',
  `integral` int(10) unsigned NOT NULL DEFAULT '0',
  `integral_money` decimal(10,2) NOT NULL DEFAULT '0.00',
  `bonus` decimal(10,2) NOT NULL DEFAULT '0.00',
  `order_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `from_ad` smallint(5) NOT NULL DEFAULT '0',
  `referer` varchar(255) NOT NULL DEFAULT '',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  `confirm_time` int(10) unsigned NOT NULL DEFAULT '0',
  `pay_time` int(10) unsigned NOT NULL DEFAULT '0',
  `shipping_time` int(10) unsigned NOT NULL DEFAULT '0',
  `pack_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `card_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `bonus_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `invoice_no` varchar(255) NOT NULL DEFAULT '',
  `extension_code` varchar(30) NOT NULL DEFAULT '',
  `extension_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `to_buyer` varchar(255) NOT NULL DEFAULT '',
  `pay_note` varchar(255) NOT NULL DEFAULT '',
  `agency_id` smallint(5) unsigned NOT NULL,
  `inv_type` varchar(60) NOT NULL,
  `tax` decimal(10,2) NOT NULL,
  `is_separate` tinyint(1) NOT NULL DEFAULT '0',
  `parent_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `discount` decimal(10,2) NOT NULL,
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `order_sn` (`order_sn`),
  KEY `user_id` (`user_id`),
  KEY `order_status` (`order_status`),
  KEY `shipping_status` (`shipping_status`),
  KEY `pay_status` (`pay_status`),
  KEY `shipping_id` (`shipping_id`),
  KEY `pay_id` (`pay_id`),
  KEY `extension_code` (`extension_code`,`extension_id`),
  KEY `agency_id` (`agency_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `abs_pack`
-- ----------------------------
DROP TABLE IF EXISTS `abs_pack`;
CREATE TABLE `abs_pack` (
  `pack_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `pack_name` varchar(120) NOT NULL DEFAULT '',
  `pack_img` varchar(255) NOT NULL DEFAULT '',
  `pack_fee` decimal(6,2) unsigned NOT NULL DEFAULT '0.00',
  `free_money` smallint(5) unsigned NOT NULL DEFAULT '0',
  `pack_desc` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`pack_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `abs_package_goods`
-- ----------------------------
DROP TABLE IF EXISTS `abs_package_goods`;
CREATE TABLE `abs_package_goods` (
  `package_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `product_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_number` smallint(5) unsigned NOT NULL DEFAULT '1',
  `admin_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`package_id`,`goods_id`,`admin_id`,`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `abs_payment`
-- ----------------------------
DROP TABLE IF EXISTS `abs_payment`;
CREATE TABLE `abs_payment` (
  `pay_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `pay_code` varchar(20) NOT NULL DEFAULT '',
  `pay_name` varchar(120) NOT NULL DEFAULT '',
  `pay_fee` varchar(10) NOT NULL DEFAULT '0',
  `pay_desc` text NOT NULL,
  `pay_order` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `pay_config` text NOT NULL,
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_cod` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_online` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`pay_id`),
  UNIQUE KEY `pay_code` (`pay_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `abs_pay_log`
-- ----------------------------
DROP TABLE IF EXISTS `abs_pay_log`;
CREATE TABLE `abs_pay_log` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `order_amount` decimal(10,2) unsigned NOT NULL,
  `order_type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_paid` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`log_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `abs_plugins`
-- ----------------------------
DROP TABLE IF EXISTS `abs_plugins`;
CREATE TABLE `abs_plugins` (
  `code` varchar(30) NOT NULL DEFAULT '',
  `version` varchar(10) NOT NULL DEFAULT '',
  `library` varchar(255) NOT NULL DEFAULT '',
  `assign` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `install_date` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `abs_products`
-- ----------------------------
DROP TABLE IF EXISTS `abs_products`;
CREATE TABLE `abs_products` (
  `product_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_attr` varchar(50) DEFAULT NULL,
  `product_sn` varchar(60) DEFAULT NULL,
  `product_number` smallint(5) unsigned DEFAULT '0',
  PRIMARY KEY (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `abs_region`
-- ----------------------------
DROP TABLE IF EXISTS `abs_region`;
CREATE TABLE `abs_region` (
  `region_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `region_name` varchar(120) NOT NULL DEFAULT '',
  `region_type` tinyint(1) NOT NULL DEFAULT '2',
  `agency_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`region_id`),
  KEY `parent_id` (`parent_id`),
  KEY `region_type` (`region_type`),
  KEY `agency_id` (`agency_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3409 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `abs_reg_extend_info`
-- ----------------------------
DROP TABLE IF EXISTS `abs_reg_extend_info`;
CREATE TABLE `abs_reg_extend_info` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL,
  `reg_field_id` int(10) unsigned NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `abs_reg_fields`
-- ----------------------------
DROP TABLE IF EXISTS `abs_reg_fields`;
CREATE TABLE `abs_reg_fields` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `reg_field_name` varchar(60) NOT NULL,
  `dis_order` tinyint(3) unsigned NOT NULL DEFAULT '100',
  `display` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_need` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `abs_role`
-- ----------------------------
DROP TABLE IF EXISTS `abs_role`;
CREATE TABLE `abs_role` (
  `role_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `role_name` varchar(60) NOT NULL DEFAULT '',
  `action_list` text NOT NULL,
  `role_describe` text,
  PRIMARY KEY (`role_id`),
  KEY `user_name` (`role_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `abs_searchengine`
-- ----------------------------
DROP TABLE IF EXISTS `abs_searchengine`;
CREATE TABLE `abs_searchengine` (
  `date` date NOT NULL DEFAULT '0000-00-00',
  `searchengine` varchar(20) NOT NULL DEFAULT '',
  `count` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`date`,`searchengine`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `abs_sessions`
-- ----------------------------
DROP TABLE IF EXISTS `abs_sessions`;
CREATE TABLE `abs_sessions` (
  `sesskey` char(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `expiry` int(10) unsigned NOT NULL DEFAULT '0',
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `adminid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ip` char(15) NOT NULL DEFAULT '',
  `user_name` varchar(60) NOT NULL,
  `user_rank` tinyint(3) NOT NULL,
  `discount` decimal(3,2) NOT NULL,
  `email` varchar(60) NOT NULL,
  `data` char(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`sesskey`),
  KEY `expiry` (`expiry`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `abs_sessions_data`
-- ----------------------------
DROP TABLE IF EXISTS `abs_sessions_data`;
CREATE TABLE `abs_sessions_data` (
  `sesskey` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `expiry` int(10) unsigned NOT NULL DEFAULT '0',
  `data` longtext NOT NULL,
  PRIMARY KEY (`sesskey`),
  KEY `expiry` (`expiry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `abs_shipping`
-- ----------------------------
DROP TABLE IF EXISTS `abs_shipping`;
CREATE TABLE `abs_shipping` (
  `shipping_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `shipping_code` varchar(20) NOT NULL DEFAULT '',
  `shipping_name` varchar(120) NOT NULL DEFAULT '',
  `shipping_desc` varchar(255) NOT NULL DEFAULT '',
  `insure` varchar(10) NOT NULL DEFAULT '0',
  `support_cod` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `shipping_print` text NOT NULL,
  `print_bg` varchar(255) DEFAULT NULL,
  `config_lable` text,
  `print_model` tinyint(1) DEFAULT '0',
  `shipping_order` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`shipping_id`),
  KEY `shipping_code` (`shipping_code`,`enabled`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `abs_shipping_area`
-- ----------------------------
DROP TABLE IF EXISTS `abs_shipping_area`;
CREATE TABLE `abs_shipping_area` (
  `shipping_area_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `shipping_area_name` varchar(150) NOT NULL DEFAULT '',
  `shipping_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `configure` text NOT NULL,
  PRIMARY KEY (`shipping_area_id`),
  KEY `shipping_id` (`shipping_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `abs_shop_config`
-- ----------------------------
DROP TABLE IF EXISTS `abs_shop_config`;
CREATE TABLE `abs_shop_config` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `code` varchar(30) NOT NULL DEFAULT '',
  `type` varchar(10) NOT NULL DEFAULT '',
  `store_range` varchar(255) NOT NULL DEFAULT '',
  `store_dir` varchar(255) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=904 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `abs_snatch_log`
-- ----------------------------
DROP TABLE IF EXISTS `abs_snatch_log`;
CREATE TABLE `abs_snatch_log` (
  `log_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `snatch_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `bid_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `bid_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`log_id`),
  KEY `snatch_id` (`snatch_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `abs_stats`
-- ----------------------------
DROP TABLE IF EXISTS `abs_stats`;
CREATE TABLE `abs_stats` (
  `access_time` int(10) unsigned NOT NULL DEFAULT '0',
  `ip_address` varchar(15) NOT NULL DEFAULT '',
  `visit_times` smallint(5) unsigned NOT NULL DEFAULT '1',
  `browser` varchar(60) NOT NULL DEFAULT '',
  `system` varchar(20) NOT NULL DEFAULT '',
  `language` varchar(20) NOT NULL DEFAULT '',
  `area` varchar(30) NOT NULL DEFAULT '',
  `referer_domain` varchar(100) NOT NULL DEFAULT '',
  `referer_path` varchar(200) NOT NULL DEFAULT '',
  `access_url` varchar(255) NOT NULL DEFAULT '',
  KEY `access_time` (`access_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `abs_suppliers`
-- ----------------------------
DROP TABLE IF EXISTS `abs_suppliers`;
CREATE TABLE `abs_suppliers` (
  `suppliers_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `suppliers_name` varchar(255) DEFAULT NULL,
  `suppliers_desc` mediumtext,
  `is_check` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`suppliers_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `abs_tag`
-- ----------------------------
DROP TABLE IF EXISTS `abs_tag`;
CREATE TABLE `abs_tag` (
  `tag_id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `tag_words` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`tag_id`),
  KEY `user_id` (`user_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `abs_template`
-- ----------------------------
DROP TABLE IF EXISTS `abs_template`;
CREATE TABLE `abs_template` (
  `filename` varchar(30) NOT NULL DEFAULT '',
  `region` varchar(40) NOT NULL DEFAULT '',
  `library` varchar(40) NOT NULL DEFAULT '',
  `sort_order` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `number` tinyint(1) unsigned NOT NULL DEFAULT '5',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `theme` varchar(60) NOT NULL DEFAULT '',
  `remarks` varchar(30) NOT NULL DEFAULT '',
  KEY `filename` (`filename`,`region`),
  KEY `theme` (`theme`),
  KEY `remarks` (`remarks`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `abs_topic`
-- ----------------------------
DROP TABLE IF EXISTS `abs_topic`;
CREATE TABLE `abs_topic` (
  `topic_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '''''',
  `intro` text NOT NULL,
  `start_time` int(11) NOT NULL DEFAULT '0',
  `end_time` int(10) NOT NULL DEFAULT '0',
  `data` text NOT NULL,
  `template` varchar(255) NOT NULL DEFAULT '''''',
  `css` text NOT NULL,
  `topic_img` varchar(255) DEFAULT NULL,
  `title_pic` varchar(255) DEFAULT NULL,
  `base_style` char(6) DEFAULT NULL,
  `htmls` mediumtext,
  `keywords` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  KEY `topic_id` (`topic_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `abs_users`
-- ----------------------------
DROP TABLE IF EXISTS `abs_users`;
CREATE TABLE `abs_users` (
  `user_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(60) NOT NULL DEFAULT '',
  `user_name` varchar(60) NOT NULL DEFAULT '',
  `password` varchar(32) NOT NULL DEFAULT '',
  `question` varchar(255) NOT NULL DEFAULT '',
  `answer` varchar(255) NOT NULL DEFAULT '',
  `sex` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `birthday` date NOT NULL DEFAULT '0000-00-00',
  `user_money` decimal(10,2) NOT NULL DEFAULT '0.00',
  `frozen_money` decimal(10,2) NOT NULL DEFAULT '0.00',
  `pay_points` int(10) unsigned NOT NULL DEFAULT '0',
  `rank_points` int(10) unsigned NOT NULL DEFAULT '0',
  `address_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0',
  `last_login` int(11) unsigned NOT NULL DEFAULT '0',
  `last_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_ip` varchar(15) NOT NULL DEFAULT '',
  `visit_count` smallint(5) unsigned NOT NULL DEFAULT '0',
  `user_rank` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `is_special` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ec_salt` varchar(10) DEFAULT NULL,
  `salt` varchar(10) NOT NULL DEFAULT '0',
  `parent_id` mediumint(9) NOT NULL DEFAULT '0',
  `flag` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `alias` varchar(60) NOT NULL,
  `msn` varchar(60) NOT NULL,
  `qq` varchar(20) NOT NULL,
  `office_phone` varchar(20) NOT NULL,
  `home_phone` varchar(20) NOT NULL,
  `mobile_phone` varchar(20) NOT NULL,
  `is_validated` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `credit_line` decimal(10,2) unsigned NOT NULL,
  `passwd_question` varchar(50) DEFAULT NULL,
  `passwd_answer` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_name` (`user_name`),
  KEY `email` (`email`),
  KEY `parent_id` (`parent_id`),
  KEY `flag` (`flag`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `abs_user_account`
-- ----------------------------
DROP TABLE IF EXISTS `abs_user_account`;
CREATE TABLE `abs_user_account` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `admin_user` varchar(255) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `add_time` int(10) NOT NULL DEFAULT '0',
  `paid_time` int(10) NOT NULL DEFAULT '0',
  `admin_note` varchar(255) NOT NULL,
  `user_note` varchar(255) NOT NULL,
  `process_type` tinyint(1) NOT NULL DEFAULT '0',
  `payment` varchar(90) NOT NULL,
  `is_paid` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `is_paid` (`is_paid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `abs_user_address`
-- ----------------------------
DROP TABLE IF EXISTS `abs_user_address`;
CREATE TABLE `abs_user_address` (
  `address_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `address_name` varchar(50) NOT NULL DEFAULT '',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `consignee` varchar(60) NOT NULL DEFAULT '',
  `email` varchar(60) NOT NULL DEFAULT '',
  `country` smallint(5) NOT NULL DEFAULT '0',
  `province` smallint(5) NOT NULL DEFAULT '0',
  `city` smallint(5) NOT NULL DEFAULT '0',
  `district` smallint(5) NOT NULL DEFAULT '0',
  `address` varchar(120) NOT NULL DEFAULT '',
  `zipcode` varchar(60) NOT NULL DEFAULT '',
  `tel` varchar(60) NOT NULL DEFAULT '',
  `mobile` varchar(60) NOT NULL DEFAULT '',
  `sign_building` varchar(120) NOT NULL DEFAULT '',
  `best_time` varchar(120) NOT NULL DEFAULT '',
  PRIMARY KEY (`address_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `abs_user_bonus`
-- ----------------------------
DROP TABLE IF EXISTS `abs_user_bonus`;
CREATE TABLE `abs_user_bonus` (
  `bonus_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `bonus_type_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `bonus_sn` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `used_time` int(10) unsigned NOT NULL DEFAULT '0',
  `order_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `emailed` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`bonus_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `abs_user_feed`
-- ----------------------------
DROP TABLE IF EXISTS `abs_user_feed`;
CREATE TABLE `abs_user_feed` (
  `feed_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `value_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `feed_type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_feed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`feed_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `abs_user_rank`
-- ----------------------------
DROP TABLE IF EXISTS `abs_user_rank`;
CREATE TABLE `abs_user_rank` (
  `rank_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `rank_name` varchar(30) NOT NULL DEFAULT '',
  `min_points` int(10) unsigned NOT NULL DEFAULT '0',
  `max_points` int(10) unsigned NOT NULL DEFAULT '0',
  `discount` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `show_price` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `special_rank` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`rank_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `abs_virtual_card`
-- ----------------------------
DROP TABLE IF EXISTS `abs_virtual_card`;
CREATE TABLE `abs_virtual_card` (
  `card_id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `card_sn` varchar(60) NOT NULL DEFAULT '',
  `card_password` varchar(60) NOT NULL DEFAULT '',
  `add_date` int(11) NOT NULL DEFAULT '0',
  `end_date` int(11) NOT NULL DEFAULT '0',
  `is_saled` tinyint(1) NOT NULL DEFAULT '0',
  `order_sn` varchar(20) NOT NULL DEFAULT '',
  `crc32` varchar(12) NOT NULL DEFAULT '0',
  PRIMARY KEY (`card_id`),
  KEY `goods_id` (`goods_id`),
  KEY `car_sn` (`card_sn`),
  KEY `is_saled` (`is_saled`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `abs_volume_price`
-- ----------------------------
DROP TABLE IF EXISTS `abs_volume_price`;
CREATE TABLE `abs_volume_price` (
  `price_type` tinyint(1) unsigned NOT NULL,
  `goods_id` mediumint(8) unsigned NOT NULL,
  `volume_number` smallint(5) unsigned NOT NULL DEFAULT '0',
  `volume_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`price_type`,`goods_id`,`volume_number`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `abs_vote`
-- ----------------------------
DROP TABLE IF EXISTS `abs_vote`;
CREATE TABLE `abs_vote` (
  `vote_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `vote_name` varchar(250) NOT NULL DEFAULT '',
  `start_time` int(11) unsigned NOT NULL DEFAULT '0',
  `end_time` int(11) unsigned NOT NULL DEFAULT '0',
  `can_multi` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `vote_count` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`vote_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `abs_vote_log`
-- ----------------------------
DROP TABLE IF EXISTS `abs_vote_log`;
CREATE TABLE `abs_vote_log` (
  `log_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `vote_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ip_address` varchar(15) NOT NULL DEFAULT '',
  `vote_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`log_id`),
  KEY `vote_id` (`vote_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `abs_vote_option`
-- ----------------------------
DROP TABLE IF EXISTS `abs_vote_option`;
CREATE TABLE `abs_vote_option` (
  `option_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `vote_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `option_name` varchar(250) NOT NULL DEFAULT '',
  `option_count` int(8) unsigned NOT NULL DEFAULT '0',
  `option_order` tinyint(3) unsigned NOT NULL DEFAULT '100',
  PRIMARY KEY (`option_id`),
  KEY `vote_id` (`vote_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `abs_wholesale`
-- ----------------------------
DROP TABLE IF EXISTS `abs_wholesale`;
CREATE TABLE `abs_wholesale` (
  `act_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` mediumint(8) unsigned NOT NULL,
  `goods_name` varchar(255) NOT NULL,
  `rank_ids` varchar(255) NOT NULL,
  `prices` text NOT NULL,
  `enabled` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`act_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records 
-- ----------------------------
INSERT INTO `abs_ad` VALUES ('193','159','0','首页左侧广告','http://163.com','1413916122102071507.png','1381219200','1983427200','','','','2','1');
INSERT INTO `abs_admin_action` VALUES ('1','0','goods',''), ('2','0','cms_manage',''), ('3','0','users_manage',''), ('4','0','priv_manage',''), ('5','0','sys_manage',''), ('6','0','order_manage',''), ('7','0','promotion',''), ('8','0','email',''), ('9','0','templates_manage',''), ('10','0','db_manage',''), ('11','0','sms_manage',''), ('21','1','goods_manage',''), ('22','1','remove_back',''), ('23','1','cat_manage',''), ('24','1','cat_drop','cat_manage'), ('25','1','attr_manage',''), ('26','1','brand_manage',''), ('27','1','comment_priv',''), ('84','1','tag_manage',''), ('30','2','article_cat',''), ('31','2','article_manage',''), ('32','2','shopinfo_manage',''), ('33','2','shophelp_manage',''), ('34','2','vote_priv',''), ('35','7','topic_manage',''), ('74','4','template_manage',''), ('73','3','feedback_priv',''), ('38','3','integrate_users',''), ('39','3','sync_users','integrate_users'), ('40','3','users_manage',''), ('41','3','users_drop','users_manage'), ('42','3','user_rank',''), ('85','3','surplus_manage','account_manage'), ('43','4','admin_manage',''), ('44','4','admin_drop','admin_manage'), ('45','4','allot_priv','admin_manage'), ('46','4','logs_manage',''), ('47','4','logs_drop','logs_manage'), ('48','5','shop_config',''), ('49','5','ship_manage',''), ('50','5','payment',''), ('51','5','shiparea_manage',''), ('52','5','area_manage',''), ('53','6','order_os_edit',''), ('54','6','order_ps_edit','order_os_edit'), ('55','6','order_ss_edit','order_os_edit'), ('56','6','order_edit','order_os_edit'), ('57','6','order_view',''), ('58','6','order_view_finished',''), ('59','6','repay_manage',''), ('60','6','booking',''), ('61','6','sale_order_stats',''), ('62','6','client_flow_stats',''), ('78','7','snatch_manage',''), ('83','7','ad_manage',''), ('80','7','gift_manage',''), ('81','7','card_manage',''), ('70','1','goods_type',''), ('82','7','pack',''), ('79','7','bonus_manage',''), ('75','5','friendlink',''), ('76','5','db_backup',''), ('77','5','db_renew','db_backup'), ('86','4','agency_manage',''), ('87','3','account_manage',''), ('88','5','flash_manage',''), ('89','5','navigator',''), ('90','7','auction',''), ('91','7','group_by',''), ('92','7','favourable',''), ('93','7','whole_sale',''), ('94','1','goods_auto',''), ('95','2','article_auto',''), ('96','5','cron',''), ('97','5','affiliate',''), ('98','5','affiliate_ck',''), ('99','8','attention_list',''), ('100','8','email_list',''), ('101','8','magazine_list',''), ('102','8','view_sendlist',''), ('103','1','virualcard',''), ('104','7','package_manage',''), ('105','1','picture_batch',''), ('106','1','goods_export',''), ('107','1','goods_batch',''), ('108','1','gen_goods_script',''), ('109','5','sitemap',''), ('110','5','file_priv',''), ('111','5','file_check',''), ('112','9','template_select',''), ('113','9','template_setup',''), ('114','9','library_manage',''), ('115','9','lang_edit',''), ('116','9','backup_setting',''), ('117','9','mail_template',''), ('118','10','db_backup',''), ('119','10','db_renew',''), ('120','10','db_optimize',''), ('121','10','sql_query',''), ('122','10','convert','');
INSERT INTO `abs_admin_action` VALUES ('124','11','sms_send',''), ('128','7','exchange_goods',''), ('129','6','delivery_view',''), ('130','6','back_view',''), ('131','5','reg_fields',''), ('132','5','shop_authorized',''), ('133','5','webcollect_manage',''), ('134','4','suppliers_manage',''), ('135','4','role_manage','');
INSERT INTO `abs_admin_log` VALUES ('1','1437001283','1','安装配送方式: 圆通速递','0.0.0.0'), ('2','1437001352','1','添加配送区域: 重庆','0.0.0.0'), ('3','1437001402','1','编辑配送区域: 北京','0.0.0.0'), ('4','1437001440','1','编辑会员注册项: MSN','0.0.0.0'), ('5','1437001454','1','编辑会员注册项: QQ','0.0.0.0'), ('6','1437001460','1','编辑会员注册项: 办公电话','0.0.0.0'), ('7','1437001465','1','编辑会员注册项: 家庭电话','0.0.0.0'), ('8','1437001472','1','编辑会员注册项: 密码找回问题','0.0.0.0'), ('9','1437002017','1','删除权限管理: bjgonghuo1','0.0.0.0'), ('10','1437002019','1','删除权限管理: shhaigonghuo1','0.0.0.0'), ('11','1437002043','1','编辑文章: “沃”的世界我做主','0.0.0.0'), ('12','1437004814','1','编辑商品: 高质感毛呢大衣','0.0.0.0'), ('13','1437005257','1','编辑广告: 首页左侧广告','0.0.0.0'), ('14','1437005300','1','编辑广告: 首页左侧广告','0.0.0.0');
INSERT INTO `abs_admin_user` VALUES ('1','liuhao','liuhaos2000@163.com','d03017b0b2078a929db4836a25b404bc','278','1436999486','1437005088','0.0.0.0','all','商品列表|goods.php?act=list,订单列表|order.php?act=list,用户评论|comment_manage.php?act=list,会员列表|users.php?act=list,商店设置|shop_config.php?act=list_edit','','0','0',NULL,NULL);
INSERT INTO `abs_adsense` VALUES ('193','本站','2');
INSERT INTO `abs_ad_position` VALUES ('159','首页左侧广告','240','140','','<table cellpadding=\"0\" cellspacing=\"0\">\r\n{foreach from=$ads item=ad}\r\n<tr><td>{$ad}</td></tr>\r\n{/foreach}\r\n</table>');
INSERT INTO `abs_area_region` VALUES ('1','426'), ('1','500');
INSERT INTO `abs_article` VALUES ('1','2','免责条款','','','','','0','1','1418351509','','0','',NULL), ('2','2','隐私保护','','','','','0','1','1418351509','','0','',NULL), ('3','2','咨询热点','','','','','0','1','1418351509','','0','',NULL), ('4','2','联系我们','','','','','0','1','1418351509','','0','',NULL), ('5','2','公司简介','','','','','0','1','1418351509','','0','',NULL), ('6','-1','用户协议','','','','','0','1','1418351509','','0','',NULL), ('7','4','三星电子宣布将在中国发布15款3G手机','<p>全球领先的电子产品及第二大移动通信终端制造商三星电子今天在北京宣布，为全面支持中国开展3G移动通信业务，将在3G服务正式商用之际，向中国市场推出 15款3G手机。这些产品分别支持中国三大无线运营商的各种3G服务，并已经得到运营商的合作认可。凭借在电子和通信领域的整体技术实力和对消费者的准确 把握，三星电子已经开始全面发力中国的3G移动通信市场。<br />\n<br />\n&nbsp;&nbsp;&nbsp;&nbsp;2009年1月，中国政府宣布正式启动3G移动通信服务。并根据中国的实际情况，决定由三大运营商分别采用全部三种3G网络制式，&nbsp;即以中国自主知识产权为核心的TD-SCDMA，以欧洲为主要市场的WCDMA和源自北美的CDMA2000技术。<br />\n<br />\n&nbsp;&nbsp;&nbsp;&nbsp;多 年来，三星电子秉承&ldquo;做中国人民喜爱的企业，贡献于中国社会的企业&rdquo;的企业理念，准确地把握了中国社会的发展和市场的需求，推出了一系列深受中国消费者喜 爱的电子产品。为了配合中国推进具有自主知识产权的3G移动通信标准TD-SCDMA，&nbsp;三星电子从2000年开始在中国设立了通信技术研究院，&nbsp;开始进 行TD-SCDMA技术的研究。作为最早承诺支持中国3G标准的手机制造企业，三星电子已经先后投入了上亿元的研究费用，&nbsp;组建了几百人的研发团队。推出 的TD-SCDMA制式的产品，不仅通过了各级权威部门的试验和检测，也经历了2008年北京奥运会的现场考验。此次为中国移动定制的TD-SCDMA手 机，包括了满足高端商务需求的双待产品B7702C，以及数字电视手机、多媒体手机和时尚手机。<br />\n<br />\n&nbsp;&nbsp;&nbsp;&nbsp;作为世界第二大手机制造企业，三 星电子已经在全球3G市场积累了多年的技术和市场经验。最新的统计表明，在完全采用WCDMA标准的欧洲，三星电子的市场份额已经排名第二。在为中国联通 准备的产品中，不仅包括能够支持HSDPA的高端多媒体手机S7520U，也涵盖了能够支持高速上网、在线电影、在线音乐等适合不同消费需求的各种产品。<br />\n<br />\n&nbsp;&nbsp;&nbsp;&nbsp;而 在主要采用CDMA2000技术的北美市场，三星电子也取得了市场份额的第一名。即将陆续上市的支持中国电信3G服务的EVDO产品，有高端商务手机 W709。该机能够支持EVDO/GSM的双网双待功能，含800万像素拍摄系统。其他产品还包括音乐手机M609，双模手机W239，以及时尚设计的 F539等。<br />\n<br />\n&nbsp;&nbsp;&nbsp;&nbsp;作为世界上少数能够提供支持三种3G标准的终端厂商，三星电子正利用其在通信、半导体、显示器以及数字多媒体等方面 的优势，加快产品数字融合的进程。除上述3G手机产品外，三星电子也于近期推出了用于3G网络的上网卡和网络笔记本电脑。三星电子专务、无线事业部大中华 区高级副总裁卢基学先生说，&ldquo;上述15款新品，&nbsp;只是我们二季度新产品的一部分。随着中国3G移动通信市场的不断扩大，三星还将推出更多适合中国市场的终 端产品，以满足消费者对于通信和数字产品的不同需求。三星也将积极配合运营商业务的发展计划，加快技术和应用的研发。中国3G的移动通信市场前景将是非常 明亮的。&rdquo;</p>','','','','0','1','1241426864','','0','http://',NULL), ('8','4','诺基亚牵手移动 5款热门TD手机机型推荐','<table width=\"100%\" cellspacing=\"0\" cellpadding=\"4\" align=\"center\" class=\"tableborder\">\r\n<tbody>\r\n<tr>\r\n<td width=\"180\" valign=\"top\" class=\"altbg4\">&nbsp;</td>\r\n<td height=\"100%\" valign=\"top\" class=\"altbg3\">\r\n<table cellspacing=\"0\" cellpadding=\"0\" border=\"0\" style=\"padding: 5px; table-layout: fixed; width: 973px; height: 2195px;\">\r\n<tbody>\r\n<tr>\r\n<td valign=\"top\">\r\n<div class=\"bbs_content clearfix\">随着5月17日电信日的来临，自从09年初网民对于3G方面关注越来越多，目前国内3G网络主要有中国移动TD-SCDMA，中国联通WCDMA以及 中国电信的CDMA2000这三种制式。到底是哪一种网络制式能让消费者满意，相信好多消费者都难以判断。<br />\r\n<br />\r\n而作为3G网络最主要的组 成部分-手持终端（手机） ，相信也是好多消费者关注的焦点。目前，中国移动TD-SCDMA手机机型频频爆出，其中不乏亮点产品，像联想联想 Ophone、诺基亚、多普达 Magic等，下面就让笔者与大家一起来了解TD-SCDMA网络制式下的几款强势机型吧。<br />\r\n<br />\r\n诺基亚TD-SCDMA手机　型号：待定　参考报价：尚未上市<br />\r\n<br />\r\n随着国内3G网络发展速度加快及众多手机厂商纷纷跟进，诺基亚终于推出TD-SCDMA手机，这款诺基亚的首台TD-SCDMA测试手机型号目前仍无法 得知，但从键盘及菜单设计来看，我们可以是知道其并没有采用S60操作系统，只是配备了S40系统，机身直板造型与早期热卖的6300有几分相像。<br />\r\n<br />\r\n<p><img width=\"450\" alt=\"\" src=\"http://dstatic.esqimg.com/4812278/1.jpg\" style=\"display: block;\" /></p>\r\n<br />\r\n<br />\r\n图为：诺基亚TD-SCDMA手机<br />\r\n<br />\r\n虽然没有更多的参数资料，但是从曝光的图片我们可以知道这款诺基亚TD-SCDMA手机必定配备了QVGA分辨率的屏幕以及320万像素的摄像头，而标准的MP3以及蓝牙等功能自然不会缺少，在功能方面不会比以往的S40手机逊色。<br />\r\n<br />\r\n<p><img width=\"450\" alt=\"\" src=\"http://dstatic.esqimg.com/4812279/2.jpg\" style=\"display: block;\" /></p>\r\n<br />\r\n<br />\r\n图为：诺基亚TD-SCDMA手机<br />\r\n<br />\r\n这款诺基亚的TD手机最大的卖点便是提供了对TD-HSDPA技术的支持，最大的功能特色便是该技术被看为是TD网络下一步的演进技术，能够同时适用于 WCDMA和TD-SCDMA两种不同的网络支持，能够很好的支持非对称的数据业务，也就是说这款诺基亚手机的用户即便在全球漫游都能够使用到3G网络。 而其机身前置的摄像头也更是证实了其3G手机的身份。<br />\r\n<br />\r\n<p><img width=\"450\" alt=\"\" src=\"http://dstatic.esqimg.com/4812280/3.jpg\" style=\"display: block;\" /></p>\r\n<p><br />\r\n<br />\r\n图为：诺基亚TD-SCDMA手机<br />\r\n<br />\r\n从目前曝光的测试情况来看，通过这款诺基亚TD手机连接网络，其下载速度能够稳定在1.3Mbps左右，不过根据国内有些媒体的报道，诺基亚官方已经证实将于今天下半年配合运营商中国移动对出自己的第一款TD-SCDMA制式的S60手机，大家要拭目以待了。</p>\r\n<p>&nbsp;</p>\r\n图为：诺基亚TD-SCDMA手机<br />\r\n<br />\r\n最后较为耐人寻味的便是目前有业内人士指出目前曝光的的诺基亚TD手机其实是去年夏季就出现过的 TD测试手机，但是随着诺基亚拥有部分股份的TD芯片厂商&ldquo;凯明&rdquo;的倒闭，这款机型也就被取消了。尽管对于目前这款诺基亚的TD测试手机的身份尚无官方的 消息，但是诺基亚将推出TD手机遗失毫无悬念的事情了，相信大家也希望在TD制式下能够有更多的手机可以选择。</div>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>&nbsp;</p>','','','','0','1','1241427051','','0','http://',NULL), ('9','5','售后流程','','','','','0','1','1242576700','','0','http://',NULL), ('10','5','购物流程','','','','','0','1','1242576717','','0','http://',NULL), ('11','5','订购方式','','','','','0','1','1242576727','','0','http://',NULL), ('12','6','如何分辨原装电池','<p><font size=\"2\">一般在购买时主要是依靠观察外观特征的方法来鉴别电池，而原装电池一般应具有以下一些特征：&nbsp;<br />\n<br />\n1、 电池外观整齐，外表面有一定的粗糙度且手感舒适，内表面手感光滑，灯光下能看见细密的纵向划痕&nbsp;<br />\n<br />\n2、 生产厂家字样应该轮廓清晰，且防伪标志亮度高，看上去有立体感，电池标贴 字迹清晰，有与电池类型相一致的电池件号<br />\n3、 电池标贴采用二次印刷技术，在一定光线下从斜面看，条形码部分的颜色比其他部分要黑，且用手触摸有凹凸感<br />\n<br />\n4、 原装电池电极与手机电池片宽度相等，电池电极下方标有&ldquo; + &rdquo;、&ldquo; - &rdquo;标志，电池电极片之间的隔离材料与外壳材料一致，但不是一体<br />\n<br />\n5、 原装电池装入手机时手感舒适，安装自如，电池按压部分卡位适当而且牢固<br />\n<br />\n6、 原装电池的金属触点采用优质的铜片，只有在正面看时才会有反光，而从其它角度看的话，都是比较暗淡的</font></p>','','','','1','1','1242576826','','0','http://',NULL), ('15','7','货到付款区域','','','','','0','1','1242577023','','0','http://',NULL), ('16','7','配送支付智能查询 ','','','','','0','1','1242577032','','0','http://',NULL), ('17','7','支付方式说明','','','','','0','1','1242577041','','0','http://',NULL), ('18','10','资金管理','','','','','0','1','1242577127','','0','user.php?act=account_log',NULL), ('19','10','我的收藏','','','','','0','1','1242577178','','0','user.php?act=collection_list',NULL), ('20','10','我的订单','','','','','0','1','1242577199','','0','user.php?act=order_list',NULL), ('21','8','退换货原则','','','','服务','0','1','1242577293','','0','http://',NULL), ('22','8','售后服务保证 ','','','','售后','0','1','1242577308','','0','http://',NULL), ('23','8','产品质量保证 ','','','','质量','1','1','1242577326','','0','http://',NULL), ('24','9','网站故障报告','','','','','0','1','1242577432','','0','http://',NULL), ('25','9','选机咨询 ','','','','','0','1','1242577448','','0','http://',NULL), ('26','9','投诉与建议 ','','','','','0','1','1242577459','','0','http://',NULL), ('27','4','800万像素超强拍照机 LG Viewty Smart再曝光','','','','','0','1','1242577702','','0','http://news.imobile.com.cn/index-a-view-id-66790.html',NULL), ('28','11','飞利浦9@9促销','<p>&nbsp;</p>\r\n<div class=\"boxCenterList RelaArticle\" id=\"com_v\">\r\n<p align=\"left\">作为一款性价比极高的入门级<font size=\"3\" color=\"#ff0000\"><strong>商务手机</strong></font>，飞利浦<a href=\"mailto:9@9v\">Xenium&nbsp; 9@9v</a>三围大小为105&times;44&times;15.8mm，机身重量仅为<strong><font size=\"3\" color=\"#ff0000\">75g</font></strong>，装配了一块低规格1.75英寸128&times;160像素65000色CSTN显示屏。身正面采用月银色功能键区与屏幕数字键区相分隔，键盘设计较为<font size=\"3\"><strong><font color=\"#ff0000\">别</font><font color=\"#ff0000\">致</font></strong></font>，中部导航键区采用钛金色的&ldquo;腰带&rdquo;彰显出浓郁的商务气息。</p>\r\n<p align=\"left\">&nbsp;</p>\r\n<p align=\"left\">此款手机采用<strong><font size=\"3\" color=\"#ff0000\">触摸屏</font></strong>设计，搭配精致的手写笔，可支持手写中文和英文两个版本。增强的内置系统还能识别潦草字迹，确保在移动中和匆忙时输入文字的识别率。手写指令功能还支持特定图案的瞬间调用，独特的手写记事本功能，可以在触摸屏上随意绘制个性化的图案并进行<strong><font size=\"3\" color=\"#ff0000\">记事提醒</font></strong>，让商务应用更加随意。</p>\r\n<p align=\"left\">&nbsp;</p>\r\n<p align=\"left\">&nbsp;作为入门级为数不多支持<strong><font size=\"3\" color=\"#ff0000\">双卡功能</font></strong>的手机，可以同时插入两张SIM卡，通过菜单随意切换，只需开启漫游自动切换模式，<a href=\"mailto:9@9V\">9@9V</a>在该模式下能够判断网络情况，自动切换适合的手机号。</p>\r\n<p align=\"left\">&nbsp;</p>\r\n<p align=\"left\">&nbsp;</p>\r\n</div>\r\n<p>&nbsp;</p>','','','','0','1','1242578199','','0','http://',NULL), ('29','11','诺基亚5320 促销','<p>&nbsp;</p>\r\n<div id=\"com_v\" class=\"boxCenterList RelaArticle\">\r\n<p>诺基亚5320XpressMusic音乐手机采用XpressMusic系列常见的黑红、黑蓝配色方案，而材质方便则选用的是经过<strong><font size=\"3\" color=\"#ff0000\">抛光处理</font></strong>的工程塑料；三围/体重为，为108&times;46&times;15mm/<strong><font size=\"3\" color=\"#ff0000\">90g</font></strong>，手感舒适。</p>\r\n<p>&nbsp;</p>\r\n<p>诺基亚5320采用的是一块可视面积为2.0英寸的<font size=\"3\" color=\"#ff0000\"><strong>1600万色</strong></font>屏幕，分辨率是常见的240&times;320像素（QVGA）。虽然屏幕不是特别大，但效果非常精细，色彩还原不错。</p>\r\n<p>&nbsp;</p>\r\n<p>手机背面，诺基亚为5320XM配备一颗<strong><font size=\"3\" color=\"#ff0000\">200W像素</font></strong>的摄像头，并且带有<strong><font size=\"3\" color=\"#ff0000\">两个LED的补光灯</font></strong>，可以实现拍照、摄像功能，并能通过彩信、邮件方式发送给朋友。</p>\r\n<p>&nbsp;</p>\r\n</div>\r\n<p>&nbsp;</p>','','','','1','1','1242578676','','0','http://',NULL), ('30','11','促销诺基亚N96','<p>&nbsp;</p>\r\n<div class=\"boxCenterList RelaArticle\" id=\"com_v\">\r\n<p>诺基亚N96采用了<strong><font size=\"3\" color=\"#ff0000\">双向滑盖</font></strong>设计，机身整体呈灰黑色，沉稳、大气，机身材质采用了高强度的塑料材质，手机背面采用了抛光面板的设计风格。N96三维体积103*55*20mm，重量为125g。屏幕方面，诺基亚N96配备一块<strong><font size=\"3\" color=\"#ff0000\">2.8英寸</font></strong>的屏幕，支持<strong><font size=\"3\" color=\"#ff0000\">1670万色</font></strong>显示，分辨率达到QVGA（320&times;240）水准。</p>\r\n<p>&nbsp;<img src=\"http://img2.zol.com.cn/product/21/896/ceN6LBMCid3X6.jpg\" alt=\"\" /></p>\r\n<p>&nbsp;</p>\r\n<p>诺基亚N96设置有专门的<strong><font size=\"3\" color=\"#ff0000\">音乐播放键</font></strong>和标准的3.5毫米音频插口，支持多格式音乐播放。内置了<strong><font size=\"3\" color=\"#ff0000\">多媒体播放器</font></strong>，支持FM调频收音机等娱乐功能。N96手机支持<strong><font size=\"3\" color=\"#ff0000\">N-Gage游戏平台</font></strong>，内置包括<font size=\"3\" color=\"#ff0000\"><strong>《PinBall》完整版</strong></font>在内的四款N-Gage游戏，除了手机本身内置的游戏，还可以从N-Gage的网站下载或者购买最新的游戏，而且可以在论坛里和其他玩家一起讨论。</p>\r\n<p>&nbsp;</p>\r\n</div>\r\n<p>&nbsp;<img src=\"http://img2.zol.com.cn/product/21/898/cekkw57qJjSI.jpg\" alt=\"\" /></p>','','','','1','1','1242578826','','0','http://',NULL), ('13','6','如何分辨水货手机 ','<p>\n<div class=\"artibody\">\n<p><font size=\"2\"><strong>1、&nbsp;什么是水货？</strong><br />\n提及水货手机，按照行业内的说法，可以将水货手机分成三类：A类、B类和C类。 </font></p>\n<p><font size=\"2\">A类水货手机是指由国外、港澳台等地区在没有经过正常海关渠道的情况下进入国内市场的产品，就是我们常说的走私货， 与行货的主要差异是在输入法上，这类手机都是英文输入法或者是港澳台地区的繁体中文输入法。这类手机其最主要的目的是为了逃避国家关税或者因为该种产品曾 经过不正当改装而不能够通过正常渠道入关，质量一般没有大的问题。但由于逃避关税本身就是违法的，所以购买这类手机的用户根本得不到任何售后保障服务； </font></p>\n<p><font size=\"2\">B类水货手机就是走私者将手机的系统软件由英文版升级至中文版后，偷运到内地，然后贴上非法渠道购买的入网标志，作为行货手机充数。 </font></p>\n<p><font size=\"2\">C类水货手机则是那些由其他型号机改装、更换芯片等等方法做假&ldquo;生产&rdquo;出来的，或者就是从各地购买手机的部件，自己组装然后再贴上非法购买的入网标志。 </font></p>\n<p><font size=\"2\">水货手机虽然不排除它是原厂正货的可能，但通过市场调研发现，绝大多数水货手机都是改版的次货，而且产品基本没有受国内厂商的保修许可。</font></p>\n<p><font size=\"2\"><strong>2、水货有哪些？</strong>水货有两种，一种俗称港行，也称作水行，这种产品原本是在香港 及周边地区销售的，但是经过非法途径进入大陆地区销售。另一种是欧版水改机，也称作欧版，水改等，此种产品以英文改版机为主，通过刷改机内软件达到英文改 中文的目的，原来这类产品是销往欧美地区的，由于和大陆地区有相当大的价格差，所以通过走私进入中国市场。</font></p>\n<p><font size=\"2\"><strong>3、水货手机的危害</strong><br />\n1、售后服务无保障 <br />\n手机作为精密类电子产品，软件、硬件方面都有可能产生不同的问题。购买正规渠道的手机，一旦出现问题，只要将问题反映给厂商客户服务中心并静候佳音就 可以了。大多数走私手机的贩卖点规模较小，根本没有资金和技术能力建立起自己的维修网点，因此他们往往制定非常苛刻的保修条件，将国家明令的一年保修期缩 短为三个月，并加入完全对走私手机经销商有利的诸如&ldquo;认为摔打&rdquo;等概念难以界定的排除条件(众所周知，手机很有可能发生摔撞事件)，是确确实实的霸王条 款。规定时间内手机出了故障，走私手机经销商会通过曲解条款尽可能地开脱保修责任。即使他们愿意承担保修服务，也需将手机发往广州、深圳等地，委托他人维 修。一来路途漫长，二来经手人繁多，小问题&ldquo;修&rdquo;成了大问题。最终走私手机经销商会以无法维修为由劝客户自行去当地正规客服维修。至于维修费用，他们自然 也不愿意出了。<br />\n<br />\n2、产品本身质量不过关<br />\n&nbsp;&nbsp;&nbsp; 现在很多奸商为了谋取暴利，经常使用C类的翻修或者组装手机冒充A类水货手机进行销售。作为消费者来说面对和正规行货之间巨大的价格差异，他们无法分辨想要购买的手机是否象销售商说的那样质量过硬，在销售商的巧舌如簧下只能眼看自己的钱包&ldquo;减肥&rdquo;。 </font></p>\n<p><font size=\"2\">但是这类翻修或者组装的水货手机往往为了降低成本，其采用的配件往往也是不合格产品，甚至也是伪劣产品，可以想象由这样产品组装起来的手机的质量究竟可以好到那里去。目前在经常看到手机电池爆炸伤人的事件的报道，究其原因也是消费者购买了这些组装的水货手机。</font></p>\n<p><font size=\"2\">而且不光这类手机硬件存在问题，包括手机使用的软件。由于组装的水货硬件规格根本无法保证和原场产品一致，手机使用的软件也会造成和手机硬件的冲突。频繁死机就是家常便饭，更有甚者会造成经常性的电话本丢失，无法联系到好友。</font></p>\n<p><br />\n<font size=\"2\"><strong>4、如何分辨行、水货手机？</strong><br />\n1、看手机上是否贴有信息产业部&ldquo;进网许可&rdquo;标志。水货与正品的入网标志稍微有一点不同：真的入网标志一般都是针式打印机打印的，数字清晰，颜色较浅，仔细看有针打的凹痕；假的入网标志一般是普通喷墨打印机打印的，数字不很清晰，颜色较深，没有凹痕。 </font></p>\n<p><font size=\"2\">2、检查手机的配置，包括中文说明书、电池、充电器等，如果是厂家原配，一般均贴有厂家的激光防伪标志。原厂配置的 中文说明书通常印刷精美，并与其他语言的说明书及相关产品资料的印刷质量、格式、风格等保持一致。不是原厂家配置的中文说明书通常印刷质量低劣，常出现错 别字，甚至字迹模糊。正品手机的包装盒中均附带有原厂合格证、原厂条码卡、原厂保修卡，而水货则没有。 </font></p>\n<p><font size=\"2\">3、确认经销商的保修条例是否与厂家一致，在购买手机时应索要发票和保修卡。 </font></p>\n<p><font size=\"2\">4、电子串号是否一致也是验证是否水货手机的重要途径。首先在手机上按&ldquo;*#06#&rdquo;，一般会在手机上显示15个数 字，这就是本手机的IMEI码。然后打开手机的电池盖，在手机里有一张贴纸，上面也有一个IMEI码，这个码应该同手机上显示的IMEI码完全一致。然后 再检查手机的外包装盒上的贴纸，上面也应该有一个IMEI码，这个码也应该同手机上显示的IMEI码完全一致。如果此三个码有不一致的地方，这个手机就有 问题。</font></p>\n</div>\n<p>&nbsp;</p>\n</p>','','','','0','1','1242576911','','0','http://',NULL), ('14','6','如何享受全国联保','','','','','0','1','1242576927','','0','http://',NULL), ('31','12','诺基亚6681手机广告欣赏','<object>\n<param value=\"always\" name=\"allowScriptAccess\" />\n<param value=\"transparent\" name=\"wmode\" />\n<param value=\"http://6.cn/player.swf?flag=0&amp;vid=nZNyu3nGNWWYjmtPQDY9nQ\" name=\"movie\" /><embed width=\"480\" height=\"385\" src=\"http://6.cn/player.swf?flag=0&amp;vid=nZNyu3nGNWWYjmtPQDY9nQ\" allowscriptaccess=\"always\" wmode=\"transparent\" type=\"application/x-shockwave-flash\"></embed></object>','','','','0','1','1242579069','','0','http://',NULL), ('32','12','手机游戏下载','<p>三星SGHU308说明书下载，点击相关链接下载</p>','','','','1','1','1242579189','','0','http://soft.imobile.com.cn/index-a-list_softs-cid-1.html',NULL), ('33','12','三星SGHU308说明书下载','<p>三星SGHU308说明书下载</p>','','','','1','1','1242579559','data/article/1245043292228851198.rar','2','http://',NULL), ('34','12','3G知识普及','<p>\n<h2>3G知识普及</h2>\n<div class=\"t_msgfont\" id=\"postmessage_8792145\"><font color=\"black\">3G，全称为3rd Generation，中文含义就是指第三代数字通信。<br />\n</font><br />\n<font color=\"black\">　　1995年问世的第一代<span class=\"t_tag\" onclick=\"tagshow(event)\" href=\"http://mbbs.enet.com.cn/tag.php?name=%C4%A3%C4%E2\">模拟</span>制式<span class=\"t_tag\" onclick=\"tagshow(event)\" href=\"http://mbbs.enet.com.cn/tag.php?name=%CA%D6%BB%FA\">手机</span>（1G）只能进行<span class=\"t_tag\" onclick=\"tagshow(event)\" href=\"http://mbbs.enet.com.cn/tag.php?name=%D3%EF%D2%F4\">语音</span>通话；<br />\n</font><br />\n<font color=\"black\">　　1996到1997年出现的第二代GSM、TDMA等数字制式手机（2G）便增加了接收数据的功能，如接收电子邮件或网页；<br />\n</font><br />\n<font color=\"black\">　　3G不是2009年诞生的，它是上个世纪的产物，而早在2007年国外就已经产生4G了，而<span class=\"t_tag\" onclick=\"tagshow(event)\" href=\"http://mbbs.enet.com.cn/tag.php?name=%D6%D0%B9%FA\">中国</span>也于2008年成功开发出<span class=\"t_tag\" onclick=\"tagshow(event)\" href=\"http://mbbs.enet.com.cn/tag.php?name=%D6%D0%B9%FA\">中国</span>4G，其网络传输的速度可达到每秒钟2G，也就相当于下一部电影只要一秒钟。在上世纪90年末的日韩电影如《我的野蛮女友》中，女主角使用的可以让对方看见自己的视频<span class=\"t_tag\" onclick=\"tagshow(event)\" href=\"http://mbbs.enet.com.cn/tag.php?name=%B5%E7%BB%B0\">电话</span>，就是属于3G技术的重要运用之一。日韩等国3G的运用是上世纪末期的事。而目前国外有些地区已经试运行3.5G甚至4G网络。<br />\n</font><br />\n<font color=\"black\">　 </font><font color=\"black\">（以下为误导）2009年问世的第三代（3G）与 前两代的主要区别是在传输声音和数据的速度上的提升，它能够在全球范围内更好地实现无缝漫游，并处理图像、音乐、视频流等多种媒体形式，提供包括网页浏 览、电话会议、电子商务等多种信息服务，同时也要考虑与已有第二代系统的良好兼容性。为了提供这种服务，无线网络必须能够支持不同的数据传输速度，也就是 说在室内、室外和行车的环境中能够分别支持至少2Mbps（兆比特／每秒）、384kbps（千比特／每秒）以及144kbps的传输速度。（此数值根据 网络环境会发生变化)。<br />\n</font><br />\n<font color=\"black\">　　3G标准，国际电信联盟(ITU)目前一共确定了全球四大3G标准，它们分别是WCDMA、CDMA2000和TD-SCDMA和WiMAX。</font><br />\n<br />\n<font color=\"black\">3G标准　　国际电信联盟（ITU）在2000年5月确定W-CDMA、CDMA2000、TD-SCDMA以 及WiMAX四大主流无线接口标准，写入3G技术指导性文件《2000年国际移动通讯计划》（简称IMT&mdash;2000）。 CDMA是Code Division Multiple Access (码分多址)的缩写，是第三代移动通信系统的技术基础。第一代移动通信系统采用频分多址(FDMA)的模拟调制方式，这种系统的主要缺点是频谱利用率低， 信令干扰话音业务。第二代移动通信系统主要采用时分多址(TDMA)的数字调制方式，提高了系统容量，并采用独立信道传送信令，使系统性能大大改善，但 TDMA的系统容量仍然有限，越区切换性能仍不完善。CDMA系统以其频率规划简单、系统容量大、频率复用系数高、抗多径能力强、通信质量好、软容量、软 切换等特点显示出巨大的发展潜力。下面分别介绍一下3G的几种标准：<br />\n</font><br />\n<br />\n<font color=\"black\">　　 </font><br />\n<font color=\"black\">(1) W-CDMA</font><font color=\"black\"><br />\n</font><br />\n<br />\n<font color=\"black\">　　也称为WCDMA，全称为Wideband CDMA，也称为CDMA Direct Spread，意为宽频分码多重存取，这是基于GSM网发展出来的3G技术规范，是欧洲提出的宽带CDMA技术，它与日本提出的宽带CDMA技术基本相 同，目前正在进一步融合。W-CDMA的支持者主要是以GSM系统为主的欧洲厂商，日本公司也或多或少参与其中，包括欧美的爱立信、阿尔卡特、<span class=\"t_tag\" onclick=\"tagshow(event)\" href=\"http://mbbs.enet.com.cn/tag.php?name=%C5%B5%BB%F9%D1%C7\">诺基亚</span>、 朗讯、北电，以及日本的NTT、富士通、夏普等厂商。 该标准提出了GSM(2G)-GPRS-EDGE-WCDMA(3G)的演进策略。这套系统能够架设在现有的GSM网络上，对于系统提供商而言可以较轻易 地过渡，但是GSM系统相当普及的亚洲对这套新技术的接受度预料会相当高。因此W-CDMA具有先天的市场优势。<br />\n</font><br />\n<br />\n<font color=\"black\">　　 </font><br />\n<font color=\"black\">(2)CDMA2000</font><font color=\"black\"><br />\n</font><br />\n<br />\n<font color=\"black\">　　CDMA2000是由窄带CDMA(CDMA IS95)技术发展而来的宽带CDMA技术，也称为CDMA Multi-Carrier，它是由美国高通北美公司为主导提出，<span class=\"t_tag\" onclick=\"tagshow(event)\" href=\"http://mbbs.enet.com.cn/tag.php?name=%C4%A6%CD%D0%C2%DE%C0%AD\">摩托罗拉</span>、Lucent 和后来加入的韩国三星都有参与，韩国现在成为该标准的主导者。这套系统是从窄频CDMAOne数字标准衍生出来的，可以从原有的CDMAOne结构直接升 级到3G，建设成本低廉。但目前使用CDMA的地区只有日、韩和北美，所以CDMA2000的支持者不如W-CDMA多。不过CDMA2000的研发技术 却是目前各标准中进度最快的，许多3G手机已经率先面世。该标准提出了从CDMA IS95(2G)-CDMA20001x-CDMA20003x(3G)的演进策略。CDMA20001x被称为2.5代移动通信技术。 CDMA20003x与CDMA20001x的主要区别在于应用了多路载波技术，通过采用三载波使带宽提高。目前<span class=\"t_tag\" onclick=\"tagshow(event)\" href=\"http://mbbs.enet.com.cn/tag.php?name=%D6%D0%B9%FA%B5%E7%D0%C5\">中国电信</span>正在采用这一方案向3G过渡，并已建成了CDMA IS95网络。<br />\n</font><br />\n<br />\n<font color=\"black\">　　 </font><br />\n<font color=\"black\">(3)TD-SCDMA</font><font color=\"black\"><br />\n</font><br />\n<br />\n<font color=\"black\">　　全称为Time Division - Synchronous CDMA(时分<span class=\"t_tag\" onclick=\"tagshow(event)\" href=\"http://mbbs.enet.com.cn/tag.php?name=%CD%AC%B2%BD\">同步</span>CDMA)，该标准是由中国大陆独自制定的3G标准，1999年6月29日，中国原邮电部电信科学技术研究院（大唐电信）向ITU提出。该标准将智能无线、<span class=\"t_tag\" onclick=\"tagshow(event)\" href=\"http://mbbs.enet.com.cn/tag.php?name=%CD%AC%B2%BD\">同步</span>CDMA和<span class=\"t_tag\" onclick=\"tagshow(event)\" href=\"http://mbbs.enet.com.cn/tag.php?name=%C8%ED%BC%FE\">软件</span>无 线电等当今国际领先技术融于其中，在频谱利用率、对业务支持具有灵活性、频率灵活性及成本等方面的独特优势。另外，由于中国内的庞大的市场，该标准受到各 大主要电信设备厂商的重视，全球一半以上的设备厂商都宣布可以支持TD&mdash;SCDMA标准。 该标准提出不经过2.5代的中间环节，直接向3G过渡，非常适用于GSM系统向3G升级。<br />\n</font><br />\n<br />\n<font color=\"black\">　　 </font><br />\n<font color=\"black\">(4)WiMAX</font><font color=\"black\"><br />\n</font><br />\n<br />\n<font color=\"black\">　　WiMAX 的全名是微波存取全球互通(Worldwide Interoperability for Microwave Access)，又称为802&middot;16无线城域网，是又一种为企业和家庭用户提供&ldquo;最后一英里&rdquo;的宽带无线连接方案。将此技术与需要授权或免授权的微波设备 相结合之后，由于成本较低，将扩大宽带无线市场，改善企业与服务供应商的认知度。2007年10月19日，国际电信联盟在日内瓦举行的无线通信全体会议 上，经过多数国家投票通过，WiMAX正式被批准成为继WCDMA、CDMA2000和TD-SCDMA之后的第四个全球3G标准。</font></div>\n</p>','','','','0','1','1242580013','','0','http://',NULL), ('35','4','“沃”的世界我做主','<p><strong>导语：<br />\n<br />\n</strong>&nbsp;&nbsp;&nbsp;&nbsp;今年5月17日，是每年一度的世界电信日。同时，也是值得中国人民高兴的日子。昨天，中国联通企业品牌下的全品牌业务&ldquo;沃&rdquo;开始试商用，这也就意味着继中国移动、中国电信之后，国内第三种3G网络将要走入我们的生活，为我们带来更加快速便捷的通信服务。<br />\n<br />\n&nbsp;&nbsp;&nbsp;&nbsp;沃，意味着此品牌将为用户提供一个丰盈的平台，为个人客户、家庭客户、集团客户和企业服务提供全面的支撑，它代表着中国联通全新的服务理念和创新的品牌精神，在3G时代，为客户提供精彩的信息化服务。<br />\n<br />\n&nbsp;&nbsp;&nbsp;&nbsp;下面小编为各位介绍几款各大手机品牌专为&ldquo;沃&rdquo;打造的定制机型，为您迎接&ldquo;沃&rdquo;的到来做好充分准备。</p>\n<p><strong>诺基亚6210si<br />\n<br />\n</strong>&nbsp;&nbsp;&nbsp;&nbsp;诺基亚6210s大家肯定不陌生，经典的滑盖导航手机。其实6210si 与6210s外观、参数、硬件配置几乎完全一样，只不过在6210s的基础上，增加了对WCDMA网络的支持，成为中国联通定制手机。6210si采用诺 基亚经典的滑盖机身设计，机身面板为钢琴烤漆材质，高贵优雅。机身背板则为磨砂外观工程塑料材质，美观的同时增加了手机与手掌间的摩擦系数，防止使用中手 机滑落。</p>\n<p><strong>摩托罗拉A3100<br />\n</strong><br />\n&nbsp;&nbsp;&nbsp;&nbsp;作为摩托罗拉旗下为中国联通定制的A3100，它有着经典的鹅卵石造型， 大气稳重。从最初的U6，到U9再到A3100，鹅卵石的辉煌依旧。A3100有着高贵的血统，钢琴烤漆黑色面板，金属拉丝机身以及 Windows&nbsp;Mobile&nbsp;6.1&nbsp;Professional操作系统，都告诉我们它绝对是一部不可多得的好手机。</p>\n<p><br />\n<strong>三星S7520U<br />\n</strong><br />\n&nbsp;&nbsp;&nbsp;&nbsp;三星S7520U外观造型时尚，镜面设计以及超薄的 98.4&times;55&times;11.6mm金属机身，更适合女性朋友使用。通观机身，最显眼的就要数这3.0英寸的超大触摸屏幕了，400x240的WQGVA级别分 辨率，能够比QVGA级别屏幕显示更为细腻，细节表现力更强。500万像素摄像头说明了该机还是一名拍照能手，捕捉精彩瞬间不在话下。</p>','','','','0','0','1242974613','','0','http://',NULL);
INSERT INTO `abs_article_cat` VALUES ('1','系统分类','2','','系统保留分类','50','0','0'), ('2','网店信息','3','','网店信息分类','50','0','1'), ('3','网店帮助分类','4','','网店帮助分类','50','0','1'), ('4','3G资讯','1','','','50','0','0'), ('5','新手上路 ','5','','','50','0','3'), ('6','手机常识 ','5','','手机常识 ','50','0','3'), ('7','配送与支付 ','5','','配送与支付 ','50','0','3'), ('8','服务保证 ','5','','','50','0','3'), ('9','联系我们 ','5','','联系我们 ','50','0','3'), ('10','会员中心','5','','','50','0','3'), ('11','手机促销','1','','','50','0','0'), ('12','站内快讯','1','','','50','0','0');
INSERT INTO `abs_attribute` VALUES ('1','1','作者','0','0','','0','0','0','0'), ('2','1','出版社','0','0','','0','0','0','0'), ('3','1','图书书号/ISBN','0','0','','0','0','0','0'), ('4','1','出版日期','0','0','','0','0','0','0'), ('5','1','开本','0','0','','0','0','0','0'), ('6','1','图书页数','0','0','','0','0','0','0'), ('7','1','图书装订','1','0','平装\r\n黑白','0','0','0','0'), ('8','1','图书规格','0','0','','0','0','0','0'), ('9','1','版次','0','0','','0','0','0','0'), ('10','1','印张','0','0','','0','0','0','0'), ('11','1','字数','0','0','','0','0','0','0'), ('12','1','所属分类','0','0','','0','0','0','0'), ('13','2','中文片名','0','0','','0','0','0','0'), ('14','2','英文片名','0','0','','0','0','0','0'), ('15','2','商品别名','0','0','','0','0','0','0'), ('16','2','介质/格式','1','0','HDCD\r\nDTS\r\nDVD\r\nDVD9\r\nVCD\r\nCD\r\nTAPE\r\nLP','0','0','0','0'), ('17','2','片装数','0','0','','0','0','0','0'), ('18','2','国家地区','0','0','','0','0','0','0'), ('19','2','语种','1','0','中文\r\n英文\r\n法文\r\n西班牙文','0','0','0','0'), ('20','2','导演/指挥','0','0','','0','0','0','0'), ('21','2','主唱','0','0','','0','0','0','0'), ('22','2','所属类别','1','0','古典\r\n流行\r\n摇滚\r\n乡村\r\n民谣\r\n爵士\r\n蓝调\r\n电子\r\n舞曲\r\n国乐\r\n民族\r\n怀旧\r\n经典\r\n人声\r\n合唱\r\n发烧\r\n试音\r\n儿童\r\n胎教\r\n轻音乐\r\n世界音乐\r\n庆典音乐\r\n影视音乐\r\n新世纪音乐\r\n大自然音乐','0','0','0','0'), ('23','2','长度','0','0','','0','0','0','0'), ('24','2','歌词','1','0','有\r\n无','0','0','0','0'), ('25','2','碟片代码','0','0','','0','0','0','0'), ('26','2','ISRC码','0','0','','0','0','0','0'), ('27','2','发行公司','0','0','','0','0','0','0'), ('28','2','出版','0','0','','0','0','0','0'), ('29','2','出版号','0','0','','0','0','0','0'), ('30','2','引进号','0','0','','0','0','0','0'), ('31','2','版权号','0','0','','0','0','0','0'), ('32','3','中文片名','0','0','','0','0','0','0'), ('33','3','英文片名','0','0','','0','0','0','0'), ('34','3','商品别名','0','0','','0','0','0','0'), ('35','3','介质/格式','1','0','HDCD\r\nDTS\r\nDVD\r\nDVD9\r\nVCD','0','0','0','0'), ('36','3','碟片类型','1','0','单面\r\n双层','0','0','0','0'), ('37','3','片装数','0','0','','0','0','0','0'), ('38','3','国家地区','0','0','','0','0','0','0'), ('39','3','语种/配音','1','0','中文\r\n英文\r\n法文\r\n西班牙文','0','0','0','0'), ('40','3','字幕','0','0','','0','0','0','0'), ('41','3','色彩','0','0','','0','0','0','0'), ('42','3','中文字幕','1','0','有\r\n无','0','0','0','0'), ('43','3','导演','0','0','','0','0','0','0'), ('44','3','表演者','0','0','','0','0','0','0'), ('45','3','所属类别','1','0','爱情\r\n偶像\r\n生活\r\n社会\r\n科幻\r\n神话\r\n武侠\r\n动作\r\n惊险\r\n恐怖\r\n传奇\r\n人物\r\n侦探\r\n警匪\r\n历史\r\n军事\r\n戏剧\r\n舞台\r\n经典\r\n名著\r\n喜剧\r\n情景\r\n动漫\r\n卡通\r\n儿童\r\n伦理激情','0','0','0','0'), ('46','3','年份','0','0','','0','0','0','0'), ('47','3','音频格式','0','0','','0','0','0','0'), ('48','3','区码','0','0','','0','0','0','0'), ('49','3','碟片代码','0','0','','0','0','0','0'), ('50','3','ISRC码','0','0','','0','0','0','0'), ('51','3','发行公司','0','0','','0','0','0','0'), ('52','3','出版 ','0','0','','0','0','0','0'), ('53','3','出版号','0','0','','0','0','0','0'), ('54','3','引进号','0','0','','0','0','0','0'), ('55','3','版权号','0','0','','0','0','0','0'), ('56','4','网络制式','0','0','','0','0','0','0'), ('57','4','支持频率/网络频率','0','0','','0','0','0','0'), ('58','4','尺寸体积','1','0','   ','0','0','0','0'), ('59','4','外观样式/手机类型','1','0','翻盖\r\n滑盖\r\n直板\r\n折叠\r\n手写','0','0','0','0'), ('60','4','主屏参数/内屏参数','0','0','','0','0','0','0'), ('61','4','副屏参数/外屏参数','0','0','','0','0','0','0'), ('62','4','清晰度','0','0','','0','0','0','0'), ('63','4','色数/灰度','1','0','   ','0','0','0','0'), ('64','4','长度','0','0','','0','0','0','0'), ('65','4','宽度','0','0','','0','0','0','0'), ('66','4','厚度','0','0','','0','0','0','0'), ('67','4','屏幕材质','0','0','','0','0','0','0'), ('68','4','内存容量','0','0','','0','0','0','0'), ('69','4','操作系统','0','0','','0','0','0','0'), ('70','4','通话时间','0','0','','0','0','0','0'), ('71','4','待机时间','0','0','','0','0','0','0'), ('72','4','标准配置','0','0','','0','0','0','0'), ('73','4','WAP上网','0','0','','0','0','0','0'), ('74','4','数据业务','0','0','','0','0','0','0'), ('75','4','天线位置','1','0','内置\r\n外置','0','0','0','0'), ('76','4','随机配件','0','0','','0','0','0','0'), ('77','4','铃声','0','0','','0','0','0','0'), ('78','4','摄像头','0','0','','0','0','0','0'), ('79','4','彩信/彩e','1','0','支持\r\n不支持','0','0','0','0'), ('80','4','红外/蓝牙','0','0','','0','0','0','0'), ('81','4','价格等级','1','0','高价机\r\n中价机\r\n低价机','0','0','0','0'), ('82','5','型号','0','0','','0','0','0','0'), ('83','5','详细规格','0','0','','0','0','0','0'), ('84','5','笔记本尺寸','0','0','','0','0','0','0'), ('85','5','处理器类型','0','0','','0','0','0','0'), ('86','5','处理器最高主频','0','0','','0','0','0','0'), ('87','5','二级缓存','0','0','','0','0','0','0'), ('88','5','系统总线','0','0','','0','0','0','0'), ('89','5','主板芯片组','0','0','','0','0','0','0'), ('90','5','内存容量','0','0','','0','0','0','0'), ('91','5','内存类型','0','0','','0','0','0','0'), ('92','5','硬盘','0','0','','0','0','0','0'), ('93','5','屏幕尺寸','0','0','','0','0','0','0'), ('94','5','显示芯片','0','0','','0','0','0','0'), ('95','5','标称频率','0','0','','0','0','0','0'), ('96','5','显卡显存','0','0','','0','0','0','0'), ('97','5','显卡类型','0','0','','0','0','0','0'), ('98','5','光驱类型','0','0','','0','0','0','0'), ('99','5','电池容量','0','0','','0','0','0','0'), ('100','5','其他配置','0','0','','0','0','0','0');
INSERT INTO `abs_attribute` VALUES ('101','6','类型','0','0','','0','0','0','0'), ('102','6','最大像素/总像素  ','0','0','','0','0','0','0'), ('103','6','有效像素','1','0','  ','0','0','0','0'), ('104','6','光学变焦倍数','0','0','','0','0','0','0'), ('105','6','数字变焦倍数','0','0','','0','0','0','0'), ('106','6','操作模式','0','0','','0','0','0','0'), ('107','6','显示屏类型','0','0','','0','0','0','0'), ('108','6','显示屏尺寸','0','0','','0','0','0','0'), ('109','6','感光器件','0','0','','0','0','0','0'), ('110','6','感光器件尺寸','0','0','','0','0','0','0'), ('111','6','最高分辨率','0','0','','0','0','0','0'), ('112','6','图像分辨率','0','0','','0','0','0','0'), ('113','6','传感器类型','0','0','','0','0','0','0'), ('114','6','传感器尺寸','0','0','','0','0','0','0'), ('115','6','镜头','0','0','','0','0','0','0'), ('116','6','光圈','0','0','','0','0','0','0'), ('117','6','焦距','0','0','','0','0','0','0'), ('118','6','旋转液晶屏','1','0','支持\r\n不支持','0','0','0','0'), ('119','6','存储介质','0','0','','0','0','0','0'), ('120','6','存储卡','1','0','  记录媒体\r\n存储卡容量','0','0','0','0'), ('121','6','影像格式','1','0','    静像\r\n动画','0','0','0','0'), ('122','6','曝光控制','0','0','','0','0','0','0'), ('123','6','曝光模式','0','0','','0','0','0','0'), ('124','6','曝光补偿','0','0','','0','0','0','0'), ('125','6','白平衡','0','0','','0','0','0','0'), ('126','6','连拍','0','0','','0','0','0','0'), ('127','6','快门速度','0','0','','0','0','0','0'), ('128','6','闪光灯','1','0','内置\r\n外置','0','0','0','0'), ('129','6','拍摄范围','1','0','  ','0','0','0','0'), ('130','6','自拍定时器','0','0','','0','0','0','0'), ('131','6','ISO感光度','0','0','','0','0','0','0'), ('132','6','测光模式','0','0','','0','0','0','0'), ('133','6','场景模式','0','0','','0','0','0','0'), ('134','6','短片拍摄','0','0','','0','0','0','0'), ('135','6','外接接口','0','0','','0','0','0','0'), ('136','6','电源','0','0','','0','0','0','0'), ('137','6','电池使用时间','0','0','','0','0','0','0'), ('138','6','外形尺寸','0','0','','0','0','0','0'), ('139','6','标配软件','0','0','','0','0','0','0'), ('140','6','标准配件','0','0','','0','0','0','0'), ('141','6','兼容操作系统','0','0','','0','0','0','0'), ('142','7','编号','0','0','','0','0','0','0'), ('143','7','类型','0','0','','0','0','0','0'), ('144','7','外型尺寸','0','0','','0','0','0','0'), ('145','7','最大像素数','0','0','','0','0','0','0'), ('146','7','光学变焦倍数','0','0','','0','0','0','0'), ('147','7','数字变焦倍数','0','0','','0','0','0','0'), ('148','7','显示屏尺寸及类型','0','0','','0','0','0','0'), ('149','7','感光器件','0','0','','0','0','0','0'), ('150','7','感光器件尺寸','0','0','','0','0','0','0'), ('151','7','感光器件数量','0','0','','0','0','0','0'), ('152','7','像素范围','0','0','','0','0','0','0'), ('153','7','传感器数量','0','0','','0','0','0','0'), ('154','7','传感器尺寸','0','0','','0','0','0','0'), ('155','7','水平清晰度','0','0','','0','0','0','0'), ('156','7','取景器','0','0','','0','0','0','0'), ('157','7','数码效果','0','0','','0','0','0','0'), ('158','7','镜头性能','0','0','','0','0','0','0'), ('159','7','对焦方式','0','0','','0','0','0','0'), ('160','7','曝光控制','0','0','','0','0','0','0'), ('161','7','其他接口','0','0','','0','0','0','0'), ('162','7','随机存储','0','0','','0','0','0','0'), ('163','7','电池类型','0','0','','0','0','0','0'), ('164','7','电池供电时间','0','0','','0','0','0','0'), ('165','8','产地','0','0','','0','0','0','0'), ('166','8','产品规格/容量','0','0','','0','0','0','0'), ('167','8','主要原料','0','0','','0','0','0','0'), ('168','8','所属类别','1','0','彩妆\r\n化妆工具\r\n护肤品\r\n香水','0','0','0','0'), ('169','8','使用部位','0','0','','0','0','0','0'), ('170','8','适合肤质','1','0','油性\r\n中性\r\n干性','0','0','0','0'), ('171','8','适用人群','1','0','女性\r\n男性','0','0','0','0'), ('172','9','上市日期','1','0','2008年01月\r\n2008年02月\r\n2008年03月\r\n2008年04月\r\n2008年05月\r\n2008年06月\r\n2008年07月\r\n2008年08月\r\n2008年09月\r\n2008年10月\r\n2008年11月\r\n2008年12月\r\n2007年01月\r\n2007年02月\r\n2007年03月\r\n2007年04月\r\n2007年05月\r\n2007年06月\r\n2007年07月\r\n2007年08月\r\n2007年09月\r\n2007年10月\r\n2007年11月\r\n2007年12月','1','0','0','0'), ('173','9','手机制式','1','0','GSM,850,900,1800,1900\r\nGSM,900,1800,1900,2100\r\nCDMA\r\n双模（GSM,900,1800,CDMA 1X）\r\n3G(GSM,900,1800,1900,TD-SCDMA )','1','1','1','0'), ('174','9','理论通话时间','0','0','','0','2','0','0'), ('175','9','理论待机时间','0','0','','0','3','0','0'), ('176','9','铃声','0','0','','0','4','0','0'), ('177','9','铃声格式','0','0','','0','5','0','0'), ('178','9','外观样式','1','0','翻盖\r\n滑盖\r\n直板\r\n折叠','1','6','1','0'), ('179','9','中文短消息','0','0','','0','7','0','0'), ('180','9','存储卡格式','0','0','','0','0','0','0'), ('181','9','内存容量','0','0','','2','0','0','0'), ('182','9','操作系统','0','0','','0','0','0','0'), ('183','9','K-JAVA','0','0','','0','0','0','0'), ('184','9','尺寸体积','0','0','','0','0','0','0'), ('185','9','颜色','1','1','黑色\r\n白色\r\n蓝色\r\n金色\r\n粉色\r\n银色\r\n灰色\r\n深李色\r\n黑红色\r\n黑蓝色\r\n白紫色','1','0','0','0'), ('186','9','屏幕颜色','1','0','1600万\r\n262144万','1','0','1','1'), ('187','9','屏幕材质','1','0','TFT','0','0','0','1'), ('188','9','屏幕分辨率','1','0','320×240 像素\r\n240×400 像素\r\n240×320 像素\r\n176x220 像素','1','0','0','1'), ('189','9','屏幕大小','0','0','','0','0','0','1'), ('190','9','中文输入法','0','0','','0','0','0','2'), ('191','9','情景模式','0','0','','0','0','0','2'), ('192','9','网络链接','0','0','','0','0','0','2'), ('193','9','蓝牙接口','0','0','','0','0','0','0'), ('194','9','数据线接口','0','0','','0','0','0','2'), ('195','9','电子邮件','0','0','','0','0','0','2'), ('196','9','闹钟','0','0','','0','35','0','4'), ('197','9','办公功能','0','0','','0','0','0','4'), ('198','9','数码相机','0','0','','1','0','0','3'), ('199','9','像素','0','0','','0','0','0','3'), ('200','9','传感器','0','0','','0','0','0','0');
INSERT INTO `abs_attribute` VALUES ('201','9','变焦模式','0','0','','0','0','0','3'), ('202','9','视频拍摄','0','0','','0','0','0','3'), ('203','9','MP3播放器','0','0','','0','0','0','3'), ('204','9','视频播放','0','0','','0','0','0','3'), ('205','9','CPU频率','0','0','','0','0','0','0'), ('206','9','收音机','0','0','','0','0','0','3'), ('207','9','耳机接口','0','0','','0','0','0','3'), ('208','9','闪光灯','0','0','','0','0','0','3'), ('209','9','浏览器','0','0','','0','0','0','2'), ('210','9','配件','1','2','线控耳机\r\n蓝牙耳机\r\n数据线','0','0','0','0');
INSERT INTO `abs_brand` VALUES ('1','有讯网络','1380685184117198956.jpg','公司网站：http://www.nokia.com.cn/\r\n\r\n客服电话：400-880-0123','http://www.nokia.com.cn/','50','1'), ('2','APPLE','1380685191110433994.jpg','官方咨询电话：4008105050\r\n售后网点：http://www.motorola.com.cn/service/carecenter/search.asp ','http://www.motorola.com.cn','50','1'), ('3','方正','1380685198896536870.jpg','官方咨询电话：4008201668\r\n售后网点：http://www.dopod.com/pc/service/searchresult2.php ','http://www.dopod.com ','50','1'), ('4','希捷','1380685206906148108.jpg','官方咨询电话：4008800008\r\n售后网点：http://www.philips.com.cn/service/mustservice/index.page ','http://www.philips.com.cn ','50','1'), ('5','漫步者','1380685213383629650.jpg','官方咨询电话：4008875777\r\n售后网点：http://www.amobile.com.cn/service_fwyzc.asp ','http://www.amobile.com.cn','50','1'), ('6','天翼','1380685222792305410.jpg','官方咨询电话：8008105858\r\n售后网点：http://cn.samsungmobile.com/cn/support/search_area_o.jsp ','http://cn.samsungmobile.com','50','1'), ('7','美的','1380685232971191371.jpg','官方咨询电话：4008100000\r\n售后网点：http://www.sonyericsson.com/cws/common/contact?cc=cn&lc=zh ','http://www.sonyericsson.com.cn/','50','1'), ('8','惠普','1380685242589017695.jpg','官方咨询电话：4008199999\r\n售后网点：http://www.lg.com.cn/front.support.svccenter.retrieveCenter.laf?hrefId=9 ','http://cn.wowlg.com','50','1'), ('9','联想','1380685252873307833.jpg','官方咨询电话：4008188818\r\n售后网点：http://www.lenovomobile.com/service/kf-wanglou.asp','http://www.lenovomobile.com/','50','1'), ('10','金立','1380685292392455401.jpg','官方咨询电话：4007796666\r\n售后网点：http://www.gionee.net/service.asp ','http://www.gionee.net','50','1'), ('11','  恒基伟业','1380685907063087318.jpg','官方咨询电话：4008899126\r\n售后网点：http://www.htwchina.com/htwt/wexiu.shtml ','http://www.htwchina.com','50','1'), ('12','夏普','1380685309482040868.jpg','','http://','50','1'), ('13','索尼','1380685318966924400.jpg','','http://','50','1'), ('14','创维','1380685327309605456.jpg','','http://','50','1'), ('15','乐华','1380685336300659451.jpg','','http://','50','1'), ('20','茵佳妮','1380685345175448444.jpg','','http://','50','1'), ('17','爱普生','1380685356455900353.jpg','','http://','50','1'), ('18','AMD','1380685367276048777.jpg','','http://','50','1'), ('19','acer','1380685373892689456.jpg','','http://','50','1'), ('21','白领','1380685380419928070.jpg','','http://','50','1'), ('22','LILY','1380685392917690536.jpg','','http://','50','1'), ('23','JNBY 江南布衣','1380685401225598337.jpg','','http://','50','1'), ('24','裂帛','1380685410377577740.jpg','','http://','50','1'), ('25','O.SA','1380685418074603841.jpg','','http://','50','1'), ('26','太平鸟','1380685428529409794.jpg','','http://','50','1'), ('27','艾夫斯','1380685437557546263.jpg','','http://','50','1'), ('28','betu百图','1380685447477195506.jpg','','http://','50','1'), ('29','韩都衣舍','1380685458575185862.jpg','','http://','50','1'), ('30','圣迪奥','1380685469784236028.jpg','','http://','50','1'), ('31','EVENY','1380685484076765558.jpg','','http://','50','1'), ('32','溢彩年华','1380685493614241250.jpg','','http://','50','1'), ('33','空间大师','1380685501661713371.jpg','','http://','50','1'), ('34','美好家','1380685508100765689.jpg','','http://','50','1'), ('35','生活诚品','1380685517465148857.jpg','','http://','50','1'), ('36','宝优妮','1380685528138540997.jpg','','http://','50','1'), ('37','大豪','1380685537002141945.jpg','','http://','50','1'), ('38','美亿佳','1380685546460187418.jpg','','http://','50','1'), ('39','千弘','1380685554945999090.jpg','','http://','50','1'), ('40','好事达','1380685563264277972.jpg','','http://','50','1'), ('41','雅培','1380685570445734371.jpg','','http://','50','1'), ('42','贝亲','1380685578773247262.jpg','','http://','50','1'), ('43','帮宝适','1380685585445167375.jpg','','http://','50','1');
INSERT INTO `abs_category` VALUES ('2','CDMA手机','','','17','50','','','0','','1','5','6'), ('19','双模手机','','','17','50','','','0','','1','5','0'), ('20','GSM手机','','','17','50','','','0','','1','5','0'), ('6','装备配件','','耳机 电池 读卡内存卡 充 电 器 ','16','50','','','0','','1','5',''), ('7','充 电 器','','','6','50','','','0','','1','5','0'), ('8','耳机','','','6','50','','','0','','1','5','0'), ('9','电池','','','6','50','','','0','','1','0','0'), ('11','读卡内存卡','','','6','50','','','0','','1','5','0'), ('12','户外服装','','联通充值卡 小灵通充值卡 移动充值卡 ','16','50','','','0','','1','5',''), ('13','小灵通充值卡','','','12','50','','','0','','1','5','0'), ('14','移动充值卡','','','12','50','','','0','','1','5','0'), ('15','联通充值卡','','','12','50','','','0','','1','5','0'), ('16','运动户外','','','0','11','','','0','','1','5',''), ('17','运动鞋','','3G手机 GSM手机 CDMA手机 ','16','2','','','0','','1','5',''), ('18','3G手机','','','17','50','','','0','','1','5','0'), ('21','女装','','','0','10','','个','1','','1','10','243,246,245,242,244'), ('22','T恤/POLO','','电话机 电熨斗 清洁机 饮水机','21','50','','','0','','1','0','238,239'), ('23','POLO衫','','','22','50','','','0','','1','0',''), ('26','短袖T恤','','','22','50','','','0','','1','0',''), ('27','长袖T恤','','','22','50','','','0','','1','0',''), ('29','衬衫','','燃气炉 电饭煲 电磁炉 电水壶 ','21','50','','','0','','1','0',''), ('30','长袖衬衫','','','29','50','','','0','','1','0',''), ('624','皮衣','','','39','50','','','0','','1','0',''), ('32','短袖衬衫','','','29','50','','','0','','1','0',''), ('33','分袖衬衫','','','29','50','','','0','','1','0',''), ('34','裤子','','吹风机 血压计 剃须刀','21','50','','','0','','1','0',''), ('35','牛仔分裤','','','34','50','','','0','','1','0',''), ('36','牛仔短裤','','','34','50','','','0','','1','0',''), ('37','休闲裤','','','34','50','','','0','','1','0',''), ('38','牛仔裤','','','34','50','','','0','','1','0',''), ('39','外套','','车载电源 GPS导航 汽车护理 ','21','50','','','0','','1','0',''), ('40','卫衣','','汽车护理 车内饰品 车载电源','39','50','','','0','','1','0',''), ('41','西装','','','39','50','','','0','','1','0',''), ('42','羽绒服','','','39','50','','','0','','1','0',''), ('43','棉服','','','39','50','','','0','','1','0',''), ('44','鞋靴','','','0','13','','','0','','1','0',''), ('45','家居用品','','卫浴用品 家纺毛巾','44','50','','','0','','1','0','0'), ('46','被子','','','45','50','','','0','','1','0','0'), ('47','枕头','','','45','50','','','0','','1','0','0'), ('48','家纺毛巾','','','45','50','','','0','','1','0','0'), ('49','卫浴用品','','','45','50','','','0','','1','0','0'), ('50','女鞋','','童鞋 腰带 休闲鞋 ','44','50','','','0','','1','0',''), ('51','休闲鞋','','','50','50','','','0','','1','0','0'), ('52','童鞋','','','50','50','','','0','','1','0','0'), ('53','腰带','','','50','50','','','0','','1','0','0'), ('54','礼品箱包','','瑞士军刀 工艺藏品 烟具 ','44','50','','','0','','1','0','0'), ('55','烟具','','','54','50','','','0','','1','0','0'), ('56','瑞士军刀','','','54','50','','','0','','1','0','0'), ('57','工艺藏品','','','54','50','','','0','','1','0','0'), ('58','钟表首饰','','国产表店 日本表店 流行饰品 ','44','50','','','0','','1','0',''), ('59','日本表店','','','58','50','','','0','','1','0','0'), ('60','流行饰品','','','58','50','','','0','','1','0','0'), ('61','国产表店','','','58','50','','','0','','1','0','0'), ('62','运动健康','','室内球类 运动器材 户外装备 ','44','50','','','0','','1','0','0'), ('63','运动器材','','','62','50','','','0','','1','0','0'), ('64','户外装备','','','62','50','','','0','','1','0','0'), ('65','室内球类','','','62','50','','','0','','1','0','0'), ('66','趣味玩具','','遥控玩具 电动玩具 ','44','50','','','0','','1','0','0'), ('67','电动玩具','','','66','50','','','0','','1','0','0'), ('68','遥控玩具','','','66','50','','','0','','1','0','0'), ('69','母婴童','','','0','12','','','0','','1','0',''), ('70','童装','','台式机 服务器 笔记本 ','69','50','','','0','','1','0',''), ('71','笔记本','','','70','50','','','0','','1','0','0'), ('72','台式机','','','70','50','','','0','','1','0','0'), ('73','服务器','','','70','50','','','0','','1','0','0'), ('74','婴童洗护','','光驱 显卡 CPU 主板','69','50','','','0','','1','0',''), ('75','CPU','','','74','50','','','0','','1','0','0'), ('76','硬盘','','','74','50','','','0','','1','0','0'), ('77','内存','','','74','50','','','0','','1','0','0'), ('78','显卡','','','74','50','','','0','','1','0','0'), ('79','主板','','','74','50','','','0','','1','0','0'), ('80','声卡','','','74','50','','','0','','1','0','0'), ('81','光驱','','','74','50','','','0','','1','0','0'), ('82','散热器','','','74','50','','','0','','1','0','0'), ('83','孕妈专区','','显示器 电源 主机箱 ','69','50','','','0','','1','0',''), ('84','显示器','','','83','50','','','0','','1','0','0'), ('111','硒鼓','','','101','50','','个','0','','1','5','230'), ('86','鼠标','','','83','50','','','0','','1','0','0'), ('87','键盘','','','83','50','','','0','','1','0','0'), ('88','电源','','','83','50','','','0','','1','0','0'), ('89','婴儿装','','一体机  复印机 打印机 ','69','50','','','0','','1','0',''), ('90','打印机','','','89','50','','','0','','1','0','0'), ('91','一体机','','','89','50','','','0','','1','0','0'), ('92','复印机','','','89','50','','','0','','1','0','0'), ('93','玩具/早教','','路由器  网卡 交换机 ','69','50','','','0','','1','0',''), ('94','路由器','','','93','50','','','0','','1','0','0'), ('95','网卡','','','93','50','','','0','','1','0','0'), ('96','交换机','','','93','50','','','0','','1','0','0'), ('97','喂养用品','','游戏软件 杀毒软件 办公软件 ','69','50','','','0','','1','0',''), ('98','杀毒软件','','','97','50','','','0','','1','0','0'), ('99','办公软件','','','97','50','','','0','','1','0','0'), ('100','游戏软件','','','97','50','','','0','','1','0','0'), ('101','童鞋','',' 色带  墨盒 墨粉 ','69','50','','','0','','1','0',''), ('102','墨盒','','','101','50','','','0','','1','0','0'), ('103','墨粉','','','101','50','','','0','','1','0','0'), ('104','色带','','','101','50','','','0','','1','0','0'), ('117','便携相机','','','116','50','','','0','','1','0',''), ('118','单反相机','','','116','50','','','0','','1','0',''), ('119','数码摄像机','','','116','50','','','0','','1','0',''), ('120','运动服','','MP3/MP4  MP3/MP4配件 苹果配件 录音笔','16','1','','','0','','1','0','');
INSERT INTO `abs_category` VALUES ('110','针织衫','','电吹风 电蚊香','21','50','','3','0','','1','0',''), ('112','UPS电源','','','74','50','','','0','','1','0','0'), ('217','衬衫','','','216','50','','','0','','1','0',''), ('625','夹克','','','39','50','','','0','','1','0',''), ('116','运动包','','便携相机\r\n单反相机\r\n数码摄像机','16','3','','','0','','1','0',''), ('201','MP3/MP4','','','120','50','','','0','','1','0',''), ('132','男装','','','0','9','','','1','','1','0',''), ('114','套头衫','','','110','50','','','0','','1','0',''), ('115','开衫','','','110','50','','','0','','1','0',''), ('121','男鞋','','乳液/面霜 身体护理 彩妆 香水','44','50','','','0','','1','0',''), ('122','乳液/面霜','','','121','50','','','0','','1','0',''), ('123','身体护理','','','121','50','','','0','','1','0',''), ('124','裙','','动漫人物 遥控玩具 毛绒布艺 益智玩具','21','50','','','0','','1','0',''), ('125','半裙','','','124','50','','','0','','1','0',''), ('126','连衣裙','','','124','50','','','0','','1','0',''), ('127','吊带裙','','','124','50','','','0','','1','0',''), ('216','男装','','','215','50','','','0','','1','0',''), ('215','箱包','','','0','14','','','0','','1','0',''), ('634','西裤','','','34','50','','','0','','1','0',''), ('627','大衣','','','39','50','','','0','','1','0',''), ('626','风衣','','','39','50','','','0','','1','0',''), ('138','针织衫','','','132','50','','','0','','1','0',''), ('139','针织背心','','','138','50','','','0','','1','0',''), ('140','套头衫','','','138','50','','','0','','1','0',''), ('141','开衫','','','138','50','','','0','','1','0',''), ('628','短袖针织衫','','','110','50','','','0','','1','0',''), ('629','休闲分裤','','','170','50','','','0','','1','0',''), ('630','休闲短裤','','','34','50','','','0','','1','0',''), ('631','哈伦裤','','','34','50','','','0','','1','0',''), ('632','连身裤','','','34','50','','','0','','1','0',''), ('633','打底裤','','','34','50','','','0','','1','0',''), ('154','内衣','','','132','50','','','0','','1','0',''), ('635','中老年服装','','','21','50','','','0','','1','0',''), ('156','内衣/套装','','','154','50','','','0','','1','0',''), ('157','袜子','','','154','50','','','0','','1','0',''), ('158','家居服','','','154','50','','','0','','1','0',''), ('159','内裤','','','154','50','','','0','','1','0',''), ('160','外套','','','132','50','','','0','','1','0',''), ('161','皮衣/皮草','','','160','50','','','0','','1','0',''), ('162','卫衣','','','160','50','','','0','','1','0',''), ('163','风衣','','','160','50','','','0','','1','0',''), ('164','大衣','','','160','50','','','0','','1','0',''), ('166','西服','','','160','50','','','0','','1','0',''), ('167','棉服','','','160','50','','','0','','1','0',''), ('168','羽绒服','','','160','50','','','0','','1','0',''), ('169','夹克','','','160','50','','','0','','1','0',''), ('170','裤子','','','132','50','','','1','','1','9','246,245,242,244,243'), ('171','西裤','','','170','50','','','0','','1','0',''), ('172','牛仔中裤','','','170','50','','','0','','1','0',''), ('173','休闲裤','','','170','50','','','0','','1','0',''), ('174','牛仔裤','','','170','50','','','0','','1','0',''), ('175','T恤','','','132','50','','','0','','1','0',''), ('176','长袖T恤','','','175','50','','','0','','1','0',''), ('178','短袖T恤','','','175','50','','','0','','1','0',''), ('179','背心','','','175','50','','','0','','1','0',''), ('639','裤装','','','635','50','','','0','','1','0',''), ('638','衬衫','','','635','50','','','0','','1','0',''), ('182','POLO衫','','','132','50','','','0','','1','0',''), ('185','长袖POLO衫','','','182','50','','','0','','1','0',''), ('636','T恤','','','635','50','','','0','','1','0',''), ('188','短袖POLO衫','','','182','50','','','0','','1','0',''), ('637','针织衫','','','635','50','','','0','','1','0',''), ('190','衬衫','','','132','50','','','0','','1','0',''), ('193','短袖衬衫','','','190','50','','','0','','1','0',''), ('194','长袖衬衫','','','190','50','','','0','','1','0',''), ('623','休闲短裤','','','170','50','','','0','','1','0',''), ('202','MID','','','120','50','','','0','','1','0',''), ('203','耳机','','','116','50','','','0','','1','0',''), ('204','音箱','','','120','50','','','0','','1','0',''), ('205','高清播放器','','','120','50','','','0','','1','0',''), ('206','电子书','','','120','50','','','0','','1','0',''), ('207','电子词典','','','120','50','','','0','','1','0',''), ('208','MP3/MP4配件','','','120','50','','','0','','1','0',''), ('209','录音笔','','','120','50','','','0','','1','0',''), ('210','麦克风','','','120','50','','','0','','1','0',''), ('211','专业音频','','','120','50','','','0','','1','0',''), ('212','电子教育','','','120','50','','','0','','1','0',''), ('213','数码相框','','','120','50','','','0','','1','0',''), ('214','苹果配件','','','120','50','','','0','','1','0',''), ('218','T恤','','','216','50','','','0','','1','0',''), ('219','针织','','','216','50','','','0','','1','0',''), ('220','外套','','','216','50','','','0','','1','0',''), ('221','羽绒服','','','216','50','','','0','','1','0',''), ('222','裤子','','','216','50','','','0','','1','0',''), ('223','女装','','','215','50','','','0','','1','0',''), ('224','衬衫','','','223','50','','','0','','1','0',''), ('225','T恤','','','223','50','','','0','','1','0',''), ('226','针织','','','223','50','','','0','','1','0',''), ('227','外套','','','223','50','','','0','','1','0',''), ('228','裙子','','','223','50','','','0','','1','0',''), ('229','羽绒服','','','223','50','','','0','','1','0',''), ('230','裤子','','','223','50','','','0','','1','0',''), ('231','孕妇装','','','223','50','','','0','','1','0',''), ('232','皮衣','','','223','50','','','0','','1','0',''), ('233','运动','','','215','50','','','0','','1','0',''), ('234','运动装','','','233','50','','','0','','1','0',''), ('235','运动鞋','','','233','50','','','0','','1','0',''), ('236','运动配件','','','233','50','','','0','','1','0',''), ('237','内衣','','','215','50','','','0','','1','0',''), ('238','文胸','','','237','50','','','0','','1','0','');
INSERT INTO `abs_category` VALUES ('239','内裤','','','237','50','','','0','','1','0',''), ('240','背心','','','237','50','','','0','','1','0',''), ('241','塑身','','','237','50','','','0','','1','0',''), ('242','睡衣','','','237','50','','','0','','1','0',''), ('243','家居','','','237','50','','','0','','1','0',''), ('244','袜子','','','237','50','','','0','','1','0',''), ('245','情趣','','','237','50','','','0','','1','0',''), ('246','保暖','','','237','50','','','0','','1','0',''), ('247','配饰','','','215','50','','','0','','1','0',''), ('248','眼镜','','','247','50','','','0','','1','0',''), ('249','腰带','','','247','50','','','0','','1','0',''), ('250','帽子','','','247','50','','','0','','1','0',''), ('251','围巾','','','247','50','','','0','','1','0',''), ('252','手套','','','247','50','','','0','','1','0',''), ('253','领带','','','247','50','','','0','','1','0',''), ('254','袖扣','','','247','50','','','0','','1','0',''), ('255','鞋靴','','','215','50','','','0','','1','0',''), ('256','男鞋','','','255','50','','','0','','1','0',''), ('257','女鞋','','','255','50','','','0','','1','0',''), ('258','拖鞋','','','255','50','','','0','','1','0',''), ('259','童鞋','','','255','50','','','0','','1','0',''), ('260','童装','','','215','50','','','0','','1','0',''), ('261','女童','','','260','50','','','0','','1','0',''), ('262','男童','','','260','50','','','0','','1','0',''), ('263','宝宝服饰','','','260','50','','','0','','1','0',''), ('264','亲子装','','','260','50','','','0','','1','0',''), ('265','配饰','','','0','15','','','0','','1','0',''), ('266','饰品','','','265','50','','','0','','1','0',''), ('267','洁面乳','','','266','50','','','0','','1','0',''), ('268','爽肤水','','','266','50','','','0','','1','0',''), ('269','精华露','','','266','50','','','0','','1','0',''), ('270','乳液面霜','','','266','50','','','0','','1','0',''), ('271','面膜面贴','','','266','50','','','0','','1','0',''), ('272','眼部护理','','','266','50','','','0','','1','0',''), ('273','颈部护理','','','266','50','','','0','','1','0',''), ('274','T区护理','','','266','50','','','0','','1','0',''), ('275','护肤套装','','','266','50','','','0','','1','0',''), ('276','防晒隔离','','','266','50','','','0','','1','0',''), ('277','配饰','','','265','50','','','0','','1','0',''), ('278','洗发护发','','','277','50','','','0','','1','0',''), ('279','染发/造型','','','277','50','','','0','','1','0',''), ('280','沐浴','','','277','50','','','0','','1','0',''), ('281','磨砂/浴盐','','','277','50','','','0','','1','0',''), ('282','身体乳','','','277','50','','','0','','1','0',''), ('283','手工/香皂','','','277','50','','','0','','1','0',''), ('284','香薰精油','','','277','50','','','0','','1','0',''), ('285','纤体瘦身','','','277','50','','','0','','1','0',''), ('286','脱毛膏','','','277','50','','','0','','1','0',''), ('287','手足护理','','','277','50','','','0','','1','0',''), ('288','洗护套装','','','277','50','','','0','','1','0',''), ('289','手表','','','265','50','','','0','','1','0',''), ('290','牙膏/牙粉','','','289','50','','','0','','1','0',''), ('291','漱口水','','','289','50','','','0','','1','0',''), ('292','牙刷/牙线','','','289','50','','','0','','1','0',''), ('293','女性护理','','','265','50','','','0','','1','0',''), ('294','卫生巾','','','293','50','','','0','','1','0',''), ('295','卫生护垫','','','293','50','','','0','','1','0',''), ('296','洗液','','','293','50','','','0','','1','0',''), ('297','美容食品','','','293','50','','','0','','1','0',''), ('298','其它','','','293','50','','','0','','1','0',''), ('299','男士护理','','','265','50','','','0','','1','0',''), ('300','脸部','','','299','50','','','0','','1','0',''), ('301','眼部','','','299','50','','','0','','1','0',''), ('302','身体护理','','','299','50','','','0','','1','0',''), ('303','男士香水','','','299','50','','','0','','1','0',''), ('304','剃须','','','299','50','','','0','','1','0',''), ('305','防脱洗护','','','299','50','','','0','','1','0',''), ('306','唇膏','','','299','50','','','0','','1','0',''), ('307','魅力彩妆','','','265','50','','','0','','1','0',''), ('308','粉底/遮瑕','','','307','50','','','0','','1','0',''), ('309','腮红','','','307','50','','','0','','1','0',''), ('310','眼影/眼线','','','307','50','','','0','','1','0',''), ('311','眉笔','','','307','50','','','0','','1','0',''), ('312','睫毛膏','','','307','50','','','0','','1','0',''), ('313','唇膏唇彩','','','307','50','','','0','','1','0',''), ('314','彩妆组合','','','307','50','','','0','','1','0',''), ('315','卸妆','','','293','50','','','0','','1','0',''), ('316','美甲','','','293','50','','','0','','1','0',''), ('317','彩妆工具','','','293','50','','','0','','1','0',''), ('318','帽子','','','265','50','','','0','','1','0',''), ('319','女士香水','','','318','50','','','0','','1','0',''), ('320','男士香水','','','318','50','','','0','','1','0',''), ('321','组合套装','','','318','50','','','0','','1','0',''), ('322','迷你香水','','','318','50','','','0','','1','0',''), ('323','香体走珠','','','318','50','','','0','','1','0',''), ('324','美妆','','','0','16','','','0','','1','0',''), ('325','个人洗护','','','324','50','','','0','','1','0',''), ('326','钱包/卡包','','','325','50','','','0','','1','0',''), ('327','手拿包','','','325','50','','','0','','1','0',''), ('328','单肩包','','','325','50','','','0','','1','0',''), ('329','双肩包','','','325','50','','','0','','1','0',''), ('330','手提包','','','325','50','','','0','','1','0',''), ('331','斜挎包','','','325','50','','','0','','1','0',''), ('332','时尚男包','','','324','50','','','0','','0','0',''), ('333','钱包/手包','','','332','50','','','0','','1','0',''), ('334','男士手包','','','332','50','','','0','','1','0',''), ('335','腰带/礼盒','','','332','50','','','0','','1','0',''), ('336','商务公文包','','','332','50','','','0','','1','0',''), ('337','休闲包','','','332','50','','','0','','1','0',''), ('338','腰包','','','332','50','','','0','','1','0','');
INSERT INTO `abs_category` VALUES ('339','功能箱包','','','324','50','','','0','','0','0',''), ('340','电脑数码包','','','339','50','','','0','','1','0',''), ('341','拉杆箱','','','339','50','','','0','','1','0',''), ('342','旅行包','','','339','50','','','0','','1','0',''), ('343','旅行配件','','','339','50','','','0','','1','0',''), ('344','运动包','','','339','50','','','0','','1','0',''), ('345','登山包','','','339','50','','','0','','1','0',''), ('346','妈咪包','','','339','50','','','0','','1','0',''), ('347','书包','','','339','50','','','0','','1','0',''), ('348','香水精油','','','324','50','','','0','','1','0',''), ('349','火机烟具','','','348','50','','','0','','1','0',''), ('350','礼品文具','','','348','50','','','0','','1','0',''), ('351','瑞士军刀','','','348','50','','','0','','1','0',''), ('352','收藏品','','','348','50','','','0','','1','0',''), ('353','工艺摆件','','','348','50','','','0','','1','0',''), ('354','创意礼品','','','348','50','','','0','','1','0',''), ('355','礼卡礼券','','','348','50','','','0','','1','0',''), ('356','鲜花速递','','','348','50','','','0','','1','0',''), ('357','婚庆用品','','','348','50','','','0','','1','0',''), ('358','奢侈品','','','324','50','','','0','','1','0',''), ('359','GUCCI','','','358','50','','','0','','1','0',''), ('360','PRADA','','','358','50','','','0','','1','0',''), ('361','FENDI','','','358','50','','','0','','1','0',''), ('362','BURBERRY','','','358','50','','','0','','1','0',''), ('363','BOTTEGA VENETA','','','358','50','','','0','','1','0',''), ('364','DIOR','','','358','50','','','0','','1','0',''), ('365','Ferragamo','','','358','50','','','0','','1','0',''), ('366','MONTBLANC','','','358','50','','','0','','1','0',''), ('367','ARMANI','','','358','50','','','0','','1','0',''), ('368','RIMOWA','','','358','50','','','0','','1','0',''), ('369','MIUMIU','','','358','50','','','0','','1','0',''), ('370','BALENCIAGA','','','358','50','','','0','','1','0',''), ('371','Dolce&Gabbana','','','358','50','','','0','','1','0',''), ('372','MARC JACOBS','','','358','50','','','0','','1','0',''), ('373','COACH','','','358','50','','','0','','1','0',''), ('374','更多品牌','','','358','50','','','0','','1','0',''), ('375','面部护理','','','324','50','','','0','','1','0',''), ('376','瑞士品牌','','','375','50','','','0','','1','0',''), ('377','国产品牌','','','375','50','','','0','','1','0',''), ('378','日本品牌','','','375','50','','','0','','1','0',''), ('379','时尚品牌','','','375','50','','','0','','1','0',''), ('380','闹钟挂钟','','','375','50','','','0','','1','0',''), ('381','儿童手表','','','375','50','','','0','','1','0',''), ('382','彩妆','','','324','50','','','0','','1','0',''), ('383','纯金K金饰品','','','382','50','','','0','','1','0',''), ('384','金银投资','','','382','50','','','0','','1','0',''), ('385','银饰','','','382','50','','','0','','1','0',''), ('386','钻石饰品','','','382','50','','','0','','1','0',''), ('387','翡翠玉石','','','382','50','','','0','','1','0',''), ('388','水晶玛瑙','','','382','50','','','0','','1','0',''), ('389','宝石珍珠','','','382','50','','','0','','1','0',''), ('390','时尚饰品','','','382','50','','','0','','1','0',''), ('391','家居','','','0','17','','','0','','1','0',''), ('392','户外鞋服','','','391','50','','','0','','1','0',''), ('393','户外服装','','','392','50','','','0','','1','0',''), ('394','户外鞋袜','','','392','50','','','0','','1','0',''), ('395','户外配饰','','','392','50','','','0','','1','0',''), ('396','户外装备','','','391','50','','','0','','1','0',''), ('397','帐篷','','','396','50','','','0','','1','0',''), ('398','睡袋','','','396','50','','','0','','1','0',''), ('399','登山攀岩','','','396','50','','','0','','1','0',''), ('400','户外背包','','','396','50','','','0','','1','0',''), ('401','户外照明','','','396','50','','','0','','1','0',''), ('402','户外垫子','','','396','50','','','0','','1','0',''), ('403','户外仪表','','','396','50','','','0','','1','0',''), ('404','户外工具','','','396','50','','','0','','1','0',''), ('405','望远镜','','','396','50','','','0','','1','0',''), ('406','垂钓用品','','','396','50','','','0','','1','0',''), ('407','旅游用品','','','396','50','','','0','','1','0',''), ('408','便携桌椅床','','','396','50','','','0','','1','0',''), ('409','烧烤用品','','','396','50','','','0','','1','0',''), ('410','野餐炊具','','','396','50','','','0','','1','0',''), ('411','军迷用品','','','396','50','','','0','','1','0',''), ('412','游泳用具','','','396','50','','','0','','1','0',''), ('413','泳衣','','','396','50','','','0','','1','0',''), ('414','运动器械','','','391','50','','','0','','1','0',''), ('415','健身器械','','','414','50','','','0','','1','0',''), ('416','运动器材','','','414','50','','','0','','1','0',''), ('417','防护器具','','','414','50','','','0','','1','0',''), ('418','骑行运动','','','414','50','','','0','','1','0',''), ('419','极限运动','','','414','50','','','0','','1','0',''), ('420','武术搏击','','','414','50','','','0','','1','0',''), ('421','纤体瑜伽','','','391','50','','','0','','1','0',''), ('422','瑜伽垫','','','421','50','','','0','','1','0',''), ('423','瑜伽服','','','421','50','','','0','','1','0',''), ('424','瑜伽配件','','','421','50','','','0','','1','0',''), ('425','瑜伽套装','','','421','50','','','0','','1','0',''), ('426','舞蹈鞋服','','','421','50','','','0','','1','0',''), ('427','体育娱乐','','','391','50','','','0','','1','0',''), ('428','羽毛球','','','427','50','','','0','','1','0',''), ('429','乒乓球','','','427','50','','','0','','1','0',''), ('430','篮球','','','427','50','','','0','','1','0',''), ('431','足球','','','427','50','','','0','','1','0',''), ('432','网球','','','427','50','','','0','','1','0',''), ('433','排球','','','427','50','','','0','','1','0',''), ('434','高尔夫球','','','427','50','','','0','','1','0',''), ('435','棋牌麻将','','','427','50','','','0','','1','0',''), ('436','其他','','','427','50','','','0','','1','0',''), ('437','成人用品','','','391','50','','','0','','1','0',''), ('438','安全避孕','','','437','50','','','0','','1','0','');
INSERT INTO `abs_category` VALUES ('439','验孕测孕','','','437','50','','','0','','1','0',''), ('440','人体润滑','','','437','50','','','0','','1','0',''), ('441','情爱玩具','','','437','50','','','0','','1','0',''), ('442','情趣内衣','','','437','50','','','0','','1','0',''), ('443','组合套装','','','437','50','','','0','','1','0',''), ('444','保健器械','','','391','50','','','0','','1','0',''), ('445','养生器械','','','444','50','','','0','','1','0',''), ('446','保健用品','','','444','50','','','0','','1','0',''), ('447','康复辅助','','','444','50','','','0','','1','0',''), ('448','家庭护理','','','444','50','','','0','','1','0',''), ('449','急救卫生','','','391','50','','','0','','1','0',''), ('450','跌打损伤','','','449','50','','','0','','1','0',''), ('451','烫伤止痒','','','449','50','','','0','','1','0',''), ('452','防裂抗冻','','','449','50','','','0','','1','0',''), ('453','口腔咽部','','','449','50','','','0','','1','0',''), ('454','眼部保健','','','449','50','','','0','','1','0',''), ('455','鼻炎健康','','','449','50','','','0','','1','0',''), ('456','风湿骨痛','','','449','50','','','0','','1','0',''), ('457','生殖泌尿','','','449','50','','','0','','1','0',''), ('458','美体塑身','','','449','50','','','0','','1','0',''), ('459','手机数码','','','0','19','','','0','','0','0',''), ('460','奶粉','','','459','50','','','0','','1','0',''), ('461','1段','','','460','50','','','0','','1','0',''), ('462','2段','','','460','50','','','0','','1','0',''), ('463','3段','','','460','50','','','0','','1','0',''), ('464','4段','','','460','50','','','0','','1','0',''), ('465','羊奶粉','','','460','50','','','0','','1','0',''), ('466','特殊配方','','','460','50','','','0','','1','0',''), ('467','营养辅食','','','459','50','','','0','','1','0',''), ('468','营养品','','','467','50','','','0','','1','0',''), ('469','初乳','','','467','50','','','0','','1','0',''), ('470','米粉/菜粉','','','467','50','','','0','','1','0',''), ('471','泥糊/果汁','','','467','50','','','0','','1','0',''), ('472','肉松/饼干','','','467','50','','','0','','1','0',''), ('473','辅食/零食','','','467','50','','','0','','1','0',''), ('474','尿裤湿巾','','','459','50','','','0','','1','0',''), ('475','新生儿','','','474','50','','','0','','1','0',''), ('476','S号','','','474','50','','','0','','1','0',''), ('477','M号','','','474','50','','','0','','1','0',''), ('478','L号','','','474','50','','','0','','1','0',''), ('479','XL/XXL号','','','474','50','','','0','','1','0',''), ('480','裤型尿裤','','','474','50','','','0','','1','0',''), ('481','湿巾纸巾','','','474','50','','','0','','1','0',''), ('482','尿布/尿垫','','','474','50','','','0','','1','0',''), ('483','喂养用品','','','459','50','','','0','','1','0',''), ('484','奶瓶/奶嘴','','','483','50','','','0','','1','0',''), ('485','辅助用品','','','483','50','','','0','','1','0',''), ('486','吸奶器','','','483','50','','','0','','1','0',''), ('487','消毒用具','','','483','50','','','0','','1','0',''), ('488','餐具饮具','','','483','50','','','0','','1','0',''), ('489','牙胶','','','483','50','','','0','','1','0',''), ('490','洗护用品','','','459','50','','','0','','1','0',''), ('491','护肤用品','','','490','50','','','0','','1','0',''), ('492','洗浴用品','','','490','50','','','0','','1','0',''), ('493','洗发沐浴','','','490','50','','','0','','1','0',''), ('494','清洁用品','','','490','50','','','0','','1','0',''), ('495','护理用品','','','490','50','','','0','','1','0',''), ('496','童车童床','','','459','50','','','0','','1','0',''), ('497','婴儿推车','','','496','50','','','0','','1','0',''), ('498','餐椅摇椅','','','496','50','','','0','','1','0',''), ('499','婴儿床','','','496','50','','','0','','1','0',''), ('500','学步车','','','496','50','','','0','','1','0',''), ('501','三轮车','','','496','50','','','0','','1','0',''), ('502','自行车','','','496','50','','','0','','1','0',''), ('503','电动车','','','496','50','','','0','','1','0',''), ('504','健身车','','','496','50','','','0','','1','0',''), ('505','寝具服饰','','','459','50','','','0','','1','0',''), ('506','婴儿服装','','','505','50','','','0','','1','0',''), ('507','婴儿鞋袜','','','505','50','','','0','','1','0',''), ('508','婴儿床品','','','505','50','','','0','','1','0',''), ('509','安全用品','','','505','50','','','0','','1','0',''), ('510','其他','','','505','50','','','0','','1','0',''), ('511','妈妈专区','','','459','50','','','0','','1','0',''), ('512','妈妈食品','','','511','50','','','0','','1','0',''), ('513','妈妈护理','','','511','50','','','0','','1','0',''), ('514','孕服/内衣','','','511','50','','','0','','1','0',''), ('515','防辐射服','','','511','50','','','0','','1','0',''), ('516','洗护/祛纹','','','511','50','','','0','','1','0',''), ('517','产后塑身','','','511','50','','','0','','1','0',''), ('518','包/背婴带','','','511','50','','','0','','1','0',''), ('519','玩具乐器','','','459','50','','','0','','1','0',''), ('520','适用年龄','','','519','50','','','0','','1','0',''), ('521','遥控/电动','','','519','50','','','0','','1','0',''), ('522','毛绒布艺','','','519','50','','','0','','1','0',''), ('523','娃娃玩具','','','519','50','','','0','','1','0',''), ('524','模型玩具','','','519','50','','','0','','1','0',''), ('525','健身玩具','','','519','50','','','0','','1','0',''), ('526','动漫玩具','','','519','50','','','0','','1','0',''), ('527','益智玩具','','','519','50','','','0','','1','0',''), ('528','积木拼插','','','519','50','','','0','','1','0',''), ('529','DIY玩具','','','519','50','','','0','','1','0',''), ('530','创意减压','','','519','50','','','0','','1','0',''), ('531','乐器相关','','','519','50','','','0','','1','0',''), ('532','食品酒饮','','','0','19','','','0','','0','0',''), ('533','进口食品','','','532','1','','','0','','1','0',''), ('534','饼干蛋糕','','','533','50','','','0','','1','0',''), ('535','糖果巧克力','','','533','50','','','0','','1','0',''), ('536','休闲零食','','','533','50','','','0','','1','0',''), ('537','冲调饮品','','','533','50','','','0','','1','0',''), ('538','粮油调味','','','533','50','','','0','','1','0','');
INSERT INTO `abs_category` VALUES ('539','地方特产','','','532','50','','','0','','1','0',''), ('540','华北','','','539','50','','','0','','1','0',''), ('541','西北','','','539','50','','','0','','1','0',''), ('542','西南','','','539','50','','','0','','1','0',''), ('543','东北','','','539','50','','','0','','1','0',''), ('544','华南','','','539','50','','','0','','1','0',''), ('545','华东','','','539','50','','','0','','1','0',''), ('546','华中','','','539','50','','','0','','1','0',''), ('547','休闲食品','','','532','50','','','0','','1','0',''), ('548','休闲零食','','','547','50','','','0','','1','0',''), ('549','坚果炒货','','','547','50','','','0','','1','0',''), ('550','肉干肉松','','','547','50','','','0','','1','0',''), ('551','蜜饯果脯','','','547','50','','','0','','1','0',''), ('552','糖果/巧克力','','','547','50','','','0','','1','0',''), ('553','饼干蛋糕','','','547','50','','','0','','1','0',''), ('554','粮油调味','','','532','50','','','0','','1','0',''), ('555','米面杂粮','','','554','50','','','0','','1','0',''), ('556','食用油','','','554','50','','','0','','1','0',''), ('557','调味品','','','554','50','','','0','','1','0',''), ('558','南北干货','','','554','50','','','0','','1','0',''), ('559','方便食品','','','554','50','','','0','','1','0',''), ('560','有机食品','','','554','50','','','0','','1','0',''), ('561','酒饮冲调','','','532','50','','','0','','1','0',''), ('562','白酒/黄酒','','','561','50','','','0','','1','0',''), ('563','葡萄酒','','','561','50','','','0','','1','0',''), ('564','洋酒','','','561','50','','','0','','1','0',''), ('565','啤酒','','','561','50','','','0','','1','0',''), ('566','饮料','','','561','50','','','0','','1','0',''), ('567','冲调','','','561','50','','','0','','1','0',''), ('568','咖啡/奶茶','','','561','50','','','0','','1','0',''), ('569','茗茶','','','561','50','','','0','','1','0',''), ('570','营养健康','','','532','50','','','0','','1','0',''), ('571','基础营养','','','570','50','','','0','','1','0',''), ('572','美体养颜','','','570','50','','','0','','1','0',''), ('573','滋补调养','','','570','50','','','0','','1','0',''), ('574','骨骼健康','','','570','50','','','0','','1','0',''), ('575','保健茶饮','','','570','50','','','0','','1','0',''), ('576','成分保健','','','570','50','','','0','','1','0',''), ('577','亚健康','','','532','50','','','0','','1','0',''), ('578','调节三高','','','577','50','','','0','','1','0',''), ('579','心脑养护','','','577','50','','','0','','1','0',''), ('580','改善睡眠','','','577','50','','','0','','1','0',''), ('581','肝肾养护','','','577','50','','','0','','1','0',''), ('582','免疫调节','','','577','50','','','0','','1','0',''), ('583','更多调理','','','577','50','','','0','','1','0',''), ('584','健康礼品','','','532','50','','','0','','1','0',''), ('585','参茸礼品','','','584','50','','','0','','1','0',''), ('586','更多礼品','','','584','50','','','0','','1','0',''), ('587','生鲜食品','','','532','50','','','0','','1','0',''), ('588','水果','','','587','50','','','0','','1','0',''), ('589','蔬菜','','','587','50','','','0','','1','0',''), ('590','海鲜水产','','','587','50','','','0','','1','0',''), ('591','禽蛋','','','587','50','','','0','','1','0',''), ('592','鲜肉','','','587','50','','','0','','1','0',''), ('593','加工类肉食','','','587','50','','','0','','1','0',''), ('594','冻品','','','587','50','','','0','','1','0',''), ('595','半成品','','','587','50','','','0','','1','0',''), ('596','电脑办公','','','0','20','','','0','','0','0',''), ('597','彩票','','','596','50','','','0','','1','0',''), ('598','双色球','','','597','50','','','0','','1','0',''), ('599','大乐透','','','597','50','','','0','','1','0',''), ('600','福彩3D','','','597','50','','','0','','1','0',''), ('601','排列三','','','597','50','','','0','','1','0',''), ('602','排列五','','','597','50','','','0','','1','0',''), ('603','七星彩','','','597','50','','','0','','1','0',''), ('604','七乐彩','','','597','50','','','0','','1','0',''), ('605','竞彩足球','','','597','50','','','0','','1','0',''), ('606','竞彩篮球','','','597','50','','','0','','1','0',''), ('607','机票','','','596','50','','','0','','1','0',''), ('608','国内机票','','','607','50','','','0','','1','0',''), ('609','酒店','','','596','50','','','0','','1','0',''), ('610','国内酒店','','','609','50','','','0','','1','0',''), ('611','充值','','','596','50','','','0','','1','0',''), ('612','手机充值','','','611','50','','','0','','1','0',''), ('613','游戏充值','','','611','50','','','0','','1','0',''), ('614','QQ充值','','','611','50','','','0','','1','0',''), ('615','票务','','','596','50','','','0','','1','0',''), ('616','音乐会','','','615','50','','','0','','1','0',''), ('617','演唱会','','','615','50','','','0','','1','0',''), ('618','话剧歌剧','','','615','50','','','0','','1','0',''), ('619','舞蹈芭蕾','','','615','50','','','0','','1','0',''), ('620','戏曲综艺','','','615','50','','','0','','1','0',''), ('621','体育赛事','','','615','50','','','0','','1','0',''), ('622','家电','','','0','50','','','0','','0','0',''), ('640','裙装','','','635','50','','','0','','1','0',''), ('641','内衣','','','21','50','','','0','','1','0',''), ('642','文胸','','','641','50','','','0','','1','0',''), ('643','内裤','','','641','50','','','0','','1','0',''), ('644','睡衣','','','641','50','','','0','','1','0',''), ('645','美体内衣','','','641','50','','','0','','1','0',''), ('646','套装/打底','','','641','50','','','0','','1','0',''), ('647','丝袜/裤袜','','','641','50','','','0','','1','0',''), ('648','日用','','','622','50','','','0','','1','0',''), ('649','厨房','','','622','50','','','0','','1','0',''), ('650','个人护理','','','622','50','','','0','','1','0',''), ('651','电饭煲','','','648','50','','','0','','1','0',''), ('652','豆浆机','','','648','50','','','0','','1','0',''), ('653','电压力锅','','','648','50','','','0','','1','0',''), ('654','榨汁机','','','648','50','','','0','','1','0',''), ('655','煮蛋器','','','648','50','','','0','','1','0','');
INSERT INTO `abs_category` VALUES ('656','电风扇','','','649','50','','','0','','1','0',''), ('657','加湿器/净化','','','649','50','','','0','','1','0',''), ('658','挂烫机/烘干','','','649','50','','','0','','1','0',''), ('659','照明','','','649','50','','','0','','1','0',''), ('660','美容/美发','','','650','50','','','0','','1','0',''), ('661','剃须刀','','','650','50','','','0','','1','0',''), ('662','美妆团购','','','324','50','','','0','','1','0',''), ('663','面部护理','','','662','50','','','0','','1','0',''), ('664','时尚彩妆','','','662','50','','','0','','1','0',''), ('665','个人洗护','','','662','50','','','0','','1','0',''), ('666','其他护理','','','662','50','','','0','','1','0',''), ('667','洁面','','','665','50','','','0','','1','0',''), ('668','爽肤水','','','665','50','','','0','','1','0',''), ('669','乳液面霜','','','665','50','','','0','','1','0',''), ('670','精华','','','665','50','','','0','','1','0',''), ('671','隔离/BB霜','','','663','50','','','0','','1','0',''), ('672','粉底粉饼','','','663','50','','','0','','1','0',''), ('673','眼影/眼线','','','663','50','','','0','','1','0',''), ('674','睫毛膏','','','663','50','','','0','','1','0',''), ('675','沐浴/润肤','','','666','50','','','0','','1','0',''), ('676','洗发/护发','','','666','50','','','0','','1','0',''), ('677','美发造型','','','666','50','','','0','','1','0',''), ('678','口腔护理','','','666','50','','','0','','1','0',''), ('679','眉笔眉粉','','','664','50','','','0','','1','0',''), ('680','唇部彩妆','','','664','50','','','0','','1','0',''), ('681','腮红','','','664','50','','','0','','1','0',''), ('682','美甲','','','664','50','','','0','','1','0','');
INSERT INTO `abs_cat_recommend` VALUES ('3','1'), ('3','2'), ('3','3'), ('5','1'), ('5','2'), ('5','3'), ('12','1'), ('12','2'), ('12','3'), ('13','3'), ('14','2'), ('14','3'), ('15','1'), ('15','2'), ('16','3'), ('17','3'), ('21','3'), ('22','3'), ('34','3'), ('69','3'), ('70','3'), ('83','3'), ('89','3'), ('101','3'), ('110','2'), ('110','3'), ('111','1'), ('120','3'), ('229','2');
INSERT INTO `abs_delivery_goods` VALUES ('1','1','13','0',NULL,'诺基亚5320 XpressMusic','诺基亚','ECS000013','1','','0','3',NULL), ('2','1','14','0',NULL,'诺基亚5800XM','诺基亚','ECS000014','1','','0','1',NULL), ('3','2','24','0',NULL,'P806','联想','ECS000024','1','','0','3',NULL), ('4','2','9','0',NULL,'诺基亚E66','诺基亚','ECS000009','1','','0','1',NULL), ('5','3','24','0',NULL,'P806','联想','ECS000024','1','','0','1',NULL), ('6','3','8','0',NULL,'飞利浦9@9v','飞利浦','ECS000008','1','','0','3',NULL), ('7','4','12','0',NULL,'摩托罗拉A810','摩托罗拉','ECS000012','1','','0','2',NULL), ('8','5','24','0',NULL,'P806','联想','ECS000024','1','','0','1',NULL), ('9','6','42','0',NULL,'乐华(ROWA)32英寸高清液晶电视LCD32M08','乐华','ECS000042','1',NULL,'0','1',NULL), ('10','7','91','0','','富士（FUJIFILM）Z71 数码相机（银色）','天翼','ECS000091','1',NULL,'0','1',''), ('11','7','90','0','','富士（FUJIFILM）Z71 数码相机（香槟色）','漫步者','ECS000090','1',NULL,'0','1',''), ('12','8','38','0','','三星（SAMSUNG）26英寸 高清液晶电视LA32B350F1','天翼','ECS000038','1',NULL,'0','1',''), ('13','8','39','0','','创维（Skyworth）37英寸液晶电视37L05HR（内置底座）','创维','ECS000039','1',NULL,'0','1',''), ('14','9','55','0','','三洋（Sanyo）ECJ-DF115MC　微电脑电饭煲','AMD','ECS000055','1',NULL,'0','1','颜色:黑色 \n屏幕尺寸:42英寸 \n'), ('15','9','66','0','','飞科（FLYCO）浮动旋转式剃须刀-FS812','AMD','ECS000066','1',NULL,'0','1','颜色:黑色 \n屏幕尺寸:42英寸 \n'), ('16','9','88','0','','索尼（sony）HDR-XR350E高清数码摄像机','漫步者','ECS000088','1',NULL,'0','1','颜色:黑色 \n屏幕尺寸:42英寸 \n'), ('17','10','92','0','','茵佳妮优雅公主风褶边修身轻盈衬衫 送胸花5121-1110045','白领','ECS000092','1',NULL,'0','1','颜色:红 \n尺寸:XL \n'), ('18','10','123','0','','美亿佳懒人沙发SF0505咖啡色','千弘','ECS000123','1',NULL,'0','1','颜色:黄 \n尺寸:XL \n'), ('19','10','121','0','','宝贝世家 儿童床品套件 海洋乐园 英国设计 精梳全棉 活性环保印染 儿童三件套','千弘','ECS000121','1',NULL,'0','1','颜色:黄 \n尺寸:XL \n'), ('20','11','49','0','','美的（Midea）空气加湿器 S30U-M1','乐华','ECS000049','1',NULL,'0','1','颜色:黑色 \n屏幕尺寸:42英寸 \n'), ('21','12','43','0','','乐华(ROWA)42英寸高清液晶电视LCD42M19','乐华','ECS000043','1',NULL,'0','1','颜色:黑色 \n屏幕尺寸:42英寸 \n'), ('22','13','134','0','','天使之城 新款 手工珍珠金线蕾丝衫雪纺衫LM0304 白色','  恒基伟业','ECS000000','1',NULL,'0','3','颜色:红 \n尺寸:XL \n'), ('23','13','135','0','','JIULALA 久拉拉 2013年夏装新款 女 撞色波浪装','金立','ECS000135','1',NULL,'0','1','颜色:黄 \n尺寸:XXL \n'), ('24','13','138','0','','ANDO STORE 安都韩版显瘦女裙雪纺两件套连衣裙9','希捷','ECS000138','1',NULL,'0','1','颜色:红 \n尺寸:L \n'), ('25','13','139','0','','SDEER 圣迪奥 女夏装拼接感双层裙摆连衣裙22812','漫步者','ECS000139','1',NULL,'0','1','颜色:黄 \n尺寸:XL \n'), ('26','13','136','0','','Souline 素缕 《斑驳》2013秋款新女棉麻刺绣长','APPLE','ECS000136','1',NULL,'0','1','颜色:红 \n尺寸:XL \n'), ('27','13','137','0','','桑缇 2013秋季新款 韩版修身圆领外套ST133W540','方正','ECS000137','1',NULL,'0','1','颜色:黄 \n尺寸:XXL \n'), ('28','13','140','0','','GOLDFARM 高梵 2013夏装新款 雪纺复古印花连衣','天翼','ECS000140','1',NULL,'0','1','颜色:红 \n尺寸:XL \n'), ('29','13','141','0','','茵克拉芙 2013夏装女装春款连衣裙碎花雪纺OL气','美的','ECS000141','1',NULL,'0','1','颜色:黄 \n尺寸:XXL \n');
INSERT INTO `abs_friend_link` VALUES ('1','ECSHOP 网上商店管理系统','http://www.ecshop.com/','http://www.ecshop.com/images/logo/ecshop_logo.gif','50'), ('2','买否网','http://www.maifou.net/','','51'), ('3','免费开独立网店','http://www.wdwd.com/','','52');
INSERT INTO `abs_goods` VALUES ('134','29','ECS000000','韩味HW-2014初冬套装 毛衣外套 长袖连衣裙 蓬蓬裙 气质长袖针织衫+半身裙 两件套连衣裙套装','+','625','11','','97','0.000','144.00','120.00','110.00','1380614400','1948608000','1','','国庆大促，下单再减10%','<p>&nbsp;</p>\r\n<div class=\"more_pic\" style=\"margin: 0px 20px; padding: 0px; overflow: hidden; text-align: center; color: rgb(102, 102, 102); font-family: Arial;\"><img src=\"http://d05.res.meilishuo.net/pic/a/7f/f8/98b51fb1a1121be38d462eb4996e_750_3467_5_1.cf.jpg_91d09cf3_q0_1_1_0_710_710.jpg\" alt=\"韩味HW-2014初冬套装 毛衣外套 长袖连衣裙 蓬蓬裙 气质长袖针织衫+半身裙  两件套连衣裙套装\" class=\"load_img\" style=\"border: 0px; display: block; margin-left: auto; margin-right: auto; background-image: url(http://i.meilishuo.net/css/images/share/loading.gif); height: 710px; width: 710px; background-position: 50% 50%; background-repeat: no-repeat no-repeat;\" /></div>\r\n<div class=\"more_pic\" style=\"margin: 0px 20px; padding: 0px; overflow: hidden; text-align: center; color: rgb(102, 102, 102); font-family: Arial;\"><img src=\"http://d05.res.meilishuo.net/pic/a/7f/f8/98b51fb1a1121be38d462eb4996e_750_3467_5_2.cf.jpg_91d09cf3_q0_1_1_0_710_710.jpg\" alt=\"韩味HW-2014初冬套装 毛衣外套 长袖连衣裙 蓬蓬裙 气质长袖针织衫+半身裙  两件套连衣裙套装\" class=\"load_img\" style=\"border: 0px; display: block; margin-left: auto; margin-right: auto; background-image: url(http://i.meilishuo.net/css/images/share/loading.gif); height: 710px; width: 710px; background-position: 50% 50%; background-repeat: no-repeat no-repeat;\" /></div>\r\n<div class=\"more_pic\" style=\"margin: 0px 20px; padding: 0px; overflow: hidden; text-align: center; color: rgb(102, 102, 102); font-family: Arial;\"><img src=\"http://imgtest.meiliworks.com/pic/a/7f/f8/98b51fb1a1121be38d462eb4996e_750_3467_5_3.cf.jpg_91d09cf3_q0_1_1_0_710_710.jpg\" alt=\"韩味HW-2014初冬套装 毛衣外套 长袖连衣裙 蓬蓬裙 气质长袖针织衫+半身裙  两件套连衣裙套装\" class=\"load_img\" style=\"border: 0px; display: block; margin-left: auto; margin-right: auto; background-image: url(http://i.meilishuo.net/css/images/share/loading.gif); height: 710px; width: 710px; background-position: 50% 50%; background-repeat: no-repeat no-repeat;\" /></div>\r\n<div class=\"more_pic\" style=\"margin: 0px 20px; padding: 0px; overflow: hidden; text-align: center; color: rgb(102, 102, 102); font-family: Arial;\"><img src=\"http://d04.res.meilishuo.net/pic/a/7f/f8/98b51fb1a1121be38d462eb4996e_750_3467_5_4.cf.jpg_91d09cf3_q0_1_1_0_710_710.jpg\" alt=\"韩味HW-2014初冬套装 毛衣外套 长袖连衣裙 蓬蓬裙 气质长袖针织衫+半身裙  两件套连衣裙套装\" class=\"load_img\" style=\"border: 0px; display: block; margin-left: auto; margin-right: auto; background-image: url(http://i.meilishuo.net/css/images/share/loading.gif); height: 710px; width: 710px; background-position: 50% 50%; background-repeat: no-repeat no-repeat;\" /></div>\r\n<div class=\"more_pic\" style=\"margin: 0px 20px; padding: 0px; overflow: hidden; text-align: center; color: rgb(102, 102, 102); font-family: Arial;\">&nbsp;</div>\r\n<p class=\"pro_txt\" style=\"margin: 0px 20px; padding: 0px 0px 10px; overflow: hidden; line-height: 24px; color: rgb(102, 102, 102); font-family: Arial;\">&nbsp;</p>\r\n<p>&nbsp;</p>','images/201410/thumb_img/134_thumb_G_1413930635678.jpg','images/201410/goods_img/134_G_1413930635959.jpg','images/201410/source_img/134_G_1413930635467.jpg','1','','1','1','0','1','1380647163','1','0','1','0','1','1','0','1413930698','14','','-1','-1','0',NULL), ('136','29','ECS000136','米兰时装周同款 法式优雅女人味性感尖头及踝靴 细跟高跟短靴裸靴','+','8','2','','99','0.000','144.00','120.00','110.00','1380614400','1980230400','1','','国庆大促，下单再减10%','<div class=\"more_pic\" style=\"margin: 0px 20px; padding: 0px; overflow: hidden; text-align: center; color: rgb(102, 102, 102); font-family: Arial;\"><img src=\"http://d05.res.meilishuo.net/pic/a/e2/d3/187ad3bec2bc300be51107797424_640_900_2_1.cc.jpg_c844f589_q0_1_1_0_710_710.jpg\" alt=\"米兰时装周同款 法式优雅女人味性感尖头及踝靴 细跟高跟短靴裸靴\" class=\"load_img\" style=\"border: 0px; display: block; margin-left: auto; margin-right: auto; background-image: url(http://i.meilishuo.net/css/images/share/loading.gif); height: 710px; width: 640px; background-position: 50% 50%; background-repeat: no-repeat no-repeat;\" /></div>\r\n<div class=\"more_pic\" style=\"margin: 0px 20px; padding: 0px; overflow: hidden; text-align: center; color: rgb(102, 102, 102); font-family: Arial;\"><img src=\"http://d05.res.meilishuo.net/pic/a/e2/d3/187ad3bec2bc300be51107797424_640_900_2_2.cc.jpg_c844f589_q0_1_1_0_710_710.jpg\" alt=\"米兰时装周同款 法式优雅女人味性感尖头及踝靴 细跟高跟短靴裸靴\" class=\"load_img\" style=\"border: 0px; display: block; margin-left: auto; margin-right: auto; background-image: url(http://i.meilishuo.net/css/images/share/loading.gif); height: 190px; width: 640px; background-position: 50% 50%; background-repeat: no-repeat no-repeat;\" /></div>\r\n<p class=\"pro_txt\" style=\"margin: 0px 20px; padding: 0px 0px 10px; overflow: hidden; line-height: 24px; color: rgb(102, 102, 102); font-family: Arial;\">&nbsp;</p>\r\n<div class=\"more_pic\" style=\"margin: 0px 20px; padding: 0px; overflow: hidden; text-align: center; color: rgb(102, 102, 102); font-family: Arial;\"><img src=\"http://d06.res.meilishuo.net/pic/a/db/70/8bb143ec35d816ad456074996d1f_640_900_2_1.cc.jpg_67be050a_q0_1_1_0_710_710.jpg\" alt=\"米兰时装周同款 法式优雅女人味性感尖头及踝靴 细跟高跟短靴裸靴\" class=\"load_img\" style=\"border: 0px; display: block; margin-left: auto; margin-right: auto; background-image: url(http://i.meilishuo.net/css/images/share/loading.gif); height: 710px; width: 640px; background-position: 50% 50%; background-repeat: no-repeat no-repeat;\" /></div>\r\n<div class=\"more_pic\" style=\"margin: 0px 20px; padding: 0px; overflow: hidden; text-align: center; color: rgb(102, 102, 102); font-family: Arial;\"><img src=\"http://d06.res.meilishuo.net/pic/a/db/70/8bb143ec35d816ad456074996d1f_640_900_2_2.cc.jpg_67be050a_q0_1_1_0_710_710.jpg\" alt=\"米兰时装周同款 法式优雅女人味性感尖头及踝靴 细跟高跟短靴裸靴\" class=\"load_img\" style=\"border: 0px; display: block; margin-left: auto; margin-right: auto; background-image: url(http://i.meilishuo.net/css/images/share/loading.gif); height: 190px; width: 640px; background-position: 50% 50%; background-repeat: no-repeat no-repeat;\" /></div>\r\n<p class=\"pro_txt\" style=\"margin: 0px 20px; padding: 0px 0px 10px; overflow: hidden; line-height: 24px; color: rgb(102, 102, 102); font-family: Arial;\">&nbsp;</p>\r\n<div class=\"more_pic\" style=\"margin: 0px 20px; padding: 0px; overflow: hidden; text-align: center; color: rgb(102, 102, 102); font-family: Arial;\"><img src=\"http://d04.res.meilishuo.net/pic/a/1e/73/3340eb562c754bbb7c692fbea130_640_900_2_1.cc.jpg_7d057ebb_q0_1_1_0_710_710.jpg\" alt=\"米兰时装周同款 法式优雅女人味性感尖头及踝靴 细跟高跟短靴裸靴\" class=\"load_img\" style=\"border: 0px; display: block; margin-left: auto; margin-right: auto; background-image: url(http://i.meilishuo.net/css/images/share/loading.gif); height: 710px; width: 640px; background-position: 50% 50%; background-repeat: no-repeat no-repeat;\" /></div>\r\n<div class=\"more_pic\" style=\"margin: 0px 20px; padding: 0px; overflow: hidden; text-align: center; color: rgb(102, 102, 102); font-family: Arial;\"><img src=\"http://d04.res.meilishuo.net/pic/a/1e/73/3340eb562c754bbb7c692fbea130_640_900_2_2.cc.jpg_7d057ebb_q0_1_1_0_710_710.jpg\" alt=\"米兰时装周同款 法式优雅女人味性感尖头及踝靴 细跟高跟短靴裸靴\" class=\"load_img\" style=\"border: 0px; display: block; margin-left: auto; margin-right: auto; background-image: url(http://i.meilishuo.net/css/images/share/loading.gif); height: 190px; width: 640px; background-position: 50% 50%; background-repeat: no-repeat no-repeat;\" /></div>','images/201410/thumb_img/136_thumb_G_1413930502490.jpg','images/201410/goods_img/136_G_1413930502218.jpg','images/201410/source_img/136_G_1413930502372.jpg','1','','1','1','0','1','1380647873','2','0','1','0','1','1','0','1413930542','14','','-1','-1','0',NULL), ('137','29','ECS000137','蜜糖家 METIME 秋季新品 自制薄毛呢西装长马甲','+','2','3','','99','0.000','144.00','120.00','0.00','0','0','1','','国庆大促，下单再减10%','<p>&nbsp;</p>\r\n<div class=\"more_pic\" style=\"margin: 0px 20px; padding: 0px; overflow: hidden; text-align: center; color: rgb(102, 102, 102); font-family: Arial;\"><img src=\"http://d05.res.meilishuo.net/pic/a/5a/1b/0b94da7cecba6dd72ead532854e5_640_1260_2_1.cg.jpg_94fbf1f5_q0_1_1_0_710_710.jpg\" alt=\"薄毛呢西装长马甲\" class=\"load_img\" style=\"border: 0px; display: block; margin-left: auto; margin-right: auto; background-image: url(http://i.meilishuo.net/css/images/share/loading.gif); height: 710px; width: 640px; background-position: 50% 50%; background-repeat: no-repeat no-repeat;\" /></div>\r\n<div class=\"more_pic\" style=\"margin: 0px 20px; padding: 0px; overflow: hidden; text-align: center; color: rgb(102, 102, 102); font-family: Arial;\"><img src=\"http://d05.res.meilishuo.net/pic/a/5a/1b/0b94da7cecba6dd72ead532854e5_640_1260_2_2.cg.jpg_94fbf1f5_q0_1_1_0_710_710.jpg\" alt=\"薄毛呢西装长马甲\" class=\"load_img\" style=\"border: 0px; display: block; margin-left: auto; margin-right: auto; background-image: url(http://i.meilishuo.net/css/images/share/loading.gif); height: 550px; width: 640px; background-position: 50% 50%; background-repeat: no-repeat no-repeat;\" /></div>\r\n<p class=\"pro_txt\" style=\"margin: 0px 20px; padding: 0px 0px 10px; overflow: hidden; line-height: 24px; color: rgb(102, 102, 102); font-family: Arial;\">&nbsp;</p>\r\n<p class=\"pro_txt\" style=\"margin: 0px 20px; padding: 0px 0px 10px; overflow: hidden; line-height: 24px; color: rgb(102, 102, 102); font-family: Arial;\">&nbsp;</p>\r\n<p class=\"pro_txt\" style=\"margin: 0px 20px; padding: 0px 0px 10px; overflow: hidden; line-height: 24px; color: rgb(102, 102, 102); font-family: Arial;\">&nbsp;</p>\r\n<div class=\"more_pic\" style=\"margin: 0px 20px; padding: 0px; overflow: hidden; text-align: center; color: rgb(102, 102, 102); font-family: Arial;\"><img src=\"http://d03.res.meilishuo.net/pic/a/5a/c2/d87c5e88bb170a482932ec6e6803_800_1125_2_1.cg.jpg_9efd5827_q0_1_1_0_710_710.jpg\" alt=\"薄毛呢西装长马甲\" class=\"load_img\" style=\"border: 0px; display: block; margin-left: auto; margin-right: auto; background-image: url(http://i.meilishuo.net/css/images/share/loading.gif); height: 710px; width: 710px; background-position: 50% 50%; background-repeat: no-repeat no-repeat;\" /></div>\r\n<div class=\"more_pic\" style=\"margin: 0px 20px; padding: 0px; overflow: hidden; text-align: center; color: rgb(102, 102, 102); font-family: Arial;\"><img src=\"http://d02.res.meilishuo.net/pic/a/5a/c2/d87c5e88bb170a482932ec6e6803_800_1125_2_2.cg.jpg_9efd5827_q0_1_1_0_710_710.jpg\" alt=\"薄毛呢西装长马甲\" class=\"load_img\" style=\"border: 0px; display: block; margin-left: auto; margin-right: auto; background-image: url(http://i.meilishuo.net/css/images/share/loading.gif); height: 288px; width: 710px; background-position: 50% 50%; background-repeat: no-repeat no-repeat;\" /></div>\r\n<p class=\"pro_txt\" style=\"margin: 0px 20px; padding: 0px 0px 10px; overflow: hidden; line-height: 24px; color: rgb(102, 102, 102); font-family: Arial;\">&nbsp;</p>\r\n<p class=\"pro_txt\" style=\"margin: 0px 20px; padding: 0px 0px 10px; overflow: hidden; line-height: 24px; color: rgb(102, 102, 102); font-family: Arial;\">&nbsp;</p>\r\n<p class=\"pro_txt\" style=\"margin: 0px 20px; padding: 0px 0px 10px; overflow: hidden; line-height: 24px; color: rgb(102, 102, 102); font-family: Arial;\">&nbsp;</p>\r\n<div class=\"more_pic\" style=\"margin: 0px 20px; padding: 0px; overflow: hidden; text-align: center; color: rgb(102, 102, 102); font-family: Arial;\"><img src=\"http://d04.res.meilishuo.net/pic/a/9d/7f/e45412a45aefd9319480325d0a32_800_1125_2_1.ch.jpg_94b4eafe_q0_1_1_0_710_710.jpg\" alt=\"薄毛呢西装长马甲\" class=\"load_img\" style=\"border: 0px; display: block; margin-left: auto; margin-right: auto; background-image: url(http://i.meilishuo.net/css/images/share/loading.gif); height: 710px; width: 710px; background-position: 50% 50%; background-repeat: no-repeat no-repeat;\" /></div>\r\n<div class=\"more_pic\" style=\"margin: 0px 20px; padding: 0px; overflow: hidden; text-align: center; color: rgb(102, 102, 102); font-family: Arial;\"><img src=\"http://d06.res.meilishuo.net/pic/a/9d/7f/e45412a45aefd9319480325d0a32_800_1125_2_2.ch.jpg_94b4eafe_q0_1_1_0_710_710.jpg\" alt=\"薄毛呢西装长马甲\" class=\"load_img\" style=\"border: 0px; display: block; margin-left: auto; margin-right: auto; background-image: url(http://i.meilishuo.net/css/images/share/loading.gif); height: 288px; width: 710px; background-position: 50% 50%; background-repeat: no-repeat no-repeat;\" /></div>','images/201410/thumb_img/137_thumb_G_1413930199355.jpg','images/201410/goods_img/137_G_1413930199852.jpg','images/201410/source_img/137_G_1413930199712.jpg','1','','1','1','0','1','1380647890','100','0','0','1','1','0','0','1413930269','14','','-1','-1','0',NULL), ('138','29','ECS000138','现货发售 马海毛保暖毛衣','+','0','4','','99','0.000','144.00','120.00','0.00','0','0','1','','国庆大促，下单再减10%','<div class=\"more_pic\" style=\"margin: 0px 20px; padding: 0px; overflow: hidden; text-align: center; color: rgb(102, 102, 102); font-family: Arial;\"><img src=\"http://d06.res.meilishuo.net/pic/a/94/06/952aec152f113d236c94888aceee_640_1260_2_1.ch.jpg_6606d987_q0_1_1_0_710_710.jpg\" alt=\"马海毛保暖毛衣\" class=\"load_img\" style=\"border: 0px; display: block; margin-left: auto; margin-right: auto; background-image: url(http://i.meilishuo.net/css/images/share/loading.gif); height: 710px; width: 640px; background-position: 50% 50%; background-repeat: no-repeat no-repeat;\" /></div>\r\n<div class=\"more_pic\" style=\"margin: 0px 20px; padding: 0px; overflow: hidden; text-align: center; color: rgb(102, 102, 102); font-family: Arial;\"><img src=\"http://d04.res.meilishuo.net/pic/a/94/06/952aec152f113d236c94888aceee_640_1260_2_2.ch.jpg_6606d987_q0_1_1_0_710_710.jpg\" alt=\"马海毛保暖毛衣\" class=\"load_img\" style=\"border: 0px; display: block; margin-left: auto; margin-right: auto; background-image: url(http://i.meilishuo.net/css/images/share/loading.gif); height: 550px; width: 640px; background-position: 50% 50%; background-repeat: no-repeat no-repeat;\" /></div>\r\n<p class=\"pro_txt\" style=\"margin: 0px 20px; padding: 0px 0px 10px; overflow: hidden; line-height: 24px; color: rgb(102, 102, 102); font-family: Arial;\">&nbsp;</p>\r\n<p class=\"pro_txt\" style=\"margin: 0px 20px; padding: 0px 0px 10px; overflow: hidden; line-height: 24px; color: rgb(102, 102, 102); font-family: Arial;\">&nbsp;</p>\r\n<p class=\"pro_txt\" style=\"margin: 0px 20px; padding: 0px 0px 10px; overflow: hidden; line-height: 24px; color: rgb(102, 102, 102); font-family: Arial;\">&nbsp;</p>\r\n<div class=\"more_pic\" style=\"margin: 0px 20px; padding: 0px; overflow: hidden; text-align: center; color: rgb(102, 102, 102); font-family: Arial;\"><img src=\"http://d02.res.meilishuo.net/pic/a/51/d2/a95786fa4a551a9688339517ba1c_800_1125_2_1.cf.jpg_c096dbd1_q0_1_1_0_710_710.jpg\" alt=\"马海毛保暖毛衣\" class=\"load_img\" style=\"border: 0px; display: block; margin-left: auto; margin-right: auto; background-image: url(http://i.meilishuo.net/css/images/share/loading.gif); height: 710px; width: 710px; background-position: 50% 50%; background-repeat: no-repeat no-repeat;\" /></div>\r\n<div class=\"more_pic\" style=\"margin: 0px 20px; padding: 0px; overflow: hidden; text-align: center; color: rgb(102, 102, 102); font-family: Arial;\"><img src=\"http://d05.res.meilishuo.net/pic/a/51/d2/a95786fa4a551a9688339517ba1c_800_1125_2_2.cf.jpg_c096dbd1_q0_1_1_0_710_710.jpg\" alt=\"马海毛保暖毛衣\" class=\"load_img\" style=\"border: 0px; display: block; margin-left: auto; margin-right: auto; background-image: url(http://i.meilishuo.net/css/images/share/loading.gif); height: 288px; width: 710px; background-position: 50% 50%; background-repeat: no-repeat no-repeat;\" /></div>\r\n<p class=\"pro_txt\" style=\"margin: 0px 20px; padding: 0px 0px 10px; overflow: hidden; line-height: 24px; color: rgb(102, 102, 102); font-family: Arial;\">&nbsp;</p>\r\n<p class=\"pro_txt\" style=\"margin: 0px 20px; padding: 0px 0px 10px; overflow: hidden; line-height: 24px; color: rgb(102, 102, 102); font-family: Arial;\">&nbsp;</p>\r\n<p class=\"pro_txt\" style=\"margin: 0px 20px; padding: 0px 0px 10px; overflow: hidden; line-height: 24px; color: rgb(102, 102, 102); font-family: Arial;\">&nbsp;</p>\r\n<div class=\"more_pic\" style=\"margin: 0px 20px; padding: 0px; overflow: hidden; text-align: center; color: rgb(102, 102, 102); font-family: Arial;\"><img src=\"http://d05.res.meilishuo.net/pic/a/49/68/046750acfae28bd0396fea6a2559_800_1125_2_1.cf.jpg_287145f6_q0_1_1_0_710_710.jpg\" alt=\"马海毛保暖毛衣\" class=\"load_img\" style=\"border: 0px; display: block; margin-left: auto; margin-right: auto; background-image: url(http://i.meilishuo.net/css/images/share/loading.gif); height: 710px; width: 710px; background-position: 50% 50%; background-repeat: no-repeat no-repeat;\" /></div>\r\n<div class=\"more_pic\" style=\"margin: 0px 20px; padding: 0px; overflow: hidden; text-align: center; color: rgb(102, 102, 102); font-family: Arial;\"><img src=\"http://d02.res.meilishuo.net/pic/a/49/68/046750acfae28bd0396fea6a2559_800_1125_2_2.cf.jpg_287145f6_q0_1_1_0_710_710.jpg\" alt=\"马海毛保暖毛衣\" class=\"load_img\" style=\"border: 0px; display: block; margin-left: auto; margin-right: auto; background-image: url(http://i.meilishuo.net/css/images/share/loading.gif); height: 288px; width: 710px; background-position: 50% 50%; background-repeat: no-repeat no-repeat;\" /></div>\r\n<div>&nbsp;</div>','images/201410/thumb_img/138_thumb_G_1413929827659.jpg','images/201410/goods_img/138_G_1413929827627.jpg','images/201410/source_img/138_G_1413929827744.jpg','1','','1','1','0','1','1380647918','100','0','1','1','1','0','0','1413929868','14','','-1','-1','0',NULL), ('139','29','ECS000139','秋冬黑色天鹅毛衣七分袖休闲套头毛衣蕾丝网纱半身裙蓬蓬裙套装','+','3','5','','99','0.000','144.00','120.00','110.00','1381219200','1633680000','1','','国庆大促，下单再减10%','<p>&nbsp;</p>\r\n<div class=\"more_pic\" style=\"margin: 0px 20px; padding: 0px; overflow: hidden; text-align: center; color: rgb(102, 102, 102); font-family: Arial;\"><img src=\"http://d06.res.meilishuo.net/pic/a/24/ee/261b146a498fdcf84e42ce957331_640_900_2_1.cc.jpg_e8b99d4f_q0_1_1_0_710_710.jpg\" alt=\"秋冬黑色天鹅毛衣七分袖休闲套头毛衣蕾丝网纱半身裙蓬蓬裙套装\" class=\"load_img\" style=\"border: 0px; display: block; margin-left: auto; margin-right: auto; background-image: url(http://i.meilishuo.net/css/images/share/loading.gif); height: 710px; width: 640px; background-position: 50% 50%; background-repeat: no-repeat no-repeat;\" /></div>\r\n<div class=\"more_pic\" style=\"margin: 0px 20px; padding: 0px; overflow: hidden; text-align: center; color: rgb(102, 102, 102); font-family: Arial;\"><img src=\"http://d06.res.meilishuo.net/pic/a/24/ee/261b146a498fdcf84e42ce957331_640_900_2_2.cc.jpg_e8b99d4f_q0_1_1_0_710_710.jpg\" alt=\"秋冬黑色天鹅毛衣七分袖休闲套头毛衣蕾丝网纱半身裙蓬蓬裙套装\" class=\"load_img\" style=\"border: 0px; display: block; margin-left: auto; margin-right: auto; background-image: url(http://i.meilishuo.net/css/images/share/loading.gif); height: 190px; width: 640px; background-position: 50% 50%; background-repeat: no-repeat no-repeat;\" /></div>\r\n<p class=\"pro_txt\" style=\"margin: 0px 20px; padding: 0px 0px 10px; overflow: hidden; line-height: 24px; color: rgb(102, 102, 102); font-family: Arial;\">&nbsp;</p>\r\n<div class=\"more_pic\" style=\"margin: 0px 20px; padding: 0px; overflow: hidden; text-align: center; color: rgb(102, 102, 102); font-family: Arial;\"><img src=\"http://d05.res.meilishuo.net/pic/a/12/39/80dbaa86f15556efa4a623b5d2ca_824_1000_2_1.cc.jpg_e362251b_q0_1_1_0_710_710.jpg\" alt=\"秋冬黑色天鹅毛衣七分袖休闲套头毛衣蕾丝网纱半身裙蓬蓬裙套装\" class=\"load_img\" style=\"border: 0px; display: block; margin-left: auto; margin-right: auto; background-image: url(http://i.meilishuo.net/css/images/share/loading.gif); height: 710px; width: 710px; background-position: 50% 50%; background-repeat: no-repeat no-repeat;\" /></div>\r\n<div class=\"more_pic\" style=\"margin: 0px 20px; padding: 0px; overflow: hidden; text-align: center; color: rgb(102, 102, 102); font-family: Arial;\"><img src=\"http://d02.res.meilishuo.net/pic/a/12/39/80dbaa86f15556efa4a623b5d2ca_824_1000_2_2.cc.jpg_e362251b_q0_1_1_0_710_710.jpg\" alt=\"秋冬黑色天鹅毛衣七分袖休闲套头毛衣蕾丝网纱半身裙蓬蓬裙套装\" class=\"load_img\" style=\"border: 0px; display: block; margin-left: auto; margin-right: auto; background-image: url(http://i.meilishuo.net/css/images/share/loading.gif); height: 151px; width: 710px; background-position: 50% 50%; background-repeat: no-repeat no-repeat;\" /></div>\r\n<p class=\"pro_txt\" style=\"margin: 0px 20px; padding: 0px 0px 10px; overflow: hidden; line-height: 24px; color: rgb(102, 102, 102); font-family: Arial;\">&nbsp;</p>\r\n<div class=\"more_pic\" style=\"margin: 0px 20px; padding: 0px; overflow: hidden; text-align: center; color: rgb(102, 102, 102); font-family: Arial;\"><img src=\"http://d05.res.meilishuo.net/pic/a/19/cc/0a2998ed6d7ba254d0fd60ac8801_809_1000_2_1.cc.jpg_ec4ef9ec_q0_1_1_0_710_710.jpg\" alt=\"秋冬黑色天鹅毛衣七分袖休闲套头毛衣蕾丝网纱半身裙蓬蓬裙套装\" class=\"load_img\" style=\"border: 0px; display: block; margin-left: auto; margin-right: auto; background-image: url(http://i.meilishuo.net/css/images/share/loading.gif); height: 710px; width: 710px; background-position: 50% 50%; background-repeat: no-repeat no-repeat;\" /></div>\r\n<div class=\"more_pic\" style=\"margin: 0px 20px; padding: 0px; overflow: hidden; text-align: center; color: rgb(102, 102, 102); font-family: Arial;\"><img src=\"http://d04.res.meilishuo.net/pic/a/19/cc/0a2998ed6d7ba254d0fd60ac8801_809_1000_2_2.cc.jpg_ec4ef9ec_q0_1_1_0_710_710.jpg\" alt=\"秋冬黑色天鹅毛衣七分袖休闲套头毛衣蕾丝网纱半身裙蓬蓬裙套装\" class=\"load_img\" style=\"border: 0px; display: block; margin-left: auto; margin-right: auto; background-image: url(http://i.meilishuo.net/css/images/share/loading.gif); height: 167px; width: 710px; background-position: 50% 50%; background-repeat: no-repeat no-repeat;\" /></div>','images/201410/thumb_img/139_thumb_G_1413929154297.jpg','images/201410/goods_img/139_G_1413929154772.jpg','images/201410/source_img/139_G_1413929154930.jpg','1','','1','1','0','1','1380647936','100','0','1','1','0','1','0','1413929318','14','','-1','-1','0',NULL), ('140','29','ECS000140','毛貂毛边卫衣套装','+','12','6','','99','0.000','144.00','120.00','110.00','1380614400','1664611200','1','','国庆大促，下单再减10%','<p>&nbsp;</p>\r\n<div class=\"more_pic\" style=\"margin: 0px 20px; padding: 0px; overflow: hidden; text-align: center; color: rgb(102, 102, 102); font-family: Arial;\"><img src=\"http://d06.res.meilishuo.net/pic/a/7a/54/de9cee1a3fce50be001fdb161b69_640_1260_2_1.cf.jpg_2a15cebf_q0_1_1_0_710_710.jpg\" alt=\"毛貂毛边卫衣套装\" class=\"load_img\" style=\"border: 0px; display: block; margin-left: auto; margin-right: auto; background-image: url(http://i.meilishuo.net/css/images/share/loading.gif); height: 710px; width: 640px; background-position: 50% 50%; background-repeat: no-repeat no-repeat;\" /></div>\r\n<div class=\"more_pic\" style=\"margin: 0px 20px; padding: 0px; overflow: hidden; text-align: center; color: rgb(102, 102, 102); font-family: Arial;\"><img src=\"http://d06.res.meilishuo.net/pic/a/7a/54/de9cee1a3fce50be001fdb161b69_640_1260_2_2.cf.jpg_2a15cebf_q0_1_1_0_710_710.jpg\" alt=\"毛貂毛边卫衣套装\" class=\"load_img\" style=\"border: 0px; display: block; margin-left: auto; margin-right: auto; background-image: url(http://i.meilishuo.net/css/images/share/loading.gif); height: 550px; width: 640px; background-position: 50% 50%; background-repeat: no-repeat no-repeat;\" /></div>\r\n<p class=\"pro_txt\" style=\"margin: 0px 20px; padding: 0px 0px 10px; overflow: hidden; line-height: 24px; color: rgb(102, 102, 102); font-family: Arial;\">&nbsp;</p>\r\n<p class=\"pro_txt\" style=\"margin: 0px 20px; padding: 0px 0px 10px; overflow: hidden; line-height: 24px; color: rgb(102, 102, 102); font-family: Arial;\">&nbsp;</p>\r\n<p class=\"pro_txt\" style=\"margin: 0px 20px; padding: 0px 0px 10px; overflow: hidden; line-height: 24px; color: rgb(102, 102, 102); font-family: Arial;\">&nbsp;</p>\r\n<div class=\"more_pic\" style=\"margin: 0px 20px; padding: 0px; overflow: hidden; text-align: center; color: rgb(102, 102, 102); font-family: Arial;\"><img src=\"http://d05.res.meilishuo.net/pic/a/d2/fb/9c0b542ad856214e6ca2b818909d_800_1125_2_1.cg.jpg_64f6b7a3_q0_1_1_0_710_710.jpg\" alt=\"毛貂毛边卫衣套装\" class=\"load_img\" style=\"border: 0px; display: block; margin-left: auto; margin-right: auto; background-image: url(http://i.meilishuo.net/css/images/share/loading.gif); height: 710px; width: 710px; background-position: 50% 50%; background-repeat: no-repeat no-repeat;\" /></div>\r\n<div class=\"more_pic\" style=\"margin: 0px 20px; padding: 0px; overflow: hidden; text-align: center; color: rgb(102, 102, 102); font-family: Arial;\"><img src=\"http://d03.res.meilishuo.net/pic/a/d2/fb/9c0b542ad856214e6ca2b818909d_800_1125_2_2.cg.jpg_64f6b7a3_q0_1_1_0_710_710.jpg\" alt=\"毛貂毛边卫衣套装\" class=\"load_img\" style=\"border: 0px; display: block; margin-left: auto; margin-right: auto; background-image: url(http://i.meilishuo.net/css/images/share/loading.gif); height: 288px; width: 710px; background-position: 50% 50%; background-repeat: no-repeat no-repeat;\" /></div>\r\n<p class=\"pro_txt\" style=\"margin: 0px 20px; padding: 0px 0px 10px; overflow: hidden; line-height: 24px; color: rgb(102, 102, 102); font-family: Arial;\">&nbsp;</p>\r\n<p class=\"pro_txt\" style=\"margin: 0px 20px; padding: 0px 0px 10px; overflow: hidden; line-height: 24px; color: rgb(102, 102, 102); font-family: Arial;\">&nbsp;</p>\r\n<p class=\"pro_txt\" style=\"margin: 0px 20px; padding: 0px 0px 10px; overflow: hidden; line-height: 24px; color: rgb(102, 102, 102); font-family: Arial;\">&nbsp;</p>\r\n<div class=\"more_pic\" style=\"margin: 0px 20px; padding: 0px; overflow: hidden; text-align: center; color: rgb(102, 102, 102); font-family: Arial;\"><img src=\"http://d05.res.meilishuo.net/pic/a/e2/a5/65d4a6fbc66d92b90958edf56648_800_1125_2_1.ch.jpg_eacf50ed_q0_1_1_0_710_710.jpg\" alt=\"毛貂毛边卫衣套装\" class=\"load_img\" style=\"border: 0px; display: block; margin-left: auto; margin-right: auto; background-image: url(http://i.meilishuo.net/css/images/share/loading.gif); height: 710px; width: 710px; background-position: 50% 50%; background-repeat: no-repeat no-repeat;\" /></div>\r\n<div class=\"more_pic\" style=\"margin: 0px 20px; padding: 0px; overflow: hidden; text-align: center; color: rgb(102, 102, 102); font-family: Arial;\"><img src=\"http://d02.res.meilishuo.net/pic/a/e2/a5/65d4a6fbc66d92b90958edf56648_800_1125_2_2.ch.jpg_eacf50ed_q0_1_1_0_710_710.jpg\" alt=\"毛貂毛边卫衣套装\" class=\"load_img\" style=\"border: 0px; display: block; margin-left: auto; margin-right: auto; background-image: url(http://i.meilishuo.net/css/images/share/loading.gif); height: 288px; width: 710px; background-position: 50% 50%; background-repeat: no-repeat no-repeat;\" /></div>\r\n<p class=\"pro_txt\" style=\"margin: 0px 20px; padding: 0px 0px 10px; overflow: hidden; line-height: 24px; color: rgb(102, 102, 102); font-family: Arial;\">&nbsp;</p>\r\n<p class=\"pro_txt\" style=\"margin: 0px 20px; padding: 0px 0px 10px; overflow: hidden; line-height: 24px; color: rgb(102, 102, 102); font-family: Arial;\">&nbsp;</p>\r\n<p class=\"pro_txt\" style=\"margin: 0px 20px; padding: 0px 0px 10px; overflow: hidden; line-height: 24px; color: rgb(102, 102, 102); font-family: Arial;\">&nbsp;</p>\r\n<div class=\"more_pic\" style=\"margin: 0px 20px; padding: 0px; overflow: hidden; text-align: center; color: rgb(102, 102, 102); font-family: Arial;\"><img src=\"http://d06.res.meilishuo.net/pic/a/04/69/e21a0c3a15b37de005b6b1f9b69e_800_1125_2_1.cg.jpg_da5b3260_q0_1_1_0_710_710.jpg\" alt=\"毛貂毛边卫衣套装\" class=\"load_img\" style=\"border: 0px; display: block; margin-left: auto; margin-right: auto; background-image: url(http://i.meilishuo.net/css/images/share/loading.gif); height: 710px; width: 710px; background-position: 50% 50%; background-repeat: no-repeat no-repeat;\" /></div>\r\n<div class=\"more_pic\" style=\"margin: 0px 20px; padding: 0px; overflow: hidden; text-align: center; color: rgb(102, 102, 102); font-family: Arial;\"><img src=\"http://d02.res.meilishuo.net/pic/a/04/69/e21a0c3a15b37de005b6b1f9b69e_800_1125_2_2.cg.jpg_da5b3260_q0_1_1_0_710_710.jpg\" alt=\"毛貂毛边卫衣套装\" class=\"load_img\" style=\"border: 0px; display: block; margin-left: auto; margin-right: auto; background-image: url(http://i.meilishuo.net/css/images/share/loading.gif); height: 288px; width: 710px; background-position: 50% 50%; background-repeat: no-repeat no-repeat;\" /></div>','images/201410/thumb_img/140_thumb_G_1413928959052.jpg','images/201410/goods_img/140_G_1413928959785.jpg','images/201410/source_img/140_G_1413928959907.jpg','1','','1','1','0','1','1380647948','3','0','0','1','1','1','0','1413928959','14','','-1','-1','0',NULL), ('141','29','ECS000141','高质感毛呢大衣','+','49','7','','99','0.000','144.00','120.00','110.00','1381219200','1633680000','1','','国庆大促，下单再减10%','<p>&nbsp;</p>\r\n<div class=\"more_pic\" style=\"margin: 0px 20px; padding: 0px; overflow: hidden; text-align: center; color: rgb(102, 102, 102); font-family: Arial;\"><img src=\"http://d02.res.meilishuo.net/pic/a/0a/7d/8b71d164b6d2646705412ffb4aa9_640_1260_2_1.cg.jpg_cb75fa30_q0_1_1_0_710_710.jpg\" alt=\"高质感毛呢大衣\" class=\"load_img\" style=\"border: 0px; display: block; margin-left: auto; margin-right: auto; background-image: url(http://i.meilishuo.net/css/images/share/loading.gif); height: 710px; width: 640px; background-position: 50% 50%; background-repeat: no-repeat no-repeat;\" /></div>\r\n<div class=\"more_pic\" style=\"margin: 0px 20px; padding: 0px; overflow: hidden; text-align: center; color: rgb(102, 102, 102); font-family: Arial;\"><img src=\"http://d05.res.meilishuo.net/pic/a/0a/7d/8b71d164b6d2646705412ffb4aa9_640_1260_2_2.cg.jpg_cb75fa30_q0_1_1_0_710_710.jpg\" alt=\"高质感毛呢大衣\" class=\"load_img\" style=\"border: 0px; display: block; margin-left: auto; margin-right: auto; background-image: url(http://i.meilishuo.net/css/images/share/loading.gif); height: 550px; width: 640px; background-position: 50% 50%; background-repeat: no-repeat no-repeat;\" /></div>\r\n<p class=\"pro_txt\" style=\"margin: 0px 20px; padding: 0px 0px 10px; overflow: hidden; line-height: 24px; color: rgb(102, 102, 102); font-family: Arial;\">&nbsp;</p>\r\n<p class=\"pro_txt\" style=\"margin: 0px 20px; padding: 0px 0px 10px; overflow: hidden; line-height: 24px; color: rgb(102, 102, 102); font-family: Arial;\">&nbsp;</p>\r\n<p class=\"pro_txt\" style=\"margin: 0px 20px; padding: 0px 0px 10px; overflow: hidden; line-height: 24px; color: rgb(102, 102, 102); font-family: Arial;\">&nbsp;</p>\r\n<div class=\"more_pic\" style=\"margin: 0px 20px; padding: 0px; overflow: hidden; text-align: center; color: rgb(102, 102, 102); font-family: Arial;\"><img src=\"http://d04.res.meilishuo.net/pic/a/36/ad/2b9ee7382ba0542810239bcc70a6_800_1125_2_1.ch.jpg_54c0cd5e_q0_1_1_0_710_710.jpg\" alt=\"高质感毛呢大衣\" class=\"load_img\" style=\"border: 0px; display: block; margin-left: auto; margin-right: auto; background-image: url(http://i.meilishuo.net/css/images/share/loading.gif); height: 710px; width: 710px; background-position: 50% 50%; background-repeat: no-repeat no-repeat;\" /></div>\r\n<div class=\"more_pic\" style=\"margin: 0px 20px; padding: 0px; overflow: hidden; text-align: center; color: rgb(102, 102, 102); font-family: Arial;\"><img src=\"http://d03.res.meilishuo.net/pic/a/36/ad/2b9ee7382ba0542810239bcc70a6_800_1125_2_2.ch.jpg_54c0cd5e_q0_1_1_0_710_710.jpg\" alt=\"高质感毛呢大衣\" class=\"load_img\" style=\"border: 0px; display: block; margin-left: auto; margin-right: auto; background-image: url(http://i.meilishuo.net/css/images/share/loading.gif); height: 288px; width: 710px; background-position: 50% 50%; background-repeat: no-repeat no-repeat;\" /></div>\r\n<p class=\"pro_txt\" style=\"margin: 0px 20px; padding: 0px 0px 10px; overflow: hidden; line-height: 24px; color: rgb(102, 102, 102); font-family: Arial;\">&nbsp;</p>\r\n<p class=\"pro_txt\" style=\"margin: 0px 20px; padding: 0px 0px 10px; overflow: hidden; line-height: 24px; color: rgb(102, 102, 102); font-family: Arial;\">&nbsp;</p>\r\n<p class=\"pro_txt\" style=\"margin: 0px 20px; padding: 0px 0px 10px; overflow: hidden; line-height: 24px; color: rgb(102, 102, 102); font-family: Arial;\">&nbsp;</p>\r\n<div class=\"more_pic\" style=\"margin: 0px 20px; padding: 0px; overflow: hidden; text-align: center; color: rgb(102, 102, 102); font-family: Arial;\"><img src=\"http://d02.res.meilishuo.net/pic/a/10/4d/4dda4d3ed817afaed6cc6365d182_800_1125_2_1.ch.jpg_ac5149a5_q0_1_1_0_710_710.jpg\" alt=\"高质感毛呢大衣\" class=\"load_img\" style=\"border: 0px; display: block; margin-left: auto; margin-right: auto; background-image: url(http://i.meilishuo.net/css/images/share/loading.gif); height: 710px; width: 710px; background-position: 50% 50%; background-repeat: no-repeat no-repeat;\" /></div>\r\n<div class=\"more_pic\" style=\"margin: 0px 20px; padding: 0px; overflow: hidden; text-align: center; color: rgb(102, 102, 102); font-family: Arial;\"><img src=\"http://d06.res.meilishuo.net/pic/a/10/4d/4dda4d3ed817afaed6cc6365d182_800_1125_2_2.ch.jpg_ac5149a5_q0_1_1_0_710_710.jpg\" alt=\"高质感毛呢大衣\" class=\"load_img\" style=\"border: 0px; display: block; margin-left: auto; margin-right: auto; background-image: url(http://i.meilishuo.net/css/images/share/loading.gif); height: 288px; width: 710px; background-position: 50% 50%; background-repeat: no-repeat no-repeat;\" /></div>\r\n<p class=\"pro_txt\" style=\"margin: 0px 20px; padding: 0px 0px 10px; overflow: hidden; line-height: 24px; color: rgb(102, 102, 102); font-family: Arial;\">&nbsp;</p>\r\n<p class=\"pro_txt\" style=\"margin: 0px 20px; padding: 0px 0px 10px; overflow: hidden; line-height: 24px; color: rgb(102, 102, 102); font-family: Arial;\">&nbsp;</p>\r\n<p class=\"pro_txt\" style=\"margin: 0px 20px; padding: 0px 0px 10px; overflow: hidden; line-height: 24px; color: rgb(102, 102, 102); font-family: Arial;\">&nbsp;</p>\r\n<div class=\"more_pic\" style=\"margin: 0px 20px; padding: 0px; overflow: hidden; text-align: center; color: rgb(102, 102, 102); font-family: Arial;\"><img src=\"http://d06.res.meilishuo.net/pic/a/65/cd/5406b7ab4fa92ba8910d7cf0f613_800_1125_2_1.cg.jpg_7bbd614f_q0_1_1_0_710_710.jpg\" alt=\"高质感毛呢大衣\" class=\"load_img\" style=\"border: 0px; display: block; margin-left: auto; margin-right: auto; background-image: url(http://i.meilishuo.net/css/images/share/loading.gif); height: 710px; width: 710px; background-position: 50% 50%; background-repeat: no-repeat no-repeat;\" /></div>\r\n<div class=\"more_pic\" style=\"margin: 0px 20px; padding: 0px; overflow: hidden; text-align: center; color: rgb(102, 102, 102); font-family: Arial;\"><img src=\"http://d06.res.meilishuo.net/pic/a/65/cd/5406b7ab4fa92ba8910d7cf0f613_800_1125_2_2.cg.jpg_7bbd614f_q0_1_1_0_710_710.jpg\" alt=\"高质感毛呢大衣\" class=\"load_img\" style=\"border: 0px; display: block; margin-left: auto; margin-right: auto; background-image: url(http://i.meilishuo.net/css/images/share/loading.gif); height: 288px; width: 710px; background-position: 50% 50%; background-repeat: no-repeat no-repeat;\" /></div>','images/201410/thumb_img/141_thumb_G_1413926445469.jpg','images/201410/goods_img/141_G_1413926445159.jpg','images/201410/source_img/141_G_1413926445378.jpg','1','','1','1','0','1','1380647968','100','0','1','1','0','1','0','1437004824','14','','-1','-1','0',NULL);
INSERT INTO `abs_goods_activity` VALUES ('1','夺宝奇兵之诺基亚N96','新一轮的夺宝开始了\n本期是 诺基亚n96','0','23','0','诺基亚N96','1242107580','1242193980','0','a:4:{s:11:\"start_price\";s:4:\"1.00\";s:9:\"end_price\";s:6:\"800.00\";s:9:\"max_price\";i:0;s:11:\"cost_points\";s:1:\"1\";}'), ('2','夺宝奇兵之夏新N7','本期的夺宝奖品是 夏新N7','0','17','0','夏新N7','1242107820','1250661420','0','a:4:{s:11:\"start_price\";s:4:\"1.00\";s:9:\"end_price\";s:6:\"800.00\";s:9:\"max_price\";i:0;s:11:\"cost_points\";s:1:\"1\";}'), ('18','韩味HW-2014初冬套装 毛衣外套 长袖连衣裙 蓬蓬裙 气质长袖针织衫+半身裙 两件套连衣裙套装','','1','134','0','韩味HW-2014初冬套装 毛衣外套 长袖连衣裙 蓬蓬裙 气质长袖针织衫+半身裙 两件套连衣裙套装','1413878400','1729843200','0','a:4:{s:12:\"price_ladder\";a:1:{i:0;a:2:{s:6:\"amount\";i:10;s:5:\"price\";d:28;}}s:15:\"restrict_amount\";i:100;s:13:\"gift_integral\";i:30;s:7:\"deposit\";d:30;}'), ('4','拍卖活动——索爱C702c','','2','10','0','索爱C702c','1242144000','1242403200','0','a:5:{s:7:\"deposit\";d:0;s:11:\"start_price\";d:0;s:9:\"end_price\";i:0;s:9:\"amplitude\";d:20;s:6:\"no_top\";i:1;}'), ('5','摩托罗拉E8 大礼包','礼包大优惠','4','31','0','摩托罗拉E8 ','1242110400','1252046400','0','a:1:{s:13:\"package_price\";s:4:\"1430\";}'), ('6','诺基亚N85大礼包','诺基亚N85超值大礼包','4','32','0','诺基亚N85','1242110760','1248936360','0','a:1:{s:13:\"package_price\";s:4:\"3150\";}'), ('9','拍卖活动一','','2','33','0','索尼（SONY）32英寸 高清 液晶电视 KLV-32S550A','1278057600','1404979200','0','a:5:{s:7:\"deposit\";d:0;s:11:\"start_price\";d:10;s:9:\"end_price\";d:1000;s:9:\"amplitude\";d:10;s:6:\"no_top\";i:0;}'), ('10','拍卖活动二','','2','40','0','创维（Skyworth）32英寸 高清 液晶电视 TFT32L01HM','1277971200','1341561600','0','a:5:{s:7:\"deposit\";d:0;s:11:\"start_price\";d:10;s:9:\"end_price\";d:1000;s:9:\"amplitude\";d:10;s:6:\"no_top\";i:0;}'), ('11','拍卖活动三','','2','38','0','三星（SAMSUNG）26英寸 高清液晶电视LA32B350F1','1278057600','1309939200','0','a:5:{s:7:\"deposit\";d:0;s:11:\"start_price\";d:10;s:9:\"end_price\";d:1000;s:9:\"amplitude\";d:0;s:6:\"no_top\";i:0;}'), ('12','拍卖活动四','','2','50','0','力开力朗双肩背包-休闲系列324灰色','1278057600','1404633600','0','a:5:{s:7:\"deposit\";d:0;s:11:\"start_price\";d:10;s:9:\"end_price\";d:1000;s:9:\"amplitude\";d:0;s:6:\"no_top\";i:0;}'), ('14','拍卖活动五','','2','35','0','飞利浦 42英寸 全高清 液晶电视 42PFL5609','1278057600','1688630400','0','a:5:{s:7:\"deposit\";d:0;s:11:\"start_price\";d:10;s:9:\"end_price\";d:1000;s:9:\"amplitude\";d:0;s:6:\"no_top\";i:0;}'), ('15','拍卖活动六','','2','49','0','美的（Midea）空气加湿器 S30U-M1','1278057600','1783324800','0','a:5:{s:7:\"deposit\";d:0;s:11:\"start_price\";d:100;s:9:\"end_price\";d:1000;s:9:\"amplitude\";d:0;s:6:\"no_top\";i:0;}'), ('16','拍卖活动七','','2','48','0','尼康（Nikon）D90 （18-105/3.5-5.6VR）防抖镜头 单反套机','1278057600','2035785600','0','a:5:{s:7:\"deposit\";d:0;s:11:\"start_price\";d:10;s:9:\"end_price\";d:1000;s:9:\"amplitude\";d:0;s:6:\"no_top\";i:0;}');
INSERT INTO `abs_goods_attr` VALUES ('2271','140','246','XXL',''), ('2270','140','246','M',''), ('2269','140','246','L',''), ('2268','140','246','XL',''), ('2267','140','245','黄',''), ('2266','140','245','蓝',''), ('2265','140','245','红',''), ('2835','140','244','小碎花','0'), ('2836','140','243','短袖','0'), ('2837','140','242','日韩','0'), ('2251','139','246','XL',''), ('2250','139','246','L',''), ('2249','139','246','M',''), ('2248','139','246','XXL',''), ('2247','139','245','红',''), ('2246','139','245','蓝',''), ('2245','139','245','黄',''), ('2838','139','244','印花/绣花','0'), ('2839','139','243','七分袖','0'), ('2840','139','242','简约','0'), ('2231','138','246','XXL',''), ('2230','138','246','M',''), ('2229','138','246','L',''), ('2228','138','246','XL',''), ('2227','138','245','黄',''), ('2226','138','245','蓝',''), ('2225','138','245','红',''), ('2224','138','244','素色','0'), ('2841','138','243','无袖','0'), ('2842','138','242','民族','0'), ('2211','137','246','XL',''), ('2210','137','246','L',''), ('2209','137','246','M',''), ('2208','137','246','XXL',''), ('2207','137','245','红',''), ('2206','137','245','蓝',''), ('2205','137','245','黄',''), ('2843','137','244','条纹','0'), ('2203','137','243','长袖','0'), ('2844','137','242','街头','0'), ('2191','136','246','XXL',''), ('2190','136','246','M',''), ('2189','136','246','L',''), ('2188','136','246','XL',''), ('2187','136','245','黄',''), ('2186','136','245','蓝',''), ('2185','136','245','红',''), ('2845','136','244','大方格','0'), ('2846','136','243','短袖','0'), ('2847','136','242','卡通','0'), ('3550','134','251','其他','0'), ('2151','134','246','XXL',''), ('2150','134','246','M',''), ('2149','134','246','L',''), ('2148','134','246','XL',''), ('2147','134','245','黄',''), ('2146','134','245','蓝',''), ('2145','134','245','红',''), ('2850','134','244','波点','0'), ('2851','134','243','七分袖','0'), ('2852','134','242','英伦学院','0'), ('3549','134','250','棉 聚酯纤维','0'), ('3548','134','249','套头','0'), ('3547','134','248','印花','0'), ('3546','134','247','圆领','0');
INSERT INTO `abs_goods_gallery` VALUES ('276','138','images/201410/goods_img/138_P_1413929842178.jpg','','images/201410/thumb_img/138_thumb_P_1413929842899.jpg','images/201410/source_img/138_P_1413929842547.jpg'), ('268','139','images/201410/goods_img/139_P_1413929169416.jpg','','images/201410/thumb_img/139_thumb_P_1413929169547.jpg','images/201410/source_img/139_P_1413929169688.jpg'), ('264','140','images/201410/goods_img/140_P_1413928911455.jpg','','images/201410/thumb_img/140_thumb_P_1413928911277.jpg','images/201410/source_img/140_P_1413928911522.jpg'), ('261','141','images/201410/goods_img/141_P_1413926538102.jpg','aa','images/201410/thumb_img/141_thumb_P_1413926538790.jpg','images/201410/source_img/141_P_1413926538088.jpg'), ('279','137','images/201410/goods_img/137_P_1413930214240.jpg','','images/201410/thumb_img/137_thumb_P_1413930214488.jpg','images/201410/source_img/137_P_1413930214738.jpg'), ('260','141','images/201410/goods_img/141_P_1413926445875.jpg','bb','images/201410/thumb_img/141_thumb_P_1413926445217.jpg','images/201410/source_img/141_P_1413926445082.jpg'), ('263','140','images/201410/goods_img/140_P_1413928892532.jpg','','images/201410/thumb_img/140_thumb_P_1413928892626.jpg','images/201410/source_img/140_P_1413928892986.jpg'), ('267','139','images/201410/goods_img/139_P_1413929154557.jpg','','images/201410/thumb_img/139_thumb_P_1413929154414.jpg','images/201410/source_img/139_P_1413929154178.jpg'), ('275','138','images/201410/goods_img/138_P_1413929842912.jpg','','images/201410/thumb_img/138_thumb_P_1413929842231.jpg','images/201410/source_img/138_P_1413929842536.jpg'), ('278','137','images/201410/goods_img/137_P_1413930199401.jpg','','images/201410/thumb_img/137_thumb_P_1413930199371.jpg','images/201410/source_img/137_P_1413930199588.jpg'), ('285','134','images/201410/goods_img/134_P_1413930635444.jpg','','images/201410/thumb_img/134_thumb_P_1413930635465.jpg','images/201410/source_img/134_P_1413930635043.jpg'), ('262','141','images/201410/goods_img/141_P_1413926538993.jpg','cc','images/201410/thumb_img/141_thumb_P_1413926538534.jpg','images/201410/source_img/141_P_1413926538134.jpg'), ('265','140','images/201410/goods_img/140_P_1413928911596.jpg','','images/201410/thumb_img/140_thumb_P_1413928911009.jpg','images/201410/source_img/140_P_1413928911517.jpg'), ('266','140','images/201410/goods_img/140_P_1413928959652.jpg','','images/201410/thumb_img/140_thumb_P_1413928959255.jpg','images/201410/source_img/140_P_1413928959377.jpg'), ('269','139','images/201410/goods_img/139_P_1413929169239.jpg','','images/201410/thumb_img/139_thumb_P_1413929169012.jpg','images/201410/source_img/139_P_1413929169238.jpg'), ('274','138','images/201410/goods_img/138_P_1413929827023.jpg','','images/201410/thumb_img/138_thumb_P_1413929827258.jpg','images/201410/source_img/138_P_1413929827611.jpg'), ('280','137','images/201410/goods_img/137_P_1413930214982.jpg','','images/201410/thumb_img/137_thumb_P_1413930214448.jpg','images/201410/source_img/137_P_1413930214136.jpg'), ('284','136','images/201410/goods_img/136_P_1413930502890.jpg','','images/201410/thumb_img/136_thumb_P_1413930502854.jpg','images/201410/source_img/136_P_1413930502437.jpg');
INSERT INTO `abs_goods_type` VALUES ('1','书','1',''), ('2','音乐','1',''), ('3','电影','1',''), ('4','手机','1',''), ('5','笔记本电脑','1',''), ('6','数码相机','1',''), ('7','数码摄像机','1',''), ('8','化妆品','1',''), ('9','精品手机','1',''), ('14','服装','1',''), ('12','液晶电视','1','主体\r\n显示\r\n音频'), ('15','美妆','1',''), ('16','书','1',''), ('17','音乐','1',''), ('18','电影','1',''), ('19','手机','1',''), ('20','笔记本电脑','1',''), ('21','数码相机','1',''), ('22','数码摄像机','1',''), ('23','化妆品','1',''), ('24','精品手机','1','');
INSERT INTO `abs_group_goods` VALUES ('134','141','100.00','1'), ('134','140','100.00','1'), ('134','139','100.00','1'), ('134','138','100.00','1'), ('134','137','100.00','1'), ('134','136','100.00','1');
INSERT INTO `abs_mail_templates` VALUES ('1','send_password','1','密码找回','{$user_name}您好！<br>\n<br>\n您已经进行了密码重置的操作，请点击以下链接(或者复制到您的浏览器):<br>\n<br>\n<a href=\"{$reset_email}\" target=\"_blank\">{$reset_email}</a><br>\n<br>\n以确认您的新密码重置操作！<br>\n<br>\n{$shop_name}<br>\n{$send_date}','1194824789','0','template'), ('2','order_confirm','0','订单确认通知','亲爱的{$order.consignee}，你好！ \n\n我们已经收到您于 {$order.formated_add_time} 提交的订单，该订单编号为：{$order.order_sn} 请记住这个编号以便日后的查询。\n\n{$shop_name}\n{$sent_date}\n\n\n','1158226370','0','template'), ('3','deliver_notice','1','发货通知','亲爱的{$order.consignee}。你好！</br></br>\n\n您的订单{$order.order_sn}已于{$send_time}按照您预定的配送方式给您发货了。</br>\n</br>\n{if $order.invoice_no}发货单号是{$order.invoice_no}。</br>{/if}\n</br>\n在您收到货物之后请点击下面的链接确认您已经收到货物：</br>\n<a href=\"{$confirm_url}\" target=\"_blank\">{$confirm_url}</a></br></br>\n如果您还没有收到货物可以点击以下链接给我们留言：</br></br>\n<a href=\"{$send_msg_url}\" target=\"_blank\">{$send_msg_url}</a></br>\n<br>\n再次感谢您对我们的支持。欢迎您的再次光临。 <br>\n<br>\n{$shop_name} </br>\n{$send_date}','1194823291','0','template'), ('4','order_cancel','0','订单取消','亲爱的{$order.consignee}，你好！ \n\n您的编号为：{$order.order_sn}的订单已取消。\n\n{$shop_name}\n{$send_date}','1156491130','0','template'), ('5','order_invalid','0','订单无效','亲爱的{$order.consignee}，你好！\n\n您的编号为：{$order.order_sn}的订单无效。\n\n{$shop_name}\n{$send_date}','1156491164','0','template'), ('6','send_bonus','0','发红包','亲爱的{$user_name}您好！\n\n恭喜您获得了{$count}个红包，金额{if $count > 1}分别{/if}为{$money}\n\n{$shop_name}\n{$send_date}\n','1156491184','0','template'), ('7','group_buy','1','团购商品','亲爱的{$consignee}，您好！<br>\n<br>\n您于{$order_time}在本店参加团购商品活动，所购买的商品名称为：{$goods_name}，数量：{$goods_number}，订单号为：{$order_sn}，订单金额为：{$order_amount}<br>\n<br>\n此团购商品现在已到结束日期，并达到最低价格，您现在可以对该订单付款。<br>\n<br>\n请点击下面的链接：<br>\n<a href=\"{$shop_url}\" target=\"_blank\">{$shop_url}</a><br>\n<br>\n请尽快登录到用户中心，查看您的订单详情信息。 <br>\n<br>\n{$shop_name} <br>\n<br>\n{$send_date}','1194824668','0','template'), ('8','register_validate','1','邮件验证','{$user_name}您好！<br><br>\r\n\r\n这封邮件是 {$shop_name} 发送的。你收到这封邮件是为了验证你注册邮件地址是否有效。如果您已经通过验证了，请忽略这封邮件。<br>\r\n请点击以下链接(或者复制到您的浏览器)来验证你的邮件地址:<br>\r\n<a href=\"{$validate_email}\" target=\"_blank\">{$validate_email}</a><br><br>\r\n\r\n{$shop_name}<br>\r\n{$send_date}','1162201031','0','template'), ('9','virtual_card','0','虚拟卡片','亲爱的{$order.consignee}\r\n你好！您的订单{$order.order_sn}中{$goods.goods_name} 商品的详细信息如下:\r\n{foreach from=$virtual_card item=card}\r\n{if $card.card_sn}卡号：{$card.card_sn}{/if}{if $card.card_password}卡片密码：{$card.card_password}{/if}{if $card.end_date}截至日期：{$card.end_date}{/if}\r\n{/foreach}\r\n再次感谢您对我们的支持。欢迎您的再次光临。\r\n\r\n{$shop_name} \r\n{$send_date}','1162201031','0','template'), ('10','attention_list','0','关注商品','亲爱的{$user_name}您好~\n\n您关注的商品 : {$goods_name} 最近已经更新,请您查看最新的商品信息\n\n{$goods_url}\r\n\r\n{$shop_name} \r\n{$send_date}','1183851073','0','template'), ('11','remind_of_new_order','0','新订单通知','亲爱的店长，您好：\n   快来看看吧，又有新订单了。\n    订单号:{$order.order_sn} \n 订单金额:{$order.order_amount}，\n 用户购买商品:{foreach from=$goods_list item=goods_data}{$goods_data.goods_name}(货号:{$goods_data.goods_sn})    {/foreach} \n\n 收货人:{$order.consignee}， \n 收货人地址:{$order.address}，\n 收货人电话:{$order.tel} {$order.mobile}, \n 配送方式:{$order.shipping_name}(费用:{$order.shipping_fee}), \n 付款方式:{$order.pay_name}(费用:{$order.pay_fee})。\n\n               系统提醒\n               {$send_date}','1196239170','0','template'), ('12','goods_booking','1','缺货回复','亲爱的{$user_name}。你好！</br></br>{$dispose_note}</br></br>您提交的缺货商品链接为</br></br><a href=\"{$goods_link}\" target=\"_blank\">{$goods_name}</a></br><br>{$shop_name} </br>{$send_date}','0','0','template'), ('13','user_message','1','留言回复','亲爱的{$user_name}。你好！</br></br>对您的留言：</br>{$message_content}</br></br>店主作了如下回复：</br>{$message_note}</br></br>您可以随时回到店中和店主继续沟通。</br>{$shop_name}</br>{$send_date}','0','0','template'), ('14','recomment','1','用户评论回复','亲爱的{$user_name}。你好！</br></br>对您的评论：</br>“{$comment}”</br></br>店主作了如下回复：</br>“{$recomment}”</br></br>您可以随时回到店中和店主继续沟通。</br>{$shop_name}</br>{$send_date}','0','0','template');
INSERT INTO `abs_nav` VALUES ('2','','0','选购中心','1','2','0','pick_out.php','top'), ('3','','0','我的账户','1','0','0','user.php','top'), ('4','c','21','女装','1','0','0','category.php?id=21','middle'), ('6','','0','标签云','1','5','6','tag_cloud.php','top'), ('7','','0','免责条款','1','1','0','article.php?id=1','bottom'), ('8','','0','隐私保护','1','2','0','article.php?id=2','bottom'), ('9','','0','咨询热点','1','3','0','article.php?id=3','bottom'), ('10','','0','联系我们','1','4','0','article.php?id=4','bottom'), ('11','','0','公司简介','1','5','0','article.php?id=5','bottom'), ('12','','0','批发方案','1','6','0','wholesale.php','bottom'), ('14','','0','配送方式','1','7','0','myship.php','bottom'), ('18','c','170','裤子','1','2','0','category.php?id=170','middle'), ('23','','0','报价单','1','6','0','quotation.php','top'), ('24','','0','团购','1','23','0','group_buy.php','middle'), ('26','c','132','男装','1','1','0','category.php?id=132','middle'), ('33','','0','品牌专区','1','7','0','brand.php','middle'), ('34','c','138','针织衫','0','25','0','category.php?id=138','middle');
INSERT INTO `abs_region` VALUES ('1','0','中国','0','0'), ('2','1','北京','1','0'), ('3','1','安徽','1','0'), ('4','1','福建','1','0'), ('5','1','甘肃','1','0'), ('6','1','广东','1','0'), ('7','1','广西','1','0'), ('8','1','贵州','1','0'), ('9','1','海南','1','0'), ('10','1','河北','1','0'), ('11','1','河南','1','0'), ('12','1','黑龙江','1','0'), ('13','1','湖北','1','0'), ('14','1','湖南','1','0'), ('15','1','吉林','1','0'), ('16','1','江苏','1','0'), ('17','1','江西','1','0'), ('18','1','辽宁','1','0'), ('19','1','内蒙古','1','0'), ('20','1','宁夏','1','0'), ('21','1','青海','1','0'), ('22','1','山东','1','0'), ('23','1','山西','1','0'), ('24','1','陕西','1','0'), ('25','1','上海','1','0'), ('26','1','四川','1','0'), ('27','1','天津','1','0'), ('28','1','西藏','1','0'), ('29','1','新疆','1','0'), ('30','1','云南','1','0'), ('31','1','浙江','1','0'), ('32','1','重庆','1','0'), ('33','1','香港','1','0'), ('34','1','澳门','1','0'), ('35','1','台湾','1','0'), ('36','3','安庆','2','0'), ('37','3','蚌埠','2','0'), ('38','3','巢湖','2','0'), ('39','3','池州','2','0'), ('40','3','滁州','2','0'), ('41','3','阜阳','2','0'), ('42','3','淮北','2','0'), ('43','3','淮南','2','0'), ('44','3','黄山','2','0'), ('45','3','六安','2','0'), ('46','3','马鞍山','2','0'), ('47','3','宿州','2','0'), ('48','3','铜陵','2','0'), ('49','3','芜湖','2','0'), ('50','3','宣城','2','0'), ('51','3','亳州','2','0'), ('52','2','北京','2','0'), ('53','4','福州','2','0'), ('54','4','龙岩','2','0'), ('55','4','南平','2','0'), ('56','4','宁德','2','0'), ('57','4','莆田','2','0'), ('58','4','泉州','2','0'), ('59','4','三明','2','0'), ('60','4','厦门','2','0'), ('61','4','漳州','2','0'), ('62','5','兰州','2','0'), ('63','5','白银','2','0'), ('64','5','定西','2','0'), ('65','5','甘南','2','0'), ('66','5','嘉峪关','2','0'), ('67','5','金昌','2','0'), ('68','5','酒泉','2','0'), ('69','5','临夏','2','0'), ('70','5','陇南','2','0'), ('71','5','平凉','2','0'), ('72','5','庆阳','2','0'), ('73','5','天水','2','0'), ('74','5','武威','2','0'), ('75','5','张掖','2','0'), ('76','6','广州','2','0'), ('77','6','深圳','2','0'), ('78','6','潮州','2','0'), ('79','6','东莞','2','0'), ('80','6','佛山','2','0'), ('81','6','河源','2','0'), ('82','6','惠州','2','0'), ('83','6','江门','2','0'), ('84','6','揭阳','2','0'), ('85','6','茂名','2','0'), ('86','6','梅州','2','0'), ('87','6','清远','2','0'), ('88','6','汕头','2','0'), ('89','6','汕尾','2','0'), ('90','6','韶关','2','0'), ('91','6','阳江','2','0'), ('92','6','云浮','2','0'), ('93','6','湛江','2','0'), ('94','6','肇庆','2','0'), ('95','6','中山','2','0'), ('96','6','珠海','2','0'), ('97','7','南宁','2','0'), ('98','7','桂林','2','0'), ('99','7','百色','2','0'), ('100','7','北海','2','0');
INSERT INTO `abs_region` VALUES ('101','7','崇左','2','0'), ('102','7','防城港','2','0'), ('103','7','贵港','2','0'), ('104','7','河池','2','0'), ('105','7','贺州','2','0'), ('106','7','来宾','2','0'), ('107','7','柳州','2','0'), ('108','7','钦州','2','0'), ('109','7','梧州','2','0'), ('110','7','玉林','2','0'), ('111','8','贵阳','2','0'), ('112','8','安顺','2','0'), ('113','8','毕节','2','0'), ('114','8','六盘水','2','0'), ('115','8','黔东南','2','0'), ('116','8','黔南','2','0'), ('117','8','黔西南','2','0'), ('118','8','铜仁','2','0'), ('119','8','遵义','2','0'), ('120','9','海口','2','0'), ('121','9','三亚','2','0'), ('122','9','白沙','2','0'), ('123','9','保亭','2','0'), ('124','9','昌江','2','0'), ('125','9','澄迈县','2','0'), ('126','9','定安县','2','0'), ('127','9','东方','2','0'), ('128','9','乐东','2','0'), ('129','9','临高县','2','0'), ('130','9','陵水','2','0'), ('131','9','琼海','2','0'), ('132','9','琼中','2','0'), ('133','9','屯昌县','2','0'), ('134','9','万宁','2','0'), ('135','9','文昌','2','0'), ('136','9','五指山','2','0'), ('137','9','儋州','2','0'), ('138','10','石家庄','2','0'), ('139','10','保定','2','0'), ('140','10','沧州','2','0'), ('141','10','承德','2','0'), ('142','10','邯郸','2','0'), ('143','10','衡水','2','0'), ('144','10','廊坊','2','0'), ('145','10','秦皇岛','2','0'), ('146','10','唐山','2','0'), ('147','10','邢台','2','0'), ('148','10','张家口','2','0'), ('149','11','郑州','2','0'), ('150','11','洛阳','2','0'), ('151','11','开封','2','0'), ('152','11','安阳','2','0'), ('153','11','鹤壁','2','0'), ('154','11','济源','2','0'), ('155','11','焦作','2','0'), ('156','11','南阳','2','0'), ('157','11','平顶山','2','0'), ('158','11','三门峡','2','0'), ('159','11','商丘','2','0'), ('160','11','新乡','2','0'), ('161','11','信阳','2','0'), ('162','11','许昌','2','0'), ('163','11','周口','2','0'), ('164','11','驻马店','2','0'), ('165','11','漯河','2','0'), ('166','11','濮阳','2','0'), ('167','12','哈尔滨','2','0'), ('168','12','大庆','2','0'), ('169','12','大兴安岭','2','0'), ('170','12','鹤岗','2','0'), ('171','12','黑河','2','0'), ('172','12','鸡西','2','0'), ('173','12','佳木斯','2','0'), ('174','12','牡丹江','2','0'), ('175','12','七台河','2','0'), ('176','12','齐齐哈尔','2','0'), ('177','12','双鸭山','2','0'), ('178','12','绥化','2','0'), ('179','12','伊春','2','0'), ('180','13','武汉','2','0'), ('181','13','仙桃','2','0'), ('182','13','鄂州','2','0'), ('183','13','黄冈','2','0'), ('184','13','黄石','2','0'), ('185','13','荆门','2','0'), ('186','13','荆州','2','0'), ('187','13','潜江','2','0'), ('188','13','神农架林区','2','0'), ('189','13','十堰','2','0'), ('190','13','随州','2','0'), ('191','13','天门','2','0'), ('192','13','咸宁','2','0'), ('193','13','襄樊','2','0'), ('194','13','孝感','2','0'), ('195','13','宜昌','2','0'), ('196','13','恩施','2','0'), ('197','14','长沙','2','0'), ('198','14','张家界','2','0'), ('199','14','常德','2','0'), ('200','14','郴州','2','0');
INSERT INTO `abs_region` VALUES ('201','14','衡阳','2','0'), ('202','14','怀化','2','0'), ('203','14','娄底','2','0'), ('204','14','邵阳','2','0'), ('205','14','湘潭','2','0'), ('206','14','湘西','2','0'), ('207','14','益阳','2','0'), ('208','14','永州','2','0'), ('209','14','岳阳','2','0'), ('210','14','株洲','2','0'), ('211','15','长春','2','0'), ('212','15','吉林','2','0'), ('213','15','白城','2','0'), ('214','15','白山','2','0'), ('215','15','辽源','2','0'), ('216','15','四平','2','0'), ('217','15','松原','2','0'), ('218','15','通化','2','0'), ('219','15','延边','2','0'), ('220','16','南京','2','0'), ('221','16','苏州','2','0'), ('222','16','无锡','2','0'), ('223','16','常州','2','0'), ('224','16','淮安','2','0'), ('225','16','连云港','2','0'), ('226','16','南通','2','0'), ('227','16','宿迁','2','0'), ('228','16','泰州','2','0'), ('229','16','徐州','2','0'), ('230','16','盐城','2','0'), ('231','16','扬州','2','0'), ('232','16','镇江','2','0'), ('233','17','南昌','2','0'), ('234','17','抚州','2','0'), ('235','17','赣州','2','0'), ('236','17','吉安','2','0'), ('237','17','景德镇','2','0'), ('238','17','九江','2','0'), ('239','17','萍乡','2','0'), ('240','17','上饶','2','0'), ('241','17','新余','2','0'), ('242','17','宜春','2','0'), ('243','17','鹰潭','2','0'), ('244','18','沈阳','2','0'), ('245','18','大连','2','0'), ('246','18','鞍山','2','0'), ('247','18','本溪','2','0'), ('248','18','朝阳','2','0'), ('249','18','丹东','2','0'), ('250','18','抚顺','2','0'), ('251','18','阜新','2','0'), ('252','18','葫芦岛','2','0'), ('253','18','锦州','2','0'), ('254','18','辽阳','2','0'), ('255','18','盘锦','2','0'), ('256','18','铁岭','2','0'), ('257','18','营口','2','0'), ('258','19','呼和浩特','2','0'), ('259','19','阿拉善盟','2','0'), ('260','19','巴彦淖尔盟','2','0'), ('261','19','包头','2','0'), ('262','19','赤峰','2','0'), ('263','19','鄂尔多斯','2','0'), ('264','19','呼伦贝尔','2','0'), ('265','19','通辽','2','0'), ('266','19','乌海','2','0'), ('267','19','乌兰察布市','2','0'), ('268','19','锡林郭勒盟','2','0'), ('269','19','兴安盟','2','0'), ('270','20','银川','2','0'), ('271','20','固原','2','0'), ('272','20','石嘴山','2','0'), ('273','20','吴忠','2','0'), ('274','20','中卫','2','0'), ('275','21','西宁','2','0'), ('276','21','果洛','2','0'), ('277','21','海北','2','0'), ('278','21','海东','2','0'), ('279','21','海南','2','0'), ('280','21','海西','2','0'), ('281','21','黄南','2','0'), ('282','21','玉树','2','0'), ('283','22','济南','2','0'), ('284','22','青岛','2','0'), ('285','22','滨州','2','0'), ('286','22','德州','2','0'), ('287','22','东营','2','0'), ('288','22','菏泽','2','0'), ('289','22','济宁','2','0'), ('290','22','莱芜','2','0'), ('291','22','聊城','2','0'), ('292','22','临沂','2','0'), ('293','22','日照','2','0'), ('294','22','泰安','2','0'), ('295','22','威海','2','0'), ('296','22','潍坊','2','0'), ('297','22','烟台','2','0'), ('298','22','枣庄','2','0'), ('299','22','淄博','2','0'), ('300','23','太原','2','0');
INSERT INTO `abs_region` VALUES ('301','23','长治','2','0'), ('302','23','大同','2','0'), ('303','23','晋城','2','0'), ('304','23','晋中','2','0'), ('305','23','临汾','2','0'), ('306','23','吕梁','2','0'), ('307','23','朔州','2','0'), ('308','23','忻州','2','0'), ('309','23','阳泉','2','0'), ('310','23','运城','2','0'), ('311','24','西安','2','0'), ('312','24','安康','2','0'), ('313','24','宝鸡','2','0'), ('314','24','汉中','2','0'), ('315','24','商洛','2','0'), ('316','24','铜川','2','0'), ('317','24','渭南','2','0'), ('318','24','咸阳','2','0'), ('319','24','延安','2','0'), ('320','24','榆林','2','0'), ('321','25','上海','2','0'), ('322','26','成都','2','0'), ('323','26','绵阳','2','0'), ('324','26','阿坝','2','0'), ('325','26','巴中','2','0'), ('326','26','达州','2','0'), ('327','26','德阳','2','0'), ('328','26','甘孜','2','0'), ('329','26','广安','2','0'), ('330','26','广元','2','0'), ('331','26','乐山','2','0'), ('332','26','凉山','2','0'), ('333','26','眉山','2','0'), ('334','26','南充','2','0'), ('335','26','内江','2','0'), ('336','26','攀枝花','2','0'), ('337','26','遂宁','2','0'), ('338','26','雅安','2','0'), ('339','26','宜宾','2','0'), ('340','26','资阳','2','0'), ('341','26','自贡','2','0'), ('342','26','泸州','2','0'), ('343','27','天津','2','0'), ('344','28','拉萨','2','0'), ('345','28','阿里','2','0'), ('346','28','昌都','2','0'), ('347','28','林芝','2','0'), ('348','28','那曲','2','0'), ('349','28','日喀则','2','0'), ('350','28','山南','2','0'), ('351','29','乌鲁木齐','2','0'), ('352','29','阿克苏','2','0'), ('353','29','阿拉尔','2','0'), ('354','29','巴音郭楞','2','0'), ('355','29','博尔塔拉','2','0'), ('356','29','昌吉','2','0'), ('357','29','哈密','2','0'), ('358','29','和田','2','0'), ('359','29','喀什','2','0'), ('360','29','克拉玛依','2','0'), ('361','29','克孜勒苏','2','0'), ('362','29','石河子','2','0'), ('363','29','图木舒克','2','0'), ('364','29','吐鲁番','2','0'), ('365','29','五家渠','2','0'), ('366','29','伊犁','2','0'), ('367','30','昆明','2','0'), ('368','30','怒江','2','0'), ('369','30','普洱','2','0'), ('370','30','丽江','2','0'), ('371','30','保山','2','0'), ('372','30','楚雄','2','0'), ('373','30','大理','2','0'), ('374','30','德宏','2','0'), ('375','30','迪庆','2','0'), ('376','30','红河','2','0'), ('377','30','临沧','2','0'), ('378','30','曲靖','2','0'), ('379','30','文山','2','0'), ('380','30','西双版纳','2','0'), ('381','30','玉溪','2','0'), ('382','30','昭通','2','0'), ('383','31','杭州','2','0'), ('384','31','湖州','2','0'), ('385','31','嘉兴','2','0'), ('386','31','金华','2','0'), ('387','31','丽水','2','0'), ('388','31','宁波','2','0'), ('389','31','绍兴','2','0'), ('390','31','台州','2','0'), ('391','31','温州','2','0'), ('392','31','舟山','2','0'), ('393','31','衢州','2','0'), ('394','32','重庆','2','0'), ('395','33','香港','2','0'), ('396','34','澳门','2','0'), ('397','35','台湾','2','0'), ('398','36','迎江区','3','0'), ('399','36','大观区','3','0'), ('400','36','宜秀区','3','0');
INSERT INTO `abs_region` VALUES ('401','36','桐城市','3','0'), ('402','36','怀宁县','3','0'), ('403','36','枞阳县','3','0'), ('404','36','潜山县','3','0'), ('405','36','太湖县','3','0'), ('406','36','宿松县','3','0'), ('407','36','望江县','3','0'), ('408','36','岳西县','3','0'), ('409','37','中市区','3','0'), ('410','37','东市区','3','0'), ('411','37','西市区','3','0'), ('412','37','郊区','3','0'), ('413','37','怀远县','3','0'), ('414','37','五河县','3','0'), ('415','37','固镇县','3','0'), ('416','38','居巢区','3','0'), ('417','38','庐江县','3','0'), ('418','38','无为县','3','0'), ('419','38','含山县','3','0'), ('420','38','和县','3','0'), ('421','39','贵池区','3','0'), ('422','39','东至县','3','0'), ('423','39','石台县','3','0'), ('424','39','青阳县','3','0'), ('425','40','琅琊区','3','0'), ('426','40','南谯区','3','0'), ('427','40','天长市','3','0'), ('428','40','明光市','3','0'), ('429','40','来安县','3','0'), ('430','40','全椒县','3','0'), ('431','40','定远县','3','0'), ('432','40','凤阳县','3','0'), ('433','41','蚌山区','3','0'), ('434','41','龙子湖区','3','0'), ('435','41','禹会区','3','0'), ('436','41','淮上区','3','0'), ('437','41','颍州区','3','0'), ('438','41','颍东区','3','0'), ('439','41','颍泉区','3','0'), ('440','41','界首市','3','0'), ('441','41','临泉县','3','0'), ('442','41','太和县','3','0'), ('443','41','阜南县','3','0'), ('444','41','颖上县','3','0'), ('445','42','相山区','3','0'), ('446','42','杜集区','3','0'), ('447','42','烈山区','3','0'), ('448','42','濉溪县','3','0'), ('449','43','田家庵区','3','0'), ('450','43','大通区','3','0'), ('451','43','谢家集区','3','0'), ('452','43','八公山区','3','0'), ('453','43','潘集区','3','0'), ('454','43','凤台县','3','0'), ('455','44','屯溪区','3','0'), ('456','44','黄山区','3','0'), ('457','44','徽州区','3','0'), ('458','44','歙县','3','0'), ('459','44','休宁县','3','0'), ('460','44','黟县','3','0'), ('461','44','祁门县','3','0'), ('462','45','金安区','3','0'), ('463','45','裕安区','3','0'), ('464','45','寿县','3','0'), ('465','45','霍邱县','3','0'), ('466','45','舒城县','3','0'), ('467','45','金寨县','3','0'), ('468','45','霍山县','3','0'), ('469','46','雨山区','3','0'), ('470','46','花山区','3','0'), ('471','46','金家庄区','3','0'), ('472','46','当涂县','3','0'), ('473','47','埇桥区','3','0'), ('474','47','砀山县','3','0'), ('475','47','萧县','3','0'), ('476','47','灵璧县','3','0'), ('477','47','泗县','3','0'), ('478','48','铜官山区','3','0'), ('479','48','狮子山区','3','0'), ('480','48','郊区','3','0'), ('481','48','铜陵县','3','0'), ('482','49','镜湖区','3','0'), ('483','49','弋江区','3','0'), ('484','49','鸠江区','3','0'), ('485','49','三山区','3','0'), ('486','49','芜湖县','3','0'), ('487','49','繁昌县','3','0'), ('488','49','南陵县','3','0'), ('489','50','宣州区','3','0'), ('490','50','宁国市','3','0'), ('491','50','郎溪县','3','0'), ('492','50','广德县','3','0'), ('493','50','泾县','3','0'), ('494','50','绩溪县','3','0'), ('495','50','旌德县','3','0'), ('496','51','涡阳县','3','0'), ('497','51','蒙城县','3','0'), ('498','51','利辛县','3','0'), ('499','51','谯城区','3','0'), ('500','52','东城区','3','0');
INSERT INTO `abs_region` VALUES ('501','52','西城区','3','0'), ('502','52','海淀区','3','0'), ('503','52','朝阳区','3','0'), ('504','52','崇文区','3','0'), ('505','52','宣武区','3','0'), ('506','52','丰台区','3','0'), ('507','52','石景山区','3','0'), ('508','52','房山区','3','0'), ('509','52','门头沟区','3','0'), ('510','52','通州区','3','0'), ('511','52','顺义区','3','0'), ('512','52','昌平区','3','0'), ('513','52','怀柔区','3','0'), ('514','52','平谷区','3','0'), ('515','52','大兴区','3','0'), ('516','52','密云县','3','0'), ('517','52','延庆县','3','0'), ('518','53','鼓楼区','3','0'), ('519','53','台江区','3','0'), ('520','53','仓山区','3','0'), ('521','53','马尾区','3','0'), ('522','53','晋安区','3','0'), ('523','53','福清市','3','0'), ('524','53','长乐市','3','0'), ('525','53','闽侯县','3','0'), ('526','53','连江县','3','0'), ('527','53','罗源县','3','0'), ('528','53','闽清县','3','0'), ('529','53','永泰县','3','0'), ('530','53','平潭县','3','0'), ('531','54','新罗区','3','0'), ('532','54','漳平市','3','0'), ('533','54','长汀县','3','0'), ('534','54','永定县','3','0'), ('535','54','上杭县','3','0'), ('536','54','武平县','3','0'), ('537','54','连城县','3','0'), ('538','55','延平区','3','0'), ('539','55','邵武市','3','0'), ('540','55','武夷山市','3','0'), ('541','55','建瓯市','3','0'), ('542','55','建阳市','3','0'), ('543','55','顺昌县','3','0'), ('544','55','浦城县','3','0'), ('545','55','光泽县','3','0'), ('546','55','松溪县','3','0'), ('547','55','政和县','3','0'), ('548','56','蕉城区','3','0'), ('549','56','福安市','3','0'), ('550','56','福鼎市','3','0'), ('551','56','霞浦县','3','0'), ('552','56','古田县','3','0'), ('553','56','屏南县','3','0'), ('554','56','寿宁县','3','0'), ('555','56','周宁县','3','0'), ('556','56','柘荣县','3','0'), ('557','57','城厢区','3','0'), ('558','57','涵江区','3','0'), ('559','57','荔城区','3','0'), ('560','57','秀屿区','3','0'), ('561','57','仙游县','3','0'), ('562','58','鲤城区','3','0'), ('563','58','丰泽区','3','0'), ('564','58','洛江区','3','0'), ('565','58','清濛开发区','3','0'), ('566','58','泉港区','3','0'), ('567','58','石狮市','3','0'), ('568','58','晋江市','3','0'), ('569','58','南安市','3','0'), ('570','58','惠安县','3','0'), ('571','58','安溪县','3','0'), ('572','58','永春县','3','0'), ('573','58','德化县','3','0'), ('574','58','金门县','3','0'), ('575','59','梅列区','3','0'), ('576','59','三元区','3','0'), ('577','59','永安市','3','0'), ('578','59','明溪县','3','0'), ('579','59','清流县','3','0'), ('580','59','宁化县','3','0'), ('581','59','大田县','3','0'), ('582','59','尤溪县','3','0'), ('583','59','沙县','3','0'), ('584','59','将乐县','3','0'), ('585','59','泰宁县','3','0'), ('586','59','建宁县','3','0'), ('587','60','思明区','3','0'), ('588','60','海沧区','3','0'), ('589','60','湖里区','3','0'), ('590','60','集美区','3','0'), ('591','60','同安区','3','0'), ('592','60','翔安区','3','0'), ('593','61','芗城区','3','0'), ('594','61','龙文区','3','0'), ('595','61','龙海市','3','0'), ('596','61','云霄县','3','0'), ('597','61','漳浦县','3','0'), ('598','61','诏安县','3','0'), ('599','61','长泰县','3','0'), ('600','61','东山县','3','0');
INSERT INTO `abs_region` VALUES ('601','61','南靖县','3','0'), ('602','61','平和县','3','0'), ('603','61','华安县','3','0'), ('604','62','皋兰县','3','0'), ('605','62','城关区','3','0'), ('606','62','七里河区','3','0'), ('607','62','西固区','3','0'), ('608','62','安宁区','3','0'), ('609','62','红古区','3','0'), ('610','62','永登县','3','0'), ('611','62','榆中县','3','0'), ('612','63','白银区','3','0'), ('613','63','平川区','3','0'), ('614','63','会宁县','3','0'), ('615','63','景泰县','3','0'), ('616','63','靖远县','3','0'), ('617','64','临洮县','3','0'), ('618','64','陇西县','3','0'), ('619','64','通渭县','3','0'), ('620','64','渭源县','3','0'), ('621','64','漳县','3','0'), ('622','64','岷县','3','0'), ('623','64','安定区','3','0'), ('624','64','安定区','3','0'), ('625','65','合作市','3','0'), ('626','65','临潭县','3','0'), ('627','65','卓尼县','3','0'), ('628','65','舟曲县','3','0'), ('629','65','迭部县','3','0'), ('630','65','玛曲县','3','0'), ('631','65','碌曲县','3','0'), ('632','65','夏河县','3','0'), ('633','66','嘉峪关市','3','0'), ('634','67','金川区','3','0'), ('635','67','永昌县','3','0'), ('636','68','肃州区','3','0'), ('637','68','玉门市','3','0'), ('638','68','敦煌市','3','0'), ('639','68','金塔县','3','0'), ('640','68','瓜州县','3','0'), ('641','68','肃北','3','0'), ('642','68','阿克塞','3','0'), ('643','69','临夏市','3','0'), ('644','69','临夏县','3','0'), ('645','69','康乐县','3','0'), ('646','69','永靖县','3','0'), ('647','69','广河县','3','0'), ('648','69','和政县','3','0'), ('649','69','东乡族自治县','3','0'), ('650','69','积石山','3','0'), ('651','70','成县','3','0'), ('652','70','徽县','3','0'), ('653','70','康县','3','0'), ('654','70','礼县','3','0'), ('655','70','两当县','3','0'), ('656','70','文县','3','0'), ('657','70','西和县','3','0'), ('658','70','宕昌县','3','0'), ('659','70','武都区','3','0'), ('660','71','崇信县','3','0'), ('661','71','华亭县','3','0'), ('662','71','静宁县','3','0'), ('663','71','灵台县','3','0'), ('664','71','崆峒区','3','0'), ('665','71','庄浪县','3','0'), ('666','71','泾川县','3','0'), ('667','72','合水县','3','0'), ('668','72','华池县','3','0'), ('669','72','环县','3','0'), ('670','72','宁县','3','0'), ('671','72','庆城县','3','0'), ('672','72','西峰区','3','0'), ('673','72','镇原县','3','0'), ('674','72','正宁县','3','0'), ('675','73','甘谷县','3','0'), ('676','73','秦安县','3','0'), ('677','73','清水县','3','0'), ('678','73','秦州区','3','0'), ('679','73','麦积区','3','0'), ('680','73','武山县','3','0'), ('681','73','张家川','3','0'), ('682','74','古浪县','3','0'), ('683','74','民勤县','3','0'), ('684','74','天祝','3','0'), ('685','74','凉州区','3','0'), ('686','75','高台县','3','0'), ('687','75','临泽县','3','0'), ('688','75','民乐县','3','0'), ('689','75','山丹县','3','0'), ('690','75','肃南','3','0'), ('691','75','甘州区','3','0'), ('692','76','从化市','3','0'), ('693','76','天河区','3','0'), ('694','76','东山区','3','0'), ('695','76','白云区','3','0'), ('696','76','海珠区','3','0'), ('697','76','荔湾区','3','0'), ('698','76','越秀区','3','0'), ('699','76','黄埔区','3','0'), ('700','76','番禺区','3','0');
INSERT INTO `abs_region` VALUES ('701','76','花都区','3','0'), ('702','76','增城区','3','0'), ('703','76','从化区','3','0'), ('704','76','市郊','3','0'), ('705','77','福田区','3','0'), ('706','77','罗湖区','3','0'), ('707','77','南山区','3','0'), ('708','77','宝安区','3','0'), ('709','77','龙岗区','3','0'), ('710','77','盐田区','3','0'), ('711','78','湘桥区','3','0'), ('712','78','潮安县','3','0'), ('713','78','饶平县','3','0'), ('714','79','南城区','3','0'), ('715','79','东城区','3','0'), ('716','79','万江区','3','0'), ('717','79','莞城区','3','0'), ('718','79','石龙镇','3','0'), ('719','79','虎门镇','3','0'), ('720','79','麻涌镇','3','0'), ('721','79','道滘镇','3','0'), ('722','79','石碣镇','3','0'), ('723','79','沙田镇','3','0'), ('724','79','望牛墩镇','3','0'), ('725','79','洪梅镇','3','0'), ('726','79','茶山镇','3','0'), ('727','79','寮步镇','3','0'), ('728','79','大岭山镇','3','0'), ('729','79','大朗镇','3','0'), ('730','79','黄江镇','3','0'), ('731','79','樟木头','3','0'), ('732','79','凤岗镇','3','0'), ('733','79','塘厦镇','3','0'), ('734','79','谢岗镇','3','0'), ('735','79','厚街镇','3','0'), ('736','79','清溪镇','3','0'), ('737','79','常平镇','3','0'), ('738','79','桥头镇','3','0'), ('739','79','横沥镇','3','0'), ('740','79','东坑镇','3','0'), ('741','79','企石镇','3','0'), ('742','79','石排镇','3','0'), ('743','79','长安镇','3','0'), ('744','79','中堂镇','3','0'), ('745','79','高埗镇','3','0'), ('746','80','禅城区','3','0'), ('747','80','南海区','3','0'), ('748','80','顺德区','3','0'), ('749','80','三水区','3','0'), ('750','80','高明区','3','0'), ('751','81','东源县','3','0'), ('752','81','和平县','3','0'), ('753','81','源城区','3','0'), ('754','81','连平县','3','0'), ('755','81','龙川县','3','0'), ('756','81','紫金县','3','0'), ('757','82','惠阳区','3','0'), ('758','82','惠城区','3','0'), ('759','82','大亚湾','3','0'), ('760','82','博罗县','3','0'), ('761','82','惠东县','3','0'), ('762','82','龙门县','3','0'), ('763','83','江海区','3','0'), ('764','83','蓬江区','3','0'), ('765','83','新会区','3','0'), ('766','83','台山市','3','0'), ('767','83','开平市','3','0'), ('768','83','鹤山市','3','0'), ('769','83','恩平市','3','0'), ('770','84','榕城区','3','0'), ('771','84','普宁市','3','0'), ('772','84','揭东县','3','0'), ('773','84','揭西县','3','0'), ('774','84','惠来县','3','0'), ('775','85','茂南区','3','0'), ('776','85','茂港区','3','0'), ('777','85','高州市','3','0'), ('778','85','化州市','3','0'), ('779','85','信宜市','3','0'), ('780','85','电白县','3','0'), ('781','86','梅县','3','0'), ('782','86','梅江区','3','0'), ('783','86','兴宁市','3','0'), ('784','86','大埔县','3','0'), ('785','86','丰顺县','3','0'), ('786','86','五华县','3','0'), ('787','86','平远县','3','0'), ('788','86','蕉岭县','3','0'), ('789','87','清城区','3','0'), ('790','87','英德市','3','0'), ('791','87','连州市','3','0'), ('792','87','佛冈县','3','0'), ('793','87','阳山县','3','0'), ('794','87','清新县','3','0'), ('795','87','连山','3','0'), ('796','87','连南','3','0'), ('797','88','南澳县','3','0'), ('798','88','潮阳区','3','0'), ('799','88','澄海区','3','0'), ('800','88','龙湖区','3','0');
INSERT INTO `abs_region` VALUES ('801','88','金平区','3','0'), ('802','88','濠江区','3','0'), ('803','88','潮南区','3','0'), ('804','89','城区','3','0'), ('805','89','陆丰市','3','0'), ('806','89','海丰县','3','0'), ('807','89','陆河县','3','0'), ('808','90','曲江县','3','0'), ('809','90','浈江区','3','0'), ('810','90','武江区','3','0'), ('811','90','曲江区','3','0'), ('812','90','乐昌市','3','0'), ('813','90','南雄市','3','0'), ('814','90','始兴县','3','0'), ('815','90','仁化县','3','0'), ('816','90','翁源县','3','0'), ('817','90','新丰县','3','0'), ('818','90','乳源','3','0'), ('819','91','江城区','3','0'), ('820','91','阳春市','3','0'), ('821','91','阳西县','3','0'), ('822','91','阳东县','3','0'), ('823','92','云城区','3','0'), ('824','92','罗定市','3','0'), ('825','92','新兴县','3','0'), ('826','92','郁南县','3','0'), ('827','92','云安县','3','0'), ('828','93','赤坎区','3','0'), ('829','93','霞山区','3','0'), ('830','93','坡头区','3','0'), ('831','93','麻章区','3','0'), ('832','93','廉江市','3','0'), ('833','93','雷州市','3','0'), ('834','93','吴川市','3','0'), ('835','93','遂溪县','3','0'), ('836','93','徐闻县','3','0'), ('837','94','肇庆市','3','0'), ('838','94','高要市','3','0'), ('839','94','四会市','3','0'), ('840','94','广宁县','3','0'), ('841','94','怀集县','3','0'), ('842','94','封开县','3','0'), ('843','94','德庆县','3','0'), ('844','95','石岐街道','3','0'), ('845','95','东区街道','3','0'), ('846','95','西区街道','3','0'), ('847','95','环城街道','3','0'), ('848','95','中山港街道','3','0'), ('849','95','五桂山街道','3','0'), ('850','96','香洲区','3','0'), ('851','96','斗门区','3','0'), ('852','96','金湾区','3','0'), ('853','97','邕宁区','3','0'), ('854','97','青秀区','3','0'), ('855','97','兴宁区','3','0'), ('856','97','良庆区','3','0'), ('857','97','西乡塘区','3','0'), ('858','97','江南区','3','0'), ('859','97','武鸣县','3','0'), ('860','97','隆安县','3','0'), ('861','97','马山县','3','0'), ('862','97','上林县','3','0'), ('863','97','宾阳县','3','0'), ('864','97','横县','3','0'), ('865','98','秀峰区','3','0'), ('866','98','叠彩区','3','0'), ('867','98','象山区','3','0'), ('868','98','七星区','3','0'), ('869','98','雁山区','3','0'), ('870','98','阳朔县','3','0'), ('871','98','临桂县','3','0'), ('872','98','灵川县','3','0'), ('873','98','全州县','3','0'), ('874','98','平乐县','3','0'), ('875','98','兴安县','3','0'), ('876','98','灌阳县','3','0'), ('877','98','荔浦县','3','0'), ('878','98','资源县','3','0'), ('879','98','永福县','3','0'), ('880','98','龙胜','3','0'), ('881','98','恭城','3','0'), ('882','99','右江区','3','0'), ('883','99','凌云县','3','0'), ('884','99','平果县','3','0'), ('885','99','西林县','3','0'), ('886','99','乐业县','3','0'), ('887','99','德保县','3','0'), ('888','99','田林县','3','0'), ('889','99','田阳县','3','0'), ('890','99','靖西县','3','0'), ('891','99','田东县','3','0'), ('892','99','那坡县','3','0'), ('893','99','隆林','3','0'), ('894','100','海城区','3','0'), ('895','100','银海区','3','0'), ('896','100','铁山港区','3','0'), ('897','100','合浦县','3','0'), ('898','101','江州区','3','0'), ('899','101','凭祥市','3','0'), ('900','101','宁明县','3','0');
INSERT INTO `abs_region` VALUES ('901','101','扶绥县','3','0'), ('902','101','龙州县','3','0'), ('903','101','大新县','3','0'), ('904','101','天等县','3','0'), ('905','102','港口区','3','0'), ('906','102','防城区','3','0'), ('907','102','东兴市','3','0'), ('908','102','上思县','3','0'), ('909','103','港北区','3','0'), ('910','103','港南区','3','0'), ('911','103','覃塘区','3','0'), ('912','103','桂平市','3','0'), ('913','103','平南县','3','0'), ('914','104','金城江区','3','0'), ('915','104','宜州市','3','0'), ('916','104','天峨县','3','0'), ('917','104','凤山县','3','0'), ('918','104','南丹县','3','0'), ('919','104','东兰县','3','0'), ('920','104','都安','3','0'), ('921','104','罗城','3','0'), ('922','104','巴马','3','0'), ('923','104','环江','3','0'), ('924','104','大化','3','0'), ('925','105','八步区','3','0'), ('926','105','钟山县','3','0'), ('927','105','昭平县','3','0'), ('928','105','富川','3','0'), ('929','106','兴宾区','3','0'), ('930','106','合山市','3','0'), ('931','106','象州县','3','0'), ('932','106','武宣县','3','0'), ('933','106','忻城县','3','0'), ('934','106','金秀','3','0'), ('935','107','城中区','3','0'), ('936','107','鱼峰区','3','0'), ('937','107','柳北区','3','0'), ('938','107','柳南区','3','0'), ('939','107','柳江县','3','0'), ('940','107','柳城县','3','0'), ('941','107','鹿寨县','3','0'), ('942','107','融安县','3','0'), ('943','107','融水','3','0'), ('944','107','三江','3','0'), ('945','108','钦南区','3','0'), ('946','108','钦北区','3','0'), ('947','108','灵山县','3','0'), ('948','108','浦北县','3','0'), ('949','109','万秀区','3','0'), ('950','109','蝶山区','3','0'), ('951','109','长洲区','3','0'), ('952','109','岑溪市','3','0'), ('953','109','苍梧县','3','0'), ('954','109','藤县','3','0'), ('955','109','蒙山县','3','0'), ('956','110','玉州区','3','0'), ('957','110','北流市','3','0'), ('958','110','容县','3','0'), ('959','110','陆川县','3','0'), ('960','110','博白县','3','0'), ('961','110','兴业县','3','0'), ('962','111','南明区','3','0'), ('963','111','云岩区','3','0'), ('964','111','花溪区','3','0'), ('965','111','乌当区','3','0'), ('966','111','白云区','3','0'), ('967','111','小河区','3','0'), ('968','111','金阳新区','3','0'), ('969','111','新天园区','3','0'), ('970','111','清镇市','3','0'), ('971','111','开阳县','3','0'), ('972','111','修文县','3','0'), ('973','111','息烽县','3','0'), ('974','112','西秀区','3','0'), ('975','112','关岭','3','0'), ('976','112','镇宁','3','0'), ('977','112','紫云','3','0'), ('978','112','平坝县','3','0'), ('979','112','普定县','3','0'), ('980','113','毕节市','3','0'), ('981','113','大方县','3','0'), ('982','113','黔西县','3','0'), ('983','113','金沙县','3','0'), ('984','113','织金县','3','0'), ('985','113','纳雍县','3','0'), ('986','113','赫章县','3','0'), ('987','113','威宁','3','0'), ('988','114','钟山区','3','0'), ('989','114','六枝特区','3','0'), ('990','114','水城县','3','0'), ('991','114','盘县','3','0'), ('992','115','凯里市','3','0'), ('993','115','黄平县','3','0'), ('994','115','施秉县','3','0'), ('995','115','三穗县','3','0'), ('996','115','镇远县','3','0'), ('997','115','岑巩县','3','0'), ('998','115','天柱县','3','0'), ('999','115','锦屏县','3','0'), ('1000','115','剑河县','3','0');
INSERT INTO `abs_region` VALUES ('1001','115','台江县','3','0'), ('1002','115','黎平县','3','0'), ('1003','115','榕江县','3','0'), ('1004','115','从江县','3','0'), ('1005','115','雷山县','3','0'), ('1006','115','麻江县','3','0'), ('1007','115','丹寨县','3','0'), ('1008','116','都匀市','3','0'), ('1009','116','福泉市','3','0'), ('1010','116','荔波县','3','0'), ('1011','116','贵定县','3','0'), ('1012','116','瓮安县','3','0'), ('1013','116','独山县','3','0'), ('1014','116','平塘县','3','0'), ('1015','116','罗甸县','3','0'), ('1016','116','长顺县','3','0'), ('1017','116','龙里县','3','0'), ('1018','116','惠水县','3','0'), ('1019','116','三都','3','0'), ('1020','117','兴义市','3','0'), ('1021','117','兴仁县','3','0'), ('1022','117','普安县','3','0'), ('1023','117','晴隆县','3','0'), ('1024','117','贞丰县','3','0'), ('1025','117','望谟县','3','0'), ('1026','117','册亨县','3','0'), ('1027','117','安龙县','3','0'), ('1028','118','铜仁市','3','0'), ('1029','118','江口县','3','0'), ('1030','118','石阡县','3','0'), ('1031','118','思南县','3','0'), ('1032','118','德江县','3','0'), ('1033','118','玉屏','3','0'), ('1034','118','印江','3','0'), ('1035','118','沿河','3','0'), ('1036','118','松桃','3','0'), ('1037','118','万山特区','3','0'), ('1038','119','红花岗区','3','0'), ('1039','119','务川县','3','0'), ('1040','119','道真县','3','0'), ('1041','119','汇川区','3','0'), ('1042','119','赤水市','3','0'), ('1043','119','仁怀市','3','0'), ('1044','119','遵义县','3','0'), ('1045','119','桐梓县','3','0'), ('1046','119','绥阳县','3','0'), ('1047','119','正安县','3','0'), ('1048','119','凤冈县','3','0'), ('1049','119','湄潭县','3','0'), ('1050','119','余庆县','3','0'), ('1051','119','习水县','3','0'), ('1052','119','道真','3','0'), ('1053','119','务川','3','0'), ('1054','120','秀英区','3','0'), ('1055','120','龙华区','3','0'), ('1056','120','琼山区','3','0'), ('1057','120','美兰区','3','0'), ('1058','137','市区','3','0'), ('1059','137','洋浦开发区','3','0'), ('1060','137','那大镇','3','0'), ('1061','137','王五镇','3','0'), ('1062','137','雅星镇','3','0'), ('1063','137','大成镇','3','0'), ('1064','137','中和镇','3','0'), ('1065','137','峨蔓镇','3','0'), ('1066','137','南丰镇','3','0'), ('1067','137','白马井镇','3','0'), ('1068','137','兰洋镇','3','0'), ('1069','137','和庆镇','3','0'), ('1070','137','海头镇','3','0'), ('1071','137','排浦镇','3','0'), ('1072','137','东成镇','3','0'), ('1073','137','光村镇','3','0'), ('1074','137','木棠镇','3','0'), ('1075','137','新州镇','3','0'), ('1076','137','三都镇','3','0'), ('1077','137','其他','3','0'), ('1078','138','长安区','3','0'), ('1079','138','桥东区','3','0'), ('1080','138','桥西区','3','0'), ('1081','138','新华区','3','0'), ('1082','138','裕华区','3','0'), ('1083','138','井陉矿区','3','0'), ('1084','138','高新区','3','0'), ('1085','138','辛集市','3','0'), ('1086','138','藁城市','3','0'), ('1087','138','晋州市','3','0'), ('1088','138','新乐市','3','0'), ('1089','138','鹿泉市','3','0'), ('1090','138','井陉县','3','0'), ('1091','138','正定县','3','0'), ('1092','138','栾城县','3','0'), ('1093','138','行唐县','3','0'), ('1094','138','灵寿县','3','0'), ('1095','138','高邑县','3','0'), ('1096','138','深泽县','3','0'), ('1097','138','赞皇县','3','0'), ('1098','138','无极县','3','0'), ('1099','138','平山县','3','0'), ('1100','138','元氏县','3','0');
INSERT INTO `abs_region` VALUES ('1101','138','赵县','3','0'), ('1102','139','新市区','3','0'), ('1103','139','南市区','3','0'), ('1104','139','北市区','3','0'), ('1105','139','涿州市','3','0'), ('1106','139','定州市','3','0'), ('1107','139','安国市','3','0'), ('1108','139','高碑店市','3','0'), ('1109','139','满城县','3','0'), ('1110','139','清苑县','3','0'), ('1111','139','涞水县','3','0'), ('1112','139','阜平县','3','0'), ('1113','139','徐水县','3','0'), ('1114','139','定兴县','3','0'), ('1115','139','唐县','3','0'), ('1116','139','高阳县','3','0'), ('1117','139','容城县','3','0'), ('1118','139','涞源县','3','0'), ('1119','139','望都县','3','0'), ('1120','139','安新县','3','0'), ('1121','139','易县','3','0'), ('1122','139','曲阳县','3','0'), ('1123','139','蠡县','3','0'), ('1124','139','顺平县','3','0'), ('1125','139','博野县','3','0'), ('1126','139','雄县','3','0'), ('1127','140','运河区','3','0'), ('1128','140','新华区','3','0'), ('1129','140','泊头市','3','0'), ('1130','140','任丘市','3','0'), ('1131','140','黄骅市','3','0'), ('1132','140','河间市','3','0'), ('1133','140','沧县','3','0'), ('1134','140','青县','3','0'), ('1135','140','东光县','3','0'), ('1136','140','海兴县','3','0'), ('1137','140','盐山县','3','0'), ('1138','140','肃宁县','3','0'), ('1139','140','南皮县','3','0'), ('1140','140','吴桥县','3','0'), ('1141','140','献县','3','0'), ('1142','140','孟村','3','0'), ('1143','141','双桥区','3','0'), ('1144','141','双滦区','3','0'), ('1145','141','鹰手营子矿区','3','0'), ('1146','141','承德县','3','0'), ('1147','141','兴隆县','3','0'), ('1148','141','平泉县','3','0'), ('1149','141','滦平县','3','0'), ('1150','141','隆化县','3','0'), ('1151','141','丰宁','3','0'), ('1152','141','宽城','3','0'), ('1153','141','围场','3','0'), ('1154','142','从台区','3','0'), ('1155','142','复兴区','3','0'), ('1156','142','邯山区','3','0'), ('1157','142','峰峰矿区','3','0'), ('1158','142','武安市','3','0'), ('1159','142','邯郸县','3','0'), ('1160','142','临漳县','3','0'), ('1161','142','成安县','3','0'), ('1162','142','大名县','3','0'), ('1163','142','涉县','3','0'), ('1164','142','磁县','3','0'), ('1165','142','肥乡县','3','0'), ('1166','142','永年县','3','0'), ('1167','142','邱县','3','0'), ('1168','142','鸡泽县','3','0'), ('1169','142','广平县','3','0'), ('1170','142','馆陶县','3','0'), ('1171','142','魏县','3','0'), ('1172','142','曲周县','3','0'), ('1173','143','桃城区','3','0'), ('1174','143','冀州市','3','0'), ('1175','143','深州市','3','0'), ('1176','143','枣强县','3','0'), ('1177','143','武邑县','3','0'), ('1178','143','武强县','3','0'), ('1179','143','饶阳县','3','0'), ('1180','143','安平县','3','0'), ('1181','143','故城县','3','0'), ('1182','143','景县','3','0'), ('1183','143','阜城县','3','0'), ('1184','144','安次区','3','0'), ('1185','144','广阳区','3','0'), ('1186','144','霸州市','3','0'), ('1187','144','三河市','3','0'), ('1188','144','固安县','3','0'), ('1189','144','永清县','3','0'), ('1190','144','香河县','3','0'), ('1191','144','大城县','3','0'), ('1192','144','文安县','3','0'), ('1193','144','大厂','3','0'), ('1194','145','海港区','3','0'), ('1195','145','山海关区','3','0'), ('1196','145','北戴河区','3','0'), ('1197','145','昌黎县','3','0'), ('1198','145','抚宁县','3','0'), ('1199','145','卢龙县','3','0'), ('1200','145','青龙','3','0');
INSERT INTO `abs_region` VALUES ('1201','146','路北区','3','0'), ('1202','146','路南区','3','0'), ('1203','146','古冶区','3','0'), ('1204','146','开平区','3','0'), ('1205','146','丰南区','3','0'), ('1206','146','丰润区','3','0'), ('1207','146','遵化市','3','0'), ('1208','146','迁安市','3','0'), ('1209','146','滦县','3','0'), ('1210','146','滦南县','3','0'), ('1211','146','乐亭县','3','0'), ('1212','146','迁西县','3','0'), ('1213','146','玉田县','3','0'), ('1214','146','唐海县','3','0'), ('1215','147','桥东区','3','0'), ('1216','147','桥西区','3','0'), ('1217','147','南宫市','3','0'), ('1218','147','沙河市','3','0'), ('1219','147','邢台县','3','0'), ('1220','147','临城县','3','0'), ('1221','147','内丘县','3','0'), ('1222','147','柏乡县','3','0'), ('1223','147','隆尧县','3','0'), ('1224','147','任县','3','0'), ('1225','147','南和县','3','0'), ('1226','147','宁晋县','3','0'), ('1227','147','巨鹿县','3','0'), ('1228','147','新河县','3','0'), ('1229','147','广宗县','3','0'), ('1230','147','平乡县','3','0'), ('1231','147','威县','3','0'), ('1232','147','清河县','3','0'), ('1233','147','临西县','3','0'), ('1234','148','桥西区','3','0'), ('1235','148','桥东区','3','0'), ('1236','148','宣化区','3','0'), ('1237','148','下花园区','3','0'), ('1238','148','宣化县','3','0'), ('1239','148','张北县','3','0'), ('1240','148','康保县','3','0'), ('1241','148','沽源县','3','0'), ('1242','148','尚义县','3','0'), ('1243','148','蔚县','3','0'), ('1244','148','阳原县','3','0'), ('1245','148','怀安县','3','0'), ('1246','148','万全县','3','0'), ('1247','148','怀来县','3','0'), ('1248','148','涿鹿县','3','0'), ('1249','148','赤城县','3','0'), ('1250','148','崇礼县','3','0'), ('1251','149','金水区','3','0'), ('1252','149','邙山区','3','0'), ('1253','149','二七区','3','0'), ('1254','149','管城区','3','0'), ('1255','149','中原区','3','0'), ('1256','149','上街区','3','0'), ('1257','149','惠济区','3','0'), ('1258','149','郑东新区','3','0'), ('1259','149','经济技术开发区','3','0'), ('1260','149','高新开发区','3','0'), ('1261','149','出口加工区','3','0'), ('1262','149','巩义市','3','0'), ('1263','149','荥阳市','3','0'), ('1264','149','新密市','3','0'), ('1265','149','新郑市','3','0'), ('1266','149','登封市','3','0'), ('1267','149','中牟县','3','0'), ('1268','150','西工区','3','0'), ('1269','150','老城区','3','0'), ('1270','150','涧西区','3','0'), ('1271','150','瀍河回族区','3','0'), ('1272','150','洛龙区','3','0'), ('1273','150','吉利区','3','0'), ('1274','150','偃师市','3','0'), ('1275','150','孟津县','3','0'), ('1276','150','新安县','3','0'), ('1277','150','栾川县','3','0'), ('1278','150','嵩县','3','0'), ('1279','150','汝阳县','3','0'), ('1280','150','宜阳县','3','0'), ('1281','150','洛宁县','3','0'), ('1282','150','伊川县','3','0'), ('1283','151','鼓楼区','3','0'), ('1284','151','龙亭区','3','0'), ('1285','151','顺河回族区','3','0'), ('1286','151','金明区','3','0'), ('1287','151','禹王台区','3','0'), ('1288','151','杞县','3','0'), ('1289','151','通许县','3','0'), ('1290','151','尉氏县','3','0'), ('1291','151','开封县','3','0'), ('1292','151','兰考县','3','0'), ('1293','152','北关区','3','0'), ('1294','152','文峰区','3','0'), ('1295','152','殷都区','3','0'), ('1296','152','龙安区','3','0'), ('1297','152','林州市','3','0'), ('1298','152','安阳县','3','0'), ('1299','152','汤阴县','3','0'), ('1300','152','滑县','3','0');
INSERT INTO `abs_region` VALUES ('1301','152','内黄县','3','0'), ('1302','153','淇滨区','3','0'), ('1303','153','山城区','3','0'), ('1304','153','鹤山区','3','0'), ('1305','153','浚县','3','0'), ('1306','153','淇县','3','0'), ('1307','154','济源市','3','0'), ('1308','155','解放区','3','0'), ('1309','155','中站区','3','0'), ('1310','155','马村区','3','0'), ('1311','155','山阳区','3','0'), ('1312','155','沁阳市','3','0'), ('1313','155','孟州市','3','0'), ('1314','155','修武县','3','0'), ('1315','155','博爱县','3','0'), ('1316','155','武陟县','3','0'), ('1317','155','温县','3','0'), ('1318','156','卧龙区','3','0'), ('1319','156','宛城区','3','0'), ('1320','156','邓州市','3','0'), ('1321','156','南召县','3','0'), ('1322','156','方城县','3','0'), ('1323','156','西峡县','3','0'), ('1324','156','镇平县','3','0'), ('1325','156','内乡县','3','0'), ('1326','156','淅川县','3','0'), ('1327','156','社旗县','3','0'), ('1328','156','唐河县','3','0'), ('1329','156','新野县','3','0'), ('1330','156','桐柏县','3','0'), ('1331','157','新华区','3','0'), ('1332','157','卫东区','3','0'), ('1333','157','湛河区','3','0'), ('1334','157','石龙区','3','0'), ('1335','157','舞钢市','3','0'), ('1336','157','汝州市','3','0'), ('1337','157','宝丰县','3','0'), ('1338','157','叶县','3','0'), ('1339','157','鲁山县','3','0'), ('1340','157','郏县','3','0'), ('1341','158','湖滨区','3','0'), ('1342','158','义马市','3','0'), ('1343','158','灵宝市','3','0'), ('1344','158','渑池县','3','0'), ('1345','158','陕县','3','0'), ('1346','158','卢氏县','3','0'), ('1347','159','梁园区','3','0'), ('1348','159','睢阳区','3','0'), ('1349','159','永城市','3','0'), ('1350','159','民权县','3','0'), ('1351','159','睢县','3','0'), ('1352','159','宁陵县','3','0'), ('1353','159','虞城县','3','0'), ('1354','159','柘城县','3','0'), ('1355','159','夏邑县','3','0'), ('1356','160','卫滨区','3','0'), ('1357','160','红旗区','3','0'), ('1358','160','凤泉区','3','0'), ('1359','160','牧野区','3','0'), ('1360','160','卫辉市','3','0'), ('1361','160','辉县市','3','0'), ('1362','160','新乡县','3','0'), ('1363','160','获嘉县','3','0'), ('1364','160','原阳县','3','0'), ('1365','160','延津县','3','0'), ('1366','160','封丘县','3','0'), ('1367','160','长垣县','3','0'), ('1368','161','浉河区','3','0'), ('1369','161','平桥区','3','0'), ('1370','161','罗山县','3','0'), ('1371','161','光山县','3','0'), ('1372','161','新县','3','0'), ('1373','161','商城县','3','0'), ('1374','161','固始县','3','0'), ('1375','161','潢川县','3','0'), ('1376','161','淮滨县','3','0'), ('1377','161','息县','3','0'), ('1378','162','魏都区','3','0'), ('1379','162','禹州市','3','0'), ('1380','162','长葛市','3','0'), ('1381','162','许昌县','3','0'), ('1382','162','鄢陵县','3','0'), ('1383','162','襄城县','3','0'), ('1384','163','川汇区','3','0'), ('1385','163','项城市','3','0'), ('1386','163','扶沟县','3','0'), ('1387','163','西华县','3','0'), ('1388','163','商水县','3','0'), ('1389','163','沈丘县','3','0'), ('1390','163','郸城县','3','0'), ('1391','163','淮阳县','3','0'), ('1392','163','太康县','3','0'), ('1393','163','鹿邑县','3','0'), ('1394','164','驿城区','3','0'), ('1395','164','西平县','3','0'), ('1396','164','上蔡县','3','0'), ('1397','164','平舆县','3','0'), ('1398','164','正阳县','3','0'), ('1399','164','确山县','3','0'), ('1400','164','泌阳县','3','0');
INSERT INTO `abs_region` VALUES ('1401','164','汝南县','3','0'), ('1402','164','遂平县','3','0'), ('1403','164','新蔡县','3','0'), ('1404','165','郾城区','3','0'), ('1405','165','源汇区','3','0'), ('1406','165','召陵区','3','0'), ('1407','165','舞阳县','3','0'), ('1408','165','临颍县','3','0'), ('1409','166','华龙区','3','0'), ('1410','166','清丰县','3','0'), ('1411','166','南乐县','3','0'), ('1412','166','范县','3','0'), ('1413','166','台前县','3','0'), ('1414','166','濮阳县','3','0'), ('1415','167','道里区','3','0'), ('1416','167','南岗区','3','0'), ('1417','167','动力区','3','0'), ('1418','167','平房区','3','0'), ('1419','167','香坊区','3','0'), ('1420','167','太平区','3','0'), ('1421','167','道外区','3','0'), ('1422','167','阿城区','3','0'), ('1423','167','呼兰区','3','0'), ('1424','167','松北区','3','0'), ('1425','167','尚志市','3','0'), ('1426','167','双城市','3','0'), ('1427','167','五常市','3','0'), ('1428','167','方正县','3','0'), ('1429','167','宾县','3','0'), ('1430','167','依兰县','3','0'), ('1431','167','巴彦县','3','0'), ('1432','167','通河县','3','0'), ('1433','167','木兰县','3','0'), ('1434','167','延寿县','3','0'), ('1435','168','萨尔图区','3','0'), ('1436','168','红岗区','3','0'), ('1437','168','龙凤区','3','0'), ('1438','168','让胡路区','3','0'), ('1439','168','大同区','3','0'), ('1440','168','肇州县','3','0'), ('1441','168','肇源县','3','0'), ('1442','168','林甸县','3','0'), ('1443','168','杜尔伯特','3','0'), ('1444','169','呼玛县','3','0'), ('1445','169','漠河县','3','0'), ('1446','169','塔河县','3','0'), ('1447','170','兴山区','3','0'), ('1448','170','工农区','3','0'), ('1449','170','南山区','3','0'), ('1450','170','兴安区','3','0'), ('1451','170','向阳区','3','0'), ('1452','170','东山区','3','0'), ('1453','170','萝北县','3','0'), ('1454','170','绥滨县','3','0'), ('1455','171','爱辉区','3','0'), ('1456','171','五大连池市','3','0'), ('1457','171','北安市','3','0'), ('1458','171','嫩江县','3','0'), ('1459','171','逊克县','3','0'), ('1460','171','孙吴县','3','0'), ('1461','172','鸡冠区','3','0'), ('1462','172','恒山区','3','0'), ('1463','172','城子河区','3','0'), ('1464','172','滴道区','3','0'), ('1465','172','梨树区','3','0'), ('1466','172','虎林市','3','0'), ('1467','172','密山市','3','0'), ('1468','172','鸡东县','3','0'), ('1469','173','前进区','3','0'), ('1470','173','郊区','3','0'), ('1471','173','向阳区','3','0'), ('1472','173','东风区','3','0'), ('1473','173','同江市','3','0'), ('1474','173','富锦市','3','0'), ('1475','173','桦南县','3','0'), ('1476','173','桦川县','3','0'), ('1477','173','汤原县','3','0'), ('1478','173','抚远县','3','0'), ('1479','174','爱民区','3','0'), ('1480','174','东安区','3','0'), ('1481','174','阳明区','3','0'), ('1482','174','西安区','3','0'), ('1483','174','绥芬河市','3','0'), ('1484','174','海林市','3','0'), ('1485','174','宁安市','3','0'), ('1486','174','穆棱市','3','0'), ('1487','174','东宁县','3','0'), ('1488','174','林口县','3','0'), ('1489','175','桃山区','3','0'), ('1490','175','新兴区','3','0'), ('1491','175','茄子河区','3','0'), ('1492','175','勃利县','3','0'), ('1493','176','龙沙区','3','0'), ('1494','176','昂昂溪区','3','0'), ('1495','176','铁峰区','3','0'), ('1496','176','建华区','3','0'), ('1497','176','富拉尔基区','3','0'), ('1498','176','碾子山区','3','0'), ('1499','176','梅里斯达斡尔区','3','0'), ('1500','176','讷河市','3','0');
INSERT INTO `abs_region` VALUES ('1501','176','龙江县','3','0'), ('1502','176','依安县','3','0'), ('1503','176','泰来县','3','0'), ('1504','176','甘南县','3','0'), ('1505','176','富裕县','3','0'), ('1506','176','克山县','3','0'), ('1507','176','克东县','3','0'), ('1508','176','拜泉县','3','0'), ('1509','177','尖山区','3','0'), ('1510','177','岭东区','3','0'), ('1511','177','四方台区','3','0'), ('1512','177','宝山区','3','0'), ('1513','177','集贤县','3','0'), ('1514','177','友谊县','3','0'), ('1515','177','宝清县','3','0'), ('1516','177','饶河县','3','0'), ('1517','178','北林区','3','0'), ('1518','178','安达市','3','0'), ('1519','178','肇东市','3','0'), ('1520','178','海伦市','3','0'), ('1521','178','望奎县','3','0'), ('1522','178','兰西县','3','0'), ('1523','178','青冈县','3','0'), ('1524','178','庆安县','3','0'), ('1525','178','明水县','3','0'), ('1526','178','绥棱县','3','0'), ('1527','179','伊春区','3','0'), ('1528','179','带岭区','3','0'), ('1529','179','南岔区','3','0'), ('1530','179','金山屯区','3','0'), ('1531','179','西林区','3','0'), ('1532','179','美溪区','3','0'), ('1533','179','乌马河区','3','0'), ('1534','179','翠峦区','3','0'), ('1535','179','友好区','3','0'), ('1536','179','上甘岭区','3','0'), ('1537','179','五营区','3','0'), ('1538','179','红星区','3','0'), ('1539','179','新青区','3','0'), ('1540','179','汤旺河区','3','0'), ('1541','179','乌伊岭区','3','0'), ('1542','179','铁力市','3','0'), ('1543','179','嘉荫县','3','0'), ('1544','180','江岸区','3','0'), ('1545','180','武昌区','3','0'), ('1546','180','江汉区','3','0'), ('1547','180','硚口区','3','0'), ('1548','180','汉阳区','3','0'), ('1549','180','青山区','3','0'), ('1550','180','洪山区','3','0'), ('1551','180','东西湖区','3','0'), ('1552','180','汉南区','3','0'), ('1553','180','蔡甸区','3','0'), ('1554','180','江夏区','3','0'), ('1555','180','黄陂区','3','0'), ('1556','180','新洲区','3','0'), ('1557','180','经济开发区','3','0'), ('1558','181','仙桃市','3','0'), ('1559','182','鄂城区','3','0'), ('1560','182','华容区','3','0'), ('1561','182','梁子湖区','3','0'), ('1562','183','黄州区','3','0'), ('1563','183','麻城市','3','0'), ('1564','183','武穴市','3','0'), ('1565','183','团风县','3','0'), ('1566','183','红安县','3','0'), ('1567','183','罗田县','3','0'), ('1568','183','英山县','3','0'), ('1569','183','浠水县','3','0'), ('1570','183','蕲春县','3','0'), ('1571','183','黄梅县','3','0'), ('1572','184','黄石港区','3','0'), ('1573','184','西塞山区','3','0'), ('1574','184','下陆区','3','0'), ('1575','184','铁山区','3','0'), ('1576','184','大冶市','3','0'), ('1577','184','阳新县','3','0'), ('1578','185','东宝区','3','0'), ('1579','185','掇刀区','3','0'), ('1580','185','钟祥市','3','0'), ('1581','185','京山县','3','0'), ('1582','185','沙洋县','3','0'), ('1583','186','沙市区','3','0'), ('1584','186','荆州区','3','0'), ('1585','186','石首市','3','0'), ('1586','186','洪湖市','3','0'), ('1587','186','松滋市','3','0'), ('1588','186','公安县','3','0'), ('1589','186','监利县','3','0'), ('1590','186','江陵县','3','0'), ('1591','187','潜江市','3','0'), ('1592','188','神农架林区','3','0'), ('1593','189','张湾区','3','0'), ('1594','189','茅箭区','3','0'), ('1595','189','丹江口市','3','0'), ('1596','189','郧县','3','0'), ('1597','189','郧西县','3','0'), ('1598','189','竹山县','3','0'), ('1599','189','竹溪县','3','0'), ('1600','189','房县','3','0');
INSERT INTO `abs_region` VALUES ('1601','190','曾都区','3','0'), ('1602','190','广水市','3','0'), ('1603','191','天门市','3','0'), ('1604','192','咸安区','3','0'), ('1605','192','赤壁市','3','0'), ('1606','192','嘉鱼县','3','0'), ('1607','192','通城县','3','0'), ('1608','192','崇阳县','3','0'), ('1609','192','通山县','3','0'), ('1610','193','襄城区','3','0'), ('1611','193','樊城区','3','0'), ('1612','193','襄阳区','3','0'), ('1613','193','老河口市','3','0'), ('1614','193','枣阳市','3','0'), ('1615','193','宜城市','3','0'), ('1616','193','南漳县','3','0'), ('1617','193','谷城县','3','0'), ('1618','193','保康县','3','0'), ('1619','194','孝南区','3','0'), ('1620','194','应城市','3','0'), ('1621','194','安陆市','3','0'), ('1622','194','汉川市','3','0'), ('1623','194','孝昌县','3','0'), ('1624','194','大悟县','3','0'), ('1625','194','云梦县','3','0'), ('1626','195','长阳','3','0'), ('1627','195','五峰','3','0'), ('1628','195','西陵区','3','0'), ('1629','195','伍家岗区','3','0'), ('1630','195','点军区','3','0'), ('1631','195','猇亭区','3','0'), ('1632','195','夷陵区','3','0'), ('1633','195','宜都市','3','0'), ('1634','195','当阳市','3','0'), ('1635','195','枝江市','3','0'), ('1636','195','远安县','3','0'), ('1637','195','兴山县','3','0'), ('1638','195','秭归县','3','0'), ('1639','196','恩施市','3','0'), ('1640','196','利川市','3','0'), ('1641','196','建始县','3','0'), ('1642','196','巴东县','3','0'), ('1643','196','宣恩县','3','0'), ('1644','196','咸丰县','3','0'), ('1645','196','来凤县','3','0'), ('1646','196','鹤峰县','3','0'), ('1647','197','岳麓区','3','0'), ('1648','197','芙蓉区','3','0'), ('1649','197','天心区','3','0'), ('1650','197','开福区','3','0'), ('1651','197','雨花区','3','0'), ('1652','197','开发区','3','0'), ('1653','197','浏阳市','3','0'), ('1654','197','长沙县','3','0'), ('1655','197','望城县','3','0'), ('1656','197','宁乡县','3','0'), ('1657','198','永定区','3','0'), ('1658','198','武陵源区','3','0'), ('1659','198','慈利县','3','0'), ('1660','198','桑植县','3','0'), ('1661','199','武陵区','3','0'), ('1662','199','鼎城区','3','0'), ('1663','199','津市市','3','0'), ('1664','199','安乡县','3','0'), ('1665','199','汉寿县','3','0'), ('1666','199','澧县','3','0'), ('1667','199','临澧县','3','0'), ('1668','199','桃源县','3','0'), ('1669','199','石门县','3','0'), ('1670','200','北湖区','3','0'), ('1671','200','苏仙区','3','0'), ('1672','200','资兴市','3','0'), ('1673','200','桂阳县','3','0'), ('1674','200','宜章县','3','0'), ('1675','200','永兴县','3','0'), ('1676','200','嘉禾县','3','0'), ('1677','200','临武县','3','0'), ('1678','200','汝城县','3','0'), ('1679','200','桂东县','3','0'), ('1680','200','安仁县','3','0'), ('1681','201','雁峰区','3','0'), ('1682','201','珠晖区','3','0'), ('1683','201','石鼓区','3','0'), ('1684','201','蒸湘区','3','0'), ('1685','201','南岳区','3','0'), ('1686','201','耒阳市','3','0'), ('1687','201','常宁市','3','0'), ('1688','201','衡阳县','3','0'), ('1689','201','衡南县','3','0'), ('1690','201','衡山县','3','0'), ('1691','201','衡东县','3','0'), ('1692','201','祁东县','3','0'), ('1693','202','鹤城区','3','0'), ('1694','202','靖州','3','0'), ('1695','202','麻阳','3','0'), ('1696','202','通道','3','0'), ('1697','202','新晃','3','0'), ('1698','202','芷江','3','0'), ('1699','202','沅陵县','3','0'), ('1700','202','辰溪县','3','0');
INSERT INTO `abs_region` VALUES ('1701','202','溆浦县','3','0'), ('1702','202','中方县','3','0'), ('1703','202','会同县','3','0'), ('1704','202','洪江市','3','0'), ('1705','203','娄星区','3','0'), ('1706','203','冷水江市','3','0'), ('1707','203','涟源市','3','0'), ('1708','203','双峰县','3','0'), ('1709','203','新化县','3','0'), ('1710','204','城步','3','0'), ('1711','204','双清区','3','0'), ('1712','204','大祥区','3','0'), ('1713','204','北塔区','3','0'), ('1714','204','武冈市','3','0'), ('1715','204','邵东县','3','0'), ('1716','204','新邵县','3','0'), ('1717','204','邵阳县','3','0'), ('1718','204','隆回县','3','0'), ('1719','204','洞口县','3','0'), ('1720','204','绥宁县','3','0'), ('1721','204','新宁县','3','0'), ('1722','205','岳塘区','3','0'), ('1723','205','雨湖区','3','0'), ('1724','205','湘乡市','3','0'), ('1725','205','韶山市','3','0'), ('1726','205','湘潭县','3','0'), ('1727','206','吉首市','3','0'), ('1728','206','泸溪县','3','0'), ('1729','206','凤凰县','3','0'), ('1730','206','花垣县','3','0'), ('1731','206','保靖县','3','0'), ('1732','206','古丈县','3','0'), ('1733','206','永顺县','3','0'), ('1734','206','龙山县','3','0'), ('1735','207','赫山区','3','0'), ('1736','207','资阳区','3','0'), ('1737','207','沅江市','3','0'), ('1738','207','南县','3','0'), ('1739','207','桃江县','3','0'), ('1740','207','安化县','3','0'), ('1741','208','江华','3','0'), ('1742','208','冷水滩区','3','0'), ('1743','208','零陵区','3','0'), ('1744','208','祁阳县','3','0'), ('1745','208','东安县','3','0'), ('1746','208','双牌县','3','0'), ('1747','208','道县','3','0'), ('1748','208','江永县','3','0'), ('1749','208','宁远县','3','0'), ('1750','208','蓝山县','3','0'), ('1751','208','新田县','3','0'), ('1752','209','岳阳楼区','3','0'), ('1753','209','君山区','3','0'), ('1754','209','云溪区','3','0'), ('1755','209','汨罗市','3','0'), ('1756','209','临湘市','3','0'), ('1757','209','岳阳县','3','0'), ('1758','209','华容县','3','0'), ('1759','209','湘阴县','3','0'), ('1760','209','平江县','3','0'), ('1761','210','天元区','3','0'), ('1762','210','荷塘区','3','0'), ('1763','210','芦淞区','3','0'), ('1764','210','石峰区','3','0'), ('1765','210','醴陵市','3','0'), ('1766','210','株洲县','3','0'), ('1767','210','攸县','3','0'), ('1768','210','茶陵县','3','0'), ('1769','210','炎陵县','3','0'), ('1770','211','朝阳区','3','0'), ('1771','211','宽城区','3','0'), ('1772','211','二道区','3','0'), ('1773','211','南关区','3','0'), ('1774','211','绿园区','3','0'), ('1775','211','双阳区','3','0'), ('1776','211','净月潭开发区','3','0'), ('1777','211','高新技术开发区','3','0'), ('1778','211','经济技术开发区','3','0'), ('1779','211','汽车产业开发区','3','0'), ('1780','211','德惠市','3','0'), ('1781','211','九台市','3','0'), ('1782','211','榆树市','3','0'), ('1783','211','农安县','3','0'), ('1784','212','船营区','3','0'), ('1785','212','昌邑区','3','0'), ('1786','212','龙潭区','3','0'), ('1787','212','丰满区','3','0'), ('1788','212','蛟河市','3','0'), ('1789','212','桦甸市','3','0'), ('1790','212','舒兰市','3','0'), ('1791','212','磐石市','3','0'), ('1792','212','永吉县','3','0'), ('1793','213','洮北区','3','0'), ('1794','213','洮南市','3','0'), ('1795','213','大安市','3','0'), ('1796','213','镇赉县','3','0'), ('1797','213','通榆县','3','0'), ('1798','214','江源区','3','0'), ('1799','214','八道江区','3','0'), ('1800','214','长白','3','0');
INSERT INTO `abs_region` VALUES ('1801','214','临江市','3','0'), ('1802','214','抚松县','3','0'), ('1803','214','靖宇县','3','0'), ('1804','215','龙山区','3','0'), ('1805','215','西安区','3','0'), ('1806','215','东丰县','3','0'), ('1807','215','东辽县','3','0'), ('1808','216','铁西区','3','0'), ('1809','216','铁东区','3','0'), ('1810','216','伊通','3','0'), ('1811','216','公主岭市','3','0'), ('1812','216','双辽市','3','0'), ('1813','216','梨树县','3','0'), ('1814','217','前郭尔罗斯','3','0'), ('1815','217','宁江区','3','0'), ('1816','217','长岭县','3','0'), ('1817','217','乾安县','3','0'), ('1818','217','扶余县','3','0'), ('1819','218','东昌区','3','0'), ('1820','218','二道江区','3','0'), ('1821','218','梅河口市','3','0'), ('1822','218','集安市','3','0'), ('1823','218','通化县','3','0'), ('1824','218','辉南县','3','0'), ('1825','218','柳河县','3','0'), ('1826','219','延吉市','3','0'), ('1827','219','图们市','3','0'), ('1828','219','敦化市','3','0'), ('1829','219','珲春市','3','0'), ('1830','219','龙井市','3','0'), ('1831','219','和龙市','3','0'), ('1832','219','安图县','3','0'), ('1833','219','汪清县','3','0'), ('1834','220','玄武区','3','0'), ('1835','220','鼓楼区','3','0'), ('1836','220','白下区','3','0'), ('1837','220','建邺区','3','0'), ('1838','220','秦淮区','3','0'), ('1839','220','雨花台区','3','0'), ('1840','220','下关区','3','0'), ('1841','220','栖霞区','3','0'), ('1842','220','浦口区','3','0'), ('1843','220','江宁区','3','0'), ('1844','220','六合区','3','0'), ('1845','220','溧水县','3','0'), ('1846','220','高淳县','3','0'), ('1847','221','沧浪区','3','0'), ('1848','221','金阊区','3','0'), ('1849','221','平江区','3','0'), ('1850','221','虎丘区','3','0'), ('1851','221','吴中区','3','0'), ('1852','221','相城区','3','0'), ('1853','221','园区','3','0'), ('1854','221','新区','3','0'), ('1855','221','常熟市','3','0'), ('1856','221','张家港市','3','0'), ('1857','221','玉山镇','3','0'), ('1858','221','巴城镇','3','0'), ('1859','221','周市镇','3','0'), ('1860','221','陆家镇','3','0'), ('1861','221','花桥镇','3','0'), ('1862','221','淀山湖镇','3','0'), ('1863','221','张浦镇','3','0'), ('1864','221','周庄镇','3','0'), ('1865','221','千灯镇','3','0'), ('1866','221','锦溪镇','3','0'), ('1867','221','开发区','3','0'), ('1868','221','吴江市','3','0'), ('1869','221','太仓市','3','0'), ('1870','222','崇安区','3','0'), ('1871','222','北塘区','3','0'), ('1872','222','南长区','3','0'), ('1873','222','锡山区','3','0'), ('1874','222','惠山区','3','0'), ('1875','222','滨湖区','3','0'), ('1876','222','新区','3','0'), ('1877','222','江阴市','3','0'), ('1878','222','宜兴市','3','0'), ('1879','223','天宁区','3','0'), ('1880','223','钟楼区','3','0'), ('1881','223','戚墅堰区','3','0'), ('1882','223','郊区','3','0'), ('1883','223','新北区','3','0'), ('1884','223','武进区','3','0'), ('1885','223','溧阳市','3','0'), ('1886','223','金坛市','3','0'), ('1887','224','清河区','3','0'), ('1888','224','清浦区','3','0'), ('1889','224','楚州区','3','0'), ('1890','224','淮阴区','3','0'), ('1891','224','涟水县','3','0'), ('1892','224','洪泽县','3','0'), ('1893','224','盱眙县','3','0'), ('1894','224','金湖县','3','0'), ('1895','225','新浦区','3','0'), ('1896','225','连云区','3','0'), ('1897','225','海州区','3','0'), ('1898','225','赣榆县','3','0'), ('1899','225','东海县','3','0'), ('1900','225','灌云县','3','0');
INSERT INTO `abs_region` VALUES ('1901','225','灌南县','3','0'), ('1902','226','崇川区','3','0'), ('1903','226','港闸区','3','0'), ('1904','226','经济开发区','3','0'), ('1905','226','启东市','3','0'), ('1906','226','如皋市','3','0'), ('1907','226','通州市','3','0'), ('1908','226','海门市','3','0'), ('1909','226','海安县','3','0'), ('1910','226','如东县','3','0'), ('1911','227','宿城区','3','0'), ('1912','227','宿豫区','3','0'), ('1913','227','宿豫县','3','0'), ('1914','227','沭阳县','3','0'), ('1915','227','泗阳县','3','0'), ('1916','227','泗洪县','3','0'), ('1917','228','海陵区','3','0'), ('1918','228','高港区','3','0'), ('1919','228','兴化市','3','0'), ('1920','228','靖江市','3','0'), ('1921','228','泰兴市','3','0'), ('1922','228','姜堰市','3','0'), ('1923','229','云龙区','3','0'), ('1924','229','鼓楼区','3','0'), ('1925','229','九里区','3','0'), ('1926','229','贾汪区','3','0'), ('1927','229','泉山区','3','0'), ('1928','229','新沂市','3','0'), ('1929','229','邳州市','3','0'), ('1930','229','丰县','3','0'), ('1931','229','沛县','3','0'), ('1932','229','铜山县','3','0'), ('1933','229','睢宁县','3','0'), ('1934','230','城区','3','0'), ('1935','230','亭湖区','3','0'), ('1936','230','盐都区','3','0'), ('1937','230','盐都县','3','0'), ('1938','230','东台市','3','0'), ('1939','230','大丰市','3','0'), ('1940','230','响水县','3','0'), ('1941','230','滨海县','3','0'), ('1942','230','阜宁县','3','0'), ('1943','230','射阳县','3','0'), ('1944','230','建湖县','3','0'), ('1945','231','广陵区','3','0'), ('1946','231','维扬区','3','0'), ('1947','231','邗江区','3','0'), ('1948','231','仪征市','3','0'), ('1949','231','高邮市','3','0'), ('1950','231','江都市','3','0'), ('1951','231','宝应县','3','0'), ('1952','232','京口区','3','0'), ('1953','232','润州区','3','0'), ('1954','232','丹徒区','3','0'), ('1955','232','丹阳市','3','0'), ('1956','232','扬中市','3','0'), ('1957','232','句容市','3','0'), ('1958','233','东湖区','3','0'), ('1959','233','西湖区','3','0'), ('1960','233','青云谱区','3','0'), ('1961','233','湾里区','3','0'), ('1962','233','青山湖区','3','0'), ('1963','233','红谷滩新区','3','0'), ('1964','233','昌北区','3','0'), ('1965','233','高新区','3','0'), ('1966','233','南昌县','3','0'), ('1967','233','新建县','3','0'), ('1968','233','安义县','3','0'), ('1969','233','进贤县','3','0'), ('1970','234','临川区','3','0'), ('1971','234','南城县','3','0'), ('1972','234','黎川县','3','0'), ('1973','234','南丰县','3','0'), ('1974','234','崇仁县','3','0'), ('1975','234','乐安县','3','0'), ('1976','234','宜黄县','3','0'), ('1977','234','金溪县','3','0'), ('1978','234','资溪县','3','0'), ('1979','234','东乡县','3','0'), ('1980','234','广昌县','3','0'), ('1981','235','章贡区','3','0'), ('1982','235','于都县','3','0'), ('1983','235','瑞金市','3','0'), ('1984','235','南康市','3','0'), ('1985','235','赣县','3','0'), ('1986','235','信丰县','3','0'), ('1987','235','大余县','3','0'), ('1988','235','上犹县','3','0'), ('1989','235','崇义县','3','0'), ('1990','235','安远县','3','0'), ('1991','235','龙南县','3','0'), ('1992','235','定南县','3','0'), ('1993','235','全南县','3','0'), ('1994','235','宁都县','3','0'), ('1995','235','兴国县','3','0'), ('1996','235','会昌县','3','0'), ('1997','235','寻乌县','3','0'), ('1998','235','石城县','3','0'), ('1999','236','安福县','3','0'), ('2000','236','吉州区','3','0');
INSERT INTO `abs_region` VALUES ('2001','236','青原区','3','0'), ('2002','236','井冈山市','3','0'), ('2003','236','吉安县','3','0'), ('2004','236','吉水县','3','0'), ('2005','236','峡江县','3','0'), ('2006','236','新干县','3','0'), ('2007','236','永丰县','3','0'), ('2008','236','泰和县','3','0'), ('2009','236','遂川县','3','0'), ('2010','236','万安县','3','0'), ('2011','236','永新县','3','0'), ('2012','237','珠山区','3','0'), ('2013','237','昌江区','3','0'), ('2014','237','乐平市','3','0'), ('2015','237','浮梁县','3','0'), ('2016','238','浔阳区','3','0'), ('2017','238','庐山区','3','0'), ('2018','238','瑞昌市','3','0'), ('2019','238','九江县','3','0'), ('2020','238','武宁县','3','0'), ('2021','238','修水县','3','0'), ('2022','238','永修县','3','0'), ('2023','238','德安县','3','0'), ('2024','238','星子县','3','0'), ('2025','238','都昌县','3','0'), ('2026','238','湖口县','3','0'), ('2027','238','彭泽县','3','0'), ('2028','239','安源区','3','0'), ('2029','239','湘东区','3','0'), ('2030','239','莲花县','3','0'), ('2031','239','芦溪县','3','0'), ('2032','239','上栗县','3','0'), ('2033','240','信州区','3','0'), ('2034','240','德兴市','3','0'), ('2035','240','上饶县','3','0'), ('2036','240','广丰县','3','0'), ('2037','240','玉山县','3','0'), ('2038','240','铅山县','3','0'), ('2039','240','横峰县','3','0'), ('2040','240','弋阳县','3','0'), ('2041','240','余干县','3','0'), ('2042','240','波阳县','3','0'), ('2043','240','万年县','3','0'), ('2044','240','婺源县','3','0'), ('2045','241','渝水区','3','0'), ('2046','241','分宜县','3','0'), ('2047','242','袁州区','3','0'), ('2048','242','丰城市','3','0'), ('2049','242','樟树市','3','0'), ('2050','242','高安市','3','0'), ('2051','242','奉新县','3','0'), ('2052','242','万载县','3','0'), ('2053','242','上高县','3','0'), ('2054','242','宜丰县','3','0'), ('2055','242','靖安县','3','0'), ('2056','242','铜鼓县','3','0'), ('2057','243','月湖区','3','0'), ('2058','243','贵溪市','3','0'), ('2059','243','余江县','3','0'), ('2060','244','沈河区','3','0'), ('2061','244','皇姑区','3','0'), ('2062','244','和平区','3','0'), ('2063','244','大东区','3','0'), ('2064','244','铁西区','3','0'), ('2065','244','苏家屯区','3','0'), ('2066','244','东陵区','3','0'), ('2067','244','沈北新区','3','0'), ('2068','244','于洪区','3','0'), ('2069','244','浑南新区','3','0'), ('2070','244','新民市','3','0'), ('2071','244','辽中县','3','0'), ('2072','244','康平县','3','0'), ('2073','244','法库县','3','0'), ('2074','245','西岗区','3','0'), ('2075','245','中山区','3','0'), ('2076','245','沙河口区','3','0'), ('2077','245','甘井子区','3','0'), ('2078','245','旅顺口区','3','0'), ('2079','245','金州区','3','0'), ('2080','245','开发区','3','0'), ('2081','245','瓦房店市','3','0'), ('2082','245','普兰店市','3','0'), ('2083','245','庄河市','3','0'), ('2084','245','长海县','3','0'), ('2085','246','铁东区','3','0'), ('2086','246','铁西区','3','0'), ('2087','246','立山区','3','0'), ('2088','246','千山区','3','0'), ('2089','246','岫岩','3','0'), ('2090','246','海城市','3','0'), ('2091','246','台安县','3','0'), ('2092','247','本溪','3','0'), ('2093','247','平山区','3','0'), ('2094','247','明山区','3','0'), ('2095','247','溪湖区','3','0'), ('2096','247','南芬区','3','0'), ('2097','247','桓仁','3','0'), ('2098','248','双塔区','3','0'), ('2099','248','龙城区','3','0'), ('2100','248','喀喇沁左翼蒙古族自治县','3','0');
INSERT INTO `abs_region` VALUES ('2101','248','北票市','3','0'), ('2102','248','凌源市','3','0'), ('2103','248','朝阳县','3','0'), ('2104','248','建平县','3','0'), ('2105','249','振兴区','3','0'), ('2106','249','元宝区','3','0'), ('2107','249','振安区','3','0'), ('2108','249','宽甸','3','0'), ('2109','249','东港市','3','0'), ('2110','249','凤城市','3','0'), ('2111','250','顺城区','3','0'), ('2112','250','新抚区','3','0'), ('2113','250','东洲区','3','0'), ('2114','250','望花区','3','0'), ('2115','250','清原','3','0'), ('2116','250','新宾','3','0'), ('2117','250','抚顺县','3','0'), ('2118','251','阜新','3','0'), ('2119','251','海州区','3','0'), ('2120','251','新邱区','3','0'), ('2121','251','太平区','3','0'), ('2122','251','清河门区','3','0'), ('2123','251','细河区','3','0'), ('2124','251','彰武县','3','0'), ('2125','252','龙港区','3','0'), ('2126','252','南票区','3','0'), ('2127','252','连山区','3','0'), ('2128','252','兴城市','3','0'), ('2129','252','绥中县','3','0'), ('2130','252','建昌县','3','0'), ('2131','253','太和区','3','0'), ('2132','253','古塔区','3','0'), ('2133','253','凌河区','3','0'), ('2134','253','凌海市','3','0'), ('2135','253','北镇市','3','0'), ('2136','253','黑山县','3','0'), ('2137','253','义县','3','0'), ('2138','254','白塔区','3','0'), ('2139','254','文圣区','3','0'), ('2140','254','宏伟区','3','0'), ('2141','254','太子河区','3','0'), ('2142','254','弓长岭区','3','0'), ('2143','254','灯塔市','3','0'), ('2144','254','辽阳县','3','0'), ('2145','255','双台子区','3','0'), ('2146','255','兴隆台区','3','0'), ('2147','255','大洼县','3','0'), ('2148','255','盘山县','3','0'), ('2149','256','银州区','3','0'), ('2150','256','清河区','3','0'), ('2151','256','调兵山市','3','0'), ('2152','256','开原市','3','0'), ('2153','256','铁岭县','3','0'), ('2154','256','西丰县','3','0'), ('2155','256','昌图县','3','0'), ('2156','257','站前区','3','0'), ('2157','257','西市区','3','0'), ('2158','257','鲅鱼圈区','3','0'), ('2159','257','老边区','3','0'), ('2160','257','盖州市','3','0'), ('2161','257','大石桥市','3','0'), ('2162','258','回民区','3','0'), ('2163','258','玉泉区','3','0'), ('2164','258','新城区','3','0'), ('2165','258','赛罕区','3','0'), ('2166','258','清水河县','3','0'), ('2167','258','土默特左旗','3','0'), ('2168','258','托克托县','3','0'), ('2169','258','和林格尔县','3','0'), ('2170','258','武川县','3','0'), ('2171','259','阿拉善左旗','3','0'), ('2172','259','阿拉善右旗','3','0'), ('2173','259','额济纳旗','3','0'), ('2174','260','临河区','3','0'), ('2175','260','五原县','3','0'), ('2176','260','磴口县','3','0'), ('2177','260','乌拉特前旗','3','0'), ('2178','260','乌拉特中旗','3','0'), ('2179','260','乌拉特后旗','3','0'), ('2180','260','杭锦后旗','3','0'), ('2181','261','昆都仑区','3','0'), ('2182','261','青山区','3','0'), ('2183','261','东河区','3','0'), ('2184','261','九原区','3','0'), ('2185','261','石拐区','3','0'), ('2186','261','白云矿区','3','0'), ('2187','261','土默特右旗','3','0'), ('2188','261','固阳县','3','0'), ('2189','261','达尔罕茂明安联合旗','3','0'), ('2190','262','红山区','3','0'), ('2191','262','元宝山区','3','0'), ('2192','262','松山区','3','0'), ('2193','262','阿鲁科尔沁旗','3','0'), ('2194','262','巴林左旗','3','0'), ('2195','262','巴林右旗','3','0'), ('2196','262','林西县','3','0'), ('2197','262','克什克腾旗','3','0'), ('2198','262','翁牛特旗','3','0'), ('2199','262','喀喇沁旗','3','0'), ('2200','262','宁城县','3','0');
INSERT INTO `abs_region` VALUES ('2201','262','敖汉旗','3','0'), ('2202','263','东胜区','3','0'), ('2203','263','达拉特旗','3','0'), ('2204','263','准格尔旗','3','0'), ('2205','263','鄂托克前旗','3','0'), ('2206','263','鄂托克旗','3','0'), ('2207','263','杭锦旗','3','0'), ('2208','263','乌审旗','3','0'), ('2209','263','伊金霍洛旗','3','0'), ('2210','264','海拉尔区','3','0'), ('2211','264','莫力达瓦','3','0'), ('2212','264','满洲里市','3','0'), ('2213','264','牙克石市','3','0'), ('2214','264','扎兰屯市','3','0'), ('2215','264','额尔古纳市','3','0'), ('2216','264','根河市','3','0'), ('2217','264','阿荣旗','3','0'), ('2218','264','鄂伦春自治旗','3','0'), ('2219','264','鄂温克族自治旗','3','0'), ('2220','264','陈巴尔虎旗','3','0'), ('2221','264','新巴尔虎左旗','3','0'), ('2222','264','新巴尔虎右旗','3','0'), ('2223','265','科尔沁区','3','0'), ('2224','265','霍林郭勒市','3','0'), ('2225','265','科尔沁左翼中旗','3','0'), ('2226','265','科尔沁左翼后旗','3','0'), ('2227','265','开鲁县','3','0'), ('2228','265','库伦旗','3','0'), ('2229','265','奈曼旗','3','0'), ('2230','265','扎鲁特旗','3','0'), ('2231','266','海勃湾区','3','0'), ('2232','266','乌达区','3','0'), ('2233','266','海南区','3','0'), ('2234','267','化德县','3','0'), ('2235','267','集宁区','3','0'), ('2236','267','丰镇市','3','0'), ('2237','267','卓资县','3','0'), ('2238','267','商都县','3','0'), ('2239','267','兴和县','3','0'), ('2240','267','凉城县','3','0'), ('2241','267','察哈尔右翼前旗','3','0'), ('2242','267','察哈尔右翼中旗','3','0'), ('2243','267','察哈尔右翼后旗','3','0'), ('2244','267','四子王旗','3','0'), ('2245','268','二连浩特市','3','0'), ('2246','268','锡林浩特市','3','0'), ('2247','268','阿巴嘎旗','3','0'), ('2248','268','苏尼特左旗','3','0'), ('2249','268','苏尼特右旗','3','0'), ('2250','268','东乌珠穆沁旗','3','0'), ('2251','268','西乌珠穆沁旗','3','0'), ('2252','268','太仆寺旗','3','0'), ('2253','268','镶黄旗','3','0'), ('2254','268','正镶白旗','3','0'), ('2255','268','正蓝旗','3','0'), ('2256','268','多伦县','3','0'), ('2257','269','乌兰浩特市','3','0'), ('2258','269','阿尔山市','3','0'), ('2259','269','科尔沁右翼前旗','3','0'), ('2260','269','科尔沁右翼中旗','3','0'), ('2261','269','扎赉特旗','3','0'), ('2262','269','突泉县','3','0'), ('2263','270','西夏区','3','0'), ('2264','270','金凤区','3','0'), ('2265','270','兴庆区','3','0'), ('2266','270','灵武市','3','0'), ('2267','270','永宁县','3','0'), ('2268','270','贺兰县','3','0'), ('2269','271','原州区','3','0'), ('2270','271','海原县','3','0'), ('2271','271','西吉县','3','0'), ('2272','271','隆德县','3','0'), ('2273','271','泾源县','3','0'), ('2274','271','彭阳县','3','0'), ('2275','272','惠农县','3','0'), ('2276','272','大武口区','3','0'), ('2277','272','惠农区','3','0'), ('2278','272','陶乐县','3','0'), ('2279','272','平罗县','3','0'), ('2280','273','利通区','3','0'), ('2281','273','中卫县','3','0'), ('2282','273','青铜峡市','3','0'), ('2283','273','中宁县','3','0'), ('2284','273','盐池县','3','0'), ('2285','273','同心县','3','0'), ('2286','274','沙坡头区','3','0'), ('2287','274','海原县','3','0'), ('2288','274','中宁县','3','0'), ('2289','275','城中区','3','0'), ('2290','275','城东区','3','0'), ('2291','275','城西区','3','0'), ('2292','275','城北区','3','0'), ('2293','275','湟中县','3','0'), ('2294','275','湟源县','3','0'), ('2295','275','大通','3','0'), ('2296','276','玛沁县','3','0'), ('2297','276','班玛县','3','0'), ('2298','276','甘德县','3','0'), ('2299','276','达日县','3','0'), ('2300','276','久治县','3','0');
INSERT INTO `abs_region` VALUES ('2301','276','玛多县','3','0'), ('2302','277','海晏县','3','0'), ('2303','277','祁连县','3','0'), ('2304','277','刚察县','3','0'), ('2305','277','门源','3','0'), ('2306','278','平安县','3','0'), ('2307','278','乐都县','3','0'), ('2308','278','民和','3','0'), ('2309','278','互助','3','0'), ('2310','278','化隆','3','0'), ('2311','278','循化','3','0'), ('2312','279','共和县','3','0'), ('2313','279','同德县','3','0'), ('2314','279','贵德县','3','0'), ('2315','279','兴海县','3','0'), ('2316','279','贵南县','3','0'), ('2317','280','德令哈市','3','0'), ('2318','280','格尔木市','3','0'), ('2319','280','乌兰县','3','0'), ('2320','280','都兰县','3','0'), ('2321','280','天峻县','3','0'), ('2322','281','同仁县','3','0'), ('2323','281','尖扎县','3','0'), ('2324','281','泽库县','3','0'), ('2325','281','河南蒙古族自治县','3','0'), ('2326','282','玉树县','3','0'), ('2327','282','杂多县','3','0'), ('2328','282','称多县','3','0'), ('2329','282','治多县','3','0'), ('2330','282','囊谦县','3','0'), ('2331','282','曲麻莱县','3','0'), ('2332','283','市中区','3','0'), ('2333','283','历下区','3','0'), ('2334','283','天桥区','3','0'), ('2335','283','槐荫区','3','0'), ('2336','283','历城区','3','0'), ('2337','283','长清区','3','0'), ('2338','283','章丘市','3','0'), ('2339','283','平阴县','3','0'), ('2340','283','济阳县','3','0'), ('2341','283','商河县','3','0'), ('2342','284','市南区','3','0'), ('2343','284','市北区','3','0'), ('2344','284','城阳区','3','0'), ('2345','284','四方区','3','0'), ('2346','284','李沧区','3','0'), ('2347','284','黄岛区','3','0'), ('2348','284','崂山区','3','0'), ('2349','284','胶州市','3','0'), ('2350','284','即墨市','3','0'), ('2351','284','平度市','3','0'), ('2352','284','胶南市','3','0'), ('2353','284','莱西市','3','0'), ('2354','285','滨城区','3','0'), ('2355','285','惠民县','3','0'), ('2356','285','阳信县','3','0'), ('2357','285','无棣县','3','0'), ('2358','285','沾化县','3','0'), ('2359','285','博兴县','3','0'), ('2360','285','邹平县','3','0'), ('2361','286','德城区','3','0'), ('2362','286','陵县','3','0'), ('2363','286','乐陵市','3','0'), ('2364','286','禹城市','3','0'), ('2365','286','宁津县','3','0'), ('2366','286','庆云县','3','0'), ('2367','286','临邑县','3','0'), ('2368','286','齐河县','3','0'), ('2369','286','平原县','3','0'), ('2370','286','夏津县','3','0'), ('2371','286','武城县','3','0'), ('2372','287','东营区','3','0'), ('2373','287','河口区','3','0'), ('2374','287','垦利县','3','0'), ('2375','287','利津县','3','0'), ('2376','287','广饶县','3','0'), ('2377','288','牡丹区','3','0'), ('2378','288','曹县','3','0'), ('2379','288','单县','3','0'), ('2380','288','成武县','3','0'), ('2381','288','巨野县','3','0'), ('2382','288','郓城县','3','0'), ('2383','288','鄄城县','3','0'), ('2384','288','定陶县','3','0'), ('2385','288','东明县','3','0'), ('2386','289','市中区','3','0'), ('2387','289','任城区','3','0'), ('2388','289','曲阜市','3','0'), ('2389','289','兖州市','3','0'), ('2390','289','邹城市','3','0'), ('2391','289','微山县','3','0'), ('2392','289','鱼台县','3','0'), ('2393','289','金乡县','3','0'), ('2394','289','嘉祥县','3','0'), ('2395','289','汶上县','3','0'), ('2396','289','泗水县','3','0'), ('2397','289','梁山县','3','0'), ('2398','290','莱城区','3','0'), ('2399','290','钢城区','3','0'), ('2400','291','东昌府区','3','0');
INSERT INTO `abs_region` VALUES ('2401','291','临清市','3','0'), ('2402','291','阳谷县','3','0'), ('2403','291','莘县','3','0'), ('2404','291','茌平县','3','0'), ('2405','291','东阿县','3','0'), ('2406','291','冠县','3','0'), ('2407','291','高唐县','3','0'), ('2408','292','兰山区','3','0'), ('2409','292','罗庄区','3','0'), ('2410','292','河东区','3','0'), ('2411','292','沂南县','3','0'), ('2412','292','郯城县','3','0'), ('2413','292','沂水县','3','0'), ('2414','292','苍山县','3','0'), ('2415','292','费县','3','0'), ('2416','292','平邑县','3','0'), ('2417','292','莒南县','3','0'), ('2418','292','蒙阴县','3','0'), ('2419','292','临沭县','3','0'), ('2420','293','东港区','3','0'), ('2421','293','岚山区','3','0'), ('2422','293','五莲县','3','0'), ('2423','293','莒县','3','0'), ('2424','294','泰山区','3','0'), ('2425','294','岱岳区','3','0'), ('2426','294','新泰市','3','0'), ('2427','294','肥城市','3','0'), ('2428','294','宁阳县','3','0'), ('2429','294','东平县','3','0'), ('2430','295','荣成市','3','0'), ('2431','295','乳山市','3','0'), ('2432','295','环翠区','3','0'), ('2433','295','文登市','3','0'), ('2434','296','潍城区','3','0'), ('2435','296','寒亭区','3','0'), ('2436','296','坊子区','3','0'), ('2437','296','奎文区','3','0'), ('2438','296','青州市','3','0'), ('2439','296','诸城市','3','0'), ('2440','296','寿光市','3','0'), ('2441','296','安丘市','3','0'), ('2442','296','高密市','3','0'), ('2443','296','昌邑市','3','0'), ('2444','296','临朐县','3','0'), ('2445','296','昌乐县','3','0'), ('2446','297','芝罘区','3','0'), ('2447','297','福山区','3','0'), ('2448','297','牟平区','3','0'), ('2449','297','莱山区','3','0'), ('2450','297','开发区','3','0'), ('2451','297','龙口市','3','0'), ('2452','297','莱阳市','3','0'), ('2453','297','莱州市','3','0'), ('2454','297','蓬莱市','3','0'), ('2455','297','招远市','3','0'), ('2456','297','栖霞市','3','0'), ('2457','297','海阳市','3','0'), ('2458','297','长岛县','3','0'), ('2459','298','市中区','3','0'), ('2460','298','山亭区','3','0'), ('2461','298','峄城区','3','0'), ('2462','298','台儿庄区','3','0'), ('2463','298','薛城区','3','0'), ('2464','298','滕州市','3','0'), ('2465','299','张店区','3','0'), ('2466','299','临淄区','3','0'), ('2467','299','淄川区','3','0'), ('2468','299','博山区','3','0'), ('2469','299','周村区','3','0'), ('2470','299','桓台县','3','0'), ('2471','299','高青县','3','0'), ('2472','299','沂源县','3','0'), ('2473','300','杏花岭区','3','0'), ('2474','300','小店区','3','0'), ('2475','300','迎泽区','3','0'), ('2476','300','尖草坪区','3','0'), ('2477','300','万柏林区','3','0'), ('2478','300','晋源区','3','0'), ('2479','300','高新开发区','3','0'), ('2480','300','民营经济开发区','3','0'), ('2481','300','经济技术开发区','3','0'), ('2482','300','清徐县','3','0'), ('2483','300','阳曲县','3','0'), ('2484','300','娄烦县','3','0'), ('2485','300','古交市','3','0'), ('2486','301','城区','3','0'), ('2487','301','郊区','3','0'), ('2488','301','沁县','3','0'), ('2489','301','潞城市','3','0'), ('2490','301','长治县','3','0'), ('2491','301','襄垣县','3','0'), ('2492','301','屯留县','3','0'), ('2493','301','平顺县','3','0'), ('2494','301','黎城县','3','0'), ('2495','301','壶关县','3','0'), ('2496','301','长子县','3','0'), ('2497','301','武乡县','3','0'), ('2498','301','沁源县','3','0'), ('2499','302','城区','3','0'), ('2500','302','矿区','3','0');
INSERT INTO `abs_region` VALUES ('2501','302','南郊区','3','0'), ('2502','302','新荣区','3','0'), ('2503','302','阳高县','3','0'), ('2504','302','天镇县','3','0'), ('2505','302','广灵县','3','0'), ('2506','302','灵丘县','3','0'), ('2507','302','浑源县','3','0'), ('2508','302','左云县','3','0'), ('2509','302','大同县','3','0'), ('2510','303','城区','3','0'), ('2511','303','高平市','3','0'), ('2512','303','沁水县','3','0'), ('2513','303','阳城县','3','0'), ('2514','303','陵川县','3','0'), ('2515','303','泽州县','3','0'), ('2516','304','榆次区','3','0'), ('2517','304','介休市','3','0'), ('2518','304','榆社县','3','0'), ('2519','304','左权县','3','0'), ('2520','304','和顺县','3','0'), ('2521','304','昔阳县','3','0'), ('2522','304','寿阳县','3','0'), ('2523','304','太谷县','3','0'), ('2524','304','祁县','3','0'), ('2525','304','平遥县','3','0'), ('2526','304','灵石县','3','0'), ('2527','305','尧都区','3','0'), ('2528','305','侯马市','3','0'), ('2529','305','霍州市','3','0'), ('2530','305','曲沃县','3','0'), ('2531','305','翼城县','3','0'), ('2532','305','襄汾县','3','0'), ('2533','305','洪洞县','3','0'), ('2534','305','吉县','3','0'), ('2535','305','安泽县','3','0'), ('2536','305','浮山县','3','0'), ('2537','305','古县','3','0'), ('2538','305','乡宁县','3','0'), ('2539','305','大宁县','3','0'), ('2540','305','隰县','3','0'), ('2541','305','永和县','3','0'), ('2542','305','蒲县','3','0'), ('2543','305','汾西县','3','0'), ('2544','306','离石市','3','0'), ('2545','306','离石区','3','0'), ('2546','306','孝义市','3','0'), ('2547','306','汾阳市','3','0'), ('2548','306','文水县','3','0'), ('2549','306','交城县','3','0'), ('2550','306','兴县','3','0'), ('2551','306','临县','3','0'), ('2552','306','柳林县','3','0'), ('2553','306','石楼县','3','0'), ('2554','306','岚县','3','0'), ('2555','306','方山县','3','0'), ('2556','306','中阳县','3','0'), ('2557','306','交口县','3','0'), ('2558','307','朔城区','3','0'), ('2559','307','平鲁区','3','0'), ('2560','307','山阴县','3','0'), ('2561','307','应县','3','0'), ('2562','307','右玉县','3','0'), ('2563','307','怀仁县','3','0'), ('2564','308','忻府区','3','0'), ('2565','308','原平市','3','0'), ('2566','308','定襄县','3','0'), ('2567','308','五台县','3','0'), ('2568','308','代县','3','0'), ('2569','308','繁峙县','3','0'), ('2570','308','宁武县','3','0'), ('2571','308','静乐县','3','0'), ('2572','308','神池县','3','0'), ('2573','308','五寨县','3','0'), ('2574','308','岢岚县','3','0'), ('2575','308','河曲县','3','0'), ('2576','308','保德县','3','0'), ('2577','308','偏关县','3','0'), ('2578','309','城区','3','0'), ('2579','309','矿区','3','0'), ('2580','309','郊区','3','0'), ('2581','309','平定县','3','0'), ('2582','309','盂县','3','0'), ('2583','310','盐湖区','3','0'), ('2584','310','永济市','3','0'), ('2585','310','河津市','3','0'), ('2586','310','临猗县','3','0'), ('2587','310','万荣县','3','0'), ('2588','310','闻喜县','3','0'), ('2589','310','稷山县','3','0'), ('2590','310','新绛县','3','0'), ('2591','310','绛县','3','0'), ('2592','310','垣曲县','3','0'), ('2593','310','夏县','3','0'), ('2594','310','平陆县','3','0'), ('2595','310','芮城县','3','0'), ('2596','311','莲湖区','3','0'), ('2597','311','新城区','3','0'), ('2598','311','碑林区','3','0'), ('2599','311','雁塔区','3','0'), ('2600','311','灞桥区','3','0');
INSERT INTO `abs_region` VALUES ('2601','311','未央区','3','0'), ('2602','311','阎良区','3','0'), ('2603','311','临潼区','3','0'), ('2604','311','长安区','3','0'), ('2605','311','蓝田县','3','0'), ('2606','311','周至县','3','0'), ('2607','311','户县','3','0'), ('2608','311','高陵县','3','0'), ('2609','312','汉滨区','3','0'), ('2610','312','汉阴县','3','0'), ('2611','312','石泉县','3','0'), ('2612','312','宁陕县','3','0'), ('2613','312','紫阳县','3','0'), ('2614','312','岚皋县','3','0'), ('2615','312','平利县','3','0'), ('2616','312','镇坪县','3','0'), ('2617','312','旬阳县','3','0'), ('2618','312','白河县','3','0'), ('2619','313','陈仓区','3','0'), ('2620','313','渭滨区','3','0'), ('2621','313','金台区','3','0'), ('2622','313','凤翔县','3','0'), ('2623','313','岐山县','3','0'), ('2624','313','扶风县','3','0'), ('2625','313','眉县','3','0'), ('2626','313','陇县','3','0'), ('2627','313','千阳县','3','0'), ('2628','313','麟游县','3','0'), ('2629','313','凤县','3','0'), ('2630','313','太白县','3','0'), ('2631','314','汉台区','3','0'), ('2632','314','南郑县','3','0'), ('2633','314','城固县','3','0'), ('2634','314','洋县','3','0'), ('2635','314','西乡县','3','0'), ('2636','314','勉县','3','0'), ('2637','314','宁强县','3','0'), ('2638','314','略阳县','3','0'), ('2639','314','镇巴县','3','0'), ('2640','314','留坝县','3','0'), ('2641','314','佛坪县','3','0'), ('2642','315','商州区','3','0'), ('2643','315','洛南县','3','0'), ('2644','315','丹凤县','3','0'), ('2645','315','商南县','3','0'), ('2646','315','山阳县','3','0'), ('2647','315','镇安县','3','0'), ('2648','315','柞水县','3','0'), ('2649','316','耀州区','3','0'), ('2650','316','王益区','3','0'), ('2651','316','印台区','3','0'), ('2652','316','宜君县','3','0'), ('2653','317','临渭区','3','0'), ('2654','317','韩城市','3','0'), ('2655','317','华阴市','3','0'), ('2656','317','华县','3','0'), ('2657','317','潼关县','3','0'), ('2658','317','大荔县','3','0'), ('2659','317','合阳县','3','0'), ('2660','317','澄城县','3','0'), ('2661','317','蒲城县','3','0'), ('2662','317','白水县','3','0'), ('2663','317','富平县','3','0'), ('2664','318','秦都区','3','0'), ('2665','318','渭城区','3','0'), ('2666','318','杨陵区','3','0'), ('2667','318','兴平市','3','0'), ('2668','318','三原县','3','0'), ('2669','318','泾阳县','3','0'), ('2670','318','乾县','3','0'), ('2671','318','礼泉县','3','0'), ('2672','318','永寿县','3','0'), ('2673','318','彬县','3','0'), ('2674','318','长武县','3','0'), ('2675','318','旬邑县','3','0'), ('2676','318','淳化县','3','0'), ('2677','318','武功县','3','0'), ('2678','319','吴起县','3','0'), ('2679','319','宝塔区','3','0'), ('2680','319','延长县','3','0'), ('2681','319','延川县','3','0'), ('2682','319','子长县','3','0'), ('2683','319','安塞县','3','0'), ('2684','319','志丹县','3','0'), ('2685','319','甘泉县','3','0'), ('2686','319','富县','3','0'), ('2687','319','洛川县','3','0'), ('2688','319','宜川县','3','0'), ('2689','319','黄龙县','3','0'), ('2690','319','黄陵县','3','0'), ('2691','320','榆阳区','3','0'), ('2692','320','神木县','3','0'), ('2693','320','府谷县','3','0'), ('2694','320','横山县','3','0'), ('2695','320','靖边县','3','0'), ('2696','320','定边县','3','0'), ('2697','320','绥德县','3','0'), ('2698','320','米脂县','3','0'), ('2699','320','佳县','3','0'), ('2700','320','吴堡县','3','0');
INSERT INTO `abs_region` VALUES ('2701','320','清涧县','3','0'), ('2702','320','子洲县','3','0'), ('2703','321','长宁区','3','0'), ('2704','321','闸北区','3','0'), ('2705','321','闵行区','3','0'), ('2706','321','徐汇区','3','0'), ('2707','321','浦东新区','3','0'), ('2708','321','杨浦区','3','0'), ('2709','321','普陀区','3','0'), ('2710','321','静安区','3','0'), ('2711','321','卢湾区','3','0'), ('2712','321','虹口区','3','0'), ('2713','321','黄浦区','3','0'), ('2714','321','南汇区','3','0'), ('2715','321','松江区','3','0'), ('2716','321','嘉定区','3','0'), ('2717','321','宝山区','3','0'), ('2718','321','青浦区','3','0'), ('2719','321','金山区','3','0'), ('2720','321','奉贤区','3','0'), ('2721','321','崇明县','3','0'), ('2722','322','青羊区','3','0'), ('2723','322','锦江区','3','0'), ('2724','322','金牛区','3','0'), ('2725','322','武侯区','3','0'), ('2726','322','成华区','3','0'), ('2727','322','龙泉驿区','3','0'), ('2728','322','青白江区','3','0'), ('2729','322','新都区','3','0'), ('2730','322','温江区','3','0'), ('2731','322','高新区','3','0'), ('2732','322','高新西区','3','0'), ('2733','322','都江堰市','3','0'), ('2734','322','彭州市','3','0'), ('2735','322','邛崃市','3','0'), ('2736','322','崇州市','3','0'), ('2737','322','金堂县','3','0'), ('2738','322','双流县','3','0'), ('2739','322','郫县','3','0'), ('2740','322','大邑县','3','0'), ('2741','322','蒲江县','3','0'), ('2742','322','新津县','3','0'), ('2743','322','都江堰市','3','0'), ('2744','322','彭州市','3','0'), ('2745','322','邛崃市','3','0'), ('2746','322','崇州市','3','0'), ('2747','322','金堂县','3','0'), ('2748','322','双流县','3','0'), ('2749','322','郫县','3','0'), ('2750','322','大邑县','3','0'), ('2751','322','蒲江县','3','0'), ('2752','322','新津县','3','0'), ('2753','323','涪城区','3','0'), ('2754','323','游仙区','3','0'), ('2755','323','江油市','3','0'), ('2756','323','盐亭县','3','0'), ('2757','323','三台县','3','0'), ('2758','323','平武县','3','0'), ('2759','323','安县','3','0'), ('2760','323','梓潼县','3','0'), ('2761','323','北川县','3','0'), ('2762','324','马尔康县','3','0'), ('2763','324','汶川县','3','0'), ('2764','324','理县','3','0'), ('2765','324','茂县','3','0'), ('2766','324','松潘县','3','0'), ('2767','324','九寨沟县','3','0'), ('2768','324','金川县','3','0'), ('2769','324','小金县','3','0'), ('2770','324','黑水县','3','0'), ('2771','324','壤塘县','3','0'), ('2772','324','阿坝县','3','0'), ('2773','324','若尔盖县','3','0'), ('2774','324','红原县','3','0'), ('2775','325','巴州区','3','0'), ('2776','325','通江县','3','0'), ('2777','325','南江县','3','0'), ('2778','325','平昌县','3','0'), ('2779','326','通川区','3','0'), ('2780','326','万源市','3','0'), ('2781','326','达县','3','0'), ('2782','326','宣汉县','3','0'), ('2783','326','开江县','3','0'), ('2784','326','大竹县','3','0'), ('2785','326','渠县','3','0'), ('2786','327','旌阳区','3','0'), ('2787','327','广汉市','3','0'), ('2788','327','什邡市','3','0'), ('2789','327','绵竹市','3','0'), ('2790','327','罗江县','3','0'), ('2791','327','中江县','3','0'), ('2792','328','康定县','3','0'), ('2793','328','丹巴县','3','0'), ('2794','328','泸定县','3','0'), ('2795','328','炉霍县','3','0'), ('2796','328','九龙县','3','0'), ('2797','328','甘孜县','3','0'), ('2798','328','雅江县','3','0'), ('2799','328','新龙县','3','0'), ('2800','328','道孚县','3','0');
INSERT INTO `abs_region` VALUES ('2801','328','白玉县','3','0'), ('2802','328','理塘县','3','0'), ('2803','328','德格县','3','0'), ('2804','328','乡城县','3','0'), ('2805','328','石渠县','3','0'), ('2806','328','稻城县','3','0'), ('2807','328','色达县','3','0'), ('2808','328','巴塘县','3','0'), ('2809','328','得荣县','3','0'), ('2810','329','广安区','3','0'), ('2811','329','华蓥市','3','0'), ('2812','329','岳池县','3','0'), ('2813','329','武胜县','3','0'), ('2814','329','邻水县','3','0'), ('2815','330','利州区','3','0'), ('2816','330','元坝区','3','0'), ('2817','330','朝天区','3','0'), ('2818','330','旺苍县','3','0'), ('2819','330','青川县','3','0'), ('2820','330','剑阁县','3','0'), ('2821','330','苍溪县','3','0'), ('2822','331','峨眉山市','3','0'), ('2823','331','乐山市','3','0'), ('2824','331','犍为县','3','0'), ('2825','331','井研县','3','0'), ('2826','331','夹江县','3','0'), ('2827','331','沐川县','3','0'), ('2828','331','峨边','3','0'), ('2829','331','马边','3','0'), ('2830','332','西昌市','3','0'), ('2831','332','盐源县','3','0'), ('2832','332','德昌县','3','0'), ('2833','332','会理县','3','0'), ('2834','332','会东县','3','0'), ('2835','332','宁南县','3','0'), ('2836','332','普格县','3','0'), ('2837','332','布拖县','3','0'), ('2838','332','金阳县','3','0'), ('2839','332','昭觉县','3','0'), ('2840','332','喜德县','3','0'), ('2841','332','冕宁县','3','0'), ('2842','332','越西县','3','0'), ('2843','332','甘洛县','3','0'), ('2844','332','美姑县','3','0'), ('2845','332','雷波县','3','0'), ('2846','332','木里','3','0'), ('2847','333','东坡区','3','0'), ('2848','333','仁寿县','3','0'), ('2849','333','彭山县','3','0'), ('2850','333','洪雅县','3','0'), ('2851','333','丹棱县','3','0'), ('2852','333','青神县','3','0'), ('2853','334','阆中市','3','0'), ('2854','334','南部县','3','0'), ('2855','334','营山县','3','0'), ('2856','334','蓬安县','3','0'), ('2857','334','仪陇县','3','0'), ('2858','334','顺庆区','3','0'), ('2859','334','高坪区','3','0'), ('2860','334','嘉陵区','3','0'), ('2861','334','西充县','3','0'), ('2862','335','市中区','3','0'), ('2863','335','东兴区','3','0'), ('2864','335','威远县','3','0'), ('2865','335','资中县','3','0'), ('2866','335','隆昌县','3','0'), ('2867','336','东  区','3','0'), ('2868','336','西  区','3','0'), ('2869','336','仁和区','3','0'), ('2870','336','米易县','3','0'), ('2871','336','盐边县','3','0'), ('2872','337','船山区','3','0'), ('2873','337','安居区','3','0'), ('2874','337','蓬溪县','3','0'), ('2875','337','射洪县','3','0'), ('2876','337','大英县','3','0'), ('2877','338','雨城区','3','0'), ('2878','338','名山县','3','0'), ('2879','338','荥经县','3','0'), ('2880','338','汉源县','3','0'), ('2881','338','石棉县','3','0'), ('2882','338','天全县','3','0'), ('2883','338','芦山县','3','0'), ('2884','338','宝兴县','3','0'), ('2885','339','翠屏区','3','0'), ('2886','339','宜宾县','3','0'), ('2887','339','南溪县','3','0'), ('2888','339','江安县','3','0'), ('2889','339','长宁县','3','0'), ('2890','339','高县','3','0'), ('2891','339','珙县','3','0'), ('2892','339','筠连县','3','0'), ('2893','339','兴文县','3','0'), ('2894','339','屏山县','3','0'), ('2895','340','雁江区','3','0'), ('2896','340','简阳市','3','0'), ('2897','340','安岳县','3','0'), ('2898','340','乐至县','3','0'), ('2899','341','大安区','3','0'), ('2900','341','自流井区','3','0');
INSERT INTO `abs_region` VALUES ('2901','341','贡井区','3','0'), ('2902','341','沿滩区','3','0'), ('2903','341','荣县','3','0'), ('2904','341','富顺县','3','0'), ('2905','342','江阳区','3','0'), ('2906','342','纳溪区','3','0'), ('2907','342','龙马潭区','3','0'), ('2908','342','泸县','3','0'), ('2909','342','合江县','3','0'), ('2910','342','叙永县','3','0'), ('2911','342','古蔺县','3','0'), ('2912','343','和平区','3','0'), ('2913','343','河西区','3','0'), ('2914','343','南开区','3','0'), ('2915','343','河北区','3','0'), ('2916','343','河东区','3','0'), ('2917','343','红桥区','3','0'), ('2918','343','东丽区','3','0'), ('2919','343','津南区','3','0'), ('2920','343','西青区','3','0'), ('2921','343','北辰区','3','0'), ('2922','343','塘沽区','3','0'), ('2923','343','汉沽区','3','0'), ('2924','343','大港区','3','0'), ('2925','343','武清区','3','0'), ('2926','343','宝坻区','3','0'), ('2927','343','经济开发区','3','0'), ('2928','343','宁河县','3','0'), ('2929','343','静海县','3','0'), ('2930','343','蓟县','3','0'), ('2931','344','城关区','3','0'), ('2932','344','林周县','3','0'), ('2933','344','当雄县','3','0'), ('2934','344','尼木县','3','0'), ('2935','344','曲水县','3','0'), ('2936','344','堆龙德庆县','3','0'), ('2937','344','达孜县','3','0'), ('2938','344','墨竹工卡县','3','0'), ('2939','345','噶尔县','3','0'), ('2940','345','普兰县','3','0'), ('2941','345','札达县','3','0'), ('2942','345','日土县','3','0'), ('2943','345','革吉县','3','0'), ('2944','345','改则县','3','0'), ('2945','345','措勤县','3','0'), ('2946','346','昌都县','3','0'), ('2947','346','江达县','3','0'), ('2948','346','贡觉县','3','0'), ('2949','346','类乌齐县','3','0'), ('2950','346','丁青县','3','0'), ('2951','346','察雅县','3','0'), ('2952','346','八宿县','3','0'), ('2953','346','左贡县','3','0'), ('2954','346','芒康县','3','0'), ('2955','346','洛隆县','3','0'), ('2956','346','边坝县','3','0'), ('2957','347','林芝县','3','0'), ('2958','347','工布江达县','3','0'), ('2959','347','米林县','3','0'), ('2960','347','墨脱县','3','0'), ('2961','347','波密县','3','0'), ('2962','347','察隅县','3','0'), ('2963','347','朗县','3','0'), ('2964','348','那曲县','3','0'), ('2965','348','嘉黎县','3','0'), ('2966','348','比如县','3','0'), ('2967','348','聂荣县','3','0'), ('2968','348','安多县','3','0'), ('2969','348','申扎县','3','0'), ('2970','348','索县','3','0'), ('2971','348','班戈县','3','0'), ('2972','348','巴青县','3','0'), ('2973','348','尼玛县','3','0'), ('2974','349','日喀则市','3','0'), ('2975','349','南木林县','3','0'), ('2976','349','江孜县','3','0'), ('2977','349','定日县','3','0'), ('2978','349','萨迦县','3','0'), ('2979','349','拉孜县','3','0'), ('2980','349','昂仁县','3','0'), ('2981','349','谢通门县','3','0'), ('2982','349','白朗县','3','0'), ('2983','349','仁布县','3','0'), ('2984','349','康马县','3','0'), ('2985','349','定结县','3','0'), ('2986','349','仲巴县','3','0'), ('2987','349','亚东县','3','0'), ('2988','349','吉隆县','3','0'), ('2989','349','聂拉木县','3','0'), ('2990','349','萨嘎县','3','0'), ('2991','349','岗巴县','3','0'), ('2992','350','乃东县','3','0'), ('2993','350','扎囊县','3','0'), ('2994','350','贡嘎县','3','0'), ('2995','350','桑日县','3','0'), ('2996','350','琼结县','3','0'), ('2997','350','曲松县','3','0'), ('2998','350','措美县','3','0'), ('2999','350','洛扎县','3','0'), ('3000','350','加查县','3','0');
INSERT INTO `abs_region` VALUES ('3001','350','隆子县','3','0'), ('3002','350','错那县','3','0'), ('3003','350','浪卡子县','3','0'), ('3004','351','天山区','3','0'), ('3005','351','沙依巴克区','3','0'), ('3006','351','新市区','3','0'), ('3007','351','水磨沟区','3','0'), ('3008','351','头屯河区','3','0'), ('3009','351','达坂城区','3','0'), ('3010','351','米东区','3','0'), ('3011','351','乌鲁木齐县','3','0'), ('3012','352','阿克苏市','3','0'), ('3013','352','温宿县','3','0'), ('3014','352','库车县','3','0'), ('3015','352','沙雅县','3','0'), ('3016','352','新和县','3','0'), ('3017','352','拜城县','3','0'), ('3018','352','乌什县','3','0'), ('3019','352','阿瓦提县','3','0'), ('3020','352','柯坪县','3','0'), ('3021','353','阿拉尔市','3','0'), ('3022','354','库尔勒市','3','0'), ('3023','354','轮台县','3','0'), ('3024','354','尉犁县','3','0'), ('3025','354','若羌县','3','0'), ('3026','354','且末县','3','0'), ('3027','354','焉耆','3','0'), ('3028','354','和静县','3','0'), ('3029','354','和硕县','3','0'), ('3030','354','博湖县','3','0'), ('3031','355','博乐市','3','0'), ('3032','355','精河县','3','0'), ('3033','355','温泉县','3','0'), ('3034','356','呼图壁县','3','0'), ('3035','356','米泉市','3','0'), ('3036','356','昌吉市','3','0'), ('3037','356','阜康市','3','0'), ('3038','356','玛纳斯县','3','0'), ('3039','356','奇台县','3','0'), ('3040','356','吉木萨尔县','3','0'), ('3041','356','木垒','3','0'), ('3042','357','哈密市','3','0'), ('3043','357','伊吾县','3','0'), ('3044','357','巴里坤','3','0'), ('3045','358','和田市','3','0'), ('3046','358','和田县','3','0'), ('3047','358','墨玉县','3','0'), ('3048','358','皮山县','3','0'), ('3049','358','洛浦县','3','0'), ('3050','358','策勒县','3','0'), ('3051','358','于田县','3','0'), ('3052','358','民丰县','3','0'), ('3053','359','喀什市','3','0'), ('3054','359','疏附县','3','0'), ('3055','359','疏勒县','3','0'), ('3056','359','英吉沙县','3','0'), ('3057','359','泽普县','3','0'), ('3058','359','莎车县','3','0'), ('3059','359','叶城县','3','0'), ('3060','359','麦盖提县','3','0'), ('3061','359','岳普湖县','3','0'), ('3062','359','伽师县','3','0'), ('3063','359','巴楚县','3','0'), ('3064','359','塔什库尔干','3','0'), ('3065','360','克拉玛依市','3','0'), ('3066','361','阿图什市','3','0'), ('3067','361','阿克陶县','3','0'), ('3068','361','阿合奇县','3','0'), ('3069','361','乌恰县','3','0'), ('3070','362','石河子市','3','0'), ('3071','363','图木舒克市','3','0'), ('3072','364','吐鲁番市','3','0'), ('3073','364','鄯善县','3','0'), ('3074','364','托克逊县','3','0'), ('3075','365','五家渠市','3','0'), ('3076','366','阿勒泰市','3','0'), ('3077','366','布克赛尔','3','0'), ('3078','366','伊宁市','3','0'), ('3079','366','布尔津县','3','0'), ('3080','366','奎屯市','3','0'), ('3081','366','乌苏市','3','0'), ('3082','366','额敏县','3','0'), ('3083','366','富蕴县','3','0'), ('3084','366','伊宁县','3','0'), ('3085','366','福海县','3','0'), ('3086','366','霍城县','3','0'), ('3087','366','沙湾县','3','0'), ('3088','366','巩留县','3','0'), ('3089','366','哈巴河县','3','0'), ('3090','366','托里县','3','0'), ('3091','366','青河县','3','0'), ('3092','366','新源县','3','0'), ('3093','366','裕民县','3','0'), ('3094','366','和布克赛尔','3','0'), ('3095','366','吉木乃县','3','0'), ('3096','366','昭苏县','3','0'), ('3097','366','特克斯县','3','0'), ('3098','366','尼勒克县','3','0'), ('3099','366','察布查尔','3','0'), ('3100','367','盘龙区','3','0');
INSERT INTO `abs_region` VALUES ('3101','367','五华区','3','0'), ('3102','367','官渡区','3','0'), ('3103','367','西山区','3','0'), ('3104','367','东川区','3','0'), ('3105','367','安宁市','3','0'), ('3106','367','呈贡县','3','0'), ('3107','367','晋宁县','3','0'), ('3108','367','富民县','3','0'), ('3109','367','宜良县','3','0'), ('3110','367','嵩明县','3','0'), ('3111','367','石林县','3','0'), ('3112','367','禄劝','3','0'), ('3113','367','寻甸','3','0'), ('3114','368','兰坪','3','0'), ('3115','368','泸水县','3','0'), ('3116','368','福贡县','3','0'), ('3117','368','贡山','3','0'), ('3118','369','宁洱','3','0'), ('3119','369','思茅区','3','0'), ('3120','369','墨江','3','0'), ('3121','369','景东','3','0'), ('3122','369','景谷','3','0'), ('3123','369','镇沅','3','0'), ('3124','369','江城','3','0'), ('3125','369','孟连','3','0'), ('3126','369','澜沧','3','0'), ('3127','369','西盟','3','0'), ('3128','370','古城区','3','0'), ('3129','370','宁蒗','3','0'), ('3130','370','玉龙','3','0'), ('3131','370','永胜县','3','0'), ('3132','370','华坪县','3','0'), ('3133','371','隆阳区','3','0'), ('3134','371','施甸县','3','0'), ('3135','371','腾冲县','3','0'), ('3136','371','龙陵县','3','0'), ('3137','371','昌宁县','3','0'), ('3138','372','楚雄市','3','0'), ('3139','372','双柏县','3','0'), ('3140','372','牟定县','3','0'), ('3141','372','南华县','3','0'), ('3142','372','姚安县','3','0'), ('3143','372','大姚县','3','0'), ('3144','372','永仁县','3','0'), ('3145','372','元谋县','3','0'), ('3146','372','武定县','3','0'), ('3147','372','禄丰县','3','0'), ('3148','373','大理市','3','0'), ('3149','373','祥云县','3','0'), ('3150','373','宾川县','3','0'), ('3151','373','弥渡县','3','0'), ('3152','373','永平县','3','0'), ('3153','373','云龙县','3','0'), ('3154','373','洱源县','3','0'), ('3155','373','剑川县','3','0'), ('3156','373','鹤庆县','3','0'), ('3157','373','漾濞','3','0'), ('3158','373','南涧','3','0'), ('3159','373','巍山','3','0'), ('3160','374','潞西市','3','0'), ('3161','374','瑞丽市','3','0'), ('3162','374','梁河县','3','0'), ('3163','374','盈江县','3','0'), ('3164','374','陇川县','3','0'), ('3165','375','香格里拉县','3','0'), ('3166','375','德钦县','3','0'), ('3167','375','维西','3','0'), ('3168','376','泸西县','3','0'), ('3169','376','蒙自县','3','0'), ('3170','376','个旧市','3','0'), ('3171','376','开远市','3','0'), ('3172','376','绿春县','3','0'), ('3173','376','建水县','3','0'), ('3174','376','石屏县','3','0'), ('3175','376','弥勒县','3','0'), ('3176','376','元阳县','3','0'), ('3177','376','红河县','3','0'), ('3178','376','金平','3','0'), ('3179','376','河口','3','0'), ('3180','376','屏边','3','0'), ('3181','377','临翔区','3','0'), ('3182','377','凤庆县','3','0'), ('3183','377','云县','3','0'), ('3184','377','永德县','3','0'), ('3185','377','镇康县','3','0'), ('3186','377','双江','3','0'), ('3187','377','耿马','3','0'), ('3188','377','沧源','3','0'), ('3189','378','麒麟区','3','0'), ('3190','378','宣威市','3','0'), ('3191','378','马龙县','3','0'), ('3192','378','陆良县','3','0'), ('3193','378','师宗县','3','0'), ('3194','378','罗平县','3','0'), ('3195','378','富源县','3','0'), ('3196','378','会泽县','3','0'), ('3197','378','沾益县','3','0'), ('3198','379','文山县','3','0'), ('3199','379','砚山县','3','0'), ('3200','379','西畴县','3','0');
INSERT INTO `abs_region` VALUES ('3201','379','麻栗坡县','3','0'), ('3202','379','马关县','3','0'), ('3203','379','丘北县','3','0'), ('3204','379','广南县','3','0'), ('3205','379','富宁县','3','0'), ('3206','380','景洪市','3','0'), ('3207','380','勐海县','3','0'), ('3208','380','勐腊县','3','0'), ('3209','381','红塔区','3','0'), ('3210','381','江川县','3','0'), ('3211','381','澄江县','3','0'), ('3212','381','通海县','3','0'), ('3213','381','华宁县','3','0'), ('3214','381','易门县','3','0'), ('3215','381','峨山','3','0'), ('3216','381','新平','3','0'), ('3217','381','元江','3','0'), ('3218','382','昭阳区','3','0'), ('3219','382','鲁甸县','3','0'), ('3220','382','巧家县','3','0'), ('3221','382','盐津县','3','0'), ('3222','382','大关县','3','0'), ('3223','382','永善县','3','0'), ('3224','382','绥江县','3','0'), ('3225','382','镇雄县','3','0'), ('3226','382','彝良县','3','0'), ('3227','382','威信县','3','0'), ('3228','382','水富县','3','0'), ('3229','383','西湖区','3','0'), ('3230','383','上城区','3','0'), ('3231','383','下城区','3','0'), ('3232','383','拱墅区','3','0'), ('3233','383','滨江区','3','0'), ('3234','383','江干区','3','0'), ('3235','383','萧山区','3','0'), ('3236','383','余杭区','3','0'), ('3237','383','市郊','3','0'), ('3238','383','建德市','3','0'), ('3239','383','富阳市','3','0'), ('3240','383','临安市','3','0'), ('3241','383','桐庐县','3','0'), ('3242','383','淳安县','3','0'), ('3243','384','吴兴区','3','0'), ('3244','384','南浔区','3','0'), ('3245','384','德清县','3','0'), ('3246','384','长兴县','3','0'), ('3247','384','安吉县','3','0'), ('3248','385','南湖区','3','0'), ('3249','385','秀洲区','3','0'), ('3250','385','海宁市','3','0'), ('3251','385','嘉善县','3','0'), ('3252','385','平湖市','3','0'), ('3253','385','桐乡市','3','0'), ('3254','385','海盐县','3','0'), ('3255','386','婺城区','3','0'), ('3256','386','金东区','3','0'), ('3257','386','兰溪市','3','0'), ('3258','386','市区','3','0'), ('3259','386','佛堂镇','3','0'), ('3260','386','上溪镇','3','0'), ('3261','386','义亭镇','3','0'), ('3262','386','大陈镇','3','0'), ('3263','386','苏溪镇','3','0'), ('3264','386','赤岸镇','3','0'), ('3265','386','东阳市','3','0'), ('3266','386','永康市','3','0'), ('3267','386','武义县','3','0'), ('3268','386','浦江县','3','0'), ('3269','386','磐安县','3','0'), ('3270','387','莲都区','3','0'), ('3271','387','龙泉市','3','0'), ('3272','387','青田县','3','0'), ('3273','387','缙云县','3','0'), ('3274','387','遂昌县','3','0'), ('3275','387','松阳县','3','0'), ('3276','387','云和县','3','0'), ('3277','387','庆元县','3','0'), ('3278','387','景宁','3','0'), ('3279','388','海曙区','3','0'), ('3280','388','江东区','3','0'), ('3281','388','江北区','3','0'), ('3282','388','镇海区','3','0'), ('3283','388','北仑区','3','0'), ('3284','388','鄞州区','3','0'), ('3285','388','余姚市','3','0'), ('3286','388','慈溪市','3','0'), ('3287','388','奉化市','3','0'), ('3288','388','象山县','3','0'), ('3289','388','宁海县','3','0'), ('3290','389','越城区','3','0'), ('3291','389','上虞市','3','0'), ('3292','389','嵊州市','3','0'), ('3293','389','绍兴县','3','0'), ('3294','389','新昌县','3','0'), ('3295','389','诸暨市','3','0'), ('3296','390','椒江区','3','0'), ('3297','390','黄岩区','3','0'), ('3298','390','路桥区','3','0'), ('3299','390','温岭市','3','0'), ('3300','390','临海市','3','0');
INSERT INTO `abs_region` VALUES ('3301','390','玉环县','3','0'), ('3302','390','三门县','3','0'), ('3303','390','天台县','3','0'), ('3304','390','仙居县','3','0'), ('3305','391','鹿城区','3','0'), ('3306','391','龙湾区','3','0'), ('3307','391','瓯海区','3','0'), ('3308','391','瑞安市','3','0'), ('3309','391','乐清市','3','0'), ('3310','391','洞头县','3','0'), ('3311','391','永嘉县','3','0'), ('3312','391','平阳县','3','0'), ('3313','391','苍南县','3','0'), ('3314','391','文成县','3','0'), ('3315','391','泰顺县','3','0'), ('3316','392','定海区','3','0'), ('3317','392','普陀区','3','0'), ('3318','392','岱山县','3','0'), ('3319','392','嵊泗县','3','0'), ('3320','393','衢州市','3','0'), ('3321','393','江山市','3','0'), ('3322','393','常山县','3','0'), ('3323','393','开化县','3','0'), ('3324','393','龙游县','3','0'), ('3325','394','合川区','3','0'), ('3326','394','江津区','3','0'), ('3327','394','南川区','3','0'), ('3328','394','永川区','3','0'), ('3329','394','南岸区','3','0'), ('3330','394','渝北区','3','0'), ('3331','394','万盛区','3','0'), ('3332','394','大渡口区','3','0'), ('3333','394','万州区','3','0'), ('3334','394','北碚区','3','0'), ('3335','394','沙坪坝区','3','0'), ('3336','394','巴南区','3','0'), ('3337','394','涪陵区','3','0'), ('3338','394','江北区','3','0'), ('3339','394','九龙坡区','3','0'), ('3340','394','渝中区','3','0'), ('3341','394','黔江开发区','3','0'), ('3342','394','长寿区','3','0'), ('3343','394','双桥区','3','0'), ('3344','394','綦江县','3','0'), ('3345','394','潼南县','3','0'), ('3346','394','铜梁县','3','0'), ('3347','394','大足县','3','0'), ('3348','394','荣昌县','3','0'), ('3349','394','璧山县','3','0'), ('3350','394','垫江县','3','0'), ('3351','394','武隆县','3','0'), ('3352','394','丰都县','3','0'), ('3353','394','城口县','3','0'), ('3354','394','梁平县','3','0'), ('3355','394','开县','3','0'), ('3356','394','巫溪县','3','0'), ('3357','394','巫山县','3','0'), ('3358','394','奉节县','3','0'), ('3359','394','云阳县','3','0'), ('3360','394','忠县','3','0'), ('3361','394','石柱','3','0'), ('3362','394','彭水','3','0'), ('3363','394','酉阳','3','0'), ('3364','394','秀山','3','0'), ('3365','395','沙田区','3','0'), ('3366','395','东区','3','0'), ('3367','395','观塘区','3','0'), ('3368','395','黄大仙区','3','0'), ('3369','395','九龙城区','3','0'), ('3370','395','屯门区','3','0'), ('3371','395','葵青区','3','0'), ('3372','395','元朗区','3','0'), ('3373','395','深水埗区','3','0'), ('3374','395','西贡区','3','0'), ('3375','395','大埔区','3','0'), ('3376','395','湾仔区','3','0'), ('3377','395','油尖旺区','3','0'), ('3378','395','北区','3','0'), ('3379','395','南区','3','0'), ('3380','395','荃湾区','3','0'), ('3381','395','中西区','3','0'), ('3382','395','离岛区','3','0'), ('3383','396','澳门','3','0'), ('3384','397','台北','3','0'), ('3385','397','高雄','3','0'), ('3386','397','基隆','3','0'), ('3387','397','台中','3','0'), ('3388','397','台南','3','0'), ('3389','397','新竹','3','0'), ('3390','397','嘉义','3','0'), ('3391','397','宜兰县','3','0'), ('3392','397','桃园县','3','0'), ('3393','397','苗栗县','3','0'), ('3394','397','彰化县','3','0'), ('3395','397','南投县','3','0'), ('3396','397','云林县','3','0'), ('3397','397','屏东县','3','0'), ('3398','397','台东县','3','0'), ('3399','397','花莲县','3','0'), ('3400','397','澎湖县','3','0');
INSERT INTO `abs_region` VALUES ('3401','3','合肥','2','0'), ('3402','3401','庐阳区','3','0'), ('3403','3401','瑶海区','3','0'), ('3404','3401','蜀山区','3','0'), ('3405','3401','包河区','3','0'), ('3406','3401','长丰县','3','0'), ('3407','3401','肥东县','3','0'), ('3408','3401','肥西县','3','0');
INSERT INTO `abs_reg_fields` VALUES ('1','MSN','0','0','1','0'), ('2','QQ','0','0','1','0'), ('3','办公电话','0','0','1','0'), ('4','家庭电话','0','0','1','0'), ('5','手机','0','1','1','1'), ('6','密码找回问题','0','0','1','0');
INSERT INTO `abs_sessions_data` VALUES ('eba25f25f31073f340fbdda7bdf30e08','4294967295','a:9:{s:7:\"from_ad\";i:0;s:7:\"referer\";s:6:\"本站\";s:10:\"login_fail\";i:0;s:12:\"captcha_word\";s:16:\"MjQyYzQ4OGQ4Yw==\";s:9:\"flow_type\";i:0;s:10:\"flow_order\";a:8:{s:14:\"extension_code\";s:0:\"\";s:11:\"shipping_id\";i:0;s:6:\"pay_id\";i:0;s:7:\"pack_id\";i:0;s:7:\"card_id\";i:0;s:5:\"bonus\";i:0;s:8:\"integral\";i:0;s:7:\"surplus\";i:0;}s:9:\"last_time\";i:1437000049;s:7:\"last_ip\";s:0:\"\";s:14:\"flow_consignee\";a:14:{s:10:\"address_id\";s:1:\"1\";s:9:\"consignee\";s:6:\"liuhao\";s:7:\"country\";s:1:\"1\";s:8:\"province\";s:2:\"29\";s:4:\"city\";s:3:\"352\";s:8:\"district\";s:4:\"3013\";s:5:\"email\";s:19:\"liuhaos2000@163.com\";s:7:\"address\";s:8:\"asdfasdf\";s:7:\"zipcode\";s:6:\"123456\";s:3:\"tel\";s:11:\"12399992222\";s:6:\"mobile\";s:11:\"11122229999\";s:13:\"sign_building\";s:0:\"\";s:9:\"best_time\";s:0:\"\";s:7:\"user_id\";s:1:\"1\";}}');
INSERT INTO `abs_shipping` VALUES ('1','yto','圆通速递','上海圆通物流（速递）有限公司经过多年的网络快速发展，在中国速递行业中一直处于领先地位。为了能更好的发展国际快件市场，加快与国际市场的接轨，强化圆通的整体实力，圆通已在东南亚、欧美、中东、北美洲、非洲等许多城市运作国际快件业务','0','1','1','','/images/receipt/dly_yto.jpg','t_shop_province,网店-省份,132,24,279.6,105.7,b_shop_province||,||t_shop_name,网店-名称,268,29,142.95,133.85,b_shop_name||,||t_shop_address,网店-地址,346,40,67.3,199.95,b_shop_address||,||t_shop_city,网店-城市,64,35,223.8,163.95,b_shop_city||,||t_shop_district,网店-区/县,56,35,314.9,164.25,b_shop_district||,||t_pigeon,√-对号,21,21,143.1,263.2,b_pigeon||,||t_customer_name,收件人-姓名,89,25,488.65,121.05,b_customer_name||,||t_customer_tel,收件人-电话,136,21,656,110.6,b_customer_tel||,||t_customer_mobel,收件人-手机,137,21,655.6,132.8,b_customer_mobel||,||t_customer_province,收件人-省份,115,24,480.2,173.5,b_customer_province||,||t_customer_city,收件人-城市,60,27,609.3,172.5,b_customer_city||,||t_customer_district,收件人-区/县,58,28,696.8,173.25,b_customer_district||,||t_customer_post,收件人-邮编,93,21,701.1,240.25,b_customer_post||,||','2','0');
INSERT INTO `abs_shipping_area` VALUES ('1','北京','1','a:6:{i:0;a:2:{s:4:\"name\";s:8:\"item_fee\";s:5:\"value\";s:2:\"10\";}i:1;a:2:{s:4:\"name\";s:8:\"base_fee\";s:5:\"value\";s:1:\"5\";}i:2;a:2:{s:4:\"name\";s:8:\"step_fee\";s:5:\"value\";s:1:\"5\";}i:3;a:2:{s:4:\"name\";s:10:\"free_money\";s:5:\"value\";s:1:\"1\";}i:4;a:2:{s:4:\"name\";s:16:\"fee_compute_mode\";s:5:\"value\";s:9:\"by_weight\";}i:5;a:2:{s:4:\"name\";s:7:\"pay_fee\";s:5:\"value\";s:0:\"\";}}');
INSERT INTO `abs_shop_config` VALUES ('1','0','shop_info','group','','','','1'), ('2','0','basic','group','','','','1'), ('3','0','display','group','','','','1'), ('4','0','shopping_flow','group','','','','1'), ('5','0','smtp','group','','','','1'), ('6','0','hidden','hidden','','','','1'), ('7','0','goods','group','','','','1'), ('8','0','sms','group','','','','1'), ('9','0','wap','group','','','','1'), ('101','1','shop_name','text','','','ECSHOP模板堂','1'), ('102','1','shop_title','text','','','ECSHOP模板堂（www.ecmoban.com）专业ECSHOP模板制作 ECSHOP模板定制_ECSHOP模板修改_ECSHOP模板出售_ECSHOP模板案例','1'), ('103','1','shop_desc','text','','','ECSHOP模板堂（www.ecmoban.com）专业ECSHOP模板制作 ECSHOP模板定制_ECSHOP模板修改_ECSHOP模板出售_ECSHOP模板案例','1'), ('104','1','shop_keywords','text','','','ECSHOP模板堂（www.ecmoban.com）专业ECSHOP模板制作 ECSHOP模板定制_ECSHOP模板修改_ECSHOP模板出售_ECSHOP模板案例','1'), ('105','1','shop_country','manual','','','1','1'), ('106','1','shop_province','manual','','','2','1'), ('107','1','shop_city','manual','','','52','1'), ('108','1','shop_address','text','','','','1'), ('109','1','qq','text','','','123456,234567','1'), ('110','1','ww','text','','','123456789','1'), ('111','1','skype','text','','','','1'), ('112','1','ym','text','','','','1'), ('113','1','msn','text','','','','1'), ('114','1','service_email','text','','','','1'), ('115','1','service_phone','text','','','400-000-000','1'), ('116','1','shop_closed','select','0,1','','0','1'), ('117','1','close_comment','textarea','','','','1'), ('118','1','shop_logo','file','','../themes/{$template}/images/','','1'), ('119','1','licensed','select','0,1','','1','1'), ('120','1','user_notice','textarea','','','用户中心公告！','1'), ('121','1','shop_notice','textarea','','','','1'), ('122','1','shop_reg_closed','select','1,0','','0','1'), ('201','2','lang','manual','','','zh_cn','1'), ('202','2','icp_number','text','','','','1'), ('203','2','icp_file','file','','../cert/','','1'), ('204','2','watermark','file','','../images/','','1'), ('205','2','watermark_place','select','0,1,2,3,4,5','','1','1'), ('206','2','watermark_alpha','text','','','65','1'), ('207','2','use_storage','select','1,0','','1','1'), ('208','2','market_price_rate','text','','','1.2','1'), ('209','2','rewrite','select','0,1,2','','0','1'), ('210','2','integral_name','text','','','积分','1'), ('211','2','integral_scale','text','','','1','1'), ('212','2','integral_percent','text','','','1','1'), ('213','2','sn_prefix','text','','','ECS','1'), ('214','2','comment_check','select','0,1','','1','1'), ('215','2','no_picture','file','','../images/','','1'), ('218','2','stats_code','textarea','','','','1'), ('219','2','cache_time','text','','','3600','1'), ('220','2','register_points','text','','','0','1'), ('221','2','enable_gzip','select','0,1','','0','1'), ('222','2','top10_time','select','0,1,2,3,4','','0','1'), ('223','2','timezone','options','-12,-11,-10,-9,-8,-7,-6,-5,-4,-3.5,-3,-2,-1,0,1,2,3,3.5,4,4.5,5,5.5,5.75,6,6.5,7,8,9,9.5,10,11,12','','8','1'), ('224','2','upload_size_limit','options','-1,0,64,128,256,512,1024,2048,4096','','64','1'), ('226','2','cron_method','select','0,1','','0','1'), ('227','2','comment_factor','select','0,1,2,3','','0','1'), ('228','2','enable_order_check','select','0,1','','1','1'), ('229','2','default_storage','text','','','1','1'), ('230','2','bgcolor','text','','','#FFFFFF','1'), ('231','2','visit_stats','select','on,off','','on','1'), ('232','2','send_mail_on','select','on,off','','off','1'), ('233','2','auto_generate_gallery','select','1,0','','1','1'), ('234','2','retain_original_img','select','1,0','','1','1'), ('235','2','member_email_validate','select','1,0','','1','1'), ('236','2','message_board','select','1,0','','1','1'), ('239','2','certificate_id','hidden','','','','1'), ('240','2','token','hidden','','','','1'), ('241','2','certi','hidden','','','http://service.shopex.cn/openapi/api.php','1'), ('242','2','send_verify_email','select','1,0','','0','1'), ('243','2','ent_id','hidden','','','','1'), ('244','2','ent_ac','hidden','','','','1'), ('245','2','ent_sign','hidden','','','','1'), ('246','2','ent_email','hidden','','','','1'), ('301','3','date_format','hidden','','','Y-m-d','1'), ('302','3','time_format','text','','','Y-m-d H:i:s','1'), ('303','3','currency_format','text','','','￥%s元','1'), ('304','3','thumb_width','text','','','220','1'), ('305','3','thumb_height','text','','','220','1'), ('306','3','image_width','text','','','360','1'), ('307','3','image_height','text','','','360','1'), ('312','3','top_number','text','','','10','1'), ('313','3','history_number','text','','','5','1'), ('314','3','comments_number','text','','','5','1'), ('315','3','bought_goods','text','','','3','1'), ('316','3','article_number','text','','','5','1'), ('317','3','goods_name_length','text','','','7','1'), ('318','3','price_format','select','0,1,2,3,4,5','','5','1'), ('319','3','page_size','text','','','10','1'), ('320','3','sort_order_type','select','0,1,2','','0','1'), ('321','3','sort_order_method','select','0,1','','0','1'), ('322','3','show_order_type','select','0,1,2','','1','1'), ('323','3','attr_related_number','text','','','5','1'), ('324','3','goods_gallery_number','text','','','5','1'), ('325','3','article_title_length','text','','','16','1'), ('326','3','name_of_region_1','text','','','国家','1'), ('327','3','name_of_region_2','text','','','省','1'), ('328','3','name_of_region_3','text','','','市','1'), ('329','3','name_of_region_4','text','','','区','1'), ('330','3','search_keywords','text','','','','0'), ('332','3','related_goods_number','text','','','4','1'), ('333','3','help_open','select','0,1','','1','1');
INSERT INTO `abs_shop_config` VALUES ('334','3','article_page_size','text','','','10','1'), ('335','3','page_style','select','0,1','','1','1'), ('336','3','recommend_order','select','0,1','','0','1'), ('337','3','index_ad','hidden','','','sys','1'), ('401','4','can_invoice','select','1,0','','1','1'), ('402','4','use_integral','select','1,0','','1','1'), ('403','4','use_bonus','select','1,0','','1','1'), ('404','4','use_surplus','select','1,0','','1','1'), ('405','4','use_how_oos','select','1,0','','1','1'), ('406','4','send_confirm_email','select','1,0','','0','1'), ('407','4','send_ship_email','select','1,0','','0','1'), ('408','4','send_cancel_email','select','1,0','','0','1'), ('409','4','send_invalid_email','select','1,0','','0','1'), ('410','4','order_pay_note','select','1,0','','1','1'), ('411','4','order_unpay_note','select','1,0','','1','1'), ('412','4','order_ship_note','select','1,0','','1','1'), ('413','4','order_receive_note','select','1,0','','1','1'), ('414','4','order_unship_note','select','1,0','','1','1'), ('415','4','order_return_note','select','1,0','','1','1'), ('416','4','order_invalid_note','select','1,0','','1','1'), ('417','4','order_cancel_note','select','1,0','','1','1'), ('418','4','invoice_content','textarea','','','','1'), ('419','4','anonymous_buy','select','1,0','','1','1'), ('420','4','min_goods_amount','text','','','0','1'), ('421','4','one_step_buy','select','1,0','','0','1'), ('422','4','invoice_type','manual','','','a:2:{s:4:\"type\";a:3:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:0:\"\";}s:4:\"rate\";a:3:{i:0;d:1;i:1;d:1.5;i:2;d:0;}}','1'), ('423','4','stock_dec_time','select','1,0','','0','1'), ('424','4','cart_confirm','options','1,2,3,4','','3','0'), ('425','4','send_service_email','select','1,0','','0','1'), ('426','4','show_goods_in_cart','select','1,2,3','','3','1'), ('427','4','show_attr_in_cart','select','1,0','','1','1'), ('501','5','smtp_host','text','','','localhost','1'), ('502','5','smtp_port','text','','','25','1'), ('503','5','smtp_user','text','','','','1'), ('504','5','smtp_pass','password','','','','1'), ('505','5','smtp_mail','text','','','','1'), ('506','5','mail_charset','select','UTF8,GB2312,BIG5','','UTF8','1'), ('507','5','mail_service','select','0,1','','0','0'), ('508','5','smtp_ssl','select','0,1','','0','0'), ('601','6','integrate_code','hidden','','','ecshop','1'), ('602','6','integrate_config','hidden','','','','1'), ('603','6','hash_code','hidden','','','31693422540744c0a6b6da635b7a5a93','1'), ('604','6','template','hidden','','','ecmoban_meilishuo','1'), ('605','6','install_date','hidden','','','1437028292','1'), ('606','6','ecs_version','hidden','','','v2.7.3','1'), ('607','6','sms_user_name','hidden','','','','1'), ('608','6','sms_password','hidden','','','','1'), ('609','6','sms_auth_str','hidden','','','','1'), ('610','6','sms_domain','hidden','','','','1'), ('611','6','sms_count','hidden','','','','1'), ('612','6','sms_total_money','hidden','','','','1'), ('613','6','sms_balance','hidden','','','','1'), ('614','6','sms_last_request','hidden','','','','1'), ('616','6','affiliate','hidden','','','a:3:{s:6:\"config\";a:7:{s:6:\"expire\";d:24;s:11:\"expire_unit\";s:4:\"hour\";s:11:\"separate_by\";i:0;s:15:\"level_point_all\";s:2:\"5%\";s:15:\"level_money_all\";s:2:\"1%\";s:18:\"level_register_all\";i:2;s:17:\"level_register_up\";i:60;}s:4:\"item\";a:4:{i:0;a:2:{s:11:\"level_point\";s:3:\"60%\";s:11:\"level_money\";s:3:\"60%\";}i:1;a:2:{s:11:\"level_point\";s:3:\"30%\";s:11:\"level_money\";s:3:\"30%\";}i:2;a:2:{s:11:\"level_point\";s:2:\"7%\";s:11:\"level_money\";s:2:\"7%\";}i:3;a:2:{s:11:\"level_point\";s:2:\"3%\";s:11:\"level_money\";s:2:\"3%\";}}s:2:\"on\";i:1;}','1'), ('617','6','captcha','hidden','','','12','1'), ('618','6','captcha_width','hidden','','','100','1'), ('619','6','captcha_height','hidden','','','20','1'), ('620','6','sitemap','hidden','','','a:6:{s:19:\"homepage_changefreq\";s:6:\"hourly\";s:17:\"homepage_priority\";s:3:\"0.9\";s:19:\"category_changefreq\";s:6:\"hourly\";s:17:\"category_priority\";s:3:\"0.8\";s:18:\"content_changefreq\";s:6:\"weekly\";s:16:\"content_priority\";s:3:\"0.7\";}','0'), ('621','6','points_rule','hidden','','','','0'), ('622','6','flash_theme','hidden','','','dynfocus','1'), ('623','6','stylename','hidden','','','','1'), ('701','7','show_goodssn','select','1,0','','1','1'), ('702','7','show_brand','select','1,0','','1','1'), ('703','7','show_goodsweight','select','1,0','','1','1'), ('704','7','show_goodsnumber','select','1,0','','1','1'), ('705','7','show_addtime','select','1,0','','1','1'), ('706','7','goodsattr_style','select','1,0','','1','1'), ('707','7','show_marketprice','select','1,0','','1','1'), ('801','8','sms_shop_mobile','text','','','','1'), ('802','8','sms_order_placed','select','1,0','','0','1'), ('803','8','sms_order_payed','select','1,0','','0','1'), ('804','8','sms_order_shipped','select','1,0','','0','1'), ('901','9','wap_config','select','1,0','','0','1'), ('902','9','wap_logo','file','','../images/','','1'), ('903','2','message_check','select','1,0','','1','1');
INSERT INTO `abs_stats` VALUES ('1430070575','127.0.0.1','7','Safari 537.36','Windows NT','zh-CN,zh','LAN','http://localhost','/new3/install/index.php?lang=zh_cn&step=done','/new3/index.php'), ('1430074027','127.0.0.1','16','Safari 537.36','Windows NT','zh-CN,zh','LAN','','','/new3/index.php'), ('1436999508','0.0.0.0','1','Safari 537.36','Windows NT','zh-CN,zh','IANA','http://localhost','/ecshop/install/index.php?lang=zh_cn&amp;step=done','/ecshop/index.php'), ('1437004660','0.0.0.0','2','Safari 537.36','Windows NT','zh-CN,zh','IANA','http://localhost','/ecshop/admin/goods.php?act=list','/ecshop/goods.php');
INSERT INTO `abs_template` VALUES ('index','左边区域','/library/vote_list.lbi','8','0','0','0','default',''), ('index','左边区域','/library/email_list.lbi','9','0','0','0','default',''), ('index','左边区域','/library/order_query.lbi','6','0','0','0','default',''), ('index','左边区域','/library/cart.lbi','0','0','0','0','default',''), ('index','左边区域','/library/promotion_info.lbi','3','0','0','0','default',''), ('index','左边区域','/library/auction.lbi','4','0','3','0','default',''), ('index','左边区域','/library/group_buy.lbi','5','0','3','0','default',''), ('index','','/library/recommend_promotion.lbi','0','0','4','0','default',''), ('index','右边主区域','/library/recommend_hot.lbi','2','0','10','0','default',''), ('index','右边主区域','/library/recommend_new.lbi','1','0','10','0','default',''), ('index','右边主区域','/library/recommend_best.lbi','0','0','10','0','default',''), ('index','左边区域','/library/invoice_query.lbi','7','0','0','0','default',''), ('index','左边区域','/library/top10.lbi','2','0','0','0','default',''), ('index','左边区域','/library/category_tree.lbi','1','0','0','0','default',''), ('index','','/library/brands.lbi','0','0','11','0','default',''), ('category','左边区域','/library/category_tree.lbi','1','0','0','0','default',''), ('category','右边区域','/library/recommend_best.lbi','0','0','5','0','default',''), ('category','右边区域','/library/goods_list.lbi','1','0','0','0','default',''), ('category','右边区域','/library/pages.lbi','2','0','0','0','default',''), ('category','左边区域','/library/cart.lbi','0','0','0','0','default',''), ('category','左边区域','/library/price_grade.lbi','3','0','0','0','default',''), ('category','左边区域','/library/filter_attr.lbi','2','0','0','0','default',''), ('index','商店公告下广告','/library/ad_position.lbi','0','159','1','4','ecmoban_meilishuo',''), ('index','全宽行','/library/cat_goods.lbi','3','21','5','1','ecmoban_meilishuo',''), ('index','','/library/brands.lbi','0','0','3','0','ecmoban_meilishuo',''), ('index','','/library/auction.lbi','0','0','3','0','ecmoban_meilishuo',''), ('index','','/library/group_buy.lbi','0','0','3','0','ecmoban_meilishuo',''), ('index','促销商品区域','/library/recommend_promotion.lbi','0','0','4','0','ecmoban_meilishuo',''), ('index','全宽行','/library/recommend_hot.lbi','1','0','5','0','ecmoban_meilishuo',''), ('index','全宽行','/library/recommend_new.lbi','0','0','5','0','ecmoban_meilishuo',''), ('index','全宽行','/library/recommend_best.lbi','2','0','5','0','ecmoban_meilishuo',''), ('index','商店公告','/library/new_articles.lbi','0','0','0','0','ecmoban_meilishuo','');
INSERT INTO `abs_users` VALUES ('1','liuhaos2000@163.com','test','e10adc3949ba59abbe56e057f20f883e','','','0','0000-00-00','0.00','0.00','0','0','1','1437000044','1437000044','0000-00-00 00:00:00','0.0.0.0','1','0','0',NULL,'0','0','0','','123@123.com','123','123','123','123','0','0.00','friend_birthday','123');
INSERT INTO `abs_user_address` VALUES ('1','','1','liuhao','liuhaos2000@163.com','1','29','352','3013','asdfasdf','123456','12399992222','11122229999','',''), ('2','','1','liuhao','liuhaos2000@163.com','1','19','258','2163','saf','123456','11122229999','11122229999','asdf','asdf');
INSERT INTO `abs_user_rank` VALUES ('1','注册用户','0','10000','100','1','0'), ('2','vip','10000','10000000','95','1','0'), ('3','代销用户','0','0','90','0','1');
