-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 25, 2025 at 02:55 AM
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
-- Database: `inventaris_fix`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`) VALUES
(2, 'elektronik', '2025-10-13 14:55:52'),
(3, 'ATK', '2025-10-19 16:18:28'),
(5, 'kendaraan', '2025-10-20 02:35:42');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','karyawan') NOT NULL DEFAULT 'karyawan',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `name`, `email`, `password`, `role`, `created_at`) VALUES
(1, 'Admin', 'admin00@gmail.com', '$2y$10$GuJ24CnsVynMlBjeggq7requV3l2UCCqXr84ELWsTen/cgra/FAC.', 'admin', '2025-10-13 14:46:49'),
(99, 'candra1', 'candra1@gmail.com', '$2y$10$VDb8k4gUscKETQ1roHmuSOBu02Hc7UxC8AGn/Lyt43YMBkWBQ2KBe', 'karyawan', '2025-10-13 14:46:49'),
(100, 'maul', 'maul@gmail.com', '$2y$10$L6hHLx83nr3ElSqE/0f2oeIH/vtk0OAJrMX8VjCKelnGJ1DbEMJGa', 'karyawan', '2025-10-14 00:29:51'),
(101, 'can', 'can@gmail.com', '$2y$10$m0a5k.OfiPEY.WSDpGLiX.fQU8iWLYAclyt5.l1ji6l83iA5U.Zza', 'karyawan', '2025-10-14 12:07:04'),
(103, 'maulana', 'maulana@gmail.com', '$2y$10$2q.NF8.RPVgCwrMWqzTVs.rG0Dj.2RQW46P04s6iFCVc68TkSec3.', 'karyawan', '2025-10-20 02:35:22'),
(105, 'mrx', 'mrx@gmail.com', '$2y$10$bedJd/qPbP0VCIXRy56LruUUcWKcqQJR3kVxM8/wmFhl.upXtSmza', 'karyawan', '2025-10-27 12:12:06');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `condition` enum('bagus','rusak') NOT NULL DEFAULT 'bagus'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `category_id`, `name`, `quantity`, `description`, `created_at`, `condition`) VALUES
(1, 2, 'laptop', 5, 'laptop', '2025-10-13 14:56:15', 'bagus'),
(2, 3, 'Dokumen', 5, 'aa', '2025-10-19 16:20:32', 'bagus'),
(3, 5, 'mobil', 5, 'mobil', '2025-10-20 02:35:59', 'bagus'),
(4, 2, 'proyektor', 5, 'proyektor', '2025-10-26 13:56:43', 'bagus');

-- --------------------------------------------------------

--
-- Table structure for table `loans`
--

CREATE TABLE `loans` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `status` enum('pending','approved','rejected','returned') DEFAULT 'pending',
  `requested_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `processed_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `loans`
--

INSERT INTO `loans` (`id`, `employee_id`, `item_id`, `quantity`, `status`, `requested_at`, `processed_at`) VALUES
(3, 101, 2, 3, 'returned', '2025-10-20 01:49:28', '2025-10-20 08:51:50'),
(5, 101, 1, 2, 'approved', '2025-10-25 08:50:49', '2025-10-26 21:39:34'),
(6, 100, 3, 2, 'pending', '2025-10-26 16:26:09', NULL),
(7, 100, 3, 2, 'pending', '2025-10-26 16:29:50', NULL),
(8, 100, 3, 1, 'pending', '2025-10-26 16:30:00', NULL),
(9, 100, 4, 1, 'returned', '2025-10-26 16:30:15', '2025-10-26 23:31:52'),
(10, 100, 2, 1, 'returned', '2025-10-26 16:30:50', '2025-10-26 23:35:36'),
(11, 100, 4, 2, 'approved', '2025-10-26 16:31:03', '2025-10-26 23:31:37'),
(12, 100, 4, 6, 'returned', '2025-10-26 16:31:16', '2025-10-26 23:42:11'),
(13, 100, 1, 2, 'pending', '2025-11-03 02:20:37', NULL),
(14, 100, 1, 1, 'pending', '2025-11-03 13:03:33', NULL),
(15, 100, 4, 5, 'pending', '2025-12-22 14:42:24', NULL),
(16, 105, 4, 5, 'approved', '2025-12-25 01:52:22', '2025-12-25 08:53:35');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `loans`
--
ALTER TABLE `loans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `item_id` (`item_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `loans`
--
ALTER TABLE `loans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `loans`
--
ALTER TABLE `loans`
  ADD CONSTRAINT `loans_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `loans_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
