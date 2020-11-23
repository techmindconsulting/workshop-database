-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: videoflix_db
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.12-MariaDB-log

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

-- -----------------------------------------------------
-- Schema videoflix_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `videoflix_db` DEFAULT CHARACTER SET utf8 ;
USE `videoflix_db` ;

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(45) NOT NULL,
  PRIMARY KEY (`id`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre`
--

LOCK TABLES `genre` WRITE;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` VALUES (1,'Action'),(2,'Adventure'),(3,'Animation'),(4,'Biography'),(5,'Comedy'),(6,'Crime'),(7,'Drama'),(8,'Horror'),(9,'Music'),(10,'Mistery'),(11,'Romance'),(12,'Thriller'),(13,'War');
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie`
--

DROP TABLE IF EXISTS `movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `lang` varchar(45) NOT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `time` int(11) NOT NULL,
  `year` varchar(4) NOT NULL,
  `released_at` date DEFAULT NULL,
  `synopsis` text DEFAULT NULL,
  `country` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie`
--

LOCK TABLES `movie` WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
INSERT INTO `movie` VALUES (1,'Vertigo','en',NULL,128,'1958','1958-08-24',NULL,'UK'),(2,'The innocents','en',NULL,100,'1961','1962-02-19',NULL,'UK'),(3,'The Deer Hunter','en',NULL,183,'1978','1979-03-08',NULL,'US'),(4,'Amadeus','en',NULL,160,'1984','1985-01-07',NULL,'UK'),(5,'Blade Runner','en',NULL,117,'1982','1982-09-09',NULL,'US'),(6,'Eyes Wide Shut','en',NULL,159,'1999','1999-09-09',NULL,'US'),(7,'The Usual Suspects','en',NULL,106,'1995','1995-08-25',NULL,'US'),(8,'Chinatown','en',NULL,130,'1974','1974-08-09',NULL,'IND'),(9,'Boogie Nights','en',NULL,155,'1997','1998-02-16',NULL,'US'),(10,'Annie Hall','en',NULL,93,'1977','1977-04-20',NULL,'US'),(11,'Princess Monoke','jp',NULL,134,'1997','2001-10-19',NULL,'JP'),(12,'The Shawshank Redemption','en',NULL,142,'1994','1995-02-17',NULL,'US'),(13,'American Beauty','en',NULL,122,'1999','1999-01-23',NULL,'US'),(14,'Titanic','en',NULL,194,'1997','1998-01-23',NULL,'US'),(15,'Good Will Hunting','en',NULL,126,'1997','1998-06-03',NULL,'US'),(16,'Deliverance','en',NULL,109,'1972','1982-10-05',NULL,'US'),(17,'Trainspotting','en',NULL,94,'1996','1996-02-23',NULL,'US'),(18,'The prestige','en',NULL,130,'2006','2006-11-10',NULL,'US'),(19,'Donnie Darko','en',NULL,113,'2001','2001-11-10',NULL,'US'),(20,'Slumdog Millionaire','en',NULL,120,'2008','2009-01-09',NULL,'US'),(21,'Aliens','en',NULL,137,'1986','1986-08-29',NULL,'US'),(22,'Beyond the sea','en',NULL,118,'2004','2004-11-26',NULL,'US'),(23,'Avatar','en',NULL,162,'2009','2009-12-17',NULL,'US'),(24,'Seven Samourai','jp',NULL,207,'1954','1954-04-26',NULL,'JP'),(25,'Spirited Away','jp',NULL,125,'2001','2003-09-12',NULL,'JP'),(26,'Back to the Future','en',NULL,116,'1985','1985-12-04',NULL,'US'),(27,'Braveheart','en',NULL,178,'1995','1995-09-08',NULL,'IS'),(28,'Lawrence of Arabia','en',NULL,216,'1962','1962-12-11',NULL,'US');
/*!40000 ALTER TABLE `movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_casting`
--

DROP TABLE IF EXISTS `movie_casting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movie_casting` (
  `people_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `starred_as` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`people_id`,`movie_id`),
  KEY `fk_people_has_movie_movie1_idx` (`movie_id`),
  KEY `fk_people_has_movie_people1_idx` (`people_id`),
  CONSTRAINT `fk_people_has_movie_movie1` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_people_has_movie_people1` FOREIGN KEY (`people_id`) REFERENCES `people` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_casting`
--

