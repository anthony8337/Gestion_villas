-- Exportación de la base de datos gestion_de_propietario
SET FOREIGN_KEY_CHECKS=0;
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `caracteristicas` (
  `id_caracteristica` int NOT NULL AUTO_INCREMENT,
  `id_villa` int DEFAULT NULL,
  `caracteristica` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id_caracteristica`),
  KEY `FK_caracteristicas_villas` (`id_villa`),
  CONSTRAINT `caracteristicas$FK_caracteristicas_villas` FOREIGN KEY (`id_villa`) REFERENCES `villas` (`id_villa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `concepto` (
  `id_concepto` int NOT NULL AUTO_INCREMENT,
  `concepto` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `tipo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `valor` double DEFAULT NULL,
  `referencia` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_estado` int DEFAULT NULL,
  PRIMARY KEY (`id_concepto`),
  KEY `FK_concepto_estado_concepto` (`id_estado`),
  CONSTRAINT `concepto$FK_concepto_estado_concepto` FOREIGN KEY (`id_estado`) REFERENCES `estado_concepto` (`id_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `condicion_villas` (
  `id_condicion` int NOT NULL AUTO_INCREMENT,
  `condicion` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id_condicion`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `contactos_propietario` (
  `id_contacto` int NOT NULL AUTO_INCREMENT,
  `id_propietario` int DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `numero` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_contacto`),
  KEY `FK_id_propietario` (`id_propietario`),
  CONSTRAINT `FK_id_propietario` FOREIGN KEY (`id_propietario`) REFERENCES `propietarios_villas` (`id_unir`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
  PRIMARY KEY (`id_cuenta`),
  KEY `FK_cuenta_concepto` (`id_concepto`),
  KEY `FK_cuentas_propietarios_villas` (`id_unir`),
  CONSTRAINT `cuentas$FK_cuenta_concepto` FOREIGN KEY (`id_concepto`) REFERENCES `concepto` (`id_concepto`),
  CONSTRAINT `cuentas$FK_cuentas_propietarios_villas` FOREIGN KEY (`id_unir`) REFERENCES `propietarios_villas` (`id_unir`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `estado_concepto` (
  `id_estado` int NOT NULL AUTO_INCREMENT,
  `estado` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `estado_grupo_villa` (
  `id_estado` int NOT NULL AUTO_INCREMENT,
  `estado` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `estado_modelos` (
  `id_estado` int NOT NULL AUTO_INCREMENT,
  `estado` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `estado_moneda` (
  `id_estado` int NOT NULL AUTO_INCREMENT,
  `estado` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `estado_multipago` (
  `id_estado` int NOT NULL AUTO_INCREMENT,
  `estado` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `estado_pago` (
  `id_estado` int NOT NULL AUTO_INCREMENT,
  `estado` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `estado_propietario` (
  `id_estado` int NOT NULL AUTO_INCREMENT,
  `estado` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `estado_usuario` (
  `id_estado` int NOT NULL AUTO_INCREMENT,
  `estado` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `estado_villa` (
  `id_estado` int NOT NULL AUTO_INCREMENT,
  `estado` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `forma_de_pago` (
  `id_pago` int NOT NULL AUTO_INCREMENT,
  `pago` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_estado` int DEFAULT NULL,
  PRIMARY KEY (`id_pago`),
  KEY `FK_forma_de_pago_estado_pago` (`id_estado`),
  CONSTRAINT `FK_forma_de_pago_estado_pago` FOREIGN KEY (`id_estado`) REFERENCES `estado_pago` (`id_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `forma_pago` (
  `id_forma` int NOT NULL AUTO_INCREMENT,
  `id_cuenta` int NOT NULL,
  `tipo_pago` varchar(50) NOT NULL,
  `forma_pago` varchar(50) NOT NULL,
  `n_referencia` varchar(50) NOT NULL,
  PRIMARY KEY (`id_forma`),
  KEY `FK_id_cuenta` (`id_cuenta`),
  CONSTRAINT `FK_id_cuenta` FOREIGN KEY (`id_cuenta`) REFERENCES `cuentas` (`id_cuenta`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `grupo_villa` (
  `id_grupo` int NOT NULL AUTO_INCREMENT,
  `grupo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_estado` int DEFAULT NULL,
  PRIMARY KEY (`id_grupo`),
  KEY `FK_grupo_villa_estado_grupo_villa` (`id_estado`),
  CONSTRAINT `grupo_villa$FK_grupo_villa_estado_grupo_villa` FOREIGN KEY (`id_estado`) REFERENCES `estado_grupo_villa` (`id_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `modelo_villa` (
  `id_modelo` int NOT NULL AUTO_INCREMENT,
  `modelo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_estado` int DEFAULT NULL,
  PRIMARY KEY (`id_modelo`),
  KEY `FK_modelo_villa_estado_modelos` (`id_estado`),
  CONSTRAINT `modelo_villa$FK_modelo_villa_estado_modelos` FOREIGN KEY (`id_estado`) REFERENCES `estado_modelos` (`id_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `moneda` (
  `id_moneda` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `simbolo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `valor` double DEFAULT NULL,
  `id_estado` int DEFAULT NULL,
  PRIMARY KEY (`id_moneda`),
  KEY `FK_Moneda_estado_moneda` (`id_estado`),
  CONSTRAINT `moneda$FK_Moneda_estado_moneda` FOREIGN KEY (`id_estado`) REFERENCES `estado_moneda` (`id_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `multi_pago` (
  `id_multi` int NOT NULL AUTO_INCREMENT,
  `codigo_pago` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_unir` int DEFAULT NULL,
  `id_cuenta` int DEFAULT NULL,
  `fecha_pago` date DEFAULT NULL,
  `total_pago` float DEFAULT NULL,
  `cantidad_recibida` float DEFAULT NULL,
  `cantidad_devuelta` float DEFAULT NULL,
  `id_estado` int DEFAULT NULL,
  `id_pago` int DEFAULT NULL,
  `id_concepto` int DEFAULT NULL,
  PRIMARY KEY (`id_multi`),
  KEY `FK_multi_pago_cuentas` (`id_cuenta`),
  KEY `FK_multi_pago_propietarios_villas` (`id_unir`),
  KEY `FK_multi_pago_estado_multipago` (`id_estado`),
  KEY `FK_multi_pago_forma_de_pago` (`id_pago`),
  KEY `FK_multi_pago_id_concepto` (`id_concepto`),
  CONSTRAINT `FK_multi_pago_cuentas` FOREIGN KEY (`id_cuenta`) REFERENCES `cuentas` (`id_cuenta`),
  CONSTRAINT `FK_multi_pago_estado_multipago` FOREIGN KEY (`id_estado`) REFERENCES `estado_multipago` (`id_estado`),
  CONSTRAINT `FK_multi_pago_forma_de_pago` FOREIGN KEY (`id_pago`) REFERENCES `forma_de_pago` (`id_pago`),
  CONSTRAINT `FK_multi_pago_id_concepto` FOREIGN KEY (`id_concepto`) REFERENCES `concepto` (`id_concepto`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_multi_pago_propietarios_villas` FOREIGN KEY (`id_unir`) REFERENCES `propietarios_villas` (`id_unir`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `permisos` (
  `id_acceso` int NOT NULL AUTO_INCREMENT,
  `acceso` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id_acceso`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
  KEY `FK_propietarios_estado_propietario` (`id_estado`),
  CONSTRAINT `propietarios$FK_propietarios_estado_propietario` FOREIGN KEY (`id_estado`) REFERENCES `estado_propietario` (`id_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `propietarios_villas` (
  `id_unir` int NOT NULL AUTO_INCREMENT,
  `id_propietario` int DEFAULT NULL,
  `id_villa` int DEFAULT NULL,
  PRIMARY KEY (`id_unir`),
  KEY `FK_propietarios_villas_propietarios` (`id_propietario`),
  KEY `FK_propietarios_villas_villas` (`id_villa`),
  CONSTRAINT `propietarios_villas$FK_propietarios_villas_propietarios` FOREIGN KEY (`id_propietario`) REFERENCES `propietarios` (`id_propietario`),
  CONSTRAINT `propietarios_villas$FK_propietarios_villas_villas` FOREIGN KEY (`id_villa`) REFERENCES `villas` (`id_villa`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `usuarios` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `apellido` varchar(50) NOT NULL,
  `dni` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `telefono` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `correo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_acceso` int DEFAULT NULL,
  `clave` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_estado` int DEFAULT NULL,
  `usuario` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `FK_usuarios_estado_usuario` (`id_estado`),
  KEY `FK_usuarios_permisos` (`id_acceso`),
  CONSTRAINT `usuarios$FK_usuarios_estado_usuario` FOREIGN KEY (`id_estado`) REFERENCES `estado_usuario` (`id_estado`),
  CONSTRAINT `usuarios$FK_usuarios_permisos` FOREIGN KEY (`id_acceso`) REFERENCES `permisos` (`id_acceso`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `villas` (
  `id_villa` int NOT NULL AUTO_INCREMENT,
  `id_grupo` int DEFAULT NULL,
  `numero` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `cont_eeh` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `habitaciones` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `lote` varchar(50) DEFAULT NULL,
  `id_modelo` int DEFAULT NULL,
  `id_condicion` int DEFAULT NULL,
  `id_estado` int DEFAULT NULL,
  `direccion` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `observacion` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id_villa`),
  KEY `FK_villas_condicion_villas` (`id_condicion`),
  KEY `FK_villas_estado_villa` (`id_estado`),
  KEY `FK_villas_grupo_villa` (`id_grupo`),
  KEY `FK_villas_modelo_villa` (`id_modelo`),
  CONSTRAINT `villas$FK_villas_condicion_villas` FOREIGN KEY (`id_condicion`) REFERENCES `condicion_villas` (`id_condicion`),
  CONSTRAINT `villas$FK_villas_estado_villa` FOREIGN KEY (`id_estado`) REFERENCES `estado_villa` (`id_estado`),
  CONSTRAINT `villas$FK_villas_grupo_villa` FOREIGN KEY (`id_grupo`) REFERENCES `grupo_villa` (`id_grupo`),
  CONSTRAINT `villas$FK_villas_modelo_villa` FOREIGN KEY (`id_modelo`) REFERENCES `modelo_villa` (`id_modelo`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `cod_villa` AS select concat(`grupo_villa`.`grupo`,'-',`villas`.`numero`) AS `villa` from (`villas` join `grupo_villa` on((`villas`.`id_grupo` = `grupo_villa`.`id_grupo`)));

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `cuenta_vista` (`id_cuenta`,`codigo`,`id_unir`,`concepto`,`costo`,`abono`,`desde`,`hasta`,`pagado`) AS select `cuentas`.`id_cuenta` AS `id_cuenta`,`cuentas`.`codigo` AS `codigo`,`propietarios_villas`.`id_unir` AS `id_unir`,`concepto`.`concepto` AS `concepto`,`cuentas`.`costo` AS `costo`,`cuentas`.`abono` AS `abono`,`cuentas`.`desde` AS `desde`,`cuentas`.`hasta` AS `hasta`,`cuentas`.`pagado` AS `pagado` from ((`cuentas` join `propietarios_villas` on((`cuentas`.`id_unir` = `propietarios_villas`.`id_unir`))) join `concepto` on((`cuentas`.`id_concepto` = `concepto`.`id_concepto`)));

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `donar_recibir_villa` (`id_propietario`,`id_villa`,`villa`,`cont_eeh`,`habitaciones`,`condicion`,`modelo`) AS select `propietarios_villas`.`id_propietario` AS `id_propietario`,`villas`.`id_villa` AS `id_villa`,concat(`grupo_villa`.`grupo`,'-',`villas`.`numero`) AS `villa`,`villas`.`cont_eeh` AS `cont_eeh`,`villas`.`habitaciones` AS `habitaciones`,`condicion_villas`.`condicion` AS `condicion`,`modelo_villa`.`modelo` AS `modelo` from ((((`propietarios_villas` join `villas` on((`propietarios_villas`.`id_villa` = `villas`.`id_villa`))) join `grupo_villa` on((`villas`.`id_grupo` = `grupo_villa`.`id_grupo`))) join `condicion_villas` on((`villas`.`id_condicion` = `condicion_villas`.`id_condicion`))) join `modelo_villa` on((`villas`.`id_modelo` = `modelo_villa`.`id_modelo`)));

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `factura_completa_reimprimir` AS select `multi_pago`.`codigo_pago` AS `codigo_pago`,`multi_pago`.`id_unir` AS `id_unir`,`concepto`.`concepto` AS `concepto`,`cuentas`.`codigo` AS `codigo`,`cuentas`.`abono` AS `abono`,`cuentas`.`desde` AS `desde`,`cuentas`.`hasta` AS `hasta`,`forma_pago`.`tipo_pago` AS `tipo_pago`,`forma_pago`.`forma_pago` AS `forma_pago`,`forma_pago`.`n_referencia` AS `n_referencia`,`multi_pago`.`fecha_pago` AS `fecha_pago`,`multi_pago`.`total_pago` AS `total_pago`,`multi_pago`.`cantidad_recibida` AS `cantidad_recibida`,`multi_pago`.`cantidad_devuelta` AS `cantidad_devuelta` from (((`cuentas` join `forma_pago` on((`cuentas`.`id_cuenta` = `forma_pago`.`id_cuenta`))) join `multi_pago` on((`cuentas`.`id_cuenta` = `multi_pago`.`id_cuenta`))) join `concepto` on((`cuentas`.`id_concepto` = `concepto`.`id_concepto`)));

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pripietario_cuenta_vista` (`id_unir`,`villa`,`nombre`,`dni`,`telefono`,`id_estado`) AS select `propietarios_villas`.`id_unir` AS `id_unir`,concat(`grupo_villa`.`grupo`,'-',`villas`.`numero`) AS `villa`,`propietarios`.`nombre` AS `nombre`,`propietarios`.`dni` AS `dni`,`propietarios`.`telefono` AS `telefono`,`propietarios`.`id_estado` AS `id_estado` from (((`propietarios_villas` join `propietarios` on((`propietarios_villas`.`id_propietario` = `propietarios`.`id_propietario`))) join `villas` on((`propietarios_villas`.`id_villa` = `villas`.`id_villa`))) join `grupo_villa` on((`villas`.`id_grupo` = `grupo_villa`.`id_grupo`)));

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `propietario_principal` (`id_unir`,`id_propietario`,`id_villa`,`villa`,`cont_eeh`,`nombre`,`dni`,`telefono`,`correo`) AS select `propietarios_villas`.`id_unir` AS `id_unir`,`propietarios_villas`.`id_propietario` AS `id_propietario`,`propietarios_villas`.`id_villa` AS `id_villa`,concat(`grupo_villa`.`grupo`,'-',`villas`.`numero`) AS `villa`,`villas`.`cont_eeh` AS `cont_eeh`,`propietarios`.`nombre` AS `nombre`,`propietarios`.`dni` AS `dni`,`propietarios`.`telefono` AS `telefono`,`propietarios`.`correo` AS `correo` from (((`propietarios_villas` join `propietarios` on((`propietarios_villas`.`id_propietario` = `propietarios`.`id_propietario`))) join `villas` on((`propietarios_villas`.`id_villa` = `villas`.`id_villa`))) join `grupo_villa` on((`villas`.`id_grupo` = `grupo_villa`.`id_grupo`)));

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tomar_desde_hasta` AS select `pripietario_cuenta_vista`.`id_unir` AS `id_unir`,`pripietario_cuenta_vista`.`villa` AS `villa` from `pripietario_cuenta_vista` order by substring_index(`pripietario_cuenta_vista`.`villa`,'-',1),cast(substring_index(`pripietario_cuenta_vista`.`villa`,'-',-(1)) as unsigned);

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ultimas_villas` AS select `villas`.`id_villa` AS `id_villa`,concat(`grupo_villa`.`grupo`,'-',`villas`.`numero`) AS `codigo`,`modelo_villa`.`modelo` AS `modelo`,`condicion_villas`.`condicion` AS `condicion`,`estado_villa`.`estado` AS `estado` from ((((`villas` join `estado_villa` on((`villas`.`id_estado` = `estado_villa`.`id_estado`))) join `grupo_villa` on((`villas`.`id_grupo` = `grupo_villa`.`id_grupo`))) join `condicion_villas` on((`villas`.`id_condicion` = `condicion_villas`.`id_condicion`))) join `modelo_villa` on((`villas`.`id_modelo` = `modelo_villa`.`id_modelo`)));

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ver_cuentas_pagadas` AS select `multi_pago`.`codigo_pago` AS `codigo_pago`,`concepto`.`concepto` AS `concepto`,`multi_pago`.`fecha_pago` AS `fecha_pago`,`multi_pago`.`id_unir` AS `id_unir` from ((`concepto` join `cuentas` on((`concepto`.`id_concepto` = `cuentas`.`id_concepto`))) join `multi_pago` on((`cuentas`.`id_cuenta` = `multi_pago`.`id_cuenta`)));

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `villa_completo` (`id_villa`,`villas`,`cont_eeh`,`habitaciones`,`lote`,`modelo`,`condicion`,`id_estado`) AS select `villas`.`id_villa` AS `id_villa`,concat(`grupo_villa`.`grupo`,'-',`villas`.`numero`) AS `villas`,`villas`.`cont_eeh` AS `cont_eeh`,`villas`.`habitaciones` AS `habitaciones`,`villas`.`lote` AS `lote`,`modelo_villa`.`modelo` AS `modelo`,`condicion_villas`.`condicion` AS `condicion`,`villas`.`id_estado` AS `id_estado` from (((`villas` join `grupo_villa` on((`villas`.`id_grupo` = `grupo_villa`.`id_grupo`))) join `modelo_villa` on((`villas`.`id_modelo` = `modelo_villa`.`id_modelo`))) join `condicion_villas` on((`villas`.`id_condicion` = `condicion_villas`.`id_condicion`)));

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_usuario` AS select `usuarios`.`id_usuario` AS `id_usuario`,`usuarios`.`usuario` AS `usuario`,concat(`usuarios`.`nombre`,' ',`usuarios`.`apellido`) AS `nombre`,`usuarios`.`dni` AS `dni`,`usuarios`.`telefono` AS `telefono`,`usuarios`.`correo` AS `correo`,`permisos`.`acceso` AS `acceso`,`usuarios`.`clave` AS `clave`,`estado_usuario`.`estado` AS `estado`,`usuarios`.`nombre` AS `nom`,`usuarios`.`apellido` AS `ape`,`acceso_usuario`.`imprimir_reportes` AS `imprimir_reportes`,`acceso_usuario`.`modificar_reportes` AS `modificar_reportes`,`acceso_usuario`.`eliminar_reportes` AS `eliminar_reportes` from (((`acceso_usuario` join `usuarios` on((`acceso_usuario`.`id_usuario` = `usuarios`.`id_usuario`))) join `permisos` on((`usuarios`.`id_acceso` = `permisos`.`id_acceso`))) join `estado_usuario` on((`usuarios`.`id_estado` = `estado_usuario`.`id_estado`)));

INSERT INTO `acceso_usuario` (`id_acceso_usuario`, `id_usuario`, `imprimir_reportes`, `modificar_reportes`, `eliminar_reportes`) VALUES ('1', '6', 'no', 'si', 'no');
INSERT INTO `acceso_usuario` (`id_acceso_usuario`, `id_usuario`, `imprimir_reportes`, `modificar_reportes`, `eliminar_reportes`) VALUES ('2', '7', 'no', 'no', 'no');
INSERT INTO `acceso_usuario` (`id_acceso_usuario`, `id_usuario`, `imprimir_reportes`, `modificar_reportes`, `eliminar_reportes`) VALUES ('3', '2', 'si', 'si', 'si');
INSERT INTO `acceso_usuario` (`id_acceso_usuario`, `id_usuario`, `imprimir_reportes`, `modificar_reportes`, `eliminar_reportes`) VALUES ('4', '8', 'si', 'si', 'si');
INSERT INTO `acceso_usuario` (`id_acceso_usuario`, `id_usuario`, `imprimir_reportes`, `modificar_reportes`, `eliminar_reportes`) VALUES ('5', '9', 'no', 'si', 'no');
INSERT INTO `acceso_usuario` (`id_acceso_usuario`, `id_usuario`, `imprimir_reportes`, `modificar_reportes`, `eliminar_reportes`) VALUES ('6', '10', 'si', 'si', 'si');
INSERT INTO `acceso_usuario` (`id_acceso_usuario`, `id_usuario`, `imprimir_reportes`, `modificar_reportes`, `eliminar_reportes`) VALUES ('7', '11', 'si', 'si', 'si');
INSERT INTO `acceso_usuario` (`id_acceso_usuario`, `id_usuario`, `imprimir_reportes`, `modificar_reportes`, `eliminar_reportes`) VALUES ('8', '12', 'si', 'no', 'si');


INSERT INTO `concepto` (`id_concepto`, `concepto`, `tipo`, `valor`, `referencia`, `id_estado`) VALUES ('1', 'MANTENIMIENTO', 'Abono', '250', 'No', '1');
INSERT INTO `concepto` (`id_concepto`, `concepto`, `tipo`, `valor`, `referencia`, `id_estado`) VALUES ('2', 'PAGO MENSUAL', 'Cargo', '0', 'Si', '1');
INSERT INTO `concepto` (`id_concepto`, `concepto`, `tipo`, `valor`, `referencia`, `id_estado`) VALUES ('3', 'AGUA', 'Abono', '160', 'No', '1');
INSERT INTO `concepto` (`id_concepto`, `concepto`, `tipo`, `valor`, `referencia`, `id_estado`) VALUES ('4', 'LUZ', 'Abono', '160', 'No', '1');
INSERT INTO `concepto` (`id_concepto`, `concepto`, `tipo`, `valor`, `referencia`, `id_estado`) VALUES ('5', 'FACTURA', 'Cargo', '0', 'Si', '1');
INSERT INTO `concepto` (`id_concepto`, `concepto`, `tipo`, `valor`, `referencia`, `id_estado`) VALUES ('6', 'GAS', 'Abono', '200', 'No', '1');
INSERT INTO `concepto` (`id_concepto`, `concepto`, `tipo`, `valor`, `referencia`, `id_estado`) VALUES ('7', 'INTERNET', 'Abono', '70', 'No', '1');
INSERT INTO `concepto` (`id_concepto`, `concepto`, `tipo`, `valor`, `referencia`, `id_estado`) VALUES ('8', 'MUEBLES', 'Abono', '90.05', 'No', '1');
INSERT INTO `concepto` (`id_concepto`, `concepto`, `tipo`, `valor`, `referencia`, `id_estado`) VALUES ('9', 'REPARACION', 'Cargo', '0', 'Si', '1');

INSERT INTO `condicion_villas` (`id_condicion`, `condicion`) VALUES ('1', 'Buen estado');
INSERT INTO `condicion_villas` (`id_condicion`, `condicion`) VALUES ('2', 'Mantenimiento');
INSERT INTO `condicion_villas` (`id_condicion`, `condicion`) VALUES ('3', 'Deshabilitado');


INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('1', '19', '1', '160', '0', '2024-07-22', '2024-09-22', 'No pagado', '1000000');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('2', '19', '1', '160', '0', '2024-07-24', '2024-07-24', 'No pagado', '1000001');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('3', '15', '1', '0', '160', '2024-07-27', '2024-10-27', 'No pagado', '1000002');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('4', '15', '1', '0', '160', '2024-07-28', '2024-08-28', 'No pagado', '1000003');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('5', '15', '1', '0', '160', '2024-07-29', '2024-08-29', 'No pagado', '1000004');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('6', '14', '1', '0', '160', '2024-07-29', '2024-08-29', 'No pagado', '1000004');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('7', '19', '1', '0', '160', '2024-07-29', '2024-08-29', 'No pagado', '1000004');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('8', '15', '1', '0', '160', '2024-07-29', '2024-07-29', 'No pagado', '1000005');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('9', '14', '1', '0', '160', '2024-07-29', '2024-07-29', 'No pagado', '1000005');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('10', '19', '1', '0', '160', '2024-07-29', '2024-07-29', 'No pagado', '1000005');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('11', '15', '1', '0', '160', '2024-07-29', '2024-07-29', 'No pagado', '1000006');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('12', '15', '1', '160', '0', '2024-07-29', '2024-09-29', 'No pagado', '1000007');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('13', '14', '1', '160', '0', '2024-07-29', '2024-09-29', 'No pagado', '1000008');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('14', '19', '1', '160', '0', '2024-07-29', '2024-09-29', 'No pagado', '1000009');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('15', '15', '1', '160', '0', '2024-07-30', '2024-07-30', 'No pagado', '1000010');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('16', '14', '1', '160', '0', '2024-07-30', '2024-07-30', 'No pagado', '1000011');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('17', '19', '1', '160', '0', '2024-07-30', '2024-07-30', 'No pagado', '1000012');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('18', '15', '1', '160', '0', '2024-07-30', '2024-07-30', 'No pagado', '1000013');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('19', '14', '1', '160', '0', '2024-07-30', '2024-07-30', 'No pagado', '1000014');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('20', '19', '1', '160', '0', '2024-07-30', '2024-07-30', 'No pagado', '1000015');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('21', '15', '1', '160', '0', '2024-07-30', '2024-07-30', 'No pagado', '1000016');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('22', '14', '1', '160', '0', '2024-07-30', '2024-07-30', 'No pagado', '1000017');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('23', '19', '1', '160', '0', '2024-07-30', '2024-07-30', 'No pagado', '1000018');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('24', '10', '1', '0', '160', '2024-07-30', '2024-07-30', 'Pagado', '1000019');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('25', '10', '1', '160', '0', '2024-07-30', '2024-07-30', 'No pagado', '1000020');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('26', '16', '1', '0', '0', '2024-07-30', '2024-07-30', 'Pagado', '1000021');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('27', '16', '1', '0', '0', '2024-07-30', '2024-07-30', 'Pagado', '1000022');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('28', '16', '1', '0', '100', '2024-07-30', '2024-07-30', 'Pagado', '1000023');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('29', '15', '1', '480', '0', '2024-07-30', '2024-07-30', 'No pagado', '1000024');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('30', '15', '1', '480', '0', '2024-07-30', '2031-09-30', 'No pagado', '1000025');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('31', '27', '3', '320', '0', '2024-08-02', '2024-10-02', 'Pagado', '1000026');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('32', '30', '3', '0', '0', '2024-08-02', '2024-09-02', 'Pagado', '1000027');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('33', '27', '1', '160', '0', '2024-08-03', '2024-08-03', 'Pagado', '1000028');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('34', '27', '1', '-40', '0', '2024-08-03', '2024-08-03', 'Pagado', '1000029');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('35', '27', '1', '0', '0', '2024-08-02', '2024-10-02', 'Pagado', '1000030');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('36', '27', '1', '100', '0', '2024-08-02', '2024-08-02', 'Pagado', '1000031');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('37', '27', '3', '0', '0', '2024-08-02', '2024-10-02', 'Pagado', '1000032');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('38', '27', '1', '100', '0', '2024-08-02', '2024-10-02', 'Pagado', '1000033');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('39', '19', '3', '320', '0', '2024-08-03', '2024-10-03', 'No pagado', '1000034');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('40', '25', '3', '320', '0', '2024-08-03', '2024-10-03', 'No pagado', '1000035');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('41', '26', '3', '320', '0', '2024-08-03', '2024-10-03', 'No pagado', '1000036');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('42', '28', '3', '320', '0', '2024-08-03', '2024-10-03', 'No pagado', '1000037');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('43', '19', '4', '480', '0', '2024-08-03', '2024-11-03', 'No pagado', '1000038');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('44', '25', '4', '480', '0', '2024-08-03', '2024-11-03', 'No pagado', '1000039');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('45', '26', '4', '480', '0', '2024-08-03', '2024-11-03', 'No pagado', '1000040');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('46', '28', '4', '480', '0', '2024-08-03', '2024-11-03', 'No pagado', '1000041');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('47', '27', '4', '100', '0', '2024-08-05', '2024-09-05', 'Pagado', '1000042');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('48', '27', '4', '200', '0', '2024-08-05', '2024-10-05', 'Pagado', '1000043');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('49', '30', '4', '0', '0', '2024-08-05', '2024-10-05', 'Pagado', '1000044');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('50', '29', '4', '0', '0', '2024-08-05', '2024-10-05', 'Pagado', '1000045');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('51', '37', '4', '320', '0', '2024-08-05', '2024-10-05', 'No pagado', '1000046');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('52', '15', '4', '320', '0', '2024-08-05', '2024-10-05', 'No pagado', '1000047');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('53', '31', '4', '320', '0', '2024-08-05', '2024-10-05', 'No pagado', '1000048');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('54', '32', '4', '320', '0', '2024-08-05', '2024-10-05', 'No pagado', '1000049');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('55', '34', '4', '320', '0', '2024-08-05', '2024-10-05', 'No pagado', '1000050');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('56', '14', '4', '320', '0', '2024-08-05', '2024-10-05', 'No pagado', '1000051');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('57', '19', '4', '320', '0', '2024-08-05', '2024-10-05', 'No pagado', '1000052');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('58', '25', '4', '320', '0', '2024-08-05', '2024-10-05', 'No pagado', '1000053');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('59', '26', '4', '320', '0', '2024-08-05', '2024-10-05', 'No pagado', '1000054');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('60', '28', '4', '320', '0', '2024-08-05', '2024-10-05', 'No pagado', '1000055');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('61', '27', '4', '0', '0', '2024-08-05', '2024-12-05', 'Pagado', '1000056');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('62', '30', '4', '0', '0', '2024-08-05', '2024-12-05', 'Pagado', '1000057');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('63', '29', '4', '0', '0', '2024-08-05', '2024-12-05', 'Pagado', '1000058');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('64', '37', '4', '640', '0', '2024-08-05', '2024-12-05', 'No pagado', '1000059');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('65', '15', '4', '640', '0', '2024-08-05', '2024-12-05', 'No pagado', '1000060');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('66', '31', '4', '640', '0', '2024-08-05', '2024-12-05', 'No pagado', '1000061');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('67', '32', '4', '640', '0', '2024-08-05', '2024-12-05', 'No pagado', '1000062');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('68', '34', '4', '640', '0', '2024-08-05', '2024-12-05', 'No pagado', '1000063');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('69', '14', '4', '640', '0', '2024-08-05', '2024-12-05', 'No pagado', '1000064');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('70', '19', '4', '640', '0', '2024-08-05', '2024-12-05', 'No pagado', '1000065');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('71', '25', '4', '640', '0', '2024-08-05', '2024-12-05', 'No pagado', '1000066');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('72', '26', '4', '640', '0', '2024-08-05', '2024-12-05', 'No pagado', '1000067');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('73', '28', '4', '640', '0', '2024-08-05', '2024-12-05', 'No pagado', '1000068');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('74', '27', '4', '0', '0', '2024-08-06', '2024-10-06', 'Pagado', '1000069');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('75', '30', '4', '320', '0', '2024-08-06', '2024-10-06', 'No pagado', '1000070');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('76', '29', '4', '0', '0', '2024-08-06', '2024-10-06', 'Pagado', '1000071');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('77', '16', '6', '0', '0', '2024-08-09', '2024-09-09', 'Pagado', '1000072');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('78', '16', '4', '0', '0', '2024-08-09', '2024-09-09', 'Pagado', '1000073');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('79', '16', '3', '0', '0', '2024-08-09', '2024-09-09', 'Pagado', '1000074');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('80', '16', '1', '0', '0', '2024-08-09', '2024-09-09', 'Pagado', '1000075');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('81', '27', '3', '0', '0', '2024-08-12', '2024-10-12', 'Pagado', '1000076');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('82', '30', '3', '0', '320', '2024-08-12', '2024-10-12', 'Pagado', '1000077');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('83', '29', '3', '320', '0', '2024-08-12', '2024-10-12', 'No pagado', '1000078');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('84', '37', '3', '320', '0', '2024-08-12', '2024-10-12', 'No pagado', '1000079');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('85', '15', '3', '320', '0', '2024-08-12', '2024-10-12', 'No pagado', '1000080');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('86', '31', '3', '0', '320', '2024-08-12', '2024-10-12', 'Pagado', '1000081');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('87', '32', '3', '320', '0', '2024-08-12', '2024-10-12', 'No pagado', '1000082');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('88', '34', '3', '320', '0', '2024-08-12', '2024-10-12', 'No pagado', '1000083');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('89', '14', '3', '320', '0', '2024-08-12', '2024-10-12', 'No pagado', '1000084');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('90', '13', '6', '800', '0', '2024-08-12', '2024-12-12', 'No pagado', '1000085');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('91', '38', '3', '800', '0', '2024-08-12', '2025-01-12', 'No pagado', '1000086');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('92', '13', '1', '1500', '0', '2024-08-12', '2025-02-12', 'No pagado', '1000087');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('93', '13', '1', '1500', '0', '2024-08-12', '2025-02-12', 'No pagado', '1000088');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('94', '13', '1', '1500', '0', '2024-08-12', '2025-02-12', 'No pagado', '1000089');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('95', '13', '1', '1500', '0', '2024-08-12', '2025-02-12', 'No pagado', '1000090');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('96', '16', '1', '0', '0', '2024-08-12', '2024-09-12', 'Pagado', '1000091');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('97', '16', '1', '0', '250', '2024-07-30', '2024-08-30', 'Pagado', '1000092');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('98', '16', '1', '0', '300', '2024-07-30', '2024-08-30', 'Pagado', '1000093');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('99', '16', '1', '250', '0', '2024-07-30', '2024-08-30', 'No pagado', '1000094');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('100', '27', '1', '0', '250', '2024-08-13', '2024-08-13', 'Pagado', '1000095');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('101', '27', '3', '0', '260', '2024-08-13', '2024-08-13', 'Pagado', '1000096');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('102', '27', '4', '0', '1', '2024-08-13', '2024-09-13', 'Pagado', '1000097');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('103', '27', '4', '0', '200', '2024-08-13', '2024-08-13', 'Pagado', '1000098');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('104', '27', '4', '0', '500', '2024-08-13', '2024-08-13', 'Pagado', '1000099');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('105', '27', '8', '90.05', '0', '2024-08-14', '2024-08-14', 'No pagado', '1000100');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('106', '27', '3', '320', '0', '2024-08-17', '2024-10-17', 'No pagado', '1000101');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES ('107', '39', '8', '0', '180.05', '2024-08-21', '2024-09-21', 'Pagado', '1000102');

INSERT INTO `estado_concepto` (`id_estado`, `estado`) VALUES ('1', 'activo');
INSERT INTO `estado_concepto` (`id_estado`, `estado`) VALUES ('2', 'desactivado');

INSERT INTO `estado_grupo_villa` (`id_estado`, `estado`) VALUES ('1', 'activo');
INSERT INTO `estado_grupo_villa` (`id_estado`, `estado`) VALUES ('2', 'desactivado');

INSERT INTO `estado_modelos` (`id_estado`, `estado`) VALUES ('1', 'activo');
INSERT INTO `estado_modelos` (`id_estado`, `estado`) VALUES ('2', 'desactivado');

INSERT INTO `estado_moneda` (`id_estado`, `estado`) VALUES ('1', 'activo');
INSERT INTO `estado_moneda` (`id_estado`, `estado`) VALUES ('2', 'desactivado');

INSERT INTO `estado_multipago` (`id_estado`, `estado`) VALUES ('1', 'activo');
INSERT INTO `estado_multipago` (`id_estado`, `estado`) VALUES ('2', 'desactivado');

INSERT INTO `estado_pago` (`id_estado`, `estado`) VALUES ('1', 'activo');
INSERT INTO `estado_pago` (`id_estado`, `estado`) VALUES ('2', 'desactivado');

INSERT INTO `estado_propietario` (`id_estado`, `estado`) VALUES ('1', 'activo');
INSERT INTO `estado_propietario` (`id_estado`, `estado`) VALUES ('2', 'desactivado');

INSERT INTO `estado_usuario` (`id_estado`, `estado`) VALUES ('1', 'Activo');
INSERT INTO `estado_usuario` (`id_estado`, `estado`) VALUES ('2', 'Suspendido');

INSERT INTO `estado_villa` (`id_estado`, `estado`) VALUES ('1', 'Disponible');
INSERT INTO `estado_villa` (`id_estado`, `estado`) VALUES ('2', 'Habitado');
INSERT INTO `estado_villa` (`id_estado`, `estado`) VALUES ('3', 'No disponible');

INSERT INTO `forma_de_pago` (`id_pago`, `pago`, `id_estado`) VALUES ('1', 'Efectivo', '1');
INSERT INTO `forma_de_pago` (`id_pago`, `pago`, `id_estado`) VALUES ('2', 'Cheque', '1');
INSERT INTO `forma_de_pago` (`id_pago`, `pago`, `id_estado`) VALUES ('3', 'Tarjeta', '1');

INSERT INTO `forma_pago` (`id_forma`, `id_cuenta`, `tipo_pago`, `forma_pago`, `n_referencia`) VALUES ('1', '78', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `forma_pago` (`id_forma`, `id_cuenta`, `tipo_pago`, `forma_pago`, `n_referencia`) VALUES ('2', '78', 'Referencia', 'Deposito', '956030201050');
INSERT INTO `forma_pago` (`id_forma`, `id_cuenta`, `tipo_pago`, `forma_pago`, `n_referencia`) VALUES ('3', '78', 'Referencia', 'Deposito', '909060302010');
INSERT INTO `forma_pago` (`id_forma`, `id_cuenta`, `tipo_pago`, `forma_pago`, `n_referencia`) VALUES ('4', '27', 'Referencia', 'Deposito', '906030303010');
INSERT INTO `forma_pago` (`id_forma`, `id_cuenta`, `tipo_pago`, `forma_pago`, `n_referencia`) VALUES ('5', '78', 'Referencia', 'Tarjeta de crédito', '82222222222222');
INSERT INTO `forma_pago` (`id_forma`, `id_cuenta`, `tipo_pago`, `forma_pago`, `n_referencia`) VALUES ('6', '79', 'Referencia', 'Tarjeta de débito', '888888888888888');
INSERT INTO `forma_pago` (`id_forma`, `id_cuenta`, `tipo_pago`, `forma_pago`, `n_referencia`) VALUES ('7', '81', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `forma_pago` (`id_forma`, `id_cuenta`, `tipo_pago`, `forma_pago`, `n_referencia`) VALUES ('8', '81', 'Referencia', 'Tarjeta de débito', '8888888888888888888');
INSERT INTO `forma_pago` (`id_forma`, `id_cuenta`, `tipo_pago`, `forma_pago`, `n_referencia`) VALUES ('9', '80', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `forma_pago` (`id_forma`, `id_cuenta`, `tipo_pago`, `forma_pago`, `n_referencia`) VALUES ('10', '96', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `forma_pago` (`id_forma`, `id_cuenta`, `tipo_pago`, `forma_pago`, `n_referencia`) VALUES ('11', '99', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `forma_pago` (`id_forma`, `id_cuenta`, `tipo_pago`, `forma_pago`, `n_referencia`) VALUES ('12', '99', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `forma_pago` (`id_forma`, `id_cuenta`, `tipo_pago`, `forma_pago`, `n_referencia`) VALUES ('13', '28', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `forma_pago` (`id_forma`, `id_cuenta`, `tipo_pago`, `forma_pago`, `n_referencia`) VALUES ('14', '28', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `forma_pago` (`id_forma`, `id_cuenta`, `tipo_pago`, `forma_pago`, `n_referencia`) VALUES ('15', '28', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `forma_pago` (`id_forma`, `id_cuenta`, `tipo_pago`, `forma_pago`, `n_referencia`) VALUES ('16', '98', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `forma_pago` (`id_forma`, `id_cuenta`, `tipo_pago`, `forma_pago`, `n_referencia`) VALUES ('17', '98', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `forma_pago` (`id_forma`, `id_cuenta`, `tipo_pago`, `forma_pago`, `n_referencia`) VALUES ('18', '98', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `forma_pago` (`id_forma`, `id_cuenta`, `tipo_pago`, `forma_pago`, `n_referencia`) VALUES ('19', '97', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `forma_pago` (`id_forma`, `id_cuenta`, `tipo_pago`, `forma_pago`, `n_referencia`) VALUES ('20', '97', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `forma_pago` (`id_forma`, `id_cuenta`, `tipo_pago`, `forma_pago`, `n_referencia`) VALUES ('21', '101', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `forma_pago` (`id_forma`, `id_cuenta`, `tipo_pago`, `forma_pago`, `n_referencia`) VALUES ('22', '100', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `forma_pago` (`id_forma`, `id_cuenta`, `tipo_pago`, `forma_pago`, `n_referencia`) VALUES ('23', '102', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `forma_pago` (`id_forma`, `id_cuenta`, `tipo_pago`, `forma_pago`, `n_referencia`) VALUES ('24', '102', 'Referencia', 'Deposito', '7444444444444444444444');
INSERT INTO `forma_pago` (`id_forma`, `id_cuenta`, `tipo_pago`, `forma_pago`, `n_referencia`) VALUES ('25', '102', 'Referencia', 'Tarjeta de crédito', '7444444444444444444444');
INSERT INTO `forma_pago` (`id_forma`, `id_cuenta`, `tipo_pago`, `forma_pago`, `n_referencia`) VALUES ('26', '102', 'Referencia', 'Tarjeta de crédito', '7444444444444444444444');
INSERT INTO `forma_pago` (`id_forma`, `id_cuenta`, `tipo_pago`, `forma_pago`, `n_referencia`) VALUES ('27', '102', 'Referencia', 'Tarjeta de crédito', '7444444444444444444444');
INSERT INTO `forma_pago` (`id_forma`, `id_cuenta`, `tipo_pago`, `forma_pago`, `n_referencia`) VALUES ('28', '102', 'Referencia', 'Tarjeta de crédito', '7444444444444444444444');
INSERT INTO `forma_pago` (`id_forma`, `id_cuenta`, `tipo_pago`, `forma_pago`, `n_referencia`) VALUES ('29', '102', 'Referencia', 'Tarjeta de crédito', '7444444444444444444444');
INSERT INTO `forma_pago` (`id_forma`, `id_cuenta`, `tipo_pago`, `forma_pago`, `n_referencia`) VALUES ('30', '102', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `forma_pago` (`id_forma`, `id_cuenta`, `tipo_pago`, `forma_pago`, `n_referencia`) VALUES ('31', '103', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `forma_pago` (`id_forma`, `id_cuenta`, `tipo_pago`, `forma_pago`, `n_referencia`) VALUES ('32', '103', 'Referencia', 'Tarjeta de crédito', '7777777777777');
INSERT INTO `forma_pago` (`id_forma`, `id_cuenta`, `tipo_pago`, `forma_pago`, `n_referencia`) VALUES ('33', '104', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `forma_pago` (`id_forma`, `id_cuenta`, `tipo_pago`, `forma_pago`, `n_referencia`) VALUES ('34', '104', 'Referencia', 'Deposito', '888888888888888888888');
INSERT INTO `forma_pago` (`id_forma`, `id_cuenta`, `tipo_pago`, `forma_pago`, `n_referencia`) VALUES ('35', '107', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `forma_pago` (`id_forma`, `id_cuenta`, `tipo_pago`, `forma_pago`, `n_referencia`) VALUES ('36', '107', 'Referencia', 'Deposito', '8000000000000');
INSERT INTO `forma_pago` (`id_forma`, `id_cuenta`, `tipo_pago`, `forma_pago`, `n_referencia`) VALUES ('37', '82', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `forma_pago` (`id_forma`, `id_cuenta`, `tipo_pago`, `forma_pago`, `n_referencia`) VALUES ('38', '86', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `forma_pago` (`id_forma`, `id_cuenta`, `tipo_pago`, `forma_pago`, `n_referencia`) VALUES ('39', '24', 'Efectivo', 'Físico', 'Ninguna');

INSERT INTO `grupo_villa` (`id_grupo`, `grupo`, `id_estado`) VALUES ('1', 'A', '1');
INSERT INTO `grupo_villa` (`id_grupo`, `grupo`, `id_estado`) VALUES ('2', 'B', '1');
INSERT INTO `grupo_villa` (`id_grupo`, `grupo`, `id_estado`) VALUES ('3', 'C', '1');
INSERT INTO `grupo_villa` (`id_grupo`, `grupo`, `id_estado`) VALUES ('4', 'D', '1');
INSERT INTO `grupo_villa` (`id_grupo`, `grupo`, `id_estado`) VALUES ('5', 'Z', '2');
INSERT INTO `grupo_villa` (`id_grupo`, `grupo`, `id_estado`) VALUES ('6', 'K', '2');
INSERT INTO `grupo_villa` (`id_grupo`, `grupo`, `id_estado`) VALUES ('7', 'E', '2');
INSERT INTO `grupo_villa` (`id_grupo`, `grupo`, `id_estado`) VALUES ('8', 'F', '2');
INSERT INTO `grupo_villa` (`id_grupo`, `grupo`, `id_estado`) VALUES ('9', 'G', '2');
INSERT INTO `grupo_villa` (`id_grupo`, `grupo`, `id_estado`) VALUES ('10', 'G', '2');
INSERT INTO `grupo_villa` (`id_grupo`, `grupo`, `id_estado`) VALUES ('11', 'G', '2');
INSERT INTO `grupo_villa` (`id_grupo`, `grupo`, `id_estado`) VALUES ('12', 'G', '2');
INSERT INTO `grupo_villa` (`id_grupo`, `grupo`, `id_estado`) VALUES ('13', 'G', '2');
INSERT INTO `grupo_villa` (`id_grupo`, `grupo`, `id_estado`) VALUES ('14', 'G', '2');
INSERT INTO `grupo_villa` (`id_grupo`, `grupo`, `id_estado`) VALUES ('15', 'K', '2');
INSERT INTO `grupo_villa` (`id_grupo`, `grupo`, `id_estado`) VALUES ('16', 'Z', '1');

INSERT INTO `modelo_villa` (`id_modelo`, `modelo`, `id_estado`) VALUES ('1', 'VILLA CAREY', '1');
INSERT INTO `modelo_villa` (`id_modelo`, `modelo`, `id_estado`) VALUES ('2', 'VILLA ARRECIFE', '1');
INSERT INTO `modelo_villa` (`id_modelo`, `modelo`, `id_estado`) VALUES ('3', 'VILLA ESTRELLA', '1');

INSERT INTO `moneda` (`id_moneda`, `nombre`, `simbolo`, `valor`, `id_estado`) VALUES ('1', 'LEMPIRA', 'L.', '24', '1');
INSERT INTO `moneda` (`id_moneda`, `nombre`, `simbolo`, `valor`, `id_estado`) VALUES ('2', 'EURO', 'E', '28', '1');

INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`) VALUES ('4', '2000000', '19', '1', '2024-07-24', '160', '200', '40', '1', '1', '2');
INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`) VALUES ('5', '2000001', '19', '2', '2024-07-25', '160', '200', '40', '1', '1', '2');
INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`) VALUES ('7', '2000002', '27', '31', '2024-08-02', '320', '500', '180', '1', '1', '2');
INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`) VALUES ('8', '2000003', '27', '34', '2024-08-02', '160', '200', '40', '1', '1', '2');
INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`) VALUES ('9', '2000004', '30', '32', '2024-08-02', '160', '200', '40', '1', '1', '2');
INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`) VALUES ('10', '2000005', '27', '33', '2024-08-02', '1440', '2000', '560', '1', '1', '2');
INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`) VALUES ('11', '2000005', '27', '35', '2024-08-02', '1440', '2000', '560', '1', '1', '2');
INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`) VALUES ('12', '2000005', '27', '36', '2024-08-02', '1440', '2000', '560', '1', '1', '2');
INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`) VALUES ('13', '2000005', '27', '37', '2024-08-02', '1440', '2000', '560', '1', '1', '2');
INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`) VALUES ('14', '2000005', '27', '38', '2024-08-02', '1440', '2000', '560', '1', '1', '2');
INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`) VALUES ('15', '2000006', '19', '43', '2024-08-03', '480', '500', '20', '1', '1', '2');
INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`) VALUES ('16', '2000007', '25', '44', '2024-08-03', '480', '500', '20', '1', '1', '2');
INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`) VALUES ('17', '2000008', '25', '40', '2024-08-03', '320', '500', '180', '1', '1', '2');
INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`) VALUES ('18', '2000009', '19', '23', '2024-08-03', '160', '200', '40', '1', '1', '2');
INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`) VALUES ('19', '2000010', '19', '20', '2024-08-03', '160', '200', '40', '1', '1', '2');
INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`) VALUES ('20', '2000010', '19', '7', '2024-08-03', '160', '200', '40', '1', '1', '2');
INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`) VALUES ('21', '2000010', '19', '10', '2024-08-03', '160', '200', '40', '1', '1', '2');
INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`) VALUES ('22', '2000010', '19', '14', '2024-08-03', '160', '200', '40', '1', '1', '2');
INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`) VALUES ('23', '2000010', '19', '17', '2024-08-03', '160', '200', '40', '1', '1', '2');
INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`) VALUES ('24', '2000010', '19', '39', '2024-08-03', '160', '200', '40', '1', '1', '2');
INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`) VALUES ('25', '2000011', '16', '27', '2024-08-05', '160', '200', '40', '1', '1', '2');
INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`) VALUES ('26', '2000012', '16', '28', '2024-08-05', '160', '200', '40', '1', '1', '2');
INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`) VALUES ('27', '2000013', '27', '47', '2024-08-06', '160', '200', '40', '1', '1', '2');
INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`) VALUES ('28', '2000014', '27', '48', '2024-08-06', '320', '500', '180', '1', '1', '2');
INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`) VALUES ('29', '2000015', '27', '61', '2024-08-06', '640', '800', '160', '1', '1', '2');
INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`) VALUES ('30', '2000016', '27', '31', '2024-08-06', '320', '500', '180', '1', '1', '2');
INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`) VALUES ('31', '2000017', '27', '33', '2024-08-07', '160', '200', '40', '1', '1', '2');
INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`) VALUES ('32', '2000018', '27', '34', '2024-08-07', '160', '200', '40', '1', '1', '2');
INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`) VALUES ('33', '2000019', '27', '34', '2024-08-07', '160', '200', '40', '1', '1', '2');
INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`) VALUES ('34', '2000020', '27', '35', '2024-08-07', '320', '500', '180', '1', '1', '2');
INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`) VALUES ('35', '2000020', '27', '36', '2024-08-07', '320', '220', '-100', '1', '1', '2');
INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`) VALUES ('36', '2000021', '27', '37', '2024-08-07', '320', '400', '80', '1', '1', '2');
INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`) VALUES ('37', '2000021', '27', '38', '2024-08-07', '320', '220', '-100', '1', '1', '2');
INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`) VALUES ('38', '2000021', '27', '47', '2024-08-07', '160', '60', '-100', '1', '1', '2');
INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`) VALUES ('39', '2000022', '27', '48', '2024-08-07', '320', '120', '-200', '1', '1', '2');
INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`) VALUES ('40', '2000023', '27', '61', '2024-08-07', '640', '500', '-140', '1', '1', '2');
INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`) VALUES ('41', '2000024', '30', '32', '2024-08-08', '160', '200', '40', '1', '1', '2');
INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`) VALUES ('42', '2000025', '27', '61', '2024-08-08', '140', '140', '0', '1', '1', '2');
INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`) VALUES ('43', '2000025', '27', '61', '2024-08-08', '0', '0', '0', '1', '1', '2');
INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`) VALUES ('44', '2000026', '27', '61', '2024-08-08', '0', '0', '0', '1', '1', '2');
INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`) VALUES ('45', '2000027', '27', '61', '2024-08-08', '0', '0', '0', '1', '1', '2');
INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`) VALUES ('46', '2000028', '27', '74', '2024-08-08', '320', '320', '0', '1', '1', '2');
INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`) VALUES ('47', '2000028', '27', '61', '2024-08-08', '0', '0', '0', '1', '1', '2');
INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`) VALUES ('48', '2000029', '27', '61', '2024-08-08', '100', '100', '0', '1', '1', '2');
INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`) VALUES ('49', '2000029', '30', '49', '2024-08-08', '320', '100', '-220', '1', '1', '2');
INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`) VALUES ('50', '2000029', '30', '49', '2024-08-08', '220', '300', '80', '1', '1', '2');
INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`) VALUES ('51', '2000030', '30', '62', '2024-08-08', '640', '500', '-140', '1', '1', '2');
INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`) VALUES ('52', '2000030', '30', '62', '2024-08-08', '140', '200', '60', '1', '1', '2');
INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`) VALUES ('53', '2000031', '29', '76', '2024-08-09', '320', '400', '80', '1', '1', '2');
INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`) VALUES ('54', '2000031', '29', '50', '2024-08-09', '320', '200', '-120', '1', '1', '2');
INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`) VALUES ('55', '2000031', '29', '50', '2024-08-09', '120', '120', '0', '1', '1', '2');
INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`) VALUES ('56', '2000031', '29', '63', '2024-08-09', '640', '640', '0', '1', '1', '2');
INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`) VALUES ('57', '2000032', '16', '77', '2024-08-09', '200', '250', '50', '1', '1', '2');
INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`) VALUES ('58', '2000033', '16', '26', '2024-08-09', '160', '100', '-60', '1', '1', '2');
INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`) VALUES ('59', '2000033', '16', '26', '2024-08-09', '60', '100', '40', '1', '1', '2');
INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`) VALUES ('60', '2000034', '16', '27', '2024-08-09', '160', '100', '-60', '1', '1', '2');
INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`) VALUES ('61', '2000035', '16', '27', '2024-08-09', '60', '30', '-30', '1', '1', '2');
INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`) VALUES ('62', '2000036', '16', '78', '2024-08-11', '160', '80', '-80', '1', '1', '2');
INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`) VALUES ('63', '2000037', '16', '27', '2024-08-11', '30', '0', '0', '1', '1', '2');
INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`) VALUES ('64', '2000037', '16', '78', '2024-08-11', '80', '0', '0', '1', '1', '2');
INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`) VALUES ('65', '2000037', '16', '79', '2024-08-11', '160', '0', '0', '1', '1', '2');
INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`) VALUES ('66', '2000038', '27', '81', '2024-08-12', '320', '200', '-120', '1', '1', '2');
INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`) VALUES ('67', '2000038', '27', '81', '2024-08-12', '120', '0', '0', '1', '1', '2');
INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`) VALUES ('68', '2000038', '16', '80', '2024-08-12', '250', '500', '250', '1', '1', '2');
INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`) VALUES ('69', '2000038', '16', '96', '2024-08-12', '0', '800', '800', '1', '1', '2');
INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`) VALUES ('70', '2000039', '16', '28', '2024-08-13', '160', '80', '-80', '1', '1', '2');
INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`) VALUES ('71', '2000039', '16', '28', '2024-08-13', '80', '30', '-50', '1', '1', '2');
INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`) VALUES ('72', '2000039', '16', '28', '2024-08-13', '50', '100', '50', '1', '1', '2');
INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`) VALUES ('73', '2000040', '16', '98', '2024-08-13', '250', '100', '-150', '1', '1', '2');
INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`) VALUES ('74', '2000040', '16', '98', '2024-08-13', '150', '100', '-50', '1', '1', '2');
INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`) VALUES ('75', '2000040', '16', '98', '2024-08-13', '50', '100', '50', '1', '1', '2');
INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`) VALUES ('76', '2000040', '16', '97', '2024-08-13', '250', '100', '-150', '1', '1', '2');
INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`) VALUES ('77', '2000040', '16', '97', '2024-08-13', '150', '200', '50', '1', '1', '2');
INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`) VALUES ('78', '2000041', '27', '101', '2024-08-13', '0', '0', '0', '1', '1', '2');
INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`) VALUES ('79', '2000042', '27', '100', '2024-08-19', '250', '500', '250', '1', '1', '2');
INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`) VALUES ('80', '2000042', '27', '102', '2024-08-19', '1', '0.5', '-0.5', '1', '1', '2');
INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`) VALUES ('81', '2000042', '27', '102', '2024-08-19', '0.5', '0.5', '0', '1', '1', '2');
INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`) VALUES ('82', '2000043', '27', '103', '2024-08-19', '900', '200', '-700', '1', '1', '2');
INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`) VALUES ('83', '2000043', '27', '103', '2024-08-19', '700', '0', '0', '1', '1', '2');
INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`) VALUES ('84', '2000044', '27', '104', '2024-08-21', '900', '500', '-400', '1', '1', '2');
INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`) VALUES ('85', '2000044', '27', '104', '2024-08-21', '400', '0', '0', '1', '1', '2');
INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`) VALUES ('86', '2000045', '39', '107', '2024-08-21', '190.05', '180.05', '-10', '1', '1', '9');
INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`) VALUES ('87', '2000045', '39', '107', '2024-08-21', '10', '0', '0', '1', '1', '9');
INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`) VALUES ('88', '2000046', '30', '82', '2024-08-25', '320', '320', '0', '1', '1', '2');
INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`) VALUES ('89', '2000047', '31', '86', '2024-08-27', '320', '500', '180', '1', '1', '2');
INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`) VALUES ('90', '2000048', '10', '24', '2024-08-28', '160', '160', '0', '1', '1', '5');

