-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 23 Agu 2024 pada 13.00
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `LATIHAN2_DML`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `buku`
--

CREATE TABLE `buku` (
  `id_buku` char(4) NOT NULL,
  `judul_buku` varchar(45) DEFAULT NULL,
  `penulis` varchar(25) DEFAULT NULL,
  `thn_terbit` year(4) DEFAULT NULL,
  `penerbit` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `buku`
--

INSERT INTO `buku` (`id_buku`, `judul_buku`, `penulis`, `thn_terbit`, `penerbit`) VALUES
('BK01', 'perahu kertas', 'dewi lestari', '2007', 'abadi jaya'),
('BK02', 'laskar pelangi', 'andrea hirata', '2004', 'abadi jaya'),
('BK03', 'sang pemimpi', 'andrea hirata', '2005', 'abadi jaya'),
('BK04', 'harry potter 4', 'j.k. rowling', '2003', 'indo karya'),
('BK05', 'warnet sql', 'dr. nena', '2009', 'wacan ria');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelas`
--

CREATE TABLE `kelas` (
  `kelasID` char(2) NOT NULL,
  `ruangan` char(2) DEFAULT NULL,
  `kode_mtkul` char(3) DEFAULT NULL,
  `nip` char(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `mata_kuliah`
--

CREATE TABLE `mata_kuliah` (
  `kode_mtkul` char(3) NOT NULL,
  `nama_mtkul` varchar(30) DEFAULT NULL,
  `sks` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `mata_kuliah`
--

INSERT INTO `mata_kuliah` (`kode_mtkul`, `nama_mtkul`, `sks`) VALUES
('123', 'algoritma pemrograman', 4),
('124', 'sistem basis data', 3),
('125', 'web programming', 4),
('126', 'bahasa inggris', 3),
('128', 'java programming 1', 4),
('129', 'java programming 2', 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `member`
--

CREATE TABLE `member` (
  `id_member` char(5) NOT NULL,
  `nama_member` varchar(40) DEFAULT NULL,
  `alamat` varchar(75) DEFAULT NULL,
  `semester` char(2) DEFAULT NULL,
  `usia` char(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `member`
--

INSERT INTO `member` (`id_member`, `nama_member`, `alamat`, `semester`, `usia`) VALUES
('01001', 'tio ferdinand', 'jl. serpong raya no.11', '4', '21'),
('01002', 'amad sanches', 'jl. cilenggang no.20', '3', '20'),
('01003', 'riki bahagia', 'jl. hutama karya no.03', '4', '20'),
('01004', 'rere kurnia', 'jl. smapal serpong 167', '2', '19'),
('01005', 'erni susanti', 'jl. nusa loka 11 - bsd', '1', '18'),
('01006', 'loki nurdin', 'jl.bsd raya no.20', '1', '18');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengajar`
--

CREATE TABLE `pengajar` (
  `nip` char(4) NOT NULL,
  `nama` varchar(40) DEFAULT NULL,
  `kota_asal` varchar(50) DEFAULT NULL,
  `sks` int(2) DEFAULT NULL,
  `gaji` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pengajar`
--

INSERT INTO `pengajar` (`nip`, `nama`, `kota_asal`, `sks`, `gaji`) VALUES
('0101', 'ahmad rio', 'tangerang', 4, 3000000),
('0102', 'iwan kurniawan', 'serang', 2, 2000000),
('0103', 'asep kusnandar', 'tangerang', 4, 3000000),
('0104', 'wati irawati', 'bandung', 3, 2500000),
('0105', 'neng sukaesih', 'bandung', 2, 2000000),
('0106', 'maya putriah', 'jakarta', 2, 2000000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `transaksiID` char(5) NOT NULL,
  `tanggalTransaksi` date DEFAULT NULL,
  `id_member` char(5) DEFAULT NULL,
  `id_buku` char(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id_buku`);

--
-- Indeks untuk tabel `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`kelasID`),
  ADD KEY `fk_kode_mtkul` (`kode_mtkul`),
  ADD KEY `fk_nip` (`nip`);

--
-- Indeks untuk tabel `mata_kuliah`
--
ALTER TABLE `mata_kuliah`
  ADD PRIMARY KEY (`kode_mtkul`);

--
-- Indeks untuk tabel `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id_member`);

--
-- Indeks untuk tabel `pengajar`
--
ALTER TABLE `pengajar`
  ADD PRIMARY KEY (`nip`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`transaksiID`),
  ADD KEY `fk_id_member` (`id_member`),
  ADD KEY `fk_id_buku` (`id_buku`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `kelas`
--
ALTER TABLE `kelas`
  ADD CONSTRAINT `fk_kode_mtkul` FOREIGN KEY (`kode_mtkul`) REFERENCES `mata_kuliah` (`kode_mtkul`),
  ADD CONSTRAINT `fk_nip` FOREIGN KEY (`nip`) REFERENCES `pengajar` (`nip`);

--
-- Ketidakleluasaan untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `fk_id_buku` FOREIGN KEY (`id_buku`) REFERENCES `buku` (`id_buku`),
  ADD CONSTRAINT `fk_id_member` FOREIGN KEY (`id_member`) REFERENCES `member` (`id_member`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
