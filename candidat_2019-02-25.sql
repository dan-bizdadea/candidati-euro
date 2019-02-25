-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: localhost    Database: candidati
-- ------------------------------------------------------
-- Server version	5.7.24-0ubuntu0.18.04.1

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
-- Table structure for table `candidates`
--

DROP TABLE IF EXISTS `candidates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `party_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `candidates_party_id_foreign` (`party_id`),
  CONSTRAINT `candidates_party_id_foreign` FOREIGN KEY (`party_id`) REFERENCES `parties` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidates`
--

LOCK TABLES `candidates` WRITE;
/*!40000 ALTER TABLE `candidates` DISABLE KEYS */;
INSERT INTO `candidates` VALUES (1,'Cristian','Ghinea',1,NULL,NULL),(2,'Clotilde-Marie-Brigitte','Armand',1,NULL,NULL),(3,'Nicolae Bogdănel','Ștefănuță',1,NULL,NULL),(4,'Vlad-Marius','Botoș',1,NULL,NULL),(5,'Vlad-Dan','Gheorghe',1,NULL,NULL),(6,'Anamaria Naomi','Reniuț',1,NULL,NULL),(7,'Radu-Ionuț','Ghelmez',1,NULL,NULL),(8,'Radu Nicolae','Mihaiu',1,NULL,NULL),(9,'Iulian Ștefan','Lorincz',1,NULL,NULL),(10,'Adriana','Cristian',1,NULL,NULL),(11,'Camelia Carmen','Crișan',1,NULL,NULL),(12,'George','Ţăranu',1,NULL,NULL),(15,'Silviu-Octavian','Gurlui',1,NULL,NULL),(16,'Teodora','Stoian',1,NULL,NULL),(17,'Alexandru-Gabriel','Vărzaru',1,NULL,NULL),(18,'Raluca','Amariei',1,NULL,NULL),(19,'Miroslav-Valeriu','Tașcu-Stavre',1,NULL,NULL),(20,'Florin','Andrei',1,NULL,NULL),(23,'Emanuel Ioan','Stoica',1,NULL,NULL),(24,'Octavian Alexandru','Berceanu',1,NULL,NULL),(25,'Cristina-Ionela','Iurișniți',1,NULL,NULL),(26,'Elena','Uram',1,NULL,NULL),(27,'Ruxandra','Diaconu',1,NULL,NULL),(28,'Virgil-Cristian ','Petrea',1,NULL,NULL),(29,'Nicolae Mihai','Șvab',1,NULL,NULL),(30,'Narcis George','Matache',1,NULL,NULL),(31,'Ionuț-Cătălin','Stancu',1,NULL,NULL),(32,'Adrian','Niță',1,NULL,NULL),(33,'Ileana-Lavinia','Andrei',1,NULL,NULL),(34,'Oana','Iacob',1,NULL,NULL),(35,'Ioana Laura','Cucoș',1,NULL,NULL),(36,'Cristian','Dragnea',1,NULL,NULL),(37,'Ciprian','Lupaș',1,NULL,NULL),(38,'Veronica-Lenuța','Enuscă',1,NULL,NULL),(39,'Aurora','Tranescu',1,NULL,NULL),(40,'Alexandru Cristian','Surcel',1,NULL,NULL),(41,'Sebastian','Cernic',1,NULL,NULL),(42,'Dragoș Lucian','Ivan',1,NULL,NULL),(43,'Mihai Andrei','Tănăsescu',1,NULL,NULL),(44,'Dorin Ionuț','Vintilă',1,NULL,NULL),(45,'Alin','Buzdugan',1,NULL,NULL),(46,'Marcel-Florin','Tărăbuță',1,NULL,NULL),(47,'Radu Tudor','Ciornei',1,NULL,NULL);
/*!40000 ALTER TABLE `candidates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `candidatescores`
--

