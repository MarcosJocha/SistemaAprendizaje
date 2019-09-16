CREATE SCHEMA IF NOT EXISTS `bd_SistemaAprendizaje` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `bd_SistemaAprendizaje`;

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
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno`
--

CREATE TABLE IF NOT EXISTS `alumno` (
  `id` int(11) NOT NULL,
  `estado` int(11) NOT NULL,
  `nivelceguera_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `alumno`
--

INSERT INTO `alumno` (`id`, `estado`, `nivelceguera_id`) VALUES
(70656961, 1, 14),
(70656960, 1, 12),
(10263720, 1, 11),
(70558866, 1, 10);

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

INSERT INTO `profesor` (`id`, `p_pendientes`, `estado`, `p_revisadas`, `disponibilidad`) VALUES
(10290001, 0, '1', 0, 0),
(10290002, 0, '0', 0, 0),
(10290003, 0, '2', 0, 0),
(10290004, 0, '1', 0, 0),
(10290005, 0, '1', 0, 0),
(10290006, 0, '1', 0, 0);

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
(70656961, 'Giancarlo', 'Aguado ', 'Polanco', '974626407'),
(70656960, 'Carlos', 'Acuña', 'Flores', '974626407'),
(10263720, 'Hugo', 'Ambia', 'Rebatta', '974626407'),
(70558866, 'Jose', 'Arce', 'Matta', '974626407'),
(10290001, 'Alvaro','Ramirez','Arce','974626407'),
(10290002, 'Augusto','Altamirano','Ponce','974626407'),
(10290003, 'Ricardo','ricra','torres','974626407'),
(10290004, 'Jose','Rojas','Caceres','974626407'),
(10290005, 'Gustavo','Novoa','Evaristo','974626407'),
(10290006, 'Jean Franz','Cordova','Rojas','974626407');



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
(70656961, 'gaguado', '123456', '1', 3),
(70656960, 'cacuna', '123456', '1', 3),
(10263720, 'hambia', '123456', '1', 3),
(70558866, 'jarce', '123456', '1', 3),
(10290001,'aramirez', '123456', '1', 2),
(10290002, 'aaltamirano', '123456', '1', 2),
(10290003, 'rricra', '123456', '1', 2),
(10290004, 'jrojas', '123456', '1', 2),
(10290005,'gnovoa', '123456', '1', 1),
(10290006, 'jcordova', '123456', '1', 1);



--
-- Estructura de tabla para la tabla `documento`
--

CREATE TABLE IF NOT EXISTS `evaluacion` (
`idevaluacion` int(11) NOT NULL,
  `idprofesor` int(11) NOT NULL,
  `idalumno` int(11) NOT NULL,
  `idtipoevaluacion` int(11) NOT NULL,
  `fecharegistro` date NOT NULL,
  `archivo` blob NOT NULL,
  `estado` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidad`
--

CREATE TABLE IF NOT EXISTS `nivelceguera` (
`idnivelceguera` int(3) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `puntaje` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Volcado de datos para la tabla `especialidad`
--

INSERT INTO `especialidad` (`idnivelceguera`, `nombre`, `puntaje`) VALUES
(11, 'Severa', 20),
(12, 'Intermedia',100),
(13, 'Aguda', 150),

-- --------------------------------------------------------



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
-- Indices de la tabla `examen`
--
ALTER TABLE `examen`
 ADD PRIMARY KEY (`idexamen`);


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
-- AUTO_INCREMENT de la tabla `examen`
--
ALTER TABLE `examen`
MODIFY `idexamen` int(11) NOT NULL AUTO_INCREMENT;

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
ADD CONSTRAINT `t_persona_id1` FOREIGN KEY (`id`) REFERENCES `persona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;


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
