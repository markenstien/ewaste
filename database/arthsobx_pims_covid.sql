-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 14, 2022 at 10:18 PM
-- Server version: 10.3.32-MariaDB-log-cll-lve
-- PHP Version: 7.3.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `arthsobx_pims_covid`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `id` int(10) NOT NULL,
  `block_house_number` varchar(100) DEFAULT NULL,
  `street` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `barangay` varchar(100) DEFAULT NULL,
  `zip` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`id`, `block_house_number`, `street`, `city`, `barangay`, `zip`, `created_at`) VALUES
(1, '1100 ', ' East Ave', 'Quezon City Metro Manila', 'Diliman', '331', '2021-12-26 18:53:04'),
(17, '2c119 Laffayete', 'Building C', 'Paranque', 'Donbosco', '117', '2022-01-02 15:22:21'),
(18, '123 block-3', 'EastAvenue', 'Quezon City', 'Vluna', '331', '2022-01-02 15:30:19'),
(19, '123 block-5', 'EastAvenue', 'Quezon City', 'Kamuning', '331', '2022-01-02 15:34:08'),
(20, ' 286 ', 'Blumentritt Rd', 'Manila', 'Sta. Cruz', '1014', '2022-01-03 06:52:33'),
(21, '1336', 'Gana comp.', 'QC', 'Unang Sigaw', '1106', '2022-01-03 06:55:55'),
(22, '777', 'Main Street', 'Makati', 'Bel Air', '1200', '2022-01-03 08:27:16'),
(23, '205', 'Adelita Chioco Street', 'ParaÃ±aque', 'BF Homes Subdivision', '1718', '2022-01-03 08:39:27'),
(24, '37', 'Pio Street', 'Valenzuela', 'Marulas', '1010', '2022-01-03 08:44:37'),
(25, '37', 'Pio St.', 'Valenzuela', 'Marulas', '1014', '2022-01-03 09:28:52'),
(26, 'Lot 5 #21', 'Fisher St', 'Quezon City', 'Culiat', '1128', '2022-01-03 13:01:49'),
(27, 'Lot 5 #23 ', 'Fisher St', 'Quezon City', 'Culiat', '1128', '2022-01-03 13:05:09'),
(28, 'Lot 10 #25', 'Fisher St', 'Quezon City', 'Culiat', '1128', '2022-01-03 13:15:16'),
(29, 'Lot 8 #24 ', 'Culiat', 'Quezon City', 'Fisher St', '1128', '2022-01-03 13:19:12'),
(30, 'Block 8 17', 'Fisher', 'Quezon City', 'Culiat', '1128', '2022-01-03 13:53:14'),
(31, 'Lot 5 # 9', 'Fisher St', 'Quezon City', 'Culiat', '1128', '2022-01-03 14:12:25'),
(32, '# 279', 'E. Rodriguez Sr. Avenue', 'Quezon City', 'Culiat', '1112', '2022-01-04 15:26:58'),
(33, '1216', 'Blessed St.', 'Quezon City', 'Brgy. Culiat', '1016', '2022-01-04 15:30:44'),
(34, 'Lot 3 Blk 7', 'Teacher\'s St.', 'Quezon City', 'Matandang Balara', '1112', '2022-01-04 16:01:59'),
(35, '222', 'Kanlungan Street', 'Quezon City', 'Matandang Balara', '1145', '2022-01-04 16:25:36'),
(36, '204', 'P. Burgos Street', 'Quezon City', 'Culiat', '1211', '2022-01-05 04:52:28'),
(37, '777', 'E. Rodriguez Street', 'Quezon City', 'Culiat', '1200', '2022-01-05 07:11:39'),
(38, '345', 'Mahinahon Street', 'Quezon City', 'Culiat', '1112', '2022-01-06 16:04:34'),
(39, 'Block 8 17', 'Fisher St', 'Quezon City', 'Culiat', '1128', '2022-01-07 02:21:33'),
(40, 'Block 10 lot 5', 'Circumferential Rd 5', 'Quezon City', 'Culiat', '1200', '2022-01-11 07:29:10'),
(41, 'Block 10 lot 8', 'Fisher', 'Quezon City', 'Culiat', '1200', '2022-01-11 07:32:15'),
(42, 'Block 10 lot 8', 'Fisher', 'Quezon City', 'Culiat', '1200', '2022-01-12 01:48:23'),
(43, 'Block 8 17', 'Fisher St', 'Quezon City', 'Culiat', '1128', '2022-01-12 07:31:58'),
(44, '35', 'Kaingin Rd', 'Quezon City', 'Matandang Balara', '1106', '2022-01-13 08:37:19'),
(45, '1336', 'Via Hilario', 'City', 'Culiat', '1128', '2022-01-16 16:51:58'),
(46, '1336', 'Allan Bean', 'Quezon City', 'Culiat', '1128', '2022-01-16 17:23:04'),
(47, '777', 'Charity St', 'Quezon City', 'Culiat', '1128', '2022-01-16 17:46:24'),
(48, '777', 'Circumferential Rd 5', 'Quezon City', 'culiat', '1128', '2022-01-16 18:04:48'),
(49, 'Block 10 Lot 8', 'Casanova Dr Ext', 'Quezon City', 'culiat', '1128', '2022-01-18 12:05:28'),
(50, 'Block 8 17', 'Cenacle Dr', 'Quezon City', 'culiat', '1128', '2022-01-18 12:33:02'),
(51, 'Block 10 Lot 8', 'Cassanova Dr', 'Quezon City', 'culiat', '1128', '2022-01-18 13:07:18'),
(52, 'Block 10 Lot 8', 'Charity St', 'Quezon City', 'culiat', '1128', '2022-01-18 13:19:32'),
(53, 'Block 10 Lot 8', 'Casanova Dr Ext', 'Quezon City', 'culiat', '1128', '2022-01-18 13:33:36');

-- --------------------------------------------------------

--
-- Table structure for table `attachments`
--

