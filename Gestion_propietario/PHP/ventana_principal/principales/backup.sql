SET FOREIGN_KEY_CHECKS = 0;
DROP DATABASE IF EXISTS `gestion_de_propietario`;
CREATE DATABASE `gestion_de_propietario`;
USE `gestion_de_propietario`;
CREATE TABLE `acceso_usuario` (
  `id_acceso_usuario` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `imprimir_reportes` varchar(2) NOT NULL,
  `modificar_reportes` varchar(2) NOT NULL,
  `eliminar_reportes` varchar(2) NOT NULL,
  PRIMARY KEY (`id_acceso_usuario`),
  KEY `FK_usuario_acceso` (`id_usuario`),
  CONSTRAINT `FK_usuario_acceso` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `acceso_usuario` VALUES ('9', '2', 'si', 'si', 'si');
INSERT INTO `acceso_usuario` VALUES ('16', '19', 'si', 'si', 'si');

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

CREATE TABLE `caracteristicas` (
  `id_caracteristica` int NOT NULL AUTO_INCREMENT,
  `id_villa` int DEFAULT NULL,
  `caracteristica` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id_caracteristica`),
  KEY `FK_caracteristicas_villas` (`id_villa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `concepto` (
  `id_concepto` int NOT NULL AUTO_INCREMENT,
  `concepto` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `tipo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `valor` double DEFAULT NULL,
  `referencia` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_estado` int DEFAULT NULL,
  PRIMARY KEY (`id_concepto`),
  KEY `FK_concepto_estado_concepto` (`id_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `concepto` VALUES ('1', 'AGUA', 'Abono', '200', 'No', '1');
INSERT INTO `concepto` VALUES ('2', 'PAGO MENSUAL', 'Cargo', '0', 'Si', '1');
INSERT INTO `concepto` VALUES ('3', 'PAGO UNICO', 'Cargo', '0', 'Si', '2');
INSERT INTO `concepto` VALUES ('4', 'PAGO UNICO', 'Cargo', '0', 'Si', '2');
INSERT INTO `concepto` VALUES ('5', 'MANTENIIENTO', 'Abono', '500', 'No', '1');
INSERT INTO `concepto` VALUES ('6', 'PAGO UNICO', 'Cargo', '0', 'Si', '1');

CREATE TABLE `condicion_villas` (
  `id_condicion` int NOT NULL AUTO_INCREMENT,
  `condicion` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id_condicion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `conexion_whatsaap` (
  `sid` varbinary(600) DEFAULT NULL,
  `token` varbinary(600) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `contactos_propietario` (
  `id_contacto` int NOT NULL AUTO_INCREMENT,
  `id_propietario` int DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `numero` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_contacto`),
  KEY `FK_id_propietario` (`id_propietario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `cuenta_estado` (
  `id_estado_cuenta` int NOT NULL AUTO_INCREMENT,
  `costo` float DEFAULT NULL,
  `abono` float DEFAULT NULL,
  `fecha_aplicada` date DEFAULT NULL,
  `id_cuenta` int DEFAULT NULL,
  PRIMARY KEY (`id_estado_cuenta`),
  KEY `FK_id_cuenta` (`id_cuenta`),
  CONSTRAINT `FK_id_cuenta` FOREIGN KEY (`id_cuenta`) REFERENCES `cuentas` (`id_cuenta`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `cuenta_estado` VALUES ('30', '500', '0', '2024-10-17', '40');
INSERT INTO `cuenta_estado` VALUES ('31', '500', '0', '2024-10-17', '41');
INSERT INTO `cuenta_estado` VALUES ('32', '0', '500', '2024-10-17', '40');
INSERT INTO `cuenta_estado` VALUES ('33', '200', '0', '2024-10-17', '42');
INSERT INTO `cuenta_estado` VALUES ('34', '200', '0', '2024-10-17', '43');
INSERT INTO `cuenta_estado` VALUES ('35', '0', '100', '2024-10-17', '41');
INSERT INTO `cuenta_estado` VALUES ('36', '0', '400', '2024-10-17', '41');
INSERT INTO `cuenta_estado` VALUES ('37', '500', '0', '2024-10-18', '44');
INSERT INTO `cuenta_estado` VALUES ('38', '0', '500', '2024-10-18', '34');
INSERT INTO `cuenta_estado` VALUES ('39', '900', '0', '2024-10-18', '45');
INSERT INTO `cuenta_estado` VALUES ('40', '0', '900', '2024-10-18', '45');
INSERT INTO `cuenta_estado` VALUES ('41', '0', '100', '2024-10-18', '44');
INSERT INTO `cuenta_estado` VALUES ('42', '1000', '0', '2024-10-18', '46');
INSERT INTO `cuenta_estado` VALUES ('43', '0', '700', '2024-10-18', '46');
INSERT INTO `cuenta_estado` VALUES ('44', '500', '0', '2024-10-18', '47');
INSERT INTO `cuenta_estado` VALUES ('45', '0', '200', '2024-10-25', '20');
INSERT INTO `cuenta_estado` VALUES ('46', '200', '0', '2024-10-25', '48');
INSERT INTO `cuenta_estado` VALUES ('47', '0', '200', '2024-10-25', '48');
INSERT INTO `cuenta_estado` VALUES ('48', '0', '200', '2024-10-25', '21');
INSERT INTO `cuenta_estado` VALUES ('49', '0', '0', '2024-10-25', '21');
INSERT INTO `cuenta_estado` VALUES ('50', '0', '200', '2024-10-25', '25');
INSERT INTO `cuenta_estado` VALUES ('51', '0', '500', '2024-10-25', '22');
INSERT INTO `cuenta_estado` VALUES ('52', '0', '500', '2024-10-25', '23');
INSERT INTO `cuenta_estado` VALUES ('53', '0', '100', '2024-10-25', '27');
INSERT INTO `cuenta_estado` VALUES ('54', '0', '50', '2024-10-25', '27');
INSERT INTO `cuenta_estado` VALUES ('55', '0', '100', '2024-10-25', '46');
INSERT INTO `cuenta_estado` VALUES ('56', '0', '50', '2024-10-25', '27');
INSERT INTO `cuenta_estado` VALUES ('57', '0', '100', '2024-10-25', '32');
INSERT INTO `cuenta_estado` VALUES ('58', '0', '100', '2024-10-25', '32');
INSERT INTO `cuenta_estado` VALUES ('59', '0', '200', '2024-10-25', '36');
INSERT INTO `cuenta_estado` VALUES ('60', '0', '100', '2024-10-25', '44');
INSERT INTO `cuenta_estado` VALUES ('61', '0', '100', '2024-10-25', '44');
INSERT INTO `cuenta_estado` VALUES ('62', '0', '200', '2024-10-26', '42');
INSERT INTO `cuenta_estado` VALUES ('63', '0', '100', '2024-10-26', '44');
INSERT INTO `cuenta_estado` VALUES ('64', '0', '100', '2024-10-26', '46');
INSERT INTO `cuenta_estado` VALUES ('65', '0', '50', '2024-10-26', '44');
INSERT INTO `cuenta_estado` VALUES ('66', '0', '50', '2024-10-26', '44');
INSERT INTO `cuenta_estado` VALUES ('67', '0', '10', '2024-10-26', '46');
INSERT INTO `cuenta_estado` VALUES ('68', '0', '10', '2024-10-26', '46');
INSERT INTO `cuenta_estado` VALUES ('69', '0', '100', '2024-10-26', '47');
INSERT INTO `cuenta_estado` VALUES ('70', '0', '100', '2024-10-26', '47');
INSERT INTO `cuenta_estado` VALUES ('71', '500', '0', '2024-10-26', '49');
INSERT INTO `cuenta_estado` VALUES ('72', '0', '200', '2024-10-26', '49');
INSERT INTO `cuenta_estado` VALUES ('73', '0', '100', '2024-10-26', '49');
INSERT INTO `cuenta_estado` VALUES ('74', '200', '0', '2024-10-26', '50');
INSERT INTO `cuenta_estado` VALUES ('75', '0', '200', '2024-10-26', '50');
INSERT INTO `cuenta_estado` VALUES ('76', '500', '0', '2024-10-26', '51');
INSERT INTO `cuenta_estado` VALUES ('77', '0', '500', '2024-10-26', '51');
INSERT INTO `cuenta_estado` VALUES ('78', '200', '0', '2024-10-26', '52');
INSERT INTO `cuenta_estado` VALUES ('79', '0', '200', '2024-10-26', '52');
INSERT INTO `cuenta_estado` VALUES ('80', '200', '0', '2024-10-26', '53');
INSERT INTO `cuenta_estado` VALUES ('81', '0', '50', '2024-10-26', '49');
INSERT INTO `cuenta_estado` VALUES ('82', '0', '50', '2024-10-26', '49');
INSERT INTO `cuenta_estado` VALUES ('83', '0', '10', '2024-10-26', '49');
INSERT INTO `cuenta_estado` VALUES ('84', '0', '10', '2024-10-26', '49');
INSERT INTO `cuenta_estado` VALUES ('85', '0', '10', '2024-10-26', '49');
INSERT INTO `cuenta_estado` VALUES ('86', '0', '10', '2024-10-26', '49');
INSERT INTO `cuenta_estado` VALUES ('87', '0', '10', '2024-10-26', '49');
INSERT INTO `cuenta_estado` VALUES ('88', '0', '10', '2024-10-26', '49');
INSERT INTO `cuenta_estado` VALUES ('89', '0', '10', '2024-10-26', '49');
INSERT INTO `cuenta_estado` VALUES ('90', '0', '10', '2024-10-27', '49');
INSERT INTO `cuenta_estado` VALUES ('91', '200', '0', '2024-10-29', '54');
INSERT INTO `cuenta_estado` VALUES ('92', '500', '0', '2024-10-29', '55');
INSERT INTO `cuenta_estado` VALUES ('93', '200', '0', '2024-10-29', '56');
INSERT INTO `cuenta_estado` VALUES ('94', '0', '100', '2024-11-05', '54');
INSERT INTO `cuenta_estado` VALUES ('95', '0', '1', '2024-11-08', '49');
INSERT INTO `cuenta_estado` VALUES ('96', '0', '1', '2024-11-08', '49');
INSERT INTO `cuenta_estado` VALUES ('97', '0', '1', '2024-11-08', '49');
INSERT INTO `cuenta_estado` VALUES ('98', '0', '100', '2024-11-14', '54');
INSERT INTO `cuenta_estado` VALUES ('99', '0', '100', '2024-11-14', '55');

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
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `cuentas` VALUES ('1', '1', '1', '0', '2000', '2024-09-24', '2024-09-24', 'Pagado', '1000000', '2', 'completo');
INSERT INTO `cuentas` VALUES ('2', '2', '1', '0', '200', '2024-10-07', '2024-10-07', 'Pagado', '1000001', '6', 'completo');
INSERT INTO `cuentas` VALUES ('3', '2', '1', '0', '500', '2024-10-07', '2024-10-07', 'Pagado', '1000002', '2', 'completo');
INSERT INTO `cuentas` VALUES ('4', '3', '1', '0', '160', '2024-10-07', '2024-10-07', 'Pagado', '1000003', '2', 'completo');
INSERT INTO `cuentas` VALUES ('5', '3', '1', '0', '160', '2024-10-07', '2024-10-07', 'Pagado', '1000004', '2', 'completo');
INSERT INTO `cuentas` VALUES ('6', '3', '5', '0', '1082.36', '2024-10-07', '2024-10-07', 'Pagado', '1000005', '6', 'completo');
INSERT INTO `cuentas` VALUES ('7', '3', '5', '0', '160', '2024-10-07', '2024-10-07', 'Pagado', '1000006', '6', 'completo');
INSERT INTO `cuentas` VALUES ('8', '2', '1', '0', '500', '2024-10-14', '2024-10-14', 'Pagado', '1000007', '6', 'completo');
INSERT INTO `cuentas` VALUES ('9', '3', '5', '0', '500', '2024-10-14', '2024-10-14', 'Pagado', '1000008', '6', 'completo');
INSERT INTO `cuentas` VALUES ('10', '3', '5', '0', '200', '2024-10-14', '2024-10-14', 'Pagado', '1000009', '2', 'completo');
INSERT INTO `cuentas` VALUES ('11', '3', '5', '0', '500', '2024-10-14', '2024-10-14', 'Pagado', '1000010', '6', 'completo');
INSERT INTO `cuentas` VALUES ('12', '2', '5', '0', '500', '2024-10-14', '2024-10-14', 'Pagado', '1000011', '6', 'completo');
INSERT INTO `cuentas` VALUES ('13', '3', '5', '0', '500', '2024-10-14', '2024-10-14', 'Pagado', '1000012', '2', 'completo');
INSERT INTO `cuentas` VALUES ('14', '3', '1', '0', '200', '2024-10-14', '2024-10-14', 'Pagado', '1000013', '6', 'completo');
INSERT INTO `cuentas` VALUES ('15', '3', '1', '0', '200', '2024-10-14', '2024-10-14', 'Pagado', '1000014', '6', 'completo');
INSERT INTO `cuentas` VALUES ('16', '2', '1', '0', '200', '2024-10-14', '2024-10-14', 'Pagado', '1000015', '2', 'completo');
INSERT INTO `cuentas` VALUES ('17', '2', '5', '0', '500', '2024-10-15', '2024-10-15', 'Pagado', '1000016', '6', 'completo');
INSERT INTO `cuentas` VALUES ('18', '3', '5', '0', '500', '2024-10-17', '2024-10-17', 'Pagado', '1000017', '2', 'completo');
INSERT INTO `cuentas` VALUES ('19', '3', '5', '0', '500', '2024-10-17', '2024-10-17', 'Pagado', '1000018', '6', 'completo');
INSERT INTO `cuentas` VALUES ('20', '2', '1', '0', '200', '2024-10-17', '2024-10-17', 'Pagado', '1000019', '2', 'completo');
INSERT INTO `cuentas` VALUES ('21', '2', '1', '0', '200', '2024-10-17', '2024-10-17', 'Pagado', '1000020', '2', 'completo');
INSERT INTO `cuentas` VALUES ('22', '2', '5', '0', '500', '2024-10-17', '2024-10-17', 'Pagado', '1000021', '6', 'completo');
INSERT INTO `cuentas` VALUES ('23', '2', '5', '0', '500', '2024-10-17', '2024-10-17', 'Pagado', '1000022', '2', 'completo');
INSERT INTO `cuentas` VALUES ('24', '3', '5', '500', '0', '2024-10-17', '2024-10-17', 'No pagado', '1000023', '2', 'falta');
INSERT INTO `cuentas` VALUES ('25', '2', '1', '0', '200', '2024-10-17', '2024-10-17', 'Pagado', '1000024', '6', 'completo');
INSERT INTO `cuentas` VALUES ('26', '3', '1', '200', '0', '2024-10-17', '2024-10-17', 'No pagado', '1000025', '6', 'falta');
INSERT INTO `cuentas` VALUES ('27', '2', '1', '0', '200', '2024-10-17', '2024-10-17', 'Pagado', '1000026', '6', 'completo');
INSERT INTO `cuentas` VALUES ('28', '3', '1', '200', '0', '2024-10-17', '2024-10-17', 'No pagado', '1000027', '6', 'falta');
INSERT INTO `cuentas` VALUES ('29', '3', '1', '200', '0', '2024-10-17', '2024-10-17', 'No pagado', '1000028', '6', 'falta');
INSERT INTO `cuentas` VALUES ('30', '3', '1', '200', '0', '2024-10-17', '2024-10-17', 'No pagado', '1000029', '2', 'falta');
INSERT INTO `cuentas` VALUES ('31', '3', '1', '200', '0', '2024-10-17', '2024-10-17', 'No pagado', '1000030', '2', 'falta');
INSERT INTO `cuentas` VALUES ('32', '2', '1', '0', '200', '2024-10-17', '2024-10-17', 'Pagado', '1000031', '2', 'completo');
INSERT INTO `cuentas` VALUES ('33', '3', '1', '200', '0', '2024-10-17', '2024-10-17', 'No pagado', '1000032', '2', 'falta');
INSERT INTO `cuentas` VALUES ('34', '2', '5', '0', '500', '2024-10-17', '2024-10-17', 'Pagado', '1000033', '6', 'completo');
INSERT INTO `cuentas` VALUES ('35', '3', '5', '500', '0', '2024-10-17', '2024-10-17', 'No pagado', '1000034', '6', 'falta');
INSERT INTO `cuentas` VALUES ('36', '2', '1', '0', '200', '2024-10-17', '2024-10-17', 'Pagado', '1000035', '2', 'completo');
INSERT INTO `cuentas` VALUES ('37', '3', '1', '200', '0', '2024-10-17', '2024-10-17', 'No pagado', '1000036', '6', 'falta');
INSERT INTO `cuentas` VALUES ('38', '2', '1', '0', '200', '2024-10-17', '2024-10-17', 'Pagado', '1000037', '2', 'completo');
INSERT INTO `cuentas` VALUES ('39', '3', '1', '200', '0', '2024-10-17', '2024-10-17', 'No pagado', '1000038', '2', 'falta');
INSERT INTO `cuentas` VALUES ('40', '2', '5', '0', '500', '2024-10-17', '2024-10-17', 'Pagado', '1000039', '2', 'completo');
INSERT INTO `cuentas` VALUES ('41', '3', '5', '0', '500', '2024-10-17', '2024-10-17', 'Pagado', '1000040', '2', 'completo');
INSERT INTO `cuentas` VALUES ('42', '2', '1', '0', '200', '2024-10-17', '2024-10-17', 'Pagado', '1000041', '6', 'completo');
INSERT INTO `cuentas` VALUES ('43', '3', '1', '200', '0', '2024-10-17', '2024-10-17', 'No pagado', '1000042', '6', 'falta');
INSERT INTO `cuentas` VALUES ('44', '2', '1', '0', '500', '2024-10-18', '2024-10-18', 'Pagado', '1000043', '6', 'completo');
INSERT INTO `cuentas` VALUES ('45', '2', '1', '0', '900', '2024-10-18', '2024-10-18', 'Pagado', '1000044', '2', 'completo');
INSERT INTO `cuentas` VALUES ('46', '4', '1', '80', '920', '2024-10-18', '2024-10-18', 'Pendiente', '1000045', '2', 'falta');
INSERT INTO `cuentas` VALUES ('47', '4', '5', '300', '200', '2024-10-18', '2024-10-18', 'Pendiente', '1000046', '6', 'falta');
INSERT INTO `cuentas` VALUES ('48', '6', '1', '0', '200', '2024-10-25', '2024-10-25', 'Pagado', '1000047', '6', 'completo');
INSERT INTO `cuentas` VALUES ('49', '6', '5', '17', '483', '2024-10-26', '2024-10-26', 'Pendiente', '1000048', '6', 'falta');
INSERT INTO `cuentas` VALUES ('50', '7', '1', '0', '200', '2024-10-26', '2024-10-26', 'Pagado', '1000049', '6', 'completo');
INSERT INTO `cuentas` VALUES ('51', '7', '5', '0', '500', '2024-10-26', '2024-10-26', 'Pagado', '1000050', '6', 'completo');
INSERT INTO `cuentas` VALUES ('52', '7', '1', '0', '200', '2024-10-26', '2024-10-26', 'Pagado', '1000051', '6', 'completo');
INSERT INTO `cuentas` VALUES ('53', '7', '1', '200', '0', '2024-10-26', '2024-10-26', 'No pagado', '1000052', '6', 'falta');
INSERT INTO `cuentas` VALUES ('54', '2', '1', '0', '200', '2024-10-29', '2024-10-29', 'Pagado', '1000053', '2', 'completo');
INSERT INTO `cuentas` VALUES ('55', '2', '5', '400', '100', '2024-10-29', '2024-10-29', 'Pendiente', '1000054', '2', 'falta');
INSERT INTO `cuentas` VALUES ('56', '3', '1', '200', '0', '2024-10-29', '2024-10-29', 'No pagado', '1000055', '2', 'falta');

CREATE TABLE `estado_concepto` (
  `id_estado` int NOT NULL AUTO_INCREMENT,
  `estado` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `estado_grupo_villa` (
  `id_estado` int NOT NULL AUTO_INCREMENT,
  `estado` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `estado_modelos` (
  `id_estado` int NOT NULL AUTO_INCREMENT,
  `estado` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `estado_moneda` (
  `id_estado` int NOT NULL AUTO_INCREMENT,
  `estado` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `estado_multipago` (
  `id_estado` int NOT NULL AUTO_INCREMENT,
  `estado` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `estado_pago` (
  `id_estado` int NOT NULL AUTO_INCREMENT,
  `estado` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `estado_propietario` (
  `id_estado` int NOT NULL AUTO_INCREMENT,
  `estado` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `estado_usuario` (
  `id_estado` int NOT NULL AUTO_INCREMENT,
  `estado` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `estado_villa` (
  `id_estado` int NOT NULL AUTO_INCREMENT,
  `estado` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `forma_de_pago` (
  `id_pago` int NOT NULL AUTO_INCREMENT,
  `pago` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_estado` int DEFAULT NULL,
  PRIMARY KEY (`id_pago`),
  KEY `FK_forma_de_pago_estado_pago` (`id_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `forma_pago` (
  `id_forma` int NOT NULL AUTO_INCREMENT,
  `id_multi` int NOT NULL,
  `tipo_pago` varchar(50) NOT NULL,
  `forma_pago` varchar(50) NOT NULL,
  `n_referencia` varchar(50) NOT NULL,
  PRIMARY KEY (`id_forma`),
  KEY `FK_id_cuenta` (`id_multi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `grupo_villa` (
  `id_grupo` int NOT NULL AUTO_INCREMENT,
  `grupo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_estado` int DEFAULT NULL,
  PRIMARY KEY (`id_grupo`),
  KEY `FK_grupo_villa_estado_grupo_villa` (`id_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `grupo_villa` VALUES ('1', 'A', '1');
INSERT INTO `grupo_villa` VALUES ('2', 'B', '1');
INSERT INTO `grupo_villa` VALUES ('3', 'C', '1');
INSERT INTO `grupo_villa` VALUES ('4', 'D', '1');
INSERT INTO `grupo_villa` VALUES ('5', 'E', '1');
INSERT INTO `grupo_villa` VALUES ('6', 'H', '1');

CREATE TABLE `modelo_villa` (
  `id_modelo` int NOT NULL AUTO_INCREMENT,
  `modelo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_estado` int DEFAULT NULL,
  PRIMARY KEY (`id_modelo`),
  KEY `FK_modelo_villa_estado_modelos` (`id_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `modelo_villa` VALUES ('1', 'CAREY', '1');
INSERT INTO `modelo_villa` VALUES ('2', 'CORAL', '1');
INSERT INTO `modelo_villa` VALUES ('3', 'ARRECIFE', '1');

CREATE TABLE `moneda` (
  `id_moneda` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `simbolo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `valor` double DEFAULT NULL,
  `id_estado` int DEFAULT NULL,
  PRIMARY KEY (`id_moneda`),
  KEY `FK_Moneda_estado_moneda` (`id_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `multi_pago` VALUES ('1', '2000000', '1', '1', '2024-09-24', NULL, '2000', '3000', '1000', '1', '1', '1', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `multi_pago` VALUES ('2', '2000001', '2', '2', '2024-10-07', NULL, '200', '150', '-50', '1', '1', '1', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `multi_pago` VALUES ('3', '2000002', '2', '2', '2024-10-07', NULL, '50', '50', '0', '1', '1', '1', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `multi_pago` VALUES ('4', '2000003', '3', '6', '2024-10-07', NULL, '0', '0', '0', '1', '1', '5', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `multi_pago` VALUES ('5', '2000004', '2', '3', '2024-10-07', NULL, '500', '500', '0', '1', '1', '1', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `multi_pago` VALUES ('6', '2000005', '3', '4', '2024-10-07', NULL, '160', '160', '0', '1', '1', '1', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `multi_pago` VALUES ('7', '2000006', '3', '5', '2024-10-07', NULL, '160', '100', '-60', '1', '1', '1', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `multi_pago` VALUES ('8', '2000007', '3', '5', '2024-10-14', NULL, '60', '1000', '940', '1', '1', '1', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `multi_pago` VALUES ('9', '2000008', '3', '7', '2024-10-14', NULL, '160', '1000', '840', '1', '1', '5', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `multi_pago` VALUES ('10', '2000009', '2', '8', '2024-10-14', NULL, '200', '500', '300', '1', '1', '1', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `multi_pago` VALUES ('11', '2000010', '3', '9', '2024-10-14', NULL, '500', '1000', '500', '1', '1', '5', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `multi_pago` VALUES ('12', '2000011', '3', '10', '2024-10-14', NULL, '200', '150', '-50', '1', '1', '5', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `multi_pago` VALUES ('13', '2000012', '3', '10', '2024-10-14', NULL, '50', '25', '-25', '1', '1', '5', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `multi_pago` VALUES ('14', '2000013', '3', '10', '2024-10-14', NULL, '25', '25', '0', '1', '1', '5', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `multi_pago` VALUES ('15', '2000014', '3', '11', '2024-10-14', NULL, '500', '400', '-100', '1', '1', '5', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `multi_pago` VALUES ('16', '2000015', '3', '11', '2024-10-14', NULL, '100', '500', '400', '1', '1', '5', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `multi_pago` VALUES ('17', '2000016', '2', '12', '2024-10-14', NULL, '500', '1000', '500', '1', '1', '5', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `multi_pago` VALUES ('18', '2000017', '3', '13', '2024-10-14', NULL, '500', '1000', '500', '1', '1', '5', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `multi_pago` VALUES ('19', '2000018', '3', '14', '2024-10-14', NULL, '200', '150', '-50', '1', '1', '1', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `multi_pago` VALUES ('20', '2000019', '2', '16', '2024-10-14', NULL, '200', '500', '300', '1', '1', '1', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `multi_pago` VALUES ('21', '2000020', '2', '17', '2024-10-15', NULL, '500', '1000', '500', '1', '1', '5', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `multi_pago` VALUES ('22', '2000021', '3', '15', '2024-10-15', NULL, '200', '150', '-50', '1', '1', '1', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `multi_pago` VALUES ('23', '2000022', '3', '15', '2024-10-15', NULL, '50', '50', '0', '1', '1', '1', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `multi_pago` VALUES ('24', '2000023', '3', '14', '2024-10-15', NULL, '50', '50', '0', '1', '1', '1', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `multi_pago` VALUES ('25', '2000024', '3', '18', '2024-10-17', NULL, '1000', '2000', '1000', '1', '1', '5', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `multi_pago` VALUES ('26', '2000024', '3', '18', '2024-10-17', NULL, '1000', '2000', '1000', '1', '1', '5', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `multi_pago` VALUES ('27', '2000024', '3', '19', '2024-10-17', NULL, '1000', '2000', '1000', '1', '1', '5', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `multi_pago` VALUES ('28', '2000025', '2', '38', '2024-10-17', NULL, '200', '500', '300', '1', '1', '1', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `multi_pago` VALUES ('29', '2000026', '2', '40', '2024-10-17', NULL, '500', '1000', '500', '1', '1', '5', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `multi_pago` VALUES ('30', '2000027', '3', '41', '2024-10-17', NULL, '500', '100', '-400', '1', '1', '5', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `multi_pago` VALUES ('31', '2000028', '3', '41', '2024-10-17', NULL, '400', '400', '0', '1', '1', '5', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `multi_pago` VALUES ('32', '2000029', '2', '34', '2024-10-18', NULL, '500', '500', '0', '1', '1', '5', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `multi_pago` VALUES ('33', '2000030', '2', '45', '2024-10-18', NULL, '900', '900', '0', '1', '1', '1', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `multi_pago` VALUES ('34', '2000031', '2', '44', '2024-10-18', NULL, '500', '100', '-400', '1', '1', '1', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `multi_pago` VALUES ('35', '2000032', '4', '46', '2024-10-18', NULL, '1000', '700', '-300', '1', '1', '1', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `multi_pago` VALUES ('36', '2000033', '2', '20', '2024-10-25', NULL, '200', '500', '300', '1', '1', '1', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `multi_pago` VALUES ('37', '2000034', '6', '48', '2024-10-25', NULL, '200', '500', '300', '1', '1', '1', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `multi_pago` VALUES ('38', '2000035', '2', '21', '2024-10-25', NULL, '200', '500', '300', '1', '1', '1', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `multi_pago` VALUES ('39', '2000035', '2', '21', '2024-10-25', NULL, '200', '500', '300', '1', '1', '1', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `multi_pago` VALUES ('40', '2000036', '2', '25', '2024-10-25', NULL, '200', '500', '300', '1', '1', '1', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `multi_pago` VALUES ('41', '2000037', '2', '22', '2024-10-25', NULL, '500', '1000', '500', '1', '1', '5', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `multi_pago` VALUES ('42', '2000038', '2', '23', '2024-10-25', NULL, '500', '1000', '500', '1', '1', '5', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `multi_pago` VALUES ('43', '2000039', '2', '27', '2024-10-25', NULL, '200', '100', '-100', '1', '1', '1', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `multi_pago` VALUES ('44', '2000040', '2', '27', '2024-10-25', NULL, '100', '50', '-50', '1', '1', '1', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `multi_pago` VALUES ('45', '2000041', '4', '46', '2024-10-25', NULL, '300', '100', '-200', '1', '1', '1', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `multi_pago` VALUES ('46', '2000042', '2', '27', '2024-10-25', NULL, '50', '100', '50', '1', '1', '1', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `multi_pago` VALUES ('47', '2000043', '2', '32', '2024-10-25', NULL, '200', '100', '-100', '1', '1', '1', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `multi_pago` VALUES ('48', '2000043', '2', '32', '2024-10-25', NULL, '200', '100', '-100', '1', '1', '1', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `multi_pago` VALUES ('49', '2000043', '2', '36', '2024-10-25', NULL, '200', '500', '300', '1', '1', '1', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `multi_pago` VALUES ('50', '2000044', '2', '44', '2024-10-25', NULL, '400', '100', '-300', '1', '1', '1', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `multi_pago` VALUES ('51', '2000044', '2', '44', '2024-10-25', NULL, '400', '100', '-300', '1', '1', '1', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `multi_pago` VALUES ('52', '2000045', '2', '42', '2024-10-26', NULL, '200', '200', '0', '1', '1', '1', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `multi_pago` VALUES ('53', '2000046', '2', '44', '2024-10-26', NULL, '200', '100', '-100', '1', '1', '1', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `multi_pago` VALUES ('54', '2000047', '4', '46', '2024-10-26', NULL, '200', '100', '-100', '1', '1', '1', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `multi_pago` VALUES ('55', '2000048', '2', '44', '2024-10-26', NULL, '100', '50', '-50', '1', '1', '1', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `multi_pago` VALUES ('56', '2000049', '2', '44', '2024-10-26', NULL, '50', '100', '50', '1', '1', '1', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `multi_pago` VALUES ('57', '2000050', '4', '46', '2024-10-26', NULL, '100', '10', '-90', '1', '1', '1', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `multi_pago` VALUES ('58', '2000051', '4', '46', '2024-10-26', NULL, '90', '10', '-80', '1', '1', '1', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `multi_pago` VALUES ('59', '2000052', '4', '47', '2024-10-26', NULL, '500', '100', '-400', '1', '1', '5', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `multi_pago` VALUES ('60', '2000053', '4', '47', '2024-10-26', NULL, '400', '100', '-300', '1', '1', '5', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `multi_pago` VALUES ('61', '2000054', '6', '49', '2024-10-26', NULL, '500', '200', '-300', '1', '1', '5', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `multi_pago` VALUES ('62', '2000055', '6', '49', '2024-10-26', NULL, '300', '100', '-200', '1', '1', '5', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `multi_pago` VALUES ('63', '2000056', '7', '50', '2024-10-26', NULL, '200', '200', '0', '1', '1', '1', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `multi_pago` VALUES ('64', '2000057', '7', '51', '2024-10-26', NULL, '500', '500', '0', '1', '1', '5', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `multi_pago` VALUES ('65', '2000058', '7', '52', '2024-10-26', NULL, '200', '200', '0', '1', '1', '1', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `multi_pago` VALUES ('66', '2000059', '6', '49', '2024-10-26', NULL, '200', '50', '-150', '1', '1', '5', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `multi_pago` VALUES ('67', '2000060', '6', '49', '2024-10-26', NULL, '150', '50', '-100', '1', '1', '5', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `multi_pago` VALUES ('68', '2000061', '6', '49', '2024-10-26', NULL, '100', '10', '-90', '1', '1', '5', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `multi_pago` VALUES ('69', '2000062', '6', '49', '2024-10-26', NULL, '90', '10', '-80', '1', '1', '5', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `multi_pago` VALUES ('70', '2000063', '6', '49', '2024-10-26', NULL, '80', '10', '-70', '1', '1', '5', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `multi_pago` VALUES ('71', '2000064', '6', '49', '2024-10-26', NULL, '70', '10', '-60', '1', '1', '5', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `multi_pago` VALUES ('72', '2000065', '6', '49', '2024-10-26', NULL, '60', '10', '-50', '1', '1', '5', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `multi_pago` VALUES ('73', '2000066', '6', '49', '2024-10-26', NULL, '50', '10', '-40', '1', '1', '5', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `multi_pago` VALUES ('74', '2000067', '6', '49', '2024-10-26', NULL, '40', '10', '-30', '1', '1', '5', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `multi_pago` VALUES ('75', '2000068', '6', '49', '2024-10-27', NULL, '30', '10', '-20', '1', '1', '5', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `multi_pago` VALUES ('76', '2000069', '2', '54', '2024-11-05', NULL, '200', '100', '-100', '1', '1', '1', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `multi_pago` VALUES ('77', '2000070', '6', '49', '2024-11-08', NULL, '20', '1', '-19', '1', '1', '5', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `multi_pago` VALUES ('78', '2000071', '6', '49', '2024-11-08', NULL, '19', '1', '-18', '1', '1', '5', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `multi_pago` VALUES ('79', '2000072', '6', '49', '2024-11-08', NULL, '18', '1', '-17', '1', '1', '5', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `multi_pago` VALUES ('80', '2000073', '2', '54', '2024-11-14', NULL, '100', '100', '0', '1', '1', '1', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `multi_pago` VALUES ('81', '2000074', '2', '55', '2024-11-14', NULL, '500', '100', '-400', '1', '1', '5', 'Efectivo', 'Físico', 'Ninguna');

CREATE TABLE `permisos` (
  `id_acceso` int NOT NULL AUTO_INCREMENT,
  `acceso` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id_acceso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `propietarios` (
  `id_propietario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `dni` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `correo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `id_estado` int DEFAULT NULL,
  `observacion` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `telefono` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id_propietario`),
  KEY `FK_propietarios_estado_propietario` (`id_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `propietarios` VALUES ('1', 'KAREN', '741852963', 'karen@gmail.com', '2024-09-24', '1', '', '741852963');
INSERT INTO `propietarios` VALUES ('2', 'NESTOR', '0101199901209', 'nestoroliva80@gmail.com', '2024-10-07', '1', '', '8529637');
INSERT INTO `propietarios` VALUES ('3', 'KKKK', '852963', 'anthony@gmail.com', '2024-10-07', '1', 'kfkmfkvkf', '741');
INSERT INTO `propietarios` VALUES ('4', 'II', '1551551', '', '2024-10-18', '1', '', '74');
INSERT INTO `propietarios` VALUES ('5', 'MM', '777', 'mkvkkf@gmail.com', '2024-10-23', '1', '\n            ', '741852');
INSERT INTO `propietarios` VALUES ('6', 'BEYONCE', '010152228963', 'anthonyoliva70@gmail.com', '2024-10-25', '1', '\n            ', '85856030');
INSERT INTO `propietarios` VALUES ('7', 'BYRON', '0101199900522', 'Bayronh05@gmail.com', '2024-10-26', '1', '', '94856463');
INSERT INTO `propietarios` VALUES ('8', 'JJJJ', '151555151515', '', '2024-10-31', '1', '\n            ', '15155151551515');

CREATE TABLE `propietarios_villas` (
  `id_unir` int NOT NULL AUTO_INCREMENT,
  `id_propietario` int DEFAULT NULL,
  `id_villa` int DEFAULT NULL,
  PRIMARY KEY (`id_unir`),
  KEY `FK_propietarios_villas_propietarios` (`id_propietario`),
  KEY `FK_propietarios_villas_villas` (`id_villa`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `propietarios_villas` VALUES ('1', '1', '1');
INSERT INTO `propietarios_villas` VALUES ('2', '2', '2');
INSERT INTO `propietarios_villas` VALUES ('3', '3', '3');
INSERT INTO `propietarios_villas` VALUES ('4', '4', '4');
INSERT INTO `propietarios_villas` VALUES ('5', '5', '5');
INSERT INTO `propietarios_villas` VALUES ('6', '6', '6');
INSERT INTO `propietarios_villas` VALUES ('7', '7', '7');
INSERT INTO `propietarios_villas` VALUES ('8', '8', '8');

CREATE TABLE `temporal` (
  `clave_temp` varbinary(500) NOT NULL,
  PRIMARY KEY (`clave_temp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `temporal` VALUES ('\Z�č����Auvm�');

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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `usuarios` VALUES ('2', 'ANTHONY', 'OLIVA', '010119993209', '94856466', 'anthonyoliva70@gmail.com', '1', 'v�R_�x��hO��Y�R�', '1', 'ANTHONY');
INSERT INTO `usuarios` VALUES ('19', 'NESTOR', 'OLIVA', '741852963', '852963', 'nestorolva@gmial.com', '2', '���Y$Yo��K��W�', '1', 'NESTO');

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
  `modelo` varchar(500) NOT NULL,
  PRIMARY KEY (`id_villa`),
  KEY `FK_villas_condicion_villas` (`id_condicion`),
  KEY `FK_villas_estado_villa` (`id_estado`),
  KEY `FK_villas_grupo_villa` (`id_grupo`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `villas` VALUES ('2', '1', '5', '15551561516515155', '2', '250', '1', '2', '', '', 'CORAL');
INSERT INTO `villas` VALUES ('3', '1', '10', '5115', '2', '250', '1', '2', '', '', 'CAREY');
INSERT INTO `villas` VALUES ('4', '1', '7', '852963', '2', '250', '1', '2', '', '', 'CAREY');
INSERT INTO `villas` VALUES ('5', '1', '77', '852', '2', '250', '1', '2', '', '', 'CAREY');
INSERT INTO `villas` VALUES ('6', '1', '12', '74', '2', '25', '1', '2', '', '', 'CAREY');
INSERT INTO `villas` VALUES ('7', '2', '1', '741852', '2', '250', '1', '2', '', '', 'CORAL');
INSERT INTO `villas` VALUES ('8', '1', '14', '123456789852741', '2', '250', '1', '2', '', '', 'CAREY');

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `cod_villa` AS select concat(`grupo_villa`.`grupo`,'-',`villas`.`numero`) AS `villa` from (`villas` join `grupo_villa` on((`villas`.`id_grupo` = `grupo_villa`.`id_grupo`)));

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `cuenta_vista` AS select `cuentas`.`id_cuenta` AS `id_cuenta`,`cuentas`.`codigo` AS `codigo`,`propietarios_villas`.`id_unir` AS `id_unir`,`cuentas`.`costo` AS `costo`,`cuentas`.`abono` AS `abono`,`cuentas`.`desde` AS `desde`,`cuentas`.`hasta` AS `hasta`,`cuentas`.`pagado` AS `pagado`,`concepto_1`.`concepto` AS `concepto_2`,`propietarios`.`nombre` AS `nombre`,concat(`grupo_villa`.`grupo`,'-',`villas`.`numero`) AS `villa`,`concepto`.`concepto` AS `concepto`,`concepto`.`id_concepto` AS `id_concepto`,`concepto_1`.`id_concepto` AS `con_descrip`,`cuentas`.`con_pagado` AS `con_pagado` from ((((((`cuentas` join `propietarios_villas` on((`cuentas`.`id_unir` = `propietarios_villas`.`id_unir`))) join `concepto` on((`cuentas`.`id_concepto` = `concepto`.`id_concepto`))) join `concepto` `concepto_1` on((`cuentas`.`id_concepto_2` = `concepto_1`.`id_concepto`))) join `villas` on((`propietarios_villas`.`id_villa` = `villas`.`id_villa`))) join `propietarios` on((`propietarios_villas`.`id_propietario` = `propietarios`.`id_propietario`))) join `grupo_villa` on((`villas`.`id_grupo` = `grupo_villa`.`id_grupo`)));

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `donar_recibir_villa` AS select `propietarios_villas`.`id_propietario` AS `id_propietario`,`villas`.`id_villa` AS `id_villa`,concat(`grupo_villa`.`grupo`,'-',`villas`.`numero`) AS `villas`,`villas`.`cont_eeh` AS `cont_eeh`,`villas`.`habitaciones` AS `habitaciones`,`villas`.`id_condicion` AS `condicion`,`villas`.`modelo` AS `modelo` from ((`propietarios_villas` join `villas` on((`propietarios_villas`.`id_villa` = `villas`.`id_villa`))) join `grupo_villa` on((`villas`.`id_grupo` = `grupo_villa`.`id_grupo`)));

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `estado_cuenta` AS select `cuenta_estado`.`id_estado_cuenta` AS `id_estado_cuenta`,`cuenta_estado`.`costo` AS `costo`,`cuenta_estado`.`abono` AS `abono`,`cuenta_estado`.`fecha_aplicada` AS `fecha_aplicada`,`cuentas`.`id_unir` AS `id_unir`,`cuentas`.`codigo` AS `codigo`,`concepto_1`.`concepto` AS `concepto`,`concepto`.`concepto` AS `concepto_2`,`propietarios`.`nombre` AS `nombre`,concat(`grupo_villa`.`grupo`,'-',`villas`.`numero`) AS `villa` from (((((((`cuenta_estado` join `cuentas` on((`cuenta_estado`.`id_cuenta` = `cuentas`.`id_cuenta`))) join `concepto` `concepto_1` on((`cuentas`.`id_concepto` = `concepto_1`.`id_concepto`))) join `concepto` on((`cuentas`.`id_concepto_2` = `concepto`.`id_concepto`))) join `propietarios_villas` on((`cuentas`.`id_unir` = `propietarios_villas`.`id_unir`))) join `villas` on((`propietarios_villas`.`id_villa` = `villas`.`id_villa`))) join `grupo_villa` on((`villas`.`id_grupo` = `grupo_villa`.`id_grupo`))) join `propietarios` on((`propietarios_villas`.`id_propietario` = `propietarios`.`id_propietario`)));

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `factura_completa_reimprimir` AS select `multi_pago`.`codigo_pago` AS `codigo_pago`,`concepto`.`concepto` AS `concepto`,`multi_pago`.`fecha_pago` AS `fecha_pago`,`multi_pago`.`id_unir` AS `id_unir`,`cuentas`.`desde` AS `desde`,`cuentas`.`hasta` AS `hasta`,`cuentas`.`codigo` AS `codigo`,`cuentas`.`costo` AS `costo`,`cuentas`.`abono` AS `abono`,`multi_pago`.`tipo_pago` AS `tipo_pago`,`multi_pago`.`forma_pago` AS `forma_pago`,`multi_pago`.`n_referencia` AS `n_referencia`,`multi_pago`.`cantidad_recibida` AS `cantidad_recibida`,`concepto_1`.`concepto` AS `abono_con` from (((`concepto` join `cuentas` on((`concepto`.`id_concepto` = `cuentas`.`id_concepto`))) join `multi_pago` on((`cuentas`.`id_cuenta` = `multi_pago`.`id_cuenta`))) join `concepto` `concepto_1` on((`cuentas`.`id_concepto_2` = `concepto_1`.`id_concepto`)));

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pripietario_cuenta_vista` AS select `propietarios_villas`.`id_unir` AS `id_unir`,concat(`grupo_villa`.`grupo`,'-',`villas`.`numero`) AS `villa`,`propietarios`.`nombre` AS `nombre`,`propietarios`.`dni` AS `dni`,`propietarios`.`telefono` AS `telefono`,`propietarios`.`id_estado` AS `id_estado`,`propietarios`.`correo` AS `correo` from (((`propietarios_villas` join `propietarios` on((`propietarios_villas`.`id_propietario` = `propietarios`.`id_propietario`))) join `villas` on((`propietarios_villas`.`id_villa` = `villas`.`id_villa`))) join `grupo_villa` on((`villas`.`id_grupo` = `grupo_villa`.`id_grupo`)));

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `propietario_principal` AS select `propietarios_villas`.`id_unir` AS `id_unir`,`propietarios_villas`.`id_propietario` AS `id_propietario`,`propietarios_villas`.`id_villa` AS `id_villa`,concat(`grupo_villa`.`grupo`,'-',`villas`.`numero`) AS `villa`,`villas`.`cont_eeh` AS `cont_eeh`,`propietarios`.`nombre` AS `nombre`,`propietarios`.`dni` AS `dni`,`propietarios`.`telefono` AS `telefono`,`propietarios`.`correo` AS `correo`,`propietarios`.`observacion` AS `observacion` from (((`propietarios_villas` join `propietarios` on((`propietarios_villas`.`id_propietario` = `propietarios`.`id_propietario`))) join `villas` on((`propietarios_villas`.`id_villa` = `villas`.`id_villa`))) join `grupo_villa` on((`villas`.`id_grupo` = `grupo_villa`.`id_grupo`)));

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tomar_desde_hasta` AS select `pripietario_cuenta_vista`.`id_unir` AS `id_unir`,`pripietario_cuenta_vista`.`villa` AS `villa` from `pripietario_cuenta_vista` order by substring_index(`pripietario_cuenta_vista`.`villa`,'-',1),cast(substring_index(`pripietario_cuenta_vista`.`villa`,'-',-(1)) as unsigned);

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ultimas_villas` AS select `villas`.`id_villa` AS `id_villa`,concat(`grupo_villa`.`grupo`,'-',`villas`.`numero`) AS `codigo`,`villas`.`id_condicion` AS `condicion`,`villas`.`id_estado` AS `estado`,`villas`.`modelo` AS `modelo` from (`villas` join `grupo_villa` on((`villas`.`id_grupo` = `grupo_villa`.`id_grupo`)));

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ver_cuentas_pagadas` AS select `multi_pago`.`codigo_pago` AS `codigo_pago`,`concepto`.`concepto` AS `concepto`,`multi_pago`.`fecha_pago` AS `fecha_pago`,`multi_pago`.`id_unir` AS `id_unir` from ((`concepto` join `cuentas` on((`concepto`.`id_concepto` = `cuentas`.`id_concepto`))) join `multi_pago` on((`cuentas`.`id_cuenta` = `multi_pago`.`id_cuenta`)));

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ver_saldos` AS select `cuenta_vista`.`concepto` AS `concepto`,`cuenta_vista`.`villa` AS `villa`,`cuenta_vista`.`nombre` AS `nombre`,sum(`cuenta_vista`.`costo`) AS `costo_total`,sum(`cuenta_vista`.`abono`) AS `abono_total`,sum((`cuenta_vista`.`costo` - `cuenta_vista`.`abono`)) AS `saldo_total` from `cuenta_vista` group by `cuenta_vista`.`concepto`,`cuenta_vista`.`villa`,`cuenta_vista`.`nombre`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `villa_completo` AS select `villas`.`id_villa` AS `id_villa`,concat(`grupo_villa`.`grupo`,'-',`villas`.`numero`) AS `villas`,`villas`.`cont_eeh` AS `cont_eeh`,`villas`.`habitaciones` AS `habitaciones`,`villas`.`lote` AS `lote`,`villas`.`id_condicion` AS `condicion`,`villas`.`id_estado` AS `estado`,`villas`.`modelo` AS `modelo`,`villas`.`direccion` AS `direccion`,`villas`.`observacion` AS `observacion` from (`villas` join `grupo_villa` on((`villas`.`id_grupo` = `grupo_villa`.`id_grupo`)));

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `villas_con_propietario` AS select `villas`.`id_villa` AS `id_villa`,concat(`grupo_villa`.`grupo`,'-',`villas`.`numero`) AS `villas`,`villas`.`cont_eeh` AS `cont_eeh`,`villas`.`habitaciones` AS `habitaciones`,`villas`.`lote` AS `lote`,`villas`.`id_estado` AS `id_estado`,`propietarios_villas`.`id_propietario` AS `id_propietario`,`propietarios_villas`.`id_unir` AS `id_unir`,`villas`.`modelo` AS `modelo` from ((`villas` join `grupo_villa` on((`villas`.`id_grupo` = `grupo_villa`.`id_grupo`))) join `propietarios_villas` on((`villas`.`id_villa` = `propietarios_villas`.`id_villa`)));

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_cuenta_vista` (`id_cuenta`,`codigo`,`id_unir`,`costo`,`abono`,`desde`,`hasta`,`pagado`,`concepto_2`,`nombre`,`villa`,`concepto`,`id_concepto`,`con_descrip`,`con_pagado`) AS select `cuentas`.`id_cuenta` AS `id_cuenta`,`cuentas`.`codigo` AS `codigo`,`propietarios_villas`.`id_unir` AS `id_unir`,`cuentas`.`costo` AS `costo`,`cuentas`.`abono` AS `abono`,`cuentas`.`desde` AS `desde`,`cuentas`.`hasta` AS `hasta`,`cuentas`.`pagado` AS `pagado`,`concepto_1`.`concepto` AS `concepto_2`,`propietarios`.`nombre` AS `nombre`,((`grupo_villa`.`grupo` + '-') + `villas`.`numero`) AS `villa`,`concepto`.`concepto` AS `concepto`,`concepto`.`id_concepto` AS `id_concepto`,`concepto_1`.`id_concepto` AS `con_descrip`,`cuentas`.`con_pagado` AS `con_pagado` from ((((((`cuentas` join `propietarios_villas` on((`cuentas`.`id_unir` = `propietarios_villas`.`id_unir`))) join `concepto` on((`cuentas`.`id_concepto` = `concepto`.`id_concepto`))) join `concepto` `concepto_1` on((`cuentas`.`id_concepto_2` = `concepto_1`.`id_concepto`))) join `villas` on((`propietarios_villas`.`id_villa` = `villas`.`id_villa`))) join `propietarios` on((`propietarios_villas`.`id_propietario` = `propietarios`.`id_propietario`))) join `grupo_villa` on((`villas`.`id_grupo` = `grupo_villa`.`id_grupo`)));

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_usuario` AS select `usuarios`.`id_usuario` AS `id_usuario`,`usuarios`.`usuario` AS `usuario`,concat(`usuarios`.`nombre`,' ',`usuarios`.`apellido`) AS `nombre`,`usuarios`.`dni` AS `dni`,`usuarios`.`telefono` AS `telefono`,`usuarios`.`correo` AS `correo`,if((`usuarios`.`id_acceso` = 1),'Administrador','Usuario') AS `acceso`,`usuarios`.`clave` AS `clave`,`usuarios`.`id_estado` AS `estado`,`usuarios`.`nombre` AS `nom`,`usuarios`.`apellido` AS `ape`,`acceso_usuario`.`imprimir_reportes` AS `imprimir_reportes`,`acceso_usuario`.`modificar_reportes` AS `modificar_reportes`,`acceso_usuario`.`eliminar_reportes` AS `eliminar_reportes` from (`acceso_usuario` join `usuarios` on((`acceso_usuario`.`id_usuario` = `usuarios`.`id_usuario`)));

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `adicionar_descripcion` AS select `adicion`.`id_adicion` AS `id_adicion`,`adicion`.`cuenta` AS `cuenta`,`adicion`.`fecha` AS `fecha`,`propietarios`.`nombre` AS `nombre`,`propietarios`.`dni` AS `dni`,`villa_completo`.`villas` AS `villas` from ((`adicion` join `propietarios` on((`adicion`.`id_propi` = `propietarios`.`id_propietario`))) join `villa_completo` on((`adicion`.`id_villa` = `villa_completo`.`id_villa`)));

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `descripcion_donador` AS select `cambio`.`id_cambio` AS `id_cambio`,`propietarios`.`id_propietario` AS `id_propietario`,`cambio`.`cuenta` AS `cuentas`,`propietarios`.`nombre` AS `nombre`,`propietarios`.`dni` AS `dni`,`propietarios_1`.`id_propietario` AS `id_pro_2`,`propietarios_1`.`nombre` AS `nombre_2`,`propietarios_1`.`dni` AS `dni_2`,`villa_completo`.`villas` AS `villas`,`cambio`.`fecha` AS `fecha` from (((`cambio` join `villa_completo` on((`cambio`.`id_villa` = `villa_completo`.`id_villa`))) join `propietarios` on((`cambio`.`id_donante` = `propietarios`.`id_propietario`))) join `propietarios` `propietarios_1` on((`cambio`.`id_recibie` = `propietarios_1`.`id_propietario`)));

SET FOREIGN_KEY_CHECKS = 1;
