# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: awatoru.mysql.us1.frbit.com (MySQL 5.7.19-log)
# Database: awatoru
# Generation Time: 2019-12-29 05:48:39 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table assetindexdata
# ------------------------------------------------------------

DROP TABLE IF EXISTS `assetindexdata`;

CREATE TABLE `assetindexdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sessionId` varchar(36) NOT NULL DEFAULT '',
  `volumeId` int(11) NOT NULL,
  `uri` text,
  `size` bigint(20) unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `recordId` int(11) DEFAULT NULL,
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `assetindexdata_sessionId_volumeId_idx` (`sessionId`,`volumeId`),
  KEY `assetindexdata_volumeId_idx` (`volumeId`),
  CONSTRAINT `assetindexdata_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table assets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `assets`;

CREATE TABLE `assets` (
  `id` int(11) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `kind` varchar(50) NOT NULL DEFAULT 'unknown',
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `size` bigint(20) unsigned DEFAULT NULL,
  `focalPoint` varchar(13) DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `assets_filename_folderId_idx` (`filename`,`folderId`),
  KEY `assets_folderId_idx` (`folderId`),
  KEY `assets_volumeId_idx` (`volumeId`),
  CONSTRAINT `assets_folderId_fk` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `assets_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `assets_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table assettransformindex
# ------------------------------------------------------------

DROP TABLE IF EXISTS `assettransformindex`;

CREATE TABLE `assettransformindex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assetId` int(11) NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `location` varchar(255) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `assettransformindex_volumeId_assetId_location_idx` (`volumeId`,`assetId`,`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table assettransforms
# ------------------------------------------------------------

DROP TABLE IF EXISTS `assettransforms`;

CREATE TABLE `assettransforms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `mode` enum('stretch','fit','crop') NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') NOT NULL DEFAULT 'center-center',
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') NOT NULL DEFAULT 'none',
  `dimensionChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `assettransforms_name_unq_idx` (`name`),
  UNIQUE KEY `assettransforms_handle_unq_idx` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `categories_groupId_idx` (`groupId`),
  KEY `categories_parentId_fk` (`parentId`),
  CONSTRAINT `categories_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `categories_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `categories_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table categorygroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `categorygroups`;

CREATE TABLE `categorygroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `categorygroups_name_idx` (`name`),
  KEY `categorygroups_handle_idx` (`handle`),
  KEY `categorygroups_structureId_idx` (`structureId`),
  KEY `categorygroups_fieldLayoutId_idx` (`fieldLayoutId`),
  KEY `categorygroups_dateDeleted_idx` (`dateDeleted`),
  CONSTRAINT `categorygroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `categorygroups_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table categorygroups_sites
# ------------------------------------------------------------

DROP TABLE IF EXISTS `categorygroups_sites`;

CREATE TABLE `categorygroups_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `categorygroups_sites_groupId_siteId_unq_idx` (`groupId`,`siteId`),
  KEY `categorygroups_sites_siteId_idx` (`siteId`),
  CONSTRAINT `categorygroups_sites_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `categorygroups_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table content
# ------------------------------------------------------------

DROP TABLE IF EXISTS `content`;

CREATE TABLE `content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_email` text,
  `field_firstName` text,
  `field_newsDescription` text,
  `field_newsTitle` text,
  `field_lastName` text,
  `field_navigationItemName` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  KEY `content_siteId_idx` (`siteId`),
  KEY `content_title_idx` (`title`),
  CONSTRAINT `content_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `content_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;

INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_email`, `field_firstName`, `field_newsDescription`, `field_newsTitle`, `field_lastName`, `field_navigationItemName`)
VALUES
	(1,1,1,'Order Form','2019-12-29 05:12:13','2019-12-29 05:12:13','41e748c0-e975-4380-bc0f-d26c4d928e79',NULL,NULL,NULL,NULL,NULL,NULL),
	(2,2,1,'Order Form','2019-12-29 05:12:13','2019-12-29 05:12:13','031d1b6e-a048-4685-9ea5-b0bba7e44255',NULL,NULL,NULL,NULL,NULL,NULL),
	(3,3,1,'Home','2019-12-29 05:12:13','2019-12-29 05:12:13','5877d3cb-35bc-4458-b346-6a4055fb4277',NULL,NULL,NULL,NULL,NULL,NULL),
	(4,4,1,'Home','2019-12-29 05:12:13','2019-12-29 05:12:13','144c40b9-10ad-4f14-9763-378631cf3338',NULL,NULL,NULL,NULL,NULL,NULL),
	(5,5,1,'Contact','2019-12-29 05:12:13','2019-12-29 05:12:13','c8f6d40a-4339-4270-9e31-e985ab609578',NULL,NULL,NULL,NULL,NULL,NULL),
	(6,6,1,'Contact','2019-12-29 05:12:13','2019-12-29 05:12:13','0a7941cc-938b-4c98-855b-7be10530377f',NULL,NULL,NULL,NULL,NULL,NULL),
	(7,7,1,NULL,'2019-12-29 05:12:13','2019-12-29 05:12:13','477ca81c-3ba9-4a4a-8e85-2e065b72a358',NULL,NULL,NULL,NULL,NULL,NULL),
	(9,9,1,'Contact','2019-12-29 05:34:11','2019-12-29 05:37:43','1f58894d-1363-48b9-a8d1-68ba9aff64a8',NULL,NULL,NULL,NULL,NULL,'Contact'),
	(10,10,1,'Contact','2019-12-29 05:34:11','2019-12-29 05:34:11','e8aab13a-3ee2-4d86-92ef-ec0dd870f6e0',NULL,NULL,NULL,NULL,NULL,'Contact'),
	(12,12,1,'Home','2019-12-29 05:34:27','2019-12-29 05:34:27','daba65f4-6a45-4455-9a82-c506ba8ad380',NULL,NULL,NULL,NULL,NULL,'Home'),
	(13,13,1,'Home','2019-12-29 05:34:27','2019-12-29 05:34:27','186bf7a7-1127-4604-9980-b493edcf3b59',NULL,NULL,NULL,NULL,NULL,'Home'),
	(15,15,1,'Order','2019-12-29 05:34:49','2019-12-29 05:34:49','7e76fb42-c228-4e08-8081-ef43776696fd',NULL,NULL,NULL,NULL,NULL,'Order'),
	(16,16,1,'Order','2019-12-29 05:34:49','2019-12-29 05:34:49','5534704d-f763-43a4-a7d7-770c7a0d56df',NULL,NULL,NULL,NULL,NULL,'Order'),
	(17,17,1,'Contact','2019-12-29 05:37:43','2019-12-29 05:37:43','9a69cf9c-592b-4484-855a-63f77c43aa29',NULL,NULL,NULL,NULL,NULL,'Contact');

/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craftidtokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craftidtokens`;

CREATE TABLE `craftidtokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `accessToken` text NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craftidtokens_userId_fk` (`userId`),
  CONSTRAINT `craftidtokens_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table deprecationerrors
# ------------------------------------------------------------

DROP TABLE IF EXISTS `deprecationerrors`;

CREATE TABLE `deprecationerrors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` smallint(6) unsigned DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `traces` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `deprecationerrors_key_fingerprint_unq_idx` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `deprecationerrors` WRITE;
/*!40000 ALTER TABLE `deprecationerrors` DISABLE KEYS */;

