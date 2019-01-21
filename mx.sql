-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: localhost    Database: mxdb
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add slide',7,'add_slide'),(20,'Can change slide',7,'change_slide'),(21,'Can delete slide',7,'delete_slide'),(22,'Can add user',8,'add_user'),(23,'Can change user',8,'change_user'),(24,'Can delete user',8,'delete_user'),(25,'Can add good',9,'add_good'),(26,'Can change good',9,'change_good'),(27,'Can delete good',9,'delete_good'),(28,'Can add cart',10,'add_cart'),(29,'Can change cart',10,'change_cart'),(30,'Can delete cart',10,'delete_cart'),(31,'Can add order',11,'add_order'),(32,'Can change order',11,'change_order'),(33,'Can delete order',11,'delete_order'),(34,'Can add ordergoods',12,'add_ordergoods'),(35,'Can change ordergoods',12,'change_ordergoods'),(36,'Can delete ordergoods',12,'delete_ordergoods');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
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
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
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
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(10,'mx','cart'),(9,'mx','good'),(11,'mx','order'),(12,'mx','ordergoods'),(7,'mx','slide'),(8,'mx','user'),(6,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-01-11 09:36:40.909612'),(2,'auth','0001_initial','2019-01-11 09:36:41.233958'),(3,'admin','0001_initial','2019-01-11 09:36:41.301904'),(4,'admin','0002_logentry_remove_auto_add','2019-01-11 09:36:41.338167'),(5,'contenttypes','0002_remove_content_type_name','2019-01-11 09:36:41.431270'),(6,'auth','0002_alter_permission_name_max_length','2019-01-11 09:36:41.450279'),(7,'auth','0003_alter_user_email_max_length','2019-01-11 09:36:41.484343'),(8,'auth','0004_alter_user_username_opts','2019-01-11 09:36:41.504291'),(9,'auth','0005_alter_user_last_login_null','2019-01-11 09:36:41.537150'),(10,'auth','0006_require_contenttypes_0002','2019-01-11 09:36:41.543495'),(11,'auth','0007_alter_validators_add_error_messages','2019-01-11 09:36:41.562567'),(12,'auth','0008_alter_user_username_max_length','2019-01-11 09:36:41.601111'),(13,'mx','0001_initial','2019-01-11 09:36:41.615737'),(14,'sessions','0001_initial','2019-01-11 09:36:41.635698'),(15,'mx','0002_user','2019-01-12 07:43:40.633497'),(16,'mx','0003_auto_20190113_1613','2019-01-13 16:14:04.782716'),(17,'mx','0004_auto_20190113_1638','2019-01-13 16:38:09.425907'),(18,'mx','0005_good_gray','2019-01-14 09:29:51.065028'),(19,'mx','0006_cart','2019-01-15 12:30:18.574053'),(20,'mx','0007_auto_20190117_0117','2019-01-17 01:17:57.855796'),(21,'mx','0008_auto_20190117_0139','2019-01-17 01:39:53.305928'),(22,'mx','0009_order_ordergoods','2019-01-18 11:34:48.874776');
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
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('ccehxwlyx09dxxffl8hokfpihud4l18e','ZTE4ZDgwZjJhMjkyMDMwOThlOGVlM2Y0MWJiYzU1ZTE3NGZjYTJhMzp7InRva2VuIjoiNDljOGI3YmIzMTE4ZTk3YmZhYjk4ODhhMzAxN2NhY2EifQ==','2019-01-31 16:14:20.475669'),('qk7wv84xtloj78tu1uedqg39s0sk7cjf','ZGU2YmVlMzEzZjUxMGFmN2EzMzQ2MGM2OGUxNjcwYWM1Yzc0YjMzYzp7InRva2VuIjoiZTc3MDc2NGQ3ZGI1OWQ4NTYzMThhMTUzODI4YTAzNWYifQ==','2019-01-29 11:37:46.256183');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mx_cart`
--

DROP TABLE IF EXISTS `mx_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mx_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` int(11) NOT NULL,
  `isselect` tinyint(1) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mx_cart_goods_id_a998e0c4_fk_mx_good_id` (`goods_id`),
  KEY `mx_cart_user_id_5fc9351a_fk_mx_user_id` (`user_id`),
  CONSTRAINT `mx_cart_goods_id_a998e0c4_fk_mx_good_id` FOREIGN KEY (`goods_id`) REFERENCES `mx_good` (`id`),
  CONSTRAINT `mx_cart_user_id_5fc9351a_fk_mx_user_id` FOREIGN KEY (`user_id`) REFERENCES `mx_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mx_cart`
--

LOCK TABLES `mx_cart` WRITE;
/*!40000 ALTER TABLE `mx_cart` DISABLE KEYS */;
INSERT INTO `mx_cart` VALUES (12,1,1,1,15);
/*!40000 ALTER TABLE `mx_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mx_good`
--

DROP TABLE IF EXISTS `mx_good`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mx_good` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(256) NOT NULL,
  `name` varchar(256) NOT NULL,
  `des` varchar(256) NOT NULL,
  `price` double NOT NULL,
  `gray` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mx_good`
--

LOCK TABLES `mx_good` WRITE;
/*!40000 ALTER TABLE `mx_good` DISABLE KEYS */;
INSERT INTO `mx_good` VALUES (1,'img/lists_1.jpg','Dolce Gabbana 杜嘉班纳','SICILY 小牛皮 女士 两用包',8680,10086),(2,'img/lists_2.jpg','Fendi 芬迪','牛皮 女士 斜挎包',12300,15666),(3,'img/lists_3.jpg','Prada 普拉达','牛皮  男仕 平底鞋',9882,12345);
/*!40000 ALTER TABLE `mx_good` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mx_order`
--

DROP TABLE IF EXISTS `mx_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mx_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(11) NOT NULL,
  `createtime` datetime(6) NOT NULL,
  `identifier` varchar(256) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mx_order_user_id_691dc4b1_fk_mx_user_id` (`user_id`),
  CONSTRAINT `mx_order_user_id_691dc4b1_fk_mx_user_id` FOREIGN KEY (`user_id`) REFERENCES `mx_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mx_order`
--

LOCK TABLES `mx_order` WRITE;
/*!40000 ALTER TABLE `mx_order` DISABLE KEYS */;
INSERT INTO `mx_order` VALUES (1,0,'2019-01-18 12:59:49.609375','15478163890.5683008613788443',15),(2,0,'2019-01-18 13:07:41.148036','1547816861',15),(3,0,'2019-01-18 13:10:04.178999','15478170040',15),(4,0,'2019-01-18 13:10:55.287982','1547817055.46584987588092763',15),(5,0,'2019-01-18 13:11:18.708127','15478170785074649979483407',15),(6,0,'2019-01-19 02:05:21.843678','154786352104763922775920315',15),(7,0,'2019-01-19 02:26:28.291328','15478647883833495399565262',15);
/*!40000 ALTER TABLE `mx_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mx_ordergoods`
--

DROP TABLE IF EXISTS `mx_ordergoods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mx_ordergoods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mx_ordergoods_goods_id_ebe5c8d6_fk_mx_good_id` (`goods_id`),
  KEY `mx_ordergoods_order_id_a4ee25aa_fk_mx_order_id` (`order_id`),
  CONSTRAINT `mx_ordergoods_goods_id_ebe5c8d6_fk_mx_good_id` FOREIGN KEY (`goods_id`) REFERENCES `mx_good` (`id`),
  CONSTRAINT `mx_ordergoods_order_id_a4ee25aa_fk_mx_order_id` FOREIGN KEY (`order_id`) REFERENCES `mx_order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mx_ordergoods`
--

LOCK TABLES `mx_ordergoods` WRITE;
/*!40000 ALTER TABLE `mx_ordergoods` DISABLE KEYS */;
INSERT INTO `mx_ordergoods` VALUES (1,4,2,1),(2,1,3,1),(3,8,1,2),(4,3,3,3),(5,3,2,4),(6,1,1,5),(7,1,2,6),(8,4,1,7);
/*!40000 ALTER TABLE `mx_ordergoods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mx_slide`
--

DROP TABLE IF EXISTS `mx_slide`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mx_slide` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mx_slide`
--

LOCK TABLES `mx_slide` WRITE;
/*!40000 ALTER TABLE `mx_slide` DISABLE KEYS */;
INSERT INTO `mx_slide` VALUES (1,'img/s1.jpg'),(2,'img/s2.jpg'),(3,'img/s3.jpg'),(4,'img/s4.jpg'),(5,'img/s5.jpg'),(6,'img/s6.jpg'),(7,'img/s7.jpg');
/*!40000 ALTER TABLE `mx_slide` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mx_user`
--

DROP TABLE IF EXISTS `mx_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mx_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(30) NOT NULL,
  `password` varchar(256) NOT NULL,
  `token` varchar(256) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mx_user`
--

LOCK TABLES `mx_user` WRITE;
/*!40000 ALTER TABLE `mx_user` DISABLE KEYS */;
INSERT INTO `mx_user` VALUES (13,'13798521606','9719e9ec82e925135b20e0fc519c3bf9','b39e11c624c2e1510df8616af1e3b545'),(14,'13333333333','101143e860826ca9705f989a208e3ddc','5cc23752fd9f46255c0a5c0d67c990e0'),(15,'13798521605','9719e9ec82e925135b20e0fc519c3bf9','49c8b7bb3118e97bfab9888a3017caca');
/*!40000 ALTER TABLE `mx_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-19 15:41:38
