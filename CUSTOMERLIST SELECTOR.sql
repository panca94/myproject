-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 11 Des 2025 pada 04.24
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `crm_db`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `salesId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `customers`
--

INSERT INTO `customers` (`id`, `email`, `phone`, `createdAt`, `updatedAt`, `userId`, `name`, `address`, `note`, `salesId`) VALUES
(1, NULL, NULL, '2025-12-11 10:01:28', '2025-12-11 10:01:28', NULL, 'PLN NP Naganraya', NULL, NULL, 6),
(3, NULL, NULL, '2025-12-11 10:01:28', '2025-12-11 10:01:28', NULL, 'PLN NP Paiton, 3990 MW', NULL, NULL, 6),
(4, NULL, NULL, '2025-12-11 10:01:28', '2025-12-11 10:01:28', NULL, 'PLN NP Rembang', NULL, NULL, 6),
(5, NULL, NULL, '2025-12-11 10:01:28', '2025-12-11 10:01:28', NULL, 'PLTU Tanjung Jati 1 -4 - Jepara', NULL, NULL, 6),
(6, NULL, NULL, '2025-12-11 10:01:28', '2025-12-11 10:01:28', NULL, 'PT Paiton Operation & Maintenance Indonesia', NULL, NULL, 6),
(7, NULL, NULL, '2025-12-11 10:01:28', '2025-12-11 10:01:28', NULL, 'PT Bhumi Jati Power 2000 MW', NULL, NULL, 6),
(8, NULL, NULL, '2025-12-11 10:01:28', '2025-12-11 10:01:28', NULL, 'PLTA Koto Panjang', NULL, NULL, 6),
(9, NULL, NULL, '2025-12-11 10:01:28', '2025-12-11 10:01:28', NULL, 'PLTU Pulau Pisang', NULL, NULL, 6),
(10, NULL, NULL, '2025-12-11 10:01:28', '2025-12-11 10:01:28', NULL, 'PLTU Tanjung Awar-awar', NULL, NULL, 6),
(11, NULL, NULL, '2025-12-11 10:01:28', '2025-12-11 10:01:28', NULL, 'PLN NP Kaltim Teluk', NULL, NULL, 6),
(12, NULL, NULL, '2025-12-11 10:04:13', '2025-12-11 10:04:13', NULL, 'PHE ONWJ', NULL, NULL, 5),
(13, NULL, NULL, '2025-12-11 10:04:13', '2025-12-11 10:04:13', NULL, 'PHE ONWJ', NULL, NULL, 5),
(14, NULL, NULL, '2025-12-11 10:04:13', '2025-12-11 10:04:13', NULL, 'PT SCG Sukabumi', NULL, NULL, 5),
(15, NULL, NULL, '2025-12-11 10:04:13', '2025-12-11 10:04:13', NULL, 'PT Vale Indonesia', NULL, NULL, 5),
(16, NULL, NULL, '2025-12-11 10:04:13', '2025-12-11 10:04:13', NULL, 'PT Mortar Utama', NULL, NULL, 5),
(17, NULL, NULL, '2025-12-11 10:04:13', '2025-12-11 10:04:13', NULL, 'PT Inalum', NULL, NULL, 5),
(24, NULL, NULL, '2025-12-11 10:04:13', '2025-12-11 10:04:13', NULL, 'PT Semen Padang', NULL, NULL, 5),
(27, NULL, NULL, '2025-12-11 10:04:13', '2025-12-11 10:04:13', NULL, 'PT Maulana Pratama Indo', NULL, NULL, 5),
(28, NULL, NULL, '2025-12-11 10:04:13', '2025-12-11 10:04:13', NULL, 'PT Maulana Pratama Indo', NULL, NULL, 5),
(29, NULL, NULL, '2025-12-11 10:04:13', '2025-12-11 10:04:13', NULL, 'PT Inalum', NULL, NULL, 5),
(30, NULL, NULL, '2025-12-11 10:05:34', '2025-12-11 10:05:34', NULL, 'PT Indah Kiat Pulp & Paper - Perawang', NULL, NULL, 2),
(31, NULL, NULL, '2025-12-11 10:05:34', '2025-12-11 10:05:34', NULL, 'IKPP Perawang', NULL, NULL, 2),
(32, NULL, NULL, '2025-12-11 10:05:34', '2025-12-11 10:05:34', NULL, 'PT Tirta Freshindo Jaya', NULL, NULL, 2),
(33, NULL, NULL, '2025-12-11 10:09:03', '2025-12-11 10:09:03', NULL, 'PLN IP Lontar', NULL, NULL, 3),
(34, NULL, NULL, '2025-12-11 10:09:03', '2025-12-11 10:09:03', NULL, 'PLN IP Labuan, 600 MW', NULL, NULL, 3),
(35, NULL, NULL, '2025-12-11 10:09:03', '2025-12-11 10:09:03', NULL, 'PLN NP Tarahan', NULL, NULL, 3),
(36, NULL, NULL, '2025-12-11 10:09:03', '2025-12-11 10:09:03', NULL, 'PLN NP Tenayan', NULL, NULL, 3),
(37, NULL, NULL, '2025-12-11 10:09:03', '2025-12-11 10:09:03', NULL, 'PLN NP Kamojang', NULL, NULL, 3),
(38, NULL, NULL, '2025-12-11 10:09:03', '2025-12-11 10:09:03', NULL, 'PLN NP Brantas', NULL, NULL, 3),
(39, NULL, NULL, '2025-12-11 10:09:03', '2025-12-11 10:09:03', NULL, 'PLN NP Gresik', NULL, NULL, 3),
(40, NULL, NULL, '2025-12-11 10:09:03', '2025-12-11 10:09:03', NULL, 'PLN NP Muara Karang', NULL, NULL, 3),
(41, NULL, NULL, '2025-12-11 10:09:03', '2025-12-11 10:09:03', NULL, 'PLN NP Sebalang', NULL, NULL, 3),
(42, NULL, NULL, '2025-12-11 10:09:03', '2025-12-11 10:09:03', NULL, 'PLN IP Suralaya', NULL, NULL, 3),
(43, NULL, NULL, '2025-12-11 10:09:03', '2025-12-11 10:09:03', NULL, 'PLN IP Cilegon', NULL, NULL, 3),
(44, NULL, NULL, '2025-12-11 10:09:03', '2025-12-11 10:09:03', NULL, 'PLN IP Pelabuhan Ratu', NULL, NULL, 3),
(45, NULL, NULL, '2025-12-11 10:09:03', '2025-12-11 10:09:03', NULL, 'PLN NP Muara Tawar', NULL, NULL, 3),
(46, NULL, NULL, '2025-12-11 10:09:03', '2025-12-11 10:09:03', NULL, 'PLN IP Adipala', NULL, NULL, 3),
(47, NULL, NULL, '2025-12-11 10:09:03', '2025-12-11 10:09:03', NULL, 'Pertamina EP Jatibarang', NULL, NULL, 3),
(48, NULL, NULL, '2025-12-11 10:09:03', '2025-12-11 10:09:03', NULL, 'PLN IP Semarang', NULL, NULL, 3),
(49, NULL, NULL, '2025-12-11 10:09:03', '2025-12-11 10:09:03', NULL, 'PT Cirebon Power', NULL, NULL, 3),
(50, NULL, NULL, '2025-12-11 10:09:03', '2025-12-11 10:09:03', NULL, 'PLN NP Service', NULL, NULL, 3),
(51, NULL, NULL, '2025-12-11 10:09:03', '2025-12-11 10:09:03', NULL, 'PT NS Bluescope', NULL, NULL, 3),
(52, NULL, NULL, '2025-12-11 10:09:03', '2025-12-11 10:09:03', NULL, 'PLN NP Belawan', NULL, NULL, 3),
(53, NULL, NULL, '2025-12-11 10:09:03', '2025-12-11 10:09:03', NULL, 'PT Krakatau Chandra Energi', NULL, NULL, 3),
(54, NULL, NULL, '2025-12-11 10:09:03', '2025-12-11 10:09:03', NULL, 'PT Geo Dipa Energi - Patuha', NULL, NULL, 3),
(55, NULL, NULL, '2025-12-11 10:09:03', '2025-12-11 10:09:03', NULL, 'PLN NP Indramayu', NULL, NULL, 3),
(56, NULL, NULL, '2025-12-11 10:09:03', '2025-12-11 10:09:03', NULL, 'PLN NP PLTMG Duri - Riau', NULL, NULL, 3),
(57, NULL, NULL, '2025-12-11 10:09:03', '2025-12-11 10:09:03', NULL, 'PLN NP Cirata', NULL, NULL, 3),
(58, NULL, NULL, '2025-12-11 10:09:03', '2025-12-11 10:09:03', NULL, 'PT Bukit  Asam', NULL, NULL, 3),
(59, NULL, NULL, '2025-12-11 10:09:03', '2025-12-11 10:09:03', NULL, 'Semen Indonesia Group - Gresik Plant', NULL, NULL, 3),
(60, NULL, NULL, '2025-12-11 10:09:03', '2025-12-11 10:09:03', NULL, 'PLN IP Teluk Sirih', NULL, NULL, 3),
(61, NULL, NULL, '2025-12-11 10:09:03', '2025-12-11 10:09:03', NULL, 'PLTU Batang', NULL, NULL, 3),
(62, NULL, NULL, '2025-12-11 10:09:03', '2025-12-11 10:09:03', NULL, 'PLN IP Semarang', NULL, NULL, 3),
(63, NULL, NULL, '2025-12-11 10:09:03', '2025-12-11 10:09:03', NULL, 'PT Mitra Cakrawala Internusa', NULL, NULL, 3),
(64, NULL, NULL, '2025-12-11 10:09:03', '2025-12-11 10:09:03', NULL, 'PLN NP Pusat', NULL, NULL, 3),
(65, NULL, NULL, '2025-12-11 10:09:03', '2025-12-11 10:09:03', NULL, 'PLN NP Belawan', NULL, NULL, 3),
(66, NULL, NULL, '2025-12-11 10:09:03', '2025-12-11 10:09:03', NULL, 'PLN NP Brantas', NULL, NULL, 3),
(67, NULL, NULL, '2025-12-11 10:09:03', '2025-12-11 10:09:03', NULL, 'PLN NP Indramayu', NULL, NULL, 3),
(73, NULL, NULL, '2025-12-11 10:09:03', '2025-12-11 10:09:03', NULL, 'PLN NP Tenayan', NULL, NULL, 3),
(75, NULL, NULL, '2025-12-11 10:09:03', '2025-12-11 10:09:03', NULL, 'PLN IP Kamojang', NULL, NULL, 3),
(76, NULL, NULL, '2025-12-11 10:09:03', '2025-12-11 10:09:03', NULL, 'PLN IP Teluk Sirih', NULL, NULL, 3),
(80, '', '', '2025-12-11 10:09:03', '2025-12-11 03:24:17', NULL, 'Pertamina EP Jatibarang', '', '', 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `projects`
--

CREATE TABLE `projects` (
  `id` int(11) NOT NULL,
  `projectName` varchar(255) NOT NULL,
  `projectDate` date DEFAULT NULL,
  `amount` bigint(20) DEFAULT 0,
  `status` enum('Budgeting','Won','On Progress','Lost','Re-Tender') DEFAULT 'On Progress',
  `update_status` enum('Proposal Submit','Eng Calculate','Won') DEFAULT NULL,
  `challenge` text DEFAULT NULL,
  `customerId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `projects`