INSERT INTO `deprecationerrors` (`id`, `key`, `fingerprint`, `lastOccurrence`, `file`, `line`, `message`, `traces`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'craft.session.isLoggedIn()','/srv/app/awatoru/htdocs/templates/home/_entry.twig:3','2019-12-29 05:41:42','/srv/app/awatoru/htdocs/templates/home/_entry.twig',3,'craft.session.isLoggedIn() has been deprecated. Use `not craft.app.user.isGuest` instead.','[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/srv/app/awatoru/htdocs/vendor/craftcms/cms/src/web/twig/variables/UserSession.php\",\"line\":32,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"craft.session.isLoggedIn()\\\", \\\"craft.session.isLoggedIn() has been deprecated. Use `not craft.a...\\\"\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\variables\\\\UserSession\",\"file\":\"/srv/app/awatoru/htdocs/vendor/twig/twig/src/Extension/CoreExtension.php\",\"line\":1495,\"class\":\"craft\\\\web\\\\twig\\\\variables\\\\UserSession\",\"method\":\"isLoggedIn\",\"args\":null},{\"objectClass\":null,\"file\":\"/srv/app/awatoru/htdocs/vendor/craftcms/cms/src/helpers/Template.php\",\"line\":105,\"class\":null,\"method\":\"twig_get_attribute\",\"args\":\"craft\\\\web\\\\twig\\\\Environment, Twig\\\\Source, craft\\\\web\\\\twig\\\\variables\\\\UserSession, \\\"isLoggedIn\\\", ...\"},{\"objectClass\":null,\"file\":\"/srv/app/awatoru/htdocs/storage/runtime/compiled_templates/c3/c369a04b28caa1dc71800a4b7bda7ede7cee3ddd1010dce753d6d7f0196b62d1.php\",\"line\":57,\"class\":\"craft\\\\helpers\\\\Template\",\"method\":\"attribute\",\"args\":\"craft\\\\web\\\\twig\\\\Environment, Twig\\\\Source, craft\\\\web\\\\twig\\\\variables\\\\UserSession, \\\"isLoggedIn\\\", ...\"},{\"objectClass\":\"__TwigTemplate_953586aabf1f1af8991e096085c14b13468fa9a025695f608dc2e11879ec2b41\",\"file\":\"/srv/app/awatoru/htdocs/vendor/twig/twig/src/Template.php\",\"line\":184,\"class\":\"__TwigTemplate_953586aabf1f1af8991e096085c14b13468fa9a025695f608dc2e11879ec2b41\",\"method\":\"block_content\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => false, ...], [\\\"content\\\" => [__TwigTemplate_953586aabf1f1af8991e096085c14b13468fa9a025695f608dc2e11879ec2b41, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_f3e58935125caf5016f8f0af42489b52451663f1d98f9d71ae10b704c1fc2580\",\"file\":\"/srv/app/awatoru/htdocs/storage/runtime/compiled_templates/6c/6ca019d0b3c2ec6678b32f1a1a33bff79628301228bb880be8ab7778e4c8a192.php\",\"line\":76,\"class\":\"Twig\\\\Template\",\"method\":\"displayBlock\",\"args\":\"\\\"content\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => false, ...], [\\\"content\\\" => [__TwigTemplate_953586aabf1f1af8991e096085c14b13468fa9a025695f608dc2e11879ec2b41, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_f3e58935125caf5016f8f0af42489b52451663f1d98f9d71ae10b704c1fc2580\",\"file\":\"/srv/app/awatoru/htdocs/vendor/twig/twig/src/Template.php\",\"line\":407,\"class\":\"__TwigTemplate_f3e58935125caf5016f8f0af42489b52451663f1d98f9d71ae10b704c1fc2580\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => false, ...], [\\\"content\\\" => [__TwigTemplate_953586aabf1f1af8991e096085c14b13468fa9a025695f608dc2e11879ec2b41, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_f3e58935125caf5016f8f0af42489b52451663f1d98f9d71ae10b704c1fc2580\",\"file\":\"/srv/app/awatoru/htdocs/vendor/twig/twig/src/Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => false, ...], [\\\"content\\\" => [__TwigTemplate_953586aabf1f1af8991e096085c14b13468fa9a025695f608dc2e11879ec2b41, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_f3e58935125caf5016f8f0af42489b52451663f1d98f9d71ae10b704c1fc2580\",\"file\":\"/srv/app/awatoru/htdocs/storage/runtime/compiled_templates/c3/c369a04b28caa1dc71800a4b7bda7ede7cee3ddd1010dce753d6d7f0196b62d1.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => false, ...], [\\\"content\\\" => [__TwigTemplate_953586aabf1f1af8991e096085c14b13468fa9a025695f608dc2e11879ec2b41, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_953586aabf1f1af8991e096085c14b13468fa9a025695f608dc2e11879ec2b41\",\"file\":\"/srv/app/awatoru/htdocs/vendor/twig/twig/src/Template.php\",\"line\":407,\"class\":\"__TwigTemplate_953586aabf1f1af8991e096085c14b13468fa9a025695f608dc2e11879ec2b41\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => false, ...], [\\\"content\\\" => [__TwigTemplate_953586aabf1f1af8991e096085c14b13468fa9a025695f608dc2e11879ec2b41, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_953586aabf1f1af8991e096085c14b13468fa9a025695f608dc2e11879ec2b41\",\"file\":\"/srv/app/awatoru/htdocs/vendor/twig/twig/src/Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => false, ...], [\\\"content\\\" => [__TwigTemplate_953586aabf1f1af8991e096085c14b13468fa9a025695f608dc2e11879ec2b41, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_953586aabf1f1af8991e096085c14b13468fa9a025695f608dc2e11879ec2b41\",\"file\":\"/srv/app/awatoru/htdocs/vendor/twig/twig/src/Template.php\",\"line\":392,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_953586aabf1f1af8991e096085c14b13468fa9a025695f608dc2e11879ec2b41\",\"file\":\"/srv/app/awatoru/htdocs/vendor/twig/twig/src/TemplateWrapper.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"Twig\\\\TemplateWrapper\",\"file\":\"/srv/app/awatoru/htdocs/vendor/twig/twig/src/Environment.php\",\"line\":318,\"class\":\"Twig\\\\TemplateWrapper\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"/srv/app/awatoru/htdocs/vendor/craftcms/cms/src/web/View.php\",\"line\":344,\"class\":\"Twig\\\\Environment\",\"method\":\"render\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/srv/app/awatoru/htdocs/vendor/craftcms/cms/src/web/View.php\",\"line\":393,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/srv/app/awatoru/htdocs/vendor/craftcms/cms/src/web/Controller.php\",\"line\":243,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/srv/app/awatoru/htdocs/vendor/craftcms/cms/src/controllers/TemplatesController.php\",\"line\":101,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"/srv/app/awatoru/htdocs/vendor/yiisoft/yii2/base/InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"/srv/app/awatoru/htdocs/vendor/yiisoft/yii2/base/Controller.php\",\"line\":157,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/srv/app/awatoru/htdocs/vendor/craftcms/cms/src/web/Controller.php\",\"line\":187,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/srv/app/awatoru/htdocs/vendor/yiisoft/yii2/base/Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/srv/app/awatoru/htdocs/vendor/craftcms/cms/src/web/Application.php\",\"line\":299,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/srv/app/awatoru/htdocs/vendor/yiisoft/yii2/web/Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/srv/app/awatoru/htdocs/vendor/craftcms/cms/src/web/Application.php\",\"line\":284,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/srv/app/awatoru/htdocs/vendor/yiisoft/yii2/base/Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/srv/app/awatoru/htdocs/web/index.php\",\"line\":21,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]','2019-12-29 05:41:42','2019-12-29 05:41:42','c0b56dcb-bedf-4919-84e6-14889c71f110'),
	(2,'ElementQuery::getIterator()','/srv/app/awatoru/htdocs/templates/home/_entry.twig:36','2019-12-29 05:41:42','/srv/app/awatoru/htdocs/templates/home/_entry.twig',36,'Looping through element queries directly has been deprecated. Use the all() function to fetch the query results before looping over them.','[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/srv/app/awatoru/htdocs/vendor/craftcms/cms/src/elements/db/ElementQuery.php\",\"line\":584,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\MatrixBlockQuery\",\"file\":\"/srv/app/awatoru/htdocs/storage/runtime/compiled_templates/c3/c369a04b28caa1dc71800a4b7bda7ede7cee3ddd1010dce753d6d7f0196b62d1.php\",\"line\":128,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":\"__TwigTemplate_953586aabf1f1af8991e096085c14b13468fa9a025695f608dc2e11879ec2b41\",\"file\":\"/srv/app/awatoru/htdocs/vendor/twig/twig/src/Template.php\",\"line\":184,\"class\":\"__TwigTemplate_953586aabf1f1af8991e096085c14b13468fa9a025695f608dc2e11879ec2b41\",\"method\":\"block_content\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => false, ...], [\\\"content\\\" => [__TwigTemplate_953586aabf1f1af8991e096085c14b13468fa9a025695f608dc2e11879ec2b41, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_f3e58935125caf5016f8f0af42489b52451663f1d98f9d71ae10b704c1fc2580\",\"file\":\"/srv/app/awatoru/htdocs/storage/runtime/compiled_templates/6c/6ca019d0b3c2ec6678b32f1a1a33bff79628301228bb880be8ab7778e4c8a192.php\",\"line\":76,\"class\":\"Twig\\\\Template\",\"method\":\"displayBlock\",\"args\":\"\\\"content\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => false, ...], [\\\"content\\\" => [__TwigTemplate_953586aabf1f1af8991e096085c14b13468fa9a025695f608dc2e11879ec2b41, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_f3e58935125caf5016f8f0af42489b52451663f1d98f9d71ae10b704c1fc2580\",\"file\":\"/srv/app/awatoru/htdocs/vendor/twig/twig/src/Template.php\",\"line\":407,\"class\":\"__TwigTemplate_f3e58935125caf5016f8f0af42489b52451663f1d98f9d71ae10b704c1fc2580\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => false, ...], [\\\"content\\\" => [__TwigTemplate_953586aabf1f1af8991e096085c14b13468fa9a025695f608dc2e11879ec2b41, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_f3e58935125caf5016f8f0af42489b52451663f1d98f9d71ae10b704c1fc2580\",\"file\":\"/srv/app/awatoru/htdocs/vendor/twig/twig/src/Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => false, ...], [\\\"content\\\" => [__TwigTemplate_953586aabf1f1af8991e096085c14b13468fa9a025695f608dc2e11879ec2b41, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_f3e58935125caf5016f8f0af42489b52451663f1d98f9d71ae10b704c1fc2580\",\"file\":\"/srv/app/awatoru/htdocs/storage/runtime/compiled_templates/c3/c369a04b28caa1dc71800a4b7bda7ede7cee3ddd1010dce753d6d7f0196b62d1.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => false, ...], [\\\"content\\\" => [__TwigTemplate_953586aabf1f1af8991e096085c14b13468fa9a025695f608dc2e11879ec2b41, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_953586aabf1f1af8991e096085c14b13468fa9a025695f608dc2e11879ec2b41\",\"file\":\"/srv/app/awatoru/htdocs/vendor/twig/twig/src/Template.php\",\"line\":407,\"class\":\"__TwigTemplate_953586aabf1f1af8991e096085c14b13468fa9a025695f608dc2e11879ec2b41\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => false, ...], [\\\"content\\\" => [__TwigTemplate_953586aabf1f1af8991e096085c14b13468fa9a025695f608dc2e11879ec2b41, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_953586aabf1f1af8991e096085c14b13468fa9a025695f608dc2e11879ec2b41\",\"file\":\"/srv/app/awatoru/htdocs/vendor/twig/twig/src/Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => false, ...], [\\\"content\\\" => [__TwigTemplate_953586aabf1f1af8991e096085c14b13468fa9a025695f608dc2e11879ec2b41, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_953586aabf1f1af8991e096085c14b13468fa9a025695f608dc2e11879ec2b41\",\"file\":\"/srv/app/awatoru/htdocs/vendor/twig/twig/src/Template.php\",\"line\":392,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_953586aabf1f1af8991e096085c14b13468fa9a025695f608dc2e11879ec2b41\",\"file\":\"/srv/app/awatoru/htdocs/vendor/twig/twig/src/TemplateWrapper.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"Twig\\\\TemplateWrapper\",\"file\":\"/srv/app/awatoru/htdocs/vendor/twig/twig/src/Environment.php\",\"line\":318,\"class\":\"Twig\\\\TemplateWrapper\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"/srv/app/awatoru/htdocs/vendor/craftcms/cms/src/web/View.php\",\"line\":344,\"class\":\"Twig\\\\Environment\",\"method\":\"render\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/srv/app/awatoru/htdocs/vendor/craftcms/cms/src/web/View.php\",\"line\":393,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/srv/app/awatoru/htdocs/vendor/craftcms/cms/src/web/Controller.php\",\"line\":243,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/srv/app/awatoru/htdocs/vendor/craftcms/cms/src/controllers/TemplatesController.php\",\"line\":101,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"/srv/app/awatoru/htdocs/vendor/yiisoft/yii2/base/InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"/srv/app/awatoru/htdocs/vendor/yiisoft/yii2/base/Controller.php\",\"line\":157,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/srv/app/awatoru/htdocs/vendor/craftcms/cms/src/web/Controller.php\",\"line\":187,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/srv/app/awatoru/htdocs/vendor/yiisoft/yii2/base/Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/srv/app/awatoru/htdocs/vendor/craftcms/cms/src/web/Application.php\",\"line\":299,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/srv/app/awatoru/htdocs/vendor/yiisoft/yii2/web/Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/srv/app/awatoru/htdocs/vendor/craftcms/cms/src/web/Application.php\",\"line\":284,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/srv/app/awatoru/htdocs/vendor/yiisoft/yii2/base/Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/srv/app/awatoru/htdocs/web/index.php\",\"line\":21,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]','2019-12-29 05:41:42','2019-12-29 05:41:42','e921a64a-ed24-41ff-bdfc-58869fa454e7'),
	(19,'ElementQuery::getIterator()','/srv/app/awatoru/htdocs/templates/_header.twig:29','2019-12-29 05:41:42','/srv/app/awatoru/htdocs/templates/_header.twig',29,'Looping through element queries directly has been deprecated. Use the all() function to fetch the query results before looping over them.','[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/srv/app/awatoru/htdocs/vendor/craftcms/cms/src/elements/db/ElementQuery.php\",\"line\":584,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\EntryQuery\",\"file\":\"/srv/app/awatoru/htdocs/storage/runtime/compiled_templates/33/334ac9cf31054996b986c7f12b30b2e272907cf7c21bffccba8b1c9d111ce00c.php\",\"line\":71,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":\"__TwigTemplate_7c1b4b7ccc3ef6179390643be8e0e108be9363cc1b415e9900afc6b4c0e519ff\",\"file\":\"/srv/app/awatoru/htdocs/vendor/twig/twig/src/Template.php\",\"line\":407,\"class\":\"__TwigTemplate_7c1b4b7ccc3ef6179390643be8e0e108be9363cc1b415e9900afc6b4c0e519ff\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => false, ...], []\"},{\"objectClass\":\"__TwigTemplate_7c1b4b7ccc3ef6179390643be8e0e108be9363cc1b415e9900afc6b4c0e519ff\",\"file\":\"/srv/app/awatoru/htdocs/vendor/twig/twig/src/Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => false, ...], []\"},{\"objectClass\":\"__TwigTemplate_7c1b4b7ccc3ef6179390643be8e0e108be9363cc1b415e9900afc6b4c0e519ff\",\"file\":\"/srv/app/awatoru/htdocs/storage/runtime/compiled_templates/6c/6ca019d0b3c2ec6678b32f1a1a33bff79628301228bb880be8ab7778e4c8a192.php\",\"line\":71,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => false, ...]\"},{\"objectClass\":\"__TwigTemplate_f3e58935125caf5016f8f0af42489b52451663f1d98f9d71ae10b704c1fc2580\",\"file\":\"/srv/app/awatoru/htdocs/vendor/twig/twig/src/Template.php\",\"line\":407,\"class\":\"__TwigTemplate_f3e58935125caf5016f8f0af42489b52451663f1d98f9d71ae10b704c1fc2580\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => false, ...], [\\\"content\\\" => [__TwigTemplate_953586aabf1f1af8991e096085c14b13468fa9a025695f608dc2e11879ec2b41, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_f3e58935125caf5016f8f0af42489b52451663f1d98f9d71ae10b704c1fc2580\",\"file\":\"/srv/app/awatoru/htdocs/vendor/twig/twig/src/Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => false, ...], [\\\"content\\\" => [__TwigTemplate_953586aabf1f1af8991e096085c14b13468fa9a025695f608dc2e11879ec2b41, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_f3e58935125caf5016f8f0af42489b52451663f1d98f9d71ae10b704c1fc2580\",\"file\":\"/srv/app/awatoru/htdocs/storage/runtime/compiled_templates/c3/c369a04b28caa1dc71800a4b7bda7ede7cee3ddd1010dce753d6d7f0196b62d1.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => false, ...], [\\\"content\\\" => [__TwigTemplate_953586aabf1f1af8991e096085c14b13468fa9a025695f608dc2e11879ec2b41, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_953586aabf1f1af8991e096085c14b13468fa9a025695f608dc2e11879ec2b41\",\"file\":\"/srv/app/awatoru/htdocs/vendor/twig/twig/src/Template.php\",\"line\":407,\"class\":\"__TwigTemplate_953586aabf1f1af8991e096085c14b13468fa9a025695f608dc2e11879ec2b41\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => false, ...], [\\\"content\\\" => [__TwigTemplate_953586aabf1f1af8991e096085c14b13468fa9a025695f608dc2e11879ec2b41, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_953586aabf1f1af8991e096085c14b13468fa9a025695f608dc2e11879ec2b41\",\"file\":\"/srv/app/awatoru/htdocs/vendor/twig/twig/src/Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => false, ...], [\\\"content\\\" => [__TwigTemplate_953586aabf1f1af8991e096085c14b13468fa9a025695f608dc2e11879ec2b41, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_953586aabf1f1af8991e096085c14b13468fa9a025695f608dc2e11879ec2b41\",\"file\":\"/srv/app/awatoru/htdocs/vendor/twig/twig/src/Template.php\",\"line\":392,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_953586aabf1f1af8991e096085c14b13468fa9a025695f608dc2e11879ec2b41\",\"file\":\"/srv/app/awatoru/htdocs/vendor/twig/twig/src/TemplateWrapper.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"Twig\\\\TemplateWrapper\",\"file\":\"/srv/app/awatoru/htdocs/vendor/twig/twig/src/Environment.php\",\"line\":318,\"class\":\"Twig\\\\TemplateWrapper\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"/srv/app/awatoru/htdocs/vendor/craftcms/cms/src/web/View.php\",\"line\":344,\"class\":\"Twig\\\\Environment\",\"method\":\"render\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/srv/app/awatoru/htdocs/vendor/craftcms/cms/src/web/View.php\",\"line\":393,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/srv/app/awatoru/htdocs/vendor/craftcms/cms/src/web/Controller.php\",\"line\":243,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/srv/app/awatoru/htdocs/vendor/craftcms/cms/src/controllers/TemplatesController.php\",\"line\":101,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"/srv/app/awatoru/htdocs/vendor/yiisoft/yii2/base/InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"/srv/app/awatoru/htdocs/vendor/yiisoft/yii2/base/Controller.php\",\"line\":157,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/srv/app/awatoru/htdocs/vendor/craftcms/cms/src/web/Controller.php\",\"line\":187,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/srv/app/awatoru/htdocs/vendor/yiisoft/yii2/base/Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/srv/app/awatoru/htdocs/vendor/craftcms/cms/src/web/Application.php\",\"line\":299,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/srv/app/awatoru/htdocs/vendor/yiisoft/yii2/web/Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/srv/app/awatoru/htdocs/vendor/craftcms/cms/src/web/Application.php\",\"line\":284,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/srv/app/awatoru/htdocs/vendor/yiisoft/yii2/base/Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/srv/app/awatoru/htdocs/web/index.php\",\"line\":21,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]','2019-12-29 05:41:42','2019-12-29 05:41:42','92bb10c8-c94e-4c10-a186-be53a40fbc97');

/*!40000 ALTER TABLE `deprecationerrors` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table drafts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `drafts`;

CREATE TABLE `drafts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sourceId` int(11) DEFAULT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `notes` text,
  PRIMARY KEY (`id`),
  KEY `drafts_creatorId_fk` (`creatorId`),
  KEY `drafts_sourceId_fk` (`sourceId`),
  CONSTRAINT `drafts_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `drafts_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table elementindexsettings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `elementindexsettings`;

CREATE TABLE `elementindexsettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `elementindexsettings_type_unq_idx` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table elements
# ------------------------------------------------------------

DROP TABLE IF EXISTS `elements`;

CREATE TABLE `elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `draftId` int(11) DEFAULT NULL,
  `revisionId` int(11) DEFAULT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `elements_dateDeleted_idx` (`dateDeleted`),
  KEY `elements_fieldLayoutId_idx` (`fieldLayoutId`),
  KEY `elements_type_idx` (`type`),
  KEY `elements_enabled_idx` (`enabled`),
  KEY `elements_archived_dateCreated_idx` (`archived`,`dateCreated`),
  KEY `elements_draftId_fk` (`draftId`),
  KEY `elements_revisionId_fk` (`revisionId`),
  CONSTRAINT `elements_draftId_fk` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `elements_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `elements_revisionId_fk` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;

INSERT INTO `elements` (`id`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`)
VALUES
	(1,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2019-12-29 05:12:13','2019-12-29 05:12:13',NULL,'53691055-ab7a-467b-b0d8-f9dcfd32f924'),
	(2,NULL,1,1,'craft\\elements\\Entry',1,0,'2019-12-29 05:12:13','2019-12-29 05:12:13',NULL,'8eee489b-0b52-4ebd-b5e9-c5476c3e1349'),
	(3,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2019-12-29 05:12:13','2019-12-29 05:12:13',NULL,'f6554d2e-9834-49c7-b8ff-45c894b18686'),
	(4,NULL,2,2,'craft\\elements\\Entry',1,0,'2019-12-29 05:12:13','2019-12-29 05:12:13',NULL,'901653c5-54da-4eef-b8f0-26fe28203d95'),
	(5,NULL,NULL,NULL,'craft\\elements\\Entry',1,0,'2019-12-29 05:12:13','2019-12-29 05:12:13',NULL,'622b21e2-2263-4f80-b704-46c223dabff7'),
	(6,NULL,3,NULL,'craft\\elements\\Entry',1,0,'2019-12-29 05:12:13','2019-12-29 05:12:13',NULL,'e617ea87-cab1-4c08-aaa6-cba25b7cb225'),
	(7,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2019-12-29 05:12:13','2019-12-29 05:12:13',NULL,'6a3f3fc2-2e91-4bda-8064-acd13088fd66'),
	(9,NULL,NULL,7,'craft\\elements\\Entry',1,0,'2019-12-29 05:34:11','2019-12-29 05:37:43',NULL,'69d8b91f-a2be-49c6-b9a0-350da91f3072'),
	(10,NULL,4,7,'craft\\elements\\Entry',1,0,'2019-12-29 05:34:11','2019-12-29 05:34:11',NULL,'59199d4a-2dc5-4d70-8120-8990146431be'),
	(12,NULL,NULL,7,'craft\\elements\\Entry',1,0,'2019-12-29 05:34:27','2019-12-29 05:34:27',NULL,'77e1a5f0-a464-4d7d-9440-5874dc176f4a'),
	(13,NULL,5,7,'craft\\elements\\Entry',1,0,'2019-12-29 05:34:27','2019-12-29 05:34:27',NULL,'9b05a6e3-f691-4af8-980d-bd7b16ef18a4'),
	(15,NULL,NULL,7,'craft\\elements\\Entry',1,0,'2019-12-29 05:34:49','2019-12-29 05:34:49',NULL,'130cbe4c-319f-4a3c-b026-12e35cd40c67'),
	(16,NULL,6,7,'craft\\elements\\Entry',1,0,'2019-12-29 05:34:49','2019-12-29 05:34:49',NULL,'44d8afe4-32d9-4572-b80c-d1eb10092182'),
	(17,NULL,7,7,'craft\\elements\\Entry',1,0,'2019-12-29 05:37:43','2019-12-29 05:37:43',NULL,'82e804e5-314e-482e-9b15-ec8cb634dbe8');

/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table elements_sites
# ------------------------------------------------------------

DROP TABLE IF EXISTS `elements_sites`;

CREATE TABLE `elements_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `elements_sites_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  KEY `elements_sites_siteId_idx` (`siteId`),
  KEY `elements_sites_slug_siteId_idx` (`slug`,`siteId`),
  KEY `elements_sites_enabled_idx` (`enabled`),
  KEY `elements_sites_uri_siteId_idx` (`uri`,`siteId`),
  CONSTRAINT `elements_sites_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `elements_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `elements_sites` WRITE;
/*!40000 ALTER TABLE `elements_sites` DISABLE KEYS */;

INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,1,'order-form','order',1,'2019-12-29 05:12:13','2019-12-29 05:12:13','9df71059-eec6-46aa-b788-e0d6638b50a3'),
	(2,2,1,'order-form','order',1,'2019-12-29 05:12:13','2019-12-29 05:12:13','0b691fea-bee9-481b-bca1-f8e5e77e4a8d'),
	(3,3,1,'home','__home__',1,'2019-12-29 05:12:13','2019-12-29 05:12:13','4cc0a010-fb6e-4e2d-ad7c-5c592cd9ab65'),
	(4,4,1,'home','__home__',1,'2019-12-29 05:12:13','2019-12-29 05:12:13','3291b8e1-2cd8-4244-8d65-c72e5f781979'),
	(5,5,1,'contact','contact',1,'2019-12-29 05:12:13','2019-12-29 05:12:13','7b1fbe6b-d4d0-4eb7-a3b3-3ae93386dc9f'),
	(6,6,1,'contact','contact',1,'2019-12-29 05:12:13','2019-12-29 05:12:13','14a009e9-93b3-4241-a492-d0ac10309a62'),
	(7,7,1,NULL,NULL,1,'2019-12-29 05:12:13','2019-12-29 05:12:13','10d33d99-2d55-4658-92d6-e3da8a095f14'),
	(9,9,1,'contact',NULL,1,'2019-12-29 05:34:11','2019-12-29 05:34:11','cc8955d5-02f9-4247-ac81-28cfacdeaa03'),
	(10,10,1,'contact',NULL,1,'2019-12-29 05:34:11','2019-12-29 05:34:11','91839be8-35e1-402f-9fd1-e7f5b35de81b'),
	(12,12,1,'home',NULL,1,'2019-12-29 05:34:27','2019-12-29 05:34:27','5e4b0c26-18c2-4c31-ab10-753f7a51de46'),
	(13,13,1,'home',NULL,1,'2019-12-29 05:34:27','2019-12-29 05:34:27','e75a0344-f4ae-4d5f-a47d-dad31795b4e0'),
	(15,15,1,'order',NULL,1,'2019-12-29 05:34:49','2019-12-29 05:34:49','fa65790c-0d4a-4471-8954-01551fa3d880'),
	(16,16,1,'order',NULL,1,'2019-12-29 05:34:49','2019-12-29 05:34:49','0d63f856-554a-400e-a456-1100f3fc8f6c'),
	(17,17,1,'contact',NULL,1,'2019-12-29 05:37:43','2019-12-29 05:37:43','8b233ea8-cd26-4caf-ad8b-9b15d49705da');

