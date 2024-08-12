-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 12-08-2024 a las 06:09:48
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
(1, 6, 'no', 'si', 'no'),
(2, 7, 'no', 'no', 'no'),
(3, 2, 'si', 'si', 'si'),
(4, 8, 'si', 'si', 'si'),
(5, 9, 'no', 'si', 'no'),
(6, 10, 'si', 'si', 'si'),
(7, 11, 'si', 'si', 'si'),
(8, 12, 'si', 'si', 'si');

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
(1, 'MANTENIMIENTO', 'Abono', 250, 'No', 1),
(2, 'PAGO MENSUAL', 'Cargo', 0, 'Si', 1),
(3, 'AGUA', 'Abono', 160, 'No', 1),
(4, 'LUZ', 'Abono', 160, 'No', 1),
(5, 'FACTURA', 'Cargo', 0, 'Si', 1),
(6, 'GAS', 'Abono', 200, 'No', 1),
(7, 'INTERNET', 'Abono', 70, 'No', 1);

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
(2, 'Mantenimiento'),
(3, 'Deshabilitado');

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
  `codigo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `cuentas`
--

INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`) VALUES
(1, 19, 1, '160', '0', '2024-07-22', '2024-09-22', 'No pagado', '1000000'),
(2, 19, 1, '160', '0', '2024-07-24', '2024-07-24', 'No pagado', '1000001'),
(3, 15, 1, '0', '160', '2024-07-27', '2024-10-27', 'No pagado', '1000002'),
(4, 15, 1, '0', '160', '2024-07-28', '2024-08-28', 'No pagado', '1000003'),
(5, 15, 1, '0', '160', '2024-07-29', '2024-08-29', 'No pagado', '1000004'),
(6, 14, 1, '0', '160', '2024-07-29', '2024-08-29', 'No pagado', '1000004'),
(7, 19, 1, '0', '160', '2024-07-29', '2024-08-29', 'No pagado', '1000004'),
(8, 15, 1, '0', '160', '2024-07-29', '2024-07-29', 'No pagado', '1000005'),
(9, 14, 1, '0', '160', '2024-07-29', '2024-07-29', 'No pagado', '1000005'),
(10, 19, 1, '0', '160', '2024-07-29', '2024-07-29', 'No pagado', '1000005'),
(11, 15, 1, '0', '160', '2024-07-29', '2024-07-29', 'No pagado', '1000006'),
(12, 15, 1, '160', '0', '2024-07-29', '2024-09-29', 'No pagado', '1000007'),
(13, 14, 1, '160', '0', '2024-07-29', '2024-09-29', 'No pagado', '1000008'),
(14, 19, 1, '160', '0', '2024-07-29', '2024-09-29', 'No pagado', '1000009'),
(15, 15, 1, '160', '0', '2024-07-30', '2024-07-30', 'No pagado', '1000010'),
(16, 14, 1, '160', '0', '2024-07-30', '2024-07-30', 'No pagado', '1000011'),
(17, 19, 1, '160', '0', '2024-07-30', '2024-07-30', 'No pagado', '1000012'),
(18, 15, 1, '160', '0', '2024-07-30', '2024-07-30', 'No pagado', '1000013'),
(19, 14, 1, '160', '0', '2024-07-30', '2024-07-30', 'No pagado', '1000014'),
(20, 19, 1, '160', '0', '2024-07-30', '2024-07-30', 'No pagado', '1000015'),
(21, 15, 1, '160', '0', '2024-07-30', '2024-07-30', 'No pagado', '1000016'),
(22, 14, 1, '160', '0', '2024-07-30', '2024-07-30', 'No pagado', '1000017'),
(23, 19, 1, '160', '0', '2024-07-30', '2024-07-30', 'No pagado', '1000018'),
(24, 10, 1, '160', '0', '2024-07-30', '2024-07-30', 'No pagado', '1000019'),
(25, 10, 1, '160', '0', '2024-07-30', '2024-07-30', 'No pagado', '1000020'),
(26, 16, 1, '0', '0', '2024-07-30', '2024-07-30', 'Pagado', '1000021'),
(27, 16, 1, '0', '0', '2024-07-30', '2024-07-30', 'Pagado', '1000022'),
(28, 16, 1, '160', '0', '2024-07-30', '2024-07-30', 'No pagado', '1000023'),
(29, 15, 1, '480', '0', '2024-07-30', '2024-07-30', 'No pagado', '1000024'),
(30, 15, 1, '480', '0', '2024-07-30', '2031-09-30', 'No pagado', '1000025'),
(31, 27, 3, '320', '0', '2024-08-02', '2024-10-02', 'Pagado', '1000026'),
(32, 30, 3, '0', '0', '2024-08-02', '2024-09-02', 'Pagado', '1000027'),
(33, 27, 1, '160', '0', '2024-08-03', '2024-08-03', 'Pagado', '1000028'),
(34, 27, 1, '-40', '0', '2024-08-03', '2024-08-03', 'Pagado', '1000029'),
(35, 27, 1, '0', '0', '2024-08-02', '2024-10-02', 'Pagado', '1000030'),
(36, 27, 1, '100', '0', '2024-08-02', '2024-08-02', 'Pagado', '1000031'),
(37, 27, 3, '0', '0', '2024-08-02', '2024-10-02', 'Pagado', '1000032'),
(38, 27, 1, '100', '0', '2024-08-02', '2024-10-02', 'Pagado', '1000033'),
(39, 19, 3, '320', '0', '2024-08-03', '2024-10-03', 'No pagado', '1000034'),
(40, 25, 3, '320', '0', '2024-08-03', '2024-10-03', 'No pagado', '1000035'),
(41, 26, 3, '320', '0', '2024-08-03', '2024-10-03', 'No pagado', '1000036'),
(42, 28, 3, '320', '0', '2024-08-03', '2024-10-03', 'No pagado', '1000037'),
(43, 19, 4, '480', '0', '2024-08-03', '2024-11-03', 'No pagado', '1000038'),
(44, 25, 4, '480', '0', '2024-08-03', '2024-11-03', 'No pagado', '1000039'),
(45, 26, 4, '480', '0', '2024-08-03', '2024-11-03', 'No pagado', '1000040'),
(46, 28, 4, '480', '0', '2024-08-03', '2024-11-03', 'No pagado', '1000041'),
(47, 27, 4, '100', '0', '2024-08-05', '2024-09-05', 'Pagado', '1000042'),
(48, 27, 4, '200', '0', '2024-08-05', '2024-10-05', 'Pagado', '1000043'),
(49, 30, 4, '0', '0', '2024-08-05', '2024-10-05', 'Pagado', '1000044'),
(50, 29, 4, '0', '0', '2024-08-05', '2024-10-05', 'Pagado', '1000045'),
(51, 37, 4, '320', '0', '2024-08-05', '2024-10-05', 'No pagado', '1000046'),
(52, 15, 4, '320', '0', '2024-08-05', '2024-10-05', 'No pagado', '1000047'),
(53, 31, 4, '320', '0', '2024-08-05', '2024-10-05', 'No pagado', '1000048'),
(54, 32, 4, '320', '0', '2024-08-05', '2024-10-05', 'No pagado', '1000049'),
(55, 34, 4, '320', '0', '2024-08-05', '2024-10-05', 'No pagado', '1000050'),
(56, 14, 4, '320', '0', '2024-08-05', '2024-10-05', 'No pagado', '1000051'),
(57, 19, 4, '320', '0', '2024-08-05', '2024-10-05', 'No pagado', '1000052'),
(58, 25, 4, '320', '0', '2024-08-05', '2024-10-05', 'No pagado', '1000053'),
(59, 26, 4, '320', '0', '2024-08-05', '2024-10-05', 'No pagado', '1000054'),
(60, 28, 4, '320', '0', '2024-08-05', '2024-10-05', 'No pagado', '1000055'),
(61, 27, 4, '0', '0', '2024-08-05', '2024-12-05', 'Pagado', '1000056'),
(62, 30, 4, '0', '0', '2024-08-05', '2024-12-05', 'Pagado', '1000057'),
(63, 29, 4, '0', '0', '2024-08-05', '2024-12-05', 'Pagado', '1000058'),
(64, 37, 4, '640', '0', '2024-08-05', '2024-12-05', 'No pagado', '1000059'),
(65, 15, 4, '640', '0', '2024-08-05', '2024-12-05', 'No pagado', '1000060'),
(66, 31, 4, '640', '0', '2024-08-05', '2024-12-05', 'No pagado', '1000061'),
(67, 32, 4, '640', '0', '2024-08-05', '2024-12-05', 'No pagado', '1000062'),
(68, 34, 4, '640', '0', '2024-08-05', '2024-12-05', 'No pagado', '1000063'),
(69, 14, 4, '640', '0', '2024-08-05', '2024-12-05', 'No pagado', '1000064'),
(70, 19, 4, '640', '0', '2024-08-05', '2024-12-05', 'No pagado', '1000065'),
(71, 25, 4, '640', '0', '2024-08-05', '2024-12-05', 'No pagado', '1000066'),
(72, 26, 4, '640', '0', '2024-08-05', '2024-12-05', 'No pagado', '1000067'),
(73, 28, 4, '640', '0', '2024-08-05', '2024-12-05', 'No pagado', '1000068'),
(74, 27, 4, '0', '0', '2024-08-06', '2024-10-06', 'Pagado', '1000069'),
(75, 30, 4, '320', '0', '2024-08-06', '2024-10-06', 'No pagado', '1000070'),
(76, 29, 4, '0', '0', '2024-08-06', '2024-10-06', 'Pagado', '1000071'),
(77, 16, 6, '0', '0', '2024-08-09', '2024-09-09', 'Pagado', '1000072'),
(78, 16, 4, '0', '0', '2024-08-09', '2024-09-09', 'Pagado', '1000073'),
(79, 16, 3, '0', '0', '2024-08-09', '2024-09-09', 'Pagado', '1000074'),
(80, 16, 1, '250', '0', '2024-08-09', '2024-09-09', 'No pagado', '1000075');

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
(1, 'activo'),
(2, 'desactivado');

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
(1, 'activo'),
(2, 'desactivado');

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
(1, 'activo'),
(2, 'desactivado');

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
(1, 'activo'),
(2, 'desactivado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_multipago`
--

CREATE TABLE `estado_multipago` (
  `id_estado` int NOT NULL,
  `estado` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `estado_multipago`
--

INSERT INTO `estado_multipago` (`id_estado`, `estado`) VALUES
(1, 'activo'),
(2, 'desactivado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_pago`
--

CREATE TABLE `estado_pago` (
  `id_estado` int NOT NULL,
  `estado` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `estado_pago`
--

INSERT INTO `estado_pago` (`id_estado`, `estado`) VALUES
(1, 'activo'),
(2, 'desactivado');

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
(1, 'activo'),
(2, 'desactivado');

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
(1, 'activo'),
(2, 'desactivado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `forma_de_pago`
--

CREATE TABLE `forma_de_pago` (
  `id_pago` int NOT NULL,
  `pago` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_estado` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `forma_de_pago`
--

INSERT INTO `forma_de_pago` (`id_pago`, `pago`, `id_estado`) VALUES
(1, 'Efectivo', 1),
(2, 'Cheque', 1),
(3, 'Tarjeta', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `forma_pago`
--

CREATE TABLE `forma_pago` (
  `id_forma` int NOT NULL,
  `id_cuenta` int NOT NULL,
  `tipo_pago` varchar(50) NOT NULL,
  `forma_pago` varchar(50) NOT NULL,
  `n_referencia` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `forma_pago`
--

INSERT INTO `forma_pago` (`id_forma`, `id_cuenta`, `tipo_pago`, `forma_pago`, `n_referencia`) VALUES
(1, 78, 'Efectivo', 'Físico', 'Ninguna'),
(2, 78, 'Referencia', 'Deposito', '956030201050'),
(3, 78, 'Referencia', 'Deposito', '909060302010'),
(4, 27, 'Referencia', 'Deposito', '906030303010'),
(5, 78, 'Referencia', 'Tarjeta de crédito', '82222222222222'),
(6, 79, 'Referencia', 'Tarjeta de débito', '888888888888888');

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
(1, 'VILLA CAREY', 1),
(2, 'VILLA ARRECIFE', 1);

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
(1, 'LEMPIRA', 'L.', 24, 1);

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
  `total_pago` float DEFAULT NULL,
  `cantidad_recibida` float DEFAULT NULL,
  `cantidad_devuelta` float DEFAULT NULL,
  `id_estado` int DEFAULT NULL,
  `id_pago` int DEFAULT NULL,
  `id_concepto` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `multi_pago`
--

INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`) VALUES
(4, '2000000', 19, 1, '2024-07-24', 160, 200, 40, 1, 1, 2),
(5, '2000001', 19, 2, '2024-07-25', 160, 200, 40, 1, 1, 2),
(7, '2000002', 27, 31, '2024-08-02', 320, 500, 180, 1, 1, 2),
(8, '2000003', 27, 34, '2024-08-02', 160, 200, 40, 1, 1, 2),
(9, '2000004', 30, 32, '2024-08-02', 160, 200, 40, 1, 1, 2),
(10, '2000005', 27, 33, '2024-08-02', 1440, 2000, 560, 1, 1, 2),
(11, '2000005', 27, 35, '2024-08-02', 1440, 2000, 560, 1, 1, 2),
(12, '2000005', 27, 36, '2024-08-02', 1440, 2000, 560, 1, 1, 2),
(13, '2000005', 27, 37, '2024-08-02', 1440, 2000, 560, 1, 1, 2),
(14, '2000005', 27, 38, '2024-08-02', 1440, 2000, 560, 1, 1, 2),
(15, '2000006', 19, 43, '2024-08-03', 480, 500, 20, 1, 1, 2),
(16, '2000007', 25, 44, '2024-08-03', 480, 500, 20, 1, 1, 2),
(17, '2000008', 25, 40, '2024-08-03', 320, 500, 180, 1, 1, 2),
(18, '2000009', 19, 23, '2024-08-03', 160, 200, 40, 1, 1, 2),
(19, '2000010', 19, 20, '2024-08-03', 160, 200, 40, 1, 1, 2),
(20, '2000010', 19, 7, '2024-08-03', 160, 200, 40, 1, 1, 2),
(21, '2000010', 19, 10, '2024-08-03', 160, 200, 40, 1, 1, 2),
(22, '2000010', 19, 14, '2024-08-03', 160, 200, 40, 1, 1, 2),
(23, '2000010', 19, 17, '2024-08-03', 160, 200, 40, 1, 1, 2),
(24, '2000010', 19, 39, '2024-08-03', 160, 200, 40, 1, 1, 2),
(25, '2000011', 16, 27, '2024-08-05', 160, 200, 40, 1, 1, 2),
(26, '2000012', 16, 28, '2024-08-05', 160, 200, 40, 1, 1, 2),
(27, '2000013', 27, 47, '2024-08-06', 160, 200, 40, 1, 1, 2),
(28, '2000014', 27, 48, '2024-08-06', 320, 500, 180, 1, 1, 2),
(29, '2000015', 27, 61, '2024-08-06', 640, 800, 160, 1, 1, 2),
(30, '2000016', 27, 31, '2024-08-06', 320, 500, 180, 1, 1, 2),
(31, '2000017', 27, 33, '2024-08-07', 160, 200, 40, 1, 1, 2),
(32, '2000018', 27, 34, '2024-08-07', 160, 200, 40, 1, 1, 2),
(33, '2000019', 27, 34, '2024-08-07', 160, 200, 40, 1, 1, 2),
(34, '2000020', 27, 35, '2024-08-07', 320, 500, 180, 1, 1, 2),
(35, '2000020', 27, 36, '2024-08-07', 320, 220, -100, 1, 1, 2),
(36, '2000021', 27, 37, '2024-08-07', 320, 400, 80, 1, 1, 2),
(37, '2000021', 27, 38, '2024-08-07', 320, 220, -100, 1, 1, 2),
(38, '2000021', 27, 47, '2024-08-07', 160, 60, -100, 1, 1, 2),
(39, '2000022', 27, 48, '2024-08-07', 320, 120, -200, 1, 1, 2),
(40, '2000023', 27, 61, '2024-08-07', 640, 500, -140, 1, 1, 2),
(41, '2000024', 30, 32, '2024-08-08', 160, 200, 40, 1, 1, 2),
(42, '2000025', 27, 61, '2024-08-08', 140, 140, 0, 1, 1, 2),
(43, '2000025', 27, 61, '2024-08-08', 0, 0, 0, 1, 1, 2),
(44, '2000026', 27, 61, '2024-08-08', 0, 0, 0, 1, 1, 2),
(45, '2000027', 27, 61, '2024-08-08', 0, 0, 0, 1, 1, 2),
(46, '2000028', 27, 74, '2024-08-08', 320, 320, 0, 1, 1, 2),
(47, '2000028', 27, 61, '2024-08-08', 0, 0, 0, 1, 1, 2),
(48, '2000029', 27, 61, '2024-08-08', 100, 100, 0, 1, 1, 2),
(49, '2000029', 30, 49, '2024-08-08', 320, 100, -220, 1, 1, 2),
(50, '2000029', 30, 49, '2024-08-08', 220, 300, 80, 1, 1, 2),
(51, '2000030', 30, 62, '2024-08-08', 640, 500, -140, 1, 1, 2),
(52, '2000030', 30, 62, '2024-08-08', 140, 200, 60, 1, 1, 2),
(53, '2000031', 29, 76, '2024-08-09', 320, 400, 80, 1, 1, 2),
(54, '2000031', 29, 50, '2024-08-09', 320, 200, -120, 1, 1, 2),
(55, '2000031', 29, 50, '2024-08-09', 120, 120, 0, 1, 1, 2),
(56, '2000031', 29, 63, '2024-08-09', 640, 640, 0, 1, 1, 2),
(57, '2000032', 16, 77, '2024-08-09', 200, 250, 50, 1, 1, 2),
(58, '2000033', 16, 26, '2024-08-09', 160, 100, -60, 1, 1, 2),
(59, '2000033', 16, 26, '2024-08-09', 60, 100, 40, 1, 1, 2),
(60, '2000034', 16, 27, '2024-08-09', 160, 100, -60, 1, 1, 2),
(61, '2000035', 16, 27, '2024-08-09', 60, 30, -30, 1, 1, 2),
(62, '2000036', 16, 78, '2024-08-11', 160, 80, -80, 1, 1, 2),
(63, '2000037', 16, 27, '2024-08-11', 30, 0, 0, 1, 1, 2),
(64, '2000037', 16, 78, '2024-08-11', 80, 0, 0, 1, 1, 2),
(65, '2000037', 16, 79, '2024-08-11', 160, 0, 0, 1, 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE `permisos` (
  `id_acceso` int NOT NULL,
  `acceso` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `permisos`
--

INSERT INTO `permisos` (`id_acceso`, `acceso`) VALUES
(1, 'Administrador'),
(2, 'Usuario');

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
(1, 'ANTHONY CLEMENTE OLIVA MURILLO', '0101199903209', 'AN', '2024-07-21', 1, '\r\n            ', '94856463'),
(2, 'LOLO', '1', '1LLK', '2024-07-21', 1, '\r\n            ', '94856463'),
(3, 'KK', '7', 'KK', '2024-07-21', 1, '\r\n            ', '95'),
(4, 'EL PEPE', '44', 'KFMVKFM', '2024-07-21', 1, '\r\n            ', '9485'),
(5, 'PEPITO', '44', 'KFMVKFM', '2024-07-21', 1, '\r\n            ', '9485'),
(6, 'PACO', '44', 'KFMVKFM', '2024-07-21', 1, '\r\n            ', '9485'),
(7, 'CARNE', '123', 'MMDKMC', '2024-07-21', 1, '\r\n            ', '98'),
(8, 'LOLA', '123', 'MMDKMC', '2024-07-21', 1, '\r\n            ', '98'),
(9, 'HECTOR HERNANDEZ', '010119990', 'KDMKMDKCKD', '2024-07-22', 1, 'hola mundo', '626262'),
(10, 'HECTOR HERNANDEZ', '010119990', 'KDMKMDKCKD', '2024-07-22', 1, 'hola mundo', '626262'),
(11, 'PRUEBA', '0101500095222', 'CESAR', '2024-07-22', 1, 'mckdmkd\r\n            ', '95855555'),
(12, 'HH', '00000000', 'HHH', '2024-07-22', 1, 'mckdmkd\r\n            ', '77'),
(13, 'HH', '00000000', 'HHH', '2024-07-22', 1, 'mckdmkd\r\n            ', '77'),
(14, 'MVKMFKV', 'MVKMFKVF', 'MVKFMVKF', '2024-07-22', 1, '\r\n            ', 'VMKFMKVF'),
(15, 'MVKMFKV', 'MVKMFKVF', 'MVKFMVKF', '2024-07-22', 1, '\r\n            ', 'VMKFMKVF'),
(16, '', '', '', '2024-07-23', 1, '\r\n            ', ''),
(17, 'MM', 'MM', 'MM', '2024-07-23', 1, '\r\n            ', 'MM'),
(18, 'MM', 'MM', 'MM', '2024-07-23', 1, '\r\n            ', 'MM'),
(19, '', '', '', '2024-07-31', 1, '\r\n            ', ''),
(20, 'PEPITO', '01015000', 'elpepe@gmail.com', '2024-08-02', 1, '\r\n            ', '94856463'),
(21, 'YY', '1515151', 'jj@gmail.com', '2024-08-02', 1, 'kmkmk\r\n            ', '123456789'),
(22, 'NN', '12', 'jj@gmail.com', '2024-08-02', 1, 'kmkmk\r\n            ', '74'),
(23, 'JUAN', '123456789', 'juancho@gmail.com', '2024-08-02', 1, '\r\n            ', '123456'),
(24, 'E', '7', 'juancho@gmail.com', '2024-08-02', 1, '\r\n            ', '4'),
(25, '', '', '', '2024-08-02', 1, '\r\n            ', ''),
(26, '', '', '', '2024-08-02', 1, '\r\n            ', ''),
(27, 'K', 'K', 'k@gmail', '2024-08-02', 1, '\r\n            ', 'K'),
(28, 'EL NENE', '50', 'nene@gmail.com', '2024-08-02', 1, '\r\n            ', '123456'),
(29, '', '', '', '2024-08-02', 1, '\r\n            ', ''),
(30, '', '', '', '2024-08-02', 1, '\r\n            ', ''),
(31, '', '', '', '2024-08-02', 1, '\r\n            ', ''),
(32, '', '', '', '2024-08-02', 1, '\r\n            ', ''),
(33, '', '', '', '2024-08-02', 1, '\r\n            ', ''),
(34, '', '', '', '2024-08-02', 1, '\r\n            ', ''),
(35, '', '', '', '2024-08-02', 1, '\r\n            ', ''),
(36, '', '', '', '2024-08-02', 1, '\r\n            ', ''),
(37, '', '', '', '2024-08-02', 1, '\r\n            ', ''),
(38, '', '', '', '2024-08-02', 1, 'Registro por intercambio', ''),
(39, '', '', '', '2024-08-02', 1, 'Registro por intercambio', ''),
(40, '', '', '', '2024-08-02', 1, 'Registro por intercambio', ''),
(41, '', '', '', '2024-08-02', 1, 'Registro por intercambio', ''),
(42, '', '', '', '2024-08-02', 1, 'Registro por intercambio', ''),
(43, 'PACO', '0000', 'paco@gmail.com', '2024-08-02', 1, '\r\n            ', '94856463'),
(44, 'PRUEBA', '2', 'prueba@gmail.com', '2024-08-05', 1, '\r\n            ', '94856463');

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
(10, 9, 55),
(11, 9, 56),
(12, 10, 57),
(13, 11, 71),
(14, 12, 47),
(15, 13, 38),
(16, 11, 58),
(17, 11, 59),
(18, 11, 61),
(19, 2, 51),
(20, 2, 64),
(21, 15, 60),
(22, 17, 62),
(23, 18, 63),
(24, 20, 76),
(25, 20, 52),
(26, 21, 53),
(27, 22, 33),
(28, 23, 54),
(29, 24, 35),
(30, 27, 34),
(31, 28, 38),
(32, 28, 39),
(33, 2, 73),
(34, 1, 40),
(35, 1, 74),
(36, 2, 75),
(37, 43, 36),
(38, 44, 77);

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
-- Estructura Stand-in para la vista `tomar_desde_hasta`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `tomar_desde_hasta` (
`id_unir` int
,`villa` varchar(101)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int NOT NULL,
  `nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `apellido` varchar(50) NOT NULL,
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

INSERT INTO `usuarios` (`id_usuario`, `nombre`, `apellido`, `dni`, `telefono`, `correo`, `id_acceso`, `clave`, `id_estado`, `usuario`) VALUES
(2, 'ANTHONY', 'OLIVA', '010119993209', '94856466', 'anthonyoliva70@gmail.com', 1, '741852', 1, 'ANTHONY'),
(3, 'NESTOR', 'OLIVA', '01010000000', '94856463', 'nestor@gmail.com', 2, '123456', 1, 'NESTOR'),
(4, 'ELDER', 'OLIVA', '01012222222', '94856463', 'njjvnfjvjf@nvfvfn', 2, '123456', 1, 'ELDER'),
(6, 'ANDREA', 'MURILLO', '0101196801005', '96723864', 'xiomarandrea@gmail.com', 2, '123456', 2, 'XIOMARA'),
(7, 'ANDRE', 'MURILLO', '0101196801005', '96723864', 'xiomarandrea@gmail.com', 2, '1234567', 2, 'XIOMARA'),
(8, 'TOMY', 'HALLEN', '0101196801005', '96723864', 'tomy@gg', 1, '123456', 2, 'TOMY'),
(9, 'ANDREA', 'MURILLO', '0101196801005', '96723864', 'xiomarandrea@gmail.com', 1, '123456', 1, 'XIOMARA'),
(10, 'ASHANTY', 'GONZALES', '0101200405646', '84651233', 'acha.gon@gmail.com', 2, '963852', 1, 'ASHANTY'),
(11, 'MKVF', 'KFMVKFM', '5515151', '845545151', 'kdm@mkbmgk', 2, 'ooo', 1, 'VMKFKVFK'),
(12, 'KCMDKCMDK', 'DMKMDKCMKD', 'DKMKDMVKFMK', 'KDMVKMKVFMKV', 'vmkvmkkf@v', 1, 'cmdkmckdmckd', 1, 'MKCDMKCMDK');

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
  `id_modelo` int DEFAULT NULL,
  `id_condicion` int DEFAULT NULL,
  `id_estado` int DEFAULT NULL,
  `direccion` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `observacion` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `villas`
--

INSERT INTO `villas` (`id_villa`, `id_grupo`, `numero`, `cont_eeh`, `habitaciones`, `lote`, `id_modelo`, `id_condicion`, `id_estado`, `direccion`, `observacion`) VALUES
(33, 1, '1', '123456789', '5', '250', 1, 1, 2, 'Roma, Palma Real', ''),
(34, 1, '2', '123456789', '5', '250', 1, 1, 2, 'Roma, Palma Real', ''),
(35, 1, '3', '123456789', '5', '250', 1, 1, 2, 'Roma, Palma Real', ''),
(36, 1, '4', '123456789', '5', '250', 1, 1, 2, 'Roma, Palma Real', ''),
(37, 1, '5', '123456789', '5', '250', 1, 1, 1, 'Roma, Palma Real', ''),
(38, 1, '6', '123456', '7', '250', 2, 1, 2, '', ''),
(39, 1, '7', '123456', '7', '250', 2, 1, 2, '', ''),
(40, 1, '8', '123456', '7', '250', 2, 1, 2, '', ''),
(41, 1, '11', '', '', '', 1, 1, 1, '', ''),
(42, 1, '12', '', '', '', 1, 1, 1, '', ''),
(43, 1, '13', '', '', '', 1, 1, 1, '', ''),
(44, 1, '14', '', '', '', 1, 1, 1, '', ''),
(45, 1, '17', '1234567899', '5', '255.05', 1, 1, 1, '', ''),
(46, 1, '18', '1234567899', '5', '255.05', 1, 1, 1, '', ''),
(47, 1, '70', '123456789', '5', '200.1', 1, 1, 2, '', ''),
(48, 1, '71', '123456789', '5', '200.1', 1, 1, 1, '', ''),
(49, 1, '78', '123456789', '5', '10.5', 1, 1, 1, '', ''),
(50, 1, '79', '123456789', '5', '10.5', 1, 1, 1, '', ''),
(51, 2, '1', '123456789', '5', '200.1', 1, 1, 2, '', ''),
(52, 2, '2', '', '', '', 1, 1, 2, '', ''),
(53, 2, '3', '', '', '', 1, 1, 2, '', ''),
(54, 2, '4', '', '', '', 1, 1, 2, '', ''),
(55, 3, '1', '123456789', '5', '200.1', 1, 1, 2, '', ''),
(56, 3, '2', '', '', '', 1, 1, 2, '', ''),
(57, 3, '3', '123456789', '5', '200.1', 1, 1, 2, '', ''),
(58, 3, '12', '', '', '', 1, 1, 2, '', ''),
(59, 3, '13', '', '', '', 1, 1, 2, '', ''),
(60, 3, '14', '', '', '', 1, 1, 2, '', ''),
(61, 3, '20', '', '', '', 1, 1, 2, '', ''),
(62, 3, '21', '', '', '', 1, 1, 2, '', ''),
(63, 3, '22', '', '', '', 1, 1, 2, '', ''),
(64, 3, '23', '', '', '', 1, 1, 2, '', ''),
(65, 1, '99', '', '', '', 1, 1, 1, '', ''),
(66, 1, '200', '', '', '', 1, 1, 1, '', ''),
(67, 1, '201', '', '', '', 1, 1, 1, '', ''),
(68, 1, '202', '', '', '', 1, 1, 1, '', ''),
(69, 1, '203', '', '', '', 1, 1, 1, '', ''),
(70, 1, '204', '', '', '1.50', 1, 1, 1, '', ''),
(71, 3, '40', '123456789', '2', '250.10', 2, 1, 2, 'roma', 'prueba'),
(72, 1, '', '', '', '', 1, 1, 1, '', ''),
(73, 4, '1', '123456789', '2', '150', 2, 1, 2, '', ''),
(74, 4, '2', '123456789', '2', '150', 2, 1, 2, '', ''),
(75, 4, '3', '123456789', '2', '150', 2, 1, 2, '', ''),
(76, 4, '4', '123456789', '4', '500', 1, 1, 2, '', ''),
(77, 4, '12', '123456', '7', '150', 2, 1, 2, '', ''),
(78, 4, '15', '777777777', '2', '600', 2, 1, 1, '', ''),
(79, 1, '15', '5555555555555', '2', '250', 1, 1, 1, 'Roma, Palma Real', 'Tiene una fuga de gas'),
(80, 1, '50', '5555555555555', '2', '250', 1, 1, 1, 'Roma, Juteapa', 'Mucha agua'),
(81, 1, '88', '', '', '', 1, 1, 1, '', ''),
(82, 1, '89', '', '', '', 1, 1, 1, '', '');

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
,`usuario` varchar(50)
,`nombre` varchar(101)
,`dni` varchar(50)
,`telefono` varchar(50)
,`correo` varchar(50)
,`acceso` varchar(50)
,`clave` varchar(50)
,`estado` varchar(50)
,`nom` varchar(50)
,`ape` varchar(50)
,`imprimir_reportes` varchar(2)
,`modificar_reportes` varchar(2)
,`eliminar_reportes` varchar(2)
);

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

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `cuenta_vista` (`id_cuenta`, `codigo`, `id_unir`, `concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`) AS   select `cuentas`.`id_cuenta` AS `id_cuenta`,`cuentas`.`codigo` AS `codigo`,`propietarios_villas`.`id_unir` AS `id_unir`,`concepto`.`concepto` AS `concepto`,`cuentas`.`costo` AS `costo`,`cuentas`.`abono` AS `abono`,`cuentas`.`desde` AS `desde`,`cuentas`.`hasta` AS `hasta`,`cuentas`.`pagado` AS `pagado` from ((`cuentas` join `propietarios_villas` on((`cuentas`.`id_unir` = `propietarios_villas`.`id_unir`))) join `concepto` on((`cuentas`.`id_concepto` = `concepto`.`id_concepto`)))  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `donar_recibir_villa`
--
DROP TABLE IF EXISTS `donar_recibir_villa`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `donar_recibir_villa` (`id_propietario`, `id_villa`, `villa`, `cont_eeh`, `habitaciones`, `condicion`, `modelo`) AS   select `propietarios_villas`.`id_propietario` AS `id_propietario`,`villas`.`id_villa` AS `id_villa`,concat(`grupo_villa`.`grupo`,'-',`villas`.`numero`) AS `villa`,`villas`.`cont_eeh` AS `cont_eeh`,`villas`.`habitaciones` AS `habitaciones`,`condicion_villas`.`condicion` AS `condicion`,`modelo_villa`.`modelo` AS `modelo` from ((((`propietarios_villas` join `villas` on((`propietarios_villas`.`id_villa` = `villas`.`id_villa`))) join `grupo_villa` on((`villas`.`id_grupo` = `grupo_villa`.`id_grupo`))) join `condicion_villas` on((`villas`.`id_condicion` = `condicion_villas`.`id_condicion`))) join `modelo_villa` on((`villas`.`id_modelo` = `modelo_villa`.`id_modelo`)))  ;

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

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `propietario_principal` (`id_unir`, `id_propietario`, `id_villa`, `villa`, `cont_eeh`, `nombre`, `dni`, `telefono`, `correo`) AS   select `propietarios_villas`.`id_unir` AS `id_unir`,`propietarios_villas`.`id_propietario` AS `id_propietario`,`propietarios_villas`.`id_villa` AS `id_villa`,concat(`grupo_villa`.`grupo`,'-',`villas`.`numero`) AS `villa`,`villas`.`cont_eeh` AS `cont_eeh`,`propietarios`.`nombre` AS `nombre`,`propietarios`.`dni` AS `dni`,`propietarios`.`telefono` AS `telefono`,`propietarios`.`correo` AS `correo` from (((`propietarios_villas` join `propietarios` on((`propietarios_villas`.`id_propietario` = `propietarios`.`id_propietario`))) join `villas` on((`propietarios_villas`.`id_villa` = `villas`.`id_villa`))) join `grupo_villa` on((`villas`.`id_grupo` = `grupo_villa`.`id_grupo`)))  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `tomar_desde_hasta`
--
DROP TABLE IF EXISTS `tomar_desde_hasta`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tomar_desde_hasta`  AS SELECT `pripietario_cuenta_vista`.`id_unir` AS `id_unir`, `pripietario_cuenta_vista`.`villa` AS `villa` FROM `pripietario_cuenta_vista` ORDER BY substring_index(`pripietario_cuenta_vista`.`villa`,'-',1) ASC, cast(substring_index(`pripietario_cuenta_vista`.`villa`,'-',-(1)) as unsigned) ASC ;

-- --------------------------------------------------------

--
-- Estructura para la vista `villa_completo`
--
DROP TABLE IF EXISTS `villa_completo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `villa_completo` (`id_villa`, `villas`, `cont_eeh`, `habitaciones`, `lote`, `modelo`, `condicion`, `id_estado`) AS   select `villas`.`id_villa` AS `id_villa`,concat(`grupo_villa`.`grupo`,'-',`villas`.`numero`) AS `villas`,`villas`.`cont_eeh` AS `cont_eeh`,`villas`.`habitaciones` AS `habitaciones`,`villas`.`lote` AS `lote`,`modelo_villa`.`modelo` AS `modelo`,`condicion_villas`.`condicion` AS `condicion`,`villas`.`id_estado` AS `id_estado` from (((`villas` join `grupo_villa` on((`villas`.`id_grupo` = `grupo_villa`.`id_grupo`))) join `modelo_villa` on((`villas`.`id_modelo` = `modelo_villa`.`id_modelo`))) join `condicion_villas` on((`villas`.`id_condicion` = `condicion_villas`.`id_condicion`)))  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_usuario`
--
DROP TABLE IF EXISTS `vista_usuario`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_usuario`  AS SELECT `usuarios`.`id_usuario` AS `id_usuario`, `usuarios`.`usuario` AS `usuario`, concat(`usuarios`.`nombre`,' ',`usuarios`.`apellido`) AS `nombre`, `usuarios`.`dni` AS `dni`, `usuarios`.`telefono` AS `telefono`, `usuarios`.`correo` AS `correo`, `permisos`.`acceso` AS `acceso`, `usuarios`.`clave` AS `clave`, `estado_usuario`.`estado` AS `estado`, `usuarios`.`nombre` AS `nom`, `usuarios`.`apellido` AS `ape`, `acceso_usuario`.`imprimir_reportes` AS `imprimir_reportes`, `acceso_usuario`.`modificar_reportes` AS `modificar_reportes`, `acceso_usuario`.`eliminar_reportes` AS `eliminar_reportes` FROM (((`acceso_usuario` join `usuarios` on((`acceso_usuario`.`id_usuario` = `usuarios`.`id_usuario`))) join `permisos` on((`usuarios`.`id_acceso` = `permisos`.`id_acceso`))) join `estado_usuario` on((`usuarios`.`id_estado` = `estado_usuario`.`id_estado`))) ;

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
  ADD KEY `FK_cuentas_propietarios_villas` (`id_unir`);

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
  ADD KEY `FK_id_cuenta` (`id_cuenta`);

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
  ADD KEY `FK_villas_grupo_villa` (`id_grupo`),
  ADD KEY `FK_villas_modelo_villa` (`id_modelo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `acceso_usuario`
--
ALTER TABLE `acceso_usuario`
  MODIFY `id_acceso_usuario` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `caracteristicas`
--
ALTER TABLE `caracteristicas`
  MODIFY `id_caracteristica` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `concepto`
--
ALTER TABLE `concepto`
  MODIFY `id_concepto` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `condicion_villas`
--
ALTER TABLE `condicion_villas`
  MODIFY `id_condicion` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `contactos_propietario`
--
ALTER TABLE `contactos_propietario`
  MODIFY `id_contacto` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cuentas`
--
ALTER TABLE `cuentas`
  MODIFY `id_cuenta` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

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
-- AUTO_INCREMENT de la tabla `estado_multipago`
--
ALTER TABLE `estado_multipago`
  MODIFY `id_estado` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `estado_pago`
--
ALTER TABLE `estado_pago`
  MODIFY `id_estado` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `estado_propietario`
--
ALTER TABLE `estado_propietario`
  MODIFY `id_estado` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `estado_usuario`
--
ALTER TABLE `estado_usuario`
  MODIFY `id_estado` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `estado_villa`
--
ALTER TABLE `estado_villa`
  MODIFY `id_estado` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `forma_de_pago`
--
ALTER TABLE `forma_de_pago`
  MODIFY `id_pago` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `forma_pago`
--
ALTER TABLE `forma_pago`
  MODIFY `id_forma` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `grupo_villa`
--
ALTER TABLE `grupo_villa`
  MODIFY `id_grupo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `modelo_villa`
--
ALTER TABLE `modelo_villa`
  MODIFY `id_modelo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `moneda`
--
ALTER TABLE `moneda`
  MODIFY `id_moneda` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `multi_pago`
--
ALTER TABLE `multi_pago`
  MODIFY `id_multi` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `id_acceso` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `propietarios`
--
ALTER TABLE `propietarios`
  MODIFY `id_propietario` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT de la tabla `propietarios_villas`
--
ALTER TABLE `propietarios_villas`
  MODIFY `id_unir` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `villas`
--
ALTER TABLE `villas`
  MODIFY `id_villa` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `acceso_usuario`
--
ALTER TABLE `acceso_usuario`
  ADD CONSTRAINT `FK_usuario_acceso` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `caracteristicas`
--
ALTER TABLE `caracteristicas`
  ADD CONSTRAINT `caracteristicas$FK_caracteristicas_villas` FOREIGN KEY (`id_villa`) REFERENCES `villas` (`id_villa`);

--
-- Filtros para la tabla `concepto`
--
ALTER TABLE `concepto`
  ADD CONSTRAINT `concepto$FK_concepto_estado_concepto` FOREIGN KEY (`id_estado`) REFERENCES `estado_concepto` (`id_estado`);

--
-- Filtros para la tabla `contactos_propietario`
--
ALTER TABLE `contactos_propietario`
  ADD CONSTRAINT `FK_id_propietario` FOREIGN KEY (`id_propietario`) REFERENCES `propietarios_villas` (`id_unir`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `cuentas`
--
ALTER TABLE `cuentas`
  ADD CONSTRAINT `cuentas$FK_cuenta_concepto` FOREIGN KEY (`id_concepto`) REFERENCES `concepto` (`id_concepto`),
  ADD CONSTRAINT `cuentas$FK_cuentas_propietarios_villas` FOREIGN KEY (`id_unir`) REFERENCES `propietarios_villas` (`id_unir`);

--
-- Filtros para la tabla `forma_de_pago`
--
ALTER TABLE `forma_de_pago`
  ADD CONSTRAINT `FK_forma_de_pago_estado_pago` FOREIGN KEY (`id_estado`) REFERENCES `estado_pago` (`id_estado`);

--
-- Filtros para la tabla `forma_pago`
--
ALTER TABLE `forma_pago`
  ADD CONSTRAINT `FK_id_cuenta` FOREIGN KEY (`id_cuenta`) REFERENCES `cuentas` (`id_cuenta`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `grupo_villa`
--
ALTER TABLE `grupo_villa`
  ADD CONSTRAINT `grupo_villa$FK_grupo_villa_estado_grupo_villa` FOREIGN KEY (`id_estado`) REFERENCES `estado_grupo_villa` (`id_estado`);

--
-- Filtros para la tabla `modelo_villa`
--
ALTER TABLE `modelo_villa`
  ADD CONSTRAINT `modelo_villa$FK_modelo_villa_estado_modelos` FOREIGN KEY (`id_estado`) REFERENCES `estado_modelos` (`id_estado`);

--
-- Filtros para la tabla `moneda`
--
ALTER TABLE `moneda`
  ADD CONSTRAINT `moneda$FK_Moneda_estado_moneda` FOREIGN KEY (`id_estado`) REFERENCES `estado_moneda` (`id_estado`);

--
-- Filtros para la tabla `multi_pago`
--
ALTER TABLE `multi_pago`
  ADD CONSTRAINT `FK_multi_pago_cuentas` FOREIGN KEY (`id_cuenta`) REFERENCES `cuentas` (`id_cuenta`),
  ADD CONSTRAINT `FK_multi_pago_estado_multipago` FOREIGN KEY (`id_estado`) REFERENCES `estado_multipago` (`id_estado`),
  ADD CONSTRAINT `FK_multi_pago_forma_de_pago` FOREIGN KEY (`id_pago`) REFERENCES `forma_de_pago` (`id_pago`),
  ADD CONSTRAINT `FK_multi_pago_id_concepto` FOREIGN KEY (`id_concepto`) REFERENCES `concepto` (`id_concepto`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `FK_multi_pago_propietarios_villas` FOREIGN KEY (`id_unir`) REFERENCES `propietarios_villas` (`id_unir`);

--
-- Filtros para la tabla `propietarios`
--
ALTER TABLE `propietarios`
  ADD CONSTRAINT `propietarios$FK_propietarios_estado_propietario` FOREIGN KEY (`id_estado`) REFERENCES `estado_propietario` (`id_estado`);

--
-- Filtros para la tabla `propietarios_villas`
--
ALTER TABLE `propietarios_villas`
  ADD CONSTRAINT `propietarios_villas$FK_propietarios_villas_propietarios` FOREIGN KEY (`id_propietario`) REFERENCES `propietarios` (`id_propietario`),
  ADD CONSTRAINT `propietarios_villas$FK_propietarios_villas_villas` FOREIGN KEY (`id_villa`) REFERENCES `villas` (`id_villa`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios$FK_usuarios_estado_usuario` FOREIGN KEY (`id_estado`) REFERENCES `estado_usuario` (`id_estado`),
  ADD CONSTRAINT `usuarios$FK_usuarios_permisos` FOREIGN KEY (`id_acceso`) REFERENCES `permisos` (`id_acceso`);

--
-- Filtros para la tabla `villas`
--
ALTER TABLE `villas`
  ADD CONSTRAINT `villas$FK_villas_condicion_villas` FOREIGN KEY (`id_condicion`) REFERENCES `condicion_villas` (`id_condicion`),
  ADD CONSTRAINT `villas$FK_villas_estado_villa` FOREIGN KEY (`id_estado`) REFERENCES `estado_villa` (`id_estado`),
  ADD CONSTRAINT `villas$FK_villas_grupo_villa` FOREIGN KEY (`id_grupo`) REFERENCES `grupo_villa` (`id_grupo`),
  ADD CONSTRAINT `villas$FK_villas_modelo_villa` FOREIGN KEY (`id_modelo`) REFERENCES `modelo_villa` (`id_modelo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
