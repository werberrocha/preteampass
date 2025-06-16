-- MySQL dump 10.13  Distrib 8.0.42, for Linux (x86_64)
--
-- Host: localhost    Database: teampass
-- ------------------------------------------------------
-- Server version	11.5.2-MariaDB-ubu2404

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
-- Table structure for table `teampass_api`
--

DROP TABLE IF EXISTS `teampass_api`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teampass_api` (
  `increment_id` int(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(15) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `value` text DEFAULT NULL,
  `timestamp` varchar(50) NOT NULL,
  `user_id` int(13) DEFAULT NULL,
  `allowed_folders` text DEFAULT NULL,
  `enabled` int(1) NOT NULL DEFAULT 0,
  `allowed_to_create` int(1) NOT NULL DEFAULT 0,
  `allowed_to_read` int(1) NOT NULL DEFAULT 1,
  `allowed_to_update` int(1) NOT NULL DEFAULT 0,
  `allowed_to_delete` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`increment_id`),
  KEY `USER` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teampass_api`
--

LOCK TABLES `teampass_api` WRITE;
/*!40000 ALTER TABLE `teampass_api` DISABLE KEYS */;
/*!40000 ALTER TABLE `teampass_api` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teampass_auth_failures`
--

DROP TABLE IF EXISTS `teampass_auth_failures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teampass_auth_failures` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `source` enum('login','remote_ip') NOT NULL,
  `value` varchar(500) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `unlock_at` timestamp NULL DEFAULT NULL,
  `unlock_code` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teampass_auth_failures`
--

LOCK TABLES `teampass_auth_failures` WRITE;
/*!40000 ALTER TABLE `teampass_auth_failures` DISABLE KEYS */;
INSERT INTO `teampass_auth_failures` VALUES (1,'login','admin','2025-06-12 19:39:26',NULL,NULL),(2,'remote_ip','10.1.1.117','2025-06-12 19:39:26',NULL,NULL),(3,'login','admin','2025-06-12 19:39:40',NULL,NULL),(4,'remote_ip','10.1.1.117','2025-06-12 19:39:40',NULL,NULL),(5,'login','admin','2025-06-12 19:39:44',NULL,NULL),(6,'remote_ip','10.1.1.117','2025-06-12 19:39:44',NULL,NULL);
/*!40000 ALTER TABLE `teampass_auth_failures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teampass_automatic_del`
--

DROP TABLE IF EXISTS `teampass_automatic_del`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teampass_automatic_del` (
  `item_id` int(11) NOT NULL,
  `del_enabled` tinyint(1) NOT NULL,
  `del_type` tinyint(1) NOT NULL,
  `del_value` varchar(35) NOT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teampass_automatic_del`
--

LOCK TABLES `teampass_automatic_del` WRITE;
/*!40000 ALTER TABLE `teampass_automatic_del` DISABLE KEYS */;
/*!40000 ALTER TABLE `teampass_automatic_del` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teampass_background_subtasks`
--

DROP TABLE IF EXISTS `teampass_background_subtasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teampass_background_subtasks` (
  `increment_id` int(12) NOT NULL AUTO_INCREMENT,
  `task_id` int(12) NOT NULL,
  `created_at` varchar(50) NOT NULL,
  `updated_at` varchar(50) DEFAULT NULL,
  `finished_at` varchar(50) DEFAULT NULL,
  `task` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`task`)),
  `process_id` varchar(100) DEFAULT NULL,
  `is_in_progress` tinyint(1) NOT NULL DEFAULT 0,
  `sub_task_in_progress` tinyint(1) NOT NULL DEFAULT 0,
  `status` varchar(50) DEFAULT NULL,
  `error_message` text DEFAULT NULL,
  PRIMARY KEY (`increment_id`),
  KEY `idx_finished` (`finished_at`),
  KEY `task_id_idx` (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teampass_background_subtasks`
--

LOCK TABLES `teampass_background_subtasks` WRITE;
/*!40000 ALTER TABLE `teampass_background_subtasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `teampass_background_subtasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teampass_background_tasks`
--

DROP TABLE IF EXISTS `teampass_background_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teampass_background_tasks` (
  `increment_id` int(12) NOT NULL AUTO_INCREMENT,
  `created_at` varchar(50) NOT NULL,
  `started_at` varchar(50) DEFAULT NULL,
  `updated_at` varchar(50) DEFAULT NULL,
  `finished_at` varchar(50) DEFAULT NULL,
  `process_id` int(12) DEFAULT NULL,
  `process_type` varchar(100) NOT NULL,
  `output` text DEFAULT NULL,
  `arguments` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`arguments`)),
  `is_in_progress` tinyint(1) NOT NULL DEFAULT 0,
  `item_id` int(12) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `error_message` text DEFAULT NULL,
  PRIMARY KEY (`increment_id`),
  KEY `idx_finished` (`finished_at`),
  KEY `idx_progress` (`is_in_progress`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teampass_background_tasks`
--

LOCK TABLES `teampass_background_tasks` WRITE;
/*!40000 ALTER TABLE `teampass_background_tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `teampass_background_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teampass_background_tasks_logs`
--

DROP TABLE IF EXISTS `teampass_background_tasks_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teampass_background_tasks_logs` (
  `increment_id` int(12) NOT NULL AUTO_INCREMENT,
  `created_at` int(11) NOT NULL,
  `job` varchar(50) NOT NULL,
  `status` varchar(10) NOT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `finished_at` int(11) DEFAULT NULL,
  `treated_objects` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`increment_id`),
  KEY `idx_created_at` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teampass_background_tasks_logs`
--

LOCK TABLES `teampass_background_tasks_logs` WRITE;
/*!40000 ALTER TABLE `teampass_background_tasks_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `teampass_background_tasks_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teampass_cache`
--

DROP TABLE IF EXISTS `teampass_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teampass_cache` (
  `increment_id` int(12) NOT NULL AUTO_INCREMENT,
  `id` int(12) NOT NULL,
  `label` varchar(500) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `tags` text DEFAULT NULL,
  `id_tree` int(12) NOT NULL,
  `perso` tinyint(1) NOT NULL,
  `restricted_to` varchar(200) DEFAULT NULL,
  `login` text DEFAULT NULL,
  `folder` text NOT NULL,
  `author` varchar(50) NOT NULL,
  `renewal_period` tinyint(4) NOT NULL DEFAULT 0,
  `timestamp` varchar(50) DEFAULT NULL,
  `url` text DEFAULT NULL,
  `encryption_type` varchar(50) DEFAULT '0',
  PRIMARY KEY (`increment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teampass_cache`
--

LOCK TABLES `teampass_cache` WRITE;
/*!40000 ALTER TABLE `teampass_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `teampass_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teampass_cache_tree`
--

DROP TABLE IF EXISTS `teampass_cache_tree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teampass_cache_tree` (
  `increment_id` smallint(32) NOT NULL AUTO_INCREMENT,
  `data` longtext DEFAULT NULL CHECK (json_valid(`data`)),
  `visible_folders` longtext NOT NULL,
  `timestamp` varchar(50) NOT NULL,
  `user_id` int(12) NOT NULL,
  `folders` longtext DEFAULT NULL,
  PRIMARY KEY (`increment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teampass_cache_tree`
--

LOCK TABLES `teampass_cache_tree` WRITE;
/*!40000 ALTER TABLE `teampass_cache_tree` DISABLE KEYS */;
/*!40000 ALTER TABLE `teampass_cache_tree` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teampass_categories`
--

DROP TABLE IF EXISTS `teampass_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teampass_categories` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `parent_id` int(12) NOT NULL,
  `title` varchar(255) NOT NULL,
  `level` int(2) NOT NULL,
  `description` text DEFAULT NULL,
  `type` varchar(50) DEFAULT '',
  `masked` tinyint(1) NOT NULL DEFAULT 0,
  `order` int(12) NOT NULL DEFAULT 0,
  `encrypted_data` tinyint(1) NOT NULL DEFAULT 1,
  `role_visibility` varchar(255) NOT NULL DEFAULT 'all',
  `is_mandatory` tinyint(1) NOT NULL DEFAULT 0,
  `regex` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teampass_categories`
--

LOCK TABLES `teampass_categories` WRITE;
/*!40000 ALTER TABLE `teampass_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `teampass_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teampass_categories_folders`
--

DROP TABLE IF EXISTS `teampass_categories_folders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teampass_categories_folders` (
  `increment_id` int(12) NOT NULL AUTO_INCREMENT,
  `id_category` int(12) NOT NULL,
  `id_folder` int(12) NOT NULL,
  PRIMARY KEY (`increment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teampass_categories_folders`
--

LOCK TABLES `teampass_categories_folders` WRITE;
/*!40000 ALTER TABLE `teampass_categories_folders` DISABLE KEYS */;
/*!40000 ALTER TABLE `teampass_categories_folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teampass_categories_items`
--

DROP TABLE IF EXISTS `teampass_categories_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teampass_categories_items` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `data` text NOT NULL,
  `data_iv` text NOT NULL,
  `encryption_type` varchar(20) NOT NULL DEFAULT 'not_set',
  `is_mandatory` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teampass_categories_items`
--

LOCK TABLES `teampass_categories_items` WRITE;
/*!40000 ALTER TABLE `teampass_categories_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `teampass_categories_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teampass_defuse_passwords`
--

DROP TABLE IF EXISTS `teampass_defuse_passwords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teampass_defuse_passwords` (
  `increment_id` int(12) NOT NULL AUTO_INCREMENT,
  `type` varchar(100) NOT NULL,
  `object_id` int(12) NOT NULL,
  `password` text NOT NULL,
  PRIMARY KEY (`increment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teampass_defuse_passwords`
--

LOCK TABLES `teampass_defuse_passwords` WRITE;
/*!40000 ALTER TABLE `teampass_defuse_passwords` DISABLE KEYS */;
/*!40000 ALTER TABLE `teampass_defuse_passwords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teampass_emails`
--

DROP TABLE IF EXISTS `teampass_emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teampass_emails` (
  `increment_id` int(12) NOT NULL AUTO_INCREMENT,
  `timestamp` int(30) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `receivers` text NOT NULL,
  `status` varchar(30) NOT NULL,
  PRIMARY KEY (`increment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teampass_emails`
--

LOCK TABLES `teampass_emails` WRITE;
/*!40000 ALTER TABLE `teampass_emails` DISABLE KEYS */;
/*!40000 ALTER TABLE `teampass_emails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teampass_export`
--

DROP TABLE IF EXISTS `teampass_export`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teampass_export` (
  `increment_id` int(12) NOT NULL AUTO_INCREMENT,
  `export_tag` varchar(20) NOT NULL,
  `item_id` int(12) NOT NULL,
  `label` varchar(500) NOT NULL,
  `login` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `pw` text NOT NULL,
  `path` varchar(500) NOT NULL,
  `email` varchar(500) NOT NULL DEFAULT 'none',
  `url` varchar(500) NOT NULL DEFAULT 'none',
  `kbs` varchar(500) NOT NULL DEFAULT 'none',
  `tags` varchar(500) NOT NULL DEFAULT 'none',
  `folder_id` varchar(10) NOT NULL,
  `perso` tinyint(1) NOT NULL DEFAULT 0,
  `restricted_to` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`increment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teampass_export`
--

LOCK TABLES `teampass_export` WRITE;
/*!40000 ALTER TABLE `teampass_export` DISABLE KEYS */;
/*!40000 ALTER TABLE `teampass_export` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teampass_files`
--

DROP TABLE IF EXISTS `teampass_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teampass_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_item` int(11) NOT NULL,
  `name` text NOT NULL,
  `size` int(10) NOT NULL,
  `extension` varchar(10) NOT NULL,
  `type` varchar(255) NOT NULL,
  `file` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT '0',
  `content` longblob DEFAULT NULL,
  `confirmed` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teampass_files`
--

LOCK TABLES `teampass_files` WRITE;
/*!40000 ALTER TABLE `teampass_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `teampass_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teampass_items`
--

DROP TABLE IF EXISTS `teampass_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teampass_items` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `label` varchar(500) NOT NULL,
  `description` text DEFAULT NULL,
  `pw` text DEFAULT NULL,
  `pw_iv` text DEFAULT NULL,
  `pw_len` int(5) NOT NULL DEFAULT 0,
  `url` text DEFAULT NULL,
  `id_tree` varchar(10) DEFAULT NULL,
  `perso` tinyint(1) NOT NULL DEFAULT 0,
  `login` varchar(200) DEFAULT NULL,
  `inactif` tinyint(1) NOT NULL DEFAULT 0,
  `restricted_to` varchar(200) DEFAULT NULL,
  `anyone_can_modify` tinyint(1) NOT NULL DEFAULT 0,
  `email` varchar(100) DEFAULT NULL,
  `notification` varchar(250) DEFAULT NULL,
  `viewed_no` int(12) NOT NULL DEFAULT 0,
  `complexity_level` varchar(3) NOT NULL DEFAULT '-1',
  `auto_update_pwd_frequency` tinyint(2) NOT NULL DEFAULT 0,
  `auto_update_pwd_next_date` varchar(100) NOT NULL DEFAULT '0',
  `encryption_type` varchar(20) NOT NULL DEFAULT 'not_set',
  `fa_icon` varchar(100) DEFAULT NULL,
  `item_key` varchar(500) NOT NULL DEFAULT '-1',
  `created_at` varchar(30) DEFAULT NULL,
  `updated_at` varchar(30) DEFAULT NULL,
  `deleted_at` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `restricted_inactif_idx` (`restricted_to`,`inactif`),
  KEY `items_perso_id_idx` (`perso`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teampass_items`
--

LOCK TABLES `teampass_items` WRITE;
/*!40000 ALTER TABLE `teampass_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `teampass_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teampass_items_change`
--

DROP TABLE IF EXISTS `teampass_items_change`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teampass_items_change` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `item_id` int(12) NOT NULL,
  `label` varchar(255) NOT NULL DEFAULT 'none',
  `pw` text NOT NULL,
  `login` varchar(255) NOT NULL DEFAULT 'none',
  `email` varchar(255) NOT NULL DEFAULT 'none',
  `url` varchar(255) NOT NULL DEFAULT 'none',
  `description` text NOT NULL,
  `comment` text NOT NULL,
  `folder_id` tinyint(12) NOT NULL,
  `user_id` int(12) NOT NULL,
  `timestamp` varchar(50) NOT NULL DEFAULT 'none',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teampass_items_change`
--

LOCK TABLES `teampass_items_change` WRITE;
/*!40000 ALTER TABLE `teampass_items_change` DISABLE KEYS */;
/*!40000 ALTER TABLE `teampass_items_change` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teampass_items_edition`
--

DROP TABLE IF EXISTS `teampass_items_edition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teampass_items_edition` (
  `increment_id` int(12) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `user_id` int(12) NOT NULL,
  `timestamp` varchar(50) NOT NULL,
  PRIMARY KEY (`increment_id`),
  KEY `item_id_idx` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teampass_items_edition`
--

LOCK TABLES `teampass_items_edition` WRITE;
/*!40000 ALTER TABLE `teampass_items_edition` DISABLE KEYS */;
/*!40000 ALTER TABLE `teampass_items_edition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teampass_items_importations`
--

DROP TABLE IF EXISTS `teampass_items_importations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teampass_items_importations` (
  `increment_id` int(12) NOT NULL AUTO_INCREMENT,
  `operation_id` int(12) NOT NULL,
  `label` varchar(255) NOT NULL,
  `login` varchar(255) NOT NULL,
  `pwd` text NOT NULL,
  `url` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `folder` varchar(1000) NOT NULL,
  `folder_id` int(12) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `imported_at` int(12) DEFAULT NULL,
  PRIMARY KEY (`increment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teampass_items_importations`
--

LOCK TABLES `teampass_items_importations` WRITE;
/*!40000 ALTER TABLE `teampass_items_importations` DISABLE KEYS */;
/*!40000 ALTER TABLE `teampass_items_importations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teampass_items_otp`
--

DROP TABLE IF EXISTS `teampass_items_otp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teampass_items_otp` (
  `increment_id` int(12) NOT NULL AUTO_INCREMENT,
  `item_id` int(12) NOT NULL,
  `secret` text NOT NULL,
  `timestamp` varchar(100) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 0,
  `phone_number` varchar(25) NOT NULL,
  PRIMARY KEY (`increment_id`),
  KEY `ITEM` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teampass_items_otp`
--

LOCK TABLES `teampass_items_otp` WRITE;
/*!40000 ALTER TABLE `teampass_items_otp` DISABLE KEYS */;
/*!40000 ALTER TABLE `teampass_items_otp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teampass_kb`
--

DROP TABLE IF EXISTS `teampass_kb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teampass_kb` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `category_id` int(12) NOT NULL,
  `label` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `author_id` int(12) NOT NULL,
  `anyone_can_modify` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teampass_kb`
--

LOCK TABLES `teampass_kb` WRITE;
/*!40000 ALTER TABLE `teampass_kb` DISABLE KEYS */;
/*!40000 ALTER TABLE `teampass_kb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teampass_kb_categories`
--

DROP TABLE IF EXISTS `teampass_kb_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teampass_kb_categories` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `category` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teampass_kb_categories`
--

LOCK TABLES `teampass_kb_categories` WRITE;
/*!40000 ALTER TABLE `teampass_kb_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `teampass_kb_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teampass_kb_items`
--

DROP TABLE IF EXISTS `teampass_kb_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teampass_kb_items` (
  `increment_id` int(12) NOT NULL AUTO_INCREMENT,
  `kb_id` int(12) NOT NULL,
  `item_id` int(12) NOT NULL,
  PRIMARY KEY (`increment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teampass_kb_items`
--

LOCK TABLES `teampass_kb_items` WRITE;
/*!40000 ALTER TABLE `teampass_kb_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `teampass_kb_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teampass_languages`
--

DROP TABLE IF EXISTS `teampass_languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teampass_languages` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `code` varchar(10) NOT NULL,
  `flag` varchar(50) NOT NULL,
  `code_poeditor` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teampass_languages`
--

LOCK TABLES `teampass_languages` WRITE;
/*!40000 ALTER TABLE `teampass_languages` DISABLE KEYS */;
INSERT INTO `teampass_languages` VALUES (1,'french','French','fr','fr.png','fr'),(2,'english','English','us','us.png','en'),(3,'spanish','Spanish','es','es.png','es'),(4,'german','German','de','de.png','de'),(5,'czech','Czech','cs','cz.png','cs'),(6,'italian','Italian','it','it.png','it'),(7,'russian','Russian','ru','ru.png','ru'),(8,'turkish','Turkish','tr','tr.png','tr'),(9,'norwegian','Norwegian','no','no.png','no'),(10,'japanese','Japanese','ja','ja.png','ja'),(11,'portuguese','Portuguese','pr','pr.png','pt'),(12,'portuguese_br','Portuguese (Brazil)','pr-bt','pr-bt.png','pt-br'),(13,'chinese','Chinese','zh-Hans','cn.png','zh-Hans'),(14,'swedish','Swedish','se','se.png','sv'),(15,'dutch','Dutch','nl','nl.png','nl'),(16,'catalan','Catalan','ca','ct.png','ca'),(17,'bulgarian','Bulgarian','bg','bg.png','bg'),(18,'greek','Greek','gr','gr.png','el'),(19,'hungarian','Hungarian','hu','hu.png','hu'),(20,'polish','Polish','pl','pl.png','pl'),(21,'romanian','Romanian','ro','ro.png','ro'),(22,'ukrainian','Ukrainian','ua','ua.png','uk'),(23,'vietnamese','Vietnamese','vi','vi.png','vi'),(24,'estonian','Estonian','et','ee.png','et');
/*!40000 ALTER TABLE `teampass_languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teampass_ldap_groups_roles`
--

DROP TABLE IF EXISTS `teampass_ldap_groups_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teampass_ldap_groups_roles` (
  `increment_id` int(12) NOT NULL AUTO_INCREMENT,
  `role_id` int(12) NOT NULL,
  `ldap_group_id` varchar(500) NOT NULL,
  `ldap_group_label` varchar(255) NOT NULL,
  PRIMARY KEY (`increment_id`),
  KEY `ROLE` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teampass_ldap_groups_roles`
--

LOCK TABLES `teampass_ldap_groups_roles` WRITE;
/*!40000 ALTER TABLE `teampass_ldap_groups_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `teampass_ldap_groups_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teampass_log_items`
--

DROP TABLE IF EXISTS `teampass_log_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teampass_log_items` (
  `increment_id` int(12) NOT NULL AUTO_INCREMENT,
  `id_item` int(8) NOT NULL,
  `date` varchar(50) NOT NULL,
  `id_user` int(8) NOT NULL,
  `action` varchar(250) DEFAULT NULL,
  `raison` text DEFAULT NULL,
  `old_value` mediumtext DEFAULT NULL,
  `encryption_type` varchar(20) NOT NULL DEFAULT 'not_set',
  PRIMARY KEY (`increment_id`),
  KEY `log_items_item_action_user_idx` (`id_item`,`action`,`id_user`),
  KEY `teampass_log_items_id_item_IDX` (`id_item`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teampass_log_items`
--

LOCK TABLES `teampass_log_items` WRITE;
/*!40000 ALTER TABLE `teampass_log_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `teampass_log_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teampass_log_system`
--

DROP TABLE IF EXISTS `teampass_log_system`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teampass_log_system` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL,
  `date` varchar(30) NOT NULL,
  `label` text NOT NULL,
  `qui` varchar(255) NOT NULL,
  `field_1` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teampass_log_system`
--

LOCK TABLES `teampass_log_system` WRITE;
/*!40000 ALTER TABLE `teampass_log_system` DISABLE KEYS */;
INSERT INTO `teampass_log_system` VALUES (1,'user_connection','1749837075','connection','1','');
/*!40000 ALTER TABLE `teampass_log_system` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teampass_misc`
--

DROP TABLE IF EXISTS `teampass_misc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teampass_misc` (
  `increment_id` int(12) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL,
  `intitule` varchar(100) NOT NULL,
  `valeur` text NOT NULL,
  `created_at` varchar(255) DEFAULT NULL,
  `updated_at` varchar(255) DEFAULT NULL,
  `is_encrypted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`increment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=190 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teampass_misc`
--

LOCK TABLES `teampass_misc` WRITE;
/*!40000 ALTER TABLE `teampass_misc` DISABLE KEYS */;
INSERT INTO `teampass_misc` VALUES (1,'admin','max_latest_items','10','1749757115',NULL,0),(2,'admin','enable_favourites','1','1749757115',NULL,0),(3,'admin','show_last_items','1','1749757115',NULL,0),(4,'admin','enable_pf_feature','0','1749757115',NULL,0),(5,'admin','log_connections','1','1749757115',NULL,0),(6,'admin','log_accessed','1','1749757115',NULL,0),(7,'admin','time_format','H:i:s','1749757115',NULL,0),(8,'admin','date_format','d/m/Y','1749757115',NULL,0),(9,'admin','duplicate_folder','0','1749757115',NULL,0),(10,'admin','item_duplicate_in_same_folder','0','1749757115',NULL,0),(11,'admin','duplicate_item','0','1749757115',NULL,0),(12,'admin','number_of_used_pw','3','1749757115',NULL,0),(13,'admin','manager_edit','1','1749757115',NULL,0),(14,'admin','cpassman_dir','/var/www/html/','1749757115',NULL,0),(15,'admin','cpassman_url','https://10.1.1.158/','1749757115',NULL,0),(16,'admin','favicon','https://10.1.1.158//favicon.ico','1749757115',NULL,0),(17,'admin','path_to_upload_folder','/var/www/html//upload','1749757115',NULL,0),(18,'admin','path_to_files_folder','/var/www/html//files','1749757116',NULL,0),(19,'admin','url_to_files_folder','https://10.1.1.158//files','1749757116',NULL,0),(20,'admin','activate_expiration','0','1749757116',NULL,0),(21,'admin','pw_life_duration','0','1749757116',NULL,0),(22,'admin','maintenance_mode','1','1749757116',NULL,0),(23,'admin','enable_sts','0','1749757116',NULL,0),(24,'admin','encryptClientServer','1','1749757116',NULL,0),(25,'admin','teampass_version','3.1.4','1749757116',NULL,0),(26,'admin','ldap_mode','0','1749757116',NULL,0),(27,'admin','ldap_type','0','1749757116',NULL,0),(28,'admin','ldap_user_attribute','0','1749757116',NULL,0),(29,'admin','ldap_ssl','0','1749757116',NULL,0),(30,'admin','ldap_tls','0','1749757116',NULL,0),(31,'admin','ldap_port','389','1749757116',NULL,0),(32,'admin','richtext','0','1749757116',NULL,0),(33,'admin','allow_print','0','1749757116',NULL,0),(34,'admin','roles_allowed_to_print','0','1749757116',NULL,0),(35,'admin','show_description','1','1749757116',NULL,0),(36,'admin','anyone_can_modify','0','1749757116',NULL,0),(37,'admin','anyone_can_modify_bydefault','0','1749757116',NULL,0),(38,'admin','nb_bad_authentication','0','1749757116',NULL,0),(39,'admin','utf8_enabled','1','1749757116',NULL,0),(40,'admin','restricted_to','0','1749757116',NULL,0),(41,'admin','restricted_to_roles','0','1749757116',NULL,0),(42,'admin','enable_send_email_on_user_login','0','1749757116',NULL,0),(43,'admin','enable_user_can_create_folders','0','1749757116',NULL,0),(44,'admin','insert_manual_entry_item_history','0','1749757116',NULL,0),(45,'admin','enable_kb','0','1749757116',NULL,0),(46,'admin','enable_email_notification_on_item_shown','0','1749757116',NULL,0),(47,'admin','enable_email_notification_on_user_pw_change','0','1749757116',NULL,0),(48,'admin','custom_logo','','1749757116',NULL,0),(49,'admin','custom_login_text','','1749757116',NULL,0),(50,'admin','default_language','english','1749757116',NULL,0),(51,'admin','send_stats','0','1749757116',NULL,0),(52,'admin','send_statistics_items','stat_country;stat_users;stat_items;stat_items_shared;stat_folders;stat_folders_shared;stat_admins;stat_managers;stat_ro;stat_mysqlversion;stat_phpversion;stat_teampassversion;stat_languages;stat_kb;stat_suggestion;stat_customfields;stat_api;stat_2fa;stat_agses;stat_duo;stat_ldap;stat_syslog;stat_stricthttps;stat_fav;stat_pf;','1749757116',NULL,0),(53,'admin','send_stats_time','1747165115','1749757116',NULL,0),(54,'admin','get_tp_info','1','1749757116',NULL,0),(55,'admin','send_mail_on_user_login','0','1749757116',NULL,0),(56,'cron','sending_emails','0','1749757116',NULL,0),(57,'admin','nb_items_by_query','auto','1749757116',NULL,0),(58,'admin','enable_delete_after_consultation','0','1749757116',NULL,0),(59,'admin','enable_personal_saltkey_cookie','0','1749757116',NULL,0),(60,'admin','personal_saltkey_cookie_duration','31','1749757116',NULL,0),(61,'admin','email_smtp_server','','1749757116',NULL,0),(62,'admin','email_smtp_auth','','1749757116',NULL,0),(63,'admin','email_auth_username','','1749757116',NULL,1),(64,'admin','email_auth_pwd','','1749757116',NULL,1),(65,'admin','email_port','','1749757116',NULL,0),(66,'admin','email_security','','1749757116',NULL,0),(67,'admin','email_server_url','','1749757116',NULL,0),(68,'admin','email_from','','1749757116',NULL,0),(69,'admin','email_from_name','','1749757116',NULL,0),(70,'admin','pwd_maximum_length','40','1749757116',NULL,0),(71,'admin','google_authentication','0','1749757116',NULL,0),(72,'admin','delay_item_edition','0','1749757116',NULL,0),(73,'admin','allow_import','0','1749757116',NULL,0),(74,'admin','proxy_ip','','1749757116',NULL,0),(75,'admin','proxy_port','','1749757116',NULL,0),(76,'admin','upload_maxfilesize','10mb','1749757116',NULL,0),(77,'admin','upload_docext','doc,docx,dotx,xls,xlsx,xltx,rtf,csv,txt,pdf,ppt,pptx,pot,dotx,xltx','1749757116',NULL,0),(78,'admin','upload_imagesext','jpg,jpeg,gif,png','1749757116',NULL,0),(79,'admin','upload_pkgext','7z,rar,tar,zip','1749757116',NULL,0),(80,'admin','upload_otherext','sql,xml','1749757116',NULL,0),(81,'admin','upload_imageresize_options','1','1749757116',NULL,0),(82,'admin','upload_imageresize_width','800','1749757116',NULL,0),(83,'admin','upload_imageresize_height','600','1749757116',NULL,0),(84,'admin','upload_imageresize_quality','90','1749757116',NULL,0),(85,'admin','use_md5_password_as_salt','0','1749757116',NULL,0),(86,'admin','ga_website_name','TeamPass for ChangeMe','1749757116',NULL,0),(87,'admin','api','0','1749757116',NULL,0),(88,'admin','subfolder_rights_as_parent','0','1749757116',NULL,0),(89,'admin','show_only_accessible_folders','0','1749757116',NULL,0),(90,'admin','enable_suggestion','0','1749757116',NULL,0),(91,'admin','otv_expiration_period','7','1749757116',NULL,0),(92,'admin','default_session_expiration_time','60','1749757116',NULL,0),(93,'admin','duo','0','1749757116',NULL,0),(94,'admin','enable_server_password_change','0','1749757116',NULL,0),(95,'admin','bck_script_path','/var/www/html//backups','1749757116',NULL,0),(96,'admin','bck_script_filename','bck_teampass','1749757116',NULL,1),(97,'admin','syslog_enable','0','1749757116',NULL,0),(98,'admin','syslog_host','localhost','1749757116',NULL,0),(99,'admin','syslog_port','514','1749757116',NULL,0),(100,'admin','manager_move_item','0','1749757116',NULL,0),(101,'admin','create_item_without_password','0','1749757116',NULL,0),(102,'admin','otv_is_enabled','0','1749757116',NULL,0),(103,'admin','agses_authentication_enabled','0','1749757116',NULL,0),(104,'admin','item_extra_fields','0','1749757116',NULL,0),(105,'admin','saltkey_ante_2127','none','1749757116',NULL,0),(106,'admin','migration_to_2127','done','1749757116',NULL,0),(107,'admin','files_with_defuse','done','1749757116',NULL,0),(108,'admin','timezone','UTC','1749757116',NULL,0),(109,'admin','enable_attachment_encryption','1','1749757116',NULL,0),(110,'admin','personal_saltkey_security_level','50','1749757116',NULL,0),(111,'admin','ldap_new_user_is_administrated_by','0','1749757116',NULL,0),(112,'admin','disable_show_forgot_pwd_link','0','1749757116',NULL,0),(113,'admin','offline_key_level','0','1749757116',NULL,0),(114,'admin','enable_http_request_login','0','1749757116',NULL,0),(115,'admin','ldap_and_local_authentication','0','1749757116',NULL,0),(116,'admin','secure_display_image','1','1749757116',NULL,0),(117,'admin','upload_zero_byte_file','0','1749757116',NULL,0),(118,'admin','upload_all_extensions_file','0','1749757116',NULL,0),(119,'admin','bck_script_passkey','','1749757116',NULL,1),(120,'admin','admin_2fa_required','1','1749757116',NULL,0),(121,'admin','password_overview_delay','4','1749757116',NULL,0),(122,'admin','copy_to_clipboard_small_icons','1','1749757116',NULL,0),(123,'admin','duo_ikey','','1749757116',NULL,1),(124,'admin','duo_skey','','1749757116',NULL,1),(125,'admin','duo_host','','1749757116',NULL,1),(126,'admin','duo_failmode','secure','1749757116',NULL,0),(127,'admin','roles_allowed_to_print_select','','1749757116',NULL,0),(128,'admin','clipboard_life_duration','30','1749757116',NULL,0),(129,'admin','mfa_for_roles','','1749757116',NULL,0),(130,'admin','tree_counters','0','1749757116',NULL,0),(131,'admin','settings_offline_mode','0','1749757116',NULL,0),(132,'admin','settings_tree_counters','0','1749757116',NULL,0),(133,'admin','enable_massive_move_delete','0','1749757116',NULL,0),(134,'admin','email_debug_level','0','1749757116',NULL,0),(135,'admin','ga_reset_by_user','','1749757116',NULL,0),(136,'admin','onthefly-backup-key','','1749757116',NULL,0),(137,'admin','onthefly-restore-key','','1749757116',NULL,0),(138,'admin','ldap_user_dn_attribute','','1749757116',NULL,0),(139,'admin','ldap_dn_additional_user_dn','','1749757116',NULL,0),(140,'admin','ldap_user_object_filter','','1749757116',NULL,0),(141,'admin','ldap_bdn','','1749757116',NULL,1),(142,'admin','ldap_hosts','','1749757116',NULL,1),(143,'admin','ldap_password','','1749757116',NULL,1),(144,'admin','ldap_username','','1749757116',NULL,0),(145,'admin','api_token_duration','60','1749757116',NULL,0),(146,'timestamp','last_folder_change','','1749757116',NULL,0),(147,'admin','enable_tasks_manager','1','1749757116',NULL,0),(148,'admin','task_maximum_run_time','300','1749757116',NULL,0),(149,'admin','tasks_manager_refreshing_period','20','1749757116',NULL,0),(150,'admin','maximum_number_of_items_to_treat','100','1749757116',NULL,0),(151,'admin','number_users_build_cache_tree','10','1749757116',NULL,0),(152,'admin','ldap_tls_certifacte_check','LDAP_OPT_X_TLS_NEVER','1749757116',NULL,0),(153,'admin','enable_tasks_log','0','1749757116',NULL,0),(154,'admin','upgrade_timestamp','1749757115','1749757116',NULL,0),(155,'admin','enable_ad_users_with_ad_groups','0','1749757116',NULL,0),(156,'admin','enable_ad_user_auto_creation','0','1749757116',NULL,0),(157,'admin','ldap_guid_attibute','objectguid','1749757116',NULL,0),(158,'admin','sending_emails_job_frequency','2','1749757116',NULL,0),(159,'admin','user_keys_job_frequency','1','1749757116',NULL,0),(160,'admin','items_statistics_job_frequency','5','1749757116',NULL,0),(161,'admin','users_personal_folder_task','','1749757116',NULL,0),(162,'admin','clean_orphan_objects_task','','1749757116',NULL,0),(163,'admin','purge_temporary_files_task','','1749757116',NULL,0),(164,'admin','rebuild_config_file','','1749757116',NULL,0),(165,'admin','reload_cache_table_task','','1749757116',NULL,0),(166,'admin','maximum_session_expiration_time','60','1749757116',NULL,0),(167,'admin','items_ops_job_frequency','1','1749757116',NULL,0),(168,'admin','enable_refresh_task_last_execution','1','1749757116',NULL,0),(169,'admin','ldap_group_objectclasses_attibute','top,groupofuniquenames','1749757116',NULL,0),(170,'admin','pwd_default_length','14','1749757116',NULL,0),(171,'admin','tasks_log_retention_delay','30','1749757116',NULL,0),(172,'admin','oauth2_enabled','0','1749757116',NULL,0),(173,'admin','oauth2_client_id','','1749757116',NULL,1),(174,'admin','oauth2_client_secret','','1749757116',NULL,1),(175,'admin','oauth2_client_endpoint','','1749757116',NULL,0),(176,'admin','oauth2_client_urlResourceOwnerDetails','','1749757116',NULL,0),(177,'admin','oauth2_client_token','','1749757116',NULL,1),(178,'admin','oauth2_client_scopes','openid,profile,email,User.Read,Group.Read.All','1749757116',NULL,0),(179,'admin','oauth2_client_appname','Login with Azure','1749757116',NULL,0),(180,'admin','show_item_data','0','1749757116',NULL,0),(181,'admin','oauth2_tenant_id','','1749757116',NULL,1),(182,'admin','limited_search_default','0','1749757116',NULL,0),(183,'admin','highlight_selected','0','1749757116',NULL,0),(184,'admin','highlight_favorites','0','1749757116',NULL,0),(185,'admin','tasks_history_delay','604800','1749757116',NULL,0),(186,'admin','oauth_new_user_is_administrated_by','0','1749757116',NULL,0),(187,'admin','oauth_selfregistered_user_belongs_to_role','0','1749757116',NULL,0),(188,'admin','oauth_self_register_groups','','1749757116',NULL,0);
/*!40000 ALTER TABLE `teampass_misc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teampass_nested_tree`
--

DROP TABLE IF EXISTS `teampass_nested_tree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teampass_nested_tree` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `nleft` int(11) NOT NULL DEFAULT 0,
  `nright` int(11) NOT NULL DEFAULT 0,
  `nlevel` int(11) NOT NULL DEFAULT 0,
  `bloquer_creation` tinyint(1) NOT NULL DEFAULT 0,
  `bloquer_modification` tinyint(1) NOT NULL DEFAULT 0,
  `personal_folder` tinyint(1) NOT NULL DEFAULT 0,
  `renewal_period` int(5) NOT NULL DEFAULT 0,
  `fa_icon` varchar(100) NOT NULL DEFAULT 'fas fa-folder',
  `fa_icon_selected` varchar(100) NOT NULL DEFAULT 'fas fa-folder-open',
  `categories` longtext NOT NULL,
  `nb_items_in_folder` int(10) NOT NULL DEFAULT 0,
  `nb_subfolders` int(10) NOT NULL DEFAULT 0,
  `nb_items_in_subfolders` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `nested_tree_parent_id` (`parent_id`),
  KEY `nested_tree_nleft` (`nleft`),
  KEY `nested_tree_nright` (`nright`),
  KEY `nested_tree_nlevel` (`nlevel`),
  KEY `personal_folder_idx` (`personal_folder`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teampass_nested_tree`
--

LOCK TABLES `teampass_nested_tree` WRITE;
/*!40000 ALTER TABLE `teampass_nested_tree` DISABLE KEYS */;
/*!40000 ALTER TABLE `teampass_nested_tree` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teampass_notification`
--

DROP TABLE IF EXISTS `teampass_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teampass_notification` (
  `increment_id` int(12) NOT NULL,
  `item_id` int(12) NOT NULL,
  `user_id` int(12) NOT NULL,
  PRIMARY KEY (`increment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teampass_notification`
--

LOCK TABLES `teampass_notification` WRITE;
/*!40000 ALTER TABLE `teampass_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `teampass_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teampass_otv`
--

DROP TABLE IF EXISTS `teampass_otv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teampass_otv` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `timestamp` text NOT NULL,
  `code` varchar(100) NOT NULL,
  `item_id` int(12) NOT NULL,
  `originator` int(12) NOT NULL,
  `encrypted` text NOT NULL,
  `views` int(10) NOT NULL DEFAULT 0,
  `max_views` int(10) DEFAULT NULL,
  `time_limit` varchar(100) DEFAULT NULL,
  `shared_globaly` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teampass_otv`
--

LOCK TABLES `teampass_otv` WRITE;
/*!40000 ALTER TABLE `teampass_otv` DISABLE KEYS */;
/*!40000 ALTER TABLE `teampass_otv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teampass_restriction_to_roles`
--

DROP TABLE IF EXISTS `teampass_restriction_to_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teampass_restriction_to_roles` (
  `increment_id` int(12) NOT NULL AUTO_INCREMENT,
  `role_id` int(12) NOT NULL,
  `item_id` int(12) NOT NULL,
  PRIMARY KEY (`increment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teampass_restriction_to_roles`
--

LOCK TABLES `teampass_restriction_to_roles` WRITE;
/*!40000 ALTER TABLE `teampass_restriction_to_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `teampass_restriction_to_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teampass_rights`
--

DROP TABLE IF EXISTS `teampass_rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teampass_rights` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `tree_id` int(12) NOT NULL,
  `fonction_id` int(12) NOT NULL,
  `authorized` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teampass_rights`
--

LOCK TABLES `teampass_rights` WRITE;
/*!40000 ALTER TABLE `teampass_rights` DISABLE KEYS */;
/*!40000 ALTER TABLE `teampass_rights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teampass_roles_title`
--

DROP TABLE IF EXISTS `teampass_roles_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teampass_roles_title` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `allow_pw_change` tinyint(1) NOT NULL DEFAULT 0,
  `complexity` int(5) NOT NULL DEFAULT 0,
  `creator_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teampass_roles_title`
--

LOCK TABLES `teampass_roles_title` WRITE;
/*!40000 ALTER TABLE `teampass_roles_title` DISABLE KEYS */;
INSERT INTO `teampass_roles_title` VALUES (1,'Default',0,48,0);
/*!40000 ALTER TABLE `teampass_roles_title` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teampass_roles_values`
--

DROP TABLE IF EXISTS `teampass_roles_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teampass_roles_values` (
  `increment_id` int(12) NOT NULL AUTO_INCREMENT,
  `role_id` int(12) NOT NULL,
  `folder_id` int(12) NOT NULL,
  `type` varchar(5) NOT NULL DEFAULT 'R',
  PRIMARY KEY (`increment_id`),
  KEY `role_id_idx` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teampass_roles_values`
--

LOCK TABLES `teampass_roles_values` WRITE;
/*!40000 ALTER TABLE `teampass_roles_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `teampass_roles_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teampass_sharekeys_fields`
--

DROP TABLE IF EXISTS `teampass_sharekeys_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teampass_sharekeys_fields` (
  `increment_id` int(12) NOT NULL AUTO_INCREMENT,
  `object_id` int(12) NOT NULL,
  `user_id` int(12) NOT NULL,
  `share_key` text NOT NULL,
  PRIMARY KEY (`increment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teampass_sharekeys_fields`
--

LOCK TABLES `teampass_sharekeys_fields` WRITE;
/*!40000 ALTER TABLE `teampass_sharekeys_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `teampass_sharekeys_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teampass_sharekeys_files`
--

DROP TABLE IF EXISTS `teampass_sharekeys_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teampass_sharekeys_files` (
  `increment_id` int(12) NOT NULL AUTO_INCREMENT,
  `object_id` int(12) NOT NULL,
  `user_id` int(12) NOT NULL,
  `share_key` text NOT NULL,
  PRIMARY KEY (`increment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teampass_sharekeys_files`
--

LOCK TABLES `teampass_sharekeys_files` WRITE;
/*!40000 ALTER TABLE `teampass_sharekeys_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `teampass_sharekeys_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teampass_sharekeys_items`
--

DROP TABLE IF EXISTS `teampass_sharekeys_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teampass_sharekeys_items` (
  `increment_id` int(12) NOT NULL AUTO_INCREMENT,
  `object_id` int(12) NOT NULL,
  `user_id` int(12) NOT NULL,
  `share_key` text NOT NULL,
  PRIMARY KEY (`increment_id`),
  KEY `idx_object_user` (`object_id`,`user_id`),
  KEY `object_id_idx` (`object_id`),
  KEY `user_id_idx` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teampass_sharekeys_items`
--

LOCK TABLES `teampass_sharekeys_items` WRITE;
/*!40000 ALTER TABLE `teampass_sharekeys_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `teampass_sharekeys_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teampass_sharekeys_logs`
--

DROP TABLE IF EXISTS `teampass_sharekeys_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teampass_sharekeys_logs` (
  `increment_id` int(12) NOT NULL AUTO_INCREMENT,
  `object_id` int(12) NOT NULL,
  `user_id` int(12) NOT NULL,
  `share_key` text NOT NULL,
  PRIMARY KEY (`increment_id`),
  KEY `object_id_idx` (`object_id`),
  KEY `user_id_idx` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teampass_sharekeys_logs`
--

LOCK TABLES `teampass_sharekeys_logs` WRITE;
/*!40000 ALTER TABLE `teampass_sharekeys_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `teampass_sharekeys_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teampass_sharekeys_suggestions`
--

DROP TABLE IF EXISTS `teampass_sharekeys_suggestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teampass_sharekeys_suggestions` (
  `increment_id` int(12) NOT NULL AUTO_INCREMENT,
  `object_id` int(12) NOT NULL,
  `user_id` int(12) NOT NULL,
  `share_key` text NOT NULL,
  PRIMARY KEY (`increment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teampass_sharekeys_suggestions`
--

LOCK TABLES `teampass_sharekeys_suggestions` WRITE;
/*!40000 ALTER TABLE `teampass_sharekeys_suggestions` DISABLE KEYS */;
/*!40000 ALTER TABLE `teampass_sharekeys_suggestions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teampass_suggestion`
--

DROP TABLE IF EXISTS `teampass_suggestion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teampass_suggestion` (
  `id` tinyint(12) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) NOT NULL,
  `pw` text NOT NULL,
  `pw_iv` text NOT NULL,
  `pw_len` int(5) NOT NULL,
  `description` text NOT NULL,
  `author_id` int(12) NOT NULL,
  `folder_id` int(12) NOT NULL,
  `comment` text NOT NULL,
  `suggestion_type` varchar(10) NOT NULL DEFAULT 'new',
  `encryption_type` varchar(20) NOT NULL DEFAULT 'not_set',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teampass_suggestion`
--

LOCK TABLES `teampass_suggestion` WRITE;
/*!40000 ALTER TABLE `teampass_suggestion` DISABLE KEYS */;
/*!40000 ALTER TABLE `teampass_suggestion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teampass_tags`
--

DROP TABLE IF EXISTS `teampass_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teampass_tags` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `tag` varchar(30) NOT NULL,
  `item_id` int(12) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teampass_tags`
--

LOCK TABLES `teampass_tags` WRITE;
/*!40000 ALTER TABLE `teampass_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `teampass_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teampass_templates`
--

DROP TABLE IF EXISTS `teampass_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teampass_templates` (
  `increment_id` int(12) NOT NULL AUTO_INCREMENT,
  `item_id` int(12) NOT NULL,
  `category_id` int(12) NOT NULL,
  PRIMARY KEY (`increment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teampass_templates`
--

LOCK TABLES `teampass_templates` WRITE;
/*!40000 ALTER TABLE `teampass_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `teampass_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teampass_tokens`
--

DROP TABLE IF EXISTS `teampass_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teampass_tokens` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `user_id` int(12) NOT NULL,
  `token` varchar(255) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `creation_timestamp` varchar(50) NOT NULL,
  `end_timestamp` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teampass_tokens`
--

LOCK TABLES `teampass_tokens` WRITE;
/*!40000 ALTER TABLE `teampass_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `teampass_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teampass_users`
--

DROP TABLE IF EXISTS `teampass_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teampass_users` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `login` varchar(500) NOT NULL,
  `pw` varchar(400) NOT NULL,
  `groupes_visibles` varchar(1000) NOT NULL,
  `derniers` text DEFAULT NULL,
  `key_tempo` varchar(100) DEFAULT NULL,
  `last_pw_change` varchar(30) DEFAULT NULL,
  `last_pw` text DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT 0,
  `fonction_id` varchar(1000) DEFAULT NULL,
  `groupes_interdits` varchar(1000) DEFAULT NULL,
  `last_connexion` varchar(30) DEFAULT NULL,
  `gestionnaire` int(11) NOT NULL DEFAULT 0,
  `email` varchar(300) NOT NULL DEFAULT 'none',
  `favourites` varchar(1000) DEFAULT NULL,
  `latest_items` varchar(1000) DEFAULT NULL,
  `personal_folder` int(1) NOT NULL DEFAULT 0,
  `disabled` tinyint(1) NOT NULL DEFAULT 0,
  `can_create_root_folder` tinyint(1) NOT NULL DEFAULT 0,
  `read_only` tinyint(1) NOT NULL DEFAULT 0,
  `timestamp` varchar(30) NOT NULL DEFAULT '0',
  `user_language` varchar(50) NOT NULL DEFAULT '0',
  `name` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `session_end` varchar(30) DEFAULT NULL,
  `isAdministratedByRole` tinyint(5) NOT NULL DEFAULT 0,
  `psk` varchar(400) DEFAULT NULL,
  `ga` varchar(50) DEFAULT NULL,
  `ga_temporary_code` varchar(20) NOT NULL DEFAULT 'none',
  `avatar` varchar(1000) DEFAULT NULL,
  `avatar_thumb` varchar(1000) DEFAULT NULL,
  `upgrade_needed` tinyint(1) NOT NULL DEFAULT 0,
  `treeloadstrategy` varchar(30) NOT NULL DEFAULT 'full',
  `can_manage_all_users` tinyint(1) NOT NULL DEFAULT 0,
  `usertimezone` varchar(50) NOT NULL DEFAULT 'not_defined',
  `agses-usercardid` varchar(50) NOT NULL DEFAULT '0',
  `encrypted_psk` text DEFAULT NULL,
  `user_ip` varchar(400) NOT NULL DEFAULT 'none',
  `user_ip_lastdate` varchar(50) DEFAULT NULL,
  `yubico_user_key` varchar(100) NOT NULL DEFAULT 'none',
  `yubico_user_id` varchar(100) NOT NULL DEFAULT 'none',
  `public_key` text DEFAULT NULL,
  `private_key` text DEFAULT NULL,
  `special` varchar(250) NOT NULL DEFAULT 'none',
  `auth_type` varchar(200) NOT NULL DEFAULT 'local',
  `is_ready_for_usage` tinyint(1) NOT NULL DEFAULT 0,
  `otp_provided` tinyint(1) NOT NULL DEFAULT 0,
  `roles_from_ad_groups` varchar(1000) DEFAULT NULL,
  `ongoing_process_id` varchar(100) DEFAULT NULL,
  `mfa_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` varchar(30) DEFAULT NULL,
  `updated_at` varchar(30) DEFAULT NULL,
  `deleted_at` varchar(30) DEFAULT NULL,
  `keys_recovery_time` varchar(500) DEFAULT NULL,
  `aes_iv` text DEFAULT NULL,
  `split_view_mode` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=10000000 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teampass_users`
--

LOCK TABLES `teampass_users` WRITE;
/*!40000 ALTER TABLE `teampass_users` DISABLE KEYS */;
INSERT INTO `teampass_users` VALUES (1,'admin','$2y$13$h66Z1p/Az7skiHrvoUXQjeE1OteqwNfuHsNQMl4ofN03iZg4NMQbS','0',NULL,'8KH1T7dshVAkWTViJcx55rm3E4gykj','1749757122',NULL,1,'',NULL,'1749837076',0,'instalacaotemp@gmail.com',NULL,NULL,0,0,1,0,'1749837076','0','admin','teampass','1749840675',0,NULL,NULL,'none',NULL,NULL,0,'full',0,'not_defined','0','','192.168.1.11','1749837077','none','none','LS0tLS1CRUdJTiBQVUJMSUMgS0VZLS0tLS0NCk1JSUNJakFOQmdrcWhraUc5dzBCQVFFRkFBT0NBZzhBTUlJQ0NnS0NBZ0VBMVZWRWdHN3BoRmRKV3BSb1lqMSsNCnN0MDJycHZwa0wvRUd4U0F3alVxbnBIaitEUkZjSVJFNWp5QzVqZFVaY2RUbnEwT1FvN0hUVGVTQnJJdkJMajYNCmw5QjE3U1BnVTFZNldENlNZZDhPTVhZNzZTUFhSU0NCd3RScjVCbnQ3MEw0VkVOMWpXcUsrb0lJd1pIUU0yVkMNCjlBY1NzMDAwSURkMTNJdDZpdGl1Nk1aa1NPeDhpcUxwL3oxMytuOW90clBWYVQzMDVSK3ZISVN6TWgrWjlyV1INCm9Kb0h6N3lGOXFDdms5Q2l2ak5XZjJEbXpvVTdBcWVyYU13RVR0QmhsZ202NWpvMjYyaGpMTE8ySjBpS1dVYUoNCmtHdEo1Q21vd3poTTVOejBvR1liSUdGYlFIL2tCTWhiUkFNRFVxOFl2MnZNNEIzSEN0Q0ZMcG5obEVXbmlVU0MNCmJ2d1BtU0wzd1JHd3dKWld5aTY5bnhnT3QrMGtCd1V0Z1NrUHU3WVV0aFRqTytPWEJqZGNUVXhqVEpjWVc4WUINCnYwdDhSTDBGVnVCVFMyNmNyaW80b2JCVURjbDFUdHhUQTAvT1gzY2RVZlF4Q2hoOXZ0bG9HNHdjaWMvemU2ZHcNClBMMjkwVU8vZEYxdEcwUDVlNFFnbGRZNGtYY21ZYzRKMTdxNVpWTldDLytOL1BWdG50cHRjUHhzRVByVHFQRmgNCnQvSFlFZm40cWJPMjJXN0NhK1gvbDlCMEk5MSt2QXFlTG95TWlkcVd0WlY5SVJMb1ZhQmE4cGpzQkNEM2dZemsNCmVSN3hvZUYvZmxLdzV4ZnBNejBrSStaSWtSOWl3dENwbFNGV2NkYTY4U0swRitHSFBYWmxDdjh5b0pUck45NnkNCktnQzdBOXAxK3RWemN1SitMQi9YT3FFQ0F3RUFBUT09DQotLS0tLUVORCBQVUJMSUMgS0VZLS0tLS0=','8aB8nwwZ/U1gJWbV86LQwqWXD5UURSEnJZanC+NL3m+dscWZMdnpqQoE/tN2sycif/0OWfPjJjEszGgq0jmSWGo0M/XVYaw/GZeWQxt6+Gpc9R/ipm//erBpibDJc/0fr43Zyet4dm/anrUF/3xUiK1KyalYqN+bm4iDPZwB3Ck8rO2/YI9f6Jr1Hgo9k7G16hEvTjofncfEQfAxUHgHgkq/HQt8hEruTsrqdn8fmg7A/4awU0o0uTEP5tJ7V+fz4wD9Cc0BidRhrBIkabLbe86GWlWaoN/DAViYbfLR4jYpF1eeF5ylJRzXFpsujbR9yCp0TNw4P6udBMP6YGsl1zq0uojN3kFgA9LJ+TqhWqFseVZ4rH7hr7gbcQxsuG6Nso85/YOoPFmfaIovBuw85oPRftFkjKf668fxWy3Nk/wI251OqCpspwl6dw7z8nlfVAVCFngCVcK8tZwZdVSwRkD9S72cFaKopnf4N+IbDM1MYjMS4YdHknm5j33GZN+kuhnq07TntsPWI1/sv46MHaa1sWSw5hSqAaSz6MNr6/ru1jwuWe74Qdm0f+aGdl3a21IWqOnPRTPrl6BctZiXDeQ/YMqYPHpxNLqVr8DozaGFoM+QxhMSmG0aJZTUU5+55dsl96DJVfhLILOoduYySsheXMnaEor5BiF/rrL0myubk3ITywJGhUg/eliF9ECsLS7Ns6FpkEpPuDk/KfzThxS3r0sEc+k7F0WZgfo9KVt2qdmbs6sp0tZ8DEWsT+qRPP72QbpWYEBU0tFpIr1Yg78haZThlnNW0SE4jx9oz3pNS1hVxecsPFrA+nbEp9CTma4x5MVV2lFX7uTM2bP4k9Z9JCIqv4a4sgLXqctVg/42JTXbptmviGE98xvsY9Nnor9XoOG29s0NBxkW0tqtpH7QTQwsPj0RgD61AgZQZBI6XF2kpRqdk8Gov+1e+NxfUu7w2XdbPvcdFLdl5J5QKuFZbAiFnxFGQopaq82/F9gJP3bRmBcD4YhkEl4IXWLJfozHrdANYYjLb4Vjp7F1r5laRQlmf+5gRgkiB1iH4BZqbknXpr/WJ+vEME6hOp9P7UsZjMPcK9ETLk/ZLxsgB8K+hiDxEi+R0U9s8v3HTS0d6aeQ6G6PxhF9TRDuKYeHz2FkjebFuNvHhK6sO0PJ/paWNGYLuIeXpNWznAZI3bEjUs4p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','none','local',1,1,NULL,NULL,1,'1749757122',NULL,NULL,NULL,NULL,0),(9999991,'OTV','','','','','','',1,'','','',0,'','','',0,0,0,0,'0','0',NULL,NULL,NULL,0,NULL,NULL,'none',NULL,NULL,0,'full',0,'not_defined','0',NULL,'none',NULL,'none','none',NULL,NULL,'none','local',1,0,NULL,NULL,1,'1749757122',NULL,NULL,NULL,NULL,0),(9999997,'TP','def50200037b4d06662e8c9cce5deeb689e2506df7a95b9ce78a7511f5e14544a51d36a882577cca38232c20e19fda9472f96aeab3cb54f6f41c602eed1292d8c0bbbf75480d8f29566da036113a34f5bb33f565a434879968ffc08561a94878eb8ee7777f9d3e46c8b8913198','','','','','',1,'','','',0,'','','',0,0,0,0,'0','0',NULL,NULL,NULL,0,NULL,NULL,'none',NULL,NULL,0,'full',0,'not_defined','0',NULL,'none',NULL,'none','none','LS0tLS1CRUdJTiBQVUJMSUMgS0VZLS0tLS0NCk1JSUNJakFOQmdrcWhraUc5dzBCQVFFRkFBT0NBZzhBTUlJQ0NnS0NBZ0VBbzFVVkhaYkprT050NTNPc0ZFSUQNCnJpYk1DdW1jTCs2Ym1uSjl5bFIrVzZKdkEvNmp2enkwMzNKMGFNZjBFWTJBQlFBT3hGNG56TG9vdUxueEdSdksNCnNFYzVITmFLaHVCZFNKN2dyVHhBRnNya08zeG56YjJ1V1RkTWo1K0kwZUM1TFB3L1hNNmFhbzhzMW1XWWM4MTYNClFiYUJ3VStWK21JTTI3amZZT3BDbWtTSWhLaGVEdm5xUE9pc1Nud0t2UkkwTU1sUWEyRUdKbjlIVE0yM0FHYmsNCi9sNWhQODhVQWRHbG9ta3pLSDArclhRdDNGYlQzd1VBZzEvcnE4QWFuczkwNXIxdmFEaTZJTzFTSmRRWk9zZlQNCkxrQnY3b0lyWXBkdUt0WFlRQ1NZeFFuYTUvK0xlbXZMSTZLMGlaWU00YmhQRjhzeForZkJVaGxsVGViWlNoYVgNClJOTzhtTkxPMnFtUHpMTExHNWlSazlFTXE4Vjc4UEJVbmJqenB0RFVWQXc1cU9TRjVXc3AyVytyVWV3SzArelMNCmxkd1M0M1k1L1RiVmh3MGF6WjRvck9UODhYaGxTRzBGdEpQWXltU2IwUUVTMm45TC8xQmszZDZUeitveHVUQUINCmY2RVlOU2prbXVnRGhzOVE1dHgvVGJBcWpDMEJhTm03dW53dUYzK1ZjM054YVpFVWl4QlludGRhSHpLdmEwR1INCkhUTGpXL0R5cEcxdHkzdUIrWFltWTE3UGhZdkhnVzlNa1RuMzdGY0dDa2dkTlpZZ3FCRDdISkdxdVNUVlo2aXQNClVyN3JXTGtrNjBxdEpmMkd4a3ljYlk2SnhpN3RkbHlkU1N0cXpBMFNYOEJoWUoybkVBelZUbHhjNTlQTG1lQkkNCk5BeW9YWk9nS29uTXFYMndyVENZUzY4Q0F3RUFBUT09DQotLS0tLUVORCBQVUJMSUMgS0VZLS0tLS0=','LAQtDsKlXXKJ/SFsnnPRuT5Iguut224RPCZBKeMLlFJCIMLjJDL10HIl/8C0fzr0M6ZPJJtP/OnaqaVHlpyIUrArysCBkAvBf1OvEqPXzGBP0z5zERJltzN0vEyq5RnLMnwWkvfCxaHav96OZMwUGPIkFGjiS1eO2hErrNgQKzw0gEbPNkwvNibnriwBNyvmnySUSC3HipSALAH+bcbvjeXtJ6Wnu7JMTum6re5WPj8zZZ1dPoJjLegg7rin83zq6hqUgqvd3h2sFLvEI9o6ItypUZnSrON/DMLZ+0BmC1tadlaL4Yo9nNyXhsmgNkdEdVOOMzkMiKQQVuWO5NnXvzT5Fi8miTC4wQ9g2JblG4OTlUkFMWgazwSSL9POnjehrgU1qmu3PTAMFPobUrgZtyD45vmLFIHAwaoZqojByBMyCytHH9GPjTHcwsPRYIWqaP3ZGTsCvEH/VbLokZ8wupUU34bVE2liFI9kjjhS8+3JsqjMBIRkggFM7ghDBDe5lIMGeJpGIUo8umnPyOc1n0hZdk4hCB67PQJJBf4VZe9yootSyAJ5EuNaXkozIgq77+ewiCEg+coSu572CrUG4Ii3bhdlZq7JvFPqflYB08UulBDLRfOzkt1ssFRKXAM55HzVBecRRSKKbGW60Wix491FTbr4XwpxEKRWv4W1rcCQInbg2YTSEib69srXjVgxT7bmUZ0BsoS9TqIFU1rcUpFopc5VklQ/jwc54wALivCM9eMZcFj++oMOFaQsz5dh16gES3Jacktv9Z9/oaDn3KxJVnweXxuAOS1oaMqnQ/BWxvee+aMMq6IrDMq51Yv3EvNzDIdzgzb6veF+saSbrNdHota3+GoS3p3UsA3j4LnqGkRP9n0ZtRdWHTxXWzaZUrrCE97sVr7l7ZHqaJMp9dcLhaTpGtp1gwSIhKYFVVJZly19kENZRSCqHRka8VBQnAIllxzOP/cgAC5ZM1eLFogIFArl2icfw3U1PvoxV8WXEt3xwH6GXkXb/uPnWAufULOixiw3NW3hcbL/6peDFQeLAZ49MgReybMowvoZJ8xDHixHrGL/IrBJyS/ypndirJrsZ8WLOwJtjD17Rd+fJc/i0dul8NWzoopG931m+GR+LvQIjBZuFKCF35E0OHLaqzKcwvTfb92GYVAVNNzPNm3IGzaBJqbiqkbNZLOKyCm3ze2B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','none','local',1,0,NULL,NULL,1,'1749757139',NULL,NULL,NULL,NULL,0),(9999999,'API','','','','','','',1,'','','',0,'','','',0,0,0,0,'0','0',NULL,NULL,NULL,0,NULL,NULL,'none',NULL,NULL,0,'full',0,'not_defined','0',NULL,'none',NULL,'none','none',NULL,NULL,'none','local',1,0,NULL,NULL,1,'1749757122',NULL,NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `teampass_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-13 17:57:25
