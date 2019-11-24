-- phpMyAdmin SQL Dump
-- version 4.0.10deb1ubuntu0.1
-- http://www.phpmyadmin.net
--
-- Darbinė stotis: localhost
-- Atlikimo laikas: 2019 m. Bal 25 d. 15:29
-- Serverio versija: 5.5.62-0ubuntu0.14.04.1
-- PHP versija: 5.5.9-1ubuntu4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Duomenų bazė: `root`
--

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `status` int(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Sukurta duomenų kopija lentelei `admin`
--

INSERT INTO `admin` (`status`) VALUES
(1);

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `arasmasinos`
--

CREATE TABLE IF NOT EXISTS `arasmasinos` (
  `RangoNumeris` int(7) NOT NULL,
  `Burrito` int(1) NOT NULL,
  `Sparrow` int(1) NOT NULL,
  `FBIRancher` int(1) NOT NULL,
  `Enforcer` int(1) NOT NULL,
  `SWATTANK` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Sukurta duomenų kopija lentelei `arasmasinos`
--

INSERT INTO `arasmasinos` (`RangoNumeris`, `Burrito`, `Sparrow`, `FBIRancher`, `Enforcer`, `SWATTANK`) VALUES
(1, 0, 1, 0, 1, 0),
(2, 1, 0, 1, 0, 0),
(3, 0, 1, 1, 1, 0),
(4, 1, 1, 1, 0, 0),
(5, 1, 1, 1, 1, 1),
(6, 1, 1, 1, 1, 1),
(7, 1, 1, 1, 1, 1),
(1, 0, 1, 0, 1, 0),
(2, 1, 0, 1, 0, 0),
(3, 0, 1, 1, 1, 0),
(4, 1, 1, 1, 0, 0),
(5, 1, 1, 1, 1, 1),
(6, 1, 1, 1, 1, 1),
(7, 1, 1, 1, 1, 1),
(1, 0, 1, 0, 1, 0),
(2, 1, 0, 1, 0, 0),
(3, 0, 1, 1, 1, 0),
(4, 1, 1, 1, 0, 0),
(5, 1, 1, 1, 1, 1),
(6, 1, 1, 1, 1, 1),
(7, 1, 1, 1, 1, 1),
(1, 0, 1, 0, 1, 0),
(2, 1, 0, 1, 0, 0),
(3, 0, 1, 1, 1, 0),
(4, 1, 1, 1, 0, 0),
(5, 1, 1, 1, 1, 1),
(6, 1, 1, 1, 1, 1),
(7, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `armijosmasinos`
--

CREATE TABLE IF NOT EXISTS `armijosmasinos` (
  `RangoNumeris` int(7) NOT NULL,
  `Barracks` int(1) NOT NULL,
  `Patriot` int(1) NOT NULL,
  `BFInjection` int(1) NOT NULL,
  `Sanchez` int(1) NOT NULL,
  `Beagle` int(1) NOT NULL,
  `Andromada` int(1) NOT NULL,
  `Hydra` int(1) NOT NULL,
  `Hunter` int(1) NOT NULL,
  `Rhino` int(1) NOT NULL,
  `Raindance` int(1) NOT NULL,
  `Coastguard` int(1) NOT NULL,
  `Dinghy` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Sukurta duomenų kopija lentelei `armijosmasinos`
--

INSERT INTO `armijosmasinos` (`RangoNumeris`, `Barracks`, `Patriot`, `BFInjection`, `Sanchez`, `Beagle`, `Andromada`, `Hydra`, `Hunter`, `Rhino`, `Raindance`, `Coastguard`, `Dinghy`) VALUES
(1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 1, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0),
(4, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0),
(5, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0),
(6, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 0, 1),
(7, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1),
(1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 1, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0),
(4, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0),
(5, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0),
(6, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 0, 1),
(7, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 1, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0),
(4, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0),
(5, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0),
(6, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 0, 1),
(7, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1),
(1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 1, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0),
(4, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0),
(5, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0),
(6, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 0, 1),
(7, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `bans`
--

CREATE TABLE IF NOT EXISTS `bans` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Vardas` varchar(24) NOT NULL,
  `Adminas` varchar(24) NOT NULL,
  `Priezastis` varchar(50) NOT NULL,
  `Ipas` varchar(20) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `bussiness`
--

CREATE TABLE IF NOT EXISTS `bussiness` (
  `Idas` int(11) NOT NULL AUTO_INCREMENT,
  `ID` int(11) NOT NULL,
  `Nupirktas` int(1) NOT NULL,
  `Savininkas` varchar(24) NOT NULL,
  `Pavadinimas` text NOT NULL,
  `Pasaulis` int(5) NOT NULL,
  `X` int(12) NOT NULL,
  `Y` int(12) NOT NULL,
  `Z` int(12) NOT NULL,
  `Uzdarbis` int(11) NOT NULL,
  `Uzdirbta` int(11) NOT NULL,
  `Kaina` int(11) NOT NULL,
  `Gamykla` int(3) NOT NULL,
  `Mokesciai` int(11) NOT NULL,
  `alarm` int(11) NOT NULL,
  PRIMARY KEY (`Idas`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=68 ;

--
-- Sukurta duomenų kopija lentelei `bussiness`
--

INSERT INTO `bussiness` (`Idas`, `ID`, `Nupirktas`, `Savininkas`, `Pavadinimas`, `Pasaulis`, `X`, `Y`, `Z`, `Uzdarbis`, `Uzdirbta`, `Kaina`, `Gamykla`, `Mokesciai`, `alarm`) VALUES
(55, 7, 0, 'Nera', 'Vaistine-FC', 0, -183, 1213, 20, 10, 0, 800000, 0, 156, 0),
(67, 4, 0, 'Nera', 'Neste-OIL', 0, 60, 1227, 19, 13, 0, 63400, 0, 0, 0),
(62, 0, 0, 'Nera', 'VM', 0, -87, 1176, 20, 50, 0, 700000, 0, 0, 0),
(64, 1, 0, 'Nera', 'Bank', 0, -182, 1122, 20, 50, 0, 700000, 0, 0, 0),
(65, 2, 0, 'Nera', 'Regitra', 0, -801, 1426, 14, 70, 0, 900000, 0, 0, 0),
(66, 3, 1, 'Marco_Diaz', 'Neste-OIL', 0, 60, 1227, 19, 43, 32293, 63400, 2, 12, 1);

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `corleonemasinos`
--

CREATE TABLE IF NOT EXISTS `corleonemasinos` (
  `RangoNumeris` int(7) NOT NULL,
  `Maverick` int(1) NOT NULL,
  `Sanchez` int(1) NOT NULL,
  `Tahoma` int(1) NOT NULL,
  `Admiral` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Sukurta duomenų kopija lentelei `corleonemasinos`
--

INSERT INTO `corleonemasinos` (`RangoNumeris`, `Maverick`, `Sanchez`, `Tahoma`, `Admiral`) VALUES
(1, 0, 0, 1, 0),
(2, 0, 1, 1, 0),
(3, 0, 1, 1, 1),
(4, 1, 1, 1, 1),
(5, 1, 1, 1, 1),
(6, 1, 1, 1, 1),
(7, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `darbugalimiskinai`
--

CREATE TABLE IF NOT EXISTS `darbugalimiskinai` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `darboid` int(2) NOT NULL,
  `skinid` int(3) NOT NULL,
  `lytis` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=76 ;

--
-- Sukurta duomenų kopija lentelei `darbugalimiskinai`
--

INSERT INTO `darbugalimiskinai` (`id`, `darboid`, `skinid`, `lytis`) VALUES
(1, 1, 280, 0),
(2, 1, 281, 0),
(3, 1, 282, 0),
(4, 1, 266, 0),
(5, 1, 267, 0),
(6, 1, 283, 0),
(7, 1, 288, 0),
(8, 1, 306, 1),
(9, 1, 307, 1),
(10, 2, 240, 0),
(11, 2, 142, 0),
(12, 2, 69, 1),
(13, 2, 41, 1),
(14, 3, 50, 0),
(15, 3, 8, 0),
(16, 3, 198, 1),
(17, 3, 195, 1),
(18, 5, 276, 0),
(19, 5, 275, 0),
(20, 5, 308, 1),
(21, 6, 272, 0),
(22, 6, 261, 0),
(23, 6, 298, 1),
(24, 6, 56, 1),
(25, 13, 118, 0),
(26, 13, 120, 0),
(27, 13, 169, 1),
(28, 13, 224, 1),
(29, 15, 286, 0),
(30, 15, 165, 0),
(31, 15, 166, 0),
(32, 15, 309, 1),
(33, 15, 141, 1),
(34, 6, 217, 0),
(35, 6, 202, 0),
(36, 3, 292, 0),
(37, 3, 298, 1),
(38, 3, 298, 1),
(39, 13, 113, 0),
(40, 3, 42, 0),
(41, 3, 200, 0),
(42, 2, 189, 0),
(43, 5, 70, 0),
(44, 5, 254, 0),
(45, 5, 274, 0),
(46, 5, 216, 0),
(47, 15, 207, 0),
(48, 15, 287, 0),
(49, 15, 285, 0),
(50, 5, 216, 1),
(51, 5, 148, 1),
(52, 5, 216, 1),
(53, 5, 219, 1),
(54, 13, 28, 0),
(55, 13, 29, 0),
(56, 13, 29, 0),
(57, 13, 301, 0),
(58, 13, 305, 0),
(59, 15, 303, 1),
(60, 15, 303, 0),
(61, 15, 120, 0),
(62, 15, 33, 0),
(63, 15, 71, 0),
(64, 15, 163, 0),
(65, 15, 186, 0),
(66, 15, 295, 0),
(67, 3, 13, 1),
(68, 3, 65, 1),
(69, 3, 72, 0),
(70, 3, 73, 0),
(71, 3, 195, 1),
(72, 3, 268, 0),
(73, 5, 0, 0),
(74, 5, 0, 0),
(75, 1, 303, 1);

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `darbuskinai`
--

CREATE TABLE IF NOT EXISTS `darbuskinai` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `darboid` int(2) NOT NULL,
  `skinid` int(3) NOT NULL,
  `lytis` int(1) NOT NULL,
  `rangoid` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=99 ;

--
-- Sukurta duomenų kopija lentelei `darbuskinai`
--

INSERT INTO `darbuskinai` (`id`, `darboid`, `skinid`, `lytis`, `rangoid`) VALUES
(1, 1, 266, 0, 1),
(2, 2, 142, 0, 1),
(3, 3, 42, 0, 1),
(4, 5, 276, 0, 1),
(5, 6, 202, 0, 1),
(6, 13, 29, 0, 1),
(7, 15, 286, 0, 1),
(8, 1, 307, 1, 1),
(9, 2, 41, 1, 1),
(10, 3, 195, 1, 1),
(11, 5, 216, 1, 1),
(12, 6, 56, 1, 1),
(13, 13, 224, 1, 1),
(14, 15, 309, 1, 1),
(15, 1, 267, 0, 2),
(16, 2, 142, 0, 2),
(17, 3, 42, 0, 2),
(19, 6, 261, 0, 2),
(20, 13, 28, 0, 2),
(21, 15, 286, 0, 2),
(22, 1, 307, 1, 2),
(23, 2, 41, 1, 2),
(24, 3, 195, 1, 2),
(25, 5, 216, 1, 2),
(26, 6, 56, 1, 2),
(27, 13, 224, 1, 2),
(28, 15, 309, 1, 2),
(29, 1, 280, 0, 3),
(30, 2, 240, 0, 3),
(31, 3, 42, 0, 3),
(32, 5, 276, 0, 3),
(33, 6, 261, 0, 3),
(34, 13, 118, 0, 3),
(35, 15, 285, 0, 3),
(36, 1, 307, 1, 3),
(37, 2, 69, 1, 3),
(38, 3, 195, 1, 3),
(39, 5, 308, 1, 3),
(40, 6, 56, 1, 3),
(41, 13, 224, 1, 3),
(42, 15, 141, 1, 3),
(43, 1, 288, 0, 4),
(44, 2, 240, 0, 4),
(45, 3, 8, 0, 4),
(46, 5, 274, 0, 4),
(47, 6, 217, 0, 4),
(48, 13, 120, 0, 4),
(49, 15, 165, 0, 4),
(50, 1, 307, 1, 4),
(51, 2, 41, 1, 4),
(52, 3, 195, 1, 4),
(53, 5, 308, 1, 4),
(54, 6, 56, 1, 4),
(55, 13, 169, 1, 4),
(56, 15, 141, 1, 4),
(57, 1, 281, 0, 5),
(58, 2, 189, 0, 5),
(59, 3, 8, 0, 5),
(60, 5, 275, 0, 5),
(61, 6, 217, 0, 5),
(62, 13, 113, 0, 5),
(63, 15, 285, 0, 5),
(64, 1, 306, 1, 5),
(65, 2, 69, 1, 5),
(66, 3, 195, 1, 5),
(67, 5, 308, 1, 5),
(68, 6, 298, 1, 5),
(69, 13, 169, 1, 5),
(70, 15, 141, 1, 5),
(71, 1, 283, 0, 6),
(72, 2, 189, 0, 6),
(73, 3, 268, 0, 6),
(74, 5, 70, 0, 6),
(75, 6, 272, 0, 6),
(76, 13, 305, 0, 6),
(77, 15, 165, 0, 6),
(78, 1, 307, 1, 6),
(79, 2, 69, 1, 6),
(80, 3, 195, 1, 6),
(81, 5, 219, 1, 6),
(82, 6, 298, 1, 6),
(83, 13, 224, 1, 6),
(84, 15, 141, 1, 6),
(85, 1, 283, 0, 7),
(86, 2, 240, 0, 7),
(87, 3, 50, 0, 7),
(88, 5, 70, 0, 7),
(89, 6, 272, 0, 7),
(90, 13, 305, 0, 7),
(91, 15, 303, 0, 7),
(92, 1, 303, 1, 7),
(93, 2, 69, 1, 7),
(94, 3, 298, 1, 7),
(95, 5, 216, 1, 7),
(96, 6, 298, 1, 7),
(97, 13, 169, 1, 7),
(98, 15, 309, 1, 7);

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `dyleriaimasinos`
--

CREATE TABLE IF NOT EXISTS `dyleriaimasinos` (
  `RangoNumeris` int(7) NOT NULL,
  `Washington` int(1) NOT NULL,
  `Sabre` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Sukurta duomenų kopija lentelei `dyleriaimasinos`
--

INSERT INTO `dyleriaimasinos` (`RangoNumeris`, `Washington`, `Sabre`) VALUES
(1, 1, 0),
(2, 1, 0),
(3, 1, 1),
(4, 1, 1),
(5, 1, 1),
(6, 1, 1),
(7, 1, 1);

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `dzinutes`
--

CREATE TABLE IF NOT EXISTS `dzinutes` (
  `KokioDarboZinute` varchar(128) NOT NULL,
  `ArIjungtaZinute` int(1) NOT NULL,
  `ZinutesTekstas` varchar(512) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Sukurta duomenų kopija lentelei `dzinutes`
--

INSERT INTO `dzinutes` (`KokioDarboZinute`, `ArIjungtaZinute`, `ZinutesTekstas`) VALUES
('ETA-RADIO', 1, 'b?kite aktyvus nes gausite po inpejima, per viena diena praleist turite 50minu?iu'),
('Policija', 1, 'TS:  ts.sancarson.lt    pws:.policija123'),
('Furistai', 1, 'nepramusinek ts pasw'),
('Yardies', 1, 'ts pw ezwin'),
('Corleone', 1, 'b?kite aktyvus nes gausite po inpejima, per viena diena praleist turite 50minu?iu'),
('Dyleriai', 1, 'b?kite aktyvus nes gausite po inpejima, per viena diena praleist turite 50minu?iu'),
('Armija', 1, 'b?kite aktyvus nes gausite po inpejima, per viena diena praleist turite 50minu?iu'),
('Mechanika', 1, 'b?kite aktyvus nes gausite po inpejima, per viena diena praleist turite 50minu?iu'),
('Medicina', 1, 'Teamspeak kanalo pasw : Limuzinas'),
('Dyleriai', 1, 'b?kite aktyvus nes gausite po inpejima, per viena diena praleist turite 50minu?iu'),
('Taxi', 1, 'b?kite aktyvus nes gausite po inpejima, per viena diena praleist turite 50minu?iu'),
('GinkluPrekeiviai', 1, 'b?kite aktyvus nes gausite po inpejima, per viena diena praleist turite 50minu?iu'),
('Aras', 1, 'ts.sancarson.lt - ftbgeras');

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `etaradiomasinos`
--

CREATE TABLE IF NOT EXISTS `etaradiomasinos` (
  `RangoNumeris` int(7) NOT NULL,
  `Newsvan` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Sukurta duomenų kopija lentelei `etaradiomasinos`
--

INSERT INTO `etaradiomasinos` (`RangoNumeris`, `Newsvan`) VALUES
(1, 0),
(2, 0),
(3, 0),
(4, 0),
(5, 0),
(6, 0),
(7, 0);

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `furistaimasinos`
--

CREATE TABLE IF NOT EXISTS `furistaimasinos` (
  `RangoNumeris` int(7) NOT NULL,
  `Packer` int(1) NOT NULL,
  `Mule` int(1) NOT NULL,
  `Burrito` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Sukurta duomenų kopija lentelei `furistaimasinos`
--

INSERT INTO `furistaimasinos` (`RangoNumeris`, `Packer`, `Mule`, `Burrito`) VALUES
(1, 1, 1, 1),
(2, 0, 1, 0),
(3, 0, 1, 1),
(4, 1, 1, 1),
(5, 1, 1, 1),
(6, 1, 1, 1),
(7, 1, 1, 1);

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `furistukroviniai`
--

CREATE TABLE IF NOT EXISTS `furistukroviniai` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rangoid` int(1) NOT NULL,
  `vaistai` int(1) NOT NULL,
  `elprekes` int(1) NOT NULL,
  `mproduktai` int(1) NOT NULL,
  `paptr` int(1) NOT NULL,
  `sporttr` int(1) NOT NULL,
  `mototr` int(1) NOT NULL,
  `chemija` int(1) NOT NULL,
  `seklos` int(1) NOT NULL,
  `ginklai` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Sukurta duomenų kopija lentelei `furistukroviniai`
--

INSERT INTO `furistukroviniai` (`id`, `rangoid`, `vaistai`, `elprekes`, `mproduktai`, `paptr`, `sporttr`, `mototr`, `chemija`, `seklos`, `ginklai`) VALUES
(1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0),
(2, 2, 1, 1, 1, 0, 0, 0, 0, 0, 0),
(3, 3, 1, 1, 1, 0, 0, 1, 0, 0, 0),
(4, 4, 1, 1, 1, 1, 0, 1, 0, 0, 0),
(5, 5, 1, 1, 1, 1, 0, 1, 0, 0, 0),
(6, 6, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(7, 7, 1, 1, 1, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `gambling`
--

CREATE TABLE IF NOT EXISTS `gambling` (
  `bronze_user` int(12) NOT NULL,
  `silver_user` int(12) NOT NULL,
  `gold_user` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Sukurta duomenų kopija lentelei `gambling`
--

INSERT INTO `gambling` (`bronze_user`, `silver_user`, `gold_user`) VALUES
(2, 1, 0);

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `gangs2`
--

CREATE TABLE IF NOT EXISTS `gangs2` (
  `gID` int(4) NOT NULL,
  `gLeaderName` varchar(24) NOT NULL,
  `gName` varchar(33) NOT NULL,
  `gMoney` int(11) NOT NULL,
  `gReps` int(11) NOT NULL,
  `gSkin` int(4) NOT NULL,
  PRIMARY KEY (`gID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Sukurta duomenų kopija lentelei `gangs2`
--

INSERT INTO `gangs2` (`gID`, `gLeaderName`, `gName`, `gMoney`, `gReps`, `gSkin`) VALUES
(0, 'Marco_Diaz', 'Blagadariu', 0, 0, 124),
(1, 'Vilmis_Adidas', 'Black Guerrila Family', 0, 0, 0);

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `gangs_bases`
--

CREATE TABLE IF NOT EXISTS `gangs_bases` (
  `owns` int(11) NOT NULL,
  `lastTaken` int(11) NOT NULL,
  `0` int(11) NOT NULL,
  `1` int(11) NOT NULL,
  `2` int(11) NOT NULL,
  `3` int(11) NOT NULL,
  `4` int(11) NOT NULL,
  `baseid` int(11) NOT NULL,
  PRIMARY KEY (`baseid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Sukurta duomenų kopija lentelei `gangs_bases`
--

INSERT INTO `gangs_bases` (`owns`, `lastTaken`, `0`, `1`, `2`, `3`, `4`, `baseid`) VALUES
(1, 1538747985, 413, 468, 468, 492, 492, 0),
(3, 1538566834, 419, 468, 468, 445, 492, 1);

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `gangs_weps`
--

CREATE TABLE IF NOT EXISTS `gangs_weps` (
  `gangid` int(10) unsigned NOT NULL,
  `wepid` tinyint(3) unsigned NOT NULL,
  `ammo` int(10) unsigned NOT NULL,
  PRIMARY KEY (`gangid`,`wepid`),
  KEY `gangid` (`gangid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `gangs_zones`
--

CREATE TABLE IF NOT EXISTS `gangs_zones` (
  `zoneid` int(11) NOT NULL,
  `gangid` int(11) NOT NULL,
  `lastfight` int(11) NOT NULL,
  PRIMARY KEY (`zoneid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Sukurta duomenų kopija lentelei `gangs_zones`
--

INSERT INTO `gangs_zones` (`zoneid`, `gangid`, `lastfight`) VALUES
(0, 1, 1554631865),
(1, 3, 1554631722),
(2, 1, 1554631806),
(3, 3, 1554633101),
(4, 3, 1554632411),
(5, 3, 1554479409),
(6, 3, 1554414145),
(7, 3, 1554631038),
(8, 1, 1554634135),
(9, 1, 1554630307),
(10, 1, 1554633483),
(11, 3, 1554465366),
(12, -1, 1554905922),
(13, 3, 1554478091),
(14, 3, 1554477373),
(15, 3, 1554464695),
(16, 3, 1554411465),
(17, 3, 1554412743),
(18, 3, 1554539638),
(19, 3, 1554540380),
(20, 3, 1554406568),
(21, 3, 1554540691),
(22, 3, 1554407220),
(23, 3, 1554407867),
(24, 3, 1554408635),
(25, 3, 1554626337),
(26, 3, 1554627416),
(27, 1, 1554639842),
(28, 3, 1554906179),
(29, 1, 1554640473),
(30, 3, 1554410815),
(31, 3, 1554412104),
(32, 3, 1554539002),
(33, 3, 1554476621),
(34, 1, 1554639211),
(35, 1, 1554635004),
(36, 1, 1554638572),
(37, 1, 1554641179);

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `houses`
--

CREATE TABLE IF NOT EXISTS `houses` (
  `Idas` int(11) NOT NULL AUTO_INCREMENT,
  `ID` int(5) NOT NULL,
  `Owner` varchar(24) NOT NULL,
  `Buyed` int(1) NOT NULL,
  `Locked` int(1) NOT NULL,
  `Cost` int(11) NOT NULL,
  `KredKaina` int(11) NOT NULL,
  `IntX` float NOT NULL,
  `IntY` float NOT NULL,
  `IntZ` float NOT NULL,
  `IntAngle` float NOT NULL,
  `ExitX` float NOT NULL,
  `ExitY` float NOT NULL,
  `ExitZ` float NOT NULL,
  `ExitAngle` int(12) NOT NULL,
  `hInt` int(4) NOT NULL,
  `htVW` int(4) NOT NULL,
  `Money` int(11) NOT NULL,
  `Bill` int(11) NOT NULL,
  PRIMARY KEY (`Idas`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Sukurta duomenų kopija lentelei `houses`
--

INSERT INTO `houses` (`Idas`, `ID`, `Owner`, `Buyed`, `Locked`, `Cost`, `KredKaina`, `IntX`, `IntY`, `IntZ`, `IntAngle`, `ExitX`, `ExitY`, `ExitZ`, `ExitAngle`, `hInt`, `htVW`, `Money`, `Bill`) VALUES
(1, 0, 'Marco_Diaz', 1, 1, 320000, 0, 295.04, 1472.26, 1080.26, 360, -36.0405, 1115.65, 20.9398, 1, 15, 1, 11, -1),
(2, 1, 'Nera', 0, 1, 320000, 0, 295.04, 1472.26, 1080.26, 360, -10.9715, 1115.66, 20.9398, 0, 15, 2, 0, -1),
(3, 2, 'Nera', 0, 1, 320000, 0, 295.04, 1472.26, 1080.26, 360, 12.8163, 1113.67, 20.9398, 360, 15, 3, 0, -1),
(4, 3, 'Nera', 0, 1, 520000, 0, 235.34, 1186.68, 1080.26, 360, -369.755, 1169.56, 20.2716, 49, 3, 4, 0, -1),
(5, 4, 'Nera', 0, 1, 500000, 0, 235.34, 1186.68, 1080.26, 360, -278.922, 1003.07, 20.9398, 178, 3, 5, 0, -1),
(6, 5, 'Nera', 0, 1, 180000, 0, 22.8798, 1403.33, 1084.44, 360, -715.514, 1438.81, 18.8871, 266, 5, 6, 0, -1),
(7, 6, 'Nera', 0, 1, 150000, 0, 22.8798, 1403.33, 1084.44, 360, -743.002, 1432.58, 16.1149, 359, 5, 7, 0, -1),
(8, 7, 'Nera', 0, 1, 180000, 0, 22.8798, 1403.33, 1084.44, 360, -1491.47, 2685.99, 55.8591, 358, 5, 8, 0, -1),
(9, 8, 'Nera', 0, 1, 150000, 0, 22.8798, 1403.33, 1084.44, 360, -1529.18, 2685.72, 55.84, 69, 5, 9, 0, -1),
(10, 9, 'Nera', 0, 1, 180000, 0, 22.8798, 1403.33, 1084.44, 360, -1565.13, 2712, 55.8591, 77, 5, 10, 0, -1),
(11, 10, 'Nera', 0, 1, 200000, 0, 22.8798, 1403.33, 1084.44, 360, -1550.43, 2699.73, 56.2699, 266, 5, 11, 0, -1),
(13, 11, 'Nera', 0, 1, 1, 1, 140.17, 1366.07, 1083.65, 360, -0.7817, 1105.81, 19.4468, 275, 5, 12, 0, -1);

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `karteliopard`
--

CREATE TABLE IF NOT EXISTS `karteliopard` (
  `cocaine` int(7) NOT NULL,
  `cocainePrice` int(5) NOT NULL,
  `weed` int(7) NOT NULL,
  `weedPrice` int(5) NOT NULL,
  `gun1` int(7) NOT NULL,
  `gunPrice1` int(5) NOT NULL,
  `gun2` int(7) NOT NULL,
  `gunPrice2` int(5) NOT NULL,
  `gun3` int(7) NOT NULL,
  `gunPrice3` int(5) NOT NULL,
  `gun4` int(7) NOT NULL,
  `gunPrice4` int(5) NOT NULL,
  `gun5` int(7) NOT NULL,
  `gunPrice5` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Sukurta duomenų kopija lentelei `karteliopard`
--

INSERT INTO `karteliopard` (`cocaine`, `cocainePrice`, `weed`, `weedPrice`, `gun1`, `gunPrice1`, `gun2`, `gunPrice2`, `gun3`, `gunPrice3`, `gun4`, `gunPrice4`, `gun5`, `gunPrice5`) VALUES
(0, 200, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `laivai`
--

CREATE TABLE IF NOT EXISTS `laivai` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Savininkas` varchar(24) NOT NULL,
  `Modelis` int(3) NOT NULL,
  `xPos` float NOT NULL,
  `yPos` float NOT NULL,
  `zPos` float NOT NULL,
  `cPos` float NOT NULL,
  `DegaluTipas` int(1) NOT NULL,
  `Sudauzyta` int(1) NOT NULL,
  `Degalai` int(3) NOT NULL,
  `Color1` int(3) NOT NULL,
  `Color2` int(3) NOT NULL,
  `PaintJob` int(4) NOT NULL,
  `Rida` int(11) NOT NULL,
  `Gyvybes` float NOT NULL,
  `Radijas` int(1) NOT NULL,
  `Registruota` int(1) NOT NULL,
  `Tranzitiniai` text NOT NULL,
  `Raides` text NOT NULL,
  `Skaiciai` text NOT NULL,
  `Technikine` int(1) NOT NULL,
  `MasinaParduodama` int(1) NOT NULL,
  `mParduodamaKaina` int(11) NOT NULL,
  `Tuningas0` int(11) NOT NULL,
  `Tuningas1` int(11) NOT NULL,
  `Tuningas2` int(11) NOT NULL,
  `Tuningas3` int(11) NOT NULL,
  `Tuningas4` int(4) NOT NULL,
  `Tuningas5` int(4) NOT NULL,
  `Tuningas6` int(4) NOT NULL,
  `Tuningas7` int(4) NOT NULL,
  `Tuningas8` int(4) NOT NULL,
  `Tuningas9` int(4) NOT NULL,
  `Tuningas10` int(4) NOT NULL,
  `Tuningas11` int(4) NOT NULL,
  `Tuningas12` int(4) NOT NULL,
  `Tuningas13` int(4) NOT NULL,
  `KiekZuvies` int(5) NOT NULL,
  `TalposTipas` int(1) NOT NULL,
  `Tinklas` int(1) NOT NULL,
  `Racija` int(1) NOT NULL,
  `Echolotas` int(1) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `logai`
--

CREATE TABLE IF NOT EXISTS `logai` (
  `data` date NOT NULL,
  `text` int(12) NOT NULL,
  `player` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `log_email`
--

CREATE TABLE IF NOT EXISTS `log_email` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(40) NOT NULL,
  `receive` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `mechanikumasinos`
--

CREATE TABLE IF NOT EXISTS `mechanikumasinos` (
  `RangoNumeris` int(7) NOT NULL,
  `Towtruck` int(1) NOT NULL,
  `DFT30` int(1) NOT NULL,
  `Forklif` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Sukurta duomenų kopija lentelei `mechanikumasinos`
--

INSERT INTO `mechanikumasinos` (`RangoNumeris`, `Towtruck`, `DFT30`, `Forklif`) VALUES
(1, 1, 0, 0),
(2, 1, 0, 1),
(3, 1, 0, 1),
(4, 1, 1, 1),
(5, 1, 1, 1),
(6, 1, 1, 1),
(7, 1, 1, 1);

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `medikumasinos`
--

CREATE TABLE IF NOT EXISTS `medikumasinos` (
  `RangoNumeris` int(7) NOT NULL,
  `Ambulance` int(2) NOT NULL,
  `Firetruck` int(2) NOT NULL,
  `Leviathan` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Sukurta duomenų kopija lentelei `medikumasinos`
--

INSERT INTO `medikumasinos` (`RangoNumeris`, `Ambulance`, `Firetruck`, `Leviathan`) VALUES
(1, 1, 0, 0),
(2, 1, 1, 0),
(3, 1, 1, 0),
(4, 1, 1, 1),
(5, 1, 1, 1),
(6, 1, 1, 1),
(7, 1, 1, 1);

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `news`
--

CREATE TABLE IF NOT EXISTS `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8_lithuanian_ci NOT NULL,
  `author` varchar(30) CHARACTER SET latin1 NOT NULL,
  `date` varchar(30) CHARACTER SET latin1 NOT NULL,
  `content` mediumtext COLLATE utf8_lithuanian_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci AUTO_INCREMENT=10 ;

--
-- Sukurta duomenų kopija lentelei `news`
--

INSERT INTO `news` (`id`, `title`, `author`, `date`, `content`) VALUES
(9, 'Serverio atnaujinimas', 'Scripting_Game', '2018-02-15 11:44', 'Labas skubėkite rašyti atnaujinima nes bus pipiec :DDD');

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `pagamintoscar`
--

CREATE TABLE IF NOT EXISTS `pagamintoscar` (
  `PagamintaComet` int(6) NOT NULL,
  `PagamintaMerit` int(6) NOT NULL,
  `PagamintaFeltzer` int(6) NOT NULL,
  `PagamintaWindsor` int(6) NOT NULL,
  `PagamintaBlade` int(6) NOT NULL,
  `PagamintaStratum` int(6) NOT NULL,
  `PagamintaTampa` int(6) NOT NULL,
  `PagamintaFlash` int(6) NOT NULL,
  `PagamintaHuntley` int(6) NOT NULL,
  `PagamintaAdmiral` int(6) NOT NULL,
  `PagamintaStallion` int(6) NOT NULL,
  `PagamintaRegina` int(6) NOT NULL,
  `PagamintaFortune` int(6) NOT NULL,
  `PagamintaSunrise` int(6) NOT NULL,
  `PagamintaBlista` int(6) NOT NULL,
  `PagamintaSolair` int(6) NOT NULL,
  `PagamintaEuros` int(6) NOT NULL,
  `PagamintaBurrito` int(6) NOT NULL,
  `PagamintaManana` int(6) NOT NULL,
  `PagamintaRancher` int(6) NOT NULL,
  `PagamintaUranus` int(6) NOT NULL,
  `PagamintaIntruder` int(6) NOT NULL,
  `PagamintaFreeway` int(6) NOT NULL,
  `PagamintaSanchez` int(6) NOT NULL,
  `PagamintaNRG` int(6) NOT NULL,
  `PagamintaWayfarer` int(6) NOT NULL,
  `PagamintaBF400` int(6) NOT NULL,
  `PagamintaQuad` int(6) NOT NULL,
  `PagamintaPCJ600` int(6) NOT NULL,
  `PagamintaElegy` int(6) NOT NULL,
  `PagamintaSultan` int(6) NOT NULL,
  `PagamintaBanshee` int(6) NOT NULL,
  `PagamintaBuffalo` int(6) NOT NULL,
  `PagamintaBullet` int(6) NOT NULL,
  `PagamintaCheetah` int(6) NOT NULL,
  `PagamintaInfernus` int(6) NOT NULL,
  `PagamintaSuperGT` int(6) NOT NULL,
  `PagamintaTurismo` int(6) NOT NULL,
  `PagamintaZR350` int(6) NOT NULL,
  `PADalys` int(6) NOT NULL,
  `SADalys` int(6) NOT NULL,
  `MDalys` int(6) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Sukurta duomenų kopija lentelei `pagamintoscar`
--

INSERT INTO `pagamintoscar` (`PagamintaComet`, `PagamintaMerit`, `PagamintaFeltzer`, `PagamintaWindsor`, `PagamintaBlade`, `PagamintaStratum`, `PagamintaTampa`, `PagamintaFlash`, `PagamintaHuntley`, `PagamintaAdmiral`, `PagamintaStallion`, `PagamintaRegina`, `PagamintaFortune`, `PagamintaSunrise`, `PagamintaBlista`, `PagamintaSolair`, `PagamintaEuros`, `PagamintaBurrito`, `PagamintaManana`, `PagamintaRancher`, `PagamintaUranus`, `PagamintaIntruder`, `PagamintaFreeway`, `PagamintaSanchez`, `PagamintaNRG`, `PagamintaWayfarer`, `PagamintaBF400`, `PagamintaQuad`, `PagamintaPCJ600`, `PagamintaElegy`, `PagamintaSultan`, `PagamintaBanshee`, `PagamintaBuffalo`, `PagamintaBullet`, `PagamintaCheetah`, `PagamintaInfernus`, `PagamintaSuperGT`, `PagamintaTurismo`, `PagamintaZR350`, `PADalys`, `SADalys`, `MDalys`) VALUES
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 48, 57, 40, 45, 32, 13, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10);

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `patalpos`
--

CREATE TABLE IF NOT EXISTS `patalpos` (
  `Idas` int(11) NOT NULL AUTO_INCREMENT,
  `ID` int(11) NOT NULL,
  `Nupirktas` int(1) NOT NULL,
  `Savininkas` varchar(24) NOT NULL,
  `Pavadinimas` text NOT NULL,
  `Pasaulis` int(5) NOT NULL,
  `X` int(12) NOT NULL,
  `Y` int(12) NOT NULL,
  `Z` int(12) NOT NULL,
  `Uzdarbis` int(11) NOT NULL,
  `Uzdirbta` int(11) NOT NULL,
  `Kaina` int(11) NOT NULL,
  `Tipas` int(3) NOT NULL,
  `Produkcija` int(5) NOT NULL,
  `KiekNark` int(8) NOT NULL,
  PRIMARY KEY (`Idas`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=95 ;

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `pdkonfiskuota`
--

CREATE TABLE IF NOT EXISTS `pdkonfiskuota` (
  `Zole` int(11) NOT NULL,
  `Krekas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Sukurta duomenų kopija lentelei `pdkonfiskuota`
--

INSERT INTO `pdkonfiskuota` (`Zole`, `Krekas`) VALUES
(0, 0);

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `policijosmasinos`
--

CREATE TABLE IF NOT EXISTS `policijosmasinos` (
  `RangoNumeris` int(7) NOT NULL,
  `Sultan` int(2) NOT NULL,
  `SFPD` int(2) NOT NULL,
  `PoliceMaverick` int(2) NOT NULL,
  `Ranger` int(2) NOT NULL,
  `HPV1000` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Sukurta duomenų kopija lentelei `policijosmasinos`
--

INSERT INTO `policijosmasinos` (`RangoNumeris`, `Sultan`, `SFPD`, `PoliceMaverick`, `Ranger`, `HPV1000`) VALUES
(1, 0, 1, 0, 1, 0),
(2, 0, 1, 0, 0, 1),
(3, 0, 1, 0, 1, 1),
(4, 1, 1, 1, 1, 1),
(5, 1, 1, 1, 1, 1),
(6, 1, 1, 1, 1, 1),
(7, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `rangai`
--

CREATE TABLE IF NOT EXISTS `rangai` (
  `KokioDarboRangas` varchar(128) NOT NULL,
  `Rangas1` varchar(128) NOT NULL,
  `Rangas2` varchar(128) NOT NULL,
  `Rangas3` varchar(128) NOT NULL,
  `Rangas4` varchar(128) NOT NULL,
  `Rangas5` varchar(128) NOT NULL,
  `Rangas6` varchar(128) NOT NULL,
  `Rangas7` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Sukurta duomenų kopija lentelei `rangai`
--

INSERT INTO `rangai` (`KokioDarboRangas`, `Rangas1`, `Rangas2`, `Rangas3`, `Rangas4`, `Rangas5`, `Rangas6`, `Rangas7`) VALUES
('Policija', 'Naujokas(-?)', 'Patyræs(-us)', 'Policininkas(-?)', 'Senbuvis(-?)', 'Inspektorius(-?)', 'Pavaduotojas(-a)', 'Direktorius(-?)'),
('Medikai', 'Rezidentas', 'Pad?j?jas', 'Daktaras', 'Vyr.Daktaras', 'Chirurgas', 'Karo medikas(-e', 'Administracija'),
('Mechanikai', 'Naujokas', 'Tepalinis', 'Suvirintojas', 'Meistras', 'Veteranas', 'Kost?', 'Vald?ia'),
('Taxi', 'Klevas', 'Patyres Naujokas-(?)', 'Du?manas-(?)', 'Senbuvis', 'Transporteris', 'Direktorius', 'Direktor?'),
('ETA-RADIO', 'Pradedantysis', 'Apsiprates', 'Vietinis radistas', 'Radistas', 'Didzejus', 'Tusininkas', 'Valdzia'),
('Furistai', 'Naujok?lis', 'Apsipratæs', '?siva?iavæs', 'Patyræs', 'Malad?c', 'Keliu erelis', 'Valdzia'),
('Dyleriai', 'Gamintojas', 'Floristas', 'Mokantis', 'Dyleris', '420', 'Pri?i?r?tojas', 'Vald?ia'),
('Yardies', 'Rajoninis', 'Marozas', 'V?rhas', 'Gangsteris', 'Mafijozas', 'Patyres', 'Krik?tat?vis'),
('Corleone', 'Naujokas', 'Pasiuntinys', 'Smogikas', 'I?manantis savo darb?.', 'Bosas', 'Pavaduotojas', 'Vald?ia'),
('Aras', 'Naujok?lis', 'N?ra', 'Agentas', 'N?ra', 'Leitenantas', 'N?ra', 'Generolas'),
('Armija', 'Naujokas', 'Patrulis', 'Kvalifikuotas Hydrai', 'Kvalifikuotas Hunteriui', 'Pilotas', 'Ved?jas.', 'Vadas');

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `rekordasi`
--

CREATE TABLE IF NOT EXISTS `rekordasi` (
  `rekordas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Sukurta duomenų kopija lentelei `rekordasi`
--

INSERT INTO `rekordasi` (`rekordas`) VALUES
(23);

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `sandeliai`
--

CREATE TABLE IF NOT EXISTS `sandeliai` (
  `DyleriaiGun` int(7) NOT NULL,
  `DyleriaiNark` int(7) NOT NULL,
  `DyleriaiZole` int(7) NOT NULL,
  `DyleriaiSeklos` int(7) NOT NULL,
  `DyleriaiChemija` int(7) NOT NULL,
  `ZaliaMesa` int(5) NOT NULL,
  `PerdirbtaMesa` int(5) NOT NULL,
  `FasuotaMesa` int(5) NOT NULL,
  `GP18TH` int(11) NOT NULL,
  `Vaistai1` int(2) NOT NULL,
  `Vaistai2` int(2) NOT NULL,
  `Vaistai3` int(2) NOT NULL,
  `SkalbPriemones` int(2) NOT NULL,
  `GunSanPak` int(2) NOT NULL,
  `PagamintaVaistu` int(11) NOT NULL,
  PRIMARY KEY (`DyleriaiGun`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Sukurta duomenų kopija lentelei `sandeliai`
--

INSERT INTO `sandeliai` (`DyleriaiGun`, `DyleriaiNark`, `DyleriaiZole`, `DyleriaiSeklos`, `DyleriaiChemija`, `ZaliaMesa`, `PerdirbtaMesa`, `FasuotaMesa`, `GP18TH`, `Vaistai1`, `Vaistai2`, `Vaistai3`, `SkalbPriemones`, `GunSanPak`, `PagamintaVaistu`) VALUES
(28, 20, 16, 336, 324, 68, 149, 32, 1000, 0, 0, 0, 248, 80315, 0);

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `side_panels`
--

CREATE TABLE IF NOT EXISTS `side_panels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) CHARACTER SET utf8 COLLATE utf8_lithuanian_ci NOT NULL,
  `content` mediumtext CHARACTER SET utf8 COLLATE utf8_lithuanian_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `sms_log`
--

CREATE TABLE IF NOT EXISTS `sms_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `idas` int(11) NOT NULL,
  `suma` int(11) NOT NULL,
  `data` varchar(50) NOT NULL,
  `nickas` varchar(50) NOT NULL,
  `apmoketa` int(11) NOT NULL,
  `paslauga` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=619 ;

--
-- Sukurta duomenų kopija lentelei `sms_log`
--

INSERT INTO `sms_log` (`ID`, `idas`, `suma`, `data`, `nickas`, `apmoketa`, `paslauga`) VALUES
(521, 274868, 1, '2018-10-10 17:34:36', ' Big_Daddy', 1, ''),
(522, 273857, 1, '2018-10-01 14:53:15', ' Undead_Rip', 1, ''),
(523, 267809, 1, '2018-08-01 15:59:51', ' Mister_Johny', 1, ''),
(524, 267737, 1, '2018-07-31 21:00:13', ' Big_Daddy', 1, ''),
(525, 267586, 1, '2018-07-29 14:37:14', ' MikisDrg', 1, ''),
(526, 267582, 1, '2018-07-29 13:04:06', ' Mister_Johny', 1, ''),
(527, 267457, 1, '2018-07-27 15:57:57', ' Royal_Queen', 1, ''),
(528, 267449, 1, '2018-07-27 14:07:46', ' Scripting_Game', 1, ''),
(529, 267296, 3, '2018-07-23 21:43:32', ' Dede_Quattro', 1, ''),
(530, 267113, 2, '2018-07-20 20:07:44', ' Puodelis_Malboro', 1, ''),
(531, 267110, 1, '2018-07-20 18:57:10', ' Jimmy_Marlboro', 1, ''),
(532, 267107, 1, '2018-07-20 18:11:28', ' Jimmy_Marlboro', 1, ''),
(533, 267104, 3, '2018-07-20 17:01:19', ' Jimmy_Marlboro', 1, ''),
(534, 267009, 2, '2018-07-19 17:45:08', ' Puodelis_Malboro', 1, ''),
(535, 266939, 2, '2018-07-18 14:07:19', ' Puodelis_Malboro', 1, ''),
(536, 266332, 4, '2018-07-12 13:20:37', ' Nothing_Personal', 1, ''),
(537, 266036, 8, '2018-07-09 11:29:43', ' Samp_Electro', 1, ''),
(538, 264988, 1, '2018-06-23 09:33:07', ' Puma_Shot', 1, ''),
(539, 264982, 2, '2018-06-22 19:28:36', ' Nothing_Personal', 1, ''),
(540, 264907, 1, '2018-06-22 09:55:41', ' Daniel_Kokk', 1, ''),
(541, 264861, 1, '2018-06-21 13:53:06', ' Puma_Shot', 1, ''),
(542, 264853, 8, '2018-06-21 11:46:26', ' Samp_Electro', 1, ''),
(543, 264456, 2, '2018-06-13 17:46:58', ' The_Bass', 1, ''),
(544, 264455, 1, '2018-06-13 14:37:49', ' Milan_Mafijozas', 1, ''),
(545, 264409, 1, '2018-06-13 10:05:27', ' Milan_Mafijozas', 1, ''),
(546, 264392, 1, '2018-06-13 00:21:38', ' Milan_Mafijozas', 1, ''),
(547, 264297, 4, '2018-06-11 14:24:23', ' Eco_Dirt', 1, ''),
(548, 264294, 4, '2018-06-11 14:11:40', ' John_Toreno', 1, ''),
(549, 264232, 2, '2018-06-10 18:00:56', ' Pijus_Saja', 1, ''),
(550, 264223, 1, '2018-06-10 17:36:38', ' Tosha_Shadow', 1, ''),
(551, 264194, 2, '2018-06-09 19:48:21', ' John_Toreno', 1, ''),
(552, 264139, 1, '2018-06-08 19:43:37', ' Senasis_Vilkas', 1, ''),
(553, 263824, 1, '2018-06-06 08:52:56', ' Kajus_Breidis', 1, ''),
(554, 263823, 3, '2018-06-06 08:50:40', ' Kajus_Breidis', 1, ''),
(555, 263635, 1, '2018-06-02 19:18:36', ' Karolis_Gold', 1, ''),
(556, 263633, 1, '2018-06-02 16:23:33', ' Eco_Dirt', 1, ''),
(557, 263282, 1, '2018-05-30 00:49:13', ' Benjarck_Brack', 1, ''),
(558, 263281, 1, '2018-05-30 00:08:33', ' Tolik_Jibolik', 1, ''),
(559, 262765, 1, '2018-05-23 16:43:28', ' Vilius_Kents', 1, ''),
(560, 260419, 2, '2018-04-27 16:00:38', ' Scripting_Game', 1, ''),
(561, 260418, 8, '2018-04-27 16:00:26', ' Scripting_Game', 1, ''),
(562, 260315, 3, '2018-04-26 20:00:38', ' Scripting_Game', 1, ''),
(563, 260186, 2, '2018-04-24 22:38:43', ' Pagauk_Kampa', 1, ''),
(564, 259895, 4, '2018-04-22 11:52:21', ' Pagauk_Kampa', 1, ''),
(565, 259501, 2, '2018-04-16 15:41:44', ' Tony_Puma', 1, ''),
(566, 259478, 3, '2018-04-16 15:19:42', ' Tony_Puma', 1, ''),
(567, 259356, 5, '2018-04-15 18:47:37', ' Cezaris_Zaremba', 1, ''),
(568, 259240, 4, '2018-04-14 09:31:03', ' Mike_Falcon', 1, ''),
(569, 259070, 1, '2018-04-12 15:59:13', ' Linas_Tunnex', 1, ''),
(570, 259066, 1, '2018-04-12 15:46:07', ' Linas_Tunnex', 1, ''),
(571, 258532, 2, '2018-04-05 18:20:31', ' Cezaris_Zaremba', 1, ''),
(572, 258470, 1, '2018-04-04 19:03:27', ' Cezaris_Zaremba', 1, ''),
(573, 258302, 1, '2018-04-02 17:04:10', ' Cezaris_Zaremba', 1, ''),
(574, 257425, 1, '2018-03-20 16:00:40', ' Damian_Winstonz', 1, ''),
(575, 257423, 1, '2018-03-20 15:25:16', ' Vakariux_Good', 1, ''),
(576, 257415, 2, '2018-03-20 14:19:59', ' Zygis_Winstonz', 1, ''),
(577, 256909, 1, '2018-03-10 16:01:32', ' Royal_Queen', 1, ''),
(578, 256908, 1, '2018-03-10 15:52:43', ' Wade_Hebert', 1, ''),
(579, 255269, 1, '2018-02-20 10:42:17', ' Zygis_Winstonz', 1, ''),
(580, 255234, 2, '2018-02-19 17:30:35', ' Mafijozas_Narkotikas', 1, ''),
(581, 255106, 1, '2018-02-18 13:49:01', ' Matthew_Lewis', 1, ''),
(582, 254617, 1, '2018-02-11 16:43:19', ' Marius_Markyto', 1, ''),
(583, 254379, 1, '2018-02-06 15:06:47', ' Nelson_Flori', 1, ''),
(584, 254289, 1, '2018-02-04 18:07:46', ' Mafijozas_Narkotikas', 1, ''),
(585, 254271, 1, '2018-02-04 13:22:51', ' Mafijozas_Narkotikas', 1, ''),
(586, 254190, 1, '2018-02-02 22:06:55', ' Grumblys_Compaq', 1, ''),
(587, 254184, 1, '2018-02-02 20:40:45', ' Grumblys_Compaq', 1, ''),
(588, 254176, 1, '2018-02-02 16:44:08', ' Grumblys_Compaq', 1, ''),
(589, 253845, 1, '2018-01-27 21:29:43', ' Steve_Xever', 1, ''),
(590, 253810, 1, '2018-01-27 00:45:28', ' Grumblys_Compaq', 1, ''),
(591, 253785, 1, '2018-01-26 15:49:39', ' Marcius_Riperino', 1, ''),
(592, 253524, 2, '2018-01-23 19:54:10', ' Nous_Steal', 1, ''),
(593, 251865, 1, '2017-12-31 23:36:33', ' Franky_Ricomani', 1, ''),
(594, 251730, 1, '2017-12-29 13:06:22', ' Devqion_Gordon', 1, ''),
(595, 251715, 1, '2017-12-28 23:07:03', ' Bendec_Power', 1, ''),
(596, 251320, 1, '2017-12-23 16:09:30', ' Nedas_Kawasaki', 1, ''),
(597, 246293, 1, '2017-10-01 10:02:10', ' Scripting_Game 127.0.1.1', 1, ''),
(598, 246292, 2, '2017-10-01 10:00:24', ' Scripting_Game RCON', 1, ''),
(599, 244539, 1, '2017-09-11 17:01:04', ' Scripting_Game VIP', 1, ''),
(600, 240069, 1, '2017-07-06 12:45:04', ' Tautvis_Game', 1, ''),
(602, 277487, 3, '2018-11-12 16:03:25', 'CS', 1, ''),
(603, 277487, 3, '2019-04-01 02:43:20', 'Barry_Thorne', 1, 'coins'),
(612, 288525, 1, '2019-03-11 23:55:31', '89.117.253.32', 1, 'unbanip'),
(613, 289263, 2, '2019-03-19 21:15:42', 'Andrey_Robertounbanf', 1, ''),
(614, 289484, 6, '2019-03-22 12:38:41', 'csgopaskyra', 1, ''),
(615, 289485, 2, '2019-03-22 12:39:30', 'csgopaskyra', 1, ''),
(616, 289945, 1, '2019-03-31 18:55:59', 'Justis_Carleone', 1, ''),
(617, 290055, 1, '2019-04-01 15:37:28', 'Alkad_Balani', 1, ''),
(618, 290507, 8, '2019-04-05 13:49:58', 'Cayle_Horizon', 1, '');

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `taksimasinos`
--

CREATE TABLE IF NOT EXISTS `taksimasinos` (
  `RangoNumeris` int(7) NOT NULL,
  `Jester` int(1) NOT NULL,
  `Taxi` int(1) NOT NULL,
  `Moonbeam` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Sukurta duomenų kopija lentelei `taksimasinos`
--

INSERT INTO `taksimasinos` (`RangoNumeris`, `Jester`, `Taxi`, `Moonbeam`) VALUES
(1, 0, 1, 0),
(2, 0, 1, 1),
(3, 0, 1, 1),
(4, 1, 1, 1),
(5, 1, 1, 1),
(6, 1, 1, 1),
(7, 1, 1, 1);

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `turgujecar`
--

CREATE TABLE IF NOT EXISTS `turgujecar` (
  `TurgujeComet` int(6) NOT NULL,
  `TurgujeMerit` int(6) NOT NULL,
  `TurgujeFeltzer` int(6) NOT NULL,
  `TurgujeWindsor` int(6) NOT NULL,
  `TurgujeBlade` int(6) NOT NULL,
  `TurgujeStratum` int(6) NOT NULL,
  `TurgujeTampa` int(6) NOT NULL,
  `TurgujeFlash` int(6) NOT NULL,
  `TurgujeHuntley` int(6) NOT NULL,
  `TurgujeAdmiral` int(6) NOT NULL,
  `TurgujeStallion` int(6) NOT NULL,
  `TurgujeRegina` int(6) NOT NULL,
  `TurgujeFortune` int(6) NOT NULL,
  `TurgujeSunrise` int(6) NOT NULL,
  `TurgujeBlista` int(6) NOT NULL,
  `TurgujeSolair` int(6) NOT NULL,
  `TurgujeEuros` int(6) NOT NULL,
  `TurgujeBurrito` int(6) NOT NULL,
  `TurgujeManana` int(6) NOT NULL,
  `TurgujeRancher` int(6) NOT NULL,
  `TurgujeUranus` int(6) NOT NULL,
  `TurgujeIntruder` int(6) NOT NULL,
  `TurgujeFreeway` int(6) NOT NULL,
  `TurgujeSanchez` int(6) NOT NULL,
  `TurgujeNRG` int(6) NOT NULL,
  `TurgujeWayfarer` int(6) NOT NULL,
  `TurgujeBF400` int(6) NOT NULL,
  `TurgujeQuad` int(6) NOT NULL,
  `TurgujePCJ600` int(6) NOT NULL,
  `TurgujeElegy` int(6) NOT NULL,
  `TurgujeSultan` int(6) NOT NULL,
  `TurgujeBanshee` int(6) NOT NULL,
  `TurgujeBuffalo` int(6) NOT NULL,
  `TurgujeBullet` int(6) NOT NULL,
  `TurgujeCheetah` int(6) NOT NULL,
  `TurgujeInfernus` int(6) NOT NULL,
  `TurgujeSuperGT` int(6) NOT NULL,
  `TurgujeTurismo` int(6) NOT NULL,
  `TurgujeZR350` int(6) NOT NULL,
  `TurgujeReefer` int(6) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Sukurta duomenų kopija lentelei `turgujecar`
--

INSERT INTO `turgujecar` (`TurgujeComet`, `TurgujeMerit`, `TurgujeFeltzer`, `TurgujeWindsor`, `TurgujeBlade`, `TurgujeStratum`, `TurgujeTampa`, `TurgujeFlash`, `TurgujeHuntley`, `TurgujeAdmiral`, `TurgujeStallion`, `TurgujeRegina`, `TurgujeFortune`, `TurgujeSunrise`, `TurgujeBlista`, `TurgujeSolair`, `TurgujeEuros`, `TurgujeBurrito`, `TurgujeManana`, `TurgujeRancher`, `TurgujeUranus`, `TurgujeIntruder`, `TurgujeFreeway`, `TurgujeSanchez`, `TurgujeNRG`, `TurgujeWayfarer`, `TurgujeBF400`, `TurgujeQuad`, `TurgujePCJ600`, `TurgujeElegy`, `TurgujeSultan`, `TurgujeBanshee`, `TurgujeBuffalo`, `TurgujeBullet`, `TurgujeCheetah`, `TurgujeInfernus`, `TurgujeSuperGT`, `TurgujeTurismo`, `TurgujeZR350`, `TurgujeReefer`) VALUES
(2, 20, 18, 18, 19, 18, 17, 18, 18, 20, 20, 15, 18, 19, 19, 12, 19, 19, 19, 19, 17, 18, 25, 25, 21, 25, 25, 29, 27, 20, 22, 23, 22, 23, 23, 19, 23, 24, 23, 0),
(2, 20, 18, 18, 19, 18, 17, 18, 18, 20, 20, 15, 18, 19, 19, 12, 19, 19, 19, 19, 17, 18, 25, 25, 21, 25, 25, 29, 27, 20, 22, 23, 22, 23, 23, 19, 23, 24, 23, 0);

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `vehicle`
--

CREATE TABLE IF NOT EXISTS `vehicle` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Savininkas` varchar(24) NOT NULL,
  `Modelis` int(3) NOT NULL,
  `xPos` float NOT NULL,
  `yPos` float NOT NULL,
  `zPos` float NOT NULL,
  `cPos` float NOT NULL,
  `DegaluTipas` int(1) NOT NULL,
  `Sudauzyta` int(1) NOT NULL,
  `Degalai` int(3) NOT NULL,
  `Color1` int(3) NOT NULL,
  `Color2` int(3) NOT NULL,
  `PaintJob` int(4) NOT NULL,
  `Rida` int(11) NOT NULL,
  `Gyvybes` float NOT NULL,
  `Radijas` int(1) NOT NULL,
  `Registruota` int(1) NOT NULL,
  `Tranzitiniai` text NOT NULL,
  `Raides` text NOT NULL,
  `Skaiciai` text NOT NULL,
  `Technikine` int(1) NOT NULL,
  `MasinaParduodama` int(1) NOT NULL,
  `mParduodamaKaina` int(11) NOT NULL,
  `Akumuliatorius` int(11) NOT NULL,
  `Tuningas0` int(11) NOT NULL,
  `Tuningas1` int(11) NOT NULL,
  `Tuningas2` int(11) NOT NULL,
  `Tuningas3` int(11) NOT NULL,
  `Tuningas4` int(4) NOT NULL,
  `Tuningas5` int(4) NOT NULL,
  `Tuningas6` int(4) NOT NULL,
  `Tuningas7` int(4) NOT NULL,
  `Tuningas8` int(4) NOT NULL,
  `Tuningas9` int(4) NOT NULL,
  `Tuningas10` int(4) NOT NULL,
  `Tuningas11` int(4) NOT NULL,
  `Tuningas12` int(4) NOT NULL,
  `Tuningas13` int(4) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=32 ;

--
-- Sukurta duomenų kopija lentelei `vehicle`
--

INSERT INTO `vehicle` (`Id`, `Savininkas`, `Modelis`, `xPos`, `yPos`, `zPos`, `cPos`, `DegaluTipas`, `Sudauzyta`, `Degalai`, `Color1`, `Color2`, `PaintJob`, `Rida`, `Gyvybes`, `Radijas`, `Registruota`, `Tranzitiniai`, `Raides`, `Skaiciai`, `Technikine`, `MasinaParduodama`, `mParduodamaKaina`, `Akumuliatorius`, `Tuningas0`, `Tuningas1`, `Tuningas2`, `Tuningas3`, `Tuningas4`, `Tuningas5`, `Tuningas6`, `Tuningas7`, `Tuningas8`, `Tuningas9`, `Tuningas10`, `Tuningas11`, `Tuningas12`, `Tuningas13`) VALUES
(1, 'Arnas_Fabuniz', 458, 157.375, 1183.37, 15.7296, 142.983, 1, 0, 46, 118, 118, -1, 12, 0, 0, 0, '{FF0000}59789BJ', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 'Russel_Gray', 458, 733.813, 1973.64, 7.27598, 8.08104, 1, 1, 38, 36, 36, -1, 51, 0, 0, 0, '{FF0000}35184BJ', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 'Lioneli_Mesi', 480, -507.232, 2601.39, 53.4592, 121.799, 0, 0, 57, 2, 0, -1, 68, 0, 0, 0, '{FF0000}15590BJ', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1074, 0, 0, 0, 0, 0, 0),
(5, 'Tolik_Jibolik', 479, -2817.75, 1301.92, 6.89192, 169.979, 0, 0, 66, 0, 0, -1, 118, 0, 0, 0, '{FF0000}94871BJ', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(8, 'Mantas_Shelby', 480, -189.33, 1049.87, 19.4792, 196.128, 0, 0, 38, 59, 89, -1, 103, 0, 0, 0, '{FF0000}31265BJ', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 1010, 0, 1080, 0, 1087, 0, 0, 0, 0),
(10, 'Dwayne_Wade', 480, -1981.8, 303.753, 34.9873, 220.854, 0, 0, 34, 3, 16, -1, 413, 0, 0, 1, '{FF0000}87511BJ', '', '', 1, 0, 0, 0, 0, 0, 0, 0, 0, 1010, 0, 0, 0, 0, 0, 0, 0, 0),
(11, 'Barry_Thorne', 0, 0, 0, 0, 0, 0, 0, 45, 50, 50, -1, 1, 0, 0, 0, '{FF0000}50973BJ', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(12, 'Andrey_Cortez', 479, -82.7103, 1350.03, 11.0105, 119.008, 0, 0, 67, 4, 4, -1, 0, 0, 0, 0, '{FF0000}41194BJ', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(13, 'Dede_Karaz', 558, -2285.38, -2482.31, -25.1494, 46.9396, 0, 0, 67, 16, 16, -1, 1, 0, 0, 0, '{FF0000}00158BJ', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(14, 'Moo_Bamba', 561, -81.883, 1338.82, 14.025, 96.7045, 0, 0, 70, 119, 119, -1, 0, 0, 0, 0, '{FF0000}79223BJ', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15, 'Tommis_Winstonz', 558, -159.811, 1105.97, 19.378, 271.538, 0, 0, 55, 32, 32, -1, 64, 0, 0, 0, '{FF0000}29878BJ', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(17, 'Edvis_Konorite', 480, 848.691, 1684.18, 6.53946, 10.0025, 0, 0, 26, 128, 0, -1, 63, 0, 0, 0, '{FF0000}17175BJ', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 1010, 0, 1080, 0, 1087, 0, 0, 0, 0),
(19, 'Mantas_Oreo', 562, -305.753, 1037.04, 19.2341, 90.7001, 0, 0, 67, 5, 30, -1, 193, 0, 0, 1, '{FF0000}39308BJ', '', '', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(20, 'Big_Daddy', 480, -1522.56, 2600.08, 58.2372, 266.618, 0, 0, 40, 67, 67, -1, 147, 0, 0, 1, '{FF0000}84194BJ', '', '', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(21, 'Wade_Hebert', 480, -1536.06, 2627.7, 55.7404, 307.442, 0, 0, 11, 252, 0, -1, 258, 0, 0, 0, '{FF0000}54761BJ', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 1010, 0, 0, 0, 1087, 0, 0, 0, 0),
(22, 'Lukis_Tiek', 479, -167.724, 1029.97, 19.5569, 5.82907, 0, 0, 60, 175, 84, -1, 64, 0, 0, 1, '{FF0000}99680BJ', '', '', 1, 0, 0, 0, 0, 0, 0, 0, 0, 1010, 0, 1080, 0, 1087, 0, 0, 0, 0),
(25, 'Marco_Diaz', 533, -85.9, 1354.08, 17.9443, 298.215, 0, 0, 34, 74, 74, -1, 13, 0, 0, 0, '{FF0000}21038BJ', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(27, 'Mark_Cold', 562, -1209.48, 1822.84, 42.3771, 148.62, 0, 0, 37, 3, 66, 1, 104, 0, 0, 1, '{FF0000}26766BJ', '', '', 1, 0, 0, 0, 1147, 0, 1035, 1039, 0, 1010, 1037, 1080, 0, 1087, 1172, 1148, 0, 0),
(28, 'Gwinn_Wittadini', 579, -896.354, 1010.95, 44.5045, 208.762, 1, 0, 61, 111, 111, -1, 35, 0, 0, 1, '{FF0000}90523BJ', '', '', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(29, 'Jefferson_Quattro', 565, -82.1092, 1338.8, 10.8689, 95.5, 1, 0, 55, 26, 26, -1, 0, 0, 0, 0, '{FF0000}11058BJ', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(31, 'Adomas_Vercetti', 495, -67.6984, 1082.83, 23.9452, 83.6705, 0, 1, 50, 7, 7, -1, 53, 0, 0, 0, '{FF0000}38613BJ', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `vehicle2`
--

CREATE TABLE IF NOT EXISTS `vehicle2` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Savininkas` varchar(24) NOT NULL,
  `Modelis` int(3) NOT NULL,
  `xPos` float NOT NULL,
  `yPos` float NOT NULL,
  `zPos` float NOT NULL,
  `cPos` float NOT NULL,
  `DegaluTipas` int(1) NOT NULL,
  `Sudauzyta` int(1) NOT NULL,
  `Degalai` int(3) NOT NULL,
  `Color1` int(3) NOT NULL,
  `Color2` int(3) NOT NULL,
  `PaintJob` int(4) NOT NULL,
  `Rida` varchar(12) NOT NULL,
  `Gyvybes` varchar(12) NOT NULL,
  `Radijas` int(1) NOT NULL,
  `Registruota` int(1) NOT NULL,
  `Tranzitiniai` text NOT NULL,
  `Raides` text NOT NULL,
  `Skaiciai` text NOT NULL,
  `Technikine` int(1) NOT NULL,
  `MasinaParduodama` int(1) NOT NULL,
  `mParduodamaKaina` int(11) NOT NULL,
  `Akumuliatorius` int(11) NOT NULL,
  `Tuningas0` int(5) NOT NULL,
  `Tuningas1` int(5) NOT NULL,
  `Tuningas2` int(5) NOT NULL,
  `Tuningas3` int(5) NOT NULL,
  `Tuningas4` int(5) NOT NULL,
  `Tuningas5` int(5) NOT NULL,
  `Tuningas6` int(5) NOT NULL,
  `Tuningas7` int(5) NOT NULL,
  `Tuningas8` int(5) NOT NULL,
  `Tuningas9` int(5) NOT NULL,
  `Tuningas10` int(5) NOT NULL,
  `Tuningas11` int(5) NOT NULL,
  `Tuningas12` int(5) NOT NULL,
  `Tuningas13` int(5) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Sukurta duomenų kopija lentelei `vehicle2`
--

INSERT INTO `vehicle2` (`Id`, `Savininkas`, `Modelis`, `xPos`, `yPos`, `zPos`, `cPos`, `DegaluTipas`, `Sudauzyta`, `Degalai`, `Color1`, `Color2`, `PaintJob`, `Rida`, `Gyvybes`, `Radijas`, `Registruota`, `Tranzitiniai`, `Raides`, `Skaiciai`, `Technikine`, `MasinaParduodama`, `mParduodamaKaina`, `Akumuliatorius`, `Tuningas0`, `Tuningas1`, `Tuningas2`, `Tuningas3`, `Tuningas4`, `Tuningas5`, `Tuningas6`, `Tuningas7`, `Tuningas8`, `Tuningas9`, `Tuningas10`, `Tuningas11`, `Tuningas12`, `Tuningas13`) VALUES
(1, 'Barry_Thorne', 0, 0, 0, 0, 0, 0, 0, 88, 106, 106, -1, '0.956022', '0.000000', 0, 0, '{FF0000}35087BJ', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 'Moo_Bamba', 468, -0.191708, 1114.83, 19.3667, 311.255, 0, 0, 11, 31, 31, -1, '129.145538', '0.000000', 0, 1, '{FF0000}59433BJ', '', '', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 'Mantas_Shelby', 495, -106.093, 1358.76, 11.6783, 71.2883, 0, 0, 44, 23, 123, -1, '120.807411', '0.000000', 0, 0, '{FF0000}51457BJ', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1080, 0, 0, 0, 0, 0, 0),
(4, 'Marco_Diaz', 411, -82.1092, 1338.8, 38.8689, 95.5, 0, 1, 80, 118, 118, -1, '2.353152', '0.000000', 0, 0, '{FF0000}92725BJ', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(8, 'Gwinn_Wittadini', 541, -83.0832, 1347.08, 10.8689, 95.5, 0, 0, 75, 43, 43, -1, '0.000000', '0.000000', 0, 0, '{FF0000}76029BJ', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7, 'Adomas_Vercetti', 432, -84.8384, 1351.38, 14.2446, 85.3815, 0, 1, 6965, 28, 28, -1, '69696968.000', '0.000000', 0, 0, '{FF0000}ADOMAS', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `vehicle3`
--

CREATE TABLE IF NOT EXISTS `vehicle3` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Savininkas` varchar(24) NOT NULL,
  `Modelis` int(3) NOT NULL,
  `xPos` float NOT NULL,
  `yPos` float NOT NULL,
  `zPos` float NOT NULL,
  `cPos` float NOT NULL,
  `DegaluTipas` int(1) NOT NULL,
  `Sudauzyta` int(1) NOT NULL,
  `Degalai` int(3) NOT NULL,
  `Color1` int(3) NOT NULL,
  `Color2` int(3) NOT NULL,
  `PaintJob` int(4) NOT NULL,
  `Rida` varchar(12) NOT NULL,
  `Gyvybes` int(12) NOT NULL,
  `Radijas` int(1) NOT NULL,
  `Registruota` int(1) NOT NULL,
  `Tranzitiniai` text NOT NULL,
  `Raides` text NOT NULL,
  `Skaiciai` text NOT NULL,
  `Technikine` int(1) NOT NULL,
  `MasinaParduodama` int(1) NOT NULL,
  `mParduodamaKaina` int(11) NOT NULL,
  `Akumuliatorius` int(11) NOT NULL,
  `Tuningas0` int(11) NOT NULL,
  `Tuningas1` int(11) NOT NULL,
  `Tuningas2` int(11) NOT NULL,
  `Tuningas3` int(11) NOT NULL,
  `Tuningas4` int(4) NOT NULL,
  `Tuningas5` int(4) NOT NULL,
  `Tuningas6` int(4) NOT NULL,
  `Tuningas7` int(4) NOT NULL,
  `Tuningas8` int(4) NOT NULL,
  `Tuningas9` int(4) NOT NULL,
  `Tuningas10` int(4) NOT NULL,
  `Tuningas11` int(4) NOT NULL,
  `Tuningas12` int(4) NOT NULL,
  `Tuningas13` int(4) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Sukurta duomenų kopija lentelei `vehicle3`
--

INSERT INTO `vehicle3` (`Id`, `Savininkas`, `Modelis`, `xPos`, `yPos`, `zPos`, `cPos`, `DegaluTipas`, `Sudauzyta`, `Degalai`, `Color1`, `Color2`, `PaintJob`, `Rida`, `Gyvybes`, `Radijas`, `Registruota`, `Tranzitiniai`, `Raides`, `Skaiciai`, `Technikine`, `MasinaParduodama`, `mParduodamaKaina`, `Akumuliatorius`, `Tuningas0`, `Tuningas1`, `Tuningas2`, `Tuningas3`, `Tuningas4`, `Tuningas5`, `Tuningas6`, `Tuningas7`, `Tuningas8`, `Tuningas9`, `Tuningas10`, `Tuningas11`, `Tuningas12`, `Tuningas13`) VALUES
(1, 'Marco_Diaz', 522, 170.139, 1172.48, 16.0979, 315.685, 0, 0, 39, 28, 28, -1, '3.520903', 0, 0, 0, '{FF0000}41312BJ', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `yardiesmasinos`
--

CREATE TABLE IF NOT EXISTS `yardiesmasinos` (
  `RangoNumeris` int(7) NOT NULL,
  `Sanchez` int(1) NOT NULL,
  `Tahoma` int(1) NOT NULL,
  `Maverick` int(1) NOT NULL,
  `Admiral` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Sukurta duomenų kopija lentelei `yardiesmasinos`
--

INSERT INTO `yardiesmasinos` (`RangoNumeris`, `Sanchez`, `Tahoma`, `Maverick`, `Admiral`) VALUES
(1, 0, 1, 0, 1),
(2, 1, 1, 0, 1),
(3, 0, 1, 0, 1),
(4, 1, 1, 1, 1),
(5, 1, 1, 1, 1),
(6, 1, 1, 1, 1),
(7, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `zaidejai`
--

CREATE TABLE IF NOT EXISTS `zaidejai` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `vardas` varchar(24) NOT NULL,
  `pass` varchar(24) NOT NULL,
  `patirtis` int(11) NOT NULL,
  `pinigai` int(11) NOT NULL,
  `patvirtinimo_kodas` int(11) NOT NULL,
  `banke` int(11) NOT NULL,
  `namuose` int(11) NOT NULL,
  `lytis` int(1) NOT NULL,
  `pos_X` float NOT NULL,
  `pos_Y` float NOT NULL,
  `pos_Z` float NOT NULL,
  `alga` int(11) NOT NULL,
  `direktorius` int(3) NOT NULL,
  `pavaduotojas` int(3) NOT NULL,
  `darbas` int(3) NOT NULL,
  `nogunspd` int(11) NOT NULL,
  `nogunskart` int(11) NOT NULL,
  `nogunsgang` int(11) NOT NULL,
  `JobRank` int(2) NOT NULL,
  `drabuziai` int(3) NOT NULL,
  `gdrabuziai` int(3) NOT NULL,
  `sdrabuziai` int(3) NOT NULL,
  `world` int(3) NOT NULL,
  `star` int(3) NOT NULL,
  `teorijost` int(3) NOT NULL,
  `pinkodas` varchar(24) NOT NULL,
  `mute` int(11) NOT NULL,
  `interior` int(3) NOT NULL,
  `kreditai` int(11) NOT NULL,
  `coins` int(11) NOT NULL,
  `vasarost` int(11) NOT NULL,
  `dTaskai` int(11) NOT NULL,
  `protokolas` int(11) NOT NULL,
  `protokolop1` int(11) NOT NULL,
  `protokolop2` int(11) NOT NULL,
  `protokolop3` int(11) NOT NULL,
  `protokolop4` int(11) NOT NULL,
  `protokolop5` int(11) NOT NULL,
  `sktime` int(11) NOT NULL,
  `paskutpas` int(11) NOT NULL,
  `Kreditai2` int(2) NOT NULL,
  `Admin` int(1) NOT NULL,
  `AdminLaikas` int(11) NOT NULL,
  `Vip` int(1) NOT NULL,
  `Viplaikas` int(11) NOT NULL,
  `bsaskaita` int(11) NOT NULL,
  `pakviestas` int(11) NOT NULL,
  `glicenzija` int(1) NOT NULL,
  `glicteorija` int(2) NOT NULL,
  `aikstele` int(1) NOT NULL,
  `fteises` int(1) NOT NULL,
  `mteises` int(1) NOT NULL,
  `auteises` int(1) NOT NULL,
  `pteises` int(1) NOT NULL,
  `teorija` int(1) NOT NULL,
  `uniform` int(1) NOT NULL,
  `uniforma` int(3) NOT NULL,
  `kokainas` int(11) NOT NULL,
  `zole` int(11) NOT NULL,
  `Prazaide` int(11) NOT NULL,
  `Kamuoliai` int(11) NOT NULL,
  `DarboIspejimai` int(1) NOT NULL,
  `AdminIspejimai` int(1) NOT NULL,
  `VipIspejimai` int(1) NOT NULL,
  `masalas` int(11) NOT NULL,
  `zuvis` int(11) NOT NULL,
  `Kalejime` int(11) NOT NULL,
  `Investicija` int(1) NOT NULL,
  `meskere` int(1) NOT NULL,
  `surakintas` int(1) NOT NULL,
  `Bakelis` int(1) NOT NULL,
  `Telefonas` int(1) NOT NULL,
  `KoksTelefonas` int(2) NOT NULL,
  `Kortele` int(1) NOT NULL,
  `cteises` int(1) NOT NULL,
  `TelefonoStat` int(1) NOT NULL,
  `Emigruotas` int(1) NOT NULL,
  `aPriziuretojas` int(1) NOT NULL,
  `vPriziuretojas` int(1) NOT NULL,
  `ePriziuretojas` int(1) NOT NULL,
  `dPriziuretojas` int(1) NOT NULL,
  `bPriziuretojas` int(1) NOT NULL,
  `gPriziuretojas` int(1) NOT NULL,
  `MasinuIeskojimas1` int(1) NOT NULL,
  `MasinuIeskojimas2` int(1) NOT NULL,
  `MasinuIeskojimas3` int(1) NOT NULL,
  `MasinuIeskojimas4` int(1) NOT NULL,
  `MasinuIeskojimas5` int(1) NOT NULL,
  `Pasiekimas1` int(3) NOT NULL,
  `Pasiekimas2` int(3) NOT NULL,
  `Pasiekimas3` int(3) NOT NULL,
  `Pasiekimas4` int(3) NOT NULL,
  `Pasiekimas5` int(3) NOT NULL,
  `Pasiekimas6` int(3) NOT NULL,
  `Pasiekimas7` int(3) NOT NULL,
  `Pasiekimas8` int(3) NOT NULL,
  `Pasiekimas9` int(3) NOT NULL,
  `Pasiekimas10` int(3) NOT NULL,
  `PriimtiIskvietimai` int(2) NOT NULL,
  `PolicijosStazas` int(11) NOT NULL,
  `MedikuStazas` int(11) NOT NULL,
  `TaksistuStazas` int(11) NOT NULL,
  `MechanikuStazas` int(11) NOT NULL,
  `DyleriuStazas` int(11) NOT NULL,
  `FuristuStazas` int(11) NOT NULL,
  `SWATStazas` int(11) NOT NULL,
  `BallasStazas` int(11) NOT NULL,
  `GrooveStazas` int(11) NOT NULL,
  `ArmijosStazas` int(11) NOT NULL,
  `PicerijosStazas` int(11) NOT NULL,
  `GaisrininkuStazas` int(11) NOT NULL,
  `ValytojuStazas` int(11) NOT NULL,
  `ElektrikuStazas` int(11) NOT NULL,
  `PilotuStazas` int(11) NOT NULL,
  `PastininkuStazas` int(11) NOT NULL,
  `AlgosGavimas` int(1) NOT NULL,
  `AlgosLaikas` int(11) NOT NULL,
  `Uzbanintas` int(1) NOT NULL,
  `BanLaikas` int(3) NOT NULL,
  `Saskaita` int(11) NOT NULL,
  `Navigacija` int(1) NOT NULL,
  `NickBanai` int(1) NOT NULL,
  `Suristas` int(1) NOT NULL,
  `Ginklas0` int(4) NOT NULL,
  `Ginklas1` int(4) NOT NULL,
  `Ginklas2` int(4) NOT NULL,
  `Ginklas3` int(4) NOT NULL,
  `Ginklas4` int(4) NOT NULL,
  `Ginklas5` int(4) NOT NULL,
  `Ginklas6` int(4) NOT NULL,
  `Ginklas7` int(4) NOT NULL,
  `Ginklas8` int(4) NOT NULL,
  `Ginklas9` int(4) NOT NULL,
  `Ginklas10` int(4) NOT NULL,
  `Ginklas11` int(4) NOT NULL,
  `Ammo0` int(4) NOT NULL,
  `Ammo1` int(4) NOT NULL,
  `Ammo2` int(4) NOT NULL,
  `Ammo3` int(4) NOT NULL,
  `Ammo4` int(4) NOT NULL,
  `Ammo5` int(4) NOT NULL,
  `Ammo6` int(4) NOT NULL,
  `Ammo7` int(4) NOT NULL,
  `Ammo8` int(4) NOT NULL,
  `Ammo9` int(4) NOT NULL,
  `Ammo10` int(4) NOT NULL,
  `Ammo11` int(4) NOT NULL,
  `CARID` int(11) NOT NULL,
  `gaujosID` int(11) NOT NULL,
  `gLeidimas` int(11) NOT NULL,
  `gBlist` int(11) NOT NULL,
  `gPav` int(11) NOT NULL,
  `KelintaNMisija` int(3) NOT NULL,
  `KiekTuriRepTasku` int(6) NOT NULL,
  `LeidimasH` int(2) NOT NULL,
  `LeidimasHUNT` int(2) NOT NULL,
  `LeidimasT` int(2) NOT NULL,
  `kDeagle` int(2) NOT NULL,
  `kShotgun` int(2) NOT NULL,
  `kAk47` int(2) NOT NULL,
  `kM4` int(2) NOT NULL,
  `kNark1` int(2) NOT NULL,
  `kNark2` int(2) NOT NULL,
  `Alkis` int(4) NOT NULL,
  `tVerslas` int(6) NOT NULL,
  `tVerslasPelnas` int(10) NOT NULL,
  `menke` int(6) NOT NULL,
  `lasisa` int(6) NOT NULL,
  `pleksne` int(6) NOT NULL,
  `eserys` int(6) NOT NULL,
  `lydeka` int(6) NOT NULL,
  `valas` int(2) NOT NULL,
  `cuffed` int(1) NOT NULL,
  `DuotaBaudu` int(5) NOT NULL,
  `NuveztaKroviniu` int(5) NOT NULL,
  `Mires` int(11) NOT NULL,
  `DrkIspejimai` int(3) NOT NULL,
  `UzbanintasLaikui` int(2) NOT NULL,
  `KiekLaikoBan` int(15) NOT NULL,
  `KiekIspCbug` int(15) NOT NULL,
  `KiekIspBan` int(15) NOT NULL,
  `medikupazyma` int(15) NOT NULL,
  `vplaikas` int(15) NOT NULL,
  `Sanfierro` int(15) NOT NULL,
  `Fortcarson` int(15) NOT NULL,
  `vApmokymai` int(15) NOT NULL,
  `PriklausBalai` int(3) NOT NULL,
  `NewPasiekimai1` int(11) NOT NULL,
  `NewPasiekimai2` int(11) NOT NULL,
  `NewPasiekimai3` int(11) NOT NULL,
  `NewPasiekimai4` int(11) NOT NULL,
  `NewPasiekimai5` int(11) NOT NULL,
  `NewPasiekimai6` int(11) NOT NULL,
  `NewPasiekimai7` int(11) NOT NULL,
  `NewPasiekimai8` int(11) NOT NULL,
  `NewPasiekimai9` int(11) NOT NULL,
  `NewPasiekimai10` int(11) NOT NULL,
  `NewPasiekimai11` int(11) NOT NULL,
  `NewPasiekimai12` int(11) NOT NULL,
  `NewPasiekimai13` int(11) NOT NULL,
  `NewPasiekimai14` int(11) NOT NULL,
  `NewPasiekimai15` int(12) NOT NULL,
  `Priklausomybe` int(2) NOT NULL,
  `KiekIsprende` int(6) NOT NULL,
  `LaimejoVar` int(2) NOT NULL,
  `KontraktoLaikas` int(12) NOT NULL,
  `PirkoKrepsi` int(11) NOT NULL,
  `KrepselisSimtas` int(11) NOT NULL,
  `KrepselioGrybai` int(11) NOT NULL,
  `Krepselis120` int(11) NOT NULL,
  `Krepselis150` int(11) NOT NULL,
  `KelintaNMisija2` int(11) NOT NULL,
  `KelintaNMisija3` int(11) NOT NULL,
  `Laikrodis` int(2) NOT NULL,
  `Tara` int(5) NOT NULL,
  `MP3` int(2) NOT NULL,
  `MesosKG` int(5) NOT NULL,
  `MedzioklesLeidimas` int(2) NOT NULL,
  `Liga` int(4) NOT NULL,
  `lTransportas1` int(4) NOT NULL,
  `Transportas1` int(4) NOT NULL,
  `Transportas2` int(4) NOT NULL,
  `disease` int(11) NOT NULL,
  `drugscure1` int(11) NOT NULL,
  `drugscure2` int(11) NOT NULL,
  `drugscure3` int(11) NOT NULL,
  `tzenklasleid` int(11) NOT NULL,
  `krepselisV` int(11) NOT NULL,
  `degalubak` int(11) NOT NULL,
  `nwkuprine` int(11) NOT NULL,
  `maistas1` int(11) NOT NULL,
  `maistas2` int(11) NOT NULL,
  `maistas3` int(11) NOT NULL,
  `birthdayOne` int(11) NOT NULL,
  `gApranga1` int(11) NOT NULL,
  `gApranga2` int(11) NOT NULL,
  `gApranga3` int(11) NOT NULL,
  `gApranga4` int(11) NOT NULL,
  `elp` int(1) NOT NULL,
  `email` varchar(40) NOT NULL,
  `Pasirase` int(1) NOT NULL,
  `Velykos1` int(1) NOT NULL,
  `Velykos2` int(1) NOT NULL,
  `Velykos3` int(1) NOT NULL,
  `Velykos4` int(1) NOT NULL,
  `Velykos5` int(1) NOT NULL,
  `Velykos6` int(1) NOT NULL,
  `Velykos7` int(1) NOT NULL,
  `Velykos8` int(1) NOT NULL,
  `Velykos9` int(1) NOT NULL,
  `Velykos10` int(1) NOT NULL,
  `Velykos11` int(1) NOT NULL,
  `Velykos12` int(1) NOT NULL,
  `Velykos13` int(1) NOT NULL,
  `Velykos14` int(1) NOT NULL,
  `Velykos15` int(1) NOT NULL,
  `radokiausini` int(1) NOT NULL,
  `LaikasLigonineje` int(3) NOT NULL,
  `regdata` date NOT NULL,
  `lastOnline` date NOT NULL,
  `played_this_week` int(12) NOT NULL,
  `played_this_month` int(12) NOT NULL,
  `played_this_total` int(12) NOT NULL,
  `warning_pass` int(10) NOT NULL,
  `Statusas` int(1) NOT NULL,
  `gangCo` int(11) NOT NULL,
  `skinStatus` int(11) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6190 ;

--
-- Sukurta duomenų kopija lentelei `zaidejai`
--

INSERT INTO `zaidejai` (`Id`, `vardas`, `pass`, `patirtis`, `pinigai`, `patvirtinimo_kodas`, `banke`, `namuose`, `lytis`, `pos_X`, `pos_Y`, `pos_Z`, `alga`, `direktorius`, `pavaduotojas`, `darbas`, `nogunspd`, `nogunskart`, `nogunsgang`, `JobRank`, `drabuziai`, `gdrabuziai`, `sdrabuziai`, `world`, `star`, `teorijost`, `pinkodas`, `mute`, `interior`, `kreditai`, `coins`, `vasarost`, `dTaskai`, `protokolas`, `protokolop1`, `protokolop2`, `protokolop3`, `protokolop4`, `protokolop5`, `sktime`, `paskutpas`, `Kreditai2`, `Admin`, `AdminLaikas`, `Vip`, `Viplaikas`, `bsaskaita`, `pakviestas`, `glicenzija`, `glicteorija`, `aikstele`, `fteises`, `mteises`, `auteises`, `pteises`, `teorija`, `uniform`, `uniforma`, `kokainas`, `zole`, `Prazaide`, `Kamuoliai`, `DarboIspejimai`, `AdminIspejimai`, `VipIspejimai`, `masalas`, `zuvis`, `Kalejime`, `Investicija`, `meskere`, `surakintas`, `Bakelis`, `Telefonas`, `KoksTelefonas`, `Kortele`, `cteises`, `TelefonoStat`, `Emigruotas`, `aPriziuretojas`, `vPriziuretojas`, `ePriziuretojas`, `dPriziuretojas`, `bPriziuretojas`, `gPriziuretojas`, `MasinuIeskojimas1`, `MasinuIeskojimas2`, `MasinuIeskojimas3`, `MasinuIeskojimas4`, `MasinuIeskojimas5`, `Pasiekimas1`, `Pasiekimas2`, `Pasiekimas3`, `Pasiekimas4`, `Pasiekimas5`, `Pasiekimas6`, `Pasiekimas7`, `Pasiekimas8`, `Pasiekimas9`, `Pasiekimas10`, `PriimtiIskvietimai`, `PolicijosStazas`, `MedikuStazas`, `TaksistuStazas`, `MechanikuStazas`, `DyleriuStazas`, `FuristuStazas`, `SWATStazas`, `BallasStazas`, `GrooveStazas`, `ArmijosStazas`, `PicerijosStazas`, `GaisrininkuStazas`, `ValytojuStazas`, `ElektrikuStazas`, `PilotuStazas`, `PastininkuStazas`, `AlgosGavimas`, `AlgosLaikas`, `Uzbanintas`, `BanLaikas`, `Saskaita`, `Navigacija`, `NickBanai`, `Suristas`, `Ginklas0`, `Ginklas1`, `Ginklas2`, `Ginklas3`, `Ginklas4`, `Ginklas5`, `Ginklas6`, `Ginklas7`, `Ginklas8`, `Ginklas9`, `Ginklas10`, `Ginklas11`, `Ammo0`, `Ammo1`, `Ammo2`, `Ammo3`, `Ammo4`, `Ammo5`, `Ammo6`, `Ammo7`, `Ammo8`, `Ammo9`, `Ammo10`, `Ammo11`, `CARID`, `gaujosID`, `gLeidimas`, `gBlist`, `gPav`, `KelintaNMisija`, `KiekTuriRepTasku`, `LeidimasH`, `LeidimasHUNT`, `LeidimasT`, `kDeagle`, `kShotgun`, `kAk47`, `kM4`, `kNark1`, `kNark2`, `Alkis`, `tVerslas`, `tVerslasPelnas`, `menke`, `lasisa`, `pleksne`, `eserys`, `lydeka`, `valas`, `cuffed`, `DuotaBaudu`, `NuveztaKroviniu`, `Mires`, `DrkIspejimai`, `UzbanintasLaikui`, `KiekLaikoBan`, `KiekIspCbug`, `KiekIspBan`, `medikupazyma`, `vplaikas`, `Sanfierro`, `Fortcarson`, `vApmokymai`, `PriklausBalai`, `NewPasiekimai1`, `NewPasiekimai2`, `NewPasiekimai3`, `NewPasiekimai4`, `NewPasiekimai5`, `NewPasiekimai6`, `NewPasiekimai7`, `NewPasiekimai8`, `NewPasiekimai9`, `NewPasiekimai10`, `NewPasiekimai11`, `NewPasiekimai12`, `NewPasiekimai13`, `NewPasiekimai14`, `NewPasiekimai15`, `Priklausomybe`, `KiekIsprende`, `LaimejoVar`, `KontraktoLaikas`, `PirkoKrepsi`, `KrepselisSimtas`, `KrepselioGrybai`, `Krepselis120`, `Krepselis150`, `KelintaNMisija2`, `KelintaNMisija3`, `Laikrodis`, `Tara`, `MP3`, `MesosKG`, `MedzioklesLeidimas`, `Liga`, `lTransportas1`, `Transportas1`, `Transportas2`, `disease`, `drugscure1`, `drugscure2`, `drugscure3`, `tzenklasleid`, `krepselisV`, `degalubak`, `nwkuprine`, `maistas1`, `maistas2`, `maistas3`, `birthdayOne`, `gApranga1`, `gApranga2`, `gApranga3`, `gApranga4`, `elp`, `email`, `Pasirase`, `Velykos1`, `Velykos2`, `Velykos3`, `Velykos4`, `Velykos5`, `Velykos6`, `Velykos7`, `Velykos8`, `Velykos9`, `Velykos10`, `Velykos11`, `Velykos12`, `Velykos13`, `Velykos14`, `Velykos15`, `radokiausini`, `LaikasLigonineje`, `regdata`, `lastOnline`, `played_this_week`, `played_this_month`, `played_this_total`, `warning_pass`, `Statusas`, `gangCo`, `skinStatus`) VALUES
(6181, 'Marco_Diaz', 'asasas', 23140, 29381, 9288, 0, 0, 0, -24.6573, 1034.95, 19.7422, 4145, 13, 0, 13, 0, 1, 0, 1, 34, 0, 0, 0, 0, 0, '0', 0, 0, 2240, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 21, 0, 5, 1558468411, 0, 0, 0, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 29, 5, 5, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, -1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 157, 0, 14, 0, 0, 0, 0, 0, 0, 0, 0, 31, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 4, 24, 25, 28, 30, 0, 0, 0, 0, 0, 0, 0, 2, 40, 20, 86, 400, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1556305695, 0, 1, 0, 1, 10, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1556219297, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 12, 1, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'Hosteu.12@gmail.com', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 911043644, 0, '2019-04-21', '2019-04-25', 275, 331, 331, 0, 0, 0, 1),
(6182, 'Gwinn_Wittadini', 'paulius', 151, 155176, 5081, 0, 0, 0, -116.703, 1681.6, 19.1903, 2525, 1, 0, 1, 0, 0, 0, 1, 147, 0, 0, 0, 0, 0, '0', 0, 0, -796692450, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12, 0, 5, 1558643393, 0, 0, 0, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 266, 0, 0, 79, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 183, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 43, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1556032009, 0, 0, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 4, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'vapaulius9@gmail.com', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 911043644, 54, '2019-04-22', '2019-04-25', 585, 585, 585, 0, 1, 0, 1),
(6183, 'Gwinn_Wittdini', 'paulius', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2019-04-22', '0000-00-00', 0, 0, 0, 0, 0, 0, 0),
(6185, 'Adomas_Vercetti', '22884466', 10000048, 10766202, 8973, 10000000, 0, 0, -290.561, 1049.21, 19.5981, 30, 0, 0, 0, 0, 0, 0, 7, 287, 0, 0, 0, 4, 0, '0', 0, 0, 4915, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 5, 1558643486, 1, 0, 0, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, -1, 0, 0, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, -1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 900, 900, 900, 900, 0, 0, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1556823735, 0, 1, 2, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 564, 557, 0, 3, 28, 29, 26, 0, 0, 0, 0, 19, 20, 19, 0, 0, 0, 0, 0, 1, 'adomas.andriusaitiss@gmail.com', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00', '2019-04-25', 325, 381, 381, 0, 0, 0, 0),
(6186, 'Mark_Cold', 'paulius', 7859, 4409, 3531, 0, 0, 0, -1424.9, 2665.28, 55.3672, 679, 0, 0, 24, 0, 0, 0, 7, 147, 0, 0, 0, 4, 0, '0', 0, 0, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 21, 0, 5, 1558539244, 0, 0, 0, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 61, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 6, 0, 0, 0, 19, 0, 0, 0, 0, 0, 0, 0, 0, 36, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 900, 900, 900, 900, 0, 0, 66, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1556116556, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 5, 4, 4, 0, 0, 0, 0, 20, 20, 20, 0, 0, 0, 0, 0, 1, 'p.jusius@gmail.com', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 900043645, 0, '2019-04-22', '2019-04-24', 324, 380, 380, 0, 0, 0, 1),
(6187, 'Miguel_Cartelio', 'vilmantas147', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'vilmantataujinskas2@gmail.com', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2019-04-24', '0000-00-00', 0, 0, 0, 0, 0, 0, 0),
(6188, 'Kelas_Peckurys', 'tanker', 70496, 7090, 4561, 0, 0, 0, -932.95, -2494.2, 4.75, 54, 13, 0, 13, 0, 0, 1, 1, 34, 0, 0, 0, 4, 0, '0', 0, 0, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 4, 1558718952, 0, 0, 0, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 29, 5, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 24, 25, 28, 30, 0, 0, 0, 0, 0, 0, 0, 5, 79, 45, 490, 967, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 71, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 1556297363, 0, 1, 0, 1, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 3, 1, 1556737660, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 't4nk3erobby@gmail.com', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10999999, 0, '2019-04-24', '2019-04-24', 90, 90, 90, 0, 0, 0, 1),
(6189, 'Vilmis_Adidas', 'vilmis1', 60572, 1210, 2125, 0, 0, 0, -918.085, -2506.37, 4.76524, 63, 0, 0, 0, 0, 0, 0, 7, 147, 0, 0, 0, 9, 0, '0', 0, 0, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12, 0, 4, 1558722908, 0, 0, 0, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 900, 900, 900, 900, 0, 0, 85, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1556297366, 0, 0, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 37, 1, 0, 0, 0, 0, 3, 28, 29, 26, 0, 0, 0, 0, 19, 20, 19, 0, 0, 0, 0, 0, 1, 'vilmantastaujinskas2@gmail.com', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2019-04-24', '2019-04-24', 394, 450, 450, 0, 0, 0, 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
