-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: external
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
-- Table structure for table `sky`
--

DROP TABLE IF EXISTS `sky`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sky` (
  `username` varchar(45) NOT NULL,
  `key` varbinary(256) NOT NULL,
  PRIMARY KEY (`username`),
  UNIQUE KEY `key_UNIQUE` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sky`
--

LOCK TABLES `sky` WRITE;
/*!40000 ALTER TABLE `sky` DISABLE KEYS */;
INSERT INTO `sky` VALUES ('S378',_binary 'K9hMQ\Óhp\’r!äòı	≤†˜rØg§\‘\ƒ\ŸaDgvÜI\Â˙Qà<iÛ™ã±\'a†\Êæ}ÅÑSC»±Õ∂b]J'),('4fw',_binary '!q\–céπæö|\Ïîä{•'),('UHE',_binary 'jöÅbà%\ƒø`;n\rì\∆AC¡∏`~Ù\·(ı¸ÏÄî\„A7õ\Ï®Oêë\Ôûs\Z)\◊†u†\Êæ}ÅÑSC»±Õ∂b]J'),('ooo',_binary 'r\ vïK1jÙÅk\”DïgõKú\Í[c\‡j0)R	mvu+ q≤\Â	ìrT˝2˚†\Êæ}ÅÑSC»±Õ∂b]J'),('vvv',_binary 'ê üˆ{\‡˛ˇTà,ÿº\◊\‚\·\‡q\÷(C\\≠\'\‹ˇÜú5¶ØΩŸç8.\Ów) ïB-T\Ó †\Êæ}ÅÑSC»±Õ∂b]J'),('HO8',_binary '°#ñ∂JzYXçPd\‡\0≤\œM\È!•Ñt\0\◊˜´º\Ì?Ãæ∑U\Õ\‡\ )í/\Â\»RLóàá†\Êæ}ÅÑSC»±Õ∂b]J'),('gege',_binary '\Á?Ç£NÉı]¯\ \‡ahñ>(\‰x>Œàµ\“SUùU¡ÑÖ_\ÍΩŒæ~\‘¬≥†\Êæ}ÅÑSC»±Õ∂b]J'),('HHH',_binary 'Ú*˛±sm2ë	bWä\'h[ü\0∏©\·áXóäç≤ô\'5“®\”Bú\∆˝±WM∑o†\Êæ}ÅÑSC»±Õ∂b]J');
/*!40000 ALTER TABLE `sky` ENABLE KEYS */;
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
