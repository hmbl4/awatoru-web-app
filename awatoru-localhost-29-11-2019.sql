-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Nov 29, 2019 at 11:12 PM
-- Server version: 5.7.26
-- PHP Version: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mydb`
--
CREATE DATABASE IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `mydb`;

-- --------------------------------------------------------

--
-- Table structure for table `assetindexdata`
--

CREATE TABLE `assetindexdata` (
  `id` int(11) NOT NULL,
  `sessionId` varchar(36) NOT NULL DEFAULT '',
  `volumeId` int(11) NOT NULL,
  `uri` text,
  `size` bigint(20) UNSIGNED DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `recordId` int(11) DEFAULT NULL,
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `assets`
--

CREATE TABLE `assets` (
  `id` int(11) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `kind` varchar(50) NOT NULL DEFAULT 'unknown',
  `width` int(11) UNSIGNED DEFAULT NULL,
  `height` int(11) UNSIGNED DEFAULT NULL,
  `size` bigint(20) UNSIGNED DEFAULT NULL,
  `focalPoint` varchar(13) DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `assettransformindex`
--

CREATE TABLE `assettransformindex` (
  `id` int(11) NOT NULL,
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
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `assettransforms`
--

CREATE TABLE `assettransforms` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `mode` enum('stretch','fit','crop') NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') NOT NULL DEFAULT 'center-center',
  `width` int(11) UNSIGNED DEFAULT NULL,
  `height` int(11) UNSIGNED DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') NOT NULL DEFAULT 'none',
  `dimensionChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `categorygroups`
--

CREATE TABLE `categorygroups` (
  `id` int(11) NOT NULL,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `categorygroups_sites`
--

CREATE TABLE `categorygroups_sites` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `content`
--

CREATE TABLE `content` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_newsTitle` text,
  `field_newsDescription` text,
  `field_firstName` text,
  `field_lastName` text,
  `field_email` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `content`
--

INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_newsTitle`, `field_newsDescription`, `field_firstName`, `field_lastName`, `field_email`) VALUES
(1, 1, 1, NULL, '2019-11-17 03:11:01', '2019-11-17 03:11:01', 'ca589bb0-904c-4876-a878-8f81ddd3d505', NULL, NULL, NULL, NULL, NULL),
(2, 2, 1, 'Home', '2019-11-17 03:13:40', '2019-11-23 06:13:03', '2d66bb25-e94b-4b8b-985b-b130df7af6ae', NULL, NULL, NULL, NULL, NULL),
(3, 3, 1, 'Contact', '2019-11-17 03:13:53', '2019-11-20 10:33:17', '98655dfa-538b-46b1-961d-59ff3f69de96', NULL, NULL, NULL, NULL, NULL),
(4, 4, 1, 'Order Form', '2019-11-17 03:14:44', '2019-11-23 06:22:34', 'f2fd429c-05b5-4679-bc49-2ec9dda26af8', NULL, NULL, NULL, NULL, NULL),
(5, 5, 1, 'Salmon', '2019-11-17 03:22:44', '2019-11-23 01:16:38', 'baed311d-1635-4feb-a2b5-e12e2418b5d4', NULL, NULL, NULL, NULL, NULL),
(6, 12, 1, 'Home', '2019-11-20 10:20:47', '2019-11-20 10:20:47', 'df403e81-9a3d-4bc3-940d-438893aec397', NULL, NULL, NULL, NULL, NULL),
(7, 16, 1, 'Home', '2019-11-20 10:20:47', '2019-11-20 10:20:47', '9170c60c-2012-4da1-b37f-68e1e979daf1', NULL, NULL, NULL, NULL, NULL),
(8, 20, 1, 'Home', '2019-11-20 10:20:47', '2019-11-20 10:20:47', '2c575d39-eefd-4a76-ac54-ad390bf40762', NULL, NULL, NULL, NULL, NULL),
(9, 24, 1, 'Home', '2019-11-20 10:20:47', '2019-11-20 10:20:47', '872951b4-ebce-47ce-9a72-9d2042471338', NULL, NULL, NULL, NULL, NULL),
(10, 28, 1, 'Order Form', '2019-11-20 10:20:47', '2019-11-20 10:20:48', '8ddf8a3b-3081-44d1-8236-5e8c95d5159b', NULL, NULL, NULL, NULL, NULL),
(11, 31, 1, 'Order Form', '2019-11-20 10:20:48', '2019-11-20 10:20:48', 'ca386391-1f60-4720-93a3-390164a00328', NULL, NULL, NULL, NULL, NULL),
(12, 34, 1, 'Order Form', '2019-11-20 10:20:48', '2019-11-20 10:20:48', '20fef2d9-d695-4297-97b8-66653f9980fd', NULL, NULL, NULL, NULL, NULL),
(13, 37, 1, 'Order Form', '2019-11-20 10:20:48', '2019-11-20 10:20:48', '8bb784db-4a1a-49d9-ad6c-3b8bafde92db', NULL, NULL, NULL, NULL, NULL),
(14, 40, 1, 'Order Form', '2019-11-20 10:20:48', '2019-11-20 10:20:48', 'dbae487b-8927-489b-9cdd-a6a0f66a455e', NULL, NULL, NULL, NULL, NULL),
(15, 43, 1, 'Order Form', '2019-11-20 10:20:48', '2019-11-20 10:20:48', '13177f78-c059-4c32-bb5d-6f22c4d0b95a', NULL, NULL, NULL, NULL, NULL),
(16, 46, 1, 'Order Form', '2019-11-20 10:20:48', '2019-11-20 10:20:48', 'd76f6481-e5e4-4559-8752-3993db86c7d8', NULL, NULL, NULL, NULL, NULL),
(17, 49, 1, 'Order Form', '2019-11-20 10:20:48', '2019-11-20 10:20:48', 'a177b8db-8c72-46c9-a8ea-c8e8ce693d81', NULL, NULL, NULL, NULL, NULL),
(18, 52, 1, 'Order Form', '2019-11-20 10:20:48', '2019-11-20 10:20:48', 'f9033bdf-764d-4b08-b686-fa1af4145d8d', NULL, NULL, NULL, NULL, NULL),
(19, 55, 1, 'Order Form', '2019-11-20 10:20:48', '2019-11-20 10:20:48', 'e7595950-484a-4e3d-aafe-1c0270631e04', NULL, NULL, NULL, NULL, NULL),
(20, 58, 1, 'Order Form', '2019-11-20 10:20:48', '2019-11-20 10:20:48', '1f7d21f2-e3c8-4d3e-aa3d-ba0e67c78a5d', NULL, NULL, NULL, NULL, NULL),
(21, 61, 1, 'Order Form', '2019-11-20 10:20:48', '2019-11-20 10:20:48', '7d805b7c-4be4-47ed-8226-34500cec2ef4', NULL, NULL, NULL, NULL, NULL),
(22, 64, 1, 'Order Form', '2019-11-20 10:20:48', '2019-11-20 10:20:48', '6c97f3ce-47df-4dee-b781-749d362f4cd6', NULL, NULL, NULL, NULL, NULL),
(23, 67, 1, 'Order Form', '2019-11-20 10:20:48', '2019-11-20 10:20:48', '5089a6fb-6c00-4275-a7bd-57403b42e2e9', NULL, NULL, NULL, NULL, NULL),
(24, 70, 1, 'Order Form', '2019-11-20 10:20:48', '2019-11-20 10:20:48', '9e52a11c-94ef-4aa0-b917-42068ae8cb09', NULL, NULL, NULL, NULL, NULL),
(25, 73, 1, 'Salmon', '2019-11-20 10:20:48', '2019-11-20 10:20:48', '11306cba-82c3-4358-b79f-0edf00633675', NULL, NULL, NULL, NULL, NULL),
(26, 74, 1, 'Order Form', '2019-11-20 10:31:28', '2019-11-20 10:31:28', '5d60cbf6-4069-45bc-a06c-dd2da1b7cf5b', NULL, NULL, NULL, NULL, NULL),
(27, 77, 1, 'Contact', '2019-11-20 10:33:17', '2019-11-20 10:33:17', 'af857d9b-cab6-40da-8473-896527c771f0', NULL, NULL, NULL, NULL, NULL),
(28, 78, 1, 'Contact', '2019-11-20 10:33:17', '2019-11-20 10:33:17', '76fa81c4-ea9d-43b8-bab9-bb3d9b80b568', NULL, NULL, NULL, NULL, NULL),
(29, 79, 1, 'Home', '2019-11-20 10:33:23', '2019-11-20 10:33:23', 'ee82bcd9-bfbf-48b4-bb89-25781698d91f', NULL, NULL, NULL, NULL, NULL),
(30, 83, 1, 'Order Form', '2019-11-20 10:35:01', '2019-11-20 10:35:01', '3f0cca91-efbc-4d47-a9d1-0cbe49f7d4ab', NULL, NULL, NULL, NULL, NULL),
(31, 86, 1, 'Salmonq', '2019-11-20 10:49:15', '2019-11-20 10:49:15', '1e82d51c-bc24-4f8f-a365-dced48291bec', NULL, NULL, NULL, NULL, NULL),
(32, 87, 1, 'Salmon', '2019-11-20 10:50:37', '2019-11-20 10:50:37', 'cdcb7034-fd9d-4a27-9239-cf5c9f046376', NULL, NULL, NULL, NULL, NULL),
(33, 88, 1, 'Salmons', '2019-11-23 00:51:49', '2019-11-23 00:51:49', 'bb1fdc59-2e70-409e-b81b-9ae05f520242', NULL, NULL, NULL, NULL, NULL),
(34, 89, 1, 'Salmon', '2019-11-23 00:54:32', '2019-11-23 00:54:32', 'e3c65d07-2ace-4391-8a17-a5bd4b5c5f4e', NULL, NULL, NULL, NULL, NULL),
(35, 90, 1, 'Home', '2019-11-23 00:54:46', '2019-11-23 00:54:46', 'abbe5e34-fe7a-4678-9bbd-dd42ce6903b3', NULL, NULL, NULL, NULL, NULL),
(36, 94, 1, 'Home', '2019-11-23 01:10:56', '2019-11-23 01:10:56', 'e5ecd7ec-a74b-4805-a958-57ea4df73110', NULL, NULL, NULL, NULL, NULL),
(37, 98, 1, 'Salmons', '2019-11-23 01:16:07', '2019-11-23 01:16:07', '6556801f-4eba-444b-8805-9230afda27af', NULL, NULL, NULL, NULL, NULL),
(38, 99, 1, 'Salmon', '2019-11-23 01:16:38', '2019-11-23 01:16:38', '2a60da10-2990-46f3-8670-01ba4a8cd4cd', NULL, NULL, NULL, NULL, NULL),
(40, 103, 1, 'Home', '2019-11-23 01:21:43', '2019-11-23 01:21:43', '38934950-e70f-4df7-ae4a-127246126a65', NULL, NULL, NULL, NULL, NULL),
(41, 110, 1, 'Home', '2019-11-23 01:25:17', '2019-11-23 01:25:17', '42e9c9f1-96c6-44cf-b21c-b8f9aed50e19', NULL, NULL, NULL, NULL, NULL),
(42, 116, 1, 'Salmon is in!', '2019-11-23 01:32:29', '2019-11-23 01:32:38', '403cfc8d-441d-4f10-968c-78ec6e4c8dd1', NULL, NULL, NULL, NULL, NULL),
(44, 118, 1, 'We have new salmon', '2019-11-23 01:36:10', '2019-11-23 01:36:10', '62773dd7-1267-4462-8c52-9f2a79b8120c', 'We have new salmon title!', 'new salmon description etcetcetcc', NULL, NULL, NULL),
(45, 119, 1, 'We have new salmon', '2019-11-23 01:36:10', '2019-11-23 01:36:10', '97ed8e72-59c5-4fdc-b682-3fab22b46a18', 'We have new salmon title!', 'new salmon description etcetcetcc', NULL, NULL, NULL),
(47, 121, 1, 'We have new salmom', '2019-11-23 01:37:36', '2019-11-23 01:37:36', 'c51efe00-8cbf-4698-8f4b-3c06bab43b8e', 'We have new salmom title', 'We have new salmom descriptio', NULL, NULL, NULL),
(48, 122, 1, 'We have new salmom', '2019-11-23 01:37:36', '2019-11-23 01:37:36', 'eaa051ba-c231-472a-bbfa-ece42fd0606f', 'We have new salmom title', 'We have new salmom descriptio', NULL, NULL, NULL),
(50, 124, 1, 'we have more new lamomnon', '2019-11-23 01:38:40', '2019-11-23 01:38:40', 'cfe6ea4f-9372-45d8-b0fa-1116f4518ab3', 'we have more new lamomnon title', 'we have more new lamomnon desc', NULL, NULL, NULL),
(51, 125, 1, 'we have more new lamomnon', '2019-11-23 01:38:40', '2019-11-23 01:38:40', '154921dd-7005-41f7-8cd2-a9fd49a105c8', 'we have more new lamomnon title', 'we have more new lamomnon desc', NULL, NULL, NULL),
(52, 126, 1, 'Home', '2019-11-23 01:39:52', '2019-11-23 01:39:52', 'd1bf4300-f8c6-408d-9158-fd60a4fbd9a2', NULL, NULL, NULL, NULL, NULL),
(54, 133, 1, 'titlw', '2019-11-23 01:41:35', '2019-11-23 05:17:18', 'b3a672d4-b054-44bb-a3a9-8e76247aad56', 'wwwwwwr', 'wwwwww', NULL, NULL, NULL),
(55, 134, 1, 'titlw', '2019-11-23 01:41:35', '2019-11-23 01:41:35', '9e5ab4d6-7ed9-4640-b66d-d649fc98ee56', 'wwwwww', 'wwwwww', NULL, NULL, NULL),
(56, 136, 1, 'Home', '2019-11-23 01:41:52', '2019-11-23 01:41:52', '761a0490-7353-48f9-a209-1ab787b0e900', NULL, NULL, NULL, NULL, NULL),
(58, 144, 1, 'test', '2019-11-23 01:48:17', '2019-11-23 01:48:17', 'd76b9ca5-3457-409b-ac6e-42289e7282c9', 'test', 'test', NULL, NULL, NULL),
(59, 145, 1, 'test', '2019-11-23 01:48:17', '2019-11-23 01:48:17', '0980349f-0d5c-4a2b-8216-81a64db4c9f8', 'test', 'test', NULL, NULL, NULL),
(61, 147, 1, 'title', '2019-11-23 01:49:08', '2019-11-23 01:49:08', '35c9c7f4-6d7b-4508-a152-9577e48b1b2b', 'news', 'desc', NULL, NULL, NULL),
(62, 148, 1, 'title', '2019-11-23 01:49:08', '2019-11-23 01:49:08', '88795518-5998-40f7-a104-8b04ca16ffab', 'news', 'desc', NULL, NULL, NULL),
(63, 150, 1, 'Home', '2019-11-23 01:49:57', '2019-11-23 01:49:57', '2f21e71c-a41c-4e7d-b3f4-5709d17c357d', NULL, NULL, NULL, NULL, NULL),
(65, 159, 1, 'ejoi', '2019-11-23 02:04:27', '2019-11-23 05:57:28', '6a95f446-e650-4b51-93c9-a6cdf00738ec', 'jowed', 'on', NULL, NULL, NULL),
(66, 160, 1, 'ejoi', '2019-11-23 02:04:27', '2019-11-23 02:04:27', '529b4168-155e-418f-be9b-df6efc5168e9', 'jo', 'on', NULL, NULL, NULL),
(67, 161, 1, NULL, '2019-11-23 02:09:39', '2019-11-23 02:09:39', 'bc69e21b-17c5-4820-aa64-db1d906e6512', NULL, NULL, NULL, NULL, NULL),
(69, 163, 1, 'tes', '2019-11-23 02:09:50', '2019-11-23 02:09:50', '5fa1e683-e6ee-4186-a8b5-ac227d407ed8', 'tes', 'tes', NULL, NULL, NULL),
(70, 164, 1, 'tes', '2019-11-23 02:09:50', '2019-11-23 02:09:50', '358a4632-c60c-4d60-921b-4076b5214f05', 'tes', 'tes', NULL, NULL, NULL),
(72, 166, 1, 'tes', '2019-11-23 02:12:05', '2019-11-23 02:12:05', '64be4b54-303e-45a3-baec-790bffbee978', 'tes', 'tse', NULL, NULL, NULL),
(73, 167, 1, 'tes', '2019-11-23 02:12:05', '2019-11-23 02:12:05', 'a55cd729-5964-47b8-9c89-07596579f53d', 'tes', 'tse', NULL, NULL, NULL),
(75, 169, 1, 'e', '2019-11-23 02:13:51', '2019-11-23 02:13:51', 'a8e9000f-d5cd-4a2e-879b-bf0aeb84c54b', 'e', 'e', NULL, NULL, NULL),
(76, 170, 1, 'e', '2019-11-23 02:13:51', '2019-11-23 02:13:51', 'c66c900c-5dd4-46fa-8152-c8f95db6fba6', 'e', 'e', NULL, NULL, NULL),
(78, 172, 1, 'qq', '2019-11-23 02:14:34', '2019-11-23 02:14:34', '80756c56-3a45-4904-ab58-dc3be1f12927', 'q', 'qq', NULL, NULL, NULL),
(79, 173, 1, 'qq', '2019-11-23 02:14:34', '2019-11-23 02:14:34', '70b330bc-7321-4845-baf2-0d69f2c7a858', 'q', 'qq', NULL, NULL, NULL),
(80, 174, 1, NULL, '2019-11-23 02:14:36', '2019-11-23 02:14:36', '65bbd57f-3d62-4e00-bd5b-4e6a852f5d79', NULL, NULL, NULL, NULL, NULL),
(82, 176, 1, 'tes', '2019-11-23 02:15:45', '2019-11-23 02:15:45', '92a9ef97-aa46-4c92-8dae-7bd013cb6af0', 'test', 'tes', NULL, NULL, NULL),
(83, 177, 1, 'tes', '2019-11-23 02:15:45', '2019-11-23 02:15:45', '9dd728a6-16b9-40cb-b5e8-e386150b9db7', 'test', 'tes', NULL, NULL, NULL),
(85, 179, 1, 'test', '2019-11-23 02:17:09', '2019-11-23 02:17:09', '595df814-5741-4548-8702-9751f8315950', NULL, NULL, NULL, NULL, NULL),
(86, 180, 1, 'test', '2019-11-23 02:17:09', '2019-11-23 02:17:09', 'b91e6958-4bc8-4929-b301-ad46a1e4bb88', NULL, NULL, NULL, NULL, NULL),
(87, 182, 1, 'Home', '2019-11-23 02:18:03', '2019-11-23 02:18:03', '2c8394e8-3d84-4d72-8d9c-a9e3b069bf34', NULL, NULL, NULL, NULL, NULL),
(88, 192, 1, 'Home', '2019-11-23 02:37:30', '2019-11-23 02:37:30', '219e8999-9622-4ba5-aacc-1670f39dbd4f', NULL, NULL, NULL, NULL, NULL),
(90, 203, 1, 'test2', '2019-11-23 02:37:38', '2019-11-23 02:37:38', '4ce7299f-c1c5-49d7-9a0b-3f1eee456e18', NULL, NULL, NULL, NULL, NULL),
(91, 204, 1, 'test2', '2019-11-23 02:37:38', '2019-11-23 02:37:38', '68dc5f13-c413-420c-ad36-4f2b4f6b4cfc', NULL, NULL, NULL, NULL, NULL),
(92, 206, 1, 'Home', '2019-11-23 02:38:31', '2019-11-23 02:38:31', '8d57749d-179f-4efa-9474-4099114f609e', NULL, NULL, NULL, NULL, NULL),
(93, 218, 1, 'Home', '2019-11-23 02:39:26', '2019-11-23 02:39:26', '3ffab6e7-fd20-4793-9cce-00f237ac3ae7', NULL, NULL, NULL, NULL, NULL),
(94, 231, 1, 'Home', '2019-11-23 02:39:50', '2019-11-23 02:39:50', 'fa9f8ed2-af30-4e0c-a494-7b3ff55757af', NULL, NULL, NULL, NULL, NULL),
(95, 245, 1, 'Home', '2019-11-23 05:13:35', '2019-11-23 05:13:35', 'd14ec305-3a1f-4f51-82d0-1d430709b2ae', NULL, NULL, NULL, NULL, NULL),
(96, 260, 1, 'Order Form', '2019-11-23 05:14:04', '2019-11-23 05:14:04', 'f1a6b0b8-2009-480b-be21-ff68f5adb1b5', NULL, NULL, NULL, NULL, NULL),
(97, 265, 1, 'Home', '2019-11-23 05:14:22', '2019-11-23 05:14:22', '4ffe5050-626e-4ebb-82d9-2930cdb3c037', NULL, NULL, NULL, NULL, NULL),
(98, 280, 1, 'titlw', '2019-11-23 05:17:18', '2019-11-23 05:17:18', '52351413-1551-47e2-99b6-eb4303967330', 'wwwwwwr', 'wwwwww', NULL, NULL, NULL),
(100, 282, 1, 'test', '2019-11-23 05:17:45', '2019-11-23 05:17:45', 'e42f729d-f1ec-4fba-a174-39b97a478d21', 'tes', 'test', NULL, NULL, NULL),
(101, 283, 1, 'test', '2019-11-23 05:17:45', '2019-11-23 05:17:45', 'f43ba53c-47a4-4de8-810a-7012f1f3c6e1', 'tes', 'test', NULL, NULL, NULL),
(103, 285, 1, 'test', '2019-11-23 05:18:47', '2019-11-23 05:18:47', 'cf2de8fc-9bab-4297-be97-ffb65f4606cd', 'tse', 'test', NULL, NULL, NULL),
(104, 286, 1, 'test', '2019-11-23 05:18:47', '2019-11-23 05:18:47', '32401695-1445-4a9c-bd48-56214f5ebfe7', 'tse', 'test', NULL, NULL, NULL),
(105, 287, 1, NULL, '2019-11-23 05:29:34', '2019-11-23 05:29:34', '32609e7a-be58-4396-9d7b-68095a4fe3e4', NULL, NULL, NULL, NULL, NULL),
(107, 289, 1, 'rest', '2019-11-23 05:29:43', '2019-11-23 05:29:43', 'b3e17383-be94-4587-b3e3-9d86731918e3', 'tseest', 'rtest', NULL, NULL, NULL),
(108, 290, 1, 'rest', '2019-11-23 05:29:43', '2019-11-23 05:29:43', '01824b85-a7e5-4837-ab41-74486e3d9f4c', 'tseest', 'rtest', NULL, NULL, NULL),
(110, 292, 1, 'era', '2019-11-23 05:33:45', '2019-11-23 05:33:45', '474b83f1-ba83-4e44-9c38-5bf660f47410', NULL, NULL, NULL, NULL, NULL),
(111, 293, 1, 'era', '2019-11-23 05:33:45', '2019-11-23 05:33:45', '1aa04975-d30c-4596-8fb4-b2136eda02d9', NULL, NULL, NULL, NULL, NULL),
(113, 295, 1, 'wefw', '2019-11-23 05:34:41', '2019-11-23 05:34:41', 'e733ac53-57e8-4d4b-8d41-9c3b90e01764', NULL, NULL, NULL, NULL, NULL),
(114, 296, 1, 'wefw', '2019-11-23 05:34:41', '2019-11-23 05:34:41', '7a02a2ee-93f0-4c75-937f-f54575312750', NULL, NULL, NULL, NULL, NULL),
(116, 298, 1, 'qwd', '2019-11-23 05:36:12', '2019-11-23 05:38:00', '5ba49994-b6f7-401d-8d00-3c861da62bf2', NULL, NULL, NULL, NULL, NULL),
(117, 299, 1, 'wew', '2019-11-23 05:36:12', '2019-11-23 05:36:12', 'e4d4703f-baf5-4c40-b15e-26c9095eb4bd', NULL, NULL, NULL, NULL, NULL),
(119, 301, 1, 'qwdqw', '2019-11-23 05:37:57', '2019-11-23 05:37:57', 'c8948131-7460-4c3d-ba7f-784007ac621a', NULL, NULL, NULL, NULL, NULL),
(120, 302, 1, 'qwdqw', '2019-11-23 05:37:57', '2019-11-23 05:37:57', '91ec1b71-484c-4a32-830b-4841894e1088', NULL, NULL, NULL, NULL, NULL),
(121, 303, 1, 'qwd', '2019-11-23 05:38:00', '2019-11-23 05:38:00', '8dda892c-89b6-4410-ac6a-f08ff0f197de', NULL, NULL, NULL, NULL, NULL),
(122, 305, 1, 'Home', '2019-11-23 05:38:10', '2019-11-23 05:38:10', 'e43e267c-efdf-421b-a6d6-fa9da7400d5a', NULL, NULL, NULL, NULL, NULL),
(123, 322, 1, 'Home', '2019-11-23 05:45:25', '2019-11-23 05:45:25', '57c09da1-986b-427b-9a90-3c8f8d31dbec', NULL, NULL, NULL, NULL, NULL),
(124, 340, 1, 'Home', '2019-11-23 05:51:27', '2019-11-23 05:51:27', '9e72e48d-a01f-447d-b998-909207222057', NULL, NULL, NULL, NULL, NULL),
(125, 358, 1, 'Order Form', '2019-11-23 05:53:24', '2019-11-23 05:53:24', '26cb885a-6b72-4f1c-a2d5-8da8c4307501', NULL, NULL, NULL, NULL, NULL),
(126, 362, 1, 'Home', '2019-11-23 05:55:49', '2019-11-23 05:55:49', '110f6688-89c6-457e-81c4-30855c1b044c', NULL, NULL, NULL, NULL, NULL),
(127, 365, 1, 'Order Form', '2019-11-23 05:56:36', '2019-11-23 05:56:36', 'cf252368-1294-47e5-8cfb-e6915d9a6997', NULL, NULL, NULL, NULL, NULL),
(128, 370, 1, 'ejoi', '2019-11-23 05:57:28', '2019-11-23 05:57:28', 'c4df5c48-7c69-4034-9c10-297fe9be7ed6', 'jowed', 'on', NULL, NULL, NULL),
(130, 372, 1, 'wef', '2019-11-23 06:01:19', '2019-11-23 06:01:19', 'c40a5d3c-afe3-49ae-97b5-04079d84eab0', 'wef', 'wef', NULL, NULL, NULL),
(131, 373, 1, 'wef', '2019-11-23 06:01:19', '2019-11-23 06:01:19', '0d112639-e957-458a-a8d6-09940978cba4', 'wef', 'wef', NULL, NULL, NULL),
(133, 375, 1, 'wef', '2019-11-23 06:01:26', '2019-11-23 06:01:26', '95304de0-cb9b-4617-b5c3-65ff3347d167', NULL, NULL, NULL, NULL, NULL),
(134, 376, 1, 'wef', '2019-11-23 06:01:26', '2019-11-23 06:01:26', 'a10ad3fb-acf4-4b46-a13f-ad90798cbe9b', NULL, NULL, NULL, NULL, NULL),
(135, 377, 1, NULL, '2019-11-23 06:01:27', '2019-11-23 06:01:27', 'bd609cd3-5493-489f-9865-559281ff730c', NULL, NULL, NULL, NULL, NULL),
(136, 379, 1, 'Home', '2019-11-23 06:01:37', '2019-11-23 06:01:37', 'd5afb885-4f3c-455b-bd4c-91d3687a92bd', NULL, NULL, NULL, NULL, NULL),
(137, 382, 1, 'tset', '2019-11-23 06:02:25', '2019-11-23 06:02:27', '1a5c9d65-755f-42e5-9120-49a52ca25ac7', NULL, NULL, NULL, NULL, NULL),
(139, 384, 1, 'new news!', '2019-11-23 06:02:42', '2019-11-23 06:02:42', '5f14f662-8d38-4001-be6f-fc870a821cd9', 'title', 'desciptiom', NULL, NULL, NULL),
(140, 385, 1, 'new news!', '2019-11-23 06:02:42', '2019-11-23 06:02:42', '63c8db46-5d22-4256-b8d5-a095bd52d53b', 'title', 'desciptiom', NULL, NULL, NULL),
(141, 386, 1, NULL, '2019-11-23 06:03:20', '2019-11-23 06:03:20', 'e7ef0cf8-b3a9-448e-9588-22deb5b73930', NULL, NULL, NULL, NULL, NULL),
(142, 388, 1, 'Home', '2019-11-23 06:03:31', '2019-11-23 06:03:31', '2b2b4c2d-012d-4584-9ee2-a863ad3df394', NULL, NULL, NULL, NULL, NULL),
(143, 393, 1, 'Home', '2019-11-23 06:04:16', '2019-11-23 06:04:16', 'd24a8210-661c-4ff6-8386-b74956a855bd', NULL, NULL, NULL, NULL, NULL),
(144, 399, 1, 'Home', '2019-11-23 06:04:40', '2019-11-23 06:04:40', 'b0c876fa-f7a0-4842-8db4-04decb5dbdf8', NULL, NULL, NULL, NULL, NULL),
(145, 405, 1, 'Order Form', '2019-11-23 06:06:49', '2019-11-23 06:06:49', 'ecd1bd42-2b50-443b-aea0-23170b5b1dda', NULL, NULL, NULL, NULL, NULL),
(146, 411, 1, 'Home', '2019-11-23 06:13:03', '2019-11-23 06:13:03', '6ee631b0-a208-4fa0-8654-fa99af4bf64f', NULL, NULL, NULL, NULL, NULL),
(148, 419, 1, 'teste', '2019-11-23 06:22:01', '2019-11-23 06:22:01', '41af382a-f353-4937-8fd1-789e39a6c2e6', NULL, NULL, NULL, NULL, NULL),
(149, 420, 1, 'teste', '2019-11-23 06:22:01', '2019-11-23 06:22:01', 'd50310dd-b3dc-4765-a6f0-68c2d9fb3ff7', NULL, NULL, NULL, NULL, NULL),
(151, 422, 1, 'newer ewnr', '2019-11-23 06:22:13', '2019-11-23 07:15:26', '94477d2a-171f-43f9-9c4e-33a54a2ad64e', 'n', 'wn', NULL, NULL, NULL),
(152, 423, 1, 'newer ewnr', '2019-11-23 06:22:13', '2019-11-23 06:22:13', 'cba620d0-82d7-494d-b794-bb4faee1fc0e', 'n', 'wn', NULL, NULL, NULL),
(153, 425, 1, 'Order Form', '2019-11-23 06:22:34', '2019-11-23 06:22:34', 'b9f88bb0-836c-4a8a-ad8a-95ffed0ba85c', NULL, NULL, NULL, NULL, NULL),
(154, 431, 1, 'newer ewnr', '2019-11-23 07:15:26', '2019-11-23 07:15:26', 'd71cb035-6414-4c55-8749-c4c49d07cc0b', 'n', 'wn', NULL, NULL, NULL),
(155, 432, 1, NULL, '2019-11-25 05:21:15', '2019-11-25 05:23:04', '82ab5b16-b581-4cdc-baa3-a7458e9f3dbb', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `craftidtokens`
--

CREATE TABLE `craftidtokens` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `accessToken` text NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `deprecationerrors`
--

CREATE TABLE `deprecationerrors` (
  `id` int(11) NOT NULL,
  `key` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` smallint(6) UNSIGNED DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `traces` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `deprecationerrors`
--

INSERT INTO `deprecationerrors` (`id`, `key`, `fingerprint`, `lastOccurrence`, `file`, `line`, `message`, `traces`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'ElementQuery::getIterator()', '/srv/app/craft3-jir6/htdocs/templates/order/_entry.twig:16', '2019-11-17 03:30:07', '/srv/app/craft3-jir6/htdocs/templates/order/_entry.twig', 16, 'Looping through element queries directly has been deprecated. Use the all() function to fetch the query results before looping over them.', '[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/srv/app/craft3-jir6/htdocs/vendor/craftcms/cms/src/elements/db/ElementQuery.php\",\"line\":456,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\EntryQuery\",\"file\":\"/srv/app/craft3-jir6/htdocs/storage/runtime/compiled_templates/3d/3d856a694b0518aae16a4774a801035de8b6db4c0249648cc0746b2dd4acf98b.php\",\"line\":58,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":\"__TwigTemplate_d2e451d4c931f9f617de371aa9f315fb8a3c3b27f916dfbccb1dc3c3b19b5013\",\"file\":\"/srv/app/craft3-jir6/htdocs/vendor/twig/twig/lib/Twig/Template.php\",\"line\":189,\"class\":\"__TwigTemplate_d2e451d4c931f9f617de371aa9f315fb8a3c3b27f916dfbccb1dc3c3b19b5013\",\"method\":\"block_content\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_d2e451d4c931f9f617de371aa9f315fb8a3c3b27f916dfbccb1dc3c3b19b5013, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c0904975e6e1d2c9ed59cebe600ac36487d1c135213763c9371b465ae1d53531\",\"file\":\"/srv/app/craft3-jir6/htdocs/storage/runtime/compiled_templates/2d/2d4bed5e0fbba3419cbfb96db5519ec19108b30fd1ef987e8a42bdf61de2106a.php\",\"line\":38,\"class\":\"Twig_Template\",\"method\":\"displayBlock\",\"args\":\"\\\"content\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_d2e451d4c931f9f617de371aa9f315fb8a3c3b27f916dfbccb1dc3c3b19b5013, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c0904975e6e1d2c9ed59cebe600ac36487d1c135213763c9371b465ae1d53531\",\"file\":\"/srv/app/craft3-jir6/htdocs/vendor/twig/twig/lib/Twig/Template.php\",\"line\":386,\"class\":\"__TwigTemplate_c0904975e6e1d2c9ed59cebe600ac36487d1c135213763c9371b465ae1d53531\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_d2e451d4c931f9f617de371aa9f315fb8a3c3b27f916dfbccb1dc3c3b19b5013, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c0904975e6e1d2c9ed59cebe600ac36487d1c135213763c9371b465ae1d53531\",\"file\":\"/srv/app/craft3-jir6/htdocs/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":49,\"class\":\"Twig_Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_d2e451d4c931f9f617de371aa9f315fb8a3c3b27f916dfbccb1dc3c3b19b5013, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c0904975e6e1d2c9ed59cebe600ac36487d1c135213763c9371b465ae1d53531\",\"file\":\"/srv/app/craft3-jir6/htdocs/vendor/twig/twig/lib/Twig/Template.php\",\"line\":363,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_d2e451d4c931f9f617de371aa9f315fb8a3c3b27f916dfbccb1dc3c3b19b5013, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c0904975e6e1d2c9ed59cebe600ac36487d1c135213763c9371b465ae1d53531\",\"file\":\"/srv/app/craft3-jir6/htdocs/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":31,\"class\":\"Twig_Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_d2e451d4c931f9f617de371aa9f315fb8a3c3b27f916dfbccb1dc3c3b19b5013, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_c0904975e6e1d2c9ed59cebe600ac36487d1c135213763c9371b465ae1d53531\",\"file\":\"/srv/app/craft3-jir6/htdocs/storage/runtime/compiled_templates/3d/3d856a694b0518aae16a4774a801035de8b6db4c0249648cc0746b2dd4acf98b.php\",\"line\":28,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_d2e451d4c931f9f617de371aa9f315fb8a3c3b27f916dfbccb1dc3c3b19b5013, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_d2e451d4c931f9f617de371aa9f315fb8a3c3b27f916dfbccb1dc3c3b19b5013\",\"file\":\"/srv/app/craft3-jir6/htdocs/vendor/twig/twig/lib/Twig/Template.php\",\"line\":386,\"class\":\"__TwigTemplate_d2e451d4c931f9f617de371aa9f315fb8a3c3b27f916dfbccb1dc3c3b19b5013\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_d2e451d4c931f9f617de371aa9f315fb8a3c3b27f916dfbccb1dc3c3b19b5013, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_d2e451d4c931f9f617de371aa9f315fb8a3c3b27f916dfbccb1dc3c3b19b5013\",\"file\":\"/srv/app/craft3-jir6/htdocs/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":49,\"class\":\"Twig_Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_d2e451d4c931f9f617de371aa9f315fb8a3c3b27f916dfbccb1dc3c3b19b5013, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_d2e451d4c931f9f617de371aa9f315fb8a3c3b27f916dfbccb1dc3c3b19b5013\",\"file\":\"/srv/app/craft3-jir6/htdocs/vendor/twig/twig/lib/Twig/Template.php\",\"line\":363,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_d2e451d4c931f9f617de371aa9f315fb8a3c3b27f916dfbccb1dc3c3b19b5013, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_d2e451d4c931f9f617de371aa9f315fb8a3c3b27f916dfbccb1dc3c3b19b5013\",\"file\":\"/srv/app/craft3-jir6/htdocs/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":31,\"class\":\"Twig_Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"__TwigTemplate_d2e451d4c931f9f617de371aa9f315fb8a3c3b27f916dfbccb1dc3c3b19b5013\",\"file\":\"/srv/app/craft3-jir6/htdocs/vendor/twig/twig/lib/Twig/Template.php\",\"line\":371,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_d2e451d4c931f9f617de371aa9f315fb8a3c3b27f916dfbccb1dc3c3b19b5013\",\"file\":\"/srv/app/craft3-jir6/htdocs/vendor/twig/twig/lib/Twig/Environment.php\",\"line\":289,\"class\":\"Twig_Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"/srv/app/craft3-jir6/htdocs/vendor/craftcms/cms/src/web/View.php\",\"line\":331,\"class\":\"Twig_Environment\",\"method\":\"render\",\"args\":\"\\\"order/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/srv/app/craft3-jir6/htdocs/vendor/craftcms/cms/src/web/View.php\",\"line\":378,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"order/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/srv/app/craft3-jir6/htdocs/vendor/craftcms/cms/src/web/Controller.php\",\"line\":156,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"order/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/srv/app/craft3-jir6/htdocs/vendor/craftcms/cms/src/controllers/TemplatesController.php\",\"line\":78,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"order/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"order/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"/srv/app/craft3-jir6/htdocs/vendor/yiisoft/yii2/base/InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"order/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"/srv/app/craft3-jir6/htdocs/vendor/yiisoft/yii2/base/Controller.php\",\"line\":157,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"order/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"order\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/srv/app/craft3-jir6/htdocs/vendor/craftcms/cms/src/web/Controller.php\",\"line\":104,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"order/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"order\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/srv/app/craft3-jir6/htdocs/vendor/yiisoft/yii2/base/Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"order/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"order\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/srv/app/craft3-jir6/htdocs/vendor/craftcms/cms/src/web/Application.php\",\"line\":284,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"order/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"order\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/srv/app/craft3-jir6/htdocs/vendor/yiisoft/yii2/web/Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"order/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"order\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/srv/app/craft3-jir6/htdocs/vendor/craftcms/cms/src/web/Application.php\",\"line\":273,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/srv/app/craft3-jir6/htdocs/vendor/yiisoft/yii2/base/Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/srv/app/craft3-jir6/htdocs/web/index.php\",\"line\":21,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]', '2019-11-17 03:30:07', '2019-11-17 03:30:07', 'c913de40-5a90-441a-924c-ff799b8257aa'),
(2, 'ElementQuery::getIterator()', '/Users/henrylawrence/personal/Craft-3.0.41/templates/order/_entry.twig:16', '2019-11-17 04:58:09', '/Users/henrylawrence/personal/Craft-3.0.41/templates/order/_entry.twig', 16, 'Looping through element queries directly has been deprecated. Use the all() function to fetch the query results before looping over them.', '[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/elements/db/ElementQuery.php\",\"line\":456,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\EntryQuery\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/storage/runtime/compiled_templates/de/de0473092775baa5ad664b8bf202949ad913c19fea852c1afb85ac3eb36aff6f.php\",\"line\":58,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":\"__TwigTemplate_839e26b99b4c102bef6e0fd9bb69bcde5a617b16d0c39e312a9bd9d3282b570f\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/lib/Twig/Template.php\",\"line\":189,\"class\":\"__TwigTemplate_839e26b99b4c102bef6e0fd9bb69bcde5a617b16d0c39e312a9bd9d3282b570f\",\"method\":\"block_content\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_839e26b99b4c102bef6e0fd9bb69bcde5a617b16d0c39e312a9bd9d3282b570f, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_2e8ea041cd069ff643d115d039a134038c9e24697dcfb3a255cb73808609f4e3\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/storage/runtime/compiled_templates/a7/a7e695a6b20d3a213a7156cd3849f9dfa6d4486215441b17144c5befab0bc0b6.php\",\"line\":38,\"class\":\"Twig_Template\",\"method\":\"displayBlock\",\"args\":\"\\\"content\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_839e26b99b4c102bef6e0fd9bb69bcde5a617b16d0c39e312a9bd9d3282b570f, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_2e8ea041cd069ff643d115d039a134038c9e24697dcfb3a255cb73808609f4e3\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/lib/Twig/Template.php\",\"line\":386,\"class\":\"__TwigTemplate_2e8ea041cd069ff643d115d039a134038c9e24697dcfb3a255cb73808609f4e3\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_839e26b99b4c102bef6e0fd9bb69bcde5a617b16d0c39e312a9bd9d3282b570f, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_2e8ea041cd069ff643d115d039a134038c9e24697dcfb3a255cb73808609f4e3\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":49,\"class\":\"Twig_Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_839e26b99b4c102bef6e0fd9bb69bcde5a617b16d0c39e312a9bd9d3282b570f, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_2e8ea041cd069ff643d115d039a134038c9e24697dcfb3a255cb73808609f4e3\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/lib/Twig/Template.php\",\"line\":363,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_839e26b99b4c102bef6e0fd9bb69bcde5a617b16d0c39e312a9bd9d3282b570f, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_2e8ea041cd069ff643d115d039a134038c9e24697dcfb3a255cb73808609f4e3\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":31,\"class\":\"Twig_Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_839e26b99b4c102bef6e0fd9bb69bcde5a617b16d0c39e312a9bd9d3282b570f, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_2e8ea041cd069ff643d115d039a134038c9e24697dcfb3a255cb73808609f4e3\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/storage/runtime/compiled_templates/de/de0473092775baa5ad664b8bf202949ad913c19fea852c1afb85ac3eb36aff6f.php\",\"line\":28,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_839e26b99b4c102bef6e0fd9bb69bcde5a617b16d0c39e312a9bd9d3282b570f, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_839e26b99b4c102bef6e0fd9bb69bcde5a617b16d0c39e312a9bd9d3282b570f\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/lib/Twig/Template.php\",\"line\":386,\"class\":\"__TwigTemplate_839e26b99b4c102bef6e0fd9bb69bcde5a617b16d0c39e312a9bd9d3282b570f\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_839e26b99b4c102bef6e0fd9bb69bcde5a617b16d0c39e312a9bd9d3282b570f, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_839e26b99b4c102bef6e0fd9bb69bcde5a617b16d0c39e312a9bd9d3282b570f\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":49,\"class\":\"Twig_Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_839e26b99b4c102bef6e0fd9bb69bcde5a617b16d0c39e312a9bd9d3282b570f, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_839e26b99b4c102bef6e0fd9bb69bcde5a617b16d0c39e312a9bd9d3282b570f\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/lib/Twig/Template.php\",\"line\":363,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_839e26b99b4c102bef6e0fd9bb69bcde5a617b16d0c39e312a9bd9d3282b570f, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_839e26b99b4c102bef6e0fd9bb69bcde5a617b16d0c39e312a9bd9d3282b570f\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":31,\"class\":\"Twig_Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"__TwigTemplate_839e26b99b4c102bef6e0fd9bb69bcde5a617b16d0c39e312a9bd9d3282b570f\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/lib/Twig/Template.php\",\"line\":371,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_839e26b99b4c102bef6e0fd9bb69bcde5a617b16d0c39e312a9bd9d3282b570f\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/lib/Twig/Environment.php\",\"line\":289,\"class\":\"Twig_Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/View.php\",\"line\":331,\"class\":\"Twig_Environment\",\"method\":\"render\",\"args\":\"\\\"order/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/View.php\",\"line\":378,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"order/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Controller.php\",\"line\":156,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"order/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/controllers/TemplatesController.php\",\"line\":78,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"order/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"order/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"order/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/Controller.php\",\"line\":157,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"order/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"order\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Controller.php\",\"line\":104,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"order/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"order\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"order/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"order\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Application.php\",\"line\":284,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"order/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"order\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/web/Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"order/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"order\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Application.php\",\"line\":273,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/web/index.php\",\"line\":21,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]', '2019-11-17 04:58:09', '2019-11-17 04:58:09', '8e123163-b756-45a7-9f93-130237ab9f0b'),
(6, 'ElementQuery::getIterator()', '/Users/henrylawrence/personal/Craft-3.0.41/templates/order/_entry.twig:13', '2019-11-21 10:31:59', '/Users/henrylawrence/personal/Craft-3.0.41/templates/order/_entry.twig', 13, 'Looping through element queries directly has been deprecated. Use the all() function to fetch the query results before looping over them.', '[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/elements/db/ElementQuery.php\",\"line\":584,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\MatrixBlockQuery\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/storage/runtime/compiled_templates/72/72947ea7894b88ac9a157b209c6c4e447ec559111f3b60fbbecac67002e684be.php\",\"line\":70,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":\"__TwigTemplate_a0d64f0ea5d09e04c872c104044fc732b8ff5f372f94a9bb33f58935eb1d33ac\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":184,\"class\":\"__TwigTemplate_a0d64f0ea5d09e04c872c104044fc732b8ff5f372f94a9bb33f58935eb1d33ac\",\"method\":\"block_content\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_a0d64f0ea5d09e04c872c104044fc732b8ff5f372f94a9bb33f58935eb1d33ac, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/storage/runtime/compiled_templates/c0/c0a7b674a2f6497e393d33b2a2ae5b45b53b55ee643d8dfb40f7b7ca1cbf29b2.php\",\"line\":61,\"class\":\"Twig\\\\Template\",\"method\":\"displayBlock\",\"args\":\"\\\"content\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_a0d64f0ea5d09e04c872c104044fc732b8ff5f372f94a9bb33f58935eb1d33ac, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":407,\"class\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_a0d64f0ea5d09e04c872c104044fc732b8ff5f372f94a9bb33f58935eb1d33ac, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_a0d64f0ea5d09e04c872c104044fc732b8ff5f372f94a9bb33f58935eb1d33ac, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/storage/runtime/compiled_templates/72/72947ea7894b88ac9a157b209c6c4e447ec559111f3b60fbbecac67002e684be.php\",\"line\":47,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_a0d64f0ea5d09e04c872c104044fc732b8ff5f372f94a9bb33f58935eb1d33ac, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_a0d64f0ea5d09e04c872c104044fc732b8ff5f372f94a9bb33f58935eb1d33ac\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":407,\"class\":\"__TwigTemplate_a0d64f0ea5d09e04c872c104044fc732b8ff5f372f94a9bb33f58935eb1d33ac\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_a0d64f0ea5d09e04c872c104044fc732b8ff5f372f94a9bb33f58935eb1d33ac, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_a0d64f0ea5d09e04c872c104044fc732b8ff5f372f94a9bb33f58935eb1d33ac\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_a0d64f0ea5d09e04c872c104044fc732b8ff5f372f94a9bb33f58935eb1d33ac, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_a0d64f0ea5d09e04c872c104044fc732b8ff5f372f94a9bb33f58935eb1d33ac\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":392,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_a0d64f0ea5d09e04c872c104044fc732b8ff5f372f94a9bb33f58935eb1d33ac\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/TemplateWrapper.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"Twig\\\\TemplateWrapper\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Environment.php\",\"line\":318,\"class\":\"Twig\\\\TemplateWrapper\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/View.php\",\"line\":344,\"class\":\"Twig\\\\Environment\",\"method\":\"render\",\"args\":\"\\\"order/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/View.php\",\"line\":393,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"order/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Controller.php\",\"line\":243,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"order/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/controllers/TemplatesController.php\",\"line\":101,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"order/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"order/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"order/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/Controller.php\",\"line\":157,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"order/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"order\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Controller.php\",\"line\":187,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"order/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"order\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"order/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"order\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Application.php\",\"line\":299,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"order/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"order\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/web/Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"order/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"order\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Application.php\",\"line\":284,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/web/index.php\",\"line\":21,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]', '2019-11-21 10:31:59', '2019-11-21 10:31:59', 'bb144f92-4cb1-46b4-8e4b-bb09dc3d176f');
INSERT INTO `deprecationerrors` (`id`, `key`, `fingerprint`, `lastOccurrence`, `file`, `line`, `message`, `traces`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(8, 'ElementQuery::first()', '/Users/henrylawrence/personal/Craft-3.0.41/templates/order/_entry.twig:13', '2019-11-17 05:02:41', '/Users/henrylawrence/personal/Craft-3.0.41/templates/order/_entry.twig', 13, 'The first() function used to query for elements is now deprecated. Use one() instead.', '[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/elements/db/ElementQuery.php\",\"line\":1401,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::first()\\\", \\\"The first() function used to query for elements is now deprecate...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\MatrixBlockQuery\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/lib/Twig/Extension/Core.php\",\"line\":1626,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"first\",\"args\":null},{\"objectClass\":null,\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/helpers/Template.php\",\"line\":73,\"class\":null,\"method\":\"twig_get_attribute\",\"args\":\"craft\\\\web\\\\twig\\\\Environment, Twig_Source, craft\\\\elements\\\\db\\\\MatrixBlockQuery, \\\"first\\\", ...\"},{\"objectClass\":null,\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/storage/runtime/compiled_templates/de/de0473092775baa5ad664b8bf202949ad913c19fea852c1afb85ac3eb36aff6f.php\",\"line\":57,\"class\":\"craft\\\\helpers\\\\Template\",\"method\":\"attribute\",\"args\":\"craft\\\\web\\\\twig\\\\Environment, Twig_Source, craft\\\\elements\\\\db\\\\MatrixBlockQuery, \\\"first\\\", ...\"},{\"objectClass\":\"__TwigTemplate_839e26b99b4c102bef6e0fd9bb69bcde5a617b16d0c39e312a9bd9d3282b570f\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/lib/Twig/Template.php\",\"line\":189,\"class\":\"__TwigTemplate_839e26b99b4c102bef6e0fd9bb69bcde5a617b16d0c39e312a9bd9d3282b570f\",\"method\":\"block_content\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_839e26b99b4c102bef6e0fd9bb69bcde5a617b16d0c39e312a9bd9d3282b570f, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_2e8ea041cd069ff643d115d039a134038c9e24697dcfb3a255cb73808609f4e3\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/storage/runtime/compiled_templates/a7/a7e695a6b20d3a213a7156cd3849f9dfa6d4486215441b17144c5befab0bc0b6.php\",\"line\":38,\"class\":\"Twig_Template\",\"method\":\"displayBlock\",\"args\":\"\\\"content\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_839e26b99b4c102bef6e0fd9bb69bcde5a617b16d0c39e312a9bd9d3282b570f, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_2e8ea041cd069ff643d115d039a134038c9e24697dcfb3a255cb73808609f4e3\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/lib/Twig/Template.php\",\"line\":386,\"class\":\"__TwigTemplate_2e8ea041cd069ff643d115d039a134038c9e24697dcfb3a255cb73808609f4e3\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_839e26b99b4c102bef6e0fd9bb69bcde5a617b16d0c39e312a9bd9d3282b570f, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_2e8ea041cd069ff643d115d039a134038c9e24697dcfb3a255cb73808609f4e3\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":49,\"class\":\"Twig_Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_839e26b99b4c102bef6e0fd9bb69bcde5a617b16d0c39e312a9bd9d3282b570f, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_2e8ea041cd069ff643d115d039a134038c9e24697dcfb3a255cb73808609f4e3\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/lib/Twig/Template.php\",\"line\":363,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_839e26b99b4c102bef6e0fd9bb69bcde5a617b16d0c39e312a9bd9d3282b570f, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_2e8ea041cd069ff643d115d039a134038c9e24697dcfb3a255cb73808609f4e3\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":31,\"class\":\"Twig_Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_839e26b99b4c102bef6e0fd9bb69bcde5a617b16d0c39e312a9bd9d3282b570f, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_2e8ea041cd069ff643d115d039a134038c9e24697dcfb3a255cb73808609f4e3\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/storage/runtime/compiled_templates/de/de0473092775baa5ad664b8bf202949ad913c19fea852c1afb85ac3eb36aff6f.php\",\"line\":28,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_839e26b99b4c102bef6e0fd9bb69bcde5a617b16d0c39e312a9bd9d3282b570f, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_839e26b99b4c102bef6e0fd9bb69bcde5a617b16d0c39e312a9bd9d3282b570f\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/lib/Twig/Template.php\",\"line\":386,\"class\":\"__TwigTemplate_839e26b99b4c102bef6e0fd9bb69bcde5a617b16d0c39e312a9bd9d3282b570f\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_839e26b99b4c102bef6e0fd9bb69bcde5a617b16d0c39e312a9bd9d3282b570f, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_839e26b99b4c102bef6e0fd9bb69bcde5a617b16d0c39e312a9bd9d3282b570f\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":49,\"class\":\"Twig_Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_839e26b99b4c102bef6e0fd9bb69bcde5a617b16d0c39e312a9bd9d3282b570f, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_839e26b99b4c102bef6e0fd9bb69bcde5a617b16d0c39e312a9bd9d3282b570f\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/lib/Twig/Template.php\",\"line\":363,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_839e26b99b4c102bef6e0fd9bb69bcde5a617b16d0c39e312a9bd9d3282b570f, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_839e26b99b4c102bef6e0fd9bb69bcde5a617b16d0c39e312a9bd9d3282b570f\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":31,\"class\":\"Twig_Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"__TwigTemplate_839e26b99b4c102bef6e0fd9bb69bcde5a617b16d0c39e312a9bd9d3282b570f\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/lib/Twig/Template.php\",\"line\":371,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_839e26b99b4c102bef6e0fd9bb69bcde5a617b16d0c39e312a9bd9d3282b570f\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/lib/Twig/Environment.php\",\"line\":289,\"class\":\"Twig_Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/View.php\",\"line\":331,\"class\":\"Twig_Environment\",\"method\":\"render\",\"args\":\"\\\"order/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/View.php\",\"line\":378,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"order/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Controller.php\",\"line\":156,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"order/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/controllers/TemplatesController.php\",\"line\":78,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"order/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"order/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"order/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/Controller.php\",\"line\":157,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"order/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"order\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Controller.php\",\"line\":104,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"order/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"order\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"order/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"order\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Application.php\",\"line\":284,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"order/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"order\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/web/Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"order/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"order\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Application.php\",\"line\":273,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/web/index.php\",\"line\":21,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]', '2019-11-17 05:02:41', '2019-11-17 05:02:41', '64ea6f5b-bd04-44ab-8272-88fc00060bc8'),
(10, 'ElementQuery::getIterator()', '/Users/henrylawrence/personal/Craft-3.0.41/templates/order/_entry.twig:10', '2019-11-17 05:11:58', '/Users/henrylawrence/personal/Craft-3.0.41/templates/order/_entry.twig', 10, 'Looping through element queries directly has been deprecated. Use the all() function to fetch the query results before looping over them.', '[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/elements/db/ElementQuery.php\",\"line\":456,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\MatrixBlockQuery\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/storage/runtime/compiled_templates/de/de0473092775baa5ad664b8bf202949ad913c19fea852c1afb85ac3eb36aff6f.php\",\"line\":47,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":\"__TwigTemplate_839e26b99b4c102bef6e0fd9bb69bcde5a617b16d0c39e312a9bd9d3282b570f\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/lib/Twig/Template.php\",\"line\":189,\"class\":\"__TwigTemplate_839e26b99b4c102bef6e0fd9bb69bcde5a617b16d0c39e312a9bd9d3282b570f\",\"method\":\"block_content\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_839e26b99b4c102bef6e0fd9bb69bcde5a617b16d0c39e312a9bd9d3282b570f, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_2e8ea041cd069ff643d115d039a134038c9e24697dcfb3a255cb73808609f4e3\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/storage/runtime/compiled_templates/a7/a7e695a6b20d3a213a7156cd3849f9dfa6d4486215441b17144c5befab0bc0b6.php\",\"line\":46,\"class\":\"Twig_Template\",\"method\":\"displayBlock\",\"args\":\"\\\"content\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_839e26b99b4c102bef6e0fd9bb69bcde5a617b16d0c39e312a9bd9d3282b570f, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_2e8ea041cd069ff643d115d039a134038c9e24697dcfb3a255cb73808609f4e3\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/lib/Twig/Template.php\",\"line\":386,\"class\":\"__TwigTemplate_2e8ea041cd069ff643d115d039a134038c9e24697dcfb3a255cb73808609f4e3\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_839e26b99b4c102bef6e0fd9bb69bcde5a617b16d0c39e312a9bd9d3282b570f, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_2e8ea041cd069ff643d115d039a134038c9e24697dcfb3a255cb73808609f4e3\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":49,\"class\":\"Twig_Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_839e26b99b4c102bef6e0fd9bb69bcde5a617b16d0c39e312a9bd9d3282b570f, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_2e8ea041cd069ff643d115d039a134038c9e24697dcfb3a255cb73808609f4e3\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/lib/Twig/Template.php\",\"line\":363,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_839e26b99b4c102bef6e0fd9bb69bcde5a617b16d0c39e312a9bd9d3282b570f, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_2e8ea041cd069ff643d115d039a134038c9e24697dcfb3a255cb73808609f4e3\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":31,\"class\":\"Twig_Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_839e26b99b4c102bef6e0fd9bb69bcde5a617b16d0c39e312a9bd9d3282b570f, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_2e8ea041cd069ff643d115d039a134038c9e24697dcfb3a255cb73808609f4e3\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/storage/runtime/compiled_templates/de/de0473092775baa5ad664b8bf202949ad913c19fea852c1afb85ac3eb36aff6f.php\",\"line\":28,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_839e26b99b4c102bef6e0fd9bb69bcde5a617b16d0c39e312a9bd9d3282b570f, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_839e26b99b4c102bef6e0fd9bb69bcde5a617b16d0c39e312a9bd9d3282b570f\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/lib/Twig/Template.php\",\"line\":386,\"class\":\"__TwigTemplate_839e26b99b4c102bef6e0fd9bb69bcde5a617b16d0c39e312a9bd9d3282b570f\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_839e26b99b4c102bef6e0fd9bb69bcde5a617b16d0c39e312a9bd9d3282b570f, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_839e26b99b4c102bef6e0fd9bb69bcde5a617b16d0c39e312a9bd9d3282b570f\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":49,\"class\":\"Twig_Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_839e26b99b4c102bef6e0fd9bb69bcde5a617b16d0c39e312a9bd9d3282b570f, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_839e26b99b4c102bef6e0fd9bb69bcde5a617b16d0c39e312a9bd9d3282b570f\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/lib/Twig/Template.php\",\"line\":363,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_839e26b99b4c102bef6e0fd9bb69bcde5a617b16d0c39e312a9bd9d3282b570f, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_839e26b99b4c102bef6e0fd9bb69bcde5a617b16d0c39e312a9bd9d3282b570f\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":31,\"class\":\"Twig_Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"__TwigTemplate_839e26b99b4c102bef6e0fd9bb69bcde5a617b16d0c39e312a9bd9d3282b570f\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/lib/Twig/Template.php\",\"line\":371,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_839e26b99b4c102bef6e0fd9bb69bcde5a617b16d0c39e312a9bd9d3282b570f\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/lib/Twig/Environment.php\",\"line\":289,\"class\":\"Twig_Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/View.php\",\"line\":331,\"class\":\"Twig_Environment\",\"method\":\"render\",\"args\":\"\\\"order/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/View.php\",\"line\":378,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"order/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Controller.php\",\"line\":156,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"order/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/controllers/TemplatesController.php\",\"line\":78,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"order/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"order/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"order/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/Controller.php\",\"line\":157,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"order/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"order\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Controller.php\",\"line\":104,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"order/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"order\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"order/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"order\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Application.php\",\"line\":284,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"order/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"order\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/web/Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"order/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"order\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Application.php\",\"line\":273,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/web/index.php\",\"line\":21,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]', '2019-11-17 05:11:58', '2019-11-17 05:11:58', '57c3c571-d461-480e-8c3c-f8e51c1322a2'),
(31, 'ElementQuery::getIterator()', '/Users/henrylawrence/personal/Craft-3.0.41/templates/order/_entry.twig:5', '2019-11-17 05:29:13', '/Users/henrylawrence/personal/Craft-3.0.41/templates/order/_entry.twig', 5, 'Looping through element queries directly has been deprecated. Use the all() function to fetch the query results before looping over them.', '[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/elements/db/ElementQuery.php\",\"line\":456,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\MatrixBlockQuery\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/storage/runtime/compiled_templates/de/de0473092775baa5ad664b8bf202949ad913c19fea852c1afb85ac3eb36aff6f.php\",\"line\":40,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":\"__TwigTemplate_839e26b99b4c102bef6e0fd9bb69bcde5a617b16d0c39e312a9bd9d3282b570f\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/lib/Twig/Template.php\",\"line\":189,\"class\":\"__TwigTemplate_839e26b99b4c102bef6e0fd9bb69bcde5a617b16d0c39e312a9bd9d3282b570f\",\"method\":\"block_content\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_839e26b99b4c102bef6e0fd9bb69bcde5a617b16d0c39e312a9bd9d3282b570f, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_2e8ea041cd069ff643d115d039a134038c9e24697dcfb3a255cb73808609f4e3\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/storage/runtime/compiled_templates/a7/a7e695a6b20d3a213a7156cd3849f9dfa6d4486215441b17144c5befab0bc0b6.php\",\"line\":46,\"class\":\"Twig_Template\",\"method\":\"displayBlock\",\"args\":\"\\\"content\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_839e26b99b4c102bef6e0fd9bb69bcde5a617b16d0c39e312a9bd9d3282b570f, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_2e8ea041cd069ff643d115d039a134038c9e24697dcfb3a255cb73808609f4e3\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/lib/Twig/Template.php\",\"line\":386,\"class\":\"__TwigTemplate_2e8ea041cd069ff643d115d039a134038c9e24697dcfb3a255cb73808609f4e3\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_839e26b99b4c102bef6e0fd9bb69bcde5a617b16d0c39e312a9bd9d3282b570f, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_2e8ea041cd069ff643d115d039a134038c9e24697dcfb3a255cb73808609f4e3\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":49,\"class\":\"Twig_Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_839e26b99b4c102bef6e0fd9bb69bcde5a617b16d0c39e312a9bd9d3282b570f, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_2e8ea041cd069ff643d115d039a134038c9e24697dcfb3a255cb73808609f4e3\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/lib/Twig/Template.php\",\"line\":363,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_839e26b99b4c102bef6e0fd9bb69bcde5a617b16d0c39e312a9bd9d3282b570f, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_2e8ea041cd069ff643d115d039a134038c9e24697dcfb3a255cb73808609f4e3\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":31,\"class\":\"Twig_Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_839e26b99b4c102bef6e0fd9bb69bcde5a617b16d0c39e312a9bd9d3282b570f, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_2e8ea041cd069ff643d115d039a134038c9e24697dcfb3a255cb73808609f4e3\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/storage/runtime/compiled_templates/de/de0473092775baa5ad664b8bf202949ad913c19fea852c1afb85ac3eb36aff6f.php\",\"line\":28,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_839e26b99b4c102bef6e0fd9bb69bcde5a617b16d0c39e312a9bd9d3282b570f, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_839e26b99b4c102bef6e0fd9bb69bcde5a617b16d0c39e312a9bd9d3282b570f\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/lib/Twig/Template.php\",\"line\":386,\"class\":\"__TwigTemplate_839e26b99b4c102bef6e0fd9bb69bcde5a617b16d0c39e312a9bd9d3282b570f\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_839e26b99b4c102bef6e0fd9bb69bcde5a617b16d0c39e312a9bd9d3282b570f, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_839e26b99b4c102bef6e0fd9bb69bcde5a617b16d0c39e312a9bd9d3282b570f\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":49,\"class\":\"Twig_Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_839e26b99b4c102bef6e0fd9bb69bcde5a617b16d0c39e312a9bd9d3282b570f, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_839e26b99b4c102bef6e0fd9bb69bcde5a617b16d0c39e312a9bd9d3282b570f\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/lib/Twig/Template.php\",\"line\":363,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"SORT_ASC\\\" => 4, ...], [\\\"content\\\" => [__TwigTemplate_839e26b99b4c102bef6e0fd9bb69bcde5a617b16d0c39e312a9bd9d3282b570f, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_839e26b99b4c102bef6e0fd9bb69bcde5a617b16d0c39e312a9bd9d3282b570f\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/twig/Template.php\",\"line\":31,\"class\":\"Twig_Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"__TwigTemplate_839e26b99b4c102bef6e0fd9bb69bcde5a617b16d0c39e312a9bd9d3282b570f\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/lib/Twig/Template.php\",\"line\":371,\"class\":\"craft\\\\web\\\\twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_839e26b99b4c102bef6e0fd9bb69bcde5a617b16d0c39e312a9bd9d3282b570f\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/lib/Twig/Environment.php\",\"line\":289,\"class\":\"Twig_Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/View.php\",\"line\":331,\"class\":\"Twig_Environment\",\"method\":\"render\",\"args\":\"\\\"order/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/View.php\",\"line\":378,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"order/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Controller.php\",\"line\":156,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"order/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/controllers/TemplatesController.php\",\"line\":78,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"order/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"order/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"order/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/Controller.php\",\"line\":157,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"order/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"order\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Controller.php\",\"line\":104,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"order/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"order\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"order/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"order\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Application.php\",\"line\":284,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"order/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"order\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/web/Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"order/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"order\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Application.php\",\"line\":273,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/web/index.php\",\"line\":21,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]', '2019-11-17 05:29:13', '2019-11-17 05:29:13', '28f6e906-c6a6-4fe5-9324-d68defdd58a2');
INSERT INTO `deprecationerrors` (`id`, `key`, `fingerprint`, `lastOccurrence`, `file`, `line`, `message`, `traces`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(82, 'ElementQuery::getIterator()', '/Users/henrylawrence/personal/Craft-3.0.41/templates/home/_entry.twig:7', '2019-11-21 10:31:38', '/Users/henrylawrence/personal/Craft-3.0.41/templates/home/_entry.twig', 7, 'Looping through element queries directly has been deprecated. Use the all() function to fetch the query results before looping over them.', '[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/elements/db/ElementQuery.php\",\"line\":584,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\MatrixBlockQuery\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/storage/runtime/compiled_templates/3d/3d41499a492e50f7450a0d008d7a0b5f2da77e1f640b86f2e9c91a2edc9262e8.php\",\"line\":64,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":184,\"class\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"method\":\"block_content\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/storage/runtime/compiled_templates/c0/c0a7b674a2f6497e393d33b2a2ae5b45b53b55ee643d8dfb40f7b7ca1cbf29b2.php\",\"line\":61,\"class\":\"Twig\\\\Template\",\"method\":\"displayBlock\",\"args\":\"\\\"content\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":407,\"class\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/storage/runtime/compiled_templates/3d/3d41499a492e50f7450a0d008d7a0b5f2da77e1f640b86f2e9c91a2edc9262e8.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":407,\"class\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":392,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/TemplateWrapper.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"Twig\\\\TemplateWrapper\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Environment.php\",\"line\":318,\"class\":\"Twig\\\\TemplateWrapper\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/View.php\",\"line\":344,\"class\":\"Twig\\\\Environment\",\"method\":\"render\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/View.php\",\"line\":393,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Controller.php\",\"line\":243,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/controllers/TemplatesController.php\",\"line\":101,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/Controller.php\",\"line\":157,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Controller.php\",\"line\":187,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Application.php\",\"line\":299,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/web/Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Application.php\",\"line\":284,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/web/index.php\",\"line\":21,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]', '2019-11-21 10:31:38', '2019-11-21 10:31:38', '09975f15-e841-4c38-b9d4-e9234161a77c'),
(89, 'ElementQuery::getIterator()', '/Users/henrylawrence/personal/Craft-3.0.41/templates/order/_entry.twig:11', '2019-11-24 08:40:35', '/Users/henrylawrence/personal/Craft-3.0.41/templates/order/_entry.twig', 11, 'Looping through element queries directly has been deprecated. Use the all() function to fetch the query results before looping over them.', '[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/elements/db/ElementQuery.php\",\"line\":584,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\MatrixBlockQuery\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/storage/runtime/compiled_templates/72/72947ea7894b88ac9a157b209c6c4e447ec559111f3b60fbbecac67002e684be.php\",\"line\":68,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":\"__TwigTemplate_a0d64f0ea5d09e04c872c104044fc732b8ff5f372f94a9bb33f58935eb1d33ac\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":184,\"class\":\"__TwigTemplate_a0d64f0ea5d09e04c872c104044fc732b8ff5f372f94a9bb33f58935eb1d33ac\",\"method\":\"block_content\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_a0d64f0ea5d09e04c872c104044fc732b8ff5f372f94a9bb33f58935eb1d33ac, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/storage/runtime/compiled_templates/c0/c0a7b674a2f6497e393d33b2a2ae5b45b53b55ee643d8dfb40f7b7ca1cbf29b2.php\",\"line\":61,\"class\":\"Twig\\\\Template\",\"method\":\"displayBlock\",\"args\":\"\\\"content\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_a0d64f0ea5d09e04c872c104044fc732b8ff5f372f94a9bb33f58935eb1d33ac, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":407,\"class\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_a0d64f0ea5d09e04c872c104044fc732b8ff5f372f94a9bb33f58935eb1d33ac, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_a0d64f0ea5d09e04c872c104044fc732b8ff5f372f94a9bb33f58935eb1d33ac, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/storage/runtime/compiled_templates/72/72947ea7894b88ac9a157b209c6c4e447ec559111f3b60fbbecac67002e684be.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_a0d64f0ea5d09e04c872c104044fc732b8ff5f372f94a9bb33f58935eb1d33ac, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_a0d64f0ea5d09e04c872c104044fc732b8ff5f372f94a9bb33f58935eb1d33ac\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":407,\"class\":\"__TwigTemplate_a0d64f0ea5d09e04c872c104044fc732b8ff5f372f94a9bb33f58935eb1d33ac\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_a0d64f0ea5d09e04c872c104044fc732b8ff5f372f94a9bb33f58935eb1d33ac, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_a0d64f0ea5d09e04c872c104044fc732b8ff5f372f94a9bb33f58935eb1d33ac\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_a0d64f0ea5d09e04c872c104044fc732b8ff5f372f94a9bb33f58935eb1d33ac, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_a0d64f0ea5d09e04c872c104044fc732b8ff5f372f94a9bb33f58935eb1d33ac\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":392,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_a0d64f0ea5d09e04c872c104044fc732b8ff5f372f94a9bb33f58935eb1d33ac\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/TemplateWrapper.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"Twig\\\\TemplateWrapper\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Environment.php\",\"line\":318,\"class\":\"Twig\\\\TemplateWrapper\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/View.php\",\"line\":344,\"class\":\"Twig\\\\Environment\",\"method\":\"render\",\"args\":\"\\\"order/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/View.php\",\"line\":393,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"order/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Controller.php\",\"line\":243,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"order/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/controllers/TemplatesController.php\",\"line\":101,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"order/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"order/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"order/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/Controller.php\",\"line\":157,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"order/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"order\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Controller.php\",\"line\":187,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"order/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"order\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"order/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"order\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Application.php\",\"line\":299,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"order/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"order\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/web/Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"order/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"order\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Application.php\",\"line\":284,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/web/index.php\",\"line\":21,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]', '2019-11-24 08:40:35', '2019-11-24 08:40:35', '49e7aef9-1e6c-47ca-b1cf-a7469a6aa160'),
(95, 'ElementQuery::getIterator()', '/Users/henrylawrence/personal/Craft-3.0.41/templates/order/_entry.twig:12', '2019-11-24 01:42:40', '/Users/henrylawrence/personal/Craft-3.0.41/templates/order/_entry.twig', 12, 'Looping through element queries directly has been deprecated. Use the all() function to fetch the query results before looping over them.', '[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/elements/db/ElementQuery.php\",\"line\":584,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\MatrixBlockQuery\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/storage/runtime/compiled_templates/72/72947ea7894b88ac9a157b209c6c4e447ec559111f3b60fbbecac67002e684be.php\",\"line\":70,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":\"__TwigTemplate_a0d64f0ea5d09e04c872c104044fc732b8ff5f372f94a9bb33f58935eb1d33ac\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":184,\"class\":\"__TwigTemplate_a0d64f0ea5d09e04c872c104044fc732b8ff5f372f94a9bb33f58935eb1d33ac\",\"method\":\"block_content\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_a0d64f0ea5d09e04c872c104044fc732b8ff5f372f94a9bb33f58935eb1d33ac, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/storage/runtime/compiled_templates/c0/c0a7b674a2f6497e393d33b2a2ae5b45b53b55ee643d8dfb40f7b7ca1cbf29b2.php\",\"line\":61,\"class\":\"Twig\\\\Template\",\"method\":\"displayBlock\",\"args\":\"\\\"content\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_a0d64f0ea5d09e04c872c104044fc732b8ff5f372f94a9bb33f58935eb1d33ac, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":407,\"class\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_a0d64f0ea5d09e04c872c104044fc732b8ff5f372f94a9bb33f58935eb1d33ac, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_a0d64f0ea5d09e04c872c104044fc732b8ff5f372f94a9bb33f58935eb1d33ac, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/storage/runtime/compiled_templates/72/72947ea7894b88ac9a157b209c6c4e447ec559111f3b60fbbecac67002e684be.php\",\"line\":47,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_a0d64f0ea5d09e04c872c104044fc732b8ff5f372f94a9bb33f58935eb1d33ac, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_a0d64f0ea5d09e04c872c104044fc732b8ff5f372f94a9bb33f58935eb1d33ac\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":407,\"class\":\"__TwigTemplate_a0d64f0ea5d09e04c872c104044fc732b8ff5f372f94a9bb33f58935eb1d33ac\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_a0d64f0ea5d09e04c872c104044fc732b8ff5f372f94a9bb33f58935eb1d33ac, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_a0d64f0ea5d09e04c872c104044fc732b8ff5f372f94a9bb33f58935eb1d33ac\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_a0d64f0ea5d09e04c872c104044fc732b8ff5f372f94a9bb33f58935eb1d33ac, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_a0d64f0ea5d09e04c872c104044fc732b8ff5f372f94a9bb33f58935eb1d33ac\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":392,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_a0d64f0ea5d09e04c872c104044fc732b8ff5f372f94a9bb33f58935eb1d33ac\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/TemplateWrapper.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"Twig\\\\TemplateWrapper\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Environment.php\",\"line\":318,\"class\":\"Twig\\\\TemplateWrapper\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/View.php\",\"line\":344,\"class\":\"Twig\\\\Environment\",\"method\":\"render\",\"args\":\"\\\"order/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/View.php\",\"line\":393,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"order/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Controller.php\",\"line\":243,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"order/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/controllers/TemplatesController.php\",\"line\":101,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"order/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"order/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"order/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/Controller.php\",\"line\":157,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"order/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"order\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Controller.php\",\"line\":187,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"order/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"order\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"order/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"order\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Application.php\",\"line\":299,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"order/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"order\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/web/Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"order/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"order\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Application.php\",\"line\":284,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/web/index.php\",\"line\":21,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]', '2019-11-24 01:42:40', '2019-11-24 01:42:40', 'f0510223-4f3c-4f94-b819-67e4eb6f1312'),
(96, 'ElementQuery::getIterator()', '/Users/henrylawrence/personal/Craft-3.0.41/templates/home/_entry.twig:9', '2019-11-21 10:33:12', '/Users/henrylawrence/personal/Craft-3.0.41/templates/home/_entry.twig', 9, 'Looping through element queries directly has been deprecated. Use the all() function to fetch the query results before looping over them.', '[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/elements/db/ElementQuery.php\",\"line\":584,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\MatrixBlockQuery\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/storage/runtime/compiled_templates/3d/3d41499a492e50f7450a0d008d7a0b5f2da77e1f640b86f2e9c91a2edc9262e8.php\",\"line\":69,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":184,\"class\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"method\":\"block_content\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/storage/runtime/compiled_templates/c0/c0a7b674a2f6497e393d33b2a2ae5b45b53b55ee643d8dfb40f7b7ca1cbf29b2.php\",\"line\":61,\"class\":\"Twig\\\\Template\",\"method\":\"displayBlock\",\"args\":\"\\\"content\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":407,\"class\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/storage/runtime/compiled_templates/3d/3d41499a492e50f7450a0d008d7a0b5f2da77e1f640b86f2e9c91a2edc9262e8.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":407,\"class\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":392,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/TemplateWrapper.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"Twig\\\\TemplateWrapper\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Environment.php\",\"line\":318,\"class\":\"Twig\\\\TemplateWrapper\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/View.php\",\"line\":344,\"class\":\"Twig\\\\Environment\",\"method\":\"render\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/View.php\",\"line\":393,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Controller.php\",\"line\":243,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/controllers/TemplatesController.php\",\"line\":101,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/Controller.php\",\"line\":157,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Controller.php\",\"line\":187,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Application.php\",\"line\":299,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/web/Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Application.php\",\"line\":284,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/web/index.php\",\"line\":21,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]', '2019-11-21 10:33:12', '2019-11-21 10:33:12', 'b91cc5af-98b7-433b-9c04-f317545f4d47');
INSERT INTO `deprecationerrors` (`id`, `key`, `fingerprint`, `lastOccurrence`, `file`, `line`, `message`, `traces`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(98, 'ElementQuery::getIterator()', '/Users/henrylawrence/personal/Craft-3.0.41/templates/home/_entry.twig:10', '2019-11-21 10:33:25', '/Users/henrylawrence/personal/Craft-3.0.41/templates/home/_entry.twig', 10, 'Looping through element queries directly has been deprecated. Use the all() function to fetch the query results before looping over them.', '[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/elements/db/ElementQuery.php\",\"line\":584,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\MatrixBlockQuery\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/storage/runtime/compiled_templates/3d/3d41499a492e50f7450a0d008d7a0b5f2da77e1f640b86f2e9c91a2edc9262e8.php\",\"line\":70,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":184,\"class\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"method\":\"block_content\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/storage/runtime/compiled_templates/c0/c0a7b674a2f6497e393d33b2a2ae5b45b53b55ee643d8dfb40f7b7ca1cbf29b2.php\",\"line\":61,\"class\":\"Twig\\\\Template\",\"method\":\"displayBlock\",\"args\":\"\\\"content\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":407,\"class\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/storage/runtime/compiled_templates/3d/3d41499a492e50f7450a0d008d7a0b5f2da77e1f640b86f2e9c91a2edc9262e8.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":407,\"class\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":392,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/TemplateWrapper.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"Twig\\\\TemplateWrapper\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Environment.php\",\"line\":318,\"class\":\"Twig\\\\TemplateWrapper\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/View.php\",\"line\":344,\"class\":\"Twig\\\\Environment\",\"method\":\"render\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/View.php\",\"line\":393,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Controller.php\",\"line\":243,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/controllers/TemplatesController.php\",\"line\":101,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/Controller.php\",\"line\":157,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Controller.php\",\"line\":187,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Application.php\",\"line\":299,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/web/Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Application.php\",\"line\":284,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/web/index.php\",\"line\":21,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]', '2019-11-21 10:33:25', '2019-11-21 10:33:25', 'bdef6250-3572-44a1-b304-6e5e6ded1b46'),
(100, 'ElementQuery::getIterator()', '/Users/henrylawrence/personal/Craft-3.0.41/templates/home/_entry.twig:12', '2019-11-21 10:35:36', '/Users/henrylawrence/personal/Craft-3.0.41/templates/home/_entry.twig', 12, 'Looping through element queries directly has been deprecated. Use the all() function to fetch the query results before looping over them.', '[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/elements/db/ElementQuery.php\",\"line\":584,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\MatrixBlockQuery\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/storage/runtime/compiled_templates/3d/3d41499a492e50f7450a0d008d7a0b5f2da77e1f640b86f2e9c91a2edc9262e8.php\",\"line\":74,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":184,\"class\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"method\":\"block_content\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/storage/runtime/compiled_templates/c0/c0a7b674a2f6497e393d33b2a2ae5b45b53b55ee643d8dfb40f7b7ca1cbf29b2.php\",\"line\":61,\"class\":\"Twig\\\\Template\",\"method\":\"displayBlock\",\"args\":\"\\\"content\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":407,\"class\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/storage/runtime/compiled_templates/3d/3d41499a492e50f7450a0d008d7a0b5f2da77e1f640b86f2e9c91a2edc9262e8.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":407,\"class\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":392,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/TemplateWrapper.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"Twig\\\\TemplateWrapper\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Environment.php\",\"line\":318,\"class\":\"Twig\\\\TemplateWrapper\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/View.php\",\"line\":344,\"class\":\"Twig\\\\Environment\",\"method\":\"render\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/View.php\",\"line\":393,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Controller.php\",\"line\":243,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/controllers/TemplatesController.php\",\"line\":101,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/Controller.php\",\"line\":157,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Controller.php\",\"line\":187,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Application.php\",\"line\":299,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/web/Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Application.php\",\"line\":284,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/web/index.php\",\"line\":21,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]', '2019-11-21 10:35:36', '2019-11-21 10:35:36', '7b2501e9-cbf0-4b5e-a8d3-416e79f40677'),
(101, 'ElementQuery::getIterator()', '/Users/henrylawrence/personal/Craft-3.0.41/templates/home/_entry.twig:14', '2019-11-21 10:36:36', '/Users/henrylawrence/personal/Craft-3.0.41/templates/home/_entry.twig', 14, 'Looping through element queries directly has been deprecated. Use the all() function to fetch the query results before looping over them.', '[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/elements/db/ElementQuery.php\",\"line\":584,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\MatrixBlockQuery\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/storage/runtime/compiled_templates/3d/3d41499a492e50f7450a0d008d7a0b5f2da77e1f640b86f2e9c91a2edc9262e8.php\",\"line\":79,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":184,\"class\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"method\":\"block_content\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/storage/runtime/compiled_templates/c0/c0a7b674a2f6497e393d33b2a2ae5b45b53b55ee643d8dfb40f7b7ca1cbf29b2.php\",\"line\":61,\"class\":\"Twig\\\\Template\",\"method\":\"displayBlock\",\"args\":\"\\\"content\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":407,\"class\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/storage/runtime/compiled_templates/3d/3d41499a492e50f7450a0d008d7a0b5f2da77e1f640b86f2e9c91a2edc9262e8.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":407,\"class\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":392,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/TemplateWrapper.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"Twig\\\\TemplateWrapper\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Environment.php\",\"line\":318,\"class\":\"Twig\\\\TemplateWrapper\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/View.php\",\"line\":344,\"class\":\"Twig\\\\Environment\",\"method\":\"render\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/View.php\",\"line\":393,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Controller.php\",\"line\":243,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/controllers/TemplatesController.php\",\"line\":101,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/Controller.php\",\"line\":157,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Controller.php\",\"line\":187,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Application.php\",\"line\":299,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/web/Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Application.php\",\"line\":284,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/web/index.php\",\"line\":21,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]', '2019-11-21 10:36:36', '2019-11-21 10:36:36', 'faea1047-a9b2-43e0-a936-d29481df9183'),
(102, 'ElementQuery::getIterator()', '/Users/henrylawrence/personal/Craft-3.0.41/templates/home/_entry.twig:16', '2019-11-21 10:37:24', '/Users/henrylawrence/personal/Craft-3.0.41/templates/home/_entry.twig', 16, 'Looping through element queries directly has been deprecated. Use the all() function to fetch the query results before looping over them.', '[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/elements/db/ElementQuery.php\",\"line\":584,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\MatrixBlockQuery\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/storage/runtime/compiled_templates/3d/3d41499a492e50f7450a0d008d7a0b5f2da77e1f640b86f2e9c91a2edc9262e8.php\",\"line\":84,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":184,\"class\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"method\":\"block_content\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/storage/runtime/compiled_templates/c0/c0a7b674a2f6497e393d33b2a2ae5b45b53b55ee643d8dfb40f7b7ca1cbf29b2.php\",\"line\":61,\"class\":\"Twig\\\\Template\",\"method\":\"displayBlock\",\"args\":\"\\\"content\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":407,\"class\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/storage/runtime/compiled_templates/3d/3d41499a492e50f7450a0d008d7a0b5f2da77e1f640b86f2e9c91a2edc9262e8.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":407,\"class\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":392,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/TemplateWrapper.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"Twig\\\\TemplateWrapper\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Environment.php\",\"line\":318,\"class\":\"Twig\\\\TemplateWrapper\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/View.php\",\"line\":344,\"class\":\"Twig\\\\Environment\",\"method\":\"render\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/View.php\",\"line\":393,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Controller.php\",\"line\":243,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/controllers/TemplatesController.php\",\"line\":101,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/Controller.php\",\"line\":157,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Controller.php\",\"line\":187,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Application.php\",\"line\":299,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/web/Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Application.php\",\"line\":284,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/web/index.php\",\"line\":21,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]', '2019-11-21 10:37:24', '2019-11-21 10:37:24', 'a7c8b67c-0764-407c-8cc8-98112eda52e2');
INSERT INTO `deprecationerrors` (`id`, `key`, `fingerprint`, `lastOccurrence`, `file`, `line`, `message`, `traces`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(103, 'ElementQuery::getIterator()', '/Users/henrylawrence/personal/Craft-3.0.41/templates/home/_entry.twig:17', '2019-11-21 10:38:07', '/Users/henrylawrence/personal/Craft-3.0.41/templates/home/_entry.twig', 17, 'Looping through element queries directly has been deprecated. Use the all() function to fetch the query results before looping over them.', '[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/elements/db/ElementQuery.php\",\"line\":584,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\MatrixBlockQuery\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/storage/runtime/compiled_templates/3d/3d41499a492e50f7450a0d008d7a0b5f2da77e1f640b86f2e9c91a2edc9262e8.php\",\"line\":88,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":184,\"class\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"method\":\"block_content\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/storage/runtime/compiled_templates/c0/c0a7b674a2f6497e393d33b2a2ae5b45b53b55ee643d8dfb40f7b7ca1cbf29b2.php\",\"line\":61,\"class\":\"Twig\\\\Template\",\"method\":\"displayBlock\",\"args\":\"\\\"content\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":407,\"class\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/storage/runtime/compiled_templates/3d/3d41499a492e50f7450a0d008d7a0b5f2da77e1f640b86f2e9c91a2edc9262e8.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":407,\"class\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":392,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/TemplateWrapper.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"Twig\\\\TemplateWrapper\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Environment.php\",\"line\":318,\"class\":\"Twig\\\\TemplateWrapper\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/View.php\",\"line\":344,\"class\":\"Twig\\\\Environment\",\"method\":\"render\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/View.php\",\"line\":393,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Controller.php\",\"line\":243,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/controllers/TemplatesController.php\",\"line\":101,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/Controller.php\",\"line\":157,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Controller.php\",\"line\":187,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Application.php\",\"line\":299,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/web/Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Application.php\",\"line\":284,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/web/index.php\",\"line\":21,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]', '2019-11-21 10:38:07', '2019-11-21 10:38:07', '8d80acc2-a604-4e2f-8fcc-f776bcb6da5c'),
(112, 'ElementQuery::getIterator()', '/Users/henrylawrence/personal/Craft-3.0.41/templates/home/_entry.twig:61', '2019-11-21 10:40:03', '/Users/henrylawrence/personal/Craft-3.0.41/templates/home/_entry.twig', 61, 'Looping through element queries directly has been deprecated. Use the all() function to fetch the query results before looping over them.', '[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/elements/db/ElementQuery.php\",\"line\":584,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\MatrixBlockQuery\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/storage/runtime/compiled_templates/3d/3d41499a492e50f7450a0d008d7a0b5f2da77e1f640b86f2e9c91a2edc9262e8.php\",\"line\":168,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":184,\"class\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"method\":\"block_content\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/storage/runtime/compiled_templates/c0/c0a7b674a2f6497e393d33b2a2ae5b45b53b55ee643d8dfb40f7b7ca1cbf29b2.php\",\"line\":61,\"class\":\"Twig\\\\Template\",\"method\":\"displayBlock\",\"args\":\"\\\"content\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":407,\"class\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/storage/runtime/compiled_templates/3d/3d41499a492e50f7450a0d008d7a0b5f2da77e1f640b86f2e9c91a2edc9262e8.php\",\"line\":46,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":407,\"class\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":392,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/TemplateWrapper.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"Twig\\\\TemplateWrapper\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Environment.php\",\"line\":318,\"class\":\"Twig\\\\TemplateWrapper\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/View.php\",\"line\":344,\"class\":\"Twig\\\\Environment\",\"method\":\"render\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/View.php\",\"line\":393,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Controller.php\",\"line\":243,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/controllers/TemplatesController.php\",\"line\":101,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/Controller.php\",\"line\":157,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Controller.php\",\"line\":187,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Application.php\",\"line\":299,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/web/Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Application.php\",\"line\":284,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/web/index.php\",\"line\":21,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]', '2019-11-21 10:40:03', '2019-11-21 10:40:03', '899a53e0-3c5f-4c72-adfb-0cc9dc046f47'),
(114, 'ElementQuery::getIterator()', '/Users/henrylawrence/personal/Craft-3.0.41/templates/home/_entry.twig:19', '2019-11-24 01:20:35', '/Users/henrylawrence/personal/Craft-3.0.41/templates/home/_entry.twig', 19, 'Looping through element queries directly has been deprecated. Use the all() function to fetch the query results before looping over them.', '[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/elements/db/ElementQuery.php\",\"line\":584,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\MatrixBlockQuery\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/storage/runtime/compiled_templates/3d/3d41499a492e50f7450a0d008d7a0b5f2da77e1f640b86f2e9c91a2edc9262e8.php\",\"line\":90,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":184,\"class\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"method\":\"block_content\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/storage/runtime/compiled_templates/c0/c0a7b674a2f6497e393d33b2a2ae5b45b53b55ee643d8dfb40f7b7ca1cbf29b2.php\",\"line\":61,\"class\":\"Twig\\\\Template\",\"method\":\"displayBlock\",\"args\":\"\\\"content\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":407,\"class\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/storage/runtime/compiled_templates/3d/3d41499a492e50f7450a0d008d7a0b5f2da77e1f640b86f2e9c91a2edc9262e8.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":407,\"class\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":392,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/TemplateWrapper.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"Twig\\\\TemplateWrapper\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Environment.php\",\"line\":318,\"class\":\"Twig\\\\TemplateWrapper\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/View.php\",\"line\":344,\"class\":\"Twig\\\\Environment\",\"method\":\"render\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/View.php\",\"line\":393,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Controller.php\",\"line\":243,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/controllers/TemplatesController.php\",\"line\":101,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/Controller.php\",\"line\":157,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Controller.php\",\"line\":187,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Application.php\",\"line\":299,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/web/Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Application.php\",\"line\":284,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/web/index.php\",\"line\":21,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]', '2019-11-24 01:20:35', '2019-11-24 01:20:35', '094b3f3f-d371-4897-bfe7-1c1626619081'),
(121, 'ElementQuery::getIterator()', '/Users/henrylawrence/personal/Craft-3.0.41/templates/home/_entry.twig:22', '2019-11-24 01:19:36', '/Users/henrylawrence/personal/Craft-3.0.41/templates/home/_entry.twig', 22, 'Looping through element queries directly has been deprecated. Use the all() function to fetch the query results before looping over them.', '[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/elements/db/ElementQuery.php\",\"line\":584,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\MatrixBlockQuery\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/storage/runtime/compiled_templates/3d/3d41499a492e50f7450a0d008d7a0b5f2da77e1f640b86f2e9c91a2edc9262e8.php\",\"line\":96,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":184,\"class\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"method\":\"block_content\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/storage/runtime/compiled_templates/c0/c0a7b674a2f6497e393d33b2a2ae5b45b53b55ee643d8dfb40f7b7ca1cbf29b2.php\",\"line\":61,\"class\":\"Twig\\\\Template\",\"method\":\"displayBlock\",\"args\":\"\\\"content\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":407,\"class\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/storage/runtime/compiled_templates/3d/3d41499a492e50f7450a0d008d7a0b5f2da77e1f640b86f2e9c91a2edc9262e8.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":407,\"class\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":392,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/TemplateWrapper.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"Twig\\\\TemplateWrapper\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Environment.php\",\"line\":318,\"class\":\"Twig\\\\TemplateWrapper\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/View.php\",\"line\":344,\"class\":\"Twig\\\\Environment\",\"method\":\"render\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/View.php\",\"line\":393,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Controller.php\",\"line\":243,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/controllers/TemplatesController.php\",\"line\":101,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/Controller.php\",\"line\":157,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Controller.php\",\"line\":187,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Application.php\",\"line\":299,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/web/Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Application.php\",\"line\":284,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/web/index.php\",\"line\":21,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]', '2019-11-24 01:19:36', '2019-11-24 01:19:36', '887eae50-15a6-4cdb-899b-659ddcaa7a76');
INSERT INTO `deprecationerrors` (`id`, `key`, `fingerprint`, `lastOccurrence`, `file`, `line`, `message`, `traces`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(125, 'ElementQuery::getIterator()', '/Users/henrylawrence/personal/Craft-3.0.41/templates/home/_entry.twig:23', '2019-11-24 01:20:56', '/Users/henrylawrence/personal/Craft-3.0.41/templates/home/_entry.twig', 23, 'Looping through element queries directly has been deprecated. Use the all() function to fetch the query results before looping over them.', '[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/elements/db/ElementQuery.php\",\"line\":584,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\MatrixBlockQuery\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/storage/runtime/compiled_templates/3d/3d41499a492e50f7450a0d008d7a0b5f2da77e1f640b86f2e9c91a2edc9262e8.php\",\"line\":100,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":184,\"class\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"method\":\"block_content\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/storage/runtime/compiled_templates/c0/c0a7b674a2f6497e393d33b2a2ae5b45b53b55ee643d8dfb40f7b7ca1cbf29b2.php\",\"line\":61,\"class\":\"Twig\\\\Template\",\"method\":\"displayBlock\",\"args\":\"\\\"content\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":407,\"class\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/storage/runtime/compiled_templates/3d/3d41499a492e50f7450a0d008d7a0b5f2da77e1f640b86f2e9c91a2edc9262e8.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":407,\"class\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":392,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/TemplateWrapper.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"Twig\\\\TemplateWrapper\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Environment.php\",\"line\":318,\"class\":\"Twig\\\\TemplateWrapper\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/View.php\",\"line\":344,\"class\":\"Twig\\\\Environment\",\"method\":\"render\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/View.php\",\"line\":393,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Controller.php\",\"line\":243,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/controllers/TemplatesController.php\",\"line\":101,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/Controller.php\",\"line\":157,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Controller.php\",\"line\":187,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Application.php\",\"line\":299,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/web/Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Application.php\",\"line\":284,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/web/index.php\",\"line\":21,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]', '2019-11-24 01:20:56', '2019-11-24 01:20:56', '599c539a-f174-47ca-838f-8298a8c7c3df'),
(129, 'ElementQuery::getIterator()', '/Users/henrylawrence/personal/Craft-3.0.41/templates/home/_entry.twig:32', '2019-11-25 05:23:24', '/Users/henrylawrence/personal/Craft-3.0.41/templates/home/_entry.twig', 32, 'Looping through element queries directly has been deprecated. Use the all() function to fetch the query results before looping over them.', '[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/elements/db/ElementQuery.php\",\"line\":584,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\MatrixBlockQuery\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/storage/runtime/compiled_templates/3d/3d41499a492e50f7450a0d008d7a0b5f2da77e1f640b86f2e9c91a2edc9262e8.php\",\"line\":115,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":184,\"class\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"method\":\"block_content\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/storage/runtime/compiled_templates/c0/c0a7b674a2f6497e393d33b2a2ae5b45b53b55ee643d8dfb40f7b7ca1cbf29b2.php\",\"line\":72,\"class\":\"Twig\\\\Template\",\"method\":\"displayBlock\",\"args\":\"\\\"content\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":407,\"class\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/storage/runtime/compiled_templates/3d/3d41499a492e50f7450a0d008d7a0b5f2da77e1f640b86f2e9c91a2edc9262e8.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":407,\"class\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":392,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/TemplateWrapper.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"Twig\\\\TemplateWrapper\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Environment.php\",\"line\":318,\"class\":\"Twig\\\\TemplateWrapper\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/View.php\",\"line\":344,\"class\":\"Twig\\\\Environment\",\"method\":\"render\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/View.php\",\"line\":393,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Controller.php\",\"line\":243,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/controllers/TemplatesController.php\",\"line\":101,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/Controller.php\",\"line\":157,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Controller.php\",\"line\":187,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Application.php\",\"line\":299,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/web/Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Application.php\",\"line\":284,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/web/index.php\",\"line\":21,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]', '2019-11-25 05:23:24', '2019-11-25 05:23:24', 'b77a0f0c-b358-48bc-b8e7-624fdea6aa4d'),
(134, 'ElementQuery::getIterator()', '/Users/henrylawrence/personal/Craft-3.0.41/templates/home/_entry.twig:28', '2019-11-24 01:42:38', '/Users/henrylawrence/personal/Craft-3.0.41/templates/home/_entry.twig', 28, 'Looping through element queries directly has been deprecated. Use the all() function to fetch the query results before looping over them.', '[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/elements/db/ElementQuery.php\",\"line\":584,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\MatrixBlockQuery\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/storage/runtime/compiled_templates/3d/3d41499a492e50f7450a0d008d7a0b5f2da77e1f640b86f2e9c91a2edc9262e8.php\",\"line\":111,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":184,\"class\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"method\":\"block_content\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/storage/runtime/compiled_templates/c0/c0a7b674a2f6497e393d33b2a2ae5b45b53b55ee643d8dfb40f7b7ca1cbf29b2.php\",\"line\":61,\"class\":\"Twig\\\\Template\",\"method\":\"displayBlock\",\"args\":\"\\\"content\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":407,\"class\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/storage/runtime/compiled_templates/3d/3d41499a492e50f7450a0d008d7a0b5f2da77e1f640b86f2e9c91a2edc9262e8.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":407,\"class\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":392,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/TemplateWrapper.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"Twig\\\\TemplateWrapper\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Environment.php\",\"line\":318,\"class\":\"Twig\\\\TemplateWrapper\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/View.php\",\"line\":344,\"class\":\"Twig\\\\Environment\",\"method\":\"render\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/View.php\",\"line\":393,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Controller.php\",\"line\":243,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/controllers/TemplatesController.php\",\"line\":101,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/Controller.php\",\"line\":157,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Controller.php\",\"line\":187,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Application.php\",\"line\":299,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/web/Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Application.php\",\"line\":284,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/web/index.php\",\"line\":21,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]', '2019-11-24 01:42:38', '2019-11-24 01:42:38', 'cfa7eea6-7d86-441d-bdeb-f36d6387473d'),
(155, 'ElementQuery::getIterator()', '/Users/henrylawrence/personal/Craft-3.0.41/templates/home/_entry.twig:33', '2019-11-25 05:25:55', '/Users/henrylawrence/personal/Craft-3.0.41/templates/home/_entry.twig', 33, 'Looping through element queries directly has been deprecated. Use the all() function to fetch the query results before looping over them.', '[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/elements/db/ElementQuery.php\",\"line\":584,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\MatrixBlockQuery\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/storage/runtime/compiled_templates/3d/3d41499a492e50f7450a0d008d7a0b5f2da77e1f640b86f2e9c91a2edc9262e8.php\",\"line\":120,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":184,\"class\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"method\":\"block_content\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/storage/runtime/compiled_templates/c0/c0a7b674a2f6497e393d33b2a2ae5b45b53b55ee643d8dfb40f7b7ca1cbf29b2.php\",\"line\":72,\"class\":\"Twig\\\\Template\",\"method\":\"displayBlock\",\"args\":\"\\\"content\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":407,\"class\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/storage/runtime/compiled_templates/3d/3d41499a492e50f7450a0d008d7a0b5f2da77e1f640b86f2e9c91a2edc9262e8.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":407,\"class\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":392,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/TemplateWrapper.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"Twig\\\\TemplateWrapper\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Environment.php\",\"line\":318,\"class\":\"Twig\\\\TemplateWrapper\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/View.php\",\"line\":344,\"class\":\"Twig\\\\Environment\",\"method\":\"render\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/View.php\",\"line\":393,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Controller.php\",\"line\":243,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/controllers/TemplatesController.php\",\"line\":101,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/Controller.php\",\"line\":157,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Controller.php\",\"line\":187,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Application.php\",\"line\":299,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/web/Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Application.php\",\"line\":284,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/web/index.php\",\"line\":21,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]', '2019-11-25 05:25:55', '2019-11-25 05:25:55', 'a416c00f-430e-42bb-b89b-ad067e56242c');
INSERT INTO `deprecationerrors` (`id`, `key`, `fingerprint`, `lastOccurrence`, `file`, `line`, `message`, `traces`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(161, 'ElementQuery::getIterator()', '/Users/henrylawrence/personal/Craft-3.0.41/templates/order/_entry.twig:37', '2019-11-24 08:48:06', '/Users/henrylawrence/personal/Craft-3.0.41/templates/order/_entry.twig', 37, 'Looping through element queries directly has been deprecated. Use the all() function to fetch the query results before looping over them.', '[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/elements/db/ElementQuery.php\",\"line\":584,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\MatrixBlockQuery\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/storage/runtime/compiled_templates/72/72947ea7894b88ac9a157b209c6c4e447ec559111f3b60fbbecac67002e684be.php\",\"line\":97,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":\"__TwigTemplate_a0d64f0ea5d09e04c872c104044fc732b8ff5f372f94a9bb33f58935eb1d33ac\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":184,\"class\":\"__TwigTemplate_a0d64f0ea5d09e04c872c104044fc732b8ff5f372f94a9bb33f58935eb1d33ac\",\"method\":\"block_content\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_a0d64f0ea5d09e04c872c104044fc732b8ff5f372f94a9bb33f58935eb1d33ac, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/storage/runtime/compiled_templates/c0/c0a7b674a2f6497e393d33b2a2ae5b45b53b55ee643d8dfb40f7b7ca1cbf29b2.php\",\"line\":61,\"class\":\"Twig\\\\Template\",\"method\":\"displayBlock\",\"args\":\"\\\"content\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_a0d64f0ea5d09e04c872c104044fc732b8ff5f372f94a9bb33f58935eb1d33ac, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":407,\"class\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_a0d64f0ea5d09e04c872c104044fc732b8ff5f372f94a9bb33f58935eb1d33ac, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_a0d64f0ea5d09e04c872c104044fc732b8ff5f372f94a9bb33f58935eb1d33ac, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/storage/runtime/compiled_templates/72/72947ea7894b88ac9a157b209c6c4e447ec559111f3b60fbbecac67002e684be.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_a0d64f0ea5d09e04c872c104044fc732b8ff5f372f94a9bb33f58935eb1d33ac, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_a0d64f0ea5d09e04c872c104044fc732b8ff5f372f94a9bb33f58935eb1d33ac\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":407,\"class\":\"__TwigTemplate_a0d64f0ea5d09e04c872c104044fc732b8ff5f372f94a9bb33f58935eb1d33ac\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_a0d64f0ea5d09e04c872c104044fc732b8ff5f372f94a9bb33f58935eb1d33ac, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_a0d64f0ea5d09e04c872c104044fc732b8ff5f372f94a9bb33f58935eb1d33ac\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_a0d64f0ea5d09e04c872c104044fc732b8ff5f372f94a9bb33f58935eb1d33ac, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_a0d64f0ea5d09e04c872c104044fc732b8ff5f372f94a9bb33f58935eb1d33ac\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":392,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_a0d64f0ea5d09e04c872c104044fc732b8ff5f372f94a9bb33f58935eb1d33ac\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/TemplateWrapper.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"Twig\\\\TemplateWrapper\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Environment.php\",\"line\":318,\"class\":\"Twig\\\\TemplateWrapper\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/View.php\",\"line\":344,\"class\":\"Twig\\\\Environment\",\"method\":\"render\",\"args\":\"\\\"order/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/View.php\",\"line\":393,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"order/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Controller.php\",\"line\":243,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"order/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/controllers/TemplatesController.php\",\"line\":101,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"order/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"order/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"order/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/Controller.php\",\"line\":157,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"order/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"order\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Controller.php\",\"line\":187,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"order/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"order\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"order/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"order\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Application.php\",\"line\":299,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"order/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"order\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/web/Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"order/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"order\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Application.php\",\"line\":284,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/web/index.php\",\"line\":21,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]', '2019-11-24 08:48:06', '2019-11-24 08:48:06', '60440eff-f158-4c9d-889d-24fbbff70462'),
(167, 'ElementQuery::getIterator()', '/Users/henrylawrence/personal/Craft-3.0.41/templates/home/_entry.twig:34', '2019-11-25 05:34:51', '/Users/henrylawrence/personal/Craft-3.0.41/templates/home/_entry.twig', 34, 'Looping through element queries directly has been deprecated. Use the all() function to fetch the query results before looping over them.', '[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/elements/db/ElementQuery.php\",\"line\":584,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\MatrixBlockQuery\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/storage/runtime/compiled_templates/3d/3d41499a492e50f7450a0d008d7a0b5f2da77e1f640b86f2e9c91a2edc9262e8.php\",\"line\":122,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":184,\"class\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"method\":\"block_content\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/storage/runtime/compiled_templates/c0/c0a7b674a2f6497e393d33b2a2ae5b45b53b55ee643d8dfb40f7b7ca1cbf29b2.php\",\"line\":72,\"class\":\"Twig\\\\Template\",\"method\":\"displayBlock\",\"args\":\"\\\"content\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":407,\"class\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/storage/runtime/compiled_templates/3d/3d41499a492e50f7450a0d008d7a0b5f2da77e1f640b86f2e9c91a2edc9262e8.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":407,\"class\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":392,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/TemplateWrapper.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"Twig\\\\TemplateWrapper\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Environment.php\",\"line\":318,\"class\":\"Twig\\\\TemplateWrapper\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/View.php\",\"line\":344,\"class\":\"Twig\\\\Environment\",\"method\":\"render\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/View.php\",\"line\":393,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Controller.php\",\"line\":243,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/controllers/TemplatesController.php\",\"line\":101,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/Controller.php\",\"line\":157,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Controller.php\",\"line\":187,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Application.php\",\"line\":299,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/web/Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Application.php\",\"line\":284,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/web/index.php\",\"line\":21,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]', '2019-11-25 05:34:51', '2019-11-25 05:34:51', '9926ffdb-e478-4df2-a37c-afac6701cb5c'),
(173, 'craft.session.isLoggedIn()', '/Users/henrylawrence/personal/Craft-3.0.41/templates/home/_entry.twig:4', '2019-11-25 05:35:29', '/Users/henrylawrence/personal/Craft-3.0.41/templates/home/_entry.twig', 4, 'craft.session.isLoggedIn() has been deprecated. Use `not craft.app.user.isGuest` instead.', '[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/twig/variables/UserSession.php\",\"line\":32,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"craft.session.isLoggedIn()\\\", \\\"craft.session.isLoggedIn() has been deprecated. Use `not craft.a...\\\"\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\variables\\\\UserSession\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Extension/CoreExtension.php\",\"line\":1495,\"class\":\"craft\\\\web\\\\twig\\\\variables\\\\UserSession\",\"method\":\"isLoggedIn\",\"args\":null},{\"objectClass\":null,\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/helpers/Template.php\",\"line\":105,\"class\":null,\"method\":\"twig_get_attribute\",\"args\":\"craft\\\\web\\\\twig\\\\Environment, Twig\\\\Source, craft\\\\web\\\\twig\\\\variables\\\\UserSession, \\\"isLoggedIn\\\", ...\"},{\"objectClass\":null,\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/storage/runtime/compiled_templates/3d/3d41499a492e50f7450a0d008d7a0b5f2da77e1f640b86f2e9c91a2edc9262e8.php\",\"line\":59,\"class\":\"craft\\\\helpers\\\\Template\",\"method\":\"attribute\",\"args\":\"craft\\\\web\\\\twig\\\\Environment, Twig\\\\Source, craft\\\\web\\\\twig\\\\variables\\\\UserSession, \\\"isLoggedIn\\\", ...\"},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":184,\"class\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"method\":\"block_content\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/storage/runtime/compiled_templates/c0/c0a7b674a2f6497e393d33b2a2ae5b45b53b55ee643d8dfb40f7b7ca1cbf29b2.php\",\"line\":72,\"class\":\"Twig\\\\Template\",\"method\":\"displayBlock\",\"args\":\"\\\"content\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":407,\"class\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/storage/runtime/compiled_templates/3d/3d41499a492e50f7450a0d008d7a0b5f2da77e1f640b86f2e9c91a2edc9262e8.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":407,\"class\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":392,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/TemplateWrapper.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"Twig\\\\TemplateWrapper\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Environment.php\",\"line\":318,\"class\":\"Twig\\\\TemplateWrapper\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/View.php\",\"line\":344,\"class\":\"Twig\\\\Environment\",\"method\":\"render\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/View.php\",\"line\":393,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Controller.php\",\"line\":243,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/controllers/TemplatesController.php\",\"line\":101,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/Controller.php\",\"line\":157,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Controller.php\",\"line\":187,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Application.php\",\"line\":299,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/web/Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Application.php\",\"line\":284,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/web/index.php\",\"line\":21,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]', '2019-11-25 05:35:29', '2019-11-25 05:35:29', 'd93c3295-f393-4955-8565-4b9b66702285'),
(174, 'ElementQuery::getIterator()', '/Users/henrylawrence/personal/Craft-3.0.41/templates/home/_entry.twig:37', '2019-11-25 05:35:29', '/Users/henrylawrence/personal/Craft-3.0.41/templates/home/_entry.twig', 37, 'Looping through element queries directly has been deprecated. Use the all() function to fetch the query results before looping over them.', '[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/elements/db/ElementQuery.php\",\"line\":584,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\MatrixBlockQuery\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/storage/runtime/compiled_templates/3d/3d41499a492e50f7450a0d008d7a0b5f2da77e1f640b86f2e9c91a2edc9262e8.php\",\"line\":130,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":184,\"class\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"method\":\"block_content\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/storage/runtime/compiled_templates/c0/c0a7b674a2f6497e393d33b2a2ae5b45b53b55ee643d8dfb40f7b7ca1cbf29b2.php\",\"line\":72,\"class\":\"Twig\\\\Template\",\"method\":\"displayBlock\",\"args\":\"\\\"content\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":407,\"class\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/storage/runtime/compiled_templates/3d/3d41499a492e50f7450a0d008d7a0b5f2da77e1f640b86f2e9c91a2edc9262e8.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":407,\"class\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":392,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/TemplateWrapper.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"Twig\\\\TemplateWrapper\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Environment.php\",\"line\":318,\"class\":\"Twig\\\\TemplateWrapper\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/View.php\",\"line\":344,\"class\":\"Twig\\\\Environment\",\"method\":\"render\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/View.php\",\"line\":393,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Controller.php\",\"line\":243,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/controllers/TemplatesController.php\",\"line\":101,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/Controller.php\",\"line\":157,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Controller.php\",\"line\":187,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Application.php\",\"line\":299,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/web/Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Application.php\",\"line\":284,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/web/index.php\",\"line\":21,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]', '2019-11-25 05:35:29', '2019-11-25 05:35:29', '38c2affa-6512-4f5a-ac1b-3d2b314f418c');
INSERT INTO `deprecationerrors` (`id`, `key`, `fingerprint`, `lastOccurrence`, `file`, `line`, `message`, `traces`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(175, 'craft.session.isLoggedIn()', '/Users/henrylawrence/personal/Craft-3.0.41/templates/home/_entry.twig:3', '2019-11-27 10:30:34', '/Users/henrylawrence/personal/Craft-3.0.41/templates/home/_entry.twig', 3, 'craft.session.isLoggedIn() has been deprecated. Use `not craft.app.user.isGuest` instead.', '[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/twig/variables/UserSession.php\",\"line\":32,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"craft.session.isLoggedIn()\\\", \\\"craft.session.isLoggedIn() has been deprecated. Use `not craft.a...\\\"\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\variables\\\\UserSession\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Extension/CoreExtension.php\",\"line\":1495,\"class\":\"craft\\\\web\\\\twig\\\\variables\\\\UserSession\",\"method\":\"isLoggedIn\",\"args\":null},{\"objectClass\":null,\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/helpers/Template.php\",\"line\":105,\"class\":null,\"method\":\"twig_get_attribute\",\"args\":\"craft\\\\web\\\\twig\\\\Environment, Twig\\\\Source, craft\\\\web\\\\twig\\\\variables\\\\UserSession, \\\"isLoggedIn\\\", ...\"},{\"objectClass\":null,\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/storage/runtime/compiled_templates/3d/3d41499a492e50f7450a0d008d7a0b5f2da77e1f640b86f2e9c91a2edc9262e8.php\",\"line\":57,\"class\":\"craft\\\\helpers\\\\Template\",\"method\":\"attribute\",\"args\":\"craft\\\\web\\\\twig\\\\Environment, Twig\\\\Source, craft\\\\web\\\\twig\\\\variables\\\\UserSession, \\\"isLoggedIn\\\", ...\"},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":184,\"class\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"method\":\"block_content\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/storage/runtime/compiled_templates/c0/c0a7b674a2f6497e393d33b2a2ae5b45b53b55ee643d8dfb40f7b7ca1cbf29b2.php\",\"line\":72,\"class\":\"Twig\\\\Template\",\"method\":\"displayBlock\",\"args\":\"\\\"content\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":407,\"class\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/storage/runtime/compiled_templates/3d/3d41499a492e50f7450a0d008d7a0b5f2da77e1f640b86f2e9c91a2edc9262e8.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":407,\"class\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":392,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/TemplateWrapper.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"Twig\\\\TemplateWrapper\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Environment.php\",\"line\":318,\"class\":\"Twig\\\\TemplateWrapper\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/View.php\",\"line\":344,\"class\":\"Twig\\\\Environment\",\"method\":\"render\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/View.php\",\"line\":393,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Controller.php\",\"line\":243,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/controllers/TemplatesController.php\",\"line\":101,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/Controller.php\",\"line\":157,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Controller.php\",\"line\":187,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Application.php\",\"line\":299,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/web/Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Application.php\",\"line\":284,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/web/index.php\",\"line\":21,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]', '2019-11-27 10:30:34', '2019-11-27 10:30:34', '1fad7893-5649-498f-969c-4896e9451424'),
(176, 'ElementQuery::getIterator()', '/Users/henrylawrence/personal/Craft-3.0.41/templates/home/_entry.twig:36', '2019-11-27 10:30:34', '/Users/henrylawrence/personal/Craft-3.0.41/templates/home/_entry.twig', 36, 'Looping through element queries directly has been deprecated. Use the all() function to fetch the query results before looping over them.', '[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/elements/db/ElementQuery.php\",\"line\":584,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\MatrixBlockQuery\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/storage/runtime/compiled_templates/3d/3d41499a492e50f7450a0d008d7a0b5f2da77e1f640b86f2e9c91a2edc9262e8.php\",\"line\":128,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":184,\"class\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"method\":\"block_content\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/storage/runtime/compiled_templates/c0/c0a7b674a2f6497e393d33b2a2ae5b45b53b55ee643d8dfb40f7b7ca1cbf29b2.php\",\"line\":72,\"class\":\"Twig\\\\Template\",\"method\":\"displayBlock\",\"args\":\"\\\"content\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":407,\"class\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/storage/runtime/compiled_templates/3d/3d41499a492e50f7450a0d008d7a0b5f2da77e1f640b86f2e9c91a2edc9262e8.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":407,\"class\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":392,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_79a7013d2d617622c01092e19c39b4e72721cff4925a73fa2f70e7ebaf445523\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/TemplateWrapper.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"Twig\\\\TemplateWrapper\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Environment.php\",\"line\":318,\"class\":\"Twig\\\\TemplateWrapper\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/View.php\",\"line\":344,\"class\":\"Twig\\\\Environment\",\"method\":\"render\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/View.php\",\"line\":393,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Controller.php\",\"line\":243,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/controllers/TemplatesController.php\",\"line\":101,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"home/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/Controller.php\",\"line\":157,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Controller.php\",\"line\":187,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Application.php\",\"line\":299,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/web/Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"home/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Application.php\",\"line\":284,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/web/index.php\",\"line\":21,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]', '2019-11-27 10:30:34', '2019-11-27 10:30:34', '80adf52c-b7e8-4885-a9ec-183d45e1f017'),
(179, 'ElementQuery::getIterator()', '/Users/henrylawrence/personal/Craft-3.0.41/templates/order/_entry.twig:39', '2019-11-27 10:31:32', '/Users/henrylawrence/personal/Craft-3.0.41/templates/order/_entry.twig', 39, 'Looping through element queries directly has been deprecated. Use the all() function to fetch the query results before looping over them.', '[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/elements/db/ElementQuery.php\",\"line\":584,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\MatrixBlockQuery\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/storage/runtime/compiled_templates/72/72947ea7894b88ac9a157b209c6c4e447ec559111f3b60fbbecac67002e684be.php\",\"line\":99,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":\"__TwigTemplate_a0d64f0ea5d09e04c872c104044fc732b8ff5f372f94a9bb33f58935eb1d33ac\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":184,\"class\":\"__TwigTemplate_a0d64f0ea5d09e04c872c104044fc732b8ff5f372f94a9bb33f58935eb1d33ac\",\"method\":\"block_content\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_a0d64f0ea5d09e04c872c104044fc732b8ff5f372f94a9bb33f58935eb1d33ac, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/storage/runtime/compiled_templates/c0/c0a7b674a2f6497e393d33b2a2ae5b45b53b55ee643d8dfb40f7b7ca1cbf29b2.php\",\"line\":72,\"class\":\"Twig\\\\Template\",\"method\":\"displayBlock\",\"args\":\"\\\"content\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_a0d64f0ea5d09e04c872c104044fc732b8ff5f372f94a9bb33f58935eb1d33ac, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":407,\"class\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_a0d64f0ea5d09e04c872c104044fc732b8ff5f372f94a9bb33f58935eb1d33ac, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_a0d64f0ea5d09e04c872c104044fc732b8ff5f372f94a9bb33f58935eb1d33ac, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_75f6864e7fd90f09a001323040069d81e2de6b037a64505b4f6a8001357fa1e7\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/storage/runtime/compiled_templates/72/72947ea7894b88ac9a157b209c6c4e447ec559111f3b60fbbecac67002e684be.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_a0d64f0ea5d09e04c872c104044fc732b8ff5f372f94a9bb33f58935eb1d33ac, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_a0d64f0ea5d09e04c872c104044fc732b8ff5f372f94a9bb33f58935eb1d33ac\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":407,\"class\":\"__TwigTemplate_a0d64f0ea5d09e04c872c104044fc732b8ff5f372f94a9bb33f58935eb1d33ac\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_a0d64f0ea5d09e04c872c104044fc732b8ff5f372f94a9bb33f58935eb1d33ac, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_a0d64f0ea5d09e04c872c104044fc732b8ff5f372f94a9bb33f58935eb1d33ac\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":380,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"content\\\" => [__TwigTemplate_a0d64f0ea5d09e04c872c104044fc732b8ff5f372f94a9bb33f58935eb1d33ac, \\\"block_content\\\"]]\"},{\"objectClass\":\"__TwigTemplate_a0d64f0ea5d09e04c872c104044fc732b8ff5f372f94a9bb33f58935eb1d33ac\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Template.php\",\"line\":392,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_a0d64f0ea5d09e04c872c104044fc732b8ff5f372f94a9bb33f58935eb1d33ac\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/TemplateWrapper.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"Twig\\\\TemplateWrapper\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/twig/twig/src/Environment.php\",\"line\":318,\"class\":\"Twig\\\\TemplateWrapper\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/View.php\",\"line\":344,\"class\":\"Twig\\\\Environment\",\"method\":\"render\",\"args\":\"\\\"order/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/View.php\",\"line\":393,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"order/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Controller.php\",\"line\":243,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"order/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/controllers/TemplatesController.php\",\"line\":101,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"order/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"order/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"order/_entry\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/Controller.php\",\"line\":157,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"order/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"order\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Controller.php\",\"line\":187,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"order/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"order\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/Module.php\",\"line\":528,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"order/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"order\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Application.php\",\"line\":299,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"order/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"order\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/web/Application.php\",\"line\":103,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"order/_entry\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"order\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/craftcms/cms/src/web/Application.php\",\"line\":284,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/vendor/yiisoft/yii2/base/Application.php\",\"line\":386,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Users/henrylawrence/personal/Craft-3.0.41/web/index.php\",\"line\":21,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]', '2019-11-27 10:31:32', '2019-11-27 10:31:32', '60063a8e-c162-4667-91af-911a6224e71a');

-- --------------------------------------------------------

--
-- Table structure for table `drafts`
--

CREATE TABLE `drafts` (
  `id` int(11) NOT NULL,
  `sourceId` int(11) DEFAULT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `notes` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `drafts`
--

INSERT INTO `drafts` (`id`, `sourceId`, `creatorId`, `name`, `notes`) VALUES
(1, NULL, 1, 'First draft', ''),
(3, NULL, 1, 'First draft', NULL),
(8, NULL, 1, 'First draft', NULL),
(11, NULL, 1, 'First draft', NULL),
(14, NULL, 1, 'First draft', NULL),
(15, NULL, 1, 'First draft', ''),
(17, NULL, 1, 'First draft', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `elementindexsettings`
--

CREATE TABLE `elementindexsettings` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `elements`
--

CREATE TABLE `elements` (
  `id` int(11) NOT NULL,
  `draftId` int(11) DEFAULT NULL,
  `revisionId` int(11) DEFAULT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `elements`
--

INSERT INTO `elements` (`id`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, NULL, NULL, NULL, 'craft\\elements\\User', 1, 0, '2019-11-17 03:11:01', '2019-11-17 03:11:01', NULL, '0d8e884e-9a5c-4ec7-b3fd-d9f8b1fd3084'),
(2, NULL, NULL, 1, 'craft\\elements\\Entry', 1, 0, '2019-11-17 03:13:40', '2019-11-23 06:13:03', NULL, '7e2370a1-ddcf-4054-ace6-a33fbc894bac'),
(3, NULL, NULL, 2, 'craft\\elements\\Entry', 1, 0, '2019-11-17 03:13:53', '2019-11-20 10:33:17', NULL, '93c724f1-089e-4c90-8b71-badf77829588'),
(4, NULL, NULL, 3, 'craft\\elements\\Entry', 1, 0, '2019-11-17 03:14:44', '2019-11-23 06:22:34', NULL, '714dd698-8f6b-45a8-8eda-56d101a62c86'),
(5, NULL, NULL, 4, 'craft\\elements\\Entry', 1, 0, '2019-11-17 03:22:44', '2019-11-23 01:16:38', NULL, 'b5dff227-7914-4097-951c-63fd4e1b30c6'),
(7, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-17 05:06:24', '2019-11-23 06:22:34', NULL, 'a9546d21-f8eb-4c59-8f00-cb348094b246'),
(8, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-17 05:28:35', '2019-11-23 06:22:34', NULL, 'be553b65-96ab-47e1-a07e-5353fb6a5059'),
(9, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-17 05:34:08', '2019-11-23 05:51:27', '2019-11-23 05:55:49', 'f5d194da-a3fe-4b0b-ad99-c0273e572a0a'),
(10, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-17 05:35:01', '2019-11-23 06:13:03', NULL, '9bb2ea1d-b3c0-48ef-80f0-3a8a4897ea57'),
(11, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-17 05:35:16', '2019-11-23 05:51:27', '2019-11-23 05:55:49', '78f04407-541b-4910-b8c9-2c22e12d7f2d'),
(12, NULL, 1, 1, 'craft\\elements\\Entry', 1, 0, '2019-11-17 05:35:16', '2019-11-20 10:20:47', NULL, '1e40710c-a668-45c8-902d-11722fcbc5b9'),
(13, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-20 10:20:47', '2019-11-20 10:20:47', NULL, 'a4a5ce10-1722-49a8-a573-95b8c6c3282c'),
(14, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-20 10:20:47', '2019-11-20 10:20:47', NULL, 'a46d2c60-538f-4027-b740-4b133c374d99'),
(15, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-20 10:20:47', '2019-11-20 10:20:47', NULL, 'e7a3d50e-aeb6-4d45-ae75-5684621f89b5'),
(16, NULL, 2, 1, 'craft\\elements\\Entry', 1, 0, '2019-11-17 05:35:01', '2019-11-20 10:20:47', NULL, '5d45248a-2aaa-4494-a812-b9987cc6a5e4'),
(17, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-20 10:20:47', '2019-11-20 10:20:47', NULL, '31924e03-348f-4789-8c81-3e674b8ed62b'),
(18, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-20 10:20:47', '2019-11-20 10:20:47', NULL, '196ad981-efe6-4a57-85c5-4004fe812083'),
(19, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-20 10:20:47', '2019-11-17 05:35:16', '2019-11-20 10:20:47', '656dd62f-c5a8-4bc9-a8e9-e5e58efcf911'),
(20, NULL, 3, 1, 'craft\\elements\\Entry', 1, 0, '2019-11-17 05:34:08', '2019-11-20 10:20:47', NULL, '905d8506-0da9-44ec-8041-552374e23b0d'),
(21, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-20 10:20:47', '2019-11-17 05:35:16', '2019-11-20 10:20:47', 'ac60e164-af48-4612-b4f6-94580be39a9f'),
(22, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-20 10:20:47', '2019-11-20 10:20:47', NULL, '49cef3b3-50dd-4048-8038-2957c6fd4c0f'),
(23, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-20 10:20:47', '2019-11-17 05:35:16', '2019-11-20 10:20:47', 'd4096836-9008-404b-a1c0-3e8f11ad38ae'),
(24, NULL, 4, 1, 'craft\\elements\\Entry', 1, 0, '2019-11-17 05:34:08', '2019-11-20 10:20:47', NULL, '2c2c6110-f6b6-43ec-b23f-0c409299870f'),
(25, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-20 10:20:47', '2019-11-17 05:35:16', '2019-11-20 10:20:47', 'a7ee3e77-e364-4c36-a194-2e1f6db8acbd'),
(26, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-20 10:20:47', '2019-11-17 05:35:16', '2019-11-20 10:20:47', 'c234e430-f39e-4674-999b-8092e3eb0828'),
(27, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-20 10:20:47', '2019-11-17 05:35:16', '2019-11-20 10:20:47', '5a4e8fb6-978a-4636-9372-79e7e2f4ebdc'),
(28, NULL, 5, 3, 'craft\\elements\\Entry', 1, 0, '2019-11-17 05:29:12', '2019-11-20 10:20:48', NULL, 'd439b6af-a90b-4752-b0c4-8720475c2fbe'),
(29, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-20 10:20:47', '2019-11-20 10:20:48', NULL, '27a888a8-a689-476a-b009-8974aa1e599c'),
(30, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-20 10:20:47', '2019-11-20 10:20:48', NULL, 'fa67f102-ed0c-4368-8fed-8a109e5a0f14'),
(31, NULL, 6, 3, 'craft\\elements\\Entry', 1, 0, '2019-11-17 05:28:35', '2019-11-20 10:20:48', NULL, 'a7f2725a-b863-4059-a410-51425b8deed1'),
(32, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-20 10:20:48', '2019-11-20 10:20:48', NULL, '5739a691-28aa-4f5c-aa4c-bdbb910262a7'),
(33, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-20 10:20:48', '2019-11-20 10:20:48', NULL, 'f0b75f3b-0bec-41ce-824f-eb4a48bf2306'),
(34, NULL, 7, 3, 'craft\\elements\\Entry', 1, 0, '2019-11-17 05:28:00', '2019-11-20 10:20:48', NULL, '65c857a7-e728-44f9-ae1f-5e2b4d1f6db6'),
(35, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-20 10:20:48', '2019-11-20 10:20:48', NULL, 'ad02bd55-54cd-42d4-8c4b-c8c26afecd23'),
(36, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-20 10:20:48', '2019-11-17 05:29:12', '2019-11-20 10:20:48', '37e6fba6-27d7-45c6-adb8-98de5aec1967'),
(37, NULL, 8, 3, 'craft\\elements\\Entry', 1, 0, '2019-11-17 05:27:02', '2019-11-20 10:20:48', NULL, 'c2b354ea-4afb-418c-a815-a00626148cb6'),
(38, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-20 10:20:48', '2019-11-20 10:20:48', NULL, 'e859fc81-6d8b-4dfd-9735-deed9c5ef82d'),
(39, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-20 10:20:48', '2019-11-17 05:29:12', '2019-11-20 10:20:48', '8ff58795-0692-4e51-8f90-af14fd72e225'),
(40, NULL, 9, 3, 'craft\\elements\\Entry', 1, 0, '2019-11-17 05:25:50', '2019-11-20 10:20:48', NULL, 'fa24fcc4-2a2c-4e7c-b7e4-101e8fe8fcff'),
(41, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-20 10:20:48', '2019-11-20 10:20:48', NULL, 'f96a140b-4c04-4376-8e6d-4bd7b8fd9294'),
(42, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-20 10:20:48', '2019-11-17 05:29:12', '2019-11-20 10:20:48', 'a646fe56-1268-4f11-8172-fea4a9314e01'),
(43, NULL, 10, 3, 'craft\\elements\\Entry', 1, 0, '2019-11-17 05:24:33', '2019-11-20 10:20:48', NULL, 'cb040256-8ce8-4206-9bbf-2ec9028b9b27'),
(44, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-20 10:20:48', '2019-11-20 10:20:48', NULL, '29535343-f339-446f-a773-d4f1d597f2ab'),
(45, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-20 10:20:48', '2019-11-17 05:29:12', '2019-11-20 10:20:48', 'a8ac487d-eb94-460d-a397-27cb891b4bce'),
(46, NULL, 11, 3, 'craft\\elements\\Entry', 1, 0, '2019-11-17 05:24:24', '2019-11-20 10:20:48', NULL, 'f7f609b9-b332-46eb-8e2b-560ee1093f6b'),
(47, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-20 10:20:48', '2019-11-20 10:20:48', NULL, 'd50d53fa-80b9-42aa-82d9-56d7a12b945c'),
(48, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-20 10:20:48', '2019-11-17 05:29:12', '2019-11-20 10:20:48', '8135878f-2f06-42a7-914f-8fd691f64602'),
(49, NULL, 12, 3, 'craft\\elements\\Entry', 1, 0, '2019-11-17 05:22:29', '2019-11-20 10:20:48', NULL, '54f858d4-b9d2-4d3f-9425-8aeb091dce7a'),
(50, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-20 10:20:48', '2019-11-20 10:20:48', NULL, 'f5c5b238-b531-489f-953a-ca951229de10'),
(51, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-20 10:20:48', '2019-11-17 05:29:12', '2019-11-20 10:20:48', 'f01655d5-02f0-4f8e-a84a-221372cd8cf8'),
(52, NULL, 13, 3, 'craft\\elements\\Entry', 1, 0, '2019-11-17 05:14:14', '2019-11-20 10:20:48', NULL, 'a6611639-ecff-491b-88df-ce3d7968d5c9'),
(53, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-20 10:20:48', '2019-11-20 10:20:48', NULL, 'aeeb66c7-0984-40b1-ad2e-cf61ab4f1a7f'),
(54, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-20 10:20:48', '2019-11-17 05:29:12', '2019-11-20 10:20:48', 'a5083a8a-2f81-4d23-8a50-08afc226217a'),
(55, NULL, 14, 3, 'craft\\elements\\Entry', 1, 0, '2019-11-17 05:09:55', '2019-11-20 10:20:48', NULL, 'a4faab7d-e9fd-41dc-8b28-1b0d275990bc'),
(56, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-20 10:20:48', '2019-11-20 10:20:48', NULL, '53f17ca3-9808-47bc-aea6-0f1107884540'),
(57, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-20 10:20:48', '2019-11-17 05:29:12', '2019-11-20 10:20:48', '9f286198-61ec-4b33-af36-1f67be281a1a'),
(58, NULL, 15, 3, 'craft\\elements\\Entry', 1, 0, '2019-11-17 05:09:45', '2019-11-20 10:20:48', NULL, 'af7e638f-cee0-47bb-82d8-227b914c4ce1'),
(59, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-20 10:20:48', '2019-11-20 10:20:48', NULL, 'd8ba7003-75c9-4fc9-8678-0092c3cfed20'),
(60, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-20 10:20:48', '2019-11-17 05:29:12', '2019-11-20 10:20:48', 'be6faf8f-8cea-4e44-8a50-6bcf75463351'),
(61, NULL, 16, 3, 'craft\\elements\\Entry', 1, 0, '2019-11-17 05:09:10', '2019-11-20 10:20:48', NULL, 'cba113f5-448a-418f-86e8-1938d432dd82'),
(62, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-20 10:20:48', '2019-11-20 10:20:48', NULL, '921d1d59-d861-46d5-9f82-0749ad83cd88'),
(63, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-20 10:20:48', '2019-11-17 05:29:12', '2019-11-20 10:20:48', '0faea680-4474-465e-8373-ac47f55d0085'),
(64, NULL, 17, 3, 'craft\\elements\\Entry', 1, 0, '2019-11-17 05:07:44', '2019-11-20 10:20:48', NULL, '627eb3f1-a0a7-41c7-ae61-6ee4db2ec13e'),
(65, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-20 10:20:48', '2019-11-20 10:20:48', NULL, '549dc40f-8a05-48af-a15b-996c22471f87'),
(66, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-20 10:20:48', '2019-11-17 05:29:12', '2019-11-20 10:20:48', '4a1074ed-8ee5-424a-8e63-5c5eebe1f5e4'),
(67, NULL, 18, 3, 'craft\\elements\\Entry', 1, 0, '2019-11-17 05:06:24', '2019-11-20 10:20:48', NULL, '8589ff23-95c6-4696-b3d8-1e3d0cd70763'),
(68, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-20 10:20:48', '2019-11-20 10:20:48', NULL, 'bf1c7446-34a9-473d-83a4-bf49b36f2339'),
(69, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-20 10:20:48', '2019-11-17 05:29:12', '2019-11-20 10:20:48', 'd22eb2f6-113f-4201-9cc0-0f29002fcd62'),
(70, NULL, 19, 3, 'craft\\elements\\Entry', 1, 0, '2019-11-17 05:06:24', '2019-11-20 10:20:48', NULL, '722ad699-9225-41ca-bcbb-f450660ee03e'),
(71, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-20 10:20:48', '2019-11-17 05:29:12', '2019-11-20 10:20:48', '7df9ca98-c7bf-41ab-8901-35e67596f2e4'),
(72, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-20 10:20:48', '2019-11-17 05:29:12', '2019-11-20 10:20:48', 'f7c7f384-b9c9-41c6-b475-3984c07ce9fa'),
(73, NULL, 20, 4, 'craft\\elements\\Entry', 1, 0, '2019-11-17 03:22:44', '2019-11-20 10:20:48', NULL, '2db9b1dd-b20c-4da5-9fe3-914d613dea43'),
(74, NULL, 21, 3, 'craft\\elements\\Entry', 1, 0, '2019-11-20 10:31:28', '2019-11-20 10:31:28', NULL, '9a996c49-8e69-48d5-9f12-598ddaa91088'),
(75, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-20 10:31:28', '2019-11-20 10:31:28', NULL, '013ad1d1-4cad-47d6-acb2-b209070083b4'),
(76, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-20 10:31:28', '2019-11-20 10:31:28', NULL, 'f1562dea-0da3-44a5-8e19-4a1b4c0947dd'),
(77, NULL, 22, 2, 'craft\\elements\\Entry', 1, 0, '2019-11-17 03:13:53', '2019-11-17 03:13:53', NULL, 'da24a061-8c2d-4cae-a1d0-70400f58b5f7'),
(78, NULL, 23, 2, 'craft\\elements\\Entry', 1, 0, '2019-11-20 10:33:17', '2019-11-20 10:33:17', NULL, '8fc6b2d8-595f-42aa-9911-ac11ec85e21b'),
(79, NULL, 24, 1, 'craft\\elements\\Entry', 1, 0, '2019-11-20 10:33:23', '2019-11-20 10:33:23', NULL, 'd1a23f22-84b7-47cd-ba96-1d3498158972'),
(80, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-20 10:33:23', '2019-11-20 10:33:23', NULL, '524c6de9-94a6-47f7-a049-a3b2133471da'),
(81, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-20 10:33:23', '2019-11-20 10:33:23', NULL, 'bd92f819-d0dc-4a1c-8522-d26d5b3370bb'),
(82, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-20 10:33:23', '2019-11-20 10:33:23', NULL, '4723f5da-f500-4cac-a5a9-043c47c733a1'),
(83, NULL, 25, 3, 'craft\\elements\\Entry', 1, 0, '2019-11-20 10:35:01', '2019-11-20 10:35:01', NULL, 'd3100a13-efa2-4f00-998e-0065e9efaaab'),
(84, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-20 10:35:01', '2019-11-20 10:35:01', NULL, 'dedb47cc-4545-49e2-8b33-334b73604d13'),
(85, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-20 10:35:01', '2019-11-20 10:35:01', NULL, '8e4a3087-6c5b-498c-a8d2-47e7104e48ef'),
(86, NULL, 26, 4, 'craft\\elements\\Entry', 1, 0, '2019-11-20 10:49:15', '2019-11-20 10:49:15', NULL, 'ceb9dabb-80e1-4a99-a462-fcd5cb869107'),
(87, NULL, 27, 4, 'craft\\elements\\Entry', 1, 0, '2019-11-20 10:50:37', '2019-11-20 10:50:37', NULL, '8da8cda6-6667-4cae-858a-f53f9c8ce906'),
(88, NULL, 28, 4, 'craft\\elements\\Entry', 1, 0, '2019-11-23 00:51:49', '2019-11-23 00:51:49', NULL, '6d5dddcb-e806-4837-8a50-0edd56061be3'),
(89, NULL, 29, 4, 'craft\\elements\\Entry', 1, 0, '2019-11-23 00:54:31', '2019-11-23 00:54:31', NULL, '435c09b4-45e7-4804-bfdd-b0d0324748a7'),
(90, NULL, 30, 1, 'craft\\elements\\Entry', 1, 0, '2019-11-23 00:54:46', '2019-11-23 00:54:46', NULL, 'e4421060-1db7-4934-852b-413d8bb72fa0'),
(91, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 00:54:46', '2019-11-23 00:54:46', NULL, 'a263619a-5e4d-4e10-a0d8-9fde0aafd70b'),
(92, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 00:54:46', '2019-11-23 00:54:46', NULL, '07505729-b2a3-423a-a309-31b8c239161b'),
(93, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 00:54:46', '2019-11-23 00:54:46', NULL, 'b4a94c87-0777-43a2-9dea-d319ea6822e8'),
(94, NULL, 31, 1, 'craft\\elements\\Entry', 1, 0, '2019-11-23 01:10:56', '2019-11-23 01:10:56', NULL, '11434041-282f-4a11-8066-7d08339b138d'),
(95, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 01:10:56', '2019-11-23 01:10:56', NULL, '54ae6d4e-8dd4-49a5-ac8e-0f0bdf82a2ae'),
(96, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 01:10:56', '2019-11-23 01:10:56', NULL, 'ed11d802-4a2a-4495-9780-66e66b7aa727'),
(97, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 01:10:56', '2019-11-23 01:10:56', NULL, '7c63f147-8138-498f-8eed-46dad4e5cfd6'),
(98, NULL, 32, 4, 'craft\\elements\\Entry', 1, 0, '2019-11-23 01:16:07', '2019-11-23 01:16:07', NULL, '950923af-fa93-48aa-9b15-68ef0d37acdb'),
(99, NULL, 33, 4, 'craft\\elements\\Entry', 1, 0, '2019-11-23 01:16:38', '2019-11-23 01:16:38', NULL, 'ec0e07c2-149b-4a42-8b1e-e84237ae8b8f'),
(102, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 01:21:42', '2019-11-23 05:51:27', '2019-11-23 05:55:49', '64790d0a-1b56-431b-b6d6-b9cad4448e85'),
(103, NULL, 35, 1, 'craft\\elements\\Entry', 1, 0, '2019-11-23 01:21:42', '2019-11-23 01:21:42', NULL, '6ede35ad-a68a-446e-9f75-e33b5d323952'),
(104, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 01:21:43', '2019-11-23 01:21:42', NULL, '440882d3-c601-4259-a770-7281fbca5c1c'),
(105, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 01:21:43', '2019-11-23 01:21:42', NULL, '3e978a04-e9d9-4f47-97ec-ed773e0d87b1'),
(106, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 01:21:43', '2019-11-23 01:21:42', NULL, '0bb7da4b-73e8-44e8-9e26-0bc6b298dba7'),
(107, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 01:21:43', '2019-11-23 01:21:42', NULL, '830b0f19-a555-48d4-b4fb-3657f9409b28'),
(109, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 01:25:17', '2019-11-23 05:51:27', '2019-11-23 05:55:49', '4493c49d-d77d-4347-afb0-d295cfff62eb'),
(110, NULL, 36, 1, 'craft\\elements\\Entry', 1, 0, '2019-11-23 01:25:17', '2019-11-23 01:25:17', NULL, '9807cd4a-a06b-4428-bf19-d55df873e50d'),
(111, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 01:25:17', '2019-11-23 01:25:17', NULL, '6f1a94f8-0ce4-4bf3-bbb1-26cb9b857985'),
(112, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 01:25:17', '2019-11-23 01:25:17', NULL, '984e2313-bcdd-4375-b4ae-1a53913a17f2'),
(113, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 01:25:17', '2019-11-23 01:25:17', NULL, 'd21943ea-bf46-4eaf-84fe-57130511e27b'),
(114, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 01:25:17', '2019-11-23 01:25:17', NULL, '0a20d1a4-b76d-42f9-8085-78d4e5ce6b72'),
(115, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 01:25:17', '2019-11-23 01:25:17', NULL, '8268a34a-34f8-4813-9840-bb601db60e3f'),
(116, 1, NULL, 8, 'craft\\elements\\Entry', 1, 0, '2019-11-23 01:32:29', '2019-11-23 01:32:38', NULL, '048655ce-f32d-4acb-afb2-97127bc2414d'),
(118, NULL, NULL, 8, 'craft\\elements\\Entry', 1, 0, '2019-11-23 01:36:10', '2019-11-23 01:36:10', NULL, 'c652897d-36e6-4814-af0b-89374f144ca8'),
(119, NULL, 37, 8, 'craft\\elements\\Entry', 1, 0, '2019-11-23 01:36:10', '2019-11-23 01:36:10', NULL, 'b9360cdf-5f7d-440f-80a2-cf923e6a7d7e'),
(121, NULL, NULL, 8, 'craft\\elements\\Entry', 1, 0, '2019-11-23 01:37:36', '2019-11-23 01:37:36', NULL, '02f32cf5-d42c-48e2-8d32-ac98cf9e6301'),
(122, NULL, 38, 8, 'craft\\elements\\Entry', 1, 0, '2019-11-23 01:37:36', '2019-11-23 01:37:36', NULL, 'c3db177c-b889-4c97-8962-6b4d58f5961e'),
(124, NULL, NULL, 8, 'craft\\elements\\Entry', 1, 0, '2019-11-23 01:38:40', '2019-11-23 01:38:40', NULL, '85c4f8f3-7421-4b09-904d-b9c0029e9b45'),
(125, NULL, 39, 8, 'craft\\elements\\Entry', 1, 0, '2019-11-23 01:38:40', '2019-11-23 01:38:40', NULL, '6c6edb6a-9c6e-4e2d-9a4e-12b4b21a45fd'),
(126, NULL, 40, 1, 'craft\\elements\\Entry', 1, 0, '2019-11-23 01:39:52', '2019-11-23 01:39:52', NULL, 'e3534acc-cf70-4a55-aa18-5828cee37470'),
(127, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 01:39:52', '2019-11-23 01:39:52', NULL, '3071dd1f-9e4a-435c-a707-85fe523674c7'),
(128, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 01:39:52', '2019-11-23 01:39:52', NULL, 'fc9b517f-c9f1-4e64-a164-bfac3c9c5fa8'),
(129, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 01:39:52', '2019-11-23 01:39:52', NULL, '41f3f073-8091-4576-b3e9-010daa82dabe'),
(130, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 01:39:52', '2019-11-23 01:39:52', NULL, 'c85f9dd7-496d-40f3-ad48-c25b72a0a2af'),
(131, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 01:39:52', '2019-11-23 01:39:52', NULL, '9e8711cf-283b-46af-b4a3-4a9de5b6ee26'),
(133, NULL, NULL, 8, 'craft\\elements\\Entry', 1, 0, '2019-11-23 01:41:35', '2019-11-23 05:17:18', NULL, '39cd226b-daf1-4ba9-b8c0-18a795fcaf22'),
(134, NULL, 41, 8, 'craft\\elements\\Entry', 1, 0, '2019-11-23 01:41:35', '2019-11-23 01:41:35', NULL, '9f8b1ff1-b0e2-40ce-8b86-c5c18a7c9ab5'),
(135, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 01:41:52', '2019-11-23 05:51:27', '2019-11-23 05:55:49', '3f4dc1e3-7ca6-4e9c-b7ab-6be47fa1ffca'),
(136, NULL, 42, 1, 'craft\\elements\\Entry', 1, 0, '2019-11-23 01:41:52', '2019-11-23 01:41:52', NULL, 'c09c9384-1de7-4adf-bdbd-609af7b64a4d'),
(137, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 01:41:52', '2019-11-23 01:41:52', NULL, 'fd53a839-cd08-40df-bcd9-a0899d4870b2'),
(138, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 01:41:52', '2019-11-23 01:41:52', NULL, '37c5ed23-d1a4-47e6-9e58-c01796cd07bc'),
(139, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 01:41:52', '2019-11-23 01:41:52', NULL, '2c2a4045-7984-45a5-8c6b-d1f0300ebc37'),
(140, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 01:41:52', '2019-11-23 01:41:52', NULL, '0d522131-1df1-4601-ad13-f85be89e3e76'),
(141, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 01:41:52', '2019-11-23 01:41:52', NULL, '2abb805f-e368-49a2-8b07-d94962fdb715'),
(142, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 01:41:52', '2019-11-23 01:41:52', NULL, '5578011a-3c7e-4bea-a4a8-08f6eb53091e'),
(144, NULL, NULL, 8, 'craft\\elements\\Entry', 1, 0, '2019-11-23 01:48:17', '2019-11-23 01:48:17', NULL, 'bc84a754-78a1-4971-9b09-5d84d5b7b773'),
(145, NULL, 43, 8, 'craft\\elements\\Entry', 1, 0, '2019-11-23 01:48:17', '2019-11-23 01:48:17', NULL, '3ed24edc-a4ed-42e9-84d8-638d9259e332'),
(147, NULL, NULL, 8, 'craft\\elements\\Entry', 1, 0, '2019-11-23 01:49:08', '2019-11-23 01:49:08', NULL, '43086236-2f9b-4a1f-abf9-b803c7b232d7'),
(148, NULL, 44, 8, 'craft\\elements\\Entry', 1, 0, '2019-11-23 01:49:08', '2019-11-23 01:49:08', NULL, '011c7b8f-fd98-4f24-8566-e61237c29350'),
(149, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 01:49:57', '2019-11-23 05:51:27', '2019-11-23 05:55:49', '15c4aa04-055f-4317-b4b1-1f4a8d831008'),
(150, NULL, 45, 1, 'craft\\elements\\Entry', 1, 0, '2019-11-23 01:49:57', '2019-11-23 01:49:57', NULL, 'a3a4b3ca-8394-40c0-b247-cbe7e77074fe'),
(151, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 01:49:57', '2019-11-23 01:49:57', NULL, '2961f5cd-f6d8-4c77-9b04-29ef04f6fb15'),
(152, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 01:49:57', '2019-11-23 01:49:57', NULL, 'ae8aebb5-337f-4f5c-b710-f9b6dea17629'),
(153, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 01:49:57', '2019-11-23 01:49:57', NULL, 'c1f86c8e-f761-4523-ae9a-d9ce32875e34'),
(154, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 01:49:57', '2019-11-23 01:49:57', NULL, '28136029-a7f6-466d-ad87-a77779e331a4'),
(155, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 01:49:57', '2019-11-23 01:49:57', NULL, 'c286a5d1-d8f9-4b6b-8607-422788a1ed52'),
(156, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 01:49:57', '2019-11-23 01:49:57', NULL, '68227deb-273c-4bf6-bc6b-de3e1dcbbb75'),
(157, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 01:49:57', '2019-11-23 01:49:57', NULL, 'e8260959-bf49-4b14-a3ea-2e85fae25a78'),
(159, NULL, NULL, 8, 'craft\\elements\\Entry', 1, 0, '2019-11-23 02:04:27', '2019-11-23 05:57:28', NULL, '671d4e98-225c-4b1d-acbc-866e3db34af3'),
(160, NULL, 46, 8, 'craft\\elements\\Entry', 1, 0, '2019-11-23 02:04:27', '2019-11-23 02:04:27', NULL, 'aa180b17-04d0-42a1-8a14-074effbaa6a0'),
(161, 3, NULL, 8, 'craft\\elements\\Entry', 1, 0, '2019-11-23 02:09:39', '2019-11-23 02:09:39', NULL, 'dffbde97-d7f3-40a0-9295-0e53cb1ad4e1'),
(163, NULL, NULL, 8, 'craft\\elements\\Entry', 1, 0, '2019-11-23 02:09:50', '2019-11-23 02:09:50', NULL, '412000aa-ae0b-4c74-a762-2c214aa7fd48'),
(164, NULL, 47, 8, 'craft\\elements\\Entry', 1, 0, '2019-11-23 02:09:50', '2019-11-23 02:09:50', NULL, '182367fc-2366-4abe-b98f-8e46e9dd0380'),
(166, NULL, NULL, 8, 'craft\\elements\\Entry', 1, 0, '2019-11-23 02:12:05', '2019-11-23 02:12:05', NULL, 'b9c85af1-822c-4db2-a392-717508b7f1eb'),
(167, NULL, 48, 8, 'craft\\elements\\Entry', 1, 0, '2019-11-23 02:12:05', '2019-11-23 02:12:05', NULL, 'e9001a3f-4668-4e1f-800a-b031e71ad04a'),
(169, NULL, NULL, 8, 'craft\\elements\\Entry', 1, 0, '2019-11-23 02:13:51', '2019-11-23 02:13:51', NULL, 'ba42c661-5bed-4fa7-8bf2-f4df7465f025'),
(170, NULL, 49, 8, 'craft\\elements\\Entry', 1, 0, '2019-11-23 02:13:51', '2019-11-23 02:13:51', NULL, 'c5512d56-0c55-49c3-a5da-4cee0448926c'),
(172, NULL, NULL, 8, 'craft\\elements\\Entry', 1, 0, '2019-11-23 02:14:34', '2019-11-23 02:14:34', NULL, '290fc5a5-a69c-40f5-895c-df8712c62717'),
(173, NULL, 50, 8, 'craft\\elements\\Entry', 1, 0, '2019-11-23 02:14:34', '2019-11-23 02:14:34', NULL, 'b4645291-d827-42b6-b18a-69ff1535a605'),
(174, 8, NULL, 8, 'craft\\elements\\Entry', 1, 0, '2019-11-23 02:14:36', '2019-11-23 02:14:36', NULL, '6324dca5-934c-4091-840c-b084df183d35'),
(176, NULL, NULL, 8, 'craft\\elements\\Entry', 1, 0, '2019-11-23 02:15:45', '2019-11-23 02:15:45', NULL, 'f95de1af-313d-4a1f-b25a-486bc2b5f217'),
(177, NULL, 51, 8, 'craft\\elements\\Entry', 1, 0, '2019-11-23 02:15:45', '2019-11-23 02:15:45', NULL, '39ac724d-82c6-4a93-a744-fd9427e7b76c'),
(179, NULL, NULL, 8, 'craft\\elements\\Entry', 1, 0, '2019-11-23 02:17:09', '2019-11-23 02:17:09', NULL, '40b21a46-e576-44c6-af1d-f784e0954a9c'),
(180, NULL, 52, 8, 'craft\\elements\\Entry', 1, 0, '2019-11-23 02:17:09', '2019-11-23 02:17:09', NULL, 'd63b67bf-dd77-4c0b-9467-ee96487872ba'),
(181, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 02:18:03', '2019-11-23 05:51:27', '2019-11-23 05:55:49', '0420c8bd-e676-455a-9d48-cb3e205a45c4'),
(182, NULL, 53, 1, 'craft\\elements\\Entry', 1, 0, '2019-11-23 02:18:03', '2019-11-23 02:18:03', NULL, '19ddd722-7b04-4d96-9b9e-076780ac1f63'),
(183, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 02:18:03', '2019-11-23 02:18:03', NULL, 'ad02ef8a-1320-40ca-bd12-4016a4ff68e9'),
(184, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 02:18:03', '2019-11-23 02:18:03', NULL, '6ebd96ba-4b9d-44e1-a3cc-3ef1e9f1f163'),
(185, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 02:18:03', '2019-11-23 02:18:03', NULL, '07d84e04-1b7d-400e-a132-f9836021bebd'),
(186, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 02:18:03', '2019-11-23 02:18:03', NULL, 'e8a919e4-b085-45f7-bc68-94ed73a2c5c8'),
(187, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 02:18:03', '2019-11-23 02:18:03', NULL, '8d15ce7b-1964-4b16-8312-03f4340914c4'),
(188, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 02:18:03', '2019-11-23 02:18:03', NULL, 'ca7c11a7-ebc2-4a03-9235-aeb258e14be9'),
(189, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 02:18:03', '2019-11-23 02:18:03', NULL, '552d530a-0cd6-4579-b0e5-153477b7f0bc'),
(190, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 02:18:03', '2019-11-23 02:18:03', NULL, '14733621-27d9-4e4a-9e1e-b27f1e335038'),
(191, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 02:37:30', '2019-11-23 05:51:27', '2019-11-23 05:55:49', 'e165cbd7-587b-438c-941c-f85525fc3ffc'),
(192, NULL, 54, 1, 'craft\\elements\\Entry', 1, 0, '2019-11-23 02:37:30', '2019-11-23 02:37:30', NULL, '919ef56c-15f1-42d0-9170-1e269ae74955'),
(193, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 02:37:30', '2019-11-23 02:37:30', NULL, '22d73de1-0502-4664-8e19-e9e88094e14a'),
(194, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 02:37:30', '2019-11-23 02:37:30', NULL, '6ee32463-e7f9-4b63-9838-5b41b976f0f0'),
(195, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 02:37:30', '2019-11-23 02:37:30', NULL, '88820c82-cfa6-431e-a52b-20b083dcb6d4'),
(196, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 02:37:30', '2019-11-23 02:37:30', NULL, '761fdec7-8fec-427b-bd97-07a10a32b6bb'),
(197, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 02:37:30', '2019-11-23 02:37:30', NULL, '56bd485e-e353-413c-9391-edecb435b86b'),
(198, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 02:37:30', '2019-11-23 02:37:30', NULL, '5a24f38b-936b-4a10-9e1d-5cd375dc1eb3'),
(199, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 02:37:30', '2019-11-23 02:37:30', NULL, '926dca11-9dc1-4ba3-8f43-3467a5262f49'),
(200, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 02:37:30', '2019-11-23 02:37:30', NULL, 'fd14cba4-6826-4ce9-8075-4f1327b5efe5'),
(201, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 02:37:30', '2019-11-23 02:37:30', NULL, 'fc098f33-bd91-4f9e-b603-669fdf83dfd7'),
(203, NULL, NULL, 4, 'craft\\elements\\Entry', 1, 0, '2019-11-23 02:37:38', '2019-11-23 02:37:38', NULL, '7613326f-6414-4598-b5c3-5f29891b89ba'),
(204, NULL, 55, 4, 'craft\\elements\\Entry', 1, 0, '2019-11-23 02:37:38', '2019-11-23 02:37:38', NULL, '326885fa-1ac9-4cbf-a24d-a5c0f5c3c430'),
(205, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 02:38:31', '2019-11-23 05:51:27', '2019-11-23 05:55:49', '2d2294ff-beb3-4f58-97e9-5c5e06a89e0e'),
(206, NULL, 56, 1, 'craft\\elements\\Entry', 1, 0, '2019-11-23 02:38:30', '2019-11-23 02:38:30', NULL, 'bf1b9310-3008-4eee-8e53-28038c5b96c0'),
(207, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 02:38:31', '2019-11-23 02:38:31', NULL, 'd718a6f5-2195-4ad4-8354-a730398cde9a'),
(208, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 02:38:31', '2019-11-23 02:38:31', NULL, '92506fad-4ae8-405f-87c4-c940f05aed23'),
(209, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 02:38:31', '2019-11-23 02:38:31', NULL, '75eebe14-260f-40d7-b0fa-4529503a2203'),
(210, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 02:38:31', '2019-11-23 02:38:31', NULL, 'f261bd9b-0058-4396-b61c-6a569c0a6ea2'),
(211, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 02:38:31', '2019-11-23 02:38:31', NULL, '91186dc6-f68e-4a61-b155-cf21e24e499c'),
(212, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 02:38:31', '2019-11-23 02:38:31', NULL, '550a4d31-7d7d-4203-b14f-53b38dfcdebe'),
(213, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 02:38:31', '2019-11-23 02:38:31', NULL, '42ec1d09-0a45-44e2-ab8c-8d559edf3928'),
(214, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 02:38:31', '2019-11-23 02:38:31', NULL, '9302159a-2511-4442-bd6e-619fe3696766'),
(215, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 02:38:31', '2019-11-23 02:38:31', NULL, 'd30668c5-1569-40e0-a18f-62f74cf4c597'),
(216, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 02:38:31', '2019-11-23 02:38:31', NULL, '87aa9756-b8d7-4e9c-8a96-5b4d1e461325'),
(217, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 02:39:26', '2019-11-23 05:51:27', '2019-11-23 05:55:49', '7e0efa91-25ff-4142-8920-75cf69e46fa8'),
(218, NULL, 57, 1, 'craft\\elements\\Entry', 1, 0, '2019-11-23 02:39:26', '2019-11-23 02:39:26', NULL, '5e8679d8-619b-4f4c-9a27-610a4667198e'),
(219, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 02:39:26', '2019-11-23 02:39:26', NULL, '44ef03a1-0a72-47eb-a390-34a054882a9c'),
(220, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 02:39:26', '2019-11-23 02:39:26', NULL, '77a52571-c731-4757-adb3-8a5826b2ae80'),
(221, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 02:39:26', '2019-11-23 02:39:26', NULL, '3171980d-ef44-4b96-aaaa-1a3cfa4045d4'),
(222, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 02:39:27', '2019-11-23 02:39:26', NULL, 'e16ff9f1-31fa-4b18-ac2a-209a0da7cc47'),
(223, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 02:39:27', '2019-11-23 02:39:26', NULL, 'cf4ca9f5-751e-4031-9bbc-353e92bac574'),
(224, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 02:39:27', '2019-11-23 02:39:26', NULL, 'a3ef0102-6d91-4fb5-bc94-e635c13f62c1'),
(225, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 02:39:27', '2019-11-23 02:39:26', NULL, 'f049b5db-75f1-4929-a1e9-3d1b147803ea'),
(226, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 02:39:27', '2019-11-23 02:39:26', NULL, '88dccf9f-5c4b-4580-ae44-f969ab381a1c'),
(227, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 02:39:27', '2019-11-23 02:39:26', NULL, '2391e7d6-0c13-4788-bbb5-e02e0e98a254'),
(228, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 02:39:27', '2019-11-23 02:39:26', NULL, 'bc33675c-3735-4858-864b-09aed9e8c94e'),
(229, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 02:39:27', '2019-11-23 02:39:26', NULL, 'b3acc8ff-422f-4180-86a0-893643ba4922'),
(230, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 02:39:50', '2019-11-23 05:51:27', '2019-11-23 05:55:49', '38395093-1cd2-41e8-a264-1e41a3f005d0'),
(231, NULL, 58, 1, 'craft\\elements\\Entry', 1, 0, '2019-11-23 02:39:50', '2019-11-23 02:39:50', NULL, '691d435d-8d69-4b39-8e60-cb99e0143b95'),
(232, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 02:39:50', '2019-11-23 02:39:50', NULL, 'e9faa6da-7f8f-4391-b01b-4b7b9d78850e'),
(233, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 02:39:50', '2019-11-23 02:39:50', NULL, '030c30e1-a78f-448c-b075-fafe7164a55b'),
(234, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 02:39:50', '2019-11-23 02:39:50', NULL, '1b13779b-de57-448e-8a76-3fce637cb934'),
(235, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 02:39:50', '2019-11-23 02:39:50', NULL, '523cd301-7601-4572-9f2f-3ec3fe75798a'),
(236, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 02:39:50', '2019-11-23 02:39:50', NULL, '69720f1a-1f79-4c2d-b7f4-968a817e6ea7'),
(237, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 02:39:50', '2019-11-23 02:39:50', NULL, '4987bcad-90c8-47bd-81f7-3f8abc6d3a67'),
(238, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 02:39:50', '2019-11-23 02:39:50', NULL, '9e61cc2b-369d-42ae-8589-9a1cee848be3'),
(239, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 02:39:50', '2019-11-23 02:39:50', NULL, '977e7b81-f4e7-40be-ae26-6bc6f080b94b'),
(240, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 02:39:50', '2019-11-23 02:39:50', NULL, 'fef8e2ac-635e-4fb5-81c2-524e31aef962'),
(241, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 02:39:50', '2019-11-23 02:39:50', NULL, '43053db1-4dc7-41e6-b0ea-44d75206e5bf'),
(242, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 02:39:50', '2019-11-23 02:39:50', NULL, 'eeb4c745-2bd5-4a42-8273-c9b3a588f491'),
(243, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 02:39:50', '2019-11-23 02:39:50', NULL, '6e8cd4fb-115b-4114-9111-cc726ff66002'),
(244, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:13:35', '2019-11-23 05:51:27', '2019-11-23 05:55:49', 'c2f0e94e-60bc-4a05-801a-f223992e7a12'),
(245, NULL, 59, 1, 'craft\\elements\\Entry', 1, 0, '2019-11-23 05:13:35', '2019-11-23 05:13:35', NULL, 'fc5113d2-1586-4975-a055-540b381ff126'),
(246, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:13:35', '2019-11-23 05:13:35', NULL, '5f475915-687f-47fa-8027-7c7847e89a49'),
(247, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:13:35', '2019-11-23 05:13:35', NULL, '34b019d6-5da0-49bf-b1da-7e1fe2f48d41'),
(248, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:13:35', '2019-11-23 05:13:35', NULL, 'c658df63-3321-418d-b5f6-6a5b56bba026'),
(249, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:13:35', '2019-11-23 05:13:35', NULL, '20993b1b-35ee-4eaa-9d62-0b9306184a18'),
(250, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:13:35', '2019-11-23 05:13:35', NULL, 'bb090213-7a67-44d6-b3ec-53fde303f62c'),
(251, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:13:35', '2019-11-23 05:13:35', NULL, 'd0fd9682-2b22-4575-a1b3-93d25d665b66'),
(252, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:13:35', '2019-11-23 05:13:35', NULL, '16f73f39-493e-47e3-accd-429be517ee93'),
(253, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:13:35', '2019-11-23 05:13:35', NULL, 'ca7ad55b-496b-4e5e-8924-61a5d4c254d3'),
(254, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:13:35', '2019-11-23 05:13:35', NULL, 'ebd47069-af6f-4524-bef9-2b6e22b0c1e9'),
(255, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:13:35', '2019-11-23 05:13:35', NULL, 'fdeb5fdb-04e0-482b-b41b-f89b33097d1b'),
(256, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:13:35', '2019-11-23 05:13:35', NULL, '5ae4cc4a-7f0c-4123-b485-d9abddbf8370'),
(257, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:13:35', '2019-11-23 05:13:35', NULL, '00021c39-126f-4d37-aa50-7d22e53a8d70'),
(258, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:13:35', '2019-11-23 05:13:35', NULL, '1da329c3-bfca-4873-9961-a384651d4079'),
(259, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:14:04', '2019-11-23 06:22:34', NULL, '187766db-fa60-473b-a5a3-b0d4d72ec8a9'),
(260, NULL, 60, 3, 'craft\\elements\\Entry', 1, 0, '2019-11-23 05:14:04', '2019-11-23 05:14:04', NULL, '5825801f-d18e-4fc3-9499-d5e8b1d3230e'),
(261, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:14:04', '2019-11-23 05:14:04', NULL, 'd95df941-3054-4a35-abe1-63487386787b'),
(262, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:14:04', '2019-11-23 05:14:04', NULL, '8933a01d-48f7-4562-b290-386a995d9a2c'),
(263, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:14:04', '2019-11-23 05:14:04', NULL, '4bbca373-dc3d-404c-b735-7cc5f1819182'),
(264, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:14:22', '2019-11-23 05:51:27', '2019-11-23 05:55:49', '74f18768-907c-4744-8bc3-3963ff4ef7b4'),
(265, NULL, 61, 1, 'craft\\elements\\Entry', 1, 0, '2019-11-23 05:14:22', '2019-11-23 05:14:22', NULL, 'b3d60948-a429-47ba-8dfe-a830b4c29c21'),
(266, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:14:22', '2019-11-23 05:14:22', NULL, '363867c1-01e0-4ee7-84c0-0825e319d1ce'),
(267, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:14:23', '2019-11-23 05:14:22', NULL, 'ac4d3e3a-cecf-4acd-9b11-19cf8961475d'),
(268, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:14:23', '2019-11-23 05:14:22', NULL, '6d0e4c1e-9a5d-4c44-94ee-4aa6019973ed'),
(269, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:14:23', '2019-11-23 05:14:22', NULL, 'bb18ed78-462d-4e01-99b5-00d9d12c7862'),
(270, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:14:23', '2019-11-23 05:14:22', NULL, '64135fab-9715-47f3-a6d4-511f0ff8eccc'),
(271, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:14:23', '2019-11-23 05:14:22', NULL, '4ce17c2c-be2d-4e31-aa67-fac13c6e4498'),
(272, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:14:23', '2019-11-23 05:14:22', NULL, '0a999da7-d244-4f7c-bdbf-611480762386'),
(273, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:14:23', '2019-11-23 05:14:22', NULL, 'be3736c1-9537-4165-af7e-ffbb3927817c'),
(274, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:14:23', '2019-11-23 05:14:22', NULL, '9e052167-396b-43bc-80e3-f42bb872ea69'),
(275, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:14:23', '2019-11-23 05:14:22', NULL, '698afa6b-777d-45d4-9656-622b7f5da6a1'),
(276, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:14:23', '2019-11-23 05:14:22', NULL, '2bb9c211-1d77-45cb-974f-6ff5ffdd921c'),
(277, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:14:23', '2019-11-23 05:14:22', NULL, 'f2e89152-0dc3-4fca-9122-2500410bb61f'),
(278, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:14:23', '2019-11-23 05:14:22', NULL, '824a4e60-472e-421c-8960-634027e96db1'),
(279, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:14:23', '2019-11-23 05:14:22', NULL, '7522f1f7-ff49-4b64-b080-966ec7974f6b'),
(280, NULL, 62, 8, 'craft\\elements\\Entry', 1, 0, '2019-11-23 05:17:18', '2019-11-23 05:17:18', NULL, '06307aed-6a65-4d74-8a1b-fd167498861d'),
(282, NULL, NULL, 8, 'craft\\elements\\Entry', 1, 0, '2019-11-23 05:17:45', '2019-11-23 05:17:45', NULL, '1bfdfe5f-e2af-4851-a086-15888a1c9584'),
(283, NULL, 63, 8, 'craft\\elements\\Entry', 1, 0, '2019-11-23 05:17:45', '2019-11-23 05:17:45', NULL, '6effd277-c2cf-4505-9e7f-507756f83eee'),
(285, NULL, NULL, 8, 'craft\\elements\\Entry', 1, 0, '2019-11-23 05:18:47', '2019-11-23 05:18:47', NULL, 'e3d2abb5-6eba-4d6f-9037-079f470aec4f'),
(286, NULL, 64, 8, 'craft\\elements\\Entry', 1, 0, '2019-11-23 05:18:47', '2019-11-23 05:18:47', NULL, 'dfaec44c-5025-4091-8c09-9961ecb718ed'),
(287, 11, NULL, 8, 'craft\\elements\\Entry', 1, 0, '2019-11-23 05:29:34', '2019-11-23 05:29:34', NULL, 'b85fbf0a-2cf5-49ad-925d-2dc7605e9f51'),
(289, NULL, NULL, 8, 'craft\\elements\\Entry', 1, 0, '2019-11-23 05:29:43', '2019-11-23 05:29:43', NULL, 'dd180d57-0aad-429e-bfbb-7339d8f65254'),
(290, NULL, 65, 8, 'craft\\elements\\Entry', 1, 0, '2019-11-23 05:29:43', '2019-11-23 05:29:43', NULL, '987f198f-83cf-4cc7-9a01-9d56dff3ce21'),
(292, NULL, NULL, 4, 'craft\\elements\\Entry', 1, 0, '2019-11-23 05:33:45', '2019-11-23 05:33:45', NULL, 'ebe57c5c-2462-459a-807e-20358bdff0c5'),
(293, NULL, 66, 4, 'craft\\elements\\Entry', 1, 0, '2019-11-23 05:33:45', '2019-11-23 05:33:45', NULL, '61860188-efa2-4ee9-b4bf-f7bd64c45010'),
(295, NULL, NULL, 4, 'craft\\elements\\Entry', 1, 0, '2019-11-23 05:34:41', '2019-11-23 05:34:41', NULL, 'e71da05c-f427-4149-9158-4cce9e93fd11'),
(296, NULL, 67, 4, 'craft\\elements\\Entry', 1, 0, '2019-11-23 05:34:41', '2019-11-23 05:34:41', NULL, '3392f855-6d66-4f18-b42a-87210203cfff'),
(298, NULL, NULL, 4, 'craft\\elements\\Entry', 1, 0, '2019-11-23 05:36:12', '2019-11-23 05:38:00', NULL, '36f2af17-d218-406a-9941-573eedd3142f'),
(299, NULL, 68, 4, 'craft\\elements\\Entry', 1, 0, '2019-11-23 05:36:12', '2019-11-23 05:36:12', NULL, '06b4b2b7-ab5f-4bde-99f2-eb0eda89473e'),
(301, NULL, NULL, 4, 'craft\\elements\\Entry', 1, 0, '2019-11-23 05:37:57', '2019-11-23 05:37:57', NULL, 'ba5b6930-9643-4f44-be65-b69ca4bac1b5'),
(302, NULL, 69, 4, 'craft\\elements\\Entry', 1, 0, '2019-11-23 05:37:57', '2019-11-23 05:37:57', NULL, '536499d3-c226-44c5-9dea-9cc6cfd93692'),
(303, NULL, 70, 4, 'craft\\elements\\Entry', 1, 0, '2019-11-23 05:38:00', '2019-11-23 05:38:00', NULL, 'ff07b363-ce7a-4f48-85ff-6cfd2ab7ac7b'),
(304, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:38:10', '2019-11-23 05:51:27', '2019-11-23 05:55:49', 'cccdd509-c8cf-45ef-a092-a842c51ae262'),
(305, NULL, 71, 1, 'craft\\elements\\Entry', 1, 0, '2019-11-23 05:38:10', '2019-11-23 05:38:10', NULL, 'ba100ff7-08c2-40ff-9608-5fbcb252d954'),
(306, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:38:10', '2019-11-23 05:38:10', NULL, 'c6bf7a7a-4a76-486e-9441-1958b89f9772'),
(307, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:38:10', '2019-11-23 05:38:10', NULL, '2246edd7-f155-4230-947e-fae6a5b47dc3'),
(308, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:38:10', '2019-11-23 05:38:10', NULL, '84821b38-5363-4dc5-92d5-0dfa54e60e66'),
(309, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:38:10', '2019-11-23 05:38:10', NULL, '97ef323b-f80c-4cf3-a283-224800b1a943'),
(310, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:38:10', '2019-11-23 05:38:10', NULL, '5f04d570-9a66-4890-9423-4c11fb53b22c'),
(311, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:38:10', '2019-11-23 05:38:10', NULL, 'ed4eabc3-1753-4c9e-8aeb-a3ce6bf9b0cb'),
(312, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:38:10', '2019-11-23 05:38:10', NULL, 'e6e5524e-05ae-4153-9d9d-0d2b467b5d9e'),
(313, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:38:10', '2019-11-23 05:38:10', NULL, 'b103411a-6525-487c-97a1-1015e34a2fd4'),
(314, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:38:10', '2019-11-23 05:38:10', NULL, 'c57ff5f5-c5eb-4179-ab6d-2f71a2d4540a'),
(315, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:38:10', '2019-11-23 05:38:10', NULL, 'd15bf2e5-b408-4fdc-9bb4-e12ae5d985e4'),
(316, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:38:10', '2019-11-23 05:38:10', NULL, 'bd532563-20d4-46dd-9071-49c27bf413b9'),
(317, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:38:10', '2019-11-23 05:38:10', NULL, 'b16f39a6-aafe-4d74-b6da-69affbb3a028'),
(318, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:38:10', '2019-11-23 05:38:10', NULL, 'ead3cf7a-a9bb-49a5-9953-357ef9314230'),
(319, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:38:10', '2019-11-23 05:38:10', NULL, 'de2370af-8032-417b-8116-dac60222aa7c'),
(320, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:38:10', '2019-11-23 05:38:10', NULL, 'ad78078d-c71d-4434-b4a2-61bdf051d7e3'),
(321, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:45:25', '2019-11-23 05:51:27', '2019-11-23 05:55:49', '4e343121-b521-4dc4-92c6-16985d5c3b3e'),
(322, NULL, 72, 1, 'craft\\elements\\Entry', 1, 0, '2019-11-23 05:45:25', '2019-11-23 05:45:25', NULL, '9f3965e9-c887-4311-a8af-f4ae8f07f380'),
(323, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:45:25', '2019-11-23 05:45:25', NULL, '48fcd5f7-c3b6-4fc5-a071-e623554cce2a'),
(324, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:45:25', '2019-11-23 05:45:25', NULL, '5afc32b2-4e7a-479d-af8d-d0fdb9b16dfb'),
(325, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:45:25', '2019-11-23 05:45:25', NULL, 'e2214efc-681e-4f39-9341-63bf18feca19'),
(326, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:45:25', '2019-11-23 05:45:25', NULL, '4b33e23d-46e7-41e2-8ca2-2565c3304ebb'),
(327, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:45:25', '2019-11-23 05:45:25', NULL, 'ca1ef8a0-4a07-45ce-9b4e-8cb1b2a271b3'),
(328, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:45:25', '2019-11-23 05:45:25', NULL, 'f2f6161d-5019-458e-9c41-e6b2cdb1630c'),
(329, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:45:25', '2019-11-23 05:45:25', NULL, 'e39ad24e-87d3-480a-86f7-3ece9edcbeb7'),
(330, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:45:25', '2019-11-23 05:45:25', NULL, '3f168ae9-9395-44fb-9ba9-ad3a78b8e0bd'),
(331, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:45:25', '2019-11-23 05:45:25', NULL, '3f1bd7e4-889f-4f78-9717-240936e6d6e1'),
(332, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:45:25', '2019-11-23 05:45:25', NULL, '159a63e5-2f00-446f-9eea-f4344ebaac33'),
(333, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:45:25', '2019-11-23 05:45:25', NULL, '10626ba0-8b30-4948-ba60-0cd355278f03'),
(334, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:45:25', '2019-11-23 05:45:25', NULL, '1d93cd1e-7f34-423c-95f5-f162615e7cc1'),
(335, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:45:25', '2019-11-23 05:45:25', NULL, '4610ce10-8fc3-4787-a40b-02107caa6eda'),
(336, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:45:25', '2019-11-23 05:45:25', NULL, 'b0f99133-feb5-44d3-8b67-6c22220aee7e'),
(337, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:45:25', '2019-11-23 05:45:25', NULL, 'f5501943-e9aa-4aaa-9a5e-93fca3f59771'),
(338, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:45:25', '2019-11-23 05:45:25', NULL, '3e238ce5-380f-4430-b5f6-097538def7d8'),
(339, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:51:27', '2019-11-23 05:51:27', '2019-11-23 05:55:49', '5ffbde97-0a30-49e5-a54d-75b626664bf9'),
(340, NULL, 73, 1, 'craft\\elements\\Entry', 1, 0, '2019-11-23 05:51:27', '2019-11-23 05:51:27', NULL, 'd824cc93-ec69-4dd6-83d0-622eb5b86a13'),
(341, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:51:27', '2019-11-23 05:51:27', NULL, 'cad35207-61ba-483a-a088-c808cc01a740'),
(342, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:51:27', '2019-11-23 05:51:27', NULL, '564f150a-7710-4460-b8ff-c4925796d907'),
(343, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:51:27', '2019-11-23 05:51:27', NULL, '7db18955-0ce5-4200-bc73-abdb2ac9624d'),
(344, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:51:27', '2019-11-23 05:51:27', NULL, '65f8d8a8-7fcc-4a63-b808-4ca96c7a3e53'),
(345, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:51:27', '2019-11-23 05:51:27', NULL, '12aed20a-7461-4835-979e-5070d9e4d324'),
(346, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:51:27', '2019-11-23 05:51:27', NULL, '499dec4e-fdaa-415d-8d3e-d80f95287715'),
(347, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:51:27', '2019-11-23 05:51:27', NULL, 'dd89525e-dea4-4163-a578-2f46ac36c53c'),
(348, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:51:27', '2019-11-23 05:51:27', NULL, 'eead00a3-b267-47ba-841c-3ef0dc33aa7f'),
(349, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:51:27', '2019-11-23 05:51:27', NULL, 'd26a362b-6748-4f2d-b9c3-2efbd09ed26a'),
(350, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:51:27', '2019-11-23 05:51:27', NULL, '7469fd33-3400-4cf7-8595-01f09c087b2c'),
(351, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:51:27', '2019-11-23 05:51:27', NULL, '4f734d87-c60e-4dbe-806a-94a80f8d3d59'),
(352, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:51:27', '2019-11-23 05:51:27', NULL, '47e59803-5c0e-48e3-a27a-f71a5df478f4'),
(353, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:51:27', '2019-11-23 05:51:27', NULL, '8d770668-5e28-463b-a36f-20a17f74540d'),
(354, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:51:27', '2019-11-23 05:51:27', NULL, 'dd124dee-5487-4dae-a80b-ce56553cd86f'),
(355, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:51:27', '2019-11-23 05:51:27', NULL, '6ed72492-754c-4ae0-9529-a9dcc63d7ccd'),
(356, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:51:27', '2019-11-23 05:51:27', NULL, 'a40573f5-e158-498d-a905-0a556e9309ac'),
(357, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:51:27', '2019-11-23 05:51:27', NULL, '03988bf3-aab7-42ce-9a2a-0055561aacd5'),
(358, NULL, 74, 3, 'craft\\elements\\Entry', 1, 0, '2019-11-23 05:53:24', '2019-11-23 05:53:24', NULL, '1dd06127-7de9-493c-bd44-26793bf613ad'),
(359, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:53:24', '2019-11-23 05:53:24', NULL, '5bb7e8f4-bab3-44aa-82f2-eb720a6149f7');
INSERT INTO `elements` (`id`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(360, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:53:24', '2019-11-23 05:53:24', NULL, 'f31df67a-66d3-4a1c-9b40-ad0f0c60fd53'),
(361, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:53:24', '2019-11-23 05:53:24', NULL, '4429aa0d-38eb-4024-8cdc-aa30f99ffb5d'),
(362, NULL, 75, 1, 'craft\\elements\\Entry', 1, 0, '2019-11-23 05:55:49', '2019-11-23 05:55:49', NULL, '26c10e28-69c0-4c40-b24b-814221abef17'),
(363, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:55:49', '2019-11-23 05:55:49', NULL, 'c3bea346-9186-46e1-92b8-5fa8a65da0e6'),
(364, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:56:36', '2019-11-23 06:22:34', NULL, '2ae94b79-29da-4e17-bd09-056b2d579a77'),
(365, NULL, 76, 3, 'craft\\elements\\Entry', 1, 0, '2019-11-23 05:56:36', '2019-11-23 05:56:36', NULL, '231a88f3-2050-4788-871d-b2df5c699e75'),
(366, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:56:36', '2019-11-23 05:56:36', NULL, 'babfea72-9d56-4036-bcf0-f5bbefb1c7cb'),
(367, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:56:36', '2019-11-23 05:56:36', NULL, 'b97ed8e7-ddd7-4ebb-b5b9-aaf03c088431'),
(368, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:56:36', '2019-11-23 05:56:36', NULL, '04d297d0-5d60-47c3-92e7-ba2ff650a4c9'),
(369, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 05:56:36', '2019-11-23 05:56:36', NULL, 'd9f8773c-ab32-42f3-be57-5caffd458338'),
(370, NULL, 77, 8, 'craft\\elements\\Entry', 1, 0, '2019-11-23 05:57:28', '2019-11-23 05:57:28', NULL, 'cc6f95cf-cbae-4aeb-bd30-1d6a70370877'),
(372, NULL, NULL, 8, 'craft\\elements\\Entry', 1, 0, '2019-11-23 06:01:19', '2019-11-23 06:01:19', NULL, 'f1c3206f-8d59-4976-9414-731b4fce7079'),
(373, NULL, 78, 8, 'craft\\elements\\Entry', 1, 0, '2019-11-23 06:01:19', '2019-11-23 06:01:19', NULL, '2d46437c-b47d-4c75-8fb7-0903f5115285'),
(375, NULL, NULL, 4, 'craft\\elements\\Entry', 1, 0, '2019-11-23 06:01:26', '2019-11-23 06:01:26', NULL, '15bcf67d-d2c2-4cdb-89a7-0ad6baea926e'),
(376, NULL, 79, 4, 'craft\\elements\\Entry', 1, 0, '2019-11-23 06:01:26', '2019-11-23 06:01:26', NULL, '1c19afab-96ed-43e8-b7fb-c3b7cf01f7fd'),
(377, 14, NULL, 4, 'craft\\elements\\Entry', 1, 0, '2019-11-23 06:01:27', '2019-11-23 06:01:27', NULL, 'ed17e954-a361-40d2-93e6-f039fb09700e'),
(378, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 06:01:37', '2019-11-23 06:13:03', NULL, '607d915b-c418-41c8-8207-72a94e816e72'),
(379, NULL, 80, 1, 'craft\\elements\\Entry', 1, 0, '2019-11-23 06:01:37', '2019-11-23 06:01:37', NULL, 'c6800475-13b3-4f8f-828a-e826e81c14fc'),
(380, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 06:01:37', '2019-11-23 06:01:37', NULL, '69d5c95e-da2e-4ad6-9114-267855274a06'),
(381, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 06:01:37', '2019-11-23 06:01:37', NULL, '08e50185-11c7-489d-8dd6-20c73fa92031'),
(382, 15, NULL, 4, 'craft\\elements\\Entry', 1, 0, '2019-11-23 06:02:25', '2019-11-23 06:02:27', NULL, 'a59e9af4-c9f5-4764-a541-eab997414e2e'),
(384, NULL, NULL, 8, 'craft\\elements\\Entry', 1, 0, '2019-11-23 06:02:42', '2019-11-23 06:02:42', NULL, '42812d16-c6f8-466e-bf65-6f65adb0850b'),
(385, NULL, 81, 8, 'craft\\elements\\Entry', 1, 0, '2019-11-23 06:02:42', '2019-11-23 06:02:42', NULL, 'bb6c1126-8829-4dc9-bed0-5d7ea6cd4ef6'),
(386, 17, NULL, 8, 'craft\\elements\\Entry', 1, 0, '2019-11-23 06:03:20', '2019-11-23 06:03:20', NULL, 'a6f6a24a-d5c3-4042-8357-310059879f16'),
(387, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 06:03:31', '2019-11-23 06:13:03', NULL, '79bf5f9a-d4eb-4b9c-a8d5-1e5f429f4620'),
(388, NULL, 82, 1, 'craft\\elements\\Entry', 1, 0, '2019-11-23 06:03:31', '2019-11-23 06:03:31', NULL, 'c99fe072-cbaa-46c5-b661-d3d23e386728'),
(389, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 06:03:31', '2019-11-23 06:03:31', NULL, '7494f1d8-0111-47ac-933e-927283f29d1d'),
(390, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 06:03:31', '2019-11-23 06:03:31', NULL, 'b98e1abe-8715-4231-a618-ac450725bfd3'),
(391, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 06:03:31', '2019-11-23 06:03:31', NULL, '14ae2e21-3dcb-4897-807e-a548225213b6'),
(392, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 06:04:16', '2019-11-23 06:13:03', NULL, 'c1a5756d-ddc9-46ab-9dfc-fc8cb48bc42e'),
(393, NULL, 83, 1, 'craft\\elements\\Entry', 1, 0, '2019-11-23 06:04:16', '2019-11-23 06:04:16', NULL, '3b9eacd6-8f2f-4157-963f-44b5c4e439db'),
(394, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 06:04:16', '2019-11-23 06:04:16', NULL, '180e0d24-f1b9-4227-a193-ad9841aa3c60'),
(395, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 06:04:16', '2019-11-23 06:04:16', NULL, 'd1e7dbf6-3092-4774-9f61-9f4bb82aae67'),
(396, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 06:04:16', '2019-11-23 06:04:16', NULL, '7f63db69-77b4-4977-a0eb-83bd5f888fcb'),
(397, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 06:04:16', '2019-11-23 06:04:16', NULL, '593dc1ce-ea2e-4730-b763-7c9afc746de6'),
(398, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 06:04:40', '2019-11-23 06:13:03', NULL, '3833865d-b9bf-4b2e-a5d0-0de88c025817'),
(399, NULL, 84, 1, 'craft\\elements\\Entry', 1, 0, '2019-11-23 06:04:40', '2019-11-23 06:04:40', NULL, '35744967-bd6f-4ff2-acb2-4f16852bdec4'),
(400, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 06:04:40', '2019-11-23 06:04:40', NULL, '1da56711-7b91-44be-b714-2a4e2eda0fc6'),
(401, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 06:04:40', '2019-11-23 06:04:40', NULL, 'a49007a9-f043-40ec-bd9e-e10edaf0d48b'),
(402, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 06:04:40', '2019-11-23 06:04:40', NULL, '5f029442-86e3-4756-802c-066efe89e85c'),
(403, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 06:04:40', '2019-11-23 06:04:40', NULL, 'a714981c-9478-448f-b925-9abb0a1c5f45'),
(404, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 06:04:40', '2019-11-23 06:04:40', NULL, '3e244c33-6c10-4b90-b1ef-ba46472eb4c5'),
(405, NULL, 85, 3, 'craft\\elements\\Entry', 1, 0, '2019-11-23 06:06:48', '2019-11-23 06:06:48', NULL, '46bbf25a-d352-464c-9b0f-8a469854c9cf'),
(406, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 06:06:49', '2019-11-23 06:06:48', NULL, '5d7afd59-0051-4a1c-b0cf-8088d71273a0'),
(407, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 06:06:49', '2019-11-23 06:06:48', NULL, 'ddddff10-b12d-40e2-b895-8c693811fdfe'),
(408, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 06:06:49', '2019-11-23 06:06:48', NULL, '81b3388c-346c-488a-b135-fda4df7ce886'),
(409, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 06:06:49', '2019-11-23 06:06:49', NULL, 'e0a325fc-64d9-4970-aaec-8a534e0957d3'),
(410, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 06:13:03', '2019-11-23 06:13:03', NULL, '3426aff3-f432-4e74-b626-94e7b1d42da4'),
(411, NULL, 86, 1, 'craft\\elements\\Entry', 1, 0, '2019-11-23 06:13:03', '2019-11-23 06:13:03', NULL, '56c0a66c-05c7-4e7b-a55f-6c3c3a98f51f'),
(412, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 06:13:03', '2019-11-23 06:13:03', NULL, '70d0f05c-60a4-452f-9498-65c44f2455b2'),
(413, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 06:13:03', '2019-11-23 06:13:03', NULL, '1e1b3610-1812-4d4c-9140-889841d5e518'),
(414, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 06:13:03', '2019-11-23 06:13:03', NULL, 'b8220732-2115-4cc4-a927-4100d7d26662'),
(415, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 06:13:03', '2019-11-23 06:13:03', NULL, '84d084a3-8c03-4e0d-800f-b19ebec49927'),
(416, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 06:13:03', '2019-11-23 06:13:03', NULL, '3cff90ae-f737-42da-acdf-fc4ab8fb617a'),
(417, NULL, NULL, 7, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 06:13:03', '2019-11-23 06:13:03', NULL, 'dcfffccc-db55-430d-a868-97e6e44dcd5c'),
(419, NULL, NULL, 4, 'craft\\elements\\Entry', 1, 0, '2019-11-23 06:22:01', '2019-11-23 06:22:01', NULL, 'cdac5a5f-21b0-4d4b-beec-55e4d27f61d9'),
(420, NULL, 87, 4, 'craft\\elements\\Entry', 1, 0, '2019-11-23 06:22:01', '2019-11-23 06:22:01', NULL, 'd2e4c185-4f07-4897-a31d-7c8c2ec4a91e'),
(422, NULL, NULL, 8, 'craft\\elements\\Entry', 1, 0, '2019-11-23 06:22:13', '2019-11-23 07:15:26', NULL, 'bd5e98de-5cac-4d01-b38a-06586803b7b6'),
(423, NULL, 88, 8, 'craft\\elements\\Entry', 1, 0, '2019-11-23 06:22:13', '2019-11-23 06:22:13', NULL, '50a614d6-c18b-4ca5-a4fb-5cd17cde7dbc'),
(424, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 06:22:34', '2019-11-23 06:22:34', NULL, '2f49bc45-33ce-4cf9-971f-57cc58c89e69'),
(425, NULL, 89, 3, 'craft\\elements\\Entry', 1, 0, '2019-11-23 06:22:34', '2019-11-23 06:22:34', NULL, '4c3c580c-c81f-49ed-82ff-86073c3cda3f'),
(426, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 06:22:34', '2019-11-23 06:22:34', NULL, '1eaea4f1-c440-4c6e-84da-9e2b95531f67'),
(427, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 06:22:34', '2019-11-23 06:22:34', NULL, '5b45c5a9-e403-49b7-9c8c-2e26d71ac872'),
(428, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 06:22:34', '2019-11-23 06:22:34', NULL, 'ddf6b8e1-99c9-41a2-994b-b2787613b379'),
(429, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 06:22:34', '2019-11-23 06:22:34', NULL, '30a8655f-0216-4bfe-a07e-f5f3465bd858'),
(430, NULL, NULL, 6, 'craft\\elements\\MatrixBlock', 1, 0, '2019-11-23 06:22:34', '2019-11-23 06:22:34', NULL, '72e6f9f5-6224-4d4c-9a9e-b28b1ac69b6e'),
(431, NULL, 90, 8, 'craft\\elements\\Entry', 1, 0, '2019-11-23 07:15:26', '2019-11-23 07:15:26', NULL, '38f831aa-6b54-4c3c-8158-499cf386b3ee'),
(432, NULL, NULL, 9, 'craft\\elements\\User', 1, 0, '2019-11-25 05:21:15', '2019-11-25 05:23:04', NULL, '74c49dd7-6565-44d9-ad0b-14d08d463088');

-- --------------------------------------------------------

--
-- Table structure for table `elements_sites`
--

CREATE TABLE `elements_sites` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `elements_sites`
--

INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, NULL, NULL, 1, '2019-11-17 03:11:01', '2019-11-17 03:11:01', '0a6b8143-1bd8-42a6-abc1-9671612ff70d'),
(2, 2, 1, 'home', '__home__', 1, '2019-11-17 03:13:40', '2019-11-17 05:35:16', 'a2532ddc-ee60-4ea7-af8b-2b22f96b8fd0'),
(3, 3, 1, 'contact', 'contact', 1, '2019-11-17 03:13:53', '2019-11-17 03:13:53', 'b18dfb0f-3ca0-4e82-8da4-59e835ba1e07'),
(4, 4, 1, 'order-form', 'order', 1, '2019-11-17 03:14:44', '2019-11-17 05:29:12', '846f2230-3feb-4197-a3d6-013b070331ac'),
(5, 5, 1, 'salmon', 'products/salmon', 1, '2019-11-17 03:22:44', '2019-11-17 03:22:44', 'a16170d4-4d7c-4fc4-91ee-e4672cb2b578'),
(7, 7, 1, NULL, NULL, 1, '2019-11-17 05:06:24', '2019-11-17 05:29:12', '0989e033-e083-407f-bbd9-3af82826d6a8'),
(8, 8, 1, NULL, NULL, 1, '2019-11-17 05:28:35', '2019-11-17 05:29:12', '1d843600-e8b7-4968-ba4c-04217978b3f1'),
(9, 9, 1, NULL, NULL, 1, '2019-11-17 05:34:08', '2019-11-17 05:35:16', '9af3aeb5-b63c-4c35-846b-6525b8aa886f'),
(10, 10, 1, NULL, NULL, 1, '2019-11-17 05:35:01', '2019-11-17 05:35:16', 'a387f8f2-049d-4678-a5c1-99677312a044'),
(11, 11, 1, NULL, NULL, 1, '2019-11-17 05:35:16', '2019-11-17 05:35:16', '00167915-6c7e-4ce7-8020-bfb608400898'),
(12, 12, 1, 'home', '__home__', 1, '2019-11-20 10:20:47', '2019-11-20 10:20:47', '9ab131aa-7b1f-4eb9-9e1c-a94730a8b037'),
(13, 13, 1, NULL, NULL, 1, '2019-11-20 10:20:47', '2019-11-20 10:20:47', '6f3eea1c-1b66-40cc-b108-2510fbd66bb9'),
(14, 14, 1, NULL, NULL, 1, '2019-11-20 10:20:47', '2019-11-20 10:20:47', '9b710cd5-7488-4c7d-b145-8077b70126bb'),
(15, 15, 1, NULL, NULL, 1, '2019-11-20 10:20:47', '2019-11-20 10:20:47', 'e041fbf2-feae-4371-a172-8577e7659d7a'),
(16, 16, 1, 'home', '__home__', 1, '2019-11-20 10:20:47', '2019-11-20 10:20:47', 'e8766b64-4813-4198-872a-f122a2428c8e'),
(17, 17, 1, NULL, NULL, 1, '2019-11-20 10:20:47', '2019-11-20 10:20:47', 'e18b82e7-f443-4ece-9dd7-1e6077f5547b'),
(18, 18, 1, NULL, NULL, 1, '2019-11-20 10:20:47', '2019-11-20 10:20:47', 'c18d4c9b-d1b1-4a0f-9012-54b8bbac653c'),
(19, 19, 1, NULL, NULL, 1, '2019-11-20 10:20:47', '2019-11-20 10:20:47', '974a7ec5-0e55-4ad3-86bf-a677c3601c7a'),
(20, 20, 1, 'home', '__home__', 1, '2019-11-20 10:20:47', '2019-11-20 10:20:47', 'a35b5269-ae6d-4fb9-8231-a1e77be64d84'),
(21, 21, 1, NULL, NULL, 1, '2019-11-20 10:20:47', '2019-11-20 10:20:47', 'a24be552-d8e3-4858-a7a4-de61d1aafd87'),
(22, 22, 1, NULL, NULL, 1, '2019-11-20 10:20:47', '2019-11-20 10:20:47', '84989e48-4f43-4201-841b-449647bbff5f'),
(23, 23, 1, NULL, NULL, 1, '2019-11-20 10:20:47', '2019-11-20 10:20:47', '8e8d2c6a-7faa-42fd-b55f-72e20c7bcb53'),
(24, 24, 1, 'home', '__home__', 1, '2019-11-20 10:20:47', '2019-11-20 10:20:47', 'b52d1bcd-87c9-46cc-b7a7-761049067686'),
(25, 25, 1, NULL, NULL, 1, '2019-11-20 10:20:47', '2019-11-20 10:20:47', '322eefc3-0066-4a51-a0f8-2bb72efc707a'),
(26, 26, 1, NULL, NULL, 1, '2019-11-20 10:20:47', '2019-11-20 10:20:47', 'e6d9b9c2-0560-4cf7-bc38-01692b669549'),
(27, 27, 1, NULL, NULL, 1, '2019-11-20 10:20:47', '2019-11-20 10:20:47', 'dd26aa79-6eb7-4cfa-ae93-9bff439f3230'),
(28, 28, 1, 'order-form', 'order', 1, '2019-11-20 10:20:47', '2019-11-20 10:20:47', '0c26fe25-cd5a-40a6-ba6f-2d319cd50d9c'),
(29, 29, 1, NULL, NULL, 1, '2019-11-20 10:20:47', '2019-11-20 10:20:47', '097e14a4-922a-41d6-8a9c-7b3a50b1e256'),
(30, 30, 1, NULL, NULL, 1, '2019-11-20 10:20:47', '2019-11-20 10:20:47', '62163f57-5195-4bd8-9c83-56689ae434c4'),
(31, 31, 1, 'order-form', 'order', 1, '2019-11-20 10:20:48', '2019-11-20 10:20:48', '4c4bead0-ba85-47f0-87d2-112a62c54c39'),
(32, 32, 1, NULL, NULL, 1, '2019-11-20 10:20:48', '2019-11-20 10:20:48', 'fd6a1569-648a-4703-ba35-b4ba7e2f37ca'),
(33, 33, 1, NULL, NULL, 1, '2019-11-20 10:20:48', '2019-11-20 10:20:48', 'd8b93c55-86b3-4cea-b5d8-57c0ebb6ed4a'),
(34, 34, 1, 'order-form', 'order', 1, '2019-11-20 10:20:48', '2019-11-20 10:20:48', '4d98cba2-3525-4c95-81e4-0ae1353f760e'),
(35, 35, 1, NULL, NULL, 1, '2019-11-20 10:20:48', '2019-11-20 10:20:48', '371126c2-c600-499e-806b-88680e08e773'),
(36, 36, 1, NULL, NULL, 1, '2019-11-20 10:20:48', '2019-11-20 10:20:48', '63458293-8171-42f1-abec-72be264fc54b'),
(37, 37, 1, 'order-form', 'order', 1, '2019-11-20 10:20:48', '2019-11-20 10:20:48', '66317f27-d1f9-492f-bd51-94dcd0157fab'),
(38, 38, 1, NULL, NULL, 1, '2019-11-20 10:20:48', '2019-11-20 10:20:48', '6eece8ec-621e-4815-a7f4-968cdfde2d95'),
(39, 39, 1, NULL, NULL, 1, '2019-11-20 10:20:48', '2019-11-20 10:20:48', 'ef9186da-e3e7-4f28-af01-1975181bd0a4'),
(40, 40, 1, 'order-form', 'order', 1, '2019-11-20 10:20:48', '2019-11-20 10:20:48', '08a53b2b-315b-4e50-8c22-7ca0a5e4b3bf'),
(41, 41, 1, NULL, NULL, 1, '2019-11-20 10:20:48', '2019-11-20 10:20:48', 'a77567e3-33fa-4e62-8f5f-cc6319bde171'),
(42, 42, 1, NULL, NULL, 1, '2019-11-20 10:20:48', '2019-11-20 10:20:48', 'a4bc29db-41c6-4cfe-ba5b-d0ae9065fe0b'),
(43, 43, 1, 'order-form', 'order', 1, '2019-11-20 10:20:48', '2019-11-20 10:20:48', '27bc7b80-04a0-4443-abf4-4e1e997061a1'),
(44, 44, 1, NULL, NULL, 1, '2019-11-20 10:20:48', '2019-11-20 10:20:48', '66df7708-bd21-4874-902f-ab8f7ab3f4ab'),
(45, 45, 1, NULL, NULL, 1, '2019-11-20 10:20:48', '2019-11-20 10:20:48', 'a8eb15f1-c073-4798-904e-203ca3f0f6bc'),
(46, 46, 1, 'order-form', 'order', 1, '2019-11-20 10:20:48', '2019-11-20 10:20:48', '0a177ccf-7430-46db-9361-9240b3ad7a47'),
(47, 47, 1, NULL, NULL, 1, '2019-11-20 10:20:48', '2019-11-20 10:20:48', '9725fcc6-7062-48a8-b0a9-cb41e970591a'),
(48, 48, 1, NULL, NULL, 1, '2019-11-20 10:20:48', '2019-11-20 10:20:48', '5b4b3c94-b96c-4533-a446-04be618fb1be'),
(49, 49, 1, 'order-form', 'order', 1, '2019-11-20 10:20:48', '2019-11-20 10:20:48', '1c5b4a49-085b-4b24-a704-5e889c5ff315'),
(50, 50, 1, NULL, NULL, 1, '2019-11-20 10:20:48', '2019-11-20 10:20:48', '5a488f19-14f4-456a-93fa-95f9d82855bd'),
(51, 51, 1, NULL, NULL, 1, '2019-11-20 10:20:48', '2019-11-20 10:20:48', '25b86a21-6944-4500-903b-7ad0c666c8cd'),
(52, 52, 1, 'order-form', 'order', 1, '2019-11-20 10:20:48', '2019-11-20 10:20:48', 'd1b1142a-09b1-4772-9592-0c0d25be428d'),
(53, 53, 1, NULL, NULL, 1, '2019-11-20 10:20:48', '2019-11-20 10:20:48', '91f284d9-ea2f-4d39-b47b-ec0b2d7ad7eb'),
(54, 54, 1, NULL, NULL, 1, '2019-11-20 10:20:48', '2019-11-20 10:20:48', '3eae6819-b940-4b0b-8e50-5184666ed63d'),
(55, 55, 1, 'order-form', 'order', 1, '2019-11-20 10:20:48', '2019-11-20 10:20:48', '36085b6d-073f-4bf5-8429-f626e86124dd'),
(56, 56, 1, NULL, NULL, 1, '2019-11-20 10:20:48', '2019-11-20 10:20:48', '07c35646-1cfc-4450-b701-068914f9fc0d'),
(57, 57, 1, NULL, NULL, 1, '2019-11-20 10:20:48', '2019-11-20 10:20:48', 'd8355172-4a53-4686-ba00-fd4a113ccf75'),
(58, 58, 1, 'order-form', 'order', 1, '2019-11-20 10:20:48', '2019-11-20 10:20:48', '52e1a8cd-7820-4e35-b86c-acdaa945a64f'),
(59, 59, 1, NULL, NULL, 1, '2019-11-20 10:20:48', '2019-11-20 10:20:48', '28a40326-ca20-4388-be0c-eb7ef5b58372'),
(60, 60, 1, NULL, NULL, 1, '2019-11-20 10:20:48', '2019-11-20 10:20:48', '8877185e-b635-4cbc-9aac-56814f16eab2'),
(61, 61, 1, 'order-form', 'order', 1, '2019-11-20 10:20:48', '2019-11-20 10:20:48', 'ba4d7eb5-400d-4e18-90db-b4a3f13f087a'),
(62, 62, 1, NULL, NULL, 1, '2019-11-20 10:20:48', '2019-11-20 10:20:48', 'a0bd39cb-8463-437e-899a-361bde30e372'),
(63, 63, 1, NULL, NULL, 1, '2019-11-20 10:20:48', '2019-11-20 10:20:48', '4182e0e0-b369-4fd9-95ad-356a946c35ae'),
(64, 64, 1, 'order-form', 'order', 1, '2019-11-20 10:20:48', '2019-11-20 10:20:48', '41fe6e7d-944f-4825-822a-aed28c8534c1'),
(65, 65, 1, NULL, NULL, 1, '2019-11-20 10:20:48', '2019-11-20 10:20:48', 'f2573a47-2688-48be-ad0d-518917606cc4'),
(66, 66, 1, NULL, NULL, 1, '2019-11-20 10:20:48', '2019-11-20 10:20:48', '5ecfc808-57f2-46df-a0e4-a65e2f04b276'),
(67, 67, 1, 'order-form', 'order', 1, '2019-11-20 10:20:48', '2019-11-20 10:20:48', '36eb43a3-13b9-4d91-ba16-762d57108695'),
(68, 68, 1, NULL, NULL, 1, '2019-11-20 10:20:48', '2019-11-20 10:20:48', 'a97b98c7-8b11-49ca-9755-dd0fe44e6b4c'),
(69, 69, 1, NULL, NULL, 1, '2019-11-20 10:20:48', '2019-11-20 10:20:48', '8d24e2d3-056c-40a2-9028-f08cfb52b0d5'),
(70, 70, 1, 'order-form', 'order', 1, '2019-11-20 10:20:48', '2019-11-20 10:20:48', 'abfa1718-1971-479a-8e5a-b93175d05374'),
(71, 71, 1, NULL, NULL, 1, '2019-11-20 10:20:48', '2019-11-20 10:20:48', '6e740dbf-3baa-438b-aac4-7648916a4048'),
(72, 72, 1, NULL, NULL, 1, '2019-11-20 10:20:48', '2019-11-20 10:20:48', '92b165df-9168-49b9-98a7-9d8e7d9f1b73'),
(73, 73, 1, 'salmon', 'products/salmon', 1, '2019-11-20 10:20:48', '2019-11-20 10:20:48', '9afa1921-b6c4-4d34-9dba-f81943d2c5d7'),
(74, 74, 1, 'order-form', 'order', 1, '2019-11-20 10:31:28', '2019-11-20 10:31:28', '5174dfb4-d6d9-4808-a66d-1b2c85e54a94'),
(75, 75, 1, NULL, NULL, 1, '2019-11-20 10:31:28', '2019-11-20 10:31:28', '154faa11-bd19-484d-8c5e-ab13d9bc3a6d'),
(76, 76, 1, NULL, NULL, 1, '2019-11-20 10:31:28', '2019-11-20 10:31:28', '6e064db2-73c3-4bbb-9c8e-7ef2c58d0ddd'),
(77, 77, 1, 'contact', 'contact', 1, '2019-11-20 10:33:17', '2019-11-20 10:33:17', 'd0c25c5b-84c1-4b57-a87e-9fdbb05b547b'),
(78, 78, 1, 'contact', 'contact', 1, '2019-11-20 10:33:17', '2019-11-20 10:33:17', '3eb68071-76e8-440d-b332-559a837b01d5'),
(79, 79, 1, 'home', '__home__', 1, '2019-11-20 10:33:23', '2019-11-20 10:33:23', '05838322-815c-401c-88b9-76d6039cd573'),
(80, 80, 1, NULL, NULL, 1, '2019-11-20 10:33:23', '2019-11-20 10:33:23', '382d22d2-9236-4b1e-8423-81a988ce4e08'),
(81, 81, 1, NULL, NULL, 1, '2019-11-20 10:33:23', '2019-11-20 10:33:23', 'd0570fe0-d82b-412a-9297-751a2d65b2fb'),
(82, 82, 1, NULL, NULL, 1, '2019-11-20 10:33:23', '2019-11-20 10:33:23', '37b7b3f7-9109-419d-a6fc-c0c53f32593e'),
(83, 83, 1, 'order-form', 'order', 1, '2019-11-20 10:35:01', '2019-11-20 10:35:01', 'b63227cb-020d-4447-8f2e-01eb1112e00b'),
(84, 84, 1, NULL, NULL, 1, '2019-11-20 10:35:01', '2019-11-20 10:35:01', '8dad45d0-aa31-4144-88b5-a08621149a89'),
(85, 85, 1, NULL, NULL, 1, '2019-11-20 10:35:01', '2019-11-20 10:35:01', '5f0995fc-156a-4fdc-9185-9e2dd3b0e4ec'),
(86, 86, 1, 'salmon', 'products/salmon', 1, '2019-11-20 10:49:15', '2019-11-20 10:49:15', 'd4759412-aca8-4bae-aa89-d5494760ec6a'),
(87, 87, 1, 'salmon', 'products/salmon', 1, '2019-11-20 10:50:37', '2019-11-20 10:50:37', '440bf3ee-b2bf-4ede-8690-b29be7947cce'),
(88, 88, 1, 'salmon', 'products/salmon', 1, '2019-11-23 00:51:49', '2019-11-23 00:51:49', '90dc0490-1508-442d-9862-517f8f9c490f'),
(89, 89, 1, 'salmon', 'products/salmon', 1, '2019-11-23 00:54:32', '2019-11-23 00:54:32', '499bf90c-83f4-4f34-aa6c-85b6d2da481c'),
(90, 90, 1, 'home', '__home__', 1, '2019-11-23 00:54:46', '2019-11-23 00:54:46', 'a34bcba0-1e7a-42ee-a0ec-5138c45143fc'),
(91, 91, 1, NULL, NULL, 1, '2019-11-23 00:54:46', '2019-11-23 00:54:46', '25ebd440-ede0-417e-a15f-313a3a00eb91'),
(92, 92, 1, NULL, NULL, 1, '2019-11-23 00:54:46', '2019-11-23 00:54:46', '74d0510d-e634-4b94-8a39-74726d990359'),
(93, 93, 1, NULL, NULL, 1, '2019-11-23 00:54:46', '2019-11-23 00:54:46', 'ded874d7-86b0-4bf9-bc75-25d04bae5394'),
(94, 94, 1, 'home', '__home__', 1, '2019-11-23 01:10:56', '2019-11-23 01:10:56', '29c02425-5378-40e9-8323-b7621d6cc775'),
(95, 95, 1, NULL, NULL, 1, '2019-11-23 01:10:56', '2019-11-23 01:10:56', '66fd5a87-d4cc-4184-b340-c59d7fcc871e'),
(96, 96, 1, NULL, NULL, 1, '2019-11-23 01:10:56', '2019-11-23 01:10:56', '8d6c2de2-b346-4757-ac9a-21f36c54921f'),
(97, 97, 1, NULL, NULL, 1, '2019-11-23 01:10:56', '2019-11-23 01:10:56', '0f40e118-7b94-48e0-a998-b69df497560f'),
(98, 98, 1, 'salmon', 'products/salmon', 1, '2019-11-23 01:16:07', '2019-11-23 01:16:07', '253b6273-ca1c-440d-8ff8-4674709fa750'),
(99, 99, 1, 'salmon', 'products/salmon', 1, '2019-11-23 01:16:38', '2019-11-23 01:16:38', '112a41ce-a4f0-4bfd-80c4-051312d0ece5'),
(102, 102, 1, NULL, NULL, 1, '2019-11-23 01:21:42', '2019-11-23 01:21:42', 'b77103c0-59cc-4132-824e-9bf9973773aa'),
(103, 103, 1, 'home', '__home__', 1, '2019-11-23 01:21:43', '2019-11-23 01:21:43', '29d7f882-e4b7-4fd3-ab79-5f745819045b'),
(104, 104, 1, NULL, NULL, 1, '2019-11-23 01:21:43', '2019-11-23 01:21:43', '22d3481c-48ed-4f28-b599-5abb48444686'),
(105, 105, 1, NULL, NULL, 1, '2019-11-23 01:21:43', '2019-11-23 01:21:43', 'fa12f844-1f6c-484c-aa87-b90af85775c4'),
(106, 106, 1, NULL, NULL, 1, '2019-11-23 01:21:43', '2019-11-23 01:21:43', '04a0a158-fad9-4f43-b5d8-36c6e48d6490'),
(107, 107, 1, NULL, NULL, 1, '2019-11-23 01:21:43', '2019-11-23 01:21:43', '6aca731d-16bb-479e-b159-322968fdef01'),
(109, 109, 1, NULL, NULL, 1, '2019-11-23 01:25:17', '2019-11-23 01:25:17', 'b0c41daf-7da7-49fa-8463-e522709e26d9'),
(110, 110, 1, 'home', '__home__', 1, '2019-11-23 01:25:17', '2019-11-23 01:25:17', '96fe92ca-8661-42f2-8f07-d39d54243a1c'),
(111, 111, 1, NULL, NULL, 1, '2019-11-23 01:25:17', '2019-11-23 01:25:17', '718a1539-6b45-40cc-9f4e-3ffdb5db95dd'),
(112, 112, 1, NULL, NULL, 1, '2019-11-23 01:25:17', '2019-11-23 01:25:17', '661aba6c-bae8-4662-97be-28977ba46607'),
(113, 113, 1, NULL, NULL, 1, '2019-11-23 01:25:17', '2019-11-23 01:25:17', 'bb2a9d6c-1012-4349-83b1-754a69e93990'),
(114, 114, 1, NULL, NULL, 1, '2019-11-23 01:25:17', '2019-11-23 01:25:17', '2d3f632c-74b5-40fe-b4e7-662d494958e6'),
(115, 115, 1, NULL, NULL, 1, '2019-11-23 01:25:17', '2019-11-23 01:25:17', 'd685bbfa-3f19-40b8-9d9c-b67c47fd4914'),
(116, 116, 1, 'salmon-is-in', 'news/__temp_JwE9I2TodDxPZVpx312puYZk8HDKSBmHmox6', 1, '2019-11-23 01:32:29', '2019-11-23 01:32:38', '52d1fffd-514b-4bde-90ea-13f5b8494c86'),
(118, 118, 1, 'we-have-new-salmon', 'news/we-have-new-salmon', 1, '2019-11-23 01:36:10', '2019-11-23 01:36:10', '10b52347-b356-46c2-9463-3ce690329e6d'),
(119, 119, 1, 'we-have-new-salmon', 'news/we-have-new-salmon', 1, '2019-11-23 01:36:10', '2019-11-23 01:36:10', 'd4c1de08-7d8b-4823-b71e-1b14a05bb5a5'),
(121, 121, 1, 'we-have-new-salmom', 'news/we-have-new-salmom', 1, '2019-11-23 01:37:36', '2019-11-23 01:37:36', 'ab6ce206-953d-40b9-914b-b9406e39aca4'),
(122, 122, 1, 'we-have-new-salmom', 'news/we-have-new-salmom', 1, '2019-11-23 01:37:36', '2019-11-23 01:37:36', '50d7e4ff-13ee-4741-ab2a-ad8566f6148a'),
(124, 124, 1, 'we-have-more-new-lamomnon', 'news/we-have-more-new-lamomnon', 1, '2019-11-23 01:38:40', '2019-11-23 01:38:40', '5342796e-5379-4085-ae1c-15bfb6ab1d1b'),
(125, 125, 1, 'we-have-more-new-lamomnon', 'news/we-have-more-new-lamomnon', 1, '2019-11-23 01:38:40', '2019-11-23 01:38:40', 'c2cb5b15-4cfc-4c7c-9645-7c74a55936fc'),
(126, 126, 1, 'home', '__home__', 1, '2019-11-23 01:39:52', '2019-11-23 01:39:52', '3fd2ae5e-e2e2-4c60-b499-dbe005b3f2d4'),
(127, 127, 1, NULL, NULL, 1, '2019-11-23 01:39:52', '2019-11-23 01:39:52', 'f10836a1-9262-4443-828b-97df50c1bda1'),
(128, 128, 1, NULL, NULL, 1, '2019-11-23 01:39:52', '2019-11-23 01:39:52', '2b02cc74-5d0f-4c73-b811-802804ccb178'),
(129, 129, 1, NULL, NULL, 1, '2019-11-23 01:39:52', '2019-11-23 01:39:52', '80dafaea-3574-48e8-89fe-2a4e17e3bf73'),
(130, 130, 1, NULL, NULL, 1, '2019-11-23 01:39:52', '2019-11-23 01:39:52', '17a23ca9-0c24-49db-b86e-e8eb6de28533'),
(131, 131, 1, NULL, NULL, 1, '2019-11-23 01:39:52', '2019-11-23 01:39:52', '122bf2eb-5333-48f0-b3b6-4fa6acd170a1'),
(133, 133, 1, 'titlw', 'news/titlw', 1, '2019-11-23 01:41:35', '2019-11-23 01:41:35', '552c4568-4729-4c49-b7db-94d022d18bf6'),
(134, 134, 1, 'titlw', 'news/titlw', 1, '2019-11-23 01:41:35', '2019-11-23 01:41:35', '9a30986c-079b-44a7-8ace-8ca82fcacd14'),
(135, 135, 1, NULL, NULL, 1, '2019-11-23 01:41:52', '2019-11-23 01:41:52', 'cc7a4953-4639-4146-986f-7fc745f33062'),
(136, 136, 1, 'home', '__home__', 1, '2019-11-23 01:41:52', '2019-11-23 01:41:52', '5638b00f-e494-48b5-9101-2481fc7cc302'),
(137, 137, 1, NULL, NULL, 1, '2019-11-23 01:41:52', '2019-11-23 01:41:52', '376e1f1e-3478-4012-99a5-13937deac58f'),
(138, 138, 1, NULL, NULL, 1, '2019-11-23 01:41:52', '2019-11-23 01:41:52', 'b9e232d5-f560-454f-8e43-7b224e091b2f'),
(139, 139, 1, NULL, NULL, 1, '2019-11-23 01:41:52', '2019-11-23 01:41:52', '203239ea-d49a-4be2-ae8a-c32058143e53'),
(140, 140, 1, NULL, NULL, 1, '2019-11-23 01:41:52', '2019-11-23 01:41:52', '76ca24ee-91b7-409e-a6a1-67c8271578aa'),
(141, 141, 1, NULL, NULL, 1, '2019-11-23 01:41:52', '2019-11-23 01:41:52', 'cc7691a6-6d21-4f21-ab7c-43879dcb8900'),
(142, 142, 1, NULL, NULL, 1, '2019-11-23 01:41:52', '2019-11-23 01:41:52', '7edd907d-a36c-43eb-8b92-37716e7f7d54'),
(144, 144, 1, 'test', 'news/test', 1, '2019-11-23 01:48:17', '2019-11-23 01:48:17', 'd545bcba-a3f3-4171-b2d4-3fab072faf69'),
(145, 145, 1, 'test', 'news/test', 1, '2019-11-23 01:48:17', '2019-11-23 01:48:17', 'b67262f2-daab-4175-8444-a7976480a623'),
(147, 147, 1, 'title', 'news/title', 1, '2019-11-23 01:49:08', '2019-11-23 01:49:08', '4c9da8a7-2ea5-4333-92aa-61319254e77c'),
(148, 148, 1, 'title', 'news/title', 1, '2019-11-23 01:49:08', '2019-11-23 01:49:08', '654ece78-adbb-4e67-ab00-46bb96e94a82'),
(149, 149, 1, NULL, NULL, 1, '2019-11-23 01:49:57', '2019-11-23 01:49:57', '4825cc40-2b32-44e6-8ab2-5d653f8cfeff'),
(150, 150, 1, 'home', '__home__', 1, '2019-11-23 01:49:57', '2019-11-23 01:49:57', 'd4b997f5-aa93-4085-aca5-27266b76d0c3'),
(151, 151, 1, NULL, NULL, 1, '2019-11-23 01:49:57', '2019-11-23 01:49:57', '24875d5b-fdc9-40ad-a304-f41237821b6c'),
(152, 152, 1, NULL, NULL, 1, '2019-11-23 01:49:57', '2019-11-23 01:49:57', 'b727d363-fcf4-465f-bc40-44e3cf2c0414'),
(153, 153, 1, NULL, NULL, 1, '2019-11-23 01:49:57', '2019-11-23 01:49:57', '6ff03f96-ceb9-4081-9b40-9241b7a0ee40'),
(154, 154, 1, NULL, NULL, 1, '2019-11-23 01:49:57', '2019-11-23 01:49:57', '3733b725-cab9-4e6a-afe4-ccd52e6bc183'),
(155, 155, 1, NULL, NULL, 1, '2019-11-23 01:49:57', '2019-11-23 01:49:57', '845c927c-546f-4ce8-bd87-9f2a6af4abd6'),
(156, 156, 1, NULL, NULL, 1, '2019-11-23 01:49:57', '2019-11-23 01:49:57', 'e1592435-d313-4bcd-8775-49cd579eff19'),
(157, 157, 1, NULL, NULL, 1, '2019-11-23 01:49:57', '2019-11-23 01:49:57', 'ccf9b28c-a48b-4744-bd5e-5edd1e191c0c'),
(159, 159, 1, 'ejoi', 'news/ejoi', 1, '2019-11-23 02:04:27', '2019-11-23 02:04:27', '57439488-cfbf-4620-be65-f037283f4646'),
(160, 160, 1, 'ejoi', 'news/ejoi', 1, '2019-11-23 02:04:27', '2019-11-23 02:04:27', '9fcddad0-34ea-44ca-9670-590357881dcc'),
(161, 161, 1, '__temp_AC0PnEIWLftdcTRH3GZJQkzL9m1goSdA5tu1', 'news/__temp_AC0PnEIWLftdcTRH3GZJQkzL9m1goSdA5tu1', 1, '2019-11-23 02:09:39', '2019-11-23 02:09:39', '3881b13a-37e9-47e8-b658-17b256fff103'),
(163, 163, 1, 'tes', 'news/tes', 1, '2019-11-23 02:09:50', '2019-11-23 02:09:50', '73ea090b-4438-4534-bc7e-2f90641e79cc'),
(164, 164, 1, 'tes', 'news/tes', 1, '2019-11-23 02:09:50', '2019-11-23 02:09:50', '4a418382-370a-4cca-8e66-ae61c37eb9ec'),
(166, 166, 1, 'tes-1', 'news/tes-1', 1, '2019-11-23 02:12:05', '2019-11-23 02:12:05', '75815e10-833a-4607-ae8a-6f0fcd2786ad'),
(167, 167, 1, 'tes-1', 'news/tes-1', 1, '2019-11-23 02:12:05', '2019-11-23 02:12:05', 'bce952f7-bf40-418f-9e5d-b129a747cf0d'),
(169, 169, 1, 'e', 'news/e', 1, '2019-11-23 02:13:51', '2019-11-23 02:13:51', '2754f52a-3d88-4c6e-a70a-0c463f053244'),
(170, 170, 1, 'e', 'news/e', 1, '2019-11-23 02:13:51', '2019-11-23 02:13:51', '559665de-cade-4184-854f-25d503ac8587'),
(172, 172, 1, 'q', 'news/q', 1, '2019-11-23 02:14:34', '2019-11-23 02:14:34', '8c1de585-103d-4fdf-ba2e-afb6cb7c54e8'),
(173, 173, 1, 'q', 'news/q', 1, '2019-11-23 02:14:34', '2019-11-23 02:14:34', '383ac919-53c8-401b-8e8b-138c2a61f946'),
(174, 174, 1, '__temp_6TdZBumVgqnGT27zsYh2clgiwmSTHzSHFkqp', 'news/__temp_6TdZBumVgqnGT27zsYh2clgiwmSTHzSHFkqp', 1, '2019-11-23 02:14:36', '2019-11-23 02:14:36', '11b880ff-f59d-4159-8096-673c0ebc5737'),
(176, 176, 1, 'tes-2', 'news/tes-2', 1, '2019-11-23 02:15:45', '2019-11-23 02:15:45', '9a0eda44-159e-48be-a16b-751294eb55de'),
(177, 177, 1, 'tes-2', 'news/tes-2', 1, '2019-11-23 02:15:45', '2019-11-23 02:15:45', 'ad3c5b25-d209-4490-a9df-ad1b81704cac'),
(179, 179, 1, 'test-1', 'news/test-1', 1, '2019-11-23 02:17:09', '2019-11-23 02:17:09', 'e27f7da3-2c8c-4018-9122-414429e5e042'),
(180, 180, 1, 'test-1', 'news/test-1', 1, '2019-11-23 02:17:09', '2019-11-23 02:17:09', '02c61ef8-4994-49c0-b24b-9b65e0aad66a'),
(181, 181, 1, NULL, NULL, 1, '2019-11-23 02:18:03', '2019-11-23 02:18:03', '4c4af866-54ba-45af-9233-9e242195ba72'),
(182, 182, 1, 'home', '__home__', 1, '2019-11-23 02:18:03', '2019-11-23 02:18:03', '4662427f-612c-4856-94e4-293bdda52f29'),
(183, 183, 1, NULL, NULL, 1, '2019-11-23 02:18:03', '2019-11-23 02:18:03', '3ffab8b7-277e-4e10-9c39-0a23826185e8'),
(184, 184, 1, NULL, NULL, 1, '2019-11-23 02:18:03', '2019-11-23 02:18:03', 'a3b7e75d-a7eb-45ec-94b8-8630f734a2c1'),
(185, 185, 1, NULL, NULL, 1, '2019-11-23 02:18:03', '2019-11-23 02:18:03', '209ef2be-d7d8-4094-85cf-890d2cf1bb79'),
(186, 186, 1, NULL, NULL, 1, '2019-11-23 02:18:03', '2019-11-23 02:18:03', '5b7b2843-dc41-466a-90f6-2fe728221bde'),
(187, 187, 1, NULL, NULL, 1, '2019-11-23 02:18:03', '2019-11-23 02:18:03', 'd9c814b2-e931-4071-a2e5-75d061437178'),
(188, 188, 1, NULL, NULL, 1, '2019-11-23 02:18:03', '2019-11-23 02:18:03', 'ea6372ad-8c8c-4030-8ebb-f79a774aa38c'),
(189, 189, 1, NULL, NULL, 1, '2019-11-23 02:18:03', '2019-11-23 02:18:03', '5948487f-1471-4a55-bbeb-5a7cd9e7c02f'),
(190, 190, 1, NULL, NULL, 1, '2019-11-23 02:18:03', '2019-11-23 02:18:03', '75a69ca3-0216-40da-a5ac-41708ce83267'),
(191, 191, 1, NULL, NULL, 1, '2019-11-23 02:37:30', '2019-11-23 02:37:30', 'f29e1e0a-5c85-4baa-acf0-502d11be3c59'),
(192, 192, 1, 'home', '__home__', 1, '2019-11-23 02:37:30', '2019-11-23 02:37:30', '8ec23278-094a-4eb3-88cc-bd002cf750a0'),
(193, 193, 1, NULL, NULL, 1, '2019-11-23 02:37:30', '2019-11-23 02:37:30', 'b9eb7697-50d4-489c-8392-fc19fd419082'),
(194, 194, 1, NULL, NULL, 1, '2019-11-23 02:37:30', '2019-11-23 02:37:30', '240f9d6d-9911-4c33-b5f5-7e59e0d77503'),
(195, 195, 1, NULL, NULL, 1, '2019-11-23 02:37:30', '2019-11-23 02:37:30', '08e31fad-0397-40bc-b33b-e5cfdda5fed3'),
(196, 196, 1, NULL, NULL, 1, '2019-11-23 02:37:30', '2019-11-23 02:37:30', '1d7d0f67-6550-4e18-8bf9-c208222d91d1'),
(197, 197, 1, NULL, NULL, 1, '2019-11-23 02:37:30', '2019-11-23 02:37:30', '3e4b0e2c-2d81-448e-978b-eb5c524b8e4f'),
(198, 198, 1, NULL, NULL, 1, '2019-11-23 02:37:30', '2019-11-23 02:37:30', 'ab567182-9a38-4b1b-9fd7-505c022b5feb'),
(199, 199, 1, NULL, NULL, 1, '2019-11-23 02:37:30', '2019-11-23 02:37:30', '5d5aed84-7cc3-460d-8ad1-f5597d4c895a'),
(200, 200, 1, NULL, NULL, 1, '2019-11-23 02:37:30', '2019-11-23 02:37:30', '6acb154e-e515-4346-9463-23f3c7b9970b'),
(201, 201, 1, NULL, NULL, 1, '2019-11-23 02:37:30', '2019-11-23 02:37:30', '84c2a0fe-652d-44bd-8474-b72a723cf761'),
(203, 203, 1, 'test2', 'products/test2', 1, '2019-11-23 02:37:38', '2019-11-23 02:37:38', 'e3e88d20-7f63-4823-9c18-f79700b901ef'),
(204, 204, 1, 'test2', 'products/test2', 1, '2019-11-23 02:37:38', '2019-11-23 02:37:38', '511c78ef-de71-4e83-93a1-cc4fc0dc9a6c'),
(205, 205, 1, NULL, NULL, 1, '2019-11-23 02:38:31', '2019-11-23 02:38:31', 'b5d1ebd1-dfe8-4de4-be62-c8a3b24c27c4'),
(206, 206, 1, 'home', '__home__', 1, '2019-11-23 02:38:31', '2019-11-23 02:38:31', '3ceb27c7-45c2-4bbc-8540-c9596fbec748'),
(207, 207, 1, NULL, NULL, 1, '2019-11-23 02:38:31', '2019-11-23 02:38:31', '05e0663e-9044-406c-b3f4-c2b9768fc929'),
(208, 208, 1, NULL, NULL, 1, '2019-11-23 02:38:31', '2019-11-23 02:38:31', '1f686a39-2806-40e6-9e66-89c92f496796'),
(209, 209, 1, NULL, NULL, 1, '2019-11-23 02:38:31', '2019-11-23 02:38:31', '0f98854b-4143-4bd1-a8a6-b0943c526e69'),
(210, 210, 1, NULL, NULL, 1, '2019-11-23 02:38:31', '2019-11-23 02:38:31', '4ae875d5-a6d0-497d-93ad-c4483c68f44d'),
(211, 211, 1, NULL, NULL, 1, '2019-11-23 02:38:31', '2019-11-23 02:38:31', '73c200ff-2394-472b-9e72-602de2e68045'),
(212, 212, 1, NULL, NULL, 1, '2019-11-23 02:38:31', '2019-11-23 02:38:31', '617dd446-bccc-4a5a-8641-b6093859ab32'),
(213, 213, 1, NULL, NULL, 1, '2019-11-23 02:38:31', '2019-11-23 02:38:31', '553a8295-7163-4b58-a06a-1a3a48c76aa7'),
(214, 214, 1, NULL, NULL, 1, '2019-11-23 02:38:31', '2019-11-23 02:38:31', '4804b68a-e94d-4728-877c-3dabdd0423a6'),
(215, 215, 1, NULL, NULL, 1, '2019-11-23 02:38:31', '2019-11-23 02:38:31', '5244016a-bbe5-4aed-868b-da1b67062f9e'),
(216, 216, 1, NULL, NULL, 1, '2019-11-23 02:38:31', '2019-11-23 02:38:31', '55b86959-54d6-43b2-b36b-a1488ce4edc5'),
(217, 217, 1, NULL, NULL, 1, '2019-11-23 02:39:26', '2019-11-23 02:39:26', 'ebcef5be-a482-45ef-868c-1c6efad000c4'),
(218, 218, 1, 'home', '__home__', 1, '2019-11-23 02:39:26', '2019-11-23 02:39:26', '0bb738e5-dfff-4db3-b0ac-3e5be8286ed8'),
(219, 219, 1, NULL, NULL, 1, '2019-11-23 02:39:26', '2019-11-23 02:39:26', '329e3183-a8b8-4bfc-b291-44516fa071e9'),
(220, 220, 1, NULL, NULL, 1, '2019-11-23 02:39:26', '2019-11-23 02:39:26', '80b559ee-0491-489b-89ae-2fc52d2c7858'),
(221, 221, 1, NULL, NULL, 1, '2019-11-23 02:39:26', '2019-11-23 02:39:26', 'e79fb532-1482-4773-b8b1-5dfcf1a5104e'),
(222, 222, 1, NULL, NULL, 1, '2019-11-23 02:39:27', '2019-11-23 02:39:27', '4ffd481d-dc44-431a-848a-b4ec4d9fd6d0'),
(223, 223, 1, NULL, NULL, 1, '2019-11-23 02:39:27', '2019-11-23 02:39:27', 'c23e89c0-c952-4cfc-8991-0f590a71ab64'),
(224, 224, 1, NULL, NULL, 1, '2019-11-23 02:39:27', '2019-11-23 02:39:27', '7c257b0c-3ae7-4b87-8c72-d4de7a7de8c0'),
(225, 225, 1, NULL, NULL, 1, '2019-11-23 02:39:27', '2019-11-23 02:39:27', '8d7aa64b-d0c5-40b3-b7f0-68eb41666da4'),
(226, 226, 1, NULL, NULL, 1, '2019-11-23 02:39:27', '2019-11-23 02:39:27', 'd2e7e0b2-1938-4bb5-b1e4-cab2af6dc958'),
(227, 227, 1, NULL, NULL, 1, '2019-11-23 02:39:27', '2019-11-23 02:39:27', '6c8ae11f-0650-4c25-854c-2b56abcfc916'),
(228, 228, 1, NULL, NULL, 1, '2019-11-23 02:39:27', '2019-11-23 02:39:27', 'e1fee9dd-28a4-4745-8148-7b9d72f0f94c'),
(229, 229, 1, NULL, NULL, 1, '2019-11-23 02:39:27', '2019-11-23 02:39:27', '462b29e8-d365-4db7-9d4d-00023df78bba'),
(230, 230, 1, NULL, NULL, 1, '2019-11-23 02:39:50', '2019-11-23 02:39:50', '9572b41f-b7fe-482e-a2f3-f81cad60c953'),
(231, 231, 1, 'home', '__home__', 1, '2019-11-23 02:39:50', '2019-11-23 02:39:50', 'b85a18f7-774b-42d5-a4fb-e25200e4e292'),
(232, 232, 1, NULL, NULL, 1, '2019-11-23 02:39:50', '2019-11-23 02:39:50', '8a3ebb27-f2d3-48aa-9721-bb596033a9da'),
(233, 233, 1, NULL, NULL, 1, '2019-11-23 02:39:50', '2019-11-23 02:39:50', '4c1d40a4-3586-4f7d-a10f-508a7396b587'),
(234, 234, 1, NULL, NULL, 1, '2019-11-23 02:39:50', '2019-11-23 02:39:50', '9c3c7068-8f14-4f61-b02b-6c9b665d53eb'),
(235, 235, 1, NULL, NULL, 1, '2019-11-23 02:39:50', '2019-11-23 02:39:50', '4c3ad28b-d7d5-4b57-9f47-b003365ab7f3'),
(236, 236, 1, NULL, NULL, 1, '2019-11-23 02:39:50', '2019-11-23 02:39:50', 'be003f62-9d85-48ee-b3e4-b96652a8e0b9'),
(237, 237, 1, NULL, NULL, 1, '2019-11-23 02:39:50', '2019-11-23 02:39:50', '4f1c4184-a450-4d61-b0a2-8123c1ee57c1'),
(238, 238, 1, NULL, NULL, 1, '2019-11-23 02:39:50', '2019-11-23 02:39:50', '05663dbe-481d-4af4-8e38-e30f3f7514ce'),
(239, 239, 1, NULL, NULL, 1, '2019-11-23 02:39:50', '2019-11-23 02:39:50', '26498731-0060-46c7-a39d-db80d684d894'),
(240, 240, 1, NULL, NULL, 1, '2019-11-23 02:39:50', '2019-11-23 02:39:50', 'c503ecee-986b-4164-bc35-12df7fd51f5d'),
(241, 241, 1, NULL, NULL, 1, '2019-11-23 02:39:50', '2019-11-23 02:39:50', 'fd59d939-8142-4e8e-8bab-29d5986f37f6'),
(242, 242, 1, NULL, NULL, 1, '2019-11-23 02:39:50', '2019-11-23 02:39:50', '8777c63c-32b4-466d-b5c0-53e14ac73df5'),
(243, 243, 1, NULL, NULL, 1, '2019-11-23 02:39:50', '2019-11-23 02:39:50', '53710c95-5e5c-47ef-b59f-b5bb6b748f05'),
(244, 244, 1, NULL, NULL, 1, '2019-11-23 05:13:35', '2019-11-23 05:13:35', '9c78e54c-2df4-40e5-bfa4-6170be54af1d'),
(245, 245, 1, 'home', '__home__', 1, '2019-11-23 05:13:35', '2019-11-23 05:13:35', '5488a888-3db0-440a-afcc-e10f6deeb5c9'),
(246, 246, 1, NULL, NULL, 1, '2019-11-23 05:13:35', '2019-11-23 05:13:35', 'a8d8f33a-e1ee-4866-92c8-b70e7d558f6a'),
(247, 247, 1, NULL, NULL, 1, '2019-11-23 05:13:35', '2019-11-23 05:13:35', 'e4178e7f-dfd7-45e9-9eca-6b4c787bb30d'),
(248, 248, 1, NULL, NULL, 1, '2019-11-23 05:13:35', '2019-11-23 05:13:35', '0f293173-cef3-46a5-827f-550e7ef3be42'),
(249, 249, 1, NULL, NULL, 1, '2019-11-23 05:13:35', '2019-11-23 05:13:35', '213e9a09-dcd1-4632-9f53-ac1669784b2b'),
(250, 250, 1, NULL, NULL, 1, '2019-11-23 05:13:35', '2019-11-23 05:13:35', '654bde0d-0de1-4a0b-9c16-5c4b62ec3011'),
(251, 251, 1, NULL, NULL, 1, '2019-11-23 05:13:35', '2019-11-23 05:13:35', '21a10b0e-3dde-4fd3-ada5-0b47d98e0964'),
(252, 252, 1, NULL, NULL, 1, '2019-11-23 05:13:35', '2019-11-23 05:13:35', 'f69fb994-2ae5-4ef7-a356-bbb99a8f53ac'),
(253, 253, 1, NULL, NULL, 1, '2019-11-23 05:13:35', '2019-11-23 05:13:35', 'bf2a46e5-2bec-4896-9fc2-5d44087c7ef1'),
(254, 254, 1, NULL, NULL, 1, '2019-11-23 05:13:35', '2019-11-23 05:13:35', '9eef162c-8e4a-43d9-94d5-31e6b5c3547c'),
(255, 255, 1, NULL, NULL, 1, '2019-11-23 05:13:35', '2019-11-23 05:13:35', 'e953895e-0bda-40c0-97ca-e47b49d71b05'),
(256, 256, 1, NULL, NULL, 1, '2019-11-23 05:13:35', '2019-11-23 05:13:35', 'cc98dd7f-47f1-4831-88eb-74b63b0c2adb'),
(257, 257, 1, NULL, NULL, 1, '2019-11-23 05:13:35', '2019-11-23 05:13:35', '42cc07d9-9872-4004-9dc7-f8adf4cb7528'),
(258, 258, 1, NULL, NULL, 1, '2019-11-23 05:13:35', '2019-11-23 05:13:35', 'ef2f5501-8391-4d6b-ab29-316c9f0cf494'),
(259, 259, 1, NULL, NULL, 1, '2019-11-23 05:14:04', '2019-11-23 05:14:04', '1146ab6a-c472-4ecf-8d46-42b55ca9d13d'),
(260, 260, 1, 'order-form', 'order', 1, '2019-11-23 05:14:04', '2019-11-23 05:14:04', 'd459a167-1b6f-40db-9ce9-e98c26d7906d'),
(261, 261, 1, NULL, NULL, 1, '2019-11-23 05:14:04', '2019-11-23 05:14:04', '2c805396-b031-4d53-8af1-5307a2c99d21'),
(262, 262, 1, NULL, NULL, 1, '2019-11-23 05:14:04', '2019-11-23 05:14:04', 'a2a1f49f-40e2-41eb-8f4a-9a96acf22cb2'),
(263, 263, 1, NULL, NULL, 1, '2019-11-23 05:14:04', '2019-11-23 05:14:04', '4bbabb47-9dce-40f1-adba-56db805b7426'),
(264, 264, 1, NULL, NULL, 1, '2019-11-23 05:14:22', '2019-11-23 05:14:22', '68522616-adb7-4c05-a3a4-cea7d11ce3d1'),
(265, 265, 1, 'home', '__home__', 1, '2019-11-23 05:14:22', '2019-11-23 05:14:22', 'cd08ab8d-82c3-4550-a396-2a15e1c18c21'),
(266, 266, 1, NULL, NULL, 1, '2019-11-23 05:14:22', '2019-11-23 05:14:22', 'ee52b6d1-955a-4a2b-b057-b3a8f8214c93'),
(267, 267, 1, NULL, NULL, 1, '2019-11-23 05:14:23', '2019-11-23 05:14:23', '8fdf30a8-3f20-4c12-bd69-e4fa857727b7'),
(268, 268, 1, NULL, NULL, 1, '2019-11-23 05:14:23', '2019-11-23 05:14:23', 'dd196029-cd9a-4b7c-8198-434eb777c387'),
(269, 269, 1, NULL, NULL, 1, '2019-11-23 05:14:23', '2019-11-23 05:14:23', 'ae115fd6-6a45-4688-8e81-d15a4a32ed4d'),
(270, 270, 1, NULL, NULL, 1, '2019-11-23 05:14:23', '2019-11-23 05:14:23', '05fb578e-2fdd-431a-bcc4-8efc43a2ed90'),
(271, 271, 1, NULL, NULL, 1, '2019-11-23 05:14:23', '2019-11-23 05:14:23', '8bb5eb54-53eb-40ea-94d8-9ac3864db8f1'),
(272, 272, 1, NULL, NULL, 1, '2019-11-23 05:14:23', '2019-11-23 05:14:23', '9de681b5-c05d-4e2b-83b4-34cc8e27193e'),
(273, 273, 1, NULL, NULL, 1, '2019-11-23 05:14:23', '2019-11-23 05:14:23', '15cb6c3d-3dba-470d-8dcd-4ad61251ebd9'),
(274, 274, 1, NULL, NULL, 1, '2019-11-23 05:14:23', '2019-11-23 05:14:23', '9d26dfcf-ca66-4030-9c56-2cabdf688b37'),
(275, 275, 1, NULL, NULL, 1, '2019-11-23 05:14:23', '2019-11-23 05:14:23', 'e77a28bd-dcb5-4c3d-b8a5-7f4d7587a95d'),
(276, 276, 1, NULL, NULL, 1, '2019-11-23 05:14:23', '2019-11-23 05:14:23', 'a49fc584-803d-46b0-9bbf-9e0b005378ef'),
(277, 277, 1, NULL, NULL, 1, '2019-11-23 05:14:23', '2019-11-23 05:14:23', '53797060-d65b-4af2-b7cb-ad31ed52a5d9'),
(278, 278, 1, NULL, NULL, 1, '2019-11-23 05:14:23', '2019-11-23 05:14:23', 'be191dcb-9df7-4b8d-8733-03aa63096f32'),
(279, 279, 1, NULL, NULL, 1, '2019-11-23 05:14:23', '2019-11-23 05:14:23', 'c7135057-1169-42f2-acaa-05bdd6696cb9'),
(280, 280, 1, 'titlw', 'news/titlw', 1, '2019-11-23 05:17:18', '2019-11-23 05:17:18', '1a1d9acb-e6bb-4aa1-86fb-86e0e4f59242'),
(282, 282, 1, 'test-2', 'news/test-2', 1, '2019-11-23 05:17:45', '2019-11-23 05:17:45', '32d658f1-80b9-42c6-bd66-76e99b432616'),
(283, 283, 1, 'test-2', 'news/test-2', 1, '2019-11-23 05:17:45', '2019-11-23 05:17:45', '6d93767f-b388-47bc-8d30-690e7411299a'),
(285, 285, 1, 'test-3', 'news/test-3', 1, '2019-11-23 05:18:47', '2019-11-23 05:18:47', '497b3569-6f57-4dcc-8c5e-2e550e8f24cd'),
(286, 286, 1, 'test-3', 'news/test-3', 1, '2019-11-23 05:18:47', '2019-11-23 05:18:47', '6bd7e4d0-eccd-407a-9745-6e0fe1f79a06'),
(287, 287, 1, '__temp_J4u5akjisfHaAMjzFLsC7deLJJYs9RZZy2ij', 'news/__temp_J4u5akjisfHaAMjzFLsC7deLJJYs9RZZy2ij', 1, '2019-11-23 05:29:34', '2019-11-23 05:29:34', 'be4ea174-2ad1-480b-906e-14ea23f36643'),
(289, 289, 1, 'rest', 'news/rest', 1, '2019-11-23 05:29:43', '2019-11-23 05:29:43', '99aa8265-4b15-43aa-a537-fd7a0f485a48'),
(290, 290, 1, 'rest', 'news/rest', 1, '2019-11-23 05:29:43', '2019-11-23 05:29:43', 'b26f5b80-541b-4129-939f-27cc8254d19e'),
(292, 292, 1, 'era', 'products/era', 1, '2019-11-23 05:33:45', '2019-11-23 05:33:45', '02b3d7bd-7566-4dec-b1ae-d1055c9aa436'),
(293, 293, 1, 'era', 'products/era', 1, '2019-11-23 05:33:45', '2019-11-23 05:33:45', 'a0be099d-d01f-4a07-b184-52fd384e1242'),
(295, 295, 1, 'wefw', 'products/wefw', 1, '2019-11-23 05:34:41', '2019-11-23 05:34:41', '5f5837af-c8cd-4fe6-a253-58ee5e623532'),
(296, 296, 1, 'wefw', 'products/wefw', 1, '2019-11-23 05:34:41', '2019-11-23 05:34:41', '0979e6ac-083f-4e01-bed7-dfa6d195fa5d'),
(298, 298, 1, 'wew', 'products/wew', 1, '2019-11-23 05:36:12', '2019-11-23 05:36:12', '1dd74e95-bb5c-414f-9518-3ff498f8018c'),
(299, 299, 1, 'wew', 'products/wew', 1, '2019-11-23 05:36:12', '2019-11-23 05:36:12', '0d8ac1ce-aaf4-422a-9aa6-113be7f34053'),
(301, 301, 1, 'qwdqw', 'products/qwdqw', 1, '2019-11-23 05:37:57', '2019-11-23 05:37:57', 'd850ca38-cc5c-4294-b420-38be1c169998'),
(302, 302, 1, 'qwdqw', 'products/qwdqw', 1, '2019-11-23 05:37:57', '2019-11-23 05:37:57', '13a45dab-1634-4f8f-be1e-eefc3046756a'),
(303, 303, 1, 'wew', 'products/wew', 1, '2019-11-23 05:38:00', '2019-11-23 05:38:00', 'bbb1c280-efdb-4026-8dc7-0a18d49d043d'),
(304, 304, 1, NULL, NULL, 1, '2019-11-23 05:38:10', '2019-11-23 05:38:10', '2c4bacd8-2108-460c-ac91-5c69fb18e66c'),
(305, 305, 1, 'home', '__home__', 1, '2019-11-23 05:38:10', '2019-11-23 05:38:10', '87b886fd-78af-488a-bf1b-e871099d135b'),
(306, 306, 1, NULL, NULL, 1, '2019-11-23 05:38:10', '2019-11-23 05:38:10', '8120ff4d-ba57-4821-b23e-25a50ab6262a'),
(307, 307, 1, NULL, NULL, 1, '2019-11-23 05:38:10', '2019-11-23 05:38:10', 'a64e9279-cc5e-406a-b840-473e28cdc8c5'),
(308, 308, 1, NULL, NULL, 1, '2019-11-23 05:38:10', '2019-11-23 05:38:10', 'dc8d26a9-4fad-401f-b748-d8526bf607af'),
(309, 309, 1, NULL, NULL, 1, '2019-11-23 05:38:10', '2019-11-23 05:38:10', 'af688e14-0c25-4e59-81f4-be3dd10174ac'),
(310, 310, 1, NULL, NULL, 1, '2019-11-23 05:38:10', '2019-11-23 05:38:10', '57291d0f-5d6a-4969-9d3d-d4cac1c27edc'),
(311, 311, 1, NULL, NULL, 1, '2019-11-23 05:38:10', '2019-11-23 05:38:10', '412f8828-3754-43ad-a1f6-7a8bf4f21ee6'),
(312, 312, 1, NULL, NULL, 1, '2019-11-23 05:38:10', '2019-11-23 05:38:10', 'f658d407-c83d-4091-a9b7-298dbe735438'),
(313, 313, 1, NULL, NULL, 1, '2019-11-23 05:38:10', '2019-11-23 05:38:10', '97e20e89-34ad-4142-a5bb-0f63b78b24f9'),
(314, 314, 1, NULL, NULL, 1, '2019-11-23 05:38:10', '2019-11-23 05:38:10', '30fc545d-4c65-41db-9905-053696f23fb3'),
(315, 315, 1, NULL, NULL, 1, '2019-11-23 05:38:10', '2019-11-23 05:38:10', 'ebdd9148-0297-4bf4-89ab-bbe114d81948'),
(316, 316, 1, NULL, NULL, 1, '2019-11-23 05:38:10', '2019-11-23 05:38:10', '20a83124-f380-40aa-9992-a5a54c09cb5f'),
(317, 317, 1, NULL, NULL, 1, '2019-11-23 05:38:10', '2019-11-23 05:38:10', '9ac729bc-72c5-4c68-8db2-72b9299ec2cc'),
(318, 318, 1, NULL, NULL, 1, '2019-11-23 05:38:10', '2019-11-23 05:38:10', '28b49997-9847-4a6f-b089-7e028ea48e0a'),
(319, 319, 1, NULL, NULL, 1, '2019-11-23 05:38:10', '2019-11-23 05:38:10', 'a6346c94-dd7e-4824-9d6d-94eb8126b846'),
(320, 320, 1, NULL, NULL, 1, '2019-11-23 05:38:10', '2019-11-23 05:38:10', '3e4fff8c-d5b4-4057-87e3-44528be27268'),
(321, 321, 1, NULL, NULL, 1, '2019-11-23 05:45:25', '2019-11-23 05:45:25', '11934c99-116d-4a9c-9e37-c8b1c4f1c21f'),
(322, 322, 1, 'home', '__home__', 1, '2019-11-23 05:45:25', '2019-11-23 05:45:25', '6aeecc7d-fc0d-419b-b30b-883f76396cf4'),
(323, 323, 1, NULL, NULL, 1, '2019-11-23 05:45:25', '2019-11-23 05:45:25', '849e0351-166d-47b7-aae0-02dddcb7b9d4'),
(324, 324, 1, NULL, NULL, 1, '2019-11-23 05:45:25', '2019-11-23 05:45:25', '953cd086-33a5-456a-825b-a42358dd1f77'),
(325, 325, 1, NULL, NULL, 1, '2019-11-23 05:45:25', '2019-11-23 05:45:25', '36d7fb1e-633f-47b9-b086-45a051dbd1f8'),
(326, 326, 1, NULL, NULL, 1, '2019-11-23 05:45:25', '2019-11-23 05:45:25', '5ec44f50-60c6-4e6b-87c8-1393827c5261'),
(327, 327, 1, NULL, NULL, 1, '2019-11-23 05:45:25', '2019-11-23 05:45:25', '61e87e0c-1edc-48c7-a9ab-dd5a43f08cd1'),
(328, 328, 1, NULL, NULL, 1, '2019-11-23 05:45:25', '2019-11-23 05:45:25', '5c8e8edd-9ebb-4b0d-9933-cc29830bd4a4'),
(329, 329, 1, NULL, NULL, 1, '2019-11-23 05:45:25', '2019-11-23 05:45:25', '3bf3c27c-f691-4fc2-b50d-f9630dfe774f'),
(330, 330, 1, NULL, NULL, 1, '2019-11-23 05:45:25', '2019-11-23 05:45:25', 'b43b7581-457e-4913-bed6-27ef5904a466'),
(331, 331, 1, NULL, NULL, 1, '2019-11-23 05:45:25', '2019-11-23 05:45:25', '17387757-d1cb-4e83-8cb1-d198fc456b3d'),
(332, 332, 1, NULL, NULL, 1, '2019-11-23 05:45:25', '2019-11-23 05:45:25', '76730277-9431-4c0f-9287-705a824a0666'),
(333, 333, 1, NULL, NULL, 1, '2019-11-23 05:45:25', '2019-11-23 05:45:25', '69a8ede8-9457-4cdd-abcd-44e3684e9321'),
(334, 334, 1, NULL, NULL, 1, '2019-11-23 05:45:25', '2019-11-23 05:45:25', '99b8372c-b0b9-4913-b704-53a88d5e6c06'),
(335, 335, 1, NULL, NULL, 1, '2019-11-23 05:45:25', '2019-11-23 05:45:25', 'f7953ee3-e2c9-43f4-a0b1-12b0fbd25f3d'),
(336, 336, 1, NULL, NULL, 1, '2019-11-23 05:45:25', '2019-11-23 05:45:25', '342e9b8b-d66a-494b-a9bc-ba2078b61816'),
(337, 337, 1, NULL, NULL, 1, '2019-11-23 05:45:25', '2019-11-23 05:45:25', '47ceafd1-4804-46e2-92e5-237260fd17f3'),
(338, 338, 1, NULL, NULL, 1, '2019-11-23 05:45:25', '2019-11-23 05:45:25', 'b9e7512c-3075-435d-93ae-2c1f4831c91c'),
(339, 339, 1, NULL, NULL, 1, '2019-11-23 05:51:27', '2019-11-23 05:51:27', '9352d16c-d436-4775-9db9-3d3374873484'),
(340, 340, 1, 'home', '__home__', 1, '2019-11-23 05:51:27', '2019-11-23 05:51:27', '52477244-82e5-42aa-9475-f600ac6158a0'),
(341, 341, 1, NULL, NULL, 1, '2019-11-23 05:51:27', '2019-11-23 05:51:27', '95e5ba35-1460-43f1-9a97-8cce844f7021'),
(342, 342, 1, NULL, NULL, 1, '2019-11-23 05:51:27', '2019-11-23 05:51:27', 'f40f8be7-e4d6-4ab8-a39f-32b0687e4bc2'),
(343, 343, 1, NULL, NULL, 1, '2019-11-23 05:51:27', '2019-11-23 05:51:27', '1ff1ceee-c6c2-406b-9937-a6e17769bf5c'),
(344, 344, 1, NULL, NULL, 1, '2019-11-23 05:51:27', '2019-11-23 05:51:27', '92d33585-43ba-431e-b321-8d81ae0c5076'),
(345, 345, 1, NULL, NULL, 1, '2019-11-23 05:51:27', '2019-11-23 05:51:27', 'caf7fbb8-8dd6-44fc-aa9a-e4789e8a4486'),
(346, 346, 1, NULL, NULL, 1, '2019-11-23 05:51:27', '2019-11-23 05:51:27', 'ecccb371-2b47-419e-97f0-b67c26f82292'),
(347, 347, 1, NULL, NULL, 1, '2019-11-23 05:51:27', '2019-11-23 05:51:27', 'db37e6d4-936d-4c9d-a3a3-473b9cac7a85'),
(348, 348, 1, NULL, NULL, 1, '2019-11-23 05:51:27', '2019-11-23 05:51:27', 'cf052674-8778-4193-a72e-4952f4c8c6ec'),
(349, 349, 1, NULL, NULL, 1, '2019-11-23 05:51:27', '2019-11-23 05:51:27', '66bfa7b2-5090-467b-bcd7-f5144e9ec5b6'),
(350, 350, 1, NULL, NULL, 1, '2019-11-23 05:51:27', '2019-11-23 05:51:27', 'd22e8d7f-cec9-4182-8885-39f72310d471'),
(351, 351, 1, NULL, NULL, 1, '2019-11-23 05:51:27', '2019-11-23 05:51:27', '5d1a9f62-6c0f-47bb-8320-0398e514ff65'),
(352, 352, 1, NULL, NULL, 1, '2019-11-23 05:51:27', '2019-11-23 05:51:27', '17eb7658-bb92-414c-b556-9de3df21408a'),
(353, 353, 1, NULL, NULL, 1, '2019-11-23 05:51:27', '2019-11-23 05:51:27', '0e6bb6c0-d354-43cd-8a17-246c5bae9e38'),
(354, 354, 1, NULL, NULL, 1, '2019-11-23 05:51:27', '2019-11-23 05:51:27', 'c74ba414-3dd1-40fb-98f7-e8dd388002a3'),
(355, 355, 1, NULL, NULL, 1, '2019-11-23 05:51:27', '2019-11-23 05:51:27', '02f5b87b-d6d4-4aae-89ab-650c5490d737'),
(356, 356, 1, NULL, NULL, 1, '2019-11-23 05:51:27', '2019-11-23 05:51:27', '8e77e8da-a6be-45f5-89a1-ff95e58dc5f3'),
(357, 357, 1, NULL, NULL, 1, '2019-11-23 05:51:27', '2019-11-23 05:51:27', 'ac43ce92-3c00-4e43-8447-e4ad0e5dcc6b'),
(358, 358, 1, 'order-form', 'order', 1, '2019-11-23 05:53:24', '2019-11-23 05:53:24', 'bd31757c-cb8d-4430-ad22-e5c34e71d3a7'),
(359, 359, 1, NULL, NULL, 1, '2019-11-23 05:53:24', '2019-11-23 05:53:24', '391277ad-c9dc-4bcb-ac03-fbe687f377e5'),
(360, 360, 1, NULL, NULL, 1, '2019-11-23 05:53:24', '2019-11-23 05:53:24', 'beea6bd0-c7bf-4f6e-9386-d9511a5c16ef'),
(361, 361, 1, NULL, NULL, 1, '2019-11-23 05:53:24', '2019-11-23 05:53:24', '748a41ad-8143-47c1-a71b-3f92d5cfe382'),
(362, 362, 1, 'home', '__home__', 1, '2019-11-23 05:55:49', '2019-11-23 05:55:49', 'fd0c9384-8a81-4882-83be-44df102f15c5'),
(363, 363, 1, NULL, NULL, 1, '2019-11-23 05:55:49', '2019-11-23 05:55:49', '1a499b8f-840f-478a-8f9c-dd39a0ceba55'),
(364, 364, 1, NULL, NULL, 1, '2019-11-23 05:56:36', '2019-11-23 05:56:36', '60e3a820-022d-441b-8208-fe50d2a4912f'),
(365, 365, 1, 'order-form', 'order', 1, '2019-11-23 05:56:36', '2019-11-23 05:56:36', '28a81072-0d49-4714-8f45-ca690e10ac18'),
(366, 366, 1, NULL, NULL, 1, '2019-11-23 05:56:36', '2019-11-23 05:56:36', 'b46ca076-20fc-486d-897b-8c47689d5344'),
(367, 367, 1, NULL, NULL, 1, '2019-11-23 05:56:36', '2019-11-23 05:56:36', 'e335d234-f3d8-4b1d-a3e0-42e5159ea897'),
(368, 368, 1, NULL, NULL, 1, '2019-11-23 05:56:36', '2019-11-23 05:56:36', 'c72bc06c-7f3a-451b-98a8-f4fa69f7e2e4'),
(369, 369, 1, NULL, NULL, 1, '2019-11-23 05:56:36', '2019-11-23 05:56:36', '7e2f4646-9cb2-4344-8af1-17c3e385f380'),
(370, 370, 1, 'ejoi', 'news/ejoi', 1, '2019-11-23 05:57:28', '2019-11-23 05:57:28', 'b5b1a1fa-10bc-47c8-8e81-8c6fd0d645a9'),
(372, 372, 1, 'wef', 'news/wef', 1, '2019-11-23 06:01:19', '2019-11-23 06:01:19', '2fd6ed1d-49a4-4fc6-a89a-c38f8201fb1b'),
(373, 373, 1, 'wef', 'news/wef', 1, '2019-11-23 06:01:19', '2019-11-23 06:01:19', '44111c25-3806-4b6d-a634-6b3f6b240619'),
(375, 375, 1, 'wef', 'products/wef', 1, '2019-11-23 06:01:26', '2019-11-23 06:01:26', '8784117f-cf66-4d6e-91bf-ff525241e961'),
(376, 376, 1, 'wef', 'products/wef', 1, '2019-11-23 06:01:26', '2019-11-23 06:01:26', '6aa11c1a-b076-42b5-9552-bec3a43c135a'),
(377, 377, 1, '__temp_ftnZmAa8RlNtBYNFyP4LDoGxmnT3j9VdX0in', 'products/__temp_ftnZmAa8RlNtBYNFyP4LDoGxmnT3j9VdX0in', 1, '2019-11-23 06:01:27', '2019-11-23 06:01:27', '39b5c66e-e159-426b-9106-2e934696ccf8'),
(378, 378, 1, NULL, NULL, 1, '2019-11-23 06:01:37', '2019-11-23 06:01:37', '7aa631ea-7275-4997-8c1b-f7307a5fc825'),
(379, 379, 1, 'home', '__home__', 1, '2019-11-23 06:01:37', '2019-11-23 06:01:37', '2d0de42c-18ca-4dad-9295-206563af0435'),
(380, 380, 1, NULL, NULL, 1, '2019-11-23 06:01:37', '2019-11-23 06:01:37', 'aaeb430d-26f3-4feb-bca1-bd31a0512693'),
(381, 381, 1, NULL, NULL, 1, '2019-11-23 06:01:37', '2019-11-23 06:01:37', 'b01a42d8-2570-44b4-8b2e-c347302fd1f6'),
(382, 382, 1, 'tset', 'products/__temp_u6aeVDa30KM91QguyGUSyrYYKIU7hcciEsuT', 1, '2019-11-23 06:02:25', '2019-11-23 06:02:27', '5ec910ac-3700-445b-a1a8-a34ed25030ee'),
(384, 384, 1, 'new-news', 'news/new-news', 1, '2019-11-23 06:02:42', '2019-11-23 06:02:42', '51483e38-3198-41e2-aa1a-40832592bbd6'),
(385, 385, 1, 'new-news', 'news/new-news', 1, '2019-11-23 06:02:42', '2019-11-23 06:02:42', '59e7579d-7bbd-4e2e-9d0d-b87eb655cbd4'),
(386, 386, 1, '__temp_as0BRL59g7kmsZGq14x7WF1WDWbNbvtTalUf', 'news/__temp_as0BRL59g7kmsZGq14x7WF1WDWbNbvtTalUf', 1, '2019-11-23 06:03:20', '2019-11-23 06:03:20', '3cf427ab-aec3-4806-9af5-c7f59ef0e147'),
(387, 387, 1, NULL, NULL, 1, '2019-11-23 06:03:31', '2019-11-23 06:03:31', '89199ce2-0951-474c-9da9-cf7e2b75ad62'),
(388, 388, 1, 'home', '__home__', 1, '2019-11-23 06:03:31', '2019-11-23 06:03:31', 'f1cebed3-8e77-44ac-b365-1c79921d8b0f'),
(389, 389, 1, NULL, NULL, 1, '2019-11-23 06:03:31', '2019-11-23 06:03:31', 'aa6b0ffd-e7aa-4823-ad01-fb9c78e237df'),
(390, 390, 1, NULL, NULL, 1, '2019-11-23 06:03:31', '2019-11-23 06:03:31', 'c3c778e4-2b0f-479c-87f0-ba368699b6d6'),
(391, 391, 1, NULL, NULL, 1, '2019-11-23 06:03:31', '2019-11-23 06:03:31', '42a6b552-a858-411e-9f14-655f17ef41d5'),
(392, 392, 1, NULL, NULL, 1, '2019-11-23 06:04:16', '2019-11-23 06:04:16', '3cfd87b1-a3af-4657-9f98-022b425042a0'),
(393, 393, 1, 'home', '__home__', 1, '2019-11-23 06:04:16', '2019-11-23 06:04:16', '2ae297af-944a-4823-804c-eff1613eb6fe'),
(394, 394, 1, NULL, NULL, 1, '2019-11-23 06:04:16', '2019-11-23 06:04:16', 'ab0236e1-fcd8-4a5d-8987-3834fac2d6ba'),
(395, 395, 1, NULL, NULL, 1, '2019-11-23 06:04:16', '2019-11-23 06:04:16', '28cca93b-30d7-499a-bd01-1cfb01df2ca2'),
(396, 396, 1, NULL, NULL, 1, '2019-11-23 06:04:16', '2019-11-23 06:04:16', '17b6c38f-ad1b-4fb3-a2f3-93cdf1e463ef'),
(397, 397, 1, NULL, NULL, 1, '2019-11-23 06:04:16', '2019-11-23 06:04:16', '6a3c06e0-e39f-4c92-8fa2-4ff3c3b2ec63'),
(398, 398, 1, NULL, NULL, 1, '2019-11-23 06:04:40', '2019-11-23 06:04:40', '0a36059f-05d8-4d41-8cb6-c3155075e0c1'),
(399, 399, 1, 'home', '__home__', 1, '2019-11-23 06:04:40', '2019-11-23 06:04:40', 'ca16de1b-4422-493f-9a85-45757b63d8e8'),
(400, 400, 1, NULL, NULL, 1, '2019-11-23 06:04:40', '2019-11-23 06:04:40', '31c63d70-6d14-4237-959e-d4da6f3175dc'),
(401, 401, 1, NULL, NULL, 1, '2019-11-23 06:04:40', '2019-11-23 06:04:40', '78755940-3086-45cf-9b83-0a11d2fb4793'),
(402, 402, 1, NULL, NULL, 1, '2019-11-23 06:04:40', '2019-11-23 06:04:40', 'b649e25e-aa40-49ab-9a7b-1380ac37cca1'),
(403, 403, 1, NULL, NULL, 1, '2019-11-23 06:04:40', '2019-11-23 06:04:40', 'f7005851-eda4-4557-98e6-0dc65fb42808'),
(404, 404, 1, NULL, NULL, 1, '2019-11-23 06:04:40', '2019-11-23 06:04:40', '3855eef7-ab1e-46ff-8bad-e6ef2d18a74b'),
(405, 405, 1, 'order-form', 'order', 1, '2019-11-23 06:06:49', '2019-11-23 06:06:49', '9ea35874-b939-47ff-ab97-a75df03b5340'),
(406, 406, 1, NULL, NULL, 1, '2019-11-23 06:06:49', '2019-11-23 06:06:49', 'be9a92a6-2aaf-4ac0-b23a-e7e004a44bd3'),
(407, 407, 1, NULL, NULL, 1, '2019-11-23 06:06:49', '2019-11-23 06:06:49', '8aa5732f-1b9f-4bda-a3ef-968bbc39231c'),
(408, 408, 1, NULL, NULL, 1, '2019-11-23 06:06:49', '2019-11-23 06:06:49', '16b087e2-042c-43c8-9d2c-3e0fc6d9eb38'),
(409, 409, 1, NULL, NULL, 1, '2019-11-23 06:06:49', '2019-11-23 06:06:49', '9aa04564-be2c-429d-a6fd-633791c2544c'),
(410, 410, 1, NULL, NULL, 1, '2019-11-23 06:13:03', '2019-11-23 06:13:03', '6b5b47f0-bbd9-47e1-a223-e3580b2b06c1'),
(411, 411, 1, 'home', '__home__', 1, '2019-11-23 06:13:03', '2019-11-23 06:13:03', 'ed60380e-1d38-4824-a410-c17a65ac0a04'),
(412, 412, 1, NULL, NULL, 1, '2019-11-23 06:13:03', '2019-11-23 06:13:03', 'cf46658b-46db-4ccb-8127-4088d16a96ce'),
(413, 413, 1, NULL, NULL, 1, '2019-11-23 06:13:03', '2019-11-23 06:13:03', 'dfb93d4a-30fa-4c3e-904c-c30dc4bcbe0f'),
(414, 414, 1, NULL, NULL, 1, '2019-11-23 06:13:03', '2019-11-23 06:13:03', '53822402-bc64-40e4-8681-ac5f33b94695'),
(415, 415, 1, NULL, NULL, 1, '2019-11-23 06:13:03', '2019-11-23 06:13:03', '8d7264ee-9192-450b-9afb-d4d567f9860c'),
(416, 416, 1, NULL, NULL, 1, '2019-11-23 06:13:03', '2019-11-23 06:13:03', '4d26fc92-d57f-4bcf-a284-798b0ea422e5'),
(417, 417, 1, NULL, NULL, 1, '2019-11-23 06:13:03', '2019-11-23 06:13:03', 'fce2b936-73aa-41ab-952f-e26f7a8bd9ed'),
(419, 419, 1, 'teste', 'products/teste', 1, '2019-11-23 06:22:01', '2019-11-23 06:22:01', 'f657b37f-8d4c-4e0a-b86f-5bfb585ec57c'),
(420, 420, 1, 'teste', 'products/teste', 1, '2019-11-23 06:22:01', '2019-11-23 06:22:01', '9573fd17-6402-43b3-a867-42a913001a0b'),
(422, 422, 1, 'newer-ewnr', 'news/newer-ewnr', 1, '2019-11-23 06:22:13', '2019-11-23 06:22:13', 'ef1bd1c2-4388-4d87-84a9-4d3ede0235f0'),
(423, 423, 1, 'newer-ewnr', 'news/newer-ewnr', 1, '2019-11-23 06:22:13', '2019-11-23 06:22:13', '0d4315e0-6b6d-43d0-8177-b0bf2307eced'),
(424, 424, 1, NULL, NULL, 1, '2019-11-23 06:22:34', '2019-11-23 06:22:34', '55dc6eb2-453d-45e8-9d2b-14ea7ffa5d55'),
(425, 425, 1, 'order-form', 'order', 1, '2019-11-23 06:22:34', '2019-11-23 06:22:34', '7af946a5-91c2-45aa-bf07-93f7a2acf972'),
(426, 426, 1, NULL, NULL, 1, '2019-11-23 06:22:34', '2019-11-23 06:22:34', 'ba04dd89-090a-4297-861e-3270c642be30'),
(427, 427, 1, NULL, NULL, 1, '2019-11-23 06:22:34', '2019-11-23 06:22:34', 'b740c550-81ba-4529-b8b9-a3e18587d471'),
(428, 428, 1, NULL, NULL, 1, '2019-11-23 06:22:34', '2019-11-23 06:22:34', '96e1c9f3-b103-4235-9d5e-af3e02026f6a'),
(429, 429, 1, NULL, NULL, 1, '2019-11-23 06:22:34', '2019-11-23 06:22:34', '6496b0c1-2788-423a-805c-8bbe5aeebb03'),
(430, 430, 1, NULL, NULL, 1, '2019-11-23 06:22:34', '2019-11-23 06:22:34', '1cafd3ce-b87a-4071-8774-cd613a075251'),
(431, 431, 1, 'newer-ewnr', 'news/newer-ewnr', 1, '2019-11-23 07:15:26', '2019-11-23 07:15:26', '96a8a329-6d1f-47c1-ae0f-3d2a2a31876e'),
(432, 432, 1, NULL, NULL, 1, '2019-11-25 05:21:15', '2019-11-25 05:21:15', 'a40a5d39-b048-42e2-86a0-5a7d9d939f63');

-- --------------------------------------------------------

--
-- Table structure for table `entries`
--

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
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `entries`
--

INSERT INTO `entries` (`id`, `sectionId`, `parentId`, `typeId`, `authorId`, `postDate`, `expiryDate`, `deletedWithEntryType`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(2, 1, NULL, 1, NULL, '2019-11-17 03:13:00', NULL, NULL, '2019-11-17 03:13:40', '2019-11-17 05:35:16', '5924dd6b-cf9b-40ec-9d87-3703c5fb3495'),
(3, 2, NULL, 2, NULL, '2019-11-17 03:13:00', NULL, NULL, '2019-11-17 03:13:53', '2019-11-17 03:13:53', '6b013f5e-3787-4198-aadc-665fe885bf10'),
(4, 3, NULL, 3, NULL, '2019-11-17 03:14:00', NULL, NULL, '2019-11-17 03:14:44', '2019-11-17 05:29:12', '8922c692-3973-433a-9908-e724044f18ce'),
(5, 4, NULL, 4, 1, '2019-11-17 03:22:00', NULL, NULL, '2019-11-17 03:22:44', '2019-11-17 03:22:44', 'b5d3e471-5c12-4791-abdb-0957ede66678'),
(12, 1, NULL, 1, NULL, '2019-11-17 03:13:00', NULL, NULL, '2019-11-20 10:20:47', '2019-11-20 10:20:47', '20ecfb24-02fb-4549-a924-fe7ffb2c5996'),
(16, 1, NULL, 1, NULL, '2019-11-17 03:13:00', NULL, NULL, '2019-11-20 10:20:47', '2019-11-20 10:20:47', '348dbc7f-cb0f-42a1-ab62-dad667331e80'),
(20, 1, NULL, 1, NULL, '2019-11-17 03:13:00', NULL, NULL, '2019-11-20 10:20:47', '2019-11-20 10:20:47', '9f7e87bc-be08-482b-8131-d0bbad302465'),
(24, 1, NULL, 1, NULL, '2019-11-17 03:13:00', NULL, NULL, '2019-11-20 10:20:47', '2019-11-20 10:20:47', '402cf7d7-97fb-47a1-9192-d1ba00e0c751'),
(28, 3, NULL, 3, NULL, '2019-11-17 03:14:00', NULL, NULL, '2019-11-20 10:20:47', '2019-11-20 10:20:47', '5f258712-2183-4dbe-b4d2-7ab879f1cbb5'),
(31, 3, NULL, 3, NULL, '2019-11-17 03:14:00', NULL, NULL, '2019-11-20 10:20:48', '2019-11-20 10:20:48', '5d25cc4e-4ba8-46d9-bb31-75cd5953573f'),
(34, 3, NULL, 3, NULL, '2019-11-17 03:14:00', NULL, NULL, '2019-11-20 10:20:48', '2019-11-20 10:20:48', '5a72422b-3c7f-4cb3-a4f6-de82b0d0fc00'),
(37, 3, NULL, 3, NULL, '2019-11-17 03:14:00', NULL, NULL, '2019-11-20 10:20:48', '2019-11-20 10:20:48', '6f5959f5-a76c-48e0-a314-6e06354b60e6'),
(40, 3, NULL, 3, NULL, '2019-11-17 03:14:00', NULL, NULL, '2019-11-20 10:20:48', '2019-11-20 10:20:48', '766250c2-48fb-4665-be35-1729f0153579'),
(43, 3, NULL, 3, NULL, '2019-11-17 03:14:00', NULL, NULL, '2019-11-20 10:20:48', '2019-11-20 10:20:48', '74a0afb8-0bef-4600-9180-3a4985f737a0'),
(46, 3, NULL, 3, NULL, '2019-11-17 03:14:00', NULL, NULL, '2019-11-20 10:20:48', '2019-11-20 10:20:48', '4a1e5b49-357f-41ca-ba5d-e57639807cf3'),
(49, 3, NULL, 3, NULL, '2019-11-17 03:14:00', NULL, NULL, '2019-11-20 10:20:48', '2019-11-20 10:20:48', '89d6884c-bb49-4913-bf79-3fe864b7d9ca'),
(52, 3, NULL, 3, NULL, '2019-11-17 03:14:00', NULL, NULL, '2019-11-20 10:20:48', '2019-11-20 10:20:48', '6db02693-5f60-44e5-b944-60fe137a931e'),
(55, 3, NULL, 3, NULL, '2019-11-17 03:14:00', NULL, NULL, '2019-11-20 10:20:48', '2019-11-20 10:20:48', 'ce23e2fb-83a6-4dce-b7b9-7717278ef4bf'),
(58, 3, NULL, 3, NULL, '2019-11-17 03:14:00', NULL, NULL, '2019-11-20 10:20:48', '2019-11-20 10:20:48', 'bf360c1f-be82-4685-af6e-f5043d86a436'),
(61, 3, NULL, 3, NULL, '2019-11-17 03:14:00', NULL, NULL, '2019-11-20 10:20:48', '2019-11-20 10:20:48', '7f14e94d-aa47-40b5-b412-f72bd07d5ffc'),
(64, 3, NULL, 3, NULL, '2019-11-17 03:14:00', NULL, NULL, '2019-11-20 10:20:48', '2019-11-20 10:20:48', '89ef6042-2b0c-4fe6-9b0a-29a74324cd1f'),
(67, 3, NULL, 3, NULL, '2019-11-17 03:14:00', NULL, NULL, '2019-11-20 10:20:48', '2019-11-20 10:20:48', 'a7dfc10c-472b-4b8d-9ff0-35013aa3676e'),
(70, 3, NULL, 3, NULL, '2019-11-17 03:14:00', NULL, NULL, '2019-11-20 10:20:48', '2019-11-20 10:20:48', 'fef9533b-3fde-4ff0-a8ba-c0b7c976197f'),
(73, 4, NULL, 4, 1, '2019-11-17 03:22:00', NULL, NULL, '2019-11-20 10:20:48', '2019-11-20 10:20:48', '53a2104f-ef3d-458a-a9d2-727e5c270c05'),
(74, 3, NULL, 3, NULL, '2019-11-17 03:14:00', NULL, NULL, '2019-11-20 10:31:28', '2019-11-20 10:31:28', '4f24624f-83c2-4b0f-a2b9-db4f0e22ca07'),
(77, 2, NULL, 2, NULL, '2019-11-17 03:13:00', NULL, NULL, '2019-11-20 10:33:17', '2019-11-20 10:33:17', '68c781c8-d367-42a4-af22-ace15296c1d0'),
(78, 2, NULL, 2, NULL, '2019-11-17 03:13:00', NULL, NULL, '2019-11-20 10:33:17', '2019-11-20 10:33:17', '6dda56db-0da0-4317-9b3d-8038788d203a'),
(79, 1, NULL, 1, NULL, '2019-11-17 03:13:00', NULL, NULL, '2019-11-20 10:33:23', '2019-11-20 10:33:23', '5fbba3be-48cf-4092-be15-56ba5ff2f618'),
(83, 3, NULL, 3, NULL, '2019-11-17 03:14:00', NULL, NULL, '2019-11-20 10:35:01', '2019-11-20 10:35:01', '97946ee1-27c9-442c-a007-d4cd5cb21f3d'),
(86, 4, NULL, 4, 1, '2019-11-17 03:22:00', NULL, NULL, '2019-11-20 10:49:15', '2019-11-20 10:49:15', '25c3f04a-e353-4678-a4c1-658c529e0bc5'),
(87, 4, NULL, 4, 1, '2019-11-17 03:22:00', NULL, NULL, '2019-11-20 10:50:37', '2019-11-20 10:50:37', 'e7ba74e7-037e-4053-97e1-e8cc8e209d52'),
(88, 4, NULL, 4, 1, '2019-11-17 03:22:00', NULL, NULL, '2019-11-23 00:51:50', '2019-11-23 00:51:50', 'e0325a13-5b03-4e0d-a1a6-e9e269275fb3'),
(89, 4, NULL, 4, 1, '2019-11-17 03:22:00', NULL, NULL, '2019-11-23 00:54:32', '2019-11-23 00:54:32', '9d540660-0dab-427f-a759-a1e086a574c1'),
(90, 1, NULL, 1, NULL, '2019-11-17 03:13:00', NULL, NULL, '2019-11-23 00:54:46', '2019-11-23 00:54:46', '8e7c74dd-a2a0-4ad4-bdc8-3463fb44cc50'),
(94, 1, NULL, 1, NULL, '2019-11-17 03:13:00', NULL, NULL, '2019-11-23 01:10:56', '2019-11-23 01:10:56', '37c57ef1-0a01-4e15-a0dc-ac889e151cd2'),
(98, 4, NULL, 4, 1, '2019-11-17 03:22:00', NULL, NULL, '2019-11-23 01:16:07', '2019-11-23 01:16:07', '5e87c5a6-eeeb-480d-81b8-7e26cafc97c9'),
(99, 4, NULL, 4, 1, '2019-11-17 03:22:00', NULL, NULL, '2019-11-23 01:16:38', '2019-11-23 01:16:38', '872f5edc-3fe8-4532-9b60-beb4337b6efa'),
(103, 1, NULL, 1, NULL, '2019-11-17 03:13:00', NULL, NULL, '2019-11-23 01:21:43', '2019-11-23 01:21:43', '95e1dacd-8c44-4cbe-b7e5-2ebe4600d1a1'),
(110, 1, NULL, 1, NULL, '2019-11-17 03:13:00', NULL, NULL, '2019-11-23 01:25:17', '2019-11-23 01:25:17', '11663251-c67e-44cf-a89e-bfca33908ef3'),
(116, 5, NULL, 5, 1, '2019-11-23 01:32:00', NULL, NULL, '2019-11-23 01:32:29', '2019-11-23 01:32:29', 'b039418a-5a8a-408e-b792-3cfeb5d369ce'),
(118, 5, NULL, 5, 1, '2019-11-23 01:35:00', NULL, NULL, '2019-11-23 01:36:10', '2019-11-23 01:36:10', 'd31e31d5-da52-4475-b963-fafd1b43eb37'),
(119, 5, NULL, 5, 1, '2019-11-23 01:35:00', NULL, NULL, '2019-11-23 01:36:10', '2019-11-23 01:36:10', '046c3002-c937-4675-967d-5da78b4ed715'),
(121, 5, NULL, 5, 1, '2019-11-23 01:37:00', NULL, NULL, '2019-11-23 01:37:36', '2019-11-23 01:37:36', '08ad479a-3813-4abb-b1dd-54d1408c2c1e'),
(122, 5, NULL, 5, 1, '2019-11-23 01:37:00', NULL, NULL, '2019-11-23 01:37:36', '2019-11-23 01:37:36', 'e90ba013-8919-47b1-a149-a316d6c564ad'),
(124, 5, NULL, 5, 1, '2019-11-23 01:38:00', NULL, NULL, '2019-11-23 01:38:40', '2019-11-23 01:38:40', '6ab7ff62-4cb6-46d7-b6c1-47d68b513c30'),
(125, 5, NULL, 5, 1, '2019-11-23 01:38:00', NULL, NULL, '2019-11-23 01:38:40', '2019-11-23 01:38:40', 'c729a12d-096e-431b-9048-d8084a8d5fe2'),
(126, 1, NULL, 1, NULL, '2019-11-17 03:13:00', NULL, NULL, '2019-11-23 01:39:52', '2019-11-23 01:39:52', '4aa3f8eb-e2f5-4011-b352-15430cd29b1d'),
(133, 5, NULL, 5, 1, '2019-11-23 01:41:00', NULL, NULL, '2019-11-23 01:41:35', '2019-11-23 01:41:35', '885828c5-242b-4e5f-bb8a-9d3b0ab4d8f0'),
(134, 5, NULL, 5, 1, '2019-11-23 01:41:00', NULL, NULL, '2019-11-23 01:41:35', '2019-11-23 01:41:35', 'ee6cd75d-209e-4910-bc6f-7b7fbb353eb9'),
(136, 1, NULL, 1, NULL, '2019-11-17 03:13:00', NULL, NULL, '2019-11-23 01:41:52', '2019-11-23 01:41:52', 'd3cf515d-f077-48fa-912b-52163cc5597c'),
(144, 5, NULL, 5, 1, '2019-11-23 01:48:00', NULL, NULL, '2019-11-23 01:48:17', '2019-11-23 01:48:17', 'babab7b1-f4ca-4059-95dc-89bbab77333a'),
(145, 5, NULL, 5, 1, '2019-11-23 01:48:00', NULL, NULL, '2019-11-23 01:48:17', '2019-11-23 01:48:17', 'f1794166-660f-4412-9d80-157fd7b6971e'),
(147, 5, NULL, 5, 1, '2019-11-23 01:49:00', NULL, NULL, '2019-11-23 01:49:08', '2019-11-23 01:49:08', '9d0fecca-411b-4458-85b0-943cd3b4dd75'),
(148, 5, NULL, 5, 1, '2019-11-23 01:49:00', NULL, NULL, '2019-11-23 01:49:08', '2019-11-23 01:49:08', 'ad8a3732-a264-4d4a-8017-ac079b2ee817'),
(150, 1, NULL, 1, NULL, '2019-11-17 03:13:00', NULL, NULL, '2019-11-23 01:49:57', '2019-11-23 01:49:57', 'd2c2f3aa-8ab5-4445-b758-30804a100bf3'),
(159, 5, NULL, 5, 1, '2019-11-23 02:04:00', NULL, NULL, '2019-11-23 02:04:27', '2019-11-23 02:04:27', 'd2c3c3ce-d701-4f8f-829b-c81000b65f3b'),
(160, 5, NULL, 5, 1, '2019-11-23 02:04:00', NULL, NULL, '2019-11-23 02:04:27', '2019-11-23 02:04:27', 'ff247841-c72b-4fe5-9e26-4bc999bd550f'),
(161, 5, NULL, 5, 1, '2019-11-23 02:09:00', NULL, NULL, '2019-11-23 02:09:39', '2019-11-23 02:09:39', '55e9e105-e0ed-47c8-bcab-8e12244d910a'),
(163, 5, NULL, 5, 1, '2019-11-23 02:09:00', NULL, NULL, '2019-11-23 02:09:50', '2019-11-23 02:09:50', '12280d86-34d3-493f-9aec-7f07ad10bdbb'),
(164, 5, NULL, 5, 1, '2019-11-23 02:09:00', NULL, NULL, '2019-11-23 02:09:50', '2019-11-23 02:09:50', 'fa73fc3b-911b-4ff1-b6d0-b70d6be2f0d6'),
(166, 5, NULL, 5, 1, '2019-11-23 02:11:00', NULL, NULL, '2019-11-23 02:12:05', '2019-11-23 02:12:05', '39c68f48-725a-4bd1-b999-ca18d88485bf'),
(167, 5, NULL, 5, 1, '2019-11-23 02:11:00', NULL, NULL, '2019-11-23 02:12:05', '2019-11-23 02:12:05', 'e962255e-5cbb-4497-8671-9f30889d1c78'),
(169, 5, NULL, 5, 1, '2019-11-23 02:13:00', NULL, NULL, '2019-11-23 02:13:51', '2019-11-23 02:13:51', 'f6780de3-d699-4b25-9a66-48d94dacc6de'),
(170, 5, NULL, 5, 1, '2019-11-23 02:13:00', NULL, NULL, '2019-11-23 02:13:51', '2019-11-23 02:13:51', '09505d4d-512f-44b5-a4ed-d3585206b64b'),
(172, 5, NULL, 5, 1, '2019-11-23 02:14:00', NULL, NULL, '2019-11-23 02:14:34', '2019-11-23 02:14:34', 'ab6b0f14-64fe-46eb-b36a-e05ac032188c'),
(173, 5, NULL, 5, 1, '2019-11-23 02:14:00', NULL, NULL, '2019-11-23 02:14:34', '2019-11-23 02:14:34', '77cbd088-1c18-4c53-847c-1479a1d7316b'),
(174, 5, NULL, 5, 1, '2019-11-23 02:14:00', NULL, NULL, '2019-11-23 02:14:36', '2019-11-23 02:14:36', '178cfc9a-9e34-4584-b35a-128a851d6db7'),
(176, 5, NULL, 5, 1, '2019-11-23 02:15:00', NULL, NULL, '2019-11-23 02:15:45', '2019-11-23 02:15:45', '8d772403-0fc4-47ee-89a5-e34b60bc35fe'),
(177, 5, NULL, 5, 1, '2019-11-23 02:15:00', NULL, NULL, '2019-11-23 02:15:45', '2019-11-23 02:15:45', '89192c6c-7a88-479c-a5c5-a2482a3fd493'),
(179, 5, NULL, 5, 1, '2019-11-23 02:17:00', NULL, NULL, '2019-11-23 02:17:09', '2019-11-23 02:17:09', '9436434c-43af-483e-9503-fad6d540ab08'),
(180, 5, NULL, 5, 1, '2019-11-23 02:17:00', NULL, NULL, '2019-11-23 02:17:09', '2019-11-23 02:17:09', '62c17863-8b3e-419f-843a-ab2618ceb3c4'),
(182, 1, NULL, 1, NULL, '2019-11-17 03:13:00', NULL, NULL, '2019-11-23 02:18:03', '2019-11-23 02:18:03', 'c335ac8e-ff46-44ef-beab-ec8be8903cda'),
(192, 1, NULL, 1, NULL, '2019-11-17 03:13:00', NULL, NULL, '2019-11-23 02:37:30', '2019-11-23 02:37:30', '7a58b51a-332f-4aba-9131-9c67bf2ec24e'),
(203, 4, NULL, 4, 1, '2019-11-23 02:37:00', NULL, NULL, '2019-11-23 02:37:38', '2019-11-23 02:37:38', 'b3571fec-4b1a-4956-933b-6ca6fd040082'),
(204, 4, NULL, 4, 1, '2019-11-23 02:37:00', NULL, NULL, '2019-11-23 02:37:38', '2019-11-23 02:37:38', 'd2f3a4cc-cecf-457c-9554-d9abca28a28c'),
(206, 1, NULL, 1, NULL, '2019-11-17 03:13:00', NULL, NULL, '2019-11-23 02:38:31', '2019-11-23 02:38:31', 'd68c960c-aeeb-4469-b6cf-0cd9b6697716'),
(218, 1, NULL, 1, NULL, '2019-11-17 03:13:00', NULL, NULL, '2019-11-23 02:39:26', '2019-11-23 02:39:26', '1d442c85-515e-441d-b854-5aacb5b9551b'),
(231, 1, NULL, 1, NULL, '2019-11-17 03:13:00', NULL, NULL, '2019-11-23 02:39:50', '2019-11-23 02:39:50', '996861da-9272-4534-b6ff-beb4771c0747'),
(245, 1, NULL, 1, NULL, '2019-11-17 03:13:00', NULL, NULL, '2019-11-23 05:13:35', '2019-11-23 05:13:35', 'd2fa83e8-135a-4204-93b4-ccbebda1596a'),
(260, 3, NULL, 3, NULL, '2019-11-17 03:14:00', NULL, NULL, '2019-11-23 05:14:04', '2019-11-23 05:14:04', 'ce8c8907-c156-4053-ad87-c3baf1ce4033'),
(265, 1, NULL, 1, NULL, '2019-11-17 03:13:00', NULL, NULL, '2019-11-23 05:14:22', '2019-11-23 05:14:22', '777cda99-7975-4258-af28-d7abacd91718'),
(280, 5, NULL, 5, 1, '2019-11-23 01:41:00', NULL, NULL, '2019-11-23 05:17:18', '2019-11-23 05:17:18', '94012528-ac82-47c5-bf78-d8ddb11f120f'),
(282, 5, NULL, 5, 1, '2019-11-23 05:17:00', NULL, NULL, '2019-11-23 05:17:45', '2019-11-23 05:17:45', '62fa7187-8549-4f10-9985-22070aab1a0f'),
(283, 5, NULL, 5, 1, '2019-11-23 05:17:00', NULL, NULL, '2019-11-23 05:17:45', '2019-11-23 05:17:45', 'd6d591c0-bb30-4d8c-a5a8-94e7c21c1f0b'),
(285, 5, NULL, 5, 1, '2019-11-23 05:18:00', NULL, NULL, '2019-11-23 05:18:47', '2019-11-23 05:18:47', '10b75e90-5b65-4a52-86f3-751742f2022e'),
(286, 5, NULL, 5, 1, '2019-11-23 05:18:00', NULL, NULL, '2019-11-23 05:18:47', '2019-11-23 05:18:47', '143a6baa-535c-4f7e-bfb9-a477c6657740'),
(287, 5, NULL, 5, 1, '2019-11-23 05:29:00', NULL, NULL, '2019-11-23 05:29:34', '2019-11-23 05:29:34', 'b6a19dc7-550b-4b6f-bb59-6635bca02e5a'),
(289, 5, NULL, 5, 1, '2019-11-23 05:29:00', NULL, NULL, '2019-11-23 05:29:43', '2019-11-23 05:29:43', '4b1e3036-3718-46ec-8447-4c0377535405'),
(290, 5, NULL, 5, 1, '2019-11-23 05:29:00', NULL, NULL, '2019-11-23 05:29:43', '2019-11-23 05:29:43', '065191a9-7919-43e7-a184-5cacda10cde5'),
(292, 4, NULL, 4, 1, '2019-11-23 05:33:00', NULL, NULL, '2019-11-23 05:33:45', '2019-11-23 05:33:45', 'a5d7b869-6d0b-4503-b458-18fd89480110'),
(293, 4, NULL, 4, 1, '2019-11-23 05:33:00', NULL, NULL, '2019-11-23 05:33:45', '2019-11-23 05:33:45', '0a1a51a9-69bd-4046-afb7-2d3ca2142530'),
(295, 4, NULL, 4, 1, '2019-11-23 05:34:00', NULL, NULL, '2019-11-23 05:34:41', '2019-11-23 05:34:41', 'e43a46f5-1819-4bc3-8a7c-cb60212cba2f'),
(296, 4, NULL, 4, 1, '2019-11-23 05:34:00', NULL, NULL, '2019-11-23 05:34:41', '2019-11-23 05:34:41', 'e5cca7c5-9b5b-4c43-99b5-faba65649e4a'),
(298, 4, NULL, 4, 1, '2019-11-23 05:36:00', NULL, NULL, '2019-11-23 05:36:12', '2019-11-23 05:36:12', 'fe1a93bc-0976-4dbd-90e5-a902f2476602'),
(299, 4, NULL, 4, 1, '2019-11-23 05:36:00', NULL, NULL, '2019-11-23 05:36:12', '2019-11-23 05:36:12', '28cfd071-742c-435d-a0b5-e986f3dc9738'),
(301, 4, NULL, 4, 1, '2019-11-23 05:37:00', NULL, NULL, '2019-11-23 05:37:57', '2019-11-23 05:37:57', '67ae4efb-7e2a-425a-bcb9-7e63409ea7d9'),
(302, 4, NULL, 4, 1, '2019-11-23 05:37:00', NULL, NULL, '2019-11-23 05:37:57', '2019-11-23 05:37:57', 'c2989865-7a2b-401a-ba90-4574f7e4c42a'),
(303, 4, NULL, 4, 1, '2019-11-23 05:36:00', NULL, NULL, '2019-11-23 05:38:00', '2019-11-23 05:38:00', 'd9d293da-81d8-4084-86a8-028ae47a53dc'),
(305, 1, NULL, 1, NULL, '2019-11-17 03:13:00', NULL, NULL, '2019-11-23 05:38:10', '2019-11-23 05:38:10', 'e9c8e74b-3fb7-4a47-884e-9ca248c0f896'),
(322, 1, NULL, 1, NULL, '2019-11-17 03:13:00', NULL, NULL, '2019-11-23 05:45:25', '2019-11-23 05:45:25', '0000b877-e793-432b-bb94-ff6e1d59dbb8'),
(340, 1, NULL, 1, NULL, '2019-11-17 03:13:00', NULL, NULL, '2019-11-23 05:51:27', '2019-11-23 05:51:27', 'c3c83185-d445-4f3c-90aa-318e1223168f'),
(358, 3, NULL, 3, NULL, '2019-11-17 03:14:00', NULL, NULL, '2019-11-23 05:53:24', '2019-11-23 05:53:24', '9b1cfe9f-a118-4561-9415-c810016f9f4e'),
(362, 1, NULL, 1, NULL, '2019-11-17 03:13:00', NULL, NULL, '2019-11-23 05:55:49', '2019-11-23 05:55:49', 'c58f47cd-0bde-4f5e-a8ab-6cb65446099c'),
(365, 3, NULL, 3, NULL, '2019-11-17 03:14:00', NULL, NULL, '2019-11-23 05:56:36', '2019-11-23 05:56:36', '4d8976ea-80ac-44b4-acf0-3c0dcf8ce32c'),
(370, 5, NULL, 5, 1, '2019-11-23 02:04:00', NULL, NULL, '2019-11-23 05:57:28', '2019-11-23 05:57:28', '09235c10-2322-416b-9206-eab14d7d36e5'),
(372, 5, NULL, 5, 1, '2019-11-23 06:01:00', NULL, NULL, '2019-11-23 06:01:19', '2019-11-23 06:01:19', 'e590626e-2240-4292-a631-8096a2f5f609'),
(373, 5, NULL, 5, 1, '2019-11-23 06:01:00', NULL, NULL, '2019-11-23 06:01:19', '2019-11-23 06:01:19', '3bb46bc6-1bca-4e90-a2e1-0f848c339c81'),
(375, 4, NULL, 4, 1, '2019-11-23 06:01:00', NULL, NULL, '2019-11-23 06:01:26', '2019-11-23 06:01:26', '40090479-78c0-45f7-8ef2-d5c699f2f6db'),
(376, 4, NULL, 4, 1, '2019-11-23 06:01:00', NULL, NULL, '2019-11-23 06:01:26', '2019-11-23 06:01:26', '0f93c288-8461-4a74-8628-88a77f6d6199'),
(377, 4, NULL, 4, 1, '2019-11-23 06:01:00', NULL, NULL, '2019-11-23 06:01:27', '2019-11-23 06:01:27', '1a217a6c-5b76-4cd2-b88c-1485fd470a00'),
(379, 1, NULL, 1, NULL, '2019-11-17 03:13:00', NULL, NULL, '2019-11-23 06:01:37', '2019-11-23 06:01:37', '8f3dea4b-b7ad-4edb-824f-fe14e77eadbd'),
(382, 4, NULL, 4, 1, '2019-11-23 06:02:00', NULL, NULL, '2019-11-23 06:02:25', '2019-11-23 06:02:25', 'db8afc92-323a-4069-ab16-f07c1a6fc745'),
(384, 5, NULL, 5, 1, '2019-11-23 06:02:00', NULL, NULL, '2019-11-23 06:02:42', '2019-11-23 06:02:42', 'cf77a607-5e21-410f-8425-02381924af30'),
(385, 5, NULL, 5, 1, '2019-11-23 06:02:00', NULL, NULL, '2019-11-23 06:02:42', '2019-11-23 06:02:42', 'ab8d55d3-772c-4dba-ab0f-4b390c9faf65'),
(386, 5, NULL, 5, 1, '2019-11-23 06:03:00', NULL, NULL, '2019-11-23 06:03:20', '2019-11-23 06:03:20', '2b1d59c1-ce2a-483f-9886-dd29b0677664'),
(388, 1, NULL, 1, NULL, '2019-11-17 03:13:00', NULL, NULL, '2019-11-23 06:03:31', '2019-11-23 06:03:31', 'c8179c0b-b0e8-4630-801d-4bef1b464448'),
(393, 1, NULL, 1, NULL, '2019-11-17 03:13:00', NULL, NULL, '2019-11-23 06:04:16', '2019-11-23 06:04:16', '92d05e87-fc36-43b6-855e-c9972c8b7074'),
(399, 1, NULL, 1, NULL, '2019-11-17 03:13:00', NULL, NULL, '2019-11-23 06:04:40', '2019-11-23 06:04:40', '1b61d45f-073a-4238-999b-7f524b688abf'),
(405, 3, NULL, 3, NULL, '2019-11-17 03:14:00', NULL, NULL, '2019-11-23 06:06:49', '2019-11-23 06:06:49', '910ee20a-3fed-4708-8aa1-50e9692dc3aa'),
(411, 1, NULL, 1, NULL, '2019-11-17 03:13:00', NULL, NULL, '2019-11-23 06:13:03', '2019-11-23 06:13:03', '2f707c83-5185-45f7-931b-22dca8a446d6'),
(419, 4, NULL, 4, 1, '2019-11-23 06:21:00', NULL, NULL, '2019-11-23 06:22:01', '2019-11-23 06:22:01', 'e473d115-2bb5-4dd5-99cd-5a217f0e7ba4'),
(420, 4, NULL, 4, 1, '2019-11-23 06:21:00', NULL, NULL, '2019-11-23 06:22:01', '2019-11-23 06:22:01', 'e8554946-3cb1-477f-b276-af02aee78d91'),
(422, 5, NULL, 5, 1, '2019-11-23 06:22:00', NULL, NULL, '2019-11-23 06:22:13', '2019-11-23 06:22:13', '071df2a9-a835-4947-8296-3c16da293ae4'),
(423, 5, NULL, 5, 1, '2019-11-23 06:22:00', NULL, NULL, '2019-11-23 06:22:13', '2019-11-23 06:22:13', 'bfa97ce7-866f-4395-be1d-4e3213aefc4d'),
(425, 3, NULL, 3, NULL, '2019-11-17 03:14:00', NULL, NULL, '2019-11-23 06:22:34', '2019-11-23 06:22:34', 'bec84c9f-bed6-4622-8a66-dab03adf9167'),
(431, 5, NULL, 5, 1, '2019-11-23 06:22:00', NULL, NULL, '2019-11-23 07:15:26', '2019-11-23 07:15:26', '2c9b8f27-931f-4268-9c8b-15ae51da7bc0');

-- --------------------------------------------------------

--
-- Table structure for table `entrydrafterrors`
--

CREATE TABLE `entrydrafterrors` (
  `id` int(11) NOT NULL,
  `draftId` int(11) DEFAULT NULL,
  `error` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `entrydrafts`
--

CREATE TABLE `entrydrafts` (
  `id` int(11) NOT NULL,
  `entryId` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `creatorId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `notes` text,
  `data` mediumtext NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `entrytypes`
--

CREATE TABLE `entrytypes` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleLabel` varchar(255) DEFAULT 'Title',
  `titleFormat` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `entrytypes`
--

INSERT INTO `entrytypes` (`id`, `sectionId`, `fieldLayoutId`, `name`, `handle`, `hasTitleField`, `titleLabel`, `titleFormat`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 1, 1, 'Home', 'home', 0, NULL, '{section.name|raw}', 1, '2019-11-17 03:13:40', '2019-11-17 05:33:47', NULL, '1efb8a72-3c56-462d-9a85-0c686962f8cb'),
(2, 2, 2, 'Contact', 'contact', 0, NULL, '{section.name|raw}', 1, '2019-11-17 03:13:53', '2019-11-17 03:13:53', NULL, '819facc5-de6d-46f5-bb81-bb1982b4b5e8'),
(3, 3, 3, 'Order Form', 'orderForm', 0, NULL, '{section.name|raw}', 1, '2019-11-17 03:14:44', '2019-11-17 05:06:06', NULL, '65959724-a677-4bbf-b3c5-7053f5fdd9e9'),
(4, 4, 4, 'Products', 'products', 1, 'Title', NULL, 1, '2019-11-17 03:15:14', '2019-11-17 03:22:23', NULL, '3c5453b2-9842-4725-9430-cf7723a09c1f'),
(5, 5, 8, 'News', 'news', 1, 'Title', '', 1, '2019-11-23 01:29:51', '2019-11-23 01:32:23', NULL, 'a39dd88a-bcfb-456b-a070-327b5b514111');

-- --------------------------------------------------------

--
-- Table structure for table `entryversionerrors`
--

CREATE TABLE `entryversionerrors` (
  `id` int(11) NOT NULL,
  `versionId` int(11) DEFAULT NULL,
  `error` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `entryversions`
--

CREATE TABLE `entryversions` (
  `id` int(11) NOT NULL,
  `entryId` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `siteId` int(11) NOT NULL,
  `num` smallint(6) UNSIGNED NOT NULL,
  `notes` text,
  `data` mediumtext NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fieldgroups`
--

CREATE TABLE `fieldgroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fieldgroups`
--

INSERT INTO `fieldgroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'Common', '2019-11-17 03:11:01', '2019-11-17 03:11:01', '8ee3bcf1-2ef7-4684-bdc0-ce8ed5a1a3b1'),
(2, 'Products', '2019-11-17 03:15:48', '2019-11-17 03:15:48', '4b000de0-c332-4c52-806f-0b6adf2a6140'),
(3, 'Order Form', '2019-11-17 05:04:18', '2019-11-17 05:04:18', '55709eb1-437b-45bb-94b7-e6328204f455'),
(4, 'News feed', '2019-11-17 05:30:20', '2019-11-17 05:30:20', '335454c1-7446-4c14-b7af-251dcc1e3a22'),
(5, 'News', '2019-11-23 01:30:07', '2019-11-23 01:30:07', 'a3e62c01-c6b9-47f6-9904-6db8c24f0b71'),
(6, 'Users', '2019-11-23 08:14:38', '2019-11-23 08:14:38', '7a701a6e-72c8-4d5b-ac96-2830c462a6ea');

-- --------------------------------------------------------

--
-- Table structure for table `fieldlayoutfields`
--

CREATE TABLE `fieldlayoutfields` (
  `id` int(11) NOT NULL,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fieldlayoutfields`
--

INSERT INTO `fieldlayoutfields` (`id`, `layoutId`, `tabId`, `fieldId`, `required`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(10, 3, 4, 6, 0, 1, '2019-11-17 05:06:06', '2019-11-17 05:06:06', 'b20c37f2-2250-451d-94f6-3f1690ad1f43'),
(30, 6, 10, 8, 0, 1, '2019-11-17 05:27:52', '2019-11-17 05:27:52', '947f791c-2051-4449-b401-88ddd0a05b91'),
(31, 6, 10, 9, 0, 2, '2019-11-17 05:27:52', '2019-11-17 05:27:52', '31a78029-c69f-4deb-8e38-52f5cd5afd2a'),
(32, 6, 10, 10, 0, 3, '2019-11-17 05:27:52', '2019-11-17 05:27:52', '342d1bdd-93d1-4ab6-abe4-c34266dad562'),
(33, 6, 10, 11, 0, 4, '2019-11-17 05:27:52', '2019-11-17 05:27:52', '69e5d160-22d2-434b-8441-e2f84d2621c4'),
(34, 7, 11, 13, 0, 1, '2019-11-17 05:33:06', '2019-11-17 05:33:06', '4902115d-7bc6-47e0-892b-aad4d587a662'),
(35, 7, 11, 14, 0, 2, '2019-11-17 05:33:06', '2019-11-17 05:33:06', 'e167d198-9b9e-4ea1-aa98-e4bb3ba35a23'),
(36, 7, 11, 15, 0, 3, '2019-11-17 05:33:06', '2019-11-17 05:33:06', '328249c2-05d2-4293-8c54-1aec9e57ea33'),
(37, 1, 12, 12, 0, 1, '2019-11-17 05:33:47', '2019-11-17 05:33:47', 'f054537a-8c09-4518-983c-feb221cb497f'),
(38, 8, 13, 18, 0, 2, '2019-11-23 01:32:23', '2019-11-23 01:32:23', '1dc784b1-9108-4194-9673-d0384fa1b6d3'),
(39, 8, 13, 17, 0, 1, '2019-11-23 01:32:23', '2019-11-23 01:32:23', 'cb48ac33-3b4b-4a06-92d8-30fbb21fafd5'),
(40, 8, 13, 16, 0, 3, '2019-11-23 01:32:23', '2019-11-23 01:32:23', '5eab091d-bf7d-48e6-b72e-9040570071d9'),
(41, 9, 14, 21, 0, 1, '2019-11-23 08:15:15', '2019-11-23 08:15:15', 'c076f53b-36fd-448b-9cd2-2eba53774ceb'),
(42, 9, 14, 19, 0, 2, '2019-11-23 08:15:15', '2019-11-23 08:15:15', '19974c8d-72b2-4579-9ec8-27e99763734a'),
(43, 9, 14, 20, 0, 3, '2019-11-23 08:15:15', '2019-11-23 08:15:15', '160018fd-bc1e-4e4f-a191-f59a9fe41b34');

-- --------------------------------------------------------

--
-- Table structure for table `fieldlayouts`
--

CREATE TABLE `fieldlayouts` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fieldlayouts`
--

INSERT INTO `fieldlayouts` (`id`, `type`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 'craft\\elements\\Entry', '2019-11-17 03:13:40', '2019-11-17 05:33:47', NULL, '989b76e3-f78d-46ba-a27c-f012bff692fb'),
(2, 'craft\\elements\\Entry', '2019-11-17 03:13:53', '2019-11-17 03:13:53', NULL, '35c59b5a-36d4-49b0-80d6-4884cefb92ec'),
(3, 'craft\\elements\\Entry', '2019-11-17 03:14:44', '2019-11-17 05:06:06', NULL, '001227e4-823c-493a-b92f-a6c42dfb0562'),
(4, 'craft\\elements\\Entry', '2019-11-17 03:15:14', '2019-11-17 03:22:23', NULL, '613b0374-2727-4045-b3de-9fdbab131097'),
(6, 'craft\\elements\\MatrixBlock', '2019-11-17 05:05:39', '2019-11-17 05:27:52', NULL, '9ffa248a-8c2d-445c-8841-f9c32332c923'),
(7, 'craft\\elements\\MatrixBlock', '2019-11-17 05:33:06', '2019-11-17 05:33:06', NULL, '4c73fc9b-af2e-4e6a-bab9-513aa4d634be'),
(8, 'craft\\elements\\Entry', '2019-11-23 01:32:23', '2019-11-23 01:32:23', NULL, '8b4a0618-795f-442f-acab-4c299884450d'),
(9, 'craft\\elements\\User', '2019-11-23 08:15:15', '2019-11-23 08:15:15', NULL, 'ac1b6471-20fc-4144-bd87-acdae5219a90');

-- --------------------------------------------------------

--
-- Table structure for table `fieldlayouttabs`
--

CREATE TABLE `fieldlayouttabs` (
  `id` int(11) NOT NULL,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fieldlayouttabs`
--

INSERT INTO `fieldlayouttabs` (`id`, `layoutId`, `name`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(2, 4, 'Tab 1', 1, '2019-11-17 03:22:23', '2019-11-17 03:22:23', 'f289690d-ac5a-4996-97ec-5933a65a14b3'),
(4, 3, 'Tab 1', 1, '2019-11-17 05:06:06', '2019-11-17 05:06:06', '4e86071c-e9d6-4cb3-8e1b-f4be090aaf54'),
(10, 6, 'Content', 1, '2019-11-17 05:27:52', '2019-11-17 05:27:52', '48168031-f5b3-4a49-9b4a-76a029164ae6'),
(11, 7, 'Content', 1, '2019-11-17 05:33:06', '2019-11-17 05:33:06', '1b0bfc84-4b74-40ec-bbb3-de089245cfa2'),
(12, 1, 'Tab 1', 1, '2019-11-17 05:33:47', '2019-11-17 05:33:47', 'eec1d025-0ab5-4085-99c4-fcdc2753d3c3'),
(13, 8, 'News', 1, '2019-11-23 01:32:23', '2019-11-23 01:32:23', 'c30d135b-64cb-4580-89bf-9e67c3588da5'),
(14, 9, 'Users', 1, '2019-11-23 08:15:15', '2019-11-23 08:15:15', '8ddccce8-a59e-4122-8054-604d7f34ffd3');

-- --------------------------------------------------------

--
-- Table structure for table `fields`
--

CREATE TABLE `fields` (
  `id` int(11) NOT NULL,
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
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fields`
--

INSERT INTO `fields` (`id`, `groupId`, `name`, `handle`, `context`, `instructions`, `searchable`, `translationMethod`, `translationKeyFormat`, `type`, `settings`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(6, 3, 'Available Products', 'availableProducts', 'global', '', 1, 'site', NULL, 'craft\\fields\\Matrix', '{\"minBlocks\":\"\",\"maxBlocks\":\"\",\"contentTable\":\"{{%matrixcontent_availableproducts}}\",\"localizeBlocks\":false}', '2019-11-17 05:05:39', '2019-11-17 05:27:52', '050801e0-9914-4a65-a49c-c3418c2da200'),
(8, NULL, 'Product Name', 'productName', 'matrixBlockType:a91239bf-7096-439b-8ba1-066c475967f0', '', 1, 'none', NULL, 'craft\\fields\\PlainText', '{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}', '2019-11-17 05:05:39', '2019-11-17 05:27:52', '611dcf48-d3df-4e35-bef6-ed0253894db5'),
(9, NULL, 'Price', 'price', 'matrixBlockType:a91239bf-7096-439b-8ba1-066c475967f0', '', 1, 'none', NULL, 'craft\\fields\\PlainText', '{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}', '2019-11-17 05:05:39', '2019-11-17 05:27:52', '1a093554-c08f-40f7-b0b7-d691befee085'),
(10, NULL, 'Image', 'image', 'matrixBlockType:a91239bf-7096-439b-8ba1-066c475967f0', '', 1, 'site', NULL, 'craft\\fields\\Assets', '{\"useSingleFolder\":\"\",\"defaultUploadLocationSource\":null,\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":null,\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"\",\"allowedKinds\":null,\"sources\":\"*\",\"source\":null,\"targetSiteId\":null,\"viewMode\":\"list\",\"limit\":\"\",\"selectionLabel\":\"\",\"localizeRelations\":false}', '2019-11-17 05:05:39', '2019-11-20 10:20:44', 'e59be861-cc06-4f7d-8419-a990bddd30fd'),
(11, NULL, 'Available?', 'available', 'matrixBlockType:a91239bf-7096-439b-8ba1-066c475967f0', '', 1, 'none', NULL, 'craft\\fields\\Dropdown', '{\"options\":[{\"label\":\"Available\",\"value\":\"available\",\"default\":\"1\"},{\"label\":\"Unavailable\",\"value\":\"unavailable\",\"default\":\"\"}]}', '2019-11-17 05:27:52', '2019-11-17 05:27:52', '9e62a5a5-7e6d-4e9c-8dda-f19f38b75cf1'),
(12, 4, 'News Feed', 'newsFeed', 'global', '', 1, 'site', NULL, 'craft\\fields\\Matrix', '{\"minBlocks\":\"\",\"maxBlocks\":\"\",\"contentTable\":\"{{%matrixcontent_newsfeed}}\",\"localizeBlocks\":false}', '2019-11-17 05:33:06', '2019-11-17 05:33:06', '737f3d64-426a-45e4-869b-05a5dcf2c242'),
(13, NULL, 'News Title', 'newsTitle', 'matrixBlockType:14ed5bdb-4241-477f-9e04-f101c7a5d12e', '', 1, 'none', NULL, 'craft\\fields\\PlainText', '{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}', '2019-11-17 05:33:06', '2019-11-17 05:33:06', '90ec5ac1-0769-4d13-a06e-c7def0978065'),
(14, NULL, 'News Description', 'newsDescription', 'matrixBlockType:14ed5bdb-4241-477f-9e04-f101c7a5d12e', '', 1, 'none', NULL, 'craft\\fields\\PlainText', '{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}', '2019-11-17 05:33:06', '2019-11-17 05:33:06', '0279eb13-a8c6-4fbb-854c-f959a7e7ec0c'),
(15, NULL, 'Image', 'image', 'matrixBlockType:14ed5bdb-4241-477f-9e04-f101c7a5d12e', '', 1, 'site', NULL, 'craft\\fields\\Assets', '{\"useSingleFolder\":\"\",\"defaultUploadLocationSource\":null,\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":null,\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"\",\"allowedKinds\":null,\"sources\":\"*\",\"source\":null,\"targetSiteId\":null,\"viewMode\":\"list\",\"limit\":\"\",\"selectionLabel\":\"\",\"localizeRelations\":false}', '2019-11-17 05:33:06', '2019-11-20 10:20:44', 'c3024897-2d66-4ebc-81d2-0fde5834f3e2'),
(16, 5, 'News Title', 'newsTitle', 'global', '', 1, 'none', NULL, 'craft\\fields\\PlainText', '{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}', '2019-11-23 01:30:32', '2019-11-23 02:18:43', 'c4585c4e-f4a6-439c-a95b-1f2a50263b07'),
(17, 5, 'News Description', 'newsDescription', 'global', '', 1, 'none', NULL, 'craft\\fields\\PlainText', '{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}', '2019-11-23 01:30:59', '2019-11-23 01:30:59', '631b609a-3a78-4ddb-acae-caf3c6057662'),
(18, 5, 'News Products ', 'newsProducts', 'global', '', 1, 'site', NULL, 'craft\\fields\\Entries', '{\"sources\":[\"section:5a041f1d-964e-41a5-a3e7-36f0a91ec4e2\"],\"source\":null,\"targetSiteId\":null,\"viewMode\":null,\"limit\":\"6\",\"selectionLabel\":\"Add Products\",\"localizeRelations\":false,\"validateRelatedElements\":\"\"}', '2019-11-23 01:31:57', '2019-11-23 01:31:57', '0b3353c6-6585-45e9-9b26-7f8a36124b56'),
(19, 6, 'First Name', 'firstName', 'global', '', 1, 'none', NULL, 'craft\\fields\\PlainText', '{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}', '2019-11-23 08:14:50', '2019-11-23 08:14:50', '5102df7b-e447-4874-9c46-d4cb75c13b7c'),
(20, 6, 'Last Name', 'lastName', 'global', '', 1, 'none', NULL, 'craft\\fields\\PlainText', '{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}', '2019-11-23 08:14:56', '2019-11-23 08:14:56', 'cfa2e5f0-3a12-438e-9cde-6d040f2cb87a'),
(21, 6, 'Email', 'email', 'global', '', 1, 'none', NULL, 'craft\\fields\\PlainText', '{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}', '2019-11-23 08:15:00', '2019-11-23 08:15:00', '23d11b87-2fe8-43aa-bdcd-4bf76b0c0719');

-- --------------------------------------------------------

--
-- Table structure for table `globalsets`
--

CREATE TABLE `globalsets` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `gqlschemas`
--

CREATE TABLE `gqlschemas` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `accessToken` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `scope` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gqlschemas`
--

INSERT INTO `gqlschemas` (`id`, `name`, `accessToken`, `enabled`, `expiryDate`, `lastUsed`, `scope`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'Public Schema', '__PUBLIC__', 1, NULL, NULL, '[]', '2019-11-25 05:19:28', '2019-11-25 05:19:28', '34cf6406-e094-4705-9ef8-c422a0d99875');

-- --------------------------------------------------------

--
-- Table structure for table `info`
--

CREATE TABLE `info` (
  `id` int(11) NOT NULL,
  `version` varchar(50) NOT NULL,
  `schemaVersion` varchar(15) NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `config` mediumtext,
  `configMap` mediumtext,
  `fieldVersion` char(12) NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `info`
--

INSERT INTO `info` (`id`, `version`, `schemaVersion`, `maintenance`, `config`, `configMap`, `fieldVersion`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, '3.3.15', '3.3.3', 0, '{\"dateModified\":1574659242,\"email\":{\"fromEmail\":\"noreply@awatoruwildfood.co.nz\",\"fromName\":\"Awatoru Wildfood\",\"template\":null,\"transportType\":\"putyourlightson\\\\sendgrid\\\\mail\\\\SendgridAdapter\",\"transportSettings\":{\"apiKey\":\"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\"}},\"fieldGroups\":{\"335454c1-7446-4c14-b7af-251dcc1e3a22\":{\"name\":\"News feed\"},\"4b000de0-c332-4c52-806f-0b6adf2a6140\":{\"name\":\"Products\"},\"55709eb1-437b-45bb-94b7-e6328204f455\":{\"name\":\"Order Form\"},\"7a701a6e-72c8-4d5b-ac96-2830c462a6ea\":{\"name\":\"Users\"},\"8ee3bcf1-2ef7-4684-bdc0-ce8ed5a1a3b1\":{\"name\":\"Common\"},\"a3e62c01-c6b9-47f6-9904-6db8c24f0b71\":{\"name\":\"News\"}},\"fields\":{\"050801e0-9914-4a65-a49c-c3418c2da200\":{\"name\":\"Available Products\",\"handle\":\"availableProducts\",\"instructions\":\"\",\"searchable\":true,\"translationMethod\":\"site\",\"translationKeyFormat\":null,\"type\":\"craft\\\\fields\\\\Matrix\",\"settings\":{\"minBlocks\":\"\",\"maxBlocks\":\"\",\"contentTable\":\"{{%matrixcontent_availableproducts}}\",\"localizeBlocks\":false},\"fieldGroup\":\"55709eb1-437b-45bb-94b7-e6328204f455\",\"contentColumnType\":\"string\"},\"0b3353c6-6585-45e9-9b26-7f8a36124b56\":{\"name\":\"News Products \",\"handle\":\"newsProducts\",\"instructions\":\"\",\"searchable\":true,\"translationMethod\":\"site\",\"translationKeyFormat\":null,\"type\":\"craft\\\\fields\\\\Entries\",\"settings\":{\"sources\":[\"section:5a041f1d-964e-41a5-a3e7-36f0a91ec4e2\"],\"source\":null,\"targetSiteId\":null,\"viewMode\":null,\"limit\":\"6\",\"selectionLabel\":\"Add Products\",\"localizeRelations\":false,\"validateRelatedElements\":\"\"},\"contentColumnType\":\"string\",\"fieldGroup\":\"a3e62c01-c6b9-47f6-9904-6db8c24f0b71\"},\"23d11b87-2fe8-43aa-bdcd-4bf76b0c0719\":{\"name\":\"Email\",\"handle\":\"email\",\"instructions\":\"\",\"searchable\":true,\"translationMethod\":\"none\",\"translationKeyFormat\":null,\"type\":\"craft\\\\fields\\\\PlainText\",\"settings\":{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"},\"contentColumnType\":\"text\",\"fieldGroup\":\"7a701a6e-72c8-4d5b-ac96-2830c462a6ea\"},\"5102df7b-e447-4874-9c46-d4cb75c13b7c\":{\"name\":\"First Name\",\"handle\":\"firstName\",\"instructions\":\"\",\"searchable\":true,\"translationMethod\":\"none\",\"translationKeyFormat\":null,\"type\":\"craft\\\\fields\\\\PlainText\",\"settings\":{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"},\"contentColumnType\":\"text\",\"fieldGroup\":\"7a701a6e-72c8-4d5b-ac96-2830c462a6ea\"},\"631b609a-3a78-4ddb-acae-caf3c6057662\":{\"name\":\"News Description\",\"handle\":\"newsDescription\",\"instructions\":\"\",\"searchable\":true,\"translationMethod\":\"none\",\"translationKeyFormat\":null,\"type\":\"craft\\\\fields\\\\PlainText\",\"settings\":{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"},\"contentColumnType\":\"text\",\"fieldGroup\":\"a3e62c01-c6b9-47f6-9904-6db8c24f0b71\"},\"737f3d64-426a-45e4-869b-05a5dcf2c242\":{\"name\":\"News Feed\",\"handle\":\"newsFeed\",\"instructions\":\"\",\"searchable\":true,\"translationMethod\":\"site\",\"translationKeyFormat\":null,\"type\":\"craft\\\\fields\\\\Matrix\",\"settings\":{\"minBlocks\":\"\",\"maxBlocks\":\"\",\"contentTable\":\"{{%matrixcontent_newsfeed}}\",\"localizeBlocks\":false},\"fieldGroup\":\"335454c1-7446-4c14-b7af-251dcc1e3a22\",\"contentColumnType\":\"string\"},\"c4585c4e-f4a6-439c-a95b-1f2a50263b07\":{\"name\":\"News Title\",\"handle\":\"newsTitle\",\"instructions\":\"\",\"searchable\":true,\"translationMethod\":\"none\",\"translationKeyFormat\":null,\"type\":\"craft\\\\fields\\\\PlainText\",\"settings\":{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"},\"contentColumnType\":\"text\",\"fieldGroup\":\"a3e62c01-c6b9-47f6-9904-6db8c24f0b71\"},\"cfa2e5f0-3a12-438e-9cde-6d040f2cb87a\":{\"name\":\"Last Name\",\"handle\":\"lastName\",\"instructions\":\"\",\"searchable\":true,\"translationMethod\":\"none\",\"translationKeyFormat\":null,\"type\":\"craft\\\\fields\\\\PlainText\",\"settings\":{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"},\"contentColumnType\":\"text\",\"fieldGroup\":\"7a701a6e-72c8-4d5b-ac96-2830c462a6ea\"}},\"matrixBlockTypes\":{\"14ed5bdb-4241-477f-9e04-f101c7a5d12e\":{\"name\":\"News\",\"handle\":\"news\",\"sortOrder\":1,\"field\":\"737f3d64-426a-45e4-869b-05a5dcf2c242\",\"fieldLayouts\":{\"4c73fc9b-af2e-4e6a-bab9-513aa4d634be\":{\"tabs\":[{\"name\":\"Content\",\"sortOrder\":1,\"fields\":{\"0279eb13-a8c6-4fbb-854c-f959a7e7ec0c\":{\"required\":false,\"sortOrder\":2},\"90ec5ac1-0769-4d13-a06e-c7def0978065\":{\"required\":false,\"sortOrder\":1},\"c3024897-2d66-4ebc-81d2-0fde5834f3e2\":{\"required\":false,\"sortOrder\":3}}}]}},\"fields\":{\"0279eb13-a8c6-4fbb-854c-f959a7e7ec0c\":{\"name\":\"News Description\",\"handle\":\"newsDescription\",\"instructions\":\"\",\"searchable\":true,\"translationMethod\":\"none\",\"translationKeyFormat\":null,\"type\":\"craft\\\\fields\\\\PlainText\",\"settings\":{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"},\"fieldGroup\":null,\"contentColumnType\":\"text\"},\"90ec5ac1-0769-4d13-a06e-c7def0978065\":{\"name\":\"News Title\",\"handle\":\"newsTitle\",\"instructions\":\"\",\"searchable\":true,\"translationMethod\":\"none\",\"translationKeyFormat\":null,\"type\":\"craft\\\\fields\\\\PlainText\",\"settings\":{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"},\"fieldGroup\":null,\"contentColumnType\":\"text\"},\"c3024897-2d66-4ebc-81d2-0fde5834f3e2\":{\"name\":\"Image\",\"handle\":\"image\",\"instructions\":\"\",\"searchable\":true,\"translationMethod\":\"site\",\"translationKeyFormat\":null,\"type\":\"craft\\\\fields\\\\Assets\",\"settings\":{\"useSingleFolder\":\"\",\"defaultUploadLocationSource\":null,\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":null,\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"\",\"allowedKinds\":null,\"sources\":\"*\",\"source\":null,\"targetSiteId\":null,\"viewMode\":\"list\",\"limit\":\"\",\"selectionLabel\":\"\",\"localizeRelations\":false},\"fieldGroup\":null,\"contentColumnType\":\"string\"}}},\"a91239bf-7096-439b-8ba1-066c475967f0\":{\"name\":\"Products\",\"handle\":\"products\",\"sortOrder\":1,\"field\":\"050801e0-9914-4a65-a49c-c3418c2da200\",\"fieldLayouts\":{\"9ffa248a-8c2d-445c-8841-f9c32332c923\":{\"tabs\":[{\"name\":\"Content\",\"sortOrder\":1,\"fields\":{\"1a093554-c08f-40f7-b0b7-d691befee085\":{\"required\":false,\"sortOrder\":2},\"611dcf48-d3df-4e35-bef6-ed0253894db5\":{\"required\":false,\"sortOrder\":1},\"9e62a5a5-7e6d-4e9c-8dda-f19f38b75cf1\":{\"required\":false,\"sortOrder\":4},\"e59be861-cc06-4f7d-8419-a990bddd30fd\":{\"required\":false,\"sortOrder\":3}}}]}},\"fields\":{\"1a093554-c08f-40f7-b0b7-d691befee085\":{\"name\":\"Price\",\"handle\":\"price\",\"instructions\":\"\",\"searchable\":true,\"translationMethod\":\"none\",\"translationKeyFormat\":null,\"type\":\"craft\\\\fields\\\\PlainText\",\"settings\":{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"},\"fieldGroup\":null,\"contentColumnType\":\"text\"},\"611dcf48-d3df-4e35-bef6-ed0253894db5\":{\"name\":\"Product Name\",\"handle\":\"productName\",\"instructions\":\"\",\"searchable\":true,\"translationMethod\":\"none\",\"translationKeyFormat\":null,\"type\":\"craft\\\\fields\\\\PlainText\",\"settings\":{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"},\"fieldGroup\":null,\"contentColumnType\":\"text\"},\"9e62a5a5-7e6d-4e9c-8dda-f19f38b75cf1\":{\"name\":\"Available?\",\"handle\":\"available\",\"instructions\":\"\",\"searchable\":true,\"translationMethod\":\"none\",\"translationKeyFormat\":null,\"type\":\"craft\\\\fields\\\\Dropdown\",\"settings\":{\"options\":[{\"label\":\"Available\",\"value\":\"available\",\"default\":\"1\"},{\"label\":\"Unavailable\",\"value\":\"unavailable\",\"default\":\"\"}]},\"fieldGroup\":null,\"contentColumnType\":\"string\"},\"e59be861-cc06-4f7d-8419-a990bddd30fd\":{\"name\":\"Image\",\"handle\":\"image\",\"instructions\":\"\",\"searchable\":true,\"translationMethod\":\"site\",\"translationKeyFormat\":null,\"type\":\"craft\\\\fields\\\\Assets\",\"settings\":{\"useSingleFolder\":\"\",\"defaultUploadLocationSource\":null,\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":null,\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"\",\"allowedKinds\":null,\"sources\":\"*\",\"source\":null,\"targetSiteId\":null,\"viewMode\":\"list\",\"limit\":\"\",\"selectionLabel\":\"\",\"localizeRelations\":false},\"fieldGroup\":null,\"contentColumnType\":\"string\"}}}},\"plugins\":{\"webhooks\":{\"edition\":\"standard\",\"enabled\":true,\"schemaVersion\":\"2.2.0\"},\"contact-form\":{\"edition\":\"standard\",\"enabled\":true,\"schemaVersion\":\"1.0.0\",\"settings\":{\"toEmail\":\"h.lawrence@windowslive.com\",\"prependSender\":\"On behalf of\",\"prependSubject\":\"New message from Awatoru\",\"allowAttachments\":\"\",\"successFlashMessage\":\"Your message has been sent.\"}},\"sendgrid\":{\"edition\":\"standard\",\"enabled\":true,\"schemaVersion\":\"1.0.0\"}},\"sections\":{\"5a041f1d-964e-41a5-a3e7-36f0a91ec4e2\":{\"name\":\"Products\",\"handle\":\"products\",\"type\":\"channel\",\"enableVersioning\":true,\"entryTypes\":{\"3c5453b2-9842-4725-9430-cf7723a09c1f\":{\"name\":\"Products\",\"handle\":\"products\",\"hasTitleField\":true,\"titleLabel\":\"Title\",\"titleFormat\":null,\"sortOrder\":1}},\"siteSettings\":{\"1d897520-a9e2-4981-beda-4254507df91e\":{\"enabledByDefault\":true,\"hasUrls\":true,\"uriFormat\":\"products/{slug}\",\"template\":\"products/_entry\"}},\"propagationMethod\":\"all\"},\"799c5f9f-5fc4-44eb-9ab5-6b5b70a2fd4d\":{\"name\":\"Home\",\"handle\":\"home\",\"type\":\"single\",\"enableVersioning\":true,\"entryTypes\":{\"1efb8a72-3c56-462d-9a85-0c686962f8cb\":{\"name\":\"Home\",\"handle\":\"home\",\"hasTitleField\":false,\"titleLabel\":null,\"titleFormat\":\"{section.name|raw}\",\"sortOrder\":1,\"fieldLayouts\":{\"989b76e3-f78d-46ba-a27c-f012bff692fb\":{\"tabs\":[{\"name\":\"Tab 1\",\"sortOrder\":1,\"fields\":{\"737f3d64-426a-45e4-869b-05a5dcf2c242\":{\"required\":false,\"sortOrder\":1}}}]}}}},\"siteSettings\":{\"1d897520-a9e2-4981-beda-4254507df91e\":{\"enabledByDefault\":true,\"hasUrls\":true,\"uriFormat\":\"__home__\",\"template\":\"home/_entry\"}},\"propagationMethod\":\"all\"},\"a8cbca0d-d8d9-4dfd-bc56-39396f122ab0\":{\"name\":\"Contact\",\"handle\":\"contact\",\"type\":\"single\",\"enableVersioning\":true,\"entryTypes\":{\"819facc5-de6d-46f5-bb81-bb1982b4b5e8\":{\"name\":\"Contact\",\"handle\":\"contact\",\"hasTitleField\":false,\"titleLabel\":null,\"titleFormat\":\"{section.name|raw}\",\"sortOrder\":1}},\"siteSettings\":{\"1d897520-a9e2-4981-beda-4254507df91e\":{\"enabledByDefault\":true,\"hasUrls\":true,\"uriFormat\":\"contact\",\"template\":\"contact/_entry\"}},\"propagationMethod\":\"all\"},\"ab35d417-427e-443b-b529-21866d37ba58\":{\"name\":\"Order Form\",\"handle\":\"orderForm\",\"type\":\"single\",\"enableVersioning\":true,\"entryTypes\":{\"65959724-a677-4bbf-b3c5-7053f5fdd9e9\":{\"name\":\"Order Form\",\"handle\":\"orderForm\",\"hasTitleField\":false,\"titleLabel\":null,\"titleFormat\":\"{section.name|raw}\",\"sortOrder\":1,\"fieldLayouts\":{\"001227e4-823c-493a-b92f-a6c42dfb0562\":{\"tabs\":[{\"name\":\"Tab 1\",\"sortOrder\":1,\"fields\":{\"050801e0-9914-4a65-a49c-c3418c2da200\":{\"required\":false,\"sortOrder\":1}}}]}}}},\"siteSettings\":{\"1d897520-a9e2-4981-beda-4254507df91e\":{\"enabledByDefault\":true,\"hasUrls\":true,\"uriFormat\":\"order\",\"template\":\"order/_entry\"}},\"propagationMethod\":\"all\"},\"fbeaeb48-e4f3-44bb-b933-90a97eff2358\":{\"name\":\"News\",\"handle\":\"news\",\"type\":\"channel\",\"enableVersioning\":true,\"propagationMethod\":\"all\",\"siteSettings\":{\"1d897520-a9e2-4981-beda-4254507df91e\":{\"enabledByDefault\":true,\"hasUrls\":true,\"uriFormat\":\"news/{slug}\",\"template\":\"news/_entry\"}},\"entryTypes\":{\"a39dd88a-bcfb-456b-a070-327b5b514111\":{\"name\":\"News\",\"handle\":\"news\",\"hasTitleField\":true,\"titleLabel\":\"Title\",\"titleFormat\":\"\",\"sortOrder\":1,\"fieldLayouts\":{\"8b4a0618-795f-442f-acab-4c299884450d\":{\"tabs\":[{\"name\":\"News\",\"sortOrder\":1,\"fields\":{\"0b3353c6-6585-45e9-9b26-7f8a36124b56\":{\"required\":false,\"sortOrder\":2},\"631b609a-3a78-4ddb-acae-caf3c6057662\":{\"required\":false,\"sortOrder\":1},\"c4585c4e-f4a6-439c-a95b-1f2a50263b07\":{\"required\":false,\"sortOrder\":3}}}]}}}}}},\"siteGroups\":{\"c9424660-0760-48b0-b613-2c3499cf4ff8\":{\"name\":\"Craft3 Jir6 Frb - Awatoru\"}},\"sites\":{\"1d897520-a9e2-4981-beda-4254507df91e\":{\"name\":\"Craft3 Jir6 Frb - Awatoru\",\"handle\":\"default\",\"language\":\"en-GB\",\"hasUrls\":true,\"baseUrl\":\"@web/\",\"sortOrder\":1,\"primary\":true,\"siteGroup\":\"c9424660-0760-48b0-b613-2c3499cf4ff8\"}},\"system\":{\"edition\":\"pro\",\"live\":true,\"name\":\"Craft3 Jir6 Frb - Awatoru\",\"timeZone\":\"America/Los_Angeles\",\"schemaVersion\":\"3.3.3\"},\"users\":{\"requireEmailVerification\":true,\"allowPublicRegistration\":true,\"defaultGroup\":\"2bc2f604-a7fc-4567-b7db-bed1568be1c3\",\"photoVolumeUid\":null,\"photoSubpath\":null,\"fieldLayouts\":{\"ac1b6471-20fc-4144-bd87-acdae5219a90\":{\"tabs\":[{\"name\":\"Users\",\"sortOrder\":1,\"fields\":{\"23d11b87-2fe8-43aa-bdcd-4bf76b0c0719\":{\"required\":false,\"sortOrder\":1},\"5102df7b-e447-4874-9c46-d4cb75c13b7c\":{\"required\":false,\"sortOrder\":2},\"cfa2e5f0-3a12-438e-9cde-6d040f2cb87a\":{\"required\":false,\"sortOrder\":3}}}]}},\"groups\":{\"2bc2f604-a7fc-4567-b7db-bed1568be1c3\":{\"name\":\"Restaurants \",\"handle\":\"restaurants\"}}}}', '{\"dateModified\":\"@config/project.yaml\",\"siteGroups\":\"@config/project.yaml\",\"sites\":\"@config/project.yaml\",\"sections\":\"@config/project.yaml\",\"fieldGroups\":\"@config/project.yaml\",\"fields\":\"@config/project.yaml\",\"matrixBlockTypes\":\"@config/project.yaml\",\"volumes\":\"@config/project.yaml\",\"categoryGroups\":\"@config/project.yaml\",\"tagGroups\":\"@config/project.yaml\",\"users\":\"@config/project.yaml\",\"globalSets\":\"@config/project.yaml\",\"plugins\":\"@config/project.yaml\",\"email\":\"@config/project.yaml\",\"system\":\"@config/project.yaml\",\"imageTransforms\":\"@config/project.yaml\",\"routes\":\"@config/project.yaml\"}', 'PLXmvvRbB61D', '2019-11-17 03:11:01', '2019-11-20 10:19:45', '3bfb9b38-18be-4576-90fc-843650eef0bf');

-- --------------------------------------------------------

--
-- Table structure for table `matrixblocks`
--

CREATE TABLE `matrixblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `matrixblocks`
--

INSERT INTO `matrixblocks` (`id`, `ownerId`, `fieldId`, `typeId`, `sortOrder`, `deletedWithOwner`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(7, 4, 6, 2, 1, NULL, '2019-11-17 05:06:24', '2019-11-17 05:29:12', 'f4316078-71fd-4fbf-8221-5a270dd34ad8'),
(8, 4, 6, 2, 2, NULL, '2019-11-17 05:28:35', '2019-11-17 05:29:12', 'ed2ff156-c8a7-4201-8311-ddbb49c85b92'),
(9, 2, 12, 3, 2, 0, '2019-11-17 05:34:08', '2019-11-17 05:35:16', '77003350-40a7-44dd-b779-268f1531b426'),
(10, 2, 12, 3, 1, NULL, '2019-11-17 05:35:01', '2019-11-17 05:35:16', '99c2f1cf-82c9-4253-bcfe-56eb0fabae27'),
(11, 2, 12, 3, 3, 0, '2019-11-17 05:35:16', '2019-11-17 05:35:16', 'c1fb3fbf-7330-4989-861a-61e3b1d6c24c'),
(13, 12, 12, 3, 1, NULL, '2019-11-20 10:20:47', '2019-11-20 10:20:47', '7cf2766f-389f-4531-89a6-27de32355a42'),
(14, 12, 12, 3, 2, NULL, '2019-11-20 10:20:47', '2019-11-20 10:20:47', 'db68c89e-3045-4b71-807b-5fca17bcd4d4'),
(15, 12, 12, 3, 3, NULL, '2019-11-20 10:20:47', '2019-11-20 10:20:47', 'c9e9cdf1-274e-4960-93c0-48ece795d652'),
(17, 16, 12, 3, 1, NULL, '2019-11-20 10:20:47', '2019-11-20 10:20:47', 'ccfbcb83-9a29-42ef-8046-64be266bd5a6'),
(18, 16, 12, 3, 2, NULL, '2019-11-20 10:20:47', '2019-11-20 10:20:47', 'b35552b2-5f26-4623-b679-142974a6f359'),
(19, 16, 12, 3, 3, 0, '2019-11-20 10:20:47', '2019-11-20 10:20:47', '28d93b8d-9f75-4fa0-a8c5-6df247432c1f'),
(21, 20, 12, 3, 1, 0, '2019-11-20 10:20:47', '2019-11-20 10:20:47', 'ba99e495-bbc3-4ae6-b215-05422530edb6'),
(22, 20, 12, 3, 1, NULL, '2019-11-20 10:20:47', '2019-11-20 10:20:47', '50b1970a-a4ca-413c-8a61-b00faabcfbdd'),
(23, 20, 12, 3, 3, 0, '2019-11-20 10:20:47', '2019-11-20 10:20:47', '58ca4a78-582c-4cea-b59c-2cc735886880'),
(25, 24, 12, 3, 1, 0, '2019-11-20 10:20:47', '2019-11-20 10:20:47', '1472d3b1-0a50-477f-8ac8-04c5a0724576'),
(26, 24, 12, 3, 2, 0, '2019-11-20 10:20:47', '2019-11-20 10:20:47', 'c42e4da2-c361-49a3-baaf-3cff1c1e79a6'),
(27, 24, 12, 3, 3, 0, '2019-11-20 10:20:47', '2019-11-20 10:20:47', '5a1e0ccb-d24b-4746-b342-792d67997206'),
(29, 28, 6, 2, 1, NULL, '2019-11-20 10:20:47', '2019-11-20 10:20:47', '3d5a9e8e-1a7f-4a28-8eb2-06c9bf35e8f9'),
(30, 28, 6, 2, 2, NULL, '2019-11-20 10:20:47', '2019-11-20 10:20:47', '014707fe-8e27-4c67-853a-967c20127dd1'),
(32, 31, 6, 2, 1, NULL, '2019-11-20 10:20:48', '2019-11-20 10:20:48', '39facd81-4e76-47c7-b0a3-e341b57b18dd'),
(33, 31, 6, 2, 2, NULL, '2019-11-20 10:20:48', '2019-11-20 10:20:48', '0b875c59-2d3a-41dd-8efa-faa7795e1d3b'),
(35, 34, 6, 2, 1, NULL, '2019-11-20 10:20:48', '2019-11-20 10:20:48', '6fa58149-265a-4fc4-8caf-c80ac14f1b95'),
(36, 34, 6, 2, 2, 0, '2019-11-20 10:20:48', '2019-11-20 10:20:48', '67989b35-6f0e-445f-8f81-3e2ae93e4dc2'),
(38, 37, 6, 2, 1, NULL, '2019-11-20 10:20:48', '2019-11-20 10:20:48', 'bb6f42b2-b808-464b-83a0-7843acd48814'),
(39, 37, 6, 2, 2, 0, '2019-11-20 10:20:48', '2019-11-20 10:20:48', '5577b9f5-9241-4e98-96d1-e6d53bf431a5'),
(41, 40, 6, 2, 1, NULL, '2019-11-20 10:20:48', '2019-11-20 10:20:48', 'e03e17e4-9165-4498-9588-466463a69e6e'),
(42, 40, 6, 2, 2, 0, '2019-11-20 10:20:48', '2019-11-20 10:20:48', 'f7c3a963-f9da-4fe6-bfc1-eb4b7067c51b'),
(44, 43, 6, 2, 1, NULL, '2019-11-20 10:20:48', '2019-11-20 10:20:48', '311b1061-acf8-410d-8d18-8c24a92aabb6'),
(45, 43, 6, 2, 2, 0, '2019-11-20 10:20:48', '2019-11-20 10:20:48', 'c6dcaf6b-5984-4d8e-b11f-54332cd69a77'),
(47, 46, 6, 2, 1, NULL, '2019-11-20 10:20:48', '2019-11-20 10:20:48', '4e45555b-ff09-42bb-88e8-91c1680058af'),
(48, 46, 6, 2, 2, 0, '2019-11-20 10:20:48', '2019-11-20 10:20:48', 'ba8d75fb-1535-4c5f-b28a-cec2e8624380'),
(50, 49, 6, 2, 1, NULL, '2019-11-20 10:20:48', '2019-11-20 10:20:48', '4c53159a-e052-4c41-baba-4d5a1c77f2ab'),
(51, 49, 6, 2, 2, 0, '2019-11-20 10:20:48', '2019-11-20 10:20:48', 'c65a2b3e-b103-4b5c-93e1-48466f14368c'),
(53, 52, 6, 2, 1, NULL, '2019-11-20 10:20:48', '2019-11-20 10:20:48', '145d0252-2f46-4cf2-90ce-292b2437984b'),
(54, 52, 6, 2, 2, 0, '2019-11-20 10:20:48', '2019-11-20 10:20:48', '00c9640d-70f8-43dd-a5b8-9f16992b0e02'),
(56, 55, 6, 2, 1, NULL, '2019-11-20 10:20:48', '2019-11-20 10:20:48', 'c83c947c-cd1e-4f88-a23b-6087d0c84773'),
(57, 55, 6, 2, 2, 0, '2019-11-20 10:20:48', '2019-11-20 10:20:48', 'ab8a7ce7-169e-44d8-949e-dadfc3d29336'),
(59, 58, 6, 2, 1, NULL, '2019-11-20 10:20:48', '2019-11-20 10:20:48', '3a8fdd45-6743-42b6-b292-5f0c8bf2b1e9'),
(60, 58, 6, 2, 2, 0, '2019-11-20 10:20:48', '2019-11-20 10:20:48', 'a8addf11-f257-4c48-9ba1-9e11c194b497'),
(62, 61, 6, 2, 1, NULL, '2019-11-20 10:20:48', '2019-11-20 10:20:48', 'ab794ec2-ff61-4643-8b3b-441ec551e16e'),
(63, 61, 6, 2, 2, 0, '2019-11-20 10:20:48', '2019-11-20 10:20:48', 'da87118c-8d40-442d-8f00-fdd366320a54'),
(65, 64, 6, 2, 1, NULL, '2019-11-20 10:20:48', '2019-11-20 10:20:48', '3cc5d884-6eba-4171-82c8-c993492a35d3'),
(66, 64, 6, 2, 2, 0, '2019-11-20 10:20:48', '2019-11-20 10:20:48', '3298571d-c063-4b3c-86eb-265ca187a036'),
(68, 67, 6, 2, 1, NULL, '2019-11-20 10:20:48', '2019-11-20 10:20:48', '856556e6-34ba-4ad3-b52d-2927dfb42986'),
(69, 67, 6, 2, 2, 0, '2019-11-20 10:20:48', '2019-11-20 10:20:48', 'adf9521f-e7af-4007-be6b-e2611922a816'),
(71, 70, 6, 2, 1, 0, '2019-11-20 10:20:48', '2019-11-20 10:20:48', '22f408f3-f80a-4efb-99b9-979a186b9068'),
(72, 70, 6, 2, 2, 0, '2019-11-20 10:20:48', '2019-11-20 10:20:48', '4a330219-d6ad-4f5e-a912-edceb7a3f415'),
(75, 74, 6, 2, 1, NULL, '2019-11-20 10:31:28', '2019-11-20 10:31:28', 'd4791077-287b-4e79-bfac-8584b68a6e4d'),
(76, 74, 6, 2, 2, NULL, '2019-11-20 10:31:28', '2019-11-20 10:31:28', '25882833-710a-492e-b71f-f9ce16008e1d'),
(80, 79, 12, 3, 1, NULL, '2019-11-20 10:33:23', '2019-11-20 10:33:23', '294e1c73-20c5-419f-8dce-f0ca15761b7e'),
(81, 79, 12, 3, 2, NULL, '2019-11-20 10:33:23', '2019-11-20 10:33:23', 'ebc763ad-9d05-409c-85b4-ea1f80cda023'),
(82, 79, 12, 3, 3, NULL, '2019-11-20 10:33:23', '2019-11-20 10:33:23', '037d6d42-59ab-4232-9a17-fbef1c3594bf'),
(84, 83, 6, 2, 1, NULL, '2019-11-20 10:35:01', '2019-11-20 10:35:01', '027c3bad-ab5f-4b38-9839-35607422d739'),
(85, 83, 6, 2, 2, NULL, '2019-11-20 10:35:01', '2019-11-20 10:35:01', '4351ebf0-09a6-4e9a-80b1-8167976befe1'),
(91, 90, 12, 3, 1, NULL, '2019-11-23 00:54:46', '2019-11-23 00:54:46', 'f4d114bc-8ae6-4919-bbdd-85d9648cd7b4'),
(92, 90, 12, 3, 2, NULL, '2019-11-23 00:54:46', '2019-11-23 00:54:46', '1a020b6e-bafc-4e7c-8f38-9ad62a080df7'),
(93, 90, 12, 3, 3, NULL, '2019-11-23 00:54:46', '2019-11-23 00:54:46', '70ae8735-d8a4-4606-bb2e-8c3cff85cb60'),
(95, 94, 12, 3, 1, NULL, '2019-11-23 01:10:56', '2019-11-23 01:10:56', '25dbc56c-1d4b-47ed-a384-11d265f4e1ae'),
(96, 94, 12, 3, 2, NULL, '2019-11-23 01:10:56', '2019-11-23 01:10:56', '4c938783-97bd-4005-8aca-530f46c429de'),
(97, 94, 12, 3, 3, NULL, '2019-11-23 01:10:56', '2019-11-23 01:10:56', '581a314c-e358-445a-8d60-401a45563110'),
(102, 2, 12, 3, 4, 0, '2019-11-23 01:21:42', '2019-11-23 01:21:42', 'bc2481e6-eb4a-4710-b63a-3138c03de976'),
(104, 103, 12, 3, 1, NULL, '2019-11-23 01:21:43', '2019-11-23 01:21:43', '3b90b5cd-b179-4780-aafe-f4bdea501314'),
(105, 103, 12, 3, 2, NULL, '2019-11-23 01:21:43', '2019-11-23 01:21:43', 'fc2afd77-4c6d-4769-ab0d-6e465f6b7fc3'),
(106, 103, 12, 3, 3, NULL, '2019-11-23 01:21:43', '2019-11-23 01:21:43', 'bfa98b23-4b33-4f08-8bb1-28277cbdf07d'),
(107, 103, 12, 3, 4, NULL, '2019-11-23 01:21:43', '2019-11-23 01:21:43', 'f577d24f-c5ff-4e97-8d91-1718798dd617'),
(109, 2, 12, 3, 5, 0, '2019-11-23 01:25:17', '2019-11-23 01:25:17', '9c07e934-d081-4c6e-8e82-568920171b29'),
(111, 110, 12, 3, 1, NULL, '2019-11-23 01:25:17', '2019-11-23 01:25:17', 'ad98c1ad-7355-4e18-94da-ac545e742a8b'),
(112, 110, 12, 3, 2, NULL, '2019-11-23 01:25:17', '2019-11-23 01:25:17', 'b210b18f-1b86-4410-9b23-f503750e731b'),
(113, 110, 12, 3, 3, NULL, '2019-11-23 01:25:17', '2019-11-23 01:25:17', 'd72b1943-4182-4228-9bb0-e1584086b6f3'),
(114, 110, 12, 3, 4, NULL, '2019-11-23 01:25:17', '2019-11-23 01:25:17', '1a7beb9a-688d-4686-be3f-455443abbe45'),
(115, 110, 12, 3, 5, NULL, '2019-11-23 01:25:17', '2019-11-23 01:25:17', 'a5033cce-7286-4213-9b14-7eb10a44e02b'),
(127, 126, 12, 3, 1, NULL, '2019-11-23 01:39:52', '2019-11-23 01:39:52', '3cee1a64-a745-45bd-94d7-44ef80fb3ff7'),
(128, 126, 12, 3, 2, NULL, '2019-11-23 01:39:52', '2019-11-23 01:39:52', '8e904a23-8cf3-40d2-9ccb-35b680f370c3'),
(129, 126, 12, 3, 3, NULL, '2019-11-23 01:39:52', '2019-11-23 01:39:52', 'ddd5923b-4a53-4287-bc3e-f9328ab1c9d9'),
(130, 126, 12, 3, 4, NULL, '2019-11-23 01:39:52', '2019-11-23 01:39:52', '9aa5f8e6-55f6-4b0d-bf8d-bcbff8f2138e'),
(131, 126, 12, 3, 5, NULL, '2019-11-23 01:39:52', '2019-11-23 01:39:52', 'c1265ff3-09e5-4207-a007-3c1b5d020296'),
(135, 2, 12, 3, 6, 0, '2019-11-23 01:41:52', '2019-11-23 01:41:52', '76dd7105-2313-49ec-b2a2-8e64682eb3e4'),
(137, 136, 12, 3, 1, NULL, '2019-11-23 01:41:52', '2019-11-23 01:41:52', 'b13b4a34-6f71-4770-a4cf-684bf4971f6c'),
(138, 136, 12, 3, 2, NULL, '2019-11-23 01:41:52', '2019-11-23 01:41:52', '5520cdab-8dda-460b-bcaf-3b228f16dffd'),
(139, 136, 12, 3, 3, NULL, '2019-11-23 01:41:52', '2019-11-23 01:41:52', '6fb2cd4e-bdf7-44ff-8355-6e4e61545f9b'),
(140, 136, 12, 3, 4, NULL, '2019-11-23 01:41:52', '2019-11-23 01:41:52', '60ceb86e-6ed6-4262-958c-2f508c4516cc'),
(141, 136, 12, 3, 5, NULL, '2019-11-23 01:41:52', '2019-11-23 01:41:52', 'a4dd6e97-6c91-4cc9-a23f-78d97bd6be84'),
(142, 136, 12, 3, 6, NULL, '2019-11-23 01:41:52', '2019-11-23 01:41:52', '999ebc2d-83d5-4aee-8b49-f7508c5ad839'),
(149, 2, 12, 3, 7, 0, '2019-11-23 01:49:57', '2019-11-23 01:49:57', '16979efc-1512-4500-85aa-1bd8c676398c'),
(151, 150, 12, 3, 1, NULL, '2019-11-23 01:49:57', '2019-11-23 01:49:57', 'f9051fdb-4bb0-4855-8c32-5a216129d858'),
(152, 150, 12, 3, 2, NULL, '2019-11-23 01:49:57', '2019-11-23 01:49:57', '4e9e4d21-d6fe-43de-96fd-e168b637fe5a'),
(153, 150, 12, 3, 3, NULL, '2019-11-23 01:49:57', '2019-11-23 01:49:57', '6c5cab04-9468-4a27-b6d5-a373a3a91129'),
(154, 150, 12, 3, 4, NULL, '2019-11-23 01:49:57', '2019-11-23 01:49:57', 'deb02cdb-b35c-44c8-9e25-70acfe16ab5e'),
(155, 150, 12, 3, 5, NULL, '2019-11-23 01:49:57', '2019-11-23 01:49:57', 'e327f231-6f37-40a5-bb21-5c0288fbe31f'),
(156, 150, 12, 3, 6, NULL, '2019-11-23 01:49:57', '2019-11-23 01:49:57', 'c0812286-852a-4f03-9222-0545d8183ba8'),
(157, 150, 12, 3, 7, NULL, '2019-11-23 01:49:57', '2019-11-23 01:49:57', 'b72b6c9d-a5f6-4774-89c5-38b18fa98311'),
(181, 2, 12, 3, 8, 0, '2019-11-23 02:18:03', '2019-11-23 02:18:03', '6f83a5e3-bf44-430f-bcdc-3846d95b1a99'),
(183, 182, 12, 3, 1, NULL, '2019-11-23 02:18:03', '2019-11-23 02:18:03', 'f2f5c82c-758e-4fe0-85d8-aebef5006ccf'),
(184, 182, 12, 3, 2, NULL, '2019-11-23 02:18:03', '2019-11-23 02:18:03', '678dba64-4201-43ce-bfb9-99b7c9e5d449'),
(185, 182, 12, 3, 3, NULL, '2019-11-23 02:18:03', '2019-11-23 02:18:03', 'd11bd3cd-b1af-4c73-bf9e-41247185766a'),
(186, 182, 12, 3, 4, NULL, '2019-11-23 02:18:03', '2019-11-23 02:18:03', 'd8379b1a-ee77-4c80-b291-8dd6f598068f'),
(187, 182, 12, 3, 5, NULL, '2019-11-23 02:18:03', '2019-11-23 02:18:03', '53bc8730-afe0-4615-b18d-dd82d6197d4c'),
(188, 182, 12, 3, 6, NULL, '2019-11-23 02:18:03', '2019-11-23 02:18:03', 'bba098d2-3a6e-4e6c-8477-0cbd727a4aee'),
(189, 182, 12, 3, 7, NULL, '2019-11-23 02:18:03', '2019-11-23 02:18:03', '1e4ba0ae-4bea-4498-ad05-e5e2d0cbbd48'),
(190, 182, 12, 3, 8, NULL, '2019-11-23 02:18:03', '2019-11-23 02:18:03', '200dce1f-fd38-4bf3-b88f-0e3cbbdfe4b4'),
(191, 2, 12, 3, 9, 0, '2019-11-23 02:37:30', '2019-11-23 02:37:30', '5728c500-71d0-4f4f-b95f-47dbd9092c46'),
(193, 192, 12, 3, 1, NULL, '2019-11-23 02:37:30', '2019-11-23 02:37:30', 'a6921eef-d585-4382-b368-df5b716e68f1'),
(194, 192, 12, 3, 2, NULL, '2019-11-23 02:37:30', '2019-11-23 02:37:30', '76f8f9ad-625e-4024-b652-20a5fcd1c7b8'),
(195, 192, 12, 3, 3, NULL, '2019-11-23 02:37:30', '2019-11-23 02:37:30', '38564dbe-6bdd-4ff3-8723-5169832dc0bc'),
(196, 192, 12, 3, 4, NULL, '2019-11-23 02:37:30', '2019-11-23 02:37:30', 'd60ddcde-3b0b-4084-90f0-546c852606bd'),
(197, 192, 12, 3, 5, NULL, '2019-11-23 02:37:30', '2019-11-23 02:37:30', '25db12f4-7825-415d-ac0f-b2dd75ffe11c'),
(198, 192, 12, 3, 6, NULL, '2019-11-23 02:37:30', '2019-11-23 02:37:30', '0981d1d7-5648-421c-be13-22175ca12051'),
(199, 192, 12, 3, 7, NULL, '2019-11-23 02:37:30', '2019-11-23 02:37:30', 'e0d7fad6-f818-41b6-ab65-9616547cacec'),
(200, 192, 12, 3, 8, NULL, '2019-11-23 02:37:30', '2019-11-23 02:37:30', 'cf4c11f4-0220-4fbe-9d0e-55fcb359bf42'),
(201, 192, 12, 3, 9, NULL, '2019-11-23 02:37:30', '2019-11-23 02:37:30', '5d362eed-b393-4bf3-b4ea-5bab851d592c'),
(205, 2, 12, 3, 10, 0, '2019-11-23 02:38:31', '2019-11-23 02:38:31', '90e230ce-b542-4cfa-840d-ec77ded51949'),
(207, 206, 12, 3, 1, NULL, '2019-11-23 02:38:31', '2019-11-23 02:38:31', 'b236172f-e3f6-411b-81cd-969da1aa160c'),
(208, 206, 12, 3, 2, NULL, '2019-11-23 02:38:31', '2019-11-23 02:38:31', '139a4d12-b3e4-4886-bbbe-0b9301dc95d1'),
(209, 206, 12, 3, 3, NULL, '2019-11-23 02:38:31', '2019-11-23 02:38:31', '2269c022-e783-475e-aafd-e372168fed29'),
(210, 206, 12, 3, 4, NULL, '2019-11-23 02:38:31', '2019-11-23 02:38:31', '77f4f4f3-e2c8-4b6a-ab17-d70f6c42e052'),
(211, 206, 12, 3, 5, NULL, '2019-11-23 02:38:31', '2019-11-23 02:38:31', 'ad4d7d7a-ac3a-4da6-8738-5813ca5a96cf'),
(212, 206, 12, 3, 6, NULL, '2019-11-23 02:38:31', '2019-11-23 02:38:31', '76c96170-54f7-4065-ae5e-a2d732874fe1'),
(213, 206, 12, 3, 7, NULL, '2019-11-23 02:38:31', '2019-11-23 02:38:31', '47a8ea33-63b8-4c09-a579-22e120b3f80e'),
(214, 206, 12, 3, 8, NULL, '2019-11-23 02:38:31', '2019-11-23 02:38:31', 'd89dc029-0573-431e-95e0-e2899be10f4c'),
(215, 206, 12, 3, 9, NULL, '2019-11-23 02:38:31', '2019-11-23 02:38:31', '70b118b3-06f8-454b-9d6d-e84542aaf20a'),
(216, 206, 12, 3, 10, NULL, '2019-11-23 02:38:31', '2019-11-23 02:38:31', 'eea70d0d-4c5e-44f1-8235-bed58c715ca5'),
(217, 2, 12, 3, 11, 0, '2019-11-23 02:39:26', '2019-11-23 02:39:26', '3a224494-00e0-406d-8819-0ab32058c6d2'),
(219, 218, 12, 3, 1, NULL, '2019-11-23 02:39:26', '2019-11-23 02:39:26', 'b5e1bff7-122b-4d0b-9751-780a9a1772fd'),
(220, 218, 12, 3, 2, NULL, '2019-11-23 02:39:26', '2019-11-23 02:39:26', '7f798d2f-aabd-4c7d-af67-f94ef07a975b'),
(221, 218, 12, 3, 3, NULL, '2019-11-23 02:39:26', '2019-11-23 02:39:26', '53729e87-8d0f-45a1-91dc-b68bdc46e519'),
(222, 218, 12, 3, 4, NULL, '2019-11-23 02:39:27', '2019-11-23 02:39:27', 'f816f74d-5c37-4b19-b106-1670196a4949'),
(223, 218, 12, 3, 5, NULL, '2019-11-23 02:39:27', '2019-11-23 02:39:27', '994a7e0d-b35d-4e7b-b61b-5480b3947308'),
(224, 218, 12, 3, 6, NULL, '2019-11-23 02:39:27', '2019-11-23 02:39:27', 'd0778813-7785-4aca-aca4-28a497c25cc7'),
(225, 218, 12, 3, 7, NULL, '2019-11-23 02:39:27', '2019-11-23 02:39:27', '15d6c399-7f07-4f05-b085-58d2834315b3'),
(226, 218, 12, 3, 8, NULL, '2019-11-23 02:39:27', '2019-11-23 02:39:27', '73424fc4-7803-4bdd-a03a-4e894b35e078'),
(227, 218, 12, 3, 9, NULL, '2019-11-23 02:39:27', '2019-11-23 02:39:27', 'b70e1466-0e12-4795-aae6-4d113e458d13'),
(228, 218, 12, 3, 10, NULL, '2019-11-23 02:39:27', '2019-11-23 02:39:27', '980b4f16-1c1b-4440-9ef6-3dc667de6817'),
(229, 218, 12, 3, 11, NULL, '2019-11-23 02:39:27', '2019-11-23 02:39:27', '2220c849-2b9b-4d45-96e1-2a0100ee7ce2'),
(230, 2, 12, 3, 12, 0, '2019-11-23 02:39:50', '2019-11-23 02:39:50', '4e5b2010-c715-413c-aa5a-ca397d7f1580'),
(232, 231, 12, 3, 1, NULL, '2019-11-23 02:39:50', '2019-11-23 02:39:50', 'ef5acdb4-639a-4e53-a131-22b8ceefc82e'),
(233, 231, 12, 3, 2, NULL, '2019-11-23 02:39:50', '2019-11-23 02:39:50', '232bff56-7c70-42f6-8515-87fe16a0e1e0'),
(234, 231, 12, 3, 3, NULL, '2019-11-23 02:39:50', '2019-11-23 02:39:50', '7da82341-8ae0-4db2-9254-6b79e80feb0b'),
(235, 231, 12, 3, 4, NULL, '2019-11-23 02:39:50', '2019-11-23 02:39:50', '3bf7e814-9d04-489c-81cc-1d9c3a5eb26a'),
(236, 231, 12, 3, 5, NULL, '2019-11-23 02:39:50', '2019-11-23 02:39:50', 'e7554fbe-b371-4042-9cad-0380a6ca5539'),
(237, 231, 12, 3, 6, NULL, '2019-11-23 02:39:50', '2019-11-23 02:39:50', 'd8369759-c8f2-4d00-9dfb-2a78a5b4328f'),
(238, 231, 12, 3, 7, NULL, '2019-11-23 02:39:50', '2019-11-23 02:39:50', 'acfd0f81-a992-4716-9366-5c10c5b72467'),
(239, 231, 12, 3, 8, NULL, '2019-11-23 02:39:50', '2019-11-23 02:39:50', '71a48ce0-7976-430c-bcba-6a66384cbd81'),
(240, 231, 12, 3, 9, NULL, '2019-11-23 02:39:50', '2019-11-23 02:39:50', 'bbca39af-0ec9-4713-b845-19f569e3a323'),
(241, 231, 12, 3, 10, NULL, '2019-11-23 02:39:50', '2019-11-23 02:39:50', '95b00ba6-28ad-4ca1-9306-a307bfe6204e'),
(242, 231, 12, 3, 11, NULL, '2019-11-23 02:39:50', '2019-11-23 02:39:50', '360e23cb-4b56-4bc5-ac70-47dd847360ff'),
(243, 231, 12, 3, 12, NULL, '2019-11-23 02:39:50', '2019-11-23 02:39:50', '8abc2f46-e382-40ac-a49d-7996791f4cce'),
(244, 2, 12, 3, 13, 0, '2019-11-23 05:13:35', '2019-11-23 05:13:35', '49e7b61a-ff6f-46d6-bee3-43f33d0e0f45'),
(246, 245, 12, 3, 1, NULL, '2019-11-23 05:13:35', '2019-11-23 05:13:35', '45a86086-d7cf-4d1f-83b5-34e300f3effd'),
(247, 245, 12, 3, 2, NULL, '2019-11-23 05:13:35', '2019-11-23 05:13:35', '5c0eb675-5206-40f3-9871-5a1ab9c251a5'),
(248, 245, 12, 3, 3, NULL, '2019-11-23 05:13:35', '2019-11-23 05:13:35', '95e9f512-fd5e-41d7-83e3-2b58902c7e69'),
(249, 245, 12, 3, 4, NULL, '2019-11-23 05:13:35', '2019-11-23 05:13:35', 'c2d0649c-e1d6-4052-b273-36a504725b31'),
(250, 245, 12, 3, 5, NULL, '2019-11-23 05:13:35', '2019-11-23 05:13:35', '34ea74c7-2eec-406d-9a7f-84609332b67e'),
(251, 245, 12, 3, 6, NULL, '2019-11-23 05:13:35', '2019-11-23 05:13:35', '9760f7fb-b9d4-402c-8a95-122f60a6de6c'),
(252, 245, 12, 3, 7, NULL, '2019-11-23 05:13:35', '2019-11-23 05:13:35', 'f3b6f5ee-bfa0-4bdd-8243-0c99f2257127'),
(253, 245, 12, 3, 8, NULL, '2019-11-23 05:13:35', '2019-11-23 05:13:35', '720c9a4e-da7b-4821-bcf4-1142cc14e017'),
(254, 245, 12, 3, 9, NULL, '2019-11-23 05:13:35', '2019-11-23 05:13:35', '30fb24a1-c75b-4e75-b583-31bc9cb88ac6'),
(255, 245, 12, 3, 10, NULL, '2019-11-23 05:13:35', '2019-11-23 05:13:35', '1d8b2f30-6589-4850-bff3-a5491f4a8ef6'),
(256, 245, 12, 3, 11, NULL, '2019-11-23 05:13:35', '2019-11-23 05:13:35', '8c465f91-91a2-4fa8-a3a8-8cdec6e1b9f2'),
(257, 245, 12, 3, 12, NULL, '2019-11-23 05:13:35', '2019-11-23 05:13:35', '893c1157-9875-420f-9f8b-fe1310d41a34'),
(258, 245, 12, 3, 13, NULL, '2019-11-23 05:13:35', '2019-11-23 05:13:35', 'e8cad334-0738-44b0-abd7-38c7d4f3b34b'),
(259, 4, 6, 2, 3, NULL, '2019-11-23 05:14:04', '2019-11-23 05:14:04', '7f1693b9-167d-4705-bb2c-025df5aff6fe'),
(261, 260, 6, 2, 1, NULL, '2019-11-23 05:14:04', '2019-11-23 05:14:04', '8f9b746e-e8ea-4cf0-b8b5-26170aab45ee'),
(262, 260, 6, 2, 2, NULL, '2019-11-23 05:14:04', '2019-11-23 05:14:04', 'a54672e2-845a-4ab4-8fbd-ba743f47af6d'),
(263, 260, 6, 2, 3, NULL, '2019-11-23 05:14:04', '2019-11-23 05:14:04', '23f2406f-8656-43d3-8cbf-b0fb76272503'),
(264, 2, 12, 3, 14, 0, '2019-11-23 05:14:22', '2019-11-23 05:14:22', '21d54a8a-2bdc-4860-99ba-e15670f58206'),
(266, 265, 12, 3, 1, NULL, '2019-11-23 05:14:23', '2019-11-23 05:14:23', 'c741dc8f-154d-4174-b88e-fc368bf38c98'),
(267, 265, 12, 3, 2, NULL, '2019-11-23 05:14:23', '2019-11-23 05:14:23', '1a284a29-db5c-4be0-85b7-d4ecac276f21'),
(268, 265, 12, 3, 3, NULL, '2019-11-23 05:14:23', '2019-11-23 05:14:23', '8461de32-4b9c-4f09-91cd-faa37281c444'),
(269, 265, 12, 3, 4, NULL, '2019-11-23 05:14:23', '2019-11-23 05:14:23', 'f9ce79f6-9893-47c7-a572-b58224c1ee96'),
(270, 265, 12, 3, 5, NULL, '2019-11-23 05:14:23', '2019-11-23 05:14:23', '0c27d11b-87aa-444a-9d18-26a61931dffa'),
(271, 265, 12, 3, 6, NULL, '2019-11-23 05:14:23', '2019-11-23 05:14:23', '88953ae8-9f69-4e72-83e4-538f160ca1cc'),
(272, 265, 12, 3, 7, NULL, '2019-11-23 05:14:23', '2019-11-23 05:14:23', '01c1be6a-16d8-437b-8dc7-c72585159fb1'),
(273, 265, 12, 3, 8, NULL, '2019-11-23 05:14:23', '2019-11-23 05:14:23', 'b8fcd8ba-f14a-4153-bd63-1742aa4448e9'),
(274, 265, 12, 3, 9, NULL, '2019-11-23 05:14:23', '2019-11-23 05:14:23', 'a3be3301-83bf-4467-9676-a0eb2f80701f'),
(275, 265, 12, 3, 10, NULL, '2019-11-23 05:14:23', '2019-11-23 05:14:23', 'e26ab21e-5db7-4575-9b10-6e5f855894e7'),
(276, 265, 12, 3, 11, NULL, '2019-11-23 05:14:23', '2019-11-23 05:14:23', '268b2a0c-a5d4-4a40-85c2-621d106c7290'),
(277, 265, 12, 3, 12, NULL, '2019-11-23 05:14:23', '2019-11-23 05:14:23', '93a8c200-1527-4e9a-bd0f-9b0e62039143'),
(278, 265, 12, 3, 13, NULL, '2019-11-23 05:14:23', '2019-11-23 05:14:23', 'ef3f82aa-02b2-41e7-ae58-85677580e1e9'),
(279, 265, 12, 3, 14, NULL, '2019-11-23 05:14:23', '2019-11-23 05:14:23', '96eb9955-a37a-4dac-a381-6f9e63a37f32'),
(304, 2, 12, 3, 15, 0, '2019-11-23 05:38:10', '2019-11-23 05:38:10', '53f25af3-be88-4c8f-a7d8-7667253f8662'),
(306, 305, 12, 3, 1, NULL, '2019-11-23 05:38:10', '2019-11-23 05:38:10', '72dac72d-e995-47d6-b6fc-f9c709a25fb3'),
(307, 305, 12, 3, 2, NULL, '2019-11-23 05:38:10', '2019-11-23 05:38:10', 'a0a40b3b-6e14-46f0-99c5-b3f7c8e55aee'),
(308, 305, 12, 3, 3, NULL, '2019-11-23 05:38:10', '2019-11-23 05:38:10', '9106cb1d-115d-40ef-afbe-9243cf393ae6'),
(309, 305, 12, 3, 4, NULL, '2019-11-23 05:38:10', '2019-11-23 05:38:10', 'bbb8c3e8-2597-452e-807e-f3d45440f08f'),
(310, 305, 12, 3, 5, NULL, '2019-11-23 05:38:10', '2019-11-23 05:38:10', '3f80bd0a-b0b2-4757-b6e2-e271fa65c094'),
(311, 305, 12, 3, 6, NULL, '2019-11-23 05:38:10', '2019-11-23 05:38:10', '09b8c9c4-4109-416f-9632-9af68493607a'),
(312, 305, 12, 3, 7, NULL, '2019-11-23 05:38:10', '2019-11-23 05:38:10', '0664ef21-0eb6-4ef6-8bf1-dc1aa9662a11'),
(313, 305, 12, 3, 8, NULL, '2019-11-23 05:38:10', '2019-11-23 05:38:10', '2af6d404-9ab7-46d6-bf44-7b7872014730'),
(314, 305, 12, 3, 9, NULL, '2019-11-23 05:38:10', '2019-11-23 05:38:10', '5862389e-d16f-4253-aa94-bc0f90ca995b'),
(315, 305, 12, 3, 10, NULL, '2019-11-23 05:38:10', '2019-11-23 05:38:10', '451e9e67-bd27-4d41-bd16-46225abde2b0'),
(316, 305, 12, 3, 11, NULL, '2019-11-23 05:38:10', '2019-11-23 05:38:10', 'cf07a88b-556c-4fb8-b400-cd5f4efb8ace'),
(317, 305, 12, 3, 12, NULL, '2019-11-23 05:38:10', '2019-11-23 05:38:10', 'fa3e8bc1-2bff-4b02-9956-3a9c9fb55190'),
(318, 305, 12, 3, 13, NULL, '2019-11-23 05:38:10', '2019-11-23 05:38:10', 'c84226c0-70aa-42b3-a2ee-c6d7a73f0e32'),
(319, 305, 12, 3, 14, NULL, '2019-11-23 05:38:10', '2019-11-23 05:38:10', 'f5b4bbf0-9150-44b8-bf65-70734c396532'),
(320, 305, 12, 3, 15, NULL, '2019-11-23 05:38:10', '2019-11-23 05:38:10', 'dd266167-6db2-4d36-926a-87efe5e16d15'),
(321, 2, 12, 3, 16, 0, '2019-11-23 05:45:25', '2019-11-23 05:45:25', '7d916eb6-41d5-44a9-8ada-a264b005ef9b'),
(323, 322, 12, 3, 1, NULL, '2019-11-23 05:45:25', '2019-11-23 05:45:25', '746788ae-a4b3-4c7b-880e-d16644892859'),
(324, 322, 12, 3, 2, NULL, '2019-11-23 05:45:25', '2019-11-23 05:45:25', '18ffdc59-788e-4877-81ba-5614bb52547e'),
(325, 322, 12, 3, 3, NULL, '2019-11-23 05:45:25', '2019-11-23 05:45:25', '3c7c6c9b-133b-40aa-b5a8-461f209bbf61'),
(326, 322, 12, 3, 4, NULL, '2019-11-23 05:45:25', '2019-11-23 05:45:25', 'd6d88e79-f7d0-4f3f-9ea6-068dc548637b'),
(327, 322, 12, 3, 5, NULL, '2019-11-23 05:45:25', '2019-11-23 05:45:25', 'bf5c074f-c91c-4095-8fe6-a94d4a624c9f'),
(328, 322, 12, 3, 6, NULL, '2019-11-23 05:45:25', '2019-11-23 05:45:25', 'bb3c6d96-cffc-4c3a-9256-add184e15e0b'),
(329, 322, 12, 3, 7, NULL, '2019-11-23 05:45:25', '2019-11-23 05:45:25', '056d4897-4298-4871-ad14-a660b1a30064'),
(330, 322, 12, 3, 8, NULL, '2019-11-23 05:45:25', '2019-11-23 05:45:25', '6f11dcb6-a6d8-42fe-b050-f3c1ec5f9e8f'),
(331, 322, 12, 3, 9, NULL, '2019-11-23 05:45:25', '2019-11-23 05:45:25', 'e4c3a1a6-9d56-4724-a4be-fbaef9cc2902'),
(332, 322, 12, 3, 10, NULL, '2019-11-23 05:45:25', '2019-11-23 05:45:25', '69ff86c3-d490-447a-8fe3-db9ac2bc08b1'),
(333, 322, 12, 3, 11, NULL, '2019-11-23 05:45:25', '2019-11-23 05:45:25', 'de5de7eb-b260-445a-8bba-d3d685555f81'),
(334, 322, 12, 3, 12, NULL, '2019-11-23 05:45:25', '2019-11-23 05:45:25', '42ab3323-25b7-49f5-b093-212ede850dc7'),
(335, 322, 12, 3, 13, NULL, '2019-11-23 05:45:25', '2019-11-23 05:45:25', '68444909-42f0-45e9-8da6-bc27aeeb5169'),
(336, 322, 12, 3, 14, NULL, '2019-11-23 05:45:25', '2019-11-23 05:45:25', 'f61c4087-7d61-4223-a664-eaed6cad6cbf'),
(337, 322, 12, 3, 15, NULL, '2019-11-23 05:45:25', '2019-11-23 05:45:25', 'bdccf371-a67e-4c43-80ab-ceb02ff5dda6'),
(338, 322, 12, 3, 16, NULL, '2019-11-23 05:45:25', '2019-11-23 05:45:25', 'deefb284-b625-45a3-abad-7716375cb16a'),
(339, 2, 12, 3, 17, 0, '2019-11-23 05:51:27', '2019-11-23 05:51:27', '13d02171-9224-4ab6-986e-f6b80f75a384'),
(341, 340, 12, 3, 1, NULL, '2019-11-23 05:51:27', '2019-11-23 05:51:27', '0a3967ca-d9ed-4543-9ded-7842c8915a7c'),
(342, 340, 12, 3, 2, NULL, '2019-11-23 05:51:27', '2019-11-23 05:51:27', '21a4e321-9e8c-4959-9835-4feb70698ea5'),
(343, 340, 12, 3, 3, NULL, '2019-11-23 05:51:27', '2019-11-23 05:51:27', '8ed60adf-5e48-48f0-a7a3-997d076b2efd'),
(344, 340, 12, 3, 4, NULL, '2019-11-23 05:51:27', '2019-11-23 05:51:27', '456cc3b2-9759-42e6-b408-4abed674e277'),
(345, 340, 12, 3, 5, NULL, '2019-11-23 05:51:27', '2019-11-23 05:51:27', '63cd6534-0217-49d8-a781-954a4000e2bc'),
(346, 340, 12, 3, 6, NULL, '2019-11-23 05:51:27', '2019-11-23 05:51:27', '0eb75944-06dd-4b18-ad30-5b2b828b4113'),
(347, 340, 12, 3, 7, NULL, '2019-11-23 05:51:27', '2019-11-23 05:51:27', 'd189e65a-f55f-4363-beb5-50858f2b71f7'),
(348, 340, 12, 3, 8, NULL, '2019-11-23 05:51:27', '2019-11-23 05:51:27', '241ad19a-fbf0-4116-b6dc-eb3c6459605f'),
(349, 340, 12, 3, 9, NULL, '2019-11-23 05:51:27', '2019-11-23 05:51:27', 'c95eeedc-76be-4d04-8b63-cb343a0eefec'),
(350, 340, 12, 3, 10, NULL, '2019-11-23 05:51:27', '2019-11-23 05:51:27', '9c3b32e0-087f-4f09-be05-b4d6039b0ff1'),
(351, 340, 12, 3, 11, NULL, '2019-11-23 05:51:27', '2019-11-23 05:51:27', '710d216a-cf7a-4fd4-b44a-e446b2fdefc9'),
(352, 340, 12, 3, 12, NULL, '2019-11-23 05:51:27', '2019-11-23 05:51:27', 'b6c94b66-bd7f-4598-8beb-b7a45b120a87'),
(353, 340, 12, 3, 13, NULL, '2019-11-23 05:51:27', '2019-11-23 05:51:27', 'e7c9cd59-f026-4e08-8a1e-2798d1d57531'),
(354, 340, 12, 3, 14, NULL, '2019-11-23 05:51:27', '2019-11-23 05:51:27', 'cb2bc8ef-078c-47db-bdcd-d43c9cee38f3'),
(355, 340, 12, 3, 15, NULL, '2019-11-23 05:51:27', '2019-11-23 05:51:27', 'f77f3fec-ecc0-4829-9445-38eff8b3d0c9'),
(356, 340, 12, 3, 16, NULL, '2019-11-23 05:51:27', '2019-11-23 05:51:27', 'd77a1012-0f54-421f-9208-be1b09487f8d'),
(357, 340, 12, 3, 17, NULL, '2019-11-23 05:51:27', '2019-11-23 05:51:27', '678adb87-dc68-4a9d-ac1a-41574ca11d35'),
(359, 358, 6, 2, 1, NULL, '2019-11-23 05:53:24', '2019-11-23 05:53:24', '83b7a0ea-2c2d-4a59-b148-e7af2de2e6aa'),
(360, 358, 6, 2, 2, NULL, '2019-11-23 05:53:24', '2019-11-23 05:53:24', 'f0ff9847-13ce-497e-9e1f-33115df941d2'),
(361, 358, 6, 2, 3, NULL, '2019-11-23 05:53:24', '2019-11-23 05:53:24', '486d2cc9-a74d-4b1e-9523-f7d9f0f9f5b1'),
(363, 362, 12, 3, 1, NULL, '2019-11-23 05:55:49', '2019-11-23 05:55:49', '70ea29ac-d6ca-4897-88ae-0dc87bb6fd87'),
(364, 4, 6, 2, 4, NULL, '2019-11-23 05:56:36', '2019-11-23 05:56:36', '0c95617d-d20d-4968-a8ec-642dddfbc87a'),
(366, 365, 6, 2, 1, NULL, '2019-11-23 05:56:36', '2019-11-23 05:56:36', '01f5e2d1-8247-4f46-b056-c61cbcc42554'),
(367, 365, 6, 2, 2, NULL, '2019-11-23 05:56:36', '2019-11-23 05:56:36', '2d92095f-b0e1-4e65-a9a5-217485da0c6d'),
(368, 365, 6, 2, 3, NULL, '2019-11-23 05:56:36', '2019-11-23 05:56:36', '47515df4-1ad9-4575-bcd4-0a3d99e958eb'),
(369, 365, 6, 2, 4, NULL, '2019-11-23 05:56:36', '2019-11-23 05:56:36', 'e529d6f8-7331-4ba7-81e6-64ff8125fa71'),
(378, 2, 12, 3, 2, NULL, '2019-11-23 06:01:37', '2019-11-23 06:01:37', 'b55581a0-dd97-4acb-a874-9ecf5bc6db27'),
(380, 379, 12, 3, 1, NULL, '2019-11-23 06:01:37', '2019-11-23 06:01:37', '30dd821b-6cb2-44cf-bfc8-c60ba25f0d25'),
(381, 379, 12, 3, 2, NULL, '2019-11-23 06:01:37', '2019-11-23 06:01:37', '4b022504-2c47-4e33-aaa4-c5232ec23793'),
(387, 2, 12, 3, 3, NULL, '2019-11-23 06:03:31', '2019-11-23 06:03:31', 'bf7e8250-8ca9-4318-b465-3a974f3d67d6'),
(389, 388, 12, 3, 1, NULL, '2019-11-23 06:03:31', '2019-11-23 06:03:31', 'b5fe7279-d6dd-4650-9ac5-0cc9d80abe38'),
(390, 388, 12, 3, 2, NULL, '2019-11-23 06:03:31', '2019-11-23 06:03:31', 'a3395663-e0b3-4a2a-8d29-d64c441b3cb0'),
(391, 388, 12, 3, 3, NULL, '2019-11-23 06:03:31', '2019-11-23 06:03:31', '15f6ce42-7e22-4589-b3eb-73ff2debfb34'),
(392, 2, 12, 3, 4, NULL, '2019-11-23 06:04:16', '2019-11-23 06:04:16', '3262e41f-fbde-4012-b2a0-5200bb86693b'),
(394, 393, 12, 3, 1, NULL, '2019-11-23 06:04:16', '2019-11-23 06:04:16', '2693419b-7d1b-44e3-9054-ad6090e679f6'),
(395, 393, 12, 3, 2, NULL, '2019-11-23 06:04:16', '2019-11-23 06:04:16', '97ad8a9c-5235-4668-8699-e0038af046be'),
(396, 393, 12, 3, 3, NULL, '2019-11-23 06:04:16', '2019-11-23 06:04:16', '46361eb8-a1d7-4617-ac93-203ee6a7976b'),
(397, 393, 12, 3, 4, NULL, '2019-11-23 06:04:16', '2019-11-23 06:04:16', 'bb05bb0b-8db8-435a-8324-baea5c2a5924'),
(398, 2, 12, 3, 5, NULL, '2019-11-23 06:04:40', '2019-11-23 06:04:40', 'ea6a2175-efde-4840-a0d9-2d58a69a7903'),
(400, 399, 12, 3, 1, NULL, '2019-11-23 06:04:40', '2019-11-23 06:04:40', 'cbcd9a40-a648-4ac5-b265-2f758fd3602d'),
(401, 399, 12, 3, 2, NULL, '2019-11-23 06:04:40', '2019-11-23 06:04:40', '51132b39-3e38-4d31-919d-8cb510a2c96d'),
(402, 399, 12, 3, 3, NULL, '2019-11-23 06:04:40', '2019-11-23 06:04:40', 'd66c15ab-1123-40fb-ae1e-e293e4981d7c'),
(403, 399, 12, 3, 4, NULL, '2019-11-23 06:04:40', '2019-11-23 06:04:40', 'a740c4d2-67d2-47e7-8334-f019c3beca08'),
(404, 399, 12, 3, 5, NULL, '2019-11-23 06:04:40', '2019-11-23 06:04:40', '76f350fe-79cb-4e5d-a483-a61b206f3dc6'),
(406, 405, 6, 2, 1, NULL, '2019-11-23 06:06:49', '2019-11-23 06:06:49', '3a47a491-5400-4a99-bce0-7fffe6871fa6'),
(407, 405, 6, 2, 2, NULL, '2019-11-23 06:06:49', '2019-11-23 06:06:49', '70b3ccc7-7b73-4884-8138-958322f6a67c'),
(408, 405, 6, 2, 3, NULL, '2019-11-23 06:06:49', '2019-11-23 06:06:49', '4dd35af8-696c-4a45-9ecb-016565682615'),
(409, 405, 6, 2, 4, NULL, '2019-11-23 06:06:49', '2019-11-23 06:06:49', '1fbb5c7e-be9d-49ed-a5ff-8cf090f8e62b'),
(410, 2, 12, 3, 6, NULL, '2019-11-23 06:13:03', '2019-11-23 06:13:03', 'c6073538-bbf2-4a95-b7ed-ce7b7fe86b24'),
(412, 411, 12, 3, 1, NULL, '2019-11-23 06:13:03', '2019-11-23 06:13:03', 'd3662f49-7923-4ad8-8e80-f9ed781e8533'),
(413, 411, 12, 3, 2, NULL, '2019-11-23 06:13:03', '2019-11-23 06:13:03', 'e075d51c-359b-49e9-bbb8-c414c6a20a52'),
(414, 411, 12, 3, 3, NULL, '2019-11-23 06:13:03', '2019-11-23 06:13:03', '876cc9f4-8f38-4a61-8347-d55d863a8c44'),
(415, 411, 12, 3, 4, NULL, '2019-11-23 06:13:03', '2019-11-23 06:13:03', 'e75991b7-e610-4b09-8320-f8d8b6a2c08b'),
(416, 411, 12, 3, 5, NULL, '2019-11-23 06:13:03', '2019-11-23 06:13:03', 'ec8bcd20-b912-4d09-be80-f3ba3a790fcb'),
(417, 411, 12, 3, 6, NULL, '2019-11-23 06:13:03', '2019-11-23 06:13:03', '9195ac4b-a425-45c3-9d6b-76d103172229'),
(424, 4, 6, 2, 5, NULL, '2019-11-23 06:22:34', '2019-11-23 06:22:34', '4556d0af-75ea-456c-a1ae-d382f1b92d77'),
(426, 425, 6, 2, 1, NULL, '2019-11-23 06:22:34', '2019-11-23 06:22:34', '819b3825-e6c2-4564-8263-8ddd0fe37f3e'),
(427, 425, 6, 2, 2, NULL, '2019-11-23 06:22:34', '2019-11-23 06:22:34', 'bdd91365-b7ce-446f-aca5-6a0e7e9e9440'),
(428, 425, 6, 2, 3, NULL, '2019-11-23 06:22:34', '2019-11-23 06:22:34', '873ee70d-6c12-40ff-8809-941e148854ff'),
(429, 425, 6, 2, 4, NULL, '2019-11-23 06:22:34', '2019-11-23 06:22:34', 'd56a730d-61fc-4504-99e7-a779fecf2a17'),
(430, 425, 6, 2, 5, NULL, '2019-11-23 06:22:34', '2019-11-23 06:22:34', '8823d726-3459-47b1-9fcd-36e96d64e877');

-- --------------------------------------------------------

--
-- Table structure for table `matrixblocktypes`
--

CREATE TABLE `matrixblocktypes` (
  `id` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `matrixblocktypes`
--

INSERT INTO `matrixblocktypes` (`id`, `fieldId`, `fieldLayoutId`, `name`, `handle`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(2, 6, 6, 'Products', 'products', 1, '2019-11-17 05:05:39', '2019-11-17 05:27:52', 'a91239bf-7096-439b-8ba1-066c475967f0'),
(3, 12, 7, 'News', 'news', 1, '2019-11-17 05:33:06', '2019-11-17 05:33:06', '14ed5bdb-4241-477f-9e04-f101c7a5d12e');

-- --------------------------------------------------------

--
-- Table structure for table `matrixcontent_availableproducts`
--

CREATE TABLE `matrixcontent_availableproducts` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_products_productName` text,
  `field_products_price` text,
  `field_products_available` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `matrixcontent_availableproducts`
--

INSERT INTO `matrixcontent_availableproducts` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_products_productName`, `field_products_price`, `field_products_available`) VALUES
(1, 7, 1, '2019-11-17 05:06:24', '2019-11-23 06:22:34', '1cafa88b-9390-4a5a-a985-8b2097f5f35d', 'Salmonsss', '14.999sss', 'unavailable'),
(2, 8, 1, '2019-11-17 05:28:35', '2019-11-23 06:22:34', 'cc208fec-9515-4fe2-8570-975776f6d8ab', 'Cheeseg', '99.90g', 'available'),
(3, 29, 1, '2019-11-20 10:20:47', '2019-11-20 10:20:48', '6ea19695-081d-4af5-a39d-80f6e41717a2', 'Salmons', '14.99', 'unavailable'),
(4, 30, 1, '2019-11-20 10:20:47', '2019-11-20 10:20:48', '69f79334-aba7-4c43-8cb9-3e3834cc2168', 'Cheese', '99.90', 'available'),
(5, 32, 1, '2019-11-20 10:20:48', '2019-11-20 10:20:48', 'bbb38fc9-d54c-4170-a043-e7cd7391aa85', 'Salmons', '14.99', 'unavailable'),
(6, 33, 1, '2019-11-20 10:20:48', '2019-11-20 10:20:48', 'f12d25b6-c425-459f-afa2-fa1441c8c78d', 'Cheese', '99.90', 'unavailable'),
(7, 35, 1, '2019-11-20 10:20:48', '2019-11-20 10:20:48', '84f77c14-b540-4099-afb2-ac5dc3f9380d', 'Salmons', '14.99', 'unavailable'),
(8, 36, 1, '2019-11-20 10:20:48', '2019-11-20 10:20:48', 'f08f82b6-e64b-460d-9e15-037970270693', 'Cheese', '99.90', 'available'),
(9, 38, 1, '2019-11-20 10:20:48', '2019-11-20 10:20:48', '11b0edd2-d306-458e-85c7-44028d213c4a', 'Salmons', '14.99', 'unavailable'),
(10, 39, 1, '2019-11-20 10:20:48', '2019-11-20 10:20:48', 'ed00299f-5188-43f4-843a-69755bccafda', 'Cheese', '99.90', 'available'),
(11, 41, 1, '2019-11-20 10:20:48', '2019-11-20 10:20:48', '7b7c32a1-fd7e-4ed3-a092-66dc49646dc1', 'Salmons', '14.99', NULL),
(12, 42, 1, '2019-11-20 10:20:48', '2019-11-20 10:20:48', 'e1ef1039-b801-4336-8a6c-f4a824c96b01', 'Cheese', '99.90', 'available'),
(13, 44, 1, '2019-11-20 10:20:48', '2019-11-20 10:20:48', 'cbd77eb0-ef39-4630-b2d7-9d43bbc98e8f', 'Salmons', '14.99', 'no'),
(14, 45, 1, '2019-11-20 10:20:48', '2019-11-20 10:20:48', 'cca201e8-b5aa-41c4-ac82-24e6a0f00ad4', 'Cheese', '99.90', 'available'),
(15, 47, 1, '2019-11-20 10:20:48', '2019-11-20 10:20:48', 'efdd9396-b3eb-4a51-a932-ca781a71cb19', 'Salmons', '14.99', 'yes'),
(16, 48, 1, '2019-11-20 10:20:48', '2019-11-20 10:20:48', 'c1bc4cdf-f7df-4c5d-89bd-5f4ee762bc6c', 'Cheese', '99.90', 'available'),
(17, 50, 1, '2019-11-20 10:20:48', '2019-11-20 10:20:48', 'b607ad1a-4694-44b2-b7bb-eb01e4662e6d', 'Salmon', '14.99', ''),
(18, 51, 1, '2019-11-20 10:20:48', '2019-11-20 10:20:48', 'e525e581-030a-4c81-a55e-554f73ad1bfd', 'Cheese', '99.90', 'available'),
(19, 53, 1, '2019-11-20 10:20:48', '2019-11-20 10:20:48', 'f7a5c862-c4a6-4b92-a8d1-e67eb5065cf1', 'Salmon', '14.99', NULL),
(20, 54, 1, '2019-11-20 10:20:48', '2019-11-20 10:20:48', '69cc2e88-422e-458a-81ff-c437d44b2af5', 'Cheese', '99.90', 'available'),
(21, 56, 1, '2019-11-20 10:20:48', '2019-11-20 10:20:48', 'bc19272c-3924-4fab-9556-0501850f4cae', 'Salmon', '14.99', ''),
(22, 57, 1, '2019-11-20 10:20:48', '2019-11-20 10:20:48', '3758d80d-6d3b-4b4b-ad28-f3dc84bccbe8', 'Cheese', '99.90', 'available'),
(23, 59, 1, '2019-11-20 10:20:48', '2019-11-20 10:20:48', 'd7381528-da0b-4646-8907-bb0574505d36', 'Salmon', '14.99', NULL),
(24, 60, 1, '2019-11-20 10:20:48', '2019-11-20 10:20:48', 'f1f66ee0-3bc3-4d88-b220-30b49903b40c', 'Cheese', '99.90', 'available'),
(25, 62, 1, '2019-11-20 10:20:48', '2019-11-20 10:20:48', 'acf32637-4aef-46ae-9243-165db24066b8', 'Salmon', '14.99', ''),
(26, 63, 1, '2019-11-20 10:20:48', '2019-11-20 10:20:48', 'fd62abfb-8852-444c-8ba9-db08fdf07e76', 'Cheese', '99.90', 'available'),
(27, 65, 1, '2019-11-20 10:20:48', '2019-11-20 10:20:48', '3229b467-8cb6-4864-9c53-ed79c4c8714a', 'Salmon', '14.99', NULL),
(28, 66, 1, '2019-11-20 10:20:48', '2019-11-20 10:20:48', '18af9ab5-6324-4319-b9c2-d5dfffe08a65', 'Cheese', '99.90', 'available'),
(29, 68, 1, '2019-11-20 10:20:48', '2019-11-20 10:20:48', '2c0b81e0-1c1c-472c-b21f-c4a10300b6f9', 'Salmon', '14.99', ''),
(30, 69, 1, '2019-11-20 10:20:48', '2019-11-20 10:20:48', '9add47e1-c918-4e36-891a-81f171c92b38', 'Cheese', '99.90', 'available'),
(31, 71, 1, '2019-11-20 10:20:48', '2019-11-20 10:20:48', '77907af2-f786-48ee-a8ff-f359911ee621', 'Salmons', '14.99', 'unavailable'),
(32, 72, 1, '2019-11-20 10:20:48', '2019-11-20 10:20:48', '1cfeede9-3ada-4ab5-b72d-d9bef166861d', 'Cheese', '99.90', 'available'),
(33, 75, 1, '2019-11-20 10:31:28', '2019-11-20 10:31:28', '011478bd-3f57-4281-a02e-2a8c99f171d8', 'Salmonsss', '14.99', 'unavailable'),
(34, 76, 1, '2019-11-20 10:31:28', '2019-11-20 10:31:28', 'ecd605bb-ca49-4ee0-8078-f9f6fcdf074c', 'Cheese', '99.90', 'available'),
(35, 84, 1, '2019-11-20 10:35:01', '2019-11-20 10:35:01', 'd474e4d9-25c6-4359-a928-2f257bbff726', 'Salmonsss', '14.999', 'unavailable'),
(36, 85, 1, '2019-11-20 10:35:01', '2019-11-20 10:35:01', '7d8a8cbc-1def-4618-9a8c-959c02f9cf44', 'Cheese', '99.90', 'available'),
(37, 259, 1, '2019-11-23 05:14:04', '2019-11-23 06:22:34', 'f2df0d88-dd64-4da5-851d-3abdca24c0e6', 'Pork', '111g', 'available'),
(38, 261, 1, '2019-11-23 05:14:04', '2019-11-23 05:14:04', '486af64a-f449-4f11-b425-4adf199d936d', 'Salmonsss', '14.999', 'unavailable'),
(39, 262, 1, '2019-11-23 05:14:04', '2019-11-23 05:14:04', '89d1100d-5637-4128-96cf-b3a021d74cf0', 'Cheese', '99.90', 'available'),
(40, 263, 1, '2019-11-23 05:14:04', '2019-11-23 05:14:04', '943bd620-397f-48ce-937b-0d8c5ca22830', 'Pork', '111', 'available'),
(41, 359, 1, '2019-11-23 05:53:24', '2019-11-23 05:53:24', '13f57a1b-5c5e-4252-a2ae-b4e5cc69808f', 'Salmonsss', '14.999', 'unavailable'),
(42, 360, 1, '2019-11-23 05:53:24', '2019-11-23 05:53:24', 'ca0aa7d9-371c-471c-bd79-d340b832957c', 'Cheeseg', '99.90g', 'available'),
(43, 361, 1, '2019-11-23 05:53:24', '2019-11-23 05:53:24', 'ac33152a-715e-46ec-9435-86454e07ed0a', 'Pork', '111g', 'available'),
(44, 364, 1, '2019-11-23 05:56:36', '2019-11-23 06:22:34', '4b5a9a41-f72e-48f3-8a3e-fb693bbafe85', 'tew', 'tw3et', 'available'),
(45, 366, 1, '2019-11-23 05:56:36', '2019-11-23 05:56:36', 'a8e978e1-7e8b-43d6-8251-c88494ce6460', 'Salmonsss', '14.999', 'unavailable'),
(46, 367, 1, '2019-11-23 05:56:36', '2019-11-23 05:56:36', '67c2a647-2e8c-42f2-8917-fbeb80e2ce0d', 'Cheeseg', '99.90g', 'available'),
(47, 368, 1, '2019-11-23 05:56:36', '2019-11-23 05:56:36', 'af42b5ef-2ac6-46e4-aa02-00b5c1bb7146', 'Pork', '111g', 'available'),
(48, 369, 1, '2019-11-23 05:56:36', '2019-11-23 05:56:36', 'a61d9988-52f0-4acc-a8cb-4bbfa3ef1a65', 'tew', 'tw3et', 'available'),
(49, 406, 1, '2019-11-23 06:06:49', '2019-11-23 06:06:49', '4f590731-1be8-4a51-8b37-1403f20c4fea', 'Salmonsss', '14.999sss', 'unavailable'),
(50, 407, 1, '2019-11-23 06:06:49', '2019-11-23 06:06:49', '0d88f8be-d217-400a-8c63-40e8fd5fcfa5', 'Cheeseg', '99.90g', 'available'),
(51, 408, 1, '2019-11-23 06:06:49', '2019-11-23 06:06:49', '00540b99-fdc8-4546-816c-84b99b466978', 'Pork', '111g', 'available'),
(52, 409, 1, '2019-11-23 06:06:49', '2019-11-23 06:06:49', 'a1529853-7b73-435c-b9cd-1e25b5ee4e6d', 'tew', 'tw3et', 'available'),
(53, 424, 1, '2019-11-23 06:22:34', '2019-11-23 06:22:34', 'aefe4ef5-c275-4c74-ad3e-d55ae66e643e', 'asd', 'asd', 'unavailable'),
(54, 426, 1, '2019-11-23 06:22:34', '2019-11-23 06:22:34', 'a97832b4-5d89-4613-a1ba-aadb96ae76c9', 'Salmonsss', '14.999sss', 'unavailable'),
(55, 427, 1, '2019-11-23 06:22:34', '2019-11-23 06:22:34', 'e595c295-7bd0-4995-a2b2-0532e474eb54', 'Cheeseg', '99.90g', 'available'),
(56, 428, 1, '2019-11-23 06:22:34', '2019-11-23 06:22:34', 'f180530a-d49f-48ea-bf09-9e2c25e3cc78', 'Pork', '111g', 'available'),
(57, 429, 1, '2019-11-23 06:22:34', '2019-11-23 06:22:34', 'b6f03bda-c58c-452f-b944-07bbe99d263c', 'tew', 'tw3et', 'available'),
(58, 430, 1, '2019-11-23 06:22:34', '2019-11-23 06:22:34', 'a8d5be4a-267f-48fe-aaf8-b12965d48475', 'asd', 'asd', 'unavailable');

-- --------------------------------------------------------

--
-- Table structure for table `matrixcontent_newsfeed`
--

CREATE TABLE `matrixcontent_newsfeed` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_news_newsTitle` text,
  `field_news_newsDescription` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `matrixcontent_newsfeed`
--

INSERT INTO `matrixcontent_newsfeed` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_news_newsTitle`, `field_news_newsDescription`) VALUES
(1, 9, 1, '2019-11-17 05:34:08', '2019-11-23 05:51:27', '115471d7-09ea-4037-bd3c-7929ec00ae3b', 'wow new cool title', 'dang that description'),
(2, 10, 1, '2019-11-17 05:35:01', '2019-11-23 06:13:03', '11b8cb2b-c2f6-4957-be9e-619261d5ab11', 'wow new cool title newer!!', 'descriptiondescriptiondescriptionsww'),
(3, 11, 1, '2019-11-17 05:35:16', '2019-11-23 05:51:27', 'a1a6bc4b-22a3-481f-9059-d8ac000d67ca', 'Hello!', 'test'),
(4, 13, 1, '2019-11-20 10:20:47', '2019-11-20 10:20:47', '66f73e85-d9fc-4a57-a100-46e2ebeb2e83', 'wow new cool title newer!', 'descriptiondescriptiondescription'),
(5, 14, 1, '2019-11-20 10:20:47', '2019-11-20 10:20:47', '7207aa81-86aa-4e52-a50e-e6bf043c998e', 'wow new cool title', 'dang that description'),
(6, 15, 1, '2019-11-20 10:20:47', '2019-11-20 10:20:47', '9f4e5965-f394-46eb-991d-0b2c07228e8f', 'Hello!', 'test'),
(7, 17, 1, '2019-11-20 10:20:47', '2019-11-20 10:20:47', '506460ee-fbd1-495d-bc27-37be51f5577c', 'wow new cool title newer!', 'descriptiondescriptiondescription'),
(8, 18, 1, '2019-11-20 10:20:47', '2019-11-20 10:20:47', '5a2b361f-3d71-4ab6-bf57-d682f760dbe1', 'wow new cool title', 'dang that description'),
(9, 19, 1, '2019-11-20 10:20:47', '2019-11-20 10:20:47', 'b6a652b9-8ba2-48f6-884d-953b2f52958b', 'Hello!', 'test'),
(10, 21, 1, '2019-11-20 10:20:47', '2019-11-20 10:20:47', '1dd2f9f7-afc6-4ed5-8f8e-313d8649abb8', 'wow new cool title newer!', 'descriptiondescriptiondescription'),
(11, 22, 1, '2019-11-20 10:20:47', '2019-11-20 10:20:47', 'bd73b36b-8cf1-4be2-98ba-520d290e6a73', 'wow new cool title', 'dang that description'),
(12, 23, 1, '2019-11-20 10:20:47', '2019-11-20 10:20:47', '2d244221-6a4e-4fbd-8417-d744b7edd2b6', 'Hello!', 'test'),
(13, 25, 1, '2019-11-20 10:20:47', '2019-11-20 10:20:47', '88e5fcbf-9d90-4f43-8867-73a311c1282b', 'wow new cool title newer!', 'descriptiondescriptiondescription'),
(14, 26, 1, '2019-11-20 10:20:47', '2019-11-20 10:20:47', 'd2592199-43b4-4c28-8546-a79b41f152a9', 'wow new cool title', 'dang that description'),
(15, 27, 1, '2019-11-20 10:20:47', '2019-11-20 10:20:47', '9ba1d313-0561-4271-9063-a4ea60a7a080', 'Hello!', 'test'),
(16, 80, 1, '2019-11-20 10:33:23', '2019-11-20 10:33:23', 'b6e281d4-ce46-442d-913a-b869a64c51e5', 'wow new cool title newer!!', 'descriptiondescriptiondescription'),
(17, 81, 1, '2019-11-20 10:33:23', '2019-11-20 10:33:23', '3e538a13-128d-4836-be09-53878cada53c', 'wow new cool title', 'dang that description'),
(18, 82, 1, '2019-11-20 10:33:23', '2019-11-20 10:33:23', 'ad1d4d4c-dfd7-4da4-ace3-774948aa80eb', 'Hello!', 'test'),
(19, 91, 1, '2019-11-23 00:54:46', '2019-11-23 00:54:46', 'bb348b86-d746-4a41-9f7a-8f499b71e7d8', 'wow new cool title newer!!', 'descriptiondescriptiondescriptions'),
(20, 92, 1, '2019-11-23 00:54:46', '2019-11-23 00:54:46', 'f37f76bd-2f43-4e11-82d5-3cf22b769cbe', 'wow new cool title', 'dang that description'),
(21, 93, 1, '2019-11-23 00:54:46', '2019-11-23 00:54:46', '47782778-5fb8-49d8-8534-6f24b8335dc9', 'Hello!', 'test'),
(22, 95, 1, '2019-11-23 01:10:56', '2019-11-23 01:10:56', '4cec96d4-eae2-4ff7-b680-2e7d13e6a04b', 'wow new cool title newer!!', 'descriptiondescriptiondescriptionswww'),
(23, 96, 1, '2019-11-23 01:10:56', '2019-11-23 01:10:56', '2a5710c0-1cfb-4d73-84c8-401c170103d0', 'wow new cool title', 'dang that description'),
(24, 97, 1, '2019-11-23 01:10:56', '2019-11-23 01:10:56', '3636ca71-5f68-4927-b657-9762ebf0e175', 'Hello!', 'test'),
(26, 102, 1, '2019-11-23 01:21:42', '2019-11-23 05:51:27', '1ec204fa-dc3a-41fa-90d5-0a99fe226ff3', 'testy', 'testinggggggggg'),
(27, 104, 1, '2019-11-23 01:21:43', '2019-11-23 01:21:43', 'b15d841f-3a1c-4480-ac9c-71367c333a40', 'wow new cool title newer!!', 'descriptiondescriptiondescriptionswww'),
(28, 105, 1, '2019-11-23 01:21:43', '2019-11-23 01:21:43', 'ccdff199-8901-4d31-9de9-431e484588fe', 'wow new cool title', 'dang that description'),
(29, 106, 1, '2019-11-23 01:21:43', '2019-11-23 01:21:43', '4d7be0b2-e0db-4487-83c6-9012f341d4e5', 'Hello!', 'test'),
(30, 107, 1, '2019-11-23 01:21:43', '2019-11-23 01:21:43', '4a5b81a7-566b-47f5-beea-7738e1eab62a', 'testy', 'testinggggggggg'),
(32, 109, 1, '2019-11-23 01:25:17', '2019-11-23 05:51:27', 'f38d7af2-9a15-4d39-9cc1-a6a033644d88', 'newwwwwwww', 'wwwww'),
(33, 111, 1, '2019-11-23 01:25:17', '2019-11-23 01:25:17', '9397897a-0b84-4ce8-a086-63fa2f2b8b3b', 'wow new cool title newer!!', 'descriptiondescriptiondescriptionswww'),
(34, 112, 1, '2019-11-23 01:25:17', '2019-11-23 01:25:17', '43152333-b6d7-4f43-bc56-566a83ccfcb6', 'wow new cool title', 'dang that description'),
(35, 113, 1, '2019-11-23 01:25:17', '2019-11-23 01:25:17', 'fc0ad6b8-6a35-4a21-87e3-83e536d303df', 'Hello!', 'test'),
(36, 114, 1, '2019-11-23 01:25:17', '2019-11-23 01:25:17', '59cb7d38-ba7e-443c-93d6-a0a97efbf972', 'testy', 'testinggggggggg'),
(37, 115, 1, '2019-11-23 01:25:17', '2019-11-23 01:25:17', 'fc7cf084-60bd-47b1-b446-05b7b4a64d06', 'newwwwwwww', 'wwwww'),
(38, 127, 1, '2019-11-23 01:39:52', '2019-11-23 01:39:52', '9e5ae7c8-afa8-4524-a5e8-be598dce5de9', 'wow new cool title newer!!', 'descriptiondescriptiondescriptionswww .  ssss'),
(39, 128, 1, '2019-11-23 01:39:52', '2019-11-23 01:39:52', '20f8eaa9-1d28-47bd-8939-ef2ce85efaa9', 'wow new cool title', 'dang that description'),
(40, 129, 1, '2019-11-23 01:39:52', '2019-11-23 01:39:52', '835c9635-fa82-4edb-a604-2cf1d0afd3c1', 'Hello!', 'test'),
(41, 130, 1, '2019-11-23 01:39:52', '2019-11-23 01:39:52', '7979989a-eae6-41fc-b764-616af2780b18', 'testy', 'testinggggggggg'),
(42, 131, 1, '2019-11-23 01:39:52', '2019-11-23 01:39:52', '8496fabe-cfe4-49a3-a8f0-081dc331e62a', 'newwwwwwww', 'wwwww'),
(43, 135, 1, '2019-11-23 01:41:52', '2019-11-23 05:51:27', '9556bbbd-527b-4937-a38b-0377c0f9f73c', 'enwewe', 'ewnenwenw'),
(44, 137, 1, '2019-11-23 01:41:52', '2019-11-23 01:41:52', '466d8d8b-38bb-42c4-8c1c-e39beef73e74', 'wow new cool title newer!!', 'descriptiondescriptiondescriptionswww .  ssss'),
(45, 138, 1, '2019-11-23 01:41:52', '2019-11-23 01:41:52', '6eb14c19-a3b2-402d-8c8a-df57257908d7', 'wow new cool title', 'dang that description'),
(46, 139, 1, '2019-11-23 01:41:52', '2019-11-23 01:41:52', '160b4e96-f1ce-46bb-a6e1-2a2f5227ba08', 'Hello!', 'test'),
(47, 140, 1, '2019-11-23 01:41:52', '2019-11-23 01:41:52', 'e16e71fc-1d2c-4158-9ae5-a74b09ec0661', 'testy', 'testinggggggggg'),
(48, 141, 1, '2019-11-23 01:41:52', '2019-11-23 01:41:52', '12662468-ebdc-468d-b178-f256c9e58ef9', 'newwwwwwww', 'wwwww'),
(49, 142, 1, '2019-11-23 01:41:52', '2019-11-23 01:41:52', '4b5e954d-d8b0-4370-ac8c-c48f6d81feda', 'enwewe', 'ewnenwenw'),
(50, 149, 1, '2019-11-23 01:49:57', '2019-11-23 05:51:27', 'b4ed94ea-34d1-496c-99c3-f0fa23b432ca', NULL, NULL),
(51, 151, 1, '2019-11-23 01:49:57', '2019-11-23 01:49:57', 'b3a7445f-7dd9-4aeb-8ed8-72cc93c9c00e', 'wow new cool title newer!!', 'descriptiondescriptiondescriptionswww .  ssss'),
(52, 152, 1, '2019-11-23 01:49:57', '2019-11-23 01:49:57', '87e6d35b-e6f5-40cc-978b-25914ae93276', 'wow new cool title', 'dang that description'),
(53, 153, 1, '2019-11-23 01:49:57', '2019-11-23 01:49:57', '31ab6cee-e7ac-4288-9419-c4c6ab139756', 'Hello!', 'test'),
(54, 154, 1, '2019-11-23 01:49:57', '2019-11-23 01:49:57', '461f4a0d-2e6e-4996-bc9a-f4796e84be69', 'testy', 'testinggggggggg'),
(55, 155, 1, '2019-11-23 01:49:57', '2019-11-23 01:49:57', '6a7599da-c709-4d78-9f1b-99cd24bba0ca', 'newwwwwwww', 'wwwww'),
(56, 156, 1, '2019-11-23 01:49:57', '2019-11-23 01:49:57', '5c0d6d53-3cc7-4893-b4f5-599a1007d9d8', 'enwewe', 'ewnenwenw'),
(57, 157, 1, '2019-11-23 01:49:57', '2019-11-23 01:49:57', 'f337aab1-b897-40b2-82e4-60f2915ebf1c', 'craft\\\\elements\\\\Entry', 'craft\\\\elements\\\\Entry'),
(58, 181, 1, '2019-11-23 02:18:03', '2019-11-23 05:51:27', 'e572df5c-394f-4041-abae-c4c7984f7f8b', 'heyoooo', 'heyoooo'),
(59, 183, 1, '2019-11-23 02:18:03', '2019-11-23 02:18:03', '90a1d97e-bb86-404d-9e5d-9d031c3619fc', 'wow new cool title newer!!', 'descriptiondescriptiondescriptionswww .  ssss'),
(60, 184, 1, '2019-11-23 02:18:03', '2019-11-23 02:18:03', '76d27b5b-8d43-4f6f-9e45-fa1d74f4be41', 'wow new cool title', 'dang that description'),
(61, 185, 1, '2019-11-23 02:18:03', '2019-11-23 02:18:03', 'da8ef806-bf92-4e08-82ea-74dd493f5d5d', 'Hello!', 'test'),
(62, 186, 1, '2019-11-23 02:18:03', '2019-11-23 02:18:03', '48084ea3-2470-49ad-aeaa-9d1a85b5bc6d', 'testy', 'testinggggggggg'),
(63, 187, 1, '2019-11-23 02:18:03', '2019-11-23 02:18:03', '9a55b8e7-fbea-4908-9073-5468f0096232', 'newwwwwwww', 'wwwww'),
(64, 188, 1, '2019-11-23 02:18:03', '2019-11-23 02:18:03', '903d93a3-773d-4ed6-9515-bd8464dad615', 'enwewe', 'ewnenwenw'),
(65, 189, 1, '2019-11-23 02:18:03', '2019-11-23 02:18:03', '1d97b33f-a630-4c7a-9016-e7b58736a5ae', NULL, NULL),
(66, 190, 1, '2019-11-23 02:18:03', '2019-11-23 02:18:03', '76e7390e-11e2-46e6-8205-710bd4bdd412', 'heyoooo', 'heyoooo'),
(67, 191, 1, '2019-11-23 02:37:30', '2019-11-23 05:51:27', '55e534de-14f7-4247-aa59-6f66dd77cd74', 'test1 save again chane', 'test1 save again test'),
(68, 193, 1, '2019-11-23 02:37:30', '2019-11-23 02:37:30', 'c6b77450-608d-4be5-8437-1207af3ef952', 'wow new cool title newer!!', 'descriptiondescriptiondescriptionswww .  ssss'),
(69, 194, 1, '2019-11-23 02:37:30', '2019-11-23 02:37:30', '669b3445-0dfc-4044-9959-af9e1bad9057', 'wow new cool title', 'dang that description'),
(70, 195, 1, '2019-11-23 02:37:30', '2019-11-23 02:37:30', 'cdb1a076-5fea-4969-8a2a-5729aec1b9a3', 'Hello!', 'test'),
(71, 196, 1, '2019-11-23 02:37:30', '2019-11-23 02:37:30', '9b526436-b7ef-4517-8883-b9bb6786128c', 'testy', 'testinggggggggg'),
(72, 197, 1, '2019-11-23 02:37:30', '2019-11-23 02:37:30', '2c38404e-a766-4e11-a735-e9c3d693e7b7', 'newwwwwwww', 'wwwww'),
(73, 198, 1, '2019-11-23 02:37:30', '2019-11-23 02:37:30', '4841cbb5-cbab-46da-bcaf-c30f2dda4649', 'enwewe', 'ewnenwenw'),
(74, 199, 1, '2019-11-23 02:37:30', '2019-11-23 02:37:30', '98366287-149d-4744-8295-0e312b2e691f', NULL, NULL),
(75, 200, 1, '2019-11-23 02:37:30', '2019-11-23 02:37:30', 'c2e4de4c-00ae-417b-bd2d-e78c1018301d', 'heyoooo', 'heyoooo'),
(76, 201, 1, '2019-11-23 02:37:30', '2019-11-23 02:37:30', '9af441f2-d75f-4c12-b264-0edbf7e13d8c', 'test1', 'test1'),
(77, 205, 1, '2019-11-23 02:38:31', '2019-11-23 05:51:27', '7ef53b45-200c-45f2-825b-d9a89c9325cc', 'new onw', 'new oned'),
(78, 207, 1, '2019-11-23 02:38:31', '2019-11-23 02:38:31', '8a7d688d-8c8e-41a5-9c5e-d6849758a489', 'wow new cool title newer!!', 'descriptiondescriptiondescriptionswww .  ssss'),
(79, 208, 1, '2019-11-23 02:38:31', '2019-11-23 02:38:31', 'e10aa6d1-f5a9-4ca7-bde2-7e7e60822fa6', 'wow new cool title', 'dang that description'),
(80, 209, 1, '2019-11-23 02:38:31', '2019-11-23 02:38:31', 'bddb1aea-ce58-4ee5-9fdf-782531ef1439', 'Hello!', 'test'),
(81, 210, 1, '2019-11-23 02:38:31', '2019-11-23 02:38:31', 'e7afc6f6-4b87-4fc6-93f5-31efbdbe9dfb', 'testy', 'testinggggggggg'),
(82, 211, 1, '2019-11-23 02:38:31', '2019-11-23 02:38:31', '8055555f-8859-466f-814d-ec33c99c57f4', 'newwwwwwww', 'wwwww'),
(83, 212, 1, '2019-11-23 02:38:31', '2019-11-23 02:38:31', '838d07e4-ab87-469e-a930-669bd152a56d', 'enwewe', 'ewnenwenw'),
(84, 213, 1, '2019-11-23 02:38:31', '2019-11-23 02:38:31', '6d7c8e8a-cbaa-4b60-a708-ebf38575dbd8', NULL, NULL),
(85, 214, 1, '2019-11-23 02:38:31', '2019-11-23 02:38:31', '50146d31-69ab-4da8-90dd-99881a12ea86', 'heyoooo', 'heyoooo'),
(86, 215, 1, '2019-11-23 02:38:31', '2019-11-23 02:38:31', '5dd88b73-6a29-412e-bdf3-b9dfefdb7236', 'test1 save again', 'test1 save again'),
(87, 216, 1, '2019-11-23 02:38:31', '2019-11-23 02:38:31', 'e755d45b-72ea-4903-a8e9-7a0e46d2c666', 'new onw', 'new one'),
(88, 217, 1, '2019-11-23 02:39:26', '2019-11-23 05:51:27', '5350a74b-9bd8-43b7-a63a-c21a903cc5bc', 'newn!', 'new'),
(89, 219, 1, '2019-11-23 02:39:26', '2019-11-23 02:39:26', '5ca9d458-de2e-4a22-93bb-129d0f38182b', 'wow new cool title newer!!', 'descriptiondescriptiondescriptionswww .  ssss'),
(90, 220, 1, '2019-11-23 02:39:26', '2019-11-23 02:39:26', '45ea7a01-04b4-4a94-ae3d-7110275d7c06', 'wow new cool title', 'dang that description'),
(91, 221, 1, '2019-11-23 02:39:26', '2019-11-23 02:39:26', '790c17be-123e-41df-8f4d-ea438d28d332', 'Hello!', 'test'),
(92, 222, 1, '2019-11-23 02:39:27', '2019-11-23 02:39:27', '810a8eeb-34c4-4cdc-8be8-520cbc504890', 'testy', 'testinggggggggg'),
(93, 223, 1, '2019-11-23 02:39:27', '2019-11-23 02:39:27', '0510f75d-a865-44e5-9f73-3004440593e5', 'newwwwwwww', 'wwwww'),
(94, 224, 1, '2019-11-23 02:39:27', '2019-11-23 02:39:27', '6ac9eea9-71a2-4c15-81e0-00c0b14d46df', 'enwewe', 'ewnenwenw'),
(95, 225, 1, '2019-11-23 02:39:27', '2019-11-23 02:39:27', 'cde5e4bd-b3cd-422f-9e04-461fb8b8c605', NULL, NULL),
(96, 226, 1, '2019-11-23 02:39:27', '2019-11-23 02:39:27', '328fd98f-8127-4836-bc51-2ffe50298d4a', 'heyoooo', 'heyoooo'),
(97, 227, 1, '2019-11-23 02:39:27', '2019-11-23 02:39:27', 'dd8264f2-bde5-4216-9718-49e44a9021ab', 'test1 save again chane', 'test1 save again test'),
(98, 228, 1, '2019-11-23 02:39:27', '2019-11-23 02:39:27', '621aeb8f-ed49-42f2-9b9d-c7356afa6bf0', 'new onw', 'new oned'),
(99, 229, 1, '2019-11-23 02:39:27', '2019-11-23 02:39:27', '082d06c9-23e4-4117-9fb3-08fe1ea96468', 'newn!', 'new'),
(100, 230, 1, '2019-11-23 02:39:50', '2019-11-23 05:51:27', '8ddce950-0593-46cc-87b0-2525d8aa49ac', 'new', 'newn'),
(101, 232, 1, '2019-11-23 02:39:50', '2019-11-23 02:39:50', '6ee2abc1-552d-45f1-a292-c14b68cc60c2', 'wow new cool title newer!!', 'descriptiondescriptiondescriptionswww .  ssss'),
(102, 233, 1, '2019-11-23 02:39:50', '2019-11-23 02:39:50', '6d5a473e-30e1-4c13-9bbe-65301e396596', 'wow new cool title', 'dang that description'),
(103, 234, 1, '2019-11-23 02:39:50', '2019-11-23 02:39:50', '248d1802-17a1-48b2-a94c-cf9a716013f2', 'Hello!', 'test'),
(104, 235, 1, '2019-11-23 02:39:50', '2019-11-23 02:39:50', 'c5f5057d-1904-4af7-8f4c-ac8a03e9ba37', 'testy', 'testinggggggggg'),
(105, 236, 1, '2019-11-23 02:39:50', '2019-11-23 02:39:50', '6ac4e7a3-cec6-4574-a1cd-4bd427b45d23', 'newwwwwwww', 'wwwww'),
(106, 237, 1, '2019-11-23 02:39:50', '2019-11-23 02:39:50', '35c08793-8fb8-4e5b-936d-cdd762aa3b98', 'enwewe', 'ewnenwenw'),
(107, 238, 1, '2019-11-23 02:39:50', '2019-11-23 02:39:50', 'be959741-e3f1-4762-8a42-caf1fd3b7c6b', NULL, NULL),
(108, 239, 1, '2019-11-23 02:39:50', '2019-11-23 02:39:50', '26635e01-7e52-42c7-bfd1-16f43c5cba4a', 'heyoooo', 'heyoooo'),
(109, 240, 1, '2019-11-23 02:39:50', '2019-11-23 02:39:50', '51961340-af91-4d24-904d-c7c4b5c5664d', 'test1 save again chane', 'test1 save again test'),
(110, 241, 1, '2019-11-23 02:39:50', '2019-11-23 02:39:50', '67cb2c4b-0117-4a28-b012-9907e86411a4', 'new onw', 'new oned'),
(111, 242, 1, '2019-11-23 02:39:50', '2019-11-23 02:39:50', '829f6b38-e958-4955-a72d-b4880913364d', 'newn!', 'new'),
(112, 243, 1, '2019-11-23 02:39:50', '2019-11-23 02:39:50', 'ecc26e0f-c155-4547-8344-11aadf9f1cf8', 'new', 'newn'),
(113, 244, 1, '2019-11-23 05:13:35', '2019-11-23 05:51:27', 'd8b23cc2-620c-4531-b1d5-25a15ddc4338', 't', 't'),
(114, 246, 1, '2019-11-23 05:13:35', '2019-11-23 05:13:35', '50d94e1d-a9b6-4d4c-ae59-cf83fe98160d', 'wow new cool title newer!!', 'descriptiondescriptiondescriptionswww .  ssss'),
(115, 247, 1, '2019-11-23 05:13:35', '2019-11-23 05:13:35', '9fd3626c-88bb-42ac-866a-60485ecb88e6', 'wow new cool title', 'dang that description'),
(116, 248, 1, '2019-11-23 05:13:35', '2019-11-23 05:13:35', 'cfd0ed89-bcc0-4707-b661-49aa907975f8', 'Hello!', 'test'),
(117, 249, 1, '2019-11-23 05:13:35', '2019-11-23 05:13:35', 'e17238fb-12d8-4189-96b0-ab89817434d4', 'testy', 'testinggggggggg'),
(118, 250, 1, '2019-11-23 05:13:35', '2019-11-23 05:13:35', '337a055c-1e93-49a0-99b1-97d19ca757ee', 'newwwwwwww', 'wwwww'),
(119, 251, 1, '2019-11-23 05:13:35', '2019-11-23 05:13:35', 'fc15f4ad-ed77-41bc-a78e-6e8b758102d3', 'enwewe', 'ewnenwenw'),
(120, 252, 1, '2019-11-23 05:13:35', '2019-11-23 05:13:35', 'f7010318-3366-4e86-99ea-db15d39c4b47', NULL, NULL),
(121, 253, 1, '2019-11-23 05:13:35', '2019-11-23 05:13:35', 'c9a80ad3-e07d-4c15-b53c-48d51e490bca', 'heyoooo', 'heyoooo'),
(122, 254, 1, '2019-11-23 05:13:35', '2019-11-23 05:13:35', '87e230ab-a209-4fb1-913d-117b7022b449', 'test1 save again chane', 'test1 save again test'),
(123, 255, 1, '2019-11-23 05:13:35', '2019-11-23 05:13:35', 'a7dbf3ee-a5ad-4a92-89df-cc1f7f5ba23d', 'new onw', 'new oned'),
(124, 256, 1, '2019-11-23 05:13:35', '2019-11-23 05:13:35', '17e3cd67-a9b2-49ea-b418-2380199ce4a5', 'newn!', 'new'),
(125, 257, 1, '2019-11-23 05:13:35', '2019-11-23 05:13:35', '3f03fcc2-08d4-4fd8-ab0f-eb1db7da1ae3', 'new', 'newn'),
(126, 258, 1, '2019-11-23 05:13:35', '2019-11-23 05:13:35', '5acbc266-9f93-49bf-a1ac-8eb8e2959b19', 't', 't'),
(127, 264, 1, '2019-11-23 05:14:22', '2019-11-23 05:51:27', '39c5212b-0020-416c-aadd-a5c9b9ee56ea', 't', 't'),
(128, 266, 1, '2019-11-23 05:14:23', '2019-11-23 05:14:23', '9f2e1621-29b0-454d-bd37-021686c93c59', 'wow new cool title newer!!', 'descriptiondescriptiondescriptionswww .  ssss'),
(129, 267, 1, '2019-11-23 05:14:23', '2019-11-23 05:14:23', 'cdd5ceb0-ca5b-4410-ad8e-991ebb635af4', 'wow new cool title', 'dang that description'),
(130, 268, 1, '2019-11-23 05:14:23', '2019-11-23 05:14:23', '2ac578d6-901c-4176-9961-dba10fdf6bc9', 'Hello!', 'test'),
(131, 269, 1, '2019-11-23 05:14:23', '2019-11-23 05:14:23', 'a26ef1dc-0ce0-40a4-b1f7-af7d3202cdd8', 'testy', 'testinggggggggg'),
(132, 270, 1, '2019-11-23 05:14:23', '2019-11-23 05:14:23', '07aebca2-5055-459b-8c38-e12e6c69bb45', 'newwwwwwww', 'wwwww'),
(133, 271, 1, '2019-11-23 05:14:23', '2019-11-23 05:14:23', '252b542c-4de7-4b2c-a367-81309cc733ea', 'enwewe', 'ewnenwenw'),
(134, 272, 1, '2019-11-23 05:14:23', '2019-11-23 05:14:23', '3279aa8a-2640-4cab-943d-0bf1195bceb9', NULL, NULL),
(135, 273, 1, '2019-11-23 05:14:23', '2019-11-23 05:14:23', 'b5094627-12e3-443c-9299-8a159d0e53bb', 'heyoooo', 'heyoooo'),
(136, 274, 1, '2019-11-23 05:14:23', '2019-11-23 05:14:23', '7d6c2667-8dc1-49ea-8a53-646229fc9a36', 'test1 save again chane', 'test1 save again test'),
(137, 275, 1, '2019-11-23 05:14:23', '2019-11-23 05:14:23', 'aada7603-3850-488b-9beb-26befd2f9f4d', 'new onw', 'new oned'),
(138, 276, 1, '2019-11-23 05:14:23', '2019-11-23 05:14:23', 'c6bbc373-367c-47ae-9e93-460edc25cb45', 'newn!', 'new'),
(139, 277, 1, '2019-11-23 05:14:23', '2019-11-23 05:14:23', '2da9115b-8fa0-4ac5-a2f2-9fe88f41632e', 'new', 'newn'),
(140, 278, 1, '2019-11-23 05:14:23', '2019-11-23 05:14:23', '380d643d-f50b-41af-8133-6fdf15b35539', 't', 't'),
(141, 279, 1, '2019-11-23 05:14:23', '2019-11-23 05:14:23', '35c58bf2-776b-44d8-b659-87d3a45b6435', 't', 't'),
(142, 304, 1, '2019-11-23 05:38:10', '2019-11-23 05:51:27', '3667007e-8b95-4f0b-b81e-eea6af6be837', 'w', 'w'),
(143, 306, 1, '2019-11-23 05:38:10', '2019-11-23 05:38:10', 'dfa2c690-a8d4-4fb1-9868-942d5ff11a55', 'wow new cool title newer!!', 'descriptiondescriptiondescriptionswww .  ssss'),
(144, 307, 1, '2019-11-23 05:38:10', '2019-11-23 05:38:10', '0ac864bc-f326-46f9-a9d7-ca2962657d70', 'wow new cool title', 'dang that description'),
(145, 308, 1, '2019-11-23 05:38:10', '2019-11-23 05:38:10', 'c2de1766-af5d-4441-b71b-c002c249eb3d', 'Hello!', 'test'),
(146, 309, 1, '2019-11-23 05:38:10', '2019-11-23 05:38:10', '018e9f4b-77e8-4098-8de4-4fb4ec83670f', 'testy', 'testinggggggggg'),
(147, 310, 1, '2019-11-23 05:38:10', '2019-11-23 05:38:10', '64927f50-1e8a-4398-a04e-1488a0ddbc09', 'newwwwwwww', 'wwwww'),
(148, 311, 1, '2019-11-23 05:38:10', '2019-11-23 05:38:10', '21838751-fe1d-4729-b10f-6023622e6b81', 'enwewe', 'ewnenwenw'),
(149, 312, 1, '2019-11-23 05:38:10', '2019-11-23 05:38:10', '53680079-1816-4f80-a26b-0c5b26c314db', NULL, NULL),
(150, 313, 1, '2019-11-23 05:38:10', '2019-11-23 05:38:10', '202a36d0-35f3-46ed-a889-cbe9d316286e', 'heyoooo', 'heyoooo'),
(151, 314, 1, '2019-11-23 05:38:10', '2019-11-23 05:38:10', 'c27fe249-c294-4fc7-a705-101de9d61209', 'test1 save again chane', 'test1 save again test'),
(152, 315, 1, '2019-11-23 05:38:10', '2019-11-23 05:38:10', '4d3d30f6-9e9d-4a25-9fbe-76d995ea80ad', 'new onw', 'new oned'),
(153, 316, 1, '2019-11-23 05:38:10', '2019-11-23 05:38:10', 'e28f1b70-2adf-4e3f-a3d0-d3d93e4d921d', 'newn!', 'new'),
(154, 317, 1, '2019-11-23 05:38:10', '2019-11-23 05:38:10', '572c2865-45a7-4a02-b5fc-40f9e0d323d0', 'new', 'newn'),
(155, 318, 1, '2019-11-23 05:38:10', '2019-11-23 05:38:10', 'c02ff451-04c7-4e6a-abc7-9fc846e30a16', 't', 't'),
(156, 319, 1, '2019-11-23 05:38:10', '2019-11-23 05:38:10', '1116d52d-6266-4435-980e-6acaa9b73b9a', 't', 't'),
(157, 320, 1, '2019-11-23 05:38:10', '2019-11-23 05:38:10', '00fbdf83-ddb0-45a6-8b0f-4c0909d1c759', 'w', 'w'),
(158, 321, 1, '2019-11-23 05:45:25', '2019-11-23 05:51:27', '12ff6ea3-92f4-4532-a670-2c9d6e9d2bd7', 'wef', 'wef'),
(159, 323, 1, '2019-11-23 05:45:25', '2019-11-23 05:45:25', '57df7697-4235-4478-8435-1bae863c2113', 'wow new cool title newer!!', 'descriptiondescriptiondescriptionswww .  ssss'),
(160, 324, 1, '2019-11-23 05:45:25', '2019-11-23 05:45:25', '0359fff9-63cb-4a2c-8170-85e1fcd0845b', 'wow new cool title', 'dang that description'),
(161, 325, 1, '2019-11-23 05:45:25', '2019-11-23 05:45:25', 'eedaef14-98ce-47d7-b1a1-fbf6e1351656', 'Hello!', 'test'),
(162, 326, 1, '2019-11-23 05:45:25', '2019-11-23 05:45:25', '8f38d35f-3167-4e63-940b-5d120d9bd639', 'testy', 'testinggggggggg'),
(163, 327, 1, '2019-11-23 05:45:25', '2019-11-23 05:45:25', 'c94252c6-47df-4b7e-a9c3-3d8bce99d86b', 'newwwwwwww', 'wwwww'),
(164, 328, 1, '2019-11-23 05:45:25', '2019-11-23 05:45:25', '263506a2-08e9-4b7f-ab86-2964541f8473', 'enwewe', 'ewnenwenw'),
(165, 329, 1, '2019-11-23 05:45:25', '2019-11-23 05:45:25', 'abb99da3-ec3c-4075-8065-51dc62a2a1ef', NULL, NULL),
(166, 330, 1, '2019-11-23 05:45:25', '2019-11-23 05:45:25', 'fe5a122f-ddb2-4b00-8d29-269af12917ad', 'heyoooo', 'heyoooo'),
(167, 331, 1, '2019-11-23 05:45:25', '2019-11-23 05:45:25', '07f6b957-f0f3-4851-938d-c5a90172ff8a', 'test1 save again chane', 'test1 save again test'),
(168, 332, 1, '2019-11-23 05:45:25', '2019-11-23 05:45:25', '98f3e2c4-0276-462f-b25f-bd4de12240f1', 'new onw', 'new oned'),
(169, 333, 1, '2019-11-23 05:45:25', '2019-11-23 05:45:25', 'a8561213-f04d-4f17-9def-8600c0fe0a16', 'newn!', 'new'),
(170, 334, 1, '2019-11-23 05:45:25', '2019-11-23 05:45:25', 'f9d7e805-948a-4299-8c0f-08bebbb1bbd6', 'new', 'newn'),
(171, 335, 1, '2019-11-23 05:45:25', '2019-11-23 05:45:25', 'd5997167-fd08-4a10-a441-55a6ec01d55d', 't', 't'),
(172, 336, 1, '2019-11-23 05:45:25', '2019-11-23 05:45:25', '84a91dcf-1bd5-41e6-83da-db8320b6b058', 't', 't'),
(173, 337, 1, '2019-11-23 05:45:25', '2019-11-23 05:45:25', '22600a0b-710b-46df-946a-446e21e0cbfd', 'w', 'w'),
(174, 338, 1, '2019-11-23 05:45:25', '2019-11-23 05:45:25', '889900c6-7e1a-4351-b2d8-25ce4058b609', 'wef', 'wef'),
(175, 339, 1, '2019-11-23 05:51:27', '2019-11-23 05:51:27', '9df56995-7b34-41ec-a99d-841ef279227f', 'w', 'wwwww'),
(176, 341, 1, '2019-11-23 05:51:27', '2019-11-23 05:51:27', '2b2ec197-a7c5-4553-ac62-f36e6dbfa9e8', 'wow new cool title newer!!', 'descriptiondescriptiondescriptionsww'),
(177, 342, 1, '2019-11-23 05:51:27', '2019-11-23 05:51:27', '6f8ebdab-56f0-4da7-9b7c-1c5cff11a051', 'wow new cool title', 'dang that description'),
(178, 343, 1, '2019-11-23 05:51:27', '2019-11-23 05:51:27', 'b81b266c-02b9-45bb-91c4-aeae0a2b8be0', 'Hello!', 'test'),
(179, 344, 1, '2019-11-23 05:51:27', '2019-11-23 05:51:27', 'ad03cf22-5058-4f02-bd78-1cf8fe5f2085', 'testy', 'testinggggggggg'),
(180, 345, 1, '2019-11-23 05:51:27', '2019-11-23 05:51:27', '09f7aa3b-a595-48fa-b867-820db135f27c', 'newwwwwwww', 'wwwww'),
(181, 346, 1, '2019-11-23 05:51:27', '2019-11-23 05:51:27', '485056f8-9266-4e8c-a9a6-e3f94084c322', 'enwewe', 'ewnenwenw'),
(182, 347, 1, '2019-11-23 05:51:27', '2019-11-23 05:51:27', '5ea5637a-7fa4-417f-9ac4-136b9d0c492b', NULL, NULL),
(183, 348, 1, '2019-11-23 05:51:27', '2019-11-23 05:51:27', 'd35264d2-3210-4fbb-85b4-c41d25f185ab', 'heyoooo', 'heyoooo'),
(184, 349, 1, '2019-11-23 05:51:27', '2019-11-23 05:51:27', '8df046c6-86b0-4aa4-8d5e-b87e6f578d24', 'test1 save again chane', 'test1 save again test'),
(185, 350, 1, '2019-11-23 05:51:27', '2019-11-23 05:51:27', '9ae99bd4-34e3-46d6-8776-b57008242e3d', 'new onw', 'new oned'),
(186, 351, 1, '2019-11-23 05:51:27', '2019-11-23 05:51:27', '6b434f29-f138-483e-81c0-9fe2a90bc55b', 'newn!', 'new'),
(187, 352, 1, '2019-11-23 05:51:27', '2019-11-23 05:51:27', 'b8185513-c589-4c69-94f9-fb5138150267', 'new', 'newn'),
(188, 353, 1, '2019-11-23 05:51:27', '2019-11-23 05:51:27', '3010510d-3d92-4ce9-a367-d6a88b1d5ba5', 't', 't'),
(189, 354, 1, '2019-11-23 05:51:27', '2019-11-23 05:51:27', 'dd0bb0ba-2b1d-40d4-80ae-6347349b3b5c', 't', 't'),
(190, 355, 1, '2019-11-23 05:51:27', '2019-11-23 05:51:27', '81f1d622-6277-4ad8-b0d6-30983c0e2983', 'w', 'w'),
(191, 356, 1, '2019-11-23 05:51:27', '2019-11-23 05:51:27', '7c71560f-d468-4019-a954-fa90e8ba668f', 'wef', 'wef'),
(192, 357, 1, '2019-11-23 05:51:27', '2019-11-23 05:51:27', 'e95c257f-e236-4b80-9b01-6ff7c7e05de8', 'w', 'wwwww'),
(193, 363, 1, '2019-11-23 05:55:49', '2019-11-23 05:55:49', '154665fe-83df-4515-ab01-fb40d222c08d', 'wow new cool title newer!!', 'descriptiondescriptiondescriptionsww'),
(194, 378, 1, '2019-11-23 06:01:37', '2019-11-23 06:13:03', 'b39ef0b0-1fc9-4980-b578-0d28e3047ac4', 'ddd', 'ddd'),
(195, 380, 1, '2019-11-23 06:01:37', '2019-11-23 06:01:37', '3585054d-afe4-4954-8777-5a546c85e6e4', 'wow new cool title newer!!', 'descriptiondescriptiondescriptionsww'),
(196, 381, 1, '2019-11-23 06:01:37', '2019-11-23 06:01:37', '5ef1928e-91ad-441b-a347-7a42e5e47d65', 'ddd', 'ddd'),
(197, 387, 1, '2019-11-23 06:03:31', '2019-11-23 06:13:03', '8e661de3-63ad-4a65-b2ef-b2624994c1bd', 'news', 'news'),
(198, 389, 1, '2019-11-23 06:03:31', '2019-11-23 06:03:31', '2c19e851-b2ff-4727-a45f-8e516d63e745', 'wow new cool title newer!!', 'descriptiondescriptiondescriptionsww'),
(199, 390, 1, '2019-11-23 06:03:31', '2019-11-23 06:03:31', '57e9cbc5-b610-425c-9dc0-674210c33ef2', 'ddd', 'ddd'),
(200, 391, 1, '2019-11-23 06:03:31', '2019-11-23 06:03:31', '280971b0-0a14-429c-9855-ed506dc2751b', 'news', 'news'),
(201, 392, 1, '2019-11-23 06:04:16', '2019-11-23 06:13:03', '2fa87080-780b-4280-8b95-6d8286996271', 'erv', 'ver'),
(202, 394, 1, '2019-11-23 06:04:16', '2019-11-23 06:04:16', 'f54b8bfb-ac50-49f6-83f4-dfbc49e3d4db', 'wow new cool title newer!!', 'descriptiondescriptiondescriptionsww'),
(203, 395, 1, '2019-11-23 06:04:16', '2019-11-23 06:04:16', '7361e671-a990-45d1-bd0f-4106f25cffce', 'ddd', 'ddd'),
(204, 396, 1, '2019-11-23 06:04:16', '2019-11-23 06:04:16', 'cce9f973-0394-43e5-a015-7cfeb26ba1fe', 'news', 'news'),
(205, 397, 1, '2019-11-23 06:04:16', '2019-11-23 06:04:16', '5b5112ca-ff76-4d80-a489-b0c59b1dea4b', 'erv', 'ver'),
(206, 398, 1, '2019-11-23 06:04:40', '2019-11-23 06:13:03', '56f5ac7d-7216-4a76-bf32-2d9935d23205', 'wef', 'dw'),
(207, 400, 1, '2019-11-23 06:04:40', '2019-11-23 06:04:40', 'ceefdc42-721c-4356-9af9-4b01ba4d99e4', 'wow new cool title newer!!', 'descriptiondescriptiondescriptionsww'),
(208, 401, 1, '2019-11-23 06:04:40', '2019-11-23 06:04:40', '7b94d9d8-cac8-47f7-a1fa-655bab64a533', 'ddd', 'ddd'),
(209, 402, 1, '2019-11-23 06:04:40', '2019-11-23 06:04:40', '6ae7b7c8-d93a-4c9f-b422-97804a860207', 'news', 'news'),
(210, 403, 1, '2019-11-23 06:04:40', '2019-11-23 06:04:40', '3010d715-0039-4edd-ba6c-69f6f6cc6465', 'erv', 'ver'),
(211, 404, 1, '2019-11-23 06:04:40', '2019-11-23 06:04:40', '4e1eaf2c-0c19-44fd-8b87-c2586ec00216', 'wef', 'dw'),
(212, 410, 1, '2019-11-23 06:13:03', '2019-11-23 06:13:03', 'f1872b54-b206-446b-8db4-3918d63e6fbb', 'T', 'T'),
(213, 412, 1, '2019-11-23 06:13:03', '2019-11-23 06:13:03', '69a92fcf-471b-4a10-9624-221e67e2badb', 'wow new cool title newer!!', 'descriptiondescriptiondescriptionsww'),
(214, 413, 1, '2019-11-23 06:13:03', '2019-11-23 06:13:03', '99d5d8fb-ef53-4fbf-a565-2729b2df87f6', 'ddd', 'ddd'),
(215, 414, 1, '2019-11-23 06:13:03', '2019-11-23 06:13:03', '7df13444-9279-4c04-8547-be4c1b7373d0', 'news', 'news'),
(216, 415, 1, '2019-11-23 06:13:03', '2019-11-23 06:13:03', '80ba24ec-0c63-47af-9bcd-d1df4c1b335a', 'erv', 'ver'),
(217, 416, 1, '2019-11-23 06:13:03', '2019-11-23 06:13:03', '2b77c0db-d70d-4303-8e35-3f21073e539b', 'wef', 'dw'),
(218, 417, 1, '2019-11-23 06:13:03', '2019-11-23 06:13:03', '5641afad-3140-486b-9ace-4a0a0021af6f', 'T', 'T');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(11) NOT NULL,
  `pluginId` int(11) DEFAULT NULL,
  `type` enum('app','plugin','content') NOT NULL DEFAULT 'app',
  `name` varchar(255) NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `pluginId`, `type`, `name`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, NULL, 'app', 'Install', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '0c5c26e2-ced6-4f7b-9a46-a160d41059e3'),
(2, NULL, 'app', 'm150403_183908_migrations_table_changes', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '8703d4d0-3310-4016-9b15-bf2b68f3b276'),
(3, NULL, 'app', 'm150403_184247_plugins_table_changes', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', 'eea16543-0872-4264-9a88-25a564d7986c'),
(4, NULL, 'app', 'm150403_184533_field_version', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2d8f99af-6a8d-4420-8889-0e3ccd1ee464'),
(5, NULL, 'app', 'm150403_184729_type_columns', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', 'b1795d89-4d7b-4aa9-8258-cd0f8b85f7fd'),
(6, NULL, 'app', 'm150403_185142_volumes', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '54b7c94c-d26a-41b6-b292-514e3ed2b56a'),
(7, NULL, 'app', 'm150428_231346_userpreferences', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', 'fab57dd8-c7ea-482b-a9d1-eea5f1a0f93e'),
(8, NULL, 'app', 'm150519_150900_fieldversion_conversion', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '6b3919e5-f211-4961-a9f1-4b6c97405126'),
(9, NULL, 'app', 'm150617_213829_update_email_settings', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '954ce719-7b41-40a9-bb8e-9639af62d4c3'),
(10, NULL, 'app', 'm150721_124739_templatecachequeries', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '4a53f185-a78c-46e3-8903-29c63cce666c'),
(11, NULL, 'app', 'm150724_140822_adjust_quality_settings', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '61198d0a-68cd-44d8-8974-ccc25b658786'),
(12, NULL, 'app', 'm150815_133521_last_login_attempt_ip', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '403555c6-0d60-44b9-9cd9-559a347629b7'),
(13, NULL, 'app', 'm151002_095935_volume_cache_settings', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '94e8509e-cbd5-46eb-921e-e6c596e17cbf'),
(14, NULL, 'app', 'm151005_142750_volume_s3_storage_settings', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', 'b99f9b0e-cd0a-4537-b744-5978596c4380'),
(15, NULL, 'app', 'm151016_133600_delete_asset_thumbnails', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '89fd69f7-15b6-451d-8656-f6f3af59004c'),
(16, NULL, 'app', 'm151209_000000_move_logo', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '602dedfc-ab2d-43b5-b477-a7d0a7f54d2b'),
(17, NULL, 'app', 'm151211_000000_rename_fileId_to_assetId', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '757f46ca-3a72-41dc-80c1-2ffbda507d96'),
(18, NULL, 'app', 'm151215_000000_rename_asset_permissions', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '5be2051f-b646-462e-a6af-a1005ba34638'),
(19, NULL, 'app', 'm160707_000001_rename_richtext_assetsource_setting', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '4cf51a21-c3ef-4df0-9e7b-c235903fa867'),
(20, NULL, 'app', 'm160708_185142_volume_hasUrls_setting', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '79681d21-22a7-4a39-b032-f33909ca7f35'),
(21, NULL, 'app', 'm160714_000000_increase_max_asset_filesize', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', 'f101243b-4561-4e32-ac1b-fe4f74830c7e'),
(22, NULL, 'app', 'm160727_194637_column_cleanup', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', 'fc49f639-d5c4-420d-90cd-9765b1211752'),
(23, NULL, 'app', 'm160804_110002_userphotos_to_assets', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '4903eed0-53ed-4b6a-a434-cf7d18b5735f'),
(24, NULL, 'app', 'm160807_144858_sites', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '357d5a0e-bff4-46f0-9465-08f8032108a3'),
(25, NULL, 'app', 'm160829_000000_pending_user_content_cleanup', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '8fe888a5-7968-4e75-9ba7-6fb13232e938'),
(26, NULL, 'app', 'm160830_000000_asset_index_uri_increase', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', 'c27f682f-17b9-44ab-b19c-739b2e76d12c'),
(27, NULL, 'app', 'm160912_230520_require_entry_type_id', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', 'ee8676f1-9108-4e7e-81bf-3093fbf1ec67'),
(28, NULL, 'app', 'm160913_134730_require_matrix_block_type_id', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '1cfc9a9b-a74e-41d6-a54d-26e61dcbbfb9'),
(29, NULL, 'app', 'm160920_174553_matrixblocks_owner_site_id_nullable', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '55a72546-3b0c-41a6-9995-07f2369e24e1'),
(30, NULL, 'app', 'm160920_231045_usergroup_handle_title_unique', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '7ead20fa-bbab-4bdd-bc4b-10e9d0b71f3e'),
(31, NULL, 'app', 'm160925_113941_route_uri_parts', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '1d05e58c-5014-452a-8e89-4886dcba26ca'),
(32, NULL, 'app', 'm161006_205918_schemaVersion_not_null', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', 'b8514886-015c-4948-b301-e1366812173f'),
(33, NULL, 'app', 'm161007_130653_update_email_settings', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '85d9cb61-4bfb-4e7e-b404-1f99d16dd755'),
(34, NULL, 'app', 'm161013_175052_newParentId', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '7e4f0cba-06f9-42f6-a28d-ce68fbef5e2d'),
(35, NULL, 'app', 'm161021_102916_fix_recent_entries_widgets', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '7328f347-d140-419b-a104-b35b1c7bcce2'),
(36, NULL, 'app', 'm161021_182140_rename_get_help_widget', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '6417a213-d31f-4b3e-aed8-54df1975f2aa'),
(37, NULL, 'app', 'm161025_000000_fix_char_columns', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '4811713d-773b-42a0-97f9-fb68975c8640'),
(38, NULL, 'app', 'm161029_124145_email_message_languages', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '8680e03b-21ec-4a26-bb01-eda66da5e33e'),
(39, NULL, 'app', 'm161108_000000_new_version_format', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', 'dc29fa92-238c-471e-8c6d-d2c13ef9c985'),
(40, NULL, 'app', 'm161109_000000_index_shuffle', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '26c79b80-6020-4d84-9cd7-96354abb040d'),
(41, NULL, 'app', 'm161122_185500_no_craft_app', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '37359d20-1b86-422a-9df3-44667c1304d0'),
(42, NULL, 'app', 'm161125_150752_clear_urlmanager_cache', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', 'e8f5103b-0f4b-4087-8046-249da31a2d38'),
(43, NULL, 'app', 'm161220_000000_volumes_hasurl_notnull', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', 'd0fc669d-538b-4bab-b1c5-76eb14a43e57'),
(44, NULL, 'app', 'm170114_161144_udates_permission', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', 'afd41b6a-0ca6-4c78-ab8a-fa78f9418716'),
(45, NULL, 'app', 'm170120_000000_schema_cleanup', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '73d2267f-be66-4849-928d-4fb602d1dfad'),
(46, NULL, 'app', 'm170126_000000_assets_focal_point', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '04be9819-b4ee-4509-a1ef-489255801c92'),
(47, NULL, 'app', 'm170206_142126_system_name', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', 'e777a538-4085-4426-8fca-ae30db3d25e1'),
(48, NULL, 'app', 'm170217_044740_category_branch_limits', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '3bffe5af-21a7-4075-8c30-173f2a0e40d4'),
(49, NULL, 'app', 'm170217_120224_asset_indexing_columns', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '868a2990-9812-4f0d-abe6-81c791acb13a'),
(50, NULL, 'app', 'm170223_224012_plain_text_settings', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '114c86a3-c26b-455d-9c52-8d4a04a97de8'),
(51, NULL, 'app', 'm170227_120814_focal_point_percentage', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', 'c6e36146-9538-43a0-8774-f471ad93e55d'),
(52, NULL, 'app', 'm170228_171113_system_messages', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '52f8967f-fcbd-46b2-a83d-e731507a82d9'),
(53, NULL, 'app', 'm170303_140500_asset_field_source_settings', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '4621e210-8f3c-41e3-8e8b-e4808673456f'),
(54, NULL, 'app', 'm170306_150500_asset_temporary_uploads', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', 'c79e383d-097c-4f16-a5da-e069631184b7'),
(55, NULL, 'app', 'm170414_162429_rich_text_config_setting', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', 'ff0e1c32-5f75-4023-a5df-aab566ef8b5d'),
(56, NULL, 'app', 'm170523_190652_element_field_layout_ids', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', 'ed36d605-b1f7-4e16-a3bf-124cfdc33949'),
(57, NULL, 'app', 'm170612_000000_route_index_shuffle', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', 'a237e07d-9159-433d-afbe-257b51629a5a'),
(58, NULL, 'app', 'm170621_195237_format_plugin_handles', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '566ed82b-e3f9-44eb-a318-b5d5d8bf3654'),
(59, NULL, 'app', 'm170630_161028_deprecation_changes', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', 'db2e623e-b866-483f-a8e5-41bc21255108'),
(60, NULL, 'app', 'm170703_181539_plugins_table_tweaks', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', 'f8db9ab5-0269-4e0b-9ac7-7c25ead5c990'),
(61, NULL, 'app', 'm170704_134916_sites_tables', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '608b361b-c305-4e05-8641-019c692e1c81'),
(62, NULL, 'app', 'm170706_183216_rename_sequences', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '06a0f38e-5976-4cfd-bba3-39d485ff6d19'),
(63, NULL, 'app', 'm170707_094758_delete_compiled_traits', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '8fb2e991-5077-4249-83cd-64d2847f9fa5'),
(64, NULL, 'app', 'm170731_190138_drop_asset_packagist', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', 'e71c0c3f-7b6e-40bc-b531-6f2152c3f4b7'),
(65, NULL, 'app', 'm170810_201318_create_queue_table', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', 'f5802109-8445-4a3c-ac17-50d19ac9d165'),
(66, NULL, 'app', 'm170816_133741_delete_compiled_behaviors', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '03f53913-f9a0-419a-b4ed-d3daab897c67'),
(67, NULL, 'app', 'm170821_180624_deprecation_line_nullable', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '197eac89-3a24-4dfa-b5d3-2c7f6920a226'),
(68, NULL, 'app', 'm170903_192801_longblob_for_queue_jobs', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '5038e4e4-03de-4c44-bbcf-f019b6914b08'),
(69, NULL, 'app', 'm170914_204621_asset_cache_shuffle', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '23066f08-faa3-4d20-9634-5481542de80a'),
(70, NULL, 'app', 'm171011_214115_site_groups', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', 'c508183b-e8ee-44e0-a704-ae8d27768a79'),
(71, NULL, 'app', 'm171012_151440_primary_site', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '6ce1a41c-5c8d-463d-97b1-f371090e6581'),
(72, NULL, 'app', 'm171013_142500_transform_interlace', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '91b8bc28-2d27-423b-b569-82396cbb989c'),
(73, NULL, 'app', 'm171016_092553_drop_position_select', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '8a635c4c-491b-4c59-bb10-1e8d508ea04c'),
(74, NULL, 'app', 'm171016_221244_less_strict_translation_method', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '98821059-ed28-431f-be59-fa457524483e'),
(75, NULL, 'app', 'm171107_000000_assign_group_permissions', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '882208d2-a623-48f8-bcc4-c7980575474a'),
(76, NULL, 'app', 'm171117_000001_templatecache_index_tune', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', 'd7eda791-707d-4fe3-b03b-77abfc596db5'),
(77, NULL, 'app', 'm171126_105927_disabled_plugins', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', 'cb57b0b0-b375-4c1f-9adf-256b91ef898f'),
(78, NULL, 'app', 'm171130_214407_craftidtokens_table', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '94250655-ffda-47da-8d2f-cbd40bb99af0'),
(79, NULL, 'app', 'm171202_004225_update_email_settings', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '41ebb9c8-58ae-42ee-ad70-1f9e2f7cb9f5'),
(80, NULL, 'app', 'm171204_000001_templatecache_index_tune_deux', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '9b9d40d6-12fd-4aa4-98fb-451e2dd3bf51'),
(81, NULL, 'app', 'm171205_130908_remove_craftidtokens_refreshtoken_column', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', 'e7aca334-1f31-4018-afef-02a2771abe9f'),
(82, NULL, 'app', 'm171218_143135_longtext_query_column', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '7442b38c-e35d-4b14-955d-8a37b2e2b594'),
(83, NULL, 'app', 'm171231_055546_environment_variables_to_aliases', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', 'c74132bf-44a6-4bb9-89a9-84e0318da194'),
(84, NULL, 'app', 'm180113_153740_drop_users_archived_column', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '9b049ec7-72c9-4ecb-8563-ac8e13dcd45d'),
(85, NULL, 'app', 'm180122_213433_propagate_entries_setting', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', 'b650b2a6-2a29-4ceb-8d9d-6d83077c1922'),
(86, NULL, 'app', 'm180124_230459_fix_propagate_entries_values', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', 'f4dbeafb-7654-4517-aacb-2038c5a0d0a2'),
(87, NULL, 'app', 'm180128_235202_set_tag_slugs', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '924e07fc-b9e0-4ed5-a976-c994ed5b404e'),
(88, NULL, 'app', 'm180202_185551_fix_focal_points', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '6c3c835f-3bc0-47c2-9a02-39ab3e5d9098'),
(89, NULL, 'app', 'm180217_172123_tiny_ints', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '717be5ae-159f-4d97-86a5-dc9f5c1162d6'),
(90, NULL, 'app', 'm180321_233505_small_ints', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '03c18bb7-b311-4c8a-bef4-2267ab81009f'),
(91, NULL, 'app', 'm180328_115523_new_license_key_statuses', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '12310ded-dc5e-465c-96a8-134b4be30673'),
(92, NULL, 'app', 'm180404_182320_edition_changes', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '565de212-2c2c-4fc8-9e0c-b798cf38c744'),
(93, NULL, 'app', 'm180411_102218_fix_db_routes', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '03441ee4-6a41-465c-aea7-d5587dc28619'),
(94, NULL, 'app', 'm180416_205628_resourcepaths_table', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '4f89c2b9-92e6-4dd9-abba-e5ef33b1334e'),
(95, NULL, 'app', 'm180418_205713_widget_cleanup', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '8d29dc57-12ae-42a6-babb-dd7a7d1137a4'),
(96, NULL, 'app', 'm180824_193422_case_sensitivity_fixes', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '43e3471d-0318-4951-8704-fc98615b440b'),
(97, NULL, 'app', 'm180901_151639_fix_matrixcontent_tables', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', 'cd74b9e8-5088-40b5-b5f4-010030d95f23'),
(98, NULL, 'app', 'm181112_203955_sequences_table', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-17 03:11:02', '58caf7c0-9533-45ce-ae0c-294c00a084bd'),
(99, NULL, 'app', 'm170630_161027_deprecation_line_nullable', '2019-11-20 10:20:43', '2019-11-20 10:20:43', '2019-11-20 10:20:43', '01c75008-3b64-4798-abee-49b0d3dacfad'),
(100, NULL, 'app', 'm180425_203349_searchable_fields', '2019-11-20 10:20:43', '2019-11-20 10:20:43', '2019-11-20 10:20:43', 'c2c19335-9f3d-44fe-a021-0133b5399a1e'),
(101, NULL, 'app', 'm180516_153000_uids_in_field_settings', '2019-11-20 10:20:43', '2019-11-20 10:20:43', '2019-11-20 10:20:43', '6e307d66-328d-42e4-b723-0ca47e9ea17e'),
(102, NULL, 'app', 'm180517_173000_user_photo_volume_to_uid', '2019-11-20 10:20:43', '2019-11-20 10:20:43', '2019-11-20 10:20:43', '71941bc7-dedd-48f9-9c98-0e61b7b231b8'),
(103, NULL, 'app', 'm180518_173000_permissions_to_uid', '2019-11-20 10:20:43', '2019-11-20 10:20:43', '2019-11-20 10:20:43', '2c4357d8-0e02-40e3-ac64-654ae9037ccd'),
(104, NULL, 'app', 'm180520_173000_matrix_context_to_uids', '2019-11-20 10:20:43', '2019-11-20 10:20:43', '2019-11-20 10:20:43', '73a35bb6-c006-42b3-bb96-5ba49f3fe59b'),
(105, NULL, 'app', 'm180521_173000_initial_yml_and_snapshot', '2019-11-20 10:20:43', '2019-11-20 10:20:43', '2019-11-20 10:20:43', 'de7eb65e-3386-464b-990e-f9a7409b5aeb'),
(106, NULL, 'app', 'm180731_162030_soft_delete_sites', '2019-11-20 10:20:43', '2019-11-20 10:20:43', '2019-11-20 10:20:43', '416a5df2-10f2-48ef-a621-85ccccde114d'),
(107, NULL, 'app', 'm180810_214427_soft_delete_field_layouts', '2019-11-20 10:20:43', '2019-11-20 10:20:43', '2019-11-20 10:20:43', '21797014-4883-48a3-a740-14eb12a0c084'),
(108, NULL, 'app', 'm180810_214439_soft_delete_elements', '2019-11-20 10:20:43', '2019-11-20 10:20:43', '2019-11-20 10:20:43', '59e91480-529c-4706-a6ef-394f68e17bbd'),
(109, NULL, 'app', 'm180904_112109_permission_changes', '2019-11-20 10:20:43', '2019-11-20 10:20:43', '2019-11-20 10:20:43', '5f7f9ace-287b-4528-ae80-3f4ed0252410'),
(110, NULL, 'app', 'm180910_142030_soft_delete_sitegroups', '2019-11-20 10:20:43', '2019-11-20 10:20:43', '2019-11-20 10:20:43', '657a5658-8527-4c24-be0a-9a54ed33f57d'),
(111, NULL, 'app', 'm181011_160000_soft_delete_asset_support', '2019-11-20 10:20:43', '2019-11-20 10:20:43', '2019-11-20 10:20:43', 'c01e3c5c-39bf-41bd-b74c-154a65222165'),
(112, NULL, 'app', 'm181016_183648_set_default_user_settings', '2019-11-20 10:20:43', '2019-11-20 10:20:43', '2019-11-20 10:20:43', '6a082900-9b69-4100-8dce-d3fb0112393e'),
(113, NULL, 'app', 'm181017_225222_system_config_settings', '2019-11-20 10:20:43', '2019-11-20 10:20:43', '2019-11-20 10:20:43', 'ebb6c091-54d2-4772-bb59-d0bca8d44266'),
(114, NULL, 'app', 'm181018_222343_drop_userpermissions_from_config', '2019-11-20 10:20:43', '2019-11-20 10:20:43', '2019-11-20 10:20:43', '019d4719-a4df-4f41-b1d3-2b670d36caec'),
(115, NULL, 'app', 'm181029_130000_add_transforms_routes_to_config', '2019-11-20 10:20:43', '2019-11-20 10:20:43', '2019-11-20 10:20:43', 'e8508d03-84ec-48d9-ab95-717381d7ce0c'),
(116, NULL, 'app', 'm181121_001712_cleanup_field_configs', '2019-11-20 10:20:43', '2019-11-20 10:20:43', '2019-11-20 10:20:43', '204fa404-53ca-4af5-8fbb-01f5c1c53609'),
(117, NULL, 'app', 'm181128_193942_fix_project_config', '2019-11-20 10:20:43', '2019-11-20 10:20:43', '2019-11-20 10:20:43', '2371bffb-2a4e-4f81-a632-e29ecd9f1550'),
(118, NULL, 'app', 'm181130_143040_fix_schema_version', '2019-11-20 10:20:43', '2019-11-20 10:20:43', '2019-11-20 10:20:43', '48913550-330d-4f5e-84a0-6d261d3456ba'),
(119, NULL, 'app', 'm181211_143040_fix_entry_type_uids', '2019-11-20 10:20:43', '2019-11-20 10:20:43', '2019-11-20 10:20:43', '573bf339-1844-4974-b9cd-37c1ca3caf85'),
(120, NULL, 'app', 'm181213_102500_config_map_aliases', '2019-11-20 10:20:43', '2019-11-20 10:20:43', '2019-11-20 10:20:43', '45cc1e16-4dab-40b7-a4ac-f1efa732601f'),
(121, NULL, 'app', 'm181217_153000_fix_structure_uids', '2019-11-20 10:20:43', '2019-11-20 10:20:43', '2019-11-20 10:20:43', '1958baf6-f590-4c44-a546-e1a83927c56a'),
(122, NULL, 'app', 'm190104_152725_store_licensed_plugin_editions', '2019-11-20 10:20:43', '2019-11-20 10:20:43', '2019-11-20 10:20:43', '111b2358-ca52-4f3f-b793-b4561dfa50ea'),
(123, NULL, 'app', 'm190108_110000_cleanup_project_config', '2019-11-20 10:20:43', '2019-11-20 10:20:43', '2019-11-20 10:20:43', '510c0664-5905-4965-b53a-7f93778330f5'),
(124, NULL, 'app', 'm190108_113000_asset_field_setting_change', '2019-11-20 10:20:43', '2019-11-20 10:20:43', '2019-11-20 10:20:43', 'fab8a03b-d850-4be8-a1bb-345b45f3b3cd'),
(125, NULL, 'app', 'm190109_172845_fix_colspan', '2019-11-20 10:20:44', '2019-11-20 10:20:44', '2019-11-20 10:20:44', 'b4146bdc-90bb-4e3f-a74c-e2d076556d9d'),
(126, NULL, 'app', 'm190110_150000_prune_nonexisting_sites', '2019-11-20 10:20:44', '2019-11-20 10:20:44', '2019-11-20 10:20:44', '3365ecae-7169-417c-8c2d-afceab2c73ac'),
(127, NULL, 'app', 'm190110_214819_soft_delete_volumes', '2019-11-20 10:20:44', '2019-11-20 10:20:44', '2019-11-20 10:20:44', '86d2d98b-bad2-4686-b808-6c31869091d0'),
(128, NULL, 'app', 'm190112_124737_fix_user_settings', '2019-11-20 10:20:44', '2019-11-20 10:20:44', '2019-11-20 10:20:44', 'de357dc7-0b36-4b1b-b181-dde6e48b1f4a'),
(129, NULL, 'app', 'm190112_131225_fix_field_layouts', '2019-11-20 10:20:44', '2019-11-20 10:20:44', '2019-11-20 10:20:44', '23231b12-2f66-48ce-b622-3726a2079c0c'),
(130, NULL, 'app', 'm190112_201010_more_soft_deletes', '2019-11-20 10:20:44', '2019-11-20 10:20:44', '2019-11-20 10:20:44', 'cc81d086-5d59-4ade-8701-cd3b5a43c8ce'),
(131, NULL, 'app', 'm190114_143000_more_asset_field_setting_changes', '2019-11-20 10:20:44', '2019-11-20 10:20:44', '2019-11-20 10:20:44', '055c2a02-58b4-4fb8-af93-729f64244f96'),
(132, NULL, 'app', 'm190121_120000_rich_text_config_setting', '2019-11-20 10:20:44', '2019-11-20 10:20:44', '2019-11-20 10:20:44', '663266b0-f57a-436d-9d33-94a2c4410493'),
(133, NULL, 'app', 'm190125_191628_fix_email_transport_password', '2019-11-20 10:20:44', '2019-11-20 10:20:44', '2019-11-20 10:20:44', 'bbb95fdd-73eb-4d52-9903-1d3c3ce3eed3'),
(134, NULL, 'app', 'm190128_181422_cleanup_volume_folders', '2019-11-20 10:20:44', '2019-11-20 10:20:44', '2019-11-20 10:20:44', 'a6b3903d-9df2-49aa-ba05-4b0ed73d2256'),
(135, NULL, 'app', 'm190205_140000_fix_asset_soft_delete_index', '2019-11-20 10:20:44', '2019-11-20 10:20:44', '2019-11-20 10:20:44', '267ca007-0328-4848-ba2a-d95f475bc668'),
(136, NULL, 'app', 'm190208_140000_reset_project_config_mapping', '2019-11-20 10:20:44', '2019-11-20 10:20:44', '2019-11-20 10:20:44', 'acfb9a34-e49c-4546-b653-bfcd3c3407ce'),
(137, NULL, 'app', 'm190218_143000_element_index_settings_uid', '2019-11-20 10:20:44', '2019-11-20 10:20:44', '2019-11-20 10:20:44', 'fa6b43f9-a526-4f03-8b4c-15f2376e0d80'),
(138, NULL, 'app', 'm190312_152740_element_revisions', '2019-11-20 10:20:45', '2019-11-20 10:20:45', '2019-11-20 10:20:45', '8db30ed7-db71-472f-a1fc-27691ee14f1b'),
(139, NULL, 'app', 'm190327_235137_propagation_method', '2019-11-20 10:20:45', '2019-11-20 10:20:45', '2019-11-20 10:20:45', '043aeabb-f842-4f50-a134-10d14b23487e'),
(140, NULL, 'app', 'm190401_223843_drop_old_indexes', '2019-11-20 10:20:45', '2019-11-20 10:20:45', '2019-11-20 10:20:45', '26b7e5f9-4cb3-4f30-a528-f1f1e02af2e5'),
(141, NULL, 'app', 'm190416_014525_drop_unique_global_indexes', '2019-11-20 10:20:45', '2019-11-20 10:20:45', '2019-11-20 10:20:45', '34966d0d-4d8f-4bab-9d5c-289440ef9399'),
(142, NULL, 'app', 'm190417_085010_add_image_editor_permissions', '2019-11-20 10:20:45', '2019-11-20 10:20:45', '2019-11-20 10:20:45', 'a3c7ccdc-d697-4c27-bf15-a7bfff6c47f5'),
(143, NULL, 'app', 'm190502_122019_store_default_user_group_uid', '2019-11-20 10:20:45', '2019-11-20 10:20:45', '2019-11-20 10:20:45', '85b0f334-5d4a-4ef3-8d96-5be3b8e1d087'),
(144, NULL, 'app', 'm190504_150349_preview_targets', '2019-11-20 10:20:45', '2019-11-20 10:20:45', '2019-11-20 10:20:45', '13cdd3ce-9daf-49e6-8a4d-3f1561f95525'),
(145, NULL, 'app', 'm190516_184711_job_progress_label', '2019-11-20 10:20:45', '2019-11-20 10:20:45', '2019-11-20 10:20:45', 'a223f880-5400-4b89-885c-c4bdda4c6689'),
(146, NULL, 'app', 'm190523_190303_optional_revision_creators', '2019-11-20 10:20:45', '2019-11-20 10:20:45', '2019-11-20 10:20:45', '624f225b-59ec-4c6b-8138-f29a806f55db'),
(147, NULL, 'app', 'm190529_204501_fix_duplicate_uids', '2019-11-20 10:20:45', '2019-11-20 10:20:45', '2019-11-20 10:20:45', '47388b71-7d93-4d02-92f4-2221dda4e6b4'),
(148, NULL, 'app', 'm190605_223807_unsaved_drafts', '2019-11-20 10:20:45', '2019-11-20 10:20:45', '2019-11-20 10:20:45', '1cd15bcc-9109-41d3-91aa-f53b0a4435c1'),
(149, NULL, 'app', 'm190607_230042_entry_revision_error_tables', '2019-11-20 10:20:45', '2019-11-20 10:20:45', '2019-11-20 10:20:45', '54348732-165e-431c-acfd-71c4c4b892ce'),
(150, NULL, 'app', 'm190608_033429_drop_elements_uid_idx', '2019-11-20 10:20:45', '2019-11-20 10:20:45', '2019-11-20 10:20:45', 'e8629e56-338c-4f11-81e6-ca4cfab0f4aa'),
(151, NULL, 'app', 'm190617_164400_add_gqlschemas_table', '2019-11-20 10:20:45', '2019-11-20 10:20:45', '2019-11-20 10:20:45', 'c477f0d7-7b9d-4452-899e-22c7122db639'),
(152, NULL, 'app', 'm190624_234204_matrix_propagation_method', '2019-11-20 10:20:45', '2019-11-20 10:20:45', '2019-11-20 10:20:45', 'e09c22e2-26a3-4725-ac1c-cfc4c273f421'),
(153, NULL, 'app', 'm190711_153020_drop_snapshots', '2019-11-20 10:20:45', '2019-11-20 10:20:45', '2019-11-20 10:20:45', '173505fc-cc8a-4a5f-b381-9476f77abb64'),
(154, NULL, 'app', 'm190712_195914_no_draft_revisions', '2019-11-20 10:20:45', '2019-11-20 10:20:45', '2019-11-20 10:20:45', '57b91119-f72e-452c-a7fa-364c2d00d705'),
(155, NULL, 'app', 'm190723_140314_fix_preview_targets_column', '2019-11-20 10:20:45', '2019-11-20 10:20:45', '2019-11-20 10:20:45', 'c924519c-ebb1-4fb5-999a-df954af40274'),
(156, NULL, 'app', 'm190820_003519_flush_compiled_templates', '2019-11-20 10:20:45', '2019-11-20 10:20:45', '2019-11-20 10:20:45', 'e388021d-f03b-4014-aff1-41ee784f3f8c'),
(157, NULL, 'app', 'm190823_020339_optional_draft_creators', '2019-11-20 10:20:45', '2019-11-20 10:20:45', '2019-11-20 10:20:45', '15815b88-15f9-435f-978d-014144ae1f1c'),
(158, 1, 'plugin', 'Install', '2019-11-20 10:22:17', '2019-11-20 10:22:17', '2019-11-20 10:22:17', '7f291766-8286-4766-b293-ac6f21341d66'),
(159, 1, 'plugin', 'm181212_105527_request_types', '2019-11-20 10:22:17', '2019-11-20 10:22:17', '2019-11-20 10:22:17', 'e2533d73-f06e-4cc9-b526-8383bdd419b6'),
(160, 1, 'plugin', 'm190315_214904_requests_table', '2019-11-20 10:22:17', '2019-11-20 10:22:17', '2019-11-20 10:22:17', 'a767e626-2f12-419a-99f7-53ad6780f54c'),
(161, 1, 'plugin', 'm190320_182458_payload_template_col', '2019-11-20 10:22:17', '2019-11-20 10:22:17', '2019-11-20 10:22:17', '3df50964-eca9-4807-97b2-bfb3d93ff6d0'),
(162, 1, 'plugin', 'm190724_093924_event_filters', '2019-11-20 10:22:17', '2019-11-20 10:22:17', '2019-11-20 10:22:17', 'c6f84c46-9e93-46c4-9fe4-4669b4b6b816'),
(163, 1, 'plugin', 'm190724_202705_custom_headers', '2019-11-20 10:22:17', '2019-11-20 10:22:17', '2019-11-20 10:22:17', '4c62d6a3-c5d2-419b-a161-d0afa62223f1');

-- --------------------------------------------------------

--
-- Table structure for table `plugins`
--

CREATE TABLE `plugins` (
  `id` int(11) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `schemaVersion` varchar(255) NOT NULL,
  `licenseKeyStatus` enum('valid','invalid','mismatched','astray','unknown') NOT NULL DEFAULT 'unknown',
  `licensedEdition` varchar(255) DEFAULT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `plugins`
--

INSERT INTO `plugins` (`id`, `handle`, `version`, `schemaVersion`, `licenseKeyStatus`, `licensedEdition`, `installDate`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'webhooks', '2.2.0', '2.2.0', 'unknown', NULL, '2019-11-20 10:22:17', '2019-11-20 10:22:17', '2019-11-27 03:43:01', 'e6c6ada1-36ee-45b1-8d5b-d2613caf2679'),
(2, 'contact-form', '2.2.5', '1.0.0', 'unknown', NULL, '2019-11-24 05:04:04', '2019-11-24 05:04:04', '2019-11-27 03:43:01', '34d41672-127b-42f1-8e96-4f6d80126be9'),
(3, 'sendgrid', '1.2.0', '1.0.0', 'unknown', NULL, '2019-11-24 07:23:41', '2019-11-24 07:23:41', '2019-11-27 03:43:01', '372d7e39-0d58-4602-bfc5-17773a27862c');

-- --------------------------------------------------------

--
-- Table structure for table `queue`
--

CREATE TABLE `queue` (
  `id` int(11) NOT NULL,
  `job` longblob NOT NULL,
  `description` text,
  `timePushed` int(11) NOT NULL,
  `ttr` int(11) NOT NULL,
  `delay` int(11) NOT NULL DEFAULT '0',
  `priority` int(11) UNSIGNED NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int(11) DEFAULT NULL,
  `progress` smallint(6) NOT NULL DEFAULT '0',
  `progressLabel` varchar(255) DEFAULT NULL,
  `attempt` int(11) DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `relations`
--

CREATE TABLE `relations` (
  `id` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceSiteId` int(11) DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `relations`
--

INSERT INTO `relations` (`id`, `fieldId`, `sourceId`, `sourceSiteId`, `targetId`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(6, 18, 118, NULL, 5, 1, '2019-11-23 01:36:10', '2019-11-23 01:36:10', '413a3c48-a392-4ea5-aa74-862009431a36'),
(7, 18, 119, NULL, 5, 1, '2019-11-23 01:36:10', '2019-11-23 01:36:10', '724c66a0-62e6-40b2-bb01-e77fe3788917'),
(10, 18, 121, NULL, 5, 1, '2019-11-23 01:37:36', '2019-11-23 01:37:36', 'd355e21f-bc8a-42f6-9cea-e3cb3d8672d0'),
(11, 18, 122, NULL, 5, 1, '2019-11-23 01:37:36', '2019-11-23 01:37:36', 'ad2d96f2-e987-4fe9-a0ae-06fa285c47c2'),
(14, 18, 124, NULL, 5, 1, '2019-11-23 01:38:40', '2019-11-23 01:38:40', 'b70c6d62-65d6-4fd3-834c-15499f297462'),
(15, 18, 125, NULL, 5, 1, '2019-11-23 01:38:40', '2019-11-23 01:38:40', '6990b406-cdeb-4d0e-a86d-a033f0626d0f'),
(19, 18, 134, NULL, 5, 1, '2019-11-23 01:41:35', '2019-11-23 01:41:35', '12781d46-e292-418c-93bd-d93b0d0b4537'),
(22, 18, 144, NULL, 5, 1, '2019-11-23 01:48:17', '2019-11-23 01:48:17', 'd51f2dd3-9f38-416e-b011-906350e7ad4f'),
(23, 18, 145, NULL, 5, 1, '2019-11-23 01:48:17', '2019-11-23 01:48:17', 'b9fb859c-4ba3-4590-bac4-346ed275a37b'),
(26, 18, 147, NULL, 5, 1, '2019-11-23 01:49:08', '2019-11-23 01:49:08', '3aac0b1c-b6eb-4855-b3fd-a27a90650847'),
(27, 18, 148, NULL, 5, 1, '2019-11-23 01:49:08', '2019-11-23 01:49:08', 'ec0e4bea-3129-4f1a-a161-df15c6c0aa32'),
(31, 18, 160, NULL, 5, 1, '2019-11-23 02:04:27', '2019-11-23 02:04:27', 'd1a11776-3d77-48a8-aa56-0adc49e427ee'),
(34, 18, 163, NULL, 5, 1, '2019-11-23 02:09:50', '2019-11-23 02:09:50', '0cc8d941-2055-437b-8bbc-bfd6ec9aed5c'),
(35, 18, 164, NULL, 5, 1, '2019-11-23 02:09:50', '2019-11-23 02:09:50', '1d72ccdf-2eca-482c-a25a-b9264085a64c'),
(38, 18, 166, NULL, 5, 1, '2019-11-23 02:12:05', '2019-11-23 02:12:05', 'dfe7bf2f-e3a7-4386-9941-c778a0fda6f5'),
(39, 18, 167, NULL, 5, 1, '2019-11-23 02:12:05', '2019-11-23 02:12:05', 'f336c238-72c8-4fd3-a6ed-b7b19f92da5d'),
(40, 18, 133, NULL, 5, 1, '2019-11-23 05:17:18', '2019-11-23 05:17:18', '4d394650-e249-4b1b-a7f2-6dd6370bc8fa'),
(41, 18, 280, NULL, 5, 1, '2019-11-23 05:17:18', '2019-11-23 05:17:18', '07f7b25d-675c-44a4-b34f-330d9993a127'),
(42, 18, 159, NULL, 5, 1, '2019-11-23 05:57:28', '2019-11-23 05:57:28', 'de0d2573-6b7e-420e-acb2-17ce5c143879'),
(43, 18, 370, NULL, 5, 1, '2019-11-23 05:57:28', '2019-11-23 05:57:28', '440928ea-1a10-466c-a3ff-9debc45ef52f'),
(44, 18, 422, NULL, 5, 1, '2019-11-23 07:15:26', '2019-11-23 07:15:26', 'ad0170cc-1225-4692-922c-24abbdb4bdeb'),
(45, 18, 431, NULL, 5, 1, '2019-11-23 07:15:26', '2019-11-23 07:15:26', '1a2f4e80-b71c-40b5-975b-97f21d5870bf');

-- --------------------------------------------------------

--
-- Table structure for table `resourcepaths`
--

CREATE TABLE `resourcepaths` (
  `hash` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `resourcepaths`
--

INSERT INTO `resourcepaths` (`hash`, `path`) VALUES
('12207c6e', '@lib/xregexp'),
('151dcc7d', '@lib/selectize'),
('172f8868', '@lib/datepicker-i18n'),
('184c38e4', '@lib/selectize'),
('1e731d6f', '@lib/datepicker-i18n'),
('1ef9ff8', '@lib/datepicker-i18n'),
('1f7188f7', '@lib/xregexp'),
('208ed082', '@lib/timepicker'),
('22bbdffe', '@app/web/assets/editsection/dist'),
('288414c6', '@app/web/assets/plugins/dist'),
('2c1e906', '@app/web/assets/edituser/dist'),
('2ddf241b', '@lib/timepicker'),
('3243a68c', '@lib/timepicker'),
('39dfb86b', '@app/web/assets/clearcaches/dist'),
('4163e1f9', '@lib/picturefill'),
('421a030e', '@lib/fileupload'),
('42973531', '@lib/d3'),
('45cbb9e1', '@app/web/assets/matrix/dist'),
('46c7dd3b', '@lib/jquery-touch-events'),
('47b86f4c', '@app/web/assets/editentry/dist'),
('47caa0f8', '@app/web/assets/dbbackup/dist'),
('489a4d78', '@app/web/assets/matrix/dist'),
('4ae99bd5', '@app/web/assets/editentry/dist'),
('4b469609', '@lib/fileupload'),
('4b9629a2', '@lib/jquery-touch-events'),
('4c321560', '@lib/picturefill'),
('4e06bfe', '@lib/xregexp'),
('4fc6c1a8', '@lib/d3'),
('51d3c4c2', '@app/web/assets/sites/dist'),
('53ae97f7', '@lib/picturefill'),
('540aab35', '@lib/jquery-touch-events'),
('545722a1', '@lib/d3'),
('54da149e', '@lib/fileupload'),
('5507d6f6', '@app/web/assets/dbbackup/dist'),
('5706cfef', '@app/web/assets/matrix/dist'),
('5824eddb', '@app/web/assets/editentry/dist'),
('5856226f', '@app/web/assets/dbbackup/dist'),
('598be007', '@lib/fileupload'),
('5af202f0', '@lib/picturefill'),
('5d0bb7a6', '@lib/d3'),
('5d2310ef', '@craft/webhooks/assets/activity/dist'),
('5d563e32', '@lib/jquery-touch-events'),
('60798302', '@app/web/assets/fields/dist'),
('646cf689', '@lib/fabric'),
('6682bf49', '@app/web/assets/deprecationerrors/dist'),
('671ead4c', '@app/web/assets/dashboard/dist'),
('677fe0aa', '@app/web/assets/updates/dist'),
('67ea3527', '@lib/garnishjs'),
('693d0210', '@lib/fabric'),
('6a4f59d5', '@app/web/assets/dashboard/dist'),
('6bd34bd0', '@app/web/assets/deprecationerrors/dist'),
('6d28779b', '@app/web/assets/fields/dist'),
('6e2375ad', '@app/web/assets/updates/dist'),
('6eb6a020', '@lib/garnishjs'),
('6f6f589b', '@craft/webhooks/assets/edit/dist'),
('712a22b7', '@lib/garnishjs'),
('71debadc', '@app/web/assets/dashboard/dist'),
('72ace119', '@lib/fabric'),
('75b296a4', '@app/web/assets/updates/dist'),
('78822fdb', '@app/web/assets/dashboard/dist'),
('78e3623d', '@app/web/assets/updates/dist'),
('7bf0741e', '@lib/fabric'),
('7c7bd62e', '@lib/garnishjs'),
('7d0ba73', '@lib/selectize'),
('7fe50195', '@app/web/assets/fields/dist'),
('800ceb67', '@craft/webhooks/assets/manage/dist'),
('8022c7a8', '@lib/jquery-ui'),
('8171c34c', '@app/web/assets/updater/dist'),
('8427debb', '@app/web/assets/craftsupport/dist'),
('87e486e3', '@app/web/assets/updateswidget/dist'),
('882d564b', '@app/web/assets/updater/dist'),
('89762a22', '@app/web/assets/craftsupport/dist'),
('897e52af', '@lib/jquery-ui'),
('8ab5727a', '@app/web/assets/updateswidget/dist'),
('92870e18', '@app/web/assets/findreplace/dist'),
('92efb1a6', '@lib/jquery-ui'),
('9340eaf2', '@app/web/assets/generalsettings/dist'),
('96eaa8b5', '@app/web/assets/craftsupport/dist'),
('98780474', '@app/web/assets/updateswidget/dist'),
('98abddcd', '@app/web/assets/graphiql/dist'),
('9ae02045', '@app/web/assets/updater/dist'),
('9fb63db2', '@app/web/assets/craftsupport/dist'),
('9fbe453f', '@lib/jquery-ui'),
('a0b72cbc', '@app/web/assets/pluginstore/dist'),
('a413e300', '@app/web/assets/cp/dist'),
('a6c2461a', '@app/web/assets/recententries/dist'),
('a8ab3fcc', '@app/web/assets/searchindexes/dist'),
('a9421799', '@app/web/assets/cp/dist'),
('ad7c02e7', '@app/web/assets/login/dist'),
('af9ed31d', '@app/web/assets/recententries/dist'),
('b27a5ab2', '@app/web/assets/pluginstore/dist'),
('b2d3f490', '@app/web/assets/cp/dist'),
('b40f3014', '@app/web/assets/recententries/dist'),
('b95ec48d', '@app/web/assets/recententries/dist'),
('bb8f6197', '@app/web/assets/cp/dist'),
('bf2bae2b', '@app/web/assets/pluginstore/dist'),
('bfb174e9', '@app/web/assets/login/dist'),
('c06185eb', '@lib/jquery.payment'),
('c09829e7', '@bower/jquery/dist'),
('c2133b57', '@app/web/assets/tablesettings/dist'),
('c2942a29', '@app/web/assets/feed/dist'),
('c668a191', '@app/web/assets/utilities/dist'),
('c7d7c90a', '@lib/velocity'),
('cb395508', '@app/web/assets/utilities/dist'),
('cbc8bf2e', '@app/web/assets/feed/dist'),
('cbe6b61', '@lib/datepicker-i18n'),
('cd307172', '@lib/jquery.payment'),
('cdc9dd7e', '@bower/jquery/dist'),
('ce8b5c0d', '@lib/velocity'),
('cf42cfce', '@app/web/assets/tablesettings/dist'),
('d0595c27', '@app/web/assets/feed/dist'),
('d0a8b601', '@app/web/assets/utilities/dist'),
('d0de4d59', '@app/web/assets/tablesettings/dist'),
('d117de9a', '@lib/velocity'),
('d2acf3e5', '@lib/jquery.payment'),
('d5dd7d21', '@app/web/assets/userpermissions/dist'),
('d6583e77', '@bower/jquery/dist'),
('d9f42306', '@app/web/assets/utilities/dist'),
('dbcfef9', '@lib/xregexp'),
('dbf066e2', '@lib/jquery.payment'),
('dc462a03', '@lib/velocity'),
('dd08a8be', '@app/web/assets/feed/dist'),
('df04ab70', '@bower/jquery/dist'),
('e1930848', '@app/web/assets/matrixsettings/dist'),
('e259768b', '@lib/element-resize-detector'),
('e611a40b', '@thisanimus/craftccblogin/assetbundles/craftccblogin/dist'),
('e72e6a88', '@lib'),
('e8c2f74', '@lib/selectize'),
('ecc2fcd1', '@app/web/assets/matrixsettings/dist'),
('ef088212', '@lib/element-resize-detector'),
('f0940085', '@lib/element-resize-detector'),
('f2bd117e', '@app/web/assets/routes/dist'),
('f35e7e46', '@app/web/assets/matrixsettings/dist'),
('f5e31c86', '@lib'),
('f8b2e81f', '@lib'),
('f9c89582', '@lib/element-resize-detector');

-- --------------------------------------------------------

--
-- Table structure for table `revisions`
--

CREATE TABLE `revisions` (
  `id` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `num` int(11) NOT NULL,
  `notes` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `revisions`
--

INSERT INTO `revisions` (`id`, `sourceId`, `creatorId`, `num`, `notes`) VALUES
(1, 2, 1, 4, NULL),
(2, 2, 1, 3, NULL),
(3, 2, 1, 2, NULL),
(4, 2, 1, 1, 'Revision from 16 Nov 2019, 21:33:47'),
(5, 4, 1, 15, NULL),
(6, 4, 1, 14, NULL),
(7, 4, 1, 13, NULL),
(8, 4, 1, 12, NULL),
(9, 4, 1, 11, NULL),
(10, 4, 1, 10, NULL),
(11, 4, 1, 9, NULL),
(12, 4, 1, 8, NULL),
(13, 4, 1, 7, NULL),
(14, 4, 1, 6, NULL),
(15, 4, 1, 5, NULL),
(16, 4, 1, 4, NULL),
(17, 4, 1, 3, NULL),
(18, 4, 1, 2, NULL),
(19, 4, 1, 1, 'Revision from 16 Nov 2019, 21:06:06'),
(20, 5, 1, 1, NULL),
(21, 4, 1, 16, NULL),
(22, 3, 1, 1, 'Revision from 16 Nov 2019, 19:13:53'),
(23, 3, 1, 2, NULL),
(24, 2, 1, 5, NULL),
(25, 4, 1, 17, NULL),
(26, 5, 1, 2, NULL),
(27, 5, 1, 3, NULL),
(28, 5, 1, 4, NULL),
(29, 5, 1, 5, NULL),
(30, 2, 1, 6, NULL),
(31, 2, 1, 7, NULL),
(32, 5, 1, 6, NULL),
(33, 5, 1, 7, NULL),
(35, 2, 1, 8, NULL),
(36, 2, 1, 9, NULL),
(37, 118, 1, 1, NULL),
(38, 121, 1, 1, NULL),
(39, 124, 1, 1, NULL),
(40, 2, 1, 10, NULL),
(41, 133, 1, 1, NULL),
(42, 2, 1, 11, NULL),
(43, 144, 1, 1, NULL),
(44, 147, 1, 1, NULL),
(45, 2, 1, 12, NULL),
(46, 159, 1, 1, NULL),
(47, 163, 1, 1, NULL),
(48, 166, 1, 1, NULL),
(49, 169, 1, 1, NULL),
(50, 172, 1, 1, NULL),
(51, 176, 1, 1, NULL),
(52, 179, 1, 1, NULL),
(53, 2, 1, 13, NULL),
(54, 2, 1, 14, NULL),
(55, 203, 1, 1, NULL),
(56, 2, 1, 15, NULL),
(57, 2, 1, 16, NULL),
(58, 2, 1, 17, NULL),
(59, 2, 1, 18, NULL),
(60, 4, 1, 18, NULL),
(61, 2, 1, 19, NULL),
(62, 133, 1, 2, NULL),
(63, 282, 1, 1, NULL),
(64, 285, 1, 1, NULL),
(65, 289, 1, 1, NULL),
(66, 292, 1, 1, NULL),
(67, 295, 1, 1, NULL),
(68, 298, 1, 1, NULL),
(69, 301, 1, 1, NULL),
(70, 298, 1, 2, NULL),
(71, 2, 1, 20, NULL),
(72, 2, 1, 21, NULL),
(73, 2, 1, 22, NULL),
(74, 4, 1, 19, NULL),
(75, 2, 1, 23, NULL),
(76, 4, 1, 20, NULL),
(77, 159, 1, 2, NULL),
(78, 372, 1, 1, NULL),
(79, 375, 1, 1, NULL),
(80, 2, 1, 24, NULL),
(81, 384, 1, 1, NULL),
(82, 2, 1, 25, NULL),
(83, 2, 1, 26, NULL),
(84, 2, 1, 27, NULL),
(85, 4, 1, 21, NULL),
(86, 2, 1, 28, NULL),
(87, 419, 1, 1, NULL),
(88, 422, 1, 1, NULL),
(89, 4, 1, 22, NULL),
(90, 422, 1, 2, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `searchindex`
--

CREATE TABLE `searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `keywords` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `searchindex`
--

INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES
(1, 'username', 0, 1, ' admin '),
(1, 'firstname', 0, 1, ''),
(1, 'lastname', 0, 1, ''),
(1, 'fullname', 0, 1, ''),
(1, 'email', 0, 1, ' h lawrence windowslive com '),
(1, 'slug', 0, 1, ''),
(2, 'slug', 0, 1, ' home '),
(3, 'title', 0, 1, ' contact '),
(3, 'slug', 0, 1, ' contact '),
(4, 'title', 0, 1, ' order form '),
(5, 'slug', 0, 1, ' salmon '),
(7, 'field', 9, 1, ' 14 999sss '),
(5, 'title', 0, 1, ' salmon '),
(4, 'slug', 0, 1, ' order form '),
(259, 'field', 8, 1, ' pork '),
(7, 'field', 11, 1, ' unavailable '),
(7, 'slug', 0, 1, ''),
(8, 'field', 11, 1, ' available '),
(7, 'field', 10, 1, ''),
(8, 'field', 10, 1, ''),
(8, 'field', 9, 1, ' 99 90g '),
(8, 'slug', 0, 1, ''),
(2, 'title', 0, 1, ' home '),
(9, 'field', 14, 1, ' dang that description '),
(9, 'field', 15, 1, ''),
(9, 'slug', 0, 1, ''),
(364, 'field', 9, 1, ' tw3et '),
(10, 'field', 14, 1, ' descriptiondescriptiondescriptionsww '),
(10, 'slug', 0, 1, ''),
(11, 'field', 14, 1, ' test '),
(11, 'slug', 0, 1, ''),
(259, 'field', 9, 1, ' 111g '),
(259, 'slug', 0, 1, ''),
(10, 'field', 13, 1, ' wow new cool title newer '),
(9, 'field', 13, 1, ' wow new cool title '),
(11, 'field', 13, 1, ' hello '),
(7, 'field', 8, 1, ' salmonsss '),
(191, 'field', 15, 1, ''),
(102, 'slug', 0, 1, ''),
(11, 'field', 15, 1, ''),
(364, 'slug', 0, 1, ''),
(364, 'field', 8, 1, ' tew '),
(102, 'field', 14, 1, ' testinggggggggg '),
(102, 'field', 15, 1, ''),
(109, 'field', 14, 1, ' wwwww '),
(109, 'slug', 0, 1, ''),
(109, 'field', 13, 1, ' newwwwwwww '),
(364, 'field', 10, 1, ''),
(118, 'slug', 0, 1, ' we have new salmon '),
(118, 'title', 0, 1, ' we have new salmon '),
(118, 'field', 17, 1, ' new salmon description etcetcetcc '),
(118, 'field', 18, 1, ' salmon '),
(118, 'field', 16, 1, ' we have new salmon title '),
(121, 'slug', 0, 1, ' we have new salmom '),
(121, 'title', 0, 1, ' we have new salmom '),
(121, 'field', 17, 1, ' we have new salmom descriptio '),
(121, 'field', 18, 1, ' salmon '),
(121, 'field', 16, 1, ' we have new salmom title '),
(124, 'slug', 0, 1, ' we have more new lamomnon '),
(124, 'title', 0, 1, ' we have more new lamomnon '),
(124, 'field', 17, 1, ' we have more new lamomnon desc '),
(124, 'field', 18, 1, ' salmon '),
(124, 'field', 16, 1, ' we have more new lamomnon title '),
(259, 'field', 11, 1, ' available '),
(133, 'title', 0, 1, ' titlw '),
(133, 'slug', 0, 1, ' titlw '),
(133, 'field', 17, 1, ' wwwwww '),
(135, 'slug', 0, 1, ''),
(135, 'field', 13, 1, ' enwewe '),
(135, 'field', 14, 1, ' ewnenwenw '),
(144, 'slug', 0, 1, ' test '),
(144, 'title', 0, 1, ' test '),
(144, 'field', 17, 1, ' test '),
(144, 'field', 18, 1, ' salmon '),
(144, 'field', 16, 1, ' test '),
(147, 'slug', 0, 1, ' title '),
(147, 'title', 0, 1, ' title '),
(147, 'field', 17, 1, ' desc '),
(147, 'field', 18, 1, ' salmon '),
(147, 'field', 16, 1, ' news '),
(109, 'field', 15, 1, ''),
(135, 'field', 15, 1, ''),
(149, 'slug', 0, 1, ''),
(149, 'field', 13, 1, ''),
(149, 'field', 14, 1, ''),
(149, 'field', 15, 1, ''),
(159, 'title', 0, 1, ' ejoi '),
(159, 'slug', 0, 1, ' ejoi '),
(159, 'field', 17, 1, ' on '),
(163, 'slug', 0, 1, ' tes '),
(163, 'title', 0, 1, ' tes '),
(163, 'field', 17, 1, ' tes '),
(163, 'field', 18, 1, ' salmon '),
(163, 'field', 16, 1, ' tes '),
(166, 'slug', 0, 1, ' tes 1 '),
(166, 'title', 0, 1, ' tes '),
(166, 'field', 17, 1, ' tse '),
(166, 'field', 18, 1, ' salmon '),
(166, 'field', 16, 1, ' tes '),
(169, 'slug', 0, 1, ' e '),
(169, 'title', 0, 1, ' e '),
(169, 'field', 17, 1, ' e '),
(169, 'field', 18, 1, ''),
(169, 'field', 16, 1, ' e '),
(172, 'slug', 0, 1, ' q '),
(172, 'title', 0, 1, ' qq '),
(172, 'field', 17, 1, ' qq '),
(172, 'field', 18, 1, ''),
(172, 'field', 16, 1, ' q '),
(176, 'slug', 0, 1, ' tes 2 '),
(176, 'title', 0, 1, ' tes '),
(176, 'field', 17, 1, ' tes '),
(176, 'field', 18, 1, ''),
(176, 'field', 16, 1, ' test '),
(179, 'slug', 0, 1, ' test 1 '),
(179, 'title', 0, 1, ' test '),
(179, 'field', 17, 1, ''),
(179, 'field', 18, 1, ''),
(179, 'field', 16, 1, ''),
(181, 'slug', 0, 1, ''),
(181, 'field', 13, 1, ' heyoooo '),
(181, 'field', 14, 1, ' heyoooo '),
(181, 'field', 15, 1, ''),
(191, 'slug', 0, 1, ''),
(191, 'field', 13, 1, ' test1 save again chane '),
(203, 'slug', 0, 1, ' test2 '),
(203, 'title', 0, 1, ' test2 '),
(191, 'field', 14, 1, ' test1 save again test '),
(205, 'slug', 0, 1, ''),
(205, 'field', 13, 1, ' new onw '),
(205, 'field', 14, 1, ' new oned '),
(364, 'field', 11, 1, ' available '),
(10, 'field', 15, 1, ''),
(230, 'field', 15, 1, ''),
(205, 'field', 15, 1, ''),
(217, 'slug', 0, 1, ''),
(217, 'field', 13, 1, ' newn '),
(217, 'field', 14, 1, ' new '),
(244, 'field', 15, 1, ''),
(217, 'field', 15, 1, ''),
(230, 'slug', 0, 1, ''),
(230, 'field', 13, 1, ' new '),
(230, 'field', 14, 1, ' newn '),
(244, 'slug', 0, 1, ''),
(244, 'field', 13, 1, ' t '),
(259, 'field', 10, 1, ''),
(264, 'slug', 0, 1, ''),
(264, 'field', 13, 1, ' t '),
(133, 'field', 18, 1, ' salmon '),
(133, 'field', 16, 1, ' wwwwwwr '),
(282, 'slug', 0, 1, ' test 2 '),
(282, 'title', 0, 1, ' test '),
(282, 'field', 17, 1, ' test '),
(282, 'field', 18, 1, ''),
(282, 'field', 16, 1, ' tes '),
(285, 'slug', 0, 1, ' test 3 '),
(285, 'title', 0, 1, ' test '),
(285, 'field', 17, 1, ' test '),
(285, 'field', 18, 1, ''),
(285, 'field', 16, 1, ' tse '),
(289, 'slug', 0, 1, ' rest '),
(289, 'title', 0, 1, ' rest '),
(289, 'field', 17, 1, ' rtest '),
(289, 'field', 18, 1, ''),
(289, 'field', 16, 1, ' tseest '),
(292, 'slug', 0, 1, ' era '),
(292, 'title', 0, 1, ' era '),
(295, 'slug', 0, 1, ' wefw '),
(295, 'title', 0, 1, ' wefw '),
(298, 'title', 0, 1, ' qwd '),
(298, 'slug', 0, 1, ' wew '),
(301, 'slug', 0, 1, ' qwdqw '),
(301, 'title', 0, 1, ' qwdqw '),
(264, 'field', 15, 1, ''),
(304, 'slug', 0, 1, ''),
(304, 'field', 13, 1, ' w '),
(102, 'field', 13, 1, ' testy '),
(244, 'field', 14, 1, ' t '),
(264, 'field', 14, 1, ' t '),
(304, 'field', 14, 1, ' w '),
(321, 'slug', 0, 1, ''),
(321, 'field', 13, 1, ' wef '),
(304, 'field', 15, 1, ''),
(321, 'field', 14, 1, ' wef '),
(321, 'field', 15, 1, ''),
(339, 'slug', 0, 1, ''),
(339, 'field', 13, 1, ' w '),
(339, 'field', 14, 1, ' wwwww '),
(339, 'field', 15, 1, ''),
(8, 'field', 8, 1, ' cheeseg '),
(4, 'field', 6, 1, ' unavailable 14 999sss salmonsss available 99 90g cheeseg available 111g pork available tw3et tew unavailable asd asd '),
(159, 'field', 18, 1, ' salmon '),
(159, 'field', 16, 1, ' jowed '),
(372, 'slug', 0, 1, ' wef '),
(372, 'title', 0, 1, ' wef '),
(372, 'field', 17, 1, ' wef '),
(372, 'field', 18, 1, ''),
(372, 'field', 16, 1, ' wef '),
(375, 'slug', 0, 1, ' wef '),
(375, 'title', 0, 1, ' wef '),
(378, 'slug', 0, 1, ''),
(378, 'field', 13, 1, ' ddd '),
(378, 'field', 14, 1, ' ddd '),
(384, 'slug', 0, 1, ' new news '),
(384, 'title', 0, 1, ' new news '),
(384, 'field', 17, 1, ' desciptiom '),
(384, 'field', 18, 1, ''),
(384, 'field', 16, 1, ' title '),
(398, 'field', 14, 1, ' dw '),
(378, 'field', 15, 1, ''),
(387, 'slug', 0, 1, ''),
(387, 'field', 13, 1, ' news '),
(387, 'field', 14, 1, ' news '),
(387, 'field', 15, 1, ''),
(392, 'slug', 0, 1, ''),
(392, 'field', 13, 1, ' erv '),
(392, 'field', 14, 1, ' ver '),
(392, 'field', 15, 1, ''),
(398, 'slug', 0, 1, ''),
(398, 'field', 13, 1, ' wef '),
(2, 'field', 12, 1, ' descriptiondescriptiondescriptionsww wow new cool title newer ddd ddd news news ver erv dw wef t t '),
(398, 'field', 15, 1, ''),
(410, 'slug', 0, 1, ''),
(410, 'field', 13, 1, ' t '),
(410, 'field', 14, 1, ' t '),
(410, 'field', 15, 1, ''),
(419, 'slug', 0, 1, ' teste '),
(419, 'title', 0, 1, ' teste '),
(422, 'title', 0, 1, ' newer ewnr '),
(422, 'slug', 0, 1, ' newer ewnr '),
(422, 'field', 17, 1, ' wn '),
(424, 'slug', 0, 1, ''),
(424, 'field', 8, 1, ' asd '),
(424, 'field', 9, 1, ' asd '),
(424, 'field', 10, 1, ''),
(424, 'field', 11, 1, ' unavailable '),
(422, 'field', 18, 1, ' salmon '),
(422, 'field', 16, 1, ' n '),
(432, 'username', 0, 1, ' hmbl4 '),
(432, 'lastname', 0, 1, ' lawrence '),
(432, 'fullname', 0, 1, ' henry lawrence '),
(432, 'firstname', 0, 1, ' henry '),
(432, 'email', 0, 1, ' henry vendhq com '),
(432, 'slug', 0, 1, ''),
(432, 'field', 21, 1, ''),
(432, 'field', 19, 1, ''),
(432, 'field', 20, 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` int(11) NOT NULL,
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
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `structureId`, `name`, `handle`, `type`, `enableVersioning`, `propagationMethod`, `previewTargets`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, NULL, 'Home', 'home', 'single', 1, 'all', NULL, '2019-11-17 03:13:40', '2019-11-17 03:13:40', NULL, '799c5f9f-5fc4-44eb-9ab5-6b5b70a2fd4d'),
(2, NULL, 'Contact', 'contact', 'single', 1, 'all', NULL, '2019-11-17 03:13:53', '2019-11-17 03:13:53', NULL, 'a8cbca0d-d8d9-4dfd-bc56-39396f122ab0'),
(3, NULL, 'Order Form', 'orderForm', 'single', 1, 'all', NULL, '2019-11-17 03:14:44', '2019-11-17 03:14:44', NULL, 'ab35d417-427e-443b-b529-21866d37ba58'),
(4, NULL, 'Products', 'products', 'channel', 1, 'all', NULL, '2019-11-17 03:15:14', '2019-11-17 03:15:14', NULL, '5a041f1d-964e-41a5-a3e7-36f0a91ec4e2'),
(5, NULL, 'News', 'news', 'channel', 1, 'all', NULL, '2019-11-23 01:29:51', '2019-11-23 01:32:23', NULL, 'fbeaeb48-e4f3-44bb-b933-90a97eff2358');

-- --------------------------------------------------------

--
-- Table structure for table `sections_sites`
--

CREATE TABLE `sections_sites` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sections_sites`
--

INSERT INTO `sections_sites` (`id`, `sectionId`, `siteId`, `hasUrls`, `uriFormat`, `template`, `enabledByDefault`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, 1, '__home__', 'home/_entry', 1, '2019-11-17 03:13:40', '2019-11-17 03:13:40', 'ba186535-2c2b-47f3-8230-714cce776e50'),
(2, 2, 1, 1, 'contact', 'contact/_entry', 1, '2019-11-17 03:13:53', '2019-11-17 03:13:53', '93bd21b5-0ce9-41ba-9316-71696d48b509'),
(3, 3, 1, 1, 'order', 'order/_entry', 1, '2019-11-17 03:14:44', '2019-11-17 03:14:44', '871d7c77-8e8e-42d7-99e1-9cf60956eb88'),
(4, 4, 1, 1, 'products/{slug}', 'products/_entry', 1, '2019-11-17 03:15:14', '2019-11-17 03:15:14', '19a9bc70-06e4-43a2-bb67-78dca8d6e683'),
(5, 5, 1, 1, 'news/{slug}', 'news/_entry', 1, '2019-11-23 01:29:51', '2019-11-23 01:32:23', '436fae9f-2d3a-444c-bf8f-00c8647eafdb');

-- --------------------------------------------------------

--
-- Table structure for table `sequences`
--

CREATE TABLE `sequences` (
  `name` varchar(255) NOT NULL,
  `next` int(11) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sequences`
--

INSERT INTO `sequences` (`name`, `next`) VALUES
('hits:2', 43);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `token` char(100) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `userId`, `token`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 'LbsJVyEiQl_-tb8--LARtCD0GJlsxV8MwEGwcsm9hYYe1wJvZ80tVRnPH81ETmGX29Fldr2rlyYDdwlfQaaVlQvCk2pH5xUgreOv', '2019-11-20 10:10:36', '2019-11-20 10:19:46', 'd4a50dbb-86de-48d5-b7ab-8bb8892301ab'),
(4, 1, 'ZB53GJqO9BcuXDAVmmdHBWkEV-UFApr24XF1MR6N_GpyqiZSK42l1tsIKQWhNMwpbu7boIXZSH3JJhkL6ZxM8qpyGdDzss2FF3jU', '2019-11-23 05:13:18', '2019-11-23 05:46:16', '75cc2fe7-ac23-4911-9cfb-0102a6d18b95'),
(5, 1, 'GRY_QGCtdN_VlOktLZmpvBXxlJUcuDBqB9JV4IqvXwbMoSKEOfjg7OrHuodiXFZt9y82GD8aVBVFmwXXYQrlZMDNYpjsfUBenytQ', '2019-11-23 05:50:49', '2019-11-23 08:22:24', 'b3cb4583-ad3d-4336-a7c7-2b8c56eb7620'),
(11, 1, 'LmGRFl-XJH8vP5ADhBV0QRbvIvtc_8wJWVmclBDSiciPsDzAVsQRt2ZBuwUpUAJ-27GSIJxa8dKrWCPXL_XTDyBZyNd5aMjsvh_q', '2019-11-25 05:37:34', '2019-11-25 05:37:38', '038d88c5-bbb9-401f-84e1-f52998a308d2'),
(12, 1, 'wdJfop2E9QS16Pwr8E2Cu2SVpz7c0OLFE9jhziQFD2Jx6hxIH5eXU4waukMlbyyHBO3t8PPJfrtLM8MTKO05_MSejzcempR_TE62', '2019-11-27 10:30:19', '2019-11-27 11:18:01', 'b22a137d-2208-4b3f-a167-ee62acdd3a04');

-- --------------------------------------------------------

--
-- Table structure for table `shunnedmessages`
--

CREATE TABLE `shunnedmessages` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sitegroups`
--

CREATE TABLE `sitegroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sitegroups`
--

INSERT INTO `sitegroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 'Craft3 Jir6 Frb - Awatoru', '2019-11-17 03:11:01', '2019-11-17 03:11:01', NULL, 'c9424660-0760-48b0-b613-2c3499cf4ff8');

-- --------------------------------------------------------

--
-- Table structure for table `sites`
--

CREATE TABLE `sites` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `language` varchar(12) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sites`
--

INSERT INTO `sites` (`id`, `groupId`, `primary`, `name`, `handle`, `language`, `hasUrls`, `baseUrl`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 1, 1, 'Craft3 Jir6 Frb - Awatoru', 'default', 'en-GB', 1, '@web/', 1, '2019-11-17 03:11:01', '2019-11-17 03:11:01', NULL, '1d897520-a9e2-4981-beda-4254507df91e');

-- --------------------------------------------------------

--
-- Table structure for table `structureelements`
--

CREATE TABLE `structureelements` (
  `id` int(11) NOT NULL,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) UNSIGNED DEFAULT NULL,
  `lft` int(11) UNSIGNED NOT NULL,
  `rgt` int(11) UNSIGNED NOT NULL,
  `level` smallint(6) UNSIGNED NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `structures`
--

CREATE TABLE `structures` (
  `id` int(11) NOT NULL,
  `maxLevels` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `systemmessages`
--

CREATE TABLE `systemmessages` (
  `id` int(11) NOT NULL,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `taggroups`
--

CREATE TABLE `taggroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `templatecacheelements`
--

CREATE TABLE `templatecacheelements` (
  `cacheId` int(11) NOT NULL,
  `elementId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `templatecachequeries`
--

CREATE TABLE `templatecachequeries` (
  `id` int(11) NOT NULL,
  `cacheId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `query` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `templatecaches`
--

CREATE TABLE `templatecaches` (
  `id` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `cacheKey` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `body` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tokens`
--

CREATE TABLE `tokens` (
  `id` int(11) NOT NULL,
  `token` char(32) NOT NULL,
  `route` text,
  `usageLimit` tinyint(3) UNSIGNED DEFAULT NULL,
  `usageCount` tinyint(3) UNSIGNED DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `usergroups`
--

CREATE TABLE `usergroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `usergroups`
--

INSERT INTO `usergroups` (`id`, `name`, `handle`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'Restaurants ', 'restaurants', '2019-11-25 05:20:35', '2019-11-25 05:20:35', '2bc2f604-a7fc-4567-b7db-bed1568be1c3');

-- --------------------------------------------------------

--
-- Table structure for table `usergroups_users`
--

CREATE TABLE `usergroups_users` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `userpermissions`
--

CREATE TABLE `userpermissions` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `userpermissions_usergroups`
--

CREATE TABLE `userpermissions_usergroups` (
  `id` int(11) NOT NULL,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `userpermissions_users`
--

CREATE TABLE `userpermissions_users` (
  `id` int(11) NOT NULL,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `userpreferences`
--

CREATE TABLE `userpreferences` (
  `userId` int(11) NOT NULL,
  `preferences` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `userpreferences`
--

INSERT INTO `userpreferences` (`userId`, `preferences`) VALUES
(1, '{\"language\":\"en-GB\"}'),
(432, '{\"language\":null,\"weekStartDay\":null}');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

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
  `invalidLoginCount` tinyint(3) UNSIGNED DEFAULT NULL,
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
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `photoId`, `firstName`, `lastName`, `email`, `password`, `admin`, `locked`, `suspended`, `pending`, `lastLoginDate`, `lastLoginAttemptIp`, `invalidLoginWindowStart`, `invalidLoginCount`, `lastInvalidLoginDate`, `lockoutDate`, `hasDashboard`, `verificationCode`, `verificationCodeIssuedDate`, `unverifiedEmail`, `passwordResetRequired`, `lastPasswordChangeDate`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'admin', NULL, NULL, NULL, 'h.lawrence@windowslive.com', '$2y$13$8fONmUPzE0IoRDk8rOj2ZeHyZ18U595IF5jc3RDKYtpbFzw.jOcS.', 1, 0, 0, 0, '2019-11-27 10:30:19', '::1', NULL, NULL, '2019-11-20 10:10:28', NULL, 1, '$2y$13$MZsmxApZOrY/GcSsiiQ.dOn2.jRo4S7QH5XroB020HWDbGKIg9LbO', '2019-11-25 05:34:42', NULL, 0, '2019-11-17 03:11:02', '2019-11-17 03:11:02', '2019-11-27 10:30:19', 'c581720b-95ca-4966-96d3-bc70c6f75dfb'),
(432, 'hmbl4', NULL, 'Henry', 'Lawrence', 'henry@vendhq.com', NULL, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, '2019-11-25 05:21:15', '2019-11-25 05:23:04', '91e16f3f-2ff2-417f-b40e-eb2d1778bc78');

-- --------------------------------------------------------

--
-- Table structure for table `volumefolders`
--

CREATE TABLE `volumefolders` (
  `id` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `volumes`
--

CREATE TABLE `volumes` (
  `id` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `url` varchar(255) DEFAULT NULL,
  `settings` text,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `webhookgroups`
--

CREATE TABLE `webhookgroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `webhookgroups`
--

INSERT INTO `webhookgroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'Communication / Twilio', '2019-11-20 10:22:52', '2019-11-20 10:22:52', 'e3d89866-9e22-4413-ad8e-d5134abd0515');

-- --------------------------------------------------------

--
-- Table structure for table `webhookrequests`
--

CREATE TABLE `webhookrequests` (
  `id` int(11) NOT NULL,
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
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `webhookrequests`
--

INSERT INTO `webhookrequests` (`id`, `webhookId`, `status`, `attempts`, `method`, `url`, `requestHeaders`, `requestBody`, `responseStatus`, `responseHeaders`, `responseBody`, `responseTime`, `dateCreated`, `dateRequested`, `uid`) VALUES
(1, 1, 'done', 1, 'post', 'https://hooks.zapier.com/hooks/catch/6128230/o4x908w/', '{\"X-User-Phones\":\"henrytest\",\"Content-Type\":\"application/json\"}', '{\"contact\":{\"name\":\"Henry\"}}', 200, '{\"Access-Control-Allow-Origin\":[\"*\"],\"Content-Type\":[\"application/json\"],\"Date\":[\"Sat, 23 Nov 2019 01:12:03 GMT\"],\"P3P\":[\"CP=\\\"IDC DSP COR ADM DEVi TAIi PSA PSD IVAi IVDi CONi HIS OUR IND CNT\\\"\"],\"Response-Id\":[\"5dd88763-a1bc-43a3-822b-827762710a30\"],\"Server\":[\"nginx\"],\"Vary\":[\"X-Session-Key\"],\"X-Frame-Options\":[\"SAMEORIGIN\"],\"X-Rate-Limit-Limit\":[\"10000\"],\"X-Rate-Limit-Remaining\":[\"9999\"],\"X-Rate-Limit-Reset\":[\"1574472000\"],\"X-Session-Key\":[\"anonymous\"],\"X-Zapier-Fast-Return\":[\"true\"],\"X-Zapier-Jobs\":[\"A hacker like yourself should consider working at Zapier!\"],\"X-Zapier-Jobs-Link\":[\"https://zapier.com/jobs/\"],\"X-Zapier-Revision\":[\"2de592c1e299331a949c24a1109a81780e726be2\"],\"Content-Length\":[\"172\"],\"Connection\":[\"keep-alive\"]}', '{\"status\": \"success\", \"attempt\": \"5dd88763-a1bc-43a3-822b-827762710a30\", \"id\": \"9e82c8d5-3db8-4a18-b0c5-9d079ca028e0\", \"request_id\": \"5dd88763-a1bc-43a3-822b-827762710a30\"}', 853, '2019-11-23 01:12:00', '2019-11-23 01:12:02', 'fed411f7-4668-4587-92cb-86d3d9b62a64'),
(2, 1, 'done', 1, 'post', 'https://hooks.zapier.com/hooks/catch/6128230/o4x908w/', '{\"X-User-Phones\":\"henrytest\",\"Content-Type\":\"application/json\"}', '{\"contact\":{\"name\":\"Henry\"}}', 200, '{\"Access-Control-Allow-Origin\":[\"*\"],\"Content-Type\":[\"application/json\"],\"Date\":[\"Sat, 23 Nov 2019 01:12:04 GMT\"],\"P3P\":[\"CP=\\\"IDC DSP COR ADM DEVi TAIi PSA PSD IVAi IVDi CONi HIS OUR IND CNT\\\"\"],\"Response-Id\":[\"5dd88764-3f3a-4d9b-9cf5-970ce3e7fcc0\"],\"Server\":[\"nginx\"],\"Vary\":[\"X-Session-Key\"],\"X-Frame-Options\":[\"SAMEORIGIN\"],\"X-Rate-Limit-Limit\":[\"10000\"],\"X-Rate-Limit-Remaining\":[\"9998\"],\"X-Rate-Limit-Reset\":[\"1574472000\"],\"X-Session-Key\":[\"anonymous\"],\"X-Zapier-Fast-Return\":[\"true\"],\"X-Zapier-Jobs\":[\"A hacker like yourself should consider working at Zapier!\"],\"X-Zapier-Jobs-Link\":[\"https://zapier.com/jobs/\"],\"X-Zapier-Revision\":[\"2de592c1e299331a949c24a1109a81780e726be2\"],\"Content-Length\":[\"172\"],\"Connection\":[\"keep-alive\"]}', '{\"status\": \"success\", \"attempt\": \"5dd88764-3f3a-4d9b-9cf5-970ce3e7fcc0\", \"id\": \"dc786bff-5ddf-4d28-bd08-428a7ae60108\", \"request_id\": \"5dd88764-3f3a-4d9b-9cf5-970ce3e7fcc0\"}', 926, '2019-11-23 01:12:02', '2019-11-23 01:12:03', '22c91ddb-af4d-4d85-9f94-e532d71fdb3f'),
(3, 1, 'done', 1, 'post', 'https://hooks.zapier.com/hooks/catch/6128230/o4x908w/', '{\"X-User-Phones\":\"henrytest\",\"Content-Type\":\"application/json\"}', '{\"contact\":{\"name\":\"Henry\"}}', 200, '{\"Access-Control-Allow-Origin\":[\"*\"],\"Content-Type\":[\"application/json\"],\"Date\":[\"Sat, 23 Nov 2019 01:12:21 GMT\"],\"P3P\":[\"CP=\\\"IDC DSP COR ADM DEVi TAIi PSA PSD IVAi IVDi CONi HIS OUR IND CNT\\\"\"],\"Response-Id\":[\"5dd88775-c0e3-475b-bfeb-2709309941b0\"],\"Server\":[\"nginx\"],\"Vary\":[\"X-Session-Key\"],\"X-Frame-Options\":[\"SAMEORIGIN\"],\"X-Rate-Limit-Limit\":[\"10000\"],\"X-Rate-Limit-Remaining\":[\"9997\"],\"X-Rate-Limit-Reset\":[\"1574472000\"],\"X-Session-Key\":[\"anonymous\"],\"X-Zapier-Fast-Return\":[\"true\"],\"X-Zapier-Jobs\":[\"A hacker like yourself should consider working at Zapier!\"],\"X-Zapier-Jobs-Link\":[\"https://zapier.com/jobs/\"],\"X-Zapier-Revision\":[\"2de592c1e299331a949c24a1109a81780e726be2\"],\"Content-Length\":[\"172\"],\"Connection\":[\"keep-alive\"]}', '{\"status\": \"success\", \"attempt\": \"5dd88775-c0e3-475b-bfeb-2709309941b0\", \"id\": \"1b141bbb-e1e2-4f14-994d-c8689288147b\", \"request_id\": \"5dd88775-c0e3-475b-bfeb-2709309941b0\"}', 853, '2019-11-23 01:12:05', '2019-11-23 01:12:21', 'd29cc66e-e32c-442c-9e0b-4d3ca4bd670d'),
(4, 1, 'done', 1, 'post', 'https://hooks.zapier.com/hooks/catch/6128230/o4x908w/', '{\"X-User-Phones\":\"henrytest\",\"Content-Type\":\"application/json\"}', '{\"contact\":{\"name\":\"Henry\"}}', 200, '{\"Access-Control-Allow-Origin\":[\"*\"],\"Content-Type\":[\"application/json\"],\"Date\":[\"Sat, 23 Nov 2019 01:12:22 GMT\"],\"P3P\":[\"CP=\\\"IDC DSP COR ADM DEVi TAIi PSA PSD IVAi IVDi CONi HIS OUR IND CNT\\\"\"],\"Response-Id\":[\"5dd88776-a56b-4646-bb8b-b851414e8770\"],\"Server\":[\"nginx\"],\"Vary\":[\"X-Session-Key\"],\"X-Frame-Options\":[\"SAMEORIGIN\"],\"X-Rate-Limit-Limit\":[\"10000\"],\"X-Rate-Limit-Remaining\":[\"9996\"],\"X-Rate-Limit-Reset\":[\"1574472000\"],\"X-Session-Key\":[\"anonymous\"],\"X-Zapier-Fast-Return\":[\"true\"],\"X-Zapier-Jobs\":[\"A hacker like yourself should consider working at Zapier!\"],\"X-Zapier-Jobs-Link\":[\"https://zapier.com/jobs/\"],\"X-Zapier-Revision\":[\"2de592c1e299331a949c24a1109a81780e726be2\"],\"Content-Length\":[\"172\"],\"Connection\":[\"keep-alive\"]}', '{\"status\": \"success\", \"attempt\": \"5dd88776-a56b-4646-bb8b-b851414e8770\", \"id\": \"a76e5f78-4196-4d40-bc6f-289ad6819f6d\", \"request_id\": \"5dd88776-a56b-4646-bb8b-b851414e8770\"}', 832, '2019-11-23 01:12:20', '2019-11-23 01:12:21', '9a30b4b7-2d6b-480a-83b4-a13cb64c771b'),
(5, 1, 'done', 1, 'post', 'https://hooks.zapier.com/hooks/catch/6128230/o4x908w/', '{\"X-User-Phones\":\"henrytest\",\"Content-Type\":\"application/json\"}', '{\"contact\":{\"name\":\"Henry\"}}', 200, '{\"Access-Control-Allow-Origin\":[\"*\"],\"Content-Type\":[\"application/json\"],\"Date\":[\"Sat, 23 Nov 2019 01:12:23 GMT\"],\"P3P\":[\"CP=\\\"IDC DSP COR ADM DEVi TAIi PSA PSD IVAi IVDi CONi HIS OUR IND CNT\\\"\"],\"Response-Id\":[\"5dd88777-b6c5-495b-83a2-6026a4c4aa10\"],\"Server\":[\"nginx\"],\"Vary\":[\"X-Session-Key\"],\"X-Frame-Options\":[\"SAMEORIGIN\"],\"X-Rate-Limit-Limit\":[\"10000\"],\"X-Rate-Limit-Remaining\":[\"9995\"],\"X-Rate-Limit-Reset\":[\"1574472000\"],\"X-Session-Key\":[\"anonymous\"],\"X-Zapier-Fast-Return\":[\"true\"],\"X-Zapier-Jobs\":[\"A hacker like yourself should consider working at Zapier!\"],\"X-Zapier-Jobs-Link\":[\"https://zapier.com/jobs/\"],\"X-Zapier-Revision\":[\"2de592c1e299331a949c24a1109a81780e726be2\"],\"Content-Length\":[\"172\"],\"Connection\":[\"keep-alive\"]}', '{\"status\": \"success\", \"attempt\": \"5dd88777-b6c5-495b-83a2-6026a4c4aa10\", \"id\": \"4c311752-d2b6-446b-8cc0-243e23bed579\", \"request_id\": \"5dd88777-b6c5-495b-83a2-6026a4c4aa10\"}', 898, '2019-11-23 01:12:22', '2019-11-23 01:12:22', 'd6f0d791-3b4b-4629-a8ca-e6988a7a82e5'),
(6, 1, 'done', 1, 'post', 'https://hooks.zapier.com/hooks/catch/6128230/o4x908w/', '{\"X-User-Phones\":\"henrytest\",\"Content-Type\":\"application/json\"}', '{\"contact\":{\"name\":\"Henry\"}}', 200, '{\"Access-Control-Allow-Origin\":[\"*\"],\"Content-Type\":[\"application/json\"],\"Date\":[\"Sat, 23 Nov 2019 01:12:24 GMT\"],\"P3P\":[\"CP=\\\"IDC DSP COR ADM DEVi TAIi PSA PSD IVAi IVDi CONi HIS OUR IND CNT\\\"\"],\"Response-Id\":[\"5dd88778-6a0c-4bcb-abf7-d2898fc8e910\"],\"Server\":[\"nginx\"],\"Vary\":[\"X-Session-Key\"],\"X-Frame-Options\":[\"SAMEORIGIN\"],\"X-Rate-Limit-Limit\":[\"10000\"],\"X-Rate-Limit-Remaining\":[\"9994\"],\"X-Rate-Limit-Reset\":[\"1574472000\"],\"X-Session-Key\":[\"anonymous\"],\"X-Zapier-Fast-Return\":[\"true\"],\"X-Zapier-Jobs\":[\"A hacker like yourself should consider working at Zapier!\"],\"X-Zapier-Jobs-Link\":[\"https://zapier.com/jobs/\"],\"X-Zapier-Revision\":[\"2de592c1e299331a949c24a1109a81780e726be2\"],\"Content-Length\":[\"172\"],\"Connection\":[\"keep-alive\"]}', '{\"status\": \"success\", \"attempt\": \"5dd88778-6a0c-4bcb-abf7-d2898fc8e910\", \"id\": \"2c208bc6-d70b-4ac9-9d92-1e9751499517\", \"request_id\": \"5dd88778-6a0c-4bcb-abf7-d2898fc8e910\"}', 1007, '2019-11-23 01:12:23', '2019-11-23 01:12:23', 'ba6c9c42-cc92-4de3-8d9d-af032806558b'),
(7, 1, 'done', 1, 'post', 'https://hooks.zapier.com/hooks/catch/6128230/o4x908w/', '{\"X-User-Phones\":\"henrytest\",\"Content-Type\":\"application/json\"}', '{\"contact\":{\"name\":\"Henry\"}}', 200, '{\"Access-Control-Allow-Origin\":[\"*\"],\"Content-Type\":[\"application/json\"],\"Date\":[\"Sat, 23 Nov 2019 01:16:02 GMT\"],\"P3P\":[\"CP=\\\"IDC DSP COR ADM DEVi TAIi PSA PSD IVAi IVDi CONi HIS OUR IND CNT\\\"\"],\"Response-Id\":[\"5dd88852-2ec4-4960-b085-69bf7cec8480\"],\"Server\":[\"nginx\"],\"Vary\":[\"X-Session-Key\"],\"X-Frame-Options\":[\"SAMEORIGIN\"],\"X-Rate-Limit-Limit\":[\"10000\"],\"X-Rate-Limit-Remaining\":[\"9999\"],\"X-Rate-Limit-Reset\":[\"1574472300\"],\"X-Session-Key\":[\"anonymous\"],\"X-Zapier-Fast-Return\":[\"true\"],\"X-Zapier-Jobs\":[\"A hacker like yourself should consider working at Zapier!\"],\"X-Zapier-Jobs-Link\":[\"https://zapier.com/jobs/\"],\"X-Zapier-Revision\":[\"2de592c1e299331a949c24a1109a81780e726be2\"],\"Content-Length\":[\"172\"],\"Connection\":[\"keep-alive\"]}', '{\"status\": \"success\", \"attempt\": \"5dd88852-2ec4-4960-b085-69bf7cec8480\", \"id\": \"8cfbbe92-a0a3-45b5-8f34-6fa824d0ec30\", \"request_id\": \"5dd88852-2ec4-4960-b085-69bf7cec8480\"}', 1000, '2019-11-23 01:12:31', '2019-11-23 01:16:01', '46042ef5-f8bc-492c-822d-69e82b7998cc'),
(8, 1, 'done', 1, 'post', 'https://hooks.zapier.com/hooks/catch/6128230/o4x908w/', '{\"X-User-Phones\":\"henrytest\",\"Content-Type\":\"application/json\"}', '{\"contact\":{\"name\":\"Henry\"}}', 200, '{\"Access-Control-Allow-Origin\":[\"*\"],\"Content-Type\":[\"application/json\"],\"Date\":[\"Sat, 23 Nov 2019 01:16:03 GMT\"],\"P3P\":[\"CP=\\\"IDC DSP COR ADM DEVi TAIi PSA PSD IVAi IVDi CONi HIS OUR IND CNT\\\"\"],\"Response-Id\":[\"5dd88853-c763-4982-a69f-c655ae24cc90\"],\"Server\":[\"nginx\"],\"Vary\":[\"X-Session-Key\"],\"X-Frame-Options\":[\"SAMEORIGIN\"],\"X-Rate-Limit-Limit\":[\"10000\"],\"X-Rate-Limit-Remaining\":[\"9998\"],\"X-Rate-Limit-Reset\":[\"1574472300\"],\"X-Session-Key\":[\"anonymous\"],\"X-Zapier-Fast-Return\":[\"true\"],\"X-Zapier-Jobs\":[\"A hacker like yourself should consider working at Zapier!\"],\"X-Zapier-Jobs-Link\":[\"https://zapier.com/jobs/\"],\"X-Zapier-Revision\":[\"2de592c1e299331a949c24a1109a81780e726be2\"],\"Content-Length\":[\"172\"],\"Connection\":[\"keep-alive\"]}', '{\"status\": \"success\", \"attempt\": \"5dd88853-c763-4982-a69f-c655ae24cc90\", \"id\": \"b9177e93-d595-4719-a9c6-4681f692fd0c\", \"request_id\": \"5dd88853-c763-4982-a69f-c655ae24cc90\"}', 912, '2019-11-23 01:12:32', '2019-11-23 01:16:02', 'aa2ba4eb-e561-4493-9dbc-7a5b2f94132d'),
(9, 1, 'done', 1, 'post', 'https://hooks.zapier.com/hooks/catch/6128230/o4x908w/', '{\"X-User-Phones\":\"henrytest\",\"Content-Type\":\"application/json\"}', '{\"contact\":{\"name\":\"Henry\"}}', 200, '{\"Access-Control-Allow-Origin\":[\"*\"],\"Content-Type\":[\"application/json\"],\"Date\":[\"Sat, 23 Nov 2019 01:16:04 GMT\"],\"P3P\":[\"CP=\\\"IDC DSP COR ADM DEVi TAIi PSA PSD IVAi IVDi CONi HIS OUR IND CNT\\\"\"],\"Response-Id\":[\"5dd88854-4a64-4309-bd21-83241a6e0f20\"],\"Server\":[\"nginx\"],\"Vary\":[\"X-Session-Key\"],\"X-Frame-Options\":[\"SAMEORIGIN\"],\"X-Rate-Limit-Limit\":[\"10000\"],\"X-Rate-Limit-Remaining\":[\"9997\"],\"X-Rate-Limit-Reset\":[\"1574472300\"],\"X-Session-Key\":[\"anonymous\"],\"X-Zapier-Fast-Return\":[\"true\"],\"X-Zapier-Jobs\":[\"A hacker like yourself should consider working at Zapier!\"],\"X-Zapier-Jobs-Link\":[\"https://zapier.com/jobs/\"],\"X-Zapier-Revision\":[\"2de592c1e299331a949c24a1109a81780e726be2\"],\"Content-Length\":[\"172\"],\"Connection\":[\"keep-alive\"]}', '{\"status\": \"success\", \"attempt\": \"5dd88854-4a64-4309-bd21-83241a6e0f20\", \"id\": \"b559fcad-455e-4b67-b2fd-1caea5e8081a\", \"request_id\": \"5dd88854-4a64-4309-bd21-83241a6e0f20\"}', 1015, '2019-11-23 01:12:32', '2019-11-23 01:16:03', 'fe8990a8-1233-4927-9beb-f528f791fafb'),
(10, 1, 'done', 1, 'post', 'https://hooks.zapier.com/hooks/catch/6128230/o4x908w/', '{\"X-User-Phones\":\"henrytest\",\"Content-Type\":\"application/json\"}', '{\"contact\":{\"name\":\"Henry\"}}', 200, '{\"Access-Control-Allow-Origin\":[\"*\"],\"Content-Type\":[\"application/json\"],\"Date\":[\"Sat, 23 Nov 2019 01:16:05 GMT\"],\"P3P\":[\"CP=\\\"IDC DSP COR ADM DEVi TAIi PSA PSD IVAi IVDi CONi HIS OUR IND CNT\\\"\"],\"Response-Id\":[\"5dd88855-25ae-4d00-840f-668329978c70\"],\"Server\":[\"nginx\"],\"Vary\":[\"X-Session-Key\"],\"X-Frame-Options\":[\"SAMEORIGIN\"],\"X-Rate-Limit-Limit\":[\"10000\"],\"X-Rate-Limit-Remaining\":[\"9996\"],\"X-Rate-Limit-Reset\":[\"1574472300\"],\"X-Session-Key\":[\"anonymous\"],\"X-Zapier-Fast-Return\":[\"true\"],\"X-Zapier-Jobs\":[\"A hacker like yourself should consider working at Zapier!\"],\"X-Zapier-Jobs-Link\":[\"https://zapier.com/jobs/\"],\"X-Zapier-Revision\":[\"2de592c1e299331a949c24a1109a81780e726be2\"],\"Content-Length\":[\"172\"],\"Connection\":[\"keep-alive\"]}', '{\"status\": \"success\", \"attempt\": \"5dd88855-25ae-4d00-840f-668329978c70\", \"id\": \"f049d2a4-65d9-4052-8abe-6fd6fbc7acad\", \"request_id\": \"5dd88855-25ae-4d00-840f-668329978c70\"}', 1019, '2019-11-23 01:12:34', '2019-11-23 01:16:04', '313ae98a-ae44-4fab-87ef-cac6fa5fd6e8'),
(11, 1, 'done', 1, 'post', 'https://hooks.zapier.com/hooks/catch/6128230/o4x908w/', '{\"X-User-Phones\":\"henrytest\",\"Content-Type\":\"application/json\"}', '{\"contact\":{\"name\":\"Henry\"}}', 200, '{\"Access-Control-Allow-Origin\":[\"*\"],\"Content-Type\":[\"application/json\"],\"Date\":[\"Sat, 23 Nov 2019 01:16:06 GMT\"],\"P3P\":[\"CP=\\\"IDC DSP COR ADM DEVi TAIi PSA PSD IVAi IVDi CONi HIS OUR IND CNT\\\"\"],\"Response-Id\":[\"5dd88856-026c-43d7-9854-65f481581830\"],\"Server\":[\"nginx\"],\"Vary\":[\"X-Session-Key\"],\"X-Frame-Options\":[\"SAMEORIGIN\"],\"X-Rate-Limit-Limit\":[\"10000\"],\"X-Rate-Limit-Remaining\":[\"9995\"],\"X-Rate-Limit-Reset\":[\"1574472300\"],\"X-Session-Key\":[\"anonymous\"],\"X-Zapier-Fast-Return\":[\"true\"],\"X-Zapier-Jobs\":[\"A hacker like yourself should consider working at Zapier!\"],\"X-Zapier-Jobs-Link\":[\"https://zapier.com/jobs/\"],\"X-Zapier-Revision\":[\"2de592c1e299331a949c24a1109a81780e726be2\"],\"Content-Length\":[\"172\"],\"Connection\":[\"keep-alive\"]}', '{\"status\": \"success\", \"attempt\": \"5dd88856-026c-43d7-9854-65f481581830\", \"id\": \"04dc34ba-d53f-448c-b9bc-68166041dd5b\", \"request_id\": \"5dd88856-026c-43d7-9854-65f481581830\"}', 916, '2019-11-23 01:12:34', '2019-11-23 01:16:05', 'f04ffc50-e65f-49e7-9d68-48ff7d719286'),
(12, 1, 'done', 1, 'post', 'https://hooks.zapier.com/hooks/catch/6128230/o4x908w/', '{\"X-User-Phones\":\"henrytest\",\"Content-Type\":\"application/json\"}', '{\"contact\":{\"name\":\"Henry\"}}', 200, '{\"Access-Control-Allow-Origin\":[\"*\"],\"Content-Type\":[\"application/json\"],\"Date\":[\"Sat, 23 Nov 2019 01:16:40 GMT\"],\"P3P\":[\"CP=\\\"IDC DSP COR ADM DEVi TAIi PSA PSD IVAi IVDi CONi HIS OUR IND CNT\\\"\"],\"Response-Id\":[\"5dd88878-e45e-4dc0-aa78-b7ad6bb86140\"],\"Server\":[\"nginx\"],\"Vary\":[\"X-Session-Key\"],\"X-Frame-Options\":[\"SAMEORIGIN\"],\"X-Rate-Limit-Limit\":[\"10000\"],\"X-Rate-Limit-Remaining\":[\"9994\"],\"X-Rate-Limit-Reset\":[\"1574472300\"],\"X-Session-Key\":[\"anonymous\"],\"X-Zapier-Fast-Return\":[\"true\"],\"X-Zapier-Jobs\":[\"A hacker like yourself should consider working at Zapier!\"],\"X-Zapier-Jobs-Link\":[\"https://zapier.com/jobs/\"],\"X-Zapier-Revision\":[\"2de592c1e299331a949c24a1109a81780e726be2\"],\"Content-Length\":[\"172\"],\"Connection\":[\"keep-alive\"]}', '{\"status\": \"success\", \"attempt\": \"5dd88878-e45e-4dc0-aa78-b7ad6bb86140\", \"id\": \"1c07d213-30e5-4654-8411-f0448e632657\", \"request_id\": \"5dd88878-e45e-4dc0-aa78-b7ad6bb86140\"}', 920, '2019-11-23 01:16:38', '2019-11-23 01:16:39', '7fcf6c59-c1a5-497a-bf7d-f6cdf8ea2c06'),
(13, 1, 'done', 1, 'post', 'https://hooks.zapier.com/hooks/catch/6128230/o4x908w/', '{\"X-User-Phones\":\"+64273504253,+64273504253,+64273504253,+64273504253,+64273504253,+64273504253,+64273504253,+64273504253,+64273504253\",\"Content-Type\":\"application/json\"}', '{\"time\":\"2019-11-22T17:21:42-08:00\",\"name\":\"afterSave\",\"entry\":{\"class\":\"craft\\\\elements\\\\MatrixBlock\",\"id\":102,\"title\":null,\"slug\":null,\"isNew\":true}}', 200, '{\"Access-Control-Allow-Origin\":[\"*\"],\"Content-Type\":[\"application/json\"],\"Date\":[\"Sat, 23 Nov 2019 01:21:44 GMT\"],\"P3P\":[\"CP=\\\"IDC DSP COR ADM DEVi TAIi PSA PSD IVAi IVDi CONi HIS OUR IND CNT\\\"\"],\"Response-Id\":[\"5dd889a8-a11c-4798-853b-813809fa6900\"],\"Server\":[\"nginx\"],\"Vary\":[\"X-Session-Key\"],\"X-Frame-Options\":[\"SAMEORIGIN\"],\"X-Rate-Limit-Limit\":[\"10000\"],\"X-Rate-Limit-Remaining\":[\"9999\"],\"X-Rate-Limit-Reset\":[\"1574472600\"],\"X-Session-Key\":[\"anonymous\"],\"X-Zapier-Fast-Return\":[\"true\"],\"X-Zapier-Jobs\":[\"A hacker like yourself should consider working at Zapier!\"],\"X-Zapier-Jobs-Link\":[\"https://zapier.com/jobs/\"],\"X-Zapier-Revision\":[\"2de592c1e299331a949c24a1109a81780e726be2\"],\"Content-Length\":[\"172\"],\"Connection\":[\"keep-alive\"]}', '{\"status\": \"success\", \"attempt\": \"5dd889a8-a11c-4798-853b-813809fa6900\", \"id\": \"09d9e9ff-3509-411c-9416-1b963db9711f\", \"request_id\": \"5dd889a8-a11c-4798-853b-813809fa6900\"}', 870, '2019-11-23 01:21:43', '2019-11-23 01:21:43', '299827c7-9ba4-4cff-b3a2-395c7bf363df'),
(14, 1, 'done', 1, 'post', 'https://hooks.zapier.com/hooks/catch/6128230/o4x908w/', '{\"X-User-Phones\":\"+64273504253,+64273504253,+64273504253,+64273504253,+64273504253,+64273504253,+64273504253,+64273504253,+64273504253\",\"Content-Type\":\"application/json\"}', '{\"time\":\"2019-11-22T17:21:42-08:00\",\"name\":\"afterSave\",\"entry\":{\"class\":\"craft\\\\elements\\\\Entry\",\"id\":103,\"title\":\"Home\",\"slug\":\"home\",\"isNew\":true}}', 200, '{\"Access-Control-Allow-Origin\":[\"*\"],\"Content-Type\":[\"application/json\"],\"Date\":[\"Sat, 23 Nov 2019 01:21:45 GMT\"],\"P3P\":[\"CP=\\\"IDC DSP COR ADM DEVi TAIi PSA PSD IVAi IVDi CONi HIS OUR IND CNT\\\"\"],\"Response-Id\":[\"5dd889a9-280c-4ca3-8ca9-b9c22e206b00\"],\"Server\":[\"nginx\"],\"Vary\":[\"X-Session-Key\"],\"X-Frame-Options\":[\"SAMEORIGIN\"],\"X-Rate-Limit-Limit\":[\"10000\"],\"X-Rate-Limit-Remaining\":[\"9998\"],\"X-Rate-Limit-Reset\":[\"1574472600\"],\"X-Session-Key\":[\"anonymous\"],\"X-Zapier-Fast-Return\":[\"true\"],\"X-Zapier-Jobs\":[\"A hacker like yourself should consider working at Zapier!\"],\"X-Zapier-Jobs-Link\":[\"https://zapier.com/jobs/\"],\"X-Zapier-Revision\":[\"2de592c1e299331a949c24a1109a81780e726be2\"],\"Content-Length\":[\"172\"],\"Connection\":[\"keep-alive\"]}', '{\"status\": \"success\", \"attempt\": \"5dd889a9-280c-4ca3-8ca9-b9c22e206b00\", \"id\": \"c56f8627-5842-476f-8cfd-880d3fcfc772\", \"request_id\": \"5dd889a9-280c-4ca3-8ca9-b9c22e206b00\"}', 844, '2019-11-23 01:21:43', '2019-11-23 01:21:44', 'b4e53a06-3691-42ca-8d2d-5b0a04e30448'),
(15, 1, 'done', 1, 'post', 'https://hooks.zapier.com/hooks/catch/6128230/o4x908w/', '{\"X-User-Phones\":\"+64273504253,+64273504253,+64273504253,+64273504253,+64273504253,+64273504253,+64273504253,+64273504253,+64273504253\",\"Content-Type\":\"application/json\"}', '{\"time\":\"2019-11-22T17:21:42-08:00\",\"name\":\"afterSave\",\"entry\":{\"class\":\"craft\\\\elements\\\\MatrixBlock\",\"id\":104,\"title\":null,\"slug\":null,\"isNew\":true}}', 200, '{\"Access-Control-Allow-Origin\":[\"*\"],\"Content-Type\":[\"application/json\"],\"Date\":[\"Sat, 23 Nov 2019 01:21:46 GMT\"],\"P3P\":[\"CP=\\\"IDC DSP COR ADM DEVi TAIi PSA PSD IVAi IVDi CONi HIS OUR IND CNT\\\"\"],\"Response-Id\":[\"5dd889aa-85fa-4b2c-8bb2-794f361a3840\"],\"Server\":[\"nginx\"],\"Vary\":[\"X-Session-Key\"],\"X-Frame-Options\":[\"SAMEORIGIN\"],\"X-Rate-Limit-Limit\":[\"10000\"],\"X-Rate-Limit-Remaining\":[\"9997\"],\"X-Rate-Limit-Reset\":[\"1574472600\"],\"X-Session-Key\":[\"anonymous\"],\"X-Zapier-Fast-Return\":[\"true\"],\"X-Zapier-Jobs\":[\"A hacker like yourself should consider working at Zapier!\"],\"X-Zapier-Jobs-Link\":[\"https://zapier.com/jobs/\"],\"X-Zapier-Revision\":[\"2de592c1e299331a949c24a1109a81780e726be2\"],\"Content-Length\":[\"172\"],\"Connection\":[\"keep-alive\"]}', '{\"status\": \"success\", \"attempt\": \"5dd889aa-85fa-4b2c-8bb2-794f361a3840\", \"id\": \"d497b2d4-dd92-4245-beef-575feab90478\", \"request_id\": \"5dd889aa-85fa-4b2c-8bb2-794f361a3840\"}', 954, '2019-11-23 01:21:43', '2019-11-23 01:21:45', 'd22dbf10-d85b-46f0-8326-06b52fb12744'),
(16, 1, 'done', 1, 'post', 'https://hooks.zapier.com/hooks/catch/6128230/o4x908w/', '{\"X-User-Phones\":\"+64273504253,+64273504253,+64273504253,+64273504253,+64273504253,+64273504253,+64273504253,+64273504253,+64273504253\",\"Content-Type\":\"application/json\"}', '{\"time\":\"2019-11-22T17:21:42-08:00\",\"name\":\"afterSave\",\"entry\":{\"class\":\"craft\\\\elements\\\\MatrixBlock\",\"id\":105,\"title\":null,\"slug\":null,\"isNew\":true}}', 200, '{\"Access-Control-Allow-Origin\":[\"*\"],\"Content-Type\":[\"application/json\"],\"Date\":[\"Sat, 23 Nov 2019 01:21:47 GMT\"],\"P3P\":[\"CP=\\\"IDC DSP COR ADM DEVi TAIi PSA PSD IVAi IVDi CONi HIS OUR IND CNT\\\"\"],\"Response-Id\":[\"5dd889ab-c4f6-4892-8063-088b1d9dca50\"],\"Server\":[\"nginx\"],\"Vary\":[\"X-Session-Key\"],\"X-Frame-Options\":[\"SAMEORIGIN\"],\"X-Rate-Limit-Limit\":[\"10000\"],\"X-Rate-Limit-Remaining\":[\"9996\"],\"X-Rate-Limit-Reset\":[\"1574472600\"],\"X-Session-Key\":[\"anonymous\"],\"X-Zapier-Fast-Return\":[\"true\"],\"X-Zapier-Jobs\":[\"A hacker like yourself should consider working at Zapier!\"],\"X-Zapier-Jobs-Link\":[\"https://zapier.com/jobs/\"],\"X-Zapier-Revision\":[\"2de592c1e299331a949c24a1109a81780e726be2\"],\"Content-Length\":[\"172\"],\"Connection\":[\"keep-alive\"]}', '{\"status\": \"success\", \"attempt\": \"5dd889ab-c4f6-4892-8063-088b1d9dca50\", \"id\": \"c218951a-cb9d-4e65-b283-dc4eb1396b63\", \"request_id\": \"5dd889ab-c4f6-4892-8063-088b1d9dca50\"}', 1005, '2019-11-23 01:21:43', '2019-11-23 01:21:46', '0cb07809-3915-4179-8339-5d2869a40adb'),
(17, 1, 'done', 1, 'post', 'https://hooks.zapier.com/hooks/catch/6128230/o4x908w/', '{\"X-User-Phones\":\"+64273504253,+64273504253,+64273504253,+64273504253,+64273504253,+64273504253,+64273504253,+64273504253,+64273504253\",\"Content-Type\":\"application/json\"}', '{\"time\":\"2019-11-22T17:21:42-08:00\",\"name\":\"afterSave\",\"entry\":{\"class\":\"craft\\\\elements\\\\MatrixBlock\",\"id\":106,\"title\":null,\"slug\":null,\"isNew\":true}}', 200, '{\"Access-Control-Allow-Origin\":[\"*\"],\"Content-Type\":[\"application/json\"],\"Date\":[\"Sat, 23 Nov 2019 01:21:48 GMT\"],\"P3P\":[\"CP=\\\"IDC DSP COR ADM DEVi TAIi PSA PSD IVAi IVDi CONi HIS OUR IND CNT\\\"\"],\"Response-Id\":[\"5dd889ac-8003-4d25-bd99-33097df3ea10\"],\"Server\":[\"nginx\"],\"Vary\":[\"X-Session-Key\"],\"X-Frame-Options\":[\"SAMEORIGIN\"],\"X-Rate-Limit-Limit\":[\"10000\"],\"X-Rate-Limit-Remaining\":[\"9995\"],\"X-Rate-Limit-Reset\":[\"1574472600\"],\"X-Session-Key\":[\"anonymous\"],\"X-Zapier-Fast-Return\":[\"true\"],\"X-Zapier-Jobs\":[\"A hacker like yourself should consider working at Zapier!\"],\"X-Zapier-Jobs-Link\":[\"https://zapier.com/jobs/\"],\"X-Zapier-Revision\":[\"2de592c1e299331a949c24a1109a81780e726be2\"],\"Content-Length\":[\"172\"],\"Connection\":[\"keep-alive\"]}', '{\"status\": \"success\", \"attempt\": \"5dd889ac-8003-4d25-bd99-33097df3ea10\", \"id\": \"b2278eba-9ee3-4d8d-a0df-18b5cb38348e\", \"request_id\": \"5dd889ac-8003-4d25-bd99-33097df3ea10\"}', 836, '2019-11-23 01:21:43', '2019-11-23 01:21:47', '5a348f84-4e2f-43e1-896e-de2b16b64923'),
(18, 1, 'done', 1, 'post', 'https://hooks.zapier.com/hooks/catch/6128230/o4x908w/', '{\"X-User-Phones\":\"+64273504253,+64273504253,+64273504253,+64273504253,+64273504253,+64273504253,+64273504253,+64273504253,+64273504253\",\"Content-Type\":\"application/json\"}', '{\"time\":\"2019-11-22T17:21:42-08:00\",\"name\":\"afterSave\",\"entry\":{\"class\":\"craft\\\\elements\\\\MatrixBlock\",\"id\":107,\"title\":null,\"slug\":null,\"isNew\":true}}', 200, '{\"Access-Control-Allow-Origin\":[\"*\"],\"Content-Type\":[\"application/json\"],\"Date\":[\"Sat, 23 Nov 2019 01:21:49 GMT\"],\"P3P\":[\"CP=\\\"IDC DSP COR ADM DEVi TAIi PSA PSD IVAi IVDi CONi HIS OUR IND CNT\\\"\"],\"Response-Id\":[\"5dd889ad-59df-4005-a4e7-68c7d79d1a80\"],\"Server\":[\"nginx\"],\"Vary\":[\"X-Session-Key\"],\"X-Frame-Options\":[\"SAMEORIGIN\"],\"X-Rate-Limit-Limit\":[\"10000\"],\"X-Rate-Limit-Remaining\":[\"9994\"],\"X-Rate-Limit-Reset\":[\"1574472600\"],\"X-Session-Key\":[\"anonymous\"],\"X-Zapier-Fast-Return\":[\"true\"],\"X-Zapier-Jobs\":[\"A hacker like yourself should consider working at Zapier!\"],\"X-Zapier-Jobs-Link\":[\"https://zapier.com/jobs/\"],\"X-Zapier-Revision\":[\"2de592c1e299331a949c24a1109a81780e726be2\"],\"Content-Length\":[\"172\"],\"Connection\":[\"keep-alive\"]}', '{\"status\": \"success\", \"attempt\": \"5dd889ad-59df-4005-a4e7-68c7d79d1a80\", \"id\": \"dc2c8726-ec0d-4b02-8b3e-e21f887a1f35\", \"request_id\": \"5dd889ad-59df-4005-a4e7-68c7d79d1a80\"}', 837, '2019-11-23 01:21:43', '2019-11-23 01:21:48', '7841aae7-d778-4df3-8d97-3b4fca9b4d90'),
(19, 1, 'done', 1, 'post', 'https://hooks.zapier.com/hooks/catch/6128230/o4x908w/', '{\"Content-Type\":\"application/json\"}', '{\"time\":\"2019-11-22T17:25:17-08:00\",\"name\":\"afterSave\",\"entry\":{\"class\":\"craft\\\\elements\\\\Entry\",\"id\":\"2\",\"title\":\"Home\",\"slug\":\"home\",\"isNew\":false,\"description\":null}}', 200, '{\"Access-Control-Allow-Origin\":[\"*\"],\"Content-Type\":[\"application/json\"],\"Date\":[\"Sat, 23 Nov 2019 01:25:19 GMT\"],\"P3P\":[\"CP=\\\"IDC DSP COR ADM DEVi TAIi PSA PSD IVAi IVDi CONi HIS OUR IND CNT\\\"\"],\"Response-Id\":[\"5dd88a7f-d1b9-4ab1-a880-29f4e5e0b8d0\"],\"Server\":[\"nginx\"],\"Vary\":[\"X-Session-Key\"],\"X-Frame-Options\":[\"SAMEORIGIN\"],\"X-Rate-Limit-Limit\":[\"10000\"],\"X-Rate-Limit-Remaining\":[\"9993\"],\"X-Rate-Limit-Reset\":[\"1574472600\"],\"X-Session-Key\":[\"anonymous\"],\"X-Zapier-Fast-Return\":[\"true\"],\"X-Zapier-Jobs\":[\"A hacker like yourself should consider working at Zapier!\"],\"X-Zapier-Jobs-Link\":[\"https://zapier.com/jobs/\"],\"X-Zapier-Revision\":[\"2de592c1e299331a949c24a1109a81780e726be2\"],\"Content-Length\":[\"172\"],\"Connection\":[\"keep-alive\"]}', '{\"status\": \"success\", \"attempt\": \"5dd88a7f-d1b9-4ab1-a880-29f4e5e0b8d0\", \"id\": \"a3170392-2d1e-4083-9c5e-7e3d7a9865f0\", \"request_id\": \"5dd88a7f-d1b9-4ab1-a880-29f4e5e0b8d0\"}', 1053, '2019-11-23 01:25:17', '2019-11-23 01:25:18', 'b09ac799-3054-4d2e-9e39-52ae6b286392'),
(20, 1, 'done', 1, 'post', 'https://hooks.zapier.com/hooks/catch/6128230/o4x908w/', '{\"Content-Type\":\"application/json\"}', '{\"time\":\"2019-11-22T17:25:17-08:00\",\"name\":\"afterSave\",\"entry\":{\"class\":\"craft\\\\elements\\\\MatrixBlock\",\"id\":\"10\",\"title\":null,\"slug\":null,\"isNew\":false,\"description\":\"wow new cool title newer!!\"}}', 200, '{\"Access-Control-Allow-Origin\":[\"*\"],\"Content-Type\":[\"application/json\"],\"Date\":[\"Sat, 23 Nov 2019 01:25:20 GMT\"],\"P3P\":[\"CP=\\\"IDC DSP COR ADM DEVi TAIi PSA PSD IVAi IVDi CONi HIS OUR IND CNT\\\"\"],\"Response-Id\":[\"5dd88a80-c2a4-423b-b476-fbd3d1ab9940\"],\"Server\":[\"nginx\"],\"Vary\":[\"X-Session-Key\"],\"X-Frame-Options\":[\"SAMEORIGIN\"],\"X-Rate-Limit-Limit\":[\"10000\"],\"X-Rate-Limit-Remaining\":[\"9992\"],\"X-Rate-Limit-Reset\":[\"1574472600\"],\"X-Session-Key\":[\"anonymous\"],\"X-Zapier-Fast-Return\":[\"true\"],\"X-Zapier-Jobs\":[\"A hacker like yourself should consider working at Zapier!\"],\"X-Zapier-Jobs-Link\":[\"https://zapier.com/jobs/\"],\"X-Zapier-Revision\":[\"2de592c1e299331a949c24a1109a81780e726be2\"],\"Content-Length\":[\"172\"],\"Connection\":[\"keep-alive\"]}', '{\"status\": \"success\", \"attempt\": \"5dd88a80-c2a4-423b-b476-fbd3d1ab9940\", \"id\": \"9c76035c-162d-4bbd-893f-8181c2a9bcaa\", \"request_id\": \"5dd88a80-c2a4-423b-b476-fbd3d1ab9940\"}', 1015, '2019-11-23 01:25:17', '2019-11-23 01:25:19', 'fa98a621-fefb-46ff-baeb-679d65b1fbb9'),
(21, 1, 'done', 1, 'post', 'https://hooks.zapier.com/hooks/catch/6128230/o4x908w/', '{\"Content-Type\":\"application/json\"}', '{\"time\":\"2019-11-22T17:25:17-08:00\",\"name\":\"afterSave\",\"entry\":{\"class\":\"craft\\\\elements\\\\MatrixBlock\",\"id\":\"9\",\"title\":null,\"slug\":null,\"isNew\":false,\"description\":\"wow new cool title\"}}', 200, '{\"Access-Control-Allow-Origin\":[\"*\"],\"Content-Type\":[\"application/json\"],\"Date\":[\"Sat, 23 Nov 2019 01:25:21 GMT\"],\"P3P\":[\"CP=\\\"IDC DSP COR ADM DEVi TAIi PSA PSD IVAi IVDi CONi HIS OUR IND CNT\\\"\"],\"Response-Id\":[\"5dd88a81-bc25-4f62-86f6-cb6cb745f5d0\"],\"Server\":[\"nginx\"],\"Vary\":[\"X-Session-Key\"],\"X-Frame-Options\":[\"SAMEORIGIN\"],\"X-Rate-Limit-Limit\":[\"10000\"],\"X-Rate-Limit-Remaining\":[\"9991\"],\"X-Rate-Limit-Reset\":[\"1574472600\"],\"X-Session-Key\":[\"anonymous\"],\"X-Zapier-Fast-Return\":[\"true\"],\"X-Zapier-Jobs\":[\"A hacker like yourself should consider working at Zapier!\"],\"X-Zapier-Jobs-Link\":[\"https://zapier.com/jobs/\"],\"X-Zapier-Revision\":[\"2de592c1e299331a949c24a1109a81780e726be2\"],\"Content-Length\":[\"172\"],\"Connection\":[\"keep-alive\"]}', '{\"status\": \"success\", \"attempt\": \"5dd88a81-bc25-4f62-86f6-cb6cb745f5d0\", \"id\": \"9039fa2d-9280-4269-8c68-b773ed16d44b\", \"request_id\": \"5dd88a81-bc25-4f62-86f6-cb6cb745f5d0\"}', 974, '2019-11-23 01:25:17', '2019-11-23 01:25:20', '9c9ef092-0354-479f-ac7c-d272cac21439'),
(22, 1, 'done', 1, 'post', 'https://hooks.zapier.com/hooks/catch/6128230/o4x908w/', '{\"Content-Type\":\"application/json\"}', '{\"time\":\"2019-11-22T17:25:17-08:00\",\"name\":\"afterSave\",\"entry\":{\"class\":\"craft\\\\elements\\\\MatrixBlock\",\"id\":\"11\",\"title\":null,\"slug\":null,\"isNew\":false,\"description\":\"Hello!\"}}', 200, '{\"Access-Control-Allow-Origin\":[\"*\"],\"Content-Type\":[\"application/json\"],\"Date\":[\"Sat, 23 Nov 2019 01:25:22 GMT\"],\"P3P\":[\"CP=\\\"IDC DSP COR ADM DEVi TAIi PSA PSD IVAi IVDi CONi HIS OUR IND CNT\\\"\"],\"Response-Id\":[\"5dd88a82-ed53-4d48-99df-4afc703daa50\"],\"Server\":[\"nginx\"],\"Vary\":[\"X-Session-Key\"],\"X-Frame-Options\":[\"SAMEORIGIN\"],\"X-Rate-Limit-Limit\":[\"10000\"],\"X-Rate-Limit-Remaining\":[\"9990\"],\"X-Rate-Limit-Reset\":[\"1574472600\"],\"X-Session-Key\":[\"anonymous\"],\"X-Zapier-Fast-Return\":[\"true\"],\"X-Zapier-Jobs\":[\"A hacker like yourself should consider working at Zapier!\"],\"X-Zapier-Jobs-Link\":[\"https://zapier.com/jobs/\"],\"X-Zapier-Revision\":[\"2de592c1e299331a949c24a1109a81780e726be2\"],\"Content-Length\":[\"172\"],\"Connection\":[\"keep-alive\"]}', '{\"status\": \"success\", \"attempt\": \"5dd88a82-ed53-4d48-99df-4afc703daa50\", \"id\": \"8e095768-05ce-456a-a1d4-39a4cce2830b\", \"request_id\": \"5dd88a82-ed53-4d48-99df-4afc703daa50\"}', 833, '2019-11-23 01:25:17', '2019-11-23 01:25:21', 'acf024c9-0a99-40fb-9d1b-dd7bb9b19592'),
(23, 1, 'done', 1, 'post', 'https://hooks.zapier.com/hooks/catch/6128230/o4x908w/', '{\"Content-Type\":\"application/json\"}', '{\"time\":\"2019-11-22T17:25:17-08:00\",\"name\":\"afterSave\",\"entry\":{\"class\":\"craft\\\\elements\\\\MatrixBlock\",\"id\":\"102\",\"title\":null,\"slug\":null,\"isNew\":false,\"description\":\"testy\"}}', 200, '{\"Access-Control-Allow-Origin\":[\"*\"],\"Content-Type\":[\"application/json\"],\"Date\":[\"Sat, 23 Nov 2019 01:25:23 GMT\"],\"P3P\":[\"CP=\\\"IDC DSP COR ADM DEVi TAIi PSA PSD IVAi IVDi CONi HIS OUR IND CNT\\\"\"],\"Response-Id\":[\"5dd88a83-3ab1-46c2-8fa0-9d6916c3b800\"],\"Server\":[\"nginx\"],\"Vary\":[\"X-Session-Key\"],\"X-Frame-Options\":[\"SAMEORIGIN\"],\"X-Rate-Limit-Limit\":[\"10000\"],\"X-Rate-Limit-Remaining\":[\"9989\"],\"X-Rate-Limit-Reset\":[\"1574472600\"],\"X-Session-Key\":[\"anonymous\"],\"X-Zapier-Fast-Return\":[\"true\"],\"X-Zapier-Jobs\":[\"A hacker like yourself should consider working at Zapier!\"],\"X-Zapier-Jobs-Link\":[\"https://zapier.com/jobs/\"],\"X-Zapier-Revision\":[\"2de592c1e299331a949c24a1109a81780e726be2\"],\"Content-Length\":[\"172\"],\"Connection\":[\"keep-alive\"]}', '{\"status\": \"success\", \"attempt\": \"5dd88a83-3ab1-46c2-8fa0-9d6916c3b800\", \"id\": \"3f72da19-c8c2-483b-8ca3-0cdf36b788cc\", \"request_id\": \"5dd88a83-3ab1-46c2-8fa0-9d6916c3b800\"}', 852, '2019-11-23 01:25:17', '2019-11-23 01:25:22', '5b0a3cb2-0160-4307-9e67-ee2535ab2f90'),
(24, 1, 'done', 1, 'post', 'https://hooks.zapier.com/hooks/catch/6128230/o4x908w/', '{\"Content-Type\":\"application/json\"}', '{\"time\":\"2019-11-22T17:25:17-08:00\",\"name\":\"afterSave\",\"entry\":{\"class\":\"craft\\\\elements\\\\MatrixBlock\",\"id\":109,\"title\":null,\"slug\":null,\"isNew\":true,\"description\":\"newwwwwwww\"}}', 200, '{\"Access-Control-Allow-Origin\":[\"*\"],\"Content-Type\":[\"application/json\"],\"Date\":[\"Sat, 23 Nov 2019 01:25:23 GMT\"],\"P3P\":[\"CP=\\\"IDC DSP COR ADM DEVi TAIi PSA PSD IVAi IVDi CONi HIS OUR IND CNT\\\"\"],\"Response-Id\":[\"5dd88a83-5078-4171-8d85-c10977ca4ef0\"],\"Server\":[\"nginx\"],\"Vary\":[\"X-Session-Key\"],\"X-Frame-Options\":[\"SAMEORIGIN\"],\"X-Rate-Limit-Limit\":[\"10000\"],\"X-Rate-Limit-Remaining\":[\"9988\"],\"X-Rate-Limit-Reset\":[\"1574472600\"],\"X-Session-Key\":[\"anonymous\"],\"X-Zapier-Fast-Return\":[\"true\"],\"X-Zapier-Jobs\":[\"A hacker like yourself should consider working at Zapier!\"],\"X-Zapier-Jobs-Link\":[\"https://zapier.com/jobs/\"],\"X-Zapier-Revision\":[\"2de592c1e299331a949c24a1109a81780e726be2\"],\"Content-Length\":[\"172\"],\"Connection\":[\"keep-alive\"]}', '{\"status\": \"success\", \"attempt\": \"5dd88a83-5078-4171-8d85-c10977ca4ef0\", \"id\": \"736517ce-89ba-47c4-9070-6597c7e313fb\", \"request_id\": \"5dd88a83-5078-4171-8d85-c10977ca4ef0\"}', 834, '2019-11-23 01:25:17', '2019-11-23 01:25:23', 'b313e32a-c1cc-481b-ae2f-b4105b662a8a'),
(25, 1, 'done', 1, 'post', 'https://hooks.zapier.com/hooks/catch/6128230/o4x908w/', '{\"Content-Type\":\"application/json\"}', '{\"time\":\"2019-11-22T17:25:17-08:00\",\"name\":\"afterSave\",\"entry\":{\"class\":\"craft\\\\elements\\\\Entry\",\"id\":110,\"title\":\"Home\",\"slug\":\"home\",\"isNew\":true,\"description\":null}}', 200, '{\"Access-Control-Allow-Origin\":[\"*\"],\"Content-Type\":[\"application/json\"],\"Date\":[\"Sat, 23 Nov 2019 01:25:24 GMT\"],\"P3P\":[\"CP=\\\"IDC DSP COR ADM DEVi TAIi PSA PSD IVAi IVDi CONi HIS OUR IND CNT\\\"\"],\"Response-Id\":[\"5dd88a84-f550-4c04-87c3-27ed8ea175f0\"],\"Server\":[\"nginx\"],\"Vary\":[\"X-Session-Key\"],\"X-Frame-Options\":[\"SAMEORIGIN\"],\"X-Rate-Limit-Limit\":[\"10000\"],\"X-Rate-Limit-Remaining\":[\"9987\"],\"X-Rate-Limit-Reset\":[\"1574472600\"],\"X-Session-Key\":[\"anonymous\"],\"X-Zapier-Fast-Return\":[\"true\"],\"X-Zapier-Jobs\":[\"A hacker like yourself should consider working at Zapier!\"],\"X-Zapier-Jobs-Link\":[\"https://zapier.com/jobs/\"],\"X-Zapier-Revision\":[\"2de592c1e299331a949c24a1109a81780e726be2\"],\"Content-Length\":[\"172\"],\"Connection\":[\"keep-alive\"]}', '{\"status\": \"success\", \"attempt\": \"5dd88a84-f550-4c04-87c3-27ed8ea175f0\", \"id\": \"380796b5-ac9c-467a-97e3-f9756edf89d6\", \"request_id\": \"5dd88a84-f550-4c04-87c3-27ed8ea175f0\"}', 894, '2019-11-23 01:25:17', '2019-11-23 01:25:24', '3b581587-0c81-4fbf-8388-d2a9f970704d'),
(26, 1, 'done', 1, 'post', 'https://hooks.zapier.com/hooks/catch/6128230/o4x908w/', '{\"Content-Type\":\"application/json\"}', '{\"time\":\"2019-11-22T17:25:17-08:00\",\"name\":\"afterSave\",\"entry\":{\"class\":\"craft\\\\elements\\\\MatrixBlock\",\"id\":111,\"title\":null,\"slug\":null,\"isNew\":true,\"description\":\"wow new cool title newer!!\"}}', 200, '{\"Access-Control-Allow-Origin\":[\"*\"],\"Content-Type\":[\"application/json\"],\"Date\":[\"Sat, 23 Nov 2019 01:25:25 GMT\"],\"P3P\":[\"CP=\\\"IDC DSP COR ADM DEVi TAIi PSA PSD IVAi IVDi CONi HIS OUR IND CNT\\\"\"],\"Response-Id\":[\"5dd88a85-994e-4817-9607-c27c199f72a0\"],\"Server\":[\"nginx\"],\"Vary\":[\"X-Session-Key\"],\"X-Frame-Options\":[\"SAMEORIGIN\"],\"X-Rate-Limit-Limit\":[\"10000\"],\"X-Rate-Limit-Remaining\":[\"9986\"],\"X-Rate-Limit-Reset\":[\"1574472600\"],\"X-Session-Key\":[\"anonymous\"],\"X-Zapier-Fast-Return\":[\"true\"],\"X-Zapier-Jobs\":[\"A hacker like yourself should consider working at Zapier!\"],\"X-Zapier-Jobs-Link\":[\"https://zapier.com/jobs/\"],\"X-Zapier-Revision\":[\"2de592c1e299331a949c24a1109a81780e726be2\"],\"Content-Length\":[\"172\"],\"Connection\":[\"keep-alive\"]}', '{\"status\": \"success\", \"attempt\": \"5dd88a85-994e-4817-9607-c27c199f72a0\", \"id\": \"018be434-f4a9-486e-a943-869bcfc4ec0e\", \"request_id\": \"5dd88a85-994e-4817-9607-c27c199f72a0\"}', 920, '2019-11-23 01:25:17', '2019-11-23 01:25:24', '1ae84ca5-ffc4-4da3-ba99-ceb604321ff0'),
(27, 1, 'done', 1, 'post', 'https://hooks.zapier.com/hooks/catch/6128230/o4x908w/', '{\"Content-Type\":\"application/json\"}', '{\"time\":\"2019-11-22T17:25:17-08:00\",\"name\":\"afterSave\",\"entry\":{\"class\":\"craft\\\\elements\\\\MatrixBlock\",\"id\":112,\"title\":null,\"slug\":null,\"isNew\":true,\"description\":\"wow new cool title\"}}', 200, '{\"Access-Control-Allow-Origin\":[\"*\"],\"Content-Type\":[\"application/json\"],\"Date\":[\"Sat, 23 Nov 2019 01:25:26 GMT\"],\"P3P\":[\"CP=\\\"IDC DSP COR ADM DEVi TAIi PSA PSD IVAi IVDi CONi HIS OUR IND CNT\\\"\"],\"Response-Id\":[\"5dd88a86-8280-4293-9411-32124b5d7260\"],\"Server\":[\"nginx\"],\"Vary\":[\"X-Session-Key\"],\"X-Frame-Options\":[\"SAMEORIGIN\"],\"X-Rate-Limit-Limit\":[\"10000\"],\"X-Rate-Limit-Remaining\":[\"9985\"],\"X-Rate-Limit-Reset\":[\"1574472600\"],\"X-Session-Key\":[\"anonymous\"],\"X-Zapier-Fast-Return\":[\"true\"],\"X-Zapier-Jobs\":[\"A hacker like yourself should consider working at Zapier!\"],\"X-Zapier-Jobs-Link\":[\"https://zapier.com/jobs/\"],\"X-Zapier-Revision\":[\"2de592c1e299331a949c24a1109a81780e726be2\"],\"Content-Length\":[\"172\"],\"Connection\":[\"keep-alive\"]}', '{\"status\": \"success\", \"attempt\": \"5dd88a86-8280-4293-9411-32124b5d7260\", \"id\": \"27302518-d237-4148-b114-6c00e8e40b2e\", \"request_id\": \"5dd88a86-8280-4293-9411-32124b5d7260\"}', 1113, '2019-11-23 01:25:17', '2019-11-23 01:25:25', 'c058d427-2333-49f7-994e-0d5a5cf6c96e'),
(28, 1, 'done', 1, 'post', 'https://hooks.zapier.com/hooks/catch/6128230/o4x908w/', '{\"Content-Type\":\"application/json\"}', '{\"time\":\"2019-11-22T17:25:17-08:00\",\"name\":\"afterSave\",\"entry\":{\"class\":\"craft\\\\elements\\\\MatrixBlock\",\"id\":113,\"title\":null,\"slug\":null,\"isNew\":true,\"description\":\"Hello!\"}}', 200, '{\"Access-Control-Allow-Origin\":[\"*\"],\"Content-Type\":[\"application/json\"],\"Date\":[\"Sat, 23 Nov 2019 01:25:27 GMT\"],\"P3P\":[\"CP=\\\"IDC DSP COR ADM DEVi TAIi PSA PSD IVAi IVDi CONi HIS OUR IND CNT\\\"\"],\"Response-Id\":[\"5dd88a87-9c5f-43f6-885f-abcd8fce6610\"],\"Server\":[\"nginx\"],\"Vary\":[\"X-Session-Key\"],\"X-Frame-Options\":[\"SAMEORIGIN\"],\"X-Rate-Limit-Limit\":[\"10000\"],\"X-Rate-Limit-Remaining\":[\"9984\"],\"X-Rate-Limit-Reset\":[\"1574472600\"],\"X-Session-Key\":[\"anonymous\"],\"X-Zapier-Fast-Return\":[\"true\"],\"X-Zapier-Jobs\":[\"A hacker like yourself should consider working at Zapier!\"],\"X-Zapier-Jobs-Link\":[\"https://zapier.com/jobs/\"],\"X-Zapier-Revision\":[\"2de592c1e299331a949c24a1109a81780e726be2\"],\"Content-Length\":[\"172\"],\"Connection\":[\"keep-alive\"]}', '{\"status\": \"success\", \"attempt\": \"5dd88a87-9c5f-43f6-885f-abcd8fce6610\", \"id\": \"8884bc43-2793-4627-948a-09f289d611ac\", \"request_id\": \"5dd88a87-9c5f-43f6-885f-abcd8fce6610\"}', 1122, '2019-11-23 01:25:17', '2019-11-23 01:25:26', '408c7f55-0c11-4bed-b660-9eabb529f282'),
(29, 1, 'done', 1, 'post', 'https://hooks.zapier.com/hooks/catch/6128230/o4x908w/', '{\"Content-Type\":\"application/json\"}', '{\"time\":\"2019-11-22T17:25:17-08:00\",\"name\":\"afterSave\",\"entry\":{\"class\":\"craft\\\\elements\\\\MatrixBlock\",\"id\":114,\"title\":null,\"slug\":null,\"isNew\":true,\"description\":\"testy\"}}', 200, '{\"Access-Control-Allow-Origin\":[\"*\"],\"Content-Type\":[\"application/json\"],\"Date\":[\"Sat, 23 Nov 2019 01:25:28 GMT\"],\"P3P\":[\"CP=\\\"IDC DSP COR ADM DEVi TAIi PSA PSD IVAi IVDi CONi HIS OUR IND CNT\\\"\"],\"Response-Id\":[\"5dd88a88-0120-482f-9c4c-cc5baad339f0\"],\"Server\":[\"nginx\"],\"Vary\":[\"X-Session-Key\"],\"X-Frame-Options\":[\"SAMEORIGIN\"],\"X-Rate-Limit-Limit\":[\"10000\"],\"X-Rate-Limit-Remaining\":[\"9983\"],\"X-Rate-Limit-Reset\":[\"1574472600\"],\"X-Session-Key\":[\"anonymous\"],\"X-Zapier-Fast-Return\":[\"true\"],\"X-Zapier-Jobs\":[\"A hacker like yourself should consider working at Zapier!\"],\"X-Zapier-Jobs-Link\":[\"https://zapier.com/jobs/\"],\"X-Zapier-Revision\":[\"2de592c1e299331a949c24a1109a81780e726be2\"],\"Content-Length\":[\"172\"],\"Connection\":[\"keep-alive\"]}', '{\"status\": \"success\", \"attempt\": \"5dd88a88-0120-482f-9c4c-cc5baad339f0\", \"id\": \"97b6df93-e082-48a7-a254-98bc1a2af578\", \"request_id\": \"5dd88a88-0120-482f-9c4c-cc5baad339f0\"}', 930, '2019-11-23 01:25:17', '2019-11-23 01:25:28', 'df4303df-2ab9-4d9b-9ae0-e2ca30fbb4ad'),
(30, 1, 'done', 1, 'post', 'https://hooks.zapier.com/hooks/catch/6128230/o4x908w/', '{\"Content-Type\":\"application/json\"}', '{\"time\":\"2019-11-22T17:25:17-08:00\",\"name\":\"afterSave\",\"entry\":{\"class\":\"craft\\\\elements\\\\MatrixBlock\",\"id\":115,\"title\":null,\"slug\":null,\"isNew\":true,\"description\":\"newwwwwwww\"}}', 200, '{\"Access-Control-Allow-Origin\":[\"*\"],\"Content-Type\":[\"application/json\"],\"Date\":[\"Sat, 23 Nov 2019 01:25:29 GMT\"],\"P3P\":[\"CP=\\\"IDC DSP COR ADM DEVi TAIi PSA PSD IVAi IVDi CONi HIS OUR IND CNT\\\"\"],\"Response-Id\":[\"5dd88a89-24c1-4973-89e6-c2c49d4aae20\"],\"Server\":[\"nginx\"],\"Vary\":[\"X-Session-Key\"],\"X-Frame-Options\":[\"SAMEORIGIN\"],\"X-Rate-Limit-Limit\":[\"10000\"],\"X-Rate-Limit-Remaining\":[\"9982\"],\"X-Rate-Limit-Reset\":[\"1574472600\"],\"X-Session-Key\":[\"anonymous\"],\"X-Zapier-Fast-Return\":[\"true\"],\"X-Zapier-Jobs\":[\"A hacker like yourself should consider working at Zapier!\"],\"X-Zapier-Jobs-Link\":[\"https://zapier.com/jobs/\"],\"X-Zapier-Revision\":[\"2de592c1e299331a949c24a1109a81780e726be2\"],\"Content-Length\":[\"172\"],\"Connection\":[\"keep-alive\"]}', '{\"status\": \"success\", \"attempt\": \"5dd88a89-24c1-4973-89e6-c2c49d4aae20\", \"id\": \"ee88b5a7-2824-4d0f-8ad3-ce10c8536438\", \"request_id\": \"5dd88a89-24c1-4973-89e6-c2c49d4aae20\"}', 1003, '2019-11-23 01:25:17', '2019-11-23 01:25:29', '887c7140-cec8-45cc-a4a5-9ad28b9b384a'),
(31, 1, 'done', 1, 'post', 'https://hooks.zapier.com/hooks/catch/6128230/o4x908w/', '{\"Content-Type\":\"application/json\"}', '{\"time\":\"2019-11-22T17:32:29-08:00\",\"name\":\"afterSave\",\"entry\":{\"class\":\"craft\\\\elements\\\\Entry\",\"id\":116,\"title\":null,\"slug\":\"__temp_JwE9I2TodDxPZVpx312puYZk8HDKSBmHmox6\",\"isNew\":true,\"description\":null}}', 200, '{\"Access-Control-Allow-Origin\":[\"*\"],\"Content-Type\":[\"application/json\"],\"Date\":[\"Sat, 23 Nov 2019 01:32:31 GMT\"],\"P3P\":[\"CP=\\\"IDC DSP COR ADM DEVi TAIi PSA PSD IVAi IVDi CONi HIS OUR IND CNT\\\"\"],\"Response-Id\":[\"5dd88c2f-cdc0-4ef8-8634-58323f70c760\"],\"Server\":[\"nginx\"],\"Vary\":[\"X-Session-Key\"],\"X-Frame-Options\":[\"SAMEORIGIN\"],\"X-Rate-Limit-Limit\":[\"10000\"],\"X-Rate-Limit-Remaining\":[\"9999\"],\"X-Rate-Limit-Reset\":[\"1574473200\"],\"X-Session-Key\":[\"anonymous\"],\"X-Zapier-Fast-Return\":[\"true\"],\"X-Zapier-Jobs\":[\"A hacker like yourself should consider working at Zapier!\"],\"X-Zapier-Jobs-Link\":[\"https://zapier.com/jobs/\"],\"X-Zapier-Revision\":[\"2de592c1e299331a949c24a1109a81780e726be2\"],\"Content-Length\":[\"172\"],\"Connection\":[\"keep-alive\"]}', '{\"status\": \"success\", \"attempt\": \"5dd88c2f-cdc0-4ef8-8634-58323f70c760\", \"id\": \"28d9938f-036a-4381-9072-797c48fbffb1\", \"request_id\": \"5dd88c2f-cdc0-4ef8-8634-58323f70c760\"}', 957, '2019-11-23 01:32:29', '2019-11-23 01:32:30', '08f96653-e7c7-4aa6-8131-94f9f5e9c59d'),
(32, 1, 'done', 1, 'post', 'https://hooks.zapier.com/hooks/catch/6128230/o4x908w/', '{\"Content-Type\":\"application/json\"}', '{\"time\":\"2019-11-22T17:32:36-08:00\",\"name\":\"afterSave\",\"entry\":{\"class\":\"craft\\\\elements\\\\Entry\",\"id\":\"116\",\"title\":\"Salmon \",\"slug\":\"salmon\",\"isNew\":false,\"description\":null}}', 200, '{\"Access-Control-Allow-Origin\":[\"*\"],\"Content-Type\":[\"application/json\"],\"Date\":[\"Sat, 23 Nov 2019 01:32:45 GMT\"],\"P3P\":[\"CP=\\\"IDC DSP COR ADM DEVi TAIi PSA PSD IVAi IVDi CONi HIS OUR IND CNT\\\"\"],\"Response-Id\":[\"5dd88c3d-c9b6-4eb6-8b43-5c1954b57340\"],\"Server\":[\"nginx\"],\"Vary\":[\"X-Session-Key\"],\"X-Frame-Options\":[\"SAMEORIGIN\"],\"X-Rate-Limit-Limit\":[\"10000\"],\"X-Rate-Limit-Remaining\":[\"9998\"],\"X-Rate-Limit-Reset\":[\"1574473200\"],\"X-Session-Key\":[\"anonymous\"],\"X-Zapier-Fast-Return\":[\"true\"],\"X-Zapier-Jobs\":[\"A hacker like yourself should consider working at Zapier!\"],\"X-Zapier-Jobs-Link\":[\"https://zapier.com/jobs/\"],\"X-Zapier-Revision\":[\"2de592c1e299331a949c24a1109a81780e726be2\"],\"Content-Length\":[\"172\"],\"Connection\":[\"keep-alive\"]}', '{\"status\": \"success\", \"attempt\": \"5dd88c3d-c9b6-4eb6-8b43-5c1954b57340\", \"id\": \"c1c70506-d113-4a6a-800f-ccbb0e03e4dc\", \"request_id\": \"5dd88c3d-c9b6-4eb6-8b43-5c1954b57340\"}', 953, '2019-11-23 01:32:36', '2019-11-23 01:32:44', '12a7f8cc-c576-4800-9881-516905c1dfd0'),
(33, 1, 'done', 1, 'post', 'https://hooks.zapier.com/hooks/catch/6128230/o4x908w/', '{\"Content-Type\":\"application/json\"}', '{\"time\":\"2019-11-22T17:32:38-08:00\",\"name\":\"afterSave\",\"entry\":{\"class\":\"craft\\\\elements\\\\Entry\",\"id\":\"116\",\"title\":\"Salmon is in!\",\"slug\":\"salmon-is-in\",\"isNew\":false,\"description\":null}}', 200, '{\"Access-Control-Allow-Origin\":[\"*\"],\"Content-Type\":[\"application/json\"],\"Date\":[\"Sat, 23 Nov 2019 01:32:46 GMT\"],\"P3P\":[\"CP=\\\"IDC DSP COR ADM DEVi TAIi PSA PSD IVAi IVDi CONi HIS OUR IND CNT\\\"\"],\"Response-Id\":[\"5dd88c3e-aadc-4325-b7f6-0ed25125ea60\"],\"Server\":[\"nginx\"],\"Vary\":[\"X-Session-Key\"],\"X-Frame-Options\":[\"SAMEORIGIN\"],\"X-Rate-Limit-Limit\":[\"10000\"],\"X-Rate-Limit-Remaining\":[\"9997\"],\"X-Rate-Limit-Reset\":[\"1574473200\"],\"X-Session-Key\":[\"anonymous\"],\"X-Zapier-Fast-Return\":[\"true\"],\"X-Zapier-Jobs\":[\"A hacker like yourself should consider working at Zapier!\"],\"X-Zapier-Jobs-Link\":[\"https://zapier.com/jobs/\"],\"X-Zapier-Revision\":[\"2de592c1e299331a949c24a1109a81780e726be2\"],\"Content-Length\":[\"172\"],\"Connection\":[\"keep-alive\"]}', '{\"status\": \"success\", \"attempt\": \"5dd88c3e-aadc-4325-b7f6-0ed25125ea60\", \"id\": \"abb12a06-21cb-40a2-b9b0-464989bb82c1\", \"request_id\": \"5dd88c3e-aadc-4325-b7f6-0ed25125ea60\"}', 1107, '2019-11-23 01:32:38', '2019-11-23 01:32:45', '0ff1d621-c190-4d2b-a516-4202631e7c7f'),
(34, 1, 'done', 1, 'post', 'https://hooks.zapier.com/hooks/catch/6128230/o4x908w/', '{\"Content-Type\":\"application/json\"}', '{\"time\":\"2019-11-22T17:41:52-08:00\",\"name\":\"afterSave\",\"entry\":{\"class\":\"craft\\\\elements\\\\MatrixBlock\",\"id\":135,\"title\":\"enwewe\",\"slug\":null,\"isNew\":true,\"description\":\"ewnenwenw\",\"products\":null}}', 200, '{\"Access-Control-Allow-Origin\":[\"*\"],\"Content-Type\":[\"application/json\"],\"Date\":[\"Sat, 23 Nov 2019 01:41:54 GMT\"],\"P3P\":[\"CP=\\\"IDC DSP COR ADM DEVi TAIi PSA PSD IVAi IVDi CONi HIS OUR IND CNT\\\"\"],\"Response-Id\":[\"5dd88e62-96e4-4026-a52b-e3e25803e1f0\"],\"Server\":[\"nginx\"],\"Vary\":[\"X-Session-Key\"],\"X-Frame-Options\":[\"SAMEORIGIN\"],\"X-Rate-Limit-Limit\":[\"10000\"],\"X-Rate-Limit-Remaining\":[\"9999\"],\"X-Rate-Limit-Reset\":[\"1574473800\"],\"X-Session-Key\":[\"anonymous\"],\"X-Zapier-Fast-Return\":[\"true\"],\"X-Zapier-Jobs\":[\"A hacker like yourself should consider working at Zapier!\"],\"X-Zapier-Jobs-Link\":[\"https://zapier.com/jobs/\"],\"X-Zapier-Revision\":[\"2de592c1e299331a949c24a1109a81780e726be2\"],\"Content-Length\":[\"172\"],\"Connection\":[\"keep-alive\"]}', '{\"status\": \"success\", \"attempt\": \"5dd88e62-96e4-4026-a52b-e3e25803e1f0\", \"id\": \"91b0e483-099c-4ea3-b411-4807bfe5ffcf\", \"request_id\": \"5dd88e62-96e4-4026-a52b-e3e25803e1f0\"}', 969, '2019-11-23 01:41:52', '2019-11-23 01:41:53', '645cc161-5dd1-47c2-a7cc-e54b647c8e50'),
(35, 1, 'done', 1, 'post', 'https://hooks.zapier.com/hooks/catch/6128230/o4x908w/', '{\"Content-Type\":\"application/json\"}', '{\"time\":\"2019-11-22T18:37:30-08:00\",\"user\":\"admin\",\"name\":\"afterSave\",\"entry\":{\"class\":\"craft\\\\elements\\\\MatrixBlock\",\"id\":191,\"title\":null,\"slug\":null,\"isNew\":true}}', 200, '{\"Access-Control-Allow-Origin\":[\"*\"],\"Content-Type\":[\"application/json\"],\"Date\":[\"Sat, 23 Nov 2019 02:37:32 GMT\"],\"P3P\":[\"CP=\\\"IDC DSP COR ADM DEVi TAIi PSA PSD IVAi IVDi CONi HIS OUR IND CNT\\\"\"],\"Response-Id\":[\"5dd89b6c-b014-4bb1-94b0-ab4ad9eb75c0\"],\"Server\":[\"nginx\"],\"Vary\":[\"X-Session-Key\"],\"X-Frame-Options\":[\"SAMEORIGIN\"],\"X-Rate-Limit-Limit\":[\"10000\"],\"X-Rate-Limit-Remaining\":[\"9999\"],\"X-Rate-Limit-Reset\":[\"1574477100\"],\"X-Session-Key\":[\"anonymous\"],\"X-Zapier-Fast-Return\":[\"true\"],\"X-Zapier-Jobs\":[\"A hacker like yourself should consider working at Zapier!\"],\"X-Zapier-Jobs-Link\":[\"https://zapier.com/jobs/\"],\"X-Zapier-Revision\":[\"ee5cc25ab1d66dbf967afa39ba28cb1f79390169\"],\"Content-Length\":[\"172\"],\"Connection\":[\"keep-alive\"]}', '{\"status\": \"success\", \"attempt\": \"5dd89b6c-b014-4bb1-94b0-ab4ad9eb75c0\", \"id\": \"64363c18-ee67-4151-a46a-6565d02b57d5\", \"request_id\": \"5dd89b6c-b014-4bb1-94b0-ab4ad9eb75c0\"}', 1028, '2019-11-23 02:37:30', '2019-11-23 02:37:31', '8bba3e1e-b975-4d7b-a172-f646114bff2a');
INSERT INTO `webhookrequests` (`id`, `webhookId`, `status`, `attempts`, `method`, `url`, `requestHeaders`, `requestBody`, `responseStatus`, `responseHeaders`, `responseBody`, `responseTime`, `dateCreated`, `dateRequested`, `uid`) VALUES
(36, 1, 'done', 2, 'post', 'https://hooks.zapier.com/hooks/catch/6128230/o4x908w/', '{\"Content-Type\":\"application/json\"}', '{\"time\":\"2019-11-22T18:38:30-08:00\",\"user\":\"admin\",\"name\":\"afterSave\",\"entry\":{\"class\":\"craft\\\\elements\\\\MatrixBlock\",\"id\":205,\"title\":null,\"slug\":null,\"isNew\":true}}', 200, '{\"Access-Control-Allow-Origin\":[\"*\"],\"Content-Type\":[\"application/json\"],\"Date\":[\"Sat, 23 Nov 2019 05:57:56 GMT\"],\"P3P\":[\"CP=\\\"IDC DSP COR ADM DEVi TAIi PSA PSD IVAi IVDi CONi HIS OUR IND CNT\\\"\"],\"Response-Id\":[\"5dd8ca64-1446-4337-b3a3-8f9d0f368b00\"],\"Server\":[\"nginx\"],\"Vary\":[\"X-Session-Key\"],\"X-Frame-Options\":[\"SAMEORIGIN\"],\"X-Rate-Limit-Limit\":[\"10000\"],\"X-Rate-Limit-Remaining\":[\"9999\"],\"X-Rate-Limit-Reset\":[\"1574489100\"],\"X-Session-Key\":[\"anonymous\"],\"X-Zapier-Fast-Return\":[\"true\"],\"X-Zapier-Jobs\":[\"A hacker like yourself should consider working at Zapier!\"],\"X-Zapier-Jobs-Link\":[\"https://zapier.com/jobs/\"],\"X-Zapier-Revision\":[\"a3f0f5a0e2f54d0ea7deec04bf25200b29167033\"],\"Content-Length\":[\"172\"],\"Connection\":[\"keep-alive\"]}', '{\"status\": \"success\", \"attempt\": \"5dd8ca64-1446-4337-b3a3-8f9d0f368b00\", \"id\": \"ec2c1855-3d19-42e6-900c-2954d690fd7f\", \"request_id\": \"5dd8ca64-1446-4337-b3a3-8f9d0f368b00\"}', 915, '2019-11-23 02:38:31', '2019-11-23 05:57:56', 'caae27cd-1436-4db0-a5c5-e36428f8333f'),
(37, 1, 'done', 1, 'post', 'https://hooks.zapier.com/hooks/catch/6128230/o4x908w/', '{\"Content-Type\":\"application/json\"}', '{\"time\":\"2019-11-22T22:01:37-08:00\",\"user\":\"admin\",\"name\":\"afterPropagate\",\"entry\":{\"class\":\"craft\\\\elements\\\\MatrixBlock\",\"id\":\"10\",\"title\":null,\"slug\":null,\"isNew\":false}}', 200, '{\"Access-Control-Allow-Origin\":[\"*\"],\"Content-Type\":[\"application/json\"],\"Date\":[\"Sat, 23 Nov 2019 06:01:39 GMT\"],\"P3P\":[\"CP=\\\"IDC DSP COR ADM DEVi TAIi PSA PSD IVAi IVDi CONi HIS OUR IND CNT\\\"\"],\"Response-Id\":[\"5dd8cb43-9d12-468d-8d60-2bf59d3072f0\"],\"Server\":[\"nginx\"],\"Vary\":[\"X-Session-Key\"],\"X-Frame-Options\":[\"SAMEORIGIN\"],\"X-Rate-Limit-Limit\":[\"10000\"],\"X-Rate-Limit-Remaining\":[\"9999\"],\"X-Rate-Limit-Reset\":[\"1574489400\"],\"X-Session-Key\":[\"anonymous\"],\"X-Zapier-Fast-Return\":[\"true\"],\"X-Zapier-Jobs\":[\"A hacker like yourself should consider working at Zapier!\"],\"X-Zapier-Jobs-Link\":[\"https://zapier.com/jobs/\"],\"X-Zapier-Revision\":[\"a3f0f5a0e2f54d0ea7deec04bf25200b29167033\"],\"Content-Length\":[\"172\"],\"Connection\":[\"keep-alive\"]}', '{\"status\": \"success\", \"attempt\": \"5dd8cb43-9d12-468d-8d60-2bf59d3072f0\", \"id\": \"3113e551-86e7-42f8-9589-8f2ea159eaa9\", \"request_id\": \"5dd8cb43-9d12-468d-8d60-2bf59d3072f0\"}', 959, '2019-11-23 06:01:37', '2019-11-23 06:01:38', 'eea56be0-0aaf-42de-bf29-a85330da08d8'),
(38, 1, 'done', 1, 'post', 'https://hooks.zapier.com/hooks/catch/6128230/o4x908w/', '{\"Content-Type\":\"application/json\"}', '{\"time\":\"2019-11-22T22:01:37-08:00\",\"user\":\"admin\",\"name\":\"afterPropagate\",\"entry\":{\"class\":\"craft\\\\elements\\\\MatrixBlock\",\"id\":378,\"title\":null,\"slug\":null,\"isNew\":true}}', 200, '{\"Access-Control-Allow-Origin\":[\"*\"],\"Content-Type\":[\"application/json\"],\"Date\":[\"Sat, 23 Nov 2019 06:01:40 GMT\"],\"P3P\":[\"CP=\\\"IDC DSP COR ADM DEVi TAIi PSA PSD IVAi IVDi CONi HIS OUR IND CNT\\\"\"],\"Response-Id\":[\"5dd8cb44-85e5-4d92-9b6a-d89d7305de50\"],\"Server\":[\"nginx\"],\"Vary\":[\"X-Session-Key\"],\"X-Frame-Options\":[\"SAMEORIGIN\"],\"X-Rate-Limit-Limit\":[\"10000\"],\"X-Rate-Limit-Remaining\":[\"9998\"],\"X-Rate-Limit-Reset\":[\"1574489400\"],\"X-Session-Key\":[\"anonymous\"],\"X-Zapier-Fast-Return\":[\"true\"],\"X-Zapier-Jobs\":[\"A hacker like yourself should consider working at Zapier!\"],\"X-Zapier-Jobs-Link\":[\"https://zapier.com/jobs/\"],\"X-Zapier-Revision\":[\"a3f0f5a0e2f54d0ea7deec04bf25200b29167033\"],\"Content-Length\":[\"172\"],\"Connection\":[\"keep-alive\"]}', '{\"status\": \"success\", \"attempt\": \"5dd8cb44-85e5-4d92-9b6a-d89d7305de50\", \"id\": \"36662531-a93b-42d4-b76e-0a418f05c226\", \"request_id\": \"5dd8cb44-85e5-4d92-9b6a-d89d7305de50\"}', 972, '2019-11-23 06:01:37', '2019-11-23 06:01:39', 'c43be71b-1659-4a92-bb26-9e6993def0bb'),
(39, 1, 'done', 1, 'post', 'https://hooks.zapier.com/hooks/catch/6128230/o4x908w/', '{\"Content-Type\":\"application/json\"}', '{\"time\":\"2019-11-22T22:01:37-08:00\",\"user\":\"admin\",\"name\":\"afterPropagate\",\"entry\":{\"class\":\"craft\\\\elements\\\\MatrixBlock\",\"id\":380,\"title\":null,\"slug\":null,\"isNew\":true}}', 200, '{\"Access-Control-Allow-Origin\":[\"*\"],\"Content-Type\":[\"application/json\"],\"Date\":[\"Sat, 23 Nov 2019 06:01:41 GMT\"],\"P3P\":[\"CP=\\\"IDC DSP COR ADM DEVi TAIi PSA PSD IVAi IVDi CONi HIS OUR IND CNT\\\"\"],\"Response-Id\":[\"5dd8cb45-0cea-4fee-b39c-ec3b09fadbf0\"],\"Server\":[\"nginx\"],\"Vary\":[\"X-Session-Key\"],\"X-Frame-Options\":[\"SAMEORIGIN\"],\"X-Rate-Limit-Limit\":[\"10000\"],\"X-Rate-Limit-Remaining\":[\"9997\"],\"X-Rate-Limit-Reset\":[\"1574489400\"],\"X-Session-Key\":[\"anonymous\"],\"X-Zapier-Fast-Return\":[\"true\"],\"X-Zapier-Jobs\":[\"A hacker like yourself should consider working at Zapier!\"],\"X-Zapier-Jobs-Link\":[\"https://zapier.com/jobs/\"],\"X-Zapier-Revision\":[\"a3f0f5a0e2f54d0ea7deec04bf25200b29167033\"],\"Content-Length\":[\"172\"],\"Connection\":[\"keep-alive\"]}', '{\"status\": \"success\", \"attempt\": \"5dd8cb45-0cea-4fee-b39c-ec3b09fadbf0\", \"id\": \"bc1a7e49-5813-4f88-a1cf-c6ae883173ae\", \"request_id\": \"5dd8cb45-0cea-4fee-b39c-ec3b09fadbf0\"}', 1007, '2019-11-23 06:01:37', '2019-11-23 06:01:40', '7863b61f-6775-4280-a801-dfb2c208b244'),
(40, 1, 'done', 1, 'post', 'https://hooks.zapier.com/hooks/catch/6128230/o4x908w/', '{\"Content-Type\":\"application/json\"}', '{\"time\":\"2019-11-22T22:01:37-08:00\",\"user\":\"admin\",\"name\":\"afterPropagate\",\"entry\":{\"class\":\"craft\\\\elements\\\\MatrixBlock\",\"id\":381,\"title\":null,\"slug\":null,\"isNew\":true}}', 200, '{\"Access-Control-Allow-Origin\":[\"*\"],\"Content-Type\":[\"application/json\"],\"Date\":[\"Sat, 23 Nov 2019 06:01:42 GMT\"],\"P3P\":[\"CP=\\\"IDC DSP COR ADM DEVi TAIi PSA PSD IVAi IVDi CONi HIS OUR IND CNT\\\"\"],\"Response-Id\":[\"5dd8cb46-e447-4a63-8b23-c4790daa0cb0\"],\"Server\":[\"nginx\"],\"Vary\":[\"X-Session-Key\"],\"X-Frame-Options\":[\"SAMEORIGIN\"],\"X-Rate-Limit-Limit\":[\"10000\"],\"X-Rate-Limit-Remaining\":[\"9996\"],\"X-Rate-Limit-Reset\":[\"1574489400\"],\"X-Session-Key\":[\"anonymous\"],\"X-Zapier-Fast-Return\":[\"true\"],\"X-Zapier-Jobs\":[\"A hacker like yourself should consider working at Zapier!\"],\"X-Zapier-Jobs-Link\":[\"https://zapier.com/jobs/\"],\"X-Zapier-Revision\":[\"a3f0f5a0e2f54d0ea7deec04bf25200b29167033\"],\"Content-Length\":[\"172\"],\"Connection\":[\"keep-alive\"]}', '{\"status\": \"success\", \"attempt\": \"5dd8cb46-e447-4a63-8b23-c4790daa0cb0\", \"id\": \"038d5882-5497-400a-a7df-67164cc34b24\", \"request_id\": \"5dd8cb46-e447-4a63-8b23-c4790daa0cb0\"}', 913, '2019-11-23 06:01:37', '2019-11-23 06:01:41', '0a9810c4-195d-4897-bb34-eef3cbee825f'),
(41, 1, 'done', 1, 'post', 'https://hooks.zapier.com/hooks/catch/6128230/o4x908w/', '{\"Content-Type\":\"application/json\"}', '{\"time\":\"2019-11-22T22:03:31-08:00\",\"user\":\"admin\",\"name\":\"afterPropagate\",\"entry\":{\"class\":\"craft\\\\elements\\\\MatrixBlock\",\"id\":\"10\",\"title\":null,\"slug\":null,\"isNew\":false}}', 200, '{\"Access-Control-Allow-Origin\":[\"*\"],\"Content-Type\":[\"application/json\"],\"Date\":[\"Sat, 23 Nov 2019 06:03:33 GMT\"],\"P3P\":[\"CP=\\\"IDC DSP COR ADM DEVi TAIi PSA PSD IVAi IVDi CONi HIS OUR IND CNT\\\"\"],\"Response-Id\":[\"5dd8cbb5-5f39-471c-80ce-a54e70d781e0\"],\"Server\":[\"nginx\"],\"Vary\":[\"X-Session-Key\"],\"X-Frame-Options\":[\"SAMEORIGIN\"],\"X-Rate-Limit-Limit\":[\"10000\"],\"X-Rate-Limit-Remaining\":[\"9995\"],\"X-Rate-Limit-Reset\":[\"1574489400\"],\"X-Session-Key\":[\"anonymous\"],\"X-Zapier-Fast-Return\":[\"true\"],\"X-Zapier-Jobs\":[\"A hacker like yourself should consider working at Zapier!\"],\"X-Zapier-Jobs-Link\":[\"https://zapier.com/jobs/\"],\"X-Zapier-Revision\":[\"a3f0f5a0e2f54d0ea7deec04bf25200b29167033\"],\"Content-Length\":[\"172\"],\"Connection\":[\"keep-alive\"]}', '{\"status\": \"success\", \"attempt\": \"5dd8cbb5-5f39-471c-80ce-a54e70d781e0\", \"id\": \"a469f655-253c-4634-adaf-3b34c3995cf4\", \"request_id\": \"5dd8cbb5-5f39-471c-80ce-a54e70d781e0\"}', 910, '2019-11-23 06:03:31', '2019-11-23 06:03:32', '11cd09a1-dc23-43b4-82fe-e84282264ef9'),
(42, 1, 'done', 1, 'post', 'https://hooks.zapier.com/hooks/catch/6128230/o4x908w/', '{\"Content-Type\":\"application/json\"}', '{\"time\":\"2019-11-22T22:03:31-08:00\",\"user\":\"admin\",\"name\":\"afterPropagate\",\"entry\":{\"class\":\"craft\\\\elements\\\\MatrixBlock\",\"id\":\"378\",\"title\":null,\"slug\":null,\"isNew\":false}}', 200, '{\"Access-Control-Allow-Origin\":[\"*\"],\"Content-Type\":[\"application/json\"],\"Date\":[\"Sat, 23 Nov 2019 06:03:35 GMT\"],\"P3P\":[\"CP=\\\"IDC DSP COR ADM DEVi TAIi PSA PSD IVAi IVDi CONi HIS OUR IND CNT\\\"\"],\"Response-Id\":[\"5dd8cbb7-3694-4afb-bfad-0d6e7eb2ea70\"],\"Server\":[\"nginx\"],\"Vary\":[\"X-Session-Key\"],\"X-Frame-Options\":[\"SAMEORIGIN\"],\"X-Rate-Limit-Limit\":[\"10000\"],\"X-Rate-Limit-Remaining\":[\"9994\"],\"X-Rate-Limit-Reset\":[\"1574489400\"],\"X-Session-Key\":[\"anonymous\"],\"X-Zapier-Fast-Return\":[\"true\"],\"X-Zapier-Jobs\":[\"A hacker like yourself should consider working at Zapier!\"],\"X-Zapier-Jobs-Link\":[\"https://zapier.com/jobs/\"],\"X-Zapier-Revision\":[\"a3f0f5a0e2f54d0ea7deec04bf25200b29167033\"],\"Content-Length\":[\"172\"],\"Connection\":[\"keep-alive\"]}', '{\"status\": \"success\", \"attempt\": \"5dd8cbb7-3694-4afb-bfad-0d6e7eb2ea70\", \"id\": \"c6256246-8105-4080-bbe1-1282269101a5\", \"request_id\": \"5dd8cbb7-3694-4afb-bfad-0d6e7eb2ea70\"}', 1895, '2019-11-23 06:03:31', '2019-11-23 06:03:33', '3ba7abfd-951a-42dd-9f2b-8d33719e84d0'),
(43, 1, 'done', 1, 'post', 'https://hooks.zapier.com/hooks/catch/6128230/o4x908w/', '{\"Content-Type\":\"application/json\"}', '{\"time\":\"2019-11-22T22:03:31-08:00\",\"user\":\"admin\",\"name\":\"afterPropagate\",\"entry\":{\"class\":\"craft\\\\elements\\\\MatrixBlock\",\"id\":387,\"title\":null,\"slug\":null,\"isNew\":true}}', 200, '{\"Access-Control-Allow-Origin\":[\"*\"],\"Content-Type\":[\"application/json\"],\"Date\":[\"Sat, 23 Nov 2019 06:03:36 GMT\"],\"P3P\":[\"CP=\\\"IDC DSP COR ADM DEVi TAIi PSA PSD IVAi IVDi CONi HIS OUR IND CNT\\\"\"],\"Response-Id\":[\"5dd8cbb8-47f9-4bbb-8e4b-e9d1d06aaaa0\"],\"Server\":[\"nginx\"],\"Vary\":[\"X-Session-Key\"],\"X-Frame-Options\":[\"SAMEORIGIN\"],\"X-Rate-Limit-Limit\":[\"10000\"],\"X-Rate-Limit-Remaining\":[\"9993\"],\"X-Rate-Limit-Reset\":[\"1574489400\"],\"X-Session-Key\":[\"anonymous\"],\"X-Zapier-Fast-Return\":[\"true\"],\"X-Zapier-Jobs\":[\"A hacker like yourself should consider working at Zapier!\"],\"X-Zapier-Jobs-Link\":[\"https://zapier.com/jobs/\"],\"X-Zapier-Revision\":[\"a3f0f5a0e2f54d0ea7deec04bf25200b29167033\"],\"Content-Length\":[\"172\"],\"Connection\":[\"keep-alive\"]}', '{\"status\": \"success\", \"attempt\": \"5dd8cbb8-47f9-4bbb-8e4b-e9d1d06aaaa0\", \"id\": \"16215402-cd0b-495a-9f59-6b90be6acf9b\", \"request_id\": \"5dd8cbb8-47f9-4bbb-8e4b-e9d1d06aaaa0\"}', 1011, '2019-11-23 06:03:31', '2019-11-23 06:03:35', 'acc1a7eb-7571-4a2d-8c54-456619945abd'),
(44, 1, 'done', 1, 'post', 'https://hooks.zapier.com/hooks/catch/6128230/o4x908w/', '{\"Content-Type\":\"application/json\"}', '{\"time\":\"2019-11-22T22:03:31-08:00\",\"user\":\"admin\",\"name\":\"afterPropagate\",\"entry\":{\"class\":\"craft\\\\elements\\\\MatrixBlock\",\"id\":389,\"title\":null,\"slug\":null,\"isNew\":true}}', 200, '{\"Access-Control-Allow-Origin\":[\"*\"],\"Content-Type\":[\"application/json\"],\"Date\":[\"Sat, 23 Nov 2019 06:03:37 GMT\"],\"P3P\":[\"CP=\\\"IDC DSP COR ADM DEVi TAIi PSA PSD IVAi IVDi CONi HIS OUR IND CNT\\\"\"],\"Response-Id\":[\"5dd8cbb9-aabf-4aaf-b03e-ee4ca70662d0\"],\"Server\":[\"nginx\"],\"Vary\":[\"X-Session-Key\"],\"X-Frame-Options\":[\"SAMEORIGIN\"],\"X-Rate-Limit-Limit\":[\"10000\"],\"X-Rate-Limit-Remaining\":[\"9992\"],\"X-Rate-Limit-Reset\":[\"1574489400\"],\"X-Session-Key\":[\"anonymous\"],\"X-Zapier-Fast-Return\":[\"true\"],\"X-Zapier-Jobs\":[\"A hacker like yourself should consider working at Zapier!\"],\"X-Zapier-Jobs-Link\":[\"https://zapier.com/jobs/\"],\"X-Zapier-Revision\":[\"a3f0f5a0e2f54d0ea7deec04bf25200b29167033\"],\"Content-Length\":[\"172\"],\"Connection\":[\"keep-alive\"]}', '{\"status\": \"success\", \"attempt\": \"5dd8cbb9-aabf-4aaf-b03e-ee4ca70662d0\", \"id\": \"2e5b5c6e-0106-4e8a-810b-f5f98099d8c0\", \"request_id\": \"5dd8cbb9-aabf-4aaf-b03e-ee4ca70662d0\"}', 1006, '2019-11-23 06:03:31', '2019-11-23 06:03:36', '9054f44a-eb3a-4253-8d28-c97d03a3d30f'),
(45, 1, 'done', 1, 'post', 'https://hooks.zapier.com/hooks/catch/6128230/o4x908w/', '{\"Content-Type\":\"application/json\"}', '{\"time\":\"2019-11-22T22:03:31-08:00\",\"user\":\"admin\",\"name\":\"afterPropagate\",\"entry\":{\"class\":\"craft\\\\elements\\\\MatrixBlock\",\"id\":390,\"title\":null,\"slug\":null,\"isNew\":true}}', 200, '{\"Access-Control-Allow-Origin\":[\"*\"],\"Content-Type\":[\"application/json\"],\"Date\":[\"Sat, 23 Nov 2019 06:03:38 GMT\"],\"P3P\":[\"CP=\\\"IDC DSP COR ADM DEVi TAIi PSA PSD IVAi IVDi CONi HIS OUR IND CNT\\\"\"],\"Response-Id\":[\"5dd8cbba-9771-484c-a0eb-887b5b645160\"],\"Server\":[\"nginx\"],\"Vary\":[\"X-Session-Key\"],\"X-Frame-Options\":[\"SAMEORIGIN\"],\"X-Rate-Limit-Limit\":[\"10000\"],\"X-Rate-Limit-Remaining\":[\"9991\"],\"X-Rate-Limit-Reset\":[\"1574489400\"],\"X-Session-Key\":[\"anonymous\"],\"X-Zapier-Fast-Return\":[\"true\"],\"X-Zapier-Jobs\":[\"A hacker like yourself should consider working at Zapier!\"],\"X-Zapier-Jobs-Link\":[\"https://zapier.com/jobs/\"],\"X-Zapier-Revision\":[\"a3f0f5a0e2f54d0ea7deec04bf25200b29167033\"],\"Content-Length\":[\"172\"],\"Connection\":[\"keep-alive\"]}', '{\"status\": \"success\", \"attempt\": \"5dd8cbba-9771-484c-a0eb-887b5b645160\", \"id\": \"6b51317a-ec88-421f-9592-834ccc3487e1\", \"request_id\": \"5dd8cbba-9771-484c-a0eb-887b5b645160\"}', 1017, '2019-11-23 06:03:31', '2019-11-23 06:03:37', '4d5d55a8-a50f-43df-b3c0-37a36645c8b1'),
(46, 1, 'done', 1, 'post', 'https://hooks.zapier.com/hooks/catch/6128230/o4x908w/', '{\"Content-Type\":\"application/json\"}', '{\"time\":\"2019-11-22T22:03:31-08:00\",\"user\":\"admin\",\"name\":\"afterPropagate\",\"entry\":{\"class\":\"craft\\\\elements\\\\MatrixBlock\",\"id\":391,\"title\":null,\"slug\":null,\"isNew\":true}}', 200, '{\"Access-Control-Allow-Origin\":[\"*\"],\"Content-Type\":[\"application/json\"],\"Date\":[\"Sat, 23 Nov 2019 06:03:39 GMT\"],\"P3P\":[\"CP=\\\"IDC DSP COR ADM DEVi TAIi PSA PSD IVAi IVDi CONi HIS OUR IND CNT\\\"\"],\"Response-Id\":[\"5dd8cbbb-25c4-4f17-ac86-587432c20c70\"],\"Server\":[\"nginx\"],\"Vary\":[\"X-Session-Key\"],\"X-Frame-Options\":[\"SAMEORIGIN\"],\"X-Rate-Limit-Limit\":[\"10000\"],\"X-Rate-Limit-Remaining\":[\"9990\"],\"X-Rate-Limit-Reset\":[\"1574489400\"],\"X-Session-Key\":[\"anonymous\"],\"X-Zapier-Fast-Return\":[\"true\"],\"X-Zapier-Jobs\":[\"A hacker like yourself should consider working at Zapier!\"],\"X-Zapier-Jobs-Link\":[\"https://zapier.com/jobs/\"],\"X-Zapier-Revision\":[\"a3f0f5a0e2f54d0ea7deec04bf25200b29167033\"],\"Content-Length\":[\"172\"],\"Connection\":[\"keep-alive\"]}', '{\"status\": \"success\", \"attempt\": \"5dd8cbbb-25c4-4f17-ac86-587432c20c70\", \"id\": \"edbdd437-10f6-4347-806d-24e5900485b1\", \"request_id\": \"5dd8cbbb-25c4-4f17-ac86-587432c20c70\"}', 1014, '2019-11-23 06:03:31', '2019-11-23 06:03:38', '7e9ee54c-8704-42b3-b1ea-c02328ac0eca'),
(47, 1, 'done', 1, 'post', 'https://hooks.zapier.com/hooks/catch/6128230/o4x908w/', '{\"Content-Type\":\"application/json\"}', '{\"time\":\"2019-11-22T22:04:40-08:00\",\"user\":{\"username\":\"admin\",\"photoId\":null,\"firstName\":null,\"lastName\":null,\"email\":\"h.lawrence@windowslive.com\",\"password\":\"••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••\",\"admin\":\"1\",\"locked\":\"0\",\"suspended\":\"0\",\"pending\":\"0\",\"lastLoginDate\":\"2019-11-22T21:50:49-08:00\",\"invalidLoginCount\":null,\"lastInvalidLoginDate\":null,\"lockoutDate\":null,\"hasDashboard\":\"1\",\"passwordResetRequired\":false,\"lastPasswordChangeDate\":null,\"unverifiedEmail\":null,\"newPassword\":null,\"currentPassword\":null,\"verificationCodeIssuedDate\":null,\"verificationCode\":null,\"lastLoginAttemptIp\":null,\"authError\":null,\"inheritorOnDelete\":null,\"id\":\"1\",\"tempId\":null,\"draftId\":null,\"revisionId\":null,\"uid\":\"0d8e884e-9a5c-4ec7-b3fd-d9f8b1fd3084\",\"fieldLayoutId\":null,\"contentId\":\"1\",\"enabled\":\"1\",\"archived\":\"0\",\"siteId\":\"1\",\"enabledForSite\":\"1\",\"title\":null,\"slug\":null,\"uri\":null,\"dateCreated\":\"2019-11-16T19:11:01-08:00\",\"dateUpdated\":\"2019-11-16T19:11:01-08:00\",\"dateDeleted\":null,\"trashed\":false,\"propagateAll\":false,\"newSiteIds\":[],\"resaving\":false,\"duplicateOf\":null,\"previewing\":false,\"hardDelete\":false,\"ref\":\"admin\",\"status\":\"active\",\"structureId\":null,\"url\":null,\"cooldownEndTime\":null,\"friendlyName\":\"admin\",\"fullName\":null,\"isCurrent\":true,\"name\":\"admin\",\"preferredLanguage\":\"en-GB\",\"remainingCooldownTime\":null},\"name\":\"afterPropagate\",\"senderClass\":\"craft\\\\elements\\\\MatrixBlock\",\"sender\":{\"fieldId\":\"12\",\"ownerId\":\"2\",\"ownerSiteId\":null,\"typeId\":\"3\",\"sortOrder\":1,\"collapsed\":false,\"deletedWithOwner\":false,\"id\":\"10\",\"tempId\":null,\"draftId\":null,\"revisionId\":null,\"uid\":\"9bb2ea1d-b3c0-48ef-80f0-3a8a4897ea57\",\"fieldLayoutId\":\"7\",\"contentId\":\"2\",\"enabled\":true,\"archived\":\"0\",\"siteId\":\"1\",\"enabledForSite\":true,\"title\":null,\"slug\":null,\"uri\":null,\"dateCreated\":\"2019-11-16T21:35:01-08:00\",\"dateUpdated\":\"2019-11-22T22:04:40-08:00\",\"dateDeleted\":null,\"trashed\":false,\"propagateAll\":false,\"newSiteIds\":[],\"resaving\":false,\"duplicateOf\":null,\"previewing\":false,\"hardDelete\":false,\"ref\":null,\"status\":\"enabled\",\"structureId\":null,\"url\":null,\"newsTitle\":\"wow new cool title newer!!\",\"newsDescription\":\"descriptiondescriptiondescriptionsww\",\"image\":{\"volumeId\":null,\"folderId\":null,\"filename\":null,\"kind\":null,\"width\":null,\"height\":null,\"size\":null,\"dateModified\":null,\"includeSubfolders\":false,\"withTransforms\":null,\"elementType\":\"craft\\\\elements\\\\Asset\",\"contentTable\":\"{{%content}}\",\"customFields\":{\"0\":{\"minBlocks\":\"\",\"maxBlocks\":\"\",\"contentTable\":\"{{%matrixcontent_availableproducts}}\",\"propagationMethod\":\"all\",\"localizeBlocks\":false,\"id\":\"6\",\"dateCreated\":\"2019-11-16T21:05:39-08:00\",\"dateUpdated\":\"2019-11-16T21:27:52-08:00\",\"groupId\":\"3\",\"name\":\"Available Products\",\"handle\":\"availableProducts\",\"context\":\"global\",\"instructions\":\"\",\"searchable\":\"1\",\"translationMethod\":\"site\",\"translationKeyFormat\":null,\"oldHandle\":null,\"oldSettings\":null,\"columnPrefix\":null,\"uid\":\"050801e0-9914-4a65-a49c-c3418c2da200\",\"layoutId\":null,\"tabId\":null,\"required\":null,\"sortOrder\":null},\"5\":{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\",\"id\":\"17\",\"dateCreated\":\"2019-11-22T17:30:59-08:00\",\"dateUpdated\":\"2019-11-22T17:30:59-08:00\",\"groupId\":\"5\",\"name\":\"News Description\",\"handle\":\"newsDescription\",\"context\":\"global\",\"instructions\":\"\",\"searchable\":\"1\",\"translationMethod\":\"none\",\"translationKeyFormat\":null,\"oldHandle\":null,\"oldSettings\":null,\"columnPrefix\":null,\"uid\":\"631b609a-3a78-4ddb-acae-caf3c6057662\",\"layoutId\":null,\"tabId\":null,\"required\":null,\"sortOrder\":null},\"6\":{\"minBlocks\":\"\",\"maxBlocks\":\"\",\"contentTable\":\"{{%matrixcontent_newsfeed}}\",\"propagationMethod\":\"all\",\"localizeBlocks\":false,\"id\":\"12\",\"dateCreated\":\"2019-11-16T21:33:06-08:00\",\"dateUpdated\":\"2019-11-16T21:33:06-08:00\",\"groupId\":\"4\",\"name\":\"News Feed\",\"handle\":\"newsFeed\",\"context\":\"global\",\"instructions\":\"\",\"searchable\":\"1\",\"translationMethod\":\"site\",\"translationKeyFormat\":null,\"oldHandle\":null,\"oldSettings\":null,\"columnPrefix\":null,\"uid\":\"737f3d64-426a-45e4-869b-05a5dcf2c242\",\"layoutId\":null,\"tabId\":null,\"required\":null,\"sortOrder\":null},\"7\":{\"sources\":[\"section:5a041f1d-964e-41a5-a3e7-36f0a91ec4e2\"],\"source\":null,\"targetSiteId\":null,\"viewMode\":null,\"limit\":\"6\",\"selectionLabel\":\"Add Products\",\"validateRelatedElements\":\"\",\"localizeRelations\":false,\"allowMultipleSources\":true,\"allowLimit\":true,\"id\":\"18\",\"dateCreated\":\"2019-11-22T17:31:57-08:00\",\"dateUpdated\":\"2019-11-22T17:31:57-08:00\",\"groupId\":\"5\",\"name\":\"News Products \",\"handle\":\"newsProducts\",\"context\":\"global\",\"instructions\":\"\",\"searchable\":\"1\",\"translationMethod\":\"site\",\"translationKeyFormat\":null,\"oldHandle\":null,\"oldSettings\":null,\"columnPrefix\":null,\"uid\":\"0b3353c6-6585-45e9-9b26-7f8a36124b56\",\"layoutId\":null,\"tabId\":null,\"required\":null,\"sortOrder\":null},\"9\":{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\",\"id\":\"16\",\"dateCreated\":\"2019-11-22T17:30:32-08:00\",\"dateUpdated\":\"2019-11-22T18:18:43-08:00\",\"groupId\":\"5\",\"name\":\"News Title\",\"handle\":\"newsTitle\",\"context\":\"global\",\"instructions\":\"\",\"searchable\":\"1\",\"translationMethod\":\"none\",\"translationKeyFormat\":null,\"oldHandle\":null,\"oldSettings\":null,\"columnPrefix\":null,\"uid\":\"c4585c4e-f4a6-439c-a95b-1f2a50263b07\",\"layoutId\":null,\"tabId\":null,\"required\":null,\"sortOrder\":null}},\"inReverse\":false,\"asArray\":false,\"ignorePlaceholders\":false,\"drafts\":false,\"draftId\":null,\"draftOf\":null,\"draftCreator\":null,\"revisions\":false,\"revisionId\":null,\"revisionOf\":null,\"revisionCreator\":null,\"id\":null,\"uid\":null,\"fixedOrder\":false,\"status\":[\"enabled\"],\"archived\":false,\"trashed\":false,\"dateCreated\":null,\"dateUpdated\":null,\"siteId\":1,\"unique\":false,\"preferSites\":false,\"enabledForSite\":true,\"leaves\":false,\"relatedTo\":null,\"title\":null,\"slug\":null,\"uri\":null,\"search\":null,\"ref\":null,\"with\":null,\"orderBy\":{\"relations.sortOrder\":4},\"withStructure\":null,\"structureId\":null,\"level\":null,\"hasDescendants\":null,\"ancestorOf\":null,\"ancestorDist\":null,\"descendantOf\":null,\"descendantDist\":null,\"siblingOf\":null,\"prevSiblingOf\":null,\"nextSiblingOf\":null,\"positionedBefore\":null,\"positionedAfter\":null,\"select\":{\"**\":\"**\"},\"selectOption\":null,\"distinct\":null,\"from\":null,\"groupBy\":null,\"join\":[[\"INNER JOIN\",\"{{%relations}} relations\",[\"and\",\"[[relations.targetId]] = [[elements.id]]\"]]],\"having\":null,\"union\":null,\"params\":[],\"queryCacheDuration\":null,\"queryCacheDependency\":null,\"where\":null,\"limit\":null,\"offset\":null,\"indexBy\":null,\"emulateExecution\":false,\"availableProducts\":null,\"productName\":null,\"price\":null,\"image\":null,\"available\":null,\"newsFeed\":null,\"newsTitle\":null,\"newsDescription\":null,\"newsProducts\":null},\"owner\":{\"sectionId\":\"1\",\"typeId\":\"1\",\"authorId\":null,\"postDate\":\"2019-11-16T19:13:00-08:00\",\"expiryDate\":null,\"newParentId\":null,\"deletedWithEntryType\":false,\"id\":\"2\",\"tempId\":null,\"draftId\":null,\"revisionId\":null,\"uid\":\"7e2370a1-ddcf-4054-ace6-a33fbc894bac\",\"fieldLayoutId\":\"1\",\"contentId\":\"2\",\"enabled\":true,\"archived\":\"0\",\"siteId\":\"1\",\"enabledForSite\":true,\"title\":\"Home\",\"slug\":\"home\",\"uri\":\"__home__\",\"dateCreated\":\"2019-11-16T19:13:40-08:00\",\"dateUpdated\":\"2019-11-22T22:04:40-08:00\",\"dateDeleted\":null,\"trashed\":false,\"propagateAll\":false,\"newSiteIds\":[],\"resaving\":false,\"duplicateOf\":null,\"previewing\":false,\"hardDelete\":false,\"ref\":\"home/home\",\"status\":\"live\",\"structureId\":null,\"url\":\"http://localhost:8888/\",\"newsFeed\":{\"fieldId\":\"12\",\"ownerId\":\"2\",\"ownerSiteId\":null,\"allowOwnerDrafts\":null,\"allowOwnerRevisions\":null,\"typeId\":null,\"elementType\":\"craft\\\\elements\\\\MatrixBlock\",\"contentTable\":\"{{%content}}\",\"customFields\":null,\"inReverse\":false,\"asArray\":false,\"ignorePlaceholders\":false,\"drafts\":false,\"draftId\":null,\"draftOf\":null,\"draftCreator\":null,\"revisions\":false,\"revisionId\":null,\"revisionOf\":null,\"revisionCreator\":null,\"id\":null,\"uid\":null,\"fixedOrder\":false,\"status\":[\"enabled\"],\"archived\":false,\"trashed\":false,\"dateCreated\":null,\"dateUpdated\":null,\"siteId\":\"1\",\"unique\":false,\"preferSites\":false,\"enabledForSite\":true,\"leaves\":false,\"relatedTo\":null,\"title\":null,\"slug\":null,\"uri\":null,\"search\":null,\"ref\":null,\"with\":null,\"orderBy\":\"\",\"withStructure\":null,\"structureId\":null,\"level\":null,\"hasDescendants\":null,\"ancestorOf\":null,\"ancestorDist\":null,\"descendantOf\":null,\"descendantDist\":null,\"siblingOf\":null,\"prevSiblingOf\":null,\"nextSiblingOf\":null,\"positionedBefore\":null,\"positionedAfter\":null,\"select\":{\"**\":\"**\"},\"selectOption\":null,\"distinct\":null,\"from\":null,\"groupBy\":null,\"join\":null,\"having\":null,\"union\":null,\"params\":[],\"queryCacheDuration\":null,\"queryCacheDependency\":null,\"where\":null,\"limit\":null,\"offset\":null,\"indexBy\":null,\"emulateExecution\":false,\"availableProducts\":null,\"productName\":null,\"price\":null,\"image\":null,\"available\":null,\"newsFeed\":null,\"newsTitle\":null,\"newsDescription\":null,\"newsProducts\":null}}},\"eventClass\":\"craft\\\\events\\\\ModelEvent\",\"event\":{\"isNew\":[false],\"isValid\":[true]}}', 200, '{\"Access-Control-Allow-Origin\":[\"*\"],\"Content-Type\":[\"application/json\"],\"Date\":[\"Sat, 23 Nov 2019 06:04:42 GMT\"],\"P3P\":[\"CP=\\\"IDC DSP COR ADM DEVi TAIi PSA PSD IVAi IVDi CONi HIS OUR IND CNT\\\"\"],\"Response-Id\":[\"5dd8cbfa-7d35-4901-8aba-bf52c7dfea60\"],\"Server\":[\"nginx\"],\"Vary\":[\"X-Session-Key\"],\"X-Frame-Options\":[\"SAMEORIGIN\"],\"X-Rate-Limit-Limit\":[\"10000\"],\"X-Rate-Limit-Remaining\":[\"9989\"],\"X-Rate-Limit-Reset\":[\"1574489400\"],\"X-Session-Key\":[\"anonymous\"],\"X-Zapier-Fast-Return\":[\"true\"],\"X-Zapier-Jobs\":[\"A hacker like yourself should consider working at Zapier!\"],\"X-Zapier-Jobs-Link\":[\"https://zapier.com/jobs/\"],\"X-Zapier-Revision\":[\"a3f0f5a0e2f54d0ea7deec04bf25200b29167033\"],\"Content-Length\":[\"172\"],\"Connection\":[\"keep-alive\"]}', '{\"status\": \"success\", \"attempt\": \"5dd8cbfa-7d35-4901-8aba-bf52c7dfea60\", \"id\": \"5e127154-cb00-4de8-9b55-44e29cc234d1\", \"request_id\": \"5dd8cbfa-7d35-4901-8aba-bf52c7dfea60\"}', 1386, '2019-11-23 06:04:40', '2019-11-23 06:04:41', '68cdce83-fee9-43fb-b058-2e17bdadbcf6'),
(48, 1, 'done', 1, 'post', 'https://hooks.zapier.com/hooks/catch/6128230/o4x908w/', '{\"Content-Type\":\"application/json\"}', '{\"time\":\"2019-11-22T22:04:40-08:00\",\"user\":{\"username\":\"admin\",\"photoId\":null,\"firstName\":null,\"lastName\":null,\"email\":\"h.lawrence@windowslive.com\",\"password\":\"••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••\",\"admin\":\"1\",\"locked\":\"0\",\"suspended\":\"0\",\"pending\":\"0\",\"lastLoginDate\":\"2019-11-22T21:50:49-08:00\",\"invalidLoginCount\":null,\"lastInvalidLoginDate\":null,\"lockoutDate\":null,\"hasDashboard\":\"1\",\"passwordResetRequired\":false,\"lastPasswordChangeDate\":null,\"unverifiedEmail\":null,\"newPassword\":null,\"currentPassword\":null,\"verificationCodeIssuedDate\":null,\"verificationCode\":null,\"lastLoginAttemptIp\":null,\"authError\":null,\"inheritorOnDelete\":null,\"id\":\"1\",\"tempId\":null,\"draftId\":null,\"revisionId\":null,\"uid\":\"0d8e884e-9a5c-4ec7-b3fd-d9f8b1fd3084\",\"fieldLayoutId\":null,\"contentId\":\"1\",\"enabled\":\"1\",\"archived\":\"0\",\"siteId\":\"1\",\"enabledForSite\":\"1\",\"title\":null,\"slug\":null,\"uri\":null,\"dateCreated\":\"2019-11-16T19:11:01-08:00\",\"dateUpdated\":\"2019-11-16T19:11:01-08:00\",\"dateDeleted\":null,\"trashed\":false,\"propagateAll\":false,\"newSiteIds\":[],\"resaving\":false,\"duplicateOf\":null,\"previewing\":false,\"hardDelete\":false,\"ref\":\"admin\",\"status\":\"active\",\"structureId\":null,\"url\":null,\"cooldownEndTime\":null,\"friendlyName\":\"admin\",\"fullName\":null,\"isCurrent\":true,\"name\":\"admin\",\"preferredLanguage\":\"en-GB\",\"remainingCooldownTime\":null},\"name\":\"afterPropagate\",\"senderClass\":\"craft\\\\elements\\\\MatrixBlock\",\"sender\":{\"fieldId\":\"12\",\"ownerId\":\"2\",\"ownerSiteId\":null,\"typeId\":\"3\",\"sortOrder\":2,\"collapsed\":false,\"deletedWithOwner\":false,\"id\":\"378\",\"tempId\":null,\"draftId\":null,\"revisionId\":null,\"uid\":\"607d915b-c418-41c8-8207-72a94e816e72\",\"fieldLayoutId\":\"7\",\"contentId\":\"194\",\"enabled\":true,\"archived\":\"0\",\"siteId\":\"1\",\"enabledForSite\":true,\"title\":null,\"slug\":null,\"uri\":null,\"dateCreated\":\"2019-11-22T22:01:37-08:00\",\"dateUpdated\":\"2019-11-22T22:04:40-08:00\",\"dateDeleted\":null,\"trashed\":false,\"propagateAll\":false,\"newSiteIds\":[],\"resaving\":false,\"duplicateOf\":null,\"previewing\":false,\"hardDelete\":false,\"ref\":null,\"status\":\"enabled\",\"structureId\":null,\"url\":null,\"newsTitle\":\"ddd\",\"newsDescription\":\"ddd\",\"image\":{\"volumeId\":null,\"folderId\":null,\"filename\":null,\"kind\":null,\"width\":null,\"height\":null,\"size\":null,\"dateModified\":null,\"includeSubfolders\":false,\"withTransforms\":null,\"elementType\":\"craft\\\\elements\\\\Asset\",\"contentTable\":\"{{%content}}\",\"customFields\":{\"0\":{\"minBlocks\":\"\",\"maxBlocks\":\"\",\"contentTable\":\"{{%matrixcontent_availableproducts}}\",\"propagationMethod\":\"all\",\"localizeBlocks\":false,\"id\":\"6\",\"dateCreated\":\"2019-11-16T21:05:39-08:00\",\"dateUpdated\":\"2019-11-16T21:27:52-08:00\",\"groupId\":\"3\",\"name\":\"Available Products\",\"handle\":\"availableProducts\",\"context\":\"global\",\"instructions\":\"\",\"searchable\":\"1\",\"translationMethod\":\"site\",\"translationKeyFormat\":null,\"oldHandle\":null,\"oldSettings\":null,\"columnPrefix\":null,\"uid\":\"050801e0-9914-4a65-a49c-c3418c2da200\",\"layoutId\":null,\"tabId\":null,\"required\":null,\"sortOrder\":null},\"5\":{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\",\"id\":\"17\",\"dateCreated\":\"2019-11-22T17:30:59-08:00\",\"dateUpdated\":\"2019-11-22T17:30:59-08:00\",\"groupId\":\"5\",\"name\":\"News Description\",\"handle\":\"newsDescription\",\"context\":\"global\",\"instructions\":\"\",\"searchable\":\"1\",\"translationMethod\":\"none\",\"translationKeyFormat\":null,\"oldHandle\":null,\"oldSettings\":null,\"columnPrefix\":null,\"uid\":\"631b609a-3a78-4ddb-acae-caf3c6057662\",\"layoutId\":null,\"tabId\":null,\"required\":null,\"sortOrder\":null},\"6\":{\"minBlocks\":\"\",\"maxBlocks\":\"\",\"contentTable\":\"{{%matrixcontent_newsfeed}}\",\"propagationMethod\":\"all\",\"localizeBlocks\":false,\"id\":\"12\",\"dateCreated\":\"2019-11-16T21:33:06-08:00\",\"dateUpdated\":\"2019-11-16T21:33:06-08:00\",\"groupId\":\"4\",\"name\":\"News Feed\",\"handle\":\"newsFeed\",\"context\":\"global\",\"instructions\":\"\",\"searchable\":\"1\",\"translationMethod\":\"site\",\"translationKeyFormat\":null,\"oldHandle\":null,\"oldSettings\":null,\"columnPrefix\":null,\"uid\":\"737f3d64-426a-45e4-869b-05a5dcf2c242\",\"layoutId\":null,\"tabId\":null,\"required\":null,\"sortOrder\":null},\"7\":{\"sources\":[\"section:5a041f1d-964e-41a5-a3e7-36f0a91ec4e2\"],\"source\":null,\"targetSiteId\":null,\"viewMode\":null,\"limit\":\"6\",\"selectionLabel\":\"Add Products\",\"validateRelatedElements\":\"\",\"localizeRelations\":false,\"allowMultipleSources\":true,\"allowLimit\":true,\"id\":\"18\",\"dateCreated\":\"2019-11-22T17:31:57-08:00\",\"dateUpdated\":\"2019-11-22T17:31:57-08:00\",\"groupId\":\"5\",\"name\":\"News Products \",\"handle\":\"newsProducts\",\"context\":\"global\",\"instructions\":\"\",\"searchable\":\"1\",\"translationMethod\":\"site\",\"translationKeyFormat\":null,\"oldHandle\":null,\"oldSettings\":null,\"columnPrefix\":null,\"uid\":\"0b3353c6-6585-45e9-9b26-7f8a36124b56\",\"layoutId\":null,\"tabId\":null,\"required\":null,\"sortOrder\":null},\"9\":{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\",\"id\":\"16\",\"dateCreated\":\"2019-11-22T17:30:32-08:00\",\"dateUpdated\":\"2019-11-22T18:18:43-08:00\",\"groupId\":\"5\",\"name\":\"News Title\",\"handle\":\"newsTitle\",\"context\":\"global\",\"instructions\":\"\",\"searchable\":\"1\",\"translationMethod\":\"none\",\"translationKeyFormat\":null,\"oldHandle\":null,\"oldSettings\":null,\"columnPrefix\":null,\"uid\":\"c4585c4e-f4a6-439c-a95b-1f2a50263b07\",\"layoutId\":null,\"tabId\":null,\"required\":null,\"sortOrder\":null}},\"inReverse\":false,\"asArray\":false,\"ignorePlaceholders\":false,\"drafts\":false,\"draftId\":null,\"draftOf\":null,\"draftCreator\":null,\"revisions\":false,\"revisionId\":null,\"revisionOf\":null,\"revisionCreator\":null,\"id\":null,\"uid\":null,\"fixedOrder\":false,\"status\":[\"enabled\"],\"archived\":false,\"trashed\":false,\"dateCreated\":null,\"dateUpdated\":null,\"siteId\":1,\"unique\":false,\"preferSites\":false,\"enabledForSite\":true,\"leaves\":false,\"relatedTo\":null,\"title\":null,\"slug\":null,\"uri\":null,\"search\":null,\"ref\":null,\"with\":null,\"orderBy\":{\"relations.sortOrder\":4},\"withStructure\":null,\"structureId\":null,\"level\":null,\"hasDescendants\":null,\"ancestorOf\":null,\"ancestorDist\":null,\"descendantOf\":null,\"descendantDist\":null,\"siblingOf\":null,\"prevSiblingOf\":null,\"nextSiblingOf\":null,\"positionedBefore\":null,\"positionedAfter\":null,\"select\":{\"**\":\"**\"},\"selectOption\":null,\"distinct\":null,\"from\":null,\"groupBy\":null,\"join\":[[\"INNER JOIN\",\"{{%relations}} relations\",[\"and\",\"[[relations.targetId]] = [[elements.id]]\"]]],\"having\":null,\"union\":null,\"params\":[],\"queryCacheDuration\":null,\"queryCacheDependency\":null,\"where\":null,\"limit\":null,\"offset\":null,\"indexBy\":null,\"emulateExecution\":false,\"availableProducts\":null,\"productName\":null,\"price\":null,\"image\":null,\"available\":null,\"newsFeed\":null,\"newsTitle\":null,\"newsDescription\":null,\"newsProducts\":null},\"owner\":{\"sectionId\":\"1\",\"typeId\":\"1\",\"authorId\":null,\"postDate\":\"2019-11-16T19:13:00-08:00\",\"expiryDate\":null,\"newParentId\":null,\"deletedWithEntryType\":false,\"id\":\"2\",\"tempId\":null,\"draftId\":null,\"revisionId\":null,\"uid\":\"7e2370a1-ddcf-4054-ace6-a33fbc894bac\",\"fieldLayoutId\":\"1\",\"contentId\":\"2\",\"enabled\":true,\"archived\":\"0\",\"siteId\":\"1\",\"enabledForSite\":true,\"title\":\"Home\",\"slug\":\"home\",\"uri\":\"__home__\",\"dateCreated\":\"2019-11-16T19:13:40-08:00\",\"dateUpdated\":\"2019-11-22T22:04:40-08:00\",\"dateDeleted\":null,\"trashed\":false,\"propagateAll\":false,\"newSiteIds\":[],\"resaving\":false,\"duplicateOf\":null,\"previewing\":false,\"hardDelete\":false,\"ref\":\"home/home\",\"status\":\"live\",\"structureId\":null,\"url\":\"http://localhost:8888/\",\"newsFeed\":{\"fieldId\":\"12\",\"ownerId\":\"2\",\"ownerSiteId\":null,\"allowOwnerDrafts\":null,\"allowOwnerRevisions\":null,\"typeId\":null,\"elementType\":\"craft\\\\elements\\\\MatrixBlock\",\"contentTable\":\"{{%content}}\",\"customFields\":null,\"inReverse\":false,\"asArray\":false,\"ignorePlaceholders\":false,\"drafts\":false,\"draftId\":null,\"draftOf\":null,\"draftCreator\":null,\"revisions\":false,\"revisionId\":null,\"revisionOf\":null,\"revisionCreator\":null,\"id\":null,\"uid\":null,\"fixedOrder\":false,\"status\":[\"enabled\"],\"archived\":false,\"trashed\":false,\"dateCreated\":null,\"dateUpdated\":null,\"siteId\":\"1\",\"unique\":false,\"preferSites\":false,\"enabledForSite\":true,\"leaves\":false,\"relatedTo\":null,\"title\":null,\"slug\":null,\"uri\":null,\"search\":null,\"ref\":null,\"with\":null,\"orderBy\":\"\",\"withStructure\":null,\"structureId\":null,\"level\":null,\"hasDescendants\":null,\"ancestorOf\":null,\"ancestorDist\":null,\"descendantOf\":null,\"descendantDist\":null,\"siblingOf\":null,\"prevSiblingOf\":null,\"nextSiblingOf\":null,\"positionedBefore\":null,\"positionedAfter\":null,\"select\":{\"**\":\"**\"},\"selectOption\":null,\"distinct\":null,\"from\":null,\"groupBy\":null,\"join\":null,\"having\":null,\"union\":null,\"params\":[],\"queryCacheDuration\":null,\"queryCacheDependency\":null,\"where\":null,\"limit\":null,\"offset\":null,\"indexBy\":null,\"emulateExecution\":false,\"availableProducts\":null,\"productName\":null,\"price\":null,\"image\":null,\"available\":null,\"newsFeed\":null,\"newsTitle\":null,\"newsDescription\":null,\"newsProducts\":null}}},\"eventClass\":\"craft\\\\events\\\\ModelEvent\",\"event\":{\"isNew\":[false],\"isValid\":[true]}}', 200, '{\"Access-Control-Allow-Origin\":[\"*\"],\"Content-Type\":[\"application/json\"],\"Date\":[\"Sat, 23 Nov 2019 06:04:43 GMT\"],\"P3P\":[\"CP=\\\"IDC DSP COR ADM DEVi TAIi PSA PSD IVAi IVDi CONi HIS OUR IND CNT\\\"\"],\"Response-Id\":[\"5dd8cbfb-6c08-41c6-9b79-25f920188280\"],\"Server\":[\"nginx\"],\"Vary\":[\"X-Session-Key\"],\"X-Frame-Options\":[\"SAMEORIGIN\"],\"X-Rate-Limit-Limit\":[\"10000\"],\"X-Rate-Limit-Remaining\":[\"9988\"],\"X-Rate-Limit-Reset\":[\"1574489400\"],\"X-Session-Key\":[\"anonymous\"],\"X-Zapier-Fast-Return\":[\"true\"],\"X-Zapier-Jobs\":[\"A hacker like yourself should consider working at Zapier!\"],\"X-Zapier-Jobs-Link\":[\"https://zapier.com/jobs/\"],\"X-Zapier-Revision\":[\"a3f0f5a0e2f54d0ea7deec04bf25200b29167033\"],\"Content-Length\":[\"172\"],\"Connection\":[\"keep-alive\"]}', '{\"status\": \"success\", \"attempt\": \"5dd8cbfb-6c08-41c6-9b79-25f920188280\", \"id\": \"e982993d-193e-457a-95c6-7b0d261387a1\", \"request_id\": \"5dd8cbfb-6c08-41c6-9b79-25f920188280\"}', 1051, '2019-11-23 06:04:40', '2019-11-23 06:04:42', '12b2ed95-ee31-45df-bb31-ca37e8d040b5'),
(49, 1, 'done', 1, 'post', 'https://hooks.zapier.com/hooks/catch/6128230/o4x908w/', '{\"Content-Type\":\"application/json\"}', '{\"time\":\"2019-11-22T22:04:40-08:00\",\"user\":{\"username\":\"admin\",\"photoId\":null,\"firstName\":null,\"lastName\":null,\"email\":\"h.lawrence@windowslive.com\",\"password\":\"••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••\",\"admin\":\"1\",\"locked\":\"0\",\"suspended\":\"0\",\"pending\":\"0\",\"lastLoginDate\":\"2019-11-22T21:50:49-08:00\",\"invalidLoginCount\":null,\"lastInvalidLoginDate\":null,\"lockoutDate\":null,\"hasDashboard\":\"1\",\"passwordResetRequired\":false,\"lastPasswordChangeDate\":null,\"unverifiedEmail\":null,\"newPassword\":null,\"currentPassword\":null,\"verificationCodeIssuedDate\":null,\"verificationCode\":null,\"lastLoginAttemptIp\":null,\"authError\":null,\"inheritorOnDelete\":null,\"id\":\"1\",\"tempId\":null,\"draftId\":null,\"revisionId\":null,\"uid\":\"0d8e884e-9a5c-4ec7-b3fd-d9f8b1fd3084\",\"fieldLayoutId\":null,\"contentId\":\"1\",\"enabled\":\"1\",\"archived\":\"0\",\"siteId\":\"1\",\"enabledForSite\":\"1\",\"title\":null,\"slug\":null,\"uri\":null,\"dateCreated\":\"2019-11-16T19:11:01-08:00\",\"dateUpdated\":\"2019-11-16T19:11:01-08:00\",\"dateDeleted\":null,\"trashed\":false,\"propagateAll\":false,\"newSiteIds\":[],\"resaving\":false,\"duplicateOf\":null,\"previewing\":false,\"hardDelete\":false,\"ref\":\"admin\",\"status\":\"active\",\"structureId\":null,\"url\":null,\"cooldownEndTime\":null,\"friendlyName\":\"admin\",\"fullName\":null,\"isCurrent\":true,\"name\":\"admin\",\"preferredLanguage\":\"en-GB\",\"remainingCooldownTime\":null},\"name\":\"afterPropagate\",\"senderClass\":\"craft\\\\elements\\\\MatrixBlock\",\"sender\":{\"fieldId\":\"12\",\"ownerId\":\"2\",\"ownerSiteId\":null,\"typeId\":\"3\",\"sortOrder\":3,\"collapsed\":false,\"deletedWithOwner\":false,\"id\":\"387\",\"tempId\":null,\"draftId\":null,\"revisionId\":null,\"uid\":\"79bf5f9a-d4eb-4b9c-a8d5-1e5f429f4620\",\"fieldLayoutId\":\"7\",\"contentId\":\"197\",\"enabled\":true,\"archived\":\"0\",\"siteId\":\"1\",\"enabledForSite\":true,\"title\":null,\"slug\":null,\"uri\":null,\"dateCreated\":\"2019-11-22T22:03:31-08:00\",\"dateUpdated\":\"2019-11-22T22:04:40-08:00\",\"dateDeleted\":null,\"trashed\":false,\"propagateAll\":false,\"newSiteIds\":[],\"resaving\":false,\"duplicateOf\":null,\"previewing\":false,\"hardDelete\":false,\"ref\":null,\"status\":\"enabled\",\"structureId\":null,\"url\":null,\"newsTitle\":\"news\",\"newsDescription\":\"news\",\"image\":{\"volumeId\":null,\"folderId\":null,\"filename\":null,\"kind\":null,\"width\":null,\"height\":null,\"size\":null,\"dateModified\":null,\"includeSubfolders\":false,\"withTransforms\":null,\"elementType\":\"craft\\\\elements\\\\Asset\",\"contentTable\":\"{{%content}}\",\"customFields\":{\"0\":{\"minBlocks\":\"\",\"maxBlocks\":\"\",\"contentTable\":\"{{%matrixcontent_availableproducts}}\",\"propagationMethod\":\"all\",\"localizeBlocks\":false,\"id\":\"6\",\"dateCreated\":\"2019-11-16T21:05:39-08:00\",\"dateUpdated\":\"2019-11-16T21:27:52-08:00\",\"groupId\":\"3\",\"name\":\"Available Products\",\"handle\":\"availableProducts\",\"context\":\"global\",\"instructions\":\"\",\"searchable\":\"1\",\"translationMethod\":\"site\",\"translationKeyFormat\":null,\"oldHandle\":null,\"oldSettings\":null,\"columnPrefix\":null,\"uid\":\"050801e0-9914-4a65-a49c-c3418c2da200\",\"layoutId\":null,\"tabId\":null,\"required\":null,\"sortOrder\":null},\"5\":{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\",\"id\":\"17\",\"dateCreated\":\"2019-11-22T17:30:59-08:00\",\"dateUpdated\":\"2019-11-22T17:30:59-08:00\",\"groupId\":\"5\",\"name\":\"News Description\",\"handle\":\"newsDescription\",\"context\":\"global\",\"instructions\":\"\",\"searchable\":\"1\",\"translationMethod\":\"none\",\"translationKeyFormat\":null,\"oldHandle\":null,\"oldSettings\":null,\"columnPrefix\":null,\"uid\":\"631b609a-3a78-4ddb-acae-caf3c6057662\",\"layoutId\":null,\"tabId\":null,\"required\":null,\"sortOrder\":null},\"6\":{\"minBlocks\":\"\",\"maxBlocks\":\"\",\"contentTable\":\"{{%matrixcontent_newsfeed}}\",\"propagationMethod\":\"all\",\"localizeBlocks\":false,\"id\":\"12\",\"dateCreated\":\"2019-11-16T21:33:06-08:00\",\"dateUpdated\":\"2019-11-16T21:33:06-08:00\",\"groupId\":\"4\",\"name\":\"News Feed\",\"handle\":\"newsFeed\",\"context\":\"global\",\"instructions\":\"\",\"searchable\":\"1\",\"translationMethod\":\"site\",\"translationKeyFormat\":null,\"oldHandle\":null,\"oldSettings\":null,\"columnPrefix\":null,\"uid\":\"737f3d64-426a-45e4-869b-05a5dcf2c242\",\"layoutId\":null,\"tabId\":null,\"required\":null,\"sortOrder\":null},\"7\":{\"sources\":[\"section:5a041f1d-964e-41a5-a3e7-36f0a91ec4e2\"],\"source\":null,\"targetSiteId\":null,\"viewMode\":null,\"limit\":\"6\",\"selectionLabel\":\"Add Products\",\"validateRelatedElements\":\"\",\"localizeRelations\":false,\"allowMultipleSources\":true,\"allowLimit\":true,\"id\":\"18\",\"dateCreated\":\"2019-11-22T17:31:57-08:00\",\"dateUpdated\":\"2019-11-22T17:31:57-08:00\",\"groupId\":\"5\",\"name\":\"News Products \",\"handle\":\"newsProducts\",\"context\":\"global\",\"instructions\":\"\",\"searchable\":\"1\",\"translationMethod\":\"site\",\"translationKeyFormat\":null,\"oldHandle\":null,\"oldSettings\":null,\"columnPrefix\":null,\"uid\":\"0b3353c6-6585-45e9-9b26-7f8a36124b56\",\"layoutId\":null,\"tabId\":null,\"required\":null,\"sortOrder\":null},\"9\":{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\",\"id\":\"16\",\"dateCreated\":\"2019-11-22T17:30:32-08:00\",\"dateUpdated\":\"2019-11-22T18:18:43-08:00\",\"groupId\":\"5\",\"name\":\"News Title\",\"handle\":\"newsTitle\",\"context\":\"global\",\"instructions\":\"\",\"searchable\":\"1\",\"translationMethod\":\"none\",\"translationKeyFormat\":null,\"oldHandle\":null,\"oldSettings\":null,\"columnPrefix\":null,\"uid\":\"c4585c4e-f4a6-439c-a95b-1f2a50263b07\",\"layoutId\":null,\"tabId\":null,\"required\":null,\"sortOrder\":null}},\"inReverse\":false,\"asArray\":false,\"ignorePlaceholders\":false,\"drafts\":false,\"draftId\":null,\"draftOf\":null,\"draftCreator\":null,\"revisions\":false,\"revisionId\":null,\"revisionOf\":null,\"revisionCreator\":null,\"id\":null,\"uid\":null,\"fixedOrder\":false,\"status\":[\"enabled\"],\"archived\":false,\"trashed\":false,\"dateCreated\":null,\"dateUpdated\":null,\"siteId\":1,\"unique\":false,\"preferSites\":false,\"enabledForSite\":true,\"leaves\":false,\"relatedTo\":null,\"title\":null,\"slug\":null,\"uri\":null,\"search\":null,\"ref\":null,\"with\":null,\"orderBy\":{\"relations.sortOrder\":4},\"withStructure\":null,\"structureId\":null,\"level\":null,\"hasDescendants\":null,\"ancestorOf\":null,\"ancestorDist\":null,\"descendantOf\":null,\"descendantDist\":null,\"siblingOf\":null,\"prevSiblingOf\":null,\"nextSiblingOf\":null,\"positionedBefore\":null,\"positionedAfter\":null,\"select\":{\"**\":\"**\"},\"selectOption\":null,\"distinct\":null,\"from\":null,\"groupBy\":null,\"join\":[[\"INNER JOIN\",\"{{%relations}} relations\",[\"and\",\"[[relations.targetId]] = [[elements.id]]\"]]],\"having\":null,\"union\":null,\"params\":[],\"queryCacheDuration\":null,\"queryCacheDependency\":null,\"where\":null,\"limit\":null,\"offset\":null,\"indexBy\":null,\"emulateExecution\":false,\"availableProducts\":null,\"productName\":null,\"price\":null,\"image\":null,\"available\":null,\"newsFeed\":null,\"newsTitle\":null,\"newsDescription\":null,\"newsProducts\":null},\"owner\":{\"sectionId\":\"1\",\"typeId\":\"1\",\"authorId\":null,\"postDate\":\"2019-11-16T19:13:00-08:00\",\"expiryDate\":null,\"newParentId\":null,\"deletedWithEntryType\":false,\"id\":\"2\",\"tempId\":null,\"draftId\":null,\"revisionId\":null,\"uid\":\"7e2370a1-ddcf-4054-ace6-a33fbc894bac\",\"fieldLayoutId\":\"1\",\"contentId\":\"2\",\"enabled\":true,\"archived\":\"0\",\"siteId\":\"1\",\"enabledForSite\":true,\"title\":\"Home\",\"slug\":\"home\",\"uri\":\"__home__\",\"dateCreated\":\"2019-11-16T19:13:40-08:00\",\"dateUpdated\":\"2019-11-22T22:04:40-08:00\",\"dateDeleted\":null,\"trashed\":false,\"propagateAll\":false,\"newSiteIds\":[],\"resaving\":false,\"duplicateOf\":null,\"previewing\":false,\"hardDelete\":false,\"ref\":\"home/home\",\"status\":\"live\",\"structureId\":null,\"url\":\"http://localhost:8888/\",\"newsFeed\":{\"fieldId\":\"12\",\"ownerId\":\"2\",\"ownerSiteId\":null,\"allowOwnerDrafts\":null,\"allowOwnerRevisions\":null,\"typeId\":null,\"elementType\":\"craft\\\\elements\\\\MatrixBlock\",\"contentTable\":\"{{%content}}\",\"customFields\":null,\"inReverse\":false,\"asArray\":false,\"ignorePlaceholders\":false,\"drafts\":false,\"draftId\":null,\"draftOf\":null,\"draftCreator\":null,\"revisions\":false,\"revisionId\":null,\"revisionOf\":null,\"revisionCreator\":null,\"id\":null,\"uid\":null,\"fixedOrder\":false,\"status\":[\"enabled\"],\"archived\":false,\"trashed\":false,\"dateCreated\":null,\"dateUpdated\":null,\"siteId\":\"1\",\"unique\":false,\"preferSites\":false,\"enabledForSite\":true,\"leaves\":false,\"relatedTo\":null,\"title\":null,\"slug\":null,\"uri\":null,\"search\":null,\"ref\":null,\"with\":null,\"orderBy\":\"\",\"withStructure\":null,\"structureId\":null,\"level\":null,\"hasDescendants\":null,\"ancestorOf\":null,\"ancestorDist\":null,\"descendantOf\":null,\"descendantDist\":null,\"siblingOf\":null,\"prevSiblingOf\":null,\"nextSiblingOf\":null,\"positionedBefore\":null,\"positionedAfter\":null,\"select\":{\"**\":\"**\"},\"selectOption\":null,\"distinct\":null,\"from\":null,\"groupBy\":null,\"join\":null,\"having\":null,\"union\":null,\"params\":[],\"queryCacheDuration\":null,\"queryCacheDependency\":null,\"where\":null,\"limit\":null,\"offset\":null,\"indexBy\":null,\"emulateExecution\":false,\"availableProducts\":null,\"productName\":null,\"price\":null,\"image\":null,\"available\":null,\"newsFeed\":null,\"newsTitle\":null,\"newsDescription\":null,\"newsProducts\":null}}},\"eventClass\":\"craft\\\\events\\\\ModelEvent\",\"event\":{\"isNew\":[false],\"isValid\":[true]}}', 200, '{\"Access-Control-Allow-Origin\":[\"*\"],\"Content-Type\":[\"application/json\"],\"Date\":[\"Sat, 23 Nov 2019 06:04:44 GMT\"],\"P3P\":[\"CP=\\\"IDC DSP COR ADM DEVi TAIi PSA PSD IVAi IVDi CONi HIS OUR IND CNT\\\"\"],\"Response-Id\":[\"5dd8cbfc-c11a-4ea3-bf17-76cb8bd4f340\"],\"Server\":[\"nginx\"],\"Vary\":[\"X-Session-Key\"],\"X-Frame-Options\":[\"SAMEORIGIN\"],\"X-Rate-Limit-Limit\":[\"10000\"],\"X-Rate-Limit-Remaining\":[\"9987\"],\"X-Rate-Limit-Reset\":[\"1574489400\"],\"X-Session-Key\":[\"anonymous\"],\"X-Zapier-Fast-Return\":[\"true\"],\"X-Zapier-Jobs\":[\"A hacker like yourself should consider working at Zapier!\"],\"X-Zapier-Jobs-Link\":[\"https://zapier.com/jobs/\"],\"X-Zapier-Revision\":[\"a3f0f5a0e2f54d0ea7deec04bf25200b29167033\"],\"Content-Length\":[\"172\"],\"Connection\":[\"keep-alive\"]}', '{\"status\": \"success\", \"attempt\": \"5dd8cbfc-c11a-4ea3-bf17-76cb8bd4f340\", \"id\": \"55971d85-04f0-4d22-b1d7-161f4d16eaf4\", \"request_id\": \"5dd8cbfc-c11a-4ea3-bf17-76cb8bd4f340\"}', 1048, '2019-11-23 06:04:40', '2019-11-23 06:04:43', '8e28c1df-c26b-4d63-beba-e225c90ef063');
INSERT INTO `webhookrequests` (`id`, `webhookId`, `status`, `attempts`, `method`, `url`, `requestHeaders`, `requestBody`, `responseStatus`, `responseHeaders`, `responseBody`, `responseTime`, `dateCreated`, `dateRequested`, `uid`) VALUES
(50, 1, 'done', 1, 'post', 'https://hooks.zapier.com/hooks/catch/6128230/o4x908w/', '{\"Content-Type\":\"application/json\"}', '{\"time\":\"2019-11-22T22:04:40-08:00\",\"user\":{\"username\":\"admin\",\"photoId\":null,\"firstName\":null,\"lastName\":null,\"email\":\"h.lawrence@windowslive.com\",\"password\":\"••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••\",\"admin\":\"1\",\"locked\":\"0\",\"suspended\":\"0\",\"pending\":\"0\",\"lastLoginDate\":\"2019-11-22T21:50:49-08:00\",\"invalidLoginCount\":null,\"lastInvalidLoginDate\":null,\"lockoutDate\":null,\"hasDashboard\":\"1\",\"passwordResetRequired\":false,\"lastPasswordChangeDate\":null,\"unverifiedEmail\":null,\"newPassword\":null,\"currentPassword\":null,\"verificationCodeIssuedDate\":null,\"verificationCode\":null,\"lastLoginAttemptIp\":null,\"authError\":null,\"inheritorOnDelete\":null,\"id\":\"1\",\"tempId\":null,\"draftId\":null,\"revisionId\":null,\"uid\":\"0d8e884e-9a5c-4ec7-b3fd-d9f8b1fd3084\",\"fieldLayoutId\":null,\"contentId\":\"1\",\"enabled\":\"1\",\"archived\":\"0\",\"siteId\":\"1\",\"enabledForSite\":\"1\",\"title\":null,\"slug\":null,\"uri\":null,\"dateCreated\":\"2019-11-16T19:11:01-08:00\",\"dateUpdated\":\"2019-11-16T19:11:01-08:00\",\"dateDeleted\":null,\"trashed\":false,\"propagateAll\":false,\"newSiteIds\":[],\"resaving\":false,\"duplicateOf\":null,\"previewing\":false,\"hardDelete\":false,\"ref\":\"admin\",\"status\":\"active\",\"structureId\":null,\"url\":null,\"cooldownEndTime\":null,\"friendlyName\":\"admin\",\"fullName\":null,\"isCurrent\":true,\"name\":\"admin\",\"preferredLanguage\":\"en-GB\",\"remainingCooldownTime\":null},\"name\":\"afterPropagate\",\"senderClass\":\"craft\\\\elements\\\\MatrixBlock\",\"sender\":{\"fieldId\":\"12\",\"ownerId\":\"2\",\"ownerSiteId\":null,\"typeId\":\"3\",\"sortOrder\":4,\"collapsed\":false,\"deletedWithOwner\":false,\"id\":\"392\",\"tempId\":null,\"draftId\":null,\"revisionId\":null,\"uid\":\"c1a5756d-ddc9-46ab-9dfc-fc8cb48bc42e\",\"fieldLayoutId\":\"7\",\"contentId\":\"201\",\"enabled\":true,\"archived\":\"0\",\"siteId\":\"1\",\"enabledForSite\":true,\"title\":null,\"slug\":null,\"uri\":null,\"dateCreated\":\"2019-11-22T22:04:16-08:00\",\"dateUpdated\":\"2019-11-22T22:04:40-08:00\",\"dateDeleted\":null,\"trashed\":false,\"propagateAll\":false,\"newSiteIds\":[],\"resaving\":false,\"duplicateOf\":null,\"previewing\":false,\"hardDelete\":false,\"ref\":null,\"status\":\"enabled\",\"structureId\":null,\"url\":null,\"newsTitle\":\"erv\",\"newsDescription\":\"ver\",\"image\":{\"volumeId\":null,\"folderId\":null,\"filename\":null,\"kind\":null,\"width\":null,\"height\":null,\"size\":null,\"dateModified\":null,\"includeSubfolders\":false,\"withTransforms\":null,\"elementType\":\"craft\\\\elements\\\\Asset\",\"contentTable\":\"{{%content}}\",\"customFields\":{\"0\":{\"minBlocks\":\"\",\"maxBlocks\":\"\",\"contentTable\":\"{{%matrixcontent_availableproducts}}\",\"propagationMethod\":\"all\",\"localizeBlocks\":false,\"id\":\"6\",\"dateCreated\":\"2019-11-16T21:05:39-08:00\",\"dateUpdated\":\"2019-11-16T21:27:52-08:00\",\"groupId\":\"3\",\"name\":\"Available Products\",\"handle\":\"availableProducts\",\"context\":\"global\",\"instructions\":\"\",\"searchable\":\"1\",\"translationMethod\":\"site\",\"translationKeyFormat\":null,\"oldHandle\":null,\"oldSettings\":null,\"columnPrefix\":null,\"uid\":\"050801e0-9914-4a65-a49c-c3418c2da200\",\"layoutId\":null,\"tabId\":null,\"required\":null,\"sortOrder\":null},\"5\":{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\",\"id\":\"17\",\"dateCreated\":\"2019-11-22T17:30:59-08:00\",\"dateUpdated\":\"2019-11-22T17:30:59-08:00\",\"groupId\":\"5\",\"name\":\"News Description\",\"handle\":\"newsDescription\",\"context\":\"global\",\"instructions\":\"\",\"searchable\":\"1\",\"translationMethod\":\"none\",\"translationKeyFormat\":null,\"oldHandle\":null,\"oldSettings\":null,\"columnPrefix\":null,\"uid\":\"631b609a-3a78-4ddb-acae-caf3c6057662\",\"layoutId\":null,\"tabId\":null,\"required\":null,\"sortOrder\":null},\"6\":{\"minBlocks\":\"\",\"maxBlocks\":\"\",\"contentTable\":\"{{%matrixcontent_newsfeed}}\",\"propagationMethod\":\"all\",\"localizeBlocks\":false,\"id\":\"12\",\"dateCreated\":\"2019-11-16T21:33:06-08:00\",\"dateUpdated\":\"2019-11-16T21:33:06-08:00\",\"groupId\":\"4\",\"name\":\"News Feed\",\"handle\":\"newsFeed\",\"context\":\"global\",\"instructions\":\"\",\"searchable\":\"1\",\"translationMethod\":\"site\",\"translationKeyFormat\":null,\"oldHandle\":null,\"oldSettings\":null,\"columnPrefix\":null,\"uid\":\"737f3d64-426a-45e4-869b-05a5dcf2c242\",\"layoutId\":null,\"tabId\":null,\"required\":null,\"sortOrder\":null},\"7\":{\"sources\":[\"section:5a041f1d-964e-41a5-a3e7-36f0a91ec4e2\"],\"source\":null,\"targetSiteId\":null,\"viewMode\":null,\"limit\":\"6\",\"selectionLabel\":\"Add Products\",\"validateRelatedElements\":\"\",\"localizeRelations\":false,\"allowMultipleSources\":true,\"allowLimit\":true,\"id\":\"18\",\"dateCreated\":\"2019-11-22T17:31:57-08:00\",\"dateUpdated\":\"2019-11-22T17:31:57-08:00\",\"groupId\":\"5\",\"name\":\"News Products \",\"handle\":\"newsProducts\",\"context\":\"global\",\"instructions\":\"\",\"searchable\":\"1\",\"translationMethod\":\"site\",\"translationKeyFormat\":null,\"oldHandle\":null,\"oldSettings\":null,\"columnPrefix\":null,\"uid\":\"0b3353c6-6585-45e9-9b26-7f8a36124b56\",\"layoutId\":null,\"tabId\":null,\"required\":null,\"sortOrder\":null},\"9\":{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\",\"id\":\"16\",\"dateCreated\":\"2019-11-22T17:30:32-08:00\",\"dateUpdated\":\"2019-11-22T18:18:43-08:00\",\"groupId\":\"5\",\"name\":\"News Title\",\"handle\":\"newsTitle\",\"context\":\"global\",\"instructions\":\"\",\"searchable\":\"1\",\"translationMethod\":\"none\",\"translationKeyFormat\":null,\"oldHandle\":null,\"oldSettings\":null,\"columnPrefix\":null,\"uid\":\"c4585c4e-f4a6-439c-a95b-1f2a50263b07\",\"layoutId\":null,\"tabId\":null,\"required\":null,\"sortOrder\":null}},\"inReverse\":false,\"asArray\":false,\"ignorePlaceholders\":false,\"drafts\":false,\"draftId\":null,\"draftOf\":null,\"draftCreator\":null,\"revisions\":false,\"revisionId\":null,\"revisionOf\":null,\"revisionCreator\":null,\"id\":null,\"uid\":null,\"fixedOrder\":false,\"status\":[\"enabled\"],\"archived\":false,\"trashed\":false,\"dateCreated\":null,\"dateUpdated\":null,\"siteId\":1,\"unique\":false,\"preferSites\":false,\"enabledForSite\":true,\"leaves\":false,\"relatedTo\":null,\"title\":null,\"slug\":null,\"uri\":null,\"search\":null,\"ref\":null,\"with\":null,\"orderBy\":{\"relations.sortOrder\":4},\"withStructure\":null,\"structureId\":null,\"level\":null,\"hasDescendants\":null,\"ancestorOf\":null,\"ancestorDist\":null,\"descendantOf\":null,\"descendantDist\":null,\"siblingOf\":null,\"prevSiblingOf\":null,\"nextSiblingOf\":null,\"positionedBefore\":null,\"positionedAfter\":null,\"select\":{\"**\":\"**\"},\"selectOption\":null,\"distinct\":null,\"from\":null,\"groupBy\":null,\"join\":[[\"INNER JOIN\",\"{{%relations}} relations\",[\"and\",\"[[relations.targetId]] = [[elements.id]]\"]]],\"having\":null,\"union\":null,\"params\":[],\"queryCacheDuration\":null,\"queryCacheDependency\":null,\"where\":null,\"limit\":null,\"offset\":null,\"indexBy\":null,\"emulateExecution\":false,\"availableProducts\":null,\"productName\":null,\"price\":null,\"image\":null,\"available\":null,\"newsFeed\":null,\"newsTitle\":null,\"newsDescription\":null,\"newsProducts\":null},\"owner\":{\"sectionId\":\"1\",\"typeId\":\"1\",\"authorId\":null,\"postDate\":\"2019-11-16T19:13:00-08:00\",\"expiryDate\":null,\"newParentId\":null,\"deletedWithEntryType\":false,\"id\":\"2\",\"tempId\":null,\"draftId\":null,\"revisionId\":null,\"uid\":\"7e2370a1-ddcf-4054-ace6-a33fbc894bac\",\"fieldLayoutId\":\"1\",\"contentId\":\"2\",\"enabled\":true,\"archived\":\"0\",\"siteId\":\"1\",\"enabledForSite\":true,\"title\":\"Home\",\"slug\":\"home\",\"uri\":\"__home__\",\"dateCreated\":\"2019-11-16T19:13:40-08:00\",\"dateUpdated\":\"2019-11-22T22:04:40-08:00\",\"dateDeleted\":null,\"trashed\":false,\"propagateAll\":false,\"newSiteIds\":[],\"resaving\":false,\"duplicateOf\":null,\"previewing\":false,\"hardDelete\":false,\"ref\":\"home/home\",\"status\":\"live\",\"structureId\":null,\"url\":\"http://localhost:8888/\",\"newsFeed\":{\"fieldId\":\"12\",\"ownerId\":\"2\",\"ownerSiteId\":null,\"allowOwnerDrafts\":null,\"allowOwnerRevisions\":null,\"typeId\":null,\"elementType\":\"craft\\\\elements\\\\MatrixBlock\",\"contentTable\":\"{{%content}}\",\"customFields\":null,\"inReverse\":false,\"asArray\":false,\"ignorePlaceholders\":false,\"drafts\":false,\"draftId\":null,\"draftOf\":null,\"draftCreator\":null,\"revisions\":false,\"revisionId\":null,\"revisionOf\":null,\"revisionCreator\":null,\"id\":null,\"uid\":null,\"fixedOrder\":false,\"status\":[\"enabled\"],\"archived\":false,\"trashed\":false,\"dateCreated\":null,\"dateUpdated\":null,\"siteId\":\"1\",\"unique\":false,\"preferSites\":false,\"enabledForSite\":true,\"leaves\":false,\"relatedTo\":null,\"title\":null,\"slug\":null,\"uri\":null,\"search\":null,\"ref\":null,\"with\":null,\"orderBy\":\"\",\"withStructure\":null,\"structureId\":null,\"level\":null,\"hasDescendants\":null,\"ancestorOf\":null,\"ancestorDist\":null,\"descendantOf\":null,\"descendantDist\":null,\"siblingOf\":null,\"prevSiblingOf\":null,\"nextSiblingOf\":null,\"positionedBefore\":null,\"positionedAfter\":null,\"select\":{\"**\":\"**\"},\"selectOption\":null,\"distinct\":null,\"from\":null,\"groupBy\":null,\"join\":null,\"having\":null,\"union\":null,\"params\":[],\"queryCacheDuration\":null,\"queryCacheDependency\":null,\"where\":null,\"limit\":null,\"offset\":null,\"indexBy\":null,\"emulateExecution\":false,\"availableProducts\":null,\"productName\":null,\"price\":null,\"image\":null,\"available\":null,\"newsFeed\":null,\"newsTitle\":null,\"newsDescription\":null,\"newsProducts\":null}}},\"eventClass\":\"craft\\\\events\\\\ModelEvent\",\"event\":{\"isNew\":[false],\"isValid\":[true]}}', 200, '{\"Access-Control-Allow-Origin\":[\"*\"],\"Content-Type\":[\"application/json\"],\"Date\":[\"Sat, 23 Nov 2019 06:04:45 GMT\"],\"P3P\":[\"CP=\\\"IDC DSP COR ADM DEVi TAIi PSA PSD IVAi IVDi CONi HIS OUR IND CNT\\\"\"],\"Response-Id\":[\"5dd8cbfd-9074-4153-99e0-17332373f010\"],\"Server\":[\"nginx\"],\"Vary\":[\"X-Session-Key\"],\"X-Frame-Options\":[\"SAMEORIGIN\"],\"X-Rate-Limit-Limit\":[\"10000\"],\"X-Rate-Limit-Remaining\":[\"9986\"],\"X-Rate-Limit-Reset\":[\"1574489400\"],\"X-Session-Key\":[\"anonymous\"],\"X-Zapier-Fast-Return\":[\"true\"],\"X-Zapier-Jobs\":[\"A hacker like yourself should consider working at Zapier!\"],\"X-Zapier-Jobs-Link\":[\"https://zapier.com/jobs/\"],\"X-Zapier-Revision\":[\"a3f0f5a0e2f54d0ea7deec04bf25200b29167033\"],\"Content-Length\":[\"172\"],\"Connection\":[\"keep-alive\"]}', '{\"status\": \"success\", \"attempt\": \"5dd8cbfd-9074-4153-99e0-17332373f010\", \"id\": \"a7c2733b-0319-438c-b2b5-8323ab00925e\", \"request_id\": \"5dd8cbfd-9074-4153-99e0-17332373f010\"}', 1053, '2019-11-23 06:04:40', '2019-11-23 06:04:44', '6ccf4617-715c-4497-a9ca-10d5492cd4da'),
(51, 1, 'done', 1, 'post', 'https://hooks.zapier.com/hooks/catch/6128230/o4x908w/', '{\"Content-Type\":\"application/json\"}', '{\"time\":\"2019-11-22T22:04:40-08:00\",\"user\":{\"username\":\"admin\",\"photoId\":null,\"firstName\":null,\"lastName\":null,\"email\":\"h.lawrence@windowslive.com\",\"password\":\"••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••\",\"admin\":\"1\",\"locked\":\"0\",\"suspended\":\"0\",\"pending\":\"0\",\"lastLoginDate\":\"2019-11-22T21:50:49-08:00\",\"invalidLoginCount\":null,\"lastInvalidLoginDate\":null,\"lockoutDate\":null,\"hasDashboard\":\"1\",\"passwordResetRequired\":false,\"lastPasswordChangeDate\":null,\"unverifiedEmail\":null,\"newPassword\":null,\"currentPassword\":null,\"verificationCodeIssuedDate\":null,\"verificationCode\":null,\"lastLoginAttemptIp\":null,\"authError\":null,\"inheritorOnDelete\":null,\"id\":\"1\",\"tempId\":null,\"draftId\":null,\"revisionId\":null,\"uid\":\"0d8e884e-9a5c-4ec7-b3fd-d9f8b1fd3084\",\"fieldLayoutId\":null,\"contentId\":\"1\",\"enabled\":\"1\",\"archived\":\"0\",\"siteId\":\"1\",\"enabledForSite\":\"1\",\"title\":null,\"slug\":null,\"uri\":null,\"dateCreated\":\"2019-11-16T19:11:01-08:00\",\"dateUpdated\":\"2019-11-16T19:11:01-08:00\",\"dateDeleted\":null,\"trashed\":false,\"propagateAll\":false,\"newSiteIds\":[],\"resaving\":false,\"duplicateOf\":null,\"previewing\":false,\"hardDelete\":false,\"ref\":\"admin\",\"status\":\"active\",\"structureId\":null,\"url\":null,\"cooldownEndTime\":null,\"friendlyName\":\"admin\",\"fullName\":null,\"isCurrent\":true,\"name\":\"admin\",\"preferredLanguage\":\"en-GB\",\"remainingCooldownTime\":null},\"name\":\"afterPropagate\",\"senderClass\":\"craft\\\\elements\\\\MatrixBlock\",\"sender\":{\"fieldId\":\"12\",\"ownerId\":\"2\",\"ownerSiteId\":null,\"typeId\":\"3\",\"sortOrder\":5,\"collapsed\":false,\"deletedWithOwner\":false,\"id\":398,\"tempId\":null,\"draftId\":null,\"revisionId\":null,\"uid\":\"3833865d-b9bf-4b2e-a5d0-0de88c025817\",\"fieldLayoutId\":\"7\",\"contentId\":\"206\",\"enabled\":true,\"archived\":false,\"siteId\":\"1\",\"enabledForSite\":true,\"title\":null,\"slug\":null,\"uri\":null,\"dateCreated\":\"2019-11-22T22:04:40-08:00\",\"dateUpdated\":\"2019-11-22T22:04:40-08:00\",\"dateDeleted\":null,\"trashed\":false,\"propagateAll\":true,\"newSiteIds\":[],\"resaving\":false,\"duplicateOf\":null,\"previewing\":false,\"hardDelete\":false,\"ref\":null,\"status\":\"enabled\",\"structureId\":null,\"url\":null,\"newsTitle\":\"wef\",\"newsDescription\":\"dw\",\"image\":{\"volumeId\":null,\"folderId\":null,\"filename\":null,\"kind\":null,\"width\":null,\"height\":null,\"size\":null,\"dateModified\":null,\"includeSubfolders\":false,\"withTransforms\":null,\"elementType\":\"craft\\\\elements\\\\Asset\",\"contentTable\":\"{{%content}}\",\"customFields\":null,\"inReverse\":false,\"asArray\":false,\"ignorePlaceholders\":false,\"drafts\":false,\"draftId\":null,\"draftOf\":null,\"draftCreator\":null,\"revisions\":false,\"revisionId\":null,\"revisionOf\":null,\"revisionCreator\":null,\"id\":null,\"uid\":null,\"fixedOrder\":false,\"status\":[\"enabled\"],\"archived\":false,\"trashed\":false,\"dateCreated\":null,\"dateUpdated\":null,\"siteId\":1,\"unique\":false,\"preferSites\":false,\"enabledForSite\":true,\"leaves\":false,\"relatedTo\":null,\"title\":null,\"slug\":null,\"uri\":null,\"search\":null,\"ref\":null,\"with\":null,\"orderBy\":{\"relations.sortOrder\":4},\"withStructure\":null,\"structureId\":null,\"level\":null,\"hasDescendants\":null,\"ancestorOf\":null,\"ancestorDist\":null,\"descendantOf\":null,\"descendantDist\":null,\"siblingOf\":null,\"prevSiblingOf\":null,\"nextSiblingOf\":null,\"positionedBefore\":null,\"positionedAfter\":null,\"select\":{\"**\":\"**\"},\"selectOption\":null,\"distinct\":null,\"from\":null,\"groupBy\":null,\"join\":[[\"INNER JOIN\",\"{{%relations}} relations\",[\"and\",\"[[relations.targetId]] = [[elements.id]]\"]]],\"having\":null,\"union\":null,\"params\":[],\"queryCacheDuration\":null,\"queryCacheDependency\":null,\"where\":null,\"limit\":null,\"offset\":null,\"indexBy\":null,\"emulateExecution\":false,\"availableProducts\":null,\"productName\":null,\"price\":null,\"image\":null,\"available\":null,\"newsFeed\":null,\"newsTitle\":null,\"newsDescription\":null,\"newsProducts\":null},\"owner\":{\"sectionId\":\"1\",\"typeId\":\"1\",\"authorId\":null,\"postDate\":\"2019-11-16T19:13:00-08:00\",\"expiryDate\":null,\"newParentId\":null,\"deletedWithEntryType\":false,\"id\":\"2\",\"tempId\":null,\"draftId\":null,\"revisionId\":null,\"uid\":\"7e2370a1-ddcf-4054-ace6-a33fbc894bac\",\"fieldLayoutId\":\"1\",\"contentId\":\"2\",\"enabled\":true,\"archived\":\"0\",\"siteId\":\"1\",\"enabledForSite\":true,\"title\":\"Home\",\"slug\":\"home\",\"uri\":\"__home__\",\"dateCreated\":\"2019-11-16T19:13:40-08:00\",\"dateUpdated\":\"2019-11-22T22:04:40-08:00\",\"dateDeleted\":null,\"trashed\":false,\"propagateAll\":false,\"newSiteIds\":[],\"resaving\":false,\"duplicateOf\":null,\"previewing\":false,\"hardDelete\":false,\"ref\":\"home/home\",\"status\":\"live\",\"structureId\":null,\"url\":\"http://localhost:8888/\",\"newsFeed\":{\"fieldId\":\"12\",\"ownerId\":\"2\",\"ownerSiteId\":null,\"allowOwnerDrafts\":null,\"allowOwnerRevisions\":null,\"typeId\":null,\"elementType\":\"craft\\\\elements\\\\MatrixBlock\",\"contentTable\":\"{{%content}}\",\"customFields\":null,\"inReverse\":false,\"asArray\":false,\"ignorePlaceholders\":false,\"drafts\":false,\"draftId\":null,\"draftOf\":null,\"draftCreator\":null,\"revisions\":false,\"revisionId\":null,\"revisionOf\":null,\"revisionCreator\":null,\"id\":null,\"uid\":null,\"fixedOrder\":false,\"status\":[\"enabled\"],\"archived\":false,\"trashed\":false,\"dateCreated\":null,\"dateUpdated\":null,\"siteId\":\"1\",\"unique\":false,\"preferSites\":false,\"enabledForSite\":true,\"leaves\":false,\"relatedTo\":null,\"title\":null,\"slug\":null,\"uri\":null,\"search\":null,\"ref\":null,\"with\":null,\"orderBy\":\"\",\"withStructure\":null,\"structureId\":null,\"level\":null,\"hasDescendants\":null,\"ancestorOf\":null,\"ancestorDist\":null,\"descendantOf\":null,\"descendantDist\":null,\"siblingOf\":null,\"prevSiblingOf\":null,\"nextSiblingOf\":null,\"positionedBefore\":null,\"positionedAfter\":null,\"select\":{\"**\":\"**\"},\"selectOption\":null,\"distinct\":null,\"from\":null,\"groupBy\":null,\"join\":null,\"having\":null,\"union\":null,\"params\":[],\"queryCacheDuration\":null,\"queryCacheDependency\":null,\"where\":null,\"limit\":null,\"offset\":null,\"indexBy\":null,\"emulateExecution\":false,\"availableProducts\":null,\"productName\":null,\"price\":null,\"image\":null,\"available\":null,\"newsFeed\":null,\"newsTitle\":null,\"newsDescription\":null,\"newsProducts\":null}}},\"eventClass\":\"craft\\\\events\\\\ModelEvent\",\"event\":{\"isNew\":[true],\"isValid\":[true]}}', 200, '{\"Access-Control-Allow-Origin\":[\"*\"],\"Content-Type\":[\"application/json\"],\"Date\":[\"Sat, 23 Nov 2019 06:04:46 GMT\"],\"P3P\":[\"CP=\\\"IDC DSP COR ADM DEVi TAIi PSA PSD IVAi IVDi CONi HIS OUR IND CNT\\\"\"],\"Response-Id\":[\"5dd8cbfe-bb43-4c12-9ead-7b0c7cf52220\"],\"Server\":[\"nginx\"],\"Vary\":[\"X-Session-Key\"],\"X-Frame-Options\":[\"SAMEORIGIN\"],\"X-Rate-Limit-Limit\":[\"10000\"],\"X-Rate-Limit-Remaining\":[\"9985\"],\"X-Rate-Limit-Reset\":[\"1574489400\"],\"X-Session-Key\":[\"anonymous\"],\"X-Zapier-Fast-Return\":[\"true\"],\"X-Zapier-Jobs\":[\"A hacker like yourself should consider working at Zapier!\"],\"X-Zapier-Jobs-Link\":[\"https://zapier.com/jobs/\"],\"X-Zapier-Revision\":[\"a3f0f5a0e2f54d0ea7deec04bf25200b29167033\"],\"Content-Length\":[\"172\"],\"Connection\":[\"keep-alive\"]}', '{\"status\": \"success\", \"attempt\": \"5dd8cbfe-bb43-4c12-9ead-7b0c7cf52220\", \"id\": \"269a99c8-e26f-4676-b83e-b02c2e29bfc2\", \"request_id\": \"5dd8cbfe-bb43-4c12-9ead-7b0c7cf52220\"}', 1045, '2019-11-23 06:04:40', '2019-11-23 06:04:45', 'df46e97a-3a96-4d01-8f4f-019aa8bc3980'),
(52, 1, 'done', 1, 'post', 'https://hooks.zapier.com/hooks/catch/6128230/o4x908w/', '{\"Content-Type\":\"application/json\"}', '{\"time\":\"2019-11-22T22:04:40-08:00\",\"user\":{\"username\":\"admin\",\"photoId\":null,\"firstName\":null,\"lastName\":null,\"email\":\"h.lawrence@windowslive.com\",\"password\":\"••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••\",\"admin\":\"1\",\"locked\":\"0\",\"suspended\":\"0\",\"pending\":\"0\",\"lastLoginDate\":\"2019-11-22T21:50:49-08:00\",\"invalidLoginCount\":null,\"lastInvalidLoginDate\":null,\"lockoutDate\":null,\"hasDashboard\":\"1\",\"passwordResetRequired\":false,\"lastPasswordChangeDate\":null,\"unverifiedEmail\":null,\"newPassword\":null,\"currentPassword\":null,\"verificationCodeIssuedDate\":null,\"verificationCode\":null,\"lastLoginAttemptIp\":null,\"authError\":null,\"inheritorOnDelete\":null,\"id\":\"1\",\"tempId\":null,\"draftId\":null,\"revisionId\":null,\"uid\":\"0d8e884e-9a5c-4ec7-b3fd-d9f8b1fd3084\",\"fieldLayoutId\":null,\"contentId\":\"1\",\"enabled\":\"1\",\"archived\":\"0\",\"siteId\":\"1\",\"enabledForSite\":\"1\",\"title\":null,\"slug\":null,\"uri\":null,\"dateCreated\":\"2019-11-16T19:11:01-08:00\",\"dateUpdated\":\"2019-11-16T19:11:01-08:00\",\"dateDeleted\":null,\"trashed\":false,\"propagateAll\":false,\"newSiteIds\":[],\"resaving\":false,\"duplicateOf\":null,\"previewing\":false,\"hardDelete\":false,\"ref\":\"admin\",\"status\":\"active\",\"structureId\":null,\"url\":null,\"cooldownEndTime\":null,\"friendlyName\":\"admin\",\"fullName\":null,\"isCurrent\":true,\"name\":\"admin\",\"preferredLanguage\":\"en-GB\",\"remainingCooldownTime\":null},\"name\":\"afterPropagate\",\"senderClass\":\"craft\\\\elements\\\\MatrixBlock\",\"sender\":{\"fieldId\":\"12\",\"ownerId\":399,\"ownerSiteId\":null,\"typeId\":\"3\",\"sortOrder\":1,\"collapsed\":false,\"deletedWithOwner\":false,\"id\":400,\"tempId\":null,\"draftId\":null,\"revisionId\":null,\"uid\":\"1da56711-7b91-44be-b714-2a4e2eda0fc6\",\"fieldLayoutId\":\"7\",\"contentId\":\"207\",\"enabled\":true,\"archived\":\"0\",\"siteId\":\"1\",\"enabledForSite\":true,\"title\":null,\"slug\":null,\"uri\":null,\"dateCreated\":\"2019-11-22T22:04:40-08:00\",\"dateUpdated\":\"2019-11-22T22:04:40-08:00\",\"dateDeleted\":null,\"trashed\":false,\"propagateAll\":true,\"newSiteIds\":[],\"resaving\":false,\"duplicateOf\":{\"fieldId\":\"12\",\"ownerId\":\"2\",\"ownerSiteId\":null,\"typeId\":\"3\",\"sortOrder\":1,\"collapsed\":false,\"deletedWithOwner\":false,\"id\":\"10\",\"tempId\":null,\"draftId\":null,\"revisionId\":null,\"uid\":\"9bb2ea1d-b3c0-48ef-80f0-3a8a4897ea57\",\"fieldLayoutId\":\"7\",\"contentId\":\"2\",\"enabled\":true,\"archived\":\"0\",\"siteId\":\"1\",\"enabledForSite\":true,\"title\":null,\"slug\":null,\"uri\":null,\"dateCreated\":\"2019-11-16T21:35:01-08:00\",\"dateUpdated\":\"2019-11-22T22:04:40-08:00\",\"dateDeleted\":null,\"trashed\":false,\"propagateAll\":false,\"newSiteIds\":[],\"resaving\":false,\"duplicateOf\":null,\"previewing\":false,\"hardDelete\":false,\"ref\":null,\"status\":\"enabled\",\"structureId\":null,\"url\":null,\"newsTitle\":\"wow new cool title newer!!\",\"newsDescription\":\"descriptiondescriptiondescriptionsww\",\"image\":{\"volumeId\":null,\"folderId\":null,\"filename\":null,\"kind\":null,\"width\":null,\"height\":null,\"size\":null,\"dateModified\":null,\"includeSubfolders\":false,\"withTransforms\":null,\"elementType\":\"craft\\\\elements\\\\Asset\",\"contentTable\":\"{{%content}}\",\"customFields\":{\"0\":{\"minBlocks\":\"\",\"maxBlocks\":\"\",\"contentTable\":\"{{%matrixcontent_availableproducts}}\",\"propagationMethod\":\"all\",\"localizeBlocks\":false,\"id\":\"6\",\"dateCreated\":\"2019-11-16T21:05:39-08:00\",\"dateUpdated\":\"2019-11-16T21:27:52-08:00\",\"groupId\":\"3\",\"name\":\"Available Products\",\"handle\":\"availableProducts\",\"context\":\"global\",\"instructions\":\"\",\"searchable\":\"1\",\"translationMethod\":\"site\",\"translationKeyFormat\":null,\"oldHandle\":null,\"oldSettings\":null,\"columnPrefix\":null,\"uid\":\"050801e0-9914-4a65-a49c-c3418c2da200\",\"layoutId\":null,\"tabId\":null,\"required\":null,\"sortOrder\":null},\"5\":{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\",\"id\":\"17\",\"dateCreated\":\"2019-11-22T17:30:59-08:00\",\"dateUpdated\":\"2019-11-22T17:30:59-08:00\",\"groupId\":\"5\",\"name\":\"News Description\",\"handle\":\"newsDescription\",\"context\":\"global\",\"instructions\":\"\",\"searchable\":\"1\",\"translationMethod\":\"none\",\"translationKeyFormat\":null,\"oldHandle\":null,\"oldSettings\":null,\"columnPrefix\":null,\"uid\":\"631b609a-3a78-4ddb-acae-caf3c6057662\",\"layoutId\":null,\"tabId\":null,\"required\":null,\"sortOrder\":null},\"6\":{\"minBlocks\":\"\",\"maxBlocks\":\"\",\"contentTable\":\"{{%matrixcontent_newsfeed}}\",\"propagationMethod\":\"all\",\"localizeBlocks\":false,\"id\":\"12\",\"dateCreated\":\"2019-11-16T21:33:06-08:00\",\"dateUpdated\":\"2019-11-16T21:33:06-08:00\",\"groupId\":\"4\",\"name\":\"News Feed\",\"handle\":\"newsFeed\",\"context\":\"global\",\"instructions\":\"\",\"searchable\":\"1\",\"translationMethod\":\"site\",\"translationKeyFormat\":null,\"oldHandle\":null,\"oldSettings\":null,\"columnPrefix\":null,\"uid\":\"737f3d64-426a-45e4-869b-05a5dcf2c242\",\"layoutId\":null,\"tabId\":null,\"required\":null,\"sortOrder\":null},\"7\":{\"source\":null,\"targetSiteId\":null,\"viewMode\":null,\"limit\":\"6\",\"selectionLabel\":\"Add Products\",\"validateRelatedElements\":\"\",\"localizeRelations\":false,\"allowMultipleSources\":true,\"allowLimit\":true,\"id\":\"18\",\"dateCreated\":\"2019-11-22T17:31:57-08:00\",\"dateUpdated\":\"2019-11-22T17:31:57-08:00\",\"groupId\":\"5\",\"name\":\"News Products \",\"handle\":\"newsProducts\",\"context\":\"global\",\"instructions\":\"\",\"searchable\":\"1\",\"translationMethod\":\"site\",\"translationKeyFormat\":null,\"oldHandle\":null,\"oldSettings\":null,\"columnPrefix\":null,\"uid\":\"0b3353c6-6585-45e9-9b26-7f8a36124b56\",\"layoutId\":null,\"tabId\":null,\"required\":null,\"sortOrder\":null},\"9\":{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\",\"id\":\"16\",\"dateCreated\":\"2019-11-22T17:30:32-08:00\",\"dateUpdated\":\"2019-11-22T18:18:43-08:00\",\"groupId\":\"5\",\"name\":\"News Title\",\"handle\":\"newsTitle\",\"context\":\"global\",\"instructions\":\"\",\"searchable\":\"1\",\"translationMethod\":\"none\",\"translationKeyFormat\":null,\"oldHandle\":null,\"oldSettings\":null,\"columnPrefix\":null,\"uid\":\"c4585c4e-f4a6-439c-a95b-1f2a50263b07\",\"layoutId\":null,\"tabId\":null,\"required\":null,\"sortOrder\":null}},\"inReverse\":false,\"asArray\":false,\"ignorePlaceholders\":false,\"drafts\":false,\"draftId\":null,\"draftOf\":null,\"draftCreator\":null,\"revisions\":false,\"revisionId\":null,\"revisionOf\":null,\"revisionCreator\":null,\"id\":null,\"uid\":null,\"fixedOrder\":false,\"status\":[\"enabled\"],\"archived\":false,\"trashed\":false,\"dateCreated\":null,\"dateUpdated\":null,\"siteId\":1,\"unique\":false,\"preferSites\":false,\"enabledForSite\":true,\"leaves\":false,\"relatedTo\":null,\"title\":null,\"slug\":null,\"uri\":null,\"search\":null,\"ref\":null,\"with\":null,\"orderBy\":{\"relations.sortOrder\":4},\"withStructure\":null,\"structureId\":null,\"level\":null,\"hasDescendants\":null,\"ancestorOf\":null,\"ancestorDist\":null,\"descendantOf\":null,\"descendantDist\":null,\"siblingOf\":null,\"prevSiblingOf\":null,\"nextSiblingOf\":null,\"positionedBefore\":null,\"positionedAfter\":null,\"select\":{\"**\":\"**\"},\"selectOption\":null,\"distinct\":null,\"from\":null,\"groupBy\":null,\"join\":[[\"INNER JOIN\",\"{{%relations}} relations\"]],\"having\":null,\"union\":null,\"params\":[],\"queryCacheDuration\":null,\"queryCacheDependency\":null,\"where\":null,\"limit\":null,\"offset\":null,\"indexBy\":null,\"emulateExecution\":false,\"availableProducts\":null,\"productName\":null,\"price\":null,\"image\":null,\"available\":null,\"newsFeed\":null,\"newsTitle\":null,\"newsDescription\":null,\"newsProducts\":null},\"owner\":{\"sectionId\":\"1\",\"typeId\":\"1\",\"authorId\":null,\"postDate\":\"2019-11-16T19:13:00-08:00\",\"expiryDate\":null,\"newParentId\":null,\"deletedWithEntryType\":false,\"id\":\"2\",\"tempId\":null,\"draftId\":null,\"revisionId\":null,\"uid\":\"7e2370a1-ddcf-4054-ace6-a33fbc894bac\",\"fieldLayoutId\":\"1\",\"contentId\":\"2\",\"enabled\":true,\"archived\":\"0\",\"siteId\":\"1\",\"enabledForSite\":true,\"title\":\"Home\",\"slug\":\"home\",\"uri\":\"__home__\",\"dateCreated\":\"2019-11-16T19:13:40-08:00\",\"dateUpdated\":\"2019-11-22T22:04:40-08:00\",\"dateDeleted\":null,\"trashed\":false,\"propagateAll\":false,\"newSiteIds\":[],\"resaving\":false,\"duplicateOf\":null,\"previewing\":false,\"hardDelete\":false,\"ref\":\"home/home\",\"status\":\"live\",\"structureId\":null,\"url\":\"http://localhost:8888/\",\"newsFeed\":{\"fieldId\":\"12\",\"ownerId\":\"2\",\"ownerSiteId\":null,\"allowOwnerDrafts\":null,\"allowOwnerRevisions\":null,\"typeId\":null,\"elementType\":\"craft\\\\elements\\\\MatrixBlock\",\"contentTable\":\"{{%content}}\",\"customFields\":null,\"inReverse\":false,\"asArray\":false,\"ignorePlaceholders\":false,\"drafts\":false,\"draftId\":null,\"draftOf\":null,\"draftCreator\":null,\"revisions\":false,\"revisionId\":null,\"revisionOf\":null,\"revisionCreator\":null,\"id\":null,\"uid\":null,\"fixedOrder\":false,\"status\":[\"enabled\"],\"archived\":false,\"trashed\":false,\"dateCreated\":null,\"dateUpdated\":null,\"siteId\":\"1\",\"unique\":false,\"preferSites\":false,\"enabledForSite\":true,\"leaves\":false,\"relatedTo\":null,\"title\":null,\"slug\":null,\"uri\":null,\"search\":null,\"ref\":null,\"with\":null,\"orderBy\":\"\",\"withStructure\":null,\"structureId\":null,\"level\":null,\"hasDescendants\":null,\"ancestorOf\":null,\"ancestorDist\":null,\"descendantOf\":null,\"descendantDist\":null,\"siblingOf\":null,\"prevSiblingOf\":null,\"nextSiblingOf\":null,\"positionedBefore\":null,\"positionedAfter\":null,\"select\":{\"**\":\"**\"},\"selectOption\":null,\"distinct\":null,\"from\":null,\"groupBy\":null,\"join\":null,\"having\":null,\"union\":null,\"params\":[],\"queryCacheDuration\":null,\"queryCacheDependency\":null,\"where\":null,\"limit\":null,\"offset\":null,\"indexBy\":null,\"emulateExecution\":false,\"availableProducts\":null,\"productName\":null,\"price\":null,\"image\":null,\"available\":null,\"newsFeed\":null,\"newsTitle\":null,\"newsDescription\":null,\"newsProducts\":null}}},\"previewing\":false,\"hardDelete\":false,\"ref\":null,\"status\":\"enabled\",\"structureId\":null,\"url\":null,\"newsTitle\":\"wow new cool title newer!!\",\"newsDescription\":\"descriptiondescriptiondescriptionsww\",\"image\":{\"volumeId\":null,\"folderId\":null,\"filename\":null,\"kind\":null,\"width\":null,\"height\":null,\"size\":null,\"dateModified\":null,\"includeSubfolders\":false,\"withTransforms\":null,\"elementType\":\"craft\\\\elements\\\\Asset\",\"contentTable\":\"{{%content}}\",\"customFields\":null,\"inReverse\":false,\"asArray\":false,\"ignorePlaceholders\":false,\"drafts\":false,\"draftId\":null,\"draftOf\":null,\"draftCreator\":null,\"revisions\":false,\"revisionId\":null,\"revisionOf\":null,\"revisionCreator\":null,\"id\":null,\"uid\":null,\"fixedOrder\":false,\"status\":[\"enabled\"],\"archived\":false,\"trashed\":false,\"dateCreated\":null,\"dateUpdated\":null,\"siteId\":1,\"unique\":false,\"preferSites\":false,\"enabledForSite\":true,\"leaves\":false,\"relatedTo\":null,\"title\":null,\"slug\":null,\"uri\":null,\"search\":null,\"ref\":null,\"with\":null,\"orderBy\":{\"relations.sortOrder\":4},\"withStructure\":null,\"structureId\":null,\"level\":null,\"hasDescendants\":null,\"ancestorOf\":null,\"ancestorDist\":null,\"descendantOf\":null,\"descendantDist\":null,\"siblingOf\":null,\"prevSiblingOf\":null,\"nextSiblingOf\":null,\"positionedBefore\":null,\"positionedAfter\":null,\"select\":{\"**\":\"**\"},\"selectOption\":null,\"distinct\":null,\"from\":null,\"groupBy\":null,\"join\":[[\"INNER JOIN\",\"{{%relations}} relations\",[\"and\",\"[[relations.targetId]] = [[elements.id]]\"]]],\"having\":null,\"union\":null,\"params\":[],\"queryCacheDuration\":null,\"queryCacheDependency\":null,\"where\":null,\"limit\":null,\"offset\":null,\"indexBy\":null,\"emulateExecution\":false,\"availableProducts\":null,\"productName\":null,\"price\":null,\"image\":null,\"available\":null,\"newsFeed\":null,\"newsTitle\":null,\"newsDescription\":null,\"newsProducts\":null},\"owner\":{\"sectionId\":\"1\",\"typeId\":\"1\",\"authorId\":null,\"postDate\":\"2019-11-16T19:13:00-08:00\",\"expiryDate\":null,\"newParentId\":null,\"deletedWithEntryType\":false,\"id\":399,\"tempId\":null,\"draftId\":null,\"revisionId\":\"84\",\"uid\":\"35744967-bd6f-4ff2-acb2-4f16852bdec4\",\"fieldLayoutId\":\"1\",\"contentId\":\"144\",\"enabled\":true,\"archived\":\"0\",\"siteId\":\"1\",\"enabledForSite\":true,\"title\":\"Home\",\"slug\":\"home\",\"uri\":\"__home__\",\"dateCreated\":\"2019-11-22T22:04:40-08:00\",\"dateUpdated\":\"2019-11-22T22:04:40-08:00\",\"dateDeleted\":null,\"trashed\":false,\"propagateAll\":false,\"newSiteIds\":[],\"resaving\":false,\"duplicateOf\":{\"sectionId\":\"1\",\"typeId\":\"1\",\"authorId\":null,\"postDate\":\"2019-11-16T19:13:00-08:00\",\"expiryDate\":null,\"newParentId\":null,\"deletedWithEntryType\":false,\"id\":\"2\",\"tempId\":null,\"draftId\":null,\"revisionId\":null,\"uid\":\"7e2370a1-ddcf-4054-ace6-a33fbc894bac\",\"fieldLayoutId\":\"1\",\"contentId\":\"2\",\"enabled\":true,\"archived\":\"0\",\"siteId\":\"1\",\"enabledForSite\":true,\"title\":\"Home\",\"slug\":\"home\",\"uri\":\"__home__\",\"dateCreated\":\"2019-11-16T19:13:40-08:00\",\"dateUpdated\":\"2019-11-22T22:04:40-08:00\",\"dateDeleted\":null,\"trashed\":false,\"propagateAll\":false,\"newSiteIds\":[],\"resaving\":false,\"duplicateOf\":null,\"previewing\":false,\"hardDelete\":false,\"ref\":\"home/home\",\"status\":\"live\",\"structureId\":null,\"url\":\"http://localhost:8888/\",\"newsFeed\":{\"fieldId\":\"12\",\"ownerId\":\"2\",\"ownerSiteId\":null,\"allowOwnerDrafts\":null,\"allowOwnerRevisions\":null,\"typeId\":null,\"elementType\":\"craft\\\\elements\\\\MatrixBlock\",\"contentTable\":\"{{%content}}\",\"customFields\":null,\"inReverse\":false,\"asArray\":false,\"ignorePlaceholders\":false,\"drafts\":false,\"draftId\":null,\"draftOf\":null,\"draftCreator\":null,\"revisions\":false,\"revisionId\":null,\"revisionOf\":null,\"revisionCreator\":null,\"id\":null,\"uid\":null,\"fixedOrder\":false,\"status\":[\"enabled\"],\"archived\":false,\"trashed\":false,\"dateCreated\":null,\"dateUpdated\":null,\"siteId\":\"1\",\"unique\":false,\"preferSites\":false,\"enabledForSite\":true,\"leaves\":false,\"relatedTo\":null,\"title\":null,\"slug\":null,\"uri\":null,\"search\":null,\"ref\":null,\"with\":null,\"orderBy\":\"\",\"withStructure\":null,\"structureId\":null,\"level\":null,\"hasDescendants\":null,\"ancestorOf\":null,\"ancestorDist\":null,\"descendantOf\":null,\"descendantDist\":null,\"siblingOf\":null,\"prevSiblingOf\":null,\"nextSiblingOf\":null,\"positionedBefore\":null,\"positionedAfter\":null,\"select\":{\"**\":\"**\"},\"selectOption\":null,\"distinct\":null,\"from\":null,\"groupBy\":null,\"join\":null,\"having\":null,\"union\":null,\"params\":[],\"queryCacheDuration\":null,\"queryCacheDependency\":null,\"where\":null,\"limit\":null,\"offset\":null,\"indexBy\":null,\"emulateExecution\":false,\"availableProducts\":null,\"productName\":null,\"price\":null,\"image\":null,\"available\":null,\"newsFeed\":null,\"newsTitle\":null,\"newsDescription\":null,\"newsProducts\":null}},\"previewing\":false,\"hardDelete\":false,\"ref\":\"home/home\",\"status\":\"live\",\"structureId\":null,\"url\":\"http://localhost:8888/\",\"newsFeed\":{\"fieldId\":\"12\",\"ownerId\":\"2\",\"ownerSiteId\":null,\"allowOwnerDrafts\":null,\"allowOwnerRevisions\":null,\"typeId\":null,\"elementType\":\"craft\\\\elements\\\\MatrixBlock\",\"contentTable\":\"{{%content}}\",\"customFields\":null,\"inReverse\":false,\"asArray\":false,\"ignorePlaceholders\":false,\"drafts\":false,\"draftId\":null,\"draftOf\":null,\"draftCreator\":null,\"revisions\":false,\"revisionId\":null,\"revisionOf\":null,\"revisionCreator\":null,\"id\":null,\"uid\":null,\"fixedOrder\":false,\"status\":[\"enabled\"],\"archived\":false,\"trashed\":false,\"dateCreated\":null,\"dateUpdated\":null,\"siteId\":\"1\",\"unique\":false,\"preferSites\":false,\"enabledForSite\":true,\"leaves\":false,\"relatedTo\":null,\"title\":null,\"slug\":null,\"uri\":null,\"search\":null,\"ref\":null,\"with\":null,\"orderBy\":\"\",\"withStructure\":null,\"structureId\":null,\"level\":null,\"hasDescendants\":null,\"ancestorOf\":null,\"ancestorDist\":null,\"descendantOf\":null,\"descendantDist\":null,\"siblingOf\":null,\"prevSiblingOf\":null,\"nextSiblingOf\":null,\"positionedBefore\":null,\"positionedAfter\":null,\"select\":{\"**\":\"**\"},\"selectOption\":null,\"distinct\":null,\"from\":null,\"groupBy\":null,\"join\":null,\"having\":null,\"union\":null,\"params\":[],\"queryCacheDuration\":null,\"queryCacheDependency\":null,\"where\":null,\"limit\":null,\"offset\":null,\"indexBy\":null,\"emulateExecution\":false,\"availableProducts\":null,\"productName\":null,\"price\":null,\"image\":null,\"available\":null,\"newsFeed\":null,\"newsTitle\":null,\"newsDescription\":null,\"newsProducts\":null}}},\"eventClass\":\"craft\\\\events\\\\ModelEvent\",\"event\":{\"isNew\":[true],\"isValid\":[true]}}', 200, '{\"Access-Control-Allow-Origin\":[\"*\"],\"Content-Type\":[\"application/json\"],\"Date\":[\"Sat, 23 Nov 2019 06:04:48 GMT\"],\"P3P\":[\"CP=\\\"IDC DSP COR ADM DEVi TAIi PSA PSD IVAi IVDi CONi HIS OUR IND CNT\\\"\"],\"Response-Id\":[\"5dd8cc00-be2f-416c-b619-3e8cd078dbb0\"],\"Server\":[\"nginx\"],\"Vary\":[\"X-Session-Key\"],\"X-Frame-Options\":[\"SAMEORIGIN\"],\"X-Rate-Limit-Limit\":[\"10000\"],\"X-Rate-Limit-Remaining\":[\"9984\"],\"X-Rate-Limit-Reset\":[\"1574489400\"],\"X-Session-Key\":[\"anonymous\"],\"X-Zapier-Fast-Return\":[\"true\"],\"X-Zapier-Jobs\":[\"A hacker like yourself should consider working at Zapier!\"],\"X-Zapier-Jobs-Link\":[\"https://zapier.com/jobs/\"],\"X-Zapier-Revision\":[\"a3f0f5a0e2f54d0ea7deec04bf25200b29167033\"],\"Content-Length\":[\"172\"],\"Connection\":[\"keep-alive\"]}', '{\"status\": \"success\", \"attempt\": \"5dd8cc00-be2f-416c-b619-3e8cd078dbb0\", \"id\": \"4bcedfef-6d8e-47e3-938c-fd39f964512a\", \"request_id\": \"5dd8cc00-be2f-416c-b619-3e8cd078dbb0\"}', 1244, '2019-11-23 06:04:40', '2019-11-23 06:04:46', 'ff9536b1-eaae-4bde-b228-bcf8f3451579');
INSERT INTO `webhookrequests` (`id`, `webhookId`, `status`, `attempts`, `method`, `url`, `requestHeaders`, `requestBody`, `responseStatus`, `responseHeaders`, `responseBody`, `responseTime`, `dateCreated`, `dateRequested`, `uid`) VALUES
(53, 1, 'done', 1, 'post', 'https://hooks.zapier.com/hooks/catch/6128230/o4x908w/', '{\"Content-Type\":\"application/json\"}', '{\"time\":\"2019-11-22T22:04:40-08:00\",\"user\":{\"username\":\"admin\",\"photoId\":null,\"firstName\":null,\"lastName\":null,\"email\":\"h.lawrence@windowslive.com\",\"password\":\"••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••\",\"admin\":\"1\",\"locked\":\"0\",\"suspended\":\"0\",\"pending\":\"0\",\"lastLoginDate\":\"2019-11-22T21:50:49-08:00\",\"invalidLoginCount\":null,\"lastInvalidLoginDate\":null,\"lockoutDate\":null,\"hasDashboard\":\"1\",\"passwordResetRequired\":false,\"lastPasswordChangeDate\":null,\"unverifiedEmail\":null,\"newPassword\":null,\"currentPassword\":null,\"verificationCodeIssuedDate\":null,\"verificationCode\":null,\"lastLoginAttemptIp\":null,\"authError\":null,\"inheritorOnDelete\":null,\"id\":\"1\",\"tempId\":null,\"draftId\":null,\"revisionId\":null,\"uid\":\"0d8e884e-9a5c-4ec7-b3fd-d9f8b1fd3084\",\"fieldLayoutId\":null,\"contentId\":\"1\",\"enabled\":\"1\",\"archived\":\"0\",\"siteId\":\"1\",\"enabledForSite\":\"1\",\"title\":null,\"slug\":null,\"uri\":null,\"dateCreated\":\"2019-11-16T19:11:01-08:00\",\"dateUpdated\":\"2019-11-16T19:11:01-08:00\",\"dateDeleted\":null,\"trashed\":false,\"propagateAll\":false,\"newSiteIds\":[],\"resaving\":false,\"duplicateOf\":null,\"previewing\":false,\"hardDelete\":false,\"ref\":\"admin\",\"status\":\"active\",\"structureId\":null,\"url\":null,\"cooldownEndTime\":null,\"friendlyName\":\"admin\",\"fullName\":null,\"isCurrent\":true,\"name\":\"admin\",\"preferredLanguage\":\"en-GB\",\"remainingCooldownTime\":null},\"name\":\"afterPropagate\",\"senderClass\":\"craft\\\\elements\\\\MatrixBlock\",\"sender\":{\"fieldId\":\"12\",\"ownerId\":399,\"ownerSiteId\":null,\"typeId\":\"3\",\"sortOrder\":2,\"collapsed\":false,\"deletedWithOwner\":false,\"id\":401,\"tempId\":null,\"draftId\":null,\"revisionId\":null,\"uid\":\"a49007a9-f043-40ec-bd9e-e10edaf0d48b\",\"fieldLayoutId\":\"7\",\"contentId\":\"208\",\"enabled\":true,\"archived\":\"0\",\"siteId\":\"1\",\"enabledForSite\":true,\"title\":null,\"slug\":null,\"uri\":null,\"dateCreated\":\"2019-11-22T22:04:40-08:00\",\"dateUpdated\":\"2019-11-22T22:04:40-08:00\",\"dateDeleted\":null,\"trashed\":false,\"propagateAll\":true,\"newSiteIds\":[],\"resaving\":false,\"duplicateOf\":{\"fieldId\":\"12\",\"ownerId\":\"2\",\"ownerSiteId\":null,\"typeId\":\"3\",\"sortOrder\":2,\"collapsed\":false,\"deletedWithOwner\":false,\"id\":\"378\",\"tempId\":null,\"draftId\":null,\"revisionId\":null,\"uid\":\"607d915b-c418-41c8-8207-72a94e816e72\",\"fieldLayoutId\":\"7\",\"contentId\":\"194\",\"enabled\":true,\"archived\":\"0\",\"siteId\":\"1\",\"enabledForSite\":true,\"title\":null,\"slug\":null,\"uri\":null,\"dateCreated\":\"2019-11-22T22:01:37-08:00\",\"dateUpdated\":\"2019-11-22T22:04:40-08:00\",\"dateDeleted\":null,\"trashed\":false,\"propagateAll\":false,\"newSiteIds\":[],\"resaving\":false,\"duplicateOf\":null,\"previewing\":false,\"hardDelete\":false,\"ref\":null,\"status\":\"enabled\",\"structureId\":null,\"url\":null,\"newsTitle\":\"ddd\",\"newsDescription\":\"ddd\",\"image\":{\"volumeId\":null,\"folderId\":null,\"filename\":null,\"kind\":null,\"width\":null,\"height\":null,\"size\":null,\"dateModified\":null,\"includeSubfolders\":false,\"withTransforms\":null,\"elementType\":\"craft\\\\elements\\\\Asset\",\"contentTable\":\"{{%content}}\",\"customFields\":{\"0\":{\"minBlocks\":\"\",\"maxBlocks\":\"\",\"contentTable\":\"{{%matrixcontent_availableproducts}}\",\"propagationMethod\":\"all\",\"localizeBlocks\":false,\"id\":\"6\",\"dateCreated\":\"2019-11-16T21:05:39-08:00\",\"dateUpdated\":\"2019-11-16T21:27:52-08:00\",\"groupId\":\"3\",\"name\":\"Available Products\",\"handle\":\"availableProducts\",\"context\":\"global\",\"instructions\":\"\",\"searchable\":\"1\",\"translationMethod\":\"site\",\"translationKeyFormat\":null,\"oldHandle\":null,\"oldSettings\":null,\"columnPrefix\":null,\"uid\":\"050801e0-9914-4a65-a49c-c3418c2da200\",\"layoutId\":null,\"tabId\":null,\"required\":null,\"sortOrder\":null},\"5\":{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\",\"id\":\"17\",\"dateCreated\":\"2019-11-22T17:30:59-08:00\",\"dateUpdated\":\"2019-11-22T17:30:59-08:00\",\"groupId\":\"5\",\"name\":\"News Description\",\"handle\":\"newsDescription\",\"context\":\"global\",\"instructions\":\"\",\"searchable\":\"1\",\"translationMethod\":\"none\",\"translationKeyFormat\":null,\"oldHandle\":null,\"oldSettings\":null,\"columnPrefix\":null,\"uid\":\"631b609a-3a78-4ddb-acae-caf3c6057662\",\"layoutId\":null,\"tabId\":null,\"required\":null,\"sortOrder\":null},\"6\":{\"minBlocks\":\"\",\"maxBlocks\":\"\",\"contentTable\":\"{{%matrixcontent_newsfeed}}\",\"propagationMethod\":\"all\",\"localizeBlocks\":false,\"id\":\"12\",\"dateCreated\":\"2019-11-16T21:33:06-08:00\",\"dateUpdated\":\"2019-11-16T21:33:06-08:00\",\"groupId\":\"4\",\"name\":\"News Feed\",\"handle\":\"newsFeed\",\"context\":\"global\",\"instructions\":\"\",\"searchable\":\"1\",\"translationMethod\":\"site\",\"translationKeyFormat\":null,\"oldHandle\":null,\"oldSettings\":null,\"columnPrefix\":null,\"uid\":\"737f3d64-426a-45e4-869b-05a5dcf2c242\",\"layoutId\":null,\"tabId\":null,\"required\":null,\"sortOrder\":null},\"7\":{\"source\":null,\"targetSiteId\":null,\"viewMode\":null,\"limit\":\"6\",\"selectionLabel\":\"Add Products\",\"validateRelatedElements\":\"\",\"localizeRelations\":false,\"allowMultipleSources\":true,\"allowLimit\":true,\"id\":\"18\",\"dateCreated\":\"2019-11-22T17:31:57-08:00\",\"dateUpdated\":\"2019-11-22T17:31:57-08:00\",\"groupId\":\"5\",\"name\":\"News Products \",\"handle\":\"newsProducts\",\"context\":\"global\",\"instructions\":\"\",\"searchable\":\"1\",\"translationMethod\":\"site\",\"translationKeyFormat\":null,\"oldHandle\":null,\"oldSettings\":null,\"columnPrefix\":null,\"uid\":\"0b3353c6-6585-45e9-9b26-7f8a36124b56\",\"layoutId\":null,\"tabId\":null,\"required\":null,\"sortOrder\":null},\"9\":{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\",\"id\":\"16\",\"dateCreated\":\"2019-11-22T17:30:32-08:00\",\"dateUpdated\":\"2019-11-22T18:18:43-08:00\",\"groupId\":\"5\",\"name\":\"News Title\",\"handle\":\"newsTitle\",\"context\":\"global\",\"instructions\":\"\",\"searchable\":\"1\",\"translationMethod\":\"none\",\"translationKeyFormat\":null,\"oldHandle\":null,\"oldSettings\":null,\"columnPrefix\":null,\"uid\":\"c4585c4e-f4a6-439c-a95b-1f2a50263b07\",\"layoutId\":null,\"tabId\":null,\"required\":null,\"sortOrder\":null}},\"inReverse\":false,\"asArray\":false,\"ignorePlaceholders\":false,\"drafts\":false,\"draftId\":null,\"draftOf\":null,\"draftCreator\":null,\"revisions\":false,\"revisionId\":null,\"revisionOf\":null,\"revisionCreator\":null,\"id\":null,\"uid\":null,\"fixedOrder\":false,\"status\":[\"enabled\"],\"archived\":false,\"trashed\":false,\"dateCreated\":null,\"dateUpdated\":null,\"siteId\":1,\"unique\":false,\"preferSites\":false,\"enabledForSite\":true,\"leaves\":false,\"relatedTo\":null,\"title\":null,\"slug\":null,\"uri\":null,\"search\":null,\"ref\":null,\"with\":null,\"orderBy\":{\"relations.sortOrder\":4},\"withStructure\":null,\"structureId\":null,\"level\":null,\"hasDescendants\":null,\"ancestorOf\":null,\"ancestorDist\":null,\"descendantOf\":null,\"descendantDist\":null,\"siblingOf\":null,\"prevSiblingOf\":null,\"nextSiblingOf\":null,\"positionedBefore\":null,\"positionedAfter\":null,\"select\":{\"**\":\"**\"},\"selectOption\":null,\"distinct\":null,\"from\":null,\"groupBy\":null,\"join\":[[\"INNER JOIN\",\"{{%relations}} relations\"]],\"having\":null,\"union\":null,\"params\":[],\"queryCacheDuration\":null,\"queryCacheDependency\":null,\"where\":null,\"limit\":null,\"offset\":null,\"indexBy\":null,\"emulateExecution\":false,\"availableProducts\":null,\"productName\":null,\"price\":null,\"image\":null,\"available\":null,\"newsFeed\":null,\"newsTitle\":null,\"newsDescription\":null,\"newsProducts\":null},\"owner\":{\"sectionId\":\"1\",\"typeId\":\"1\",\"authorId\":null,\"postDate\":\"2019-11-16T19:13:00-08:00\",\"expiryDate\":null,\"newParentId\":null,\"deletedWithEntryType\":false,\"id\":\"2\",\"tempId\":null,\"draftId\":null,\"revisionId\":null,\"uid\":\"7e2370a1-ddcf-4054-ace6-a33fbc894bac\",\"fieldLayoutId\":\"1\",\"contentId\":\"2\",\"enabled\":true,\"archived\":\"0\",\"siteId\":\"1\",\"enabledForSite\":true,\"title\":\"Home\",\"slug\":\"home\",\"uri\":\"__home__\",\"dateCreated\":\"2019-11-16T19:13:40-08:00\",\"dateUpdated\":\"2019-11-22T22:04:40-08:00\",\"dateDeleted\":null,\"trashed\":false,\"propagateAll\":false,\"newSiteIds\":[],\"resaving\":false,\"duplicateOf\":null,\"previewing\":false,\"hardDelete\":false,\"ref\":\"home/home\",\"status\":\"live\",\"structureId\":null,\"url\":\"http://localhost:8888/\",\"newsFeed\":{\"fieldId\":\"12\",\"ownerId\":\"2\",\"ownerSiteId\":null,\"allowOwnerDrafts\":null,\"allowOwnerRevisions\":null,\"typeId\":null,\"elementType\":\"craft\\\\elements\\\\MatrixBlock\",\"contentTable\":\"{{%content}}\",\"customFields\":null,\"inReverse\":false,\"asArray\":false,\"ignorePlaceholders\":false,\"drafts\":false,\"draftId\":null,\"draftOf\":null,\"draftCreator\":null,\"revisions\":false,\"revisionId\":null,\"revisionOf\":null,\"revisionCreator\":null,\"id\":null,\"uid\":null,\"fixedOrder\":false,\"status\":[\"enabled\"],\"archived\":false,\"trashed\":false,\"dateCreated\":null,\"dateUpdated\":null,\"siteId\":\"1\",\"unique\":false,\"preferSites\":false,\"enabledForSite\":true,\"leaves\":false,\"relatedTo\":null,\"title\":null,\"slug\":null,\"uri\":null,\"search\":null,\"ref\":null,\"with\":null,\"orderBy\":\"\",\"withStructure\":null,\"structureId\":null,\"level\":null,\"hasDescendants\":null,\"ancestorOf\":null,\"ancestorDist\":null,\"descendantOf\":null,\"descendantDist\":null,\"siblingOf\":null,\"prevSiblingOf\":null,\"nextSiblingOf\":null,\"positionedBefore\":null,\"positionedAfter\":null,\"select\":{\"**\":\"**\"},\"selectOption\":null,\"distinct\":null,\"from\":null,\"groupBy\":null,\"join\":null,\"having\":null,\"union\":null,\"params\":[],\"queryCacheDuration\":null,\"queryCacheDependency\":null,\"where\":null,\"limit\":null,\"offset\":null,\"indexBy\":null,\"emulateExecution\":false,\"availableProducts\":null,\"productName\":null,\"price\":null,\"image\":null,\"available\":null,\"newsFeed\":null,\"newsTitle\":null,\"newsDescription\":null,\"newsProducts\":null}}},\"previewing\":false,\"hardDelete\":false,\"ref\":null,\"status\":\"enabled\",\"structureId\":null,\"url\":null,\"newsTitle\":\"ddd\",\"newsDescription\":\"ddd\",\"image\":{\"volumeId\":null,\"folderId\":null,\"filename\":null,\"kind\":null,\"width\":null,\"height\":null,\"size\":null,\"dateModified\":null,\"includeSubfolders\":false,\"withTransforms\":null,\"elementType\":\"craft\\\\elements\\\\Asset\",\"contentTable\":\"{{%content}}\",\"customFields\":null,\"inReverse\":false,\"asArray\":false,\"ignorePlaceholders\":false,\"drafts\":false,\"draftId\":null,\"draftOf\":null,\"draftCreator\":null,\"revisions\":false,\"revisionId\":null,\"revisionOf\":null,\"revisionCreator\":null,\"id\":null,\"uid\":null,\"fixedOrder\":false,\"status\":[\"enabled\"],\"archived\":false,\"trashed\":false,\"dateCreated\":null,\"dateUpdated\":null,\"siteId\":1,\"unique\":false,\"preferSites\":false,\"enabledForSite\":true,\"leaves\":false,\"relatedTo\":null,\"title\":null,\"slug\":null,\"uri\":null,\"search\":null,\"ref\":null,\"with\":null,\"orderBy\":{\"relations.sortOrder\":4},\"withStructure\":null,\"structureId\":null,\"level\":null,\"hasDescendants\":null,\"ancestorOf\":null,\"ancestorDist\":null,\"descendantOf\":null,\"descendantDist\":null,\"siblingOf\":null,\"prevSiblingOf\":null,\"nextSiblingOf\":null,\"positionedBefore\":null,\"positionedAfter\":null,\"select\":{\"**\":\"**\"},\"selectOption\":null,\"distinct\":null,\"from\":null,\"groupBy\":null,\"join\":[[\"INNER JOIN\",\"{{%relations}} relations\",[\"and\",\"[[relations.targetId]] = [[elements.id]]\"]]],\"having\":null,\"union\":null,\"params\":[],\"queryCacheDuration\":null,\"queryCacheDependency\":null,\"where\":null,\"limit\":null,\"offset\":null,\"indexBy\":null,\"emulateExecution\":false,\"availableProducts\":null,\"productName\":null,\"price\":null,\"image\":null,\"available\":null,\"newsFeed\":null,\"newsTitle\":null,\"newsDescription\":null,\"newsProducts\":null},\"owner\":{\"sectionId\":\"1\",\"typeId\":\"1\",\"authorId\":null,\"postDate\":\"2019-11-16T19:13:00-08:00\",\"expiryDate\":null,\"newParentId\":null,\"deletedWithEntryType\":false,\"id\":399,\"tempId\":null,\"draftId\":null,\"revisionId\":\"84\",\"uid\":\"35744967-bd6f-4ff2-acb2-4f16852bdec4\",\"fieldLayoutId\":\"1\",\"contentId\":\"144\",\"enabled\":true,\"archived\":\"0\",\"siteId\":\"1\",\"enabledForSite\":true,\"title\":\"Home\",\"slug\":\"home\",\"uri\":\"__home__\",\"dateCreated\":\"2019-11-22T22:04:40-08:00\",\"dateUpdated\":\"2019-11-22T22:04:40-08:00\",\"dateDeleted\":null,\"trashed\":false,\"propagateAll\":false,\"newSiteIds\":[],\"resaving\":false,\"duplicateOf\":{\"sectionId\":\"1\",\"typeId\":\"1\",\"authorId\":null,\"postDate\":\"2019-11-16T19:13:00-08:00\",\"expiryDate\":null,\"newParentId\":null,\"deletedWithEntryType\":false,\"id\":\"2\",\"tempId\":null,\"draftId\":null,\"revisionId\":null,\"uid\":\"7e2370a1-ddcf-4054-ace6-a33fbc894bac\",\"fieldLayoutId\":\"1\",\"contentId\":\"2\",\"enabled\":true,\"archived\":\"0\",\"siteId\":\"1\",\"enabledForSite\":true,\"title\":\"Home\",\"slug\":\"home\",\"uri\":\"__home__\",\"dateCreated\":\"2019-11-16T19:13:40-08:00\",\"dateUpdated\":\"2019-11-22T22:04:40-08:00\",\"dateDeleted\":null,\"trashed\":false,\"propagateAll\":false,\"newSiteIds\":[],\"resaving\":false,\"duplicateOf\":null,\"previewing\":false,\"hardDelete\":false,\"ref\":\"home/home\",\"status\":\"live\",\"structureId\":null,\"url\":\"http://localhost:8888/\",\"newsFeed\":{\"fieldId\":\"12\",\"ownerId\":\"2\",\"ownerSiteId\":null,\"allowOwnerDrafts\":null,\"allowOwnerRevisions\":null,\"typeId\":null,\"elementType\":\"craft\\\\elements\\\\MatrixBlock\",\"contentTable\":\"{{%content}}\",\"customFields\":null,\"inReverse\":false,\"asArray\":false,\"ignorePlaceholders\":false,\"drafts\":false,\"draftId\":null,\"draftOf\":null,\"draftCreator\":null,\"revisions\":false,\"revisionId\":null,\"revisionOf\":null,\"revisionCreator\":null,\"id\":null,\"uid\":null,\"fixedOrder\":false,\"status\":[\"enabled\"],\"archived\":false,\"trashed\":false,\"dateCreated\":null,\"dateUpdated\":null,\"siteId\":\"1\",\"unique\":false,\"preferSites\":false,\"enabledForSite\":true,\"leaves\":false,\"relatedTo\":null,\"title\":null,\"slug\":null,\"uri\":null,\"search\":null,\"ref\":null,\"with\":null,\"orderBy\":\"\",\"withStructure\":null,\"structureId\":null,\"level\":null,\"hasDescendants\":null,\"ancestorOf\":null,\"ancestorDist\":null,\"descendantOf\":null,\"descendantDist\":null,\"siblingOf\":null,\"prevSiblingOf\":null,\"nextSiblingOf\":null,\"positionedBefore\":null,\"positionedAfter\":null,\"select\":{\"**\":\"**\"},\"selectOption\":null,\"distinct\":null,\"from\":null,\"groupBy\":null,\"join\":null,\"having\":null,\"union\":null,\"params\":[],\"queryCacheDuration\":null,\"queryCacheDependency\":null,\"where\":null,\"limit\":null,\"offset\":null,\"indexBy\":null,\"emulateExecution\":false,\"availableProducts\":null,\"productName\":null,\"price\":null,\"image\":null,\"available\":null,\"newsFeed\":null,\"newsTitle\":null,\"newsDescription\":null,\"newsProducts\":null}},\"previewing\":false,\"hardDelete\":false,\"ref\":\"home/home\",\"status\":\"live\",\"structureId\":null,\"url\":\"http://localhost:8888/\",\"newsFeed\":{\"fieldId\":\"12\",\"ownerId\":\"2\",\"ownerSiteId\":null,\"allowOwnerDrafts\":null,\"allowOwnerRevisions\":null,\"typeId\":null,\"elementType\":\"craft\\\\elements\\\\MatrixBlock\",\"contentTable\":\"{{%content}}\",\"customFields\":null,\"inReverse\":false,\"asArray\":false,\"ignorePlaceholders\":false,\"drafts\":false,\"draftId\":null,\"draftOf\":null,\"draftCreator\":null,\"revisions\":false,\"revisionId\":null,\"revisionOf\":null,\"revisionCreator\":null,\"id\":null,\"uid\":null,\"fixedOrder\":false,\"status\":[\"enabled\"],\"archived\":false,\"trashed\":false,\"dateCreated\":null,\"dateUpdated\":null,\"siteId\":\"1\",\"unique\":false,\"preferSites\":false,\"enabledForSite\":true,\"leaves\":false,\"relatedTo\":null,\"title\":null,\"slug\":null,\"uri\":null,\"search\":null,\"ref\":null,\"with\":null,\"orderBy\":\"\",\"withStructure\":null,\"structureId\":null,\"level\":null,\"hasDescendants\":null,\"ancestorOf\":null,\"ancestorDist\":null,\"descendantOf\":null,\"descendantDist\":null,\"siblingOf\":null,\"prevSiblingOf\":null,\"nextSiblingOf\":null,\"positionedBefore\":null,\"positionedAfter\":null,\"select\":{\"**\":\"**\"},\"selectOption\":null,\"distinct\":null,\"from\":null,\"groupBy\":null,\"join\":null,\"having\":null,\"union\":null,\"params\":[],\"queryCacheDuration\":null,\"queryCacheDependency\":null,\"where\":null,\"limit\":null,\"offset\":null,\"indexBy\":null,\"emulateExecution\":false,\"availableProducts\":null,\"productName\":null,\"price\":null,\"image\":null,\"available\":null,\"newsFeed\":null,\"newsTitle\":null,\"newsDescription\":null,\"newsProducts\":null}}},\"eventClass\":\"craft\\\\events\\\\ModelEvent\",\"event\":{\"isNew\":[true],\"isValid\":[true]}}', 200, '{\"Access-Control-Allow-Origin\":[\"*\"],\"Content-Type\":[\"application/json\"],\"Date\":[\"Sat, 23 Nov 2019 06:04:49 GMT\"],\"P3P\":[\"CP=\\\"IDC DSP COR ADM DEVi TAIi PSA PSD IVAi IVDi CONi HIS OUR IND CNT\\\"\"],\"Response-Id\":[\"5dd8cc01-9d5a-4547-a64c-4e50568a8360\"],\"Server\":[\"nginx\"],\"Vary\":[\"X-Session-Key\"],\"X-Frame-Options\":[\"SAMEORIGIN\"],\"X-Rate-Limit-Limit\":[\"10000\"],\"X-Rate-Limit-Remaining\":[\"9983\"],\"X-Rate-Limit-Reset\":[\"1574489400\"],\"X-Session-Key\":[\"anonymous\"],\"X-Zapier-Fast-Return\":[\"true\"],\"X-Zapier-Jobs\":[\"A hacker like yourself should consider working at Zapier!\"],\"X-Zapier-Jobs-Link\":[\"https://zapier.com/jobs/\"],\"X-Zapier-Revision\":[\"a3f0f5a0e2f54d0ea7deec04bf25200b29167033\"],\"Content-Length\":[\"172\"],\"Connection\":[\"keep-alive\"]}', '{\"status\": \"success\", \"attempt\": \"5dd8cc01-9d5a-4547-a64c-4e50568a8360\", \"id\": \"1ef2793c-b0b3-405e-9a38-1fc1661ad1fe\", \"request_id\": \"5dd8cc01-9d5a-4547-a64c-4e50568a8360\"}', 1268, '2019-11-23 06:04:40', '2019-11-23 06:04:48', '4d0fbb72-5bf7-4727-8910-762a0d2307a6'),
(54, 1, 'done', 1, 'post', 'https://hooks.zapier.com/hooks/catch/6128230/o4x908w/', '{\"Content-Type\":\"application/json\"}', '{\"time\":\"2019-11-22T22:04:40-08:00\",\"user\":{\"username\":\"admin\",\"photoId\":null,\"firstName\":null,\"lastName\":null,\"email\":\"h.lawrence@windowslive.com\",\"password\":\"••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••\",\"admin\":\"1\",\"locked\":\"0\",\"suspended\":\"0\",\"pending\":\"0\",\"lastLoginDate\":\"2019-11-22T21:50:49-08:00\",\"invalidLoginCount\":null,\"lastInvalidLoginDate\":null,\"lockoutDate\":null,\"hasDashboard\":\"1\",\"passwordResetRequired\":false,\"lastPasswordChangeDate\":null,\"unverifiedEmail\":null,\"newPassword\":null,\"currentPassword\":null,\"verificationCodeIssuedDate\":null,\"verificationCode\":null,\"lastLoginAttemptIp\":null,\"authError\":null,\"inheritorOnDelete\":null,\"id\":\"1\",\"tempId\":null,\"draftId\":null,\"revisionId\":null,\"uid\":\"0d8e884e-9a5c-4ec7-b3fd-d9f8b1fd3084\",\"fieldLayoutId\":null,\"contentId\":\"1\",\"enabled\":\"1\",\"archived\":\"0\",\"siteId\":\"1\",\"enabledForSite\":\"1\",\"title\":null,\"slug\":null,\"uri\":null,\"dateCreated\":\"2019-11-16T19:11:01-08:00\",\"dateUpdated\":\"2019-11-16T19:11:01-08:00\",\"dateDeleted\":null,\"trashed\":false,\"propagateAll\":false,\"newSiteIds\":[],\"resaving\":false,\"duplicateOf\":null,\"previewing\":false,\"hardDelete\":false,\"ref\":\"admin\",\"status\":\"active\",\"structureId\":null,\"url\":null,\"cooldownEndTime\":null,\"friendlyName\":\"admin\",\"fullName\":null,\"isCurrent\":true,\"name\":\"admin\",\"preferredLanguage\":\"en-GB\",\"remainingCooldownTime\":null},\"name\":\"afterPropagate\",\"senderClass\":\"craft\\\\elements\\\\MatrixBlock\",\"sender\":{\"fieldId\":\"12\",\"ownerId\":399,\"ownerSiteId\":null,\"typeId\":\"3\",\"sortOrder\":3,\"collapsed\":false,\"deletedWithOwner\":false,\"id\":402,\"tempId\":null,\"draftId\":null,\"revisionId\":null,\"uid\":\"5f029442-86e3-4756-802c-066efe89e85c\",\"fieldLayoutId\":\"7\",\"contentId\":\"209\",\"enabled\":true,\"archived\":\"0\",\"siteId\":\"1\",\"enabledForSite\":true,\"title\":null,\"slug\":null,\"uri\":null,\"dateCreated\":\"2019-11-22T22:04:40-08:00\",\"dateUpdated\":\"2019-11-22T22:04:40-08:00\",\"dateDeleted\":null,\"trashed\":false,\"propagateAll\":true,\"newSiteIds\":[],\"resaving\":false,\"duplicateOf\":{\"fieldId\":\"12\",\"ownerId\":\"2\",\"ownerSiteId\":null,\"typeId\":\"3\",\"sortOrder\":3,\"collapsed\":false,\"deletedWithOwner\":false,\"id\":\"387\",\"tempId\":null,\"draftId\":null,\"revisionId\":null,\"uid\":\"79bf5f9a-d4eb-4b9c-a8d5-1e5f429f4620\",\"fieldLayoutId\":\"7\",\"contentId\":\"197\",\"enabled\":true,\"archived\":\"0\",\"siteId\":\"1\",\"enabledForSite\":true,\"title\":null,\"slug\":null,\"uri\":null,\"dateCreated\":\"2019-11-22T22:03:31-08:00\",\"dateUpdated\":\"2019-11-22T22:04:40-08:00\",\"dateDeleted\":null,\"trashed\":false,\"propagateAll\":false,\"newSiteIds\":[],\"resaving\":false,\"duplicateOf\":null,\"previewing\":false,\"hardDelete\":false,\"ref\":null,\"status\":\"enabled\",\"structureId\":null,\"url\":null,\"newsTitle\":\"news\",\"newsDescription\":\"news\",\"image\":{\"volumeId\":null,\"folderId\":null,\"filename\":null,\"kind\":null,\"width\":null,\"height\":null,\"size\":null,\"dateModified\":null,\"includeSubfolders\":false,\"withTransforms\":null,\"elementType\":\"craft\\\\elements\\\\Asset\",\"contentTable\":\"{{%content}}\",\"customFields\":{\"0\":{\"minBlocks\":\"\",\"maxBlocks\":\"\",\"contentTable\":\"{{%matrixcontent_availableproducts}}\",\"propagationMethod\":\"all\",\"localizeBlocks\":false,\"id\":\"6\",\"dateCreated\":\"2019-11-16T21:05:39-08:00\",\"dateUpdated\":\"2019-11-16T21:27:52-08:00\",\"groupId\":\"3\",\"name\":\"Available Products\",\"handle\":\"availableProducts\",\"context\":\"global\",\"instructions\":\"\",\"searchable\":\"1\",\"translationMethod\":\"site\",\"translationKeyFormat\":null,\"oldHandle\":null,\"oldSettings\":null,\"columnPrefix\":null,\"uid\":\"050801e0-9914-4a65-a49c-c3418c2da200\",\"layoutId\":null,\"tabId\":null,\"required\":null,\"sortOrder\":null},\"5\":{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\",\"id\":\"17\",\"dateCreated\":\"2019-11-22T17:30:59-08:00\",\"dateUpdated\":\"2019-11-22T17:30:59-08:00\",\"groupId\":\"5\",\"name\":\"News Description\",\"handle\":\"newsDescription\",\"context\":\"global\",\"instructions\":\"\",\"searchable\":\"1\",\"translationMethod\":\"none\",\"translationKeyFormat\":null,\"oldHandle\":null,\"oldSettings\":null,\"columnPrefix\":null,\"uid\":\"631b609a-3a78-4ddb-acae-caf3c6057662\",\"layoutId\":null,\"tabId\":null,\"required\":null,\"sortOrder\":null},\"6\":{\"minBlocks\":\"\",\"maxBlocks\":\"\",\"contentTable\":\"{{%matrixcontent_newsfeed}}\",\"propagationMethod\":\"all\",\"localizeBlocks\":false,\"id\":\"12\",\"dateCreated\":\"2019-11-16T21:33:06-08:00\",\"dateUpdated\":\"2019-11-16T21:33:06-08:00\",\"groupId\":\"4\",\"name\":\"News Feed\",\"handle\":\"newsFeed\",\"context\":\"global\",\"instructions\":\"\",\"searchable\":\"1\",\"translationMethod\":\"site\",\"translationKeyFormat\":null,\"oldHandle\":null,\"oldSettings\":null,\"columnPrefix\":null,\"uid\":\"737f3d64-426a-45e4-869b-05a5dcf2c242\",\"layoutId\":null,\"tabId\":null,\"required\":null,\"sortOrder\":null},\"7\":{\"source\":null,\"targetSiteId\":null,\"viewMode\":null,\"limit\":\"6\",\"selectionLabel\":\"Add Products\",\"validateRelatedElements\":\"\",\"localizeRelations\":false,\"allowMultipleSources\":true,\"allowLimit\":true,\"id\":\"18\",\"dateCreated\":\"2019-11-22T17:31:57-08:00\",\"dateUpdated\":\"2019-11-22T17:31:57-08:00\",\"groupId\":\"5\",\"name\":\"News Products \",\"handle\":\"newsProducts\",\"context\":\"global\",\"instructions\":\"\",\"searchable\":\"1\",\"translationMethod\":\"site\",\"translationKeyFormat\":null,\"oldHandle\":null,\"oldSettings\":null,\"columnPrefix\":null,\"uid\":\"0b3353c6-6585-45e9-9b26-7f8a36124b56\",\"layoutId\":null,\"tabId\":null,\"required\":null,\"sortOrder\":null},\"9\":{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\",\"id\":\"16\",\"dateCreated\":\"2019-11-22T17:30:32-08:00\",\"dateUpdated\":\"2019-11-22T18:18:43-08:00\",\"groupId\":\"5\",\"name\":\"News Title\",\"handle\":\"newsTitle\",\"context\":\"global\",\"instructions\":\"\",\"searchable\":\"1\",\"translationMethod\":\"none\",\"translationKeyFormat\":null,\"oldHandle\":null,\"oldSettings\":null,\"columnPrefix\":null,\"uid\":\"c4585c4e-f4a6-439c-a95b-1f2a50263b07\",\"layoutId\":null,\"tabId\":null,\"required\":null,\"sortOrder\":null}},\"inReverse\":false,\"asArray\":false,\"ignorePlaceholders\":false,\"drafts\":false,\"draftId\":null,\"draftOf\":null,\"draftCreator\":null,\"revisions\":false,\"revisionId\":null,\"revisionOf\":null,\"revisionCreator\":null,\"id\":null,\"uid\":null,\"fixedOrder\":false,\"status\":[\"enabled\"],\"archived\":false,\"trashed\":false,\"dateCreated\":null,\"dateUpdated\":null,\"siteId\":1,\"unique\":false,\"preferSites\":false,\"enabledForSite\":true,\"leaves\":false,\"relatedTo\":null,\"title\":null,\"slug\":null,\"uri\":null,\"search\":null,\"ref\":null,\"with\":null,\"orderBy\":{\"relations.sortOrder\":4},\"withStructure\":null,\"structureId\":null,\"level\":null,\"hasDescendants\":null,\"ancestorOf\":null,\"ancestorDist\":null,\"descendantOf\":null,\"descendantDist\":null,\"siblingOf\":null,\"prevSiblingOf\":null,\"nextSiblingOf\":null,\"positionedBefore\":null,\"positionedAfter\":null,\"select\":{\"**\":\"**\"},\"selectOption\":null,\"distinct\":null,\"from\":null,\"groupBy\":null,\"join\":[[\"INNER JOIN\",\"{{%relations}} relations\"]],\"having\":null,\"union\":null,\"params\":[],\"queryCacheDuration\":null,\"queryCacheDependency\":null,\"where\":null,\"limit\":null,\"offset\":null,\"indexBy\":null,\"emulateExecution\":false,\"availableProducts\":null,\"productName\":null,\"price\":null,\"image\":null,\"available\":null,\"newsFeed\":null,\"newsTitle\":null,\"newsDescription\":null,\"newsProducts\":null},\"owner\":{\"sectionId\":\"1\",\"typeId\":\"1\",\"authorId\":null,\"postDate\":\"2019-11-16T19:13:00-08:00\",\"expiryDate\":null,\"newParentId\":null,\"deletedWithEntryType\":false,\"id\":\"2\",\"tempId\":null,\"draftId\":null,\"revisionId\":null,\"uid\":\"7e2370a1-ddcf-4054-ace6-a33fbc894bac\",\"fieldLayoutId\":\"1\",\"contentId\":\"2\",\"enabled\":true,\"archived\":\"0\",\"siteId\":\"1\",\"enabledForSite\":true,\"title\":\"Home\",\"slug\":\"home\",\"uri\":\"__home__\",\"dateCreated\":\"2019-11-16T19:13:40-08:00\",\"dateUpdated\":\"2019-11-22T22:04:40-08:00\",\"dateDeleted\":null,\"trashed\":false,\"propagateAll\":false,\"newSiteIds\":[],\"resaving\":false,\"duplicateOf\":null,\"previewing\":false,\"hardDelete\":false,\"ref\":\"home/home\",\"status\":\"live\",\"structureId\":null,\"url\":\"http://localhost:8888/\",\"newsFeed\":{\"fieldId\":\"12\",\"ownerId\":\"2\",\"ownerSiteId\":null,\"allowOwnerDrafts\":null,\"allowOwnerRevisions\":null,\"typeId\":null,\"elementType\":\"craft\\\\elements\\\\MatrixBlock\",\"contentTable\":\"{{%content}}\",\"customFields\":null,\"inReverse\":false,\"asArray\":false,\"ignorePlaceholders\":false,\"drafts\":false,\"draftId\":null,\"draftOf\":null,\"draftCreator\":null,\"revisions\":false,\"revisionId\":null,\"revisionOf\":null,\"revisionCreator\":null,\"id\":null,\"uid\":null,\"fixedOrder\":false,\"status\":[\"enabled\"],\"archived\":false,\"trashed\":false,\"dateCreated\":null,\"dateUpdated\":null,\"siteId\":\"1\",\"unique\":false,\"preferSites\":false,\"enabledForSite\":true,\"leaves\":false,\"relatedTo\":null,\"title\":null,\"slug\":null,\"uri\":null,\"search\":null,\"ref\":null,\"with\":null,\"orderBy\":\"\",\"withStructure\":null,\"structureId\":null,\"level\":null,\"hasDescendants\":null,\"ancestorOf\":null,\"ancestorDist\":null,\"descendantOf\":null,\"descendantDist\":null,\"siblingOf\":null,\"prevSiblingOf\":null,\"nextSiblingOf\":null,\"positionedBefore\":null,\"positionedAfter\":null,\"select\":{\"**\":\"**\"},\"selectOption\":null,\"distinct\":null,\"from\":null,\"groupBy\":null,\"join\":null,\"having\":null,\"union\":null,\"params\":[],\"queryCacheDuration\":null,\"queryCacheDependency\":null,\"where\":null,\"limit\":null,\"offset\":null,\"indexBy\":null,\"emulateExecution\":false,\"availableProducts\":null,\"productName\":null,\"price\":null,\"image\":null,\"available\":null,\"newsFeed\":null,\"newsTitle\":null,\"newsDescription\":null,\"newsProducts\":null}}},\"previewing\":false,\"hardDelete\":false,\"ref\":null,\"status\":\"enabled\",\"structureId\":null,\"url\":null,\"newsTitle\":\"news\",\"newsDescription\":\"news\",\"image\":{\"volumeId\":null,\"folderId\":null,\"filename\":null,\"kind\":null,\"width\":null,\"height\":null,\"size\":null,\"dateModified\":null,\"includeSubfolders\":false,\"withTransforms\":null,\"elementType\":\"craft\\\\elements\\\\Asset\",\"contentTable\":\"{{%content}}\",\"customFields\":null,\"inReverse\":false,\"asArray\":false,\"ignorePlaceholders\":false,\"drafts\":false,\"draftId\":null,\"draftOf\":null,\"draftCreator\":null,\"revisions\":false,\"revisionId\":null,\"revisionOf\":null,\"revisionCreator\":null,\"id\":null,\"uid\":null,\"fixedOrder\":false,\"status\":[\"enabled\"],\"archived\":false,\"trashed\":false,\"dateCreated\":null,\"dateUpdated\":null,\"siteId\":1,\"unique\":false,\"preferSites\":false,\"enabledForSite\":true,\"leaves\":false,\"relatedTo\":null,\"title\":null,\"slug\":null,\"uri\":null,\"search\":null,\"ref\":null,\"with\":null,\"orderBy\":{\"relations.sortOrder\":4},\"withStructure\":null,\"structureId\":null,\"level\":null,\"hasDescendants\":null,\"ancestorOf\":null,\"ancestorDist\":null,\"descendantOf\":null,\"descendantDist\":null,\"siblingOf\":null,\"prevSiblingOf\":null,\"nextSiblingOf\":null,\"positionedBefore\":null,\"positionedAfter\":null,\"select\":{\"**\":\"**\"},\"selectOption\":null,\"distinct\":null,\"from\":null,\"groupBy\":null,\"join\":[[\"INNER JOIN\",\"{{%relations}} relations\",[\"and\",\"[[relations.targetId]] = [[elements.id]]\"]]],\"having\":null,\"union\":null,\"params\":[],\"queryCacheDuration\":null,\"queryCacheDependency\":null,\"where\":null,\"limit\":null,\"offset\":null,\"indexBy\":null,\"emulateExecution\":false,\"availableProducts\":null,\"productName\":null,\"price\":null,\"image\":null,\"available\":null,\"newsFeed\":null,\"newsTitle\":null,\"newsDescription\":null,\"newsProducts\":null},\"owner\":{\"sectionId\":\"1\",\"typeId\":\"1\",\"authorId\":null,\"postDate\":\"2019-11-16T19:13:00-08:00\",\"expiryDate\":null,\"newParentId\":null,\"deletedWithEntryType\":false,\"id\":399,\"tempId\":null,\"draftId\":null,\"revisionId\":\"84\",\"uid\":\"35744967-bd6f-4ff2-acb2-4f16852bdec4\",\"fieldLayoutId\":\"1\",\"contentId\":\"144\",\"enabled\":true,\"archived\":\"0\",\"siteId\":\"1\",\"enabledForSite\":true,\"title\":\"Home\",\"slug\":\"home\",\"uri\":\"__home__\",\"dateCreated\":\"2019-11-22T22:04:40-08:00\",\"dateUpdated\":\"2019-11-22T22:04:40-08:00\",\"dateDeleted\":null,\"trashed\":false,\"propagateAll\":false,\"newSiteIds\":[],\"resaving\":false,\"duplicateOf\":{\"sectionId\":\"1\",\"typeId\":\"1\",\"authorId\":null,\"postDate\":\"2019-11-16T19:13:00-08:00\",\"expiryDate\":null,\"newParentId\":null,\"deletedWithEntryType\":false,\"id\":\"2\",\"tempId\":null,\"draftId\":null,\"revisionId\":null,\"uid\":\"7e2370a1-ddcf-4054-ace6-a33fbc894bac\",\"fieldLayoutId\":\"1\",\"contentId\":\"2\",\"enabled\":true,\"archived\":\"0\",\"siteId\":\"1\",\"enabledForSite\":true,\"title\":\"Home\",\"slug\":\"home\",\"uri\":\"__home__\",\"dateCreated\":\"2019-11-16T19:13:40-08:00\",\"dateUpdated\":\"2019-11-22T22:04:40-08:00\",\"dateDeleted\":null,\"trashed\":false,\"propagateAll\":false,\"newSiteIds\":[],\"resaving\":false,\"duplicateOf\":null,\"previewing\":false,\"hardDelete\":false,\"ref\":\"home/home\",\"status\":\"live\",\"structureId\":null,\"url\":\"http://localhost:8888/\",\"newsFeed\":{\"fieldId\":\"12\",\"ownerId\":\"2\",\"ownerSiteId\":null,\"allowOwnerDrafts\":null,\"allowOwnerRevisions\":null,\"typeId\":null,\"elementType\":\"craft\\\\elements\\\\MatrixBlock\",\"contentTable\":\"{{%content}}\",\"customFields\":null,\"inReverse\":false,\"asArray\":false,\"ignorePlaceholders\":false,\"drafts\":false,\"draftId\":null,\"draftOf\":null,\"draftCreator\":null,\"revisions\":false,\"revisionId\":null,\"revisionOf\":null,\"revisionCreator\":null,\"id\":null,\"uid\":null,\"fixedOrder\":false,\"status\":[\"enabled\"],\"archived\":false,\"trashed\":false,\"dateCreated\":null,\"dateUpdated\":null,\"siteId\":\"1\",\"unique\":false,\"preferSites\":false,\"enabledForSite\":true,\"leaves\":false,\"relatedTo\":null,\"title\":null,\"slug\":null,\"uri\":null,\"search\":null,\"ref\":null,\"with\":null,\"orderBy\":\"\",\"withStructure\":null,\"structureId\":null,\"level\":null,\"hasDescendants\":null,\"ancestorOf\":null,\"ancestorDist\":null,\"descendantOf\":null,\"descendantDist\":null,\"siblingOf\":null,\"prevSiblingOf\":null,\"nextSiblingOf\":null,\"positionedBefore\":null,\"positionedAfter\":null,\"select\":{\"**\":\"**\"},\"selectOption\":null,\"distinct\":null,\"from\":null,\"groupBy\":null,\"join\":null,\"having\":null,\"union\":null,\"params\":[],\"queryCacheDuration\":null,\"queryCacheDependency\":null,\"where\":null,\"limit\":null,\"offset\":null,\"indexBy\":null,\"emulateExecution\":false,\"availableProducts\":null,\"productName\":null,\"price\":null,\"image\":null,\"available\":null,\"newsFeed\":null,\"newsTitle\":null,\"newsDescription\":null,\"newsProducts\":null}},\"previewing\":false,\"hardDelete\":false,\"ref\":\"home/home\",\"status\":\"live\",\"structureId\":null,\"url\":\"http://localhost:8888/\",\"newsFeed\":{\"fieldId\":\"12\",\"ownerId\":\"2\",\"ownerSiteId\":null,\"allowOwnerDrafts\":null,\"allowOwnerRevisions\":null,\"typeId\":null,\"elementType\":\"craft\\\\elements\\\\MatrixBlock\",\"contentTable\":\"{{%content}}\",\"customFields\":null,\"inReverse\":false,\"asArray\":false,\"ignorePlaceholders\":false,\"drafts\":false,\"draftId\":null,\"draftOf\":null,\"draftCreator\":null,\"revisions\":false,\"revisionId\":null,\"revisionOf\":null,\"revisionCreator\":null,\"id\":null,\"uid\":null,\"fixedOrder\":false,\"status\":[\"enabled\"],\"archived\":false,\"trashed\":false,\"dateCreated\":null,\"dateUpdated\":null,\"siteId\":\"1\",\"unique\":false,\"preferSites\":false,\"enabledForSite\":true,\"leaves\":false,\"relatedTo\":null,\"title\":null,\"slug\":null,\"uri\":null,\"search\":null,\"ref\":null,\"with\":null,\"orderBy\":\"\",\"withStructure\":null,\"structureId\":null,\"level\":null,\"hasDescendants\":null,\"ancestorOf\":null,\"ancestorDist\":null,\"descendantOf\":null,\"descendantDist\":null,\"siblingOf\":null,\"prevSiblingOf\":null,\"nextSiblingOf\":null,\"positionedBefore\":null,\"positionedAfter\":null,\"select\":{\"**\":\"**\"},\"selectOption\":null,\"distinct\":null,\"from\":null,\"groupBy\":null,\"join\":null,\"having\":null,\"union\":null,\"params\":[],\"queryCacheDuration\":null,\"queryCacheDependency\":null,\"where\":null,\"limit\":null,\"offset\":null,\"indexBy\":null,\"emulateExecution\":false,\"availableProducts\":null,\"productName\":null,\"price\":null,\"image\":null,\"available\":null,\"newsFeed\":null,\"newsTitle\":null,\"newsDescription\":null,\"newsProducts\":null}}},\"eventClass\":\"craft\\\\events\\\\ModelEvent\",\"event\":{\"isNew\":[true],\"isValid\":[true]}}', 200, '{\"Access-Control-Allow-Origin\":[\"*\"],\"Content-Type\":[\"application/json\"],\"Date\":[\"Sat, 23 Nov 2019 06:04:50 GMT\"],\"P3P\":[\"CP=\\\"IDC DSP COR ADM DEVi TAIi PSA PSD IVAi IVDi CONi HIS OUR IND CNT\\\"\"],\"Response-Id\":[\"5dd8cc02-0f52-473b-b0cb-4b234e2a6450\"],\"Server\":[\"nginx\"],\"Vary\":[\"X-Session-Key\"],\"X-Frame-Options\":[\"SAMEORIGIN\"],\"X-Rate-Limit-Limit\":[\"10000\"],\"X-Rate-Limit-Remaining\":[\"9982\"],\"X-Rate-Limit-Reset\":[\"1574489400\"],\"X-Session-Key\":[\"anonymous\"],\"X-Zapier-Fast-Return\":[\"true\"],\"X-Zapier-Jobs\":[\"A hacker like yourself should consider working at Zapier!\"],\"X-Zapier-Jobs-Link\":[\"https://zapier.com/jobs/\"],\"X-Zapier-Revision\":[\"a3f0f5a0e2f54d0ea7deec04bf25200b29167033\"],\"Content-Length\":[\"172\"],\"Connection\":[\"keep-alive\"]}', '{\"status\": \"success\", \"attempt\": \"5dd8cc02-0f52-473b-b0cb-4b234e2a6450\", \"id\": \"c7c74284-f64c-4f5f-9e33-f27c186c87d2\", \"request_id\": \"5dd8cc02-0f52-473b-b0cb-4b234e2a6450\"}', 1249, '2019-11-23 06:04:40', '2019-11-23 06:04:49', 'bf767cc6-c9a3-4bcc-89c1-6336a7a28810');
INSERT INTO `webhookrequests` (`id`, `webhookId`, `status`, `attempts`, `method`, `url`, `requestHeaders`, `requestBody`, `responseStatus`, `responseHeaders`, `responseBody`, `responseTime`, `dateCreated`, `dateRequested`, `uid`) VALUES
(55, 1, 'done', 1, 'post', 'https://hooks.zapier.com/hooks/catch/6128230/o4x908w/', '{\"Content-Type\":\"application/json\"}', '{\"time\":\"2019-11-22T22:04:40-08:00\",\"user\":{\"username\":\"admin\",\"photoId\":null,\"firstName\":null,\"lastName\":null,\"email\":\"h.lawrence@windowslive.com\",\"password\":\"••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••\",\"admin\":\"1\",\"locked\":\"0\",\"suspended\":\"0\",\"pending\":\"0\",\"lastLoginDate\":\"2019-11-22T21:50:49-08:00\",\"invalidLoginCount\":null,\"lastInvalidLoginDate\":null,\"lockoutDate\":null,\"hasDashboard\":\"1\",\"passwordResetRequired\":false,\"lastPasswordChangeDate\":null,\"unverifiedEmail\":null,\"newPassword\":null,\"currentPassword\":null,\"verificationCodeIssuedDate\":null,\"verificationCode\":null,\"lastLoginAttemptIp\":null,\"authError\":null,\"inheritorOnDelete\":null,\"id\":\"1\",\"tempId\":null,\"draftId\":null,\"revisionId\":null,\"uid\":\"0d8e884e-9a5c-4ec7-b3fd-d9f8b1fd3084\",\"fieldLayoutId\":null,\"contentId\":\"1\",\"enabled\":\"1\",\"archived\":\"0\",\"siteId\":\"1\",\"enabledForSite\":\"1\",\"title\":null,\"slug\":null,\"uri\":null,\"dateCreated\":\"2019-11-16T19:11:01-08:00\",\"dateUpdated\":\"2019-11-16T19:11:01-08:00\",\"dateDeleted\":null,\"trashed\":false,\"propagateAll\":false,\"newSiteIds\":[],\"resaving\":false,\"duplicateOf\":null,\"previewing\":false,\"hardDelete\":false,\"ref\":\"admin\",\"status\":\"active\",\"structureId\":null,\"url\":null,\"cooldownEndTime\":null,\"friendlyName\":\"admin\",\"fullName\":null,\"isCurrent\":true,\"name\":\"admin\",\"preferredLanguage\":\"en-GB\",\"remainingCooldownTime\":null},\"name\":\"afterPropagate\",\"senderClass\":\"craft\\\\elements\\\\MatrixBlock\",\"sender\":{\"fieldId\":\"12\",\"ownerId\":399,\"ownerSiteId\":null,\"typeId\":\"3\",\"sortOrder\":4,\"collapsed\":false,\"deletedWithOwner\":false,\"id\":403,\"tempId\":null,\"draftId\":null,\"revisionId\":null,\"uid\":\"a714981c-9478-448f-b925-9abb0a1c5f45\",\"fieldLayoutId\":\"7\",\"contentId\":\"210\",\"enabled\":true,\"archived\":\"0\",\"siteId\":\"1\",\"enabledForSite\":true,\"title\":null,\"slug\":null,\"uri\":null,\"dateCreated\":\"2019-11-22T22:04:40-08:00\",\"dateUpdated\":\"2019-11-22T22:04:40-08:00\",\"dateDeleted\":null,\"trashed\":false,\"propagateAll\":true,\"newSiteIds\":[],\"resaving\":false,\"duplicateOf\":{\"fieldId\":\"12\",\"ownerId\":\"2\",\"ownerSiteId\":null,\"typeId\":\"3\",\"sortOrder\":4,\"collapsed\":false,\"deletedWithOwner\":false,\"id\":\"392\",\"tempId\":null,\"draftId\":null,\"revisionId\":null,\"uid\":\"c1a5756d-ddc9-46ab-9dfc-fc8cb48bc42e\",\"fieldLayoutId\":\"7\",\"contentId\":\"201\",\"enabled\":true,\"archived\":\"0\",\"siteId\":\"1\",\"enabledForSite\":true,\"title\":null,\"slug\":null,\"uri\":null,\"dateCreated\":\"2019-11-22T22:04:16-08:00\",\"dateUpdated\":\"2019-11-22T22:04:40-08:00\",\"dateDeleted\":null,\"trashed\":false,\"propagateAll\":false,\"newSiteIds\":[],\"resaving\":false,\"duplicateOf\":null,\"previewing\":false,\"hardDelete\":false,\"ref\":null,\"status\":\"enabled\",\"structureId\":null,\"url\":null,\"newsTitle\":\"erv\",\"newsDescription\":\"ver\",\"image\":{\"volumeId\":null,\"folderId\":null,\"filename\":null,\"kind\":null,\"width\":null,\"height\":null,\"size\":null,\"dateModified\":null,\"includeSubfolders\":false,\"withTransforms\":null,\"elementType\":\"craft\\\\elements\\\\Asset\",\"contentTable\":\"{{%content}}\",\"customFields\":{\"0\":{\"minBlocks\":\"\",\"maxBlocks\":\"\",\"contentTable\":\"{{%matrixcontent_availableproducts}}\",\"propagationMethod\":\"all\",\"localizeBlocks\":false,\"id\":\"6\",\"dateCreated\":\"2019-11-16T21:05:39-08:00\",\"dateUpdated\":\"2019-11-16T21:27:52-08:00\",\"groupId\":\"3\",\"name\":\"Available Products\",\"handle\":\"availableProducts\",\"context\":\"global\",\"instructions\":\"\",\"searchable\":\"1\",\"translationMethod\":\"site\",\"translationKeyFormat\":null,\"oldHandle\":null,\"oldSettings\":null,\"columnPrefix\":null,\"uid\":\"050801e0-9914-4a65-a49c-c3418c2da200\",\"layoutId\":null,\"tabId\":null,\"required\":null,\"sortOrder\":null},\"5\":{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\",\"id\":\"17\",\"dateCreated\":\"2019-11-22T17:30:59-08:00\",\"dateUpdated\":\"2019-11-22T17:30:59-08:00\",\"groupId\":\"5\",\"name\":\"News Description\",\"handle\":\"newsDescription\",\"context\":\"global\",\"instructions\":\"\",\"searchable\":\"1\",\"translationMethod\":\"none\",\"translationKeyFormat\":null,\"oldHandle\":null,\"oldSettings\":null,\"columnPrefix\":null,\"uid\":\"631b609a-3a78-4ddb-acae-caf3c6057662\",\"layoutId\":null,\"tabId\":null,\"required\":null,\"sortOrder\":null},\"6\":{\"minBlocks\":\"\",\"maxBlocks\":\"\",\"contentTable\":\"{{%matrixcontent_newsfeed}}\",\"propagationMethod\":\"all\",\"localizeBlocks\":false,\"id\":\"12\",\"dateCreated\":\"2019-11-16T21:33:06-08:00\",\"dateUpdated\":\"2019-11-16T21:33:06-08:00\",\"groupId\":\"4\",\"name\":\"News Feed\",\"handle\":\"newsFeed\",\"context\":\"global\",\"instructions\":\"\",\"searchable\":\"1\",\"translationMethod\":\"site\",\"translationKeyFormat\":null,\"oldHandle\":null,\"oldSettings\":null,\"columnPrefix\":null,\"uid\":\"737f3d64-426a-45e4-869b-05a5dcf2c242\",\"layoutId\":null,\"tabId\":null,\"required\":null,\"sortOrder\":null},\"7\":{\"source\":null,\"targetSiteId\":null,\"viewMode\":null,\"limit\":\"6\",\"selectionLabel\":\"Add Products\",\"validateRelatedElements\":\"\",\"localizeRelations\":false,\"allowMultipleSources\":true,\"allowLimit\":true,\"id\":\"18\",\"dateCreated\":\"2019-11-22T17:31:57-08:00\",\"dateUpdated\":\"2019-11-22T17:31:57-08:00\",\"groupId\":\"5\",\"name\":\"News Products \",\"handle\":\"newsProducts\",\"context\":\"global\",\"instructions\":\"\",\"searchable\":\"1\",\"translationMethod\":\"site\",\"translationKeyFormat\":null,\"oldHandle\":null,\"oldSettings\":null,\"columnPrefix\":null,\"uid\":\"0b3353c6-6585-45e9-9b26-7f8a36124b56\",\"layoutId\":null,\"tabId\":null,\"required\":null,\"sortOrder\":null},\"9\":{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\",\"id\":\"16\",\"dateCreated\":\"2019-11-22T17:30:32-08:00\",\"dateUpdated\":\"2019-11-22T18:18:43-08:00\",\"groupId\":\"5\",\"name\":\"News Title\",\"handle\":\"newsTitle\",\"context\":\"global\",\"instructions\":\"\",\"searchable\":\"1\",\"translationMethod\":\"none\",\"translationKeyFormat\":null,\"oldHandle\":null,\"oldSettings\":null,\"columnPrefix\":null,\"uid\":\"c4585c4e-f4a6-439c-a95b-1f2a50263b07\",\"layoutId\":null,\"tabId\":null,\"required\":null,\"sortOrder\":null}},\"inReverse\":false,\"asArray\":false,\"ignorePlaceholders\":false,\"drafts\":false,\"draftId\":null,\"draftOf\":null,\"draftCreator\":null,\"revisions\":false,\"revisionId\":null,\"revisionOf\":null,\"revisionCreator\":null,\"id\":null,\"uid\":null,\"fixedOrder\":false,\"status\":[\"enabled\"],\"archived\":false,\"trashed\":false,\"dateCreated\":null,\"dateUpdated\":null,\"siteId\":1,\"unique\":false,\"preferSites\":false,\"enabledForSite\":true,\"leaves\":false,\"relatedTo\":null,\"title\":null,\"slug\":null,\"uri\":null,\"search\":null,\"ref\":null,\"with\":null,\"orderBy\":{\"relations.sortOrder\":4},\"withStructure\":null,\"structureId\":null,\"level\":null,\"hasDescendants\":null,\"ancestorOf\":null,\"ancestorDist\":null,\"descendantOf\":null,\"descendantDist\":null,\"siblingOf\":null,\"prevSiblingOf\":null,\"nextSiblingOf\":null,\"positionedBefore\":null,\"positionedAfter\":null,\"select\":{\"**\":\"**\"},\"selectOption\":null,\"distinct\":null,\"from\":null,\"groupBy\":null,\"join\":[[\"INNER JOIN\",\"{{%relations}} relations\"]],\"having\":null,\"union\":null,\"params\":[],\"queryCacheDuration\":null,\"queryCacheDependency\":null,\"where\":null,\"limit\":null,\"offset\":null,\"indexBy\":null,\"emulateExecution\":false,\"availableProducts\":null,\"productName\":null,\"price\":null,\"image\":null,\"available\":null,\"newsFeed\":null,\"newsTitle\":null,\"newsDescription\":null,\"newsProducts\":null},\"owner\":{\"sectionId\":\"1\",\"typeId\":\"1\",\"authorId\":null,\"postDate\":\"2019-11-16T19:13:00-08:00\",\"expiryDate\":null,\"newParentId\":null,\"deletedWithEntryType\":false,\"id\":\"2\",\"tempId\":null,\"draftId\":null,\"revisionId\":null,\"uid\":\"7e2370a1-ddcf-4054-ace6-a33fbc894bac\",\"fieldLayoutId\":\"1\",\"contentId\":\"2\",\"enabled\":true,\"archived\":\"0\",\"siteId\":\"1\",\"enabledForSite\":true,\"title\":\"Home\",\"slug\":\"home\",\"uri\":\"__home__\",\"dateCreated\":\"2019-11-16T19:13:40-08:00\",\"dateUpdated\":\"2019-11-22T22:04:40-08:00\",\"dateDeleted\":null,\"trashed\":false,\"propagateAll\":false,\"newSiteIds\":[],\"resaving\":false,\"duplicateOf\":null,\"previewing\":false,\"hardDelete\":false,\"ref\":\"home/home\",\"status\":\"live\",\"structureId\":null,\"url\":\"http://localhost:8888/\",\"newsFeed\":{\"fieldId\":\"12\",\"ownerId\":\"2\",\"ownerSiteId\":null,\"allowOwnerDrafts\":null,\"allowOwnerRevisions\":null,\"typeId\":null,\"elementType\":\"craft\\\\elements\\\\MatrixBlock\",\"contentTable\":\"{{%content}}\",\"customFields\":null,\"inReverse\":false,\"asArray\":false,\"ignorePlaceholders\":false,\"drafts\":false,\"draftId\":null,\"draftOf\":null,\"draftCreator\":null,\"revisions\":false,\"revisionId\":null,\"revisionOf\":null,\"revisionCreator\":null,\"id\":null,\"uid\":null,\"fixedOrder\":false,\"status\":[\"enabled\"],\"archived\":false,\"trashed\":false,\"dateCreated\":null,\"dateUpdated\":null,\"siteId\":\"1\",\"unique\":false,\"preferSites\":false,\"enabledForSite\":true,\"leaves\":false,\"relatedTo\":null,\"title\":null,\"slug\":null,\"uri\":null,\"search\":null,\"ref\":null,\"with\":null,\"orderBy\":\"\",\"withStructure\":null,\"structureId\":null,\"level\":null,\"hasDescendants\":null,\"ancestorOf\":null,\"ancestorDist\":null,\"descendantOf\":null,\"descendantDist\":null,\"siblingOf\":null,\"prevSiblingOf\":null,\"nextSiblingOf\":null,\"positionedBefore\":null,\"positionedAfter\":null,\"select\":{\"**\":\"**\"},\"selectOption\":null,\"distinct\":null,\"from\":null,\"groupBy\":null,\"join\":null,\"having\":null,\"union\":null,\"params\":[],\"queryCacheDuration\":null,\"queryCacheDependency\":null,\"where\":null,\"limit\":null,\"offset\":null,\"indexBy\":null,\"emulateExecution\":false,\"availableProducts\":null,\"productName\":null,\"price\":null,\"image\":null,\"available\":null,\"newsFeed\":null,\"newsTitle\":null,\"newsDescription\":null,\"newsProducts\":null}}},\"previewing\":false,\"hardDelete\":false,\"ref\":null,\"status\":\"enabled\",\"structureId\":null,\"url\":null,\"newsTitle\":\"erv\",\"newsDescription\":\"ver\",\"image\":{\"volumeId\":null,\"folderId\":null,\"filename\":null,\"kind\":null,\"width\":null,\"height\":null,\"size\":null,\"dateModified\":null,\"includeSubfolders\":false,\"withTransforms\":null,\"elementType\":\"craft\\\\elements\\\\Asset\",\"contentTable\":\"{{%content}}\",\"customFields\":null,\"inReverse\":false,\"asArray\":false,\"ignorePlaceholders\":false,\"drafts\":false,\"draftId\":null,\"draftOf\":null,\"draftCreator\":null,\"revisions\":false,\"revisionId\":null,\"revisionOf\":null,\"revisionCreator\":null,\"id\":null,\"uid\":null,\"fixedOrder\":false,\"status\":[\"enabled\"],\"archived\":false,\"trashed\":false,\"dateCreated\":null,\"dateUpdated\":null,\"siteId\":1,\"unique\":false,\"preferSites\":false,\"enabledForSite\":true,\"leaves\":false,\"relatedTo\":null,\"title\":null,\"slug\":null,\"uri\":null,\"search\":null,\"ref\":null,\"with\":null,\"orderBy\":{\"relations.sortOrder\":4},\"withStructure\":null,\"structureId\":null,\"level\":null,\"hasDescendants\":null,\"ancestorOf\":null,\"ancestorDist\":null,\"descendantOf\":null,\"descendantDist\":null,\"siblingOf\":null,\"prevSiblingOf\":null,\"nextSiblingOf\":null,\"positionedBefore\":null,\"positionedAfter\":null,\"select\":{\"**\":\"**\"},\"selectOption\":null,\"distinct\":null,\"from\":null,\"groupBy\":null,\"join\":[[\"INNER JOIN\",\"{{%relations}} relations\",[\"and\",\"[[relations.targetId]] = [[elements.id]]\"]]],\"having\":null,\"union\":null,\"params\":[],\"queryCacheDuration\":null,\"queryCacheDependency\":null,\"where\":null,\"limit\":null,\"offset\":null,\"indexBy\":null,\"emulateExecution\":false,\"availableProducts\":null,\"productName\":null,\"price\":null,\"image\":null,\"available\":null,\"newsFeed\":null,\"newsTitle\":null,\"newsDescription\":null,\"newsProducts\":null},\"owner\":{\"sectionId\":\"1\",\"typeId\":\"1\",\"authorId\":null,\"postDate\":\"2019-11-16T19:13:00-08:00\",\"expiryDate\":null,\"newParentId\":null,\"deletedWithEntryType\":false,\"id\":399,\"tempId\":null,\"draftId\":null,\"revisionId\":\"84\",\"uid\":\"35744967-bd6f-4ff2-acb2-4f16852bdec4\",\"fieldLayoutId\":\"1\",\"contentId\":\"144\",\"enabled\":true,\"archived\":\"0\",\"siteId\":\"1\",\"enabledForSite\":true,\"title\":\"Home\",\"slug\":\"home\",\"uri\":\"__home__\",\"dateCreated\":\"2019-11-22T22:04:40-08:00\",\"dateUpdated\":\"2019-11-22T22:04:40-08:00\",\"dateDeleted\":null,\"trashed\":false,\"propagateAll\":false,\"newSiteIds\":[],\"resaving\":false,\"duplicateOf\":{\"sectionId\":\"1\",\"typeId\":\"1\",\"authorId\":null,\"postDate\":\"2019-11-16T19:13:00-08:00\",\"expiryDate\":null,\"newParentId\":null,\"deletedWithEntryType\":false,\"id\":\"2\",\"tempId\":null,\"draftId\":null,\"revisionId\":null,\"uid\":\"7e2370a1-ddcf-4054-ace6-a33fbc894bac\",\"fieldLayoutId\":\"1\",\"contentId\":\"2\",\"enabled\":true,\"archived\":\"0\",\"siteId\":\"1\",\"enabledForSite\":true,\"title\":\"Home\",\"slug\":\"home\",\"uri\":\"__home__\",\"dateCreated\":\"2019-11-16T19:13:40-08:00\",\"dateUpdated\":\"2019-11-22T22:04:40-08:00\",\"dateDeleted\":null,\"trashed\":false,\"propagateAll\":false,\"newSiteIds\":[],\"resaving\":false,\"duplicateOf\":null,\"previewing\":false,\"hardDelete\":false,\"ref\":\"home/home\",\"status\":\"live\",\"structureId\":null,\"url\":\"http://localhost:8888/\",\"newsFeed\":{\"fieldId\":\"12\",\"ownerId\":\"2\",\"ownerSiteId\":null,\"allowOwnerDrafts\":null,\"allowOwnerRevisions\":null,\"typeId\":null,\"elementType\":\"craft\\\\elements\\\\MatrixBlock\",\"contentTable\":\"{{%content}}\",\"customFields\":null,\"inReverse\":false,\"asArray\":false,\"ignorePlaceholders\":false,\"drafts\":false,\"draftId\":null,\"draftOf\":null,\"draftCreator\":null,\"revisions\":false,\"revisionId\":null,\"revisionOf\":null,\"revisionCreator\":null,\"id\":null,\"uid\":null,\"fixedOrder\":false,\"status\":[\"enabled\"],\"archived\":false,\"trashed\":false,\"dateCreated\":null,\"dateUpdated\":null,\"siteId\":\"1\",\"unique\":false,\"preferSites\":false,\"enabledForSite\":true,\"leaves\":false,\"relatedTo\":null,\"title\":null,\"slug\":null,\"uri\":null,\"search\":null,\"ref\":null,\"with\":null,\"orderBy\":\"\",\"withStructure\":null,\"structureId\":null,\"level\":null,\"hasDescendants\":null,\"ancestorOf\":null,\"ancestorDist\":null,\"descendantOf\":null,\"descendantDist\":null,\"siblingOf\":null,\"prevSiblingOf\":null,\"nextSiblingOf\":null,\"positionedBefore\":null,\"positionedAfter\":null,\"select\":{\"**\":\"**\"},\"selectOption\":null,\"distinct\":null,\"from\":null,\"groupBy\":null,\"join\":null,\"having\":null,\"union\":null,\"params\":[],\"queryCacheDuration\":null,\"queryCacheDependency\":null,\"where\":null,\"limit\":null,\"offset\":null,\"indexBy\":null,\"emulateExecution\":false,\"availableProducts\":null,\"productName\":null,\"price\":null,\"image\":null,\"available\":null,\"newsFeed\":null,\"newsTitle\":null,\"newsDescription\":null,\"newsProducts\":null}},\"previewing\":false,\"hardDelete\":false,\"ref\":\"home/home\",\"status\":\"live\",\"structureId\":null,\"url\":\"http://localhost:8888/\",\"newsFeed\":{\"fieldId\":\"12\",\"ownerId\":\"2\",\"ownerSiteId\":null,\"allowOwnerDrafts\":null,\"allowOwnerRevisions\":null,\"typeId\":null,\"elementType\":\"craft\\\\elements\\\\MatrixBlock\",\"contentTable\":\"{{%content}}\",\"customFields\":null,\"inReverse\":false,\"asArray\":false,\"ignorePlaceholders\":false,\"drafts\":false,\"draftId\":null,\"draftOf\":null,\"draftCreator\":null,\"revisions\":false,\"revisionId\":null,\"revisionOf\":null,\"revisionCreator\":null,\"id\":null,\"uid\":null,\"fixedOrder\":false,\"status\":[\"enabled\"],\"archived\":false,\"trashed\":false,\"dateCreated\":null,\"dateUpdated\":null,\"siteId\":\"1\",\"unique\":false,\"preferSites\":false,\"enabledForSite\":true,\"leaves\":false,\"relatedTo\":null,\"title\":null,\"slug\":null,\"uri\":null,\"search\":null,\"ref\":null,\"with\":null,\"orderBy\":\"\",\"withStructure\":null,\"structureId\":null,\"level\":null,\"hasDescendants\":null,\"ancestorOf\":null,\"ancestorDist\":null,\"descendantOf\":null,\"descendantDist\":null,\"siblingOf\":null,\"prevSiblingOf\":null,\"nextSiblingOf\":null,\"positionedBefore\":null,\"positionedAfter\":null,\"select\":{\"**\":\"**\"},\"selectOption\":null,\"distinct\":null,\"from\":null,\"groupBy\":null,\"join\":null,\"having\":null,\"union\":null,\"params\":[],\"queryCacheDuration\":null,\"queryCacheDependency\":null,\"where\":null,\"limit\":null,\"offset\":null,\"indexBy\":null,\"emulateExecution\":false,\"availableProducts\":null,\"productName\":null,\"price\":null,\"image\":null,\"available\":null,\"newsFeed\":null,\"newsTitle\":null,\"newsDescription\":null,\"newsProducts\":null}}},\"eventClass\":\"craft\\\\events\\\\ModelEvent\",\"event\":{\"isNew\":[true],\"isValid\":[true]}}', 200, '{\"Access-Control-Allow-Origin\":[\"*\"],\"Content-Type\":[\"application/json\"],\"Date\":[\"Sat, 23 Nov 2019 06:04:51 GMT\"],\"P3P\":[\"CP=\\\"IDC DSP COR ADM DEVi TAIi PSA PSD IVAi IVDi CONi HIS OUR IND CNT\\\"\"],\"Response-Id\":[\"5dd8cc03-27b8-4902-95b4-004768302d70\"],\"Server\":[\"nginx\"],\"Vary\":[\"X-Session-Key\"],\"X-Frame-Options\":[\"SAMEORIGIN\"],\"X-Rate-Limit-Limit\":[\"10000\"],\"X-Rate-Limit-Remaining\":[\"9981\"],\"X-Rate-Limit-Reset\":[\"1574489400\"],\"X-Session-Key\":[\"anonymous\"],\"X-Zapier-Fast-Return\":[\"true\"],\"X-Zapier-Jobs\":[\"A hacker like yourself should consider working at Zapier!\"],\"X-Zapier-Jobs-Link\":[\"https://zapier.com/jobs/\"],\"X-Zapier-Revision\":[\"a3f0f5a0e2f54d0ea7deec04bf25200b29167033\"],\"Content-Length\":[\"172\"],\"Connection\":[\"keep-alive\"]}', '{\"status\": \"success\", \"attempt\": \"5dd8cc03-27b8-4902-95b4-004768302d70\", \"id\": \"9b768b02-a04c-4175-b018-534b0ec28613\", \"request_id\": \"5dd8cc03-27b8-4902-95b4-004768302d70\"}', 1251, '2019-11-23 06:04:40', '2019-11-23 06:04:50', 'a63eb4ec-3798-422f-81e7-e0f76697baea'),
(56, 1, 'done', 1, 'post', 'https://hooks.zapier.com/hooks/catch/6128230/o4x908w/', '{\"Content-Type\":\"application/json\"}', '{\"time\":\"2019-11-22T22:04:40-08:00\",\"user\":{\"username\":\"admin\",\"photoId\":null,\"firstName\":null,\"lastName\":null,\"email\":\"h.lawrence@windowslive.com\",\"password\":\"••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••\",\"admin\":\"1\",\"locked\":\"0\",\"suspended\":\"0\",\"pending\":\"0\",\"lastLoginDate\":\"2019-11-22T21:50:49-08:00\",\"invalidLoginCount\":null,\"lastInvalidLoginDate\":null,\"lockoutDate\":null,\"hasDashboard\":\"1\",\"passwordResetRequired\":false,\"lastPasswordChangeDate\":null,\"unverifiedEmail\":null,\"newPassword\":null,\"currentPassword\":null,\"verificationCodeIssuedDate\":null,\"verificationCode\":null,\"lastLoginAttemptIp\":null,\"authError\":null,\"inheritorOnDelete\":null,\"id\":\"1\",\"tempId\":null,\"draftId\":null,\"revisionId\":null,\"uid\":\"0d8e884e-9a5c-4ec7-b3fd-d9f8b1fd3084\",\"fieldLayoutId\":null,\"contentId\":\"1\",\"enabled\":\"1\",\"archived\":\"0\",\"siteId\":\"1\",\"enabledForSite\":\"1\",\"title\":null,\"slug\":null,\"uri\":null,\"dateCreated\":\"2019-11-16T19:11:01-08:00\",\"dateUpdated\":\"2019-11-16T19:11:01-08:00\",\"dateDeleted\":null,\"trashed\":false,\"propagateAll\":false,\"newSiteIds\":[],\"resaving\":false,\"duplicateOf\":null,\"previewing\":false,\"hardDelete\":false,\"ref\":\"admin\",\"status\":\"active\",\"structureId\":null,\"url\":null,\"cooldownEndTime\":null,\"friendlyName\":\"admin\",\"fullName\":null,\"isCurrent\":true,\"name\":\"admin\",\"preferredLanguage\":\"en-GB\",\"remainingCooldownTime\":null},\"name\":\"afterPropagate\",\"senderClass\":\"craft\\\\elements\\\\MatrixBlock\",\"sender\":{\"fieldId\":\"12\",\"ownerId\":399,\"ownerSiteId\":null,\"typeId\":\"3\",\"sortOrder\":5,\"collapsed\":false,\"deletedWithOwner\":false,\"id\":404,\"tempId\":null,\"draftId\":null,\"revisionId\":null,\"uid\":\"3e244c33-6c10-4b90-b1ef-ba46472eb4c5\",\"fieldLayoutId\":\"7\",\"contentId\":\"211\",\"enabled\":true,\"archived\":false,\"siteId\":\"1\",\"enabledForSite\":true,\"title\":null,\"slug\":null,\"uri\":null,\"dateCreated\":\"2019-11-22T22:04:40-08:00\",\"dateUpdated\":\"2019-11-22T22:04:40-08:00\",\"dateDeleted\":null,\"trashed\":false,\"propagateAll\":true,\"newSiteIds\":[],\"resaving\":false,\"duplicateOf\":{\"fieldId\":\"12\",\"ownerId\":\"2\",\"ownerSiteId\":null,\"typeId\":\"3\",\"sortOrder\":5,\"collapsed\":false,\"deletedWithOwner\":false,\"id\":398,\"tempId\":null,\"draftId\":null,\"revisionId\":null,\"uid\":\"3833865d-b9bf-4b2e-a5d0-0de88c025817\",\"fieldLayoutId\":\"7\",\"contentId\":\"206\",\"enabled\":true,\"archived\":false,\"siteId\":\"1\",\"enabledForSite\":true,\"title\":null,\"slug\":null,\"uri\":null,\"dateCreated\":\"2019-11-22T22:04:40-08:00\",\"dateUpdated\":\"2019-11-22T22:04:40-08:00\",\"dateDeleted\":null,\"trashed\":false,\"propagateAll\":true,\"newSiteIds\":[],\"resaving\":false,\"duplicateOf\":null,\"previewing\":false,\"hardDelete\":false,\"ref\":null,\"status\":\"enabled\",\"structureId\":null,\"url\":null,\"newsTitle\":\"wef\",\"newsDescription\":\"dw\",\"image\":{\"volumeId\":null,\"folderId\":null,\"filename\":null,\"kind\":null,\"width\":null,\"height\":null,\"size\":null,\"dateModified\":null,\"includeSubfolders\":false,\"withTransforms\":null,\"elementType\":\"craft\\\\elements\\\\Asset\",\"contentTable\":\"{{%content}}\",\"customFields\":{\"0\":{\"minBlocks\":\"\",\"maxBlocks\":\"\",\"contentTable\":\"{{%matrixcontent_availableproducts}}\",\"propagationMethod\":\"all\",\"localizeBlocks\":false,\"id\":\"6\",\"dateCreated\":\"2019-11-16T21:05:39-08:00\",\"dateUpdated\":\"2019-11-16T21:27:52-08:00\",\"groupId\":\"3\",\"name\":\"Available Products\",\"handle\":\"availableProducts\",\"context\":\"global\",\"instructions\":\"\",\"searchable\":\"1\",\"translationMethod\":\"site\",\"translationKeyFormat\":null,\"oldHandle\":null,\"oldSettings\":null,\"columnPrefix\":null,\"uid\":\"050801e0-9914-4a65-a49c-c3418c2da200\",\"layoutId\":null,\"tabId\":null,\"required\":null,\"sortOrder\":null},\"5\":{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\",\"id\":\"17\",\"dateCreated\":\"2019-11-22T17:30:59-08:00\",\"dateUpdated\":\"2019-11-22T17:30:59-08:00\",\"groupId\":\"5\",\"name\":\"News Description\",\"handle\":\"newsDescription\",\"context\":\"global\",\"instructions\":\"\",\"searchable\":\"1\",\"translationMethod\":\"none\",\"translationKeyFormat\":null,\"oldHandle\":null,\"oldSettings\":null,\"columnPrefix\":null,\"uid\":\"631b609a-3a78-4ddb-acae-caf3c6057662\",\"layoutId\":null,\"tabId\":null,\"required\":null,\"sortOrder\":null},\"6\":{\"minBlocks\":\"\",\"maxBlocks\":\"\",\"contentTable\":\"{{%matrixcontent_newsfeed}}\",\"propagationMethod\":\"all\",\"localizeBlocks\":false,\"id\":\"12\",\"dateCreated\":\"2019-11-16T21:33:06-08:00\",\"dateUpdated\":\"2019-11-16T21:33:06-08:00\",\"groupId\":\"4\",\"name\":\"News Feed\",\"handle\":\"newsFeed\",\"context\":\"global\",\"instructions\":\"\",\"searchable\":\"1\",\"translationMethod\":\"site\",\"translationKeyFormat\":null,\"oldHandle\":null,\"oldSettings\":null,\"columnPrefix\":null,\"uid\":\"737f3d64-426a-45e4-869b-05a5dcf2c242\",\"layoutId\":null,\"tabId\":null,\"required\":null,\"sortOrder\":null},\"7\":{\"source\":null,\"targetSiteId\":null,\"viewMode\":null,\"limit\":\"6\",\"selectionLabel\":\"Add Products\",\"validateRelatedElements\":\"\",\"localizeRelations\":false,\"allowMultipleSources\":true,\"allowLimit\":true,\"id\":\"18\",\"dateCreated\":\"2019-11-22T17:31:57-08:00\",\"dateUpdated\":\"2019-11-22T17:31:57-08:00\",\"groupId\":\"5\",\"name\":\"News Products \",\"handle\":\"newsProducts\",\"context\":\"global\",\"instructions\":\"\",\"searchable\":\"1\",\"translationMethod\":\"site\",\"translationKeyFormat\":null,\"oldHandle\":null,\"oldSettings\":null,\"columnPrefix\":null,\"uid\":\"0b3353c6-6585-45e9-9b26-7f8a36124b56\",\"layoutId\":null,\"tabId\":null,\"required\":null,\"sortOrder\":null},\"9\":{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\",\"id\":\"16\",\"dateCreated\":\"2019-11-22T17:30:32-08:00\",\"dateUpdated\":\"2019-11-22T18:18:43-08:00\",\"groupId\":\"5\",\"name\":\"News Title\",\"handle\":\"newsTitle\",\"context\":\"global\",\"instructions\":\"\",\"searchable\":\"1\",\"translationMethod\":\"none\",\"translationKeyFormat\":null,\"oldHandle\":null,\"oldSettings\":null,\"columnPrefix\":null,\"uid\":\"c4585c4e-f4a6-439c-a95b-1f2a50263b07\",\"layoutId\":null,\"tabId\":null,\"required\":null,\"sortOrder\":null}},\"inReverse\":false,\"asArray\":false,\"ignorePlaceholders\":false,\"drafts\":false,\"draftId\":null,\"draftOf\":null,\"draftCreator\":null,\"revisions\":false,\"revisionId\":null,\"revisionOf\":null,\"revisionCreator\":null,\"id\":null,\"uid\":null,\"fixedOrder\":false,\"status\":[\"enabled\"],\"archived\":false,\"trashed\":false,\"dateCreated\":null,\"dateUpdated\":null,\"siteId\":1,\"unique\":false,\"preferSites\":false,\"enabledForSite\":true,\"leaves\":false,\"relatedTo\":null,\"title\":null,\"slug\":null,\"uri\":null,\"search\":null,\"ref\":null,\"with\":null,\"orderBy\":{\"relations.sortOrder\":4},\"withStructure\":null,\"structureId\":null,\"level\":null,\"hasDescendants\":null,\"ancestorOf\":null,\"ancestorDist\":null,\"descendantOf\":null,\"descendantDist\":null,\"siblingOf\":null,\"prevSiblingOf\":null,\"nextSiblingOf\":null,\"positionedBefore\":null,\"positionedAfter\":null,\"select\":{\"**\":\"**\"},\"selectOption\":null,\"distinct\":null,\"from\":null,\"groupBy\":null,\"join\":[[\"INNER JOIN\",\"{{%relations}} relations\"]],\"having\":null,\"union\":null,\"params\":[],\"queryCacheDuration\":null,\"queryCacheDependency\":null,\"where\":null,\"limit\":null,\"offset\":null,\"indexBy\":null,\"emulateExecution\":false,\"availableProducts\":null,\"productName\":null,\"price\":null,\"image\":null,\"available\":null,\"newsFeed\":null,\"newsTitle\":null,\"newsDescription\":null,\"newsProducts\":null},\"owner\":{\"sectionId\":\"1\",\"typeId\":\"1\",\"authorId\":null,\"postDate\":\"2019-11-16T19:13:00-08:00\",\"expiryDate\":null,\"newParentId\":null,\"deletedWithEntryType\":false,\"id\":\"2\",\"tempId\":null,\"draftId\":null,\"revisionId\":null,\"uid\":\"7e2370a1-ddcf-4054-ace6-a33fbc894bac\",\"fieldLayoutId\":\"1\",\"contentId\":\"2\",\"enabled\":true,\"archived\":\"0\",\"siteId\":\"1\",\"enabledForSite\":true,\"title\":\"Home\",\"slug\":\"home\",\"uri\":\"__home__\",\"dateCreated\":\"2019-11-16T19:13:40-08:00\",\"dateUpdated\":\"2019-11-22T22:04:40-08:00\",\"dateDeleted\":null,\"trashed\":false,\"propagateAll\":false,\"newSiteIds\":[],\"resaving\":false,\"duplicateOf\":null,\"previewing\":false,\"hardDelete\":false,\"ref\":\"home/home\",\"status\":\"live\",\"structureId\":null,\"url\":\"http://localhost:8888/\",\"newsFeed\":{\"fieldId\":\"12\",\"ownerId\":\"2\",\"ownerSiteId\":null,\"allowOwnerDrafts\":null,\"allowOwnerRevisions\":null,\"typeId\":null,\"elementType\":\"craft\\\\elements\\\\MatrixBlock\",\"contentTable\":\"{{%content}}\",\"customFields\":null,\"inReverse\":false,\"asArray\":false,\"ignorePlaceholders\":false,\"drafts\":false,\"draftId\":null,\"draftOf\":null,\"draftCreator\":null,\"revisions\":false,\"revisionId\":null,\"revisionOf\":null,\"revisionCreator\":null,\"id\":null,\"uid\":null,\"fixedOrder\":false,\"status\":[\"enabled\"],\"archived\":false,\"trashed\":false,\"dateCreated\":null,\"dateUpdated\":null,\"siteId\":\"1\",\"unique\":false,\"preferSites\":false,\"enabledForSite\":true,\"leaves\":false,\"relatedTo\":null,\"title\":null,\"slug\":null,\"uri\":null,\"search\":null,\"ref\":null,\"with\":null,\"orderBy\":\"\",\"withStructure\":null,\"structureId\":null,\"level\":null,\"hasDescendants\":null,\"ancestorOf\":null,\"ancestorDist\":null,\"descendantOf\":null,\"descendantDist\":null,\"siblingOf\":null,\"prevSiblingOf\":null,\"nextSiblingOf\":null,\"positionedBefore\":null,\"positionedAfter\":null,\"select\":{\"**\":\"**\"},\"selectOption\":null,\"distinct\":null,\"from\":null,\"groupBy\":null,\"join\":null,\"having\":null,\"union\":null,\"params\":[],\"queryCacheDuration\":null,\"queryCacheDependency\":null,\"where\":null,\"limit\":null,\"offset\":null,\"indexBy\":null,\"emulateExecution\":false,\"availableProducts\":null,\"productName\":null,\"price\":null,\"image\":null,\"available\":null,\"newsFeed\":null,\"newsTitle\":null,\"newsDescription\":null,\"newsProducts\":null}}},\"previewing\":false,\"hardDelete\":false,\"ref\":null,\"status\":\"enabled\",\"structureId\":null,\"url\":null,\"newsTitle\":\"wef\",\"newsDescription\":\"dw\",\"image\":{\"volumeId\":null,\"folderId\":null,\"filename\":null,\"kind\":null,\"width\":null,\"height\":null,\"size\":null,\"dateModified\":null,\"includeSubfolders\":false,\"withTransforms\":null,\"elementType\":\"craft\\\\elements\\\\Asset\",\"contentTable\":\"{{%content}}\",\"customFields\":null,\"inReverse\":false,\"asArray\":false,\"ignorePlaceholders\":false,\"drafts\":false,\"draftId\":null,\"draftOf\":null,\"draftCreator\":null,\"revisions\":false,\"revisionId\":null,\"revisionOf\":null,\"revisionCreator\":null,\"id\":null,\"uid\":null,\"fixedOrder\":false,\"status\":[\"enabled\"],\"archived\":false,\"trashed\":false,\"dateCreated\":null,\"dateUpdated\":null,\"siteId\":1,\"unique\":false,\"preferSites\":false,\"enabledForSite\":true,\"leaves\":false,\"relatedTo\":null,\"title\":null,\"slug\":null,\"uri\":null,\"search\":null,\"ref\":null,\"with\":null,\"orderBy\":{\"relations.sortOrder\":4},\"withStructure\":null,\"structureId\":null,\"level\":null,\"hasDescendants\":null,\"ancestorOf\":null,\"ancestorDist\":null,\"descendantOf\":null,\"descendantDist\":null,\"siblingOf\":null,\"prevSiblingOf\":null,\"nextSiblingOf\":null,\"positionedBefore\":null,\"positionedAfter\":null,\"select\":{\"**\":\"**\"},\"selectOption\":null,\"distinct\":null,\"from\":null,\"groupBy\":null,\"join\":[[\"INNER JOIN\",\"{{%relations}} relations\",[\"and\",\"[[relations.targetId]] = [[elements.id]]\"]]],\"having\":null,\"union\":null,\"params\":[],\"queryCacheDuration\":null,\"queryCacheDependency\":null,\"where\":null,\"limit\":null,\"offset\":null,\"indexBy\":null,\"emulateExecution\":false,\"availableProducts\":null,\"productName\":null,\"price\":null,\"image\":null,\"available\":null,\"newsFeed\":null,\"newsTitle\":null,\"newsDescription\":null,\"newsProducts\":null},\"owner\":{\"sectionId\":\"1\",\"typeId\":\"1\",\"authorId\":null,\"postDate\":\"2019-11-16T19:13:00-08:00\",\"expiryDate\":null,\"newParentId\":null,\"deletedWithEntryType\":false,\"id\":399,\"tempId\":null,\"draftId\":null,\"revisionId\":\"84\",\"uid\":\"35744967-bd6f-4ff2-acb2-4f16852bdec4\",\"fieldLayoutId\":\"1\",\"contentId\":\"144\",\"enabled\":true,\"archived\":\"0\",\"siteId\":\"1\",\"enabledForSite\":true,\"title\":\"Home\",\"slug\":\"home\",\"uri\":\"__home__\",\"dateCreated\":\"2019-11-22T22:04:40-08:00\",\"dateUpdated\":\"2019-11-22T22:04:40-08:00\",\"dateDeleted\":null,\"trashed\":false,\"propagateAll\":false,\"newSiteIds\":[],\"resaving\":false,\"duplicateOf\":{\"sectionId\":\"1\",\"typeId\":\"1\",\"authorId\":null,\"postDate\":\"2019-11-16T19:13:00-08:00\",\"expiryDate\":null,\"newParentId\":null,\"deletedWithEntryType\":false,\"id\":\"2\",\"tempId\":null,\"draftId\":null,\"revisionId\":null,\"uid\":\"7e2370a1-ddcf-4054-ace6-a33fbc894bac\",\"fieldLayoutId\":\"1\",\"contentId\":\"2\",\"enabled\":true,\"archived\":\"0\",\"siteId\":\"1\",\"enabledForSite\":true,\"title\":\"Home\",\"slug\":\"home\",\"uri\":\"__home__\",\"dateCreated\":\"2019-11-16T19:13:40-08:00\",\"dateUpdated\":\"2019-11-22T22:04:40-08:00\",\"dateDeleted\":null,\"trashed\":false,\"propagateAll\":false,\"newSiteIds\":[],\"resaving\":false,\"duplicateOf\":null,\"previewing\":false,\"hardDelete\":false,\"ref\":\"home/home\",\"status\":\"live\",\"structureId\":null,\"url\":\"http://localhost:8888/\",\"newsFeed\":{\"fieldId\":\"12\",\"ownerId\":\"2\",\"ownerSiteId\":null,\"allowOwnerDrafts\":null,\"allowOwnerRevisions\":null,\"typeId\":null,\"elementType\":\"craft\\\\elements\\\\MatrixBlock\",\"contentTable\":\"{{%content}}\",\"customFields\":null,\"inReverse\":false,\"asArray\":false,\"ignorePlaceholders\":false,\"drafts\":false,\"draftId\":null,\"draftOf\":null,\"draftCreator\":null,\"revisions\":false,\"revisionId\":null,\"revisionOf\":null,\"revisionCreator\":null,\"id\":null,\"uid\":null,\"fixedOrder\":false,\"status\":[\"enabled\"],\"archived\":false,\"trashed\":false,\"dateCreated\":null,\"dateUpdated\":null,\"siteId\":\"1\",\"unique\":false,\"preferSites\":false,\"enabledForSite\":true,\"leaves\":false,\"relatedTo\":null,\"title\":null,\"slug\":null,\"uri\":null,\"search\":null,\"ref\":null,\"with\":null,\"orderBy\":\"\",\"withStructure\":null,\"structureId\":null,\"level\":null,\"hasDescendants\":null,\"ancestorOf\":null,\"ancestorDist\":null,\"descendantOf\":null,\"descendantDist\":null,\"siblingOf\":null,\"prevSiblingOf\":null,\"nextSiblingOf\":null,\"positionedBefore\":null,\"positionedAfter\":null,\"select\":{\"**\":\"**\"},\"selectOption\":null,\"distinct\":null,\"from\":null,\"groupBy\":null,\"join\":null,\"having\":null,\"union\":null,\"params\":[],\"queryCacheDuration\":null,\"queryCacheDependency\":null,\"where\":null,\"limit\":null,\"offset\":null,\"indexBy\":null,\"emulateExecution\":false,\"availableProducts\":null,\"productName\":null,\"price\":null,\"image\":null,\"available\":null,\"newsFeed\":null,\"newsTitle\":null,\"newsDescription\":null,\"newsProducts\":null}},\"previewing\":false,\"hardDelete\":false,\"ref\":\"home/home\",\"status\":\"live\",\"structureId\":null,\"url\":\"http://localhost:8888/\",\"newsFeed\":{\"fieldId\":\"12\",\"ownerId\":\"2\",\"ownerSiteId\":null,\"allowOwnerDrafts\":null,\"allowOwnerRevisions\":null,\"typeId\":null,\"elementType\":\"craft\\\\elements\\\\MatrixBlock\",\"contentTable\":\"{{%content}}\",\"customFields\":null,\"inReverse\":false,\"asArray\":false,\"ignorePlaceholders\":false,\"drafts\":false,\"draftId\":null,\"draftOf\":null,\"draftCreator\":null,\"revisions\":false,\"revisionId\":null,\"revisionOf\":null,\"revisionCreator\":null,\"id\":null,\"uid\":null,\"fixedOrder\":false,\"status\":[\"enabled\"],\"archived\":false,\"trashed\":false,\"dateCreated\":null,\"dateUpdated\":null,\"siteId\":\"1\",\"unique\":false,\"preferSites\":false,\"enabledForSite\":true,\"leaves\":false,\"relatedTo\":null,\"title\":null,\"slug\":null,\"uri\":null,\"search\":null,\"ref\":null,\"with\":null,\"orderBy\":\"\",\"withStructure\":null,\"structureId\":null,\"level\":null,\"hasDescendants\":null,\"ancestorOf\":null,\"ancestorDist\":null,\"descendantOf\":null,\"descendantDist\":null,\"siblingOf\":null,\"prevSiblingOf\":null,\"nextSiblingOf\":null,\"positionedBefore\":null,\"positionedAfter\":null,\"select\":{\"**\":\"**\"},\"selectOption\":null,\"distinct\":null,\"from\":null,\"groupBy\":null,\"join\":null,\"having\":null,\"union\":null,\"params\":[],\"queryCacheDuration\":null,\"queryCacheDependency\":null,\"where\":null,\"limit\":null,\"offset\":null,\"indexBy\":null,\"emulateExecution\":false,\"availableProducts\":null,\"productName\":null,\"price\":null,\"image\":null,\"available\":null,\"newsFeed\":null,\"newsTitle\":null,\"newsDescription\":null,\"newsProducts\":null}}},\"eventClass\":\"craft\\\\events\\\\ModelEvent\",\"event\":{\"isNew\":[true],\"isValid\":[true]}}', 200, '{\"Access-Control-Allow-Origin\":[\"*\"],\"Content-Type\":[\"application/json\"],\"Date\":[\"Sat, 23 Nov 2019 06:04:53 GMT\"],\"P3P\":[\"CP=\\\"IDC DSP COR ADM DEVi TAIi PSA PSD IVAi IVDi CONi HIS OUR IND CNT\\\"\"],\"Response-Id\":[\"5dd8cc05-a2dd-4310-b107-2a5962336450\"],\"Server\":[\"nginx\"],\"Vary\":[\"X-Session-Key\"],\"X-Frame-Options\":[\"SAMEORIGIN\"],\"X-Rate-Limit-Limit\":[\"10000\"],\"X-Rate-Limit-Remaining\":[\"9980\"],\"X-Rate-Limit-Reset\":[\"1574489400\"],\"X-Session-Key\":[\"anonymous\"],\"X-Zapier-Fast-Return\":[\"true\"],\"X-Zapier-Jobs\":[\"A hacker like yourself should consider working at Zapier!\"],\"X-Zapier-Jobs-Link\":[\"https://zapier.com/jobs/\"],\"X-Zapier-Revision\":[\"a3f0f5a0e2f54d0ea7deec04bf25200b29167033\"],\"Content-Length\":[\"172\"],\"Connection\":[\"keep-alive\"]}', '{\"status\": \"success\", \"attempt\": \"5dd8cc05-a2dd-4310-b107-2a5962336450\", \"id\": \"30fdff88-c399-499d-95c5-4d871951fe06\", \"request_id\": \"5dd8cc05-a2dd-4310-b107-2a5962336450\"}', 1239, '2019-11-23 06:04:40', '2019-11-23 06:04:52', 'fad2e787-c07c-482e-921a-d6fb60d54ff2');

-- --------------------------------------------------------

--
-- Table structure for table `webhooks`
--

CREATE TABLE `webhooks` (
  `id` int(11) NOT NULL,
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
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `webhooks`
--

INSERT INTO `webhooks` (`id`, `groupId`, `name`, `class`, `event`, `filters`, `method`, `url`, `headers`, `userAttributes`, `senderAttributes`, `eventAttributes`, `payloadTemplate`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, NULL, 'Test webhook to twilio', 'craft\\elements\\Entry', 'afterSave', '{\"craft\\\\webhooks\\\\filters\\\\NewElementFilter\":true,\"craft\\\\webhooks\\\\filters\\\\DraftFilter\":true,\"craft\\\\webhooks\\\\filters\\\\RevisionFilter\":true,\"craft\\\\webhooks\\\\filters\\\\DuplicatingFilter\":true,\"craft\\\\webhooks\\\\filters\\\\PropagatingFilter\":true,\"craft\\\\webhooks\\\\filters\\\\ResavingFilter\":true}', 'post', 'https://hooks.zapier.com/hooks/catch/6128230/o4x908w/', '[{\"name\":\"\",\"value\":\"\"}]', NULL, NULL, NULL, '{\'henry\',true}', 1, '2019-11-20 10:31:14', '2019-11-23 06:21:37', 'eefe39a3-1497-460f-a57b-c7840d360ace');

-- --------------------------------------------------------

--
-- Table structure for table `widgets`
--

CREATE TABLE `widgets` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `colspan` tinyint(3) DEFAULT NULL,
  `settings` text,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `widgets`
--

INSERT INTO `widgets` (`id`, `userId`, `type`, `sortOrder`, `colspan`, `settings`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 'craft\\widgets\\RecentEntries', 2, 2, '{\"section\":\"*\",\"siteId\":\"1\",\"limit\":10}', 1, '2019-11-17 03:11:04', '2019-11-20 10:21:25', '2f09cfd1-4ce4-4e97-ba4c-534250770e1d'),
(2, 1, 'craft\\widgets\\CraftSupport', 3, 1, '[]', 1, '2019-11-17 03:11:04', '2019-11-20 10:21:31', '81c95359-a455-4294-ae15-e4ee91f120c8'),
(3, 1, 'craft\\widgets\\Updates', 4, 1, '[]', 1, '2019-11-17 03:11:04', '2019-11-20 10:21:32', 'eaccbf3d-5b39-4b30-b833-15f02f88a60e'),
(4, 1, 'craft\\widgets\\Feed', 1, 4, '{\"url\":\"https://craftcms.com/news.rss\",\"title\":\"Craft News\",\"limit\":5}', 1, '2019-11-17 03:11:04', '2019-11-20 10:21:23', '19caa5fe-844b-4baa-bdb9-5fdcfa4a79dc');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assetindexdata`
--
ALTER TABLE `assetindexdata`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assetindexdata_sessionId_volumeId_idx` (`sessionId`,`volumeId`),
  ADD KEY `assetindexdata_volumeId_idx` (`volumeId`);

--
-- Indexes for table `assets`
--
ALTER TABLE `assets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assets_folderId_idx` (`folderId`),
  ADD KEY `assets_volumeId_idx` (`volumeId`),
  ADD KEY `assets_volumeId_keptFile_idx` (`volumeId`,`keptFile`);

--
-- Indexes for table `assettransformindex`
--
ALTER TABLE `assettransformindex`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assettransformindex_volumeId_assetId_location_idx` (`volumeId`,`assetId`,`location`);

--
-- Indexes for table `assettransforms`
--
ALTER TABLE `assettransforms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `assettransforms_name_unq_idx` (`name`),
  ADD UNIQUE KEY `assettransforms_handle_unq_idx` (`handle`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_groupId_idx` (`groupId`),
  ADD KEY `categories_parentId_fk` (`parentId`);

--
-- Indexes for table `categorygroups`
--
ALTER TABLE `categorygroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categorygroups_structureId_idx` (`structureId`),
  ADD KEY `categorygroups_fieldLayoutId_idx` (`fieldLayoutId`),
  ADD KEY `categorygroups_dateDeleted_idx` (`dateDeleted`),
  ADD KEY `categorygroups_name_idx` (`name`),
  ADD KEY `categorygroups_handle_idx` (`handle`);

--
-- Indexes for table `categorygroups_sites`
--
ALTER TABLE `categorygroups_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categorygroups_sites_groupId_siteId_unq_idx` (`groupId`,`siteId`),
  ADD KEY `categorygroups_sites_siteId_idx` (`siteId`);

--
-- Indexes for table `content`
--
ALTER TABLE `content`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `content_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  ADD KEY `content_siteId_idx` (`siteId`),
  ADD KEY `content_title_idx` (`title`);

--
-- Indexes for table `craftidtokens`
--
ALTER TABLE `craftidtokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craftidtokens_userId_fk` (`userId`);

--
-- Indexes for table `deprecationerrors`
--
ALTER TABLE `deprecationerrors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `deprecationerrors_key_fingerprint_unq_idx` (`key`,`fingerprint`);

--
-- Indexes for table `drafts`
--
ALTER TABLE `drafts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `drafts_sourceId_fk` (`sourceId`),
  ADD KEY `drafts_creatorId_fk` (`creatorId`);

--
-- Indexes for table `elementindexsettings`
--
ALTER TABLE `elementindexsettings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `elementindexsettings_type_unq_idx` (`type`);

--
-- Indexes for table `elements`
--
ALTER TABLE `elements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `elements_fieldLayoutId_idx` (`fieldLayoutId`),
  ADD KEY `elements_type_idx` (`type`),
  ADD KEY `elements_enabled_idx` (`enabled`),
  ADD KEY `elements_archived_dateCreated_idx` (`archived`,`dateCreated`),
  ADD KEY `elements_dateDeleted_idx` (`dateDeleted`),
  ADD KEY `elements_draftId_fk` (`draftId`),
  ADD KEY `elements_revisionId_fk` (`revisionId`);

--
-- Indexes for table `elements_sites`
--
ALTER TABLE `elements_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `elements_sites_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  ADD KEY `elements_sites_siteId_idx` (`siteId`),
  ADD KEY `elements_sites_slug_siteId_idx` (`slug`,`siteId`),
  ADD KEY `elements_sites_enabled_idx` (`enabled`),
  ADD KEY `elements_sites_uri_siteId_idx` (`uri`,`siteId`);

--
-- Indexes for table `entries`
--
ALTER TABLE `entries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entries_postDate_idx` (`postDate`),
  ADD KEY `entries_expiryDate_idx` (`expiryDate`),
  ADD KEY `entries_authorId_idx` (`authorId`),
  ADD KEY `entries_sectionId_idx` (`sectionId`),
  ADD KEY `entries_typeId_idx` (`typeId`),
  ADD KEY `entries_parentId_fk` (`parentId`);

--
-- Indexes for table `entrydrafterrors`
--
ALTER TABLE `entrydrafterrors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entrydrafterrors_draftId_fk` (`draftId`);

--
-- Indexes for table `entrydrafts`
--
ALTER TABLE `entrydrafts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entrydrafts_sectionId_idx` (`sectionId`),
  ADD KEY `entrydrafts_entryId_siteId_idx` (`entryId`,`siteId`),
  ADD KEY `entrydrafts_siteId_idx` (`siteId`),
  ADD KEY `entrydrafts_creatorId_idx` (`creatorId`);

--
-- Indexes for table `entrytypes`
--
ALTER TABLE `entrytypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entrytypes_sectionId_idx` (`sectionId`),
  ADD KEY `entrytypes_fieldLayoutId_idx` (`fieldLayoutId`),
  ADD KEY `entrytypes_dateDeleted_idx` (`dateDeleted`),
  ADD KEY `entrytypes_name_sectionId_idx` (`name`,`sectionId`),
  ADD KEY `entrytypes_handle_sectionId_idx` (`handle`,`sectionId`);

--
-- Indexes for table `entryversionerrors`
--
ALTER TABLE `entryversionerrors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entryversionerrors_versionId_fk` (`versionId`);

--
-- Indexes for table `entryversions`
--
ALTER TABLE `entryversions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entryversions_sectionId_idx` (`sectionId`),
  ADD KEY `entryversions_entryId_siteId_idx` (`entryId`,`siteId`),
  ADD KEY `entryversions_siteId_idx` (`siteId`),
  ADD KEY `entryversions_creatorId_idx` (`creatorId`);

--
-- Indexes for table `fieldgroups`
--
ALTER TABLE `fieldgroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fieldgroups_name_unq_idx` (`name`);

--
-- Indexes for table `fieldlayoutfields`
--
ALTER TABLE `fieldlayoutfields`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fieldlayoutfields_layoutId_fieldId_unq_idx` (`layoutId`,`fieldId`),
  ADD KEY `fieldlayoutfields_sortOrder_idx` (`sortOrder`),
  ADD KEY `fieldlayoutfields_tabId_idx` (`tabId`),
  ADD KEY `fieldlayoutfields_fieldId_idx` (`fieldId`);

--
-- Indexes for table `fieldlayouts`
--
ALTER TABLE `fieldlayouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fieldlayouts_type_idx` (`type`),
  ADD KEY `fieldlayouts_dateDeleted_idx` (`dateDeleted`);

--
-- Indexes for table `fieldlayouttabs`
--
ALTER TABLE `fieldlayouttabs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fieldlayouttabs_sortOrder_idx` (`sortOrder`),
  ADD KEY `fieldlayouttabs_layoutId_idx` (`layoutId`);

--
-- Indexes for table `fields`
--
ALTER TABLE `fields`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fields_handle_context_unq_idx` (`handle`,`context`),
  ADD KEY `fields_groupId_idx` (`groupId`),
  ADD KEY `fields_context_idx` (`context`);

--
-- Indexes for table `globalsets`
--
ALTER TABLE `globalsets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `globalsets_fieldLayoutId_idx` (`fieldLayoutId`),
  ADD KEY `globalsets_name_idx` (`name`),
  ADD KEY `globalsets_handle_idx` (`handle`);

--
-- Indexes for table `gqlschemas`
--
ALTER TABLE `gqlschemas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `gqlschemas_accessToken_unq_idx` (`accessToken`),
  ADD UNIQUE KEY `gqlschemas_name_unq_idx` (`name`);

--
-- Indexes for table `info`
--
ALTER TABLE `info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `matrixblocks`
--
ALTER TABLE `matrixblocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `matrixblocks_ownerId_idx` (`ownerId`),
  ADD KEY `matrixblocks_fieldId_idx` (`fieldId`),
  ADD KEY `matrixblocks_typeId_idx` (`typeId`),
  ADD KEY `matrixblocks_sortOrder_idx` (`sortOrder`);

--
-- Indexes for table `matrixblocktypes`
--
ALTER TABLE `matrixblocktypes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `matrixblocktypes_name_fieldId_unq_idx` (`name`,`fieldId`),
  ADD UNIQUE KEY `matrixblocktypes_handle_fieldId_unq_idx` (`handle`,`fieldId`),
  ADD KEY `matrixblocktypes_fieldId_idx` (`fieldId`),
  ADD KEY `matrixblocktypes_fieldLayoutId_idx` (`fieldLayoutId`);

--
-- Indexes for table `matrixcontent_availableproducts`
--
ALTER TABLE `matrixcontent_availableproducts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `matrixcontent_availableproducts_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  ADD KEY `matrixcontent_availableproducts_siteId_fk` (`siteId`);

--
-- Indexes for table `matrixcontent_newsfeed`
--
ALTER TABLE `matrixcontent_newsfeed`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `matrixcontent_newsfeed_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  ADD KEY `matrixcontent_newsfeed_siteId_fk` (`siteId`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `migrations_pluginId_idx` (`pluginId`),
  ADD KEY `migrations_type_pluginId_idx` (`type`,`pluginId`);

--
-- Indexes for table `plugins`
--
ALTER TABLE `plugins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `plugins_handle_unq_idx` (`handle`);

--
-- Indexes for table `queue`
--
ALTER TABLE `queue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `queue_fail_timeUpdated_timePushed_idx` (`fail`,`timeUpdated`,`timePushed`),
  ADD KEY `queue_fail_timeUpdated_delay_idx` (`fail`,`timeUpdated`,`delay`);

--
-- Indexes for table `relations`
--
ALTER TABLE `relations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `relations_fieldId_sourceId_sourceSiteId_targetId_unq_idx` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  ADD KEY `relations_sourceId_idx` (`sourceId`),
  ADD KEY `relations_targetId_idx` (`targetId`),
  ADD KEY `relations_sourceSiteId_idx` (`sourceSiteId`);

--
-- Indexes for table `resourcepaths`
--
ALTER TABLE `resourcepaths`
  ADD PRIMARY KEY (`hash`);

--
-- Indexes for table `revisions`
--
ALTER TABLE `revisions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `revisions_sourceId_num_unq_idx` (`sourceId`,`num`),
  ADD KEY `revisions_creatorId_fk` (`creatorId`);

--
-- Indexes for table `searchindex`
--
ALTER TABLE `searchindex`
  ADD PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`);
ALTER TABLE `searchindex` ADD FULLTEXT KEY `searchindex_keywords_idx` (`keywords`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sections_structureId_idx` (`structureId`),
  ADD KEY `sections_dateDeleted_idx` (`dateDeleted`),
  ADD KEY `sections_name_idx` (`name`),
  ADD KEY `sections_handle_idx` (`handle`);

--
-- Indexes for table `sections_sites`
--
ALTER TABLE `sections_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sections_sites_sectionId_siteId_unq_idx` (`sectionId`,`siteId`),
  ADD KEY `sections_sites_siteId_idx` (`siteId`);

--
-- Indexes for table `sequences`
--
ALTER TABLE `sequences`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_uid_idx` (`uid`),
  ADD KEY `sessions_token_idx` (`token`),
  ADD KEY `sessions_dateUpdated_idx` (`dateUpdated`),
  ADD KEY `sessions_userId_idx` (`userId`);

--
-- Indexes for table `shunnedmessages`
--
ALTER TABLE `shunnedmessages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `shunnedmessages_userId_message_unq_idx` (`userId`,`message`);

--
-- Indexes for table `sitegroups`
--
ALTER TABLE `sitegroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sitegroups_dateDeleted_idx` (`dateDeleted`),
  ADD KEY `sitegroups_name_idx` (`name`);

--
-- Indexes for table `sites`
--
ALTER TABLE `sites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sites_sortOrder_idx` (`sortOrder`),
  ADD KEY `sites_groupId_fk` (`groupId`),
  ADD KEY `sites_dateDeleted_idx` (`dateDeleted`),
  ADD KEY `sites_handle_idx` (`handle`);

--
-- Indexes for table `structureelements`
--
ALTER TABLE `structureelements`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `structureelements_structureId_elementId_unq_idx` (`structureId`,`elementId`),
  ADD KEY `structureelements_root_idx` (`root`),
  ADD KEY `structureelements_lft_idx` (`lft`),
  ADD KEY `structureelements_rgt_idx` (`rgt`),
  ADD KEY `structureelements_level_idx` (`level`),
  ADD KEY `structureelements_elementId_idx` (`elementId`);

--
-- Indexes for table `structures`
--
ALTER TABLE `structures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `structures_dateDeleted_idx` (`dateDeleted`);

--
-- Indexes for table `systemmessages`
--
ALTER TABLE `systemmessages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `systemmessages_key_language_unq_idx` (`key`,`language`),
  ADD KEY `systemmessages_language_idx` (`language`);

--
-- Indexes for table `taggroups`
--
ALTER TABLE `taggroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `taggroups_fieldLayoutId_fk` (`fieldLayoutId`),
  ADD KEY `taggroups_dateDeleted_idx` (`dateDeleted`),
  ADD KEY `taggroups_name_idx` (`name`),
  ADD KEY `taggroups_handle_idx` (`handle`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tags_groupId_idx` (`groupId`);

--
-- Indexes for table `templatecacheelements`
--
ALTER TABLE `templatecacheelements`
  ADD KEY `templatecacheelements_cacheId_idx` (`cacheId`),
  ADD KEY `templatecacheelements_elementId_idx` (`elementId`);

--
-- Indexes for table `templatecachequeries`
--
ALTER TABLE `templatecachequeries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `templatecachequeries_cacheId_idx` (`cacheId`),
  ADD KEY `templatecachequeries_type_idx` (`type`);

--
-- Indexes for table `templatecaches`
--
ALTER TABLE `templatecaches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `templatecaches_cacheKey_siteId_expiryDate_path_idx` (`cacheKey`,`siteId`,`expiryDate`,`path`),
  ADD KEY `templatecaches_cacheKey_siteId_expiryDate_idx` (`cacheKey`,`siteId`,`expiryDate`),
  ADD KEY `templatecaches_siteId_idx` (`siteId`);

--
-- Indexes for table `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tokens_token_unq_idx` (`token`),
  ADD KEY `tokens_expiryDate_idx` (`expiryDate`);

--
-- Indexes for table `usergroups`
--
ALTER TABLE `usergroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usergroups_handle_unq_idx` (`handle`),
  ADD UNIQUE KEY `usergroups_name_unq_idx` (`name`);

--
-- Indexes for table `usergroups_users`
--
ALTER TABLE `usergroups_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usergroups_users_groupId_userId_unq_idx` (`groupId`,`userId`),
  ADD KEY `usergroups_users_userId_idx` (`userId`);

--
-- Indexes for table `userpermissions`
--
ALTER TABLE `userpermissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `userpermissions_name_unq_idx` (`name`);

--
-- Indexes for table `userpermissions_usergroups`
--
ALTER TABLE `userpermissions_usergroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `userpermissions_usergroups_permissionId_groupId_unq_idx` (`permissionId`,`groupId`),
  ADD KEY `userpermissions_usergroups_groupId_idx` (`groupId`);

--
-- Indexes for table `userpermissions_users`
--
ALTER TABLE `userpermissions_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `userpermissions_users_permissionId_userId_unq_idx` (`permissionId`,`userId`),
  ADD KEY `userpermissions_users_userId_idx` (`userId`);

--
-- Indexes for table `userpreferences`
--
ALTER TABLE `userpreferences`
  ADD PRIMARY KEY (`userId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_uid_idx` (`uid`),
  ADD KEY `users_verificationCode_idx` (`verificationCode`),
  ADD KEY `users_email_idx` (`email`),
  ADD KEY `users_username_idx` (`username`),
  ADD KEY `users_photoId_fk` (`photoId`);

--
-- Indexes for table `volumefolders`
--
ALTER TABLE `volumefolders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `volumefolders_name_parentId_volumeId_unq_idx` (`name`,`parentId`,`volumeId`),
  ADD KEY `volumefolders_parentId_idx` (`parentId`),
  ADD KEY `volumefolders_volumeId_idx` (`volumeId`);

--
-- Indexes for table `volumes`
--
ALTER TABLE `volumes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `volumes_fieldLayoutId_idx` (`fieldLayoutId`),
  ADD KEY `volumes_dateDeleted_idx` (`dateDeleted`),
  ADD KEY `volumes_name_idx` (`name`),
  ADD KEY `volumes_handle_idx` (`handle`);

--
-- Indexes for table `webhookgroups`
--
ALTER TABLE `webhookgroups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `webhookrequests`
--
ALTER TABLE `webhookrequests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `webhookrequests_webhookId_fk` (`webhookId`);

--
-- Indexes for table `webhooks`
--
ALTER TABLE `webhooks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `webhooks_name_unq_idx` (`name`),
  ADD KEY `webhooks_enabled_idx` (`enabled`),
  ADD KEY `webhooks_groupId_name_idx` (`groupId`,`name`);

--
-- Indexes for table `widgets`
--
ALTER TABLE `widgets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `widgets_userId_idx` (`userId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assetindexdata`
--
ALTER TABLE `assetindexdata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assettransformindex`
--
ALTER TABLE `assettransformindex`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assettransforms`
--
ALTER TABLE `assettransforms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categorygroups`
--
ALTER TABLE `categorygroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categorygroups_sites`
--
ALTER TABLE `categorygroups_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `content`
--
ALTER TABLE `content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=156;

--
-- AUTO_INCREMENT for table `craftidtokens`
--
ALTER TABLE `craftidtokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deprecationerrors`
--
ALTER TABLE `deprecationerrors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=180;

--
-- AUTO_INCREMENT for table `drafts`
--
ALTER TABLE `drafts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `elementindexsettings`
--
ALTER TABLE `elementindexsettings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `elements`
--
ALTER TABLE `elements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=433;

--
-- AUTO_INCREMENT for table `elements_sites`
--
ALTER TABLE `elements_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=433;

--
-- AUTO_INCREMENT for table `entrydrafterrors`
--
ALTER TABLE `entrydrafterrors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `entrydrafts`
--
ALTER TABLE `entrydrafts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `entrytypes`
--
ALTER TABLE `entrytypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `entryversionerrors`
--
ALTER TABLE `entryversionerrors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `entryversions`
--
ALTER TABLE `entryversions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fieldgroups`
--
ALTER TABLE `fieldgroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `fieldlayoutfields`
--
ALTER TABLE `fieldlayoutfields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `fieldlayouts`
--
ALTER TABLE `fieldlayouts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `fieldlayouttabs`
--
ALTER TABLE `fieldlayouttabs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `fields`
--
ALTER TABLE `fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `globalsets`
--
ALTER TABLE `globalsets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gqlschemas`
--
ALTER TABLE `gqlschemas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `info`
--
ALTER TABLE `info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `matrixblocktypes`
--
ALTER TABLE `matrixblocktypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `matrixcontent_availableproducts`
--
ALTER TABLE `matrixcontent_availableproducts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `matrixcontent_newsfeed`
--
ALTER TABLE `matrixcontent_newsfeed`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=219;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=164;

--
-- AUTO_INCREMENT for table `plugins`
--
ALTER TABLE `plugins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `queue`
--
ALTER TABLE `queue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `relations`
--
ALTER TABLE `relations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `revisions`
--
ALTER TABLE `revisions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sections_sites`
--
ALTER TABLE `sections_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `shunnedmessages`
--
ALTER TABLE `shunnedmessages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sitegroups`
--
ALTER TABLE `sitegroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sites`
--
ALTER TABLE `sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `structureelements`
--
ALTER TABLE `structureelements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `structures`
--
ALTER TABLE `structures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `systemmessages`
--
ALTER TABLE `systemmessages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `taggroups`
--
ALTER TABLE `taggroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `templatecachequeries`
--
ALTER TABLE `templatecachequeries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `templatecaches`
--
ALTER TABLE `templatecaches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `usergroups`
--
ALTER TABLE `usergroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `usergroups_users`
--
ALTER TABLE `usergroups_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userpermissions`
--
ALTER TABLE `userpermissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userpermissions_usergroups`
--
ALTER TABLE `userpermissions_usergroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userpermissions_users`
--
ALTER TABLE `userpermissions_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userpreferences`
--
ALTER TABLE `userpreferences`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=433;

--
-- AUTO_INCREMENT for table `volumefolders`
--
ALTER TABLE `volumefolders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `volumes`
--
ALTER TABLE `volumes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `webhookgroups`
--
ALTER TABLE `webhookgroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `webhookrequests`
--
ALTER TABLE `webhookrequests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `webhooks`
--
ALTER TABLE `webhooks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `widgets`
--
ALTER TABLE `widgets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assetindexdata`
--
ALTER TABLE `assetindexdata`
  ADD CONSTRAINT `assetindexdata_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `assets`
--
ALTER TABLE `assets`
  ADD CONSTRAINT `assets_folderId_fk` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `assets_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `assets_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `categories_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `categories_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `categorygroups`
--
ALTER TABLE `categorygroups`
  ADD CONSTRAINT `categorygroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `categorygroups_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categorygroups_sites`
--
ALTER TABLE `categorygroups_sites`
  ADD CONSTRAINT `categorygroups_sites_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `categorygroups_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `content`
--
ALTER TABLE `content`
  ADD CONSTRAINT `content_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `content_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `craftidtokens`
--
ALTER TABLE `craftidtokens`
  ADD CONSTRAINT `craftidtokens_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `drafts`
--
ALTER TABLE `drafts`
  ADD CONSTRAINT `drafts_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `drafts_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `elements`
--
ALTER TABLE `elements`
  ADD CONSTRAINT `elements_draftId_fk` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `elements_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `elements_revisionId_fk` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `elements_sites`
--
ALTER TABLE `elements_sites`
  ADD CONSTRAINT `elements_sites_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `elements_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `entries`
--
ALTER TABLE `entries`
  ADD CONSTRAINT `entries_authorId_fk` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `entries_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `entries_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `entries_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `entries_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `entrydrafterrors`
--
ALTER TABLE `entrydrafterrors`
  ADD CONSTRAINT `entrydrafterrors_draftId_fk` FOREIGN KEY (`draftId`) REFERENCES `entrydrafts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `entrydrafts`
--
ALTER TABLE `entrydrafts`
  ADD CONSTRAINT `entrydrafts_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `entrydrafts_entryId_fk` FOREIGN KEY (`entryId`) REFERENCES `entries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `entrydrafts_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `entrydrafts_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `entrytypes`
--
ALTER TABLE `entrytypes`
  ADD CONSTRAINT `entrytypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `entrytypes_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `entryversionerrors`
--
ALTER TABLE `entryversionerrors`
  ADD CONSTRAINT `entryversionerrors_versionId_fk` FOREIGN KEY (`versionId`) REFERENCES `entryversions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `entryversions`
--
ALTER TABLE `entryversions`
  ADD CONSTRAINT `entryversions_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `entryversions_entryId_fk` FOREIGN KEY (`entryId`) REFERENCES `entries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `entryversions_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `entryversions_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `fieldlayoutfields`
--
ALTER TABLE `fieldlayoutfields`
  ADD CONSTRAINT `fieldlayoutfields_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fieldlayoutfields_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fieldlayoutfields_tabId_fk` FOREIGN KEY (`tabId`) REFERENCES `fieldlayouttabs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fieldlayouttabs`
--
ALTER TABLE `fieldlayouttabs`
  ADD CONSTRAINT `fieldlayouttabs_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fields`
--
ALTER TABLE `fields`
  ADD CONSTRAINT `fields_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `fieldgroups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `globalsets`
--
ALTER TABLE `globalsets`
  ADD CONSTRAINT `globalsets_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `globalsets_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `matrixblocks`
--
ALTER TABLE `matrixblocks`
  ADD CONSTRAINT `matrixblocks_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `matrixblocks_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `matrixblocks_ownerId_fk` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `matrixblocks_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `matrixblocktypes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `matrixblocktypes`
--
ALTER TABLE `matrixblocktypes`
  ADD CONSTRAINT `matrixblocktypes_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `matrixblocktypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `matrixcontent_availableproducts`
--
ALTER TABLE `matrixcontent_availableproducts`
  ADD CONSTRAINT `matrixcontent_availableproducts_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `matrixcontent_availableproducts_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `matrixcontent_newsfeed`
--
ALTER TABLE `matrixcontent_newsfeed`
  ADD CONSTRAINT `matrixcontent_newsfeed_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `matrixcontent_newsfeed_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `migrations`
--
ALTER TABLE `migrations`
  ADD CONSTRAINT `migrations_pluginId_fk` FOREIGN KEY (`pluginId`) REFERENCES `plugins` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `relations`
--
ALTER TABLE `relations`
  ADD CONSTRAINT `relations_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `relations_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `relations_sourceSiteId_fk` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `relations_targetId_fk` FOREIGN KEY (`targetId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `revisions`
--
ALTER TABLE `revisions`
  ADD CONSTRAINT `revisions_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `revisions_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sections`
--
ALTER TABLE `sections`
  ADD CONSTRAINT `sections_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `sections_sites`
--
ALTER TABLE `sections_sites`
  ADD CONSTRAINT `sections_sites_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sections_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sessions`
--
ALTER TABLE `sessions`
  ADD CONSTRAINT `sessions_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shunnedmessages`
--
ALTER TABLE `shunnedmessages`
  ADD CONSTRAINT `shunnedmessages_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sites`
--
ALTER TABLE `sites`
  ADD CONSTRAINT `sites_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `structureelements`
--
ALTER TABLE `structureelements`
  ADD CONSTRAINT `structureelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `structureelements_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `taggroups`
--
ALTER TABLE `taggroups`
  ADD CONSTRAINT `taggroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `tags`
--
ALTER TABLE `tags`
  ADD CONSTRAINT `tags_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tags_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `templatecacheelements`
--
ALTER TABLE `templatecacheelements`
  ADD CONSTRAINT `templatecacheelements_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `templatecacheelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `templatecachequeries`
--
ALTER TABLE `templatecachequeries`
  ADD CONSTRAINT `templatecachequeries_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `templatecaches`
--
ALTER TABLE `templatecaches`
  ADD CONSTRAINT `templatecaches_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `usergroups_users`
--
ALTER TABLE `usergroups_users`
  ADD CONSTRAINT `usergroups_users_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `usergroups_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `userpermissions_usergroups`
--
ALTER TABLE `userpermissions_usergroups`
  ADD CONSTRAINT `userpermissions_usergroups_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `userpermissions_usergroups_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `userpermissions_users`
--
ALTER TABLE `userpermissions_users`
  ADD CONSTRAINT `userpermissions_users_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `userpermissions_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `userpreferences`
--
ALTER TABLE `userpreferences`
  ADD CONSTRAINT `userpreferences_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `users_photoId_fk` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `volumefolders`
--
ALTER TABLE `volumefolders`
  ADD CONSTRAINT `volumefolders_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `volumefolders_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `volumes`
--
ALTER TABLE `volumes`
  ADD CONSTRAINT `volumes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `webhookrequests`
--
ALTER TABLE `webhookrequests`
  ADD CONSTRAINT `webhookrequests_webhookId_fk` FOREIGN KEY (`webhookId`) REFERENCES `webhooks` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `webhooks`
--
ALTER TABLE `webhooks`
  ADD CONSTRAINT `webhooks_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `webhookgroups` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `widgets`
--
ALTER TABLE `widgets`
  ADD CONSTRAINT `widgets_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
