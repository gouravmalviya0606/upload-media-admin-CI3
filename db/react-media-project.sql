-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 23, 2024 at 08:13 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `react-media-project`
--

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `id` int(11) NOT NULL,
  `file_name` varchar(100) NOT NULL,
  `file_type` varchar(100) NOT NULL,
  `file_content` varchar(100) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `files`
--

INSERT INTO `files` (`id`, `file_name`, `file_type`, `file_content`, `user_id`, `created_at`) VALUES
(18, 'alesia-kazantceva-VWcPlbHglYc-unsplash.jpg', 'image/jpeg', '', 16, '2024-04-22 00:00:00'),
(19, 'alesia-kazantceva-VWcPlbHglYc-unsplash1.jpg', 'image/jpeg', '', 16, '2024-04-22 00:00:00'),
(20, 'samantha-gades-BlIhVfXbi9s-unsplash.jpg', 'image/jpeg', '', 16, '2024-04-22 00:00:00'),
(21, 'file-sample_150kB.pdf', 'application/pdf', '', 16, '2024-04-22 00:00:00'),
(22, 'oleksii-shikov-nKZy1rfkAIc-unsplash.jpg', 'image/jpeg', '', 16, '2024-04-22 00:00:00'),
(23, 'oleksii-shikov-nKZy1rfkAIc-unsplash1.jpg', 'image/jpeg', '', 16, '2024-04-22 00:00:00'),
(24, 'oleksii-shikov-nKZy1rfkAIc-unsplash2.jpg', 'image/jpeg', '', 16, '2024-04-22 00:00:00'),
(25, 'samantha-gades-BlIhVfXbi9s-unsplash1.jpg', 'image/jpeg', '', 18, '2024-04-22 00:00:00'),
(26, 'dummy.pdf', 'application/pdf', '', 18, '2024-04-22 00:00:00'),
(27, 'alesia-kazantceva-VWcPlbHglYc-unsplash2.jpg', 'image/jpeg', '', 18, '2024-04-22 00:00:00'),
(28, 'dummy1.pdf', 'application/pdf', '', 16, '2024-04-22 00:00:00'),
(29, 'oleksii-shikov-nKZy1rfkAIc-unsplash3.jpg', 'image/jpeg', '', 16, '2024-04-22 00:00:00'),
(30, 'oleksii-shikov-nKZy1rfkAIc-unsplash4.jpg', 'image/jpeg', '', 16, '2024-04-22 00:00:00'),
(31, 'alesia-kazantceva-VWcPlbHglYc-unsplash3.jpg', 'image/jpeg', '', 16, '2024-04-23 00:00:00'),
(32, 'oleksii-shikov-nKZy1rfkAIc-unsplash5.jpg', 'image/jpeg', '', 16, '2024-04-23 00:00:00'),
(33, 'alesia-kazantceva-VWcPlbHglYc-unsplash4.jpg', 'image/jpeg', '', 16, '2024-04-23 00:00:00'),
(34, 'alesia-kazantceva-VWcPlbHglYc-unsplash5.jpg', 'image/jpeg', '', 16, '2024-04-23 00:00:00'),
(35, 'alesia-kazantceva-VWcPlbHglYc-unsplash6.jpg', 'image/jpeg', '', 16, '2024-04-23 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `firstname`, `lastname`, `email`, `password`) VALUES
(16, 'gourav', 'malviya', 'gourav@gmail.com', '123'),
(18, 'gourav1', 'malviya1', 'gourav1@gmail.com', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `user_token`
--

CREATE TABLE `user_token` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `token` varchar(100) DEFAULT NULL,
  `login_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `logout_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_token`
--

INSERT INTO `user_token` (`id`, `user_id`, `token`, `login_at`, `logout_at`) VALUES
(24, 16, 'Z291cmF2QGdtYWlsLmNvbQ==', '2024-04-23 05:18:43', '2024-04-23 00:00:00'),
(25, 16, 'Z291cmF2QGdtYWlsLmNvbQ==', '2024-04-23 05:18:43', '2024-04-23 00:00:00'),
(26, 16, 'Z291cmF2QGdtYWlsLmNvbQ==', '2024-04-23 05:18:43', '2024-04-23 00:00:00'),
(27, 16, 'Z291cmF2QGdtYWlsLmNvbQ==', '2024-04-23 05:18:43', '2024-04-23 00:00:00'),
(28, 16, 'Z291cmF2QGdtYWlsLmNvbQ==', '2024-04-23 05:18:43', '2024-04-23 00:00:00'),
(29, 16, 'Z291cmF2QGdtYWlsLmNvbQ==', '2024-04-23 05:18:43', '2024-04-23 00:00:00'),
(30, 16, 'Z291cmF2QGdtYWlsLmNvbQ==', '2024-04-23 05:18:43', '2024-04-23 00:00:00'),
(31, 16, 'Z291cmF2QGdtYWlsLmNvbQ==', '2024-04-23 05:18:43', '2024-04-23 00:00:00'),
(32, 16, 'Z291cmF2QGdtYWlsLmNvbQ==', '2024-04-23 05:18:43', '2024-04-23 00:00:00'),
(33, 16, 'Z291cmF2QGdtYWlsLmNvbQ==', '2024-04-23 05:18:43', '2024-04-23 00:00:00'),
(34, 16, 'Z291cmF2QGdtYWlsLmNvbQ==', '2024-04-23 05:18:43', '2024-04-23 00:00:00'),
(35, 16, 'Z291cmF2QGdtYWlsLmNvbQ==', '2024-04-23 05:18:43', '2024-04-23 00:00:00'),
(36, 16, 'Z291cmF2QGdtYWlsLmNvbQ==', '2024-04-23 05:18:43', '2024-04-23 00:00:00'),
(37, 16, 'Z291cmF2QGdtYWlsLmNvbQ==', '2024-04-23 05:18:43', '2024-04-23 00:00:00'),
(38, 16, 'Z291cmF2QGdtYWlsLmNvbQ==', '2024-04-23 05:18:43', '2024-04-23 00:00:00'),
(39, 16, 'Z291cmF2QGdtYWlsLmNvbQ==', '2024-04-23 05:18:43', '2024-04-23 00:00:00'),
(40, 16, 'Z291cmF2QGdtYWlsLmNvbQ==', '2024-04-23 05:18:43', '2024-04-23 00:00:00'),
(41, 16, 'Z291cmF2QGdtYWlsLmNvbQ==', '2024-04-23 05:18:43', '2024-04-23 00:00:00'),
(42, 16, 'Z291cmF2QGdtYWlsLmNvbQ==', '2024-04-23 05:18:43', '2024-04-23 00:00:00'),
(43, 16, 'Z291cmF2QGdtYWlsLmNvbQ==', '2024-04-23 05:18:43', '2024-04-23 00:00:00'),
(44, 16, 'Z291cmF2QGdtYWlsLmNvbQ==', '2024-04-23 05:18:43', '2024-04-23 00:00:00'),
(45, 18, 'Z291cmF2MUBnbWFpbC5jb20=', '2024-04-22 07:43:39', '2024-04-22 00:00:00'),
(46, 16, 'Z291cmF2QGdtYWlsLmNvbQ==', '2024-04-23 05:18:43', '2024-04-23 00:00:00'),
(47, 18, 'Z291cmF2MUBnbWFpbC5jb20=', '2024-04-22 07:53:51', '2024-04-22 00:00:00'),
(48, 16, 'Z291cmF2QGdtYWlsLmNvbQ==', '2024-04-23 05:18:43', '2024-04-23 00:00:00'),
(49, 16, 'Z291cmF2QGdtYWlsLmNvbQ==', '2024-04-23 05:18:43', '2024-04-23 00:00:00'),
(50, 16, 'Z291cmF2QGdtYWlsLmNvbQ==', '2024-04-23 05:18:43', '2024-04-23 00:00:00'),
(51, 16, 'Z291cmF2QGdtYWlsLmNvbQ==', '2024-04-23 05:18:43', '2024-04-23 00:00:00'),
(52, 16, 'Z291cmF2QGdtYWlsLmNvbQ==', '2024-04-23 05:18:43', '2024-04-23 00:00:00'),
(53, 16, 'Z291cmF2QGdtYWlsLmNvbQ==', '2024-04-23 05:31:18', '2024-04-23 00:00:00'),
(54, 16, 'Z291cmF2QGdtYWlsLmNvbQ==', '2024-04-23 05:34:55', NULL),
(55, 16, 'Z291cmF2QGdtYWlsLmNvbQ==', '2024-04-23 05:35:36', NULL),
(56, 16, 'Z291cmF2QGdtYWlsLmNvbQ==', '2024-04-23 05:36:11', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_token`
--
ALTER TABLE `user_token`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `user_token`
--
ALTER TABLE `user_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