DROP TABLE IF EXISTS `candidatescores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidatescores` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `candidate_id` int(10) unsigned NOT NULL,
  `criterion_id` int(10) unsigned NOT NULL,
  `score` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `candidatescores_candidate_id_foreign` (`candidate_id`),
  KEY `candidatescores_criterion_id_foreign` (`criterion_id`),
  CONSTRAINT `candidatescores_candidate_id_foreign` FOREIGN KEY (`candidate_id`) REFERENCES `candidates` (`id`),
  CONSTRAINT `candidatescores_criterion_id_foreign` FOREIGN KEY (`criterion_id`) REFERENCES `criteria` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=244 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidatescores`
--

LOCK TABLES `candidatescores` WRITE;
/*!40000 ALTER TABLE `candidatescores` DISABLE KEYS */;
INSERT INTO `candidatescores` VALUES (24,25,5,1,2,'2019-02-03 00:08:30','2019-02-03 00:09:04'),(25,25,5,2,1,'2019-02-03 00:08:30','2019-02-03 00:09:04'),(26,25,5,3,3,'2019-02-03 00:08:30','2019-02-03 00:08:30'),(27,25,5,4,0,'2019-02-03 00:08:30','2019-02-03 00:08:30'),(28,25,5,5,1,'2019-02-03 00:08:30','2019-02-03 00:08:30'),(29,25,5,6,0,'2019-02-03 00:08:30','2019-02-03 00:08:30'),(30,25,5,7,0,'2019-02-03 00:08:30','2019-02-03 00:08:30'),(31,25,5,8,1,'2019-02-03 00:08:30','2019-02-03 00:08:43'),(32,25,5,9,0,'2019-02-03 00:08:30','2019-02-03 00:08:30'),(33,25,5,10,2,'2019-02-03 00:08:30','2019-02-03 00:09:04'),(34,25,5,12,2,'2019-02-03 00:08:30','2019-02-03 00:09:04'),(35,25,1,1,1,'2019-02-03 00:09:27','2019-02-03 00:09:27'),(36,25,1,2,2,'2019-02-03 00:09:27','2019-02-03 00:09:27'),(37,25,1,3,4,'2019-02-03 00:09:27','2019-02-03 00:09:27'),(38,25,1,4,1,'2019-02-03 00:09:27','2019-02-03 00:09:27'),(39,25,1,5,0,'2019-02-03 00:09:27','2019-02-03 00:09:27'),(40,25,1,6,0,'2019-02-03 00:09:27','2019-02-03 00:09:27'),(41,25,1,7,0,'2019-02-03 00:09:27','2019-02-03 00:09:27'),(42,25,1,8,0,'2019-02-03 00:09:27','2019-02-03 00:09:27'),(43,25,1,9,0,'2019-02-03 00:09:27','2019-02-03 00:09:27'),(44,25,1,10,0,'2019-02-03 00:09:27','2019-02-03 00:09:27'),(45,25,1,12,0,'2019-02-03 00:09:27','2019-02-03 00:09:27'),(46,25,2,1,3,'2019-02-03 00:09:46','2019-02-03 00:09:46'),(47,25,2,2,2,'2019-02-03 00:09:46','2019-02-03 00:09:46'),(48,25,2,3,3,'2019-02-03 00:09:46','2019-02-03 00:09:46'),(49,25,2,4,5,'2019-02-03 00:09:46','2019-02-03 00:09:46'),(50,25,2,5,5,'2019-02-03 00:09:46','2019-02-03 00:09:46'),(51,25,2,6,0,'2019-02-03 00:09:46','2019-02-03 00:09:46'),(52,25,2,7,0,'2019-02-03 00:09:46','2019-02-03 00:09:46'),(53,25,2,8,0,'2019-02-03 00:09:46','2019-02-03 00:09:46'),(54,25,2,9,0,'2019-02-03 00:09:46','2019-02-03 00:09:46'),(55,25,2,10,1,'2019-02-03 00:09:46','2019-02-03 00:27:29'),(56,25,2,12,1,'2019-02-03 00:09:46','2019-02-03 00:27:29'),(57,27,1,1,4,'2019-02-04 21:04:37','2019-02-04 21:05:28'),(58,27,1,2,2,'2019-02-04 21:04:37','2019-02-04 21:04:37'),(59,27,1,3,3,'2019-02-04 21:04:37','2019-02-04 21:04:37'),(60,27,1,4,0,'2019-02-04 21:04:37','2019-02-04 21:04:37'),(61,27,1,5,0,'2019-02-04 21:04:37','2019-02-04 21:04:37'),(62,27,1,6,0,'2019-02-04 21:04:37','2019-02-04 21:04:37'),(63,27,1,7,0,'2019-02-04 21:04:37','2019-02-04 21:04:37'),(64,27,1,8,0,'2019-02-04 21:04:37','2019-02-04 21:04:37'),(65,27,1,9,0,'2019-02-04 21:04:37','2019-02-04 21:04:37'),(66,27,1,10,0,'2019-02-04 21:04:37','2019-02-04 21:04:37'),(67,27,1,12,0,'2019-02-04 21:04:37','2019-02-04 21:04:37'),(68,27,2,1,5,'2019-02-04 21:05:20','2019-02-04 21:05:20'),(69,27,2,2,5,'2019-02-04 21:05:20','2019-02-04 21:05:20'),(70,27,2,3,0,'2019-02-04 21:05:20','2019-02-04 21:05:20'),(71,27,2,4,0,'2019-02-04 21:05:20','2019-02-04 21:05:20'),(72,27,2,5,0,'2019-02-04 21:05:20','2019-02-04 21:05:20'),(73,27,2,6,0,'2019-02-04 21:05:20','2019-02-04 21:05:20'),(74,27,2,7,0,'2019-02-04 21:05:20','2019-02-04 21:05:20'),(75,27,2,8,0,'2019-02-04 21:05:20','2019-02-04 21:05:20'),(76,27,2,9,0,'2019-02-04 21:05:20','2019-02-04 21:05:20'),(77,27,2,10,0,'2019-02-04 21:05:20','2019-02-04 21:05:20'),(78,27,2,12,0,'2019-02-04 21:05:20','2019-02-04 21:05:20'),(79,28,1,1,1,'2019-02-24 19:56:55','2019-02-24 19:56:55'),(80,28,1,2,3,'2019-02-24 19:56:55','2019-02-24 19:56:55'),(81,28,1,3,2,'2019-02-24 19:56:55','2019-02-24 19:56:55'),(82,28,1,4,2,'2019-02-24 19:56:55','2019-02-24 22:22:18'),(83,28,1,5,4,'2019-02-24 19:56:55','2019-02-24 22:22:18'),(84,28,1,6,0,'2019-02-24 19:56:55','2019-02-24 19:56:55'),(85,28,1,7,0,'2019-02-24 19:56:55','2019-02-24 19:56:55'),(86,28,1,8,0,'2019-02-24 19:56:55','2019-02-24 19:56:55'),(87,28,1,9,0,'2019-02-24 19:56:55','2019-02-24 19:56:55'),(88,28,1,10,0,'2019-02-24 19:56:55','2019-02-24 19:56:55'),(89,28,1,12,0,'2019-02-24 19:56:55','2019-02-24 19:56:55'),(90,28,6,1,1,'2019-02-24 19:56:55','2019-02-24 20:04:40'),(91,28,6,2,1,'2019-02-24 19:56:55','2019-02-24 20:04:40'),(92,28,6,3,1,'2019-02-24 19:56:55','2019-02-24 20:04:40'),(93,28,6,4,0,'2019-02-24 19:56:55','2019-02-24 19:56:55'),(94,28,6,5,0,'2019-02-24 19:56:55','2019-02-24 19:56:55'),(95,28,6,6,0,'2019-02-24 19:56:55','2019-02-24 19:56:55'),(96,28,6,7,0,'2019-02-24 19:56:55','2019-02-24 19:56:55'),(97,28,6,8,0,'2019-02-24 19:56:55','2019-02-24 19:56:55'),(98,28,6,9,0,'2019-02-24 19:56:55','2019-02-24 19:56:55'),(99,28,6,10,0,'2019-02-24 19:56:55','2019-02-24 19:56:55'),(100,28,6,12,0,'2019-02-24 19:56:55','2019-02-24 19:56:55'),(101,28,3,1,1,'2019-02-24 20:03:24','2019-02-24 20:04:32'),(102,28,3,2,1,'2019-02-24 20:03:24','2019-02-24 20:04:32'),(103,28,3,3,2,'2019-02-24 20:03:24','2019-02-24 20:08:13'),(104,28,3,4,5,'2019-02-24 20:03:24','2019-02-24 20:11:49'),(105,28,3,5,3,'2019-02-24 20:03:24','2019-02-24 20:11:49'),(106,28,3,6,1,'2019-02-24 20:03:24','2019-02-24 20:11:49'),(107,28,3,7,3,'2019-02-24 20:03:24','2019-02-24 20:11:49'),(108,28,3,8,4,'2019-02-24 20:03:24','2019-02-24 20:11:49'),(109,28,3,9,4,'2019-02-24 20:03:24','2019-02-24 20:11:49'),(110,28,3,10,5,'2019-02-24 20:03:24','2019-02-24 20:11:49'),(111,28,3,12,3,'2019-02-24 20:03:24','2019-02-24 20:11:49'),(112,28,2,1,3,'2019-02-24 20:03:26','2019-02-24 20:09:13'),(113,28,2,2,3,'2019-02-24 20:03:26','2019-02-24 20:09:13'),(114,28,2,3,3,'2019-02-24 20:03:26','2019-02-24 20:09:13'),(115,28,2,4,5,'2019-02-24 20:03:26','2019-02-24 23:52:11'),(116,28,2,5,4,'2019-02-24 20:03:26','2019-02-24 22:50:35'),(117,28,2,6,1,'2019-02-24 20:03:26','2019-02-24 22:50:35'),(118,28,2,7,4,'2019-02-24 20:03:26','2019-02-24 22:50:35'),(119,28,2,8,5,'2019-02-24 20:03:26','2019-02-24 23:52:11'),(120,28,2,9,5,'2019-02-24 20:03:26','2019-02-24 23:52:11'),(121,28,2,10,5,'2019-02-24 20:03:26','2019-02-24 23:52:11'),(122,28,2,12,3,'2019-02-24 20:03:26','2019-02-24 23:52:11'),(123,28,4,1,1,'2019-02-24 20:03:30','2019-02-24 20:04:37'),(124,28,4,2,1,'2019-02-24 20:03:30','2019-02-24 20:04:37'),(125,28,4,3,1,'2019-02-24 20:03:30','2019-02-24 20:04:37'),(126,28,4,4,3,'2019-02-24 20:03:30','2019-02-24 23:50:54'),(127,28,4,5,4,'2019-02-24 20:03:30','2019-02-24 23:50:54'),(128,28,4,6,5,'2019-02-24 20:03:30','2019-02-24 23:50:54'),(129,28,4,7,2,'2019-02-24 20:03:30','2019-02-24 23:50:54'),(130,28,4,8,3,'2019-02-24 20:03:30','2019-02-24 23:50:54'),(131,28,4,9,3,'2019-02-24 20:03:30','2019-02-24 23:50:54'),(132,28,4,10,4,'2019-02-24 20:03:30','2019-02-24 23:50:54'),(133,28,4,12,5,'2019-02-24 20:03:30','2019-02-24 23:50:54'),(134,28,5,1,1,'2019-02-24 20:03:31','2019-02-24 20:04:38'),(135,28,5,2,1,'2019-02-24 20:03:31','2019-02-24 20:04:38'),(136,28,5,3,1,'2019-02-24 20:03:31','2019-02-24 20:04:38'),(137,28,5,4,3,'2019-02-24 20:03:31','2019-02-24 23:51:41'),(138,28,5,5,5,'2019-02-24 20:03:31','2019-02-24 23:51:41'),(139,28,5,6,5,'2019-02-24 20:03:31','2019-02-24 23:51:41'),(140,28,5,7,4,'2019-02-24 20:03:31','2019-02-24 23:51:41'),(141,28,5,8,2,'2019-02-24 20:03:31','2019-02-24 23:51:41'),(142,28,5,9,3,'2019-02-24 20:03:31','2019-02-24 23:51:41'),(143,28,5,10,1,'2019-02-24 20:03:31','2019-02-24 23:51:41'),(144,28,5,12,1,'2019-02-24 20:03:31','2019-02-24 23:51:41'),(145,28,12,1,1,'2019-02-24 20:04:39','2019-02-24 20:04:39'),(146,28,12,2,1,'2019-02-24 20:04:39','2019-02-24 20:04:39'),(147,28,12,3,1,'2019-02-24 20:04:39','2019-02-24 20:04:39'),(148,28,12,4,0,'2019-02-24 20:04:39','2019-02-24 20:04:39'),(149,28,12,5,0,'2019-02-24 20:04:39','2019-02-24 20:04:39'),(150,28,12,6,0,'2019-02-24 20:04:39','2019-02-24 20:04:39'),(151,28,12,7,0,'2019-02-24 20:04:39','2019-02-24 20:04:39'),(152,28,12,8,0,'2019-02-24 20:04:39','2019-02-24 20:04:39'),(153,28,12,9,0,'2019-02-24 20:04:39','2019-02-24 20:04:39'),(154,28,12,10,0,'2019-02-24 20:04:39','2019-02-24 20:04:39'),(155,28,12,12,0,'2019-02-24 20:04:39','2019-02-24 20:04:39'),(156,28,17,1,5,'2019-02-24 20:10:33','2019-02-24 20:10:33'),(157,28,17,2,5,'2019-02-24 20:10:33','2019-02-24 20:10:33'),(158,28,17,3,5,'2019-02-24 20:10:33','2019-02-24 20:10:33'),(159,28,17,4,0,'2019-02-24 20:10:33','2019-02-24 20:10:33'),(160,28,17,5,0,'2019-02-24 20:10:33','2019-02-24 20:10:33'),(161,28,17,6,0,'2019-02-24 20:10:33','2019-02-24 20:10:33'),(162,28,17,7,0,'2019-02-24 20:10:33','2019-02-24 20:10:33'),(163,28,17,8,0,'2019-02-24 20:10:33','2019-02-24 20:10:33'),(164,28,17,9,0,'2019-02-24 20:10:33','2019-02-24 20:10:33'),(165,28,17,10,0,'2019-02-24 20:10:33','2019-02-24 20:10:33'),(166,28,17,12,0,'2019-02-24 20:10:33','2019-02-24 20:10:33'),(167,28,15,1,4,'2019-02-24 20:10:56','2019-02-24 20:10:56'),(168,28,15,2,4,'2019-02-24 20:10:56','2019-02-24 20:10:56'),(169,28,15,3,4,'2019-02-24 20:10:56','2019-02-24 20:10:56'),(170,28,15,4,2,'2019-02-24 20:10:56','2019-02-24 20:11:49'),(171,28,15,5,3,'2019-02-24 20:10:56','2019-02-24 20:11:49'),(172,28,15,6,4,'2019-02-24 20:10:56','2019-02-24 20:11:49'),(173,28,15,7,5,'2019-02-24 20:10:56','2019-02-24 20:11:49'),(174,28,15,8,2,'2019-02-24 20:10:56','2019-02-24 20:11:49'),(175,28,15,9,3,'2019-02-24 20:10:56','2019-02-24 20:11:49'),(176,28,15,10,4,'2019-02-24 20:10:56','2019-02-24 20:11:49'),(177,28,15,12,5,'2019-02-24 20:10:56','2019-02-24 20:11:49'),(178,28,10,1,0,'2019-02-24 22:13:54','2019-02-24 22:13:54'),(179,28,10,2,0,'2019-02-24 22:13:54','2019-02-24 22:13:54'),(180,28,10,3,0,'2019-02-24 22:13:54','2019-02-24 22:13:54'),(181,28,10,4,0,'2019-02-24 22:13:54','2019-02-24 22:13:54'),(182,28,10,5,0,'2019-02-24 22:13:54','2019-02-24 22:13:54'),(183,28,10,6,0,'2019-02-24 22:13:54','2019-02-24 22:13:54'),(184,28,10,7,0,'2019-02-24 22:13:54','2019-02-24 22:13:54'),(185,28,10,8,0,'2019-02-24 22:13:54','2019-02-24 22:13:54'),(186,28,10,9,0,'2019-02-24 22:13:54','2019-02-24 22:13:54'),(187,28,10,10,0,'2019-02-24 22:13:54','2019-02-24 22:13:54'),(188,28,10,12,0,'2019-02-24 22:13:54','2019-02-24 22:13:54'),(189,28,7,1,0,'2019-02-24 22:30:06','2019-02-24 22:30:06'),(190,28,7,2,0,'2019-02-24 22:30:06','2019-02-24 22:30:06'),(191,28,7,3,0,'2019-02-24 22:30:06','2019-02-24 22:30:06'),(192,28,7,4,0,'2019-02-24 22:30:06','2019-02-24 22:30:06'),(193,28,7,5,0,'2019-02-24 22:30:06','2019-02-24 22:30:06'),(194,28,7,6,0,'2019-02-24 22:30:06','2019-02-24 22:30:06'),(195,28,7,7,0,'2019-02-24 22:30:06','2019-02-24 22:30:06'),(196,28,7,8,0,'2019-02-24 22:30:06','2019-02-24 22:30:06'),(197,28,7,9,0,'2019-02-24 22:30:06','2019-02-24 22:30:06'),(198,28,7,10,0,'2019-02-24 22:30:06','2019-02-24 22:30:06'),(199,28,7,12,0,'2019-02-24 22:30:06','2019-02-24 22:30:06'),(200,28,11,1,1,'2019-02-24 22:50:35','2019-02-24 22:50:35'),(201,28,11,2,3,'2019-02-24 22:50:35','2019-02-24 22:50:35'),(202,28,11,3,4,'2019-02-24 22:50:35','2019-02-24 22:50:35'),(203,28,11,4,0,'2019-02-24 22:50:35','2019-02-24 22:50:35'),(204,28,11,5,3,'2019-02-24 22:50:35','2019-02-24 22:50:35'),(205,28,11,6,2,'2019-02-24 22:50:35','2019-02-24 22:50:35'),(206,28,11,7,0,'2019-02-24 22:50:35','2019-02-24 22:50:35'),(207,28,11,8,0,'2019-02-24 22:50:35','2019-02-24 22:50:35'),(208,28,11,9,0,'2019-02-24 22:50:35','2019-02-24 22:50:35'),(209,28,11,10,0,'2019-02-24 22:50:35','2019-02-24 22:50:35'),(210,28,11,12,0,'2019-02-24 22:50:35','2019-02-24 22:50:35'),(211,28,8,1,5,'2019-02-24 23:49:00','2019-02-24 23:50:54'),(212,28,8,2,1,'2019-02-24 23:49:00','2019-02-24 23:50:54'),(213,28,8,3,3,'2019-02-24 23:49:00','2019-02-24 23:50:54'),(214,28,8,4,3,'2019-02-24 23:49:00','2019-02-24 23:50:54'),(215,28,8,5,3,'2019-02-24 23:49:00','2019-02-24 23:50:54'),(216,28,8,6,3,'2019-02-24 23:49:00','2019-02-24 23:50:54'),(217,28,8,7,4,'2019-02-24 23:49:00','2019-02-24 23:50:54'),(218,28,8,8,2,'2019-02-24 23:49:00','2019-02-24 23:50:54'),(219,28,8,9,4,'2019-02-24 23:49:00','2019-02-24 23:50:54'),(220,28,8,10,5,'2019-02-24 23:49:00','2019-02-24 23:50:54'),(221,28,8,12,2,'2019-02-24 23:49:00','2019-02-24 23:50:54'),(222,29,3,1,0,'2019-02-25 09:36:00','2019-02-25 09:36:00'),(223,29,1,1,0,'2019-02-25 09:36:00','2019-02-25 09:36:00'),(224,29,3,2,0,'2019-02-25 09:36:00','2019-02-25 09:36:00'),(225,29,1,2,0,'2019-02-25 09:36:00','2019-02-25 09:36:00'),(226,29,3,3,0,'2019-02-25 09:36:00','2019-02-25 09:36:00'),(227,29,1,3,0,'2019-02-25 09:36:00','2019-02-25 09:36:00'),(228,29,3,4,0,'2019-02-25 09:36:00','2019-02-25 09:36:00'),(229,29,1,4,0,'2019-02-25 09:36:00','2019-02-25 09:36:00'),(230,29,3,5,0,'2019-02-25 09:36:00','2019-02-25 09:36:00'),(231,29,1,5,0,'2019-02-25 09:36:00','2019-02-25 09:36:00'),(232,29,1,6,0,'2019-02-25 09:36:00','2019-02-25 09:36:00'),(233,29,3,6,0,'2019-02-25 09:36:00','2019-02-25 09:36:00'),(234,29,1,7,0,'2019-02-25 09:36:00','2019-02-25 09:36:00'),(235,29,3,7,0,'2019-02-25 09:36:00','2019-02-25 09:36:00'),(236,29,3,8,0,'2019-02-25 09:36:00','2019-02-25 09:36:00'),(237,29,1,8,0,'2019-02-25 09:36:00','2019-02-25 09:36:00'),(238,29,1,9,0,'2019-02-25 09:36:00','2019-02-25 09:36:00'),(239,29,3,9,0,'2019-02-25 09:36:00','2019-02-25 09:36:00'),(240,29,1,10,0,'2019-02-25 09:36:00','2019-02-25 09:36:00'),(241,29,3,10,0,'2019-02-25 09:36:00','2019-02-25 09:36:00'),(242,29,1,12,0,'2019-02-25 09:36:00','2019-02-25 09:36:00'),(243,29,3,12,0,'2019-02-25 09:36:00','2019-02-25 09:36:00');
/*!40000 ALTER TABLE `candidatescores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `criteria`
--

