-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 08, 2023 at 07:07 PM
-- Server version: 10.4.22-MariaDB-log
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `libraries`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` int(25) NOT NULL,
  `name` varchar(255) NOT NULL,
  `writer` varchar(255) NOT NULL,
  `publisher` varchar(255) NOT NULL,
  `stock` varchar(255) NOT NULL,
  `note` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `name`, `writer`, `publisher`, `stock`, `note`) VALUES
(1, 'Aku, Kamu & Diamu Diaku', 'Annisa Hafitria', 'Gramedia', '100', 'Novel Beda Agama'),
(2, 'Kita, Apakah Mungkin?', 'Nisa Fitria', 'Buku Nesia', '100', 'Cerita Beda Agama'),
(3, 'Diantara Dua Tuhan', 'Anha Nifi', 'Deep Publish', '100', 'Kisah Beda Agama'),
(4, 'Aku & Kamu, Bisa?', 'Nifi Anha', 'Grasindo', '100', 'Perjalanan Beda Agama'),
(6, 'Apa Kita Beneran Ga Bisa Sama Sekali?', 'Nis Aftr', 'Bokesia', '200', 'Perbedaan');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
