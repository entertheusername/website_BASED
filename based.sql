-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 08, 2025 at 10:06 PM
-- Server version: 8.3.0
-- PHP Version: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `based`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
CREATE TABLE IF NOT EXISTS `admins` (
  `AdminID` int NOT NULL AUTO_INCREMENT,
  `Username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Password` varchar(255) NOT NULL,
  PRIMARY KEY (`AdminID`),
  UNIQUE KEY `Adminname` (`Username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`AdminID`, `Username`, `Password`) VALUES
(1, 'Admin123', 'Admin123');

-- --------------------------------------------------------

--
-- Table structure for table `scores`
--

DROP TABLE IF EXISTS `scores`;
CREATE TABLE IF NOT EXISTS `scores` (
  `ScoreID` int NOT NULL AUTO_INCREMENT,
  `StudentID` int NOT NULL,
  `Score` int NOT NULL,
  `GameMode` varchar(255) NOT NULL,
  `TimeTaken` varchar(255) NOT NULL,
  `DateSubmitted` date NOT NULL,
  PRIMARY KEY (`ScoreID`),
  KEY `StudentID` (`StudentID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `scores`
--

INSERT INTO `scores` (`ScoreID`, `StudentID`, `Score`, `GameMode`, `TimeTaken`, `DateSubmitted`) VALUES
(1, 1, 7, 'conversion', '00:00:42', '2025-04-11'),
(2, 1, 16, 'conversion', '00:01:38', '2025-04-11'),
(3, 1, 21, 'conversion', '00:01:59', '2025-04-11'),
(4, 2, 9, 'conversion', '00:02:07', '2025-04-13'),
(5, 2, 15, 'conversion', '00:02:52', '2025-04-13'),
(6, 1, 24, 'basic_calculation', '00:04:04', '2025-04-14'),
(7, 1, 13, 'mixed_calculation', '00:03:41', '2025-04-14'),
(8, 3, 9, 'mixed_calculation', '00:06:54', '2025-04-14'),
(9, 2, 7, 'basic_calculation', '00:01:45', '2025-04-15'),
(10, 2, 3, 'mixed_calculation', '00:02:21', '2025-04-15'),
(11, 3, 37, 'conversion', '00:10:26', '2025-04-15'),
(12, 4, 13, 'conversion', '00:02:09', '2025-04-16'),
(13, 4, 18, 'conversion', '00:03:21', '2025-04-16'),
(14, 4, 26, 'conversion', '00:06:51', '2025-04-16'),
(15, 4, 25, 'conversion', '00:06:28', '2025-04-16'),
(16, 5, 9, 'basic_calculation', '00:02:17', '2025-04-17'),
(17, 5, 12, 'conversion', '00:02:58', '2025-04-17'),
(18, 5, 4, 'mixed_calculation', '00:01:13', '2025-04-18'),
(19, 6, 11, 'mixed_calculation', '00:03:16', '2025-04-19'),
(20, 6, 19, 'conversion', '00:03:59', '2025-04-19'),
(21, 7, 23, 'conversion', '00:04:43', '2025-04-19'),
(22, 6, 15, 'basic_calculation', '00:03:38', '2025-04-20'),
(23, 7, 14, 'basic_calculation', '00:03:02', '2025-04-20'),
(24, 7, 8, 'mixed_calculation', '00:02:02', '2025-04-21'),
(25, 8, 12, 'conversion', '00:02:32', '2025-04-21'),
(26, 8, 24, 'conversion', '00:04:09', '2025-04-21'),
(27, 8, 9, 'basic_calculation', '00:01:58', '2025-04-21'),
(28, 8, 31, 'conversion', '00:05:01', '2025-04-21'),
(29, 9, 14, 'mixed_calculation', '00:03:23', '2025-04-22'),
(30, 10, 26, 'conversion', '00:04:27', '2025-04-23'),
(31, 10, 14, 'conversion', '00:02:56', '2025-04-23'),
(32, 11, 23, 'basic_calculation', '00:03:57', '2025-04-23'),
(33, 12, 36, 'conversion', '00:12:01', '2025-04-25'),
(34, 11, 41, 'conversion', '00:12:57', '2025-04-25'),
(35, 11, 8, 'mixed_calculation', '00:01:59', '2025-04-25'),
(36, 12, 19, 'mixed_calculation', '00:06:43', '2025-04-26'),
(37, 13, 11, 'conversion', '00:02:45', '2025-04-25'),
(38, 13, 25, 'conversion', '00:03:52', '2025-04-26'),
(39, 5, 21, 'basic_calculation', '00:03:12', '2025-04-27'),
(40, 14, 15, 'mixed_calculation', '00:04:11', '2025-04-28'),
(41, 14, 10, 'basic_calculation', '00:03:05', '2025-04-28'),
(42, 3, 13, 'mixed_calculation', '00:04:21', '2025-04-29'),
(43, 15, 9, 'mixed_calculation', '00:06:31', '2025-04-29'),
(44, 15, 27, 'conversion', '00:03:58', '2025-04-30'),
(45, 16, 15, 'conversion', '00:02:49', '2025-04-30'),
(46, 15, 31, 'conversion', '00:05:01', '2025-04-30'),
(47, 4, 29, 'conversion', '00:07:25', '2025-05-01'),
(48, 17, 21, 'conversion', '00:04:57', '2025-05-01'),
(49, 17, 13, 'basic_calculation', '00:03:39', '2025-05-01'),
(50, 9, 12, 'conversion', '00:02:57', '2025-05-02'),
(51, 9, 4, 'mixed_calculation', '00:01:26', '2025-05-02'),
(52, 17, 8, 'mixed_calculation', '00:02:16', '2025-05-03'),
(53, 17, 19, 'conversion', '00:04:21', '2025-05-03'),
(54, 18, 23, 'conversion', '00:04:35', '2025-05-03'),
(55, 18, 15, 'basic_calculation', '00:03:28', '2025-05-04'),
(56, 18, 18, 'basic_calculation', '00:04:22', '2025-05-04'),
(57, 19, 9, 'mixed_calculation', '00:02:48', '2025-05-04'),
(58, 18, 24, 'conversion', '00:05:04', '2025-05-04'),
(59, 19, 20, 'conversion', '00:03:29', '2025-05-05'),
(60, 19, 11, 'basic_calculation', '00:02:47', '2025-05-05'),
(61, 20, 16, 'conversion', '00:03:51', '2025-05-05'),
(62, 20, 17, 'mixed_calculation', '00:06:12', '2025-05-05'),
(63, 20, 14, 'mixed_calculation', '00:05:41', '2025-05-06'),
(64, 19, 24, 'conversion', '00:04:13', '2025-05-06'),
(65, 11, 25, 'basic_calculation', '00:06:34', '2025-05-06'),
(66, 11, 32, 'conversion', '00:09:56', '2025-05-07'),
(67, 20, 28, 'conversion', '00:08:49', '2025-05-07'),
(68, 13, 8, 'mixed_calculation', '00:02:12', '2025-05-07'),
(69, 15, 6, 'mixed_calculation', '00:04:43', '2025-05-08'),
(70, 20, 5, 'basic_calculation', '00:01:12', '2025-05-09');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
CREATE TABLE IF NOT EXISTS `students` (
  `StudentID` int NOT NULL AUTO_INCREMENT,
  `Username` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `DateReg` date NOT NULL,
  `TutorialStat` tinyint(1) NOT NULL,
  `BanStatus` tinyint(1) NOT NULL,
  `AdminID` int NOT NULL,
  PRIMARY KEY (`StudentID`),
  UNIQUE KEY `Username` (`Username`),
  UNIQUE KEY `Email` (`Email`),
  KEY `AdminID` (`AdminID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`StudentID`, `Username`, `Email`, `Password`, `DateReg`, `TutorialStat`, `BanStatus`, `AdminID`) VALUES
(1, 'Player1', 'Player1@gmail.com', '$2b$12$nJlFXIAxLYQz6IzWtgph6eF2KpqJddytzKBncVm9hD6tjTbBXaUbu', '2025-04-11', 1, 0, 1),
(2, 'Player2', 'Player2@gmail.com', '$2b$12$k4mhdV0DQlYw1LdaxTPl2ONnDTAMkPAHN59wKn09D7IFhFEED8aHi', '2025-04-11', 1, 0, 1),
(3, 'Player3', 'Player3@gmail.com', '$2b$12$N90QSv5WcYcjoTMSnQsLGeEZtPBeALg12w/Up.UvSZw4G1jjH.Hvm', '2025-04-14', 1, 0, 1),
(4, 'Player4', 'Player4@gmail.com', '$2b$12$3rvzCCNJoM5OnmSZl0OW0eh9Vk5Og0x/RO5ruRdaiNkBd2zPBqBPa', '2025-04-16', 1, 0, 1),
(5, 'Player5', 'Player5@gmail.com', '$2b$12$TOAqV4pTw7w1W3pSubSMgeQZCa6BkzUUp3Cu8LSoDx0UnpTu4lS/G', '2025-04-17', 0, 0, 1),
(6, 'Player6', 'Player6@gmail.com', '$2b$12$B25/HWyG7O/SzE/fG.JLV.2jqvGuvFJ/hB.jBvlaZc9GeRfj2HL6a', '2025-04-19', 0, 0, 1),
(7, 'Player7', 'Player7@gmail.com', '$2b$12$dBm8eF6RpDEfaPAtDbijIeQuPYxVKHFTz8heMPp7lh9YgJpmFxAzS', '2025-04-19', 1, 1, 1),
(8, 'Player8', 'Player8@gmail.com', '$2b$12$cgKK8p1ioLmU4dXmZ64qF.J7JmqD.jua8.V5H1MzDJp6JMFIkL9ey', '2025-04-21', 1, 0, 1),
(9, 'Player9', 'Player9@gmail.com', '$2b$12$W/zFJ1TbrMOmI88JpJjXeOlFxTyF99nHmTiCnEjwzN0xKam6cAJbC', '2025-04-22', 0, 0, 1),
(10, 'Player10', 'Player10@gmail.com', '$2b$12$LGbFAgHwYtGJklxhDvzWqeeRBtdD2ReS39MqGK9Ypve9haVnwmJdq', '2025-04-23', 1, 0, 1),
(11, 'Player11', 'Player11@gmail.com', '$2b$12$BpoWHEHw91T5B.8xOHonT.7zYC84SVQTfB/2Vqyktj8jdv8sR8N56', '2025-04-23', 1, 0, 1),
(12, 'Player12', 'Player12@gmail.com', '$2b$12$QapBQ/zlLSKJeImn7pGUg.BBTq23wafC2QUA0ZOgA/ngGThl47bjS', '2025-04-24', 0, 0, 1),
(13, 'Player13', 'Player13@gmaiil.com', '$2b$12$z1ztU.PRvdTgxOjYTkPyuumta7gSKg3A/PAfCbRh7NRkMU8.HRWqy', '2025-04-25', 1, 0, 1),
(14, 'Player14', 'Player14@gmail.com', '$2b$12$Q08gy/s27rqVyqk4b9afYu3SnY15HnFEsRSOzJHCgt5ScPu6EHUVi', '2025-04-28', 0, 0, 1),
(15, 'Player15', 'Player15@gmail.com', '$2b$12$3gieq/MyrH3wcc2jSBCh0e4ZC3YepCRxOSfg6nwHIYerxFOa//cIC', '2025-04-29', 0, 1, 1),
(16, 'Player16', 'Player16@gmail.com', '$2b$12$qXdDHzF0jbhFm/u/OmIwfeOgYNklIlS4Li5z/5yEycEXS3tQHlTZG', '2025-04-30', 1, 0, 1),
(17, 'Player17', 'Player17@gmail.com', '$2b$12$0io/hXRAKOXV/FY.SlQ7du45owycQvsPtmvwy7JeJnDdB7djVh/YC', '2025-05-01', 1, 0, 1),
(18, 'Player18', 'Player18@gmail.com', '$2b$12$YPbpK24zw0GtIOSwV1yyIOinCdGaURrclazoO/CGKsmwTfOwsIXDO', '2025-05-01', 0, 1, 1),
(19, 'Player19', 'Player19@gmail.com', '$2b$12$fwcZXNt.X0CKtqGtV7L.aeGyNSMrRb3Nb9A0SAuyVbc0vn28FBhD6', '2025-05-02', 1, 0, 1),
(20, 'Player20', 'Player20@gmail.com', '$2b$12$v1oSEL9aCn9urG7vGm6aDev5SIeivNpxC6J6NiCV8IlzdRUc6wyxu', '2025-05-02', 1, 0, 1);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `scores`
--
ALTER TABLE `scores`
  ADD CONSTRAINT `scores_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `students` (`StudentID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`AdminID`) REFERENCES `admins` (`AdminID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
