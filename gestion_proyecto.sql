-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 02-09-2024 a las 15:37:06
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
(1, 6, 'no', 'si', 'no'),
(2, 7, 'no', 'no', 'no'),
(3, 2, 'si', 'si', 'si'),
(4, 8, 'si', 'si', 'si'),
(5, 9, 'no', 'si', 'no'),
(6, 10, 'si', 'si', 'si'),
(7, 11, 'si', 'si', 'si'),
(8, 12, 'si', 'no', 'si');

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
(7, 'INTERNET', 'Abono', 70, 'No', 1),
(8, 'MUEBLES', 'Abono', 90.05, 'No', 1),
(9, 'REPARACION', 'Cargo', 0, 'Si', 1);

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
  `codigo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_concepto_2` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `cuentas`
--

INSERT INTO `cuentas` (`id_cuenta`, `id_unir`, `id_concepto`, `costo`, `abono`, `desde`, `hasta`, `pagado`, `codigo`, `id_concepto_2`) VALUES
(1, 19, 1, '160', '0', '2024-07-22', '2024-09-22', 'No pagado', '1000000', 2),
(2, 19, 1, '160', '0', '2024-07-24', '2024-07-24', 'No pagado', '1000001', 2),
(3, 15, 1, '0', '160', '2024-07-27', '2024-10-27', 'No pagado', '1000002', 2),
(4, 15, 1, '0', '160', '2024-07-28', '2024-08-28', 'No pagado', '1000003', 2),
(5, 15, 1, '0', '160', '2024-07-29', '2024-08-29', 'No pagado', '1000004', 2),
(6, 14, 1, '0', '160', '2024-07-29', '2024-08-29', 'Pagado', '1000004', 2),
(7, 19, 1, '0', '160', '2024-07-29', '2024-08-29', 'No pagado', '1000004', 2),
(8, 15, 1, '0', '160', '2024-07-29', '2024-07-29', 'No pagado', '1000005', 2),
(9, 14, 1, '0', '160', '2024-07-29', '2024-07-29', 'Pagado', '1000005', 2),
(10, 19, 1, '0', '160', '2024-07-29', '2024-07-29', 'No pagado', '1000005', 2),
(11, 15, 1, '0', '160', '2024-07-29', '2024-07-29', 'No pagado', '1000006', 2),
(12, 15, 1, '160', '0', '2024-07-29', '2024-09-29', 'No pagado', '1000007', 2),
(13, 14, 1, '100', '60', '2024-07-29', '2024-09-29', 'Pendiente', '1000008', 2),
(14, 19, 1, '160', '0', '2024-07-29', '2024-09-29', 'No pagado', '1000009', 2),
(15, 15, 1, '160', '0', '2024-07-30', '2024-07-30', 'No pagado', '1000010', 2),
(16, 14, 1, '160', '0', '2024-07-30', '2024-07-30', 'No pagado', '1000011', 2),
(17, 19, 1, '160', '0', '2024-07-30', '2024-07-30', 'No pagado', '1000012', 2),
(18, 15, 1, '160', '0', '2024-07-30', '2024-07-30', 'No pagado', '1000013', 2),
(19, 14, 1, '160', '0', '2024-07-30', '2024-07-30', 'No pagado', '1000014', 2),
(20, 19, 1, '160', '0', '2024-07-30', '2024-07-30', 'No pagado', '1000015', 2),
(21, 15, 1, '160', '0', '2024-07-30', '2024-07-30', 'No pagado', '1000016', 2),
(22, 14, 1, '160', '0', '2024-07-30', '2024-07-30', 'No pagado', '1000017', 2),
(23, 19, 1, '160', '0', '2024-07-30', '2024-07-30', 'No pagado', '1000018', 2),
(24, 10, 1, '0', '160', '2024-07-30', '2024-07-30', 'Pagado', '1000019', 2),
(25, 10, 1, '0', '160', '2024-07-30', '2024-07-30', 'Pagado', '1000020', 2),
(26, 16, 1, '0', '0', '2024-07-30', '2024-07-30', 'Pagado', '1000021', 2),
(27, 16, 1, '0', '0', '2024-07-30', '2024-07-30', 'Pagado', '1000022', 2),
(28, 16, 1, '0', '100', '2024-07-30', '2024-07-30', 'Pagado', '1000023', 2),
(29, 15, 1, '480', '0', '2024-07-30', '2024-07-30', 'No pagado', '1000024', 2),
(30, 15, 1, '480', '0', '2024-07-30', '2031-09-30', 'No pagado', '1000025', 2),
(31, 27, 3, '320', '0', '2024-08-02', '2024-10-02', 'Pagado', '1000026', 2),
(32, 30, 3, '0', '0', '2024-08-02', '2024-09-02', 'Pagado', '1000027', 2),
(33, 27, 1, '160', '0', '2024-08-03', '2024-08-03', 'Pagado', '1000028', 2),
(34, 27, 1, '-40', '0', '2024-08-03', '2024-08-03', 'Pagado', '1000029', 2),
(35, 27, 1, '0', '0', '2024-08-02', '2024-10-02', 'Pagado', '1000030', 2),
(36, 27, 1, '100', '0', '2024-08-02', '2024-08-02', 'Pagado', '1000031', 2),
(37, 27, 3, '0', '0', '2024-08-02', '2024-10-02', 'Pagado', '1000032', 2),
(38, 27, 1, '100', '0', '2024-08-02', '2024-10-02', 'Pagado', '1000033', 2),
(39, 19, 3, '320', '0', '2024-08-03', '2024-10-03', 'No pagado', '1000034', 2),
(40, 25, 3, '320', '0', '2024-08-03', '2024-10-03', 'No pagado', '1000035', 2),
(41, 26, 3, '320', '0', '2024-08-03', '2024-10-03', 'No pagado', '1000036', 2),
(42, 28, 3, '320', '0', '2024-08-03', '2024-10-03', 'No pagado', '1000037', 2),
(43, 19, 4, '480', '0', '2024-08-03', '2024-11-03', 'No pagado', '1000038', 2),
(44, 25, 4, '480', '0', '2024-08-03', '2024-11-03', 'No pagado', '1000039', 2),
(45, 26, 4, '480', '0', '2024-08-03', '2024-11-03', 'No pagado', '1000040', 2),
(46, 28, 4, '480', '0', '2024-08-03', '2024-11-03', 'No pagado', '1000041', 2),
(47, 27, 4, '100', '0', '2024-08-05', '2024-09-05', 'Pagado', '1000042', 2),
(48, 27, 4, '200', '0', '2024-08-05', '2024-10-05', 'Pagado', '1000043', 2),
(49, 30, 4, '0', '0', '2024-08-05', '2024-10-05', 'Pagado', '1000044', 2),
(50, 29, 4, '0', '0', '2024-08-05', '2024-10-05', 'Pagado', '1000045', 2),
(51, 37, 4, '320', '0', '2024-08-05', '2024-10-05', 'No pagado', '1000046', 2),
(52, 15, 4, '320', '0', '2024-08-05', '2024-10-05', 'No pagado', '1000047', 2),
(53, 31, 4, '320', '0', '2024-08-05', '2024-10-05', 'No pagado', '1000048', 2),
(54, 32, 4, '320', '0', '2024-08-05', '2024-10-05', 'No pagado', '1000049', 2),
(55, 34, 4, '320', '0', '2024-08-05', '2024-10-05', 'No pagado', '1000050', 2),
(56, 14, 4, '208', '112', '2024-08-05', '2024-10-05', 'Pendiente', '1000051', 2),
(57, 19, 4, '320', '0', '2024-08-05', '2024-10-05', 'No pagado', '1000052', 2),
(58, 25, 4, '320', '0', '2024-08-05', '2024-10-05', 'No pagado', '1000053', 2),
(59, 26, 4, '320', '0', '2024-08-05', '2024-10-05', 'No pagado', '1000054', 2),
(60, 28, 4, '320', '0', '2024-08-05', '2024-10-05', 'No pagado', '1000055', 2),
(61, 27, 4, '0', '0', '2024-08-05', '2024-12-05', 'Pagado', '1000056', 2),
(62, 30, 4, '0', '0', '2024-08-05', '2024-12-05', 'Pagado', '1000057', 2),
(63, 29, 4, '0', '0', '2024-08-05', '2024-12-05', 'Pagado', '1000058', 2),
(64, 37, 4, '640', '0', '2024-08-05', '2024-12-05', 'No pagado', '1000059', 2),
(65, 15, 4, '640', '0', '2024-08-05', '2024-12-05', 'No pagado', '1000060', 2),
(66, 31, 4, '640', '0', '2024-08-05', '2024-12-05', 'No pagado', '1000061', 2),
(67, 32, 4, '640', '0', '2024-08-05', '2024-12-05', 'No pagado', '1000062', 2),
(68, 34, 4, '640', '0', '2024-08-05', '2024-12-05', 'No pagado', '1000063', 2),
(69, 14, 4, '640', '0', '2024-08-05', '2024-12-05', 'No pagado', '1000064', 2),
(70, 19, 4, '640', '0', '2024-08-05', '2024-12-05', 'No pagado', '1000065', 2),
(71, 25, 4, '640', '0', '2024-08-05', '2024-12-05', 'No pagado', '1000066', 2),
(72, 26, 4, '640', '0', '2024-08-05', '2024-12-05', 'No pagado', '1000067', 2),
(73, 28, 4, '640', '0', '2024-08-05', '2024-12-05', 'No pagado', '1000068', 2),
(74, 27, 4, '0', '0', '2024-08-06', '2024-10-06', 'Pagado', '1000069', 2),
(75, 30, 4, '320', '0', '2024-08-06', '2024-10-06', 'No pagado', '1000070', 2),
(76, 29, 4, '0', '0', '2024-08-06', '2024-10-06', 'Pagado', '1000071', 2),
(77, 16, 6, '0', '0', '2024-08-09', '2024-09-09', 'Pagado', '1000072', 2),
(78, 16, 4, '0', '0', '2024-08-09', '2024-09-09', 'Pagado', '1000073', 2),
(79, 16, 3, '0', '0', '2024-08-09', '2024-09-09', 'Pagado', '1000074', 2),
(80, 16, 1, '0', '0', '2024-08-09', '2024-09-09', 'Pagado', '1000075', 2),
(81, 27, 3, '0', '0', '2024-08-12', '2024-10-12', 'Pagado', '1000076', 2),
(82, 30, 3, '0', '320', '2024-08-12', '2024-10-12', 'Pagado', '1000077', 2),
(83, 29, 3, '320', '0', '2024-08-12', '2024-10-12', 'No pagado', '1000078', 2),
(84, 37, 3, '320', '0', '2024-08-12', '2024-10-12', 'No pagado', '1000079', 2),
(85, 15, 3, '320', '0', '2024-08-12', '2024-10-12', 'No pagado', '1000080', 2),
(86, 31, 3, '0', '320', '2024-08-12', '2024-10-12', 'Pagado', '1000081', 2),
(87, 32, 3, '320', '0', '2024-08-12', '2024-10-12', 'No pagado', '1000082', 2),
(88, 34, 3, '320', '0', '2024-08-12', '2024-10-12', 'No pagado', '1000083', 2),
(89, 14, 3, '320', '0', '2024-08-12', '2024-10-12', 'No pagado', '1000084', 2),
(90, 13, 6, '0', '800', '2024-08-12', '2024-12-12', 'Pagado', '1000085', 2),
(91, 38, 3, '800', '0', '2024-08-12', '2025-01-12', 'No pagado', '1000086', 2),
(92, 13, 1, '0', '1500', '2024-08-12', '2025-02-12', 'Pagado', '1000087', 2),
(93, 13, 1, '200', '1300', '2024-08-12', '2025-02-12', 'Pendiente', '1000088', 2),
(94, 13, 1, '1000', '500', '2024-08-12', '2025-02-12', 'Pendiente', '1000089', 2),
(95, 13, 1, '0', '1500', '2024-08-12', '2025-02-12', 'Pagado', '1000090', 2),
(96, 16, 1, '0', '0', '2024-08-12', '2024-09-12', 'Pagado', '1000091', 2),
(97, 16, 1, '0', '250', '2024-07-30', '2024-08-30', 'Pagado', '1000092', 2),
(98, 16, 1, '0', '300', '2024-07-30', '2024-08-30', 'Pagado', '1000093', 2),
(99, 16, 1, '250', '0', '2024-07-30', '2024-08-30', 'No pagado', '1000094', 2),
(100, 27, 1, '0', '250', '2024-08-13', '2024-08-13', 'Pagado', '1000095', 2),
(101, 27, 3, '0', '260', '2024-08-13', '2024-08-13', 'Pagado', '1000096', 2),
(102, 27, 4, '0', '1', '2024-08-13', '2024-09-13', 'Pagado', '1000097', 2),
(103, 27, 4, '0', '200', '2024-08-13', '2024-08-13', 'Pagado', '1000098', 2),
(104, 27, 4, '0', '500', '2024-08-13', '2024-08-13', 'Pagado', '1000099', 2),
(105, 27, 8, '90.05', '0', '2024-08-14', '2024-08-14', 'No pagado', '1000100', 2),
(106, 27, 3, '320', '0', '2024-08-17', '2024-10-17', 'No pagado', '1000101', 2),
(107, 39, 8, '0', '180.05', '2024-08-21', '2024-09-21', 'Pagado', '1000102', 2),
(108, 27, 1, '500', '0', '2024-08-30', '2024-10-30', 'No pagado', '1000103', 2),
(109, 30, 1, '500', '0', '2024-08-30', '2024-10-30', 'No pagado', '1000104', 2),
(110, 29, 1, '500', '0', '2024-08-30', '2024-10-30', 'No pagado', '1000105', 2),
(111, 37, 1, '500', '0', '2024-08-30', '2024-10-30', 'No pagado', '1000106', 2),
(112, 41, 1, '500', '0', '2024-08-30', '2024-10-30', 'No pagado', '1000107', 2),
(113, 15, 1, '500', '0', '2024-08-30', '2024-10-30', 'No pagado', '1000108', 2),
(114, 31, 1, '500', '0', '2024-08-30', '2024-10-30', 'No pagado', '1000109', 2),
(115, 32, 1, '500', '0', '2024-08-30', '2024-10-30', 'No pagado', '1000110', 2),
(116, 34, 1, '500', '0', '2024-08-30', '2024-10-30', 'No pagado', '1000111', 2),
(117, 14, 1, '500', '0', '2024-08-30', '2024-10-30', 'No pagado', '1000112', 2),
(118, 19, 1, '500', '0', '2024-08-30', '2024-10-30', 'No pagado', '1000113', 2),
(119, 25, 1, '500', '0', '2024-08-30', '2024-10-30', 'No pagado', '1000114', 2),
(120, 26, 1, '500', '0', '2024-08-30', '2024-10-30', 'No pagado', '1000115', 2),
(121, 28, 1, '500', '0', '2024-08-30', '2024-10-30', 'No pagado', '1000116', 2),
(122, 10, 1, '0', '500', '2024-08-30', '2024-10-30', 'Pagado', '1000117', 2),
(123, 11, 1, '0', '500', '2024-08-30', '2024-10-30', 'Pagado', '1000118', 2),
(124, 12, 1, '0', '500', '2024-08-30', '2024-10-30', 'Pagado', '1000119', 2),
(125, 16, 1, '500', '0', '2024-08-30', '2024-10-30', 'No pagado', '1000120', 2),
(126, 17, 1, '500', '0', '2024-08-30', '2024-10-30', 'No pagado', '1000121', 2),
(127, 21, 1, '500', '0', '2024-08-30', '2024-10-30', 'No pagado', '1000122', 2),
(128, 18, 1, '500', '0', '2024-08-30', '2024-10-30', 'No pagado', '1000123', 2),
(129, 22, 1, '500', '0', '2024-08-30', '2024-10-30', 'No pagado', '1000124', 2),
(130, 23, 1, '500', '0', '2024-08-30', '2024-10-30', 'No pagado', '1000125', 2),
(131, 20, 1, '500', '0', '2024-08-30', '2024-10-30', 'No pagado', '1000126', 2),
(132, 13, 1, '50', '450', '2024-08-30', '2024-10-30', 'Pendiente', '1000127', 2),
(133, 33, 1, '500', '0', '2024-08-30', '2024-10-30', 'No pagado', '1000128', 2),
(134, 35, 1, '500', '0', '2024-08-30', '2024-10-30', 'No pagado', '1000129', 2),
(135, 36, 1, '500', '0', '2024-08-30', '2024-10-30', 'No pagado', '1000130', 2),
(136, 24, 1, '500', '0', '2024-08-30', '2024-10-30', 'No pagado', '1000131', 2),
(137, 38, 1, '500', '0', '2024-08-30', '2024-10-30', 'No pagado', '1000132', 2),
(138, 40, 1, '500', '0', '2024-08-30', '2024-10-30', 'No pagado', '1000133', 2),
(139, 39, 1, '500', '0', '2024-08-30', '2024-10-30', 'No pagado', '1000134', 2),
(140, 10, 6, '0', '200', '2024-08-30', '2024-08-30', 'Pagado', '1000135', 2),
(141, 27, 3, '160', '0', '2024-08-31', '2024-08-31', 'No pagado', '1000136', 2),
(142, 30, 3, '160', '0', '2024-08-31', '2024-08-31', 'No pagado', '1000137', 2),
(143, 29, 3, '160', '0', '2024-08-31', '2024-08-31', 'No pagado', '1000138', 2),
(144, 37, 3, '160', '0', '2024-08-31', '2024-08-31', 'No pagado', '1000139', 2),
(145, 41, 3, '160', '0', '2024-08-31', '2024-08-31', 'No pagado', '1000140', 2),
(146, 15, 3, '160', '0', '2024-08-31', '2024-08-31', 'No pagado', '1000141', 2),
(147, 31, 3, '160', '0', '2024-08-31', '2024-08-31', 'No pagado', '1000142', 2),
(148, 32, 3, '160', '0', '2024-08-31', '2024-08-31', 'No pagado', '1000143', 2),
(149, 34, 3, '160', '0', '2024-08-31', '2024-08-31', 'No pagado', '1000144', 2),
(150, 14, 3, '160', '0', '2024-08-31', '2024-08-31', 'No pagado', '1000145', 2),
(151, 19, 3, '160', '0', '2024-08-31', '2024-08-31', 'No pagado', '1000146', 2),
(152, 25, 3, '160', '0', '2024-08-31', '2024-08-31', 'No pagado', '1000147', 2),
(153, 26, 3, '160', '0', '2024-08-31', '2024-08-31', 'No pagado', '1000148', 2),
(154, 28, 3, '160', '0', '2024-08-31', '2024-08-31', 'No pagado', '1000149', 2),
(155, 10, 3, '160', '0', '2024-08-31', '2024-08-31', 'No pagado', '1000150', 2),
(156, 11, 3, '160', '0', '2024-08-31', '2024-08-31', 'No pagado', '1000151', 2),
(157, 12, 3, '160', '0', '2024-08-31', '2024-08-31', 'No pagado', '1000152', 2),
(158, 16, 3, '160', '0', '2024-08-31', '2024-08-31', 'No pagado', '1000153', 2),
(159, 17, 3, '160', '0', '2024-08-31', '2024-08-31', 'No pagado', '1000154', 2),
(160, 21, 3, '160', '0', '2024-08-31', '2024-08-31', 'No pagado', '1000155', 2),
(161, 18, 3, '160', '0', '2024-08-31', '2024-08-31', 'No pagado', '1000156', 2),
(162, 22, 3, '160', '0', '2024-08-31', '2024-08-31', 'No pagado', '1000157', 2),
(163, 23, 3, '160', '0', '2024-08-31', '2024-08-31', 'No pagado', '1000158', 2),
(164, 20, 3, '160', '0', '2024-08-31', '2024-08-31', 'No pagado', '1000159', 2),
(165, 13, 3, '160', '0', '2024-08-31', '2024-08-31', 'No pagado', '1000160', 2),
(166, 33, 3, '160', '0', '2024-08-31', '2024-08-31', 'No pagado', '1000161', 2),
(167, 35, 3, '160', '0', '2024-08-31', '2024-08-31', 'No pagado', '1000162', 2),
(168, 36, 3, '160', '0', '2024-08-31', '2024-08-31', 'No pagado', '1000163', 2),
(169, 24, 3, '160', '0', '2024-08-31', '2024-08-31', 'No pagado', '1000164', 2),
(170, 38, 3, '160', '0', '2024-08-31', '2024-08-31', 'No pagado', '1000165', 2),
(171, 40, 3, '160', '0', '2024-08-31', '2024-08-31', 'No pagado', '1000166', 2),
(172, 39, 3, '160', '0', '2024-08-31', '2024-08-31', 'No pagado', '1000167', 2),
(173, 27, 4, '160', '0', '2024-08-31', '2024-08-31', 'No pagado', '1000168', 2),
(174, 30, 4, '160', '0', '2024-08-31', '2024-08-31', 'No pagado', '1000169', 2),
(175, 29, 4, '160', '0', '2024-08-31', '2024-08-31', 'No pagado', '1000170', 2),
(176, 37, 4, '160', '0', '2024-08-31', '2024-08-31', 'No pagado', '1000171', 2),
(177, 41, 4, '160', '0', '2024-08-31', '2024-08-31', 'No pagado', '1000172', 2),
(178, 15, 4, '160', '0', '2024-08-31', '2024-08-31', 'No pagado', '1000173', 2),
(179, 31, 4, '160', '0', '2024-08-31', '2024-08-31', 'No pagado', '1000174', 2),
(180, 32, 4, '160', '0', '2024-08-31', '2024-08-31', 'No pagado', '1000175', 2),
(181, 34, 4, '160', '0', '2024-08-31', '2024-08-31', 'No pagado', '1000176', 2),
(182, 14, 4, '160', '0', '2024-08-31', '2024-08-31', 'No pagado', '1000177', 2),
(183, 19, 4, '160', '0', '2024-08-31', '2024-08-31', 'No pagado', '1000178', 2),
(184, 25, 4, '160', '0', '2024-08-31', '2024-08-31', 'No pagado', '1000179', 2),
(185, 26, 4, '160', '0', '2024-08-31', '2024-08-31', 'No pagado', '1000180', 2),
(186, 28, 4, '160', '0', '2024-08-31', '2024-08-31', 'No pagado', '1000181', 2),
(187, 10, 4, '160', '0', '2024-08-31', '2024-08-31', 'No pagado', '1000182', 2),
(188, 11, 4, '160', '0', '2024-08-31', '2024-08-31', 'No pagado', '1000183', 2),
(189, 12, 4, '160', '0', '2024-08-31', '2024-08-31', 'No pagado', '1000184', 2),
(190, 16, 4, '160', '0', '2024-08-31', '2024-08-31', 'No pagado', '1000185', 2),
(191, 17, 4, '160', '0', '2024-08-31', '2024-08-31', 'No pagado', '1000186', 2),
(192, 21, 4, '160', '0', '2024-08-31', '2024-08-31', 'No pagado', '1000187', 2),
(193, 18, 4, '160', '0', '2024-08-31', '2024-08-31', 'No pagado', '1000188', 2),
(194, 22, 4, '160', '0', '2024-08-31', '2024-08-31', 'No pagado', '1000189', 2),
(195, 23, 4, '160', '0', '2024-08-31', '2024-08-31', 'No pagado', '1000190', 2),
(196, 20, 4, '160', '0', '2024-08-31', '2024-08-31', 'No pagado', '1000191', 2),
(197, 13, 4, '160', '0', '2024-08-31', '2024-08-31', 'No pagado', '1000192', 2),
(198, 33, 4, '160', '0', '2024-08-31', '2024-08-31', 'No pagado', '1000193', 2),
(199, 35, 4, '160', '0', '2024-08-31', '2024-08-31', 'No pagado', '1000194', 2),
(200, 36, 4, '160', '0', '2024-08-31', '2024-08-31', 'No pagado', '1000195', 2),
(201, 24, 4, '160', '0', '2024-08-31', '2024-08-31', 'No pagado', '1000196', 2),
(202, 38, 4, '160', '0', '2024-08-31', '2024-08-31', 'No pagado', '1000197', 2),
(203, 40, 4, '160', '0', '2024-08-31', '2024-08-31', 'No pagado', '1000198', 2),
(204, 39, 4, '160', '0', '2024-08-31', '2024-08-31', 'No pagado', '1000199', 2);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `cuenta_vista`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `cuenta_vista` (
`abono` varchar(50)
,`codigo` varchar(50)
,`concepto` varchar(50)
,`concepto_2` varchar(50)
,`costo` varchar(50)
,`desde` date
,`hasta` date
,`id_cuenta` int
,`id_unir` int
,`nombre` varchar(50)
,`pagado` varchar(50)
,`villa` varchar(101)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `donar_recibir_villa`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `donar_recibir_villa` (
`condicion` varchar(50)
,`cont_eeh` varchar(50)
,`habitaciones` varchar(50)
,`id_propietario` int
,`id_villa` int
,`modelo` varchar(50)
,`villa` varchar(101)
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
(1, 'Disponible'),
(2, 'Habitado'),
(3, 'No disponible');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `factura_completa_reimprimir`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `factura_completa_reimprimir` (
`abono` varchar(50)
,`codigo` varchar(50)
,`codigo_pago` varchar(50)
,`concepto` varchar(50)
,`concepto_pago` varchar(50)
,`costo` varchar(50)
,`desde` date
,`fecha_pago` date
,`hasta` date
,`id_unir` int
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
(3, 'C', 1),
(4, 'D', 1),
(5, 'Z', 2),
(6, 'K', 2),
(7, 'E', 2),
(8, 'F', 2),
(9, 'G', 2),
(10, 'G', 2),
(11, 'G', 2),
(12, 'G', 2),
(13, 'G', 2),
(14, 'G', 2),
(15, 'K', 2),
(16, 'Z', 1);

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
(2, 'VILLA ARRECIFE', 1),
(3, 'VILLA ESTRELLA', 1);

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
(1, 'LEMPIRA', 'L.', 24, 1),
(2, 'EURO', 'E', 28, 1);

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
  `id_concepto` int DEFAULT NULL,
  `tipo_pago` varchar(50) DEFAULT NULL,
  `forma_pago` varchar(50) DEFAULT NULL,
  `n_referencia` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `multi_pago`
--

INSERT INTO `multi_pago` (`id_multi`, `codigo_pago`, `id_unir`, `id_cuenta`, `fecha_pago`, `total_pago`, `cantidad_recibida`, `cantidad_devuelta`, `id_estado`, `id_pago`, `id_concepto`, `tipo_pago`, `forma_pago`, `n_referencia`) VALUES
(4, '2000000', 19, 1, '2024-07-24', 160, 200, 40, 1, 1, 2, NULL, NULL, NULL),
(5, '2000001', 19, 2, '2024-07-25', 160, 200, 40, 1, 1, 2, NULL, NULL, NULL),
(7, '2000002', 27, 31, '2024-08-02', 320, 500, 180, 1, 1, 2, NULL, NULL, NULL),
(8, '2000003', 27, 34, '2024-08-02', 160, 200, 40, 1, 1, 2, NULL, NULL, NULL),
(9, '2000004', 30, 32, '2024-08-02', 160, 200, 40, 1, 1, 2, NULL, NULL, NULL),
(10, '2000005', 27, 33, '2024-08-02', 1440, 2000, 560, 1, 1, 2, NULL, NULL, NULL),
(11, '2000005', 27, 35, '2024-08-02', 1440, 2000, 560, 1, 1, 2, NULL, NULL, NULL),
(12, '2000005', 27, 36, '2024-08-02', 1440, 2000, 560, 1, 1, 2, NULL, NULL, NULL),
(13, '2000005', 27, 37, '2024-08-02', 1440, 2000, 560, 1, 1, 2, NULL, NULL, NULL),
(14, '2000005', 27, 38, '2024-08-02', 1440, 2000, 560, 1, 1, 2, NULL, NULL, NULL),
(15, '2000006', 19, 43, '2024-08-03', 480, 500, 20, 1, 1, 2, NULL, NULL, NULL),
(16, '2000007', 25, 44, '2024-08-03', 480, 500, 20, 1, 1, 2, NULL, NULL, NULL),
(17, '2000008', 25, 40, '2024-08-03', 320, 500, 180, 1, 1, 2, NULL, NULL, NULL),
(18, '2000009', 19, 23, '2024-08-03', 160, 200, 40, 1, 1, 2, NULL, NULL, NULL),
(19, '2000010', 19, 20, '2024-08-03', 160, 200, 40, 1, 1, 2, NULL, NULL, NULL),
(20, '2000010', 19, 7, '2024-08-03', 160, 200, 40, 1, 1, 2, NULL, NULL, NULL),
(21, '2000010', 19, 10, '2024-08-03', 160, 200, 40, 1, 1, 2, NULL, NULL, NULL),
(22, '2000010', 19, 14, '2024-08-03', 160, 200, 40, 1, 1, 2, NULL, NULL, NULL),
(23, '2000010', 19, 17, '2024-08-03', 160, 200, 40, 1, 1, 2, NULL, NULL, NULL),
(24, '2000010', 19, 39, '2024-08-03', 160, 200, 40, 1, 1, 2, NULL, NULL, NULL),
(25, '2000011', 16, 27, '2024-08-05', 160, 200, 40, 1, 1, 2, NULL, NULL, NULL),
(26, '2000012', 16, 28, '2024-08-05', 160, 200, 40, 1, 1, 2, NULL, NULL, NULL),
(27, '2000013', 27, 47, '2024-08-06', 160, 200, 40, 1, 1, 2, NULL, NULL, NULL),
(28, '2000014', 27, 48, '2024-08-06', 320, 500, 180, 1, 1, 2, NULL, NULL, NULL),
(29, '2000015', 27, 61, '2024-08-06', 640, 800, 160, 1, 1, 2, NULL, NULL, NULL),
(30, '2000016', 27, 31, '2024-08-06', 320, 500, 180, 1, 1, 2, NULL, NULL, NULL),
(31, '2000017', 27, 33, '2024-08-07', 160, 200, 40, 1, 1, 2, NULL, NULL, NULL),
(32, '2000018', 27, 34, '2024-08-07', 160, 200, 40, 1, 1, 2, NULL, NULL, NULL),
(33, '2000019', 27, 34, '2024-08-07', 160, 200, 40, 1, 1, 2, NULL, NULL, NULL),
(34, '2000020', 27, 35, '2024-08-07', 320, 500, 180, 1, 1, 2, NULL, NULL, NULL),
(35, '2000020', 27, 36, '2024-08-07', 320, 220, -100, 1, 1, 2, NULL, NULL, NULL),
(36, '2000021', 27, 37, '2024-08-07', 320, 400, 80, 1, 1, 2, NULL, NULL, NULL),
(37, '2000021', 27, 38, '2024-08-07', 320, 220, -100, 1, 1, 2, NULL, NULL, NULL),
(38, '2000021', 27, 47, '2024-08-07', 160, 60, -100, 1, 1, 2, NULL, NULL, NULL),
(39, '2000022', 27, 48, '2024-08-07', 320, 120, -200, 1, 1, 2, NULL, NULL, NULL),
(40, '2000023', 27, 61, '2024-08-07', 640, 500, -140, 1, 1, 2, NULL, NULL, NULL),
(41, '2000024', 30, 32, '2024-08-08', 160, 200, 40, 1, 1, 2, NULL, NULL, NULL),
(42, '2000025', 27, 61, '2024-08-08', 140, 140, 0, 1, 1, 2, NULL, NULL, NULL),
(43, '2000025', 27, 61, '2024-08-08', 0, 0, 0, 1, 1, 2, NULL, NULL, NULL),
(44, '2000026', 27, 61, '2024-08-08', 0, 0, 0, 1, 1, 2, NULL, NULL, NULL),
(45, '2000027', 27, 61, '2024-08-08', 0, 0, 0, 1, 1, 2, NULL, NULL, NULL),
(46, '2000028', 27, 74, '2024-08-08', 320, 320, 0, 1, 1, 2, NULL, NULL, NULL),
(47, '2000028', 27, 61, '2024-08-08', 0, 0, 0, 1, 1, 2, NULL, NULL, NULL),
(48, '2000029', 27, 61, '2024-08-08', 100, 100, 0, 1, 1, 2, NULL, NULL, NULL),
(49, '2000029', 30, 49, '2024-08-08', 320, 100, -220, 1, 1, 2, NULL, NULL, NULL),
(50, '2000029', 30, 49, '2024-08-08', 220, 300, 80, 1, 1, 2, NULL, NULL, NULL),
(51, '2000030', 30, 62, '2024-08-08', 640, 500, -140, 1, 1, 2, NULL, NULL, NULL),
(52, '2000030', 30, 62, '2024-08-08', 140, 200, 60, 1, 1, 2, NULL, NULL, NULL),
(53, '2000031', 29, 76, '2024-08-09', 320, 400, 80, 1, 1, 2, NULL, NULL, NULL),
(54, '2000031', 29, 50, '2024-08-09', 320, 200, -120, 1, 1, 2, NULL, NULL, NULL),
(55, '2000031', 29, 50, '2024-08-09', 120, 120, 0, 1, 1, 2, NULL, NULL, NULL),
(56, '2000031', 29, 63, '2024-08-09', 640, 640, 0, 1, 1, 2, NULL, NULL, NULL),
(57, '2000032', 16, 77, '2024-08-09', 200, 250, 50, 1, 1, 2, NULL, NULL, NULL),
(58, '2000033', 16, 26, '2024-08-09', 160, 100, -60, 1, 1, 2, NULL, NULL, NULL),
(59, '2000033', 16, 26, '2024-08-09', 60, 100, 40, 1, 1, 2, NULL, NULL, NULL),
(60, '2000034', 16, 27, '2024-08-09', 160, 100, -60, 1, 1, 2, NULL, NULL, NULL),
(61, '2000035', 16, 27, '2024-08-09', 60, 30, -30, 1, 1, 2, NULL, NULL, NULL),
(62, '2000036', 16, 78, '2024-08-11', 160, 80, -80, 1, 1, 2, NULL, NULL, NULL),
(63, '2000037', 16, 27, '2024-08-11', 30, 0, 0, 1, 1, 2, NULL, NULL, NULL),
(64, '2000037', 16, 78, '2024-08-11', 80, 0, 0, 1, 1, 2, NULL, NULL, NULL),
(65, '2000037', 16, 79, '2024-08-11', 160, 0, 0, 1, 1, 2, NULL, NULL, NULL),
(66, '2000038', 27, 81, '2024-08-12', 320, 200, -120, 1, 1, 2, NULL, NULL, NULL),
(67, '2000038', 27, 81, '2024-08-12', 120, 0, 0, 1, 1, 2, NULL, NULL, NULL),
(68, '2000038', 16, 80, '2024-08-12', 250, 500, 250, 1, 1, 2, NULL, NULL, NULL),
(69, '2000038', 16, 96, '2024-08-12', 0, 800, 800, 1, 1, 2, NULL, NULL, NULL),
(70, '2000039', 16, 28, '2024-08-13', 160, 80, -80, 1, 1, 2, NULL, NULL, NULL),
(71, '2000039', 16, 28, '2024-08-13', 80, 30, -50, 1, 1, 2, NULL, NULL, NULL),
(72, '2000039', 16, 28, '2024-08-13', 50, 100, 50, 1, 1, 2, NULL, NULL, NULL),
(73, '2000040', 16, 98, '2024-08-13', 250, 100, -150, 1, 1, 2, NULL, NULL, NULL),
(74, '2000040', 16, 98, '2024-08-13', 150, 100, -50, 1, 1, 2, NULL, NULL, NULL),
(75, '2000040', 16, 98, '2024-08-13', 50, 100, 50, 1, 1, 2, NULL, NULL, NULL),
(76, '2000040', 16, 97, '2024-08-13', 250, 100, -150, 1, 1, 2, NULL, NULL, NULL),
(77, '2000040', 16, 97, '2024-08-13', 150, 200, 50, 1, 1, 2, NULL, NULL, NULL),
(78, '2000041', 27, 101, '2024-08-13', 0, 0, 0, 1, 1, 2, NULL, NULL, NULL),
(79, '2000042', 27, 100, '2024-08-19', 250, 500, 250, 1, 1, 2, NULL, NULL, NULL),
(80, '2000042', 27, 102, '2024-08-19', 1, 0.5, -0.5, 1, 1, 2, NULL, NULL, NULL),
(81, '2000042', 27, 102, '2024-08-19', 0.5, 0.5, 0, 1, 1, 2, NULL, NULL, NULL),
(82, '2000043', 27, 103, '2024-08-19', 900, 200, -700, 1, 1, 2, NULL, NULL, NULL),
(83, '2000043', 27, 103, '2024-08-19', 700, 0, 0, 1, 1, 2, NULL, NULL, NULL),
(84, '2000044', 27, 104, '2024-08-21', 900, 500, -400, 1, 1, 2, NULL, NULL, NULL),
(85, '2000044', 27, 104, '2024-08-21', 400, 0, 0, 1, 1, 2, NULL, NULL, NULL),
(86, '2000045', 39, 107, '2024-08-21', 190.05, 180.05, -10, 1, 1, 9, NULL, NULL, NULL),
(87, '2000045', 39, 107, '2024-08-21', 10, 0, 0, 1, 1, 9, NULL, NULL, NULL),
(88, '2000046', 30, 82, '2024-08-25', 320, 320, 0, 1, 1, 2, NULL, NULL, NULL),
(89, '2000047', 31, 86, '2024-08-27', 320, 500, 180, 1, 1, 2, NULL, NULL, NULL),
(90, '2000048', 10, 24, '2024-08-28', 160, 160, 0, 1, 1, 5, NULL, NULL, NULL),
(91, '2000049', 10, 25, '2024-08-29', 160, 200, 40, 1, 1, 2, NULL, NULL, NULL),
(92, '2000050', 10, 122, '2024-08-30', 500, 500, 0, 1, 1, 2, NULL, NULL, NULL),
(93, '2000051', 11, 123, '2024-08-30', 500, 500, 0, 1, 1, 2, NULL, NULL, NULL),
(94, '2000051', 12, 124, '2024-08-30', 500, 150, -350, 1, 1, 2, NULL, NULL, NULL),
(95, '2000052', 12, 124, '2024-08-30', 350, 50, -300, 1, 1, 2, NULL, NULL, NULL),
(96, '2000052', 12, 124, '2024-08-30', 300, 20, -280, 1, 1, 2, NULL, NULL, NULL),
(97, '2000053', 12, 124, '2024-08-30', 280, 10, -270, 1, 1, 5, NULL, NULL, NULL),
(98, '2000053', 12, 124, '2024-08-30', 270, 10, -260, 1, 1, 5, NULL, NULL, NULL),
(99, '2000053', 12, 124, '2024-08-30', 260, 10, -250, 1, 1, 2, NULL, NULL, NULL),
(100, '2000054', 12, 124, '2024-08-30', 250, 10, -240, 1, 1, 5, NULL, NULL, NULL),
(101, '2000055', 12, 124, '2024-08-30', 240, 10, -230, 1, 1, 2, NULL, NULL, NULL),
(102, '2000055', 12, 124, '2024-08-30', 240, 10, -230, 1, 1, 2, NULL, NULL, NULL),
(103, '2000056', 12, 124, '2024-08-30', 220, 10, -210, 1, 1, 2, NULL, NULL, NULL),
(104, '2000056', 12, 124, '2024-08-30', 210, 210, 0, 1, 1, 2, NULL, NULL, NULL),
(105, '2000057', 14, 6, '2024-08-30', 0, 0, 0, 1, 1, 5, NULL, NULL, NULL),
(106, '2000058', 13, 90, '2024-08-30', 800, 100, -700, 1, 1, 2, NULL, NULL, NULL),
(107, '2000059', 10, 140, '2024-08-30', 200, 100, -100, 1, 1, 2, NULL, NULL, NULL),
(108, '2000060', 13, 90, '2024-08-30', 700, 100, -600, 1, 1, 2, NULL, NULL, NULL),
(110, '2000061', 10, 140, '2024-08-30', 100, 50, -50, 1, 1, 2, NULL, NULL, NULL),
(111, '2000061', 13, 90, '2024-08-30', 500, 20, -480, 1, 1, 2, NULL, NULL, NULL),
(112, '2000062', 10, 140, '2024-08-30', 50, 10, -40, 1, 1, 2, NULL, NULL, NULL),
(113, '2000063', 13, 90, '2024-08-30', 480, 80, -400, 1, 1, 2, NULL, NULL, NULL),
(114, '2000064', 10, 140, '2024-08-30', 40, 10, -30, 1, 1, 2, NULL, NULL, NULL),
(115, '2000065', 13, 90, '2024-08-30', 400, 100, -300, 1, 1, 2, NULL, NULL, NULL),
(116, '2000066', 13, 90, '2024-08-30', 300, 100, -200, 1, 1, 2, NULL, NULL, NULL),
(117, '2000067', 10, 140, '2024-08-30', 30, 10, -20, 1, 1, 2, NULL, NULL, NULL),
(118, '2000068', 13, 90, '2024-08-30', 200, 10, -190, 1, 1, 2, NULL, NULL, NULL),
(119, '2000069', 13, 90, '2024-08-30', 190, 50, -140, 1, 1, 2, NULL, NULL, NULL),
(120, '2000070', 13, 90, '2024-08-30', 140, 10, -130, 1, 1, 2, NULL, NULL, NULL),
(121, '2000071', 14, 9, '2024-08-30', 0, 0, 0, 1, 1, 2, NULL, NULL, NULL),
(122, '2000072', 13, 90, '2024-08-30', 130, 130, 0, 1, 1, 2, NULL, NULL, NULL),
(123, '2000073', 13, 92, '2024-08-30', 1500, 150, -1350, 1, 1, 2, NULL, NULL, NULL),
(124, '2000074', 13, 93, '2024-08-30', 1500, 122, -1378, 1, 1, 2, NULL, NULL, NULL),
(125, '2000075', 13, 94, '2024-08-30', 1500, 500, -1000, 1, 1, 2, NULL, NULL, NULL),
(126, '2000076', 13, 92, '2024-08-30', 1350, 50, -1300, 1, 1, 2, NULL, NULL, NULL),
(127, '2000077', 13, 92, '2024-08-30', 1300, 200, -1100, 1, 1, 2, NULL, NULL, NULL),
(128, '2000078', 13, 95, '2024-08-30', 1500, 1500, 0, 1, 1, 5, NULL, NULL, NULL),
(129, '2000079', 10, 140, '2024-08-30', 20, 12, -8, 1, 1, 2, NULL, NULL, NULL),
(130, '2000080', 10, 140, '2024-08-30', 8, 12, 4, 1, 1, 2, NULL, NULL, NULL),
(131, '2000081', 14, 56, '2024-08-30', 320, 12, -308, 1, 1, 2, NULL, NULL, NULL),
(132, '2000082', 14, 56, '2024-08-30', 308, 30, -278, 1, 1, 2, NULL, NULL, NULL),
(134, '2000083', 13, 92, '2024-08-30', 1100, 100, -1000, 1, 1, 2, NULL, NULL, NULL),
(135, '2000084', 14, 13, '2024-08-30', 160, 60, -100, 1, 1, 2, NULL, NULL, NULL),
(136, '2000085', 13, 92, '2024-08-30', 1000, 500, -500, 1, 1, 2, NULL, NULL, NULL),
(137, '2000086', 13, 92, '2024-08-30', 500, 200, -300, 1, 1, 2, NULL, NULL, NULL),
(138, '2000087', 13, 93, '2024-08-30', 1378, 300, -1078, 1, 1, 2, NULL, NULL, NULL),
(139, '2000088', 13, 132, '2024-08-30', 500, 100, -400, 1, 1, 2, NULL, NULL, NULL),
(140, '2000089', 13, 92, '2024-08-30', 300, 300, 0, 1, 1, 2, NULL, NULL, NULL),
(141, '2000090', 13, 93, '2024-08-30', 1078, 78, -1000, 1, 1, 2, NULL, NULL, NULL),
(142, '2000091', 13, 132, '2024-08-30', 400, 100, -300, 1, 1, 2, NULL, NULL, NULL),
(143, '2000092', 13, 132, '2024-08-30', 300, 30, -270, 1, 1, 5, NULL, NULL, NULL),
(144, '2000093', 13, 132, '2024-08-30', 270, 30, -240, 1, 1, 2, NULL, NULL, NULL),
(145, '2000094', 13, 93, '2024-08-30', 1000, 300, -700, 1, 1, 2, NULL, NULL, NULL),
(146, '2000095', 13, 132, '2024-08-30', 240, 40, -200, 1, 1, 2, NULL, NULL, NULL),
(147, '2000096', 13, 132, '2024-08-30', 200, 40, -160, 1, 1, 2, NULL, NULL, NULL),
(148, '2000097', 13, 93, '2024-08-30', 700, 100, -600, 1, 1, 5, NULL, NULL, NULL),
(149, '2000098', 13, 93, '2024-08-30', 600, 100, -500, 1, 1, 2, NULL, NULL, NULL),
(150, '2000098', 13, 132, '2024-08-30', 160, 100, -60, 1, 1, 2, NULL, NULL, NULL),
(151, '2000099', 13, 132, '2024-08-30', 60, 10, -50, 1, 1, 2, NULL, NULL, NULL),
(152, '2000100', 13, 93, '2024-08-30', 500, 100, -400, 1, 1, 2, 'Efectivo', 'Efectivo', 'Ninguna'),
(153, '2000101', 13, 93, '2024-08-30', 400, 100, -300, 1, 1, 2, 'Efectivo', 'Físico', 'Ninguna'),
(154, '2000102', 13, 93, '2024-08-30', 300, 100, -200, 1, 1, 2, 'Efectivo', 'Físico', 'Ninguna');

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
`dni` varchar(50)
,`id_estado` int
,`id_unir` int
,`nombre` varchar(50)
,`telefono` varchar(50)
,`villa` varchar(101)
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
(44, 'PRUEBA', '2', 'prueba@gmail.com', '2024-08-05', 1, '\r\n            ', '94856463'),
(45, '', '', '', '2024-08-15', 1, 'Registro por intercambio', ''),
(46, '', '', '', '2024-08-15', 1, 'Registro por intercambio', ''),
(47, '', '', '', '2024-08-15', 1, 'Registro por intercambio', ''),
(48, 'PABLO ESCOBAR', '0101199903209', 'pablo@gmail.com', '2024-08-21', 1, '', '94856463'),
(49, 'TKM', '11111', 'j@gmail.com', '2024-08-25', 1, '', '91811076'),
(50, 'JJ', '1151555', 'kk@gmail.com', '2024-08-25', 1, '', '858585555'),
(51, '', '', '', '2024-09-02', 1, 'Registro por intercambio', ''),
(52, '', '', '', '2024-09-02', 1, 'Registro por intercambio', '');

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
(19, 52, 51),
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
(34, 2, 40),
(35, 1, 74),
(36, 2, 75),
(37, 43, 36),
(38, 44, 77),
(39, 48, 84),
(40, 49, 78),
(41, 50, 37);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `propietario_principal`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `propietario_principal` (
`cont_eeh` varchar(50)
,`correo` varchar(50)
,`dni` varchar(50)
,`id_propietario` int
,`id_unir` int
,`id_villa` int
,`nombre` varchar(50)
,`telefono` varchar(50)
,`villa` varchar(101)
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
`codigo` varchar(101)
,`condicion` varchar(50)
,`estado` varchar(50)
,`id_villa` int
,`modelo` varchar(50)
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
(11, 'NESTOR', 'OLIVA', '0101199903209', '94856463', 'anthony.oliva80@unitec.edu', 2, '123456789', 1, 'NESTOR'),
(12, 'KCMDKCMDK', 'DMKMDKCMKD', 'DKMKDMVKFMK', 'KDMVKMKVFMKV', 'vmkvmkkf@v', 1, 'cmdkmckdmckd', 1, 'MKCDMKCMDK');

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
`abono_total` double
,`concepto` varchar(50)
,`costo_total` double
,`nombre` varchar(50)
,`saldo_total` double
,`villa` varchar(101)
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
(37, 1, '5', '123456789', '5', '250', 1, 1, 2, 'Roma, Palma Real', ''),
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
(73, 4, '1', '123456789', '2', '150', 2, 1, 2, '', ''),
(74, 4, '2', '123456789', '2', '150', 2, 1, 2, '', ''),
(75, 4, '3', '123456789', '2', '150', 2, 1, 2, '', ''),
(76, 4, '4', '123456789', '4', '500', 1, 1, 2, '', ''),
(77, 4, '12', '123456', '7', '150', 2, 1, 2, '', ''),
(78, 4, '15', '777777777', '2', '600', 2, 1, 2, '', ''),
(79, 1, '15', '5555555555555', '2', '250', 1, 1, 1, 'Roma, Palma Real', 'Tiene una fuga de gas'),
(80, 1, '50', '5555555555555', '2', '250', 1, 1, 1, 'Roma, Juteapa', 'Mucha agua'),
(81, 1, '88', '', '', '', 1, 1, 1, '', ''),
(82, 1, '89', '', '', '', 1, 1, 1, '', ''),
(83, 1, '74', '', '', '', 1, 1, 1, '', ''),
(84, 5, '1', '123456789', '3', '300.50', 3, 1, 2, '', '');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `villa_completo`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `villa_completo` (
`condicion` varchar(50)
,`cont_eeh` varchar(50)
,`estado` varchar(50)
,`habitaciones` varchar(50)
,`id_estado` int
,`id_villa` int
,`lote` varchar(50)
,`modelo` varchar(50)
,`villas` varchar(101)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_usuario`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_usuario` (
`acceso` varchar(50)
,`ape` varchar(50)
,`clave` varchar(50)
,`correo` varchar(50)
,`dni` varchar(50)
,`eliminar_reportes` varchar(2)
,`estado` varchar(50)
,`id_usuario` int
,`imprimir_reportes` varchar(2)
,`modificar_reportes` varchar(2)
,`nom` varchar(50)
,`nombre` varchar(101)
,`telefono` varchar(50)
,`usuario` varchar(50)
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

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `cuenta_vista`  AS SELECT `cuentas`.`id_cuenta` AS `id_cuenta`, `cuentas`.`codigo` AS `codigo`, `propietarios_villas`.`id_unir` AS `id_unir`, `cuentas`.`costo` AS `costo`, `cuentas`.`abono` AS `abono`, `cuentas`.`desde` AS `desde`, `cuentas`.`hasta` AS `hasta`, `cuentas`.`pagado` AS `pagado`, `concepto`.`concepto` AS `concepto`, `concepto_1`.`concepto` AS `concepto_2`, `propietarios`.`nombre` AS `nombre`, concat(`grupo_villa`.`grupo`,'-',`villas`.`numero`) AS `villa` FROM ((((((`cuentas` join `propietarios_villas` on((`cuentas`.`id_unir` = `propietarios_villas`.`id_unir`))) join `concepto` on((`cuentas`.`id_concepto` = `concepto`.`id_concepto`))) join `concepto` `concepto_1` on((`cuentas`.`id_concepto_2` = `concepto_1`.`id_concepto`))) join `villas` on((`propietarios_villas`.`id_villa` = `villas`.`id_villa`))) join `propietarios` on((`propietarios_villas`.`id_propietario` = `propietarios`.`id_propietario`))) join `grupo_villa` on((`villas`.`id_grupo` = `grupo_villa`.`id_grupo`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `donar_recibir_villa`
--
DROP TABLE IF EXISTS `donar_recibir_villa`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `donar_recibir_villa` (`id_propietario`, `id_villa`, `villa`, `cont_eeh`, `habitaciones`, `condicion`, `modelo`) AS   select `propietarios_villas`.`id_propietario` AS `id_propietario`,`villas`.`id_villa` AS `id_villa`,concat(`grupo_villa`.`grupo`,'-',`villas`.`numero`) AS `villa`,`villas`.`cont_eeh` AS `cont_eeh`,`villas`.`habitaciones` AS `habitaciones`,`condicion_villas`.`condicion` AS `condicion`,`modelo_villa`.`modelo` AS `modelo` from ((((`propietarios_villas` join `villas` on((`propietarios_villas`.`id_villa` = `villas`.`id_villa`))) join `grupo_villa` on((`villas`.`id_grupo` = `grupo_villa`.`id_grupo`))) join `condicion_villas` on((`villas`.`id_condicion` = `condicion_villas`.`id_condicion`))) join `modelo_villa` on((`villas`.`id_modelo` = `modelo_villa`.`id_modelo`)))  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `factura_completa_reimprimir`
--
DROP TABLE IF EXISTS `factura_completa_reimprimir`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `factura_completa_reimprimir`  AS SELECT `multi_pago`.`codigo_pago` AS `codigo_pago`, `concepto`.`concepto` AS `concepto`, `multi_pago`.`fecha_pago` AS `fecha_pago`, `multi_pago`.`id_unir` AS `id_unir`, `cuentas`.`desde` AS `desde`, `cuentas`.`hasta` AS `hasta`, `cuentas`.`codigo` AS `codigo`, `concepto_1`.`concepto` AS `concepto_pago`, `cuentas`.`costo` AS `costo`, `cuentas`.`abono` AS `abono` FROM (((`concepto` join `cuentas` on((`concepto`.`id_concepto` = `cuentas`.`id_concepto`))) join `multi_pago` on((`cuentas`.`id_cuenta` = `multi_pago`.`id_cuenta`))) join `concepto` `concepto_1` on((`multi_pago`.`id_concepto` = `concepto_1`.`id_concepto`))) ;

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
-- Estructura para la vista `ultimas_villas`
--
DROP TABLE IF EXISTS `ultimas_villas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ultimas_villas`  AS SELECT `villas`.`id_villa` AS `id_villa`, concat(`grupo_villa`.`grupo`,'-',`villas`.`numero`) AS `codigo`, `modelo_villa`.`modelo` AS `modelo`, `condicion_villas`.`condicion` AS `condicion`, `estado_villa`.`estado` AS `estado` FROM ((((`villas` join `estado_villa` on((`villas`.`id_estado` = `estado_villa`.`id_estado`))) join `grupo_villa` on((`villas`.`id_grupo` = `grupo_villa`.`id_grupo`))) join `condicion_villas` on((`villas`.`id_condicion` = `condicion_villas`.`id_condicion`))) join `modelo_villa` on((`villas`.`id_modelo` = `modelo_villa`.`id_modelo`))) ;

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
-- Estructura para la vista `villa_completo`
--
DROP TABLE IF EXISTS `villa_completo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `villa_completo`  AS SELECT `villas`.`id_villa` AS `id_villa`, concat(`grupo_villa`.`grupo`,'-',`villas`.`numero`) AS `villas`, `villas`.`cont_eeh` AS `cont_eeh`, `villas`.`habitaciones` AS `habitaciones`, `villas`.`lote` AS `lote`, `modelo_villa`.`modelo` AS `modelo`, `condicion_villas`.`condicion` AS `condicion`, `villas`.`id_estado` AS `id_estado`, `estado_villa`.`estado` AS `estado` FROM ((((`villas` join `grupo_villa` on((`villas`.`id_grupo` = `grupo_villa`.`id_grupo`))) join `modelo_villa` on((`villas`.`id_modelo` = `modelo_villa`.`id_modelo`))) join `condicion_villas` on((`villas`.`id_condicion` = `condicion_villas`.`id_condicion`))) join `estado_villa` on((`villas`.`id_estado` = `estado_villa`.`id_estado`))) ;

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
  MODIFY `id_concepto` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

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
  MODIFY `id_cuenta` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=205;

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
  MODIFY `id_estado` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `forma_de_pago`
--
ALTER TABLE `forma_de_pago`
  MODIFY `id_pago` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `forma_pago`
--
ALTER TABLE `forma_pago`
  MODIFY `id_forma` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT de la tabla `grupo_villa`
--
ALTER TABLE `grupo_villa`
  MODIFY `id_grupo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

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
-- AUTO_INCREMENT de la tabla `multi_pago`
--
ALTER TABLE `multi_pago`
  MODIFY `id_multi` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=155;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `id_acceso` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `propietarios`
--
ALTER TABLE `propietarios`
  MODIFY `id_propietario` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT de la tabla `propietarios_villas`
--
ALTER TABLE `propietarios_villas`
  MODIFY `id_unir` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `villas`
--
ALTER TABLE `villas`
  MODIFY `id_villa` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

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
  ADD CONSTRAINT `cuentas$FK_cuentas_propietarios_villas` FOREIGN KEY (`id_unir`) REFERENCES `propietarios_villas` (`id_unir`),
  ADD CONSTRAINT `FK_concepto_2` FOREIGN KEY (`id_concepto_2`) REFERENCES `concepto` (`id_concepto`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `forma_de_pago`
--
ALTER TABLE `forma_de_pago`
  ADD CONSTRAINT `FK_forma_de_pago_estado_pago` FOREIGN KEY (`id_estado`) REFERENCES `estado_pago` (`id_estado`);

--
-- Filtros para la tabla `forma_pago`
--
ALTER TABLE `forma_pago`
  ADD CONSTRAINT `FK_id_multi` FOREIGN KEY (`id_multi`) REFERENCES `multi_pago` (`id_multi`) ON DELETE RESTRICT ON UPDATE RESTRICT;

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
