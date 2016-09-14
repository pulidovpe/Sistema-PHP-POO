-- phpMyAdmin SQL Dump
-- version 3.4.11.1deb2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 28-05-2013 a las 16:22:53
-- Versión del servidor: 5.5.31
-- Versión de PHP: 5.4.4-14

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `ceunefa`
--
DROP DATABASE IF EXISTS `ceunefa`;
CREATE DATABASE `ceunefa` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `ceunefa`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignatura`
--

DROP TABLE IF EXISTS `asignatura`;
CREATE TABLE IF NOT EXISTS `asignatura` (
  `id_asig` smallint(6) NOT NULL AUTO_INCREMENT,
  `codigo_asig` varchar(10) CHARACTER SET utf8 NOT NULL COMMENT 'Codigo que aparece en el pensum de la carrera',
  `desc_asig` varchar(50) CHARACTER SET utf8 NOT NULL,
  `uc_asig` tinyint(4) NOT NULL,
  `horast_asig` tinyint(4) NOT NULL COMMENT 'Horas Teoricas',
  `horasp_asig` tinyint(4) NOT NULL COMMENT 'Horas Practicas',
  `horasl_asig` tinyint(4) NOT NULL COMMENT 'Horas de Laboratorio',
  `semestre_asig` tinyint(4) NOT NULL COMMENT 'Semestre al que corresponde la asignatura dependiendo del pensum',
  `id_pens_asig` tinyint(4) NOT NULL,
  `id_carr_asig` tinyint(4) NOT NULL,
  PRIMARY KEY (`id_asig`),
  UNIQUE KEY `id_pens_asig` (`id_pens_asig`),
  UNIQUE KEY `id_carr_asig` (`id_carr_asig`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Almacena asignaturas desglosadas por pensum y carrera' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asigsecc`
--

