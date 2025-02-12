-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 10-02-2025 a las 16:40:40
-- Versión del servidor: 8.0.30
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dblogin`
--
-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `allusers`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `allusers` (
`user` varchar(20)
,`pass` varchar(40)
,`Estado` tinyint(1)
,`userId` int
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catpersons`
--

CREATE TABLE `catpersons` (
  `personId` int NOT NULL,
  `personName` varchar(50) NOT NULL,
  `personLName` varchar(80) DEFAULT NULL,
  `personEmail` varchar(150) NOT NULL,
  `personPhone` varchar(20) NOT NULL,
  `dtCreatedAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `bActive` bit(1) DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `catpersons`
--

INSERT INTO `catpersons` (`personId`, `personName`, `personLName`, `personEmail`, `personPhone`, `dtCreatedAt`, `bActive`) VALUES
(1, 'Super Admin', 'Sistema', 'laboratorios_ti@utem.edu.mx', '3140000001', '2023-05-24 13:55:39', b'1'),
(2, 'Administrador', 'Biblioteca', 'admin-biblio@utem.edu.mx', '3140000002', '2023-05-24 13:55:39', b'1'),
(3, 'Director', 'Carrera TI', 'direccion-ti@utem.edu.mx', '3140000003', '2023-05-24 13:55:39', b'1'),
(4, 'Docente', 'TI', 'docente-ti@utem.edu.mx', '3140000004', '2023-05-24 13:55:39', b'1'),
(5, 'Alumno', 'Pruebas1', 'a20230001@utem.edu.mx', '3140000005', '2023-05-24 13:55:39', b'1'),
(6, 'Externo', 'CETis', 'laboratorios_ti@utem.edu.mx', '3140000006', '2023-05-24 13:55:39', b'1'),
(7, 'Juan', 'Fernandez', 'iscjuanmafa@gmail.com', '3122100436', '2023-09-28 13:02:04', b'1'),
(8, 'Juan Manuel', 'Fernández Alvarez', 'manuel-fernandez@utem.edu.mx', '3122100436', '2023-09-28 13:14:27', b'1'),
(9, 'Pedro', 'Gonzalez', 'pedro_gon@algo.comn', '1234567890', '2023-09-28 13:18:57', b'1'),
(10, 'Damian', 'Hernandez', 'dam@algo.com', '3142345678', '2023-09-28 13:26:01', b'1'),
(11, 'Susana Guadalupe', 'Fernández Alvarez', 'susana@algo.com', '1234567890', '2024-06-07 12:38:15', b'1'),
(12, 'Juan Manuel', 'Fernández Alvarez', 'FEAJ850930GV1', '3122100436', '2024-06-13 12:18:54', b'1'),
(13, 'Juan Manuel', 'Fernández Alvarez', 'FEAJ850930GV1', '3122100436', '2024-06-13 12:19:16', b'1'),
(14, 'Juan Manuel', 'Fernández Alvarez', 'FEAJ850930GV1', '3122100436', '2024-06-13 12:20:18', b'1'),
(15, 'Juan Manuel', 'Fernández Alvarez', 'FEAJ850930GV1', '3122100436', '2024-06-13 12:22:20', b'1'),
(16, 'Juan Manuel', 'Fernández Alvarez', 'FEAJ850930GV1', '3122100436', '2024-06-13 12:24:58', b'1'),
(17, 'JUAN MANUEL', 'FERNANDEZ ALVAREZ', 'msc_juanmafa@hotmail.com', '3212100437', '2024-06-14 00:19:37', b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catusers`
--

CREATE TABLE `catusers` (
  `userId` int NOT NULL,
  `fk_personId` int DEFAULT NULL,
  `fk_UserTypeId` int DEFAULT NULL,
  `cveUser` varchar(20) NOT NULL,
  `userPass` varchar(50) NOT NULL,
  `departament` varchar(50) DEFAULT NULL,
  `groupStdnt` varchar(20) DEFAULT NULL,
  `career` varchar(100) DEFAULT NULL,
  `dependence` varchar(200) DEFAULT NULL,
  `dtCreatedAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `bActive` bit(1) DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `catusers`
--

INSERT INTO `catusers` (`userId`, `fk_personId`, `fk_UserTypeId`, `cveUser`, `userPass`, `departament`, `groupStdnt`, `career`, `dependence`, `dtCreatedAt`, `bActive`) VALUES
(1, 1, 1, 'ADMIN001', 'admin123', 'Sistemas', ' ', ' ', ' ', '2023-05-24 14:00:39', b'1'),
(2, 2, 2, 'ADBI001', 'admin2023', 'Servicios Escolares', '', '', '', '2023-05-24 14:00:39', b'1'),
(4, 3, 3, 'DCTI0012', 'director2023', 'Dirección Académica', '', 'TSU e ING en TI', '', '2023-05-24 14:00:39', b'1'),
(5, 4, 4, 'PTC180399', 'docente2023', 'Dirección Académica', '', 'ING en TI', '', '2023-05-24 14:00:39', b'1'),
(6, 5, 5, 'AL20230001', 'alumno2023', 'Escolares/Académico', '3TID1', 'TSU en TI', '', '2023-05-24 14:00:39', b'1'),
(7, 6, 6, 'EX20230001', 'externo2023', '', '', '', 'CEtis', '2023-05-24 14:00:39', b'1'),
(8, 1, 3, 'user2023', '07215ef5d2943dad30887d55e0cc3074', 'Sociales', '3TID2', 'TIC', 'UTEM', '2023-06-07 09:55:00', b'1'),
(9, 7, 1, 'FEJU2309', '23f9378b21fc2837a62e0e0ed025e689', 'acad', '1TID1', 'TSU en TI', 'UTeM', '2023-09-28 13:02:04', b'1'),
(10, 8, 4, 'FEJU2309', '23f9378b21fc2837a62e0e0ed025e689', 'Académico', '1TID1', 'TSU en TI', 'UTeM', '2023-09-28 13:14:27', b'1'),
(11, 9, 6, 'GOPE2309', 'f955f90118e99d8ce5585095a43d2fa9', 'Recursos Humanos', 'NA', 'NA', 'ASIPONA', '2023-09-28 13:18:57', b'1'),
(12, 10, 3, 'HEDA2309', 'b8e448e111fb659c1cee7c2625505ed5', 'Escolares', 'NA', 'NA', 'UTeM', '2023-09-28 13:26:01', b'1'),
(14, 1, 1, 'asdasad', 'gogo0399', 'sadas', 'asdsa', 'sadsad', 'UTeM', NULL, b'1'),
(15, 11, 6, 'Susy', 'susy123', 'S/D', 'S/G', 'S/C', 'UTeM', '2024-06-07 12:38:15', b'1'),
(19, 14, 1, 'Juanma2', 'FEAJ850930GV1', 'Sistemas', 'TID', 'TID', 'UTeM', '2024-06-13 12:21:07', b'1'),
(20, 15, 2, 'Director', 'Juanma123', 'Sistemas', 'TID', 'TID', 'UTeM', '2024-06-13 12:22:20', b'1'),
(21, 16, 2, 'Director', 'Juanma123', 'Sistemas', 'TID', 'TID', 'UTeM', '2024-06-13 12:24:58', b'1'),
(22, 17, 5, 'Alumno1', 'a7c8b3c1e15a985658dc636270bd1227', 'TI', '3TID3', 'TSU en TID', 'UTeM', '2024-06-14 00:19:37', b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catusertypes`
--

CREATE TABLE `catusertypes` (
  `userTypeId` int NOT NULL,
  `userType` varchar(50) NOT NULL,
  `typeDesc` varchar(200) DEFAULT NULL,
  `dtCreatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `catusertypes`
--

INSERT INTO `catusertypes` (`userTypeId`, `userType`, `typeDesc`, `dtCreatedAt`) VALUES
(1, 'Super Administrador', NULL, '2023-05-24 13:34:40'),
(2, 'Administrador Biblioteca', NULL, '2023-05-24 13:39:38'),
(3, 'Administrativo', NULL, '2023-05-24 13:39:37'),
(4, 'Docente', NULL, '2023-05-24 13:39:36'),
(5, 'Alumno', NULL, '2023-05-24 13:39:36'),
(6, 'Externo', NULL, '2023-05-24 13:39:35');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documentos`
--

CREATE TABLE `documentos` (
  `documentID` int NOT NULL,
  `documentName` varchar(50) NOT NULL,
  `documentURL` varchar(150) NOT NULL,
  `documentType` varchar(30) NOT NULL,
  `personId` int DEFAULT NULL,
  `bActive` tinyint(1) DEFAULT '1',
  `fCreatedAt` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `noticias`
--

CREATE TABLE `noticias` (
  `noticeID` int NOT NULL,
  `noticeTxt` text NOT NULL,
  `noticePhoto` varchar(200) DEFAULT NULL,
  `userID` int DEFAULT NULL,
  `bActive` tinyint(1) DEFAULT '0',
  `fCreatedAt` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

CREATE TABLE `personas` (
  `personId` int NOT NULL COMMENT 'Llave Principal',
  `personName` varchar(50) DEFAULT NULL COMMENT 'Nombre(s) de la persona',
  `personLastName` varchar(100) NOT NULL COMMENT 'Apellido(s) de la Persona',
  `personRFC` varchar(13) NOT NULL DEFAULT '0' COMMENT 'RFC de pa Persona',
  `bActive` tinyint(1) NOT NULL COMMENT 'Activo o inactivo',
  `dtCreatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha de creación del registro'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `personas`
--

INSERT INTO `personas` (`personId`, `personName`, `personLastName`, `personRFC`, `bActive`, `dtCreatedAt`) VALUES
(1, 'Admin', 'Admin', 'ADMI220222000', 1, '2022-02-22 12:39:57'),
(2, 'Secretario', 'General', 'SEGE220222001', 1, '2022-02-22 12:39:57'),
(3, 'Miémbro', 'Activo', 'MIAC220222002', 1, '2022-02-22 12:39:57'),
(4, 'Miémbro', 'Inactivo', 'MIIA220222003', 0, '2022-02-22 12:39:57'),
(5, 'Visitante', '', '', 1, '2022-02-22 12:39:57'),
(6, 'Alejandra', 'López', 'LELO123456789', 1, '2022-09-28 13:42:35');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `sessionId` int NOT NULL,
  `fk_userId` int NOT NULL,
  `cveSession` int NOT NULL,
  `dtLogIn` datetime DEFAULT NULL,
  `dtLogOut` datetime DEFAULT NULL,
  `bActive` bit(1) DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `userdata`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `userdata` (
`personId` int
,`userId` int
,`Name` varchar(50)
,`Lastname` varchar(100)
,`RFC` varchar(13)
,`personActive` tinyint(1)
,`user` varchar(20)
,`userType` varchar(20)
,`userActive` tinyint(1)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `userId` int NOT NULL,
  `personId` int NOT NULL,
  `user` varchar(20) NOT NULL,
  `pass` varchar(40) NOT NULL,
  `userType` varchar(20) NOT NULL,
  `bActive` tinyint(1) NOT NULL DEFAULT '0',
  `dtCreatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`userId`, `personId`, `user`, `pass`, `userType`, `bActive`, `dtCreatedAt`) VALUES
(1, 1, 'admin', '8e53a5d7ed524721c83a05182b5ba114', 'Administrador', 1, '2022-02-22 12:47:08'),
(2, 2, 'sege', '1c14dc03fc8dd53f7ed5df8dc63991df', 'Secretario General', 1, '2022-02-22 12:47:08'),
(3, 3, 'miac', 'de697fc11fe70771f92db92d004b8583', 'Miembro', 1, '2022-02-22 12:47:08'),
(4, 4, 'miin', 'de697fc11fe70771f92db92d004b8583', 'Miembro', 0, '2022-02-22 12:47:08'),
(5, 5, 'visit', 'a213033c0d9f7d83cd8f18d2f96be975', 'Visitante', 1, '2022-02-22 12:47:08'),
(6, 6, 'Ale', 'a3c5f54908f84478506a9b2a19a499d3', '2', 1, '2022-09-28 13:44:35'),
(7, 3, 'EKISD', 'EXIS123', '1', 1, '2022-09-28 13:49:50'),
(8, 4, 'XD', 'exit123', '4', 0, '2022-09-28 13:49:50');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `usersactive`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `usersactive` (
`uId` int
,`userCode` varchar(20)
,`Pass` varchar(50)
,`UserType` int
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_token`
--

CREATE TABLE `usuarios_token` (
  `tokenId` int NOT NULL,
  `userId` int NOT NULL,
  `txtToken` varchar(50) NOT NULL,
  `bEstado` varchar(10) NOT NULL,
  `feDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `usuarios_token`
--

INSERT INTO `usuarios_token` (`tokenId`, `userId`, `txtToken`, `bEstado`, `feDate`) VALUES
(1, 1, '3aa7eafaef2eb026eaeea1dd0769ab64', 'Activo', '2022-10-03 17:14:00'),
(2, 1, '04a9cb8c8fb11e896cb8faa2553a068f', 'Activo', '2022-10-03 17:17:00'),
(3, 1, 'a771c695700d2b7a0d1d61db125b8a38', 'Activo', '2022-10-03 17:23:00'),
(4, 1, 'c9760d7d57f9e26d00052d8376da220a', 'Activo', '2022-10-03 17:24:00'),
(5, 1, '14b3f8a9066dc0cbeb35d99362d32559', 'Activo', '2022-10-03 17:25:00'),
(6, 1, '8af642f5767be5d9b8eaa3144951f7ea', 'Activo', '2022-10-03 17:33:00'),
(7, 1, '70bcb9ce6f6e8b1588d6629cf27a2abe', 'Activo', '2022-10-03 18:35:00'),
(8, 1, '0349d7250a0dbdf99a1f060fc26e11f5', 'Activo', '2024-10-07 14:52:00');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vwadministrativos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vwadministrativos` (
`user_id` int
,`NumTrab` varchar(20)
,`Departamento_Area` varchar(50)
,`userActive` bit(1)
,`Nombre_Admin` varchar(50)
,`Apellidos_Admin` varchar(80)
,`Nombre_Completo_Admin` varchar(131)
,`Email_Admin` varchar(150)
,`Telefono_Admin` varchar(20)
,`userTypeId` int
,`userType` varchar(50)
,`typeDesc` varchar(200)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vwadmins`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vwadmins` (
`user_id` int
,`user_code` varchar(20)
,`departament` varchar(50)
,`userActive` bit(1)
,`first_name` varchar(50)
,`last_name` varchar(80)
,`email` varchar(150)
,`phone` varchar(20)
,`userTypeId` int
,`userType` varchar(50)
,`typeDesc` varchar(200)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vwallusersdata`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vwallusersdata` (
`user_id` int
,`user_code` varchar(20)
,`departament` varchar(50)
,`std_group` varchar(20)
,`career` varchar(100)
,`dependence` varchar(200)
,`userActive` bit(1)
,`first_name` varchar(50)
,`last_name` varchar(80)
,`email` varchar(150)
,`phone` varchar(20)
,`userTypeId` int
,`userType` varchar(50)
,`typeDesc` varchar(200)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vwalumnos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vwalumnos` (
`user_id` int
,`NumCtrl` varchar(20)
,`Grupo` varchar(20)
,`Carrera` varchar(100)
,`userActive` bit(1)
,`Nombre_Alumno` varchar(50)
,`Apellidos_Alumno` varchar(80)
,`Nombre_Completo_Alumno` varchar(131)
,`Email_Alumno` varchar(150)
,`Telefono_Alumno` varchar(20)
,`userTypeId` int
,`userType` varchar(50)
,`typeDesc` varchar(200)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vwdocente`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vwdocente` (
`user_id` int
,`NumTrab` varchar(20)
,`Departamento_Area` varchar(50)
,`Carrera` varchar(100)
,`userActive` bit(1)
,`Nombre_Docente` varchar(50)
,`Apellidos_Docente` varchar(80)
,`Nombre_Completo_Docente` varchar(131)
,`Email_Docente` varchar(150)
,`Telefono_Docente` varchar(20)
,`userTypeId` int
,`userType` varchar(50)
,`typeDesc` varchar(200)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vwexternos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vwexternos` (
`user_id` int
,`cveExterno` varchar(20)
,`Dependencia` varchar(200)
,`userActive` bit(1)
,`Nombre_Externo` varchar(50)
,`Apellidos_Externo` varchar(80)
,`Nombre_Completo_Externo` varchar(131)
,`Email_Externo` varchar(150)
,`Telefono_Externo` varchar(20)
,`userTypeId` int
,`userType` varchar(50)
,`typeDesc` varchar(200)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vwsessionsusers`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vwsessionsusers` (
`userId` int
,`cveUser` varchar(20)
,`userTypeId` int
,`userType` varchar(50)
,`personId` int
,`personName` varchar(50)
,`personLName` varchar(80)
,`sessionId` int
,`cveSession` int
,`dtLogIn` datetime
,`dtLogOut` datetime
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vwuserdocuments`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vwuserdocuments` (
`documentID` int
,`Document` varchar(50)
,`URL` varchar(150)
,`Type` varchar(30)
,`fCreatedAt` datetime
,`personId` int
,`Editor` varchar(151)
,`user` varchar(20)
,`userType` varchar(20)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `allusers`
--
DROP TABLE IF EXISTS `allusers`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `allusers`  AS SELECT `users`.`user` AS `user`, `users`.`pass` AS `pass`, `users`.`bActive` AS `Estado`, `users`.`userId` AS `userId` FROM `users` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `userdata`
--
DROP TABLE IF EXISTS `userdata`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `userdata`  AS SELECT `p`.`personId` AS `personId`, `u`.`userId` AS `userId`, `p`.`personName` AS `Name`, `p`.`personLastName` AS `Lastname`, `p`.`personRFC` AS `RFC`, `p`.`bActive` AS `personActive`, `u`.`user` AS `user`, `u`.`userType` AS `userType`, `u`.`bActive` AS `userActive` FROM (`personas` `p` join `users` `u` on((`u`.`personId` = `p`.`personId`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `usersactive`
--
DROP TABLE IF EXISTS `usersactive`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `usersactive`  AS SELECT `catusers`.`userId` AS `uId`, `catusers`.`cveUser` AS `userCode`, `catusers`.`userPass` AS `Pass`, `catusers`.`fk_UserTypeId` AS `UserType` FROM `catusers` WHERE (`catusers`.`bActive` = 1) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vwadministrativos`
--
DROP TABLE IF EXISTS `vwadministrativos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwadministrativos`  AS SELECT `u`.`userId` AS `user_id`, `u`.`cveUser` AS `NumTrab`, `u`.`departament` AS `Departamento_Area`, `u`.`bActive` AS `userActive`, `p`.`personName` AS `Nombre_Admin`, `p`.`personLName` AS `Apellidos_Admin`, concat(`p`.`personName`,' ',`p`.`personLName`) AS `Nombre_Completo_Admin`, `p`.`personEmail` AS `Email_Admin`, `p`.`personPhone` AS `Telefono_Admin`, `t`.`userTypeId` AS `userTypeId`, `t`.`userType` AS `userType`, `t`.`typeDesc` AS `typeDesc` FROM ((`catusers` `u` left join `catpersons` `p` on((`u`.`fk_personId` = `p`.`personId`))) left join `catusertypes` `t` on((`u`.`fk_UserTypeId` = `t`.`userTypeId`))) WHERE (`t`.`userTypeId` = 3) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vwadmins`
--
DROP TABLE IF EXISTS `vwadmins`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwadmins`  AS SELECT `u`.`userId` AS `user_id`, `u`.`cveUser` AS `user_code`, `u`.`departament` AS `departament`, `u`.`bActive` AS `userActive`, `p`.`personName` AS `first_name`, `p`.`personLName` AS `last_name`, `p`.`personEmail` AS `email`, `p`.`personPhone` AS `phone`, `t`.`userTypeId` AS `userTypeId`, `t`.`userType` AS `userType`, `t`.`typeDesc` AS `typeDesc` FROM ((`catusers` `u` left join `catpersons` `p` on((`u`.`fk_personId` = `p`.`personId`))) left join `catusertypes` `t` on((`u`.`fk_UserTypeId` = `t`.`userTypeId`))) WHERE (`t`.`userTypeId` between 1 and 2) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vwallusersdata`
--
DROP TABLE IF EXISTS `vwallusersdata`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwallusersdata`  AS SELECT `u`.`userId` AS `user_id`, `u`.`cveUser` AS `user_code`, `u`.`departament` AS `departament`, `u`.`groupStdnt` AS `std_group`, `u`.`career` AS `career`, `u`.`dependence` AS `dependence`, `u`.`bActive` AS `userActive`, `p`.`personName` AS `first_name`, `p`.`personLName` AS `last_name`, `p`.`personEmail` AS `email`, `p`.`personPhone` AS `phone`, `t`.`userTypeId` AS `userTypeId`, `t`.`userType` AS `userType`, `t`.`typeDesc` AS `typeDesc` FROM ((`catusers` `u` left join `catpersons` `p` on((`u`.`fk_personId` = `p`.`personId`))) left join `catusertypes` `t` on((`u`.`fk_UserTypeId` = `t`.`userTypeId`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vwalumnos`
--
DROP TABLE IF EXISTS `vwalumnos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwalumnos`  AS SELECT `u`.`userId` AS `user_id`, `u`.`cveUser` AS `NumCtrl`, `u`.`groupStdnt` AS `Grupo`, `u`.`career` AS `Carrera`, `u`.`bActive` AS `userActive`, `p`.`personName` AS `Nombre_Alumno`, `p`.`personLName` AS `Apellidos_Alumno`, concat(`p`.`personName`,' ',`p`.`personLName`) AS `Nombre_Completo_Alumno`, `p`.`personEmail` AS `Email_Alumno`, `p`.`personPhone` AS `Telefono_Alumno`, `t`.`userTypeId` AS `userTypeId`, `t`.`userType` AS `userType`, `t`.`typeDesc` AS `typeDesc` FROM ((`catusers` `u` left join `catpersons` `p` on((`u`.`fk_personId` = `p`.`personId`))) left join `catusertypes` `t` on((`u`.`fk_UserTypeId` = `t`.`userTypeId`))) WHERE (`t`.`userTypeId` = 5) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vwdocente`
--
DROP TABLE IF EXISTS `vwdocente`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwdocente`  AS SELECT `u`.`userId` AS `user_id`, `u`.`cveUser` AS `NumTrab`, `u`.`departament` AS `Departamento_Area`, `u`.`career` AS `Carrera`, `u`.`bActive` AS `userActive`, `p`.`personName` AS `Nombre_Docente`, `p`.`personLName` AS `Apellidos_Docente`, concat(`p`.`personName`,' ',`p`.`personLName`) AS `Nombre_Completo_Docente`, `p`.`personEmail` AS `Email_Docente`, `p`.`personPhone` AS `Telefono_Docente`, `t`.`userTypeId` AS `userTypeId`, `t`.`userType` AS `userType`, `t`.`typeDesc` AS `typeDesc` FROM ((`catusers` `u` left join `catpersons` `p` on((`u`.`fk_personId` = `p`.`personId`))) left join `catusertypes` `t` on((`u`.`fk_UserTypeId` = `t`.`userTypeId`))) WHERE (`t`.`userTypeId` = 4) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vwexternos`
--
DROP TABLE IF EXISTS `vwexternos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwexternos`  AS SELECT `u`.`userId` AS `user_id`, `u`.`cveUser` AS `cveExterno`, `u`.`dependence` AS `Dependencia`, `u`.`bActive` AS `userActive`, `p`.`personName` AS `Nombre_Externo`, `p`.`personLName` AS `Apellidos_Externo`, concat(`p`.`personName`,' ',`p`.`personLName`) AS `Nombre_Completo_Externo`, `p`.`personEmail` AS `Email_Externo`, `p`.`personPhone` AS `Telefono_Externo`, `t`.`userTypeId` AS `userTypeId`, `t`.`userType` AS `userType`, `t`.`typeDesc` AS `typeDesc` FROM ((`catusers` `u` left join `catpersons` `p` on((`u`.`fk_personId` = `p`.`personId`))) left join `catusertypes` `t` on((`u`.`fk_UserTypeId` = `t`.`userTypeId`))) WHERE (`t`.`userTypeId` = 6) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vwsessionsusers`
--
DROP TABLE IF EXISTS `vwsessionsusers`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwsessionsusers`  AS SELECT `u`.`userId` AS `userId`, `u`.`cveUser` AS `cveUser`, `t`.`userTypeId` AS `userTypeId`, `t`.`userType` AS `userType`, `p`.`personId` AS `personId`, `p`.`personName` AS `personName`, `p`.`personLName` AS `personLName`, `s`.`sessionId` AS `sessionId`, `s`.`cveSession` AS `cveSession`, `s`.`dtLogIn` AS `dtLogIn`, `s`.`dtLogOut` AS `dtLogOut` FROM (((`catusers` `u` join `catusertypes` `t` on((`u`.`fk_UserTypeId` = `t`.`userTypeId`))) join `catpersons` `p` on((`u`.`fk_personId` = `p`.`personId`))) join `sessions` `s` on((`s`.`fk_userId` = `u`.`userId`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vwuserdocuments`
--
DROP TABLE IF EXISTS `vwuserdocuments`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwuserdocuments`  AS SELECT `d`.`documentID` AS `documentID`, `d`.`documentName` AS `Document`, `d`.`documentURL` AS `URL`, `d`.`documentType` AS `Type`, `d`.`fCreatedAt` AS `fCreatedAt`, `p`.`personId` AS `personId`, concat(`p`.`Name`,' ',`p`.`Lastname`) AS `Editor`, `p`.`user` AS `user`, `p`.`userType` AS `userType` FROM (`documentos` `d` join `userdata` `p` on((`d`.`personId` = `p`.`personId`))) ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `catpersons`
--
ALTER TABLE `catpersons`
  ADD PRIMARY KEY (`personId`);

--
-- Indices de la tabla `catusers`
--
ALTER TABLE `catusers`
  ADD PRIMARY KEY (`userId`),
  ADD KEY `fk_personId` (`fk_personId`),
  ADD KEY `fk_UserTypeId` (`fk_UserTypeId`);

--
-- Indices de la tabla `catusertypes`
--
ALTER TABLE `catusertypes`
  ADD PRIMARY KEY (`userTypeId`);

--
-- Indices de la tabla `documentos`
--
ALTER TABLE `documentos`
  ADD PRIMARY KEY (`documentID`);

--
-- Indices de la tabla `noticias`
--
ALTER TABLE `noticias`
  ADD PRIMARY KEY (`noticeID`);

--
-- Indices de la tabla `personas`
--
ALTER TABLE `personas`
  ADD PRIMARY KEY (`personId`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`sessionId`),
  ADD KEY `fk_userId` (`fk_userId`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userId`),
  ADD UNIQUE KEY `usuario` (`user`);

--
-- Indices de la tabla `usuarios_token`
--
ALTER TABLE `usuarios_token`
  ADD PRIMARY KEY (`tokenId`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `catpersons`
--
ALTER TABLE `catpersons`
  MODIFY `personId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `catusers`
--
ALTER TABLE `catusers`
  MODIFY `userId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `catusertypes`
--
ALTER TABLE `catusertypes`
  MODIFY `userTypeId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `documentos`
--
ALTER TABLE `documentos`
  MODIFY `documentID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `noticias`
--
ALTER TABLE `noticias`
  MODIFY `noticeID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `personas`
--
ALTER TABLE `personas`
  MODIFY `personId` int NOT NULL AUTO_INCREMENT COMMENT 'Llave Principal', AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `sessions`
--
ALTER TABLE `sessions`
  MODIFY `sessionId` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `userId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `usuarios_token`
--
ALTER TABLE `usuarios_token`
  MODIFY `tokenId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `catusers`
--
ALTER TABLE `catusers`
  ADD CONSTRAINT `catusers_ibfk_1` FOREIGN KEY (`fk_personId`) REFERENCES `catpersons` (`personId`),
  ADD CONSTRAINT `catusers_ibfk_2` FOREIGN KEY (`fk_UserTypeId`) REFERENCES `catusertypes` (`userTypeId`);

--
-- Filtros para la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD CONSTRAINT `sessions_ibfk_1` FOREIGN KEY (`fk_userId`) REFERENCES `catusers` (`userId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