INSERT INTO `permisos` (`id_acceso`, `acceso`) VALUES ('1', 'Administrador');
INSERT INTO `permisos` (`id_acceso`, `acceso`) VALUES ('2', 'Usuario');

INSERT INTO `propietarios` (`id_propietario`, `nombre`, `dni`, `correo`, `fecha`, `id_estado`, `observacion`, `telefono`) VALUES ('1', 'ANTHONY CLEMENTE OLIVA MURILLO', '0101199903209', 'AN', '2024-07-21', '1', '\r\n            ', '94856463');
INSERT INTO `propietarios` (`id_propietario`, `nombre`, `dni`, `correo`, `fecha`, `id_estado`, `observacion`, `telefono`) VALUES ('2', 'LOLO', '1', '1LLK', '2024-07-21', '1', '\r\n            ', '94856463');
INSERT INTO `propietarios` (`id_propietario`, `nombre`, `dni`, `correo`, `fecha`, `id_estado`, `observacion`, `telefono`) VALUES ('3', 'KK', '7', 'KK', '2024-07-21', '1', '\r\n            ', '95');
INSERT INTO `propietarios` (`id_propietario`, `nombre`, `dni`, `correo`, `fecha`, `id_estado`, `observacion`, `telefono`) VALUES ('4', 'EL PEPE', '44', 'KFMVKFM', '2024-07-21', '1', '\r\n            ', '9485');
INSERT INTO `propietarios` (`id_propietario`, `nombre`, `dni`, `correo`, `fecha`, `id_estado`, `observacion`, `telefono`) VALUES ('5', 'PEPITO', '44', 'KFMVKFM', '2024-07-21', '1', '\r\n            ', '9485');
INSERT INTO `propietarios` (`id_propietario`, `nombre`, `dni`, `correo`, `fecha`, `id_estado`, `observacion`, `telefono`) VALUES ('6', 'PACO', '44', 'KFMVKFM', '2024-07-21', '1', '\r\n            ', '9485');
INSERT INTO `propietarios` (`id_propietario`, `nombre`, `dni`, `correo`, `fecha`, `id_estado`, `observacion`, `telefono`) VALUES ('7', 'CARNE', '123', 'MMDKMC', '2024-07-21', '1', '\r\n            ', '98');
INSERT INTO `propietarios` (`id_propietario`, `nombre`, `dni`, `correo`, `fecha`, `id_estado`, `observacion`, `telefono`) VALUES ('8', 'LOLA', '123', 'MMDKMC', '2024-07-21', '1', '\r\n            ', '98');
INSERT INTO `propietarios` (`id_propietario`, `nombre`, `dni`, `correo`, `fecha`, `id_estado`, `observacion`, `telefono`) VALUES ('9', 'HECTOR HERNANDEZ', '010119990', 'KDMKMDKCKD', '2024-07-22', '1', 'hola mundo', '626262');
INSERT INTO `propietarios` (`id_propietario`, `nombre`, `dni`, `correo`, `fecha`, `id_estado`, `observacion`, `telefono`) VALUES ('10', 'HECTOR HERNANDEZ', '010119990', 'KDMKMDKCKD', '2024-07-22', '1', 'hola mundo', '626262');
INSERT INTO `propietarios` (`id_propietario`, `nombre`, `dni`, `correo`, `fecha`, `id_estado`, `observacion`, `telefono`) VALUES ('11', 'PRUEBA', '0101500095222', 'CESAR', '2024-07-22', '1', 'mckdmkd\r\n            ', '95855555');
INSERT INTO `propietarios` (`id_propietario`, `nombre`, `dni`, `correo`, `fecha`, `id_estado`, `observacion`, `telefono`) VALUES ('12', 'HH', '00000000', 'HHH', '2024-07-22', '1', 'mckdmkd\r\n            ', '77');
INSERT INTO `propietarios` (`id_propietario`, `nombre`, `dni`, `correo`, `fecha`, `id_estado`, `observacion`, `telefono`) VALUES ('13', 'HH', '00000000', 'HHH', '2024-07-22', '1', 'mckdmkd\r\n            ', '77');
INSERT INTO `propietarios` (`id_propietario`, `nombre`, `dni`, `correo`, `fecha`, `id_estado`, `observacion`, `telefono`) VALUES ('14', 'MVKMFKV', 'MVKMFKVF', 'MVKFMVKF', '2024-07-22', '1', '\r\n            ', 'VMKFMKVF');
INSERT INTO `propietarios` (`id_propietario`, `nombre`, `dni`, `correo`, `fecha`, `id_estado`, `observacion`, `telefono`) VALUES ('15', 'MVKMFKV', 'MVKMFKVF', 'MVKFMVKF', '2024-07-22', '1', '\r\n            ', 'VMKFMKVF');
INSERT INTO `propietarios` (`id_propietario`, `nombre`, `dni`, `correo`, `fecha`, `id_estado`, `observacion`, `telefono`) VALUES ('16', '', '', '', '2024-07-23', '1', '\r\n            ', '');
INSERT INTO `propietarios` (`id_propietario`, `nombre`, `dni`, `correo`, `fecha`, `id_estado`, `observacion`, `telefono`) VALUES ('17', 'MM', 'MM', 'MM', '2024-07-23', '1', '\r\n            ', 'MM');
INSERT INTO `propietarios` (`id_propietario`, `nombre`, `dni`, `correo`, `fecha`, `id_estado`, `observacion`, `telefono`) VALUES ('18', 'MM', 'MM', 'MM', '2024-07-23', '1', '\r\n            ', 'MM');
INSERT INTO `propietarios` (`id_propietario`, `nombre`, `dni`, `correo`, `fecha`, `id_estado`, `observacion`, `telefono`) VALUES ('19', '', '', '', '2024-07-31', '1', '\r\n            ', '');
INSERT INTO `propietarios` (`id_propietario`, `nombre`, `dni`, `correo`, `fecha`, `id_estado`, `observacion`, `telefono`) VALUES ('20', 'PEPITO', '01015000', 'elpepe@gmail.com', '2024-08-02', '1', '\r\n            ', '94856463');
INSERT INTO `propietarios` (`id_propietario`, `nombre`, `dni`, `correo`, `fecha`, `id_estado`, `observacion`, `telefono`) VALUES ('21', 'YY', '1515151', 'jj@gmail.com', '2024-08-02', '1', 'kmkmk\r\n            ', '123456789');
INSERT INTO `propietarios` (`id_propietario`, `nombre`, `dni`, `correo`, `fecha`, `id_estado`, `observacion`, `telefono`) VALUES ('22', 'NN', '12', 'jj@gmail.com', '2024-08-02', '1', 'kmkmk\r\n            ', '74');
INSERT INTO `propietarios` (`id_propietario`, `nombre`, `dni`, `correo`, `fecha`, `id_estado`, `observacion`, `telefono`) VALUES ('23', 'JUAN', '123456789', 'juancho@gmail.com', '2024-08-02', '1', '\r\n            ', '123456');
INSERT INTO `propietarios` (`id_propietario`, `nombre`, `dni`, `correo`, `fecha`, `id_estado`, `observacion`, `telefono`) VALUES ('24', 'E', '7', 'juancho@gmail.com', '2024-08-02', '1', '\r\n            ', '4');
INSERT INTO `propietarios` (`id_propietario`, `nombre`, `dni`, `correo`, `fecha`, `id_estado`, `observacion`, `telefono`) VALUES ('25', '', '', '', '2024-08-02', '1', '\r\n            ', '');
INSERT INTO `propietarios` (`id_propietario`, `nombre`, `dni`, `correo`, `fecha`, `id_estado`, `observacion`, `telefono`) VALUES ('26', '', '', '', '2024-08-02', '1', '\r\n            ', '');
INSERT INTO `propietarios` (`id_propietario`, `nombre`, `dni`, `correo`, `fecha`, `id_estado`, `observacion`, `telefono`) VALUES ('27', 'K', 'K', 'k@gmail', '2024-08-02', '1', '\r\n            ', 'K');
INSERT INTO `propietarios` (`id_propietario`, `nombre`, `dni`, `correo`, `fecha`, `id_estado`, `observacion`, `telefono`) VALUES ('28', 'EL NENE', '50', 'nene@gmail.com', '2024-08-02', '1', '\r\n            ', '123456');
INSERT INTO `propietarios` (`id_propietario`, `nombre`, `dni`, `correo`, `fecha`, `id_estado`, `observacion`, `telefono`) VALUES ('29', '', '', '', '2024-08-02', '1', '\r\n            ', '');
INSERT INTO `propietarios` (`id_propietario`, `nombre`, `dni`, `correo`, `fecha`, `id_estado`, `observacion`, `telefono`) VALUES ('30', '', '', '', '2024-08-02', '1', '\r\n            ', '');
INSERT INTO `propietarios` (`id_propietario`, `nombre`, `dni`, `correo`, `fecha`, `id_estado`, `observacion`, `telefono`) VALUES ('31', '', '', '', '2024-08-02', '1', '\r\n            ', '');
INSERT INTO `propietarios` (`id_propietario`, `nombre`, `dni`, `correo`, `fecha`, `id_estado`, `observacion`, `telefono`) VALUES ('32', '', '', '', '2024-08-02', '1', '\r\n            ', '');
INSERT INTO `propietarios` (`id_propietario`, `nombre`, `dni`, `correo`, `fecha`, `id_estado`, `observacion`, `telefono`) VALUES ('33', '', '', '', '2024-08-02', '1', '\r\n            ', '');
INSERT INTO `propietarios` (`id_propietario`, `nombre`, `dni`, `correo`, `fecha`, `id_estado`, `observacion`, `telefono`) VALUES ('34', '', '', '', '2024-08-02', '1', '\r\n            ', '');
INSERT INTO `propietarios` (`id_propietario`, `nombre`, `dni`, `correo`, `fecha`, `id_estado`, `observacion`, `telefono`) VALUES ('35', '', '', '', '2024-08-02', '1', '\r\n            ', '');
INSERT INTO `propietarios` (`id_propietario`, `nombre`, `dni`, `correo`, `fecha`, `id_estado`, `observacion`, `telefono`) VALUES ('36', '', '', '', '2024-08-02', '1', '\r\n            ', '');
INSERT INTO `propietarios` (`id_propietario`, `nombre`, `dni`, `correo`, `fecha`, `id_estado`, `observacion`, `telefono`) VALUES ('37', '', '', '', '2024-08-02', '1', '\r\n            ', '');
INSERT INTO `propietarios` (`id_propietario`, `nombre`, `dni`, `correo`, `fecha`, `id_estado`, `observacion`, `telefono`) VALUES ('38', '', '', '', '2024-08-02', '1', 'Registro por intercambio', '');
INSERT INTO `propietarios` (`id_propietario`, `nombre`, `dni`, `correo`, `fecha`, `id_estado`, `observacion`, `telefono`) VALUES ('39', '', '', '', '2024-08-02', '1', 'Registro por intercambio', '');
INSERT INTO `propietarios` (`id_propietario`, `nombre`, `dni`, `correo`, `fecha`, `id_estado`, `observacion`, `telefono`) VALUES ('40', '', '', '', '2024-08-02', '1', 'Registro por intercambio', '');
INSERT INTO `propietarios` (`id_propietario`, `nombre`, `dni`, `correo`, `fecha`, `id_estado`, `observacion`, `telefono`) VALUES ('41', '', '', '', '2024-08-02', '1', 'Registro por intercambio', '');
INSERT INTO `propietarios` (`id_propietario`, `nombre`, `dni`, `correo`, `fecha`, `id_estado`, `observacion`, `telefono`) VALUES ('42', '', '', '', '2024-08-02', '1', 'Registro por intercambio', '');
INSERT INTO `propietarios` (`id_propietario`, `nombre`, `dni`, `correo`, `fecha`, `id_estado`, `observacion`, `telefono`) VALUES ('43', 'PACO', '0000', 'paco@gmail.com', '2024-08-02', '1', '\r\n            ', '94856463');
INSERT INTO `propietarios` (`id_propietario`, `nombre`, `dni`, `correo`, `fecha`, `id_estado`, `observacion`, `telefono`) VALUES ('44', 'PRUEBA', '2', 'prueba@gmail.com', '2024-08-05', '1', '\r\n            ', '94856463');
INSERT INTO `propietarios` (`id_propietario`, `nombre`, `dni`, `correo`, `fecha`, `id_estado`, `observacion`, `telefono`) VALUES ('45', '', '', '', '2024-08-15', '1', 'Registro por intercambio', '');
INSERT INTO `propietarios` (`id_propietario`, `nombre`, `dni`, `correo`, `fecha`, `id_estado`, `observacion`, `telefono`) VALUES ('46', '', '', '', '2024-08-15', '1', 'Registro por intercambio', '');
INSERT INTO `propietarios` (`id_propietario`, `nombre`, `dni`, `correo`, `fecha`, `id_estado`, `observacion`, `telefono`) VALUES ('47', '', '', '', '2024-08-15', '1', 'Registro por intercambio', '');
INSERT INTO `propietarios` (`id_propietario`, `nombre`, `dni`, `correo`, `fecha`, `id_estado`, `observacion`, `telefono`) VALUES ('48', 'PABLO ESCOBAR', '0101199903209', 'pablo@gmail.com', '2024-08-21', '1', '', '94856463');
INSERT INTO `propietarios` (`id_propietario`, `nombre`, `dni`, `correo`, `fecha`, `id_estado`, `observacion`, `telefono`) VALUES ('49', 'TKM', '11111', 'j@gmail.com', '2024-08-25', '1', '', '91811076');
INSERT INTO `propietarios` (`id_propietario`, `nombre`, `dni`, `correo`, `fecha`, `id_estado`, `observacion`, `telefono`) VALUES ('50', 'JJ', '1151555', 'kk@gmail.com', '2024-08-25', '1', '', '858585555');

