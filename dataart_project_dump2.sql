-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: dataart_project
-- ------------------------------------------------------
-- Server version	5.7.10-log

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
-- Table structure for table `answer`
--

DROP TABLE IF EXISTS `answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `picture` longblob,
  `right` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_answer_question_idx` (`question_id`),
  CONSTRAINT `fk_answer_question` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer`
--

LOCK TABLES `answer` WRITE;
/*!40000 ALTER TABLE `answer` DISABLE KEYS */;
INSERT INTO `answer` VALUES (2,18,'yo',NULL,1),(3,18,'no',NULL,0),(4,19,'Okay',NULL,1),(5,19,'No!',NULL,0),(6,19,'Maybe',NULL,0),(7,19,'I don\'t know',NULL,0),(8,20,'This?',NULL,0),(9,20,'Or maybe this?',NULL,0),(10,20,'This!',NULL,1),(11,21,'Yes',NULL,0),(12,21,'No',NULL,1),(13,22,'af',NULL,0),(14,22,'af',NULL,0),(15,22,'at',NULL,1),(16,23,'ag',NULL,1),(17,23,'',NULL,0),(18,23,'ag',NULL,1),(19,24,'no',NULL,0),(20,25,'no',NULL,0),(21,26,'no',NULL,0);
/*!40000 ALTER TABLE `answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `test_id` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `picture` longblob,
  `mark` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_question_test_idx` (`test_id`),
  KEY `fk_question_type_idx` (`type_id`),
  CONSTRAINT `fk_question_test` FOREIGN KEY (`test_id`) REFERENCES `test` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_question_type` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (18,34,3,'as',NULL,0),(19,35,2,'How about question 1?',NULL,0),(20,35,2,'Question with two answers..',NULL,0),(21,35,1,'And the last one',NULL,0),(22,36,2,'as',NULL,0),(23,36,2,'Test',NULL,0),(24,37,1,'he',NULL,11),(25,37,1,'he',NULL,11),(26,37,1,'he',NULL,11);
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `text` longtext,
  `private` tinyint(1) DEFAULT NULL,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `mark` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
INSERT INTO `test` VALUES (1,'It\'s name is test 1','This is the first and the final test-test, muThis is the first and the final test-test, muahahaha This is the first and the final test-test, muahahaha This is the first and the final test-test, muahahaha This is the first and the final test-test, muahahaha This is the first and the final test-test, muahahaha This is the first and the final test-test, muahahaha This is the first and the final test-test, muahahaha This is the first and the final test-test, muahahaha This is the first and the final test-test, muahahaha This is the first and the final test-test, muahahaha This is the first and the final test-test, muahahaha This is the first and the final test-test, muahahahahahaha This is the first and the final test-test, muahahaha This is the first and the final test-test, muahahaha This is the first and the final test-test, muahahaha This is the first and the final test-test, muahahaha This is the first and the final test-test, muahahaha This is the first and the final test-test, muahahaha This is the first and the final test-test, muahahaha This is the first and the final test-test, muahahaha This is the first and the final test-test, muahahaha This is the first and the final test-test, muahahaha This is the first and the final test-test, muahahaha ',0,NULL,NULL,12),(7,'It\'s name is test 2',' some info about it ',1,'1970-01-02 00:00:00','1970-01-03 00:00:00',12),(34,'as','as',1,'1970-01-02 00:00:00','1970-01-03 00:00:00',14),(35,'Test number 3','A LOT OF TEXTA LOT OF TEXTA LOT OF TEXTA LOT OF TEXTA LOT OF TEXTA LOT OF TEXTA LOT OF TEXTA LOT OF TEXTA LOT OF TEXTA LOT OF TEXTA LOT OF TEXTA LOT OF TEXTA LOT OF TEXTA LOT OF TEXTA LOT OF TEXTA LOT OF TEXTA LOT OF TEXTA LOT OF TEXTA LOT OF TEXTA LOT OF TEXTA LOT OF TEXTA LOT OF TEXTA LOT OF TEXTA LOT OF TEXTA LOT OF TEXTA LOT OF TEXTA LOT OF TEXTA LOT OF TEXTA LOT OF TEXTA LOT OF TEXTA LOT OF TEXTA LOT OF TEXTA LOT OF TEXTA LOT OF TEXTA LOT OF TEXTA LOT OF TEXTA LOT OF TEXTA LOT OF TEXTA LOT OF TEXTA LOT OF TEXTA LOT OF TEXTA LOT OF TEXTA LOT OF TEXTA LOT OF TEXTA LOT OF TEXTA LOT OF TEXTA LOT OF TEXTA LOT OF TEXTA LOT OF TEXTA LOT OF TEXTA LOT OF TEXTA LOT OF TEXTA LOT OF TEXTA LOT OF TEXTA LOT OF TEXTA LOT OF TEXTA LOT OF TEXTA LOT OF TEXTA LOT OF TEXTA LOT OF TEXTA LOT OF TEXTA LOT OF TEXT',1,'1970-01-02 00:00:00','1970-01-03 00:00:00',16),(36,'Test 4','Yo',1,'1970-01-02 00:00:00','1970-01-03 00:00:00',50),(37,'ehehehe','hehehehe',1,'1970-01-02 00:00:00','1970-01-03 00:00:00',33);
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type`
--

DROP TABLE IF EXISTS `type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type`
--

LOCK TABLES `type` WRITE;
/*!40000 ALTER TABLE `type` DISABLE KEYS */;
INSERT INTO `type` VALUES (1,'One'),(2,'Several'),(3,'Full');
/*!40000 ALTER TABLE `type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `second_name` varchar(255) DEFAULT NULL,
  `telephone` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Dmitry','Saslky','380930589648','sdiker@ukr.net'),(2,'a','s','e','d'),(3,'a','f','e','g'),(4,'e','g','d','s'),(5,'1','1','1','1'),(6,'2','2','2','2');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_test`
--

DROP TABLE IF EXISTS `user_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `test_id` int(11) DEFAULT NULL,
  `mark` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_test_idx` (`test_id`),
  KEY `fk_user_idx` (`user_id`),
  CONSTRAINT `fk_test` FOREIGN KEY (`test_id`) REFERENCES `test` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_test`
--

LOCK TABLES `user_test` WRITE;
/*!40000 ALTER TABLE `user_test` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'dataart_project'
--

--
-- Dumping routines for database 'dataart_project'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-09 18:32:15
