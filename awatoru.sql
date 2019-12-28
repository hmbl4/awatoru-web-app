-- MySQL dump 10.13  Distrib 5.7.27, for Linux (x86_64)
--
-- Host: craft3-jir6.mysql.us1.frbit.com    Database: craft3-jir6
-- ------------------------------------------------------
-- Server version	5.7.19-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `assetindexdata`
--

DROP TABLE IF EXISTS `assetindexdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `assets_filename_folderId_unq_idx` (`filename`,`folderId`),
  KEY `assets_folderId_idx` (`folderId`),
  KEY `assets_volumeId_idx` (`volumeId`),
  CONSTRAINT `assets_folderId_fk` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `assets_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `assets_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assettransformindex`
--

DROP TABLE IF EXISTS `assettransformindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assettransforms`
--

DROP TABLE IF EXISTS `assettransforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `categories_groupId_idx` (`groupId`),
  CONSTRAINT `categories_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `categories_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorygroups`
--

DROP TABLE IF EXISTS `categorygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorygroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `categorygroups_name_unq_idx` (`name`),
  UNIQUE KEY `categorygroups_handle_unq_idx` (`handle`),
  KEY `categorygroups_structureId_idx` (`structureId`),
  KEY `categorygroups_fieldLayoutId_idx` (`fieldLayoutId`),
  CONSTRAINT `categorygroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `categorygroups_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorygroups_sites`
--

DROP TABLE IF EXISTS `categorygroups_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  KEY `content_siteId_idx` (`siteId`),
  KEY `content_title_idx` (`title`),
  CONSTRAINT `content_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `content_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `craftidtokens`
--

DROP TABLE IF EXISTS `craftidtokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deprecationerrors`
--

DROP TABLE IF EXISTS `deprecationerrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elementindexsettings`
--

DROP TABLE IF EXISTS `elementindexsettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements`
--

DROP TABLE IF EXISTS `elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `elements_fieldLayoutId_idx` (`fieldLayoutId`),
  KEY `elements_type_idx` (`type`),
  KEY `elements_enabled_idx` (`enabled`),
  KEY `elements_archived_dateCreated_idx` (`archived`,`dateCreated`),
  CONSTRAINT `elements_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements_sites`
--

DROP TABLE IF EXISTS `elements_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entries`
--

DROP TABLE IF EXISTS `entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `entries_postDate_idx` (`postDate`),
  KEY `entries_expiryDate_idx` (`expiryDate`),
  KEY `entries_authorId_idx` (`authorId`),
  KEY `entries_sectionId_idx` (`sectionId`),
  KEY `entries_typeId_idx` (`typeId`),
  CONSTRAINT `entries_authorId_fk` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `entries_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `entries_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `entries_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entrydrafts`
--

DROP TABLE IF EXISTS `entrydrafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entrydrafts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entryId` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `creatorId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `notes` text,
  `data` mediumtext NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `entrydrafts_sectionId_idx` (`sectionId`),
  KEY `entrydrafts_entryId_siteId_idx` (`entryId`,`siteId`),
  KEY `entrydrafts_siteId_idx` (`siteId`),
  KEY `entrydrafts_creatorId_idx` (`creatorId`),
  CONSTRAINT `entrydrafts_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `entrydrafts_entryId_fk` FOREIGN KEY (`entryId`) REFERENCES `entries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `entrydrafts_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `entrydrafts_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entrytypes`
--

DROP TABLE IF EXISTS `entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `entrytypes_name_sectionId_unq_idx` (`name`,`sectionId`),
  UNIQUE KEY `entrytypes_handle_sectionId_unq_idx` (`handle`,`sectionId`),
  KEY `entrytypes_sectionId_idx` (`sectionId`),
  KEY `entrytypes_fieldLayoutId_idx` (`fieldLayoutId`),
  CONSTRAINT `entrytypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `entrytypes_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entryversions`
--

DROP TABLE IF EXISTS `entryversions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entryversions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entryId` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `siteId` int(11) NOT NULL,
  `num` smallint(6) unsigned NOT NULL,
  `notes` text,
  `data` mediumtext NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `entryversions_sectionId_idx` (`sectionId`),
  KEY `entryversions_entryId_siteId_idx` (`entryId`,`siteId`),
  KEY `entryversions_siteId_idx` (`siteId`),
  KEY `entryversions_creatorId_idx` (`creatorId`),
  CONSTRAINT `entryversions_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `entryversions_entryId_fk` FOREIGN KEY (`entryId`) REFERENCES `entries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `entryversions_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `entryversions_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldgroups`
--

DROP TABLE IF EXISTS `fieldgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `fieldgroups_name_unq_idx` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayoutfields`
--

DROP TABLE IF EXISTS `fieldlayoutfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayouts`
--

DROP TABLE IF EXISTS `fieldlayouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fieldlayouts_type_idx` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayouttabs`
--

DROP TABLE IF EXISTS `fieldlayouttabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `context` varchar(255) NOT NULL DEFAULT 'global',
  `instructions` text,
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `globalsets`
--

