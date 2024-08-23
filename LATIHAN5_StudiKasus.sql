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
-- Database: `LATIHAN5_StudiKasus`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(5) NOT NULL,
  `username` varchar(25) DEFAULT NULL,
  `password` varchar(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id_admin`, `username`, `password`) VALUES
(1, 'admin', 'admin'),
(2, 'Xxx', 'xxx');

-- --------------------------------------------------------

--
-- Struktur dari tabel `anggota`
--

CREATE TABLE `anggota` (
  `id_anggota` int(5) NOT NULL,
  `nama` varchar(45) DEFAULT NULL,
  `no_telp` varchar(15) DEFAULT NULL,
  `alamat` varchar(50) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `password` varchar(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `anggota`
--

INSERT INTO `anggota` (`id_anggota`, `nama`, `no_telp`, `alamat`, `email`, `password`) VALUES
(1, 'Irfan Maulana', '01244445555', 'BSD', 'irfan@gmail.com', '123'),
(2, 'Nur Kumalasari', '01233335555', 'Ciledug', 'nur@gmail.com', '123'),
(3, 'Sanjaya Wijaya', '01211115555', 'Cimone', 'sanjaya@gmail.com', '123'),
(4, 'Eva Irfaniingsih', '01266665555', 'Tangerang', 'eva@gmail.com', '123'),
(5, 'Ifqoh Permatasari', '01277775555', 'Cengkareng', 'ifqoh@gmail.com', '123'),
(6, 'Indah Riana', '01288885555', 'Fatmawati', 'indah@gmail.com', '123'),
(7, 'Tiwi Andrawati', '01299995555', 'Warung Jati', 'tiwie@gmail.com', '123'),
(8, 'Mus Dalifa', '01200005555', 'Jatiwaringin', 'mus@gmail.com', '123'),
(9, 'Hisbu Utomo', '01233336666', 'Salemba', 'hisbu@gmail.com', '123'),
(10, 'Zaenal Abidin', '01233337777', 'Bekasi', 'zaenal@gmail.com', '123');

-- --------------------------------------------------------

--
-- Struktur dari tabel `buku`
--

CREATE TABLE `buku` (
  `id_buku` int(5) NOT NULL,
  `id_katalog` int(5) DEFAULT NULL,
  `judul_buku` varchar(50) DEFAULT NULL,
  `pengarang` varchar(35) DEFAULT NULL,
  `thn_terbit` date DEFAULT NULL,
  `penerbit` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `buku`
--

INSERT INTO `buku` (`id_buku`, `id_katalog`, `judul_buku`, `pengarang`, `thn_terbit`, `penerbit`) VALUES
(1, 1, 'Robotika Sederhana', 'Siswoyo Utomo', '2013-01-01', 'Wacana Ria'),
(2, 3, 'Mahir dengan PHP', 'Adri Kusuma', '2011-02-02', 'Pustaka Bangsa'),
(3, 2, 'Mahir Mewarnai', 'Akhmad Rahmat', '2014-03-03', 'CV.Indo Kreasi'),
(4, 1, 'Hukum Fisika', 'Kurnia Sandi', '2013-04-04', 'Wacana Ria'),
(5, 8, 'Mahir Bahasa Inggris', 'Aliuddin', '2013-05-05', 'CV.Indo Kreasi'),
(6, 4, 'Public Speaking', 'Pambudi Prasetyo', '2015-06-06', 'Aldi Pustaka'),
(7, 3, 'Trik SQL', 'Ahdim Makaren', '2014-07-07', 'Wacana Ria'),
(8, 6, 'Kemurnian Agama', 'Pambudi Prasetyo', '2014-08-08', 'Aldi Pustaka'),
(9, 1, 'Mikrokontroler', 'Ahdim Makaren', '2012-09-09', 'Wacana Ria');

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_pinjam`
--

CREATE TABLE `detail_pinjam` (
  `id_pinjam` int(5) DEFAULT NULL,
  `id_buku` int(5) DEFAULT NULL,
  `tgl_pengembalian` date DEFAULT NULL,
  `denda` double DEFAULT NULL,
  `status_buku` enum('kembali','belum kembali') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `katalog_buku`
--

CREATE TABLE `katalog_buku` (
  `id_katalog` int(5) NOT NULL,
  `nama_katalog` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `katalog_buku`
--

INSERT INTO `katalog_buku` (`id_katalog`, `nama_katalog`) VALUES
(1, 'sains'),
(2, 'hobby'),
(3, 'komputer'),
(4, 'komunikasi'),
(5, 'hukum'),
(6, 'agama'),
(7, 'populer'),
(8, 'bahasa');

-- --------------------------------------------------------

--
-- Struktur dari tabel `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id_pinjam` int(5) NOT NULL,
  `id_anggota` int(5) DEFAULT NULL,
  `tgl_pinjam` date DEFAULT NULL,
  `tgl_kembali` date DEFAULT NULL,
  `status` enum('selesai','belum selesai') DEFAULT NULL,
  `jml_buku` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indeks untuk tabel `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`id_anggota`);

--
-- Indeks untuk tabel `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id_buku`),
  ADD KEY `fk_id_katalog` (`id_katalog`);

--
-- Indeks untuk tabel `detail_pinjam`
--
ALTER TABLE `detail_pinjam`
  ADD KEY `fk_id_buku` (`id_buku`),
  ADD KEY `fk_id_pinjam` (`id_pinjam`);

--
-- Indeks untuk tabel `katalog_buku`
--
ALTER TABLE `katalog_buku`
  ADD PRIMARY KEY (`id_katalog`);

--
-- Indeks untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`id_pinjam`),
  ADD KEY `fk_id_anggota` (`id_anggota`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `anggota`
--
ALTER TABLE `anggota`
  MODIFY `id_anggota` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `buku`
--
ALTER TABLE `buku`
  MODIFY `id_buku` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `id_pinjam` int(5) NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `buku`
--
ALTER TABLE `buku`
  ADD CONSTRAINT `fk_id_katalog` FOREIGN KEY (`id_katalog`) REFERENCES `katalog_buku` (`id_katalog`);

--
-- Ketidakleluasaan untuk tabel `detail_pinjam`
--
ALTER TABLE `detail_pinjam`
  ADD CONSTRAINT `fk_id_buku` FOREIGN KEY (`id_buku`) REFERENCES `buku` (`id_buku`),
  ADD CONSTRAINT `fk_id_pinjam` FOREIGN KEY (`id_pinjam`) REFERENCES `peminjaman` (`id_pinjam`);

--
-- Ketidakleluasaan untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD CONSTRAINT `fk_id_anggota` FOREIGN KEY (`id_anggota`) REFERENCES `anggota` (`id_anggota`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