DROP TABLE IF EXISTS `criteria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `criteria` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `criteria`
--

LOCK TABLES `criteria` WRITE;
/*!40000 ALTER TABLE `criteria` DISABLE KEYS */;
INSERT INTO `criteria` VALUES (1,'Cunoasterea functionarii Uniunii Europene',NULL,NULL),(2,'Cunoasterea limbilor de circulatie internationala',NULL,NULL),(3,'Experienta profesionala',NULL,NULL),(4,'Educatie',NULL,NULL),(5,'Leadership',NULL,NULL),(6,'Gandire critica',NULL,NULL),(7,'Integritate/Onestitate',NULL,NULL),(8,'Calitate a comunicarii si dezbaterii',NULL,NULL),(9,'Respect',NULL,NULL),(10,'Viziune politica si ideologie',NULL,NULL),(12,'Efortul si calitatea campaniei electorale',NULL,NULL);
/*!40000 ALTER TABLE `criteria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_01_24_163547_create_parties_table',1),(4,'2019_01_24_164240_create_candidates_table',1),(5,'2019_01_24_164508_create_criteria_table',1),(6,'2019_01_24_164600_create_candidatescores_table',1),(7,'2019_01_24_172431_update_parties_table',2),(8,'2019_01_24_172638_update_parties_table',3),(9,'2019_02_02_223608_update_candidatescores',4);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parties`
--