DROP TABLE IF EXISTS `globalsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `globalsets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `globalsets_name_unq_idx` (`name`),
  UNIQUE KEY `globalsets_handle_unq_idx` (`handle`),
  KEY `globalsets_fieldLayoutId_idx` (`fieldLayoutId`),
  CONSTRAINT `globalsets_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `globalsets_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(50) NOT NULL,
  `schemaVersion` varchar(15) NOT NULL,
  `edition` tinyint(3) unsigned NOT NULL,
  `timezone` varchar(30) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `on` tinyint(1) NOT NULL DEFAULT '0',
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `fieldVersion` char(12) NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixblocks`
--

DROP TABLE IF EXISTS `matrixblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `ownerSiteId` int(11) DEFAULT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `matrixblocks_ownerId_idx` (`ownerId`),
  KEY `matrixblocks_fieldId_idx` (`fieldId`),
  KEY `matrixblocks_typeId_idx` (`typeId`),
  KEY `matrixblocks_sortOrder_idx` (`sortOrder`),
  KEY `matrixblocks_ownerSiteId_idx` (`ownerSiteId`),
  CONSTRAINT `matrixblocks_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `matrixblocks_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `matrixblocks_ownerId_fk` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `matrixblocks_ownerSiteId_fk` FOREIGN KEY (`ownerSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `matrixblocks_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `matrixblocktypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixblocktypes`
--

DROP TABLE IF EXISTS `matrixblocktypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixcontent_availableproductslist`
--

DROP TABLE IF EXISTS `matrixcontent_availableproductslist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixcontent_availableproductslist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_product_availability` varchar(255) DEFAULT NULL,
  `field_product_productName` text,
  `field_product_price` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `matrixcontent_availableproductslist_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  KEY `matrixcontent_availableproductslist_siteId_fk` (`siteId`),
  CONSTRAINT `matrixcontent_availableproductslist_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `matrixcontent_availableproductslist_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `schemaVersion` varchar(255) NOT NULL,
  `licenseKey` char(24) DEFAULT NULL,
  `licenseKeyStatus` enum('valid','invalid','mismatched','astray','unknown') NOT NULL DEFAULT 'unknown',
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `settings` text,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `plugins_handle_unq_idx` (`handle`),
  KEY `plugins_enabled_idx` (`enabled`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `queue`
--

DROP TABLE IF EXISTS `queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  `attempt` int(11) DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text,
  PRIMARY KEY (`id`),
  KEY `queue_fail_timeUpdated_timePushed_idx` (`fail`,`timeUpdated`,`timePushed`),
  KEY `queue_fail_timeUpdated_delay_idx` (`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relations`
--

DROP TABLE IF EXISTS `relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `resourcepaths`
--

DROP TABLE IF EXISTS `resourcepaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resourcepaths` (
  `hash` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `routes`
--

DROP TABLE IF EXISTS `routes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `routes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteId` int(11) DEFAULT NULL,
  `uriParts` varchar(255) NOT NULL,
  `uriPattern` varchar(255) NOT NULL,
  `template` varchar(500) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `routes_uriPattern_idx` (`uriPattern`),
  KEY `routes_siteId_idx` (`siteId`),
  CONSTRAINT `routes_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `searchindex`
--

DROP TABLE IF EXISTS `searchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `keywords` text NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `searchindex_keywords_idx` (`keywords`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` enum('single','channel','structure') NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `propagateEntries` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sections_handle_unq_idx` (`handle`),
  UNIQUE KEY `sections_name_unq_idx` (`name`),
  KEY `sections_structureId_idx` (`structureId`),
  CONSTRAINT `sections_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections_sites`
--

DROP TABLE IF EXISTS `sections_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sequences`
--

DROP TABLE IF EXISTS `sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequences` (
  `name` varchar(255) NOT NULL,
  `next` int(11) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shunnedmessages`
--

DROP TABLE IF EXISTS `shunnedmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sitegroups`
--

DROP TABLE IF EXISTS `sitegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sitegroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sitegroups_name_unq_idx` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sites_handle_unq_idx` (`handle`),
  KEY `sites_sortOrder_idx` (`sortOrder`),
  KEY `sites_groupId_fk` (`groupId`),
  CONSTRAINT `sites_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structureelements`
--

DROP TABLE IF EXISTS `structureelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structures`
--

DROP TABLE IF EXISTS `structures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `systemmessages`
--

DROP TABLE IF EXISTS `systemmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `systemsettings`
--

DROP TABLE IF EXISTS `systemsettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `systemsettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(15) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `systemsettings_category_unq_idx` (`category`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taggroups`
--

DROP TABLE IF EXISTS `taggroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taggroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `taggroups_name_unq_idx` (`name`),
  UNIQUE KEY `taggroups_handle_unq_idx` (`handle`),
  KEY `taggroups_fieldLayoutId_fk` (`fieldLayoutId`),
  CONSTRAINT `taggroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `tags_groupId_idx` (`groupId`),
  CONSTRAINT `tags_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tags_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `templatecacheelements`
--

DROP TABLE IF EXISTS `templatecacheelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templatecacheelements` (
  `cacheId` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  KEY `templatecacheelements_cacheId_idx` (`cacheId`),
  KEY `templatecacheelements_elementId_idx` (`elementId`),
  CONSTRAINT `templatecacheelements_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE,
  CONSTRAINT `templatecacheelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `templatecachequeries`
--

DROP TABLE IF EXISTS `templatecachequeries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `templatecaches`
--

DROP TABLE IF EXISTS `templatecaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups`
--

DROP TABLE IF EXISTS `usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups_users`
--

DROP TABLE IF EXISTS `usergroups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions`
--

DROP TABLE IF EXISTS `userpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `userpermissions_name_unq_idx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions_usergroups`
--

DROP TABLE IF EXISTS `userpermissions_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions_users`
--

DROP TABLE IF EXISTS `userpermissions_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpreferences`
--

DROP TABLE IF EXISTS `userpreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpreferences` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `preferences` text,
  PRIMARY KEY (`userId`),
  CONSTRAINT `userpreferences_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumefolders`
--

DROP TABLE IF EXISTS `volumefolders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumes`
--

DROP TABLE IF EXISTS `volumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `volumes_name_unq_idx` (`name`),
  UNIQUE KEY `volumes_handle_unq_idx` (`handle`),
  KEY `volumes_fieldLayoutId_idx` (`fieldLayoutId`),
  CONSTRAINT `volumes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `colspan` tinyint(1) NOT NULL DEFAULT '0',
  `settings` text,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `widgets_userId_idx` (`userId`),
  CONSTRAINT `widgets_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'craft3-jir6'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-17  3:31:17
-- MySQL dump 10.13  Distrib 5.7.27, for Linux (x86_64)
--
-- Host: craft3-jir6.mysql.us1.frbit.com    Database: craft3-jir6
-- ------------------------------------------------------
-- Server version	5.7.19-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assettransforms`
--

LOCK TABLES `assettransforms` WRITE;
/*!40000 ALTER TABLE `assettransforms` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `assettransforms` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categorygroups`
--

LOCK TABLES `categorygroups` WRITE;
/*!40000 ALTER TABLE `categorygroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categorygroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categorygroups_sites`
--

LOCK TABLES `categorygroups_sites` WRITE;
/*!40000 ALTER TABLE `categorygroups_sites` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categorygroups_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `content` VALUES (1,1,1,NULL,'2019-11-17 03:11:01','2019-11-17 03:11:01','ca589bb0-904c-4876-a878-8f81ddd3d505'),(2,2,1,'Home','2019-11-17 03:13:40','2019-11-17 03:13:40','2d66bb25-e94b-4b8b-985b-b130df7af6ae'),(3,3,1,'Contact','2019-11-17 03:13:53','2019-11-17 03:13:53','98655dfa-538b-46b1-961d-59ff3f69de96'),(4,4,1,'Order Form','2019-11-17 03:14:44','2019-11-17 03:14:44','f2fd429c-05b5-4679-bc49-2ec9dda26af8'),(5,5,1,'Salmon','2019-11-17 03:22:44','2019-11-17 03:22:44','baed311d-1635-4feb-a2b5-e12e2418b5d4');
/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `craftidtokens`
--

LOCK TABLES `craftidtokens` WRITE;
/*!40000 ALTER TABLE `craftidtokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `craftidtokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `deprecationerrors`
--

LOCK TABLES `deprecationerrors` WRITE;
/*!40000 ALTER TABLE `deprecationerrors` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `deprecationerrors` VALUES (1,'ElementQuery::getIterator()','/srv/app/craft3-jir6/htdocs/templates/order/_entry.twig:16','2019-11-17 03:30:07','/srv/app/craft3-jir6/htdocs/templates/order/_entry.twig',16,'Looping through element queries directly has been deprecated. Use the all() function to fetch the query results before looping over them.','[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/srv/app/craft3-jir6/htdocs/vendor/craftcms/cms/src/elements/db/ElementQuery.php\",\"line\":456,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\EntryQuery\",\"file\":\"/srv/app/craft3-jir6/htdocs/storage/runtime/compiled_templates/3d/3d856a694b0518aae16a4774a801035de8b6db4c0249648cc0746b2dd4acf98b.php\",\"line\":58,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":\"__TwigTemplate_d2e451d4c931f9f617de371aa9f315fb8a3c3b27f916dfbccb1dc3c3b19b5013\",\"file\":\"/srv/app/craft3-jir6/htdocs/vendor/twig/twig/lib/Twig/Template.php\",\"line\":189,\"class\":\"__TwigTemplate_d2e451d4c931f9f617de371aa9f315fb8a3c3b27f916dfbccb1dc3c3b19b5013\",\"method\":\"block_content\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_d2e451d4c931f9f617de371aa9f315fb8a3c3b27f916dfbccb1dc3c3b19b5013, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c0904975e6e1d2c9ed59cebe600ac36487d1c135213763c9371b465ae1d53531\",\"file\":\"/srv/app/craft3-jir6/htdocs/storage/runtime/compiled_templates/2d/2d4bed5e0fbba3419cbfb96db5519ec19108b30fd1ef987e8a42bdf61de2106a.php\",\"line\":38,\"class\":\"Twig_Template\",\"method\":\"displayBlock\",\"args\":\"\\\"content\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_d2e451d4c931f9f617de371aa9f315fb8a3c3b27f916dfbccb1dc3c3b19b5013, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c0904975e6e1d2c9ed59cebe600ac36487d1c135213763c9371b465ae1d53531\",\"file\":\"/srv/app/craft3-jir6/htdocs/vendor/twig/twig/lib/Twig/Template.php\",\"line\":386,\"class\":\"__TwigTemplate_c0904975e6e1d2c9ed59cebe600ac36487d1c135213763c9371b465ae1d53531\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_d2e451d4c931f9f617de371aa9f315fb8a3c3b27f916dfbccb1dc3c3b19b5013, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c0904975e6e1d2c9ed59cebe600ac36487d1c135213763c9371b465ae1d53531\",\"file\":\"/srv/app/craft3-jir6/htdocs/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":49,\"class\":\"Twig_Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_d2e451d4c931f9f617de371aa9f315fb8a3c3b27f916dfbccb1dc3c3b19b5013, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c0904975e6e1d2c9ed59cebe600ac36487d1c135213763c9371b465ae1d53531\",\"file\":\"/srv/app/craft3-jir6/htdocs/vendor/twig/twig/lib/Twig/Template.php\",\"line\":363,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_d2e451d4c931f9f617de371aa9f315fb8a3c3b27f916dfbccb1dc3c3b19b5013, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c0904975e6e1d2c9ed59cebe600ac36487d1c135213763c9371b465ae1d53531\",\"file\":\"/srv/app/craft3-jir6/htdocs/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":31,\"class\":\"Twig_Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_d2e451d4c931f9f617de371aa9f315fb8a3c3b27f916dfbccb1dc3c3b19b5013, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c0904975e6e1d2c9ed59cebe600ac36487d1c135213763c9371b465ae1d53531\",\"file\":\"/srv/app/craft3-jir6/htdocs/storage/runtime/compiled_templates/3d/3d856a694b0518aae16a4774a801035de8b6db4c0249648cc0746b2dd4acf98b.php\",\"line\":28,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_d2e451d4c931f9f617de371aa9f315fb8a3c3b27f916dfbccb1dc3c3b19b5013, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_d2e451d4c931f9f617de371aa9f315fb8a3c3b27f916dfbccb1dc3c3b19b5013\",\"file\":\"/srv/app/craft3-jir6/htdocs/vendor/twig/twig/lib/Twig/Template.php\",\"line\":386,\"class\":\"__TwigTemplate_d2e451d4c931f9f617de371aa9f315fb8a3c3b27f916dfbccb1dc3c3b19b5013\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_d2e451d4c931f9f617de371aa9f315fb8a3c3b27f916dfbccb1dc3c3b19b5013, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_d2e451d4c931f9f617de371aa9f315fb8a3c3b27f916dfbccb1dc3c3b19b5013\",\"file\":\"/srv/app/craft3-jir6/htdocs/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":49,\"class\":\"Twig_Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_d2e451d4c931f9f617de371aa9f315fb8a3c3b27f916dfbccb1dc3c3b19b5013, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_d2e451d4c931f9f617de371aa9f315fb8a3c3b27f916dfbccb1dc3c3b19b5013\",\"file\":\"/srv/app/craft3-jir6/htdocs/vendor/twig/twig/lib/Twig/Template.php\",\"line\":363,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_d2e451d4c931f9f617de371aa9f315fb8a3c3b27f916dfbccb1dc3c3b19b5013, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_d2e451d4c931f9f617de371aa9f315fb8a3c3b27f916dfbccb1dc3c3b19b5013\",\"file\":\"/srv/app/craft3-jir6/htdocs/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":31,\"class\":\"Twig_Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"__TwigTemplate_d2e451d4c931f9f617de371aa9f315fb8a3c3b27f916dfbccb1dc3c3b19b5013\",\"file\":\"/srv/app/craft3-jir6/htdocs/vendor/twig/twig/lib/Twig/Template.php\",\"line\":371,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_d2e451d4c931f9f617de371aa9f315fb8a3c3b27f916dfbccb1dc3c3b19b5013\",\"file\":\"/srv/app/craft3-jir6/htdocs/vendor/twig/twig/lib/Twig/Environment.php\",\"line\":289,\"class\":\"Twig_Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"/srv/app/craft3-jir6/htdocs/vendor/craftcms/cms/src/web/View.php\",\"line\":331,\"class\":\"Twig_Environment\",\"method\":\"render\",\"args\":\"\\\"order/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/srv/app/craft3-jir6/htdocs/vendor/craftcms/cms/src/web/View.php\",\"line\":378,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"order/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/srv/app/craft3-jir6/htdocs/vendor/craftcms/cms/src/web/Controller.php\",\"line\":156,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"order/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/srv/app/craft3-jir6/htdocs/vendor/craftcms/cms/src/controllers/TemplatesController.php\",\"line\":78,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"order/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"order/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"/srv/app/craft3-jir6/htdocs/vendor/yiisoft/yii2/base/InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"order/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"/srv/app/craft3-jir6/htdocs/vendor/yiisoft/yii2/base/Controller.php\",\"line\":157,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"order/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"order\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/srv/app/craft3-jir6/htdocs/vendor/craftcms/cms/src/web/Controller.php\",\"line\":104,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"order/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"order\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/srv/app/craft3-jir6/htdocs/vendor/yiisoft/yii2/base/Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"order/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"order\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/srv/app/craft3-jir6/htdocs/vendor/craftcms/cms/src/web/Application.php\",\"line\":284,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"order/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"order\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/srv/app/craft3-jir6/htdocs/vendor/yiisoft/yii2/web/Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"order/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"order\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/srv/app/craft3-jir6/htdocs/vendor/craftcms/cms/src/web/Application.php\",\"line\":273,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/srv/app/craft3-jir6/htdocs/vendor/yiisoft/yii2/base/Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/srv/app/craft3-jir6/htdocs/web/index.php\",\"line\":21,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]','2019-11-17 03:30:07','2019-11-17 03:30:07','c913de40-5a90-441a-924c-ff799b8257aa');
/*!40000 ALTER TABLE `deprecationerrors` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elementindexsettings`
--

LOCK TABLES `elementindexsettings` WRITE;
/*!40000 ALTER TABLE `elementindexsettings` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `elementindexsettings` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements` VALUES (1,NULL,'craft\\elements\\User',1,0,'2019-11-17 03:11:01','2019-11-17 03:11:01','0d8e884e-9a5c-4ec7-b3fd-d9f8b1fd3084'),(2,1,'craft\\elements\\Entry',1,0,'2019-11-17 03:13:40','2019-11-17 03:13:40','7e2370a1-ddcf-4054-ace6-a33fbc894bac'),(3,2,'craft\\elements\\Entry',1,0,'2019-11-17 03:13:53','2019-11-17 03:13:53','93c724f1-089e-4c90-8b71-badf77829588'),(4,3,'craft\\elements\\Entry',1,0,'2019-11-17 03:14:44','2019-11-17 03:14:44','714dd698-8f6b-45a8-8eda-56d101a62c86'),(5,4,'craft\\elements\\Entry',1,0,'2019-11-17 03:22:44','2019-11-17 03:22:44','b5dff227-7914-4097-951c-63fd4e1b30c6'),(6,5,'craft\\elements\\MatrixBlock',1,0,'2019-11-17 03:22:44','2019-11-17 03:22:44','587b8516-e057-4bf5-ab65-539df260111e');
/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements_sites`
--

LOCK TABLES `elements_sites` WRITE;
/*!40000 ALTER TABLE `elements_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements_sites` VALUES (1,1,1,NULL,NULL,1,'2019-11-17 03:11:01','2019-11-17 03:11:01','0a6b8143-1bd8-42a6-abc1-9671612ff70d'),(2,2,1,'home','__home__',1,'2019-11-17 03:13:40','2019-11-17 03:13:40','a2532ddc-ee60-4ea7-af8b-2b22f96b8fd0'),(3,3,1,'contact','contact',1,'2019-11-17 03:13:53','2019-11-17 03:13:53','b18dfb0f-3ca0-4e82-8da4-59e835ba1e07'),(4,4,1,'order-form','order',1,'2019-11-17 03:14:44','2019-11-17 03:14:44','846f2230-3feb-4197-a3d6-013b070331ac'),(5,5,1,'salmon','products/salmon',1,'2019-11-17 03:22:44','2019-11-17 03:22:44','a16170d4-4d7c-4fc4-91ee-e4672cb2b578'),(6,6,1,NULL,NULL,1,'2019-11-17 03:22:44','2019-11-17 03:22:44','1223c602-c577-4732-a3a7-4160e5c1eada');
/*!40000 ALTER TABLE `elements_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entries`
--

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entries` VALUES (2,1,1,NULL,'2019-11-17 03:13:00',NULL,'2019-11-17 03:13:40','2019-11-17 03:13:40','5924dd6b-cf9b-40ec-9d87-3703c5fb3495'),(3,2,2,NULL,'2019-11-17 03:13:00',NULL,'2019-11-17 03:13:53','2019-11-17 03:13:53','6b013f5e-3787-4198-aadc-665fe885bf10'),(4,3,3,NULL,'2019-11-17 03:14:00',NULL,'2019-11-17 03:14:44','2019-11-17 03:14:44','8922c692-3973-433a-9908-e724044f18ce'),(5,4,4,1,'2019-11-17 03:22:00',NULL,'2019-11-17 03:22:44','2019-11-17 03:22:44','b5d3e471-5c12-4791-abdb-0957ede66678');
/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entrydrafts`
--

LOCK TABLES `entrydrafts` WRITE;
/*!40000 ALTER TABLE `entrydrafts` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `entrydrafts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entrytypes`
--

LOCK TABLES `entrytypes` WRITE;
/*!40000 ALTER TABLE `entrytypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entrytypes` VALUES (1,1,1,'Home','home',0,NULL,'{section.name|raw}',1,'2019-11-17 03:13:40','2019-11-17 03:13:40','1efb8a72-3c56-462d-9a85-0c686962f8cb'),(2,2,2,'Contact','contact',0,NULL,'{section.name|raw}',1,'2019-11-17 03:13:53','2019-11-17 03:13:53','819facc5-de6d-46f5-bb81-bb1982b4b5e8'),(3,3,3,'Order Form','orderForm',0,NULL,'{section.name|raw}',1,'2019-11-17 03:14:44','2019-11-17 03:14:44','65959724-a677-4bbf-b3c5-7053f5fdd9e9'),(4,4,4,'Products','products',1,'Title',NULL,1,'2019-11-17 03:15:14','2019-11-17 03:22:23','3c5453b2-9842-4725-9430-cf7723a09c1f');
/*!40000 ALTER TABLE `entrytypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entryversions`
--

LOCK TABLES `entryversions` WRITE;
/*!40000 ALTER TABLE `entryversions` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entryversions` VALUES (1,5,4,1,1,1,'','{\"typeId\":\"4\",\"authorId\":\"1\",\"title\":\"Salmon\",\"slug\":\"salmon\",\"postDate\":1573960920,\"expiryDate\":null,\"enabled\":true,\"newParentId\":null,\"fields\":{\"1\":{\"6\":{\"type\":\"product\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"availability\":[\"\"],\"productName\":\"Salmon\",\"image\":[],\"price\":\"24.99\"}}}}}','2019-11-17 03:22:44','2019-11-17 03:22:44','c33536f0-abef-4b11-99fa-ac247496e7cd');
/*!40000 ALTER TABLE `entryversions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldgroups`
--

LOCK TABLES `fieldgroups` WRITE;
/*!40000 ALTER TABLE `fieldgroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldgroups` VALUES (1,'Common','2019-11-17 03:11:01','2019-11-17 03:11:01','8ee3bcf1-2ef7-4684-bdc0-ce8ed5a1a3b1'),(2,'Products','2019-11-17 03:15:48','2019-11-17 03:15:48','4b000de0-c332-4c52-806f-0b6adf2a6140');
/*!40000 ALTER TABLE `fieldgroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayoutfields`
--

LOCK TABLES `fieldlayoutfields` WRITE;
/*!40000 ALTER TABLE `fieldlayoutfields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayoutfields` VALUES (1,5,1,2,0,1,'2019-11-17 03:18:17','2019-11-17 03:18:17','1572809a-adc4-45c5-9659-b7c99508afc3'),(2,5,1,3,0,2,'2019-11-17 03:18:17','2019-11-17 03:18:17','f0f85745-ceed-431b-89fd-614580fbe909'),(3,5,1,4,0,3,'2019-11-17 03:18:17','2019-11-17 03:18:17','853fff0b-fb62-41c0-b85c-d57d541ee5ab'),(4,5,1,5,0,4,'2019-11-17 03:18:17','2019-11-17 03:18:17','ec7e6faa-6106-434b-ad32-aabee6644a90'),(5,4,2,1,0,1,'2019-11-17 03:22:23','2019-11-17 03:22:23','a8807718-f57a-489e-b5f7-5b77a3b48a77');
/*!40000 ALTER TABLE `fieldlayoutfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayouts`
--

LOCK TABLES `fieldlayouts` WRITE;
/*!40000 ALTER TABLE `fieldlayouts` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayouts` VALUES (1,'craft\\elements\\Entry','2019-11-17 03:13:40','2019-11-17 03:13:40','989b76e3-f78d-46ba-a27c-f012bff692fb'),(2,'craft\\elements\\Entry','2019-11-17 03:13:53','2019-11-17 03:13:53','35c59b5a-36d4-49b0-80d6-4884cefb92ec'),(3,'craft\\elements\\Entry','2019-11-17 03:14:44','2019-11-17 03:14:44','001227e4-823c-493a-b92f-a6c42dfb0562'),(4,'craft\\elements\\Entry','2019-11-17 03:15:14','2019-11-17 03:22:23','613b0374-2727-4045-b3de-9fdbab131097'),(5,'craft\\elements\\MatrixBlock','2019-11-17 03:18:17','2019-11-17 03:18:17','0fcc6060-14f2-4f72-a741-21fe96c652c3');
/*!40000 ALTER TABLE `fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayouttabs`
--

LOCK TABLES `fieldlayouttabs` WRITE;
/*!40000 ALTER TABLE `fieldlayouttabs` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayouttabs` VALUES (1,5,'Content',1,'2019-11-17 03:18:17','2019-11-17 03:18:17','75202736-18f8-4fe4-b26e-1785ee9e00d2'),(2,4,'Tab 1',1,'2019-11-17 03:22:23','2019-11-17 03:22:23','f289690d-ac5a-4996-97ec-5933a65a14b3');
/*!40000 ALTER TABLE `fieldlayouttabs` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fields` VALUES (1,2,'Available Products List','availableProductsList','global','','site',NULL,'craft\\fields\\Matrix','{\"minBlocks\":\"\",\"maxBlocks\":\"\",\"contentTable\":\"{{%matrixcontent_availableproductslist}}\",\"localizeBlocks\":false}','2019-11-17 03:18:16','2019-11-17 03:18:16','d4a87a86-084c-4848-aa92-b1fc9e25105a'),(2,NULL,'Availability','availability','matrixBlockType:1','','none',NULL,'craft\\fields\\Checkboxes','{\"options\":[{\"label\":\"\",\"value\":\"\",\"default\":\"\"}]}','2019-11-17 03:18:17','2019-11-17 03:18:17','d65eba4b-0ef9-4a07-a43c-68b7a0a2055c'),(3,NULL,'Product Name','productName','matrixBlockType:1','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}','2019-11-17 03:18:17','2019-11-17 03:18:17','dc7c0ea3-60b2-424d-a3b7-ff0d9c9fa05a'),(4,NULL,'Image','image','matrixBlockType:1','','site',NULL,'craft\\fields\\Assets','{\"useSingleFolder\":\"\",\"defaultUploadLocationSource\":null,\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":null,\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"\",\"allowedKinds\":null,\"sources\":\"*\",\"source\":null,\"targetSiteId\":null,\"viewMode\":\"list\",\"limit\":\"\",\"selectionLabel\":\"\",\"localizeRelations\":false}','2019-11-17 03:18:17','2019-11-17 03:18:17','42738c61-5aa2-4bab-9291-99f00d280330'),(5,NULL,'Price','price','matrixBlockType:1','','none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}','2019-11-17 03:18:17','2019-11-17 03:18:17','7783fe8b-5611-487e-8e8f-2d16b1a8abfd');
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `globalsets`
--

LOCK TABLES `globalsets` WRITE;
/*!40000 ALTER TABLE `globalsets` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `globalsets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `info` VALUES (1,'3.0.41','3.0.94',0,'America/Los_Angeles','Craft3 Jir6 Frb - Awatoru',1,0,'YT7NGhAuuYl8','2019-11-17 03:11:01','2019-11-17 03:18:17','3bfb9b38-18be-4576-90fc-843650eef0bf');
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixblocks`
--

LOCK TABLES `matrixblocks` WRITE;
/*!40000 ALTER TABLE `matrixblocks` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `matrixblocks` VALUES (6,5,NULL,1,1,1,'2019-11-17 03:22:44','2019-11-17 03:22:44','fb915a34-a4d5-4019-863f-7b46f2ef30ee');
/*!40000 ALTER TABLE `matrixblocks` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixblocktypes`
--

LOCK TABLES `matrixblocktypes` WRITE;
/*!40000 ALTER TABLE `matrixblocktypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `matrixblocktypes` VALUES (1,1,5,'Product','product',1,'2019-11-17 03:18:16','2019-11-17 03:18:17','3685286b-99c1-4634-8d47-0fb02270cc67');
/*!40000 ALTER TABLE `matrixblocktypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixcontent_availableproductslist`
--

LOCK TABLES `matrixcontent_availableproductslist` WRITE;
/*!40000 ALTER TABLE `matrixcontent_availableproductslist` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `matrixcontent_availableproductslist` VALUES (1,6,1,'2019-11-17 03:22:44','2019-11-17 03:22:44','7fea3d67-b84d-4397-9749-242d3c65c4b3','[\"\"]','Salmon','24.99');
/*!40000 ALTER TABLE `matrixcontent_availableproductslist` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `migrations` VALUES (1,NULL,'app','Install','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','0c5c26e2-ced6-4f7b-9a46-a160d41059e3'),(2,NULL,'app','m150403_183908_migrations_table_changes','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','8703d4d0-3310-4016-9b15-bf2b68f3b276'),(3,NULL,'app','m150403_184247_plugins_table_changes','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','eea16543-0872-4264-9a88-25a564d7986c'),(4,NULL,'app','m150403_184533_field_version','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','2d8f99af-6a8d-4420-8889-0e3ccd1ee464'),(5,NULL,'app','m150403_184729_type_columns','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','b1795d89-4d7b-4aa9-8258-cd0f8b85f7fd'),(6,NULL,'app','m150403_185142_volumes','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','54b7c94c-d26a-41b6-b292-514e3ed2b56a'),(7,NULL,'app','m150428_231346_userpreferences','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','fab57dd8-c7ea-482b-a9d1-eea5f1a0f93e'),(8,NULL,'app','m150519_150900_fieldversion_conversion','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','6b3919e5-f211-4961-a9f1-4b6c97405126'),(9,NULL,'app','m150617_213829_update_email_settings','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','954ce719-7b41-40a9-bb8e-9639af62d4c3'),(10,NULL,'app','m150721_124739_templatecachequeries','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','4a53f185-a78c-46e3-8903-29c63cce666c'),(11,NULL,'app','m150724_140822_adjust_quality_settings','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','61198d0a-68cd-44d8-8974-ccc25b658786'),(12,NULL,'app','m150815_133521_last_login_attempt_ip','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','403555c6-0d60-44b9-9cd9-559a347629b7'),(13,NULL,'app','m151002_095935_volume_cache_settings','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','94e8509e-cbd5-46eb-921e-e6c596e17cbf'),(14,NULL,'app','m151005_142750_volume_s3_storage_settings','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','b99f9b0e-cd0a-4537-b744-5978596c4380'),(15,NULL,'app','m151016_133600_delete_asset_thumbnails','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','89fd69f7-15b6-451d-8656-f6f3af59004c'),(16,NULL,'app','m151209_000000_move_logo','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','602dedfc-ab2d-43b5-b477-a7d0a7f54d2b'),(17,NULL,'app','m151211_000000_rename_fileId_to_assetId','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','757f46ca-3a72-41dc-80c1-2ffbda507d96'),(18,NULL,'app','m151215_000000_rename_asset_permissions','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','5be2051f-b646-462e-a6af-a1005ba34638'),(19,NULL,'app','m160707_000001_rename_richtext_assetsource_setting','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','4cf51a21-c3ef-4df0-9e7b-c235903fa867'),(20,NULL,'app','m160708_185142_volume_hasUrls_setting','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','79681d21-22a7-4a39-b032-f33909ca7f35'),(21,NULL,'app','m160714_000000_increase_max_asset_filesize','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','f101243b-4561-4e32-ac1b-fe4f74830c7e'),(22,NULL,'app','m160727_194637_column_cleanup','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','fc49f639-d5c4-420d-90cd-9765b1211752'),(23,NULL,'app','m160804_110002_userphotos_to_assets','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','4903eed0-53ed-4b6a-a434-cf7d18b5735f'),(24,NULL,'app','m160807_144858_sites','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','357d5a0e-bff4-46f0-9465-08f8032108a3'),(25,NULL,'app','m160829_000000_pending_user_content_cleanup','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','8fe888a5-7968-4e75-9ba7-6fb13232e938'),(26,NULL,'app','m160830_000000_asset_index_uri_increase','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','c27f682f-17b9-44ab-b19c-739b2e76d12c'),(27,NULL,'app','m160912_230520_require_entry_type_id','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','ee8676f1-9108-4e7e-81bf-3093fbf1ec67'),(28,NULL,'app','m160913_134730_require_matrix_block_type_id','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','1cfc9a9b-a74e-41d6-a54d-26e61dcbbfb9'),(29,NULL,'app','m160920_174553_matrixblocks_owner_site_id_nullable','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','55a72546-3b0c-41a6-9995-07f2369e24e1'),(30,NULL,'app','m160920_231045_usergroup_handle_title_unique','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','7ead20fa-bbab-4bdd-bc4b-10e9d0b71f3e'),(31,NULL,'app','m160925_113941_route_uri_parts','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','1d05e58c-5014-452a-8e89-4886dcba26ca'),(32,NULL,'app','m161006_205918_schemaVersion_not_null','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','b8514886-015c-4948-b301-e1366812173f'),(33,NULL,'app','m161007_130653_update_email_settings','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','85d9cb61-4bfb-4e7e-b404-1f99d16dd755'),(34,NULL,'app','m161013_175052_newParentId','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','7e4f0cba-06f9-42f6-a28d-ce68fbef5e2d'),(35,NULL,'app','m161021_102916_fix_recent_entries_widgets','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','7328f347-d140-419b-a104-b35b1c7bcce2'),(36,NULL,'app','m161021_182140_rename_get_help_widget','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','6417a213-d31f-4b3e-aed8-54df1975f2aa'),(37,NULL,'app','m161025_000000_fix_char_columns','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','4811713d-773b-42a0-97f9-fb68975c8640'),(38,NULL,'app','m161029_124145_email_message_languages','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','8680e03b-21ec-4a26-bb01-eda66da5e33e'),(39,NULL,'app','m161108_000000_new_version_format','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','dc29fa92-238c-471e-8c6d-d2c13ef9c985'),(40,NULL,'app','m161109_000000_index_shuffle','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','26c79b80-6020-4d84-9cd7-96354abb040d'),(41,NULL,'app','m161122_185500_no_craft_app','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','37359d20-1b86-422a-9df3-44667c1304d0'),(42,NULL,'app','m161125_150752_clear_urlmanager_cache','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','e8f5103b-0f4b-4087-8046-249da31a2d38'),(43,NULL,'app','m161220_000000_volumes_hasurl_notnull','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','d0fc669d-538b-4bab-b1c5-76eb14a43e57'),(44,NULL,'app','m170114_161144_udates_permission','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','afd41b6a-0ca6-4c78-ab8a-fa78f9418716'),(45,NULL,'app','m170120_000000_schema_cleanup','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','73d2267f-be66-4849-928d-4fb602d1dfad'),(46,NULL,'app','m170126_000000_assets_focal_point','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','04be9819-b4ee-4509-a1ef-489255801c92'),(47,NULL,'app','m170206_142126_system_name','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','e777a538-4085-4426-8fca-ae30db3d25e1'),(48,NULL,'app','m170217_044740_category_branch_limits','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','3bffe5af-21a7-4075-8c30-173f2a0e40d4'),(49,NULL,'app','m170217_120224_asset_indexing_columns','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','868a2990-9812-4f0d-abe6-81c791acb13a'),(50,NULL,'app','m170223_224012_plain_text_settings','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','114c86a3-c26b-455d-9c52-8d4a04a97de8'),(51,NULL,'app','m170227_120814_focal_point_percentage','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','c6e36146-9538-43a0-8774-f471ad93e55d'),(52,NULL,'app','m170228_171113_system_messages','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','52f8967f-fcbd-46b2-a83d-e731507a82d9'),(53,NULL,'app','m170303_140500_asset_field_source_settings','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','4621e210-8f3c-41e3-8e8b-e4808673456f'),(54,NULL,'app','m170306_150500_asset_temporary_uploads','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','c79e383d-097c-4f16-a5da-e069631184b7'),(55,NULL,'app','m170414_162429_rich_text_config_setting','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','ff0e1c32-5f75-4023-a5df-aab566ef8b5d'),(56,NULL,'app','m170523_190652_element_field_layout_ids','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','ed36d605-b1f7-4e16-a3bf-124cfdc33949'),(57,NULL,'app','m170612_000000_route_index_shuffle','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','a237e07d-9159-433d-afbe-257b51629a5a'),(58,NULL,'app','m170621_195237_format_plugin_handles','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','566ed82b-e3f9-44eb-a318-b5d5d8bf3654'),(59,NULL,'app','m170630_161028_deprecation_changes','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','db2e623e-b866-483f-a8e5-41bc21255108'),(60,NULL,'app','m170703_181539_plugins_table_tweaks','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','f8db9ab5-0269-4e0b-9ac7-7c25ead5c990'),(61,NULL,'app','m170704_134916_sites_tables','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','608b361b-c305-4e05-8641-019c692e1c81'),(62,NULL,'app','m170706_183216_rename_sequences','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','06a0f38e-5976-4cfd-bba3-39d485ff6d19'),(63,NULL,'app','m170707_094758_delete_compiled_traits','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','8fb2e991-5077-4249-83cd-64d2847f9fa5'),(64,NULL,'app','m170731_190138_drop_asset_packagist','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','e71c0c3f-7b6e-40bc-b531-6f2152c3f4b7'),(65,NULL,'app','m170810_201318_create_queue_table','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','f5802109-8445-4a3c-ac17-50d19ac9d165'),(66,NULL,'app','m170816_133741_delete_compiled_behaviors','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','03f53913-f9a0-419a-b4ed-d3daab897c67'),(67,NULL,'app','m170821_180624_deprecation_line_nullable','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','197eac89-3a24-4dfa-b5d3-2c7f6920a226'),(68,NULL,'app','m170903_192801_longblob_for_queue_jobs','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','5038e4e4-03de-4c44-bbcf-f019b6914b08'),(69,NULL,'app','m170914_204621_asset_cache_shuffle','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','23066f08-faa3-4d20-9634-5481542de80a'),(70,NULL,'app','m171011_214115_site_groups','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','c508183b-e8ee-44e0-a704-ae8d27768a79'),(71,NULL,'app','m171012_151440_primary_site','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','6ce1a41c-5c8d-463d-97b1-f371090e6581'),(72,NULL,'app','m171013_142500_transform_interlace','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','91b8bc28-2d27-423b-b569-82396cbb989c'),(73,NULL,'app','m171016_092553_drop_position_select','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','8a635c4c-491b-4c59-bb10-1e8d508ea04c'),(74,NULL,'app','m171016_221244_less_strict_translation_method','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','98821059-ed28-431f-be59-fa457524483e'),(75,NULL,'app','m171107_000000_assign_group_permissions','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','882208d2-a623-48f8-bcc4-c7980575474a'),(76,NULL,'app','m171117_000001_templatecache_index_tune','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','d7eda791-707d-4fe3-b03b-77abfc596db5'),(77,NULL,'app','m171126_105927_disabled_plugins','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','cb57b0b0-b375-4c1f-9adf-256b91ef898f'),(78,NULL,'app','m171130_214407_craftidtokens_table','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','94250655-ffda-47da-8d2f-cbd40bb99af0'),(79,NULL,'app','m171202_004225_update_email_settings','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','41ebb9c8-58ae-42ee-ad70-1f9e2f7cb9f5'),(80,NULL,'app','m171204_000001_templatecache_index_tune_deux','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','9b9d40d6-12fd-4aa4-98fb-451e2dd3bf51'),(81,NULL,'app','m171205_130908_remove_craftidtokens_refreshtoken_column','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','e7aca334-1f31-4018-afef-02a2771abe9f'),(82,NULL,'app','m171218_143135_longtext_query_column','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','7442b38c-e35d-4b14-955d-8a37b2e2b594'),(83,NULL,'app','m171231_055546_environment_variables_to_aliases','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','c74132bf-44a6-4bb9-89a9-84e0318da194'),(84,NULL,'app','m180113_153740_drop_users_archived_column','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','9b049ec7-72c9-4ecb-8563-ac8e13dcd45d'),(85,NULL,'app','m180122_213433_propagate_entries_setting','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','b650b2a6-2a29-4ceb-8d9d-6d83077c1922'),(86,NULL,'app','m180124_230459_fix_propagate_entries_values','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','f4dbeafb-7654-4517-aacb-2038c5a0d0a2'),(87,NULL,'app','m180128_235202_set_tag_slugs','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','924e07fc-b9e0-4ed5-a976-c994ed5b404e'),(88,NULL,'app','m180202_185551_fix_focal_points','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','6c3c835f-3bc0-47c2-9a02-39ab3e5d9098'),(89,NULL,'app','m180217_172123_tiny_ints','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','717be5ae-159f-4d97-86a5-dc9f5c1162d6'),(90,NULL,'app','m180321_233505_small_ints','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','03c18bb7-b311-4c8a-bef4-2267ab81009f'),(91,NULL,'app','m180328_115523_new_license_key_statuses','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','12310ded-dc5e-465c-96a8-134b4be30673'),(92,NULL,'app','m180404_182320_edition_changes','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','565de212-2c2c-4fc8-9e0c-b798cf38c744'),(93,NULL,'app','m180411_102218_fix_db_routes','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','03441ee4-6a41-465c-aea7-d5587dc28619'),(94,NULL,'app','m180416_205628_resourcepaths_table','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','4f89c2b9-92e6-4dd9-abba-e5ef33b1334e'),(95,NULL,'app','m180418_205713_widget_cleanup','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','8d29dc57-12ae-42a6-babb-dd7a7d1137a4'),(96,NULL,'app','m180824_193422_case_sensitivity_fixes','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','43e3471d-0318-4951-8704-fc98615b440b'),(97,NULL,'app','m180901_151639_fix_matrixcontent_tables','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','cd74b9e8-5088-40b5-b5f4-010030d95f23'),(98,NULL,'app','m181112_203955_sequences_table','2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:02','58caf7c0-9533-45ce-ae0c-294c00a084bd');
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `plugins`
--

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `queue`
--

LOCK TABLES `queue` WRITE;
/*!40000 ALTER TABLE `queue` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `queue` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `relations`
--

LOCK TABLES `relations` WRITE;
/*!40000 ALTER TABLE `relations` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `relations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `resourcepaths`
--

LOCK TABLES `resourcepaths` WRITE;
/*!40000 ALTER TABLE `resourcepaths` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `resourcepaths` VALUES ('12207c6e','@lib/xregexp'),('184c38e4','@lib/selectize'),('1ef9ff8','@lib/datepicker-i18n'),('2ddf241b','@lib/timepicker'),('42973531','@lib/d3'),('47b86f4c','@app/web/assets/editentry/dist'),('489a4d78','@app/web/assets/matrix/dist'),('4b9629a2','@lib/jquery-touch-events'),('4c321560','@lib/picturefill'),('51d3c4c2','@app/web/assets/sites/dist'),('54da149e','@lib/fileupload'),('5856226f','@app/web/assets/dbbackup/dist'),('60798302','@app/web/assets/fields/dist'),('646cf689','@lib/fabric'),('6682bf49','@app/web/assets/deprecationerrors/dist'),('671ead4c','@app/web/assets/dashboard/dist'),('712a22b7','@lib/garnishjs'),('78e3623d','@app/web/assets/updates/dist'),('87e486e3','@app/web/assets/updateswidget/dist'),('89762a22','@app/web/assets/craftsupport/dist'),('9340eaf2','@app/web/assets/generalsettings/dist'),('9fbe453f','@lib/jquery-ui'),('a413e300','@app/web/assets/cp/dist'),('a8ab3fcc','@app/web/assets/searchindexes/dist'),('b95ec48d','@app/web/assets/recententries/dist'),('bf2bae2b','@app/web/assets/pluginstore/dist'),('c09829e7','@bower/jquery/dist'),('c668a191','@app/web/assets/utilities/dist'),('cd307172','@lib/jquery.payment'),('cf42cfce','@app/web/assets/tablesettings/dist'),('d117de9a','@lib/velocity'),('dd08a8be','@app/web/assets/feed/dist'),('ecc2fcd1','@app/web/assets/matrixsettings/dist'),('ef088212','@lib/element-resize-detector'),('f2bd117e','@app/web/assets/routes/dist'),('f8b2e81f','@lib');
/*!40000 ALTER TABLE `resourcepaths` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `routes`
--

LOCK TABLES `routes` WRITE;
/*!40000 ALTER TABLE `routes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `routes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `searchindex`
--

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `searchindex` VALUES (1,'username',0,1,' admin '),(1,'firstname',0,1,''),(1,'lastname',0,1,''),(1,'fullname',0,1,''),(1,'email',0,1,' h lawrence windowslive com '),(1,'slug',0,1,''),(2,'slug',0,1,' home '),(2,'title',0,1,' home '),(3,'slug',0,1,' contact '),(3,'title',0,1,' contact '),(4,'slug',0,1,' order form '),(4,'title',0,1,' order form '),(5,'field',1,1,' 24 99 salmon '),(6,'field',2,1,''),(6,'field',3,1,' salmon '),(6,'field',4,1,''),(6,'field',5,1,' 24 99 '),(6,'slug',0,1,''),(5,'slug',0,1,' salmon '),(5,'title',0,1,' salmon ');
/*!40000 ALTER TABLE `searchindex` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections` VALUES (1,NULL,'Home','home','single',1,1,'2019-11-17 03:13:40','2019-11-17 03:13:40','799c5f9f-5fc4-44eb-9ab5-6b5b70a2fd4d'),(2,NULL,'Contact','contact','single',1,1,'2019-11-17 03:13:53','2019-11-17 03:13:53','a8cbca0d-d8d9-4dfd-bc56-39396f122ab0'),(3,NULL,'Order Form','orderForm','single',1,1,'2019-11-17 03:14:44','2019-11-17 03:14:44','ab35d417-427e-443b-b529-21866d37ba58'),(4,NULL,'Products','products','channel',1,1,'2019-11-17 03:15:14','2019-11-17 03:15:14','5a041f1d-964e-41a5-a3e7-36f0a91ec4e2');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections_sites`
--

LOCK TABLES `sections_sites` WRITE;
/*!40000 ALTER TABLE `sections_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections_sites` VALUES (1,1,1,1,'__home__','home/_entry',1,'2019-11-17 03:13:40','2019-11-17 03:13:40','ba186535-2c2b-47f3-8230-714cce776e50'),(2,2,1,1,'contact','contact/_entry',1,'2019-11-17 03:13:53','2019-11-17 03:13:53','93bd21b5-0ce9-41ba-9316-71696d48b509'),(3,3,1,1,'order','order/_entry',1,'2019-11-17 03:14:44','2019-11-17 03:14:44','871d7c77-8e8e-42d7-99e1-9cf60956eb88'),(4,4,1,1,'products/{slug}','products/_entry',1,'2019-11-17 03:15:14','2019-11-17 03:15:14','19a9bc70-06e4-43a2-bb67-78dca8d6e683');
/*!40000 ALTER TABLE `sections_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sequences`
--

LOCK TABLES `sequences` WRITE;
/*!40000 ALTER TABLE `sequences` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sequences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `shunnedmessages`
--

LOCK TABLES `shunnedmessages` WRITE;
/*!40000 ALTER TABLE `shunnedmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `shunnedmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sitegroups`
--

LOCK TABLES `sitegroups` WRITE;
/*!40000 ALTER TABLE `sitegroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sitegroups` VALUES (1,'Craft3 Jir6 Frb - Awatoru','2019-11-17 03:11:01','2019-11-17 03:11:01','c9424660-0760-48b0-b613-2c3499cf4ff8');
/*!40000 ALTER TABLE `sitegroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sites` VALUES (1,1,1,'Craft3 Jir6 Frb - Awatoru','default','en-GB',1,'@web/',1,'2019-11-17 03:11:01','2019-11-17 03:11:01','1d897520-a9e2-4981-beda-4254507df91e');
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structureelements`
--

LOCK TABLES `structureelements` WRITE;
/*!40000 ALTER TABLE `structureelements` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `structureelements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structures`
--

LOCK TABLES `structures` WRITE;
/*!40000 ALTER TABLE `structures` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `structures` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `systemmessages`
--

LOCK TABLES `systemmessages` WRITE;
/*!40000 ALTER TABLE `systemmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `systemmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `systemsettings`
--

LOCK TABLES `systemsettings` WRITE;
/*!40000 ALTER TABLE `systemsettings` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `systemsettings` VALUES (1,'email','{\"fromEmail\":\"h.lawrence@windowslive.com\",\"fromName\":\"Craft3 Jir6 Frb - Awatoru\",\"transportType\":\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"}','2019-11-17 03:11:02','2019-11-17 03:11:02','80477131-32bc-47c3-96f6-9ec00e272876');
/*!40000 ALTER TABLE `systemsettings` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `taggroups`
--

LOCK TABLES `taggroups` WRITE;
/*!40000 ALTER TABLE `taggroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `taggroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `templatecachequeries`
--

LOCK TABLES `templatecachequeries` WRITE;
/*!40000 ALTER TABLE `templatecachequeries` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `templatecachequeries` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups`
--

LOCK TABLES `usergroups` WRITE;
/*!40000 ALTER TABLE `usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups_users`
--

LOCK TABLES `usergroups_users` WRITE;
/*!40000 ALTER TABLE `usergroups_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `usergroups_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions`
--

LOCK TABLES `userpermissions` WRITE;
/*!40000 ALTER TABLE `userpermissions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions_usergroups`
--

LOCK TABLES `userpermissions_usergroups` WRITE;
/*!40000 ALTER TABLE `userpermissions_usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions_usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions_users`
--

LOCK TABLES `userpermissions_users` WRITE;
/*!40000 ALTER TABLE `userpermissions_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpreferences`
--

LOCK TABLES `userpreferences` WRITE;
/*!40000 ALTER TABLE `userpreferences` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `userpreferences` VALUES (1,'{\"language\":\"en-GB\"}');
/*!40000 ALTER TABLE `userpreferences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `users` VALUES (1,'admin',NULL,NULL,NULL,'h.lawrence@windowslive.com','$2y$13$8fONmUPzE0IoRDk8rOj2ZeHyZ18U595IF5jc3RDKYtpbFzw.jOcS.',1,0,0,0,'2019-11-17 03:11:02','118.92.26.65',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'2019-11-17 03:11:02','2019-11-17 03:11:02','2019-11-17 03:11:04','c581720b-95ca-4966-96d3-bc70c6f75dfb');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumefolders`
--

LOCK TABLES `volumefolders` WRITE;
/*!40000 ALTER TABLE `volumefolders` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `volumefolders` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumes`
--

LOCK TABLES `volumes` WRITE;
/*!40000 ALTER TABLE `volumes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `volumes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `widgets` VALUES (1,1,'craft\\widgets\\RecentEntries',1,0,'{\"section\":\"*\",\"siteId\":\"1\",\"limit\":10}',1,'2019-11-17 03:11:04','2019-11-17 03:11:04','2f09cfd1-4ce4-4e97-ba4c-534250770e1d'),(2,1,'craft\\widgets\\CraftSupport',2,0,'[]',1,'2019-11-17 03:11:04','2019-11-17 03:11:04','81c95359-a455-4294-ae15-e4ee91f120c8'),(3,1,'craft\\widgets\\Updates',3,0,'[]',1,'2019-11-17 03:11:04','2019-11-17 03:11:04','eaccbf3d-5b39-4b30-b833-15f02f88a60e'),(4,1,'craft\\widgets\\Feed',4,0,'{\"url\":\"https://craftcms.com/news.rss\",\"title\":\"Craft News\",\"limit\":5}',1,'2019-11-17 03:11:04','2019-11-17 03:11:04','19caa5fe-844b-4baa-bdb9-5fdcfa4a79dc');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping routines for database 'craft3-jir6'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-17  3:31:18
