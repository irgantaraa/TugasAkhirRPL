-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 02, 2020 at 05:33 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.3.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `restoran`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `ID_admin` int(20) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`ID_admin`, `username`, `password`, `nama`) VALUES
(1, 'irgantara', '40d5559175ce33acb695ef805366841c', 'Irgantara Arda Pratama'),
(2, 'arda', 'fdd6e0e1461590d5d12cee056fcde3c9', 'arda pratama');

-- --------------------------------------------------------

--
-- Stand-in structure for view `dashboard`
-- (See below for the actual view)
--
CREATE TABLE `dashboard` (
`Nama_Manager` varchar(20)
,`Lokasi` varchar(20)
);

-- --------------------------------------------------------

--
-- Table structure for table `manager`
--

CREATE TABLE `manager` (
  `ID_Manager` int(20) NOT NULL,
  `Nama_Manager` varchar(20) DEFAULT NULL,
  `Lokasi` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `manager`
--

INSERT INTO `manager` (`ID_Manager`, `Nama_Manager`, `Lokasi`) VALUES
(1, 'Anto', 'Bekasi'),
(2, 'Agus', 'Semarang');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `ID_Menu` int(20) NOT NULL,
  `Nama_Menu` varchar(20) DEFAULT NULL,
  `Harga_Menu` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`ID_Menu`, `Nama_Menu`, `Harga_Menu`) VALUES
(1, 'Beefy Burgers', '55000'),
(2, 'Burger Boys', '50000'),
(3, 'Burger Bizz', '50000'),
(4, 'Crackles Burger', '55000'),
(5, 'Bull Burgers', '50000'),
(6, 'Rocket Burgers', '65000'),
(7, 'Crackles Burger', '50000'),
(8, 'Bull Burgers', '50000');

-- --------------------------------------------------------

--
-- Stand-in structure for view `restoran`
-- (See below for the actual view)
--
CREATE TABLE `restoran` (
`ID_Manager` int(20)
,`Nama_Manager` varchar(20)
,`Lokasi` varchar(20)
,`ID_Menu` int(20)
,`Nama_Menu` varchar(20)
,`Harga_Menu` varchar(20)
);

-- --------------------------------------------------------

--
-- Structure for view `dashboard`
--
DROP TABLE IF EXISTS `dashboard`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `dashboard`  AS  select `manager`.`Nama_Manager` AS `Nama_Manager`,`manager`.`Lokasi` AS `Lokasi` from `manager` ;

-- --------------------------------------------------------

--
-- Structure for view `restoran`
--
DROP TABLE IF EXISTS `restoran`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `restoran`  AS  select `manager`.`ID_Manager` AS `ID_Manager`,`manager`.`Nama_Manager` AS `Nama_Manager`,`manager`.`Lokasi` AS `Lokasi`,`menu`.`ID_Menu` AS `ID_Menu`,`menu`.`Nama_Menu` AS `Nama_Menu`,`menu`.`Harga_Menu` AS `Harga_Menu` from (`manager` left join `menu` on(`manager`.`ID_Manager` = `menu`.`ID_Menu` and `manager`.`Nama_Manager` = `menu`.`ID_Menu` and `manager`.`Lokasi` = `menu`.`ID_Menu` and `menu`.`ID_Menu` = `manager`.`Lokasi` and `menu`.`Nama_Menu` = `manager`.`Lokasi` and `menu`.`Harga_Menu` = `manager`.`Lokasi`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`ID_admin`);

--
-- Indexes for table `manager`
--
ALTER TABLE `manager`
  ADD PRIMARY KEY (`ID_Manager`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`ID_Menu`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `ID_admin` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `manager`
--
ALTER TABLE `manager`
  MODIFY `ID_Manager` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `ID_Menu` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
