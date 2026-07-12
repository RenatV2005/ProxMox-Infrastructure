/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-12.3.2-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: bootstackdb
-- ------------------------------------------------------
-- Server version	12.3.2-MariaDB-ubu2404

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `activities`
--

DROP TABLE IF EXISTS `activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `activities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) NOT NULL,
  `detail` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `ip` varchar(45) NOT NULL,
  `loggable_id` bigint(20) unsigned DEFAULT NULL,
  `loggable_type` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activities_user_id_index` (`user_id`),
  KEY `activities_entity_id_index` (`loggable_id`),
  KEY `activities_key_index` (`type`),
  KEY `activities_created_at_index` (`created_at`),
  KEY `activities_ip_index` (`ip`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activities`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `activities` WRITE;
/*!40000 ALTER TABLE `activities` DISABLE KEYS */;
INSERT INTO `activities` VALUES
(1,'auth_login','standard; (1) Admin',1,'192.168.0.6',NULL,NULL,'2026-07-03 19:33:51','2026-07-03 19:33:51'),
(2,'user_update','(1) Admin',1,'192.168.0.6',NULL,NULL,'2026-07-03 19:36:33','2026-07-03 19:36:33'),
(3,'auth_login','standard; (1) Admin',1,'192.168.0.6',NULL,NULL,'2026-07-04 19:42:45','2026-07-04 19:42:45'),
(4,'book_create','(1) Monitoring-Stack',1,'192.168.0.6',1,'book','2026-07-06 16:00:27','2026-07-06 16:00:27'),
(5,'book_update','(1) Monitoring-Stack',1,'192.168.0.6',1,'book','2026-07-06 16:01:05','2026-07-06 16:01:05'),
(6,'book_update','(1) Monitoring-Stack',1,'192.168.0.6',1,'book','2026-07-06 16:02:11','2026-07-06 16:02:11'),
(7,'page_create','(2) New Page',1,'192.168.0.6',2,'page','2026-07-06 16:02:33','2026-07-06 16:02:33'),
(8,'page_update','(2) compose.yaml',1,'192.168.0.6',2,'page','2026-07-06 16:02:49','2026-07-06 16:02:49'),
(9,'book_create','(3) Local Git | Gitea-Stack',1,'192.168.0.6',3,'book','2026-07-06 16:05:24','2026-07-06 16:05:24'),
(10,'page_create','(4) compose.yaml',1,'192.168.0.6',4,'page','2026-07-06 16:05:41','2026-07-06 16:05:41'),
(11,'book_create','(5) Nginx-Stack',1,'192.168.0.6',5,'book','2026-07-06 16:10:55','2026-07-06 16:10:55'),
(12,'page_create','(6) compose.yaml',1,'192.168.0.6',6,'page','2026-07-06 16:11:16','2026-07-06 16:11:16'),
(13,'book_create','(7) Docker Back Up',1,'192.168.0.6',7,'book','2026-07-06 16:15:10','2026-07-06 16:15:10');
/*!40000 ALTER TABLE `activities` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `api_tokens`
--

DROP TABLE IF EXISTS `api_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_tokens` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `token_id` varchar(191) NOT NULL,
  `secret` varchar(191) NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `expires_at` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `api_tokens_token_id_unique` (`token_id`),
  KEY `api_tokens_user_id_index` (`user_id`),
  KEY `api_tokens_expires_at_index` (`expires_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_tokens`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `api_tokens` WRITE;
/*!40000 ALTER TABLE `api_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_tokens` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `attachments`
--

DROP TABLE IF EXISTS `attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `attachments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `path` text NOT NULL,
  `extension` varchar(20) NOT NULL,
  `uploaded_to` bigint(20) unsigned NOT NULL,
  `external` tinyint(1) NOT NULL,
  `order` int(11) NOT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attachments_uploaded_to_index` (`uploaded_to`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachments`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `attachments` WRITE;
/*!40000 ALTER TABLE `attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `attachments` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `bookshelves_books`
--

DROP TABLE IF EXISTS `bookshelves_books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookshelves_books` (
  `bookshelf_id` bigint(20) unsigned NOT NULL,
  `book_id` bigint(20) unsigned NOT NULL,
  `order` int(10) unsigned NOT NULL,
  PRIMARY KEY (`bookshelf_id`,`book_id`),
  KEY `bookshelves_books_book_id_foreign` (`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookshelves_books`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `bookshelves_books` WRITE;
/*!40000 ALTER TABLE `bookshelves_books` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookshelves_books` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(191) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL,
  UNIQUE KEY `cache_key_unique` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `commentable_id` bigint(20) unsigned NOT NULL,
  `commentable_type` varchar(191) NOT NULL,
  `html` longtext DEFAULT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `local_id` int(10) unsigned DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `content_ref` varchar(191) NOT NULL,
  `archived` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_entity_id_entity_type_index` (`commentable_id`,`commentable_type`),
  KEY `comments_local_id_index` (`local_id`),
  KEY `comments_archived_index` (`archived`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `deletions`
--

DROP TABLE IF EXISTS `deletions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `deletions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `deleted_by` int(10) unsigned DEFAULT NULL,
  `deletable_type` varchar(100) NOT NULL,
  `deletable_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `deletions_deleted_by_index` (`deleted_by`),
  KEY `deletions_deletable_type_index` (`deletable_type`),
  KEY `deletions_deletable_id_index` (`deletable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deletions`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `deletions` WRITE;
/*!40000 ALTER TABLE `deletions` DISABLE KEYS */;
/*!40000 ALTER TABLE `deletions` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `email_confirmations`
--

DROP TABLE IF EXISTS `email_confirmations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_confirmations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `email_confirmations_user_id_index` (`user_id`),
  KEY `email_confirmations_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_confirmations`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `email_confirmations` WRITE;
/*!40000 ALTER TABLE `email_confirmations` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_confirmations` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `entities`
--

DROP TABLE IF EXISTS `entities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `entities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(10) NOT NULL,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `book_id` bigint(20) unsigned DEFAULT NULL,
  `chapter_id` bigint(20) unsigned DEFAULT NULL,
  `priority` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `owned_by` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`,`type`),
  KEY `entities_type_index` (`type`),
  KEY `entities_slug_index` (`slug`),
  KEY `entities_book_id_index` (`book_id`),
  KEY `entities_chapter_id_index` (`chapter_id`),
  KEY `entities_updated_at_index` (`updated_at`),
  KEY `entities_deleted_at_index` (`deleted_at`),
  KEY `entities_owned_by_index` (`owned_by`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entities`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `entities` WRITE;
/*!40000 ALTER TABLE `entities` DISABLE KEYS */;
INSERT INTO `entities` VALUES
(1,'book','Monitoring-Stack','monitoring-stack',NULL,NULL,NULL,'2026-07-06 16:00:27','2026-07-06 16:02:10',NULL,1,1,1),
(2,'page','compose.yaml','composeyaml',1,NULL,2,'2026-07-06 16:00:46','2026-07-06 16:02:49',NULL,1,1,1),
(3,'book','Local Git | Gitea-Stack','local-git-gitea-stack',NULL,NULL,NULL,'2026-07-06 16:05:23','2026-07-06 16:05:24',NULL,1,1,1),
(4,'page','compose.yaml','composeyaml',3,NULL,2,'2026-07-06 16:05:28','2026-07-06 16:05:41',NULL,1,1,1),
(5,'book','Nginx-Stack','nginx-stack',NULL,NULL,NULL,'2026-07-06 16:10:55','2026-07-06 16:10:55',NULL,1,1,1),
(6,'page','compose.yaml','composeyaml',5,NULL,2,'2026-07-06 16:11:00','2026-07-06 16:11:16',NULL,1,1,1),
(7,'book','Docker Back Up','docker-back-up',NULL,NULL,NULL,'2026-07-06 16:15:10','2026-07-06 16:15:10',NULL,1,1,1);
/*!40000 ALTER TABLE `entities` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `entity_container_data`
--

DROP TABLE IF EXISTS `entity_container_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `entity_container_data` (
  `entity_id` bigint(20) unsigned NOT NULL,
  `entity_type` varchar(10) NOT NULL,
  `description` text NOT NULL,
  `description_html` text NOT NULL,
  `default_template_id` bigint(20) unsigned DEFAULT NULL,
  `image_id` int(10) unsigned DEFAULT NULL,
  `sort_rule_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`entity_id`,`entity_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_container_data`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `entity_container_data` WRITE;
/*!40000 ALTER TABLE `entity_container_data` DISABLE KEYS */;
INSERT INTO `entity_container_data` VALUES
(1,'book','Dies ist mein Monitoring Stack, weches aus Grafana, Prometheus, Node-Exporter und cAdvisor besteht.','<p>Dies ist mein Monitoring Stack, weches aus Grafana, Prometheus, Node-Exporter und cAdvisor besteht.</p>',NULL,1,NULL),
(3,'book','Mein Local Git Gitea-Stack besteht aus Gitea und PostgreSQL','<p>Mein Local Git Gitea-Stack besteht aus Gitea und PostgreSQL</p>',NULL,2,NULL),
(5,'book','Bei meinen Nginx Stack, läuft nur ein Nginx Container, dieser kann auch durch http://nginx-web.renatubuntu dank dem Reverse-Proxy erreicht werden ','<p>Bei meinen Nginx Stack, läuft nur ein Nginx Container, dieser kann auch durch <a href=\"http://nginx-web.renatubuntu\">http://nginx-web.renatubuntu</a> dank dem Reverse-Proxy erreicht werden </p>',NULL,3,NULL),
(7,'book','Hallo Zukunfts-Renat.\r\nWenn du das lesen kannst, funktioniert dein Backup.','<p>Hallo Zukunfts-Renat.</p><p>Wenn du das lesen kannst, funktioniert dein Backup.</p>',NULL,NULL,NULL);
/*!40000 ALTER TABLE `entity_container_data` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `entity_page_data`
--

DROP TABLE IF EXISTS `entity_page_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `entity_page_data` (
  `page_id` bigint(20) unsigned NOT NULL,
  `draft` tinyint(1) NOT NULL,
  `template` tinyint(1) NOT NULL,
  `revision_count` int(10) unsigned NOT NULL,
  `editor` varchar(50) NOT NULL,
  `html` longtext NOT NULL,
  `text` longtext NOT NULL,
  `markdown` longtext NOT NULL,
  PRIMARY KEY (`page_id`),
  KEY `entity_page_data_draft_index` (`draft`),
  KEY `entity_page_data_template_index` (`template`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_page_data`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `entity_page_data` WRITE;
/*!40000 ALTER TABLE `entity_page_data` DISABLE KEYS */;
INSERT INTO `entity_page_data` VALUES
(2,0,0,2,'wysiwyg','<p id=\"bkmrk-services%3A%C2%A0%C2%A0-grafana-\">services:&nbsp;<br>&nbsp; grafana-web:<br>&nbsp; &nbsp; image: grafana/grafana<br>&nbsp; &nbsp; networks:<br>&nbsp; &nbsp; &nbsp;- homelab-net<br>&nbsp; &nbsp; &nbsp;- reverse-proxy-net<br>&nbsp; &nbsp; ports:<br>&nbsp; &nbsp; &nbsp;- 3000:3000<br>&nbsp; &nbsp; volumes:<br>&nbsp; &nbsp; &nbsp;- /home/renatubuntu/documentation/grafanafiles:/var/lib/grafana<br>&nbsp; &nbsp; restart: unless-stopped</p>\r\n<p id=\"bkmrk-%C2%A0-prometheus-data%3A%C2%A0-\">&nbsp; prometheus-data:<br>&nbsp; &nbsp; image: prom/prometheus<br>&nbsp; &nbsp; networks:<br>&nbsp; &nbsp; &nbsp;- homelab-net<br>&nbsp; &nbsp; ports:<br>&nbsp; &nbsp; &nbsp;- 9090:9090<br>&nbsp; &nbsp; volumes:<br>&nbsp; &nbsp; &nbsp;- /home/renatubuntu/documentation/prometheus-data:/prometheus<br>&nbsp; &nbsp; &nbsp;- /home/renatubuntu/documentation/prometheus-config/prometheus.yml:/etc/prometheus/prometheus.yml<br>&nbsp; &nbsp; restart: unless-stopped</p>\r\n<p id=\"bkmrk-%C2%A0-node-exporter%3A%C2%A0-%C2%A0-\">&nbsp; node-exporter:<br>&nbsp; &nbsp; image: prom/node-exporter</p>\r\n<p id=\"bkmrk-%C2%A0-%C2%A0-command%3A%C2%A0-%C2%A0-%C2%A0---\">&nbsp; &nbsp; command:<br>&nbsp; &nbsp; &nbsp; - \'--path.procfs=/host/proc\'<br>&nbsp; &nbsp; &nbsp; - \'--path.sysfs=/host/sys\'<br>&nbsp; &nbsp; &nbsp; - \'--path.rootfs=/rootfs\'</p>\r\n<p id=\"bkmrk-%C2%A0-%C2%A0-volumes%3A%C2%A0-%C2%A0-%C2%A0---\">&nbsp; &nbsp; volumes:<br>&nbsp; &nbsp; &nbsp; - /proc:/host/proc:ro<br>&nbsp; &nbsp; &nbsp; - /sys:/host/sys:ro<br>&nbsp; &nbsp; &nbsp; - /:/rootfs:ro</p>\r\n<p id=\"bkmrk-%C2%A0-%C2%A0-networks%3A%C2%A0-%C2%A0-%C2%A0--\">&nbsp; &nbsp; networks:<br>&nbsp; &nbsp; &nbsp; - homelab-net</p>\r\n<p id=\"bkmrk-%C2%A0-%C2%A0-ports%3A%C2%A0-%C2%A0-%C2%A0---91\">&nbsp; &nbsp; ports:<br>&nbsp; &nbsp; &nbsp; - 9100:9100</p>\r\n<p id=\"bkmrk-%C2%A0-%C2%A0-restart%3A-unless-\">&nbsp; &nbsp; restart: unless-stopped</p>\r\n<p id=\"bkmrk-%C2%A0-cadvisor%3A%C2%A0-%C2%A0-image\">&nbsp; cadvisor:<br>&nbsp; &nbsp; image: gcr.io/cadvisor/cadvisor</p>\r\n<p id=\"bkmrk-%C2%A0-%C2%A0-privileged%3A-true\">&nbsp; &nbsp; privileged: true</p>\r\n<p id=\"bkmrk-%C2%A0-%C2%A0-devices%3A%C2%A0-%C2%A0-%C2%A0---\">&nbsp; &nbsp; devices:<br>&nbsp; &nbsp; &nbsp; - /dev/kmsg</p>\r\n<p id=\"bkmrk-%C2%A0-%C2%A0-volumes%3A%C2%A0-%C2%A0-%C2%A0----1\">&nbsp; &nbsp; volumes:<br>&nbsp; &nbsp; &nbsp; - /:/rootfs:ro<br>&nbsp; &nbsp; &nbsp; - /var/run:/var/run:ro<br>&nbsp; &nbsp; &nbsp; - /sys:/sys:ro<br>&nbsp; &nbsp; &nbsp; - /var/lib/docker:/var/lib/docker:ro<br>&nbsp; &nbsp; &nbsp; - /dev/disk:/dev/disk:ro</p>\r\n<p id=\"bkmrk-%C2%A0-%C2%A0-ports%3A%C2%A0-%C2%A0-%C2%A0---%228\">&nbsp; &nbsp; ports:<br>&nbsp; &nbsp; &nbsp; - \"8080:8080\"</p>\r\n<p id=\"bkmrk-%C2%A0-%C2%A0-restart%3A-unless--1\">&nbsp; &nbsp; restart: unless-stopped</p>\r\n<p id=\"bkmrk-%C2%A0-%C2%A0-networks%3A%C2%A0-%C2%A0-%C2%A0---1\">&nbsp; &nbsp; networks:<br>&nbsp; &nbsp; &nbsp; - homelab-net<br>&nbsp; &nbsp; &nbsp; - reverse-proxy-net<br>&nbsp; &nbsp;<br>networks:<br>&nbsp; homelab-net:<br>&nbsp; reverse-proxy-net:<br>&nbsp; &nbsp; external: true</p>','services: \n  grafana-web:\n    image: grafana/grafana\n    networks:\n     - homelab-net\n     - reverse-proxy-net\n    ports:\n     - 3000:3000\n    volumes:\n     - /home/renatubuntu/documentation/grafanafiles:/var/lib/grafana\n    restart: unless-stopped\n  prometheus-data:\n    image: prom/prometheus\n    networks:\n     - homelab-net\n    ports:\n     - 9090:9090\n    volumes:\n     - /home/renatubuntu/documentation/prometheus-data:/prometheus\n     - /home/renatubuntu/documentation/prometheus-config/prometheus.yml:/etc/prometheus/prometheus.yml\n    restart: unless-stopped\n  node-exporter:\n    image: prom/node-exporter\n    command:\n      - \'--path.procfs=/host/proc\'\n      - \'--path.sysfs=/host/sys\'\n      - \'--path.rootfs=/rootfs\'\n    volumes:\n      - /proc:/host/proc:ro\n      - /sys:/host/sys:ro\n      - /:/rootfs:ro\n    networks:\n      - homelab-net\n    ports:\n      - 9100:9100\n    restart: unless-stopped\n  cadvisor:\n    image: gcr.io/cadvisor/cadvisor\n    privileged: true\n    devices:\n      - /dev/kmsg\n    volumes:\n      - /:/rootfs:ro\n      - /var/run:/var/run:ro\n      - /sys:/sys:ro\n      - /var/lib/docker:/var/lib/docker:ro\n      - /dev/disk:/dev/disk:ro\n    ports:\n      - \"8080:8080\"\n    restart: unless-stopped\n    networks:\n      - homelab-net\n      - reverse-proxy-net\n   \nnetworks:\n  homelab-net:\n  reverse-proxy-net:\n    external: true',''),
(4,0,0,1,'wysiwyg','<p id=\"bkmrk-services%3A%C2%A0-mariadb-d\">services:<br>&nbsp; mariadb-datenbank:<br>&nbsp; &nbsp; image: mariadb<br>&nbsp; &nbsp; environment:<br>&nbsp; &nbsp; &nbsp;- &nbsp;MARIADB_ROOT_PASSWORD=${MARIADB_ROOT_PASSWORD}<br>&nbsp; &nbsp; &nbsp;- &nbsp;MARIADB_DATABASE=${MARIADB_DATABASE}<br>&nbsp; &nbsp; &nbsp;- &nbsp;MARIADB_USER=${MARIADB_USER}<br>&nbsp; &nbsp; &nbsp;- &nbsp;MARIADB_PASSWORD=${MARIADB_PASSWORD}<br>&nbsp; &nbsp; ports:<br>&nbsp; &nbsp; &nbsp;- \"3306:3306\"<br>&nbsp; &nbsp; volumes:<br>&nbsp; &nbsp; &nbsp;- /home/renatubuntu/documentation/docker-compose2/bookstack-mariadb:/var/lib/mysql<br>&nbsp; &nbsp; restart: unless-stopped<br>&nbsp; &nbsp; networks:<br>&nbsp; &nbsp; &nbsp;- homelab-net</p>\r\n<p id=\"bkmrk-%C2%A0-bookstack-app%3A%C2%A0-%C2%A0i\">&nbsp; bookstack-app:<br>&nbsp; &nbsp;image: linuxserver/bookstack<br>&nbsp; &nbsp;environment:&nbsp;<br>&nbsp; &nbsp; - &nbsp;APP_URL=${APP_URL}<br>&nbsp; &nbsp; - &nbsp;APP_KEY=${APP_KEY}<br>&nbsp; &nbsp; - DB_HOST=${DB_HOST}<br>&nbsp; &nbsp; - DB_DATABASE=${DB_DATABASE}<br>&nbsp; &nbsp; - DB_USER=${DB_USER}<br>&nbsp; &nbsp; - DB_PASS=${DB_PASS}<br>&nbsp; &nbsp; - DB_PORT=${DB_PORT}<br>&nbsp; &nbsp;ports:<br>&nbsp; &nbsp; - \"6875:80\"<br>&nbsp; &nbsp;volumes:<br>&nbsp; &nbsp; - /home/renatubuntu/documentation/docker-compose2/bookstack-app:/config<br>&nbsp; &nbsp;restart: unless-stopped<br>&nbsp; &nbsp;networks:<br>&nbsp; &nbsp; - homelab-net<br>&nbsp; &nbsp; - reverse-proxy-net</p>\r\n<p id=\"bkmrk-networks%3A%C2%A0-homelab-n\">networks:<br>&nbsp; homelab-net:<br>&nbsp; reverse-proxy-net:<br>&nbsp; &nbsp; external: true &nbsp;&nbsp;</p>','services:\n  mariadb-datenbank:\n    image: mariadb\n    environment:\n     -  MARIADB_ROOT_PASSWORD=${MARIADB_ROOT_PASSWORD}\n     -  MARIADB_DATABASE=${MARIADB_DATABASE}\n     -  MARIADB_USER=${MARIADB_USER}\n     -  MARIADB_PASSWORD=${MARIADB_PASSWORD}\n    ports:\n     - \"3306:3306\"\n    volumes:\n     - /home/renatubuntu/documentation/docker-compose2/bookstack-mariadb:/var/lib/mysql\n    restart: unless-stopped\n    networks:\n     - homelab-net\n  bookstack-app:\n   image: linuxserver/bookstack\n   environment: \n    -  APP_URL=${APP_URL}\n    -  APP_KEY=${APP_KEY}\n    - DB_HOST=${DB_HOST}\n    - DB_DATABASE=${DB_DATABASE}\n    - DB_USER=${DB_USER}\n    - DB_PASS=${DB_PASS}\n    - DB_PORT=${DB_PORT}\n   ports:\n    - \"6875:80\"\n   volumes:\n    - /home/renatubuntu/documentation/docker-compose2/bookstack-app:/config\n   restart: unless-stopped\n   networks:\n    - homelab-net\n    - reverse-proxy-net\nnetworks:\n  homelab-net:\n  reverse-proxy-net:\n    external: true   ',''),
(6,0,0,1,'wysiwyg','<p id=\"bkmrk-services%3A%C2%A0-nginx-web\">services:<br>&nbsp; nginx-web-server:<br>&nbsp; &nbsp; image: nginx<br>&nbsp; &nbsp; ports:<br>&nbsp; &nbsp; &nbsp;- \"443:443\"<br>&nbsp; &nbsp; volumes:<br>&nbsp; &nbsp; &nbsp;- /home/renatubuntu/documentation/docker-compose5/nginx-config:/etc/nginx/conf.d<br>&nbsp; &nbsp; &nbsp;- /home/renatubuntu/documentation/docker-compose5/Webserver:/usr/share/nginx/html<br>&nbsp; &nbsp; networks:<br>&nbsp; &nbsp; &nbsp;- homelab-net<br>&nbsp; &nbsp; &nbsp;- reverse-proxy-net<br>&nbsp; &nbsp; restart: unless-stopped</p>\r\n<p id=\"bkmrk-networks%3A%C2%A0-homelab-n\">networks:<br>&nbsp; homelab-net:<br>&nbsp; reverse-proxy-net:<br>&nbsp; &nbsp;external: true<br></p>','services:\n  nginx-web-server:\n    image: nginx\n    ports:\n     - \"443:443\"\n    volumes:\n     - /home/renatubuntu/documentation/docker-compose5/nginx-config:/etc/nginx/conf.d\n     - /home/renatubuntu/documentation/docker-compose5/Webserver:/usr/share/nginx/html\n    networks:\n     - homelab-net\n     - reverse-proxy-net\n    restart: unless-stopped\nnetworks:\n  homelab-net:\n  reverse-proxy-net:\n   external: true','');
/*!40000 ALTER TABLE `entity_page_data` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `entity_permissions`
--

DROP TABLE IF EXISTS `entity_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `entity_permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` bigint(20) unsigned NOT NULL,
  `entity_type` varchar(25) NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  `view` tinyint(1) NOT NULL DEFAULT 0,
  `create` tinyint(1) NOT NULL DEFAULT 0,
  `update` tinyint(1) NOT NULL DEFAULT 0,
  `delete` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `new_entity_permissions_entity_id_entity_type_index` (`entity_id`,`entity_type`),
  KEY `new_entity_permissions_role_id_index` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_permissions`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `entity_permissions` WRITE;
/*!40000 ALTER TABLE `entity_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `entity_permissions` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `favourites`
--

DROP TABLE IF EXISTS `favourites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `favourites` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `favouritable_id` bigint(20) unsigned NOT NULL,
  `favouritable_type` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `favouritable_index` (`favouritable_id`,`favouritable_type`),
  KEY `favourites_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favourites`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `favourites` WRITE;
/*!40000 ALTER TABLE `favourites` DISABLE KEYS */;
/*!40000 ALTER TABLE `favourites` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `images` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `url` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `path` varchar(400) NOT NULL,
  `type` varchar(191) NOT NULL,
  `uploaded_to` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `images_type_index` (`type`),
  KEY `images_uploaded_to_index` (`uploaded_to`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES
(1,'Screenshot From 2026-07-06 17-37-07.png','http://192.168.0.180:6875/uploads/images/cover_book/2026-07/screenshot-from-2026-07-06-17-37-07.png','2026-07-06 16:01:05','2026-07-06 16:01:05',1,1,'/uploads/images/cover_book/2026-07/screenshot-from-2026-07-06-17-37-07.png','cover_book',1),
(2,'Screenshot From 2026-07-06 17-57-05.png','http://192.168.0.180:6875/uploads/images/cover_book/2026-07/screenshot-from-2026-07-06-17-57-05.png','2026-07-06 16:05:24','2026-07-06 16:05:24',1,1,'/uploads/images/cover_book/2026-07/screenshot-from-2026-07-06-17-57-05.png','cover_book',3),
(3,'Screenshot From 2026-07-06 18-09-23.png','http://192.168.0.180:6875/uploads/images/cover_book/2026-07/screenshot-from-2026-07-06-18-09-23.png','2026-07-06 16:10:55','2026-07-06 16:10:55',1,1,'/uploads/images/cover_book/2026-07/screenshot-from-2026-07-06-18-09-23.png','cover_book',5);
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `imports`
--

DROP TABLE IF EXISTS `imports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `imports` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `path` varchar(191) NOT NULL,
  `size` int(11) NOT NULL,
  `type` varchar(191) NOT NULL,
  `metadata` longtext NOT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `imports_created_by_index` (`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imports`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `imports` WRITE;
/*!40000 ALTER TABLE `imports` DISABLE KEYS */;
/*!40000 ALTER TABLE `imports` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `joint_permissions`
--

DROP TABLE IF EXISTS `joint_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `joint_permissions` (
  `role_id` int(11) NOT NULL,
  `entity_type` varchar(191) NOT NULL,
  `entity_id` bigint(20) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL,
  `owner_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`role_id`,`entity_type`,`entity_id`),
  KEY `joint_permissions_entity_id_entity_type_index` (`entity_id`,`entity_type`),
  KEY `joint_permissions_role_id_index` (`role_id`),
  KEY `joint_permissions_status_index` (`status`),
  KEY `joint_permissions_owner_id_index` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `joint_permissions`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `joint_permissions` WRITE;
/*!40000 ALTER TABLE `joint_permissions` DISABLE KEYS */;
INSERT INTO `joint_permissions` VALUES
(1,'book',1,3,1),
(1,'book',3,3,1),
(1,'book',5,3,1),
(1,'book',7,3,1),
(1,'page',2,3,1),
(1,'page',4,3,1),
(1,'page',6,3,1),
(2,'book',1,1,1),
(2,'book',3,1,1),
(2,'book',5,1,1),
(2,'book',7,1,1),
(2,'page',2,1,1),
(2,'page',4,1,1),
(2,'page',6,1,1),
(3,'book',1,1,1),
(3,'book',3,1,1),
(3,'book',5,1,1),
(3,'book',7,1,1),
(3,'page',2,1,1),
(3,'page',4,1,1),
(3,'page',6,1,1),
(4,'book',1,1,1),
(4,'book',3,1,1),
(4,'book',5,1,1),
(4,'book',7,1,1),
(4,'page',2,1,1),
(4,'page',4,1,1),
(4,'page',6,1,1);
/*!40000 ALTER TABLE `joint_permissions` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `mention_history`
--

DROP TABLE IF EXISTS `mention_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `mention_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mentionable_type` varchar(50) NOT NULL,
  `mentionable_id` bigint(20) unsigned NOT NULL,
  `from_user_id` int(10) unsigned NOT NULL,
  `to_user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mention_history_mentionable_type_index` (`mentionable_type`),
  KEY `mention_history_mentionable_id_index` (`mentionable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mention_history`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `mention_history` WRITE;
/*!40000 ALTER TABLE `mention_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `mention_history` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `mfa_values`
--

DROP TABLE IF EXISTS `mfa_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `mfa_values` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `method` varchar(20) NOT NULL,
  `value` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mfa_values_user_id_index` (`user_id`),
  KEY `mfa_values_method_index` (`method`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mfa_values`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `mfa_values` WRITE;
/*!40000 ALTER TABLE `mfa_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `mfa_values` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES
(1,'2014_10_12_000000_create_users_table',1),
(2,'2014_10_12_100000_create_password_resets_table',1),
(3,'2015_07_12_114933_create_books_table',1),
(4,'2015_07_12_190027_create_pages_table',1),
(5,'2015_07_13_172121_create_images_table',1),
(6,'2015_07_27_172342_create_chapters_table',1),
(7,'2015_08_08_200447_add_users_to_entities',1),
(8,'2015_08_09_093534_create_page_revisions_table',1),
(9,'2015_08_16_142133_create_activities_table',1),
(10,'2015_08_29_105422_add_roles_and_permissions',1),
(11,'2015_08_30_125859_create_settings_table',1),
(12,'2015_08_31_175240_add_search_indexes',1),
(13,'2015_09_04_165821_create_social_accounts_table',1),
(14,'2015_09_05_164707_add_email_confirmation_table',1),
(15,'2015_11_21_145609_create_views_table',1),
(16,'2015_11_26_221857_add_entity_indexes',1),
(17,'2015_12_05_145049_fulltext_weighting',1),
(18,'2015_12_07_195238_add_image_upload_types',1),
(19,'2015_12_09_195748_add_user_avatars',1),
(20,'2016_01_11_210908_add_external_auth_to_users',1),
(21,'2016_02_25_184030_add_slug_to_revisions',1),
(22,'2016_02_27_120329_update_permissions_and_roles',1),
(23,'2016_02_28_084200_add_entity_access_controls',1),
(24,'2016_03_09_203143_add_page_revision_types',1),
(25,'2016_03_13_082138_add_page_drafts',1),
(26,'2016_03_25_123157_add_markdown_support',1),
(27,'2016_04_09_100730_add_view_permissions_to_roles',1),
(28,'2016_04_20_192649_create_joint_permissions_table',1),
(29,'2016_05_06_185215_create_tags_table',1),
(30,'2016_07_07_181521_add_summary_to_page_revisions',1),
(31,'2016_09_29_101449_remove_hidden_roles',1),
(32,'2016_10_09_142037_create_attachments_table',1),
(33,'2017_01_21_163556_create_cache_table',1),
(34,'2017_01_21_163602_create_sessions_table',1),
(35,'2017_03_19_091553_create_search_index_table',1),
(36,'2017_04_20_185112_add_revision_counts',1),
(37,'2017_07_02_152834_update_db_encoding_to_ut8mb4',1),
(38,'2017_08_01_130541_create_comments_table',1),
(39,'2017_08_29_102650_add_cover_image_display',1),
(40,'2018_07_15_173514_add_role_external_auth_id',1),
(41,'2018_08_04_115700_create_bookshelves_table',1),
(42,'2019_07_07_112515_add_template_support',1),
(43,'2019_08_17_140214_add_user_invites_table',1),
(44,'2019_12_29_120917_add_api_auth',1),
(45,'2020_08_04_111754_drop_joint_permissions_id',1),
(46,'2020_08_04_131052_remove_role_name_field',1),
(47,'2020_09_19_094251_add_activity_indexes',1),
(48,'2020_09_27_210059_add_entity_soft_deletes',1),
(49,'2020_09_27_210528_create_deletions_table',1),
(50,'2020_11_07_232321_simplify_activities_table',1),
(51,'2020_12_30_173528_add_owned_by_field_to_entities',1),
(52,'2021_01_30_225441_add_settings_type_column',1),
(53,'2021_03_08_215138_add_user_slug',1),
(54,'2021_05_15_173110_create_favourites_table',1),
(55,'2021_06_30_173111_create_mfa_values_table',1),
(56,'2021_07_03_085038_add_mfa_enforced_to_roles_table',1),
(57,'2021_08_28_161743_add_export_role_permission',1),
(58,'2021_09_26_044614_add_activities_ip_column',1),
(59,'2021_11_26_070438_add_index_for_user_ip',1),
(60,'2021_12_07_111343_create_webhooks_table',1),
(61,'2021_12_13_152024_create_jobs_table',1),
(62,'2021_12_13_152120_create_failed_jobs_table',1),
(63,'2022_01_03_154041_add_webhooks_timeout_error_columns',1),
(64,'2022_04_17_101741_add_editor_change_field_and_permission',1),
(65,'2022_04_25_140741_update_polymorphic_types',1),
(66,'2022_07_16_170051_drop_joint_permission_type',1),
(67,'2022_08_17_092941_create_references_table',1),
(68,'2022_09_02_082910_fix_shelf_cover_image_types',1),
(69,'2022_10_07_091406_flatten_entity_permissions_table',1),
(70,'2022_10_08_104202_drop_entity_restricted_field',1),
(71,'2023_01_24_104625_refactor_joint_permissions_storage',1),
(72,'2023_01_28_141230_copy_color_settings_for_dark_mode',1),
(73,'2023_02_20_093655_increase_attachments_path_length',1),
(74,'2023_02_23_200227_add_updated_at_index_to_pages',1),
(75,'2023_06_10_071823_remove_guest_user_secondary_roles',1),
(76,'2023_06_25_181952_remove_bookshelf_create_entity_permissions',1),
(77,'2023_07_25_124945_add_receive_notifications_role_permissions',1),
(78,'2023_07_31_104430_create_watches_table',1),
(79,'2023_08_21_174248_increase_cache_size',1),
(80,'2023_12_02_104541_add_default_template_to_books',1),
(81,'2023_12_17_140913_add_description_html_to_entities',1),
(82,'2024_01_01_104542_add_default_template_to_chapters',1),
(83,'2024_02_04_141358_add_views_updated_index',1),
(84,'2024_05_04_154409_rename_activity_relation_columns',1),
(85,'2024_09_29_140340_ensure_editor_value_set',1),
(86,'2024_10_29_114420_add_import_role_permission',1),
(87,'2024_11_02_160700_create_imports_table',1),
(88,'2024_11_27_171039_add_instance_id_setting',1),
(89,'2025_01_29_180933_create_sort_rules_table',1),
(90,'2025_02_05_150842_add_sort_rule_id_to_books',1),
(91,'2025_04_18_215145_add_content_refs_and_archived_to_comments',1),
(92,'2025_09_02_111542_remove_unused_columns',1),
(93,'2025_09_15_132850_create_entities_table',1),
(94,'2025_09_15_134701_migrate_entity_data',1),
(95,'2025_09_15_134751_update_entity_relation_columns',1),
(96,'2025_09_15_134813_drop_old_entity_tables',1),
(97,'2025_10_18_163331_clean_user_id_references',1),
(98,'2025_10_22_134507_update_comments_relation_field_names',1),
(99,'2025_11_23_161812_create_slug_history_table',1),
(100,'2025_12_15_140219_create_mention_history_table',1),
(101,'2025_12_19_103417_add_views_viewable_type_index',1),
(102,'2026_04_19_141616_add_revision_view_all_permission',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `page_revisions`
--

DROP TABLE IF EXISTS `page_revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `page_revisions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page_id` bigint(20) unsigned NOT NULL,
  `name` varchar(191) NOT NULL,
  `html` longtext NOT NULL,
  `text` longtext NOT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `slug` varchar(191) NOT NULL,
  `book_slug` varchar(191) NOT NULL,
  `type` varchar(191) NOT NULL DEFAULT 'version',
  `markdown` longtext NOT NULL DEFAULT '',
  `summary` varchar(191) DEFAULT NULL,
  `revision_number` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `page_revisions_page_id_index` (`page_id`),
  KEY `page_revisions_slug_index` (`slug`),
  KEY `page_revisions_book_slug_index` (`book_slug`),
  KEY `page_revisions_type_index` (`type`),
  KEY `page_revisions_revision_number_index` (`revision_number`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_revisions`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `page_revisions` WRITE;
/*!40000 ALTER TABLE `page_revisions` DISABLE KEYS */;
INSERT INTO `page_revisions` VALUES
(1,2,'New Page','<p id=\"bkmrk-services%3A%C2%A0%C2%A0-grafana-\">services:&nbsp;<br>&nbsp; grafana-web:<br>&nbsp; &nbsp; image: grafana/grafana<br>&nbsp; &nbsp; networks:<br>&nbsp; &nbsp; &nbsp;- homelab-net<br>&nbsp; &nbsp; &nbsp;- reverse-proxy-net<br>&nbsp; &nbsp; ports:<br>&nbsp; &nbsp; &nbsp;- 3000:3000<br>&nbsp; &nbsp; volumes:<br>&nbsp; &nbsp; &nbsp;- /home/renatubuntu/documentation/grafanafiles:/var/lib/grafana<br>&nbsp; &nbsp; restart: unless-stopped</p>\r\n<p id=\"bkmrk-%C2%A0-prometheus-data%3A%C2%A0-\">&nbsp; prometheus-data:<br>&nbsp; &nbsp; image: prom/prometheus<br>&nbsp; &nbsp; networks:<br>&nbsp; &nbsp; &nbsp;- homelab-net<br>&nbsp; &nbsp; ports:<br>&nbsp; &nbsp; &nbsp;- 9090:9090<br>&nbsp; &nbsp; volumes:<br>&nbsp; &nbsp; &nbsp;- /home/renatubuntu/documentation/prometheus-data:/prometheus<br>&nbsp; &nbsp; &nbsp;- /home/renatubuntu/documentation/prometheus-config/prometheus.yml:/etc/prometheus/prometheus.yml<br>&nbsp; &nbsp; restart: unless-stopped</p>\r\n<p id=\"bkmrk-%C2%A0-node-exporter%3A%C2%A0-%C2%A0-\">&nbsp; node-exporter:<br>&nbsp; &nbsp; image: prom/node-exporter</p>\r\n<p id=\"bkmrk-%C2%A0-%C2%A0-command%3A%C2%A0-%C2%A0-%C2%A0---\">&nbsp; &nbsp; command:<br>&nbsp; &nbsp; &nbsp; - \'--path.procfs=/host/proc\'<br>&nbsp; &nbsp; &nbsp; - \'--path.sysfs=/host/sys\'<br>&nbsp; &nbsp; &nbsp; - \'--path.rootfs=/rootfs\'</p>\r\n<p id=\"bkmrk-%C2%A0-%C2%A0-volumes%3A%C2%A0-%C2%A0-%C2%A0---\">&nbsp; &nbsp; volumes:<br>&nbsp; &nbsp; &nbsp; - /proc:/host/proc:ro<br>&nbsp; &nbsp; &nbsp; - /sys:/host/sys:ro<br>&nbsp; &nbsp; &nbsp; - /:/rootfs:ro</p>\r\n<p id=\"bkmrk-%C2%A0-%C2%A0-networks%3A%C2%A0-%C2%A0-%C2%A0--\">&nbsp; &nbsp; networks:<br>&nbsp; &nbsp; &nbsp; - homelab-net</p>\r\n<p id=\"bkmrk-%C2%A0-%C2%A0-ports%3A%C2%A0-%C2%A0-%C2%A0---91\">&nbsp; &nbsp; ports:<br>&nbsp; &nbsp; &nbsp; - 9100:9100</p>\r\n<p id=\"bkmrk-%C2%A0-%C2%A0-restart%3A-unless-\">&nbsp; &nbsp; restart: unless-stopped</p>\r\n<p id=\"bkmrk-%C2%A0-cadvisor%3A%C2%A0-%C2%A0-image\">&nbsp; cadvisor:<br>&nbsp; &nbsp; image: gcr.io/cadvisor/cadvisor</p>\r\n<p id=\"bkmrk-%C2%A0-%C2%A0-privileged%3A-true\">&nbsp; &nbsp; privileged: true</p>\r\n<p id=\"bkmrk-%C2%A0-%C2%A0-devices%3A%C2%A0-%C2%A0-%C2%A0---\">&nbsp; &nbsp; devices:<br>&nbsp; &nbsp; &nbsp; - /dev/kmsg</p>\r\n<p id=\"bkmrk-%C2%A0-%C2%A0-volumes%3A%C2%A0-%C2%A0-%C2%A0----1\">&nbsp; &nbsp; volumes:<br>&nbsp; &nbsp; &nbsp; - /:/rootfs:ro<br>&nbsp; &nbsp; &nbsp; - /var/run:/var/run:ro<br>&nbsp; &nbsp; &nbsp; - /sys:/sys:ro<br>&nbsp; &nbsp; &nbsp; - /var/lib/docker:/var/lib/docker:ro<br>&nbsp; &nbsp; &nbsp; - /dev/disk:/dev/disk:ro</p>\r\n<p id=\"bkmrk-%C2%A0-%C2%A0-ports%3A%C2%A0-%C2%A0-%C2%A0---%228\">&nbsp; &nbsp; ports:<br>&nbsp; &nbsp; &nbsp; - \"8080:8080\"</p>\r\n<p id=\"bkmrk-%C2%A0-%C2%A0-restart%3A-unless--1\">&nbsp; &nbsp; restart: unless-stopped</p>\r\n<p id=\"bkmrk-%C2%A0-%C2%A0-networks%3A%C2%A0-%C2%A0-%C2%A0---1\">&nbsp; &nbsp; networks:<br>&nbsp; &nbsp; &nbsp; - homelab-net<br>&nbsp; &nbsp; &nbsp; - reverse-proxy-net<br>&nbsp; &nbsp;<br>networks:<br>&nbsp; homelab-net:<br>&nbsp; reverse-proxy-net:<br>&nbsp; &nbsp; external: true</p>','services: \n  grafana-web:\n    image: grafana/grafana\n    networks:\n     - homelab-net\n     - reverse-proxy-net\n    ports:\n     - 3000:3000\n    volumes:\n     - /home/renatubuntu/documentation/grafanafiles:/var/lib/grafana\n    restart: unless-stopped\n  prometheus-data:\n    image: prom/prometheus\n    networks:\n     - homelab-net\n    ports:\n     - 9090:9090\n    volumes:\n     - /home/renatubuntu/documentation/prometheus-data:/prometheus\n     - /home/renatubuntu/documentation/prometheus-config/prometheus.yml:/etc/prometheus/prometheus.yml\n    restart: unless-stopped\n  node-exporter:\n    image: prom/node-exporter\n    command:\n      - \'--path.procfs=/host/proc\'\n      - \'--path.sysfs=/host/sys\'\n      - \'--path.rootfs=/rootfs\'\n    volumes:\n      - /proc:/host/proc:ro\n      - /sys:/host/sys:ro\n      - /:/rootfs:ro\n    networks:\n      - homelab-net\n    ports:\n      - 9100:9100\n    restart: unless-stopped\n  cadvisor:\n    image: gcr.io/cadvisor/cadvisor\n    privileged: true\n    devices:\n      - /dev/kmsg\n    volumes:\n      - /:/rootfs:ro\n      - /var/run:/var/run:ro\n      - /sys:/sys:ro\n      - /var/lib/docker:/var/lib/docker:ro\n      - /dev/disk:/dev/disk:ro\n    ports:\n      - \"8080:8080\"\n    restart: unless-stopped\n    networks:\n      - homelab-net\n      - reverse-proxy-net\n   \nnetworks:\n  homelab-net:\n  reverse-proxy-net:\n    external: true',1,'2026-07-06 16:02:33','2026-07-06 16:02:33','new-page','monitoring-stack','version','','Initial publish',1),
(2,2,'compose.yaml','<p id=\"bkmrk-services%3A%C2%A0%C2%A0-grafana-\">services:&nbsp;<br>&nbsp; grafana-web:<br>&nbsp; &nbsp; image: grafana/grafana<br>&nbsp; &nbsp; networks:<br>&nbsp; &nbsp; &nbsp;- homelab-net<br>&nbsp; &nbsp; &nbsp;- reverse-proxy-net<br>&nbsp; &nbsp; ports:<br>&nbsp; &nbsp; &nbsp;- 3000:3000<br>&nbsp; &nbsp; volumes:<br>&nbsp; &nbsp; &nbsp;- /home/renatubuntu/documentation/grafanafiles:/var/lib/grafana<br>&nbsp; &nbsp; restart: unless-stopped</p>\r\n<p id=\"bkmrk-%C2%A0-prometheus-data%3A%C2%A0-\">&nbsp; prometheus-data:<br>&nbsp; &nbsp; image: prom/prometheus<br>&nbsp; &nbsp; networks:<br>&nbsp; &nbsp; &nbsp;- homelab-net<br>&nbsp; &nbsp; ports:<br>&nbsp; &nbsp; &nbsp;- 9090:9090<br>&nbsp; &nbsp; volumes:<br>&nbsp; &nbsp; &nbsp;- /home/renatubuntu/documentation/prometheus-data:/prometheus<br>&nbsp; &nbsp; &nbsp;- /home/renatubuntu/documentation/prometheus-config/prometheus.yml:/etc/prometheus/prometheus.yml<br>&nbsp; &nbsp; restart: unless-stopped</p>\r\n<p id=\"bkmrk-%C2%A0-node-exporter%3A%C2%A0-%C2%A0-\">&nbsp; node-exporter:<br>&nbsp; &nbsp; image: prom/node-exporter</p>\r\n<p id=\"bkmrk-%C2%A0-%C2%A0-command%3A%C2%A0-%C2%A0-%C2%A0---\">&nbsp; &nbsp; command:<br>&nbsp; &nbsp; &nbsp; - \'--path.procfs=/host/proc\'<br>&nbsp; &nbsp; &nbsp; - \'--path.sysfs=/host/sys\'<br>&nbsp; &nbsp; &nbsp; - \'--path.rootfs=/rootfs\'</p>\r\n<p id=\"bkmrk-%C2%A0-%C2%A0-volumes%3A%C2%A0-%C2%A0-%C2%A0---\">&nbsp; &nbsp; volumes:<br>&nbsp; &nbsp; &nbsp; - /proc:/host/proc:ro<br>&nbsp; &nbsp; &nbsp; - /sys:/host/sys:ro<br>&nbsp; &nbsp; &nbsp; - /:/rootfs:ro</p>\r\n<p id=\"bkmrk-%C2%A0-%C2%A0-networks%3A%C2%A0-%C2%A0-%C2%A0--\">&nbsp; &nbsp; networks:<br>&nbsp; &nbsp; &nbsp; - homelab-net</p>\r\n<p id=\"bkmrk-%C2%A0-%C2%A0-ports%3A%C2%A0-%C2%A0-%C2%A0---91\">&nbsp; &nbsp; ports:<br>&nbsp; &nbsp; &nbsp; - 9100:9100</p>\r\n<p id=\"bkmrk-%C2%A0-%C2%A0-restart%3A-unless-\">&nbsp; &nbsp; restart: unless-stopped</p>\r\n<p id=\"bkmrk-%C2%A0-cadvisor%3A%C2%A0-%C2%A0-image\">&nbsp; cadvisor:<br>&nbsp; &nbsp; image: gcr.io/cadvisor/cadvisor</p>\r\n<p id=\"bkmrk-%C2%A0-%C2%A0-privileged%3A-true\">&nbsp; &nbsp; privileged: true</p>\r\n<p id=\"bkmrk-%C2%A0-%C2%A0-devices%3A%C2%A0-%C2%A0-%C2%A0---\">&nbsp; &nbsp; devices:<br>&nbsp; &nbsp; &nbsp; - /dev/kmsg</p>\r\n<p id=\"bkmrk-%C2%A0-%C2%A0-volumes%3A%C2%A0-%C2%A0-%C2%A0----1\">&nbsp; &nbsp; volumes:<br>&nbsp; &nbsp; &nbsp; - /:/rootfs:ro<br>&nbsp; &nbsp; &nbsp; - /var/run:/var/run:ro<br>&nbsp; &nbsp; &nbsp; - /sys:/sys:ro<br>&nbsp; &nbsp; &nbsp; - /var/lib/docker:/var/lib/docker:ro<br>&nbsp; &nbsp; &nbsp; - /dev/disk:/dev/disk:ro</p>\r\n<p id=\"bkmrk-%C2%A0-%C2%A0-ports%3A%C2%A0-%C2%A0-%C2%A0---%228\">&nbsp; &nbsp; ports:<br>&nbsp; &nbsp; &nbsp; - \"8080:8080\"</p>\r\n<p id=\"bkmrk-%C2%A0-%C2%A0-restart%3A-unless--1\">&nbsp; &nbsp; restart: unless-stopped</p>\r\n<p id=\"bkmrk-%C2%A0-%C2%A0-networks%3A%C2%A0-%C2%A0-%C2%A0---1\">&nbsp; &nbsp; networks:<br>&nbsp; &nbsp; &nbsp; - homelab-net<br>&nbsp; &nbsp; &nbsp; - reverse-proxy-net<br>&nbsp; &nbsp;<br>networks:<br>&nbsp; homelab-net:<br>&nbsp; reverse-proxy-net:<br>&nbsp; &nbsp; external: true</p>','services: \n  grafana-web:\n    image: grafana/grafana\n    networks:\n     - homelab-net\n     - reverse-proxy-net\n    ports:\n     - 3000:3000\n    volumes:\n     - /home/renatubuntu/documentation/grafanafiles:/var/lib/grafana\n    restart: unless-stopped\n  prometheus-data:\n    image: prom/prometheus\n    networks:\n     - homelab-net\n    ports:\n     - 9090:9090\n    volumes:\n     - /home/renatubuntu/documentation/prometheus-data:/prometheus\n     - /home/renatubuntu/documentation/prometheus-config/prometheus.yml:/etc/prometheus/prometheus.yml\n    restart: unless-stopped\n  node-exporter:\n    image: prom/node-exporter\n    command:\n      - \'--path.procfs=/host/proc\'\n      - \'--path.sysfs=/host/sys\'\n      - \'--path.rootfs=/rootfs\'\n    volumes:\n      - /proc:/host/proc:ro\n      - /sys:/host/sys:ro\n      - /:/rootfs:ro\n    networks:\n      - homelab-net\n    ports:\n      - 9100:9100\n    restart: unless-stopped\n  cadvisor:\n    image: gcr.io/cadvisor/cadvisor\n    privileged: true\n    devices:\n      - /dev/kmsg\n    volumes:\n      - /:/rootfs:ro\n      - /var/run:/var/run:ro\n      - /sys:/sys:ro\n      - /var/lib/docker:/var/lib/docker:ro\n      - /dev/disk:/dev/disk:ro\n    ports:\n      - \"8080:8080\"\n    restart: unless-stopped\n    networks:\n      - homelab-net\n      - reverse-proxy-net\n   \nnetworks:\n  homelab-net:\n  reverse-proxy-net:\n    external: true',1,'2026-07-06 16:02:49','2026-07-06 16:02:49','composeyaml','monitoring-stack','version','','',2),
(3,4,'compose.yaml','<p id=\"bkmrk-services%3A%C2%A0-mariadb-d\">services:<br>&nbsp; mariadb-datenbank:<br>&nbsp; &nbsp; image: mariadb<br>&nbsp; &nbsp; environment:<br>&nbsp; &nbsp; &nbsp;- &nbsp;MARIADB_ROOT_PASSWORD=${MARIADB_ROOT_PASSWORD}<br>&nbsp; &nbsp; &nbsp;- &nbsp;MARIADB_DATABASE=${MARIADB_DATABASE}<br>&nbsp; &nbsp; &nbsp;- &nbsp;MARIADB_USER=${MARIADB_USER}<br>&nbsp; &nbsp; &nbsp;- &nbsp;MARIADB_PASSWORD=${MARIADB_PASSWORD}<br>&nbsp; &nbsp; ports:<br>&nbsp; &nbsp; &nbsp;- \"3306:3306\"<br>&nbsp; &nbsp; volumes:<br>&nbsp; &nbsp; &nbsp;- /home/renatubuntu/documentation/docker-compose2/bookstack-mariadb:/var/lib/mysql<br>&nbsp; &nbsp; restart: unless-stopped<br>&nbsp; &nbsp; networks:<br>&nbsp; &nbsp; &nbsp;- homelab-net</p>\r\n<p id=\"bkmrk-%C2%A0-bookstack-app%3A%C2%A0-%C2%A0i\">&nbsp; bookstack-app:<br>&nbsp; &nbsp;image: linuxserver/bookstack<br>&nbsp; &nbsp;environment:&nbsp;<br>&nbsp; &nbsp; - &nbsp;APP_URL=${APP_URL}<br>&nbsp; &nbsp; - &nbsp;APP_KEY=${APP_KEY}<br>&nbsp; &nbsp; - DB_HOST=${DB_HOST}<br>&nbsp; &nbsp; - DB_DATABASE=${DB_DATABASE}<br>&nbsp; &nbsp; - DB_USER=${DB_USER}<br>&nbsp; &nbsp; - DB_PASS=${DB_PASS}<br>&nbsp; &nbsp; - DB_PORT=${DB_PORT}<br>&nbsp; &nbsp;ports:<br>&nbsp; &nbsp; - \"6875:80\"<br>&nbsp; &nbsp;volumes:<br>&nbsp; &nbsp; - /home/renatubuntu/documentation/docker-compose2/bookstack-app:/config<br>&nbsp; &nbsp;restart: unless-stopped<br>&nbsp; &nbsp;networks:<br>&nbsp; &nbsp; - homelab-net<br>&nbsp; &nbsp; - reverse-proxy-net</p>\r\n<p id=\"bkmrk-networks%3A%C2%A0-homelab-n\">networks:<br>&nbsp; homelab-net:<br>&nbsp; reverse-proxy-net:<br>&nbsp; &nbsp; external: true &nbsp;&nbsp;</p>','services:\n  mariadb-datenbank:\n    image: mariadb\n    environment:\n     -  MARIADB_ROOT_PASSWORD=${MARIADB_ROOT_PASSWORD}\n     -  MARIADB_DATABASE=${MARIADB_DATABASE}\n     -  MARIADB_USER=${MARIADB_USER}\n     -  MARIADB_PASSWORD=${MARIADB_PASSWORD}\n    ports:\n     - \"3306:3306\"\n    volumes:\n     - /home/renatubuntu/documentation/docker-compose2/bookstack-mariadb:/var/lib/mysql\n    restart: unless-stopped\n    networks:\n     - homelab-net\n  bookstack-app:\n   image: linuxserver/bookstack\n   environment: \n    -  APP_URL=${APP_URL}\n    -  APP_KEY=${APP_KEY}\n    - DB_HOST=${DB_HOST}\n    - DB_DATABASE=${DB_DATABASE}\n    - DB_USER=${DB_USER}\n    - DB_PASS=${DB_PASS}\n    - DB_PORT=${DB_PORT}\n   ports:\n    - \"6875:80\"\n   volumes:\n    - /home/renatubuntu/documentation/docker-compose2/bookstack-app:/config\n   restart: unless-stopped\n   networks:\n    - homelab-net\n    - reverse-proxy-net\nnetworks:\n  homelab-net:\n  reverse-proxy-net:\n    external: true   ',1,'2026-07-06 16:05:41','2026-07-06 16:05:41','composeyaml','local-git-gitea-stack','version','','Initial publish',1),
(4,6,'compose.yaml','<p id=\"bkmrk-services%3A%C2%A0-nginx-web\">services:<br>&nbsp; nginx-web-server:<br>&nbsp; &nbsp; image: nginx<br>&nbsp; &nbsp; ports:<br>&nbsp; &nbsp; &nbsp;- \"443:443\"<br>&nbsp; &nbsp; volumes:<br>&nbsp; &nbsp; &nbsp;- /home/renatubuntu/documentation/docker-compose5/nginx-config:/etc/nginx/conf.d<br>&nbsp; &nbsp; &nbsp;- /home/renatubuntu/documentation/docker-compose5/Webserver:/usr/share/nginx/html<br>&nbsp; &nbsp; networks:<br>&nbsp; &nbsp; &nbsp;- homelab-net<br>&nbsp; &nbsp; &nbsp;- reverse-proxy-net<br>&nbsp; &nbsp; restart: unless-stopped</p>\r\n<p id=\"bkmrk-networks%3A%C2%A0-homelab-n\">networks:<br>&nbsp; homelab-net:<br>&nbsp; reverse-proxy-net:<br>&nbsp; &nbsp;external: true<br></p>','services:\n  nginx-web-server:\n    image: nginx\n    ports:\n     - \"443:443\"\n    volumes:\n     - /home/renatubuntu/documentation/docker-compose5/nginx-config:/etc/nginx/conf.d\n     - /home/renatubuntu/documentation/docker-compose5/Webserver:/usr/share/nginx/html\n    networks:\n     - homelab-net\n     - reverse-proxy-net\n    restart: unless-stopped\nnetworks:\n  homelab-net:\n  reverse-proxy-net:\n   external: true',1,'2026-07-06 16:11:16','2026-07-06 16:11:16','composeyaml','nginx-stack','version','','Initial publish',1);
/*!40000 ALTER TABLE `page_revisions` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NOT NULL,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `permission_role`
--

DROP TABLE IF EXISTS `permission_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission_role` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_role_id_foreign` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `role_permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_role`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `permission_role` WRITE;
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
INSERT INTO `permission_role` VALUES
(19,1),
(20,1),
(21,1),
(22,1),
(23,1),
(24,1),
(25,1),
(26,1),
(27,1),
(28,1),
(29,1),
(30,1),
(31,1),
(32,1),
(33,1),
(34,1),
(35,1),
(36,1),
(37,1),
(38,1),
(39,1),
(40,1),
(41,1),
(42,1),
(43,1),
(44,1),
(45,1),
(46,1),
(47,1),
(48,1),
(49,1),
(50,1),
(51,1),
(52,1),
(53,1),
(54,1),
(55,1),
(56,1),
(57,1),
(58,1),
(59,1),
(60,1),
(61,1),
(62,1),
(63,1),
(64,1),
(65,1),
(66,1),
(67,1),
(68,1),
(69,1),
(70,1),
(71,1),
(72,1),
(73,1),
(74,1),
(75,1),
(76,1),
(77,1),
(78,1),
(79,1),
(80,1),
(24,2),
(25,2),
(26,2),
(27,2),
(28,2),
(29,2),
(30,2),
(31,2),
(32,2),
(33,2),
(34,2),
(35,2),
(36,2),
(37,2),
(38,2),
(39,2),
(40,2),
(41,2),
(42,2),
(43,2),
(44,2),
(45,2),
(46,2),
(47,2),
(48,2),
(49,2),
(50,2),
(51,2),
(52,2),
(53,2),
(66,2),
(67,2),
(68,2),
(69,2),
(70,2),
(71,2),
(72,2),
(73,2),
(76,2),
(80,2),
(48,3),
(49,3),
(50,3),
(51,3),
(52,3),
(53,3),
(66,3),
(67,3),
(76,3),
(80,3),
(48,4),
(49,4),
(50,4),
(51,4),
(52,4),
(53,4),
(66,4),
(67,4),
(76,4),
(80,4);
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `references`
--

DROP TABLE IF EXISTS `references`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `references` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `from_id` bigint(20) unsigned NOT NULL,
  `from_type` varchar(25) NOT NULL,
  `to_id` bigint(20) unsigned NOT NULL,
  `to_type` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `references_from_id_index` (`from_id`),
  KEY `references_from_type_index` (`from_type`),
  KEY `references_to_id_index` (`to_id`),
  KEY `references_to_type_index` (`to_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `references`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `references` WRITE;
/*!40000 ALTER TABLE `references` DISABLE KEYS */;
/*!40000 ALTER TABLE `references` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `role_permissions`
--

DROP TABLE IF EXISTS `role_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_permissions`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `role_permissions` WRITE;
/*!40000 ALTER TABLE `role_permissions` DISABLE KEYS */;
INSERT INTO `role_permissions` VALUES
(19,'settings-manage','2026-07-02 12:00:07','2026-07-02 12:00:07'),
(20,'users-manage','2026-07-02 12:00:08','2026-07-02 12:00:08'),
(21,'user-roles-manage','2026-07-02 12:00:08','2026-07-02 12:00:08'),
(22,'restrictions-manage-all','2026-07-02 12:00:08','2026-07-02 12:00:08'),
(23,'restrictions-manage-own','2026-07-02 12:00:08','2026-07-02 12:00:08'),
(24,'book-create-all','2026-07-02 12:00:08','2026-07-02 12:00:08'),
(25,'book-create-own','2026-07-02 12:00:08','2026-07-02 12:00:08'),
(26,'book-update-all','2026-07-02 12:00:08','2026-07-02 12:00:08'),
(27,'book-update-own','2026-07-02 12:00:08','2026-07-02 12:00:08'),
(28,'book-delete-all','2026-07-02 12:00:08','2026-07-02 12:00:08'),
(29,'book-delete-own','2026-07-02 12:00:08','2026-07-02 12:00:08'),
(30,'page-create-all','2026-07-02 12:00:08','2026-07-02 12:00:08'),
(31,'page-create-own','2026-07-02 12:00:08','2026-07-02 12:00:08'),
(32,'page-update-all','2026-07-02 12:00:08','2026-07-02 12:00:08'),
(33,'page-update-own','2026-07-02 12:00:08','2026-07-02 12:00:08'),
(34,'page-delete-all','2026-07-02 12:00:08','2026-07-02 12:00:08'),
(35,'page-delete-own','2026-07-02 12:00:08','2026-07-02 12:00:08'),
(36,'chapter-create-all','2026-07-02 12:00:09','2026-07-02 12:00:09'),
(37,'chapter-create-own','2026-07-02 12:00:09','2026-07-02 12:00:09'),
(38,'chapter-update-all','2026-07-02 12:00:09','2026-07-02 12:00:09'),
(39,'chapter-update-own','2026-07-02 12:00:09','2026-07-02 12:00:09'),
(40,'chapter-delete-all','2026-07-02 12:00:09','2026-07-02 12:00:09'),
(41,'chapter-delete-own','2026-07-02 12:00:09','2026-07-02 12:00:09'),
(42,'image-create-all','2026-07-02 12:00:09','2026-07-02 12:00:09'),
(43,'image-create-own','2026-07-02 12:00:09','2026-07-02 12:00:09'),
(44,'image-update-all','2026-07-02 12:00:09','2026-07-02 12:00:09'),
(45,'image-update-own','2026-07-02 12:00:09','2026-07-02 12:00:09'),
(46,'image-delete-all','2026-07-02 12:00:09','2026-07-02 12:00:09'),
(47,'image-delete-own','2026-07-02 12:00:09','2026-07-02 12:00:09'),
(48,'book-view-all','2026-07-02 12:00:14','2026-07-02 12:00:14'),
(49,'book-view-own','2026-07-02 12:00:14','2026-07-02 12:00:14'),
(50,'page-view-all','2026-07-02 12:00:14','2026-07-02 12:00:14'),
(51,'page-view-own','2026-07-02 12:00:15','2026-07-02 12:00:15'),
(52,'chapter-view-all','2026-07-02 12:00:15','2026-07-02 12:00:15'),
(53,'chapter-view-own','2026-07-02 12:00:15','2026-07-02 12:00:15'),
(54,'attachment-create-all','2026-07-02 12:00:21','2026-07-02 12:00:21'),
(55,'attachment-create-own','2026-07-02 12:00:22','2026-07-02 12:00:22'),
(56,'attachment-update-all','2026-07-02 12:00:22','2026-07-02 12:00:22'),
(57,'attachment-update-own','2026-07-02 12:00:22','2026-07-02 12:00:22'),
(58,'attachment-delete-all','2026-07-02 12:00:22','2026-07-02 12:00:22'),
(59,'attachment-delete-own','2026-07-02 12:00:22','2026-07-02 12:00:22'),
(60,'comment-create-all','2026-07-02 12:00:25','2026-07-02 12:00:25'),
(61,'comment-create-own','2026-07-02 12:00:25','2026-07-02 12:00:25'),
(62,'comment-update-all','2026-07-02 12:00:25','2026-07-02 12:00:25'),
(63,'comment-update-own','2026-07-02 12:00:25','2026-07-02 12:00:25'),
(64,'comment-delete-all','2026-07-02 12:00:25','2026-07-02 12:00:25'),
(65,'comment-delete-own','2026-07-02 12:00:25','2026-07-02 12:00:25'),
(66,'bookshelf-view-all','2026-07-02 12:00:31','2026-07-02 12:00:31'),
(67,'bookshelf-view-own','2026-07-02 12:00:31','2026-07-02 12:00:31'),
(68,'bookshelf-create-all','2026-07-02 12:00:31','2026-07-02 12:00:31'),
(69,'bookshelf-create-own','2026-07-02 12:00:32','2026-07-02 12:00:32'),
(70,'bookshelf-update-all','2026-07-02 12:00:32','2026-07-02 12:00:32'),
(71,'bookshelf-update-own','2026-07-02 12:00:32','2026-07-02 12:00:32'),
(72,'bookshelf-delete-all','2026-07-02 12:00:32','2026-07-02 12:00:32'),
(73,'bookshelf-delete-own','2026-07-02 12:00:32','2026-07-02 12:00:32'),
(74,'templates-manage','2026-07-02 12:00:32','2026-07-02 12:00:32'),
(75,'access-api','2026-07-02 12:00:35','2026-07-02 12:00:35'),
(76,'content-export','2026-07-02 12:00:46','2026-07-02 12:00:46'),
(77,'editor-change','2026-07-02 12:00:51','2026-07-02 12:00:51'),
(78,'receive-notifications','2026-07-02 12:00:59','2026-07-02 12:00:59'),
(79,'content-import','2026-07-02 12:01:03','2026-07-02 12:01:03'),
(80,'revision-view-all','2026-07-02 12:01:32','2026-07-02 12:01:32');
/*!40000 ALTER TABLE `role_permissions` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `role_user`
--

DROP TABLE IF EXISTS `role_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_user` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_user_role_id_foreign` (`role_id`),
  CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_user`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `role_user` WRITE;
/*!40000 ALTER TABLE `role_user` DISABLE KEYS */;
INSERT INTO `role_user` VALUES
(1,1),
(2,4);
/*!40000 ALTER TABLE `role_user` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `display_name` varchar(191) DEFAULT NULL,
  `description` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `system_name` varchar(191) NOT NULL,
  `external_auth_id` varchar(180) NOT NULL DEFAULT '',
  `mfa_enforced` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `roles_system_name_index` (`system_name`),
  KEY `roles_external_auth_id_index` (`external_auth_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES
(1,'Admin','Administrator of the whole application','2026-07-02 11:59:57','2026-07-02 11:59:57','admin','',0),
(2,'Editor','User can edit Books, Chapters & Pages','2026-07-02 11:59:57','2026-07-02 11:59:57','','',0),
(3,'Viewer','User can view books & their content behind authentication','2026-07-02 11:59:57','2026-07-02 11:59:57','','',0),
(4,'Public','The role given to public visitors if allowed','2026-07-02 12:00:19','2026-07-02 12:00:19','public','',0);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `search_terms`
--

DROP TABLE IF EXISTS `search_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `search_terms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(180) NOT NULL,
  `entity_type` varchar(100) NOT NULL,
  `entity_id` bigint(20) unsigned NOT NULL,
  `score` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `search_terms_term_index` (`term`),
  KEY `search_terms_entity_type_index` (`entity_type`),
  KEY `search_terms_entity_type_entity_id_index` (`entity_type`,`entity_id`),
  KEY `search_terms_score_index` (`score`)
) ENGINE=InnoDB AUTO_INCREMENT=399 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_terms`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `search_terms` WRITE;
/*!40000 ALTER TABLE `search_terms` DISABLE KEYS */;
INSERT INTO `search_terms` VALUES
(93,'Monitoring','book',1,49),
(94,'Stack','book',1,49),
(95,'Monitoring-Stack','book',1,48),
(96,'Dies','book',1,1),
(97,'ist','book',1,1),
(98,'mein','book',1,1),
(99,'weches','book',1,1),
(100,'aus','book',1,1),
(101,'Grafana','book',1,1),
(102,'Prometheus','book',1,1),
(103,'Node','book',1,1),
(104,'Exporter','book',1,1),
(105,'Node-Exporter','book',1,1),
(106,'und','book',1,1),
(107,'cAdvisor','book',1,1),
(108,'besteht','book',1,1),
(180,'compose','page',2,40),
(181,'yaml','page',2,40),
(182,'compose.yaml','page',2,40),
(183,'services','page',2,1),
(184,'grafana','page',2,1),
(185,'web','page',2,1),
(186,'grafana-web','page',2,1),
(187,'image','page',2,4),
(188,'grafana/grafana','page',2,1),
(189,'networks','page',2,5),
(190,'homelab','page',2,5),
(191,'net','page',2,8),
(192,'homelab-net','page',2,5),
(193,'reverse','page',2,3),
(194,'proxy','page',2,3),
(195,'reverse-proxy-net','page',2,3),
(196,'ports','page',2,4),
(197,'3000','page',2,2),
(198,'volumes','page',2,4),
(199,'/home/renatubuntu/documentation/grafanafiles','page',2,1),
(200,'/var/lib/grafana','page',2,1),
(201,'restart','page',2,4),
(202,'unless','page',2,4),
(203,'stopped','page',2,4),
(204,'unless-stopped','page',2,4),
(205,'prometheus','page',2,1),
(206,'data','page',2,2),
(207,'prometheus-data','page',2,1),
(208,'prom/prometheus','page',2,1),
(209,'9090','page',2,2),
(210,'/home/renatubuntu/documentation/prometheus','page',2,2),
(211,'/home/renatubuntu/documentation/prometheus-data','page',2,1),
(212,'/prometheus','page',2,1),
(213,'config/prometheus','page',2,1),
(214,'yml','page',2,2),
(215,'/home/renatubuntu/documentation/prometheus-config/prometheus.yml','page',2,1),
(216,'/etc/prometheus/prometheus','page',2,1),
(217,'/etc/prometheus/prometheus.yml','page',2,1),
(218,'node','page',2,1),
(219,'exporter','page',2,2),
(220,'node-exporter','page',2,1),
(221,'prom/node','page',2,1),
(222,'prom/node-exporter','page',2,1),
(223,'command','page',2,1),
(224,'path','page',2,3),
(225,'procfs=/host/proc','page',2,1),
(226,'-path.procfs=/host/proc','page',2,1),
(227,'sysfs=/host/sys','page',2,1),
(228,'-path.sysfs=/host/sys','page',2,1),
(229,'rootfs=/rootfs','page',2,1),
(230,'-path.rootfs=/rootfs','page',2,1),
(231,'/proc','page',2,1),
(232,'/host/proc','page',2,1),
(233,'ro','page',2,8),
(234,'/sys','page',2,3),
(235,'/host/sys','page',2,1),
(236,'/','page',2,2),
(237,'/rootfs','page',2,2),
(238,'9100','page',2,2),
(239,'cadvisor','page',2,1),
(240,'gcr','page',2,1),
(241,'io/cadvisor/cadvisor','page',2,1),
(242,'gcr.io/cadvisor/cadvisor','page',2,1),
(243,'privileged','page',2,1),
(244,'true','page',2,2),
(245,'devices','page',2,1),
(246,'/dev/kmsg','page',2,1),
(247,'/var/run','page',2,2),
(248,'/var/lib/docker','page',2,2),
(249,'/dev/disk','page',2,2),
(250,'8080','page',2,2),
(251,'external','page',2,1),
(252,'Local','book',3,49),
(253,'Git','book',3,49),
(254,'|','book',3,48),
(255,'Gitea','book',3,50),
(256,'Stack','book',3,49),
(257,'Gitea-Stack','book',3,49),
(258,'Mein','book',3,1),
(259,'besteht','book',3,1),
(260,'aus','book',3,1),
(261,'und','book',3,1),
(262,'PostgreSQL','book',3,1),
(263,'compose','page',4,40),
(264,'yaml','page',4,40),
(265,'compose.yaml','page',4,40),
(266,'services','page',4,1),
(267,'mariadb','page',4,3),
(268,'datenbank','page',4,1),
(269,'mariadb-datenbank','page',4,1),
(270,'image','page',4,2),
(271,'environment','page',4,2),
(272,'MARIADB_ROOT_PASSWORD=$','page',4,1),
(273,'MARIADB_ROOT_PASSWORD','page',4,1),
(274,'MARIADB_DATABASE=$','page',4,1),
(275,'MARIADB_DATABASE','page',4,1),
(276,'MARIADB_USER=$','page',4,1),
(277,'MARIADB_USER','page',4,1),
(278,'MARIADB_PASSWORD=$','page',4,1),
(279,'MARIADB_PASSWORD','page',4,1),
(280,'ports','page',4,2),
(281,'3306','page',4,2),
(282,'volumes','page',4,2),
(283,'/home/renatubuntu/documentation/docker','page',4,2),
(284,'compose2/bookstack','page',4,2),
(285,'/home/renatubuntu/documentation/docker-compose2/bookstack-mariadb','page',4,1),
(286,'/var/lib/mysql','page',4,1),
(287,'restart','page',4,2),
(288,'unless','page',4,2),
(289,'stopped','page',4,2),
(290,'unless-stopped','page',4,2),
(291,'networks','page',4,3),
(292,'homelab','page',4,3),
(293,'net','page',4,5),
(294,'homelab-net','page',4,3),
(295,'bookstack','page',4,1),
(296,'app','page',4,2),
(297,'bookstack-app','page',4,1),
(298,'linuxserver/bookstack','page',4,1),
(299,'APP_URL=$','page',4,1),
(300,'APP_URL','page',4,1),
(301,'APP_KEY=$','page',4,1),
(302,'APP_KEY','page',4,1),
(303,'DB_HOST=$','page',4,1),
(304,'DB_HOST','page',4,1),
(305,'DB_DATABASE=$','page',4,1),
(306,'DB_DATABASE','page',4,1),
(307,'DB_USER=$','page',4,1),
(308,'DB_USER','page',4,1),
(309,'DB_PASS=$','page',4,1),
(310,'DB_PASS','page',4,1),
(311,'DB_PORT=$','page',4,1),
(312,'DB_PORT','page',4,1),
(313,'6875','page',4,1),
(314,'80','page',4,1),
(315,'/home/renatubuntu/documentation/docker-compose2/bookstack-app','page',4,1),
(316,'/config','page',4,1),
(317,'reverse','page',4,2),
(318,'proxy','page',4,2),
(319,'reverse-proxy-net','page',4,2),
(320,'external','page',4,1),
(321,'true','page',4,1),
(322,'Nginx','book',5,50),
(323,'Stack','book',5,49),
(324,'Nginx-Stack','book',5,48),
(325,'Bei','book',5,1),
(326,'meinen','book',5,1),
(327,'läuft','book',5,1),
(328,'nur','book',5,1),
(329,'ein','book',5,1),
(330,'Container','book',5,1),
(331,'dieser','book',5,1),
(332,'kann','book',5,1),
(333,'auch','book',5,1),
(334,'durch','book',5,1),
(335,'http','book',5,1),
(336,'//nginx','book',5,1),
(337,'web','book',5,1),
(338,'renatubuntu','book',5,1),
(339,'//nginx-web.renatubuntu','book',5,1),
(340,'dank','book',5,1),
(341,'dem','book',5,1),
(342,'Reverse','book',5,1),
(343,'Proxy','book',5,1),
(344,'Reverse-Proxy','book',5,1),
(345,'erreicht','book',5,1),
(346,'werden','book',5,1),
(347,'?','book',5,1),
(348,'compose','page',6,40),
(349,'yaml','page',6,40),
(350,'compose.yaml','page',6,40),
(351,'services','page',6,1),
(352,'nginx','page',6,2),
(353,'web','page',6,1),
(354,'server','page',6,1),
(355,'nginx-web-server','page',6,1),
(356,'image','page',6,1),
(357,'ports','page',6,1),
(358,'443','page',6,2),
(359,'volumes','page',6,1),
(360,'/home/renatubuntu/documentation/docker','page',6,2),
(361,'compose5/nginx','page',6,1),
(362,'config','page',6,1),
(363,'/home/renatubuntu/documentation/docker-compose5/nginx-config','page',6,1),
(364,'/etc/nginx/conf','page',6,1),
(365,'d','page',6,1),
(366,'/etc/nginx/conf.d','page',6,1),
(367,'compose5/Webserver','page',6,1),
(368,'/home/renatubuntu/documentation/docker-compose5/Webserver','page',6,1),
(369,'/usr/share/nginx/html','page',6,1),
(370,'networks','page',6,2),
(371,'homelab','page',6,2),
(372,'net','page',6,4),
(373,'homelab-net','page',6,2),
(374,'reverse','page',6,2),
(375,'proxy','page',6,2),
(376,'reverse-proxy-net','page',6,2),
(377,'restart','page',6,1),
(378,'unless','page',6,1),
(379,'stopped','page',6,1),
(380,'unless-stopped','page',6,1),
(381,'external','page',6,1),
(382,'true','page',6,1),
(383,'Docker','book',7,48),
(384,'Back','book',7,48),
(385,'Up','book',7,48),
(386,'Hallo','book',7,1),
(387,'Zukunfts','book',7,1),
(388,'Renat','book',7,1),
(389,'\r','book',7,1),
(390,'Zukunfts-Renat.\r','book',7,1),
(391,'Wenn','book',7,1),
(392,'du','book',7,1),
(393,'das','book',7,1),
(394,'lesen','book',7,1),
(395,'kannst','book',7,1),
(396,'funktioniert','book',7,1),
(397,'dein','book',7,1),
(398,'Backup','book',7,1);
/*!40000 ALTER TABLE `search_terms` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(191) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` text NOT NULL,
  `last_activity` int(11) NOT NULL,
  UNIQUE KEY `sessions_id_unique` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `setting_key` varchar(191) NOT NULL,
  `value` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` varchar(50) NOT NULL DEFAULT 'string',
  PRIMARY KEY (`setting_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES
('instance-id','aca19f40-e474-465b-95af-029fd1251698','2026-07-02 12:01:04','2026-07-02 12:01:04','string'),
('user:1:language','en','2026-07-03 19:36:33','2026-07-03 19:36:33','string');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `slug_history`
--

DROP TABLE IF EXISTS `slug_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `slug_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sluggable_type` varchar(10) NOT NULL,
  `sluggable_id` bigint(20) unsigned NOT NULL,
  `slug` varchar(191) NOT NULL,
  `parent_slug` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `slug_history_sluggable_type_index` (`sluggable_type`),
  KEY `slug_history_sluggable_id_index` (`sluggable_id`),
  KEY `slug_history_slug_index` (`slug`),
  KEY `slug_history_parent_slug_index` (`parent_slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slug_history`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `slug_history` WRITE;
/*!40000 ALTER TABLE `slug_history` DISABLE KEYS */;
INSERT INTO `slug_history` VALUES
(1,'page',2,'new-page','monitoring-stack','2026-07-06 16:02:48','2026-07-06 16:02:48');
/*!40000 ALTER TABLE `slug_history` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `social_accounts`
--

DROP TABLE IF EXISTS `social_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_accounts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `driver` varchar(191) NOT NULL,
  `driver_id` varchar(191) NOT NULL,
  `avatar` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `social_accounts_user_id_index` (`user_id`),
  KEY `social_accounts_driver_index` (`driver`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_accounts`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `social_accounts` WRITE;
/*!40000 ALTER TABLE `social_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_accounts` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `sort_rules`
--

DROP TABLE IF EXISTS `sort_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sort_rules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `sequence` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sort_rules`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `sort_rules` WRITE;
/*!40000 ALTER TABLE `sort_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `sort_rules` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` bigint(20) unsigned NOT NULL,
  `entity_type` varchar(100) NOT NULL,
  `name` varchar(191) NOT NULL,
  `value` varchar(191) NOT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tags_name_index` (`name`),
  KEY `tags_value_index` (`value`),
  KEY `tags_order_index` (`order`),
  KEY `tags_entity_id_entity_type_index` (`entity_id`,`entity_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `user_invites`
--

DROP TABLE IF EXISTS `user_invites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_invites` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_invites_user_id_index` (`user_id`),
  KEY `user_invites_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_invites`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `user_invites` WRITE;
/*!40000 ALTER TABLE `user_invites` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_invites` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `password` varchar(60) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `email_confirmed` tinyint(1) NOT NULL DEFAULT 1,
  `image_id` int(11) NOT NULL DEFAULT 0,
  `external_auth_id` varchar(191) NOT NULL,
  `system_name` varchar(191) DEFAULT NULL,
  `slug` varchar(180) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_slug_unique` (`slug`),
  KEY `users_external_auth_id_index` (`external_auth_id`),
  KEY `users_system_name_index` (`system_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES
(1,'Admin','admin@renatubuntu.local','$2y$12$1nW2v5kWKiSA4UXa/bj/r.Lk8ZsSVBjgoqa7ADnXny1tNsed9tww6','S7cY2rQz92f4s3WnPhi05QOSJ1PocHEMIZa2jPaUva55xQ1yaNiN6oXtf9nI','2026-07-02 11:59:52','2026-07-03 19:36:33',1,0,'',NULL,'admin'),
(2,'Guest','guest@example.com','',NULL,'2026-07-02 12:00:21','2026-07-02 12:00:21',1,0,'','public','guest');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `views`
--

DROP TABLE IF EXISTS `views`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `views` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `viewable_id` bigint(20) unsigned NOT NULL,
  `viewable_type` varchar(191) NOT NULL,
  `views` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `views_user_id_index` (`user_id`),
  KEY `views_viewable_id_index` (`viewable_id`),
  KEY `views_updated_at_index` (`updated_at`),
  KEY `views_viewable_type_index` (`viewable_type`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `views`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `views` WRITE;
/*!40000 ALTER TABLE `views` DISABLE KEYS */;
INSERT INTO `views` VALUES
(1,1,1,'book',9,'2026-07-06 16:00:27','2026-07-06 16:03:24'),
(2,1,2,'page',3,'2026-07-06 16:02:33','2026-07-06 16:03:19'),
(3,1,3,'book',2,'2026-07-06 16:05:24','2026-07-06 16:05:27'),
(4,1,4,'page',1,'2026-07-06 16:05:42','2026-07-06 16:05:42'),
(5,1,5,'book',2,'2026-07-06 16:10:55','2026-07-06 16:10:59'),
(6,1,6,'page',1,'2026-07-06 16:11:16','2026-07-06 16:11:16'),
(7,1,7,'book',1,'2026-07-06 16:15:10','2026-07-06 16:15:10');
/*!40000 ALTER TABLE `views` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `watches`
--

DROP TABLE IF EXISTS `watches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `watches` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `watchable_id` bigint(20) unsigned NOT NULL,
  `watchable_type` varchar(100) NOT NULL,
  `level` tinyint(3) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `watchable_index` (`watchable_id`,`watchable_type`),
  KEY `watches_user_id_index` (`user_id`),
  KEY `watches_level_index` (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watches`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `watches` WRITE;
/*!40000 ALTER TABLE `watches` DISABLE KEYS */;
/*!40000 ALTER TABLE `watches` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `webhook_tracked_events`
--

DROP TABLE IF EXISTS `webhook_tracked_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `webhook_tracked_events` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `webhook_id` int(11) NOT NULL,
  `event` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `webhook_tracked_events_event_index` (`event`),
  KEY `webhook_tracked_events_webhook_id_index` (`webhook_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webhook_tracked_events`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `webhook_tracked_events` WRITE;
/*!40000 ALTER TABLE `webhook_tracked_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `webhook_tracked_events` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `webhooks`
--

DROP TABLE IF EXISTS `webhooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `webhooks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `endpoint` varchar(500) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `timeout` int(10) unsigned NOT NULL DEFAULT 3,
  `last_error` text NOT NULL DEFAULT '',
  `last_called_at` timestamp NULL DEFAULT NULL,
  `last_errored_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `webhooks_name_index` (`name`),
  KEY `webhooks_active_index` (`active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webhooks`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `webhooks` WRITE;
/*!40000 ALTER TABLE `webhooks` DISABLE KEYS */;
/*!40000 ALTER TABLE `webhooks` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2026-07-11 13:07:38
