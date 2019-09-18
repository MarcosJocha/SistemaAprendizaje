CREATE SCHEMA IF NOT EXISTS `bd_sistemaaprendizaje` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `bd_sistemaaprendizaje`;
-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 18, 2019 at 11:33 AM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bd_sistemaaprendizaje`
--

DELIMITER $$
--
-- Procedures
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
-- Table structure for table `alumno`
--

CREATE TABLE `alumno` (
  `id` int(11) NOT NULL,
  `estado` int(11) NOT NULL,
  `idnivelceguera` int(11) NOT NULL,
  `idgrado` int(11) NOT NULL,
  `fecha_registro` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `alumno`
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
(10221015, 1, 3, 3, '2019-09-17 00:00:00'),
(10252525, 1, 1, 5, '2019-09-17 00:00:00'),
(10263720, 1, 1, 5, '2019-06-10 00:00:00'),
(11155811, 1, 2, 4, '2019-09-18 00:00:00'),
(11155889, 1, 2, 4, '2019-09-18 00:00:00'),
(20101012, 1, 1, 3, '2019-09-17 00:00:00'),
(20101055, 1, 2, 3, '2019-09-17 00:00:00'),
(20202088, 1, 1, 1, '2019-09-18 00:00:00'),
(20585858, 1, 3, 4, '2019-09-18 00:00:00'),
(22101013, 1, 1, 3, '2019-09-17 00:00:00'),
(22101014, 1, 3, 3, '2019-09-17 00:00:00'),
(25659844, 1, 2, 4, '2019-09-18 00:00:00'),
(70558866, 1, 10, 5, '2019-06-10 00:00:00'),
(70656960, 1, 2, 5, '2019-06-10 00:00:00'),
(70656961, 1, 14, 5, '2019-06-10 00:00:00'),
(90002111, 1, 2, 3, '2019-09-18 00:00:00'),
(90002525, 1, 2, 5, '2019-09-18 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `curso`
--

CREATE TABLE `curso` (
  `idcurso` int(3) NOT NULL,
  `descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `curso`
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
-- Table structure for table `ejercicio`
--

