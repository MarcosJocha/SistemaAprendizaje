-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-11-2018 a las 05:44:55
-- Versión del servidor: 5.6.20
-- Versión de PHP: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `bd_proyecto2`
--
CREATE SCHEMA IF NOT EXISTS `c0bd_proyecto2` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `c0bd_proyecto2`;

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_MODULOS_BY_USER`(IN `par_id_user` VARCHAR(11))
    DETERMINISTIC
BEGIN



	SELECT mm.id_modulo, m.descripcion, m.main_url

	FROM t_modulo_master mm 

		INNER JOIN t_modulo m ON m.id_modulo=mm.id_modulo

	WHERE mm.id_usuario=par_id_user AND mm.status=1;



END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GET_USUARIO`(IN `par_user` VARCHAR(45), IN `par_password` VARCHAR(150))
    DETERMINISTIC
BEGIN

    SELECT p.id, p.nombre, u.usuario, p.apellido_paterno, p.apellido_materno, u.estado

	FROM persona p 
		INNER JOIN usuario u ON p.id=u.id
	WHERE u.usuario=par_user and u.clave=par_password;

   
	SELECT u.rol_id
	FROM usuario u
	WHERE u.usuario=par_user AND u.estado=1;



END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno`
--

CREATE TABLE IF NOT EXISTS `alumno` (
  `id` int(11) NOT NULL,
  `estado` int(11) NOT NULL,
  `especialidad_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `alumno`
--

INSERT INTO `alumno` (`id`, `estado`, `especialidad_id`) VALUES
(1998127556, 1, 14),
(2003113740, 1, 14),
(2004142200, 1, 14),
(2004215188, 1, 14),
(2005204391, 1, 14),
(2006203180, 1, 14),
(2007112206, 1, 14),
(2007203516, 1, 14),
(2007227434, 1, 14),
(2008114524, 1, 14),
(2008119110, 1, 14),
(2008125000, 1, 14),
(2008215656, 1, 14),
(2008221014, 1, 14),
(2008230718, 1, 14),
(2009102972, 1, 14),
(2009207187, 1, 14),
(2009211741, 1, 14),
(2010106290, 1, 14),
(2010122241, 1, 14),
(2010128441, 1, 14),
(2010128442, 1, 14),
(2010128443, 1, 14),
(2010128444, 1, 14),
(2010128445, 1, 14),
(2010128446, 1, 14),
(2010128447, 1, 14),
(2010128448, 1, 14),
(2010128449, 1, 14),
(2010128450, 1, 14),
(2010128451, 1, 14),
(2010128452, 1, 14),
(2010128453, 1, 14),
(2010128454, 1, 14),
(2010128455, 1, 14),
(2010128456, 1, 14),
(2010128457, 1, 14),
(2010128458, 1, 14),
(2010128459, 1, 14),
(2010128460, 1, 14),
(2010128461, 1, 14),
(2010128462, 1, 14),
(2010128463, 1, 14),
(2010128464, 1, 14),
(2010128465, 1, 14),
(2010128466, 1, 14),
(2010128467, 1, 14),
(2010128468, 1, 14),
(2010128469, 1, 14),
(2010128470, 1, 14),
(2010128471, 1, 14),
(2010128472, 1, 14),
(2010128473, 1, 14),
(2010128474, 1, 14),
(2010128475, 1, 14),
(2010128476, 1, 14),
(2010128477, 1, 14),
(2010128478, 1, 14),
(2010128479, 1, 14),
(2010128480, 1, 14),
(2010128481, 1, 14),
(2010128482, 1, 14),
(2010128483, 1, 14),
(2010128484, 1, 14),
(2010128485, 1, 14),
(2010128486, 1, 14),
(2010128487, 1, 14),
(2010128488, 1, 14),
(2010128489, 1, 14),
(2010128490, 1, 14),
(2010128491, 1, 14),
(2010128492, 1, 14),
(2010128493, 1, 14),
(2010128494, 1, 14),
(2010128495, 1, 14),
(2010128496, 1, 14),
(2010128497, 1, 14),
(2010128498, 1, 14),
(2010128499, 1, 14),
(2010128500, 1, 14),
(2010128501, 1, 14),
(2010128502, 1, 14),
(2010128503, 1, 14),
(2010128504, 1, 14),
(2010128505, 1, 14),
(2010128506, 1, 14),
(2010128507, 1, 14),
(2010128508, 1, 14),
(2010128509, 1, 14),
(2010128510, 1, 14),
(2010128511, 1, 14),
(2010128512, 1, 14),
(2010128513, 1, 14),
(2010128514, 1, 14),
(2010128521, 1, 14),
(2010128522, 1, 14),
(2010128523, 1, 14),
(2010128524, 1, 14),
(2010132493, 1, 14),
(2010140301, 1, 14),
(2010205327, 1, 14),
(2010212242, 1, 14),
(2010500065, 1, 14),
(2011100732, 1, 14),
(2011114318, 1, 14),
(2011118421, 1, 14),
(2011118476, 1, 14),
(2011202404, 1, 14),
(2011208273, 1, 14),
(2011214630, 1, 14),
(2011226107, 1, 14),
(2011512092, 1, 14),
(2011512649, 1, 14),
(2012102846, 1, 14),
(2012104637, 1, 14),
(2012110276, 1, 14),
(2012110389, 1, 14),
(2012112646, 1, 14),
(2012112781, 1, 14),
(2012117231, 1, 14),
(2012117388, 1, 14),
(2012123201, 1, 14),
(2012123813, 1, 14),
(2012126710, 1, 14),
(2012128588, 1, 14),
(2012131323, 1, 14),
(2012134004, 1, 14),
(2012143050, 1, 14),
(2012144347, 1, 14),
(2012211295, 1, 14),
(2012211910, 1, 14),
(2012213563, 1, 14),
(2012217906, 1, 14),
(2012224129, 1, 14),
(2012224854, 1, 14),
(2012500940, 1, 14),
(2013100755, 1, 14),
(2013105985, 1, 14),
(2013108000, 1, 14),
(2013109567, 1, 14),
(2013111300, 1, 14),
(2013119775, 1, 14),
(2013126362, 1, 14),
(2013126974, 1, 14),
(2013132285, 1, 14),
(2013134666, 1, 14),
(2014150754, 1, 14),
(2015147396, 1, 14),
(2015222601, 1, 14);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documento`
--

CREATE TABLE IF NOT EXISTS `documento` (
`iddocumento` int(11) NOT NULL,
  `idprofesor` int(11) NOT NULL,
  `idalumno` int(11) NOT NULL,
  `idtipodocumento` int(11) NOT NULL,
  `fecharegistro` date NOT NULL,
  `archivo` blob NOT NULL,
  `estado` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `encargado`
--

CREATE TABLE IF NOT EXISTS `encargado` (
`idencargado` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido_paterno` varchar(50) NOT NULL,
  `apellido_materno` varchar(50) NOT NULL,
  `celular` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidad`
--

CREATE TABLE IF NOT EXISTS `especialidad` (
`id` int(3) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `id_facultad_id` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- Volcado de datos para la tabla `especialidad`
--

INSERT INTO `especialidad` (`id`, `nombre`, `id_facultad_id`) VALUES
(11, 'ARQUITECTURA', 5),
(12, 'CIENCIAS AERONAUTICAS', 5),
(13, 'INGENIERIA CIVIL', 5),
(14, 'INGENIERIA DE COMPUTACION Y SISTEMAS', 5),
(15, 'INGENIERIA ELECTRONICA', 5),
(16, 'INGENIERIA INDUSTRIAL', 5),
(17, 'INGENIERIA EN INDUSTRIAL ALIMENTARIAS', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `examen`
--

CREATE TABLE IF NOT EXISTS `examen` (
`idexamen` int(11) NOT NULL,
  `idprofesor` int(11) NOT NULL,
  `idalumno` int(11) NOT NULL,
  `idsolicitud` int(11) NOT NULL,
  `fechaini` date NOT NULL,
  `fechafin` date NOT NULL,
  `fecharegistro` date NOT NULL,
  `duracion` time NOT NULL,
  `nota` int(11) NOT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facultad`
