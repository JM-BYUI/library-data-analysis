-- MySQL dump 10.13  Distrib 8.0.43, for macos15 (arm64)
--
-- Host: localhost    Database: librarydb
-- ------------------------------------------------------
-- Server version	8.0.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `author` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `birth_year` int DEFAULT NULL,
  `death_year` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES (1,'Andrzej','Sapkowski',1948,NULL),(2,'Susanna','Clarke',1959,NULL),(3,'C.S.','Lewis',1898,1963),(4,'Norm','Macdonald',1959,2021),(5,'Terry','Pratchett',1948,2015),(6,'John','Gardner',1933,1982),(7,'Timothy','Zahn',1951,NULL),(8,'Karen','Traviss',1960,NULL),(9,'John','Steakley',1951,2010),(10,'William','Goldman',1931,2018),(11,'Mark','Twain',1835,1910),(12,'Thomas','Harris',1940,NULL),(13,'Albert','Camus',1913,1960),(14,'P.G.','Wodehouse',1881,1975),(15,'George R.R.','Martin',1948,NULL),(16,'Thomas','Pynchon',1931,NULL),(17,'Jon','Ronson',1967,NULL),(18,'J.K.','Rowling',1965,NULL),(19,'Thomas','Ligotti',1953,NULL),(20,'Robert W.','Chambers',1865,1933),(21,'Douglas','Adams',1952,2001),(22,'Upton','Sinclair',1878,1968),(23,'Barbara','Kingsolver',1955,NULL),(24,'Howard Philips','Lovecraft',1890,1937),(25,'Cormac','McCarthy',1933,2023),(26,'Truman','Capote',1924,1984),(27,'Arthur','Machen',1863,1947),(28,'Anonymous','Anonymous',NULL,NULL),(29,'Thomas','Morton',1579,1647),(30,'William Hope','Hodgson',1877,1918),(31,'Anthony','Burgess',1917,1993);
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(120) NOT NULL,
  `page_length` int unsigned DEFAULT NULL,
  `year` int DEFAULT NULL,
  `audio_length` time DEFAULT NULL,
  `publisher_id` int unsigned DEFAULT NULL,
  `translator_id` int unsigned DEFAULT NULL,
  `review_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_book_publisher1_idx` (`publisher_id`),
  KEY `fk_book_translator1_idx` (`translator_id`),
  KEY `fk_book_review1_idx` (`review_id`),
  CONSTRAINT `fk_book_publisher1` FOREIGN KEY (`publisher_id`) REFERENCES `publisher` (`id`),
  CONSTRAINT `fk_book_review1` FOREIGN KEY (`review_id`) REFERENCES `review` (`id`),
  CONSTRAINT `fk_book_translator1` FOREIGN KEY (`translator_id`) REFERENCES `translator` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (1,'The Sword of Destiny',384,2015,'15:05:00',1,1,1),(2,'The Ladies of Grace Adieu and Other Stories',235,2006,'05:56:00',2,NULL,2),(3,'Mere Christianity',175,1952,'05:54:00',3,NULL,3),(4,'Based on a True Story: Not a Memoir',272,2016,'07:18:00',4,NULL,4),(5,'Guards, Guards!',384,1989,'10:10:00',1,NULL,5),(6,'Wyrd Sisters',352,1988,'09:33:00',1,NULL,6),(7,'Grendel',174,1971,'05:32:00',5,NULL,7),(8,'Men At Arms',377,1993,'09:48:00',1,NULL,8),(9,'Heir to the Empire',474,1991,'13:09:00',6,NULL,9),(10,'Witches Abroad',384,1991,'10:42:00',1,NULL,10),(11,'Star Wars Republic Commando Hard Contact',352,2004,'10:29:00',7,NULL,11),(12,'Piranesi',272,2020,'07:20:00',2,NULL,12),(13,'Armor',432,1984,'13:38:00',8,NULL,13),(14,'The Princess Bride',493,1973,'11:56:00',9,NULL,14),(15,'Blood of Elves',320,2008,'11:00:00',1,1,15),(16,'Huckleberry Finn',362,1885,'09:43:00',10,NULL,16),(17,'Hannibal',484,1999,'22:04:00',11,NULL,17),(18,'The Stranger',159,1946,'04:16:00',5,2,18),(19,'The Inimitable Jeeves',256,1923,'05:38:00',12,NULL,19),(20,'A Knight of the Seven Kingdoms',368,2015,'10:00:00',6,NULL,20),(21,'Time of Contempt',416,2013,'12:47:00',1,1,21),(22,'Baptism of Fire',352,2014,'12:00:00',1,1,22),(23,'Tower of Swallows',464,2016,'14:58:00',1,1,23),(24,'Lady of the Lake',544,2017,'20:18:00',1,1,24),(25,'The Crying of Lot 49',183,1966,'04:45:00',13,NULL,25),(26,'Them: Adventures With Extremists',337,2001,'09:49:00',14,NULL,26),(27,'The Men Who Stare At Goats',277,2004,'07:23:00',14,NULL,27),(28,'Harry Potter & the Sorcerer\'s Stone',223,1997,'08:18:00',2,NULL,28),(29,'Songs of a Dead Dreamer',165,1985,'07:51:00',15,NULL,29),(30,'Grimscribe: His Lives And Works',214,1991,'10:10:00',16,NULL,30),(31,'The King In Yellow',151,1895,'04:13:00',17,NULL,31),(32,'The Restaurant at the End of the Universe',256,1980,'05:47:00',18,NULL,32),(33,'Oil!',572,1927,'22:30:00',19,NULL,33),(34,'Harry Potter & the Chamber of Secrets',341,1998,'09:47:00',2,NULL,34),(35,'Demon Copperhead',560,2022,'21:03:00',20,NULL,35),(36,'The Call of Cthulhu and Other Weird Stories',201,1999,'04:22:00',21,NULL,36),(37,'No Country For Old Men',309,2005,'07:55:00',5,NULL,37),(38,'In Cold Blood',343,1966,'14:27:00',4,NULL,38),(39,'The Great God Pan & Other Weird Tales',341,1894,'12:51:00',22,NULL,39),(40,'Beowulf',144,1999,'02:13:00',23,3,40),(41,'The New English Canaan',386,1637,NULL,NULL,NULL,41),(42,'Inherent Vice',384,2009,'14:31:00',NULL,NULL,42),(43,'The House on the Borderland',152,1908,'05:42:00',NULL,NULL,43),(44,'Season of Storms',384,2018,'11:45:00',NULL,1,44),(45,'The Screwtape Letters',157,1942,'03:36:00',NULL,NULL,45),(46,'A Clockwork Orange',176,1962,'07:44:00',NULL,NULL,46);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_author`
--

DROP TABLE IF EXISTS `book_author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_author` (
  `book_author_id` int unsigned NOT NULL AUTO_INCREMENT,
  `author_order` int unsigned DEFAULT NULL,
  `book_id` int unsigned NOT NULL,
  `author_id` int unsigned NOT NULL,
  PRIMARY KEY (`book_author_id`,`book_id`,`author_id`),
  KEY `fk_book_author_book_idx` (`book_id`),
  KEY `fk_book_author_author1_idx` (`author_id`),
  CONSTRAINT `fk_book_author_author1` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`),
  CONSTRAINT `fk_book_author_book` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_author`
--

LOCK TABLES `book_author` WRITE;
/*!40000 ALTER TABLE `book_author` DISABLE KEYS */;
INSERT INTO `book_author` VALUES (1,1,1,1),(2,1,2,2),(3,1,3,3),(4,1,4,4),(5,1,5,5),(6,1,6,5),(7,1,7,6),(8,1,8,5),(9,1,9,7),(10,1,10,5),(11,1,11,8),(12,1,12,2),(13,1,13,9),(14,1,14,10),(15,1,15,1),(16,1,16,11),(17,1,17,12),(18,1,18,13),(19,1,19,14),(20,1,20,15),(21,1,21,1),(22,1,22,1),(23,1,23,1),(24,1,24,1),(25,1,25,16),(26,1,26,17),(27,1,27,17),(28,1,28,18),(29,1,29,19),(30,1,30,19),(31,1,31,20),(32,1,32,21),(33,1,33,22),(34,1,34,18),(35,1,35,23),(36,1,36,24),(37,1,37,25),(38,1,38,26),(39,1,39,27),(40,1,40,28),(41,1,41,29),(42,1,42,16),(43,1,43,30),(44,1,44,1),(45,1,45,3),(46,1,46,31);
/*!40000 ALTER TABLE `book_author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_genre`
--

DROP TABLE IF EXISTS `book_genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_genre` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `genre_order` int unsigned DEFAULT NULL,
  `book_id` int unsigned NOT NULL,
  `genre_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`,`book_id`,`genre_id`),
  KEY `fk_book_genre_book1_idx` (`book_id`),
  KEY `fk_book_genre_genre1_idx` (`genre_id`),
  CONSTRAINT `fk_book_genre_book1` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`),
  CONSTRAINT `fk_book_genre_genre1` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_genre`
--

LOCK TABLES `book_genre` WRITE;
/*!40000 ALTER TABLE `book_genre` DISABLE KEYS */;
INSERT INTO `book_genre` VALUES (1,1,1,1),(2,1,2,1),(3,2,2,10),(4,1,3,2),(5,2,3,8),(6,1,4,3),(7,1,5,1),(8,2,5,3),(9,1,6,1),(10,2,6,3),(11,1,7,1),(12,2,7,4),(13,3,7,8),(14,1,8,1),(15,2,8,3),(16,1,9,5),(17,1,10,1),(18,2,10,3),(19,1,11,5),(20,1,12,1),(21,1,13,5),(22,1,14,1),(23,2,14,3),(24,1,15,1),(25,1,16,6),(26,2,16,3),(27,3,16,10),(28,1,17,14),(29,2,17,9),(30,3,17,7),(31,1,18,8),(32,2,18,11),(33,1,19,3),(34,1,20,1),(35,1,21,1),(36,1,22,1),(37,1,23,1),(38,1,24,1),(39,1,25,4),(40,2,25,3),(41,1,26,2),(42,2,26,3),(43,1,27,2),(44,2,27,3),(45,1,28,1),(46,1,29,9),(47,1,30,9),(48,1,31,9),(49,2,31,12),(50,3,31,1),(51,1,32,5),(52,2,32,3),(53,1,33,10),(54,2,33,11),(55,1,34,1),(56,1,35,11),(57,1,36,9),(58,2,36,1),(59,3,36,5),(60,1,37,7),(61,2,37,13),(62,3,37,14),(63,1,38,2),(64,2,38,14),(65,1,39,9),(66,2,39,1),(67,1,40,1),(68,1,41,10),(69,1,42,4),(70,1,43,9),(71,1,44,1),(72,1,45,8),(73,1,46,9);
/*!40000 ALTER TABLE `book_genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_narrator`
--

DROP TABLE IF EXISTS `book_narrator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_narrator` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `narrator_order` int unsigned DEFAULT NULL,
  `book_id` int unsigned NOT NULL,
  `narrator_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`,`book_id`,`narrator_id`),
  KEY `fk_book_narrator_book1_idx` (`book_id`),
  KEY `fk_book_narrator_narrator1_idx` (`narrator_id`),
  CONSTRAINT `fk_book_narrator_book1` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`),
  CONSTRAINT `fk_book_narrator_narrator1` FOREIGN KEY (`narrator_id`) REFERENCES `narrator` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_narrator`
--

LOCK TABLES `book_narrator` WRITE;
/*!40000 ALTER TABLE `book_narrator` DISABLE KEYS */;
INSERT INTO `book_narrator` VALUES (1,1,1,1),(2,1,2,2),(3,2,2,3),(4,1,3,4),(5,1,4,5),(6,1,5,6),(7,1,6,7),(8,1,7,8),(9,1,8,6),(10,1,9,9),(11,1,10,7),(12,1,11,10),(13,1,12,11),(14,1,13,12),(15,1,14,13),(16,1,15,1),(17,1,16,14),(18,1,17,15),(19,1,18,15),(20,1,19,16),(21,1,20,17),(22,1,21,1),(23,1,22,1),(24,1,23,1),(25,1,24,1),(26,1,25,18),(27,1,26,19),(28,1,27,19),(29,1,28,20),(30,1,29,21),(31,1,30,21),(32,1,31,22),(33,1,32,23),(34,1,33,24),(35,1,34,20),(36,1,35,25),(37,1,36,26),(38,1,37,27),(39,1,38,15),(40,1,39,28),(41,1,40,29);
/*!40000 ALTER TABLE `book_narrator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genre` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `genre_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `genre_name_UNIQUE` (`genre_name`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre`
--

LOCK TABLES `genre` WRITE;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` VALUES (3,'Comedy'),(14,'Crime'),(1,'Fantasy'),(10,'Historical'),(9,'Horror'),(11,'Non-Genre Fiction'),(2,'Nonfiction'),(8,'Philosophical'),(6,'Picaresque'),(4,'Postmodern'),(12,'Romance'),(5,'Science Fiction'),(15,'Self Help'),(16,'Superhero'),(7,'Thriller'),(13,'Western');
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `narrator`
--

DROP TABLE IF EXISTS `narrator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `narrator` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `narrator`
--

LOCK TABLES `narrator` WRITE;
/*!40000 ALTER TABLE `narrator` DISABLE KEYS */;
INSERT INTO `narrator` VALUES (1,'Peter','Kenny'),(2,'Simon','Prebble'),(3,'Davina','Porter'),(4,'Geoffrey','Howard'),(5,'Norm','Macdonald'),(6,'Jon','Culshaw'),(7,'Indira','Varma'),(8,'George','Guidall'),(9,'Marc','Thompson'),(10,'Jonathan','Davis'),(11,'Chiweetel','Ejiofor'),(12,'Tom','Weiner'),(13,'Rob','Reiner'),(14,'Elijah','Wood'),(15,'Scott','Brick'),(16,'Stephen','Fry'),(17,'Harry','Lloyd'),(18,'George','Wilson'),(19,'Jon','Ronson'),(20,'Jim','Dale'),(21,'Jon','Padgett'),(22,'Guy','Barnes'),(23,'Martin','Freeman'),(24,'Grover','Gardner'),(25,'Charlie','Thurston'),(26,'William','Roberts'),(27,'Tom','Stechshulte'),(28,'Peter','Wickham'),(29,'Seamus','Heaney');
/*!40000 ALTER TABLE `narrator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publisher`
--

DROP TABLE IF EXISTS `publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publisher` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `publisher_name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `publisher_name_UNIQUE` (`publisher_name`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publisher`
--

LOCK TABLES `publisher` WRITE;
/*!40000 ALTER TABLE `publisher` DISABLE KEYS */;
INSERT INTO `publisher` VALUES (19,'Albert & Charles Boni'),(5,'Alfred A. Knopf'),(18,'Arthur Barker'),(6,'Bantam Books'),(2,'Bloomsbury'),(16,'Carroll & Graf'),(10,'Charles L. Webster & Company'),(8,'DAW Books'),(7,'Del Rey/Ballantine'),(11,'Delacorte Press'),(17,'F. Tennyson Neely'),(23,'Faber & Faber'),(3,'Geoffrey Bles'),(1,'Gollancz'),(9,'Harcourt, Brace, & World'),(20,'Harper Collins'),(12,'Herbert Jenkins'),(13,'J.B. Lippincott & Co.'),(22,'John Lane'),(21,'Penguin Classics'),(14,'Picador'),(4,'Random House'),(15,'Silver Scarab Press');
/*!40000 ALTER TABLE `publisher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `id` int NOT NULL AUTO_INCREMENT,
  `score` float unsigned DEFAULT NULL,
  `fav` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (1,4,0),(2,3.5,0),(3,3,0),(4,2,0),(5,5,1),(6,4,0),(7,3,0),(8,4,0),(9,3.5,0),(10,3,0),(11,3.5,0),(12,5,1),(13,3,0),(14,5,1),(15,4,0),(16,5,1),(17,2,0),(18,3,0),(19,3.5,0),(20,5,0),(21,4,0),(22,4,0),(23,4.5,0),(24,5,1),(25,3.5,0),(26,4,0),(27,4,0),(28,4,0),(29,4,0),(30,4,0),(31,4,0),(32,3.5,0),(33,5,1),(34,3,0),(35,3.5,0),(36,4,0),(37,5,1),(38,4,0),(39,3.5,0),(40,4.5,0),(41,2.5,0),(42,3.5,0),(43,3.5,0),(44,3,0),(45,5,1),(46,4.5,1);
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translator`
--

DROP TABLE IF EXISTS `translator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `translator` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `original_language` varchar(70) DEFAULT NULL,
  `name` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translator`
--

LOCK TABLES `translator` WRITE;
/*!40000 ALTER TABLE `translator` DISABLE KEYS */;
INSERT INTO `translator` VALUES (1,'Polish','David French'),(2,'French','Matthew Ward'),(3,'Old English','Seamus Heaney');
/*!40000 ALTER TABLE `translator` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-07 18:20:51
