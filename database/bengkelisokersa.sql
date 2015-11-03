-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 03, 2015 at 03:47 AM
-- Server version: 5.6.24
-- PHP Version: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `bengkelisokersa`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE IF NOT EXISTS `barang` (
  `kode_barang` char(5) NOT NULL,
  `nama_barang` varchar(20) DEFAULT NULL,
  `harga_jual` int(11) DEFAULT NULL,
  `stok` int(11) DEFAULT NULL,
  `kode_kategori` char(5) DEFAULT NULL,
  `keterangan` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`kode_barang`, `nama_barang`, `harga_jual`, `stok`, `kode_kategori`, `keterangan`) VALUES
('B0001', 'Oli Enduro', 10000, 39, 'KAT02', 'ada'),
('B0002', 'Roda Depan', 1000, 0, 'KAT01', 'oke jon');

-- --------------------------------------------------------

--
-- Table structure for table `detail_beli`
--

CREATE TABLE IF NOT EXISTS `detail_beli` (
  `kode_pembelian` char(10) DEFAULT NULL,
  `kode_barang` char(5) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_beli`
--

INSERT INTO `detail_beli` (`kode_pembelian`, `kode_barang`, `harga`, `jumlah`) VALUES
('PEM0000001', 'B0001', 800, 1),
('PEM0000002', 'B0001', 800, 20),
('PEM0000003', 'B0001', 700, 50),
('PEM0000004', 'B0001', 700, 70),
('PEM0000005', 'B0001', 700, 6),
('PEM0000006', 'B0001', 700, 60),
('PEM0000007', 'B0001', 700, 3),
('PEM0000008', 'B0002', 700, 20),
('PEM0000009', 'B0001', 700, 20),
('PEM0000010', 'B0001', 600, 30),
('PEM0000011', 'B0001', 500, 20),
('PEM0000012', 'B0001', 500, 70);

-- --------------------------------------------------------

--
-- Table structure for table `detail_jual`
--

CREATE TABLE IF NOT EXISTS `detail_jual` (
  `kode_transaksi` char(10) DEFAULT NULL,
  `kode_barang` char(5) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_jual`
--

INSERT INTO `detail_jual` (`kode_transaksi`, `kode_barang`, `harga`, `jumlah`) VALUES
('PJ00000001', 'B0001', 10000, 50),
('PJ00000002', 'B0001', 10000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `detail_servis`
--

CREATE TABLE IF NOT EXISTS `detail_servis` (
  `kode_transaksi` char(10) DEFAULT NULL,
  `kode_jasa` char(5) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_servis`
--

INSERT INTO `detail_servis` (`kode_transaksi`, `kode_jasa`, `harga`, `jumlah`) VALUES
('PJ00000002', 'JAS01', 4000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `jasa`
--

CREATE TABLE IF NOT EXISTS `jasa` (
  `kode_jasa` char(5) NOT NULL,
  `nama_jasa` varchar(20) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jasa`
--

INSERT INTO `jasa` (`kode_jasa`, `nama_jasa`, `harga`) VALUES
('JAS01', 'Servis Ringan', 4000),
('JAS02', 'Ganti Oli', 9000);

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE IF NOT EXISTS `kategori` (
  `kode_kategori` char(5) NOT NULL,
  `nama_kategori` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`kode_kategori`, `nama_kategori`) VALUES
('KAT01', 'Ban dalam'),
('KAT02', 'Oli Samping'),
('KAT03', 'Ban Luar');

-- --------------------------------------------------------

--
-- Table structure for table `mekanik`
--

CREATE TABLE IF NOT EXISTS `mekanik` (
  `kode_mekanik` char(5) NOT NULL,
  `nama_mekanik` varchar(20) DEFAULT NULL,
  `alamat` varchar(50) DEFAULT NULL,
  `no_telp` varchar(15) DEFAULT NULL,
  `keahlian` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mekanik`
--

INSERT INTO `mekanik` (`kode_mekanik`, `nama_mekanik`, `alamat`, `no_telp`, `keahlian`) VALUES
('MKA01', 'Taufik', 'Sleman jogja', '081 906 557 343', 'Sleman jogja');

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE IF NOT EXISTS `pelanggan` (
  `kode_pelanggan` char(5) NOT NULL,
  `nama_pelanggan` varchar(20) DEFAULT NULL,
  `alamat` varchar(100) DEFAULT NULL,
  `no_telp` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`kode_pelanggan`, `nama_pelanggan`, `alamat`, `no_telp`) VALUES
('P0001', 'Taufik', 'Sleman jogjakarta', '081907898'),
('P0002', 'Sutopo', 'Sleman', '0819087899'),
('P0003', 'Sunyoto', 'Sleman', '0819089980081'),
('P0004', 'Fakhri', 'Sleman', '081909890'),
('P0005', 'sda', 'sdsad', '23123');

-- --------------------------------------------------------

--
-- Table structure for table `pemasok`
--

CREATE TABLE IF NOT EXISTS `pemasok` (
  `kode_pemasok` char(5) NOT NULL,
  `nama_pemasok` varchar(20) DEFAULT NULL,
  `alamat` varchar(50) DEFAULT NULL,
  `no_telp` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pemasok`
--

INSERT INTO `pemasok` (`kode_pemasok`, `nama_pemasok`, `alamat`, `no_telp`) VALUES
('P0001', 'Toko Merah Asri', 'Sleman', '081904678');

-- --------------------------------------------------------

--
-- Table structure for table `pembelian`
--

CREATE TABLE IF NOT EXISTS `pembelian` (
  `kodepembelian` char(10) NOT NULL,
  `kode_pengguna` char(5) DEFAULT NULL,
  `kode_pemasok` char(5) DEFAULT NULL,
  `tgl_pembelian` date DEFAULT NULL,
  `total` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pembelian`
--

INSERT INTO `pembelian` (`kodepembelian`, `kode_pengguna`, `kode_pemasok`, `tgl_pembelian`, `total`) VALUES
('PEM0000001', 'PEG01', 'P0001', '2015-10-02', 800),
('PEM0000002', 'PEG01', 'P0001', '2015-10-02', 16000),
('PEM0000003', 'PEG01', 'P0001', '2015-10-02', 35000),
('PEM0000004', 'PEG01', 'P0001', '2015-10-02', 49000),
('PEM0000005', 'PEG01', 'P0001', '2015-10-02', 4200),
('PEM0000006', 'PEG01', 'P0001', '2015-10-02', 42000),
('PEM0000007', 'PEG01', 'P0001', '2015-10-02', 2100),
('PEM0000008', 'PEG01', 'P0001', '2015-10-02', 14000),
('PEM0000009', 'PEG01', 'P0001', '2015-10-02', 14000),
('PEM0000010', 'PEG01', 'P0001', '2015-10-02', 18000),
('PEM0000011', 'PEG01', 'P0001', '2015-10-02', 10000),
('PEM0000012', 'PEG01', 'P0001', '2015-10-02', 35000);

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE IF NOT EXISTS `pengguna` (
  `kode_pengguna` char(5) NOT NULL,
  `nama_pengguna` varchar(20) DEFAULT NULL,
  `username` varchar(10) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `jabatan` enum('kasir','admin','pemilik') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pengguna`
--

INSERT INTO `pengguna` (`kode_pengguna`, `nama_pengguna`, `username`, `password`, `jabatan`) VALUES
('PEG01', 'taufik', 'taufik', 'taufik', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE IF NOT EXISTS `transaksi` (
  `kode_transaksi` char(10) NOT NULL,
  `kode_pengguna` char(5) DEFAULT NULL,
  `kode_mekanik` char(5) DEFAULT NULL,
  `kode_pelanggan` char(5) DEFAULT NULL,
  `tgl_transaksi` datetime DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `no_polisi` char(10) DEFAULT NULL,
  `keterangan` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`kode_transaksi`, `kode_pengguna`, `kode_mekanik`, `kode_pelanggan`, `tgl_transaksi`, `total`, `no_polisi`, `keterangan`) VALUES
('PJ00000001', 'PEG01', NULL, NULL, '2015-10-02 00:00:00', 500000, NULL, NULL),
('PJ00000002', 'PEG01', 'MKA01', 'P0003', '2015-10-02 00:00:00', 14000, 'AA2348CP', 'Ok');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`kode_barang`), ADD KEY `kode_kategori` (`kode_kategori`);

--
-- Indexes for table `detail_beli`
--
ALTER TABLE `detail_beli`
  ADD KEY `kode_pembelian` (`kode_pembelian`), ADD KEY `kode_barang` (`kode_barang`);

--
-- Indexes for table `detail_jual`
--
ALTER TABLE `detail_jual`
  ADD KEY `kode_transaksi` (`kode_transaksi`), ADD KEY `kode_barang` (`kode_barang`);

--
-- Indexes for table `detail_servis`
--
ALTER TABLE `detail_servis`
  ADD KEY `kode_transaksi` (`kode_transaksi`), ADD KEY `detail_servis_ibfk_2` (`kode_jasa`);

--
-- Indexes for table `jasa`
--
ALTER TABLE `jasa`
  ADD PRIMARY KEY (`kode_jasa`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`kode_kategori`);

--
-- Indexes for table `mekanik`
--
ALTER TABLE `mekanik`
  ADD PRIMARY KEY (`kode_mekanik`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`kode_pelanggan`);

--
-- Indexes for table `pemasok`
--
ALTER TABLE `pemasok`
  ADD PRIMARY KEY (`kode_pemasok`);

--
-- Indexes for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`kodepembelian`), ADD KEY `kode_pengguna` (`kode_pengguna`), ADD KEY `kode_pemasok` (`kode_pemasok`);

--
-- Indexes for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`kode_pengguna`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`kode_transaksi`), ADD KEY `kode_pengguna` (`kode_pengguna`), ADD KEY `kode_mekanik` (`kode_mekanik`), ADD KEY `kode_pelanggan` (`kode_pelanggan`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barang`
--
ALTER TABLE `barang`
ADD CONSTRAINT `barang_ibfk_1` FOREIGN KEY (`kode_kategori`) REFERENCES `kategori` (`kode_kategori`);

--
-- Constraints for table `detail_beli`
--
ALTER TABLE `detail_beli`
ADD CONSTRAINT `detail_beli_ibfk_1` FOREIGN KEY (`kode_pembelian`) REFERENCES `pembelian` (`kodepembelian`),
ADD CONSTRAINT `detail_beli_ibfk_2` FOREIGN KEY (`kode_barang`) REFERENCES `barang` (`kode_barang`);

--
-- Constraints for table `detail_jual`
--
ALTER TABLE `detail_jual`
ADD CONSTRAINT `detail_jual_ibfk_1` FOREIGN KEY (`kode_transaksi`) REFERENCES `transaksi` (`kode_transaksi`),
ADD CONSTRAINT `detail_jual_ibfk_2` FOREIGN KEY (`kode_barang`) REFERENCES `barang` (`kode_barang`);

--
-- Constraints for table `detail_servis`
--
ALTER TABLE `detail_servis`
ADD CONSTRAINT `detail_servis_ibfk_1` FOREIGN KEY (`kode_transaksi`) REFERENCES `transaksi` (`kode_transaksi`),
ADD CONSTRAINT `detail_servis_ibfk_2` FOREIGN KEY (`kode_jasa`) REFERENCES `jasa` (`kode_jasa`);

--
-- Constraints for table `pembelian`
--
ALTER TABLE `pembelian`
ADD CONSTRAINT `pembelian_ibfk_1` FOREIGN KEY (`kode_pengguna`) REFERENCES `pengguna` (`kode_pengguna`),
ADD CONSTRAINT `pembelian_ibfk_2` FOREIGN KEY (`kode_pemasok`) REFERENCES `pemasok` (`kode_pemasok`);

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`kode_pengguna`) REFERENCES `pengguna` (`kode_pengguna`),
ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`kode_mekanik`) REFERENCES `mekanik` (`kode_mekanik`),
ADD CONSTRAINT `transaksi_ibfk_3` FOREIGN KEY (`kode_pelanggan`) REFERENCES `pelanggan` (`kode_pelanggan`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
