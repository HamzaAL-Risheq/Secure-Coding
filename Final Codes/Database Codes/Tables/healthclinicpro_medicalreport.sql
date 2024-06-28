-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: healthclinicpro
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `medicalreport`
--

DROP TABLE IF EXISTS `medicalreport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicalreport` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Medical Report` longtext NOT NULL,
  `Treatment` longtext NOT NULL,
  `Patient Username` varchar(45) NOT NULL,
  `Doctor Username` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `patientusername_fk_idx` (`Patient Username`),
  KEY `doctorusername_fk_idx` (`Doctor Username`),
  CONSTRAINT `doctorusername_fk` FOREIGN KEY (`Doctor Username`) REFERENCES `employeelogin` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `patientusername_fk` FOREIGN KEY (`Patient Username`) REFERENCES `patientlogin` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicalreport`
--

LOCK TABLES `medicalreport` WRITE;
/*!40000 ALTER TABLE `medicalreport` DISABLE KEYS */;
INSERT INTO `medicalreport` VALUES (3,'Valid medical report','Prescription','HHH','S378'),(5,'This is a very long medical report that exceeds the allowed limit of 2000 characters. Please enter a shorter report.','Prescription','HHH','S378'),(6,'Valid','Prescription','HHH','S378'),(7,'Valid','Prescription','HHH','S378'),(8,'Valid','Prescription','HHH','S378'),(9,'Valid','Prescription','HHH','S378'),(10,'Valid','Prescription','HHH','S378'),(11,'Valid','Prescription','HHH','S378'),(12,'Valid','Prescription','HHH','S378'),(13,'Valid','Prescription','HHH','S378'),(14,'Valid','Prescription','HHH','S378'),(16,'Valid','Prescription','HHH','S378'),(18,'Valid','Prescription','HHH','S378'),(20,'Valid','Prescription','HHH','S378'),(22,'Valid','Prescription','HHH','S378'),(24,'Valid','Prescription','HHH','S378'),(26,'Valid','Prescription','HHH','S378'),(27,'Valid','Prescription','HHH','S378'),(28,'Valid','Prescription','HHH','S378'),(30,'Valid','Prescription','HHH','S378'),(32,'Valid','Prescription','HHH','S378'),(34,'Valid','Prescription','HHH','S378'),(36,'Valid','Prescription','HHH','S378'),(38,'Valid','Prescription','HHH','S378'),(40,'Valid','Prescription','HHH','S378'),(42,'Valid','Prescription','HHH','S378'),(44,'Valid','Prescription','HHH','S378'),(46,'Valid','Prescription','HHH','S378'),(48,'Valid','Prescription','HHH','S378'),(51,'www','www','HHH','S378'),(52,'Valid','Prescription','HHH','S378'),(53,'Valid','Prescription','HHH','S378');
/*!40000 ALTER TABLE `medicalreport` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-05 20:52:35
