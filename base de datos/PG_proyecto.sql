CREATE DATABASE  IF NOT EXISTS `pg_gestion_pro` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `pg_gestion_pro`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: pg_gestion_pro
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `abono`
--

DROP TABLE IF EXISTS `abono`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `abono` (
  `id_abono` int NOT NULL AUTO_INCREMENT,
  `abono` double DEFAULT NULL,
  `id_c_pro` int DEFAULT NULL,
  PRIMARY KEY (`id_abono`),
  KEY `FK_abono_propietario_villa` (`id_c_pro`),
  CONSTRAINT `FK_abono_propietario_villa` FOREIGN KEY (`id_c_pro`) REFERENCES `propietario_villa` (`id_c_pro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abono`
--

LOCK TABLES `abono` WRITE;
/*!40000 ALTER TABLE `abono` DISABLE KEYS */;
/*!40000 ALTER TABLE `abono` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carac_villa`
--

DROP TABLE IF EXISTS `carac_villa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carac_villa` (
  `id_caracteristica` int NOT NULL AUTO_INCREMENT,
  `caracteristica` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_villa` int DEFAULT NULL,
  PRIMARY KEY (`id_caracteristica`),
  KEY `FK_carac_villa_villa` (`id_villa`),
  CONSTRAINT `FK_carac_villa_villa` FOREIGN KEY (`id_villa`) REFERENCES `villa` (`id_villa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carac_villa`
--

LOCK TABLES `carac_villa` WRITE;
/*!40000 ALTER TABLE `carac_villa` DISABLE KEYS */;
/*!40000 ALTER TABLE `carac_villa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concepto`
--

DROP TABLE IF EXISTS `concepto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `concepto` (
  `id_concepto` int NOT NULL AUTO_INCREMENT,
  `concepto` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_tipo` int DEFAULT NULL,
  `valor` double DEFAULT NULL,
  `referencia` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_estado` int DEFAULT NULL,
  PRIMARY KEY (`id_concepto`),
  KEY `FK_concepto_estado` (`id_estado`),
  KEY `FK_concepto_tipo_concepto` (`id_tipo`),
  CONSTRAINT `FK_concepto_estado` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id_estado`),
  CONSTRAINT `FK_concepto_tipo_concepto` FOREIGN KEY (`id_tipo`) REFERENCES `tipo_concepto` (`id_tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concepto`
--

LOCK TABLES `concepto` WRITE;
/*!40000 ALTER TABLE `concepto` DISABLE KEYS */;
/*!40000 ALTER TABLE `concepto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `condicion_villa`
--

DROP TABLE IF EXISTS `condicion_villa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `condicion_villa` (
  `id_condicion` int NOT NULL AUTO_INCREMENT,
  `condicion` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id_condicion`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `condicion_villa`
--

LOCK TABLES `condicion_villa` WRITE;
/*!40000 ALTER TABLE `condicion_villa` DISABLE KEYS */;
INSERT INTO `condicion_villa` VALUES (1,'Habitado'),(2,'Disponible'),(3,'Suspendido');
/*!40000 ALTER TABLE `condicion_villa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuenta`
--

DROP TABLE IF EXISTS `cuenta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuenta` (
  `id_cuenta` int NOT NULL AUTO_INCREMENT,
  `cuenta` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_c_pro` int DEFAULT NULL,
  `id_concepto` int DEFAULT NULL,
  `fe_desde` date DEFAULT NULL,
  `fe_hasta` date DEFAULT NULL,
  `monto` double DEFAULT NULL,
  `id_estado_cuenta` int DEFAULT NULL,
  PRIMARY KEY (`id_cuenta`),
  KEY `FK_cuenta_estado_cuenta` (`id_estado_cuenta`),
  KEY `FK_cuenta_propietario_villa` (`id_c_pro`),
  KEY `FK_cuenta_concepto` (`id_concepto`),
  CONSTRAINT `FK_cuenta_concepto` FOREIGN KEY (`id_concepto`) REFERENCES `concepto` (`id_concepto`),
  CONSTRAINT `FK_cuenta_estado_cuenta` FOREIGN KEY (`id_estado_cuenta`) REFERENCES `estado_cuenta` (`id_estado_cuenta`),
  CONSTRAINT `FK_cuenta_propietario_villa` FOREIGN KEY (`id_c_pro`) REFERENCES `propietario_villa` (`id_c_pro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuenta`
--

LOCK TABLES `cuenta` WRITE;
/*!40000 ALTER TABLE `cuenta` DISABLE KEYS */;
/*!40000 ALTER TABLE `cuenta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `d_propietario`
--

DROP TABLE IF EXISTS `d_propietario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `d_propietario` (
  `id_pro` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `dni` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `correo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  `observacion` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id_pro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `d_propietario`
--

LOCK TABLES `d_propietario` WRITE;
/*!40000 ALTER TABLE `d_propietario` DISABLE KEYS */;
/*!40000 ALTER TABLE `d_propietario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado` (
  `id_estado` int NOT NULL AUTO_INCREMENT,
  `estado` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` VALUES (1,'Activo'),(2,'Activo');
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado_cuenta`
--

DROP TABLE IF EXISTS `estado_cuenta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado_cuenta` (
  `id_estado_cuenta` int NOT NULL AUTO_INCREMENT,
  `estado` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id_estado_cuenta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_cuenta`
--

LOCK TABLES `estado_cuenta` WRITE;
/*!40000 ALTER TABLE `estado_cuenta` DISABLE KEYS */;
/*!40000 ALTER TABLE `estado_cuenta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado_villa`
--

DROP TABLE IF EXISTS `estado_villa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado_villa` (
  `id_estado_villa` int NOT NULL AUTO_INCREMENT,
  `estado_villa` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id_estado_villa`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_villa`
--

LOCK TABLES `estado_villa` WRITE;
/*!40000 ALTER TABLE `estado_villa` DISABLE KEYS */;
INSERT INTO `estado_villa` VALUES (1,'Activo'),(2,'Mantenimiento'),(3,'Suspendida');
/*!40000 ALTER TABLE `estado_villa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modelo_villa`
--

DROP TABLE IF EXISTS `modelo_villa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modelo_villa` (
  `id_modelo` int NOT NULL AUTO_INCREMENT,
  `modelo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id_modelo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modelo_villa`
--

LOCK TABLES `modelo_villa` WRITE;
/*!40000 ALTER TABLE `modelo_villa` DISABLE KEYS */;
INSERT INTO `modelo_villa` VALUES (1,'Villa Caracol'),(2,'Villa Arrecife'),(3,'Villa Carey');
/*!40000 ALTER TABLE `modelo_villa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `moneda`
--

DROP TABLE IF EXISTS `moneda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `moneda` (
  `id_moneda` int NOT NULL AUTO_INCREMENT,
  `moneda` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `abreviado` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_estado` int DEFAULT NULL,
  PRIMARY KEY (`id_moneda`),
  KEY `FK_moneda_estado` (`id_estado`),
  CONSTRAINT `FK_moneda_estado` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moneda`
--

LOCK TABLES `moneda` WRITE;
/*!40000 ALTER TABLE `moneda` DISABLE KEYS */;
/*!40000 ALTER TABLE `moneda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `multipago`
--

DROP TABLE IF EXISTS `multipago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `multipago` (
  `id_multi` int NOT NULL AUTO_INCREMENT,
  `multipago` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `fecha_pago` date DEFAULT NULL,
  `id_c_pro` int DEFAULT NULL,
  `id_cuenta` int DEFAULT NULL,
  `id_estado` int DEFAULT NULL,
  PRIMARY KEY (`id_multi`),
  KEY `FK_multipago_propietario_villa` (`id_c_pro`),
  KEY `FK_multipago_estado` (`id_estado`),
  KEY `FK_multipago_cuenta` (`id_cuenta`),
  CONSTRAINT `FK_multipago_cuenta` FOREIGN KEY (`id_cuenta`) REFERENCES `cuenta` (`id_cuenta`),
  CONSTRAINT `FK_multipago_estado` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id_estado`),
  CONSTRAINT `FK_multipago_propietario_villa` FOREIGN KEY (`id_c_pro`) REFERENCES `propietario_villa` (`id_c_pro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `multipago`
--

LOCK TABLES `multipago` WRITE;
/*!40000 ALTER TABLE `multipago` DISABLE KEYS */;
/*!40000 ALTER TABLE `multipago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propietario_villa`
--

DROP TABLE IF EXISTS `propietario_villa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `propietario_villa` (
  `id_c_pro` int NOT NULL AUTO_INCREMENT,
  `id_pro` int DEFAULT NULL,
  `id_villa` int DEFAULT NULL,
  `id_estado` int DEFAULT NULL,
  PRIMARY KEY (`id_c_pro`),
  KEY `FK_propietario_villa_villa` (`id_villa`),
  KEY `FK_propietario_villa_d_propietario` (`id_pro`),
  KEY `FK_propietario_villa_estado` (`id_estado`),
  CONSTRAINT `FK_propietario_villa_d_propietario` FOREIGN KEY (`id_pro`) REFERENCES `d_propietario` (`id_pro`),
  CONSTRAINT `FK_propietario_villa_estado` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id_estado`),
  CONSTRAINT `FK_propietario_villa_villa` FOREIGN KEY (`id_villa`) REFERENCES `villa` (`id_villa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propietario_villa`
--

LOCK TABLES `propietario_villa` WRITE;
/*!40000 ALTER TABLE `propietario_villa` DISABLE KEYS */;
/*!40000 ALTER TABLE `propietario_villa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tel`
--

DROP TABLE IF EXISTS `tel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tel` (
  `id_tel` int NOT NULL AUTO_INCREMENT,
  `telefono` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_pro` int DEFAULT NULL,
  PRIMARY KEY (`id_tel`),
  KEY `FK_tel_d_propietario` (`id_pro`),
  CONSTRAINT `FK_tel_d_propietario` FOREIGN KEY (`id_pro`) REFERENCES `d_propietario` (`id_pro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tel`
--

LOCK TABLES `tel` WRITE;
/*!40000 ALTER TABLE `tel` DISABLE KEYS */;
/*!40000 ALTER TABLE `tel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_concepto`
--

DROP TABLE IF EXISTS `tipo_concepto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_concepto` (
  `id_tipo` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id_tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_concepto`
--

LOCK TABLES `tipo_concepto` WRITE;
/*!40000 ALTER TABLE `tipo_concepto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_concepto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `villa`
--

DROP TABLE IF EXISTS `villa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `villa` (
  `id_villa` int NOT NULL AUTO_INCREMENT,
  `cod_villa` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `cont_ehh` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `tam_lote` double DEFAULT NULL,
  `tam_cons` double DEFAULT NULL,
  `direccion` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_modelo` int DEFAULT NULL,
  `observaciones` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_estado_villa` int DEFAULT NULL,
  `habitacion` int DEFAULT NULL,
  `id_condicion` int DEFAULT NULL,
  PRIMARY KEY (`id_villa`),
  KEY `FK_villa_modelo_villa` (`id_modelo`),
  KEY `FK_villa_estado_villa` (`id_estado_villa`),
  KEY `FK_villa_condicion_villa` (`id_condicion`),
  CONSTRAINT `FK_villa_condicion_villa` FOREIGN KEY (`id_condicion`) REFERENCES `condicion_villa` (`id_condicion`),
  CONSTRAINT `FK_villa_estado_villa` FOREIGN KEY (`id_estado_villa`) REFERENCES `estado_villa` (`id_estado_villa`),
  CONSTRAINT `FK_villa_modelo_villa` FOREIGN KEY (`id_modelo`) REFERENCES `modelo_villa` (`id_modelo`)
) ENGINE=InnoDB AUTO_INCREMENT=314 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `villa`
--

LOCK TABLES `villa` WRITE;
/*!40000 ALTER TABLE `villa` DISABLE KEYS */;
INSERT INTO `villa` VALUES (2,'A-1','A42169708',303,303,'Roma, juteapa, atlantida',3,'Prueba',1,2,1),(3,'A-2','A35851099',121,121,'Roma, juteapa, atlantida',2,'Prueba',3,3,1),(4,'A-3','A42548317',465,465,'Roma, juteapa, atlantida',3,'Prueba',1,4,2),(5,'A-4','A99908533',125,125,'Roma, juteapa, atlantida',2,'Prueba',3,4,1),(6,'A-5','A36011081',151,151,'Roma, juteapa, atlantida',3,'Prueba',1,3,2),(7,'A-6','A28717040',140,140,'Roma, juteapa, atlantida',1,'Prueba',2,2,2),(8,'A-7','A34407028',474,474,'Roma, juteapa, atlantida',1,'Prueba',1,3,2),(9,'A-8','A44095349',405,405,'Roma, juteapa, atlantida',2,'Prueba',1,3,1),(10,'A-9','A69426706',497,497,'Roma, juteapa, atlantida',3,'Prueba',3,2,1),(11,'A-10','A24630348',435,435,'Roma, juteapa, atlantida',2,'Prueba',2,3,2),(12,'A-11','A45423705',329,329,'Roma, juteapa, atlantida',2,'Prueba',3,3,2),(13,'A-12','A81103629',119,119,'Roma, juteapa, atlantida',3,'Prueba',1,3,1),(14,'B-1','A12371201',143,143,'Roma, juteapa, atlantida',2,'Prueba',2,2,1),(15,'B-2','A58801736',186,186,'Roma, juteapa, atlantida',3,'Prueba',1,5,1),(16,'B-3','A14825958',142,142,'Roma, juteapa, atlantida',2,'Prueba',2,5,1),(17,'B-4','A83596825',261,261,'Roma, juteapa, atlantida',3,'Prueba',2,5,2),(18,'B-5','A48384131',349,349,'Roma, juteapa, atlantida',1,'Prueba',2,5,2),(19,'B-6','A92443777',190,190,'Roma, juteapa, atlantida',1,'Prueba',3,3,2),(20,'B-7','A60994411',409,409,'Roma, juteapa, atlantida',2,'Prueba',1,5,1),(21,'B-8','A49957074',116,116,'Roma, juteapa, atlantida',1,'Prueba',1,5,1),(22,'B-9','A75037997',357,357,'Roma, juteapa, atlantida',3,'Prueba',3,3,2),(23,'B-10','A72103537',118,118,'Roma, juteapa, atlantida',3,'Prueba',2,5,2),(24,'B-11','A14927718',225,225,'Roma, juteapa, atlantida',3,'Prueba',1,5,2),(25,'B-12','A16983167',301,301,'Roma, juteapa, atlantida',3,'Prueba',1,4,2),(26,'C-1','A86299247',170,170,'Roma, juteapa, atlantida',2,'Prueba',2,3,1),(27,'C-2','A72325878',317,317,'Roma, juteapa, atlantida',2,'Prueba',1,2,2),(28,'C-3','A89971768',181,181,'Roma, juteapa, atlantida',3,'Prueba',2,2,2),(29,'C-4','A44718706',254,254,'Roma, juteapa, atlantida',1,'Prueba',1,5,2),(30,'C-5','A19262362',136,136,'Roma, juteapa, atlantida',1,'Prueba',3,5,2),(31,'C-6','A18181893',285,285,'Roma, juteapa, atlantida',2,'Prueba',2,4,2),(32,'C-7','A24915072',272,272,'Roma, juteapa, atlantida',1,'Prueba',1,3,2),(33,'C-8','A80696299',314,314,'Roma, juteapa, atlantida',2,'Prueba',3,2,1),(34,'C-9','A15109077',397,397,'Roma, juteapa, atlantida',2,'Prueba',3,3,2),(35,'C-10','A52674958',294,294,'Roma, juteapa, atlantida',2,'Prueba',2,5,1),(36,'C-11','A50635955',124,124,'Roma, juteapa, atlantida',2,'Prueba',3,3,1),(37,'C-12','A93911105',398,398,'Roma, juteapa, atlantida',2,'Prueba',3,5,1),(38,'D-1','A94922007',330,330,'Roma, juteapa, atlantida',1,'Prueba',3,2,2),(39,'D-2','A97394281',242,242,'Roma, juteapa, atlantida',2,'Prueba',1,4,1),(40,'D-3','A27046106',271,271,'Roma, juteapa, atlantida',3,'Prueba',3,5,1),(41,'D-4','A59543027',292,292,'Roma, juteapa, atlantida',2,'Prueba',1,4,2),(42,'D-5','A42233505',264,264,'Roma, juteapa, atlantida',1,'Prueba',1,3,2),(43,'D-6','A88632488',169,169,'Roma, juteapa, atlantida',1,'Prueba',3,3,2),(44,'D-7','A47860527',193,193,'Roma, juteapa, atlantida',3,'Prueba',2,4,1),(45,'D-8','A44361740',311,311,'Roma, juteapa, atlantida',1,'Prueba',2,3,2),(46,'D-9','A73981068',349,349,'Roma, juteapa, atlantida',1,'Prueba',1,5,1),(47,'D-10','A22735783',360,360,'Roma, juteapa, atlantida',3,'Prueba',2,4,2),(48,'D-11','A80879414',259,259,'Roma, juteapa, atlantida',3,'Prueba',3,5,2),(49,'D-12','A54305024',199,199,'Roma, juteapa, atlantida',1,'Prueba',1,4,2),(50,'E-1','A21311659',454,454,'Roma, juteapa, atlantida',1,'Prueba',2,4,2),(51,'E-2','A33909322',315,315,'Roma, juteapa, atlantida',2,'Prueba',1,3,2),(52,'E-3','A66867574',335,335,'Roma, juteapa, atlantida',3,'Prueba',2,5,2),(53,'E-4','A44840437',398,398,'Roma, juteapa, atlantida',2,'Prueba',1,3,2),(54,'E-5','A92692319',435,435,'Roma, juteapa, atlantida',3,'Prueba',3,5,2),(55,'E-6','A57465772',498,498,'Roma, juteapa, atlantida',2,'Prueba',1,5,1),(56,'E-7','A39733485',217,217,'Roma, juteapa, atlantida',2,'Prueba',3,2,1),(57,'E-8','A56952574',255,255,'Roma, juteapa, atlantida',1,'Prueba',2,3,2),(58,'E-9','A43661267',253,253,'Roma, juteapa, atlantida',2,'Prueba',1,4,2),(59,'E-10','A39412045',286,286,'Roma, juteapa, atlantida',1,'Prueba',3,3,1),(60,'E-11','A22350736',404,404,'Roma, juteapa, atlantida',3,'Prueba',1,3,1),(61,'E-12','A36567546',106,106,'Roma, juteapa, atlantida',3,'Prueba',2,2,2),(62,'F-1','A32409282',368,368,'Roma, juteapa, atlantida',1,'Prueba',1,5,1),(63,'F-2','A84029689',202,202,'Roma, juteapa, atlantida',3,'Prueba',3,2,2),(64,'F-3','A20086470',142,142,'Roma, juteapa, atlantida',1,'Prueba',3,3,2),(65,'F-4','A82987051',350,350,'Roma, juteapa, atlantida',1,'Prueba',1,2,2),(66,'F-5','A20341391',306,306,'Roma, juteapa, atlantida',3,'Prueba',2,5,1),(67,'F-6','A83376737',439,439,'Roma, juteapa, atlantida',2,'Prueba',1,3,1),(68,'F-7','A40386203',266,266,'Roma, juteapa, atlantida',2,'Prueba',1,2,1),(69,'F-8','A79117155',453,453,'Roma, juteapa, atlantida',2,'Prueba',2,4,2),(70,'F-9','A70380051',103,103,'Roma, juteapa, atlantida',1,'Prueba',3,2,1),(71,'F-10','A36670029',319,319,'Roma, juteapa, atlantida',2,'Prueba',2,3,2),(72,'F-11','A90213952',447,447,'Roma, juteapa, atlantida',1,'Prueba',1,4,2),(73,'F-12','A32719642',416,416,'Roma, juteapa, atlantida',3,'Prueba',2,3,1),(74,'G-1','A69876350',175,175,'Roma, juteapa, atlantida',2,'Prueba',3,3,2),(75,'G-2','A21856160',141,141,'Roma, juteapa, atlantida',2,'Prueba',2,2,2),(76,'G-3','A77783539',273,273,'Roma, juteapa, atlantida',2,'Prueba',3,3,2),(77,'G-4','A89718189',104,104,'Roma, juteapa, atlantida',2,'Prueba',1,5,1),(78,'G-5','A12204042',283,283,'Roma, juteapa, atlantida',2,'Prueba',1,3,2),(79,'G-6','A53999457',342,342,'Roma, juteapa, atlantida',1,'Prueba',2,2,1),(80,'G-7','A19370960',445,445,'Roma, juteapa, atlantida',1,'Prueba',1,4,1),(81,'G-8','A51176988',128,128,'Roma, juteapa, atlantida',2,'Prueba',3,2,1),(82,'G-9','A59931876',374,374,'Roma, juteapa, atlantida',1,'Prueba',1,3,2),(83,'G-10','A68260640',479,479,'Roma, juteapa, atlantida',2,'Prueba',3,4,1),(84,'G-11','A64456143',470,470,'Roma, juteapa, atlantida',3,'Prueba',3,3,1),(85,'G-12','A27751312',414,414,'Roma, juteapa, atlantida',2,'Prueba',2,3,1),(86,'H-1','A39694270',180,180,'Roma, juteapa, atlantida',2,'Prueba',3,3,2),(87,'H-2','A30508271',337,337,'Roma, juteapa, atlantida',3,'Prueba',3,2,2),(88,'H-3','A84742454',286,286,'Roma, juteapa, atlantida',2,'Prueba',1,5,1),(89,'H-4','A37378419',102,102,'Roma, juteapa, atlantida',2,'Prueba',3,5,1),(90,'H-5','A18015089',323,323,'Roma, juteapa, atlantida',3,'Prueba',2,4,2),(91,'H-6','A78446928',277,277,'Roma, juteapa, atlantida',1,'Prueba',1,3,2),(92,'H-7','A22189394',490,490,'Roma, juteapa, atlantida',3,'Prueba',2,4,1),(93,'H-8','A21961167',124,124,'Roma, juteapa, atlantida',2,'Prueba',3,5,2),(94,'H-9','A12996632',377,377,'Roma, juteapa, atlantida',2,'Prueba',1,4,2),(95,'H-10','A17277707',390,390,'Roma, juteapa, atlantida',3,'Prueba',2,2,1),(96,'H-11','A82398683',277,277,'Roma, juteapa, atlantida',2,'Prueba',1,3,1),(97,'H-12','A10346230',403,403,'Roma, juteapa, atlantida',2,'Prueba',3,3,1),(98,'I-1','A85324881',391,391,'Roma, juteapa, atlantida',2,'Prueba',2,5,1),(99,'I-2','A68883929',484,484,'Roma, juteapa, atlantida',2,'Prueba',1,3,1),(100,'I-3','A55521355',365,365,'Roma, juteapa, atlantida',3,'Prueba',2,4,1),(101,'I-4','A44503917',195,195,'Roma, juteapa, atlantida',3,'Prueba',1,3,1),(102,'I-5','A67143571',443,443,'Roma, juteapa, atlantida',1,'Prueba',2,5,2),(103,'I-6','A37165150',425,425,'Roma, juteapa, atlantida',1,'Prueba',2,4,2),(104,'I-7','A76027523',412,412,'Roma, juteapa, atlantida',2,'Prueba',2,3,2),(105,'I-8','A43247747',174,174,'Roma, juteapa, atlantida',2,'Prueba',3,4,1),(106,'I-9','A14121307',198,198,'Roma, juteapa, atlantida',1,'Prueba',2,3,2),(107,'I-10','A28711361',231,231,'Roma, juteapa, atlantida',3,'Prueba',3,4,1),(108,'I-11','A76897569',143,143,'Roma, juteapa, atlantida',3,'Prueba',2,4,2),(109,'I-12','A84586070',337,337,'Roma, juteapa, atlantida',3,'Prueba',2,4,2),(110,'J-1','A20485582',196,196,'Roma, juteapa, atlantida',2,'Prueba',1,4,1),(111,'J-2','A90520444',330,330,'Roma, juteapa, atlantida',1,'Prueba',2,2,1),(112,'J-3','A20604515',477,477,'Roma, juteapa, atlantida',2,'Prueba',1,2,1),(113,'J-4','A93212920',118,118,'Roma, juteapa, atlantida',2,'Prueba',2,2,1),(114,'J-5','A39029647',294,294,'Roma, juteapa, atlantida',2,'Prueba',2,3,2),(115,'J-6','A66953817',373,373,'Roma, juteapa, atlantida',1,'Prueba',1,5,2),(116,'J-7','A70476084',406,406,'Roma, juteapa, atlantida',2,'Prueba',3,4,2),(117,'J-8','A92877518',295,295,'Roma, juteapa, atlantida',3,'Prueba',2,5,1),(118,'J-9','A34823788',481,481,'Roma, juteapa, atlantida',1,'Prueba',2,3,2),(119,'J-10','A52141564',437,437,'Roma, juteapa, atlantida',1,'Prueba',3,4,2),(120,'J-11','A24928323',322,322,'Roma, juteapa, atlantida',2,'Prueba',3,3,1),(121,'J-12','A55421521',462,462,'Roma, juteapa, atlantida',2,'Prueba',1,5,1),(122,'K-1','A28081186',345,345,'Roma, juteapa, atlantida',1,'Prueba',2,2,1),(123,'K-2','A48831738',142,142,'Roma, juteapa, atlantida',3,'Prueba',1,4,1),(124,'K-3','A45190497',341,341,'Roma, juteapa, atlantida',2,'Prueba',1,2,1),(125,'K-4','A51511962',329,329,'Roma, juteapa, atlantida',2,'Prueba',2,4,2),(126,'K-5','A32811288',284,284,'Roma, juteapa, atlantida',1,'Prueba',3,2,1),(127,'K-6','A19924236',286,286,'Roma, juteapa, atlantida',3,'Prueba',1,3,1),(128,'K-7','A40536288',414,414,'Roma, juteapa, atlantida',1,'Prueba',3,5,1),(129,'K-8','A15547281',432,432,'Roma, juteapa, atlantida',2,'Prueba',3,4,1),(130,'K-9','A83113918',395,395,'Roma, juteapa, atlantida',2,'Prueba',2,4,2),(131,'K-10','A52856180',437,437,'Roma, juteapa, atlantida',3,'Prueba',3,4,2),(132,'K-11','A95748486',491,491,'Roma, juteapa, atlantida',3,'Prueba',2,2,1),(133,'K-12','A70453271',387,387,'Roma, juteapa, atlantida',1,'Prueba',1,3,1),(134,'L-1','A56920401',465,465,'Roma, juteapa, atlantida',1,'Prueba',1,2,1),(135,'L-2','A16354564',300,300,'Roma, juteapa, atlantida',1,'Prueba',1,2,1),(136,'L-3','A49591221',350,350,'Roma, juteapa, atlantida',1,'Prueba',2,2,2),(137,'L-4','A10720277',117,117,'Roma, juteapa, atlantida',2,'Prueba',3,5,2),(138,'L-5','A26016456',214,214,'Roma, juteapa, atlantida',2,'Prueba',3,5,1),(139,'L-6','A80234639',297,297,'Roma, juteapa, atlantida',2,'Prueba',1,3,2),(140,'L-7','A34802664',136,136,'Roma, juteapa, atlantida',3,'Prueba',3,5,1),(141,'L-8','A31355946',317,317,'Roma, juteapa, atlantida',2,'Prueba',3,2,1),(142,'L-9','A85903119',467,467,'Roma, juteapa, atlantida',2,'Prueba',3,2,2),(143,'L-10','A35355756',446,446,'Roma, juteapa, atlantida',1,'Prueba',1,2,1),(144,'L-11','A87384703',488,488,'Roma, juteapa, atlantida',2,'Prueba',2,3,2),(145,'L-12','A11422021',205,205,'Roma, juteapa, atlantida',3,'Prueba',3,3,1),(146,'M-1','A16097593',118,118,'Roma, juteapa, atlantida',2,'Prueba',3,3,2),(147,'M-2','A68282742',382,382,'Roma, juteapa, atlantida',1,'Prueba',3,2,2),(148,'M-3','A33504060',244,244,'Roma, juteapa, atlantida',2,'Prueba',2,5,2),(149,'M-4','A51725885',243,243,'Roma, juteapa, atlantida',2,'Prueba',1,3,2),(150,'M-5','A32804302',201,201,'Roma, juteapa, atlantida',1,'Prueba',1,2,1),(151,'M-6','A56902666',484,484,'Roma, juteapa, atlantida',3,'Prueba',3,5,2),(152,'M-7','A43729829',370,370,'Roma, juteapa, atlantida',3,'Prueba',3,5,1),(153,'M-8','A64383799',243,243,'Roma, juteapa, atlantida',3,'Prueba',1,3,2),(154,'M-9','A63518515',135,135,'Roma, juteapa, atlantida',1,'Prueba',3,3,2),(155,'M-10','A72943243',351,351,'Roma, juteapa, atlantida',1,'Prueba',3,2,2),(156,'M-11','A98926626',389,389,'Roma, juteapa, atlantida',1,'Prueba',2,2,1),(157,'M-12','A85903860',186,186,'Roma, juteapa, atlantida',2,'Prueba',2,4,2),(158,'N-1','A11636649',387,387,'Roma, juteapa, atlantida',2,'Prueba',1,2,1),(159,'N-2','A45474430',489,489,'Roma, juteapa, atlantida',1,'Prueba',3,3,1),(160,'N-3','A14609068',181,181,'Roma, juteapa, atlantida',3,'Prueba',2,5,2),(161,'N-4','A37407247',183,183,'Roma, juteapa, atlantida',2,'Prueba',2,5,2),(162,'N-5','A99801305',465,465,'Roma, juteapa, atlantida',2,'Prueba',2,2,2),(163,'N-6','A74348473',396,396,'Roma, juteapa, atlantida',3,'Prueba',1,2,2),(164,'N-7','A29624452',195,195,'Roma, juteapa, atlantida',2,'Prueba',3,2,2),(165,'N-8','A43921845',349,349,'Roma, juteapa, atlantida',1,'Prueba',3,4,2),(166,'N-9','A46297114',100,100,'Roma, juteapa, atlantida',2,'Prueba',1,4,2),(167,'N-10','A80553007',136,136,'Roma, juteapa, atlantida',2,'Prueba',2,5,2),(168,'N-11','A29340760',253,253,'Roma, juteapa, atlantida',2,'Prueba',2,3,1),(169,'N-12','A51548771',468,468,'Roma, juteapa, atlantida',2,'Prueba',1,5,2),(170,'O-1','A90637773',207,207,'Roma, juteapa, atlantida',1,'Prueba',3,4,2),(171,'O-2','A29192746',197,197,'Roma, juteapa, atlantida',2,'Prueba',2,3,2),(172,'O-3','A98472462',175,175,'Roma, juteapa, atlantida',2,'Prueba',3,5,1),(173,'O-4','A67584534',432,432,'Roma, juteapa, atlantida',1,'Prueba',2,2,1),(174,'O-5','A14126564',250,250,'Roma, juteapa, atlantida',3,'Prueba',1,4,2),(175,'O-6','A45451332',295,295,'Roma, juteapa, atlantida',1,'Prueba',3,4,1),(176,'O-7','A58932096',202,202,'Roma, juteapa, atlantida',2,'Prueba',3,4,2),(177,'O-8','A10265647',212,212,'Roma, juteapa, atlantida',3,'Prueba',2,2,2),(178,'O-9','A88642439',455,455,'Roma, juteapa, atlantida',3,'Prueba',2,4,2),(179,'O-10','A94694452',155,155,'Roma, juteapa, atlantida',2,'Prueba',2,2,1),(180,'O-11','A29820292',396,396,'Roma, juteapa, atlantida',2,'Prueba',3,3,2),(181,'O-12','A80711743',288,288,'Roma, juteapa, atlantida',2,'Prueba',1,3,2),(182,'P-1','A49350309',195,195,'Roma, juteapa, atlantida',1,'Prueba',1,5,2),(183,'P-2','A49995007',113,113,'Roma, juteapa, atlantida',3,'Prueba',1,3,2),(184,'P-3','A93500331',325,325,'Roma, juteapa, atlantida',3,'Prueba',3,3,1),(185,'P-4','A78108109',382,382,'Roma, juteapa, atlantida',1,'Prueba',2,5,1),(186,'P-5','A71633540',361,361,'Roma, juteapa, atlantida',1,'Prueba',3,2,2),(187,'P-6','A53629546',193,193,'Roma, juteapa, atlantida',3,'Prueba',1,5,1),(188,'P-7','A90517496',478,478,'Roma, juteapa, atlantida',2,'Prueba',2,5,1),(189,'P-8','A37311209',165,165,'Roma, juteapa, atlantida',3,'Prueba',3,2,1),(190,'P-9','A54479012',128,128,'Roma, juteapa, atlantida',2,'Prueba',2,3,2),(191,'P-10','A32472680',385,385,'Roma, juteapa, atlantida',3,'Prueba',3,5,1),(192,'P-11','A95386285',112,112,'Roma, juteapa, atlantida',1,'Prueba',3,2,2),(193,'P-12','A45758371',494,494,'Roma, juteapa, atlantida',2,'Prueba',2,2,1),(194,'Q-1','A40605580',265,265,'Roma, juteapa, atlantida',1,'Prueba',1,2,2),(195,'Q-2','A42381327',328,328,'Roma, juteapa, atlantida',3,'Prueba',3,2,2),(196,'Q-3','A50558471',499,499,'Roma, juteapa, atlantida',1,'Prueba',2,5,2),(197,'Q-4','A81055561',307,307,'Roma, juteapa, atlantida',2,'Prueba',2,4,2),(198,'Q-5','A95670547',393,393,'Roma, juteapa, atlantida',3,'Prueba',1,4,1),(199,'Q-6','A46539744',320,320,'Roma, juteapa, atlantida',3,'Prueba',3,4,2),(200,'Q-7','A89937321',368,368,'Roma, juteapa, atlantida',3,'Prueba',3,3,2),(201,'Q-8','A81329589',462,462,'Roma, juteapa, atlantida',3,'Prueba',2,4,2),(202,'Q-9','A37536691',276,276,'Roma, juteapa, atlantida',3,'Prueba',1,5,2),(203,'Q-10','A78038631',158,158,'Roma, juteapa, atlantida',3,'Prueba',1,4,1),(204,'Q-11','A63962762',191,191,'Roma, juteapa, atlantida',3,'Prueba',2,3,1),(205,'Q-12','A37948022',475,475,'Roma, juteapa, atlantida',1,'Prueba',2,3,2),(206,'R-1','A50827043',117,117,'Roma, juteapa, atlantida',1,'Prueba',2,4,1),(207,'R-2','A61521617',240,240,'Roma, juteapa, atlantida',3,'Prueba',2,5,2),(208,'R-3','A64098726',124,124,'Roma, juteapa, atlantida',2,'Prueba',1,5,1),(209,'R-4','A79561346',437,437,'Roma, juteapa, atlantida',1,'Prueba',1,4,2),(210,'R-5','A15195722',462,462,'Roma, juteapa, atlantida',1,'Prueba',3,3,2),(211,'R-6','A23912646',165,165,'Roma, juteapa, atlantida',1,'Prueba',3,2,1),(212,'R-7','A54656081',494,494,'Roma, juteapa, atlantida',2,'Prueba',2,5,2),(213,'R-8','A85709174',489,489,'Roma, juteapa, atlantida',3,'Prueba',1,2,2),(214,'R-9','A26648117',275,275,'Roma, juteapa, atlantida',2,'Prueba',1,2,1),(215,'R-10','A90296463',396,396,'Roma, juteapa, atlantida',1,'Prueba',1,4,1),(216,'R-11','A22154690',344,344,'Roma, juteapa, atlantida',3,'Prueba',2,2,1),(217,'R-12','A49925899',294,294,'Roma, juteapa, atlantida',3,'Prueba',1,3,2),(218,'S-1','A83222798',318,318,'Roma, juteapa, atlantida',1,'Prueba',2,2,1),(219,'S-2','A48509388',142,142,'Roma, juteapa, atlantida',3,'Prueba',1,3,1),(220,'S-3','A62680037',488,488,'Roma, juteapa, atlantida',2,'Prueba',3,5,2),(221,'S-4','A52892371',453,453,'Roma, juteapa, atlantida',3,'Prueba',1,2,1),(222,'S-5','A77182708',107,107,'Roma, juteapa, atlantida',1,'Prueba',2,3,2),(223,'S-6','A38811796',140,140,'Roma, juteapa, atlantida',3,'Prueba',3,3,2),(224,'S-7','A82821359',492,492,'Roma, juteapa, atlantida',3,'Prueba',1,3,2),(225,'S-8','A94946872',486,486,'Roma, juteapa, atlantida',3,'Prueba',3,4,2),(226,'S-9','A40982330',162,162,'Roma, juteapa, atlantida',2,'Prueba',2,4,1),(227,'S-10','A49713066',121,121,'Roma, juteapa, atlantida',2,'Prueba',2,5,2),(228,'S-11','A77385485',476,476,'Roma, juteapa, atlantida',2,'Prueba',3,4,2),(229,'S-12','A90637943',277,277,'Roma, juteapa, atlantida',3,'Prueba',3,3,2),(230,'T-1','A57488309',101,101,'Roma, juteapa, atlantida',2,'Prueba',3,5,2),(231,'T-2','A77533192',490,490,'Roma, juteapa, atlantida',1,'Prueba',1,5,1),(232,'T-3','A51320752',262,262,'Roma, juteapa, atlantida',3,'Prueba',1,5,2),(233,'T-4','A53580291',314,314,'Roma, juteapa, atlantida',2,'Prueba',3,3,2),(234,'T-5','A43689205',177,177,'Roma, juteapa, atlantida',3,'Prueba',1,2,2),(235,'T-6','A65941744',215,215,'Roma, juteapa, atlantida',3,'Prueba',3,4,2),(236,'T-7','A63010573',245,245,'Roma, juteapa, atlantida',3,'Prueba',1,5,1),(237,'T-8','A68139714',401,401,'Roma, juteapa, atlantida',2,'Prueba',2,4,1),(238,'T-9','A81600860',418,418,'Roma, juteapa, atlantida',3,'Prueba',3,4,1),(239,'T-10','A16475309',209,209,'Roma, juteapa, atlantida',2,'Prueba',3,5,1),(240,'T-11','A87334122',269,269,'Roma, juteapa, atlantida',3,'Prueba',1,2,2),(241,'T-12','A55640872',239,239,'Roma, juteapa, atlantida',3,'Prueba',1,5,1),(242,'U-1','A50333739',244,244,'Roma, juteapa, atlantida',3,'Prueba',1,4,1),(243,'U-2','A78217691',143,143,'Roma, juteapa, atlantida',2,'Prueba',2,5,1),(244,'U-3','A69736969',292,292,'Roma, juteapa, atlantida',2,'Prueba',2,2,1),(245,'U-4','A37586333',491,491,'Roma, juteapa, atlantida',3,'Prueba',3,3,1),(246,'U-5','A37403299',309,309,'Roma, juteapa, atlantida',3,'Prueba',3,4,2),(247,'U-6','A49296914',363,363,'Roma, juteapa, atlantida',1,'Prueba',3,5,1),(248,'U-7','A56162503',179,179,'Roma, juteapa, atlantida',1,'Prueba',1,3,2),(249,'U-8','A82162057',159,159,'Roma, juteapa, atlantida',3,'Prueba',3,4,2),(250,'U-9','A84390182',187,187,'Roma, juteapa, atlantida',2,'Prueba',1,3,2),(251,'U-10','A26002310',367,367,'Roma, juteapa, atlantida',3,'Prueba',3,4,2),(252,'U-11','A91912509',429,429,'Roma, juteapa, atlantida',3,'Prueba',1,3,2),(253,'U-12','A45201156',488,488,'Roma, juteapa, atlantida',2,'Prueba',1,5,2),(254,'V-1','A18843274',273,273,'Roma, juteapa, atlantida',3,'Prueba',2,5,2),(255,'V-2','A67012415',209,209,'Roma, juteapa, atlantida',2,'Prueba',2,2,2),(256,'V-3','A42102489',262,262,'Roma, juteapa, atlantida',2,'Prueba',3,2,1),(257,'V-4','A86738323',226,226,'Roma, juteapa, atlantida',1,'Prueba',1,2,1),(258,'V-5','A23342790',395,395,'Roma, juteapa, atlantida',2,'Prueba',2,4,2),(259,'V-6','A43616467',401,401,'Roma, juteapa, atlantida',1,'Prueba',1,5,1),(260,'V-7','A77585086',247,247,'Roma, juteapa, atlantida',2,'Prueba',1,3,1),(261,'V-8','A98639509',405,405,'Roma, juteapa, atlantida',2,'Prueba',3,4,1),(262,'V-9','A71848119',172,172,'Roma, juteapa, atlantida',1,'Prueba',2,3,1),(263,'V-10','A12429603',163,163,'Roma, juteapa, atlantida',2,'Prueba',3,5,2),(264,'V-11','A84143629',435,435,'Roma, juteapa, atlantida',1,'Prueba',2,3,2),(265,'V-12','A53209380',181,181,'Roma, juteapa, atlantida',1,'Prueba',1,2,2),(266,'W-1','A34289092',428,428,'Roma, juteapa, atlantida',2,'Prueba',2,4,2),(267,'W-2','A29847493',441,441,'Roma, juteapa, atlantida',1,'Prueba',1,5,1),(268,'W-3','A92315059',354,354,'Roma, juteapa, atlantida',1,'Prueba',2,5,1),(269,'W-4','A36350391',168,168,'Roma, juteapa, atlantida',3,'Prueba',2,4,1),(270,'W-5','A15409557',302,302,'Roma, juteapa, atlantida',3,'Prueba',3,5,1),(271,'W-6','A98363744',265,265,'Roma, juteapa, atlantida',2,'Prueba',1,5,2),(272,'W-7','A49969214',364,364,'Roma, juteapa, atlantida',2,'Prueba',1,3,2),(273,'W-8','A29313126',321,321,'Roma, juteapa, atlantida',2,'Prueba',2,2,1),(274,'W-9','A68781373',115,115,'Roma, juteapa, atlantida',3,'Prueba',2,4,2),(275,'W-10','A25199218',433,433,'Roma, juteapa, atlantida',2,'Prueba',1,4,1),(276,'W-11','A18961109',435,435,'Roma, juteapa, atlantida',1,'Prueba',3,3,1),(277,'W-12','A38879221',278,278,'Roma, juteapa, atlantida',2,'Prueba',2,2,1),(278,'X-1','A16776245',122,122,'Roma, juteapa, atlantida',3,'Prueba',2,2,2),(279,'X-2','A69552850',284,284,'Roma, juteapa, atlantida',2,'Prueba',3,3,1),(280,'X-3','A85638275',191,191,'Roma, juteapa, atlantida',2,'Prueba',3,3,2),(281,'X-4','A85318960',192,192,'Roma, juteapa, atlantida',2,'Prueba',2,2,1),(282,'X-5','A84290457',325,325,'Roma, juteapa, atlantida',3,'Prueba',1,2,2),(283,'X-6','A87929559',253,253,'Roma, juteapa, atlantida',3,'Prueba',2,3,1),(284,'X-7','A86577667',361,361,'Roma, juteapa, atlantida',1,'Prueba',2,2,2),(285,'X-8','A37589899',129,129,'Roma, juteapa, atlantida',1,'Prueba',3,2,1),(286,'X-9','A62450854',471,471,'Roma, juteapa, atlantida',1,'Prueba',2,3,1),(287,'X-10','A95449412',281,281,'Roma, juteapa, atlantida',1,'Prueba',3,4,2),(288,'X-11','A68128938',473,473,'Roma, juteapa, atlantida',3,'Prueba',3,4,2),(289,'X-12','A68101126',200,200,'Roma, juteapa, atlantida',1,'Prueba',2,4,2),(290,'Y-1','A86190794',344,344,'Roma, juteapa, atlantida',3,'Prueba',1,2,2),(291,'Y-2','A32303482',136,136,'Roma, juteapa, atlantida',1,'Prueba',1,3,1),(292,'Y-3','A96687733',140,140,'Roma, juteapa, atlantida',2,'Prueba',2,4,1),(293,'Y-4','A91126598',212,212,'Roma, juteapa, atlantida',1,'Prueba',3,3,1),(294,'Y-5','A96228424',387,387,'Roma, juteapa, atlantida',1,'Prueba',3,4,2),(295,'Y-6','A42554063',375,375,'Roma, juteapa, atlantida',3,'Prueba',3,2,1),(296,'Y-7','A50845606',140,140,'Roma, juteapa, atlantida',2,'Prueba',2,5,1),(297,'Y-8','A51216083',158,158,'Roma, juteapa, atlantida',3,'Prueba',2,5,2),(298,'Y-9','A27772845',481,481,'Roma, juteapa, atlantida',2,'Prueba',1,5,1),(299,'Y-10','A16590279',111,111,'Roma, juteapa, atlantida',1,'Prueba',3,2,2),(300,'Y-11','A27556040',160,160,'Roma, juteapa, atlantida',3,'Prueba',2,3,2),(301,'Y-12','A68191534',191,191,'Roma, juteapa, atlantida',2,'Prueba',1,2,1),(302,'Z-1','A57298132',446,446,'Roma, juteapa, atlantida',3,'Prueba',3,5,2),(303,'Z-2','A30974780',180,180,'Roma, juteapa, atlantida',1,'Prueba',2,3,2),(304,'Z-3','A70058424',116,116,'Roma, juteapa, atlantida',3,'Prueba',3,3,2),(305,'Z-4','A45267501',103,103,'Roma, juteapa, atlantida',2,'Prueba',2,4,1),(306,'Z-5','A62320759',350,350,'Roma, juteapa, atlantida',3,'Prueba',3,3,1),(307,'Z-6','A99536903',370,370,'Roma, juteapa, atlantida',2,'Prueba',2,5,1),(308,'Z-7','A78029522',207,207,'Roma, juteapa, atlantida',3,'Prueba',3,5,1),(309,'Z-8','A70911082',333,333,'Roma, juteapa, atlantida',1,'Prueba',3,3,2),(310,'Z-9','A71383099',315,315,'Roma, juteapa, atlantida',3,'Prueba',3,2,1),(311,'Z-10','A32897162',127,127,'Roma, juteapa, atlantida',1,'Prueba',1,5,2),(312,'Z-11','A89509080',428,428,'Roma, juteapa, atlantida',1,'Prueba',3,4,2),(313,'Z-12','A47129132',302,302,'Roma, juteapa, atlantida',1,'Prueba',3,4,2);
/*!40000 ALTER TABLE `villa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vista_villa`
--

DROP TABLE IF EXISTS `vista_villa`;
/*!50001 DROP VIEW IF EXISTS `vista_villa`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_villa` AS SELECT 
 1 AS `id_villa`,
 1 AS `cod_villa`,
 1 AS `cont_ehh`,
 1 AS `habitacion`,
 1 AS `modelo`,
 1 AS `tam_lote`,
 1 AS `tam_cons`,
 1 AS `condicion`,
 1 AS `estado_villa`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vista_villa`
--

/*!50001 DROP VIEW IF EXISTS `vista_villa`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_villa` AS select `villa`.`id_villa` AS `id_villa`,`villa`.`cod_villa` AS `cod_villa`,`villa`.`cont_ehh` AS `cont_ehh`,`villa`.`habitacion` AS `habitacion`,`modelo_villa`.`modelo` AS `modelo`,`villa`.`tam_lote` AS `tam_lote`,`villa`.`tam_cons` AS `tam_cons`,`condicion_villa`.`condicion` AS `condicion`,`estado_villa`.`estado_villa` AS `estado_villa` from (((`villa` join `estado_villa` on((`villa`.`id_estado_villa` = `estado_villa`.`id_estado_villa`))) join `modelo_villa` on((`villa`.`id_modelo` = `modelo_villa`.`id_modelo`))) join `condicion_villa` on((`villa`.`id_condicion` = `condicion_villa`.`id_condicion`))) */;
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

-- Dump completed on 2024-04-20 17:01:39
