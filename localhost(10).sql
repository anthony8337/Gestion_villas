-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 23-09-2024 a las 15:22:11
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
CREATE DATABASE IF NOT EXISTS `gestion_de_propietario` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `gestion_de_propietario`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acceso_usuario`
--

CREATE TABLE `acceso_usuario` (
  `id_acceso_usuario` int NOT NULL,
  `id_usuario` int NOT NULL,
  `imprimir_reportes` varchar(2) NOT NULL,
  `modificar_reportes` varchar(2) NOT NULL,
  `eliminar_reportes` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `acceso_usuario`
--

INSERT INTO `acceso_usuario` (`id_acceso_usuario`, `id_usuario`, `imprimir_reportes`, `modificar_reportes`, `eliminar_reportes`) VALUES
(9, 2, 'si', 'si', 'si'),
(15, 18, 'si', 'si', 'si');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `adicion`
--

CREATE TABLE `adicion` (
  `id_adicion` int NOT NULL,
  `id_propi` int NOT NULL,
  `cuenta` int NOT NULL,
  `id_villa` int NOT NULL,
  `descripcion` varchar(1000) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `adicion`
--

INSERT INTO `adicion` (`id_adicion`, `id_propi`, `cuenta`, `id_villa`, `descripcion`, `fecha`) VALUES
(1, 2, 40000, 4, 'Adicion de villas', '2024-09-23');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `adicionar_descripcion`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `adicionar_descripcion` (
`id_adicion` int
,`cuenta` int
,`fecha` date
,`nombre` varchar(50)
,`dni` varchar(50)
,`villas` varchar(101)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cambio`
--