/*!40000 ALTER TABLE `elements_sites` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table entries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `entries`;

CREATE TABLE `entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `typeId` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `entries_postDate_idx` (`postDate`),
  KEY `entries_expiryDate_idx` (`expiryDate`),
  KEY `entries_authorId_idx` (`authorId`),
  KEY `entries_sectionId_idx` (`sectionId`),
  KEY `entries_typeId_idx` (`typeId`),
  KEY `entries_parentId_fk` (`parentId`),
  CONSTRAINT `entries_authorId_fk` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `entries_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `entries_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `entries_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `entries_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;

INSERT INTO `entries` (`id`, `sectionId`, `parentId`, `typeId`, `authorId`, `postDate`, `expiryDate`, `deletedWithEntryType`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,NULL,1,NULL,'2019-12-29 05:12:00',NULL,NULL,'2019-12-29 05:12:13','2019-12-29 05:12:13','7404dde3-d9c7-4012-a1f9-e8cb62cd6a6a'),
	(2,1,NULL,1,NULL,'2019-12-29 05:12:00',NULL,NULL,'2019-12-29 05:12:13','2019-12-29 05:12:13','3f0b5fe8-3c9a-4402-aef0-48d5b0463ad5'),
	(3,2,NULL,2,NULL,'2019-12-29 05:12:00',NULL,NULL,'2019-12-29 05:12:13','2019-12-29 05:12:13','7d65ccd1-315f-4004-840c-8aed338f9fef'),
	(4,2,NULL,2,NULL,'2019-12-29 05:12:00',NULL,NULL,'2019-12-29 05:12:13','2019-12-29 05:12:13','e37873ac-5bb4-4fc3-a978-bdff6f4b9cb5'),
	(5,5,NULL,4,NULL,'2019-12-29 05:12:00',NULL,NULL,'2019-12-29 05:12:13','2019-12-29 05:12:13','ffd64ac2-eb26-4168-9cd2-be57da04866c'),
	(6,5,NULL,4,NULL,'2019-12-29 05:12:00',NULL,NULL,'2019-12-29 05:12:13','2019-12-29 05:12:13','d3c79b26-1707-41a1-8563-2856320622d5'),
	(9,6,NULL,6,7,'2019-12-29 05:33:00',NULL,NULL,'2019-12-29 05:34:11','2019-12-29 05:34:11','94a54c5d-f623-4067-81aa-28dc9684c4cc'),
	(10,6,NULL,6,7,'2019-12-29 05:33:00',NULL,NULL,'2019-12-29 05:34:11','2019-12-29 05:34:11','c12f478a-f805-4330-922b-335ab51bad05'),
	(12,6,NULL,6,7,'2019-12-29 05:34:00',NULL,NULL,'2019-12-29 05:34:27','2019-12-29 05:34:27','4ee4a14c-1812-45c7-8200-b851b8e129b1'),
	(13,6,NULL,6,7,'2019-12-29 05:34:00',NULL,NULL,'2019-12-29 05:34:27','2019-12-29 05:34:27','29aea119-ea6c-4022-bcd9-96c2158147ea'),
	(15,6,NULL,6,7,'2019-12-29 05:34:00',NULL,NULL,'2019-12-29 05:34:49','2019-12-29 05:34:49','bf170b03-4be3-40a8-bb84-ac3ced2af91a'),
	(16,6,NULL,6,7,'2019-12-29 05:34:00',NULL,NULL,'2019-12-29 05:34:49','2019-12-29 05:34:49','7a9ed619-9967-468a-8599-e4d150bdadff'),
	(17,6,NULL,6,7,'2019-12-29 05:33:00',NULL,NULL,'2019-12-29 05:37:43','2019-12-29 05:37:43','25437c13-e4dc-41eb-b16f-c26ae763e17e');

/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table entrytypes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `entrytypes`;

CREATE TABLE `entrytypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleLabel` varchar(255) DEFAULT 'Title',
  `titleFormat` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `entrytypes_name_sectionId_idx` (`name`,`sectionId`),
  KEY `entrytypes_handle_sectionId_idx` (`handle`,`sectionId`),
  KEY `entrytypes_sectionId_idx` (`sectionId`),
  KEY `entrytypes_fieldLayoutId_idx` (`fieldLayoutId`),
  KEY `entrytypes_dateDeleted_idx` (`dateDeleted`),
  CONSTRAINT `entrytypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `entrytypes_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `entrytypes` WRITE;
/*!40000 ALTER TABLE `entrytypes` DISABLE KEYS */;

INSERT INTO `entrytypes` (`id`, `sectionId`, `fieldLayoutId`, `name`, `handle`, `hasTitleField`, `titleLabel`, `titleFormat`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`)
VALUES
	(1,1,1,'Order Form','orderForm',0,NULL,'{section.name|raw}',1,'2019-12-29 05:12:13','2019-12-29 05:12:13',NULL,'65959724-a677-4bbf-b3c5-7053f5fdd9e9'),
	(2,2,2,'Home','home',0,NULL,'{section.name|raw}',1,'2019-12-29 05:12:13','2019-12-29 05:12:13',NULL,'1efb8a72-3c56-462d-9a85-0c686962f8cb'),
	(3,3,3,'News','news',1,'Title','',1,'2019-12-29 05:12:13','2019-12-29 05:12:13',NULL,'a39dd88a-bcfb-456b-a070-327b5b514111'),
	(4,5,NULL,'Contact','contact',0,NULL,'{section.name|raw}',1,'2019-12-29 05:12:13','2019-12-29 05:12:13',NULL,'819facc5-de6d-46f5-bb81-bb1982b4b5e8'),
	(5,4,NULL,'Products','products',1,'Title',NULL,1,'2019-12-29 05:12:13','2019-12-29 05:12:13',NULL,'3c5453b2-9842-4725-9430-cf7723a09c1f'),
	(6,6,7,'Navigation Menu','navigationMenu',1,'Title','',1,'2019-12-29 05:31:43','2019-12-29 05:33:47',NULL,'1055eb79-56f9-41b3-b477-33365fac6983');

/*!40000 ALTER TABLE `entrytypes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table fieldgroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fieldgroups`;

CREATE TABLE `fieldgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `fieldgroups_name_unq_idx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `fieldgroups` WRITE;
/*!40000 ALTER TABLE `fieldgroups` DISABLE KEYS */;

INSERT INTO `fieldgroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'News feed','2019-12-29 05:12:12','2019-12-29 05:12:12','335454c1-7446-4c14-b7af-251dcc1e3a22'),
	(2,'Products','2019-12-29 05:12:12','2019-12-29 05:12:12','4b000de0-c332-4c52-806f-0b6adf2a6140'),
	(3,'Order Form','2019-12-29 05:12:12','2019-12-29 05:12:12','55709eb1-437b-45bb-94b7-e6328204f455'),
	(4,'Users','2019-12-29 05:12:12','2019-12-29 05:12:12','7a701a6e-72c8-4d5b-ac96-2830c462a6ea'),
	(5,'Common','2019-12-29 05:12:12','2019-12-29 05:12:12','8ee3bcf1-2ef7-4684-bdc0-ce8ed5a1a3b1'),
	(6,'News','2019-12-29 05:12:12','2019-12-29 05:12:12','a3e62c01-c6b9-47f6-9904-6db8c24f0b71'),
	(7,'Navigation','2019-12-29 05:31:56','2019-12-29 05:31:56','70f64b48-8b55-4750-bca7-5656ba7dbda4');

/*!40000 ALTER TABLE `fieldgroups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table fieldlayoutfields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fieldlayoutfields`;

CREATE TABLE `fieldlayoutfields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `fieldlayoutfields_layoutId_fieldId_unq_idx` (`layoutId`,`fieldId`),
  KEY `fieldlayoutfields_sortOrder_idx` (`sortOrder`),
  KEY `fieldlayoutfields_tabId_idx` (`tabId`),
  KEY `fieldlayoutfields_fieldId_idx` (`fieldId`),
  CONSTRAINT `fieldlayoutfields_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fieldlayoutfields_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fieldlayoutfields_tabId_fk` FOREIGN KEY (`tabId`) REFERENCES `fieldlayouttabs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `fieldlayoutfields` WRITE;
/*!40000 ALTER TABLE `fieldlayoutfields` DISABLE KEYS */;

INSERT INTO `fieldlayoutfields` (`id`, `layoutId`, `tabId`, `fieldId`, `required`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,1,1,0,1,'2019-12-29 05:12:13','2019-12-29 05:12:13','1c7c08d1-3c82-47d9-8625-47d090371503'),
	(2,2,2,6,0,1,'2019-12-29 05:12:13','2019-12-29 05:12:13','11699055-0c48-4593-82fd-c48d4ce000b8'),
	(3,3,3,2,0,2,'2019-12-29 05:12:13','2019-12-29 05:12:13','add058ea-1383-4bb5-84bd-2f4bbde1b227'),
	(4,3,3,5,0,1,'2019-12-29 05:12:13','2019-12-29 05:12:13','7d6b0bcf-735c-4ff3-b8d9-8ec6610cbae7'),
	(5,3,3,7,0,3,'2019-12-29 05:12:13','2019-12-29 05:12:13','cfde30ed-01d8-44d9-b3fc-3e84c36b2f8a'),
	(6,4,4,9,0,2,'2019-12-29 05:12:13','2019-12-29 05:12:13','965fcd6f-93f0-4b36-9306-1aec0e3f4fbc'),
	(7,4,4,10,0,1,'2019-12-29 05:12:13','2019-12-29 05:12:13','87019d05-95b9-449f-bf01-d0dc35e656aa'),
	(8,4,4,11,0,3,'2019-12-29 05:12:13','2019-12-29 05:12:13','59af4cb8-d362-4ad5-9618-a14266dcb733'),
	(9,5,5,12,0,2,'2019-12-29 05:12:13','2019-12-29 05:12:13','4d644b08-f65b-4576-af12-d81dab51673d'),
	(10,5,5,13,0,1,'2019-12-29 05:12:13','2019-12-29 05:12:13','0079ba15-2e4d-4981-beb6-0ec1820276a3'),
	(11,5,5,14,0,4,'2019-12-29 05:12:13','2019-12-29 05:12:13','8c06f0d4-34cf-49f3-a638-8f7d30eb9482'),
	(12,5,5,15,0,3,'2019-12-29 05:12:13','2019-12-29 05:12:13','42c4384a-306e-404c-8f88-238042b31c1c'),
	(13,6,6,3,0,1,'2019-12-29 05:12:13','2019-12-29 05:12:13','bc1bf3c8-383d-4275-bfde-842a42280047'),
	(14,6,6,4,0,2,'2019-12-29 05:12:13','2019-12-29 05:12:13','723b6de7-adca-4b57-b460-556bde227808'),
	(15,6,6,8,0,3,'2019-12-29 05:12:13','2019-12-29 05:12:13','8527a826-17fd-4897-a7ce-0c5dc90e7e08'),
	(16,7,7,16,0,2,'2019-12-29 05:33:47','2019-12-29 05:33:47','01939423-8234-4fd7-978e-403ecf367037'),
	(17,7,7,17,0,1,'2019-12-29 05:33:47','2019-12-29 05:33:47','75e9cdff-08b7-4027-92f7-c398332a6b2c');

/*!40000 ALTER TABLE `fieldlayoutfields` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table fieldlayouts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fieldlayouts`;

CREATE TABLE `fieldlayouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fieldlayouts_dateDeleted_idx` (`dateDeleted`),
  KEY `fieldlayouts_type_idx` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `fieldlayouts` WRITE;
/*!40000 ALTER TABLE `fieldlayouts` DISABLE KEYS */;

