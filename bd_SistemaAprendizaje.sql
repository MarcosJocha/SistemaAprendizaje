CREATE SCHEMA IF NOT EXISTS `bd_sistemaaprendizaje` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `bd_sistemaaprendizaje`;
-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 19-09-2019 a las 05:12:23
-- Versión del servidor: 5.7.23-0ubuntu0.16.04.1
-- Versión de PHP: 7.0.30-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `c0bd_sistemaAprendizaje`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_USUARIO` (IN `par_user` VARCHAR(45), IN `par_password` VARCHAR(150))  BEGIN

    SELECT p.id, p.nombre, u.usuario, p.apellido_paterno, p.apellido_materno, u.estado

	FROM persona p 
		INNER JOIN usuario u ON p.id=u.id
	WHERE u.usuario=par_user and u.clave=par_password;

   
	SELECT u.rol_id
	FROM usuario u
	WHERE u.usuario=par_user AND u.estado=1;



END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `INSERT_ALUMNO` (IN `id` INT, IN `nombre` VARCHAR(50), IN `apellido_paterno` VARCHAR(50), IN `apellido_materno` VARCHAR(50), IN `celular` VARCHAR(50), IN `idnivelceguera` INT, IN `idgrado` INT, IN `usuario` VARCHAR(50))  BEGIN

INSERT INTO `alumno` (`id`, `estado`, `idnivelceguera`,`idgrado`,`fecha_registro`) VALUES
(id, 1, idnivelceguera,idgrado,SYSDATE());

INSERT INTO `persona` (`id`, `nombre`, `apellido_paterno`, `apellido_materno`, `celular`) VALUES
(id, nombre, apellido_paterno, apellido_materno, celular);


INSERT INTO `usuario` (`id`, `usuario`, `clave`, `estado`, `rol_id`) VALUES
(id, usuario, '123456', '1', 2);




END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `INSERT_PROFESOR` (IN `id` INT, IN `nombre` VARCHAR(50), IN `apellido_paterno` VARCHAR(50), IN `apellido_materno` VARCHAR(50), IN `celular` VARCHAR(50), IN `idgrado` INT, IN `idcurso` INT, IN `usuario` VARCHAR(50))  BEGIN

INSERT INTO `persona` (`id`, `nombre`, `apellido_paterno`, `apellido_materno`, `celular`) VALUES
(id, nombre, apellido_paterno, apellido_materno, celular);


INSERT INTO `profesor` (id,`estado`, `idgrado`, `idcurso`) VALUES
(id, 1,  idgrado, idcurso);



INSERT INTO `usuario` (`id`, `usuario`, `clave`, `estado`, `rol_id`) VALUES
(id, usuario, '123456', '1', 3);




END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno`
--

