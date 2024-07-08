-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 08-07-2024 a las 04:08:46
-- Versión del servidor: 8.0.30
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `gestion_de_propietario`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caracteristicas`
--

CREATE TABLE `caracteristicas` (
  `id_caracteristica` int NOT NULL,
  `id_villa` int DEFAULT NULL,
  `caracteristica` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `caracteristicas`
--

INSERT INTO `caracteristicas` (`id_caracteristica`, `id_villa`, `caracteristica`) VALUES
(9, 5, 'Picina privada'),
(10, 5, 'Bodega'),
(11, 5, 'Frente al mar'),
(12, 6, 'Vista al mar'),
(13, 6, 'Bodega');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `concepto`
--

CREATE TABLE `concepto` (
  `id_concepto` int NOT NULL,
  `concepto` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `tipo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `valor` double DEFAULT NULL,
  `referencia` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_estado` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `concepto`
--

INSERT INTO `concepto` (`id_concepto`, `concepto`, `tipo`, `valor`, `referencia`, `id_estado`) VALUES
(1, 'PAGO MENSUAL', 'Abono', 160, 'No', 1),
(2, 'MANTENIMIENTO', 'Abono', 160, 'No', 1),
(3, 'FACTURA', 'Cargo', 0, 'Si', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `condicion_villas`
--

CREATE TABLE `condicion_villas` (
  `id_condicion` int NOT NULL,
  `condicion` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `condicion_villas`
--

INSERT INTO `condicion_villas` (`id_condicion`, `condicion`) VALUES
(1, 'Buen estado'),
(2, 'Mantenimiento');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentas`
--

