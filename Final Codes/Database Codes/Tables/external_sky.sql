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
INSERT INTO `sky` VALUES ('S378',_binary 'K9hMQ\�hp\�r!���	���r�g�\�\�\�aDgv�I\��Q�<i���\'a�\�}��SCȱͶb]J'),('4fw',_binary '!q\�c����|\���{�'),('UHE',_binary 'j��b�%\��`;n\r�\�AC��`~�\�(��쀔\�A7�\�O��\�s\Z)\��u�\�}��SCȱͶb]J'),('ooo',_binary 'r\�v�K1j�k\�D�g�K�\�[c\�j0)R	mvu+ q�\�	�rT�2��\�}��SCȱͶb]J'),('vvv',_binary '�ʟ�{\���T�,ؼ\�\�\�\�q\�(C\\�\'\����5���ٍ8.\�w) �B-T\�ʠ\�}��SCȱͶb]J'),('HO8',_binary '�#�JzYX�Pd\�\0�\�M\�!��t\0\����\�?̾�U\�\�\�)�/\�\�RL����\�}��SCȱͶb]J'),('gege',_binary '\�?��N��]�\�\�ah�>�(\�x>Έ�\�SU�U����_\�ξ~\�³�\�}��SCȱͶb]J'),('HHH',_binary '�*��sm2�	bW�\'h[�\0��\�X�����\'5Ҩ\�B�\���WM�o�\�}��SCȱͶb]J');
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
