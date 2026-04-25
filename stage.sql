-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: stage
-- ------------------------------------------------------
-- Server version	8.3.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_expiration_index` (`expiration`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_locks_expiration_index` (`expiration`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
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
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1),(4,'2026_02_03_214730_create_projects_table',1),(5,'2026_02_03_214735_create_project_steps_table',1),(6,'2026_02_03_214738_create_notifications_table',1),(7,'2026_02_03_220736_create_personal_access_tokens_table',1),(8,'2026_02_03_234158_add_document_path_to_projects_table',1),(9,'2026_02_04_003536_create_settings_table',2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Message',
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_user_id_foreign` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  KEY `personal_access_tokens_expires_at_index` (`expires_at`)
) ENGINE=MyISAM AUTO_INCREMENT=164 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
INSERT INTO `personal_access_tokens` VALUES (1,'App\\Models\\User',3,'auth_token','c6ac966ee2f378916784799436ed46a285e45cb3b5d7717550ca773328ea0f72','[\"*\"]','2026-02-03 22:53:46',NULL,'2026-02-03 22:53:44','2026-02-03 22:53:46'),(2,'App\\Models\\User',1,'auth_token','14beb60677dba9016f34fad68907b6c8826b51495519bb44c823b08508ea562e','[\"*\"]','2026-02-03 22:56:27',NULL,'2026-02-03 22:55:51','2026-02-03 22:56:27'),(3,'App\\Models\\User',3,'auth_token','db7b629debeb9a11ecee207443a634326d0b9442c0626b615ff9e3559b3fb431','[\"*\"]','2026-02-03 22:56:44',NULL,'2026-02-03 22:56:43','2026-02-03 22:56:44'),(4,'App\\Models\\User',3,'auth_token','63b013a4d52caa4169f41464d33e44b690f175ca66eb25a6c905d4d4905c74df','[\"*\"]','2026-02-03 22:57:43',NULL,'2026-02-03 22:57:42','2026-02-03 22:57:43'),(5,'App\\Models\\User',1,'auth_token','d6b6e5800aaca1d7a05ee665150debb0a73cbbb4e30e8e7cffb645bbb02aeb74','[\"*\"]','2026-02-03 23:04:52',NULL,'2026-02-03 23:04:48','2026-02-03 23:04:52'),(6,'App\\Models\\User',1,'auth_token','7312892c9c63ee128451095ba267ef6f0c1ca3167189e274ff229a3a24163ce8','[\"*\"]','2026-02-03 23:25:57',NULL,'2026-02-03 23:11:52','2026-02-03 23:25:57'),(7,'App\\Models\\User',3,'auth_token','82c68e4d72f6410ef028532d7becec0568734f83716b32a59ea15220d4acd3f8','[\"*\"]','2026-02-03 23:28:42',NULL,'2026-02-03 23:28:41','2026-02-03 23:28:42'),(8,'App\\Models\\User',1,'auth_token','19c2e0dd9b35499f43b2ac80a616bce7c050183e67040fcfe6baa1f1a7dff973','[\"*\"]','2026-02-03 23:37:10',NULL,'2026-02-03 23:37:01','2026-02-03 23:37:10'),(9,'App\\Models\\User',3,'auth_token','198a02d6e6c57d6816979e2ab1ef6ac399212f61f587d53ff6b54f93d52b5466','[\"*\"]','2026-02-03 23:41:20',NULL,'2026-02-03 23:41:19','2026-02-03 23:41:20'),(10,'App\\Models\\User',1,'auth_token','e644d504dfa414be76e11e00609e11125f597d4f6bbda0607e96aef6ff94408d','[\"*\"]','2026-02-03 23:47:56',NULL,'2026-02-03 23:43:33','2026-02-03 23:47:56'),(11,'App\\Models\\User',3,'auth_token','084fc1a340195f81745102c1010c386729495e36feaf85029bf515693edb10d1','[\"*\"]','2026-02-03 23:50:17',NULL,'2026-02-03 23:48:33','2026-02-03 23:50:17'),(12,'App\\Models\\User',1,'auth_token','750e842090305bddbc131a9307cb404d6ccec21730d160febe5feae2c4604df6','[\"*\"]','2026-02-03 23:53:14',NULL,'2026-02-03 23:50:44','2026-02-03 23:53:14'),(13,'App\\Models\\User',3,'auth_token','d1a776a9294687fbabc88f4631b77d23291ced9a29c87c90d70571b5d702e8d5','[\"*\"]',NULL,NULL,'2026-02-04 12:09:42','2026-02-04 12:09:42'),(14,'App\\Models\\User',3,'auth_token','727c11fcf7064869e3273764f6d17895e46c56fdfa7ddda509ad39231ca1fb49','[\"*\"]','2026-02-04 12:10:58',NULL,'2026-02-04 12:10:55','2026-02-04 12:10:58'),(15,'App\\Models\\User',4,'auth_token','26526cd498f248f0a03cfd6c27d1e034c3751f2c105af30d7ef95f6c6337306c','[\"*\"]','2026-02-04 12:12:14',NULL,'2026-02-04 12:12:13','2026-02-04 12:12:14'),(16,'App\\Models\\User',1,'auth_token','b209100f3f8d5b61f99d65bb5975f64fadcf76e0de7db699e334108cc0fa6099','[\"*\"]','2026-02-04 12:22:50',NULL,'2026-02-04 12:15:18','2026-02-04 12:22:50'),(17,'App\\Models\\User',3,'auth_token','5f17ce9735316f792f98c3d9d9e222ec13f6557aff1d8e1ebb0bade0f8b09032','[\"*\"]','2026-02-04 12:23:20',NULL,'2026-02-04 12:23:19','2026-02-04 12:23:20'),(18,'App\\Models\\User',1,'auth_token','48600724cd162ca15c5cb8613ae295b01e8bad9bab622ef2deba5af4305ee403','[\"*\"]','2026-02-05 13:59:11',NULL,'2026-02-05 13:49:48','2026-02-05 13:59:11'),(19,'App\\Models\\User',1,'auth_token','fd5eafdcba235b18d0ec4e3a9dadaa90c2c8b8ed30b0dcd94c9f26505ba23b97','[\"*\"]','2026-02-05 14:05:24',NULL,'2026-02-05 13:59:36','2026-02-05 14:05:24'),(20,'App\\Models\\User',1,'auth_token','fe3280d98e8b428679c59bd341996cb3b6d702d519257b42dd06567157dc217a','[\"*\"]','2026-02-05 14:07:08',NULL,'2026-02-05 14:07:04','2026-02-05 14:07:08'),(21,'App\\Models\\User',3,'auth_token','36299b329d2931acd5fbb908dcfd5b0f8e996912c01ba95b2b3d0b19b8452ecc','[\"*\"]','2026-02-05 14:07:37',NULL,'2026-02-05 14:07:36','2026-02-05 14:07:37'),(22,'App\\Models\\User',1,'auth_token','482bb1d27183c438dacedbf7091cbffd3feedf789513baf3482bd77078008388','[\"*\"]','2026-02-05 14:53:10',NULL,'2026-02-05 14:52:13','2026-02-05 14:53:10'),(23,'App\\Models\\User',1,'auth_token','26384ec458467e9374d331e818237865446d2fb4b9b4d0a1082962b9ff6f996b','[\"*\"]','2026-02-05 20:29:41',NULL,'2026-02-05 20:28:06','2026-02-05 20:29:41'),(24,'App\\Models\\User',3,'auth_token','f4fd2c06ff37d248015cd4981505286ba701af5923c40bb44eeea66be38516d7','[\"*\"]','2026-02-05 20:32:03',NULL,'2026-02-05 20:32:01','2026-02-05 20:32:03'),(25,'App\\Models\\User',1,'auth_token','dfafc25428b959b08b5abdbe4de20650c981f6f6cc4a94d203434f52c4c618ed','[\"*\"]','2026-02-05 20:43:34',NULL,'2026-02-05 20:36:13','2026-02-05 20:43:34'),(26,'App\\Models\\User',3,'auth_token','966ea43874454d0bebd1d42a60043ebd1ffe0f3845de4750d6e06515d26e1da6','[\"*\"]','2026-02-06 14:02:12',NULL,'2026-02-06 13:18:37','2026-02-06 14:02:12'),(27,'App\\Models\\User',1,'auth_token','92f5b557afcd8575e6cc12a7dac733067cbc3005cd2e3ab82faaf913a1f2478b','[\"*\"]','2026-02-06 14:11:02',NULL,'2026-02-06 14:11:00','2026-02-06 14:11:02'),(28,'App\\Models\\User',1,'auth_token','f64d6736c970529e8f6bc42d1551ac8829e31b4cf666126070a489da4cf67e96','[\"*\"]','2026-02-06 15:01:43',NULL,'2026-02-06 15:01:11','2026-02-06 15:01:43'),(29,'App\\Models\\User',3,'auth_token','63f12b1747edaaba486ac1f564606b7b861d8d533e090231d4c6e87467e1c3a8','[\"*\"]','2026-02-06 15:05:53',NULL,'2026-02-06 15:05:51','2026-02-06 15:05:53'),(30,'App\\Models\\User',3,'auth_token','376c6e8e82c99299cc75346c7c312e27a063289203da44ae842a237c2c47e760','[\"*\"]','2026-02-16 22:40:04',NULL,'2026-02-16 22:40:00','2026-02-16 22:40:04'),(31,'App\\Models\\User',1,'auth_token','7949cea9f0cc2a31faba4bcc622d8b7ef1c00ffc86670ea3bf6db1193768e96d','[\"*\"]','2026-02-16 22:42:19',NULL,'2026-02-16 22:42:06','2026-02-16 22:42:19'),(32,'App\\Models\\User',3,'auth_token','0361a37504d62d68913ea1fea867bb80b95ea7bca8608f6936eea697bd6bbbab','[\"*\"]','2026-02-18 12:03:15',NULL,'2026-02-18 12:03:14','2026-02-18 12:03:15'),(33,'App\\Models\\User',3,'auth_token','d4ed8ded3fe87877b0cc34dbf9d8dd701cb7ded44a102bac3059f9d8ae4a9634','[\"*\"]','2026-02-18 12:30:16',NULL,'2026-02-18 12:30:13','2026-02-18 12:30:16'),(34,'App\\Models\\User',1,'auth_token','672dac4dea509ad9e471528d163425941a4522fe85611075b097b007cb47e5a6','[\"*\"]','2026-02-18 12:30:44',NULL,'2026-02-18 12:30:42','2026-02-18 12:30:44'),(35,'App\\Models\\User',1,'auth_token','cdd645c4e5bd8b1519c976ed708d1f2d5ae15cf16f3878eea160d03fd354d44c','[\"*\"]','2026-02-18 12:31:12',NULL,'2026-02-18 12:31:10','2026-02-18 12:31:12'),(36,'App\\Models\\User',1,'auth_token','210d405d6be787f20d490220f34eeaf88b0047f00bb4f22af32e15fab0324c35','[\"*\"]','2026-02-18 12:41:50',NULL,'2026-02-18 12:35:28','2026-02-18 12:41:50'),(37,'App\\Models\\User',1,'auth_token','6cb0106fc2555c1b2472f6b8f577d3649358a8e8111a291c57fdf37a9500f247','[\"*\"]','2026-02-18 12:42:59',NULL,'2026-02-18 12:42:07','2026-02-18 12:42:59'),(38,'App\\Models\\User',1,'auth_token','d686097a4b1463a9de7064bd9c0b4f8535cac5410ee210aae2c19b22bcc15421','[\"*\"]','2026-02-18 12:49:15',NULL,'2026-02-18 12:45:14','2026-02-18 12:49:15'),(39,'App\\Models\\User',3,'auth_token','9c9aa859267bb08ff4007118586082d741d644702140dcdbe41cc59e91c0385b','[\"*\"]','2026-02-18 12:53:26',NULL,'2026-02-18 12:51:34','2026-02-18 12:53:26'),(40,'App\\Models\\User',1,'auth_token','d9d7ac271e52866eee85de60019cb5b5b00cf18aa6cb5e2d7972a9709f03545a','[\"*\"]','2026-02-18 13:05:05',NULL,'2026-02-18 12:54:02','2026-02-18 13:05:05'),(41,'App\\Models\\User',3,'auth_token','2ebaf68747d510648dce4093571f8ff713a37006bdbdb9d45ca46131ffad1b24','[\"*\"]','2026-02-18 13:05:28',NULL,'2026-02-18 13:05:27','2026-02-18 13:05:28'),(42,'App\\Models\\User',3,'auth_token','bf81c14cca75b033dbee2238832ff84f1f33ad789b912e277e4bc9d6186db5ac','[\"*\"]','2026-02-18 13:17:32',NULL,'2026-02-18 13:17:30','2026-02-18 13:17:32'),(43,'App\\Models\\User',3,'auth_token','fa824fdab3600116aaa373fb0cf923577de6bc5632ec5fbc16e848679600ea80','[\"*\"]','2026-02-18 13:51:40',NULL,'2026-02-18 13:51:35','2026-02-18 13:51:40'),(44,'App\\Models\\User',3,'auth_token','afbd761adc1bc749755b71bf97b2362f1770bd76fedaf7202c58279a6643c63b','[\"*\"]','2026-02-18 14:05:28',NULL,'2026-02-18 14:05:27','2026-02-18 14:05:28'),(45,'App\\Models\\User',3,'auth_token','c27b7cee2dbdfd0702387b61b2da503b889b44d461db2147887db5b12168e5a5','[\"*\"]','2026-02-18 14:15:33',NULL,'2026-02-18 14:15:31','2026-02-18 14:15:33'),(46,'App\\Models\\User',3,'auth_token','ec14a7a8f8179ea7583fd58f8ef0e796b1875ed67fd309c9582bec9bbec5252e','[\"*\"]','2026-02-18 14:21:15',NULL,'2026-02-18 14:21:14','2026-02-18 14:21:15'),(47,'App\\Models\\User',3,'auth_token','b8e64f19e73b0c3621a5ea8a099ad68f5dd15b7a9f6111fdbc0e0d81da48fb91','[\"*\"]','2026-02-18 14:25:45',NULL,'2026-02-18 14:25:44','2026-02-18 14:25:45'),(48,'App\\Models\\User',1,'auth_token','1d9d0c98bd9241d81f8596fa91fd4971fc99951766afb3814ea6f498ec9f75e8','[\"*\"]','2026-02-18 14:27:16',NULL,'2026-02-18 14:26:39','2026-02-18 14:27:16'),(49,'App\\Models\\User',3,'auth_token','8b1cb5b5822a9fcf06a4285fec93644b8ea6be0f1e20cb4c99b4143b55da808e','[\"*\"]','2026-02-18 14:27:39',NULL,'2026-02-18 14:27:37','2026-02-18 14:27:39'),(50,'App\\Models\\User',3,'auth_token','c263213720e394b81bc45b97705f6763e3a9a0e0ca88ab3d14a9155e265742fe','[\"*\"]','2026-02-18 14:35:36',NULL,'2026-02-18 14:35:26','2026-02-18 14:35:36'),(51,'App\\Models\\User',3,'auth_token','43b405bcf0c40f3cdbdc8e5ca1e75ff98bc372cf69240437d524e5926e02e221','[\"*\"]',NULL,NULL,'2026-02-18 14:48:09','2026-02-18 14:48:09'),(52,'App\\Models\\User',3,'auth_token','224efe99e12c7da8fe02816a7e6a53f4d4d48e7dfaaed3b4264dc0978a78cc66','[\"*\"]','2026-02-18 14:48:30',NULL,'2026-02-18 14:48:27','2026-02-18 14:48:30'),(53,'App\\Models\\User',1,'auth_token','2863ffc01669a04d37ba37076ad0c39fbb6984392a913a8f23dec846029e2419','[\"*\"]','2026-02-18 15:15:36',NULL,'2026-02-18 14:49:01','2026-02-18 15:15:36'),(54,'App\\Models\\User',1,'auth_token','781817e9b7b1210f4ae679f638dd122d4e7ee4444091002da1326f69bd1f8429','[\"*\"]','2026-02-18 15:20:48',NULL,'2026-02-18 15:17:47','2026-02-18 15:20:48'),(55,'App\\Models\\User',1,'auth_token','5e75c7be9fa3819c2cb768c96ad14c31df44b989a2ca709e25afdc5a75a14068','[\"*\"]','2026-02-18 15:37:17',NULL,'2026-02-18 15:23:47','2026-02-18 15:37:17'),(56,'App\\Models\\User',3,'auth_token','d4b5ab521c3ef994840743f622abd21fad7047f1521c006fb6f3f23ed6307a37','[\"*\"]','2026-02-20 13:39:35',NULL,'2026-02-20 13:39:34','2026-02-20 13:39:35'),(57,'App\\Models\\User',3,'auth_token','e1eb605eaf9423f7400afdc3bc4c12894d081727648dc2f4cecc043b6de54965','[\"*\"]','2026-02-20 14:33:54',NULL,'2026-02-20 14:33:51','2026-02-20 14:33:54'),(58,'App\\Models\\User',3,'auth_token','7f0f933d1c4ef18cab6be8c97d8f3af448e6d0ecbd503790560bc6c06267084e','[\"*\"]','2026-02-20 14:39:35',NULL,'2026-02-20 14:38:57','2026-02-20 14:39:35'),(59,'App\\Models\\User',3,'auth_token','624072e104c88b4fa72fd3628e2f7d7c0eb31b1e8e61defc21d3de8ddd351cba','[\"*\"]','2026-02-20 14:45:43',NULL,'2026-02-20 14:45:42','2026-02-20 14:45:43'),(60,'App\\Models\\User',3,'auth_token','bb716428d171ca6dbd90da8dd7610d87a6a26c0fa94b094033afc21cd6abbf63','[\"*\"]','2026-02-20 15:06:04',NULL,'2026-02-20 15:06:03','2026-02-20 15:06:04'),(61,'App\\Models\\User',3,'auth_token','8195d6012ea8953d5fab477c6c1632240ef489558693ef236e55054e47ae205d','[\"*\"]','2026-02-20 15:12:01',NULL,'2026-02-20 15:11:59','2026-02-20 15:12:01'),(62,'App\\Models\\User',3,'auth_token','c2dd47b3dcbae5aecd005fda5c591e87571fe59ea40f51b5bb466d799ce85f5f','[\"*\"]','2026-02-20 15:17:20',NULL,'2026-02-20 15:17:18','2026-02-20 15:17:20'),(63,'App\\Models\\User',3,'auth_token','2e2b76726885a25fb01356d2c0bc69dc2c727b42948a0a38b6a799224f13d494','[\"*\"]','2026-02-20 15:30:10',NULL,'2026-02-20 15:30:08','2026-02-20 15:30:10'),(64,'App\\Models\\User',3,'auth_token','04496f7fa3ee72d260931e498510c8b31e1016f75bd93de957f2ca59f1b83422','[\"*\"]','2026-02-20 15:32:15',NULL,'2026-02-20 15:32:13','2026-02-20 15:32:15'),(65,'App\\Models\\User',3,'auth_token','4b42dc6ad1e58a5b9f69667e9162d4b3108d05632d5d31b3a5e0c66ab7a6f482','[\"*\"]','2026-02-20 15:34:01',NULL,'2026-02-20 15:34:00','2026-02-20 15:34:01'),(66,'App\\Models\\User',3,'auth_token','fa7f0acc6272ee8227e1aa7bc390f72ffe6ee00b0a91a853c56d1e7b5bf06d06','[\"*\"]','2026-02-20 15:37:19',NULL,'2026-02-20 15:37:18','2026-02-20 15:37:19'),(67,'App\\Models\\User',3,'auth_token','aa22c88d702705dea5e6bc81f338aa0bcea3a329ea72b2c184915a0fdb5f069d','[\"*\"]','2026-02-20 15:41:56',NULL,'2026-02-20 15:41:54','2026-02-20 15:41:56'),(68,'App\\Models\\User',3,'auth_token','56e3d665f715955d87828dc9d459ceb1235996550d70e0f641bea74d76e26cf8','[\"*\"]','2026-02-20 15:47:46',NULL,'2026-02-20 15:47:44','2026-02-20 15:47:46'),(69,'App\\Models\\User',3,'auth_token','43818ef3f8eecbeec95446b344fd3ea74936aedebe2c00825192e625cbb98235','[\"*\"]','2026-02-20 15:49:46',NULL,'2026-02-20 15:49:44','2026-02-20 15:49:46'),(70,'App\\Models\\User',3,'auth_token','93135dfdcb927e04d4a1c4e4eb56c6f2cb4d3417976a4e38acf6026821d232f4','[\"*\"]','2026-02-20 15:56:37',NULL,'2026-02-20 15:56:36','2026-02-20 15:56:37'),(71,'App\\Models\\User',3,'auth_token','d8694619807e3e8c1b06b8262d9beb90ed8577135bb0aa84ae05e858e70236cd','[\"*\"]','2026-02-20 16:06:09',NULL,'2026-02-20 16:06:08','2026-02-20 16:06:09'),(72,'App\\Models\\User',3,'auth_token','176f717949d6c247205d6f8962feb30174a46ef67b5b4aa21da669f4c1189e15','[\"*\"]','2026-02-21 14:25:56',NULL,'2026-02-21 14:25:54','2026-02-21 14:25:56'),(73,'App\\Models\\User',3,'auth_token','879bb3233f399e6921b6650dfbb0520aba96e871bdb3d63d8091c77a868a1191','[\"*\"]','2026-02-21 14:30:40',NULL,'2026-02-21 14:30:34','2026-02-21 14:30:40'),(74,'App\\Models\\User',3,'auth_token','4a3d1446b4db2c1fcef4270142f1ecce73fe5cda6e06f6f095e3898239f195c8','[\"*\"]','2026-02-21 14:35:18',NULL,'2026-02-21 14:35:17','2026-02-21 14:35:18'),(75,'App\\Models\\User',3,'auth_token','41260185a372996999661ff306dd9960a3f67036d5d8eef3bedb6d25174c9a93','[\"*\"]','2026-02-21 14:39:00',NULL,'2026-02-21 14:38:59','2026-02-21 14:39:00'),(76,'App\\Models\\User',3,'auth_token','168923b3ae7652a4389ee36055680b0d58edc294a928ca5019fa2056771b0187','[\"*\"]','2026-02-21 14:41:18',NULL,'2026-02-21 14:41:16','2026-02-21 14:41:18'),(77,'App\\Models\\User',3,'auth_token','8a6fe397c4fecbbb90a92c88e7ecbd4d873db369a52e3adc80dd53b47a8ed605','[\"*\"]','2026-02-21 14:42:19',NULL,'2026-02-21 14:42:18','2026-02-21 14:42:19'),(78,'App\\Models\\User',3,'auth_token','1b0676035eed3e4850cfd6d93e0f2e62e1186a951ed7ad9da0f692bd6e095594','[\"*\"]','2026-02-21 14:57:47',NULL,'2026-02-21 14:57:45','2026-02-21 14:57:47'),(79,'App\\Models\\User',3,'auth_token','af9031d75c46a8cbee3bbe5c742da1c561add639a9cd8001f7a1d2c39aca7019','[\"*\"]','2026-02-21 15:00:49',NULL,'2026-02-21 15:00:47','2026-02-21 15:00:49'),(80,'App\\Models\\User',3,'auth_token','6989813e9310586b5a33b1926ea243fa269b630c48a61aa02bb6efcdff46fd8e','[\"*\"]','2026-02-21 15:05:33',NULL,'2026-02-21 15:05:32','2026-02-21 15:05:33'),(81,'App\\Models\\User',3,'auth_token','ca00f15ff77699e973d2355353ce032036b15f3f572d82c56e2a24afc5aa42d8','[\"*\"]','2026-02-21 15:08:24',NULL,'2026-02-21 15:08:22','2026-02-21 15:08:24'),(82,'App\\Models\\User',3,'auth_token','4ef07cd12b43b61ac0076b90497a940fdacd9dd7e02b1938a4a34c74de9ecbd7','[\"*\"]','2026-02-21 15:10:24',NULL,'2026-02-21 15:10:23','2026-02-21 15:10:24'),(83,'App\\Models\\User',3,'auth_token','e57346e308d7f83a26bf0cf7bc2f08d166aec18b94781b9ad8052d32482388c8','[\"*\"]','2026-02-21 15:12:04',NULL,'2026-02-21 15:12:02','2026-02-21 15:12:04'),(84,'App\\Models\\User',3,'auth_token','50e7e752e99ef8d4e7666b21fc375bd73cfde86e11b7bd8fc349827c9c5c9965','[\"*\"]','2026-02-21 15:13:21',NULL,'2026-02-21 15:13:20','2026-02-21 15:13:21'),(85,'App\\Models\\User',3,'auth_token','37a353664bbcd4e808f6b85f2dd9656453b1089116633919182ece0c7211d13a','[\"*\"]','2026-02-21 15:15:05',NULL,'2026-02-21 15:15:04','2026-02-21 15:15:05'),(86,'App\\Models\\User',3,'auth_token','fd6f0c8e040d6679fc5d9a66828e2a27064fc2b0266008879d476d04d4960dd4','[\"*\"]','2026-02-21 15:21:57',NULL,'2026-02-21 15:21:56','2026-02-21 15:21:57'),(87,'App\\Models\\User',3,'auth_token','345d187a238c1821f06da4a79ea6bfd32dd0232addb35efce8fe9506b3172d7e','[\"*\"]','2026-02-21 15:27:52',NULL,'2026-02-21 15:27:51','2026-02-21 15:27:52'),(88,'App\\Models\\User',3,'auth_token','5ec7f53481badc09c9af3bddd20a6a95d34d01fb9e0b5d68fd1aefb8d6cb1d95','[\"*\"]','2026-02-21 15:30:54',NULL,'2026-02-21 15:30:53','2026-02-21 15:30:54'),(89,'App\\Models\\User',3,'auth_token','47519b0f4d97f8f6fb52ac22510151e356880fee08b04a1a4a3ff676a3900f6c','[\"*\"]','2026-02-21 15:37:26',NULL,'2026-02-21 15:37:25','2026-02-21 15:37:26'),(90,'App\\Models\\User',3,'auth_token','05525b4a1a36eff4a99c2df8b965d56ff0c143f491e5daf1be6bcf84d6af06af','[\"*\"]','2026-02-21 15:42:20',NULL,'2026-02-21 15:42:19','2026-02-21 15:42:20'),(91,'App\\Models\\User',3,'auth_token','a78ed1e67027449796b641b9d5d6b3d46c60e24286a51add5db3eabbd7988624','[\"*\"]','2026-02-21 15:46:41',NULL,'2026-02-21 15:46:40','2026-02-21 15:46:41'),(92,'App\\Models\\User',3,'auth_token','c1b665a3de30ad23c70b3115fc8bdffb69068f11efcccd1296db674a6c3c9cc9','[\"*\"]','2026-02-21 15:48:04',NULL,'2026-02-21 15:48:04','2026-02-21 15:48:04'),(93,'App\\Models\\User',3,'auth_token','9d11f91baccd63848c7df3e82801f4dd2a03b478a6007a8ce2440a42cee30d5f','[\"*\"]','2026-02-21 15:56:39',NULL,'2026-02-21 15:56:38','2026-02-21 15:56:39'),(94,'App\\Models\\User',1,'auth_token','76411b84d35f535009465dcb1267b75ad249107bf0149b7247121035cf08e484','[\"*\"]','2026-02-22 22:33:19',NULL,'2026-02-22 22:30:18','2026-02-22 22:33:19'),(95,'App\\Models\\User',2,'auth_token','ec669e91aa61bf53240449ffa2ff5aace607398291984917c2a41c49ad61f305','[\"*\"]','2026-02-22 22:33:39',NULL,'2026-02-22 22:33:37','2026-02-22 22:33:39'),(96,'App\\Models\\User',5,'auth_token','c90ca9a3e370f602af26604dad692e5d8e297ea1f9c8481eeefbf6ffa6b6e645','[\"*\"]','2026-02-22 22:34:05',NULL,'2026-02-22 22:34:01','2026-02-22 22:34:05'),(97,'App\\Models\\User',3,'auth_token','79469e58dee9abc6ae31a7a14de6ad28594f13f6fde9a3f6e476c3086b67db04','[\"*\"]','2026-02-22 22:34:25',NULL,'2026-02-22 22:34:23','2026-02-22 22:34:25'),(98,'App\\Models\\User',3,'auth_token','8c13755ae1adf48379bfa210b231d7452fb6781df95e8a12dfe19566b9f30163','[\"*\"]','2026-02-22 22:41:11',NULL,'2026-02-22 22:41:10','2026-02-22 22:41:11'),(99,'App\\Models\\User',3,'auth_token','a6ea070b1ffbe5da3048d9623ff235080e2cb00fd8024ab7cc1bd217570f9d4d','[\"*\"]','2026-02-22 22:49:47',NULL,'2026-02-22 22:49:45','2026-02-22 22:49:47'),(100,'App\\Models\\User',1,'auth_token','421611ab48881e8de71677c108a2f763136d2d03cd004f02eefd4f9031d0a616','[\"*\"]','2026-02-22 23:10:15',NULL,'2026-02-22 23:10:11','2026-02-22 23:10:15'),(101,'App\\Models\\User',3,'auth_token','28edbf7f14f8a16bbfef1b05237b95cd9c44ba0c3929e7b1801e4569630a0fac','[\"*\"]','2026-02-26 14:28:58',NULL,'2026-02-26 14:28:57','2026-02-26 14:28:58'),(102,'App\\Models\\User',3,'auth_token','b15f469a74c9b310dd5fc25308426d217ffaa0b018a19e51fc871d86f022369e','[\"*\"]','2026-03-02 21:15:22',NULL,'2026-03-02 21:15:20','2026-03-02 21:15:22'),(103,'App\\Models\\User',3,'auth_token','7a7eef9484122ca7108c018aafda3f5835c60e3923ec46e6de23ecbbd207d36d','[\"*\"]','2026-03-02 21:16:19',NULL,'2026-03-02 21:16:17','2026-03-02 21:16:19'),(104,'App\\Models\\User',1,'auth_token','afbfac98b0f75055104b77c752b20557fc667c051c3fa283ffefbf7fa6bbda47','[\"*\"]','2026-03-02 21:17:46',NULL,'2026-03-02 21:17:29','2026-03-02 21:17:46'),(105,'App\\Models\\User',1,'auth_token','c52943acf49f7e615aae662736f8831aae304545002d39d61af7f9402c4aa0b0','[\"*\"]','2026-03-09 11:00:33',NULL,'2026-03-09 11:00:20','2026-03-09 11:00:33'),(106,'App\\Models\\User',3,'auth_token','08a5d36511c0f209b8f529603e4c5afc1a63da196e4fdc6907322bc59d37a495','[\"*\"]','2026-03-09 11:00:52',NULL,'2026-03-09 11:00:51','2026-03-09 11:00:52'),(107,'App\\Models\\User',6,'auth_token','0cd3f7664688db7f25fc2f6ef101bd5f67898b42cb9937b236144911b4bcbcb0','[\"*\"]','2026-03-27 09:43:01',NULL,'2026-03-27 09:42:59','2026-03-27 09:43:01'),(108,'App\\Models\\User',6,'auth_token','93f698bffdada9258a61b1d2e05ce824edffe2275efd802f1febb9cda3584aa4','[\"*\"]','2026-03-27 09:44:01',NULL,'2026-03-27 09:44:00','2026-03-27 09:44:01'),(109,'App\\Models\\User',6,'auth_token','f8f851f6e9cdcf3b5052f7739f998d8113b5f9ec9e8392ae64b7127f3780e002','[\"*\"]','2026-03-27 09:48:51',NULL,'2026-03-27 09:48:50','2026-03-27 09:48:51'),(110,'App\\Models\\User',1,'auth_token','8de58ecb6dd8ba147b9862fac9ce6a6884096e3e8454a18098dd03b1dcfe78ae','[\"*\"]','2026-03-27 09:49:58',NULL,'2026-03-27 09:49:44','2026-03-27 09:49:58'),(111,'App\\Models\\User',1,'auth_token','77ccfe9af97441ba73e849faa72aee5c980d6c720a090caa40ca7aee304c1991','[\"*\"]','2026-03-27 09:55:59',NULL,'2026-03-27 09:54:39','2026-03-27 09:55:59'),(112,'App\\Models\\User',3,'auth_token','4ec79f5c6d0310fbeab1c2236ed46f889b682e0f4a6e352e33cf6b73f97f7619','[\"*\"]','2026-03-27 10:00:02',NULL,'2026-03-27 10:00:01','2026-03-27 10:00:02'),(113,'App\\Models\\User',3,'auth_token','495bcc0cc54c7717dc618b55b95cbc5b935bd7ea61fea93df7c0c7389cad52f4','[\"*\"]','2026-03-27 10:02:34',NULL,'2026-03-27 10:02:33','2026-03-27 10:02:34'),(114,'App\\Models\\User',1,'auth_token','e5bfc011ddd94da68e1b224352671f78ac7b614919a00ac132a6cdb4025f45fb','[\"*\"]','2026-03-27 10:04:39',NULL,'2026-03-27 10:03:20','2026-03-27 10:04:39'),(115,'App\\Models\\User',3,'auth_token','5f9b48fe094f27eeaecae826bc4ae3d2b43b8380565a2573abc167515edf21f7','[\"*\"]','2026-03-27 10:04:57',NULL,'2026-03-27 10:04:56','2026-03-27 10:04:57'),(116,'App\\Models\\User',1,'auth_token','30eb3f1ca775b3e436437c2bf4101122062952bb14902ddafb54d1ed773d3b09','[\"*\"]','2026-03-27 10:18:13',NULL,'2026-03-27 10:07:26','2026-03-27 10:18:13'),(117,'App\\Models\\User',3,'auth_token','7a88ab5c42033bd9e25d9d78fd57303ed46035979aa43d830016ea2bec75c7a4','[\"*\"]','2026-03-27 10:21:18',NULL,'2026-03-27 10:19:43','2026-03-27 10:21:18'),(118,'App\\Models\\User',1,'auth_token','979e4aa65ba2831cfac57a26e7c6a62db3f36b42faf3a4838d1bc7ab7d3d2233','[\"*\"]','2026-03-27 10:34:29',NULL,'2026-03-27 10:33:51','2026-03-27 10:34:29'),(119,'App\\Models\\User',3,'auth_token','111987d4e7674aa9db7856c63e7f2279564c4c4c515c7173dc140242a766fb5c','[\"*\"]','2026-03-31 18:44:52',NULL,'2026-03-31 18:44:51','2026-03-31 18:44:52'),(120,'App\\Models\\User',1,'auth_token','ef7b3ac63013e34633081ecbc62551d1ddba8e9c2d06c6c83c7c0ce96e39486f','[\"*\"]','2026-03-31 18:45:55',NULL,'2026-03-31 18:45:49','2026-03-31 18:45:55'),(121,'App\\Models\\User',3,'auth_token','568fd66e294892310d86652a90bb447210285027e2c67014069ef9b3c4472e2f','[\"*\"]','2026-03-31 18:47:00',NULL,'2026-03-31 18:46:58','2026-03-31 18:47:00'),(122,'App\\Models\\User',3,'auth_token','15614ff494f93f2a8bc387a7a4c77d153a7a673af277b991c9cf84ec8203a7ae','[\"*\"]','2026-03-31 18:59:58',NULL,'2026-03-31 18:59:57','2026-03-31 18:59:58'),(123,'App\\Models\\User',3,'auth_token','5ae5a166527f31b93a095a2ca182e9a6c93119e14344ac6dcc49bf358f363d54','[\"*\"]','2026-03-31 19:24:06',NULL,'2026-03-31 19:24:05','2026-03-31 19:24:06'),(124,'App\\Models\\User',3,'auth_token','bf2481804a1891eef6f497fc3d4017a5772b74bc252853b6147e2af6154f8a5a','[\"*\"]','2026-03-31 19:27:54',NULL,'2026-03-31 19:27:52','2026-03-31 19:27:54'),(125,'App\\Models\\User',3,'auth_token','317a8552f6c5a96b674364d376022241be0d71762e3a665627f75ada29494e16','[\"*\"]','2026-03-31 19:33:01',NULL,'2026-03-31 19:33:00','2026-03-31 19:33:01'),(126,'App\\Models\\User',1,'auth_token','dc1b5b305dfae4637e7acfbb23b1c5c43cc811c54a1dcd03d49929400b62da6c','[\"*\"]','2026-03-31 19:48:33',NULL,'2026-03-31 19:48:29','2026-03-31 19:48:33'),(127,'App\\Models\\User',3,'auth_token','17fb2fd110cdd0ee36ce01c7052b17763fdf3902af1a2aebe864bacebbf7ffbe','[\"*\"]','2026-04-02 08:14:14',NULL,'2026-04-02 08:14:11','2026-04-02 08:14:14'),(128,'App\\Models\\User',3,'auth_token','439d8ff2bc84ba532dfc11ce589e36a9a2299e50cef02bd1639d7e908ef66d41','[\"*\"]','2026-04-05 12:54:01',NULL,'2026-04-05 12:53:56','2026-04-05 12:54:01'),(129,'App\\Models\\User',1,'auth_token','03f59cc3e9d292b38a1e95b02e4ea3f68a90809702dea7733966826552190d74','[\"*\"]','2026-04-05 12:58:22',NULL,'2026-04-05 12:55:39','2026-04-05 12:58:22'),(130,'App\\Models\\User',1,'auth_token','195d8d030d1e1aa5207c632336eb5631434c13f9d9db4be5d616f10c992c5662','[\"*\"]','2026-04-05 20:17:07',NULL,'2026-04-05 20:08:41','2026-04-05 20:17:07'),(131,'App\\Models\\User',1,'auth_token','89d33a7f5176eab926aface7a3e55e5d72e0a7005d243fa0d526fa7fbd505520','[\"*\"]','2026-04-05 20:30:38',NULL,'2026-04-05 20:30:31','2026-04-05 20:30:38'),(132,'App\\Models\\User',1,'auth_token','27930095bd72109d379c60186d862322aaaa342703e0e120db9059a023c8b5eb','[\"*\"]','2026-04-05 21:01:48',NULL,'2026-04-05 20:59:29','2026-04-05 21:01:48'),(133,'App\\Models\\User',1,'auth_token','ea1009e7fc939b8c316137eeaa1a4ccfd296637a1979e2c042356d524e19ce4b','[\"*\"]','2026-04-06 09:31:55',NULL,'2026-04-06 09:30:13','2026-04-06 09:31:55'),(134,'App\\Models\\User',1,'auth_token','a5ccd1f16d2b8aa3031d9de14882e10d4626a7e7956ce78989cefb1cdab3f2be','[\"*\"]','2026-04-06 09:32:33',NULL,'2026-04-06 09:32:14','2026-04-06 09:32:33'),(135,'App\\Models\\User',1,'auth_token','a4ffbeafc3b5cd1a51f06cef6723c8cf5b98ac0b124d534ec4a1f788d2ffa8ea','[\"*\"]','2026-04-06 09:43:57',NULL,'2026-04-06 09:40:18','2026-04-06 09:43:57'),(136,'App\\Models\\User',3,'auth_token','ff5a498c7eaf4f87d53583be54d6a0007785283eca54a758a07a20016d5b40b4','[\"*\"]','2026-04-06 09:45:06',NULL,'2026-04-06 09:44:27','2026-04-06 09:45:06'),(137,'App\\Models\\User',3,'auth_token','0c8b546fb4e4d0da94c7a0e9b6ef868271591b512aa508167bda21adf8e87621','[\"*\"]','2026-04-06 11:10:59',NULL,'2026-04-06 09:59:23','2026-04-06 11:10:59'),(143,'App\\Models\\User',1,'auth_token','90c66dd22b9f5c5b301df0814e877d416dc7fc759ba36eea56d55ed8cf3d3dae','[\"*\"]','2026-04-06 10:38:00',NULL,'2026-04-06 10:32:29','2026-04-06 10:38:00'),(152,'App\\Models\\User',3,'auth_token','6df48f7dc48827409859d5a81683dd8d9ca4b97536fb0f83e4513b29b23b42a4','[\"*\"]','2026-04-06 16:45:21',NULL,'2026-04-06 16:45:17','2026-04-06 16:45:21'),(154,'App\\Models\\User',1,'auth_token','6858556e8f2f5b28210dc8830e85e43b76d2819d75001f7462deacbbc9d4c7ad','[\"*\"]','2026-04-06 17:47:43',NULL,'2026-04-06 17:47:10','2026-04-06 17:47:43'),(155,'App\\Models\\User',1,'auth_token','a390967877da2f463d92bc17f09018e5a192cddfc13793a2bc327170e500a4d2','[\"*\"]',NULL,NULL,'2026-04-07 22:27:18','2026-04-07 22:27:18'),(156,'App\\Models\\User',9,'auth_token','431e32edd98e17144f45c7d83282b48d3b2c96145083815650e39890927e078a','[\"*\"]',NULL,NULL,'2026-04-07 22:30:34','2026-04-07 22:30:34'),(157,'App\\Models\\User',1,'auth_token','250d19a6538e859bd1bbac73985dc034f81b0ac5483a60efe07d1b1a457bab07','[\"*\"]','2026-04-07 22:55:12',NULL,'2026-04-07 22:32:53','2026-04-07 22:55:12'),(158,'App\\Models\\User',1,'auth_token','c311090de94c5bb19833c57b046d633194cb79233abf8aa0aae5d04a849916b3','[\"*\"]','2026-04-07 23:02:00',NULL,'2026-04-07 22:57:13','2026-04-07 23:02:00'),(159,'App\\Models\\User',10,'auth_token','d1ca9f551138e096c79bfb1da570e47d8b51fdafb643bd3ba57c0bc452eae897','[\"*\"]',NULL,NULL,'2026-04-07 23:00:41','2026-04-07 23:00:41'),(163,'App\\Models\\User',3,'auth_token','94d9b767f78c0fe8f1a629eba45dd0cb2749508feb55e65d5a9416fe49d19fb9','[\"*\"]','2026-04-25 11:03:06',NULL,'2026-04-25 11:03:05','2026-04-25 11:03:06');
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_steps`
--

DROP TABLE IF EXISTS `project_steps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_steps` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `project_id` bigint unsigned NOT NULL,
  `label` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Ex: "Fondations", "Peinture"',
  `status` enum('pending','in_progress','completed') COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_num` int NOT NULL COMMENT 'Ordre d''affichage de l''étape',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_steps_project_id_foreign` (`project_id`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_steps`
--

LOCK TABLES `project_steps` WRITE;
/*!40000 ALTER TABLE `project_steps` DISABLE KEYS */;
INSERT INTO `project_steps` VALUES (1,1,'Terrassement','completed',1,'2026-02-03 22:50:51','2026-02-03 22:50:51'),(2,1,'Fondations','completed',2,'2026-02-03 22:50:51','2026-02-03 22:50:51'),(3,1,'Gros Œuvre','completed',3,'2026-02-03 22:50:51','2026-02-03 22:50:51'),(4,1,'Second Œuvre','completed',4,'2026-02-03 22:50:51','2026-02-06 15:01:31'),(5,2,'Gros Œuvre','completed',1,'2026-02-03 22:50:51','2026-02-03 22:50:51'),(6,2,'Platrerie','completed',2,'2026-02-03 22:50:51','2026-02-03 22:50:51'),(7,2,'Peinture','in_progress',3,'2026-02-03 22:50:51','2026-02-03 22:50:51'),(8,3,'Fondations','completed',1,'2026-02-03 22:50:51','2026-02-03 22:50:51'),(9,3,'Structure Béton','in_progress',2,'2026-02-03 22:50:51','2026-02-03 22:50:51'),(10,3,'Façade Vitrée','pending',3,'2026-02-03 22:50:51','2026-02-03 22:50:51'),(11,1,'3 oeuvre','in_progress',5,'2026-02-03 23:19:58','2026-02-06 15:01:43'),(12,7,'Préparation de chantier','completed',1,'2026-03-27 09:54:01','2026-03-27 09:54:01'),(13,7,'Terrassement','completed',2,'2026-03-27 09:54:01','2026-03-27 09:54:01'),(14,7,'Fondations','in_progress',3,'2026-03-27 09:54:01','2026-03-27 09:54:01'),(15,7,'Élévation des murs','pending',4,'2026-03-27 09:54:01','2026-03-27 09:54:01'),(16,8,'Études et plans','completed',1,'2026-03-27 09:54:01','2026-03-27 09:54:01'),(17,8,'Obtention des permis','completed',2,'2026-03-27 09:54:01','2026-03-27 09:54:01'),(18,8,'Installation de chantier','in_progress',3,'2026-03-27 09:54:01','2026-03-27 09:54:01'),(19,8,'Gros œuvre','pending',4,'2026-03-27 09:54:01','2026-03-27 09:54:01'),(20,9,'Gros œuvre','completed',1,'2026-03-27 09:54:01','2026-03-27 09:54:01'),(21,9,'Charpente et couverture','completed',2,'2026-03-27 09:54:01','2026-03-27 09:54:01'),(22,9,'Équipements sportifs','completed',3,'2026-03-27 09:54:01','2026-03-27 09:54:01'),(23,9,'Aménagements extérieurs','in_progress',4,'2026-03-27 09:54:01','2026-03-27 09:54:01'),(24,10,'Préparation de chantier','completed',1,'2026-03-27 10:02:00','2026-03-27 10:02:00'),(25,10,'Terrassement','completed',2,'2026-03-27 10:02:00','2026-03-27 10:02:00'),(26,10,'Fondations','in_progress',3,'2026-03-27 10:02:00','2026-03-27 10:02:00'),(27,10,'Élévation des murs','pending',4,'2026-03-27 10:02:00','2026-03-27 10:02:00'),(28,11,'Études et plans','completed',1,'2026-03-27 10:02:00','2026-03-27 10:02:00'),(29,11,'Obtention des permis','completed',2,'2026-03-27 10:02:00','2026-03-27 10:02:00'),(30,11,'Installation de chantier','in_progress',3,'2026-03-27 10:02:00','2026-03-27 10:02:00'),(31,11,'Gros œuvre','pending',4,'2026-03-27 10:02:00','2026-03-27 10:02:00'),(32,12,'Gros œuvre','completed',1,'2026-03-27 10:02:00','2026-03-27 10:02:00'),(33,12,'Charpente et couverture','completed',2,'2026-03-27 10:02:00','2026-03-27 10:02:00'),(34,12,'Équipements sportifs','completed',3,'2026-03-27 10:02:00','2026-03-27 10:02:00'),(35,12,'Aménagements extérieurs','in_progress',4,'2026-03-27 10:02:00','2026-03-27 10:02:00');
/*!40000 ALTER TABLE `project_steps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projects` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Ex: "Résidence Sunrise"',
  `location` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Ville ou quartier',
  `progress` int NOT NULL DEFAULT '0' COMMENT 'Pourcentage d''avancement',
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Ex: "Finitions en cours"',
  `image_path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'URL de l''image du bâtiment',
  `document_path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_value` decimal(15,2) NOT NULL COMMENT 'Pour calculer le CA (Chiffre d''Affaires)',
  `delivery_date` date NOT NULL COMMENT 'Date prévue de remise des clés',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `projects_user_id_foreign` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (1,3,'Appartement Mohammadia','Mohammadia',80,'Gros œuvre terminé','Appartment in Mohammédia.jpg',NULL,1200000.00,'2026-10-15','2026-02-03 22:50:51','2026-02-18 14:50:11'),(2,3,'Villa Prestige','Marrakech, Maroc',80,'Finitions en cours','luxury_villa.png',NULL,2500000.00,'2026-08-20','2026-02-03 22:50:51','2026-02-18 13:05:05'),(5,2,'Immeuble CFC Tower','Casablanca, CFC',80,'Gros œuvre en cours','Cfc.jpg',NULL,45000000.00,'2026-12-31','2026-02-18 15:27:53','2026-02-18 15:27:53'),(12,3,'Complexe Sportif Atlas','Rabat, Maroc',95,'Finitions finales','villa-Rabat.jpg',NULL,7500000.00,'2026-04-10','2026-03-27 10:02:00','2026-03-27 10:03:35'),(11,3,'Centre Commercial Al Madina','Fès, Maroc',10,'Démarrage','business_center.png',NULL,18000000.00,'2029-12-01','2026-03-27 10:02:00','2026-03-27 10:03:53'),(10,3,'appartement mohammadia','Mohammadia',20,'Gros œuvre en cours','Appartment in Mohammédia.jpg',NULL,5000000.00,'2028-05-15','2026-03-27 10:02:00','2026-03-27 10:04:03'),(14,3,'Villa Bakkah Marina','Tanger',0,'Planification','https://link-to-your-image.jpg',NULL,2500000.00,'2026-12-31','2026-04-07 22:55:12','2026-04-07 22:55:12'),(15,3,'Villa Bakkah Marina','Tanger',0,'Planification','https://link-to-your-image.jpg',NULL,2500000.00,'2026-12-31','2026-04-07 23:02:00','2026-04-07 23:02:00');
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Nom complet',
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Identifiant de connexion',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Mot de passe haché',
  `role` enum('admin','client') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'client' COMMENT 'Définit l''accès',
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Chemin de l''image de profil',
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Téléphone pour le profil',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin Bakkah1','admin@bakkah.com',NULL,'$2y$12$wY01BxK1MF/dM9y/Ycc1nO0v5FmVCYHsxlE7CClRuCuNXL1pkf7NC','admin',NULL,NULL,NULL,'2026-02-03 22:50:51','2026-04-06 11:27:24'),(3,'Anouar','anouar@gmail.com',NULL,'$2y$12$nsUWFGZFToPc37MgXPmFu.Wj6TO7uCBkCTRCCSJAjdbVQBkLkOW1e','client',NULL,'0651696871',NULL,'2026-02-03 22:53:44','2026-04-06 11:33:05'),(8,'Baha Salah','baha@gmail.com',NULL,'$2y$12$ODKtoluo0738GEh8KXIQF.9TXJxs9xlkaC65Wey5e/chmnxEwrUTC','client',NULL,'06777777777',NULL,'2026-04-06 10:31:52','2026-04-06 10:31:52'),(4,'ILYASS','ilyass@gmail.com',NULL,'$2y$12$ThimwZQENhIba0wAO8PQNeCVyH4fE2btyXkBrxTYPVjTQYt1syY5C','client',NULL,'064456677788',NULL,'2026-02-04 12:12:13','2026-02-04 12:12:13'),(5,'Admin Bakkah3','admin@gmail.com',NULL,'$2y$12$wVqdcAUjQzsEDvRO537Ir.Wb8kWNm15B1ltU70JLz.Cnaj4FilVqG','admin',NULL,NULL,NULL,'2026-02-22 22:31:57','2026-02-22 22:32:25'),(6,'TAHA EL','taha@gmail.com',NULL,'$2y$12$mhGV8QOeP.XwbZ7jUdFuAOhMEd1MqPrY/QUdVUP/VrY9chgBRTQiS','client',NULL,'0615515551',NULL,'2026-03-27 09:42:59','2026-03-27 09:42:59'),(9,'Anouar Test','test.register@example.com',NULL,'$2y$12$io0mLg.lLugkYd2H/85BYecriRQL57nVRfyTISl5aFg4/wh2VSPb.','client',NULL,'0612345678',NULL,'2026-04-07 22:30:34','2026-04-07 22:30:34'),(10,'Anouar Test','test.register1@example.com',NULL,'$2y$12$lOEQfACW2YFmsThR731slO8RxdYdF/yZP8OX9NABmS9s7xeDnQ442','client',NULL,'0612345678',NULL,'2026-04-07 23:00:41','2026-04-07 23:00:41');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-25 16:19:34