DROP TABLE IF EXISTS `parties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parties` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parties`
--

LOCK TABLES `parties` WRITE;
/*!40000 ALTER TABLE `parties` DISABLE KEYS */;
INSERT INTO `parties` VALUES (1,'USR','Uniunea Salvati Romania',NULL,NULL),(2,'PLUS','Partidul Libertății, Unității și Solidarității',NULL,NULL);
/*!40000 ALTER TABLE `parties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (25,'5c5623eb39177','5c5623eb39177@test.com',NULL,'pass',NULL,'2019-02-02 23:12:43','2019-02-02 23:12:43'),(26,'5c57237ecead3','5c57237ecead3@test.com',NULL,'pass',NULL,'2019-02-03 17:23:10','2019-02-03 17:23:10'),(27,'5c58a5bfcbd8d','5c58a5bfcbd8d@test.com',NULL,'pass',NULL,'2019-02-04 20:51:11','2019-02-04 20:51:11'),(28,'5c72cd01daf85','5c72cd01daf85@test.com',NULL,'pass',NULL,'2019-02-24 16:57:37','2019-02-24 16:57:37'),(29,'5c73b6f9ce763','5c73b6f9ce763@test.com',NULL,'pass',NULL,'2019-02-25 09:35:53','2019-02-25 09:35:53');
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

-- Dump completed on 2019-02-25  9:39:35
