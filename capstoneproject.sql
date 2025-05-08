-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 30, 2025 at 05:29 PM
-- Server version: 8.3.0
-- PHP Version: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

USE `capstone`;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `capstoneproject`
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
(1, 'wewe', 'wewe');

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
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `scores`
--

INSERT INTO `scores` (`ScoreID`, `StudentID`, `Score`, `GameMode`, `TimeTaken`, `DateSubmitted`) VALUES
(20, 1, 0, 'mixed_calculation', '00:00:05', '2025-04-15'),
(53, 1, 0, 'mixed_calculation', '00:00:08', '2025-03-13'),
(75, 1, 0, 'conversion', '00:00:04', '2025-04-26'),
(77, 1, 1, 'conversion', '00:00:08', '2025-03-13'),
(78, 1, 0, 'conversion', '00:00:04', '2025-04-28'),
(79, 1, 3, 'conversion', '00:00:19', '2025-03-24'),
(80, 1, 0, 'conversion', '00:00:03', '2025-04-28'),
(81, 1, 4, 'conversion', '00:03:50', '2025-03-12'),
(82, 1, 0, 'basic_calculation', '00:00:46', '2025-04-28'),
(83, 1, 9, 'mixed_calculation', '00:05:19', '2025-03-19'),
(84, 9, 3, 'conversion', '00:02:50', '2025-04-28'),
(85, 9, 7, 'basic_calculation', '00:02:41', '2025-03-19'),
(86, 9, 0, 'mixed_calculation', '00:00:42', '2025-04-28'),
(87, 10, 5, 'conversion', '00:02:05', '2025-03-13'),
(88, 10, 19, 'basic_calculation', '00:05:41', '2025-04-28'),
(89, 10, 6, 'mixed_calculation', '00:02:58', '2025-03-19'),
(90, 11, 1, 'conversion', '00:00:24', '2025-04-28'),
(91, 11, 48, 'basic_calculation', '00:16:47', '2025-03-11'),
(92, 11, 0, 'mixed_calculation', '00:00:16', '2025-04-28'),
(93, 12, 1, 'conversion', '00:00:08', '2025-03-04'),
(94, 12, 2, 'basic_calculation', '00:00:15', '2025-04-28'),
(95, 12, 1, 'mixed_calculation', '00:00:11', '2025-03-19'),
(96, 13, 1, 'basic_calculation', '00:00:10', '2025-04-28'),
(97, 13, 1, 'mixed_calculation', '00:00:21', '2025-03-29'),
(98, 13, 0, 'conversion', '00:00:03', '2025-04-28'),
(99, 14, 0, 'conversion', '00:00:03', '2025-04-28'),
(100, 14, 0, 'basic_calculation', '00:00:05', '2025-04-28'),
(101, 14, 0, 'mixed_calculation', '00:00:05', '2025-04-28'),
(102, 15, 0, 'conversion', '00:00:04', '2025-04-28'),
(103, 15, 1, 'basic_calculation', '00:00:11', '2025-04-28'),
(104, 15, 1, 'mixed_calculation', '00:00:11', '2025-04-28'),
(105, 16, 1, 'conversion', '00:00:08', '2025-04-28'),
(106, 16, 4, 'basic_calculation', '00:00:26', '2025-04-28'),
(107, 16, 0, 'mixed_calculation', '00:00:05', '2025-04-28'),
(108, 17, 0, 'conversion', '00:00:04', '2025-04-28'),
(109, 17, 0, 'basic_calculation', '00:00:05', '2025-04-28'),
(110, 17, 0, 'mixed_calculation', '00:00:05', '2025-04-28'),
(111, 18, 1, 'conversion', '00:00:08', '2025-04-28'),
(112, 18, 3, 'basic_calculation', '00:00:21', '2025-04-28'),
(113, 18, 0, 'mixed_calculation', '00:00:05', '2025-04-28'),
(114, 19, 8, 'conversion', '00:00:37', '2025-04-28'),
(115, 19, 5, 'basic_calculation', '00:00:32', '2025-04-28'),
(116, 19, 0, 'mixed_calculation', '00:00:05', '2025-04-28'),
(117, 20, 2, 'conversion', '00:00:12', '2025-04-28'),
(118, 20, 4, 'basic_calculation', '00:00:26', '2025-04-28'),
(119, 20, 2, 'mixed_calculation', '00:00:16', '2025-04-28'),
(120, 23, 1, 'conversion', '00:00:08', '2025-04-28'),
(121, 23, 2, 'basic_calculation', '00:00:15', '2025-04-28'),
(122, 23, 0, 'mixed_calculation', '00:00:05', '2025-04-28'),
(123, 24, 2, 'conversion', '00:00:12', '2025-04-28'),
(124, 24, 0, 'basic_calculation', '00:00:05', '2025-04-28'),
(125, 24, 3, 'mixed_calculation', '00:00:22', '2025-04-28'),
(126, 25, 2, 'conversion', '00:00:12', '2025-04-28'),
(127, 25, 4, 'basic_calculation', '00:00:26', '2025-04-28'),
(128, 25, 3, 'mixed_calculation', '00:00:22', '2025-04-28'),
(129, 9, 0, 'mixed_calculation', '00:00:05', '2025-04-28'),
(130, 1, 1, 'basic_calculation', '00:00:10', '2025-04-28'),
(131, 1, 0, 'basic_calculation', '00:00:05', '2025-04-28'),
(132, 1, 1, 'basic_calculation', '00:00:10', '2025-04-28'),
(133, 1, 0, 'basic_calculation', '00:00:06', '2025-04-28'),
(134, 1, 5, 'basic_calculation', '00:00:32', '2025-04-28'),
(135, 1, 4, 'basic_calculation', '00:00:26', '2025-04-28');

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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`StudentID`, `Username`, `Email`, `Password`, `DateReg`, `TutorialStat`, `BanStatus`, `AdminID`) VALUES
(1, 'wewe', 'wewe@gmail.com', '$2b$12$XHKS5mPCuLNsTbxK2QFZYe2mLOr2VRHequlYpwGiwVk.05tLh5nY.', '0000-00-00', 1, 0, 1),
(2, 'qweqwe', 'qweqwe@gmail.com', '$2b$12$4aD9XtRi.gMn7zRF8Ou5BO4n8j/7w0qdSEgGm/R0RhwhfBGbAwdu.', '0000-00-00', 0, 1, 1),
(3, 'hello', 'asdfgh@sdfghj.DSFGHJ', '$2b$12$wU/Ap8uC0n/.9Lz/wDD21.TPugqTt0.wzJg4s1hiwX2pXmuCTKHPO', '0000-00-00', 0, 0, 1),
(8, 'qweqweqwe', 'qweqwe@qwe.qweqwe', '$2b$12$xDZwm7J4gxgYgV5UxoNlx.F3Dgyj6d3xhkp6sGA4gwGQhw5vq0o5.', '0000-00-00', 0, 0, 1),
(9, 'asdasd', 'asd@asdasd.asdasd', '$2b$12$AgTHU0JjfJvJmaRzvYPQiObSrWJ5l0QPt4BpyWXpSvouw0wLhkIN6', '0000-00-00', 0, 0, 1),
(10, 'asdasdasd', 'asd@asd.asd', '$2b$12$555TQfDdai21QPmZITfIp.Kl.KUD/ufKlWKgP9gFM8nrp1FLSpdj6', '0000-00-00', 0, 0, 1),
(11, 'asdf', 'asdf@asdf.asdf', '$2b$12$.aX4RWQ75/uU2rvWZ0Z7PeE0ES6ROjVRHjynQR2B5O.oB47ibhkCO', '0000-00-00', 0, 0, 1),
(12, 'zxc', 'zxc@zxc.zxc', '$2b$12$gF.U5T6HsEahJpibIBjKq.quU.d23X.f64kJGlHJ2UOAcKE1mCCDC', '0000-00-00', 0, 0, 1),
(13, 'sdf', 'sdf@sdf.sdf', '$2b$12$TJ1F3yigxSHTvD0B/DkNf./y8k6f4rK4btm.HHKMmk4A28IRu5S6K', '0000-00-00', 0, 0, 1),
(14, 'dfg', 'dfg@dfg.dfg', '$2b$12$mf0cAsj6FgyGw5KPA/.64.hcZTaAs4GYgCcCZEbpyfD2/w1lP/dSG', '0000-00-00', 0, 0, 1),
(15, 'fgh', 'fgh@fgh.fgh', '$2b$12$tYu7OEc8Ar6l7uMI/3wOnux5eV1a6B4yUw0i/0a8jPF2h26GynGYW', '0000-00-00', 0, 0, 1),
(16, 'rty', 'rty@rty.rty', '$2b$12$nOuqIFJt0Pl7G8/rcGqeH.2AFY7H710b0YB2G.oxp0sp.PO9H7lB.', '0000-00-00', 0, 0, 1),
(17, 'jkl', 'jlk@jlk.jkl', '$2b$12$YI5TG/MSxBFAaYTThndxEe08.W3TjPrs41LjfWn2lwJIXLIzTe3Gi', '0000-00-00', 0, 0, 1),
(18, 'ghj', 'ghj@ghj.ghj', '$2b$12$Bwm/5iXl1AZvR7P/AMr7hOiLNeHRkLJw2TDKSNl265KracvaT98RC', '0000-00-00', 0, 0, 1),
(19, 'cvb', 'cvb@cvb.cvb', '$2b$12$d17/3k3Nkf.ZW1xhfQpoA.a1W0cwdpqzyTJBmrCT1uLpLJpGHXDYG', '0000-00-00', 0, 0, 1),
(20, 'bnm', 'bnm@bnm.bnm', '$2b$12$xAplzoowILMplBV9HIleV.Xpl6Z0XOqRXp26GnTEnyypSqmV8NXNu', '0000-00-00', 0, 0, 1),
(21, 'qweqweqweqwe', 'qweqwee@qweqew.qweqew', '$2b$12$hKXMIdAhRYvTh0U5G8kFDeY.Qk8YONUWUvs9N.dzHe.igwTM5E/Me', '0000-00-00', 0, 0, 1),
(22, 'asdasdasdasd', 'asdasd@asdasdasd.asdasd', '$2b$12$VIKPT9YjSN4//KPPHaSDLuaYV5yMkG5C0t0ojF.Htj4zL3HzlDqq6', '0000-00-00', 0, 0, 1),
(23, 'asdghjkl', 'asdfghjkl@lkj.lkj', '$2b$12$VOq7W53NSs6zahH.6X0g7.j91QgZ3L15r28dw3tLO0AlKzgkcmLVi', '0000-00-00', 0, 0, 1),
(24, ' rgn', 'rgn@rgn.rgn', '$2b$12$7P6tRVKHGXb9Ovos461BnuNDBnMZ7Kl82wd5z/PY.ZkprwiYq53IC', '0000-00-00', 0, 0, 1),
(25, 'asdfghkl', 'lkjhgfdsa@asdg.asd', '$2b$12$4vY2xh3qP5GJyl7AYk1AbOjWxWN2Qag5pdP3/M7qfJYCNAaOrzDR.', '2025-04-26', 0, 0, 1),
(26, 'wewe1', 'hello@gmial.com', '$2b$12$y2xWBfZokx5GcSxNisDGCOSBeiKi7k7mnHSntSuI7kOY/oh4jFr3a', '2025-04-26', 0, 0, 1);

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
