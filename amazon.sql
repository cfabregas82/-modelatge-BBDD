-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-07-2019 a las 12:38:08
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
-- Base de datos: `amazon`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `author`
--

CREATE TABLE `author` (
  `id_author` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `address` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `number_of_written_books` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `author`
--

INSERT INTO `author` (`id_author`, `name`, `address`, `number_of_written_books`) VALUES
(1, 'machado', 'carrer del mig, 25', 5),
(2, 'cortazar', 'carrer de dalt, 36', 36),
(3, 'coelho', 'carrer d\'abaix, 47', 116);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bill`
--

CREATE TABLE `bill` (
  `id_bill` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `bill_type` enum('0','1') COLLATE utf8_spanish_ci NOT NULL COMMENT '0 compra - 1 vende	',
  `amount` int(11) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `bill`
--

INSERT INTO `bill` (`id_bill`, `id_user`, `bill_type`, `amount`, `date`) VALUES
(3, 2, '0', NULL, '2019-07-29 18:13:46');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bill_lines`
--

CREATE TABLE `bill_lines` (
  `id_line` int(11) NOT NULL,
  `id_bill` int(11) NOT NULL,
  `id_book` int(11) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `bill_lines`
--

INSERT INTO `bill_lines` (`id_line`, `id_bill`, `id_book`, `price`) VALUES
(1, 3, 1, 20),
(2, 3, 2, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `books`
--

CREATE TABLE `books` (
  `id_book` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `units_available` int(11) NOT NULL,
  `id_author` int(11) NOT NULL,
  `tittle` varchar(50) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `books`
--

INSERT INTO `books` (`id_book`, `price`, `units_available`, `id_author`, `tittle`) VALUES
(1, 20, 16, 3, 'la comadreja'),
(2, 10, 12, 1, 'el laberinto'),
(3, 5, 1, 2, 'agua del pirineo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `password` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `user_type` enum('0','1') COLLATE utf8_spanish_ci NOT NULL COMMENT ' 0 compra - 1 vende'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id_user`, `username`, `email`, `password`, `user_type`) VALUES
(1, 'wilfred', 'wilfred@caca.com', 'caca55', '1'),
(2, 'caballo', 'caballo@ggol.com', 'caballito', '0'),
(3, 'cefalopodo', 'cabezon@tucasa.com', 'cabecitas', '1');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`id_author`);

--
-- Indices de la tabla `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`id_bill`),
  ADD KEY `fk_id_user` (`id_user`);

--
-- Indices de la tabla `bill_lines`
--
ALTER TABLE `bill_lines`
  ADD PRIMARY KEY (`id_line`),
  ADD KEY `id_bill` (`id_bill`),
  ADD KEY `id_book` (`id_book`);

--
-- Indices de la tabla `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id_book`),
  ADD KEY `fk_id_author` (`id_author`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `author`
--
ALTER TABLE `author`
  MODIFY `id_author` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `bill`
--
ALTER TABLE `bill`
  MODIFY `id_bill` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `bill_lines`
--
ALTER TABLE `bill_lines`
  MODIFY `id_line` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `books`
--
ALTER TABLE `books`
  MODIFY `id_book` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `bill_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `bill_lines`
--
ALTER TABLE `bill_lines`
  ADD CONSTRAINT `bill_lines_ibfk_1` FOREIGN KEY (`id_bill`) REFERENCES `bill` (`id_bill`),
  ADD CONSTRAINT `bill_lines_ibfk_2` FOREIGN KEY (`id_book`) REFERENCES `books` (`id_book`);

--
-- Filtros para la tabla `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_ibfk_1` FOREIGN KEY (`id_author`) REFERENCES `author` (`id_author`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
