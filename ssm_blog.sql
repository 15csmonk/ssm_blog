/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50641
 Source Host           : localhost
 Source Database       : ssm_blog

 Target Server Type    : MySQL
 Target Server Version : 50641
 File Encoding         : utf-8

 Date: 05/02/2019 21:14:14 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `article`
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `article_id` int(11) NOT NULL AUTO_INCREMENT,
  `article_user_id` int(11) unsigned DEFAULT NULL,
  `article_title` varchar(255) DEFAULT NULL,
  `article_content` mediumtext,
  `article_view_count` int(11) DEFAULT '0',
  `article_comment_count` int(11) DEFAULT '0',
  `article_like_count` int(11) DEFAULT '0',
  `article_is_comment` int(1) unsigned DEFAULT NULL,
  `article_status` int(1) unsigned DEFAULT '1',
  `article_order` int(11) unsigned DEFAULT NULL,
  `article_update_time` datetime DEFAULT NULL,
  `article_create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`article_id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;


-- ----------------------------
--  Table structure for `article_category_ref`
-- ----------------------------
DROP TABLE IF EXISTS `article_category_ref`;
CREATE TABLE `article_category_ref` (
  `article_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
--  Table structure for `article_tag_ref`
-- ----------------------------
DROP TABLE IF EXISTS `article_tag_ref`;
CREATE TABLE `article_tag_ref` (
  `article_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`article_id`,`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
--  Table structure for `category`
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `category_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `category_pid` int(11) DEFAULT NULL,
  `category_name` varchar(50) DEFAULT NULL,
  `category_description` varchar(255) DEFAULT NULL,
  `category_order` int(11) unsigned DEFAULT '1',
  `category_icon` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_name` (`category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=100000007 DEFAULT CHARSET=utf8;



-- ----------------------------
--  Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `comment_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `comment_pid` int(11) unsigned DEFAULT '0',
  `comment_pname` varchar(255) DEFAULT NULL,
  `comment_article_id` int(11) unsigned DEFAULT NULL,
  `comment_author_name` varchar(50) DEFAULT NULL,
  `comment_author_email` varchar(50) DEFAULT NULL,
  `comment_author_url` varchar(50) DEFAULT NULL,
  `comment_author_avatar` varchar(100) DEFAULT NULL,
  `comment_content` varchar(1000) DEFAULT NULL,
  `comment_agent` varchar(200) DEFAULT NULL,
  `comment_ip` varchar(50) DEFAULT NULL,
  `comment_create_time` datetime DEFAULT NULL,
  `comment_role` int(1) DEFAULT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;



-- ----------------------------
--  Table structure for `link`
-- ----------------------------
DROP TABLE IF EXISTS `link`;
CREATE TABLE `link` (
  `link_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) DEFAULT NULL,
  `link_name` varchar(255) DEFAULT NULL,
  `link_image` varchar(255) DEFAULT NULL,
  `link_description` varchar(255) DEFAULT NULL,
  `link_owner_nickname` varchar(40) DEFAULT NULL,
  `link_owner_contact` varchar(255) DEFAULT NULL,
  `link_update_time` datetime DEFAULT NULL,
  `link_create_time` datetime DEFAULT NULL,
  `link_order` int(2) unsigned DEFAULT '1',
  `link_status` int(1) unsigned DEFAULT '1',
  PRIMARY KEY (`link_id`),
  UNIQUE KEY `link_name` (`link_name`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;



-- ----------------------------
--  Table structure for `menu`
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(255) DEFAULT NULL,
  `menu_url` varchar(255) DEFAULT NULL,
  `menu_level` int(11) DEFAULT NULL,
  `menu_icon` varchar(255) DEFAULT NULL,
  `menu_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`menu_id`),
  UNIQUE KEY `menu_name` (`menu_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;



-- ----------------------------
--  Table structure for `notice`
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `notice_id` int(11) NOT NULL AUTO_INCREMENT,
  `notice_title` varchar(255) DEFAULT NULL,
  `notice_content` varchar(10000) DEFAULT NULL,
  `notice_create_time` datetime DEFAULT NULL,
  `notice_update_time` datetime DEFAULT NULL,
  `notice_status` int(1) unsigned DEFAULT '1',
  `notice_order` int(2) DEFAULT NULL,
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;



-- ----------------------------
--  Table structure for `options`
-- ----------------------------
DROP TABLE IF EXISTS `options`;
CREATE TABLE `options` (
  `option_id` int(11) NOT NULL,
  `option_site_title` varchar(255) DEFAULT NULL,
  `option_site_descrption` varchar(255) DEFAULT NULL,
  `option_meta_descrption` varchar(255) DEFAULT NULL,
  `option_meta_keyword` varchar(255) DEFAULT NULL,
  `option_aboutsite_avatar` varchar(255) DEFAULT NULL,
  `option_aboutsite_title` varchar(255) DEFAULT NULL,
  `option_aboutsite_content` varchar(255) DEFAULT NULL,
  `option_aboutsite_wechat` varchar(255) DEFAULT NULL,
  `option_aboutsite_qq` varchar(255) DEFAULT NULL,
  `option_aboutsite_github` varchar(255) DEFAULT NULL,
  `option_aboutsite_weibo` varchar(255) DEFAULT NULL,
  `option_tongji` varchar(255) DEFAULT NULL,
  `option_status` int(1) DEFAULT '1',
  PRIMARY KEY (`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
--  Table structure for `page`
-- ----------------------------
DROP TABLE IF EXISTS `page`;
CREATE TABLE `page` (
  `page_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `page_key` varchar(50) DEFAULT NULL,
  `page_title` varchar(50) DEFAULT NULL,
  `page_content` mediumtext,
  `page_create_time` datetime DEFAULT NULL,
  `page_update_time` datetime DEFAULT NULL,
  `page_view_count` int(10) unsigned DEFAULT '0',
  `page_comment_count` int(5) unsigned DEFAULT '0',
  `page_status` int(1) unsigned DEFAULT '1',
  PRIMARY KEY (`page_id`),
  UNIQUE KEY `page_key` (`page_key`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `tag`
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag` (
  `tag_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(50) DEFAULT NULL,
  `tag_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`tag_id`),
  UNIQUE KEY `tag_name` (`tag_name`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;



-- ----------------------------
--  Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) NOT NULL DEFAULT '',
  `user_pass` varchar(255) NOT NULL DEFAULT '',
  `user_nickname` varchar(255) NOT NULL DEFAULT '',
  `user_email` varchar(100) DEFAULT '',
  `user_url` varchar(100) DEFAULT '',
  `user_avatar` varchar(255) DEFAULT NULL,
  `user_last_login_ip` varchar(255) DEFAULT NULL,
  `user_register_time` datetime DEFAULT NULL,
  `user_last_login_time` datetime DEFAULT NULL,
  `user_status` int(1) unsigned DEFAULT '1',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_name` (`user_name`),
  UNIQUE KEY `user_email` (`user_email`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS = 1;