DROP TABLE IF EXISTS `asigsecc`;
CREATE TABLE IF NOT EXISTS `asigsecc` (
  `id_secc_asigsecc` smallint(6) NOT NULL,
  `id_asig_asigsecc` smallint(6) NOT NULL,
  `num_inscr_asigsecc` tinyint(4) NOT NULL,
  `id_profe_asigsecc` tinyint(4) NOT NULL,
  KEY `id_secc_asigsecc` (`id_secc_asigsecc`),
  KEY `id_asig_asigsecc` (`id_asig_asigsecc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aula`
--

DROP TABLE IF EXISTS `aula`;
CREATE TABLE IF NOT EXISTS `aula` (
  `id_aula` tinyint(4) NOT NULL AUTO_INCREMENT,
  `desc_aula` varchar(10) NOT NULL,
  `capac_aula` tinyint(4) NOT NULL,
  `ubica_aula` varchar(50) NOT NULL,
  PRIMARY KEY (`id_aula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrera`
--

DROP TABLE IF EXISTS `carrera`;
CREATE TABLE IF NOT EXISTS `carrera` (
  `id_carr` tinyint(4) NOT NULL COMMENT 'Pendiente por especificar tipo de dato',
  `desc_carr` varchar(50) NOT NULL,
  PRIMARY KEY (`id_carr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

DROP TABLE IF EXISTS `estudiante`;
CREATE TABLE IF NOT EXISTS `estudiante` (
  `n_identi_est` varchar(20) NOT NULL COMMENT 'contiene la identificacion del estudiante',
  `c_reside_est` tinyint(4) NOT NULL COMMENT 'condicion de residencia',
  `t_identi_est` char(1) NOT NULL,
  `m_ingreso_est` tinyint(4) NOT NULL,
  `f_ingreso_est` date NOT NULL,
  `u_periodoins_est` date NOT NULL,
  `turno_est` tinyint(4) NOT NULL,
  `n_ucapro_est` smallint(6) NOT NULL,
  `c_etnia_est` tinyint(4) NOT NULL,
  `becado_est` tinyint(1) NOT NULL,
  `p_libert_est` tinyint(1) NOT NULL,
  `condic_est` tinyint(4) NOT NULL,
  `n_rusnies_est` int(11) NOT NULL,
  `c_regimen_est` tinyint(4) NOT NULL,
  `nts_est` tinyint(4) NOT NULL,
  `id_carr_est` tinyint(4) NOT NULL COMMENT 'Id relaciona con la tabla carrera',
  `id_pens_est` tinyint(4) NOT NULL COMMENT 'Pensum asignado al estudiante relacionado con la tabla pensum',
  `activo_est` tinyint(1) NOT NULL COMMENT 'Activo o Inactivo',
  `graduado_est` char(1) NOT NULL COMMENT 'S - N',
  `p_grado_est` varchar(6) NOT NULL COMMENT 'Periodo de acto de grado ',
  `inscrito_est` tinyint(1) NOT NULL COMMENT 'Inscrito: Verdadero o falso',
  PRIMARY KEY (`n_identi_est`),
  UNIQUE KEY `id_carr_est` (`id_carr_est`),
  UNIQUE KEY `id_pens_est` (`id_pens_est`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `localidad`
--

DROP TABLE IF EXISTS `localidad`;
CREATE TABLE IF NOT EXISTS `localidad` (
  `id_local` tinyint(4) NOT NULL,
  `desc_local` varchar(50) NOT NULL,
  PRIMARY KEY (`id_local`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pais`
--

DROP TABLE IF EXISTS `pais`;
CREATE TABLE IF NOT EXISTS `pais` (
  `id_pais` tinyint(4) NOT NULL,
  `desc_pais` varchar(50) NOT NULL,
  `c_opsu_pais` smallint(6) NOT NULL,
  PRIMARY KEY (`id_pais`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pensum`
--

DROP TABLE IF EXISTS `pensum`;
CREATE TABLE IF NOT EXISTS `pensum` (
  `id_pens` tinyint(4) NOT NULL AUTO_INCREMENT,
  `anio_pens` varchar(4) CHARACTER SET utf8 NOT NULL COMMENT 'Año del pensum',
  `estatus_pens` tinyint(1) NOT NULL COMMENT 'Indica si esta activo o no',
  PRIMARY KEY (`id_pens`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

DROP TABLE IF EXISTS `persona`;
CREATE TABLE IF NOT EXISTS `persona` (
  `n_identi_per` varchar(20) NOT NULL COMMENT 'Cedula o Pasaporte',
  `p_nombre_per` varchar(25) NOT NULL,
  `s_nombre_per` varchar(25) NOT NULL,
  `t_nombre_per` varchar(25) NOT NULL,
  `p_apelli_per` varchar(25) NOT NULL,
  `s_apelli_per` varchar(25) NOT NULL,
  `c_paisnac_per` tinyint(4) NOT NULL,
  `c_reside_per` tinyint(4) NOT NULL,
  `genero_per` char(1) NOT NULL,
  `f_nacimi_per` date NOT NULL,
  `id_tper_per` tinyint(4) NOT NULL,
  `profesion_per` varchar(25) NOT NULL,
  `direcc_per` varchar(50) NOT NULL,
  `id_local_per` tinyint(4) NOT NULL,
  `telefono1_per` varchar(12) NOT NULL,
  `telefono2_per` varchar(12) NOT NULL,
  `correo_per` varchar(50) NOT NULL,
  `e_civil_per` varchar(10) NOT NULL COMMENT 'soltero, casado, concubino, viudo, otros',
  `n_hijos_per` tinyint(4) NOT NULL,
  UNIQUE KEY `id_local_per` (`id_local_per`),
  UNIQUE KEY `c_paisnac_per` (`c_paisnac_per`),
  UNIQUE KEY `id_tper_per` (`id_tper_per`),
  UNIQUE KEY `n_identi_per` (`n_identi_per`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesor`
--

DROP TABLE IF EXISTS `profesor`;
CREATE TABLE IF NOT EXISTS `profesor` (
  `n_identi_prof` varchar(20) NOT NULL COMMENT 'Cedula o Pasaporte',
  `catego_prof` varchar(15) NOT NULL COMMENT 'Auxiliar, Asistente, Agregado, Titular',
  `estatus_prof` tinyint(1) NOT NULL COMMENT 'Indica si el docente esta activo: V o F',
  PRIMARY KEY (`n_identi_prof`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seccion`
--

DROP TABLE IF EXISTS `seccion`;
CREATE TABLE IF NOT EXISTS `seccion` (
  `id_secc` smallint(6) NOT NULL AUTO_INCREMENT,
  `desc_secc` varchar(15) NOT NULL,
  `turno_secc` char(1) NOT NULL COMMENT 'M, T, N',
  `peraca_secc` varchar(6) NOT NULL,
  `bloq_secc` char(1) NOT NULL,
  `id_aula_secc` tinyint(4) NOT NULL,
  PRIMARY KEY (`id_secc`),
  UNIQUE KEY `id_aula_secc` (`id_aula_secc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_pers`
--

DROP TABLE IF EXISTS `tipo_pers`;
CREATE TABLE IF NOT EXISTS `tipo_pers` (
  `id_tper` tinyint(4) NOT NULL,
  `desc_tper` varchar(20) NOT NULL,
  PRIMARY KEY (`id_tper`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `id_usu` varchar(20) NOT NULL,
  `descrip_usu` varchar(25) NOT NULL,
  `clave_usu` varchar(256) NOT NULL,
  `activo` enum('S','N') NOT NULL DEFAULT 'N',
  `modulo01` enum('L','E','X') NOT NULL DEFAULT 'X',
  `modulo02` enum('L','E','X') NOT NULL DEFAULT 'X',
  `modulo03` enum('L','E','X') NOT NULL DEFAULT 'X',
  `modulo04` enum('L','E','X') NOT NULL DEFAULT 'X',
  `modulo05` enum('L','E','X') NOT NULL DEFAULT 'X',
  `modulo06` enum('L','E','X') NOT NULL DEFAULT 'X',
  `modulo07` enum('L','E','X') NOT NULL DEFAULT 'X',
  `modulo08` enum('L','E','X') NOT NULL DEFAULT 'X',
  `modulo09` enum('L','E','X') NOT NULL DEFAULT 'X',
  `modulo10` enum('L','E','X') NOT NULL DEFAULT 'X',
  `modulo11` enum('L','E','X') NOT NULL DEFAULT 'X',
  `modulo12` enum('L','E','X') NOT NULL DEFAULT 'X',
  `modulo13` enum('L','E','X') NOT NULL DEFAULT 'X',
  `modulo14` enum('L','E','X') NOT NULL DEFAULT 'X',
  `modulo15` enum('L','E','X') NOT NULL DEFAULT 'X',
  PRIMARY KEY (`id_usu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usu`, `descrip_usu`, `clave_usu`, `activo`, `modulo01`, `modulo02`, `modulo03`, `modulo04`, `modulo05`, `modulo06`, `modulo07`, `modulo08`, `modulo09`, `modulo10`, `modulo11`, `modulo12`, `modulo13`, `modulo14`, `modulo15`) VALUES
('12322677', 'Pablo Pulido', '202cb962ac59075b964b07152d234b70', 'S', 'E', 'X', 'E', 'L', 'E', 'X', 'E', 'L', 'E', 'X', 'E', 'L', 'E', 'X', 'E'),
('99009009', 'Usuario Administrativo', '202cb962ac59075b964b07152d234b70', 'N', 'X', 'E', 'L', 'E', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'L', 'L');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asignatura`
--
ALTER TABLE `asignatura`
  ADD CONSTRAINT `asignatura_ibfk_1` FOREIGN KEY (`id_carr_asig`) REFERENCES `carrera` (`id_carr`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `asignatura_ibfk_2` FOREIGN KEY (`id_pens_asig`) REFERENCES `pensum` (`id_pens`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `asigsecc`
--
ALTER TABLE `asigsecc`
  ADD CONSTRAINT `asigsecc_ibfk_1` FOREIGN KEY (`id_asig_asigsecc`) REFERENCES `asignatura` (`id_asig`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `asigsecc_ibfk_2` FOREIGN KEY (`id_secc_asigsecc`) REFERENCES `seccion` (`id_secc`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `carrera`
--
ALTER TABLE `carrera`
  ADD CONSTRAINT `carrera_ibfk_1` FOREIGN KEY (`id_carr`) REFERENCES `estudiante` (`id_carr_est`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD CONSTRAINT `estudiante_ibfk_1` FOREIGN KEY (`n_identi_est`) REFERENCES `persona` (`n_identi_per`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `localidad`
--
ALTER TABLE `localidad`
  ADD CONSTRAINT `localidad_ibfk_1` FOREIGN KEY (`id_local`) REFERENCES `persona` (`id_local_per`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pais`
--
ALTER TABLE `pais`
  ADD CONSTRAINT `pais_ibfk_1` FOREIGN KEY (`id_pais`) REFERENCES `persona` (`c_paisnac_per`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pensum`
--
ALTER TABLE `pensum`
  ADD CONSTRAINT `pensum_ibfk_1` FOREIGN KEY (`id_pens`) REFERENCES `estudiante` (`id_pens_est`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `profesor`
--
ALTER TABLE `profesor`
  ADD CONSTRAINT `profesor_ibfk_1` FOREIGN KEY (`n_identi_prof`) REFERENCES `persona` (`n_identi_per`);

--
-- Filtros para la tabla `seccion`
--
ALTER TABLE `seccion`
  ADD CONSTRAINT `seccion_ibfk_1` FOREIGN KEY (`id_aula_secc`) REFERENCES `aula` (`id_aula`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tipo_pers`
--
ALTER TABLE `tipo_pers`
  ADD CONSTRAINT `tipo_pers_ibfk_1` FOREIGN KEY (`id_tper`) REFERENCES `persona` (`id_tper_per`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
