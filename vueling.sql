-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-07-2019 a las 12:39:00
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
-- Base de datos: `vueling`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plane`
--

CREATE TABLE `plane` (
  `id_plane` int(11) NOT NULL COMMENT 'identitat avio',
  `num_pers` varchar(4) COLLATE latin1_spanish_ci NOT NULL COMMENT 'numero de persones',
  `model` varchar(4) COLLATE latin1_spanish_ci NOT NULL COMMENT 'model avio'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `plane`
--

INSERT INTO `plane` (`id_plane`, `num_pers`, `model`) VALUES
(1, '0100', '0001'),
(2, '0100', '0006');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seat`
--

CREATE TABLE `seat` (
  `id_seat` int(6) NOT NULL COMMENT 'identitat seient',
  `plane_id` int(11) NOT NULL COMMENT 'identitat avio',
  `codi_seient` varchar(4) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `seat`
--

INSERT INTO `seat` (`id_seat`, `plane_id`, `codi_seient`) VALUES
(1, 1, '1C'),
(2, 2, '2B');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `plane`
--
ALTER TABLE `plane`
  ADD PRIMARY KEY (`id_plane`);

--
-- Indices de la tabla `seat`
--
ALTER TABLE `seat`
  ADD PRIMARY KEY (`id_seat`),
  ADD KEY `plane_id` (`plane_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `plane`
--
ALTER TABLE `plane`
  MODIFY `id_plane` int(11) NOT NULL AUTO_INCREMENT COMMENT 'identitat avio', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `seat`
--
ALTER TABLE `seat`
  MODIFY `id_seat` int(6) NOT NULL AUTO_INCREMENT COMMENT 'identitat seient', AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `seat`
--
ALTER TABLE `seat`
  ADD CONSTRAINT `seat_ibfk_1` FOREIGN KEY (`plane_id`) REFERENCES `plane` (`id_plane`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
