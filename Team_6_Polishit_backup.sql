-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: group6_polishit
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Temporary view structure for view `engineers_feb_july`
--

DROP TABLE IF EXISTS `engineers_feb_july`;
/*!50001 DROP VIEW IF EXISTS `engineers_feb_july`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `engineers_feb_july` AS SELECT 
 1 AS `title`,
 1 AS `count_positions`,
 1 AS `published_at`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `ideal_position_req_skills`
--

DROP TABLE IF EXISTS `ideal_position_req_skills`;
/*!50001 DROP VIEW IF EXISTS `ideal_position_req_skills`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ideal_position_req_skills` AS SELECT 
 1 AS `job_id`,
 1 AS `salary_from_b2b`,
 1 AS `salary_to_b2b`,
 1 AS `title`,
 1 AS `skill_name`,
 1 AS `workplace_type_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job` (
  `job_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `remote` varchar(45) NOT NULL,
  `experience_level` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `workplace_type_id` int NOT NULL,
  PRIMARY KEY (`job_id`),
  UNIQUE KEY `job_id_UNIQUE` (`job_id`),
  KEY `fk_job_workplace_types1_idx` (`workplace_type_id`),
  CONSTRAINT `workplace_type_id` FOREIGN KEY (`workplace_type_id`) REFERENCES `workplace_types` (`workplace_types_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
INSERT INTO `job` VALUES (1,'Sr. Backend Engineer','TRUE','senior',1),(2,'Python Developer','TRUE','mid',1),(3,'Senior iOS Engineer','TRUE','senior',1),(4,'QA Specialist','TRUE','mid',1),(5,'Cloud Architect','TRUE','senior',1),(6,'Data Engineer','FALSE','mid',3),(7,'.NET Engineer','FALSE','senior',2),(8,'Technical Support ','FALSE','mid',3),(9,'IT Analyst','FALSE','mid',2),(10,'Java Developer','TRUE','mid',1),(11,'Database Developer','TRUE','mid',1),(12,'DevOps Engineer','FALSE','mid',3),(13,'Software Engineer','FALSE','mid',3),(14,'Data Engineer','TRUE ','mid',1),(15,'SQL Developer','FALSE','mid',1),(16,'C++ Developer','TRUE ','mid',1);
/*!40000 ALTER TABLE `job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_has_location`
--

DROP TABLE IF EXISTS `job_has_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_has_location` (
  `job_id` int NOT NULL,
  `location_id` int NOT NULL,
  KEY `fk_job_has_location_location1_idx` (`location_id`),
  KEY `fk_job_has_location_job1_idx` (`job_id`),
  CONSTRAINT `fk_job_has_location_job1` FOREIGN KEY (`job_id`) REFERENCES `job` (`job_id`),
  CONSTRAINT `fk_job_has_location_location1` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_has_location`
--

LOCK TABLES `job_has_location` WRITE;
/*!40000 ALTER TABLE `job_has_location` DISABLE KEYS */;
INSERT INTO `job_has_location` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,6),(8,4),(9,4),(10,7),(11,5),(12,8),(13,5),(14,9),(15,6),(16,8),(2,5),(2,4),(2,6),(4,5),(4,2),(4,8),(7,7),(7,8),(5,6),(5,8),(6,7),(8,5),(9,2),(10,9),(11,2),(12,9),(13,6),(14,2),(15,7),(16,9);
/*!40000 ALTER TABLE `job_has_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_has_postings`
--

DROP TABLE IF EXISTS `job_has_postings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_has_postings` (
  `job_id` int NOT NULL,
  `posting_id` int NOT NULL,
  KEY `fk_job_has_Postings_job1_idx` (`job_id`,`posting_id`),
  KEY `posting_id_idx` (`posting_id`),
  CONSTRAINT `job_id` FOREIGN KEY (`job_id`) REFERENCES `job` (`job_id`),
  CONSTRAINT `posting_id` FOREIGN KEY (`posting_id`) REFERENCES `postings` (`posting_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_has_postings`
--

LOCK TABLES `job_has_postings` WRITE;
/*!40000 ALTER TABLE `job_has_postings` DISABLE KEYS */;
INSERT INTO `job_has_postings` VALUES (1,1),(1,18),(1,20),(1,32),(2,2),(2,17),(2,31),(3,3),(4,4),(4,19),(4,24),(4,28),(5,5),(5,22),(5,26),(6,6),(6,21),(7,7),(7,23),(7,29),(8,9),(8,25),(9,10),(9,27),(9,30),(10,8),(11,12),(12,11),(13,13),(14,15),(15,14),(16,16);
/*!40000 ALTER TABLE `job_has_postings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_has_salaries`
--

DROP TABLE IF EXISTS `job_has_salaries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_has_salaries` (
  `job_id` int NOT NULL,
  `Salary_id` int NOT NULL,
  KEY `fk_job_has_Salaries_Salaries1_idx` (`Salary_id`),
  KEY `fk_job_has_Salaries_job1_idx` (`job_id`),
  CONSTRAINT `fk_job_has_Salaries_job1` FOREIGN KEY (`job_id`) REFERENCES `job` (`job_id`),
  CONSTRAINT `fk_job_has_Salaries_Salaries1` FOREIGN KEY (`Salary_id`) REFERENCES `salaries` (`Salary_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_has_salaries`
--

LOCK TABLES `job_has_salaries` WRITE;
/*!40000 ALTER TABLE `job_has_salaries` DISABLE KEYS */;
INSERT INTO `job_has_salaries` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),(11,11),(12,12),(13,13),(14,14),(15,15),(16,16);
/*!40000 ALTER TABLE `job_has_salaries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_has_skills`
--

DROP TABLE IF EXISTS `job_has_skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_has_skills` (
  `job_id` int NOT NULL,
  `skill_id` int NOT NULL,
  KEY `fk_job_has_skills_skills1_idx` (`skill_id`),
  KEY `fk_job_has_skills_job1_idx` (`job_id`),
  CONSTRAINT `fk_job_has_skills_job1` FOREIGN KEY (`job_id`) REFERENCES `job` (`job_id`),
  CONSTRAINT `fk_job_has_skills_skills1` FOREIGN KEY (`skill_id`) REFERENCES `skills` (`skill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_has_skills`
--

LOCK TABLES `job_has_skills` WRITE;
/*!40000 ALTER TABLE `job_has_skills` DISABLE KEYS */;
INSERT INTO `job_has_skills` VALUES (1,1),(1,2),(1,3),(2,4),(2,5),(2,6),(3,7),(3,8),(3,9),(4,10),(4,11),(5,12),(6,13),(6,14),(6,15),(7,16),(7,17),(7,18),(8,19),(8,20),(8,21),(9,22),(9,23),(9,13),(10,24),(10,25),(10,3),(11,26),(11,27),(11,28),(12,29),(12,30),(12,31),(13,32),(13,33),(13,3),(14,34),(14,35),(14,16),(15,36),(15,4),(15,16),(16,37),(16,38),(16,39);
/*!40000 ALTER TABLE `job_has_skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `location_id` int NOT NULL AUTO_INCREMENT,
  `city` varchar(20) NOT NULL,
  `country` varchar(20) NOT NULL,
  PRIMARY KEY (`location_id`),
  UNIQUE KEY `location_id_UNIQUE` (`location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,'Berlin','DE'),(2,'Bialystok','PL'),(3,'London','GB'),(4,'Warsaw','PL'),(5,'Krakow','PL'),(6,'Gdansk','PL'),(7,'Szczecin','PL'),(8,'Wroclaw','PL'),(9,'Poznan','PL'),(10,'Tallin','EE'),(11,'Helsinki','FI'),(12,'Amsterdam','NL'),(13,'Paris','FR'),(14,'Vilnius','LT'),(15,'Wien','AT');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `location_highest_salary`
--

DROP TABLE IF EXISTS `location_highest_salary`;
/*!50001 DROP VIEW IF EXISTS `location_highest_salary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `location_highest_salary` AS SELECT 
 1 AS `title`,
 1 AS `Salary`,
 1 AS `city`,
 1 AS `country`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `most_in_demand`
--

DROP TABLE IF EXISTS `most_in_demand`;
/*!50001 DROP VIEW IF EXISTS `most_in_demand`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `most_in_demand` AS SELECT 
 1 AS `title`,
 1 AS `num_postings`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `popular_locations`
--

DROP TABLE IF EXISTS `popular_locations`;
/*!50001 DROP VIEW IF EXISTS `popular_locations`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `popular_locations` AS SELECT 
 1 AS `country`,
 1 AS `city`,
 1 AS `num_postings`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `postings`
--

DROP TABLE IF EXISTS `postings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `postings` (
  `posting_id` int NOT NULL AUTO_INCREMENT,
  `published_at` datetime NOT NULL,
  `open_to_hire_ukrainians` varchar(45) NOT NULL,
  `if_permanent` varchar(45) NOT NULL,
  PRIMARY KEY (`posting_id`),
  UNIQUE KEY `posting_id_UNIQUE` (`posting_id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `postings`
--

LOCK TABLES `postings` WRITE;
/*!40000 ALTER TABLE `postings` DISABLE KEYS */;
INSERT INTO `postings` VALUES (1,'2022-07-07 10:25:00','TRUE','TRUE'),(2,'2022-06-30 14:57:00','TRUE','FALSE'),(3,'2022-04-22 11:45:00','FALSE','FALSE'),(4,'2022-10-02 12:00:00','FALSE','FALSE'),(5,'2022-10-03 10:01:00','FALSE','FALSE'),(6,'2022-09-29 15:00:00','TRUE','FALSE'),(7,'2022-07-13 11:20:00','TRUE','FALSE'),(8,'2022-04-21 12:00:00','TRUE','TRUE'),(9,'2022-04-18 11:00:00','FALSE','FALSE'),(10,'2022-02-21 16:00:00','FALSE','FALSE'),(11,'2022-03-21 13:00:00','TRUE','FALSE'),(12,'2022-08-04 06:31:00','FALSE','TRUE'),(13,'2022-10-28 08:00:00','FALSE','TRUE'),(14,'2022-03-18 08:00:00','FALSE','TRUE'),(15,'2022-04-25 08:00:00','FALSE','TRUE'),(16,'2022-07-30 13:00:00','FALSE','FALSE'),(17,'2022-06-30 14:57:00','TRUE','FALSE'),(18,'2022-07-07 10:25:00','TRUE','TRUE'),(19,'2022-10-02 12:00:00','FALSE','FALSE'),(20,'2022-07-07 10:25:00','TRUE','TRUE'),(21,'2022-09-29 15:00:00','TRUE','FALSE'),(22,'2022-10-03 10:01:00','FALSE','FALSE'),(23,'2022-07-13 11:20:00','TRUE','FALSE'),(24,'2022-10-02 12:00:00','FALSE','FALSE'),(25,'2022-04-18 11:00:00','FALSE','FALSE'),(26,'2022-10-03 10:01:00','FALSE','FALSE'),(27,'2022-02-21 16:00:00','FALSE','FALSE'),(28,'2022-10-02 12:00:00','FALSE','FALSE'),(29,'2022-07-13 11:20:00','TRUE','FALSE'),(30,'2022-02-21 16:00:00','FALSE','FALSE'),(31,'2022-06-30 14:57:00','TRUE','FALSE'),(32,'2022-07-07 10:25:00','TRUE','TRUE');
/*!40000 ALTER TABLE `postings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salaries`
--

DROP TABLE IF EXISTS `salaries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salaries` (
  `Salary_id` int NOT NULL AUTO_INCREMENT,
  `salary_from_b2b` decimal(10,2) DEFAULT NULL,
  `salary_to_b2b` decimal(10,2) DEFAULT NULL,
  `salary_currency_b2b` varchar(15) NOT NULL,
  PRIMARY KEY (`Salary_id`),
  UNIQUE KEY `Salary_id_UNIQUE` (`Salary_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salaries`
--

LOCK TABLES `salaries` WRITE;
/*!40000 ALTER TABLE `salaries` DISABLE KEYS */;
INSERT INTO `salaries` VALUES (1,32487.53,46409.16,'gbp'),(2,13116.94,17489.26,'gbp'),(3,43630.05,57989.30,'gbp'),(4,8242.11,13090.41,'eur'),(5,31513.95,43634.70,'eur'),(6,15999.39,24241.50,'eur'),(7,21685.50,24095.00,'eur'),(8,15000.00,25000.00,'pln'),(9,11200.00,12800.00,'pln'),(10,8000.00,16000.00,'pln'),(11,10500.00,14500.00,'pln'),(12,12000.00,18000.00,'pln'),(13,22000.00,30000.00,'pln'),(14,12000.00,17000.00,'pln'),(15,7000.00,11000.00,'pln'),(16,9000.00,16000.00,'pln');
/*!40000 ALTER TABLE `salaries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skills`
--

DROP TABLE IF EXISTS `skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skills` (
  `skill_id` int NOT NULL AUTO_INCREMENT,
  `skill_name` varchar(45) NOT NULL,
  `skill_value` varchar(45) NOT NULL,
  PRIMARY KEY (`skill_id`),
  UNIQUE KEY `skill_id_UNIQUE` (`skill_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skills`
--

LOCK TABLES `skills` WRITE;
/*!40000 ALTER TABLE `skills` DISABLE KEYS */;
INSERT INTO `skills` VALUES (1,'Kotlin','3'),(2,'Backend','3'),(3,'Java','4'),(4,'Flask','3'),(5,'English','4'),(6,'Python','4'),(7,'mobile','4'),(8,'iOS','4'),(9,'Swift','4'),(10,'Testing Mobile Apps','4'),(11,'Testing','4'),(12,'Architecture','1'),(13,'Kafka','3'),(14,'Scala','3'),(15,'Hadoop','3'),(16,'SQL','4'),(17,'ASP.NET Core (Web Api)','4'),(18,'.Net 5','4'),(19,'Jenkins','4'),(20,'CD','5'),(21,'CI','5'),(22,'SQL','4'),(23,'Oracle','4'),(24,'Hibernate','3'),(25,'SpringBoot','3'),(26,'SSIS','3'),(27,'SSRS','3'),(28,'MS SQL Server','3'),(29,'Networking','3'),(30,'Microsoft Azure Cloud','3'),(31,'Linux','4'),(32,'HTTP protocol','3'),(33,'REST API','3'),(34,'ETL','3'),(35,'NoSQL','4'),(36,'Analytical Thinking','3'),(37,'Qt','3'),(38,'C++','3'),(39,'C','3');
/*!40000 ALTER TABLE `skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workplace_types`
--

DROP TABLE IF EXISTS `workplace_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workplace_types` (
  `workplace_types_id` int NOT NULL AUTO_INCREMENT,
  `workplace_type` varchar(45) NOT NULL,
  PRIMARY KEY (`workplace_types_id`),
  UNIQUE KEY `workplace_types_id_UNIQUE` (`workplace_types_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workplace_types`
--

LOCK TABLES `workplace_types` WRITE;
/*!40000 ALTER TABLE `workplace_types` DISABLE KEYS */;
INSERT INTO `workplace_types` VALUES (1,'remote'),(2,'on site'),(3,'hybrid');
/*!40000 ALTER TABLE `workplace_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'group6_polishit'
--

--
-- Dumping routines for database 'group6_polishit'
--

--
-- Final view structure for view `engineers_feb_july`
--

/*!50001 DROP VIEW IF EXISTS `engineers_feb_july`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `engineers_feb_july` AS select `job`.`title` AS `title`,count(0) AS `count_positions`,`postings`.`published_at` AS `published_at` from ((`job` join `job_has_postings` on((`job`.`job_id` = `job_has_postings`.`job_id`))) join `postings` on((`job_has_postings`.`posting_id` = `postings`.`posting_id`))) where ((`job`.`title` like '%engineer%') and (`postings`.`published_at` >= '2021-07-07') and (`postings`.`published_at` < '2025-02-02')) group by `job`.`title`,`postings`.`published_at` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ideal_position_req_skills`
--

/*!50001 DROP VIEW IF EXISTS `ideal_position_req_skills`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ideal_position_req_skills` AS select `job`.`job_id` AS `job_id`,`salaries`.`salary_from_b2b` AS `salary_from_b2b`,`salaries`.`salary_to_b2b` AS `salary_to_b2b`,`job`.`title` AS `title`,`skills`.`skill_name` AS `skill_name`,`job`.`workplace_type_id` AS `workplace_type_id` from ((((`salaries` join `job_has_salaries` on((`job_has_salaries`.`Salary_id` = `salaries`.`Salary_id`))) join `job` on((`job`.`job_id` = `job_has_salaries`.`job_id`))) join `job_has_skills` on((`job_has_skills`.`job_id` = `job`.`job_id`))) join `skills` on((`skills`.`skill_id` = `job_has_skills`.`skill_id`))) where ((`job`.`workplace_type_id` = 1) and (`salaries`.`salary_from_b2b` > (select avg(`salaries`.`salary_from_b2b`) from `salaries`)) and (`salaries`.`salary_to_b2b` > (select avg(`salaries`.`salary_to_b2b`) from `salaries`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `location_highest_salary`
--

/*!50001 DROP VIEW IF EXISTS `location_highest_salary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `location_highest_salary` AS select `j`.`title` AS `title`,max(`s`.`salary_from_b2b`) AS `Salary`,`l`.`city` AS `city`,`l`.`country` AS `country` from ((((`job` `j` left join `job_has_location` `jhl` on((`j`.`job_id` = `jhl`.`job_id`))) left join `location` `l` on((`jhl`.`location_id` = `l`.`location_id`))) left join `job_has_salaries` `js` on((`j`.`job_id` = `js`.`job_id`))) left join `salaries` `s` on((`js`.`Salary_id` = `s`.`Salary_id`))) where (`s`.`salary_from_b2b` > (select avg(`salaries`.`salary_from_b2b`) from `salaries`)) group by `j`.`title`,`l`.`city`,`l`.`country` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `most_in_demand`
--

/*!50001 DROP VIEW IF EXISTS `most_in_demand`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `most_in_demand` AS select `job`.`title` AS `title`,count(`job_has_postings`.`posting_id`) AS `num_postings` from (`job` join `job_has_postings` on((`job`.`job_id` = `job_has_postings`.`job_id`))) group by `job`.`job_id` order by `num_postings` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `popular_locations`
--

/*!50001 DROP VIEW IF EXISTS `popular_locations`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `popular_locations` AS select `location`.`country` AS `country`,`location`.`city` AS `city`,count(`job_has_location`.`job_id`) AS `num_postings` from (`job_has_location` join `location` on((`job_has_location`.`location_id` = `location`.`location_id`))) group by `location`.`country`,`location`.`city` order by `num_postings` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-12 13:44:17
