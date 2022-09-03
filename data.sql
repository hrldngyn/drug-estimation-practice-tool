-- MySQL dump 10.16  Distrib 10.1.26-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: db
-- ------------------------------------------------------
-- Server version	10.1.26-MariaDB-0+deb9u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` varchar(0) DEFAULT NULL,
  `name` varchar(0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
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
  `id` varchar(0) DEFAULT NULL,
  `group_id` varchar(0) DEFAULT NULL,
  `permission_id` varchar(0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
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
  `id` tinyint(4) DEFAULT NULL,
  `content_type_id` tinyint(4) DEFAULT NULL,
  `codename` varchar(25) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,1,'add_logentry','Can add log entry'),(2,1,'change_logentry','Can change log entry'),(3,1,'delete_logentry','Can delete log entry'),(4,1,'view_logentry','Can view log entry'),(5,2,'add_permission','Can add permission'),(6,2,'change_permission','Can change permission'),(7,2,'delete_permission','Can delete permission'),(8,2,'view_permission','Can view permission'),(9,3,'add_group','Can add group'),(10,3,'change_group','Can change group'),(11,3,'delete_group','Can delete group'),(12,3,'view_group','Can view group'),(13,4,'add_user','Can add user'),(14,4,'change_user','Can change user'),(15,4,'delete_user','Can delete user'),(16,4,'view_user','Can view user'),(17,5,'add_contenttype','Can add content type'),(18,5,'change_contenttype','Can change content type'),(19,5,'delete_contenttype','Can delete content type'),(20,5,'view_contenttype','Can view content type'),(21,6,'add_session','Can add session'),(22,6,'change_session','Can change session'),(23,6,'delete_session','Can delete session'),(24,6,'view_session','Can view session'),(25,7,'add_protein','Can add protein'),(26,7,'change_protein','Can change protein'),(27,7,'delete_protein','Can delete protein'),(28,7,'view_protein','Can view protein'),(29,8,'add_aminoacid','Can add amino acid'),(30,8,'change_aminoacid','Can change amino acid'),(31,8,'delete_aminoacid','Can delete amino acid'),(32,8,'view_aminoacid','Can view amino acid'),(33,9,'add_molecule','Can add molecule'),(34,9,'change_molecule','Can change molecule'),(35,9,'delete_molecule','Can delete molecule'),(36,9,'view_molecule','Can view molecule'),(37,10,'add_molecule_fg_pka','Can add molecule_f g_p ka'),(38,10,'change_molecule_fg_pka','Can change molecule_f g_p ka'),(39,10,'delete_molecule_fg_pka','Can delete molecule_f g_p ka'),(40,10,'view_molecule_fg_pka','Can view molecule_f g_p ka'),(41,11,'add_functionalgroup','Can add functional group'),(42,11,'change_functionalgroup','Can change functional group'),(43,11,'delete_functionalgroup','Can delete functional group'),(44,11,'view_functionalgroup','Can view functional group'),(45,12,'add_query','Can add query'),(46,12,'change_query','Can change query'),(47,12,'delete_query','Can delete query'),(48,12,'view_query','Can view query'),(49,13,'add_user','Can add user'),(50,13,'change_user','Can change user'),(51,13,'delete_user','Can delete user'),(52,13,'view_user','Can view user'),(53,14,'add_solvedquery','Can add solved query'),(54,14,'change_solvedquery','Can change solved query'),(55,14,'delete_solvedquery','Can delete solved query'),(56,14,'view_solvedquery','Can view solved query'),(57,15,'add_quiz2attempt','Can add quiz2 attempt'),(58,15,'change_quiz2attempt','Can change quiz2 attempt'),(59,15,'delete_quiz2attempt','Can delete quiz2 attempt'),(60,15,'view_quiz2attempt','Can view quiz2 attempt'),(61,16,'add_quiz1attempt','Can add quiz1 attempt'),(62,16,'change_quiz1attempt','Can change quiz1 attempt'),(63,16,'delete_quiz1attempt','Can delete quiz1 attempt'),(64,16,'view_quiz1attempt','Can view quiz1 attempt'),(65,17,'add_subjectivefeedback','Can add subjective feedback'),(66,17,'change_subjectivefeedback','Can change subjective feedback'),(67,17,'delete_subjectivefeedback','Can delete subjective feedback'),(68,17,'view_subjectivefeedback','Can view subjective feedback');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` tinyint(4) DEFAULT NULL,
  `password` varchar(88) DEFAULT NULL,
  `last_login` varchar(10) DEFAULT NULL,
  `is_superuser` tinyint(4) DEFAULT NULL,
  `username` varchar(6) DEFAULT NULL,
  `last_name` varchar(0) DEFAULT NULL,
  `email` varchar(16) DEFAULT NULL,
  `is_staff` tinyint(4) DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  `date_joined` varchar(10) DEFAULT NULL,
  `first_name` varchar(0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$320000$DzqoWNMZdQ1neS7A8VYyZG$qVoufT+aWLE9MbFAy85OKiPBZVakT+3f/07GlqCGumE=','2022-08-14',1,'harold','','haroldng@usc.edu',1,1,'2022-08-14','');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` varchar(0) DEFAULT NULL,
  `user_id` varchar(0) DEFAULT NULL,
  `group_id` varchar(0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
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
  `id` varchar(0) DEFAULT NULL,
  `user_id` varchar(0) DEFAULT NULL,
  `permission_id` varchar(0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
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
  `id` tinyint(4) DEFAULT NULL,
  `action_time` varchar(10) DEFAULT NULL,
  `object_id` smallint(6) DEFAULT NULL,
  `object_repr` varchar(29) DEFAULT NULL,
  `change_message` varchar(39) DEFAULT NULL,
  `content_type_id` tinyint(4) DEFAULT NULL,
  `user_id` tinyint(4) DEFAULT NULL,
  `action_flag` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2022-08-29',101,'Tramadol','',9,1,3),(2,'2022-08-29',102,'Tramadol','',9,1,3),(3,'2022-08-29',103,'Tramadol','',9,1,3),(4,'2022-08-29',2,'Allopurinol','[{\"changed\": {\"fields\": [\"Ion Type\"]}}]',9,1,2),(5,'2022-08-29',15,'Celecoxib','[{\"changed\": {\"fields\": [\"Ion Type\"]}}]',9,1,2),(6,'2022-08-29',16,'Chlorhexidine','[{\"changed\": {\"fields\": [\"Ion Type\"]}}]',9,1,2),(7,'2022-08-29',18,'Cimetidine','[{\"changed\": {\"fields\": [\"Ion Type\"]}}]',9,1,2),(8,'2022-08-29',22,'Clonidine','[{\"changed\": {\"fields\": [\"Ion Type\"]}}]',9,1,2),(9,'2022-08-29',23,'Clotrimazole','[{\"changed\": {\"fields\": [\"Ion Type\"]}}]',9,1,2),(10,'2022-08-29',39,'Famotidine','[{\"changed\": {\"fields\": [\"Ion Type\"]}}]',9,1,2),(11,'2022-08-29',41,'Fluconazole','[{\"changed\": {\"fields\": [\"Ion Type\"]}}]',9,1,2),(12,'2022-08-29',44,'Glimepiride','[{\"changed\": {\"fields\": [\"Ion Type\"]}}]',9,1,2),(13,'2022-08-29',45,'Glipizide','[{\"changed\": {\"fields\": [\"Ion Type\"]}}]',9,1,2),(14,'2022-08-29',46,'Glyburide','[{\"changed\": {\"fields\": [\"Ion Type\"]}}]',9,1,2),(15,'2022-08-29',54,'Lamotrigine','[{\"changed\": {\"fields\": [\"Ion Type\"]}}]',9,1,2),(16,'2022-08-29',58,'Losartan','[{\"changed\": {\"fields\": [\"Ion Type\"]}}]',9,1,2),(17,'2022-08-29',59,'Metformin','[{\"changed\": {\"fields\": [\"Ion Type\"]}}]',9,1,2),(18,'2022-08-29',63,'Metronidazole','[{\"changed\": {\"fields\": [\"Ion Type\"]}}]',9,1,2),(19,'2022-08-29',72,'Ondansetron','[{\"changed\": {\"fields\": [\"Ion Type\"]}}]',9,1,2),(20,'2022-08-29',79,'Phenytoin','[{\"changed\": {\"fields\": [\"Ion Type\"]}}]',9,1,2),(21,'2022-08-29',98,'Warfarin','[{\"changed\": {\"fields\": [\"Ion Type\"]}}]',9,1,2),(22,'2022-08-29',100,'Zolpidem','[{\"changed\": {\"fields\": [\"Ion Type\"]}}]',9,1,2),(23,'2022-08-29',33,'Query object (33)','',12,1,3),(24,'2022-08-29',32,'Query object (32)','',12,1,3),(25,'2022-08-29',31,'Query object (31)','',12,1,3),(26,'2022-08-29',30,'Query object (30)','',12,1,3),(27,'2022-08-29',29,'Query object (29)','',12,1,3),(28,'2022-08-29',28,'Query object (28)','',12,1,3),(29,'2022-08-29',27,'Query object (27)','',12,1,3),(30,'2022-08-29',26,'Query object (26)','',12,1,3),(31,'2022-08-29',25,'Query object (25)','',12,1,3),(32,'2022-08-29',24,'Query object (24)','',12,1,3),(33,'2022-08-29',23,'Query object (23)','',12,1,3),(34,'2022-08-29',22,'Query object (22)','',12,1,3),(35,'2022-08-29',21,'Query object (21)','',12,1,3),(36,'2022-08-29',20,'Query object (20)','',12,1,3),(37,'2022-08-29',19,'Query object (19)','',12,1,3),(38,'2022-08-29',18,'Query object (18)','',12,1,3),(39,'2022-08-29',17,'Query object (17)','',12,1,3),(40,'2022-08-29',16,'Query object (16)','',12,1,3),(41,'2022-08-29',15,'Query object (15)','',12,1,3),(42,'2022-08-29',14,'Query object (14)','',12,1,3),(43,'2022-08-29',13,'Query object (13)','',12,1,3),(44,'2022-08-29',12,'Query object (12)','',12,1,3),(45,'2022-08-29',11,'Query object (11)','',12,1,3),(46,'2022-08-29',10,'Query object (10)','',12,1,3),(47,'2022-08-29',9,'Query object (9)','',12,1,3),(48,'2022-08-29',8,'Query object (8)','',12,1,3),(49,'2022-08-29',7,'Query object (7)','',12,1,3),(50,'2022-08-29',6,'Query object (6)','',12,1,3),(51,'2022-08-29',5,'Query object (5)','',12,1,3),(52,'2022-08-29',4,'Query object (4)','',12,1,3),(53,'2022-08-29',2,'SubjectiveFeedback object (2)','',17,1,3),(54,'2022-08-29',1,'SubjectiveFeedback object (1)','',17,1,3);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` tinyint(4) DEFAULT NULL,
  `app_label` varchar(13) DEFAULT NULL,
  `model` varchar(18) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(8,'pharmaceutics','aminoacid'),(11,'pharmaceutics','functionalgroup'),(9,'pharmaceutics','molecule'),(10,'pharmaceutics','molecule_fg_pka'),(7,'pharmaceutics','protein'),(12,'pharmaceutics','query'),(16,'pharmaceutics','quiz1attempt'),(15,'pharmaceutics','quiz2attempt'),(14,'pharmaceutics','solvedquery'),(17,'pharmaceutics','subjectivefeedback'),(13,'pharmaceutics','user'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` tinyint(4) DEFAULT NULL,
  `app` varchar(13) DEFAULT NULL,
  `name` varchar(56) DEFAULT NULL,
  `applied` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-08-14'),(2,'auth','0001_initial','2022-08-14'),(3,'admin','0001_initial','2022-08-14'),(4,'admin','0002_logentry_remove_auto_add','2022-08-14'),(5,'admin','0003_logentry_add_action_flag_choices','2022-08-14'),(6,'contenttypes','0002_remove_content_type_name','2022-08-14'),(7,'auth','0002_alter_permission_name_max_length','2022-08-14'),(8,'auth','0003_alter_user_email_max_length','2022-08-14'),(9,'auth','0004_alter_user_username_opts','2022-08-14'),(10,'auth','0005_alter_user_last_login_null','2022-08-14'),(11,'auth','0006_require_contenttypes_0002','2022-08-14'),(12,'auth','0007_alter_validators_add_error_messages','2022-08-14'),(13,'auth','0008_alter_user_username_max_length','2022-08-14'),(14,'auth','0009_alter_user_last_name_max_length','2022-08-14'),(15,'auth','0010_alter_group_name_max_length','2022-08-14'),(16,'auth','0011_update_proxy_permissions','2022-08-14'),(17,'auth','0012_alter_user_first_name_max_length','2022-08-14'),(18,'sessions','0001_initial','2022-08-14'),(20,'pharmaceutics','0002_molecule_litpka','2022-08-14'),(21,'pharmaceutics','0003_alter_molecule_functionalgroups_alter_molecule_logp','2022-08-14'),(22,'pharmaceutics','0004_rename_litpka_molecule_literaturepka_and_more','2022-08-14'),(23,'pharmaceutics','0005_molecule_reference','2022-08-14'),(24,'pharmaceutics','0006_remove_molecule_functionalgroups_and_more','2022-08-15'),(25,'pharmaceutics','0001_initial','2022-08-29'),(26,'pharmaceutics','0002_query_molecule_ion_type_user_solvedquery_and_more','2022-08-29'),(27,'pharmaceutics','0003_subjectivefeedback','2022-08-29'),(28,'pharmaceutics','0004_user_qb2s_solved','2022-08-29');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(32) DEFAULT NULL,
  `session_data` text,
  `expire_date` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('dlnfrnpzsp8nodvgaios38vlg3lx3fjw','.eJxVzMsKwjAQBdB_yVpC85gmdenebwh5TG2sNNi0CIr_bopF4vLMvXNfxNh1GcyacTYxkCNh5FDfnPUjTlsQrna6JOrTtMzR0a1C9zTTcwp4O-3dv4HB5qF867a3TCrXOJTcgWLWYue81qjQeyfbrgMB2DeSI-cBQYNWIIRQ0HPUbRm9r_HJDCtjP_AaooasAV8smBef0hix-JHmEQN5fwDzXFDS:1oSkWJ:wHQ7DnwJwvMLBZj1MHrphiC_Und9VrKQGAbhvok4mQs','2022-09-12');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pharmaceutics_aminoacid`
--

DROP TABLE IF EXISTS `pharmaceutics_aminoacid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pharmaceutics_aminoacid` (
  `id` varchar(0) DEFAULT NULL,
  `ionizable` varchar(0) DEFAULT NULL,
  `polar` varchar(0) DEFAULT NULL,
  `aromatic` varchar(0) DEFAULT NULL,
  `full_carbon_count` varchar(0) DEFAULT NULL,
  `branched` varchar(0) DEFAULT NULL,
  `essential` varchar(0) DEFAULT NULL,
  `singlet_code` varchar(0) DEFAULT NULL,
  `triplet_code` varchar(0) DEFAULT NULL,
  `charge` varchar(0) DEFAULT NULL,
  `sulfur` varchar(0) DEFAULT NULL,
  `volume` varchar(0) DEFAULT NULL,
  `Molecule_id` varchar(0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pharmaceutics_aminoacid`
--

LOCK TABLES `pharmaceutics_aminoacid` WRITE;
/*!40000 ALTER TABLE `pharmaceutics_aminoacid` DISABLE KEYS */;
/*!40000 ALTER TABLE `pharmaceutics_aminoacid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pharmaceutics_functionalgroup`
--

DROP TABLE IF EXISTS `pharmaceutics_functionalgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pharmaceutics_functionalgroup` (
  `id` varchar(0) DEFAULT NULL,
  `Name` varchar(0) DEFAULT NULL,
  `ionizable` varchar(0) DEFAULT NULL,
  `polar` varchar(0) DEFAULT NULL,
  `parent_pKa` varchar(0) DEFAULT NULL,
  `aromatic` varchar(0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pharmaceutics_functionalgroup`
--

LOCK TABLES `pharmaceutics_functionalgroup` WRITE;
/*!40000 ALTER TABLE `pharmaceutics_functionalgroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `pharmaceutics_functionalgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pharmaceutics_molecule`
--

DROP TABLE IF EXISTS `pharmaceutics_molecule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pharmaceutics_molecule` (
  `id` smallint(6) DEFAULT NULL,
  `Molecule_Name` varchar(17) DEFAULT NULL,
  `SMILES` varchar(169) DEFAULT NULL,
  `LiteraturePka` decimal(4,2) DEFAULT NULL,
  `Difficulty` varchar(4) DEFAULT NULL,
  `Reference` text,
  `Ion_Type` varchar(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pharmaceutics_molecule`
--

LOCK TABLES `pharmaceutics_molecule` WRITE;
/*!40000 ALTER TABLE `pharmaceutics_molecule` DISABLE KEYS */;
INSERT INTO `pharmaceutics_molecule` VALUES (1,'Acetaminophen','CC(=O)NC1=CC=C(C=C1)O',9.58,'easy','doi.org/10.1016/j.chroma.2013.01.018','none'),(2,'Allopurinol','C1=NNC2=C1C(=O)NC=N2',9.30,'hard','https://www.accessdata.fda.gov/drugsatfda_docs/label/2020/020298s010lbl.pdf','base'),(3,'Amitriptyline','CN(C)CCC=C1C2=CC=CC=C2CCC3=CC=CC=C31',9.40,'easy','doi.org/10.1016/S0099-5428(07)33001-3','none'),(4,'Amlodipine','CCOC(=O)C1=C(NC(=C(C1C2=CC=CC=C2Cl)C(=O)OC)C)COCCN',8.60,'easy','doi.org/10.1016/S0099-5428(07)33001-3','none'),(5,'Amphetamine ','CC(CC1=CC=CC=C1)N',9.90,'easy','accessdata.fda.gov/drugsatfda_docs/label/2013/021303s026lbl.pdf','none'),(6,'Aspirin','CC(=O)OC1=CC=CC=C1C(=O)O',3.56,'easy','doi.org/10.1016/S0099-5428(07)33001-3','none'),(7,'Atenolol','CC(C)NCC(COC1=CC=C(C=C1)CC(=O)N)O',9.60,'easy','doi.org/10.1016/S0099-5428(07)33001-3','none'),(8,'Atomoxetine','CC1=CC=CC=C1OC(CCNC)C2=CC=CC=C2',10.10,'easy','doi.org/10.1016/S0099-5428(07)33001-3','none'),(9,'Atorvastatin','CC(C)C1=C(C(=C(N1CCC(CC(CC(=O)O)O)O)C2=CC=C(C=C2)F)C3=CC=CC=C3)C(=O)NC4=CC=CC=C4',4.46,'easy','doi.org/10.1016/S0099-5428(07)33001-3','none'),(10,'Azelastine','CN1CCCC(CC1)N2C(=O)C3=CC=CC=C3C(=N2)CC4=CC=C(C=C4)Cl',9.82,'easy','doi.org/10.1016/S0099-5428(07)33001-3','none'),(11,'Benazepril','CCOC(=O)C(CCC1=CC=CC=C1)NC2CCC3=CC=CC=C3N(C2=O)CC(=O)O',3.73,'easy','doi.org/10.1016/j.ejpb.2015.02.028','none'),(12,'Benztropine','CN1C2CCC1CC(C2)OC(C3=CC=CC=C3)C4=CC=CC=C4',10.00,'easy','doi.org/10.1016/S0099-5428(07)33001-3','none'),(13,'Bisoprolol','CC(C)NCC(COC1=CC=C(C=C1)COCCOC(C)C)O',9.57,'easy','doi.org/10.1016/S0099-5428(07)33001-3','none'),(14,'Buspirone','C1CCC2(C1)CC(=O)N(C(=O)C2)CCCCN3CCN(CC3)C4=NC=CC=N4',7.60,'easy','doi.org/10.1016/S0099-5428(07)33001-3','none'),(15,'Celecoxib','CC1=CC=C(C=C1)C2=CC(=NN2C3=CC=C(C=C3)S(=O)(=O)N)C(F)(F)F',11.10,'hard','accessdata.fda.gov/drugsatfda_docs/label/2021/020998s056lbl.pdf','acid'),(16,'Chlorhexidine','C1=CC(=CC=C1NC(=NC(=NCCCCCCN=C(N)N=C(N)NC2=CC=C(C=C2)Cl)N)N)Cl',10.78,'hard','doi.org/10.1016/S0099-5428(07)33001-3','base'),(17,'Chlorpheniramine','CN(C)CCC(C1=CC=C(C=C1)Cl)C2=CC=CC=N2',9.16,'easy','doi.org/10.1016/S0099-5428(07)33001-3','none'),(18,'Cimetidine','CC1=C(N=CN1)CSCCNC(=NC)NC#N',7.11,'hard','doi.org/10.1016/S0099-5428(07)33001-3','base'),(19,'Citalopram','CN(C)CCCC1(C2=C(CO1)C=C(C=C2)C#N)C3=CC=C(C=C3)F',9.50,'easy','10.1515/CCLM.2007.108','none'),(20,'Clarithromycin','CCC1C(C(C(C(=O)C(CC(C(C(C(C(C(=O)O1)C)OC2CC(C(C(O2)C)O)(C)OC)C)OC3C(C(CC(O3)C)N(C)C)O)(C)OC)C)C)O)(C)O',8.99,'easy','doi.org/10.1016/S0099-5428(07)33001-3','none'),(21,'Clindamycin','CCCC1CC(N(C1)C)C(=O)NC(C2C(C(C(C(O2)SC)O)O)O)C(C)Cl',7.72,'easy','doi.org/10.1016/S0099-5428(07)33001-3','none'),(22,'Clonidine','C1CN=C(N1)NC2=C(C=CC=C2Cl)Cl',8.26,'hard','doi.org/10.1016/S0099-5428(07)33001-3','base'),(23,'Clotrimazole','C1=CC=C(C=C1)C(C2=CC=CC=C2)(C3=CC=CC=C3Cl)N4C=CN=C4',4.70,'hard','doi.org/10.1016/S0099-5428(07)33001-3','base'),(24,'Clozapine','CN1CCN(CC1)C2=NC3=C(C=CC(=C3)Cl)NC4=CC=CC=C42',7.63,'easy','doi.org/10.1016/S0099-5428(07)33001-3','none'),(25,'Codeine','CN1CCC23C4C1CC5=C2C(=C(C=C5)OC)OC3C(C=C4)O',8.22,'easy','doi.org/10.1016/S0099-5428(07)33001-3','none'),(26,'Colchicine','CC(=O)NC1CCC2=CC(=C(C(=C2C3=CC=C(C(=O)C=C13)OC)OC)OC)OC',1.85,'hard','doi.org/10.1016/S0099-5428(07)33001-3','none'),(27,'Cyclobenzaprine','CN(C)CCC=C1C2=CC=CC=C2C=CC3=CC=CC=C31',8.47,'easy','doi.org/10.1016/S0099-5428(07)33001-3','none'),(28,'Cyclosporin','CCC1C(=O)N(CC(=O)N(C(C(=O)NC(C(=O)N(C(C(=O)NC(C(=O)NC(C(=O)N(C(C(=O)N(C(C(=O)N(C(C(=O)N(C(C(=O)N1)C(C(C)CC=CC)O)C)C(C)C)C)CC(C)C)C)CC(C)C)C)C)C)CC(C)C)C)C(C)C)CC(C)C)C)C',6.90,'hard','doi.org/10.1016/S0099-5428(07)33001-3','none'),(29,'Dextromethorphan','CN1CCC23CCCCC2C1CC4=C3C=C(C=C4)OC',8.30,'easy','doi.org/10.1016/S0099-5428(07)33001-3','none'),(30,'Diazepam','CN1C(=O)CN=C(C2=C1C=CC(=C2)Cl)C3=CC=CC=C3',3.30,'easy','doi.org/10.1016/S0099-5428(07)33001-3','none'),(31,'Diclofenac','C1=CC=C(C(=C1)CC(=O)O)NC2=C(C=CC=C2Cl)Cl',3.99,'easy','doi.org/10.1016/S0099-5428(07)33001-3','none'),(32,'Dicyclomine','CCN(CC)CCOC(=O)C1(CCCCC1)C2CCCCC2',9.00,'easy','doi.org/10.1016/S0099-5428(07)33001-3','none'),(33,'Diphenhydramine','CN(C)CCOC(C1=CC=CC=C1)C2=CC=CC=C2',9.12,'easy','doi.org/10.1016/S0099-5428(07)33001-3','none'),(34,'Doxepin','CN(C)CCC=C1C2=CC=CC=C2COC3=CC=CC=C31',8.96,'easy','doi.org/10.1016/S0099-5428(07)33001-3','none'),(35,'Erythromycin','CCC1C(C(C(C(=O)C(CC(C(C(C(C(C(=O)O1)C)OC2CC(C(C(O2)C)O)(C)OC)C)OC3C(C(CC(O3)C)N(C)C)O)(C)O)C)C)O)(C)O',8.60,'easy','doi.org/10.1016/S0099-5428(07)33001-3','none'),(36,'Escitalopram','CN(C)CCCC1(C2=C(CO1)C=C(C=C2)C#N)C3=CC=C(C=C3)F',9.50,'easy','10.1515/CCLM.2007.108','none'),(37,'Ethinyl estradiol','CC12CCC3C(C1CCC2(C#C)O)CCC4=C3C=CC(=C4)O',10.40,'easy','doi.org/10.1016/S0099-5428(07)33001-3','none'),(38,'Ezetimibe','C1=CC(=CC=C1C2C(C(=O)N2C3=CC=C(C=C3)F)CCC(C4=CC=C(C=C4)F)O)O',9.66,'easy','doi.org/10.1080%2F10915810500527093','none'),(39,'Famotidine','C1=C(N=C(S1)N=C(N)N)CSCCC(=NS(=O)(=O)N)N',6.76,'hard','doi.org/10.1016/S0099-5428(07)33001-3','acid'),(40,'Fentanyl','CCC(=O)N(C1CCN(CC1)CCC2=CC=CC=C2)C3=CC=CC=C3',8.40,'easy','accessdata.fda.gov/drugsatfda_docs/label/2014/019813s063lbl.pdf','none'),(41,'Fluconazole','C1=CC(=C(C=C1F)F)C(CN2C=NC=N2)(CN3C=NC=N3)O',1.76,'hard','doi.org/10.1016/S0099-5428(07)33001-3','base'),(42,'Fluvoxamine','COCCCCC(=NOCCN)C1=CC=C(C=C1)C(F)(F)F',8.70,'easy','doi.org/10.1016/S0099-5428(07)33001-3','none'),(43,'Furosemide','C1=COC(=C1)CNC2=CC(=C(C=C2C(=O)O)S(=O)(=O)N)Cl',3.80,'easy','doi.org/10.1016/S0099-5428(07)33001-3','none'),(44,'Glimepiride','CCC1=C(CN(C1=O)C(=O)NCCC2=CC=C(C=C2)S(=O)(=O)NC(=O)NC3CCC(CC3)C)C',6.20,'hard','products.sanofi.ca/en/amaryl.pdf','acid'),(45,'Glipizide','CC1=CN=C(C=N1)C(=O)NCCC2=CC=C(C=C2)S(=O)(=O)NC(=O)NC3CCCCC3',5.90,'hard','doi.org/10.1016/S0099-5428(07)33001-3','acid'),(46,'Glyburide','COC1=C(C=C(C=C1)Cl)C(=O)NCCC2=CC=C(C=C2)S(=O)(=O)NC(=O)NC3CCCCC3',5.30,'hard','doi.org/10.1016/S0099-5428(07)33001-3','acid'),(47,'Haloperidol','C1CN(CCC1(C2=CC=C(C=C2)Cl)O)CCCC(=O)C3=CC=C(C=C3)F',8.96,'easy','doi.org/10.1016/S0099-5428(07)33001-3','none'),(48,'Hydrocodone','CN1CCC23C4C1CC5=C2C(=C(C=C5)OC)OC3C(=O)CC4',8.30,'easy','doi.org/10.1016/S0099-5428(07)33001-3','none'),(49,'Hydromorphone','CN1CCC23C4C1CC5=C2C(=C(C=C5)O)OC3C(=O)CC4',8.15,'easy','doi.org/10.1016/S0099-5428(07)33001-3','none'),(50,'Hyoscyamine','CN1C2CCC1CC(C2)OC(=O)C(CO)C3=CC=CC=C3',9.68,'easy','doi.org/10.1016/S0099-5428(07)33001-3','none'),(51,'Ibuprofen','CC(C)CC1=CC=C(C=C1)C(C)C(=O)O',4.45,'easy','doi.org/10.1016/S0099-5428(07)33001-3','none'),(52,'Imipramine','CN(C)CCCN1C2=CC=CC=C2CCC3=CC=CC=C31',9.62,'easy','doi.org/10.1016/S0099-5428(07)33001-3','none'),(53,'Indomethacin','CC1=C(C2=C(N1C(=O)C3=CC=C(C=C3)Cl)C=CC(=C2)OC)CC(=O)O',4.30,'easy','doi.org/10.1016/S0099-5428(07)33001-3','none'),(54,'Lamotrigine','C1=CC(=C(C(=C1)Cl)Cl)C2=C(N=C(N=N2)N)N',5.70,'hard','accessdata.fda.gov/drugsatfda_docs/label/2009/022251,020764s029,020241s036lbl.pdf','base'),(55,'Lidocaine','CCN(CC)CC(=O)NC1=C(C=CC=C1C)C',7.96,'easy','doi.org/10.1016/S0099-5428(07)33001-3','none'),(56,'Lisinopril','C1CC(N(C1)C(=O)C(CCCCN)NC(CCC2=CC=CC=C2)C(=O)O)C(=O)O',2.50,'easy','Jatte, K. P., Chakole, R. D., & Charde, M. S. (2021). Degradation profiling of lisinopril and hydrochlorothiazide by RP- HPLC method with QbD approach. Asian Journal of Pharmaceutical Analysis, 11(4) Retrieved from http://libproxy.usc.edu/login?url=https://www.proquest.com/scholarly-journals/degradation-profiling-lisinopril/docview/2618789859/se-2?accountid=14749','none'),(57,'Loperamide','CN(C)C(=O)C(CCN1CCC(CC1)(C2=CC=C(C=C2)Cl)O)(C3=CC=CC=C3)C4=CC=CC=C4',8.66,'easy','doi.org/10.1016/S0099-5428(07)33001-3','none'),(58,'Losartan','CCCCC1=NC(=C(N1CC2=CC=C(C=C2)C3=CC=CC=C3C4=NNN=N4)CO)Cl',4.90,'hard','doi.org/10.1016/0731-7085(96)01740-2','acid'),(59,'Metformin','CN(C)C(=N)N=C(N)N',12.40,'hard','https://www.accessdata.fda.gov/drugsatfda_docs/label/2006/021748s002lbl.pdf','base'),(60,'Methadone','CCC(=O)C(CC(C)N(C)C)(C1=CC=CC=C1)C2=CC=CC=C2',8.25,'easy','doi.org/10.1016/S0099-5428(07)33001-3','none'),(61,'Methylphenidate','COC(=O)C(C1CCCCN1)C2=CC=CC=C2',8.90,'easy','doi.org/10.1016/S0099-5428(07)33001-3','none'),(62,'Metoprolol','CC(C)NCC(COC1=CC=C(C=C1)CCOC)O',9.55,'easy','doi.org/10.1016/S0099-5428(07)33001-3','none'),(63,'Metronidazole','CC1=NC=C(N1CCO)[N+](=O)[O-]',2.62,'hard','doi.org/10.1016/S0099-5428(07)33001-3','base'),(64,'Minoxidil','C1CCN(CC1)C2=NC(=N)N(C(=C2)N)O',4.61,'easy','doi.org/10.1016/S0099-5428(07)33001-3','none'),(65,'Mirtazepine','CN1CCN2C(C1)C3=CC=CC=C3CC4=C2N=CC=C4',7.10,'easy','doi.org/10.1016/S0099-5428(07)33001-3','none'),(66,'Morphine','CN1CCC23C4C1CC5=C2C(=C(C=C5)O)OC3C(C=C4)O',8.21,'easy','doi.org/10.1016/S0099-5428(07)33001-3','none'),(67,'Naloxone','C=CCN1CCC23C4C(=O)CCC2(C1CC5=C3C(=C(C=C5)O)O4)O',7.94,'easy','doi.org/10.1016/S0099-5428(07)33001-3','none'),(68,'Naltrexone','C1CC1CN2CCC34C5C(=O)CCC3(C2CC6=C4C(=C(C=C6)O)O5)O',8.38,'easy','doi.org/10.1016/S0099-5428(07)33001-3','none'),(69,'Naproxen','CC(C1=CC2=C(C=C1)C=C(C=C2)OC)C(=O)O',4.15,'easy','doi.org/10.1016/S0099-5428(07)33001-3','none'),(70,'Nitrofurantoin','C1C(=O)NC(=O)N1N=CC2=CC=C(O2)[N+](=O)[O-]',7.00,'easy','doi.org/10.1016/S0099-5428(07)33001-3','none'),(71,'Nortriptyline','CNCCC=C1C2=CC=CC=C2CCC3=CC=CC=C31',10.10,'easy','doi.org/10.1016/S0099-5428(07)33001-3','none'),(72,'Ondansetron','CC1=NC=CN1CC2CCC3=C(C2=O)C4=CC=CC=C4N3C',7.40,'hard','doi.org/10.1016/S0099-5428(07)33001-3','base'),(73,'Oxybutynin','CCN(CC)CC#CCOC(=O)C(C1CCCCC1)(C2=CC=CC=C2)O',7.00,'easy','doi.org/10.1016/S0099-5428(07)33001-3','none'),(74,'Oxycodone','CN1CCC23C4C(=O)CCC2(C1CC5=C3C(=C(C=C5)OC)O4)O',8.53,'easy','doi.org/10.1016/S0099-5428(07)33001-3','none'),(75,'Paroxetine','C1CNCC(C1C2=CC=C(C=C2)F)COC3=CC4=C(C=C3)OCO4',9.51,'easy','doi.org/10.1016/S0099-5428(07)33001-3','none'),(76,'Penicillin','CC1(C(N2C(S1)C(C2=O)NC(=O)CC3=CC=CC=C3)C(=O)O)C',2.73,'easy','doi.org/10.1016/S0099-5428(07)33001-3','none'),(77,'Phenazopyridine','C1=CC=C(C=C1)N=NC2=C(N=C(C=C2)N)N',5.15,'easy','doi.org/10.1016/S0099-5428(07)33001-3','none'),(78,'Phentermine','CC(C)(CC1=CC=CC=C1)N',10.11,'easy','doi.org/10.1016/S0099-5428(07)33001-3','none'),(79,'Phenytoin','C1=CC=C(C=C1)C2(C(=O)NC(=O)N2)C3=CC=CC=C3',8.31,'hard','doi.org/10.1016/S0099-5428(07)33001-3','acid'),(80,'Promethazine','CC(CN1C2=CC=CC=C2SC3=CC=CC=C31)N(C)C',8.99,'easy','doi.org/10.1016/S0099-5428(07)33001-3','none'),(81,'Propranolol','CC(C)NCC(COC1=CC=CC2=CC=CC=C21)O',9.53,'easy','doi.org/10.1016/S0099-5428(07)33001-3','none'),(82,'Pseudoephedrine','CC(C(C1=CC=CC=C1)O)NC',9.22,'easy','doi.org/10.1016/S0099-5428(07)33001-3','none'),(83,'Risperidone','CC1=C(C(=O)N2CCCCC2=N1)CCN3CCC(CC3)C4=NOC5=C4C=CC(=C5)F',8.20,'easy','doi.org/10.1016/S0099-5428(07)33001-3','none'),(84,'Scopolamine','CN1C2CC(CC1C3C2O3)OC(=O)C(CO)C4=CC=CC=C4',7.55,'easy','doi.org/10.1016/S0099-5428(07)33001-3','none'),(85,'Sertraline','CNC1CCC(C2=CC=CC=C12)C3=CC(=C(C=C3)Cl)Cl',9.48,'easy','doi.org/10.1016/S0099-5428(07)33001-3','none'),(86,'Sildenafil','CCCC1=NN(C2=C1N=C(NC2=O)C3=C(C=CC(=C3)S(=O)(=O)N4CCN(CC4)C)OCC)C',8.70,'easy','doi.org/10.1016/S0099-5428(07)33001-3','none'),(87,'Solifenacin ','C1CN2CCC1C(C2)OC(=O)N3CCC4=CC=CC=C4C3C5=CC=CC=C5',8.50,'easy','DOI: 10.2165/00003088-200948050-00001','none'),(88,'Sumatriptan','CNS(=O)(=O)CC1=CC2=C(C=C1)NC=C2CCN(C)C',9.50,'easy','doi.org/10.1016/S0099-5428(07)33001-3','none'),(89,'Tamoxifen','CCC(=C(C1=CC=CC=C1)C2=CC=C(C=C2)OCCN(C)C)C3=CC=CC=C3',8.71,'easy','doi.org/10.1016/S0099-5428(07)33001-3','none'),(90,'Temazepam','CN1C2=C(C=C(C=C2)Cl)C(=NC(C1=O)O)C3=CC=CC=C3',1.60,'easy','doi.org/10.1016/S0099-5428(07)33001-3','none'),(91,'Terazosin','COC1=C(C=C2C(=C1)C(=NC(=N2)N3CCN(CC3)C(=O)C4CCCO4)N)OC',7.10,'hard','doi.org/10.1016/S0099-5428(07)33001-3','none'),(92,'Tramadol','CN(C)CC1CCCCC1(C2=CC(=CC=C2)OC)O',9.41,'easy','accessdata.fda.gov/drugsatfda_docs/label/2010/022370s000lbl.pdf','none'),(93,'Trazodone','C1CN(CCN1CCCN2C(=O)N3C=CC=CC3=N2)C4=CC(=CC=C4)Cl',6.71,'easy','doi.org/10.1016/S0099-5428(07)33001-3','none'),(94,'Triamterene','C1=CC=C(C=C1)C2=NC3=C(N=C(N=C3N=C2N)N)N',6.20,'hard','doi.org/10.1016/S0099-5428(07)33001-3','none'),(95,'Valproate','CCCC(CCC)C(=O)O',4.60,'easy','doi.org/10.1016/S0099-5428(07)33001-3','none'),(96,'Venlafaxine','CN(C)CC(C1=CC=C(C=C1)OC)C2(CCCCC2)O',9.50,'easy','doi.org/10.1016/S0099-5428(07)33001-3','none'),(97,'Verapamil','CC(C)C(CCCN(C)CCC1=CC(=C(C=C1)OC)OC)(C#N)C2=CC(=C(C=C2)OC)OC',8.90,'easy','doi.org/10.1016/S0099-5428(07)33001-3','none'),(98,'Warfarin','CC(=O)CC(C1=CC=CC=C1)C2=C(C3=CC=CC=C3OC2=O)O',5.00,'hard','doi.org/10.1016/S0099-5428(07)33001-3','acid'),(99,'Zolmitriptan','CN(C)CCC1=CNC2=C1C=C(C=C2)CC3COC(=O)N3',9.64,'easy','astrazeneca.ca/content/dam/az-ca/downloads/productinformation/zomig-product-monograph-en.pdf','none'),(100,'Zolpidem','CC1=CC=C(C=C1)C2=C(N3C=C(C=CC3=N2)C)CC(=O)N(C)C',6.16,'hard','doi.org/10.1016/j.ejps.2020.105534','base');
/*!40000 ALTER TABLE `pharmaceutics_molecule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pharmaceutics_molecule_fg_pka`
--

DROP TABLE IF EXISTS `pharmaceutics_molecule_fg_pka`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pharmaceutics_molecule_fg_pka` (
  `id` varchar(0) DEFAULT NULL,
  `index` varchar(0) DEFAULT NULL,
  `pKa` varchar(0) DEFAULT NULL,
  `pKa_type` varchar(0) DEFAULT NULL,
  `FunctionalGroup_id` varchar(0) DEFAULT NULL,
  `Molecule_id` varchar(0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pharmaceutics_molecule_fg_pka`
--

LOCK TABLES `pharmaceutics_molecule_fg_pka` WRITE;
/*!40000 ALTER TABLE `pharmaceutics_molecule_fg_pka` DISABLE KEYS */;
/*!40000 ALTER TABLE `pharmaceutics_molecule_fg_pka` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pharmaceutics_protein`
--

DROP TABLE IF EXISTS `pharmaceutics_protein`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pharmaceutics_protein` (
  `id` varchar(0) DEFAULT NULL,
  `Name` varchar(0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pharmaceutics_protein`
--

LOCK TABLES `pharmaceutics_protein` WRITE;
/*!40000 ALTER TABLE `pharmaceutics_protein` DISABLE KEYS */;
/*!40000 ALTER TABLE `pharmaceutics_protein` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pharmaceutics_query`
--

DROP TABLE IF EXISTS `pharmaceutics_query`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pharmaceutics_query` (
  `id` tinyint(4) DEFAULT NULL,
  `MapMode` tinyint(4) DEFAULT NULL,
  `Time` bigint(20) DEFAULT NULL,
  `Molecules_id` tinyint(4) DEFAULT NULL,
  `User_id` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pharmaceutics_query`
--

LOCK TABLES `pharmaceutics_query` WRITE;
/*!40000 ALTER TABLE `pharmaceutics_query` DISABLE KEYS */;
INSERT INTO `pharmaceutics_query` VALUES (34,0,1661798780719,56,1),(35,0,1661798803734,56,1),(36,0,1661798856647,1,1),(37,0,1661798914976,56,1),(38,0,1661799156107,56,1),(39,0,1661799253354,56,1),(40,0,1661799292014,56,1),(41,0,1661801262981,2,1),(42,0,1661801650409,2,1);
/*!40000 ALTER TABLE `pharmaceutics_query` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pharmaceutics_quiz1attempt`
--

DROP TABLE IF EXISTS `pharmaceutics_quiz1attempt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pharmaceutics_quiz1attempt` (
  `id` varchar(0) DEFAULT NULL,
  `Timestamp` varchar(0) DEFAULT NULL,
  `Secs_Taken` varchar(0) DEFAULT NULL,
  `Answer1` varchar(0) DEFAULT NULL,
  `Answer2` varchar(0) DEFAULT NULL,
  `Answer3` varchar(0) DEFAULT NULL,
  `Answer4` varchar(0) DEFAULT NULL,
  `Answer5` varchar(0) DEFAULT NULL,
  `User_id` varchar(0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pharmaceutics_quiz1attempt`
--

LOCK TABLES `pharmaceutics_quiz1attempt` WRITE;
/*!40000 ALTER TABLE `pharmaceutics_quiz1attempt` DISABLE KEYS */;
/*!40000 ALTER TABLE `pharmaceutics_quiz1attempt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pharmaceutics_quiz2attempt`
--

DROP TABLE IF EXISTS `pharmaceutics_quiz2attempt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pharmaceutics_quiz2attempt` (
  `id` varchar(0) DEFAULT NULL,
  `Timestamp` varchar(0) DEFAULT NULL,
  `Secs_Taken` varchar(0) DEFAULT NULL,
  `Answer1` varchar(0) DEFAULT NULL,
  `Answer2` varchar(0) DEFAULT NULL,
  `Answer3` varchar(0) DEFAULT NULL,
  `Answer4` varchar(0) DEFAULT NULL,
  `Answer5` varchar(0) DEFAULT NULL,
  `User_id` varchar(0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pharmaceutics_quiz2attempt`
--

LOCK TABLES `pharmaceutics_quiz2attempt` WRITE;
/*!40000 ALTER TABLE `pharmaceutics_quiz2attempt` DISABLE KEYS */;
/*!40000 ALTER TABLE `pharmaceutics_quiz2attempt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pharmaceutics_solvedquery`
--

DROP TABLE IF EXISTS `pharmaceutics_solvedquery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pharmaceutics_solvedquery` (
  `id` varchar(0) DEFAULT NULL,
  `Query_id` varchar(0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pharmaceutics_solvedquery`
--

LOCK TABLES `pharmaceutics_solvedquery` WRITE;
/*!40000 ALTER TABLE `pharmaceutics_solvedquery` DISABLE KEYS */;
/*!40000 ALTER TABLE `pharmaceutics_solvedquery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pharmaceutics_subjectivefeedback`
--

DROP TABLE IF EXISTS `pharmaceutics_subjectivefeedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pharmaceutics_subjectivefeedback` (
  `id` varchar(0) DEFAULT NULL,
  `Difficulty` varchar(0) DEFAULT NULL,
  `Molecule_id` varchar(0) DEFAULT NULL,
  `User_id` varchar(0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pharmaceutics_subjectivefeedback`
--

LOCK TABLES `pharmaceutics_subjectivefeedback` WRITE;
/*!40000 ALTER TABLE `pharmaceutics_subjectivefeedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `pharmaceutics_subjectivefeedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pharmaceutics_user`
--

DROP TABLE IF EXISTS `pharmaceutics_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pharmaceutics_user` (
  `id` tinyint(4) DEFAULT NULL,
  `Key` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pharmaceutics_user`
--

LOCK TABLES `pharmaceutics_user` WRITE;
/*!40000 ALTER TABLE `pharmaceutics_user` DISABLE KEYS */;
INSERT INTO `pharmaceutics_user` VALUES (1,'dlnfrnpzsp8nodvgaios38vlg3lx3fjw');
/*!40000 ALTER TABLE `pharmaceutics_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pharmaceutics_user_FGs_Solved`
--

DROP TABLE IF EXISTS `pharmaceutics_user_FGs_Solved`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pharmaceutics_user_FGs_Solved` (
  `id` tinyint(4) DEFAULT NULL,
  `user_id` tinyint(4) DEFAULT NULL,
  `molecule_id` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pharmaceutics_user_FGs_Solved`
--

LOCK TABLES `pharmaceutics_user_FGs_Solved` WRITE;
/*!40000 ALTER TABLE `pharmaceutics_user_FGs_Solved` DISABLE KEYS */;
INSERT INTO `pharmaceutics_user_FGs_Solved` VALUES (1,1,92);
/*!40000 ALTER TABLE `pharmaceutics_user_FGs_Solved` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pharmaceutics_user_Maps_Solved`
--

DROP TABLE IF EXISTS `pharmaceutics_user_Maps_Solved`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pharmaceutics_user_Maps_Solved` (
  `id` varchar(0) DEFAULT NULL,
  `user_id` varchar(0) DEFAULT NULL,
  `molecule_id` varchar(0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pharmaceutics_user_Maps_Solved`
--

LOCK TABLES `pharmaceutics_user_Maps_Solved` WRITE;
/*!40000 ALTER TABLE `pharmaceutics_user_Maps_Solved` DISABLE KEYS */;
/*!40000 ALTER TABLE `pharmaceutics_user_Maps_Solved` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pharmaceutics_user_Pkas_Solved`
--

DROP TABLE IF EXISTS `pharmaceutics_user_Pkas_Solved`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pharmaceutics_user_Pkas_Solved` (
  `id` tinyint(4) DEFAULT NULL,
  `user_id` tinyint(4) DEFAULT NULL,
  `molecule_id` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pharmaceutics_user_Pkas_Solved`
--

LOCK TABLES `pharmaceutics_user_Pkas_Solved` WRITE;
/*!40000 ALTER TABLE `pharmaceutics_user_Pkas_Solved` DISABLE KEYS */;
INSERT INTO `pharmaceutics_user_Pkas_Solved` VALUES (17,1,56),(1,1,92);
/*!40000 ALTER TABLE `pharmaceutics_user_Pkas_Solved` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pharmaceutics_user_Qb2s_Solved`
--

DROP TABLE IF EXISTS `pharmaceutics_user_Qb2s_Solved`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pharmaceutics_user_Qb2s_Solved` (
  `id` varchar(0) DEFAULT NULL,
  `user_id` varchar(0) DEFAULT NULL,
  `molecule_id` varchar(0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pharmaceutics_user_Qb2s_Solved`
--

LOCK TABLES `pharmaceutics_user_Qb2s_Solved` WRITE;
/*!40000 ALTER TABLE `pharmaceutics_user_Qb2s_Solved` DISABLE KEYS */;
/*!40000 ALTER TABLE `pharmaceutics_user_Qb2s_Solved` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pharmaceutics_user_Rotbs_Solved`
--

DROP TABLE IF EXISTS `pharmaceutics_user_Rotbs_Solved`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pharmaceutics_user_Rotbs_Solved` (
  `id` tinyint(4) DEFAULT NULL,
  `user_id` tinyint(4) DEFAULT NULL,
  `molecule_id` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pharmaceutics_user_Rotbs_Solved`
--

LOCK TABLES `pharmaceutics_user_Rotbs_Solved` WRITE;
/*!40000 ALTER TABLE `pharmaceutics_user_Rotbs_Solved` DISABLE KEYS */;
INSERT INTO `pharmaceutics_user_Rotbs_Solved` VALUES (10,1,56),(1,1,92);
/*!40000 ALTER TABLE `pharmaceutics_user_Rotbs_Solved` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sqlite_sequence`
--

DROP TABLE IF EXISTS `sqlite_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sqlite_sequence` (
  `name` varchar(32) DEFAULT NULL,
  `seq` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sqlite_sequence`
--

LOCK TABLES `sqlite_sequence` WRITE;
/*!40000 ALTER TABLE `sqlite_sequence` DISABLE KEYS */;
INSERT INTO `sqlite_sequence` VALUES ('django_migrations',28),('django_admin_log',54),('django_content_type',17),('auth_permission',68),('auth_group',0),('auth_user',1),('pharmaceutics_molecule',103),('pharmaceutics_query',42),('pharmaceutics_user',1),('pharmaceutics_user_Pkas_Solved',19),('pharmaceutics_user_FGs_Solved',9),('pharmaceutics_user_Rotbs_Solved',10),('pharmaceutics_subjectivefeedback',2);
/*!40000 ALTER TABLE `sqlite_sequence` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-22 15:26:22