CREATE TABLE `attachments` (
  `id` int(10) NOT NULL,
  `label` varchar(100) DEFAULT NULL,
  `filename` varchar(100) DEFAULT NULL,
  `file_type` varchar(100) DEFAULT NULL,
  `display_name` varchar(100) DEFAULT NULL,
  `search_key` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `global_key` varchar(100) DEFAULT NULL,
  `global_id` int(10) DEFAULT NULL,
  `path` text DEFAULT NULL,
  `url` text DEFAULT NULL,
  `full_path` text DEFAULT NULL,
  `full_url` text DEFAULT NULL,
  `is_visible` tinyint(1) DEFAULT NULL,
  `created_by` int(10) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `classifications`
--

CREATE TABLE `classifications` (
  `id` int(10) NOT NULL,
  `reference` varchar(100) DEFAULT NULL,
  `severity_name` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `classification_items`
--

CREATE TABLE `classification_items` (
  `id` int(10) NOT NULL,
  `classification_id` int(10) DEFAULT NULL,
  `label` varchar(100) DEFAULT NULL,
  `compare_to` text DEFAULT NULL,
  `comparison` varchar(50) DEFAULT NULL,
  `points` int(10) DEFAULT NULL,
  `start_number` decimal(10,2) DEFAULT NULL,
  `end_number` decimal(10,2) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `order_num` smallint(6) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `classification_items`
--

INSERT INTO `classification_items` (`id`, `classification_id`, `label`, `compare_to`, `comparison`, `points`, `start_number`, `end_number`, `description`, `order_num`, `created_at`) VALUES
(11, NULL, 'Respiratory Rate', '16', '>=', 2, 12.00, 16.00, 'Normal: 12-16bpm', 2, '2022-01-03 16:15:15'),
(19, NULL, 'Oxygen Level', '95', 'between', 3, 1.00, 94.00, 'Normal: 95-100', 2, '2022-01-05 03:58:42'),
(21, NULL, 'Pulse Rate', '', 'between', 1, 1.00, 59.00, 'Normal: 60-100', 3, '2022-01-05 06:50:01'),
(23, NULL, 'Fever', '39', 'not in', 1, 0.00, 0.00, 'fever', 5, '2022-01-20 12:45:58');

-- --------------------------------------------------------

--
-- Table structure for table `classification_remarks`
--

CREATE TABLE `classification_remarks` (
  `id` int(10) NOT NULL,
  `points` int(10) NOT NULL,
  `remarks` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `color` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `classification_remarks`
--

INSERT INTO `classification_remarks` (`id`, `points`, `remarks`, `description`, `color`, `created_at`) VALUES
(5, 3, 'Mild', 'Covid Mild Case', 'info', '2022-01-18 12:51:50'),
(8, 4, 'Moderate', 'Moderate Case', 'warning', '2022-01-18 12:52:01'),
(12, 7, 'Severe', 'Severe Case', 'danger', '2022-01-18 12:52:10');

-- --------------------------------------------------------

--
-- Table structure for table `classification_respondents`
--

CREATE TABLE `classification_respondents` (
  `id` int(10) NOT NULL,
  `record_id` int(10) DEFAULT NULL,
  `items` text DEFAULT NULL COMMENT 'json-encoded',
  `remarks` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `points` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `classification_respondents`
--

INSERT INTO `classification_respondents` (`id`, `record_id`, `items`, `remarks`, `created_at`, `points`) VALUES
(1, 1, '[{\"id\":\"1\",\"label\":\"Respiratory Rate\",\"value\":\"20\"},{\"id\":\"5\",\"label\":\"Pneunomia\",\"value\":\"Yes\"},{\"id\":\"6\",\"label\":\"Oxygen Level\",\"value\":\"94\"}]', 'Mild', '2022-01-02 15:26:46', NULL),
(2, 2, '[{\"id\":\"1\",\"label\":\"Respiratory Rate\",\"value\":\"23\"},{\"id\":\"5\",\"label\":\"Pneunomia\",\"value\":\"No\"},{\"id\":\"6\",\"label\":\"Oxygen Level\",\"value\":\"80\"}]', 'Moderate', '2022-01-03 06:57:57', NULL),
(3, 4, '[{\"id\":\"1\",\"label\":\"Respiratory Rate\",\"value\":\"23\"},{\"id\":\"5\",\"label\":\"Pneunomia\",\"value\":\"yes\"},{\"id\":\"6\",\"label\":\"Oxygen Level\",\"value\":\"50\"}]', 'Mild', '2022-01-03 09:29:55', NULL),
(4, 7, '[{\"id\":\"1\",\"label\":\"Respiratory Rate\",\"value\":\"40\"},{\"id\":\"5\",\"label\":\"Pneunomia\",\"value\":\"No\"},{\"id\":\"6\",\"label\":\"Oxygen Level\",\"value\":\"97\"}]', 'Moderate', '2022-01-03 13:55:26', NULL),
(5, 8, '[{\"id\":\"1\",\"label\":\"Respiratory Rate\",\"value\":\"40\"},{\"id\":\"5\",\"label\":\"Pneunomia\",\"value\":\"No\"},{\"id\":\"6\",\"label\":\"Oxygen Level\",\"value\":\"98\"}]', 'Moderate', '2022-01-03 14:13:49', NULL),
(6, 9, '[{\"id\":\"9\",\"label\":\"Oxygen Level\",\"value\":\"94\"},{\"id\":\"10\",\"label\":\"Fever\",\"value\":\"YES\"}]', 'Moderate', '2022-01-03 15:45:08', NULL),
(7, 10, '[{\"id\":\"11\",\"label\":\"Respiratory Rate\",\"value\":\"12\"},{\"id\":\"13\",\"label\":\"Pulse Rate\",\"value\":\"50\"},{\"id\":\"15\",\"label\":\"Oxygen Level\",\"value\":\"98\"}]', 'Moderate', '2022-01-03 16:45:42', NULL),
(8, 11, '[{\"id\":\"11\",\"label\":\"Respiratory Rate\",\"value\":\"20\"},{\"id\":\"13\",\"label\":\"Pulse Rate\",\"value\":\"80\"},{\"id\":\"15\",\"label\":\"Oxygen Level\",\"value\":\"95\"}]', 'Severe', '2022-01-03 16:54:02', NULL),
(9, 12, '[{\"id\":\"11\",\"label\":\"Respiratory Rate\",\"value\":\"12\"},{\"id\":\"13\",\"label\":\"Pulse Rate\",\"value\":\"61\"},{\"id\":\"15\",\"label\":\"Oxygen Level\",\"value\":\"95\"}]', 'Severe', '2022-01-04 06:30:48', NULL),
(10, 13, '[{\"id\":\"11\",\"label\":\"Respiratory Rate\",\"value\":\"14\"},{\"id\":\"13\",\"label\":\"Pulse Rate\",\"value\":\"80\"},{\"id\":\"15\",\"label\":\"Oxygen Level\",\"value\":\"98\"}]', 'Mild', '2022-01-04 06:44:52', NULL),
(11, 14, '[{\"id\":\"11\",\"label\":\"Respiratory Rate\",\"value\":\"30\"},{\"id\":\"13\",\"label\":\"Pulse Rate\",\"value\":\"60\"},{\"id\":\"15\",\"label\":\"Oxygen Level\",\"value\":\"92\"}]', 'Mild', '2022-01-04 06:49:44', NULL),
(12, 15, '[{\"id\":\"11\",\"label\":\"Respiratory Rate\",\"value\":\"12\"},{\"id\":\"13\",\"label\":\"Pulse Rate\",\"value\":\"80\"},{\"id\":\"15\",\"label\":\"Oxygen Level\",\"value\":\"98\"}]', 'Mildwew', '2022-01-04 06:55:53', NULL),
(13, 18, '[{\"id\":\"11\",\"label\":\"Respiratory Rate\",\"value\":\"12\"},{\"id\":\"13\",\"label\":\"Pulse Rate\",\"value\":\"61\"},{\"id\":\"15\",\"label\":\"Oxygen Level\",\"value\":\"95\"}]', 'Severe', '2022-01-04 13:22:09', NULL),
(14, 19, '[{\"id\":\"11\",\"label\":\"Respiratory Rate\",\"value\":\"12\"},{\"id\":\"13\",\"label\":\"Pulse Rate\",\"value\":\"61\"},{\"id\":\"15\",\"label\":\"Oxygen Level\",\"value\":\"95\"}]', 'Moderate', '2022-01-04 13:25:46', NULL),
(15, 20, '[{\"id\":\"11\",\"label\":\"Respiratory Rate\",\"value\":\"12\"},{\"id\":\"13\",\"label\":\"Pulse Rate\",\"value\":\"59\"},{\"id\":\"15\",\"label\":\"Oxygen Level\",\"value\":\"95\"}]', 'Moderate', '2022-01-04 13:30:38', NULL),
(16, 21, '[{\"id\":\"11\",\"label\":\"Respiratory Rate\",\"value\":\"30\"},{\"id\":\"13\",\"label\":\"Pulse Rate\",\"value\":\"80\"},{\"id\":\"15\",\"label\":\"Oxygen Level\",\"value\":\"95\"},{\"id\":\"18\",\"label\":\"Possible Case of ARDS\",\"value\":\"Yes\"}]', 'Critical', '2022-01-04 15:35:44', NULL),
(17, 22, '[{\"id\":\"11\",\"label\":\"Respiratory Rate\",\"value\":\"30\"},{\"id\":\"13\",\"label\":\"Pulse Rate\",\"value\":\"50\"},{\"id\":\"15\",\"label\":\"Oxygen Level\",\"value\":\"90\"},{\"id\":\"18\",\"label\":\"Possible Case of ARDS\",\"value\":\"No\"}]', 'Severe', '2022-01-04 16:05:33', NULL),
(18, 23, '[{\"id\":\"11\",\"label\":\"Respiratory Rate\",\"value\":\"18\"},{\"id\":\"13\",\"label\":\"Pulse Rate\",\"value\":\"50\"},{\"id\":\"15\",\"label\":\"Oxygen Level\",\"value\":\"90\"},{\"id\":\"18\",\"label\":\"Possible Case of ARDS\",\"value\":\"No\"}]', 'Severe', '2022-01-04 16:28:34', NULL),
(19, 24, '[{\"id\":\"11\",\"label\":\"Respiratory Rate\",\"value\":\"15\"},{\"id\":\"13\",\"label\":\"Pulse Rate\",\"value\":\"90\"},{\"id\":\"19\",\"label\":\"Oxygen Level\",\"value\":\"97\"}]', 'Mild', '2022-01-05 04:02:30', 0),
(20, 27, '[{\"id\":\"11\",\"label\":\"Respiratory Rate\",\"value\":\"30\"},{\"id\":\"13\",\"label\":\"Pulse Rate\",\"value\":\"100\"},{\"id\":\"19\",\"label\":\"Oxygen Level\",\"value\":\"91\"},{\"id\":\"20\",\"label\":\"Possible Case of ARDS\",\"value\":\"Yes\"}]', 'Mild', '2022-01-05 04:32:41', 11),
(21, 28, '[{\"id\":\"11\",\"label\":\"Respiratory Rate\",\"value\":\"16\"},{\"id\":\"19\",\"label\":\"Oxygen Level\",\"value\":\"2\"}]', 'Mild', '2022-01-05 04:54:18', 5),
(22, 30, '[{\"id\":\"11\",\"label\":\"Respiratory Rate\",\"value\":\"15\"},{\"id\":\"19\",\"label\":\"Oxygen Level\",\"value\":\"100\"}]', 'Mild', '2022-01-05 06:10:31', 0),
(23, 32, '[{\"id\":\"11\",\"label\":\"Respiratory Rate\",\"value\":\"30\"},{\"id\":\"19\",\"label\":\"Oxygen Level\",\"value\":\"92\"},{\"id\":\"21\",\"label\":\"Pulse Rate\",\"value\":\"120\"}]', 'Severe', '2022-01-05 07:14:33', 5),
(24, 33, '[{\"id\":\"11\",\"label\":\"Respiratory Rate\",\"value\":\"15\"},{\"id\":\"19\",\"label\":\"Oxygen Level\",\"value\":\"96\"},{\"id\":\"21\",\"label\":\"Pulse Rate\",\"value\":\"65\"}]', 'Mild', '2022-01-05 10:05:36', 0),
(25, 34, '[{\"id\":\"11\",\"label\":\"Respiratory Rate\",\"value\":\"13\"},{\"id\":\"19\",\"label\":\"Oxygen Level\",\"value\":\"95\"},{\"id\":\"21\",\"label\":\"Pulse Rate\",\"value\":\"60\"}]', 'Mild', '2022-01-06 16:05:22', 0),
(26, 35, '[{\"id\":\"11\",\"label\":\"Respiratory Rate\",\"value\":\"30\"},{\"id\":\"19\",\"label\":\"Oxygen Level\",\"value\":\"80\"},{\"id\":\"21\",\"label\":\"Pulse Rate\",\"value\":\"95\"}]', 'Severe', '2022-01-07 06:30:55', 5),
(27, 36, '[{\"id\":\"11\",\"label\":\"Respiratory Rate\",\"value\":\"23\"},{\"id\":\"19\",\"label\":\"Oxygen Level\",\"value\":\"90\"},{\"id\":\"21\",\"label\":\"Pulse Rate\",\"value\":\"50\"}]', 'Severe', '2022-01-09 12:46:09', 6),
(28, 37, '[{\"id\":\"11\",\"label\":\"Respiratory Rate\",\"value\":\"11\"},{\"id\":\"19\",\"label\":\"Oxygen Level\",\"value\":\"94\"},{\"id\":\"21\",\"label\":\"Pulse Rate\",\"value\":\"55\"}]', 'Severe', '2022-01-11 07:33:32', 4),
(29, 38, '[{\"id\":\"11\",\"label\":\"Respiratory Rate\",\"value\":\"11\"},{\"id\":\"19\",\"label\":\"Oxygen Level\",\"value\":\"94\"},{\"id\":\"21\",\"label\":\"Pulse Rate\",\"value\":\"55\"}]', 'Severe', '2022-01-12 01:49:56', 4),
(30, 39, '[{\"id\":\"11\",\"label\":\"Respiratory Rate\",\"value\":\"11\"},{\"id\":\"19\",\"label\":\"Oxygen Level\",\"value\":\"94\"},{\"id\":\"21\",\"label\":\"Pulse Rate\",\"value\":\"55\"}]', 'Severe', '2022-01-12 07:33:31', 4),
(31, 40, '[{\"id\":\"11\",\"label\":\"Respiratory Rate\",\"value\":\"13\"},{\"id\":\"19\",\"label\":\"Oxygen Level\",\"value\":\"95\"},{\"id\":\"21\",\"label\":\"Pulse Rate\",\"value\":\"60\"}]', 'Mild', '2022-01-13 08:38:55', 0),
(32, 41, '[{\"id\":\"11\",\"label\":\"Respiratory Rate\",\"value\":\"12\"},{\"id\":\"19\",\"label\":\"Oxygen Level\",\"value\":\"90\"},{\"id\":\"21\",\"label\":\"Pulse Rate\",\"value\":\"60\"}]', 'Moderate', '2022-01-16 16:53:44', 3),
(33, 42, '[{\"id\":\"11\",\"label\":\"Respiratory Rate\",\"value\":\"18\"},{\"id\":\"19\",\"label\":\"Oxygen Level\",\"value\":\"90\"},{\"id\":\"21\",\"label\":\"Pulse Rate\",\"value\":\"50\"}]', 'Severe', '2022-01-16 17:25:29', 6),
(34, 43, '[{\"id\":\"11\",\"label\":\"Respiratory Rate\",\"value\":\"15\"},{\"id\":\"19\",\"label\":\"Oxygen Level\",\"value\":\"95\"},{\"id\":\"21\",\"label\":\"Pulse Rate\",\"value\":\"65\"}]', 'Mild', '2022-01-16 17:49:00', 0),
(35, 44, '[{\"id\":\"11\",\"label\":\"Respiratory Rate\",\"value\":\"15\"},{\"id\":\"19\",\"label\":\"Oxygen Level\",\"value\":\"100\"},{\"id\":\"21\",\"label\":\"Pulse Rate\",\"value\":\"100\"}]', 'Mild', '2022-01-16 18:05:32', 0),
(36, 45, '[{\"id\":\"11\",\"label\":\"Respiratory Rate\",\"value\":\"18\"},{\"id\":\"19\",\"label\":\"Oxygen Level\",\"value\":\"92\"},{\"id\":\"21\",\"label\":\"Pulse Rate\",\"value\":\"50\"}]', 'Severe', '2022-01-18 12:08:08', 6),
(37, 46, '[{\"id\":\"11\",\"label\":\"Respiratory Rate\",\"value\":\"12\"},{\"id\":\"19\",\"label\":\"Oxygen Level\",\"value\":\"95\"},{\"id\":\"21\",\"label\":\"Pulse Rate\",\"value\":\"50\"}]', 'Mild', '2022-01-18 12:35:13', 1),
(38, 49, '[{\"id\":\"11\",\"label\":\"Respiratory Rate\",\"value\":\"13\"},{\"id\":\"19\",\"label\":\"Oxygen Level\",\"value\":\"94\"},{\"id\":\"21\",\"label\":\"Pulse Rate\",\"value\":\"60\"},{\"id\":\"22\",\"label\":\"Fever\",\"value\":\"39\"}]', 'Moderate', '2022-01-18 13:35:42', 4),
(39, 50, '[{\"id\":\"11\",\"label\":\"Respiratory Rate\",\"value\":\"14\"},{\"id\":\"19\",\"label\":\"Oxygen Level\",\"value\":\"Yes\"},{\"id\":\"21\",\"label\":\"Pulse Rate\",\"value\":\"No\"},{\"id\":\"23\",\"label\":\"Fever\",\"value\":\"NO\"}]', 'Mild', '2022-01-20 15:54:17', 1),
(40, 51, '[{\"id\":\"11\",\"label\":\"Respiratory Rate\",\"value\":\"20\"},{\"id\":\"19\",\"label\":\"Oxygen Level\",\"value\":\"90\"},{\"id\":\"21\",\"label\":\"Pulse Rate\",\"value\":\"50\"},{\"id\":\"23\",\"label\":\"Fever\",\"value\":\"39\"}]', 'Severe', '2022-01-21 10:28:06', 6);

-- --------------------------------------------------------

--
-- Table structure for table `deployments`
--

CREATE TABLE `deployments` (
  `id` int(10) NOT NULL,
  `reference` varchar(100) DEFAULT NULL,
  `type` enum('hospital','home-quarantine') DEFAULT NULL,
  `record_id` int(10) DEFAULT NULL,
  `patient_id` int(10) DEFAULT NULL,
  `hospital_id` int(10) DEFAULT NULL,
  `deployment_date` date DEFAULT NULL,
  `attending_medical_personel_id` int(10) DEFAULT NULL,
  `is_released` tinyint(1) DEFAULT 0,
  `release_remarks` enum('recovered','deceased') DEFAULT NULL,
  `created_by` int(10) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `record_status` enum('completed','on-going','invalid','pending') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `deployments`
--

INSERT INTO `deployments` (`id`, `reference`, `type`, `record_id`, `patient_id`, `hospital_id`, `deployment_date`, `attending_medical_personel_id`, `is_released`, `release_remarks`, `created_by`, `notes`, `record_status`, `created_at`) VALUES
(20, 'HOSP-13494692', 'hospital', 51, 86, 1, '2022-01-21', 53, 0, NULL, 2, 'Severe case of infection', 'on-going', '2022-01-21 10:28:46');

-- --------------------------------------------------------

--
-- Table structure for table `forms`
--

CREATE TABLE `forms` (
  `id` int(10) NOT NULL,
  `reference` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `order_num` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `forms`
--

INSERT INTO `forms` (`id`, `reference`, `name`, `description`, `created_at`, `order_num`) VALUES
(3, 'FRM-974649', 'Health Declaration Form', 'Are you Experiencing or did you have any of the following in the last 14 days (Ikaw ba ay may nararanasan o nakaranas ng mga sumusunod na sintomas sa nakaraang 14 na araw?)', '2021-12-23 21:08:15', NULL),
(4, 'FRM-628843', 'Vital Signs', 'Fill patient Vital signs details', '2021-12-23 21:10:40', NULL),
(10, 'FRM-818787', 'Travel ', 'Place that you travel in the past weeks', '2022-01-18 13:15:04', 1),
(11, 'FRM-656739', 'Travel History', 'Place you travel', '2022-01-20 12:41:27', 2);

-- --------------------------------------------------------

--
-- Table structure for table `form_items`
--

CREATE TABLE `form_items` (
  `id` int(10) NOT NULL,
  `form_id` int(10) DEFAULT NULL,
  `label` varchar(100) NOT NULL,
  `type` enum('date','dropdown','short answer','long answer') DEFAULT 'short answer',
  `default_value` text DEFAULT NULL,
  `item_description` text DEFAULT NULL,
  `options` text DEFAULT NULL,
  `attributes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `form_items`
--

INSERT INTO `form_items` (`id`, `form_id`, `label`, `type`, `default_value`, `item_description`, `options`, `attributes`, `created_at`) VALUES
(5, 4, 'Temperature (celcius)', 'short answer', '', 'Input Temperature(Normal Temperature: 36.1-37.2)', '[\"\"]', NULL, '2021-12-23 21:12:31'),
(6, 4, 'Blood Pressure', 'short answer', '', 'Input blood pressure (Normal Blood Pressure: 120/80)', '[\"\"]', NULL, '2021-12-23 21:13:16'),
(7, 4, 'Height (inches)', 'short answer', '', 'Input Height of the Patient', '[\"5\",\"8\",\"7\",\"6\",\"4\"]', NULL, '2021-12-26 15:46:11'),
(8, 4, 'Weight (kilos)', 'short answer', '', 'Input Weight of the Patient', '[\"\"]', NULL, '2021-12-26 15:46:57'),
(9, 3, 'Cough and/or Colds', 'dropdown', '', 'Ubo at/o Sipon', '[\"Yes\",\"No\"]', NULL, '2021-12-29 16:15:52'),
(10, 3, 'Body Pains', 'dropdown', '', 'Pananakit ng Katawan', '[\"Yes\",\"No\"]', NULL, '2021-12-29 16:16:33'),
(11, 3, 'Sore Throat', 'dropdown', '', 'Pananakit o Pamamaga ng Lalamunan', '[\"Yes\",\"No\"]', NULL, '2021-12-29 16:17:48'),
(12, 3, 'Fatigue/Tiredness', 'dropdown', '', 'Pagkapagod', '[\"Yes\",\"No\"]', NULL, '2021-12-29 16:18:37'),
(13, 3, 'Headache', 'dropdown', '', 'Pananakit ng ulo', '[\"Yes\",\"No\"]', NULL, '2021-12-29 16:19:53'),
(14, 3, 'Diarrhea', 'dropdown', '', 'Pagtatae', '[\"Yes\",\"No\"]', NULL, '2021-12-29 16:20:24'),
(15, 3, 'Loss of taste or smell', 'dropdown', '', 'Nawalan ng panlasa o pang-amoy', '[\"Yes\",\"No\"]', NULL, '2021-12-29 16:21:04'),
(16, 3, 'Difficulty of breathing', 'dropdown', '', 'Pagkahapo o hirap sa paghinga', '[\"Yes\",\"No\"]', NULL, '2021-12-29 16:21:44'),
(22, 10, 'Place you travel', 'dropdown', '', 'place you travel in 14 days', '[\"Yes\",\"No\"]', NULL, '2022-01-18 13:17:48'),
(23, 11, 'Temperature', 'dropdown', '', 'Temperature of the patient', '[\"39\",\"36\"]', NULL, '2022-01-20 12:42:51');

-- --------------------------------------------------------

--
-- Table structure for table `form_respondents`
--

CREATE TABLE `form_respondents` (
  `id` int(10) NOT NULL,
  `reference` varchar(100) DEFAULT NULL,
  `form_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `form_detail` text DEFAULT NULL COMMENT 'json encoded',
  `items` text DEFAULT NULL COMMENT 'json encode answers',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `form_respondents`
--

INSERT INTO `form_respondents` (`id`, `reference`, `form_id`, `user_id`, `form_detail`, `items`, `created_at`, `updated_at`) VALUES
(1, 'RES-71365298', 4, 2, '{\"title\":\"Vital Signs\",\"description\":\"Fill patient Vital signs details\"}', '[{\"name\":\"Temperature (celcius)\",\"input_id\":\"5\",\"answer\":\"36.1\"},{\"name\":\"Blood Pressure\",\"input_id\":\"6\",\"answer\":\"120\\/80\"},{\"name\":\"Height (inches)\",\"input_id\":\"7\",\"answer\":\"40\"},{\"name\":\"Weight (kilos)\",\"input_id\":\"8\",\"answer\":\"50\"}]', '2022-01-02 15:24:02', '2022-01-02 15:24:02'),
(2, 'RES-21368137', 3, 2, '{\"title\":\"Health Declaration Form\",\"description\":\"Are you Experiencing or did you have any of the following in the last 14 days (Ikaw ba ay may nararanasan o nakaranas ng mga sumusunod na sintomas sa nakaraang 14 na araw?)\"}', '[{\"name\":\"Fever\",\"input_id\":\"4\",\"answer\":\"Yes\"},{\"name\":\"Cough and\\/or Colds\",\"input_id\":\"9\",\"answer\":\"Yes\"},{\"name\":\"Body Pains\",\"input_id\":\"10\",\"answer\":\"No\"},{\"name\":\"Sore Throat\",\"input_id\":\"11\",\"answer\":\"Yes\"},{\"name\":\"Fatigue\\/Tiredness\",\"input_id\":\"12\",\"answer\":\"Yes\"},{\"name\":\"Headache\",\"input_id\":\"13\",\"answer\":\"No\"},{\"name\":\"Diarrhea\",\"input_id\":\"14\",\"answer\":\"Yes\"},{\"name\":\"Loss of taste or smell\",\"input_id\":\"15\",\"answer\":\"Yes\"},{\"name\":\"Difficulty of breathing\",\"input_id\":\"16\",\"answer\":\"No\"}]', '2022-01-02 15:24:18', '2022-01-02 15:24:18'),
(3, 'RES-21872162', 4, 2, '{\"title\":\"Vital Signs\",\"description\":\"Fill patient Vital signs details\"}', '[{\"name\":\"Temperature (celcius)\",\"input_id\":\"5\",\"answer\":\"37\"},{\"name\":\"Blood Pressure\",\"input_id\":\"6\",\"answer\":\"120\\/80\"},{\"name\":\"Height (inches)\",\"input_id\":\"7\",\"answer\":\"5\'4\"},{\"name\":\"Weight (kilos)\",\"input_id\":\"8\",\"answer\":\"50\"}]', '2022-01-03 06:57:02', '2022-01-03 06:57:02'),
(4, 'RES-49245497', 3, 2, '{\"title\":\"Health Declaration Form\",\"description\":\"Are you Experiencing or did you have any of the following in the last 14 days (Ikaw ba ay may nararanasan o nakaranas ng mga sumusunod na sintomas sa nakaraang 14 na araw?)\"}', '[{\"name\":\"Fever\",\"input_id\":\"4\",\"answer\":\"No\"},{\"name\":\"Cough and\\/or Colds\",\"input_id\":\"9\",\"answer\":\"Yes\"},{\"name\":\"Body Pains\",\"input_id\":\"10\",\"answer\":\"No\"},{\"name\":\"Sore Throat\",\"input_id\":\"11\",\"answer\":\"No\"},{\"name\":\"Fatigue\\/Tiredness\",\"input_id\":\"12\",\"answer\":\"No\"},{\"name\":\"Headache\",\"input_id\":\"13\",\"answer\":\"No\"},{\"name\":\"Diarrhea\",\"input_id\":\"14\",\"answer\":\"No\"},{\"name\":\"Loss of taste or smell\",\"input_id\":\"15\",\"answer\":\"No\"},{\"name\":\"Difficulty of breathing\",\"input_id\":\"16\",\"answer\":\"No\"}]', '2022-01-03 06:57:23', '2022-01-03 06:57:23'),
(5, 'RES-12132129', 4, 2, '{\"title\":\"Vital Signs\",\"description\":\"Fill patient Vital signs details\"}', '[{\"name\":\"Temperature (celcius)\",\"input_id\":\"5\",\"answer\":\"39\"},{\"name\":\"Blood Pressure\",\"input_id\":\"6\",\"answer\":\"120\\/80\"},{\"name\":\"Height (inches)\",\"input_id\":\"7\",\"answer\":\"5\'4\"},{\"name\":\"Weight (kilos)\",\"input_id\":\"8\",\"answer\":\"50\"}]', '2022-01-03 09:29:12', '2022-01-03 09:29:12'),
(6, 'RES-98497187', 3, 2, '{\"title\":\"Health Declaration Form\",\"description\":\"Are you Experiencing or did you have any of the following in the last 14 days (Ikaw ba ay may nararanasan o nakaranas ng mga sumusunod na sintomas sa nakaraang 14 na araw?)\"}', '[{\"name\":\"Fever\",\"input_id\":\"4\",\"answer\":\"No\"},{\"name\":\"Cough and\\/or Colds\",\"input_id\":\"9\",\"answer\":\"No\"},{\"name\":\"Body Pains\",\"input_id\":\"10\",\"answer\":\"Yes\"},{\"name\":\"Sore Throat\",\"input_id\":\"11\",\"answer\":\"Yes\"},{\"name\":\"Fatigue\\/Tiredness\",\"input_id\":\"12\",\"answer\":\"Yes\"},{\"name\":\"Headache\",\"input_id\":\"13\",\"answer\":\"Yes\"},{\"name\":\"Diarrhea\",\"input_id\":\"14\",\"answer\":\"Yes\"},{\"name\":\"Loss of taste or smell\",\"input_id\":\"15\",\"answer\":\"Yes\"},{\"name\":\"Difficulty of breathing\",\"input_id\":\"16\",\"answer\":\"Yes\"}]', '2022-01-03 09:29:34', '2022-01-03 09:29:34'),
(7, 'RES-89376342', 4, 56, '{\"title\":\"Vital Signs\",\"description\":\"Fill patient Vital signs details\"}', '[{\"name\":\"Temperature (celcius)\",\"input_id\":\"5\",\"answer\":\"39\"},{\"name\":\"Blood Pressure\",\"input_id\":\"6\",\"answer\":\"120\\/80\"},{\"name\":\"Height (inches)\",\"input_id\":\"7\",\"answer\":\"170\"},{\"name\":\"Weight (kilos)\",\"input_id\":\"8\",\"answer\":\"55\"}]', '2022-01-03 13:05:50', '2022-01-03 13:05:50'),
(8, 'RES-41866689', 3, 56, '{\"title\":\"Health Declaration Form\",\"description\":\"Are you Experiencing or did you have any of the following in the last 14 days (Ikaw ba ay may nararanasan o nakaranas ng mga sumusunod na sintomas sa nakaraang 14 na araw?)\"}', '[{\"name\":\"Fever\",\"input_id\":\"4\",\"answer\":\"Yes\"},{\"name\":\"Cough and\\/or Colds\",\"input_id\":\"9\",\"answer\":\"Yes\"},{\"name\":\"Body Pains\",\"input_id\":\"10\",\"answer\":\"Yes\"},{\"name\":\"Sore Throat\",\"input_id\":\"11\",\"answer\":\"Yes\"},{\"name\":\"Fatigue\\/Tiredness\",\"input_id\":\"12\",\"answer\":\"Yes\"},{\"name\":\"Headache\",\"input_id\":\"13\",\"answer\":\"Yes\"},{\"name\":\"Diarrhea\",\"input_id\":\"14\",\"answer\":\"Yes\"},{\"name\":\"Loss of taste or smell\",\"input_id\":\"15\",\"answer\":\"Yes\"},{\"name\":\"Difficulty of breathing\",\"input_id\":\"16\",\"answer\":\"Yes\"}]', '2022-01-03 13:06:38', '2022-01-03 13:06:38'),
(9, 'RES-82576674', 4, 58, '{\"title\":\"Vital Signs\",\"description\":\"Fill patient Vital signs details\"}', '[{\"name\":\"Temperature (celcius)\",\"input_id\":\"5\",\"answer\":\"39\"},{\"name\":\"Blood Pressure\",\"input_id\":\"6\",\"answer\":\"120\\/80\"},{\"name\":\"Height (inches)\",\"input_id\":\"7\",\"answer\":\"170\"},{\"name\":\"Weight (kilos)\",\"input_id\":\"8\",\"answer\":\"55\"}]', '2022-01-03 13:53:48', '2022-01-03 13:53:48'),
(10, 'RES-28811879', 3, 58, '{\"title\":\"Health Declaration Form\",\"description\":\"Are you Experiencing or did you have any of the following in the last 14 days (Ikaw ba ay may nararanasan o nakaranas ng mga sumusunod na sintomas sa nakaraang 14 na araw?)\"}', '[{\"name\":\"Fever\",\"input_id\":\"4\",\"answer\":\"Yes\"},{\"name\":\"Cough and\\/or Colds\",\"input_id\":\"9\",\"answer\":\"Yes\"},{\"name\":\"Body Pains\",\"input_id\":\"10\",\"answer\":\"Yes\"},{\"name\":\"Sore Throat\",\"input_id\":\"11\",\"answer\":\"Yes\"},{\"name\":\"Fatigue\\/Tiredness\",\"input_id\":\"12\",\"answer\":\"Yes\"},{\"name\":\"Headache\",\"input_id\":\"13\",\"answer\":\"Yes\"},{\"name\":\"Diarrhea\",\"input_id\":\"14\",\"answer\":\"No\"},{\"name\":\"Loss of taste or smell\",\"input_id\":\"15\",\"answer\":\"Yes\"},{\"name\":\"Difficulty of breathing\",\"input_id\":\"16\",\"answer\":\"No\"}]', '2022-01-03 13:54:18', '2022-01-03 13:54:18'),
(11, 'RES-65416298', 4, 58, '{\"title\":\"Vital Signs\",\"description\":\"Fill patient Vital signs details\"}', '[{\"name\":\"Temperature (celcius)\",\"input_id\":\"5\",\"answer\":\"38\"},{\"name\":\"Blood Pressure\",\"input_id\":\"6\",\"answer\":\"120\\/80\"},{\"name\":\"Height (inches)\",\"input_id\":\"7\",\"answer\":\"175\"},{\"name\":\"Weight (kilos)\",\"input_id\":\"8\",\"answer\":\"65\"}]', '2022-01-03 14:12:55', '2022-01-03 14:12:55'),
(12, 'RES-94119399', 3, 58, '{\"title\":\"Health Declaration Form\",\"description\":\"Are you Experiencing or did you have any of the following in the last 14 days (Ikaw ba ay may nararanasan o nakaranas ng mga sumusunod na sintomas sa nakaraang 14 na araw?)\"}', '[{\"name\":\"Fever\",\"input_id\":\"4\",\"answer\":\"Yes\"},{\"name\":\"Cough and\\/or Colds\",\"input_id\":\"9\",\"answer\":\"Yes\"},{\"name\":\"Body Pains\",\"input_id\":\"10\",\"answer\":\"Yes\"},{\"name\":\"Sore Throat\",\"input_id\":\"11\",\"answer\":\"Yes\"},{\"name\":\"Fatigue\\/Tiredness\",\"input_id\":\"12\",\"answer\":\"Yes\"},{\"name\":\"Headache\",\"input_id\":\"13\",\"answer\":\"Yes\"},{\"name\":\"Diarrhea\",\"input_id\":\"14\",\"answer\":\"No\"},{\"name\":\"Loss of taste or smell\",\"input_id\":\"15\",\"answer\":\"No\"},{\"name\":\"Difficulty of breathing\",\"input_id\":\"16\",\"answer\":\"No\"}]', '2022-01-03 14:13:24', '2022-01-03 14:13:24'),
(13, 'RES-84349556', 4, 2, '{\"title\":\"Vital Signs\",\"description\":\"Fill patient Vital signs details\"}', '[{\"name\":\"Temperature (celcius)\",\"input_id\":\"5\",\"answer\":\"37\"},{\"name\":\"Blood Pressure\",\"input_id\":\"6\",\"answer\":\"120\\/80\"},{\"name\":\"Height (inches)\",\"input_id\":\"7\",\"answer\":\"5\'4\"},{\"name\":\"Weight (kilos)\",\"input_id\":\"8\",\"answer\":\"520\"}]', '2022-01-03 15:41:33', '2022-01-03 15:41:33'),
(14, 'RES-47978589', 3, 2, '{\"title\":\"Health Declaration Form\",\"description\":\"Are you Experiencing or did you have any of the following in the last 14 days (Ikaw ba ay may nararanasan o nakaranas ng mga sumusunod na sintomas sa nakaraang 14 na araw?)\"}', '[{\"name\":\"Fever\",\"input_id\":\"4\",\"answer\":\"No\"},{\"name\":\"Cough and\\/or Colds\",\"input_id\":\"9\",\"answer\":\"No\"},{\"name\":\"Body Pains\",\"input_id\":\"10\",\"answer\":\"No\"},{\"name\":\"Sore Throat\",\"input_id\":\"11\",\"answer\":\"No\"},{\"name\":\"Fatigue\\/Tiredness\",\"input_id\":\"12\",\"answer\":\"No\"},{\"name\":\"Headache\",\"input_id\":\"13\",\"answer\":\"No\"},{\"name\":\"Diarrhea\",\"input_id\":\"14\",\"answer\":\"No\"},{\"name\":\"Loss of taste or smell\",\"input_id\":\"15\",\"answer\":\"No\"},{\"name\":\"Difficulty of breathing\",\"input_id\":\"16\",\"answer\":\"No\"}]', '2022-01-03 15:41:56', '2022-01-03 15:41:56'),
(15, 'RES-25897866', 4, 2, '{\"title\":\"Vital Signs\",\"description\":\"Fill patient Vital signs details\"}', '[{\"name\":\"Temperature (celcius)\",\"input_id\":\"5\",\"answer\":\"37\"},{\"name\":\"Blood Pressure\",\"input_id\":\"6\",\"answer\":\"120\\/80\"},{\"name\":\"Height (inches)\",\"input_id\":\"7\",\"answer\":\"5\'4\"},{\"name\":\"Weight (kilos)\",\"input_id\":\"8\",\"answer\":\"50\"}]', '2022-01-03 16:34:43', '2022-01-03 16:34:43'),
(16, 'RES-51699911', 3, 2, '{\"title\":\"Health Declaration Form\",\"description\":\"Are you Experiencing or did you have any of the following in the last 14 days (Ikaw ba ay may nararanasan o nakaranas ng mga sumusunod na sintomas sa nakaraang 14 na araw?)\"}', '[{\"name\":\"Fever\",\"input_id\":\"4\",\"answer\":\"No\"},{\"name\":\"Cough and\\/or Colds\",\"input_id\":\"9\",\"answer\":\"Yes\"},{\"name\":\"Body Pains\",\"input_id\":\"10\",\"answer\":\"Yes\"},{\"name\":\"Sore Throat\",\"input_id\":\"11\",\"answer\":\"Yes\"},{\"name\":\"Fatigue\\/Tiredness\",\"input_id\":\"12\",\"answer\":\"No\"},{\"name\":\"Headache\",\"input_id\":\"13\",\"answer\":\"No\"},{\"name\":\"Diarrhea\",\"input_id\":\"14\",\"answer\":\"No\"},{\"name\":\"Loss of taste or smell\",\"input_id\":\"15\",\"answer\":\"No\"},{\"name\":\"Difficulty of breathing\",\"input_id\":\"16\",\"answer\":\"Yes\"}]', '2022-01-03 16:35:45', '2022-01-03 16:35:45'),
(17, 'RES-47312657', 4, 2, '{\"title\":\"Vital Signs\",\"description\":\"Fill patient Vital signs details\"}', '[{\"name\":\"Temperature (celcius)\",\"input_id\":\"5\",\"answer\":\"37\"},{\"name\":\"Blood Pressure\",\"input_id\":\"6\",\"answer\":\"120\\/80\"},{\"name\":\"Height (inches)\",\"input_id\":\"7\",\"answer\":\"5\'4\"},{\"name\":\"Weight (kilos)\",\"input_id\":\"8\",\"answer\":\"50\"}]', '2022-01-03 16:52:21', '2022-01-03 16:52:21'),
(18, 'RES-63557394', 3, 2, '{\"title\":\"Health Declaration Form\",\"description\":\"Are you Experiencing or did you have any of the following in the last 14 days (Ikaw ba ay may nararanasan o nakaranas ng mga sumusunod na sintomas sa nakaraang 14 na araw?)\"}', '[{\"name\":\"Fever\",\"input_id\":\"4\",\"answer\":\"No\"},{\"name\":\"Cough and\\/or Colds\",\"input_id\":\"9\",\"answer\":\"No\"},{\"name\":\"Body Pains\",\"input_id\":\"10\",\"answer\":\"No\"},{\"name\":\"Sore Throat\",\"input_id\":\"11\",\"answer\":\"No\"},{\"name\":\"Fatigue\\/Tiredness\",\"input_id\":\"12\",\"answer\":\"No\"},{\"name\":\"Headache\",\"input_id\":\"13\",\"answer\":\"No\"},{\"name\":\"Diarrhea\",\"input_id\":\"14\",\"answer\":\"No\"},{\"name\":\"Loss of taste or smell\",\"input_id\":\"15\",\"answer\":\"No\"},{\"name\":\"Difficulty of breathing\",\"input_id\":\"16\",\"answer\":\"No\"}]', '2022-01-03 16:52:37', '2022-01-03 16:52:37'),
(19, 'RES-73257463', 4, 2, '{\"title\":\"Vital Signs\",\"description\":\"Fill patient Vital signs details\"}', '[{\"name\":\"Temperature (celcius)\",\"input_id\":\"5\",\"answer\":\"37\"},{\"name\":\"Blood Pressure\",\"input_id\":\"6\",\"answer\":\"120\\/80\"},{\"name\":\"Height (inches)\",\"input_id\":\"7\",\"answer\":\"160\"},{\"name\":\"Weight (kilos)\",\"input_id\":\"8\",\"answer\":\"60\"}]', '2022-01-04 06:25:58', '2022-01-04 06:25:58'),
(20, 'RES-72551346', 3, 2, '{\"title\":\"Health Declaration Form\",\"description\":\"Are you Experiencing or did you have any of the following in the last 14 days (Ikaw ba ay may nararanasan o nakaranas ng mga sumusunod na sintomas sa nakaraang 14 na araw?)\"}', '[{\"name\":\"Fever\",\"input_id\":\"4\",\"answer\":\"No\"},{\"name\":\"Cough and\\/or Colds\",\"input_id\":\"9\",\"answer\":\"Yes\"},{\"name\":\"Body Pains\",\"input_id\":\"10\",\"answer\":\"No\"},{\"name\":\"Sore Throat\",\"input_id\":\"11\",\"answer\":\"Yes\"},{\"name\":\"Fatigue\\/Tiredness\",\"input_id\":\"12\",\"answer\":\"No\"},{\"name\":\"Headache\",\"input_id\":\"13\",\"answer\":\"Yes\"},{\"name\":\"Diarrhea\",\"input_id\":\"14\",\"answer\":\"No\"},{\"name\":\"Loss of taste or smell\",\"input_id\":\"15\",\"answer\":\"Yes\"},{\"name\":\"Difficulty of breathing\",\"input_id\":\"16\",\"answer\":\"No\"}]', '2022-01-04 06:29:13', '2022-01-04 06:29:13'),
(21, 'RES-53989261', 4, 2, '{\"title\":\"Vital Signs\",\"description\":\"Fill patient Vital signs details\"}', '[{\"name\":\"Temperature (celcius)\",\"input_id\":\"5\",\"answer\":\"37\"},{\"name\":\"Blood Pressure\",\"input_id\":\"6\",\"answer\":\"120\\/80\"},{\"name\":\"Height (inches)\",\"input_id\":\"7\",\"answer\":\"160\"},{\"name\":\"Weight (kilos)\",\"input_id\":\"8\",\"answer\":\"60\"}]', '2022-01-04 06:42:39', '2022-01-04 06:42:39'),
(22, 'RES-51217752', 3, 2, '{\"title\":\"Health Declaration Form\",\"description\":\"Are you Experiencing or did you have any of the following in the last 14 days (Ikaw ba ay may nararanasan o nakaranas ng mga sumusunod na sintomas sa nakaraang 14 na araw?)\"}', '[{\"name\":\"Fever\",\"input_id\":\"4\",\"answer\":\"No\"},{\"name\":\"Cough and\\/or Colds\",\"input_id\":\"9\",\"answer\":\"Yes\"},{\"name\":\"Body Pains\",\"input_id\":\"10\",\"answer\":\"No\"},{\"name\":\"Sore Throat\",\"input_id\":\"11\",\"answer\":\"Yes\"},{\"name\":\"Fatigue\\/Tiredness\",\"input_id\":\"12\",\"answer\":\"No\"},{\"name\":\"Headache\",\"input_id\":\"13\",\"answer\":\"Yes\"},{\"name\":\"Diarrhea\",\"input_id\":\"14\",\"answer\":\"No\"},{\"name\":\"Loss of taste or smell\",\"input_id\":\"15\",\"answer\":\"Yes\"},{\"name\":\"Difficulty of breathing\",\"input_id\":\"16\",\"answer\":\"No\"}]', '2022-01-04 06:43:22', '2022-01-04 06:43:22'),
(23, 'RES-51719297', 4, 2, '{\"title\":\"Vital Signs\",\"description\":\"Fill patient Vital signs details\"}', '[{\"name\":\"Temperature (celcius)\",\"input_id\":\"5\",\"answer\":\"37\"},{\"name\":\"Blood Pressure\",\"input_id\":\"6\",\"answer\":\"120\\/80\"},{\"name\":\"Height (inches)\",\"input_id\":\"7\",\"answer\":\"160\"},{\"name\":\"Weight (kilos)\",\"input_id\":\"8\",\"answer\":\"60\"}]', '2022-01-04 06:47:37', '2022-01-04 06:47:37'),
(24, 'RES-62725657', 3, 2, '{\"title\":\"Health Declaration Form\",\"description\":\"Are you Experiencing or did you have any of the following in the last 14 days (Ikaw ba ay may nararanasan o nakaranas ng mga sumusunod na sintomas sa nakaraang 14 na araw?)\"}', '[{\"name\":\"Fever\",\"input_id\":\"4\",\"answer\":\"Yes\"},{\"name\":\"Cough and\\/or Colds\",\"input_id\":\"9\",\"answer\":\"Yes\"},{\"name\":\"Body Pains\",\"input_id\":\"10\",\"answer\":\"Yes\"},{\"name\":\"Sore Throat\",\"input_id\":\"11\",\"answer\":\"Yes\"},{\"name\":\"Fatigue\\/Tiredness\",\"input_id\":\"12\",\"answer\":\"Yes\"},{\"name\":\"Headache\",\"input_id\":\"13\",\"answer\":\"Yes\"},{\"name\":\"Diarrhea\",\"input_id\":\"14\",\"answer\":\"Yes\"},{\"name\":\"Loss of taste or smell\",\"input_id\":\"15\",\"answer\":\"Yes\"},{\"name\":\"Difficulty of breathing\",\"input_id\":\"16\",\"answer\":\"Yes\"}]', '2022-01-04 06:47:58', '2022-01-04 06:47:58'),
(25, 'RES-66117468', 4, 2, '{\"title\":\"Vital Signs\",\"description\":\"Fill patient Vital signs details\"}', '[{\"name\":\"Temperature (celcius)\",\"input_id\":\"5\",\"answer\":\"37\"},{\"name\":\"Blood Pressure\",\"input_id\":\"6\",\"answer\":\"120\\/80\"},{\"name\":\"Height (inches)\",\"input_id\":\"7\",\"answer\":\"160\"},{\"name\":\"Weight (kilos)\",\"input_id\":\"8\",\"answer\":\"60\"}]', '2022-01-04 06:55:30', '2022-01-04 06:55:30'),
(26, 'RES-77889394', 3, 2, '{\"title\":\"Health Declaration Form\",\"description\":\"Are you Experiencing or did you have any of the following in the last 14 days (Ikaw ba ay may nararanasan o nakaranas ng mga sumusunod na sintomas sa nakaraang 14 na araw?)\"}', '[{\"name\":\"Fever\",\"input_id\":\"4\",\"answer\":\"Yes\"},{\"name\":\"Cough and\\/or Colds\",\"input_id\":\"9\",\"answer\":\"No\"},{\"name\":\"Body Pains\",\"input_id\":\"10\",\"answer\":\"Yes\"},{\"name\":\"Sore Throat\",\"input_id\":\"11\",\"answer\":\"No\"},{\"name\":\"Fatigue\\/Tiredness\",\"input_id\":\"12\",\"answer\":\"Yes\"},{\"name\":\"Headache\",\"input_id\":\"13\",\"answer\":\"No\"},{\"name\":\"Diarrhea\",\"input_id\":\"14\",\"answer\":\"Yes\"},{\"name\":\"Loss of taste or smell\",\"input_id\":\"15\",\"answer\":\"No\"},{\"name\":\"Difficulty of breathing\",\"input_id\":\"16\",\"answer\":\"Yes\"}]', '2022-01-04 06:55:44', '2022-01-04 06:55:44'),
(27, 'RES-55566271', 0, 2, '{\"title\":\"\",\"description\":\"\"}', 'null', '2022-01-04 13:18:03', '2022-01-04 13:18:03'),
(28, 'RES-97144411', 5, 2, '{\"title\":\"Sample form\",\"description\":\"sample form for demo\"}', '[{\"name\":\"Which city\\/cities did you traveled to for the last 14 days?\",\"input_id\":\"17\",\"answer\":\"QC\"}]', '2022-01-04 13:18:56', '2022-01-04 13:18:56'),
(29, 'RES-74115411', 0, 2, '{\"title\":\"\",\"description\":\"\"}', 'null', '2022-01-04 13:18:59', '2022-01-04 13:18:59'),
(30, 'RES-95782916', 0, 2, '{\"title\":\"\",\"description\":\"\"}', 'null', '2022-01-04 13:19:06', '2022-01-04 13:19:06'),
(31, 'RES-34674214', 4, 2, '{\"title\":\"Vital Signs\",\"description\":\"Fill patient Vital signs details\"}', '[{\"name\":\"Temperature (celcius)\",\"input_id\":\"5\",\"answer\":\"37\"},{\"name\":\"Blood Pressure\",\"input_id\":\"6\",\"answer\":\"120\\/80\"},{\"name\":\"Height (inches)\",\"input_id\":\"7\",\"answer\":\"160\"},{\"name\":\"Weight (kilos)\",\"input_id\":\"8\",\"answer\":\"60\"}]', '2022-01-04 13:20:07', '2022-01-04 13:20:07'),
(32, 'RES-85964155', 3, 2, '{\"title\":\"Health Declaration Form\",\"description\":\"Are you Experiencing or did you have any of the following in the last 14 days (Ikaw ba ay may nararanasan o nakaranas ng mga sumusunod na sintomas sa nakaraang 14 na araw?)\"}', '[{\"name\":\"Fever\",\"input_id\":\"4\",\"answer\":\"No\"},{\"name\":\"Cough and\\/or Colds\",\"input_id\":\"9\",\"answer\":\"Yes\"},{\"name\":\"Body Pains\",\"input_id\":\"10\",\"answer\":\"No\"},{\"name\":\"Sore Throat\",\"input_id\":\"11\",\"answer\":\"Yes\"},{\"name\":\"Fatigue\\/Tiredness\",\"input_id\":\"12\",\"answer\":\"No\"},{\"name\":\"Headache\",\"input_id\":\"13\",\"answer\":\"Yes\"},{\"name\":\"Diarrhea\",\"input_id\":\"14\",\"answer\":\"No\"},{\"name\":\"Loss of taste or smell\",\"input_id\":\"15\",\"answer\":\"Yes\"},{\"name\":\"Difficulty of breathing\",\"input_id\":\"16\",\"answer\":\"No\"}]', '2022-01-04 13:20:32', '2022-01-04 13:20:32'),
(33, 'RES-36552455', 4, 2, '{\"title\":\"Vital Signs\",\"description\":\"Fill patient Vital signs details\"}', '[{\"name\":\"Temperature (celcius)\",\"input_id\":\"5\",\"answer\":\"37\"},{\"name\":\"Blood Pressure\",\"input_id\":\"6\",\"answer\":\"120\\/80\"},{\"name\":\"Height (inches)\",\"input_id\":\"7\",\"answer\":\"160\"},{\"name\":\"Weight (kilos)\",\"input_id\":\"8\",\"answer\":\"60\"}]', '2022-01-04 13:25:11', '2022-01-04 13:25:11'),
(34, 'RES-72677474', 3, 2, '{\"title\":\"Health Declaration Form\",\"description\":\"Are you Experiencing or did you have any of the following in the last 14 days (Ikaw ba ay may nararanasan o nakaranas ng mga sumusunod na sintomas sa nakaraang 14 na araw?)\"}', '[{\"name\":\"Fever\",\"input_id\":\"4\",\"answer\":\"No\"},{\"name\":\"Cough and\\/or Colds\",\"input_id\":\"9\",\"answer\":\"Yes\"},{\"name\":\"Body Pains\",\"input_id\":\"10\",\"answer\":\"Yes\"},{\"name\":\"Sore Throat\",\"input_id\":\"11\",\"answer\":\"Yes\"},{\"name\":\"Fatigue\\/Tiredness\",\"input_id\":\"12\",\"answer\":\"No\"},{\"name\":\"Headache\",\"input_id\":\"13\",\"answer\":\"No\"},{\"name\":\"Diarrhea\",\"input_id\":\"14\",\"answer\":\"No\"},{\"name\":\"Loss of taste or smell\",\"input_id\":\"15\",\"answer\":\"No\"},{\"name\":\"Difficulty of breathing\",\"input_id\":\"16\",\"answer\":\"No\"}]', '2022-01-04 13:25:24', '2022-01-04 13:25:24'),
(35, 'RES-56215695', 4, 2, '{\"title\":\"Vital Signs\",\"description\":\"Fill patient Vital signs details\"}', '[{\"name\":\"Temperature (celcius)\",\"input_id\":\"5\",\"answer\":\"37\"},{\"name\":\"Blood Pressure\",\"input_id\":\"6\",\"answer\":\"120\\/80\"},{\"name\":\"Height (inches)\",\"input_id\":\"7\",\"answer\":\"160\"},{\"name\":\"Weight (kilos)\",\"input_id\":\"8\",\"answer\":\"60\"}]', '2022-01-04 13:29:25', '2022-01-04 13:29:25'),
(36, 'RES-62337178', 3, 2, '{\"title\":\"Health Declaration Form\",\"description\":\"Are you Experiencing or did you have any of the following in the last 14 days (Ikaw ba ay may nararanasan o nakaranas ng mga sumusunod na sintomas sa nakaraang 14 na araw?)\"}', '[{\"name\":\"Fever\",\"input_id\":\"4\",\"answer\":\"No\"},{\"name\":\"Cough and\\/or Colds\",\"input_id\":\"9\",\"answer\":\"No\"},{\"name\":\"Body Pains\",\"input_id\":\"10\",\"answer\":\"Yes\"},{\"name\":\"Sore Throat\",\"input_id\":\"11\",\"answer\":\"Yes\"},{\"name\":\"Fatigue\\/Tiredness\",\"input_id\":\"12\",\"answer\":\"Yes\"},{\"name\":\"Headache\",\"input_id\":\"13\",\"answer\":\"Yes\"},{\"name\":\"Diarrhea\",\"input_id\":\"14\",\"answer\":\"Yes\"},{\"name\":\"Loss of taste or smell\",\"input_id\":\"15\",\"answer\":\"Yes\"},{\"name\":\"Difficulty of breathing\",\"input_id\":\"16\",\"answer\":\"Yes\"}]', '2022-01-04 13:29:38', '2022-01-04 13:29:38'),
(37, 'RES-82936276', 4, 2, '{\"title\":\"Vital Signs\",\"description\":\"Fill patient Vital signs details\"}', '[{\"name\":\"Temperature (celcius)\",\"input_id\":\"5\",\"answer\":\"37\"},{\"name\":\"Blood Pressure\",\"input_id\":\"6\",\"answer\":\"120\\/80\"},{\"name\":\"Height (inches)\",\"input_id\":\"7\",\"answer\":\"5\'4\"},{\"name\":\"Weight (kilos)\",\"input_id\":\"8\",\"answer\":\"50\"}]', '2022-01-04 15:31:10', '2022-01-04 15:31:10'),
(38, 'RES-36425826', 3, 2, '{\"title\":\"Health Declaration Form\",\"description\":\"Are you Experiencing or did you have any of the following in the last 14 days (Ikaw ba ay may nararanasan o nakaranas ng mga sumusunod na sintomas sa nakaraang 14 na araw?)\"}', '[{\"name\":\"Cough and\\/or Colds\",\"input_id\":\"9\",\"answer\":\"No\"},{\"name\":\"Body Pains\",\"input_id\":\"10\",\"answer\":\"Yes\"},{\"name\":\"Sore Throat\",\"input_id\":\"11\",\"answer\":\"No\"},{\"name\":\"Fatigue\\/Tiredness\",\"input_id\":\"12\",\"answer\":\"No\"},{\"name\":\"Headache\",\"input_id\":\"13\",\"answer\":\"Yes\"},{\"name\":\"Diarrhea\",\"input_id\":\"14\",\"answer\":\"No\"},{\"name\":\"Loss of taste or smell\",\"input_id\":\"15\",\"answer\":\"No\"},{\"name\":\"Difficulty of breathing\",\"input_id\":\"16\",\"answer\":\"Yes\"}]', '2022-01-04 15:31:28', '2022-01-04 15:31:28'),
(39, 'RES-86446126', 4, 2, '{\"title\":\"Vital Signs\",\"description\":\"Fill patient Vital signs details\"}', '[{\"name\":\"Temperature (celcius)\",\"input_id\":\"5\",\"answer\":\"37\"},{\"name\":\"Blood Pressure\",\"input_id\":\"6\",\"answer\":\"120\\/80\"},{\"name\":\"Height (inches)\",\"input_id\":\"7\",\"answer\":\"5\'2\"},{\"name\":\"Weight (kilos)\",\"input_id\":\"8\",\"answer\":\"48\"}]', '2022-01-04 16:02:20', '2022-01-04 16:02:20'),
(40, 'RES-74992873', 3, 2, '{\"title\":\"Health Declaration Form\",\"description\":\"Are you Experiencing or did you have any of the following in the last 14 days (Ikaw ba ay may nararanasan o nakaranas ng mga sumusunod na sintomas sa nakaraang 14 na araw?)\"}', '[{\"name\":\"Cough and\\/or Colds\",\"input_id\":\"9\",\"answer\":\"No\"},{\"name\":\"Body Pains\",\"input_id\":\"10\",\"answer\":\"No\"},{\"name\":\"Sore Throat\",\"input_id\":\"11\",\"answer\":\"No\"},{\"name\":\"Fatigue\\/Tiredness\",\"input_id\":\"12\",\"answer\":\"No\"},{\"name\":\"Headache\",\"input_id\":\"13\",\"answer\":\"No\"},{\"name\":\"Diarrhea\",\"input_id\":\"14\",\"answer\":\"No\"},{\"name\":\"Loss of taste or smell\",\"input_id\":\"15\",\"answer\":\"No\"},{\"name\":\"Difficulty of breathing\",\"input_id\":\"16\",\"answer\":\"No\"}]', '2022-01-04 16:02:36', '2022-01-04 16:02:36'),
(41, 'RES-42456219', 4, 2, '{\"title\":\"Vital Signs\",\"description\":\"Fill patient Vital signs details\"}', '[{\"name\":\"Temperature (celcius)\",\"input_id\":\"5\",\"answer\":\"37\"},{\"name\":\"Blood Pressure\",\"input_id\":\"6\",\"answer\":\"110\\/80\"},{\"name\":\"Height (inches)\",\"input_id\":\"7\",\"answer\":\"5\'5\"},{\"name\":\"Weight (kilos)\",\"input_id\":\"8\",\"answer\":\"52\"}]', '2022-01-04 16:26:02', '2022-01-04 16:26:02'),
(42, 'RES-47276247', 3, 2, '{\"title\":\"Health Declaration Form\",\"description\":\"Are you Experiencing or did you have any of the following in the last 14 days (Ikaw ba ay may nararanasan o nakaranas ng mga sumusunod na sintomas sa nakaraang 14 na araw?)\"}', '[{\"name\":\"Cough and\\/or Colds\",\"input_id\":\"9\",\"answer\":\"No\"},{\"name\":\"Body Pains\",\"input_id\":\"10\",\"answer\":\"No\"},{\"name\":\"Sore Throat\",\"input_id\":\"11\",\"answer\":\"No\"},{\"name\":\"Fatigue\\/Tiredness\",\"input_id\":\"12\",\"answer\":\"No\"},{\"name\":\"Headache\",\"input_id\":\"13\",\"answer\":\"No\"},{\"name\":\"Diarrhea\",\"input_id\":\"14\",\"answer\":\"No\"},{\"name\":\"Loss of taste or smell\",\"input_id\":\"15\",\"answer\":\"No\"},{\"name\":\"Difficulty of breathing\",\"input_id\":\"16\",\"answer\":\"No\"}]', '2022-01-04 16:26:15', '2022-01-04 16:26:15'),
(43, 'RES-53611273', 4, 2, '{\"title\":\"Vital Signs\",\"description\":\"Fill patient Vital signs details\"}', '[{\"name\":\"Temperature (celcius)\",\"input_id\":\"5\",\"answer\":\"37\"},{\"name\":\"Blood Pressure\",\"input_id\":\"6\",\"answer\":\"110\\/80\"},{\"name\":\"Height (inches)\",\"input_id\":\"7\",\"answer\":\"5\'4\"},{\"name\":\"Weight (kilos)\",\"input_id\":\"8\",\"answer\":\"60\"}]', '2022-01-05 04:01:47', '2022-01-05 04:01:47'),
(44, 'RES-82198674', 3, 2, '{\"title\":\"Health Declaration Form\",\"description\":\"Are you Experiencing or did you have any of the following in the last 14 days (Ikaw ba ay may nararanasan o nakaranas ng mga sumusunod na sintomas sa nakaraang 14 na araw?)\"}', '[{\"name\":\"Cough and\\/or Colds\",\"input_id\":\"9\",\"answer\":\"No\"},{\"name\":\"Body Pains\",\"input_id\":\"10\",\"answer\":\"Yes\"},{\"name\":\"Sore Throat\",\"input_id\":\"11\",\"answer\":\"No\"},{\"name\":\"Fatigue\\/Tiredness\",\"input_id\":\"12\",\"answer\":\"No\"},{\"name\":\"Headache\",\"input_id\":\"13\",\"answer\":\"No\"},{\"name\":\"Diarrhea\",\"input_id\":\"14\",\"answer\":\"No\"},{\"name\":\"Loss of taste or smell\",\"input_id\":\"15\",\"answer\":\"No\"},{\"name\":\"Difficulty of breathing\",\"input_id\":\"16\",\"answer\":\"No\"}]', '2022-01-05 04:02:05', '2022-01-05 04:02:05'),
(45, 'RES-18996982', 6, 2, '{\"title\":\"Patient\'s Travel History\",\"description\":\"Patient travel history for the past 14 days.\"}', '[{\"name\":\"What city\\/cities did you travel to for the last 14 days?\",\"input_id\":\"19\",\"answer\":\"Quezon City\"}]', '2022-01-05 04:24:55', '2022-01-05 04:24:55'),
(46, 'RES-32278378', 4, 2, '{\"title\":\"Vital Signs\",\"description\":\"Fill patient Vital signs details\"}', '[{\"name\":\"Temperature (celcius)\",\"input_id\":\"5\",\"answer\":\"39\"},{\"name\":\"Blood Pressure\",\"input_id\":\"6\",\"answer\":\"140\\/100\"},{\"name\":\"Height (inches)\",\"input_id\":\"7\",\"answer\":\"5\'11\"},{\"name\":\"Weight (kilos)\",\"input_id\":\"8\",\"answer\":\"70\"}]', '2022-01-05 04:31:30', '2022-01-05 04:31:30'),
(47, 'RES-49565897', 3, 2, '{\"title\":\"Health Declaration Form\",\"description\":\"Are you Experiencing or did you have any of the following in the last 14 days (Ikaw ba ay may nararanasan o nakaranas ng mga sumusunod na sintomas sa nakaraang 14 na araw?)\"}', '[{\"name\":\"Cough and\\/or Colds\",\"input_id\":\"9\",\"answer\":\"Yes\"},{\"name\":\"Body Pains\",\"input_id\":\"10\",\"answer\":\"Yes\"},{\"name\":\"Sore Throat\",\"input_id\":\"11\",\"answer\":\"Yes\"},{\"name\":\"Fatigue\\/Tiredness\",\"input_id\":\"12\",\"answer\":\"Yes\"},{\"name\":\"Headache\",\"input_id\":\"13\",\"answer\":\"Yes\"},{\"name\":\"Diarrhea\",\"input_id\":\"14\",\"answer\":\"Yes\"},{\"name\":\"Loss of taste or smell\",\"input_id\":\"15\",\"answer\":\"Yes\"},{\"name\":\"Difficulty of breathing\",\"input_id\":\"16\",\"answer\":\"Yes\"}]', '2022-01-05 04:31:53', '2022-01-05 04:31:53'),
(48, 'RES-93864315', 4, 2, '{\"title\":\"Vital Signs\",\"description\":\"Fill patient Vital signs details\"}', '[{\"name\":\"Temperature (celcius)\",\"input_id\":\"5\",\"answer\":\"37\"},{\"name\":\"Blood Pressure\",\"input_id\":\"6\",\"answer\":\"120\\/80\"},{\"name\":\"Height (inches)\",\"input_id\":\"7\",\"answer\":\"5\'5\"},{\"name\":\"Weight (kilos)\",\"input_id\":\"8\",\"answer\":\"48\"}]', '2022-01-05 04:52:51', '2022-01-05 04:52:51'),
(49, 'RES-24789981', 3, 2, '{\"title\":\"Health Declaration Form\",\"description\":\"Are you Experiencing or did you have any of the following in the last 14 days (Ikaw ba ay may nararanasan o nakaranas ng mga sumusunod na sintomas sa nakaraang 14 na araw?)\"}', '[{\"name\":\"Cough and\\/or Colds\",\"input_id\":\"9\",\"answer\":\"No\"},{\"name\":\"Body Pains\",\"input_id\":\"10\",\"answer\":\"No\"},{\"name\":\"Sore Throat\",\"input_id\":\"11\",\"answer\":\"Yes\"},{\"name\":\"Fatigue\\/Tiredness\",\"input_id\":\"12\",\"answer\":\"Yes\"},{\"name\":\"Headache\",\"input_id\":\"13\",\"answer\":\"Yes\"},{\"name\":\"Diarrhea\",\"input_id\":\"14\",\"answer\":\"No\"},{\"name\":\"Loss of taste or smell\",\"input_id\":\"15\",\"answer\":\"No\"},{\"name\":\"Difficulty of breathing\",\"input_id\":\"16\",\"answer\":\"No\"}]', '2022-01-05 04:53:05', '2022-01-05 04:53:05'),
(50, 'RES-22376111', 4, 2, '{\"title\":\"Vital Signs\",\"description\":\"Fill patient Vital signs details\"}', '[{\"name\":\"Temperature (celcius)\",\"input_id\":\"5\",\"answer\":\"36.1\"},{\"name\":\"Blood Pressure\",\"input_id\":\"6\",\"answer\":\"120\\/80\"},{\"name\":\"Height (inches)\",\"input_id\":\"7\",\"answer\":\"40\"},{\"name\":\"Weight (kilos)\",\"input_id\":\"8\",\"answer\":\"50\"}]', '2022-01-05 05:44:03', '2022-01-05 05:44:03'),
(51, 'RES-65395279', 3, 2, '{\"title\":\"Health Declaration Form\",\"description\":\"Are you Experiencing or did you have any of the following in the last 14 days (Ikaw ba ay may nararanasan o nakaranas ng mga sumusunod na sintomas sa nakaraang 14 na araw?)\"}', '[{\"name\":\"Cough and\\/or Colds\",\"input_id\":\"9\",\"answer\":\"No\"},{\"name\":\"Body Pains\",\"input_id\":\"10\",\"answer\":\"Yes\"},{\"name\":\"Sore Throat\",\"input_id\":\"11\",\"answer\":\"Yes\"},{\"name\":\"Fatigue\\/Tiredness\",\"input_id\":\"12\",\"answer\":\"No\"},{\"name\":\"Headache\",\"input_id\":\"13\",\"answer\":\"No\"},{\"name\":\"Diarrhea\",\"input_id\":\"14\",\"answer\":\"Yes\"},{\"name\":\"Loss of taste or smell\",\"input_id\":\"15\",\"answer\":\"Yes\"},{\"name\":\"Difficulty of breathing\",\"input_id\":\"16\",\"answer\":\"No\"}]', '2022-01-05 05:44:17', '2022-01-05 05:44:17'),
(52, 'RES-94241386', 4, 2, '{\"title\":\"Vital Signs\",\"description\":\"Fill patient Vital signs details\"}', '[{\"name\":\"Temperature (celcius)\",\"input_id\":\"5\",\"answer\":\"37\"},{\"name\":\"Blood Pressure\",\"input_id\":\"6\",\"answer\":\"120\\/80\"},{\"name\":\"Height (inches)\",\"input_id\":\"7\",\"answer\":\"5\'5\"},{\"name\":\"Weight (kilos)\",\"input_id\":\"8\",\"answer\":\"60\"}]', '2022-01-05 06:09:07', '2022-01-05 06:09:07'),
(53, 'RES-12643286', 3, 2, '{\"title\":\"Health Declaration Form\",\"description\":\"Are you Experiencing or did you have any of the following in the last 14 days (Ikaw ba ay may nararanasan o nakaranas ng mga sumusunod na sintomas sa nakaraang 14 na araw?)\"}', '[{\"name\":\"Cough and\\/or Colds\",\"input_id\":\"9\",\"answer\":\"No\"},{\"name\":\"Body Pains\",\"input_id\":\"10\",\"answer\":\"Yes\"},{\"name\":\"Sore Throat\",\"input_id\":\"11\",\"answer\":\"Yes\"},{\"name\":\"Fatigue\\/Tiredness\",\"input_id\":\"12\",\"answer\":\"Yes\"},{\"name\":\"Headache\",\"input_id\":\"13\",\"answer\":\"No\"},{\"name\":\"Diarrhea\",\"input_id\":\"14\",\"answer\":\"No\"},{\"name\":\"Loss of taste or smell\",\"input_id\":\"15\",\"answer\":\"No\"},{\"name\":\"Difficulty of breathing\",\"input_id\":\"16\",\"answer\":\"No\"}]', '2022-01-05 06:09:28', '2022-01-05 06:09:28'),
(54, 'RES-72771118', 4, 2, '{\"title\":\"Vital Signs\",\"description\":\"Fill patient Vital signs details\"}', '[{\"name\":\"Temperature (celcius)\",\"input_id\":\"5\",\"answer\":\"37\"},{\"name\":\"Blood Pressure\",\"input_id\":\"6\",\"answer\":\"120\\/80\"},{\"name\":\"Height (inches)\",\"input_id\":\"7\",\"answer\":\"160\"},{\"name\":\"Weight (kilos)\",\"input_id\":\"8\",\"answer\":\"60\"}]', '2022-01-05 06:10:34', '2022-01-05 06:10:34'),
(55, 'RES-69817946', 7, 58, '{\"title\":\"Patient\'s Travel History\",\"description\":\"Patient\'s travel history for the past 14 days\"}', '[{\"name\":\"What city\\/cities did you travel to for the last 14 days?\",\"input_id\":\"20\",\"answer\":\"Tagaytay\"}]', '2022-01-05 07:12:10', '2022-01-05 07:12:10'),
(56, 'RES-66869534', 4, 58, '{\"title\":\"Vital Signs\",\"description\":\"Fill patient Vital signs details\"}', '[{\"name\":\"Temperature (celcius)\",\"input_id\":\"5\",\"answer\":\"37\"},{\"name\":\"Blood Pressure\",\"input_id\":\"6\",\"answer\":\"120\\/80\"},{\"name\":\"Height (inches)\",\"input_id\":\"7\",\"answer\":\"5\'4\"},{\"name\":\"Weight (kilos)\",\"input_id\":\"8\",\"answer\":\"50\"}]', '2022-01-05 07:12:53', '2022-01-05 07:12:53'),
(57, 'RES-84551465', 3, 58, '{\"title\":\"Health Declaration Form\",\"description\":\"Are you Experiencing or did you have any of the following in the last 14 days (Ikaw ba ay may nararanasan o nakaranas ng mga sumusunod na sintomas sa nakaraang 14 na araw?)\"}', '[{\"name\":\"Cough and\\/or Colds\",\"input_id\":\"9\",\"answer\":\"Yes\"},{\"name\":\"Body Pains\",\"input_id\":\"10\",\"answer\":\"No\"},{\"name\":\"Sore Throat\",\"input_id\":\"11\",\"answer\":\"Yes\"},{\"name\":\"Fatigue\\/Tiredness\",\"input_id\":\"12\",\"answer\":\"Yes\"},{\"name\":\"Headache\",\"input_id\":\"13\",\"answer\":\"Yes\"},{\"name\":\"Diarrhea\",\"input_id\":\"14\",\"answer\":\"Yes\"},{\"name\":\"Loss of taste or smell\",\"input_id\":\"15\",\"answer\":\"No\"},{\"name\":\"Difficulty of breathing\",\"input_id\":\"16\",\"answer\":\"Yes\"}]', '2022-01-05 07:13:16', '2022-01-05 07:13:16'),
(58, 'RES-86263592', 7, 2, '{\"title\":\"Patient\'s Travel History\",\"description\":\"Patient\'s travel history for the past 14 days\"}', '[{\"name\":\"What city\\/cities did you travel to for the last 14 days?\",\"input_id\":\"20\",\"answer\":\"Laguna\"}]', '2022-01-05 10:04:39', '2022-01-05 10:04:39'),
(59, 'RES-34757623', 4, 2, '{\"title\":\"Vital Signs\",\"description\":\"Fill patient Vital signs details\"}', '[{\"name\":\"Temperature (celcius)\",\"input_id\":\"5\",\"answer\":\"38\"},{\"name\":\"Blood Pressure\",\"input_id\":\"6\",\"answer\":\"120\\/80\"},{\"name\":\"Height (inches)\",\"input_id\":\"7\",\"answer\":\"5\'4\"},{\"name\":\"Weight (kilos)\",\"input_id\":\"8\",\"answer\":\"48\"}]', '2022-01-05 10:04:56', '2022-01-05 10:04:56'),
(60, 'RES-91277247', 3, 2, '{\"title\":\"Health Declaration Form\",\"description\":\"Are you Experiencing or did you have any of the following in the last 14 days (Ikaw ba ay may nararanasan o nakaranas ng mga sumusunod na sintomas sa nakaraang 14 na araw?)\"}', '[{\"name\":\"Cough and\\/or Colds\",\"input_id\":\"9\",\"answer\":\"No\"},{\"name\":\"Body Pains\",\"input_id\":\"10\",\"answer\":\"No\"},{\"name\":\"Sore Throat\",\"input_id\":\"11\",\"answer\":\"No\"},{\"name\":\"Fatigue\\/Tiredness\",\"input_id\":\"12\",\"answer\":\"No\"},{\"name\":\"Headache\",\"input_id\":\"13\",\"answer\":\"No\"},{\"name\":\"Diarrhea\",\"input_id\":\"14\",\"answer\":\"No\"},{\"name\":\"Loss of taste or smell\",\"input_id\":\"15\",\"answer\":\"No\"},{\"name\":\"Difficulty of breathing\",\"input_id\":\"16\",\"answer\":\"No\"}]', '2022-01-05 10:05:09', '2022-01-05 10:05:09'),
(61, 'RES-23823139', 7, 58, '{\"title\":\"Patient\'s Travel History\",\"description\":\"Patient\'s travel history for the past 14 days\"}', '[{\"name\":\"What city\\/cities did you travel to for the last 14 days?\",\"input_id\":\"20\",\"answer\":\"Manila\"}]', '2022-01-06 16:04:44', '2022-01-06 16:04:44'),
(62, 'RES-18837111', 4, 58, '{\"title\":\"Vital Signs\",\"description\":\"Fill patient Vital signs details\"}', '[{\"name\":\"Temperature (celcius)\",\"input_id\":\"5\",\"answer\":\"37\"},{\"name\":\"Blood Pressure\",\"input_id\":\"6\",\"answer\":\"120\\/80\"},{\"name\":\"Height (inches)\",\"input_id\":\"7\",\"answer\":\"5\'4\"},{\"name\":\"Weight (kilos)\",\"input_id\":\"8\",\"answer\":\"52\"}]', '2022-01-06 16:04:52', '2022-01-06 16:04:52'),
(63, 'RES-11465284', 4, 2, '{\"title\":\"Vital Signs\",\"description\":\"Fill patient Vital signs details\"}', '[{\"name\":\"Temperature (celcius)\",\"input_id\":\"5\",\"answer\":\"38\"},{\"name\":\"Blood Pressure\",\"input_id\":\"6\",\"answer\":\"120\\/80\"},{\"name\":\"Height (inches)\",\"input_id\":\"7\",\"answer\":\"160\"},{\"name\":\"Weight (kilos)\",\"input_id\":\"8\",\"answer\":\"60\"}]', '2022-01-07 05:58:20', '2022-01-07 05:58:20'),
(64, 'RES-85582268', 3, 2, '{\"title\":\"Health Declaration Form\",\"description\":\"Are you Experiencing or did you have any of the following in the last 14 days (Ikaw ba ay may nararanasan o nakaranas ng mga sumusunod na sintomas sa nakaraang 14 na araw?)\"}', '[{\"name\":\"Cough and\\/or Colds\",\"input_id\":\"9\",\"answer\":\"Yes\"},{\"name\":\"Body Pains\",\"input_id\":\"10\",\"answer\":\"No\"},{\"name\":\"Sore Throat\",\"input_id\":\"11\",\"answer\":\"Yes\"},{\"name\":\"Fatigue\\/Tiredness\",\"input_id\":\"12\",\"answer\":\"No\"},{\"name\":\"Headache\",\"input_id\":\"13\",\"answer\":\"Yes\"},{\"name\":\"Diarrhea\",\"input_id\":\"14\",\"answer\":\"No\"},{\"name\":\"Loss of taste or smell\",\"input_id\":\"15\",\"answer\":\"Yes\"},{\"name\":\"Difficulty of breathing\",\"input_id\":\"16\",\"answer\":\"No\"}]', '2022-01-07 06:22:56', '2022-01-07 06:22:56'),
(65, 'RES-54345112', 8, 2, '{\"title\":\"Sample\",\"description\":\"Sample\"}', '[{\"name\":\"Question 1\",\"input_id\":\"21\",\"answer\":\"hello\"}]', '2022-01-09 12:44:41', '2022-01-09 12:44:41'),
(66, 'RES-92641116', 7, 2, '{\"title\":\"Patient\'s Travel History\",\"description\":\"Patient\'s travel history for the past 14 days\"}', '[{\"name\":\"What city\\/cities did you travel to for the last 14 days?\",\"input_id\":\"20\",\"answer\":\"Tagaytay\"}]', '2022-01-09 12:44:46', '2022-01-09 12:44:46'),
(67, 'RES-72198485', 3, 69, '{\"title\":\"Health Declaration Form\",\"description\":\"Are you Experiencing or did you have any of the following in the last 14 days (Ikaw ba ay may nararanasan o nakaranas ng mga sumusunod na sintomas sa nakaraang 14 na araw?)\"}', '[{\"name\":\"Cough and\\/or Colds\",\"input_id\":\"9\",\"answer\":\"Yes\"},{\"name\":\"Body Pains\",\"input_id\":\"10\",\"answer\":\"Yes\"},{\"name\":\"Sore Throat\",\"input_id\":\"11\",\"answer\":\"Yes\"},{\"name\":\"Fatigue\\/Tiredness\",\"input_id\":\"12\",\"answer\":\"Yes\"},{\"name\":\"Headache\",\"input_id\":\"13\",\"answer\":\"Yes\"},{\"name\":\"Diarrhea\",\"input_id\":\"14\",\"answer\":\"Yes\"},{\"name\":\"Loss of taste or smell\",\"input_id\":\"15\",\"answer\":\"Yes\"},{\"name\":\"Difficulty of breathing\",\"input_id\":\"16\",\"answer\":\"Yes\"}]', '2022-01-11 07:33:05', '2022-01-11 07:33:05'),
(68, 'RES-59171868', 7, 69, '{\"title\":\"Patient\'s Travel History\",\"description\":\"Patient\'s travel history for the past 14 days\"}', '[{\"name\":\"What city\\/cities did you travel to for the last 14 days?\",\"input_id\":\"20\",\"answer\":\"Quezon City\"}]', '2022-01-12 01:48:51', '2022-01-12 01:48:51'),
(69, 'RES-66787662', 4, 69, '{\"title\":\"Vital Signs\",\"description\":\"Fill patient Vital signs details\"}', '[{\"name\":\"Temperature (celcius)\",\"input_id\":\"5\",\"answer\":\"39\"},{\"name\":\"Blood Pressure\",\"input_id\":\"6\",\"answer\":\"120\\/80\"},{\"name\":\"Height (inches)\",\"input_id\":\"7\",\"answer\":\"170\"},{\"name\":\"Weight (kilos)\",\"input_id\":\"8\",\"answer\":\"55\"}]', '2022-01-12 01:49:14', '2022-01-12 01:49:14'),
(70, 'RES-75159587', 3, 69, '{\"title\":\"Health Declaration Form\",\"description\":\"Are you Experiencing or did you have any of the following in the last 14 days (Ikaw ba ay may nararanasan o nakaranas ng mga sumusunod na sintomas sa nakaraang 14 na araw?)\"}', '[{\"name\":\"Cough and\\/or Colds\",\"input_id\":\"9\",\"answer\":\"Yes\"},{\"name\":\"Body Pains\",\"input_id\":\"10\",\"answer\":\"Yes\"},{\"name\":\"Sore Throat\",\"input_id\":\"11\",\"answer\":\"Yes\"},{\"name\":\"Fatigue\\/Tiredness\",\"input_id\":\"12\",\"answer\":\"Yes\"},{\"name\":\"Headache\",\"input_id\":\"13\",\"answer\":\"Yes\"},{\"name\":\"Diarrhea\",\"input_id\":\"14\",\"answer\":\"Yes\"},{\"name\":\"Loss of taste or smell\",\"input_id\":\"15\",\"answer\":\"Yes\"},{\"name\":\"Difficulty of breathing\",\"input_id\":\"16\",\"answer\":\"Yes\"}]', '2022-01-12 01:49:44', '2022-01-12 01:49:44'),
(71, 'RES-95173398', 7, 58, '{\"title\":\"Patient\'s Travel History\",\"description\":\"Patient\'s travel history for the past 14 days\"}', '[{\"name\":\"What city\\/cities did you travel to for the last 14 days?\",\"input_id\":\"20\",\"answer\":\"Quezon City\"}]', '2022-01-12 07:32:18', '2022-01-12 07:32:18'),
(72, 'RES-92159513', 4, 58, '{\"title\":\"Vital Signs\",\"description\":\"Fill patient Vital signs details\"}', '[{\"name\":\"Temperature (celcius)\",\"input_id\":\"5\",\"answer\":\"39\"},{\"name\":\"Blood Pressure\",\"input_id\":\"6\",\"answer\":\"120\\/80\"},{\"name\":\"Height (inches)\",\"input_id\":\"7\",\"answer\":\"170\"},{\"name\":\"Weight (kilos)\",\"input_id\":\"8\",\"answer\":\"70 \"}]', '2022-01-12 07:32:47', '2022-01-12 07:32:47'),
(73, 'RES-34695323', 3, 58, '{\"title\":\"Health Declaration Form\",\"description\":\"Are you Experiencing or did you have any of the following in the last 14 days (Ikaw ba ay may nararanasan o nakaranas ng mga sumusunod na sintomas sa nakaraang 14 na araw?)\"}', '[{\"name\":\"Cough and\\/or Colds\",\"input_id\":\"9\",\"answer\":\"Yes\"},{\"name\":\"Body Pains\",\"input_id\":\"10\",\"answer\":\"Yes\"},{\"name\":\"Sore Throat\",\"input_id\":\"11\",\"answer\":\"Yes\"},{\"name\":\"Fatigue\\/Tiredness\",\"input_id\":\"12\",\"answer\":\"Yes\"},{\"name\":\"Headache\",\"input_id\":\"13\",\"answer\":\"Yes\"},{\"name\":\"Diarrhea\",\"input_id\":\"14\",\"answer\":\"Yes\"},{\"name\":\"Loss of taste or smell\",\"input_id\":\"15\",\"answer\":\"Yes\"},{\"name\":\"Difficulty of breathing\",\"input_id\":\"16\",\"answer\":\"Yes\"}]', '2022-01-12 07:33:13', '2022-01-12 07:33:13'),
(74, 'RES-31227472', 4, 2, '{\"title\":\"Vital Signs\",\"description\":\"Fill patient Vital signs details\"}', '[{\"name\":\"Temperature (celcius)\",\"input_id\":\"5\",\"answer\":\"37\"},{\"name\":\"Blood Pressure\",\"input_id\":\"6\",\"answer\":\"120\\/80\"},{\"name\":\"Height (inches)\",\"input_id\":\"7\",\"answer\":\"5\'5\"},{\"name\":\"Weight (kilos)\",\"input_id\":\"8\",\"answer\":\"48\"}]', '2022-01-16 16:52:29', '2022-01-16 16:52:29'),
(75, 'RES-13928153', 3, 2, '{\"title\":\"Health Declaration Form\",\"description\":\"Are you Experiencing or did you have any of the following in the last 14 days (Ikaw ba ay may nararanasan o nakaranas ng mga sumusunod na sintomas sa nakaraang 14 na araw?)\"}', '[{\"name\":\"Cough and\\/or Colds\",\"input_id\":\"9\",\"answer\":\"No\"},{\"name\":\"Body Pains\",\"input_id\":\"10\",\"answer\":\"No\"},{\"name\":\"Sore Throat\",\"input_id\":\"11\",\"answer\":\"No\"},{\"name\":\"Fatigue\\/Tiredness\",\"input_id\":\"12\",\"answer\":\"No\"},{\"name\":\"Headache\",\"input_id\":\"13\",\"answer\":\"No\"},{\"name\":\"Diarrhea\",\"input_id\":\"14\",\"answer\":\"No\"},{\"name\":\"Loss of taste or smell\",\"input_id\":\"15\",\"answer\":\"No\"},{\"name\":\"Difficulty of breathing\",\"input_id\":\"16\",\"answer\":\"No\"}]', '2022-01-16 16:52:45', '2022-01-16 16:52:45'),
(76, 'RES-55964381', 7, 2, '{\"title\":\"Patient\'s Travel History\",\"description\":\"Patient\'s travel history for the past 14 days\"}', '[{\"name\":\"What city\\/cities did you travel to for the last 14 days?\",\"input_id\":\"20\",\"answer\":\"Laguna\"}]', '2022-01-16 17:23:16', '2022-01-16 17:23:16'),
(77, 'RES-26251268', 4, 2, '{\"title\":\"Vital Signs\",\"description\":\"Fill patient Vital signs details\"}', '[{\"name\":\"Temperature (celcius)\",\"input_id\":\"5\",\"answer\":\"37\"},{\"name\":\"Blood Pressure\",\"input_id\":\"6\",\"answer\":\"120\\/80\"},{\"name\":\"Height (inches)\",\"input_id\":\"7\",\"answer\":\"5\'5\"},{\"name\":\"Weight (kilos)\",\"input_id\":\"8\",\"answer\":\"48\"}]', '2022-01-16 17:23:28', '2022-01-16 17:23:28'),
(78, 'RES-39164366', 3, 2, '{\"title\":\"Health Declaration Form\",\"description\":\"Are you Experiencing or did you have any of the following in the last 14 days (Ikaw ba ay may nararanasan o nakaranas ng mga sumusunod na sintomas sa nakaraang 14 na araw?)\"}', '[{\"name\":\"Cough and\\/or Colds\",\"input_id\":\"9\",\"answer\":\"No\"},{\"name\":\"Body Pains\",\"input_id\":\"10\",\"answer\":\"Yes\"},{\"name\":\"Sore Throat\",\"input_id\":\"11\",\"answer\":\"Yes\"},{\"name\":\"Fatigue\\/Tiredness\",\"input_id\":\"12\",\"answer\":\"No\"},{\"name\":\"Headache\",\"input_id\":\"13\",\"answer\":\"Yes\"},{\"name\":\"Diarrhea\",\"input_id\":\"14\",\"answer\":\"No\"},{\"name\":\"Loss of taste or smell\",\"input_id\":\"15\",\"answer\":\"No\"},{\"name\":\"Difficulty of breathing\",\"input_id\":\"16\",\"answer\":\"No\"}]', '2022-01-16 17:23:45', '2022-01-16 17:23:45'),
(79, 'RES-13559871', 7, 2, '{\"title\":\"Patient\'s Travel History\",\"description\":\"Patient\'s travel history for the past 14 days\"}', '[{\"name\":\"What city\\/cities did you travel to for the last 14 days?\",\"input_id\":\"20\",\"answer\":\"Quezon City\"}]', '2022-01-16 17:48:18', '2022-01-16 17:48:18'),
(80, 'RES-46675633', 4, 2, '{\"title\":\"Vital Signs\",\"description\":\"Fill patient Vital signs details\"}', '[{\"name\":\"Temperature (celcius)\",\"input_id\":\"5\",\"answer\":\"39\"},{\"name\":\"Blood Pressure\",\"input_id\":\"6\",\"answer\":\"110\\/80\"},{\"name\":\"Height (inches)\",\"input_id\":\"7\",\"answer\":\"5\'4\"},{\"name\":\"Weight (kilos)\",\"input_id\":\"8\",\"answer\":\"52\"}]', '2022-01-16 17:48:31', '2022-01-16 17:48:31'),
(81, 'RES-69672867', 3, 2, '{\"title\":\"Health Declaration Form\",\"description\":\"Are you Experiencing or did you have any of the following in the last 14 days (Ikaw ba ay may nararanasan o nakaranas ng mga sumusunod na sintomas sa nakaraang 14 na araw?)\"}', '[{\"name\":\"Cough and\\/or Colds\",\"input_id\":\"9\",\"answer\":\"Yes\"},{\"name\":\"Body Pains\",\"input_id\":\"10\",\"answer\":\"No\"},{\"name\":\"Sore Throat\",\"input_id\":\"11\",\"answer\":\"No\"},{\"name\":\"Fatigue\\/Tiredness\",\"input_id\":\"12\",\"answer\":\"Yes\"},{\"name\":\"Headache\",\"input_id\":\"13\",\"answer\":\"Yes\"},{\"name\":\"Diarrhea\",\"input_id\":\"14\",\"answer\":\"Yes\"},{\"name\":\"Loss of taste or smell\",\"input_id\":\"15\",\"answer\":\"Yes\"},{\"name\":\"Difficulty of breathing\",\"input_id\":\"16\",\"answer\":\"No\"}]', '2022-01-16 17:48:48', '2022-01-16 17:48:48'),
(82, 'RES-34472657', 4, 2, '{\"title\":\"Vital Signs\",\"description\":\"Fill patient Vital signs details\"}', '[{\"name\":\"Temperature (celcius)\",\"input_id\":\"5\",\"answer\":\"37\"},{\"name\":\"Blood Pressure\",\"input_id\":\"6\",\"answer\":\"120\\/80\"},{\"name\":\"Height (inches)\",\"input_id\":\"7\",\"answer\":\"5\'4\"},{\"name\":\"Weight (kilos)\",\"input_id\":\"8\",\"answer\":\"50\"}]', '2022-01-16 18:05:05', '2022-01-16 18:05:05'),
(83, 'RES-71897771', 3, 2, '{\"title\":\"Health Declaration Form\",\"description\":\"Are you Experiencing or did you have any of the following in the last 14 days (Ikaw ba ay may nararanasan o nakaranas ng mga sumusunod na sintomas sa nakaraang 14 na araw?)\"}', '[{\"name\":\"Cough and\\/or Colds\",\"input_id\":\"9\",\"answer\":\"No\"},{\"name\":\"Body Pains\",\"input_id\":\"10\",\"answer\":\"No\"},{\"name\":\"Sore Throat\",\"input_id\":\"11\",\"answer\":\"No\"},{\"name\":\"Fatigue\\/Tiredness\",\"input_id\":\"12\",\"answer\":\"No\"},{\"name\":\"Headache\",\"input_id\":\"13\",\"answer\":\"No\"},{\"name\":\"Diarrhea\",\"input_id\":\"14\",\"answer\":\"Yes\"},{\"name\":\"Loss of taste or smell\",\"input_id\":\"15\",\"answer\":\"Yes\"},{\"name\":\"Difficulty of breathing\",\"input_id\":\"16\",\"answer\":\"No\"}]', '2022-01-16 18:05:18', '2022-01-16 18:05:18');
INSERT INTO `form_respondents` (`id`, `reference`, `form_id`, `user_id`, `form_detail`, `items`, `created_at`, `updated_at`) VALUES
(84, 'RES-13513723', 7, 58, '{\"title\":\"Patient\'s Travel History\",\"description\":\"Patient\'s travel history for the past 14 days\"}', '[{\"name\":\"What city\\/cities did you travel to for the last 14 days?\",\"input_id\":\"20\",\"answer\":\"Manila\"}]', '2022-01-18 12:05:54', '2022-01-18 12:05:54'),
(85, 'RES-72387923', 4, 58, '{\"title\":\"Vital Signs\",\"description\":\"Fill patient Vital signs details\"}', '[{\"name\":\"Temperature (celcius)\",\"input_id\":\"5\",\"answer\":\"39\"},{\"name\":\"Blood Pressure\",\"input_id\":\"6\",\"answer\":\"130\\/90\"},{\"name\":\"Height (inches)\",\"input_id\":\"7\",\"answer\":\"6\'0\"},{\"name\":\"Weight (kilos)\",\"input_id\":\"8\",\"answer\":\"100\"}]', '2022-01-18 12:06:56', '2022-01-18 12:06:56'),
(86, 'RES-82256218', 3, 58, '{\"title\":\"Health Declaration Form\",\"description\":\"Are you Experiencing or did you have any of the following in the last 14 days (Ikaw ba ay may nararanasan o nakaranas ng mga sumusunod na sintomas sa nakaraang 14 na araw?)\"}', '[{\"name\":\"Cough and\\/or Colds\",\"input_id\":\"9\",\"answer\":\"Yes\"},{\"name\":\"Body Pains\",\"input_id\":\"10\",\"answer\":\"Yes\"},{\"name\":\"Sore Throat\",\"input_id\":\"11\",\"answer\":\"Yes\"},{\"name\":\"Fatigue\\/Tiredness\",\"input_id\":\"12\",\"answer\":\"Yes\"},{\"name\":\"Headache\",\"input_id\":\"13\",\"answer\":\"Yes\"},{\"name\":\"Diarrhea\",\"input_id\":\"14\",\"answer\":\"Yes\"},{\"name\":\"Loss of taste or smell\",\"input_id\":\"15\",\"answer\":\"Yes\"},{\"name\":\"Difficulty of breathing\",\"input_id\":\"16\",\"answer\":\"Yes\"}]', '2022-01-18 12:07:28', '2022-01-18 12:07:28'),
(87, 'RES-49948769', 7, 58, '{\"title\":\"Patient\'s Travel History\",\"description\":\"Patient\'s travel history for the past 14 days\"}', '[{\"name\":\"What city\\/cities did you travel to for the last 14 days?\",\"input_id\":\"20\",\"answer\":\"Quezon City\"}]', '2022-01-18 12:33:49', '2022-01-18 12:33:49'),
(88, 'RES-95231453', 4, 58, '{\"title\":\"Vital Signs\",\"description\":\"Fill patient Vital signs details\"}', '[{\"name\":\"Temperature (celcius)\",\"input_id\":\"5\",\"answer\":\"36\"},{\"name\":\"Blood Pressure\",\"input_id\":\"6\",\"answer\":\"120\\/80\"},{\"name\":\"Height (inches)\",\"input_id\":\"7\",\"answer\":\"5\'7\"},{\"name\":\"Weight (kilos)\",\"input_id\":\"8\",\"answer\":\"50\"}]', '2022-01-18 12:34:16', '2022-01-18 12:34:16'),
(89, 'RES-83333187', 3, 58, '{\"title\":\"Health Declaration Form\",\"description\":\"Are you Experiencing or did you have any of the following in the last 14 days (Ikaw ba ay may nararanasan o nakaranas ng mga sumusunod na sintomas sa nakaraang 14 na araw?)\"}', '[{\"name\":\"Cough and\\/or Colds\",\"input_id\":\"9\",\"answer\":\"Yes\"},{\"name\":\"Body Pains\",\"input_id\":\"10\",\"answer\":\"Yes\"},{\"name\":\"Sore Throat\",\"input_id\":\"11\",\"answer\":\"Yes\"},{\"name\":\"Fatigue\\/Tiredness\",\"input_id\":\"12\",\"answer\":\"Yes\"},{\"name\":\"Headache\",\"input_id\":\"13\",\"answer\":\"Yes\"},{\"name\":\"Diarrhea\",\"input_id\":\"14\",\"answer\":\"No\"},{\"name\":\"Loss of taste or smell\",\"input_id\":\"15\",\"answer\":\"No\"},{\"name\":\"Difficulty of breathing\",\"input_id\":\"16\",\"answer\":\"No\"}]', '2022-01-18 12:34:47', '2022-01-18 12:34:47'),
(90, 'RES-77758712', 4, 58, '{\"title\":\"Vital Signs\",\"description\":\"Fill patient Vital signs details\"}', '[{\"name\":\"Temperature (celcius)\",\"input_id\":\"5\",\"answer\":\"39\"},{\"name\":\"Blood Pressure\",\"input_id\":\"6\",\"answer\":\"120\\/80\"},{\"name\":\"Height (inches)\",\"input_id\":\"7\",\"answer\":\"5\'8\"},{\"name\":\"Weight (kilos)\",\"input_id\":\"8\",\"answer\":\"50\"}]', '2022-01-18 13:35:22', '2022-01-18 13:35:22'),
(91, 'RES-29969378', 11, 2, '{\"title\":\"Travel History\",\"description\":\"Place you travel\"}', '[{\"name\":\"Temperature\",\"input_id\":\"23\",\"answer\":\"39\"}]', '2022-01-20 15:53:59', '2022-01-20 15:53:59'),
(92, 'RES-15921549', 10, 2, '{\"title\":\"Travel \",\"description\":\"Place that you travel in the past weeks\"}', '[{\"name\":\"Place you travel\",\"input_id\":\"22\",\"answer\":\"Yes\"}]', '2022-01-20 15:54:00', '2022-01-20 15:54:00'),
(93, 'RES-52327758', 4, 2, '{\"title\":\"Vital Signs\",\"description\":\"Fill patient Vital signs details\"}', '[{\"name\":\"Temperature (celcius)\",\"input_id\":\"5\",\"answer\":\"30\"},{\"name\":\"Blood Pressure\",\"input_id\":\"6\",\"answer\":\"30\"},{\"name\":\"Height (inches)\",\"input_id\":\"7\",\"answer\":\"what the fuck!\"},{\"name\":\"Weight (kilos)\",\"input_id\":\"8\",\"answer\":\"50\"}]', '2022-01-20 15:54:04', '2022-01-20 15:54:04'),
(94, 'RES-37715919', 3, 2, '{\"title\":\"Health Declaration Form\",\"description\":\"Are you Experiencing or did you have any of the following in the last 14 days (Ikaw ba ay may nararanasan o nakaranas ng mga sumusunod na sintomas sa nakaraang 14 na araw?)\"}', '[{\"name\":\"Cough and\\/or Colds\",\"input_id\":\"9\",\"answer\":\"No\"},{\"name\":\"Body Pains\",\"input_id\":\"10\",\"answer\":\"No\"},{\"name\":\"Sore Throat\",\"input_id\":\"11\",\"answer\":\"No\"},{\"name\":\"Fatigue\\/Tiredness\",\"input_id\":\"12\",\"answer\":\"Yes\"},{\"name\":\"Headache\",\"input_id\":\"13\",\"answer\":\"Yes\"},{\"name\":\"Diarrhea\",\"input_id\":\"14\",\"answer\":\"No\"},{\"name\":\"Loss of taste or smell\",\"input_id\":\"15\",\"answer\":\"No\"},{\"name\":\"Difficulty of breathing\",\"input_id\":\"16\",\"answer\":\"Yes\"}]', '2022-01-20 15:54:11', '2022-01-20 15:54:11'),
(95, 'RES-79445333', 11, 2, '{\"title\":\"Travel History\",\"description\":\"Place you travel\"}', '[{\"name\":\"Temperature\",\"input_id\":\"23\",\"answer\":\"36\"}]', '2022-01-21 10:25:44', '2022-01-21 10:25:44'),
(96, 'RES-66197265', 10, 2, '{\"title\":\"Travel \",\"description\":\"Place that you travel in the past weeks\"}', '[{\"name\":\"Place you travel\",\"input_id\":\"22\",\"answer\":\"No\"}]', '2022-01-21 10:25:58', '2022-01-21 10:25:58'),
(97, 'RES-88845223', 4, 2, '{\"title\":\"Vital Signs\",\"description\":\"Fill patient Vital signs details\"}', '[{\"name\":\"Temperature (celcius)\",\"input_id\":\"5\",\"answer\":\"37\"},{\"name\":\"Blood Pressure\",\"input_id\":\"6\",\"answer\":\"110\\/80\"},{\"name\":\"Height (inches)\",\"input_id\":\"7\",\"answer\":\"5\'5\"},{\"name\":\"Weight (kilos)\",\"input_id\":\"8\",\"answer\":\"48\"}]', '2022-01-21 10:26:07', '2022-01-21 10:26:07'),
(98, 'RES-37544579', 3, 2, '{\"title\":\"Health Declaration Form\",\"description\":\"Are you Experiencing or did you have any of the following in the last 14 days (Ikaw ba ay may nararanasan o nakaranas ng mga sumusunod na sintomas sa nakaraang 14 na araw?)\"}', '[{\"name\":\"Cough and\\/or Colds\",\"input_id\":\"9\",\"answer\":\"Yes\"},{\"name\":\"Body Pains\",\"input_id\":\"10\",\"answer\":\"No\"},{\"name\":\"Sore Throat\",\"input_id\":\"11\",\"answer\":\"No\"},{\"name\":\"Fatigue\\/Tiredness\",\"input_id\":\"12\",\"answer\":\"No\"},{\"name\":\"Headache\",\"input_id\":\"13\",\"answer\":\"No\"},{\"name\":\"Diarrhea\",\"input_id\":\"14\",\"answer\":\"Yes\"},{\"name\":\"Loss of taste or smell\",\"input_id\":\"15\",\"answer\":\"No\"},{\"name\":\"Difficulty of breathing\",\"input_id\":\"16\",\"answer\":\"No\"}]', '2022-01-21 10:26:37', '2022-01-21 10:26:37');

-- --------------------------------------------------------

--
-- Table structure for table `hospitals`
--

CREATE TABLE `hospitals` (
  `id` int(10) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `contact_name` varchar(100) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `capacity` int(10) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hospitals`
--

INSERT INTO `hospitals` (`id`, `name`, `phone`, `email`, `contact_name`, `address`, `website`, `created_at`, `updated_at`, `capacity`, `type`) VALUES
(1, 'Chinese General Hospital', '(02) 711-41-41', 'info@cghmc.com.ph', NULL, NULL, 'https://cghmc.com.ph/online/', '2022-01-03 06:51:48', '2022-01-03 06:51:48', 500, NULL),
(2, 'St. Lukes Medical Center', '(02) 367-7486', 'productinfo@stlukes.com.ph', NULL, NULL, 'stlukesmed.ph', '2022-01-04 15:25:52', '2022-01-04 15:25:52', 300, NULL),
(4, 'Hope Isolation Facility ', '(02) 3652316', 'hope@doh.com', NULL, NULL, 'https://quezoncity.gov.ph/program/hope-facilities', '2022-01-13 08:35:07', '2022-01-13 08:35:07', 1000, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `laboratory_requests`
--

CREATE TABLE `laboratory_requests` (
  `id` int(10) NOT NULL,
  `reference` varchar(100) DEFAULT NULL,
  `record_id` int(10) DEFAULT NULL,
  `patient_id` int(10) NOT NULL,
  `date_requested` date DEFAULT NULL,
  `status` enum('pending','cancelled','completed') DEFAULT 'pending',
  `notes` text DEFAULT NULL,
  `created_by` int(10) DEFAULT NULL,
  `updated_by` int(10) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `result_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `laboratory_requests`
--

INSERT INTO `laboratory_requests` (`id`, `reference`, `record_id`, `patient_id`, `date_requested`, `status`, `notes`, `created_by`, `updated_by`, `created_at`, `updated_at`, `result_id`) VALUES
(39, 'LABRQ-935-MGTBU', 51, 86, '2022-01-21', 'completed', '', 2, NULL, '2022-01-21 10:29:24', '2022-01-21 10:30:12', 40);

-- --------------------------------------------------------

--
-- Table structure for table `laboratory_results`
--

CREATE TABLE `laboratory_results` (
  `id` int(10) NOT NULL,
  `reference` varchar(100) NOT NULL,
  `record_id` int(10) NOT NULL,
  `patient_id` int(10) NOT NULL,
  `doctor_id` int(10) NOT NULL,
  `date_requested` date DEFAULT NULL,
  `date_reported` date DEFAULT NULL,
  `abnormalities` varchar(100) DEFAULT NULL,
  `densities` varchar(100) DEFAULT NULL,
  `pneumonia` tinyint(1) DEFAULT NULL,
  `rbc` varchar(100) DEFAULT NULL,
  `wbc` varchar(100) DEFAULT NULL,
  `color` varchar(100) DEFAULT NULL,
  `clarity` varchar(100) DEFAULT NULL,
  `ketones` varchar(100) DEFAULT NULL,
  `ova` varchar(100) DEFAULT NULL,
  `larva` varchar(100) DEFAULT NULL,
  `adult_forms` varchar(100) DEFAULT NULL,
  `allergies` varchar(100) DEFAULT NULL,
  `meds` varchar(100) DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `pathologist` text DEFAULT NULL,
  `medical_technologist` text DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `quarantine` enum('home','hostpitalized','na') DEFAULT 'na',
  `severity` enum('mild','moderate','severe','na') DEFAULT 'na',
  `classify_doc_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `laboratory_results`
--

INSERT INTO `laboratory_results` (`id`, `reference`, `record_id`, `patient_id`, `doctor_id`, `date_requested`, `date_reported`, `abnormalities`, `densities`, `pneumonia`, `rbc`, `wbc`, `color`, `clarity`, `ketones`, `ova`, `larva`, `adult_forms`, `allergies`, `meds`, `remarks`, `pathologist`, `medical_technologist`, `notes`, `created_at`, `quarantine`, `severity`, `classify_doc_id`) VALUES
(40, '172-BXFRI', 51, 86, 2, '2022-01-21', '2022-01-21', 'Has something', 'seen in both lungs', 1, '3.4trillion/L', '4.5billion/L', 'Clear', 'cloudy', '20', 'None', 'None', NULL, 'None', 'None', 'for classification', 'Dr. Chua', 'Dr. Lee', 'further medication', '2022-01-21 10:30:12', 'na', 'severe', 2);

-- --------------------------------------------------------

--
-- Table structure for table `module_address`
--

CREATE TABLE `module_address` (
  `id` int(10) NOT NULL,
  `module_key` varchar(100) DEFAULT NULL,
  `module_id` int(10) DEFAULT NULL,
  `address_id` int(10) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `module_address`
--

INSERT INTO `module_address` (`id`, `module_key`, `module_id`, `address_id`, `created_at`) VALUES
(1, 'USER', 2, 1, '2021-12-26 18:53:04'),
(17, 'USER', 48, 17, '2022-01-02 15:22:21'),
(18, 'USER', 49, 18, '2022-01-02 15:30:19'),
(19, 'USER', 50, 19, '2022-01-02 15:34:08'),
(20, 'HOSPITAL', 1, 20, '2022-01-03 06:52:33'),
(21, 'USER', 51, 21, '2022-01-03 06:55:55'),
(22, 'USER', 52, 22, '2022-01-03 08:27:16'),
(23, 'USER', 53, 23, '2022-01-03 08:39:27'),
(24, 'USER', 54, 24, '2022-01-03 08:44:37'),
(25, 'USER', 55, 25, '2022-01-03 09:28:52'),
(26, 'USER', 56, 26, '2022-01-03 13:01:49'),
(27, 'USER', 57, 27, '2022-01-03 13:05:09'),
(28, 'USER', 58, 28, '2022-01-03 13:15:16'),
(29, 'USER', 59, 29, '2022-01-03 13:19:12'),
(30, 'USER', 60, 30, '2022-01-03 13:53:14'),
(31, 'USER', 61, 31, '2022-01-03 14:12:25'),
(32, 'HOSPITAL', 2, 32, '2022-01-04 15:26:58'),
(33, 'USER', 62, 33, '2022-01-04 15:30:44'),
(34, 'USER', 63, 34, '2022-01-04 16:01:59'),
(35, 'USER', 64, 35, '2022-01-04 16:25:36'),
(36, 'USER', 65, 36, '2022-01-05 04:52:28'),
(37, 'USER', 66, 37, '2022-01-05 07:11:39'),
(38, 'USER', 67, 38, '2022-01-06 16:04:34'),
(39, 'USER', 68, 39, '2022-01-07 02:21:33'),
(40, 'USER', 69, 40, '2022-01-11 07:29:10'),
(41, 'USER', 70, 41, '2022-01-11 07:32:15'),
(42, 'USER', 71, 42, '2022-01-12 01:48:23'),
(43, 'USER', 72, 43, '2022-01-12 07:31:58'),
(44, 'HOSPITAL', 4, 44, '2022-01-13 08:37:19'),
(45, 'USER', 73, 45, '2022-01-16 16:51:58'),
(46, 'USER', 74, 46, '2022-01-16 17:23:04'),
(47, 'USER', 75, 47, '2022-01-16 17:46:24'),
(48, 'USER', 76, 48, '2022-01-16 18:04:48'),
(49, 'USER', 77, 49, '2022-01-18 12:05:28'),
(50, 'USER', 78, 50, '2022-01-18 12:33:02'),
(51, 'USER', 79, 51, '2022-01-18 13:07:18'),
(52, 'USER', 80, 52, '2022-01-18 13:19:32'),
(53, 'USER', 81, 53, '2022-01-18 13:33:36');

-- --------------------------------------------------------

--
-- Table structure for table `patient_records`
--

CREATE TABLE `patient_records` (
  `id` int(10) NOT NULL,
  `reference` varchar(100) DEFAULT NULL,
  `blood_presure_num` varchar(50) DEFAULT NULL,
  `temperature_num` int(10) DEFAULT NULL,
  `pulse_rate_num` int(10) DEFAULT NULL,
  `respirator_rate_num` int(10) DEFAULT NULL,
  `height_num` int(10) DEFAULT NULL,
  `weight_num` int(10) DEFAULT NULL,
  `oxygen_level_num` int(10) DEFAULT NULL,
  `is_fever` tinyint(1) DEFAULT NULL,
  `is_headache` tinyint(1) DEFAULT NULL,
  `is_body_pains` tinyint(1) DEFAULT NULL,
  `is_sore_throat` tinyint(1) DEFAULT NULL,
  `is_diarrhea` tinyint(1) DEFAULT NULL,
  `is_lost_of_taste_smell` tinyint(1) DEFAULT NULL,
  `is_dificulty_breathing` tinyint(1) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  `created_by` int(10) DEFAULT NULL,
  `updated_by` int(10) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `completion_status` enum('pending','finished','invalid') DEFAULT NULL,
  `doctors_approval` int(10) DEFAULT NULL,
  `is_deployed` tinyint(1) DEFAULT 0,
  `report_status` enum('completed','on-going','invalid','pending') DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patient_records`
--

INSERT INTO `patient_records` (`id`, `reference`, `blood_presure_num`, `temperature_num`, `pulse_rate_num`, `respirator_rate_num`, `height_num`, `weight_num`, `oxygen_level_num`, `is_fever`, `is_headache`, `is_body_pains`, `is_sore_throat`, `is_diarrhea`, `is_lost_of_taste_smell`, `is_dificulty_breathing`, `date`, `time`, `user_id`, `created_by`, `updated_by`, `created_at`, `updated_at`, `completion_status`, `doctors_approval`, `is_deployed`, `report_status`) VALUES
(1, '243-TPOBF', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-02', '11:22:21', 48, 2, NULL, '2022-01-02 15:22:28', '2022-01-03 06:42:50', NULL, 2, 0, 'completed'),
(4, '487-PQCBM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-03', '05:28:53', 55, 2, NULL, '2022-01-03 09:28:58', '2022-01-04 14:43:35', NULL, 2, 0, 'completed'),
(21, '485-YDJQE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-04', '11:30:45', 62, 2, NULL, '2022-01-04 15:30:53', '2022-01-05 06:22:52', NULL, 2, 0, 'completed'),
(51, '124-HSYJL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-01-21', '06:25:29', 86, 2, NULL, '2022-01-21 10:25:33', '2022-01-21 10:30:39', NULL, 2, 1, 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `queueing`
--

CREATE TABLE `queueing` (
  `id` int(10) NOT NULL,
  `number_decimal` int(10) DEFAULT NULL,
  `status` enum('waiting','serving','completed','skipped') DEFAULT 'waiting',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `record_form_respondents`
--

CREATE TABLE `record_form_respondents` (
  `id` int(10) NOT NULL,
  `record_id` int(10) DEFAULT NULL,
  `form_respondent_id` int(10) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `record_form_respondents`
--

INSERT INTO `record_form_respondents` (`id`, `record_id`, `form_respondent_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 2, '2022-01-02 15:24:02', '2022-01-02 15:24:02'),
(2, 1, 2, 2, '2022-01-02 15:24:18', '2022-01-02 15:24:18'),
(3, 2, 3, 2, '2022-01-03 06:57:02', '2022-01-03 06:57:02'),
(4, 2, 4, 2, '2022-01-03 06:57:23', '2022-01-03 06:57:23'),
(5, 4, 5, 2, '2022-01-03 09:29:12', '2022-01-03 09:29:12'),
(6, 4, 6, 2, '2022-01-03 09:29:34', '2022-01-03 09:29:34'),
(7, 5, 7, 56, '2022-01-03 13:05:50', '2022-01-03 13:05:50'),
(8, 5, 8, 56, '2022-01-03 13:06:38', '2022-01-03 13:06:38'),
(9, 7, 9, 58, '2022-01-03 13:53:48', '2022-01-03 13:53:48'),
(10, 7, 10, 58, '2022-01-03 13:54:18', '2022-01-03 13:54:18'),
(11, 8, 11, 58, '2022-01-03 14:12:55', '2022-01-03 14:12:55'),
(12, 8, 12, 58, '2022-01-03 14:13:24', '2022-01-03 14:13:24'),
(13, 9, 13, 2, '2022-01-03 15:41:33', '2022-01-03 15:41:33'),
(14, 9, 14, 2, '2022-01-03 15:41:56', '2022-01-03 15:41:56'),
(15, 10, 15, 2, '2022-01-03 16:34:43', '2022-01-03 16:34:43'),
(16, 10, 16, 2, '2022-01-03 16:35:45', '2022-01-03 16:35:45'),
(17, 11, 17, 2, '2022-01-03 16:52:21', '2022-01-03 16:52:21'),
(18, 11, 18, 2, '2022-01-03 16:52:37', '2022-01-03 16:52:37'),
(19, 12, 19, 2, '2022-01-04 06:25:58', '2022-01-04 06:25:58'),
(20, 12, 20, 2, '2022-01-04 06:29:13', '2022-01-04 06:29:13'),
(21, 13, 21, 2, '2022-01-04 06:42:39', '2022-01-04 06:42:39'),
(22, 13, 22, 2, '2022-01-04 06:43:22', '2022-01-04 06:43:22'),
(23, 14, 23, 2, '2022-01-04 06:47:37', '2022-01-04 06:47:37'),
(24, 14, 24, 2, '2022-01-04 06:47:58', '2022-01-04 06:47:58'),
(25, 15, 25, 2, '2022-01-04 06:55:30', '2022-01-04 06:55:30'),
(26, 15, 26, 2, '2022-01-04 06:55:44', '2022-01-04 06:55:44'),
(27, 0, 27, 2, '2022-01-04 13:18:03', '2022-01-04 13:18:03'),
(28, 17, 28, 2, '2022-01-04 13:18:56', '2022-01-04 13:18:56'),
(29, 17, 29, 2, '2022-01-04 13:18:59', '2022-01-04 13:18:59'),
(30, 17, 30, 2, '2022-01-04 13:19:06', '2022-01-04 13:19:06'),
(31, 18, 31, 2, '2022-01-04 13:20:07', '2022-01-04 13:20:07'),
(32, 18, 32, 2, '2022-01-04 13:20:32', '2022-01-04 13:20:32'),
(33, 19, 33, 2, '2022-01-04 13:25:11', '2022-01-04 13:25:11'),
(34, 19, 34, 2, '2022-01-04 13:25:24', '2022-01-04 13:25:24'),
(35, 20, 35, 2, '2022-01-04 13:29:25', '2022-01-04 13:29:25'),
(36, 20, 36, 2, '2022-01-04 13:29:38', '2022-01-04 13:29:38'),
(37, 21, 37, 2, '2022-01-04 15:31:10', '2022-01-04 15:31:10'),
(38, 21, 38, 2, '2022-01-04 15:31:28', '2022-01-04 15:31:28'),
(39, 22, 39, 2, '2022-01-04 16:02:20', '2022-01-04 16:02:20'),
(40, 22, 40, 2, '2022-01-04 16:02:36', '2022-01-04 16:02:36'),
(41, 23, 41, 2, '2022-01-04 16:26:02', '2022-01-04 16:26:02'),
(42, 23, 42, 2, '2022-01-04 16:26:15', '2022-01-04 16:26:15'),
(43, 24, 43, 2, '2022-01-05 04:01:47', '2022-01-05 04:01:47'),
(44, 24, 44, 2, '2022-01-05 04:02:05', '2022-01-05 04:02:05'),
(45, 26, 45, 2, '2022-01-05 04:24:55', '2022-01-05 04:24:55'),
(46, 27, 46, 2, '2022-01-05 04:31:30', '2022-01-05 04:31:30'),
(47, 27, 47, 2, '2022-01-05 04:31:53', '2022-01-05 04:31:53'),
(48, 28, 48, 2, '2022-01-05 04:52:51', '2022-01-05 04:52:51'),
(49, 28, 49, 2, '2022-01-05 04:53:05', '2022-01-05 04:53:05'),
(50, 29, 50, 2, '2022-01-05 05:44:03', '2022-01-05 05:44:03'),
(51, 29, 51, 2, '2022-01-05 05:44:17', '2022-01-05 05:44:17'),
(52, 30, 52, 2, '2022-01-05 06:09:07', '2022-01-05 06:09:07'),
(53, 30, 53, 2, '2022-01-05 06:09:28', '2022-01-05 06:09:28'),
(54, 31, 54, 2, '2022-01-05 06:10:34', '2022-01-05 06:10:34'),
(55, 32, 55, 58, '2022-01-05 07:12:10', '2022-01-05 07:12:10'),
(56, 32, 56, 58, '2022-01-05 07:12:53', '2022-01-05 07:12:53'),
(57, 32, 57, 58, '2022-01-05 07:13:16', '2022-01-05 07:13:16'),
(58, 33, 58, 2, '2022-01-05 10:04:39', '2022-01-05 10:04:39'),
(59, 33, 59, 2, '2022-01-05 10:04:56', '2022-01-05 10:04:56'),
(60, 33, 60, 2, '2022-01-05 10:05:09', '2022-01-05 10:05:09'),
(61, 34, 61, 58, '2022-01-06 16:04:44', '2022-01-06 16:04:44'),
(62, 34, 62, 58, '2022-01-06 16:04:52', '2022-01-06 16:04:52'),
(63, 35, 63, 2, '2022-01-07 05:58:21', '2022-01-07 05:58:21'),
(64, 35, 64, 2, '2022-01-07 06:22:56', '2022-01-07 06:22:56'),
(65, 36, 65, 2, '2022-01-09 12:44:41', '2022-01-09 12:44:41'),
(66, 36, 66, 2, '2022-01-09 12:44:46', '2022-01-09 12:44:46'),
(67, 37, 67, 69, '2022-01-11 07:33:05', '2022-01-11 07:33:05'),
(68, 38, 68, 69, '2022-01-12 01:48:51', '2022-01-12 01:48:51'),
(69, 38, 69, 69, '2022-01-12 01:49:14', '2022-01-12 01:49:14'),
(70, 38, 70, 69, '2022-01-12 01:49:44', '2022-01-12 01:49:44'),
(71, 39, 71, 58, '2022-01-12 07:32:18', '2022-01-12 07:32:18'),
(72, 39, 72, 58, '2022-01-12 07:32:47', '2022-01-12 07:32:47'),
(73, 39, 73, 58, '2022-01-12 07:33:13', '2022-01-12 07:33:13'),
(74, 41, 74, 2, '2022-01-16 16:52:29', '2022-01-16 16:52:29'),
(75, 41, 75, 2, '2022-01-16 16:52:45', '2022-01-16 16:52:45'),
(76, 42, 76, 2, '2022-01-16 17:23:16', '2022-01-16 17:23:16'),
(77, 42, 77, 2, '2022-01-16 17:23:28', '2022-01-16 17:23:28'),
(78, 42, 78, 2, '2022-01-16 17:23:45', '2022-01-16 17:23:45'),
(79, 43, 79, 2, '2022-01-16 17:48:18', '2022-01-16 17:48:18'),
(80, 43, 80, 2, '2022-01-16 17:48:31', '2022-01-16 17:48:31'),
(81, 43, 81, 2, '2022-01-16 17:48:48', '2022-01-16 17:48:48'),
(82, 44, 82, 2, '2022-01-16 18:05:05', '2022-01-16 18:05:05'),
(83, 44, 83, 2, '2022-01-16 18:05:18', '2022-01-16 18:05:18'),
(84, 45, 84, 58, '2022-01-18 12:05:54', '2022-01-18 12:05:54'),
(85, 45, 85, 58, '2022-01-18 12:06:56', '2022-01-18 12:06:56'),
(86, 45, 86, 58, '2022-01-18 12:07:28', '2022-01-18 12:07:28'),
(87, 46, 87, 58, '2022-01-18 12:33:49', '2022-01-18 12:33:49'),
(88, 46, 88, 58, '2022-01-18 12:34:16', '2022-01-18 12:34:16'),
(89, 46, 89, 58, '2022-01-18 12:34:47', '2022-01-18 12:34:47'),
(90, 49, 90, 58, '2022-01-18 13:35:22', '2022-01-18 13:35:22'),
(91, 50, 91, 2, '2022-01-20 15:53:59', '2022-01-20 15:53:59'),
(92, 50, 92, 2, '2022-01-20 15:54:00', '2022-01-20 15:54:00'),
(93, 50, 93, 2, '2022-01-20 15:54:04', '2022-01-20 15:54:04'),
(94, 50, 94, 2, '2022-01-20 15:54:11', '2022-01-20 15:54:11'),
(95, 51, 95, 2, '2022-01-21 10:25:44', '2022-01-21 10:25:44'),
(96, 51, 96, 2, '2022-01-21 10:25:58', '2022-01-21 10:25:58'),
(97, 51, 97, 2, '2022-01-21 10:26:07', '2022-01-21 10:26:07'),
(98, 51, 98, 2, '2022-01-21 10:26:37', '2022-01-21 10:26:37');

-- --------------------------------------------------------

--
-- Table structure for table `system_notifications`
--

CREATE TABLE `system_notifications` (
  `id` int(10) NOT NULL,
  `message` text DEFAULT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `color` varchar(100) DEFAULT NULL,
  `heading` varchar(100) DEFAULT NULL,
  `subtext` varchar(100) DEFAULT NULL,
  `href` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `system_notifications`
--

INSERT INTO `system_notifications` (`id`, `message`, `icon`, `color`, `heading`, `subtext`, `href`, `created_at`, `updated_at`) VALUES
(1, 'a medical record has been created for you.', '', '', 'Patient Record', '', '/PatientRecordController/show/1?', '2022-01-02 15:22:28', '2022-01-02 15:22:28'),
(2, 'staff Cleaveland created record for Carla', '', '', 'Patient Record', '', '/PatientRecordController/show/1?', '2022-01-02 15:22:28', '2022-01-02 15:22:28'),
(3, 'your lab result is on its way.', '', '', 'Laboratory Result Request', '', '/LaboratoryRequestController/show/1?', '2022-01-02 15:26:53', '2022-01-02 15:26:53'),
(4, 'staff Cleaveland is requesting a lab-result for patient Carla', '', '', '', '', '', '2022-01-02 15:26:53', '2022-01-02 15:26:53'),
(5, 'Lab Result Is ready ,  patient Cleaveland has been classified as Mild by our system', '', '', '', '', '', '2022-01-02 15:27:23', '2022-01-02 15:27:23'),
(6, 'Lab Result Is ready ,  patient Cleaveland has been classified as Mild by our system', '', '', '', '', '', '2022-01-02 15:28:42', '2022-01-02 15:28:42'),
(7, 'Lab Result Is ready , your covid case is classified as severe', '', '', 'Doctors Classification', '', '/LaboratoryController/show/1?', '2022-01-02 15:28:42', '2022-01-02 15:28:42'),
(8, 'Lab Result Is ready ,  patient Cleaveland has been classified as  by Dr.', '', '', '', '', '', '2022-01-02 15:28:47', '2022-01-02 15:28:47'),
(9, 'Patient Carla has been deployed to  Home Quarantine , on 2022-01-02 By Staff Cleaveland', '', '', 'Hospital Deployment', '', '/DeploymentController/show/1?', '2022-01-02 15:30:36', '2022-01-02 15:30:36'),
(10, 'you are being deployed to Home Quarantine , on 2022-01-02', '', '', 'Hospital Deployment', '', '/DeploymentController/show/1?', '2022-01-02 15:30:36', '2022-01-02 15:30:36'),
(11, 'Patient  recovered. Home Quarantine Treatment', '', '', 'Hospital Deployment Released', '', '/DeploymentController/show/1?', '2022-01-02 15:30:51', '2022-01-02 15:30:51'),
(12, 'Congratulations for your recovery', '', '', 'Hospital Deployment Released', '', '/DeploymentController/show/1?', '2022-01-02 15:30:51', '2022-01-02 15:30:51'),
(13, 'a medical record has been created for you.', '', '', 'Patient Record', '', '/PatientRecordController/show/2?', '2022-01-03 06:56:31', '2022-01-03 06:56:31'),
(14, 'staff Cleaveland created record for Lyra', '', '', 'Patient Record', '', '/PatientRecordController/show/2?', '2022-01-03 06:56:31', '2022-01-03 06:56:31'),
(15, 'Patient Lyra has been deployed to  Home Quarantine , on 2022-01-03 By Staff Cleaveland', '', '', 'Hospital Deployment', '', '/DeploymentController/show/2?', '2022-01-03 08:28:02', '2022-01-03 08:28:02'),
(16, 'you are being deployed to Home Quarantine , on 2022-01-03', '', '', 'Hospital Deployment', '', '/DeploymentController/show/2?', '2022-01-03 08:28:02', '2022-01-03 08:28:02'),
(17, 'Patient  recovered. Home Quarantine Treatment', '', '', 'Hospital Deployment Released', '', '/DeploymentController/show/2?', '2022-01-03 08:28:38', '2022-01-03 08:28:38'),
(18, 'Congratulations for your recovery', '', '', 'Hospital Deployment Released', '', '/DeploymentController/show/2?', '2022-01-03 08:28:38', '2022-01-03 08:28:38'),
(19, 'a medical record has been created for you.', '', '', 'Patient Record', '', '/PatientRecordController/show/3?', '2022-01-03 08:45:04', '2022-01-03 08:45:04'),
(20, 'staff Cleaveland created record for Nolie', '', '', 'Patient Record', '', '/PatientRecordController/show/3?', '2022-01-03 08:45:04', '2022-01-03 08:45:04'),
(21, 'your lab result is on its way.', '', '', 'Laboratory Result Request', '', '/LaboratoryRequestController/show/2?', '2022-01-03 08:51:40', '2022-01-03 08:51:40'),
(22, 'staff Nar is requesting a lab-result for patient Nolie', '', '', '', '', '', '2022-01-03 08:51:40', '2022-01-03 08:51:40'),
(23, 'Lab Result Is ready ,  patient Nar has been classified as mild by our system', '', '', '', '', '', '2022-01-03 08:53:01', '2022-01-03 08:53:01'),
(24, 'Patient Nolie has been deployed to  Hospital(Chinese General Hospital) , on 2022-01-03 By Staff Cleaveland', '', '', 'Hospital Deployment', '', '/DeploymentController/show/3?', '2022-01-03 08:56:18', '2022-01-03 08:56:18'),
(25, 'you are being deployed to Hospital (Chinese General Hospital) for Quarantine and medications , on 2022-01-03', '', '', 'Hospital Deployment', '', '/DeploymentController/show/3?', '2022-01-03 08:56:18', '2022-01-03 08:56:18'),
(26, 'Patient  recovered. Hospital Quarantine Treatment', '', '', 'Hospital Deployment Released', '', '/DeploymentController/show/3?', '2022-01-03 08:58:56', '2022-01-03 08:58:56'),
(27, 'Congratulations for your recovery', '', '', 'Hospital Deployment Released', '', '/DeploymentController/show/3?', '2022-01-03 08:58:56', '2022-01-03 08:58:56'),
(28, 'Lab Result Is ready ,  patient Cleaveland has been classified as mild by our system', '', '', '', '', '', '2022-01-03 09:21:55', '2022-01-03 09:21:55'),
(29, 'Lab Result Is ready , your covid case is classified as severe', '', '', 'Doctors Classification', '', '/LaboratoryController/show/2?', '2022-01-03 09:21:55', '2022-01-03 09:21:55'),
(30, 'Lab Result Is ready ,  patient Cleaveland has been classified as  by Dr.', '', '', '', '', '', '2022-01-03 09:22:00', '2022-01-03 09:22:00'),
(31, 'a medical record has been created for you.', '', '', 'Patient Record', '', '/PatientRecordController/show/4?', '2022-01-03 09:28:58', '2022-01-03 09:28:58'),
(32, 'staff Cleaveland created record for Pas', '', '', 'Patient Record', '', '/PatientRecordController/show/4?', '2022-01-03 09:28:58', '2022-01-03 09:28:58'),
(33, 'your lab result is on its way.', '', '', 'Laboratory Result Request', '', '/LaboratoryRequestController/show/3?', '2022-01-03 09:30:05', '2022-01-03 09:30:05'),
(34, 'staff Cleaveland is requesting a lab-result for patient Pas', '', '', '', '', '', '2022-01-03 09:30:05', '2022-01-03 09:30:05'),
(35, 'Lab Result Is ready ,  patient Cleaveland has been classified as Mild by our system', '', '', '', '', '', '2022-01-03 09:31:03', '2022-01-03 09:31:03'),
(36, 'Lab Result Is ready ,  patient Cleaveland has been classified as Mild by our system', '', '', '', '', '', '2022-01-03 09:31:24', '2022-01-03 09:31:24'),
(37, 'Lab Result Is ready , your covid case is classified as severe', '', '', 'Doctors Classification', '', '/LaboratoryController/show/3?', '2022-01-03 09:31:24', '2022-01-03 09:31:24'),
(38, 'Lab Result Is ready ,  patient Cleaveland has been classified as  by Dr.', '', '', '', '', '', '2022-01-03 09:31:34', '2022-01-03 09:31:34'),
(39, 'Patient Pas has been deployed to  Hospital(Chinese General Hospital) , on 2022-01-03 By Staff Cleaveland', '', '', 'Hospital Deployment', '', '/DeploymentController/show/4?', '2022-01-03 09:33:05', '2022-01-03 09:33:05'),
(40, 'you are being deployed to Hospital (Chinese General Hospital) for Quarantine and medications , on 2022-01-03', '', '', 'Hospital Deployment', '', '/DeploymentController/show/4?', '2022-01-03 09:33:05', '2022-01-03 09:33:05'),
(41, 'a medical record has been created for you.', '', '', 'Patient Record', '', '/PatientRecordController/show/5?', '2022-01-03 13:05:25', '2022-01-03 13:05:25'),
(42, 'staff Ema created record for Mary', '', '', 'Patient Record', '', '/PatientRecordController/show/5?', '2022-01-03 13:05:25', '2022-01-03 13:05:25'),
(43, 'a medical record has been created for you.', '', '', 'Patient Record', '', '/PatientRecordController/show/6?', '2022-01-03 13:19:33', '2022-01-03 13:19:33'),
(44, 'staff Jay  created record for Mary', '', '', 'Patient Record', '', '/PatientRecordController/show/6?', '2022-01-03 13:19:33', '2022-01-03 13:19:33'),
(45, 'a medical record has been created for you.', '', '', 'Patient Record', '', '/PatientRecordController/show/7?', '2022-01-03 13:53:23', '2022-01-03 13:53:23'),
(46, 'staff Jay  created record for Lani', '', '', 'Patient Record', '', '/PatientRecordController/show/7?', '2022-01-03 13:53:23', '2022-01-03 13:53:23'),
(47, 'your lab result is on its way.', '', '', 'Laboratory Result Request', '', '/LaboratoryRequestController/show/4?', '2022-01-03 13:55:52', '2022-01-03 13:55:52'),
(48, 'staff Jay  is requesting a lab-result for patient Lani', '', '', '', '', '', '2022-01-03 13:55:52', '2022-01-03 13:55:52'),
(49, 'Lab Result Is ready ,  patient Jay  has been classified as Moderate by our system', '', '', '', '', '', '2022-01-03 13:59:12', '2022-01-03 13:59:12'),
(50, 'Lab Result Is ready ,  patient Jay  has been classified as Moderate by our system', '', '', '', '', '', '2022-01-03 14:00:09', '2022-01-03 14:00:09'),
(51, 'Lab Result Is ready , your covid case is classified as severe', '', '', 'Doctors Classification', '', '/LaboratoryController/show/4?', '2022-01-03 14:00:09', '2022-01-03 14:00:09'),
(52, 'Lab Result Is ready ,  patient Jay  has been classified as  by Dr.', '', '', '', '', '', '2022-01-03 14:00:14', '2022-01-03 14:00:14'),
(53, 'Patient Lani has been deployed to  Hospital(Chinese General Hospital) , on 2022-01-03 By Staff Jay ', '', '', 'Hospital Deployment', '', '/DeploymentController/show/5?', '2022-01-03 14:04:08', '2022-01-03 14:04:08'),
(54, 'you are being deployed to Hospital (Chinese General Hospital) for Quarantine and medications , on 2022-01-03', '', '', 'Hospital Deployment', '', '/DeploymentController/show/5?', '2022-01-03 14:04:08', '2022-01-03 14:04:08'),
(55, 'Patient  recovered. Hospital Quarantine Treatment', '', '', 'Hospital Deployment Released', '', '/DeploymentController/show/5?', '2022-01-03 14:08:38', '2022-01-03 14:08:38'),
(56, 'Congratulations for your recovery', '', '', 'Hospital Deployment Released', '', '/DeploymentController/show/5?', '2022-01-03 14:08:38', '2022-01-03 14:08:38'),
(57, 'a medical record has been created for you.', '', '', 'Patient Record', '', '/PatientRecordController/show/8?', '2022-01-03 14:12:34', '2022-01-03 14:12:34'),
(58, 'staff Jay  created record for Marie Rose', '', '', 'Patient Record', '', '/PatientRecordController/show/8?', '2022-01-03 14:12:34', '2022-01-03 14:12:34'),
(59, 'your lab result is on its way.', '', '', 'Laboratory Result Request', '', '/LaboratoryRequestController/show/5?', '2022-01-03 14:14:01', '2022-01-03 14:14:01'),
(60, 'staff Jay  is requesting a lab-result for patient Marie Rose', '', '', '', '', '', '2022-01-03 14:14:01', '2022-01-03 14:14:01'),
(61, 'Lab Result Is ready ,  patient Jay  has been classified as Moderate by our system', '', '', '', '', '', '2022-01-03 14:15:37', '2022-01-03 14:15:37'),
(62, 'Lab Result Is ready ,  patient Jay  has been classified as Moderate by our system', '', '', '', '', '', '2022-01-03 14:16:17', '2022-01-03 14:16:17'),
(63, 'Lab Result Is ready , your covid case is classified as mild', '', '', 'Doctors Classification', '', '/LaboratoryController/show/5?', '2022-01-03 14:16:17', '2022-01-03 14:16:17'),
(64, 'Lab Result Is ready ,  patient Jay  has been classified as  by Dr.', '', '', '', '', '', '2022-01-03 14:16:22', '2022-01-03 14:16:22'),
(65, 'Patient Marie Rose has been deployed to  Home Quarantine , on 2022-01-03 By Staff Jay ', '', '', 'Hospital Deployment', '', '/DeploymentController/show/6?', '2022-01-03 14:17:26', '2022-01-03 14:17:26'),
(66, 'you are being deployed to Home Quarantine , on 2022-01-03', '', '', 'Hospital Deployment', '', '/DeploymentController/show/6?', '2022-01-03 14:17:26', '2022-01-03 14:17:26'),
(67, 'Patient  recovered. Home Quarantine Treatment', '', '', 'Hospital Deployment Released', '', '/DeploymentController/show/6?', '2022-01-03 14:27:40', '2022-01-03 14:27:40'),
(68, 'Congratulations for your recovery', '', '', 'Hospital Deployment Released', '', '/DeploymentController/show/6?', '2022-01-03 14:27:40', '2022-01-03 14:27:40'),
(69, 'a medical record has been created for you.', '', '', 'Patient Record', '', '/PatientRecordController/show/9?', '2022-01-03 15:37:15', '2022-01-03 15:37:15'),
(70, 'staff Cleaveland created record for Lani', '', '', 'Patient Record', '', '/PatientRecordController/show/9?', '2022-01-03 15:37:15', '2022-01-03 15:37:15'),
(71, 'your lab result is on its way.', '', '', 'Laboratory Result Request', '', '/LaboratoryRequestController/show/6?', '2022-01-03 15:45:23', '2022-01-03 15:45:23'),
(72, 'staff Cleaveland is requesting a lab-result for patient Lani', '', '', '', '', '', '2022-01-03 15:45:23', '2022-01-03 15:45:23'),
(73, 'Lab Result Is ready ,  patient Cleaveland has been classified as Moderate by our system', '', '', '', '', '', '2022-01-03 15:46:42', '2022-01-03 15:46:42'),
(74, 'a medical record has been created for you.', '', '', 'Patient Record', '', '/PatientRecordController/show/10?', '2022-01-03 16:34:33', '2022-01-03 16:34:33'),
(75, 'staff Cleaveland created record for Mary', '', '', 'Patient Record', '', '/PatientRecordController/show/10?', '2022-01-03 16:34:33', '2022-01-03 16:34:33'),
(76, 'your lab result is on its way.', '', '', 'Laboratory Result Request', '', '/LaboratoryRequestController/show/7?', '2022-01-03 16:45:52', '2022-01-03 16:45:52'),
(77, 'staff Cleaveland is requesting a lab-result for patient Mary', '', '', '', '', '', '2022-01-03 16:45:52', '2022-01-03 16:45:52'),
(78, 'Lab Result Is ready ,  patient Cleaveland has been classified as Moderate by our system', '', '', '', '', '', '2022-01-03 16:46:59', '2022-01-03 16:46:59'),
(79, 'a medical record has been created for you.', '', '', 'Patient Record', '', '/PatientRecordController/show/11?', '2022-01-03 16:52:12', '2022-01-03 16:52:12'),
(80, 'staff Cleaveland created record for Mary', '', '', 'Patient Record', '', '/PatientRecordController/show/11?', '2022-01-03 16:52:12', '2022-01-03 16:52:12'),
(81, 'your lab result is on its way.', '', '', 'Laboratory Result Request', '', '/LaboratoryRequestController/show/8?', '2022-01-03 16:54:12', '2022-01-03 16:54:12'),
(82, 'staff Cleaveland is requesting a lab-result for patient Mary', '', '', '', '', '', '2022-01-03 16:54:12', '2022-01-03 16:54:12'),
(83, 'Lab Result Is ready ,  patient Cleaveland has been classified as Severe by our system', '', '', '', '', '', '2022-01-03 16:54:59', '2022-01-03 16:54:59'),
(84, 'a medical record has been created for you.', '', '', 'Patient Record', '', '/PatientRecordController/show/12?', '2022-01-04 06:25:19', '2022-01-04 06:25:19'),
(85, 'staff Cleaveland created record for Marie Rose', '', '', 'Patient Record', '', '/PatientRecordController/show/12?', '2022-01-04 06:25:19', '2022-01-04 06:25:19'),
(86, 'your lab result is on its way.', '', '', 'Laboratory Result Request', '', '/LaboratoryRequestController/show/9?', '2022-01-04 06:31:16', '2022-01-04 06:31:16'),
(87, 'staff Cleaveland is requesting a lab-result for patient Marie Rose', '', '', '', '', '', '2022-01-04 06:31:16', '2022-01-04 06:31:16'),
(88, 'Lab Result Is ready ,  patient Cleaveland has been classified as Severe by our system', '', '', '', '', '', '2022-01-04 06:32:44', '2022-01-04 06:32:44'),
(89, 'a medical record has been created for you.', '', '', 'Patient Record', '', '/PatientRecordController/show/13?', '2022-01-04 06:42:30', '2022-01-04 06:42:30'),
(90, 'staff Cleaveland created record for Pas', '', '', 'Patient Record', '', '/PatientRecordController/show/13?', '2022-01-04 06:42:30', '2022-01-04 06:42:30'),
(91, 'your lab result is on its way.', '', '', 'Laboratory Result Request', '', '/LaboratoryRequestController/show/10?', '2022-01-04 06:45:00', '2022-01-04 06:45:00'),
(92, 'staff Cleaveland is requesting a lab-result for patient Pas', '', '', '', '', '', '2022-01-04 06:45:00', '2022-01-04 06:45:00'),
(93, 'Lab Result Is ready ,  patient Cleaveland has been classified as Mild by our system', '', '', '', '', '', '2022-01-04 06:46:26', '2022-01-04 06:46:26'),
(94, 'a medical record has been created for you.', '', '', 'Patient Record', '', '/PatientRecordController/show/14?', '2022-01-04 06:47:26', '2022-01-04 06:47:26'),
(95, 'staff Cleaveland created record for Mary', '', '', 'Patient Record', '', '/PatientRecordController/show/14?', '2022-01-04 06:47:26', '2022-01-04 06:47:26'),
(96, 'your lab result is on its way.', '', '', 'Laboratory Result Request', '', '/LaboratoryRequestController/show/11?', '2022-01-04 06:49:58', '2022-01-04 06:49:58'),
(97, 'staff Cleaveland is requesting a lab-result for patient Mary', '', '', '', '', '', '2022-01-04 06:49:58', '2022-01-04 06:49:58'),
(98, 'Lab Result Is ready ,  patient Cleaveland has been classified as Mild by our system', '', '', '', '', '', '2022-01-04 06:51:28', '2022-01-04 06:51:28'),
(99, 'Lab Result Is ready ,  patient Cleaveland has been classified as Mild by our system', '', '', '', '', '', '2022-01-04 06:53:55', '2022-01-04 06:53:55'),
(100, 'a medical record has been created for you.', '', '', 'Patient Record', '', '/PatientRecordController/show/15?', '2022-01-04 06:55:22', '2022-01-04 06:55:22'),
(101, 'staff Cleaveland created record for Marie Rose', '', '', 'Patient Record', '', '/PatientRecordController/show/15?', '2022-01-04 06:55:22', '2022-01-04 06:55:22'),
(102, 'your lab result is on its way.', '', '', 'Laboratory Result Request', '', '/LaboratoryRequestController/show/12?', '2022-01-04 06:56:04', '2022-01-04 06:56:04'),
(103, 'staff Cleaveland is requesting a lab-result for patient Marie Rose', '', '', '', '', '', '2022-01-04 06:56:04', '2022-01-04 06:56:04'),
(104, 'Lab Result Is ready ,  patient Cleaveland has been classified as Mildwew by our system', '', '', '', '', '', '2022-01-04 06:56:35', '2022-01-04 06:56:35'),
(105, 'a medical record has been created for you.', '', '', 'Patient Record', '', '/PatientRecordController/show/16?', '2022-01-04 13:17:25', '2022-01-04 13:17:25'),
(106, 'staff Cleaveland created record for Mary', '', '', 'Patient Record', '', '/PatientRecordController/show/16?', '2022-01-04 13:17:25', '2022-01-04 13:17:25'),
(107, 'a medical record has been created for you.', '', '', 'Patient Record', '', '/PatientRecordController/show/17?', '2022-01-04 13:18:47', '2022-01-04 13:18:47'),
(108, 'staff Cleaveland created record for Mary', '', '', 'Patient Record', '', '/PatientRecordController/show/17?', '2022-01-04 13:18:47', '2022-01-04 13:18:47'),
(109, 'a medical record has been created for you.', '', '', 'Patient Record', '', '/PatientRecordController/show/18?', '2022-01-04 13:19:56', '2022-01-04 13:19:56'),
(110, 'staff Cleaveland created record for Marie Rose', '', '', 'Patient Record', '', '/PatientRecordController/show/18?', '2022-01-04 13:19:56', '2022-01-04 13:19:56'),
(111, 'your lab result is on its way.', '', '', 'Laboratory Result Request', '', '/LaboratoryRequestController/show/13?', '2022-01-04 13:22:46', '2022-01-04 13:22:46'),
(112, 'staff Cleaveland is requesting a lab-result for patient Marie Rose', '', '', '', '', '', '2022-01-04 13:22:46', '2022-01-04 13:22:46'),
(113, 'Lab Result Is ready ,  patient Cleaveland has been classified as Severe by our system', '', '', '', '', '', '2022-01-04 13:23:54', '2022-01-04 13:23:54'),
(114, 'a medical record has been created for you.', '', '', 'Patient Record', '', '/PatientRecordController/show/19?', '2022-01-04 13:25:05', '2022-01-04 13:25:05'),
(115, 'staff Cleaveland created record for Marie Rose', '', '', 'Patient Record', '', '/PatientRecordController/show/19?', '2022-01-04 13:25:05', '2022-01-04 13:25:05'),
(116, 'your lab result is on its way.', '', '', 'Laboratory Result Request', '', '/LaboratoryRequestController/show/14?', '2022-01-04 13:25:59', '2022-01-04 13:25:59'),
(117, 'staff Cleaveland is requesting a lab-result for patient Marie Rose', '', '', '', '', '', '2022-01-04 13:25:59', '2022-01-04 13:25:59'),
(118, 'Lab Result Is ready ,  patient Cleaveland has been classified as Moderate by our system', '', '', '', '', '', '2022-01-04 13:26:33', '2022-01-04 13:26:33'),
(119, 'a medical record has been created for you.', '', '', 'Patient Record', '', '/PatientRecordController/show/20?', '2022-01-04 13:29:19', '2022-01-04 13:29:19'),
(120, 'staff Cleaveland created record for Mary', '', '', 'Patient Record', '', '/PatientRecordController/show/20?', '2022-01-04 13:29:19', '2022-01-04 13:29:19'),
(121, 'your lab result is on its way.', '', '', 'Laboratory Result Request', '', '/LaboratoryRequestController/show/15?', '2022-01-04 13:30:50', '2022-01-04 13:30:50'),
(122, 'staff Cleaveland is requesting a lab-result for patient Mary', '', '', '', '', '', '2022-01-04 13:30:50', '2022-01-04 13:30:50'),
(123, 'Lab Result Is ready ,  patient Cleaveland has been classified as Moderate by our system', '', '', '', '', '', '2022-01-04 13:31:32', '2022-01-04 13:31:32'),
(124, 'Patient  recovered. Hospital Quarantine Treatment', '', '', 'Hospital Deployment Released', '', '/DeploymentController/show/4?', '2022-01-04 14:40:35', '2022-01-04 14:40:35'),
(125, 'Congratulations for your recovery', '', '', 'Hospital Deployment Released', '', '/DeploymentController/show/4?', '2022-01-04 14:40:35', '2022-01-04 14:40:35'),
(126, 'a medical record has been created for you.', '', '', 'Patient Record', '', '/PatientRecordController/show/21?', '2022-01-04 15:30:53', '2022-01-04 15:30:53'),
(127, 'staff Cleaveland created record for Pas', '', '', 'Patient Record', '', '/PatientRecordController/show/21?', '2022-01-04 15:30:53', '2022-01-04 15:30:53'),
(128, 'your lab result is on its way.', '', '', 'Laboratory Result Request', '', '/LaboratoryRequestController/show/16?', '2022-01-04 15:35:56', '2022-01-04 15:35:56'),
(129, 'staff Cleaveland is requesting a lab-result for patient Pas', '', '', '', '', '', '2022-01-04 15:35:56', '2022-01-04 15:35:56'),
(130, 'Lab Result Is ready ,  patient Cleaveland has been classified as Critical by our system', '', '', '', '', '', '2022-01-04 15:38:03', '2022-01-04 15:38:03'),
(131, 'Lab Result Is ready ,  patient Cleaveland has been classified as Critical by our system', '', '', '', '', '', '2022-01-04 15:51:10', '2022-01-04 15:51:10'),
(132, 'Lab Result Is ready , your covid case is classified as severe', '', '', 'Doctors Classification', '', '/LaboratoryController/show/17?', '2022-01-04 15:51:10', '2022-01-04 15:51:10'),
(133, 'Lab Result Is ready ,  patient Cleaveland has been classified as  by Dr.', '', '', '', '', '', '2022-01-04 15:51:16', '2022-01-04 15:51:16'),
(134, 'Patient Pas has been deployed to  Hospital(St. Lukes Medical Center) , on 2022-01-04 By Staff Cleaveland', '', '', 'Hospital Deployment', '', '/DeploymentController/show/7?', '2022-01-04 15:53:06', '2022-01-04 15:53:06'),
(135, 'you are being deployed to Hospital (St. Lukes Medical Center) for Quarantine and medications , on 2022-01-04', '', '', 'Hospital Deployment', '', '/DeploymentController/show/7?', '2022-01-04 15:53:06', '2022-01-04 15:53:06'),
(136, 'Patient  recovered. Hospital Quarantine Treatment', '', '', 'Hospital Deployment Released', '', '/DeploymentController/show/7?', '2022-01-04 15:56:08', '2022-01-04 15:56:08'),
(137, 'Congratulations for your recovery', '', '', 'Hospital Deployment Released', '', '/DeploymentController/show/7?', '2022-01-04 15:56:08', '2022-01-04 15:56:08'),
(138, 'a medical record has been created for you.', '', '', 'Patient Record', '', '/PatientRecordController/show/22?', '2022-01-04 16:02:04', '2022-01-04 16:02:04'),
(139, 'staff Cleaveland created record for Hannah', '', '', 'Patient Record', '', '/PatientRecordController/show/22?', '2022-01-04 16:02:04', '2022-01-04 16:02:04'),
(140, 'your lab result is on its way.', '', '', 'Laboratory Result Request', '', '/LaboratoryRequestController/show/17?', '2022-01-04 16:05:43', '2022-01-04 16:05:43'),
(141, 'staff Cleaveland is requesting a lab-result for patient Hannah', '', '', '', '', '', '2022-01-04 16:05:43', '2022-01-04 16:05:43'),
(142, 'Lab Result Is ready ,  patient Cleaveland has been classified as Severe by our system', '', '', '', '', '', '2022-01-04 16:06:57', '2022-01-04 16:06:57'),
(143, 'Lab Result Is ready ,  patient Cleaveland has been classified as Severe by our system', '', '', '', '', '', '2022-01-04 16:07:26', '2022-01-04 16:07:26'),
(144, 'Lab Result Is ready , your covid case is classified as mild', '', '', 'Doctors Classification', '', '/LaboratoryController/show/18?', '2022-01-04 16:07:26', '2022-01-04 16:07:26'),
(145, 'Lab Result Is ready ,  patient Cleaveland has been classified as  by Dr.', '', '', '', '', '', '2022-01-04 16:07:31', '2022-01-04 16:07:31'),
(146, 'Patient Hannah has been deployed to  Home Quarantine , on 2022-01-05 By Staff Cleaveland', '', '', 'Hospital Deployment', '', '/DeploymentController/show/8?', '2022-01-04 16:08:16', '2022-01-04 16:08:16'),
(147, 'you are being deployed to Home Quarantine , on 2022-01-05', '', '', 'Hospital Deployment', '', '/DeploymentController/show/8?', '2022-01-04 16:08:16', '2022-01-04 16:08:16'),
(148, 'Patient  recovered. Home Quarantine Treatment', '', '', 'Hospital Deployment Released', '', '/DeploymentController/show/8?', '2022-01-04 16:19:00', '2022-01-04 16:19:00'),
(149, 'Congratulations for your recovery', '', '', 'Hospital Deployment Released', '', '/DeploymentController/show/8?', '2022-01-04 16:19:00', '2022-01-04 16:19:00'),
(150, 'a medical record has been created for you.', '', '', 'Patient Record', '', '/PatientRecordController/show/23?', '2022-01-04 16:25:40', '2022-01-04 16:25:40'),
(151, 'staff Cleaveland created record for Miguel', '', '', 'Patient Record', '', '/PatientRecordController/show/23?', '2022-01-04 16:25:40', '2022-01-04 16:25:40'),
(152, 'your lab result is on its way.', '', '', 'Laboratory Result Request', '', '/LaboratoryRequestController/show/18?', '2022-01-04 16:28:42', '2022-01-04 16:28:42'),
(153, 'staff Cleaveland is requesting a lab-result for patient Miguel', '', '', '', '', '', '2022-01-04 16:28:42', '2022-01-04 16:28:42'),
(154, 'Lab Result Is ready ,  patient Cleaveland has been classified as Severe by our system', '', '', '', '', '', '2022-01-04 16:29:51', '2022-01-04 16:29:51'),
(155, 'Lab Result Is ready ,  patient Cleaveland has been classified as Severe by our system', '', '', '', '', '', '2022-01-04 16:30:12', '2022-01-04 16:30:12'),
(156, 'Lab Result Is ready , your covid case is classified as mild', '', '', 'Doctors Classification', '', '/LaboratoryController/show/19?', '2022-01-04 16:30:12', '2022-01-04 16:30:12'),
(157, 'Lab Result Is ready ,  patient Cleaveland has been classified as  by Dr.', '', '', '', '', '', '2022-01-04 16:30:13', '2022-01-04 16:30:13'),
(158, 'Patient Miguel has been deployed to  Home Quarantine , on 2022-01-05 By Staff Cleaveland', '', '', 'Hospital Deployment', '', '/DeploymentController/show/9?', '2022-01-05 01:55:06', '2022-01-05 01:55:06'),
(159, 'you are being deployed to Home Quarantine , on 2022-01-05', '', '', 'Hospital Deployment', '', '/DeploymentController/show/9?', '2022-01-05 01:55:06', '2022-01-05 01:55:06'),
(160, 'Patient  recovered. Home Quarantine Treatment', '', '', 'Hospital Deployment Released', '', '/DeploymentController/show/9?', '2022-01-05 03:40:52', '2022-01-05 03:40:52'),
(161, 'Congratulations for your recovery', '', '', 'Hospital Deployment Released', '', '/DeploymentController/show/9?', '2022-01-05 03:40:52', '2022-01-05 03:40:52'),
(162, 'a medical record has been created for you.', '', '', 'Patient Record', '', '/PatientRecordController/show/24?', '2022-01-05 04:00:51', '2022-01-05 04:00:51'),
(163, 'staff Cleaveland created record for Miguel', '', '', 'Patient Record', '', '/PatientRecordController/show/24?', '2022-01-05 04:00:51', '2022-01-05 04:00:51'),
(164, 'your lab result is on its way.', '', '', 'Laboratory Result Request', '', '/LaboratoryRequestController/show/19?', '2022-01-05 04:02:39', '2022-01-05 04:02:39'),
(165, 'staff Cleaveland is requesting a lab-result for patient Miguel', '', '', '', '', '', '2022-01-05 04:02:39', '2022-01-05 04:02:39'),
(166, 'Lab Result Is ready ,  patient Cleaveland has been classified as Mild by our system', '', '', '', '', '', '2022-01-05 04:03:32', '2022-01-05 04:03:32'),
(167, 'Lab Result Is ready ,  patient Cleaveland has been classified as Mild by our system', '', '', '', '', '', '2022-01-05 04:13:32', '2022-01-05 04:13:32'),
(168, 'Lab Result Is ready , your covid case is classified as mild', '', '', 'Doctors Classification', '', '/LaboratoryController/show/20?', '2022-01-05 04:13:32', '2022-01-05 04:13:32'),
(169, 'Lab Result Is ready ,  patient Cleaveland has been classified as  by Dr.', '', '', '', '', '', '2022-01-05 04:13:33', '2022-01-05 04:13:33'),
(170, 'Lab Result Is ready ,  patient Cleaveland has been classified as Mild by our system', '', '', '', '', '', '2022-01-05 04:13:56', '2022-01-05 04:13:56'),
(171, 'Lab Result Is ready , your covid case is classified as mild', '', '', 'Doctors Classification', '', '/LaboratoryController/show/20?', '2022-01-05 04:13:56', '2022-01-05 04:13:56'),
(172, 'Lab Result Is ready ,  patient Cleaveland has been classified as  by Dr.', '', '', '', '', '', '2022-01-05 04:13:56', '2022-01-05 04:13:56'),
(173, 'Lab Result Is ready ,  patient Cleaveland has been classified as Mild by our system', '', '', '', '', '', '2022-01-05 04:15:01', '2022-01-05 04:15:01'),
(174, 'Lab Result Is ready , your covid case is classified as mild', '', '', 'Doctors Classification', '', '/LaboratoryController/show/20?', '2022-01-05 04:15:01', '2022-01-05 04:15:01'),
(175, 'Lab Result Is ready ,  patient Cleaveland has been classified as  by Dr.', '', '', '', '', '', '2022-01-05 04:15:01', '2022-01-05 04:15:01'),
(176, 'Lab Result Is ready ,  patient Cleaveland has been classified as Mild by our system', '', '', '', '', '', '2022-01-05 04:15:21', '2022-01-05 04:15:21'),
(177, 'Lab Result Is ready , your covid case is classified as mild', '', '', 'Doctors Classification', '', '/LaboratoryController/show/20?', '2022-01-05 04:15:21', '2022-01-05 04:15:21'),
(178, 'Lab Result Is ready ,  patient Cleaveland has been classified as  by Dr.', '', '', '', '', '', '2022-01-05 04:15:21', '2022-01-05 04:15:21'),
(179, 'Lab Result Is ready ,  patient Cleaveland has been classified as Mild by our system', '', '', '', '', '', '2022-01-05 04:15:52', '2022-01-05 04:15:52'),
(180, 'Lab Result Is ready , your covid case is classified as mild', '', '', 'Doctors Classification', '', '/LaboratoryController/show/20?', '2022-01-05 04:15:52', '2022-01-05 04:15:52'),
(181, 'Lab Result Is ready ,  patient Cleaveland has been classified as  by Dr.', '', '', '', '', '', '2022-01-05 04:15:52', '2022-01-05 04:15:52'),
(182, 'Lab Result Is ready ,  patient Cleaveland has been classified as Mild by our system', '', '', '', '', '', '2022-01-05 04:16:10', '2022-01-05 04:16:10'),
(183, 'Lab Result Is ready , your covid case is classified as mild', '', '', 'Doctors Classification', '', '/LaboratoryController/show/20?', '2022-01-05 04:16:10', '2022-01-05 04:16:10'),
(184, 'Lab Result Is ready ,  patient Cleaveland has been classified as  by Dr.', '', '', '', '', '', '2022-01-05 04:16:11', '2022-01-05 04:16:11'),
(185, 'a medical record has been created for you.', '', '', 'Patient Record', '', '/PatientRecordController/show/25?', '2022-01-05 04:23:35', '2022-01-05 04:23:35'),
(186, 'staff Cleaveland created record for Pas', '', '', 'Patient Record', '', '/PatientRecordController/show/25?', '2022-01-05 04:23:35', '2022-01-05 04:23:35'),
(187, 'a medical record has been created for you.', '', '', 'Patient Record', '', '/PatientRecordController/show/26?', '2022-01-05 04:24:41', '2022-01-05 04:24:41'),
(188, 'staff Cleaveland created record for Pas', '', '', 'Patient Record', '', '/PatientRecordController/show/26?', '2022-01-05 04:24:41', '2022-01-05 04:24:41'),
(189, 'a medical record has been created for you.', '', '', 'Patient Record', '', '/PatientRecordController/show/27?', '2022-01-05 04:30:47', '2022-01-05 04:30:47'),
(190, 'staff Cleaveland created record for Pas', '', '', 'Patient Record', '', '/PatientRecordController/show/27?', '2022-01-05 04:30:47', '2022-01-05 04:30:47'),
(191, 'your lab result is on its way.', '', '', 'Laboratory Result Request', '', '/LaboratoryRequestController/show/20?', '2022-01-05 04:32:49', '2022-01-05 04:32:49'),
(192, 'staff Cleaveland is requesting a lab-result for patient Pas', '', '', '', '', '', '2022-01-05 04:32:49', '2022-01-05 04:32:49'),
(193, 'Lab Result Is ready ,  patient Cleaveland has been classified as Mild by our system', '', '', '', '', '', '2022-01-05 04:33:56', '2022-01-05 04:33:56'),
(194, 'a medical record has been created for you.', '', '', 'Patient Record', '', '/PatientRecordController/show/28?', '2022-01-05 04:52:34', '2022-01-05 04:52:34'),
(195, 'staff Cleaveland created record for Donald', '', '', 'Patient Record', '', '/PatientRecordController/show/28?', '2022-01-05 04:52:34', '2022-01-05 04:52:34'),
(196, 'your lab result is on its way.', '', '', 'Laboratory Result Request', '', '/LaboratoryRequestController/show/21?', '2022-01-05 04:54:37', '2022-01-05 04:54:37'),
(197, 'staff Cleaveland is requesting a lab-result for patient Donald', '', '', '', '', '', '2022-01-05 04:54:37', '2022-01-05 04:54:37'),
(198, 'Lab Result Is ready ,  patient Cleaveland has been classified as Mild by our system', '', '', '', '', '', '2022-01-05 04:57:20', '2022-01-05 04:57:20'),
(199, 'Lab Result Is ready ,  patient Cleaveland has been classified as Mild by our system', '', '', '', '', '', '2022-01-05 05:00:05', '2022-01-05 05:00:05'),
(200, 'Lab Result Is ready , your covid case is classified as moderate', '', '', 'Doctors Classification', '', '/LaboratoryController/show/22?', '2022-01-05 05:00:05', '2022-01-05 05:00:05'),
(201, 'Lab Result Is ready ,  patient Cleaveland has been classified as  by Dr.', '', '', '', '', '', '2022-01-05 05:00:05', '2022-01-05 05:00:05'),
(202, 'Lab Result Is ready ,  patient Cleaveland has been classified as Mild by our system', '', '', '', '', '', '2022-01-05 05:01:51', '2022-01-05 05:01:51'),
(203, 'Lab Result Is ready , your covid case is classified as moderate', '', '', 'Doctors Classification', '', '/LaboratoryController/show/22?', '2022-01-05 05:01:51', '2022-01-05 05:01:51'),
(204, 'Lab Result Is ready ,  patient Cleaveland has been classified as  by Dr.', '', '', '', '', '', '2022-01-05 05:01:52', '2022-01-05 05:01:52'),
(205, 'a medical record has been created for you.', '', '', 'Patient Record', '', '/PatientRecordController/show/29?', '2022-01-05 05:43:48', '2022-01-05 05:43:48'),
(206, 'staff Cleaveland created record for Donald', '', '', 'Patient Record', '', '/PatientRecordController/show/29?', '2022-01-05 05:43:48', '2022-01-05 05:43:48'),
(207, 'a medical record has been created for you.', '', '', 'Patient Record', '', '/PatientRecordController/show/30?', '2022-01-05 06:08:58', '2022-01-05 06:08:58'),
(208, 'staff Cleaveland created record for Miguel', '', '', 'Patient Record', '', '/PatientRecordController/show/30?', '2022-01-05 06:08:58', '2022-01-05 06:08:58'),
(209, 'a medical record has been created for you.', '', '', 'Patient Record', '', '/PatientRecordController/show/31?', '2022-01-05 06:10:16', '2022-01-05 06:10:16'),
(210, 'staff Cleaveland created record for Miguel', '', '', 'Patient Record', '', '/PatientRecordController/show/31?', '2022-01-05 06:10:16', '2022-01-05 06:10:16'),
(211, 'your lab result is on its way.', '', '', 'Laboratory Result Request', '', '/LaboratoryRequestController/show/22?', '2022-01-05 06:10:38', '2022-01-05 06:10:38'),
(212, 'staff Cleaveland is requesting a lab-result for patient Miguel', '', '', '', '', '', '2022-01-05 06:10:38', '2022-01-05 06:10:38'),
(213, 'your lab result is on its way.', '', '', 'Laboratory Result Request', '', '/LaboratoryRequestController/show/23?', '2022-01-05 06:11:21', '2022-01-05 06:11:21'),
(214, 'staff Cleaveland is requesting a lab-result for patient Donald', '', '', '', '', '', '2022-01-05 06:11:21', '2022-01-05 06:11:21'),
(215, 'Lab Result Is ready ,  patient Cleaveland has been classified as Mild by our system', '', '', '', '', '', '2022-01-05 06:11:31', '2022-01-05 06:11:31'),
(216, 'Lab Result Is ready ,  patient Cleaveland has been classified as Mild by our system', '', '', '', '', '', '2022-01-05 06:12:43', '2022-01-05 06:12:43'),
(217, 'Lab Result Is ready , your covid case is classified as mild', '', '', 'Doctors Classification', '', '/LaboratoryController/show/23?', '2022-01-05 06:12:43', '2022-01-05 06:12:43'),
(218, 'Lab Result Is ready ,  patient Cleaveland has been classified as  by Dr.', '', '', '', '', '', '2022-01-05 06:12:43', '2022-01-05 06:12:43'),
(219, 'Lab Result Is ready ,  patient Cleaveland has been classified as mild by our system', '', '', '', '', '', '2022-01-05 06:12:54', '2022-01-05 06:12:54'),
(220, 'Lab Result Is ready ,  patient Cleaveland has been classified as mild by our system', '', '', '', '', '', '2022-01-05 06:13:20', '2022-01-05 06:13:20'),
(221, 'Lab Result Is ready , your covid case is classified as mild', '', '', 'Doctors Classification', '', '/LaboratoryController/show/24?', '2022-01-05 06:13:20', '2022-01-05 06:13:20'),
(222, 'Lab Result Is ready ,  patient Cleaveland has been classified as  by Dr.', '', '', '', '', '', '2022-01-05 06:13:20', '2022-01-05 06:13:20'),
(223, 'Lab Result Is ready ,  patient Cleaveland has been classified as Mild by our system', '', '', '', '', '', '2022-01-05 06:13:57', '2022-01-05 06:13:57'),
(224, 'Lab Result Is ready , your covid case is classified as mild', '', '', 'Doctors Classification', '', '/LaboratoryController/show/23?', '2022-01-05 06:13:57', '2022-01-05 06:13:57'),
(225, 'Lab Result Is ready ,  patient Cleaveland has been classified as  by Dr.', '', '', '', '', '', '2022-01-05 06:13:57', '2022-01-05 06:13:57'),
(226, 'a medical record has been created for you.', '', '', 'Patient Record', '', '/PatientRecordController/show/32?', '2022-01-05 07:11:47', '2022-01-05 07:11:47'),
(227, 'staff Jay  created record for Carlex Rol', '', '', 'Patient Record', '', '/PatientRecordController/show/32?', '2022-01-05 07:11:47', '2022-01-05 07:11:47'),
(228, 'your lab result is on its way.', '', '', 'Laboratory Result Request', '', '/LaboratoryRequestController/show/24?', '2022-01-05 07:15:06', '2022-01-05 07:15:06'),
(229, 'staff Jay  is requesting a lab-result for patient Carlex Rol', '', '', '', '', '', '2022-01-05 07:15:06', '2022-01-05 07:15:06'),
(230, 'Lab Result Is ready ,  patient Jay  has been classified as Severe by our system', '', '', '', '', '', '2022-01-05 07:16:54', '2022-01-05 07:16:54'),
(231, 'Lab Result Is ready ,  patient Jay  has been classified as Severe by our system', '', '', '', '', '', '2022-01-05 07:19:43', '2022-01-05 07:19:43'),
(232, 'Lab Result Is ready , your covid case is classified as severe', '', '', 'Doctors Classification', '', '/LaboratoryController/show/25?', '2022-01-05 07:19:43', '2022-01-05 07:19:43'),
(233, 'Lab Result Is ready ,  patient Jay  has been classified as  by Dr.', '', '', '', '', '', '2022-01-05 07:19:48', '2022-01-05 07:19:48'),
(234, 'Patient Carlex Rol has been deployed to  Hospital(Chinese General Hospital) , on 2022-01-05 By Staff Cleaveland', '', '', 'Hospital Deployment', '', '/DeploymentController/show/10?', '2022-01-05 07:31:53', '2022-01-05 07:31:53'),
(235, 'you are being deployed to Hospital (Chinese General Hospital) for Quarantine and medications , on 2022-01-05', '', '', 'Hospital Deployment', '', '/DeploymentController/show/10?', '2022-01-05 07:31:53', '2022-01-05 07:31:53'),
(236, 'Patient  recovered. Hospital Quarantine Treatment', '', '', 'Hospital Deployment Released', '', '/DeploymentController/show/10?', '2022-01-05 07:32:45', '2022-01-05 07:32:45'),
(237, 'Congratulations for your recovery', '', '', 'Hospital Deployment Released', '', '/DeploymentController/show/10?', '2022-01-05 07:32:45', '2022-01-05 07:32:45'),
(238, 'a medical record has been created for you.', '', '', 'Patient Record', '', '/PatientRecordController/show/33?', '2022-01-05 10:04:33', '2022-01-05 10:04:33'),
(239, 'staff Cleaveland created record for Carlex Rol', '', '', 'Patient Record', '', '/PatientRecordController/show/33?', '2022-01-05 10:04:33', '2022-01-05 10:04:33'),
(240, 'your lab result is on its way.', '', '', 'Laboratory Result Request', '', '/LaboratoryRequestController/show/25?', '2022-01-05 10:05:46', '2022-01-05 10:05:46'),
(241, 'staff Cleaveland is requesting a lab-result for patient Carlex Rol', '', '', '', '', '', '2022-01-05 10:05:46', '2022-01-05 10:05:46'),
(242, 'Lab Result Is ready ,  patient Cleaveland has been classified as Mild by our system', '', '', '', '', '', '2022-01-05 10:06:39', '2022-01-05 10:06:39'),
(243, 'a medical record has been created for you.', '', '', 'Patient Record', '', '/PatientRecordController/show/34?', '2022-01-06 16:04:39', '2022-01-06 16:04:39'),
(244, 'staff Jay  created record for Alec', '', '', 'Patient Record', '', '/PatientRecordController/show/34?', '2022-01-06 16:04:39', '2022-01-06 16:04:39'),
(245, 'your lab result is on its way.', '', '', 'Laboratory Result Request', '', '/LaboratoryRequestController/show/26?', '2022-01-06 16:05:37', '2022-01-06 16:05:37'),
(246, 'staff Jay  is requesting a lab-result for patient Alec', '', '', '', '', '', '2022-01-06 16:05:37', '2022-01-06 16:05:37'),
(247, 'Lab Result Is ready ,  patient Jay  has been classified as Mild by our system', '', '', '', '', '', '2022-01-06 16:06:40', '2022-01-06 16:06:40'),
(248, 'Lab Result Is ready ,  patient Jay  has been classified as Mild by our system', '', '', '', '', '', '2022-01-06 16:09:38', '2022-01-06 16:09:38'),
(249, 'Lab Result Is ready , your covid case is classified as mild', '', '', 'Doctors Classification', '', '/LaboratoryController/show/27?', '2022-01-06 16:09:38', '2022-01-06 16:09:38'),
(250, 'Lab Result Is ready ,  patient Jay  has been classified as  by Dr.', '', '', '', '', '', '2022-01-06 16:09:42', '2022-01-06 16:09:42'),
(251, 'a medical record has been created for you.', '', '', 'Patient Record', '', '/PatientRecordController/show/35?', '2022-01-07 05:51:15', '2022-01-07 05:51:15'),
(252, 'staff Cleaveland created record for Carlex Rol', '', '', 'Patient Record', '', '/PatientRecordController/show/35?', '2022-01-07 05:51:15', '2022-01-07 05:51:15'),
(253, 'your lab result is on its way.', '', '', 'Laboratory Result Request', '', '/LaboratoryRequestController/show/27?', '2022-01-07 07:13:11', '2022-01-07 07:13:11'),
(254, 'staff  is requesting a lab-result for patient Carlex Rol', '', '', '', '', '', '2022-01-07 07:13:11', '2022-01-07 07:13:11'),
(255, 'Lab Result Is ready ,  patient  has been classified as Severe by our system', '', '', '', '', '', '2022-01-07 07:32:51', '2022-01-07 07:32:51'),
(256, 'Lab Result Is ready ,  patient Cleaveland has been classified as Severe by our system', '', '', '', '', '', '2022-01-07 07:44:56', '2022-01-07 07:44:56'),
(257, 'Lab Result Is ready , your covid case is classified as severe', '', '', 'Doctors Classification', '', '/LaboratoryController/show/28?', '2022-01-07 07:44:56', '2022-01-07 07:44:56'),
(258, 'Lab Result Is ready ,  patient Cleaveland has been classified as  by Dr.', '', '', '', '', '', '2022-01-07 07:45:00', '2022-01-07 07:45:00'),
(259, 'Patient Carlex Rol has been deployed to  Hospital(Chinese General Hospital) , on 2022-01-07 By Staff Cleaveland', '', '', 'Hospital Deployment', '', '/DeploymentController/show/11?', '2022-01-07 08:21:49', '2022-01-07 08:21:49'),
(260, 'you are being deployed to Hospital (Chinese General Hospital) for Quarantine and medications , on 2022-01-07', '', '', 'Hospital Deployment', '', '/DeploymentController/show/11?', '2022-01-07 08:21:49', '2022-01-07 08:21:49'),
(261, 'Patient Alec has been deployed to  Home Quarantine , on 2022-01-07 By Staff Cleaveland', '', '', 'Hospital Deployment', '', '/DeploymentController/show/12?', '2022-01-07 09:56:22', '2022-01-07 09:56:22'),
(262, 'you are being deployed to Home Quarantine , on 2022-01-07', '', '', 'Hospital Deployment', '', '/DeploymentController/show/12?', '2022-01-07 09:56:22', '2022-01-07 09:56:22'),
(263, 'Patient  recovered. Home Quarantine Treatment', '', '', 'Hospital Deployment Released', '', '/DeploymentController/show/12?', '2022-01-07 10:00:47', '2022-01-07 10:00:47'),
(264, 'Congratulations for your recovery', '', '', 'Hospital Deployment Released', '', '/DeploymentController/show/12?', '2022-01-07 10:00:47', '2022-01-07 10:00:47'),
(265, 'a medical record has been created for you.', '', '', 'Patient Record', '', '/PatientRecordController/show/36?', '2022-01-09 12:44:33', '2022-01-09 12:44:33'),
(266, 'staff Cleaveland created record for Carlex Rol', '', '', 'Patient Record', '', '/PatientRecordController/show/36?', '2022-01-09 12:44:33', '2022-01-09 12:44:33'),
(267, 'your lab result is on its way.', '', '', 'Laboratory Result Request', '', '/LaboratoryRequestController/show/28?', '2022-01-09 12:46:20', '2022-01-09 12:46:20'),
(268, 'staff Cleaveland is requesting a lab-result for patient Carlex Rol', '', '', '', '', '', '2022-01-09 12:46:20', '2022-01-09 12:46:20'),
(269, 'Lab Result Is ready ,  patient Cleaveland has been classified as Severe by our system', '', '', '', '', '', '2022-01-09 12:47:53', '2022-01-09 12:47:53'),
(270, 'Lab Result Is ready ,  patient Cleaveland has been classified as Severe by our system', '', '', '', '', '', '2022-01-09 12:48:20', '2022-01-09 12:48:20'),
(271, 'Lab Result Is ready , your covid case is classified as severe', '', '', 'Doctors Classification', '', '/LaboratoryController/show/29?', '2022-01-09 12:48:20', '2022-01-09 12:48:20'),
(272, 'Lab Result Is ready ,  patient Cleaveland has been classified as  by Dr.', '', '', '', '', '', '2022-01-09 12:48:24', '2022-01-09 12:48:24'),
(273, 'a medical record has been created for you.', '', '', 'Patient Record', '', '/PatientRecordController/show/37?', '2022-01-11 07:32:27', '2022-01-11 07:32:27'),
(274, 'staff Veronica created record for Jamaica', '', '', 'Patient Record', '', '/PatientRecordController/show/37?', '2022-01-11 07:32:27', '2022-01-11 07:32:27'),
(275, 'your lab result is on its way.', '', '', 'Laboratory Result Request', '', '/LaboratoryRequestController/show/29?', '2022-01-11 07:45:14', '2022-01-11 07:45:14'),
(276, 'staff Veronica is requesting a lab-result for patient Jamaica', '', '', '', '', '', '2022-01-11 07:45:14', '2022-01-11 07:45:14'),
(277, 'Lab Result Is ready ,  patient Veronica has been classified as Severe by our system', '', '', '', '', '', '2022-01-11 07:47:13', '2022-01-11 07:47:13'),
(278, 'Lab Result Is ready ,  patient Veronica has been classified as Severe by our system', '', '', '', '', '', '2022-01-11 07:48:13', '2022-01-11 07:48:13'),
(279, 'Lab Result Is ready , your covid case is classified as severe', '', '', 'Doctors Classification', '', '/LaboratoryController/show/30?', '2022-01-11 07:48:13', '2022-01-11 07:48:13'),
(280, 'Lab Result Is ready ,  patient Veronica has been classified as  by Dr.', '', '', '', '', '', '2022-01-11 07:48:17', '2022-01-11 07:48:17'),
(281, 'a medical record has been created for you.', '', '', 'Patient Record', '', '/PatientRecordController/show/38?', '2022-01-12 01:48:36', '2022-01-12 01:48:36'),
(282, 'staff Veronica created record for Malou', '', '', 'Patient Record', '', '/PatientRecordController/show/38?', '2022-01-12 01:48:36', '2022-01-12 01:48:36'),
(283, 'your lab result is on its way.', '', '', 'Laboratory Result Request', '', '/LaboratoryRequestController/show/30?', '2022-01-12 01:50:10', '2022-01-12 01:50:10'),
(284, 'staff Veronica is requesting a lab-result for patient Malou', '', '', '', '', '', '2022-01-12 01:50:10', '2022-01-12 01:50:10'),
(285, 'Lab Result Is ready ,  patient Veronica has been classified as Severe by our system', '', '', '', '', '', '2022-01-12 01:51:45', '2022-01-12 01:51:45'),
(286, 'a medical record has been created for you.', '', '', 'Patient Record', '', '/PatientRecordController/show/39?', '2022-01-12 07:32:06', '2022-01-12 07:32:06'),
(287, 'staff Jay  created record for Keith', '', '', 'Patient Record', '', '/PatientRecordController/show/39?', '2022-01-12 07:32:06', '2022-01-12 07:32:06'),
(288, 'your lab result is on its way.', '', '', 'Laboratory Result Request', '', '/LaboratoryRequestController/show/31?', '2022-01-12 07:33:44', '2022-01-12 07:33:44'),
(289, 'staff Jay  is requesting a lab-result for patient Keith', '', '', '', '', '', '2022-01-12 07:33:44', '2022-01-12 07:33:44'),
(290, 'Lab Result Is ready ,  patient Jay  has been classified as Severe by our system', '', '', '', '', '', '2022-01-12 07:35:12', '2022-01-12 07:35:12'),
(291, 'a medical record has been created for you.', '', '', 'Patient Record', '', '/PatientRecordController/show/40?', '2022-01-13 08:38:29', '2022-01-13 08:38:29'),
(292, 'staff Cleaveland created record for Carlex Rol', '', '', 'Patient Record', '', '/PatientRecordController/show/40?', '2022-01-13 08:38:29', '2022-01-13 08:38:29'),
(293, 'your lab result is on its way.', '', '', 'Laboratory Result Request', '', '/LaboratoryRequestController/show/32?', '2022-01-13 08:39:08', '2022-01-13 08:39:08'),
(294, 'staff Cleaveland is requesting a lab-result for patient Carlex Rol', '', '', '', '', '', '2022-01-13 08:39:08', '2022-01-13 08:39:08'),
(295, 'Lab Result Is ready ,  patient Cleaveland has been classified as Mild by our system', '', '', '', '', '', '2022-01-13 08:40:07', '2022-01-13 08:40:07'),
(296, 'Lab Result Is ready ,  patient Cleaveland has been classified as Mild by our system', '', '', '', '', '', '2022-01-13 08:41:19', '2022-01-13 08:41:19'),
(297, 'Lab Result Is ready , your covid case is classified as mild', '', '', 'Doctors Classification', '', '/LaboratoryController/show/33?', '2022-01-13 08:41:19', '2022-01-13 08:41:19'),
(298, 'Lab Result Is ready ,  patient Cleaveland has been classified as  by Dr.', '', '', '', '', '', '2022-01-13 08:41:23', '2022-01-13 08:41:23'),
(299, 'Patient Carlex Rol has been deployed to  Hospital(Chinese General Hospital) , on 2022-01-13 By Staff Cleaveland', '', '', 'Hospital Deployment', '', '/DeploymentController/show/13?', '2022-01-13 08:45:26', '2022-01-13 08:45:26'),
(300, 'you are being deployed to Hospital (Chinese General Hospital) for Quarantine and medications , on 2022-01-13', '', '', 'Hospital Deployment', '', '/DeploymentController/show/13?', '2022-01-13 08:45:26', '2022-01-13 08:45:26'),
(301, 'a medical record has been created for you.', '', '', 'Patient Record', '', '/PatientRecordController/show/41?', '2022-01-16 16:52:05', '2022-01-16 16:52:05'),
(302, 'staff Cleaveland created record for Celeste', '', '', 'Patient Record', '', '/PatientRecordController/show/41?', '2022-01-16 16:52:05', '2022-01-16 16:52:05');
INSERT INTO `system_notifications` (`id`, `message`, `icon`, `color`, `heading`, `subtext`, `href`, `created_at`, `updated_at`) VALUES
(303, 'your lab result is on its way.', '', '', 'Laboratory Result Request', '', '/LaboratoryRequestController/show/33?', '2022-01-16 16:54:04', '2022-01-16 16:54:04'),
(304, 'staff Cleaveland is requesting a lab-result for patient Celeste', '', '', '', '', '', '2022-01-16 16:54:04', '2022-01-16 16:54:04'),
(305, 'Lab Result Is ready ,  patient Cleaveland has been classified as Moderate by our system', '', '', '', '', '', '2022-01-16 16:55:36', '2022-01-16 16:55:36'),
(306, 'Patient Celeste has been deployed to  Hospital(Chinese General Hospital) , on 2022-01-17 By Staff Cleaveland', '', '', 'Hospital Deployment', '', '/DeploymentController/show/14?', '2022-01-16 16:59:23', '2022-01-16 16:59:23'),
(307, 'you are being deployed to Hospital (Chinese General Hospital) for Quarantine and medications , on 2022-01-17', '', '', 'Hospital Deployment', '', '/DeploymentController/show/14?', '2022-01-16 16:59:23', '2022-01-16 16:59:23'),
(308, 'a medical record has been created for you.', '', '', 'Patient Record', '', '/PatientRecordController/show/42?', '2022-01-16 17:23:09', '2022-01-16 17:23:09'),
(309, 'staff Cleaveland created record for Celeste', '', '', 'Patient Record', '', '/PatientRecordController/show/42?', '2022-01-16 17:23:09', '2022-01-16 17:23:09'),
(310, 'your lab result is on its way.', '', '', 'Laboratory Result Request', '', '/LaboratoryRequestController/show/34?', '2022-01-16 17:25:39', '2022-01-16 17:25:39'),
(311, 'staff Cleaveland is requesting a lab-result for patient Celeste', '', '', '', '', '', '2022-01-16 17:25:39', '2022-01-16 17:25:39'),
(312, 'Lab Result Is ready ,  patient Cleaveland has been classified as Severe by our system', '', '', '', '', '', '2022-01-16 17:27:07', '2022-01-16 17:27:07'),
(313, 'Lab Result Is ready ,  patient Cleaveland has been classified as Severe by our system', '', '', '', '', '', '2022-01-16 17:28:05', '2022-01-16 17:28:05'),
(314, 'Lab Result Is ready , your covid case is classified as severe', '', '', 'Doctors Classification', '', '/LaboratoryController/show/35?', '2022-01-16 17:28:05', '2022-01-16 17:28:05'),
(315, 'Lab Result Is ready ,  patient Cleaveland has been classified as  by Dr.', '', '', '', '', '', '2022-01-16 17:28:10', '2022-01-16 17:28:10'),
(316, 'Lab Result Is ready ,  patient Cleaveland has been classified as Severe by our system', '', '', '', '', '', '2022-01-16 17:28:27', '2022-01-16 17:28:27'),
(317, 'Patient Celeste has been deployed to  Hospital(St. Lukes Medical Center) , on 2022-01-17 By Staff Cleaveland', '', '', 'Hospital Deployment', '', '/DeploymentController/show/15?', '2022-01-16 17:29:26', '2022-01-16 17:29:26'),
(318, 'you are being deployed to Hospital (St. Lukes Medical Center) for Quarantine and medications , on 2022-01-17', '', '', 'Hospital Deployment', '', '/DeploymentController/show/15?', '2022-01-16 17:29:26', '2022-01-16 17:29:26'),
(319, 'a medical record has been created for you.', '', '', 'Patient Record', '', '/PatientRecordController/show/43?', '2022-01-16 17:48:15', '2022-01-16 17:48:15'),
(320, 'staff Cleaveland created record for Celeste', '', '', 'Patient Record', '', '/PatientRecordController/show/43?', '2022-01-16 17:48:15', '2022-01-16 17:48:15'),
(321, 'your lab result is on its way.', '', '', 'Laboratory Result Request', '', '/LaboratoryRequestController/show/35?', '2022-01-16 17:49:07', '2022-01-16 17:49:07'),
(322, 'staff Cleaveland is requesting a lab-result for patient Celeste', '', '', '', '', '', '2022-01-16 17:49:07', '2022-01-16 17:49:07'),
(323, 'Lab Result Is ready ,  patient Cleaveland has been classified as Mild by our system', '', '', '', '', '', '2022-01-16 17:50:41', '2022-01-16 17:50:41'),
(324, 'Lab Result Is ready ,  patient Cleaveland has been classified as Mild by our system', '', '', '', '', '', '2022-01-16 17:51:01', '2022-01-16 17:51:01'),
(325, 'Lab Result Is ready , your covid case is classified as mild', '', '', 'Doctors Classification', '', '/LaboratoryController/show/36?', '2022-01-16 17:51:01', '2022-01-16 17:51:01'),
(326, 'Lab Result Is ready ,  patient Cleaveland has been classified as  by Dr.', '', '', '', '', '', '2022-01-16 17:51:05', '2022-01-16 17:51:05'),
(327, 'Patient Celeste has been deployed to  Home Quarantine , on 2022-01-17 By Staff Cleaveland', '', '', 'Hospital Deployment', '', '/DeploymentController/show/16?', '2022-01-16 17:51:42', '2022-01-16 17:51:42'),
(328, 'you are being deployed to Home Quarantine , on 2022-01-17', '', '', 'Hospital Deployment', '', '/DeploymentController/show/16?', '2022-01-16 17:51:42', '2022-01-16 17:51:42'),
(329, 'a medical record has been created for you.', '', '', 'Patient Record', '', '/PatientRecordController/show/44?', '2022-01-16 18:04:52', '2022-01-16 18:04:52'),
(330, 'staff Cleaveland created record for Luke', '', '', 'Patient Record', '', '/PatientRecordController/show/44?', '2022-01-16 18:04:52', '2022-01-16 18:04:52'),
(331, 'your lab result is on its way.', '', '', 'Laboratory Result Request', '', '/LaboratoryRequestController/show/36?', '2022-01-16 18:05:40', '2022-01-16 18:05:40'),
(332, 'staff Cleaveland is requesting a lab-result for patient Luke', '', '', '', '', '', '2022-01-16 18:05:40', '2022-01-16 18:05:40'),
(333, 'Lab Result Is ready ,  patient Cleaveland has been classified as Mild by our system', '', '', '', '', '', '2022-01-16 18:06:22', '2022-01-16 18:06:22'),
(334, 'Lab Result Is ready ,  patient Cleaveland has been classified as Mild by our system', '', '', '', '', '', '2022-01-16 18:06:37', '2022-01-16 18:06:37'),
(335, 'Lab Result Is ready , your covid case is classified as mild', '', '', 'Doctors Classification', '', '/LaboratoryController/show/37?', '2022-01-16 18:06:37', '2022-01-16 18:06:37'),
(336, 'Lab Result Is ready ,  patient Cleaveland has been classified as  by Dr.', '', '', '', '', '', '2022-01-16 18:06:41', '2022-01-16 18:06:41'),
(337, 'Patient Luke has been deployed to  Home Quarantine , on 2022-01-17 By Staff Cleaveland', '', '', 'Hospital Deployment', '', '/DeploymentController/show/17?', '2022-01-16 18:07:04', '2022-01-16 18:07:04'),
(338, 'you are being deployed to Home Quarantine , on 2022-01-17', '', '', 'Hospital Deployment', '', '/DeploymentController/show/17?', '2022-01-16 18:07:04', '2022-01-16 18:07:04'),
(339, 'a medical record has been created for you.', '', '', 'Patient Record', '', '/PatientRecordController/show/45?', '2022-01-18 12:05:46', '2022-01-18 12:05:46'),
(340, 'staff Jay  created record for John Rhomel', '', '', 'Patient Record', '', '/PatientRecordController/show/45?', '2022-01-18 12:05:46', '2022-01-18 12:05:46'),
(341, 'your lab result is on its way.', '', '', 'Laboratory Result Request', '', '/LaboratoryRequestController/show/37?', '2022-01-18 12:08:29', '2022-01-18 12:08:29'),
(342, 'staff Jay  is requesting a lab-result for patient John Rhomel', '', '', '', '', '', '2022-01-18 12:08:29', '2022-01-18 12:08:29'),
(343, 'Lab Result Is ready ,  patient Jay  has been classified as Severe by our system', '', '', '', '', '', '2022-01-18 12:11:41', '2022-01-18 12:11:41'),
(344, 'Lab Result Is ready ,  patient Jay  has been classified as Severe by our system', '', '', '', '', '', '2022-01-18 12:13:58', '2022-01-18 12:13:58'),
(345, 'Lab Result Is ready , your covid case is classified as severe', '', '', 'Doctors Classification', '', '/LaboratoryController/show/38?', '2022-01-18 12:13:58', '2022-01-18 12:13:58'),
(346, 'Lab Result Is ready ,  patient Jay  has been classified as  by Dr.', '', '', '', '', '', '2022-01-18 12:14:02', '2022-01-18 12:14:02'),
(347, 'a medical record has been created for you.', '', '', 'Patient Record', '', '/PatientRecordController/show/46?', '2022-01-18 12:33:11', '2022-01-18 12:33:11'),
(348, 'staff Jay  created record for Gary', '', '', 'Patient Record', '', '/PatientRecordController/show/46?', '2022-01-18 12:33:11', '2022-01-18 12:33:11'),
(349, 'your lab result is on its way.', '', '', 'Laboratory Result Request', '', '/LaboratoryRequestController/show/38?', '2022-01-18 12:35:33', '2022-01-18 12:35:33'),
(350, 'staff Jay  is requesting a lab-result for patient Gary', '', '', '', '', '', '2022-01-18 12:35:33', '2022-01-18 12:35:33'),
(351, 'Lab Result Is ready ,  patient Jay  has been classified as Mild by our system', '', '', '', '', '', '2022-01-18 12:37:09', '2022-01-18 12:37:09'),
(352, 'a medical record has been created for you.', '', '', 'Patient Record', '', '/PatientRecordController/show/47?', '2022-01-18 13:19:37', '2022-01-18 13:19:37'),
(353, 'staff Jay  created record for Karen', '', '', 'Patient Record', '', '/PatientRecordController/show/47?', '2022-01-18 13:19:37', '2022-01-18 13:19:37'),
(354, 'a medical record has been created for you.', '', '', 'Patient Record', '', '/PatientRecordController/show/48?', '2022-01-18 13:33:42', '2022-01-18 13:33:42'),
(355, 'staff Jay  created record for Jam', '', '', 'Patient Record', '', '/PatientRecordController/show/48?', '2022-01-18 13:33:42', '2022-01-18 13:33:42'),
(356, 'a medical record has been created for you.', '', '', 'Patient Record', '', '/PatientRecordController/show/49?', '2022-01-18 13:34:30', '2022-01-18 13:34:30'),
(357, 'staff Jay  created record for Jam', '', '', 'Patient Record', '', '/PatientRecordController/show/49?', '2022-01-18 13:34:30', '2022-01-18 13:34:30'),
(358, 'Patient Karen has been deployed to  Home Quarantine , on 2022-01-24 By Staff Cleaveland', '', '', 'Hospital Deployment', '', '/DeploymentController/show/18?', '2022-01-20 15:51:17', '2022-01-20 15:51:17'),
(359, 'you are being deployed to Home Quarantine , on 2022-01-24', '', '', 'Hospital Deployment', '', '/DeploymentController/show/18?', '2022-01-20 15:51:17', '2022-01-20 15:51:17'),
(360, 'Patient  recovered. Home Quarantine Treatment', '', '', 'Hospital Deployment Released', '', '/DeploymentController/show/18?', '2022-01-20 15:51:36', '2022-01-20 15:51:36'),
(361, 'Congratulations for your recovery', '', '', 'Hospital Deployment Released', '', '/DeploymentController/show/18?', '2022-01-20 15:51:36', '2022-01-20 15:51:36'),
(362, 'a medical record has been created for you.', '', '', 'Patient Record', '', '/PatientRecordController/show/50?', '2022-01-20 15:53:57', '2022-01-20 15:53:57'),
(363, 'staff Cleaveland created record for Karen', '', '', 'Patient Record', '', '/PatientRecordController/show/50?', '2022-01-20 15:53:57', '2022-01-20 15:53:57'),
(364, 'Patient Karen has been deployed to  Hospital(St. Lukes Medical Center) , on 2022-01-21 By Staff Cleaveland', '', '', 'Hospital Deployment', '', '/DeploymentController/show/19?', '2022-01-20 15:54:33', '2022-01-20 15:54:33'),
(365, 'you are being deployed to Hospital (St. Lukes Medical Center) for Quarantine and medications , on 2022-01-21', '', '', 'Hospital Deployment', '', '/DeploymentController/show/19?', '2022-01-20 15:54:33', '2022-01-20 15:54:33'),
(366, 'a medical record has been created for you.', '', '', 'Patient Record', '', '/PatientRecordController/show/51?', '2022-01-21 10:25:33', '2022-01-21 10:25:33'),
(367, 'staff Cleaveland created record for Victoria', '', '', 'Patient Record', '', '/PatientRecordController/show/51?', '2022-01-21 10:25:33', '2022-01-21 10:25:33'),
(368, 'Patient Victoria has been deployed to  Hospital(Chinese General Hospital) , on 2022-01-21 By Staff Cleaveland', '', '', 'Hospital Deployment', '', '/DeploymentController/show/20?', '2022-01-21 10:28:46', '2022-01-21 10:28:46'),
(369, 'you are being deployed to Hospital (Chinese General Hospital) for Quarantine and medications , on 2022-01-21', '', '', 'Hospital Deployment', '', '/DeploymentController/show/20?', '2022-01-21 10:28:46', '2022-01-21 10:28:46'),
(370, 'your lab result is on its way.', '', '', 'Laboratory Result Request', '', '/LaboratoryRequestController/show/39?', '2022-01-21 10:29:24', '2022-01-21 10:29:24'),
(371, 'staff Cleaveland is requesting a lab-result for patient Victoria', '', '', '', '', '', '2022-01-21 10:29:24', '2022-01-21 10:29:24'),
(372, 'Lab Result Is ready ,  patient Cleaveland has been classified as Severe by our system', '', '', '', '', '', '2022-01-21 10:30:12', '2022-01-21 10:30:12'),
(373, 'Lab Result Is ready ,  patient Cleaveland has been classified as Severe by our system', '', '', '', '', '', '2022-01-21 10:30:39', '2022-01-21 10:30:39'),
(374, 'Lab Result Is ready , your covid case is classified as severe', '', '', 'Doctors Classification', '', '/LaboratoryController/show/40?', '2022-01-21 10:30:39', '2022-01-21 10:30:39'),
(375, 'Lab Result Is ready ,  patient Cleaveland has been classified as  by Dr.', '', '', '', '', '', '2022-01-21 10:30:44', '2022-01-21 10:30:44');

-- --------------------------------------------------------

--
-- Table structure for table `system_notification_recipients`
--

CREATE TABLE `system_notification_recipients` (
  `id` int(10) NOT NULL,
  `notification_id` int(10) DEFAULT NULL,
  `recipient_id` int(10) DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT 0,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `system_notification_recipients`
--

INSERT INTO `system_notification_recipients` (`id`, `notification_id`, `recipient_id`, `is_read`, `updated_at`) VALUES
(1, 1, 48, 0, '2022-01-02 15:22:28'),
(2, 2, 2, 0, '2022-01-02 15:22:28'),
(3, 3, 48, 0, '2022-01-02 15:26:53'),
(4, 4, 2, 0, '2022-01-02 15:26:53'),
(5, 5, 2, 0, '2022-01-02 15:27:23'),
(6, 6, 2, 0, '2022-01-02 15:28:42'),
(7, 7, 48, 0, '2022-01-02 15:28:42'),
(8, 8, 2, 0, '2022-01-02 15:28:47'),
(9, 9, 2, 0, '2022-01-02 15:30:36'),
(10, 10, 48, 0, '2022-01-02 15:30:36'),
(11, 11, 2, 0, '2022-01-02 15:30:51'),
(12, 12, 0, 0, '2022-01-02 15:30:51'),
(13, 13, 51, 0, '2022-01-03 06:56:31'),
(14, 14, 2, 0, '2022-01-03 06:56:31'),
(15, 15, 2, 0, '2022-01-03 08:28:02'),
(16, 16, 51, 0, '2022-01-03 08:28:02'),
(17, 17, 2, 0, '2022-01-03 08:28:38'),
(18, 18, 0, 0, '2022-01-03 08:28:38'),
(19, 19, 54, 0, '2022-01-03 08:45:04'),
(20, 20, 2, 0, '2022-01-03 08:45:04'),
(21, 20, 53, 0, '2022-01-03 08:45:04'),
(22, 21, 54, 0, '2022-01-03 08:51:40'),
(23, 22, 2, 0, '2022-01-03 08:51:40'),
(24, 22, 53, 0, '2022-01-03 08:51:40'),
(25, 23, 2, 0, '2022-01-03 08:53:01'),
(26, 23, 53, 0, '2022-01-03 08:53:01'),
(27, 24, 2, 0, '2022-01-03 08:56:18'),
(28, 24, 53, 0, '2022-01-03 08:56:18'),
(29, 25, 54, 0, '2022-01-03 08:56:18'),
(30, 26, 2, 0, '2022-01-03 08:58:56'),
(31, 26, 53, 0, '2022-01-03 08:58:56'),
(32, 27, 0, 0, '2022-01-03 08:58:56'),
(33, 28, 2, 0, '2022-01-03 09:21:55'),
(34, 28, 53, 0, '2022-01-03 09:21:55'),
(35, 29, 54, 0, '2022-01-03 09:21:55'),
(36, 30, 2, 0, '2022-01-03 09:22:00'),
(37, 30, 53, 0, '2022-01-03 09:22:00'),
(38, 31, 55, 0, '2022-01-03 09:28:58'),
(39, 32, 2, 0, '2022-01-03 09:28:58'),
(40, 32, 53, 0, '2022-01-03 09:28:58'),
(41, 33, 55, 0, '2022-01-03 09:30:05'),
(42, 34, 2, 0, '2022-01-03 09:30:05'),
(43, 34, 53, 0, '2022-01-03 09:30:05'),
(44, 35, 2, 0, '2022-01-03 09:31:03'),
(45, 35, 53, 0, '2022-01-03 09:31:03'),
(46, 36, 2, 0, '2022-01-03 09:31:24'),
(47, 36, 53, 0, '2022-01-03 09:31:24'),
(48, 37, 55, 0, '2022-01-03 09:31:24'),
(49, 38, 2, 0, '2022-01-03 09:31:34'),
(50, 38, 53, 0, '2022-01-03 09:31:34'),
(51, 39, 2, 0, '2022-01-03 09:33:05'),
(52, 39, 53, 0, '2022-01-03 09:33:05'),
(53, 40, 55, 0, '2022-01-03 09:33:05'),
(54, 41, 57, 0, '2022-01-03 13:05:25'),
(55, 42, 2, 0, '2022-01-03 13:05:25'),
(56, 42, 56, 0, '2022-01-03 13:05:25'),
(57, 42, 53, 0, '2022-01-03 13:05:25'),
(58, 43, 59, 0, '2022-01-03 13:19:33'),
(59, 44, 2, 0, '2022-01-03 13:19:33'),
(60, 44, 56, 0, '2022-01-03 13:19:33'),
(61, 44, 58, 0, '2022-01-03 13:19:33'),
(62, 44, 53, 0, '2022-01-03 13:19:33'),
(63, 45, 60, 0, '2022-01-03 13:53:23'),
(64, 46, 2, 0, '2022-01-03 13:53:23'),
(65, 46, 56, 0, '2022-01-03 13:53:23'),
(66, 46, 58, 0, '2022-01-03 13:53:23'),
(67, 46, 53, 0, '2022-01-03 13:53:23'),
(68, 47, 60, 0, '2022-01-03 13:55:52'),
(69, 48, 2, 0, '2022-01-03 13:55:52'),
(70, 48, 56, 0, '2022-01-03 13:55:52'),
(71, 48, 58, 0, '2022-01-03 13:55:52'),
(72, 48, 53, 0, '2022-01-03 13:55:52'),
(73, 49, 2, 0, '2022-01-03 13:59:12'),
(74, 49, 56, 0, '2022-01-03 13:59:12'),
(75, 49, 58, 0, '2022-01-03 13:59:12'),
(76, 49, 53, 0, '2022-01-03 13:59:12'),
(77, 50, 2, 0, '2022-01-03 14:00:09'),
(78, 50, 56, 0, '2022-01-03 14:00:09'),
(79, 50, 58, 0, '2022-01-03 14:00:09'),
(80, 50, 53, 0, '2022-01-03 14:00:09'),
(81, 51, 60, 0, '2022-01-03 14:00:09'),
(82, 52, 2, 0, '2022-01-03 14:00:14'),
(83, 52, 56, 0, '2022-01-03 14:00:14'),
(84, 52, 58, 0, '2022-01-03 14:00:14'),
(85, 52, 53, 0, '2022-01-03 14:00:14'),
(86, 53, 2, 0, '2022-01-03 14:04:08'),
(87, 53, 56, 0, '2022-01-03 14:04:08'),
(88, 53, 58, 0, '2022-01-03 14:04:08'),
(89, 53, 53, 0, '2022-01-03 14:04:08'),
(90, 54, 60, 0, '2022-01-03 14:04:08'),
(91, 55, 2, 0, '2022-01-03 14:08:38'),
(92, 55, 56, 0, '2022-01-03 14:08:38'),
(93, 55, 58, 0, '2022-01-03 14:08:38'),
(94, 55, 53, 0, '2022-01-03 14:08:38'),
(95, 56, 0, 0, '2022-01-03 14:08:38'),
(96, 57, 61, 0, '2022-01-03 14:12:34'),
(97, 58, 2, 0, '2022-01-03 14:12:34'),
(98, 58, 56, 0, '2022-01-03 14:12:34'),
(99, 58, 58, 0, '2022-01-03 14:12:34'),
(100, 58, 53, 0, '2022-01-03 14:12:34'),
(101, 59, 61, 0, '2022-01-03 14:14:01'),
(102, 60, 2, 0, '2022-01-03 14:14:01'),
(103, 60, 56, 0, '2022-01-03 14:14:01'),
(104, 60, 58, 0, '2022-01-03 14:14:01'),
(105, 60, 53, 0, '2022-01-03 14:14:01'),
(106, 61, 2, 0, '2022-01-03 14:15:37'),
(107, 61, 56, 0, '2022-01-03 14:15:37'),
(108, 61, 58, 0, '2022-01-03 14:15:37'),
(109, 61, 53, 0, '2022-01-03 14:15:37'),
(110, 62, 2, 0, '2022-01-03 14:16:17'),
(111, 62, 56, 0, '2022-01-03 14:16:17'),
(112, 62, 58, 0, '2022-01-03 14:16:17'),
(113, 62, 53, 0, '2022-01-03 14:16:17'),
(114, 63, 61, 0, '2022-01-03 14:16:17'),
(115, 64, 2, 0, '2022-01-03 14:16:22'),
(116, 64, 56, 0, '2022-01-03 14:16:22'),
(117, 64, 58, 0, '2022-01-03 14:16:22'),
(118, 64, 53, 0, '2022-01-03 14:16:22'),
(119, 65, 2, 0, '2022-01-03 14:17:26'),
(120, 65, 56, 0, '2022-01-03 14:17:26'),
(121, 65, 58, 0, '2022-01-03 14:17:26'),
(122, 65, 53, 0, '2022-01-03 14:17:26'),
(123, 66, 61, 0, '2022-01-03 14:17:26'),
(124, 67, 2, 0, '2022-01-03 14:27:40'),
(125, 67, 56, 0, '2022-01-03 14:27:40'),
(126, 67, 58, 0, '2022-01-03 14:27:40'),
(127, 67, 53, 0, '2022-01-03 14:27:40'),
(128, 68, 0, 0, '2022-01-03 14:27:40'),
(129, 69, 60, 0, '2022-01-03 15:37:15'),
(130, 70, 2, 0, '2022-01-03 15:37:15'),
(131, 70, 56, 0, '2022-01-03 15:37:15'),
(132, 70, 58, 0, '2022-01-03 15:37:15'),
(133, 70, 53, 0, '2022-01-03 15:37:15'),
(134, 71, 60, 0, '2022-01-03 15:45:23'),
(135, 72, 2, 0, '2022-01-03 15:45:23'),
(136, 72, 56, 0, '2022-01-03 15:45:23'),
(137, 72, 58, 0, '2022-01-03 15:45:23'),
(138, 72, 53, 0, '2022-01-03 15:45:23'),
(139, 73, 2, 0, '2022-01-03 15:46:42'),
(140, 73, 56, 0, '2022-01-03 15:46:42'),
(141, 73, 58, 0, '2022-01-03 15:46:42'),
(142, 73, 53, 0, '2022-01-03 15:46:42'),
(143, 74, 57, 0, '2022-01-03 16:34:33'),
(144, 75, 2, 0, '2022-01-03 16:34:33'),
(145, 75, 56, 0, '2022-01-03 16:34:33'),
(146, 75, 58, 0, '2022-01-03 16:34:33'),
(147, 75, 53, 0, '2022-01-03 16:34:33'),
(148, 76, 57, 0, '2022-01-03 16:45:52'),
(149, 77, 2, 0, '2022-01-03 16:45:52'),
(150, 77, 56, 0, '2022-01-03 16:45:52'),
(151, 77, 58, 0, '2022-01-03 16:45:52'),
(152, 77, 53, 0, '2022-01-03 16:45:52'),
(153, 78, 2, 0, '2022-01-03 16:46:59'),
(154, 78, 56, 0, '2022-01-03 16:46:59'),
(155, 78, 58, 0, '2022-01-03 16:46:59'),
(156, 78, 53, 0, '2022-01-03 16:46:59'),
(157, 79, 59, 0, '2022-01-03 16:52:12'),
(158, 80, 2, 0, '2022-01-03 16:52:12'),
(159, 80, 56, 0, '2022-01-03 16:52:12'),
(160, 80, 58, 0, '2022-01-03 16:52:12'),
(161, 80, 53, 0, '2022-01-03 16:52:12'),
(162, 81, 59, 0, '2022-01-03 16:54:12'),
(163, 82, 2, 0, '2022-01-03 16:54:12'),
(164, 82, 56, 0, '2022-01-03 16:54:12'),
(165, 82, 58, 0, '2022-01-03 16:54:12'),
(166, 82, 53, 0, '2022-01-03 16:54:12'),
(167, 83, 2, 0, '2022-01-03 16:54:59'),
(168, 83, 56, 0, '2022-01-03 16:54:59'),
(169, 83, 58, 0, '2022-01-03 16:54:59'),
(170, 83, 53, 0, '2022-01-03 16:54:59'),
(171, 84, 61, 0, '2022-01-04 06:25:19'),
(172, 85, 2, 0, '2022-01-04 06:25:19'),
(173, 85, 56, 0, '2022-01-04 06:25:19'),
(174, 85, 58, 0, '2022-01-04 06:25:19'),
(175, 85, 53, 0, '2022-01-04 06:25:19'),
(176, 86, 61, 0, '2022-01-04 06:31:16'),
(177, 87, 2, 0, '2022-01-04 06:31:16'),
(178, 87, 56, 0, '2022-01-04 06:31:16'),
(179, 87, 58, 0, '2022-01-04 06:31:16'),
(180, 87, 53, 0, '2022-01-04 06:31:16'),
(181, 88, 2, 0, '2022-01-04 06:32:44'),
(182, 88, 56, 0, '2022-01-04 06:32:44'),
(183, 88, 58, 0, '2022-01-04 06:32:44'),
(184, 88, 53, 0, '2022-01-04 06:32:44'),
(185, 89, 55, 0, '2022-01-04 06:42:30'),
(186, 90, 2, 0, '2022-01-04 06:42:30'),
(187, 90, 56, 0, '2022-01-04 06:42:30'),
(188, 90, 58, 0, '2022-01-04 06:42:30'),
(189, 90, 53, 0, '2022-01-04 06:42:30'),
(190, 91, 55, 0, '2022-01-04 06:45:00'),
(191, 92, 2, 0, '2022-01-04 06:45:00'),
(192, 92, 56, 0, '2022-01-04 06:45:00'),
(193, 92, 58, 0, '2022-01-04 06:45:00'),
(194, 92, 53, 0, '2022-01-04 06:45:00'),
(195, 93, 2, 0, '2022-01-04 06:46:26'),
(196, 93, 56, 0, '2022-01-04 06:46:26'),
(197, 93, 58, 0, '2022-01-04 06:46:26'),
(198, 93, 53, 0, '2022-01-04 06:46:26'),
(199, 94, 59, 0, '2022-01-04 06:47:26'),
(200, 95, 2, 0, '2022-01-04 06:47:26'),
(201, 95, 56, 0, '2022-01-04 06:47:26'),
(202, 95, 58, 0, '2022-01-04 06:47:26'),
(203, 95, 53, 0, '2022-01-04 06:47:26'),
(204, 96, 59, 0, '2022-01-04 06:49:58'),
(205, 97, 2, 0, '2022-01-04 06:49:58'),
(206, 97, 56, 0, '2022-01-04 06:49:58'),
(207, 97, 58, 0, '2022-01-04 06:49:58'),
(208, 97, 53, 0, '2022-01-04 06:49:58'),
(209, 98, 2, 0, '2022-01-04 06:51:28'),
(210, 98, 56, 0, '2022-01-04 06:51:28'),
(211, 98, 58, 0, '2022-01-04 06:51:28'),
(212, 98, 53, 0, '2022-01-04 06:51:28'),
(213, 99, 2, 0, '2022-01-04 06:53:55'),
(214, 99, 56, 0, '2022-01-04 06:53:55'),
(215, 99, 58, 0, '2022-01-04 06:53:55'),
(216, 99, 53, 0, '2022-01-04 06:53:55'),
(217, 100, 61, 0, '2022-01-04 06:55:22'),
(218, 101, 2, 0, '2022-01-04 06:55:22'),
(219, 101, 56, 0, '2022-01-04 06:55:22'),
(220, 101, 58, 0, '2022-01-04 06:55:22'),
(221, 101, 53, 0, '2022-01-04 06:55:22'),
(222, 102, 61, 0, '2022-01-04 06:56:04'),
(223, 103, 2, 0, '2022-01-04 06:56:04'),
(224, 103, 56, 0, '2022-01-04 06:56:04'),
(225, 103, 58, 0, '2022-01-04 06:56:04'),
(226, 103, 53, 0, '2022-01-04 06:56:04'),
(227, 104, 2, 0, '2022-01-04 06:56:35'),
(228, 104, 56, 0, '2022-01-04 06:56:35'),
(229, 104, 58, 0, '2022-01-04 06:56:35'),
(230, 104, 53, 0, '2022-01-04 06:56:35'),
(231, 105, 57, 0, '2022-01-04 13:17:25'),
(232, 106, 2, 0, '2022-01-04 13:17:25'),
(233, 106, 56, 0, '2022-01-04 13:17:25'),
(234, 106, 58, 0, '2022-01-04 13:17:25'),
(235, 106, 53, 0, '2022-01-04 13:17:25'),
(236, 107, 57, 0, '2022-01-04 13:18:47'),
(237, 108, 2, 0, '2022-01-04 13:18:47'),
(238, 108, 56, 0, '2022-01-04 13:18:47'),
(239, 108, 58, 0, '2022-01-04 13:18:47'),
(240, 108, 53, 0, '2022-01-04 13:18:47'),
(241, 109, 61, 0, '2022-01-04 13:19:56'),
(242, 110, 2, 0, '2022-01-04 13:19:56'),
(243, 110, 56, 0, '2022-01-04 13:19:56'),
(244, 110, 58, 0, '2022-01-04 13:19:56'),
(245, 110, 53, 0, '2022-01-04 13:19:56'),
(246, 111, 61, 0, '2022-01-04 13:22:46'),
(247, 112, 2, 0, '2022-01-04 13:22:46'),
(248, 112, 56, 0, '2022-01-04 13:22:46'),
(249, 112, 58, 0, '2022-01-04 13:22:46'),
(250, 112, 53, 0, '2022-01-04 13:22:46'),
(251, 113, 2, 0, '2022-01-04 13:23:54'),
(252, 113, 56, 0, '2022-01-04 13:23:54'),
(253, 113, 58, 0, '2022-01-04 13:23:54'),
(254, 113, 53, 0, '2022-01-04 13:23:54'),
(255, 114, 61, 0, '2022-01-04 13:25:05'),
(256, 115, 2, 0, '2022-01-04 13:25:05'),
(257, 115, 56, 0, '2022-01-04 13:25:05'),
(258, 115, 58, 0, '2022-01-04 13:25:05'),
(259, 115, 53, 0, '2022-01-04 13:25:05'),
(260, 116, 61, 0, '2022-01-04 13:25:59'),
(261, 117, 2, 0, '2022-01-04 13:25:59'),
(262, 117, 56, 0, '2022-01-04 13:25:59'),
(263, 117, 58, 0, '2022-01-04 13:25:59'),
(264, 117, 53, 0, '2022-01-04 13:25:59'),
(265, 118, 2, 0, '2022-01-04 13:26:33'),
(266, 118, 56, 0, '2022-01-04 13:26:33'),
(267, 118, 58, 0, '2022-01-04 13:26:33'),
(268, 118, 53, 0, '2022-01-04 13:26:33'),
(269, 119, 57, 0, '2022-01-04 13:29:19'),
(270, 120, 2, 0, '2022-01-04 13:29:19'),
(271, 120, 56, 0, '2022-01-04 13:29:19'),
(272, 120, 58, 0, '2022-01-04 13:29:19'),
(273, 120, 53, 0, '2022-01-04 13:29:19'),
(274, 121, 57, 0, '2022-01-04 13:30:50'),
(275, 122, 2, 0, '2022-01-04 13:30:50'),
(276, 122, 56, 0, '2022-01-04 13:30:50'),
(277, 122, 58, 0, '2022-01-04 13:30:50'),
(278, 122, 53, 0, '2022-01-04 13:30:50'),
(279, 123, 2, 0, '2022-01-04 13:31:32'),
(280, 123, 56, 0, '2022-01-04 13:31:32'),
(281, 123, 58, 0, '2022-01-04 13:31:32'),
(282, 123, 53, 0, '2022-01-04 13:31:32'),
(283, 124, 2, 0, '2022-01-04 14:40:35'),
(284, 124, 56, 0, '2022-01-04 14:40:35'),
(285, 124, 58, 0, '2022-01-04 14:40:35'),
(286, 124, 53, 0, '2022-01-04 14:40:35'),
(287, 125, 0, 0, '2022-01-04 14:40:35'),
(288, 126, 62, 0, '2022-01-04 15:30:53'),
(289, 127, 2, 0, '2022-01-04 15:30:53'),
(290, 127, 58, 0, '2022-01-04 15:30:53'),
(291, 127, 53, 0, '2022-01-04 15:30:53'),
(292, 128, 62, 0, '2022-01-04 15:35:56'),
(293, 129, 2, 0, '2022-01-04 15:35:56'),
(294, 129, 58, 0, '2022-01-04 15:35:56'),
(295, 129, 53, 0, '2022-01-04 15:35:56'),
(296, 130, 2, 0, '2022-01-04 15:38:03'),
(297, 130, 58, 0, '2022-01-04 15:38:03'),
(298, 130, 53, 0, '2022-01-04 15:38:03'),
(299, 131, 2, 0, '2022-01-04 15:51:10'),
(300, 131, 58, 0, '2022-01-04 15:51:10'),
(301, 131, 53, 0, '2022-01-04 15:51:10'),
(302, 132, 62, 0, '2022-01-04 15:51:10'),
(303, 133, 2, 0, '2022-01-04 15:51:16'),
(304, 133, 58, 0, '2022-01-04 15:51:16'),
(305, 133, 53, 0, '2022-01-04 15:51:16'),
(306, 134, 2, 0, '2022-01-04 15:53:06'),
(307, 134, 58, 0, '2022-01-04 15:53:06'),
(308, 134, 53, 0, '2022-01-04 15:53:06'),
(309, 135, 62, 0, '2022-01-04 15:53:06'),
(310, 136, 2, 0, '2022-01-04 15:56:08'),
(311, 136, 58, 0, '2022-01-04 15:56:08'),
(312, 136, 53, 0, '2022-01-04 15:56:08'),
(313, 137, 0, 0, '2022-01-04 15:56:08'),
(314, 138, 63, 0, '2022-01-04 16:02:04'),
(315, 139, 2, 0, '2022-01-04 16:02:04'),
(316, 139, 58, 0, '2022-01-04 16:02:04'),
(317, 139, 53, 0, '2022-01-04 16:02:04'),
(318, 140, 63, 0, '2022-01-04 16:05:43'),
(319, 141, 2, 0, '2022-01-04 16:05:43'),
(320, 141, 58, 0, '2022-01-04 16:05:43'),
(321, 141, 53, 0, '2022-01-04 16:05:43'),
(322, 142, 2, 0, '2022-01-04 16:06:57'),
(323, 142, 58, 0, '2022-01-04 16:06:57'),
(324, 142, 53, 0, '2022-01-04 16:06:57'),
(325, 143, 2, 0, '2022-01-04 16:07:26'),
(326, 143, 58, 0, '2022-01-04 16:07:26'),
(327, 143, 53, 0, '2022-01-04 16:07:26'),
(328, 144, 63, 0, '2022-01-04 16:07:26'),
(329, 145, 2, 0, '2022-01-04 16:07:31'),
(330, 145, 58, 0, '2022-01-04 16:07:31'),
(331, 145, 53, 0, '2022-01-04 16:07:31'),
(332, 146, 2, 0, '2022-01-04 16:08:16'),
(333, 146, 58, 0, '2022-01-04 16:08:16'),
(334, 146, 53, 0, '2022-01-04 16:08:16'),
(335, 147, 63, 0, '2022-01-04 16:08:16'),
(336, 148, 2, 0, '2022-01-04 16:19:00'),
(337, 148, 58, 0, '2022-01-04 16:19:00'),
(338, 148, 53, 0, '2022-01-04 16:19:00'),
(339, 149, 0, 0, '2022-01-04 16:19:00'),
(340, 150, 64, 0, '2022-01-04 16:25:40'),
(341, 151, 2, 0, '2022-01-04 16:25:40'),
(342, 151, 58, 0, '2022-01-04 16:25:40'),
(343, 151, 53, 0, '2022-01-04 16:25:40'),
(344, 152, 64, 0, '2022-01-04 16:28:42'),
(345, 153, 2, 0, '2022-01-04 16:28:42'),
(346, 153, 58, 0, '2022-01-04 16:28:42'),
(347, 153, 53, 0, '2022-01-04 16:28:42'),
(348, 154, 2, 0, '2022-01-04 16:29:51'),
(349, 154, 58, 0, '2022-01-04 16:29:51'),
(350, 154, 53, 0, '2022-01-04 16:29:51'),
(351, 155, 2, 0, '2022-01-04 16:30:12'),
(352, 155, 58, 0, '2022-01-04 16:30:12'),
(353, 155, 53, 0, '2022-01-04 16:30:12'),
(354, 156, 64, 0, '2022-01-04 16:30:12'),
(355, 157, 2, 0, '2022-01-04 16:30:13'),
(356, 157, 58, 0, '2022-01-04 16:30:13'),
(357, 157, 53, 0, '2022-01-04 16:30:13'),
(358, 158, 2, 0, '2022-01-05 01:55:06'),
(359, 158, 58, 0, '2022-01-05 01:55:06'),
(360, 158, 53, 0, '2022-01-05 01:55:06'),
(361, 159, 64, 0, '2022-01-05 01:55:06'),
(362, 160, 2, 0, '2022-01-05 03:40:52'),
(363, 160, 58, 0, '2022-01-05 03:40:52'),
(364, 160, 53, 0, '2022-01-05 03:40:52'),
(365, 161, 0, 0, '2022-01-05 03:40:52'),
(366, 162, 64, 0, '2022-01-05 04:00:51'),
(367, 163, 2, 0, '2022-01-05 04:00:51'),
(368, 163, 58, 0, '2022-01-05 04:00:51'),
(369, 163, 53, 0, '2022-01-05 04:00:51'),
(370, 164, 64, 0, '2022-01-05 04:02:39'),
(371, 165, 2, 0, '2022-01-05 04:02:39'),
(372, 165, 58, 0, '2022-01-05 04:02:39'),
(373, 165, 53, 0, '2022-01-05 04:02:39'),
(374, 166, 2, 0, '2022-01-05 04:03:32'),
(375, 166, 58, 0, '2022-01-05 04:03:32'),
(376, 166, 53, 0, '2022-01-05 04:03:32'),
(377, 167, 2, 0, '2022-01-05 04:13:32'),
(378, 167, 58, 0, '2022-01-05 04:13:32'),
(379, 167, 53, 0, '2022-01-05 04:13:32'),
(380, 168, 64, 0, '2022-01-05 04:13:32'),
(381, 169, 2, 0, '2022-01-05 04:13:33'),
(382, 169, 58, 0, '2022-01-05 04:13:33'),
(383, 169, 53, 0, '2022-01-05 04:13:33'),
(384, 170, 2, 0, '2022-01-05 04:13:56'),
(385, 170, 58, 0, '2022-01-05 04:13:56'),
(386, 170, 53, 0, '2022-01-05 04:13:56'),
(387, 171, 64, 0, '2022-01-05 04:13:56'),
(388, 172, 2, 0, '2022-01-05 04:13:56'),
(389, 172, 58, 0, '2022-01-05 04:13:56'),
(390, 172, 53, 0, '2022-01-05 04:13:56'),
(391, 173, 2, 0, '2022-01-05 04:15:01'),
(392, 173, 58, 0, '2022-01-05 04:15:01'),
(393, 173, 53, 0, '2022-01-05 04:15:01'),
(394, 174, 64, 0, '2022-01-05 04:15:01'),
(395, 175, 2, 0, '2022-01-05 04:15:01'),
(396, 175, 58, 0, '2022-01-05 04:15:01'),
(397, 175, 53, 0, '2022-01-05 04:15:01'),
(398, 176, 2, 0, '2022-01-05 04:15:21'),
(399, 176, 58, 0, '2022-01-05 04:15:21'),
(400, 176, 53, 0, '2022-01-05 04:15:21'),
(401, 177, 64, 0, '2022-01-05 04:15:21'),
(402, 178, 2, 0, '2022-01-05 04:15:21'),
(403, 178, 58, 0, '2022-01-05 04:15:21'),
(404, 178, 53, 0, '2022-01-05 04:15:21'),
(405, 179, 2, 0, '2022-01-05 04:15:52'),
(406, 179, 58, 0, '2022-01-05 04:15:52'),
(407, 179, 53, 0, '2022-01-05 04:15:52'),
(408, 180, 64, 0, '2022-01-05 04:15:52'),
(409, 181, 2, 0, '2022-01-05 04:15:52'),
(410, 181, 58, 0, '2022-01-05 04:15:52'),
(411, 181, 53, 0, '2022-01-05 04:15:52'),
(412, 182, 2, 0, '2022-01-05 04:16:10'),
(413, 182, 58, 0, '2022-01-05 04:16:10'),
(414, 182, 53, 0, '2022-01-05 04:16:10'),
(415, 183, 64, 0, '2022-01-05 04:16:10'),
(416, 184, 2, 0, '2022-01-05 04:16:11'),
(417, 184, 58, 0, '2022-01-05 04:16:11'),
(418, 184, 53, 0, '2022-01-05 04:16:11'),
(419, 185, 62, 0, '2022-01-05 04:23:35'),
(420, 186, 2, 0, '2022-01-05 04:23:35'),
(421, 186, 58, 0, '2022-01-05 04:23:35'),
(422, 186, 53, 0, '2022-01-05 04:23:35'),
(423, 187, 62, 0, '2022-01-05 04:24:41'),
(424, 188, 2, 0, '2022-01-05 04:24:41'),
(425, 188, 58, 0, '2022-01-05 04:24:41'),
(426, 188, 53, 0, '2022-01-05 04:24:41'),
(427, 189, 62, 0, '2022-01-05 04:30:47'),
(428, 190, 2, 0, '2022-01-05 04:30:47'),
(429, 190, 58, 0, '2022-01-05 04:30:47'),
(430, 190, 53, 0, '2022-01-05 04:30:47'),
(431, 191, 62, 0, '2022-01-05 04:32:49'),
(432, 192, 2, 0, '2022-01-05 04:32:49'),
(433, 192, 58, 0, '2022-01-05 04:32:49'),
(434, 192, 53, 0, '2022-01-05 04:32:49'),
(435, 193, 2, 0, '2022-01-05 04:33:56'),
(436, 193, 58, 0, '2022-01-05 04:33:56'),
(437, 193, 53, 0, '2022-01-05 04:33:56'),
(438, 194, 65, 0, '2022-01-05 04:52:34'),
(439, 195, 2, 0, '2022-01-05 04:52:34'),
(440, 195, 58, 0, '2022-01-05 04:52:34'),
(441, 195, 53, 0, '2022-01-05 04:52:34'),
(442, 196, 65, 0, '2022-01-05 04:54:37'),
(443, 197, 2, 0, '2022-01-05 04:54:37'),
(444, 197, 58, 0, '2022-01-05 04:54:37'),
(445, 197, 53, 0, '2022-01-05 04:54:37'),
(446, 198, 2, 0, '2022-01-05 04:57:20'),
(447, 198, 58, 0, '2022-01-05 04:57:20'),
(448, 198, 53, 0, '2022-01-05 04:57:20'),
(449, 199, 2, 0, '2022-01-05 05:00:05'),
(450, 199, 58, 0, '2022-01-05 05:00:05'),
(451, 199, 53, 0, '2022-01-05 05:00:05'),
(452, 200, 65, 0, '2022-01-05 05:00:05'),
(453, 201, 2, 0, '2022-01-05 05:00:05'),
(454, 201, 58, 0, '2022-01-05 05:00:05'),
(455, 201, 53, 0, '2022-01-05 05:00:05'),
(456, 202, 2, 0, '2022-01-05 05:01:51'),
(457, 202, 58, 0, '2022-01-05 05:01:51'),
(458, 202, 53, 0, '2022-01-05 05:01:51'),
(459, 203, 65, 0, '2022-01-05 05:01:51'),
(460, 204, 2, 0, '2022-01-05 05:01:52'),
(461, 204, 58, 0, '2022-01-05 05:01:52'),
(462, 204, 53, 0, '2022-01-05 05:01:52'),
(463, 205, 65, 0, '2022-01-05 05:43:48'),
(464, 206, 2, 0, '2022-01-05 05:43:48'),
(465, 206, 58, 0, '2022-01-05 05:43:48'),
(466, 206, 53, 0, '2022-01-05 05:43:48'),
(467, 207, 64, 0, '2022-01-05 06:08:58'),
(468, 208, 2, 0, '2022-01-05 06:08:58'),
(469, 208, 58, 0, '2022-01-05 06:08:58'),
(470, 208, 53, 0, '2022-01-05 06:08:58'),
(471, 209, 64, 0, '2022-01-05 06:10:16'),
(472, 210, 2, 0, '2022-01-05 06:10:16'),
(473, 210, 58, 0, '2022-01-05 06:10:16'),
(474, 210, 53, 0, '2022-01-05 06:10:16'),
(475, 211, 64, 0, '2022-01-05 06:10:38'),
(476, 212, 2, 0, '2022-01-05 06:10:38'),
(477, 212, 58, 0, '2022-01-05 06:10:38'),
(478, 212, 53, 0, '2022-01-05 06:10:38'),
(479, 213, 65, 0, '2022-01-05 06:11:21'),
(480, 214, 2, 0, '2022-01-05 06:11:21'),
(481, 214, 58, 0, '2022-01-05 06:11:21'),
(482, 214, 53, 0, '2022-01-05 06:11:21'),
(483, 215, 2, 0, '2022-01-05 06:11:31'),
(484, 215, 58, 0, '2022-01-05 06:11:31'),
(485, 215, 53, 0, '2022-01-05 06:11:31'),
(486, 216, 2, 0, '2022-01-05 06:12:43'),
(487, 216, 58, 0, '2022-01-05 06:12:43'),
(488, 216, 53, 0, '2022-01-05 06:12:43'),
(489, 217, 64, 0, '2022-01-05 06:12:43'),
(490, 218, 2, 0, '2022-01-05 06:12:43'),
(491, 218, 58, 0, '2022-01-05 06:12:43'),
(492, 218, 53, 0, '2022-01-05 06:12:43'),
(493, 219, 2, 0, '2022-01-05 06:12:54'),
(494, 219, 58, 0, '2022-01-05 06:12:54'),
(495, 219, 53, 0, '2022-01-05 06:12:54'),
(496, 220, 2, 0, '2022-01-05 06:13:20'),
(497, 220, 58, 0, '2022-01-05 06:13:20'),
(498, 220, 53, 0, '2022-01-05 06:13:20'),
(499, 221, 65, 0, '2022-01-05 06:13:20'),
(500, 222, 2, 0, '2022-01-05 06:13:20'),
(501, 222, 58, 0, '2022-01-05 06:13:20'),
(502, 222, 53, 0, '2022-01-05 06:13:20'),
(503, 223, 2, 0, '2022-01-05 06:13:57'),
(504, 223, 58, 0, '2022-01-05 06:13:57'),
(505, 223, 53, 0, '2022-01-05 06:13:57'),
(506, 224, 64, 0, '2022-01-05 06:13:57'),
(507, 225, 2, 0, '2022-01-05 06:13:57'),
(508, 225, 58, 0, '2022-01-05 06:13:57'),
(509, 225, 53, 0, '2022-01-05 06:13:57'),
(510, 226, 66, 0, '2022-01-05 07:11:47'),
(511, 227, 2, 0, '2022-01-05 07:11:47'),
(512, 227, 58, 0, '2022-01-05 07:11:47'),
(513, 227, 53, 0, '2022-01-05 07:11:47'),
(514, 228, 66, 0, '2022-01-05 07:15:06'),
(515, 229, 2, 0, '2022-01-05 07:15:06'),
(516, 229, 58, 0, '2022-01-05 07:15:06'),
(517, 229, 53, 0, '2022-01-05 07:15:06'),
(518, 230, 2, 0, '2022-01-05 07:16:54'),
(519, 230, 58, 0, '2022-01-05 07:16:54'),
(520, 230, 53, 0, '2022-01-05 07:16:54'),
(521, 231, 2, 0, '2022-01-05 07:19:43'),
(522, 231, 58, 0, '2022-01-05 07:19:43'),
(523, 231, 53, 0, '2022-01-05 07:19:43'),
(524, 232, 66, 0, '2022-01-05 07:19:43'),
(525, 233, 2, 0, '2022-01-05 07:19:48'),
(526, 233, 58, 0, '2022-01-05 07:19:48'),
(527, 233, 53, 0, '2022-01-05 07:19:48'),
(528, 234, 2, 0, '2022-01-05 07:31:53'),
(529, 234, 58, 0, '2022-01-05 07:31:53'),
(530, 234, 53, 0, '2022-01-05 07:31:53'),
(531, 235, 66, 0, '2022-01-05 07:31:53'),
(532, 236, 2, 0, '2022-01-05 07:32:45'),
(533, 236, 58, 0, '2022-01-05 07:32:45'),
(534, 236, 53, 0, '2022-01-05 07:32:45'),
(535, 237, 0, 0, '2022-01-05 07:32:45'),
(536, 238, 66, 0, '2022-01-05 10:04:33'),
(537, 239, 2, 0, '2022-01-05 10:04:33'),
(538, 239, 58, 0, '2022-01-05 10:04:33'),
(539, 239, 53, 0, '2022-01-05 10:04:33'),
(540, 240, 66, 0, '2022-01-05 10:05:46'),
(541, 241, 2, 0, '2022-01-05 10:05:46'),
(542, 241, 58, 0, '2022-01-05 10:05:46'),
(543, 241, 53, 0, '2022-01-05 10:05:46'),
(544, 242, 2, 0, '2022-01-05 10:06:39'),
(545, 242, 58, 0, '2022-01-05 10:06:39'),
(546, 242, 53, 0, '2022-01-05 10:06:39'),
(547, 243, 67, 0, '2022-01-06 16:04:39'),
(548, 244, 2, 0, '2022-01-06 16:04:39'),
(549, 244, 58, 0, '2022-01-06 16:04:39'),
(550, 244, 53, 0, '2022-01-06 16:04:39'),
(551, 245, 67, 0, '2022-01-06 16:05:37'),
(552, 246, 2, 0, '2022-01-06 16:05:37'),
(553, 246, 58, 0, '2022-01-06 16:05:37'),
(554, 246, 53, 0, '2022-01-06 16:05:37'),
(555, 247, 2, 0, '2022-01-06 16:06:40'),
(556, 247, 58, 0, '2022-01-06 16:06:40'),
(557, 247, 53, 0, '2022-01-06 16:06:40'),
(558, 248, 2, 0, '2022-01-06 16:09:38'),
(559, 248, 58, 0, '2022-01-06 16:09:38'),
(560, 248, 53, 0, '2022-01-06 16:09:38'),
(561, 249, 67, 0, '2022-01-06 16:09:38'),
(562, 250, 2, 0, '2022-01-06 16:09:42'),
(563, 250, 58, 0, '2022-01-06 16:09:42'),
(564, 250, 53, 0, '2022-01-06 16:09:42'),
(565, 251, 66, 0, '2022-01-07 05:51:15'),
(566, 252, 2, 0, '2022-01-07 05:51:15'),
(567, 252, 58, 0, '2022-01-07 05:51:15'),
(568, 252, 53, 0, '2022-01-07 05:51:15'),
(569, 253, 66, 0, '2022-01-07 07:13:11'),
(570, 254, 2, 0, '2022-01-07 07:13:11'),
(571, 254, 58, 0, '2022-01-07 07:13:11'),
(572, 254, 53, 0, '2022-01-07 07:13:11'),
(573, 255, 2, 0, '2022-01-07 07:32:51'),
(574, 255, 58, 0, '2022-01-07 07:32:51'),
(575, 255, 53, 0, '2022-01-07 07:32:51'),
(576, 256, 2, 0, '2022-01-07 07:44:56'),
(577, 256, 58, 0, '2022-01-07 07:44:56'),
(578, 256, 53, 0, '2022-01-07 07:44:56'),
(579, 257, 66, 0, '2022-01-07 07:44:56'),
(580, 258, 2, 0, '2022-01-07 07:45:00'),
(581, 258, 58, 0, '2022-01-07 07:45:00'),
(582, 258, 53, 0, '2022-01-07 07:45:00'),
(583, 259, 2, 0, '2022-01-07 08:21:49'),
(584, 259, 58, 0, '2022-01-07 08:21:49'),
(585, 259, 53, 0, '2022-01-07 08:21:49'),
(586, 260, 66, 0, '2022-01-07 08:21:49'),
(587, 261, 2, 0, '2022-01-07 09:56:22'),
(588, 261, 58, 0, '2022-01-07 09:56:22'),
(589, 261, 53, 0, '2022-01-07 09:56:22'),
(590, 262, 67, 0, '2022-01-07 09:56:22'),
(591, 263, 2, 0, '2022-01-07 10:00:47'),
(592, 263, 58, 0, '2022-01-07 10:00:47'),
(593, 263, 53, 0, '2022-01-07 10:00:47'),
(594, 264, 0, 0, '2022-01-07 10:00:47'),
(595, 265, 66, 0, '2022-01-09 12:44:33'),
(596, 266, 2, 0, '2022-01-09 12:44:33'),
(597, 266, 58, 0, '2022-01-09 12:44:33'),
(598, 266, 53, 0, '2022-01-09 12:44:33'),
(599, 267, 66, 0, '2022-01-09 12:46:20'),
(600, 268, 2, 0, '2022-01-09 12:46:20'),
(601, 268, 58, 0, '2022-01-09 12:46:20'),
(602, 268, 53, 0, '2022-01-09 12:46:20'),
(603, 269, 2, 0, '2022-01-09 12:47:53'),
(604, 269, 58, 0, '2022-01-09 12:47:53'),
(605, 269, 53, 0, '2022-01-09 12:47:53'),
(606, 270, 2, 0, '2022-01-09 12:48:20'),
(607, 270, 58, 0, '2022-01-09 12:48:20'),
(608, 270, 53, 0, '2022-01-09 12:48:20'),
(609, 271, 66, 0, '2022-01-09 12:48:20'),
(610, 272, 2, 0, '2022-01-09 12:48:24'),
(611, 272, 58, 0, '2022-01-09 12:48:24'),
(612, 272, 53, 0, '2022-01-09 12:48:24'),
(613, 273, 70, 0, '2022-01-11 07:32:27'),
(614, 274, 2, 0, '2022-01-11 07:32:27'),
(615, 274, 58, 0, '2022-01-11 07:32:27'),
(616, 274, 69, 0, '2022-01-11 07:32:27'),
(617, 274, 53, 0, '2022-01-11 07:32:27'),
(618, 275, 70, 0, '2022-01-11 07:45:14'),
(619, 276, 2, 0, '2022-01-11 07:45:14'),
(620, 276, 58, 0, '2022-01-11 07:45:14'),
(621, 276, 69, 0, '2022-01-11 07:45:14'),
(622, 276, 53, 0, '2022-01-11 07:45:14'),
(623, 277, 2, 0, '2022-01-11 07:47:13'),
(624, 277, 58, 0, '2022-01-11 07:47:13'),
(625, 277, 69, 0, '2022-01-11 07:47:13'),
(626, 277, 53, 0, '2022-01-11 07:47:13'),
(627, 278, 2, 0, '2022-01-11 07:48:13'),
(628, 278, 58, 0, '2022-01-11 07:48:13'),
(629, 278, 69, 0, '2022-01-11 07:48:13'),
(630, 278, 53, 0, '2022-01-11 07:48:13'),
(631, 279, 70, 0, '2022-01-11 07:48:13'),
(632, 280, 2, 0, '2022-01-11 07:48:17'),
(633, 280, 58, 0, '2022-01-11 07:48:17'),
(634, 280, 69, 0, '2022-01-11 07:48:17'),
(635, 280, 53, 0, '2022-01-11 07:48:17'),
(636, 281, 71, 0, '2022-01-12 01:48:36'),
(637, 282, 2, 0, '2022-01-12 01:48:36'),
(638, 282, 58, 0, '2022-01-12 01:48:36'),
(639, 282, 69, 0, '2022-01-12 01:48:36'),
(640, 282, 53, 0, '2022-01-12 01:48:36'),
(641, 283, 71, 0, '2022-01-12 01:50:10'),
(642, 284, 2, 0, '2022-01-12 01:50:10'),
(643, 284, 58, 0, '2022-01-12 01:50:10'),
(644, 284, 69, 0, '2022-01-12 01:50:10'),
(645, 284, 53, 0, '2022-01-12 01:50:10'),
(646, 285, 2, 0, '2022-01-12 01:51:45'),
(647, 285, 58, 0, '2022-01-12 01:51:45'),
(648, 285, 69, 0, '2022-01-12 01:51:45'),
(649, 285, 53, 0, '2022-01-12 01:51:45'),
(650, 286, 72, 0, '2022-01-12 07:32:06'),
(651, 287, 2, 0, '2022-01-12 07:32:06'),
(652, 287, 58, 0, '2022-01-12 07:32:06'),
(653, 287, 69, 0, '2022-01-12 07:32:06'),
(654, 287, 53, 0, '2022-01-12 07:32:06'),
(655, 288, 72, 0, '2022-01-12 07:33:44'),
(656, 289, 2, 0, '2022-01-12 07:33:44'),
(657, 289, 58, 0, '2022-01-12 07:33:44'),
(658, 289, 69, 0, '2022-01-12 07:33:44'),
(659, 289, 53, 0, '2022-01-12 07:33:44'),
(660, 290, 2, 0, '2022-01-12 07:35:12'),
(661, 290, 58, 0, '2022-01-12 07:35:12'),
(662, 290, 69, 0, '2022-01-12 07:35:12'),
(663, 290, 53, 0, '2022-01-12 07:35:12'),
(664, 291, 66, 0, '2022-01-13 08:38:29'),
(665, 292, 2, 0, '2022-01-13 08:38:29'),
(666, 292, 58, 0, '2022-01-13 08:38:29'),
(667, 292, 69, 0, '2022-01-13 08:38:29'),
(668, 292, 53, 0, '2022-01-13 08:38:29'),
(669, 293, 66, 0, '2022-01-13 08:39:08'),
(670, 294, 2, 0, '2022-01-13 08:39:08'),
(671, 294, 58, 0, '2022-01-13 08:39:08'),
(672, 294, 69, 0, '2022-01-13 08:39:08'),
(673, 294, 53, 0, '2022-01-13 08:39:08'),
(674, 295, 2, 0, '2022-01-13 08:40:07'),
(675, 295, 58, 0, '2022-01-13 08:40:07'),
(676, 295, 69, 0, '2022-01-13 08:40:07'),
(677, 295, 53, 0, '2022-01-13 08:40:07'),
(678, 296, 2, 0, '2022-01-13 08:41:19'),
(679, 296, 58, 0, '2022-01-13 08:41:19'),
(680, 296, 69, 0, '2022-01-13 08:41:19'),
(681, 296, 53, 0, '2022-01-13 08:41:19'),
(682, 297, 66, 0, '2022-01-13 08:41:19'),
(683, 298, 2, 0, '2022-01-13 08:41:23'),
(684, 298, 58, 0, '2022-01-13 08:41:23'),
(685, 298, 69, 0, '2022-01-13 08:41:23'),
(686, 298, 53, 0, '2022-01-13 08:41:23'),
(687, 299, 2, 0, '2022-01-13 08:45:26'),
(688, 299, 58, 0, '2022-01-13 08:45:26'),
(689, 299, 69, 0, '2022-01-13 08:45:26'),
(690, 299, 53, 0, '2022-01-13 08:45:26'),
(691, 300, 66, 0, '2022-01-13 08:45:26'),
(692, 301, 73, 0, '2022-01-16 16:52:05'),
(693, 302, 2, 0, '2022-01-16 16:52:05'),
(694, 302, 58, 0, '2022-01-16 16:52:05'),
(695, 302, 69, 0, '2022-01-16 16:52:05'),
(696, 302, 53, 0, '2022-01-16 16:52:05'),
(697, 303, 73, 0, '2022-01-16 16:54:04'),
(698, 304, 2, 0, '2022-01-16 16:54:04'),
(699, 304, 58, 0, '2022-01-16 16:54:04'),
(700, 304, 69, 0, '2022-01-16 16:54:04'),
(701, 304, 53, 0, '2022-01-16 16:54:04'),
(702, 305, 2, 0, '2022-01-16 16:55:36'),
(703, 305, 58, 0, '2022-01-16 16:55:36'),
(704, 305, 69, 0, '2022-01-16 16:55:36'),
(705, 305, 53, 0, '2022-01-16 16:55:36'),
(706, 306, 2, 0, '2022-01-16 16:59:23'),
(707, 306, 58, 0, '2022-01-16 16:59:23'),
(708, 306, 69, 0, '2022-01-16 16:59:23'),
(709, 306, 53, 0, '2022-01-16 16:59:23'),
(710, 307, 73, 0, '2022-01-16 16:59:23'),
(711, 308, 74, 0, '2022-01-16 17:23:09'),
(712, 309, 2, 0, '2022-01-16 17:23:09'),
(713, 309, 58, 0, '2022-01-16 17:23:09'),
(714, 309, 69, 0, '2022-01-16 17:23:09'),
(715, 309, 53, 0, '2022-01-16 17:23:09'),
(716, 310, 74, 0, '2022-01-16 17:25:39'),
(717, 311, 2, 0, '2022-01-16 17:25:39'),
(718, 311, 58, 0, '2022-01-16 17:25:39'),
(719, 311, 69, 0, '2022-01-16 17:25:39'),
(720, 311, 53, 0, '2022-01-16 17:25:39'),
(721, 312, 2, 0, '2022-01-16 17:27:07'),
(722, 312, 58, 0, '2022-01-16 17:27:07'),
(723, 312, 69, 0, '2022-01-16 17:27:07'),
(724, 312, 53, 0, '2022-01-16 17:27:07'),
(725, 313, 2, 0, '2022-01-16 17:28:05'),
(726, 313, 58, 0, '2022-01-16 17:28:05'),
(727, 313, 69, 0, '2022-01-16 17:28:05'),
(728, 313, 53, 0, '2022-01-16 17:28:05'),
(729, 314, 74, 0, '2022-01-16 17:28:05'),
(730, 315, 2, 0, '2022-01-16 17:28:10'),
(731, 315, 58, 0, '2022-01-16 17:28:10'),
(732, 315, 69, 0, '2022-01-16 17:28:10'),
(733, 315, 53, 0, '2022-01-16 17:28:10'),
(734, 316, 2, 0, '2022-01-16 17:28:27'),
(735, 316, 58, 0, '2022-01-16 17:28:27'),
(736, 316, 69, 0, '2022-01-16 17:28:27'),
(737, 316, 53, 0, '2022-01-16 17:28:27'),
(738, 317, 2, 0, '2022-01-16 17:29:26'),
(739, 317, 58, 0, '2022-01-16 17:29:26'),
(740, 317, 69, 0, '2022-01-16 17:29:26'),
(741, 317, 53, 0, '2022-01-16 17:29:26'),
(742, 318, 74, 0, '2022-01-16 17:29:26'),
(743, 319, 74, 0, '2022-01-16 17:48:15'),
(744, 320, 2, 0, '2022-01-16 17:48:15'),
(745, 320, 58, 0, '2022-01-16 17:48:15'),
(746, 320, 69, 0, '2022-01-16 17:48:15'),
(747, 320, 53, 0, '2022-01-16 17:48:15'),
(748, 321, 74, 0, '2022-01-16 17:49:07'),
(749, 322, 2, 0, '2022-01-16 17:49:07'),
(750, 322, 58, 0, '2022-01-16 17:49:07'),
(751, 322, 69, 0, '2022-01-16 17:49:07'),
(752, 322, 53, 0, '2022-01-16 17:49:07'),
(753, 323, 2, 0, '2022-01-16 17:50:41'),
(754, 323, 58, 0, '2022-01-16 17:50:41'),
(755, 323, 69, 0, '2022-01-16 17:50:41'),
(756, 323, 53, 0, '2022-01-16 17:50:41'),
(757, 324, 2, 0, '2022-01-16 17:51:01'),
(758, 324, 58, 0, '2022-01-16 17:51:01'),
(759, 324, 69, 0, '2022-01-16 17:51:01'),
(760, 324, 53, 0, '2022-01-16 17:51:01'),
(761, 325, 74, 0, '2022-01-16 17:51:01'),
(762, 326, 2, 0, '2022-01-16 17:51:05'),
(763, 326, 58, 0, '2022-01-16 17:51:05'),
(764, 326, 69, 0, '2022-01-16 17:51:05'),
(765, 326, 53, 0, '2022-01-16 17:51:05'),
(766, 327, 2, 0, '2022-01-16 17:51:42'),
(767, 327, 58, 0, '2022-01-16 17:51:42'),
(768, 327, 69, 0, '2022-01-16 17:51:42'),
(769, 327, 53, 0, '2022-01-16 17:51:42'),
(770, 328, 74, 0, '2022-01-16 17:51:42'),
(771, 329, 76, 0, '2022-01-16 18:04:52'),
(772, 330, 2, 0, '2022-01-16 18:04:52'),
(773, 330, 58, 0, '2022-01-16 18:04:52'),
(774, 330, 53, 0, '2022-01-16 18:04:52'),
(775, 331, 76, 0, '2022-01-16 18:05:40'),
(776, 332, 2, 0, '2022-01-16 18:05:40'),
(777, 332, 58, 0, '2022-01-16 18:05:40'),
(778, 332, 53, 0, '2022-01-16 18:05:40'),
(779, 333, 2, 0, '2022-01-16 18:06:22'),
(780, 333, 58, 0, '2022-01-16 18:06:22'),
(781, 333, 53, 0, '2022-01-16 18:06:22'),
(782, 334, 2, 0, '2022-01-16 18:06:37'),
(783, 334, 58, 0, '2022-01-16 18:06:37'),
(784, 334, 53, 0, '2022-01-16 18:06:37'),
(785, 335, 76, 0, '2022-01-16 18:06:37'),
(786, 336, 2, 0, '2022-01-16 18:06:41'),
(787, 336, 58, 0, '2022-01-16 18:06:41'),
(788, 336, 53, 0, '2022-01-16 18:06:41'),
(789, 337, 2, 0, '2022-01-16 18:07:04'),
(790, 337, 58, 0, '2022-01-16 18:07:04'),
(791, 337, 53, 0, '2022-01-16 18:07:04'),
(792, 338, 76, 0, '2022-01-16 18:07:04'),
(793, 339, 77, 0, '2022-01-18 12:05:46'),
(794, 340, 2, 0, '2022-01-18 12:05:46'),
(795, 340, 58, 0, '2022-01-18 12:05:46'),
(796, 340, 53, 0, '2022-01-18 12:05:46'),
(797, 341, 77, 0, '2022-01-18 12:08:29'),
(798, 342, 2, 0, '2022-01-18 12:08:29'),
(799, 342, 58, 0, '2022-01-18 12:08:29'),
(800, 342, 53, 0, '2022-01-18 12:08:29'),
(801, 343, 2, 0, '2022-01-18 12:11:41'),
(802, 343, 58, 0, '2022-01-18 12:11:41'),
(803, 343, 53, 0, '2022-01-18 12:11:41'),
(804, 344, 2, 0, '2022-01-18 12:13:58'),
(805, 344, 58, 0, '2022-01-18 12:13:58'),
(806, 344, 53, 0, '2022-01-18 12:13:58'),
(807, 345, 77, 0, '2022-01-18 12:13:58'),
(808, 346, 2, 0, '2022-01-18 12:14:02'),
(809, 346, 58, 0, '2022-01-18 12:14:02'),
(810, 346, 53, 0, '2022-01-18 12:14:02'),
(811, 347, 78, 0, '2022-01-18 12:33:11'),
(812, 348, 2, 0, '2022-01-18 12:33:11'),
(813, 348, 58, 0, '2022-01-18 12:33:11'),
(814, 348, 53, 0, '2022-01-18 12:33:11'),
(815, 349, 78, 0, '2022-01-18 12:35:33'),
(816, 350, 2, 0, '2022-01-18 12:35:33'),
(817, 350, 58, 0, '2022-01-18 12:35:33'),
(818, 350, 53, 0, '2022-01-18 12:35:33'),
(819, 351, 2, 0, '2022-01-18 12:37:09'),
(820, 351, 58, 0, '2022-01-18 12:37:09'),
(821, 351, 53, 0, '2022-01-18 12:37:09'),
(822, 352, 80, 0, '2022-01-18 13:19:37'),
(823, 353, 2, 0, '2022-01-18 13:19:37'),
(824, 353, 58, 0, '2022-01-18 13:19:37'),
(825, 353, 53, 0, '2022-01-18 13:19:37'),
(826, 354, 81, 0, '2022-01-18 13:33:42'),
(827, 355, 2, 0, '2022-01-18 13:33:42'),
(828, 355, 58, 0, '2022-01-18 13:33:42'),
(829, 355, 53, 0, '2022-01-18 13:33:42'),
(830, 356, 81, 0, '2022-01-18 13:34:30'),
(831, 357, 2, 0, '2022-01-18 13:34:30'),
(832, 357, 58, 0, '2022-01-18 13:34:30'),
(833, 357, 53, 0, '2022-01-18 13:34:30'),
(834, 358, 2, 0, '2022-01-20 15:51:17'),
(835, 358, 58, 0, '2022-01-20 15:51:17'),
(836, 358, 53, 0, '2022-01-20 15:51:17'),
(837, 359, 80, 0, '2022-01-20 15:51:17'),
(838, 360, 2, 0, '2022-01-20 15:51:36'),
(839, 360, 58, 0, '2022-01-20 15:51:36'),
(840, 360, 53, 0, '2022-01-20 15:51:36'),
(841, 361, 0, 0, '2022-01-20 15:51:36'),
(842, 362, 80, 0, '2022-01-20 15:53:57'),
(843, 363, 2, 0, '2022-01-20 15:53:57'),
(844, 363, 58, 0, '2022-01-20 15:53:57'),
(845, 363, 53, 0, '2022-01-20 15:53:57'),
(846, 364, 2, 0, '2022-01-20 15:54:33'),
(847, 364, 58, 0, '2022-01-20 15:54:33'),
(848, 364, 53, 0, '2022-01-20 15:54:33'),
(849, 365, 80, 0, '2022-01-20 15:54:33'),
(850, 366, 86, 0, '2022-01-21 10:25:33'),
(851, 367, 2, 0, '2022-01-21 10:25:33'),
(852, 367, 58, 0, '2022-01-21 10:25:33'),
(853, 367, 53, 0, '2022-01-21 10:25:33'),
(854, 368, 2, 0, '2022-01-21 10:28:46'),
(855, 368, 58, 0, '2022-01-21 10:28:46'),
(856, 368, 53, 0, '2022-01-21 10:28:46'),
(857, 369, 86, 0, '2022-01-21 10:28:46'),
(858, 370, 86, 0, '2022-01-21 10:29:24'),
(859, 371, 2, 0, '2022-01-21 10:29:24'),
(860, 371, 58, 0, '2022-01-21 10:29:24'),
(861, 371, 53, 0, '2022-01-21 10:29:24'),
(862, 372, 2, 0, '2022-01-21 10:30:12'),
(863, 372, 58, 0, '2022-01-21 10:30:12'),
(864, 372, 53, 0, '2022-01-21 10:30:12'),
(865, 373, 2, 0, '2022-01-21 10:30:39'),
(866, 373, 58, 0, '2022-01-21 10:30:39'),
(867, 373, 53, 0, '2022-01-21 10:30:39'),
(868, 374, 86, 0, '2022-01-21 10:30:39'),
(869, 375, 2, 0, '2022-01-21 10:30:44'),
(870, 375, 58, 0, '2022-01-21 10:30:44'),
(871, 375, 53, 0, '2022-01-21 10:30:44');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) NOT NULL,
  `user_code` varchar(25) NOT NULL,
  `user_type` enum('admin','medical personel','doctor','patient') DEFAULT NULL,
  `first_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `birthdate` date DEFAULT NULL,
  `age` char(3) DEFAULT NULL,
  `gender` enum('Male','Female') NOT NULL,
  `address` text DEFAULT NULL,
  `phone_number` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `username` varchar(12) NOT NULL,
  `password` varchar(150) NOT NULL,
  `profile` text DEFAULT NULL,
  `created_by` int(10) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `license_number` char(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_code`, `user_type`, `first_name`, `middle_name`, `last_name`, `birthdate`, `age`, `gender`, `address`, `phone_number`, `email`, `username`, `password`, `profile`, `created_by`, `created_at`, `updated_at`, `license_number`) VALUES
(2, 'DR5B141', 'admin', 'Cleaveland', 'Brown', 'Davies', '2021-12-09', '38', 'Male', '606-3727 Ullamcorper. Street', '713-8616', 'admin@vidco-pims.xyz', '', '1111', 'profile', NULL, '2021-12-08 13:28:37', '2021-12-18 10:28:25', NULL),
(52, 'EB2B51', 'medical personel', 'Nar', '', 'Sy', '1981-10-20', '38', 'Female', NULL, '09438524163', 'nar@gmail.com', '', '1234', NULL, NULL, '2022-01-03 08:27:16', '2022-01-03 08:27:16', NULL),
(53, 'DR550352', 'doctor', 'Willy', '', 'Ong', '1978-02-14', '38', 'Male', NULL, '09271231122', 'willy@gmail.com', '', '1234', NULL, NULL, '2022-01-03 08:39:27', '2022-01-03 08:39:27', NULL),
(58, 'DRFBA157', 'doctor', 'Jay ', '', 'Rico', '1990-05-23', '38', 'Male', NULL, '09562357990', 'jayrico23c@gmail.com', '', '2222', NULL, NULL, '2022-01-03 13:15:16', '2022-01-03 13:15:16', NULL),
(68, '400D67', 'medical personel', 'Karol', '', 'Manalo', '1987-01-11', '38', 'Female', NULL, '09042789234', 'Karol@gmail.com', '', '1515', NULL, NULL, '2022-01-07 02:21:33', '2022-01-07 02:21:33', NULL),
(86, 'PT836D68', 'patient', 'Victoria', 'Salvador', 'Meneses', '1990-10-10', '31', 'Female', NULL, '09561234567', 'aryl011811@gmail.com', '', 'XBHSZQ', NULL, NULL, '2022-01-21 10:22:52', '2022-01-21 10:22:52', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attachments`
--
ALTER TABLE `attachments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `classifications`
--
ALTER TABLE `classifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `classification_items`
--
ALTER TABLE `classification_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `classification_remarks`
--
ALTER TABLE `classification_remarks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `classification_respondents`
--
ALTER TABLE `classification_respondents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deployments`
--
ALTER TABLE `deployments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `forms`
--
ALTER TABLE `forms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `form_items`
--
ALTER TABLE `form_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `form_respondents`
--
ALTER TABLE `form_respondents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hospitals`
--
ALTER TABLE `hospitals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `laboratory_requests`
--
ALTER TABLE `laboratory_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `laboratory_results`
--
ALTER TABLE `laboratory_results`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `module_address`
--
ALTER TABLE `module_address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patient_records`
--
ALTER TABLE `patient_records`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `queueing`
--
ALTER TABLE `queueing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `record_form_respondents`
--
ALTER TABLE `record_form_respondents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_notifications`
--
ALTER TABLE `system_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_notification_recipients`
--
ALTER TABLE `system_notification_recipients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_code` (`user_code`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `attachments`
--
ALTER TABLE `attachments`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `classifications`
--
ALTER TABLE `classifications`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `classification_items`
--
ALTER TABLE `classification_items`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `classification_remarks`
--
ALTER TABLE `classification_remarks`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `classification_respondents`
--
ALTER TABLE `classification_respondents`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `deployments`
--
ALTER TABLE `deployments`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `forms`
--
ALTER TABLE `forms`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `form_items`
--
ALTER TABLE `form_items`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `form_respondents`
--
ALTER TABLE `form_respondents`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT for table `hospitals`
--
ALTER TABLE `hospitals`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `laboratory_requests`
--
ALTER TABLE `laboratory_requests`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `laboratory_results`
--
ALTER TABLE `laboratory_results`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `module_address`
--
ALTER TABLE `module_address`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `patient_records`
--
ALTER TABLE `patient_records`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `queueing`
--
ALTER TABLE `queueing`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `record_form_respondents`
--
ALTER TABLE `record_form_respondents`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT for table `system_notifications`
--
ALTER TABLE `system_notifications`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=376;

--
-- AUTO_INCREMENT for table `system_notification_recipients`
--
ALTER TABLE `system_notification_recipients`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=872;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
