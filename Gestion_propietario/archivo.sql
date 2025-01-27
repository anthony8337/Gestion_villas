-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: gestion_de_propietario
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Current Database: `gestion_de_propietario`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `gestion_de_propietario` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `gestion_de_propietario`;

--
-- Table structure for table `acceso_usuario`
--

DROP TABLE IF EXISTS `acceso_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acceso_usuario` (
  `id_acceso_usuario` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `imprimir_reportes` varchar(2) NOT NULL,
  `modificar_reportes` varchar(2) NOT NULL,
  `eliminar_reportes` varchar(2) NOT NULL,
  PRIMARY KEY (`id_acceso_usuario`),
  KEY `FK_usuario_acceso` (`id_usuario`),
  CONSTRAINT `FK_usuario_acceso` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acceso_usuario`
--

LOCK TABLES `acceso_usuario` WRITE;
/*!40000 ALTER TABLE `acceso_usuario` DISABLE KEYS */;
INSERT INTO `acceso_usuario` VALUES (1,1,'si','si','si');
/*!40000 ALTER TABLE `acceso_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adicion`
--

DROP TABLE IF EXISTS `adicion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adicion` (
  `id_adicion` int NOT NULL AUTO_INCREMENT,
  `id_propi` int NOT NULL,
  `cuenta` int NOT NULL,
  `id_villa` int NOT NULL,
  `descripcion` varchar(1000) NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id_adicion`),
  KEY `FK_propietario_adicion` (`id_propi`),
  KEY `FK_villa_adicion` (`id_villa`),
  CONSTRAINT `FK_propietario_adicion` FOREIGN KEY (`id_propi`) REFERENCES `propietarios` (`id_propietario`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_villa_adicion` FOREIGN KEY (`id_villa`) REFERENCES `villas` (`id_villa`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adicion`
--

LOCK TABLES `adicion` WRITE;
/*!40000 ALTER TABLE `adicion` DISABLE KEYS */;
/*!40000 ALTER TABLE `adicion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `adicionar_descripcion`
--

DROP TABLE IF EXISTS `adicionar_descripcion`;
/*!50001 DROP VIEW IF EXISTS `adicionar_descripcion`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `adicionar_descripcion` AS SELECT 
 1 AS `id_adicion`,
 1 AS `cuenta`,
 1 AS `fecha`,
 1 AS `nombre`,
 1 AS `dni`,
 1 AS `villas`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `cambio`
--

DROP TABLE IF EXISTS `cambio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cambio` (
  `id_cambio` int NOT NULL AUTO_INCREMENT,
  `id_donante` int NOT NULL,
  `cuenta` int NOT NULL,
  `id_recibie` int NOT NULL,
  `id_villa` int NOT NULL,
  `descripcion` varchar(1000) NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id_cambio`),
  KEY `FK_donador` (`id_donante`),
  KEY `FK_receptor` (`id_recibie`),
  KEY `FK_villa` (`id_villa`),
  CONSTRAINT `FK_donador` FOREIGN KEY (`id_donante`) REFERENCES `propietarios` (`id_propietario`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_receptor` FOREIGN KEY (`id_recibie`) REFERENCES `propietarios` (`id_propietario`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_villa` FOREIGN KEY (`id_villa`) REFERENCES `villas` (`id_villa`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cambio`
--

LOCK TABLES `cambio` WRITE;
/*!40000 ALTER TABLE `cambio` DISABLE KEYS */;
/*!40000 ALTER TABLE `cambio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caracteristicas`
--

DROP TABLE IF EXISTS `caracteristicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `caracteristicas` (
  `id_caracteristica` int NOT NULL AUTO_INCREMENT,
  `id_villa` int DEFAULT NULL,
  `caracteristica` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id_caracteristica`),
  KEY `FK_caracteristicas_villas` (`id_villa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caracteristicas`
--

LOCK TABLES `caracteristicas` WRITE;
/*!40000 ALTER TABLE `caracteristicas` DISABLE KEYS */;
/*!40000 ALTER TABLE `caracteristicas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `cod_villa`
--

DROP TABLE IF EXISTS `cod_villa`;
/*!50001 DROP VIEW IF EXISTS `cod_villa`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `cod_villa` AS SELECT 
 1 AS `villa`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `concepto`
--

DROP TABLE IF EXISTS `concepto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `concepto` (
  `id_concepto` int NOT NULL AUTO_INCREMENT,
  `concepto` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `tipo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `valor` double DEFAULT NULL,
  `referencia` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_estado` int DEFAULT NULL,
  PRIMARY KEY (`id_concepto`),
  KEY `FK_concepto_estado_concepto` (`id_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concepto`
--

LOCK TABLES `concepto` WRITE;
/*!40000 ALTER TABLE `concepto` DISABLE KEYS */;
INSERT INTO `concepto` VALUES (1,'AGUA','Abono',850,'No',1),(2,'LUZ','Abono',250,'No',1),(3,'MANTENIMIENTO','Abono',200,'No',1),(4,'PAGO MENSUAL','Cargo',0,'Si',1),(5,'PAGO UNICO','Cargo',0,'Si',1),(6,'ADELANTO','Cargo',0,'Si',1),(7,'FACTURA','Cargo',0,'Si',1),(8,'JNJNJNJ','Abono',5555.52,'No',2);
/*!40000 ALTER TABLE `concepto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `condicion_villas`
--

DROP TABLE IF EXISTS `condicion_villas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `condicion_villas` (
  `id_condicion` int NOT NULL AUTO_INCREMENT,
  `condicion` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id_condicion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `condicion_villas`
--

LOCK TABLES `condicion_villas` WRITE;
/*!40000 ALTER TABLE `condicion_villas` DISABLE KEYS */;
/*!40000 ALTER TABLE `condicion_villas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conexion_whatsaap`
--

DROP TABLE IF EXISTS `conexion_whatsaap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conexion_whatsaap` (
  `sid` varbinary(600) DEFAULT NULL,
  `token` varbinary(600) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conexion_whatsaap`
--

LOCK TABLES `conexion_whatsaap` WRITE;
/*!40000 ALTER TABLE `conexion_whatsaap` DISABLE KEYS */;
/*!40000 ALTER TABLE `conexion_whatsaap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `confi_automatico`
--

DROP TABLE IF EXISTS `confi_automatico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `confi_automatico` (
  `id_confi_auto` int NOT NULL AUTO_INCREMENT,
  `dia_generar` int DEFAULT NULL,
  `id_concepto` int DEFAULT NULL,
  `id_concepto_2` int NOT NULL,
  `uso` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id_confi_auto`),
  KEY `FK_concep_confi_auto` (`id_concepto`),
  KEY `FK_concep_confi_auto_2` (`id_concepto_2`),
  CONSTRAINT `FK_concep_confi_auto` FOREIGN KEY (`id_concepto`) REFERENCES `concepto` (`id_concepto`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_concep_confi_auto_2` FOREIGN KEY (`id_concepto_2`) REFERENCES `concepto` (`id_concepto`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `confi_automatico`
--

LOCK TABLES `confi_automatico` WRITE;
/*!40000 ALTER TABLE `confi_automatico` DISABLE KEYS */;
INSERT INTO `confi_automatico` VALUES (54,18,4,3,'si'),(55,18,4,2,'si'),(56,18,4,1,'si');
/*!40000 ALTER TABLE `confi_automatico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `confi_concepto_vista`
--

DROP TABLE IF EXISTS `confi_concepto_vista`;
/*!50001 DROP VIEW IF EXISTS `confi_concepto_vista`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `confi_concepto_vista` AS SELECT 
 1 AS `dia_generar`,
 1 AS `id_concepto`,
 1 AS `concepto`,
 1 AS `id_concepto_2`,
 1 AS `concepto_cargo`,
 1 AS `valor`,
 1 AS `uso`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `contactos_propietario`
--

DROP TABLE IF EXISTS `contactos_propietario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contactos_propietario` (
  `id_contacto` int NOT NULL AUTO_INCREMENT,
  `id_propietario` int DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `numero` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_contacto`),
  KEY `FK_id_propietario` (`id_propietario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contactos_propietario`
--

LOCK TABLES `contactos_propietario` WRITE;
/*!40000 ALTER TABLE `contactos_propietario` DISABLE KEYS */;
/*!40000 ALTER TABLE `contactos_propietario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `cuenta_automa_vista`
--

DROP TABLE IF EXISTS `cuenta_automa_vista`;
/*!50001 DROP VIEW IF EXISTS `cuenta_automa_vista`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `cuenta_automa_vista` AS SELECT 
 1 AS `id_ca`,
 1 AS `id_unir`,
 1 AS `id_concepto`,
 1 AS `concepto`,
 1 AS `id_concepto_2`,
 1 AS `concepto_2`,
 1 AS `valor`,
 1 AS `fecha_generar`,
 1 AS `habilitar`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `cuenta_automatica`
--

DROP TABLE IF EXISTS `cuenta_automatica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuenta_automatica` (
  `id_ca` int NOT NULL AUTO_INCREMENT,
  `id_unir` int DEFAULT NULL,
  `id_concepto` int DEFAULT NULL,
  `id_concepto_2` int DEFAULT NULL,
  `valor` float DEFAULT NULL,
  `fecha_generar` int DEFAULT NULL,
  `habilitar` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id_ca`),
  KEY `FK_ca_concepto1` (`id_concepto`),
  KEY `FK_ca_concepto2` (`id_concepto_2`),
  CONSTRAINT `FK_ca_concepto1` FOREIGN KEY (`id_concepto`) REFERENCES `concepto` (`id_concepto`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_ca_concepto2` FOREIGN KEY (`id_concepto_2`) REFERENCES `concepto` (`id_concepto`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=965 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuenta_automatica`
--

LOCK TABLES `cuenta_automatica` WRITE;
/*!40000 ALTER TABLE `cuenta_automatica` DISABLE KEYS */;
INSERT INTO `cuenta_automatica` VALUES (959,22,4,3,5,18,'si'),(960,22,4,2,250,18,'si'),(961,22,4,1,850,18,'si'),(962,23,4,3,200,18,'no'),(963,23,4,2,250,18,'no'),(964,23,4,1,100,18,'no');
/*!40000 ALTER TABLE `cuenta_automatica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuenta_estado`
--

DROP TABLE IF EXISTS `cuenta_estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuenta_estado` (
  `id_estado_cuenta` int NOT NULL AUTO_INCREMENT,
  `costo` float DEFAULT NULL,
  `abono` float DEFAULT NULL,
  `fecha_aplicada` date DEFAULT NULL,
  `id_cuenta` int DEFAULT NULL,
  PRIMARY KEY (`id_estado_cuenta`),
  KEY `FK_id_cuenta` (`id_cuenta`),
  CONSTRAINT `FK_id_cuenta` FOREIGN KEY (`id_cuenta`) REFERENCES `cuentas` (`id_cuenta`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=526 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuenta_estado`
--

LOCK TABLES `cuenta_estado` WRITE;
/*!40000 ALTER TABLE `cuenta_estado` DISABLE KEYS */;
INSERT INTO `cuenta_estado` VALUES (502,5,0,'2025-01-18',510),(503,250,0,'2025-01-08',511),(504,850,0,'2025-01-18',512),(505,0,850,'2025-01-07',512),(506,0,1700,'2025-01-07',513),(507,5,0,'2025-01-18',514),(508,250,0,'2025-01-18',515),(509,0,850,'2025-01-18',516),(510,5,0,'2025-01-18',517),(511,250,0,'2025-01-18',518),(512,0,850,'2025-01-18',519),(513,5,0,'2025-01-18',520),(514,250,0,'2025-01-18',521),(515,0,850,'2025-01-18',522),(516,5,0,'2025-01-18',523),(517,250,0,'2025-01-18',524),(518,1,850,'2025-01-18',525),(519,5,0,'2025-01-18',526),(520,250,0,'2025-01-18',527),(521,850,0,'2025-01-18',528),(522,0,250,'2025-01-08',511),(523,5,0,'2025-01-18',529),(524,250,0,'2025-01-18',530),(525,850,0,'2025-01-18',531);
/*!40000 ALTER TABLE `cuenta_estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `cuenta_vista`
--

DROP TABLE IF EXISTS `cuenta_vista`;
/*!50001 DROP VIEW IF EXISTS `cuenta_vista`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `cuenta_vista` AS SELECT 
 1 AS `id_cuenta`,
 1 AS `codigo`,
 1 AS `id_unir`,
 1 AS `costo`,
 1 AS `abono`,
 1 AS `desde`,
 1 AS `hasta`,
 1 AS `pagado`,
 1 AS `concepto_2`,
 1 AS `nombre`,
 1 AS `villa`,
 1 AS `concepto`,
 1 AS `id_concepto`,
 1 AS `con_descrip`,
 1 AS `con_pagado`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `cuentas`
--

DROP TABLE IF EXISTS `cuentas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuentas` (
  `id_cuenta` int NOT NULL AUTO_INCREMENT,
  `id_unir` int DEFAULT NULL,
  `id_concepto` int DEFAULT NULL,
  `costo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `abono` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `desde` date DEFAULT NULL,
  `hasta` date DEFAULT NULL,
  `pagado` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `codigo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_concepto_2` int DEFAULT NULL,
  `con_pagado` varchar(50) NOT NULL,
  PRIMARY KEY (`id_cuenta`),
  KEY `FK_cuenta_concepto` (`id_concepto`),
  KEY `FK_cuentas_propietarios_villas` (`id_unir`),
  KEY `FK_concepto_2` (`id_concepto_2`)
) ENGINE=InnoDB AUTO_INCREMENT=532 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuentas`
--

LOCK TABLES `cuentas` WRITE;
/*!40000 ALTER TABLE `cuentas` DISABLE KEYS */;
INSERT INTO `cuentas` VALUES (93,NULL,NULL,'0','0','2024-01-01','2024-01-01','Pagado','1000000',NULL,'completo'),(510,22,3,'5.00','0','2025-01-18','2025-02-18','No pagado','1000001',4,'falta'),(511,22,2,'0','250','2025-01-18','2025-02-18','Pagado','1000002',4,'completo'),(512,22,1,'0','850','2025-01-18','2025-02-18','Pagado','1000003',4,'completo'),(513,22,1,'0','1700','2025-01-07','2025-03-07','Favor','1000004',4,'completo'),(514,22,3,'5.00','0','2025-01-18','2025-02-18','No pagado','1000005',4,'falta'),(515,22,2,'250.00','0','2025-01-18','2025-02-18','No pagado','1000006',4,'falta'),(516,22,1,'850.00','0','2025-01-18','2025-02-18','Pagado','1000007',4,'completo'),(517,22,3,'5.00','0','2025-01-18','2025-02-18','No pagado','1000008',4,'falta'),(518,22,2,'250.00','0','2025-01-18','2025-02-18','No pagado','1000009',4,'falta'),(519,22,1,'850.00','0','2025-01-18','2025-02-18','Pagado','1000010',4,'completo'),(520,22,3,'5.00','0','2025-01-18','2025-02-18','No pagado','1000011',4,'falta'),(521,22,2,'250.00','0','2025-01-18','2025-02-18','No pagado','1000012',4,'falta'),(522,22,1,'0','850.00','2025-01-18','2025-02-18','Pagado','1000013',4,'completo'),(523,22,3,'5.00','0','2025-01-18','2025-02-18','No pagado','1000014',4,'falta'),(524,22,2,'250.00','0','2025-01-18','2025-02-18','No pagado','1000015',4,'falta'),(525,22,1,'1','850.00','2025-01-18','2025-02-18','Pagado','1000016',4,'completo'),(526,22,3,'5.00','0','2025-01-18','2025-02-18','No pagado','1000017',4,'falta'),(527,22,2,'250.00','0','2025-01-18','2025-02-18','No pagado','1000018',4,'falta'),(528,22,1,'850.00','0','2025-01-18','2025-02-18','Pagado','1000019',4,'completo'),(529,22,3,'5.00','0','2025-01-18','2025-02-18','No pagado','1000020',4,'falta'),(530,22,2,'250.00','0','2025-01-18','2025-02-18','No pagado','1000021',4,'falta'),(531,22,1,'850.00','0','2025-01-18','2025-02-18','Pagado','1000022',4,'completo');
/*!40000 ALTER TABLE `cuentas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `descripcion_donador`
--

DROP TABLE IF EXISTS `descripcion_donador`;
/*!50001 DROP VIEW IF EXISTS `descripcion_donador`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `descripcion_donador` AS SELECT 
 1 AS `id_cambio`,
 1 AS `id_propietario`,
 1 AS `cuentas`,
 1 AS `nombre`,
 1 AS `dni`,
 1 AS `id_pro_2`,
 1 AS `nombre_2`,
 1 AS `dni_2`,
 1 AS `villas`,
 1 AS `fecha`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `donar_recibir_villa`
--

DROP TABLE IF EXISTS `donar_recibir_villa`;
/*!50001 DROP VIEW IF EXISTS `donar_recibir_villa`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `donar_recibir_villa` AS SELECT 
 1 AS `id_propietario`,
 1 AS `id_villa`,
 1 AS `villas`,
 1 AS `cont_eeh`,
 1 AS `habitaciones`,
 1 AS `condicion`,
 1 AS `modelo`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `estado_concepto`
--

DROP TABLE IF EXISTS `estado_concepto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado_concepto` (
  `id_estado` int NOT NULL AUTO_INCREMENT,
  `estado` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_concepto`
--

LOCK TABLES `estado_concepto` WRITE;
/*!40000 ALTER TABLE `estado_concepto` DISABLE KEYS */;
/*!40000 ALTER TABLE `estado_concepto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `estado_cuenta`
--

DROP TABLE IF EXISTS `estado_cuenta`;
/*!50001 DROP VIEW IF EXISTS `estado_cuenta`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `estado_cuenta` AS SELECT 
 1 AS `id_estado_cuenta`,
 1 AS `costo`,
 1 AS `abono`,
 1 AS `fecha_aplicada`,
 1 AS `id_unir`,
 1 AS `codigo`,
 1 AS `id_concepto`,
 1 AS `con_pagado`,
 1 AS `concepto`,
 1 AS `concepto_2`,
 1 AS `nombre`,
 1 AS `villa`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `estado_grupo_villa`
--

DROP TABLE IF EXISTS `estado_grupo_villa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado_grupo_villa` (
  `id_estado` int NOT NULL AUTO_INCREMENT,
  `estado` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_grupo_villa`
--

LOCK TABLES `estado_grupo_villa` WRITE;
/*!40000 ALTER TABLE `estado_grupo_villa` DISABLE KEYS */;
/*!40000 ALTER TABLE `estado_grupo_villa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado_modelos`
--

DROP TABLE IF EXISTS `estado_modelos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado_modelos` (
  `id_estado` int NOT NULL AUTO_INCREMENT,
  `estado` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_modelos`
--

LOCK TABLES `estado_modelos` WRITE;
/*!40000 ALTER TABLE `estado_modelos` DISABLE KEYS */;
/*!40000 ALTER TABLE `estado_modelos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado_moneda`
--

DROP TABLE IF EXISTS `estado_moneda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado_moneda` (
  `id_estado` int NOT NULL AUTO_INCREMENT,
  `estado` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_moneda`
--

LOCK TABLES `estado_moneda` WRITE;
/*!40000 ALTER TABLE `estado_moneda` DISABLE KEYS */;
/*!40000 ALTER TABLE `estado_moneda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado_multipago`
--

DROP TABLE IF EXISTS `estado_multipago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado_multipago` (
  `id_estado` int NOT NULL AUTO_INCREMENT,
  `estado` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_multipago`
--

LOCK TABLES `estado_multipago` WRITE;
/*!40000 ALTER TABLE `estado_multipago` DISABLE KEYS */;
/*!40000 ALTER TABLE `estado_multipago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado_pago`
--

DROP TABLE IF EXISTS `estado_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado_pago` (
  `id_estado` int NOT NULL AUTO_INCREMENT,
  `estado` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_pago`
--

LOCK TABLES `estado_pago` WRITE;
/*!40000 ALTER TABLE `estado_pago` DISABLE KEYS */;
/*!40000 ALTER TABLE `estado_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado_propietario`
--

DROP TABLE IF EXISTS `estado_propietario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado_propietario` (
  `id_estado` int NOT NULL AUTO_INCREMENT,
  `estado` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_propietario`
--

LOCK TABLES `estado_propietario` WRITE;
/*!40000 ALTER TABLE `estado_propietario` DISABLE KEYS */;
/*!40000 ALTER TABLE `estado_propietario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado_usuario`
--

DROP TABLE IF EXISTS `estado_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado_usuario` (
  `id_estado` int NOT NULL AUTO_INCREMENT,
  `estado` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_usuario`
--

LOCK TABLES `estado_usuario` WRITE;
/*!40000 ALTER TABLE `estado_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `estado_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado_villa`
--

DROP TABLE IF EXISTS `estado_villa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado_villa` (
  `id_estado` int NOT NULL AUTO_INCREMENT,
  `estado` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_villa`
--

LOCK TABLES `estado_villa` WRITE;
/*!40000 ALTER TABLE `estado_villa` DISABLE KEYS */;
/*!40000 ALTER TABLE `estado_villa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `factura_completa_reimprimir`
--

DROP TABLE IF EXISTS `factura_completa_reimprimir`;
/*!50001 DROP VIEW IF EXISTS `factura_completa_reimprimir`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `factura_completa_reimprimir` AS SELECT 
 1 AS `codigo_pago`,
 1 AS `concepto`,
 1 AS `fecha_pago`,
 1 AS `id_unir`,
 1 AS `desde`,
 1 AS `hasta`,
 1 AS `codigo`,
 1 AS `costo`,
 1 AS `abono`,
 1 AS `tipo_pago`,
 1 AS `forma_pago`,
 1 AS `n_referencia`,
 1 AS `cantidad_recibida`,
 1 AS `abono_con`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `forma_de_pago`
--

DROP TABLE IF EXISTS `forma_de_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forma_de_pago` (
  `id_pago` int NOT NULL AUTO_INCREMENT,
  `pago` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_estado` int DEFAULT NULL,
  PRIMARY KEY (`id_pago`),
  KEY `FK_forma_de_pago_estado_pago` (`id_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forma_de_pago`
--

LOCK TABLES `forma_de_pago` WRITE;
/*!40000 ALTER TABLE `forma_de_pago` DISABLE KEYS */;
/*!40000 ALTER TABLE `forma_de_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forma_pago`
--

DROP TABLE IF EXISTS `forma_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forma_pago` (
  `id_forma` int NOT NULL AUTO_INCREMENT,
  `id_multi` int NOT NULL,
  `tipo_pago` varchar(50) NOT NULL,
  `forma_pago` varchar(50) NOT NULL,
  `n_referencia` varchar(50) NOT NULL,
  PRIMARY KEY (`id_forma`),
  KEY `FK_id_cuenta` (`id_multi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forma_pago`
--

LOCK TABLES `forma_pago` WRITE;
/*!40000 ALTER TABLE `forma_pago` DISABLE KEYS */;
/*!40000 ALTER TABLE `forma_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupo_villa`
--

DROP TABLE IF EXISTS `grupo_villa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grupo_villa` (
  `id_grupo` int NOT NULL AUTO_INCREMENT,
  `grupo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_estado` int DEFAULT NULL,
  PRIMARY KEY (`id_grupo`),
  KEY `FK_grupo_villa_estado_grupo_villa` (`id_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo_villa`
--

LOCK TABLES `grupo_villa` WRITE;
/*!40000 ALTER TABLE `grupo_villa` DISABLE KEYS */;
INSERT INTO `grupo_villa` VALUES (1,'A',1),(2,'B',1),(3,'C',1);
/*!40000 ALTER TABLE `grupo_villa` ENABLE KEYS */;
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
  `id_estado` int DEFAULT NULL,
  PRIMARY KEY (`id_modelo`),
  KEY `FK_modelo_villa_estado_modelos` (`id_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modelo_villa`
--

LOCK TABLES `modelo_villa` WRITE;
/*!40000 ALTER TABLE `modelo_villa` DISABLE KEYS */;
INSERT INTO `modelo_villa` VALUES (1,'CORAL',1),(2,'ARRECIFE',1),(3,'CAREY',1);
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
  `nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `simbolo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `valor` double DEFAULT NULL,
  `id_estado` int DEFAULT NULL,
  PRIMARY KEY (`id_moneda`),
  KEY `FK_Moneda_estado_moneda` (`id_estado`)
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
-- Table structure for table `multi_pago`
--

DROP TABLE IF EXISTS `multi_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `multi_pago` (
  `id_multi` int NOT NULL AUTO_INCREMENT,
  `codigo_pago` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_unir` int DEFAULT NULL,
  `id_cuenta` int DEFAULT NULL,
  `fecha_pago` date DEFAULT NULL,
  `costo` float DEFAULT NULL,
  `total_pago` float DEFAULT NULL,
  `cantidad_recibida` float DEFAULT NULL,
  `cantidad_devuelta` float DEFAULT NULL,
  `id_estado` int DEFAULT NULL,
  `id_pago` int DEFAULT NULL,
  `id_concepto` int DEFAULT NULL,
  `tipo_pago` varchar(50) DEFAULT NULL,
  `forma_pago` varchar(50) DEFAULT NULL,
  `n_referencia` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_multi`),
  KEY `FK_multi_pago_cuentas` (`id_cuenta`),
  KEY `FK_multi_pago_propietarios_villas` (`id_unir`),
  KEY `FK_multi_pago_estado_multipago` (`id_estado`),
  KEY `FK_multi_pago_forma_de_pago` (`id_pago`),
  KEY `FK_multi_pago_id_concepto` (`id_concepto`)
) ENGINE=InnoDB AUTO_INCREMENT=198 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `multi_pago`
--

LOCK TABLES `multi_pago` WRITE;
/*!40000 ALTER TABLE `multi_pago` DISABLE KEYS */;
INSERT INTO `multi_pago` VALUES (1,'2000000',1,8,'2024-12-13',NULL,160,160,0,1,1,3,'Efectivo','Físico por abono','Ninguna'),(2,'2000001',1,93,'2024-12-17',NULL,200,200,0,1,1,3,'Efectivo','Físico por abono','Ninguna'),(3,'2000002',22,266,'2024-12-18',NULL,200,200,0,1,1,3,'Efectivo','Físico','Ninguna'),(4,'2000003',23,269,'2025-01-02',NULL,7000,7000,0,1,1,3,'Efectivo','Físico','Ninguna'),(5,'2000003',23,275,'2025-01-02',NULL,7000,7000,0,1,1,3,'Efectivo','Físico','Ninguna'),(6,'2000003',23,281,'2025-01-02',NULL,7000,7000,0,1,1,3,'Efectivo','Físico','Ninguna'),(7,'2000003',23,287,'2025-01-02',NULL,7000,7000,0,1,1,3,'Efectivo','Físico','Ninguna'),(8,'2000003',23,293,'2025-01-02',NULL,7000,7000,0,1,1,3,'Efectivo','Físico','Ninguna'),(9,'2000003',23,299,'2025-01-02',NULL,7000,7000,0,1,1,3,'Efectivo','Físico','Ninguna'),(10,'2000003',23,305,'2025-01-02',NULL,7000,7000,0,1,1,3,'Efectivo','Físico','Ninguna'),(11,'2000003',23,311,'2025-01-02',NULL,7000,7000,0,1,1,3,'Efectivo','Físico','Ninguna'),(12,'2000003',23,317,'2025-01-02',NULL,7000,7000,0,1,1,3,'Efectivo','Físico','Ninguna'),(13,'2000003',23,323,'2025-01-02',NULL,7000,7000,0,1,1,3,'Efectivo','Físico','Ninguna'),(14,'2000003',23,329,'2025-01-02',NULL,7000,7000,0,1,1,3,'Efectivo','Físico','Ninguna'),(15,'2000003',23,335,'2025-01-02',NULL,7000,7000,0,1,1,3,'Efectivo','Físico','Ninguna'),(16,'2000003',23,341,'2025-01-02',NULL,7000,7000,0,1,1,3,'Efectivo','Físico','Ninguna'),(17,'2000003',23,347,'2025-01-02',NULL,7000,7000,0,1,1,3,'Efectivo','Físico','Ninguna'),(18,'2000003',23,353,'2025-01-02',NULL,7000,7000,0,1,1,3,'Efectivo','Físico','Ninguna'),(19,'2000003',23,359,'2025-01-02',NULL,7000,7000,0,1,1,3,'Efectivo','Físico','Ninguna'),(20,'2000003',23,365,'2025-01-02',NULL,7000,7000,0,1,1,3,'Efectivo','Físico','Ninguna'),(21,'2000003',23,371,'2025-01-02',NULL,7000,7000,0,1,1,3,'Efectivo','Físico','Ninguna'),(22,'2000003',23,377,'2025-01-02',NULL,7000,7000,0,1,1,3,'Efectivo','Físico','Ninguna'),(23,'2000003',23,383,'2025-01-02',NULL,7000,7000,0,1,1,3,'Efectivo','Físico','Ninguna'),(24,'2000003',23,389,'2025-01-02',NULL,7000,7000,0,1,1,3,'Efectivo','Físico','Ninguna'),(25,'2000003',23,395,'2025-01-02',NULL,7000,7000,0,1,1,3,'Efectivo','Físico','Ninguna'),(26,'2000003',23,401,'2025-01-02',NULL,7000,7000,0,1,1,3,'Efectivo','Físico','Ninguna'),(27,'2000003',23,407,'2025-01-02',NULL,7000,7000,0,1,1,3,'Efectivo','Físico','Ninguna'),(28,'2000003',23,413,'2025-01-02',NULL,7000,7000,0,1,1,3,'Efectivo','Físico','Ninguna'),(29,'2000003',23,419,'2025-01-02',NULL,7000,7000,0,1,1,3,'Efectivo','Físico','Ninguna'),(30,'2000003',23,425,'2025-01-02',NULL,7000,7000,0,1,1,3,'Efectivo','Físico','Ninguna'),(31,'2000003',23,431,'2025-01-02',NULL,7000,7000,0,1,1,3,'Efectivo','Físico','Ninguna'),(32,'2000003',23,437,'2025-01-02',NULL,7000,7000,0,1,1,3,'Efectivo','Físico','Ninguna'),(33,'2000003',23,443,'2025-01-02',NULL,7000,7000,0,1,1,3,'Efectivo','Físico','Ninguna'),(34,'2000003',23,449,'2025-01-02',NULL,7000,7000,0,1,1,3,'Efectivo','Físico','Ninguna'),(35,'2000003',23,455,'2025-01-02',NULL,7000,7000,0,1,1,3,'Efectivo','Físico','Ninguna'),(36,'2000003',23,461,'2025-01-02',NULL,7000,7000,0,1,1,3,'Efectivo','Físico','Ninguna'),(37,'2000003',23,467,'2025-01-02',NULL,7000,7000,0,1,1,3,'Efectivo','Físico','Ninguna'),(38,'2000003',23,473,'2025-01-02',NULL,7000,7000,0,1,1,3,'Efectivo','Físico','Ninguna'),(39,'2000004',23,271,'2025-01-02',NULL,3560,3560,0,1,1,1,'Efectivo','Físico','Ninguna'),(40,'2000004',23,277,'2025-01-02',NULL,3560,3560,0,1,1,1,'Efectivo','Físico','Ninguna'),(41,'2000004',23,283,'2025-01-02',NULL,3560,3560,0,1,1,1,'Efectivo','Físico','Ninguna'),(42,'2000004',23,289,'2025-01-02',NULL,3560,3560,0,1,1,1,'Efectivo','Físico','Ninguna'),(43,'2000004',23,295,'2025-01-02',NULL,3560,3560,0,1,1,1,'Efectivo','Físico','Ninguna'),(44,'2000004',23,301,'2025-01-02',NULL,3560,3560,0,1,1,1,'Efectivo','Físico','Ninguna'),(45,'2000004',23,307,'2025-01-02',NULL,3560,3560,0,1,1,1,'Efectivo','Físico','Ninguna'),(46,'2000004',23,313,'2025-01-02',NULL,3560,3560,0,1,1,1,'Efectivo','Físico','Ninguna'),(47,'2000004',23,319,'2025-01-02',NULL,3560,3560,0,1,1,1,'Efectivo','Físico','Ninguna'),(48,'2000004',23,325,'2025-01-02',NULL,3560,3560,0,1,1,1,'Efectivo','Físico','Ninguna'),(49,'2000004',23,331,'2025-01-02',NULL,3560,3560,0,1,1,1,'Efectivo','Físico','Ninguna'),(50,'2000004',23,337,'2025-01-02',NULL,3560,3560,0,1,1,1,'Efectivo','Físico','Ninguna'),(51,'2000004',23,343,'2025-01-02',NULL,3560,3560,0,1,1,1,'Efectivo','Físico','Ninguna'),(52,'2000004',23,349,'2025-01-02',NULL,3560,3560,0,1,1,1,'Efectivo','Físico','Ninguna'),(53,'2000004',23,355,'2025-01-02',NULL,3560,3560,0,1,1,1,'Efectivo','Físico','Ninguna'),(54,'2000004',23,361,'2025-01-02',NULL,3560,3560,0,1,1,1,'Efectivo','Físico','Ninguna'),(55,'2000004',23,367,'2025-01-02',NULL,3560,3560,0,1,1,1,'Efectivo','Físico','Ninguna'),(56,'2000004',23,373,'2025-01-02',NULL,3560,3560,0,1,1,1,'Efectivo','Físico','Ninguna'),(57,'2000004',23,379,'2025-01-02',NULL,3560,3560,0,1,1,1,'Efectivo','Físico','Ninguna'),(58,'2000004',23,385,'2025-01-02',NULL,3560,3560,0,1,1,1,'Efectivo','Físico','Ninguna'),(59,'2000004',23,391,'2025-01-02',NULL,3560,3560,0,1,1,1,'Efectivo','Físico','Ninguna'),(60,'2000004',23,397,'2025-01-02',NULL,3560,3560,0,1,1,1,'Efectivo','Físico','Ninguna'),(61,'2000004',23,403,'2025-01-02',NULL,3560,3560,0,1,1,1,'Efectivo','Físico','Ninguna'),(62,'2000004',23,409,'2025-01-02',NULL,3560,3560,0,1,1,1,'Efectivo','Físico','Ninguna'),(63,'2000004',23,415,'2025-01-02',NULL,3560,3560,0,1,1,1,'Efectivo','Físico','Ninguna'),(64,'2000004',23,421,'2025-01-02',NULL,3560,3560,0,1,1,1,'Efectivo','Físico','Ninguna'),(65,'2000004',23,427,'2025-01-02',NULL,3560,3560,0,1,1,1,'Efectivo','Físico','Ninguna'),(66,'2000004',23,433,'2025-01-02',NULL,3560,3560,0,1,1,1,'Efectivo','Físico','Ninguna'),(67,'2000004',23,439,'2025-01-02',NULL,3560,3560,0,1,1,1,'Efectivo','Físico','Ninguna'),(68,'2000004',23,445,'2025-01-02',NULL,3560,3560,0,1,1,1,'Efectivo','Físico','Ninguna'),(69,'2000004',23,451,'2025-01-02',NULL,3560,3560,0,1,1,1,'Efectivo','Físico','Ninguna'),(70,'2000004',23,457,'2025-01-02',NULL,3560,3560,0,1,1,1,'Efectivo','Físico','Ninguna'),(71,'2000004',23,463,'2025-01-02',NULL,3560,3560,0,1,1,1,'Efectivo','Físico','Ninguna'),(72,'2000004',23,469,'2025-01-02',NULL,3560,3560,0,1,1,1,'Efectivo','Físico','Ninguna'),(73,'2000004',23,475,'2025-01-02',NULL,3560,3560,0,1,1,1,'Efectivo','Físico','Ninguna'),(74,'2000005',22,267,'2025-01-02',NULL,8750,8750,0,1,1,2,'Efectivo','Físico','Ninguna'),(75,'2000005',22,273,'2025-01-02',NULL,8750,8750,0,1,1,2,'Efectivo','Físico','Ninguna'),(76,'2000005',22,279,'2025-01-02',NULL,8750,8750,0,1,1,2,'Efectivo','Físico','Ninguna'),(77,'2000005',22,285,'2025-01-02',NULL,8750,8750,0,1,1,2,'Efectivo','Físico','Ninguna'),(78,'2000005',22,291,'2025-01-02',NULL,8750,8750,0,1,1,2,'Efectivo','Físico','Ninguna'),(79,'2000005',22,297,'2025-01-02',NULL,8750,8750,0,1,1,2,'Efectivo','Físico','Ninguna'),(80,'2000005',22,303,'2025-01-02',NULL,8750,8750,0,1,1,2,'Efectivo','Físico','Ninguna'),(81,'2000005',22,309,'2025-01-02',NULL,8750,8750,0,1,1,2,'Efectivo','Físico','Ninguna'),(82,'2000005',22,315,'2025-01-02',NULL,8750,8750,0,1,1,2,'Efectivo','Físico','Ninguna'),(83,'2000005',22,321,'2025-01-02',NULL,8750,8750,0,1,1,2,'Efectivo','Físico','Ninguna'),(84,'2000005',22,327,'2025-01-02',NULL,8750,8750,0,1,1,2,'Efectivo','Físico','Ninguna'),(85,'2000005',22,333,'2025-01-02',NULL,8750,8750,0,1,1,2,'Efectivo','Físico','Ninguna'),(86,'2000005',22,339,'2025-01-02',NULL,8750,8750,0,1,1,2,'Efectivo','Físico','Ninguna'),(87,'2000005',22,345,'2025-01-02',NULL,8750,8750,0,1,1,2,'Efectivo','Físico','Ninguna'),(88,'2000005',22,351,'2025-01-02',NULL,8750,8750,0,1,1,2,'Efectivo','Físico','Ninguna'),(89,'2000005',22,357,'2025-01-02',NULL,8750,8750,0,1,1,2,'Efectivo','Físico','Ninguna'),(90,'2000005',22,363,'2025-01-02',NULL,8750,8750,0,1,1,2,'Efectivo','Físico','Ninguna'),(91,'2000005',22,369,'2025-01-02',NULL,8750,8750,0,1,1,2,'Efectivo','Físico','Ninguna'),(92,'2000005',22,375,'2025-01-02',NULL,8750,8750,0,1,1,2,'Efectivo','Físico','Ninguna'),(93,'2000005',22,381,'2025-01-02',NULL,8750,8750,0,1,1,2,'Efectivo','Físico','Ninguna'),(94,'2000005',22,387,'2025-01-02',NULL,8750,8750,0,1,1,2,'Efectivo','Físico','Ninguna'),(95,'2000005',22,393,'2025-01-02',NULL,8750,8750,0,1,1,2,'Efectivo','Físico','Ninguna'),(96,'2000005',22,399,'2025-01-02',NULL,8750,8750,0,1,1,2,'Efectivo','Físico','Ninguna'),(97,'2000005',22,405,'2025-01-02',NULL,8750,8750,0,1,1,2,'Efectivo','Físico','Ninguna'),(98,'2000005',22,411,'2025-01-02',NULL,8750,8750,0,1,1,2,'Efectivo','Físico','Ninguna'),(99,'2000005',22,417,'2025-01-02',NULL,8750,8750,0,1,1,2,'Efectivo','Físico','Ninguna'),(100,'2000005',22,423,'2025-01-02',NULL,8750,8750,0,1,1,2,'Efectivo','Físico','Ninguna'),(101,'2000005',22,429,'2025-01-02',NULL,8750,8750,0,1,1,2,'Efectivo','Físico','Ninguna'),(102,'2000005',22,435,'2025-01-02',NULL,8750,8750,0,1,1,2,'Efectivo','Físico','Ninguna'),(103,'2000005',22,441,'2025-01-02',NULL,8750,8750,0,1,1,2,'Efectivo','Físico','Ninguna'),(104,'2000005',22,447,'2025-01-02',NULL,8750,8750,0,1,1,2,'Efectivo','Físico','Ninguna'),(105,'2000005',22,453,'2025-01-02',NULL,8750,8750,0,1,1,2,'Efectivo','Físico','Ninguna'),(106,'2000005',22,459,'2025-01-02',NULL,8750,8750,0,1,1,2,'Efectivo','Físico','Ninguna'),(107,'2000005',22,465,'2025-01-02',NULL,8750,8750,0,1,1,2,'Efectivo','Físico','Ninguna'),(108,'2000005',22,471,'2025-01-02',NULL,8750,8750,0,1,1,2,'Efectivo','Físico','Ninguna'),(109,'2000006',22,268,'2025-01-02',NULL,28960,28960,0,1,1,1,'Efectivo','Físico','Ninguna'),(110,'2000006',22,274,'2025-01-02',NULL,28960,28960,0,1,1,1,'Efectivo','Físico','Ninguna'),(111,'2000006',22,280,'2025-01-02',NULL,28960,28960,0,1,1,1,'Efectivo','Físico','Ninguna'),(112,'2000006',22,286,'2025-01-02',NULL,28960,28960,0,1,1,1,'Efectivo','Físico','Ninguna'),(113,'2000006',22,292,'2025-01-02',NULL,28960,28960,0,1,1,1,'Efectivo','Físico','Ninguna'),(114,'2000006',22,298,'2025-01-02',NULL,28960,28960,0,1,1,1,'Efectivo','Físico','Ninguna'),(115,'2000006',22,304,'2025-01-02',NULL,28960,28960,0,1,1,1,'Efectivo','Físico','Ninguna'),(116,'2000006',22,310,'2025-01-02',NULL,28960,28960,0,1,1,1,'Efectivo','Físico','Ninguna'),(117,'2000006',22,316,'2025-01-02',NULL,28960,28960,0,1,1,1,'Efectivo','Físico','Ninguna'),(118,'2000006',22,322,'2025-01-02',NULL,28960,28960,0,1,1,1,'Efectivo','Físico','Ninguna'),(119,'2000006',22,328,'2025-01-02',NULL,28960,28960,0,1,1,1,'Efectivo','Físico','Ninguna'),(120,'2000006',22,334,'2025-01-02',NULL,28960,28960,0,1,1,1,'Efectivo','Físico','Ninguna'),(121,'2000006',22,340,'2025-01-02',NULL,28960,28960,0,1,1,1,'Efectivo','Físico','Ninguna'),(122,'2000006',22,346,'2025-01-02',NULL,28960,28960,0,1,1,1,'Efectivo','Físico','Ninguna'),(123,'2000006',22,352,'2025-01-02',NULL,28960,28960,0,1,1,1,'Efectivo','Físico','Ninguna'),(124,'2000006',22,358,'2025-01-02',NULL,28960,28960,0,1,1,1,'Efectivo','Físico','Ninguna'),(125,'2000006',22,364,'2025-01-02',NULL,28960,28960,0,1,1,1,'Efectivo','Físico','Ninguna'),(126,'2000006',22,370,'2025-01-02',NULL,28960,28960,0,1,1,1,'Efectivo','Físico','Ninguna'),(127,'2000006',22,376,'2025-01-02',NULL,28960,28960,0,1,1,1,'Efectivo','Físico','Ninguna'),(128,'2000006',22,382,'2025-01-02',NULL,28960,28960,0,1,1,1,'Efectivo','Físico','Ninguna'),(129,'2000006',22,388,'2025-01-02',NULL,28960,28960,0,1,1,1,'Efectivo','Físico','Ninguna'),(130,'2000006',22,394,'2025-01-02',NULL,28960,28960,0,1,1,1,'Efectivo','Físico','Ninguna'),(131,'2000006',22,400,'2025-01-02',NULL,28960,28960,0,1,1,1,'Efectivo','Físico','Ninguna'),(132,'2000006',22,406,'2025-01-02',NULL,28960,28960,0,1,1,1,'Efectivo','Físico','Ninguna'),(133,'2000006',22,412,'2025-01-02',NULL,28960,28960,0,1,1,1,'Efectivo','Físico','Ninguna'),(134,'2000006',22,418,'2025-01-02',NULL,28960,28960,0,1,1,1,'Efectivo','Físico','Ninguna'),(135,'2000006',22,424,'2025-01-02',NULL,28960,28960,0,1,1,1,'Efectivo','Físico','Ninguna'),(136,'2000006',22,430,'2025-01-02',NULL,28960,28960,0,1,1,1,'Efectivo','Físico','Ninguna'),(137,'2000006',22,436,'2025-01-02',NULL,28960,28960,0,1,1,1,'Efectivo','Físico','Ninguna'),(138,'2000006',22,442,'2025-01-02',NULL,28960,28960,0,1,1,1,'Efectivo','Físico','Ninguna'),(139,'2000006',22,448,'2025-01-02',NULL,28960,28960,0,1,1,1,'Efectivo','Físico','Ninguna'),(140,'2000006',22,454,'2025-01-02',NULL,28960,28960,0,1,1,1,'Efectivo','Físico','Ninguna'),(141,'2000006',22,460,'2025-01-02',NULL,28960,28960,0,1,1,1,'Efectivo','Físico','Ninguna'),(142,'2000006',22,466,'2025-01-02',NULL,28960,28960,0,1,1,1,'Efectivo','Físico','Ninguna'),(143,'2000006',22,472,'2025-01-02',NULL,28960,28960,0,1,1,1,'Efectivo','Físico','Ninguna'),(144,'2000007',22,284,'2025-01-02',NULL,5,5,0,1,1,3,'Efectivo','Físico','Ninguna'),(145,'2000008',23,270,'2025-01-04',NULL,250,200,-50,1,1,2,'Efectivo','Físico','Ninguna'),(146,'2000009',22,478,'2025-01-04',NULL,450,450,0,1,1,2,'Efectivo','Físico por abono','Ninguna'),(147,'2000010',22,482,'2025-01-05',NULL,850,800,-50,1,1,1,'Efectivo','Físico','Ninguna'),(148,'2000011',22,482,'2025-01-07',NULL,900,900,0,1,1,1,'Efectivo','Físico','Ninguna'),(149,'2000011',22,488,'2025-01-07',NULL,900,900,0,1,1,1,'Efectivo','Físico','Ninguna'),(150,'2000012',22,491,'2025-01-07',NULL,850,850,0,1,1,1,'Efectivo','Físico','Ninguna'),(151,'2000013',22,272,'2025-01-07',NULL,185,185,0,1,1,3,'Efectivo','Físico','Ninguna'),(152,'2000013',22,278,'2025-01-07',NULL,185,185,0,1,1,3,'Efectivo','Físico','Ninguna'),(153,'2000013',22,290,'2025-01-07',NULL,185,185,0,1,1,3,'Efectivo','Físico','Ninguna'),(154,'2000013',22,296,'2025-01-07',NULL,185,185,0,1,1,3,'Efectivo','Físico','Ninguna'),(155,'2000013',22,302,'2025-01-07',NULL,185,185,0,1,1,3,'Efectivo','Físico','Ninguna'),(156,'2000013',22,308,'2025-01-07',NULL,185,185,0,1,1,3,'Efectivo','Físico','Ninguna'),(157,'2000013',22,314,'2025-01-07',NULL,185,185,0,1,1,3,'Efectivo','Físico','Ninguna'),(158,'2000013',22,320,'2025-01-07',NULL,185,185,0,1,1,3,'Efectivo','Físico','Ninguna'),(159,'2000013',22,326,'2025-01-07',NULL,185,185,0,1,1,3,'Efectivo','Físico','Ninguna'),(160,'2000013',22,332,'2025-01-07',NULL,185,185,0,1,1,3,'Efectivo','Físico','Ninguna'),(161,'2000013',22,338,'2025-01-07',NULL,185,185,0,1,1,3,'Efectivo','Físico','Ninguna'),(162,'2000013',22,344,'2025-01-07',NULL,185,185,0,1,1,3,'Efectivo','Físico','Ninguna'),(163,'2000013',22,350,'2025-01-07',NULL,185,185,0,1,1,3,'Efectivo','Físico','Ninguna'),(164,'2000013',22,356,'2025-01-07',NULL,185,185,0,1,1,3,'Efectivo','Físico','Ninguna'),(165,'2000013',22,362,'2025-01-07',NULL,185,185,0,1,1,3,'Efectivo','Físico','Ninguna'),(166,'2000013',22,368,'2025-01-07',NULL,185,185,0,1,1,3,'Efectivo','Físico','Ninguna'),(167,'2000013',22,374,'2025-01-07',NULL,185,185,0,1,1,3,'Efectivo','Físico','Ninguna'),(168,'2000013',22,380,'2025-01-07',NULL,185,185,0,1,1,3,'Efectivo','Físico','Ninguna'),(169,'2000013',22,386,'2025-01-07',NULL,185,185,0,1,1,3,'Efectivo','Físico','Ninguna'),(170,'2000013',22,392,'2025-01-07',NULL,185,185,0,1,1,3,'Efectivo','Físico','Ninguna'),(171,'2000013',22,398,'2025-01-07',NULL,185,185,0,1,1,3,'Efectivo','Físico','Ninguna'),(172,'2000013',22,404,'2025-01-07',NULL,185,185,0,1,1,3,'Efectivo','Físico','Ninguna'),(173,'2000013',22,410,'2025-01-07',NULL,185,185,0,1,1,3,'Efectivo','Físico','Ninguna'),(174,'2000013',22,416,'2025-01-07',NULL,185,185,0,1,1,3,'Efectivo','Físico','Ninguna'),(175,'2000013',22,422,'2025-01-07',NULL,185,185,0,1,1,3,'Efectivo','Físico','Ninguna'),(176,'2000013',22,428,'2025-01-07',NULL,185,185,0,1,1,3,'Efectivo','Físico','Ninguna'),(177,'2000013',22,434,'2025-01-07',NULL,185,185,0,1,1,3,'Efectivo','Físico','Ninguna'),(178,'2000013',22,440,'2025-01-07',NULL,185,185,0,1,1,3,'Efectivo','Físico','Ninguna'),(179,'2000013',22,446,'2025-01-07',NULL,185,185,0,1,1,3,'Efectivo','Físico','Ninguna'),(180,'2000013',22,452,'2025-01-07',NULL,185,185,0,1,1,3,'Efectivo','Físico','Ninguna'),(181,'2000013',22,458,'2025-01-07',NULL,185,185,0,1,1,3,'Efectivo','Físico','Ninguna'),(182,'2000013',22,464,'2025-01-07',NULL,185,185,0,1,1,3,'Efectivo','Físico','Ninguna'),(183,'2000013',22,470,'2025-01-07',NULL,185,185,0,1,1,3,'Efectivo','Físico','Ninguna'),(184,'2000013',22,480,'2025-01-07',NULL,185,185,0,1,1,3,'Efectivo','Físico','Ninguna'),(185,'2000013',22,486,'2025-01-07',NULL,185,185,0,1,1,3,'Efectivo','Físico','Ninguna'),(186,'2000013',22,489,'2025-01-07',NULL,185,185,0,1,1,3,'Efectivo','Físico','Ninguna'),(187,'2000013',22,493,'2025-01-07',NULL,185,185,0,1,1,3,'Efectivo','Físico','Ninguna'),(188,'2000014',22,496,'2025-01-07',NULL,5,5,0,1,1,3,'Efectivo','Físico','Ninguna'),(189,'2000015',22,481,'2025-01-07',NULL,1500,1500,0,1,1,2,'Efectivo','Físico','Ninguna'),(190,'2000015',22,487,'2025-01-07',NULL,1500,1500,0,1,1,2,'Efectivo','Físico','Ninguna'),(191,'2000015',22,490,'2025-01-07',NULL,1500,1500,0,1,1,2,'Efectivo','Físico','Ninguna'),(192,'2000015',22,494,'2025-01-07',NULL,1500,1500,0,1,1,2,'Efectivo','Físico','Ninguna'),(193,'2000015',22,497,'2025-01-07',NULL,1500,1500,0,1,1,2,'Efectivo','Físico','Ninguna'),(194,'2000015',22,501,'2025-01-07',NULL,1500,1500,0,1,1,2,'Efectivo','Físico','Ninguna'),(195,'2000016',22,504,'2025-01-07',NULL,250,250,0,1,1,2,'Efectivo','Físico','Ninguna'),(196,'2000017',22,512,'2025-01-07',NULL,850,850,0,1,1,1,'Efectivo','Físico','Ninguna'),(197,'2000018',22,511,'2025-01-08',NULL,250,250,0,1,1,2,'Efectivo','Físico','Ninguna');
/*!40000 ALTER TABLE `multi_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permisos`
--

DROP TABLE IF EXISTS `permisos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permisos` (
  `id_acceso` int NOT NULL AUTO_INCREMENT,
  `acceso` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id_acceso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permisos`
--

LOCK TABLES `permisos` WRITE;
/*!40000 ALTER TABLE `permisos` DISABLE KEYS */;
/*!40000 ALTER TABLE `permisos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personas_auto`
--

DROP TABLE IF EXISTS `personas_auto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personas_auto` (
  `id_persona` int NOT NULL AUTO_INCREMENT,
  `id_unir` int DEFAULT NULL,
  `nombre` varchar(250) DEFAULT NULL,
  `telefono` varchar(250) DEFAULT NULL,
  `correo` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id_persona`),
  KEY `FK_per_auto` (`id_unir`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personas_auto`
--

LOCK TABLES `personas_auto` WRITE;
/*!40000 ALTER TABLE `personas_auto` DISABLE KEYS */;
INSERT INTO `personas_auto` VALUES (1,6,'LOLA','',''),(2,6,'LOLA','',''),(3,7,'LOLA','',''),(4,7,'LOLA','',''),(5,8,'LOLA','',''),(6,9,'LOLA','',''),(7,10,'LOLA','',''),(8,10,'LOLA','',''),(12,23,'PEPITO','151551515','a@gmial.com'),(13,22,'JERRY','15555','aaaa@gmail.com'),(14,23,'LUISITO COMUNICA','626262626626626','reypalomo23@gmail.com'),(15,23,'AGUA CATE DEL PATIO','515','');
/*!40000 ALTER TABLE `personas_auto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `pripietario_cuenta_vista`
--

DROP TABLE IF EXISTS `pripietario_cuenta_vista`;
/*!50001 DROP VIEW IF EXISTS `pripietario_cuenta_vista`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `pripietario_cuenta_vista` AS SELECT 
 1 AS `id_unir`,
 1 AS `villa`,
 1 AS `nombre`,
 1 AS `dni`,
 1 AS `telefono`,
 1 AS `id_estado`,
 1 AS `correo`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `propietario_principal`
--

DROP TABLE IF EXISTS `propietario_principal`;
/*!50001 DROP VIEW IF EXISTS `propietario_principal`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `propietario_principal` AS SELECT 
 1 AS `id_unir`,
 1 AS `id_propietario`,
 1 AS `id_villa`,
 1 AS `villa`,
 1 AS `cont_eeh`,
 1 AS `nombre`,
 1 AS `dni`,
 1 AS `telefono`,
 1 AS `telefono2`,
 1 AS `telefono3`,
 1 AS `correo`,
 1 AS `observacion`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `propietarios`
--

DROP TABLE IF EXISTS `propietarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `propietarios` (
  `id_propietario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `dni` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `correo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `id_estado` int DEFAULT NULL,
  `observacion` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `telefono` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `telefono2` varchar(250) DEFAULT NULL,
  `telefono3` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id_propietario`),
  KEY `FK_propietarios_estado_propietario` (`id_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propietarios`
--

LOCK TABLES `propietarios` WRITE;
/*!40000 ALTER TABLE `propietarios` DISABLE KEYS */;
INSERT INTO `propietarios` VALUES (34,'PEPITO','1515','tonyloquendo1@gmail.com','2025-01-20',1,'','51515','5115155','22222'),(35,'KNFNVFJNVJFVJFJ','5155151515','','2024-12-20',1,'','','','');
/*!40000 ALTER TABLE `propietarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propietarios_villas`
--

DROP TABLE IF EXISTS `propietarios_villas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `propietarios_villas` (
  `id_unir` int NOT NULL AUTO_INCREMENT,
  `id_propietario` int DEFAULT NULL,
  `id_villa` int DEFAULT NULL,
  PRIMARY KEY (`id_unir`),
  KEY `FK_propietarios_villas_propietarios` (`id_propietario`),
  KEY `FK_propietarios_villas_villas` (`id_villa`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propietarios_villas`
--

LOCK TABLES `propietarios_villas` WRITE;
/*!40000 ALTER TABLE `propietarios_villas` DISABLE KEYS */;
INSERT INTO `propietarios_villas` VALUES (22,34,27),(23,35,28);
/*!40000 ALTER TABLE `propietarios_villas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temporal`
--

DROP TABLE IF EXISTS `temporal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `temporal` (
  `clave_temp` varbinary(500) NOT NULL,
  PRIMARY KEY (`clave_temp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temporal`
--

LOCK TABLES `temporal` WRITE;
/*!40000 ALTER TABLE `temporal` DISABLE KEYS */;
/*!40000 ALTER TABLE `temporal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `tomar_desde_hasta`
--

DROP TABLE IF EXISTS `tomar_desde_hasta`;
/*!50001 DROP VIEW IF EXISTS `tomar_desde_hasta`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `tomar_desde_hasta` AS SELECT 
 1 AS `id_unir`,
 1 AS `villa`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `tomar_villa_vista`
--

DROP TABLE IF EXISTS `tomar_villa_vista`;
/*!50001 DROP VIEW IF EXISTS `tomar_villa_vista`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `tomar_villa_vista` AS SELECT 
 1 AS `id_unir`,
 1 AS `id_villa`,
 1 AS `id_grupo`,
 1 AS `numero`,
 1 AS `modelo`,
 1 AS `cont_eeh`,
 1 AS `habitaciones`,
 1 AS `banios`,
 1 AS `fecha_contruc`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `ultimas_villas`
--

DROP TABLE IF EXISTS `ultimas_villas`;
/*!50001 DROP VIEW IF EXISTS `ultimas_villas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ultimas_villas` AS SELECT 
 1 AS `id_villa`,
 1 AS `codigo`,
 1 AS `condicion`,
 1 AS `estado`,
 1 AS `modelo`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `apellido` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `dni` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `telefono` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `correo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_acceso` int DEFAULT NULL,
  `clave` varbinary(255) DEFAULT NULL,
  `id_estado` int DEFAULT NULL,
  `usuario` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `FK_usuarios_estado_usuario` (`id_estado`),
  KEY `FK_usuarios_permisos` (`id_acceso`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'ANTHONY','OLIVA','0101199903209','94856463','tonyloquendo1@gmail.com',1,_binary '\�\�\�\r\�ZF�\�ޫ_p\�v',1,'ANTHONY');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `ver_cuentas_pagadas`
--

DROP TABLE IF EXISTS `ver_cuentas_pagadas`;
/*!50001 DROP VIEW IF EXISTS `ver_cuentas_pagadas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ver_cuentas_pagadas` AS SELECT 
 1 AS `codigo_pago`,
 1 AS `concepto`,
 1 AS `fecha_pago`,
 1 AS `id_unir`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `ver_saldos`
--

DROP TABLE IF EXISTS `ver_saldos`;
/*!50001 DROP VIEW IF EXISTS `ver_saldos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ver_saldos` AS SELECT 
 1 AS `concepto`,
 1 AS `villa`,
 1 AS `nombre`,
 1 AS `costo_total`,
 1 AS `abono_total`,
 1 AS `saldo_total`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `villa_completo`
--

DROP TABLE IF EXISTS `villa_completo`;
/*!50001 DROP VIEW IF EXISTS `villa_completo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `villa_completo` AS SELECT 
 1 AS `id_villa`,
 1 AS `villas`,
 1 AS `cont_eeh`,
 1 AS `habitaciones`,
 1 AS `lote`,
 1 AS `condicion`,
 1 AS `estado`,
 1 AS `modelo`,
 1 AS `direccion`,
 1 AS `observacion`,
 1 AS `id_unir`,
 1 AS `nombre`,
 1 AS `dni`,
 1 AS `correo`,
 1 AS `telefono`,
 1 AS `telefono2`,
 1 AS `telefono3`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `villas`
--

DROP TABLE IF EXISTS `villas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `villas` (
  `id_villa` int NOT NULL AUTO_INCREMENT,
  `id_grupo` int DEFAULT NULL,
  `numero` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `cont_eeh` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `habitaciones` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `lote` varchar(50) DEFAULT NULL,
  `id_condicion` int DEFAULT NULL,
  `id_estado` int DEFAULT NULL,
  `direccion` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `observacion` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `modelo` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `banios` int DEFAULT NULL,
  `fecha_contruc` date DEFAULT NULL,
  PRIMARY KEY (`id_villa`),
  KEY `FK_villas_condicion_villas` (`id_condicion`),
  KEY `FK_villas_estado_villa` (`id_estado`),
  KEY `FK_villas_grupo_villa` (`id_grupo`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `villas`
--

LOCK TABLES `villas` WRITE;
/*!40000 ALTER TABLE `villas` DISABLE KEYS */;
INSERT INTO `villas` VALUES (1,1,'1','123456','2','250',1,2,'','','CORAL',NULL,NULL),(2,1,'3','25','25','0',1,2,' ',' ','CORAL',2,'2024-12-10'),(3,2,'5','7777777777','5','0',1,2,' ',' ','CAREY',3,'2024-12-10'),(4,2,'5','7777777777','5','0',1,2,' ',' ','CAREY',3,'2024-12-10'),(5,2,'4','74','2','0',1,2,' ',' ','CAREY',2,'2024-12-10'),(6,2,'4','74','2','0',1,2,' ',' ','CAREY',2,'2024-12-10'),(7,3,'5','123','7','0',1,2,' ',' ','CAREY',5,'2024-12-10'),(8,1,'12','856325','2','0',1,2,' ',' ','CORAL',2,'2024-12-11'),(9,3,'7','741852','2','0',1,2,' ',' ','CORAL',2,'2024-12-11'),(10,1,'7','789','2','0',1,2,' ',' ','CORAL',2,'2024-12-11'),(11,3,'5','147','2','0',1,2,' ',' ','CORAL',2,'2024-12-11'),(12,3,'2','2','2','0',1,2,' ',' ','CORAL',2,'2024-12-11'),(13,3,'12','12','5','0',1,2,' ',' ','CORAL',5,'2024-12-11'),(14,3,'4','15','25','0',1,2,' ',' ','CORAL',25,'2024-12-11'),(15,3,'1','258','2','0',1,2,' ',' ','CORAL',2,'2024-12-11'),(16,1,'15','852','2','0',1,2,' ',' ','ARRECIFE',2,'2024-12-15'),(17,3,'14','1555','125','0',1,2,' ',' ','CORAL',2,'2024-12-17'),(18,3,'20','15515151515','2','0',1,2,' ',' ','CORAL',2,'2024-12-18'),(19,3,'200','1515151','2','0',1,2,' ',' ','ARRECIFE',2,'2024-12-18'),(20,3,'2021','51515515','2','0',1,2,' ',' ','CAREY',2,'2024-12-18'),(21,3,'50','151515','55','0',1,2,' ',' ','CAREY',55,'2024-12-18'),(22,1,'22','151','2','0',1,2,' ',' ','CORAL',2,'2024-12-18'),(23,1,'22','151','2','0',1,2,' ',' ','CORAL',2,'2024-12-18'),(24,3,'7','252555','2','0',1,2,' ',' ','CORAL',2,'2024-12-18'),(25,3,'40','2525','2','0',1,2,' ',' ','CORAL',2,'2024-12-18'),(26,2,'5','12','2','0',1,2,' ',' ','CAREY',2,'2024-12-18'),(27,3,'1','15515151','1515','0',1,2,' ',' ','CORAL',2,'2024-12-18'),(28,1,'5','25','2','0',1,2,' ',' ','CORAL',2,'2024-12-20');
/*!40000 ALTER TABLE `villas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `villas_con_propietario`
--

DROP TABLE IF EXISTS `villas_con_propietario`;
/*!50001 DROP VIEW IF EXISTS `villas_con_propietario`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `villas_con_propietario` AS SELECT 
 1 AS `id_villa`,
 1 AS `villas`,
 1 AS `cont_eeh`,
 1 AS `habitaciones`,
 1 AS `lote`,
 1 AS `id_estado`,
 1 AS `id_propietario`,
 1 AS `id_unir`,
 1 AS `modelo`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_cuenta_vista`
--

DROP TABLE IF EXISTS `vista_cuenta_vista`;
/*!50001 DROP VIEW IF EXISTS `vista_cuenta_vista`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_cuenta_vista` AS SELECT 
 1 AS `id_cuenta`,
 1 AS `codigo`,
 1 AS `id_unir`,
 1 AS `costo`,
 1 AS `abono`,
 1 AS `desde`,
 1 AS `hasta`,
 1 AS `pagado`,
 1 AS `concepto_2`,
 1 AS `nombre`,
 1 AS `villa`,
 1 AS `concepto`,
 1 AS `id_concepto`,
 1 AS `con_descrip`,
 1 AS `con_pagado`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_usuario`
--

DROP TABLE IF EXISTS `vista_usuario`;
/*!50001 DROP VIEW IF EXISTS `vista_usuario`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_usuario` AS SELECT 
 1 AS `id_usuario`,
 1 AS `usuario`,
 1 AS `nombre`,
 1 AS `dni`,
 1 AS `telefono`,
 1 AS `correo`,
 1 AS `acceso`,
 1 AS `clave`,
 1 AS `estado`,
 1 AS `nom`,
 1 AS `ape`,
 1 AS `imprimir_reportes`,
 1 AS `modificar_reportes`,
 1 AS `eliminar_reportes`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'gestion_de_propietario'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `Rutina_cuentas` */;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `Rutina_cuentas` ON SCHEDULE EVERY 1 MONTH STARTS '2025-02-01 00:00:00' ON COMPLETION NOT PRESERVE ENABLE DO CALL `ejecutar_cuentas`() */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;

--
-- Dumping routines for database 'gestion_de_propietario'
--
/*!50003 DROP PROCEDURE IF EXISTS `ejecutar_cuentas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ejecutar_cuentas`()
BEGIN
DECLARE done INT DEFAULT 0;
    DECLARE nuevo_codigo INT;
    DECLARE nuevo_cuenta INT;
    DECLARE v_id_unir INT;
    DECLARE v_id_concepto INT;
    DECLARE v_id_concepto_2 INT;
    DECLARE v_valor DECIMAL(10,2);
    DECLARE v_dia INT;
    DECLARE v_saldo_total DECIMAL(10,2);
    DECLARE v_saldo_positivo DECIMAL(10,2);
    DECLARE fecha_desde DATE;
    DECLARE fecha_hasta DATE;

    -- Declaración del cursor
    DECLARE cursor_cuentas CURSOR FOR 
    SELECT id_unir, id_concepto, id_concepto_2, valor
    FROM cuenta_automatica
    WHERE habilitar = 'si';

    -- Manejo de fin del cursor
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    -- Obtener el día de generación desde la tabla confi_automatico
    SELECT dia_generar INTO v_dia FROM confi_automatico LIMIT 1;

    -- Abrir el cursor
    OPEN cursor_cuentas;

    -- Bucle para recorrer cada fila
    read_loop: LOOP
        FETCH cursor_cuentas INTO v_id_unir, v_id_concepto, v_id_concepto_2, v_valor;

        IF done THEN
            LEAVE read_loop;
        END IF;

        -- Calcular saldo total
        SELECT SUM(costo) - SUM(abono) AS total INTO v_saldo_total 
        FROM estado_cuenta 
        WHERE id_unir = v_id_unir AND id_concepto = v_id_concepto_2;

        -- Obtener el último código de la tabla cuentas
        SELECT COALESCE(MAX(codigo), 1000000) + 1 INTO nuevo_codigo
        FROM cuentas;

        -- Generar fechas
        SET fecha_desde = STR_TO_DATE(CONCAT(YEAR(CURDATE()), '-', MONTH(CURDATE()), '-', LPAD(v_dia, 2, '0')), '%Y-%m-%d');
        SET fecha_hasta = DATE_ADD(fecha_desde, INTERVAL 1 MONTH);

        -- Insertar en tabla cuentas según la condición
        IF v_saldo_total < 0 THEN

            INSERT INTO cuentas (
                id_unir, id_concepto, costo, abono, desde, hasta, pagado, codigo, id_concepto_2, con_pagado
            )
            VALUES (
                v_id_unir, v_id_concepto_2,v_valor,0, fecha_desde, fecha_hasta, 'Pagado', nuevo_codigo, v_id_concepto, 'completo'
            );

        -- Obtener último valor de cuenta e insertar en cuenta_estado
        SELECT id_cuenta INTO nuevo_cuenta
        FROM cuentas
        ORDER BY id_cuenta DESC
        LIMIT 1;

        INSERT INTO cuenta_estado(costo, abono, fecha_aplicada, id_cuenta) 
        VALUES (v_valor, 0, fecha_desde, nuevo_cuenta);


        ELSE

	            INSERT INTO cuentas (
                id_unir, id_concepto, costo, abono, desde, hasta, pagado, codigo, id_concepto_2, con_pagado
            )
            VALUES (
                v_id_unir, v_id_concepto_2, v_valor, 0, fecha_desde, fecha_hasta, 'No pagado', nuevo_codigo, v_id_concepto, 'falta'
            );

        -- Obtener último valor de cuenta e insertar en cuenta_estado
        SELECT id_cuenta INTO nuevo_cuenta
        FROM cuentas
        ORDER BY id_cuenta DESC
        LIMIT 1;

        INSERT INTO cuenta_estado(costo, abono, fecha_aplicada, id_cuenta) 
        VALUES (v_valor,0, fecha_desde, nuevo_cuenta);	

        END IF;


    END LOOP;

    -- Cerrar el cursor
    CLOSE cursor_cuentas;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Current Database: `gestion_de_propietario`
--

USE `gestion_de_propietario`;

--
-- Final view structure for view `adicionar_descripcion`
--

/*!50001 DROP VIEW IF EXISTS `adicionar_descripcion`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `adicionar_descripcion` AS select `adicion`.`id_adicion` AS `id_adicion`,`adicion`.`cuenta` AS `cuenta`,`adicion`.`fecha` AS `fecha`,`propietarios`.`nombre` AS `nombre`,`propietarios`.`dni` AS `dni`,`villa_completo`.`villas` AS `villas` from ((`adicion` join `propietarios` on((`adicion`.`id_propi` = `propietarios`.`id_propietario`))) join `villa_completo` on((`adicion`.`id_villa` = `villa_completo`.`id_villa`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `cod_villa`
--

/*!50001 DROP VIEW IF EXISTS `cod_villa`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `cod_villa` AS select concat(`grupo_villa`.`grupo`,'-',`villas`.`numero`) AS `villa` from (`villas` join `grupo_villa` on((`villas`.`id_grupo` = `grupo_villa`.`id_grupo`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `confi_concepto_vista`
--

/*!50001 DROP VIEW IF EXISTS `confi_concepto_vista`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `confi_concepto_vista` AS select `confi_automatico`.`dia_generar` AS `dia_generar`,`confi_automatico`.`id_concepto` AS `id_concepto`,`concepto`.`concepto` AS `concepto`,`confi_automatico`.`id_concepto_2` AS `id_concepto_2`,`concepto_1`.`concepto` AS `concepto_cargo`,`concepto_1`.`valor` AS `valor`,`confi_automatico`.`uso` AS `uso` from ((`concepto` join `confi_automatico` on((`concepto`.`id_concepto` = `confi_automatico`.`id_concepto`))) join `concepto` `concepto_1` on((`confi_automatico`.`id_concepto_2` = `concepto_1`.`id_concepto`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `cuenta_automa_vista`
--

/*!50001 DROP VIEW IF EXISTS `cuenta_automa_vista`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `cuenta_automa_vista` AS select `cuenta_automatica`.`id_ca` AS `id_ca`,`cuenta_automatica`.`id_unir` AS `id_unir`,`cuenta_automatica`.`id_concepto` AS `id_concepto`,`concepto`.`concepto` AS `concepto`,`cuenta_automatica`.`id_concepto_2` AS `id_concepto_2`,`concepto_1`.`concepto` AS `concepto_2`,`cuenta_automatica`.`valor` AS `valor`,`cuenta_automatica`.`fecha_generar` AS `fecha_generar`,`cuenta_automatica`.`habilitar` AS `habilitar` from ((`concepto` join `cuenta_automatica` on((`concepto`.`id_concepto` = `cuenta_automatica`.`id_concepto`))) join `concepto` `concepto_1` on((`cuenta_automatica`.`id_concepto_2` = `concepto_1`.`id_concepto`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `cuenta_vista`
--

/*!50001 DROP VIEW IF EXISTS `cuenta_vista`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `cuenta_vista` AS select `cuentas`.`id_cuenta` AS `id_cuenta`,`cuentas`.`codigo` AS `codigo`,`propietarios_villas`.`id_unir` AS `id_unir`,`cuentas`.`costo` AS `costo`,`cuentas`.`abono` AS `abono`,`cuentas`.`desde` AS `desde`,`cuentas`.`hasta` AS `hasta`,`cuentas`.`pagado` AS `pagado`,`concepto_1`.`concepto` AS `concepto_2`,`propietarios`.`nombre` AS `nombre`,concat(`grupo_villa`.`grupo`,'-',`villas`.`numero`) AS `villa`,`concepto`.`concepto` AS `concepto`,`concepto`.`id_concepto` AS `id_concepto`,`concepto_1`.`id_concepto` AS `con_descrip`,`cuentas`.`con_pagado` AS `con_pagado` from ((((((`cuentas` join `propietarios_villas` on((`cuentas`.`id_unir` = `propietarios_villas`.`id_unir`))) join `concepto` on((`cuentas`.`id_concepto` = `concepto`.`id_concepto`))) join `concepto` `concepto_1` on((`cuentas`.`id_concepto_2` = `concepto_1`.`id_concepto`))) join `villas` on((`propietarios_villas`.`id_villa` = `villas`.`id_villa`))) join `propietarios` on((`propietarios_villas`.`id_propietario` = `propietarios`.`id_propietario`))) join `grupo_villa` on((`villas`.`id_grupo` = `grupo_villa`.`id_grupo`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `descripcion_donador`
--

/*!50001 DROP VIEW IF EXISTS `descripcion_donador`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `descripcion_donador` AS select `cambio`.`id_cambio` AS `id_cambio`,`propietarios`.`id_propietario` AS `id_propietario`,`cambio`.`cuenta` AS `cuentas`,`propietarios`.`nombre` AS `nombre`,`propietarios`.`dni` AS `dni`,`propietarios_1`.`id_propietario` AS `id_pro_2`,`propietarios_1`.`nombre` AS `nombre_2`,`propietarios_1`.`dni` AS `dni_2`,`villa_completo`.`villas` AS `villas`,`cambio`.`fecha` AS `fecha` from (((`cambio` join `villa_completo` on((`cambio`.`id_villa` = `villa_completo`.`id_villa`))) join `propietarios` on((`cambio`.`id_donante` = `propietarios`.`id_propietario`))) join `propietarios` `propietarios_1` on((`cambio`.`id_recibie` = `propietarios_1`.`id_propietario`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `donar_recibir_villa`
--

/*!50001 DROP VIEW IF EXISTS `donar_recibir_villa`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `donar_recibir_villa` AS select `propietarios_villas`.`id_propietario` AS `id_propietario`,`villas`.`id_villa` AS `id_villa`,concat(`grupo_villa`.`grupo`,'-',`villas`.`numero`) AS `villas`,`villas`.`cont_eeh` AS `cont_eeh`,`villas`.`habitaciones` AS `habitaciones`,`villas`.`id_condicion` AS `condicion`,`villas`.`modelo` AS `modelo` from ((`propietarios_villas` join `villas` on((`propietarios_villas`.`id_villa` = `villas`.`id_villa`))) join `grupo_villa` on((`villas`.`id_grupo` = `grupo_villa`.`id_grupo`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `estado_cuenta`
--

/*!50001 DROP VIEW IF EXISTS `estado_cuenta`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `estado_cuenta` AS select `cuenta_estado`.`id_estado_cuenta` AS `id_estado_cuenta`,`cuenta_estado`.`costo` AS `costo`,`cuenta_estado`.`abono` AS `abono`,`cuenta_estado`.`fecha_aplicada` AS `fecha_aplicada`,`cuentas`.`id_unir` AS `id_unir`,`cuentas`.`codigo` AS `codigo`,`cuentas`.`id_concepto` AS `id_concepto`,`cuentas`.`pagado` AS `con_pagado`,`concepto_1`.`concepto` AS `concepto`,`concepto`.`concepto` AS `concepto_2`,`propietarios`.`nombre` AS `nombre`,concat(`grupo_villa`.`grupo`,'-',`villas`.`numero`) AS `villa` from (((((((`cuenta_estado` join `cuentas` on((`cuenta_estado`.`id_cuenta` = `cuentas`.`id_cuenta`))) join `concepto` `concepto_1` on((`cuentas`.`id_concepto` = `concepto_1`.`id_concepto`))) join `concepto` on((`cuentas`.`id_concepto_2` = `concepto`.`id_concepto`))) join `propietarios_villas` on((`cuentas`.`id_unir` = `propietarios_villas`.`id_unir`))) join `villas` on((`propietarios_villas`.`id_villa` = `villas`.`id_villa`))) join `grupo_villa` on((`villas`.`id_grupo` = `grupo_villa`.`id_grupo`))) join `propietarios` on((`propietarios_villas`.`id_propietario` = `propietarios`.`id_propietario`))) where (`cuentas`.`pagado` <> 'abonado') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `factura_completa_reimprimir`
--

/*!50001 DROP VIEW IF EXISTS `factura_completa_reimprimir`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `factura_completa_reimprimir` AS select `multi_pago`.`codigo_pago` AS `codigo_pago`,`concepto`.`concepto` AS `concepto`,`multi_pago`.`fecha_pago` AS `fecha_pago`,`multi_pago`.`id_unir` AS `id_unir`,`cuentas`.`desde` AS `desde`,`cuentas`.`hasta` AS `hasta`,`cuentas`.`codigo` AS `codigo`,`cuentas`.`costo` AS `costo`,`cuentas`.`abono` AS `abono`,`multi_pago`.`tipo_pago` AS `tipo_pago`,`multi_pago`.`forma_pago` AS `forma_pago`,`multi_pago`.`n_referencia` AS `n_referencia`,`multi_pago`.`cantidad_recibida` AS `cantidad_recibida`,`concepto_1`.`concepto` AS `abono_con` from (((`concepto` join `cuentas` on((`concepto`.`id_concepto` = `cuentas`.`id_concepto`))) join `multi_pago` on((`cuentas`.`id_cuenta` = `multi_pago`.`id_cuenta`))) join `concepto` `concepto_1` on((`cuentas`.`id_concepto_2` = `concepto_1`.`id_concepto`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `pripietario_cuenta_vista`
--

/*!50001 DROP VIEW IF EXISTS `pripietario_cuenta_vista`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `pripietario_cuenta_vista` AS select `propietarios_villas`.`id_unir` AS `id_unir`,concat(`grupo_villa`.`grupo`,'-',`villas`.`numero`) AS `villa`,`propietarios`.`nombre` AS `nombre`,`propietarios`.`dni` AS `dni`,`propietarios`.`telefono` AS `telefono`,`propietarios`.`id_estado` AS `id_estado`,`propietarios`.`correo` AS `correo` from (((`propietarios_villas` join `propietarios` on((`propietarios_villas`.`id_propietario` = `propietarios`.`id_propietario`))) join `villas` on((`propietarios_villas`.`id_villa` = `villas`.`id_villa`))) join `grupo_villa` on((`villas`.`id_grupo` = `grupo_villa`.`id_grupo`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `propietario_principal`
--

/*!50001 DROP VIEW IF EXISTS `propietario_principal`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `propietario_principal` AS select `propietarios_villas`.`id_unir` AS `id_unir`,`propietarios_villas`.`id_propietario` AS `id_propietario`,`propietarios_villas`.`id_villa` AS `id_villa`,concat(`grupo_villa`.`grupo`,'-',`villas`.`numero`) AS `villa`,`villas`.`cont_eeh` AS `cont_eeh`,`propietarios`.`nombre` AS `nombre`,`propietarios`.`dni` AS `dni`,`propietarios`.`telefono` AS `telefono`,`propietarios`.`telefono2` AS `telefono2`,`propietarios`.`telefono3` AS `telefono3`,`propietarios`.`correo` AS `correo`,`propietarios`.`observacion` AS `observacion` from (((`propietarios_villas` join `propietarios` on((`propietarios_villas`.`id_propietario` = `propietarios`.`id_propietario`))) join `villas` on((`propietarios_villas`.`id_villa` = `villas`.`id_villa`))) join `grupo_villa` on((`villas`.`id_grupo` = `grupo_villa`.`id_grupo`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `tomar_desde_hasta`
--

/*!50001 DROP VIEW IF EXISTS `tomar_desde_hasta`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `tomar_desde_hasta` AS select `pripietario_cuenta_vista`.`id_unir` AS `id_unir`,`pripietario_cuenta_vista`.`villa` AS `villa` from `pripietario_cuenta_vista` order by substring_index(`pripietario_cuenta_vista`.`villa`,'-',1),cast(substring_index(`pripietario_cuenta_vista`.`villa`,'-',-(1)) as unsigned) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `tomar_villa_vista`
--

/*!50001 DROP VIEW IF EXISTS `tomar_villa_vista`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `tomar_villa_vista` AS select `propietarios_villas`.`id_unir` AS `id_unir`,`propietarios_villas`.`id_villa` AS `id_villa`,`villas`.`id_grupo` AS `id_grupo`,`villas`.`numero` AS `numero`,`villas`.`modelo` AS `modelo`,`villas`.`cont_eeh` AS `cont_eeh`,`villas`.`habitaciones` AS `habitaciones`,`villas`.`banios` AS `banios`,`villas`.`fecha_contruc` AS `fecha_contruc` from (`propietarios_villas` join `villas` on((`propietarios_villas`.`id_villa` = `villas`.`id_villa`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ultimas_villas`
--

/*!50001 DROP VIEW IF EXISTS `ultimas_villas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ultimas_villas` AS select `villas`.`id_villa` AS `id_villa`,concat(`grupo_villa`.`grupo`,'-',`villas`.`numero`) AS `codigo`,`villas`.`id_condicion` AS `condicion`,`villas`.`id_estado` AS `estado`,`villas`.`modelo` AS `modelo` from (`villas` join `grupo_villa` on((`villas`.`id_grupo` = `grupo_villa`.`id_grupo`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ver_cuentas_pagadas`
--

/*!50001 DROP VIEW IF EXISTS `ver_cuentas_pagadas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ver_cuentas_pagadas` AS select `multi_pago`.`codigo_pago` AS `codigo_pago`,`concepto`.`concepto` AS `concepto`,`multi_pago`.`fecha_pago` AS `fecha_pago`,`multi_pago`.`id_unir` AS `id_unir` from ((`concepto` join `cuentas` on((`concepto`.`id_concepto` = `cuentas`.`id_concepto`))) join `multi_pago` on((`cuentas`.`id_cuenta` = `multi_pago`.`id_cuenta`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ver_saldos`
--

/*!50001 DROP VIEW IF EXISTS `ver_saldos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ver_saldos` AS select `cuenta_vista`.`concepto` AS `concepto`,`cuenta_vista`.`villa` AS `villa`,`cuenta_vista`.`nombre` AS `nombre`,sum(`cuenta_vista`.`costo`) AS `costo_total`,sum(`cuenta_vista`.`abono`) AS `abono_total`,sum((`cuenta_vista`.`costo` - `cuenta_vista`.`abono`)) AS `saldo_total` from `cuenta_vista` group by `cuenta_vista`.`concepto`,`cuenta_vista`.`villa`,`cuenta_vista`.`nombre` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `villa_completo`
--

/*!50001 DROP VIEW IF EXISTS `villa_completo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `villa_completo` AS select `villas`.`id_villa` AS `id_villa`,concat(`grupo_villa`.`grupo`,'-',`villas`.`numero`) AS `villas`,`villas`.`cont_eeh` AS `cont_eeh`,`villas`.`habitaciones` AS `habitaciones`,`villas`.`lote` AS `lote`,`villas`.`id_condicion` AS `condicion`,`villas`.`id_estado` AS `estado`,`villas`.`modelo` AS `modelo`,`villas`.`direccion` AS `direccion`,`villas`.`observacion` AS `observacion`,`propietarios_villas`.`id_unir` AS `id_unir`,`propietarios`.`nombre` AS `nombre`,`propietarios`.`dni` AS `dni`,`propietarios`.`correo` AS `correo`,`propietarios`.`telefono` AS `telefono`,`propietarios`.`telefono2` AS `telefono2`,`propietarios`.`telefono3` AS `telefono3` from (((`villas` join `grupo_villa` on((`villas`.`id_grupo` = `grupo_villa`.`id_grupo`))) join `propietarios_villas` on((`villas`.`id_villa` = `propietarios_villas`.`id_villa`))) join `propietarios` on((`propietarios_villas`.`id_propietario` = `propietarios`.`id_propietario`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `villas_con_propietario`
--

/*!50001 DROP VIEW IF EXISTS `villas_con_propietario`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `villas_con_propietario` AS select `villas`.`id_villa` AS `id_villa`,concat(`grupo_villa`.`grupo`,'-',`villas`.`numero`) AS `villas`,`villas`.`cont_eeh` AS `cont_eeh`,`villas`.`habitaciones` AS `habitaciones`,`villas`.`lote` AS `lote`,`villas`.`id_estado` AS `id_estado`,`propietarios_villas`.`id_propietario` AS `id_propietario`,`propietarios_villas`.`id_unir` AS `id_unir`,`villas`.`modelo` AS `modelo` from ((`villas` join `grupo_villa` on((`villas`.`id_grupo` = `grupo_villa`.`id_grupo`))) join `propietarios_villas` on((`villas`.`id_villa` = `propietarios_villas`.`id_villa`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_cuenta_vista`
--

/*!50001 DROP VIEW IF EXISTS `vista_cuenta_vista`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_cuenta_vista` (`id_cuenta`,`codigo`,`id_unir`,`costo`,`abono`,`desde`,`hasta`,`pagado`,`concepto_2`,`nombre`,`villa`,`concepto`,`id_concepto`,`con_descrip`,`con_pagado`) AS select `cuentas`.`id_cuenta` AS `id_cuenta`,`cuentas`.`codigo` AS `codigo`,`propietarios_villas`.`id_unir` AS `id_unir`,`cuentas`.`costo` AS `costo`,`cuentas`.`abono` AS `abono`,`cuentas`.`desde` AS `desde`,`cuentas`.`hasta` AS `hasta`,`cuentas`.`pagado` AS `pagado`,`concepto_1`.`concepto` AS `concepto_2`,`propietarios`.`nombre` AS `nombre`,((`grupo_villa`.`grupo` + '-') + `villas`.`numero`) AS `villa`,`concepto`.`concepto` AS `concepto`,`concepto`.`id_concepto` AS `id_concepto`,`concepto_1`.`id_concepto` AS `con_descrip`,`cuentas`.`con_pagado` AS `con_pagado` from ((((((`cuentas` join `propietarios_villas` on((`cuentas`.`id_unir` = `propietarios_villas`.`id_unir`))) join `concepto` on((`cuentas`.`id_concepto` = `concepto`.`id_concepto`))) join `concepto` `concepto_1` on((`cuentas`.`id_concepto_2` = `concepto_1`.`id_concepto`))) join `villas` on((`propietarios_villas`.`id_villa` = `villas`.`id_villa`))) join `propietarios` on((`propietarios_villas`.`id_propietario` = `propietarios`.`id_propietario`))) join `grupo_villa` on((`villas`.`id_grupo` = `grupo_villa`.`id_grupo`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_usuario`
--

/*!50001 DROP VIEW IF EXISTS `vista_usuario`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_usuario` AS select `usuarios`.`id_usuario` AS `id_usuario`,`usuarios`.`usuario` AS `usuario`,concat(`usuarios`.`nombre`,' ',`usuarios`.`apellido`) AS `nombre`,`usuarios`.`dni` AS `dni`,`usuarios`.`telefono` AS `telefono`,`usuarios`.`correo` AS `correo`,if((`usuarios`.`id_acceso` = 1),'Administrador','Usuario') AS `acceso`,`usuarios`.`clave` AS `clave`,`usuarios`.`id_estado` AS `estado`,`usuarios`.`nombre` AS `nom`,`usuarios`.`apellido` AS `ape`,`acceso_usuario`.`imprimir_reportes` AS `imprimir_reportes`,`acceso_usuario`.`modificar_reportes` AS `modificar_reportes`,`acceso_usuario`.`eliminar_reportes` AS `eliminar_reportes` from (`acceso_usuario` join `usuarios` on((`acceso_usuario`.`id_usuario` = `usuarios`.`id_usuario`))) */;
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

-- Dump completed on 2025-01-20  1:20:06
