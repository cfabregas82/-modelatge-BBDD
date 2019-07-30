-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-07-2019 a las 12:38:27
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
-- Base de datos: `quadres`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `author`
--

CREATE TABLE `author` (
  `id_author` int(11) NOT NULL,
  `name` varchar(50) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `author`
--

INSERT INTO `author` (`id_author`, `name`) VALUES
(1, 'Kevin de Palma'),
(2, 'Brian Kandinski'),
(3, 'Unknown');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `buyer`
--

CREATE TABLE `buyer` (
  `person_id` int(11) NOT NULL,
  `Nombre` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `dni` varchar(9) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `buyer`
--

INSERT INTO `buyer` (`person_id`, `Nombre`, `dni`) VALUES
(1, 'Sandra Molina', '47808596H'),
(2, 'Sergio Palma', '45789635T'),
(3, 'Mireia Gonzalez', '23567894K');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `picture`
--

CREATE TABLE `picture` (
  `id_picture` int(5) NOT NULL COMMENT 'identitat del quadre',
  `id_author` int(11) NOT NULL,
  `price` decimal(6,2) NOT NULL COMMENT 'preu del quadre'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `picture`
--

INSERT INTO `picture` (`id_picture`, `id_author`, `price`) VALUES
(2, 1, '1526.23'),
(3, 2, '965.10'),
(4, 3, '9950.99');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `purchased`
--

CREATE TABLE `purchased` (
  `id_venta` int(11) NOT NULL,
  `id_picture` int(11) NOT NULL,
  `person_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `purchased`
--

INSERT INTO `purchased` (`id_venta`, `id_picture`, `person_id`) VALUES
(1, 3, 1),
(2, 2, 3),
(3, 4, 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`id_author`);

--
-- Indices de la tabla `buyer`
--
ALTER TABLE `buyer`
  ADD PRIMARY KEY (`person_id`);

--
-- Indices de la tabla `picture`
--
ALTER TABLE `picture`
  ADD PRIMARY KEY (`id_picture`),
  ADD KEY `fk_id_author` (`id_author`);

--
-- Indices de la tabla `purchased`
--
ALTER TABLE `purchased`
  ADD PRIMARY KEY (`id_venta`),
  ADD KEY `FK_picture_id` (`id_picture`),
  ADD KEY `FK_person_id` (`person_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `author`
--
ALTER TABLE `author`
  MODIFY `id_author` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `buyer`
--
ALTER TABLE `buyer`
  MODIFY `person_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `picture`
--
ALTER TABLE `picture`
  MODIFY `id_picture` int(5) NOT NULL AUTO_INCREMENT COMMENT 'identitat del quadre', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `purchased`
--
ALTER TABLE `purchased`
  MODIFY `id_venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `picture`
--
ALTER TABLE `picture`
  ADD CONSTRAINT `picture_ibfk_1` FOREIGN KEY (`id_author`) REFERENCES `author` (`id_author`);

--
-- Filtros para la tabla `purchased`
--
ALTER TABLE `purchased`
  ADD CONSTRAINT `purchased_ibfk_1` FOREIGN KEY (`id_picture`) REFERENCES `picture` (`id_picture`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `purchased_ibfk_2` FOREIGN KEY (`person_id`) REFERENCES `buyer` (`person_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
