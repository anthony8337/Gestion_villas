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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
  `id_concepto_2` int DEFAULT NULL,
  PRIMARY KEY (`id_cuenta`),
  KEY `FK_cuenta_concepto` (`id_concepto`),
  KEY `FK_cuentas_propietarios_villas` (`id_unir`),
  KEY `FK_concepto_2` (`id_concepto_2`),
  CONSTRAINT `cuentas$FK_cuenta_concepto` FOREIGN KEY (`id_concepto`) REFERENCES `concepto` (`id_concepto`),
  CONSTRAINT `cuentas$FK_cuentas_propietarios_villas` FOREIGN KEY (`id_unir`) REFERENCES `propietarios_villas` (`id_unir`),
  CONSTRAINT `FK_concepto_2` FOREIGN KEY (`id_concepto_2`) REFERENCES `concepto` (`id_concepto`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=705 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
  `id_multi` int NOT NULL,
  `tipo_pago` varchar(50) NOT NULL,
  `forma_pago` varchar(50) NOT NULL,
  `n_referencia` varchar(50) NOT NULL,
  PRIMARY KEY (`id_forma`),
  KEY `FK_id_cuenta` (`id_multi`),
  CONSTRAINT `FK_id_multi` FOREIGN KEY (`id_multi`) REFERENCES `multi_pago` (`id_multi`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
  `tipo_pago` varchar(50) DEFAULT NULL,
  `forma_pago` varchar(50) DEFAULT NULL,
  `n_referencia` varchar(50) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=190 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `propietarios_villas` (
  `id_unir` int NOT NULL AUTO_INCREMENT,
  `id_propietario` int DEFAULT NULL,
  `id_villa` int DEFAULT NULL,
  PRIMARY KEY (`id_unir`),
  KEY `FK_propietarios_villas_propietarios` (`id_propietario`),
  KEY `FK_propietarios_villas_villas` (`id_villa`),
  CONSTRAINT `propietarios_villas$FK_propietarios_villas_propietarios` FOREIGN KEY (`id_propietario`) REFERENCES `propietarios` (`id_propietario`),
  CONSTRAINT `propietarios_villas$FK_propietarios_villas_villas` FOREIGN KEY (`id_villa`) REFERENCES `villas` (`id_villa`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
  `id_condicion` int DEFAULT NULL,
  `id_estado` int DEFAULT NULL,
  `direccion` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `observacion` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `modelo` varchar(500) NOT NULL,
  PRIMARY KEY (`id_villa`),
  KEY `FK_villas_condicion_villas` (`id_condicion`),
  KEY `FK_villas_estado_villa` (`id_estado`),
  KEY `FK_villas_grupo_villa` (`id_grupo`),
  CONSTRAINT `villas$FK_villas_condicion_villas` FOREIGN KEY (`id_condicion`) REFERENCES `condicion_villas` (`id_condicion`),
  CONSTRAINT `villas$FK_villas_estado_villa` FOREIGN KEY (`id_estado`) REFERENCES `estado_villa` (`id_estado`),
  CONSTRAINT `villas$FK_villas_grupo_villa` FOREIGN KEY (`id_grupo`) REFERENCES `grupo_villa` (`id_grupo`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `cod_villa` AS select concat(`grupo_villa`.`grupo`,'-',`villas`.`numero`) AS `villa` from (`villas` join `grupo_villa` on((`villas`.`id_grupo` = `grupo_villa`.`id_grupo`)));

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `cuenta_vista` AS select `cuentas`.`id_cuenta` AS `id_cuenta`,`cuentas`.`codigo` AS `codigo`,`propietarios_villas`.`id_unir` AS `id_unir`,`cuentas`.`costo` AS `costo`,`cuentas`.`abono` AS `abono`,`cuentas`.`desde` AS `desde`,`cuentas`.`hasta` AS `hasta`,`cuentas`.`pagado` AS `pagado`,`concepto_1`.`concepto` AS `concepto_2`,`propietarios`.`nombre` AS `nombre`,concat(`grupo_villa`.`grupo`,'-',`villas`.`numero`) AS `villa`,`concepto`.`concepto` AS `concepto`,`concepto`.`id_concepto` AS `id_concepto`,`concepto_1`.`id_concepto` AS `con_descrip` from ((((((`cuentas` join `propietarios_villas` on((`cuentas`.`id_unir` = `propietarios_villas`.`id_unir`))) join `concepto` on((`cuentas`.`id_concepto` = `concepto`.`id_concepto`))) join `concepto` `concepto_1` on((`cuentas`.`id_concepto_2` = `concepto_1`.`id_concepto`))) join `villas` on((`propietarios_villas`.`id_villa` = `villas`.`id_villa`))) join `propietarios` on((`propietarios_villas`.`id_propietario` = `propietarios`.`id_propietario`))) join `grupo_villa` on((`villas`.`id_grupo` = `grupo_villa`.`id_grupo`)));

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `donar_recibir_villa` AS select `propietarios_villas`.`id_propietario` AS `id_propietario`,`villas`.`id_villa` AS `id_villa`,concat(`grupo_villa`.`grupo`,'-',`villas`.`numero`) AS `villas`,`villas`.`cont_eeh` AS `cont_eeh`,`villas`.`habitaciones` AS `habitaciones`,`condicion_villas`.`condicion` AS `condicion`,`villas`.`modelo` AS `modelo` from (((`propietarios_villas` join `villas` on((`propietarios_villas`.`id_villa` = `villas`.`id_villa`))) join `grupo_villa` on((`villas`.`id_grupo` = `grupo_villa`.`id_grupo`))) join `condicion_villas` on((`villas`.`id_condicion` = `condicion_villas`.`id_condicion`)));

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `factura_completa_reimprimir` AS select `multi_pago`.`codigo_pago` AS `codigo_pago`,`concepto`.`concepto` AS `concepto`,`multi_pago`.`fecha_pago` AS `fecha_pago`,`multi_pago`.`id_unir` AS `id_unir`,`cuentas`.`desde` AS `desde`,`cuentas`.`hasta` AS `hasta`,`cuentas`.`codigo` AS `codigo`,`cuentas`.`costo` AS `costo`,`cuentas`.`abono` AS `abono`,`multi_pago`.`tipo_pago` AS `tipo_pago`,`multi_pago`.`forma_pago` AS `forma_pago`,`multi_pago`.`n_referencia` AS `n_referencia`,`multi_pago`.`cantidad_recibida` AS `cantidad_recibida`,`concepto_1`.`concepto` AS `abono_con` from (((`concepto` join `cuentas` on((`concepto`.`id_concepto` = `cuentas`.`id_concepto`))) join `multi_pago` on((`cuentas`.`id_cuenta` = `multi_pago`.`id_cuenta`))) join `concepto` `concepto_1` on((`cuentas`.`id_concepto_2` = `concepto_1`.`id_concepto`)));

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pripietario_cuenta_vista` (`id_unir`,`villa`,`nombre`,`dni`,`telefono`,`id_estado`) AS select `propietarios_villas`.`id_unir` AS `id_unir`,concat(`grupo_villa`.`grupo`,'-',`villas`.`numero`) AS `villa`,`propietarios`.`nombre` AS `nombre`,`propietarios`.`dni` AS `dni`,`propietarios`.`telefono` AS `telefono`,`propietarios`.`id_estado` AS `id_estado` from (((`propietarios_villas` join `propietarios` on((`propietarios_villas`.`id_propietario` = `propietarios`.`id_propietario`))) join `villas` on((`propietarios_villas`.`id_villa` = `villas`.`id_villa`))) join `grupo_villa` on((`villas`.`id_grupo` = `grupo_villa`.`id_grupo`)));

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `propietario_principal` AS select `propietarios_villas`.`id_unir` AS `id_unir`,`propietarios_villas`.`id_propietario` AS `id_propietario`,`propietarios_villas`.`id_villa` AS `id_villa`,concat(`grupo_villa`.`grupo`,'-',`villas`.`numero`) AS `villa`,`villas`.`cont_eeh` AS `cont_eeh`,`propietarios`.`nombre` AS `nombre`,`propietarios`.`dni` AS `dni`,`propietarios`.`telefono` AS `telefono`,`propietarios`.`correo` AS `correo`,`propietarios`.`observacion` AS `observacion` from (((`propietarios_villas` join `propietarios` on((`propietarios_villas`.`id_propietario` = `propietarios`.`id_propietario`))) join `villas` on((`propietarios_villas`.`id_villa` = `villas`.`id_villa`))) join `grupo_villa` on((`villas`.`id_grupo` = `grupo_villa`.`id_grupo`)));

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tomar_desde_hasta` AS select `pripietario_cuenta_vista`.`id_unir` AS `id_unir`,`pripietario_cuenta_vista`.`villa` AS `villa` from `pripietario_cuenta_vista` order by substring_index(`pripietario_cuenta_vista`.`villa`,'-',1),cast(substring_index(`pripietario_cuenta_vista`.`villa`,'-',-(1)) as unsigned);

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ultimas_villas` AS select `villas`.`id_villa` AS `id_villa`,concat(`grupo_villa`.`grupo`,'-',`villas`.`numero`) AS `codigo`,`condicion_villas`.`condicion` AS `condicion`,`estado_villa`.`estado` AS `estado`,`villas`.`modelo` AS `modelo` from (((`villas` join `estado_villa` on((`villas`.`id_estado` = `estado_villa`.`id_estado`))) join `grupo_villa` on((`villas`.`id_grupo` = `grupo_villa`.`id_grupo`))) join `condicion_villas` on((`villas`.`id_condicion` = `condicion_villas`.`id_condicion`)));

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ver_cuentas_pagadas` AS select `multi_pago`.`codigo_pago` AS `codigo_pago`,`concepto`.`concepto` AS `concepto`,`multi_pago`.`fecha_pago` AS `fecha_pago`,`multi_pago`.`id_unir` AS `id_unir` from ((`concepto` join `cuentas` on((`concepto`.`id_concepto` = `cuentas`.`id_concepto`))) join `multi_pago` on((`cuentas`.`id_cuenta` = `multi_pago`.`id_cuenta`)));

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ver_saldos` AS select `cuenta_vista`.`concepto` AS `concepto`,`cuenta_vista`.`villa` AS `villa`,`cuenta_vista`.`nombre` AS `nombre`,sum(`cuenta_vista`.`costo`) AS `costo_total`,sum(`cuenta_vista`.`abono`) AS `abono_total`,sum((`cuenta_vista`.`costo` - `cuenta_vista`.`abono`)) AS `saldo_total` from `cuenta_vista` group by `cuenta_vista`.`concepto`,`cuenta_vista`.`villa`,`cuenta_vista`.`nombre`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `villa_completo` AS select `villas`.`id_villa` AS `id_villa`,concat(`grupo_villa`.`grupo`,'-',`villas`.`numero`) AS `villas`,`villas`.`cont_eeh` AS `cont_eeh`,`villas`.`habitaciones` AS `habitaciones`,`villas`.`lote` AS `lote`,`condicion_villas`.`condicion` AS `condicion`,`villas`.`id_estado` AS `id_estado`,`estado_villa`.`estado` AS `estado`,`villas`.`modelo` AS `modelo`,`villas`.`direccion` AS `direccion`,`villas`.`observacion` AS `observacion` from (((`villas` join `grupo_villa` on((`villas`.`id_grupo` = `grupo_villa`.`id_grupo`))) join `condicion_villas` on((`villas`.`id_condicion` = `condicion_villas`.`id_condicion`))) join `estado_villa` on((`villas`.`id_estado` = `estado_villa`.`id_estado`)));

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `villas_con_propietario` AS select `villas`.`id_villa` AS `id_villa`,concat(`grupo_villa`.`grupo`,'-',`villas`.`numero`) AS `villas`,`villas`.`cont_eeh` AS `cont_eeh`,`villas`.`habitaciones` AS `habitaciones`,`villas`.`lote` AS `lote`,`condicion_villas`.`condicion` AS `condicion`,`villas`.`id_estado` AS `id_estado`,`estado_villa`.`estado` AS `estado`,`propietarios_villas`.`id_propietario` AS `id_propietario`,`propietarios_villas`.`id_unir` AS `id_unir`,`villas`.`modelo` AS `modelo` from ((((`villas` join `grupo_villa` on((`villas`.`id_grupo` = `grupo_villa`.`id_grupo`))) join `condicion_villas` on((`villas`.`id_condicion` = `condicion_villas`.`id_condicion`))) join `estado_villa` on((`villas`.`id_estado` = `estado_villa`.`id_estado`))) join `propietarios_villas` on((`villas`.`id_villa` = `propietarios_villas`.`id_villa`)));

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_usuario` AS select `usuarios`.`id_usuario` AS `id_usuario`,`usuarios`.`usuario` AS `usuario`,concat(`usuarios`.`nombre`,' ',`usuarios`.`apellido`) AS `nombre`,`usuarios`.`dni` AS `dni`,`usuarios`.`telefono` AS `telefono`,`usuarios`.`correo` AS `correo`,`permisos`.`acceso` AS `acceso`,`usuarios`.`clave` AS `clave`,`estado_usuario`.`estado` AS `estado`,`usuarios`.`nombre` AS `nom`,`usuarios`.`apellido` AS `ape`,`acceso_usuario`.`imprimir_reportes` AS `imprimir_reportes`,`acceso_usuario`.`modificar_reportes` AS `modificar_reportes`,`acceso_usuario`.`eliminar_reportes` AS `eliminar_reportes` from (((`acceso_usuario` join `usuarios` on((`acceso_usuario`.`id_usuario` = `usuarios`.`id_usuario`))) join `permisos` on((`usuarios`.`id_acceso` = `permisos`.`id_acceso`))) join `estado_usuario` on((`usuarios`.`id_estado` = `estado_usuario`.`id_estado`)));

INSERT INTO `acceso_usuario` (`id_acceso_usuario`, `id_usuario`, `imprimir_reportes`, `modificar_reportes`, `eliminar_reportes`) VALUES ('1', '6', 'no', 'si', 'no');
INSERT INTO `acceso_usuario` (`id_acceso_usuario`, `id_usuario`, `imprimir_reportes`, `modificar_reportes`, `eliminar_reportes`) VALUES ('2', '7', 'no', 'no', 'no');
INSERT INTO `acceso_usuario` (`id_acceso_usuario`, `id_usuario`, `imprimir_reportes`, `modificar_reportes`, `eliminar_reportes`) VALUES ('3', '2', 'si', 'si', 'si');
INSERT INTO `acceso_usuario` (`id_acceso_usuario`, `id_usuario`, `imprimir_reportes`, `modificar_reportes`, `eliminar_reportes`) VALUES ('4', '8', 'si', 'si', 'si');
INSERT INTO `acceso_usuario` (`id_acceso_usuario`, `id_usuario`, `imprimir_reportes`, `modificar_reportes`, `eliminar_reportes`) VALUES ('5', '9', 'no', 'si', 'no');
INSERT INTO `acceso_usuario` (`id_acceso_usuario`, `id_usuario`, `imprimir_reportes`, `modificar_reportes`, `eliminar_reportes`) VALUES ('6', '10', 'si', 'si', 'si');
INSERT INTO `acceso_usuario` (`id_acceso_usuario`, `id_usuario`, `imprimir_reportes`, `modificar_reportes`, `eliminar_reportes`) VALUES ('7', '11', 'si', 'si', 'si');
INSERT INTO `acceso_usuario` (`id_acceso_usuario`, `id_usuario`, `imprimir_reportes`, `modificar_reportes`, `eliminar_reportes`) VALUES ('8', '12', 'si', 'no', 'si');

INSERT INTO `caracteristicas` (`id_caracteristica`, `id_villa`, `caracteristica`) VALUES ('2', '98', 'La playa');
INSERT INTO `caracteristicas` (`id_caracteristica`, `id_villa`, `caracteristica`) VALUES ('3', '98', 'Salva vidas');
INSERT INTO `caracteristicas` (`id_caracteristica`, `id_villa`, `caracteristica`) VALUES ('4', '99', '77');
INSERT INTO `caracteristicas` (`id_caracteristica`, `id_villa`, `caracteristica`) VALUES ('5', '99', '1');
INSERT INTO `caracteristicas` (`id_caracteristica`, `id_villa`, `caracteristica`) VALUES ('6', '100', 'Garaje compartido');
INSERT INTO `caracteristicas` (`id_caracteristica`, `id_villa`, `caracteristica`) VALUES ('7', '101', 'Frente al hotel');
INSERT INTO `caracteristicas` (`id_caracteristica`, `id_villa`, `caracteristica`) VALUES ('8', '103', '1');
INSERT INTO `caracteristicas` (`id_caracteristica`, `id_villa`, `caracteristica`) VALUES ('9', '103', '2');
INSERT INTO `caracteristicas` (`id_caracteristica`, `id_villa`, `caracteristica`) VALUES ('10', '103', '3');
INSERT INTO `caracteristicas` (`id_caracteristica`, `id_villa`, `caracteristica`) VALUES ('13', '103', 'El pepe');
INSERT INTO `caracteristicas` (`id_caracteristica`, `id_villa`, `caracteristica`) VALUES ('14', '103', 'Cafe');
INSERT INTO `caracteristicas` (`id_caracteristica`, `id_villa`, `caracteristica`) VALUES ('15', '33', 'pepito');

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


INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('300', '30', '3', '0', '160', '2024-09-03', '2024-09-03', 'Pagado', '1000001', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('301', '29', '3', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000002', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('302', '37', '3', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000003', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('304', '15', '3', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000005', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('305', '31', '4', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000006', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('306', '32', '3', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000007', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('307', '14', '3', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000008', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('308', '27', '1', '250', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000009', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('309', '30', '1', '250', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000010', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('310', '29', '1', '250', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000011', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('311', '37', '1', '90', '160', '2024-09-03', '2024-09-03', 'Pendiente', '1000012', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('313', '15', '1', '250', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000014', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('314', '31', '1', '250', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000015', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('315', '32', '1', '250', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000016', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('316', '34', '1', '250', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000017', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('317', '14', '1', '250', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000018', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('318', '19', '1', '250', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000019', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('319', '25', '1', '250', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000020', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('320', '26', '1', '250', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000021', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('321', '28', '1', '250', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000022', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('322', '10', '1', '200', '50', '2024-09-03', '2024-09-03', 'Pendiente', '1000023', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('323', '11', '1', '250', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000024', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('324', '12', '1', '250', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000025', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('325', '16', '1', '250', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000026', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('326', '17', '1', '250', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000027', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('327', '21', '1', '250', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000028', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('328', '18', '1', '250', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000029', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('329', '22', '1', '250', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000030', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('330', '23', '1', '250', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000031', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('331', '20', '1', '250', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000032', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('332', '13', '1', '250', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000033', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('333', '33', '1', '250', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000034', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('334', '35', '1', '250', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000035', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('335', '36', '1', '250', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000036', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('336', '24', '1', '250', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000037', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('337', '38', '1', '250', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000038', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('338', '40', '1', '250', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000039', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('339', '39', '1', '250', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000040', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('340', '27', '3', '150', '10', '2024-09-03', '2024-09-03', 'Pendiente', '1000041', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('341', '30', '3', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000042', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('342', '29', '3', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000043', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('343', '37', '3', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000044', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('344', '41', '3', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000045', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('345', '15', '3', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000046', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('346', '31', '3', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000047', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('347', '32', '3', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000048', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('348', '34', '3', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000049', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('349', '14', '3', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000050', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('350', '19', '3', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000051', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('351', '25', '3', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000052', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('352', '26', '3', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000053', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('353', '28', '3', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000054', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('354', '10', '3', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000055', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('355', '11', '3', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000056', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('356', '12', '3', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000057', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('357', '16', '3', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000058', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('358', '17', '3', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000059', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('359', '21', '3', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000060', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('360', '18', '3', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000061', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('361', '22', '3', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000062', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('362', '23', '3', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000063', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('363', '20', '3', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000064', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('364', '13', '3', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000065', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('365', '33', '3', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000066', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('366', '35', '3', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000067', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('367', '36', '3', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000068', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('368', '24', '3', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000069', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('369', '38', '3', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000070', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('370', '40', '3', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000071', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('371', '39', '3', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000072', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('372', '27', '4', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000073', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('373', '30', '4', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000074', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('374', '29', '4', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000075', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('375', '37', '4', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000076', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('376', '41', '4', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000077', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('377', '15', '4', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000078', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('378', '31', '4', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000079', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('379', '32', '4', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000080', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('380', '34', '4', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000081', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('381', '14', '4', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000082', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('382', '19', '4', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000083', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('383', '25', '4', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000084', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('384', '26', '4', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000085', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('385', '28', '4', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000086', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('386', '10', '4', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000087', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('387', '11', '4', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000088', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('388', '12', '4', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000089', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('389', '16', '4', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000090', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('390', '17', '4', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000091', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('391', '21', '4', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000092', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('392', '18', '4', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000093', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('393', '22', '4', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000094', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('394', '23', '4', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000095', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('395', '20', '4', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000096', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('396', '13', '4', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000097', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('397', '33', '4', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000098', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('398', '35', '4', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000099', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('399', '36', '4', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000100', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('400', '24', '4', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000101', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('401', '38', '4', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000102', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('402', '40', '4', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000103', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('403', '39', '4', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000104', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('404', '27', '6', '200', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000105', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('405', '30', '6', '200', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000106', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('406', '29', '6', '200', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000107', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('407', '37', '6', '200', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000108', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('408', '41', '6', '200', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000109', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('409', '15', '6', '200', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000110', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('410', '31', '6', '200', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000111', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('411', '32', '6', '200', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000112', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('412', '34', '6', '200', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000113', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('413', '14', '6', '200', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000114', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('414', '19', '6', '200', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000115', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('415', '25', '6', '200', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000116', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('416', '26', '6', '200', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000117', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('417', '28', '6', '200', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000118', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('418', '10', '6', '200', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000119', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('419', '11', '6', '200', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000120', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('420', '12', '6', '200', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000121', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('421', '16', '6', '200', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000122', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('422', '17', '6', '200', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000123', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('423', '21', '6', '200', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000124', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('424', '18', '6', '200', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000125', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('425', '22', '6', '200', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000126', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('426', '23', '6', '200', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000127', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('427', '20', '6', '200', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000128', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('428', '13', '6', '200', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000129', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('429', '33', '6', '200', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000130', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('430', '35', '6', '200', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000131', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('431', '36', '6', '200', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000132', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('432', '24', '6', '200', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000133', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('433', '38', '6', '200', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000134', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('434', '40', '6', '200', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000135', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('435', '39', '6', '200', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000136', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('436', '27', '7', '70', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000137', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('437', '30', '7', '70', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000138', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('438', '29', '7', '70', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000139', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('439', '37', '7', '70', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000140', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('440', '41', '7', '70', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000141', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('441', '15', '7', '70', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000142', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('442', '31', '7', '70', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000143', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('443', '32', '7', '70', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000144', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('444', '34', '7', '70', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000145', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('445', '14', '7', '70', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000146', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('446', '19', '7', '70', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000147', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('447', '25', '7', '70', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000148', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('448', '26', '7', '70', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000149', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('449', '28', '7', '70', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000150', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('450', '10', '7', '70', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000151', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('451', '11', '7', '70', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000152', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('452', '12', '7', '70', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000153', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('453', '16', '7', '70', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000154', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('454', '17', '7', '70', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000155', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('455', '21', '7', '70', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000156', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('456', '18', '7', '70', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000157', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('457', '22', '7', '70', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000158', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('458', '23', '7', '70', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000159', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('459', '20', '7', '70', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000160', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('460', '13', '7', '70', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000161', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('461', '33', '7', '70', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000162', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('462', '35', '7', '70', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000163', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('463', '36', '7', '70', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000164', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('464', '24', '7', '70', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000165', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('465', '38', '7', '70', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000166', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('466', '40', '7', '70', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000167', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('467', '39', '7', '70', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000168', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('468', '27', '8', '90.05', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000169', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('469', '30', '8', '90.05', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000170', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('470', '29', '8', '90.05', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000171', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('471', '37', '8', '90.05', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000172', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('472', '41', '8', '90.05', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000173', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('473', '15', '8', '90.05', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000174', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('474', '31', '8', '90.05', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000175', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('475', '32', '8', '90.05', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000176', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('476', '34', '8', '90.05', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000177', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('477', '14', '8', '90.05', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000178', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('478', '19', '8', '90.05', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000179', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('479', '25', '8', '90.05', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000180', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('480', '26', '8', '90.05', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000181', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('481', '28', '8', '90.05', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000182', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('482', '10', '8', '90.05', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000183', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('483', '11', '8', '90.05', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000184', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('484', '12', '8', '90.05', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000185', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('485', '16', '8', '90.05', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000186', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('486', '17', '8', '90.05', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000187', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('487', '21', '8', '90.05', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000188', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('488', '18', '8', '90.05', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000189', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('489', '22', '8', '90.05', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000190', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('490', '23', '8', '90.05', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000191', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('491', '20', '8', '90.05', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000192', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('492', '13', '8', '90.05', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000193', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('493', '33', '8', '90.05', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000194', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('494', '35', '8', '90.05', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000195', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('495', '36', '8', '90.05', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000196', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('496', '24', '8', '90.05', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000197', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('497', '38', '8', '90.05', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000198', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('498', '40', '8', '90.05', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000199', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('499', '39', '8', '90.05', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000200', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('500', '27', '8', '90.05', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000201', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('501', '29', '1', '250', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000202', '5');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('502', '27', '1', '250', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000203', '5');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('503', '30', '1', '250', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000204', '5');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('504', '29', '1', '250', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000205', '5');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('505', '37', '1', '250', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000206', '5');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('506', '41', '1', '250', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000207', '5');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('507', '15', '1', '250', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000208', '5');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('508', '31', '1', '250', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000209', '5');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('509', '32', '1', '250', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000210', '5');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('510', '34', '1', '250', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000211', '5');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('511', '14', '1', '250', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000212', '5');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('512', '19', '1', '250', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000213', '5');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('513', '25', '1', '250', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000214', '5');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('514', '26', '1', '250', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000215', '5');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('515', '28', '1', '250', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000216', '5');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('516', '10', '1', '250', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000217', '5');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('517', '11', '1', '250', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000218', '5');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('518', '12', '1', '250', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000219', '5');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('519', '16', '1', '250', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000220', '5');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('520', '17', '1', '250', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000221', '5');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('521', '21', '1', '250', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000222', '5');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('522', '18', '1', '250', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000223', '5');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('523', '22', '1', '250', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000224', '5');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('524', '23', '1', '250', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000225', '5');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('525', '20', '1', '250', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000226', '5');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('526', '13', '1', '250', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000227', '5');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('527', '33', '1', '250', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000228', '5');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('528', '35', '1', '250', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000229', '5');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('529', '36', '1', '250', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000230', '5');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('530', '24', '1', '250', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000231', '5');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('531', '38', '1', '250', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000232', '5');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('532', '40', '1', '250', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000233', '5');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('533', '39', '1', '250', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000234', '5');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('534', '27', '3', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000235', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('535', '30', '3', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000236', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('536', '29', '3', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000237', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('537', '37', '3', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000238', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('538', '41', '3', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000239', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('539', '15', '3', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000240', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('540', '31', '3', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000241', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('541', '32', '3', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000242', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('542', '34', '3', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000243', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('543', '14', '3', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000244', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('544', '19', '3', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000245', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('545', '25', '3', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000246', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('546', '26', '3', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000247', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('547', '28', '3', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000248', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('548', '10', '3', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000249', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('549', '11', '3', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000250', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('550', '12', '3', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000251', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('551', '16', '3', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000252', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('552', '17', '3', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000253', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('553', '21', '3', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000254', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('554', '18', '3', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000255', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('555', '22', '3', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000256', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('556', '23', '3', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000257', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('557', '20', '3', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000258', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('558', '13', '3', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000259', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('559', '33', '3', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000260', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('560', '35', '3', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000261', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('561', '36', '3', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000262', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('562', '24', '3', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000263', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('563', '38', '3', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000264', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('564', '40', '3', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000265', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('565', '39', '3', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000266', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('566', '27', '4', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000267', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('567', '30', '4', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000268', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('568', '29', '4', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000269', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('569', '37', '4', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000270', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('570', '41', '4', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000271', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('571', '15', '4', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000272', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('572', '31', '4', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000273', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('573', '32', '4', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000274', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('574', '34', '4', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000275', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('575', '14', '4', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000276', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('576', '19', '4', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000277', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('577', '25', '4', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000278', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('578', '26', '4', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000279', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('579', '28', '4', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000280', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('580', '10', '4', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000281', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('581', '11', '4', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000282', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('582', '12', '4', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000283', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('583', '16', '4', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000284', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('584', '17', '4', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000285', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('585', '21', '4', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000286', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('586', '18', '4', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000287', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('587', '22', '4', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000288', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('588', '23', '4', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000289', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('589', '20', '4', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000290', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('590', '13', '4', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000291', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('591', '33', '4', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000292', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('592', '35', '4', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000293', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('593', '36', '4', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000294', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('594', '24', '4', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000295', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('595', '38', '4', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000296', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('596', '40', '4', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000297', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('597', '39', '4', '160', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000298', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('598', '27', '6', '200', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000299', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('599', '30', '6', '200', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000300', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('600', '29', '6', '200', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000301', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('601', '37', '6', '200', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000302', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('602', '41', '6', '200', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000303', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('603', '15', '6', '200', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000304', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('604', '31', '6', '200', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000305', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('605', '32', '6', '200', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000306', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('606', '34', '6', '200', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000307', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('607', '14', '6', '200', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000308', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('608', '19', '6', '200', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000309', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('609', '25', '6', '200', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000310', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('610', '26', '6', '200', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000311', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('611', '28', '6', '200', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000312', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('612', '10', '6', '200', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000313', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('613', '11', '6', '200', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000314', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('614', '12', '6', '200', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000315', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('615', '16', '6', '200', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000316', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('616', '17', '6', '200', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000317', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('617', '21', '6', '200', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000318', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('618', '18', '6', '200', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000319', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('619', '22', '6', '200', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000320', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('620', '23', '6', '200', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000321', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('621', '20', '6', '200', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000322', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('622', '13', '6', '200', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000323', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('623', '33', '6', '200', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000324', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('624', '35', '6', '200', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000325', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('625', '36', '6', '200', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000326', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('626', '24', '6', '200', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000327', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('627', '38', '6', '200', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000328', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('628', '40', '6', '200', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000329', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('629', '39', '6', '200', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000330', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('630', '27', '7', '70', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000331', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('631', '30', '7', '70', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000332', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('632', '29', '7', '70', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000333', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('633', '37', '7', '70', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000334', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('634', '41', '7', '70', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000335', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('635', '15', '7', '70', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000336', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('636', '31', '7', '70', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000337', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('637', '32', '7', '70', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000338', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('638', '34', '7', '70', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000339', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('639', '14', '7', '70', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000340', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('640', '19', '7', '70', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000341', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('641', '25', '7', '70', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000342', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('642', '26', '7', '70', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000343', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('643', '28', '7', '70', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000344', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('644', '10', '7', '70', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000345', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('645', '11', '7', '70', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000346', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('646', '12', '7', '70', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000347', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('647', '16', '7', '70', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000348', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('648', '17', '7', '70', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000349', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('649', '21', '7', '70', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000350', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('650', '18', '7', '70', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000351', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('651', '22', '7', '70', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000352', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('652', '23', '7', '70', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000353', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('653', '20', '7', '70', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000354', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('654', '13', '7', '70', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000355', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('655', '33', '7', '70', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000356', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('656', '35', '7', '70', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000357', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('657', '36', '7', '70', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000358', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('658', '24', '7', '70', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000359', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('659', '38', '7', '70', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000360', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('660', '40', '7', '70', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000361', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('661', '39', '7', '70', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000362', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('662', '27', '8', '90.05', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000363', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('663', '30', '8', '90.05', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000364', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('664', '29', '8', '90.05', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000365', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('665', '37', '8', '90.05', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000366', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('666', '41', '8', '90.05', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000367', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('667', '15', '8', '90.05', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000368', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('668', '31', '8', '90.05', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000369', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('669', '32', '8', '90.05', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000370', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('670', '34', '8', '90.05', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000371', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('671', '14', '8', '90.05', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000372', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('672', '19', '8', '90.05', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000373', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('673', '25', '8', '90.05', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000374', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('674', '26', '8', '90.05', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000375', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('675', '28', '8', '90.05', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000376', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('676', '10', '8', '90.05', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000377', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('677', '11', '8', '90.05', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000378', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('678', '12', '8', '90.05', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000379', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('679', '16', '8', '90.05', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000380', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('680', '17', '8', '90.05', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000381', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('681', '21', '8', '90.05', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000382', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('682', '18', '8', '90.05', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000383', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('683', '22', '8', '90.05', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000384', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('684', '23', '8', '90.05', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000385', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('685', '20', '8', '90.05', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000386', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('686', '13', '8', '90.05', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000387', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('687', '33', '8', '90.05', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000388', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('688', '35', '8', '90.05', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000389', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('689', '36', '8', '90.05', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000390', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('690', '24', '8', '90.05', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000391', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('691', '38', '8', '90.05', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000392', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('692', '40', '8', '90.05', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000393', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('693', '39', '8', '90.05', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000394', '9');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('694', '41', '1', '250', '0', '2024-09-05', '2024-09-05', 'No pagado', '1000395', '5');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('695', '32', '1', '250', '0', '2024-09-05', '2024-09-05', 'No pagado', '1000396', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('696', '31', '1', '250', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000397', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('697', '41', '1', '0', '500', '2024-09-05', '2024-11-05', 'No pagado', '1000398', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('698', '31', '6', '0', '200', '2024-09-03', '2024-10-03', 'No pagado', '1000399', '5');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('701', '31', '6', '200', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000400', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('702', '31', '4', '160.00', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000401', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('703', '32', '3', '160.00', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000402', '2');
INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES ('704', '31', '1', '250.00', '0', '2024-09-03', '2024-09-03', 'No pagado', '1000403', '2');

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

INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`, `tipo_pago`, `forma_pago`, `n_referencia`) VALUES ('186', '2000000', '37', '311', '2024-09-03', '250', '160', '-90', '1', '1', '1', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`, `tipo_pago`, `forma_pago`, `n_referencia`) VALUES ('187', '2000001', '27', '340', '2024-09-03', '160', '10', '-150', '1', '1', '3', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`, `tipo_pago`, `forma_pago`, `n_referencia`) VALUES ('188', '2000002', '10', '322', '2024-09-03', '250', '50', '-200', '1', '1', '1', 'Efectivo', 'Físico', 'Ninguna');
INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`, `tipo_pago`, `forma_pago`, `n_referencia`) VALUES ('189', '2000003', '30', '300', '2024-09-03', '160', '160', '0', '1', '1', '3', 'Efectivo', 'Físico', 'Ninguna');

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
INSERT INTO `propietarios` (`id_propietario`, `nombre`, `dni`, `correo`, `fecha`, `id_estado`, `observacion`, `telefono`) VALUES ('22', 'NNJKK', '12', 'jj@gmail.com', '2024-08-02', '1', '', '74');
INSERT INTO `propietarios` (`id_propietario`, `nombre`, `dni`, `correo`, `fecha`, `id_estado`, `observacion`, `telefono`) VALUES ('23', 'JUAN', '123456789', 'juancho@gmail.com', '2024-08-02', '1', '\r\n            ', '123456');
INSERT INTO `propietarios` (`id_propietario`, `nombre`, `dni`, `correo`, `fecha`, `id_estado`, `observacion`, `telefono`) VALUES ('24', 'ELDE', '7', 'juancho@gmail.com', '2024-08-02', '1', 'minicraft\n            ', '4');
INSERT INTO `propietarios` (`id_propietario`, `nombre`, `dni`, `correo`, `fecha`, `id_estado`, `observacion`, `telefono`) VALUES ('25', '', '', '', '2024-08-02', '1', '\r\n            ', '');
INSERT INTO `propietarios` (`id_propietario`, `nombre`, `dni`, `correo`, `fecha`, `id_estado`, `observacion`, `telefono`) VALUES ('26', '', '', '', '2024-08-02', '1', '\r\n            ', '');
INSERT INTO `propietarios` (`id_propietario`, `nombre`, `dni`, `correo`, `fecha`, `id_estado`, `observacion`, `telefono`) VALUES ('27', 'NNJO', '12', 'jj@gmail.com', '2024-08-02', '1', '', '74');
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
INSERT INTO `propietarios` (`id_propietario`, `nombre`, `dni`, `correo`, `fecha`, `id_estado`, `observacion`, `telefono`) VALUES ('43', 'PACO', '0000', 'paco@gmail.com', '2024-08-02', '1', '\n            ', '94856463');
INSERT INTO `propietarios` (`id_propietario`, `nombre`, `dni`, `correo`, `fecha`, `id_estado`, `observacion`, `telefono`) VALUES ('44', 'PRUEBA', '2', 'prueba@gmail.com', '2024-08-05', '1', '\r\n            ', '94856463');
INSERT INTO `propietarios` (`id_propietario`, `nombre`, `dni`, `correo`, `fecha`, `id_estado`, `observacion`, `telefono`) VALUES ('45', '', '', '', '2024-08-15', '1', 'Registro por intercambio', '');
INSERT INTO `propietarios` (`id_propietario`, `nombre`, `dni`, `correo`, `fecha`, `id_estado`, `observacion`, `telefono`) VALUES ('46', '', '', '', '2024-08-15', '1', 'Registro por intercambio', '');
INSERT INTO `propietarios` (`id_propietario`, `nombre`, `dni`, `correo`, `fecha`, `id_estado`, `observacion`, `telefono`) VALUES ('47', '', '', '', '2024-08-15', '1', 'Registro por intercambio', '');
INSERT INTO `propietarios` (`id_propietario`, `nombre`, `dni`, `correo`, `fecha`, `id_estado`, `observacion`, `telefono`) VALUES ('48', 'PABLO ESCOBAR', '0101199903209', 'pablo@gmail.com', '2024-08-21', '1', '', '94856463');
INSERT INTO `propietarios` (`id_propietario`, `nombre`, `dni`, `correo`, `fecha`, `id_estado`, `observacion`, `telefono`) VALUES ('49', 'TKM', '11111', 'j@gmail.com', '2024-08-25', '1', '', '91811076');
INSERT INTO `propietarios` (`id_propietario`, `nombre`, `dni`, `correo`, `fecha`, `id_estado`, `observacion`, `telefono`) VALUES ('50', 'JJ', '1151555', 'kk@gmail.com', '2024-08-25', '1', '', '858585555');
INSERT INTO `propietarios` (`id_propietario`, `nombre`, `dni`, `correo`, `fecha`, `id_estado`, `observacion`, `telefono`) VALUES ('51', '', '', '', '2024-09-02', '1', 'Registro por intercambio', '');
INSERT INTO `propietarios` (`id_propietario`, `nombre`, `dni`, `correo`, `fecha`, `id_estado`, `observacion`, `telefono`) VALUES ('52', 'JUANCHO', '0104199803214', 'juan@gmail.com', '2024-09-02', '1', 'Registro por intercambio', '852741963');
INSERT INTO `propietarios` (`id_propietario`, `nombre`, `dni`, `correo`, `fecha`, `id_estado`, `observacion`, `telefono`) VALUES ('53', 'ARMANDO PAREDES', '88888888888888888888', 'armando@gmail.com', '2024-09-03', '1', 'Reingreso\r\n            ', '85657133');
INSERT INTO `propietarios` (`id_propietario`, `nombre`, `dni`, `correo`, `fecha`, `id_estado`, `observacion`, `telefono`) VALUES ('54', 'JOJO', '74', 'gl@pp', '2024-09-04', '1', '', '84');
INSERT INTO `propietarios` (`id_propietario`, `nombre`, `dni`, `correo`, `fecha`, `id_estado`, `observacion`, `telefono`) VALUES ('55', 'RORO', '7888', 'll@ll', '2024-09-04', '1', '', '85');
INSERT INTO `propietarios` (`id_propietario`, `nombre`, `dni`, `correo`, `fecha`, `id_estado`, `observacion`, `telefono`) VALUES ('56', 'JOH', '8', 'po@ss', '2024-09-04', '1', '', '74');
INSERT INTO `propietarios` (`id_propietario`, `nombre`, `dni`, `correo`, `fecha`, `id_estado`, `observacion`, `telefono`) VALUES ('57', 'LOROKO', '87777', 'k@k', '2024-09-04', '1', '', '7');
INSERT INTO `propietarios` (`id_propietario`, `nombre`, `dni`, `correo`, `fecha`, `id_estado`, `observacion`, `telefono`) VALUES ('58', 'INSECTO', '77777777', 'rr@ff', '2024-09-04', '1', '', '845');
INSERT INTO `propietarios` (`id_propietario`, `nombre`, `dni`, `correo`, `fecha`, `id_estado`, `observacion`, `telefono`) VALUES ('59', 'UU', '44', 'y@aaa', '2024-09-04', '1', '', '7878');
INSERT INTO `propietarios` (`id_propietario`, `nombre`, `dni`, `correo`, `fecha`, `id_estado`, `observacion`, `telefono`) VALUES ('60', 'UUUU', '7', 'uy@w', '2024-09-04', '1', '', '77');
INSERT INTO `propietarios` (`id_propietario`, `nombre`, `dni`, `correo`, `fecha`, `id_estado`, `observacion`, `telefono`) VALUES ('61', 'REX', '852852852', 'aq@oo', '2024-09-04', '1', '', '88888');

INSERT INTO `propietarios_villas` (`id_unir`, `id_propietario`, `id_villa`) VALUES ('10', '9', '');
INSERT INTO `propietarios_villas` (`id_unir`, `id_propietario`, `id_villa`) VALUES ('11', '9', '56');
INSERT INTO `propietarios_villas` (`id_unir`, `id_propietario`, `id_villa`) VALUES ('12', '10', '57');
INSERT INTO `propietarios_villas` (`id_unir`, `id_propietario`, `id_villa`) VALUES ('13', '11', '71');
INSERT INTO `propietarios_villas` (`id_unir`, `id_propietario`, `id_villa`) VALUES ('14', '12', '47');
INSERT INTO `propietarios_villas` (`id_unir`, `id_propietario`, `id_villa`) VALUES ('15', '', '');
INSERT INTO `propietarios_villas` (`id_unir`, `id_propietario`, `id_villa`) VALUES ('16', '11', '58');
INSERT INTO `propietarios_villas` (`id_unir`, `id_propietario`, `id_villa`) VALUES ('17', '11', '59');
INSERT INTO `propietarios_villas` (`id_unir`, `id_propietario`, `id_villa`) VALUES ('18', '11', '61');
INSERT INTO `propietarios_villas` (`id_unir`, `id_propietario`, `id_villa`) VALUES ('19', '52', '51');
INSERT INTO `propietarios_villas` (`id_unir`, `id_propietario`, `id_villa`) VALUES ('20', '2', '64');
INSERT INTO `propietarios_villas` (`id_unir`, `id_propietario`, `id_villa`) VALUES ('21', '15', '60');
INSERT INTO `propietarios_villas` (`id_unir`, `id_propietario`, `id_villa`) VALUES ('22', '17', '62');
INSERT INTO `propietarios_villas` (`id_unir`, `id_propietario`, `id_villa`) VALUES ('23', '18', '63');
INSERT INTO `propietarios_villas` (`id_unir`, `id_propietario`, `id_villa`) VALUES ('24', '', '');
INSERT INTO `propietarios_villas` (`id_unir`, `id_propietario`, `id_villa`) VALUES ('25', '', '');
INSERT INTO `propietarios_villas` (`id_unir`, `id_propietario`, `id_villa`) VALUES ('26', '21', '53');
INSERT INTO `propietarios_villas` (`id_unir`, `id_propietario`, `id_villa`) VALUES ('27', '22', '');
INSERT INTO `propietarios_villas` (`id_unir`, `id_propietario`, `id_villa`) VALUES ('28', '23', '54');
INSERT INTO `propietarios_villas` (`id_unir`, `id_propietario`, `id_villa`) VALUES ('29', '24', '');
INSERT INTO `propietarios_villas` (`id_unir`, `id_propietario`, `id_villa`) VALUES ('30', '27', '');
INSERT INTO `propietarios_villas` (`id_unir`, `id_propietario`, `id_villa`) VALUES ('31', '28', '38');
INSERT INTO `propietarios_villas` (`id_unir`, `id_propietario`, `id_villa`) VALUES ('32', '28', '39');
INSERT INTO `propietarios_villas` (`id_unir`, `id_propietario`, `id_villa`) VALUES ('33', '2', '73');
INSERT INTO `propietarios_villas` (`id_unir`, `id_propietario`, `id_villa`) VALUES ('34', '2', '40');
INSERT INTO `propietarios_villas` (`id_unir`, `id_propietario`, `id_villa`) VALUES ('35', '1', '74');
INSERT INTO `propietarios_villas` (`id_unir`, `id_propietario`, `id_villa`) VALUES ('36', '2', '75');
INSERT INTO `propietarios_villas` (`id_unir`, `id_propietario`, `id_villa`) VALUES ('37', '', '');
INSERT INTO `propietarios_villas` (`id_unir`, `id_propietario`, `id_villa`) VALUES ('38', '44', '77');
INSERT INTO `propietarios_villas` (`id_unir`, `id_propietario`, `id_villa`) VALUES ('39', '48', '84');
INSERT INTO `propietarios_villas` (`id_unir`, `id_propietario`, `id_villa`) VALUES ('40', '49', '78');
INSERT INTO `propietarios_villas` (`id_unir`, `id_propietario`, `id_villa`) VALUES ('41', '50', '37');
INSERT INTO `propietarios_villas` (`id_unir`, `id_propietario`, `id_villa`) VALUES ('42', '53', '46');
INSERT INTO `propietarios_villas` (`id_unir`, `id_propietario`, `id_villa`) VALUES ('43', '60', '45');
INSERT INTO `propietarios_villas` (`id_unir`, `id_propietario`, `id_villa`) VALUES ('44', '61', '41');

INSERT INTO `usuarios` (`id_usuario`, `nombre`, `apellido`, `dni`, `telefono`, `correo`, `id_acceso`, `clave`, `id_estado`, `usuario`) VALUES ('2', 'ANTHONY', 'OLIVA', '010119993209', '94856466', 'anthonyoliva70@gmail.com', '1', '741852', '1', 'ANTHONY');
INSERT INTO `usuarios` (`id_usuario`, `nombre`, `apellido`, `dni`, `telefono`, `correo`, `id_acceso`, `clave`, `id_estado`, `usuario`) VALUES ('3', 'NESTOR', 'OLIVA', '01010000000', '94856463', 'nestor@gmail.com', '2', '123456', '1', 'NESTOR');
INSERT INTO `usuarios` (`id_usuario`, `nombre`, `apellido`, `dni`, `telefono`, `correo`, `id_acceso`, `clave`, `id_estado`, `usuario`) VALUES ('4', 'ELDER', 'OLIVA', '01012222222', '94856463', 'njjvnfjvjf@nvfvfn', '2', '123456', '1', 'ELDER');
INSERT INTO `usuarios` (`id_usuario`, `nombre`, `apellido`, `dni`, `telefono`, `correo`, `id_acceso`, `clave`, `id_estado`, `usuario`) VALUES ('6', 'ANDREA', 'MURILLO', '0101196801005', '96723864', 'xiomarandrea@gmail.com', '2', '123456', '2', 'XIOMARA');
INSERT INTO `usuarios` (`id_usuario`, `nombre`, `apellido`, `dni`, `telefono`, `correo`, `id_acceso`, `clave`, `id_estado`, `usuario`) VALUES ('7', 'ANDRE', 'MURILLO', '0101196801005', '96723864', 'xiomarandrea@gmail.com', '2', '1234567', '2', 'XIOMARA');
INSERT INTO `usuarios` (`id_usuario`, `nombre`, `apellido`, `dni`, `telefono`, `correo`, `id_acceso`, `clave`, `id_estado`, `usuario`) VALUES ('8', 'TOMY', 'HALLEN', '0101196801005', '96723864', 'tomy@gg', '1', '123456', '1', 'TOMY');
INSERT INTO `usuarios` (`id_usuario`, `nombre`, `apellido`, `dni`, `telefono`, `correo`, `id_acceso`, `clave`, `id_estado`, `usuario`) VALUES ('9', 'ANDREA', 'MURILLO', '0101196801005', '96723864', 'xiomarandrea@gmail.com', '1', '123456', '1', 'XIOMARA');
INSERT INTO `usuarios` (`id_usuario`, `nombre`, `apellido`, `dni`, `telefono`, `correo`, `id_acceso`, `clave`, `id_estado`, `usuario`) VALUES ('10', 'ASHANTY', 'GONZALES', '0101200405646', '84651233', 'acha.gon@gmail.com', '2', '963852', '1', 'ASHANTY');
INSERT INTO `usuarios` (`id_usuario`, `nombre`, `apellido`, `dni`, `telefono`, `correo`, `id_acceso`, `clave`, `id_estado`, `usuario`) VALUES ('11', 'NESTOR', 'OLIVA', '0101199903209', '94856463', 'anthony.oliva80@unitec.edu', '2', '123456789', '1', 'NESTOR');
INSERT INTO `usuarios` (`id_usuario`, `nombre`, `apellido`, `dni`, `telefono`, `correo`, `id_acceso`, `clave`, `id_estado`, `usuario`) VALUES ('12', 'KCMDKCMDK', 'DMKMDKCMKD', 'DKMKDMVKFMK', 'KDMVKMKVFMKV', 'vmkvmkkf@v', '1', 'cmdkmckdmckd', '1', 'MKCDMKCMDK');

INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_condicion`, `id_estado`, `direccion`, `observacion`, `modelo`) VALUES ('33', '1', '1', '123456789', '5', '250', '1', '1', 'Roma, Palma Real', '', 'VILLA ARRECIFE');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_condicion`, `id_estado`, `direccion`, `observacion`, `modelo`) VALUES ('34', '1', '2', '123456789', '5', '250', '1', '1', 'Roma, Palma Real', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_condicion`, `id_estado`, `direccion`, `observacion`, `modelo`) VALUES ('35', '1', '3', '123456789', '5', '250', '1', '1', 'Roma, Palma Real', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_condicion`, `id_estado`, `direccion`, `observacion`, `modelo`) VALUES ('36', '1', '4', '123456789', '5', '250', '1', '1', 'Roma, Palma Real', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_condicion`, `id_estado`, `direccion`, `observacion`, `modelo`) VALUES ('37', '1', '5', '123456789', '5', '250', '1', '2', 'Roma, Palma Real', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_condicion`, `id_estado`, `direccion`, `observacion`, `modelo`) VALUES ('38', '1', '6', '123456', '7', '250', '1', '1', '', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_condicion`, `id_estado`, `direccion`, `observacion`, `modelo`) VALUES ('39', '1', '7', '123456', '7', '250', '1', '2', '', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_condicion`, `id_estado`, `direccion`, `observacion`, `modelo`) VALUES ('40', '1', '8', '123456', '7', '250', '1', '2', '', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_condicion`, `id_estado`, `direccion`, `observacion`, `modelo`) VALUES ('41', '1', '11', '', '', '', '1', '2', '', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_condicion`, `id_estado`, `direccion`, `observacion`, `modelo`) VALUES ('42', '1', '12', '', '', '', '1', '1', '', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_condicion`, `id_estado`, `direccion`, `observacion`, `modelo`) VALUES ('43', '1', '13', '', '', '', '1', '1', '', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_condicion`, `id_estado`, `direccion`, `observacion`, `modelo`) VALUES ('44', '1', '14', '', '', '', '1', '1', '', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_condicion`, `id_estado`, `direccion`, `observacion`, `modelo`) VALUES ('45', '1', '17', '1234567899', '5', '255.05', '1', '2', '', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_condicion`, `id_estado`, `direccion`, `observacion`, `modelo`) VALUES ('46', '1', '18', '1234567899', '5', '255.05', '1', '2', '', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_condicion`, `id_estado`, `direccion`, `observacion`, `modelo`) VALUES ('47', '1', '70', '123456789', '5', '200.1', '1', '2', '', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_condicion`, `id_estado`, `direccion`, `observacion`, `modelo`) VALUES ('48', '1', '71', '123456789', '5', '200.1', '1', '1', '', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_condicion`, `id_estado`, `direccion`, `observacion`, `modelo`) VALUES ('49', '1', '78', '123456789', '5', '10.5', '1', '1', '', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_condicion`, `id_estado`, `direccion`, `observacion`, `modelo`) VALUES ('50', '1', '79', '123456789', '5', '10.5', '1', '1', '', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_condicion`, `id_estado`, `direccion`, `observacion`, `modelo`) VALUES ('51', '2', '1', '123456789', '5', '200.1', '1', '2', '', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_condicion`, `id_estado`, `direccion`, `observacion`, `modelo`) VALUES ('52', '2', '2', '', '', '', '1', '1', '', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_condicion`, `id_estado`, `direccion`, `observacion`, `modelo`) VALUES ('53', '2', '3', '', '', '', '1', '2', '', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_condicion`, `id_estado`, `direccion`, `observacion`, `modelo`) VALUES ('54', '2', '4', '', '', '', '1', '2', '', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_condicion`, `id_estado`, `direccion`, `observacion`, `modelo`) VALUES ('55', '3', '1', '123456789', '5', '200.1', '1', '2', '', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_condicion`, `id_estado`, `direccion`, `observacion`, `modelo`) VALUES ('56', '3', '2', '', '', '', '1', '2', '', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_condicion`, `id_estado`, `direccion`, `observacion`, `modelo`) VALUES ('57', '3', '3', '123456789', '5', '200.1', '1', '2', '', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_condicion`, `id_estado`, `direccion`, `observacion`, `modelo`) VALUES ('58', '3', '12', '', '', '', '1', '2', '', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_condicion`, `id_estado`, `direccion`, `observacion`, `modelo`) VALUES ('59', '3', '13', '', '', '', '1', '2', '', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_condicion`, `id_estado`, `direccion`, `observacion`, `modelo`) VALUES ('60', '3', '14', '', '', '', '1', '2', '', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_condicion`, `id_estado`, `direccion`, `observacion`, `modelo`) VALUES ('61', '3', '20', '', '', '', '1', '2', '', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_condicion`, `id_estado`, `direccion`, `observacion`, `modelo`) VALUES ('62', '3', '21', '', '', '', '1', '2', '', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_condicion`, `id_estado`, `direccion`, `observacion`, `modelo`) VALUES ('63', '3', '22', '', '', '', '1', '2', '', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_condicion`, `id_estado`, `direccion`, `observacion`, `modelo`) VALUES ('64', '3', '23', '', '', '', '1', '2', '', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_condicion`, `id_estado`, `direccion`, `observacion`, `modelo`) VALUES ('65', '1', '99', '', '', '', '1', '1', '', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_condicion`, `id_estado`, `direccion`, `observacion`, `modelo`) VALUES ('66', '1', '200', '', '', '', '1', '1', '', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_condicion`, `id_estado`, `direccion`, `observacion`, `modelo`) VALUES ('67', '1', '201', '', '', '', '1', '1', '', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_condicion`, `id_estado`, `direccion`, `observacion`, `modelo`) VALUES ('68', '1', '202', '', '', '', '1', '1', '', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_condicion`, `id_estado`, `direccion`, `observacion`, `modelo`) VALUES ('69', '1', '203', '', '', '', '1', '1', '', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_condicion`, `id_estado`, `direccion`, `observacion`, `modelo`) VALUES ('70', '1', '204', '', '', '1.50', '1', '1', '', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_condicion`, `id_estado`, `direccion`, `observacion`, `modelo`) VALUES ('71', '3', '40', '123456789', '2', '250.10', '1', '2', 'roma', 'prueba', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_condicion`, `id_estado`, `direccion`, `observacion`, `modelo`) VALUES ('73', '4', '1', '123456789', '2', '150', '1', '2', '', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_condicion`, `id_estado`, `direccion`, `observacion`, `modelo`) VALUES ('74', '4', '2', '123456789', '2', '150', '1', '2', '', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_condicion`, `id_estado`, `direccion`, `observacion`, `modelo`) VALUES ('75', '4', '3', '123456789', '2', '150', '1', '2', '', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_condicion`, `id_estado`, `direccion`, `observacion`, `modelo`) VALUES ('76', '4', '4', '123456789', '4', '500', '1', '1', '', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_condicion`, `id_estado`, `direccion`, `observacion`, `modelo`) VALUES ('77', '4', '12', '123456', '7', '150', '1', '2', '', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_condicion`, `id_estado`, `direccion`, `observacion`, `modelo`) VALUES ('78', '4', '15', '777777777', '2', '600', '1', '2', '', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_condicion`, `id_estado`, `direccion`, `observacion`, `modelo`) VALUES ('79', '1', '15', '5555555555555', '2', '250', '1', '1', 'Roma, Palma Real', 'Tiene una fuga de gas', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_condicion`, `id_estado`, `direccion`, `observacion`, `modelo`) VALUES ('80', '1', '50', '5555555555555', '2', '250', '1', '1', 'Roma, Juteapa', 'Mucha agua', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_condicion`, `id_estado`, `direccion`, `observacion`, `modelo`) VALUES ('81', '1', '88', '', '', '', '1', '1', '', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_condicion`, `id_estado`, `direccion`, `observacion`, `modelo`) VALUES ('82', '1', '89', '', '', '', '1', '1', '', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_condicion`, `id_estado`, `direccion`, `observacion`, `modelo`) VALUES ('83', '1', '74', '', '', '', '1', '1', '', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_condicion`, `id_estado`, `direccion`, `observacion`, `modelo`) VALUES ('84', '5', '1', '123456789', '3', '300.50', '1', '2', '', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_condicion`, `id_estado`, `direccion`, `observacion`, `modelo`) VALUES ('85', '1', '', '', '', '', '1', '1', '', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_condicion`, `id_estado`, `direccion`, `observacion`, `modelo`) VALUES ('86', '16', '2', '12345678910', '5', '500', '1', '1', 'Al norte del hotel', 'Ninguna', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_condicion`, `id_estado`, `direccion`, `observacion`, `modelo`) VALUES ('87', '16', '2', '12345678910', '5', '500', '1', '1', 'Al norte del hotel', 'Ninguna', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_condicion`, `id_estado`, `direccion`, `observacion`, `modelo`) VALUES ('88', '16', '', '', '', '', '1', '1', '', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_condicion`, `id_estado`, `direccion`, `observacion`, `modelo`) VALUES ('89', '16', '', '', '', '', '1', '1', '', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_condicion`, `id_estado`, `direccion`, `observacion`, `modelo`) VALUES ('90', '16', '3', '741852963', '2', '250', '1', '1', 'Al norte', 'Techo roto', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_condicion`, `id_estado`, `direccion`, `observacion`, `modelo`) VALUES ('91', '16', '3', '741852963', '2', '250', '1', '1', 'Al norte', 'Techo roto', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_condicion`, `id_estado`, `direccion`, `observacion`, `modelo`) VALUES ('92', '16', '4', '7', '2', '7', '1', '1', '', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_condicion`, `id_estado`, `direccion`, `observacion`, `modelo`) VALUES ('93', '16', '4', '7', '2', '7', '1', '1', '', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_condicion`, `id_estado`, `direccion`, `observacion`, `modelo`) VALUES ('94', '16', '22', '8888', '1', '12', '1', '1', 'kkkkk', 'kkkkkkkkkk', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_condicion`, `id_estado`, `direccion`, `observacion`, `modelo`) VALUES ('95', '16', '21', '477777777777', '12', '500', '1', '1', '', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_condicion`, `id_estado`, `direccion`, `observacion`, `modelo`) VALUES ('96', '16', '21', '477777777777', '12', '500', '1', '1', '', '', '');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_condicion`, `id_estado`, `direccion`, `observacion`, `modelo`) VALUES ('98', '4', '11', '22', '33', '44', '1', '1', '66', '77', 'VILLA ARRECIFE');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_condicion`, `id_estado`, `direccion`, `observacion`, `modelo`) VALUES ('99', '1', '2', '3', '4', '5', '1', '1', 'pp', 'ppp', 'VILLA ESTRELLA');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_condicion`, `id_estado`, `direccion`, `observacion`, `modelo`) VALUES ('100', '1', '14', '741852963369', '2', '500', '1', '1', 'Al norte', 'La casa de micheleti', 'VILLA ARRECIFE');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_condicion`, `id_estado`, `direccion`, `observacion`, `modelo`) VALUES ('101', '1', '12', '7', '4', '44', '1', '1', 'qqqqqqqqqqqqq', 'eeeeeeeeeeeeeee', 'VILLA ARRECIFE');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_condicion`, `id_estado`, `direccion`, `observacion`, `modelo`) VALUES ('102', '1', '100', '741852963', '2', '250.50', '1', '1', 'El cafe', 'super cafe', 'VILLA ARRECIFE');
INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_condicion`, `id_estado`, `direccion`, `observacion`, `modelo`) VALUES ('103', '2', '101', '741852963', '2', '300', '1', '1', 'cafe', 'gallina', 'VILLA ARRECIFE');

SET FOREIGN_KEY_CHECKS=1;
