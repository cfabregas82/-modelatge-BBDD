-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-07-2019 a las 12:38:50
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
-- Base de datos: `stube`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id_user` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `mail` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `password` varchar(10) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id_user`, `mail`, `password`) VALUES
('cigala', 'elcigala@gmail.com', '4567983210'),
('comicon', 'comicon@gmail.com', '1234567890'),
('masacre', 'antonino@gmail.com', '6549873210'),
('pelusa', 'pelusilla23@gmail.com', '5616478953'),
('videoswei', 'agarcia@gmail.com', '0987654321');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `video`
--

CREATE TABLE `video` (
  `id_video` int(5) NOT NULL,
  `id_user` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `title` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `description` text COLLATE latin1_spanish_ci NOT NULL,
  `URL` varchar(100) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `video`
--

INSERT INTO `video` (`id_video`, `id_user`, `title`, `description`, `URL`) VALUES
(1, 'comicon', 'vacaiones en el mar', 'Me fui de vacaciones con mi tía abuela y lo pasamos super bién en el yate del tío Ernesto.', 'http://www.vacaciones.com/video'),
(2, 'comicon', 'gatos divertidos', 'serie de gatos divertidos asustándose de pepinos', 'http://www.gatospepinos.com/video'),
(3, 'comicon', 'tercera prueba', 'vamos con la tercera prueba y ver si esto funciona correctamente.', 'http://pruebadefinitiva.net/video');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- Indices de la tabla `video`
--
ALTER TABLE `video`
  ADD PRIMARY KEY (`id_video`,`id_user`),
  ADD KEY `id_user` (`id_user`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `video`
--
ALTER TABLE `video`
  MODIFY `id_video` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `video`
--
ALTER TABLE `video`
  ADD CONSTRAINT `video_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