LOCK TABLES `movie_casting` WRITE;
/*!40000 ALTER TABLE `movie_casting` DISABLE KEYS */;
INSERT INTO `movie_casting` VALUES (1,1,'John Scottie Ferguson'),(2,2,'Miss Giddens'),(3,4,'T.E. Lawrence'),(4,5,'Michael'),(5,6,'Antonio Salieri'),(6,7,'Rick Deckard'),(7,8,'Alice Harford'),(8,9,'McManus'),(9,10,'J.J. Gittes'),(10,11,'Eddie Adams'),(11,12,'Alvy Singer'),(12,13,'San'),(13,14,'Andy Dufresne'),(14,15,'Lester Burnham'),(14,24,'Bobby Darin'),(15,16,'Rose DeWitt Bukater'),(16,17,'Sean Maguire'),(17,18,'Ed'),(18,19,'Renton'),(19,20,'Alfred Borden'),(20,21,'Elizabeth Darko'),(21,22,'Older Jamal'),(22,23,'Ripley');
/*!40000 ALTER TABLE `movie_casting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_direction`
--

DROP TABLE IF EXISTS `movie_direction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movie_direction` (
  `people_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  PRIMARY KEY (`people_id`,`movie_id`),
  KEY `fk_people_has_movie_movie2_idx` (`movie_id`),
  KEY `fk_people_has_movie_people2_idx` (`people_id`),
  CONSTRAINT `fk_people_has_movie_movie2` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_people_has_movie_people2` FOREIGN KEY (`people_id`) REFERENCES `people` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_direction`
--

LOCK TABLES `movie_direction` WRITE;
/*!40000 ALTER TABLE `movie_direction` DISABLE KEYS */;
INSERT INTO `movie_direction` VALUES (31,1),(32,2),(33,2),(35,5),(36,6),(37,7),(37,8),(38,9),(39,10),(40,11),(41,12),(42,13),(43,14),(44,15),(45,16),(45,23),(46,17),(47,18),(48,19),(48,22),(49,20),(50,21),(51,24);
/*!40000 ALTER TABLE `movie_direction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_genre`
--

DROP TABLE IF EXISTS `movie_genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movie_genre` (
  `movie_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL,
  PRIMARY KEY (`movie_id`,`genre_id`),
  KEY `fk_movie_has_genre_genre1_idx` (`genre_id`),
  KEY `fk_movie_has_genre_movie_idx` (`movie_id`),
  CONSTRAINT `fk_movie_has_genre_genre1` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_movie_has_genre_movie` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_genre`
--

LOCK TABLES `movie_genre` WRITE;
/*!40000 ALTER TABLE `movie_genre` DISABLE KEYS */;
INSERT INTO `movie_genre` VALUES (1,10),(3,8),(4,2),(5,13),(7,12),(8,10),(9,6),(12,5),(13,3),(14,6),(15,11),(18,2),(19,7),(22,7),(23,1),(24,9),(27,7),(28,10);
/*!40000 ALTER TABLE `movie_genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_review`
--

DROP TABLE IF EXISTS `movie_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movie_review` (
  `movie_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `stars` double DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`movie_id`,`user_id`),
  KEY `fk_movie_has_reviewer_reviewer1_idx` (`user_id`),
  KEY `fk_movie_has_reviewer_movie1_idx` (`movie_id`),
  CONSTRAINT `fk_movie_has_reviewer_movie1` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_movie_has_reviewer_reviewer1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_review`
--

LOCK TABLES `movie_review` WRITE;
/*!40000 ALTER TABLE `movie_review` DISABLE KEYS */;
INSERT INTO `movie_review` VALUES (1,1,8.4,NULL,'2020-11-23 01:09:39','2020-11-23 01:09:39'),(2,2,7.9,NULL,'2020-11-23 01:09:39','2020-11-23 01:09:39'),(4,3,8.3,NULL,'2020-11-23 01:09:39','2020-11-23 01:09:39'),(7,5,8.2,NULL,'2020-11-23 01:09:39','2020-11-23 01:09:39'),(10,8,5.6,NULL,'2020-11-23 01:09:39','2020-11-23 01:09:39'),(11,9,3,NULL,'2020-11-23 01:09:39','2020-11-23 01:09:39'),(12,10,8.1,NULL,'2020-11-23 01:09:39','2020-11-23 01:09:39'),(13,11,8.4,NULL,'2020-11-23 01:09:39','2020-11-23 01:09:39'),(15,13,7,NULL,'2020-11-23 01:09:39','2020-11-23 01:09:39'),(16,1,7.7,NULL,'2020-11-23 01:09:39','2020-11-23 01:09:39'),(17,14,4,NULL,'2020-11-23 01:09:39','2020-11-23 01:09:39'),(19,16,5,NULL,'2020-11-23 01:09:39','2020-11-23 01:09:39'),(21,17,8.1,NULL,'2020-11-23 01:09:39','2020-11-23 01:09:39'),(22,18,8,NULL,'2020-11-23 01:09:39','2020-11-23 01:09:39'),(23,18,8.4,NULL,'2020-11-23 01:09:39','2020-11-23 01:09:39'),(24,17,6.7,NULL,'2020-11-23 01:09:39','2020-11-23 01:09:39'),(25,7,8.6,NULL,'2020-11-23 01:09:39','2020-11-23 01:09:39'),(26,15,7.7,NULL,'2020-11-23 01:09:39','2020-11-23 01:09:39');
/*!40000 ALTER TABLE `movie_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_watch`
--

DROP TABLE IF EXISTS `movie_watch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movie_watch` (
  `user_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `time_watched` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`,`movie_id`),
  KEY `fk_user_has_movie_movie1_idx` (`movie_id`),
  KEY `fk_user_has_movie_user1_idx` (`user_id`),
  CONSTRAINT `fk_user_has_movie_movie1` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_movie_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_watch`
--

LOCK TABLES `movie_watch` WRITE;
/*!40000 ALTER TABLE `movie_watch` DISABLE KEYS */;
/*!40000 ALTER TABLE `movie_watch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `people`
--

DROP TABLE IF EXISTS `people`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `people` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(128) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `firstname` varchar(128) NOT NULL,
  `lastname` varchar(128) NOT NULL,
  `gender` varchar(1) NOT NULL,
  `country` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `people`
--

LOCK TABLES `people` WRITE;
/*!40000 ALTER TABLE `people` DISABLE KEYS */;
INSERT INTO `people` VALUES (1,'ROLE_ACTOR',NULL,'James','Stewart','M','US'),(2,'ROLE_ACTOR',NULL,'Deborah','Kerr','F','US'),(3,'ROLE_ACTOR',NULL,'Peter','OToole','M','US'),(4,'ROLE_ACTOR',NULL,'Robert','De Niro','M','US'),(5,'ROLE_ACTOR',NULL,'F. Murray','Abraham','M','US'),(6,'ROLE_ACTOR',NULL,'Harisson','Ford','M','US'),(7,'ROLE_ACTOR',NULL,'Nicole','Kidman','F','US'),(8,'ROLE_ACTOR',NULL,'Stephen','Baldwin','M','US'),(9,'ROLE_ACTOR',NULL,'Jack','Nicholson','M','US'),(10,'ROLE_ACTOR',NULL,'Mark','Wahlberg','M','US'),(11,'ROLE_ACTOR',NULL,'Woody','Allen','M','US'),(12,'ROLE_ACTOR',NULL,'Claire','Danes','F','US'),(13,'ROLE_ACTOR',NULL,'Tim','Robbins','M','US'),(14,'ROLE_ACTOR',NULL,'Kevin','Spacey','M','US'),(15,'ROLE_ACTOR',NULL,'Kate','Winslet','F','US'),(16,'ROLE_ACTOR',NULL,'Robin','Williams','M','US'),(17,'ROLE_ACTOR',NULL,'Jon','Voight','M','US'),(18,'ROLE_ACTOR',NULL,'Ewan','McGregor','M','US'),(19,'ROLE_ACTOR',NULL,'Christian','Bale','M','US'),(20,'ROLE_ACTOR',NULL,'Maggie','Gyllenhaal','F','US'),(21,'ROLE_ACTOR',NULL,'Dev','Patel','M','US'),(22,'ROLE_ACTOR',NULL,'Sigourney','Weaver','F','US'),(23,'ROLE_ACTOR',NULL,'Gérard','Depardieu','M','FR'),(24,'ROLE_ACTOR',NULL,'Jean Paul','Belmondo','M','FR'),(25,'ROLE_ACTOR',NULL,'Alain','Delon','M','FR'),(26,'ROLE_ACTOR',NULL,'Jean','Dujardin','M','FR'),(27,'ROLE_ACTOR',NULL,'Catherine','Deneuve','F','FR'),(28,'ROLE_ACTOR',NULL,'Marion','Dotillard','F','FR'),(29,'ROLE_ACTOR',NULL,'Omar','Sy','M','FR'),(30,'ROLE_ACTOR',NULL,'Leila','Bekhti','F','FR'),(31,'ROLE_DIRECTOR',NULL,'Alfred','Hitchcock','M','US'),(32,'ROLE_DIRECTOR',NULL,'Jack','Clayton','M','US'),(33,'ROLE_DIRECTOR',NULL,'David','Lean','M','US'),(34,'ROLE_DIRECTOR',NULL,'Michael','Cimino','M','US'),(35,'ROLE_DIRECTOR',NULL,'Milos','Forman','M','US'),(36,'ROLE_DIRECTOR',NULL,'Ridley','Scott','M','US'),(37,'ROLE_DIRECTOR',NULL,'Stanley','Kubrick','M','US'),(38,'ROLE_DIRECTOR',NULL,'Bryan','Singer','M','US'),(39,'ROLE_DIRECTOR',NULL,'Roman','Polanski','M','US'),(40,'ROLE_DIRECTOR',NULL,'Paul','Thomas Anderson','M','US'),(41,'ROLE_DIRECTOR',NULL,'Woody','Allen','M','US'),(42,'ROLE_DIRECTOR',NULL,'Hayao','Miyazaki','M','US'),(43,'ROLE_DIRECTOR',NULL,'Frank','Darabont','M','US'),(44,'ROLE_DIRECTOR',NULL,'Sam','Mendes','M','US'),(45,'ROLE_DIRECTOR',NULL,'James','Cameron','M','US'),(46,'ROLE_DIRECTOR',NULL,'Gus','Van Sant','M','US'),(47,'ROLE_DIRECTOR',NULL,'John','Boorman','M','US'),(48,'ROLE_DIRECTOR',NULL,'Danny','Boyle','M','US'),(49,'ROLE_DIRECTOR',NULL,'Christopher','Nolan','M','US'),(50,'ROLE_DIRECTOR',NULL,'Richard','Kelly','M','US'),(51,'ROLE_DIRECTOR',NULL,'Kevin','Spacey','M','US'),(52,'ROLE_DIRECTOR',NULL,'Andrei','Tarkovsky','M','US'),(53,'ROLE_DIRECTOR',NULL,'Peter','Jackson','M','US');
/*!40000 ALTER TABLE `people` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(128) NOT NULL,
  `lastname` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Righty','Sock','righty.sock@yopmail.com',NULL,'US',NULL),(2,'Jack','Malvern','jack.malvern@yopmail.com',NULL,'US',NULL),(3,'Flagrant','Baronessa','flagrant.baronessa@yopmail.com',NULL,'US',NULL),(4,'Alec','Shaw','alec.shaw@yopmail.com',NULL,'US',NULL),(5,'Victor','Woeltjen','victor.woeltjen@yopmail.com',NULL,'US',NULL),(6,'Simon','Wright','simon.wright@yopmail.com',NULL,'US',NULL),(7,'Neal','Wruck','neal.wruck@yopmail.com',NULL,'US',NULL),(8,'Paul','Monks','paul.monks@yopmail.com',NULL,'US',NULL),(9,'Mike','Salvati','mike.salvati@yopmail.com',NULL,'US',NULL),(10,'Wesley','Walker','wesley.walker@yopmail.com',NULL,'US',NULL),(11,'Sasha','Goldshtein','sasha.goldshtein@yopmail.com',NULL,'US',NULL),(12,'Josh','Cates','josh.cates@yopmail.com',NULL,'US',NULL),(13,'Krug','Stillo','krug.stillo@yopmail.com',NULL,'US',NULL),(14,'Scott','LeBrun','scott.lebrun@yopmail.com',NULL,'US',NULL),(15,'Hannah','Steele','hannah.steele@yopmail.com',NULL,'US',NULL),(16,'Vincent','Cadena','vincent.cadena@yopmail.com',NULL,'US',NULL),(17,'Brandt','Sponseller','brandt.sponseller@yopmail.com',NULL,'US',NULL),(18,'Richard','Adams','richard.adams@yopmail.com',NULL,'US',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-23  1:58:42
