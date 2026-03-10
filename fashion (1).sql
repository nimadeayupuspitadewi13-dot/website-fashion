-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 11, 2025 at 11:12 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fashion`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `harga` double(50,0) NOT NULL,
  `stok` int(11) NOT NULL,
  `deskripsi` text NOT NULL,
  `foto` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id`, `id_kategori`, `nama`, `harga`, `stok`, `deskripsi`, `foto`) VALUES
(8, 7, 'daster', 20000, 9, '1', '090120250234421.jpg'),
(9, 7, 'kaos polos hitam', 45000, 30, 'size M,L,XL,XXL', '090120250357232.jpg'),
(10, 7, 'kemeja coklat korea', 70000, 40, 'size,M,L', '090120250358563.jpg'),
(11, 7, 'kemeja t-shirt cewek', 80000, 50, 'size M,L,XL', '090120250402184.jpg'),
(12, 7, 'Kemeja cewek navy', 75000, 29, 'size M.L,XL', '090120250403545.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `kategori_barang`
--

CREATE TABLE `kategori_barang` (
  `id` int(11) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `deskripsi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategori_barang`
--

INSERT INTO `kategori_barang` (`id`, `nama`, `deskripsi`) VALUES
(7, 'baju', '');

-- --------------------------------------------------------

--
-- Table structure for table `level`
--

CREATE TABLE `level` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `level`
--

INSERT INTO `level` (`id`, `nama`) VALUES
(1, 'Admin'),
(2, 'Pelanggan');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id` int(11) NOT NULL,
  `no_pesanan` varchar(50) NOT NULL,
  `bukti_bayar` varchar(50) NOT NULL,
  `tgl_bayar` date DEFAULT NULL,
  `status_bayar` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`id`, `no_pesanan`, `bukti_bayar`, `tgl_bayar`, `status_bayar`) VALUES
(2, '6777f6fa7472803012025', '03012025024840sunset.jpg', '2025-01-03', 'LUNAS'),
(3, '677fd1138127d09012025', '090120250244551.jpg', '2025-01-09', 'LUNAS');

-- --------------------------------------------------------

--
-- Table structure for table `pesanan`
--

CREATE TABLE `pesanan` (
  `id` int(11) NOT NULL,
  `no_pesanan` varchar(50) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `totalBayar` double NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pesanan`
--

INSERT INTO `pesanan` (`id`, `no_pesanan`, `id_user`, `id_barang`, `jumlah`, `totalBayar`, `status`) VALUES
(8, '6777f6fa7472803012025', 2, 7, 1, 25000, 'LUNAS'),
(9, '6777f6fa7472803012025', 2, 7, 1, 25000, 'LUNAS'),
(10, '677fd1138127d09012025', 8, 8, 1, 20000, 'LUNAS'),
(11, '677fe86e3264109012025', 8, 12, 1, 75000, 'cart');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `telp` varchar(15) NOT NULL,
  `alamat` text NOT NULL,
  `id_level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `nama`, `email`, `password`, `telp`, `alamat`, `id_level`) VALUES
(6, 'admin', 'admin@admin.com', 'admin', '1234', 'dps', 1),
(8, 'ayu', 'ayu@gmail.com', '1234', '0827273822', 'bumi', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategori_barang`
--
ALTER TABLE `kategori_barang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `level`
--
ALTER TABLE `level`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `kategori_barang`
--
ALTER TABLE `kategori_barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `level`
--
ALTER TABLE `level`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pesanan`
--
ALTER TABLE `pesanan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
