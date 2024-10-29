# ************************************************************
# Sequel Ace SQL dump
# Version 20071
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# Host: 127.0.0.1 (MySQL 8.3.0)
# Database: clearfixlabsDB
# Generation Time: 2024-08-30 12:56:18 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE='NO_AUTO_VALUE_ON_ZERO', SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table exp_actions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_actions`;

CREATE TABLE `exp_actions` (
  `action_id` int unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `csrf_exempt` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`action_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_actions` WRITE;
/*!40000 ALTER TABLE `exp_actions` DISABLE KEYS */;

INSERT INTO `exp_actions` (`action_id`, `class`, `method`, `csrf_exempt`)
VALUES
	(1,'Channel','submit_entry',0),
	(2,'Channel','smiley_pop',0),
	(3,'Channel','combo_loader',0),
	(4,'Channel','live_preview',1),
	(5,'Comment','insert_new_comment',0),
	(6,'Comment_mcp','delete_comment_notification',0),
	(7,'Comment','comment_subscribe',0),
	(8,'Comment','edit_comment',0),
	(9,'Consent','grantConsent',0),
	(10,'Consent','submitConsent',0),
	(11,'Consent','withdrawConsent',0),
	(12,'Member','registration_form',0),
	(13,'Member','register_member',0),
	(14,'Member','activate_member',0),
	(15,'Member','member_login',0),
	(16,'Member','member_logout',0),
	(17,'Member','send_reset_token',0),
	(18,'Member','process_reset_password',0),
	(19,'Member','send_member_email',0),
	(20,'Member','update_un_pw',0),
	(21,'Member','do_member_search',0),
	(22,'Member','member_delete',0),
	(23,'Member','send_username',0),
	(24,'Member','update_profile',0),
	(25,'Member','upload_avatar',0),
	(26,'Member','recaptcha_check',1),
	(27,'Member','validate',0),
	(28,'Rte','pages_autocomplete',0),
	(29,'File','addonIcon',1),
	(30,'Relationship','entryList',0),
	(31,'Search','do_search',1),
	(32,'Pro','setCookie',0),
	(33,'Pro','qrCode',0),
	(34,'Pro','validateMfa',0),
	(35,'Pro','invokeMfa',0),
	(36,'Pro','enableMfa',0),
	(37,'Pro','disableMfa',0),
	(38,'Pro','resetMfa',0),
	(39,'Structure','ajax_move_set_data',0),
	(40,'Pro_variables','sync',0),
	(41,'Pro_search','catch_search',1),
	(42,'Pro_search','build_index',0),
	(43,'Pro_search','save_search',0),
	(44,'Bloqs_mcp','fetch_template_code',0);

/*!40000 ALTER TABLE `exp_actions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_blocks_atom
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_blocks_atom`;

CREATE TABLE `exp_blocks_atom` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `block_id` bigint NOT NULL,
  `atomdefinition_id` bigint NOT NULL,
  `data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_blocks_atom_blockid_atomdefinitionid` (`block_id`,`atomdefinition_id`),
  KEY `fk_blocks_atom_block` (`atomdefinition_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_blocks_atom` WRITE;
/*!40000 ALTER TABLE `exp_blocks_atom` DISABLE KEYS */;

INSERT INTO `exp_blocks_atom` (`id`, `block_id`, `atomdefinition_id`, `data`)
VALUES
	(1,1,9,'check'),
	(2,1,10,'{\"1\":{\"col_id_1\":\"\"},\"2\":{\"col_id_1\":\"\"}}'),
	(5,2,15,'Digital marketing solutions made with heart.'),
	(6,3,6,'creative'),
	(7,4,16,'{file:1:url}'),
	(8,5,2,''),
	(9,6,5,''),
	(10,7,8,'<p>Headline</p>'),
	(11,8,18,''),
	(12,9,17,''),
	(13,10,5,''),
	(14,11,16,''),
	(24,12,17,''),
	(25,13,5,''),
	(26,14,16,''),
	(33,15,18,''),
	(34,16,2,''),
	(35,17,5,''),
	(36,18,8,'');

/*!40000 ALTER TABLE `exp_blocks_atom` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_blocks_atomdefinition
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_blocks_atomdefinition`;

CREATE TABLE `exp_blocks_atomdefinition` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `blockdefinition_id` bigint NOT NULL,
  `shortname` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `instructions` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `fk_blocks_atomdefinition_blockdefinition` (`blockdefinition_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_blocks_atomdefinition` WRITE;
/*!40000 ALTER TABLE `exp_blocks_atomdefinition` DISABLE KEYS */;

INSERT INTO `exp_blocks_atomdefinition` (`id`, `blockdefinition_id`, `shortname`, `name`, `instructions`, `order`, `type`, `settings`)
VALUES
	(2,2,'headline','Title','',1,'text','{\"field_maxl\":\"256\",\"field_fmt\":\"none\",\"field_text_direction\":\"ltr\",\"field_content_type\":\"all\",\"col_required\":\"n\",\"col_search\":\"n\"}'),
	(5,3,'headline_text','Headline Text','',1,'text','{\"field_maxl\":\"256\",\"col_required\":\"n\",\"field_text_direction\":\"ltr\",\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"col_search\":\"n\"}'),
	(6,4,'subhead_text','Subhead Text','',1,'text','{\"field_maxl\":\"256\",\"col_required\":\"n\",\"field_text_direction\":\"ltr\",\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"col_search\":\"n\"}'),
	(7,5,'description_text','Description Text','',1,'textarea','{\"field_show_file_selector\":\"\",\"db_column_type\":\"text\",\"field_show_smileys\":\"n\",\"field_show_formatting_btns\":\"\",\"field_ta_rows\":\"6\",\"field_fmt\":\"none\",\"field_text_direction\":\"ltr\",\"col_required\":\"n\",\"col_search\":\"n\"}'),
	(8,6,'copy_text','Copy Text','',1,'rte','{\"toolset_id\":\"3\",\"defer\":\"n\",\"db_column_type\":\"mediumtext\",\"col_required\":\"n\",\"col_search\":\"n\"}'),
	(9,7,'bullet_style','Bullet Style','',1,'select','{\"field_fmt\":\"none\",\"field_pre_populate\":\"v\",\"field_list_items\":\"\",\"value_label_pairs\":{\"check-circle\":\"Check Circle\",\"check\":\"Check\",\"plus-circle\":\"Plus Circle\",\"plus\":\"Plus\",\"arrow\":\"Arrow\"},\"col_required\":\"n\",\"col_search\":\"n\"}'),
	(10,7,'bullet','Bullet','',2,'simple_grid','{\"columns\":{\"1\":{\"col_type\":\"text\",\"col_name\":\"bullet_text\",\"col_label\":\"Bullet Text\",\"col_required\":\"0\",\"col_settings\":\"\"}},\"field_fmt\":\"none\",\"field_show_fmt\":\"n\",\"field_wide\":true,\"min_rows\":\"0\",\"max_rows\":\"99\",\"allow_heading_rows\":\"n\",\"vertical_layout\":\"n\",\"col_required\":\"n\",\"col_search\":\"n\"}'),
	(11,8,'text','Text','',1,'simple_grid','{\"columns\":{\"1\":{\"col_type\":\"text\",\"col_name\":\"text_field\",\"col_label\":\"Text Field\",\"col_required\":\"0\",\"col_settings\":\"\"}},\"field_fmt\":\"none\",\"field_show_fmt\":\"n\",\"field_wide\":true,\"min_rows\":\"0\",\"max_rows\":\"99\",\"allow_heading_rows\":\"n\",\"vertical_layout\":\"n\",\"col_required\":\"n\",\"col_search\":\"n\"}'),
	(12,9,'quote','Quote','',1,'text','{\"field_maxl\":\"256\",\"field_fmt\":\"none\",\"field_text_direction\":\"ltr\",\"field_content_type\":\"all\",\"col_required\":\"n\",\"col_search\":\"n\"}'),
	(13,9,'citation','Citation','',2,'text','{\"field_maxl\":\"256\",\"field_fmt\":\"none\",\"field_text_direction\":\"ltr\",\"field_content_type\":\"all\",\"col_required\":\"n\",\"col_search\":\"n\"}'),
	(14,9,'image','Image','',3,'file','{\"field_content_type\":\"image\",\"allowed_directories\":\"4\",\"show_existing\":\"y\",\"num_existing\":\"50\",\"field_fmt\":\"none\",\"col_required\":\"n\",\"col_search\":\"n\"}'),
	(15,10,'headline','Headline','',1,'text','{\"field_maxl\":\"256\",\"field_fmt\":\"none\",\"field_text_direction\":\"ltr\",\"field_content_type\":\"all\",\"col_required\":\"n\",\"col_search\":\"n\"}'),
	(16,11,'hero_image','Hero Image','',1,'file','{\"field_content_type\":\"all\",\"allowed_directories\":\"4\",\"show_existing\":\"y\",\"num_existing\":\"50\",\"field_fmt\":\"none\",\"col_required\":\"n\",\"col_search\":\"n\"}'),
	(17,12,'title','Title','',1,'text','{\"field_maxl\":\"256\",\"field_fmt\":\"none\",\"field_text_direction\":\"ltr\",\"field_content_type\":\"all\",\"col_required\":\"n\",\"col_search\":\"n\"}'),
	(18,13,'image','Image','',1,'file','{\"field_content_type\":\"all\",\"allowed_directories\":\"all\",\"show_existing\":\"y\",\"num_existing\":\"50\",\"field_fmt\":\"none\",\"col_required\":\"n\",\"col_search\":\"n\"}');

/*!40000 ALTER TABLE `exp_blocks_atomdefinition` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_blocks_block
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_blocks_block`;

CREATE TABLE `exp_blocks_block` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `blockdefinition_id` bigint NOT NULL,
  `entry_id` int NOT NULL,
  `field_id` int NOT NULL,
  `order` int NOT NULL DEFAULT '0',
  `parent_id` int DEFAULT '0',
  `draft` int DEFAULT '0',
  `depth` int DEFAULT '0',
  `lft` int DEFAULT '0',
  `rgt` int DEFAULT '0',
  `componentdefinition_id` int NOT NULL,
  `cloneable` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_blocks_blockdefinition_block` (`blockdefinition_id`),
  KEY `ix_blocks_block_siteid_entryid_fieldid` (`entry_id`,`field_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_blocks_block` WRITE;
/*!40000 ALTER TABLE `exp_blocks_block` DISABLE KEYS */;

INSERT INTO `exp_blocks_block` (`id`, `blockdefinition_id`, `entry_id`, `field_id`, `order`, `parent_id`, `draft`, `depth`, `lft`, `rgt`, `componentdefinition_id`, `cloneable`)
VALUES
	(1,7,1,12,1,0,0,0,1,2,0,0),
	(2,10,7,17,1,0,0,0,1,6,10,0),
	(3,4,7,17,2,2,0,1,2,3,10,0),
	(4,11,7,17,3,2,0,1,4,5,10,0),
	(5,2,4,12,1,0,0,0,1,6,2,0),
	(6,3,4,12,2,5,0,1,2,3,2,0),
	(7,6,4,12,3,5,0,1,4,5,2,0),
	(8,13,4,17,1,0,0,0,1,2,0,0),
	(9,12,8,17,1,0,0,0,1,6,12,0),
	(10,3,8,17,2,9,0,1,2,3,12,0),
	(11,11,8,17,3,9,0,1,4,5,12,0),
	(12,12,9,17,1,0,0,0,1,6,12,0),
	(13,3,9,17,2,12,0,1,2,3,12,0),
	(14,11,9,17,3,12,0,1,4,5,12,0),
	(15,13,10,17,1,0,0,0,1,2,0,0),
	(16,2,10,18,1,0,0,0,1,6,2,0),
	(17,3,10,18,2,16,0,1,2,3,2,0),
	(18,6,10,18,3,16,0,1,4,5,2,0);

/*!40000 ALTER TABLE `exp_blocks_block` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_blocks_blockdefinition
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_blocks_blockdefinition`;

CREATE TABLE `exp_blocks_blockdefinition` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int DEFAULT '0',
  `shortname` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `instructions` text COLLATE utf8mb4_unicode_ci,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `preview_image` text COLLATE utf8mb4_unicode_ci,
  `preview_icon` text COLLATE utf8mb4_unicode_ci,
  `deprecated` int NOT NULL DEFAULT '0',
  `deprecated_note` text COLLATE utf8mb4_unicode_ci,
  `is_editable` int NOT NULL DEFAULT '0',
  `is_component` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_blocks_blockdefinition` WRITE;
/*!40000 ALTER TABLE `exp_blocks_blockdefinition` DISABLE KEYS */;

INSERT INTO `exp_blocks_blockdefinition` (`id`, `group_id`, `shortname`, `name`, `instructions`, `settings`, `preview_image`, `preview_icon`, `deprecated`, `deprecated_note`, `is_editable`, `is_component`)
VALUES
	(2,1,'text_group','Text Group','','{\"nesting\":{\"root\":\"any\",\"child_of\":[],\"no_children\":\"n\",\"exact_children\":0,\"min_children\":0,\"max_children\":0}}','','',0,'',1,1),
	(3,0,'headline','Headline','','{\"nesting\":{\"root\":\"any\",\"child_of\":null,\"no_children\":\"n\",\"exact_children\":0,\"min_children\":0,\"max_children\":0}}','','heading fas',0,'',0,0),
	(4,0,'subhead','Subhead','','{\"nesting\":{\"root\":\"any\",\"child_of\":null,\"no_children\":\"n\",\"exact_children\":0,\"min_children\":0,\"max_children\":0}}','','',0,'',0,0),
	(5,0,'description','Description','','{\"nesting\":{\"root\":\"any\",\"child_of\":[],\"no_children\":\"n\",\"exact_children\":0,\"min_children\":0,\"max_children\":0}}','','',0,'',0,0),
	(6,0,'copy','Copy','','{\"nesting\":{\"root\":\"any\",\"child_of\":[],\"no_children\":\"n\",\"exact_children\":0,\"min_children\":0,\"max_children\":0}}','','',0,'',0,0),
	(7,3,'list_builder','List Builder','','{\"nesting\":{\"root\":\"any\",\"child_of\":[],\"no_children\":\"n\",\"exact_children\":0,\"min_children\":0,\"max_children\":0}}','','list-ul fas',0,'',0,0),
	(8,0,'text_scroll','Text Scroll','','{\"nesting\":{\"root\":\"any\",\"child_of\":[],\"no_children\":\"n\",\"exact_children\":0,\"min_children\":0,\"max_children\":0}}','','',0,'',0,0),
	(9,2,'big_quote','Big Quote','','{\"nesting\":{\"root\":\"any\",\"child_of\":[],\"no_children\":\"n\",\"exact_children\":0,\"min_children\":0,\"max_children\":0}}','','bullhorn fas',0,'',0,0),
	(10,5,'hero-home','Hero Home','','{\"nesting\":{\"root\":\"any\",\"child_of\":[],\"no_children\":\"n\",\"exact_children\":0,\"min_children\":0,\"max_children\":0}}','','',0,'',0,1),
	(11,0,'image','Image','','{\"nesting\":{\"root\":\"any\",\"child_of\":[],\"no_children\":\"n\",\"exact_children\":0,\"min_children\":0,\"max_children\":0}}','','',0,'',0,0),
	(12,5,'hero-standard','Hero Standard','','{\"nesting\":{\"root\":\"any\",\"child_of\":[],\"no_children\":\"n\",\"exact_children\":0,\"min_children\":0,\"max_children\":0}}','','',0,'',0,1),
	(13,5,'hero-blog','Hero Blog','','{\"nesting\":{\"root\":\"any\",\"child_of\":[],\"no_children\":\"n\",\"exact_children\":0,\"min_children\":0,\"max_children\":0}}','','',0,'',0,0);

/*!40000 ALTER TABLE `exp_blocks_blockdefinition` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_blocks_blockfieldusage
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_blocks_blockfieldusage`;

CREATE TABLE `exp_blocks_blockfieldusage` (
  `id` int NOT NULL AUTO_INCREMENT,
  `field_id` int NOT NULL,
  `blockdefinition_id` bigint NOT NULL,
  `order` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_blocks_blockfieldusage_fieldid_blockdefinitionid` (`field_id`,`blockdefinition_id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_blocks_blockfieldusage` WRITE;
/*!40000 ALTER TABLE `exp_blocks_blockfieldusage` DISABLE KEYS */;

INSERT INTO `exp_blocks_blockfieldusage` (`id`, `field_id`, `blockdefinition_id`, `order`)
VALUES
	(1,12,2,0),
	(3,12,7,1),
	(4,12,6,2),
	(5,12,5,3),
	(6,12,3,4),
	(7,12,4,5),
	(20,12,9,6),
	(21,12,8,7),
	(30,17,13,0),
	(31,17,10,1),
	(32,17,12,2),
	(36,18,2,0),
	(37,18,7,1),
	(38,18,9,2),
	(39,18,11,3),
	(40,18,8,4);

/*!40000 ALTER TABLE `exp_blocks_blockfieldusage` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_blocks_blockgroup
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_blocks_blockgroup`;

CREATE TABLE `exp_blocks_blockgroup` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order` int NOT NULL DEFAULT '0',
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_blocks_blockgroup` WRITE;
/*!40000 ALTER TABLE `exp_blocks_blockgroup` DISABLE KEYS */;

INSERT INTO `exp_blocks_blockgroup` (`id`, `order`, `name`)
VALUES
	(1,2,'Basic Content'),
	(2,0,'Page Blocks'),
	(3,1,'Inline Content'),
	(4,0,'Dynamic Blocks'),
	(5,9,'Hero Group');

/*!40000 ALTER TABLE `exp_blocks_blockgroup` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_blocks_components
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_blocks_components`;

CREATE TABLE `exp_blocks_components` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `blockdefinition_id` bigint NOT NULL,
  `componentdefinition_id` int NOT NULL,
  `order` int NOT NULL DEFAULT '0',
  `parent_id` int NOT NULL DEFAULT '0',
  `depth` int NOT NULL DEFAULT '0',
  `lft` int NOT NULL DEFAULT '0',
  `rgt` int NOT NULL DEFAULT '0',
  `cloneable` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_blocks_components` WRITE;
/*!40000 ALTER TABLE `exp_blocks_components` DISABLE KEYS */;

INSERT INTO `exp_blocks_components` (`id`, `blockdefinition_id`, `componentdefinition_id`, `order`, `parent_id`, `depth`, `lft`, `rgt`, `cloneable`)
VALUES
	(1,2,2,1,0,0,1,10,0),
	(2,3,2,2,1,1,2,3,0),
	(3,4,2,3,1,1,4,5,0),
	(4,5,2,4,1,1,6,7,0),
	(5,6,2,5,1,1,8,9,0),
	(25,10,10,1,0,0,1,6,0),
	(26,4,10,2,25,1,2,3,0),
	(27,11,10,3,25,1,4,5,0),
	(28,12,12,1,0,0,1,6,0),
	(29,3,12,2,28,1,2,3,0),
	(30,11,12,3,28,1,4,5,0);

/*!40000 ALTER TABLE `exp_blocks_components` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_blocks_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_blocks_log`;

CREATE TABLE `exp_blocks_log` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int unsigned DEFAULT NULL,
  `field_id` int unsigned DEFAULT NULL,
  `member_id` int unsigned DEFAULT NULL,
  `updated_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_blocks_settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_blocks_settings`;

CREATE TABLE `exp_blocks_settings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int unsigned DEFAULT '1',
  `key` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `val` text COLLATE utf8mb4_unicode_ci,
  `type` char(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_blocks_settings` WRITE;
/*!40000 ALTER TABLE `exp_blocks_settings` DISABLE KEYS */;

INSERT INTO `exp_blocks_settings` (`id`, `site_id`, `key`, `val`, `type`)
VALUES
	(1,1,'installed_date','1720106251','string'),
	(2,1,'installed_version','5.0.14','string'),
	(3,1,'installed_build','68efc879','string'),
	(4,1,'license','dd4751973e0aec3d7bbd61b9','string');

/*!40000 ALTER TABLE `exp_blocks_settings` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_captcha
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_captcha`;

CREATE TABLE `exp_captcha` (
  `captcha_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `date` int unsigned NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `word` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`captcha_id`),
  KEY `word` (`word`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_categories`;

CREATE TABLE `exp_categories` (
  `cat_id` int unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int unsigned NOT NULL DEFAULT '1',
  `group_id` int unsigned NOT NULL,
  `parent_id` int unsigned NOT NULL,
  `cat_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cat_url_title` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cat_description` text COLLATE utf8mb4_unicode_ci,
  `cat_image` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cat_order` int unsigned NOT NULL,
  PRIMARY KEY (`cat_id`),
  KEY `group_id` (`group_id`),
  KEY `parent_id` (`parent_id`),
  KEY `cat_name` (`cat_name`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_category_field_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_category_field_data`;

CREATE TABLE `exp_category_field_data` (
  `cat_id` int unsigned NOT NULL,
  `site_id` int unsigned NOT NULL DEFAULT '1',
  `group_id` int unsigned NOT NULL,
  PRIMARY KEY (`cat_id`),
  KEY `site_id` (`site_id`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_category_fields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_category_fields`;

CREATE TABLE `exp_category_fields` (
  `field_id` int unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int unsigned NOT NULL DEFAULT '1',
  `group_id` int unsigned NOT NULL,
  `field_name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `field_label` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `field_type` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text',
  `field_list_items` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_maxl` smallint NOT NULL DEFAULT '128',
  `field_ta_rows` tinyint NOT NULL DEFAULT '8',
  `field_default_fmt` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `field_show_fmt` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `field_text_direction` char(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ltr',
  `field_required` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `field_order` int unsigned NOT NULL,
  `field_settings` text COLLATE utf8mb4_unicode_ci,
  `legacy_field_data` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  PRIMARY KEY (`field_id`),
  KEY `site_id` (`site_id`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_category_group_settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_category_group_settings`;

CREATE TABLE `exp_category_group_settings` (
  `category_group_settings_id` int unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int unsigned NOT NULL DEFAULT '1',
  `channel_id` int unsigned NOT NULL DEFAULT '1',
  `group_id` int unsigned NOT NULL DEFAULT '1',
  `cat_required` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `cat_allow_multiple` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  PRIMARY KEY (`category_group_settings_id`),
  KEY `channel_id_group_id` (`channel_id`,`group_id`),
  KEY `site_id` (`site_id`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_category_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_category_groups`;

CREATE TABLE `exp_category_groups` (
  `group_id` int unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int unsigned NOT NULL DEFAULT '1',
  `group_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'a',
  `exclude_group` tinyint unsigned NOT NULL DEFAULT '0',
  `field_html_formatting` char(4) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'all',
  `can_edit_categories` text COLLATE utf8mb4_unicode_ci,
  `can_delete_categories` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_category_posts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_category_posts`;

CREATE TABLE `exp_category_posts` (
  `entry_id` int unsigned NOT NULL,
  `cat_id` int unsigned NOT NULL,
  PRIMARY KEY (`entry_id`,`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_channel_category_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_channel_category_groups`;

CREATE TABLE `exp_channel_category_groups` (
  `channel_id` int unsigned NOT NULL,
  `group_id` int unsigned NOT NULL,
  PRIMARY KEY (`channel_id`,`group_id`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_channel_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_channel_data`;

CREATE TABLE `exp_channel_data` (
  `entry_id` int unsigned NOT NULL,
  `site_id` int unsigned NOT NULL DEFAULT '1',
  `channel_id` int unsigned NOT NULL,
  PRIMARY KEY (`entry_id`),
  KEY `channel_id` (`channel_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_channel_data` WRITE;
/*!40000 ALTER TABLE `exp_channel_data` DISABLE KEYS */;

INSERT INTO `exp_channel_data` (`entry_id`, `site_id`, `channel_id`)
VALUES
	(1,1,1),
	(2,1,1),
	(3,1,1),
	(4,1,1),
	(5,1,1),
	(6,1,1),
	(7,1,6),
	(8,1,6),
	(9,1,6),
	(10,1,3);

/*!40000 ALTER TABLE `exp_channel_data` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_channel_data_field_11
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_channel_data_field_11`;

CREATE TABLE `exp_channel_data_field_11` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int unsigned NOT NULL,
  `field_id_11` text COLLATE utf8mb4_unicode_ci,
  `field_ft_11` tinytext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_channel_data_field_12
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_channel_data_field_12`;

CREATE TABLE `exp_channel_data_field_12` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int unsigned NOT NULL,
  `field_id_12` text COLLATE utf8mb4_unicode_ci,
  `field_ft_12` tinytext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_channel_data_field_12` WRITE;
/*!40000 ALTER TABLE `exp_channel_data_field_12` DISABLE KEYS */;

INSERT INTO `exp_channel_data_field_12` (`id`, `entry_id`, `field_id_12`, `field_ft_12`)
VALUES
	(1,1,' ','xhtml'),
	(2,4,' ','xhtml'),
	(3,6,NULL,'xhtml');

/*!40000 ALTER TABLE `exp_channel_data_field_12` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_channel_data_field_13
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_channel_data_field_13`;

CREATE TABLE `exp_channel_data_field_13` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int unsigned NOT NULL,
  `field_id_13` tinyint NOT NULL DEFAULT '0',
  `field_ft_13` tinytext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_channel_data_field_13` WRITE;
/*!40000 ALTER TABLE `exp_channel_data_field_13` DISABLE KEYS */;

INSERT INTO `exp_channel_data_field_13` (`id`, `entry_id`, `field_id_13`, `field_ft_13`)
VALUES
	(1,1,0,'xhtml'),
	(2,7,0,'xhtml');

/*!40000 ALTER TABLE `exp_channel_data_field_13` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_channel_data_field_14
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_channel_data_field_14`;

CREATE TABLE `exp_channel_data_field_14` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int unsigned NOT NULL,
  `field_id_14` text COLLATE utf8mb4_unicode_ci,
  `field_ft_14` tinytext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_channel_data_field_14` WRITE;
/*!40000 ALTER TABLE `exp_channel_data_field_14` DISABLE KEYS */;

INSERT INTO `exp_channel_data_field_14` (`id`, `entry_id`, `field_id_14`, `field_ft_14`)
VALUES
	(1,7,'Home','none'),
	(2,8,'Work - List','none'),
	(3,9,'Blog - list','none');

/*!40000 ALTER TABLE `exp_channel_data_field_14` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_channel_data_field_16
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_channel_data_field_16`;

CREATE TABLE `exp_channel_data_field_16` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int unsigned NOT NULL,
  `field_id_16` text COLLATE utf8mb4_unicode_ci,
  `field_ft_16` tinytext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_channel_data_field_17
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_channel_data_field_17`;

CREATE TABLE `exp_channel_data_field_17` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int unsigned NOT NULL,
  `field_id_17` text COLLATE utf8mb4_unicode_ci,
  `field_ft_17` tinytext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_channel_data_field_17` WRITE;
/*!40000 ALTER TABLE `exp_channel_data_field_17` DISABLE KEYS */;

INSERT INTO `exp_channel_data_field_17` (`id`, `entry_id`, `field_id_17`, `field_ft_17`)
VALUES
	(1,7,' ','xhtml'),
	(2,4,' ','xhtml'),
	(3,6,NULL,'xhtml'),
	(4,8,' ','xhtml'),
	(5,9,' ','xhtml'),
	(6,10,' ','xhtml');

/*!40000 ALTER TABLE `exp_channel_data_field_17` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_channel_data_field_18
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_channel_data_field_18`;

CREATE TABLE `exp_channel_data_field_18` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int unsigned NOT NULL,
  `field_id_18` text COLLATE utf8mb4_unicode_ci,
  `field_ft_18` tinytext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_channel_data_field_18` WRITE;
/*!40000 ALTER TABLE `exp_channel_data_field_18` DISABLE KEYS */;

INSERT INTO `exp_channel_data_field_18` (`id`, `entry_id`, `field_id_18`, `field_ft_18`)
VALUES
	(1,10,' ','xhtml');

/*!40000 ALTER TABLE `exp_channel_data_field_18` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_channel_data_field_19
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_channel_data_field_19`;

CREATE TABLE `exp_channel_data_field_19` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int unsigned NOT NULL,
  `field_id_19` text COLLATE utf8mb4_unicode_ci,
  `field_ft_19` tinytext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_channel_data_field_19` WRITE;
/*!40000 ALTER TABLE `exp_channel_data_field_19` DISABLE KEYS */;

INSERT INTO `exp_channel_data_field_19` (`id`, `entry_id`, `field_id_19`, `field_ft_19`)
VALUES
	(1,7,'','none');

/*!40000 ALTER TABLE `exp_channel_data_field_19` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_channel_data_field_2
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_channel_data_field_2`;

CREATE TABLE `exp_channel_data_field_2` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int unsigned NOT NULL,
  `field_id_2` text COLLATE utf8mb4_unicode_ci,
  `field_ft_2` tinytext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_channel_data_field_2` WRITE;
/*!40000 ALTER TABLE `exp_channel_data_field_2` DISABLE KEYS */;

INSERT INTO `exp_channel_data_field_2` (`id`, `entry_id`, `field_id_2`, `field_ft_2`)
VALUES
	(1,1,'','none'),
	(2,7,'','none');

/*!40000 ALTER TABLE `exp_channel_data_field_2` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_channel_data_field_20
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_channel_data_field_20`;

CREATE TABLE `exp_channel_data_field_20` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int unsigned NOT NULL,
  `field_id_20` text COLLATE utf8mb4_unicode_ci,
  `field_ft_20` tinytext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_channel_data_field_20` WRITE;
/*!40000 ALTER TABLE `exp_channel_data_field_20` DISABLE KEYS */;

INSERT INTO `exp_channel_data_field_20` (`id`, `entry_id`, `field_id_20`, `field_ft_20`)
VALUES
	(1,7,'','none');

/*!40000 ALTER TABLE `exp_channel_data_field_20` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_channel_data_field_21
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_channel_data_field_21`;

CREATE TABLE `exp_channel_data_field_21` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int unsigned NOT NULL,
  `field_id_21` text COLLATE utf8mb4_unicode_ci,
  `field_ft_21` tinytext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_channel_data_field_21` WRITE;
/*!40000 ALTER TABLE `exp_channel_data_field_21` DISABLE KEYS */;

INSERT INTO `exp_channel_data_field_21` (`id`, `entry_id`, `field_id_21`, `field_ft_21`)
VALUES
	(1,7,'','none');

/*!40000 ALTER TABLE `exp_channel_data_field_21` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_channel_data_field_22
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_channel_data_field_22`;

CREATE TABLE `exp_channel_data_field_22` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int unsigned NOT NULL,
  `field_id_22` text COLLATE utf8mb4_unicode_ci,
  `field_ft_22` tinytext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_channel_data_field_22` WRITE;
/*!40000 ALTER TABLE `exp_channel_data_field_22` DISABLE KEYS */;

INSERT INTO `exp_channel_data_field_22` (`id`, `entry_id`, `field_id_22`, `field_ft_22`)
VALUES
	(1,7,'','none');

/*!40000 ALTER TABLE `exp_channel_data_field_22` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_channel_data_field_23
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_channel_data_field_23`;

CREATE TABLE `exp_channel_data_field_23` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int unsigned NOT NULL,
  `field_id_23` text COLLATE utf8mb4_unicode_ci,
  `field_ft_23` tinytext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_channel_data_field_23` WRITE;
/*!40000 ALTER TABLE `exp_channel_data_field_23` DISABLE KEYS */;

INSERT INTO `exp_channel_data_field_23` (`id`, `entry_id`, `field_id_23`, `field_ft_23`)
VALUES
	(1,7,'','none');

/*!40000 ALTER TABLE `exp_channel_data_field_23` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_channel_data_field_24
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_channel_data_field_24`;

CREATE TABLE `exp_channel_data_field_24` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int unsigned NOT NULL,
  `field_id_24` text COLLATE utf8mb4_unicode_ci,
  `field_ft_24` tinytext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_channel_data_field_24` WRITE;
/*!40000 ALTER TABLE `exp_channel_data_field_24` DISABLE KEYS */;

INSERT INTO `exp_channel_data_field_24` (`id`, `entry_id`, `field_id_24`, `field_ft_24`)
VALUES
	(1,7,'','none');

/*!40000 ALTER TABLE `exp_channel_data_field_24` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_channel_data_field_25
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_channel_data_field_25`;

CREATE TABLE `exp_channel_data_field_25` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int unsigned NOT NULL,
  `field_id_25` text COLLATE utf8mb4_unicode_ci,
  `field_ft_25` tinytext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_channel_data_field_25` WRITE;
/*!40000 ALTER TABLE `exp_channel_data_field_25` DISABLE KEYS */;

INSERT INTO `exp_channel_data_field_25` (`id`, `entry_id`, `field_id_25`, `field_ft_25`)
VALUES
	(1,7,'','none');

/*!40000 ALTER TABLE `exp_channel_data_field_25` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_channel_data_field_26
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_channel_data_field_26`;

CREATE TABLE `exp_channel_data_field_26` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int unsigned NOT NULL,
  `field_id_26` text COLLATE utf8mb4_unicode_ci,
  `field_ft_26` tinytext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_channel_data_field_26` WRITE;
/*!40000 ALTER TABLE `exp_channel_data_field_26` DISABLE KEYS */;

INSERT INTO `exp_channel_data_field_26` (`id`, `entry_id`, `field_id_26`, `field_ft_26`)
VALUES
	(1,7,'','none');

/*!40000 ALTER TABLE `exp_channel_data_field_26` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_channel_data_field_27
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_channel_data_field_27`;

CREATE TABLE `exp_channel_data_field_27` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int unsigned NOT NULL,
  `field_id_27` text COLLATE utf8mb4_unicode_ci,
  `field_ft_27` tinytext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_channel_data_field_27` WRITE;
/*!40000 ALTER TABLE `exp_channel_data_field_27` DISABLE KEYS */;

INSERT INTO `exp_channel_data_field_27` (`id`, `entry_id`, `field_id_27`, `field_ft_27`)
VALUES
	(1,7,'','none');

/*!40000 ALTER TABLE `exp_channel_data_field_27` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_channel_data_field_28
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_channel_data_field_28`;

CREATE TABLE `exp_channel_data_field_28` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int unsigned NOT NULL,
  `field_id_28` text COLLATE utf8mb4_unicode_ci,
  `field_ft_28` tinytext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_channel_data_field_28` WRITE;
/*!40000 ALTER TABLE `exp_channel_data_field_28` DISABLE KEYS */;

INSERT INTO `exp_channel_data_field_28` (`id`, `entry_id`, `field_id_28`, `field_ft_28`)
VALUES
	(1,7,'','none');

/*!40000 ALTER TABLE `exp_channel_data_field_28` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_channel_data_field_29
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_channel_data_field_29`;

CREATE TABLE `exp_channel_data_field_29` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int unsigned NOT NULL,
  `field_id_29` text COLLATE utf8mb4_unicode_ci,
  `field_ft_29` tinytext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_channel_data_field_29` WRITE;
/*!40000 ALTER TABLE `exp_channel_data_field_29` DISABLE KEYS */;

INSERT INTO `exp_channel_data_field_29` (`id`, `entry_id`, `field_id_29`, `field_ft_29`)
VALUES
	(1,7,'','none');

/*!40000 ALTER TABLE `exp_channel_data_field_29` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_channel_data_field_3
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_channel_data_field_3`;

CREATE TABLE `exp_channel_data_field_3` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int unsigned NOT NULL,
  `field_id_3` text COLLATE utf8mb4_unicode_ci,
  `field_ft_3` tinytext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_channel_data_field_30
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_channel_data_field_30`;

CREATE TABLE `exp_channel_data_field_30` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int unsigned NOT NULL,
  `field_id_30` text COLLATE utf8mb4_unicode_ci,
  `field_ft_30` tinytext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_channel_data_field_30` WRITE;
/*!40000 ALTER TABLE `exp_channel_data_field_30` DISABLE KEYS */;

INSERT INTO `exp_channel_data_field_30` (`id`, `entry_id`, `field_id_30`, `field_ft_30`)
VALUES
	(1,7,'','none');

/*!40000 ALTER TABLE `exp_channel_data_field_30` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_channel_data_field_4
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_channel_data_field_4`;

CREATE TABLE `exp_channel_data_field_4` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int unsigned NOT NULL,
  `field_id_4` text COLLATE utf8mb4_unicode_ci,
  `field_ft_4` tinytext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_channel_data_field_5
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_channel_data_field_5`;

CREATE TABLE `exp_channel_data_field_5` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int unsigned NOT NULL,
  `field_id_5` text COLLATE utf8mb4_unicode_ci,
  `field_ft_5` tinytext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_channel_data_field_5` WRITE;
/*!40000 ALTER TABLE `exp_channel_data_field_5` DISABLE KEYS */;

INSERT INTO `exp_channel_data_field_5` (`id`, `entry_id`, `field_id_5`, `field_ft_5`)
VALUES
	(1,1,'','none'),
	(2,7,'','none');

/*!40000 ALTER TABLE `exp_channel_data_field_5` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_channel_data_field_6
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_channel_data_field_6`;

CREATE TABLE `exp_channel_data_field_6` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int unsigned NOT NULL,
  `field_id_6` text COLLATE utf8mb4_unicode_ci,
  `field_ft_6` tinytext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_channel_data_field_7
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_channel_data_field_7`;

CREATE TABLE `exp_channel_data_field_7` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int unsigned NOT NULL,
  `field_id_7` text COLLATE utf8mb4_unicode_ci,
  `field_ft_7` tinytext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_channel_data_field_8
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_channel_data_field_8`;

CREATE TABLE `exp_channel_data_field_8` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int unsigned NOT NULL,
  `field_id_8` text COLLATE utf8mb4_unicode_ci,
  `field_ft_8` tinytext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_channel_entries_autosave
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_channel_entries_autosave`;

CREATE TABLE `exp_channel_entries_autosave` (
  `entry_id` int unsigned NOT NULL AUTO_INCREMENT,
  `original_entry_id` int unsigned NOT NULL,
  `site_id` int unsigned NOT NULL DEFAULT '1',
  `channel_id` int unsigned NOT NULL,
  `author_id` int unsigned NOT NULL DEFAULT '0',
  `forum_topic_id` int unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url_title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `versioning_enabled` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `view_count_one` int unsigned NOT NULL DEFAULT '0',
  `view_count_two` int unsigned NOT NULL DEFAULT '0',
  `view_count_three` int unsigned NOT NULL DEFAULT '0',
  `view_count_four` int unsigned NOT NULL DEFAULT '0',
  `allow_comments` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `sticky` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `entry_date` int NOT NULL,
  `year` char(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `month` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `day` char(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration_date` int NOT NULL DEFAULT '0',
  `comment_expiration_date` int NOT NULL DEFAULT '0',
  `edit_date` bigint DEFAULT NULL,
  `recent_comment_date` int DEFAULT NULL,
  `comment_total` int unsigned NOT NULL DEFAULT '0',
  `entry_data` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`entry_id`),
  KEY `channel_id` (`channel_id`),
  KEY `author_id` (`author_id`),
  KEY `url_title` (`url_title`(191)),
  KEY `status` (`status`),
  KEY `entry_date` (`entry_date`),
  KEY `expiration_date` (`expiration_date`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_channel_entries_autosave` WRITE;
/*!40000 ALTER TABLE `exp_channel_entries_autosave` DISABLE KEYS */;

INSERT INTO `exp_channel_entries_autosave` (`entry_id`, `original_entry_id`, `site_id`, `channel_id`, `author_id`, `forum_topic_id`, `ip_address`, `title`, `url_title`, `status`, `versioning_enabled`, `view_count_one`, `view_count_two`, `view_count_three`, `view_count_four`, `allow_comments`, `sticky`, `entry_date`, `year`, `month`, `day`, `expiration_date`, `comment_expiration_date`, `edit_date`, `recent_comment_date`, `comment_total`, `entry_data`)
VALUES
	(6,0,1,6,1,NULL,'0','Blog','blog','open','n',0,0,0,0,'y','n',0,'0','0','0',0,0,1720118486,NULL,0,'{\"title\":\"Blog\",\"url_title\":\"blog\",\"field_id_2\":\"\",\"field_id_5\":\"\",\"field_id_13\":\"0\",\"field_id_14\":\"\",\"entry_date\":\"7\\/4\\/2024 6:41 PM\",\"expiration_date\":\"\",\"channel_id\":\"6\",\"status\":\"open\",\"author_id\":\"1\",\"structure__hidden\":\"n\",\"structure__listing_channel\":\"\",\"structure__parent_id\":\"0\",\"structure__template_id\":\"0\",\"structure__uri\":\"blog\",\"field_id_17\":{\"tree_order\":\"[]\",\"blocks_new_block_0\":{\"values\":{\"col_id_18\":\"\",\"col_id_15\":\"\",\"col_id_6\":\"\",\"col_id_16\":\"\",\"col_id_17\":\"\",\"col_id_5\":\"\"},\"blockDefinitionId\":\"3\",\"order\":\"0\",\"draft\":\"0\",\"cloneable\":\"0\",\"componentDefinitionId\":\"12\"}},\"version_number\":\"\",\"bloqsFormSecret_17_0\":\"c6d6352a12ec5ce0f652f20b6bd116e8\"}'),
	(11,0,1,4,1,NULL,'0','autosave_1720118537','autosave_1720118537','open','n',0,0,0,0,'y','n',0,'0','0','0',0,0,1720118537,NULL,0,'{\"title\":\"\",\"url_title\":\"\",\"entry_date\":\"7\\/4\\/2024 6:42 PM\",\"expiration_date\":\"\",\"channel_id\":\"4\",\"status\":\"open\",\"author_id\":\"1\",\"structure__uri\":\"\",\"structure__template_id\":\"0\"}'),
	(12,0,1,3,1,NULL,'0','Testing the blog out here','testing-the-blog-out-here','open','n',0,0,0,0,'y','n',0,'0','0','0',0,0,1720118752,NULL,0,'{\"title\":\"Testing the blog out here\",\"url_title\":\"testing-the-blog-out-here\",\"field_id_17\":{\"blocks_new_block_1\":{\"values\":{\"col_id_18\":\"\"},\"blockDefinitionId\":\"13\",\"order\":\"1\",\"draft\":\"0\",\"cloneable\":\"0\"},\"tree_order\":\"[{\\\"id\\\":\\\"blocks_new_block_1\\\",\\\"name\\\":\\\"Blog Hero\\\",\\\"definition_id\\\":13,\\\"parent_id\\\":null,\\\"parent_definition_id\\\":null,\\\"depth\\\":0,\\\"lft\\\":1,\\\"rgt\\\":2}]\",\"blocks_new_block_0\":{\"values\":{\"col_id_18\":\"\",\"col_id_15\":\"\",\"col_id_6\":\"\",\"col_id_16\":\"\",\"col_id_17\":\"\",\"col_id_5\":\"\"},\"blockDefinitionId\":\"3\",\"order\":\"11\",\"draft\":\"0\",\"cloneable\":\"0\",\"componentDefinitionId\":\"12\"}},\"version_number\":\"\",\"bloqsFormSecret_17_0\":\"cf0b113ccc428aba5db449c2f595b740\",\"field_id_18\":{\"tree_order\":\"[]\",\"blocks_new_block_0\":{\"values\":{\"col_id_2\":\"\",\"col_id_5\":\"\",\"col_id_6\":\"\",\"col_id_7\":\"\",\"col_id_8\":\"\",\"col_id_9\":\"\",\"col_id_12\":\"\",\"col_id_13\":\"\",\"col_id_14\":\"\",\"col_id_16\":\"\"},\"blockDefinitionId\":\"6\",\"order\":\"0\",\"draft\":\"0\",\"cloneable\":\"0\",\"componentDefinitionId\":\"2\"}},\"bloqsFormSecret_18_0\":\"0896e41edd7841bcbb1d24ef24e5affe\",\"entry_date\":\"7\\/4\\/2024 6:45 PM\",\"expiration_date\":\"\",\"channel_id\":\"3\",\"status\":\"open\",\"author_id\":\"1\",\"structure__uri\":\"testing-the-blog-out-here\",\"structure__template_id\":\"0\"}');

/*!40000 ALTER TABLE `exp_channel_entries_autosave` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_channel_entry_hidden_fields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_channel_entry_hidden_fields`;

CREATE TABLE `exp_channel_entry_hidden_fields` (
  `entry_id` int unsigned NOT NULL,
  `field_id` int unsigned NOT NULL,
  PRIMARY KEY (`entry_id`,`field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_channel_field_groups_fields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_channel_field_groups_fields`;

CREATE TABLE `exp_channel_field_groups_fields` (
  `field_id` int unsigned NOT NULL,
  `group_id` int unsigned NOT NULL,
  PRIMARY KEY (`field_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_channel_field_groups_fields` WRITE;
/*!40000 ALTER TABLE `exp_channel_field_groups_fields` DISABLE KEYS */;

INSERT INTO `exp_channel_field_groups_fields` (`field_id`, `group_id`)
VALUES
	(2,9),
	(2,10),
	(5,9),
	(5,10),
	(5,11),
	(8,9),
	(11,7),
	(13,9),
	(13,10),
	(13,11),
	(19,12),
	(20,12),
	(21,12),
	(22,12),
	(23,12),
	(24,12),
	(25,12),
	(26,12),
	(27,12),
	(28,12),
	(29,12),
	(30,12);

/*!40000 ALTER TABLE `exp_channel_field_groups_fields` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_channel_fields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_channel_fields`;

CREATE TABLE `exp_channel_fields` (
  `field_id` int unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int unsigned DEFAULT '1',
  `field_name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_label` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_instructions` text COLLATE utf8mb4_unicode_ci,
  `field_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text',
  `field_list_items` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_pre_populate` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `field_pre_channel_id` int unsigned DEFAULT NULL,
  `field_pre_field_id` int unsigned DEFAULT NULL,
  `field_ta_rows` tinyint DEFAULT '8',
  `field_maxl` smallint DEFAULT NULL,
  `field_required` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `field_text_direction` char(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ltr',
  `field_search` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `field_is_hidden` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `field_is_conditional` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `field_fmt` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'xhtml',
  `field_show_fmt` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `field_order` int unsigned NOT NULL,
  `field_content_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'any',
  `field_settings` text COLLATE utf8mb4_unicode_ci,
  `legacy_field_data` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `enable_frontedit` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  PRIMARY KEY (`field_id`),
  KEY `field_type` (`field_type`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_channel_fields` WRITE;
/*!40000 ALTER TABLE `exp_channel_fields` DISABLE KEYS */;

INSERT INTO `exp_channel_fields` (`field_id`, `site_id`, `field_name`, `field_label`, `field_instructions`, `field_type`, `field_list_items`, `field_pre_populate`, `field_pre_channel_id`, `field_pre_field_id`, `field_ta_rows`, `field_maxl`, `field_required`, `field_text_direction`, `field_search`, `field_is_hidden`, `field_is_conditional`, `field_fmt`, `field_show_fmt`, `field_order`, `field_content_type`, `field_settings`, `legacy_field_data`, `enable_frontedit`)
VALUES
	(2,0,'headline','headline','','text','','n',NULL,NULL,8,0,'n','ltr','n','n','n','none','n',2,'all','YTo0OntzOjEwOiJmaWVsZF9tYXhsIjtzOjE6IjAiO3M6MTg6ImZpZWxkX2NvbnRlbnRfdHlwZSI7czozOiJhbGwiO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MDoiIjt9','n','y'),
	(3,0,'markdown','Markdown','','textarea','','n',NULL,NULL,0,NULL,'n','ltr','n','n','n','markdown','n',3,'any','YTo0OntzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MDoiIjtzOjE0OiJkYl9jb2x1bW5fdHlwZSI7czo0OiJ0ZXh0IjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MDoiIjt9','n','y'),
	(4,0,'rich_text','RIch Text','','rte','','n',NULL,NULL,8,NULL,'n','ltr','n','n','n','none','n',4,'any','YTo2OntzOjEwOiJ0b29sc2V0X2lkIjtzOjE6IjEiO3M6NToiZGVmZXIiO3M6MToibiI7czoxNDoiZGJfY29sdW1uX3R5cGUiO3M6NDoidGV4dCI7czoxMDoiZmllbGRfd2lkZSI7YjoxO3M6OToiZmllbGRfZm10IjtzOjQ6Im5vbmUiO3M6MTQ6ImZpZWxkX3Nob3dfZm10IjtzOjE6Im4iO30=','n','y'),
	(5,0,'image','Image','','file','','n',NULL,NULL,8,NULL,'n','ltr','n','n','n','none','y',5,'image','YTo1OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6NToiaW1hZ2UiO3M6MTk6ImFsbG93ZWRfZGlyZWN0b3JpZXMiO3M6MToiNCI7czoxMzoic2hvd19leGlzdGluZyI7czoxOiJ5IjtzOjEyOiJudW1fZXhpc3RpbmciO3M6MjoiNTAiO3M6OToiZmllbGRfZm10IjtzOjQ6Im5vbmUiO30=','n','y'),
	(6,0,'button','Button','','grid','','n',NULL,NULL,8,NULL,'n','ltr','n','n','n','xhtml','y',6,'any','YTo0OntzOjEzOiJncmlkX21pbl9yb3dzIjtpOjA7czoxMzoiZ3JpZF9tYXhfcm93cyI7czowOiIiO3M6MTM6ImFsbG93X3Jlb3JkZXIiO3M6MToieSI7czoxNToidmVydGljYWxfbGF5b3V0IjtzOjE6Im4iO30=','n','y'),
	(7,0,'description','Description','','textarea','','n',NULL,NULL,0,NULL,'n','ltr','n','n','n','none','n',7,'any','YTo0OntzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MDoiIjtzOjE0OiJkYl9jb2x1bW5fdHlwZSI7czo0OiJ0ZXh0IjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MDoiIjt9','n','y'),
	(8,0,'subhead','Subhead','','text','','n',NULL,NULL,8,0,'n','ltr','n','n','n','none','n',8,'all','YTo0OntzOjEwOiJmaWVsZF9tYXhsIjtzOjE6IjAiO3M6MTg6ImZpZWxkX2NvbnRlbnRfdHlwZSI7czozOiJhbGwiO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MDoiIjt9','n','y'),
	(11,0,'text','Text','','text','','n',NULL,NULL,8,0,'n','ltr','n','n','n','none','n',10,'all','YTo0OntzOjEwOiJmaWVsZF9tYXhsIjtzOjE6IjAiO3M6MTg6ImZpZWxkX2NvbnRlbnRfdHlwZSI7czozOiJhbGwiO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MDoiIjt9','n','y'),
	(12,0,'page_builder','Page Builder','','bloqs','','n',NULL,NULL,8,NULL,'n','ltr','n','n','n','xhtml','y',9,'any','YToxNjp7czo2OiJzdWJtaXQiO3M6NDoic2F2ZSI7czoxMDoiZmllbGRfdHlwZSI7czo1OiJibG9xcyI7czoxMToiZmllbGRfbGFiZWwiO3M6MTI6IlBhZ2UgQnVpbGRlciI7czoxODoiZmllbGRfaW5zdHJ1Y3Rpb25zIjtzOjA6IiI7czoxMjoiZmllbGRfc2VhcmNoIjtzOjE6Im4iO3M6MTU6ImZpZWxkX2lzX2hpZGRlbiI7czoxOiJuIjtzOjE2OiJlbmFibGVfZnJvbnRlZGl0IjtzOjE6InkiO3M6MjA6ImZpZWxkX2lzX2NvbmRpdGlvbmFsIjtzOjE6Im4iO3M6MTM6ImNvbmRpdGlvbl9zZXQiO2E6MTp7czo5OiJuZXdfc2V0XzEiO2E6MTp7czo1OiJtYXRjaCI7czozOiJhbGwiO319czo5OiJjb25kaXRpb24iO2E6MTp7czo5OiJuZXdfc2V0XzEiO2E6MTp7czo5OiJuZXdfcm93XzEiO2E6MTp7czoxODoiY29uZGl0aW9uX2ZpZWxkX2lkIjtzOjA6IiI7fX19czoxMToiYXV0b19leHBhbmQiO3M6MToibiI7czo4OiJuZXN0YWJsZSI7czoxOiJ5IjtzOjE3OiJtZW51X2dyaWRfZGlzcGxheSI7czoxOiJ5IjtzOjE2OiJibG9ja0RlZmluaXRpb25zIjthOjg6e2k6MDtzOjE6IjIiO2k6MTtzOjE6IjciO2k6MjtzOjE6IjYiO2k6MztzOjE6IjUiO2k6NDtzOjE6IjMiO2k6NTtzOjE6IjQiO2k6NjtzOjE6IjkiO2k6NztzOjE6IjgiO31zOjg6InRlbXBsYXRlIjtzOjE2MTA6IntleHA6Y2hhbm5lbDplbnRyaWVzIGNoYW5uZWw9InlvdXJfY2hhbm5lbF9oZXJlIn0KICAgIHtwYWdlX2J1aWxkZXJ9CiAgICAgICAge3RleHRfZ3JvdXB9CiAgICAgICAgPGRpdiBkYXRhLWJsb2NrLW5hbWU9InRleHRfZ3JvdXAiPgogICAgICAgICAgICAgICAge2hlYWRsaW5lfQogICAgICAgICAgICAgICAge2Jsb3FzOmNoaWxkcmVufQogICAgICAgIDwvZGl2PgogICAgICAgIHsvdGV4dF9ncm91cH0KCiAgICAgICAge2xpc3RfYnVpbGRlcn0KICAgICAgICA8ZGl2IGRhdGEtYmxvY2stbmFtZT0ibGlzdF9idWlsZGVyIj4KICAgICAgICAgICAgICAgIHtidWxsZXRfc3R5bGV9CiAgICAgICAgICAgICAgICB7L2J1bGxldF9zdHlsZX0KICAgICAgICAgICAgICAgIHtidWxsZXR9CiAgICAgICAgICAgICAgICB7L2J1bGxldH0KICAgICAgICAgICAgICAgIHtibG9xczpjaGlsZHJlbn0KICAgICAgICA8L2Rpdj4KICAgICAgICB7L2xpc3RfYnVpbGRlcn0KCiAgICAgICAge2JpZ19xdW90ZX0KICAgICAgICA8ZGl2IGRhdGEtYmxvY2stbmFtZT0iYmlnX3F1b3RlIj4KICAgICAgICAgICAgICAgIHtxdW90ZX0KICAgICAgICAgICAgICAgIHtjaXRhdGlvbn0KICAgICAgICAgICAgICAgIHtpbWFnZX0KICAgICAgICAgICAgICAgIHsvaW1hZ2V9CiAgICAgICAgICAgICAgICB7YmxvcXM6Y2hpbGRyZW59CiAgICAgICAgPC9kaXY+CiAgICAgICAgey9iaWdfcXVvdGV9CgogICAgICAgIHtjb3B5fQogICAgICAgIDxkaXYgZGF0YS1ibG9jay1uYW1lPSJjb3B5Ij4KICAgICAgICAgICAgICAgIHtjb3B5X3RleHR9CiAgICAgICAgICAgICAgICB7L2NvcHlfdGV4dH0KICAgICAgICAgICAgICAgIHtibG9xczpjaGlsZHJlbn0KICAgICAgICA8L2Rpdj4KICAgICAgICB7L2NvcHl9CgogICAgICAgIHtkZXNjcmlwdGlvbn0KICAgICAgICA8ZGl2IGRhdGEtYmxvY2stbmFtZT0iZGVzY3JpcHRpb24iPgogICAgICAgICAgICAgICAge2Rlc2NyaXB0aW9uX3RleHR9CiAgICAgICAgICAgICAgICB7YmxvcXM6Y2hpbGRyZW59CiAgICAgICAgPC9kaXY+CiAgICAgICAgey9kZXNjcmlwdGlvbn0KCiAgICAgICAge2hlYWRsaW5lfQogICAgICAgIDxkaXYgZGF0YS1ibG9jay1uYW1lPSJoZWFkbGluZSI+CiAgICAgICAgICAgICAgICB7aGVhZGxpbmVfdGV4dH0KICAgICAgICAgICAgICAgIHtibG9xczpjaGlsZHJlbn0KICAgICAgICA8L2Rpdj4KICAgICAgICB7L2hlYWRsaW5lfQoKICAgICAgICB7c3ViaGVhZH0KICAgICAgICA8ZGl2IGRhdGEtYmxvY2stbmFtZT0ic3ViaGVhZCI+CiAgICAgICAgICAgICAgICB7c3ViaGVhZF90ZXh0fQogICAgICAgICAgICAgICAge2Jsb3FzOmNoaWxkcmVufQogICAgICAgIDwvZGl2PgogICAgICAgIHsvc3ViaGVhZH0KCiAgICAgICAge3RleHRfc2Nyb2xsfQogICAgICAgIDxkaXYgZGF0YS1ibG9jay1uYW1lPSJ0ZXh0X3Njcm9sbCI+CiAgICAgICAgICAgICAgICB7dGV4dH0KICAgICAgICAgICAgICAgIHsvdGV4dH0KICAgICAgICAgICAgICAgIHtibG9xczpjaGlsZHJlbn0KICAgICAgICA8L2Rpdj4KICAgICAgICB7L3RleHRfc2Nyb2xsfQogICAgey9wYWdlX2J1aWxkZXJ9CnsvZXhwOmNoYW5uZWw6ZW50cmllc30KIjtzOjEwOiJmaWVsZF93aWRlIjtiOjE7fQ==','n','y'),
	(13,0,'image_overlay','Image Overlay','','toggle','','n',NULL,NULL,8,NULL,'n','ltr','n','n','n','xhtml','y',10,'any','YToxOntzOjE5OiJmaWVsZF9kZWZhdWx0X3ZhbHVlIjtzOjE6IjAiO30=','n','y'),
	(14,0,'static_template','Static Template','','select','Home\nWork - List\nBlog - list\nContact\n','n',NULL,NULL,8,NULL,'n','ltr','n','n','n','none','y',11,'any','YTowOnt9','n','y'),
	(16,0,'hero_type','Hero Type','','select','Home\nStandard\nBlog','n',NULL,NULL,8,NULL,'n','ltr','n','n','n','none','y',12,'any','YTowOnt9','n','y'),
	(17,0,'hero','Hero','','bloqs','','n',NULL,NULL,8,NULL,'n','ltr','y','n','n','xhtml','y',13,'any','YToxNzp7czo2OiJzdWJtaXQiO3M6NDoic2F2ZSI7czoxMDoiZmllbGRfdHlwZSI7czo1OiJibG9xcyI7czoxMToiZmllbGRfbGFiZWwiO3M6NDoiSGVybyI7czoxODoiZmllbGRfaW5zdHJ1Y3Rpb25zIjtzOjA6IiI7czoxMjoiZmllbGRfc2VhcmNoIjtzOjE6InkiO3M6MTU6ImZpZWxkX2lzX2hpZGRlbiI7czoxOiJuIjtzOjE2OiJlbmFibGVfZnJvbnRlZGl0IjtzOjE6InkiO3M6MjA6ImZpZWxkX2lzX2NvbmRpdGlvbmFsIjtzOjE6Im4iO3M6MTM6ImNvbmRpdGlvbl9zZXQiO2E6MTp7czo5OiJuZXdfc2V0XzEiO2E6MTp7czo1OiJtYXRjaCI7czozOiJhbGwiO319czo5OiJjb25kaXRpb24iO2E6MTp7czo5OiJuZXdfc2V0XzEiO2E6MTp7czo5OiJuZXdfcm93XzEiO2E6MTp7czoxODoiY29uZGl0aW9uX2ZpZWxkX2lkIjtzOjA6IiI7fX19czoxMToiYXV0b19leHBhbmQiO3M6MToibiI7czo4OiJuZXN0YWJsZSI7czoxOiJ5IjtzOjE3OiJtZW51X2dyaWRfZGlzcGxheSI7czoxOiJ5IjtzOjI5OiJibG9ja0RlZmluaXRpb25zX2Rpc2Fzc29jaWF0ZSI7YTo5OntpOjA7czoxOiI4IjtpOjE7czoxOiI0IjtpOjI7czoyOiIxMSI7aTozO3M6MToiMyI7aTo0O3M6MToiNSI7aTo1O3M6MToiNiI7aTo2O3M6MToiOSI7aTo3O3M6MToiNyI7aTo4O3M6MToiMiI7fXM6MTY6ImJsb2NrRGVmaW5pdGlvbnMiO2E6Mzp7aTowO3M6MjoiMTMiO2k6MTtzOjI6IjEwIjtpOjI7czoyOiIxMiI7fXM6ODoidGVtcGxhdGUiO3M6NTkxOiJ7ZXhwOmNoYW5uZWw6ZW50cmllcyBjaGFubmVsPSJ5b3VyX2NoYW5uZWxfaGVyZSJ9CiAgICB7aGVyb30KICAgICAgICB7YmxvZ19oZXJvfQogICAgICAgIDxkaXYgZGF0YS1ibG9jay1uYW1lPSJibG9nX2hlcm8iPgogICAgICAgICAgICAgICAge2ltYWdlfQogICAgICAgICAgICAgICAgey9pbWFnZX0KICAgICAgICAgICAgICAgIHtibG9xczpjaGlsZHJlbn0KICAgICAgICA8L2Rpdj4KICAgICAgICB7L2Jsb2dfaGVyb30KCiAgICAgICAge2hvbWVfaGVyb30KICAgICAgICA8ZGl2IGRhdGEtYmxvY2stbmFtZT0iaG9tZV9oZXJvIj4KICAgICAgICAgICAgICAgIHtoZWFkbGluZX0KICAgICAgICAgICAgICAgIHtibG9xczpjaGlsZHJlbn0KICAgICAgICA8L2Rpdj4KICAgICAgICB7L2hvbWVfaGVyb30KCiAgICAgICAge3BhZ2VfaGVyb30KICAgICAgICA8ZGl2IGRhdGEtYmxvY2stbmFtZT0icGFnZV9oZXJvIj4KICAgICAgICAgICAgICAgIHt0aXRsZX0KICAgICAgICAgICAgICAgIHtibG9xczpjaGlsZHJlbn0KICAgICAgICA8L2Rpdj4KICAgICAgICB7L3BhZ2VfaGVyb30KICAgIHsvaGVyb30Key9leHA6Y2hhbm5lbDplbnRyaWVzfQoiO3M6MTA6ImZpZWxkX3dpZGUiO2I6MTt9','n','y'),
	(18,0,'blog_builder','Blog Builder','','bloqs','','n',NULL,NULL,8,NULL,'n','ltr','n','n','n','xhtml','y',14,'any','YToxNzp7czo2OiJzdWJtaXQiO3M6NDoic2F2ZSI7czoxMDoiZmllbGRfdHlwZSI7czo1OiJibG9xcyI7czoxMToiZmllbGRfbGFiZWwiO3M6MTI6IkJsb2cgQnVpbGRlciI7czoxODoiZmllbGRfaW5zdHJ1Y3Rpb25zIjtzOjA6IiI7czoxMjoiZmllbGRfc2VhcmNoIjtzOjE6Im4iO3M6MTU6ImZpZWxkX2lzX2hpZGRlbiI7czoxOiJuIjtzOjE2OiJlbmFibGVfZnJvbnRlZGl0IjtzOjE6InkiO3M6MjA6ImZpZWxkX2lzX2NvbmRpdGlvbmFsIjtzOjE6Im4iO3M6MTM6ImNvbmRpdGlvbl9zZXQiO2E6MTp7czo5OiJuZXdfc2V0XzEiO2E6MTp7czo1OiJtYXRjaCI7czozOiJhbGwiO319czo5OiJjb25kaXRpb24iO2E6MTp7czo5OiJuZXdfc2V0XzEiO2E6MTp7czo5OiJuZXdfcm93XzEiO2E6MTp7czoxODoiY29uZGl0aW9uX2ZpZWxkX2lkIjtzOjA6IiI7fX19czoxMToiYXV0b19leHBhbmQiO3M6MToibiI7czo4OiJuZXN0YWJsZSI7czoxOiJ5IjtzOjE3OiJtZW51X2dyaWRfZGlzcGxheSI7czoxOiJuIjtzOjE2OiJibG9ja0RlZmluaXRpb25zIjthOjU6e2k6MDtzOjE6IjIiO2k6MTtzOjE6IjciO2k6MjtzOjE6IjkiO2k6MztzOjI6IjExIjtpOjQ7czoxOiI4Ijt9czoyOToiYmxvY2tEZWZpbml0aW9uc19kaXNhc3NvY2lhdGUiO2E6Nzp7aTowO3M6MToiNCI7aToxO3M6MToiMyI7aToyO3M6MToiNSI7aTozO3M6MToiNiI7aTo0O3M6MjoiMTIiO2k6NTtzOjI6IjEwIjtpOjY7czoyOiIxMyI7fXM6ODoidGVtcGxhdGUiO3M6NjcyOiJ7ZXhwOmNoYW5uZWw6ZW50cmllcyBjaGFubmVsPSJ5b3VyX2NoYW5uZWxfaGVyZSJ9CiAgICB7YmxvZ19idWlsZGVyfQogICAgICAgIHt0ZXh0X2dyb3VwfQogICAgICAgICAgICAgICAge2hlYWRsaW5lfQogICAgICAgIHsvdGV4dF9ncm91cH0KCiAgICAgICAge2xpc3RfYnVpbGRlcn0KICAgICAgICAgICAgICAgIHtidWxsZXRfc3R5bGV9CiAgICAgICAgICAgICAgICB7L2J1bGxldF9zdHlsZX0KICAgICAgICAgICAgICAgIHtidWxsZXR9CiAgICAgICAgICAgICAgICB7L2J1bGxldH0KICAgICAgICB7L2xpc3RfYnVpbGRlcn0KCiAgICAgICAge2JpZ19xdW90ZX0KICAgICAgICAgICAgICAgIHtxdW90ZX0KICAgICAgICAgICAgICAgIHtjaXRhdGlvbn0KICAgICAgICAgICAgICAgIHtpbWFnZX0KICAgICAgICAgICAgICAgIHsvaW1hZ2V9CiAgICAgICAgey9iaWdfcXVvdGV9CgogICAgICAgIHtpbWFnZX0KICAgICAgICAgICAgICAgIHtoZXJvX2ltYWdlfQogICAgICAgICAgICAgICAgey9oZXJvX2ltYWdlfQogICAgICAgIHsvaW1hZ2V9CgogICAgICAgIHt0ZXh0X3Njcm9sbH0KICAgICAgICAgICAgICAgIHt0ZXh0fQogICAgICAgICAgICAgICAgey90ZXh0fQogICAgICAgIHsvdGV4dF9zY3JvbGx9CiAgICB7L2Jsb2dfYnVpbGRlcn0Key9leHA6Y2hhbm5lbDplbnRyaWVzfQoiO3M6MTA6ImZpZWxkX3dpZGUiO2I6MTt9','n','y'),
	(19,0,'seo_meta_title','SEO - Meta Title','','text','','n',NULL,NULL,8,0,'n','ltr','n','n','n','none','n',15,'all','YTo0OntzOjEwOiJmaWVsZF9tYXhsIjtzOjE6IjAiO3M6MTg6ImZpZWxkX2NvbnRlbnRfdHlwZSI7czozOiJhbGwiO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MDoiIjt9','n','y'),
	(20,0,'seo_meta_author','SEO - Meta Author','','text','','n',NULL,NULL,8,0,'n','ltr','n','n','n','none','n',16,'all','YTo0OntzOjEwOiJmaWVsZF9tYXhsIjtzOjE6IjAiO3M6MTg6ImZpZWxkX2NvbnRlbnRfdHlwZSI7czozOiJhbGwiO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MDoiIjt9','n','y'),
	(21,0,'seo_meta_description','SEO - Meta Description','','text','','n',NULL,NULL,8,0,'n','ltr','n','n','n','none','n',17,'all','YTo0OntzOjEwOiJmaWVsZF9tYXhsIjtzOjE6IjAiO3M6MTg6ImZpZWxkX2NvbnRlbnRfdHlwZSI7czozOiJhbGwiO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MDoiIjt9','n','y'),
	(22,0,'seo_og_title','SEO - OG: Title','','text','','n',NULL,NULL,8,0,'n','ltr','n','n','n','none','n',18,'all','YTo0OntzOjEwOiJmaWVsZF9tYXhsIjtzOjE6IjAiO3M6MTg6ImZpZWxkX2NvbnRlbnRfdHlwZSI7czozOiJhbGwiO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MDoiIjt9','n','y'),
	(23,0,'seo_og_url','SEO - OG: URL','','text','','n',NULL,NULL,8,0,'n','ltr','n','n','n','none','n',19,'all','YTo0OntzOjEwOiJmaWVsZF9tYXhsIjtzOjE6IjAiO3M6MTg6ImZpZWxkX2NvbnRlbnRfdHlwZSI7czozOiJhbGwiO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MDoiIjt9','n','y'),
	(24,0,'seo_og_description','SEO - OG: Description','','text','','n',NULL,NULL,8,0,'n','ltr','n','n','n','none','n',20,'all','YTo0OntzOjEwOiJmaWVsZF9tYXhsIjtzOjE6IjAiO3M6MTg6ImZpZWxkX2NvbnRlbnRfdHlwZSI7czozOiJhbGwiO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MDoiIjt9','n','y'),
	(25,0,'seo_og_image','SEO - OG: Image','','file','','n',NULL,NULL,8,NULL,'n','ltr','n','n','n','none','y',21,'image','YTo1OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6NToiaW1hZ2UiO3M6MTk6ImFsbG93ZWRfZGlyZWN0b3JpZXMiO3M6MToiNCI7czoxMzoic2hvd19leGlzdGluZyI7czoxOiJ5IjtzOjEyOiJudW1fZXhpc3RpbmciO3M6MjoiNTAiO3M6OToiZmllbGRfZm10IjtzOjQ6Im5vbmUiO30=','n','y'),
	(26,0,'seo_twitter_title','SEO - Twitter: Title','','text','','n',NULL,NULL,8,0,'n','ltr','n','n','n','none','n',22,'all','YTo0OntzOjEwOiJmaWVsZF9tYXhsIjtzOjE6IjAiO3M6MTg6ImZpZWxkX2NvbnRlbnRfdHlwZSI7czozOiJhbGwiO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MDoiIjt9','n','y'),
	(27,0,'seo_twitter_description','SEO - Twitter: Description','','text','','n',NULL,NULL,8,0,'n','ltr','n','n','n','none','n',23,'all','YTo0OntzOjEwOiJmaWVsZF9tYXhsIjtzOjE6IjAiO3M6MTg6ImZpZWxkX2NvbnRlbnRfdHlwZSI7czozOiJhbGwiO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MDoiIjt9','n','y'),
	(28,0,'seo_twitter_image','SEO - Twitter: Image','','file','','n',NULL,NULL,8,NULL,'n','ltr','n','n','n','none','y',24,'all','YTo1OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE5OiJhbGxvd2VkX2RpcmVjdG9yaWVzIjtzOjM6ImFsbCI7czoxMzoic2hvd19leGlzdGluZyI7czoxOiJ5IjtzOjEyOiJudW1fZXhpc3RpbmciO3M6MjoiNTAiO3M6OToiZmllbGRfZm10IjtzOjQ6Im5vbmUiO30=','n','y'),
	(29,0,'seo_twitter_url','SEO - Twitter: URL','','text','','n',NULL,NULL,8,0,'n','ltr','n','n','n','none','n',25,'all','YTo0OntzOjEwOiJmaWVsZF9tYXhsIjtzOjE6IjAiO3M6MTg6ImZpZWxkX2NvbnRlbnRfdHlwZSI7czozOiJhbGwiO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MDoiIjt9','n','y'),
	(30,0,'seo_twitter_creator','SEO - Twitter: Creator','','text','','n',NULL,NULL,8,0,'n','ltr','n','n','n','none','n',26,'all','YTo0OntzOjEwOiJmaWVsZF9tYXhsIjtzOjE6IjAiO3M6MTg6ImZpZWxkX2NvbnRlbnRfdHlwZSI7czozOiJhbGwiO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MDoiIjt9','n','y');

/*!40000 ALTER TABLE `exp_channel_fields` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_channel_form_settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_channel_form_settings`;

CREATE TABLE `exp_channel_form_settings` (
  `channel_form_settings_id` int unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int unsigned NOT NULL DEFAULT '0',
  `channel_id` int unsigned NOT NULL DEFAULT '0',
  `default_status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `allow_guest_posts` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `default_author` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`channel_form_settings_id`),
  KEY `site_id` (`site_id`),
  KEY `channel_id` (`channel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_channel_form_settings` WRITE;
/*!40000 ALTER TABLE `exp_channel_form_settings` DISABLE KEYS */;

INSERT INTO `exp_channel_form_settings` (`channel_form_settings_id`, `site_id`, `channel_id`, `default_status`, `allow_guest_posts`, `default_author`)
VALUES
	(1,1,1,'','n',1),
	(2,1,2,'','n',1),
	(3,1,3,'','n',1),
	(4,1,4,'','n',1),
	(5,1,5,'','n',1),
	(6,1,6,'','n',1);

/*!40000 ALTER TABLE `exp_channel_form_settings` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_channel_grid_field_6
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_channel_grid_field_6`;

CREATE TABLE `exp_channel_grid_field_6` (
  `row_id` int unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int unsigned DEFAULT NULL,
  `row_order` int unsigned DEFAULT NULL,
  `fluid_field_data_id` int unsigned DEFAULT '0',
  `col_id_1` text COLLATE utf8mb4_unicode_ci,
  `col_id_2` text COLLATE utf8mb4_unicode_ci,
  `col_id_3` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`row_id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_channel_member_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_channel_member_roles`;

CREATE TABLE `exp_channel_member_roles` (
  `role_id` int unsigned NOT NULL,
  `channel_id` int unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_channel_titles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_channel_titles`;

CREATE TABLE `exp_channel_titles` (
  `entry_id` int unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int unsigned NOT NULL DEFAULT '1',
  `channel_id` int unsigned NOT NULL,
  `author_id` int unsigned NOT NULL DEFAULT '0',
  `forum_topic_id` int unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url_title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_id` int unsigned NOT NULL,
  `versioning_enabled` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `view_count_one` int unsigned NOT NULL DEFAULT '0',
  `view_count_two` int unsigned NOT NULL DEFAULT '0',
  `view_count_three` int unsigned NOT NULL DEFAULT '0',
  `view_count_four` int unsigned NOT NULL DEFAULT '0',
  `allow_comments` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `sticky` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `entry_date` int NOT NULL,
  `year` char(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `month` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `day` char(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration_date` int NOT NULL DEFAULT '0',
  `comment_expiration_date` int NOT NULL DEFAULT '0',
  `edit_date` bigint DEFAULT NULL,
  `recent_comment_date` int DEFAULT NULL,
  `comment_total` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry_id`),
  KEY `channel_id` (`channel_id`),
  KEY `author_id` (`author_id`),
  KEY `url_title` (`url_title`(191)),
  KEY `status` (`status`),
  KEY `entry_date` (`entry_date`),
  KEY `expiration_date` (`expiration_date`),
  KEY `site_id` (`site_id`),
  KEY `sticky_date_id_idx` (`sticky`,`entry_date`,`entry_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_channel_titles` WRITE;
/*!40000 ALTER TABLE `exp_channel_titles` DISABLE KEYS */;

INSERT INTO `exp_channel_titles` (`entry_id`, `site_id`, `channel_id`, `author_id`, `forum_topic_id`, `ip_address`, `title`, `url_title`, `status`, `status_id`, `versioning_enabled`, `view_count_one`, `view_count_two`, `view_count_three`, `view_count_four`, `allow_comments`, `sticky`, `entry_date`, `year`, `month`, `day`, `expiration_date`, `comment_expiration_date`, `edit_date`, `recent_comment_date`, `comment_total`)
VALUES
	(1,1,1,1,NULL,'127.0.0.1','Home','home','closed',2,'n',0,0,0,0,'y','n',1720033740,'2024','07','03',0,0,1720112083,NULL,0),
	(2,1,1,1,NULL,'127.0.0.1','Agency','agency','open',1,'n',0,0,0,0,'y','n',1720033800,'2024','07','03',0,0,1720037074,NULL,0),
	(3,1,1,1,NULL,'127.0.0.1','Services','services','open',1,'n',0,0,0,0,'y','n',1720033800,'2024','07','03',0,0,1720033828,NULL,0),
	(4,1,1,1,NULL,'127.0.0.1','Blog','blog','closed',2,'n',0,0,0,0,'y','n',1720033800,'2024','07','03',0,0,1720117907,NULL,0),
	(5,1,1,1,NULL,'127.0.0.1','Contact','contact','open',1,'n',0,0,0,0,'y','n',1720033860,'2024','07','03',0,0,1720033887,NULL,0),
	(6,1,1,1,NULL,'127.0.0.1','Work','work','closed',2,'n',0,0,0,0,'y','n',1720033860,'2024','07','03',0,0,1720034253,NULL,0),
	(7,1,6,1,NULL,'127.0.0.1','Home','home','open',1,'n',0,0,0,0,'y','n',1720112460,'2024','07','04',0,0,1720122908,NULL,0),
	(8,1,6,1,NULL,'127.0.0.1','Work','work','open',1,'n',0,0,0,0,'y','n',1720118280,'2024','07','04',0,0,1720118405,NULL,0),
	(9,1,6,1,NULL,'127.0.0.1','Blog','blog','open',1,'n',0,0,0,0,'y','n',1720118460,'2024','07','04',0,0,1720118519,NULL,0),
	(10,1,3,1,NULL,'127.0.0.1','Testing the blog out here','testing-the-blog-out-here','open',1,'n',0,0,0,0,'y','n',1720118700,'2024','07','04',0,0,1720118775,NULL,0);

/*!40000 ALTER TABLE `exp_channel_titles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_channels
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_channels`;

CREATE TABLE `exp_channels` (
  `channel_id` int unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int unsigned NOT NULL DEFAULT '1',
  `channel_name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `channel_title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `channel_url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `channel_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_lang` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_entries` mediumint NOT NULL DEFAULT '0',
  `total_records` mediumint unsigned NOT NULL DEFAULT '0',
  `total_comments` mediumint NOT NULL DEFAULT '0',
  `last_entry_date` int unsigned NOT NULL DEFAULT '0',
  `last_comment_date` int unsigned NOT NULL DEFAULT '0',
  `cat_group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deft_status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `search_excerpt` int unsigned DEFAULT NULL,
  `deft_category` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deft_comments` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `channel_require_membership` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `channel_max_chars` int unsigned DEFAULT NULL,
  `channel_html_formatting` char(4) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'all',
  `channel_allow_img_urls` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `channel_auto_link_urls` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `channel_notify` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `channel_notify_emails` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sticky_enabled` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `enable_entry_cloning` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `comment_url` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment_system_enabled` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `comment_require_membership` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `comment_moderate` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `comment_max_chars` int unsigned DEFAULT '5000',
  `comment_timelock` int unsigned NOT NULL DEFAULT '0',
  `comment_require_email` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `comment_text_formatting` char(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'xhtml',
  `comment_html_formatting` char(4) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'safe',
  `comment_allow_img_urls` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `comment_auto_link_urls` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `comment_notify` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `comment_notify_authors` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `comment_notify_emails` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment_expiration` int unsigned NOT NULL DEFAULT '0',
  `search_results_url` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rss_url` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enable_versioning` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `max_revisions` smallint unsigned NOT NULL DEFAULT '10',
  `default_entry_title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_field_label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Title',
  `title_field_instructions` text COLLATE utf8mb4_unicode_ci,
  `url_title_prefix` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enforce_auto_url_title` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `preview_url` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `allow_preview` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `max_entries` int unsigned NOT NULL DEFAULT '0',
  `conditional_sync_required` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  PRIMARY KEY (`channel_id`),
  KEY `cat_group` (`cat_group`(191)),
  KEY `channel_name` (`channel_name`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_channels` WRITE;
/*!40000 ALTER TABLE `exp_channels` DISABLE KEYS */;

INSERT INTO `exp_channels` (`channel_id`, `site_id`, `channel_name`, `channel_title`, `channel_url`, `channel_description`, `channel_lang`, `total_entries`, `total_records`, `total_comments`, `last_entry_date`, `last_comment_date`, `cat_group`, `deft_status`, `search_excerpt`, `deft_category`, `deft_comments`, `channel_require_membership`, `channel_max_chars`, `channel_html_formatting`, `channel_allow_img_urls`, `channel_auto_link_urls`, `channel_notify`, `channel_notify_emails`, `sticky_enabled`, `enable_entry_cloning`, `comment_url`, `comment_system_enabled`, `comment_require_membership`, `comment_moderate`, `comment_max_chars`, `comment_timelock`, `comment_require_email`, `comment_text_formatting`, `comment_html_formatting`, `comment_allow_img_urls`, `comment_auto_link_urls`, `comment_notify`, `comment_notify_authors`, `comment_notify_emails`, `comment_expiration`, `search_results_url`, `rss_url`, `enable_versioning`, `max_revisions`, `default_entry_title`, `title_field_label`, `title_field_instructions`, `url_title_prefix`, `enforce_auto_url_title`, `preview_url`, `allow_preview`, `max_entries`, `conditional_sync_required`)
VALUES
	(1,1,'default_page','Default Page','http://dev-clearfixlabs.test/index.php','','en',3,6,0,1720033860,0,'','open',12,'','y','y',NULL,'all','y','n','n','','n','y','','y','n','n',5000,0,'y','xhtml','safe','n','y','n','n','',0,'','','n',10,'','Title','','','n','Managed by Structure - Changes here will not have any effect','y',0,'n'),
	(2,1,'clients','Clients','http://dev-clearfixlabs.test/index.php','','en',0,0,0,0,0,'','open',NULL,'','y','y',NULL,'all','y','n','n','','n','y','','y','n','n',5000,0,'y','xhtml','safe','n','y','n','n','',0,'','','n',10,'','Title','','','n',NULL,'y',0,'n'),
	(3,1,'blog','Blog','http://dev-clearfixlabs.test/index.php','','en',1,1,0,1720118700,0,'','open',17,'','y','y',NULL,'all','y','n','n','','n','y','','y','n','n',5000,0,'y','xhtml','safe','n','y','n','n','',0,'','','n',10,'','Title','','','n','Managed by Structure - Changes here will not have any effect','y',0,'n'),
	(4,1,'work','Work','http://dev-clearfixlabs.test/index.php','','en',0,0,0,0,0,'','open',NULL,'','y','y',NULL,'all','y','n','n','','n','y','','y','n','n',5000,0,'y','xhtml','safe','n','y','n','n','',0,'','','n',10,'','Title','','','n','Managed by Structure - Changes here will not have any effect','y',0,'n'),
	(5,1,'testimonials','Testimonials','http://dev-clearfixlabs.test/index.php','','en',0,0,0,0,0,'','open',NULL,'','y','y',NULL,'all','y','n','n','','n','y','','y','n','n',5000,0,'y','xhtml','safe','n','y','n','n','',0,'','','n',10,'','Title','','','n',NULL,'y',0,'n'),
	(6,1,'static','Static','http://dev-clearfixlabs.test/index.php','','en',3,3,0,1720118460,0,'','open',2,'','y','y',NULL,'all','y','n','n','','n','y','','y','n','n',5000,0,'y','xhtml','safe','n','y','n','n','',0,'','','n',10,'','Title','','','n','Managed by Structure - Changes here will not have any effect','y',0,'n');

/*!40000 ALTER TABLE `exp_channels` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_channels_channel_field_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_channels_channel_field_groups`;

CREATE TABLE `exp_channels_channel_field_groups` (
  `channel_id` int unsigned NOT NULL,
  `group_id` int unsigned NOT NULL,
  PRIMARY KEY (`channel_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_channels_channel_field_groups` WRITE;
/*!40000 ALTER TABLE `exp_channels_channel_field_groups` DISABLE KEYS */;

INSERT INTO `exp_channels_channel_field_groups` (`channel_id`, `group_id`)
VALUES
	(6,12);

/*!40000 ALTER TABLE `exp_channels_channel_field_groups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_channels_channel_fields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_channels_channel_fields`;

CREATE TABLE `exp_channels_channel_fields` (
  `channel_id` int unsigned NOT NULL,
  `field_id` int unsigned NOT NULL,
  PRIMARY KEY (`channel_id`,`field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_channels_channel_fields` WRITE;
/*!40000 ALTER TABLE `exp_channels_channel_fields` DISABLE KEYS */;

INSERT INTO `exp_channels_channel_fields` (`channel_id`, `field_id`)
VALUES
	(1,12),
	(1,17),
	(3,17),
	(3,18),
	(6,14),
	(6,17);

/*!40000 ALTER TABLE `exp_channels_channel_fields` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_channels_statuses
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_channels_statuses`;

CREATE TABLE `exp_channels_statuses` (
  `channel_id` int unsigned NOT NULL,
  `status_id` int unsigned NOT NULL,
  PRIMARY KEY (`channel_id`,`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_channels_statuses` WRITE;
/*!40000 ALTER TABLE `exp_channels_statuses` DISABLE KEYS */;

INSERT INTO `exp_channels_statuses` (`channel_id`, `status_id`)
VALUES
	(1,1),
	(1,2),
	(2,1),
	(2,2),
	(3,1),
	(3,2),
	(4,1),
	(4,2),
	(5,1),
	(5,2),
	(6,1),
	(6,2);

/*!40000 ALTER TABLE `exp_channels_statuses` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_comment_subscriptions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_comment_subscriptions`;

CREATE TABLE `exp_comment_subscriptions` (
  `subscription_id` int unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int unsigned DEFAULT NULL,
  `member_id` int DEFAULT '0',
  `email` varchar(75) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subscription_date` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notification_sent` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'n',
  `hash` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`subscription_id`),
  KEY `entry_id_member_id` (`entry_id`,`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_comments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_comments`;

CREATE TABLE `exp_comments` (
  `comment_id` int unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int DEFAULT '1',
  `entry_id` int unsigned DEFAULT '0',
  `channel_id` int unsigned DEFAULT '1',
  `author_id` int unsigned DEFAULT '0',
  `status` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(75) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(75) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment_date` int DEFAULT NULL,
  `edit_date` int DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`comment_id`),
  KEY `entry_id_channel_id_author_id_status_site_id` (`entry_id`,`channel_id`,`author_id`,`status`,`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_config
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_config`;

CREATE TABLE `exp_config` (
  `config_id` int unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int unsigned NOT NULL DEFAULT '0',
  `key` varchar(64) NOT NULL DEFAULT '',
  `value` text,
  PRIMARY KEY (`config_id`),
  KEY `site_key` (`site_id`,`key`)
) ENGINE=InnoDB AUTO_INCREMENT=168 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `exp_config` WRITE;
/*!40000 ALTER TABLE `exp_config` DISABLE KEYS */;

INSERT INTO `exp_config` (`config_id`, `site_id`, `key`, `value`)
VALUES
	(1,1,'is_site_on','y'),
	(2,1,'base_url','http://dev-clearfixlabs.test/'),
	(3,1,'base_path','/Users/jon/Herd/dev-clearfixlabs/'),
	(4,1,'site_index','index.php'),
	(5,1,'site_url','{base_url}'),
	(6,1,'cp_url','{base_url}admin.php'),
	(7,1,'theme_folder_url','{base_url}themes/'),
	(8,1,'theme_folder_path','{base_path}themes/'),
	(9,1,'webmaster_email','jon@clearfixlabs.com'),
	(10,1,'webmaster_name',''),
	(11,1,'channel_nomenclature','channel'),
	(12,1,'max_caches','150'),
	(13,1,'captcha_url','{base_url}images/captchas/'),
	(14,1,'captcha_path','{base_path}images/captchas/'),
	(15,1,'captcha_font','y'),
	(16,1,'captcha_rand','y'),
	(17,1,'captcha_require_members','n'),
	(18,1,'require_captcha','n'),
	(19,1,'enable_sql_caching','n'),
	(20,1,'force_query_string','n'),
	(21,1,'show_profiler','n'),
	(22,1,'include_seconds','n'),
	(23,1,'cookie_domain',''),
	(24,1,'cookie_path','/'),
	(25,1,'cookie_httponly','y'),
	(26,1,'website_session_type','c'),
	(27,1,'cp_session_type','c'),
	(28,1,'allow_username_change','y'),
	(29,1,'allow_multi_logins','y'),
	(30,1,'password_lockout','y'),
	(31,1,'password_lockout_interval','1'),
	(32,1,'require_ip_for_login','y'),
	(33,1,'require_ip_for_posting','y'),
	(34,1,'password_security_policy','basic'),
	(35,1,'allow_dictionary_pw','y'),
	(36,1,'name_of_dictionary_file','dictionary.txt'),
	(37,1,'xss_clean_uploads','y'),
	(38,1,'redirect_method','redirect'),
	(39,1,'deft_lang','english'),
	(40,1,'xml_lang','en'),
	(41,1,'send_headers','y'),
	(42,1,'gzip_output','n'),
	(43,1,'default_site_timezone',''),
	(44,1,'date_format','%n/%j/%Y'),
	(45,1,'time_format','12'),
	(46,1,'week_start','sunday'),
	(47,1,'mail_protocol','mail'),
	(48,1,'email_newline','\\n'),
	(49,1,'smtp_server',''),
	(50,1,'smtp_username',''),
	(51,1,'smtp_password',''),
	(52,1,'email_smtp_crypto','ssl'),
	(53,1,'email_debug','n'),
	(54,1,'email_charset','utf-8'),
	(55,1,'email_batchmode','n'),
	(56,1,'email_batch_size',''),
	(57,1,'mail_format','plain'),
	(58,1,'word_wrap','y'),
	(59,1,'email_console_timelock','5'),
	(60,1,'log_email_console_msgs','y'),
	(61,1,'log_search_terms','y'),
	(62,1,'deny_duplicate_data','y'),
	(63,1,'redirect_submitted_links','n'),
	(64,1,'enable_censoring','n'),
	(65,1,'censored_words',''),
	(66,1,'censor_replacement',''),
	(67,1,'banned_ips',''),
	(68,1,'banned_emails',''),
	(69,1,'banned_usernames',''),
	(70,1,'banned_screen_names',''),
	(71,1,'ban_action','restrict'),
	(72,1,'ban_message','This site is currently unavailable'),
	(73,1,'ban_destination','http://www.yahoo.com/'),
	(74,1,'enable_emoticons','y'),
	(75,1,'emoticon_url','{base_url}images/smileys/'),
	(76,1,'recount_batch_total','1000'),
	(77,1,'new_version_check','y'),
	(78,1,'enable_throttling','n'),
	(79,1,'banish_masked_ips','y'),
	(80,1,'max_page_loads','10'),
	(81,1,'time_interval','8'),
	(82,1,'lockout_time','30'),
	(83,1,'banishment_type','message'),
	(84,1,'banishment_url',''),
	(85,1,'banishment_message','You have exceeded the allowed page load frequency.'),
	(86,1,'enable_search_log','y'),
	(87,1,'max_logged_searches','500'),
	(88,1,'un_min_len','4'),
	(89,1,'pw_min_len','5'),
	(90,1,'allow_member_registration','n'),
	(91,1,'allow_member_localization','y'),
	(92,1,'req_mbr_activation','email'),
	(93,1,'registration_auto_login','y'),
	(94,1,'activation_auto_login','n'),
	(95,1,'activation_redirect',''),
	(96,1,'new_member_notification','n'),
	(97,1,'mbr_notification_emails',''),
	(98,1,'require_terms_of_service','y'),
	(99,1,'default_primary_role','5'),
	(100,1,'profile_trigger','member1720033133'),
	(101,1,'member_theme','default'),
	(102,1,'avatar_url','{base_url}images/avatars/'),
	(103,1,'avatar_path','{base_path}images/avatars/'),
	(104,1,'avatar_max_width','100'),
	(105,1,'avatar_max_height','100'),
	(106,1,'avatar_max_kb','50'),
	(107,1,'enable_photos','n'),
	(108,1,'photo_url','{base_url}images/member_photos/'),
	(109,1,'photo_path','/'),
	(110,1,'photo_max_width','100'),
	(111,1,'photo_max_height','100'),
	(112,1,'photo_max_kb','50'),
	(113,1,'allow_signatures','y'),
	(114,1,'sig_maxlength','500'),
	(115,1,'sig_allow_img_hotlink','n'),
	(116,1,'sig_allow_img_upload','n'),
	(117,1,'sig_img_url','{base_url}images/signature_attachments/'),
	(118,1,'sig_img_path','{base_path}images/signature_attachments/'),
	(119,1,'sig_img_max_width','480'),
	(120,1,'sig_img_max_height','80'),
	(121,1,'sig_img_max_kb','30'),
	(122,1,'prv_msg_enabled','y'),
	(123,1,'prv_msg_allow_attachments','y'),
	(124,1,'prv_msg_upload_path','{base_path}images/pm_attachments/'),
	(125,1,'prv_msg_max_attachments','3'),
	(126,1,'prv_msg_attach_maxsize','250'),
	(127,1,'prv_msg_attach_total','100'),
	(128,1,'prv_msg_html_format','safe'),
	(129,1,'prv_msg_auto_links','y'),
	(130,1,'prv_msg_max_chars','6000'),
	(131,1,'memberlist_order_by','member_id'),
	(132,1,'memberlist_sort_order','desc'),
	(133,1,'memberlist_row_limit','20'),
	(134,1,'site_404',''),
	(135,1,'save_tmpl_revisions','n'),
	(136,1,'max_tmpl_revisions','5'),
	(137,1,'strict_urls','y'),
	(138,1,'enable_template_routes','y'),
	(139,1,'image_resize_protocol','gd2'),
	(140,1,'image_library_path',''),
	(141,1,'word_separator','dash'),
	(142,1,'use_category_name','n'),
	(143,1,'reserved_category_word','category'),
	(144,1,'auto_convert_high_ascii','n'),
	(145,1,'new_posts_clear_caches','y'),
	(146,1,'auto_assign_cat_parents','y'),
	(147,0,'cache_driver','file'),
	(148,0,'cookie_prefix',''),
	(149,0,'debug','1'),
	(150,0,'file_manager_compatibility_mode','n'),
	(151,0,'is_system_on','y'),
	(152,0,'cli_enabled','y'),
	(153,0,'legacy_member_data','n'),
	(154,0,'legacy_channel_data','n'),
	(155,0,'legacy_category_field_data','n'),
	(156,0,'enable_dock','y'),
	(157,0,'enable_frontedit','y'),
	(158,0,'automatic_frontedit_links','y'),
	(159,0,'enable_mfa','y'),
	(160,0,'autosave_interval_seconds','10'),
	(161,0,'search_reindex_needed','1720112000'),
	(162,1,'site_license_key',''),
	(163,0,'multiple_sites_enabled','n'),
	(164,1,'show_ee_news','y'),
	(165,1,'rte_default_toolset','1'),
	(166,1,'rte_file_browser','filepicker'),
	(167,1,'rte_custom_ckeditor_build','y');

/*!40000 ALTER TABLE `exp_config` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_consent_audit_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_consent_audit_log`;

CREATE TABLE `exp_consent_audit_log` (
  `consent_audit_id` int unsigned NOT NULL AUTO_INCREMENT,
  `consent_request_id` int unsigned NOT NULL,
  `consent_request_version_id` int unsigned DEFAULT NULL,
  `member_id` int unsigned NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `user_agent` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `log_date` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`consent_audit_id`),
  KEY `consent_request_id` (`consent_request_id`),
  KEY `consent_request_version_id` (`consent_request_version_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_consent_request_version_cookies
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_consent_request_version_cookies`;

CREATE TABLE `exp_consent_request_version_cookies` (
  `consent_request_version_cookies_id` int unsigned NOT NULL AUTO_INCREMENT,
  `consent_request_version_id` int unsigned NOT NULL,
  `cookie_id` int unsigned NOT NULL,
  PRIMARY KEY (`consent_request_version_cookies_id`),
  KEY `consent_request_version_cookies` (`consent_request_version_id`,`cookie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_consent_request_versions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_consent_request_versions`;

CREATE TABLE `exp_consent_request_versions` (
  `consent_request_version_id` int unsigned NOT NULL AUTO_INCREMENT,
  `consent_request_id` int unsigned NOT NULL,
  `request` mediumtext COLLATE utf8mb4_unicode_ci,
  `request_format` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `create_date` int NOT NULL DEFAULT '0',
  `author_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`consent_request_version_id`),
  KEY `consent_request_id` (`consent_request_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_consent_request_versions` WRITE;
/*!40000 ALTER TABLE `exp_consent_request_versions` DISABLE KEYS */;

INSERT INTO `exp_consent_request_versions` (`consent_request_version_id`, `consent_request_id`, `request`, `request_format`, `create_date`, `author_id`)
VALUES
	(1,1,'These cookies help us personalize content and functionality for you, including remembering changes you have made to parts of the website that you can customize, or selections for services made on previous visits. If you do not allow these cookies, some portions of our website may be less friendly and easy to use, forcing you to enter content or set your preferences on each visit.','none',1720033133,0),
	(2,2,'These cookies allow us measure how visitors use our website, which pages are popular, and what our traffic sources are. This helps us improve how our website works and make it easier for all visitors to find what they are looking for. The information is aggregated and anonymous, and cannot be used to identify you. If you do not allow these cookies, we will be unable to use your visits to our website to help make improvements.','none',1720033133,0),
	(3,3,'These cookies are usually placed by third-party advertising networks, which may use information about your website visits to develop a profile of your interests. This information may be shared with other advertisers and/or websites to deliver more relevant advertising to you across multiple websites. If you do not allow these cookies, visits to this website will not be shared with advertising partners and will not contribute to targeted advertising on other websites.','none',1720033133,0);

/*!40000 ALTER TABLE `exp_consent_request_versions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_consent_requests
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_consent_requests`;

CREATE TABLE `exp_consent_requests` (
  `consent_request_id` int unsigned NOT NULL AUTO_INCREMENT,
  `consent_request_version_id` int unsigned DEFAULT NULL,
  `user_created` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `consent_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `double_opt_in` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `retention_period` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`consent_request_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_consent_requests` WRITE;
/*!40000 ALTER TABLE `exp_consent_requests` DISABLE KEYS */;

INSERT INTO `exp_consent_requests` (`consent_request_id`, `consent_request_version_id`, `user_created`, `title`, `consent_name`, `double_opt_in`, `retention_period`)
VALUES
	(1,1,'n','Functionality Cookies','ee:cookies_functionality','n',NULL),
	(2,2,'n','Performance Cookies','ee:cookies_performance','n',NULL),
	(3,3,'n','Targeting Cookies','ee:cookies_targeting','n',NULL);

/*!40000 ALTER TABLE `exp_consent_requests` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_consents
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_consents`;

CREATE TABLE `exp_consents` (
  `consent_id` int unsigned NOT NULL AUTO_INCREMENT,
  `consent_request_id` int unsigned NOT NULL,
  `consent_request_version_id` int unsigned NOT NULL,
  `member_id` int unsigned NOT NULL,
  `request_copy` mediumtext COLLATE utf8mb4_unicode_ci,
  `request_format` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `consent_given` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `consent_given_via` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expiration_date` int DEFAULT NULL,
  `response_date` int DEFAULT NULL,
  PRIMARY KEY (`consent_id`),
  KEY `consent_request_version_id` (`consent_request_version_id`),
  KEY `member_id` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_content_types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_content_types`;

CREATE TABLE `exp_content_types` (
  `content_type_id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`content_type_id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_content_types` WRITE;
/*!40000 ALTER TABLE `exp_content_types` DISABLE KEYS */;

INSERT INTO `exp_content_types` (`content_type_id`, `name`)
VALUES
	(4,'blocks'),
	(2,'channel'),
	(1,'grid'),
	(3,'pro_variables');

/*!40000 ALTER TABLE `exp_content_types` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_cookie_settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_cookie_settings`;

CREATE TABLE `exp_cookie_settings` (
  `cookie_id` int unsigned NOT NULL AUTO_INCREMENT,
  `cookie_provider` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cookie_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cookie_lifetime` int unsigned DEFAULT NULL,
  `cookie_enforced_lifetime` int unsigned DEFAULT NULL,
  `cookie_title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cookie_description` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`cookie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_cookie_settings` WRITE;
/*!40000 ALTER TABLE `exp_cookie_settings` DISABLE KEYS */;

INSERT INTO `exp_cookie_settings` (`cookie_id`, `cookie_provider`, `cookie_name`, `cookie_lifetime`, `cookie_enforced_lifetime`, `cookie_title`, `cookie_description`)
VALUES
	(1,'ee','csrf_token',7200,NULL,'CSRF Token','A security cookie used to identify the user and prevent Cross Site Request Forgery attacks.'),
	(2,'ee','flash',0,NULL,'Flash data','User feedback messages, encrypted for security.'),
	(3,'ee','remember',1209600,NULL,'Remember Me','Determines whether a user is automatically logged in upon visiting the site.'),
	(4,'ee','sessionid',3600,NULL,'Session ID','Session id, used to associate a logged in user with their data.'),
	(5,'ee','visitor_consents',NULL,NULL,'Visitor Consents','Saves responses to Consent requests for non-logged in visitors'),
	(6,'ee','last_activity',NULL,NULL,'Last Activity','Records the time of the last page load. Used in in calculating active sessions.'),
	(7,'ee','last_visit',NULL,NULL,'Last Visit','Date of the user’s last visit, based on the last_activity cookie. Can be shown as a statistic for members and used by forum and comments to show unread topics for both members and guests.'),
	(8,'ee','anon',NULL,NULL,'Anonymize','Determines whether the user’s username is displayed in the list of currently logged in members.'),
	(9,'ee','tracker',NULL,NULL,'Tracker','Contains the last 5 pages viewed, encrypted for security. Typically used for form or error message returns.'),
	(10,'cp','viewtype',NULL,NULL,'Filemanager View Type','Determines View Type to be used in Filemanager (table or thumbs view)'),
	(11,'cp','cp_last_site_id',NULL,NULL,'CP Last Site ID','MSM cookie indicating the last site accessed in the Control Panel.'),
	(12,'cp','ee_cp_viewmode',NULL,NULL,'CP View Mode','Determines view mode for the Control Panel.'),
	(13,'cp','secondary_sidebar',31104000,NULL,'Secondary Sidebar State','Determines whether secondary navigation sidebar in the Control Panel should be collapsed for each corresponding section.'),
	(14,'cp','collapsed_nav',NULL,NULL,'Collapsed Navigation','Determines whether navigation sidebar in the Control Panel should be collapsed.'),
	(15,'pro','frontedit',NULL,NULL,'Front-end editing','Determines whether ExpressioEngine front-end editing features should be enabled.'),
	(16,'comment','my_email',NULL,NULL,'My email','Email address specified when posting a comment.'),
	(17,'comment','my_location',NULL,NULL,'My location','Location specified when posting a comment.'),
	(18,'comment','my_name',NULL,NULL,'My name','Name specified when posting a comment.'),
	(19,'comment','my_url',NULL,NULL,'My URL','URL specified when posting a comment.'),
	(20,'comment','notify_me',NULL,NULL,'Notify me','If set to ‘yes’, notifications will be sent to the saved email address when new comments are made.'),
	(21,'comment','save_info',NULL,NULL,'Save info','If set to ‘yes’, allows additional cookies (my_email, my_location, my_name, my_url) to store guest user information for use when filling out comment forms. This cookie is only set if you submit a comment.');

/*!40000 ALTER TABLE `exp_cookie_settings` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_cp_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_cp_log`;

CREATE TABLE `exp_cp_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `site_id` int unsigned NOT NULL DEFAULT '1',
  `member_id` int unsigned NOT NULL,
  `username` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `act_date` int NOT NULL,
  `action` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_cp_log` WRITE;
/*!40000 ALTER TABLE `exp_cp_log` DISABLE KEYS */;

INSERT INTO `exp_cp_log` (`id`, `site_id`, `member_id`, `username`, `ip_address`, `act_date`, `action`)
VALUES
	(1,1,1,'cf-admin','127.0.0.1',1720033150,'Logged in'),
	(2,1,1,'cf-admin','127.0.0.1',1720033304,'Channel Created&nbsp;&nbsp;Default Page'),
	(3,1,1,'cf-admin','127.0.0.1',1720033327,'Channel Created&nbsp;&nbsp;Clients'),
	(4,1,1,'cf-admin','127.0.0.1',1720033346,'Channel Created&nbsp;&nbsp;Blog'),
	(5,1,1,'cf-admin','127.0.0.1',1720033354,'Channel Created&nbsp;&nbsp;Work'),
	(6,1,1,'cf-admin','127.0.0.1',1720036846,'Channel Created&nbsp;&nbsp;Testimonials'),
	(7,1,1,'cf-admin','127.0.0.1',1720038378,'Content reindexing started.'),
	(8,1,1,'cf-admin','127.0.0.1',1720038378,'search_reindex_completed'),
	(9,1,1,'cf-admin','127.0.0.1',1720038384,'Content reindexing started.'),
	(10,1,1,'cf-admin','127.0.0.1',1720038384,'search_reindex_completed'),
	(11,1,1,'cf-admin','127.0.0.1',1720038430,'Content reindexing started.'),
	(12,1,1,'cf-admin','127.0.0.1',1720038430,'search_reindex_completed'),
	(13,1,1,'cf-admin','127.0.0.1',1720038590,'The following fields were removed from the Fluid Field <b>Page Builder</b> and their data was deleted: <b>Subhead</b>'),
	(14,1,1,'cf-admin','127.0.0.1',1720038590,'The following fields were removed from the Fluid Field <b>Page Builder</b> and their data was deleted: <b>Subhead</b>'),
	(15,1,1,'cf-admin','127.0.0.1',1720038591,'The following fields were removed from the Fluid Field <b>Page Builder</b> and their data was deleted: <b>RIch Text</b>, <b>Subhead</b>'),
	(16,1,1,'cf-admin','127.0.0.1',1720038591,'The following fields were removed from the Fluid Field <b>Page Builder</b> and their data was deleted: <b>RIch Text</b>, <b>Subhead</b>'),
	(17,1,1,'cf-admin','127.0.0.1',1720038591,'The following fields were removed from the Fluid Field <b>Page Builder</b> and their data was deleted: <b>Markdown</b>, <b>RIch Text</b>, <b>Subhead</b>'),
	(18,1,1,'cf-admin','127.0.0.1',1720038591,'The following fields were removed from the Fluid Field <b>Page Builder</b> and their data was deleted: <b>Markdown</b>, <b>RIch Text</b>, <b>Subhead</b>'),
	(19,1,1,'cf-admin','127.0.0.1',1720038591,'The following fields were removed from the Fluid Field <b>Page Builder</b> and their data was deleted: <b>Markdown</b>, <b>RIch Text</b>, <b>Image</b>, <b>Subhead</b>'),
	(20,1,1,'cf-admin','127.0.0.1',1720038591,'The following fields were removed from the Fluid Field <b>Page Builder</b> and their data was deleted: <b>Markdown</b>, <b>RIch Text</b>, <b>Image</b>, <b>Subhead</b>'),
	(21,1,1,'cf-admin','127.0.0.1',1720038592,'The following fields were removed from the Fluid Field <b>Page Builder</b> and their data was deleted: <b>Markdown</b>, <b>RIch Text</b>, <b>Image</b>, <b>Description</b>, <b>Subhead</b>'),
	(22,1,1,'cf-admin','127.0.0.1',1720038592,'The following fields were removed from the Fluid Field <b>Page Builder</b> and their data was deleted: <b>Markdown</b>, <b>RIch Text</b>, <b>Image</b>, <b>Description</b>, <b>Subhead</b>'),
	(23,1,1,'cf-admin','127.0.0.1',1720038593,'The following fields were removed from the Fluid Field <b>Page Builder</b> and their data was deleted: <b>headline</b>, <b>Markdown</b>, <b>RIch Text</b>, <b>Image</b>, <b>Description</b>, <b>Subhead</b>'),
	(24,1,1,'cf-admin','127.0.0.1',1720038593,'The following fields were removed from the Fluid Field <b>Page Builder</b> and their data was deleted: <b>headline</b>, <b>Markdown</b>, <b>RIch Text</b>, <b>Image</b>, <b>Description</b>, <b>Subhead</b>'),
	(25,1,1,'cf-admin','127.0.0.1',1720038594,'The following fields were removed from the Fluid Field <b>Page Builder</b> and their data was deleted: <b>headline</b>, <b>Markdown</b>, <b>RIch Text</b>, <b>Image</b>, <b>Button</b>, <b>Description</b>, <b>Subhead</b>'),
	(26,1,1,'cf-admin','127.0.0.1',1720038594,'The following fields were removed from the Fluid Field <b>Page Builder</b> and their data was deleted: <b>headline</b>, <b>Markdown</b>, <b>RIch Text</b>, <b>Image</b>, <b>Button</b>, <b>Description</b>, <b>Subhead</b>'),
	(27,1,1,'cf-admin','127.0.0.1',1720038597,'The following fields were removed from the Fluid Field <b>Page Builder</b> and their data was deleted: <b>headline</b>, <b>Markdown</b>, <b>RIch Text</b>, <b>Image</b>, <b>Button</b>, <b>Description</b>, <b>Subhead</b>'),
	(28,1,1,'cf-admin','127.0.0.1',1720038597,'The following fields were removed from the Fluid Field <b>Page Builder</b> and their data was deleted: <b>headline</b>, <b>Markdown</b>, <b>RIch Text</b>, <b>Image</b>, <b>Button</b>, <b>Description</b>, <b>Subhead</b>'),
	(29,1,1,'cf-admin','127.0.0.1',1720038597,'The following fields were removed from the Fluid Field <b>Page Builder</b> and their data was deleted: <b>headline</b>, <b>Markdown</b>, <b>RIch Text</b>, <b>Image</b>, <b>Button</b>, <b>Description</b>, <b>Subhead</b>'),
	(30,1,1,'cf-admin','127.0.0.1',1720038597,'The following fields were removed from the Fluid Field <b>Page Builder</b> and their data was deleted: <b>headline</b>, <b>Markdown</b>, <b>RIch Text</b>, <b>Image</b>, <b>Button</b>, <b>Description</b>, <b>Subhead</b>'),
	(31,1,1,'cf-admin','127.0.0.1',1720038598,'The following fields were removed from the Fluid Field <b>Page Builder</b> and their data was deleted: <b>headline</b>, <b>Markdown</b>, <b>RIch Text</b>, <b>Image</b>, <b>Button</b>, <b>Description</b>, <b>Subhead</b>'),
	(32,1,1,'cf-admin','127.0.0.1',1720038598,'The following fields were removed from the Fluid Field <b>Page Builder</b> and their data was deleted: <b>headline</b>, <b>Markdown</b>, <b>RIch Text</b>, <b>Image</b>, <b>Button</b>, <b>Description</b>, <b>Subhead</b>'),
	(33,1,1,'cf-admin','127.0.0.1',1720038598,'The following fields were removed from the Fluid Field <b>Page Builder</b> and their data was deleted: <b>headline</b>, <b>Markdown</b>, <b>RIch Text</b>, <b>Image</b>, <b>Button</b>, <b>Description</b>, <b>Subhead</b>'),
	(34,1,1,'cf-admin','127.0.0.1',1720038598,'The following fields were removed from the Fluid Field <b>Page Builder</b> and their data was deleted: <b>headline</b>, <b>Markdown</b>, <b>RIch Text</b>, <b>Image</b>, <b>Button</b>, <b>Description</b>, <b>Subhead</b>'),
	(35,1,1,'cf-admin','127.0.0.1',1720038599,'The following fields were removed from the Fluid Field <b>Page Builder</b> and their data was deleted: <b>headline</b>, <b>Markdown</b>, <b>RIch Text</b>, <b>Image</b>, <b>Button</b>, <b>Description</b>, <b>Subhead</b>'),
	(36,1,1,'cf-admin','127.0.0.1',1720038599,'The following fields were removed from the Fluid Field <b>Page Builder</b> and their data was deleted: <b>headline</b>, <b>Markdown</b>, <b>RIch Text</b>, <b>Image</b>, <b>Button</b>, <b>Description</b>, <b>Subhead</b>'),
	(37,1,1,'cf-admin','127.0.0.1',1720038599,'The following fields were removed from the Fluid Field <b>Page Builder</b> and their data was deleted: <b>headline</b>, <b>Markdown</b>, <b>RIch Text</b>, <b>Image</b>, <b>Button</b>, <b>Description</b>, <b>Subhead</b>'),
	(38,1,1,'cf-admin','127.0.0.1',1720038599,'The following fields were removed from the Fluid Field <b>Page Builder</b> and their data was deleted: <b>headline</b>, <b>Markdown</b>, <b>RIch Text</b>, <b>Image</b>, <b>Button</b>, <b>Description</b>, <b>Subhead</b>'),
	(39,1,1,'cf-admin','127.0.0.1',1720038600,'The following fields were removed from the Fluid Field <b>Page Builder</b> and their data was deleted: <b>headline</b>, <b>Markdown</b>, <b>RIch Text</b>, <b>Image</b>, <b>Button</b>, <b>Description</b>, <b>Subhead</b>'),
	(40,1,1,'cf-admin','127.0.0.1',1720038600,'The following fields were removed from the Fluid Field <b>Page Builder</b> and their data was deleted: <b>headline</b>, <b>Markdown</b>, <b>RIch Text</b>, <b>Image</b>, <b>Button</b>, <b>Description</b>, <b>Subhead</b>'),
	(41,1,1,'cf-admin','127.0.0.1',1720038600,'The following fields were removed from the Fluid Field <b>Page Builder</b> and their data was deleted: <b>headline</b>, <b>Markdown</b>, <b>RIch Text</b>, <b>Image</b>, <b>Button</b>, <b>Description</b>, <b>Subhead</b>'),
	(42,1,1,'cf-admin','127.0.0.1',1720038600,'The following fields were removed from the Fluid Field <b>Page Builder</b> and their data was deleted: <b>headline</b>, <b>Markdown</b>, <b>RIch Text</b>, <b>Image</b>, <b>Button</b>, <b>Description</b>, <b>Subhead</b>'),
	(43,1,1,'cf-admin','127.0.0.1',1720038601,'The following fields were removed from the Fluid Field <b>Page Builder</b> and their data was deleted: <b>headline</b>, <b>Markdown</b>, <b>RIch Text</b>, <b>Image</b>, <b>Button</b>, <b>Description</b>, <b>Subhead</b>'),
	(44,1,1,'cf-admin','127.0.0.1',1720038601,'The following fields were removed from the Fluid Field <b>Page Builder</b> and their data was deleted: <b>headline</b>, <b>Markdown</b>, <b>RIch Text</b>, <b>Image</b>, <b>Button</b>, <b>Description</b>, <b>Subhead</b>'),
	(45,1,1,'cf-admin','127.0.0.1',1720038602,'The following fields were removed from the Fluid Field <b>Page Builder</b> and their data was deleted: <b>headline</b>, <b>Markdown</b>, <b>RIch Text</b>, <b>Image</b>, <b>Button</b>, <b>Description</b>, <b>Subhead</b>'),
	(46,1,1,'cf-admin','127.0.0.1',1720038602,'The following fields were removed from the Fluid Field <b>Page Builder</b> and their data was deleted: <b>headline</b>, <b>Markdown</b>, <b>RIch Text</b>, <b>Image</b>, <b>Button</b>, <b>Description</b>, <b>Subhead</b>'),
	(47,1,1,'cf-admin','127.0.0.1',1720038602,'The following fields were removed from the Fluid Field <b>Page Builder</b> and their data was deleted: <b>headline</b>, <b>Markdown</b>, <b>RIch Text</b>, <b>Image</b>, <b>Button</b>, <b>Description</b>, <b>Subhead</b>'),
	(48,1,1,'cf-admin','127.0.0.1',1720038602,'The following fields were removed from the Fluid Field <b>Page Builder</b> and their data was deleted: <b>headline</b>, <b>Markdown</b>, <b>RIch Text</b>, <b>Image</b>, <b>Button</b>, <b>Description</b>, <b>Subhead</b>'),
	(49,1,1,'cf-admin','127.0.0.1',1720038605,'The following fields were removed from the Fluid Field <b>Page Builder</b> and their data was deleted: <b>headline</b>, <b>Markdown</b>, <b>RIch Text</b>, <b>Image</b>, <b>Button</b>, <b>Description</b>, <b>Subhead</b>'),
	(50,1,1,'cf-admin','127.0.0.1',1720038605,'The following fields were removed from the Fluid Field <b>Page Builder</b> and their data was deleted: <b>headline</b>, <b>Markdown</b>, <b>RIch Text</b>, <b>Image</b>, <b>Button</b>, <b>Description</b>, <b>Subhead</b>'),
	(51,1,1,'cf-admin','127.0.0.1',1720038876,'The following field was removed and its data was deleted: <b>Page Builder</b>'),
	(52,1,1,'cf-admin','127.0.0.1',1720038959,'Content reindexing started.'),
	(53,1,1,'cf-admin','127.0.0.1',1720038960,'search_reindex_completed'),
	(54,1,1,'cf-admin','127.0.0.1',1720039654,'The following fields were removed from the Fluid Field <b>Page Builder</b> and their data was deleted: <b>Button</b>'),
	(55,1,1,'cf-admin','127.0.0.1',1720039654,'The following fields were removed from the Fluid Field <b>Page Builder</b> and their data was deleted: <b>Button</b>'),
	(56,1,1,'cf-admin','127.0.0.1',1720039654,'The following fields were removed from the Fluid Field <b>Page Builder</b> and their data was deleted: <b>Button</b>, <b>Description</b>'),
	(57,1,1,'cf-admin','127.0.0.1',1720039654,'The following fields were removed from the Fluid Field <b>Page Builder</b> and their data was deleted: <b>Button</b>, <b>Description</b>'),
	(58,1,1,'cf-admin','127.0.0.1',1720039655,'The following fields were removed from the Fluid Field <b>Page Builder</b> and their data was deleted: <b>headline</b>, <b>Button</b>, <b>Description</b>'),
	(59,1,1,'cf-admin','127.0.0.1',1720039655,'The following fields were removed from the Fluid Field <b>Page Builder</b> and their data was deleted: <b>headline</b>, <b>Button</b>, <b>Description</b>'),
	(60,1,1,'cf-admin','127.0.0.1',1720039657,'The following fields were removed from the Fluid Field <b>Page Builder</b> and their data was deleted: <b>headline</b>, <b>Markdown</b>, <b>Button</b>, <b>Description</b>'),
	(61,1,1,'cf-admin','127.0.0.1',1720039657,'The following fields were removed from the Fluid Field <b>Page Builder</b> and their data was deleted: <b>headline</b>, <b>Markdown</b>, <b>Button</b>, <b>Description</b>'),
	(62,1,1,'cf-admin','127.0.0.1',1720039657,'The following fields were removed from the Fluid Field <b>Page Builder</b> and their data was deleted: <b>headline</b>, <b>Markdown</b>, <b>Image</b>, <b>Button</b>, <b>Description</b>'),
	(63,1,1,'cf-admin','127.0.0.1',1720039657,'The following fields were removed from the Fluid Field <b>Page Builder</b> and their data was deleted: <b>headline</b>, <b>Markdown</b>, <b>Image</b>, <b>Button</b>, <b>Description</b>'),
	(64,1,1,'cf-admin','127.0.0.1',1720039659,'The following fields were removed from the Fluid Field <b>Page Builder</b> and their data was deleted: <b>headline</b>, <b>Markdown</b>, <b>RIch Text</b>, <b>Image</b>, <b>Button</b>, <b>Description</b>'),
	(65,1,1,'cf-admin','127.0.0.1',1720039659,'The following fields were removed from the Fluid Field <b>Page Builder</b> and their data was deleted: <b>headline</b>, <b>Markdown</b>, <b>RIch Text</b>, <b>Image</b>, <b>Button</b>, <b>Description</b>'),
	(66,1,1,'cf-admin','127.0.0.1',1720039660,'The following fields were removed from the Fluid Field <b>Page Builder</b> and their data was deleted: <b>headline</b>, <b>Markdown</b>, <b>RIch Text</b>, <b>Image</b>, <b>Button</b>, <b>Description</b>, <b>Subhead</b>'),
	(67,1,1,'cf-admin','127.0.0.1',1720039660,'The following fields were removed from the Fluid Field <b>Page Builder</b> and their data was deleted: <b>headline</b>, <b>Markdown</b>, <b>RIch Text</b>, <b>Image</b>, <b>Button</b>, <b>Description</b>, <b>Subhead</b>'),
	(68,1,1,'cf-admin','127.0.0.1',1720039665,'The following fields were removed from the Fluid Field <b>Page Builder</b> and their data was deleted: <b>headline</b>, <b>Markdown</b>, <b>RIch Text</b>, <b>Image</b>, <b>Button</b>, <b>Description</b>, <b>Subhead</b>'),
	(69,1,1,'cf-admin','127.0.0.1',1720039665,'The following fields were removed from the Fluid Field <b>Page Builder</b> and their data was deleted: <b>headline</b>, <b>Markdown</b>, <b>RIch Text</b>, <b>Image</b>, <b>Button</b>, <b>Description</b>, <b>Subhead</b>'),
	(70,1,1,'cf-admin','127.0.0.1',1720039669,'Content reindexing started.'),
	(71,1,1,'cf-admin','127.0.0.1',1720039669,'search_reindex_completed'),
	(72,1,1,'cf-admin','127.0.0.1',1720040022,'The following fields were removed from the Fluid Field <b>Supa Page Builder</b> and their data was deleted: <b>Button</b>'),
	(73,1,1,'cf-admin','127.0.0.1',1720040022,'The following fields were removed from the Fluid Field <b>Supa Page Builder</b> and their data was deleted: <b>Button</b>'),
	(74,1,1,'cf-admin','127.0.0.1',1720040023,'The following fields were removed from the Fluid Field <b>Supa Page Builder</b> and their data was deleted: <b>Button</b>, <b>Description</b>'),
	(75,1,1,'cf-admin','127.0.0.1',1720040023,'The following fields were removed from the Fluid Field <b>Supa Page Builder</b> and their data was deleted: <b>Button</b>, <b>Description</b>'),
	(76,1,1,'cf-admin','127.0.0.1',1720040024,'The following fields were removed from the Fluid Field <b>Supa Page Builder</b> and their data was deleted: <b>headline</b>, <b>Button</b>, <b>Description</b>'),
	(77,1,1,'cf-admin','127.0.0.1',1720040024,'The following fields were removed from the Fluid Field <b>Supa Page Builder</b> and their data was deleted: <b>headline</b>, <b>Button</b>, <b>Description</b>'),
	(78,1,1,'cf-admin','127.0.0.1',1720040024,'The following fields were removed from the Fluid Field <b>Supa Page Builder</b> and their data was deleted: <b>headline</b>, <b>Image</b>, <b>Button</b>, <b>Description</b>'),
	(79,1,1,'cf-admin','127.0.0.1',1720040024,'The following fields were removed from the Fluid Field <b>Supa Page Builder</b> and their data was deleted: <b>headline</b>, <b>Image</b>, <b>Button</b>, <b>Description</b>'),
	(80,1,1,'cf-admin','127.0.0.1',1720040026,'The following fields were removed from the Fluid Field <b>Supa Page Builder</b> and their data was deleted: <b>headline</b>, <b>Markdown</b>, <b>Image</b>, <b>Button</b>, <b>Description</b>'),
	(81,1,1,'cf-admin','127.0.0.1',1720040026,'The following fields were removed from the Fluid Field <b>Supa Page Builder</b> and their data was deleted: <b>headline</b>, <b>Markdown</b>, <b>Image</b>, <b>Button</b>, <b>Description</b>'),
	(82,1,1,'cf-admin','127.0.0.1',1720040026,'The following fields were removed from the Fluid Field <b>Supa Page Builder</b> and their data was deleted: <b>headline</b>, <b>Markdown</b>, <b>RIch Text</b>, <b>Image</b>, <b>Button</b>, <b>Description</b>'),
	(83,1,1,'cf-admin','127.0.0.1',1720040026,'The following fields were removed from the Fluid Field <b>Supa Page Builder</b> and their data was deleted: <b>headline</b>, <b>Markdown</b>, <b>RIch Text</b>, <b>Image</b>, <b>Button</b>, <b>Description</b>'),
	(84,1,1,'cf-admin','127.0.0.1',1720040027,'The following fields were removed from the Fluid Field <b>Supa Page Builder</b> and their data was deleted: <b>headline</b>, <b>Markdown</b>, <b>RIch Text</b>, <b>Image</b>, <b>Button</b>, <b>Description</b>, <b>Subhead</b>'),
	(85,1,1,'cf-admin','127.0.0.1',1720040027,'The following fields were removed from the Fluid Field <b>Supa Page Builder</b> and their data was deleted: <b>headline</b>, <b>Markdown</b>, <b>RIch Text</b>, <b>Image</b>, <b>Button</b>, <b>Description</b>, <b>Subhead</b>'),
	(86,1,1,'cf-admin','127.0.0.1',1720040029,'The following fields were removed from the Fluid Field <b>Supa Page Builder</b> and their data was deleted: <b>headline</b>, <b>Markdown</b>, <b>RIch Text</b>, <b>Image</b>, <b>Button</b>, <b>Description</b>, <b>Subhead</b>'),
	(87,1,1,'cf-admin','127.0.0.1',1720040029,'The following fields were removed from the Fluid Field <b>Supa Page Builder</b> and their data was deleted: <b>headline</b>, <b>Markdown</b>, <b>RIch Text</b>, <b>Image</b>, <b>Button</b>, <b>Description</b>, <b>Subhead</b>'),
	(88,1,1,'cf-admin','127.0.0.1',1720040030,'The following fields were removed from the Fluid Field <b>Supa Page Builder</b> and their data was deleted: <b>headline</b>, <b>Markdown</b>, <b>Image</b>, <b>Button</b>, <b>Description</b>, <b>Subhead</b>'),
	(89,1,1,'cf-admin','127.0.0.1',1720040030,'The following fields were removed from the Fluid Field <b>Supa Page Builder</b> and their data was deleted: <b>headline</b>, <b>Markdown</b>, <b>Image</b>, <b>Button</b>, <b>Description</b>, <b>Subhead</b>'),
	(90,1,1,'cf-admin','127.0.0.1',1720040035,'The following fields were removed from the Fluid Field <b>Supa Page Builder</b> and their data was deleted: <b>headline</b>, <b>Markdown</b>, <b>Button</b>, <b>Description</b>, <b>Subhead</b>'),
	(91,1,1,'cf-admin','127.0.0.1',1720040035,'The following fields were removed from the Fluid Field <b>Supa Page Builder</b> and their data was deleted: <b>headline</b>, <b>Markdown</b>, <b>Button</b>, <b>Description</b>, <b>Subhead</b>'),
	(92,1,1,'cf-admin','127.0.0.1',1720040036,'The following fields were removed from the Fluid Field <b>Supa Page Builder</b> and their data was deleted: <b>Markdown</b>, <b>Button</b>, <b>Description</b>, <b>Subhead</b>'),
	(93,1,1,'cf-admin','127.0.0.1',1720040036,'The following fields were removed from the Fluid Field <b>Supa Page Builder</b> and their data was deleted: <b>Markdown</b>, <b>Button</b>, <b>Description</b>, <b>Subhead</b>'),
	(94,1,1,'cf-admin','127.0.0.1',1720040040,'The following fields were removed from the Fluid Field <b>Supa Page Builder</b> and their data was deleted: <b>Markdown</b>, <b>Button</b>, <b>Description</b>, <b>Subhead</b>'),
	(95,1,1,'cf-admin','127.0.0.1',1720040040,'The following fields were removed from the Fluid Field <b>Supa Page Builder</b> and their data was deleted: <b>Markdown</b>, <b>Button</b>, <b>Description</b>, <b>Subhead</b>'),
	(96,1,1,'cf-admin','127.0.0.1',1720040044,'Content reindexing started.'),
	(97,1,1,'cf-admin','127.0.0.1',1720040045,'search_reindex_completed'),
	(98,1,1,'cf-admin','127.0.0.1',1720103004,'Content reindexing started.'),
	(99,1,1,'cf-admin','127.0.0.1',1720103004,'search_reindex_completed'),
	(100,1,1,'cf-admin','127.0.0.1',1720108722,'The following field was removed and its data was deleted: <b>Page Builder</b>'),
	(101,1,1,'cf-admin','127.0.0.1',1720108722,'The following field was removed and its data was deleted: <b>Supa Page Builder</b>'),
	(102,1,1,'cf-admin','127.0.0.1',1720112126,'Channel Created&nbsp;&nbsp;Home'),
	(103,1,1,'cf-admin','127.0.0.1',1720114884,'The following field was removed and its data was deleted: <b>Hero Section</b>');

/*!40000 ALTER TABLE `exp_cp_log` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_dashboard_layout_widgets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_dashboard_layout_widgets`;

CREATE TABLE `exp_dashboard_layout_widgets` (
  `dashboard_layout_widgets_id` int unsigned NOT NULL AUTO_INCREMENT,
  `layout_id` int unsigned NOT NULL,
  `widget_id` int unsigned NOT NULL,
  PRIMARY KEY (`dashboard_layout_widgets_id`),
  KEY `layouts_widgets` (`layout_id`,`widget_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_dashboard_layouts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_dashboard_layouts`;

CREATE TABLE `exp_dashboard_layouts` (
  `layout_id` int unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int unsigned DEFAULT NULL,
  `role_id` int unsigned DEFAULT NULL,
  `order` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`layout_id`),
  KEY `member_id` (`member_id`),
  KEY `role_id` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_dashboard_widgets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_dashboard_widgets`;

CREATE TABLE `exp_dashboard_widgets` (
  `widget_id` int unsigned NOT NULL AUTO_INCREMENT,
  `widget_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `widget_data` mediumtext COLLATE utf8mb4_unicode_ci,
  `widget_type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `widget_source` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `widget_file` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`widget_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_dashboard_widgets` WRITE;
/*!40000 ALTER TABLE `exp_dashboard_widgets` DISABLE KEYS */;

INSERT INTO `exp_dashboard_widgets` (`widget_id`, `widget_name`, `widget_data`, `widget_type`, `widget_source`, `widget_file`)
VALUES
	(1,NULL,NULL,'php','pro','comments'),
	(2,NULL,NULL,'php','pro','eecms_news'),
	(3,NULL,NULL,'php','pro','members'),
	(4,NULL,NULL,'php','pro','recent_entries'),
	(5,NULL,NULL,'php','pro','recent_templates'),
	(6,NULL,NULL,'html','pro','support');

/*!40000 ALTER TABLE `exp_dashboard_widgets` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_developer_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_developer_log`;

CREATE TABLE `exp_developer_log` (
  `log_id` int unsigned NOT NULL AUTO_INCREMENT,
  `timestamp` int unsigned NOT NULL,
  `viewed` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `description` text COLLATE utf8mb4_unicode_ci,
  `function` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `line` int unsigned DEFAULT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deprecated_since` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `use_instead` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template_id` int unsigned NOT NULL DEFAULT '0',
  `template_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template_group` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addon_module` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addon_method` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `snippets` text COLLATE utf8mb4_unicode_ci,
  `hash` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_developer_log` WRITE;
/*!40000 ALTER TABLE `exp_developer_log` DISABLE KEYS */;

INSERT INTO `exp_developer_log` (`log_id`, `timestamp`, `viewed`, `description`, `function`, `line`, `file`, `deprecated_since`, `use_instead`, `template_id`, `template_name`, `template_group`, `addon_module`, `addon_method`, `snippets`, `hash`)
VALUES
	(1,1720037698,'n','Running migration: 2023_08_09_092350_createexthookcpjsendforaddonfluidity',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'242d86e68009d159b2315a0e9dd40e65'),
	(2,1720037698,'n','Running migration: 2023_08_14_094745_createexthookcpcssendforaddonfluidity',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'0f5618875fbc2260e83f41a1f4b7240c'),
	(3,1720103443,'n','Rolling back migration: 2023_08_14_094745_createexthookcpcssendforaddonfluidity',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'fbec7a93629c6ee5e448cada94c740f6'),
	(4,1720103443,'n','Rolling back migration: 2023_08_09_092350_createexthookcpjsendforaddonfluidity',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'c9c1281cd6fc6e30c7789b3beed0cd55');

/*!40000 ALTER TABLE `exp_developer_log` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_dock_prolets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_dock_prolets`;

CREATE TABLE `exp_dock_prolets` (
  `dock_prolets_id` int unsigned NOT NULL AUTO_INCREMENT,
  `dock_id` int unsigned NOT NULL,
  `prolet_id` int unsigned NOT NULL,
  PRIMARY KEY (`dock_prolets_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_dock_prolets` WRITE;
/*!40000 ALTER TABLE `exp_dock_prolets` DISABLE KEYS */;

INSERT INTO `exp_dock_prolets` (`dock_prolets_id`, `dock_id`, `prolet_id`)
VALUES
	(1,1,1),
	(2,1,2),
	(3,1,3),
	(4,1,4);

/*!40000 ALTER TABLE `exp_dock_prolets` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_docks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_docks`;

CREATE TABLE `exp_docks` (
  `dock_id` int unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`dock_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_docks` WRITE;
/*!40000 ALTER TABLE `exp_docks` DISABLE KEYS */;

INSERT INTO `exp_docks` (`dock_id`, `site_id`)
VALUES
	(1,0);

/*!40000 ALTER TABLE `exp_docks` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_email_cache
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_email_cache`;

CREATE TABLE `exp_email_cache` (
  `cache_id` int unsigned NOT NULL AUTO_INCREMENT,
  `cache_date` int unsigned NOT NULL DEFAULT '0',
  `total_sent` int unsigned NOT NULL,
  `from_name` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `recipient` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `cc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `bcc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `recipient_array` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `plaintext_alt` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `mailtype` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text_fmt` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wordwrap` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `attachments` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`cache_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_email_cache_mg
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_email_cache_mg`;

CREATE TABLE `exp_email_cache_mg` (
  `cache_id` int unsigned NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`cache_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_email_cache_ml
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_email_cache_ml`;

CREATE TABLE `exp_email_cache_ml` (
  `cache_id` int unsigned NOT NULL,
  `list_id` smallint NOT NULL,
  PRIMARY KEY (`cache_id`,`list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_email_console_cache
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_email_console_cache`;

CREATE TABLE `exp_email_console_cache` (
  `cache_id` int unsigned NOT NULL AUTO_INCREMENT,
  `cache_date` int unsigned NOT NULL DEFAULT '0',
  `member_id` int unsigned NOT NULL,
  `member_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `recipient` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `recipient_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`cache_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_entry_manager_views
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_entry_manager_views`;

CREATE TABLE `exp_entry_manager_views` (
  `view_id` int unsigned NOT NULL AUTO_INCREMENT,
  `channel_id` int unsigned NOT NULL,
  `member_id` int unsigned NOT NULL,
  `name` varchar(128) NOT NULL DEFAULT '',
  `columns` text NOT NULL,
  PRIMARY KEY (`view_id`),
  KEY `channel_id_member_id` (`channel_id`,`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump of table exp_entry_versioning
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_entry_versioning`;

CREATE TABLE `exp_entry_versioning` (
  `version_id` int unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int unsigned NOT NULL,
  `channel_id` int unsigned NOT NULL,
  `author_id` int unsigned NOT NULL,
  `version_date` int NOT NULL,
  `version_data` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`version_id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_extensions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_extensions`;

CREATE TABLE `exp_extensions` (
  `extension_id` int unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `method` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hook` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `settings` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` int NOT NULL DEFAULT '10',
  `version` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `enabled` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  PRIMARY KEY (`extension_id`),
  KEY `enabled` (`enabled`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_extensions` WRITE;
/*!40000 ALTER TABLE `exp_extensions` DISABLE KEYS */;

INSERT INTO `exp_extensions` (`extension_id`, `class`, `method`, `hook`, `settings`, `priority`, `version`, `enabled`)
VALUES
	(1,'Comment_ext','addCommentMenu','cp_custom_menu','a:0:{}',10,'2.3.3','y'),
	(2,'Structure_ext','after_channel_entry_save','after_channel_entry_save','a:0:{}',10,'6.0.0','y'),
	(3,'Structure_ext','sessions_end','sessions_end','a:0:{}',10,'6.0.0','y'),
	(4,'Structure_ext','entry_submission_redirect','entry_submission_redirect','a:0:{}',10,'6.0.0','y'),
	(5,'Structure_ext','cp_member_login','cp_member_login','a:0:{}',10,'6.0.0','y'),
	(6,'Structure_ext','sessions_start','sessions_start','a:0:{}',10,'6.0.0','y'),
	(7,'Structure_ext','pagination_create','pagination_create','a:0:{}',10,'6.0.0','y'),
	(8,'Structure_ext','wygwam_config','wygwam_config','a:0:{}',10,'6.0.0','y'),
	(9,'Structure_ext','core_template_route','core_template_route','a:0:{}',10,'6.0.0','y'),
	(10,'Structure_ext','entry_submission_end','entry_submission_end','a:0:{}',10,'6.0.0','y'),
	(11,'Structure_ext','channel_form_submit_entry_end','channel_form_submit_entry_end','a:0:{}',10,'6.0.0','y'),
	(12,'Structure_ext','template_post_parse','template_post_parse','a:0:{}',10,'6.0.0','y'),
	(13,'Structure_ext','cp_custom_menu','cp_custom_menu','a:0:{}',10,'6.0.0','y'),
	(14,'Structure_ext','publish_live_preview_route','publish_live_preview_route','a:0:{}',10,'6.0.0','y'),
	(15,'Structure_ext','entry_save_and_close_redirect','entry_save_and_close_redirect','a:0:{}',10,'6.0.0','y'),
	(16,'Pro_variables_ext','sessions_end','sessions_end','a:7:{s:10:\"can_manage\";a:1:{i:0;i:1;}s:11:\"clear_cache\";s:1:\"n\";s:16:\"register_globals\";s:1:\"n\";s:13:\"save_as_files\";s:1:\"n\";s:9:\"file_path\";s:0:\"\";s:12:\"one_way_sync\";s:1:\"n\";s:13:\"enabled_types\";a:1:{i:0;s:12:\"pro_textarea\";}}',2,'5.0.3','y'),
	(17,'Pro_variables_ext','template_fetch_template','template_fetch_template','a:7:{s:10:\"can_manage\";a:1:{i:0;i:1;}s:11:\"clear_cache\";s:1:\"n\";s:16:\"register_globals\";s:1:\"n\";s:13:\"save_as_files\";s:1:\"n\";s:9:\"file_path\";s:0:\"\";s:12:\"one_way_sync\";s:1:\"n\";s:13:\"enabled_types\";a:1:{i:0;s:12:\"pro_textarea\";}}',2,'5.0.3','y'),
	(18,'Pro_search_ext','after_channel_entry_insert','after_channel_entry_insert','a:18:{s:12:\"encode_query\";s:1:\"y\";s:15:\"min_word_length\";s:1:\"4\";s:14:\"excerpt_length\";s:2:\"50\";s:14:\"excerpt_hilite\";s:0:\"\";s:12:\"title_hilite\";s:0:\"\";s:10:\"batch_size\";s:3:\"100\";s:19:\"default_result_page\";s:14:\"search/results\";s:15:\"search_log_size\";s:3:\"500\";s:12:\"ignore_words\";s:20:\"a an and the or of s\";s:16:\"disabled_filters\";a:0:{}s:19:\"build_index_act_key\";s:40:\"9132C5E24D65E5469E8FCACF26896463AB48C77D\";s:10:\"stop_words\";s:3945:\"a\'s able about above according accordingly across actually after afterwards again against ain\'t\n            all allow allows almost alone along already also although always am among amongst an and another\n            any anybody anyhow anyone anything anyway anyways anywhere apart appear appreciate appropriate are\n            aren\'t around as aside ask asking associated at available away awfully be became because become\n            becomes becoming been before beforehand behind being believe below beside besides best better between\n            beyond both brief but by c\'mon c\'s came can can\'t cannot cant cause causes certain certainly changes\n            clearly co com come comes concerning consequently consider considering contain containing contains\n            corresponding could couldn\'t course currently definitely described despite did didn\'t different do\n            does doesn\'t doing don\'t done down downwards during each edu eg eight either else elsewhere enough\n            entirely especially et etc even ever every everybody everyone everything everywhere ex exactly example\n            except far few fifth first five followed following follows for former formerly forth four from further\n            furthermore get gets getting given gives go goes going gone got gotten greetings had hadn\'t happens\n            hardly has hasn\'t have haven\'t having he he\'s hello help hence her here here\'s hereafter hereby herein\n            hereupon hers herself hi him himself his hither hopefully how howbeit however i\'d i\'ll i\'m i\'ve ie if\n            ignored immediate in inasmuch inc indeed indicate indicated indicates inner insofar instead into\n            inward is isn\'t it it\'d it\'ll it\'s its itself just keep keeps kept know known knows last lately later\n            latter latterly least less lest let let\'s like liked likely little look looking looks ltd mainly many\n            may maybe me mean meanwhile merely might more moreover most mostly much must my myself name namely nd\n            near nearly necessary need needs neither never nevertheless new next nine no nobody non none noone nor\n            normally not nothing novel now nowhere obviously of off often oh ok okay old on once one ones only\n            onto or other others otherwise ought our ours ourselves out outside over overall own particular\n            particularly per perhaps placed please plus possible presumably probably provides que quite qv rather\n            rd re really reasonably regarding regardless regards relatively respectively right said same saw say\n            saying says second secondly see seeing seem seemed seeming seems seen self selves sensible sent\n            serious seriously seven several shall she should shouldn\'t since six so some somebody somehow someone\n            something sometime sometimes somewhat somewhere soon sorry specified specify specifying still sub such\n            sup sure t\'s take taken tell tends th than thank thanks thanx that that\'s thats the their theirs them\n            themselves then thence there there\'s thereafter thereby therefore therein theres thereupon these they\n            they\'d they\'ll they\'re they\'ve think third this thorough thoroughly those though three through\n            throughout thru thus to together too took toward towards tried tries truly try trying twice two un\n            under unfortunately unless unlikely until unto up upon us use used useful uses using usually value\n            various very via viz vs want wants was wasn\'t way we we\'d we\'ll we\'re we\'ve welcome well went were\n            weren\'t what what\'s whatever when whence whenever where where\'s whereafter whereas whereby wherein\n            whereupon wherever whether which while whither who who\'s whoever whole whom whose why will willing\n            wish with within without won\'t wonder would wouldn\'t yes yet you you\'d you\'ll you\'re you\'ve your\n            yours yourself yourselves zero\";s:10:\"can_manage\";a:0:{}s:20:\"can_manage_shortcuts\";a:0:{}s:18:\"can_manage_lexicon\";a:0:{}s:11:\"can_replace\";a:0:{}s:19:\"can_view_search_log\";a:0:{}s:20:\"can_view_replace_log\";a:0:{}}',10,'8.0.3','y'),
	(19,'Pro_search_ext','after_channel_entry_update','after_channel_entry_update','a:18:{s:12:\"encode_query\";s:1:\"y\";s:15:\"min_word_length\";s:1:\"4\";s:14:\"excerpt_length\";s:2:\"50\";s:14:\"excerpt_hilite\";s:0:\"\";s:12:\"title_hilite\";s:0:\"\";s:10:\"batch_size\";s:3:\"100\";s:19:\"default_result_page\";s:14:\"search/results\";s:15:\"search_log_size\";s:3:\"500\";s:12:\"ignore_words\";s:20:\"a an and the or of s\";s:16:\"disabled_filters\";a:0:{}s:19:\"build_index_act_key\";s:40:\"9132C5E24D65E5469E8FCACF26896463AB48C77D\";s:10:\"stop_words\";s:3945:\"a\'s able about above according accordingly across actually after afterwards again against ain\'t\n            all allow allows almost alone along already also although always am among amongst an and another\n            any anybody anyhow anyone anything anyway anyways anywhere apart appear appreciate appropriate are\n            aren\'t around as aside ask asking associated at available away awfully be became because become\n            becomes becoming been before beforehand behind being believe below beside besides best better between\n            beyond both brief but by c\'mon c\'s came can can\'t cannot cant cause causes certain certainly changes\n            clearly co com come comes concerning consequently consider considering contain containing contains\n            corresponding could couldn\'t course currently definitely described despite did didn\'t different do\n            does doesn\'t doing don\'t done down downwards during each edu eg eight either else elsewhere enough\n            entirely especially et etc even ever every everybody everyone everything everywhere ex exactly example\n            except far few fifth first five followed following follows for former formerly forth four from further\n            furthermore get gets getting given gives go goes going gone got gotten greetings had hadn\'t happens\n            hardly has hasn\'t have haven\'t having he he\'s hello help hence her here here\'s hereafter hereby herein\n            hereupon hers herself hi him himself his hither hopefully how howbeit however i\'d i\'ll i\'m i\'ve ie if\n            ignored immediate in inasmuch inc indeed indicate indicated indicates inner insofar instead into\n            inward is isn\'t it it\'d it\'ll it\'s its itself just keep keeps kept know known knows last lately later\n            latter latterly least less lest let let\'s like liked likely little look looking looks ltd mainly many\n            may maybe me mean meanwhile merely might more moreover most mostly much must my myself name namely nd\n            near nearly necessary need needs neither never nevertheless new next nine no nobody non none noone nor\n            normally not nothing novel now nowhere obviously of off often oh ok okay old on once one ones only\n            onto or other others otherwise ought our ours ourselves out outside over overall own particular\n            particularly per perhaps placed please plus possible presumably probably provides que quite qv rather\n            rd re really reasonably regarding regardless regards relatively respectively right said same saw say\n            saying says second secondly see seeing seem seemed seeming seems seen self selves sensible sent\n            serious seriously seven several shall she should shouldn\'t since six so some somebody somehow someone\n            something sometime sometimes somewhat somewhere soon sorry specified specify specifying still sub such\n            sup sure t\'s take taken tell tends th than thank thanks thanx that that\'s thats the their theirs them\n            themselves then thence there there\'s thereafter thereby therefore therein theres thereupon these they\n            they\'d they\'ll they\'re they\'ve think third this thorough thoroughly those though three through\n            throughout thru thus to together too took toward towards tried tries truly try trying twice two un\n            under unfortunately unless unlikely until unto up upon us use used useful uses using usually value\n            various very via viz vs want wants was wasn\'t way we we\'d we\'ll we\'re we\'ve welcome well went were\n            weren\'t what what\'s whatever when whence whenever where where\'s whereafter whereas whereby wherein\n            whereupon wherever whether which while whither who who\'s whoever whole whom whose why will willing\n            wish with within without won\'t wonder would wouldn\'t yes yet you you\'d you\'ll you\'re you\'ve your\n            yours yourself yourselves zero\";s:10:\"can_manage\";a:0:{}s:20:\"can_manage_shortcuts\";a:0:{}s:18:\"can_manage_lexicon\";a:0:{}s:11:\"can_replace\";a:0:{}s:19:\"can_view_search_log\";a:0:{}s:20:\"can_view_replace_log\";a:0:{}}',10,'8.0.3','y'),
	(20,'Pro_search_ext','after_channel_entry_delete','after_channel_entry_delete','a:18:{s:12:\"encode_query\";s:1:\"y\";s:15:\"min_word_length\";s:1:\"4\";s:14:\"excerpt_length\";s:2:\"50\";s:14:\"excerpt_hilite\";s:0:\"\";s:12:\"title_hilite\";s:0:\"\";s:10:\"batch_size\";s:3:\"100\";s:19:\"default_result_page\";s:14:\"search/results\";s:15:\"search_log_size\";s:3:\"500\";s:12:\"ignore_words\";s:20:\"a an and the or of s\";s:16:\"disabled_filters\";a:0:{}s:19:\"build_index_act_key\";s:40:\"9132C5E24D65E5469E8FCACF26896463AB48C77D\";s:10:\"stop_words\";s:3945:\"a\'s able about above according accordingly across actually after afterwards again against ain\'t\n            all allow allows almost alone along already also although always am among amongst an and another\n            any anybody anyhow anyone anything anyway anyways anywhere apart appear appreciate appropriate are\n            aren\'t around as aside ask asking associated at available away awfully be became because become\n            becomes becoming been before beforehand behind being believe below beside besides best better between\n            beyond both brief but by c\'mon c\'s came can can\'t cannot cant cause causes certain certainly changes\n            clearly co com come comes concerning consequently consider considering contain containing contains\n            corresponding could couldn\'t course currently definitely described despite did didn\'t different do\n            does doesn\'t doing don\'t done down downwards during each edu eg eight either else elsewhere enough\n            entirely especially et etc even ever every everybody everyone everything everywhere ex exactly example\n            except far few fifth first five followed following follows for former formerly forth four from further\n            furthermore get gets getting given gives go goes going gone got gotten greetings had hadn\'t happens\n            hardly has hasn\'t have haven\'t having he he\'s hello help hence her here here\'s hereafter hereby herein\n            hereupon hers herself hi him himself his hither hopefully how howbeit however i\'d i\'ll i\'m i\'ve ie if\n            ignored immediate in inasmuch inc indeed indicate indicated indicates inner insofar instead into\n            inward is isn\'t it it\'d it\'ll it\'s its itself just keep keeps kept know known knows last lately later\n            latter latterly least less lest let let\'s like liked likely little look looking looks ltd mainly many\n            may maybe me mean meanwhile merely might more moreover most mostly much must my myself name namely nd\n            near nearly necessary need needs neither never nevertheless new next nine no nobody non none noone nor\n            normally not nothing novel now nowhere obviously of off often oh ok okay old on once one ones only\n            onto or other others otherwise ought our ours ourselves out outside over overall own particular\n            particularly per perhaps placed please plus possible presumably probably provides que quite qv rather\n            rd re really reasonably regarding regardless regards relatively respectively right said same saw say\n            saying says second secondly see seeing seem seemed seeming seems seen self selves sensible sent\n            serious seriously seven several shall she should shouldn\'t since six so some somebody somehow someone\n            something sometime sometimes somewhat somewhere soon sorry specified specify specifying still sub such\n            sup sure t\'s take taken tell tends th than thank thanks thanx that that\'s thats the their theirs them\n            themselves then thence there there\'s thereafter thereby therefore therein theres thereupon these they\n            they\'d they\'ll they\'re they\'ve think third this thorough thoroughly those though three through\n            throughout thru thus to together too took toward towards tried tries truly try trying twice two un\n            under unfortunately unless unlikely until unto up upon us use used useful uses using usually value\n            various very via viz vs want wants was wasn\'t way we we\'d we\'ll we\'re we\'ve welcome well went were\n            weren\'t what what\'s whatever when whence whenever where where\'s whereafter whereas whereby wherein\n            whereupon wherever whether which while whither who who\'s whoever whole whom whose why will willing\n            wish with within without won\'t wonder would wouldn\'t yes yet you you\'d you\'ll you\'re you\'ve your\n            yours yourself yourselves zero\";s:10:\"can_manage\";a:0:{}s:20:\"can_manage_shortcuts\";a:0:{}s:18:\"can_manage_lexicon\";a:0:{}s:11:\"can_replace\";a:0:{}s:19:\"can_view_search_log\";a:0:{}s:20:\"can_view_replace_log\";a:0:{}}',10,'8.0.3','y'),
	(21,'Pro_search_ext','channel_entries_query_result','channel_entries_query_result','a:18:{s:12:\"encode_query\";s:1:\"y\";s:15:\"min_word_length\";s:1:\"4\";s:14:\"excerpt_length\";s:2:\"50\";s:14:\"excerpt_hilite\";s:0:\"\";s:12:\"title_hilite\";s:0:\"\";s:10:\"batch_size\";s:3:\"100\";s:19:\"default_result_page\";s:14:\"search/results\";s:15:\"search_log_size\";s:3:\"500\";s:12:\"ignore_words\";s:20:\"a an and the or of s\";s:16:\"disabled_filters\";a:0:{}s:19:\"build_index_act_key\";s:40:\"9132C5E24D65E5469E8FCACF26896463AB48C77D\";s:10:\"stop_words\";s:3945:\"a\'s able about above according accordingly across actually after afterwards again against ain\'t\n            all allow allows almost alone along already also although always am among amongst an and another\n            any anybody anyhow anyone anything anyway anyways anywhere apart appear appreciate appropriate are\n            aren\'t around as aside ask asking associated at available away awfully be became because become\n            becomes becoming been before beforehand behind being believe below beside besides best better between\n            beyond both brief but by c\'mon c\'s came can can\'t cannot cant cause causes certain certainly changes\n            clearly co com come comes concerning consequently consider considering contain containing contains\n            corresponding could couldn\'t course currently definitely described despite did didn\'t different do\n            does doesn\'t doing don\'t done down downwards during each edu eg eight either else elsewhere enough\n            entirely especially et etc even ever every everybody everyone everything everywhere ex exactly example\n            except far few fifth first five followed following follows for former formerly forth four from further\n            furthermore get gets getting given gives go goes going gone got gotten greetings had hadn\'t happens\n            hardly has hasn\'t have haven\'t having he he\'s hello help hence her here here\'s hereafter hereby herein\n            hereupon hers herself hi him himself his hither hopefully how howbeit however i\'d i\'ll i\'m i\'ve ie if\n            ignored immediate in inasmuch inc indeed indicate indicated indicates inner insofar instead into\n            inward is isn\'t it it\'d it\'ll it\'s its itself just keep keeps kept know known knows last lately later\n            latter latterly least less lest let let\'s like liked likely little look looking looks ltd mainly many\n            may maybe me mean meanwhile merely might more moreover most mostly much must my myself name namely nd\n            near nearly necessary need needs neither never nevertheless new next nine no nobody non none noone nor\n            normally not nothing novel now nowhere obviously of off often oh ok okay old on once one ones only\n            onto or other others otherwise ought our ours ourselves out outside over overall own particular\n            particularly per perhaps placed please plus possible presumably probably provides que quite qv rather\n            rd re really reasonably regarding regardless regards relatively respectively right said same saw say\n            saying says second secondly see seeing seem seemed seeming seems seen self selves sensible sent\n            serious seriously seven several shall she should shouldn\'t since six so some somebody somehow someone\n            something sometime sometimes somewhat somewhere soon sorry specified specify specifying still sub such\n            sup sure t\'s take taken tell tends th than thank thanks thanx that that\'s thats the their theirs them\n            themselves then thence there there\'s thereafter thereby therefore therein theres thereupon these they\n            they\'d they\'ll they\'re they\'ve think third this thorough thoroughly those though three through\n            throughout thru thus to together too took toward towards tried tries truly try trying twice two un\n            under unfortunately unless unlikely until unto up upon us use used useful uses using usually value\n            various very via viz vs want wants was wasn\'t way we we\'d we\'ll we\'re we\'ve welcome well went were\n            weren\'t what what\'s whatever when whence whenever where where\'s whereafter whereas whereby wherein\n            whereupon wherever whether which while whither who who\'s whoever whole whom whose why will willing\n            wish with within without won\'t wonder would wouldn\'t yes yet you you\'d you\'ll you\'re you\'ve your\n            yours yourself yourselves zero\";s:10:\"can_manage\";a:0:{}s:20:\"can_manage_shortcuts\";a:0:{}s:18:\"can_manage_lexicon\";a:0:{}s:11:\"can_replace\";a:0:{}s:19:\"can_view_search_log\";a:0:{}s:20:\"can_view_replace_log\";a:0:{}}',10,'8.0.3','y'),
	(22,'Pro_search_ext','after_category_save','after_category_save','a:18:{s:12:\"encode_query\";s:1:\"y\";s:15:\"min_word_length\";s:1:\"4\";s:14:\"excerpt_length\";s:2:\"50\";s:14:\"excerpt_hilite\";s:0:\"\";s:12:\"title_hilite\";s:0:\"\";s:10:\"batch_size\";s:3:\"100\";s:19:\"default_result_page\";s:14:\"search/results\";s:15:\"search_log_size\";s:3:\"500\";s:12:\"ignore_words\";s:20:\"a an and the or of s\";s:16:\"disabled_filters\";a:0:{}s:19:\"build_index_act_key\";s:40:\"9132C5E24D65E5469E8FCACF26896463AB48C77D\";s:10:\"stop_words\";s:3945:\"a\'s able about above according accordingly across actually after afterwards again against ain\'t\n            all allow allows almost alone along already also although always am among amongst an and another\n            any anybody anyhow anyone anything anyway anyways anywhere apart appear appreciate appropriate are\n            aren\'t around as aside ask asking associated at available away awfully be became because become\n            becomes becoming been before beforehand behind being believe below beside besides best better between\n            beyond both brief but by c\'mon c\'s came can can\'t cannot cant cause causes certain certainly changes\n            clearly co com come comes concerning consequently consider considering contain containing contains\n            corresponding could couldn\'t course currently definitely described despite did didn\'t different do\n            does doesn\'t doing don\'t done down downwards during each edu eg eight either else elsewhere enough\n            entirely especially et etc even ever every everybody everyone everything everywhere ex exactly example\n            except far few fifth first five followed following follows for former formerly forth four from further\n            furthermore get gets getting given gives go goes going gone got gotten greetings had hadn\'t happens\n            hardly has hasn\'t have haven\'t having he he\'s hello help hence her here here\'s hereafter hereby herein\n            hereupon hers herself hi him himself his hither hopefully how howbeit however i\'d i\'ll i\'m i\'ve ie if\n            ignored immediate in inasmuch inc indeed indicate indicated indicates inner insofar instead into\n            inward is isn\'t it it\'d it\'ll it\'s its itself just keep keeps kept know known knows last lately later\n            latter latterly least less lest let let\'s like liked likely little look looking looks ltd mainly many\n            may maybe me mean meanwhile merely might more moreover most mostly much must my myself name namely nd\n            near nearly necessary need needs neither never nevertheless new next nine no nobody non none noone nor\n            normally not nothing novel now nowhere obviously of off often oh ok okay old on once one ones only\n            onto or other others otherwise ought our ours ourselves out outside over overall own particular\n            particularly per perhaps placed please plus possible presumably probably provides que quite qv rather\n            rd re really reasonably regarding regardless regards relatively respectively right said same saw say\n            saying says second secondly see seeing seem seemed seeming seems seen self selves sensible sent\n            serious seriously seven several shall she should shouldn\'t since six so some somebody somehow someone\n            something sometime sometimes somewhat somewhere soon sorry specified specify specifying still sub such\n            sup sure t\'s take taken tell tends th than thank thanks thanx that that\'s thats the their theirs them\n            themselves then thence there there\'s thereafter thereby therefore therein theres thereupon these they\n            they\'d they\'ll they\'re they\'ve think third this thorough thoroughly those though three through\n            throughout thru thus to together too took toward towards tried tries truly try trying twice two un\n            under unfortunately unless unlikely until unto up upon us use used useful uses using usually value\n            various very via viz vs want wants was wasn\'t way we we\'d we\'ll we\'re we\'ve welcome well went were\n            weren\'t what what\'s whatever when whence whenever where where\'s whereafter whereas whereby wherein\n            whereupon wherever whether which while whither who who\'s whoever whole whom whose why will willing\n            wish with within without won\'t wonder would wouldn\'t yes yet you you\'d you\'ll you\'re you\'ve your\n            yours yourself yourselves zero\";s:10:\"can_manage\";a:0:{}s:20:\"can_manage_shortcuts\";a:0:{}s:18:\"can_manage_lexicon\";a:0:{}s:11:\"can_replace\";a:0:{}s:19:\"can_view_search_log\";a:0:{}s:20:\"can_view_replace_log\";a:0:{}}',10,'8.0.3','y'),
	(23,'Pro_search_ext','after_category_delete','after_category_delete','a:18:{s:12:\"encode_query\";s:1:\"y\";s:15:\"min_word_length\";s:1:\"4\";s:14:\"excerpt_length\";s:2:\"50\";s:14:\"excerpt_hilite\";s:0:\"\";s:12:\"title_hilite\";s:0:\"\";s:10:\"batch_size\";s:3:\"100\";s:19:\"default_result_page\";s:14:\"search/results\";s:15:\"search_log_size\";s:3:\"500\";s:12:\"ignore_words\";s:20:\"a an and the or of s\";s:16:\"disabled_filters\";a:0:{}s:19:\"build_index_act_key\";s:40:\"9132C5E24D65E5469E8FCACF26896463AB48C77D\";s:10:\"stop_words\";s:3945:\"a\'s able about above according accordingly across actually after afterwards again against ain\'t\n            all allow allows almost alone along already also although always am among amongst an and another\n            any anybody anyhow anyone anything anyway anyways anywhere apart appear appreciate appropriate are\n            aren\'t around as aside ask asking associated at available away awfully be became because become\n            becomes becoming been before beforehand behind being believe below beside besides best better between\n            beyond both brief but by c\'mon c\'s came can can\'t cannot cant cause causes certain certainly changes\n            clearly co com come comes concerning consequently consider considering contain containing contains\n            corresponding could couldn\'t course currently definitely described despite did didn\'t different do\n            does doesn\'t doing don\'t done down downwards during each edu eg eight either else elsewhere enough\n            entirely especially et etc even ever every everybody everyone everything everywhere ex exactly example\n            except far few fifth first five followed following follows for former formerly forth four from further\n            furthermore get gets getting given gives go goes going gone got gotten greetings had hadn\'t happens\n            hardly has hasn\'t have haven\'t having he he\'s hello help hence her here here\'s hereafter hereby herein\n            hereupon hers herself hi him himself his hither hopefully how howbeit however i\'d i\'ll i\'m i\'ve ie if\n            ignored immediate in inasmuch inc indeed indicate indicated indicates inner insofar instead into\n            inward is isn\'t it it\'d it\'ll it\'s its itself just keep keeps kept know known knows last lately later\n            latter latterly least less lest let let\'s like liked likely little look looking looks ltd mainly many\n            may maybe me mean meanwhile merely might more moreover most mostly much must my myself name namely nd\n            near nearly necessary need needs neither never nevertheless new next nine no nobody non none noone nor\n            normally not nothing novel now nowhere obviously of off often oh ok okay old on once one ones only\n            onto or other others otherwise ought our ours ourselves out outside over overall own particular\n            particularly per perhaps placed please plus possible presumably probably provides que quite qv rather\n            rd re really reasonably regarding regardless regards relatively respectively right said same saw say\n            saying says second secondly see seeing seem seemed seeming seems seen self selves sensible sent\n            serious seriously seven several shall she should shouldn\'t since six so some somebody somehow someone\n            something sometime sometimes somewhat somewhere soon sorry specified specify specifying still sub such\n            sup sure t\'s take taken tell tends th than thank thanks thanx that that\'s thats the their theirs them\n            themselves then thence there there\'s thereafter thereby therefore therein theres thereupon these they\n            they\'d they\'ll they\'re they\'ve think third this thorough thoroughly those though three through\n            throughout thru thus to together too took toward towards tried tries truly try trying twice two un\n            under unfortunately unless unlikely until unto up upon us use used useful uses using usually value\n            various very via viz vs want wants was wasn\'t way we we\'d we\'ll we\'re we\'ve welcome well went were\n            weren\'t what what\'s whatever when whence whenever where where\'s whereafter whereas whereby wherein\n            whereupon wherever whether which while whither who who\'s whoever whole whom whose why will willing\n            wish with within without won\'t wonder would wouldn\'t yes yet you you\'d you\'ll you\'re you\'ve your\n            yours yourself yourselves zero\";s:10:\"can_manage\";a:0:{}s:20:\"can_manage_shortcuts\";a:0:{}s:18:\"can_manage_lexicon\";a:0:{}s:11:\"can_replace\";a:0:{}s:19:\"can_view_search_log\";a:0:{}s:20:\"can_view_replace_log\";a:0:{}}',10,'8.0.3','y'),
	(24,'Pro_search_ext','after_channel_field_delete','after_channel_field_delete','a:18:{s:12:\"encode_query\";s:1:\"y\";s:15:\"min_word_length\";s:1:\"4\";s:14:\"excerpt_length\";s:2:\"50\";s:14:\"excerpt_hilite\";s:0:\"\";s:12:\"title_hilite\";s:0:\"\";s:10:\"batch_size\";s:3:\"100\";s:19:\"default_result_page\";s:14:\"search/results\";s:15:\"search_log_size\";s:3:\"500\";s:12:\"ignore_words\";s:20:\"a an and the or of s\";s:16:\"disabled_filters\";a:0:{}s:19:\"build_index_act_key\";s:40:\"9132C5E24D65E5469E8FCACF26896463AB48C77D\";s:10:\"stop_words\";s:3945:\"a\'s able about above according accordingly across actually after afterwards again against ain\'t\n            all allow allows almost alone along already also although always am among amongst an and another\n            any anybody anyhow anyone anything anyway anyways anywhere apart appear appreciate appropriate are\n            aren\'t around as aside ask asking associated at available away awfully be became because become\n            becomes becoming been before beforehand behind being believe below beside besides best better between\n            beyond both brief but by c\'mon c\'s came can can\'t cannot cant cause causes certain certainly changes\n            clearly co com come comes concerning consequently consider considering contain containing contains\n            corresponding could couldn\'t course currently definitely described despite did didn\'t different do\n            does doesn\'t doing don\'t done down downwards during each edu eg eight either else elsewhere enough\n            entirely especially et etc even ever every everybody everyone everything everywhere ex exactly example\n            except far few fifth first five followed following follows for former formerly forth four from further\n            furthermore get gets getting given gives go goes going gone got gotten greetings had hadn\'t happens\n            hardly has hasn\'t have haven\'t having he he\'s hello help hence her here here\'s hereafter hereby herein\n            hereupon hers herself hi him himself his hither hopefully how howbeit however i\'d i\'ll i\'m i\'ve ie if\n            ignored immediate in inasmuch inc indeed indicate indicated indicates inner insofar instead into\n            inward is isn\'t it it\'d it\'ll it\'s its itself just keep keeps kept know known knows last lately later\n            latter latterly least less lest let let\'s like liked likely little look looking looks ltd mainly many\n            may maybe me mean meanwhile merely might more moreover most mostly much must my myself name namely nd\n            near nearly necessary need needs neither never nevertheless new next nine no nobody non none noone nor\n            normally not nothing novel now nowhere obviously of off often oh ok okay old on once one ones only\n            onto or other others otherwise ought our ours ourselves out outside over overall own particular\n            particularly per perhaps placed please plus possible presumably probably provides que quite qv rather\n            rd re really reasonably regarding regardless regards relatively respectively right said same saw say\n            saying says second secondly see seeing seem seemed seeming seems seen self selves sensible sent\n            serious seriously seven several shall she should shouldn\'t since six so some somebody somehow someone\n            something sometime sometimes somewhat somewhere soon sorry specified specify specifying still sub such\n            sup sure t\'s take taken tell tends th than thank thanks thanx that that\'s thats the their theirs them\n            themselves then thence there there\'s thereafter thereby therefore therein theres thereupon these they\n            they\'d they\'ll they\'re they\'ve think third this thorough thoroughly those though three through\n            throughout thru thus to together too took toward towards tried tries truly try trying twice two un\n            under unfortunately unless unlikely until unto up upon us use used useful uses using usually value\n            various very via viz vs want wants was wasn\'t way we we\'d we\'ll we\'re we\'ve welcome well went were\n            weren\'t what what\'s whatever when whence whenever where where\'s whereafter whereas whereby wherein\n            whereupon wherever whether which while whither who who\'s whoever whole whom whose why will willing\n            wish with within without won\'t wonder would wouldn\'t yes yet you you\'d you\'ll you\'re you\'ve your\n            yours yourself yourselves zero\";s:10:\"can_manage\";a:0:{}s:20:\"can_manage_shortcuts\";a:0:{}s:18:\"can_manage_lexicon\";a:0:{}s:11:\"can_replace\";a:0:{}s:19:\"can_view_search_log\";a:0:{}s:20:\"can_view_replace_log\";a:0:{}}',10,'8.0.3','y'),
	(29,'Simple_grids_ext','cp_js_end','cp_js_end','',5,'1.7.4','y'),
	(30,'Bloqs_ext','after_channel_entry_delete','after_channel_entry_delete','',5,'5.0.14','y'),
	(31,'Bloqs_ext','core_boot','core_boot','',5,'5.0.14','y'),
	(32,'Bloqs_ext','after_channel_entry_update','after_channel_entry_update','',5,'5.0.14','y'),
	(33,'Bloqs_ext','relationships_query','relationships_query','',4,'5.0.14','y'),
	(34,'Bloqs_ext','after_channel_entry_save','after_channel_entry_save','',4,'5.0.14','y'),
	(35,'Bloqs_ext','cp_js_end','cp_js_end','',5,'5.0.14','y');

/*!40000 ALTER TABLE `exp_extensions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_field_condition_sets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_field_condition_sets`;

CREATE TABLE `exp_field_condition_sets` (
  `condition_set_id` int unsigned NOT NULL AUTO_INCREMENT,
  `match` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'all',
  `order` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`condition_set_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_field_condition_sets_channel_fields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_field_condition_sets_channel_fields`;

CREATE TABLE `exp_field_condition_sets_channel_fields` (
  `condition_set_id` int unsigned NOT NULL,
  `field_id` int unsigned NOT NULL,
  PRIMARY KEY (`condition_set_id`,`field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_field_conditions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_field_conditions`;

CREATE TABLE `exp_field_conditions` (
  `condition_id` int unsigned NOT NULL AUTO_INCREMENT,
  `condition_set_id` int unsigned NOT NULL,
  `condition_field_id` int unsigned NOT NULL,
  `evaluation_rule` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`condition_id`),
  KEY `condition_set_id` (`condition_set_id`),
  KEY `condition_field_id` (`condition_field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_field_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_field_groups`;

CREATE TABLE `exp_field_groups` (
  `group_id` int unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int unsigned DEFAULT '1',
  `group_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group_description` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_field_groups` WRITE;
/*!40000 ALTER TABLE `exp_field_groups` DISABLE KEYS */;

INSERT INTO `exp_field_groups` (`group_id`, `site_id`, `group_name`, `short_name`, `group_description`)
VALUES
	(2,0,'Clients Group','clients_group',''),
	(3,0,'Related Blogs','related_blogs',''),
	(4,0,'Testimonials','testimonials',''),
	(5,0,'Big Callout','big_callout',''),
	(6,0,'Small Callout','small_callout',''),
	(7,0,'Background Text Scroller','background_text_scroller',''),
	(8,0,'static-pages','static_pages',''),
	(9,0,'Home Hero','home_hero',''),
	(10,0,'Standard Hero','standard_hero',''),
	(11,0,'Blog Hero','blog_hero',''),
	(12,0,'SEO Group','seo_group','');

/*!40000 ALTER TABLE `exp_field_groups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_fieldtypes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_fieldtypes`;

CREATE TABLE `exp_fieldtypes` (
  `fieldtype_id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `has_global_settings` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'n',
  PRIMARY KEY (`fieldtype_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_fieldtypes` WRITE;
/*!40000 ALTER TABLE `exp_fieldtypes` DISABLE KEYS */;

INSERT INTO `exp_fieldtypes` (`fieldtype_id`, `name`, `version`, `settings`, `has_global_settings`)
VALUES
	(1,'select','1.0.0','YTowOnt9','n'),
	(2,'text','1.0.0','YTowOnt9','n'),
	(3,'number','1.0.0','YTowOnt9','n'),
	(4,'textarea','1.0.0','YTowOnt9','n'),
	(5,'date','1.0.0','YTowOnt9','n'),
	(6,'duration','1.0.0','YTowOnt9','n'),
	(7,'email_address','1.0.0','YTowOnt9','n'),
	(8,'file','1.1.0','YTowOnt9','n'),
	(9,'fluid_field','1.0.0','YTowOnt9','n'),
	(10,'grid','1.0.0','YTowOnt9','n'),
	(11,'file_grid','1.0.0','YTowOnt9','n'),
	(12,'multi_select','1.0.0','YTowOnt9','n'),
	(13,'checkboxes','1.0.0','YTowOnt9','n'),
	(14,'radio','1.0.0','YTowOnt9','n'),
	(15,'relationship','1.0.0','YTowOnt9','n'),
	(16,'rte','2.2.0','YTowOnt9','n'),
	(17,'slider','1.0.0','YTowOnt9','n'),
	(18,'range_slider','1.0.0','YTowOnt9','n'),
	(19,'toggle','1.0.0','YTowOnt9','n'),
	(20,'url','1.0.0','YTowOnt9','n'),
	(21,'colorpicker','1.0.0','YTowOnt9','n'),
	(22,'selectable_buttons','1.0.0','YTowOnt9','n'),
	(23,'notes','1.0.0','YTowOnt9','n'),
	(24,'member','2.4.0','YTowOnt9','n'),
	(25,'structure','6.0.0','YToxOntzOjE5OiJzdHJ1Y3R1cmVfbGlzdF90eXBlIjtzOjU6InBhZ2VzIjt9','n'),
	(26,'pro_variables','5.0.3','YTowOnt9','n'),
	(27,'simple_table','1.7.4','YTowOnt9','n'),
	(28,'simple_grid','1.7.4','YTowOnt9','n'),
	(29,'bloqs','5.0.14','YTowOnt9','n');

/*!40000 ALTER TABLE `exp_fieldtypes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_file_categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_file_categories`;

CREATE TABLE `exp_file_categories` (
  `file_id` int unsigned NOT NULL,
  `cat_id` int unsigned NOT NULL,
  `sort` int unsigned DEFAULT '0',
  `is_cover` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'n',
  PRIMARY KEY (`file_id`,`cat_id`),
  KEY `cat_id` (`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_file_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_file_data`;

CREATE TABLE `exp_file_data` (
  `file_id` int unsigned NOT NULL,
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_file_dimensions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_file_dimensions`;

CREATE TABLE `exp_file_dimensions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int unsigned NOT NULL DEFAULT '1',
  `upload_location_id` int unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `short_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `resize_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `width` int DEFAULT '0',
  `height` int DEFAULT '0',
  `quality` tinyint unsigned DEFAULT '90',
  `watermark_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `upload_location_id` (`upload_location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_file_manager_views
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_file_manager_views`;

CREATE TABLE `exp_file_manager_views` (
  `view_id` int unsigned NOT NULL AUTO_INCREMENT,
  `viewtype` varchar(10) NOT NULL DEFAULT 'list',
  `upload_id` int unsigned NOT NULL,
  `member_id` int unsigned NOT NULL,
  `name` varchar(128) NOT NULL DEFAULT '',
  `columns` text NOT NULL,
  PRIMARY KEY (`view_id`),
  KEY `viewtype_upload_id_member_id` (`viewtype`,`upload_id`,`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump of table exp_file_usage
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_file_usage`;

CREATE TABLE `exp_file_usage` (
  `file_usage_id` int unsigned NOT NULL AUTO_INCREMENT,
  `file_id` int unsigned NOT NULL,
  `entry_id` int unsigned NOT NULL DEFAULT '0',
  `cat_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`file_usage_id`),
  KEY `file_id` (`file_id`),
  KEY `entry_id` (`entry_id`),
  KEY `cat_id` (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_file_usage` WRITE;
/*!40000 ALTER TABLE `exp_file_usage` DISABLE KEYS */;

INSERT INTO `exp_file_usage` (`file_usage_id`, `file_id`, `entry_id`, `cat_id`)
VALUES
	(2,1,7,0);

/*!40000 ALTER TABLE `exp_file_usage` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_file_watermarks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_file_watermarks`;

CREATE TABLE `exp_file_watermarks` (
  `wm_id` int unsigned NOT NULL AUTO_INCREMENT,
  `wm_name` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wm_type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT 'text',
  `wm_image_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wm_test_image_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wm_use_font` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'y',
  `wm_font` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wm_font_size` int unsigned DEFAULT NULL,
  `wm_text` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wm_vrt_alignment` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT 'top',
  `wm_hor_alignment` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT 'left',
  `wm_padding` int unsigned DEFAULT NULL,
  `wm_opacity` int unsigned DEFAULT NULL,
  `wm_hor_offset` int unsigned DEFAULT NULL,
  `wm_vrt_offset` int unsigned DEFAULT NULL,
  `wm_x_transp` int DEFAULT NULL,
  `wm_y_transp` int DEFAULT NULL,
  `wm_font_color` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wm_use_drop_shadow` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'y',
  `wm_shadow_distance` int unsigned DEFAULT NULL,
  `wm_shadow_color` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`wm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_files
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_files`;

CREATE TABLE `exp_files` (
  `file_id` int unsigned NOT NULL AUTO_INCREMENT,
  `model_type` enum('File','Directory') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'File',
  `site_id` int unsigned DEFAULT '1',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `upload_location_id` int unsigned DEFAULT '0',
  `directory_id` int unsigned DEFAULT '0',
  `mime_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_size` int DEFAULT '0',
  `description` text COLLATE utf8mb4_unicode_ci,
  `credit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uploaded_by_member_id` int unsigned DEFAULT '0',
  `upload_date` int DEFAULT NULL,
  `modified_by_member_id` int unsigned DEFAULT '0',
  `modified_date` int DEFAULT NULL,
  `file_hw_original` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `total_records` int unsigned DEFAULT '0',
  PRIMARY KEY (`file_id`),
  KEY `model_type` (`model_type`),
  KEY `upload_location_id` (`upload_location_id`),
  KEY `directory_id` (`directory_id`),
  KEY `file_type` (`file_type`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_files` WRITE;
/*!40000 ALTER TABLE `exp_files` DISABLE KEYS */;

INSERT INTO `exp_files` (`file_id`, `model_type`, `site_id`, `title`, `upload_location_id`, `directory_id`, `mime_type`, `file_type`, `file_name`, `file_size`, `description`, `credit`, `location`, `uploaded_by_member_id`, `upload_date`, `modified_by_member_id`, `modified_date`, `file_hw_original`, `total_records`)
VALUES
	(1,'File',1,'bg-cf-heart.svg',4,0,'image/svg+xml','img','bg-cf-heart.svg',839956,NULL,NULL,NULL,1,1720117260,1,1720117260,' ',1);

/*!40000 ALTER TABLE `exp_files` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_fluid_field_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_fluid_field_data`;

CREATE TABLE `exp_fluid_field_data` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `fluid_field_id` int unsigned NOT NULL,
  `entry_id` int unsigned NOT NULL,
  `field_id` int unsigned NOT NULL,
  `field_data_id` int unsigned NOT NULL,
  `field_group_id` int unsigned DEFAULT NULL,
  `order` int unsigned NOT NULL DEFAULT '0',
  `group` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fluid_field_id_entry_id` (`fluid_field_id`,`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_global_variables
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_global_variables`;

CREATE TABLE `exp_global_variables` (
  `variable_id` int unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int unsigned NOT NULL DEFAULT '1',
  `variable_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `variable_data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `edit_date` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`variable_id`),
  KEY `variable_name` (`variable_name`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_grid_columns
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_grid_columns`;

CREATE TABLE `exp_grid_columns` (
  `col_id` int unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int unsigned DEFAULT NULL,
  `content_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `col_order` int unsigned DEFAULT NULL,
  `col_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `col_label` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `col_name` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `col_instructions` text COLLATE utf8mb4_unicode_ci,
  `col_required` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `col_search` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `col_width` int unsigned DEFAULT NULL,
  `col_settings` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`col_id`),
  KEY `field_id` (`field_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_grid_columns` WRITE;
/*!40000 ALTER TABLE `exp_grid_columns` DISABLE KEYS */;

INSERT INTO `exp_grid_columns` (`col_id`, `field_id`, `content_type`, `col_order`, `col_type`, `col_label`, `col_name`, `col_instructions`, `col_required`, `col_search`, `col_width`, `col_settings`)
VALUES
	(1,6,'channel',0,'text','Button Label','button_label','','n','n',0,'{\"field_maxl\":\"256\",\"field_fmt\":\"none\",\"field_text_direction\":\"ltr\",\"field_content_type\":\"all\",\"field_required\":\"n\"}'),
	(2,6,'channel',1,'text','Button Link','button_link','','n','n',0,'{\"field_maxl\":\"256\",\"field_fmt\":\"none\",\"field_text_direction\":\"ltr\",\"field_content_type\":\"all\",\"field_required\":\"n\"}'),
	(3,6,'channel',2,'select','Button Style','button_style','','n','n',0,'{\"field_fmt\":\"none\",\"field_pre_populate\":\"v\",\"field_list_items\":\"\",\"value_label_pairs\":{\"primary\":\"Primary\",\"primary-ol\":\"Primary Outline\",\"secondary\":\"Secondary\",\"second-ol\":\"Secondary Outline\",\"tertiary\":\"Tertiary\",\"tertiary-ol\":\"Tertiary Outline\"},\"field_required\":\"n\"}');

/*!40000 ALTER TABLE `exp_grid_columns` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_html_buttons
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_html_buttons`;

CREATE TABLE `exp_html_buttons` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int unsigned NOT NULL DEFAULT '1',
  `member_id` int NOT NULL DEFAULT '0',
  `tag_name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag_open` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag_close` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `accesskey` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag_order` int unsigned NOT NULL,
  `tag_row` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `classname` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_html_buttons` WRITE;
/*!40000 ALTER TABLE `exp_html_buttons` DISABLE KEYS */;

INSERT INTO `exp_html_buttons` (`id`, `site_id`, `member_id`, `tag_name`, `tag_open`, `tag_close`, `accesskey`, `tag_order`, `tag_row`, `classname`)
VALUES
	(1,1,0,'html_btn_bold','<strong>','</strong>','b',1,'1','html-bold'),
	(2,1,0,'html_btn_italic','<em>','</em>','i',2,'1','html-italic'),
	(3,1,0,'html_btn_blockquote','<blockquote>','</blockquote>','q',3,'1','html-quote'),
	(4,1,0,'html_btn_anchor','<a href=\"[![Link:!:http://]!]\"(!( title=\"[![Title]!]\")!)>','</a>','k',4,'1','html-link'),
	(5,1,0,'html_btn_picture','<img src=\"[![Link:!:http://]!]\" alt=\"\" height=\"\" width=\"\">','','',5,'1','html-upload');

/*!40000 ALTER TABLE `exp_html_buttons` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_layout_publish
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_layout_publish`;

CREATE TABLE `exp_layout_publish` (
  `layout_id` int unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int unsigned NOT NULL DEFAULT '1',
  `channel_id` int unsigned NOT NULL DEFAULT '0',
  `layout_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_layout` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`layout_id`),
  KEY `site_id` (`site_id`),
  KEY `channel_id` (`channel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_layout_publish` WRITE;
/*!40000 ALTER TABLE `exp_layout_publish` DISABLE KEYS */;

INSERT INTO `exp_layout_publish` (`layout_id`, `site_id`, `channel_id`, `layout_name`, `field_layout`)
VALUES
	(1,1,1,'Default Page','a:5:{i:0;a:4:{s:2:\"id\";s:7:\"publish\";s:4:\"name\";s:7:\"publish\";s:7:\"visible\";b:1;s:6:\"fields\";a:4:{i:0;a:4:{s:5:\"field\";s:5:\"title\";s:7:\"visible\";b:1;s:9:\"collapsed\";b:0;s:5:\"width\";s:3:\"100\";}i:1;a:4:{s:5:\"field\";s:9:\"url_title\";s:7:\"visible\";b:1;s:9:\"collapsed\";b:0;s:5:\"width\";s:3:\"100\";}i:2;a:3:{s:5:\"field\";s:11:\"field_id_17\";s:7:\"visible\";b:1;s:9:\"collapsed\";b:0;}i:3;a:3:{s:5:\"field\";s:11:\"field_id_12\";s:7:\"visible\";b:1;s:9:\"collapsed\";b:0;}}}i:1;a:4:{s:2:\"id\";s:4:\"date\";s:4:\"name\";s:4:\"date\";s:7:\"visible\";b:1;s:6:\"fields\";a:2:{i:0;a:4:{s:5:\"field\";s:10:\"entry_date\";s:7:\"visible\";b:1;s:9:\"collapsed\";b:0;s:5:\"width\";i:100;}i:1;a:4:{s:5:\"field\";s:15:\"expiration_date\";s:7:\"visible\";b:1;s:9:\"collapsed\";b:0;s:5:\"width\";i:100;}}}i:2;a:4:{s:2:\"id\";s:10:\"categories\";s:4:\"name\";s:10:\"categories\";s:7:\"visible\";b:1;s:6:\"fields\";a:0:{}}i:3;a:4:{s:2:\"id\";s:7:\"options\";s:4:\"name\";s:7:\"options\";s:7:\"visible\";b:1;s:6:\"fields\";a:3:{i:0;a:4:{s:5:\"field\";s:10:\"channel_id\";s:7:\"visible\";b:1;s:9:\"collapsed\";b:0;s:5:\"width\";i:100;}i:1;a:4:{s:5:\"field\";s:6:\"status\";s:7:\"visible\";b:1;s:9:\"collapsed\";b:0;s:5:\"width\";i:100;}i:2;a:4:{s:5:\"field\";s:9:\"author_id\";s:7:\"visible\";b:1;s:9:\"collapsed\";b:0;s:5:\"width\";i:100;}}}i:4;a:4:{s:2:\"id\";s:9:\"structure\";s:4:\"name\";s:9:\"structure\";s:7:\"visible\";b:1;s:6:\"fields\";a:5:{i:0;a:4:{s:5:\"field\";s:20:\"structure__parent_id\";s:7:\"visible\";b:1;s:9:\"collapsed\";b:0;s:5:\"width\";i:100;}i:1;a:4:{s:5:\"field\";s:14:\"structure__uri\";s:7:\"visible\";b:1;s:9:\"collapsed\";b:0;s:5:\"width\";i:100;}i:2;a:4:{s:5:\"field\";s:22:\"structure__template_id\";s:7:\"visible\";b:1;s:9:\"collapsed\";b:0;s:5:\"width\";i:100;}i:3;a:4:{s:5:\"field\";s:17:\"structure__hidden\";s:7:\"visible\";b:1;s:9:\"collapsed\";b:0;s:5:\"width\";i:100;}i:4;a:4:{s:5:\"field\";s:26:\"structure__listing_channel\";s:7:\"visible\";b:1;s:9:\"collapsed\";b:0;s:5:\"width\";i:100;}}}}'),
	(2,1,6,'Static Pages','a:6:{i:0;a:4:{s:2:\"id\";s:7:\"publish\";s:4:\"name\";s:7:\"publish\";s:7:\"visible\";b:1;s:6:\"fields\";a:4:{i:0;a:4:{s:5:\"field\";s:5:\"title\";s:7:\"visible\";b:1;s:9:\"collapsed\";b:0;s:5:\"width\";i:100;}i:1;a:4:{s:5:\"field\";s:9:\"url_title\";s:7:\"visible\";b:1;s:9:\"collapsed\";b:0;s:5:\"width\";i:100;}i:2;a:3:{s:5:\"field\";s:11:\"field_id_17\";s:7:\"visible\";b:1;s:9:\"collapsed\";b:0;}i:3;a:4:{s:5:\"field\";s:11:\"field_id_14\";s:7:\"visible\";b:1;s:9:\"collapsed\";b:0;s:5:\"width\";i:100;}}}i:1;a:4:{s:2:\"id\";s:4:\"date\";s:4:\"name\";s:4:\"date\";s:7:\"visible\";b:1;s:6:\"fields\";a:2:{i:0;a:4:{s:5:\"field\";s:10:\"entry_date\";s:7:\"visible\";b:1;s:9:\"collapsed\";b:0;s:5:\"width\";i:100;}i:1;a:4:{s:5:\"field\";s:15:\"expiration_date\";s:7:\"visible\";b:1;s:9:\"collapsed\";b:0;s:5:\"width\";i:100;}}}i:2;a:4:{s:2:\"id\";s:10:\"categories\";s:4:\"name\";s:10:\"categories\";s:7:\"visible\";b:1;s:6:\"fields\";a:0:{}}i:3;a:4:{s:2:\"id\";s:7:\"options\";s:4:\"name\";s:7:\"options\";s:7:\"visible\";b:1;s:6:\"fields\";a:3:{i:0;a:4:{s:5:\"field\";s:10:\"channel_id\";s:7:\"visible\";b:1;s:9:\"collapsed\";b:0;s:5:\"width\";i:100;}i:1;a:4:{s:5:\"field\";s:6:\"status\";s:7:\"visible\";b:1;s:9:\"collapsed\";b:0;s:5:\"width\";i:100;}i:2;a:4:{s:5:\"field\";s:9:\"author_id\";s:7:\"visible\";b:1;s:9:\"collapsed\";b:0;s:5:\"width\";i:100;}}}i:4;a:4:{s:2:\"id\";s:9:\"structure\";s:4:\"name\";s:9:\"structure\";s:7:\"visible\";b:1;s:6:\"fields\";a:0:{}}i:5;a:4:{s:2:\"id\";s:11:\"custom__seo\";s:4:\"name\";s:3:\"SEO\";s:7:\"visible\";b:1;s:6:\"fields\";a:12:{i:0;a:3:{s:5:\"field\";s:11:\"field_id_19\";s:7:\"visible\";b:1;s:9:\"collapsed\";b:0;}i:1;a:3:{s:5:\"field\";s:11:\"field_id_20\";s:7:\"visible\";b:1;s:9:\"collapsed\";b:0;}i:2;a:3:{s:5:\"field\";s:11:\"field_id_21\";s:7:\"visible\";b:1;s:9:\"collapsed\";b:0;}i:3;a:3:{s:5:\"field\";s:11:\"field_id_22\";s:7:\"visible\";b:1;s:9:\"collapsed\";b:0;}i:4;a:3:{s:5:\"field\";s:11:\"field_id_25\";s:7:\"visible\";b:1;s:9:\"collapsed\";b:0;}i:5;a:3:{s:5:\"field\";s:11:\"field_id_24\";s:7:\"visible\";b:1;s:9:\"collapsed\";b:0;}i:6;a:3:{s:5:\"field\";s:11:\"field_id_23\";s:7:\"visible\";b:1;s:9:\"collapsed\";b:0;}i:7;a:3:{s:5:\"field\";s:11:\"field_id_26\";s:7:\"visible\";b:1;s:9:\"collapsed\";b:0;}i:8;a:3:{s:5:\"field\";s:11:\"field_id_27\";s:7:\"visible\";b:1;s:9:\"collapsed\";b:0;}i:9;a:3:{s:5:\"field\";s:11:\"field_id_28\";s:7:\"visible\";b:1;s:9:\"collapsed\";b:0;}i:10;a:3:{s:5:\"field\";s:11:\"field_id_30\";s:7:\"visible\";b:1;s:9:\"collapsed\";b:0;}i:11;a:3:{s:5:\"field\";s:11:\"field_id_29\";s:7:\"visible\";b:1;s:9:\"collapsed\";b:0;}}}}'),
	(3,1,3,'Blog','a:5:{i:0;a:4:{s:2:\"id\";s:7:\"publish\";s:4:\"name\";s:7:\"publish\";s:7:\"visible\";b:1;s:6:\"fields\";a:4:{i:0;a:4:{s:5:\"field\";s:5:\"title\";s:7:\"visible\";b:1;s:9:\"collapsed\";b:0;s:5:\"width\";i:100;}i:1;a:4:{s:5:\"field\";s:9:\"url_title\";s:7:\"visible\";b:1;s:9:\"collapsed\";b:0;s:5:\"width\";i:100;}i:2;a:4:{s:5:\"field\";s:11:\"field_id_17\";s:7:\"visible\";b:1;s:9:\"collapsed\";b:0;s:5:\"width\";i:100;}i:3;a:3:{s:5:\"field\";s:11:\"field_id_18\";s:7:\"visible\";b:1;s:9:\"collapsed\";b:0;}}}i:1;a:4:{s:2:\"id\";s:4:\"date\";s:4:\"name\";s:4:\"date\";s:7:\"visible\";b:1;s:6:\"fields\";a:2:{i:0;a:4:{s:5:\"field\";s:10:\"entry_date\";s:7:\"visible\";b:1;s:9:\"collapsed\";b:0;s:5:\"width\";i:100;}i:1;a:4:{s:5:\"field\";s:15:\"expiration_date\";s:7:\"visible\";b:1;s:9:\"collapsed\";b:0;s:5:\"width\";i:100;}}}i:2;a:4:{s:2:\"id\";s:10:\"categories\";s:4:\"name\";s:10:\"categories\";s:7:\"visible\";b:1;s:6:\"fields\";a:0:{}}i:3;a:4:{s:2:\"id\";s:7:\"options\";s:4:\"name\";s:7:\"options\";s:7:\"visible\";b:1;s:6:\"fields\";a:3:{i:0;a:4:{s:5:\"field\";s:10:\"channel_id\";s:7:\"visible\";b:1;s:9:\"collapsed\";b:0;s:5:\"width\";i:100;}i:1;a:4:{s:5:\"field\";s:6:\"status\";s:7:\"visible\";b:1;s:9:\"collapsed\";b:0;s:5:\"width\";i:100;}i:2;a:4:{s:5:\"field\";s:9:\"author_id\";s:7:\"visible\";b:1;s:9:\"collapsed\";b:0;s:5:\"width\";i:100;}}}i:4;a:4:{s:2:\"id\";s:9:\"structure\";s:4:\"name\";s:9:\"structure\";s:7:\"visible\";b:1;s:6:\"fields\";a:2:{i:0;a:4:{s:5:\"field\";s:14:\"structure__uri\";s:7:\"visible\";b:1;s:9:\"collapsed\";b:0;s:5:\"width\";i:100;}i:1;a:4:{s:5:\"field\";s:22:\"structure__template_id\";s:7:\"visible\";b:1;s:9:\"collapsed\";b:0;s:5:\"width\";i:100;}}}}');

/*!40000 ALTER TABLE `exp_layout_publish` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_layout_publish_member_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_layout_publish_member_roles`;

CREATE TABLE `exp_layout_publish_member_roles` (
  `layout_id` int unsigned NOT NULL,
  `role_id` int unsigned NOT NULL,
  PRIMARY KEY (`layout_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_layout_publish_member_roles` WRITE;
/*!40000 ALTER TABLE `exp_layout_publish_member_roles` DISABLE KEYS */;

INSERT INTO `exp_layout_publish_member_roles` (`layout_id`, `role_id`)
VALUES
	(1,1),
	(2,1),
	(3,1);

/*!40000 ALTER TABLE `exp_layout_publish_member_roles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_member_bulletin_board
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_member_bulletin_board`;

CREATE TABLE `exp_member_bulletin_board` (
  `bulletin_id` int unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` int unsigned NOT NULL,
  `bulletin_group` int unsigned NOT NULL,
  `bulletin_date` int unsigned NOT NULL,
  `hash` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `bulletin_expires` int unsigned NOT NULL DEFAULT '0',
  `bulletin_message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`bulletin_id`),
  KEY `sender_id` (`sender_id`),
  KEY `hash` (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_member_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_member_data`;

CREATE TABLE `exp_member_data` (
  `member_id` int unsigned NOT NULL,
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_member_data` WRITE;
/*!40000 ALTER TABLE `exp_member_data` DISABLE KEYS */;

INSERT INTO `exp_member_data` (`member_id`)
VALUES
	(1);

/*!40000 ALTER TABLE `exp_member_data` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_member_fields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_member_fields`;

CREATE TABLE `exp_member_fields` (
  `m_field_id` int unsigned NOT NULL AUTO_INCREMENT,
  `m_field_name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `m_field_label` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `m_field_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `m_field_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text',
  `m_field_list_items` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `m_field_ta_rows` tinyint DEFAULT '8',
  `m_field_maxl` smallint DEFAULT NULL,
  `m_field_width` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `m_field_search` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `m_field_required` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `m_field_public` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `m_field_reg` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `m_field_cp_reg` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `m_field_fmt` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `m_field_show_fmt` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `m_field_exclude_from_anon` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `m_field_order` int unsigned DEFAULT NULL,
  `m_field_text_direction` char(3) COLLATE utf8mb4_unicode_ci DEFAULT 'ltr',
  `m_field_settings` text COLLATE utf8mb4_unicode_ci,
  `m_legacy_field_data` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  PRIMARY KEY (`m_field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_member_manager_views
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_member_manager_views`;

CREATE TABLE `exp_member_manager_views` (
  `view_id` int unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int unsigned NOT NULL,
  `member_id` int unsigned NOT NULL,
  `name` varchar(128) NOT NULL DEFAULT '',
  `columns` text NOT NULL,
  PRIMARY KEY (`view_id`),
  KEY `role_id_member_id` (`role_id`,`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# Dump of table exp_member_news_views
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_member_news_views`;

CREATE TABLE `exp_member_news_views` (
  `news_id` int unsigned NOT NULL AUTO_INCREMENT,
  `version` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `member_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`news_id`),
  KEY `member_id` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_member_news_views` WRITE;
/*!40000 ALTER TABLE `exp_member_news_views` DISABLE KEYS */;

INSERT INTO `exp_member_news_views` (`news_id`, `version`, `member_id`)
VALUES
	(1,'7.4.11',1);

/*!40000 ALTER TABLE `exp_member_news_views` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_member_relationships
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_member_relationships`;

CREATE TABLE `exp_member_relationships` (
  `relationship_id` int unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int unsigned NOT NULL DEFAULT '0',
  `child_id` int unsigned NOT NULL DEFAULT '0',
  `field_id` int unsigned NOT NULL DEFAULT '0',
  `fluid_field_data_id` int unsigned NOT NULL DEFAULT '0',
  `grid_field_id` int unsigned NOT NULL DEFAULT '0',
  `grid_col_id` int unsigned NOT NULL DEFAULT '0',
  `grid_row_id` int unsigned NOT NULL DEFAULT '0',
  `order` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`relationship_id`),
  KEY `parent_id` (`parent_id`),
  KEY `child_id` (`child_id`),
  KEY `field_id` (`field_id`),
  KEY `fluid_field_data_id` (`fluid_field_data_id`),
  KEY `grid_row_id` (`grid_row_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_member_search
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_member_search`;

CREATE TABLE `exp_member_search` (
  `search_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_id` int unsigned NOT NULL DEFAULT '1',
  `search_date` int unsigned NOT NULL,
  `keywords` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fields` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `member_id` int unsigned NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `total_results` int unsigned NOT NULL,
  `query` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`search_id`),
  KEY `member_id` (`member_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_members
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_members`;

CREATE TABLE `exp_members` (
  `member_id` int unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int NOT NULL DEFAULT '0',
  `pending_role_id` int NOT NULL DEFAULT '0',
  `username` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `screen_name` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `salt` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `unique_id` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `crypt_key` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `backup_mfa_code` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `authcode` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `signature` text COLLATE utf8mb4_unicode_ci,
  `avatar_filename` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_width` int unsigned DEFAULT NULL,
  `avatar_height` int unsigned DEFAULT NULL,
  `photo_filename` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo_width` int unsigned DEFAULT NULL,
  `photo_height` int unsigned DEFAULT NULL,
  `sig_img_filename` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sig_img_width` int unsigned DEFAULT NULL,
  `sig_img_height` int unsigned DEFAULT NULL,
  `ignore_list` text COLLATE utf8mb4_unicode_ci,
  `private_messages` int unsigned NOT NULL DEFAULT '0',
  `accept_messages` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `last_view_bulletins` int NOT NULL DEFAULT '0',
  `last_bulletin_date` int NOT NULL DEFAULT '0',
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `join_date` int unsigned NOT NULL DEFAULT '0',
  `last_visit` int unsigned NOT NULL DEFAULT '0',
  `last_activity` int unsigned NOT NULL DEFAULT '0',
  `total_entries` mediumint unsigned NOT NULL DEFAULT '0',
  `total_comments` mediumint unsigned NOT NULL DEFAULT '0',
  `total_forum_topics` mediumint NOT NULL DEFAULT '0',
  `total_forum_posts` mediumint NOT NULL DEFAULT '0',
  `last_entry_date` int unsigned NOT NULL DEFAULT '0',
  `last_comment_date` int unsigned NOT NULL DEFAULT '0',
  `last_forum_post_date` int unsigned NOT NULL DEFAULT '0',
  `last_email_date` int unsigned NOT NULL DEFAULT '0',
  `in_authorlist` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `accept_admin_email` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `accept_user_email` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `notify_by_default` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `notify_of_pm` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `display_signatures` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `parse_smileys` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `smart_notifications` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `language` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `timezone` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_format` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_format` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `week_start` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `include_seconds` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_theme` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `forum_theme` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tracker` text COLLATE utf8mb4_unicode_ci,
  `template_size` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '28',
  `notepad` text COLLATE utf8mb4_unicode_ci,
  `notepad_size` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '18',
  `bookmarklets` text COLLATE utf8mb4_unicode_ci,
  `quick_links` text COLLATE utf8mb4_unicode_ci,
  `quick_tabs` text COLLATE utf8mb4_unicode_ci,
  `show_sidebar` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `pmember_id` int NOT NULL DEFAULT '0',
  `cp_homepage` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cp_homepage_channel` text COLLATE utf8mb4_unicode_ci,
  `cp_homepage_custom` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dismissed_banner` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `enable_mfa` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  PRIMARY KEY (`member_id`),
  KEY `role_id` (`role_id`),
  KEY `unique_id` (`unique_id`),
  KEY `password` (`password`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_members` WRITE;
/*!40000 ALTER TABLE `exp_members` DISABLE KEYS */;

INSERT INTO `exp_members` (`member_id`, `role_id`, `pending_role_id`, `username`, `screen_name`, `password`, `salt`, `unique_id`, `crypt_key`, `backup_mfa_code`, `authcode`, `email`, `signature`, `avatar_filename`, `avatar_width`, `avatar_height`, `photo_filename`, `photo_width`, `photo_height`, `sig_img_filename`, `sig_img_width`, `sig_img_height`, `ignore_list`, `private_messages`, `accept_messages`, `last_view_bulletins`, `last_bulletin_date`, `ip_address`, `join_date`, `last_visit`, `last_activity`, `total_entries`, `total_comments`, `total_forum_topics`, `total_forum_posts`, `last_entry_date`, `last_comment_date`, `last_forum_post_date`, `last_email_date`, `in_authorlist`, `accept_admin_email`, `accept_user_email`, `notify_by_default`, `notify_of_pm`, `display_signatures`, `parse_smileys`, `smart_notifications`, `language`, `timezone`, `time_format`, `date_format`, `week_start`, `include_seconds`, `profile_theme`, `forum_theme`, `tracker`, `template_size`, `notepad`, `notepad_size`, `bookmarklets`, `quick_links`, `quick_tabs`, `show_sidebar`, `pmember_id`, `cp_homepage`, `cp_homepage_channel`, `cp_homepage_custom`, `dismissed_banner`, `enable_mfa`)
VALUES
	(1,1,0,'cf-admin','cf-admin','$2y$10$2oNgVd3sZBtoTzFEJZazEOENyjTq6Gxi7mo7Zv3YS27fXTVSowefm','','95a1ae0166f5d4d6f5eed28f6db059a34cbcaff0','490dda2c5b1ca2ec3ddb70b7d2225a37885cd360',NULL,NULL,'jon@clearfixlabs.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'y',0,0,'127.0.0.1',1720033133,1720265153,1720436904,7,0,0,0,1720118700,0,0,0,'n','y','y','y','y','y','y','y','english','UTC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'28',NULL,'18',NULL,'',NULL,'n',0,NULL,NULL,NULL,'n','n');

/*!40000 ALTER TABLE `exp_members` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_members_role_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_members_role_groups`;

CREATE TABLE `exp_members_role_groups` (
  `member_id` int unsigned NOT NULL,
  `group_id` int unsigned NOT NULL,
  PRIMARY KEY (`member_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_members_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_members_roles`;

CREATE TABLE `exp_members_roles` (
  `member_id` int unsigned NOT NULL,
  `role_id` int unsigned NOT NULL,
  PRIMARY KEY (`member_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_members_roles` WRITE;
/*!40000 ALTER TABLE `exp_members_roles` DISABLE KEYS */;

INSERT INTO `exp_members_roles` (`member_id`, `role_id`)
VALUES
	(1,1);

/*!40000 ALTER TABLE `exp_members_roles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_menu_items
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_menu_items`;

CREATE TABLE `exp_menu_items` (
  `item_id` int unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int NOT NULL DEFAULT '0',
  `set_id` int DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`item_id`),
  KEY `set_id` (`set_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_menu_items` WRITE;
/*!40000 ALTER TABLE `exp_menu_items` DISABLE KEYS */;

INSERT INTO `exp_menu_items` (`item_id`, `parent_id`, `set_id`, `name`, `data`, `type`, `sort`)
VALUES
	(1,0,1,'Structure','Structure_ext','addon',1),
	(2,0,1,'Bloqs','Bloqs','addon',2),
	(3,0,1,'Pro Variables','Pro_variables','addon',3);

/*!40000 ALTER TABLE `exp_menu_items` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_menu_sets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_menu_sets`;

CREATE TABLE `exp_menu_sets` (
  `set_id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`set_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_menu_sets` WRITE;
/*!40000 ALTER TABLE `exp_menu_sets` DISABLE KEYS */;

INSERT INTO `exp_menu_sets` (`set_id`, `name`)
VALUES
	(1,'Default');

/*!40000 ALTER TABLE `exp_menu_sets` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_message_attachments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_message_attachments`;

CREATE TABLE `exp_message_attachments` (
  `attachment_id` int unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` int unsigned NOT NULL DEFAULT '0',
  `message_id` int unsigned NOT NULL DEFAULT '0',
  `attachment_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `attachment_hash` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `attachment_extension` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `attachment_location` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `attachment_date` int unsigned NOT NULL DEFAULT '0',
  `attachment_size` int unsigned NOT NULL DEFAULT '0',
  `is_temp` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  PRIMARY KEY (`attachment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_message_copies
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_message_copies`;

CREATE TABLE `exp_message_copies` (
  `copy_id` int unsigned NOT NULL AUTO_INCREMENT,
  `message_id` int unsigned NOT NULL DEFAULT '0',
  `sender_id` int unsigned NOT NULL DEFAULT '0',
  `recipient_id` int unsigned NOT NULL DEFAULT '0',
  `message_received` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `message_read` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `message_time_read` int unsigned NOT NULL DEFAULT '0',
  `attachment_downloaded` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `message_folder` int unsigned NOT NULL DEFAULT '1',
  `message_authcode` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `message_deleted` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `message_status` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`copy_id`),
  KEY `message_id` (`message_id`),
  KEY `recipient_id` (`recipient_id`),
  KEY `sender_id` (`sender_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_message_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_message_data`;

CREATE TABLE `exp_message_data` (
  `message_id` int unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` int unsigned NOT NULL DEFAULT '0',
  `message_date` int unsigned NOT NULL DEFAULT '0',
  `message_subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `message_body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `message_tracking` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `message_attachments` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `message_recipients` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `message_cc` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `message_hide_cc` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `message_sent_copy` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `total_recipients` int unsigned NOT NULL DEFAULT '0',
  `message_status` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`message_id`),
  KEY `sender_id` (`sender_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_message_folders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_message_folders`;

CREATE TABLE `exp_message_folders` (
  `member_id` int unsigned NOT NULL DEFAULT '0',
  `folder1_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'InBox',
  `folder2_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Sent',
  `folder3_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `folder4_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `folder5_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `folder6_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `folder7_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `folder8_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `folder9_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `folder10_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_message_listed
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_message_listed`;

CREATE TABLE `exp_message_listed` (
  `listed_id` int unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int unsigned NOT NULL DEFAULT '0',
  `listed_member` int unsigned NOT NULL DEFAULT '0',
  `listed_description` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `listed_type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'blocked',
  PRIMARY KEY (`listed_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_migrations`;

CREATE TABLE `exp_migrations` (
  `migration_id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` text COLLATE utf8mb4_unicode_ci,
  `migration_location` text COLLATE utf8mb4_unicode_ci,
  `migration_group` int unsigned DEFAULT NULL,
  `migration_run_date` datetime NOT NULL,
  PRIMARY KEY (`migration_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_module_member_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_module_member_roles`;

CREATE TABLE `exp_module_member_roles` (
  `role_id` int unsigned NOT NULL,
  `module_id` mediumint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_modules
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_modules`;

CREATE TABLE `exp_modules` (
  `module_id` int unsigned NOT NULL AUTO_INCREMENT,
  `module_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `module_version` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `has_cp_backend` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `has_publish_fields` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  PRIMARY KEY (`module_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_modules` WRITE;
/*!40000 ALTER TABLE `exp_modules` DISABLE KEYS */;

INSERT INTO `exp_modules` (`module_id`, `module_name`, `module_version`, `has_cp_backend`, `has_publish_fields`)
VALUES
	(1,'Channel','2.1.1','n','n'),
	(2,'Comment','2.3.3','y','n'),
	(3,'Consent','1.0.0','n','n'),
	(4,'Member','2.4.0','n','n'),
	(5,'Stats','2.2.0','n','n'),
	(6,'Rte','2.2.0','y','n'),
	(7,'File','1.1.0','n','n'),
	(8,'Filepicker','1.0','y','n'),
	(9,'Relationship','1.0.0','n','n'),
	(10,'Search','2.3.0','n','n'),
	(11,'Pro','2.1.0','n','n'),
	(12,'Structure','6.0.0','y','y'),
	(13,'Pro_variables','5.0.3','y','n'),
	(14,'Pro_search','8.0.3','y','n'),
	(17,'Simple_Grids','1.7.4','n','n'),
	(18,'Bloqs','5.0.14','y','n');

/*!40000 ALTER TABLE `exp_modules` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_online_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_online_users`;

CREATE TABLE `exp_online_users` (
  `online_id` int unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int unsigned NOT NULL DEFAULT '1',
  `member_id` int NOT NULL DEFAULT '0',
  `in_forum` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `name` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `date` int unsigned NOT NULL DEFAULT '0',
  `anon` char(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`online_id`),
  KEY `date` (`date`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_password_lockout
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_password_lockout`;

CREATE TABLE `exp_password_lockout` (
  `lockout_id` int unsigned NOT NULL AUTO_INCREMENT,
  `login_date` int unsigned NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `user_agent` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`lockout_id`),
  KEY `login_date` (`login_date`),
  KEY `ip_address` (`ip_address`),
  KEY `user_agent` (`user_agent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_permissions`;

CREATE TABLE `exp_permissions` (
  `permission_id` int unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int unsigned NOT NULL,
  `site_id` int unsigned NOT NULL,
  `permission` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`permission_id`),
  KEY `role_id_site_id` (`role_id`,`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_permissions` WRITE;
/*!40000 ALTER TABLE `exp_permissions` DISABLE KEYS */;

INSERT INTO `exp_permissions` (`permission_id`, `role_id`, `site_id`, `permission`)
VALUES
	(1,1,1,'can_view_offline_system'),
	(2,1,1,'can_access_cp'),
	(3,1,1,'can_access_dock'),
	(4,1,1,'can_access_footer_report_bug'),
	(5,1,1,'can_access_footer_new_ticket'),
	(6,1,1,'can_access_footer_user_guide'),
	(7,1,1,'can_view_homepage_news'),
	(8,1,1,'can_upload_new_files'),
	(9,1,1,'can_edit_files'),
	(10,1,1,'can_delete_files'),
	(11,1,1,'can_upload_new_toolsets'),
	(12,1,1,'can_edit_toolsets'),
	(13,1,1,'can_delete_toolsets'),
	(14,1,1,'can_create_upload_directories'),
	(15,1,1,'can_edit_upload_directories'),
	(16,1,1,'can_delete_upload_directories'),
	(17,1,1,'can_access_files'),
	(18,1,1,'can_access_design'),
	(19,1,1,'can_access_addons'),
	(20,1,1,'can_access_members'),
	(21,1,1,'can_access_sys_prefs'),
	(22,1,1,'can_access_comm'),
	(23,1,1,'can_access_utilities'),
	(24,1,1,'can_access_data'),
	(25,1,1,'can_access_logs'),
	(26,1,1,'can_admin_channels'),
	(27,1,1,'can_create_channels'),
	(28,1,1,'can_edit_channels'),
	(29,1,1,'can_delete_channels'),
	(30,1,1,'can_create_channel_fields'),
	(31,1,1,'can_edit_channel_fields'),
	(32,1,1,'can_delete_channel_fields'),
	(33,1,1,'can_create_statuses'),
	(34,1,1,'can_delete_statuses'),
	(35,1,1,'can_edit_statuses'),
	(36,1,1,'can_create_categories'),
	(37,1,1,'can_create_roles'),
	(38,1,1,'can_delete_roles'),
	(39,1,1,'can_edit_roles'),
	(40,1,1,'can_admin_design'),
	(41,1,1,'can_create_members'),
	(42,1,1,'can_edit_members'),
	(43,1,1,'can_delete_members'),
	(44,1,1,'can_admin_roles'),
	(45,1,1,'can_admin_mbr_templates'),
	(46,1,1,'can_ban_users'),
	(47,1,1,'can_admin_addons'),
	(48,1,1,'can_create_templates'),
	(49,1,1,'can_edit_templates'),
	(50,1,1,'can_delete_templates'),
	(51,1,1,'can_create_template_groups'),
	(52,1,1,'can_edit_template_groups'),
	(53,1,1,'can_delete_template_groups'),
	(54,1,1,'can_create_template_partials'),
	(55,1,1,'can_edit_template_partials'),
	(56,1,1,'can_delete_template_partials'),
	(57,1,1,'can_create_template_variables'),
	(58,1,1,'can_delete_template_variables'),
	(59,1,1,'can_edit_template_variables'),
	(60,1,1,'can_edit_categories'),
	(61,1,1,'can_delete_categories'),
	(62,1,1,'can_view_other_entries'),
	(63,1,1,'can_edit_other_entries'),
	(64,1,1,'can_assign_post_authors'),
	(65,1,1,'can_delete_self_entries'),
	(66,1,1,'can_delete_all_entries'),
	(67,1,1,'can_view_other_comments'),
	(68,1,1,'can_edit_own_comments'),
	(69,1,1,'can_delete_own_comments'),
	(70,1,1,'can_edit_all_comments'),
	(71,1,1,'can_delete_all_comments'),
	(72,1,1,'can_moderate_comments'),
	(73,1,1,'can_send_cached_email'),
	(74,1,1,'can_email_roles'),
	(75,1,1,'can_email_from_profile'),
	(76,1,1,'can_view_profiles'),
	(77,1,1,'can_edit_html_buttons'),
	(78,1,1,'can_post_comments'),
	(79,1,1,'can_delete_self'),
	(80,1,1,'can_send_private_messages'),
	(81,1,1,'can_attach_in_private_messages'),
	(82,1,1,'can_send_bulletins'),
	(83,1,1,'can_search'),
	(84,1,1,'can_create_entries'),
	(85,1,1,'can_edit_self_entries'),
	(86,1,1,'can_access_security_settings'),
	(87,1,1,'can_access_translate'),
	(88,1,1,'can_access_import'),
	(89,1,1,'can_access_sql_manager'),
	(90,1,1,'can_moderate_spam'),
	(91,1,1,'can_manage_consents'),
	(92,3,1,'can_view_online_system'),
	(93,4,1,'can_view_online_system'),
	(94,5,1,'can_view_online_system'),
	(95,5,1,'can_email_from_profile'),
	(96,5,1,'can_view_profiles'),
	(97,5,1,'can_edit_html_buttons'),
	(98,5,1,'can_delete_self'),
	(99,5,1,'can_send_private_messages'),
	(100,5,1,'can_attach_in_private_messages');

/*!40000 ALTER TABLE `exp_permissions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_plugins
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_plugins`;

CREATE TABLE `exp_plugins` (
  `plugin_id` int unsigned NOT NULL AUTO_INCREMENT,
  `plugin_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plugin_package` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plugin_version` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_typography_related` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  PRIMARY KEY (`plugin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_plugins` WRITE;
/*!40000 ALTER TABLE `exp_plugins` DISABLE KEYS */;

INSERT INTO `exp_plugins` (`plugin_id`, `plugin_name`, `plugin_package`, `plugin_version`, `is_typography_related`)
VALUES
	(1,'Markdown','markdown','2.0.0','y');

/*!40000 ALTER TABLE `exp_plugins` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_pro_search_collections
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_pro_search_collections`;

CREATE TABLE `exp_pro_search_collections` (
  `collection_id` int unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int unsigned NOT NULL,
  `channel_id` int unsigned NOT NULL,
  `collection_name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `collection_label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modifier` decimal(4,1) unsigned NOT NULL DEFAULT '1.0',
  `excerpt` int unsigned NOT NULL DEFAULT '0',
  `settings` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `edit_date` int unsigned NOT NULL,
  PRIMARY KEY (`collection_id`),
  KEY `site_id` (`site_id`),
  KEY `channel_id` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_pro_search_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_pro_search_groups`;

CREATE TABLE `exp_pro_search_groups` (
  `group_id` int unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int unsigned NOT NULL,
  `group_label` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_pro_search_indexes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_pro_search_indexes`;

CREATE TABLE `exp_pro_search_indexes` (
  `collection_id` int unsigned NOT NULL,
  `entry_id` int unsigned NOT NULL,
  `site_id` int unsigned NOT NULL,
  `index_text` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `index_date` int unsigned NOT NULL,
  PRIMARY KEY (`collection_id`,`entry_id`),
  KEY `collection_id` (`collection_id`),
  KEY `site_id` (`site_id`),
  FULLTEXT KEY `index_text` (`index_text`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_pro_search_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_pro_search_log`;

CREATE TABLE `exp_pro_search_log` (
  `log_id` int unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int unsigned NOT NULL,
  `member_id` int unsigned NOT NULL,
  `search_date` int unsigned NOT NULL,
  `ip_address` varchar(46) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keywords` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `num_results` int unsigned DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_pro_search_replace_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_pro_search_replace_log`;

CREATE TABLE `exp_pro_search_replace_log` (
  `log_id` int unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int unsigned NOT NULL,
  `member_id` int unsigned NOT NULL,
  `replace_date` int unsigned NOT NULL,
  `keywords` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `replacement` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fields` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `entries` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`log_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_pro_search_shortcuts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_pro_search_shortcuts`;

CREATE TABLE `exp_pro_search_shortcuts` (
  `shortcut_id` int unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int unsigned NOT NULL,
  `group_id` int unsigned NOT NULL,
  `shortcut_name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shortcut_label` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` int unsigned NOT NULL,
  PRIMARY KEY (`shortcut_id`),
  KEY `site_id` (`site_id`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_pro_search_words
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_pro_search_words`;

CREATE TABLE `exp_pro_search_words` (
  `site_id` int unsigned NOT NULL,
  `language` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `word` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `length` int unsigned NOT NULL,
  `sound` char(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clean` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`site_id`,`language`,`word`),
  KEY `length` (`length`),
  KEY `sound` (`sound`),
  KEY `clean` (`clean`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_pro_variable_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_pro_variable_groups`;

CREATE TABLE `exp_pro_variable_groups` (
  `group_id` int unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int unsigned NOT NULL DEFAULT '1',
  `group_label` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `group_notes` text COLLATE utf8mb4_unicode_ci,
  `group_order` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_pro_variables
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_pro_variables`;

CREATE TABLE `exp_pro_variables` (
  `variable_id` int unsigned NOT NULL,
  `group_id` int unsigned NOT NULL DEFAULT '0',
  `variable_label` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variable_notes` text COLLATE utf8mb4_unicode_ci,
  `variable_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variable_settings` text COLLATE utf8mb4_unicode_ci,
  `variable_order` int unsigned NOT NULL DEFAULT '0',
  `early_parsing` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `is_hidden` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `save_as_file` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `edit_date` int unsigned DEFAULT NULL,
  PRIMARY KEY (`variable_id`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_prolets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_prolets`;

CREATE TABLE `exp_prolets` (
  `prolet_id` int unsigned NOT NULL AUTO_INCREMENT,
  `source` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `class` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`prolet_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_prolets` WRITE;
/*!40000 ALTER TABLE `exp_prolets` DISABLE KEYS */;

INSERT INTO `exp_prolets` (`prolet_id`, `source`, `class`)
VALUES
	(1,'channel','Channel_pro'),
	(2,'pro','Entries_pro'),
	(3,'structure','Structure_pro'),
	(4,'pro_variables','Pro_variables_pro');

/*!40000 ALTER TABLE `exp_prolets` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_relationships
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_relationships`;

CREATE TABLE `exp_relationships` (
  `relationship_id` int unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int unsigned NOT NULL DEFAULT '0',
  `child_id` int unsigned NOT NULL DEFAULT '0',
  `field_id` int unsigned NOT NULL DEFAULT '0',
  `fluid_field_data_id` int unsigned NOT NULL DEFAULT '0',
  `grid_field_id` int unsigned NOT NULL DEFAULT '0',
  `grid_col_id` int unsigned NOT NULL DEFAULT '0',
  `grid_row_id` int unsigned NOT NULL DEFAULT '0',
  `order` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`relationship_id`),
  KEY `parent_id` (`parent_id`),
  KEY `child_id` (`child_id`),
  KEY `field_id` (`field_id`),
  KEY `fluid_field_data_id` (`fluid_field_data_id`),
  KEY `grid_row_id` (`grid_row_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_remember_me
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_remember_me`;

CREATE TABLE `exp_remember_me` (
  `remember_me_id` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `member_id` int DEFAULT '0',
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `user_agent` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `admin_sess` tinyint(1) DEFAULT '0',
  `site_id` int DEFAULT '1',
  `expiration` int DEFAULT '0',
  `last_refresh` int DEFAULT '0',
  PRIMARY KEY (`remember_me_id`),
  KEY `member_id` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_remember_me` WRITE;
/*!40000 ALTER TABLE `exp_remember_me` DISABLE KEYS */;

INSERT INTO `exp_remember_me` (`remember_me_id`, `member_id`, `ip_address`, `user_agent`, `admin_sess`, `site_id`, `expiration`, `last_refresh`)
VALUES
	('35ec6f6e66f0ab177b8b3cb82f88ff1b6d55ece1',1,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36',0,1,1721506944,1720297344);

/*!40000 ALTER TABLE `exp_remember_me` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_reset_password
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_reset_password`;

CREATE TABLE `exp_reset_password` (
  `reset_id` int unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int unsigned NOT NULL,
  `resetcode` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` int NOT NULL,
  PRIMARY KEY (`reset_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_revision_tracker
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_revision_tracker`;

CREATE TABLE `exp_revision_tracker` (
  `tracker_id` int unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int unsigned NOT NULL,
  `item_table` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_field` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_date` int NOT NULL,
  `item_author_id` int unsigned NOT NULL,
  `item_data` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`tracker_id`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_role_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_role_groups`;

CREATE TABLE `exp_role_groups` (
  `group_id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_role_settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_role_settings`;

CREATE TABLE `exp_role_settings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int unsigned NOT NULL,
  `site_id` int unsigned NOT NULL DEFAULT '1',
  `menu_set_id` int unsigned NOT NULL DEFAULT '1',
  `mbr_delete_notify_emails` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exclude_from_moderation` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `search_flood_control` mediumint unsigned NOT NULL,
  `prv_msg_send_limit` smallint unsigned NOT NULL DEFAULT '20',
  `prv_msg_storage_limit` smallint unsigned NOT NULL DEFAULT '60',
  `include_in_authorlist` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `include_in_memberlist` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `cp_homepage` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cp_homepage_channel` int unsigned NOT NULL DEFAULT '0',
  `cp_homepage_custom` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `require_mfa` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `show_field_names` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  PRIMARY KEY (`id`),
  KEY `role_id_site_id` (`role_id`,`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_role_settings` WRITE;
/*!40000 ALTER TABLE `exp_role_settings` DISABLE KEYS */;

INSERT INTO `exp_role_settings` (`id`, `role_id`, `site_id`, `menu_set_id`, `mbr_delete_notify_emails`, `exclude_from_moderation`, `search_flood_control`, `prv_msg_send_limit`, `prv_msg_storage_limit`, `include_in_authorlist`, `include_in_memberlist`, `cp_homepage`, `cp_homepage_channel`, `cp_homepage_custom`, `require_mfa`, `show_field_names`)
VALUES
	(1,1,1,1,NULL,'y',0,20,60,'y','y',NULL,0,NULL,'n','y'),
	(2,2,1,0,NULL,'n',60,20,60,'n','n',NULL,0,NULL,'n','y'),
	(3,3,1,0,NULL,'n',10,20,60,'n','y',NULL,0,NULL,'n','y'),
	(4,4,1,0,NULL,'n',10,20,60,'n','y',NULL,0,NULL,'n','y'),
	(5,5,1,0,NULL,'n',10,20,60,'n','y',NULL,0,NULL,'n','y');

/*!40000 ALTER TABLE `exp_role_settings` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_roles`;

CREATE TABLE `exp_roles` (
  `role_id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `site_color` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `total_members` mediumint unsigned NOT NULL DEFAULT '0',
  `is_locked` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `highlight` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_roles` WRITE;
/*!40000 ALTER TABLE `exp_roles` DISABLE KEYS */;

INSERT INTO `exp_roles` (`role_id`, `name`, `short_name`, `description`, `site_color`, `total_members`, `is_locked`, `highlight`)
VALUES
	(1,'Super Admin','super_admin',NULL,'',0,'y',''),
	(2,'Banned','banned',NULL,'',0,'n',''),
	(3,'Guests','guests',NULL,'',0,'n',''),
	(4,'Pending','pending',NULL,'',0,'n',''),
	(5,'Members','members',NULL,'',0,'n','');

/*!40000 ALTER TABLE `exp_roles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_roles_role_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_roles_role_groups`;

CREATE TABLE `exp_roles_role_groups` (
  `role_id` int unsigned NOT NULL,
  `group_id` int unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`group_id`),
  KEY `group_id_idx` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_rte_toolsets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_rte_toolsets`;

CREATE TABLE `exp_rte_toolsets` (
  `toolset_id` int unsigned NOT NULL AUTO_INCREMENT,
  `toolset_name` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `toolset_type` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`toolset_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_rte_toolsets` WRITE;
/*!40000 ALTER TABLE `exp_rte_toolsets` DISABLE KEYS */;

INSERT INTO `exp_rte_toolsets` (`toolset_id`, `toolset_name`, `toolset_type`, `settings`)
VALUES
	(1,'CKEditor Basic','ckeditor','YToxMDp7czoxMDoidXBsb2FkX2RpciI7czowOiIiO3M6MjA6ImZpZWxkX3RleHRfZGlyZWN0aW9uIjtzOjM6Imx0ciI7czoxMjoiY3NzX3RlbXBsYXRlIjtzOjA6IiI7czo2OiJoZWlnaHQiO3M6MzoiMjAwIjtzOjEwOiJtYXhfaGVpZ2h0IjtzOjA6IiI7czo3OiJsaW1pdGVyIjtzOjA6IiI7czoxOToicnRlX2FkdmFuY2VkX2NvbmZpZyI7czoxOiJuIjtzOjE1OiJydGVfY29uZmlnX2pzb24iO3M6MjAyMToiewogICAgInRvb2xiYXIiOiB7CiAgICAgICAgIml0ZW1zIjogWwogICAgICAgICAgICAiYm9sZCIsCiAgICAgICAgICAgICJpdGFsaWMiLAogICAgICAgICAgICAidW5kZXJsaW5lIiwKICAgICAgICAgICAgImxpbmsiLAogICAgICAgICAgICAiY29kZSIKICAgICAgICBdCiAgICB9LAogICAgImltYWdlIjogewogICAgICAgICJ0b29sYmFyIjogWwogICAgICAgICAgICAiaW1hZ2VUZXh0QWx0ZXJuYXRpdmUiLAogICAgICAgICAgICAidG9nZ2xlSW1hZ2VDYXB0aW9uIiwKICAgICAgICAgICAgImxpbmtJbWFnZSIsCiAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICJuYW1lIjogImltYWdlU3R5bGU6Y3VzdG9tRHJvcGRvd24iLAogICAgICAgICAgICAgICAgInRpdGxlIjogIkFsaWduIiwKICAgICAgICAgICAgICAgICJkZWZhdWx0SXRlbSI6ICJpbWFnZVN0eWxlOmlubGluZSIsCiAgICAgICAgICAgICAgICAiaXRlbXMiOiBbCiAgICAgICAgICAgICAgICAgICAgImltYWdlU3R5bGU6aW5saW5lIiwKICAgICAgICAgICAgICAgICAgICAiaW1hZ2VTdHlsZTpibG9jayIsCiAgICAgICAgICAgICAgICAgICAgImltYWdlU3R5bGU6c2lkZSIsCiAgICAgICAgICAgICAgICAgICAgImltYWdlU3R5bGU6YWxpZ25MZWZ0IiwKICAgICAgICAgICAgICAgICAgICAiaW1hZ2VTdHlsZTphbGlnbkJsb2NrTGVmdCIsCiAgICAgICAgICAgICAgICAgICAgImltYWdlU3R5bGU6YWxpZ25DZW50ZXIiLAogICAgICAgICAgICAgICAgICAgICJpbWFnZVN0eWxlOmFsaWduQmxvY2tSaWdodCIsCiAgICAgICAgICAgICAgICAgICAgImltYWdlU3R5bGU6YWxpZ25SaWdodCIKICAgICAgICAgICAgICAgIF0KICAgICAgICAgICAgfQogICAgICAgIF0sCiAgICAgICAgInN0eWxlcyI6IFsKICAgICAgICAgICAgImZ1bGwiLAogICAgICAgICAgICAic2lkZSIsCiAgICAgICAgICAgICJhbGlnbkxlZnQiLAogICAgICAgICAgICAiYWxpZ25DZW50ZXIiLAogICAgICAgICAgICAiYWxpZ25SaWdodCIKICAgICAgICBdLAogICAgICAgICJpbnNlcnQiOiB7CiAgICAgICAgICAgICJ0eXBlIjogImF1dG8iLAogICAgICAgICAgICAiaW50ZWdyYXRpb25zIjogWwogICAgICAgICAgICAgICAgInVybCIKICAgICAgICAgICAgXQogICAgICAgIH0KICAgIH0sCiAgICAiaHRtbEVtYmVkIjogewogICAgICAgICJzaG93UHJldmlld3MiOiB0cnVlCiAgICB9LAogICAgImh0bWxTdXBwb3J0IjogewogICAgICAgICJhbGxvdyI6IFsKICAgICAgICAgICAgewogICAgICAgICAgICAgICAgIm5hbWUiOiAiXC9eKGRpdnxzZWN0aW9ufGFydGljbGV8c3BhbikkXC8iLAogICAgICAgICAgICAgICAgImF0dHJpYnV0ZXMiOiAiXC9kYXRhLVtcXHctXStcLyIsCiAgICAgICAgICAgICAgICAiY2xhc3NlcyI6IHRydWUsCiAgICAgICAgICAgICAgICAic3R5bGVzIjogZmFsc2UKICAgICAgICAgICAgfQogICAgICAgIF0KICAgIH0sCiAgICAidGFibGUiOiB7CiAgICAgICAgImNvbnRlbnRUb29sYmFyIjogWwogICAgICAgICAgICAidGFibGVDb2x1bW4iLAogICAgICAgICAgICAidGFibGVSb3ciLAogICAgICAgICAgICAibWVyZ2VUYWJsZUNlbGxzIiwKICAgICAgICAgICAgInRhYmxlUHJvcGVydGllcyIsCiAgICAgICAgICAgICJ0YWJsZUNlbGxQcm9wZXJ0aWVzIiwKICAgICAgICAgICAgInRvZ2dsZVRhYmxlQ2FwdGlvbiIKICAgICAgICBdCiAgICB9LAogICAgImxpbmsiOiB7CiAgICAgICAgImRlY29yYXRvcnMiOiB7CiAgICAgICAgICAgICJvcGVuSW5OZXdUYWIiOiB7CiAgICAgICAgICAgICAgICAibW9kZSI6ICJtYW51YWwiLAogICAgICAgICAgICAgICAgImxhYmVsIjogIk9wZW4gaW4gYSBuZXcgdGFiIiwKICAgICAgICAgICAgICAgICJhdHRyaWJ1dGVzIjogewogICAgICAgICAgICAgICAgICAgICJ0YXJnZXQiOiAiX2JsYW5rIiwKICAgICAgICAgICAgICAgICAgICAicmVsIjogIm5vb3BlbmVyIG5vcmVmZXJyZXIiCiAgICAgICAgICAgICAgICB9CiAgICAgICAgICAgIH0KICAgICAgICB9CiAgICB9Cn0iO3M6MTE6ImpzX3RlbXBsYXRlIjtzOjA6IiI7czo3OiJ0b29sYmFyIjthOjU6e2k6MDtzOjQ6ImJvbGQiO2k6MTtzOjY6Iml0YWxpYyI7aToyO3M6OToidW5kZXJsaW5lIjtpOjM7czo0OiJsaW5rIjtpOjQ7czo0OiJjb2RlIjt9fQ=='),
	(2,'CKEditor Full','ckeditor','YTo1OntzOjQ6InR5cGUiO3M6ODoiY2tlZGl0b3IiO3M6NzoidG9vbGJhciI7YTozNTp7aTowO3M6NDoiYm9sZCI7aToxO3M6NjoiaXRhbGljIjtpOjI7czoxMzoic3RyaWtldGhyb3VnaCI7aTozO3M6OToidW5kZXJsaW5lIjtpOjQ7czo5OiJzdWJzY3JpcHQiO2k6NTtzOjExOiJzdXBlcnNjcmlwdCI7aTo2O3M6MTA6ImJsb2NrcXVvdGUiO2k6NztzOjQ6ImNvZGUiO2k6ODtzOjk6ImNvZGVCbG9jayI7aTo5O3M6NzoiaGVhZGluZyI7aToxMDtzOjEyOiJyZW1vdmVGb3JtYXQiO2k6MTE7czo0OiJ1bmRvIjtpOjEyO3M6NDoicmVkbyI7aToxMztzOjEyOiJudW1iZXJlZExpc3QiO2k6MTQ7czoxMjoiYnVsbGV0ZWRMaXN0IjtpOjE1O3M6Nzoib3V0ZGVudCI7aToxNjtzOjY6ImluZGVudCI7aToxNztzOjQ6ImxpbmsiO2k6MTg7czoxMToiZmlsZW1hbmFnZXIiO2k6MTk7czoxMToiaW5zZXJ0SW1hZ2UiO2k6MjA7czoxMToiaW5zZXJ0VGFibGUiO2k6MjE7czoxMDoibWVkaWFFbWJlZCI7aToyMjtzOjk6Imh0bWxFbWJlZCI7aToyMztzOjE0OiJhbGlnbm1lbnQ6bGVmdCI7aToyNDtzOjE1OiJhbGlnbm1lbnQ6cmlnaHQiO2k6MjU7czoxNjoiYWxpZ25tZW50OmNlbnRlciI7aToyNjtzOjE3OiJhbGlnbm1lbnQ6anVzdGlmeSI7aToyNztzOjE0OiJob3Jpem9udGFsTGluZSI7aToyODtzOjE3OiJzcGVjaWFsQ2hhcmFjdGVycyI7aToyOTtzOjg6InJlYWRNb3JlIjtpOjMwO3M6OToiZm9udENvbG9yIjtpOjMxO3M6MTk6ImZvbnRCYWNrZ3JvdW5kQ29sb3IiO2k6MzI7czoxNDoiZmluZEFuZFJlcGxhY2UiO2k6MzM7czoxMDoic2hvd0Jsb2NrcyI7aTozNDtzOjEzOiJzb3VyY2VFZGl0aW5nIjt9czo2OiJoZWlnaHQiO3M6MzoiMjAwIjtzOjEwOiJ1cGxvYWRfZGlyIjtzOjM6ImFsbCI7czoxMDoibWVkaWFFbWJlZCI7YToxOntzOjE0OiJwcmV2aWV3c0luRGF0YSI7YjoxO319'),
	(3,'RedactorX Basic','redactorX','YToxMDp7czoxMDoidXBsb2FkX2RpciI7czowOiIiO3M6MjA6ImZpZWxkX3RleHRfZGlyZWN0aW9uIjtzOjM6Imx0ciI7czoxMjoiY3NzX3RlbXBsYXRlIjtzOjA6IiI7czo2OiJoZWlnaHQiO3M6MzoiMjAwIjtzOjEwOiJtYXhfaGVpZ2h0IjtzOjA6IiI7czo3OiJsaW1pdGVyIjtzOjA6IiI7czoxOToicnRlX2FkdmFuY2VkX2NvbmZpZyI7czoxOiJuIjtzOjE1OiJydGVfY29uZmlnX2pzb24iO3M6NzA3OiJ7CiAgICAidG9vbGJhcl9oaWRlIjogInkiLAogICAgInN0aWNreSI6ICJ5IiwKICAgICJ0b29sYmFyX3RvcGJhciI6ICJuIiwKICAgICJ0b3BiYXIiOiBbCiAgICAgICAgInNob3J0Y3V0IiwKICAgICAgICAidW5kbyIsCiAgICAgICAgInJlZG8iCiAgICBdLAogICAgInRvb2xiYXJfYWRkYmFyIjogInkiLAogICAgImFkZGJhciI6IFsKICAgICAgICAiZW1iZWQiLAogICAgICAgICJ0YWJsZSIsCiAgICAgICAgInF1b3RlIiwKICAgICAgICAicHJlIiwKICAgICAgICAibGluZSIKICAgIF0sCiAgICAidG9vbGJhcl9jb250ZXh0IjogInkiLAogICAgImNvbnRleHQiOiBbCiAgICAgICAgImJvbGQiLAogICAgICAgICJpdGFsaWMiLAogICAgICAgICJkZWxldGVkIiwKICAgICAgICAiY29kZSIsCiAgICAgICAgImxpbmsiLAogICAgICAgICJtYXJrIiwKICAgICAgICAic3ViIiwKICAgICAgICAic3VwIiwKICAgICAgICAia2JkIgogICAgXSwKICAgICJmb3JtYXQiOiBbCiAgICAgICAgInAiLAogICAgICAgICJ1bCIsCiAgICAgICAgIm9sIgogICAgXSwKICAgICJwbHVnaW5zIjogWwogICAgICAgICJ1bmRlcmxpbmUiLAogICAgICAgICJmaWxlYnJvd3NlciIsCiAgICAgICAgInJ0ZV9kZWZpbmVkbGlua3MiLAogICAgICAgICJwYWdlcyIKICAgIF0sCiAgICAidG9vbGJhcl9jb250cm9sIjogInkiLAogICAgInNwZWxsY2hlY2siOiAiYnJvd3NlciIKfSI7czoxMToianNfdGVtcGxhdGUiO3M6MDoiIjtzOjc6InRvb2xiYXIiO2E6MTI6e3M6MTI6InRvb2xiYXJfaGlkZSI7czoxOiJ5IjtzOjY6InN0aWNreSI7czoxOiJ5IjtzOjE0OiJ0b29sYmFyX3RvcGJhciI7czoxOiJuIjtzOjY6InRvcGJhciI7YTozOntpOjA7czo4OiJzaG9ydGN1dCI7aToxO3M6NDoidW5kbyI7aToyO3M6NDoicmVkbyI7fXM6MTQ6InRvb2xiYXJfYWRkYmFyIjtzOjE6InkiO3M6NjoiYWRkYmFyIjthOjU6e2k6MDtzOjU6ImVtYmVkIjtpOjE7czo1OiJ0YWJsZSI7aToyO3M6NToicXVvdGUiO2k6MztzOjM6InByZSI7aTo0O3M6NDoibGluZSI7fXM6MTU6InRvb2xiYXJfY29udGV4dCI7czoxOiJ5IjtzOjc6ImNvbnRleHQiO2E6OTp7aTowO3M6NDoiYm9sZCI7aToxO3M6NjoiaXRhbGljIjtpOjI7czo3OiJkZWxldGVkIjtpOjM7czo0OiJjb2RlIjtpOjQ7czo0OiJsaW5rIjtpOjU7czo0OiJtYXJrIjtpOjY7czozOiJzdWIiO2k6NztzOjM6InN1cCI7aTo4O3M6Mzoia2JkIjt9czo2OiJmb3JtYXQiO2E6Mzp7aTowO3M6MToicCI7aToxO3M6MjoidWwiO2k6MjtzOjI6Im9sIjt9czo3OiJwbHVnaW5zIjthOjQ6e2k6MDtzOjk6InVuZGVybGluZSI7aToxO3M6MTE6ImZpbGVicm93c2VyIjtpOjI7czoxNjoicnRlX2RlZmluZWRsaW5rcyI7aTozO3M6NToicGFnZXMiO31zOjE1OiJ0b29sYmFyX2NvbnRyb2wiO3M6MToieSI7czoxMDoic3BlbGxjaGVjayI7czo3OiJicm93c2VyIjt9fQ=='),
	(4,'RedactorX Full','redactorX','YTo0OntzOjQ6InR5cGUiO3M6OToicmVkYWN0b3JYIjtzOjc6InRvb2xiYXIiO2E6MTI6e3M6MTI6InRvb2xiYXJfaGlkZSI7czoxOiJ5IjtzOjE0OiJ0b29sYmFyX3RvcGJhciI7czoxOiJ5IjtzOjE0OiJ0b29sYmFyX2FkZGJhciI7czoxOiJ5IjtzOjE1OiJ0b29sYmFyX2NvbnRleHQiO3M6MToieSI7czoxNToidG9vbGJhcl9jb250cm9sIjtzOjE6InkiO3M6NDoiaGlkZSI7YTowOnt9czo2OiJ0b3BiYXIiO2E6Mzp7aTowO3M6NDoidW5kbyI7aToxO3M6NDoicmVkbyI7aToyO3M6ODoic2hvcnRjdXQiO31zOjY6ImFkZGJhciI7YTo2OntpOjA7czo5OiJwYXJhZ3JhcGgiO2k6MTtzOjU6ImVtYmVkIjtpOjI7czo1OiJ0YWJsZSI7aTozO3M6NToicXVvdGUiO2k6NDtzOjM6InByZSI7aTo1O3M6NDoibGluZSI7fXM6NzoiY29udGV4dCI7YTo5OntpOjA7czo0OiJib2xkIjtpOjE7czo2OiJpdGFsaWMiO2k6MjtzOjc6ImRlbGV0ZWQiO2k6MztzOjQ6ImNvZGUiO2k6NDtzOjQ6ImxpbmsiO2k6NTtzOjQ6Im1hcmsiO2k6NjtzOjM6InN1YiI7aTo3O3M6Mzoic3VwIjtpOjg7czozOiJrYmQiO31zOjY6ImVkaXRvciI7YTo3OntpOjA7czozOiJhZGQiO2k6MTtzOjQ6Imh0bWwiO2k6MjtzOjY6ImZvcm1hdCI7aTozO3M6NDoiYm9sZCI7aTo0O3M6NjoiaXRhbGljIjtpOjU7czo3OiJkZWxldGVkIjtpOjY7czo0OiJsaW5rIjt9czo2OiJmb3JtYXQiO2E6OTp7aTowO3M6MToicCI7aToxO3M6MjoiaDEiO2k6MjtzOjI6ImgyIjtpOjM7czoyOiJoMyI7aTo0O3M6MjoiaDQiO2k6NTtzOjI6Img1IjtpOjY7czoyOiJoNiI7aTo3O3M6MjoidWwiO2k6ODtzOjI6Im9sIjt9czo3OiJwbHVnaW5zIjthOjE1OntpOjA7czo5OiJ1bmRlcmxpbmUiO2k6MTtzOjk6ImFsaWdubWVudCI7aToyO3M6OToiYmxvY2tjb2RlIjtpOjM7czoxNjoicnRlX2RlZmluZWRsaW5rcyI7aTo0O3M6NToicGFnZXMiO2k6NTtzOjExOiJmaWxlYnJvd3NlciI7aTo2O3M6MTM6ImltYWdlcG9zaXRpb24iO2k6NztzOjExOiJpbWFnZXJlc2l6ZSI7aTo4O3M6MTI6ImlubGluZWZvcm1hdCI7aTo5O3M6MTI6InJlbW92ZWZvcm1hdCI7aToxMDtzOjc6ImNvdW50ZXIiO2k6MTE7czo4OiJzZWxlY3RvciI7aToxMjtzOjEyOiJzcGVjaWFsY2hhcnMiO2k6MTM7czoxMzoidGV4dGRpcmVjdGlvbiI7aToxNDtzOjg6InJlYWRtb3JlIjt9fXM6NjoiaGVpZ2h0IjtzOjM6IjIwMCI7czoxMDoidXBsb2FkX2RpciI7czozOiJhbGwiO30=');

/*!40000 ALTER TABLE `exp_rte_toolsets` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_search
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_search`;

CREATE TABLE `exp_search` (
  `search_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_id` int NOT NULL DEFAULT '1',
  `search_date` int NOT NULL,
  `keywords` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `member_id` int unsigned NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_results` int NOT NULL,
  `per_page` tinyint unsigned NOT NULL,
  `query` mediumtext COLLATE utf8mb4_unicode_ci,
  `custom_fields` mediumtext COLLATE utf8mb4_unicode_ci,
  `result_page` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_result_page` varchar(70) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`search_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_search_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_search_log`;

CREATE TABLE `exp_search_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `site_id` int unsigned NOT NULL DEFAULT '1',
  `member_id` int unsigned NOT NULL,
  `screen_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `search_date` int NOT NULL,
  `search_type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `search_terms` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_security_hashes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_security_hashes`;

CREATE TABLE `exp_security_hashes` (
  `hash_id` int unsigned NOT NULL AUTO_INCREMENT,
  `date` int unsigned NOT NULL,
  `session_id` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `hash` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`hash_id`),
  KEY `session_id` (`session_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_security_hashes` WRITE;
/*!40000 ALTER TABLE `exp_security_hashes` DISABLE KEYS */;

INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `session_id`, `hash`)
VALUES
	(24,1720294285,'d997449eafeb92f4ebcb15899f9dce67cfe83f61','a478e2ba293d2de6bad7cedb6a6078f78ec60e86');

/*!40000 ALTER TABLE `exp_security_hashes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_sessions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_sessions`;

CREATE TABLE `exp_sessions` (
  `session_id` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `member_id` int NOT NULL DEFAULT '0',
  `admin_sess` tinyint(1) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `user_agent` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `login_state` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fingerprint` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sess_start` int unsigned NOT NULL DEFAULT '0',
  `auth_timeout` int unsigned NOT NULL DEFAULT '0',
  `last_activity` int unsigned NOT NULL DEFAULT '0',
  `can_debug` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `mfa_flag` enum('skip','show','required') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'skip',
  `pro_banner_seen` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  PRIMARY KEY (`session_id`),
  KEY `member_id` (`member_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_sessions` WRITE;
/*!40000 ALTER TABLE `exp_sessions` DISABLE KEYS */;

INSERT INTO `exp_sessions` (`session_id`, `member_id`, `admin_sess`, `ip_address`, `user_agent`, `login_state`, `fingerprint`, `sess_start`, `auth_timeout`, `last_activity`, `can_debug`, `mfa_flag`, `pro_banner_seen`)
VALUES
	('d997449eafeb92f4ebcb15899f9dce67cfe83f61',1,1,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36',NULL,'81b9615edeb8a97328415a42f88415ad',1720433844,0,1720437024,'0','skip','n');

/*!40000 ALTER TABLE `exp_sessions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_simple_grids_tables_settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_simple_grids_tables_settings`;

CREATE TABLE `exp_simple_grids_tables_settings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int unsigned DEFAULT '1',
  `key` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `val` text COLLATE utf8mb4_unicode_ci,
  `type` char(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_simple_grids_tables_settings` WRITE;
/*!40000 ALTER TABLE `exp_simple_grids_tables_settings` DISABLE KEYS */;

INSERT INTO `exp_simple_grids_tables_settings` (`id`, `site_id`, `key`, `val`, `type`)
VALUES
	(1,1,'installed_date','1720106248','string'),
	(2,1,'installed_version','1.7.4','string'),
	(3,1,'installed_build','','string'),
	(4,1,'license','4d9904b362e6ff151680a769','string');

/*!40000 ALTER TABLE `exp_simple_grids_tables_settings` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_sites
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_sites`;

CREATE TABLE `exp_sites` (
  `site_id` int unsigned NOT NULL AUTO_INCREMENT,
  `site_label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `site_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `site_description` text COLLATE utf8mb4_unicode_ci,
  `site_color` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `site_bootstrap_checksums` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_pages` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`site_id`),
  KEY `site_name` (`site_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_sites` WRITE;
/*!40000 ALTER TABLE `exp_sites` DISABLE KEYS */;

INSERT INTO `exp_sites` (`site_id`, `site_label`, `site_name`, `site_description`, `site_color`, `site_bootstrap_checksums`, `site_pages`)
VALUES
	(1,'Clearfix','default_site',NULL,'','YToxOntzOjQyOiIvVXNlcnMvam9uL0hlcmQvZGV2LWNsZWFyZml4bGFicy9pbmRleC5waHAiO3M6MzI6IjQwNjJkYjVjMmYzNWQ2NDJjMjgyN2VhMGY4ZWNlY2JjIjt9','YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6Nzp7aTo3O3M6NjoiL2hvbWUvIjtpOjI7czo3OiIvYWJvdXQvIjtpOjM7czoxMDoiL3NlcnZpY2VzLyI7aTo4O3M6NjoiL3dvcmsvIjtpOjk7czo2OiIvYmxvZy8iO2k6NTtzOjk6Ii9jb250YWN0LyI7aToxMDtzOjMyOiIvYmxvZy90ZXN0aW5nLXRoZS1ibG9nLW91dC1oZXJlLyI7fXM6OToidGVtcGxhdGVzIjthOjc6e2k6MjtpOjA7aTozO2k6MDtpOjU7aTowO2k6NztpOjA7aTo4O2k6MDtpOjk7aTowO2k6MTA7aTowO319fQ==');

/*!40000 ALTER TABLE `exp_sites` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_snippets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_snippets`;

CREATE TABLE `exp_snippets` (
  `snippet_id` int unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int NOT NULL,
  `snippet_name` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `snippet_contents` text COLLATE utf8mb4_unicode_ci,
  `edit_date` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`snippet_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_snippets` WRITE;
/*!40000 ALTER TABLE `exp_snippets` DISABLE KEYS */;

INSERT INTO `exp_snippets` (`snippet_id`, `site_id`, `snippet_name`, `snippet_contents`, `edit_date`)
VALUES
	(1,1,'snp-clients','',1720119247),
	(2,1,'snp-testimonials','',1720119268),
	(3,1,'snp-blog','',1720124607),
	(4,1,'snp-related-work','',1720119330),
	(5,1,'snp-testimonials-big','',1720119366),
	(6,1,'snp-page-intro','',1720119402),
	(7,1,'par-footer','            <!-- start section -->\n            <section class=\"pb-4 sm-pt-30px sm-pb-40px overflow-hidden position-relative section-dark\">\n                <div class=\"container\">\n                    <div class=\"row\" data-anime=\'{ \"el\": \"childs\", \"translateY\": [0, 0], \"opacity\": [0,1], \"duration\": 500, \"delay\": 200, \"staggervalue\": 300, \"easing\": \"easeOutQuad\" }\'>\n                        <div class=\"col-sm-5 text-center text-sm-start\">\n                            <div class=\"outside-box-left-25 xl-outside-box-left-10 sm-outside-box-left-0\">\n                                <div class=\"fs-350 xl-fs-250 lg-fs-200 md-fs-170 sm-fs-100 text-cf-coal fw-600 ls-minus-20px word-break-normal\">work</div>\n                            </div>\n                        </div>\n                        <div class=\"col-sm-7 text-center text-sm-end\">\n                            <div class=\"outside-box-right-5 sm-outside-box-right-0\">\n                                <div class=\"fs-350 xl-fs-250 lg-fs-200 md-fs-170 sm-fs-100 text-cf-coal fw-600 ls-minus-20px position-relative d-inline-block word-break-normal text-white-space-nowrap\">with us\n                                    <div class=\"position-absolute left-minus-140px top-minus-140px z-index-9 xl-left-minus-110px top-minus-140px xl-top-minus-100px md-top-minus-90px z-index-9 xl-w-230px md-w-200px d-none d-md-block\" data-anime=\'{ \"translateY\": [-15, 0], \"scale\": [0.5, 1], \"opacity\": [0,1], \"duration\": 800, \"delay\": 200, \"staggervalue\": 300, \"easing\": \"easeOutQuad\" }\'>\n                                        <img src=\"images/demo-web-agency-03-v3.png\" class=\"animation-rotation\" alt=\"\">\n                                        <div class=\"absolute-middle-center w-100 z-index-minus-1\"><img src=\"images/demo-web-agency-04-v1_1.png\" alt=\"\"></div>\n                                    </div>\n                                </div>\n                            </div>\n                        </div>\n                    </div>\n                </div>\n            </section>\n            <!-- end section -->\n        </div>\n        <!-- start footer -->\n        <footer class=\"p-0\">\n            <div class=\"container\">\n                <div class=\"row align-items-center mb-4 sm-mb-6\">\n                    <div class=\"col-md-10 col-sm-8 text-center text-sm-start xs-mb-25px\">\n                        <h5 class=\"mb-0 text-cf-sky fw-400 ls-minus-1px\">Let\'s make something great!</h5>\n                    </div>\n                    <div class=\"col-md-2 col-sm-4 text-center text-sm-end\">\n                        <a href=\"demo-web-agency.html\" class=\"footer-logo d-inline-block\"><img src=\"images/logos/cf-logo-no-tag-horz.svg\" data-at2x=\"images/logos/cf-logo-no-tag-horz.svg\" alt=\"\"></a>\n                    </div>\n                </div>\n                <div class=\"row align-items-end mb-6 sm-mb-40px\">\n                    <!-- start footer column -->\n                    <div class=\"col-lg-3 col-sm-4 text-center text-sm-start xs-mb-25px last-paragraph-no-margin\">\n                        <span class=\"d-block text-cf-sky ls-minus-05px mb-5px fw-600\">Clearfix - Kansas City</span>\n                        <p class=\"w-80 lg-w-100 text-light-medium-gray fs-15 lh-28\">\n                            14300 Kenneth Rd Suite 200, Leawood, KS 66224</p>\n                    </div>\n                    <!-- end footer column -->\n\n                    <!-- start footer column -->\n                    <div class=\"col-md-3 col-sm-4 last-paragraph-no-margin ms-auto text-center text-sm-end\">\n                        <a href=\"tel:1235678901\" class=\"text-light-medium-gray d-block lh-18 text-dark-gray-hover\">\n                            888 683 1337</a>\n                        <a href=\"mailto:info@clearfixlabs.com\" class=\"text-light-medium-gray text-medium-gray-hover fw-600 text-decoration-line-bottom\">info@cleafixlabs.com</a>\n                    </div>\n                    <!-- end footer column -->\n                </div>\n            </div>\n            <div class=\"footer-bottom pt-25px pb-25px\" style=\"background-color: color(display-p3 0.11 0.114 0.121)\">\n                <div class=\"container\">\n                    <div class=\"row align-items-center\">\n                        <div class=\"col-lg-7 text-center text-lg-start md-mb-10px\">\n                            <ul class=\"footer-navbar text-light fw-600 fs-16\">\n                                <li class=\"nav-item active\"><a href=\"demo-web-agency.html\" class=\"nav-link text-light\">Home</a></li>\n                                <li class=\"nav-item\"><a href=\"demo-web-agency-about.html\" class=\"nav-link text-light\">Agency</a></li>\n                                <li class=\"nav-item\"><a href=\"demo-web-agency-expertise.html\" class=\"nav-link text-light\">Expertise</a></li>\n                                <li class=\"nav-item\"><a href=\"demo-web-agency-projects.html\" class=\"nav-link text-light\">Projects</a></li>\n                                <li class=\"nav-item\"><a href=\"demo-web-agency-people.html\" class=\"nav-link text-light\">People</a></li>\n                                <li class=\"nav-item\"><a href=\"demo-web-agency-blog.html\" class=\"nav-link text-light\">Blog</a></li>\n                                <li class=\"nav-item\"><a href=\"demo-web-agency-contact.html\" class=\"nav-link text-light\">Contact</a></li>\n                            </ul>\n                        </div>\n                        <div class=\"col-lg-5 text-center text-lg-end\">\n                            <span class=\"text-light-medium-gray fs-15\">&copy; 2024 clearfix is Proudly Powered by <a href=\"https://www.activelogic.com/\" class=\"text-decoration-line-bottom text-light-medium-gray text-light-medium-gray-hover fw-500\" target=\"_blank\">Active Logic</a></span>\n                        </div>\n                    </div>\n                </div>\n            </div>\n        </footer>\n        <!-- end footer -->\n        <!-- start sticky elements -->\n        <div class=\"sticky-wrap z-index-1 d-none d-xl-inline-block\" data-animation-delay=\"100\" data-shadow-animation=\"true\">\n            <div class=\"elements-social social-icon-style-10\">\n                <ul class=\"small-icon fw-600\">\n                    <li class=\"fs-18\">Follow us <span class=\"separator-line-1px w-30px d-inline-block align-middle ms-15px\"></span></li>\n                    <li><a class=\"facebook\" href=\"https://www.facebook.com/\" target=\"_blank\">Fb.</a> </li>\n                    <li><a class=\"dribbble\" href=\"http://www.dribbble.com\" target=\"_blank\">Dr.</a></li>\n                    <li><a class=\"twitter\" href=\"http://www.twitter.com\" target=\"_blank\">Tw.</a></li>\n                    <li><a class=\"behance\" href=\"http://www.behance.com/\" target=\"_blank\">Be.</a> </li>\n                </ul>\n            </div>\n        </div>\n        <!-- end sticky elements -->\n        <!-- start scroll progress -->\n        <div class=\"scroll-progress d-none d-xxl-block\">\n            <a href=\"#\" class=\"scroll-top\" aria-label=\"scroll\">\n                <span class=\"scroll-text\">Scroll to top</span><span class=\"scroll-line\"><span class=\"scroll-point\"></span></span>\n            </a>\n        </div>\n        <!-- end scroll progress -->\n        <!-- javascript libraries -->\n        <script type=\"text/javascript\" src=\"js/jquery.js\"></script>\n        <script type=\"text/javascript\" src=\"js/vendors.min.js\"></script>\n        <script type=\"text/javascript\" src=\"js/main.js\"></script>\n    </body>\n</html>',1720121663),
	(8,1,'par-header','<!doctype html>\n<html class=\"no-js\" lang=\"en\">\n    <head>\n        <title>{layout:seo-title}</title>\n        <meta charset=\"utf-8\">\n        <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\" />\n        <meta name=\"author\" content=\"{layout:seo-author}\">\n        <meta name=\"viewport\" content=\"width=device-width,initial-scale=1.0\" />\n        <meta name=\"description\" content=\"{layout:seo-desccription}\">\n        <!-- favicon icon -->\n        <link rel=\"shortcut icon\" href=\"images/favicon.png\">\n        <link rel=\"apple-touch-icon\" href=\"images/apple-touch-icon-57x57.png\">\n        <link rel=\"apple-touch-icon\" sizes=\"72x72\" href=\"assets/images/apple-touch-icon-72x72.png\">\n        <link rel=\"apple-touch-icon\" sizes=\"114x114\" href=\"assets/images/apple-touch-icon-114x114.png\">\n        <!-- google fonts preconnect -->\n        <link rel=\"preconnect\" href=\"https://fonts.googleapis.com\" crossorigin>\n        <link rel=\"preconnect\" href=\"https://fonts.gstatic.com\" crossorigin>\n        <!-- style sheets and font icons  -->\n        <link rel=\"stylesheet\" href=\"assets/css/vendors.min.css\"/>\n        <link rel=\"stylesheet\" href=\"assets/css/icon.min.css\"/>\n        <link rel=\"stylesheet\" href=\"assets/css/style.css\"/>\n        <link rel=\"stylesheet\" href=\"assets/css/responsive.css\"/>\n        <link rel=\"stylesheet\" href=\"assets/demos/web-agency/web-agency.css\" />\n\n        <style>\n            body {\n                 background-image: url(\'assets/images/vertical-line-bg-dark-01.svg\');\n                 background-position: center top;\n                 background-repeat: repeat;\n                 background-color: #3C3B3B;\n            }\n            .bg-cf-hero {\n                 background-image:  url(\'assets/images/bg-cf-heart.svg\');\n                 background-position: center;\n                 background-repeat: no-repeat;\n                 background-size: 850px;\n            }\n\n            @media only screen and (max-width : 992px) {\n\n              .bg-cf-hero {\n                   background-size: 45%;\n              }\n              .navbar.bg-transparent, .navbar-modern-inner.bg-transparent, .navbar-full-screen-menu-inner.bg-transparent {\n                  background-color: rgba(255, 255, 255, 0);\n                }\n            }\n\n        </style>\n    </head>\n    <body data-mobile-nav-style=\"classic\" >\n\n{embed=\"global/nav\"}\n\n        <div class=\"position-relative\">',1720128614),
	(9,1,'static-home','',1720123428),
	(10,1,'static-contact','',1720123441),
	(11,1,'satatic-blog','',1720123459),
	(12,1,'static-work','',1720123471);

/*!40000 ALTER TABLE `exp_snippets` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_specialty_templates
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_specialty_templates`;

CREATE TABLE `exp_specialty_templates` (
  `template_id` int unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int unsigned NOT NULL DEFAULT '1',
  `enable_template` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `template_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_title` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `template_type` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template_subtype` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template_data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `template_notes` text COLLATE utf8mb4_unicode_ci,
  `edit_date` int NOT NULL DEFAULT '0',
  `last_author_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`template_id`),
  KEY `template_name` (`template_name`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_specialty_templates` WRITE;
/*!40000 ALTER TABLE `exp_specialty_templates` DISABLE KEYS */;

INSERT INTO `exp_specialty_templates` (`template_id`, `site_id`, `enable_template`, `template_name`, `data_title`, `template_type`, `template_subtype`, `template_data`, `template_notes`, `edit_date`, `last_author_id`)
VALUES
	(1,1,'y','offline_template','','system',NULL,'<!doctype html>\n<html dir=\"ltr\">\n    <head>\n        <title>System Offline</title>\n        <meta content=\"width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no\"  name=\"viewport\">\n\n        <style type=\"text/css\">\n:root, body {\n    --ee-panel-bg: #fff;\n    --ee-panel-border: #dfe0ef;\n    --ee-text-normal: #0d0d19;\n    --ee-main-bg: #f7f7fb;\n    --ee-link: #5D63F1;\n    --ee-link-hover: #171feb;\n}\n\n*, :after, :before {\n    box-sizing: inherit;\n}\n\nhtml {\n    box-sizing: border-box;\n    font-size: 15px;\n    height: 100%;\n    line-height: 1.15;\n}\n\nbody {\n    font-family: -apple-system, BlinkMacSystemFont, segoe ui, helvetica neue, helvetica, Cantarell, Ubuntu, roboto, noto, arial, sans-serif;\n    height: 100%;\n    font-size: 1rem;\n    line-height: 1.6;\n    color: var(--ee-text-normal);\n    background: var(--ee-main-bg);\n    -webkit-font-smoothing: antialiased;\n    margin: 0;\n}\n\n.panel {\n    margin-bottom: 20px;\n    background-color: var(--ee-panel-bg);\n    border: 1px solid var(--ee-panel-border);\n    border-radius: 6px;\n}\n.redirect {\n	max-width: 700px;\n	min-width: 350px;\n    position: absolute;\n    top: 50%;\n    left: 50%;\n    transform: translate(-50%,-50%);\n}\n\n.panel-heading {\n    padding: 20px 25px;\n    position: relative;\n}\n\n.panel-body {\n    padding: 20px 25px;\n}\n\n.panel-body:after, .panel-body:before {\n    content: \" \";\n    display: table;\n}\n\n.redirect p {\n    margin-bottom: 20px;\n}\np {\n    line-height: 1.6;\n}\na, blockquote, code, h1, h2, h3, h4, h5, h6, ol, p, pre, ul {\n    color: inherit;\n    margin: 0;\n    padding: 0;\n    font-weight: inherit;\n}\n\na {\n    color: var(--ee-link);\n    text-decoration: none;\n    -webkit-transition: color .15s ease-in-out;\n    -moz-transition: color .15s ease-in-out;\n    -o-transition: color .15s ease-in-out;\n}\n\na:hover {\n    color: var(--ee-link-hover);\n}\n\nh3 {\n    font-size: 1.35em;\n    font-weight: 500;\n}\n\nol, ul {\n    padding-left: 0;\n}\n\nol li, ul li {\n    list-style-position: inside;\n}\n\n.panel-footer {\n    padding: 20px 25px;\n    position: relative;\n}\n\n\n        </style>\n    </head>\n    <body>\n        <section class=\"flex-wrap\">\n            <section class=\"wrap\">\n                <div class=\"panel redirect\">\n                    <div class=\"panel-heading\">\n                        <h3>System Offline</h3>\n                    </div>\n					<div class=\"panel-body\">\n					This site is currently offline\n                    </div>\n                </div>\n            </section>\n        </section>\n    </body>\n</html>',NULL,1720033133,0),
	(2,1,'y','message_template','','system',NULL,'<!doctype html>\n<html dir=\"ltr\">\n    <head>\n        <title>{title}</title>\n        <meta http-equiv=\"content-type\" content=\"text/html; charset={charset}\">\n        <meta content=\"width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no\"  name=\"viewport\">\n        <meta name=\"referrer\" content=\"no-referrer\">\n        {meta_refresh}\n        <style type=\"text/css\">\n:root, body {\n    --ee-panel-bg: #fff;\n    --ee-panel-border: #dfe0ef;\n    --ee-text-normal: #0d0d19;\n    --ee-main-bg: #f7f7fb;\n    --ee-link: #5D63F1;\n    --ee-link-hover: #171feb;\n}\n\n*, :after, :before {\n    box-sizing: inherit;\n}\n\nhtml {\n    box-sizing: border-box;\n    font-size: 15px;\n    height: 100%;\n    line-height: 1.15;\n}\n\nbody {\n    font-family: -apple-system, BlinkMacSystemFont, segoe ui, helvetica neue, helvetica, Cantarell, Ubuntu, roboto, noto, arial, sans-serif;\n    height: 100%;\n    font-size: 1rem;\n    line-height: 1.6;\n    color: var(--ee-text-normal);\n    background: var(--ee-main-bg);\n    -webkit-font-smoothing: antialiased;\n    margin: 0;\n}\n\n.panel {\n    margin-bottom: 20px;\n    background-color: var(--ee-panel-bg);\n    border: 1px solid var(--ee-panel-border);\n    border-radius: 6px;\n}\n.redirect {\n	max-width: 700px;\n	min-width: 350px;\n    position: absolute;\n    top: 50%;\n    left: 50%;\n    transform: translate(-50%,-50%);\n}\n\n.panel-heading {\n    padding: 20px 25px;\n    position: relative;\n}\n\n.panel-body {\n    padding: 20px 25px;\n}\n\n.panel-body:after, .panel-body:before {\n    content: \" \";\n    display: table;\n}\n\n.redirect p {\n    margin-bottom: 20px;\n}\np {\n    line-height: 1.6;\n}\na, blockquote, code, h1, h2, h3, h4, h5, h6, ol, p, pre, ul {\n    color: inherit;\n    margin: 0;\n    padding: 0;\n    font-weight: inherit;\n}\n\na {\n    color: var(--ee-link);\n    text-decoration: none;\n    -webkit-transition: color .15s ease-in-out;\n    -moz-transition: color .15s ease-in-out;\n    -o-transition: color .15s ease-in-out;\n}\n\na:hover {\n    color: var(--ee-link-hover);\n}\n\nh3 {\n    font-size: 1.35em;\n    font-weight: 500;\n}\n\nol, ul {\n    padding-left: 0;\n}\n\nol li, ul li {\n    list-style-position: inside;\n}\n\n.panel-footer {\n    padding: 20px 25px;\n    position: relative;\n}\n\n\n        </style>\n    </head>\n    <body>\n        <section class=\"flex-wrap\">\n            <section class=\"wrap\">\n                <div class=\"panel redirect\">\n                    <div class=\"panel-heading\">\n                        <h3>{heading}</h3>\n                    </div>\n                    <div class=\"panel-body\">\n                        {content}\n\n\n                    </div>\n                    <div class=\"panel-footer\">\n                        {link}\n                    </div>\n                </div>\n            </section>\n        </section>\n    </body>\n</html>',NULL,1720033133,0),
	(3,1,'y','post_install_message_template','','system',NULL,'<!doctype html>\n<html>\n	<head>\n		<title>Welcome to ExpressionEngine!</title>\n		<meta http-equiv=\"content-type\" content=\"text/html; charset=utf-8\" lang=\"en-us\" dir=\"ltr\">\n		<meta content=\"width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no\"  name=\"viewport\">\n		<link href=\"{theme_folder_url}cp/css/common.min.css\" rel=\"stylesheet\">\n			</head>\n	<body class=\"installer-page\">\n		<section class=\"flex-wrap\">\n			<section class=\"wrap\">\n				<div class=\"login__logo\">\n  <svg width=\"281px\" height=\"36px\" viewBox=\"0 0 281 36\" version=\"1.1\" xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\">\n  <title>ExpressionEngine</title>\n  <defs>\n      <polygon id=\"path-1\" points=\"0.3862 0.1747 18.6557 0.1747 18.6557 21.5 0.3862 21.5\"></polygon>\n      <polygon id=\"path-3\" points=\"0.3926 0.17455 13.9915 0.17455 13.9915 15.43755 0.3926 15.43755\"></polygon>\n      <polygon id=\"path-5\" points=\"0 0.06905 25.8202 0.06905 25.8202 31.6178513 0 31.6178513\"></polygon>\n      <polygon id=\"path-7\" points=\"0.10635 0.204 25.9268587 0.204 25.9268587 31.7517 0.10635 31.7517\"></polygon>\n  </defs>\n  <g id=\"logo\" stroke=\"none\" stroke-width=\"1\" fill=\"none\" fill-rule=\"evenodd\">\n      <g id=\"expressionengine\">\n          <path d=\"M92.88015,27.0665 L89.28865,20.955 L94.66665,14.6405 L94.77265,13.9 L91.11315,13.9 L87.86765,17.95 C87.76015,18.0845 87.57265,18.353 87.30415,19.2645 C87.33065,18.353 87.14315,18.0845 87.08965,17.9775 L84.80915,13.9 L80.59815,13.9 L84.62115,20.8475 L78.21065,28.3045 L82.42165,28.3045 L86.04315,23.905 C86.23065,23.664 86.52565,23.154 86.66065,22.5915 C86.66065,23.154 86.79465,23.6905 86.92865,23.905 L89.42265,28.3045 L92.70265,28.3045 L92.88015,27.0665 Z\" id=\"Fill-1\"></path>\n          <path d=\"M80.2395,11.9686 L70.9585,11.9686 L70.288,16.6091 L78.7645,16.6091 L77.4495,19.6141 L69.751,19.6141 C69.805,19.8011 69.805,20.0156 69.778,20.1231 L69.027,25.3011 L78.3345,25.3011 L77.9055,28.3046 L65.003,28.3046 L67.7925,8.9651 L80.6685,8.9651 L80.2395,11.9686 Z\" id=\"Fill-3\"></path>\n          <path d=\"M102.3328,16.20735 C101.5283,16.20735 100.5628,16.34085 99.3558,17.11935 L98.1493,25.46185 C98.8998,25.83735 99.9723,25.99835 100.8848,25.99835 C103.0573,25.99835 104.2378,24.60235 104.7478,20.98085 C104.8548,20.28385 104.9083,19.69385 104.9083,19.18485 C104.9083,17.03835 104.0508,16.20735 102.3328,16.20735 M108.3418,20.98085 C107.6718,25.70235 105.5783,28.73385 100.5093,28.73385 C99.5708,28.73385 98.4978,28.54635 97.5313,28.08985 C97.6128,28.38435 97.6933,28.73385 97.6393,29.02935 L96.8073,34.79585 L93.2133,34.79585 L96.2178,13.89985 L98.7928,13.89985 L99.0878,15.08085 C100.3213,14.00685 101.7703,13.47035 103.1113,13.47035 C106.9473,13.47035 108.5023,15.69685 108.5023,19.05035 C108.5023,19.66735 108.4483,20.31135 108.3418,20.98085\" id=\"Fill-5\"></path>\n          <path d=\"M119.33865,16.69 C118.74815,16.609 118.13215,16.555 117.48715,16.555 C116.46815,16.555 115.39515,16.716 114.45615,17.28 L112.87415,28.3045 L109.27965,28.3045 L111.34515,13.8995 L114.29515,13.8995 L114.51115,15.0535 C115.71715,13.8995 116.92465,13.4705 118.21215,13.4705 C118.72265,13.4705 119.25865,13.5515 119.79515,13.659 L119.33865,16.69 Z\" id=\"Fill-7\"></path>\n          <path d=\"M127.43385,16.31455 C125.39585,16.31455 124.40285,17.09155 123.81285,19.61405 L129.71435,19.61405 C129.76785,19.29205 129.79435,18.99655 129.79435,18.72855 C129.79435,17.14555 129.01685,16.31455 127.43385,16.31455 M133.03985,22.13505 L123.35635,22.13505 C123.30235,22.56405 123.27685,22.93955 123.27685,23.28855 C123.27685,25.05905 124.08085,25.89105 126.06585,25.89105 C127.91685,25.89105 128.96335,25.08605 129.74035,23.90505 L132.44985,25.00505 C131.18885,27.41855 128.82885,28.73355 125.66385,28.73355 C121.58635,28.73355 119.73535,26.56055 119.73535,22.93955 C119.73535,22.34955 119.78885,21.73305 119.86985,21.08855 C120.64685,15.80405 122.95485,13.47055 127.86285,13.47055 C132.31635,13.47055 133.33585,16.60905 133.33585,19.29205 C133.33585,20.09655 133.17435,21.16955 133.03985,22.13505\" id=\"Fill-9\"></path>\n          <path d=\"M144.11795,17.70905 C143.60895,16.79705 142.66995,16.28705 141.19395,16.28705 C140.04145,16.28705 138.64595,16.52905 138.64595,17.97755 C138.64595,18.48755 138.88745,18.91655 139.53145,19.02405 L142.64245,19.58655 C144.60095,19.93605 146.20995,21.03455 146.20995,23.12755 C146.20995,27.23155 142.80295,28.73355 139.23545,28.73355 C136.71445,28.73355 134.73045,27.87555 133.76445,25.62255 L136.76845,24.52255 C137.33245,25.54155 138.24395,25.99805 139.61245,25.99805 C140.95345,25.99805 142.61595,25.59505 142.61595,23.93255 C142.61595,23.34255 142.34795,22.91355 141.56945,22.77855 L138.21645,22.16255 C136.66095,21.86655 135.13145,20.68655 135.13145,18.46005 C135.13145,14.65055 138.27045,13.47055 141.59695,13.47055 C144.57445,13.47055 146.20995,14.67805 146.93445,16.39455 L144.11795,17.70905 Z\" id=\"Fill-11\"></path>\n          <path d=\"M157.28835,17.70905 C156.77935,16.79705 155.84135,16.28705 154.36435,16.28705 C153.21235,16.28705 151.81785,16.52905 151.81785,17.97755 C151.81785,18.48755 152.05935,18.91655 152.70335,19.02405 L155.81435,19.58655 C157.77285,19.93605 159.38185,21.03455 159.38185,23.12755 C159.38185,27.23155 155.97385,28.73355 152.40635,28.73355 C149.88635,28.73355 147.90085,27.87555 146.93585,25.62255 L149.93885,24.52255 C150.50285,25.54155 151.41585,25.99805 152.78285,25.99805 C154.12535,25.99805 155.78685,25.59505 155.78685,23.93255 C155.78685,23.34255 155.51985,22.91355 154.74135,22.77855 L151.38835,22.16255 C149.83185,21.86655 148.30235,20.68655 148.30235,18.46005 C148.30235,14.65055 151.44085,13.47055 154.76885,13.47055 C157.74485,13.47055 159.38185,14.67805 160.10535,16.39455 L157.28835,17.70905 Z\" id=\"Fill-13\"></path>\n          <path d=\"M168.0188,11.0294 C167.9908,11.2714 167.9908,11.2714 167.7768,11.2714 L164.2888,11.2714 C164.0743,11.2714 164.0743,11.2714 164.1018,11.0294 L164.5858,7.7039 C164.6108,7.4359 164.6108,7.4084 164.8253,7.4084 L168.3133,7.4084 C168.5278,7.4084 168.5278,7.4359 168.5003,7.7039 L168.0188,11.0294 Z M167.2953,28.5464 L165.4688,28.5464 C163.3783,28.5464 162.3583,27.6334 162.3583,25.7564 C162.3583,25.4619 162.3853,25.1659 162.4378,24.8169 L163.5128,17.3874 C163.5378,17.1729 163.6728,16.8509 163.8873,16.6089 L161.2853,16.6089 L161.6618,13.8999 L167.5898,13.8999 L166.0328,24.8169 C166.0083,24.9514 166.0083,25.0864 166.0083,25.1934 C166.0083,25.5154 166.1398,25.6229 166.5443,25.6229 L167.6968,25.6229 L167.2953,28.5464 Z\" id=\"Fill-15\"></path>\n          <path d=\"M176.8977,16.31455 C174.6972,16.31455 173.6242,17.44105 173.0882,21.08855 C172.9807,21.81305 172.9262,22.45705 172.9262,22.99305 C172.9262,25.16605 173.7837,25.89105 175.5282,25.89105 C177.7007,25.89105 178.8562,24.76305 179.3922,21.08855 C179.4997,20.39105 179.5522,19.77455 179.5522,19.23855 C179.5522,17.03805 178.6662,16.31455 176.8977,16.31455 M182.9852,21.08855 C182.2617,26.07805 180.0887,28.73355 175.1262,28.73355 C170.8872,28.73355 169.3582,26.13155 169.3582,22.85955 C169.3582,22.29555 169.4132,21.67955 169.4927,21.08855 C170.2167,16.01905 172.3647,13.47055 177.3267,13.47055 C181.5377,13.47055 183.1197,15.93905 183.1197,19.26455 C183.1197,19.85455 183.0672,20.44455 182.9852,21.08855\" id=\"Fill-17\"></path>\n          <path d=\"M197.21265,19.23835 L195.89815,28.30435 L192.33015,28.30435 L193.64515,19.23835 C193.70015,18.91635 193.72465,18.59485 193.72465,18.29935 C193.72465,17.06535 193.24365,16.26085 191.90115,16.26085 C190.80115,16.26085 189.51415,16.87685 188.46865,17.52085 L186.91165,28.30435 L183.34415,28.30435 L185.41015,13.89985 L188.36115,13.89985 L188.60315,15.21435 C190.26465,13.89985 191.60665,13.47035 193.10865,13.47035 C196.11265,13.47035 197.32015,15.37535 197.32015,17.92385 C197.32015,18.35285 197.26715,18.78185 197.21265,19.23835\" id=\"Fill-19\"></path>\n          <path d=\"M214.45925,11.9686 L205.17825,11.9686 L204.51025,16.6091 L212.98475,16.6091 L211.67025,19.6141 L203.97075,19.6141 C204.02625,19.8011 204.02625,20.0156 203.99875,20.1231 L203.24775,25.3011 L212.55525,25.3011 L212.12675,28.3046 L199.22325,28.3046 L202.01525,8.9651 L214.89075,8.9651 L214.45925,11.9686 Z\" id=\"Fill-21\"></path>\n          <path d=\"M227.8411,19.23835 L226.5266,28.30435 L222.9586,28.30435 L224.2736,19.23835 C224.3261,18.91635 224.3531,18.59485 224.3531,18.29935 C224.3531,17.06535 223.8696,16.26085 222.5301,16.26085 C221.4296,16.26085 220.1426,16.87685 219.0946,17.52085 L217.5401,28.30435 L213.9726,28.30435 L216.0386,13.89985 L218.9871,13.89985 L219.2291,15.21435 C220.8931,13.89985 222.2331,13.47035 223.7371,13.47035 C226.7411,13.47035 227.9486,15.37535 227.9486,17.92385 C227.9486,18.35285 227.8936,18.78185 227.8411,19.23835\" id=\"Fill-23\"></path>\n          <g id=\"Group-27\" transform=\"translate(227.500000, 13.296000)\">\n              <mask id=\"mask-2\" fill=\"white\">\n                  <use xlink:href=\"#path-1\"></use>\n              </mask>\n              <g id=\"Clip-26\"></g>\n              <path d=\"M9.7742,2.9912 C7.7607,2.9912 6.6082,4.1452 6.6082,6.1297 C6.6082,7.4702 7.4667,8.0342 9.0232,8.0342 C11.0342,8.0342 12.1612,6.9617 12.1612,4.9772 C12.1612,3.6622 11.3832,2.9912 9.7742,2.9912 L9.7742,2.9912 Z M10.1207,15.0622 L5.0787,14.1227 C4.2757,14.9812 3.9262,15.5447 3.9262,16.7522 C3.9262,18.1197 4.8917,18.7372 7.4667,18.7372 C9.1557,18.7372 11.4907,18.4687 11.4907,16.2957 C11.4907,15.6262 11.1412,15.2507 10.1207,15.0622 L10.1207,15.0622 Z M18.3312,3.3132 L16.5872,3.3132 C16.3457,3.3132 15.7542,3.2867 15.3002,3.0722 C15.5672,3.7157 15.6742,4.4392 15.6742,5.0307 C15.6742,9.2142 12.3482,10.8237 8.6187,10.8237 C7.7882,10.8237 6.9852,10.7437 6.2862,10.5827 C6.1792,10.5552 6.0717,10.5292 5.9372,10.5292 C5.5352,10.5292 5.2932,10.7437 5.2932,11.1452 C5.2932,11.4137 5.4282,11.6017 6.0167,11.7092 L11.1962,12.6747 C14.0652,13.2112 15.0577,14.4447 15.0577,16.0277 C15.0577,20.6682 10.7122,21.5002 7.0647,21.5002 C4.1682,21.5002 0.3862,20.7217 0.3862,17.1002 C0.3862,15.2232 1.3767,13.6142 2.9857,12.6482 C2.6637,12.2457 2.5042,11.7902 2.5042,11.3597 C2.5042,10.3947 3.2007,9.6437 4.0062,9.2142 C3.4972,8.5707 3.0682,7.5517 3.0682,6.3717 C3.0682,2.1602 6.3387,0.1747 10.1757,0.1747 C11.5177,0.1747 12.9372,0.4167 13.9852,1.0862 L16.0537,0.6212 L18.6557,0.6212 L18.3312,3.3132 Z\" id=\"Fill-25\" mask=\"url(#mask-2)\"></path>\n          </g>\n          <path d=\"M251.54175,11.0294 C251.51675,11.2714 251.51675,11.2714 251.30225,11.2714 L247.81475,11.2714 C247.59975,11.2714 247.59975,11.2714 247.62725,11.0294 L248.10925,7.7039 C248.13625,7.4359 248.13625,7.4084 248.35075,7.4084 L251.83875,7.4084 C252.05275,7.4084 252.05275,7.4359 252.02575,7.7039 L251.54175,11.0294 Z M250.81825,28.5464 L248.99425,28.5464 C246.90175,28.5464 245.88375,27.6334 245.88375,25.7564 C245.88375,25.4619 245.91075,25.1659 245.96375,24.8169 L247.03575,17.3874 C247.06375,17.1729 247.19825,16.8509 247.41275,16.6089 L244.81075,16.6089 L245.18475,13.8999 L251.11275,13.8999 L249.55825,24.8169 C249.53125,24.9514 249.53125,25.0864 249.53125,25.1934 C249.53125,25.5154 249.66575,25.6229 250.06725,25.6229 L251.21975,25.6229 L250.81825,28.5464 Z\" id=\"Fill-28\"></path>\n          <path d=\"M266.32595,19.23835 L265.01095,28.30435 L261.44345,28.30435 L262.75845,19.23835 C262.81345,18.91635 262.83795,18.59485 262.83795,18.29935 C262.83795,17.06535 262.35695,16.26085 261.01445,16.26085 C259.91445,16.26085 258.62695,16.87685 257.58195,17.52085 L256.02445,28.30435 L252.45745,28.30435 L254.52345,13.89985 L257.47445,13.89985 L257.71645,15.21435 C259.37795,13.89985 260.71995,13.47035 262.22195,13.47035 C265.22595,13.47035 266.43345,15.37535 266.43345,17.92385 C266.43345,18.35285 266.38045,18.78185 266.32595,19.23835\" id=\"Fill-30\"></path>\n          <g id=\"Group-34\" transform=\"translate(267.000000, 13.296000)\">\n              <mask id=\"mask-4\" fill=\"white\">\n                  <use xlink:href=\"#path-3\"></use>\n              </mask>\n              <g id=\"Clip-33\"></g>\n              <path d=\"M8.0916,3.01855 C6.0531,3.01855 5.0606,3.79555 4.4691,6.31805 L10.3716,6.31805 C10.4241,5.99605 10.4516,5.70055 10.4516,5.43255 C10.4516,3.84955 9.6731,3.01855 8.0916,3.01855 M13.6971,8.83905 L4.0126,8.83905 C3.9596,9.26805 3.9326,9.64355 3.9326,9.99255 C3.9326,11.76305 4.7381,12.59505 6.7216,12.59505 C8.5731,12.59505 9.6211,11.79005 10.3961,10.60905 L13.1056,11.70905 C11.8461,14.12255 9.4861,15.43755 6.3201,15.43755 C2.2436,15.43755 0.3926,13.26455 0.3926,9.64355 C0.3926,9.05355 0.4446,8.43705 0.5271,7.79255 C1.3031,2.50805 3.6106,0.17455 8.5201,0.17455 C12.9736,0.17455 13.9916,3.31305 13.9916,5.99605 C13.9916,6.80055 13.8316,7.87355 13.6971,8.83905\" id=\"Fill-32\" mask=\"url(#mask-4)\"></path>\n          </g>\n          <path d=\"M20.60205,17.64605 C21.11355,14.75605 22.01655,12.45255 23.28405,10.79305 C24.18105,9.60555 25.17405,9.00405 26.23755,9.00405 C26.80055,9.00405 27.27705,9.22055 27.65305,9.64955 C28.01805,10.06905 28.20405,10.64605 28.20405,11.36305 C28.20405,13.02405 27.45705,14.53555 25.98455,15.86155 C24.91705,16.81355 23.20305,17.51055 20.89205,17.93305 L20.53855,17.99805 L20.60205,17.64605 Z M30.67305,21.68355 C29.37505,22.92855 28.23905,23.80705 27.31805,24.24655 C26.34905,24.70655 25.34805,24.93855 24.34355,24.93855 C23.11755,24.93855 22.12155,24.54805 21.38655,23.77655 C20.65105,23.00705 20.27805,21.90355 20.27805,20.49455 L20.37305,19.08355 L20.56855,19.05005 C24.00755,18.47005 26.60155,17.80655 28.27555,17.07555 C29.93155,16.35405 31.14005,15.49505 31.86855,14.52405 C32.59155,13.56105 32.95655,12.59155 32.95655,11.65055 C32.95655,10.50805 32.52355,9.59355 31.63105,8.84705 C30.73555,8.10155 29.44355,7.72455 27.79455,7.72455 C25.50305,7.72455 23.33455,8.25905 21.34955,9.31405 C19.36805,10.36805 17.78305,11.82905 16.64005,13.65605 C15.50005,15.48105 14.92155,17.41555 14.92155,19.40105 C14.92155,21.61755 15.60505,23.39505 16.95205,24.68005 C18.30455,25.96905 20.19355,26.62005 22.56705,26.62005 C24.25255,26.62005 25.84755,26.28155 27.30805,25.61355 C28.70455,24.97455 30.14905,23.86705 31.60805,22.37255 C31.33005,22.16805 30.87005,21.82855 30.67305,21.68355 L30.67305,21.68355 Z\" id=\"Fill-35\"></path>\n          <g id=\"Group-39\" transform=\"translate(0.000000, 2.796000)\">\n              <mask id=\"mask-6\" fill=\"white\">\n                  <use xlink:href=\"#path-5\"></use>\n              </mask>\n              <g id=\"Clip-38\"></g>\n              <path d=\"M7.2737,19.35005 C5.3202,11.70605 9.9462,3.71505 17.8897,0.06905 C17.6907,0.14055 17.5042,0.22255 17.3077,0.29605 C17.5087,0.20005 17.6882,0.11955 17.8272,0.07205 L2.9432,3.91255 L6.9112,6.26005 C1.7147,10.66105 -0.9663,16.11555 0.3187,21.14505 C2.3302,29.02005 13.3457,33.12605 25.8202,31.10805 C17.1117,31.75655 9.2257,26.99355 7.2737,19.35005\" id=\"Fill-37\" mask=\"url(#mask-6)\"></path>\n          </g>\n          <g id=\"Group-42\" transform=\"translate(23.500000, 0.296000)\">\n              <mask id=\"mask-8\" fill=\"white\">\n                  <use xlink:href=\"#path-7\"></use>\n              </mask>\n              <g id=\"Clip-41\"></g>\n              <path d=\"M18.65285,12.4697 C20.60635,20.1147 15.98135,28.1052 8.03735,31.7517 C8.23585,31.6797 8.42235,31.5977 8.61885,31.5232 C8.41785,31.6212 8.23835,31.7002 8.09935,31.7482 L22.98335,27.9087 L19.01585,25.5612 C24.21185,21.1597 26.89285,15.7042 25.60835,10.6747 C23.59635,2.8027 12.58085,-1.3053 0.10635,0.7142 C8.81435,0.0637 16.70135,4.8267 18.65285,12.4697\" id=\"Fill-40\" mask=\"url(#mask-8)\"></path>\n          </g>\n      </g>\n    </g>\n  </svg>\n</div>\n				<div class=\"panel warn\">\n  <div class=\"panel-heading\" style=\"text-align: center;\">\n    <h3>ExpressionEngine has been installed!</h3>\n  </div>\n  <div class=\"panel-body\">\n    <div class=\"updater-msg\">\n  		<p style=\"margin-bottom: 20px;\">If you see this message, then everything went well.</p>\n\n  		<div class=\"alert alert--attention\">\n            <div class=\"alert__icon\">\n              <i class=\"fal fa-info-circle fa-fw\"></i>\n            </div>\n            <div class=\"alert__content\">\n    			<p>If you are site owner, please login into your Control Panel and create your first template.</p>\n    		</div>\n  		</div>\n  		<div class=\"alert alert--attention\">\n            <div class=\"alert__icon\">\n              <i class=\"fal fa-info-circle fa-fw\"></i>\n            </div>\n            <div class=\"alert__content\">\n    			<p>If this is your first time using ExpressionEngine CMS, make sure to <a href=\"https://docs.expressionengine.com/latest/getting-started/the-big-picture.html\">check out the documentation</a> to get started.</p>\n    		</div>\n  		</div>\n  	</div>\n  </div>\n  <div class=\"panel-footer\">\n\n  </div>\n</div>\n			</div>\n			<section class=\"bar\">\n				<p style=\"float: left;\"><a href=\"https://expressionengine.com/\" rel=\"external\"><b>ExpressionEngine</b></a></p>\n				<p style=\"float: right;\">&copy;2023 <a href=\"https://packettide.com/\" rel=\"external\">Packet Tide</a>, LLC</p>\n			</section>\n		</section>\n\n	</body>\n</html>',NULL,1720033133,0),
	(4,1,'y','mfa_template','','system',NULL,'<!doctype html>\n        <html dir=\"ltr\">\n            <head>\n                <title>{title}</title>\n                <meta http-equiv=\"content-type\" content=\"text/html; charset={charset}\">\n                <meta content=\"width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no\"  name=\"viewport\">\n                <meta name=\"referrer\" content=\"no-referrer\">\n                {meta_refresh}\n                <style type=\"text/css\">\n        :root, body {\n            --ee-panel-bg: #fff;\n            --ee-panel-border: #dfe0ef;\n            --ee-text-normal: #0d0d19;\n            --ee-text-secondary: #8f90b0;\n            --ee-main-bg: #f7f7fb;\n            --ee-link: #5D63F1;\n            --ee-link-hover: #171feb;\n            --ee-bg-blank: #fff;\n            --ee-code-border: #dfe0ef;\n\n            --ee-input-color: #0d0d19;\n            --ee-input-bg: #fff;\n            --ee-input-placeholder: #adaec5;\n            --ee-input-border: #cbcbda;\n            --ee-input-border-accent: #ecedf5;\n            --ee-input-focus-border: #5D63F1;\n            --ee-input-focus-shadow: 0 3px 6px -3px rgba(174,151,255,0.14),0 5px 10px -3px rgba(97,114,242,0.05);\n            --ee-button-primary-color: #fff;\n            --ee-button-primary-bg: #5D63F1;\n            --ee-button-primary-border: #5D63F1;\n\n            --ee-bg-0: #f7f7fb;\n            --ee-border: #dfe0ef;\n            --ee-error: #FA5252;\n            --ee-error-light: #fee7e7;\n            --ee-warning: #FFB40B;\n            --ee-warning-light: #fff6e1;\n        }\n\n        @font-face{font-family:Roboto;font-style:normal;font-weight:400;src:url({url_themes}webfonts/roboto-v20-latin-regular.eot);src:local(\"Roboto\"),local(\"Roboto-Regular\"),url({url_themes}webfonts/roboto-v20-latin-regular.eot?#iefix) format(\"embedded-opentype\"),url({url_themes}webfonts/roboto-v20-latin-regular.woff2) format(\"woff2\"),url({url_themes}webfonts/roboto-v20-latin-regular.woff) format(\"woff\"),url({url_themes}webfonts/roboto-v20-latin-regular.ttf) format(\"truetype\"),url({url_themes}webfonts/roboto-v20-latin-regular.svg#Roboto) format(\"svg\")}@font-face{font-family:Roboto;font-style:italic;font-weight:400;src:url({url_themes}webfonts/roboto-v20-latin-italic.eot);src:local(\"Roboto Italic\"),local(\"Roboto-Italic\"),url({url_themes}webfonts/roboto-v20-latin-italic.eot?#iefix) format(\"embedded-opentype\"),url({url_themes}webfonts/roboto-v20-latin-italic.woff2) format(\"woff2\"),url({url_themes}webfonts/roboto-v20-latin-italic.woff) format(\"woff\"),url({url_themes}webfonts/roboto-v20-latin-italic.ttf) format(\"truetype\"),url({url_themes}webfonts/roboto-v20-latin-italic.svg#Roboto) format(\"svg\")}@font-face{font-family:Roboto;font-style:normal;font-weight:500;src:url({url_themes}webfonts/roboto-v20-latin-500.eot);src:local(\"Roboto Medium\"),local(\"Roboto-Medium\"),url({url_themes}webfonts/roboto-v20-latin-500.eot?#iefix) format(\"embedded-opentype\"),url({url_themes}webfonts/roboto-v20-latin-500.woff2) format(\"woff2\"),url({url_themes}webfonts/roboto-v20-latin-500.woff) format(\"woff\"),url({url_themes}webfonts/roboto-v20-latin-500.ttf) format(\"truetype\"),url({url_themes}webfonts/roboto-v20-latin-500.svg#Roboto) format(\"svg\")}@font-face{font-family:Roboto;font-style:italic;font-weight:500;src:url({url_themes}webfonts/roboto-v20-latin-500italic.eot);src:local(\"Roboto Medium Italic\"),local(\"Roboto-MediumItalic\"),url({url_themes}webfonts/roboto-v20-latin-500italic.eot?#iefix) format(\"embedded-opentype\"),url({url_themes}webfonts/roboto-v20-latin-500italic.woff2) format(\"woff2\"),url({url_themes}webfonts/roboto-v20-latin-500italic.woff) format(\"woff\"),url({url_themes}webfonts/roboto-v20-latin-500italic.ttf) format(\"truetype\"),url({url_themes}webfonts/roboto-v20-latin-500italic.svg#Roboto) format(\"svg\")}@font-face{font-family:Roboto;font-style:normal;font-weight:700;src:url({url_themes}webfonts/roboto-v20-latin-700.eot);src:local(\"Roboto Bold\"),local(\"Roboto-Bold\"),url({url_themes}webfonts/roboto-v20-latin-700.eot?#iefix) format(\"embedded-opentype\"),url({url_themes}webfonts/roboto-v20-latin-700.woff2) format(\"woff2\"),url({url_themes}webfonts/roboto-v20-latin-700.woff) format(\"woff\"),url({url_themes}webfonts/roboto-v20-latin-700.ttf) format(\"truetype\"),url({url_themes}webfonts/roboto-v20-latin-700.svg#Roboto) format(\"svg\")}@font-face{font-family:Roboto;font-style:italic;font-weight:700;src:url({url_themes}webfonts/roboto-v20-latin-700italic.eot);src:local(\"Roboto Bold Italic\"),local(\"Roboto-BoldItalic\"),url({url_themes}webfonts/roboto-v20-latin-700italic.eot?#iefix) format(\"embedded-opentype\"),url({url_themes}webfonts/roboto-v20-latin-700italic.woff2) format(\"woff2\"),url({url_themes}webfonts/roboto-v20-latin-700italic.woff) format(\"woff\"),url({url_themes}webfonts/roboto-v20-latin-700italic.ttf) format(\"truetype\"),url({url_themes}webfonts/roboto-v20-latin-700italic.svg#Roboto) format(\"svg\")}\n        @font-face{font-family:\'Font Awesome 5 Free\';font-style:normal;font-weight:900;font-display:auto;src:url({url_themes}webfonts/fa-solid-900.eot);src:url({url_themes}webfonts/fa-solid-900.eot?#iefix) format(\"embedded-opentype\"),url({url_themes}webfonts/fa-solid-900.woff2) format(\"woff2\"),url({url_themes}webfonts/fa-solid-900.woff) format(\"woff\"),url({url_themes}webfonts/fa-solid-900.ttf) format(\"truetype\"),url({url_themes}webfonts/fa-solid-900.svg#fontawesome) format(\"svg\")}\n\n        *, :after, :before {\n            box-sizing: inherit;\n        }\n\n        html {\n            box-sizing: border-box;\n            font-size: 15px;\n            height: 100%;\n            line-height: 1.15;\n        }\n\n        body {\n            font-family: -apple-system, BlinkMacSystemFont, segoe ui, helvetica neue, helvetica, Cantarell, Ubuntu, roboto, noto, arial, sans-serif;\n            height: 100%;\n            font-size: 1rem;\n            line-height: 1.6;\n            color: var(--ee-text-normal);\n            background: var(--ee-main-bg);\n            -webkit-font-smoothing: antialiased;\n            margin: 0;\n        }\n\n        .panel {\n            margin-bottom: 20px;\n            background-color: var(--ee-panel-bg);\n            border: 1px solid var(--ee-panel-border);\n            border-radius: 6px;\n        }\n        .redirect {\n            max-width: 700px;\n            min-width: 350px;\n            position: absolute;\n            left: 50%;\n            top: 0;\n            transform: translate(-50%);\n            height: 100vh;\n            overflow-y: auto;\n            background: transparent;\n            border: none;\n            border-radius: 0;\n            display: flex;\n        }\n\n        .redirect-inner {\n          background-color: var(--ee-panel-bg);\n          border: 1px solid var(--ee-panel-border);\n          border-radius: 6px;\n          height: auto;\n          margin-top: auto;\n          margin-bottom: auto;\n        }\n\n        .redirect-inner .qr-code-wrap {\n            text-align: center;\n        }\n\n        .panel-heading {\n            padding: 20px 25px;\n            position: relative;\n        }\n\n        .panel-body {\n            padding: 20px 25px;\n        }\n\n        .panel-body:after, .panel-body:before {\n            content: \" \";\n            display: table;\n        }\n\n        .redirect p {\n            margin-bottom: 20px;\n        }\n        p {\n            line-height: 1.6;\n        }\n        a, blockquote, code, h1, h2, h3, h4, h5, h6, ol, p, pre, ul {\n            color: inherit;\n            margin: 0;\n            padding: 0;\n            font-weight: inherit;\n        }\n\n        code {\n            font-size: inherit;\n            margin: 0 2px;\n            padding: 3px 6px;\n            border-radius: 5px;\n            border: 1px solid var(--ee-code-border);\n            background-color: var(--ee-bg-blank);\n            font-size: .96em;\n            white-space: normal;\n        }\n\n        a {\n            color: var(--ee-link);\n            text-decoration: none;\n            -webkit-transition: color .15s ease-in-out;\n            -moz-transition: color .15s ease-in-out;\n            -o-transition: color .15s ease-in-out;\n        }\n\n        a:hover {\n            color: var(--ee-link-hover);\n        }\n\n        h3 {\n            font-size: 1.35em;\n            font-weight: 500;\n        }\n\n        ol, ul {\n            padding-left: 0;\n        }\n\n        ol li, ul li {\n            list-style-position: inside;\n        }\n\n        .panel-footer {\n            padding: 20px 25px;\n            position: relative;\n        }\n\n        fieldset {\n            margin: 0;\n            padding: 0;\n            margin-bottom: 20px;\n            border: 0;\n        }\n\n        fieldset.last {\n            margin-bottom: 0;\n        }\n\n        .field-instruct {\n            margin-bottom: 5px;\n        }\n\n        .field-instruct label {\n            display: block;\n            color: var(--ee-text-normal);\n            margin-bottom: 5px;\n            font-weight: 500;\n        }\n\n        .field-instruct :last-child {\n            margin-bottom: 0;\n        }\n\n        .field-instruct em {\n            color: var(--ee-text-secondary);\n            display: block;\n            font-size: .8rem;\n            font-style: normal;\n            margin-bottom: 10px;\n        }\n\n        .field-instruct label+em {\n            margin-top: -5px;\n        }\n\n        button, input, optgroup, select, textarea {\n            font-family: inherit;\n            font-size: 100%;\n            line-height: 1.15;\n            margin: 0;\n        }\n\n        input[type=text], input[type=password] {\n            display: block;\n            width: 100%;\n            padding: 8px 15px;\n            font-size: 1rem;\n            line-height: 1.6;\n            color: var(--ee-input-color);\n            background-color: var(--ee-input-bg);\n            background-image: none;\n            transition: border-color .2s ease,box-shadow .2s ease;\n            -webkit-appearance: none;\n            border: 1px solid var(--ee-input-border);\n            border-radius: 5px;\n        }\n\n        input[type=text]:focus, input[type=password]:focus {\n            border-color: var(--ee-input-focus-border);\n        }\n\n        input:focus {\n            outline: 0;\n        }\n\n        .button {\n            -webkit-appearance: none;\n            display: inline-block;\n            font-weight: 500;\n            text-align: center;\n            vertical-align: middle;\n            touch-action: manipulation;\n            background-image: none;\n            cursor: pointer;\n            border: 1px solid transparent;\n            white-space: nowrap;\n            -webkit-transition: background-color .15s ease-in-out;\n            -moz-transition: background-color .15s ease-in-out;\n            -o-transition: background-color .15s ease-in-out;\n            -webkit-user-select: none;\n            -moz-user-select: none;\n            -ms-user-select: none;\n            user-select: none;\n            padding: 8px 20px!important;\n            font-size: 1rem;\n            line-height: 1.6;\n            border-radius: 5px;\n        }\n\n        .button--wide {\n            display: block;\n            width: 100%;\n        }\n\n        .button--large {\n            padding: 10px 25px!important;\n            font-size: 1.2rem;\n            line-height: 1.7;\n            border-radius: 6px;\n        }\n\n        .button--primary {\n            color: var(--ee-button-primary-color);\n            background-color: var(--ee-button-primary-bg);\n            border-color: var(--ee-button-primary-border);\n        }\n\n        .button.disabled {\n            cursor: not-allowed;\n            opacity: .55;\n            box-shadow: none;\n        }\n\n        .app-notice {\n            border: 1px solid var(--ee-border);\n            overflow: hidden;\n            background-color: var(--ee-bg-0);\n            border-radius: 5px;\n            display: flex;\n            margin-bottom: 20px;\n        }\n\n        .app-notice---error {\n            border-color: var(--ee-error);\n            background-color: var(--ee-error-light);\n        }\n\n        .app-notice---error .app-notice__tag {\n            color: var(--ee-error);\n        }\n\n        .app-notice---important {\n            border-color: var(--ee-warning);\n            background-color: var(--ee-warning-light);\n        }\n\n        .app-notice---important .app-notice__tag {\n            color: var(--ee-warning);\n        }\n\n        .app-notice__tag {\n            padding: 15px 20px;\n            display: flex;\n            align-items: center;\n            justify-content: center;\n            font-size: 16px;\n        }\n\n        .app-notice__icon {\n            position: relative;\n        }\n\n        .app-notice__icon::before {\n            font-family: \'Font Awesome 5 Free\';\n            font-weight: 900;\n            content: \"\\\\f06a\";\n            position: relative;\n            z-index: 2;\n        }\n\n        .app-notice---error .app-notice__icon::after {\n            background: var(--ee-error-light);\n        }\n\n        .app-notice__tag+.app-notice__content {\n            padding-left: 0;\n        }\n\n        .app-notice__content {\n            flex: 1 1;\n            padding: 15px 20px;\n        }\n\n        .app-notice__content p {\n            margin: 0;\n            color: var(--ee-text-primary);\n            opacity: .6;\n        }\n\n                </style>\n            </head>\n            <body>\n                <section class=\"flex-wrap\">\n                    <section class=\"wrap\">\n                        <div class=\"panel redirect\">\n                            <div class=\"redirect-inner\">\n                                <div class=\"panel-heading\">\n                                    <h3>{heading}</h3>\n                                </div>\n                                <div class=\"panel-body\">\n                                    {content}\n                                </div>\n                                <div class=\"panel-footer\">\n                                    {link}\n                                </div>\n                            </div>\n                        </div>\n                    </section>\n                </section>\n            </body>\n        </html>',NULL,1720033133,0),
	(5,1,'y','admin_notify_reg','Notification of new member registration','email','members','New member registration site: {site_name}\n\nScreen name: {name}\nUser name: {username}\nEmail: {email}\n\nYour control panel URL: {control_panel_url}',NULL,1720033133,0),
	(6,1,'y','admin_notify_entry','A new channel entry has been posted','email','content','A new entry has been posted in the following channel:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nPosted by: {name}\nEmail: {email}\n\nTo read the entry please visit:\n{entry_url}\n',NULL,1720033133,0),
	(7,1,'y','admin_notify_comment','You have just received a comment','email','comments','You have just received a comment for the following channel:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nLocated at:\n{comment_url}\n\nPosted by: {name}\nEmail: {email}\nURL: {url}\nLocation: {location}\n\n{comment}',NULL,1720033133,0),
	(8,1,'y','mbr_activation_instructions','Enclosed is your activation code','email','members','Thank you for your new member registration.\n\nTo activate your new account, please visit the following URL:\n\n{unwrap}{activation_url}{/unwrap}\n\nThank You!\n\n{site_name}\n\n{site_url}',NULL,1720033133,0),
	(9,1,'y','forgot_password_instructions','Login information','email','members','To reset your password, please go to the following page:\n\n{reset_url}\n\nThen log in with your username: {username}\n\nIf you do not wish to reset your password, ignore this message. It will expire in 24 hours.\n\n{site_name}\n{site_url}',NULL,1720033133,0),
	(10,1,'y','password_changed_notification','Password changed','email','members','Your password was just changed.\n\nIf you didn\'t make this change yourself, please contact an administrator right away.\n\n{site_name}\n{site_url}',NULL,1720033133,0),
	(11,1,'y','forgot_username_instructions','Username information','email','members','Your username is: {username}\n\nIf you didn\'t request your username yourself, please contact an administrator right away.\n\n{site_name}\n{site_url}',NULL,1720033133,0),
	(12,1,'y','email_changed_notification','Email address changed','email','members','Your email address has been changed, and this email address is no longer associated with your account.\n\nIf you didn\'t make this change yourself, please contact an administrator right away.\n\n{site_name}\n{site_url}',NULL,1720033133,0),
	(13,1,'y','validated_member_notify','Your membership account has been activated','email','members','Your membership account has been activated and is ready for use.\n\nThank You!\n\n{site_name}\n{site_url}',NULL,1720033133,0),
	(14,1,'y','decline_member_validation','Your membership account has been declined','email','members','We\'re sorry but our staff has decided not to validate your membership.\n\n{site_name}\n{site_url}',NULL,1720033133,0),
	(15,1,'y','comment_notification','Someone just responded to your comment','email','comments','{name_of_commenter} just responded to the entry you subscribed to at:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nYou can see the comment at the following URL:\n{comment_url}\n\n{comment}\n\nTo stop receiving notifications for this comment, click here:\n{notification_removal_url}',NULL,1720033133,0),
	(16,1,'y','comments_opened_notification','New comments have been added','email','comments','Responses have been added to the entry you subscribed to at:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nYou can see the comments at the following URL:\n{comment_url}\n\n{comments}\n{comment}\n{/comments}\n\nTo stop receiving notifications for this entry, click here:\n{notification_removal_url}',NULL,1720033133,0),
	(17,1,'y','private_message_notification','Someone has sent you a Private Message','email','private_messages','\n{recipient_name},\n\n{sender_name} has just sent you a Private Message titled ‘{message_subject}’.\n\nYou can see the Private Message by logging in and viewing your inbox at:\n{site_url}\n\nContent:\n\n{message_content}\n\nTo stop receiving notifications of Private Messages, turn the option off in your Email Settings.\n\n{site_name}\n{site_url}',NULL,1720033133,0),
	(18,1,'y','pm_inbox_full','Your private message mailbox is full','email','private_messages','{recipient_name},\n\n{sender_name} has just attempted to send you a Private Message,\nbut your inbox is full, exceeding the maximum of {pm_storage_limit}.\n\nPlease log in and remove unwanted messages from your inbox at:\n{site_url}',NULL,1720033133,0);

/*!40000 ALTER TABLE `exp_specialty_templates` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_stats
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_stats`;

CREATE TABLE `exp_stats` (
  `stat_id` int unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int unsigned NOT NULL DEFAULT '1',
  `total_members` mediumint NOT NULL DEFAULT '0',
  `recent_member_id` int NOT NULL DEFAULT '0',
  `recent_member` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_entries` mediumint NOT NULL DEFAULT '0',
  `total_forum_topics` mediumint NOT NULL DEFAULT '0',
  `total_forum_posts` mediumint NOT NULL DEFAULT '0',
  `total_comments` mediumint NOT NULL DEFAULT '0',
  `last_entry_date` int unsigned NOT NULL DEFAULT '0',
  `last_forum_post_date` int unsigned NOT NULL DEFAULT '0',
  `last_comment_date` int unsigned NOT NULL DEFAULT '0',
  `last_visitor_date` int unsigned NOT NULL DEFAULT '0',
  `most_visitors` mediumint NOT NULL DEFAULT '0',
  `most_visitor_date` int unsigned NOT NULL DEFAULT '0',
  `last_cache_clear` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`stat_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_stats` WRITE;
/*!40000 ALTER TABLE `exp_stats` DISABLE KEYS */;

INSERT INTO `exp_stats` (`stat_id`, `site_id`, `total_members`, `recent_member_id`, `recent_member`, `total_entries`, `total_forum_topics`, `total_forum_posts`, `total_comments`, `last_entry_date`, `last_forum_post_date`, `last_comment_date`, `last_visitor_date`, `most_visitors`, `most_visitor_date`, `last_cache_clear`)
VALUES
	(1,1,1,1,'cf-admin',7,0,0,0,1720118700,0,0,0,0,0,1720033133);

/*!40000 ALTER TABLE `exp_stats` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_statuses
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_statuses`;

CREATE TABLE `exp_statuses` (
  `status_id` int unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_order` int unsigned NOT NULL,
  `highlight` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '000000',
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_statuses` WRITE;
/*!40000 ALTER TABLE `exp_statuses` DISABLE KEYS */;

INSERT INTO `exp_statuses` (`status_id`, `status`, `status_order`, `highlight`)
VALUES
	(1,'open',1,'009933'),
	(2,'closed',2,'990000');

/*!40000 ALTER TABLE `exp_statuses` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_statuses_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_statuses_roles`;

CREATE TABLE `exp_statuses_roles` (
  `role_id` int unsigned NOT NULL,
  `status_id` int unsigned NOT NULL,
  PRIMARY KEY (`status_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_statuses_roles` WRITE;
/*!40000 ALTER TABLE `exp_statuses_roles` DISABLE KEYS */;

INSERT INTO `exp_statuses_roles` (`role_id`, `status_id`)
VALUES
	(5,1),
	(5,2);

/*!40000 ALTER TABLE `exp_statuses_roles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_structure
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_structure`;

CREATE TABLE `exp_structure` (
  `site_id` int unsigned NOT NULL DEFAULT '1',
  `entry_id` int unsigned NOT NULL DEFAULT '0',
  `parent_id` int unsigned NOT NULL DEFAULT '0',
  `channel_id` int unsigned NOT NULL DEFAULT '0',
  `listing_cid` int unsigned NOT NULL DEFAULT '0',
  `lft` smallint unsigned NOT NULL DEFAULT '0',
  `rgt` smallint unsigned NOT NULL DEFAULT '0',
  `dead` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hidden` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `structure_url_title` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template_id` int unsigned NOT NULL DEFAULT '0',
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_structure` WRITE;
/*!40000 ALTER TABLE `exp_structure` DISABLE KEYS */;

INSERT INTO `exp_structure` (`site_id`, `entry_id`, `parent_id`, `channel_id`, `listing_cid`, `lft`, `rgt`, `dead`, `hidden`, `structure_url_title`, `template_id`, `updated`)
VALUES
	(0,0,0,3,0,1,14,'root','n',NULL,0,'2024-07-04 18:41:49'),
	(1,2,0,1,0,4,5,'','n','MISSING',0,NULL),
	(1,3,0,1,0,6,7,'','n','MISSING',0,NULL),
	(1,5,0,1,0,12,13,'','n','MISSING',0,NULL),
	(1,7,0,6,0,2,3,'','n','MISSING',0,NULL),
	(1,8,0,6,4,8,9,'','n','work',0,NULL),
	(1,9,0,6,3,10,11,'','n','blog',0,NULL);

/*!40000 ALTER TABLE `exp_structure` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_structure_channels
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_structure_channels`;

CREATE TABLE `exp_structure_channels` (
  `site_id` smallint unsigned NOT NULL,
  `channel_id` mediumint unsigned NOT NULL,
  `template_id` int unsigned NOT NULL,
  `type` enum('page','listing','asset','unmanaged') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unmanaged',
  `split_assets` enum('y','n') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `show_in_page_selector` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  PRIMARY KEY (`site_id`,`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_structure_channels` WRITE;
/*!40000 ALTER TABLE `exp_structure_channels` DISABLE KEYS */;

INSERT INTO `exp_structure_channels` (`site_id`, `channel_id`, `template_id`, `type`, `split_assets`, `show_in_page_selector`)
VALUES
	(1,1,13,'page','n','y'),
	(1,2,0,'asset','n','y'),
	(1,3,0,'listing','n','y'),
	(1,4,0,'listing','n','y'),
	(1,5,0,'asset','n','y'),
	(1,6,0,'page','n','y');

/*!40000 ALTER TABLE `exp_structure_channels` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_structure_listings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_structure_listings`;

CREATE TABLE `exp_structure_listings` (
  `site_id` int unsigned NOT NULL DEFAULT '1',
  `entry_id` int unsigned NOT NULL DEFAULT '0',
  `parent_id` int unsigned NOT NULL DEFAULT '0',
  `channel_id` int unsigned NOT NULL DEFAULT '0',
  `template_id` int unsigned NOT NULL DEFAULT '0',
  `uri` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_structure_listings` WRITE;
/*!40000 ALTER TABLE `exp_structure_listings` DISABLE KEYS */;

INSERT INTO `exp_structure_listings` (`site_id`, `entry_id`, `parent_id`, `channel_id`, `template_id`, `uri`)
VALUES
	(1,10,9,3,0,'testing-the-blog-out-here');

/*!40000 ALTER TABLE `exp_structure_listings` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_structure_members
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_structure_members`;

CREATE TABLE `exp_structure_members` (
  `member_id` int unsigned NOT NULL DEFAULT '0',
  `site_id` int unsigned NOT NULL DEFAULT '1',
  `nav_state` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`site_id`,`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_structure_nav_history
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_structure_nav_history`;

CREATE TABLE `exp_structure_nav_history` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `site_id` smallint unsigned NOT NULL,
  `site_pages` longtext COLLATE utf8mb4_unicode_ci,
  `structure` longtext COLLATE utf8mb4_unicode_ci,
  `note` text COLLATE utf8mb4_unicode_ci,
  `structure_version` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  `current` smallint unsigned NOT NULL DEFAULT '0',
  `restored_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`,`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_structure_nav_history` WRITE;
/*!40000 ALTER TABLE `exp_structure_nav_history` DISABLE KEYS */;

INSERT INTO `exp_structure_nav_history` (`id`, `site_id`, `site_pages`, `structure`, `note`, `structure_version`, `date`, `current`, `restored_date`)
VALUES
	(1,1,'YToxOntpOjE7YTozOntzOjM6InVybCI7czowOiIiO3M6NDoidXJpcyI7YToxOntpOjE7czo2OiIvaG9tZS8iO31zOjk6InRlbXBsYXRlcyI7YToxOntpOjE7aTowO319fQ==','[{\"site_id\":1,\"entry_id\":1,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":2,\"rgt\":3,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null}]','Post saving entry  \"Home\"','6.0.0','2024-07-03 19:10:02',0,NULL),
	(2,1,'YToxOntpOjE7YTozOntzOjM6InVybCI7czowOiIiO3M6NDoidXJpcyI7YToxOntpOjE7czo2OiIvaG9tZS8iO31zOjk6InRlbXBsYXRlcyI7YToxOntpOjE7aTowO319fQ==','[{\"site_id\":1,\"entry_id\":1,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":2,\"rgt\":3,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null}]','Post saving entry  \"Home\"','6.0.0','2024-07-03 19:10:04',0,NULL),
	(3,1,'YToxOntpOjE7YTozOntzOjM6InVybCI7czowOiIiO3M6NDoidXJpcyI7YToyOntpOjE7czo2OiIvaG9tZS8iO2k6MjtzOjc6Ii9hYm91dC8iO31zOjk6InRlbXBsYXRlcyI7YToyOntpOjE7aTowO2k6MjtpOjA7fX19','[{\"site_id\":1,\"entry_id\":1,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":2,\"rgt\":3,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":2,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null}]','Post saving entry  \"About\"','6.0.0','2024-07-03 19:10:14',0,NULL),
	(4,1,'YToxOntpOjE7YTozOntzOjM6InVybCI7czowOiIiO3M6NDoidXJpcyI7YTozOntpOjE7czo2OiIvaG9tZS8iO2k6MjtzOjc6Ii9hYm91dC8iO2k6MztzOjEwOiIvc2VydmljZXMvIjt9czo5OiJ0ZW1wbGF0ZXMiO2E6Mzp7aToxO2k6MDtpOjI7aTowO2k6MztpOjA7fX19','[{\"site_id\":1,\"entry_id\":1,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":2,\"rgt\":3,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":2,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":3,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":6,\"rgt\":7,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null}]','Post saving entry  \"Services\"','6.0.0','2024-07-03 19:10:29',0,NULL),
	(5,1,'YToxOntpOjE7YTozOntzOjM6InVybCI7czowOiIiO3M6NDoidXJpcyI7YTo0OntpOjE7czo2OiIvaG9tZS8iO2k6MjtzOjc6Ii9hYm91dC8iO2k6MztzOjEwOiIvc2VydmljZXMvIjtpOjQ7czo2OiIvYmxvZy8iO31zOjk6InRlbXBsYXRlcyI7YTo0OntpOjE7aTowO2k6MjtpOjA7aTozO2k6MDtpOjQ7aTowO319fQ==','[{\"site_id\":1,\"entry_id\":1,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":2,\"rgt\":3,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":2,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":3,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":6,\"rgt\":7,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":4,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null}]','Post saving entry  \"Blog\"','6.0.0','2024-07-03 19:11:15',0,NULL),
	(6,1,'YToxOntpOjE7YTozOntzOjM6InVybCI7czowOiIiO3M6NDoidXJpcyI7YTo1OntpOjE7czo2OiIvaG9tZS8iO2k6MjtzOjc6Ii9hYm91dC8iO2k6MztzOjEwOiIvc2VydmljZXMvIjtpOjQ7czo2OiIvYmxvZy8iO2k6NTtzOjk6Ii9jb250YWN0LyI7fXM6OToidGVtcGxhdGVzIjthOjU6e2k6MTtpOjA7aToyO2k6MDtpOjM7aTowO2k6NDtpOjA7aTo1O2k6MDt9fX0=','[{\"site_id\":1,\"entry_id\":1,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":2,\"rgt\":3,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":2,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":3,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":6,\"rgt\":7,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":4,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":5,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":10,\"rgt\":11,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null}]','Post saving entry  \"Contact\"','6.0.0','2024-07-03 19:11:27',0,NULL),
	(7,1,'YToxOntpOjE7YTozOntzOjM6InVybCI7czowOiIiO3M6NDoidXJpcyI7YTo2OntpOjE7czo2OiIvaG9tZS8iO2k6MjtzOjc6Ii9hYm91dC8iO2k6MztzOjEwOiIvc2VydmljZXMvIjtpOjQ7czo2OiIvYmxvZy8iO2k6NTtzOjk6Ii9jb250YWN0LyI7aTo2O3M6NjoiL3dvcmsvIjt9czo5OiJ0ZW1wbGF0ZXMiO2E6Njp7aToxO2k6MDtpOjI7aTowO2k6MztpOjA7aTo0O2k6MDtpOjU7aTowO2k6NjtpOjA7fX19','[{\"site_id\":1,\"entry_id\":1,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":2,\"rgt\":3,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":2,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":3,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":6,\"rgt\":7,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":4,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":5,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":10,\"rgt\":11,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":6,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":12,\"rgt\":13,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null}]','Post saving entry  \"Work\"','6.0.0','2024-07-03 19:11:46',0,NULL),
	(8,1,'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6Njp7aToxO3M6NToiL2hvbWUiO2k6MjtzOjY6Ii9hYm91dCI7aTozO3M6OToiL3NlcnZpY2VzIjtpOjY7czo1OiIvd29yayI7aTo0O3M6NToiL2Jsb2ciO2k6NTtzOjg6Ii9jb250YWN0Ijt9czo5OiJ0ZW1wbGF0ZXMiO2E6Njp7aToxO2k6MDtpOjI7aTowO2k6MztpOjA7aTo0O2k6MDtpOjU7aTowO2k6NjtpOjA7fX19','[{\"site_id\":1,\"entry_id\":1,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":2,\"rgt\":3,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":2,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":3,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":6,\"rgt\":7,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":4,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":10,\"rgt\":11,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":5,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":12,\"rgt\":13,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":6,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null}]','Post Ajax Reorder','6.0.0','2024-07-03 19:15:10',0,NULL),
	(9,1,'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6Njp7aToxO3M6NjoiL2hvbWUvIjtpOjI7czo3OiIvYWJvdXQvIjtpOjM7czoxMDoiL3NlcnZpY2VzLyI7aTo2O3M6NjoiL3dvcmsvIjtpOjQ7czo2OiIvYmxvZy8iO2k6NTtzOjk6Ii9jb250YWN0LyI7fXM6OToidGVtcGxhdGVzIjthOjY6e2k6MTtpOjA7aToyO2k6MDtpOjM7aTowO2k6NDtpOjA7aTo1O2k6MDtpOjY7aTowO319fQ==','[{\"site_id\":1,\"entry_id\":1,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":2,\"rgt\":3,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":2,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":3,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":6,\"rgt\":7,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":4,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":10,\"rgt\":11,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":5,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":12,\"rgt\":13,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":6,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":4,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"work\",\"template_id\":0,\"updated\":null}]','Post saving entry  \"Work\"','6.0.0','2024-07-03 19:17:33',0,NULL),
	(10,1,'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6Njp7aToxO3M6NjoiL2hvbWUvIjtpOjI7czo3OiIvYWJvdXQvIjtpOjM7czoxMDoiL3NlcnZpY2VzLyI7aTo2O3M6NjoiL3dvcmsvIjtpOjQ7czo2OiIvYmxvZy8iO2k6NTtzOjk6Ii9jb250YWN0LyI7fXM6OToidGVtcGxhdGVzIjthOjY6e2k6MTtpOjA7aToyO2k6MDtpOjM7aTowO2k6NDtpOjA7aTo1O2k6MDtpOjY7aTowO319fQ==','[{\"site_id\":1,\"entry_id\":1,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":2,\"rgt\":3,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":2,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":3,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":6,\"rgt\":7,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":4,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":3,\"lft\":10,\"rgt\":11,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"blog\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":5,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":12,\"rgt\":13,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":6,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":4,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"work\",\"template_id\":0,\"updated\":null}]','Post saving entry  \"Blog\"','6.0.0','2024-07-03 19:17:44',0,NULL),
	(11,1,'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6Njp7aToxO3M6NjoiL2hvbWUvIjtpOjI7czo3OiIvYWJvdXQvIjtpOjM7czoxMDoiL3NlcnZpY2VzLyI7aTo2O3M6NjoiL3dvcmsvIjtpOjQ7czo2OiIvYmxvZy8iO2k6NTtzOjk6Ii9jb250YWN0LyI7fXM6OToidGVtcGxhdGVzIjthOjY6e2k6MTtpOjA7aToyO2k6MDtpOjM7aTowO2k6NDtpOjA7aTo1O2k6MDtpOjY7aTowO319fQ==','[{\"site_id\":1,\"entry_id\":1,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":2,\"rgt\":3,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":2,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":3,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":6,\"rgt\":7,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":4,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":3,\"lft\":10,\"rgt\":11,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"blog\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":5,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":12,\"rgt\":13,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":6,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":4,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"work\",\"template_id\":0,\"updated\":null}]','Post saving entry  \"Agency\"','6.0.0','2024-07-03 20:04:34',0,NULL),
	(12,1,'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6Njp7aToxO3M6NjoiL2hvbWUvIjtpOjI7czo3OiIvYWJvdXQvIjtpOjM7czoxMDoiL3NlcnZpY2VzLyI7aTo2O3M6NjoiL3dvcmsvIjtpOjQ7czo2OiIvYmxvZy8iO2k6NTtzOjk6Ii9jb250YWN0LyI7fXM6OToidGVtcGxhdGVzIjthOjY6e2k6MTtpOjA7aToyO2k6MDtpOjM7aTowO2k6NDtpOjA7aTo1O2k6MDtpOjY7aTowO319fQ==','[{\"site_id\":1,\"entry_id\":1,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":2,\"rgt\":3,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":2,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":3,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":6,\"rgt\":7,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":4,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":3,\"lft\":10,\"rgt\":11,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"blog\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":5,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":12,\"rgt\":13,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":6,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":4,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"work\",\"template_id\":0,\"updated\":null}]','Post saving entry  \"Home\"','6.0.0','2024-07-04 16:32:24',0,NULL),
	(13,1,'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6Njp7aToxO3M6NjoiL2hvbWUvIjtpOjI7czo3OiIvYWJvdXQvIjtpOjM7czoxMDoiL3NlcnZpY2VzLyI7aTo2O3M6NjoiL3dvcmsvIjtpOjQ7czo2OiIvYmxvZy8iO2k6NTtzOjk6Ii9jb250YWN0LyI7fXM6OToidGVtcGxhdGVzIjthOjY6e2k6MTtpOjA7aToyO2k6MDtpOjM7aTowO2k6NDtpOjA7aTo1O2k6MDtpOjY7aTowO319fQ==','[{\"site_id\":1,\"entry_id\":1,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":2,\"rgt\":3,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":2,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":3,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":6,\"rgt\":7,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":4,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":3,\"lft\":10,\"rgt\":11,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"blog\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":5,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":12,\"rgt\":13,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":6,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":4,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"work\",\"template_id\":0,\"updated\":null}]','Post saving entry  \"Home\"','6.0.0','2024-07-04 16:54:43',0,NULL),
	(14,1,'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6Njp7aToxO3M6NjoiL2hvbWUvIjtpOjI7czo3OiIvYWJvdXQvIjtpOjM7czoxMDoiL3NlcnZpY2VzLyI7aTo2O3M6NjoiL3dvcmsvIjtpOjQ7czo2OiIvYmxvZy8iO2k6NTtzOjk6Ii9jb250YWN0LyI7fXM6OToidGVtcGxhdGVzIjthOjY6e2k6MTtpOjA7aToyO2k6MDtpOjM7aTowO2k6NDtpOjA7aTo1O2k6MDtpOjY7aTowO319fQ==','[{\"site_id\":1,\"entry_id\":1,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":2,\"rgt\":3,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":2,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":3,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":6,\"rgt\":7,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":4,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":3,\"lft\":10,\"rgt\":11,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"blog\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":5,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":12,\"rgt\":13,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":6,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":4,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"work\",\"template_id\":0,\"updated\":null}]','Post saving entry  \"\"','6.0.0','2024-07-04 17:01:08',0,NULL),
	(15,1,'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6NTp7aToyO3M6NzoiL2Fib3V0LyI7aTozO3M6MTA6Ii9zZXJ2aWNlcy8iO2k6NjtzOjY6Ii93b3JrLyI7aTo0O3M6NjoiL2Jsb2cvIjtpOjU7czo5OiIvY29udGFjdC8iO31zOjk6InRlbXBsYXRlcyI7YTo1OntpOjI7aTowO2k6MztpOjA7aTo0O2k6MDtpOjU7aTowO2k6NjtpOjA7fX19','[{\"site_id\":1,\"entry_id\":2,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":2,\"rgt\":3,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":3,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":4,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":3,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"blog\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":5,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":10,\"rgt\":11,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":6,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":4,\"lft\":6,\"rgt\":7,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"work\",\"template_id\":0,\"updated\":null}]','Post deleting data - ids 1','6.0.0','2024-07-04 17:01:08',0,NULL),
	(16,1,'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6Njp7aToyO3M6NzoiL2Fib3V0LyI7aTozO3M6MTA6Ii9zZXJ2aWNlcy8iO2k6NjtzOjY6Ii93b3JrLyI7aTo0O3M6NjoiL2Jsb2cvIjtpOjU7czo5OiIvY29udGFjdC8iO2k6NztzOjY6Ii9ob21lLyI7fXM6OToidGVtcGxhdGVzIjthOjY6e2k6MjtpOjA7aTozO2k6MDtpOjQ7aTowO2k6NTtpOjA7aTo2O2k6MDtpOjc7aTowO319fQ==','[{\"site_id\":1,\"entry_id\":2,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":2,\"rgt\":3,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":3,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":4,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":3,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"blog\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":5,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":10,\"rgt\":11,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":6,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":4,\"lft\":6,\"rgt\":7,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"work\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":7,\"parent_id\":0,\"channel_id\":6,\"listing_cid\":0,\"lft\":14,\"rgt\":15,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null}]','Post saving entry  \"Home\"','6.0.0','2024-07-04 17:01:27',0,NULL),
	(17,1,'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6Njp7aTo3O3M6NToiL2hvbWUiO2k6MjtzOjY6Ii9hYm91dCI7aTozO3M6OToiL3NlcnZpY2VzIjtpOjY7czo1OiIvd29yayI7aTo0O3M6NToiL2Jsb2ciO2k6NTtzOjg6Ii9jb250YWN0Ijt9czo5OiJ0ZW1wbGF0ZXMiO2E6Njp7aToyO2k6MDtpOjM7aTowO2k6NDtpOjA7aTo1O2k6MDtpOjY7aTowO2k6NztpOjA7fX19','[{\"site_id\":1,\"entry_id\":2,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":3,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":6,\"rgt\":7,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":4,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":3,\"lft\":10,\"rgt\":11,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"blog\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":5,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":12,\"rgt\":13,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":6,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":4,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"work\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":7,\"parent_id\":0,\"channel_id\":6,\"listing_cid\":0,\"lft\":2,\"rgt\":3,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null}]','Post Ajax Reorder','6.0.0','2024-07-04 17:39:11',0,NULL),
	(18,1,'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6Njp7aTo3O3M6NjoiL2hvbWUvIjtpOjI7czo3OiIvYWJvdXQvIjtpOjM7czoxMDoiL3NlcnZpY2VzLyI7aTo2O3M6NjoiL3dvcmsvIjtpOjQ7czo2OiIvYmxvZy8iO2k6NTtzOjk6Ii9jb250YWN0LyI7fXM6OToidGVtcGxhdGVzIjthOjY6e2k6MjtpOjA7aTozO2k6MDtpOjQ7aTowO2k6NTtpOjA7aTo2O2k6MDtpOjc7aTowO319fQ==','[{\"site_id\":1,\"entry_id\":2,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":3,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":6,\"rgt\":7,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":4,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":3,\"lft\":10,\"rgt\":11,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"blog\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":5,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":12,\"rgt\":13,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":6,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":4,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"work\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":7,\"parent_id\":0,\"channel_id\":6,\"listing_cid\":0,\"lft\":2,\"rgt\":3,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null}]','Post saving entry  \"Home\"','6.0.0','2024-07-04 18:13:26',0,NULL),
	(19,1,'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6Njp7aTo3O3M6NjoiL2hvbWUvIjtpOjI7czo3OiIvYWJvdXQvIjtpOjM7czoxMDoiL3NlcnZpY2VzLyI7aTo2O3M6NjoiL3dvcmsvIjtpOjQ7czo2OiIvYmxvZy8iO2k6NTtzOjk6Ii9jb250YWN0LyI7fXM6OToidGVtcGxhdGVzIjthOjY6e2k6MjtpOjA7aTozO2k6MDtpOjQ7aTowO2k6NTtpOjA7aTo2O2k6MDtpOjc7aTowO319fQ==','[{\"site_id\":1,\"entry_id\":2,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":3,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":6,\"rgt\":7,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":4,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":3,\"lft\":10,\"rgt\":11,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"blog\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":5,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":12,\"rgt\":13,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":6,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":4,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"work\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":7,\"parent_id\":0,\"channel_id\":6,\"listing_cid\":0,\"lft\":2,\"rgt\":3,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null}]','Post saving entry  \"Home\"','6.0.0','2024-07-04 18:25:38',0,NULL),
	(20,1,'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6Njp7aTo3O3M6NjoiL2hvbWUvIjtpOjI7czo3OiIvYWJvdXQvIjtpOjM7czoxMDoiL3NlcnZpY2VzLyI7aTo2O3M6NjoiL3dvcmsvIjtpOjQ7czo2OiIvYmxvZy8iO2k6NTtzOjk6Ii9jb250YWN0LyI7fXM6OToidGVtcGxhdGVzIjthOjY6e2k6MjtpOjA7aTozO2k6MDtpOjQ7aTowO2k6NTtpOjA7aTo2O2k6MDtpOjc7aTowO319fQ==','[{\"site_id\":1,\"entry_id\":2,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":3,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":6,\"rgt\":7,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":4,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":3,\"lft\":10,\"rgt\":11,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"blog\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":5,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":12,\"rgt\":13,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":6,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":4,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"work\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":7,\"parent_id\":0,\"channel_id\":6,\"listing_cid\":0,\"lft\":2,\"rgt\":3,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null}]','Post saving entry  \"Blog\"','6.0.0','2024-07-04 18:31:48',0,NULL),
	(21,1,'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6Njp7aTo3O3M6NjoiL2hvbWUvIjtpOjI7czo3OiIvYWJvdXQvIjtpOjM7czoxMDoiL3NlcnZpY2VzLyI7aTo2O3M6NjoiL3dvcmsvIjtpOjQ7czo2OiIvYmxvZy8iO2k6NTtzOjk6Ii9jb250YWN0LyI7fXM6OToidGVtcGxhdGVzIjthOjY6e2k6MjtpOjA7aTozO2k6MDtpOjQ7aTowO2k6NTtpOjA7aTo2O2k6MDtpOjc7aTowO319fQ==','[{\"site_id\":1,\"entry_id\":2,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":3,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":6,\"rgt\":7,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":4,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":3,\"lft\":10,\"rgt\":11,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"blog\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":5,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":12,\"rgt\":13,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":6,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":4,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"work\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":7,\"parent_id\":0,\"channel_id\":6,\"listing_cid\":0,\"lft\":2,\"rgt\":3,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null}]','Post saving entry  \"\"','6.0.0','2024-07-04 18:37:53',0,NULL),
	(22,1,'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6NTp7aTo3O3M6NjoiL2hvbWUvIjtpOjI7czo3OiIvYWJvdXQvIjtpOjM7czoxMDoiL3NlcnZpY2VzLyI7aTo0O3M6NjoiL2Jsb2cvIjtpOjU7czo5OiIvY29udGFjdC8iO31zOjk6InRlbXBsYXRlcyI7YTo1OntpOjI7aTowO2k6MztpOjA7aTo0O2k6MDtpOjU7aTowO2k6NztpOjA7fX19','[{\"site_id\":1,\"entry_id\":2,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":3,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":6,\"rgt\":7,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":4,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":3,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"blog\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":5,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":10,\"rgt\":11,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":7,\"parent_id\":0,\"channel_id\":6,\"listing_cid\":0,\"lft\":2,\"rgt\":3,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null}]','Post deleting data - ids 6','6.0.0','2024-07-04 18:37:53',0,NULL),
	(23,1,'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6Njp7aTo3O3M6NjoiL2hvbWUvIjtpOjI7czo3OiIvYWJvdXQvIjtpOjM7czoxMDoiL3NlcnZpY2VzLyI7aTo0O3M6NjoiL2Jsb2cvIjtpOjU7czo5OiIvY29udGFjdC8iO2k6ODtzOjY6Ii93b3JrLyI7fXM6OToidGVtcGxhdGVzIjthOjY6e2k6MjtpOjA7aTozO2k6MDtpOjQ7aTowO2k6NTtpOjA7aTo3O2k6MDtpOjg7aTowO319fQ==','[{\"site_id\":1,\"entry_id\":2,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":3,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":6,\"rgt\":7,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":4,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":3,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"blog\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":5,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":10,\"rgt\":11,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":7,\"parent_id\":0,\"channel_id\":6,\"listing_cid\":0,\"lft\":2,\"rgt\":3,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":8,\"parent_id\":0,\"channel_id\":6,\"listing_cid\":0,\"lft\":14,\"rgt\":15,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null}]','Post saving entry  \"Work\"','6.0.0','2024-07-04 18:38:26',0,NULL),
	(24,1,'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6Njp7aTo3O3M6NToiL2hvbWUiO2k6MjtzOjY6Ii9hYm91dCI7aTozO3M6OToiL3NlcnZpY2VzIjtpOjg7czo1OiIvd29yayI7aTo0O3M6NToiL2Jsb2ciO2k6NTtzOjg6Ii9jb250YWN0Ijt9czo5OiJ0ZW1wbGF0ZXMiO2E6Njp7aToyO2k6MDtpOjM7aTowO2k6NDtpOjA7aTo1O2k6MDtpOjc7aTowO2k6ODtpOjA7fX19','[{\"site_id\":1,\"entry_id\":2,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":3,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":6,\"rgt\":7,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":4,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":3,\"lft\":10,\"rgt\":11,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"blog\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":5,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":12,\"rgt\":13,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":7,\"parent_id\":0,\"channel_id\":6,\"listing_cid\":0,\"lft\":2,\"rgt\":3,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":8,\"parent_id\":0,\"channel_id\":6,\"listing_cid\":0,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null}]','Post Ajax Reorder','6.0.0','2024-07-04 18:38:45',0,NULL),
	(25,1,'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6Njp7aTo3O3M6NjoiL2hvbWUvIjtpOjI7czo3OiIvYWJvdXQvIjtpOjM7czoxMDoiL3NlcnZpY2VzLyI7aTo4O3M6NjoiL3dvcmsvIjtpOjQ7czo2OiIvYmxvZy8iO2k6NTtzOjk6Ii9jb250YWN0LyI7fXM6OToidGVtcGxhdGVzIjthOjY6e2k6MjtpOjA7aTozO2k6MDtpOjQ7aTowO2k6NTtpOjA7aTo3O2k6MDtpOjg7aTowO319fQ==','[{\"site_id\":1,\"entry_id\":2,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":3,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":6,\"rgt\":7,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":4,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":3,\"lft\":10,\"rgt\":11,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"blog\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":5,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":12,\"rgt\":13,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":7,\"parent_id\":0,\"channel_id\":6,\"listing_cid\":0,\"lft\":2,\"rgt\":3,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":8,\"parent_id\":0,\"channel_id\":6,\"listing_cid\":4,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"work\",\"template_id\":0,\"updated\":null}]','Post saving entry  \"Work\"','6.0.0','2024-07-04 18:39:02',0,NULL),
	(26,1,'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6Njp7aTo3O3M6NjoiL2hvbWUvIjtpOjI7czo3OiIvYWJvdXQvIjtpOjM7czoxMDoiL3NlcnZpY2VzLyI7aTo4O3M6NjoiL3dvcmsvIjtpOjQ7czo2OiIvYmxvZy8iO2k6NTtzOjk6Ii9jb250YWN0LyI7fXM6OToidGVtcGxhdGVzIjthOjY6e2k6MjtpOjA7aTozO2k6MDtpOjQ7aTowO2k6NTtpOjA7aTo3O2k6MDtpOjg7aTowO319fQ==','[{\"site_id\":1,\"entry_id\":2,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":3,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":6,\"rgt\":7,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":4,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":3,\"lft\":10,\"rgt\":11,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"blog\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":5,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":12,\"rgt\":13,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":7,\"parent_id\":0,\"channel_id\":6,\"listing_cid\":0,\"lft\":2,\"rgt\":3,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":8,\"parent_id\":0,\"channel_id\":6,\"listing_cid\":4,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"work\",\"template_id\":0,\"updated\":null}]','Post saving entry  \"Work\"','6.0.0','2024-07-04 18:39:05',0,NULL),
	(27,1,'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6Njp7aTo3O3M6NjoiL2hvbWUvIjtpOjI7czo3OiIvYWJvdXQvIjtpOjM7czoxMDoiL3NlcnZpY2VzLyI7aTo4O3M6NjoiL3dvcmsvIjtpOjQ7czo2OiIvYmxvZy8iO2k6NTtzOjk6Ii9jb250YWN0LyI7fXM6OToidGVtcGxhdGVzIjthOjY6e2k6MjtpOjA7aTozO2k6MDtpOjQ7aTowO2k6NTtpOjA7aTo3O2k6MDtpOjg7aTowO319fQ==','[{\"site_id\":1,\"entry_id\":2,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":3,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":6,\"rgt\":7,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":4,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":3,\"lft\":10,\"rgt\":11,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"blog\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":5,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":12,\"rgt\":13,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":7,\"parent_id\":0,\"channel_id\":6,\"listing_cid\":0,\"lft\":2,\"rgt\":3,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":8,\"parent_id\":0,\"channel_id\":6,\"listing_cid\":4,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"work\",\"template_id\":0,\"updated\":null}]','Post saving entry  \"Work\"','6.0.0','2024-07-04 18:40:05',0,NULL),
	(28,1,'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6Njp7aTo3O3M6NjoiL2hvbWUvIjtpOjI7czo3OiIvYWJvdXQvIjtpOjM7czoxMDoiL3NlcnZpY2VzLyI7aTo4O3M6NjoiL3dvcmsvIjtpOjQ7czo2OiIvYmxvZy8iO2k6NTtzOjk6Ii9jb250YWN0LyI7fXM6OToidGVtcGxhdGVzIjthOjY6e2k6MjtpOjA7aTozO2k6MDtpOjQ7aTowO2k6NTtpOjA7aTo3O2k6MDtpOjg7aTowO319fQ==','[{\"site_id\":1,\"entry_id\":2,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":3,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":6,\"rgt\":7,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":4,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":3,\"lft\":10,\"rgt\":11,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"blog\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":5,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":12,\"rgt\":13,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":7,\"parent_id\":0,\"channel_id\":6,\"listing_cid\":0,\"lft\":2,\"rgt\":3,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":8,\"parent_id\":0,\"channel_id\":6,\"listing_cid\":4,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"work\",\"template_id\":0,\"updated\":null}]','Post saving entry  \"\"','6.0.0','2024-07-04 18:40:46',0,NULL),
	(29,1,'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6NTp7aTo3O3M6NjoiL2hvbWUvIjtpOjI7czo3OiIvYWJvdXQvIjtpOjM7czoxMDoiL3NlcnZpY2VzLyI7aTo4O3M6NjoiL3dvcmsvIjtpOjU7czo5OiIvY29udGFjdC8iO31zOjk6InRlbXBsYXRlcyI7YTo1OntpOjI7aTowO2k6MztpOjA7aTo1O2k6MDtpOjc7aTowO2k6ODtpOjA7fX19','[{\"site_id\":1,\"entry_id\":2,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":3,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":6,\"rgt\":7,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":5,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":10,\"rgt\":11,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":7,\"parent_id\":0,\"channel_id\":6,\"listing_cid\":0,\"lft\":2,\"rgt\":3,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":8,\"parent_id\":0,\"channel_id\":6,\"listing_cid\":4,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"work\",\"template_id\":0,\"updated\":null}]','Post deleting data - ids 4','6.0.0','2024-07-04 18:40:46',0,NULL),
	(30,1,'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6Njp7aTo3O3M6NjoiL2hvbWUvIjtpOjI7czo3OiIvYWJvdXQvIjtpOjM7czoxMDoiL3NlcnZpY2VzLyI7aTo4O3M6NjoiL3dvcmsvIjtpOjU7czo5OiIvY29udGFjdC8iO2k6OTtzOjY6Ii9ibG9nLyI7fXM6OToidGVtcGxhdGVzIjthOjY6e2k6MjtpOjA7aTozO2k6MDtpOjU7aTowO2k6NztpOjA7aTo4O2k6MDtpOjk7aTowO319fQ==','[{\"site_id\":1,\"entry_id\":2,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":3,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":6,\"rgt\":7,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":5,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":10,\"rgt\":11,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":7,\"parent_id\":0,\"channel_id\":6,\"listing_cid\":0,\"lft\":2,\"rgt\":3,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":8,\"parent_id\":0,\"channel_id\":6,\"listing_cid\":4,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"work\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":9,\"parent_id\":0,\"channel_id\":6,\"listing_cid\":0,\"lft\":14,\"rgt\":15,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":null,\"template_id\":0,\"updated\":null}]','Post saving entry  \"Blog\"','6.0.0','2024-07-04 18:41:34',0,NULL),
	(31,1,'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6Njp7aTo3O3M6NToiL2hvbWUiO2k6MjtzOjY6Ii9hYm91dCI7aTozO3M6OToiL3NlcnZpY2VzIjtpOjg7czo1OiIvd29yayI7aTo5O3M6NToiL2Jsb2ciO2k6NTtzOjg6Ii9jb250YWN0Ijt9czo5OiJ0ZW1wbGF0ZXMiO2E6Njp7aToyO2k6MDtpOjM7aTowO2k6NTtpOjA7aTo3O2k6MDtpOjg7aTowO2k6OTtpOjA7fX19','[{\"site_id\":1,\"entry_id\":2,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":3,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":6,\"rgt\":7,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":5,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":12,\"rgt\":13,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":7,\"parent_id\":0,\"channel_id\":6,\"listing_cid\":0,\"lft\":2,\"rgt\":3,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":8,\"parent_id\":0,\"channel_id\":6,\"listing_cid\":4,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"work\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":9,\"parent_id\":0,\"channel_id\":6,\"listing_cid\":0,\"lft\":10,\"rgt\":11,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null}]','Post Ajax Reorder','6.0.0','2024-07-04 18:41:49',0,NULL),
	(32,1,'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6Njp7aTo3O3M6NjoiL2hvbWUvIjtpOjI7czo3OiIvYWJvdXQvIjtpOjM7czoxMDoiL3NlcnZpY2VzLyI7aTo4O3M6NjoiL3dvcmsvIjtpOjk7czo2OiIvYmxvZy8iO2k6NTtzOjk6Ii9jb250YWN0LyI7fXM6OToidGVtcGxhdGVzIjthOjY6e2k6MjtpOjA7aTozO2k6MDtpOjU7aTowO2k6NztpOjA7aTo4O2k6MDtpOjk7aTowO319fQ==','[{\"site_id\":1,\"entry_id\":2,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":3,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":6,\"rgt\":7,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":5,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":12,\"rgt\":13,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":7,\"parent_id\":0,\"channel_id\":6,\"listing_cid\":0,\"lft\":2,\"rgt\":3,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":8,\"parent_id\":0,\"channel_id\":6,\"listing_cid\":4,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"work\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":9,\"parent_id\":0,\"channel_id\":6,\"listing_cid\":3,\"lft\":10,\"rgt\":11,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"blog\",\"template_id\":0,\"updated\":null}]','Post saving entry  \"Blog\"','6.0.0','2024-07-04 18:41:57',0,NULL),
	(33,1,'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6Njp7aTo3O3M6NjoiL2hvbWUvIjtpOjI7czo3OiIvYWJvdXQvIjtpOjM7czoxMDoiL3NlcnZpY2VzLyI7aTo4O3M6NjoiL3dvcmsvIjtpOjk7czo2OiIvYmxvZy8iO2k6NTtzOjk6Ii9jb250YWN0LyI7fXM6OToidGVtcGxhdGVzIjthOjY6e2k6MjtpOjA7aTozO2k6MDtpOjU7aTowO2k6NztpOjA7aTo4O2k6MDtpOjk7aTowO319fQ==','[{\"site_id\":1,\"entry_id\":2,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":3,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":6,\"rgt\":7,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":5,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":12,\"rgt\":13,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":7,\"parent_id\":0,\"channel_id\":6,\"listing_cid\":0,\"lft\":2,\"rgt\":3,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":8,\"parent_id\":0,\"channel_id\":6,\"listing_cid\":4,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"work\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":9,\"parent_id\":0,\"channel_id\":6,\"listing_cid\":3,\"lft\":10,\"rgt\":11,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"blog\",\"template_id\":0,\"updated\":null}]','Post saving entry  \"Blog\"','6.0.0','2024-07-04 18:41:59',0,NULL),
	(34,1,'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6Nzp7aTo3O3M6NToiL2hvbWUiO2k6MjtzOjY6Ii9hYm91dCI7aTozO3M6OToiL3NlcnZpY2VzIjtpOjg7czo1OiIvd29yayI7aTo5O3M6NToiL2Jsb2ciO2k6NTtzOjg6Ii9jb250YWN0IjtpOjEwO3M6MzE6Ii9ibG9nL3Rlc3RpbmctdGhlLWJsb2ctb3V0LWhlcmUiO31zOjk6InRlbXBsYXRlcyI7YTo3OntpOjI7aTowO2k6MztpOjA7aTo1O2k6MDtpOjc7aTowO2k6ODtpOjA7aTo5O2k6MDtpOjEwO2k6MDt9fX0=','[{\"site_id\":1,\"entry_id\":2,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":3,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":6,\"rgt\":7,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":5,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":12,\"rgt\":13,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":7,\"parent_id\":0,\"channel_id\":6,\"listing_cid\":0,\"lft\":2,\"rgt\":3,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":8,\"parent_id\":0,\"channel_id\":6,\"listing_cid\":4,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"work\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":9,\"parent_id\":0,\"channel_id\":6,\"listing_cid\":3,\"lft\":10,\"rgt\":11,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"blog\",\"template_id\":0,\"updated\":null}]','Post saving entry  \"Testing the blog out here\"','6.0.0','2024-07-04 18:46:15',0,NULL),
	(35,1,'YToxOntpOjE7YTozOntzOjM6InVybCI7czoyMToie2Jhc2VfdXJsfS9pbmRleC5waHAvIjtzOjQ6InVyaXMiO2E6Nzp7aTo3O3M6NjoiL2hvbWUvIjtpOjI7czo3OiIvYWJvdXQvIjtpOjM7czoxMDoiL3NlcnZpY2VzLyI7aTo4O3M6NjoiL3dvcmsvIjtpOjk7czo2OiIvYmxvZy8iO2k6NTtzOjk6Ii9jb250YWN0LyI7aToxMDtzOjMyOiIvYmxvZy90ZXN0aW5nLXRoZS1ibG9nLW91dC1oZXJlLyI7fXM6OToidGVtcGxhdGVzIjthOjc6e2k6MjtpOjA7aTozO2k6MDtpOjU7aTowO2k6NztpOjA7aTo4O2k6MDtpOjk7aTowO2k6MTA7aTowO319fQ==','[{\"site_id\":1,\"entry_id\":2,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":4,\"rgt\":5,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":3,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":6,\"rgt\":7,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":5,\"parent_id\":0,\"channel_id\":1,\"listing_cid\":0,\"lft\":12,\"rgt\":13,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":7,\"parent_id\":0,\"channel_id\":6,\"listing_cid\":0,\"lft\":2,\"rgt\":3,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"MISSING\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":8,\"parent_id\":0,\"channel_id\":6,\"listing_cid\":4,\"lft\":8,\"rgt\":9,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"work\",\"template_id\":0,\"updated\":null},{\"site_id\":1,\"entry_id\":9,\"parent_id\":0,\"channel_id\":6,\"listing_cid\":3,\"lft\":10,\"rgt\":11,\"dead\":\"\",\"hidden\":\"n\",\"structure_url_title\":\"blog\",\"template_id\":0,\"updated\":null}]','Post saving entry  \"Home\"','6.0.0','2024-07-04 19:55:08',1,NULL);

/*!40000 ALTER TABLE `exp_structure_nav_history` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_structure_settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_structure_settings`;

CREATE TABLE `exp_structure_settings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int unsigned NOT NULL DEFAULT '1',
  `var` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `var_value` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_structure_settings` WRITE;
/*!40000 ALTER TABLE `exp_structure_settings` DISABLE KEYS */;

INSERT INTO `exp_structure_settings` (`id`, `site_id`, `var`, `var_value`)
VALUES
	(1,0,'action_ajax_move','39'),
	(2,0,'module_id','12'),
	(3,1,'show_picker','y'),
	(4,1,'show_view_page','y'),
	(5,1,'show_global_add_page','y'),
	(6,1,'hide_hidden_templates','y'),
	(7,1,'redirect_on_login','n'),
	(8,1,'redirect_on_publish','n'),
	(9,1,'add_trailing_slash','y');

/*!40000 ALTER TABLE `exp_structure_settings` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_template_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_template_groups`;

CREATE TABLE `exp_template_groups` (
  `group_id` int unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int unsigned NOT NULL DEFAULT '1',
  `group_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group_order` int unsigned NOT NULL,
  `is_site_default` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  PRIMARY KEY (`group_id`),
  KEY `site_id` (`site_id`),
  KEY `group_name_idx` (`group_name`),
  KEY `group_order_idx` (`group_order`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_template_groups` WRITE;
/*!40000 ALTER TABLE `exp_template_groups` DISABLE KEYS */;

INSERT INTO `exp_template_groups` (`group_id`, `site_id`, `group_name`, `group_order`, `is_site_default`)
VALUES
	(2,1,'global',1,'y'),
	(3,1,'layouts',2,'n'),
	(4,1,'blog',3,'n'),
	(5,1,'work',4,'n'),
	(6,1,'default',5,'n');

/*!40000 ALTER TABLE `exp_template_groups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_template_groups_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_template_groups_roles`;

CREATE TABLE `exp_template_groups_roles` (
  `role_id` int unsigned NOT NULL,
  `template_group_id` mediumint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`template_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_template_routes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_template_routes`;

CREATE TABLE `exp_template_routes` (
  `route_id` int unsigned NOT NULL AUTO_INCREMENT,
  `template_id` int unsigned NOT NULL,
  `order` int unsigned DEFAULT NULL,
  `route` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `route_parsed` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `route_required` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  PRIMARY KEY (`route_id`),
  KEY `template_id` (`template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_templates
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_templates`;

CREATE TABLE `exp_templates` (
  `template_id` int unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int unsigned NOT NULL DEFAULT '1',
  `group_id` int unsigned NOT NULL,
  `template_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `template_type` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'webpage',
  `template_engine` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template_data` mediumtext COLLATE utf8mb4_unicode_ci,
  `template_notes` text COLLATE utf8mb4_unicode_ci,
  `edit_date` int NOT NULL DEFAULT '0',
  `last_author_id` int unsigned NOT NULL DEFAULT '0',
  `cache` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `refresh` int unsigned NOT NULL DEFAULT '0',
  `no_auth_bounce` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `enable_http_auth` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `allow_php` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `php_parse_location` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'o',
  `hits` int unsigned NOT NULL DEFAULT '0',
  `protect_javascript` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `enable_frontedit` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  PRIMARY KEY (`template_id`),
  KEY `group_id` (`group_id`),
  KEY `template_name` (`template_name`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_templates` WRITE;
/*!40000 ALTER TABLE `exp_templates` DISABLE KEYS */;

INSERT INTO `exp_templates` (`template_id`, `site_id`, `group_id`, `template_name`, `template_type`, `template_engine`, `template_data`, `template_notes`, `edit_date`, `last_author_id`, `cache`, `refresh`, `no_auth_bounce`, `enable_http_auth`, `allow_php`, `php_parse_location`, `hits`, `protect_javascript`, `enable_frontedit`)
VALUES
	(3,1,2,'index','webpage',NULL,'',NULL,1720033714,0,'n',0,'','n','n','o',0,'n','y'),
	(4,1,3,'index','webpage',NULL,'',NULL,1720033743,0,'n',0,'','n','n','o',0,'n','y'),
	(5,1,2,'_header','webpage',NULL,'<!doctype html>\n<html class=\"no-js\" lang=\"en\">\n    <head>\n        <title>Clearfix - A Full service Marketing and Digital Design Studio</title>\n        <meta charset=\"utf-8\">\n        <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\" />\n        <meta name=\"author\" content=\"ThemeZaa\">\n        <meta name=\"viewport\" content=\"width=device-width,initial-scale=1.0\" />\n        <meta name=\"description\" content=\"We are a nimble team of storytellers with a passion for helping brands make meaningful and lasting connections through design and technology.\">\n        <!-- favicon icon -->\n        <link rel=\"shortcut icon\" href=\"images/favicon.png\">\n        <link rel=\"apple-touch-icon\" href=\"images/apple-touch-icon-57x57.png\">\n        <link rel=\"apple-touch-icon\" sizes=\"72x72\" href=\"images/apple-touch-icon-72x72.png\">\n        <link rel=\"apple-touch-icon\" sizes=\"114x114\" href=\"images/apple-touch-icon-114x114.png\">\n        <!-- google fonts preconnect -->\n        <link rel=\"preconnect\" href=\"https://fonts.googleapis.com\" crossorigin>\n        <link rel=\"preconnect\" href=\"https://fonts.gstatic.com\" crossorigin>\n        <!-- style sheets and font icons  -->\n        <link rel=\"stylesheet\" href=\"css/vendors.min.css\"/>\n        <link rel=\"stylesheet\" href=\"css/icon.min.css\"/>\n        <link rel=\"stylesheet\" href=\"css/style.css\"/>\n        <link rel=\"stylesheet\" href=\"css/responsive.css\"/>\n        <link rel=\"stylesheet\" href=\"demos/web-agency/web-agency.css\" />\n\n        <style>\n            body {\n                 background-image: url(\'images/vertical-line-bg-dark-01.svg\');\n                 background-position: center top;\n                 background-repeat: repeat;\n                 background-color: #3C3B3B;\n            }\n            .bg-cf-hero {\n                 background-image:  url(\'images/bg-cf-heart.svg\');\n                 background-position: center;\n                 background-repeat: no-repeat;\n                 background-size: 850px;\n            }\n\n            @media only screen and (max-width : 992px) {\n\n              .bg-cf-hero {\n                   background-size: 45%;\n              }\n              .navbar.bg-transparent, .navbar-modern-inner.bg-transparent, .navbar-full-screen-menu-inner.bg-transparent {\n                  background-color: rgba(255, 255, 255, 0);\n                }\n            }\n\n        </style>\n    </head>\n    <body data-mobile-nav-style=\"classic\" >\n        <!-- start header -->\n        <header>\n            <!-- start navigation -->\n            <nav class=\"navbar navbar-expand-lg header-dark bg-transparent header-reverse glass-effect\" data-header-hover=\"dark\">\n                <div class=\"container-fluid\">\n                    <div class=\"col-auto col-lg-2 me-lg-0 me-auto\">\n                        <a class=\"navbar-brand\" href=\"demo-branding-agency.html\">\n                            <img src=\"images/logos/cf-logo-no-tag-horz.svg\" data-at2x=\"images/logos/cf-logo-no-tag-horz.svg\" alt=\"logo\" class=\"default-logo\">\n                            <img src=\"images/logos/cf-logo-no-tag-horz.svg\" data-at2x=\"images/logos/cf-logo-no-tag-horz.svg\" alt=\"logo\" class=\"alt-logo\">\n                            <img src=\"images/logos/cf-logo-no-tag-horz.svg\" data-at2x=\"images/logos/cf-logo-no-tag-horz.svg\" alt=\"logo\" class=\"mobile-logo\">\n                        </a>\n                    </div>\n                    <div class=\"col-auto col-lg-3 text-end lg-pe-0\">\n                                <div class=\"header-icon\">\n                                    <div class=\"header-push-button hamburger-push-button icon sm-pe-15px\">\n                                        <div class=\"push-button\">\n                                            <span></span>\n                                            <span></span>\n                                        </div>\n                                    </div>\n                                </div>\n                            </div>\n                        </div>\n                    </nav>\n                    <!-- end navigation -->\n                    <!-- start hamburger menu -->\n                    <div class=\"push-menu hamburger-nav header-dark hamburger-menu-half bg-dark-gray md-w-60 sm-w-100\" style=\"background-image: url(images/demo-gym-and-fitness-menu-bg.jpg)\">\n                        <span class=\"close-menu text-dark-gray bg-white\"><i class=\"fa-solid fa-xmark\"></i></span>\n                        <div class=\"d-flex flex-column justify-content-center h-100 ps-18 pb-12 xxl-p-12 sm-p-20px bg-cf-pink\" style=\"background-image: url(\'images/logo-mark-fade-pat.png\'); background-repeat: repeat-x;\">\n                            <div class=\"hamburger-menu menu-list-wrapper w-80 lg-w-100 lg-no-margin sm-mt-auto sm-mb-auto\" data-scroll-options=\'{ \"theme\": \"light\" }\'>\n                                <ul class=\"menu-item-list fw-500 p-0\">\n                                    <li class=\"menu-item\"><a href=\"#home\" class=\"inner-link nav-link\">Home</a></li>\n                                    <li class=\"menu-item\"><a href=\"#agency\" class=\"inner-link nav-link\">Agency</a></li>\n                                    <li class=\"menu-item\"><a href=\"#services\" class=\"inner-link nav-link\">Services</a></li>\n                                    <li class=\"menu-item\"><a href=\"#work\" class=\"inner-link nav-link\">Work</a></li>\n                                    <li class=\"menu-item\"><a href=\"#blog\" class=\"inner-link nav-link\">Blog</a></li>\n                                    <li class=\"menu-item\"><a href=\"#contact\" class=\"inner-link nav-link\">Contact</a></li>\n                                </ul>\n                            </div>\n                            <div class=\"w-90 xxl-w-100 d-none d-lg-inline-block\">\n                                <div class=\"row row-cols-1 row-cols-xl-2 menu-address\">\n                                    <div class=\"col\">\n                                        <span class=\"text-white fs-16 ls-05px\">Contact information</span>\n                                        <div class=\"h-1px w-90 lg-w-100 bg-white-transparent-extra-light mt-15px mb-15px\"></div>\n                                        <p class=\"fs-15 lh-26 w-90 xl-w-100 text-white fw-300\">14300 Kenneth Rd Suite 200,<br>Leawood, KS 66224</p>\n                                    </div>\n                                    <div class=\"col\">\n                                        <span class=\"text-white fs-16 ls-05px\">Connect with us</span>\n                                        <div class=\"h-1px w-90 xxl-w-100 bg-white-transparent-extra-light mt-15px mb-15px\"></div>\n                                        <p class=\"fs-15 lh-28 w-90 xxl-w-100 lg-mb-0 fw-300\"><a href=\"mailto:info@clearfixlabs.com\" class=\"d-block text-white text-white-hover\">info@clearfixlabs.com</a><a href=\"tel: 888 683 1337\" class=\"text-white text-white-hover\">888 683 1337</a></p>\n                                    </div>\n                                </div>\n                            </div>\n                        </div>\n                    </div>\n                    <!-- end hamburger menu -->\n        </header>\n        <!-- end header -->\n        <div class=\"position-relative\">','',1720120739,1,'n',0,'','n','n','o',0,'n','y'),
	(6,1,2,'_footer','webpage',NULL,'            <!-- start section -->\n            <section class=\"pb-4 sm-pt-30px sm-pb-40px overflow-hidden position-relative section-dark\">\n                <div class=\"container\">\n                    <div class=\"row\" data-anime=\'{ \"el\": \"childs\", \"translateY\": [0, 0], \"opacity\": [0,1], \"duration\": 500, \"delay\": 200, \"staggervalue\": 300, \"easing\": \"easeOutQuad\" }\'>\n                        <div class=\"col-sm-5 text-center text-sm-start\">\n                            <div class=\"outside-box-left-25 xl-outside-box-left-10 sm-outside-box-left-0\">\n                                <div class=\"fs-350 xl-fs-250 lg-fs-200 md-fs-170 sm-fs-100 text-cf-coal fw-600 ls-minus-20px word-break-normal\">work</div>\n                            </div>\n                        </div>\n                        <div class=\"col-sm-7 text-center text-sm-end\">\n                            <div class=\"outside-box-right-5 sm-outside-box-right-0\">\n                                <div class=\"fs-350 xl-fs-250 lg-fs-200 md-fs-170 sm-fs-100 text-cf-coal fw-600 ls-minus-20px position-relative d-inline-block word-break-normal text-white-space-nowrap\">with us\n                                    <div class=\"position-absolute left-minus-140px top-minus-140px z-index-9 xl-left-minus-110px top-minus-140px xl-top-minus-100px md-top-minus-90px z-index-9 xl-w-230px md-w-200px d-none d-md-block\" data-anime=\'{ \"translateY\": [-15, 0], \"scale\": [0.5, 1], \"opacity\": [0,1], \"duration\": 800, \"delay\": 200, \"staggervalue\": 300, \"easing\": \"easeOutQuad\" }\'>\n                                        <img src=\"images/demo-web-agency-03-v3.png\" class=\"animation-rotation\" alt=\"\">\n                                        <div class=\"absolute-middle-center w-100 z-index-minus-1\"><img src=\"images/demo-web-agency-04-v1_1.png\" alt=\"\"></div>\n                                    </div>\n                                </div>\n                            </div>\n                        </div>\n                    </div>\n                </div>\n            </section>\n            <!-- end section -->\n        </div>\n        <!-- start footer -->\n        <footer class=\"p-0\">\n            <div class=\"container\">\n                <div class=\"row align-items-center mb-4 sm-mb-6\">\n                    <div class=\"col-md-10 col-sm-8 text-center text-sm-start xs-mb-25px\">\n                        <h5 class=\"mb-0 text-cf-sky fw-400 ls-minus-1px\">Let\'s make something great!</h5>\n                    </div>\n                    <div class=\"col-md-2 col-sm-4 text-center text-sm-end\">\n                        <a href=\"demo-web-agency.html\" class=\"footer-logo d-inline-block\"><img src=\"images/logos/cf-logo-no-tag-horz.svg\" data-at2x=\"images/logos/cf-logo-no-tag-horz.svg\" alt=\"\"></a>\n                    </div>\n                </div>\n                <div class=\"row align-items-end mb-6 sm-mb-40px\">\n                    <!-- start footer column -->\n                    <div class=\"col-lg-3 col-sm-4 text-center text-sm-start xs-mb-25px last-paragraph-no-margin\">\n                        <span class=\"d-block text-cf-sky ls-minus-05px mb-5px fw-600\">Clearfix - Kansas City</span>\n                        <p class=\"w-80 lg-w-100 text-light-medium-gray fs-15 lh-28\">\n                            14300 Kenneth Rd Suite 200, Leawood, KS 66224</p>\n                    </div>\n                    <!-- end footer column -->\n\n                    <!-- start footer column -->\n                    <div class=\"col-md-3 col-sm-4 last-paragraph-no-margin ms-auto text-center text-sm-end\">\n                        <a href=\"tel:1235678901\" class=\"text-light-medium-gray d-block lh-18 text-dark-gray-hover\">\n                            888 683 1337</a>\n                        <a href=\"mailto:info@clearfixlabs.com\" class=\"text-light-medium-gray text-medium-gray-hover fw-600 text-decoration-line-bottom\">info@cleafixlabs.com</a>\n                    </div>\n                    <!-- end footer column -->\n                </div>\n            </div>\n            <div class=\"footer-bottom pt-25px pb-25px\" style=\"background-color: color(display-p3 0.11 0.114 0.121)\">\n                <div class=\"container\">\n                    <div class=\"row align-items-center\">\n                        <div class=\"col-lg-7 text-center text-lg-start md-mb-10px\">\n                            <ul class=\"footer-navbar text-light fw-600 fs-16\">\n                                <li class=\"nav-item active\"><a href=\"demo-web-agency.html\" class=\"nav-link text-light\">Home</a></li>\n                                <li class=\"nav-item\"><a href=\"demo-web-agency-about.html\" class=\"nav-link text-light\">Agency</a></li>\n                                <li class=\"nav-item\"><a href=\"demo-web-agency-expertise.html\" class=\"nav-link text-light\">Expertise</a></li>\n                                <li class=\"nav-item\"><a href=\"demo-web-agency-projects.html\" class=\"nav-link text-light\">Projects</a></li>\n                                <li class=\"nav-item\"><a href=\"demo-web-agency-people.html\" class=\"nav-link text-light\">People</a></li>\n                                <li class=\"nav-item\"><a href=\"demo-web-agency-blog.html\" class=\"nav-link text-light\">Blog</a></li>\n                                <li class=\"nav-item\"><a href=\"demo-web-agency-contact.html\" class=\"nav-link text-light\">Contact</a></li>\n                            </ul>\n                        </div>\n                        <div class=\"col-lg-5 text-center text-lg-end\">\n                            <span class=\"text-light-medium-gray fs-15\">&copy; 2024 clearfix is Proudly Powered by <a href=\"https://www.activelogic.com/\" class=\"text-decoration-line-bottom text-light-medium-gray text-light-medium-gray-hover fw-500\" target=\"_blank\">Active Logic</a></span>\n                        </div>\n                    </div>\n                </div>\n            </div>\n        </footer>\n        <!-- end footer -->\n        <!-- start sticky elements -->\n        <div class=\"sticky-wrap z-index-1 d-none d-xl-inline-block\" data-animation-delay=\"100\" data-shadow-animation=\"true\">\n            <div class=\"elements-social social-icon-style-10\">\n                <ul class=\"small-icon fw-600\">\n                    <li class=\"fs-18\">Follow us <span class=\"separator-line-1px w-30px d-inline-block align-middle ms-15px\"></span></li>\n                    <li><a class=\"facebook\" href=\"https://www.facebook.com/\" target=\"_blank\">Fb.</a> </li>\n                    <li><a class=\"dribbble\" href=\"http://www.dribbble.com\" target=\"_blank\">Dr.</a></li>\n                    <li><a class=\"twitter\" href=\"http://www.twitter.com\" target=\"_blank\">Tw.</a></li>\n                    <li><a class=\"behance\" href=\"http://www.behance.com/\" target=\"_blank\">Be.</a> </li>\n                </ul>\n            </div>\n        </div>\n        <!-- end sticky elements -->\n        <!-- start scroll progress -->\n        <div class=\"scroll-progress d-none d-xxl-block\">\n            <a href=\"#\" class=\"scroll-top\" aria-label=\"scroll\">\n                <span class=\"scroll-text\">Scroll to top</span><span class=\"scroll-line\"><span class=\"scroll-point\"></span></span>\n            </a>\n        </div>\n        <!-- end scroll progress -->\n        <!-- javascript libraries -->\n        <script type=\"text/javascript\" src=\"js/jquery.js\"></script>\n        <script type=\"text/javascript\" src=\"js/vendors.min.js\"></script>\n        <script type=\"text/javascript\" src=\"js/main.js\"></script>\n    </body>\n</html>','',1720120814,1,'n',0,'','n','n','o',0,'n','y'),
	(7,1,3,'_wrapper','webpage',NULL,'{par-header}\n\n{layout:contents}\n\n{par-footer}','',1720186122,1,'n',0,'','n','n','o',0,'n','y'),
	(8,1,2,'_nav','webpage',NULL,'','',1720119170,1,'n',0,'','n','n','o',0,'n','y'),
	(10,1,4,'index','webpage',NULL,'',NULL,1720119943,0,'n',0,'','n','n','o',0,'n','y'),
	(11,1,5,'index','webpage',NULL,'',NULL,1720119952,0,'n',0,'','n','n','o',0,'n','y'),
	(12,1,6,'index','webpage',NULL,'',NULL,1720119973,0,'n',0,'','n','n','o',0,'n','y'),
	(13,1,6,'_default_page','webpage',NULL,'{layout=\"layouts/_wrapper\"}\n\n{exp:channel:entries channel=\"default_page\"}\n\n{embed=\"global/_nav\"}\n\n{hero}\n\n{hero-blog}{snp-blog}{/hero-blog}\n{hero-standard}{snp-blog}{/hero-standard}\n{hero-home}{snp-blog}{/hero-home}\n\n{/hero}\n\n{page_builder}\n\n{blog-highlight}{snp-blog}{/blog-highlight}\n{work-highlight}{snp-work}{/work-highlight}\n{client-slider}{snp-client-slider}{/client-slider}\n{static-pages}{snp-static-pages}{/static-pages}\n\n{/page_builder}\n\n{/exp:channel:entries}','',1720186450,1,'n',0,'','n','n','o',0,'n','y');

/*!40000 ALTER TABLE `exp_templates` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_templates_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_templates_roles`;

CREATE TABLE `exp_templates_roles` (
  `role_id` int unsigned NOT NULL,
  `template_id` int unsigned NOT NULL,
  PRIMARY KEY (`template_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_templates_roles` WRITE;
/*!40000 ALTER TABLE `exp_templates_roles` DISABLE KEYS */;

INSERT INTO `exp_templates_roles` (`role_id`, `template_id`)
VALUES
	(1,3),
	(2,3),
	(3,3),
	(4,3),
	(5,3),
	(1,4),
	(2,4),
	(3,4),
	(4,4),
	(5,4),
	(2,5),
	(3,5),
	(4,5),
	(5,5),
	(2,6),
	(3,6),
	(4,6),
	(5,6),
	(2,7),
	(3,7),
	(4,7),
	(5,7),
	(2,8),
	(3,8),
	(4,8),
	(5,8),
	(1,10),
	(2,10),
	(3,10),
	(4,10),
	(5,10),
	(1,11),
	(2,11),
	(3,11),
	(4,11),
	(5,11),
	(1,12),
	(2,12),
	(3,12),
	(4,12),
	(5,12),
	(2,13),
	(3,13),
	(4,13),
	(5,13);

/*!40000 ALTER TABLE `exp_templates_roles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_throttle
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_throttle`;

CREATE TABLE `exp_throttle` (
  `throttle_id` int unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `last_activity` int unsigned NOT NULL DEFAULT '0',
  `hits` int unsigned NOT NULL,
  `locked_out` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  PRIMARY KEY (`throttle_id`),
  KEY `ip_address` (`ip_address`),
  KEY `last_activity` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_update_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_update_log`;

CREATE TABLE `exp_update_log` (
  `log_id` int unsigned NOT NULL AUTO_INCREMENT,
  `timestamp` int unsigned DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `method` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `line` int unsigned DEFAULT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_update_log` WRITE;
/*!40000 ALTER TABLE `exp_update_log` DISABLE KEYS */;

INSERT INTO `exp_update_log` (`log_id`, `timestamp`, `message`, `method`, `line`, `file`)
VALUES
	(1,1720033133,'Smartforge::add_key failed. Table \'exp_comments\' does not exist.','Smartforge::add_key',106,'/Users/jon/Herd/dev-clearfixlabs/system/ee/ExpressionEngine/Addons/comment/upd.comment.php'),
	(2,1720033133,'Smartforge::add_key failed. Table \'exp_dock_prolets\' does not exist.','Smartforge::add_key',210,'/Users/jon/Herd/dev-clearfixlabs/system/ee/ExpressionEngine/Addons/pro/upd.pro.php');

/*!40000 ALTER TABLE `exp_update_log` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_upload_prefs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_upload_prefs`;

CREATE TABLE `exp_upload_prefs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int unsigned NOT NULL DEFAULT '1',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adapter` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'local',
  `adapter_settings` text COLLATE utf8mb4_unicode_ci,
  `server_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `allowed_types` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'img',
  `allow_subfolders` enum('y','n') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `subfolders_on_top` enum('y','n') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `default_modal_view` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'list',
  `max_size` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `max_height` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `max_width` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `properties` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pre_format` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_format` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_properties` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_pre_format` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_post_format` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cat_group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `batch_location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `module_id` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_upload_prefs` WRITE;
/*!40000 ALTER TABLE `exp_upload_prefs` DISABLE KEYS */;

INSERT INTO `exp_upload_prefs` (`id`, `site_id`, `name`, `adapter`, `adapter_settings`, `server_path`, `url`, `allowed_types`, `allow_subfolders`, `subfolders_on_top`, `default_modal_view`, `max_size`, `max_height`, `max_width`, `properties`, `pre_format`, `post_format`, `file_properties`, `file_pre_format`, `file_post_format`, `cat_group`, `batch_location`, `module_id`)
VALUES
	(1,1,'Avatars','local',NULL,'{base_path}images/avatars/','{base_url}images/avatars/','img','n','y','list','50','100','100',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),
	(2,1,'Signature Attachments','local',NULL,'{base_path}images/signature_attachments/','{base_url}images/signature_attachments/','img','n','y','list','30','80','480',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),
	(3,1,'PM Attachments','local',NULL,'{base_path}images/pm_attachments/','{base_url}images/pm_attachments/','img','n','y','list','250',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),
	(4,1,'Uploads','local',NULL,'{base_path}/','{base_url}/','img|doc|archive|audio|video','n','n','list','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0);

/*!40000 ALTER TABLE `exp_upload_prefs` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exp_upload_prefs_category_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_upload_prefs_category_groups`;

CREATE TABLE `exp_upload_prefs_category_groups` (
  `upload_location_id` int unsigned NOT NULL,
  `group_id` int unsigned NOT NULL,
  PRIMARY KEY (`upload_location_id`,`group_id`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exp_upload_prefs_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exp_upload_prefs_roles`;

CREATE TABLE `exp_upload_prefs_roles` (
  `role_id` int unsigned NOT NULL,
  `upload_id` int unsigned NOT NULL,
  PRIMARY KEY (`upload_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exp_upload_prefs_roles` WRITE;
/*!40000 ALTER TABLE `exp_upload_prefs_roles` DISABLE KEYS */;

INSERT INTO `exp_upload_prefs_roles` (`role_id`, `upload_id`)
VALUES
	(5,4);

/*!40000 ALTER TABLE `exp_upload_prefs_roles` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
