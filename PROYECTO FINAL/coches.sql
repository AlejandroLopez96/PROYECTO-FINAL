-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-05-2016 a las 16:44:49
-- Versión del servidor: 10.1.10-MariaDB
-- Versión de PHP: 7.0.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `coches`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `coche`
--

CREATE TABLE `coche` (
  `CodCoche` int(6) NOT NULL,
  `Marca` text COLLATE utf8_spanish_ci NOT NULL,
  `Modelo` text COLLATE utf8_spanish_ci NOT NULL,
  `Precio` int(9) NOT NULL,
  `Provincia` text COLLATE utf8_spanish_ci NOT NULL,
  `Combustible` text COLLATE utf8_spanish_ci NOT NULL,
  `Kms` int(10) NOT NULL,
  `Año` int(5) NOT NULL,
  `CodVendedor` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `coche`
--

INSERT INTO `coche` (`CodCoche`, `Marca`, `Modelo`, `Precio`, `Provincia`, `Combustible`, `Kms`, `Año`, `CodVendedor`) VALUES
(1, 'BMW', 'Serie 3', 35000, 'Málaga', 'Diesel', 3000, 2016, 1),
(2, 'Volkswagen', 'Golf GTD', 32000, 'Málaga', 'Diesel', 1000, 2016, 2),
(3, 'Audi', 'TT', 75000, 'Madrid', 'Diesel', 5, 2016, 3),
(4, 'Ford', 'Focus', 3000, 'Málaga', 'Diesel', 67000, 2003, 2),
(5, 'Audi', 'A1', 15000, 'Málaga', 'Diesel', 2000, 2015, 7),
(6, 'Renault', 'Megane', 1800, 'Teruel', 'Diesel', 156000, 2002, 5),
(7, 'Citroen', 'C4', 8000, 'Cáceres', 'Gasolina', 30000, 2012, 7),
(8, 'Volvo', 'S40', 4500, 'La Rioja', 'Diesel', 368000, 2006, 3),
(9, 'Audi', 'R8', 290000, 'Málaga', 'Gasolina', 0, 2016, 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login`
--

CREATE TABLE `login` (
  `Usuario` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `Clave` varchar(20) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `login`
--

INSERT INTO `login` (`Usuario`, `Clave`) VALUES
('admin', 'admin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vendedor`
--

CREATE TABLE `vendedor` (
  `Nombre` text COLLATE utf8_spanish_ci NOT NULL,
  `Apellidos` text COLLATE utf8_spanish_ci NOT NULL,
  `CodVendedor` int(3) NOT NULL,
  `DNI` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `Ciudad` text COLLATE utf8_spanish_ci NOT NULL,
  `Telefono` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `vendedor`
--

INSERT INTO `vendedor` (`Nombre`, `Apellidos`, `CodVendedor`, `DNI`, `Ciudad`, `Telefono`) VALUES
('Pepe', 'Rodríguez Matamoros', 1, '76567823M', 'Málaga', 666777888),
('Paco', 'Ramirez', 2, '34234236K', 'Madrid', 677865322),
('Eustaquio', 'Balderrama', 3, '67456123L', 'Valencia', 678886455),
('Juana', 'Fatase', 4, '34567123P', 'Pamplona', 698240956),
('Paloma', 'Cuesta', 5, '29345812D', 'Euskadi', 611408976),
('Francisca', 'Pacheco', 6, '76534666C', 'Cáceres', 699972344),
('Esteban', 'Kito', 7, '45527098W', 'Zaragoza', 567734599),
('Radamel', 'Falçao', 8, '46366581T', 'Madrid', 567385324),
('Lucas', 'Moura', 9, '56999234A', 'Marbella', 678555412);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `coche`
--
ALTER TABLE `coche`
  ADD PRIMARY KEY (`CodCoche`),
  ADD UNIQUE KEY `CodCoche` (`CodCoche`),
  ADD KEY `foranea` (`CodVendedor`);

--
-- Indices de la tabla `vendedor`
--
ALTER TABLE `vendedor`
  ADD PRIMARY KEY (`CodVendedor`),
  ADD UNIQUE KEY `CodVendedor` (`CodVendedor`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `coche`
--
ALTER TABLE `coche`
  ADD CONSTRAINT `foranea` FOREIGN KEY (`CodVendedor`) REFERENCES `vendedor` (`CodVendedor`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
