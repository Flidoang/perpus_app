-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 16 Jul 2023 pada 19.40
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perpustakaan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `buku`
--

CREATE TABLE `buku` (
  `id` int(11) NOT NULL,
  `cover` varchar(255) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `penulis` varchar(100) NOT NULL,
  `halaman` int(11) NOT NULL,
  `sinopsis` text NOT NULL,
  `isi` text NOT NULL,
  `kategori` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `buku`
--

INSERT INTO `buku` (`id`, `cover`, `judul`, `penulis`, `halaman`, `sinopsis`, `isi`, `kategori`) VALUES
(4, '6d96bc71-e4f4-4ab0-a88b-047e92fee8677937670624083709242.jpg', 'Rafli Book', 'Rafli Hendarsyah', 500, 'dwasdwasdwasdwasdw\nasdawsdwasdwasdwaw\nsdwasdwadwadawd\nasdwadadawdwadwad\nasdwawdwadawdawd', 'hahahahahahahahah\nahahahahahahhaha\nahahahahahahahah\nahahahahahhahah', 'Fantasy'),
(8, 'IMG_20230715_224114.jpg', 'test', 'puja', 600, 'test', 'test', 'test');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `no_hp` varchar(15) NOT NULL,
  `role` enum('admin','user') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `nama`, `username`, `password`, `no_hp`, `role`) VALUES
(1, 'admin', 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', '083837277250', 'admin'),
(2, 'puja', 'puja', '8cb2237d0679ca88db6464eac60da96345513964', '08814574317', 'user'),
(3, 'pujarchmnsyh', 'pujarchmnsyh', '7c222fb2927d828af22f592134e8932480637c0d', '08814574317', 'user'),
(4, 'user', 'user', '8cb2237d0679ca88db6464eac60da96345513964', '088674521', 'user');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `buku`
--
ALTER TABLE `buku`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