CREATE TABLE `cuentas` (
  `id_cuenta` int NOT NULL,
  `id_unir` int DEFAULT NULL,
  `id_concepto` int DEFAULT NULL,
  `costo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `abono` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `desde` date DEFAULT NULL,
  `hasta` date DEFAULT NULL,
  `pagado` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `codigo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `cuentas`
--

INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES
(1, 2, 1, '160', '0', '2024-06-14', '2024-06-14', 'No pagado', '1000000'),
(2, 5, 2, '160', '0', '2024-06-14', '2024-06-14', 'No pagado', '1000001'),
(3, 2, 2, '160', '0', '2024-06-14', '2024-06-14', 'No pagado', '1000002'),
(4, 2, 2, '150', '0', '2024-06-14', '2024-06-14', 'No pagado', '1000003'),
(5, 2, 2, '150', '0', '2024-06-14', '2024-08-16', 'No pagado', '1000004'),
(6, 3, 2, '160', '0', '2024-06-17', '2024-07-17', 'No pagado', '1000005'),
(7, 3, 2, '160', '0', '2024-06-17', '2024-06-17', 'No pagado', '1000006'),
(8, 3, 2, '160', '0', '2024-06-17', '2024-06-17', 'No pagado', '1000007'),
(9, 3, 1, '160', '0', '2024-07-01', '2024-07-01', 'No pagado', '1000008'),
(10, 4, 2, '180', '0', '2024-07-05', '2024-07-05', 'No pagado', '1000009'),
(11, 3, 1, '160', '0', '2024-07-07', '2024-07-07', 'No pagado', '1000010'),
(12, 8, 1, '160', '0', '2024-07-07', '2024-07-07', 'No pagado', '1000011'),
(13, 5, 1, '160', '0', '2024-07-07', '2024-07-07', 'No pagado', '1000012'),
(14, 5, 1, '160', '0', '2024-07-07', '2024-07-07', 'No pagado', '1000013');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `cuenta_vista`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `cuenta_vista` (
`id_cuenta` int
,`codigo` varchar(50)
,`id_unir` int
,`concepto` varchar(50)
,`costo` varchar(50)
,`abono` varchar(50)
,`desde` date
,`hasta` date
,`pagado` varchar(50)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `donar_recibir_villa`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `donar_recibir_villa` (
`id_propietario` int
,`id_villa` int
,`villa` varchar(101)
,`cont_eeh` varchar(50)
,`habitaciones` varchar(50)
,`condicion` varchar(50)
,`modelo` varchar(50)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_concepto`
--

CREATE TABLE `estado_concepto` (
  `id_estado` int NOT NULL,
  `estado` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `estado_concepto`
--

INSERT INTO `estado_concepto` (`id_estado`, `estado`) VALUES
(1, 'Activo'),
(2, 'Desactivado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_grupo_villa`
--

CREATE TABLE `estado_grupo_villa` (
  `id_estado` int NOT NULL,
  `estado` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `estado_grupo_villa`
--

INSERT INTO `estado_grupo_villa` (`id_estado`, `estado`) VALUES
(1, 'Activo'),
(2, 'Desactivado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_modelos`
--

CREATE TABLE `estado_modelos` (
  `id_estado` int NOT NULL,
  `estado` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `estado_modelos`
--

INSERT INTO `estado_modelos` (`id_estado`, `estado`) VALUES
(1, 'Activo'),
(2, 'Desactivado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_moneda`
--

CREATE TABLE `estado_moneda` (
  `id_estado` int NOT NULL,
  `estado` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `estado_moneda`
--

INSERT INTO `estado_moneda` (`id_estado`, `estado`) VALUES
(1, 'Activo'),
(2, 'Desactivado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_propietario`
--

CREATE TABLE `estado_propietario` (
  `id_estado` int NOT NULL,
  `estado` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `estado_propietario`
--

INSERT INTO `estado_propietario` (`id_estado`, `estado`) VALUES
(1, 'Activo'),
(2, 'Desactivado'),
(3, 'Suspendido');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_usuario`
--

CREATE TABLE `estado_usuario` (
  `id_estado` int NOT NULL,
  `estado` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `estado_usuario`
--

INSERT INTO `estado_usuario` (`id_estado`, `estado`) VALUES
(1, 'Activo'),
(2, 'Suspendido');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_villa`
--

CREATE TABLE `estado_villa` (
  `id_estado` int NOT NULL,
  `estado` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `estado_villa`
--

INSERT INTO `estado_villa` (`id_estado`, `estado`) VALUES
(1, 'Disponible'),
(2, 'Habitado'),
(3, 'Suspendido');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo_villa`
--

CREATE TABLE `grupo_villa` (
  `id_grupo` int NOT NULL,
  `grupo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_estado` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `grupo_villa`
--

INSERT INTO `grupo_villa` (`id_grupo`, `grupo`, `id_estado`) VALUES
(1, 'A', 1),
(2, 'B', 1),
(3, 'C', 1),
(4, 'D', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modelo_villa`
--

CREATE TABLE `modelo_villa` (
  `id_modelo` int NOT NULL,
  `modelo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_estado` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `modelo_villa`
--

INSERT INTO `modelo_villa` (`id_modelo`, `modelo`, `id_estado`) VALUES
(1, 'VILLA CARACOL', 1),
(2, 'VILLA ARRECIFE', 1),
(3, 'CAREY', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `moneda`
--

CREATE TABLE `moneda` (
  `id_moneda` int NOT NULL,
  `nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `simbolo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `valor` double DEFAULT NULL,
  `id_estado` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `moneda`
--

INSERT INTO `moneda` (`id_moneda`, `nombre`, `simbolo`, `valor`, `id_estado`) VALUES
(1, 'LEMPIRA', 'L.', 1, 1),
(2, 'K', '5', 5, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `multipago`
--

CREATE TABLE `multipago` (
  `id_multi` int NOT NULL,
  `codigo_pago` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `propietario` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_unir` int DEFAULT NULL,
  `villa` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `concepto` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `fecha_concepto` date DEFAULT NULL,
  `fecha_pago` date DEFAULT NULL,
  `cantidad_pagado` double DEFAULT NULL,
  `tipo_concepto` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `observacion` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE `permisos` (
  `id_acceso` int NOT NULL,
  `acceso` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `pantalla_principal` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `impresion_reportes` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `edicion` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `eliminar` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `permisos`
--

INSERT INTO `permisos` (`id_acceso`, `acceso`, `pantalla_principal`, `impresion_reportes`, `edicion`, `eliminar`) VALUES
(1, 'Administrador', 'si', 'si', 'si', 'si'),
(2, 'Usuario', 'no', 'si', 'si', 'si');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `pripietario_cuenta_vista`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `pripietario_cuenta_vista` (
`id_unir` int
,`villa` varchar(101)
,`nombre` varchar(50)
,`dni` varchar(50)
,`telefono` varchar(50)
,`id_estado` int
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `propietarios`
--

CREATE TABLE `propietarios` (
  `id_propietario` int NOT NULL,
  `nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `dni` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `correo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `id_estado` int DEFAULT NULL,
  `observacion` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `telefono` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `propietarios`
--

INSERT INTO `propietarios` (`id_propietario`, `nombre`, `dni`, `correo`, `fecha`, `id_estado`, `observacion`, `telefono`) VALUES
(1, 'ANTHONY CLEMENTE OLIVA MURILLO', '0101199903209', 'anthony@unitec.edu', '2024-06-14', 1, 'Tiene 2 villa', '94856463'),
(2, 'KAREN SUAZO', '0101200607800', 'karen@gmail', '2024-06-14', 1, 'Registro por intercambio', '99856432'),
(3, 'L', '1', 'JJJJ', '2024-06-14', 1, '\r\n            ', '12'),
(4, 'NESTOR', '0101200603555', 'A@S', '2024-06-14', 1, '\r\n            ', '94856463'),
(5, 'VANDERZAR', '0101200603555', 'A@S', '2024-06-14', 1, '\r\n            ', '94856463');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `propietarios_villas`
--

CREATE TABLE `propietarios_villas` (
  `id_unir` int NOT NULL,
  `id_propietario` int DEFAULT NULL,
  `id_villa` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `propietarios_villas`
--

INSERT INTO `propietarios_villas` (`id_unir`, `id_propietario`, `id_villa`) VALUES
(1, 2, 5),
(2, 4, 2),
(3, 1, 1),
(4, 3, 4),
(5, 4, 6),
(6, 5, 7),
(7, 4, 10),
(8, 1, 9);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `propietario_principal`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `propietario_principal` (
`id_unir` int
,`id_propietario` int
,`id_villa` int
,`villa` varchar(101)
,`cont_eeh` varchar(50)
,`nombre` varchar(50)
,`dni` varchar(50)
,`telefono` varchar(50)
,`correo` varchar(50)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefono_propietario`
--

CREATE TABLE `telefono_propietario` (
  `id_numero` int NOT NULL,
  `id_propietaio` int DEFAULT NULL,
  `numero` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int NOT NULL,
  `nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `dni` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `telefono` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `correo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_acceso` int DEFAULT NULL,
  `clave` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_estado` int DEFAULT NULL,
  `usuario` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre`, `dni`, `telefono`, `correo`, `id_acceso`, `clave`, `id_estado`, `usuario`) VALUES
(1, 'ANTHONY CLEMENTE OLIVA MURILLO', '0101199903209', '94856463', 'anthonyoliva@gmail.com', 1, '123456789', 1, 'ANTHONY'),
(2, 'NESTOR OLIVA', '010120060360', '12345678', 'NESTOR@GMAIL.COM', 2, '123456789', 1, 'NESTOR');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `villas`
--

CREATE TABLE `villas` (
  `id_villa` int NOT NULL,
  `id_grupo` int DEFAULT NULL,
  `numero` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `cont_eeh` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `habitaciones` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `lote` double DEFAULT NULL,
  `id_modelo` int DEFAULT NULL,
  `id_condicion` int DEFAULT NULL,
  `id_estado` int DEFAULT NULL,
  `costo` double DEFAULT NULL,
  `direccion` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `observacion` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `villas`
--

INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_modelo`, `id_condicion`, `id_estado`, `costo`, `direccion`, `observacion`) VALUES
(1, 1, '1', '12345678', '2', 250, 2, 1, 2, 0, 'Residencial palma real, Roma, Juteapa', ''),
(2, 1, '2', '12345678', '2', 250, 2, 1, 2, 0, 'Residencial palma real, Roma, Juteapa', ''),
(4, 1, '3', '12345678', '2', 250, 2, 1, 2, 0, 'Residencial palma real, Roma, Juteapa', ''),
(5, 2, '3', '12345678', '5', 250, 3, 1, 2, 0, 'Residencial palma real, Roma, Juteapa', ''),
(6, 4, '12', '123456789', '5', 300, 3, 1, 2, 0, 'juteapa', 'primera villa'),
(7, 4, '11', '123456789', '5', 300, 3, 1, 2, 0, 'juteapa', 'primera villa'),
(8, 4, '4', '123456789', '5', 300, 3, 1, 1, 0, 'juteapa', 'primera villa'),
(9, 3, '4', '123456789', '5', 300, 3, 1, 2, 0, 'juteapa', 'primera villa'),
(10, 2, '4', '123456789', '5', 300, 3, 1, 2, 0, 'juteapa', 'primera villa');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `villa_completo`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `villa_completo` (
`id_villa` int
,`villas` varchar(101)
,`cont_eeh` varchar(50)
,`habitaciones` varchar(50)
,`lote` double
,`modelo` varchar(50)
,`condicion` varchar(50)
,`id_estado` int
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_usuario`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_usuario` (
`id_usuario` int
,`nombre` varchar(50)
,`dni` varchar(50)
,`telefono` varchar(50)
,`correo` varchar(50)
,`acceso` varchar(50)
,`clave` varchar(50)
,`estado` varchar(50)
,`usuario` varchar(50)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `cuenta_vista`
--
DROP TABLE IF EXISTS `cuenta_vista`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `cuenta_vista`  AS SELECT `cuentas`.`id_cuenta` AS `id_cuenta`, `cuentas`.`codigo` AS `codigo`, `propietarios_villas`.`id_unir` AS `id_unir`, `concepto`.`concepto` AS `concepto`, `cuentas`.`costo` AS `costo`, `cuentas`.`abono` AS `abono`, `cuentas`.`desde` AS `desde`, `cuentas`.`hasta` AS `hasta`, `cuentas`.`pagado` AS `pagado` FROM ((`cuentas` join `propietarios_villas` on((`cuentas`.`id_unir` = `propietarios_villas`.`id_unir`))) join `concepto` on((`cuentas`.`id_concepto` = `concepto`.`id_concepto`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `donar_recibir_villa`
--
DROP TABLE IF EXISTS `donar_recibir_villa`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `donar_recibir_villa`  AS SELECT `propietarios_villas`.`id_propietario` AS `id_propietario`, `villas`.`id_villa` AS `id_villa`, concat(`grupo_villa`.`grupo`,'-',`villas`.`numero`) AS `villa`, `villas`.`cont_eeh` AS `cont_eeh`, `villas`.`habitaciones` AS `habitaciones`, `condicion_villas`.`condicion` AS `condicion`, `modelo_villa`.`modelo` AS `modelo` FROM ((((`propietarios_villas` join `villas` on((`propietarios_villas`.`id_villa` = `villas`.`id_villa`))) join `grupo_villa` on((`villas`.`id_grupo` = `grupo_villa`.`id_grupo`))) join `condicion_villas` on((`villas`.`id_condicion` = `condicion_villas`.`id_condicion`))) join `modelo_villa` on((`villas`.`id_modelo` = `modelo_villa`.`id_modelo`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `pripietario_cuenta_vista`
--
DROP TABLE IF EXISTS `pripietario_cuenta_vista`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pripietario_cuenta_vista`  AS SELECT `propietarios_villas`.`id_unir` AS `id_unir`, concat(`grupo_villa`.`grupo`,'-',`villas`.`numero`) AS `villa`, `propietarios`.`nombre` AS `nombre`, `propietarios`.`dni` AS `dni`, `propietarios`.`telefono` AS `telefono`, `propietarios`.`id_estado` AS `id_estado` FROM (((`propietarios_villas` join `propietarios` on((`propietarios_villas`.`id_propietario` = `propietarios`.`id_propietario`))) join `villas` on((`propietarios_villas`.`id_villa` = `villas`.`id_villa`))) join `grupo_villa` on((`villas`.`id_grupo` = `grupo_villa`.`id_grupo`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `propietario_principal`
--
DROP TABLE IF EXISTS `propietario_principal`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `propietario_principal`  AS SELECT `propietarios_villas`.`id_unir` AS `id_unir`, `propietarios_villas`.`id_propietario` AS `id_propietario`, `propietarios_villas`.`id_villa` AS `id_villa`, concat(`grupo_villa`.`grupo`,'-',`villas`.`numero`) AS `villa`, `villas`.`cont_eeh` AS `cont_eeh`, `propietarios`.`nombre` AS `nombre`, `propietarios`.`dni` AS `dni`, `propietarios`.`telefono` AS `telefono`, `propietarios`.`correo` AS `correo` FROM (((`propietarios_villas` join `propietarios` on((`propietarios_villas`.`id_propietario` = `propietarios`.`id_propietario`))) join `villas` on((`propietarios_villas`.`id_villa` = `villas`.`id_villa`))) join `grupo_villa` on((`villas`.`id_grupo` = `grupo_villa`.`id_grupo`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `villa_completo`
--
DROP TABLE IF EXISTS `villa_completo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `villa_completo`  AS SELECT `villas`.`id_villa` AS `id_villa`, concat(`grupo_villa`.`grupo`,'-',`villas`.`numero`) AS `villas`, `villas`.`cont_eeh` AS `cont_eeh`, `villas`.`habitaciones` AS `habitaciones`, `villas`.`lote` AS `lote`, `modelo_villa`.`modelo` AS `modelo`, `condicion_villas`.`condicion` AS `condicion`, `villas`.`id_estado` AS `id_estado` FROM (((`villas` join `grupo_villa` on((`villas`.`id_grupo` = `grupo_villa`.`id_grupo`))) join `modelo_villa` on((`villas`.`id_modelo` = `modelo_villa`.`id_modelo`))) join `condicion_villas` on((`villas`.`id_condicion` = `condicion_villas`.`id_condicion`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_usuario`
--
DROP TABLE IF EXISTS `vista_usuario`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_usuario`  AS SELECT `usuarios`.`id_usuario` AS `id_usuario`, `usuarios`.`nombre` AS `nombre`, `usuarios`.`dni` AS `dni`, `usuarios`.`telefono` AS `telefono`, `usuarios`.`correo` AS `correo`, `permisos`.`acceso` AS `acceso`, `usuarios`.`clave` AS `clave`, `estado_usuario`.`estado` AS `estado`, `usuarios`.`usuario` AS `usuario` FROM ((`estado_usuario` join `usuarios` on((`estado_usuario`.`id_estado` = `usuarios`.`id_estado`))) join `permisos` on((`usuarios`.`id_acceso` = `permisos`.`id_acceso`))) ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `caracteristicas`
--
ALTER TABLE `caracteristicas`
  ADD PRIMARY KEY (`id_caracteristica`),
  ADD KEY `FK_caracteristicas_villas` (`id_villa`);

--
-- Indices de la tabla `concepto`
--
ALTER TABLE `concepto`
  ADD PRIMARY KEY (`id_concepto`),
  ADD KEY `FK_concepto_estado_concepto` (`id_estado`);

--
-- Indices de la tabla `condicion_villas`
--
ALTER TABLE `condicion_villas`
  ADD PRIMARY KEY (`id_condicion`);

--
-- Indices de la tabla `cuentas`
--
ALTER TABLE `cuentas`
  ADD PRIMARY KEY (`id_cuenta`),
  ADD KEY `FK_cuentas_propietarios_villas` (`id_unir`),
  ADD KEY `FK_cuenta_concepto` (`id_concepto`);

--
-- Indices de la tabla `estado_concepto`
--
ALTER TABLE `estado_concepto`
  ADD PRIMARY KEY (`id_estado`);

--
-- Indices de la tabla `estado_grupo_villa`
--
ALTER TABLE `estado_grupo_villa`
  ADD PRIMARY KEY (`id_estado`);

--
-- Indices de la tabla `estado_modelos`
--
ALTER TABLE `estado_modelos`
  ADD PRIMARY KEY (`id_estado`);

--
-- Indices de la tabla `estado_moneda`
--
ALTER TABLE `estado_moneda`
  ADD PRIMARY KEY (`id_estado`);

--
-- Indices de la tabla `estado_propietario`
--
ALTER TABLE `estado_propietario`
  ADD PRIMARY KEY (`id_estado`);

--
-- Indices de la tabla `estado_usuario`
--
ALTER TABLE `estado_usuario`
  ADD PRIMARY KEY (`id_estado`);

--
-- Indices de la tabla `estado_villa`
--
ALTER TABLE `estado_villa`
  ADD PRIMARY KEY (`id_estado`);

--
-- Indices de la tabla `grupo_villa`
--
ALTER TABLE `grupo_villa`
  ADD PRIMARY KEY (`id_grupo`),
  ADD KEY `FK_grupo_villa_estado_grupo_villa` (`id_estado`);

--
-- Indices de la tabla `modelo_villa`
--
ALTER TABLE `modelo_villa`
  ADD PRIMARY KEY (`id_modelo`),
  ADD KEY `FK_modelo_villa_estado_modelos` (`id_estado`);

--
-- Indices de la tabla `moneda`
--
ALTER TABLE `moneda`
  ADD PRIMARY KEY (`id_moneda`),
  ADD KEY `FK_Moneda_estado_moneda` (`id_estado`);

--
-- Indices de la tabla `multipago`
--
ALTER TABLE `multipago`
  ADD PRIMARY KEY (`id_multi`),
  ADD KEY `FK_multipago_propietarios_villas` (`id_unir`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`id_acceso`);

--
-- Indices de la tabla `propietarios`
--
ALTER TABLE `propietarios`
  ADD PRIMARY KEY (`id_propietario`),
  ADD KEY `FK_propietarios_estado_propietario` (`id_estado`);

--
-- Indices de la tabla `propietarios_villas`
--
ALTER TABLE `propietarios_villas`
  ADD PRIMARY KEY (`id_unir`),
  ADD KEY `FK_propietarios_villas_propietarios` (`id_propietario`),
  ADD KEY `FK_propietarios_villas_villas` (`id_villa`);

--
-- Indices de la tabla `telefono_propietario`
--
ALTER TABLE `telefono_propietario`
  ADD PRIMARY KEY (`id_numero`),
  ADD KEY `FK_telefono_propietario_propietarios` (`id_propietaio`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `FK_usuarios_estado_usuario` (`id_estado`),
  ADD KEY `FK_usuarios_permisos` (`id_acceso`);

--
-- Indices de la tabla `villas`
--
ALTER TABLE `villas`
  ADD PRIMARY KEY (`id_villa`),
  ADD KEY `FK_villas_estado_villa` (`id_estado`),
  ADD KEY `FK_villas_grupo_villa` (`id_grupo`),
  ADD KEY `FK_villas_condicion_villas` (`id_condicion`),
  ADD KEY `FK_villas_modelo_villa` (`id_modelo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `caracteristicas`
--
ALTER TABLE `caracteristicas`
  MODIFY `id_caracteristica` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `concepto`
--
ALTER TABLE `concepto`
  MODIFY `id_concepto` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `condicion_villas`
--
ALTER TABLE `condicion_villas`
  MODIFY `id_condicion` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `cuentas`
--
ALTER TABLE `cuentas`
  MODIFY `id_cuenta` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `estado_concepto`
--
ALTER TABLE `estado_concepto`
  MODIFY `id_estado` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `estado_grupo_villa`
--
ALTER TABLE `estado_grupo_villa`
  MODIFY `id_estado` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `estado_modelos`
--
ALTER TABLE `estado_modelos`
  MODIFY `id_estado` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `estado_moneda`
--
ALTER TABLE `estado_moneda`
  MODIFY `id_estado` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `estado_propietario`
--
ALTER TABLE `estado_propietario`
  MODIFY `id_estado` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `estado_usuario`
--
ALTER TABLE `estado_usuario`
  MODIFY `id_estado` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `estado_villa`
--
ALTER TABLE `estado_villa`
  MODIFY `id_estado` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `grupo_villa`
--
ALTER TABLE `grupo_villa`
  MODIFY `id_grupo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `modelo_villa`
--
ALTER TABLE `modelo_villa`
  MODIFY `id_modelo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `moneda`
--
ALTER TABLE `moneda`
  MODIFY `id_moneda` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `multipago`
--
ALTER TABLE `multipago`
  MODIFY `id_multi` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `id_acceso` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `propietarios`
--
ALTER TABLE `propietarios`
  MODIFY `id_propietario` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `propietarios_villas`
--
ALTER TABLE `propietarios_villas`
  MODIFY `id_unir` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `telefono_propietario`
--
ALTER TABLE `telefono_propietario`
  MODIFY `id_numero` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `villas`
--
ALTER TABLE `villas`
  MODIFY `id_villa` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `caracteristicas`
--
ALTER TABLE `caracteristicas`
  ADD CONSTRAINT `FK_caracteristicas_villas` FOREIGN KEY (`id_villa`) REFERENCES `villas` (`id_villa`);

--
-- Filtros para la tabla `concepto`
--
ALTER TABLE `concepto`
  ADD CONSTRAINT `FK_concepto_estado_concepto` FOREIGN KEY (`id_estado`) REFERENCES `estado_concepto` (`id_estado`);

--
-- Filtros para la tabla `cuentas`
--
ALTER TABLE `cuentas`
  ADD CONSTRAINT `FK_cuenta_concepto` FOREIGN KEY (`id_concepto`) REFERENCES `concepto` (`id_concepto`),
  ADD CONSTRAINT `FK_cuentas_propietarios_villas` FOREIGN KEY (`id_unir`) REFERENCES `propietarios_villas` (`id_unir`);

--
-- Filtros para la tabla `grupo_villa`
--
ALTER TABLE `grupo_villa`
  ADD CONSTRAINT `FK_grupo_villa_estado_grupo_villa` FOREIGN KEY (`id_estado`) REFERENCES `estado_grupo_villa` (`id_estado`);

--
-- Filtros para la tabla `modelo_villa`
--
ALTER TABLE `modelo_villa`
  ADD CONSTRAINT `FK_modelo_villa_estado_modelos` FOREIGN KEY (`id_estado`) REFERENCES `estado_modelos` (`id_estado`);

--
-- Filtros para la tabla `moneda`
--
ALTER TABLE `moneda`
  ADD CONSTRAINT `FK_Moneda_estado_moneda` FOREIGN KEY (`id_estado`) REFERENCES `estado_moneda` (`id_estado`);

--
-- Filtros para la tabla `multipago`
--
ALTER TABLE `multipago`
  ADD CONSTRAINT `FK_multipago_propietarios_villas` FOREIGN KEY (`id_unir`) REFERENCES `propietarios_villas` (`id_unir`);

--
-- Filtros para la tabla `propietarios`
--
ALTER TABLE `propietarios`
  ADD CONSTRAINT `FK_propietarios_estado_propietario` FOREIGN KEY (`id_estado`) REFERENCES `estado_propietario` (`id_estado`);

--
-- Filtros para la tabla `propietarios_villas`
--
ALTER TABLE `propietarios_villas`
  ADD CONSTRAINT `FK_propietarios_villas_propietarios` FOREIGN KEY (`id_propietario`) REFERENCES `propietarios` (`id_propietario`),
  ADD CONSTRAINT `FK_propietarios_villas_villas` FOREIGN KEY (`id_villa`) REFERENCES `villas` (`id_villa`);

--
-- Filtros para la tabla `telefono_propietario`
--
ALTER TABLE `telefono_propietario`
  ADD CONSTRAINT `FK_telefono_propietario_propietarios` FOREIGN KEY (`id_propietaio`) REFERENCES `propietarios` (`id_propietario`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `FK_usuarios_estado_usuario` FOREIGN KEY (`id_estado`) REFERENCES `estado_usuario` (`id_estado`),
  ADD CONSTRAINT `FK_usuarios_permisos` FOREIGN KEY (`id_acceso`) REFERENCES `permisos` (`id_acceso`);

--
-- Filtros para la tabla `villas`
--
ALTER TABLE `villas`
  ADD CONSTRAINT `FK_villas_condicion_villas` FOREIGN KEY (`id_condicion`) REFERENCES `condicion_villas` (`id_condicion`),
  ADD CONSTRAINT `FK_villas_estado_villa` FOREIGN KEY (`id_estado`) REFERENCES `estado_villa` (`id_estado`),
  ADD CONSTRAINT `FK_villas_grupo_villa` FOREIGN KEY (`id_grupo`) REFERENCES `grupo_villa` (`id_grupo`),
  ADD CONSTRAINT `FK_villas_modelo_villa` FOREIGN KEY (`id_modelo`) REFERENCES `modelo_villa` (`id_modelo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
