-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 23-08-2014 a las 11:18:07
-- Versión del servidor: 5.5.38-0ubuntu0.14.04.1
-- Versión de PHP: 5.5.9-1ubuntu4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `hogwarts`
--
CREATE DATABASE IF NOT EXISTS `hogwarts` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `hogwarts`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `casa`
--

CREATE TABLE IF NOT EXISTS casa (
  codigoCasa int(11) NOT NULL,
  nombre varchar(40) COLLATE utf8_spanish2_ci DEFAULT NULL,
  PRIMARY KEY (codigoCasa)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Estructura de tabla para la tabla `alumno`
--

CREATE TABLE IF NOT EXISTS alumno (
  codigoAlumno int(11) NOT NULL,
  nombre varchar(40) COLLATE utf8_spanish2_ci DEFAULT NULL,
  codigoCasa int(11) NOT NULL,
  PRIMARY KEY (codigoAlumno),
  FOREIGN KEY (codigoCasa) REFERENCES casa (codigoCasa)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `casa`
--

INSERT INTO `casa` (`codigoCasa`, `nombre`) VALUES
(1, 'Gryffindor'),
(2, 'Hufflepuff'),
(3, 'Ravenclaw'),
(4, 'Slytherin');

--
-- Volcado de datos para la tabla `alumno`
--

INSERT INTO `alumno` (`codigoAlumno`, `nombre`, `codigoCasa`) VALUES
(1, 'James Potter, Harry', 1),
(2, 'Bilius Weasley, Ronald', 1),
(3, 'Jean Granger, Hermione', 1),
(4, 'Diggory, Cedric', 2),
(5, 'Bones, Susan', 2),
(6, 'Macmillan, Ernie', 2),
(7, 'Lovegood, Luna', 3),
(8, 'Chang, Cho', 3),
(9, 'Patil, Padma', 3),
(10, 'Malfoy, Draco', 4),
(11, 'Crabbe, Vicent', 4),
(12, 'Goyle, Gregory', 4);


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
