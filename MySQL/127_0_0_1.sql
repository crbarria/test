-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-10-2023 a las 20:05:41
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `prueba`
--
CREATE DATABASE IF NOT EXISTS `prueba` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `prueba`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comuna`
--

CREATE TABLE `comuna` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `region_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `comuna`
--

INSERT INTO `comuna` (`id`, `nombre`, `region_id`) VALUES
(1, 'Cerrillos', 1),
(2, 'Cerro Navia', 1),
(3, 'Conchalí', 1),
(4, 'El Bosque', 1),
(5, 'Estación Central', 1),
(6, 'Huechuraba', 1),
(7, 'Independencia', 1),
(8, 'La Cisterna', 1),
(9, 'La Florida', 1),
(10, 'La Granja', 1),
(11, 'La Pintana', 1),
(12, 'La Reina', 1),
(13, 'Las Condes', 1),
(14, 'Lo Barnechea', 1),
(15, 'Lo Espejo', 1),
(16, 'Lo Prado', 1),
(17, 'Macul', 1),
(18, 'Maipú', 1),
(19, 'Ñuñoa', 1),
(20, 'Pedro Aguirre Cerda', 1),
(21, 'Peñalolén', 1),
(22, 'Providencia', 1),
(23, 'Pudahuel', 1),
(24, 'Quilicura', 1),
(25, 'Quinta Normal', 1),
(26, 'Recoleta', 1),
(27, 'Renca', 1),
(28, 'San Joaquín', 1),
(29, 'San Miguel', 1),
(30, 'San Ramón', 1),
(31, 'Santiago', 1),
(32, 'Vitacura', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `rut` varchar(12) NOT NULL,
  `email` varchar(255) NOT NULL,
  `region_id` int(11) NOT NULL,
  `comuna_id` int(11) NOT NULL,
  `Candidato` varchar(40) NOT NULL,
  `intereses` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`id`, `nombre`, `alias`, `rut`, `email`, `region_id`, `comuna_id`, `Candidato`, `intereses`) VALUES
(42, 'Sebastian Jorratt', 'Sebrax', '19450871-9', 'sebrax@gmail.com', 1, 2, 'Harry Mason', 'Redes Sociales'),
(43, 'Cristian Barría', 'Crissfloyd', '20597363-K', 'criss@gmail.com', 1, 2, 'Heather Mason', 'Amigo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `region`
--

CREATE TABLE `region` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `region`
--

INSERT INTO `region` (`id`, `nombre`) VALUES
(1, 'Región Metropolitana'),
(2, 'Región de Arica y Parinacota'),
(3, 'Región de Tarapacá'),
(4, 'Región de Antofagasta'),
(5, 'Región de Atacama'),
(6, 'Región de Coquimbo'),
(7, 'Región de Valparaíso'),
(8, 'Región de O’Higgins'),
(9, 'Región del Maule'),
(10, 'Región del Ñuble'),
(11, 'Región del Biobío'),
(12, 'Región de La Araucanía'),
(13, 'Región de Los Ríos'),
(14, 'Región de Los Lagos'),
(15, 'Región de Aysén'),
(16, 'Región de Magallanes');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `comuna`
--
ALTER TABLE `comuna`
  ADD PRIMARY KEY (`id`),
  ADD KEY `region_id` (`region_id`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`id`),
  ADD KEY `region_id` (`region_id`),
  ADD KEY `comuna_id` (`comuna_id`);

--
-- Indices de la tabla `region`
--
ALTER TABLE `region`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `comuna`
--
ALTER TABLE `comuna`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT de la tabla `region`
--
ALTER TABLE `region`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comuna`
--
ALTER TABLE `comuna`
  ADD CONSTRAINT `comuna_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `region` (`id`);

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `persona_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `region` (`id`),
  ADD CONSTRAINT `persona_ibfk_2` FOREIGN KEY (`comuna_id`) REFERENCES `comuna` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