CREATE TABLE `ejercicio` (
  `idejercicio` int(11) NOT NULL,
  `idcurso` int(11) NOT NULL,
  `idgrado` int(11) NOT NULL,
  `idtema` int(11) NOT NULL,
  `PuntajeTotal` int(11) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `namejsp` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ejercicio`
--

INSERT INTO `ejercicio` (`idejercicio`, `idcurso`, `idgrado`, `idtema`, `PuntajeTotal`, `descripcion`, `namejsp`) VALUES
(1, 4, 5, 3, 20, 'Ejercicios de angulos', 'ejercicio1_4_5_3'),
(2, 4, 5, 3, 20, 'Ejercicio de Pitagoras', 'ejercicio2_4_5_3'),
(3, 4, 5, 3, 20, 'Ejercicio Triangulo Rectangulo', 'ejercicio3_4_5_3'),
(4, 4, 5, 3, 20, 'Ejercicio Angulos agudos', 'ejercicio4_4_5_3'),
(5, 4, 5, 3, 20, 'Ejercicio Angulos Obtusos', 'ejercicio5_4_5_3'),
(6, 4, 5, 3, 20, 'Ejercicio Complementos', 'ejercicio6_4_5_3'),
(7, 4, 5, 2, 20, 'Ejercicio Sucesiones de Figuras', 'ejercicio7_4_5_3'),
(8, 4, 5, 2, 20, 'Ejercicio Sumatorias', 'ejercicio8_4_5_3'),
(9, 4, 5, 2, 20, 'Ejercicio Sucesiones de Numeros', 'ejercicio9_4_5_3'),
(10, 4, 5, 2, 20, 'Ejercicio de Sucesion Geometrica', 'ejercicio10_4_5_3'),
(11, 4, 5, 3, 20, 'Ejercicio de Sucesion Geometrica', 'ejercicio11_4_5_3');

-- --------------------------------------------------------

--
-- Table structure for table `evaluacion`
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
-- Dumping data for table `evaluacion`
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
(10, 10, 10101015, 2, '2019-09-18', 13);

-- --------------------------------------------------------

--
-- Table structure for table `grado`
--

CREATE TABLE `grado` (
  `idgrado` int(3) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `nivel` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `grado`
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
-- Table structure for table `gradoxcurso`
--

CREATE TABLE `gradoxcurso` (
  `idgrado` int(3) NOT NULL,
  `idcurso` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gradoxcurso`
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
-- Table structure for table `nivelceguera`
--

CREATE TABLE `nivelceguera` (
  `idnivelceguera` int(3) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `puntaje` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `nivelceguera`
--

INSERT INTO `nivelceguera` (`idnivelceguera`, `nombre`, `puntaje`) VALUES
(1, 'Severa', 20),
(2, 'Intermedia', 100),
(3, 'Aguda', 150);

-- --------------------------------------------------------

--
-- Table structure for table `persona`
--

CREATE TABLE `persona` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido_paterno` varchar(50) NOT NULL,
  `apellido_materno` varchar(50) NOT NULL,
  `celular` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `persona`
--

INSERT INTO `persona` (`id`, `nombre`, `apellido_paterno`, `apellido_materno`, `celular`) VALUES
(10101010, 'Jose', 'Garcia', 'Morelia', '999998781'),
(10101012, 'Ana', 'Rojas', 'Morelia', '999998781'),
(10101013, 'Carlos', 'Galarde', 'Morelia', '999998781'),
(10101014, 'Ricardo', 'Amasifen', 'Palacios', '999998781'),
(10101015, 'Joshua', 'Esteban', 'Castro', '999998781'),
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
(10290006, 'Jean Franz', 'Cordova', 'Rojas', '974626407'),
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
(70558866, 'Jose', 'Arce', 'Matta', '974626407'),
(70636363, 'Ricardo', 'Aldave', 'Caparachin', '999888756'),
(70656960, 'Carlos', 'Acuña', 'Flores', '974626407'),
(70656961, 'Giancarlo', 'Aguado ', 'Polanco', '974626407'),
(90002111, 'Julio', 'Cabrera', 'Gaspar', '999888756'),
(90002525, 'Luisa', 'Amauta', 'Caparachin', '902584587');

-- --------------------------------------------------------

--
-- Table structure for table `profesor`
--

CREATE TABLE `profesor` (
  `id` int(11) NOT NULL,
  `estado` enum('1','0','2') NOT NULL,
  `idgrado` int(11) NOT NULL,
  `idcurso` int(11) NOT NULL,
  `fecha_registro` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `profesor`
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
-- Table structure for table `rol`
--

CREATE TABLE `rol` (
  `id` int(2) NOT NULL,
  `nombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rol`
--

INSERT INTO `rol` (`id`, `nombre`) VALUES
(1, 'Administradores'),
(2, 'Alumnos'),
(3, 'Profesores');

-- --------------------------------------------------------

--
-- Table structure for table `tema`
--

CREATE TABLE `tema` (
  `idtema` int(11) NOT NULL,
  `descripcion` varchar(20) NOT NULL,
  `idcurso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tema`
--

INSERT INTO `tema` (`idtema`, `descripcion`, `idcurso`) VALUES
(1, 'Vectores', 2),
(2, 'Sucesiones Geometria', 5),
(3, 'Angulos', 2);

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `usuario` varchar(45) NOT NULL,
  `clave` varchar(45) NOT NULL,
  `estado` enum('1','0') NOT NULL DEFAULT '1',
  `rol_id` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`id`, `usuario`, `clave`, `estado`, `rol_id`) VALUES
(10101010, 'jgarcia', '123456', '1', 2),
(10101012, 'arojas', '123456', '1', 2),
(10101013, 'cgalarde', '123456', '1', 2),
(10101014, 'ramasifen', '123456', '1', 2),
(10101015, 'jesteban', '123456', '1', 2),
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
(70558866, 'jarce', '123456', '1', 3),
(70636363, 'RAldave', '123456', '1', 3),
(70656960, 'cacuna', '123456', '1', 3),
(70656961, 'gaguado', '123456', '1', 2),
(90002111, 'JCabrera', '123456', '1', 2),
(90002525, 'LAmauta', '123456', '1', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alumno`
--
ALTER TABLE `alumno`
  ADD PRIMARY KEY (`id`),
  ADD KEY `t_persona_id1_idx` (`id`),
  ADD KEY `t_nivelceguera_id1_idx` (`idnivelceguera`),
  ADD KEY `t_grado_id1_idx` (`idgrado`);

--
-- Indexes for table `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`idcurso`);

--
-- Indexes for table `ejercicio`
--
ALTER TABLE `ejercicio`
  ADD PRIMARY KEY (`idejercicio`);

--
-- Indexes for table `evaluacion`
--
ALTER TABLE `evaluacion`
  ADD PRIMARY KEY (`idevaluacion`);

--
-- Indexes for table `grado`
--
ALTER TABLE `grado`
  ADD PRIMARY KEY (`idgrado`);

--
-- Indexes for table `nivelceguera`
--
ALTER TABLE `nivelceguera`
  ADD PRIMARY KEY (`idnivelceguera`);

--
-- Indexes for table `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profesor`
--
ALTER TABLE `profesor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tema`
--
ALTER TABLE `tema`
  ADD PRIMARY KEY (`idtema`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `t_persona_id3_idx` (`id`),
  ADD KEY `t_rol_id1_idx` (`rol_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ejercicio`
--
ALTER TABLE `ejercicio`
  MODIFY `idejercicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `evaluacion`
--
ALTER TABLE `evaluacion`
  MODIFY `idevaluacion` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