CREATE TABLE `alumno` (
  `id` int(11) NOT NULL,
  `estado` int(11) NOT NULL,
  `idnivelceguera` int(11) NOT NULL,
  `idgrado` int(11) NOT NULL,
  `fecha_registro` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `alumno`
--

INSERT INTO `alumno` (`id`, `estado`, `idnivelceguera`, `idgrado`, `fecha_registro`) VALUES
(10101010, 1, 2, 4, '2019-09-17 00:00:00'),
(10101012, 1, 1, 4, '2019-09-17 00:00:00'),
(10101013, 1, 1, 4, '2019-09-17 00:00:00'),
(10101014, 1, 3, 5, '2019-09-17 00:00:00'),
(10101015, 1, 2, 5, '2019-09-17 00:00:00'),
(10101016, 1, 3, 5, '2019-09-17 00:00:00'),
(10101022, 1, 3, 5, '2019-09-17 00:00:00'),
(10101023, 1, 3, 5, '2019-09-17 00:00:00'),
(10101055, 1, 2, 5, '2019-09-17 00:00:00'),
(10221015, 1, 3, 5, '2019-09-17 00:00:00'),
(10252525, 1, 1, 5, '2019-09-17 00:00:00'),
(10263720, 1, 1, 5, '2019-06-10 00:00:00'),
(11155811, 1, 2, 4, '2019-09-18 00:00:00'),
(11155889, 1, 2, 4, '2019-09-18 00:00:00'),
(20101012, 1, 1, 3, '2019-09-17 00:00:00'),
(20101055, 1, 2, 3, '2019-09-17 00:00:00'),
(20202088, 1, 1, 5, '2019-09-18 00:00:00'),
(20585858, 1, 3, 4, '2019-09-18 00:00:00'),
(22101013, 1, 1, 5, '2019-09-17 00:00:00'),
(22101014, 1, 3, 5, '2019-09-17 00:00:00'),
(25659844, 1, 2, 4, '2019-09-18 00:00:00'),
(70533423, 1, 1, 5, '2019-09-19 00:05:46'),
(70558866, 1, 10, 5, '2019-06-10 00:00:00'),
(70656960, 1, 2, 5, '2019-06-10 00:00:00'),
(70656961, 1, 14, 5, '2019-06-10 00:00:00'),
(90002111, 1, 2, 3, '2019-09-18 00:00:00'),
(90002525, 1, 2, 5, '2019-09-18 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso`
--

CREATE TABLE `curso` (
  `idcurso` int(3) NOT NULL,
  `descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `curso`
--

INSERT INTO `curso` (`idcurso`, `descripcion`) VALUES
(1, 'Matematica'),
(2, 'Trigonometria'),
(3, 'Algebra'),
(4, 'Aritmetica'),
(5, 'Logica'),
(6, 'Fisica');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ejercicio`
--

CREATE TABLE `ejercicio` (
  `idejercicio` int(11) NOT NULL,
  `idcurso` int(11) NOT NULL,
  `idgrado` int(11) NOT NULL,
  `idtema` int(11) NOT NULL,
  `PuntajeTotal` int(11) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `namejsp` varchar(100) DEFAULT NULL,
  `comentario` varchar(250) NOT NULL DEFAULT '',
  `Dificultad` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ejercicio`
--

INSERT INTO `ejercicio` (`idejercicio`, `idcurso`, `idgrado`, `idtema`, `PuntajeTotal`, `descripcion`, `namejsp`, `comentario`, `Dificultad`) VALUES
(1, 2, 5, 3, 20, 'Ejercicios de angulos', 'ejercicio1_4_5_3', 'Completa los Angulos con los valores correspondientes', 'Alta'),
(2, 2, 5, 3, 20, 'Ejercicio de Pitagoras', 'ejercicio2_4_5_3', 'Completa los angulos notables de pitagoras', 'Intermedia'),
(3, 2, 5, 3, 20, 'Ejercicio Triangulo Rectangulo', 'ejercicio3_4_5_3', 'Completa los triangulos rectangulos con los valores corrspondientes', 'Intermedia'),
(4, 2, 5, 3, 20, 'Ejercicio Angulos agudos', 'ejercicio4_4_5_3', 'Completa los Angulos Agudos', 'Intermedia'),
(5, 2, 5, 3, 20, 'Ejercicio Angulos Obtusos', 'ejercicio5_4_5_3', 'Completa los angulos obtusos', 'Alta'),
(6, 2, 5, 3, 20, 'Ejercicio Complementos', 'ejercicio6_4_5_3', 'Halla el complemento de los angulos', 'Alta'),
(7, 4, 5, 2, 20, 'Ejercicio Sucesiones de Figuras', 'ejercicio7_4_5_3', 'Cual es la siguiente figura que debe continuar', 'Alta'),
(8, 3, 5, 2, 20, 'Ejercicio Funciones', 'ejercicio8_4_5_3', 'Halle el valor de la siguiente variable en la ecuacion', 'Intermedia'),
(9, 4, 5, 2, 20, 'Ejercicio Sucesiones de Numeros', 'ejercicio9_4_5_3', 'Cual es el siguiente numero', 'Baja'),
(10, 4, 5, 2, 20, 'Ejercicio de Sucesion Aritmetica', 'ejercicio10_4_5_3', 'Halle el siguiente numero en la sucesion Aritmetica', 'Intermedia'),
(11, 4, 5, 3, 20, 'Ejercicio de Sucesion Geometrica', 'ejercicio11_4_5_3', 'Halle el siguiente numero en la sucesion', 'Intermedia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evaluacion`
--

CREATE TABLE `evaluacion` (
  `idevaluacion` int(3) NOT NULL,
  `idejercicio` int(3) NOT NULL,
  `idalumno` int(8) NOT NULL,
  `nrointentos` int(3) NOT NULL,
  `fecha_evaluacion` date NOT NULL,
  `nota` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `evaluacion`
--

INSERT INTO `evaluacion` (`idevaluacion`, `idejercicio`, `idalumno`, `nrointentos`, `fecha_evaluacion`, `nota`) VALUES
(1, 1, 10101015, 1, '2019-09-18', 18),
(2, 2, 10101015, 1, '2019-09-18', 18),
(3, 3, 10101015, 3, '2019-09-18', 12),
(4, 4, 10101015, 2, '2019-09-18', 15),
(5, 5, 10101015, 2, '2019-09-18', 15),
(6, 6, 10101015, 2, '2019-09-18', 15),
(7, 7, 10101015, 2, '2019-09-18', 18),
(8, 8, 10101015, 3, '2019-09-18', 13),
(9, 9, 10101015, 1, '2019-09-18', 15),
(10, 10, 10101015, 2, '2019-09-18', 13),
(11, 1, 10101012, 1, '2019-09-18', 18),
(12, 2, 10101012, 1, '2019-09-18', 18),
(13, 3, 10101012, 3, '2019-09-18', 12),
(14, 4, 10101012, 2, '2019-09-18', 15),
(15, 5, 10101012, 2, '2019-09-18', 15),
(16, 6, 10101012, 2, '2019-09-18', 15),
(17, 7, 10101012, 2, '2019-09-18', 18),
(18, 1, 10101012, 1, '2019-09-18', 18),
(19, 2, 10101012, 1, '2019-09-18', 18),
(20, 3, 10101012, 3, '2019-09-18', 12),
(21, 4, 10101012, 2, '2019-09-18', 15),
(22, 5, 10101012, 2, '2019-09-18', 15),
(23, 6, 10101013, 2, '2019-09-18', 15),
(24, 7, 10101013, 2, '2019-09-18', 18),
(25, 1, 10101013, 1, '2019-09-18', 18),
(26, 2, 10101013, 1, '2019-09-18', 18),
(27, 3, 10101013, 3, '2019-09-18', 12),
(28, 4, 10101013, 2, '2019-09-18', 15),
(29, 5, 10101013, 2, '2019-09-18', 15),
(30, 6, 10101014, 2, '2019-09-18', 15),
(31, 7, 10101014, 2, '2019-09-18', 18),
(32, 1, 10101014, 1, '2019-09-18', 18),
(33, 2, 10101016, 1, '2019-09-18', 18),
(34, 3, 10101016, 3, '2019-09-18', 12),
(35, 4, 10101022, 2, '2019-09-18', 15),
(36, 5, 10101022, 2, '2019-09-18', 15),
(37, 6, 10101022, 2, '2019-09-18', 15),
(38, 7, 10101023, 2, '2019-09-18', 18),
(39, 1, 10101055, 1, '2019-09-18', 18),
(40, 2, 10101055, 1, '2019-09-18', 18),
(41, 3, 10101055, 3, '2019-09-18', 12),
(42, 4, 10101055, 2, '2019-09-18', 15),
(43, 5, 10221015, 2, '2019-09-18', 15),
(44, 6, 10221015, 2, '2019-09-18', 15),
(45, 7, 10252525, 2, '2019-09-18', 18),
(46, 1, 10252525, 1, '2019-09-18', 18),
(47, 2, 10252525, 1, '2019-09-18', 18),
(48, 3, 10252525, 3, '2019-09-18', 12),
(49, 4, 10252525, 2, '2019-09-18', 15),
(50, 5, 10263720, 2, '2019-09-18', 15),
(51, 6, 10263720, 2, '2019-09-18', 15),
(52, 7, 10263720, 2, '2019-09-18', 18),
(53, 1, 11155811, 1, '2019-09-18', 18),
(54, 2, 11155889, 1, '2019-09-18', 18),
(55, 3, 10101016, 3, '2019-09-18', 12),
(56, 4, 20101012, 2, '2019-09-18', 15),
(57, 5, 20101012, 2, '2019-09-18', 15),
(58, 6, 20101012, 2, '2019-09-18', 15),
(59, 7, 20101055, 2, '2019-09-18', 18),
(60, 1, 20101055, 1, '2019-09-18', 18),
(61, 2, 20202088, 1, '2019-09-18', 18),
(62, 3, 20585858, 3, '2019-09-18', 12),
(63, 4, 22101013, 2, '2019-09-18', 15),
(64, 5, 22101014, 2, '2019-09-18', 15),
(65, 6, 25659844, 2, '2019-09-18', 15),
(66, 7, 70558866, 2, '2019-09-18', 18),
(67, 1, 70656960, 1, '2019-09-18', 18),
(68, 2, 70656961, 1, '2019-09-18', 18),
(69, 3, 10252525, 3, '2019-09-18', 12),
(70, 4, 90002111, 2, '2019-09-18', 15),
(71, 5, 10263720, 2, '2019-09-18', 15),
(72, 6, 10263720, 2, '2019-09-18', 15),
(73, 7, 10263720, 2, '2019-09-18', 18),
(74, 1, 11155811, 1, '2019-09-18', 18),
(75, 2, 11155889, 1, '2019-09-18', 18),
(76, 3, 10101016, 3, '2019-09-18', 12),
(77, 4, 90002525, 2, '2019-09-18', 15),
(78, 5, 90002525, 2, '2019-09-18', 15),
(79, 6, 90002525, 2, '2019-09-18', 15),
(80, 7, 20101055, 2, '2019-09-18', 18);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grado`
--

CREATE TABLE `grado` (
  `idgrado` int(3) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `nivel` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `grado`
--

INSERT INTO `grado` (`idgrado`, `descripcion`, `nivel`) VALUES
(1, '1ro Primaria', 'Primaria'),
(2, '2do Primaria', 'Primaria'),
(3, '3ro Primaria', 'Primaria'),
(4, '4to Primaria', 'Primaria'),
(5, '5to Primaria', 'Primaria'),
(6, '6to Primaria', 'Primaria'),
(7, '1ro Secundaria', 'Secundaria'),
(8, '2do Secundaria', 'Secundaria'),
(9, '3ro Secundaria', 'Secundaria'),
(10, '4to Secundaria', 'Secundaria'),
(11, '5to Secundaria', 'Secundaria');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gradoxcurso`
--

CREATE TABLE `gradoxcurso` (
  `idgrado` int(3) NOT NULL,
  `idcurso` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `gradoxcurso`
--

INSERT INTO `gradoxcurso` (`idgrado`, `idcurso`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(1, 2),
(2, 2),
(3, 2),
(4, 2),
(5, 2),
(6, 2),
(7, 2),
(8, 2),
(9, 2),
(10, 2),
(11, 2),
(1, 3),
(2, 3),
(3, 3),
(4, 3),
(5, 3),
(6, 3),
(7, 3),
(8, 3),
(9, 3),
(10, 3),
(11, 3),
(1, 4),
(2, 4),
(3, 4),
(4, 4),
(5, 4),
(6, 4),
(7, 4),
(8, 4),
(9, 4),
(10, 4),
(11, 4),
(1, 5),
(2, 5),
(3, 5),
(4, 5),
(5, 5),
(6, 5),
(7, 5),
(8, 5),
(9, 5),
(10, 5),
(11, 5),
(1, 6),
(2, 6),
(3, 6),
(4, 6),
(5, 6),
(6, 6),
(7, 6),
(8, 6),
(9, 6),
(10, 6),
(11, 6),
(1, 7),
(2, 7),
(3, 7),
(4, 7),
(5, 7),
(6, 7),
(7, 7),
(8, 7),
(9, 7),
(10, 7),
(11, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nivelceguera`
--

CREATE TABLE `nivelceguera` (
  `idnivelceguera` int(3) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `puntaje` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `nivelceguera`
--

INSERT INTO `nivelceguera` (`idnivelceguera`, `nombre`, `puntaje`) VALUES
(1, 'Severa', 20),
(2, 'Intermedia', 100),
(3, 'Aguda', 150);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido_paterno` varchar(50) NOT NULL,
  `apellido_materno` varchar(50) NOT NULL,
  `celular` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`id`, `nombre`, `apellido_paterno`, `apellido_materno`, `celular`) VALUES
(10101010, 'Jose', 'Garcia', 'Morelia', '999998781'),
(10101012, 'Ana', 'Rojas', 'Morelia', '999998781'),
(10101013, 'Carlos', 'Galarde', 'Morelia', '999998781'),
(10101014, 'Ricardo', 'Amasifen', 'Palacios', '999998781'),
(10101015, 'Marcos', 'Jochatoma', 'Garcia', '999998781'),
(10101016, 'Maria', 'Palacios', 'Morelia', '999998781'),
(10101022, 'Lorena', 'Garcia', 'Quiroz', '999998781'),
(10101023, 'Oliver', 'Rojas', 'Morelia', '999998781'),
(10101055, 'Gabriel', 'Garcia', 'Morelia', '999998781'),
(10221015, 'Ivan', 'Vilchez', 'Quevedo', '924525875'),
(10252525, 'Jose', 'Canahualpa', 'Gutierrez', '999886858'),
(10263720, 'Hugo', 'Ambia', 'Rebatta', '974626407'),
(10290001, 'Alvaro', 'Ramirez', 'Arce', '974626407'),
(10290002, 'Augusto', 'Altamirano', 'Ponce', '974626407'),
(10290003, 'Ricardo', 'ricra', 'torres', '974626407'),
(10290004, 'Jose', 'Rojas', 'Caceres', '974626407'),
(10290005, 'Gustavo', 'Novoa', 'Evaristo', '974626407'),
(10290006, 'Alfredo', 'Zarate', 'Chavez', '974626407'),
(10586974, 'John', 'Rojas', 'Stevenson', '998877654'),
(10593365, 'Norma', 'Leon', 'Rodriguez', '998855448'),
(11155811, 'Juliana', 'Govelan', 'Gaspar', '999888756'),
(11155889, 'Ana', 'Gavelan', 'Gaspar', '999888756'),
(20101012, 'Sasha', 'Diaz', 'Morelia', '924525875'),
(20101055, 'Carlos', 'Granados', 'Morelia', '924525875'),
(20585858, 'Luis Miguel', 'Garcia', 'Quiroz', '999254588'),
(22101013, 'Hernan', 'Heredia', 'Diaz', '924525875'),
(22101014, 'Pablo', 'Silva', 'Palacios', '924525875'),
(25659844, 'Julio', 'Cabrera', 'Mendoza', '999887889'),
(70533423, 'Isabel', 'Choquehuanca', 'Perez', '993456835'),
(70558866, 'Jose', 'Arce', 'Matta', '974626407'),
(70636363, 'Ricardo', 'Aldave', 'Caparachin', '999888756'),
(70656960, 'Carlos', 'Acuña', 'Flores', '974626407'),
(70656961, 'Giancarlo', 'Aguado ', 'Polanco', '974626407'),
(90002111, 'Julio', 'Cabrera', 'Gaspar', '999888756'),
(90002525, 'Luisa', 'Amauta', 'Caparachin', '902584587');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesor`
--

CREATE TABLE `profesor` (
  `id` int(11) NOT NULL,
  `estado` enum('1','0','2') NOT NULL,
  `idgrado` int(11) NOT NULL,
  `idcurso` int(11) NOT NULL,
  `fecha_registro` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `profesor`
--

INSERT INTO `profesor` (`id`, `estado`, `idgrado`, `idcurso`, `fecha_registro`) VALUES
(10290001, '1', 4, 2, '2019-09-18 03:06:53'),
(10290002, '1', 4, 3, '2019-09-18 03:06:53'),
(10290003, '1', 5, 1, '2019-09-18 03:06:53'),
(10290004, '1', 5, 2, '2019-09-18 03:06:53'),
(10290005, '1', 6, 3, '2019-09-18 03:06:53'),
(10290006, '1', 6, 1, '2019-09-18 03:06:53'),
(10586974, '1', 5, 5, '2019-09-18 03:06:53'),
(10593365, '1', 4, 4, '2019-09-18 03:06:53'),
(10998989, '1', 6, 3, '2019-09-18 03:06:53'),
(63639696, '1', 6, 3, '2019-09-18 03:06:53'),
(70636363, '1', 6, 3, '2019-09-18 03:06:53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id` int(2) NOT NULL,
  `nombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id`, `nombre`) VALUES
(1, 'Administradores'),
(2, 'Alumnos'),
(3, 'Profesores');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tema`
--

CREATE TABLE `tema` (
  `idtema` int(11) NOT NULL,
  `descripcion` varchar(20) NOT NULL,
  `idcurso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tema`
--

INSERT INTO `tema` (`idtema`, `descripcion`, `idcurso`) VALUES
(1, 'Vectores', 2),
(2, 'Sucesiones Geometria', 5),
(3, 'Angulos', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `usuario` varchar(45) NOT NULL,
  `clave` varchar(45) NOT NULL,
  `estado` enum('1','0') NOT NULL DEFAULT '1',
  `rol_id` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `usuario`, `clave`, `estado`, `rol_id`) VALUES
(10101010, 'jgarcia', '123456', '1', 2),
(10101012, 'arojas', '123456', '1', 2),
(10101013, 'cgalarde', '123456', '1', 2),
(10101014, 'ramasifen', '123456', '1', 2),
(10101015, 'mjochatoma', '123456', '1', 2),
(10101016, 'mpalacios', '123456', '1', 2),
(10101022, 'lgarcia', '123456', '1', 2),
(10101023, 'orojas', '123456', '1', 2),
(10101055, 'ggarcia', '123456', '1', 2),
(10221015, 'ivilchez', '123456', '1', 2),
(10252525, 'jcanahualpa', '123456', '1', 2),
(10263720, 'hambia', '123456', '1', 3),
(10290001, 'aramirez', '123456', '1', 2),
(10290002, 'aaltamirano', '123456', '1', 2),
(10290003, 'rricra', '123456', '1', 2),
(10290004, 'jrojas', '123456', '1', 3),
(10290005, 'gnovoa', '123456', '1', 1),
(10290006, 'admin', '123456', '1', 1),
(10586974, 'jrojas2', '123456', '1', 3),
(10593365, 'nleon', '123456', '1', 3),
(11155811, 'JGovelan', '123456', '1', 2),
(11155889, 'AGavelan', '123456', '1', 2),
(20101012, 'sdiaz', '123456', '1', 2),
(20101055, 'cgranados', '123456', '1', 2),
(20585858, 'LGarcia', '123456', '1', 2),
(22101013, 'hheredia', '123456', '1', 2),
(22101014, 'psilva', '123456', '1', 2),
(25659844, 'JCabrera', '123456', '1', 2),
(70533423, 'IChoquehuanca', '123456', '1', 2),
(70558866, 'jarce', '123456', '1', 3),
(70636363, 'RAldave', '123456', '1', 3),
(70656960, 'cacuna', '123456', '1', 3),
(70656961, 'gaguado', '123456', '1', 2),
(90002111, 'JCabrera', '123456', '1', 2),
(90002525, 'LAmauta', '123456', '1', 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD PRIMARY KEY (`id`),
  ADD KEY `t_persona_id1_idx` (`id`),
  ADD KEY `t_nivelceguera_id1_idx` (`idnivelceguera`),
  ADD KEY `t_grado_id1_idx` (`idgrado`);

--
-- Indices de la tabla `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`idcurso`);

--
-- Indices de la tabla `ejercicio`
--
ALTER TABLE `ejercicio`
  ADD PRIMARY KEY (`idejercicio`);

--
-- Indices de la tabla `evaluacion`
--
ALTER TABLE `evaluacion`
  ADD PRIMARY KEY (`idevaluacion`);

--
-- Indices de la tabla `grado`
--
ALTER TABLE `grado`
  ADD PRIMARY KEY (`idgrado`);

--
-- Indices de la tabla `nivelceguera`
--
ALTER TABLE `nivelceguera`
  ADD PRIMARY KEY (`idnivelceguera`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `profesor`
--
ALTER TABLE `profesor`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tema`
--
ALTER TABLE `tema`
  ADD PRIMARY KEY (`idtema`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `t_persona_id3_idx` (`id`),
  ADD KEY `t_rol_id1_idx` (`rol_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ejercicio`
--
ALTER TABLE `ejercicio`
  MODIFY `idejercicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT de la tabla `evaluacion`
--
ALTER TABLE `evaluacion`
  MODIFY `idevaluacion` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

