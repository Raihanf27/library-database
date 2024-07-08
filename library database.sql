-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 18, 2022 at 05:01 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tugasperpus`
--

-- --------------------------------------------------------

--
-- Table structure for table `anggota`
--

CREATE TABLE `anggota` (
  `id_anggota` varchar(20) NOT NULL,
  `kode_anggota` varchar(100) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `telepon` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `anggota`
--

INSERT INTO `anggota` (`id_anggota`, `kode_anggota`, `nama`, `telepon`) VALUES
('A001', '23212', 'UDIN', '8123456789'),
('A002', '56255', 'BUDI', '8123456788'),
('A003', '34890', 'KIKI', '8123456787'),
('A004', '89803', 'ALDI', '8123456786'),
('A005', '90823', 'DIMAS', '8123456785'),
('A006', '82321', 'DILAN', '8123456784'),
('A007', '87232', 'DENIS', '8123456783'),
('A008', '01283', 'ADIT', '8123456782'),
('A009', '21392', 'EKO', '8123456781'),
('A010', '90215', 'MIYA', '8123456780');

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `id_buku` varchar(100) NOT NULL,
  `kode_buku` varchar(100) NOT NULL,
  `judul` varchar(200) NOT NULL,
  `pengarang` varchar(100) NOT NULL,
  `jumlah_halaman` int(5) NOT NULL,
  `stok` int(100) NOT NULL,
  `tahun_terbit` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`id_buku`, `kode_buku`, `judul`, `pengarang`, `jumlah_halaman`, `stok`, `tahun_terbit`) VALUES
('B001', '321', 'BUKU BASIS DATA', 'LIA', 22, 32, '2021-01-22'),
('B002', '322', 'BUKU PBO', 'LEO', 20, 38, '2022-10-12'),
('B003', '323', 'BUKU METODE NUMERIK', 'KAMIL', 22, 45, '2018-11-10'),
('B004', '324', 'BUKU KEAMANAN SISTEM', 'THEO', 30, 42, '2019-10-10'),
('B005', '325', 'BUKU ANALISIS DESAIN', 'UJANG', 30, 21, '2019-12-13'),
('B006', '326', 'BUKU AUTOMATA', 'NINA', 25, 35, '2010-11-20'),
('B007', '327', 'BUKU JARINGAN KOMPUTER', 'PUTRI', 35, 40, '2015-08-20'),
('B008', '328', 'KOMIK NARUTO', 'KISHOMOTO', 15, 27, '2013-09-15'),
('B009', '329', 'KOMIK ONE PIECE', 'ODA', 30, 29, '2009-09-12'),
('B010', '330', 'KOMIK DORAEMON', 'FUJIO', 30, 15, '2000-10-25');

-- --------------------------------------------------------

--
-- Table structure for table `mengembalikan`
--

CREATE TABLE `mengembalikan` (
  `id_peminjaman` varchar(20) NOT NULL,
  `tanggal_pengembalian` date NOT NULL,
  `id_anggota` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mengembalikan`
--

INSERT INTO `mengembalikan` (`id_peminjaman`, `tanggal_pengembalian`, `id_anggota`) VALUES
('P001', '2022-12-18', 'A001'),
('P002', '2022-12-19', 'A002'),
('P003', '2022-12-15', 'A003'),
('P004', '2022-12-15', 'A004'),
('P005', '2022-12-13', 'A005'),
('P006', '2022-12-22', 'A006'),
('P007', '2022-12-18', 'A007'),
('P008', '2022-12-20', 'A008'),
('P009', '2022-12-15', 'A009'),
('P010', '2022-12-13', 'A010');

-- --------------------------------------------------------

--
-- Table structure for table `pinjam`
--

CREATE TABLE `pinjam` (
  `id_peminjaman` varchar(20) NOT NULL,
  `tanggal_pinjam` date NOT NULL,
  `id_buku` varchar(100) NOT NULL,
  `jumlah` int(200) NOT NULL,
  `status` enum('dipinjam','sudah dikembalikan') NOT NULL,
  `id_anggota` varchar(20) NOT NULL,
  `id_user` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pinjam`
--

INSERT INTO `pinjam` (`id_peminjaman`, `tanggal_pinjam`, `id_buku`, `jumlah`, `status`, `id_anggota`, `id_user`) VALUES
('P001', '2022-12-15', 'B001', 1, 'sudah dikembalikan', 'A001', 'U001'),
('P002', '2022-12-15', 'B001', 1, 'sudah dikembalikan', 'A002', 'U002'),
('P003', '2022-12-12', 'B009', 1, 'sudah dikembalikan', 'A003', 'U003'),
('P004', '2022-12-13', 'B009', 1, 'sudah dikembalikan', 'A004', 'U004'),
('P005', '2022-12-11', 'B001', 1, 'sudah dikembalikan', 'A005', 'U005'),
('P006', '2022-12-18', 'B002', 1, 'sudah dikembalikan', 'A006', 'U006'),
('P007', '2022-12-12', 'B005', 1, 'sudah dikembalikan', 'A007', 'U007'),
('P008', '2022-12-15', 'B001', 1, 'sudah dikembalikan', 'A008', 'U008'),
('P009', '2022-12-10', 'B002', 1, 'sudah dikembalikan', 'A009', 'U009'),
('P010', '2022-12-09', 'B003', 1, 'sudah dikembalikan', 'A010', 'U010');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` varchar(20) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`) VALUES
('U001', 'UDIN', 'abc'),
('U002', 'BUDI', 'efg'),
('U003', 'KIKI', 'hij'),
('U004', 'ALDI', 'klm'),
('U005', 'DIMAS', 'nop'),
('U006', 'DILAN', 'qrs'),
('U007', 'DENIS', 'tuv'),
('U008', 'ADIT', 'vwx'),
('U009', 'EKO', 'xyz'),
('U010', 'MIYA', '012');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`id_anggota`);

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id_buku`);

--
-- Indexes for table `mengembalikan`
--
ALTER TABLE `mengembalikan`
  ADD KEY `id_anggota` (`id_anggota`),
  ADD KEY `id_peminjaman` (`id_peminjaman`);

--
-- Indexes for table `pinjam`
--
ALTER TABLE `pinjam`
  ADD PRIMARY KEY (`id_peminjaman`),
  ADD KEY `id_anggota` (`id_anggota`),
  ADD KEY `id_buku` (`id_buku`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `mengembalikan`
--
ALTER TABLE `mengembalikan`
  ADD CONSTRAINT `mengembalikan_ibfk_1` FOREIGN KEY (`id_anggota`) REFERENCES `anggota` (`id_anggota`),
  ADD CONSTRAINT `mengembalikan_ibfk_2` FOREIGN KEY (`id_peminjaman`) REFERENCES `pinjam` (`id_peminjaman`);

--
-- Constraints for table `pinjam`
--
ALTER TABLE `pinjam`
  ADD CONSTRAINT `pinjam_ibfk_1` FOREIGN KEY (`id_anggota`) REFERENCES `anggota` (`id_anggota`),
  ADD CONSTRAINT `pinjam_ibfk_2` FOREIGN KEY (`id_buku`) REFERENCES `buku` (`id_buku`),
  ADD CONSTRAINT `pinjam_ibfk_3` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