CREATE TABLE `cambio` (
  `id_cambio` int NOT NULL,
  `id_donante` int NOT NULL,
  `cuenta` int NOT NULL,
  `id_recibie` int NOT NULL,
  `id_villa` int NOT NULL,
  `descripcion` varchar(1000) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `cambio`
--

INSERT INTO `cambio` (`id_cambio`, `id_donante`, `cuenta`, `id_recibie`, `id_villa`, `descripcion`, `fecha`) VALUES
(1, 3, 30000, 1, 3, 'Realizo un traslado de la villa', '2024-09-23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caracteristicas`
--

CREATE TABLE `caracteristicas` (
  `id_caracteristica` int NOT NULL,
  `id_villa` int DEFAULT NULL,
  `caracteristica` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `cod_villa`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `cod_villa` (
`villa` varchar(101)
);

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
(50, 'AGUA', 'Abono', 250, 'No', 2),
(51, 'PAGO MENSUAL', 'Cargo', 0, 'Si', 1),
(52, 'AGUA', 'Abono', 250, 'No', 1),
(53, 'MANTENIMIENTO', 'Abono', 500, 'No', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `condicion_villas`
--

CREATE TABLE `condicion_villas` (
  `id_condicion` int NOT NULL,
  `condicion` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contactos_propietario`
--

CREATE TABLE `contactos_propietario` (
  `id_contacto` int NOT NULL,
  `id_propietario` int DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `numero` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
  `codigo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_concepto_2` int DEFAULT NULL,
  `con_pagado` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `cuentas`
--

INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`, `con_pagado`) VALUES
(1, 2, 52, '0', '500', '2024-09-23', '2024-11-23', 'Pagado', '1000000', 51, 'completo');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `cuenta_vista`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `cuenta_vista` (
`id_cuenta` int
,`codigo` varchar(50)
,`id_unir` int
,`costo` varchar(50)
,`abono` varchar(50)
,`desde` date
,`hasta` date
,`pagado` varchar(50)
,`concepto_2` varchar(50)
,`nombre` varchar(50)
,`villa` varchar(101)
,`concepto` varchar(50)
,`id_concepto` int
,`con_descrip` int
,`con_pagado` varchar(50)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `descripcion_donador`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `descripcion_donador` (
`id_cambio` int
,`id_propietario` int
,`cuentas` int
,`nombre` varchar(50)
,`dni` varchar(50)
,`id_pro_2` int
,`nombre_2` varchar(50)
,`dni_2` varchar(50)
,`villas` varchar(101)
,`fecha` date
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `donar_recibir_villa`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `donar_recibir_villa` (
`id_propietario` int
,`id_villa` int
,`villas` varchar(101)
,`cont_eeh` varchar(50)
,`habitaciones` varchar(50)
,`condicion` int
,`modelo` varchar(500)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_concepto`
--

CREATE TABLE `estado_concepto` (
  `id_estado` int NOT NULL,
  `estado` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_grupo_villa`
--

CREATE TABLE `estado_grupo_villa` (
  `id_estado` int NOT NULL,
  `estado` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_modelos`
--

CREATE TABLE `estado_modelos` (
  `id_estado` int NOT NULL,
  `estado` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_moneda`
--

CREATE TABLE `estado_moneda` (
  `id_estado` int NOT NULL,
  `estado` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_multipago`
--

CREATE TABLE `estado_multipago` (
  `id_estado` int NOT NULL,
  `estado` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_pago`
--

CREATE TABLE `estado_pago` (
  `id_estado` int NOT NULL,
  `estado` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_propietario`
--

CREATE TABLE `estado_propietario` (
  `id_estado` int NOT NULL,
  `estado` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_usuario`
--

CREATE TABLE `estado_usuario` (
  `id_estado` int NOT NULL,
  `estado` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_villa`
--

CREATE TABLE `estado_villa` (
  `id_estado` int NOT NULL,
  `estado` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `factura_completa_reimprimir`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `factura_completa_reimprimir` (
`codigo_pago` varchar(50)
,`concepto` varchar(50)
,`fecha_pago` date
,`id_unir` int
,`desde` date
,`hasta` date
,`codigo` varchar(50)
,`costo` varchar(50)
,`abono` varchar(50)
,`tipo_pago` varchar(50)
,`forma_pago` varchar(50)
,`n_referencia` varchar(50)
,`cantidad_recibida` float
,`abono_con` varchar(50)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `forma_de_pago`
--

CREATE TABLE `forma_de_pago` (
  `id_pago` int NOT NULL,
  `pago` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_estado` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `forma_pago`
--

CREATE TABLE `forma_pago` (
  `id_forma` int NOT NULL,
  `id_multi` int NOT NULL,
  `tipo_pago` varchar(50) NOT NULL,
  `forma_pago` varchar(50) NOT NULL,
  `n_referencia` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
(3, 'C', 1);

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
(1, 'CORAZON', 1),
(2, 'BALLENA', 1),
(3, 'HALCON', 1);

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `multi_pago`
--

CREATE TABLE `multi_pago` (
  `id_multi` int NOT NULL,
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
  `n_referencia` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `multi_pago`
--

INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `costo`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`, `tipo_pago`, `forma_pago`, `n_referencia`) VALUES
(1, '2000000', 2, 1, '2024-09-23', NULL, 500, 500, 0, 1, 1, 52, 'Efectivo', 'Físico', 'Ninguna');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE `permisos` (
  `id_acceso` int NOT NULL,
  `acceso` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
(1, 'ANTHONY', '1515151', 'kmfvkf@gmail.com', '2024-09-22', 1, '', '741'),
(2, 'KVMKFVKFMKVKF', '15151515161561561', 'mckdmkc@gmail.com', '2024-09-22', 1, '\n            ', '7411'),
(3, 'MM', '14', 'cdnjcd@gmail.com', '2024-09-22', 1, '', '741852');

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
(1, 1, 2),
(2, 2, 1),
(3, 1, 3),
(4, 2, 4);

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
,`observacion` varchar(500)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `tomar_desde_hasta`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `tomar_desde_hasta` (
`id_unir` int
,`villa` varchar(101)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `ultimas_villas`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `ultimas_villas` (
`id_villa` int
,`codigo` varchar(101)
,`condicion` int
,`estado` int
,`modelo` varchar(500)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int NOT NULL,
  `nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `apellido` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `dni` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `telefono` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `correo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_acceso` int DEFAULT NULL,
  `clave` varbinary(255) DEFAULT NULL,
  `id_estado` int DEFAULT NULL,
  `usuario` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre`, `apellido`, `dni`, `telefono`, `correo`, `id_acceso`, `clave`, `id_estado`, `usuario`) VALUES
(2, 'ANTHONY', 'OLIVA', '010119993209', '94856466', 'anthonyoliva70@gmail.com', 1, 0x4f235daa7f70ce99074ef77f06641772, 1, 'ANTHONY'),
(18, 'NESTOR', 'OLIVA', '741852', '74', 'anthony.oliva80@unitec.edu', 2, 0xd4d9d60dd45a4689d6deab5f700be276, 1, 'NESTOR');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `ver_cuentas_pagadas`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `ver_cuentas_pagadas` (
`codigo_pago` varchar(50)
,`concepto` varchar(50)
,`fecha_pago` date
,`id_unir` int
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `ver_saldos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `ver_saldos` (
`concepto` varchar(50)
,`villa` varchar(101)
,`nombre` varchar(50)
,`costo_total` double
,`abono_total` double
,`saldo_total` double
);

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
  `lote` varchar(50) DEFAULT NULL,
  `id_condicion` int DEFAULT NULL,
  `id_estado` int DEFAULT NULL,
  `direccion` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `observacion` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `modelo` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `villas`
--

INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_condicion`, `id_estado`, `direccion`, `observacion`, `modelo`) VALUES
(1, 1, '1', '741852963', '2', '250', 1, 2, '', '', 'BALLENA'),
(2, 1, '2', '741', '2', '250', 1, 2, '', '', 'BALLENA'),
(3, 1, '3', '000000005', '2', '250', 1, 2, '', '', 'CORAZON'),
(4, 1, '4', '000002', '2', '250', 1, 2, '', '', 'BALLENA');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `villas_con_propietario`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `villas_con_propietario` (
`id_villa` int
,`villas` varchar(101)
,`cont_eeh` varchar(50)
,`habitaciones` varchar(50)
,`lote` varchar(50)
,`condicion` varchar(50)
,`id_estado` int
,`estado` varchar(50)
,`id_propietario` int
,`id_unir` int
,`modelo` varchar(500)
);

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
,`lote` varchar(50)
,`condicion` int
,`estado` int
,`modelo` varchar(500)
,`direccion` varchar(500)
,`observacion` varchar(500)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_usuario`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_usuario` (
`id_usuario` int
,`usuario` varchar(50)
,`nombre` varchar(101)
,`dni` varchar(50)
,`telefono` varchar(50)
,`correo` varchar(50)
,`acceso` varchar(13)
,`clave` varbinary(255)
,`estado` int
,`nom` varchar(50)
,`ape` varchar(50)
,`imprimir_reportes` varchar(2)
,`modificar_reportes` varchar(2)
,`eliminar_reportes` varchar(2)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `adicionar_descripcion`
--
DROP TABLE IF EXISTS `adicionar_descripcion`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `adicionar_descripcion`  AS SELECT `adicion`.`id_adicion` AS `id_adicion`, `adicion`.`cuenta` AS `cuenta`, `adicion`.`fecha` AS `fecha`, `propietarios`.`nombre` AS `nombre`, `propietarios`.`dni` AS `dni`, `villa_completo`.`villas` AS `villas` FROM ((`adicion` join `propietarios` on((`adicion`.`id_propi` = `propietarios`.`id_propietario`))) join `villa_completo` on((`adicion`.`id_villa` = `villa_completo`.`id_villa`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `cod_villa`
--
DROP TABLE IF EXISTS `cod_villa`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `cod_villa`  AS SELECT concat(`grupo_villa`.`grupo`,'-',`villas`.`numero`) AS `villa` FROM (`villas` join `grupo_villa` on((`villas`.`id_grupo` = `grupo_villa`.`id_grupo`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `cuenta_vista`
--
DROP TABLE IF EXISTS `cuenta_vista`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `cuenta_vista`  AS SELECT `cuentas`.`id_cuenta` AS `id_cuenta`, `cuentas`.`codigo` AS `codigo`, `propietarios_villas`.`id_unir` AS `id_unir`, `cuentas`.`costo` AS `costo`, `cuentas`.`abono` AS `abono`, `cuentas`.`desde` AS `desde`, `cuentas`.`hasta` AS `hasta`, `cuentas`.`pagado` AS `pagado`, `concepto_1`.`concepto` AS `concepto_2`, `propietarios`.`nombre` AS `nombre`, concat(`grupo_villa`.`grupo`,'-',`villas`.`numero`) AS `villa`, `concepto`.`concepto` AS `concepto`, `concepto`.`id_concepto` AS `id_concepto`, `concepto_1`.`id_concepto` AS `con_descrip`, `cuentas`.`con_pagado` AS `con_pagado` FROM ((((((`cuentas` join `propietarios_villas` on((`cuentas`.`id_unir` = `propietarios_villas`.`id_unir`))) join `concepto` on((`cuentas`.`id_concepto` = `concepto`.`id_concepto`))) join `concepto` `concepto_1` on((`cuentas`.`id_concepto_2` = `concepto_1`.`id_concepto`))) join `villas` on((`propietarios_villas`.`id_villa` = `villas`.`id_villa`))) join `propietarios` on((`propietarios_villas`.`id_propietario` = `propietarios`.`id_propietario`))) join `grupo_villa` on((`villas`.`id_grupo` = `grupo_villa`.`id_grupo`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `descripcion_donador`
--
DROP TABLE IF EXISTS `descripcion_donador`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `descripcion_donador`  AS SELECT `cambio`.`id_cambio` AS `id_cambio`, `propietarios`.`id_propietario` AS `id_propietario`, `cambio`.`cuenta` AS `cuentas`, `propietarios`.`nombre` AS `nombre`, `propietarios`.`dni` AS `dni`, `propietarios_1`.`id_propietario` AS `id_pro_2`, `propietarios_1`.`nombre` AS `nombre_2`, `propietarios_1`.`dni` AS `dni_2`, `villa_completo`.`villas` AS `villas`, `cambio`.`fecha` AS `fecha` FROM (((`cambio` join `villa_completo` on((`cambio`.`id_villa` = `villa_completo`.`id_villa`))) join `propietarios` on((`cambio`.`id_donante` = `propietarios`.`id_propietario`))) join `propietarios` `propietarios_1` on((`cambio`.`id_recibie` = `propietarios_1`.`id_propietario`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `donar_recibir_villa`
--
DROP TABLE IF EXISTS `donar_recibir_villa`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `donar_recibir_villa`  AS SELECT `propietarios_villas`.`id_propietario` AS `id_propietario`, `villas`.`id_villa` AS `id_villa`, concat(`grupo_villa`.`grupo`,'-',`villas`.`numero`) AS `villas`, `villas`.`cont_eeh` AS `cont_eeh`, `villas`.`habitaciones` AS `habitaciones`, `villas`.`id_condicion` AS `condicion`, `villas`.`modelo` AS `modelo` FROM ((`propietarios_villas` join `villas` on((`propietarios_villas`.`id_villa` = `villas`.`id_villa`))) join `grupo_villa` on((`villas`.`id_grupo` = `grupo_villa`.`id_grupo`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `factura_completa_reimprimir`
--
DROP TABLE IF EXISTS `factura_completa_reimprimir`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `factura_completa_reimprimir`  AS SELECT `multi_pago`.`codigo_pago` AS `codigo_pago`, `concepto`.`concepto` AS `concepto`, `multi_pago`.`fecha_pago` AS `fecha_pago`, `multi_pago`.`id_unir` AS `id_unir`, `cuentas`.`desde` AS `desde`, `cuentas`.`hasta` AS `hasta`, `cuentas`.`codigo` AS `codigo`, `cuentas`.`costo` AS `costo`, `cuentas`.`abono` AS `abono`, `multi_pago`.`tipo_pago` AS `tipo_pago`, `multi_pago`.`forma_pago` AS `forma_pago`, `multi_pago`.`n_referencia` AS `n_referencia`, `multi_pago`.`cantidad_recibida` AS `cantidad_recibida`, `concepto_1`.`concepto` AS `abono_con` FROM (((`concepto` join `cuentas` on((`concepto`.`id_concepto` = `cuentas`.`id_concepto`))) join `multi_pago` on((`cuentas`.`id_cuenta` = `multi_pago`.`id_cuenta`))) join `concepto` `concepto_1` on((`cuentas`.`id_concepto_2` = `concepto_1`.`id_concepto`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `pripietario_cuenta_vista`
--
DROP TABLE IF EXISTS `pripietario_cuenta_vista`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pripietario_cuenta_vista` (`id_unir`, `villa`, `nombre`, `dni`, `telefono`, `id_estado`) AS   select `propietarios_villas`.`id_unir` AS `id_unir`,concat(`grupo_villa`.`grupo`,'-',`villas`.`numero`) AS `villa`,`propietarios`.`nombre` AS `nombre`,`propietarios`.`dni` AS `dni`,`propietarios`.`telefono` AS `telefono`,`propietarios`.`id_estado` AS `id_estado` from (((`propietarios_villas` join `propietarios` on((`propietarios_villas`.`id_propietario` = `propietarios`.`id_propietario`))) join `villas` on((`propietarios_villas`.`id_villa` = `villas`.`id_villa`))) join `grupo_villa` on((`villas`.`id_grupo` = `grupo_villa`.`id_grupo`)))  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `propietario_principal`
--
DROP TABLE IF EXISTS `propietario_principal`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `propietario_principal`  AS SELECT `propietarios_villas`.`id_unir` AS `id_unir`, `propietarios_villas`.`id_propietario` AS `id_propietario`, `propietarios_villas`.`id_villa` AS `id_villa`, concat(`grupo_villa`.`grupo`,'-',`villas`.`numero`) AS `villa`, `villas`.`cont_eeh` AS `cont_eeh`, `propietarios`.`nombre` AS `nombre`, `propietarios`.`dni` AS `dni`, `propietarios`.`telefono` AS `telefono`, `propietarios`.`correo` AS `correo`, `propietarios`.`observacion` AS `observacion` FROM (((`propietarios_villas` join `propietarios` on((`propietarios_villas`.`id_propietario` = `propietarios`.`id_propietario`))) join `villas` on((`propietarios_villas`.`id_villa` = `villas`.`id_villa`))) join `grupo_villa` on((`villas`.`id_grupo` = `grupo_villa`.`id_grupo`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `tomar_desde_hasta`
--
DROP TABLE IF EXISTS `tomar_desde_hasta`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tomar_desde_hasta`  AS SELECT `pripietario_cuenta_vista`.`id_unir` AS `id_unir`, `pripietario_cuenta_vista`.`villa` AS `villa` FROM `pripietario_cuenta_vista` ORDER BY substring_index(`pripietario_cuenta_vista`.`villa`,'-',1) ASC, cast(substring_index(`pripietario_cuenta_vista`.`villa`,'-',-(1)) as unsigned) ASC ;

-- --------------------------------------------------------

--
-- Estructura para la vista `ultimas_villas`
--
DROP TABLE IF EXISTS `ultimas_villas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ultimas_villas`  AS SELECT `villas`.`id_villa` AS `id_villa`, concat(`grupo_villa`.`grupo`,'-',`villas`.`numero`) AS `codigo`, `villas`.`id_condicion` AS `condicion`, `villas`.`id_estado` AS `estado`, `villas`.`modelo` AS `modelo` FROM (`villas` join `grupo_villa` on((`villas`.`id_grupo` = `grupo_villa`.`id_grupo`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `ver_cuentas_pagadas`
--
DROP TABLE IF EXISTS `ver_cuentas_pagadas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ver_cuentas_pagadas`  AS SELECT `multi_pago`.`codigo_pago` AS `codigo_pago`, `concepto`.`concepto` AS `concepto`, `multi_pago`.`fecha_pago` AS `fecha_pago`, `multi_pago`.`id_unir` AS `id_unir` FROM ((`concepto` join `cuentas` on((`concepto`.`id_concepto` = `cuentas`.`id_concepto`))) join `multi_pago` on((`cuentas`.`id_cuenta` = `multi_pago`.`id_cuenta`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `ver_saldos`
--
DROP TABLE IF EXISTS `ver_saldos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ver_saldos`  AS SELECT `cuenta_vista`.`concepto` AS `concepto`, `cuenta_vista`.`villa` AS `villa`, `cuenta_vista`.`nombre` AS `nombre`, sum(`cuenta_vista`.`costo`) AS `costo_total`, sum(`cuenta_vista`.`abono`) AS `abono_total`, sum((`cuenta_vista`.`costo` - `cuenta_vista`.`abono`)) AS `saldo_total` FROM `cuenta_vista` GROUP BY `cuenta_vista`.`concepto`, `cuenta_vista`.`villa`, `cuenta_vista`.`nombre` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `villas_con_propietario`
--
DROP TABLE IF EXISTS `villas_con_propietario`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `villas_con_propietario`  AS SELECT `villas`.`id_villa` AS `id_villa`, concat(`grupo_villa`.`grupo`,'-',`villas`.`numero`) AS `villas`, `villas`.`cont_eeh` AS `cont_eeh`, `villas`.`habitaciones` AS `habitaciones`, `villas`.`lote` AS `lote`, `condicion_villas`.`condicion` AS `condicion`, `villas`.`id_estado` AS `id_estado`, `estado_villa`.`estado` AS `estado`, `propietarios_villas`.`id_propietario` AS `id_propietario`, `propietarios_villas`.`id_unir` AS `id_unir`, `villas`.`modelo` AS `modelo` FROM ((((`villas` join `grupo_villa` on((`villas`.`id_grupo` = `grupo_villa`.`id_grupo`))) join `condicion_villas` on((`villas`.`id_condicion` = `condicion_villas`.`id_condicion`))) join `estado_villa` on((`villas`.`id_estado` = `estado_villa`.`id_estado`))) join `propietarios_villas` on((`villas`.`id_villa` = `propietarios_villas`.`id_villa`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `villa_completo`
--
DROP TABLE IF EXISTS `villa_completo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `villa_completo`  AS SELECT `villas`.`id_villa` AS `id_villa`, concat(`grupo_villa`.`grupo`,'-',`villas`.`numero`) AS `villas`, `villas`.`cont_eeh` AS `cont_eeh`, `villas`.`habitaciones` AS `habitaciones`, `villas`.`lote` AS `lote`, `villas`.`id_condicion` AS `condicion`, `villas`.`id_estado` AS `estado`, `villas`.`modelo` AS `modelo`, `villas`.`direccion` AS `direccion`, `villas`.`observacion` AS `observacion` FROM (`villas` join `grupo_villa` on((`villas`.`id_grupo` = `grupo_villa`.`id_grupo`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_usuario`
--
DROP TABLE IF EXISTS `vista_usuario`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_usuario`  AS SELECT `usuarios`.`id_usuario` AS `id_usuario`, `usuarios`.`usuario` AS `usuario`, concat(`usuarios`.`nombre`,' ',`usuarios`.`apellido`) AS `nombre`, `usuarios`.`dni` AS `dni`, `usuarios`.`telefono` AS `telefono`, `usuarios`.`correo` AS `correo`, if((`usuarios`.`id_acceso` = 1),'Administrador','Usuario') AS `acceso`, `usuarios`.`clave` AS `clave`, `usuarios`.`id_estado` AS `estado`, `usuarios`.`nombre` AS `nom`, `usuarios`.`apellido` AS `ape`, `acceso_usuario`.`imprimir_reportes` AS `imprimir_reportes`, `acceso_usuario`.`modificar_reportes` AS `modificar_reportes`, `acceso_usuario`.`eliminar_reportes` AS `eliminar_reportes` FROM (`acceso_usuario` join `usuarios` on((`acceso_usuario`.`id_usuario` = `usuarios`.`id_usuario`))) ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `acceso_usuario`
--
ALTER TABLE `acceso_usuario`
  ADD PRIMARY KEY (`id_acceso_usuario`),
  ADD KEY `FK_usuario_acceso` (`id_usuario`);

--
-- Indices de la tabla `adicion`
--
ALTER TABLE `adicion`
  ADD PRIMARY KEY (`id_adicion`),
  ADD KEY `FK_propietario_adicion` (`id_propi`),
  ADD KEY `FK_villa_adicion` (`id_villa`);

--
-- Indices de la tabla `cambio`
--
ALTER TABLE `cambio`
  ADD PRIMARY KEY (`id_cambio`),
  ADD KEY `FK_donador` (`id_donante`),
  ADD KEY `FK_receptor` (`id_recibie`),
  ADD KEY `FK_villa` (`id_villa`);

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
-- Indices de la tabla `contactos_propietario`
--
ALTER TABLE `contactos_propietario`
  ADD PRIMARY KEY (`id_contacto`),
  ADD KEY `FK_id_propietario` (`id_propietario`);

--
-- Indices de la tabla `cuentas`
--
ALTER TABLE `cuentas`
  ADD PRIMARY KEY (`id_cuenta`),
  ADD KEY `FK_cuenta_concepto` (`id_concepto`),
  ADD KEY `FK_cuentas_propietarios_villas` (`id_unir`),
  ADD KEY `FK_concepto_2` (`id_concepto_2`);

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
-- Indices de la tabla `estado_multipago`
--
ALTER TABLE `estado_multipago`
  ADD PRIMARY KEY (`id_estado`);

--
-- Indices de la tabla `estado_pago`
--
ALTER TABLE `estado_pago`
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
-- Indices de la tabla `forma_de_pago`
--
ALTER TABLE `forma_de_pago`
  ADD PRIMARY KEY (`id_pago`),
  ADD KEY `FK_forma_de_pago_estado_pago` (`id_estado`);

--
-- Indices de la tabla `forma_pago`
--
ALTER TABLE `forma_pago`
  ADD PRIMARY KEY (`id_forma`),
  ADD KEY `FK_id_cuenta` (`id_multi`);

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
-- Indices de la tabla `multi_pago`
--
ALTER TABLE `multi_pago`
  ADD PRIMARY KEY (`id_multi`),
  ADD KEY `FK_multi_pago_cuentas` (`id_cuenta`),
  ADD KEY `FK_multi_pago_propietarios_villas` (`id_unir`),
  ADD KEY `FK_multi_pago_estado_multipago` (`id_estado`),
  ADD KEY `FK_multi_pago_forma_de_pago` (`id_pago`),
  ADD KEY `FK_multi_pago_id_concepto` (`id_concepto`);

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
  ADD KEY `FK_villas_condicion_villas` (`id_condicion`),
  ADD KEY `FK_villas_estado_villa` (`id_estado`),
  ADD KEY `FK_villas_grupo_villa` (`id_grupo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `acceso_usuario`
--
ALTER TABLE `acceso_usuario`
  MODIFY `id_acceso_usuario` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `adicion`
--
ALTER TABLE `adicion`
  MODIFY `id_adicion` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `cambio`
--
ALTER TABLE `cambio`
  MODIFY `id_cambio` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `caracteristicas`
--
ALTER TABLE `caracteristicas`
  MODIFY `id_caracteristica` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `concepto`
--
ALTER TABLE `concepto`
  MODIFY `id_concepto` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT de la tabla `condicion_villas`
--
ALTER TABLE `condicion_villas`
  MODIFY `id_condicion` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `contactos_propietario`
--
ALTER TABLE `contactos_propietario`
  MODIFY `id_contacto` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cuentas`
--
ALTER TABLE `cuentas`
  MODIFY `id_cuenta` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `estado_concepto`
--
ALTER TABLE `estado_concepto`
  MODIFY `id_estado` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estado_grupo_villa`
--
ALTER TABLE `estado_grupo_villa`
  MODIFY `id_estado` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estado_modelos`
--
ALTER TABLE `estado_modelos`
  MODIFY `id_estado` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estado_moneda`
--
ALTER TABLE `estado_moneda`
  MODIFY `id_estado` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estado_multipago`
--
ALTER TABLE `estado_multipago`
  MODIFY `id_estado` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estado_pago`
--
ALTER TABLE `estado_pago`
  MODIFY `id_estado` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estado_propietario`
--
ALTER TABLE `estado_propietario`
  MODIFY `id_estado` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estado_usuario`
--
ALTER TABLE `estado_usuario`
  MODIFY `id_estado` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estado_villa`
--
ALTER TABLE `estado_villa`
  MODIFY `id_estado` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `forma_de_pago`
--
ALTER TABLE `forma_de_pago`
  MODIFY `id_pago` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `forma_pago`
--
ALTER TABLE `forma_pago`
  MODIFY `id_forma` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `grupo_villa`
--
ALTER TABLE `grupo_villa`
  MODIFY `id_grupo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `modelo_villa`
--
ALTER TABLE `modelo_villa`
  MODIFY `id_modelo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `moneda`
--
ALTER TABLE `moneda`
  MODIFY `id_moneda` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `multi_pago`
--
ALTER TABLE `multi_pago`
  MODIFY `id_multi` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `id_acceso` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `propietarios`
--
ALTER TABLE `propietarios`
  MODIFY `id_propietario` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `propietarios_villas`
--
ALTER TABLE `propietarios_villas`
  MODIFY `id_unir` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `villas`
--
ALTER TABLE `villas`
  MODIFY `id_villa` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `acceso_usuario`
--
ALTER TABLE `acceso_usuario`
  ADD CONSTRAINT `FK_usuario_acceso` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `adicion`
--
ALTER TABLE `adicion`
  ADD CONSTRAINT `FK_propietario_adicion` FOREIGN KEY (`id_propi`) REFERENCES `propietarios` (`id_propietario`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `FK_villa_adicion` FOREIGN KEY (`id_villa`) REFERENCES `villas` (`id_villa`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `cambio`
--
ALTER TABLE `cambio`
  ADD CONSTRAINT `FK_donador` FOREIGN KEY (`id_donante`) REFERENCES `propietarios` (`id_propietario`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `FK_receptor` FOREIGN KEY (`id_recibie`) REFERENCES `propietarios` (`id_propietario`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `FK_villa` FOREIGN KEY (`id_villa`) REFERENCES `villas` (`id_villa`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
