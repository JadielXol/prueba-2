-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-11-2023 a las 21:40:54
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `estudiantes`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbasignatura`
--

CREATE TABLE `tbasignatura` (
  `idasignatura` int(11) NOT NULL,
  `nombreAsignatura` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbasignatura`
--

INSERT INTO `tbasignatura` (`idasignatura`, `nombreAsignatura`) VALUES
(1, 'Matematicas'),
(2, 'Ciencias Aplicadas'),
(3, 'Cultura Maya');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbcursos`
--

CREATE TABLE `tbcursos` (
  `idcurso` int(11) NOT NULL,
  `nombreCurso` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbcursos`
--

INSERT INTO `tbcursos` (`idcurso`, `nombreCurso`) VALUES
(1, 'Matematica Aplicada'),
(2, 'Quimica'),
(3, 'Costumbres Mayas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbestudiantes`
--

CREATE TABLE `tbestudiantes` (
  `idestudiante` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `fechaNac` date DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbestudiantes`
--

INSERT INTO `tbestudiantes` (`idestudiante`, `nombre`, `apellido`, `fechaNac`, `direccion`, `telefono`) VALUES
(1, 'Nery', 'Valdizon', '2006-02-20', 'Carcha', '1123-1029'),
(2, 'David', 'Zambrano', '2005-10-24', 'Chamelco', '3739-6727'),
(3, 'Edi', 'Quim', '2005-08-31', 'Carcha', '5627-1250');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbinscripciones`
--

CREATE TABLE `tbinscripciones` (
  `idinscripcion` int(11) NOT NULL,
  `idestudiante` int(11) DEFAULT NULL,
  `idcurso` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbinscripciones`
--

INSERT INTO `tbinscripciones` (`idinscripcion`, `idestudiante`, `idcurso`) VALUES
(1, 1, 2),
(2, 3, 1),
(3, 2, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbnotas`
--

CREATE TABLE `tbnotas` (
  `idnota` int(11) NOT NULL,
  `calificacion` decimal(10,2) DEFAULT NULL,
  `fechaCalificacion` date DEFAULT NULL,
  `idestudiante` int(11) DEFAULT NULL,
  `idasignatura` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbnotas`
--

INSERT INTO `tbnotas` (`idnota`, `calificacion`, `fechaCalificacion`, `idestudiante`, `idasignatura`) VALUES
(1, 65.77, '2023-11-15', 1, 2),
(2, 80.00, '2023-12-01', 3, 1),
(3, 74.98, '2023-11-29', 2, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbprofesores`
--

CREATE TABLE `tbprofesores` (
  `idprofesor` int(11) NOT NULL,
  `nombreProfesor` varchar(50) DEFAULT NULL,
  `idasignatura` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbprofesores`
--

INSERT INTO `tbprofesores` (`idprofesor`, `nombreProfesor`, `idasignatura`) VALUES
(1, 'Nelson Quim', 1),
(2, 'Christian Figueroa', 3),
(3, 'Allan Nuila', 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbasignatura`
--
ALTER TABLE `tbasignatura`
  ADD PRIMARY KEY (`idasignatura`);

--
-- Indices de la tabla `tbcursos`
--
ALTER TABLE `tbcursos`
  ADD PRIMARY KEY (`idcurso`);

--
-- Indices de la tabla `tbestudiantes`
--
ALTER TABLE `tbestudiantes`
  ADD PRIMARY KEY (`idestudiante`);

--
-- Indices de la tabla `tbinscripciones`
--
ALTER TABLE `tbinscripciones`
  ADD PRIMARY KEY (`idinscripcion`),
  ADD KEY `idestudiante` (`idestudiante`),
  ADD KEY `idcurso` (`idcurso`);

--
-- Indices de la tabla `tbnotas`
--
ALTER TABLE `tbnotas`
  ADD PRIMARY KEY (`idnota`),
  ADD KEY `idestudiante` (`idestudiante`),
  ADD KEY `idasignatura` (`idasignatura`);

--
-- Indices de la tabla `tbprofesores`
--
ALTER TABLE `tbprofesores`
  ADD PRIMARY KEY (`idprofesor`),
  ADD KEY `idasignatura` (`idasignatura`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbasignatura`
--
ALTER TABLE `tbasignatura`
  MODIFY `idasignatura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tbcursos`
--
ALTER TABLE `tbcursos`
  MODIFY `idcurso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tbestudiantes`
--
ALTER TABLE `tbestudiantes`
  MODIFY `idestudiante` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tbinscripciones`
--
ALTER TABLE `tbinscripciones`
  MODIFY `idinscripcion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tbnotas`
--
ALTER TABLE `tbnotas`
  MODIFY `idnota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tbprofesores`
--
ALTER TABLE `tbprofesores`
  MODIFY `idprofesor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbinscripciones`
--
ALTER TABLE `tbinscripciones`
  ADD CONSTRAINT `tbinscripciones_ibfk_1` FOREIGN KEY (`idestudiante`) REFERENCES `tbestudiantes` (`idestudiante`),
  ADD CONSTRAINT `tbinscripciones_ibfk_2` FOREIGN KEY (`idcurso`) REFERENCES `tbcursos` (`idcurso`);

--
-- Filtros para la tabla `tbnotas`
--
ALTER TABLE `tbnotas`
  ADD CONSTRAINT `tbnotas_ibfk_1` FOREIGN KEY (`idestudiante`) REFERENCES `tbestudiantes` (`idestudiante`),
  ADD CONSTRAINT `tbnotas_ibfk_2` FOREIGN KEY (`idasignatura`) REFERENCES `tbasignatura` (`idasignatura`);

--
-- Filtros para la tabla `tbprofesores`
--
ALTER TABLE `tbprofesores`
  ADD CONSTRAINT `tbprofesores_ibfk_1` FOREIGN KEY (`idasignatura`) REFERENCES `tbasignatura` (`idasignatura`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
