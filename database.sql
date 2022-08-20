-- MySQL dump 10.13  Distrib 8.0.22, for macos10.15 (x86_64)
--
-- Host: 127.0.0.1    Database: ultra_new_v2
-- ------------------------------------------------------
-- Server version	8.0.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `activations`
--

DROP TABLE IF EXISTS `activations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `code` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activations_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activations`
--

LOCK TABLES `activations` WRITE;
/*!40000 ALTER TABLE `activations` DISABLE KEYS */;
INSERT INTO `activations` VALUES (1,1,'jtTs0vmoj6Koa943gLYvVrqt4eY6UK9L',1,'2022-03-20 04:34:02','2022-03-20 04:34:02','2022-03-20 04:34:02');
/*!40000 ALTER TABLE `activations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ads`
--

DROP TABLE IF EXISTS `ads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ads` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expired_at` datetime DEFAULT NULL,
  `location` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clicked` bigint NOT NULL DEFAULT '0',
  `order` int DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ads_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ads`
--

LOCK TABLES `ads` WRITE;
/*!40000 ALTER TABLE `ads` DISABLE KEYS */;
INSERT INTO `ads` VALUES (1,'Header ads','2023-03-20 00:00:00','header-ads','6OJYDYPKA6','banners/image-3.jpg','https://thesky9.com/',0,1,'published','2022-03-20 04:34:03','2022-03-20 04:34:03'),(2,'Panel ads','2023-03-20 00:00:00','panel-ads','SUGAUA3J7E','banners/image-3.jpg','https://thesky9.com/',0,1,'published','2022-03-20 04:34:03','2022-03-20 04:34:03'),(3,'Top sidebar ads','2023-03-20 00:00:00','top-sidebar-ads','UCTYN0YSC8','banners/image-1.jpg','https://thesky9.com/',0,2,'published','2022-03-20 04:34:03','2022-03-20 04:34:03'),(4,'Bottom sidebar ads','2023-03-20 00:00:00','bottom-sidebar-ads','MFTTC2SQW7','banners/image-2.jpg','https://thesky9.com/',0,3,'published','2022-03-20 04:34:03','2022-03-20 04:34:03'),(5,'Custom ads 1','2023-03-20 00:00:00','custom-1','AUIEY2XDXK','banners/image-4.jpg','https://thesky9.com/',0,4,'published','2022-03-20 04:34:03','2022-03-20 04:34:03');
/*!40000 ALTER TABLE `ads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ads_translations`
--

DROP TABLE IF EXISTS `ads_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ads_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ads_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ads_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ads_translations`
--

LOCK TABLES `ads_translations` WRITE;
/*!40000 ALTER TABLE `ads_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ads_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_histories`
--

DROP TABLE IF EXISTS `audit_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_histories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `module` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `request` text COLLATE utf8mb4_unicode_ci,
  `action` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `ip_address` varchar(39) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_user` int unsigned NOT NULL,
  `reference_id` int unsigned NOT NULL,
  `reference_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `audit_histories_user_id_index` (`user_id`),
  KEY `audit_histories_module_index` (`module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_histories`
--

LOCK TABLES `audit_histories` WRITE;
/*!40000 ALTER TABLE `audit_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `audit_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bb_comment_likes`
--

DROP TABLE IF EXISTS `bb_comment_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bb_comment_likes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` int unsigned NOT NULL,
  `user_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bb_comment_likes_comment_id_index` (`comment_id`),
  KEY `bb_comment_likes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bb_comment_likes`
--

LOCK TABLES `bb_comment_likes` WRITE;
/*!40000 ALTER TABLE `bb_comment_likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `bb_comment_likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bb_comment_recommends`
--

DROP TABLE IF EXISTS `bb_comment_recommends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bb_comment_recommends` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `reference_id` int unsigned NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bb_comment_recommends_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bb_comment_recommends`
--

LOCK TABLES `bb_comment_recommends` WRITE;
/*!40000 ALTER TABLE `bb_comment_recommends` DISABLE KEYS */;
/*!40000 ALTER TABLE `bb_comment_recommends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bb_comment_users`
--

DROP TABLE IF EXISTS `bb_comment_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bb_comment_users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `avatar_id` int unsigned DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bb_comment_users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bb_comment_users`
--

LOCK TABLES `bb_comment_users` WRITE;
/*!40000 ALTER TABLE `bb_comment_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `bb_comment_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bb_comments`
--

DROP TABLE IF EXISTS `bb_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bb_comments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `comment` longtext COLLATE utf8mb4_unicode_ci,
  `reference_id` int unsigned NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(39) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `like_count` int NOT NULL DEFAULT '0',
  `reply_count` int NOT NULL DEFAULT '0',
  `parent_id` int unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bb_comments`
--

LOCK TABLES `bb_comments` WRITE;
/*!40000 ALTER TABLE `bb_comments` DISABLE KEYS */;
INSERT INTO `bb_comments` VALUES (1,'Hatter was the first witness,\' said the Duchess: \'and the moral of that is--\"Oh, \'tis love, \'tis.',1,'Botble\\Blog\\Models\\Post','40.9.74.59',9,'published',0,0,0,'2022-03-15 21:54:37','2022-03-20 04:34:14'),(2,'Mouse, who was passing at the picture.) \'Up, lazy thing!\' said the Gryphon. \'Do you know what to.',1,'Botble\\Blog\\Models\\Post','199.179.72.17',2,'published',0,1,0,'2022-03-08 02:39:11','2022-03-20 04:34:14'),(3,'Gryphon. \'The reason is,\' said the Queen was in the direction in which you usually see.',1,'Botble\\Blog\\Models\\Post','28.159.143.169',10,'published',0,0,0,'2022-03-05 17:36:27','2022-03-20 04:34:14'),(4,'Alice: \'--where\'s the Duchess?\' \'Hush! Hush!\' said the Mock Turtle: \'crumbs would all wash off in.',1,'Botble\\Blog\\Models\\Post','66.206.238.32',10,'published',0,1,0,'2022-03-16 12:51:23','2022-03-20 04:34:14'),(5,'But do cats eat bats? Do cats eat bats? Do cats eat bats? Do cats eat bats?\' and sometimes, \'Do.',1,'Botble\\Blog\\Models\\Post','185.107.183.225',8,'published',0,0,0,'2022-03-11 10:32:53','2022-03-20 04:34:14'),(6,'Gryphon went on, without attending to her, And mentioned me to him: She gave me a good opportunity.',1,'Botble\\Blog\\Models\\Post','216.144.152.67',8,'published',0,0,0,'2022-03-10 05:52:59','2022-03-20 04:34:14'),(7,'Queen\'s ears--\' the Rabbit whispered in reply, \'for fear they should forget them before the.',1,'Botble\\Blog\\Models\\Post','28.252.193.197',8,'published',0,0,2,'2022-03-15 13:41:57','2022-03-20 04:34:14'),(8,'Alice\'s elbow was pressed hard against it, that attempt proved a failure. Alice heard the King.',1,'Botble\\Blog\\Models\\Post','1.82.9.92',1,'published',0,0,4,'2022-03-13 20:24:17','2022-03-20 04:34:14'),(9,'Queen\'s absence, and were resting in the air: it puzzled her very much confused, \'I don\'t think--\'.',2,'Botble\\Blog\\Models\\Post','46.244.162.132',8,'published',0,0,0,'2022-03-10 16:46:09','2022-03-20 04:34:14'),(10,'Adventures of hers that you think you might knock, and I had not a moment to be Involved in this.',2,'Botble\\Blog\\Models\\Post','41.147.90.248',8,'published',0,1,0,'2022-03-06 15:56:04','2022-03-20 04:34:14'),(11,'Hatter, \'I cut some more tea,\' the March Hare. Visit either you like: they\'re both mad.\' \'But I.',2,'Botble\\Blog\\Models\\Post','175.135.133.74',3,'published',0,0,0,'2022-02-23 01:24:18','2022-03-20 04:34:14'),(12,'Oh dear! I\'d nearly forgotten to ask.\' \'It turned into a large cauldron which seemed to be a.',2,'Botble\\Blog\\Models\\Post','65.193.240.40',4,'published',0,0,0,'2022-02-28 17:47:42','2022-03-20 04:34:14'),(13,'Queen was to get out again. Suddenly she came up to her that she was now only ten inches high, and.',2,'Botble\\Blog\\Models\\Post','247.147.151.55',9,'published',0,1,0,'2022-03-15 14:20:37','2022-03-20 04:34:14'),(14,'First, she dreamed of little Alice herself, and shouted out, \'You\'d better not talk!\' said Five.',2,'Botble\\Blog\\Models\\Post','146.45.113.110',10,'published',0,0,0,'2022-02-26 02:19:12','2022-03-20 04:34:14'),(15,'You gave us three or more; They all sat down a large kitchen, which was sitting on a bough of a.',2,'Botble\\Blog\\Models\\Post','77.108.199.237',1,'published',0,0,10,'2022-03-06 21:15:46','2022-03-20 04:34:14'),(16,'You see, she came upon a Gryphon, lying fast asleep in the wind, and the Panther received knife.',2,'Botble\\Blog\\Models\\Post','186.81.215.169',9,'published',0,0,13,'2022-03-11 12:31:24','2022-03-20 04:34:14'),(17,'The three soldiers wandered about in a trembling voice:-- \'I passed by his garden, and marked.',3,'Botble\\Blog\\Models\\Post','247.107.97.121',6,'published',0,1,0,'2022-02-23 00:53:45','2022-03-20 04:34:14'),(18,'King, the Queen, pointing to Alice again. \'No, I didn\'t,\' said Alice: \'she\'s so extremely--\' Just.',3,'Botble\\Blog\\Models\\Post','80.197.235.222',8,'published',0,0,0,'2022-03-11 22:06:15','2022-03-20 04:34:14'),(19,'Morcar, the earls of Mercia and Northumbria--\"\' \'Ugh!\' said the Mouse, sharply and very neatly and.',3,'Botble\\Blog\\Models\\Post','198.17.187.135',7,'published',0,0,0,'2022-03-04 12:04:22','2022-03-20 04:34:14'),(20,'I goes like a mouse, That he met in the other. In the very tones of her little sister\'s dream. The.',3,'Botble\\Blog\\Models\\Post','199.97.235.33',2,'published',0,1,0,'2022-03-01 09:28:08','2022-03-20 04:34:14'),(21,'The pepper when he finds out who I WAS when I get it home?\' when it grunted again, and did not.',3,'Botble\\Blog\\Models\\Post','41.250.96.178',9,'published',0,0,0,'2022-02-24 02:17:33','2022-03-20 04:34:14'),(22,'Alice called after her. \'I\'ve something important to say!\' This sounded promising, certainly.',3,'Botble\\Blog\\Models\\Post','22.98.221.3',7,'published',0,0,0,'2022-02-26 09:23:27','2022-03-20 04:34:14'),(23,'Dodo said, \'EVERYBODY has won, and all the jurymen are back in a helpless sort of mixed flavour of.',3,'Botble\\Blog\\Models\\Post','80.206.202.185',1,'published',0,0,17,'2022-03-12 21:13:13','2022-03-20 04:34:14'),(24,'Alice: \'I don\'t believe you do either!\' And the moral of that is--\"Birds of a water-well,\' said.',3,'Botble\\Blog\\Models\\Post','88.182.84.182',10,'published',0,0,20,'2022-03-10 02:30:07','2022-03-20 04:34:14'),(25,'I could let you out, you know.\' It was, no doubt: only Alice did not venture to say \'I once.',21,'Botble\\Blog\\Models\\Post','232.211.195.75',7,'published',0,0,0,'2022-03-15 12:55:43','2022-03-20 04:34:14'),(26,'The only things in the wind, and the pool was getting quite crowded with the bread-and-butter.',21,'Botble\\Blog\\Models\\Post','141.113.99.215',5,'published',0,1,0,'2022-03-04 15:04:20','2022-03-20 04:34:14'),(27,'Alice began in a VERY good opportunity for repeating his remark, with variations. \'I shall sit.',21,'Botble\\Blog\\Models\\Post','24.213.167.146',6,'published',0,0,0,'2022-03-11 21:36:02','2022-03-20 04:34:14'),(28,'Mock Turtle went on again:-- \'You may not have lived much under the sea--\' (\'I haven\'t,\' said.',21,'Botble\\Blog\\Models\\Post','10.73.126.87',3,'published',0,1,0,'2022-03-19 20:08:56','2022-03-20 04:34:14'),(29,'I shan\'t! YOU do it!--That I won\'t, then!--Bill\'s to go and take it away!\' There was a.',21,'Botble\\Blog\\Models\\Post','243.159.46.174',3,'published',0,0,0,'2022-03-04 15:48:19','2022-03-20 04:34:14'),(30,'I\'m sure I have ordered\'; and she looked up, and there was hardly room for this, and Alice heard.',21,'Botble\\Blog\\Models\\Post','168.169.120.71',7,'published',0,0,0,'2022-03-13 17:09:13','2022-03-20 04:34:14'),(31,'Rabbit asked. \'No, I didn\'t,\' said Alice: \'she\'s so extremely--\' Just then she heard something.',21,'Botble\\Blog\\Models\\Post','32.76.44.41',5,'published',0,0,28,'2022-03-15 22:16:56','2022-03-20 04:34:14'),(32,'Alice whispered, \'that it\'s done by everybody minding their own business,\' the Duchess was sitting.',21,'Botble\\Blog\\Models\\Post','164.58.101.52',9,'published',0,0,26,'2022-03-10 15:59:44','2022-03-20 04:34:14'),(33,'Alice. \'Off with his tea spoon at the stick, and made another snatch in the sun. (IF you don\'t.',22,'Botble\\Blog\\Models\\Post','64.181.182.128',5,'published',0,0,0,'2022-03-11 21:54:12','2022-03-20 04:34:14'),(34,'Alice: he had never had to kneel down on their throne when they had been to her, one on each side.',22,'Botble\\Blog\\Models\\Post','235.201.230.78',1,'published',0,0,0,'2022-02-26 21:27:06','2022-03-20 04:34:14'),(35,'Why, there\'s hardly room for YOU, and no one could possibly hear you.\' And certainly there was the.',22,'Botble\\Blog\\Models\\Post','71.87.213.157',8,'published',0,2,0,'2022-03-15 22:12:55','2022-03-20 04:34:14'),(36,'Dormouse turned out, and, by the hand, it hurried off, without waiting for turns, quarrelling all.',22,'Botble\\Blog\\Models\\Post','83.98.170.84',3,'published',0,0,0,'2022-03-17 18:32:52','2022-03-20 04:34:14'),(37,'I shall have somebody to talk about cats or dogs either, if you were all talking at once, she.',22,'Botble\\Blog\\Models\\Post','227.245.251.29',9,'published',0,0,0,'2022-03-10 20:53:46','2022-03-20 04:34:14'),(38,'Time as well go in at the Duchess and the words came very queer to ME.\' \'You!\' said the Cat; and.',22,'Botble\\Blog\\Models\\Post','188.56.205.134',5,'published',0,0,0,'2022-03-10 08:22:43','2022-03-20 04:34:14'),(39,'Presently the Rabbit coming to look at me like that!\' But she did so, very carefully, nibbling.',22,'Botble\\Blog\\Models\\Post','54.101.23.239',8,'published',0,0,35,'2022-03-08 13:35:19','2022-03-20 04:34:14'),(40,'King, with an M--\' \'Why with an M--\' \'Why with an M, such as mouse-traps, and the constant heavy.',22,'Botble\\Blog\\Models\\Post','52.228.30.36',8,'published',0,0,35,'2022-03-09 18:33:44','2022-03-20 04:34:14'),(41,'How puzzling all these changes are! I\'m never sure what I\'m going to shrink any further: she felt.',23,'Botble\\Blog\\Models\\Post','150.195.226.14',5,'published',0,1,0,'2022-03-11 06:09:54','2022-03-20 04:34:14'),(42,'I wonder what CAN have happened to you? Tell us all about it!\' and he checked himself suddenly.',23,'Botble\\Blog\\Models\\Post','170.70.26.5',8,'published',0,0,0,'2022-02-23 14:50:03','2022-03-20 04:34:14'),(43,'Duchess! The Duchess! Oh my fur and whiskers! She\'ll get me executed, as sure as ferrets are.',23,'Botble\\Blog\\Models\\Post','49.251.188.144',3,'published',0,0,0,'2022-02-22 16:33:30','2022-03-20 04:34:14'),(44,'Alice guessed in a hurried nervous manner, smiling at everything that was said, and went on.',23,'Botble\\Blog\\Models\\Post','26.139.220.50',10,'published',0,0,0,'2022-03-11 15:39:19','2022-03-20 04:34:14'),(45,'March Hare, \'that \"I breathe when I learn music.\' \'Ah! that accounts for it,\' said Alice. \'Why.',23,'Botble\\Blog\\Models\\Post','98.186.145.187',3,'published',0,1,0,'2022-02-25 13:30:42','2022-03-20 04:34:14'),(46,'King, and the others all joined in chorus, \'Yes, please do!\' but the Rabbit began. Alice thought.',23,'Botble\\Blog\\Models\\Post','223.180.169.233',4,'published',0,0,0,'2022-03-13 12:03:01','2022-03-20 04:34:14'),(47,'And she began thinking over other children she knew, who might do something better with the.',23,'Botble\\Blog\\Models\\Post','64.84.21.89',7,'published',0,0,41,'2022-03-12 00:34:10','2022-03-20 04:34:14'),(48,'Dormouse began in a great crowd assembled about them--all sorts of things--I can\'t remember things.',23,'Botble\\Blog\\Models\\Post','39.132.168.136',6,'published',0,0,45,'2022-03-08 15:47:14','2022-03-20 04:34:14');
/*!40000 ALTER TABLE `bb_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int unsigned NOT NULL DEFAULT '0',
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `author_id` int NOT NULL,
  `author_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `icon` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_featured` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Design',0,NULL,'published',1,'Botble\\ACL\\Models\\User',NULL,0,0,0,'2022-03-20 04:34:10','2022-03-20 04:34:10'),(2,'Lifestyle',0,NULL,'published',1,'Botble\\ACL\\Models\\User',NULL,0,0,0,'2022-03-20 04:34:10','2022-03-20 04:34:10'),(3,'Travel Tips',0,NULL,'published',1,'Botble\\ACL\\Models\\User',NULL,0,0,0,'2022-03-20 04:34:10','2022-03-20 04:34:10'),(4,'Healthy',0,NULL,'published',1,'Botble\\ACL\\Models\\User',NULL,0,0,0,'2022-03-20 04:34:10','2022-03-20 04:34:10'),(5,'Fashion',0,NULL,'published',1,'Botble\\ACL\\Models\\User',NULL,0,0,0,'2022-03-20 04:34:10','2022-03-20 04:34:10'),(6,'Hotel',0,NULL,'published',1,'Botble\\ACL\\Models\\User',NULL,0,0,0,'2022-03-20 04:34:10','2022-03-20 04:34:10'),(7,'Nature',0,NULL,'published',1,'Botble\\ACL\\Models\\User',NULL,0,0,0,'2022-03-20 04:34:10','2022-03-20 04:34:10');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories_translations`
--

DROP TABLE IF EXISTS `categories_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categories_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories_translations`
--

LOCK TABLES `categories_translations` WRITE;
/*!40000 ALTER TABLE `categories_translations` DISABLE KEYS */;
INSERT INTO `categories_translations` VALUES ('vi',1,'Phong cách sống',NULL),('vi',2,'Sức khỏe',NULL),('vi',3,'Món ngon',NULL),('vi',4,'Sách',NULL),('vi',5,'Mẹo du lịch',NULL),('vi',6,'Khách sạn',NULL),('vi',7,'Thiên nhiên',NULL);
/*!40000 ALTER TABLE `categories_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_replies`
--

DROP TABLE IF EXISTS `contact_replies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_replies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_replies`
--

LOCK TABLES `contact_replies` WRITE;
/*!40000 ALTER TABLE `contact_replies` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_replies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unread',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
INSERT INTO `contacts` VALUES (1,'Pearl Medhurst','santa.miller@example.com','+12123992742','9435 Schneider Drive Suite 729\nGulgowskiborough, KS 24926-7836','Eum omnis quo impedit.','Est officia rerum est est tempora sit nisi. Est harum deleniti qui voluptatem. Perferendis a ut molestiae et quae. Est amet corporis est officiis dolorum repudiandae. Ab incidunt cupiditate autem velit. Cupiditate corporis rerum iusto voluptatem maxime dolores harum. Numquam optio fugiat nulla perspiciatis ratione repellat porro. Perferendis fugit sunt ducimus ipsam. Magnam quia eum non voluptas. Nihil qui consectetur id ipsa.','read','2022-03-20 04:34:04','2022-03-20 04:34:04'),(2,'Kailee Kassulke IV','dmuller@example.org','848-448-7260','140 Queen Village\nChristianville, NJ 62803','Reprehenderit qui repellendus id repellat.','Est numquam voluptatem accusantium qui voluptatem rerum libero. Ad rerum quis sunt amet. Nisi illo ad doloribus qui eum velit. Quia qui qui natus ipsum odit consequatur fugit. Et vero fugiat eaque autem sed consequatur. Harum accusantium velit aut necessitatibus. Debitis perspiciatis voluptatem consequatur nemo minima quia cupiditate et. Ex quod distinctio tenetur animi cumque aut eos.','unread','2022-03-20 04:34:04','2022-03-20 04:34:04'),(3,'Ryann Friesen','lowe.kaylah@example.org','+1-970-820-4605','448 Corwin Ridges Apt. 015\nPort Merlin, AK 52498-7449','Voluptatem sequi ex exercitationem.','Quia aut facilis rem est nihil ratione nobis. Impedit nulla et cumque eveniet quas animi. Tempore est dolor unde odit. Quia dolorem rerum omnis sit. Eius aut tempore nihil. Pariatur sunt harum voluptate magnam asperiores aut incidunt. Omnis in sit architecto blanditiis fugit. Veniam maiores pariatur dolores provident magnam enim magni. Incidunt veniam itaque dolores ducimus doloremque ducimus.','read','2022-03-20 04:34:04','2022-03-20 04:34:04'),(4,'Mrs. Muriel Steuber','rosamond.orn@example.net','+12168125352','9725 Maryse Village\nEmileberg, ND 32462','Voluptas reiciendis hic debitis sit rerum.','Minima aut et distinctio nisi qui dolorum et. Commodi at voluptatem repellat nihil cumque. Aliquid id possimus et enim a. Ea beatae non suscipit vel vero vel. Non vitae repudiandae quibusdam provident quod. At minus commodi ut recusandae. Quibusdam dolore error sunt harum soluta id. Et impedit fugiat rem voluptatibus vero qui aut. Consequatur ut doloribus alias quaerat molestiae est.','read','2022-03-20 04:34:04','2022-03-20 04:34:04'),(5,'Miss Hailie Funk MD','juston.quitzon@example.net','385.325.7717','7181 Amaya Field Suite 389\nEast Stephonmouth, RI 61440','Ducimus vitae suscipit in deserunt saepe.','Ut voluptas eveniet repellendus error reprehenderit. Sit veritatis iste reiciendis quos. Quisquam neque quidem mollitia. Suscipit eveniet expedita neque ut id. Earum omnis recusandae est et ut. Ipsa dolor asperiores reprehenderit sed sunt saepe voluptatem. Dignissimos temporibus tempore iusto mollitia nemo assumenda. Quisquam voluptatibus animi dolorum voluptatibus molestiae sunt dolorum.','unread','2022-03-20 04:34:04','2022-03-20 04:34:04'),(6,'Santiago Langworth','kelley.koch@example.com','(351) 324-7987','7223 Wilkinson Road\nHectorshire, NY 38494','Nulla delectus similique dignissimos.','Aut magnam voluptatem et nam at. Porro recusandae eaque necessitatibus et nesciunt voluptate. Dolorum molestiae beatae dolorem non molestias. Ut quisquam reiciendis earum consequatur reiciendis sed praesentium. Voluptate modi est molestiae officiis et repudiandae. Iste omnis debitis et saepe mollitia consequatur. Ea soluta consectetur cupiditate sunt similique.','unread','2022-03-20 04:34:04','2022-03-20 04:34:04'),(7,'Dr. Ashtyn Schuster PhD','aondricka@example.net','+1-929-466-8348','437 Johnston Lane Apt. 373\nNorth Harmon, KY 43737-3867','Explicabo possimus quia atque eos odio.','Illo vero animi inventore dolores placeat ea. Accusantium rerum eligendi saepe eaque. Quis dolore dolorem nulla maxime. Delectus fugiat id consequatur odit minus. Ea aperiam ullam assumenda nihil quaerat omnis. Voluptate blanditiis qui pariatur tenetur soluta est et. Provident ut quis iusto omnis impedit occaecati. Quo dolores ratione qui. A aliquid commodi autem odio quia qui ullam voluptatem.','unread','2022-03-20 04:34:04','2022-03-20 04:34:04'),(8,'Prof. Eulalia Howell I','connelly.arturo@example.com','+1-276-532-4479','52674 Veum Green\nEast Hudson, AK 03718-9073','Facilis consequuntur est maxime aut.','Provident voluptatum voluptatem sunt temporibus rerum provident. Odit veritatis facilis nemo. Sint mollitia cumque et provident doloribus magnam expedita ipsa. Dolor quo ipsum nihil harum alias excepturi totam soluta. Aspernatur facilis eaque perferendis explicabo suscipit facere. Blanditiis alias possimus numquam aut voluptas ipsam quo laborum. Ad quisquam eum placeat.','unread','2022-03-20 04:34:04','2022-03-20 04:34:04'),(9,'Johnny Leffler','vergie.sipes@example.net','(509) 797-5178','199 Prohaska Lodge\nPort Mackenzieport, AL 24949-2252','Est ut tempore et facilis.','Itaque eum sed aut nemo ipsum odio est commodi. Eum animi praesentium nisi aspernatur explicabo alias culpa. Magni ut molestias similique voluptatem. Dolor libero debitis expedita non. Sed sunt qui vel et aliquid beatae. Tenetur magnam architecto totam saepe reiciendis. Tempora cumque deleniti velit molestiae suscipit est. Repellat aut aut rerum nobis. Mollitia similique et hic quia. Velit laboriosam pariatur sed ducimus voluptatem et. Totam sed aut voluptate eveniet cumque.','read','2022-03-20 04:34:04','2022-03-20 04:34:04'),(10,'Ms. Ozella Marquardt MD','hudson.dane@example.com','+1 (458) 761-3448','69529 Allison Station\nKautzermouth, NE 11484-7713','Est eum officiis temporibus illum.','Sit error et magni officiis eum et officiis. Quis nesciunt in ut rerum. Perspiciatis at nihil dolor aliquam odio aliquid quo. Nihil quo non ea doloribus saepe labore laudantium. Eius aliquid quo odio ad atque. Temporibus ut dignissimos doloribus sunt quia similique ut. Et velit maxime quasi hic nobis aperiam ut. Totam nihil impedit perferendis mollitia expedita ipsum. Enim earum labore dolore quod quia et. Et fugit ad error quos et. Autem nihil perferendis in rerum cupiditate nobis.','unread','2022-03-20 04:34:04','2022-03-20 04:34:04');
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_widget_settings`
--

DROP TABLE IF EXISTS `dashboard_widget_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_widget_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `user_id` int unsigned NOT NULL,
  `widget_id` int unsigned NOT NULL,
  `order` tinyint unsigned NOT NULL DEFAULT '0',
  `status` tinyint unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dashboard_widget_settings_user_id_index` (`user_id`),
  KEY `dashboard_widget_settings_widget_id_index` (`widget_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_widget_settings`
--

LOCK TABLES `dashboard_widget_settings` WRITE;
/*!40000 ALTER TABLE `dashboard_widget_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_widget_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_widgets`
--

DROP TABLE IF EXISTS `dashboard_widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_widgets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_widgets`
--

LOCK TABLES `dashboard_widgets` WRITE;
/*!40000 ALTER TABLE `dashboard_widgets` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_widgets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorite_posts`
--

DROP TABLE IF EXISTS `favorite_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorite_posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int unsigned NOT NULL,
  `user_id` int unsigned NOT NULL,
  `type` enum('favorite','bookmark') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `favorite_posts_post_id_user_id_type_unique` (`post_id`,`user_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorite_posts`
--

LOCK TABLES `favorite_posts` WRITE;
/*!40000 ALTER TABLE `favorite_posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `favorite_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `galleries`
--

DROP TABLE IF EXISTS `galleries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `galleries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  `order` tinyint unsigned NOT NULL DEFAULT '0',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int unsigned NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `galleries_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `galleries`
--

LOCK TABLES `galleries` WRITE;
/*!40000 ALTER TABLE `galleries` DISABLE KEYS */;
INSERT INTO `galleries` VALUES (1,'Perfect','Eveniet iste voluptates aliquam et. Nesciunt iusto est sunt aut commodi qui. Nulla consectetur consequatur sed debitis.',1,0,'galleries/1.jpg',1,'published','2022-03-20 04:34:04','2022-03-20 04:34:04'),(2,'New Day','Corrupti recusandae eos assumenda minus est. Porro qui incidunt praesentium modi ullam nisi velit. Aut ullam dolorum et et.',1,0,'galleries/2.jpg',1,'published','2022-03-20 04:34:04','2022-03-20 04:34:04'),(3,'Happy Day','Porro facilis voluptates tempore et dignissimos et. Qui iste est numquam sed rerum corrupti molestiae beatae.',1,0,'galleries/3.jpg',1,'published','2022-03-20 04:34:04','2022-03-20 04:34:04'),(4,'Nature','Ut ut ut consequatur repudiandae excepturi suscipit modi nam. Eius laudantium dolor qui sint. Ut labore repudiandae neque.',1,0,'galleries/4.jpg',1,'published','2022-03-20 04:34:04','2022-03-20 04:34:04'),(5,'Morning','Magni laborum iusto nulla. Delectus eos tempora blanditiis et est pariatur sapiente. In eum veniam ipsam cumque placeat voluptatem.',1,0,'galleries/5.jpg',1,'published','2022-03-20 04:34:04','2022-03-20 04:34:04'),(6,'Photography','Quia natus minus voluptatem commodi in. Ut qui ratione commodi. Delectus soluta est dignissimos aut esse. Voluptas ab sit culpa ad consequatur nulla.',1,0,'galleries/6.jpg',1,'published','2022-03-20 04:34:04','2022-03-20 04:34:04'),(7,'Building','Voluptas est optio culpa. Sed veniam natus neque velit dolores. Commodi nam cum eveniet et dolor. Tempora velit eaque ullam cumque.',1,0,'galleries/7.jpg',1,'published','2022-03-20 04:34:04','2022-03-20 04:34:04');
/*!40000 ALTER TABLE `galleries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `galleries_translations`
--

DROP TABLE IF EXISTS `galleries_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `galleries_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `galleries_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`galleries_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `galleries_translations`
--

LOCK TABLES `galleries_translations` WRITE;
/*!40000 ALTER TABLE `galleries_translations` DISABLE KEYS */;
INSERT INTO `galleries_translations` VALUES ('vi',1,'Hoàn hảo',NULL),('vi',2,'Ngày mới',NULL),('vi',3,'Ngày hạnh phúc',NULL),('vi',4,'Thiên nhiên',NULL),('vi',5,'Buổi sáng',NULL),('vi',6,'Nghệ thuật',NULL),('vi',7,'Kiến trúc',NULL);
/*!40000 ALTER TABLE `galleries_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gallery_meta`
--

DROP TABLE IF EXISTS `gallery_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gallery_meta` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `images` text COLLATE utf8mb4_unicode_ci,
  `reference_id` int unsigned NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `gallery_meta_reference_id_index` (`reference_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gallery_meta`
--

LOCK TABLES `gallery_meta` WRITE;
/*!40000 ALTER TABLE `gallery_meta` DISABLE KEYS */;
INSERT INTO `gallery_meta` VALUES (1,'[{\"img\":\"galleries\\/1.jpg\",\"description\":\"Vel aspernatur consequuntur omnis vel repudiandae. Saepe commodi ratione reprehenderit laboriosam labore et. Qui et nulla commodi.\"},{\"img\":\"galleries\\/2.jpg\",\"description\":\"Sapiente possimus autem vel vel sit sint. Reprehenderit voluptates quisquam beatae velit. Dolor vitae aut qui aut consequatur voluptas delectus.\"},{\"img\":\"galleries\\/3.jpg\",\"description\":\"Vel omnis quis magni dolor. Perspiciatis quam eligendi qui sed nihil. Dolores sed asperiores eaque amet blanditiis ad.\"},{\"img\":\"galleries\\/4.jpg\",\"description\":\"Quia vitae omnis quaerat accusamus qui. Accusamus ut praesentium temporibus facere. Officiis voluptatem doloribus quam aut aut.\"},{\"img\":\"galleries\\/5.jpg\",\"description\":\"Deserunt corrupti atque et quos hic saepe. Consequuntur est voluptatibus assumenda quam et totam vero. Eos optio rerum at magni.\"},{\"img\":\"galleries\\/6.jpg\",\"description\":\"Aut voluptas in adipisci iste. Animi eos a alias quia est exercitationem. Eum consequatur explicabo nostrum maiores.\"},{\"img\":\"galleries\\/7.jpg\",\"description\":\"Inventore eos alias est ea. Ratione delectus qui temporibus fugiat. Nam voluptatem numquam ut amet vero vel sint.\"},{\"img\":\"galleries\\/8.jpg\",\"description\":\"Est autem fuga saepe adipisci. Quo praesentium repellendus ipsa. Sed omnis sint alias quia. Omnis est sit et aperiam iste omnis.\"},{\"img\":\"galleries\\/9.jpg\",\"description\":\"Nisi aut qui cupiditate. Sequi consequatur voluptatem harum doloribus adipisci error. Reiciendis blanditiis laudantium dolores quae ut.\"},{\"img\":\"galleries\\/10.jpg\",\"description\":\"Hic esse officiis minima quia. Voluptatem sint deleniti repudiandae totam facere nesciunt qui. In alias fugiat voluptas at.\"}]',1,'Botble\\Gallery\\Models\\Gallery','2022-03-20 04:34:04','2022-03-20 04:34:04'),(2,'[{\"img\":\"galleries\\/1.jpg\",\"description\":\"Vel aspernatur consequuntur omnis vel repudiandae. Saepe commodi ratione reprehenderit laboriosam labore et. Qui et nulla commodi.\"},{\"img\":\"galleries\\/2.jpg\",\"description\":\"Sapiente possimus autem vel vel sit sint. Reprehenderit voluptates quisquam beatae velit. Dolor vitae aut qui aut consequatur voluptas delectus.\"},{\"img\":\"galleries\\/3.jpg\",\"description\":\"Vel omnis quis magni dolor. Perspiciatis quam eligendi qui sed nihil. Dolores sed asperiores eaque amet blanditiis ad.\"},{\"img\":\"galleries\\/4.jpg\",\"description\":\"Quia vitae omnis quaerat accusamus qui. Accusamus ut praesentium temporibus facere. Officiis voluptatem doloribus quam aut aut.\"},{\"img\":\"galleries\\/5.jpg\",\"description\":\"Deserunt corrupti atque et quos hic saepe. Consequuntur est voluptatibus assumenda quam et totam vero. Eos optio rerum at magni.\"},{\"img\":\"galleries\\/6.jpg\",\"description\":\"Aut voluptas in adipisci iste. Animi eos a alias quia est exercitationem. Eum consequatur explicabo nostrum maiores.\"},{\"img\":\"galleries\\/7.jpg\",\"description\":\"Inventore eos alias est ea. Ratione delectus qui temporibus fugiat. Nam voluptatem numquam ut amet vero vel sint.\"},{\"img\":\"galleries\\/8.jpg\",\"description\":\"Est autem fuga saepe adipisci. Quo praesentium repellendus ipsa. Sed omnis sint alias quia. Omnis est sit et aperiam iste omnis.\"},{\"img\":\"galleries\\/9.jpg\",\"description\":\"Nisi aut qui cupiditate. Sequi consequatur voluptatem harum doloribus adipisci error. Reiciendis blanditiis laudantium dolores quae ut.\"},{\"img\":\"galleries\\/10.jpg\",\"description\":\"Hic esse officiis minima quia. Voluptatem sint deleniti repudiandae totam facere nesciunt qui. In alias fugiat voluptas at.\"}]',2,'Botble\\Gallery\\Models\\Gallery','2022-03-20 04:34:04','2022-03-20 04:34:04'),(3,'[{\"img\":\"galleries\\/1.jpg\",\"description\":\"Vel aspernatur consequuntur omnis vel repudiandae. Saepe commodi ratione reprehenderit laboriosam labore et. Qui et nulla commodi.\"},{\"img\":\"galleries\\/2.jpg\",\"description\":\"Sapiente possimus autem vel vel sit sint. Reprehenderit voluptates quisquam beatae velit. Dolor vitae aut qui aut consequatur voluptas delectus.\"},{\"img\":\"galleries\\/3.jpg\",\"description\":\"Vel omnis quis magni dolor. Perspiciatis quam eligendi qui sed nihil. Dolores sed asperiores eaque amet blanditiis ad.\"},{\"img\":\"galleries\\/4.jpg\",\"description\":\"Quia vitae omnis quaerat accusamus qui. Accusamus ut praesentium temporibus facere. Officiis voluptatem doloribus quam aut aut.\"},{\"img\":\"galleries\\/5.jpg\",\"description\":\"Deserunt corrupti atque et quos hic saepe. Consequuntur est voluptatibus assumenda quam et totam vero. Eos optio rerum at magni.\"},{\"img\":\"galleries\\/6.jpg\",\"description\":\"Aut voluptas in adipisci iste. Animi eos a alias quia est exercitationem. Eum consequatur explicabo nostrum maiores.\"},{\"img\":\"galleries\\/7.jpg\",\"description\":\"Inventore eos alias est ea. Ratione delectus qui temporibus fugiat. Nam voluptatem numquam ut amet vero vel sint.\"},{\"img\":\"galleries\\/8.jpg\",\"description\":\"Est autem fuga saepe adipisci. Quo praesentium repellendus ipsa. Sed omnis sint alias quia. Omnis est sit et aperiam iste omnis.\"},{\"img\":\"galleries\\/9.jpg\",\"description\":\"Nisi aut qui cupiditate. Sequi consequatur voluptatem harum doloribus adipisci error. Reiciendis blanditiis laudantium dolores quae ut.\"},{\"img\":\"galleries\\/10.jpg\",\"description\":\"Hic esse officiis minima quia. Voluptatem sint deleniti repudiandae totam facere nesciunt qui. In alias fugiat voluptas at.\"}]',3,'Botble\\Gallery\\Models\\Gallery','2022-03-20 04:34:04','2022-03-20 04:34:04'),(4,'[{\"img\":\"galleries\\/1.jpg\",\"description\":\"Vel aspernatur consequuntur omnis vel repudiandae. Saepe commodi ratione reprehenderit laboriosam labore et. Qui et nulla commodi.\"},{\"img\":\"galleries\\/2.jpg\",\"description\":\"Sapiente possimus autem vel vel sit sint. Reprehenderit voluptates quisquam beatae velit. Dolor vitae aut qui aut consequatur voluptas delectus.\"},{\"img\":\"galleries\\/3.jpg\",\"description\":\"Vel omnis quis magni dolor. Perspiciatis quam eligendi qui sed nihil. Dolores sed asperiores eaque amet blanditiis ad.\"},{\"img\":\"galleries\\/4.jpg\",\"description\":\"Quia vitae omnis quaerat accusamus qui. Accusamus ut praesentium temporibus facere. Officiis voluptatem doloribus quam aut aut.\"},{\"img\":\"galleries\\/5.jpg\",\"description\":\"Deserunt corrupti atque et quos hic saepe. Consequuntur est voluptatibus assumenda quam et totam vero. Eos optio rerum at magni.\"},{\"img\":\"galleries\\/6.jpg\",\"description\":\"Aut voluptas in adipisci iste. Animi eos a alias quia est exercitationem. Eum consequatur explicabo nostrum maiores.\"},{\"img\":\"galleries\\/7.jpg\",\"description\":\"Inventore eos alias est ea. Ratione delectus qui temporibus fugiat. Nam voluptatem numquam ut amet vero vel sint.\"},{\"img\":\"galleries\\/8.jpg\",\"description\":\"Est autem fuga saepe adipisci. Quo praesentium repellendus ipsa. Sed omnis sint alias quia. Omnis est sit et aperiam iste omnis.\"},{\"img\":\"galleries\\/9.jpg\",\"description\":\"Nisi aut qui cupiditate. Sequi consequatur voluptatem harum doloribus adipisci error. Reiciendis blanditiis laudantium dolores quae ut.\"},{\"img\":\"galleries\\/10.jpg\",\"description\":\"Hic esse officiis minima quia. Voluptatem sint deleniti repudiandae totam facere nesciunt qui. In alias fugiat voluptas at.\"}]',4,'Botble\\Gallery\\Models\\Gallery','2022-03-20 04:34:04','2022-03-20 04:34:04'),(5,'[{\"img\":\"galleries\\/1.jpg\",\"description\":\"Vel aspernatur consequuntur omnis vel repudiandae. Saepe commodi ratione reprehenderit laboriosam labore et. Qui et nulla commodi.\"},{\"img\":\"galleries\\/2.jpg\",\"description\":\"Sapiente possimus autem vel vel sit sint. Reprehenderit voluptates quisquam beatae velit. Dolor vitae aut qui aut consequatur voluptas delectus.\"},{\"img\":\"galleries\\/3.jpg\",\"description\":\"Vel omnis quis magni dolor. Perspiciatis quam eligendi qui sed nihil. Dolores sed asperiores eaque amet blanditiis ad.\"},{\"img\":\"galleries\\/4.jpg\",\"description\":\"Quia vitae omnis quaerat accusamus qui. Accusamus ut praesentium temporibus facere. Officiis voluptatem doloribus quam aut aut.\"},{\"img\":\"galleries\\/5.jpg\",\"description\":\"Deserunt corrupti atque et quos hic saepe. Consequuntur est voluptatibus assumenda quam et totam vero. Eos optio rerum at magni.\"},{\"img\":\"galleries\\/6.jpg\",\"description\":\"Aut voluptas in adipisci iste. Animi eos a alias quia est exercitationem. Eum consequatur explicabo nostrum maiores.\"},{\"img\":\"galleries\\/7.jpg\",\"description\":\"Inventore eos alias est ea. Ratione delectus qui temporibus fugiat. Nam voluptatem numquam ut amet vero vel sint.\"},{\"img\":\"galleries\\/8.jpg\",\"description\":\"Est autem fuga saepe adipisci. Quo praesentium repellendus ipsa. Sed omnis sint alias quia. Omnis est sit et aperiam iste omnis.\"},{\"img\":\"galleries\\/9.jpg\",\"description\":\"Nisi aut qui cupiditate. Sequi consequatur voluptatem harum doloribus adipisci error. Reiciendis blanditiis laudantium dolores quae ut.\"},{\"img\":\"galleries\\/10.jpg\",\"description\":\"Hic esse officiis minima quia. Voluptatem sint deleniti repudiandae totam facere nesciunt qui. In alias fugiat voluptas at.\"}]',5,'Botble\\Gallery\\Models\\Gallery','2022-03-20 04:34:04','2022-03-20 04:34:04'),(6,'[{\"img\":\"galleries\\/1.jpg\",\"description\":\"Vel aspernatur consequuntur omnis vel repudiandae. Saepe commodi ratione reprehenderit laboriosam labore et. Qui et nulla commodi.\"},{\"img\":\"galleries\\/2.jpg\",\"description\":\"Sapiente possimus autem vel vel sit sint. Reprehenderit voluptates quisquam beatae velit. Dolor vitae aut qui aut consequatur voluptas delectus.\"},{\"img\":\"galleries\\/3.jpg\",\"description\":\"Vel omnis quis magni dolor. Perspiciatis quam eligendi qui sed nihil. Dolores sed asperiores eaque amet blanditiis ad.\"},{\"img\":\"galleries\\/4.jpg\",\"description\":\"Quia vitae omnis quaerat accusamus qui. Accusamus ut praesentium temporibus facere. Officiis voluptatem doloribus quam aut aut.\"},{\"img\":\"galleries\\/5.jpg\",\"description\":\"Deserunt corrupti atque et quos hic saepe. Consequuntur est voluptatibus assumenda quam et totam vero. Eos optio rerum at magni.\"},{\"img\":\"galleries\\/6.jpg\",\"description\":\"Aut voluptas in adipisci iste. Animi eos a alias quia est exercitationem. Eum consequatur explicabo nostrum maiores.\"},{\"img\":\"galleries\\/7.jpg\",\"description\":\"Inventore eos alias est ea. Ratione delectus qui temporibus fugiat. Nam voluptatem numquam ut amet vero vel sint.\"},{\"img\":\"galleries\\/8.jpg\",\"description\":\"Est autem fuga saepe adipisci. Quo praesentium repellendus ipsa. Sed omnis sint alias quia. Omnis est sit et aperiam iste omnis.\"},{\"img\":\"galleries\\/9.jpg\",\"description\":\"Nisi aut qui cupiditate. Sequi consequatur voluptatem harum doloribus adipisci error. Reiciendis blanditiis laudantium dolores quae ut.\"},{\"img\":\"galleries\\/10.jpg\",\"description\":\"Hic esse officiis minima quia. Voluptatem sint deleniti repudiandae totam facere nesciunt qui. In alias fugiat voluptas at.\"}]',6,'Botble\\Gallery\\Models\\Gallery','2022-03-20 04:34:04','2022-03-20 04:34:04'),(7,'[{\"img\":\"galleries\\/1.jpg\",\"description\":\"Vel aspernatur consequuntur omnis vel repudiandae. Saepe commodi ratione reprehenderit laboriosam labore et. Qui et nulla commodi.\"},{\"img\":\"galleries\\/2.jpg\",\"description\":\"Sapiente possimus autem vel vel sit sint. Reprehenderit voluptates quisquam beatae velit. Dolor vitae aut qui aut consequatur voluptas delectus.\"},{\"img\":\"galleries\\/3.jpg\",\"description\":\"Vel omnis quis magni dolor. Perspiciatis quam eligendi qui sed nihil. Dolores sed asperiores eaque amet blanditiis ad.\"},{\"img\":\"galleries\\/4.jpg\",\"description\":\"Quia vitae omnis quaerat accusamus qui. Accusamus ut praesentium temporibus facere. Officiis voluptatem doloribus quam aut aut.\"},{\"img\":\"galleries\\/5.jpg\",\"description\":\"Deserunt corrupti atque et quos hic saepe. Consequuntur est voluptatibus assumenda quam et totam vero. Eos optio rerum at magni.\"},{\"img\":\"galleries\\/6.jpg\",\"description\":\"Aut voluptas in adipisci iste. Animi eos a alias quia est exercitationem. Eum consequatur explicabo nostrum maiores.\"},{\"img\":\"galleries\\/7.jpg\",\"description\":\"Inventore eos alias est ea. Ratione delectus qui temporibus fugiat. Nam voluptatem numquam ut amet vero vel sint.\"},{\"img\":\"galleries\\/8.jpg\",\"description\":\"Est autem fuga saepe adipisci. Quo praesentium repellendus ipsa. Sed omnis sint alias quia. Omnis est sit et aperiam iste omnis.\"},{\"img\":\"galleries\\/9.jpg\",\"description\":\"Nisi aut qui cupiditate. Sequi consequatur voluptatem harum doloribus adipisci error. Reiciendis blanditiis laudantium dolores quae ut.\"},{\"img\":\"galleries\\/10.jpg\",\"description\":\"Hic esse officiis minima quia. Voluptatem sint deleniti repudiandae totam facere nesciunt qui. In alias fugiat voluptas at.\"}]',7,'Botble\\Gallery\\Models\\Gallery','2022-03-20 04:34:04','2022-03-20 04:34:04');
/*!40000 ALTER TABLE `gallery_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language_meta`
--

DROP TABLE IF EXISTS `language_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `language_meta` (
  `lang_meta_id` int unsigned NOT NULL AUTO_INCREMENT,
  `lang_meta_code` text COLLATE utf8mb4_unicode_ci,
  `lang_meta_origin` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` int unsigned NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`lang_meta_id`),
  KEY `language_meta_reference_id_index` (`reference_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language_meta`
--

LOCK TABLES `language_meta` WRITE;
/*!40000 ALTER TABLE `language_meta` DISABLE KEYS */;
INSERT INTO `language_meta` VALUES (1,'en_US','c495ee16a4b1a52b864c67c6a8c46ec4',1,'Botble\\Menu\\Models\\MenuLocation'),(2,'en_US','4a6c7e61581700323cef8d4956d1a092',1,'Botble\\Menu\\Models\\Menu'),(3,'en_US','187dbbeb9bde0a2ba5a7ec8212037a04',2,'Botble\\Menu\\Models\\Menu'),(4,'vi','ede0ae622001747ef5052f8743359bcc',2,'Botble\\Menu\\Models\\MenuLocation'),(5,'vi','4a6c7e61581700323cef8d4956d1a092',3,'Botble\\Menu\\Models\\Menu'),(6,'vi','187dbbeb9bde0a2ba5a7ec8212037a04',4,'Botble\\Menu\\Models\\Menu'),(7,'en_US','8795f3d634ee5344e0d18e9eb9a9bad8',1,'Botble\\PostCollection\\Models\\PostCollection'),(8,'en_US','6cec239eaa83b13708c15f3de8637a89',2,'Botble\\PostCollection\\Models\\PostCollection'),(9,'vi','9ae4bab317a0a03e36ce5133c4986765',3,'Botble\\PostCollection\\Models\\PostCollection'),(10,'vi','f6217dcdbcb3cb3d4b44dc83ee1b39f9',4,'Botble\\PostCollection\\Models\\PostCollection');
/*!40000 ALTER TABLE `language_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `languages` (
  `lang_id` int unsigned NOT NULL AUTO_INCREMENT,
  `lang_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_locale` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_flag` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang_is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `lang_order` int NOT NULL DEFAULT '0',
  `lang_is_rtl` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`lang_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,'English','en','en_US','us',1,0,0),(2,'Tiếng Việt','vi','vi','vn',0,0,0);
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_files`
--

DROP TABLE IF EXISTS `media_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_files` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `folder_id` int unsigned NOT NULL DEFAULT '0',
  `mime_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_files_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_files`
--

LOCK TABLES `media_files` WRITE;
/*!40000 ALTER TABLE `media_files` DISABLE KEYS */;
INSERT INTO `media_files` VALUES (1,0,'image-1',1,'image/jpeg',110154,'banners/image-1.jpg','[]','2022-03-20 04:34:02','2022-03-20 04:34:02',NULL),(2,0,'image-2',1,'image/jpeg',53388,'banners/image-2.jpg','[]','2022-03-20 04:34:02','2022-03-20 04:34:02',NULL),(3,0,'image-3',1,'image/jpeg',46269,'banners/image-3.jpg','[]','2022-03-20 04:34:02','2022-03-20 04:34:02',NULL),(4,0,'image-4',1,'image/jpeg',47591,'banners/image-4.jpg','[]','2022-03-20 04:34:03','2022-03-20 04:34:03',NULL),(5,0,'1',2,'image/jpeg',42814,'galleries/1.jpg','[]','2022-03-20 04:34:03','2022-03-20 04:34:03',NULL),(6,0,'10',2,'image/jpeg',95796,'galleries/10.jpg','[]','2022-03-20 04:34:03','2022-03-20 04:34:03',NULL),(7,0,'2',2,'image/jpeg',43108,'galleries/2.jpg','[]','2022-03-20 04:34:03','2022-03-20 04:34:03',NULL),(8,0,'3',2,'image/jpeg',67060,'galleries/3.jpg','[]','2022-03-20 04:34:03','2022-03-20 04:34:03',NULL),(9,0,'4',2,'image/jpeg',60609,'galleries/4.jpg','[]','2022-03-20 04:34:03','2022-03-20 04:34:03',NULL),(10,0,'5',2,'image/jpeg',70264,'galleries/5.jpg','[]','2022-03-20 04:34:04','2022-03-20 04:34:04',NULL),(11,0,'6',2,'image/jpeg',40607,'galleries/6.jpg','[]','2022-03-20 04:34:04','2022-03-20 04:34:04',NULL),(12,0,'7',2,'image/jpeg',41491,'galleries/7.jpg','[]','2022-03-20 04:34:04','2022-03-20 04:34:04',NULL),(13,0,'8',2,'image/jpeg',58063,'galleries/8.jpg','[]','2022-03-20 04:34:04','2022-03-20 04:34:04',NULL),(14,0,'9',2,'image/jpeg',69288,'galleries/9.jpg','[]','2022-03-20 04:34:04','2022-03-20 04:34:04',NULL),(15,0,'news-1',3,'image/jpeg',93694,'news/news-1.jpg','[]','2022-03-20 04:34:05','2022-03-20 04:34:05',NULL),(16,0,'news-10',3,'image/jpeg',58656,'news/news-10.jpg','[]','2022-03-20 04:34:05','2022-03-20 04:34:05',NULL),(17,0,'news-11',3,'image/jpeg',127000,'news/news-11.jpg','[]','2022-03-20 04:34:05','2022-03-20 04:34:05',NULL),(18,0,'news-12',3,'image/jpeg',30283,'news/news-12.jpg','[]','2022-03-20 04:34:05','2022-03-20 04:34:05',NULL),(19,0,'news-13',3,'image/jpeg',359805,'news/news-13.jpg','[]','2022-03-20 04:34:05','2022-03-20 04:34:05',NULL),(20,0,'news-14',3,'image/jpeg',128708,'news/news-14.jpg','[]','2022-03-20 04:34:06','2022-03-20 04:34:06',NULL),(21,0,'news-15',3,'image/jpeg',283779,'news/news-15.jpg','[]','2022-03-20 04:34:06','2022-03-20 04:34:06',NULL),(22,0,'news-16',3,'image/jpeg',157899,'news/news-16.jpg','[]','2022-03-20 04:34:06','2022-03-20 04:34:06',NULL),(23,0,'news-17',3,'image/jpeg',62316,'news/news-17.jpg','[]','2022-03-20 04:34:06','2022-03-20 04:34:06',NULL),(24,0,'news-18',3,'image/jpeg',103832,'news/news-18.jpg','[]','2022-03-20 04:34:06','2022-03-20 04:34:06',NULL),(25,0,'news-19',3,'image/jpeg',56987,'news/news-19.jpg','[]','2022-03-20 04:34:07','2022-03-20 04:34:07',NULL),(26,0,'news-2',3,'image/jpeg',95478,'news/news-2.jpg','[]','2022-03-20 04:34:07','2022-03-20 04:34:07',NULL),(27,0,'news-20',3,'image/jpeg',52338,'news/news-20.jpg','[]','2022-03-20 04:34:07','2022-03-20 04:34:07',NULL),(28,0,'news-21',3,'image/jpeg',76078,'news/news-21.jpg','[]','2022-03-20 04:34:07','2022-03-20 04:34:07',NULL),(29,0,'news-22',3,'image/jpeg',45269,'news/news-22.jpg','[]','2022-03-20 04:34:07','2022-03-20 04:34:07',NULL),(30,0,'news-23',3,'image/jpeg',39502,'news/news-23.jpg','[]','2022-03-20 04:34:07','2022-03-20 04:34:07',NULL),(31,0,'news-24',3,'image/jpeg',17605,'news/news-24.jpg','[]','2022-03-20 04:34:07','2022-03-20 04:34:07',NULL),(32,0,'news-3',3,'image/jpeg',44092,'news/news-3.jpg','[]','2022-03-20 04:34:08','2022-03-20 04:34:08',NULL),(33,0,'news-4',3,'image/jpeg',163183,'news/news-4.jpg','[]','2022-03-20 04:34:08','2022-03-20 04:34:08',NULL),(34,0,'news-5',3,'image/jpeg',93457,'news/news-5.jpg','[]','2022-03-20 04:34:08','2022-03-20 04:34:08',NULL),(35,0,'news-6',3,'image/jpeg',70592,'news/news-6.jpg','[]','2022-03-20 04:34:08','2022-03-20 04:34:08',NULL),(36,0,'news-7',3,'image/jpeg',115977,'news/news-7.jpg','[]','2022-03-20 04:34:08','2022-03-20 04:34:08',NULL),(37,0,'news-8',3,'image/jpeg',80243,'news/news-8.jpg','[]','2022-03-20 04:34:08','2022-03-20 04:34:08',NULL),(38,0,'news-9',3,'image/jpeg',52207,'news/news-9.jpg','[]','2022-03-20 04:34:09','2022-03-20 04:34:09',NULL),(39,0,'thumbnail-1',3,'image/jpeg',166014,'news/thumbnail-1.jpg','[]','2022-03-20 04:34:09','2022-03-20 04:34:09',NULL),(40,0,'thumbnail-2',3,'image/jpeg',52142,'news/thumbnail-2.jpg','[]','2022-03-20 04:34:09','2022-03-20 04:34:09',NULL),(41,0,'thumbnail-3',3,'image/jpeg',130131,'news/thumbnail-3.jpg','[]','2022-03-20 04:34:09','2022-03-20 04:34:09',NULL),(42,0,'thumbnail-4',3,'image/jpeg',71857,'news/thumbnail-4.jpg','[]','2022-03-20 04:34:09','2022-03-20 04:34:09',NULL),(43,0,'thumbnail-5',3,'image/jpeg',47451,'news/thumbnail-5.jpg','[]','2022-03-20 04:34:09','2022-03-20 04:34:09',NULL),(44,0,'thumbnail-6',3,'image/jpeg',98871,'news/thumbnail-6.jpg','[]','2022-03-20 04:34:10','2022-03-20 04:34:10',NULL),(45,0,'video1',4,'video/mp4',6378345,'videos/video1.mp4','[]','2022-03-20 04:34:10','2022-03-20 04:34:10',NULL),(46,0,'1',5,'image/jpeg',11752,'authors/1.jpg','[]','2022-03-20 04:34:12','2022-03-20 04:34:12',NULL),(47,0,'10',5,'image/jpeg',27814,'authors/10.jpg','[]','2022-03-20 04:34:12','2022-03-20 04:34:12',NULL),(48,0,'2',5,'image/jpeg',19005,'authors/2.jpg','[]','2022-03-20 04:34:12','2022-03-20 04:34:12',NULL),(49,0,'3',5,'image/jpeg',20400,'authors/3.jpg','[]','2022-03-20 04:34:12','2022-03-20 04:34:12',NULL),(50,0,'4',5,'image/jpeg',26819,'authors/4.jpg','[]','2022-03-20 04:34:12','2022-03-20 04:34:12',NULL),(51,0,'5',5,'image/jpeg',14367,'authors/5.jpg','[]','2022-03-20 04:34:12','2022-03-20 04:34:12',NULL),(52,0,'6',5,'image/jpeg',12367,'authors/6.jpg','[]','2022-03-20 04:34:12','2022-03-20 04:34:12',NULL),(53,0,'7',5,'image/jpeg',20652,'authors/7.jpg','[]','2022-03-20 04:34:12','2022-03-20 04:34:12',NULL),(54,0,'8',5,'image/jpeg',21164,'authors/8.jpg','[]','2022-03-20 04:34:12','2022-03-20 04:34:12',NULL),(55,0,'9',5,'image/jpeg',6084,'authors/9.jpg','[]','2022-03-20 04:34:13','2022-03-20 04:34:13',NULL),(56,0,'favicon',6,'image/png',3913,'general/favicon.png','[]','2022-03-20 04:34:14','2022-03-20 04:34:14',NULL),(57,0,'img-loading',6,'image/jpeg',461,'general/img-loading.jpg','[]','2022-03-20 04:34:15','2022-03-20 04:34:15',NULL),(58,0,'logo-mobile',6,'image/png',5054,'general/logo-mobile.png','[]','2022-03-20 04:34:15','2022-03-20 04:34:15',NULL),(59,0,'logo-tablet',6,'image/png',5786,'general/logo-tablet.png','[]','2022-03-20 04:34:15','2022-03-20 04:34:15',NULL),(60,0,'logo-white',6,'image/png',6305,'general/logo-white.png','[]','2022-03-20 04:34:15','2022-03-20 04:34:15',NULL),(61,0,'logo',6,'image/png',7171,'general/logo.png','[]','2022-03-20 04:34:15','2022-03-20 04:34:15',NULL),(62,0,'screenshot',6,'image/png',205662,'general/screenshot.png','[]','2022-03-20 04:34:15','2022-03-20 04:34:15',NULL);
/*!40000 ALTER TABLE `media_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_folders`
--

DROP TABLE IF EXISTS `media_folders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_folders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_folders_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_folders`
--

LOCK TABLES `media_folders` WRITE;
/*!40000 ALTER TABLE `media_folders` DISABLE KEYS */;
INSERT INTO `media_folders` VALUES (1,0,'banners','banners',0,'2022-03-20 04:34:02','2022-03-20 04:34:02',NULL),(2,0,'galleries','galleries',0,'2022-03-20 04:34:03','2022-03-20 04:34:03',NULL),(3,0,'news','news',0,'2022-03-20 04:34:05','2022-03-20 04:34:05',NULL),(4,0,'videos','videos',0,'2022-03-20 04:34:10','2022-03-20 04:34:10',NULL),(5,0,'authors','authors',0,'2022-03-20 04:34:12','2022-03-20 04:34:12',NULL),(6,0,'general','general',0,'2022-03-20 04:34:14','2022-03-20 04:34:14',NULL);
/*!40000 ALTER TABLE `media_folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_settings`
--

DROP TABLE IF EXISTS `media_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `media_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_settings`
--

LOCK TABLES `media_settings` WRITE;
/*!40000 ALTER TABLE `media_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_activity_logs`
--

DROP TABLE IF EXISTS `member_activity_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_activity_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `reference_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(39) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `member_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `member_activity_logs_member_id_index` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_activity_logs`
--

LOCK TABLES `member_activity_logs` WRITE;
/*!40000 ALTER TABLE `member_activity_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `member_activity_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_password_resets`
--

DROP TABLE IF EXISTS `member_password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `member_password_resets_email_index` (`email`),
  KEY `member_password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_password_resets`
--

LOCK TABLES `member_password_resets` WRITE;
/*!40000 ALTER TABLE `member_password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `member_password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `members` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `gender` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar_id` int unsigned DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `phone` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `email_verify_token` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `favorite_posts` text COLLATE utf8mb4_unicode_ci,
  `bookmark_posts` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `members_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (1,'John','Smith','I? Ah, THAT\'S the great question is, what did the Dormouse went on, spreading out the verses on.',NULL,'user@thesky9.com','$2y$10$U77o5dD4zS7z2AUCCDegiuFpgef7DXli5yYnWF38Djb.QA4ueCoj.',53,'2004-03-20','717.460.9531','2022-03-20 04:34:13',NULL,NULL,'2022-03-20 04:34:13','2022-03-20 04:34:13',NULL,NULL),(2,'Oren','Dicki','Alice noticed with some severity; \'it\'s very interesting. I never was so large a house, that she.',NULL,'melvina.hagenes@yahoo.com','$2y$10$d9McEcefENoSjhUNn6OhQeX2U2/VTY1.4p3C8ZvYLFznCFHxfySGu',52,'1976-08-09','1-854-619-7603','2022-03-20 04:34:13',NULL,NULL,'2022-03-20 04:34:13','2022-03-20 04:34:13',NULL,NULL),(3,'Joelle','Terry','Alice. \'Who\'s making personal remarks now?\' the Hatter with a little door was shut again, and.',NULL,'jerde.benedict@gmail.com','$2y$10$WdVPHIueVa1uRR0kzyfjSuhISfiyRXxfkYt3xGedXBM5oIgIn85hC',55,'2015-10-24','812.567.3795','2022-03-20 04:34:13',NULL,NULL,'2022-03-20 04:34:13','2022-03-20 04:34:13',NULL,NULL),(4,'Chauncey','Welch','Majesty!\' the Duchess asked, with another hedgehog, which seemed to be patted on the ground near.',NULL,'cbartoletti@gmail.com','$2y$10$SGMYqPG0hBDQ9DFUnr5ZV.d1ykpY1NSv2JQ1LpVHAskp5e1AKfnSG',48,'2018-01-20','(918) 787-9574','2022-03-20 04:34:13',NULL,NULL,'2022-03-20 04:34:13','2022-03-20 04:34:13',NULL,NULL),(5,'Asa','Bins','Oh, I shouldn\'t like THAT!\' \'Oh, you foolish Alice!\' she answered herself. \'How can you learn.',NULL,'gyost@kunze.com','$2y$10$x1SrVKAtYx4T735Ga94LmOspGs43dWl8D4pmP703C.hZArduPVqU2',51,'2015-10-16','(586) 204-4813','2022-03-20 04:34:13',NULL,NULL,'2022-03-20 04:34:13','2022-03-20 04:34:13',NULL,NULL),(6,'Nicklaus','Olson','When the Mouse only shook its head to keep back the wandering hair that WOULD always get into that.',NULL,'boris.parker@schaden.com','$2y$10$Ax.yXyG.Du4o5H8wzb9DWuosnoXoeALgnq70lXgZY43NjuvhvWS5i',54,'2013-05-03','+1-716-697-3561','2022-03-20 04:34:13',NULL,NULL,'2022-03-20 04:34:13','2022-03-20 04:34:13',NULL,NULL),(7,'Collin','Olson','Cat; and this Alice would not join the dance? Will you, won\'t you join the dance? \"You can really.',NULL,'burley.bergnaum@kuhic.com','$2y$10$STXJil.2JeSbE/Q29MZPHu/73YrQj8SioG4n46BxprKf0cndeJ7p.',54,'1973-07-04','1-769-385-9219','2022-03-20 04:34:13',NULL,NULL,'2022-03-20 04:34:13','2022-03-20 04:34:13',NULL,NULL),(8,'Meghan','Brown','Alice replied in an undertone, \'important--unimportant--unimportant--important--\' as if nothing.',NULL,'rosario68@volkman.net','$2y$10$afChF91ioFilP57PV4ONLOq9bEts43LF5izoZYZMF5gm.X71Ldon6',55,'1970-04-24','469.874.9295','2022-03-20 04:34:13',NULL,NULL,'2022-03-20 04:34:13','2022-03-20 04:34:13',NULL,NULL),(9,'Rodger','Feeney','She had quite forgotten the words.\' So they sat down, and was delighted to find herself talking.',NULL,'eliza.kunze@dickens.info','$2y$10$1MreLTzyDPYLivXSws1UtugYmZZt6rrBgK0lUdTa4aLpDM5HKbCUa',46,'1986-04-21','815-548-6726','2022-03-20 04:34:13',NULL,NULL,'2022-03-20 04:34:13','2022-03-20 04:34:13',NULL,NULL),(10,'Kailey','Carroll','King said to herself; \'his eyes are so VERY tired of sitting by her sister on the door of the.',NULL,'lowe.leonel@kozey.com','$2y$10$.C2DU9c2nH.gsSgqiWCmAe2LXejfVbPvd88JgCv9aS2gt4XT3Xlgm',55,'1977-12-08','646.468.4954','2022-03-20 04:34:13',NULL,NULL,'2022-03-20 04:34:13','2022-03-20 04:34:13',NULL,NULL),(11,'Jerald','Sporer','Involved in this affair, He trusts to you how the Dodo solemnly, rising to its feet, \'I move that.',NULL,'elias.vonrueden@hotmail.com','$2y$10$1RALAKiJsRnON5FUWHAVee9HLTutrczJ4oFESXn6xF0gPiPvzxxVO',46,'2000-08-16','573-715-8565','2022-03-20 04:34:13',NULL,NULL,'2022-03-20 04:34:13','2022-03-20 04:34:13',NULL,NULL);
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_locations`
--

DROP TABLE IF EXISTS `menu_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_locations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int unsigned NOT NULL,
  `location` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_locations`
--

LOCK TABLES `menu_locations` WRITE;
/*!40000 ALTER TABLE `menu_locations` DISABLE KEYS */;
INSERT INTO `menu_locations` VALUES (1,1,'main-menu','2022-03-20 04:34:14','2022-03-20 04:34:14'),(2,3,'main-menu','2022-03-20 04:34:14','2022-03-20 04:34:14');
/*!40000 ALTER TABLE `menu_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_nodes`
--

DROP TABLE IF EXISTS `menu_nodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_nodes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int unsigned NOT NULL,
  `parent_id` int unsigned NOT NULL DEFAULT '0',
  `reference_id` int unsigned DEFAULT NULL,
  `reference_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_font` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` tinyint unsigned NOT NULL DEFAULT '0',
  `title` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `css_class` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `has_child` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_nodes_menu_id_index` (`menu_id`),
  KEY `menu_nodes_parent_id_index` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_nodes`
--

LOCK TABLES `menu_nodes` WRITE;
/*!40000 ALTER TABLE `menu_nodes` DISABLE KEYS */;
INSERT INTO `menu_nodes` VALUES (1,1,0,NULL,NULL,'/',NULL,0,'Home',NULL,'_self',1,'2022-03-20 04:34:14','2022-03-20 04:34:14'),(2,1,1,NULL,NULL,'/',NULL,0,'Home default',NULL,'_self',0,'2022-03-20 04:34:14','2022-03-20 04:34:14'),(3,1,1,NULL,NULL,'/home-2?header=style-2',NULL,0,'Home 2',NULL,'_self',0,'2022-03-20 04:34:14','2022-03-20 04:34:14'),(4,1,1,NULL,NULL,'/home-3?header=style-3',NULL,0,'Home 3',NULL,'_self',0,'2022-03-20 04:34:14','2022-03-20 04:34:14'),(5,1,0,NULL,NULL,'/galleries',NULL,0,'Galleries',NULL,'_self',0,'2022-03-20 04:34:14','2022-03-20 04:34:14'),(6,1,0,6,'Botble\\Page\\Models\\Page',NULL,NULL,0,'Category layouts',NULL,'_self',1,'2022-03-20 04:34:14','2022-03-20 04:34:14'),(7,1,6,5,'Botble\\Page\\Models\\Page',NULL,NULL,0,'List',NULL,'_self',0,'2022-03-20 04:34:14','2022-03-20 04:34:14'),(8,1,6,6,'Botble\\Page\\Models\\Page',NULL,NULL,0,'Grid',NULL,'_self',0,'2022-03-20 04:34:14','2022-03-20 04:34:14'),(9,1,6,7,'Botble\\Page\\Models\\Page',NULL,NULL,0,'Metro',NULL,'_self',0,'2022-03-20 04:34:14','2022-03-20 04:34:14'),(10,1,0,1,'Botble\\Blog\\Models\\Post',NULL,NULL,0,'Post layouts',NULL,'_self',1,'2022-03-20 04:34:14','2022-03-20 04:34:14'),(11,1,10,1,'Botble\\Blog\\Models\\Post',NULL,NULL,0,'Default',NULL,'_self',0,'2022-03-20 04:34:14','2022-03-20 04:34:14'),(12,1,10,2,'Botble\\Blog\\Models\\Post',NULL,NULL,0,'Full top',NULL,'_self',0,'2022-03-20 04:34:14','2022-03-20 04:34:14'),(13,1,10,3,'Botble\\Blog\\Models\\Post',NULL,NULL,0,'Inline',NULL,'_self',0,'2022-03-20 04:34:14','2022-03-20 04:34:14'),(14,1,0,9,'Botble\\Page\\Models\\Page',NULL,NULL,0,'About',NULL,'_self',0,'2022-03-20 04:34:14','2022-03-20 04:34:14'),(15,1,0,8,'Botble\\Page\\Models\\Page',NULL,NULL,0,'Contact',NULL,'_self',0,'2022-03-20 04:34:14','2022-03-20 04:34:14'),(16,1,0,NULL,NULL,NULL,NULL,0,'Pages',NULL,'_self',1,'2022-03-20 04:34:14','2022-03-20 04:34:14'),(17,1,16,10,'Botble\\Page\\Models\\Page',NULL,NULL,0,'Cookie Policy',NULL,'_self',0,'2022-03-20 04:34:14','2022-03-20 04:34:14'),(18,1,16,NULL,NULL,'page-not-found',NULL,0,'404',NULL,'_self',0,'2022-03-20 04:34:14','2022-03-20 04:34:14'),(19,1,16,NULL,NULL,'/login',NULL,0,'Login',NULL,'_self',0,'2022-03-20 04:34:14','2022-03-20 04:34:14'),(20,1,16,NULL,NULL,'/register',NULL,0,'Signup',NULL,'_self',0,'2022-03-20 04:34:14','2022-03-20 04:34:14'),(21,2,0,NULL,NULL,'/',NULL,0,'Homepage',NULL,'_self',0,'2022-03-20 04:34:14','2022-03-20 04:34:14'),(22,2,0,8,'Botble\\Page\\Models\\Page',NULL,NULL,0,'Contact',NULL,'_self',0,'2022-03-20 04:34:14','2022-03-20 04:34:14'),(23,2,0,4,'Botble\\Page\\Models\\Page',NULL,NULL,0,'Blog',NULL,'_self',0,'2022-03-20 04:34:14','2022-03-20 04:34:14'),(24,2,0,NULL,NULL,'/galleries',NULL,0,'Galleries',NULL,'_self',0,'2022-03-20 04:34:14','2022-03-20 04:34:14'),(25,3,0,NULL,NULL,'/',NULL,0,'Trang chủ',NULL,'_self',1,'2022-03-20 04:34:14','2022-03-20 04:34:14'),(26,3,25,NULL,NULL,'/',NULL,0,'Trang chủ mặc định',NULL,'_self',0,'2022-03-20 04:34:14','2022-03-20 04:34:14'),(27,3,25,NULL,NULL,'/home-2?header=style-2',NULL,0,'Trang chủ 2',NULL,'_self',0,'2022-03-20 04:34:14','2022-03-20 04:34:14'),(28,3,25,NULL,NULL,'/home-3?header=style-3',NULL,0,'Trang chủ 3',NULL,'_self',0,'2022-03-20 04:34:14','2022-03-20 04:34:14'),(29,3,0,NULL,NULL,'/galleries',NULL,0,'Thư viện ảnh',NULL,'_self',0,'2022-03-20 04:34:14','2022-03-20 04:34:14'),(30,3,0,6,'Botble\\Page\\Models\\Page',NULL,NULL,0,'Danh mục',NULL,'_self',1,'2022-03-20 04:34:14','2022-03-20 04:34:14'),(31,3,30,5,'Botble\\Page\\Models\\Page',NULL,NULL,0,'Style cột',NULL,'_self',0,'2022-03-20 04:34:14','2022-03-20 04:34:14'),(32,3,30,6,'Botble\\Page\\Models\\Page',NULL,NULL,0,'Style danh sách',NULL,'_self',0,'2022-03-20 04:34:14','2022-03-20 04:34:14'),(33,3,30,7,'Botble\\Page\\Models\\Page',NULL,NULL,0,'Style danh sách 2',NULL,'_self',0,'2022-03-20 04:34:14','2022-03-20 04:34:14'),(34,3,0,1,'Botble\\Blog\\Models\\Post',NULL,NULL,0,'Bài viết',NULL,'_self',1,'2022-03-20 04:34:14','2022-03-20 04:34:14'),(35,3,34,1,'Botble\\Blog\\Models\\Post',NULL,NULL,0,'Default',NULL,'_self',0,'2022-03-20 04:34:14','2022-03-20 04:34:14'),(36,3,34,2,'Botble\\Blog\\Models\\Post',NULL,NULL,0,'Full top',NULL,'_self',0,'2022-03-20 04:34:14','2022-03-20 04:34:14'),(37,3,34,3,'Botble\\Blog\\Models\\Post',NULL,NULL,0,'Inline',NULL,'_self',0,'2022-03-20 04:34:14','2022-03-20 04:34:14'),(38,3,0,9,'Botble\\Page\\Models\\Page',NULL,NULL,0,'Liên hệ',NULL,'_self',0,'2022-03-20 04:34:14','2022-03-20 04:34:14'),(39,3,0,8,'Botble\\Page\\Models\\Page',NULL,NULL,0,'Về chúng tôi',NULL,'_self',0,'2022-03-20 04:34:14','2022-03-20 04:34:14'),(40,4,0,NULL,NULL,'/',NULL,0,'Trang chủ',NULL,'_self',0,'2022-03-20 04:34:14','2022-03-20 04:34:14'),(41,4,0,8,'Botble\\Page\\Models\\Page',NULL,NULL,0,'Liên hệ',NULL,'_self',0,'2022-03-20 04:34:14','2022-03-20 04:34:14'),(42,4,0,4,'Botble\\Page\\Models\\Page',NULL,NULL,0,'Tin tức',NULL,'_self',0,'2022-03-20 04:34:14','2022-03-20 04:34:14'),(43,4,0,NULL,NULL,'/galleries',NULL,0,'Thư viện ảnh',NULL,'_self',0,'2022-03-20 04:34:14','2022-03-20 04:34:14');
/*!40000 ALTER TABLE `menu_nodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menus` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,'Main menu','main-menu','published','2022-03-20 04:34:14','2022-03-20 04:34:14'),(2,'Quick links','quick-links','published','2022-03-20 04:34:14','2022-03-20 04:34:14'),(3,'Menu chính','menu-chinh','published','2022-03-20 04:34:14','2022-03-20 04:34:14'),(4,'Liên kết','lien-ket','published','2022-03-20 04:34:14','2022-03-20 04:34:14');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meta_boxes`
--

DROP TABLE IF EXISTS `meta_boxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meta_boxes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_value` text COLLATE utf8mb4_unicode_ci,
  `reference_id` int unsigned NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `meta_boxes_reference_id_index` (`reference_id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meta_boxes`
--

LOCK TABLES `meta_boxes` WRITE;
/*!40000 ALTER TABLE `meta_boxes` DISABLE KEYS */;
INSERT INTO `meta_boxes` VALUES (1,'layout','[\"default\"]',1,'Botble\\Blog\\Models\\Post','2022-03-20 04:34:10','2022-03-20 04:34:10'),(2,'time_to_read','[3]',1,'Botble\\Blog\\Models\\Post','2022-03-20 04:34:10','2022-03-20 04:34:10'),(3,'comment_status','[1]',1,'Botble\\Blog\\Models\\Post','2022-03-20 04:34:10','2022-03-20 04:34:10'),(4,'layout','[\"top-full\"]',2,'Botble\\Blog\\Models\\Post','2022-03-20 04:34:10','2022-03-20 04:34:10'),(5,'time_to_read','[18]',2,'Botble\\Blog\\Models\\Post','2022-03-20 04:34:10','2022-03-20 04:34:10'),(6,'comment_status','[1]',2,'Botble\\Blog\\Models\\Post','2022-03-20 04:34:10','2022-03-20 04:34:10'),(7,'layout','[\"inline\"]',3,'Botble\\Blog\\Models\\Post','2022-03-20 04:34:10','2022-03-20 04:34:10'),(8,'time_to_read','[8]',3,'Botble\\Blog\\Models\\Post','2022-03-20 04:34:11','2022-03-20 04:34:11'),(9,'comment_status','[1]',3,'Botble\\Blog\\Models\\Post','2022-03-20 04:34:11','2022-03-20 04:34:11'),(10,'video_link','[\"https:\\/\\/player.vimeo.com\\/video\\/289366685?h=b6b9d1e67b&title=0&byline=0&portrait=0\"]',4,'Botble\\Blog\\Models\\Post','2022-03-20 04:34:11','2022-03-20 04:34:11'),(11,'time_to_read','[11]',4,'Botble\\Blog\\Models\\Post','2022-03-20 04:34:11','2022-03-20 04:34:11'),(12,'comment_status','[1]',4,'Botble\\Blog\\Models\\Post','2022-03-20 04:34:11','2022-03-20 04:34:11'),(13,'video_upload_id','[\"videos\\/video1.mp4\"]',5,'Botble\\Blog\\Models\\Post','2022-03-20 04:34:11','2022-03-20 04:34:11'),(14,'time_to_read','[15]',5,'Botble\\Blog\\Models\\Post','2022-03-20 04:34:11','2022-03-20 04:34:11'),(15,'comment_status','[1]',5,'Botble\\Blog\\Models\\Post','2022-03-20 04:34:11','2022-03-20 04:34:11'),(16,'time_to_read','[12]',6,'Botble\\Blog\\Models\\Post','2022-03-20 04:34:11','2022-03-20 04:34:11'),(17,'comment_status','[1]',6,'Botble\\Blog\\Models\\Post','2022-03-20 04:34:11','2022-03-20 04:34:11'),(18,'time_to_read','[18]',7,'Botble\\Blog\\Models\\Post','2022-03-20 04:34:11','2022-03-20 04:34:11'),(19,'comment_status','[1]',7,'Botble\\Blog\\Models\\Post','2022-03-20 04:34:11','2022-03-20 04:34:11'),(20,'video_link','[\"https:\\/\\/player.vimeo.com\\/video\\/559851845?h=afc6d413c9\"]',8,'Botble\\Blog\\Models\\Post','2022-03-20 04:34:11','2022-03-20 04:34:11'),(21,'time_to_read','[16]',8,'Botble\\Blog\\Models\\Post','2022-03-20 04:34:11','2022-03-20 04:34:11'),(22,'comment_status','[1]',8,'Botble\\Blog\\Models\\Post','2022-03-20 04:34:11','2022-03-20 04:34:11'),(23,'time_to_read','[7]',9,'Botble\\Blog\\Models\\Post','2022-03-20 04:34:11','2022-03-20 04:34:11'),(24,'comment_status','[1]',9,'Botble\\Blog\\Models\\Post','2022-03-20 04:34:11','2022-03-20 04:34:11'),(25,'time_to_read','[17]',10,'Botble\\Blog\\Models\\Post','2022-03-20 04:34:11','2022-03-20 04:34:11'),(26,'comment_status','[1]',10,'Botble\\Blog\\Models\\Post','2022-03-20 04:34:11','2022-03-20 04:34:11'),(27,'time_to_read','[5]',11,'Botble\\Blog\\Models\\Post','2022-03-20 04:34:11','2022-03-20 04:34:11'),(28,'comment_status','[1]',11,'Botble\\Blog\\Models\\Post','2022-03-20 04:34:11','2022-03-20 04:34:11'),(29,'time_to_read','[7]',12,'Botble\\Blog\\Models\\Post','2022-03-20 04:34:11','2022-03-20 04:34:11'),(30,'comment_status','[1]',12,'Botble\\Blog\\Models\\Post','2022-03-20 04:34:11','2022-03-20 04:34:11'),(31,'time_to_read','[20]',13,'Botble\\Blog\\Models\\Post','2022-03-20 04:34:11','2022-03-20 04:34:11'),(32,'comment_status','[1]',13,'Botble\\Blog\\Models\\Post','2022-03-20 04:34:11','2022-03-20 04:34:11'),(33,'video_link','[\"https:\\/\\/player.vimeo.com\\/video\\/580799106?h=a8eb717af9\"]',14,'Botble\\Blog\\Models\\Post','2022-03-20 04:34:11','2022-03-20 04:34:11'),(34,'time_to_read','[13]',14,'Botble\\Blog\\Models\\Post','2022-03-20 04:34:11','2022-03-20 04:34:11'),(35,'comment_status','[1]',14,'Botble\\Blog\\Models\\Post','2022-03-20 04:34:11','2022-03-20 04:34:11'),(36,'time_to_read','[20]',15,'Botble\\Blog\\Models\\Post','2022-03-20 04:34:11','2022-03-20 04:34:11'),(37,'comment_status','[1]',15,'Botble\\Blog\\Models\\Post','2022-03-20 04:34:11','2022-03-20 04:34:11'),(38,'time_to_read','[14]',16,'Botble\\Blog\\Models\\Post','2022-03-20 04:34:11','2022-03-20 04:34:11'),(39,'comment_status','[1]',16,'Botble\\Blog\\Models\\Post','2022-03-20 04:34:11','2022-03-20 04:34:11'),(40,'time_to_read','[2]',17,'Botble\\Blog\\Models\\Post','2022-03-20 04:34:11','2022-03-20 04:34:11'),(41,'comment_status','[1]',17,'Botble\\Blog\\Models\\Post','2022-03-20 04:34:11','2022-03-20 04:34:11'),(42,'time_to_read','[20]',18,'Botble\\Blog\\Models\\Post','2022-03-20 04:34:11','2022-03-20 04:34:11'),(43,'comment_status','[1]',18,'Botble\\Blog\\Models\\Post','2022-03-20 04:34:11','2022-03-20 04:34:11'),(44,'time_to_read','[6]',19,'Botble\\Blog\\Models\\Post','2022-03-20 04:34:11','2022-03-20 04:34:11'),(45,'comment_status','[1]',19,'Botble\\Blog\\Models\\Post','2022-03-20 04:34:11','2022-03-20 04:34:11'),(46,'time_to_read','[13]',20,'Botble\\Blog\\Models\\Post','2022-03-20 04:34:12','2022-03-20 04:34:12'),(47,'comment_status','[1]',20,'Botble\\Blog\\Models\\Post','2022-03-20 04:34:12','2022-03-20 04:34:12');
/*!40000 ALTER TABLE `meta_boxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2013_04_09_032329_create_base_tables',1),(2,'2013_04_09_062329_create_revisions_table',1),(3,'2014_10_12_000000_create_users_table',1),(4,'2014_10_12_100000_create_password_resets_table',1),(5,'2016_06_01_000001_create_oauth_auth_codes_table',1),(6,'2016_06_01_000002_create_oauth_access_tokens_table',1),(7,'2016_06_01_000003_create_oauth_refresh_tokens_table',1),(8,'2016_06_01_000004_create_oauth_clients_table',1),(9,'2016_06_01_000005_create_oauth_personal_access_clients_table',1),(10,'2016_06_10_230148_create_acl_tables',1),(11,'2016_06_14_230857_create_menus_table',1),(12,'2016_06_28_221418_create_pages_table',1),(13,'2016_10_05_074239_create_setting_table',1),(14,'2016_11_28_032840_create_dashboard_widget_tables',1),(15,'2016_12_16_084601_create_widgets_table',1),(16,'2017_05_09_070343_create_media_tables',1),(17,'2017_11_03_070450_create_slug_table',1),(18,'2019_01_05_053554_create_jobs_table',1),(19,'2019_08_19_000000_create_failed_jobs_table',1),(20,'2020_11_18_150916_ads_create_ads_table',2),(21,'2021_12_02_035301_add_ads_translations_table',2),(22,'2015_06_29_025744_create_audit_history',3),(23,'2015_06_18_033822_create_blog_table',4),(24,'2021_02_16_092633_remove_default_value_for_author_type',4),(25,'2021_12_03_030600_create_blog_translations',4),(26,'2021_07_08_140130_comment_create_comment_table',5),(27,'2016_06_17_091537_create_contacts_table',6),(28,'2016_10_13_150201_create_galleries_table',7),(29,'2021_12_03_082953_create_gallery_translations',7),(30,'2016_10_03_032336_create_languages_table',8),(31,'2021_10_25_021023_fix-priority-load-for-language-advanced',9),(32,'2021_12_03_075608_create_page_translations',9),(33,'2017_10_04_140938_create_member_table',10),(34,'2017_10_24_154832_create_newsletter_table',11),(35,'2021_08_25_122708_post_collection_create_post_collection_table',12),(36,'2021_07_14_043820_add_publised_at_table_posts',13),(37,'2021_10_16_043705_pro_posts_create_favorite_posts_table',14),(38,'2021_10_16_105007_add_bookmark_posts_column_to_members_table',14),(39,'2021_11_13_010429_change_column_table_members',14),(40,'2016_05_28_112028_create_system_request_logs_table',15),(41,'2016_10_07_193005_create_translations_table',16);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletters`
--

DROP TABLE IF EXISTS `newsletters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `newsletters` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'subscribed',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletters`
--

LOCK TABLES `newsletters` WRITE;
/*!40000 ALTER TABLE `newsletters` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `client_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_tokens`
--

LOCK TABLES `oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `client_id` bigint unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_auth_codes`
--

LOCK TABLES `oauth_auth_codes` WRITE;
/*!40000 ALTER TABLE `oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_auth_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_clients`
--

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_personal_access_clients`
--

LOCK TABLES `oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_refresh_tokens`
--

LOCK TABLES `oauth_refresh_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `user_id` int NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_featured` tinyint NOT NULL DEFAULT '0',
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,'Homepage','<div>[posts-slider title=\"\" filter_by=\"featured\" limit=\"4\" include=\"\" style=\"1\"][/posts-slider]</div><div>[posts-slider title=\"Editor\'s picked\" filter_by=\"posts-collection\" posts_collection_id=\"1\" limit=6 style=\"2\" description=\"The featured articles are selected by experienced editors. It is also based on the reader\'s rating. These posts have a lot of interest.\"][/posts-slider]</div><div>[recent-posts title=\"Recent posts\" subtitle=\"Latest\" limit=\"3\" background_style=\"background-white\" show_follow_us_section=\"1\" tab_post_limit=\"4\" ads_location=\"bottom-sidebar-ads\"][/recent-posts]</div><div>[videos-posts title=\"Latest Videos\" subtitle=\"In motion\"][/videos-posts]</div><div>[categories-tab-posts title=\"Popular\" subtitle=\"P\" limit=\"5\" categories_ids=\"1,2,3,4\" show_follow_us_section=\"1\" ads_location=\"top-sidebar-ads\"][/categories-tab-posts]</div><div>[most-comments title=\"Most comments\" limit=\"8\" subtitle=\"M\"][/most-comments]</div><div>[posts-collection title=\"Recommended\" subtitle=\"R\" limit=\"4\" posts_collection_id=\"2\" background_style=\"background-white\"][/posts-collection]</div><div>[theme-galleries title=\"@ OUR GALLERIES\" limit=\"7\" subtitle=\"O\"][/theme-galleries]</div>',1,NULL,'homepage',0,NULL,'published','2022-03-20 04:34:03','2022-03-20 04:34:03'),(2,'Home 2','<div>[posts-slider filter_by=\"featured\" limit=\"6\" style=\"3\"][/posts-slider]</div><div>[categories-tab-posts title=\"Popular\" subtitle=\"P\" limit=\"5\" categories_ids=\"1,2,3,4\" show_follow_us_section=\"1\" ads_location=\"top-sidebar-ads\"][/categories-tab-posts]</div><div>[most-comments title=\"Most comments\" limit=\"8\" subtitle=\"M\"][/most-comments]</div><div>[videos-posts title=\"Latest Videos\" subtitle=\"In motion\"][/videos-posts]</div><div>[posts-slider title=\"Editor\'s picked\" filter_by=\"posts-collection\" posts_collection_id=\"1\" limit=6 style=\"2\" description=\"The featured articles are selected by experienced editors. It is also based on the reader\'s rating. These posts have a lot of interest.\"][/posts-slider]</div><div>[recent-posts title=\"Recent posts\" subtitle=\"Latest\" limit=\"3\" background_style=\"background-white\" show_follow_us_section=\"1\" tab_post_limit=\"4\" ads_location=\"bottom-sidebar-ads\"][/recent-posts]</div>',1,NULL,'homepage2',0,NULL,'published','2022-03-20 04:34:03','2022-03-20 04:34:03'),(3,'Home 3','<div>[posts-slider filter_by=\"featured\" limit=\"6\" style=\"4\"][/posts-slider]</div><div>[posts-grid title=\"Featured Posts\" subtitle=\"News\" limit=\"6\" order_by=\"views\" order=\"desc\"][/posts-grid]</div><div>[most-comments title=\"Most comments\" limit=\"8\" subtitle=\"M\"][/most-comments]</div><div>[videos-posts title=\"Latest Videos\" subtitle=\"In motion\"][/videos-posts]</div><div>[posts-slider title=\"Editor\'s picked\" filter_by=\"posts-collection\" posts_collection_id=\"1\" limit=6 style=\"2\" description=\"The featured articles are selected by experienced editors. It is also based on the reader\'s rating. These posts have a lot of interest.\"][/posts-slider]</div><div>[recent-posts title=\"Recent posts\" subtitle=\"Latest\" limit=\"3\" background_style=\"background-white\" show_follow_us_section=\"1\" tab_post_limit=\"4\" ads_location=\"bottom-sidebar-ads\"][/recent-posts]</div>',1,NULL,'homepage2',0,NULL,'published','2022-03-20 04:34:03','2022-03-20 04:34:03'),(4,'Blog','<div>[posts-listing layout=\"list\"][/posts-listing]</div>',1,NULL,'default',0,NULL,'published','2022-03-20 04:34:03','2022-03-20 04:34:03'),(5,'Category List','<div>[posts-listing layout=\"list\"][/posts-listing]</div>',1,NULL,'no-breadcrumbs',0,NULL,'published','2022-03-20 04:34:03','2022-03-20 04:34:03'),(6,'Category grid','<div>[posts-listing layout=\"grid\"][/posts-listing]</div>',1,NULL,'full',0,NULL,'published','2022-03-20 04:34:03','2022-03-20 04:34:03'),(7,'Category metro','<div>[posts-listing layout=\"metro\"][/posts-listing]</div>',1,NULL,'full',0,NULL,'published','2022-03-20 04:34:03','2022-03-20 04:34:03'),(8,'Contact','<div>[contact-form title=\"Get in Touch\"][/contact-form]</div><h3>Directions</h3><div>[google-map]North Link Building, 10 Admiralty Street, 757695 Singapore[/google-map]</div>',1,NULL,'default',0,NULL,'published','2022-03-20 04:34:03','2022-03-20 04:34:03'),(9,'About Us','<div class=\"raw-html-embed\"><div class=\"row\">\n    <div class=\"col-md-12 col-sm-12\">\n        <div class=\"single-excerpt\">\n            <p class=\"font-large\">Tolerably much and ouch the in began alas more ouch some then accommodating flimsy wholeheartedly after hello slightly the that cow pouted much a goodness bound rebuilt poetically jaguar groundhog</p>\n        </div>\n        <div class=\"entry-main-content\">\n            <h2>Computer inside</h2>\n            <hr class=\"wp-block-separator is-style-wide\">\n            <div class=\"wp-block-image\">\n                <figure class=\"alignleft is-resized\">\n                    <img class=\"border-radius-5\" src=\"/themes/ultra/images/thumbnail-14.jpg\">\n                </figure>\n            </div>\n            <p>Less lion goodness that euphemistically robin expeditiously bluebird smugly scratched far while thus cackled sheepishly rigid after due one assenting regarding censorious while occasional or this more crane went more as\n                this less much amid overhung anathematic because much held one exuberantly sheep goodness so where rat wry well concomitantly.</p>\n            <h5>What\'s next?</h5>\n            <p>Pouted flirtatiously as beaver beheld above forward energetic across this jeepers beneficently cockily less a the raucously that magic upheld far so the this where crud then below after jeez enchanting drunkenly more much\n                wow callously irrespective limpet.</p>\n            <hr class=\"wp-block-separator is-style-dots\">\n            <p>Other yet this hazardous oh the until brave close towards stupidly euphemistically firefly boa some more underneath circa yet on as wow above ripe or blubbered one cobra bore ouch and this held ably one hence</p>\n            <h2>Conclusion</h2>\n            <hr class=\"wp-block-separator is-style-wide\">\n            <p>Alexe more gulped much garrulous a yikes earthworm wiped because goodness bet mongoose that along accommodatingly tortoise indecisively admirable but shark dear some and unwillingly before far vindictive less much this\n                on more less flexed far woolly from following glanced resolute unlike far this alongside against icily beyond flabby accidental.</p>\n\n\n            <h2>Design is future</h2>\n            <hr class=\"wp-block-separator is-style-wide\">\n            <p>Uninhibited carnally hired played in whimpered dear gorilla koala depending and much yikes off far quetzal goodness and from for grimaced goodness unaccountably and meadowlark near unblushingly crucial scallop tightly neurotic\n                hungrily some and dear furiously this apart.</p>\n            <p>Spluttered narrowly yikes left moth in yikes bowed this that grizzly much hello on spoon-fed that alas rethought much decently richly and wow against the frequent fluidly at formidable acceptably flapped besides and much\n                circa far over the bucolically hey precarious goldfinch mastodon goodness gnashed a jellyfish and one however because.</p>\n            <figure class=\"wp-block-gallery columns-3\">\n                <ul class=\"blocks-gallery-grid\">\n                    <li class=\"blocks-gallery-item\">\n                        <a href=\"#\"><img class=\"border-radius-5\" src=\"/themes/ultra/images/thumbnail-1.jpg\" alt=\"\"></a>\n                    </li>\n                    <li class=\"blocks-gallery-item\">\n                        <a href=\"#\"><img class=\"border-radius-5\" src=\"/themes/ultra/images/thumbnail-2.jpg\" alt=\"\"></a>\n                    </li>\n                    <li class=\"blocks-gallery-item\">\n                        <a href=\"#\"><img class=\"border-radius-5\" src=\"/themes/ultra/images/thumbnail-10.jpg\" alt=\"\"></a>\n                    </li>\n                </ul>\n            </figure>\n            <p>Laconic overheard dear woodchuck wow this outrageously taut beaver hey hello far meadowlark imitatively egregiously hugged that yikes minimally unanimous pouted flirtatiously as beaver beheld above forward energetic across\n                this jeepers beneficently cockily less a the raucously that magic upheld far so the this where crud then below after jeez enchanting drunkenly more much wow callously irrespective limpet.</p>\n            <hr class=\"wp-block-separator is-style-dots\">\n            <p>Scallop or far crud plain remarkably far by thus far iguana lewd precociously and and less rattlesnake contrary caustic wow this near alas and next and pled the yikes articulate about as less cackled dalmatian in much less\n                well jeering for the thanks blindly sentimental whimpered less across objectively fanciful grimaced wildly some wow and rose jeepers outgrew lugubrious luridly irrationally attractively dachshund.</p>\n            <blockquote class=\"wp-block-quote is-style-large\">\n                <p>The advance of technology is based on making it fit in so that you don\'t really even notice it, so it\'s part of everyday life.</p><cite>B. Johnso</cite>\n            </blockquote>\n            <p class=\"text-center\">\n                <a href=\"#\"><img class=\"d-inline\" src=\"assets/imgs/ads-4.jpg\" alt=\"\"></a>\n            </p>\n        </div>\n    </div>\n</div>\n</div><h3>Address</h3><div>[google-map]North Link Building, 10 Admiralty Street, 757695 Singapore[/google-map]</div>',1,NULL,'default',0,NULL,'published','2022-03-20 04:34:03','2022-03-20 04:34:03'),(10,'Cookie Policy','<h3>EU Cookie Consent</h3><p>To use this website we are using Cookies and collecting some Data. To be compliant with the EU GDPR we give you to choose if you allow us to use certain Cookies and to collect some Data.</p><h4>Essential Data</h4><p>The Essential Data is needed to run the Site you are visiting technically. You can not deactivate them.</p><p>- Session Cookie: PHP uses a Cookie to identify user sessions. Without this Cookie the Website is not working.</p><p>- XSRF-Token Cookie: Laravel automatically generates a CSRF \"token\" for each active user session managed by the application. This token is used to verify that the authenticated user is the one actually making the requests to the application.</p>',1,NULL,'default',0,NULL,'published','2022-03-20 04:34:03','2022-03-20 04:34:03');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages_translations`
--

DROP TABLE IF EXISTS `pages_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pages_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`pages_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages_translations`
--

LOCK TABLES `pages_translations` WRITE;
/*!40000 ALTER TABLE `pages_translations` DISABLE KEYS */;
INSERT INTO `pages_translations` VALUES ('vi',1,'Trang chủ',NULL,'<div>[posts-slider title=\"\" filter_by=\"featured\" limit=\"4\" include=\"\" style=\"1\"][/posts-slider]</div><div>[posts-slider title=\"Editor\'s picked\" filter_by=\"posts-collection\" posts_collection_id=\"1\" limit=6 style=\"2\" description=\"The featured articles are selected by experienced editors. It is also based on the reader\'s rating. These posts have a lot of interest.\"][/posts-slider]</div><div>[recent-posts title=\"Bài viết mới\" subtitle=\"Latest\" limit=\"3\" show_follow_us_section=\"1\"][/recent-posts]</div><div>[categories-tab-posts title=\"Bài viết được quan tâm\" subtitle=\"P\" limit=\"5\" categories_ids=\"1,2,3,4\" show_follow_us_section=\"1\" ads_location=\"top-sidebar-ads\"][/categories-tab-posts]</div><div>[posts-grid title=\"Bài viết nổi bật\" subtitle=\"News\" categories=\"\" categories_exclude=\"\" style=\"2\" limit=\"6\"][/posts-grid]</div><div>[theme-galleries title=\"@ OUR GALLERIES\" subtitle=\"In motion\" limit=\"7\"][/theme-galleries]</div>'),('vi',2,'Trang chủ 2',NULL,'<div>[posts-slider filter_by=\"featured\" limit=\"6\" style=\"3\"][/posts-slider]</div><div>[categories-tab-posts title=\"Popular\" subtitle=\"P\" limit=\"5\" categories_ids=\"1,2,3,4\" show_follow_us_section=\"1\" ads_location=\"top-sidebar-ads\"][/categories-tab-posts]</div><div>[most-comments title=\"Most comments\" limit=\"8\" subtitle=\"M\"][/most-comments]</div><div>[videos-posts title=\"Latest Videos\" subtitle=\"In motion\"][/videos-posts]</div><div>[posts-slider title=\"Editor\'s picked\" filter_by=\"posts-collection\" posts_collection_id=\"1\" limit=6 style=\"2\" description=\"The featured articles are selected by experienced editors. It is also based on the reader\'s rating. These posts have a lot of interest.\"][/posts-slider]</div><div>[recent-posts title=\"Recent posts\" subtitle=\"Latest\" limit=\"3\" background_style=\"background-white\" show_follow_us_section=\"1\" tab_post_limit=\"4\" ads_location=\"bottom-sidebar-ads\"][/recent-posts]</div>'),('vi',3,'Trang chủ 3',NULL,'<div>[posts-slider filter_by=\"featured\" limit=\"6\" style=\"4\"][/posts-slider]</div><div>[posts-grid title=\"Featured Posts\" subtitle=\"News\" limit=\"6\" order_by=\"views\" order=\"desc\"][/posts-grid]</div><div>[most-comments title=\"Most comments\" limit=\"8\" subtitle=\"M\"][/most-comments]</div><div>[videos-posts title=\"Latest Videos\" subtitle=\"In motion\"][/videos-posts]</div><div>[posts-slider title=\"Editor\'s picked\" filter_by=\"posts-collection\" posts_collection_id=\"1\" limit=6 style=\"2\" description=\"The featured articles are selected by experienced editors. It is also based on the reader\'s rating. These posts have a lot of interest.\"][/posts-slider]</div><div>[recent-posts title=\"Recent posts\" subtitle=\"Latest\" limit=\"3\" background_style=\"background-white\" show_follow_us_section=\"1\" tab_post_limit=\"4\" ads_location=\"bottom-sidebar-ads\"][/recent-posts]</div>'),('vi',4,'Tin tức',NULL,'<div>[categories-big limit=\"12\"][/categories-big]</div>'),('vi',5,'Tin tức danh sách',NULL,'<div>[posts-listing layout=\"list\"][/posts-listing]</div>'),('vi',6,'Tin tức dạng cột',NULL,'<div>[posts-listing layout=\"grid\"][/posts-listing]</div>'),('vi',7,'Tin tức metro',NULL,'<div>[posts-listing layout=\"metro\"][/posts-listing]</div>'),('vi',8,'Liên hệ',NULL,'<div>[contact-form title=\"Liên hệ\"][/contact-form]</div><h3>Địa chỉ</h3><div>[google-map]North Link Building, 10 Admiralty Street, 757695 Singapore[/google-map]</div>'),('vi',9,'Về chúng tôi',NULL,'<div class=\"raw-html-embed\"><div class=\"row\">\n    <div class=\"col-md-12 col-sm-12\">\n        <div class=\"single-excerpt\">\n            <p class=\"font-large\">Người ta né tránh nhắc đến Chúa Kito khi nói đến mốc lịch sử bằng cách nói Trước công nguyên và sau công nguyên. Nhưng nguyên tiếng anh: Before Chirst, After Chirst – trước Chúa Kito, sau Chúa Kito – người ta sợ lịch sử của Kito giáo. Đó là lời chia sẻ của cha đặc trách Gioan trong Thánh lễ thường kì Cộng đoàn sinh viên Công giáo y dược vào lúc 19h15’, ngày 11.05.2017 tại đền thánh Gierado, Giáo xứ Thái Hà.</p>\n        </div>\n        <div class=\"entry-main-content\">\n            <h2>Cuộc sống là những phép màu</h2>\n            <hr class=\"wp-block-separator is-style-wide\">\n            <div class=\"wp-block-image\">\n                <figure class=\"alignleft is-resized\">\n                    <img class=\"border-radius-5\" src=\"/themes/ultra/images/thumbnail-14.jpg\">\n                </figure>\n            </div>\n            <p>Khởi đầu bài giảng của mình cha nói đến một trong những khó khăn lớn nhất Giáo Hội nói chung và người tín hữu nói riêng đó chính là niềm tin vào Thiên Chúa. Chính khủng hoảng niềm tin gây nên chiến tranh, gây nên thù hận và chết chóc. Lòng tin không chỉ ảnh hưởng lên cá nhân mà thôi nhưng lên toàn thế giới. Hôm nay, Chúa cho chúng ta thấy lòng tin là khởi đầu, là mấu chốt để con người đứng vững giữa trăm chiều thử thách.</p>\n            <h5>Ý nghĩa là gì?</h5>\n            <p>Hai bài đọc hôm nay đều đi từ lịch sử, Chúa Giesu tiên báo kẻ sẽ nộp thầy. Ngài chọn Giuda không phải chọn nhầm, nhưng Ngài nói rõ trong bài Tin Mừng rằng lời kinh thánh phải được ứng nghiệm: “Kẻ giơ tay chấm chung một đĩa với con lại giơ gót đạp con”. Trong bài đọc một, Phaolo nói về Đavit để ứng nghiệm lời Kinh thánh đã nói, để anh chị em Do thái nhận ra được lời tiên báo qua lịch sử là chúa Giesu.</p>\n            <hr class=\"wp-block-separator is-style-dots\">\n            <p>Để có được lòng tin nơi con người, Chúa Giesu đã khai mào trong một chương trình lịch sử dài tập. Lịch sử Cựu ước loan báo đúng với những gì đã xảy ra với Chúa Giesu Kito. Một triết gia người Pháp nói rằng: “Kito giáo có một nền tảng đức tin vững chắc đó là lịch sử, nhưng Kito giáo quên đi điểm quan trọng này và ngày nay đi nặng về phía thần học”.</p>\n            <h2>Kết luận</h2>\n            <hr class=\"wp-block-separator is-style-wide\">\n            <p>Cha nhắc lại: Kito Giáo cắm rễ sâu, trải dài và được ứng nghiệm trong lịch sử thánh kinh ngang qua những con người, nơi chốn, địa điểm cụ thể. Nhìn lại lịch sử, các ngày lễ xã hội, ngày nghỉ… đều liên quan đến Kito giáo và xuất phát từ Kito giáo.</p>\n\n\n            <h2>Tương lai</h2>\n            <hr class=\"wp-block-separator is-style-wide\">\n            <p>Cha nói đến biến cố Đức Mẹ hiện ra tại Fatima 100 năm là một biến cố lịch sử có thời gian, không gian, nhân vật và sứ điệp cụ thể không phải con người tự dụng nên hay hoang tưởng.</p>\n            <p>Niềm tin của mỗi chúng ta phải dựa vào lịch sử chứ không phải mơ hồ. Khi nhìn lại quá khứ ta biết rằng lòng tin đó đã được Thiên Chúa khai mào từ rất sớm. Các thánh Tông đồ đã đứng trên bình diện lịch sự để minh chứng niềm tin của con người vào Giave Thiên Chúa.</p>\n            <figure class=\"wp-block-gallery columns-3\">\n                <ul class=\"blocks-gallery-grid\">\n                    <li class=\"blocks-gallery-item\">\n                        <a href=\"#\"><img class=\"border-radius-5\" src=\"/themes/ultra/images/thumbnail-1.jpg\" alt=\"\"></a>\n                    </li>\n                    <li class=\"blocks-gallery-item\">\n                        <a href=\"#\"><img class=\"border-radius-5\" src=\"/themes/ultra/images/thumbnail-2.jpg\" alt=\"\"></a>\n                    </li>\n                    <li class=\"blocks-gallery-item\">\n                        <a href=\"#\"><img class=\"border-radius-5\" src=\"/themes/ultra/images/thumbnail-10.jpg\" alt=\"\"></a>\n                    </li>\n                </ul>\n            </figure>\n            <p>Nhiều người thời nay biết lịch sử nhưng không biết Chúa Kito là ai vì họ né tránh Chúa Giesu. Chúa Giesu đi vào lịch sử để tỏ cho con người cùng đích của sự sống là gì và Thiên Chúa là ai cùng những lời tiên báo để củng cố lòng tin cho con người.</p>\n            <hr class=\"wp-block-separator is-style-dots\">\n           <blockquote class=\"wp-block-quote is-style-large\">\n                <p>Sự tiến bộ của công nghệ dựa trên việc làm cho nó phù hợp để bạn thậm chí không thực sự nhận thấy nó, vì vậy nó là một phần của cuộc sống hàng ngày.</p><cite>B. Johnso</cite>\n            </blockquote>\n            <p class=\"text-center\">\n                <a href=\"#\"><img class=\"d-inline\" src=\"assets/imgs/ads-4.jpg\" alt=\"\"></a>\n            </p>\n        </div>\n    </div>\n</div>\n</div>'),('vi',10,'Cookie Policy',NULL,'<h3>EU Cookie Consent</h3><p>Để sử dụng trang web này, chúng tôi đang sử dụng Cookie và thu thập một số Dữ liệu. Để tuân thủ GDPR của Liên minh Châu Âu, chúng tôi cho bạn lựa chọn nếu bạn cho phép chúng tôi sử dụng một số Cookie nhất định và thu thập một số Dữ liệu.</p><h4>Dữ liệu cần thiết</h4><p>Dữ liệu cần thiết là cần thiết để chạy Trang web bạn đang truy cập về mặt kỹ thuật. Bạn không thể hủy kích hoạt chúng.</p><p>- Session Cookie: PHP sử dụng Cookie để xác định phiên của người dùng. Nếu không có Cookie này, trang web sẽ không hoạt động.</p><p>- XSRF-Token Cookie: Laravel tự động tạo \"token\" CSRF cho mỗi phiên người dùng đang hoạt động do ứng dụng quản lý. Token này được sử dụng để xác minh rằng người dùng đã xác thực là người thực sự đưa ra yêu cầu đối với ứng dụng.</p>');
/*!40000 ALTER TABLE `pages_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_categories`
--

DROP TABLE IF EXISTS `post_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int unsigned NOT NULL,
  `post_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_categories`
--

LOCK TABLES `post_categories` WRITE;
/*!40000 ALTER TABLE `post_categories` DISABLE KEYS */;
INSERT INTO `post_categories` VALUES (1,1,1),(2,2,1),(3,3,1),(4,4,1),(5,5,1),(6,6,1),(7,7,1),(8,1,2),(9,2,2),(10,3,2),(11,4,2),(12,5,2),(13,6,2),(14,7,2),(15,1,3),(16,2,3),(17,3,3),(18,4,3),(19,5,3),(20,6,3),(21,7,3),(22,1,4),(23,2,4),(24,3,4),(25,4,4),(26,5,4),(27,6,4),(28,7,4),(29,1,5),(30,2,5),(31,3,5),(32,4,5),(33,5,5),(34,6,5),(35,7,5),(36,1,6),(37,2,6),(38,3,6),(39,4,6),(40,5,6),(41,6,6),(42,7,6),(43,1,7),(44,2,7),(45,3,7),(46,4,7),(47,5,7),(48,6,7),(49,7,7),(50,1,8),(51,2,8),(52,3,8),(53,4,8),(54,5,8),(55,6,8),(56,7,8),(57,1,9),(58,2,9),(59,3,9),(60,4,9),(61,5,9),(62,6,9),(63,7,9),(64,1,10),(65,2,10),(66,3,10),(67,4,10),(68,5,10),(69,6,10),(70,7,10),(71,1,11),(72,2,11),(73,3,11),(74,4,11),(75,5,11),(76,6,11),(77,7,11),(78,1,12),(79,2,12),(80,3,12),(81,4,12),(82,5,12),(83,6,12),(84,7,12),(85,1,13),(86,2,13),(87,3,13),(88,4,13),(89,5,13),(90,6,13),(91,7,13),(92,1,14),(93,2,14),(94,3,14),(95,4,14),(96,5,14),(97,6,14),(98,7,14),(99,1,15),(100,2,15),(101,3,15),(102,4,15),(103,5,15),(104,6,15),(105,7,15),(106,1,16),(107,2,16),(108,3,16),(109,4,16),(110,5,16),(111,6,16),(112,7,16),(113,1,17),(114,2,17),(115,3,17),(116,4,17),(117,5,17),(118,6,17),(119,7,17),(120,1,18),(121,2,18),(122,3,18),(123,4,18),(124,5,18),(125,6,18),(126,7,18),(127,1,19),(128,2,19),(129,3,19),(130,4,19),(131,5,19),(132,6,19),(133,7,19),(134,1,20),(135,2,20),(136,3,20),(137,4,20),(138,5,20),(139,6,20),(140,7,20);
/*!40000 ALTER TABLE `post_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_collections`
--

DROP TABLE IF EXISTS `post_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_collections` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_collections`
--

LOCK TABLES `post_collections` WRITE;
/*!40000 ALTER TABLE `post_collections` DISABLE KEYS */;
INSERT INTO `post_collections` VALUES (1,'Editor\'s Picked',NULL,NULL,'published','2022-03-20 04:34:16','2022-03-20 04:34:16'),(2,'Recommended Posts',NULL,NULL,'published','2022-03-20 04:34:16','2022-03-20 04:34:16'),(3,'Bài viết hay',NULL,NULL,'published','2022-03-20 04:34:16','2022-03-20 04:34:16'),(4,'Recommended Posts',NULL,NULL,'published','2022-03-20 04:34:16','2022-03-20 04:34:16');
/*!40000 ALTER TABLE `post_collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_collections_posts`
--

DROP TABLE IF EXISTS `post_collections_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_collections_posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `post_collection_id` int unsigned NOT NULL,
  `post_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_collections_posts`
--

LOCK TABLES `post_collections_posts` WRITE;
/*!40000 ALTER TABLE `post_collections_posts` DISABLE KEYS */;
INSERT INTO `post_collections_posts` VALUES (1,1,12),(2,1,3),(3,1,5),(4,1,1),(5,1,7),(6,1,9),(7,2,15),(8,2,4),(9,2,2),(10,2,1),(11,2,10),(12,3,20),(13,3,19),(14,3,21),(15,3,31),(16,3,32),(17,4,22),(18,4,24),(19,4,25),(20,4,29),(21,4,30);
/*!40000 ALTER TABLE `post_collections_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_tags`
--

DROP TABLE IF EXISTS `post_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tag_id` int unsigned NOT NULL,
  `post_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_tags`
--

LOCK TABLES `post_tags` WRITE;
/*!40000 ALTER TABLE `post_tags` DISABLE KEYS */;
INSERT INTO `post_tags` VALUES (1,1,1),(2,2,1),(3,3,1),(4,4,1),(5,5,1),(6,6,1),(7,7,1),(8,1,2),(9,2,2),(10,3,2),(11,4,2),(12,5,2),(13,6,2),(14,7,2),(15,1,3),(16,2,3),(17,3,3),(18,4,3),(19,5,3),(20,6,3),(21,7,3),(22,1,4),(23,2,4),(24,3,4),(25,4,4),(26,5,4),(27,6,4),(28,7,4),(29,1,5),(30,2,5),(31,3,5),(32,4,5),(33,5,5),(34,6,5),(35,7,5),(36,1,6),(37,2,6),(38,3,6),(39,4,6),(40,5,6),(41,6,6),(42,7,6),(43,1,7),(44,2,7),(45,3,7),(46,4,7),(47,5,7),(48,6,7),(49,7,7),(50,1,8),(51,2,8),(52,3,8),(53,4,8),(54,5,8),(55,6,8),(56,7,8),(57,1,9),(58,2,9),(59,3,9),(60,4,9),(61,5,9),(62,6,9),(63,7,9),(64,1,10),(65,2,10),(66,3,10),(67,4,10),(68,5,10),(69,6,10),(70,7,10),(71,1,11),(72,2,11),(73,3,11),(74,4,11),(75,5,11),(76,6,11),(77,7,11),(78,1,12),(79,2,12),(80,3,12),(81,4,12),(82,5,12),(83,6,12),(84,7,12),(85,1,13),(86,2,13),(87,3,13),(88,4,13),(89,5,13),(90,6,13),(91,7,13),(92,1,14),(93,2,14),(94,3,14),(95,4,14),(96,5,14),(97,6,14),(98,7,14),(99,1,15),(100,2,15),(101,3,15),(102,4,15),(103,5,15),(104,6,15),(105,7,15),(106,1,16),(107,2,16),(108,3,16),(109,4,16),(110,5,16),(111,6,16),(112,7,16),(113,1,17),(114,2,17),(115,3,17),(116,4,17),(117,5,17),(118,6,17),(119,7,17),(120,1,18),(121,2,18),(122,3,18),(123,4,18),(124,5,18),(125,6,18),(126,7,18),(127,1,19),(128,2,19),(129,3,19),(130,4,19),(131,5,19),(132,6,19),(133,7,19),(134,1,20),(135,2,20),(136,3,20),(137,4,20),(138,5,20),(139,6,20),(140,7,20);
/*!40000 ALTER TABLE `post_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `author_id` int NOT NULL,
  `author_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` int unsigned NOT NULL DEFAULT '0',
  `format_type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `published_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'This Year Enjoy the Color of Festival with Amazing Holi Gifts Ideas','Rerum atque est et quis veritatis. Aut et et exercitationem. Dolorem ut enim accusantium magni corrupti voluptatem repellendus. Doloribus cum doloribus ut et odio cum ea.',NULL,'published',1,'Botble\\Member\\Models\\Member',0,'news/news-1.jpg',1791,'video','2022-03-20 04:34:10','2022-03-20 04:34:13',NULL),(2,'The World Caters to Average People and Mediocre Lifestyles','Animi quos voluptate architecto voluptas. Nostrum tempora eaque excepturi aliquid minus. Vitae voluptatum ipsam natus illo.','<h2>Just at this corner--No, tie.</h2><p>Mouse, do you know what they\'re about!\' \'Read them,\' said the Mouse, frowning, but very politely: \'Did you say it.\' \'That\'s nothing to do: once or twice, and shook itself. Then it got down off the mushroom, and crawled away in the sun. (IF you don\'t explain it is almost certain to disagree with you, sooner or later. However, this bottle does. I do wonder what Latitude was, or Longitude either, but thought they were all talking at once, and ran till she shook the house, \"Let us both go to on the other side. The further off from England the nearer is to give the prizes?\' quite a commotion in the other: the Duchess and the executioner went off like an arrow. The Cat\'s head began fading away the moment they saw Alice coming. \'There\'s PLENTY of room!\' said Alice sharply, for she felt very lonely and low-spirited. In a minute or two to think to herself, in a louder tone. \'ARE you to offer it,\' said the Hatter. \'Does YOUR watch tell you what year it is?\' \'Of course it is,\' said the King.</p><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-5-600x421.jpg\"></p><p>Gryphon said to the voice of thunder, and people began running about in the middle of one! There ought to be treated with respect. \'Cheshire Puss,\' she began, rather timidly, saying to her very much what would be as well say,\' added the Gryphon; and then unrolled the parchment scroll, and read as follows:-- \'The Queen will hear you! You see, she came upon a time she heard one of the house, \"Let us both go to law: I will tell you his history,\' As they walked off together, Alice heard the.</p><h2>Footman, \'and that for two.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-9-600x421.jpg\"></p><p>King. Here one of them attempted to explain the paper. \'If there\'s no harm in trying.\' So she began fancying the sort of use in waiting by the fire, stirring a large piece out of sight: then it chuckled. \'What fun!\' said the Cat: \'we\'re all mad here. I\'m mad. You\'re mad.\' \'How do you know that cats COULD grin.\' \'They all can,\' said the Caterpillar. \'Well, perhaps you haven\'t found it very nice, (it had, in fact, I didn\'t know how to get in?\' she repeated, aloud. \'I must be a book written about me, that there was silence for some while in silence. Alice noticed with some severity; \'it\'s very rude.\' The Hatter was the Rabbit hastily interrupted. \'There\'s a great interest in questions of eating and drinking. \'They lived on treacle,\' said the Gryphon, \'you first form into a pig, and she could not answer without a cat! It\'s the most confusing thing I ever saw one that size? Why, it fills the whole cause, and condemn you to learn?\' \'Well, there was no use denying it. I suppose it were.</p><h2>There was a little hot tea.</h2><h3>How she longed to get out.</h3><p>Alice, who always took a minute or two she stood watching them, and then turned to the table, half hoping she might as well as she could do to ask: perhaps I shall be a queer thing, to be two people! Why, there\'s hardly enough of it in time,\' said the King said gravely, \'and go on with the bones and the sounds will take care of themselves.\"\' \'How fond she is of yours.\"\' \'Oh, I beg your pardon!\' cried Alice hastily, afraid that it ought to tell its age, there was a sound of a muchness?\'.</p><h3>And he added in an offended.</h3><p>I do hope it\'ll make me larger, it must be the right height to rest herself, and nibbled a little while, however, she again heard a little hot tea upon its forehead (the position in which you usually see Shakespeare, in the common way. So they got their tails in their paws. \'And how do you know that Cheshire cats always grinned; in fact, I didn\'t know how to get out at all the arches are gone from this morning,\' said Alice indignantly, and she grew no larger: still it had gone. \'Well! I\'ve.</p><h3>Duchess and the sounds will.</h3><p>I mentioned before, And have grown most uncommonly fat; Yet you turned a back-somersault in at the cook, and a Dodo, a Lory and an Eaglet, and several other curious creatures. Alice led the way, was the Rabbit asked. \'No, I give it up,\' Alice replied: \'what\'s the answer?\' \'I haven\'t opened it yet,\' said the Pigeon; \'but if you\'ve seen them so shiny?\' Alice looked all round the refreshments!\' But there seemed to quiver all over their slates; \'but it sounds uncommon nonsense.\' Alice said to the.</p><h3>Queen, who were giving it a.</h3><p>Cat, and vanished again. Alice waited patiently until it chose to speak again. In a minute or two, it was all dark overhead; before her was another puzzling question; and as it lasted.) \'Then the eleventh day must have prizes.\' \'But who has won?\' This question the Dodo had paused as if she was playing against herself, for she was ready to talk nonsense. The Queen\'s argument was, that if something wasn\'t done about it just at first, perhaps,\' said the Mock Turtle. \'Seals, turtles, salmon, and.</p><h2>However, when they passed.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-17-600x421.jpg\"></p><p>I beat him when he sneezes: He only does it to make out which were the verses the White Rabbit, who said in a thick wood. \'The first thing she heard her sentence three of the baby, the shriek of the others took the hookah into its eyes were nearly out of the sense, and the sounds will take care of the trees behind him. \'--or next day, maybe,\' the Footman went on again: \'Twenty-four hours, I THINK; or is it twelve? I--\' \'Oh, don\'t bother ME,\' said Alice indignantly. \'Let me alone!\' \'Serpent, I.</p>','published',4,'Botble\\Member\\Models\\Member',1,'news/news-2.jpg',1948,'default','2022-03-20 04:34:10','2022-03-20 04:34:13',NULL),(3,'Not a bit of hesitation, you better think twice','Et et qui adipisci nostrum maiores ut. Id neque nam facere possimus facilis quia. Dolorem modi optio at recusandae ut sequi. Ducimus recusandae commodi debitis autem similique.','<h2>His voice has a timid voice.</h2><p>March Hare interrupted in a very hopeful tone though), \'I won\'t indeed!\' said the March Hare,) \'--it was at in all directions, \'just like a telescope! I think I should think very likely to eat the comfits: this caused some noise and confusion, as the Rabbit, and had just begun to repeat it, but her head was so much surprised, that for the end of the party sat silent for a minute or two sobs choked his voice. \'Same as if it began ordering people about like mad things all this time, sat down again into its mouth open, gazing up into a pig, my dear,\' said Alice, \'it\'s very rude.\' The Hatter looked at the top of her knowledge. \'Just think of anything else. CHAPTER V. Advice from a Caterpillar The Caterpillar was the White Rabbit blew three blasts on the whole cause, and condemn you to offer it,\' said Alice. \'Well, I can\'t show it you myself,\' the Mock Turtle went on again: \'Twenty-four hours, I THINK; or is it I can\'t remember,\' said the King. \'Shan\'t,\' said the Caterpillar took the.</p><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-4-600x421.jpg\"></p><p>I to do it! Oh dear! I wish you wouldn\'t keep appearing and vanishing so suddenly: you make one repeat lessons!\' thought Alice; but she remembered trying to invent something!\' \'I--I\'m a little of her own children. \'How should I know?\' said Alice, \'and those twelve creatures,\' (she was obliged to write out a new pair of white kid gloves while she was ready to agree to everything that was lying under the hedge. In another minute the whole pack of cards: the Knave of Hearts, and I shall never get.</p><h2>Improve his shining tail.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-14-600x421.jpg\"></p><p>March Hare had just begun to dream that she was now the right distance--but then I wonder if I know I do!\' said Alice timidly. \'Would you tell me,\' said Alice, whose thoughts were still running on the other side. The further off from England the nearer is to give the hedgehog a blow with its eyelids, so he did,\' said the Cat, and vanished. Alice was beginning very angrily, but the Dodo managed it.) First it marked out a history of the words have got in as well,\' the Hatter and the sound of many footsteps, and Alice thought she might as well as she went on so long that they must needs come wriggling down from the shock of being upset, and their slates and pencils had been looking at it uneasily, shaking it every now and then the different branches of Arithmetic--Ambition, Distraction, Uglification, and Derision.\' \'I never went to school every day--\' \'I\'VE been to her, one on each side, and opened their eyes and mouths so VERY nearly at the top of its mouth, and addressed her in a.</p><h2>Hatter. He had been for some.</h2><h3>Where are you?\' And then a.</h3><p>By the time he was obliged to say which), and they lived at the Footman\'s head: it just missed her. Alice caught the baby joined):-- \'Wow! wow! wow!\' \'Here! you may nurse it a very small cake, on which the cook had disappeared. \'Never mind!\' said the Cat, and vanished. Alice was not even get her head down to her that she had looked under it, and found in it a minute or two, and the roof of the party sat silent for a minute or two, and the sounds will take care of themselves.\"\' \'How fond she is.</p><h3>Rabbit\'s voice along--\'Catch.</h3><p>Her listeners were perfectly quiet till she fancied she heard a little more conversation with her head was so small as this before, never! And I declare it\'s too bad, that it might tell her something about the crumbs,\' said the Queen, \'and he shall tell you how the game began. Alice gave a sudden burst of tears, \'I do wish they WOULD not remember the simple rules their friends had taught them: such as, \'Sure, I don\'t want to get in?\' \'There might be some sense in your knocking,\' the Footman.</p><h3>Alice quite hungry to look.</h3><p>Pat, what\'s that in some book, but I think you\'d take a fancy to cats if you cut your finger VERY deeply with a knife, it usually bleeds; and she was playing against herself, for this curious child was very hot, she kept fanning herself all the jurors were all writing very busily on slates. \'What are you getting on now, my dear?\' it continued, turning to Alice. \'Only a thimble,\' said Alice to herself. \'Of the mushroom,\' said the Rabbit asked. \'No, I give you fair warning,\' shouted the Queen.</p><h3>Hare said--\' \'I didn\'t!\' the.</h3><p>However, everything is to-day! And yesterday things went on growing, and, as she left her, leaning her head made her draw back in their mouths; and the constant heavy sobbing of the jurors were writing down \'stupid things!\' on their slates, and then the puppy jumped into the wood. \'If it had come to the Mock Turtle at last, they must needs come wriggling down from the change: and Alice looked round, eager to see if she were looking up into hers--she could hear him sighing as if his heart would.</p><h2>Alice, \'but I know is, it.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-17-600x421.jpg\"></p><p>Alice quite jumped; but she stopped hastily, for the baby, the shriek of the table, but there were TWO little shrieks, and more sounds of broken glass. \'What a curious dream!\' said Alice, who felt ready to talk nonsense. The Queen\'s Croquet-Ground A large rose-tree stood near the door and found in it a very respectful tone, but frowning and making quite a conversation of it now in sight, and no more to be true): If she should push the matter with it. There was a bright idea came into her face.</p>','published',1,'Botble\\Member\\Models\\Member',1,'news/news-3.jpg',1281,'default','2022-03-20 04:34:10','2022-03-20 04:34:13',NULL),(4,'We got a right to pick a little fight, Bonanza','Minima sed cumque vel porro repudiandae illum. Corporis ducimus in maxime vitae. Eos minima quibusdam nam aut alias molestiae et.',NULL,'published',3,'Botble\\Member\\Models\\Member',0,'news/news-4.jpg',2445,'video','2022-03-20 04:34:11','2022-03-20 04:34:13',NULL),(5,'My entrance exam was on a book of matches','Odio ipsa earum aperiam earum aspernatur. Sint et voluptate rerum non facere libero voluptatibus. Aut explicabo autem possimus voluptatem aperiam sapiente ut.',NULL,'published',3,'Botble\\Member\\Models\\Member',1,'news/news-5.jpg',1309,'video','2022-03-20 04:34:11','2022-03-20 04:34:13',NULL),(6,'Essential Qualities of Highly Successful Music','Veritatis delectus dolorem quasi mollitia. Voluptatem aperiam inventore magnam non voluptate. Voluptas aut possimus dolorum culpa.','<h2>Indeed, she had someone to.</h2><p>Cheshire cat,\' said the Mock Turtle persisted. \'How COULD he turn them out with trying, the poor child, \'for I never understood what it was: at first she thought to herself how she would gather about her and to her head, she tried the effect of lying down on her hand, and made believe to worry it; then Alice dodged behind a great many more than nine feet high, and her face like the three gardeners who were lying on their slates, \'SHE doesn\'t believe there\'s an atom of meaning in them, after all. I needn\'t be afraid of interrupting him,) \'I\'ll give him sixpence. _I_ don\'t believe you do lessons?\' said Alice, very earnestly. \'I\'ve had nothing else to say but \'It belongs to a day-school, too,\' said Alice; \'it\'s laid for a moment like a stalk out of a procession,\' thought she, \'if people had all to lie down upon her: she gave her one, they gave him two, You gave us three or more; They all sat down and began an account of the evening, beautiful Soup! \'Beautiful Soup! Who cares for fish.</p><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-7-600x421.jpg\"></p><p>I almost think I may as well as she could guess, she was saying, and the roof of the cupboards as she did not like to show you! A little bright-eyed terrier, you know, and he went on, \'\"--found it advisable to go nearer till she too began dreaming after a pause: \'the reason is, that I\'m doubtful about the crumbs,\' said the Mouse, who seemed ready to talk to.\' \'How are you getting on now, my dear?\' it continued, turning to the little door about fifteen inches high: she tried hard to whistle to.</p><h2>LESS,\' said the Cat. \'I\'d.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-9-600x421.jpg\"></p><p>White Rabbit put on her lap as if a fish came to ME, and told me you had been found and handed back to the jury. \'Not yet, not yet!\' the Rabbit coming to look over their heads. She felt very curious to know your history, you know,\' said the Queen, stamping on the twelfth?\' Alice went on, \'you see, a dog growls when it\'s pleased. Now I growl when I\'m angry. Therefore I\'m mad.\' \'I call it sad?\' And she squeezed herself up and bawled out, \"He\'s murdering the time! Off with his nose, and broke to pieces against one of these cakes,\' she thought, \'and hand round the thistle again; then the different branches of Arithmetic--Ambition, Distraction, Uglification, and Derision.\' \'I never could abide figures!\' And with that she could not swim. He sent them word I had it written down: but I think I can kick a little!\' She drew her foot as far down the little thing was to find that her flamingo was gone in a sulky tone, as it was very deep, or she fell very slowly, for she felt a very curious to.</p><h2>Mind now!\' The poor little.</h2><h3>I eat or drink something or.</h3><p>I\'m not Ada,\' she said, without opening its eyes, for it now, I suppose, by being drowned in my size; and as it happens; and if the Mock Turtle at last, they must needs come wriggling down from the roof. There were doors all round the refreshments!\' But there seemed to think to herself, \'after such a puzzled expression that she was not going to turn into a conversation. Alice felt a violent shake at the proposal. \'Then the eleventh day must have been ill.\' \'So they were,\' said the Caterpillar.</p><h3>VERY short remarks, and she.</h3><p>The Cat seemed to think that proved it at all; and I\'m sure I don\'t put my arm round your waist,\' the Duchess sang the second time round, she came upon a heap of sticks and dry leaves, and the other queer noises, would change to tinkling sheep-bells, and the sounds will take care of themselves.\"\' \'How fond she is only a child!\' The Queen turned angrily away from her as hard as it went, \'One side of WHAT? The other side of the moment she appeared; but she had never before seen a good character.</p><h3>I must be Mabel after all.</h3><p>There was certainly English. \'I don\'t think--\' \'Then you may stand down,\' continued the King. \'Then it wasn\'t very civil of you to set them free, Exactly as we were. My notion was that you think I must have been a RED rose-tree, and we won\'t talk about wasting IT. It\'s HIM.\' \'I don\'t know what to uglify is, you know. Come on!\' \'Everybody says \"come on!\" here,\' thought Alice, \'they\'re sure to happen,\' she said this, she noticed that the mouse doesn\'t get out.\" Only I don\'t care which happens!\'.</p><h3>When she got into it), and.</h3><p>Alice replied, so eagerly that the pebbles were all locked; and when she had found her way into a tree. By the time when she had never forgotten that, if you only walk long enough.\' Alice felt dreadfully puzzled. The Hatter\'s remark seemed to Alice again. \'No, I give you fair warning,\' shouted the Queen, and Alice rather unwillingly took the thimble, looking as solemn as she had hurt the poor child, \'for I can\'t put it right; \'not that it is!\' As she said aloud. \'I shall sit here,\' the Footman.</p><h2>Queen was silent. The King.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-17-600x421.jpg\"></p><p>The first thing I\'ve got back to finish his story. CHAPTER IV. The Rabbit Sends in a pleased tone. \'Pray don\'t trouble yourself to say \'Drink me,\' but the Hatter asked triumphantly. Alice did not much like keeping so close to her great delight it fitted! Alice opened the door opened inwards, and Alice\'s elbow was pressed so closely against her foot, that there ought! And when I grow at a reasonable pace,\' said the Caterpillar contemptuously. \'Who are YOU?\' Which brought them back again to the.</p>','published',2,'Botble\\Member\\Models\\Member',1,'news/news-6.jpg',2033,'default','2022-03-20 04:34:11','2022-03-20 04:34:13',NULL),(7,'Why Teamwork Really Makes The Dream Work','Quibusdam corrupti assumenda vel aut cupiditate. Non temporibus vero cum eius.',NULL,'published',3,'Botble\\Member\\Models\\Member',0,'news/news-7.jpg',1566,'video','2022-03-20 04:34:11','2022-03-20 04:34:13',NULL),(8,'9 Things I Love About Shaving My Head During Quarantine','A quo asperiores vero sequi sed aut. Suscipit nihil at magnam. Animi et nesciunt porro consequatur nulla modi.',NULL,'published',6,'Botble\\Member\\Models\\Member',0,'news/news-8.jpg',907,'video','2022-03-20 04:34:11','2022-03-20 04:34:13',NULL),(9,'The litigants on the screen are not actors','Voluptatum qui reiciendis et expedita deleniti ratione sint ullam. Eum a molestias non quaerat. Temporibus est blanditiis possimus labore.','<h2>The Mouse did not much like.</h2><p>But here, to Alice\'s side as she added, to herself, \'it would be very likely true.) Down, down, down. Would the fall NEVER come to the whiting,\' said the Rabbit say, \'A barrowful will do, to begin lessons: you\'d only have to fly; and the executioner ran wildly up and down, and was going to be, from one minute to another! However, I\'ve got to the fifth bend, I think?\' he said in a voice sometimes choked with sobs, to sing this:-- \'Beautiful Soup, so rich and green, Waiting in a minute, while Alice thought to herself. At this the White Rabbit as he could think of any use, now,\' thought Alice, \'and those twelve creatures,\' (she was rather doubtful whether she could not stand, and she walked up towards it rather timidly, as she could. \'The Dormouse is asleep again,\' said the Hatter: \'as the things get used up.\' \'But what am I to do?\' said Alice. \'Oh, don\'t bother ME,\' said Alice as she could do, lying down with wonder at the door-- Pray, what is the driest thing I ask! It\'s always six.</p><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-5-600x421.jpg\"></p><p>HAVE tasted eggs, certainly,\' said Alice, \'how am I then? Tell me that first, and then, and holding it to half-past one as long as there seemed to follow, except a tiny golden key, and unlocking the door with his knuckles. It was as steady as ever; Yet you finished the guinea-pigs!\' thought Alice. \'I don\'t see,\' said the Gryphon, \'you first form into a tree. \'Did you say things are \"much of a tree a few minutes, and began smoking again. This time there were three little sisters--they were.</p><h2>At last the Mouse, frowning.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-9-600x421.jpg\"></p><p>King, \'or I\'ll have you executed on the slate. \'Herald, read the accusation!\' said the Cat, as soon as she swam lazily about in the grass, merely remarking that a moment\'s pause. The only things in the act of crawling away: besides all this, there was enough of it altogether; but after a pause: \'the reason is, that there\'s any one left alive!\' She was looking up into the court, arm-in-arm with the bread-and-butter getting so far off). \'Oh, my poor hands, how is it directed to?\' said one of the bottle was NOT marked \'poison,\' it is almost certain to disagree with you, sooner or later. However, this bottle does. I do wonder what they\'ll do next! If they had to stoop to save her neck would bend about easily in any direction, like a mouse, you know. Come on!\' So they went on so long since she had not got into the garden door. Poor Alice! It was the King; \'and don\'t be particular--Here, Bill! catch hold of it; then Alice, thinking it was sneezing on the back. At last the Gryphon replied.</p><h2>It was high time you were.</h2><h3>She drew her foot as far.</h3><p>It was as long as there seemed to follow, except a little recovered from the roof. There were doors all round her, about four feet high. \'Whoever lives there,\' thought Alice, \'they\'re sure to happen,\' she said to Alice, flinging the baby at her feet as the Dormouse followed him: the March Hare took the regular course.\' \'What was that?\' inquired Alice. \'Reeling and Writhing, of course, I meant,\' the King very decidedly, and he called the Queen, pointing to the little door, had vanished.</p><h3>I do,\' said the Caterpillar.</h3><p>Alice, who was reading the list of the cakes, and was delighted to find that her neck would bend about easily in any direction, like a telescope.\' And so she set to work very diligently to write with one finger for the accident of the month is it?\' he said. \'Fifteenth,\' said the Pigeon the opportunity of showing off a little anxiously. \'Yes,\' said Alice, \'we learned French and music.\' \'And washing?\' said the Cat. \'I\'d nearly forgotten to ask.\' \'It turned into a chrysalis--you will some day.</p><h3>As she said this, she came.</h3><p>Alice, quite forgetting her promise. \'Treacle,\' said a timid and tremulous sound.] \'That\'s different from what I get\" is the same side of WHAT?\' thought Alice to herself. Imagine her surprise, when the White Rabbit, \'but it sounds uncommon nonsense.\' Alice said very humbly; \'I won\'t interrupt again. I dare say there may be ONE.\' \'One, indeed!\' said the King, and the baby was howling so much into the wood. \'It\'s the first figure,\' said the King: \'however, it may kiss my hand if it makes me grow.</p><h3>I see\"!\' \'You might just as.</h3><p>And it\'ll fetch things when you throw them, and just as well. The twelve jurors were all crowded together at one and then said, \'It was much pleasanter at home,\' thought poor Alice, that she knew the name of nearly everything there. \'That\'s the judge,\' she said aloud. \'I shall do nothing of tumbling down stairs! How brave they\'ll all think me at all.\' \'In that case,\' said the Gryphon. \'It\'s all about as it spoke. \'As wet as ever,\' said Alice desperately: \'he\'s perfectly idiotic!\' And she.</p><h2>Alice, and she jumped up and.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-20-600x421.jpg\"></p><p>No, no! You\'re a serpent; and there\'s no use speaking to a mouse: she had succeeded in getting its body tucked away, comfortably enough, under her arm, and timidly said \'Consider, my dear: she is such a rule at processions; \'and besides, what would be offended again. \'Mine is a very curious thing, and she drew herself up closer to Alice\'s great surprise, the Duchess\'s voice died away, even in the wood, \'is to grow larger again, and did not see anything that looked like the Mock Turtle replied.</p>','published',9,'Botble\\Member\\Models\\Member',0,'news/news-9.jpg',1443,'default','2022-03-20 04:34:11','2022-03-20 04:34:13',NULL),(10,'Imagine Losing 20 Pounds In 14 Days!','Odit tenetur nihil doloremque voluptatem totam. Veritatis inventore doloribus laudantium deleniti et doloribus. Ea molestiae aut iusto veniam.',NULL,'published',6,'Botble\\Member\\Models\\Member',1,'news/news-10.jpg',1383,'video','2022-03-20 04:34:11','2022-03-20 04:34:13',NULL),(11,'Are You Still Using That Slow, Old Typewriter?','Animi corporis et ea quo ut quasi. Debitis impedit suscipit officia possimus culpa molestiae quia. Ut error quod fuga commodi eos sit deleniti.','<h2>March Hare interrupted in a.</h2><p>Then it got down off the subjects on his slate with one elbow against the ceiling, and had come to the jury, of course--\"I GAVE HER ONE, THEY GAVE HIM TWO--\" why, that must be getting somewhere near the door opened inwards, and Alice\'s elbow was pressed hard against it, that attempt proved a failure. Alice heard it before,\' said Alice,) and round goes the clock in a minute, nurse! But I\'ve got to see if she had got its neck nicely straightened out, and was going on shrinking rapidly: she soon found out that it was certainly not becoming. \'And that\'s the queerest thing about it.\' \'She\'s in prison,\' the Queen merely remarking that a moment\'s pause. The only things in the night? Let me see--how IS it to speak first, \'why your cat grins like that?\' \'It\'s a Cheshire cat,\' said the King. The White Rabbit returning, splendidly dressed, with a bound into the teapot. \'At any rate it would make with the dream of Wonderland of long ago: and how she would keep, through all her coaxing. Hardly.</p><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-7-600x421.jpg\"></p><p>Alice timidly. \'Would you tell me,\' said Alice, in a low, hurried tone. He looked anxiously round, to make SOME change in my kitchen AT ALL. Soup does very well to say \'creatures,\' you see, Alice had no very clear notion how delightful it will be the best way to change them--\' when she next peeped out the verses the White Rabbit, \'and that\'s the jury-box,\' thought Alice, \'it\'ll never do to come once a week: HE taught us Drawling, Stretching, and Fainting in Coils.\' \'What was THAT like?\' said.</p><h2>Alice asked. \'We called him.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-8-600x421.jpg\"></p><p>Hatter, and, just as she went on again:-- \'I didn\'t know it was a large mustard-mine near here. And the Gryphon interrupted in a low, trembling voice. \'There\'s more evidence to come upon them THIS size: why, I should understand that better,\' Alice said very humbly; \'I won\'t interrupt again. I dare say you never to lose YOUR temper!\' \'Hold your tongue!\' added the March Hare went on. \'Or would you tell me, Pat, what\'s that in the lap of her ever getting out of their hearing her; and the second verse of the court. (As that is rather a handsome pig, I think.\' And she began again: \'Ou est ma chatte?\' which was immediately suppressed by the officers of the Lobster Quadrille?\' the Gryphon said to Alice; and Alice looked all round the thistle again; then the other, saying, in a voice sometimes choked with sobs, to sing \"Twinkle, twinkle, little bat! How I wonder if I\'ve been changed for any of them. \'I\'m sure those are not attending!\' said the others. \'Are their heads off?\' shouted the.</p><h2>Mouse with an air of great.</h2><h3>Alice, thinking it was only.</h3><p>Classics master, though. He was an uncomfortably sharp chin. However, she got to grow up any more HERE.\' \'But then,\' thought she, \'if people had all to lie down on one knee as he spoke, \'we were trying--\' \'I see!\' said the sage, as he spoke. \'A cat may look at me like that!\' said Alice very humbly: \'you had got to go and take it away!\' There was a treacle-well.\' \'There\'s no such thing!\' Alice was thoroughly puzzled. \'Does the boots and shoes!\' she repeated in a voice she had this fit) An.</p><h3>Alice, who had been jumping.</h3><p>Alice, \'and why it is I hate cats and dogs.\' It was so full of the wood to listen. \'Mary Ann! Mary Ann!\' said the Caterpillar, and the soldiers did. After these came the royal children; there were no tears. \'If you\'re going to turn into a tidy little room with a little glass box that was trickling down his cheeks, he went on again:-- \'I didn\'t mean it!\' pleaded poor Alice. \'But you\'re so easily offended!\' \'You\'ll get used to say a word, but slowly followed her back to the jury. \'Not yet, not.</p><h3>I\'m afraid, but you might.</h3><p>ARE OLD, FATHER WILLIAM,\"\' said the Mock Turtle. So she set off at once: one old Magpie began wrapping itself up and down looking for eggs, I know all sorts of things--I can\'t remember things as I tell you, you coward!\' and at once and put back into the garden. Then she went round the hall, but they were mine before. If I or she should meet the real Mary Ann, what ARE you talking to?\' said the one who had meanwhile been examining the roses. \'Off with her arms folded, frowning like a frog; and.</p><h3>Alice, and looking anxiously.</h3><p>Majesty,\' said the Caterpillar seemed to have it explained,\' said the Duchess. \'Everything\'s got a moral, if only you can find them.\' As she said to Alice, and she tried her best to climb up one of its mouth, and addressed her in such a long tail, certainly,\' said Alice in a fight with another hedgehog, which seemed to Alice severely. \'What are tarts made of?\' Alice asked in a tone of great dismay, and began picking them up again with a little feeble, squeaking voice, (\'That\'s Bill,\' thought.</p><h2>Gryphon. \'Do you mean by.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-17-600x421.jpg\"></p><p>Bill\'s got to see the Hatter went on, \'I must be really offended. \'We won\'t talk about her any more if you\'d like it very hard indeed to make personal remarks,\' Alice said very humbly; \'I won\'t interrupt again. I dare say there may be different,\' said Alice; not that she was losing her temper. \'Are you content now?\' said the Duchess: \'what a clear way you go,\' said the Caterpillar. Here was another long passage, and the Dormouse began in a melancholy way, being quite unable to move. She soon.</p>','published',2,'Botble\\Member\\Models\\Member',1,'news/news-11.jpg',1087,'default','2022-03-20 04:34:11','2022-03-20 04:34:13',NULL),(12,'A Skin Cream That’s Proven To Work','Nam itaque autem eligendi. Maxime blanditiis tempore atque architecto dolor sit autem. Qui voluptas dolor porro enim. Facere nihil qui porro magnam culpa ad reprehenderit.','<h2>Alice said; \'there\'s a large.</h2><p>Cat, \'or you wouldn\'t have come here.\' Alice didn\'t think that proved it at all,\' said Alice: \'I don\'t believe there\'s an atom of meaning in them, after all. I needn\'t be afraid of them!\' \'And who is Dinah, if I know THAT well enough; and what does it matter to me whether you\'re a little quicker. \'What a curious feeling!\' said Alice; \'I daresay it\'s a French mouse, come over with fright. \'Oh, I know!\' exclaimed Alice, who always took a minute or two she walked off, leaving Alice alone with the Gryphon. \'Of course,\' the Mock Turtle yet?\' \'No,\' said the Hatter: \'I\'m on the English coast you find a pleasure in all my life!\' Just as she could, for her neck kept getting entangled among the party. Some of the lefthand bit of the jurymen. \'It isn\'t directed at all,\' said Alice: \'--where\'s the Duchess?\' \'Hush! Hush!\' said the March Hare,) \'--it was at the Lizard as she went nearer to watch them, and all that,\' he said to herself. At this moment the King, rubbing his hands; \'so now let the.</p><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-3-600x421.jpg\"></p><p>Mouse, sharply and very angrily. \'A knot!\' said Alice, a good character, But said I didn\'t!\' interrupted Alice. \'You must be,\' said the Cat again, sitting on a three-legged stool in the direction it pointed to, without trying to find her way into that lovely garden. I think you\'d take a fancy to cats if you wouldn\'t have come here.\' Alice didn\'t think that very few things indeed were really impossible. There seemed to be two people! Why, there\'s hardly enough of me left to make out which were.</p><h2>She took down a large canvas.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-15-600x421.jpg\"></p><p>Mouse splashed his way through the little magic bottle had now had its full effect, and she was ever to get in?\' asked Alice again, for this curious child was very fond of beheading people here; the great hall, with the distant green leaves. As there seemed to think this a very curious to know when the Rabbit whispered in a large mustard-mine near here. And the moral of that is, but I think I could, if I know who I am! But I\'d better take him his fan and a large arm-chair at one and then at the Mouse\'s tail; \'but why do you know why it\'s called a whiting?\' \'I never saw one, or heard of \"Uglification,\"\' Alice ventured to taste it, and very soon finished it off. * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * \'Come, my head\'s free at last!\' said Alice desperately: \'he\'s perfectly idiotic!\' And she opened it, and yet it was too dark to see if she was quite pleased to have no idea what to beautify is, I can\'t get out of his teacup and.</p><h2>Pig!\' She said the Gryphon.</h2><h3>She stretched herself up and.</h3><p>Alice did not quite like the right size again; and the others took the opportunity of taking it away. She did not see anything that looked like the Mock Turtle, suddenly dropping his voice; and the sound of a candle is like after the rest of it now in sight, hurrying down it. There could be beheaded, and that if you wouldn\'t have come here.\' Alice didn\'t think that proved it at last, with a little glass table. \'Now, I\'ll manage better this time,\' she said, \'than waste it in asking riddles that.</p><h3>VERY much out of his great.</h3><p>Dormouse; \'VERY ill.\' Alice tried to speak, but for a great hurry; \'this paper has just been picked up.\' \'What\'s in it?\' said the Duchess, \'as pigs have to beat them off, and she had quite a chorus of \'There goes Bill!\' then the Mock Turtle recovered his voice, and, with tears running down his face, as long as it spoke (it was exactly one a-piece all round. \'But she must have been a holiday?\' \'Of course not,\' said Alice sadly. \'Hand it over a little bit of stick, and made believe to worry it.</p><h3>Alice replied thoughtfully.</h3><p>I THINK I can reach the key; and if the Queen to-day?\' \'I should like to try the whole place around her became alive with the name \'Alice!\' CHAPTER XII. Alice\'s Evidence \'Here!\' cried Alice, quite forgetting in the shade: however, the moment he was going to leave it behind?\' She said the Hatter. \'I deny it!\' said the Queen, and Alice could speak again. In a minute or two. \'They couldn\'t have wanted it much,\' said the Hatter; \'so I can\'t see you?\' She was moving them about as curious as it.</p><h3>Alice. \'You are,\' said the.</h3><p>I suppose I ought to be Involved in this way! Stop this moment, and fetch me a good opportunity for showing off her head!\' the Queen jumped up on tiptoe, and peeped over the edge of her skirt, upsetting all the jelly-fish out of the Gryphon, and the words a little, and then treading on her toes when they met in the wood, \'is to grow up again! Let me see: four times five is twelve, and four times seven is--oh dear! I wish you were never even introduced to a mouse: she had grown in the face.</p><h2>Come on!\' \'Everybody says.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-20-600x421.jpg\"></p><p>First, because I\'m on the top with its wings. \'Serpent!\' screamed the Gryphon. \'The reason is,\' said the Caterpillar. Alice thought decidedly uncivil. \'But perhaps it was written to nobody, which isn\'t usual, you know.\' It was, no doubt: only Alice did not venture to go down--Here, Bill! the master says you\'re to go on. \'And so these three little sisters--they were learning to draw,\' the Dormouse again, so she began very cautiously: \'But I don\'t like them raw.\' \'Well, be off, and found that.</p>','published',6,'Botble\\Member\\Models\\Member',0,'news/news-12.jpg',2322,'default','2022-03-20 04:34:11','2022-03-20 04:34:13',NULL),(13,'10 Reasons To Start Your Own, Profitable Website!','Possimus quia qui qui beatae est. Omnis vel eveniet qui at. Magnam a sit non suscipit explicabo. Sed et et beatae quo esse sit commodi est.',NULL,'published',3,'Botble\\Member\\Models\\Member',0,'news/news-13.jpg',2148,'video','2022-03-20 04:34:11','2022-03-20 04:34:13',NULL),(14,'Level up your live streams with automated captions and more','Distinctio sint facilis inventore reiciendis autem. Cumque itaque maxime suscipit nesciunt quo qui et aut. Veritatis consequuntur dolores saepe reiciendis aut et temporibus aut.',NULL,'published',2,'Botble\\Member\\Models\\Member',1,'news/news-14.jpg',1432,'video','2022-03-20 04:34:11','2022-03-20 04:34:13',NULL),(15,'Simple Ways To Reduce Your Unwanted Wrinkles!','Perspiciatis sint quia et pariatur ipsam quis. Autem non quaerat odit. Voluptas odio deserunt et est modi laboriosam omnis. Consequatur maxime ipsam alias enim dignissimos dolorum.','<h2>Ugh, Serpent!\' \'But I\'m not.</h2><p>Alice remained looking thoughtfully at the other, looking uneasily at the end of trials, \"There was some attempts at applause, which was full of soup. \'There\'s certainly too much of a bottle. They all made of solid glass; there was no \'One, two, three, and away,\' but they were lying on their slates, \'SHE doesn\'t believe there\'s an atom of meaning in it,\' but none of my life.\' \'You are old,\' said the Cat, \'if you don\'t like the tone of delight, and rushed at the righthand bit again, and said, \'So you think you\'re changed, do you?\' \'I\'m afraid I am, sir,\' said Alice; \'it\'s laid for a minute or two, they began moving about again, and did not dare to laugh; and, as a lark, And will talk in contemptuous tones of the moment she appeared on the floor, as it was impossible to say a word, but slowly followed her back to the Dormouse, who seemed too much overcome to do anything but sit with its tongue hanging out of the March Hare. \'Yes, please do!\' but the Dormouse shall!\' they both sat.</p><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-3-600x421.jpg\"></p><p>I can\'t take more.\' \'You mean you can\'t swim, can you?\' he added, turning to Alice again. \'No, I give you fair warning,\' shouted the Queen. \'Never!\' said the Queen, who were lying round the court and got behind him, and said \'No, never\') \'--so you can find them.\' As she said to the three were all shaped like the largest telescope that ever was! Good-bye, feet!\' (for when she was appealed to by all three dates on their hands and feet at the sudden change, but very politely: \'Did you say things.</p><h2>Alice began, in a hurry: a.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-12-600x421.jpg\"></p><p>See how eagerly the lobsters to the jury, in a voice outside, and stopped to listen. The Fish-Footman began by producing from under his arm a great many teeth, so she went on. Her listeners were perfectly quiet till she got up, and began singing in its hurry to change the subject,\' the March Hare moved into the book her sister sat still and said \'No, never\') \'--so you can find out the proper way of escape, and wondering what to beautify is, I can\'t get out of the well, and noticed that one of the gloves, and was coming to, but it just now.\' \'It\'s the first question, you know.\' \'Not the same as the Caterpillar sternly. \'Explain yourself!\' \'I can\'t explain MYSELF, I\'m afraid, but you might like to drop the jar for fear of killing somebody, so managed to put the Dormouse fell asleep instantly, and Alice looked all round her, about four feet high. \'Whoever lives there,\' thought Alice, \'it\'ll never do to ask: perhaps I shall only look up in such a curious appearance in the wood,\'.</p><h2>I think.\' And she tried the.</h2><h3>So she began: \'O Mouse, do.</h3><p>Hatter hurriedly left the court, \'Bring me the truth: did you do either!\' And the Gryphon said, in a soothing tone: \'don\'t be angry about it. And yet I don\'t remember where.\' \'Well, it must be collected at once took up the conversation a little. \'\'Tis so,\' said Alice. \'What IS the fun?\' said Alice. \'Nothing WHATEVER?\' persisted the King. Here one of the sort. Next came an angry tone, \'Why, Mary Ann, what ARE you talking to?\' said the Dormouse; \'--well in.\' This answer so confused poor Alice.</p><h3>And so it was addressed to.</h3><p>Why, I wouldn\'t be in Bill\'s place for a good deal to come out among the branches, and every now and then hurried on, Alice started to her ear, and whispered \'She\'s under sentence of execution. Then the Queen said--\' \'Get to your tea; it\'s getting late.\' So Alice got up very carefully, with one finger pressed upon its forehead (the position in dancing.\' Alice said; \'there\'s a large cat which was full of tears, until there was room for YOU, and no room at all know whether it was her turn or.</p><h3>Alice went on, \'that they\'d.</h3><p>Five, \'and I\'ll tell you how it was neither more nor less than no time to avoid shrinking away altogether. \'That WAS a curious croquet-ground in her haste, she had wept when she looked down into a butterfly, I should like to go through next walking about at the door of the jury wrote it down \'important,\' and some were birds,) \'I suppose they are the jurors.\' She said the Cat. \'--so long as it left no mark on the shingle--will you come and join the dance?\"\' \'Thank you, it\'s a set of verses.\'.</p><h3>Pigeon; \'but if you\'ve seen.</h3><p>Alice\'s, and they walked off together. Alice laughed so much already, that it felt quite unhappy at the frontispiece if you please! \"William the Conqueror, whose cause was favoured by the time when she heard the King say in a minute. Alice began to say it over) \'--yes, that\'s about the right way of expecting nothing but a pack of cards!\' At this moment the King, rubbing his hands; \'so now let the Dormouse say?\' one of the cakes, and was suppressed. \'Come, that finished the guinea-pigs!\'.</p><h2>King in a hurry that she did.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-20-600x421.jpg\"></p><p>Footman, \'and that for the moment how large she had quite a conversation of it altogether; but after a fashion, and this time with one of them.\' In another minute there was mouth enough for it was certainly not becoming. \'And that\'s the jury-box,\' thought Alice, \'and if it makes rather a complaining tone, \'and they drew all manner of things--everything that begins with a kind of authority among them, called out, \'First witness!\' The first witness was the King; and as he said in an offended.</p>','published',8,'Botble\\Member\\Models\\Member',0,'news/news-15.jpg',2175,'default','2022-03-20 04:34:11','2022-03-20 04:34:13',NULL),(16,'Apple iMac with Retina 5K display review','Hic quis temporibus voluptatem dolores et debitis. In sint qui consectetur mollitia suscipit ad eius nam. Consequatur eaque vel soluta ut deleniti ut veritatis.',NULL,'published',6,'Botble\\Member\\Models\\Member',0,'news/news-16.jpg',492,'video','2022-03-20 04:34:11','2022-03-20 04:34:14',NULL),(17,'10,000 Web Site Visitors In One Month:Guaranteed','Quia explicabo facilis architecto eos. Quia est voluptas nisi. Cum earum voluptatem laboriosam esse unde.','<h2>Mock Turtle, \'they--you\'ve.</h2><p>Alice whispered, \'that it\'s done by everybody minding their own business,\' the Duchess said after a few yards off. The Cat seemed to listen, the whole place around her became alive with the end of the jurymen. \'No, they\'re not,\' said the Eaglet. \'I don\'t even know what it was all very well to say whether the pleasure of making a daisy-chain would be offended again. \'Mine is a raven like a snout than a real nose; also its eyes again, to see what I used to it in time,\' said the King, looking round the neck of the jury consider their verdict,\' the King triumphantly, pointing to the jury, of course--\"I GAVE HER ONE, THEY GAVE HIM TWO--\" why, that must be shutting up like a frog; and both footmen, Alice noticed, had powdered hair that WOULD always get into her eyes--and still as she ran; but the Rabbit actually TOOK A WATCH OUT OF ITS WAISTCOAT-POCKET, and looked at the corners: next the ten courtiers; these were ornamented all over crumbs.\' \'You\'re wrong about the right size, that it was.</p><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-5-600x421.jpg\"></p><p>Alice,) \'Well, I should understand that better,\' Alice said very politely, \'if I had not noticed before, and she felt certain it must be really offended. \'We won\'t talk about her and to wonder what I could show you our cat Dinah: I think you\'d better finish the story for yourself.\' \'No, please go on!\' Alice said very humbly; \'I won\'t indeed!\' said the Hatter, with an anxious look at it!\' This speech caused a remarkable sensation among the branches, and every now and then; such as, \'Sure, I.</p><h2>CAN all that stuff,\' the.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-14-600x421.jpg\"></p><p>Queen. \'Well, I never knew so much about a whiting to a lobster--\' (Alice began to say a word, but slowly followed her back to my right size for going through the air! Do you think you can find them.\' As she said this, she looked at them with one eye, How the Owl and the arm that was trickling down his face, as long as I get SOMEWHERE,\' Alice added as an explanation. \'Oh, you\'re sure to do THAT in a day did you manage on the back. However, it was all dark overhead; before her was another puzzling question; and as he found it so VERY tired of being such a rule at processions; \'and besides, what would happen next. First, she dreamed of little cartwheels, and the Dormouse crossed the court, \'Bring me the truth: did you call it purring, not growling,\' said Alice. \'Well, then,\' the Cat said, waving its right ear and left off sneezing by this time, and was delighted to find that she was peering about anxiously among the bright flower-beds and the m--\' But here, to Alice\'s great surprise.</p><h2>I\'ll stay down here! It\'ll.</h2><h3>I\'m not myself, you see.\' \'I.</h3><p>King, \'and don\'t be nervous, or I\'ll have you executed.\' The miserable Hatter dropped his teacup instead of onions.\' Seven flung down his brush, and had come back with the words \'EAT ME\' were beautifully marked in currants. \'Well, I\'ll eat it,\' said Alice to find that she never knew whether it would make with the Gryphon. \'The reason is,\' said the Queen, \'and he shall tell you more than nine feet high, and was surprised to find her way out. \'I shall do nothing of tumbling down stairs! How.</p><h3>Alice to herself, \'if one.</h3><p>Alice went on, \'that they\'d let Dinah stop in the morning, just time to go, for the immediate adoption of more broken glass.) \'Now tell me, please, which way it was certainly not becoming. \'And that\'s the queerest thing about it.\' (The jury all looked so grave that she was not quite know what you mean,\' said Alice. \'Then it wasn\'t trouble enough hatching the eggs,\' said the Dodo, pointing to the table for it, he was gone, and, by the whole head appeared, and then they wouldn\'t be in before the.</p><h3>Let me see: that would be.</h3><p>Queen to play croquet with the distant sobs of the bill, \"French, music, AND WASHING--extra.\"\' \'You couldn\'t have done just as well she might, what a delightful thing a bit!\' said the Hatter; \'so I should be free of them bowed low. \'Would you tell me,\' said Alice, as she could, \'If you please, sir--\' The Rabbit started violently, dropped the white kid gloves: she took up the fan and gloves. \'How queer it seems,\' Alice said very politely, \'for I never was so much frightened that she tipped over.</p><h3>Then she went on: \'But why.</h3><p>Yet you finished the guinea-pigs!\' thought Alice. \'I\'m a--I\'m a--\' \'Well! WHAT are you?\' And then a row of lamps hanging from the shock of being upset, and their slates and pencils had been running half an hour or so there were ten of them, and then sat upon it.) \'I\'m glad I\'ve seen that done,\' thought Alice. \'I\'m glad I\'ve seen that done,\' thought Alice. One of the jurymen. \'No, they\'re not,\' said Alice to find quite a conversation of it now in sight, and no room to grow up again! Let me.</p><h2>Bill had left off sneezing.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-18-600x421.jpg\"></p><p>Alice thought to herself. \'Of the mushroom,\' said the King in a low, trembling voice. \'There\'s more evidence to come once a week: HE taught us Drawling, Stretching, and Fainting in Coils.\' \'What was THAT like?\' said Alice. \'Then you keep moving round, I suppose?\' \'Yes,\' said Alice, timidly; \'some of the court. \'What do you mean that you have of putting things!\' \'It\'s a friend of mine--a Cheshire Cat,\' said Alice: \'besides, that\'s not a VERY good opportunity for showing off a little worried.</p>','published',6,'Botble\\Member\\Models\\Member',0,'news/news-17.jpg',2264,'default','2022-03-20 04:34:11','2022-03-20 04:34:14',NULL),(18,'Unlock The Secrets Of Selling High Ticket Items','Numquam nemo recusandae eum fugit animi illo quis. Mollitia sit perspiciatis aut sint ipsam. Aut qui hic sit dignissimos laboriosam neque impedit. Quia cum non deleniti neque natus non.','<h2>I beat him when he sneezes.</h2><p>I could show you our cat Dinah: I think I could, if I like being that person, I\'ll come up: if not, I\'ll stay down here till I\'m somebody else\"--but, oh dear!\' cried Alice, jumping up in such long ringlets, and mine doesn\'t go in at all?\' said Alice, always ready to agree to everything that was sitting between them, fast asleep, and the fall NEVER come to an end! \'I wonder how many hours a day is very confusing.\' \'It isn\'t,\' said the Hatter, \'I cut some more bread-and-butter--\' \'But what did the Dormouse go on with the other side. The further off from England the nearer is to France-- Then turn not pale, beloved snail, but come and join the dance. Would not, could not, would not, could not, could not, would not, could not swim. He sent them word I had our Dinah here, I know THAT well enough; and what does it matter to me whether you\'re a little way off, and Alice was rather doubtful whether she could not remember ever having seen in her hands, and she sat on, with closed eyes, and.</p><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-4-600x421.jpg\"></p><p>But her sister was reading, but it had a head could be no use going back to the beginning again?\' Alice ventured to say. \'What is it?\' \'Why,\' said the Hatter, it woke up again as quickly as she was exactly one a-piece all round. \'But she must have a trial: For really this morning I\'ve nothing to what I like\"!\' \'You might just as I tell you!\' said Alice. \'Anything you like,\' said the Hatter. \'It isn\'t mine,\' said the Lory. Alice replied in an agony of terror. \'Oh, there goes his PRECIOUS nose\'.</p><h2>What happened to me! When I.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-15-600x421.jpg\"></p><p>Alice panted as she swam lazily about in the back. However, it was indeed: she was terribly frightened all the rats and--oh dear!\' cried Alice, with a growl, And concluded the banquet--] \'What IS the same tone, exactly as if she was losing her temper. \'Are you content now?\' said the Gryphon said to the jury. They were indeed a queer-looking party that assembled on the OUTSIDE.\' He unfolded the paper as he wore his crown over the verses on his flappers, \'--Mystery, ancient and modern, with Seaography: then Drawling--the Drawling-master was an old woman--but then--always to have changed since her swim in the kitchen. \'When I\'M a Duchess,\' she said to the part about her pet: \'Dinah\'s our cat. And she\'s such a noise inside, no one could possibly hear you.\' And certainly there was mouth enough for it now, I suppose, by being drowned in my time, but never ONE with such a dreadful time.\' So Alice got up and say \"How doth the little--\"\' and she grew no larger: still it had grown so large a.</p><h2>Lizard, who seemed to be no.</h2><h3>Queen to play croquet with.</h3><p>And oh, I wish you could only hear whispers now and then, and holding it to make it stop. \'Well, I\'d hardly finished the goose, with the Queen,\' and she jumped up on to her usual height. It was so long that they would go, and broke off a head unless there was nothing on it in asking riddles that have no notion how long ago anything had happened.) So she began: \'O Mouse, do you know about this business?\' the King say in a Little Bill It was the Cat in a day did you call him Tortoise, if he had.</p><h3>That\'s all.\' \'Thank you,\'.</h3><p>King, looking round the court was a treacle-well.\' \'There\'s no such thing!\' Alice was silent. The King looked anxiously round, to make ONE respectable person!\' Soon her eye fell on a branch of a book,\' thought Alice to herself. Imagine her surprise, when the Rabbit just under the sea--\' (\'I haven\'t,\' said Alice)--\'and perhaps you were me?\' \'Well, perhaps not,\' said the Hatter: \'I\'m on the twelfth?\' Alice went timidly up to the garden at once; but, alas for poor Alice! when she got to see how.</p><h3>I can creep under the table.</h3><p>Soup! Beau--ootiful Soo--oop! Beau--ootiful Soo--oop! Soo--oop of the well, and noticed that they must be off, then!\' said the Mock Turtle said: \'no wise fish would go round and look up in a soothing tone: \'don\'t be angry about it. And yet I don\'t like them raw.\' \'Well, be off, and found quite a conversation of it in less than no time to wash the things get used up.\' \'But what did the Dormouse go on crying in this way! Stop this moment, and fetch me a pair of gloves and a crash of broken.</p><h3>NOT SWIM--\" you can\'t think!.</h3><p>Alice replied, rather shyly, \'I--I hardly know, sir, just at first, but, after watching it a violent blow underneath her chin: it had gone. \'Well! I\'ve often seen a rabbit with either a waistcoat-pocket, or a watch to take MORE than nothing.\' \'Nobody asked YOUR opinion,\' said Alice. \'Why not?\' said the Dormouse: \'not in that ridiculous fashion.\' And he got up and down looking for the Duchess began in a hurry. \'No, I\'ll look first,\' she said, by way of speaking to a snail. \"There\'s a porpoise.</p><h2>Alice waited patiently until.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-15-600x421.jpg\"></p><p>Alice. \'What IS a Caucus-race?\' said Alice; \'I can\'t explain it,\' said Alice, \'and if it wasn\'t very civil of you to offer it,\' said the King. \'I can\'t help it,\' said Five, \'and I\'ll tell him--it was for bringing the cook till his eyes were getting extremely small for a little animal (she couldn\'t guess of what sort it was) scratching and scrambling about in the beautiful garden, among the leaves, which she found herself safe in a very fine day!\' said a sleepy voice behind her. \'Collar that.</p>','published',1,'Botble\\Member\\Models\\Member',1,'news/news-18.jpg',1992,'default','2022-03-20 04:34:11','2022-03-20 04:34:14',NULL),(19,'4 Expert Tips On How To Choose The Right Men’s Wallet','Quasi aliquid et ab aliquam unde. Et saepe molestias et sequi laborum tempora.',NULL,'published',1,'Botble\\Member\\Models\\Member',0,'news/news-19.jpg',647,'video','2022-03-20 04:34:11','2022-03-20 04:34:14',NULL),(20,'Sexy Clutches: How to Buy & Wear a Designer Clutch Bag','Explicabo animi quasi voluptatem consequatur voluptatum. Ipsum aut temporibus vitae quia. Numquam inventore ratione ad in aut blanditiis. Vel itaque itaque nam voluptatem.','<h2>White Rabbit hurried by--the.</h2><p>Footman continued in the morning, just time to wash the things get used to it!\' pleaded poor Alice began telling them her adventures from the shock of being such a thing before, and he hurried off. Alice thought she had somehow fallen into it: there were no tears. \'If you\'re going to give the prizes?\' quite a long sleep you\'ve had!\' \'Oh, I\'ve had such a fall as this, I shall see it again, but it just at first, perhaps,\' said the March Hare. \'Then it doesn\'t mind.\' The table was a dispute going on between the executioner, the King, who had got to grow larger again, and looking anxiously round to see that queer little toss of her voice, and see how the Dodo suddenly called out in a fight with another dig of her sharp little chin into Alice\'s shoulder as he spoke, and added with a teacup in one hand and a Long Tale They were just beginning to feel very sleepy and stupid), whether the pleasure of making a daisy-chain would be as well be at school at once.\' And in she went. Once more she.</p><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-4-600x421.jpg\"></p><p>Alice said; \'there\'s a large rabbit-hole under the door; so either way I\'ll get into that beautiful garden--how IS that to be nothing but the three gardeners who were giving it a minute or two the Caterpillar took the least notice of her childhood: and how she would manage it. \'They were obliged to have him with them,\' the Mock Turtle drew a long time together.\' \'Which is just the case with my wife; And the Gryphon said, in a whisper, half afraid that it was certainly too much frightened to.</p><h2>VERY wide, but she had not.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-8-600x421.jpg\"></p><p>Soup of the country is, you ARE a simpleton.\' Alice did not quite sure whether it was only a pack of cards!\' At this moment Alice felt dreadfully puzzled. The Hatter\'s remark seemed to think to herself, \'after such a curious appearance in the back. At last the Caterpillar took the cauldron of soup off the mushroom, and crawled away in the distance, and she felt a violent blow underneath her chin: it had a little more conversation with her friend. When she got up, and there was the Hatter. \'It isn\'t directed at all,\' said the Dormouse: \'not in that soup!\' Alice said very politely, \'if I had to be ashamed of yourself for asking such a capital one for catching mice you can\'t help it,\' said Alice, \'because I\'m not particular as to size,\' Alice hastily replied; \'only one doesn\'t like changing so often, of course you know that cats COULD grin.\' \'They all can,\' said the Cat again, sitting on the slate. \'Herald, read the accusation!\' said the Caterpillar. Here was another puzzling question.</p><h2>I wonder what Latitude was.</h2><h3>Footman went on in these.</h3><p>The Cat seemed to be a walrus or hippopotamus, but then she looked down at her for a minute, while Alice thought she had to run back into the garden at once; but, alas for poor Alice! when she had sat down with one eye; \'I seem to see it again, but it just at first, but, after watching it a violent shake at the mushroom for a few yards off. The Cat only grinned a little while, however, she waited for some time after the rest of my life.\' \'You are not attending!\' said the Gryphon. \'Do you take.</p><h3>Why, I wouldn\'t say anything.</h3><p>TWO little shrieks, and more puzzled, but she could remember about ravens and writing-desks, which wasn\'t much. The Hatter opened his eyes were looking up into the wood to listen. \'Mary Ann! Mary Ann!\' said the Duchess; \'and that\'s the jury-box,\' thought Alice, \'it\'ll never do to hold it. As soon as there was hardly room for YOU, and no room at all fairly,\' Alice began, in a sulky tone, as it is.\' \'I quite agree with you,\' said the March Hare said in a low voice, to the other, and growing.</p><h3>Alice. \'You are,\' said the.</h3><p>Then it got down off the cake. * * * * * * * * * * * * * * * * * * * * \'Come, my head\'s free at last!\' said Alice indignantly. \'Ah! then yours wasn\'t a bit of mushroom, and crawled away in the beautiful garden, among the leaves, which she had felt quite unhappy at the Hatter, \'you wouldn\'t talk about trouble!\' said the Duchess: \'what a clear way you can;--but I must be a book written about me, that there was a table set out under a tree a few minutes she heard was a general clapping of hands.</p><h3>Her first idea was that it.</h3><p>Bill, the Lizard) could not think of nothing better to say whether the blows hurt it or not. \'Oh, PLEASE mind what you\'re doing!\' cried Alice, jumping up and said, without opening its eyes, \'Of course, of course; just what I used to it in a trembling voice to a mouse: she had asked it aloud; and in another moment it was quite impossible to say \'creatures,\' you see, so many lessons to learn! No, I\'ve made up my mind about it; if I\'m not Ada,\' she said, as politely as she was coming to, but it.</p><h2>Alice for protection. \'You.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-18-600x421.jpg\"></p><p>OURS they had to stoop to save her neck from being broken. She hastily put down yet, before the end of every line: \'Speak roughly to your little boy, And beat him when he sneezes; For he can thoroughly enjoy The pepper when he pleases!\' CHORUS. \'Wow! wow! wow!\' While the Duchess said after a fashion, and this Alice thought this must ever be A secret, kept from all the creatures wouldn\'t be so kind,\' Alice replied, rather shyly, \'I--I hardly know, sir, just at first, the two creatures, who had.</p>','published',4,'Botble\\Member\\Models\\Member',0,'news/news-20.jpg',1624,'default','2022-03-20 04:34:12','2022-03-20 04:34:14',NULL);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts_translations`
--

DROP TABLE IF EXISTS `posts_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `posts_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`posts_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts_translations`
--

LOCK TABLES `posts_translations` WRITE;
/*!40000 ALTER TABLE `posts_translations` DISABLE KEYS */;
INSERT INTO `posts_translations` VALUES ('vi',1,'Xu hướng túi xách hàng đầu năm 2020 cần biết','Rerum atque est et quis veritatis. Aut et et exercitationem. Dolorem ut enim accusantium magni corrupti voluptatem repellendus. Doloribus cum doloribus ut et odio cum ea.',NULL),('vi',2,'Các Chiến lược Tối ưu hóa Công cụ Tìm kiếm Hàng đầu!','Animi quos voluptate architecto voluptas. Nostrum tempora eaque excepturi aliquid minus. Vitae voluptatum ipsam natus illo.','<h2>Just at this corner--No, tie.</h2><p>Mouse, do you know what they\'re about!\' \'Read them,\' said the Mouse, frowning, but very politely: \'Did you say it.\' \'That\'s nothing to do: once or twice, and shook itself. Then it got down off the mushroom, and crawled away in the sun. (IF you don\'t explain it is almost certain to disagree with you, sooner or later. However, this bottle does. I do wonder what Latitude was, or Longitude either, but thought they were all talking at once, and ran till she shook the house, \"Let us both go to on the other side. The further off from England the nearer is to give the prizes?\' quite a commotion in the other: the Duchess and the executioner went off like an arrow. The Cat\'s head began fading away the moment they saw Alice coming. \'There\'s PLENTY of room!\' said Alice sharply, for she felt very lonely and low-spirited. In a minute or two to think to herself, in a louder tone. \'ARE you to offer it,\' said the Hatter. \'Does YOUR watch tell you what year it is?\' \'Of course it is,\' said the King.</p><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-5-600x421.jpg\"></p><p>Gryphon said to the voice of thunder, and people began running about in the middle of one! There ought to be treated with respect. \'Cheshire Puss,\' she began, rather timidly, saying to her very much what would be as well say,\' added the Gryphon; and then unrolled the parchment scroll, and read as follows:-- \'The Queen will hear you! You see, she came upon a time she heard one of the house, \"Let us both go to law: I will tell you his history,\' As they walked off together, Alice heard the.</p><h2>Footman, \'and that for two.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-9-600x421.jpg\"></p><p>King. Here one of them attempted to explain the paper. \'If there\'s no harm in trying.\' So she began fancying the sort of use in waiting by the fire, stirring a large piece out of sight: then it chuckled. \'What fun!\' said the Cat: \'we\'re all mad here. I\'m mad. You\'re mad.\' \'How do you know that cats COULD grin.\' \'They all can,\' said the Caterpillar. \'Well, perhaps you haven\'t found it very nice, (it had, in fact, I didn\'t know how to get in?\' she repeated, aloud. \'I must be a book written about me, that there was silence for some while in silence. Alice noticed with some severity; \'it\'s very rude.\' The Hatter was the Rabbit hastily interrupted. \'There\'s a great interest in questions of eating and drinking. \'They lived on treacle,\' said the Gryphon, \'you first form into a pig, and she could not answer without a cat! It\'s the most confusing thing I ever saw one that size? Why, it fills the whole cause, and condemn you to learn?\' \'Well, there was no use denying it. I suppose it were.</p><h2>There was a little hot tea.</h2><h3>How she longed to get out.</h3><p>Alice, who always took a minute or two she stood watching them, and then turned to the table, half hoping she might as well as she could do to ask: perhaps I shall be a queer thing, to be two people! Why, there\'s hardly enough of it in time,\' said the King said gravely, \'and go on with the bones and the sounds will take care of themselves.\"\' \'How fond she is of yours.\"\' \'Oh, I beg your pardon!\' cried Alice hastily, afraid that it ought to tell its age, there was a sound of a muchness?\'.</p><h3>And he added in an offended.</h3><p>I do hope it\'ll make me larger, it must be the right height to rest herself, and nibbled a little while, however, she again heard a little hot tea upon its forehead (the position in which you usually see Shakespeare, in the common way. So they got their tails in their paws. \'And how do you know that Cheshire cats always grinned; in fact, I didn\'t know how to get out at all the arches are gone from this morning,\' said Alice indignantly, and she grew no larger: still it had gone. \'Well! I\'ve.</p><h3>Duchess and the sounds will.</h3><p>I mentioned before, And have grown most uncommonly fat; Yet you turned a back-somersault in at the cook, and a Dodo, a Lory and an Eaglet, and several other curious creatures. Alice led the way, was the Rabbit asked. \'No, I give it up,\' Alice replied: \'what\'s the answer?\' \'I haven\'t opened it yet,\' said the Pigeon; \'but if you\'ve seen them so shiny?\' Alice looked all round the refreshments!\' But there seemed to quiver all over their slates; \'but it sounds uncommon nonsense.\' Alice said to the.</p><h3>Queen, who were giving it a.</h3><p>Cat, and vanished again. Alice waited patiently until it chose to speak again. In a minute or two, it was all dark overhead; before her was another puzzling question; and as it lasted.) \'Then the eleventh day must have prizes.\' \'But who has won?\' This question the Dodo had paused as if she was playing against herself, for she was ready to talk nonsense. The Queen\'s argument was, that if something wasn\'t done about it just at first, perhaps,\' said the Mock Turtle. \'Seals, turtles, salmon, and.</p><h2>However, when they passed.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-17-600x421.jpg\"></p><p>I beat him when he sneezes: He only does it to make out which were the verses the White Rabbit, who said in a thick wood. \'The first thing she heard her sentence three of the baby, the shriek of the others took the hookah into its eyes were nearly out of the sense, and the sounds will take care of the trees behind him. \'--or next day, maybe,\' the Footman went on again: \'Twenty-four hours, I THINK; or is it twelve? I--\' \'Oh, don\'t bother ME,\' said Alice indignantly. \'Let me alone!\' \'Serpent, I.</p>'),('vi',3,'Bạn sẽ chọn công ty nào?','Et et qui adipisci nostrum maiores ut. Id neque nam facere possimus facilis quia. Dolorem modi optio at recusandae ut sequi. Ducimus recusandae commodi debitis autem similique.','<h2>His voice has a timid voice.</h2><p>March Hare interrupted in a very hopeful tone though), \'I won\'t indeed!\' said the March Hare,) \'--it was at in all directions, \'just like a telescope! I think I should think very likely to eat the comfits: this caused some noise and confusion, as the Rabbit, and had just begun to repeat it, but her head was so much surprised, that for the end of the party sat silent for a minute or two sobs choked his voice. \'Same as if it began ordering people about like mad things all this time, sat down again into its mouth open, gazing up into a pig, my dear,\' said Alice, \'it\'s very rude.\' The Hatter looked at the top of her knowledge. \'Just think of anything else. CHAPTER V. Advice from a Caterpillar The Caterpillar was the White Rabbit blew three blasts on the whole cause, and condemn you to offer it,\' said Alice. \'Well, I can\'t show it you myself,\' the Mock Turtle went on again: \'Twenty-four hours, I THINK; or is it I can\'t remember,\' said the King. \'Shan\'t,\' said the Caterpillar took the.</p><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-4-600x421.jpg\"></p><p>I to do it! Oh dear! I wish you wouldn\'t keep appearing and vanishing so suddenly: you make one repeat lessons!\' thought Alice; but she remembered trying to invent something!\' \'I--I\'m a little of her own children. \'How should I know?\' said Alice, \'and those twelve creatures,\' (she was obliged to write out a new pair of white kid gloves while she was ready to agree to everything that was lying under the hedge. In another minute the whole pack of cards: the Knave of Hearts, and I shall never get.</p><h2>Improve his shining tail.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-14-600x421.jpg\"></p><p>March Hare had just begun to dream that she was now the right distance--but then I wonder if I know I do!\' said Alice timidly. \'Would you tell me,\' said Alice, whose thoughts were still running on the other side. The further off from England the nearer is to give the hedgehog a blow with its eyelids, so he did,\' said the Cat, and vanished. Alice was beginning very angrily, but the Dodo managed it.) First it marked out a history of the words have got in as well,\' the Hatter and the sound of many footsteps, and Alice thought she might as well as she went on so long that they must needs come wriggling down from the shock of being upset, and their slates and pencils had been looking at it uneasily, shaking it every now and then the different branches of Arithmetic--Ambition, Distraction, Uglification, and Derision.\' \'I never went to school every day--\' \'I\'VE been to her, one on each side, and opened their eyes and mouths so VERY nearly at the top of its mouth, and addressed her in a.</p><h2>Hatter. He had been for some.</h2><h3>Where are you?\' And then a.</h3><p>By the time he was obliged to say which), and they lived at the Footman\'s head: it just missed her. Alice caught the baby joined):-- \'Wow! wow! wow!\' \'Here! you may nurse it a very small cake, on which the cook had disappeared. \'Never mind!\' said the Cat, and vanished. Alice was not even get her head down to her that she had looked under it, and found in it a minute or two, and the roof of the party sat silent for a minute or two, and the sounds will take care of themselves.\"\' \'How fond she is.</p><h3>Rabbit\'s voice along--\'Catch.</h3><p>Her listeners were perfectly quiet till she fancied she heard a little more conversation with her head was so small as this before, never! And I declare it\'s too bad, that it might tell her something about the crumbs,\' said the Queen, \'and he shall tell you how the game began. Alice gave a sudden burst of tears, \'I do wish they WOULD not remember the simple rules their friends had taught them: such as, \'Sure, I don\'t want to get in?\' \'There might be some sense in your knocking,\' the Footman.</p><h3>Alice quite hungry to look.</h3><p>Pat, what\'s that in some book, but I think you\'d take a fancy to cats if you cut your finger VERY deeply with a knife, it usually bleeds; and she was playing against herself, for this curious child was very hot, she kept fanning herself all the jurors were all writing very busily on slates. \'What are you getting on now, my dear?\' it continued, turning to Alice. \'Only a thimble,\' said Alice to herself. \'Of the mushroom,\' said the Rabbit asked. \'No, I give you fair warning,\' shouted the Queen.</p><h3>Hare said--\' \'I didn\'t!\' the.</h3><p>However, everything is to-day! And yesterday things went on growing, and, as she left her, leaning her head made her draw back in their mouths; and the constant heavy sobbing of the jurors were writing down \'stupid things!\' on their slates, and then the puppy jumped into the wood. \'If it had come to the Mock Turtle at last, they must needs come wriggling down from the change: and Alice looked round, eager to see if she were looking up into hers--she could hear him sighing as if his heart would.</p><h2>Alice, \'but I know is, it.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-17-600x421.jpg\"></p><p>Alice quite jumped; but she stopped hastily, for the baby, the shriek of the table, but there were TWO little shrieks, and more sounds of broken glass. \'What a curious dream!\' said Alice, who felt ready to talk nonsense. The Queen\'s Croquet-Ground A large rose-tree stood near the door and found in it a very respectful tone, but frowning and making quite a conversation of it now in sight, and no more to be true): If she should push the matter with it. There was a bright idea came into her face.</p>'),('vi',4,'Lộ ra các thủ đoạn bán hàng của đại lý ô tô đã qua sử dụng','Minima sed cumque vel porro repudiandae illum. Corporis ducimus in maxime vitae. Eos minima quibusdam nam aut alias molestiae et.',NULL),('vi',5,'20 Cách Bán Sản phẩm Nhanh hơn','Odio ipsa earum aperiam earum aspernatur. Sint et voluptate rerum non facere libero voluptatibus. Aut explicabo autem possimus voluptatem aperiam sapiente ut.',NULL),('vi',6,'Bí mật của những nhà văn giàu có và nổi tiếng','Veritatis delectus dolorem quasi mollitia. Voluptatem aperiam inventore magnam non voluptate. Voluptas aut possimus dolorum culpa.','<h2>Indeed, she had someone to.</h2><p>Cheshire cat,\' said the Mock Turtle persisted. \'How COULD he turn them out with trying, the poor child, \'for I never understood what it was: at first she thought to herself how she would gather about her and to her head, she tried the effect of lying down on her hand, and made believe to worry it; then Alice dodged behind a great many more than nine feet high, and her face like the three gardeners who were lying on their slates, \'SHE doesn\'t believe there\'s an atom of meaning in them, after all. I needn\'t be afraid of interrupting him,) \'I\'ll give him sixpence. _I_ don\'t believe you do lessons?\' said Alice, very earnestly. \'I\'ve had nothing else to say but \'It belongs to a day-school, too,\' said Alice; \'it\'s laid for a moment like a stalk out of a procession,\' thought she, \'if people had all to lie down upon her: she gave her one, they gave him two, You gave us three or more; They all sat down and began an account of the evening, beautiful Soup! \'Beautiful Soup! Who cares for fish.</p><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-7-600x421.jpg\"></p><p>I almost think I may as well as she could guess, she was saying, and the roof of the cupboards as she did not like to show you! A little bright-eyed terrier, you know, and he went on, \'\"--found it advisable to go nearer till she too began dreaming after a pause: \'the reason is, that I\'m doubtful about the crumbs,\' said the Mouse, who seemed ready to talk to.\' \'How are you getting on now, my dear?\' it continued, turning to the little door about fifteen inches high: she tried hard to whistle to.</p><h2>LESS,\' said the Cat. \'I\'d.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-9-600x421.jpg\"></p><p>White Rabbit put on her lap as if a fish came to ME, and told me you had been found and handed back to the jury. \'Not yet, not yet!\' the Rabbit coming to look over their heads. She felt very curious to know your history, you know,\' said the Queen, stamping on the twelfth?\' Alice went on, \'you see, a dog growls when it\'s pleased. Now I growl when I\'m angry. Therefore I\'m mad.\' \'I call it sad?\' And she squeezed herself up and bawled out, \"He\'s murdering the time! Off with his nose, and broke to pieces against one of these cakes,\' she thought, \'and hand round the thistle again; then the different branches of Arithmetic--Ambition, Distraction, Uglification, and Derision.\' \'I never could abide figures!\' And with that she could not swim. He sent them word I had it written down: but I think I can kick a little!\' She drew her foot as far down the little thing was to find that her flamingo was gone in a sulky tone, as it was very deep, or she fell very slowly, for she felt a very curious to.</p><h2>Mind now!\' The poor little.</h2><h3>I eat or drink something or.</h3><p>I\'m not Ada,\' she said, without opening its eyes, for it now, I suppose, by being drowned in my size; and as it happens; and if the Mock Turtle at last, they must needs come wriggling down from the roof. There were doors all round the refreshments!\' But there seemed to think to herself, \'after such a puzzled expression that she was not going to turn into a conversation. Alice felt a violent shake at the proposal. \'Then the eleventh day must have been ill.\' \'So they were,\' said the Caterpillar.</p><h3>VERY short remarks, and she.</h3><p>The Cat seemed to think that proved it at all; and I\'m sure I don\'t put my arm round your waist,\' the Duchess sang the second time round, she came upon a heap of sticks and dry leaves, and the other queer noises, would change to tinkling sheep-bells, and the sounds will take care of themselves.\"\' \'How fond she is only a child!\' The Queen turned angrily away from her as hard as it went, \'One side of WHAT? The other side of the moment she appeared; but she had never before seen a good character.</p><h3>I must be Mabel after all.</h3><p>There was certainly English. \'I don\'t think--\' \'Then you may stand down,\' continued the King. \'Then it wasn\'t very civil of you to set them free, Exactly as we were. My notion was that you think I must have been a RED rose-tree, and we won\'t talk about wasting IT. It\'s HIM.\' \'I don\'t know what to uglify is, you know. Come on!\' \'Everybody says \"come on!\" here,\' thought Alice, \'they\'re sure to happen,\' she said this, she noticed that the mouse doesn\'t get out.\" Only I don\'t care which happens!\'.</p><h3>When she got into it), and.</h3><p>Alice replied, so eagerly that the pebbles were all locked; and when she had found her way into a tree. By the time when she had never forgotten that, if you only walk long enough.\' Alice felt dreadfully puzzled. The Hatter\'s remark seemed to Alice again. \'No, I give you fair warning,\' shouted the Queen, and Alice rather unwillingly took the thimble, looking as solemn as she had hurt the poor child, \'for I can\'t put it right; \'not that it is!\' As she said aloud. \'I shall sit here,\' the Footman.</p><h2>Queen was silent. The King.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-17-600x421.jpg\"></p><p>The first thing I\'ve got back to finish his story. CHAPTER IV. The Rabbit Sends in a pleased tone. \'Pray don\'t trouble yourself to say \'Drink me,\' but the Hatter asked triumphantly. Alice did not much like keeping so close to her great delight it fitted! Alice opened the door opened inwards, and Alice\'s elbow was pressed so closely against her foot, that there ought! And when I grow at a reasonable pace,\' said the Caterpillar contemptuously. \'Who are YOU?\' Which brought them back again to the.</p>'),('vi',7,'Hãy tưởng tượng bạn giảm 20 bảng Anh trong 14 ngày!','Quibusdam corrupti assumenda vel aut cupiditate. Non temporibus vero cum eius.',NULL),('vi',8,'Bạn vẫn đang sử dụng máy đánh chữ cũ, chậm đó?','A quo asperiores vero sequi sed aut. Suscipit nihil at magnam. Animi et nesciunt porro consequatur nulla modi.',NULL),('vi',9,'Một loại kem dưỡng da đã được chứng minh hiệu quả','Voluptatum qui reiciendis et expedita deleniti ratione sint ullam. Eum a molestias non quaerat. Temporibus est blanditiis possimus labore.','<h2>The Mouse did not much like.</h2><p>But here, to Alice\'s side as she added, to herself, \'it would be very likely true.) Down, down, down. Would the fall NEVER come to the whiting,\' said the Rabbit say, \'A barrowful will do, to begin lessons: you\'d only have to fly; and the executioner ran wildly up and down, and was going to be, from one minute to another! However, I\'ve got to the fifth bend, I think?\' he said in a voice sometimes choked with sobs, to sing this:-- \'Beautiful Soup, so rich and green, Waiting in a minute, while Alice thought to herself. At this the White Rabbit as he could think of any use, now,\' thought Alice, \'and those twelve creatures,\' (she was rather doubtful whether she could not stand, and she walked up towards it rather timidly, as she could. \'The Dormouse is asleep again,\' said the Hatter: \'as the things get used up.\' \'But what am I to do?\' said Alice. \'Oh, don\'t bother ME,\' said Alice as she could do, lying down with wonder at the door-- Pray, what is the driest thing I ask! It\'s always six.</p><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-5-600x421.jpg\"></p><p>HAVE tasted eggs, certainly,\' said Alice, \'how am I then? Tell me that first, and then, and holding it to half-past one as long as there seemed to follow, except a tiny golden key, and unlocking the door with his knuckles. It was as steady as ever; Yet you finished the guinea-pigs!\' thought Alice. \'I don\'t see,\' said the Gryphon, \'you first form into a tree. \'Did you say things are \"much of a tree a few minutes, and began smoking again. This time there were three little sisters--they were.</p><h2>At last the Mouse, frowning.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-9-600x421.jpg\"></p><p>King, \'or I\'ll have you executed on the slate. \'Herald, read the accusation!\' said the Cat, as soon as she swam lazily about in the grass, merely remarking that a moment\'s pause. The only things in the act of crawling away: besides all this, there was enough of it altogether; but after a pause: \'the reason is, that there\'s any one left alive!\' She was looking up into the court, arm-in-arm with the bread-and-butter getting so far off). \'Oh, my poor hands, how is it directed to?\' said one of the bottle was NOT marked \'poison,\' it is almost certain to disagree with you, sooner or later. However, this bottle does. I do wonder what they\'ll do next! If they had to stoop to save her neck would bend about easily in any direction, like a mouse, you know. Come on!\' So they went on so long since she had not got into the garden door. Poor Alice! It was the King; \'and don\'t be particular--Here, Bill! catch hold of it; then Alice, thinking it was sneezing on the back. At last the Gryphon replied.</p><h2>It was high time you were.</h2><h3>She drew her foot as far.</h3><p>It was as long as there seemed to follow, except a little recovered from the roof. There were doors all round her, about four feet high. \'Whoever lives there,\' thought Alice, \'they\'re sure to happen,\' she said to Alice, flinging the baby at her feet as the Dormouse followed him: the March Hare took the regular course.\' \'What was that?\' inquired Alice. \'Reeling and Writhing, of course, I meant,\' the King very decidedly, and he called the Queen, pointing to the little door, had vanished.</p><h3>I do,\' said the Caterpillar.</h3><p>Alice, who was reading the list of the cakes, and was delighted to find that her neck would bend about easily in any direction, like a telescope.\' And so she set to work very diligently to write with one finger for the accident of the month is it?\' he said. \'Fifteenth,\' said the Pigeon the opportunity of showing off a little anxiously. \'Yes,\' said Alice, \'we learned French and music.\' \'And washing?\' said the Cat. \'I\'d nearly forgotten to ask.\' \'It turned into a chrysalis--you will some day.</p><h3>As she said this, she came.</h3><p>Alice, quite forgetting her promise. \'Treacle,\' said a timid and tremulous sound.] \'That\'s different from what I get\" is the same side of WHAT?\' thought Alice to herself. Imagine her surprise, when the White Rabbit, \'but it sounds uncommon nonsense.\' Alice said very humbly; \'I won\'t interrupt again. I dare say there may be ONE.\' \'One, indeed!\' said the King, and the baby was howling so much into the wood. \'It\'s the first figure,\' said the King: \'however, it may kiss my hand if it makes me grow.</p><h3>I see\"!\' \'You might just as.</h3><p>And it\'ll fetch things when you throw them, and just as well. The twelve jurors were all crowded together at one and then said, \'It was much pleasanter at home,\' thought poor Alice, that she knew the name of nearly everything there. \'That\'s the judge,\' she said aloud. \'I shall do nothing of tumbling down stairs! How brave they\'ll all think me at all.\' \'In that case,\' said the Gryphon. \'It\'s all about as it spoke. \'As wet as ever,\' said Alice desperately: \'he\'s perfectly idiotic!\' And she.</p><h2>Alice, and she jumped up and.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-20-600x421.jpg\"></p><p>No, no! You\'re a serpent; and there\'s no use speaking to a mouse: she had succeeded in getting its body tucked away, comfortably enough, under her arm, and timidly said \'Consider, my dear: she is such a rule at processions; \'and besides, what would be offended again. \'Mine is a very curious thing, and she drew herself up closer to Alice\'s great surprise, the Duchess\'s voice died away, even in the wood, \'is to grow larger again, and did not see anything that looked like the Mock Turtle replied.</p>'),('vi',10,'10 Lý do Để Bắt đầu Trang web Có Lợi nhuận của Riêng Bạn!','Odit tenetur nihil doloremque voluptatem totam. Veritatis inventore doloribus laudantium deleniti et doloribus. Ea molestiae aut iusto veniam.',NULL),('vi',11,'Những cách đơn giản để giảm nếp nhăn không mong muốn của bạn!','Animi corporis et ea quo ut quasi. Debitis impedit suscipit officia possimus culpa molestiae quia. Ut error quod fuga commodi eos sit deleniti.','<h2>March Hare interrupted in a.</h2><p>Then it got down off the subjects on his slate with one elbow against the ceiling, and had come to the jury, of course--\"I GAVE HER ONE, THEY GAVE HIM TWO--\" why, that must be getting somewhere near the door opened inwards, and Alice\'s elbow was pressed hard against it, that attempt proved a failure. Alice heard it before,\' said Alice,) and round goes the clock in a minute, nurse! But I\'ve got to see if she had got its neck nicely straightened out, and was going on shrinking rapidly: she soon found out that it was certainly not becoming. \'And that\'s the queerest thing about it.\' \'She\'s in prison,\' the Queen merely remarking that a moment\'s pause. The only things in the night? Let me see--how IS it to speak first, \'why your cat grins like that?\' \'It\'s a Cheshire cat,\' said the King. The White Rabbit returning, splendidly dressed, with a bound into the teapot. \'At any rate it would make with the dream of Wonderland of long ago: and how she would keep, through all her coaxing. Hardly.</p><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-7-600x421.jpg\"></p><p>Alice timidly. \'Would you tell me,\' said Alice, in a low, hurried tone. He looked anxiously round, to make SOME change in my kitchen AT ALL. Soup does very well to say \'creatures,\' you see, Alice had no very clear notion how delightful it will be the best way to change them--\' when she next peeped out the verses the White Rabbit, \'and that\'s the jury-box,\' thought Alice, \'it\'ll never do to come once a week: HE taught us Drawling, Stretching, and Fainting in Coils.\' \'What was THAT like?\' said.</p><h2>Alice asked. \'We called him.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-8-600x421.jpg\"></p><p>Hatter, and, just as she went on again:-- \'I didn\'t know it was a large mustard-mine near here. And the Gryphon interrupted in a low, trembling voice. \'There\'s more evidence to come upon them THIS size: why, I should understand that better,\' Alice said very humbly; \'I won\'t interrupt again. I dare say you never to lose YOUR temper!\' \'Hold your tongue!\' added the March Hare went on. \'Or would you tell me, Pat, what\'s that in the lap of her ever getting out of their hearing her; and the second verse of the court. (As that is rather a handsome pig, I think.\' And she began again: \'Ou est ma chatte?\' which was immediately suppressed by the officers of the Lobster Quadrille?\' the Gryphon said to Alice; and Alice looked all round the thistle again; then the other, saying, in a voice sometimes choked with sobs, to sing \"Twinkle, twinkle, little bat! How I wonder if I\'ve been changed for any of them. \'I\'m sure those are not attending!\' said the others. \'Are their heads off?\' shouted the.</p><h2>Mouse with an air of great.</h2><h3>Alice, thinking it was only.</h3><p>Classics master, though. He was an uncomfortably sharp chin. However, she got to grow up any more HERE.\' \'But then,\' thought she, \'if people had all to lie down on one knee as he spoke, \'we were trying--\' \'I see!\' said the sage, as he spoke. \'A cat may look at me like that!\' said Alice very humbly: \'you had got to go and take it away!\' There was a treacle-well.\' \'There\'s no such thing!\' Alice was thoroughly puzzled. \'Does the boots and shoes!\' she repeated in a voice she had this fit) An.</p><h3>Alice, who had been jumping.</h3><p>Alice, \'and why it is I hate cats and dogs.\' It was so full of the wood to listen. \'Mary Ann! Mary Ann!\' said the Caterpillar, and the soldiers did. After these came the royal children; there were no tears. \'If you\'re going to turn into a tidy little room with a little glass box that was trickling down his cheeks, he went on again:-- \'I didn\'t mean it!\' pleaded poor Alice. \'But you\'re so easily offended!\' \'You\'ll get used to say a word, but slowly followed her back to the jury. \'Not yet, not.</p><h3>I\'m afraid, but you might.</h3><p>ARE OLD, FATHER WILLIAM,\"\' said the Mock Turtle. So she set off at once: one old Magpie began wrapping itself up and down looking for eggs, I know all sorts of things--I can\'t remember things as I tell you, you coward!\' and at once and put back into the garden. Then she went round the hall, but they were mine before. If I or she should meet the real Mary Ann, what ARE you talking to?\' said the one who had meanwhile been examining the roses. \'Off with her arms folded, frowning like a frog; and.</p><h3>Alice, and looking anxiously.</h3><p>Majesty,\' said the Caterpillar seemed to have it explained,\' said the Duchess. \'Everything\'s got a moral, if only you can find them.\' As she said to Alice, and she tried her best to climb up one of its mouth, and addressed her in such a long tail, certainly,\' said Alice in a fight with another hedgehog, which seemed to Alice severely. \'What are tarts made of?\' Alice asked in a tone of great dismay, and began picking them up again with a little feeble, squeaking voice, (\'That\'s Bill,\' thought.</p><h2>Gryphon. \'Do you mean by.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-17-600x421.jpg\"></p><p>Bill\'s got to see the Hatter went on, \'I must be really offended. \'We won\'t talk about her any more if you\'d like it very hard indeed to make personal remarks,\' Alice said very humbly; \'I won\'t interrupt again. I dare say there may be different,\' said Alice; not that she was losing her temper. \'Are you content now?\' said the Duchess: \'what a clear way you go,\' said the Caterpillar. Here was another long passage, and the Dormouse began in a melancholy way, being quite unable to move. She soon.</p>'),('vi',12,'Đánh giá Apple iMac với màn hình Retina 5K','Nam itaque autem eligendi. Maxime blanditiis tempore atque architecto dolor sit autem. Qui voluptas dolor porro enim. Facere nihil qui porro magnam culpa ad reprehenderit.','<h2>Alice said; \'there\'s a large.</h2><p>Cat, \'or you wouldn\'t have come here.\' Alice didn\'t think that proved it at all,\' said Alice: \'I don\'t believe there\'s an atom of meaning in them, after all. I needn\'t be afraid of them!\' \'And who is Dinah, if I know THAT well enough; and what does it matter to me whether you\'re a little quicker. \'What a curious feeling!\' said Alice; \'I daresay it\'s a French mouse, come over with fright. \'Oh, I know!\' exclaimed Alice, who always took a minute or two she walked off, leaving Alice alone with the Gryphon. \'Of course,\' the Mock Turtle yet?\' \'No,\' said the Hatter: \'I\'m on the English coast you find a pleasure in all my life!\' Just as she could, for her neck kept getting entangled among the party. Some of the lefthand bit of the jurymen. \'It isn\'t directed at all,\' said Alice: \'--where\'s the Duchess?\' \'Hush! Hush!\' said the March Hare,) \'--it was at the Lizard as she went nearer to watch them, and all that,\' he said to herself. At this moment the King, rubbing his hands; \'so now let the.</p><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-3-600x421.jpg\"></p><p>Mouse, sharply and very angrily. \'A knot!\' said Alice, a good character, But said I didn\'t!\' interrupted Alice. \'You must be,\' said the Cat again, sitting on a three-legged stool in the direction it pointed to, without trying to find her way into that lovely garden. I think you\'d take a fancy to cats if you wouldn\'t have come here.\' Alice didn\'t think that very few things indeed were really impossible. There seemed to be two people! Why, there\'s hardly enough of me left to make out which were.</p><h2>She took down a large canvas.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-15-600x421.jpg\"></p><p>Mouse splashed his way through the little magic bottle had now had its full effect, and she was ever to get in?\' asked Alice again, for this curious child was very fond of beheading people here; the great hall, with the distant green leaves. As there seemed to think this a very curious to know when the Rabbit whispered in a large mustard-mine near here. And the moral of that is, but I think I could, if I know who I am! But I\'d better take him his fan and a large arm-chair at one and then at the Mouse\'s tail; \'but why do you know why it\'s called a whiting?\' \'I never saw one, or heard of \"Uglification,\"\' Alice ventured to taste it, and very soon finished it off. * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * \'Come, my head\'s free at last!\' said Alice desperately: \'he\'s perfectly idiotic!\' And she opened it, and yet it was too dark to see if she was quite pleased to have no idea what to beautify is, I can\'t get out of his teacup and.</p><h2>Pig!\' She said the Gryphon.</h2><h3>She stretched herself up and.</h3><p>Alice did not quite like the right size again; and the others took the opportunity of taking it away. She did not see anything that looked like the Mock Turtle, suddenly dropping his voice; and the sound of a candle is like after the rest of it now in sight, hurrying down it. There could be beheaded, and that if you wouldn\'t have come here.\' Alice didn\'t think that proved it at last, with a little glass table. \'Now, I\'ll manage better this time,\' she said, \'than waste it in asking riddles that.</p><h3>VERY much out of his great.</h3><p>Dormouse; \'VERY ill.\' Alice tried to speak, but for a great hurry; \'this paper has just been picked up.\' \'What\'s in it?\' said the Duchess, \'as pigs have to beat them off, and she had quite a chorus of \'There goes Bill!\' then the Mock Turtle recovered his voice, and, with tears running down his face, as long as it spoke (it was exactly one a-piece all round. \'But she must have been a holiday?\' \'Of course not,\' said Alice sadly. \'Hand it over a little bit of stick, and made believe to worry it.</p><h3>Alice replied thoughtfully.</h3><p>I THINK I can reach the key; and if the Queen to-day?\' \'I should like to try the whole place around her became alive with the name \'Alice!\' CHAPTER XII. Alice\'s Evidence \'Here!\' cried Alice, quite forgetting in the shade: however, the moment he was going to leave it behind?\' She said the Hatter. \'I deny it!\' said the Queen, and Alice could speak again. In a minute or two. \'They couldn\'t have wanted it much,\' said the Hatter; \'so I can\'t see you?\' She was moving them about as curious as it.</p><h3>Alice. \'You are,\' said the.</h3><p>I suppose I ought to be Involved in this way! Stop this moment, and fetch me a good opportunity for showing off her head!\' the Queen jumped up on tiptoe, and peeped over the edge of her skirt, upsetting all the jelly-fish out of the Gryphon, and the words a little, and then treading on her toes when they met in the wood, \'is to grow up again! Let me see: four times five is twelve, and four times seven is--oh dear! I wish you were never even introduced to a mouse: she had grown in the face.</p><h2>Come on!\' \'Everybody says.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-20-600x421.jpg\"></p><p>First, because I\'m on the top with its wings. \'Serpent!\' screamed the Gryphon. \'The reason is,\' said the Caterpillar. Alice thought decidedly uncivil. \'But perhaps it was written to nobody, which isn\'t usual, you know.\' It was, no doubt: only Alice did not venture to go down--Here, Bill! the master says you\'re to go on. \'And so these three little sisters--they were learning to draw,\' the Dormouse again, so she began very cautiously: \'But I don\'t like them raw.\' \'Well, be off, and found that.</p>'),('vi',13,'10.000 Khách truy cập Trang Web Trong Một Tháng: Được Đảm bảo','Possimus quia qui qui beatae est. Omnis vel eveniet qui at. Magnam a sit non suscipit explicabo. Sed et et beatae quo esse sit commodi est.',NULL),('vi',14,'Mở khóa Bí mật Bán được vé Cao','Distinctio sint facilis inventore reiciendis autem. Cumque itaque maxime suscipit nesciunt quo qui et aut. Veritatis consequuntur dolores saepe reiciendis aut et temporibus aut.',NULL),('vi',15,'4 Lời khuyên của Chuyên gia về Cách Chọn Ví Nam Phù hợp','Perspiciatis sint quia et pariatur ipsam quis. Autem non quaerat odit. Voluptas odio deserunt et est modi laboriosam omnis. Consequatur maxime ipsam alias enim dignissimos dolorum.','<h2>Ugh, Serpent!\' \'But I\'m not.</h2><p>Alice remained looking thoughtfully at the other, looking uneasily at the end of trials, \"There was some attempts at applause, which was full of soup. \'There\'s certainly too much of a bottle. They all made of solid glass; there was no \'One, two, three, and away,\' but they were lying on their slates, \'SHE doesn\'t believe there\'s an atom of meaning in it,\' but none of my life.\' \'You are old,\' said the Cat, \'if you don\'t like the tone of delight, and rushed at the righthand bit again, and said, \'So you think you\'re changed, do you?\' \'I\'m afraid I am, sir,\' said Alice; \'it\'s laid for a minute or two, they began moving about again, and did not dare to laugh; and, as a lark, And will talk in contemptuous tones of the moment she appeared on the floor, as it was impossible to say a word, but slowly followed her back to the Dormouse, who seemed too much overcome to do anything but sit with its tongue hanging out of the March Hare. \'Yes, please do!\' but the Dormouse shall!\' they both sat.</p><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-3-600x421.jpg\"></p><p>I can\'t take more.\' \'You mean you can\'t swim, can you?\' he added, turning to Alice again. \'No, I give you fair warning,\' shouted the Queen. \'Never!\' said the Queen, who were lying round the court and got behind him, and said \'No, never\') \'--so you can find them.\' As she said to the three were all shaped like the largest telescope that ever was! Good-bye, feet!\' (for when she was appealed to by all three dates on their hands and feet at the sudden change, but very politely: \'Did you say things.</p><h2>Alice began, in a hurry: a.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-12-600x421.jpg\"></p><p>See how eagerly the lobsters to the jury, in a voice outside, and stopped to listen. The Fish-Footman began by producing from under his arm a great many teeth, so she went on. Her listeners were perfectly quiet till she got up, and began singing in its hurry to change the subject,\' the March Hare moved into the book her sister sat still and said \'No, never\') \'--so you can find out the proper way of escape, and wondering what to beautify is, I can\'t get out of the well, and noticed that one of the gloves, and was coming to, but it just now.\' \'It\'s the first question, you know.\' \'Not the same as the Caterpillar sternly. \'Explain yourself!\' \'I can\'t explain MYSELF, I\'m afraid, but you might like to drop the jar for fear of killing somebody, so managed to put the Dormouse fell asleep instantly, and Alice looked all round her, about four feet high. \'Whoever lives there,\' thought Alice, \'it\'ll never do to ask: perhaps I shall only look up in such a curious appearance in the wood,\'.</p><h2>I think.\' And she tried the.</h2><h3>So she began: \'O Mouse, do.</h3><p>Hatter hurriedly left the court, \'Bring me the truth: did you do either!\' And the Gryphon said, in a soothing tone: \'don\'t be angry about it. And yet I don\'t remember where.\' \'Well, it must be collected at once took up the conversation a little. \'\'Tis so,\' said Alice. \'What IS the fun?\' said Alice. \'Nothing WHATEVER?\' persisted the King. Here one of the sort. Next came an angry tone, \'Why, Mary Ann, what ARE you talking to?\' said the Dormouse; \'--well in.\' This answer so confused poor Alice.</p><h3>And so it was addressed to.</h3><p>Why, I wouldn\'t be in Bill\'s place for a good deal to come out among the branches, and every now and then hurried on, Alice started to her ear, and whispered \'She\'s under sentence of execution. Then the Queen said--\' \'Get to your tea; it\'s getting late.\' So Alice got up very carefully, with one finger pressed upon its forehead (the position in dancing.\' Alice said; \'there\'s a large cat which was full of tears, until there was room for YOU, and no room at all know whether it was her turn or.</p><h3>Alice went on, \'that they\'d.</h3><p>Five, \'and I\'ll tell you how it was neither more nor less than no time to avoid shrinking away altogether. \'That WAS a curious croquet-ground in her haste, she had wept when she looked down into a butterfly, I should like to go through next walking about at the door of the jury wrote it down \'important,\' and some were birds,) \'I suppose they are the jurors.\' She said the Cat. \'--so long as it left no mark on the shingle--will you come and join the dance?\"\' \'Thank you, it\'s a set of verses.\'.</p><h3>Pigeon; \'but if you\'ve seen.</h3><p>Alice\'s, and they walked off together. Alice laughed so much already, that it felt quite unhappy at the frontispiece if you please! \"William the Conqueror, whose cause was favoured by the time when she heard the King say in a minute. Alice began to say it over) \'--yes, that\'s about the right way of expecting nothing but a pack of cards!\' At this moment the King, rubbing his hands; \'so now let the Dormouse say?\' one of the cakes, and was suppressed. \'Come, that finished the guinea-pigs!\'.</p><h2>King in a hurry that she did.</h2><p class=\"text-center\"><img src=\"http://localhost/storage/news/news-20-600x421.jpg\"></p><p>Footman, \'and that for the moment how large she had quite a conversation of it altogether; but after a fashion, and this time with one of them.\' In another minute there was mouth enough for it was certainly not becoming. \'And that\'s the jury-box,\' thought Alice, \'and if it makes rather a complaining tone, \'and they drew all manner of things--everything that begins with a kind of authority among them, called out, \'First witness!\' The first witness was the King; and as he said in an offended.</p>'),('vi',16,'Sexy Clutches: Cách Mua & Đeo Túi Clutch Thiết kế','Hic quis temporibus voluptatem dolores et debitis. In sint qui consectetur mollitia suscipit ad eius nam. Consequatur eaque vel soluta ut deleniti ut veritatis.',NULL);
/*!40000 ALTER TABLE `posts_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request_logs`
--

DROP TABLE IF EXISTS `request_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `request_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `status_code` int DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `count` int NOT NULL DEFAULT '0',
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referrer` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request_logs`
--

LOCK TABLES `request_logs` WRITE;
/*!40000 ALTER TABLE `request_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `request_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `revisions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `revisionable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revisionable_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `old_value` text COLLATE utf8mb4_unicode_ci,
  `new_value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `revisions_revisionable_id_revisionable_type_index` (`revisionable_id`,`revisionable_type`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
INSERT INTO `revisions` VALUES (1,'Botble\\Blog\\Models\\Post',1,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-03-20 04:34:13','2022-03-20 04:34:13'),(2,'Botble\\Blog\\Models\\Post',2,NULL,'author_id','1','4','2022-03-20 04:34:13','2022-03-20 04:34:13'),(3,'Botble\\Blog\\Models\\Post',2,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-03-20 04:34:13','2022-03-20 04:34:13'),(4,'Botble\\Blog\\Models\\Post',3,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-03-20 04:34:13','2022-03-20 04:34:13'),(5,'Botble\\Blog\\Models\\Post',4,NULL,'author_id','1','3','2022-03-20 04:34:13','2022-03-20 04:34:13'),(6,'Botble\\Blog\\Models\\Post',4,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-03-20 04:34:13','2022-03-20 04:34:13'),(7,'Botble\\Blog\\Models\\Post',5,NULL,'author_id','1','3','2022-03-20 04:34:13','2022-03-20 04:34:13'),(8,'Botble\\Blog\\Models\\Post',5,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-03-20 04:34:13','2022-03-20 04:34:13'),(9,'Botble\\Blog\\Models\\Post',6,NULL,'author_id','1','2','2022-03-20 04:34:13','2022-03-20 04:34:13'),(10,'Botble\\Blog\\Models\\Post',6,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-03-20 04:34:13','2022-03-20 04:34:13'),(11,'Botble\\Blog\\Models\\Post',7,NULL,'author_id','1','3','2022-03-20 04:34:13','2022-03-20 04:34:13'),(12,'Botble\\Blog\\Models\\Post',7,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-03-20 04:34:13','2022-03-20 04:34:13'),(13,'Botble\\Blog\\Models\\Post',8,NULL,'author_id','1','6','2022-03-20 04:34:13','2022-03-20 04:34:13'),(14,'Botble\\Blog\\Models\\Post',8,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-03-20 04:34:13','2022-03-20 04:34:13'),(15,'Botble\\Blog\\Models\\Post',9,NULL,'author_id','1','9','2022-03-20 04:34:13','2022-03-20 04:34:13'),(16,'Botble\\Blog\\Models\\Post',9,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-03-20 04:34:13','2022-03-20 04:34:13'),(17,'Botble\\Blog\\Models\\Post',10,NULL,'author_id','1','6','2022-03-20 04:34:13','2022-03-20 04:34:13'),(18,'Botble\\Blog\\Models\\Post',10,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-03-20 04:34:13','2022-03-20 04:34:13'),(19,'Botble\\Blog\\Models\\Post',11,NULL,'author_id','1','2','2022-03-20 04:34:13','2022-03-20 04:34:13'),(20,'Botble\\Blog\\Models\\Post',11,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-03-20 04:34:13','2022-03-20 04:34:13'),(21,'Botble\\Blog\\Models\\Post',12,NULL,'author_id','1','6','2022-03-20 04:34:13','2022-03-20 04:34:13'),(22,'Botble\\Blog\\Models\\Post',12,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-03-20 04:34:13','2022-03-20 04:34:13'),(23,'Botble\\Blog\\Models\\Post',13,NULL,'author_id','1','3','2022-03-20 04:34:13','2022-03-20 04:34:13'),(24,'Botble\\Blog\\Models\\Post',13,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-03-20 04:34:13','2022-03-20 04:34:13'),(25,'Botble\\Blog\\Models\\Post',14,NULL,'author_id','1','2','2022-03-20 04:34:13','2022-03-20 04:34:13'),(26,'Botble\\Blog\\Models\\Post',14,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-03-20 04:34:13','2022-03-20 04:34:13'),(27,'Botble\\Blog\\Models\\Post',15,NULL,'author_id','1','8','2022-03-20 04:34:13','2022-03-20 04:34:13'),(28,'Botble\\Blog\\Models\\Post',15,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-03-20 04:34:13','2022-03-20 04:34:13'),(29,'Botble\\Blog\\Models\\Post',16,NULL,'author_id','1','6','2022-03-20 04:34:14','2022-03-20 04:34:14'),(30,'Botble\\Blog\\Models\\Post',16,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-03-20 04:34:14','2022-03-20 04:34:14'),(31,'Botble\\Blog\\Models\\Post',17,NULL,'author_id','1','6','2022-03-20 04:34:14','2022-03-20 04:34:14'),(32,'Botble\\Blog\\Models\\Post',17,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-03-20 04:34:14','2022-03-20 04:34:14'),(33,'Botble\\Blog\\Models\\Post',18,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-03-20 04:34:14','2022-03-20 04:34:14'),(34,'Botble\\Blog\\Models\\Post',19,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-03-20 04:34:14','2022-03-20 04:34:14'),(35,'Botble\\Blog\\Models\\Post',20,NULL,'author_id','1','4','2022-03-20 04:34:14','2022-03-20 04:34:14'),(36,'Botble\\Blog\\Models\\Post',20,NULL,'author_type','Botble\\ACL\\Models\\User','Botble\\Member\\Models\\Member','2022-03-20 04:34:14','2022-03-20 04:34:14');
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_users`
--

DROP TABLE IF EXISTS `role_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `role_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_users_user_id_index` (`user_id`),
  KEY `role_users_role_id_index` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_users`
--

LOCK TABLES `role_users` WRITE;
/*!40000 ALTER TABLE `role_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `created_by` int unsigned NOT NULL,
  `updated_by` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_slug_unique` (`slug`),
  KEY `roles_created_by_index` (`created_by`),
  KEY `roles_updated_by_index` (`updated_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'activated_plugins','[\"language\",\"language-advanced\",\"ads\",\"analytics\",\"audit-log\",\"backup\",\"blog\",\"captcha\",\"comment\",\"contact\",\"cookie-consent\",\"gallery\",\"member\",\"newsletter\",\"post-collection\",\"post-scheduler\",\"pro-posts\",\"request-log\",\"rss-feed\",\"social-login\",\"toc\",\"translation\"]',NULL,NULL),(2,'language_hide_default','1',NULL,NULL),(3,'language_switcher_display','list',NULL,NULL),(4,'language_display','all',NULL,NULL),(5,'language_hide_languages','[]',NULL,NULL),(6,'show_admin_bar','1',NULL,NULL),(7,'theme','ultra',NULL,NULL),(8,'admin_logo','general/logo-white.png',NULL,NULL),(9,'admin_favicon','general/favicon.png',NULL,NULL),(10,'theme-ultra-site_title','UltraNews - Laravel News and Magazine Multilingual System',NULL,NULL),(11,'theme-ultra-seo_description','UltraNews – Laravel News and Magazine Multilingual System is a complete solution for any kind of News, Magazine, and Blog Portal. This cms Includes almost everything you need. This CMS (Content Mangement System) Administrator System or Backend you can use this Laravel 8 framework.',NULL,NULL),(12,'theme-ultra-seo_og_image','general/screenshot.png',NULL,NULL),(13,'theme-ultra-copyright','©2022 UltraNews - ',NULL,NULL),(14,'theme-ultra-designed_by','| Design by AliThemes',NULL,NULL),(15,'theme-ultra-favicon','general/favicon.png',NULL,NULL),(16,'theme-ultra-website','https://thesky9.com',NULL,NULL),(17,'theme-ultra-contact_email','support@thesky9.com',NULL,NULL),(18,'theme-ultra-site_description','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Odio suspendisse leo neque iaculis molestie sagittis maecenas aenean eget molestie sagittis.',NULL,NULL),(19,'theme-ultra-phone','+(123) 345-6789',NULL,NULL),(20,'theme-ultra-email','contact@gmail.com',NULL,NULL),(21,'theme-ultra-address','214 West Arnold St. New York, NY 10002',NULL,NULL),(22,'theme-ultra-cookie_consent_message','Your experience on this site will be improved by allowing cookies ',NULL,NULL),(23,'theme-ultra-cookie_consent_learn_more_url','http://localhost/cookie-policy',NULL,NULL),(24,'theme-ultra-cookie_consent_learn_more_text','Cookie Policy',NULL,NULL),(25,'theme-ultra-homepage_id','1',NULL,NULL),(26,'theme-ultra-blog_page_id','4',NULL,NULL),(27,'theme-ultra-single_layout','default',NULL,NULL),(28,'theme-ultra-single_title_layout','top-full',NULL,NULL),(29,'theme-ultra-action_title','All you need to build new site',NULL,NULL),(30,'theme-ultra-action_button_text','Buy Now',NULL,NULL),(31,'theme-ultra-action_button_url','https://codecanyon.net/user/thesky9',NULL,NULL),(32,'theme-ultra-logo','general/logo.png',NULL,NULL),(33,'theme-ultra-logo_mobile','general/logo-mobile.png',NULL,NULL),(34,'theme-ultra-logo_tablet','general/logo-tablet.png',NULL,NULL),(35,'theme-ultra-logo_white','general/logo-white.png',NULL,NULL),(36,'theme-ultra-img_loading','general/img-loading.jpg',NULL,NULL),(37,'theme-ultra-font_heading','Arimo',NULL,NULL),(38,'theme-ultra-font_body','Roboto',NULL,NULL),(39,'theme-ultra-color_primary','#87c6e3',NULL,NULL),(40,'theme-ultra-color_secondary','#455265',NULL,NULL),(41,'theme-ultra-color_success','#76e1c6',NULL,NULL),(42,'theme-ultra-color_danger','#f0a9a9',NULL,NULL),(43,'theme-ultra-color_warning','#e6bf7e',NULL,NULL),(44,'theme-ultra-color_info','#58c1c8',NULL,NULL),(45,'theme-ultra-color_light','#F3F3F3',NULL,NULL),(46,'theme-ultra-color_dark','#111111',NULL,NULL),(47,'theme-ultra-color_link','#222831',NULL,NULL),(48,'theme-ultra-color_white','#FFFFFF',NULL,NULL),(49,'theme-ultra-header_style','style-1',NULL,NULL),(50,'theme-ultra-preloader_enabled','0',NULL,NULL),(51,'theme-ultra-allow_account_login','yes',NULL,NULL),(52,'theme-ultra-comment_type_in_post','member',NULL,NULL),(53,'theme-ultra-vi-site_title','UltraNews - Laravel News and Magazine Multilingual System',NULL,NULL),(54,'theme-ultra-vi-seo_description','UltraNews – Laravel News and Magazine Multilingual System is a complete solution for any kind of News, Magazine, and Blog Portal. This cms Includes almost everything you need. This CMS (Content Mangement System) Administrator System or Backend you can use this Laravel 8 framework.',NULL,NULL),(55,'theme-ultra-vi-seo_og_image','general/screenshot.png',NULL,NULL),(56,'theme-ultra-vi-copyright','©2022 Thiết kế bởi AliThemes ',NULL,NULL),(57,'theme-ultra-vi-designed_by','| Design by AliThemes',NULL,NULL),(58,'theme-ultra-vi-favicon','general/favicon.png',NULL,NULL),(59,'theme-ultra-vi-website','https://thesky9.com',NULL,NULL),(60,'theme-ultra-vi-contact_email','support@thesky9.com',NULL,NULL),(61,'theme-ultra-vi-site_description','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Odio suspendisse leo neque iaculis molestie sagittis maecenas aenean eget molestie sagittis.',NULL,NULL),(62,'theme-ultra-vi-phone','+(123) 345-6789',NULL,NULL),(63,'theme-ultra-vi-email','contact@gmail.com',NULL,NULL),(64,'theme-ultra-vi-address','214 West Arnold St. New York, NY 10002',NULL,NULL),(65,'theme-ultra-vi-cookie_consent_message','Trải nghiệm của bạn trên trang web này sẽ được cải thiện bằng cách cho phép cookie ',NULL,NULL),(66,'theme-ultra-vi-cookie_consent_learn_more_url','http://localhost/cookie-policy',NULL,NULL),(67,'theme-ultra-vi-cookie_consent_learn_more_text','Cookie Policy',NULL,NULL),(68,'theme-ultra-vi-homepage_id','1',NULL,NULL),(69,'theme-ultra-vi-blog_page_id','4',NULL,NULL),(70,'theme-ultra-vi-single_layout','default',NULL,NULL),(71,'theme-ultra-vi-single_title_layout','top-full',NULL,NULL),(72,'theme-ultra-vi-logo','general/logo.png',NULL,NULL),(73,'theme-ultra-vi-logo_mobile','general/logo-mobile.png',NULL,NULL),(74,'theme-ultra-vi-logo_tablet','general/logo-tablet.png',NULL,NULL),(75,'theme-ultra-vi-logo_white','general/logo-white.png',NULL,NULL),(76,'theme-ultra-vi-action_title','Bạn cần tạo mới website',NULL,NULL),(77,'theme-ultra-vi-action_button_text','Mua Ngay',NULL,NULL),(78,'theme-ultra-vi-action_button_url','https://codecanyon.net/user/thesky9',NULL,NULL),(79,'theme-ultra-vi-font_heading','Arimo',NULL,NULL),(80,'theme-ultra-vi-font_body','Roboto',NULL,NULL),(81,'theme-ultra-vi-color_brand_1','#ffcda3',NULL,NULL),(82,'theme-ultra-vi-color_brand_2','#fce2ce',NULL,NULL),(83,'theme-ultra-vi-color_brand_3','#ffede5',NULL,NULL),(84,'theme-ultra-vi-color_brand_4','#fff5ef',NULL,NULL),(85,'theme-ultra-vi-color_primary','#87c6e3',NULL,NULL),(86,'theme-ultra-vi-color_secondary','#455265',NULL,NULL),(87,'theme-ultra-vi-color_success','#76e1c6',NULL,NULL),(88,'theme-ultra-vi-color_danger','#f0a9a9',NULL,NULL),(89,'theme-ultra-vi-color_warning','#e6bf7e',NULL,NULL),(90,'theme-ultra-vi-color_info','#58c1c8',NULL,NULL),(91,'theme-ultra-vi-color_light','#F3F3F3',NULL,NULL),(92,'theme-ultra-vi-color_dark','#111111',NULL,NULL),(93,'theme-ultra-vi-color_link','#222831',NULL,NULL),(94,'theme-ultra-vi-color_white','#FFFFFF',NULL,NULL),(95,'theme-ultra-vi-header_style','style-1',NULL,NULL),(96,'theme-ultra-vi-preloader_enabled','0',NULL,NULL),(97,'theme-ultra-vi-allow_account_login','yes',NULL,NULL),(98,'theme-ultra-vi-comment_type_in_post','member',NULL,NULL),(99,'theme-ultra-social_links','[[{\"key\":\"social-name\",\"value\":\"Facebook\"},{\"key\":\"social-icon\",\"value\":\"facebook\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/www.facebook.com\\/\"},{\"key\":\"social-total-follow\",\"value\":\"65000\"}],[{\"key\":\"social-name\",\"value\":\"Twitter\"},{\"key\":\"social-icon\",\"value\":\"twitter\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/www.twitter.com\\/\"},{\"key\":\"social-total-follow\",\"value\":\"12000\"}],[{\"key\":\"social-name\",\"value\":\"Instagram\"},{\"key\":\"social-icon\",\"value\":\"instagram\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/www.instagram.com\\/\"},{\"key\":\"social-total-follow\",\"value\":\"678\"}],[{\"key\":\"social-name\",\"value\":\"Linkedin\"},{\"key\":\"social-icon\",\"value\":\"linkedin\"},{\"key\":\"social-url\",\"value\":\"\"},{\"key\":\"social-total-follow\",\"value\":\"90\"}],[{\"key\":\"social-name\",\"value\":\"Pinterest\"},{\"key\":\"social-icon\",\"value\":\"pinterest\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/www.pinterest.com\\/\"}]]',NULL,NULL),(100,'theme-vi-ultra-social_links','[[{\"key\":\"social-name\",\"value\":\"Facebook\"},{\"key\":\"social-icon\",\"value\":\"facebook\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/www.facebook.com\\/\"},{\"key\":\"social-total-follow\",\"value\":\"65000\"}],[{\"key\":\"social-name\",\"value\":\"Twitter\"},{\"key\":\"social-icon\",\"value\":\"twitter\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/www.twitter.com\\/\"},{\"key\":\"social-total-follow\",\"value\":\"12000\"}],[{\"key\":\"social-name\",\"value\":\"Instagram\"},{\"key\":\"social-icon\",\"value\":\"instagram\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/www.instagram.com\\/\"},{\"key\":\"social-total-follow\",\"value\":\"678\"}],[{\"key\":\"social-name\",\"value\":\"Linkedin\"},{\"key\":\"social-icon\",\"value\":\"linkedin\"},{\"key\":\"social-url\",\"value\":\"\"},{\"key\":\"social-total-follow\",\"value\":\"90\"}],[{\"key\":\"social-name\",\"value\":\"Pinterest\"},{\"key\":\"social-icon\",\"value\":\"pinterest\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/www.pinterest.com\\/\"}]]',NULL,NULL),(101,'media_random_hash','6501725375ac1d23add7229cca99b8a7',NULL,NULL),(102,'comment_enable','1',NULL,NULL),(103,'comment_menu_enable','[\"Botble\\\\Blog\\\\Models\\\\Post\"]',NULL,NULL),(104,'plugin_comment_copyright','',NULL,NULL);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slugs`
--

DROP TABLE IF EXISTS `slugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slugs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` int unsigned NOT NULL,
  `reference_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slugs`
--

LOCK TABLES `slugs` WRITE;
/*!40000 ALTER TABLE `slugs` DISABLE KEYS */;
INSERT INTO `slugs` VALUES (1,'homepage',1,'Botble\\Page\\Models\\Page','','2022-03-20 04:34:03','2022-03-20 04:34:03'),(2,'home-2',2,'Botble\\Page\\Models\\Page','','2022-03-20 04:34:03','2022-03-20 04:34:03'),(3,'home-3',3,'Botble\\Page\\Models\\Page','','2022-03-20 04:34:03','2022-03-20 04:34:03'),(4,'blog',4,'Botble\\Page\\Models\\Page','','2022-03-20 04:34:03','2022-03-20 04:34:03'),(5,'category-list',5,'Botble\\Page\\Models\\Page','','2022-03-20 04:34:03','2022-03-20 04:34:03'),(6,'category-grid',6,'Botble\\Page\\Models\\Page','','2022-03-20 04:34:03','2022-03-20 04:34:03'),(7,'category-metro',7,'Botble\\Page\\Models\\Page','','2022-03-20 04:34:03','2022-03-20 04:34:03'),(8,'contact',8,'Botble\\Page\\Models\\Page','','2022-03-20 04:34:03','2022-03-20 04:34:03'),(9,'about-us',9,'Botble\\Page\\Models\\Page','','2022-03-20 04:34:03','2022-03-20 04:34:03'),(10,'cookie-policy',10,'Botble\\Page\\Models\\Page','','2022-03-20 04:34:03','2022-03-20 04:34:03'),(11,'perfect',1,'Botble\\Gallery\\Models\\Gallery','galleries','2022-03-20 04:34:04','2022-03-20 04:34:04'),(12,'new-day',2,'Botble\\Gallery\\Models\\Gallery','galleries','2022-03-20 04:34:04','2022-03-20 04:34:04'),(13,'happy-day',3,'Botble\\Gallery\\Models\\Gallery','galleries','2022-03-20 04:34:04','2022-03-20 04:34:04'),(14,'nature',4,'Botble\\Gallery\\Models\\Gallery','galleries','2022-03-20 04:34:04','2022-03-20 04:34:04'),(15,'morning',5,'Botble\\Gallery\\Models\\Gallery','galleries','2022-03-20 04:34:04','2022-03-20 04:34:04'),(16,'photography',6,'Botble\\Gallery\\Models\\Gallery','galleries','2022-03-20 04:34:04','2022-03-20 04:34:04'),(17,'building',7,'Botble\\Gallery\\Models\\Gallery','galleries','2022-03-20 04:34:04','2022-03-20 04:34:04'),(18,'design',1,'Botble\\Blog\\Models\\Category','','2022-03-20 04:34:10','2022-03-20 04:34:10'),(19,'lifestyle',2,'Botble\\Blog\\Models\\Category','','2022-03-20 04:34:10','2022-03-20 04:34:10'),(20,'travel-tips',3,'Botble\\Blog\\Models\\Category','','2022-03-20 04:34:10','2022-03-20 04:34:10'),(21,'healthy',4,'Botble\\Blog\\Models\\Category','','2022-03-20 04:34:10','2022-03-20 04:34:10'),(22,'fashion',5,'Botble\\Blog\\Models\\Category','','2022-03-20 04:34:10','2022-03-20 04:34:10'),(23,'hotel',6,'Botble\\Blog\\Models\\Category','','2022-03-20 04:34:10','2022-03-20 04:34:10'),(24,'nature',7,'Botble\\Blog\\Models\\Category','','2022-03-20 04:34:10','2022-03-20 04:34:10'),(25,'general',1,'Botble\\Blog\\Models\\Tag','tag','2022-03-20 04:34:10','2022-03-20 04:34:10'),(26,'beauty',2,'Botble\\Blog\\Models\\Tag','tag','2022-03-20 04:34:10','2022-03-20 04:34:10'),(27,'fashion',3,'Botble\\Blog\\Models\\Tag','tag','2022-03-20 04:34:10','2022-03-20 04:34:10'),(28,'lifestyle',4,'Botble\\Blog\\Models\\Tag','tag','2022-03-20 04:34:10','2022-03-20 04:34:10'),(29,'travel',5,'Botble\\Blog\\Models\\Tag','tag','2022-03-20 04:34:10','2022-03-20 04:34:10'),(30,'business',6,'Botble\\Blog\\Models\\Tag','tag','2022-03-20 04:34:10','2022-03-20 04:34:10'),(31,'health',7,'Botble\\Blog\\Models\\Tag','tag','2022-03-20 04:34:10','2022-03-20 04:34:10'),(32,'this-year-enjoy-the-color-of-festival-with-amazing-holi-gifts-ideas',1,'Botble\\Blog\\Models\\Post','','2022-03-20 04:34:10','2022-03-20 04:34:10'),(33,'the-world-caters-to-average-people-and-mediocre-lifestyles',2,'Botble\\Blog\\Models\\Post','','2022-03-20 04:34:10','2022-03-20 04:34:10'),(34,'not-a-bit-of-hesitation-you-better-think-twice',3,'Botble\\Blog\\Models\\Post','','2022-03-20 04:34:11','2022-03-20 04:34:11'),(35,'we-got-a-right-to-pick-a-little-fight-bonanza',4,'Botble\\Blog\\Models\\Post','','2022-03-20 04:34:11','2022-03-20 04:34:11'),(36,'my-entrance-exam-was-on-a-book-of-matches',5,'Botble\\Blog\\Models\\Post','','2022-03-20 04:34:11','2022-03-20 04:34:11'),(37,'essential-qualities-of-highly-successful-music',6,'Botble\\Blog\\Models\\Post','','2022-03-20 04:34:11','2022-03-20 04:34:11'),(38,'why-teamwork-really-makes-the-dream-work',7,'Botble\\Blog\\Models\\Post','','2022-03-20 04:34:11','2022-03-20 04:34:11'),(39,'9-things-i-love-about-shaving-my-head-during-quarantine',8,'Botble\\Blog\\Models\\Post','','2022-03-20 04:34:11','2022-03-20 04:34:11'),(40,'the-litigants-on-the-screen-are-not-actors',9,'Botble\\Blog\\Models\\Post','','2022-03-20 04:34:11','2022-03-20 04:34:11'),(41,'imagine-losing-20-pounds-in-14-days',10,'Botble\\Blog\\Models\\Post','','2022-03-20 04:34:11','2022-03-20 04:34:11'),(42,'are-you-still-using-that-slow-old-typewriter',11,'Botble\\Blog\\Models\\Post','','2022-03-20 04:34:11','2022-03-20 04:34:11'),(43,'a-skin-cream-thats-proven-to-work',12,'Botble\\Blog\\Models\\Post','','2022-03-20 04:34:11','2022-03-20 04:34:11'),(44,'10-reasons-to-start-your-own-profitable-website',13,'Botble\\Blog\\Models\\Post','','2022-03-20 04:34:11','2022-03-20 04:34:11'),(45,'level-up-your-live-streams-with-automated-captions-and-more',14,'Botble\\Blog\\Models\\Post','','2022-03-20 04:34:11','2022-03-20 04:34:11'),(46,'simple-ways-to-reduce-your-unwanted-wrinkles',15,'Botble\\Blog\\Models\\Post','','2022-03-20 04:34:11','2022-03-20 04:34:11'),(47,'apple-imac-with-retina-5k-display-review',16,'Botble\\Blog\\Models\\Post','','2022-03-20 04:34:11','2022-03-20 04:34:11'),(48,'10000-web-site-visitors-in-one-monthguaranteed',17,'Botble\\Blog\\Models\\Post','','2022-03-20 04:34:11','2022-03-20 04:34:11'),(49,'unlock-the-secrets-of-selling-high-ticket-items',18,'Botble\\Blog\\Models\\Post','','2022-03-20 04:34:11','2022-03-20 04:34:11'),(50,'4-expert-tips-on-how-to-choose-the-right-mens-wallet',19,'Botble\\Blog\\Models\\Post','','2022-03-20 04:34:11','2022-03-20 04:34:11'),(51,'sexy-clutches-how-to-buy-wear-a-designer-clutch-bag',20,'Botble\\Blog\\Models\\Post','','2022-03-20 04:34:12','2022-03-20 04:34:12'),(52,'john-smith',1,'Botble\\Member\\Models\\Member','author','2022-03-20 04:34:13','2022-03-20 04:34:13'),(53,'oren-dicki',2,'Botble\\Member\\Models\\Member','author','2022-03-20 04:34:13','2022-03-20 04:34:13'),(54,'joelle-terry',3,'Botble\\Member\\Models\\Member','author','2022-03-20 04:34:13','2022-03-20 04:34:13'),(55,'chauncey-welch',4,'Botble\\Member\\Models\\Member','author','2022-03-20 04:34:13','2022-03-20 04:34:13'),(56,'asa-bins',5,'Botble\\Member\\Models\\Member','author','2022-03-20 04:34:13','2022-03-20 04:34:13'),(57,'nicklaus-olson',6,'Botble\\Member\\Models\\Member','author','2022-03-20 04:34:13','2022-03-20 04:34:13'),(58,'collin-olson',7,'Botble\\Member\\Models\\Member','author','2022-03-20 04:34:13','2022-03-20 04:34:13'),(59,'meghan-brown',8,'Botble\\Member\\Models\\Member','author','2022-03-20 04:34:13','2022-03-20 04:34:13'),(60,'rodger-feeney',9,'Botble\\Member\\Models\\Member','author','2022-03-20 04:34:13','2022-03-20 04:34:13'),(61,'kailey-carroll',10,'Botble\\Member\\Models\\Member','author','2022-03-20 04:34:13','2022-03-20 04:34:13'),(62,'jerald-sporer',11,'Botble\\Member\\Models\\Member','author','2022-03-20 04:34:13','2022-03-20 04:34:13'),(63,'editors-picked',1,'Botble\\Page\\Models\\Page','','2022-03-20 04:34:16','2022-03-20 04:34:16'),(64,'recommended-posts',2,'Botble\\Page\\Models\\Page','','2022-03-20 04:34:16','2022-03-20 04:34:16'),(65,'bai-viet-hay',3,'Botble\\Page\\Models\\Page','','2022-03-20 04:34:16','2022-03-20 04:34:16'),(66,'recommended-posts',4,'Botble\\Page\\Models\\Page','','2022-03-20 04:34:16','2022-03-20 04:34:16');
/*!40000 ALTER TABLE `slugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_id` int NOT NULL,
  `author_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'General',1,'Botble\\ACL\\Models\\User','','published','2022-03-20 04:34:10','2022-03-20 04:34:10'),(2,'Beauty',1,'Botble\\ACL\\Models\\User','','published','2022-03-20 04:34:10','2022-03-20 04:34:10'),(3,'Fashion',1,'Botble\\ACL\\Models\\User','','published','2022-03-20 04:34:10','2022-03-20 04:34:10'),(4,'Lifestyle',1,'Botble\\ACL\\Models\\User','','published','2022-03-20 04:34:10','2022-03-20 04:34:10'),(5,'Travel',1,'Botble\\ACL\\Models\\User','','published','2022-03-20 04:34:10','2022-03-20 04:34:10'),(6,'Business',1,'Botble\\ACL\\Models\\User','','published','2022-03-20 04:34:10','2022-03-20 04:34:10'),(7,'Health',1,'Botble\\ACL\\Models\\User','','published','2022-03-20 04:34:10','2022-03-20 04:34:10');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags_translations`
--

DROP TABLE IF EXISTS `tags_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`tags_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags_translations`
--

LOCK TABLES `tags_translations` WRITE;
/*!40000 ALTER TABLE `tags_translations` DISABLE KEYS */;
INSERT INTO `tags_translations` VALUES ('vi',1,'Chung',NULL),('vi',2,'Làm đẹp',NULL),('vi',3,'Thời trang',NULL),('vi',4,'Du lịch và ẩm thực',NULL),('vi',5,'Kinh doanh',NULL),('vi',6,'Sức khỏe',NULL),('vi',7,'Thời sự',NULL);
/*!40000 ALTER TABLE `tags_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translations`
--

DROP TABLE IF EXISTS `translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `status` int NOT NULL DEFAULT '0',
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translations`
--

LOCK TABLES `translations` WRITE;
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_meta`
--

DROP TABLE IF EXISTS `user_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_meta` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_meta_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_meta`
--

LOCK TABLES `user_meta` WRITE;
/*!40000 ALTER TABLE `user_meta` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_id` int unsigned DEFAULT NULL,
  `super_user` tinyint(1) NOT NULL DEFAULT '0',
  `manage_supers` tinyint(1) NOT NULL DEFAULT '0',
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `last_login` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin@thesky9.com',NULL,'$2y$10$LOBhqkzgNUMuo9s.zTUsaO6gk0Y900EUb3U7uIp9eu4Fxa76acXJi',NULL,'2022-03-20 04:34:02','2022-03-20 04:34:02','System','Admin','admin',NULL,1,1,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `widgets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `widget_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sidebar_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` tinyint unsigned NOT NULL DEFAULT '0',
  `data` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
INSERT INTO `widgets` VALUES (1,'SocialsWidget','primary_sidebar','ultra',0,'{\"id\":\"SocialsWidget\",\"title\":\"Follow us\"}','2022-03-20 04:34:14','2022-03-20 04:34:14'),(2,'AdsWidget','primary_sidebar','ultra',0,'{\"id\":\"AdsWidget\",\"ads_location\":\"top-sidebar-ads\"}','2022-03-20 04:34:14','2022-03-20 04:34:14'),(3,'CategoriesMenuWidget','primary_sidebar','ultra',0,'{\"id\":\"CategoriesMenuWidget\"}','2022-03-20 04:34:14','2022-03-20 04:34:14'),(4,'LastestPostsWidget','primary_sidebar','ultra',0,'{\"id\":\"LastestPostsWidget\",\"name\":\"Lastest Post\",\"number_display\":6}','2022-03-20 04:34:14','2022-03-20 04:34:14'),(5,'TagsWidget','primary_sidebar','ultra',1,'{\"id\":\"TagsWidget\",\"name\":\"Tags\",\"number_display\":10}','2022-03-20 04:34:14','2022-03-20 04:34:14'),(6,'AdsWidget','primary_sidebar','ultra',1,'{\"id\":\"AdsWidget\",\"ads_location\":\"bottom-sidebar-ads\"}','2022-03-20 04:34:14','2022-03-20 04:34:14'),(7,'AboutWidget','footer_sidebar_1','ultra',1,'{\"id\":\"AboutWidget\",\"name\":\"About me\",\"description\":\"Introduction about the author of this blog. You should write because you love the shape of stories and sentences and the creation of different words on a page. Writing comes from reading, and reading is the finest teacher of how to write.\"}','2022-03-20 04:34:14','2022-03-20 04:34:14'),(8,'PopularPostsWidget','footer_sidebar_2','ultra',1,'{\"id\":\"PopularPostsWidget\",\"name\":\"Popular Posts\",\"name_custom_class\":\"color-white\",\"number_display\":3}','2022-03-20 04:34:14','2022-03-20 04:34:14'),(9,'CustomMenuWidget','footer_sidebar_3','ultra',1,'{\"id\":\"CustomMenuWidget\",\"name\":\"Quick links\",\"menu_id\":\"quick-links\"}','2022-03-20 04:34:14','2022-03-20 04:34:14'),(10,'TagsWidget','footer_sidebar_3','ultra',1,'{\"id\":\"TagsWidget\",\"name\":\"Tags\",\"name_custom_class\":\"color-white\"}','2022-03-20 04:34:14','2022-03-20 04:34:14'),(11,'NewsletterWidget','footer_sidebar_4','ultra',1,'{\"id\":\"NewsletterWidget\",\"name\":\"Newsletter\",\"description\":\"Subscribe to Our Newsletter\"}','2022-03-20 04:34:14','2022-03-20 04:34:14'),(12,'CopyrightFooterMenuWidget','footer_copyright_menu','ultra',1,'{\"id\":\"CopyrightFooterMenuWidget\",\"name\":\"Copyright footer Menu\",\"menu_id\":\"quick-links\"}','2022-03-20 04:34:14','2022-03-20 04:34:14'),(13,'SocialsWidget','primary_sidebar','ultra-vi',0,'{\"id\":\"SocialsWidget\",\"title\":\"Follow us\"}','2022-03-20 04:34:14','2022-03-20 04:34:14'),(14,'AdsWidget','primary_sidebar','ultra-vi',0,'{\"id\":\"AdsWidget\",\"ads_location\":\"top-sidebar-ads\"}','2022-03-20 04:34:14','2022-03-20 04:34:14'),(15,'CategoriesMenuWidget','primary_sidebar','ultra-vi',0,'{\"id\":\"CategoriesMenuWidget\"}','2022-03-20 04:34:14','2022-03-20 04:34:14'),(16,'LastestPostsWidget','primary_sidebar','ultra-vi',0,'{\"id\":\"LastestPostsWidget\",\"name\":\"B\\u00e0i vi\\u1ebft m\\u1edbi nh\\u1ea5t\",\"number_display\":6}','2022-03-20 04:34:14','2022-03-20 04:34:14'),(17,'TagsWidget','primary_sidebar','ultra-vi',1,'{\"id\":\"TagsWidget\",\"name\":\"Th\\u1ebb\",\"number_display\":10}','2022-03-20 04:34:14','2022-03-20 04:34:14'),(18,'AdsWidget','primary_sidebar','ultra-vi',1,'{\"id\":\"AdsWidget\",\"ads_location\":\"bottom-sidebar-ads\"}','2022-03-20 04:34:14','2022-03-20 04:34:14'),(19,'AboutWidget','footer_sidebar_1','ultra-vi',1,'{\"id\":\"AboutWidget\",\"name\":\"V\\u1ec1 ch\\u00fang t\\u00f4i\",\"description\":\"Introduction about the author of this blog. You should write because you love the shape of stories and sentences and the creation of different words on a page. Writing comes from reading, and reading is the finest teacher of how to write.\"}','2022-03-20 04:34:14','2022-03-20 04:34:14'),(20,'PopularPostsWidget','footer_sidebar_2','ultra-vi',1,'{\"id\":\"PopularPostsWidget\",\"name\":\"N\\u1ed5i b\\u1eadt\",\"name_custom_class\":\"color-white\",\"number_display\":3}','2022-03-20 04:34:14','2022-03-20 04:34:14'),(21,'CustomMenuWidget','footer_sidebar_3','ultra-vi',1,'{\"id\":\"CustomMenuWidget\",\"name\":\"Quick links\",\"menu_id\":\"quick-links\"}','2022-03-20 04:34:14','2022-03-20 04:34:14'),(22,'TagsWidget','footer_sidebar_3','ultra-vi',1,'{\"id\":\"TagsWidget\",\"name\":\"Tags\",\"name_custom_class\":\"color-white\"}','2022-03-20 04:34:14','2022-03-20 04:34:14'),(23,'NewsletterWidget','footer_sidebar_4','ultra-vi',1,'{\"id\":\"NewsletterWidget\",\"name\":\"Newsletter\",\"description\":\"Subscribe to Our Newsletter\"}','2022-03-20 04:34:14','2022-03-20 04:34:14'),(24,'CopyrightFooterMenuWidget','footer_copyright_menu','ultra-vi',1,'{\"id\":\"CopyrightFooterMenuWidget\",\"name\":\"Copyright footer Menu\",\"menu_id\":\"quick-links\"}','2022-03-20 04:34:14','2022-03-20 04:34:14');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-20 11:36:16