INSERT INTO `propietarios_villas` (`id_unir`, `id_propietario`, `id_villa`) VALUES ('10', '9', '55');
INSERT INTO `propietarios_villas` (`id_unir`, `id_propietario`, `id_villa`) VALUES ('11', '9', '56');
INSERT INTO `propietarios_villas` (`id_unir`, `id_propietario`, `id_villa`) VALUES ('12', '10', '57');
INSERT INTO `propietarios_villas` (`id_unir`, `id_propietario`, `id_villa`) VALUES ('13', '11', '71');
INSERT INTO `propietarios_villas` (`id_unir`, `id_propietario`, `id_villa`) VALUES ('14', '12', '47');
INSERT INTO `propietarios_villas` (`id_unir`, `id_propietario`, `id_villa`) VALUES ('15', '13', '38');
INSERT INTO `propietarios_villas` (`id_unir`, `id_propietario`, `id_villa`) VALUES ('16', '11', '58');
INSERT INTO `propietarios_villas` (`id_unir`, `id_propietario`, `id_villa`) VALUES ('17', '11', '59');
INSERT INTO `propietarios_villas` (`id_unir`, `id_propietario`, `id_villa`) VALUES ('18', '11', '61');
INSERT INTO `propietarios_villas` (`id_unir`, `id_propietario`, `id_villa`) VALUES ('19', '2', '51');
INSERT INTO `propietarios_villas` (`id_unir`, `id_propietario`, `id_villa`) VALUES ('20', '2', '64');
INSERT INTO `propietarios_villas` (`id_unir`, `id_propietario`, `id_villa`) VALUES ('21', '15', '60');
INSERT INTO `propietarios_villas` (`id_unir`, `id_propietario`, `id_villa`) VALUES ('22', '17', '62');
INSERT INTO `propietarios_villas` (`id_unir`, `id_propietario`, `id_villa`) VALUES ('23', '18', '63');
INSERT INTO `propietarios_villas` (`id_unir`, `id_propietario`, `id_villa`) VALUES ('24', '20', '76');
INSERT INTO `propietarios_villas` (`id_unir`, `id_propietario`, `id_villa`) VALUES ('25', '20', '52');
INSERT INTO `propietarios_villas` (`id_unir`, `id_propietario`, `id_villa`) VALUES ('26', '21', '53');
INSERT INTO `propietarios_villas` (`id_unir`, `id_propietario`, `id_villa`) VALUES ('27', '22', '33');
INSERT INTO `propietarios_villas` (`id_unir`, `id_propietario`, `id_villa`) VALUES ('28', '23', '54');
INSERT INTO `propietarios_villas` (`id_unir`, `id_propietario`, `id_villa`) VALUES ('29', '24', '35');
INSERT INTO `propietarios_villas` (`id_unir`, `id_propietario`, `id_villa`) VALUES ('30', '27', '34');
INSERT INTO `propietarios_villas` (`id_unir`, `id_propietario`, `id_villa`) VALUES ('31', '28', '38');
INSERT INTO `propietarios_villas` (`id_unir`, `id_propietario`, `id_villa`) VALUES ('32', '28', '39');
INSERT INTO `propietarios_villas` (`id_unir`, `id_propietario`, `id_villa`) VALUES ('33', '2', '73');
INSERT INTO `propietarios_villas` (`id_unir`, `id_propietario`, `id_villa`) VALUES ('34', '2', '40');
INSERT INTO `propietarios_villas` (`id_unir`, `id_propietario`, `id_villa`) VALUES ('35', '1', '74');
INSERT INTO `propietarios_villas` (`id_unir`, `id_propietario`, `id_villa`) VALUES ('36', '2', '75');
INSERT INTO `propietarios_villas` (`id_unir`, `id_propietario`, `id_villa`) VALUES ('37', '43', '36');
INSERT INTO `propietarios_villas` (`id_unir`, `id_propietario`, `id_villa`) VALUES ('38', '44', '77');
INSERT INTO `propietarios_villas` (`id_unir`, `id_propietario`, `id_villa`) VALUES ('39', '48', '84');
INSERT INTO `propietarios_villas` (`id_unir`, `id_propietario`, `id_villa`) VALUES ('40', '49', '78');
INSERT INTO `propietarios_villas` (`id_unir`, `id_propietario`, `id_villa`) VALUES ('41', '50', '37');

