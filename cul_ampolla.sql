-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-07-2019 a las 12:37:46
-- Versión del servidor: 10.3.16-MariaDB
-- Versión de PHP: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cul_ampolla`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clients`
--

CREATE TABLE `clients` (
  `id_client` int(11) NOT NULL,
  `name` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `adress` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `telf` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `email` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `data_registre` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `qui_recomana` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `clients`
--

INSERT INTO `clients` (`id_client`, `name`, `adress`, `telf`, `email`, `data_registre`, `qui_recomana`) VALUES
(1, 'Francisco Puig', 'C. del mig nº45 08450, Terrassa', '686957456', 'fr.puig@yahoo.es', '2019-07-30 08:09:24', 'Ramón'),
(2, 'Pere Graciós', 'Av. Girona, 4 3-1. 08402. Matadepera', '623548976', 'gracios@gmail.com', '2019-07-30 08:11:09', NULL),
(3, 'Magda Camps', 'Plaça Gran s/n. 04562. Cunit', '938569748', 'magdacamps@hotmail.com', '2019-07-30 08:12:47', 'Pere');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleats`
--

CREATE TABLE `empleats` (
  `id_empleat` int(11) NOT NULL,
  `nom` varchar(50) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `empleats`
--

INSERT INTO `empleats` (`id_empleat`, `nom`) VALUES
(1, 'Valeria'),
(2, 'Anca'),
(3, 'Rodrigo'),
(4, 'Alberto');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `id_prov` int(11) NOT NULL,
  `marca` enum('RayBan','Ulyses','Hawkers') COLLATE latin1_spanish_ci NOT NULL,
  `nom` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `carrer` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `numero` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `pis` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `porta` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `ciutat` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `c.p.` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `pais` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `telf` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `fax` varchar(10) COLLATE latin1_spanish_ci DEFAULT NULL,
  `nif` varchar(9) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`id_prov`, `marca`, `nom`, `carrer`, `numero`, `pis`, `porta`, `ciutat`, `c.p.`, `pais`, `telf`, `fax`, `nif`) VALUES
(1, 'RayBan', 'Rius LTDA', 'Espronceda', '5', '1', '2', 'Nova York', '05250', 'USA', '987654126', '987654127', '48596231Y'),
(2, 'Ulyses', 'SunGlasses', 'Santiago', '56', '9', '4', 'Illinois', '05468', 'Vietnam', '984561236', '984561237', '56897412P'),
(3, 'Hawkers', 'Glasses Academy', 'Roc i Boronat', '2', '1', '4', 'BCN', '08100', 'ESP', '935468796', NULL, '54126398B');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ulleres`
--

CREATE TABLE `ulleres` (
  `id_ulleres` int(11) NOT NULL,
  `id_prov` int(11) NOT NULL,
  `graduacio_dreta` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `graduacio_esquerra` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `tipus_montura` enum('flotant','pasta','metalica') COLLATE latin1_spanish_ci NOT NULL,
  `color_montura` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `color_vidre_dret` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `color_vidre_esq` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `preu` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `ulleres`
--

INSERT INTO `ulleres` (`id_ulleres`, `id_prov`, `graduacio_dreta`, `graduacio_esquerra`, `tipus_montura`, `color_montura`, `color_vidre_dret`, `color_vidre_esq`, `preu`) VALUES
(1, 1, '0.75', '0.25', 'pasta', 'negre', 'trans', 'trnas', 225.25),
(2, 2, '0.15', '0.25', 'flotant', 'marró', 'blau', 'verd', 115.05),
(3, 3, '0.10', '0.25', 'metalica', 'daurada', 'verd', 'verd', 65.5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id_venta` int(11) NOT NULL,
  `id_empleat` int(11) NOT NULL,
  `id_ullera` int(11) NOT NULL,
  `id_client` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id_client`);

--
-- Indices de la tabla `empleats`
--
ALTER TABLE `empleats`
  ADD PRIMARY KEY (`id_empleat`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`id_prov`);

--
-- Indices de la tabla `ulleres`
--
ALTER TABLE `ulleres`
  ADD PRIMARY KEY (`id_ulleres`),
  ADD KEY `id_prov` (`id_prov`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id_venta`),
  ADD KEY `fk_id_empleat` (`id_empleat`),
  ADD KEY `fk_id_ullera` (`id_ullera`),
  ADD KEY `fk_id_client` (`id_client`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clients`
--
ALTER TABLE `clients`
  MODIFY `id_client` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `empleats`
--
ALTER TABLE `empleats`
  MODIFY `id_empleat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `id_prov` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `ulleres`
--
ALTER TABLE `ulleres`
  MODIFY `id_ulleres` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id_venta` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ulleres`
--
ALTER TABLE `ulleres`
  ADD CONSTRAINT `ulleres_ibfk_1` FOREIGN KEY (`id_prov`) REFERENCES `proveedor` (`id_prov`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`id_empleat`) REFERENCES `empleats` (`id_empleat`),
  ADD CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`id_ullera`) REFERENCES `ulleres` (`id_ulleres`),
  ADD CONSTRAINT `ventas_ibfk_3` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id_client`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
