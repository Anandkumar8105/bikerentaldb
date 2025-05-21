-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8088:8088
-- Generation Time: May 21, 2025 at 05:25 PM
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
-- Database: `bikerentaldb`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `username`, `password`, `email`) VALUES
(1, 'admin', 'adminpass', 'admin@example.com');

-- --------------------------------------------------------

--
-- Table structure for table `assignedto`
--

CREATE TABLE `assignedto` (
  `rental_id` int(11) NOT NULL,
  `bike_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `assignedto`
--

INSERT INTO `assignedto` (`rental_id`, `bike_id`) VALUES
(1, 2),
(1, 3),
(2, 3),
(12, 1),
(13, 1),
(14, 2);

-- --------------------------------------------------------

--
-- Table structure for table `bikes`
--

CREATE TABLE `bikes` (
  `bike_id` int(11) NOT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `model` varchar(100) NOT NULL,
  `brand` varchar(100) NOT NULL,
  `type` enum('Scooter','Motorbike','Sports Bike') NOT NULL,
  `rent_per_hour` decimal(10,2) NOT NULL,
  `availability` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bikes`
--

INSERT INTO `bikes` (`bike_id`, `admin_id`, `model`, `brand`, `type`, `rent_per_hour`, `availability`) VALUES
(1, 1, 'Activa 6G', 'Honda', 'Scooter', 50.00, 1),
(2, 1, 'Pulsar 220F', 'Bajaj', 'Motorbike', 100.00, 1),
(3, 1, 'KTM Duke 390', 'KTM', 'Sports Bike', 200.00, 1),
(4, 1, 'hgndhn', 'hdjhnhn', 'Scooter', 100.00, 1),
(5, 1, 'honda', 'hunub', 'Sports Bike', 199.00, 1);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `name`, `email`, `phone`, `password`) VALUES
(1, 'John Doe', 'john@example.com', '9876543210', 'pass123'),
(2, 'Jane Smith', 'jane@example.com', '9876543211', 'pass456'),
(4, 'Anand Kumar', 'anandpkumar@gmail.com', '1234567896', '$2y$10$JOHfaEWIHG6vy3YECw/feei599.EpSsD3LCd0anaChDMNmajV15sW'),
(5, 'chinmay', 'chinmay@gmail.com', '9929883002', '$2y$10$dOTfTbAOLDhC3k6bsPxklu/tBIbSMCy.PiQs3IUf6yaDXsnbIIaMq');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_status` enum('Pending','Completed','Failed') DEFAULT 'Pending',
  `payment_method` enum('Offline','Online') NOT NULL,
  `payment_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `amount`, `payment_status`, `payment_method`, `payment_date`) VALUES
(1, 800.00, 'Pending', 'Online', '2025-03-14 18:06:24'),
(2, 300.00, 'Completed', 'Offline', '2025-03-14 18:06:24'),
(3, 3600.00, 'Completed', 'Online', '2025-03-15 17:50:03'),
(4, 3600.00, 'Completed', 'Online', '2025-03-15 17:51:48'),
(5, 0.00, 'Pending', '', '2025-03-15 17:57:19'),
(6, 24000.00, 'Completed', 'Online', '2025-03-15 17:57:41'),
(7, 0.00, 'Pending', '', '2025-03-15 20:57:03'),
(8, 6000.00, 'Completed', 'Online', '2025-03-15 20:57:30'),
(9, 0.00, 'Pending', '', '2025-03-15 22:18:02'),
(10, 2400.00, 'Completed', 'Online', '2025-03-15 22:18:27'),
(11, 0.00, 'Pending', '', '2025-03-17 11:54:41'),
(12, 0.00, 'Pending', '', '2025-03-17 11:54:43'),
(13, 0.00, 'Pending', '', '2025-04-02 14:35:48'),
(14, 18000.00, 'Completed', 'Online', '2025-04-02 14:36:30'),
(15, 0.00, 'Pending', '', '2025-04-02 14:43:09'),
(16, 0.00, 'Pending', '', '2025-04-02 14:43:11'),
(17, 12000.00, 'Completed', 'Online', '2025-04-02 14:51:57');

-- --------------------------------------------------------

--
-- Table structure for table `rentals`
--

CREATE TABLE `rentals` (
  `rental_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `payment_id` int(11) DEFAULT NULL,
  `pickup_date` datetime NOT NULL,
  `drop_date` datetime NOT NULL,
  `total_cost` decimal(10,2) DEFAULT NULL,
  `status` enum('Pending','Ongoing','Completed') DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rentals`
--

INSERT INTO `rentals` (`rental_id`, `customer_id`, `admin_id`, `payment_id`, `pickup_date`, `drop_date`, `total_cost`, `status`) VALUES
(1, 1, 1, 1, '2025-03-16 10:00:00', '2025-03-17 18:00:00', 400.00, 'Ongoing'),
(2, 1, 1, 1, '2025-03-17 12:00:00', '2025-03-18 20:00:00', 400.00, 'Ongoing'),
(12, 4, 1, 14, '2025-04-02 00:00:00', '2025-04-17 00:00:00', 18000.00, 'Completed'),
(13, 4, 1, 15, '2025-04-02 00:00:00', '2025-04-16 00:00:00', 16800.00, 'Ongoing'),
(14, 5, 1, 17, '2025-04-02 00:00:00', '2025-04-07 00:00:00', 12000.00, 'Completed');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `assignedto`
--
ALTER TABLE `assignedto`
  ADD PRIMARY KEY (`rental_id`,`bike_id`),
  ADD KEY `bike_id` (`bike_id`);

--
-- Indexes for table `bikes`
--
ALTER TABLE `bikes`
  ADD PRIMARY KEY (`bike_id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `rentals`
--
ALTER TABLE `rentals`
  ADD PRIMARY KEY (`rental_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `admin_id` (`admin_id`),
  ADD KEY `payment_id` (`payment_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bikes`
--
ALTER TABLE `bikes`
  MODIFY `bike_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `rentals`
--
ALTER TABLE `rentals`
  MODIFY `rental_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assignedto`
--
ALTER TABLE `assignedto`
  ADD CONSTRAINT `assignedto_ibfk_1` FOREIGN KEY (`rental_id`) REFERENCES `rentals` (`rental_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `assignedto_ibfk_2` FOREIGN KEY (`bike_id`) REFERENCES `bikes` (`bike_id`) ON DELETE CASCADE;

--
-- Constraints for table `bikes`
--
ALTER TABLE `bikes`
  ADD CONSTRAINT `bikes_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`) ON DELETE SET NULL;

--
-- Constraints for table `rentals`
--
ALTER TABLE `rentals`
  ADD CONSTRAINT `rentals_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `rentals_ibfk_2` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `rentals_ibfk_3` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`payment_id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
