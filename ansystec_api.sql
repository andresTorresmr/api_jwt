-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-01-2023 a las 14:37:45
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ansystec_api`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calle`
--

CREATE TABLE `calle` (
  `idCalle` int(11) NOT NULL,
  `nombre` varchar(100) COLLATE utf8mb4_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `calle`
--

INSERT INTO `calle` (`idCalle`, `nombre`) VALUES
(2, 'Ombu');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `idcategoria` bigint(20) NOT NULL,
  `nombre` varchar(150) COLLATE utf8_swedish_ci NOT NULL,
  `descripcion` text COLLATE utf8_swedish_ci NOT NULL,
  `portada` varchar(200) COLLATE utf8_swedish_ci NOT NULL,
  `datecreated` datetime NOT NULL DEFAULT current_timestamp(),
  `ruta` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`idcategoria`, `nombre`, `descripcion`, `portada`, `datecreated`, `ruta`, `status`) VALUES
(1, 'categoria 1', 'categoria 1 prueba', '', '2021-11-01 15:32:28', '', 0),
(2, 'categoria 2', 'categoria 2 prueba', 'img_482f30a558d73438bb2c00f40c1ca8da.jpg', '2021-11-01 15:34:29', '', 0),
(3, 'categoria 3', 'prueba de categoria sin imagen', 'portada.jpg', '2021-11-01 15:35:55', '', 0),
(4, 'Categoria 4', 'categoria 4 prueba', 'img_eb1bf925155e51db478401a5b57e5bb3.jpg', '2021-11-02 08:49:07', '', 0),
(5, 'categoria 5', 'categora 5 prueba', 'img_f02bb1f81b649afd712060738ff5d5d1.jpg', '2021-11-02 12:26:18', '', 0),
(6, 'categoria 6', 'categoria 6 proce intel', 'img_78549bf0d86dde67ca72d5d9e8cea87d.jpg', '2021-11-02 13:19:05', '', 0),
(7, 'categoria 7', 'categroia 7', '', '2021-11-02 17:39:06', '', 0),
(8, 'Categoria 8', 'Categoria 8 desc', '', '2021-11-02 17:40:50', '', 0),
(9, 'Categoria 9', 'Categoria 9', '', '2021-11-02 17:41:07', '', 0),
(10, 'Categoria 10', 'Categoria 10', '', '2021-11-02 17:42:10', '', 0),
(11, 'Categoria 11', 'Categoria 11 cat 11', '', '2021-11-02 18:21:35', '', 0),
(12, 'Categoria12', 'categoria 12 descripcion', 'img_f5301112714f4110a8b5be7dd25d1ecf.jpg', '2021-11-03 08:48:19', '', 0),
(13, 'categoria 13 osi', 'cat 13', 'img_19e2b8d64e94c571ce2bfd000a77e98d.jpg', '2021-11-03 08:48:55', '', 0),
(14, 'Mantenimiento', 'Descripcion 3', 'img_c5f1211925e5fc2b2d578e3f6a95260c.jpg', '2021-11-16 10:36:58', 'mantenimiento', 1),
(15, 'Festividades', 'Descripcion 2', 'img_0724bf0615fe36723416ed4694e4538e.jpg', '2021-11-16 16:44:44', 'festividades', 1),
(16, 'Amenidades', 'Descripcion 1', 'img_9d7d9075242d0f3c6fc50eefff69244d.jpg', '2021-11-16 18:49:08', 'amenidades', 1),
(17, 'Categoria de prueba', 'Descripcion de prueba', 'portada_categoria.png', '2021-11-16 23:44:29', 'categoria-de-prueba', 0),
(18, 'Estacionamiento', 'aqui se paga el estacionamiento', 'portada_categoria.png', '2021-11-17 23:21:16', 'estacionamiento', 0),
(19, 'categoria de prueba para probar la responsividad de la pagina', 'asdassada', 'img_70306cf99eb7c1403d5342c92a38f9d9.jpg', '2021-11-18 17:26:12', 'categoria-de-prueba-para-probar-la-responsividad-de-la-pagina', 0),
(20, 'asdfffff', 'fas', 'img_304e388fed4774be1a34c800276c1f0c.jpg', '2021-11-18 21:55:00', 'asdfffff', 0),
(21, 'categoria prueba', 'asdas', 'img_f899accb0d44b99277685de690fb0ec9.jpg', '2021-11-18 22:43:57', 'categoria-prueba', 0),
(22, 'asdadasdasdasdasd', 'asdadssad', 'img_ebaef7a199468daa9724291eb7c4984d.jpg', '2021-11-18 22:44:14', 'asdadasdasdasdasd', 0),
(23, 'fgdhjdfghdfghdfghfgdh', 'ddddddd', 'img_b1f3a18e262e75bb96315c62d923cf09.jpg', '2021-11-18 22:44:44', 'fgdhjdfghdfghdfghfgdh', 0),
(24, 'Eventos', 'Se registrarán todos los eventos disponibles', 'img_fdfc9326a64b5f0c25718f9ad8942b20.jpg', '2021-11-25 14:37:00', 'eventos', 2),
(25, 'asgdsafgsdf', 'sdfdsfsdgssdgsdfgsdfgsdfgsgfssdgsdfgsgsgsdfgsdfgsgs', 'portada_categoria.png', '2022-02-09 17:55:35', 'asgdsafgsdf', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagen`
--

CREATE TABLE `imagen` (
  `id` bigint(20) NOT NULL,
  `productoid` bigint(20) NOT NULL,
  `img` varchar(200) COLLATE utf8_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Volcado de datos para la tabla `imagen`
--

INSERT INTO `imagen` (`id`, `productoid`, `img`) VALUES
(9, 12, 'pro_349c1275d8b49364f655a0c500596378.jpg'),
(15, 18, 'pro_6bd3861e7f6c114e1d235fd7db138f8d.jpg'),
(20, 9, 'pro_de096cb4089aa55fe319daf8804fffc4.jpg'),
(21, 13, 'pro_cfedf127edba8a7359edc6040e4b9cc6.jpg'),
(22, 14, 'pro_99920bc6eb023404f902f0fbd89dbdef.jpg'),
(23, 15, 'pro_36ec6b00f90a1aeb8d3f775e36829188.jpg'),
(24, 16, 'pro_8046a02955f5aa44e51f3aeb861a54da.jpg'),
(25, 17, 'pro_7123c65872a956b907788438c9821fb7.jpg'),
(26, 20, 'pro_7f7f4c655cc488af74aef118496d18b6.jpg'),
(27, 21, 'pro_fb44a66851d4b806b8e98e2b4e7e5e9d.jpg'),
(28, 22, 'pro_0700fc5baaa5a53aab1eab96690609b9.jpg'),
(30, 23, 'pro_d478d40f6a2e56a40995db22410935ab.jpg'),
(32, 25, 'pro_496f21a41d89ff25c1378f580320a65d.jpg'),
(33, 26, 'pro_31a2d5b197a2c73054443d35b7318fa3.jpg'),
(34, 30, 'pro_eb26debd7ca3d9a584ffdf38abb3d374.jpg'),
(36, 19, 'pro_5b18c68192efe7fc356036917d20e7da.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulo`
--

CREATE TABLE `modulo` (
  `idmodulo` bigint(20) NOT NULL,
  `titulo` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `descripcion` text COLLATE utf8_swedish_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Volcado de datos para la tabla `modulo`
--

INSERT INTO `modulo` (`idmodulo`, `titulo`, `descripcion`, `status`) VALUES
(1, 'dashboard', 'dashboard', 0),
(2, 'administradores', 'administradores del sistema', 1),
(3, 'usuarios', 'usuarios del sistema', 1),
(4, 'cobros', 'cobros que se harán', 1),
(5, 'pedidos', 'pedidos', 0),
(7, 'categorias', 'analiza las categorias de los cobros', 1),
(9, 'mis pagos', 'Se verán los pagos de cada usuario', 1),
(10, 'Pagos', 'Area adiministrativa para ver los pagos de todos\r\n', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago`
--

CREATE TABLE `pago` (
  `idpago` bigint(20) NOT NULL,
  `personaid` bigint(20) NOT NULL,
  `productoid` bigint(20) NOT NULL,
  `pago` int(11) NOT NULL DEFAULT 0,
  `comentario` text COLLATE utf8mb4_swedish_ci NOT NULL,
  `fecha_pago` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_opcional` datetime DEFAULT NULL,
  `referenciacobro` varchar(255) COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `idtransaccionopenpay` varchar(255) COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `datosopenpay` text COLLATE utf8mb4_swedish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

--
-- Volcado de datos para la tabla `pago`
--

INSERT INTO `pago` (`idpago`, `personaid`, `productoid`, `pago`, `comentario`, `fecha_pago`, `fecha_opcional`, `referenciacobro`, `idtransaccionopenpay`, `datosopenpay`) VALUES
(141, 46, 9, 1, '', '2022-05-09 18:34:54', '0000-00-00 00:00:00', NULL, 'try9xnn9d8kxyzz9kyci', ''),
(142, 46, 13, 1, '', '2023-01-04 18:49:39', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE `permisos` (
  `idpermiso` bigint(20) NOT NULL,
  `rolid` bigint(20) NOT NULL,
  `moduloid` bigint(20) NOT NULL,
  `r` int(11) NOT NULL DEFAULT 0,
  `w` int(11) NOT NULL DEFAULT 0,
  `u` int(11) NOT NULL DEFAULT 0,
  `d` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Volcado de datos para la tabla `permisos`
--

INSERT INTO `permisos` (`idpermiso`, `rolid`, `moduloid`, `r`, `w`, `u`, `d`) VALUES
(672, 2, 2, 1, 1, 1, 1),
(673, 2, 3, 1, 1, 1, 1),
(674, 2, 4, 1, 1, 1, 1),
(675, 2, 7, 1, 1, 1, 1),
(676, 2, 9, 1, 1, 1, 1),
(677, 2, 10, 1, 1, 1, 1),
(708, 21, 2, 0, 0, 0, 0),
(709, 21, 3, 0, 0, 0, 0),
(710, 21, 4, 0, 0, 0, 0),
(711, 21, 7, 0, 0, 0, 0),
(712, 21, 9, 0, 0, 0, 0),
(713, 21, 10, 0, 0, 0, 0),
(852, 7, 2, 0, 0, 0, 0),
(853, 7, 3, 1, 1, 1, 1),
(854, 7, 4, 0, 0, 0, 0),
(855, 7, 7, 1, 0, 0, 0),
(856, 7, 9, 1, 0, 0, 0),
(857, 7, 10, 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `idpersona` bigint(20) NOT NULL,
  `nombres` varchar(80) COLLATE utf8_swedish_ci NOT NULL,
  `apellidos` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `telefono` bigint(20) NOT NULL,
  `email_user` varchar(200) COLLATE utf8_swedish_ci NOT NULL,
  `calleId` int(11) NOT NULL,
  `numero` bigint(20) NOT NULL,
  `password` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `rolid` bigint(20) NOT NULL,
  `datecreated` datetime NOT NULL DEFAULT current_timestamp(),
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`idpersona`, `nombres`, `apellidos`, `telefono`, `email_user`, `calleId`, `numero`, `password`, `token`, `rolid`, `datecreated`, `status`) VALUES
(46, 'Andres', 'Torres Montemayor', 8123564669, 'andrestorresm001@gmail.com', 2, 825, '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', '', 2, '2021-12-07 15:26:58', 1),
(47, 'Jsoe', 'Emanuel', 8123564669, 'andrestorresm001@hotmail.com', 2, 825, '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', '', 7, '2021-12-08 16:09:22', 0),
(48, 'Jose', 'Maria', 754654654, 'aaaaaaaaa@asdasd.asd', 2, 78, '1bee955e760e1777541deb12d74506c3ea4e41f4858afee1c9b5c744c480dc80', '', 21, '2021-12-08 22:28:16', 0),
(49, 'Asd', 'Asdadadads', 88748, 'lkj@lkj.fg', 2, 545, '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', '', 2, '2021-12-09 16:58:31', 0),
(50, 'Dggfdhdfghdfh', 'Dfghdffghd', 454545555, 'sdfsds@ghfghfhgfhfg.dfggdf', 2, 320320230, '49fe8e17c2b403de2a0d75ce7108cdde44deb69e5de9e2a8d4ae12becf6990bc', '', 7, '2021-12-09 17:33:04', 0),
(51, 'Jose', 'Manuel', 8123564669, 'andrestorres230616@gmail.com', 2, 825, '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', '', 2, '2021-12-19 00:04:11', 0),
(52, 'Andrés', 'Torres Montemayor', 8123564669, 'andres.torresmr@uanl.edu.mx', 2, 825, '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', '', 2, '2021-12-19 00:20:20', 0),
(53, 'Natalia', 'Torres Montemayor', 8121978446, 'nataliatorres2808@gmail.com', 2, 385, '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', '8d1821a3144561b311df-3242a0ba0474d18e4f98-f92abf84a0f8b46b6378-9e566c898fa7f5381c4f', 7, '2021-12-21 20:23:56', 1),
(54, 'Gabriela Alejandra', 'Fuentes Rangel', 8127334477, 'gabyfts00.gf@gmail.com', 2, 106, '008fd5f8d2318733b0463128ede32370e390e82c0df522580cf6fcdc4e0ec36e', '', 2, '2021-12-22 19:36:56', 1),
(55, 'Karina', 'Montemayor', 8118044022, 'karimontemayor@hotmail.com', 2, 825, '747b16e810431dcf8abe798bdef2d3a031ad989f376133dd4a280bb0b31ae518', '', 21, '2021-12-22 21:14:11', 1),
(56, 'Bernardo', 'Silva López', 8123564669, 'bsilva@gmail.cpm', 2, 825, 'bSilva2000..', '', 21, '2022-11-21 16:13:12', 1),
(57, 'Bernardo', 'Silva López', 8123564669, 'bsilva@gmail.cpm', 2, 825, 'bSilva2000..', '', 21, '2022-11-21 18:15:30', 1),
(58, 'Emiliano', 'Silva', 8123564669, 'bsilva@gmail.cpm', 2, 8001, 'bSilva2000..', '', 21, '2022-11-21 18:20:23', 0),
(61, 'prueba', 'mac m1', 8123564669, 'macm1@gmail.com', 2, 825, '12345', '', 7, '2022-11-27 08:20:47', 1),
(62, 'prueba', 'mac m1', 8123564669, 'macm1@gmail.com', 2, 825, '12345', '', 7, '2022-11-30 22:03:04', 1),
(63, 'prueba', 'hash password', 8123564669, 'hast@password.com', 2, 825, '$2a$10$4jOa5xvrxIvJW6Rk3daYsumH68Qp1uc5fLQio29EdI13vw4h.LvSa', '', 7, '2022-11-30 22:52:04', 1),
(64, 'andres', 'torres', 8123564669, 'andres@gmail.com', 2, 825, '$2a$10$hhRaSG6bZhcg8WMK3Ytg..uezHpi87RIdh2iCuaZfr28UA6yanV5O', '', 7, '2022-12-01 19:12:17', 1),
(65, 'validator', 'validator', 8123564669, 'validator@gmail.com', 2, 825, '$2a$10$mINhPFRGkjKpdjokis016.XSPxuYuMhtKBygmqpEdWRK0hPjL1IiO', '', 7, '2022-12-19 21:20:39', 1),
(66, 'validator', 'validator', 8123564669, 'validator@a.com', 2, 825, '$2a$10$Br5l9PEJVeUn90J8./RhzOEESQtn6Q.OE.LOjlXcYkd89FT72cZXO', '', 7, '2022-12-19 21:21:02', 1),
(67, 'validator', 'validator', 8123564669, 'validator@as.com', 2, 825, '$2a$10$6ywisJL36omO9WNfDtlUbesT.mBbkIMPkagEaRwCjalSD.G24lMKm', '', 7, '2022-12-19 21:28:30', 1),
(68, 'validator', 'validator', 8123564669, 'validator@as.com', 2, 825, '$2a$10$429g3vs3k/uTSAGiE4CK3e9yZnSX4FO7pVKmTgl0TSosQDuyBvv1a', '', 7, '2022-12-19 21:29:19', 1),
(69, 'validator', 'validator', 8123564669, 'validator@as.com', 2, 825, '$2a$10$zpVnJlqWlqMsJDEUxPKjFu8JfWyipTr3/pgddroFdRqLjDLd0nQfW', '', 7, '2023-01-01 09:16:12', 1),
(70, 'validator', 'validator', 8123564669, 'validator@as.com', 2, 825, '$2a$10$9nRcM.pY11ML4BjxNbiEt.akubPG2ZXSwrGKSTZGJAqr1ujFZekJe', '', 7, '2023-01-02 18:15:55', 1),
(71, 'validator', 'validator', 8123564669, 'validator@as.com', 2, 825, '$2a$10$ReKU6zdfpFwPMPXlAtS30.3rbf9NQOltmRmIP5Lyc5NGApSeLyiNS', '', 7, '2023-01-02 18:23:52', 1),
(72, 'validator', 'validator', 8123564669, 'validator@as.com', 2, 825, '$2a$10$1r6f3I48/2NmUT2oQa..keobxFtznrOBSxDmjjhsUj6kSG9lYKUPC', '', 7, '2023-01-02 18:24:17', 1),
(73, 'validator', 'validator', 8123564669, 'validator@as.com', 2, 825, '$2a$10$bWO.b3ZXYHUbb.B1jPfTE.uPbxV5d7osmkqQ770fvjMlA9Fiqx2bq', '', 7, '2023-01-02 18:24:28', 1),
(74, 'validator', 'validator', 8123564669, 'validator@as.com', 2, 825, '$2a$10$GY9X9/lgstf3RvOxCBN87eIZ2aPEDrF8UCJ6TvpZNzBMEultzpu/e', '', 7, '2023-01-02 18:24:35', 1),
(75, 'validator', 'validator', 8123564669, 'validator@as.com', 2, 825, '$2a$10$ohv0uwQHqty6yPRLXhWQfOHKpDbvpUNPANNUb4sOxNWQJK.XLfBEe', '', 7, '2023-01-02 18:24:56', 1),
(76, 'validator', 'validator', 8123564669, 'validator@as.com', 2, 825, '$2a$10$eBQz11kuOTfXhfwZqvh7ceAplim7/SbWPXcliJm2anTs9vzwneCwS', '', 7, '2023-01-02 18:25:18', 1),
(77, 'validator', 'validator', 8123564669, 'validator@as.com', 2, 825, '$2a$10$C3WL2GOzkWElVkDpO38qyeODv4MoANYfKJnq2tJWXufnL3JV405bq', '', 7, '2023-01-02 18:25:36', 1),
(78, 'validator', 'validator', 8123564669, 'validator@as.com', 2, 825, '$2a$10$whwfZGYS60SbsvfmamxL4eK.du7Sc2yDJl3pV/ft0NXBmFrwsTeCG', '', 7, '2023-01-02 18:25:48', 1),
(79, 'validator', 'validator', 8123564669, 'validator@as.com', 2, 825, '$2a$10$1tn1OLb2VZesL.qi7yHR4.Trs3SSOjp0gdDwJKuMdAjAaHIBimlya', '', 7, '2023-01-02 18:26:28', 1),
(80, 'validator', 'validator', 8123564669, 'validator@as.com', 2, 825, '$2a$10$0NA3JENDzRrJdDFNOD1R4ebO.TLGs82r4xpkFonS1Vd12xuJUuW6y', '', 7, '2023-01-02 18:27:32', 1),
(81, 'validator', 'validator', 8123564669, 'validator@as.com', 2, 825, '$2a$10$8QAtXIfAj5hYiY6nAQYn8OgjPGw8kYxrTeoLH.oHuAdslDzZzWUNG', '', 7, '2023-01-02 18:27:40', 1),
(82, 'validator', 'validator', 8123564669, 'validator@as.com', 2, 825, '$2a$10$m6yOxzTF49QYcsALcBOoR.wuKEo5B/SzSNOdNmP.hK8CAAHd/Xpum', '', 7, '2023-01-02 18:27:47', 1),
(83, 'validator', 'validator', 8123564669, 'validator@as.com', 2, 825, '$2a$10$B/p7rv9PInvz8kv9ip7L1.Q5V.1/etkh9erH3wqCgnUWDrOqbw4pK', '', 7, '2023-01-02 18:27:56', 1),
(84, 'validator', 'validator', 8123564669, 'validator@as.com', 2, 825, '$2a$10$8JZOiT7cMpId0v5XfwQqZ.rmB221M/0RLHCgMbtZ3PiHb4RsqLieG', '', 7, '2023-01-02 18:27:58', 1),
(85, 'validator', 'validator', 8123564669, 'validatorssssss@as.com', 2, 825, '$2a$10$0G2EVoVf6buC3H3xrE/Tz.nx02IXhsDQR9UgSNv0nTCV/zFL/nFPm', '', 7, '2023-01-02 18:31:14', 1),
(86, 'miguel', 'herrera', 8123564669, 'mikeherrera@gmail.com', 2, 825, '$2a$10$BJX31dGNR5t20Nf0Whz.jec2QKIvosLX.eXFcxiySOBFCb87tcsZa', '', 7, '2023-01-03 20:43:10', 2),
(87, 'miguel', 'herrera', 8123564669, 'mikeherrera@gmail.com', 2, 825, '$2a$10$vU6sZ7dQQK2VRs4ZzAXU2eV3hgi2Onv1cZmcQJnJg6d/mijutsgxK', '', 7, '2023-01-03 20:44:08', 0),
(88, 'usuario', 'de ombu', 8123564669, 'usuario@ombu.com', 2, 825, '$2a$10$6z1wjLYwLw3FFAENf6XSMuwfpGx8uK9M7pvL9AgvfMTcdzvz6V0fi', '', 7, '2023-01-07 16:22:41', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona2`
--

CREATE TABLE `persona2` (
  `idpersona` bigint(20) NOT NULL,
  `nombres` varchar(600) NOT NULL,
  `apellidos` varchar(2000) NOT NULL,
  `email_user` varchar(600) NOT NULL,
  `telefono` bigint(20) NOT NULL,
  `calleid` int(11) NOT NULL,
  `numero` int(11) NOT NULL,
  `password` varchar(1000) NOT NULL,
  `rolid` bigint(20) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `darecreated` datetime NOT NULL DEFAULT current_timestamp(),
  `tokenn` varchar(600) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `idproducto` bigint(20) NOT NULL,
  `categoriaid` bigint(20) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `descripcion` text COLLATE utf8_swedish_ci NOT NULL,
  `fechalim` datetime DEFAULT NULL,
  `precio` decimal(11,2) NOT NULL,
  `permitirFecha` int(11) NOT NULL DEFAULT 0,
  `limfecha` int(11) NOT NULL DEFAULT 1,
  `observacion` int(11) NOT NULL DEFAULT 0,
  `imagen` varchar(300) COLLATE utf8_swedish_ci NOT NULL,
  `datecreated` datetime NOT NULL DEFAULT current_timestamp(),
  `ruta` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`idproducto`, `categoriaid`, `nombre`, `descripcion`, `fechalim`, `precio`, `permitirFecha`, `limfecha`, `observacion`, `imagen`, `datecreated`, `ruta`, `status`) VALUES
(9, 14, 'Enero', '<p>descricpcion del mes de Enero</p>', '2021-01-31 00:00:00', '2000.00', 0, 1, 0, '', '2021-11-16 08:58:12', 'enero', 1),
(12, 15, 'Navidad', '<p>Posada navide&ntilde;a</p>', '2021-12-25 00:00:00', '200.00', 0, 0, 0, '', '2021-11-16 16:52:40', 'navidad', 1),
(13, 14, 'Febrero', '<ul> <li>febrero</li> <li>pago</li> <li>de</li> <li>mensualidades</li> </ul>', '2021-02-28 00:00:00', '1300.00', 0, 1, 0, '', '2021-11-16 17:01:31', 'febrero', 1),
(14, 14, 'Marzo', '<p>Mensualidad del mes de marzo</p>', '2021-03-31 00:00:00', '1300.00', 0, 1, 0, '', '2021-11-16 18:34:27', 'marzo', 2),
(15, 14, 'Abril', '<p>Mensualidades del mes de abril</p>', '2021-12-05 00:00:00', '1300.00', 1, 1, 1, '', '2021-11-16 18:34:52', 'abril', 2),
(16, 14, 'Mayo', '<p>Mensualidad del mes de mayo</p>', '2021-05-31 00:00:00', '1300.00', 0, 1, 0, '', '2021-11-16 18:35:21', 'mayo', 1),
(17, 14, 'Junio', '<p>Mensualidad del mes de Junio</p>', '2022-04-01 00:00:00', '1300.00', 0, 1, 0, '', '2021-11-16 18:35:40', 'junio', 1),
(18, 15, 'Fiesta fin de año', '<p style=\"text-align: center;\"><strong>FIESTA DE FIN DE A&Ntilde;O!!!</strong></p> <p style=\"text-align: center;\">&nbsp;</p> <p style=\"text-align: left;\"><span style=\"color: #e67e23;\">Aparta tu lugar con $200 para recibir este nuevo a&ntilde;o con toda la actitud! :) </span></p>', '2021-12-31 00:00:00', '200.00', 0, 1, 0, '', '2021-11-16 18:37:18', 'fiesta-fin-de-ano', 1),
(19, 16, 'Lugar de eventos en plaza principal', '<p>Reserva de la plaza principal</p>', '2034-12-31 00:00:00', '200.00', 0, 1, 0, '', '2021-11-16 18:50:54', 'lugar-de-eventos-en-plaza-principal', 1),
(20, 15, 'Posada', '<p>Posada finales de a&ntilde;o:</p> <ul> <li>Comida: $100</li> <li>Refresco: $50</li> </ul> <p><span style=\"background-color: #f1c40f;\">Total: $150</span></p>', '2034-12-20 00:00:00', '100.00', 0, 1, 1, '', '2021-11-17 00:05:40', 'posada', 1),
(21, 14, 'Julio', '<h1>Mensualidad de Julio</h1> <hr /> <table style=\"border-collapse: collapse; width: 59.7633%; height: 63px;\" border=\"1\"> <tbody> <tr style=\"height: 22px;\"> <td style=\"width: 47.9365%; text-align: center; height: 22px;\"><strong>Nombre</strong></td> <td style=\"width: 47.9365%; text-align: center; height: 22px;\"><strong>Precio</strong></td> </tr> <tr style=\"height: 22px;\"> <td style=\"width: 47.9365%; height: 22px;\">Jardiner&iacute;a</td> <td style=\"width: 47.9365%; height: 22px;\">$200</td> </tr> <tr style=\"height: 24px;\"> <td style=\"width: 47.9365%; height: 24px;\">Servicios (agua,luz,gas)</td> <td style=\"width: 47.9365%; height: 24px;\">$1500</td> </tr> <tr style=\"height: 22px;\"> <td style=\"width: 47.9365%; height: 22px;\">Seguridad</td> <td style=\"width: 47.9365%; height: 22px;\">$300</td> </tr> </tbody> </table> <p>&nbsp;</p> <blockquote> <p>Este es son las cosas que hay que pagar con sus respectivos precios.</p> </blockquote>', '2034-07-31 00:00:00', '2000.00', 0, 1, 0, '', '2021-11-17 14:05:51', 'julio', 1),
(22, 14, 'Enero', '<p>enero duplicado</p>', '2021-12-05 13:02:02', '132251.00', 0, 0, 0, '', '2021-11-17 18:19:44', 'enero', 0),
(23, 21, 'prueba', '<p>adfadasdasda</p> <ul> <li>asd</li> <li>asd</li> <li>asd</li> <li>asd</li> <li>asds</li> <li>sa</li> </ul>', '2021-12-05 13:02:04', '130305.00', 0, 0, 0, '', '2021-11-17 23:14:59', 'prueba', 0),
(24, 14, 'hsdhsdfhsdfhsdfhs', '<p>Mensualidad del mes de marzo</p>', '2021-12-05 13:02:07', '1300.00', 0, 0, 0, '', '2021-11-19 18:02:03', 'hsdhsdfhsdfhsdfhs', 0),
(25, 14, 'Agosto', '<p>mensualidad de agosto</p>', '2034-08-31 00:00:00', '1300.00', 0, 1, 0, '', '2021-11-19 19:19:47', 'agosto', 1),
(26, 14, 'Septiembre', '<p>mensualidad de septiembre</p>', '2022-04-06 00:00:00', '1300.00', 1, 1, 1, '', '2021-11-19 19:22:09', 'septiembre', 1),
(27, 14, 'enero 2022', '<p>asda</p>', '2021-12-05 13:02:16', '0.00', 0, 0, 0, '', '2021-12-04 14:38:40', 'enero-2022', 0),
(28, 14, 'Febrero 2022', '<p>asd</p>', '2021-12-05 13:02:18', '100.00', 0, 0, 0, '', '2021-12-04 16:58:32', 'febrero-2022', 0),
(29, 14, 'Marzo 2022', '<p>Marzo 2022 mantenimiento</p>', '2021-12-05 13:02:20', '130.00', 0, 0, 0, '', '2021-12-04 17:11:57', 'marzo-2022', 0),
(30, 14, 'Abril 2022', '<p>asdasd</p>', '2021-12-18 00:00:00', '100.00', 1, 0, 0, '', '2021-12-05 12:51:51', 'abril-2022', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reembolso`
--

CREATE TABLE `reembolso` (
  `id` bigint(20) NOT NULL,
  `pagoid` bigint(20) NOT NULL,
  `idtransaccion` varchar(255) COLLATE utf8mb4_swedish_ci NOT NULL,
  `datosreembolso` text COLLATE utf8mb4_swedish_ci NOT NULL,
  `observacion` text COLLATE utf8mb4_swedish_ci NOT NULL,
  `status` varchar(150) COLLATE utf8mb4_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `idrol` bigint(20) NOT NULL,
  `nombrerol` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `descripcion` text COLLATE utf8_swedish_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`idrol`, `nombrerol`, `descripcion`, `status`) VALUES
(2, 'Administrador', 'se encarga de asignar roles', 1),
(3, 'empleado', 'solo actualiza los datos empleados', 1),
(7, 'Usuario', 'aqui van todos los registrados en un inicio', 1),
(13, 'vendedor', 'vendedor', 1),
(17, 'wqeqewq', 's', 1),
(18, 'asda', 'aaaa', 1),
(19, 'comedoresaaaa', 'dasdadadsa', 1),
(20, 'asfasdfa', 'asdfafds', 1),
(21, 'Rol de prueba', 'Rol de prueba', 1),
(22, 'Actualizarr', 'espero que actualice', 0),
(23, 'Actualizarr', 'espero que actualice', 0),
(24, 'rol desde api 3', 'Rol creado desde postman por método post verificación de token', 1),
(25, 'rol desde api 4', 'Rol creado desde postman por método post verificación de token', 1),
(26, 'Rol desde api 5 actualizado', 'espero que actualicessss', 0),
(27, 'Rol desde api 6 actualizado', 'espero que actualice', 0),
(28, 'rol desde api 6', 'Rol creado desde postman por método post verificación de token', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `calle`
--
ALTER TABLE `calle`
  ADD PRIMARY KEY (`idCalle`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idcategoria`);

--
-- Indices de la tabla `imagen`
--
ALTER TABLE `imagen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productoid` (`productoid`);

--
-- Indices de la tabla `modulo`
--
ALTER TABLE `modulo`
  ADD PRIMARY KEY (`idmodulo`);

--
-- Indices de la tabla `pago`
--
ALTER TABLE `pago`
  ADD PRIMARY KEY (`idpago`),
  ADD KEY `personaid` (`personaid`),
  ADD KEY `productoid` (`productoid`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`idpermiso`),
  ADD KEY `rolid` (`rolid`),
  ADD KEY `moduloid` (`moduloid`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`idpersona`),
  ADD KEY `rolid` (`rolid`),
  ADD KEY `calleId` (`calleId`);

--
-- Indices de la tabla `persona2`
--
ALTER TABLE `persona2`
  ADD PRIMARY KEY (`idpersona`),
  ADD UNIQUE KEY `calleid` (`calleid`),
  ADD UNIQUE KEY `rolid` (`rolid`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idproducto`),
  ADD KEY `categoriaid` (`categoriaid`);

--
-- Indices de la tabla `reembolso`
--
ALTER TABLE `reembolso`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pagoid` (`pagoid`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`idrol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `calle`
--
ALTER TABLE `calle`
  MODIFY `idCalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `idcategoria` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `imagen`
--
ALTER TABLE `imagen`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `modulo`
--
ALTER TABLE `modulo`
  MODIFY `idmodulo` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `pago`
--
ALTER TABLE `pago`
  MODIFY `idpago` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=143;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `idpermiso` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=858;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `idpersona` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT de la tabla `persona2`
--
ALTER TABLE `persona2`
  MODIFY `idpersona` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `idproducto` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `reembolso`
--
ALTER TABLE `reembolso`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `idrol` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `imagen`
--
ALTER TABLE `imagen`
  ADD CONSTRAINT `imagen_ibfk_1` FOREIGN KEY (`productoid`) REFERENCES `producto` (`idproducto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pago`
--
ALTER TABLE `pago`
  ADD CONSTRAINT `pago_ibfk_1` FOREIGN KEY (`personaid`) REFERENCES `persona` (`idpersona`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pago_ibfk_2` FOREIGN KEY (`productoid`) REFERENCES `producto` (`idproducto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD CONSTRAINT `permisos_ibfk_1` FOREIGN KEY (`rolid`) REFERENCES `rol` (`idrol`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permisos_ibfk_2` FOREIGN KEY (`moduloid`) REFERENCES `modulo` (`idmodulo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `persona_ibfk_1` FOREIGN KEY (`rolid`) REFERENCES `rol` (`idrol`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `persona_ibfk_2` FOREIGN KEY (`calleId`) REFERENCES `calle` (`idCalle`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`categoriaid`) REFERENCES `categoria` (`idcategoria`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `reembolso`
--
ALTER TABLE `reembolso`
  ADD CONSTRAINT `reembolso_ibfk_1` FOREIGN KEY (`pagoid`) REFERENCES `pago` (`idpago`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