--

INSERT INTO `projects` (`id`, `projectName`, `projectDate`, `amount`, `status`, `update_status`, `challenge`, `customerId`, `userId`, `createdAt`, `updatedAt`) VALUES
(7, 'Upgrade PLC HSD Plant', '2025-12-11', 603603603, 'Won', 'Won', '', 4, 6, '2025-12-11 03:16:45', '2025-12-11 03:16:45'),
(8, 'Materials Ship Unloader', '2025-12-11', 538000000, 'Won', 'Won', '', 3, 6, '2025-12-11 03:17:41', '2025-12-11 03:17:41'),
(9, 'Voltage Sag Corrector', '2025-12-11', 460000000, 'Won', 'Won', '', 11, 6, '2025-12-11 03:18:05', '2025-12-11 03:18:05'),
(10, 'Engineering Workstation', '2025-12-11', 495000000, 'Won', 'Won', '', 50, 3, '2025-12-11 03:19:50', '2025-12-11 03:19:50'),
(11, 'Pengadaan Part Sensor Vibrasi', '2025-12-11', 235000000, 'Won', 'Won', '', 67, 3, '2025-12-11 03:20:22', '2025-12-11 03:20:22'),
(12, 'Upgrade PLC Robotyer', '2025-12-11', 98000000, 'Won', 'Won', '', 31, 2, '2025-12-11 03:20:54', '2025-12-11 03:20:54');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','sales','manager') DEFAULT 'sales',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`, `createdAt`, `updatedAt`) VALUES
(1, 'admin', '$2a$12$0S.IFVwNnTtdgg2W8lD1LO8bFIemP.SxTVivDBs5cs4yf36IUayQm', 'admin', '2025-12-10 10:59:17', '2025-12-10 10:59:17'),
(2, 'darrell', '$2b$10$wlHOBoszTvAKNQurCOHC4ed1Za.jEXs51sfGmL5pbheblYL//OWYi', 'sales', '2025-12-10 04:12:07', '2025-12-10 04:12:07'),
(3, 'yuli', '$2b$10$HHfc/V7bgB7V5bLF2EY9v.9BjBYTiwxqMfTqXpN4TZK641bVVooWq', 'sales', '2025-12-10 06:40:57', '2025-12-10 06:40:57'),
(4, 'hariadi', '$2b$10$TgvAZOelQGOFPw1tveqSdOXzCUkU63214WNiVdpp1gSPtiS5MQtc.', 'sales', '2025-12-11 02:51:01', '2025-12-11 02:51:01'),
(5, 'riyadh', '$2b$10$d594LgYuVxzqJlrMuSAMUOmrqwLTQp8F8ifOKaO..TBV8iSUfLtWC', 'sales', '2025-12-11 02:51:07', '2025-12-11 02:51:07'),
(6, 'roki', '$2b$10$xxLuAj.Dpjgy9P7qMNNEBe8ljoQLlONz9sjQs30svCt5ZCl9.7g0.', 'sales', '2025-12-11 02:51:12', '2025-12-11 02:51:12'),
(7, 'sani', '$2b$10$ozZ89VyKWRufXchOi3iWC.QcbQFtVwevhAJ2HIQnAwfOKnJBU9YP6', 'admin', '2025-12-11 02:51:28', '2025-12-11 02:51:28'),
(8, 'asmon', '$2b$10$nTi4vmuXiWRjv8LuNe243uspi.SfIkCcuHz5GVAGBZmcM0M.lxvee', 'manager', '2025-12-11 02:51:36', '2025-12-11 02:51:36');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`),
  ADD KEY `salesId` (`salesId`);

--
-- Indeks untuk tabel `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customerId` (`customerId`),
  ADD KEY `userId` (`userId`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `username_2` (`username`),
  ADD UNIQUE KEY `username_3` (`username`),
  ADD UNIQUE KEY `username_4` (`username`),
  ADD UNIQUE KEY `username_5` (`username`),
  ADD UNIQUE KEY `username_6` (`username`),
  ADD UNIQUE KEY `username_7` (`username`),
  ADD UNIQUE KEY `username_8` (`username`),
  ADD UNIQUE KEY `username_9` (`username`),
  ADD UNIQUE KEY `username_10` (`username`),
  ADD UNIQUE KEY `username_11` (`username`),
  ADD UNIQUE KEY `username_12` (`username`),
  ADD UNIQUE KEY `username_13` (`username`),
  ADD UNIQUE KEY `username_14` (`username`),
  ADD UNIQUE KEY `username_15` (`username`),
  ADD UNIQUE KEY `username_16` (`username`),
  ADD UNIQUE KEY `username_17` (`username`),
  ADD UNIQUE KEY `username_18` (`username`),
  ADD UNIQUE KEY `username_19` (`username`),
  ADD UNIQUE KEY `username_20` (`username`),
  ADD UNIQUE KEY `username_21` (`username`),
  ADD UNIQUE KEY `username_22` (`username`),
  ADD UNIQUE KEY `username_23` (`username`),
  ADD UNIQUE KEY `username_24` (`username`),
  ADD UNIQUE KEY `username_25` (`username`),
  ADD UNIQUE KEY `username_26` (`username`),
  ADD UNIQUE KEY `username_27` (`username`),
  ADD UNIQUE KEY `username_28` (`username`),
  ADD UNIQUE KEY `username_29` (`username`),
  ADD UNIQUE KEY `username_30` (`username`),
  ADD UNIQUE KEY `username_31` (`username`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT untuk tabel `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `Customers_salesId_foreign_idx` FOREIGN KEY (`salesId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `customers_ibfk_10` FOREIGN KEY (`salesId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `customers_ibfk_11` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `customers_ibfk_12` FOREIGN KEY (`salesId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `customers_ibfk_13` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `customers_ibfk_14` FOREIGN KEY (`salesId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `customers_ibfk_15` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `customers_ibfk_16` FOREIGN KEY (`salesId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `customers_ibfk_17` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `customers_ibfk_18` FOREIGN KEY (`salesId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `customers_ibfk_19` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `customers_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `customers_ibfk_20` FOREIGN KEY (`salesId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `customers_ibfk_21` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `customers_ibfk_22` FOREIGN KEY (`salesId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `customers_ibfk_23` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `customers_ibfk_24` FOREIGN KEY (`salesId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `customers_ibfk_25` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `customers_ibfk_26` FOREIGN KEY (`salesId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `customers_ibfk_27` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `customers_ibfk_28` FOREIGN KEY (`salesId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `customers_ibfk_29` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `customers_ibfk_30` FOREIGN KEY (`salesId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `customers_ibfk_31` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `customers_ibfk_32` FOREIGN KEY (`salesId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `customers_ibfk_33` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `customers_ibfk_34` FOREIGN KEY (`salesId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `customers_ibfk_35` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `customers_ibfk_36` FOREIGN KEY (`salesId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `customers_ibfk_37` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `customers_ibfk_38` FOREIGN KEY (`salesId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `customers_ibfk_39` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `customers_ibfk_4` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `customers_ibfk_40` FOREIGN KEY (`salesId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `customers_ibfk_41` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `customers_ibfk_42` FOREIGN KEY (`salesId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `customers_ibfk_43` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `customers_ibfk_44` FOREIGN KEY (`salesId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `customers_ibfk_45` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `customers_ibfk_46` FOREIGN KEY (`salesId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `customers_ibfk_47` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `customers_ibfk_48` FOREIGN KEY (`salesId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `customers_ibfk_49` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `customers_ibfk_5` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `customers_ibfk_50` FOREIGN KEY (`salesId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `customers_ibfk_51` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `customers_ibfk_52` FOREIGN KEY (`salesId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `customers_ibfk_53` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `customers_ibfk_54` FOREIGN KEY (`salesId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `customers_ibfk_55` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `customers_ibfk_56` FOREIGN KEY (`salesId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `customers_ibfk_57` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `customers_ibfk_58` FOREIGN KEY (`salesId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `customers_ibfk_59` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `customers_ibfk_6` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `customers_ibfk_60` FOREIGN KEY (`salesId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `customers_ibfk_7` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `customers_ibfk_8` FOREIGN KEY (`salesId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `customers_ibfk_9` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `projects_ibfk_1` FOREIGN KEY (`customerId`) REFERENCES `customers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `projects_ibfk_10` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `projects_ibfk_11` FOREIGN KEY (`customerId`) REFERENCES `customers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `projects_ibfk_12` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `projects_ibfk_13` FOREIGN KEY (`customerId`) REFERENCES `customers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `projects_ibfk_14` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `projects_ibfk_15` FOREIGN KEY (`customerId`) REFERENCES `customers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `projects_ibfk_16` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `projects_ibfk_17` FOREIGN KEY (`customerId`) REFERENCES `customers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `projects_ibfk_18` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `projects_ibfk_19` FOREIGN KEY (`customerId`) REFERENCES `customers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `projects_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `projects_ibfk_20` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `projects_ibfk_21` FOREIGN KEY (`customerId`) REFERENCES `customers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `projects_ibfk_22` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `projects_ibfk_23` FOREIGN KEY (`customerId`) REFERENCES `customers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `projects_ibfk_24` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `projects_ibfk_25` FOREIGN KEY (`customerId`) REFERENCES `customers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `projects_ibfk_26` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `projects_ibfk_27` FOREIGN KEY (`customerId`) REFERENCES `customers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `projects_ibfk_28` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `projects_ibfk_29` FOREIGN KEY (`customerId`) REFERENCES `customers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `projects_ibfk_3` FOREIGN KEY (`customerId`) REFERENCES `customers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `projects_ibfk_30` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `projects_ibfk_31` FOREIGN KEY (`customerId`) REFERENCES `customers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `projects_ibfk_32` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `projects_ibfk_33` FOREIGN KEY (`customerId`) REFERENCES `customers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `projects_ibfk_34` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `projects_ibfk_35` FOREIGN KEY (`customerId`) REFERENCES `customers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `projects_ibfk_36` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `projects_ibfk_37` FOREIGN KEY (`customerId`) REFERENCES `customers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `projects_ibfk_38` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `projects_ibfk_39` FOREIGN KEY (`customerId`) REFERENCES `customers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `projects_ibfk_4` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `projects_ibfk_40` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `projects_ibfk_41` FOREIGN KEY (`customerId`) REFERENCES `customers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `projects_ibfk_42` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `projects_ibfk_43` FOREIGN KEY (`customerId`) REFERENCES `customers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `projects_ibfk_44` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `projects_ibfk_45` FOREIGN KEY (`customerId`) REFERENCES `customers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `projects_ibfk_46` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `projects_ibfk_47` FOREIGN KEY (`customerId`) REFERENCES `customers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `projects_ibfk_48` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `projects_ibfk_49` FOREIGN KEY (`customerId`) REFERENCES `customers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `projects_ibfk_5` FOREIGN KEY (`customerId`) REFERENCES `customers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `projects_ibfk_50` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `projects_ibfk_51` FOREIGN KEY (`customerId`) REFERENCES `customers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `projects_ibfk_52` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `projects_ibfk_53` FOREIGN KEY (`customerId`) REFERENCES `customers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `projects_ibfk_54` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `projects_ibfk_55` FOREIGN KEY (`customerId`) REFERENCES `customers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `projects_ibfk_56` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `projects_ibfk_57` FOREIGN KEY (`customerId`) REFERENCES `customers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `projects_ibfk_58` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `projects_ibfk_59` FOREIGN KEY (`customerId`) REFERENCES `customers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `projects_ibfk_6` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `projects_ibfk_60` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `projects_ibfk_61` FOREIGN KEY (`customerId`) REFERENCES `customers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `projects_ibfk_62` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `projects_ibfk_7` FOREIGN KEY (`customerId`) REFERENCES `customers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `projects_ibfk_8` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `projects_ibfk_9` FOREIGN KEY (`customerId`) REFERENCES `customers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