INSERT INTO `usuarios` (`id_usuario`, `nombre`, `apellido`, `dni`, `telefono`, `correo`, `id_acceso`, `clave`, `id_estado`, `usuario`) VALUES ('2', 'ANTHONY', 'OLIVA', '010119993209', '94856466', 'anthonyoliva70@gmail.com', '1', '741852', '1', 'ANTHONY');
INSERT INTO `usuarios` (`id_usuario`, `nombre`, `apellido`, `dni`, `telefono`, `correo`, `id_acceso`, `clave`, `id_estado`, `usuario`) VALUES ('3', 'NESTOR', 'OLIVA', '01010000000', '94856463', 'nestor@gmail.com', '2', '123456', '1', 'NESTOR');
INSERT INTO `usuarios` (`id_usuario`, `nombre`, `apellido`, `dni`, `telefono`, `correo`, `id_acceso`, `clave`, `id_estado`, `usuario`) VALUES ('4', 'ELDER', 'OLIVA', '01012222222', '94856463', 'njjvnfjvjf@nvfvfn', '2', '123456', '1', 'ELDER');
INSERT INTO `usuarios` (`id_usuario`, `nombre`, `apellido`, `dni`, `telefono`, `correo`, `id_acceso`, `clave`, `id_estado`, `usuario`) VALUES ('6', 'ANDREA', 'MURILLO', '0101196801005', '96723864', 'xiomarandrea@gmail.com', '2', '123456', '2', 'XIOMARA');
INSERT INTO `usuarios` (`id_usuario`, `nombre`, `apellido`, `dni`, `telefono`, `correo`, `id_acceso`, `clave`, `id_estado`, `usuario`) VALUES ('7', 'ANDRE', 'MURILLO', '0101196801005', '96723864', 'xiomarandrea@gmail.com', '2', '1234567', '2', 'XIOMARA');
INSERT INTO `usuarios` (`id_usuario`, `nombre`, `apellido`, `dni`, `telefono`, `correo`, `id_acceso`, `clave`, `id_estado`, `usuario`) VALUES ('8', 'TOMY', 'HALLEN', '0101196801005', '96723864', 'tomy@gg', '1', '123456', '2', 'TOMY');
INSERT INTO `usuarios` (`id_usuario`, `nombre`, `apellido`, `dni`, `telefono`, `correo`, `id_acceso`, `clave`, `id_estado`, `usuario`) VALUES ('9', 'ANDREA', 'MURILLO', '0101196801005', '96723864', 'xiomarandrea@gmail.com', '1', '123456', '1', 'XIOMARA');
INSERT INTO `usuarios` (`id_usuario`, `nombre`, `apellido`, `dni`, `telefono`, `correo`, `id_acceso`, `clave`, `id_estado`, `usuario`) VALUES ('10', 'ASHANTY', 'GONZALES', '0101200405646', '84651233', 'acha.gon@gmail.com', '2', '963852', '1', 'ASHANTY');
INSERT INTO `usuarios` (`id_usuario`, `nombre`, `apellido`, `dni`, `telefono`, `correo`, `id_acceso`, `clave`, `id_estado`, `usuario`) VALUES ('11', 'NESTOR', 'OLIVA', '0101199903209', '94856463', 'anthony.oliva80@unitec.edu', '2', '123456789', '1', 'NESTOR');
INSERT INTO `usuarios` (`id_usuario`, `nombre`, `apellido`, `dni`, `telefono`, `correo`, `id_acceso`, `clave`, `id_estado`, `usuario`) VALUES ('12', 'KCMDKCMDK', 'DMKMDKCMKD', 'DKMKDMVKFMK', 'KDMVKMKVFMKV', 'vmkvmkkf@v', '1', 'cmdkmckdmckd', '1', 'MKCDMKCMDK');

INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_modelo`, `id_condicion`, `id_estado`, `direccion`, `observacion`) VALUES ('33', '1', '1', '123456789', '5', '250', '1', '1', '2', 'Roma, Palma Real', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_modelo`, `id_condicion`, `id_estado`, `direccion`, `observacion`) VALUES ('34', '1', '2', '123456789', '5', '250', '1', '1', '2', 'Roma, Palma Real', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_modelo`, `id_condicion`, `id_estado`, `direccion`, `observacion`) VALUES ('35', '1', '3', '123456789', '5', '250', '1', '1', '2', 'Roma, Palma Real', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_modelo`, `id_condicion`, `id_estado`, `direccion`, `observacion`) VALUES ('36', '1', '4', '123456789', '5', '250', '1', '1', '2', 'Roma, Palma Real', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_modelo`, `id_condicion`, `id_estado`, `direccion`, `observacion`) VALUES ('37', '1', '5', '123456789', '5', '250', '1', '1', '2', 'Roma, Palma Real', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_modelo`, `id_condicion`, `id_estado`, `direccion`, `observacion`) VALUES ('38', '1', '6', '123456', '7', '250', '2', '1', '2', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_modelo`, `id_condicion`, `id_estado`, `direccion`, `observacion`) VALUES ('39', '1', '7', '123456', '7', '250', '2', '1', '2', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_modelo`, `id_condicion`, `id_estado`, `direccion`, `observacion`) VALUES ('40', '1', '8', '123456', '7', '250', '2', '1', '2', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_modelo`, `id_condicion`, `id_estado`, `direccion`, `observacion`) VALUES ('41', '1', '11', '', '', '', '1', '1', '1', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_modelo`, `id_condicion`, `id_estado`, `direccion`, `observacion`) VALUES ('42', '1', '12', '', '', '', '1', '1', '1', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_modelo`, `id_condicion`, `id_estado`, `direccion`, `observacion`) VALUES ('43', '1', '13', '', '', '', '1', '1', '1', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_modelo`, `id_condicion`, `id_estado`, `direccion`, `observacion`) VALUES ('44', '1', '14', '', '', '', '1', '1', '1', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_modelo`, `id_condicion`, `id_estado`, `direccion`, `observacion`) VALUES ('45', '1', '17', '1234567899', '5', '255.05', '1', '1', '1', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_modelo`, `id_condicion`, `id_estado`, `direccion`, `observacion`) VALUES ('46', '1', '18', '1234567899', '5', '255.05', '1', '1', '1', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_modelo`, `id_condicion`, `id_estado`, `direccion`, `observacion`) VALUES ('47', '1', '70', '123456789', '5', '200.1', '1', '1', '2', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_modelo`, `id_condicion`, `id_estado`, `direccion`, `observacion`) VALUES ('48', '1', '71', '123456789', '5', '200.1', '1', '1', '1', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_modelo`, `id_condicion`, `id_estado`, `direccion`, `observacion`) VALUES ('49', '1', '78', '123456789', '5', '10.5', '1', '1', '1', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_modelo`, `id_condicion`, `id_estado`, `direccion`, `observacion`) VALUES ('50', '1', '79', '123456789', '5', '10.5', '1', '1', '1', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_modelo`, `id_condicion`, `id_estado`, `direccion`, `observacion`) VALUES ('51', '2', '1', '123456789', '5', '200.1', '1', '1', '2', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_modelo`, `id_condicion`, `id_estado`, `direccion`, `observacion`) VALUES ('52', '2', '2', '', '', '', '1', '1', '2', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_modelo`, `id_condicion`, `id_estado`, `direccion`, `observacion`) VALUES ('53', '2', '3', '', '', '', '1', '1', '2', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_modelo`, `id_condicion`, `id_estado`, `direccion`, `observacion`) VALUES ('54', '2', '4', '', '', '', '1', '1', '2', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_modelo`, `id_condicion`, `id_estado`, `direccion`, `observacion`) VALUES ('55', '3', '1', '123456789', '5', '200.1', '1', '1', '2', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_modelo`, `id_condicion`, `id_estado`, `direccion`, `observacion`) VALUES ('56', '3', '2', '', '', '', '1', '1', '2', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_modelo`, `id_condicion`, `id_estado`, `direccion`, `observacion`) VALUES ('57', '3', '3', '123456789', '5', '200.1', '1', '1', '2', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_modelo`, `id_condicion`, `id_estado`, `direccion`, `observacion`) VALUES ('58', '3', '12', '', '', '', '1', '1', '2', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_modelo`, `id_condicion`, `id_estado`, `direccion`, `observacion`) VALUES ('59', '3', '13', '', '', '', '1', '1', '2', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_modelo`, `id_condicion`, `id_estado`, `direccion`, `observacion`) VALUES ('60', '3', '14', '', '', '', '1', '1', '2', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_modelo`, `id_condicion`, `id_estado`, `direccion`, `observacion`) VALUES ('61', '3', '20', '', '', '', '1', '1', '2', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_modelo`, `id_condicion`, `id_estado`, `direccion`, `observacion`) VALUES ('62', '3', '21', '', '', '', '1', '1', '2', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_modelo`, `id_condicion`, `id_estado`, `direccion`, `observacion`) VALUES ('63', '3', '22', '', '', '', '1', '1', '2', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_modelo`, `id_condicion`, `id_estado`, `direccion`, `observacion`) VALUES ('64', '3', '23', '', '', '', '1', '1', '2', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_modelo`, `id_condicion`, `id_estado`, `direccion`, `observacion`) VALUES ('65', '1', '99', '', '', '', '1', '1', '1', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_modelo`, `id_condicion`, `id_estado`, `direccion`, `observacion`) VALUES ('66', '1', '200', '', '', '', '1', '1', '1', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_modelo`, `id_condicion`, `id_estado`, `direccion`, `observacion`) VALUES ('67', '1', '201', '', '', '', '1', '1', '1', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_modelo`, `id_condicion`, `id_estado`, `direccion`, `observacion`) VALUES ('68', '1', '202', '', '', '', '1', '1', '1', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_modelo`, `id_condicion`, `id_estado`, `direccion`, `observacion`) VALUES ('69', '1', '203', '', '', '', '1', '1', '1', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_modelo`, `id_condicion`, `id_estado`, `direccion`, `observacion`) VALUES ('70', '1', '204', '', '', '1.50', '1', '1', '1', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_modelo`, `id_condicion`, `id_estado`, `direccion`, `observacion`) VALUES ('71', '3', '40', '123456789', '2', '250.10', '2', '1', '2', 'roma', 'prueba');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_modelo`, `id_condicion`, `id_estado`, `direccion`, `observacion`) VALUES ('72', '1', '', '', '', '', '1', '1', '1', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_modelo`, `id_condicion`, `id_estado`, `direccion`, `observacion`) VALUES ('73', '4', '1', '123456789', '2', '150', '2', '1', '2', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_modelo`, `id_condicion`, `id_estado`, `direccion`, `observacion`) VALUES ('74', '4', '2', '123456789', '2', '150', '2', '1', '2', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_modelo`, `id_condicion`, `id_estado`, `direccion`, `observacion`) VALUES ('75', '4', '3', '123456789', '2', '150', '2', '1', '2', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_modelo`, `id_condicion`, `id_estado`, `direccion`, `observacion`) VALUES ('76', '4', '4', '123456789', '4', '500', '1', '1', '2', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_modelo`, `id_condicion`, `id_estado`, `direccion`, `observacion`) VALUES ('77', '4', '12', '123456', '7', '150', '2', '1', '2', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_modelo`, `id_condicion`, `id_estado`, `direccion`, `observacion`) VALUES ('78', '4', '15', '777777777', '2', '600', '2', '1', '2', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_modelo`, `id_condicion`, `id_estado`, `direccion`, `observacion`) VALUES ('79', '1', '15', '5555555555555', '2', '250', '1', '1', '1', 'Roma, Palma Real', 'Tiene una fuga de gas');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_modelo`, `id_condicion`, `id_estado`, `direccion`, `observacion`) VALUES ('80', '1', '50', '5555555555555', '2', '250', '1', '1', '1', 'Roma, Juteapa', 'Mucha agua');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_modelo`, `id_condicion`, `id_estado`, `direccion`, `observacion`) VALUES ('81', '1', '88', '', '', '', '1', '1', '1', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_modelo`, `id_condicion`, `id_estado`, `direccion`, `observacion`) VALUES ('82', '1', '89', '', '', '', '1', '1', '1', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_modelo`, `id_condicion`, `id_estado`, `direccion`, `observacion`) VALUES ('83', '1', '74', '', '', '', '1', '1', '1', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_modelo`, `id_condicion`, `id_estado`, `direccion`, `observacion`) VALUES ('84', '5', '1', '123456789', '3', '300.50', '3', '1', '2', '', '');

SET FOREIGN_KEY_CHECKS=1;