--

CREATE TABLE IF NOT EXISTS `facultad` (
`id` int(11) NOT NULL,
  `descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Volcado de datos para la tabla `facultad`
--

INSERT INTO `facultad` (`id`, `descripcion`) VALUES
(1, 'Ciencias Administrativas y Recursos Humanos'),
(2, 'Ciencias de la Comunicación, Turismo y Psicología'),
(3, 'Ciencias Contables Económicas y Financieras'),
(4, 'Derecho'),
(5, 'Ingeniería y Arquitectura'),
(6, 'Obstetricia y Enfermería'),
(7, 'Medicina Humana'),
(8, 'Odontología'),
(9, 'Instituto para la Calidad de Educación '),
(10, 'Instituto de Arte'),
(11, 'Instituto de Gobierno y Gestión Pública');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modalidad`
--

CREATE TABLE IF NOT EXISTS `modalidad` (
`idmodalidad` int(11) NOT NULL,
  `nombre` varchar(26) NOT NULL,
  `descripcion` varchar(100) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `modalidad`
--

INSERT INTO `modalidad` (`idmodalidad`, `nombre`, `descripcion`) VALUES
(1, 'Practicas Efectivas', 'Modalidad para estudiantes que estaran baj regimen de practicas pre-profesionales'),
(2, 'Convalidacion por Trabajo', 'Modalidad para estudiantes que ya se encuentran laborando en alguna institucion publica o privada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE IF NOT EXISTS `persona` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido_paterno` varchar(50) NOT NULL,
  `apellido_materno` varchar(50) NOT NULL,
  `celular` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`id`, `nombre`, `apellido_paterno`, `apellido_materno`, `celular`) VALUES
(90001, 'William', 'Acosta', 'Acosta', '974626407'),
(90002, 'Carlos', 'Acuña', 'Flores', '974626407'),
(90003, 'Hugo', 'Ambia', 'Rebatta', '974626407'),
(90004, 'Jose', 'Arce', 'Matta', '974626407'),
(90005, 'Vivian', 'Ayres', 'Manrique', '974626407'),
(90006, 'Yudy', 'Balcazar', 'Hernandez', '974626407'),
(90007, 'Jose', 'Basile', 'Migliore', '974626407'),
(90008, 'Sussy', 'Bayona', 'Ore', '974626407'),
(90009, 'Augusto', 'Becerra', 'Pacheres', '974626407'),
(90010, 'Gladys', 'Benites', 'Gonzales', '974626407'),
(90011, 'Luis Fernando', 'Benites ', 'Vilela', '974626407'),
(90012, 'Carlos', 'Bernal', 'Ortiz', '974626407'),
(90013, 'Augusto Erne', 'Bernuy', 'Alva', '974626407'),
(90014, 'Carmen', 'Bertolotti', 'Zuñiga', '974626407'),
(90015, 'Yvan', 'Blanco', 'Zuñiga', '974626407'),
(90016, 'Ricardo', 'Cabrera', 'Iturria', '974626407'),
(90017, 'Manuel', 'Caceres', 'Lampen', '974626407'),
(90018, 'Hector', 'Caceres ', 'Echegaray', '974626407'),
(90019, 'Aldo', 'Canales', 'Bernal', '974626407'),
(90020, 'Jaime', 'Caparachin', 'Chuquihuaraca', '974626407'),
(90021, 'German', 'Cardenas', 'Zavala', '974626407'),
(90022, 'Guiter', 'Carpio', 'Delgado', '974626407'),
(90023, 'Pablo', 'Casma', 'Angulo', '974626407'),
(90024, 'Rodolfo', 'Castillo', 'Cavero', '974626407'),
(90025, 'Gustavo', 'Castillo', 'Sini', '974626407'),
(90026, 'Fredy Adan', 'Castro', 'Salazar', '974626407'),
(90027, 'Mario', 'Cerdan', 'Chavarry', '974626407'),
(90028, 'Eulogio', 'Cerron', 'Ruiz', '974626407'),
(90029, 'Jorge', 'Chue', 'Gallardo', '974626407'),
(90030, 'Javier', 'Cieza ', 'Davila', '974626407'),
(90031, 'Luis', 'Contreras', 'Villareal', '974626407'),
(90032, 'Ruben', 'Cuadros', 'Ricra', '974626407'),
(90033, 'Fresia', 'De La Vega', 'Picoaga', '974626407'),
(90034, 'Justo', 'De los Rios', 'Hermoza', '974626407'),
(90035, 'Silvia', 'Delgado', 'Contreras', '974626407'),
(90036, 'Ricardo', 'Dulanto', 'Ramirez', '974626407'),
(90037, 'Jorge', 'Figueroa', 'Revilla', '974626407'),
(90038, 'Gary', 'Galindo', 'Guerra', '974626407'),
(90039, 'Meri', 'Gallegos', 'Valderrama', '974626407'),
(90040, 'Alberto', 'Galloso', 'Gentille', '974626407'),
(90041, 'Javier', 'Gamboa', 'Cruzado', '974626407'),
(90042, 'Elva', 'Garcia', 'Flores', '974626407'),
(90043, 'Cesar', 'Garcia', 'Lorente', '974626407'),
(90044, 'Cecilio', 'Garrido', 'Schaeffer', '974626407'),
(90045, 'Mardiomar', 'Goicochea', 'Nañez', '974626407'),
(90046, 'Celso', 'Gonzales', 'Chavesta', '974626407'),
(90047, 'Waldy', 'Grandez', 'Pizarro', '974626407'),
(90048, 'Jose Luis', 'Gutierrez', 'Mantari', '974626407'),
(90049, 'Alfonso', 'Guzmán', 'Tasayco', '974626407'),
(90050, 'Jose', 'Haro', 'Bautista', '974626407'),
(90051, 'Hector', 'Henriquez', 'Taboada', '974626407'),
(90052, 'Juan', 'Huirse', 'Franco', '974626407'),
(90053, 'Norma ', 'Leon', 'Lescano', '974626407'),
(90054, 'Luis', 'Li', 'Perez', '974626407'),
(90055, 'Luis', 'Llatas', 'Martinez', '974626407'),
(90056, 'Jose', 'Londoña', 'Porras', '974626407'),
(90057, 'Mauricio', 'Marin', 'Boa', '974626407'),
(90058, 'Marco', 'Mayor', 'Ravines', '974626407'),
(90059, 'Ludvik Dani', 'Medic', 'Corrales', '974626407'),
(90060, 'Rosa', 'Menendez', 'Mueras', '974626407'),
(90061, 'Dany', 'Montoya', 'Negrillo', '974626407'),
(90062, 'Carmen', 'Monzon ', 'Monzon', '974626407'),
(90063, 'Ofelia', 'Nazario', 'Boa', '974626407'),
(90064, 'Luis', 'Palacio', 'Quichiz', '974626407'),
(90065, 'Carla', 'Palomino', 'Guerrero', '974626407'),
(90066, 'Juana', 'Paredes', 'Díaz', '974626407'),
(90067, 'Angel', 'Paredes', 'Nuñes', '974626407'),
(90068, 'Ana Milagros Janet', 'Quispe', 'Rodriguez', '974626407'),
(90069, 'Flor de maría', 'Quisperima', 'Huaman', '974626407'),
(90070, 'Marcos Hilari', 'Ramos', 'Blume', '974626407'),
(90071, 'Andrés', 'Ramos ', 'Salas ', '974626407'),
(90072, 'Victor', 'Ramos ', 'Guanilo', '974626407'),
(90073, 'Erick', 'Reyes', 'Martinez', '974626407'),
(90074, 'Luis', 'Roque', 'Vera', '974626407'),
(90075, 'Jose Hilarion', 'Rosales', 'Fernandez', '974626407'),
(90076, 'Norma', 'Rueda', 'Ñopo', '974626407'),
(90077, 'Luis', 'Salazar', 'Vilchez', '974626407'),
(90078, 'Everth', 'Salinas', 'Verano ', '974626407'),
(90079, 'Eddy', 'Sandoval', 'Vargas', '974626407'),
(90080, 'Sofia', 'Sosa', 'Meoño', '974626407'),
(90081, 'Gustavo', 'Tataje', 'Salas ', '974626407'),
(90082, 'Carlos', 'Torres ', 'Guevara', '974626407'),
(90083, 'Yamela', 'Valenzuela', 'Tazayco', '974626407'),
(90084, 'Lucia', 'Vargas', 'Fernandez', '974626407'),
(90085, 'Carlos', 'Vargas', 'Trujillo', '974626407'),
(90086, 'Ruben', 'Vasquez', 'Jara', '974626407'),
(90087, 'Raul', 'Velasco', 'Calzado', '974626407'),
(90088, 'Carlos', 'Wong', 'Rivera', '974626407'),
(90089, 'Jose', 'Wu', 'Chong', '974626407'),
(90090, ' Eiriku', 'Yamao', 'Yamao', '974626407'),
(90091, 'Gener ', 'Zambrano', 'Loli', '974626407'),
(1998127556, 'Maribel ', 'Mitta', 'Flores ', '974626407'),
(2003113740, 'Manuel ', 'Rios', 'Vasquez', '974626407'),
(2004142200, 'Luis', 'Zavaleta ', 'Anampa', '974626407'),
(2004215188, 'Jenny', 'Cachay', 'Matos', '974626407'),
(2005204391, 'Osmar ', 'Cangahuala', 'Pinto', '974626407'),
(2006203180, 'Franco ', 'Antunez ', 'De Mayolo', '974626407'),
(2007112206, 'Christian', 'Gavidia', 'Cuya', '974626407'),
(2007203516, 'Javier', 'Quilca ', 'Chambi', '974626407'),
(2007227434, ' Héctor Andrés', 'Aucasi', 'Pacasi', '974626407'),
(2008114524, 'Andrea ', 'Garcia ', 'Villar', '974626407'),
(2008119110, 'William Guissep', 'Vargas', 'Tipismana', '974626407'),
(2008125000, 'Jose luis', 'Manrique', 'Huamani', '974626407'),
(2008215656, 'Antony', 'Núñez', 'Santos', '974626407'),
(2008221014, ' Juan', ' Suarez ', 'Mateo', '974626407'),
(2008230718, 'Evert ', 'Vega ', 'Delgado', '974626407'),
(2009102972, 'Daniel Alberto', 'Jara', 'Reyes', '974626407'),
(2009207187, 'Luis ', 'Santa Maria ', 'Armas', '974626407'),
(2009211741, 'Cesar Arturo', 'Salhuana', 'Huaman', '974626407'),
(2010106290, 'Veronica ', 'Medina ', 'Esquivias ', '974626407'),
(2010122241, 'Roger ', 'Loayza ', 'Gonzalez', '974626407'),
(2010128441, 'Eduardo ', 'Zuñiga ', 'Santillan ', '974626407'),
(2010128442, 'Jean Pier', 'Bayona', 'Díaz', '974626407'),
(2010128443, 'Javier', 'Becerra', 'Nuñes', '974626407'),
(2010128444, 'William Guissep', 'Benites', 'Rodriguez', '974626407'),
(2010128445, 'Luis Alberto', 'Benites ', 'Huaman', '974626407'),
(2010128446, 'Erick', 'Bernal', 'Blume', '974626407'),
(2010128447, 'Andrés Francisco', 'Bernuy', 'Salas ', '974626407'),
(2010128448, 'Bianca Joanna', 'Bertolotti', 'Guanilo', '974626407'),
(2010128449, 'Brian Kevin', 'Blanco', 'Martinez', '974626407'),
(2010128450, 'Esteban Oliveras', 'Cabrera', 'Vera', '974626407'),
(2010128451, 'Marco Antonio', 'Caceres', 'Fernandez', '974626407'),
(2010128452, 'Gerson Gabriel', 'Caceres ', 'Ñopo', '974626407'),
(2010128453, 'Rhonnald', 'Canales', 'Vilchez', '974626407'),
(2010128454, 'Mijail Rafael', 'Caparachin', 'Verano ', '974626407'),
(2010128455, 'Cesar Arturo', 'Cardenas', 'Vargas', '974626407'),
(2010128456, 'Romario', 'Carpio', 'Meoño', '974626407'),
(2010128457, 'Daniel Alberto', 'Casma', 'Salas ', '974626407'),
(2010128458, 'Pedro Luis', 'Castillo', 'Guevara', '974626407'),
(2010128459, 'Milagros', 'Castillo', 'Tazayco', '974626407'),
(2010128460, 'Gino André', 'Castro', 'Fernandez', '974626407'),
(2010128461, 'Marco Antonio', 'Cerdan', 'Trujillo', '974626407'),
(2010128462, 'Jenny', 'Cerron', 'Jara', '974626407'),
(2010128463, 'Jorge', 'Chue', 'Calzado', '974626407'),
(2010128464, 'Gerardo', 'Cieza ', 'Rivera', '974626407'),
(2010128465, 'Rodrigo', 'Contreras', 'Chong', '974626407'),
(2010128466, 'William', 'Cuadros', 'Yamao', '974626407'),
(2010128467, 'Carlos', 'De La Vega', 'Loli', '974626407'),
(2010128468, 'Hugo', 'De los Rios', 'Quispe', '974626407'),
(2010128469, 'Jose', 'Delgado', 'Quisperima', '974626407'),
(2010128470, 'Vivian', 'Dulanto', 'Ramos', '974626407'),
(2010128471, 'Yudy', 'Figueroa', 'Ramos ', '974626407'),
(2010128472, 'Jose', 'Galindo', 'Ramos ', '974626407'),
(2010128473, 'Sussy', 'Gallegos', 'Reyes', '974626407'),
(2010128474, 'Augusto', 'Galloso', 'Roque', '974626407'),
(2010128475, 'Gladys', 'Gamboa', 'Rosales', '974626407'),
(2010128476, 'Luis Fernando', 'Garcia', 'Rueda', '974626407'),
(2010128477, 'Carlos', 'Garcia', 'Salazar', '974626407'),
(2010128478, 'Augusto Erne', 'Garrido', 'Salinas', '974626407'),
(2010128479, 'Carmen', 'Goicochea', 'Sandoval', '974626407'),
(2010128480, 'Yvan', 'Gonzales', 'Sosa', '974626407'),
(2010128481, 'Ricardo', 'Grandez', 'Tataje', '974626407'),
(2010128482, 'Manuel', 'Gutierrez', 'Torres ', '974626407'),
(2010128483, 'Hector', 'Guzmán', 'Valenzuela', '974626407'),
(2010128484, 'Aldo', 'Haro', 'Vargas', '974626407'),
(2010128485, 'Jaime', 'Henriquez', 'Vargas', '974626407'),
(2010128486, 'German', 'Huirse', 'Vasquez', '974626407'),
(2010128487, 'Guiter', 'Leon', 'Velasco', '974626407'),
(2010128488, 'Pablo', 'Li', 'Wong', '974626407'),
(2010128489, 'Rodolfo', 'Llatas', 'Wu', '974626407'),
(2010128490, 'Gustavo', 'Londoña', 'Yamao', '974626407'),
(2010128491, 'Fredy Adan', 'Marin', 'Zambrano', '974626407'),
(2010128492, 'Mario', 'Mayor', 'Caparachin', '974626407'),
(2010128493, 'Eulogio', 'Medic', 'Cardenas', '974626407'),
(2010128494, 'Jorge', 'Menendez', 'Carpio', '974626407'),
(2010128495, 'Javier', 'Montoya', 'Casma', '974626407'),
(2010128496, 'Luis', 'Monzon ', 'Castillo', '974626407'),
(2010128497, 'Ruben', 'Nazario', 'Castillo', '974626407'),
(2010128498, 'Fresia', 'Palacio', 'Castro', '974626407'),
(2010128499, 'Justo', 'Palomino', 'Cerdan', '974626407'),
(2010128500, 'Silvia', 'Paredes', 'Cerron', '974626407'),
(2010128501, 'Ricardo', 'Paredes', 'Chue', '974626407'),
(2010128502, 'Jorge', 'Quispe', 'Cieza ', '974626407'),
(2010128503, 'Gary', 'Quisperima', 'Contreras', '974626407'),
(2010128504, 'Meri', 'Ramos', 'Cuadros', '974626407'),
(2010128505, 'Alberto', 'Ramos ', 'De La Vega', '974626407'),
(2010128506, 'Javier', 'Ramos ', 'De los Rios', '974626407'),
(2010128507, 'Elva', 'Reyes', 'Delgado', '974626407'),
(2010128508, 'Cesar', 'Roque', 'Dulanto', '974626407'),
(2010128509, 'Cecilio', 'Rosales', 'Figueroa', '974626407'),
(2010128510, 'Mardiomar', 'Rueda', 'Galindo', '974626407'),
(2010128511, 'Celso', 'Salazar', 'Gallegos', '974626407'),
(2010128512, 'Waldy', 'Salinas', 'Galloso', '974626407'),
(2010128513, 'Jose Luis', 'Sandoval', 'Gamboa', '974626407'),
(2010128514, 'Alfonso', 'Sosa', 'Garcia', '974626407'),
(2010128521, 'Gian Franco', 'Vega', 'Simeon', '974626407'),
(2010128522, 'Juan Manuel', 'Vargas', 'Rodriguez', '974626407'),
(2010128523, 'Enrique', 'Iglesias', 'Inga', '974626407'),
(2010128524, 'Claudia Estefania', 'Lopez', 'Perez', '974626407'),
(2010132493, 'Luciano Gabriel', 'Agama', 'Román', '974626407'),
(2010140301, 'Luis ', 'Huamani', 'Bazan', '974626407'),
(2010205327, 'Josselyn ', 'Chamilco', 'Garcia', '974626407'),
(2010212242, 'Wilmer ', 'Ponce de Leon ', 'Florindez', '974626407'),
(2010500065, 'Carlos Arturo', 'Lee', 'Salazar', '974626407'),
(2011100732, 'Jean Carlo Jesús ', 'Vallejos', 'Pongo', '974626407'),
(2011114318, 'Pedro Marcelo', 'Soca', 'Valqui', '974626407'),
(2011118421, 'Brian Kevin', 'Huamaní', 'Hernandez', '974626407'),
(2011118476, 'Gino André', 'Anyosa', 'Quispe', '974626407'),
(2011202404, 'Gustavo Moisés', 'Tufiño', 'Fernández', '974626407'),
(2011208273, ' Roberto', 'Vega', 'Ortega', '974626407'),
(2011214630, 'Diego Gonzalo', 'Moscoso', 'Ricardi', '974626407'),
(2011226107, 'Ricardo', 'Garcia', 'Chavez', '974626407'),
(2011512092, 'Ivan Enrique', 'Zapata', 'Leyva', '974626407'),
(2011512649, 'Gian Carlo ', 'Rubio', 'Cunya', '974626407'),
(2012102846, 'Sandra Rita', 'Eyzaguirre', 'Mamani', '974626407'),
(2012104637, 'Gleyss ', 'Mandujano ', 'Ortiz', '974626407'),
(2012110276, 'Junior', 'Diaz', 'Briceño', '974626407'),
(2012110389, 'Esteban Oliveras', 'Quispe', 'Lopez', '974626407'),
(2012112646, 'Edgar Luis', 'Apestegui', 'Inocente', '974626407'),
(2012112781, 'William ', 'Luyo', 'Huertas', '974626407'),
(2012117231, 'Mijail Rafael', 'Rivera', 'Yanac', '974626407'),
(2012117388, 'Javier', 'Nakasone', 'Yara', '974626407'),
(2012123201, 'Rony', 'Quispe', 'Quispe', '974626407'),
(2012123813, 'Erick Anthony ', 'Paita ', 'Rodriguez', '974626407'),
(2012126710, 'Jorge', 'Flores', 'Flores', '974626407'),
(2012128588, 'Flavio', 'Calderòn', 'Torrejòn', '974626407'),
(2012131323, 'Jordy ', 'Alagon', 'Cumpa', '974626407'),
(2012134004, 'Luisa Fiorella', 'Morán ', 'Calixto', '974626407'),
(2012143050, 'Milagros', 'Santos', 'Torrejón', '974626407'),
(2012144347, 'Romario', 'Coronel', 'Alvarez', '974626407'),
(2012211295, 'Pedro Luis', 'Bermudez', 'Serna', '974626407'),
(2012211910, 'Veronica Elizabeth ', 'Castro', 'Ayarza', '974626407'),
(2012213563, ' Diego Emerson ', 'Sotecani', ' Huaman', '974626407'),
(2012217906, 'Gerson Gabriel', 'Tirado ', 'Pizarro', '974626407'),
(2012224129, 'Jean Pier', 'Barbieri', 'Rios', '974626407'),
(2012224854, 'Daniel Enrique', 'Curi', 'Montero', '974626407'),
(2012500940, 'Giancarlo ', 'Teque ', 'Llontop', '974626407'),
(2013100755, 'Romina Sofía', 'Osorio', 'Coronado', '974626407'),
(2013105985, 'Rodrigo', 'Winder', 'Flores', '974626407'),
(2013108000, 'Luis Alberto', 'Guerra', 'García', '974626407'),
(2013109567, 'Marco Antonio', 'Iberico', 'Vega', '974626407'),
(2013111300, 'Andrés Francisco', 'Sánchez ', 'Cornejo', '974626407'),
(2013119775, 'Samy ', 'Calle ', 'Torres', '974626407'),
(2013126362, 'Gerardo', 'Huapaya', 'Espinoza', '974626407'),
(2013126974, 'Rhonnald', 'Acevedo ', 'Martel', '974626407'),
(2013132285, 'Marco Antonio', 'Diaz', 'Zavala', '974626407'),
(2013134666, 'Bianca Joanna', 'Poma', 'Salvador', '974626407'),
(2014150754, 'Erick', 'Ramos', 'Chalán', '974626407'),
(2015147396, 'John Mauro', 'Duran ', 'Rodríguez', '974626407'),
(2015222601, 'Giancarlo', 'Aguado ', 'Polanco', '974626407');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preguntas`
--

CREATE TABLE IF NOT EXISTS `preguntas` (
`idpregunta` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `respuesta` varchar(100) DEFAULT NULL,
  `tiempo` date NOT NULL,
  `puntaje` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesor`
--

CREATE TABLE IF NOT EXISTS `profesor` (
  `id` int(11) NOT NULL,
  `p_pendientes` int(11) NOT NULL,
  `estado` enum('1','0','2') NOT NULL,
  `p_revisadas` int(11) NOT NULL,
  `disbonibilidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `profesor`
--

INSERT INTO `profesor` (`id`, `p_pendientes`, `estado`, `p_revisadas`, `disbonibilidad`) VALUES
(90001, 0, '1', 0, 0),
(90002, 0, '0', 0, 0),
(90003, 0, '2', 0, 0),
(90004, 0, '1', 0, 0),
(90005, 0, '1', 0, 0),
(90006, 0, '1', 0, 0),
(90007, 0, '1', 0, 0),
(90008, 0, '1', 0, 0),
(90009, 0, '1', 0, 0),
(90010, 0, '1', 0, 0),
(90011, 0, '1', 0, 0),
(90012, 0, '1', 0, 0),
(90013, 0, '1', 0, 0),
(90014, 0, '1', 0, 0),
(90015, 0, '1', 0, 0),
(90016, 0, '1', 0, 0),
(90017, 0, '1', 0, 0),
(90018, 0, '1', 0, 0),
(90019, 0, '0', 0, 0),
(90020, 0, '0', 0, 0),
(90021, 0, '0', 0, 0),
(90022, 0, '0', 0, 0),
(90023, 0, '1', 0, 0),
(90024, 0, '1', 0, 0),
(90025, 0, '1', 0, 0),
(90026, 0, '1', 0, 0),
(90027, 0, '1', 0, 0),
(90028, 0, '1', 0, 0),
(90029, 0, '1', 0, 0),
(90030, 0, '0', 0, 0),
(90031, 0, '1', 0, 0),
(90032, 0, '1', 0, 0),
(90033, 0, '1', 0, 0),
(90034, 0, '0', 0, 0),
(90035, 0, '1', 0, 0),
(90036, 0, '0', 0, 0),
(90037, 0, '1', 0, 0),
(90038, 0, '1', 0, 0),
(90039, 0, '1', 0, 0),
(90040, 0, '1', 0, 0),
(90041, 0, '0', 0, 0),
(90042, 0, '1', 0, 0),
(90043, 0, '0', 0, 0),
(90044, 0, '1', 0, 0),
(90045, 0, '1', 0, 0),
(90046, 0, '0', 0, 0),
(90047, 0, '1', 0, 0),
(90048, 0, '0', 0, 0),
(90049, 0, '0', 0, 0),
(90050, 0, '0', 0, 0),
(90051, 0, '0', 0, 0),
(90052, 0, '1', 0, 0),
(90053, 0, '1', 0, 0),
(90054, 0, '1', 0, 0),
(90055, 0, '0', 0, 0),
(90056, 0, '1', 0, 0),
(90057, 0, '0', 0, 0),
(90058, 0, '1', 0, 0),
(90059, 0, '1', 0, 0),
(90060, 0, '1', 0, 0),
(90061, 0, '1', 0, 0),
(90062, 0, '1', 0, 0),
(90063, 0, '0', 0, 0),
(90064, 0, '0', 0, 0),
(90065, 0, '1', 0, 0),
(90066, 0, '0', 0, 0),
(90067, 0, '1', 0, 0),
(90068, 0, '1', 0, 0),
(90069, 0, '0', 0, 0),
(90070, 0, '1', 0, 0),
(90071, 0, '1', 0, 0),
(90072, 0, '0', 0, 0),
(90073, 0, '0', 0, 0),
(90074, 0, '1', 0, 0),
(90075, 0, '0', 0, 0),
(90076, 0, '1', 0, 0),
(90077, 0, '1', 0, 0),
(90078, 0, '1', 0, 0),
(90079, 0, '1', 0, 0),
(90080, 0, '1', 0, 0),
(90081, 0, '0', 0, 0),
(90082, 0, '1', 0, 0),
(90083, 0, '1', 0, 0),
(90084, 0, '1', 0, 0),
(90085, 0, '1', 0, 0),
(90086, 0, '1', 0, 0),
(90087, 0, '1', 0, 0),
(90088, 0, '0', 0, 0),
(90089, 0, '0', 0, 0),
(90090, 0, '1', 0, 0),
(90091, 0, '1', 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE IF NOT EXISTS `rol` (
`id` int(2) NOT NULL,
  `nombre` varchar(45) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id`, `nombre`) VALUES
(1, 'Administradores'),
(2, 'Alumnos'),
(3, 'Profesores'),
(4, 'Desarrolladores');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitud`
--

CREATE TABLE IF NOT EXISTS `solicitud` (
`idsolicitud` int(11) NOT NULL,
  `idmodalidad` int(11) NOT NULL,
  `idempresa` int(11) NOT NULL,
  `idencargado` int(11) NOT NULL,
  `idalumno` int(11) NOT NULL,
  `cargo` varchar(30) DEFAULT NULL,
  `funciones` varchar(100) DEFAULT NULL,
  `fecharegistro` date NOT NULL,
  `fechaini` date NOT NULL,
  `fechafin` date NOT NULL,
  `estado` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
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
(90001, 'wacostaa', '123456', '1', 3),
(90002, 'cacuñaf', '123456', '1', 3),
(90003, 'hambiar', '123456', '1', 3),
(90004, 'jarcem', '123456', '1', 3),
(90005, 'vayresm', '123456', '1', 3),
(90006, 'ybalcazarh', '123456', '1', 3),
(90007, 'jbasilem', '123456', '1', 3),
(90008, 'lbayona', '123456', '1', 3),
(90009, 'abecerrap', '123456', '1', 3),
(90010, 'gbenitesg', '123456', '1', 3),
(90011, 'lbenites v', '123456', '1', 3),
(90012, 'cbernalo', '123456', '1', 3),
(90013, 'abernuya', '123456', '1', 3),
(90014, 'cbertolottiz', '123456', '1', 3),
(90015, 'yblancoz', '123456', '1', 3),
(90016, 'rcabrerai', '123456', '1', 3),
(90017, 'mcaceresl', '123456', '1', 3),
(90018, 'hcaceres e', '123456', '1', 3),
(90019, 'acanalesb', '123456', '1', 3),
(90020, 'jcaparachinc', '123456', '1', 3),
(90021, 'gcardenasz', '123456', '1', 3),
(90022, 'gcarpiod', '123456', '1', 3),
(90023, 'pcasmaa', '123456', '1', 3),
(90024, 'rcastilloc', '123456', '1', 3),
(90025, 'gcastillos', '123456', '1', 3),
(90026, 'fcastros', '123456', '1', 3),
(90027, 'mcerdanc', '123456', '1', 3),
(90028, 'ecerronr', '123456', '1', 3),
(90029, 'jchueg', '123456', '1', 3),
(90030, 'jcieza d', '123456', '1', 3),
(90031, 'lcontrerasv', '123456', '1', 3),
(90032, 'rcuadrosr', '123456', '1', 1),
(90033, 'fde la vegap', '123456', '1', 3),
(90034, 'jde los riosh', '123456', '1', 3),
(90035, 'sdelgadoc', '123456', '1', 3),
(90036, 'rdulantor', '123456', '1', 3),
(90037, 'jfigueroar', '123456', '1', 3),
(90038, 'ggalindog', '123456', '1', 3),
(90039, 'mgallegosv', '123456', '1', 3),
(90040, 'agallosog', '123456', '1', 3),
(90041, 'jgamboac', '123456', '1', 3),
(90042, 'egarciaf', '123456', '1', 3),
(90043, 'cgarcial', '123456', '1', 3),
(90044, 'cgarridos', '123456', '1', 3),
(90045, 'mgoicochean', '123456', '1', 3),
(90046, 'cgonzalesc', '123456', '1', 3),
(90047, 'wgrandezp', '123456', '1', 3),
(90048, 'jgutierrezm', '123456', '1', 3),
(90049, 'aguzmánt', '123456', '1', 3),
(90050, 'jharob', '123456', '1', 3),
(90051, 'hhenriquezt', '123456', '1', 3),
(90052, 'jhuirsef', '123456', '1', 3),
(90053, 'nleonl', '123456', '1', 3),
(90054, 'llip', '123456', '1', 3),
(90055, 'lllatasm', '123456', '1', 3),
(90056, 'jlondoñap', '123456', '1', 3),
(90057, 'mmarinb', '123456', '1', 3),
(90058, 'mmayorr', '123456', '1', 3),
(90060, 'rmenendezm', '123456', '1', 3),
(90061, 'dmontoyan', '123456', '1', 3),
(90062, 'cmonzon m', '123456', '1', 3),
(90063, 'onazariob', '123456', '1', 3),
(90064, 'lpalacioq', '123456', '1', 3),
(90065, 'cpalominog', '123456', '1', 3),
(90066, 'jparedesd', '123456', '1', 3),
(90067, 'aparedesn', '123456', '1', 3),
(90068, 'aquisper', '123456', '1', 3),
(90069, 'fquisperimah', '123456', '1', 3),
(90070, 'mramosb', '123456', '1', 3),
(90071, 'aramos', '123456', '1', 3),
(90072, 'vramos g', '123456', '1', 3),
(90073, 'ereyesm', '123456', '1', 3),
(90074, 'lroquev', '123456', '1', 3),
(90075, 'jrosalesf', '123456', '1', 3),
(90076, 'nruedañ', '123456', '1', 3),
(90077, 'lsalazarv', '123456', '1', 3),
(90078, 'esalinasv', '123456', '1', 3),
(90079, 'esandovalv', '123456', '1', 3),
(90080, 'ssosam', '123456', '1', 3),
(90081, 'gtatajes', '123456', '1', 3),
(90082, 'ctorres g', '123456', '1', 3),
(90083, 'yvalenzuelat', '123456', '1', 3),
(90084, 'lvargasf', '123456', '1', 3),
(90085, 'cvargast', '123456', '1', 3),
(90086, 'rvasquezj', '123456', '1', 3),
(90087, 'rvelascoc', '123456', '1', 3),
(90088, 'cwongr', '123456', '1', 3),
(90089, 'jwuc', '123456', '1', 3),
(90090, ' yamaoy', '123456', '1', 3),
(90091, 'gzambranol', '123456', '1', 3),
(1998127556, 'a98127556', '123456', '1', 4),
(2003113740, 'a03113740', '123456', '1', 2),
(2004142200, 'a04142200', '123456', '1', 2),
(2004215188, 'a04215188', '123456', '1', 2),
(2005204391, 'a05204391', '123456', '1', 2),
(2006203180, 'a06203180', '123456', '1', 2),
(2007112206, 'a07112206', '123456', '1', 3),
(2007203516, 'a07203516', '123456', '1', 2),
(2007227434, 'a07227434', '123456', '1', 2),
(2008114524, 'a08114524', '123456', '1', 4),
(2008119110, 'a08119110', '123456', '1', 2),
(2008125000, 'a08125000', '123456', '1', 2),
(2008215656, 'a08215656', '123456', '1', 2),
(2008221014, 'a08221014', '123456', '1', 2),
(2008230718, 'a08230718', '123456', '1', 4),
(2009102972, 'a09102972', '123456', '1', 2),
(2009207187, 'a09207187', '123456', '1', 2),
(2009211741, 'a09211741', '123456', '1', 2),
(2010106290, 'a10106290', '123456', '1', 4),
(2010122241, 'a10122241', '123456', '1', 2),
(2010128441, 'a10128441', '123456', '1', 2),
(2010132493, 'a10132493', '123456', '1', 2),
(2010140301, 'a10140301', '123456', '1', 2),
(2010205327, 'a10205327', '123456', '1', 2),
(2010212242, 'a10212242', '123456', '1', 2),
(2010500065, 'a10500065', '123456', '1', 2),
(2011100732, 'a11100732', '123456', '1', 2),
(2011114318, 'a11114318', '123456', '1', 2),
(2011118421, 'a11118421', '123456', '1', 4),
(2011118476, 'a11118476', '123456', '1', 2),
(2011202404, 'a11202404', '123456', '1', 2),
(2011208273, 'a11208273', '123456', '1', 2),
(2011214630, 'a11214630', '123456', '1', 2),
(2011226107, 'a11226107', '123456', '1', 4),
(2011512092, 'a11512092', '123456', '1', 2),
(2011512649, 'a11512649', '123456', '1', 2),
(2012102846, 'a12102846', '123456', '1', 2),
(2012104637, 'a12104637', '123456', '1', 2),
(2012110276, 'a12110276', '123456', '1', 4),
(2012110389, 'a12110389', '123456', '1', 2),
(2012112646, 'a12112646', '123456', '1', 2),
(2012112781, 'a12112781', '123456', '1', 2),
(2012117231, 'a12117231', '123456', '1', 2),
(2012117388, 'a12117388', '123456', '1', 2),
(2012123201, 'a012123201', '123456', '1', 2),
(2012123813, 'a12123813', '123456', '1', 2),
(2012126710, 'a12126710', '123456', '1', 2),
(2012128588, 'a12128588', '123456', '1', 2),
(2012131323, 'a12131323', '123456', '1', 2),
(2012134004, 'a12134004', '123456', '1', 2),
(2012143050, 'a12143050', '123456', '1', 2),
(2012144347, 'a12144347', '123456', '1', 2),
(2012211295, 'a12211295', '123456', '1', 2),
(2012211910, 'a12211910', '123456', '1', 2),
(2012213563, 'a12213563', '123456', '1', 2),
(2012217906, 'a12217906', '123456', '1', 2),
(2012224129, 'a12224129', '123456', '1', 4),
(2012224854, 'a12224854', '123456', '1', 4),
(2012500940, 'a12500940', '123456', '1', 4),
(2013100755, 'a13100755', '123456', '1', 2),
(2013105985, 'a13105985', '123456', '1', 2),
(2013108000, 'a13108000', '123456', '1', 2),
(2013109567, 'a13109567', '123456', '1', 2),
(2013111300, 'a13111300', '123456', '1', 2),
(2013119775, 'a13119775', '123456', '1', 2),
(2013126362, 'a13126362', '123456', '1', 2),
(2013126974, 'a13126974', '123456', '1', 4),
(2013132285, 'a13132285', '123456', '1', 2),
(2013134666, 'a13134666', '123456', '1', 2),
(2014150754, 'a14150754', '123456', '1', 2),
(2015147396, 'a15147396', '123456', '1', 2),
(2015222601, 'a15222601', '123456', '1', 4);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumno`
--
ALTER TABLE `alumno`
 ADD PRIMARY KEY (`id`), ADD KEY `t_persona_id1_idx` (`id`), ADD KEY `t_especialidad_id1_idx` (`especialidad_id`);

--
-- Indices de la tabla `documento`
--
ALTER TABLE `documento`
 ADD PRIMARY KEY (`iddocumento`);

--
-- Indices de la tabla `encargado`
--
ALTER TABLE `encargado`
 ADD PRIMARY KEY (`idencargado`);

--
-- Indices de la tabla `especialidad`
--
ALTER TABLE `especialidad`
 ADD PRIMARY KEY (`id`), ADD KEY `t_facultad_id1_idx` (`id_facultad_id`);

--
-- Indices de la tabla `examen`
--
ALTER TABLE `examen`
 ADD PRIMARY KEY (`idexamen`);

--
-- Indices de la tabla `facultad`
--
ALTER TABLE `facultad`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `modalidad`
--
ALTER TABLE `modalidad`
 ADD PRIMARY KEY (`idmodalidad`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `preguntas`
--
ALTER TABLE `preguntas`
 ADD PRIMARY KEY (`idpregunta`);

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
-- Indices de la tabla `solicitud`
--
ALTER TABLE `solicitud`
 ADD PRIMARY KEY (`idsolicitud`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
 ADD PRIMARY KEY (`id`), ADD KEY `t_persona_id3_idx` (`id`), ADD KEY `t_rol_id1_idx` (`rol_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `documento`
--
ALTER TABLE `documento`
MODIFY `iddocumento` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `encargado`
--
ALTER TABLE `encargado`
MODIFY `idencargado` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `especialidad`
--
ALTER TABLE `especialidad`
MODIFY `id` int(3) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT de la tabla `examen`
--
ALTER TABLE `examen`
MODIFY `idexamen` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `facultad`
--
ALTER TABLE `facultad`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT de la tabla `modalidad`
--
ALTER TABLE `modalidad`
MODIFY `idmodalidad` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `preguntas`
--
ALTER TABLE `preguntas`
MODIFY `idpregunta` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
MODIFY `id` int(2) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `solicitud`
--
ALTER TABLE `solicitud`
MODIFY `idsolicitud` int(11) NOT NULL AUTO_INCREMENT;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alumno`
--
ALTER TABLE `alumno`
ADD CONSTRAINT `t_especialidad_id1` FOREIGN KEY (`especialidad_id`) REFERENCES `especialidad` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `t_persona_id1` FOREIGN KEY (`id`) REFERENCES `persona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `especialidad`
--
ALTER TABLE `especialidad`
ADD CONSTRAINT `t_facultad_id1` FOREIGN KEY (`id_facultad_id`) REFERENCES `facultad` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `profesor`
--
ALTER TABLE `profesor`
ADD CONSTRAINT `t_persona_id5` FOREIGN KEY (`id`) REFERENCES `persona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
ADD CONSTRAINT `t_persona_id3` FOREIGN KEY (`id`) REFERENCES `persona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `t_rol_id1` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
