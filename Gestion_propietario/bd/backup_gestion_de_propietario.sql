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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
  `con_pagado` varchar(50) NOT NULL,
  PRIMARY KEY (`id_cuenta`),
  KEY `FK_cuenta_concepto` (`id_concepto`),
  KEY `FK_cuentas_propietarios_villas` (`id_unir`),
  KEY `FK_concepto_2` (`id_concepto_2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `modelo_villa` (
  `id_modelo` int NOT NULL AUTO_INCREMENT,
  `modelo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_estado` int DEFAULT NULL,
  PRIMARY KEY (`id_modelo`),
  KEY `FK_modelo_villa_estado_modelos` (`id_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `propietarios_villas` (
  `id_unir` int NOT NULL AUTO_INCREMENT,
  `id_propietario` int DEFAULT NULL,
  `id_villa` int DEFAULT NULL,
  PRIMARY KEY (`id_unir`),
  KEY `FK_propietarios_villas_propietarios` (`id_propietario`),
  KEY `FK_propietarios_villas_villas` (`id_villa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `temporal` (
  `clave_temp` varbinary(500) NOT NULL,
  PRIMARY KEY (`clave_temp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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