-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 14-05-2024 a las 03:35:37
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
-- Base de datos: `pg_gestion_pro`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `abono`
--

CREATE TABLE `abono` (
  `id_abono` int NOT NULL,
  `abono` double DEFAULT NULL,
  `id_c_pro` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carac_villa`
--

CREATE TABLE `carac_villa` (
  `id_caracteristica` int NOT NULL,
  `caracteristica` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_villa` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `concepto`
--

CREATE TABLE `concepto` (
  `id_concepto` int NOT NULL,
  `concepto` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_tipo` int DEFAULT NULL,
  `valor` double DEFAULT NULL,
  `referencia` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_estado` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `condicion_villa`
--

CREATE TABLE `condicion_villa` (
  `id_condicion` int NOT NULL,
  `condicion` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `condicion_villa`
--

INSERT INTO `condicion_villa` (`id_condicion`, `condicion`) VALUES
(1, 'Habitado'),
(2, 'Disponible'),
(3, 'Suspendido');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `con_vi`
--

CREATE TABLE `con_vi` (
  `id_con_vi` int NOT NULL,
  `id_villa` int DEFAULT NULL,
  `id_condicion` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuenta`
--

CREATE TABLE `cuenta` (
  `id_cuenta` int NOT NULL,
  `cuenta` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_c_pro` int DEFAULT NULL,
  `id_concepto` int DEFAULT NULL,
  `fe_desde` date DEFAULT NULL,
  `fe_hasta` date DEFAULT NULL,
  `monto` double DEFAULT NULL,
  `id_estado_cuenta` int DEFAULT NULL,
  `abono` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `d_propietario`
--

CREATE TABLE `d_propietario` (
  `id_pro` int NOT NULL,
  `nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `dni` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `correo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  `observacion` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `id_estado` int NOT NULL,
  `estado` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`id_estado`, `estado`) VALUES
(1, 'Activo'),
(2, 'Suspendido');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_cuenta`
--

CREATE TABLE `estado_cuenta` (
  `id_estado_cuenta` int NOT NULL,
  `estado` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_villa`
--

CREATE TABLE `estado_villa` (
  `id_estado_villa` int NOT NULL,
  `estado_villa` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `estado_villa`
--

INSERT INTO `estado_villa` (`id_estado_villa`, `estado_villa`) VALUES
(1, 'Activo'),
(2, 'Mantenimiento'),
(3, 'Suspendida');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `letra_villa`
--

CREATE TABLE `letra_villa` (
  `id_letra` int NOT NULL,
  `letra` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `letra_villa`
--

INSERT INTO `letra_villa` (`id_letra`, `letra`) VALUES
(1, 'A'),
(2, 'B'),
(3, 'C');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modelo_villa`
--

CREATE TABLE `modelo_villa` (
  `id_modelo` int NOT NULL,
  `modelo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `modelo_villa`
--

INSERT INTO `modelo_villa` (`id_modelo`, `modelo`) VALUES
(1, 'Villa Caracol'),
(2, 'Villa Arrecife'),
(3, 'Villa Carey');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `moneda`
--

CREATE TABLE `moneda` (
  `id_moneda` int NOT NULL,
  `moneda` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `abreviado` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `cambio` float DEFAULT NULL,
  `id_estado` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `moneda`
--

INSERT INTO `moneda` (`id_moneda`, `moneda`, `abreviado`, `cambio`, `id_estado`) VALUES
(1, 'Loquendolar', 'F.', 10, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `multipago`
--

CREATE TABLE `multipago` (
  `id_multi` int NOT NULL,
  `multipago` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `fecha_pago` date DEFAULT NULL,
  `id_c_pro` int DEFAULT NULL,
  `id_cuenta` int DEFAULT NULL,
  `id_estado` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `propietario_villa`
--

CREATE TABLE `propietario_villa` (
  `id_c_pro` int NOT NULL,
  `id_pro` int DEFAULT NULL,
  `id_con_vi` int DEFAULT NULL,
  `id_estado` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tel`
--

CREATE TABLE `tel` (
  `id_tel` int NOT NULL,
  `telefono` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_pro` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_concepto`
--

CREATE TABLE `tipo_concepto` (
  `id_tipo` int NOT NULL,
  `tipo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `tipo_concepto`
--

INSERT INTO `tipo_concepto` (`id_tipo`, `tipo`) VALUES
(1, 'Abono'),
(2, 'Cargo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `villa`
--

CREATE TABLE `villa` (
  `id_villa` int NOT NULL,
  `cont_ehh` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `tam_lote` double DEFAULT NULL,
  `tam_cons` double DEFAULT NULL,
  `direccion` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_modelo` int DEFAULT NULL,
  `observaciones` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_estado_villa` int DEFAULT NULL,
  `habitacion` int DEFAULT NULL,
  `id_letra` int DEFAULT NULL,
  `num_letra` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `abono`
--
ALTER TABLE `abono`
  ADD PRIMARY KEY (`id_abono`),
  ADD KEY `FK_abono_propietario_villa` (`id_c_pro`);

--
-- Indices de la tabla `carac_villa`
--
ALTER TABLE `carac_villa`
  ADD PRIMARY KEY (`id_caracteristica`),
  ADD KEY `FK_carac_villa_villa` (`id_villa`);

--
-- Indices de la tabla `concepto`
--
ALTER TABLE `concepto`
  ADD PRIMARY KEY (`id_concepto`),
  ADD KEY `FK_concepto_estado` (`id_estado`),
  ADD KEY `FK_concepto_tipo_concepto` (`id_tipo`);

--
-- Indices de la tabla `condicion_villa`
--
ALTER TABLE `condicion_villa`
  ADD PRIMARY KEY (`id_condicion`);

--
-- Indices de la tabla `con_vi`
--
ALTER TABLE `con_vi`
  ADD PRIMARY KEY (`id_con_vi`),
  ADD KEY `FK_con_vi_condicion_villa` (`id_condicion`);

--
-- Indices de la tabla `cuenta`
--
ALTER TABLE `cuenta`
  ADD PRIMARY KEY (`id_cuenta`),
  ADD KEY `FK_cuenta_estado_cuenta` (`id_estado_cuenta`),
  ADD KEY `FK_cuenta_propietario_villa` (`id_c_pro`),
  ADD KEY `FK_cuenta_concepto` (`id_concepto`);

--
-- Indices de la tabla `d_propietario`
--
ALTER TABLE `d_propietario`
  ADD PRIMARY KEY (`id_pro`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`id_estado`);

--
-- Indices de la tabla `estado_cuenta`
--
ALTER TABLE `estado_cuenta`
  ADD PRIMARY KEY (`id_estado_cuenta`);

--
-- Indices de la tabla `estado_villa`
--
ALTER TABLE `estado_villa`
  ADD PRIMARY KEY (`id_estado_villa`);

--
-- Indices de la tabla `letra_villa`
--
ALTER TABLE `letra_villa`
  ADD PRIMARY KEY (`id_letra`);

--
-- Indices de la tabla `modelo_villa`
--
ALTER TABLE `modelo_villa`
  ADD PRIMARY KEY (`id_modelo`);

--
-- Indices de la tabla `moneda`
--
ALTER TABLE `moneda`
  ADD PRIMARY KEY (`id_moneda`),
  ADD KEY `FK_moneda_estado` (`id_estado`);

--
-- Indices de la tabla `multipago`
--
ALTER TABLE `multipago`
  ADD PRIMARY KEY (`id_multi`),
  ADD KEY `FK_multipago_propietario_villa` (`id_c_pro`),
  ADD KEY `FK_multipago_estado` (`id_estado`),
  ADD KEY `FK_multipago_cuenta` (`id_cuenta`);

--
-- Indices de la tabla `propietario_villa`
--
ALTER TABLE `propietario_villa`
  ADD PRIMARY KEY (`id_c_pro`),
  ADD KEY `FK_propietario_villa_con_vi` (`id_con_vi`),
  ADD KEY `FK_propietario_villa_d_propietario` (`id_pro`),
  ADD KEY `FK_propietario_villa_estado` (`id_estado`);

--
-- Indices de la tabla `tel`
--
ALTER TABLE `tel`
  ADD PRIMARY KEY (`id_tel`),
  ADD KEY `FK_tel_d_propietario` (`id_pro`);

--
-- Indices de la tabla `tipo_concepto`
--
ALTER TABLE `tipo_concepto`
  ADD PRIMARY KEY (`id_tipo`);

--
-- Indices de la tabla `villa`
--
ALTER TABLE `villa`
  ADD PRIMARY KEY (`id_villa`),
  ADD KEY `FK_villa_letra_villa` (`id_letra`),
  ADD KEY `FK_villa_modelo_villa` (`id_modelo`),
  ADD KEY `FK_villa_estado_villa` (`id_estado_villa`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `abono`
--
ALTER TABLE `abono`
  MODIFY `id_abono` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `carac_villa`
--
ALTER TABLE `carac_villa`
  MODIFY `id_caracteristica` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `concepto`
--
ALTER TABLE `concepto`
  MODIFY `id_concepto` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `condicion_villa`
--
ALTER TABLE `condicion_villa`
  MODIFY `id_condicion` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `con_vi`
--
ALTER TABLE `con_vi`
  MODIFY `id_con_vi` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cuenta`
--
ALTER TABLE `cuenta`
  MODIFY `id_cuenta` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `d_propietario`
--
ALTER TABLE `d_propietario`
  MODIFY `id_pro` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `id_estado` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `estado_cuenta`
--
ALTER TABLE `estado_cuenta`
  MODIFY `id_estado_cuenta` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estado_villa`
--
ALTER TABLE `estado_villa`
  MODIFY `id_estado_villa` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `letra_villa`
--
ALTER TABLE `letra_villa`
  MODIFY `id_letra` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `modelo_villa`
--
ALTER TABLE `modelo_villa`
  MODIFY `id_modelo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `moneda`
--
ALTER TABLE `moneda`
  MODIFY `id_moneda` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `multipago`
--
ALTER TABLE `multipago`
  MODIFY `id_multi` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `propietario_villa`
--
ALTER TABLE `propietario_villa`
  MODIFY `id_c_pro` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tel`
--
ALTER TABLE `tel`
  MODIFY `id_tel` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_concepto`
--
ALTER TABLE `tipo_concepto`
  MODIFY `id_tipo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `villa`
--
ALTER TABLE `villa`
  MODIFY `id_villa` int NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `abono`
--
ALTER TABLE `abono`
  ADD CONSTRAINT `FK_abono_propietario_villa` FOREIGN KEY (`id_c_pro`) REFERENCES `propietario_villa` (`id_c_pro`);

--
-- Filtros para la tabla `carac_villa`
--
ALTER TABLE `carac_villa`
  ADD CONSTRAINT `FK_carac_villa_villa` FOREIGN KEY (`id_villa`) REFERENCES `villa` (`id_villa`);

--
-- Filtros para la tabla `concepto`
--
ALTER TABLE `concepto`
  ADD CONSTRAINT `FK_concepto_estado` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id_estado`),
  ADD CONSTRAINT `FK_concepto_tipo_concepto` FOREIGN KEY (`id_tipo`) REFERENCES `tipo_concepto` (`id_tipo`);

--
-- Filtros para la tabla `con_vi`
--
ALTER TABLE `con_vi`
  ADD CONSTRAINT `FK_con_vi_condicion_villa` FOREIGN KEY (`id_condicion`) REFERENCES `condicion_villa` (`id_condicion`);

--
-- Filtros para la tabla `cuenta`
--
ALTER TABLE `cuenta`
  ADD CONSTRAINT `FK_cuenta_concepto` FOREIGN KEY (`id_concepto`) REFERENCES `concepto` (`id_concepto`),
  ADD CONSTRAINT `FK_cuenta_estado_cuenta` FOREIGN KEY (`id_estado_cuenta`) REFERENCES `estado_cuenta` (`id_estado_cuenta`),
  ADD CONSTRAINT `FK_cuenta_propietario_villa` FOREIGN KEY (`id_c_pro`) REFERENCES `propietario_villa` (`id_c_pro`);

--
-- Filtros para la tabla `moneda`
--
ALTER TABLE `moneda`
  ADD CONSTRAINT `FK_moneda_estado` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id_estado`);

--
-- Filtros para la tabla `multipago`
--
ALTER TABLE `multipago`
  ADD CONSTRAINT `FK_multipago_cuenta` FOREIGN KEY (`id_cuenta`) REFERENCES `cuenta` (`id_cuenta`),
  ADD CONSTRAINT `FK_multipago_estado` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id_estado`),
  ADD CONSTRAINT `FK_multipago_propietario_villa` FOREIGN KEY (`id_c_pro`) REFERENCES `propietario_villa` (`id_c_pro`);

--
-- Filtros para la tabla `propietario_villa`
--
ALTER TABLE `propietario_villa`
  ADD CONSTRAINT `FK_propietario_villa_con_vi` FOREIGN KEY (`id_con_vi`) REFERENCES `con_vi` (`id_con_vi`),
  ADD CONSTRAINT `FK_propietario_villa_d_propietario` FOREIGN KEY (`id_pro`) REFERENCES `d_propietario` (`id_pro`),
  ADD CONSTRAINT `FK_propietario_villa_estado` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id_estado`);

--
-- Filtros para la tabla `tel`
--
ALTER TABLE `tel`
  ADD CONSTRAINT `FK_tel_d_propietario` FOREIGN KEY (`id_pro`) REFERENCES `d_propietario` (`id_pro`);

--
-- Filtros para la tabla `villa`
--
ALTER TABLE `villa`
  ADD CONSTRAINT `FK_villa_estado_villa` FOREIGN KEY (`id_estado_villa`) REFERENCES `estado_villa` (`id_estado_villa`),
  ADD CONSTRAINT `FK_villa_letra_villa` FOREIGN KEY (`id_letra`) REFERENCES `letra_villa` (`id_letra`),
  ADD CONSTRAINT `FK_villa_modelo_villa` FOREIGN KEY (`id_modelo`) REFERENCES `modelo_villa` (`id_modelo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
