-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 22, 2023 at 06:44 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `belajar_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `belajar`
--

CREATE TABLE `belajar` (
  `id` int(11) NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `namabuku` varchar(255) NOT NULL,
  `harga` int(11) NOT NULL,
  `tipebuku` varchar(255) DEFAULT NULL,
  `userId` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `belajar`
--

INSERT INTO `belajar` (`id`, `uuid`, `namabuku`, `harga`, `tipebuku`, `userId`, `createdAt`, `updatedAt`) VALUES
(1, '9c24b280-418a-4a51-93f9-b239522cfead', 'rahasia dunia', 50000, 'e-book', 3, '2023-01-22 09:54:18', '2023-01-22 09:54:18'),
(4, '5c9baf23-59af-4834-8596-2704719bd1a0', 'menanam ubi', 20000, 'buku', 1, '2023-01-22 17:11:21', '2023-01-22 17:11:21'),
(5, '02ec3a5d-11fe-4cee-b5d7-cefe1873562a', 'berubah pola pikir', 150000, 'e-buku', 4, '2023-01-22 17:20:34', '2023-01-22 17:20:34'),
(6, '89b4a0f0-54cc-4e7f-babf-c02cdb9cf0c0', 'belajar javascript', 200000, 'e-buku', 4, '2023-01-22 17:22:37', '2023-01-22 17:22:37');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `sid` varchar(36) NOT NULL,
  `expires` datetime DEFAULT NULL,
  `data` text DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`sid`, `expires`, `data`, `createdAt`, `updatedAt`) VALUES
('N6C8endd2PRGmGVemvYGyu3IN2qfaDai', '2023-01-23 17:30:24', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"userId\":\"1ed84c22-90fd-465d-9381-3e6a78c073ff\"}', '2023-01-22 17:29:42', '2023-01-22 17:30:24');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `uuid`, `name`, `email`, `password`, `role`, `createdAt`, `updatedAt`) VALUES
(1, '1ed84c22-90fd-465d-9381-3e6a78c073ff', 'admin', 'admin@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$DOpD1y34YofFeLOHv1mzNQ$UkNbrYQZqnh6dO3i7aW8PWAe88VIDST7H3aYVrbMCUA', 'admin', '2023-01-21 10:15:58', '2023-01-21 10:15:58'),
(3, 'e6a9c364-0261-400f-9c52-05fd48e79e97', 'kita coba user', 'user@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$xgefDnnhGO/8rhxSvSnIkA$rsjZIfifgWqiJ7S99CaocnDe4wNxPeIBwQmqQETxy9s', 'user', '2023-01-21 12:33:05', '2023-01-21 12:33:05'),
(4, 'f67a3e5e-e888-404b-abd3-bec8a90cebac', 'mrexploit', 'mrexploit@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$mAGWTzakkapCyIOB6AgKdQ$trqnr1A0z7hWBrk/hE0MVnY05s+NLP4DstAm1iCCCB8', 'user', '2023-01-22 17:08:18', '2023-01-22 17:08:18');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `belajar`
--
ALTER TABLE `belajar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`sid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `belajar`
--
ALTER TABLE `belajar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `belajar`
--
ALTER TABLE `belajar`
  ADD CONSTRAINT `belajar_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
