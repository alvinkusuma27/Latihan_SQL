-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 23 Agu 2024 pada 10.16
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
-- Database: `LATIHAN4_joinKampus`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `buku`
--

CREATE TABLE `buku` (
  `id_buku` int(3) NOT NULL,
  `judul` varchar(40) DEFAULT NULL,
  `thn_terbit` year(4) DEFAULT NULL,
  `id_kategori` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `buku`
--

INSERT INTO `buku` (`id_buku`, `judul`, `thn_terbit`, `id_kategori`) VALUES
(1, 'ptik', '2017', 1),
(2, 'sim', '2015', 2),
(3, 'apsi', '2014', 2),
(4, 'rpl', '2016', 4),
(5, 'linux', '2014', 5),
(6, 'so', '2013', 6);

-- --------------------------------------------------------

--
-- Struktur dari tabel `dosen`
--

CREATE TABLE `dosen` (
  `nip` char(5) NOT NULL,
  `nm_dosen` varchar(35) DEFAULT NULL,
  `thn_masuk` year(4) DEFAULT NULL,
  `alamat` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `dosen`
--

INSERT INTO `dosen` (`nip`, `nm_dosen`, `thn_masuk`, `alamat`) VALUES
('01011', 'budi santoso', '2003', 'tangerang'),
('01012', 'rio hermawan', '2009', 'jakarta'),
('01013', 'tio sandewa', '2005', 'jakarta'),
('01014', 'agus supardi', '2011', 'bogor'),
('01015', 'nurlaela sari', '2014', 'depok');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori_buku`
--

CREATE TABLE `kategori_buku` (
  `id_kategori` int(11) NOT NULL,
  `nm_kategori` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kategori_buku`
--

INSERT INTO `kategori_buku` (`id_kategori`, `nm_kategori`) VALUES
(1, 'manajemen informatika'),
(2, 'sistem informasi'),
(3, 'ilmu komputer'),
(4, 'teknik komputer'),
(5, 'jaringan komputer');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mengajar`
--

CREATE TABLE `mengajar` (
  `id` int(3) NOT NULL,
  `nip` char(5) DEFAULT NULL,
  `kd_mtkul` char(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `mengajar`
--

INSERT INTO `mengajar` (`id`, `nip`, `kd_mtkul`) VALUES
(1, '01011', '101'),
(2, '01011', '303'),
(3, '01012', '202'),
(4, '01012', '404'),
(5, '01012', '303'),
(6, '01013', '505'),
(7, '01013', '101'),
(8, '01014', '404'),
(9, '01015', '202'),
(10, '01015', '303');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mobil`
--

CREATE TABLE `mobil` (
  `kd_mobil` char(3) NOT NULL,
  `nopol` varchar(20) DEFAULT NULL,
  `jenis_mobil` varchar(20) DEFAULT NULL,
  `harga` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `mobil`
--

INSERT INTO `mobil` (`kd_mobil`, `nopol`, `jenis_mobil`, `harga`) VALUES
('M01', 'B123KO', 'Sedan', 600000),
('M02', 'B4321', 'Mini Bus', 500000),
('M03', 'B6789MH', 'Mini Bus', 500000),
('M04', 'B9876', 'Mini Bus', 450000),
('M05', 'B333LS', 'Mini Bus', 650000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `mt_kuliah`
--

CREATE TABLE `mt_kuliah` (
  `kd_mtkul` char(3) NOT NULL,
  `nm_mtkul` varchar(30) DEFAULT NULL,
  `sks` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `mt_kuliah`
--

INSERT INTO `mt_kuliah` (`kd_mtkul`, `nm_mtkul`, `sks`) VALUES
('101', 'algoritma', 4),
('202', 'ptik', 3),
('303', 'sim', 4),
('404', 'e-commerce', 2),
('505', 'agama', 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `penyewa`
--

CREATE TABLE `penyewa` (
  `no_ktp` char(8) NOT NULL,
  `nama` varchar(40) DEFAULT NULL,
  `alamat` varchar(70) DEFAULT NULL,
  `no_telp` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `penyewa`
--

INSERT INTO `penyewa` (`no_ktp`, `nama`, `alamat`, `no_telp`) VALUES
('12345678', 'cadas atmojo', 'sukabumi', '07123334444'),
('23456789', 'ria ella nurmala', 'tasikmalaya', '07123335555'),
('34567890', 'egi kusumawati', 'bandung', '07123336666'),
('56789012', 'satria mandala', 'kerawang', '07123337777'),
('67890123', 'agung gumelar', 'cikampek', '07123338888');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penyewaan`
--

CREATE TABLE `penyewaan` (
  `notrans` int(8) NOT NULL,
  `no_ktp` char(8) DEFAULT NULL,
  `kd_mobil` char(3) DEFAULT NULL,
  `tgl_sewa` date DEFAULT NULL,
  `tgl_kembali` date DEFAULT NULL,
  `lama_sewa` double DEFAULT NULL,
  `jumlah_sewa` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `penyewaan`
--

INSERT INTO `penyewaan` (`notrans`, `no_ktp`, `kd_mobil`, `tgl_sewa`, `tgl_kembali`, `lama_sewa`, `jumlah_sewa`) VALUES
(1, '12345678', 'M01', '2017-11-05', '2017-11-06', 1, 2),
(2, '23456789', 'M04', '2017-11-20', '2017-11-21', 1, 1),
(3, '56789012', 'M03', '2017-11-07', '2017-11-09', 2, 1);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id_buku`);

--
-- Indeks untuk tabel `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`nip`);

--
-- Indeks untuk tabel `kategori_buku`
--
ALTER TABLE `kategori_buku`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indeks untuk tabel `mengajar`
--
ALTER TABLE `mengajar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nip` (`nip`),
  ADD KEY `kd_mtkul` (`kd_mtkul`);

--
-- Indeks untuk tabel `mobil`
--
ALTER TABLE `mobil`
  ADD PRIMARY KEY (`kd_mobil`);

--
-- Indeks untuk tabel `mt_kuliah`
--
ALTER TABLE `mt_kuliah`
  ADD PRIMARY KEY (`kd_mtkul`);

--
-- Indeks untuk tabel `penyewa`
--
ALTER TABLE `penyewa`
  ADD PRIMARY KEY (`no_ktp`);

--
-- Indeks untuk tabel `penyewaan`
--
ALTER TABLE `penyewaan`
  ADD PRIMARY KEY (`notrans`),
  ADD KEY `no_ktp` (`no_ktp`),
  ADD KEY `kd_mobil` (`kd_mobil`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `buku`
--
ALTER TABLE `buku`
  MODIFY `id_buku` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `kategori_buku`
--
ALTER TABLE `kategori_buku`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `mengajar`
--
ALTER TABLE `mengajar`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `penyewaan`
--
ALTER TABLE `penyewaan`
  MODIFY `notrans` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `mengajar`
--
ALTER TABLE `mengajar`
  ADD CONSTRAINT `mengajar_ibfk_1` FOREIGN KEY (`nip`) REFERENCES `dosen` (`nip`),
  ADD CONSTRAINT `mengajar_ibfk_2` FOREIGN KEY (`kd_mtkul`) REFERENCES `mt_kuliah` (`kd_mtkul`);

--
-- Ketidakleluasaan untuk tabel `penyewaan`
--
ALTER TABLE `penyewaan`
  ADD CONSTRAINT `penyewaan_ibfk_1` FOREIGN KEY (`no_ktp`) REFERENCES `penyewa` (`no_ktp`),
  ADD CONSTRAINT `penyewaan_ibfk_2` FOREIGN KEY (`kd_mobil`) REFERENCES `mobil` (`kd_mobil`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
