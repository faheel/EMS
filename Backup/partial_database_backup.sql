-- MySQL dump 10.13  Distrib 5.7.16, for Linux (x86_64)
--
-- Host: localhost    Database: ems
-- ------------------------------------------------------
-- Server version	5.7.16-0ubuntu0.16.04.1

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
-- Current Database: `ems`
--

/*!40000 DROP DATABASE IF EXISTS `ems`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `ems` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `ems`;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add group',4,'add_group'),(11,'Can change group',4,'change_group'),(12,'Can delete group',4,'delete_group'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add class attendance',7,'add_classattendance'),(20,'Can change class attendance',7,'change_classattendance'),(21,'Can delete class attendance',7,'delete_classattendance'),(22,'Can add marks',8,'add_marks'),(23,'Can change marks',8,'change_marks'),(24,'Can delete marks',8,'delete_marks'),(25,'Can add student section',9,'add_studentsection'),(26,'Can change student section',9,'change_studentsection'),(27,'Can delete student section',9,'delete_studentsection'),(28,'Can add schedule',10,'add_schedule'),(29,'Can change schedule',10,'change_schedule'),(30,'Can delete schedule',10,'delete_schedule'),(31,'Can add subject section',11,'add_subjectsection'),(32,'Can change subject section',11,'change_subjectsection'),(33,'Can delete subject section',11,'delete_subjectsection'),(34,'Can add teaches',12,'add_teaches'),(35,'Can change teaches',12,'change_teaches'),(36,'Can delete teaches',12,'delete_teaches'),(37,'Can add subject',13,'add_subject'),(38,'Can change subject',13,'change_subject'),(39,'Can delete subject',13,'delete_subject'),(40,'Can add department',14,'add_department'),(41,'Can change department',14,'change_department'),(42,'Can delete department',14,'delete_department'),(43,'Can add teacher',15,'add_teacher'),(44,'Can change teacher',15,'change_teacher'),(45,'Can delete teacher',15,'delete_teacher'),(46,'Can add student',16,'add_student'),(47,'Can change student',16,'change_student'),(48,'Can delete student',16,'delete_student');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$30000$AQuHoLi6jxEa$9qxATGj1dv/PIcWUXFFsi8VV459ZaoqFTBIHAXNBCeU=','2016-11-16 17:53:38.914310',1,'dev','','','',1,1,'2016-11-16 14:24:31.682989');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2016-11-16 14:26:53.064937','d_01','Department object',1,'[{\"added\": {}}]',14,1),(2,'2016-11-16 14:27:27.196719','20143740','Student object',1,'[{\"added\": {}}]',16,1),(3,'2016-11-16 14:28:07.520318','CEN_301','Subject object',1,'[{\"added\": {}}]',13,1),(4,'2016-11-16 14:28:19.032883','1','ClassAttendance object',1,'[{\"added\": {}}]',7,1),(5,'2016-11-16 14:29:05.854928','d_01','Department object',2,'[{\"changed\": {\"fields\": [\"head_id\"]}}]',14,1),(6,'2016-11-16 14:30:33.036888','d_01','Department object',2,'[]',14,1),(7,'2016-11-16 14:32:32.058721','d_02','Department object',1,'[{\"added\": {}}]',14,1),(8,'2016-11-16 14:32:54.464630','d_05','Department object',1,'[{\"added\": {}}]',14,1),(9,'2016-11-16 14:33:48.346220','d_03','Department object',1,'[{\"added\": {}}]',14,1),(10,'2016-11-16 14:34:21.491277','d_04','Department object',1,'[{\"added\": {}}]',14,1),(11,'2016-11-16 14:34:53.996430','d_06','Department object',1,'[{\"added\": {}}]',14,1),(12,'2016-11-16 14:35:07.447812','d_06','Department object',2,'[]',14,1),(13,'2016-11-16 14:36:20.706084','d_01','Department object',2,'[{\"changed\": {\"fields\": [\"head_id\"]}}]',14,1),(14,'2016-11-16 14:36:26.303733','d_03','Department object',2,'[]',14,1),(15,'2016-11-16 14:36:31.331802','d_04','Department object',2,'[]',14,1),(16,'2016-11-16 14:36:35.423617','d_05','Department object',2,'[]',14,1),(17,'2016-11-16 14:45:19.439011','20143740','Student object',2,'[]',16,1),(18,'2016-11-16 14:46:30.363835','20143487','Student object',1,'[{\"added\": {}}]',16,1),(19,'2016-11-16 14:46:55.772002','CEN_302','Subject object',1,'[{\"added\": {}}]',13,1),(20,'2016-11-16 14:47:03.757007','2','ClassAttendance object',1,'[{\"added\": {}}]',7,1),(21,'2016-11-16 14:48:39.808099','20143687','Student object',1,'[{\"added\": {}}]',16,1),(22,'2016-11-16 14:49:27.291135','CIN_501','Subject object',1,'[{\"added\": {}}]',13,1),(23,'2016-11-16 14:49:33.703142','3','ClassAttendance object',1,'[{\"added\": {}}]',7,1),(24,'2016-11-16 15:30:53.777865','2','Ayesha Yadav is in section E',1,'[{\"added\": {}}]',9,1),(25,'2016-11-16 15:35:26.634122','2','Data Structures is taught in section A',1,'[{\"added\": {}}]',11,1),(26,'2016-11-16 15:36:20.907570','cs_03','Shamim Ahmad',1,'[{\"added\": {}}]',15,1),(27,'2016-11-16 15:36:40.413233','1','Shamim Ahmad  teaches Electronis',1,'[{\"added\": {}}]',12,1),(28,'2016-11-16 16:21:33.510090','2','Marks of Azfar Zaidi',1,'[{\"added\": {}}]',8,1),(29,'2016-11-16 16:22:34.022424','2','Marks of Azfar Zaidi',2,'[]',8,1),(30,'2016-11-16 16:23:00.870000','3','Marks of Azfar Zaidi',1,'[{\"added\": {}}]',8,1),(31,'2016-11-16 16:24:23.465929','4','Marks of Ayesha Yadav in Electronis',1,'[{\"added\": {}}]',8,1),(32,'2016-11-16 16:25:15.059775','5','Marks of Afzal Ahmad in Data Structures',1,'[{\"added\": {}}]',8,1),(33,'2016-11-16 16:26:11.383677','6','Ayesha Yadav - Structures',1,'[{\"added\": {}}]',8,1),(34,'2016-11-16 16:27:57.320143','AS_102','Mathematics',1,'[{\"added\": {}}]',13,1),(35,'2016-11-16 16:28:09.120809','AS_102','Mathematics - 1',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',13,1),(36,'2016-11-16 16:29:06.696965','CEN_506','Operating Systems - 2',1,'[{\"added\": {}}]',13,1),(37,'2016-11-16 16:29:33.607884','CEN_501','Computer Architecture',1,'[{\"added\": {}}]',13,1),(38,'2016-11-16 16:29:59.113743','CEN_502','Microprocessors',1,'[{\"added\": {}}]',13,1),(39,'2016-11-16 16:30:32.734093','CEN_503','DBMS',1,'[{\"added\": {}}]',13,1),(40,'2016-11-16 16:31:04.733036','CEN_504','Automata Theory',1,'[{\"added\": {}}]',13,1),(41,'2016-11-16 16:31:39.473847','CEN_505','Computer Networks',1,'[{\"added\": {}}]',13,1),(42,'2016-11-16 16:32:38.330593','MEC_501','Theory Of Machines',1,'[{\"added\": {}}]',13,1),(43,'2016-11-16 16:34:46.576624','MEC_502','Instrumentation Design',1,'[{\"added\": {}}]',13,1),(44,'2016-11-16 16:35:19.817058','CIV_702','Survey Implementation',1,'[{\"added\": {}}]',13,1),(45,'2016-11-16 16:35:54.188500','CIV_705','Structural Engineering',1,'[{\"added\": {}}]',13,1),(46,'2016-11-16 16:36:35.829996','1','Schedule object',1,'[{\"added\": {}}]',10,1),(47,'2016-11-16 16:38:13.876730','2','Computer Architecture - 2016-11-14',1,'[{\"added\": {}}]',10,1),(48,'2016-11-16 16:38:34.294585','3','Automata Theory - 2016-11-15',1,'[{\"added\": {}}]',10,1),(49,'2016-11-16 16:38:50.196782','4','Operating Systems - 2 - 2016-11-16',1,'[{\"added\": {}}]',10,1),(50,'2016-11-16 16:39:13.849691','5','Microprocessors - 2016-11-16',1,'[{\"added\": {}}]',10,1),(51,'2016-11-16 16:39:26.142788','6','DBMS - 2016-11-17',1,'[{\"added\": {}}]',10,1),(52,'2016-11-16 16:57:46.481129','2','Ayesha Yadav is in section E',2,'[]',9,1),(53,'2016-11-16 17:00:42.018009','20134597','Zeba Ahmad',1,'[{\"added\": {}}]',16,1),(54,'2016-11-16 17:05:57.959239','20136264','Sarah Javed',1,'[{\"added\": {}}]',16,1),(55,'2016-11-16 17:07:16.297601','20153548','Nabeel Siqqiqui',1,'[{\"added\": {}}]',16,1),(56,'2016-11-16 17:08:34.419779','20161486','Shafqat Ali',1,'[{\"added\": {}}]',16,1),(57,'2016-11-16 17:09:27.127910','20143865','Arpita Verma',1,'[{\"added\": {}}]',16,1),(58,'2016-11-16 17:11:19.499521','AS_104','Chemistry',1,'[{\"added\": {}}]',13,1),(59,'2016-11-16 17:11:42.137447','AS_101','Physics',1,'[{\"added\": {}}]',13,1),(60,'2016-11-16 17:18:08.149720','7','Mathematics - 1 - 2016-11-17',1,'[{\"added\": {}}]',10,1),(61,'2016-11-16 17:19:19.577526','4','Zeba Ahmad 68.0',1,'[{\"added\": {}}]',7,1),(62,'2016-11-16 17:20:38.346280','5','Shafqat Ali 62.0',1,'[{\"added\": {}}]',7,1),(63,'2016-11-16 17:22:01.507169','3','Arpita Verma is in section A',1,'[{\"added\": {}}]',9,1),(64,'2016-11-16 17:22:14.185606','4','Afzal Ahmad is in section C',1,'[{\"added\": {}}]',9,1),(65,'2016-11-16 17:22:30.360631','5','Shafqat Ali is in section D',1,'[{\"added\": {}}]',9,1),(66,'2016-11-16 17:22:47.001140','6','Nabeel Siqqiqui is in section B',1,'[{\"added\": {}}]',9,1),(67,'2016-11-16 17:25:10.691568','3','Chemistry is taught in section B',1,'[{\"added\": {}}]',11,1),(68,'2016-11-16 17:25:38.004231','4','Chemistry is taught in section C',1,'[{\"added\": {}}]',11,1),(69,'2016-11-16 17:26:06.829133','5','Physics is taught in section D',1,'[{\"added\": {}}]',11,1),(70,'2016-11-16 17:26:20.001158','6','Mathematics - 1 is taught in section E',1,'[{\"added\": {}}]',11,1),(71,'2016-11-16 17:31:52.433319','me_01','Sohaib Ahmad',1,'[{\"added\": {}}]',15,1),(72,'2016-11-16 17:32:23.094151','cs_01','Jawahar Lal',1,'[{\"added\": {}}]',15,1),(73,'2016-11-16 17:33:37.719188','ce_01','Rubab Ali',1,'[{\"added\": {}}]',15,1),(74,'2016-11-16 17:34:31.748921','ec_02','Areeba Rizvi',1,'[{\"added\": {}}]',15,1),(75,'2016-11-16 17:34:53.355504','2','Jawahar Lal  teaches Operating Systems - 2',1,'[{\"added\": {}}]',12,1),(76,'2016-11-16 17:35:07.491774','3','Areeba Rizvi  teaches Electronis',1,'[{\"added\": {}}]',12,1),(77,'2016-11-16 17:35:20.979773','4','Shamim Ahmad  teaches DBMS',1,'[{\"added\": {}}]',12,1),(78,'2016-11-16 17:35:37.087967','5','Sohaib Ahmad  teaches Theory Of Machines',1,'[{\"added\": {}}]',12,1),(79,'2016-11-16 17:35:54.111064','6','Sohaib Ahmad  teaches Instrumentation Design',1,'[{\"added\": {}}]',12,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(4,'auth','group'),(2,'auth','permission'),(3,'auth','user'),(5,'contenttypes','contenttype'),(7,'main','classattendance'),(14,'main','department'),(8,'main','marks'),(10,'main','schedule'),(16,'main','student'),(9,'main','studentsection'),(13,'main','subject'),(11,'main','subjectsection'),(15,'main','teacher'),(12,'main','teaches'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2016-11-16 14:22:59.548853'),(2,'auth','0001_initial','2016-11-16 14:23:06.104755'),(3,'admin','0001_initial','2016-11-16 14:23:07.404351'),(4,'admin','0002_logentry_remove_auto_add','2016-11-16 14:23:07.521860'),(5,'contenttypes','0002_remove_content_type_name','2016-11-16 14:23:08.292807'),(6,'auth','0002_alter_permission_name_max_length','2016-11-16 14:23:08.394806'),(7,'auth','0003_alter_user_email_max_length','2016-11-16 14:23:08.515926'),(8,'auth','0004_alter_user_username_opts','2016-11-16 14:23:08.600467'),(9,'auth','0005_alter_user_last_login_null','2016-11-16 14:23:09.026375'),(10,'auth','0006_require_contenttypes_0002','2016-11-16 14:23:09.048299'),(11,'auth','0007_alter_validators_add_error_messages','2016-11-16 14:23:09.092955'),(12,'auth','0008_alter_user_username_max_length','2016-11-16 14:23:09.337609'),(13,'main','0001_initial','2016-11-16 14:23:22.305116'),(14,'sessions','0001_initial','2016-11-16 14:23:22.705781'),(15,'main','0002_auto_20161116_2058','2016-11-16 15:28:07.658152');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('7pf0mxggfdu7k3hzuxm61qn3cmcgdvti','MTQ2ZGVmNjRjMjNkZDVlMGUzZTgyZjAwMTE0ZDI5MjQ2YzgzMGNkNDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiIzN2UxNDAxZWYyNjgyNmUyOWQzYzI0NjY3YmJiMGUxYTI3MWY0ZThkIn0=','2016-11-30 17:53:38.966284');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_classattendance`
--

DROP TABLE IF EXISTS `main_classattendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_classattendance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attendance` double NOT NULL,
  `student_id_id` varchar(16) NOT NULL,
  `subject_id_id` varchar(16) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `main_classattendance_student_id_id_588aeda0_uniq` (`student_id_id`,`subject_id_id`),
  KEY `main_classattendance_e462bf81` (`student_id_id`),
  KEY `main_classattendance_4a83a6b6` (`subject_id_id`),
  CONSTRAINT `main_classatte_student_id_id_f56b1b55_fk_main_student_student_id` FOREIGN KEY (`student_id_id`) REFERENCES `main_student` (`student_id`),
  CONSTRAINT `main_classatte_subject_id_id_623d95c2_fk_main_subject_subject_id` FOREIGN KEY (`subject_id_id`) REFERENCES `main_subject` (`subject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_classattendance`
--

LOCK TABLES `main_classattendance` WRITE;
/*!40000 ALTER TABLE `main_classattendance` DISABLE KEYS */;
INSERT INTO `main_classattendance` VALUES (1,85.5,'20143740','CEN_301'),(2,98.26,'20143487','CEN_302'),(3,75.36,'20143687','CIN_501'),(4,68,'20134597','CEN_502'),(5,62,'20161486','CEN_506');
/*!40000 ALTER TABLE `main_classattendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_department`
--

DROP TABLE IF EXISTS `main_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_department` (
  `dept_id` varchar(16) NOT NULL,
  `name` varchar(64) NOT NULL,
  `head_id` varchar(16) NOT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_department`
--

LOCK TABLES `main_department` WRITE;
/*!40000 ALTER TABLE `main_department` DISABLE KEYS */;
INSERT INTO `main_department` VALUES ('d_01','Computer Engineering','cs_01'),('d_02','Mechanical Engineering','me_01'),('d_03','Electrical Engineering','ee_02'),('d_04','Electronics And Comm. Engineering','ec_05'),('d_05','Civil Engineering','ce_03'),('d_06','Applied Sciences & Humanities','as_04');
/*!40000 ALTER TABLE `main_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_marks`
--

DROP TABLE IF EXISTS `main_marks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_marks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `marks` double NOT NULL,
  `student_id_id` varchar(16) NOT NULL,
  `subject_id_id` varchar(16) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `main_marks_student_id_id_8f59b5ff_uniq` (`student_id_id`,`subject_id_id`),
  KEY `main_marks_e462bf81` (`student_id_id`),
  KEY `main_marks_4a83a6b6` (`subject_id_id`),
  CONSTRAINT `main_marks_student_id_id_5775345b_fk_main_student_student_id` FOREIGN KEY (`student_id_id`) REFERENCES `main_student` (`student_id`),
  CONSTRAINT `main_marks_subject_id_id_abb14f7e_fk_main_subject_subject_id` FOREIGN KEY (`subject_id_id`) REFERENCES `main_subject` (`subject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_marks`
--

LOCK TABLES `main_marks` WRITE;
/*!40000 ALTER TABLE `main_marks` DISABLE KEYS */;
INSERT INTO `main_marks` VALUES (2,95,'20143740','CEN_301'),(3,95,'20143740','CEN_302'),(4,89.5,'20143687','CEN_302'),(5,92.5,'20143487','CEN_301'),(6,62,'20143687','CIN_501');
/*!40000 ALTER TABLE `main_marks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_schedule`
--

DROP TABLE IF EXISTS `main_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `subject_id_id` varchar(16) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `main_schedule_subject_id_id_3d2a8262_uniq` (`subject_id_id`,`date`),
  KEY `main_schedule_4a83a6b6` (`subject_id_id`),
  CONSTRAINT `main_schedule_subject_id_id_f1c7db6a_fk_main_subject_subject_id` FOREIGN KEY (`subject_id_id`) REFERENCES `main_subject` (`subject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_schedule`
--

LOCK TABLES `main_schedule` WRITE;
/*!40000 ALTER TABLE `main_schedule` DISABLE KEYS */;
INSERT INTO `main_schedule` VALUES (7,'2016-11-17','AS_102'),(2,'2016-11-14','CEN_501'),(5,'2016-11-16','CEN_502'),(6,'2016-11-17','CEN_503'),(3,'2016-11-15','CEN_504'),(1,'2016-11-14','CEN_505'),(4,'2016-11-16','CEN_506');
/*!40000 ALTER TABLE `main_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_student`
--

DROP TABLE IF EXISTS `main_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_student` (
  `student_id` varchar(16) NOT NULL,
  `roll_no` varchar(16) NOT NULL,
  `name` varchar(64) NOT NULL,
  `dob` date NOT NULL,
  `semester` int(11) NOT NULL,
  `dept_id_id` varchar(16) NOT NULL,
  PRIMARY KEY (`student_id`),
  KEY `main_student_dept_id_id_b656a0c6_fk_main_department_dept_id` (`dept_id_id`),
  CONSTRAINT `main_student_dept_id_id_b656a0c6_fk_main_department_dept_id` FOREIGN KEY (`dept_id_id`) REFERENCES `main_department` (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_student`
--

LOCK TABLES `main_student` WRITE;
/*!40000 ALTER TABLE `main_student` DISABLE KEYS */;
INSERT INTO `main_student` VALUES ('20134597','13BCE0025','Zeba Ahmad','1994-08-16',7,'d_05'),('20136264','13BCS0032','Sarah Javed','1993-05-17',8,'d_01'),('20143487','14BCS0037','Afzal Ahmad','1995-05-17',5,'d_06'),('20143687','14BCE0054','Ayesha Yadav','1994-05-13',3,'d_04'),('20143740','14BCS0052','Azfar Zaidi','1995-02-14',5,'d_01'),('20143865','14BME0012','Arpita Verma','1995-08-04',5,'d_02'),('20153548','15BME0039','Nabeel Siqqiqui','1996-05-28',3,'d_02'),('20161486','16BCE0028','Shafqat Ali','1997-05-23',1,'d_05');
/*!40000 ALTER TABLE `main_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_studentsection`
--

DROP TABLE IF EXISTS `main_studentsection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_studentsection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `section` varchar(1) NOT NULL,
  `student_id_id` varchar(16) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_id` (`student_id_id`),
  CONSTRAINT `main_studentse_student_id_id_26df0123_fk_main_student_student_id` FOREIGN KEY (`student_id_id`) REFERENCES `main_student` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_studentsection`
--

LOCK TABLES `main_studentsection` WRITE;
/*!40000 ALTER TABLE `main_studentsection` DISABLE KEYS */;
INSERT INTO `main_studentsection` VALUES (2,'E','20143687'),(3,'A','20143865'),(4,'C','20143487'),(5,'D','20161486'),(6,'B','20153548');
/*!40000 ALTER TABLE `main_studentsection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_subject`
--

DROP TABLE IF EXISTS `main_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_subject` (
  `subject_id` varchar(16) NOT NULL,
  `name` varchar(64) NOT NULL,
  `semester` int(11) NOT NULL,
  `dept_id_id` varchar(16) NOT NULL,
  PRIMARY KEY (`subject_id`),
  KEY `main_subject_dept_id_id_f4aeb2dd_fk_main_department_dept_id` (`dept_id_id`),
  CONSTRAINT `main_subject_dept_id_id_f4aeb2dd_fk_main_department_dept_id` FOREIGN KEY (`dept_id_id`) REFERENCES `main_department` (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_subject`
--

LOCK TABLES `main_subject` WRITE;
/*!40000 ALTER TABLE `main_subject` DISABLE KEYS */;
INSERT INTO `main_subject` VALUES ('AS_101','Physics',1,'d_06'),('AS_102','Mathematics - 1',1,'d_06'),('AS_104','Chemistry',1,'d_06'),('CEN_301','Data Structures',3,'d_01'),('CEN_302','Electronis',5,'d_06'),('CEN_501','Computer Architecture',5,'d_01'),('CEN_502','Microprocessors',5,'d_01'),('CEN_503','DBMS',5,'d_01'),('CEN_504','Automata Theory',5,'d_01'),('CEN_505','Computer Networks',5,'d_01'),('CEN_506','Operating Systems - 2',5,'d_01'),('CIN_501','Structures',5,'d_03'),('CIV_702','Survey Implementation',7,'d_05'),('CIV_705','Structural Engineering',7,'d_05'),('MEC_501','Theory Of Machines',5,'d_02'),('MEC_502','Instrumentation Design',5,'d_02');
/*!40000 ALTER TABLE `main_subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_subjectsection`
--

DROP TABLE IF EXISTS `main_subjectsection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_subjectsection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `section` varchar(1) NOT NULL,
  `subject_id_id` varchar(16) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `main_subjectse_subject_id_id_c9794e3c_fk_main_subject_subject_id` (`subject_id_id`),
  CONSTRAINT `main_subjectse_subject_id_id_c9794e3c_fk_main_subject_subject_id` FOREIGN KEY (`subject_id_id`) REFERENCES `main_subject` (`subject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_subjectsection`
--

LOCK TABLES `main_subjectsection` WRITE;
/*!40000 ALTER TABLE `main_subjectsection` DISABLE KEYS */;
INSERT INTO `main_subjectsection` VALUES (2,'A','CEN_301'),(3,'B','AS_104'),(4,'C','AS_104'),(5,'D','AS_101'),(6,'E','AS_102');
/*!40000 ALTER TABLE `main_subjectsection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_teacher`
--

DROP TABLE IF EXISTS `main_teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_teacher` (
  `teacher_id` varchar(16) NOT NULL,
  `name` varchar(64) NOT NULL,
  `salary` double NOT NULL,
  `teaching_since` date NOT NULL,
  `dept_id_id` varchar(16) NOT NULL,
  PRIMARY KEY (`teacher_id`),
  KEY `main_teacher_dept_id_id_4e71b85b_fk_main_department_dept_id` (`dept_id_id`),
  CONSTRAINT `main_teacher_dept_id_id_4e71b85b_fk_main_department_dept_id` FOREIGN KEY (`dept_id_id`) REFERENCES `main_department` (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_teacher`
--

LOCK TABLES `main_teacher` WRITE;
/*!40000 ALTER TABLE `main_teacher` DISABLE KEYS */;
INSERT INTO `main_teacher` VALUES ('ce_01','Rubab Ali',42000,'2013-02-18','d_05'),('cs_01','Jawahar Lal',80000,'1994-05-25','d_01'),('cs_03','Shamim Ahmad',42000,'2014-12-17','d_01'),('ec_02','Areeba Rizvi',40000,'2014-05-19','d_04'),('me_01','Sohaib Ahmad',100000,'1995-02-15','d_02');
/*!40000 ALTER TABLE `main_teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_teaches`
--

DROP TABLE IF EXISTS `main_teaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_teaches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject_id_id` varchar(16) NOT NULL,
  `teacher_id_id` varchar(16) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `main_teaches_teacher_id_id_95736b94_uniq` (`teacher_id_id`,`subject_id_id`),
  KEY `main_teaches_subject_id_id_bc02262c_fk_main_subject_subject_id` (`subject_id_id`),
  CONSTRAINT `main_teaches_subject_id_id_bc02262c_fk_main_subject_subject_id` FOREIGN KEY (`subject_id_id`) REFERENCES `main_subject` (`subject_id`),
  CONSTRAINT `main_teaches_teacher_id_id_38a632a1_fk_main_teacher_teacher_id` FOREIGN KEY (`teacher_id_id`) REFERENCES `main_teacher` (`teacher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_teaches`
--

LOCK TABLES `main_teaches` WRITE;
/*!40000 ALTER TABLE `main_teaches` DISABLE KEYS */;
INSERT INTO `main_teaches` VALUES (2,'CEN_506','cs_01'),(1,'CEN_302','cs_03'),(4,'CEN_503','cs_03'),(3,'CEN_302','ec_02'),(5,'MEC_501','me_01'),(6,'MEC_502','me_01');
/*!40000 ALTER TABLE `main_teaches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ems'
--

--
-- Dumping routines for database 'ems'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-16 23:50:02
