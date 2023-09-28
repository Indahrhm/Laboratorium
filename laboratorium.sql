-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 26, 2023 at 08:54 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laboratorium`
--

-- --------------------------------------------------------

--
-- Table structure for table `parameter`
--

CREATE TABLE `parameter` (
  `id_param` int(11) NOT NULL,
  `id_pegawai` int(11) DEFAULT NULL,
  `jenis_sample` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `parameter`
--

INSERT INTO `parameter` (`id_param`, `id_pegawai`, `jenis_sample`) VALUES
(1, NULL, 'kimia'),
(2, NULL, 'fisika'),
(3, NULL, 'bakteri');

-- --------------------------------------------------------

--
-- Table structure for table `parameterbakteri`
--

CREATE TABLE `parameterbakteri` (
  `id_bakteri` int(11) NOT NULL,
  `id_param` int(11) DEFAULT NULL,
  `jenisBakteri` varchar(100) DEFAULT NULL,
  `nilaiBakteri` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `parameterbakteri`
--

INSERT INTO `parameterbakteri` (`id_bakteri`, `id_param`, `jenisBakteri`, `nilaiBakteri`) VALUES
(1, 3, 'Coli Form', 0),
(2, 3, 'Coli Tinja', 0);

-- --------------------------------------------------------

--
-- Table structure for table `parameterfisik`
--

CREATE TABLE `parameterfisik` (
  `id_fisik` int(11) NOT NULL,
  `id_param` int(11) DEFAULT NULL,
  `jenisFisik` varchar(100) DEFAULT NULL,
  `nilaiFisik` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `parameterkimia`
--

CREATE TABLE `parameterkimia` (
  `id_kimia` int(11) NOT NULL,
  `id_param` int(11) DEFAULT NULL,
  `jenisKimia` varchar(100) DEFAULT NULL,
  `nilaiKimia` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `parameterkimia`
--

INSERT INTO `parameterkimia` (`id_kimia`, `id_param`, `jenisKimia`, `nilaiKimia`) VALUES
(1, 1, 'nitrat', 10),
(2, 1, 'besi', 5),
(3, 1, 'amoniak', 6),
(4, 1, 'khlorin', 5),
(5, 1, 'nitrit', 10),
(6, 1, 'alumunium', 5);

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE `pegawai` (
  `id_pegawai` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `statuspengecekan`
--

CREATE TABLE `statuspengecekan` (
  `ID` int(11) NOT NULL,
  `id_param` int(11) DEFAULT NULL,
  `HasilPengecekan` enum('Sukses','Tidak Sukses') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `parameter`
--
ALTER TABLE `parameter`
  ADD PRIMARY KEY (`id_param`),
  ADD KEY `id_pegawai` (`id_pegawai`);

--
-- Indexes for table `parameterbakteri`
--
ALTER TABLE `parameterbakteri`
  ADD PRIMARY KEY (`id_bakteri`),
  ADD KEY `id_param` (`id_param`);

--
-- Indexes for table `parameterfisik`
--
ALTER TABLE `parameterfisik`
  ADD PRIMARY KEY (`id_fisik`),
  ADD KEY `id_param` (`id_param`);

--
-- Indexes for table `parameterkimia`
--
ALTER TABLE `parameterkimia`
  ADD PRIMARY KEY (`id_kimia`),
  ADD KEY `id_param` (`id_param`);

--
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`id_pegawai`);

--
-- Indexes for table `statuspengecekan`
--
ALTER TABLE `statuspengecekan`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `id_param` (`id_param`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `parameter`
--
ALTER TABLE `parameter`
  MODIFY `id_param` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `parameterbakteri`
--
ALTER TABLE `parameterbakteri`
  MODIFY `id_bakteri` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `parameterfisik`
--
ALTER TABLE `parameterfisik`
  MODIFY `id_fisik` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `parameterkimia`
--
ALTER TABLE `parameterkimia`
  MODIFY `id_kimia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pegawai`
--
ALTER TABLE `pegawai`
  MODIFY `id_pegawai` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `statuspengecekan`
--
ALTER TABLE `statuspengecekan`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `parameter`
--
ALTER TABLE `parameter`
  ADD CONSTRAINT `parameter_ibfk_1` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id_pegawai`);

--
-- Constraints for table `parameterbakteri`
--
ALTER TABLE `parameterbakteri`
  ADD CONSTRAINT `parameterbakteri_ibfk_1` FOREIGN KEY (`id_param`) REFERENCES `parameter` (`id_param`);

--
-- Constraints for table `parameterfisik`
--
ALTER TABLE `parameterfisik`
  ADD CONSTRAINT `parameterfisik_ibfk_1` FOREIGN KEY (`id_param`) REFERENCES `parameter` (`id_param`);

--
-- Constraints for table `parameterkimia`
--
ALTER TABLE `parameterkimia`
  ADD CONSTRAINT `parameterkimia_ibfk_1` FOREIGN KEY (`id_param`) REFERENCES `parameter` (`id_param`);

--
-- Constraints for table `statuspengecekan`
--
ALTER TABLE `statuspengecekan`
  ADD CONSTRAINT `statuspengecekan_ibfk_1` FOREIGN KEY (`id_param`) REFERENCES `parameter` (`id_param`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
