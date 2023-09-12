-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: Programmasy
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `certificaciones`
--

DROP TABLE IF EXISTS `certificaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `certificaciones` (
  `CertificationsID` int NOT NULL,
  `CertificationsInCourses` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`CertificationsID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificaciones`
--

LOCK TABLES `certificaciones` WRITE;
/*!40000 ALTER TABLE `certificaciones` DISABLE KEYS */;
INSERT INTO `certificaciones` VALUES (50,'Certicado en python basico'),(51,'Certicado en Java y JavaScript'),(52,'Certicado en C#'),(53,'Certicado en POO');
/*!40000 ALTER TABLE `certificaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cursos`
--

DROP TABLE IF EXISTS `cursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cursos` (
  `CoursesID` int NOT NULL,
  `CourseName` varchar(50) DEFAULT NULL,
  `CourseCategory` varchar(50) DEFAULT NULL,
  `LevelID` int DEFAULT NULL,
  `CertificationsID` int DEFAULT NULL,
  PRIMARY KEY (`CoursesID`),
  KEY `fk_ALevel` (`LevelID`),
  KEY `fk_ACertifications` (`CertificationsID`),
  CONSTRAINT `fk_ACertifications` FOREIGN KEY (`CertificationsID`) REFERENCES `certificaciones` (`CertificationsID`),
  CONSTRAINT `fk_ALevel` FOREIGN KEY (`LevelID`) REFERENCES `niveles` (`LevelID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cursos`
--

LOCK TABLES `cursos` WRITE;
/*!40000 ALTER TABLE `cursos` DISABLE KEYS */;
INSERT INTO `cursos` VALUES (30,'Lo Basico de Python','Prog. Estructural',40,50),(31,'Java y JavaScript','Prog. Orientada a Objetos',41,51),(32,'C#','Prog. Abstracta',42,52),(33,'POO','Prog. Orientada a Objetos',43,53);
/*!40000 ALTER TABLE `cursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estados`
--

DROP TABLE IF EXISTS `estados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estados` (
  `StatusID` int NOT NULL,
  `StatusUsser` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`StatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estados`
--

LOCK TABLES `estados` WRITE;
/*!40000 ALTER TABLE `estados` DISABLE KEYS */;
INSERT INTO `estados` VALUES (20,'Activo'),(21,'Suspendido'),(22,'Inactivo'),(23,'Deshabilitado');
/*!40000 ALTER TABLE `estados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventos`
--

DROP TABLE IF EXISTS `eventos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eventos` (
  `EventsID` int NOT NULL,
  `EventName` varchar(100) DEFAULT NULL,
  `EventDescription` varchar(200) DEFAULT NULL,
  `EventDate` date DEFAULT NULL,
  `VersusID` int DEFAULT NULL,
  PRIMARY KEY (`EventsID`),
  KEY `fk_AVersus` (`VersusID`),
  CONSTRAINT `fk_AVersus` FOREIGN KEY (`VersusID`) REFERENCES `versus` (`VersusID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventos`
--

LOCK TABLES `eventos` WRITE;
/*!40000 ALTER TABLE `eventos` DISABLE KEYS */;
INSERT INTO `eventos` VALUES (1,'Apertura al conocimiento','Primer evento de nuestra comunidad','2023-04-13',1);
/*!40000 ALTER TABLE `eventos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `niveles`
--

DROP TABLE IF EXISTS `niveles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `niveles` (
  `LevelID` int NOT NULL,
  `LevelCourse` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`LevelID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `niveles`
--

LOCK TABLES `niveles` WRITE;
/*!40000 ALTER TABLE `niveles` DISABLE KEYS */;
INSERT INTO `niveles` VALUES (40,'Junior'),(41,'SemiSenior'),(42,'Senior'),(43,'Junior');
/*!40000 ALTER TABLE `niveles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nomina`
--

DROP TABLE IF EXISTS `nomina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nomina` (
  `NominatingID` int NOT NULL,
  `NominatingSuppliers` varchar(100) DEFAULT NULL,
  `PaymentNominatingSuppliers` float DEFAULT NULL,
  PRIMARY KEY (`NominatingID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nomina`
--

LOCK TABLES `nomina` WRITE;
/*!40000 ALTER TABLE `nomina` DISABLE KEYS */;
/*!40000 ALTER TABLE `nomina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proovedores`
--

DROP TABLE IF EXISTS `proovedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proovedores` (
  `SuppliersID` int NOT NULL,
  `SuppliersName` varchar(100) DEFAULT NULL,
  `ProductType` varchar(100) DEFAULT NULL,
  `SuppliersDirecction` varchar(100) DEFAULT NULL,
  `NominatingID` int DEFAULT NULL,
  PRIMARY KEY (`SuppliersID`),
  KEY `fk_ANominating` (`NominatingID`),
  CONSTRAINT `fk_ANominating` FOREIGN KEY (`NominatingID`) REFERENCES `nomina` (`NominatingID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proovedores`
--

LOCK TABLES `proovedores` WRITE;
/*!40000 ALTER TABLE `proovedores` DISABLE KEYS */;
/*!40000 ALTER TABLE `proovedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `UsserID` int NOT NULL,
  `UsserName` varchar(80) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Phone` varchar(50) DEFAULT NULL,
  `StatusID` int DEFAULT NULL,
  `CoursesID` int DEFAULT NULL,
  `EventsID` int DEFAULT NULL,
  PRIMARY KEY (`UsserID`),
  KEY `fk_AStatus` (`StatusID`),
  KEY `fk_AEvents` (`EventsID`),
  KEY `fk_ACourses` (`CoursesID`),
  CONSTRAINT `fk_ACourses` FOREIGN KEY (`CoursesID`) REFERENCES `cursos` (`CoursesID`),
  CONSTRAINT `fk_AEvents` FOREIGN KEY (`EventsID`) REFERENCES `eventos` (`EventsID`),
  CONSTRAINT `fk_AStatus` FOREIGN KEY (`StatusID`) REFERENCES `estados` (`StatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (10,'CarlosName','cana_1010@gmail.com)','3205143808',20,30,1),(11,'DiperD','Karzolmanzo@gmail.com)','3154350986',21,31,1),(12,'Carme Lozano','carmen_1976@gmail.com)','3206420896',22,32,1),(13,'ElRich123','minecraft0808@gmail.com)','3205161412',23,33,1);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `versus`
--

DROP TABLE IF EXISTS `versus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `versus` (
  `VersusID` int NOT NULL,
  `VersusParticipants` varchar(100) DEFAULT NULL,
  `VersusCode` char(3) DEFAULT NULL,
  `VersusTime` time DEFAULT NULL,
  PRIMARY KEY (`VersusID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `versus`
--

LOCK TABLES `versus` WRITE;
/*!40000 ALTER TABLE `versus` DISABLE KEYS */;
INSERT INTO `versus` VALUES (1,'CarlosName, DiperD, Carmen Lozano, ElRich123','POO','00:02:00');
/*!40000 ALTER TABLE `versus` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-13 13:35:15