INSERT INTO `fieldlayouts` (`id`, `type`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`)
VALUES
	(1,'craft\\elements\\Entry','2019-12-29 05:12:13','2019-12-29 05:12:13',NULL,'001227e4-823c-493a-b92f-a6c42dfb0562'),
	(2,'craft\\elements\\Entry','2019-12-29 05:12:13','2019-12-29 05:12:13',NULL,'989b76e3-f78d-46ba-a27c-f012bff692fb'),
	(3,'craft\\elements\\Entry','2019-12-29 05:12:13','2019-12-29 05:12:13',NULL,'8b4a0618-795f-442f-acab-4c299884450d'),
	(4,'craft\\elements\\MatrixBlock','2019-12-29 05:12:13','2019-12-29 05:12:13',NULL,'4c73fc9b-af2e-4e6a-bab9-513aa4d634be'),
	(5,'craft\\elements\\MatrixBlock','2019-12-29 05:12:13','2019-12-29 05:12:13',NULL,'9ffa248a-8c2d-445c-8841-f9c32332c923'),
	(6,'craft\\elements\\User','2019-12-29 05:12:13','2019-12-29 05:12:13',NULL,'ac1b6471-20fc-4144-bd87-acdae5219a90'),
	(7,'craft\\elements\\Entry','2019-12-29 05:33:47','2019-12-29 05:33:47',NULL,'d2bf81e4-2cf3-4bb7-948b-b857c0d11270');

/*!40000 ALTER TABLE `fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table fieldlayouttabs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fieldlayouttabs`;

CREATE TABLE `fieldlayouttabs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fieldlayouttabs_sortOrder_idx` (`sortOrder`),
  KEY `fieldlayouttabs_layoutId_idx` (`layoutId`),
  CONSTRAINT `fieldlayouttabs_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `fieldlayouttabs` WRITE;
/*!40000 ALTER TABLE `fieldlayouttabs` DISABLE KEYS */;

INSERT INTO `fieldlayouttabs` (`id`, `layoutId`, `name`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,'Tab 1',1,'2019-12-29 05:12:13','2019-12-29 05:12:13','cb4267be-01a8-4558-b523-f7ab7a28b43e'),
	(2,2,'Tab 1',1,'2019-12-29 05:12:13','2019-12-29 05:12:13','3902bc74-4c94-4dad-850a-db33c42dc14c'),
	(3,3,'News',1,'2019-12-29 05:12:13','2019-12-29 05:12:13','8ba29cca-8648-4819-9863-eb88016f7a09'),
	(4,4,'Content',1,'2019-12-29 05:12:13','2019-12-29 05:12:13','e9b1b25c-c997-48c1-b737-68f046fc8a39'),
	(5,5,'Content',1,'2019-12-29 05:12:13','2019-12-29 05:12:13','2cde1877-47d4-403e-9a58-bfe1c72316b9'),
	(6,6,'Users',1,'2019-12-29 05:12:13','2019-12-29 05:12:13','45d88662-bebd-4923-97bb-ed9a9ed9b90e'),
	(7,7,'Navigation',1,'2019-12-29 05:33:47','2019-12-29 05:33:47','a2774762-a5e2-4799-8062-22b716d0f97e');

/*!40000 ALTER TABLE `fieldlayouttabs` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table fields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fields`;

CREATE TABLE `fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `context` varchar(255) NOT NULL DEFAULT 'global',
  `instructions` text,
  `searchable` tinyint(1) NOT NULL DEFAULT '1',
  `translationMethod` varchar(255) NOT NULL DEFAULT 'none',
  `translationKeyFormat` text,
  `type` varchar(255) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `fields_handle_context_unq_idx` (`handle`,`context`),
  KEY `fields_groupId_idx` (`groupId`),
  KEY `fields_context_idx` (`context`),
  CONSTRAINT `fields_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `fieldgroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;

INSERT INTO `fields` (`id`, `groupId`, `name`, `handle`, `context`, `instructions`, `searchable`, `translationMethod`, `translationKeyFormat`, `type`, `settings`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,3,'Available Products','availableProducts','global','',1,'site',NULL,'craft\\fields\\Matrix','{\"minBlocks\":\"\",\"maxBlocks\":\"\",\"contentTable\":\"{{%matrixcontent_availableproducts}}\",\"localizeBlocks\":false}','2019-12-29 05:12:12','2019-12-29 05:12:12','050801e0-9914-4a65-a49c-c3418c2da200'),
	(2,6,'News Products ','newsProducts','global','',1,'site',NULL,'craft\\fields\\Entries','{\"sources\":[\"section:5a041f1d-964e-41a5-a3e7-36f0a91ec4e2\"],\"source\":null,\"targetSiteId\":null,\"viewMode\":null,\"limit\":\"6\",\"selectionLabel\":\"Add Products\",\"localizeRelations\":false,\"validateRelatedElements\":\"\"}','2019-12-29 05:12:12','2019-12-29 05:12:12','0b3353c6-6585-45e9-9b26-7f8a36124b56'),
	(3,4,'Email','email','global','',1,'none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}','2019-12-29 05:12:12','2019-12-29 05:12:12','23d11b87-2fe8-43aa-bdcd-4bf76b0c0719'),
	(4,4,'First Name','firstName','global','',1,'none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}','2019-12-29 05:12:12','2019-12-29 05:12:12','5102df7b-e447-4874-9c46-d4cb75c13b7c'),
	(5,6,'News Description','newsDescription','global','',1,'none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}','2019-12-29 05:12:12','2019-12-29 05:12:12','631b609a-3a78-4ddb-acae-caf3c6057662'),
	(6,1,'News Feed','newsFeed','global','',1,'site',NULL,'craft\\fields\\Matrix','{\"minBlocks\":\"\",\"maxBlocks\":\"\",\"contentTable\":\"{{%matrixcontent_newsfeed}}\",\"localizeBlocks\":false}','2019-12-29 05:12:12','2019-12-29 05:12:12','737f3d64-426a-45e4-869b-05a5dcf2c242'),
	(7,6,'News Title','newsTitle','global','',1,'none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}','2019-12-29 05:12:12','2019-12-29 05:12:12','c4585c4e-f4a6-439c-a95b-1f2a50263b07'),
	(8,4,'Last Name','lastName','global','',1,'none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}','2019-12-29 05:12:12','2019-12-29 05:12:12','cfa2e5f0-3a12-438e-9cde-6d040f2cb87a'),
	(9,NULL,'News Description','newsDescription','matrixBlockType:14ed5bdb-4241-477f-9e04-f101c7a5d12e','',1,'none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}','2019-12-29 05:12:13','2019-12-29 05:12:13','0279eb13-a8c6-4fbb-854c-f959a7e7ec0c'),
	(10,NULL,'News Title','newsTitle','matrixBlockType:14ed5bdb-4241-477f-9e04-f101c7a5d12e','',1,'none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}','2019-12-29 05:12:13','2019-12-29 05:12:13','90ec5ac1-0769-4d13-a06e-c7def0978065'),
	(11,NULL,'Image','image','matrixBlockType:14ed5bdb-4241-477f-9e04-f101c7a5d12e','',1,'site',NULL,'craft\\fields\\Assets','{\"useSingleFolder\":\"\",\"defaultUploadLocationSource\":null,\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":null,\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"\",\"allowedKinds\":null,\"sources\":\"*\",\"source\":null,\"targetSiteId\":null,\"viewMode\":\"list\",\"limit\":\"\",\"selectionLabel\":\"\",\"localizeRelations\":false}','2019-12-29 05:12:13','2019-12-29 05:12:13','c3024897-2d66-4ebc-81d2-0fde5834f3e2'),
	(12,NULL,'Price','price','matrixBlockType:a91239bf-7096-439b-8ba1-066c475967f0','',1,'none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}','2019-12-29 05:12:13','2019-12-29 05:12:13','1a093554-c08f-40f7-b0b7-d691befee085'),
	(13,NULL,'Product Name','productName','matrixBlockType:a91239bf-7096-439b-8ba1-066c475967f0','',1,'none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}','2019-12-29 05:12:13','2019-12-29 05:12:13','611dcf48-d3df-4e35-bef6-ed0253894db5'),
	(14,NULL,'Available?','available','matrixBlockType:a91239bf-7096-439b-8ba1-066c475967f0','',1,'none',NULL,'craft\\fields\\Dropdown','{\"options\":[{\"label\":\"Available\",\"value\":\"available\",\"default\":\"1\"},{\"label\":\"Unavailable\",\"value\":\"unavailable\",\"default\":\"\"}]}','2019-12-29 05:12:13','2019-12-29 05:12:13','9e62a5a5-7e6d-4e9c-8dda-f19f38b75cf1'),
	(15,NULL,'Image','image','matrixBlockType:a91239bf-7096-439b-8ba1-066c475967f0','',1,'site',NULL,'craft\\fields\\Assets','{\"useSingleFolder\":\"\",\"defaultUploadLocationSource\":null,\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":null,\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"\",\"allowedKinds\":null,\"sources\":\"*\",\"source\":null,\"targetSiteId\":null,\"viewMode\":\"list\",\"limit\":\"\",\"selectionLabel\":\"\",\"localizeRelations\":false}','2019-12-29 05:12:13','2019-12-29 05:12:13','e59be861-cc06-4f7d-8419-a990bddd30fd'),
	(16,7,'Navigation Item Name','navigationItemName','global','',1,'none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}','2019-12-29 05:32:27','2019-12-29 05:32:27','70251911-52b7-456d-91f2-fc34766531e5'),
	(17,7,'Navigation Item Link','navigationItemLink','global','',1,'site',NULL,'craft\\fields\\Entries','{\"sources\":\"*\",\"source\":null,\"targetSiteId\":null,\"viewMode\":null,\"limit\":\"1\",\"selectionLabel\":\"\",\"localizeRelations\":false,\"validateRelatedElements\":\"\"}','2019-12-29 05:33:06','2019-12-29 05:33:06','9d16c20b-3195-47af-9d60-d138e02b7bd9');

/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table globalsets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `globalsets`;

CREATE TABLE `globalsets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `globalsets_name_idx` (`name`),
  KEY `globalsets_handle_idx` (`handle`),
  KEY `globalsets_fieldLayoutId_idx` (`fieldLayoutId`),
  CONSTRAINT `globalsets_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `globalsets_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table gqlschemas
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gqlschemas`;

CREATE TABLE `gqlschemas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `accessToken` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `scope` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `gqlschemas_accessToken_unq_idx` (`accessToken`),
  UNIQUE KEY `gqlschemas_name_unq_idx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `gqlschemas` WRITE;
/*!40000 ALTER TABLE `gqlschemas` DISABLE KEYS */;

INSERT INTO `gqlschemas` (`id`, `name`, `accessToken`, `enabled`, `expiryDate`, `lastUsed`, `scope`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'Public Schema','__PUBLIC__',1,NULL,NULL,'[]','2019-12-29 05:12:25','2019-12-29 05:12:25','8cce915a-5317-4362-a2f2-5c8f636ab212');

/*!40000 ALTER TABLE `gqlschemas` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table info
# ------------------------------------------------------------

DROP TABLE IF EXISTS `info`;

CREATE TABLE `info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(50) NOT NULL,
  `schemaVersion` varchar(15) NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `config` mediumtext,
  `configMap` mediumtext,
  `fieldVersion` char(12) NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;

INSERT INTO `info` (`id`, `version`, `schemaVersion`, `maintenance`, `config`, `configMap`, `fieldVersion`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'3.3.15','3.3.3',0,'{\"dateModified\":1577597627,\"email\":{\"fromEmail\":\"noreply@awatoruwildfood.co.nz\",\"fromName\":\"Awatoru Wildfood\",\"template\":null,\"transportType\":\"putyourlightson\\\\sendgrid\\\\mail\\\\SendgridAdapter\",\"transportSettings\":{\"apiKey\":\"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\"}},\"fieldGroups\":{\"335454c1-7446-4c14-b7af-251dcc1e3a22\":{\"name\":\"News feed\"},\"4b000de0-c332-4c52-806f-0b6adf2a6140\":{\"name\":\"Products\"},\"55709eb1-437b-45bb-94b7-e6328204f455\":{\"name\":\"Order Form\"},\"70f64b48-8b55-4750-bca7-5656ba7dbda4\":{\"name\":\"Navigation\"},\"7a701a6e-72c8-4d5b-ac96-2830c462a6ea\":{\"name\":\"Users\"},\"8ee3bcf1-2ef7-4684-bdc0-ce8ed5a1a3b1\":{\"name\":\"Common\"},\"a3e62c01-c6b9-47f6-9904-6db8c24f0b71\":{\"name\":\"News\"}},\"fields\":{\"050801e0-9914-4a65-a49c-c3418c2da200\":{\"name\":\"Available Products\",\"handle\":\"availableProducts\",\"instructions\":\"\",\"searchable\":true,\"translationMethod\":\"site\",\"translationKeyFormat\":null,\"type\":\"craft\\\\fields\\\\Matrix\",\"settings\":{\"minBlocks\":\"\",\"maxBlocks\":\"\",\"contentTable\":\"{{%matrixcontent_availableproducts}}\",\"localizeBlocks\":false},\"fieldGroup\":\"55709eb1-437b-45bb-94b7-e6328204f455\",\"contentColumnType\":\"string\"},\"0b3353c6-6585-45e9-9b26-7f8a36124b56\":{\"name\":\"News Products \",\"handle\":\"newsProducts\",\"instructions\":\"\",\"searchable\":true,\"translationMethod\":\"site\",\"translationKeyFormat\":null,\"type\":\"craft\\\\fields\\\\Entries\",\"settings\":{\"sources\":[\"section:5a041f1d-964e-41a5-a3e7-36f0a91ec4e2\"],\"source\":null,\"targetSiteId\":null,\"viewMode\":null,\"limit\":\"6\",\"selectionLabel\":\"Add Products\",\"localizeRelations\":false,\"validateRelatedElements\":\"\"},\"contentColumnType\":\"string\",\"fieldGroup\":\"a3e62c01-c6b9-47f6-9904-6db8c24f0b71\"},\"23d11b87-2fe8-43aa-bdcd-4bf76b0c0719\":{\"name\":\"Email\",\"handle\":\"email\",\"instructions\":\"\",\"searchable\":true,\"translationMethod\":\"none\",\"translationKeyFormat\":null,\"type\":\"craft\\\\fields\\\\PlainText\",\"settings\":{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"},\"contentColumnType\":\"text\",\"fieldGroup\":\"7a701a6e-72c8-4d5b-ac96-2830c462a6ea\"},\"5102df7b-e447-4874-9c46-d4cb75c13b7c\":{\"name\":\"First Name\",\"handle\":\"firstName\",\"instructions\":\"\",\"searchable\":true,\"translationMethod\":\"none\",\"translationKeyFormat\":null,\"type\":\"craft\\\\fields\\\\PlainText\",\"settings\":{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"},\"contentColumnType\":\"text\",\"fieldGroup\":\"7a701a6e-72c8-4d5b-ac96-2830c462a6ea\"},\"631b609a-3a78-4ddb-acae-caf3c6057662\":{\"name\":\"News Description\",\"handle\":\"newsDescription\",\"instructions\":\"\",\"searchable\":true,\"translationMethod\":\"none\",\"translationKeyFormat\":null,\"type\":\"craft\\\\fields\\\\PlainText\",\"settings\":{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"},\"contentColumnType\":\"text\",\"fieldGroup\":\"a3e62c01-c6b9-47f6-9904-6db8c24f0b71\"},\"70251911-52b7-456d-91f2-fc34766531e5\":{\"name\":\"Navigation Item Name\",\"handle\":\"navigationItemName\",\"instructions\":\"\",\"searchable\":true,\"translationMethod\":\"none\",\"translationKeyFormat\":null,\"type\":\"craft\\\\fields\\\\PlainText\",\"settings\":{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"},\"contentColumnType\":\"text\",\"fieldGroup\":\"70f64b48-8b55-4750-bca7-5656ba7dbda4\"},\"737f3d64-426a-45e4-869b-05a5dcf2c242\":{\"name\":\"News Feed\",\"handle\":\"newsFeed\",\"instructions\":\"\",\"searchable\":true,\"translationMethod\":\"site\",\"translationKeyFormat\":null,\"type\":\"craft\\\\fields\\\\Matrix\",\"settings\":{\"minBlocks\":\"\",\"maxBlocks\":\"\",\"contentTable\":\"{{%matrixcontent_newsfeed}}\",\"localizeBlocks\":false},\"fieldGroup\":\"335454c1-7446-4c14-b7af-251dcc1e3a22\",\"contentColumnType\":\"string\"},\"9d16c20b-3195-47af-9d60-d138e02b7bd9\":{\"name\":\"Navigation Item Link\",\"handle\":\"navigationItemLink\",\"instructions\":\"\",\"searchable\":true,\"translationMethod\":\"site\",\"translationKeyFormat\":null,\"type\":\"craft\\\\fields\\\\Entries\",\"settings\":{\"sources\":\"*\",\"source\":null,\"targetSiteId\":null,\"viewMode\":null,\"limit\":\"1\",\"selectionLabel\":\"\",\"localizeRelations\":false,\"validateRelatedElements\":\"\"},\"contentColumnType\":\"string\",\"fieldGroup\":\"70f64b48-8b55-4750-bca7-5656ba7dbda4\"},\"c4585c4e-f4a6-439c-a95b-1f2a50263b07\":{\"name\":\"News Title\",\"handle\":\"newsTitle\",\"instructions\":\"\",\"searchable\":true,\"translationMethod\":\"none\",\"translationKeyFormat\":null,\"type\":\"craft\\\\fields\\\\PlainText\",\"settings\":{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"},\"contentColumnType\":\"text\",\"fieldGroup\":\"a3e62c01-c6b9-47f6-9904-6db8c24f0b71\"},\"cfa2e5f0-3a12-438e-9cde-6d040f2cb87a\":{\"name\":\"Last Name\",\"handle\":\"lastName\",\"instructions\":\"\",\"searchable\":true,\"translationMethod\":\"none\",\"translationKeyFormat\":null,\"type\":\"craft\\\\fields\\\\PlainText\",\"settings\":{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"},\"contentColumnType\":\"text\",\"fieldGroup\":\"7a701a6e-72c8-4d5b-ac96-2830c462a6ea\"}},\"matrixBlockTypes\":{\"14ed5bdb-4241-477f-9e04-f101c7a5d12e\":{\"name\":\"News\",\"handle\":\"news\",\"sortOrder\":1,\"field\":\"737f3d64-426a-45e4-869b-05a5dcf2c242\",\"fieldLayouts\":{\"4c73fc9b-af2e-4e6a-bab9-513aa4d634be\":{\"tabs\":[{\"name\":\"Content\",\"sortOrder\":1,\"fields\":{\"0279eb13-a8c6-4fbb-854c-f959a7e7ec0c\":{\"required\":false,\"sortOrder\":2},\"90ec5ac1-0769-4d13-a06e-c7def0978065\":{\"required\":false,\"sortOrder\":1},\"c3024897-2d66-4ebc-81d2-0fde5834f3e2\":{\"required\":false,\"sortOrder\":3}}}]}},\"fields\":{\"0279eb13-a8c6-4fbb-854c-f959a7e7ec0c\":{\"name\":\"News Description\",\"handle\":\"newsDescription\",\"instructions\":\"\",\"searchable\":true,\"translationMethod\":\"none\",\"translationKeyFormat\":null,\"type\":\"craft\\\\fields\\\\PlainText\",\"settings\":{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"},\"fieldGroup\":null,\"contentColumnType\":\"text\"},\"90ec5ac1-0769-4d13-a06e-c7def0978065\":{\"name\":\"News Title\",\"handle\":\"newsTitle\",\"instructions\":\"\",\"searchable\":true,\"translationMethod\":\"none\",\"translationKeyFormat\":null,\"type\":\"craft\\\\fields\\\\PlainText\",\"settings\":{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"},\"fieldGroup\":null,\"contentColumnType\":\"text\"},\"c3024897-2d66-4ebc-81d2-0fde5834f3e2\":{\"name\":\"Image\",\"handle\":\"image\",\"instructions\":\"\",\"searchable\":true,\"translationMethod\":\"site\",\"translationKeyFormat\":null,\"type\":\"craft\\\\fields\\\\Assets\",\"settings\":{\"useSingleFolder\":\"\",\"defaultUploadLocationSource\":null,\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":null,\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"\",\"allowedKinds\":null,\"sources\":\"*\",\"source\":null,\"targetSiteId\":null,\"viewMode\":\"list\",\"limit\":\"\",\"selectionLabel\":\"\",\"localizeRelations\":false},\"fieldGroup\":null,\"contentColumnType\":\"string\"}}},\"a91239bf-7096-439b-8ba1-066c475967f0\":{\"name\":\"Products\",\"handle\":\"products\",\"sortOrder\":1,\"field\":\"050801e0-9914-4a65-a49c-c3418c2da200\",\"fieldLayouts\":{\"9ffa248a-8c2d-445c-8841-f9c32332c923\":{\"tabs\":[{\"name\":\"Content\",\"sortOrder\":1,\"fields\":{\"1a093554-c08f-40f7-b0b7-d691befee085\":{\"required\":false,\"sortOrder\":2},\"611dcf48-d3df-4e35-bef6-ed0253894db5\":{\"required\":false,\"sortOrder\":1},\"9e62a5a5-7e6d-4e9c-8dda-f19f38b75cf1\":{\"required\":false,\"sortOrder\":4},\"e59be861-cc06-4f7d-8419-a990bddd30fd\":{\"required\":false,\"sortOrder\":3}}}]}},\"fields\":{\"1a093554-c08f-40f7-b0b7-d691befee085\":{\"name\":\"Price\",\"handle\":\"price\",\"instructions\":\"\",\"searchable\":true,\"translationMethod\":\"none\",\"translationKeyFormat\":null,\"type\":\"craft\\\\fields\\\\PlainText\",\"settings\":{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"},\"fieldGroup\":null,\"contentColumnType\":\"text\"},\"611dcf48-d3df-4e35-bef6-ed0253894db5\":{\"name\":\"Product Name\",\"handle\":\"productName\",\"instructions\":\"\",\"searchable\":true,\"translationMethod\":\"none\",\"translationKeyFormat\":null,\"type\":\"craft\\\\fields\\\\PlainText\",\"settings\":{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"},\"fieldGroup\":null,\"contentColumnType\":\"text\"},\"9e62a5a5-7e6d-4e9c-8dda-f19f38b75cf1\":{\"name\":\"Available?\",\"handle\":\"available\",\"instructions\":\"\",\"searchable\":true,\"translationMethod\":\"none\",\"translationKeyFormat\":null,\"type\":\"craft\\\\fields\\\\Dropdown\",\"settings\":{\"options\":[{\"label\":\"Available\",\"value\":\"available\",\"default\":\"1\"},{\"label\":\"Unavailable\",\"value\":\"unavailable\",\"default\":\"\"}]},\"fieldGroup\":null,\"contentColumnType\":\"string\"},\"e59be861-cc06-4f7d-8419-a990bddd30fd\":{\"name\":\"Image\",\"handle\":\"image\",\"instructions\":\"\",\"searchable\":true,\"translationMethod\":\"site\",\"translationKeyFormat\":null,\"type\":\"craft\\\\fields\\\\Assets\",\"settings\":{\"useSingleFolder\":\"\",\"defaultUploadLocationSource\":null,\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":null,\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"\",\"allowedKinds\":null,\"sources\":\"*\",\"source\":null,\"targetSiteId\":null,\"viewMode\":\"list\",\"limit\":\"\",\"selectionLabel\":\"\",\"localizeRelations\":false},\"fieldGroup\":null,\"contentColumnType\":\"string\"}}}},\"plugins\":{\"webhooks\":{\"edition\":\"standard\",\"enabled\":true,\"schemaVersion\":\"2.2.0\"},\"contact-form\":{\"edition\":\"standard\",\"enabled\":true,\"schemaVersion\":\"1.0.0\",\"settings\":{\"toEmail\":\"h.lawrence@windowslive.com\",\"prependSender\":\"On behalf of\",\"prependSubject\":\"New message from Awatoru\",\"allowAttachments\":\"\",\"successFlashMessage\":\"Your message has been sent.\"}},\"sendgrid\":{\"edition\":\"standard\",\"enabled\":true,\"schemaVersion\":\"1.0.0\"}},\"sections\":{\"5a041f1d-964e-41a5-a3e7-36f0a91ec4e2\":{\"name\":\"Products\",\"handle\":\"products\",\"type\":\"channel\",\"enableVersioning\":true,\"entryTypes\":{\"3c5453b2-9842-4725-9430-cf7723a09c1f\":{\"name\":\"Products\",\"handle\":\"products\",\"hasTitleField\":true,\"titleLabel\":\"Title\",\"titleFormat\":null,\"sortOrder\":1}},\"siteSettings\":{\"1d897520-a9e2-4981-beda-4254507df91e\":{\"enabledByDefault\":true,\"hasUrls\":true,\"uriFormat\":\"products/{slug}\",\"template\":\"products/_entry\"}},\"propagationMethod\":\"all\"},\"799c5f9f-5fc4-44eb-9ab5-6b5b70a2fd4d\":{\"name\":\"Home\",\"handle\":\"home\",\"type\":\"single\",\"enableVersioning\":true,\"entryTypes\":{\"1efb8a72-3c56-462d-9a85-0c686962f8cb\":{\"name\":\"Home\",\"handle\":\"home\",\"hasTitleField\":false,\"titleLabel\":null,\"titleFormat\":\"{section.name|raw}\",\"sortOrder\":1,\"fieldLayouts\":{\"989b76e3-f78d-46ba-a27c-f012bff692fb\":{\"tabs\":[{\"name\":\"Tab 1\",\"sortOrder\":1,\"fields\":{\"737f3d64-426a-45e4-869b-05a5dcf2c242\":{\"required\":false,\"sortOrder\":1}}}]}}}},\"siteSettings\":{\"1d897520-a9e2-4981-beda-4254507df91e\":{\"enabledByDefault\":true,\"hasUrls\":true,\"uriFormat\":\"__home__\",\"template\":\"home/_entry\"}},\"propagationMethod\":\"all\"},\"a8cbca0d-d8d9-4dfd-bc56-39396f122ab0\":{\"name\":\"Contact\",\"handle\":\"contact\",\"type\":\"single\",\"enableVersioning\":true,\"entryTypes\":{\"819facc5-de6d-46f5-bb81-bb1982b4b5e8\":{\"name\":\"Contact\",\"handle\":\"contact\",\"hasTitleField\":false,\"titleLabel\":null,\"titleFormat\":\"{section.name|raw}\",\"sortOrder\":1}},\"siteSettings\":{\"1d897520-a9e2-4981-beda-4254507df91e\":{\"enabledByDefault\":true,\"hasUrls\":true,\"uriFormat\":\"contact\",\"template\":\"contact/_entry\"}},\"propagationMethod\":\"all\"},\"ab35d417-427e-443b-b529-21866d37ba58\":{\"name\":\"Order Form\",\"handle\":\"orderForm\",\"type\":\"single\",\"enableVersioning\":true,\"entryTypes\":{\"65959724-a677-4bbf-b3c5-7053f5fdd9e9\":{\"name\":\"Order Form\",\"handle\":\"orderForm\",\"hasTitleField\":false,\"titleLabel\":null,\"titleFormat\":\"{section.name|raw}\",\"sortOrder\":1,\"fieldLayouts\":{\"001227e4-823c-493a-b92f-a6c42dfb0562\":{\"tabs\":[{\"name\":\"Tab 1\",\"sortOrder\":1,\"fields\":{\"050801e0-9914-4a65-a49c-c3418c2da200\":{\"required\":false,\"sortOrder\":1}}}]}}}},\"siteSettings\":{\"1d897520-a9e2-4981-beda-4254507df91e\":{\"enabledByDefault\":true,\"hasUrls\":true,\"uriFormat\":\"order\",\"template\":\"order/_entry\"}},\"propagationMethod\":\"all\"},\"cecda293-6e2b-44f3-a22d-0c49bdaf2a86\":{\"name\":\"Navigation Menu\",\"handle\":\"navigationMenu\",\"type\":\"channel\",\"enableVersioning\":true,\"propagationMethod\":\"all\",\"siteSettings\":{\"1d897520-a9e2-4981-beda-4254507df91e\":{\"enabledByDefault\":true,\"hasUrls\":false,\"uriFormat\":\"\",\"template\":null}},\"entryTypes\":{\"1055eb79-56f9-41b3-b477-33365fac6983\":{\"name\":\"Navigation Menu\",\"handle\":\"navigationMenu\",\"hasTitleField\":true,\"titleLabel\":\"Title\",\"titleFormat\":\"\",\"sortOrder\":1,\"fieldLayouts\":{\"d2bf81e4-2cf3-4bb7-948b-b857c0d11270\":{\"tabs\":[{\"name\":\"Navigation\",\"sortOrder\":1,\"fields\":{\"70251911-52b7-456d-91f2-fc34766531e5\":{\"required\":false,\"sortOrder\":2},\"9d16c20b-3195-47af-9d60-d138e02b7bd9\":{\"required\":false,\"sortOrder\":1}}}]}}}}},\"fbeaeb48-e4f3-44bb-b933-90a97eff2358\":{\"name\":\"News\",\"handle\":\"news\",\"type\":\"channel\",\"enableVersioning\":true,\"propagationMethod\":\"all\",\"siteSettings\":{\"1d897520-a9e2-4981-beda-4254507df91e\":{\"enabledByDefault\":true,\"hasUrls\":true,\"uriFormat\":\"news/{slug}\",\"template\":\"news/_entry\"}},\"entryTypes\":{\"a39dd88a-bcfb-456b-a070-327b5b514111\":{\"name\":\"News\",\"handle\":\"news\",\"hasTitleField\":true,\"titleLabel\":\"Title\",\"titleFormat\":\"\",\"sortOrder\":1,\"fieldLayouts\":{\"8b4a0618-795f-442f-acab-4c299884450d\":{\"tabs\":[{\"name\":\"News\",\"sortOrder\":1,\"fields\":{\"0b3353c6-6585-45e9-9b26-7f8a36124b56\":{\"required\":false,\"sortOrder\":2},\"631b609a-3a78-4ddb-acae-caf3c6057662\":{\"required\":false,\"sortOrder\":1},\"c4585c4e-f4a6-439c-a95b-1f2a50263b07\":{\"required\":false,\"sortOrder\":3}}}]}}}}}},\"siteGroups\":{\"c9424660-0760-48b0-b613-2c3499cf4ff8\":{\"name\":\"Craft3 Jir6 Frb - Awatoru\"}},\"sites\":{\"1d897520-a9e2-4981-beda-4254507df91e\":{\"siteGroup\":\"c9424660-0760-48b0-b613-2c3499cf4ff8\",\"name\":\"Awatoru App\",\"handle\":\"default\",\"language\":\"en-NZ\",\"hasUrls\":true,\"baseUrl\":\"@web/\",\"sortOrder\":1,\"primary\":true}},\"system\":{\"edition\":\"pro\",\"live\":true,\"name\":\"Craft3 Jir6 Frb - Awatoru\",\"timeZone\":\"America/Los_Angeles\",\"schemaVersion\":\"3.3.3\"},\"users\":{\"requireEmailVerification\":true,\"allowPublicRegistration\":true,\"defaultGroup\":\"2bc2f604-a7fc-4567-b7db-bed1568be1c3\",\"photoVolumeUid\":null,\"photoSubpath\":null,\"fieldLayouts\":{\"ac1b6471-20fc-4144-bd87-acdae5219a90\":{\"tabs\":[{\"name\":\"Users\",\"sortOrder\":1,\"fields\":{\"23d11b87-2fe8-43aa-bdcd-4bf76b0c0719\":{\"required\":false,\"sortOrder\":1},\"5102df7b-e447-4874-9c46-d4cb75c13b7c\":{\"required\":false,\"sortOrder\":2},\"cfa2e5f0-3a12-438e-9cde-6d040f2cb87a\":{\"required\":false,\"sortOrder\":3}}}]}},\"groups\":{\"2bc2f604-a7fc-4567-b7db-bed1568be1c3\":{\"name\":\"Restaurants \",\"handle\":\"restaurants\"}}}}','{\"dateModified\":\"@config/project.yaml\",\"email\":\"@config/project.yaml\",\"fieldGroups\":\"@config/project.yaml\",\"fields\":\"@config/project.yaml\",\"matrixBlockTypes\":\"@config/project.yaml\",\"plugins\":\"@config/project.yaml\",\"sections\":\"@config/project.yaml\",\"siteGroups\":\"@config/project.yaml\",\"sites\":\"@config/project.yaml\",\"system\":\"@config/project.yaml\",\"users\":\"@config/project.yaml\"}','LaK2S8n9oNgd','2019-12-29 05:12:12','2019-12-29 05:12:12','f80457ce-acce-442c-ad60-03fa31f444ba');

/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table matrixblocks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `matrixblocks`;

CREATE TABLE `matrixblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `matrixblocks_ownerId_idx` (`ownerId`),
  KEY `matrixblocks_fieldId_idx` (`fieldId`),
  KEY `matrixblocks_typeId_idx` (`typeId`),
  KEY `matrixblocks_sortOrder_idx` (`sortOrder`),
  CONSTRAINT `matrixblocks_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `matrixblocks_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `matrixblocks_ownerId_fk` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `matrixblocks_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `matrixblocktypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table matrixblocktypes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `matrixblocktypes`;

CREATE TABLE `matrixblocktypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `matrixblocktypes_name_fieldId_unq_idx` (`name`,`fieldId`),
  UNIQUE KEY `matrixblocktypes_handle_fieldId_unq_idx` (`handle`,`fieldId`),
  KEY `matrixblocktypes_fieldId_idx` (`fieldId`),
  KEY `matrixblocktypes_fieldLayoutId_idx` (`fieldLayoutId`),
  CONSTRAINT `matrixblocktypes_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `matrixblocktypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `matrixblocktypes` WRITE;
/*!40000 ALTER TABLE `matrixblocktypes` DISABLE KEYS */;

INSERT INTO `matrixblocktypes` (`id`, `fieldId`, `fieldLayoutId`, `name`, `handle`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,6,4,'News','news',1,'2019-12-29 05:12:13','2019-12-29 05:12:13','14ed5bdb-4241-477f-9e04-f101c7a5d12e'),
	(2,1,5,'Products','products',1,'2019-12-29 05:12:13','2019-12-29 05:12:13','a91239bf-7096-439b-8ba1-066c475967f0');

/*!40000 ALTER TABLE `matrixblocktypes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table matrixcontent_availableproducts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `matrixcontent_availableproducts`;

CREATE TABLE `matrixcontent_availableproducts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_products_price` text,
  `field_products_productName` text,
  `field_products_available` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `matrixcontent_availableproducts_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  KEY `matrixcontent_availableproducts_siteId_fk` (`siteId`),
  CONSTRAINT `matrixcontent_availableproducts_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `matrixcontent_availableproducts_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table matrixcontent_newsfeed
# ------------------------------------------------------------

DROP TABLE IF EXISTS `matrixcontent_newsfeed`;

CREATE TABLE `matrixcontent_newsfeed` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_news_newsDescription` text,
  `field_news_newsTitle` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `matrixcontent_newsfeed_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  KEY `matrixcontent_newsfeed_siteId_fk` (`siteId`),
  CONSTRAINT `matrixcontent_newsfeed_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `matrixcontent_newsfeed_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pluginId` int(11) DEFAULT NULL,
  `type` enum('app','plugin','content') NOT NULL DEFAULT 'app',
  `name` varchar(255) NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `migrations_pluginId_idx` (`pluginId`),
  KEY `migrations_type_pluginId_idx` (`type`,`pluginId`),
  CONSTRAINT `migrations_pluginId_fk` FOREIGN KEY (`pluginId`) REFERENCES `plugins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `pluginId`, `type`, `name`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,'plugin','Install','2019-12-29 05:12:12','2019-12-29 05:12:12','2019-12-29 05:12:12','2e09b5a2-7689-4fda-9266-b8e507f84931'),
	(2,1,'plugin','m181212_105527_request_types','2019-12-29 05:12:12','2019-12-29 05:12:12','2019-12-29 05:12:12','6c1af9d4-c5e2-4f45-83e9-3f43a5b80eea'),
	(3,1,'plugin','m190315_214904_requests_table','2019-12-29 05:12:12','2019-12-29 05:12:12','2019-12-29 05:12:12','b6f5c394-0002-424e-93d8-bbb05d741d30'),
	(4,1,'plugin','m190320_182458_payload_template_col','2019-12-29 05:12:12','2019-12-29 05:12:12','2019-12-29 05:12:12','577513bc-c0e1-4487-8a0e-af7acd3323d7'),
	(5,1,'plugin','m190724_093924_event_filters','2019-12-29 05:12:12','2019-12-29 05:12:12','2019-12-29 05:12:12','af621492-cdec-4f36-b6fc-be538b50d473'),
	(6,1,'plugin','m190724_202705_custom_headers','2019-12-29 05:12:12','2019-12-29 05:12:12','2019-12-29 05:12:12','e647da7c-6889-4a54-aa33-fc9b5f013c29'),
	(7,NULL,'app','Install','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','59e7bd2b-17b5-4e98-ab32-cb336df5f8e9'),
	(8,NULL,'app','m150403_183908_migrations_table_changes','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','99215a1b-4523-400a-9c2c-1f6f5edefc4f'),
	(9,NULL,'app','m150403_184247_plugins_table_changes','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','e68c2636-2bb8-4601-9137-d19ae109e3a5'),
	(10,NULL,'app','m150403_184533_field_version','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','358dbf9c-b1a2-4e64-a97b-a793524fe6b7'),
	(11,NULL,'app','m150403_184729_type_columns','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','79dfc4fa-872a-47f0-b599-82b4f8427c88'),
	(12,NULL,'app','m150403_185142_volumes','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','3a1df646-733c-4ecb-906a-bbeb24a5e5dd'),
	(13,NULL,'app','m150428_231346_userpreferences','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','08228a1f-1070-4ec5-b6e6-a5dbe4f49dd9'),
	(14,NULL,'app','m150519_150900_fieldversion_conversion','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','ddbb59b2-2fce-4f8b-9ae7-9f90405c1043'),
	(15,NULL,'app','m150617_213829_update_email_settings','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','f10b1715-aaa7-429b-8d21-97a589db8979'),
	(16,NULL,'app','m150721_124739_templatecachequeries','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','0ed64f92-7a41-4610-bde6-09f3ad2914f4'),
	(17,NULL,'app','m150724_140822_adjust_quality_settings','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','4bd83e73-356c-4163-a1d4-b9e9238b9ffe'),
	(18,NULL,'app','m150815_133521_last_login_attempt_ip','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','e8620ab8-1217-4604-83d4-91bc4e23def3'),
	(19,NULL,'app','m151002_095935_volume_cache_settings','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','a0e3dc3c-49da-44a1-9e6c-924b75c3a32a'),
	(20,NULL,'app','m151005_142750_volume_s3_storage_settings','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','6d1857a0-9a55-4344-9111-eefc9c412542'),
	(21,NULL,'app','m151016_133600_delete_asset_thumbnails','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','7e12a93f-5b34-4a48-9d23-f53e27af5390'),
	(22,NULL,'app','m151209_000000_move_logo','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','dce240ee-f292-4f43-a0f7-7fa64c7a3934'),
	(23,NULL,'app','m151211_000000_rename_fileId_to_assetId','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','7c2699bb-aff7-4b56-b77a-ec28184637d4'),
	(24,NULL,'app','m151215_000000_rename_asset_permissions','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','7df41999-2ac4-4eda-9f86-64c3e8ae20fa'),
	(25,NULL,'app','m160707_000001_rename_richtext_assetsource_setting','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','b55f1cf8-4d70-4c8e-8cd7-15483847b23d'),
	(26,NULL,'app','m160708_185142_volume_hasUrls_setting','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','124e9f2c-6738-48c3-a123-6cf784ad2707'),
	(27,NULL,'app','m160714_000000_increase_max_asset_filesize','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','a4493dcb-e43b-455c-a201-dc2fcb9de0d4'),
	(28,NULL,'app','m160727_194637_column_cleanup','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','65213a42-2464-4651-b281-9996f354bcf5'),
	(29,NULL,'app','m160804_110002_userphotos_to_assets','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','d5c09b4f-01fb-4854-b665-781ddb352e94'),
	(30,NULL,'app','m160807_144858_sites','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','2ccea36e-8652-4344-b109-0ba640b4f929'),
	(31,NULL,'app','m160829_000000_pending_user_content_cleanup','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','b2662d08-4b2c-480e-a862-d9c5bfa9bfe8'),
	(32,NULL,'app','m160830_000000_asset_index_uri_increase','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','1bd4d77e-0bca-4732-9367-d8f999c82842'),
	(33,NULL,'app','m160912_230520_require_entry_type_id','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','dfb64852-d3a7-4cc6-b9d7-4a01bebe92bc'),
	(34,NULL,'app','m160913_134730_require_matrix_block_type_id','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','877128b1-e10b-4421-acd3-95f672d43d82'),
	(35,NULL,'app','m160920_174553_matrixblocks_owner_site_id_nullable','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','4931a86a-5a69-4fd4-bb47-bf8b17b6b5ce'),
	(36,NULL,'app','m160920_231045_usergroup_handle_title_unique','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','c86fc502-42cf-4080-9b0b-9d33e5a612a3'),
	(37,NULL,'app','m160925_113941_route_uri_parts','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','8962be8f-089d-454f-ad8a-fc02e7af5f07'),
	(38,NULL,'app','m161006_205918_schemaVersion_not_null','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','bf155ee8-a415-4a7e-bffa-a91cfe521415'),
	(39,NULL,'app','m161007_130653_update_email_settings','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','97f6008c-e2c2-49ca-91f3-d449c358b29c'),
	(40,NULL,'app','m161013_175052_newParentId','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','11b96ae3-fc24-49c8-bc69-63747a512186'),
	(41,NULL,'app','m161021_102916_fix_recent_entries_widgets','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','362c8471-6efd-460e-97f7-fd46774d9a0d'),
	(42,NULL,'app','m161021_182140_rename_get_help_widget','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','79abb351-005a-4179-84ba-e75f636d6b78'),
	(43,NULL,'app','m161025_000000_fix_char_columns','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','fde6ba46-0d86-45fb-9801-93ea0b252adf'),
	(44,NULL,'app','m161029_124145_email_message_languages','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','ae6b22b5-1928-4fe1-bb49-3728b80eea63'),
	(45,NULL,'app','m161108_000000_new_version_format','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','020a28cd-f88a-466d-be33-7d87fc02bc3f'),
	(46,NULL,'app','m161109_000000_index_shuffle','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','44b2c6f2-6615-4428-a89b-fda8a5230f46'),
	(47,NULL,'app','m161122_185500_no_craft_app','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','47b68345-3c16-43fe-a0d2-f7203c1982f2'),
	(48,NULL,'app','m161125_150752_clear_urlmanager_cache','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','0553f077-ad17-42a5-8293-bdf171b06038'),
	(49,NULL,'app','m161220_000000_volumes_hasurl_notnull','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','1f78363e-d77c-4550-82c8-b9ed7f6ae1e5'),
	(50,NULL,'app','m170114_161144_udates_permission','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','44ec075a-7ddf-420c-856a-14bd763e22aa'),
	(51,NULL,'app','m170120_000000_schema_cleanup','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','16dbb9dd-9656-46dc-8026-ac01d623e2c8'),
	(52,NULL,'app','m170126_000000_assets_focal_point','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','8d0ac287-a82b-40d5-bd6a-cc3c69d6c995'),
	(53,NULL,'app','m170206_142126_system_name','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','c6728d83-82bd-4ae1-a3fa-a1acb278f57a'),
	(54,NULL,'app','m170217_044740_category_branch_limits','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','b0fd7e02-53ee-4c08-9b80-afd26b73f460'),
	(55,NULL,'app','m170217_120224_asset_indexing_columns','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','0cb1292e-bb72-4a1e-8d36-3626ffd4b82d'),
	(56,NULL,'app','m170223_224012_plain_text_settings','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','2213160e-5408-48f0-8899-a753dfd7b794'),
	(57,NULL,'app','m170227_120814_focal_point_percentage','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','e736f32e-0dd7-4726-b1b7-a1ecb8a3c9a4'),
	(58,NULL,'app','m170228_171113_system_messages','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','29b5e2c9-71d0-445b-8492-a57054ceffdf'),
	(59,NULL,'app','m170303_140500_asset_field_source_settings','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','dcaca385-a997-49a1-8d45-2117f813d9e2'),
	(60,NULL,'app','m170306_150500_asset_temporary_uploads','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','4702f444-10f3-4f96-8e9a-ac9832d003da'),
	(61,NULL,'app','m170523_190652_element_field_layout_ids','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','117d7f37-ade1-4f87-88f0-3e3d72648780'),
	(62,NULL,'app','m170612_000000_route_index_shuffle','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','66ec4779-4747-480c-8c0a-d1c4ca2db748'),
	(63,NULL,'app','m170621_195237_format_plugin_handles','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','e3af18ae-012c-472a-81d0-3f25ca6ba4cf'),
	(64,NULL,'app','m170630_161027_deprecation_line_nullable','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','722dc15d-fabb-4ae5-85d9-66a615d06743'),
	(65,NULL,'app','m170630_161028_deprecation_changes','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','ac608603-5330-4e5f-9646-67e4127c15df'),
	(66,NULL,'app','m170703_181539_plugins_table_tweaks','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','0bb58dee-3273-47ed-9bcf-f75f6564c6e5'),
	(67,NULL,'app','m170704_134916_sites_tables','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','e3b88b53-8f06-4b99-a6fb-dff7935934d2'),
	(68,NULL,'app','m170706_183216_rename_sequences','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','9251f8eb-f483-4b2c-a443-85e6b3e62fc4'),
	(69,NULL,'app','m170707_094758_delete_compiled_traits','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','53c0ec3d-d7fc-4784-a7c1-f466f941e90e'),
	(70,NULL,'app','m170731_190138_drop_asset_packagist','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','44141f8a-999a-4288-9f4e-a6575492c6fa'),
	(71,NULL,'app','m170810_201318_create_queue_table','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','a39287a9-b0a3-44d6-a02f-02f94274116d'),
	(72,NULL,'app','m170816_133741_delete_compiled_behaviors','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','56f7f797-1fc0-4a7d-9f90-616160bcb2ee'),
	(73,NULL,'app','m170903_192801_longblob_for_queue_jobs','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','6287da87-ef1c-4e17-8a14-c475840940b2'),
	(74,NULL,'app','m170914_204621_asset_cache_shuffle','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','77140ddd-e12e-43db-a3d8-24418b4d4b7c'),
	(75,NULL,'app','m171011_214115_site_groups','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','f6dab8da-9a13-461d-bcf8-304b69a03d40'),
	(76,NULL,'app','m171012_151440_primary_site','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','ff2484ea-c410-4386-a31c-e9a039e55004'),
	(77,NULL,'app','m171013_142500_transform_interlace','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','9c8caec3-a271-4669-b8ed-61aeaaa35985'),
	(78,NULL,'app','m171016_092553_drop_position_select','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','e28b6929-9ee3-41a2-bb6d-76f8caa50183'),
	(79,NULL,'app','m171016_221244_less_strict_translation_method','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','62a87e38-130d-4005-a91e-0b0403796810'),
	(80,NULL,'app','m171107_000000_assign_group_permissions','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','afa4f24d-8d2c-4867-b22e-b268885813c6'),
	(81,NULL,'app','m171117_000001_templatecache_index_tune','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','38e9c7cc-2ec4-4884-96d4-b57864c75528'),
	(82,NULL,'app','m171126_105927_disabled_plugins','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','e12abc67-678b-4f54-938f-069f490e2701'),
	(83,NULL,'app','m171130_214407_craftidtokens_table','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','87f8d5df-5246-4fa1-99fe-74149c4394b9'),
	(84,NULL,'app','m171202_004225_update_email_settings','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','21e4799d-10bd-4a9d-a003-743fd25f25f7'),
	(85,NULL,'app','m171204_000001_templatecache_index_tune_deux','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','20c108d1-d1cf-4953-b304-28376606f052'),
	(86,NULL,'app','m171205_130908_remove_craftidtokens_refreshtoken_column','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','39f9488d-067a-43fc-984e-dd3633a25a1c'),
	(87,NULL,'app','m171218_143135_longtext_query_column','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','66d125ab-1d5e-4d60-9aca-2329aca277ac'),
	(88,NULL,'app','m171231_055546_environment_variables_to_aliases','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','5daaaae9-4307-4cf7-8150-acd694b3b62a'),
	(89,NULL,'app','m180113_153740_drop_users_archived_column','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','4750e9ae-a00c-45fa-aedb-6eb3f3976ea1'),
	(90,NULL,'app','m180122_213433_propagate_entries_setting','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','35f0631d-953c-4168-9086-2ffda2e65d84'),
	(91,NULL,'app','m180124_230459_fix_propagate_entries_values','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','264e4ba1-9e79-4c2a-b1b7-560ef811492a'),
	(92,NULL,'app','m180128_235202_set_tag_slugs','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','c6b496a3-15f6-4308-ad36-2481821fef72'),
	(93,NULL,'app','m180202_185551_fix_focal_points','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','3e7cff71-2b0e-4bce-b88d-f53053445286'),
	(94,NULL,'app','m180217_172123_tiny_ints','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','f26cfa64-8d0d-49f4-8312-db37378426a7'),
	(95,NULL,'app','m180321_233505_small_ints','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','b33b772a-ba6b-4af6-bea8-36d94d7b60a3'),
	(96,NULL,'app','m180328_115523_new_license_key_statuses','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','ff69c69c-9359-44ab-96fb-a8491c2f0bcd'),
	(97,NULL,'app','m180404_182320_edition_changes','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','e3ba9680-a8e7-4515-a352-d5bc7ffd7db1'),
	(98,NULL,'app','m180411_102218_fix_db_routes','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','4fde0d72-212e-463d-ab3a-b49dcb495e3d'),
	(99,NULL,'app','m180416_205628_resourcepaths_table','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','502632ec-9a86-4139-a3f7-03509c661f1c'),
	(100,NULL,'app','m180418_205713_widget_cleanup','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','3bb0da72-6ac1-4c3c-b0db-7175164c0ee6'),
	(101,NULL,'app','m180425_203349_searchable_fields','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','f58c72f3-64e7-4df8-a884-cf917a2d80b2'),
	(102,NULL,'app','m180516_153000_uids_in_field_settings','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','91d4c126-b499-4f65-9b1c-ae6f67cb587e'),
	(103,NULL,'app','m180517_173000_user_photo_volume_to_uid','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','ab1f899e-930d-45d0-b2ee-9d8c2fc2d4a4'),
	(104,NULL,'app','m180518_173000_permissions_to_uid','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','ac3799c9-06e4-4b56-b0fa-06a001bc4658'),
	(105,NULL,'app','m180520_173000_matrix_context_to_uids','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','43e0e1ee-30ca-469d-8123-c2c269d2476e'),
	(106,NULL,'app','m180521_173000_initial_yml_and_snapshot','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','cdcd5d19-12bc-4eca-8e30-34c161d68a4c'),
	(107,NULL,'app','m180731_162030_soft_delete_sites','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','621dd00f-2526-4c26-b6e6-e0efd692608d'),
	(108,NULL,'app','m180810_214427_soft_delete_field_layouts','2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:12:14','1411e366-cfa9-418f-819c-074482bddb4d'),
	(109,NULL,'app','m180810_214439_soft_delete_elements','2019-12-29 05:12:15','2019-12-29 05:12:15','2019-12-29 05:12:15','e7f8c71c-2c79-49fa-b19b-a9cb73386c1f'),
	(110,NULL,'app','m180824_193422_case_sensitivity_fixes','2019-12-29 05:12:15','2019-12-29 05:12:15','2019-12-29 05:12:15','3c99177d-ea9b-4c85-a0c5-f70c82e9e298'),
	(111,NULL,'app','m180901_151639_fix_matrixcontent_tables','2019-12-29 05:12:15','2019-12-29 05:12:15','2019-12-29 05:12:15','6ce1049f-c57a-476b-8555-ed72a6f8b826'),
	(112,NULL,'app','m180904_112109_permission_changes','2019-12-29 05:12:15','2019-12-29 05:12:15','2019-12-29 05:12:15','4dfb1d16-66ba-4c06-a426-20b0d2f65d9d'),
	(113,NULL,'app','m180910_142030_soft_delete_sitegroups','2019-12-29 05:12:15','2019-12-29 05:12:15','2019-12-29 05:12:15','692c23c6-5d76-4ee6-8ea2-eeb9ac11446f'),
	(114,NULL,'app','m181011_160000_soft_delete_asset_support','2019-12-29 05:12:15','2019-12-29 05:12:15','2019-12-29 05:12:15','7116158e-8b6a-42fc-86ea-64a016f9934a'),
	(115,NULL,'app','m181016_183648_set_default_user_settings','2019-12-29 05:12:15','2019-12-29 05:12:15','2019-12-29 05:12:15','729f6321-1329-4841-afba-a9358492f3b3'),
	(116,NULL,'app','m181017_225222_system_config_settings','2019-12-29 05:12:15','2019-12-29 05:12:15','2019-12-29 05:12:15','c1f1df56-5228-41dc-82a0-7310b34318e4'),
	(117,NULL,'app','m181018_222343_drop_userpermissions_from_config','2019-12-29 05:12:15','2019-12-29 05:12:15','2019-12-29 05:12:15','412dafe4-3a4b-49d5-bf75-31151c6c35e9'),
	(118,NULL,'app','m181029_130000_add_transforms_routes_to_config','2019-12-29 05:12:15','2019-12-29 05:12:15','2019-12-29 05:12:15','fab46bd3-2f6d-43cf-a441-24e69e24c80a'),
	(119,NULL,'app','m181112_203955_sequences_table','2019-12-29 05:12:15','2019-12-29 05:12:15','2019-12-29 05:12:15','0d28e37f-957f-4c73-88cb-b693fda03dd4'),
	(120,NULL,'app','m181121_001712_cleanup_field_configs','2019-12-29 05:12:15','2019-12-29 05:12:15','2019-12-29 05:12:15','f99b5ef4-9049-45af-9535-cc45c3431b30'),
	(121,NULL,'app','m181128_193942_fix_project_config','2019-12-29 05:12:15','2019-12-29 05:12:15','2019-12-29 05:12:15','ababed8f-2c36-43e0-a4d4-fe9004791f39'),
	(122,NULL,'app','m181130_143040_fix_schema_version','2019-12-29 05:12:15','2019-12-29 05:12:15','2019-12-29 05:12:15','0ce69fbf-3510-4acc-bc87-4e0aefdb57cf'),
	(123,NULL,'app','m181211_143040_fix_entry_type_uids','2019-12-29 05:12:15','2019-12-29 05:12:15','2019-12-29 05:12:15','4392414e-465e-4efd-95d6-f121d1e53ee9'),
	(124,NULL,'app','m181213_102500_config_map_aliases','2019-12-29 05:12:15','2019-12-29 05:12:15','2019-12-29 05:12:15','429ada52-f0bc-45fd-92e1-0ea61e410087'),
	(125,NULL,'app','m181217_153000_fix_structure_uids','2019-12-29 05:12:15','2019-12-29 05:12:15','2019-12-29 05:12:15','7f767201-03a1-4ed6-b033-33d4a63d3369'),
	(126,NULL,'app','m190104_152725_store_licensed_plugin_editions','2019-12-29 05:12:15','2019-12-29 05:12:15','2019-12-29 05:12:15','2066fc6c-86b8-4b96-afa3-fa15fab4307c'),
	(127,NULL,'app','m190108_110000_cleanup_project_config','2019-12-29 05:12:15','2019-12-29 05:12:15','2019-12-29 05:12:15','30622033-5cf2-4b42-b20c-72babd27249d'),
	(128,NULL,'app','m190108_113000_asset_field_setting_change','2019-12-29 05:12:15','2019-12-29 05:12:15','2019-12-29 05:12:15','2f10a243-e7d6-4744-a368-64d9afb70232'),
	(129,NULL,'app','m190109_172845_fix_colspan','2019-12-29 05:12:15','2019-12-29 05:12:15','2019-12-29 05:12:15','3f81126d-1e31-4067-b20d-304d20a26d9f'),
	(130,NULL,'app','m190110_150000_prune_nonexisting_sites','2019-12-29 05:12:15','2019-12-29 05:12:15','2019-12-29 05:12:15','56e4045b-c897-446f-9403-bc9820b3d1cb'),
	(131,NULL,'app','m190110_214819_soft_delete_volumes','2019-12-29 05:12:15','2019-12-29 05:12:15','2019-12-29 05:12:15','228ad402-9300-4e21-9e46-255fa6cd266b'),
	(132,NULL,'app','m190112_124737_fix_user_settings','2019-12-29 05:12:15','2019-12-29 05:12:15','2019-12-29 05:12:15','0d62cd2c-fd78-41ba-aa04-91059ef4ebda'),
	(133,NULL,'app','m190112_131225_fix_field_layouts','2019-12-29 05:12:15','2019-12-29 05:12:15','2019-12-29 05:12:15','cf86413d-b91e-4a5c-96a7-2911e161b6cc'),
	(134,NULL,'app','m190112_201010_more_soft_deletes','2019-12-29 05:12:15','2019-12-29 05:12:15','2019-12-29 05:12:15','9181c5eb-1a33-4f54-b4f3-787952be47fe'),
	(135,NULL,'app','m190114_143000_more_asset_field_setting_changes','2019-12-29 05:12:15','2019-12-29 05:12:15','2019-12-29 05:12:15','31fdbf72-44f5-47d3-91e2-afa569837a30'),
	(136,NULL,'app','m190121_120000_rich_text_config_setting','2019-12-29 05:12:15','2019-12-29 05:12:15','2019-12-29 05:12:15','9d09763e-57d3-47f0-9b89-d63a1d590e39'),
	(137,NULL,'app','m190125_191628_fix_email_transport_password','2019-12-29 05:12:15','2019-12-29 05:12:15','2019-12-29 05:12:15','93f2d3ee-fb06-48a7-a803-c8b5cd7d2dd5'),
	(138,NULL,'app','m190128_181422_cleanup_volume_folders','2019-12-29 05:12:15','2019-12-29 05:12:15','2019-12-29 05:12:15','4cb17fcf-7844-4680-95c0-dd48cc6f696e'),
	(139,NULL,'app','m190205_140000_fix_asset_soft_delete_index','2019-12-29 05:12:15','2019-12-29 05:12:15','2019-12-29 05:12:15','519c9dfa-acb9-42c9-87c1-3aae4401087b'),
	(140,NULL,'app','m190208_140000_reset_project_config_mapping','2019-12-29 05:12:15','2019-12-29 05:12:15','2019-12-29 05:12:15','8f2355bd-8c6e-4cde-a672-e322e963a186'),
	(141,NULL,'app','m190218_143000_element_index_settings_uid','2019-12-29 05:12:15','2019-12-29 05:12:15','2019-12-29 05:12:15','95317915-5049-47ac-8002-c5f120e96946'),
	(142,NULL,'app','m190312_152740_element_revisions','2019-12-29 05:12:15','2019-12-29 05:12:15','2019-12-29 05:12:15','9bc5de64-aed7-4d67-a241-4ad542439162'),
	(143,NULL,'app','m190327_235137_propagation_method','2019-12-29 05:12:15','2019-12-29 05:12:15','2019-12-29 05:12:15','b6e8cdac-067c-49e1-8703-d970dc6382f9'),
	(144,NULL,'app','m190401_223843_drop_old_indexes','2019-12-29 05:12:15','2019-12-29 05:12:15','2019-12-29 05:12:15','0194847a-8cf2-4a5f-90ed-fde40a442d9e'),
	(145,NULL,'app','m190416_014525_drop_unique_global_indexes','2019-12-29 05:12:15','2019-12-29 05:12:15','2019-12-29 05:12:15','adc4b8d4-cc9b-4aa8-86ce-38da79ef87a3'),
	(146,NULL,'app','m190417_085010_add_image_editor_permissions','2019-12-29 05:12:15','2019-12-29 05:12:15','2019-12-29 05:12:15','0206b5c8-efc9-437e-a508-eed3623eda58'),
	(147,NULL,'app','m190502_122019_store_default_user_group_uid','2019-12-29 05:12:15','2019-12-29 05:12:15','2019-12-29 05:12:15','1fe20476-e1d1-4492-a72c-19b05f982bd4'),
	(148,NULL,'app','m190504_150349_preview_targets','2019-12-29 05:12:15','2019-12-29 05:12:15','2019-12-29 05:12:15','a0fc6bef-a126-4344-bcb8-d6ece2a6327a'),
	(149,NULL,'app','m190516_184711_job_progress_label','2019-12-29 05:12:15','2019-12-29 05:12:15','2019-12-29 05:12:15','30c9942f-34ff-47bf-aefb-0165a3104799'),
	(150,NULL,'app','m190523_190303_optional_revision_creators','2019-12-29 05:12:15','2019-12-29 05:12:15','2019-12-29 05:12:15','b77f512c-5a26-4536-8505-8eecc5db5cc7'),
	(151,NULL,'app','m190529_204501_fix_duplicate_uids','2019-12-29 05:12:15','2019-12-29 05:12:15','2019-12-29 05:12:15','021546a3-7497-41d0-ba14-5b1b0ee593ff'),
	(152,NULL,'app','m190605_223807_unsaved_drafts','2019-12-29 05:12:15','2019-12-29 05:12:15','2019-12-29 05:12:15','056df3d5-5919-48f9-acda-5e9b4e7a7821'),
	(153,NULL,'app','m190607_230042_entry_revision_error_tables','2019-12-29 05:12:15','2019-12-29 05:12:15','2019-12-29 05:12:15','ce00d1d2-5e5f-4493-bbb5-8a77e43fa39e'),
	(154,NULL,'app','m190608_033429_drop_elements_uid_idx','2019-12-29 05:12:15','2019-12-29 05:12:15','2019-12-29 05:12:15','d6087f34-f7ce-4d2b-954a-ea0afa44cf94'),
	(155,NULL,'app','m190617_164400_add_gqlschemas_table','2019-12-29 05:12:15','2019-12-29 05:12:15','2019-12-29 05:12:15','d5797a8a-53ea-4493-a833-ff953f0e75c7'),
	(156,NULL,'app','m190624_234204_matrix_propagation_method','2019-12-29 05:12:15','2019-12-29 05:12:15','2019-12-29 05:12:15','25b4559e-71a0-417d-80c9-4ec011f46d8b'),
	(157,NULL,'app','m190711_153020_drop_snapshots','2019-12-29 05:12:15','2019-12-29 05:12:15','2019-12-29 05:12:15','1077504f-c47d-47f1-bad2-4739d9919439'),
	(158,NULL,'app','m190712_195914_no_draft_revisions','2019-12-29 05:12:15','2019-12-29 05:12:15','2019-12-29 05:12:15','4ba85ab4-5c0c-4551-9dcb-b11438c015c8'),
	(159,NULL,'app','m190723_140314_fix_preview_targets_column','2019-12-29 05:12:15','2019-12-29 05:12:15','2019-12-29 05:12:15','ae70ade2-03b8-4d16-ba2a-95cd46086dc7'),
	(160,NULL,'app','m190820_003519_flush_compiled_templates','2019-12-29 05:12:15','2019-12-29 05:12:15','2019-12-29 05:12:15','3020ad16-6df7-4a3a-957c-8739b4e37fa2'),
	(161,NULL,'app','m190823_020339_optional_draft_creators','2019-12-29 05:12:15','2019-12-29 05:12:15','2019-12-29 05:12:15','4b2b38ca-e7fa-40bf-a467-1a14a8a65cc2');

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table plugins
# ------------------------------------------------------------

DROP TABLE IF EXISTS `plugins`;

CREATE TABLE `plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `schemaVersion` varchar(255) NOT NULL,
  `licenseKeyStatus` enum('valid','invalid','mismatched','astray','unknown') NOT NULL DEFAULT 'unknown',
  `licensedEdition` varchar(255) DEFAULT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `plugins_handle_unq_idx` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;

INSERT INTO `plugins` (`id`, `handle`, `version`, `schemaVersion`, `licenseKeyStatus`, `licensedEdition`, `installDate`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'webhooks','2.2.0','2.2.0','unknown',NULL,'2019-12-29 05:12:12','2019-12-29 05:12:12','2019-12-29 05:12:20','ff96e5c2-3cc1-4630-b430-0da0dec4f1e6'),
	(2,'contact-form','2.2.5','1.0.0','unknown',NULL,'2019-12-29 05:12:12','2019-12-29 05:12:12','2019-12-29 05:12:20','b412bcfc-6884-4060-a93f-58fa3cc6deb4'),
	(3,'sendgrid','1.2.0','1.0.0','unknown',NULL,'2019-12-29 05:12:12','2019-12-29 05:12:12','2019-12-29 05:12:20','8821b7eb-3af1-43ab-9695-e69157288bfd');

/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table queue
# ------------------------------------------------------------

DROP TABLE IF EXISTS `queue`;

CREATE TABLE `queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job` longblob NOT NULL,
  `description` text,
  `timePushed` int(11) NOT NULL,
  `ttr` int(11) NOT NULL,
  `delay` int(11) NOT NULL DEFAULT '0',
  `priority` int(11) unsigned NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int(11) DEFAULT NULL,
  `progress` smallint(6) NOT NULL DEFAULT '0',
  `progressLabel` varchar(255) DEFAULT NULL,
  `attempt` int(11) DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text,
  PRIMARY KEY (`id`),
  KEY `queue_fail_timeUpdated_timePushed_idx` (`fail`,`timeUpdated`,`timePushed`),
  KEY `queue_fail_timeUpdated_delay_idx` (`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table relations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `relations`;

CREATE TABLE `relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceSiteId` int(11) DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `relations_fieldId_sourceId_sourceSiteId_targetId_unq_idx` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `relations_sourceId_idx` (`sourceId`),
  KEY `relations_targetId_idx` (`targetId`),
  KEY `relations_sourceSiteId_idx` (`sourceSiteId`),
  CONSTRAINT `relations_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `relations_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `relations_sourceSiteId_fk` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `relations_targetId_fk` FOREIGN KEY (`targetId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `relations` WRITE;
/*!40000 ALTER TABLE `relations` DISABLE KEYS */;

INSERT INTO `relations` (`id`, `fieldId`, `sourceId`, `sourceSiteId`, `targetId`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(4,17,10,NULL,5,1,'2019-12-29 05:34:11','2019-12-29 05:34:11','4da8752e-bb67-457a-b8b7-d2b9c57d22c8'),
	(8,17,12,NULL,3,1,'2019-12-29 05:34:27','2019-12-29 05:34:27','0a5a1729-7569-4039-a49d-1998ca439348'),
	(9,17,13,NULL,3,1,'2019-12-29 05:34:27','2019-12-29 05:34:27','7edd1408-6791-46b1-9316-034fd4a4cc6a'),
	(13,17,15,NULL,1,1,'2019-12-29 05:34:49','2019-12-29 05:34:49','ab15f7d8-12a8-49d4-96b6-44db06d67890'),
	(14,17,16,NULL,1,1,'2019-12-29 05:34:49','2019-12-29 05:34:49','0ecaf416-b2eb-4feb-9073-c4739724113f'),
	(15,17,9,NULL,5,1,'2019-12-29 05:37:43','2019-12-29 05:37:43','ce5a1652-9769-44bf-8954-b590c7d1c107'),
	(16,17,17,NULL,5,1,'2019-12-29 05:37:43','2019-12-29 05:37:43','f7f8687b-1580-4af1-b9e8-d674f2927984');

/*!40000 ALTER TABLE `relations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table resourcepaths
# ------------------------------------------------------------

DROP TABLE IF EXISTS `resourcepaths`;

CREATE TABLE `resourcepaths` (
  `hash` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `resourcepaths` WRITE;
/*!40000 ALTER TABLE `resourcepaths` DISABLE KEYS */;

INSERT INTO `resourcepaths` (`hash`, `path`)
VALUES
	('151dcc7d','@lib/selectize'),
	('1f7188f7','@lib/xregexp'),
	('208ed082','@lib/timepicker'),
	('22bbdffe','@app/web/assets/editsection/dist'),
	('2c1e906','@app/web/assets/edituser/dist'),
	('4163e1f9','@lib/picturefill'),
	('46c7dd3b','@lib/jquery-touch-events'),
	('4ae99bd5','@app/web/assets/editentry/dist'),
	('4fc6c1a8','@lib/d3'),
	('598be007','@lib/fileupload'),
	('693d0210','@lib/fabric'),
	('6a4f59d5','@app/web/assets/dashboard/dist'),
	('6d28779b','@app/web/assets/fields/dist'),
	('7c7bd62e','@lib/garnishjs'),
	('800ceb67','@craft/webhooks/assets/manage/dist'),
	('8427debb','@app/web/assets/craftsupport/dist'),
	('8ab5727a','@app/web/assets/updateswidget/dist'),
	('92efb1a6','@lib/jquery-ui'),
	('98abddcd','@app/web/assets/graphiql/dist'),
	('9ae02045','@app/web/assets/updater/dist'),
	('a9421799','@app/web/assets/cp/dist'),
	('ad7c02e7','@app/web/assets/login/dist'),
	('b40f3014','@app/web/assets/recententries/dist'),
	('c06185eb','@lib/jquery.payment'),
	('c2133b57','@app/web/assets/tablesettings/dist'),
	('cb395508','@app/web/assets/utilities/dist'),
	('cbe6b61','@lib/datepicker-i18n'),
	('cdc9dd7e','@bower/jquery/dist'),
	('d0595c27','@app/web/assets/feed/dist'),
	('d5dd7d21','@app/web/assets/userpermissions/dist'),
	('dc462a03','@lib/velocity'),
	('e1930848','@app/web/assets/matrixsettings/dist'),
	('e259768b','@lib/element-resize-detector'),
	('f5e31c86','@lib');

/*!40000 ALTER TABLE `resourcepaths` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table revisions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `revisions`;

CREATE TABLE `revisions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sourceId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `num` int(11) NOT NULL,
  `notes` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `revisions_sourceId_num_unq_idx` (`sourceId`,`num`),
  KEY `revisions_creatorId_fk` (`creatorId`),
  CONSTRAINT `revisions_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `revisions_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;

INSERT INTO `revisions` (`id`, `sourceId`, `creatorId`, `num`, `notes`)
VALUES
	(1,1,NULL,1,NULL),
	(2,3,NULL,1,NULL),
	(3,5,NULL,1,NULL),
	(4,9,7,1,NULL),
	(5,12,7,1,NULL),
	(6,15,7,1,NULL),
	(7,9,7,2,NULL);

/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table searchindex
# ------------------------------------------------------------

DROP TABLE IF EXISTS `searchindex`;

CREATE TABLE `searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `keywords` text NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `searchindex_keywords_idx` (`keywords`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;

INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`)
VALUES
	(1,'slug',0,1,' order form '),
	(1,'title',0,1,' order form '),
	(1,'field',1,1,''),
	(3,'slug',0,1,' home '),
	(3,'title',0,1,' home '),
	(3,'field',6,1,''),
	(5,'slug',0,1,' contact '),
	(5,'title',0,1,' contact '),
	(7,'username',0,1,' hmbl '),
	(7,'firstname',0,1,''),
	(7,'lastname',0,1,''),
	(7,'fullname',0,1,''),
	(7,'email',0,1,' h lawrence windowslive com '),
	(7,'slug',0,1,''),
	(7,'field',3,1,''),
	(7,'field',4,1,''),
	(7,'field',8,1,''),
	(9,'field',17,1,' contact '),
	(9,'slug',0,1,' contact '),
	(9,'title',0,1,' contact '),
	(12,'slug',0,1,' home '),
	(12,'title',0,1,' home '),
	(12,'field',17,1,' home '),
	(12,'field',16,1,' home '),
	(15,'slug',0,1,' order '),
	(15,'title',0,1,' order '),
	(15,'field',17,1,' order form '),
	(15,'field',16,1,' order '),
	(9,'field',16,1,' contact ');

/*!40000 ALTER TABLE `searchindex` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sections
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sections`;

CREATE TABLE `sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` enum('single','channel','structure') NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `propagationMethod` varchar(255) NOT NULL DEFAULT 'all',
  `previewTargets` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sections_handle_idx` (`handle`),
  KEY `sections_name_idx` (`name`),
  KEY `sections_structureId_idx` (`structureId`),
  KEY `sections_dateDeleted_idx` (`dateDeleted`),
  CONSTRAINT `sections_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;

INSERT INTO `sections` (`id`, `structureId`, `name`, `handle`, `type`, `enableVersioning`, `propagationMethod`, `previewTargets`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`)
VALUES
	(1,NULL,'Order Form','orderForm','single',1,'all',NULL,'2019-12-29 05:12:12','2019-12-29 05:12:12',NULL,'ab35d417-427e-443b-b529-21866d37ba58'),
	(2,NULL,'Home','home','single',1,'all',NULL,'2019-12-29 05:12:13','2019-12-29 05:12:13',NULL,'799c5f9f-5fc4-44eb-9ab5-6b5b70a2fd4d'),
	(3,NULL,'News','news','channel',1,'all',NULL,'2019-12-29 05:12:13','2019-12-29 05:12:13',NULL,'fbeaeb48-e4f3-44bb-b933-90a97eff2358'),
	(4,NULL,'Products','products','channel',1,'all',NULL,'2019-12-29 05:12:13','2019-12-29 05:12:13',NULL,'5a041f1d-964e-41a5-a3e7-36f0a91ec4e2'),
	(5,NULL,'Contact','contact','single',1,'all',NULL,'2019-12-29 05:12:13','2019-12-29 05:12:13',NULL,'a8cbca0d-d8d9-4dfd-bc56-39396f122ab0'),
	(6,NULL,'Navigation Menu','navigationMenu','channel',1,'all',NULL,'2019-12-29 05:31:43','2019-12-29 05:33:47',NULL,'cecda293-6e2b-44f3-a22d-0c49bdaf2a86');

/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sections_sites
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sections_sites`;

CREATE TABLE `sections_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sections_sites_sectionId_siteId_unq_idx` (`sectionId`,`siteId`),
  KEY `sections_sites_siteId_idx` (`siteId`),
  CONSTRAINT `sections_sites_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sections_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `sections_sites` WRITE;
/*!40000 ALTER TABLE `sections_sites` DISABLE KEYS */;

INSERT INTO `sections_sites` (`id`, `sectionId`, `siteId`, `hasUrls`, `uriFormat`, `template`, `enabledByDefault`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,1,1,'order','order/_entry',1,'2019-12-29 05:12:12','2019-12-29 05:12:12','eab17536-54ad-4409-a69f-acfef6d6bff0'),
	(2,2,1,1,'__home__','home/_entry',1,'2019-12-29 05:12:13','2019-12-29 05:12:13','63ad84d2-65ef-4468-9061-08768a1510a9'),
	(3,3,1,1,'news/{slug}','news/_entry',1,'2019-12-29 05:12:13','2019-12-29 05:12:13','c8775ceb-9e03-47ab-922f-0c118416848e'),
	(4,4,1,1,'products/{slug}','products/_entry',1,'2019-12-29 05:12:13','2019-12-29 05:12:13','c12e73e5-10f9-49a1-9d21-af62cccb77f2'),
	(5,5,1,1,'contact','contact/_entry',1,'2019-12-29 05:12:13','2019-12-29 05:12:13','f0d1e0b3-1d78-416f-bff7-cf6209f4154b'),
	(6,6,1,0,NULL,NULL,1,'2019-12-29 05:31:43','2019-12-29 05:33:47','ab4b6a05-7996-4293-9788-845329b6e658');

/*!40000 ALTER TABLE `sections_sites` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sequences
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sequences`;

CREATE TABLE `sequences` (
  `name` varchar(255) NOT NULL,
  `next` int(11) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table sessions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sessions`;

CREATE TABLE `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `token` char(100) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sessions_uid_idx` (`uid`),
  KEY `sessions_token_idx` (`token`),
  KEY `sessions_dateUpdated_idx` (`dateUpdated`),
  KEY `sessions_userId_idx` (`userId`),
  CONSTRAINT `sessions_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;

INSERT INTO `sessions` (`id`, `userId`, `token`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(2,7,'9h-uNMdHdJcYQ8yH711f0PKp8Z-FjGibyh_TSKqdtAT23GDbZydDreYEXW9azbQBlAUC4wQ-dV0_mtBG2E5kSig4-oRVZbaJbWDM','2019-12-29 05:27:39','2019-12-29 05:41:54','85bbfd39-3eb9-49d3-949d-970780a85c95');

/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table shunnedmessages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `shunnedmessages`;

CREATE TABLE `shunnedmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `shunnedmessages_userId_message_unq_idx` (`userId`,`message`),
  CONSTRAINT `shunnedmessages_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table sitegroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sitegroups`;

CREATE TABLE `sitegroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sitegroups_name_idx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `sitegroups` WRITE;
/*!40000 ALTER TABLE `sitegroups` DISABLE KEYS */;

INSERT INTO `sitegroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`)
VALUES
	(1,'Craft3 Jir6 Frb - Awatoru','2019-12-29 05:12:12','2019-12-29 05:12:12',NULL,'c9424660-0760-48b0-b613-2c3499cf4ff8');

/*!40000 ALTER TABLE `sitegroups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sites
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sites`;

CREATE TABLE `sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `language` varchar(12) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sites_dateDeleted_idx` (`dateDeleted`),
  KEY `sites_handle_idx` (`handle`),
  KEY `sites_sortOrder_idx` (`sortOrder`),
  KEY `sites_groupId_fk` (`groupId`),
  CONSTRAINT `sites_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;

INSERT INTO `sites` (`id`, `groupId`, `primary`, `name`, `handle`, `language`, `hasUrls`, `baseUrl`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`)
VALUES
	(1,1,1,'Awatoru App','default','en-NZ',1,'@web/',1,'2019-12-29 05:12:12','2019-12-29 05:12:13',NULL,'1d897520-a9e2-4981-beda-4254507df91e');

/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table structureelements
# ------------------------------------------------------------

DROP TABLE IF EXISTS `structureelements`;

CREATE TABLE `structureelements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) unsigned DEFAULT NULL,
  `lft` int(11) unsigned NOT NULL,
  `rgt` int(11) unsigned NOT NULL,
  `level` smallint(6) unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `structureelements_structureId_elementId_unq_idx` (`structureId`,`elementId`),
  KEY `structureelements_root_idx` (`root`),
  KEY `structureelements_lft_idx` (`lft`),
  KEY `structureelements_rgt_idx` (`rgt`),
  KEY `structureelements_level_idx` (`level`),
  KEY `structureelements_elementId_idx` (`elementId`),
  CONSTRAINT `structureelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `structureelements_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table structures
# ------------------------------------------------------------

DROP TABLE IF EXISTS `structures`;

CREATE TABLE `structures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `structures_dateDeleted_idx` (`dateDeleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table systemmessages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `systemmessages`;

CREATE TABLE `systemmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `systemmessages_key_language_unq_idx` (`key`,`language`),
  KEY `systemmessages_language_idx` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table taggroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `taggroups`;

CREATE TABLE `taggroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `taggroups_name_idx` (`name`),
  KEY `taggroups_handle_idx` (`handle`),
  KEY `taggroups_dateDeleted_idx` (`dateDeleted`),
  KEY `taggroups_fieldLayoutId_fk` (`fieldLayoutId`),
  CONSTRAINT `taggroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table tags
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tags`;

CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `tags_groupId_idx` (`groupId`),
  CONSTRAINT `tags_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tags_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table templatecacheelements
# ------------------------------------------------------------

DROP TABLE IF EXISTS `templatecacheelements`;

CREATE TABLE `templatecacheelements` (
  `cacheId` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  KEY `templatecacheelements_cacheId_idx` (`cacheId`),
  KEY `templatecacheelements_elementId_idx` (`elementId`),
  CONSTRAINT `templatecacheelements_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE,
  CONSTRAINT `templatecacheelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table templatecachequeries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `templatecachequeries`;

CREATE TABLE `templatecachequeries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cacheId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `query` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `templatecachequeries_cacheId_idx` (`cacheId`),
  KEY `templatecachequeries_type_idx` (`type`),
  CONSTRAINT `templatecachequeries_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table templatecaches
# ------------------------------------------------------------

DROP TABLE IF EXISTS `templatecaches`;

CREATE TABLE `templatecaches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteId` int(11) NOT NULL,
  `cacheKey` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `body` mediumtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `templatecaches_cacheKey_siteId_expiryDate_path_idx` (`cacheKey`,`siteId`,`expiryDate`,`path`),
  KEY `templatecaches_cacheKey_siteId_expiryDate_idx` (`cacheKey`,`siteId`,`expiryDate`),
  KEY `templatecaches_siteId_idx` (`siteId`),
  CONSTRAINT `templatecaches_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tokens`;

CREATE TABLE `tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` char(32) NOT NULL,
  `route` text,
  `usageLimit` tinyint(3) unsigned DEFAULT NULL,
  `usageCount` tinyint(3) unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tokens_token_unq_idx` (`token`),
  KEY `tokens_expiryDate_idx` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table usergroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `usergroups`;

CREATE TABLE `usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `usergroups_handle_unq_idx` (`handle`),
  UNIQUE KEY `usergroups_name_unq_idx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `usergroups` WRITE;
/*!40000 ALTER TABLE `usergroups` DISABLE KEYS */;

INSERT INTO `usergroups` (`id`, `name`, `handle`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'Restaurants ','restaurants','2019-12-29 05:12:13','2019-12-29 05:12:13','2bc2f604-a7fc-4567-b7db-bed1568be1c3');

/*!40000 ALTER TABLE `usergroups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table usergroups_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `usergroups_users`;

CREATE TABLE `usergroups_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `usergroups_users_groupId_userId_unq_idx` (`groupId`,`userId`),
  KEY `usergroups_users_userId_idx` (`userId`),
  CONSTRAINT `usergroups_users_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `usergroups_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table userpermissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `userpermissions`;

CREATE TABLE `userpermissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `userpermissions_name_unq_idx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table userpermissions_usergroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `userpermissions_usergroups`;

CREATE TABLE `userpermissions_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `userpermissions_usergroups_permissionId_groupId_unq_idx` (`permissionId`,`groupId`),
  KEY `userpermissions_usergroups_groupId_idx` (`groupId`),
  CONSTRAINT `userpermissions_usergroups_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `userpermissions_usergroups_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table userpermissions_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `userpermissions_users`;

CREATE TABLE `userpermissions_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `userpermissions_users_permissionId_userId_unq_idx` (`permissionId`,`userId`),
  KEY `userpermissions_users_userId_idx` (`userId`),
  CONSTRAINT `userpermissions_users_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `userpermissions_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table userpreferences
# ------------------------------------------------------------

DROP TABLE IF EXISTS `userpreferences`;

CREATE TABLE `userpreferences` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `preferences` text,
  PRIMARY KEY (`userId`),
  CONSTRAINT `userpreferences_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `userpreferences` WRITE;
/*!40000 ALTER TABLE `userpreferences` DISABLE KEYS */;

INSERT INTO `userpreferences` (`userId`, `preferences`)
VALUES
	(7,'{\"language\":\"en-NZ\"}');

/*!40000 ALTER TABLE `userpreferences` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `photoId` int(11) DEFAULT NULL,
  `firstName` varchar(100) DEFAULT NULL,
  `lastName` varchar(100) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(3) unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `users_uid_idx` (`uid`),
  KEY `users_verificationCode_idx` (`verificationCode`),
  KEY `users_email_idx` (`email`),
  KEY `users_username_idx` (`username`),
  KEY `users_photoId_fk` (`photoId`),
  CONSTRAINT `users_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `users_photoId_fk` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `username`, `photoId`, `firstName`, `lastName`, `email`, `password`, `admin`, `locked`, `suspended`, `pending`, `lastLoginDate`, `lastLoginAttemptIp`, `invalidLoginWindowStart`, `invalidLoginCount`, `lastInvalidLoginDate`, `lockoutDate`, `hasDashboard`, `verificationCode`, `verificationCodeIssuedDate`, `unverifiedEmail`, `passwordResetRequired`, `lastPasswordChangeDate`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(7,'hmbl',NULL,NULL,NULL,'h.lawrence@windowslive.com','$2y$13$MQPbrhA0Cu/gvqeafiNM1OtelMuBVtpnwLwRbXZnt36qCgugsE9TK',1,0,0,0,'2019-12-29 05:27:39',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'2019-12-29 05:12:14','2019-12-29 05:12:14','2019-12-29 05:27:39','429b1b64-c831-4439-bdc0-1f76fda85456');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table volumefolders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `volumefolders`;

CREATE TABLE `volumefolders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `volumefolders_name_parentId_volumeId_unq_idx` (`name`,`parentId`,`volumeId`),
  KEY `volumefolders_parentId_idx` (`parentId`),
  KEY `volumefolders_volumeId_idx` (`volumeId`),
  CONSTRAINT `volumefolders_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `volumefolders_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table volumes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `volumes`;

CREATE TABLE `volumes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `url` varchar(255) DEFAULT NULL,
  `settings` text,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `volumes_name_idx` (`name`),
  KEY `volumes_handle_idx` (`handle`),
  KEY `volumes_fieldLayoutId_idx` (`fieldLayoutId`),
  KEY `volumes_dateDeleted_idx` (`dateDeleted`),
  CONSTRAINT `volumes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table webhookgroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `webhookgroups`;

CREATE TABLE `webhookgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table webhookrequests
# ------------------------------------------------------------

DROP TABLE IF EXISTS `webhookrequests`;

CREATE TABLE `webhookrequests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `webhookId` int(11) DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `attempts` tinyint(3) DEFAULT NULL,
  `method` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `requestHeaders` text,
  `requestBody` mediumtext,
  `responseStatus` smallint(6) DEFAULT NULL,
  `responseHeaders` text,
  `responseBody` text,
  `responseTime` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateRequested` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `webhookrequests_webhookId_fk` (`webhookId`),
  CONSTRAINT `webhookrequests_webhookId_fk` FOREIGN KEY (`webhookId`) REFERENCES `webhooks` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table webhooks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `webhooks`;

CREATE TABLE `webhooks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `event` varchar(255) NOT NULL,
  `filters` text,
  `method` varchar(10) NOT NULL,
  `url` varchar(255) NOT NULL,
  `headers` text,
  `userAttributes` text,
  `senderAttributes` text,
  `eventAttributes` text,
  `payloadTemplate` mediumtext,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `webhooks_name_unq_idx` (`name`),
  KEY `webhooks_enabled_idx` (`enabled`),
  KEY `webhooks_groupId_name_idx` (`groupId`,`name`),
  CONSTRAINT `webhooks_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `webhookgroups` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table widgets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `widgets`;

CREATE TABLE `widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `colspan` tinyint(3) DEFAULT NULL,
  `settings` text,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `widgets_userId_idx` (`userId`),
  CONSTRAINT `widgets_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;

INSERT INTO `widgets` (`id`, `userId`, `type`, `sortOrder`, `colspan`, `settings`, `enabled`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,7,'craft\\widgets\\RecentEntries',1,NULL,'{\"section\":\"*\",\"siteId\":\"1\",\"limit\":10}',1,'2019-12-29 05:12:16','2019-12-29 05:12:16','7e594a7a-358f-449c-b4af-8dd3c8af679b'),
	(2,7,'craft\\widgets\\CraftSupport',2,NULL,'[]',1,'2019-12-29 05:12:16','2019-12-29 05:12:16','142ca35a-227f-43ff-9bdf-070993283db6'),
	(3,7,'craft\\widgets\\Updates',3,NULL,'[]',1,'2019-12-29 05:12:16','2019-12-29 05:12:16','2b1ff765-d183-49ea-87bd-24456a7a587b'),
	(4,7,'craft\\widgets\\Feed',4,NULL,'{\"url\":\"https://craftcms.com/news.rss\",\"title\":\"Craft News\",\"limit\":5}',1,'2019-12-29 05:12:16','2019-12-29 05:12:16','45a47a99-7bda-4188-a397-9679c7468fb6');

/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
