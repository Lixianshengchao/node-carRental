-- MySQL dump 10.13  Distrib 5.6.12, for Win64 (x86_64)
--
-- Host: localhost    Database: zuche
-- ------------------------------------------------------
-- Server version	5.6.12-log

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
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(11) NOT NULL DEFAULT '',
  `city` varchar(15) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'zhangsan','shenzhen'),(2,'lisi','hunan'),(3,'lhr','shanghai'),(4,'hrope','beijing'),(5,'wuxing','hainan');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_bank`
--

DROP TABLE IF EXISTS `z_bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_bank` (
  `bankid` int(11) NOT NULL AUTO_INCREMENT,
  `bankname` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`bankid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_bank`
--

LOCK TABLES `z_bank` WRITE;
/*!40000 ALTER TABLE `z_bank` DISABLE KEYS */;
INSERT INTO `z_bank` VALUES (1,'ucai'),(2,'Didi'),(3,'zhouGuang'),(4,'shouqi');
/*!40000 ALTER TABLE `z_bank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_bank_stat`
--

DROP TABLE IF EXISTS `z_bank_stat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_bank_stat` (
  `bankid` int(11) NOT NULL DEFAULT '0',
  `cbrand` varchar(16) NOT NULL DEFAULT '',
  `ccount` int(11) NOT NULL DEFAULT '0',
  `btype` varchar(16) NOT NULL DEFAULT '',
  UNIQUE KEY `bankid` (`bankid`,`cbrand`,`btype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_bank_stat`
--

LOCK TABLES `z_bank_stat` WRITE;
/*!40000 ALTER TABLE `z_bank_stat` DISABLE KEYS */;
INSERT INTO `z_bank_stat` VALUES (1,'BMW',3,'520'),(2,'BMV',1,'520'),(3,'Mini',1,'230'),(4,'Volvo',2,'V40');
/*!40000 ALTER TABLE `z_bank_stat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_car`
--

DROP TABLE IF EXISTS `z_car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_car` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `bankid` int(11) NOT NULL DEFAULT '0',
  `cbrand` varchar(16) NOT NULL DEFAULT '',
  `ctype` tinyint(4) NOT NULL DEFAULT '0',
  `rtype` tinyint(4) NOT NULL DEFAULT '0',
  `cmaker` varchar(16) NOT NULL DEFAULT '',
  `btype` varchar(16) NOT NULL DEFAULT '',
  `price` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_car`
--

LOCK TABLES `z_car` WRITE;
/*!40000 ALTER TABLE `z_car` DISABLE KEYS */;
INSERT INTO `z_car` VALUES (1,4,1,'Volvo',2,2,'Volvo','V40',300),(2,0,1,'BMW',2,2,'VW','520',320),(3,0,1,'BMW',2,2,'VW','520',320),(4,0,1,'BMW',2,2,'VW','520',320),(5,0,4,'Volvo',0,2,'VM','V40',120),(6,0,4,'Volvo',0,2,'VM','V40',120),(7,0,2,'Mini',1,2,'BMW','230',120),(8,0,2,'BMW',0,2,'BMW','520',320);
/*!40000 ALTER TABLE `z_car` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_cart`
--

DROP TABLE IF EXISTS `z_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_cart` (
  `uid` int(11) NOT NULL DEFAULT '0',
  `gid` int(11) NOT NULL DEFAULT '0',
  `num` int(11) NOT NULL DEFAULT '0',
  `ctime` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `uid` (`uid`,`gid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_cart`
--

LOCK TABLES `z_cart` WRITE;
/*!40000 ALTER TABLE `z_cart` DISABLE KEYS */;
INSERT INTO `z_cart` VALUES (5,1,6,0),(5,2,2,0);
/*!40000 ALTER TABLE `z_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_user`
--

DROP TABLE IF EXISTS `z_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `z_user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(32) NOT NULL DEFAULT '',
  `password` varchar(32) NOT NULL DEFAULT '',
  `umoney` int(11) NOT NULL DEFAULT '0',
  `ugender` tinyint(4) NOT NULL DEFAULT '0',
  `uemail` varchar(64) NOT NULL DEFAULT '',
  `urealname` varchar(32) NOT NULL DEFAULT '',
  `uidentify` varchar(18) NOT NULL DEFAULT '',
  `salt` varchar(12) NOT NULL DEFAULT '',
  `carid` int(12) NOT NULL DEFAULT '0',
  `role` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `uname` (`uname`),
  UNIQUE KEY `uemail` (`uemail`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_user`
--

LOCK TABLES `z_user` WRITE;
/*!40000 ALTER TABLE `z_user` DISABLE KEYS */;
INSERT INTO `z_user` VALUES (1,'haobo','3bd42480ba08df1eb479c09af7e8a117',5093,1,'haobo@tal.com','haobo','123456789','52425141',0,0),(2,'wuxing','f52b8391abe0e4e0c93c047ced456d20',5268,1,'wuxing@ucai.cn','wuxing','123456789','60289348',0,1),(3,'zhihui','d987a18e9cfe74c1859fc7c8bac60926',8733,1,'zhihui@163.com','zhihui','12345678','36102701',0,0),(4,'duye','9d199c7702c743d37b2119cef7834680',6492,1,'duye@ucai.cn','duye','12345678','84410961',0,1),(5,'wuxing1','wuxing1',0,0,'wuxing1@ucai.cn','wuxing1','wuxing1','',0,0),(6,'wuxing2','wuxing2',0,0,'wuxing2@ucai.cn','wuxing2','wuxing2','',0,0);
/*!40000 ALTER TABLE `z_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-02 15:59:45
