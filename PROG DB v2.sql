-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-10-2023 a las 19:21:40
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `programmasy`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `ReporteUsuarios` ()   BEGIN
SELECT *
FROM usuarios
WHERE
    (UsserID = UsserID OR UsserID IS NULL)
    AND (UsserName = UsserName OR UsserName IS NULL)
    AND (Email = Email OR Email IS NULL)
    AND (Contrasena = Contrasena OR Contrasena IS NULL)
    AND (UsserRol = UsserRol OR UsserRol IS NULL);
    
    END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `CategoryID` int(11) NOT NULL,
  `CategoryName` varchar(100) DEFAULT NULL,
  `SuppliersID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cursos`
--

CREATE TABLE `cursos` (
  `CoursesID` int(11) NOT NULL,
  `CourseName` varchar(50) DEFAULT NULL,
  `CourseDescription` varchar(100) DEFAULT NULL,
  `CategoryID` int(11) DEFAULT NULL,
  `LevelID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

CREATE TABLE `estados` (
  `StatusID` int(11) NOT NULL,
  `StatusUsser` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eventos`
--

CREATE TABLE `eventos` (
  `EventsID` int(11) NOT NULL,
  `EventName` varchar(100) DEFAULT NULL,
  `EventDescription` varchar(200) DEFAULT NULL,
  `EventDate` date DEFAULT NULL,
  `VersusID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `matriculados`
--

CREATE TABLE `matriculados` (
  `MatricID` int(11) NOT NULL,
  `Enrolled` int(11) DEFAULT NULL,
  `CoursesID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `niveles`
--

CREATE TABLE `niveles` (
  `LevelID` int(11) NOT NULL,
  `LevelCourse` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proovedores`
--

CREATE TABLE `proovedores` (
  `SuppliersID` int(11) NOT NULL,
  `SuppliersName` varchar(100) DEFAULT NULL,
  `ProductName` varchar(100) DEFAULT NULL,
  `ProductDescription` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `publicidad`
--

CREATE TABLE `publicidad` (
  `PublicID` int(11) NOT NULL,
  `PublicDescription` varchar(100) DEFAULT NULL,
  `Payment` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro`
--

CREATE TABLE `registro` (
  `RegistrarID` int(11) NOT NULL,
  `ParticipannNumber` int(11) DEFAULT NULL,
  `EventsID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `UsserID` int(11) NOT NULL,
  `UsserName` varchar(80) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Contrasena` varchar(50) DEFAULT NULL,
  `UsserRol` varchar(10) DEFAULT 'usuario',
  `StatusID` int(11) DEFAULT NULL,
  `MatricID` int(11) DEFAULT NULL,
  `RegistrarID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`UsserID`, `UsserName`, `Email`, `Contrasena`, `UsserRol`, `StatusID`, `MatricID`, `RegistrarID`) VALUES
(1, 'ADMIN', 'adminweb@gmail.com', 'adminruben663', 'Administra', NULL, NULL, NULL),
(7, 'alexis', 'morilloruben663@gmail.com', 'radm663duran', 'usuario', NULL, NULL, NULL),
(8, 'lucia', 'lolol@gmail.com', '1234567890', 'usuario', NULL, NULL, NULL),
(9, 'ruben', 'morilloruben663@gmail.com', '$2y$10$/avYKSK67RgB3VOeSlc.HewJpAlnnDE8UJymZRVUJWm', 'usuario', NULL, NULL, NULL),
(10, 'marcos', 'marcos2@gmail.com', '$2y$10$FWE9z5gWB.74d6qlLQQLW.02cMfTpcRCNNStY4shvof', 'usuario', NULL, NULL, NULL),
(11, 'daniel', 'daniel123@gmail.com', '$2y$10$9AoRXjT.uwFU5IwHQCVVOeDgNNuRqlJmthxG8kBj7ww', 'usuario', NULL, NULL, NULL),
(12, 'daniela ', 'daniela123@gmail.com', '$2y$10$GbmnMQejaIVe0kUXlAyAu.gTKUsphCkltIP2yB0q9HO', 'usuario', NULL, NULL, NULL),
(13, 'Felipe', 'felipe123456@gmail.com', '$2y$10$Xm9p3X5jDPbSk2wXbU8CverQAANodjAQ5hz/aycPq24', 'usuario', NULL, NULL, NULL),
(14, 'edgar', 'edgar12345@gmail.com', '$2y$10$TEchikRQEqLWGw28jEhmfupjnszLVzlANAu/LJBiPUn', 'usuario', NULL, NULL, NULL),
(15, 'carlos', 'carlos12345@gmail.com', '$2y$10$8.vDbiD8aE5q4QdoNyA8puDNcxCuZUT3qXStOBe4AJC', 'usuario', NULL, NULL, NULL),
(16, 'JULIO', 'juliocesarpalace@gmail.com', '$2y$10$yb9DulqbOajaXD2zzgDxw.d2MXZ.flYa9UKLo.zt/W3', 'usuario', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `versus`
--

CREATE TABLE `versus` (
  `VersusID` int(11) NOT NULL,
  `VersusParticipants` varchar(100) DEFAULT NULL,
  `VersusCode` char(3) DEFAULT NULL,
  `VersusTime` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`CategoryID`),
  ADD KEY `fk_ASuppliers` (`SuppliersID`);

--
-- Indices de la tabla `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`CoursesID`),
  ADD KEY `fk_ACategory` (`CategoryID`),
  ADD KEY `fk_ALevel` (`LevelID`);

--
-- Indices de la tabla `estados`
--
ALTER TABLE `estados`
  ADD PRIMARY KEY (`StatusID`);

--
-- Indices de la tabla `eventos`
--
ALTER TABLE `eventos`
  ADD PRIMARY KEY (`EventsID`),
  ADD KEY `fk_AVersus` (`VersusID`);

--
-- Indices de la tabla `matriculados`
--
ALTER TABLE `matriculados`
  ADD PRIMARY KEY (`MatricID`),
  ADD KEY `fk_ACourses` (`CoursesID`);

--
-- Indices de la tabla `niveles`
--
ALTER TABLE `niveles`
  ADD PRIMARY KEY (`LevelID`);

--
-- Indices de la tabla `proovedores`
--
ALTER TABLE `proovedores`
  ADD PRIMARY KEY (`SuppliersID`);

--
-- Indices de la tabla `publicidad`
--
ALTER TABLE `publicidad`
  ADD PRIMARY KEY (`PublicID`);

--
-- Indices de la tabla `registro`
--
ALTER TABLE `registro`
  ADD PRIMARY KEY (`RegistrarID`),
  ADD KEY `fk_AEvents` (`EventsID`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`UsserID`);

--
-- Indices de la tabla `versus`
--
ALTER TABLE `versus`
  ADD PRIMARY KEY (`VersusID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `UsserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD CONSTRAINT `fk_ASuppliers` FOREIGN KEY (`SuppliersID`) REFERENCES `proovedores` (`SuppliersID`);

--
-- Filtros para la tabla `cursos`
--
ALTER TABLE `cursos`
  ADD CONSTRAINT `fk_ACategory` FOREIGN KEY (`CategoryID`) REFERENCES `categorias` (`CategoryID`),
  ADD CONSTRAINT `fk_ALevel` FOREIGN KEY (`LevelID`) REFERENCES `niveles` (`LevelID`);

--
-- Filtros para la tabla `eventos`
--
ALTER TABLE `eventos`
  ADD CONSTRAINT `fk_AVersus` FOREIGN KEY (`VersusID`) REFERENCES `versus` (`VersusID`);

--
-- Filtros para la tabla `matriculados`
--
ALTER TABLE `matriculados`
  ADD CONSTRAINT `fk_ACourses` FOREIGN KEY (`CoursesID`) REFERENCES `cursos` (`CoursesID`);

--
-- Filtros para la tabla `registro`
--
ALTER TABLE `registro`
  ADD CONSTRAINT `fk_AEvents` FOREIGN KEY (`EventsID`) REFERENCES `eventos` (`EventsID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
