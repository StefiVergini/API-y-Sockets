-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 26, 2025 at 02:35 AM
-- Server version: 11.1.2-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `github_data`
--

-- --------------------------------------------------------

--
-- Table structure for table `followers`
--

CREATE TABLE `followers` (
  `id` int(11) NOT NULL,
  `login` varchar(255) DEFAULT NULL,
  `html_url` varchar(255) DEFAULT NULL,
  `owner` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `followers`
--

INSERT INTO `followers` (`id`, `login`, `html_url`, `owner`) VALUES
(4592, 'konklone', 'https://github.com/konklone', 'stef'),
(5906, 'sgarza', 'https://github.com/sgarza', 'stef'),
(6331, 'danohu', 'https://github.com/danohu', 'stef'),
(9511, 'duritong', 'https://github.com/duritong', 'stef'),
(9900, 'romanz', 'https://github.com/romanz', 'stef'),
(15585, 'mixr', 'https://github.com/mixr', 'stef'),
(20079, 'l1x', 'https://github.com/l1x', 'stef'),
(20240, 'asciimoo', 'https://github.com/asciimoo', 'stef'),
(21212, 'mithro', 'https://github.com/mithro', 'stef'),
(22132, 'leif', 'https://github.com/leif', 'stef'),
(28900, 'aczid', 'https://github.com/aczid', 'stef'),
(35065, 'ypetya', 'https://github.com/ypetya', 'stef'),
(35631, 'a2800276', 'https://github.com/a2800276', 'stef'),
(41827, 'Psycojoker', 'https://github.com/Psycojoker', 'stef'),
(43155, 'elijah', 'https://github.com/elijah', 'stef'),
(53705, 'miku', 'https://github.com/miku', 'stef'),
(54845, 'diegode', 'https://github.com/diegode', 'stef'),
(72709, 'zuzmo', 'https://github.com/zuzmo', 'stef'),
(73274, 'PabloCastellano', 'https://github.com/PabloCastellano', 'stef'),
(76114, 'thejeshgn', 'https://github.com/thejeshgn', 'stef'),
(80577, 'kriskhaira', 'https://github.com/kriskhaira', 'stef'),
(80981, 'tbx', 'https://github.com/tbx', 'stef'),
(81561, 'Synchro', 'https://github.com/Synchro', 'stef'),
(86942, 'kcnickerson', 'https://github.com/kcnickerson', 'stef'),
(94636, 'jpic', 'https://github.com/jpic', 'stef'),
(104737, 'Neustradamus', 'https://github.com/Neustradamus', 'stef'),
(128454, 'seanjensengrey', 'https://github.com/seanjensengrey', 'stef'),
(129525, 'silky', 'https://github.com/silky', 'stef'),
(130068, 'potato', 'https://github.com/potato', 'stef'),
(136093, 'caedesvvv', 'https://github.com/caedesvvv', 'stef'),
(7435463, 'tinobreg', 'https://github.com/tinobreg', 'jjcblanco'),
(58627821, 'nholuongut', 'https://github.com/nholuongut', 'jjcblanco'),
(67303611, 'EmilianoCorvalan', 'https://github.com/EmilianoCorvalan', 'jjcblanco'),
(83768234, 'JeanET26', 'https://github.com/JeanET26', 'jjcblanco'),
(110321221, 'JoseContrerasDev', 'https://github.com/JoseContrerasDev', 'jjcblanco'),
(135669488, 'chounaaaa', 'https://github.com/chounaaaa', 'jjcblanco'),
(136649829, 'Walterzq', 'https://github.com/Walterzq', 'jjcblanco'),
(163360357, 'yetsyy', 'https://github.com/yetsyy', 'jjcblanco'),
(166510178, 'ernesg23', 'https://github.com/ernesg23', 'jjcblanco');

-- --------------------------------------------------------

--
-- Table structure for table `repositorios`
--

CREATE TABLE `repositorios` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `html_url` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `owner` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `repositorios`
--

INSERT INTO `repositorios` (`id`, `name`, `html_url`, `description`, `owner`) VALUES
(513650, 'arduino-cli', 'https://github.com/stef/arduino-cli', 'develop for arduinos without java', 'stef'),
(628234, 'actonacta-tools', 'https://github.com/stef/actonacta-tools', 'A couple of parsing tools for simple web pages.', 'stef'),
(841062, 'burnstation2', 'https://github.com/stef/burnstation2', 'this is a fork of pyjama - changed to act as a burnstation', 'stef'),
(1499785, 'CSSOM', 'https://github.com/stef/CSSOM', 'CSS Object Model implemented in pure JavaScript. It\'s also a parser!', 'stef'),
(3205171, 'anonshort', 'https://github.com/stef/anonshort', 'Privacy-enhanced resolver for shortened URLs', 'stef'),
(5471696, 'daemonize', 'https://github.com/stef/daemonize', 'create a simple skeleton for runit/daemontools services', 'stef'),
(7175025, 'epc2203', 'https://github.com/stef/epc2203', 'gathers information from epc2203 cable modems (munin plugin inclusive)', 'stef'),
(8996408, 'django-tlsauth', 'https://github.com/stef/django-tlsauth', 'django app for doing TLS client cert authentication', 'stef'),
(12144506, 'ec-experts', 'https://github.com/stef/ec-experts', 'expert groups mining', 'stef'),
(13756584, 'ansiweather', 'https://github.com/stef/ansiweather', 'Weather in your terminal, with ANSI colors and Unicode symbols', 'stef'),
(18826208, 'entrenador', 'https://github.com/jjcblanco/entrenador', NULL, 'jjcblanco'),
(19759664, 'ep_vote_similarities', 'https://github.com/stef/ep_vote_similarities', 'Extracting European Parliament vote similarities', 'stef'),
(23548221, 'cryptokraaken', 'https://github.com/stef/cryptokraaken', 'scans for OpenPGP encrypted messages and key material', 'stef'),
(24853585, 'credlib', 'https://github.com/stef/credlib', 'credlib is a credential library providing a simple interface to Brands credentials (by Dr Stefan Brands), and also Chaumian credentials (by Dr David Chaum). The library is based on openSSL. ', 'stef'),
(26065490, 'django-parltrack-meps', 'https://github.com/stef/django-parltrack-meps', 'Member of the European Parliament data coming from parltrack handling django application', 'stef'),
(27556332, 'django-parltrack-votes', 'https://github.com/stef/django-parltrack-votes', 'Code related to meps\' votes from the European Parliament handling with the data of parltrack', 'stef'),
(31234449, 'cr3', 'https://github.com/stef/cr3', 'simple pipe using crazy/crappy crypto for encryption and signing', 'stef'),
(31711606, 'certcheck', 'https://github.com/stef/certcheck', 'educating users shaming browsers on handling https certs', 'stef'),
(51492848, 'androidblue', 'https://github.com/jjcblanco/androidblue', NULL, 'jjcblanco'),
(51562290, 'Bluetoothv2', 'https://github.com/jjcblanco/Bluetoothv2', NULL, 'jjcblanco'),
(70835083, 'aports', 'https://github.com/stef/aports', 'Readonly mirror of aports (http://git.alpinelinux.org/cgit/aports)', 'stef'),
(82665944, 'aports-ugly', 'https://github.com/stef/aports-ugly', 'ugly apkbuilds for alpine linux', 'stef'),
(83787800, 'angr', 'https://github.com/stef/angr', 'The next-generation binary analysis platform from UC Santa Barbara\'s Seclab!', 'stef'),
(124103162, 'ed448goldilocks', 'https://github.com/stef/ed448goldilocks', 'Fork of git://git.code.sf.net/p/ed448goldilocks/code with \"support\" of cross-compiling with mingw', 'stef'),
(266428413, 'ctrace', 'https://github.com/stef/ctrace', 'dp3t covid19 contact tracer based on zephyr os for nrf51', 'stef'),
(310354673, 'crapture', 'https://github.com/stef/crapture', 'A hackish automated window recorder', 'stef'),
(334518920, 'curve25519-dalek', 'https://github.com/stef/curve25519-dalek', 'A pure-Rust implementation of group operations on Ristretto and Curve25519', 'stef'),
(349813830, 'equihash', 'https://github.com/stef/equihash', 'Equihash: memory-hard PoW with fast verification', 'stef'),
(354616121, 'aprs-python', 'https://github.com/stef/aprs-python', '? Python module for working with APRS', 'stef'),
(432316158, 'sensores-android', 'https://github.com/jjcblanco/sensores-android', 'ejemplo sensores android', 'jjcblanco'),
(453571061, 'language-courses', 'https://github.com/StefiVergini/language-courses', NULL, 'stefiVergini'),
(457559868, 'draft-irtf-cfrg-voprf', 'https://github.com/stef/draft-irtf-cfrg-voprf', 'Oblivious Pseudorandom Functions (OPRFs) using Prime-Order Groups', 'stef'),
(473787051, 'ProyectoNutrite', 'https://github.com/StefiVergini/ProyectoNutrite', 'Proyecto Nutrite es mi presentación del examen final del Trayecto Programador de CFP 31 dónde aprendí a Programar con Java. Se basa en una aplicación de escritorio, en la cual los nutricionistas pueden ir cargando la historia clínica de sus pacientes, crearles un usuario, dar de alta, bajas y generar modificaciones de los mismos.', 'stefiVergini'),
(485451717, 'pywhatrw', 'https://github.com/jjcblanco/pywhatrw', NULL, 'jjcblanco'),
(498948179, 'javaclientchat', 'https://github.com/jjcblanco/javaclientchat', NULL, 'jjcblanco'),
(498948459, 'socketclientchat', 'https://github.com/jjcblanco/socketclientchat', NULL, 'jjcblanco'),
(498948986, 'socketServerchat', 'https://github.com/jjcblanco/socketServerchat', NULL, 'jjcblanco'),
(509583010, 'notifications', 'https://github.com/jjcblanco/notifications', 'notificaciones android', 'jjcblanco'),
(590587048, 'cyrus-sasl', 'https://github.com/stef/cyrus-sasl', NULL, 'stef'),
(593854629, 'alura-git', 'https://github.com/StefiVergini/alura-git', 'Lista de cursos para controlar con Git', 'stefiVergini'),
(600230427, 'bluetoothv1', 'https://github.com/jjcblanco/bluetoothv1', NULL, 'jjcblanco'),
(603041481, 'ControlAuto', 'https://github.com/jjcblanco/ControlAuto', NULL, 'jjcblanco'),
(603041630, 'baldosasv1', 'https://github.com/jjcblanco/baldosasv1', NULL, 'jjcblanco'),
(616252700, 'btarduino', 'https://github.com/jjcblanco/btarduino', NULL, 'jjcblanco'),
(617735095, 'controlautobt1', 'https://github.com/jjcblanco/controlautobt1', NULL, 'jjcblanco'),
(647456278, 'draft-irtf-cfrg-hash-to-curve', 'https://github.com/stef/draft-irtf-cfrg-hash-to-curve', 'Hashing to Elliptic Curves', 'stef'),
(654767005, 'apiejemplo', 'https://github.com/jjcblanco/apiejemplo', NULL, 'jjcblanco'),
(656926048, 'testing', 'https://github.com/jjcblanco/testing', 'Este repositorio es de pruebas del curso de App Testing', 'jjcblanco'),
(657633383, 'asyncesp32webserver', 'https://github.com/jjcblanco/asyncesp32webserver', NULL, 'jjcblanco'),
(660633507, 'asyncwebserver', 'https://github.com/jjcblanco/asyncwebserver', NULL, 'jjcblanco'),
(683893432, 'sockets', 'https://github.com/jjcblanco/sockets', NULL, 'jjcblanco'),
(691284670, 'cursotesting1', 'https://github.com/jjcblanco/cursotesting1', NULL, 'jjcblanco'),
(691289679, 'ejemplocurso', 'https://github.com/jjcblanco/ejemplocurso', NULL, 'jjcblanco'),
(727488990, 'draft-irtf-cfrg-opaque', 'https://github.com/stef/draft-irtf-cfrg-opaque', 'The OPAQUE Asymmetric PAKE Protocol', 'stef'),
(770906908, 'loginvanilla', 'https://github.com/jjcblanco/loginvanilla', NULL, 'jjcblanco'),
(778020458, 'testingweb2024', 'https://github.com/jjcblanco/testingweb2024', NULL, 'jjcblanco'),
(828035663, 'app1', 'https://github.com/jjcblanco/app1', NULL, 'jjcblanco'),
(844774634, 'testingprueba', 'https://github.com/jjcblanco/testingprueba', 'Repositorio de prueba para el curso de testing', 'jjcblanco'),
(845762325, 'temporal', 'https://github.com/jjcblanco/temporal', NULL, 'jjcblanco'),
(862021132, 'muestrarepo', 'https://github.com/jjcblanco/muestrarepo', NULL, 'jjcblanco'),
(885882020, 'proyectoElReparador', 'https://github.com/StefiVergini/proyectoElReparador', NULL, 'stefiVergini'),
(934857077, 'djangohtmxtailwind', 'https://github.com/jjcblanco/djangohtmxtailwind', NULL, 'jjcblanco'),
(965809967, 'mi_proyecto', 'https://github.com/StefiVergini/mi_proyecto', NULL, 'stefiVergini'),
(966838510, 'deploywebtesting', 'https://github.com/jjcblanco/deploywebtesting', 'deploywebtesting', 'jjcblanco'),
(1001747896, 'Ejemplo-basico', 'https://github.com/jjcblanco/Ejemplo-basico', NULL, 'jjcblanco'),
(1003172773, 'StefaniaVergini-API-Github-MySQL', 'https://github.com/StefiVergini/StefaniaVergini-API-Github-MySQL', NULL, 'stefiVergini'),
(1007922994, 'API-y-Sockets', 'https://github.com/StefiVergini/API-y-Sockets', NULL, 'stefiVergini'),
(1007929185, 'APISockets-StefaniaVergini', 'https://github.com/StefiVergini/APISockets-StefaniaVergini', NULL, 'stefiVergini');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `followers`
--
ALTER TABLE `followers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `repositorios`
--
ALTER TABLE `repositorios`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
