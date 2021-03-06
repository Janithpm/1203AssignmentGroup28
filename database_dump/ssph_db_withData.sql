-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 02, 2021 at 07:23 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ssph_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendent`
--

CREATE TABLE `attendent` (
  `employeeID` int(11) NOT NULL,
  `hourly_charge_rate` float(6,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `attendent`
--

INSERT INTO `attendent` (`employeeID`, `hourly_charge_rate`) VALUES
(1005, 100.00),
(1009, 150.00),
(1015, 200.00),
(1017, 120.00),
(1023, 175.00);

-- --------------------------------------------------------

--
-- Table structure for table `bed`
--

CREATE TABLE `bed` (
  `bedID` int(11) NOT NULL,
  `wordID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bed`
--

INSERT INTO `bed` (`bedID`, `wordID`) VALUES
(1, 101),
(2, 101),
(9, 102),
(10, 102),
(3, 103),
(4, 103),
(5, 103),
(7, 104),
(11, 104),
(12, 104),
(6, 105),
(8, 105);

-- --------------------------------------------------------

--
-- Table structure for table `cleaner`
--

CREATE TABLE `cleaner` (
  `employeeID` int(11) NOT NULL,
  `contract_no` varchar(10) NOT NULL,
  `start_date` date NOT NULL DEFAULT curdate(),
  `end_date` date NOT NULL DEFAULT curdate()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cleaner`
--

INSERT INTO `cleaner` (`employeeID`, `contract_no`, `start_date`, `end_date`) VALUES
(1006, '765858940', '2001-08-07', '2010-05-30'),
(1008, '761221321', '2010-05-18', '2010-05-30'),
(1011, '717447566', '2009-11-22', '2010-05-30'),
(1012, '751515236', '2011-10-16', '2018-10-16'),
(1024, '785221300', '2008-09-12', '2010-05-30');

-- --------------------------------------------------------

--
-- Table structure for table `diagnose`
--

CREATE TABLE `diagnose` (
  `diagnosisCode` int(11) NOT NULL,
  `patientID` int(11) NOT NULL,
  `diagnosed_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `diagnosis`
--

CREATE TABLE `diagnosis` (
  `diagnosisCode` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `description` varchar(255) NOT NULL,
  `diagnosed_date` date NOT NULL DEFAULT curdate(),
  `diagnosed_time` time NOT NULL DEFAULT curtime()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `diagnostic_unit`
--

CREATE TABLE `diagnostic_unit` (
  `unitID` int(11) NOT NULL,
  `unit_name` varchar(30) NOT NULL,
  `managed_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `diagnostic_unit`
--

INSERT INTO `diagnostic_unit` (`unitID`, `unit_name`, `managed_by`) VALUES
(1, 'Critical Care', 1013),
(2, 'Radiology', 1019),
(3, 'Clinical Laboratory', 1020),
(4, 'General Service', 1025),
(5, 'Cardiac unit', 1003);

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `employeeID` int(11) NOT NULL,
  `DEA_no` varchar(10) NOT NULL,
  `speciality` varchar(100) DEFAULT NULL,
  `med_council_reg_no` varchar(10) NOT NULL,
  `medC_joined_date` date NOT NULL DEFAULT curdate(),
  `medC_resigned_date` date NOT NULL DEFAULT curdate()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`employeeID`, `DEA_no`, `speciality`, `med_council_reg_no`, `medC_joined_date`, `medC_resigned_date`) VALUES
(1003, '200', 'General Surgeon', '190044D', '2014-04-23', '2010-12-30'),
(1004, '202', 'Cardiologist', '200087D', '2010-08-30', '2010-12-30'),
(1014, '205', 'Psychiatrist', '200099D', '2002-07-05', '2010-12-30'),
(1020, '203', 'Neurology', '180075D', '2000-08-15', '2010-12-30');

-- --------------------------------------------------------

--
-- Table structure for table `drug`
--

CREATE TABLE `drug` (
  `drugCode` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `type` varchar(25) NOT NULL,
  `unit_cost` float(7,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `emegency_contact`
--

CREATE TABLE `emegency_contact` (
  `patientID` int(11) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `relationship` varchar(30) NOT NULL,
  `contact_no` varchar(12) NOT NULL,
  `address` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `employeeID` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `working_status` char(1) NOT NULL DEFAULT 'F',
  `contact_no` varchar(12) NOT NULL,
  `address` varchar(50) NOT NULL,
  `type` varchar(15) NOT NULL,
  `job_type` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`employeeID`, `name`, `working_status`, `contact_no`, `address`, `type`, `job_type`) VALUES
(1001, 'Janith Madarasinghe', 'F', '0704685081', '49/1/A, Dewsirigama Rd, Kekanadura', 'NON_MED_STAFF', 'MANG'),
(1002, 'Keethapriya Manoharan', 'F', '0774589545', 'School Lane, Kokuvil, Jaffna.', 'MED_STAFF', 'NUR'),
(1003, 'Madushan A K D T', 'F', '0765548969', 'No.63, Norris Canal Road, Colombo.', 'MED_STAFF', 'DOC'),
(1004, 'Dulanjana Mathangadeera', 'P', '0761254779', 'No.4, Bambalapitiya, Colombo.', 'MED_STAFF', 'DOC'),
(1005, 'Dilshan', 'P', '0758964721', 'Old Moor street, Colombo.', 'NON_MED_STAFF', 'ATD'),
(1006, 'Dasuni', 'P', '0772569696', 'No.11, Galle Road.', 'NON_MED_STAFF', 'CLN'),
(1007, 'Geerthanan', 'F', '0782511445', 'Temple Road, Negombo.', 'MED_STAFF', 'NUR'),
(1008, 'Bandara', 'P', '0773257850', 'Old Negombo Road, Ja-Ela.', 'NON_MED_STAFF', 'CLN'),
(1009, 'Dunuwila', 'P', '0714569898', 'No.81, Bus Stand Avenue, Colombo.', 'NON_MED_STAFF', 'ATD'),
(1010, 'Hivaskar', 'P', '0702583652', 'Main Street, Batticaloa.', 'MED_STAFF', 'NUR'),
(1011, 'Chandrasiri', 'F', '0714518585', 'No.36, 1st Floor, Kandy', 'NON_MED_STAFF', 'CLN'),
(1012, 'Abeysooriya', 'P', '0711256523', 'Bazaar Street, Batticaloa.', 'NON_MED_STAFF', 'CLN'),
(1013, 'Jayasena', 'P', '0774030102', '1st Floor, Siva Complex, Kandy.', 'MED_STAFF', 'NUR'),
(1014, 'Kilintan', 'F', '0765327899', 'No153, Colombo Road, Galle.', 'MED_STAFF', 'DOC'),
(1015, 'Gunathilaka', 'P', '0785519121', 'Main Street, Colombo.', 'NON_MED_STAFF', 'ATD'),
(1016, 'Victar', 'P', '0754325967', 'Peradeniya Road, Kandy.', 'MED_STAFF', 'NUR'),
(1017, 'Saroj', 'P', '0715024009', 'Old Moor street, Colombo.', 'NON_MED_STAFF', 'ATD'),
(1018, 'Rathnakumara', 'F', '0778804555', 'Stanley Road, Jaffna.', 'MED_STAFF', 'NUR'),
(1019, 'Priyankara', 'F', '0763658021', 'Temple Road, Negombo.', 'MED_STAFF', 'NUR'),
(1020, 'Prasad', 'P', '0782014507', 'Moor Street, Mannar.', 'MED_STAFF', 'DOC'),
(1021, 'Rishanka', 'P', '0704128402', 'Point Pedro Road, Jaffna.', 'MED_STAFF', 'NUR'),
(1022, 'Silva', 'F', '0776895200', 'New Moor street, Colombo.', 'MED_STAFF', 'NUR'),
(1023, 'Thanushan', 'P', '0711102250', 'No.35, New Town, Kurunegala.', 'NON_MED_STAFF', 'ATD'),
(1024, 'Divakar', 'P', '0779938839', 'Moratuwa Road, Piliyandala.', 'NON_MED_STAFF', 'CLN'),
(1025, 'Lisomitha', 'P', '0773381782', 'Yarl Road, Jaffna.', 'MED_STAFF', 'NUR');

-- --------------------------------------------------------

--
-- Table structure for table `insurance`
--

CREATE TABLE `insurance` (
  `patientID` int(11) NOT NULL,
  `company_name` varchar(30) NOT NULL,
  `branch_name` varchar(30) NOT NULL,
  `contact_no` varchar(12) NOT NULL,
  `branch_address` varchar(50) NOT NULL,
  `sub_fname` varchar(30) DEFAULT NULL,
  `sub_lname` varchar(30) DEFAULT NULL,
  `sub_relationship` varchar(30) DEFAULT NULL,
  `sub_contact_no` varchar(12) DEFAULT NULL,
  `sub_address` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `in_patient`
--

CREATE TABLE `in_patient` (
  `patientID` int(11) NOT NULL,
  `bedID` int(11) NOT NULL,
  `admit_by` int(11) NOT NULL,
  `admited_date` date NOT NULL DEFAULT curdate(),
  `admited_time` time NOT NULL DEFAULT curtime(),
  `discharged_date` date DEFAULT NULL,
  `discharged_time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `in_patient`
--

INSERT INTO `in_patient` (`patientID`, `bedID`, `admit_by`, `admited_date`, `admited_time`, `discharged_date`, `discharged_time`) VALUES
(10001, 1, 1003, '2010-04-16', '07:35:00', NULL, NULL),
(10003, 4, 1003, '2011-07-25', '08:40:00', NULL, NULL),
(10005, 8, 1003, '2012-07-25', '10:10:00', NULL, NULL),
(10006, 9, 1004, '2012-11-17', '09:45:00', NULL, NULL),
(10007, 10, 1004, '2014-12-06', '11:31:00', NULL, NULL),
(10009, 2, 1004, '2015-05-06', '15:25:00', NULL, NULL),
(10010, 3, 1004, '2015-09-24', '13:22:00', NULL, NULL),
(10011, 7, 1020, '2015-12-25', '06:20:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `in_patient_daily_record`
--

CREATE TABLE `in_patient_daily_record` (
  `patientID` int(11) NOT NULL,
  `recorded_date` date NOT NULL DEFAULT curdate(),
  `recorded_time` time NOT NULL DEFAULT curtime(),
  `pulse` int(11) NOT NULL,
  `blood_presure` float(5,2) NOT NULL,
  `weight` float(5,2) NOT NULL,
  `temperature` float(4,2) NOT NULL,
  `symptoms` varchar(255) NOT NULL,
  `recorded_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `in_patient_daily_record`
--

INSERT INTO `in_patient_daily_record` (`patientID`, `recorded_date`, `recorded_time`, `pulse`, `blood_presure`, `weight`, `temperature`, `symptoms`, `recorded_by`) VALUES
(10001, '2010-04-15', '12:00:00', 71, 133.00, 66.45, 37.00, 'Breathing problems, low energy', 1002),
(10003, '2011-07-24', '13:00:00', 85, 145.00, 49.50, 38.40, 'Abdominal pain, Vomiting', 1021),
(10005, '2012-07-24', '15:15:00', 82, 135.00, 60.82, 57.50, 'Chest pain', 1025),
(10006, '2012-11-16', '12:00:00', 90, 110.00, 74.00, 38.40, 'Fever, Headache', 1002),
(10007, '2014-12-05', '14:25:00', 74, 145.00, 70.25, 38.00, 'Arm Weakness, Loss of vision', 1022),
(10009, '2015-05-05', '18:30:00', 70, 80.00, 55.00, 38.60, 'Fever, Headache', 1007),
(10010, '2015-09-22', '11:50:00', 77, 110.00, 54.00, 37.60, 'low breathing, low energy', 1025),
(10011, '2015-12-24', '15:30:00', 80, 90.00, 49.23, 37.20, 'Heartburn, pain', 1013);

-- --------------------------------------------------------

--
-- Table structure for table `login_credentials`
--

CREATE TABLE `login_credentials` (
  `employeeID` int(11) NOT NULL,
  `usr_name` varchar(20) NOT NULL,
  `pwd` varchar(50) NOT NULL,
  `type` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `login_credentials`
--

INSERT INTO `login_credentials` (`employeeID`, `usr_name`, `pwd`, `type`) VALUES
(1000, 'sysAdmin', 'admin', 'MANG'),
(1001, 'madarasingheJP', 'J1001', 'MANG'),
(1002, 'ManoharanK', 'K1002', 'NUR'),
(1003, 'madushanAKDT', 'A1003', 'DOC'),
(1004, 'mathangadeeraDD', 'D1004', 'MANG');

-- --------------------------------------------------------

--
-- Table structure for table `nurse`
--

CREATE TABLE `nurse` (
  `employeeID` int(11) NOT NULL,
  `med_council_reg_no` varchar(10) NOT NULL,
  `medC_joined_date` date NOT NULL DEFAULT curdate(),
  `medC_resigned_date` date NOT NULL DEFAULT curdate()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `nurse`
--

INSERT INTO `nurse` (`employeeID`, `med_council_reg_no`, `medC_joined_date`, `medC_resigned_date`) VALUES
(1002, '191148N', '1999-02-04', '2014-10-27'),
(1007, '201165N', '2005-12-03', '2005-09-28'),
(1010, '201178N', '1995-05-15', '2005-09-28'),
(1013, '181274N', '2011-04-05', '2000-05-12'),
(1016, '191145N', '2002-12-23', '2005-09-28'),
(1018, '181274N', '2011-04-05', '2000-05-12'),
(1019, '201230N', '2002-07-15', '2000-05-12'),
(1021, '191285N', '1994-04-22', '2000-05-12'),
(1022, '181247N', '2009-06-24', '1998-07-30'),
(1025, '191166N', '1990-08-02', '1998-07-30');

-- --------------------------------------------------------

--
-- Table structure for table `out_patient`
--

CREATE TABLE `out_patient` (
  `patientID` int(11) NOT NULL,
  `arrived_date` date NOT NULL DEFAULT curdate(),
  `arrived_time` time NOT NULL DEFAULT curtime()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `out_patient`
--

INSERT INTO `out_patient` (`patientID`, `arrived_date`, `arrived_time`) VALUES
(10002, '2020-12-07', '01:05:00'),
(10004, '2020-12-02', '14:25:00'),
(10008, '2021-04-25', '12:30:00'),
(10012, '2021-08-10', '09:40:00');

-- --------------------------------------------------------

--
-- Table structure for table `out_patient_record`
--

CREATE TABLE `out_patient_record` (
  `patientID` int(11) NOT NULL,
  `recorded_date` date NOT NULL DEFAULT curdate(),
  `recorded_time` time NOT NULL DEFAULT curtime(),
  `pulse` int(11) NOT NULL,
  `blood_presure` float(5,2) NOT NULL,
  `weight` float(5,2) NOT NULL,
  `temperature` float(4,2) NOT NULL,
  `symptoms` varchar(255) NOT NULL,
  `recorded_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `out_patient_record`
--

INSERT INTO `out_patient_record` (`patientID`, `recorded_date`, `recorded_time`, `pulse`, `blood_presure`, `weight`, `temperature`, `symptoms`, `recorded_by`) VALUES
(10002, '2020-12-07', '10:10:00', 77, 90.00, 52.50, 37.10, 'Back pain', 1002),
(10004, '2020-12-02', '18:10:00', 65, 120.00, 50.85, 36.50, 'Depression', 1025),
(10008, '2021-04-25', '16:05:00', 84, 127.00, 62.10, 37.00, 'Headache', 1016),
(10012, '2021-08-10', '13:40:00', 69, 95.00, 62.07, 38.90, 'Rash, Itching', 1025);

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `patientID` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `dob` date NOT NULL,
  `type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`patientID`, `name`, `dob`, `type`) VALUES
(10001, 'Subasingha', '1995-05-18', 'IN'),
(10002, 'Abilash', '1999-09-06', 'OUT'),
(10003, 'Nirotha', '2000-04-23', 'IN'),
(10004, 'Kavin', '2003-08-24', 'OUT'),
(10005, 'Piruntha', '1995-11-01', 'IN'),
(10006, 'Jashotha', '1988-08-25', 'IN'),
(10007, 'Aswin', '1975-10-20', 'IN'),
(10008, 'Alwis', '1989-12-10', 'OUT'),
(10009, 'Ramgy', '1990-06-30', 'IN'),
(10010, 'Rishanka', '2004-04-07', 'IN'),
(10011, 'Priyankara', '1990-01-07', 'IN'),
(10012, 'Nalin', '2010-05-09', 'OUT');

-- --------------------------------------------------------

--
-- Table structure for table `patient_admit`
--

CREATE TABLE `patient_admit` (
  `patientID` int(11) NOT NULL,
  `admited_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `patient_assign_to`
--

CREATE TABLE `patient_assign_to` (
  `patientID` int(11) NOT NULL,
  `wordID` int(11) NOT NULL,
  `admit_date` date NOT NULL DEFAULT curdate(),
  `admit_time` time NOT NULL DEFAULT curtime(),
  `discharge_date` date DEFAULT NULL,
  `discharge_time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `supply`
--

CREATE TABLE `supply` (
  `drugCode` int(11) NOT NULL,
  `regNo` int(11) NOT NULL,
  `type` varchar(25) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_cost` float(7,2) NOT NULL,
  `supply_date` date NOT NULL DEFAULT curdate()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `testCode` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `cost` float(7,2) NOT NULL,
  `diagnostic_unitID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `treat`
--

CREATE TABLE `treat` (
  `treatmentID` int(11) NOT NULL,
  `patientID` int(11) NOT NULL,
  `treated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `treatment`
--

CREATE TABLE `treatment` (
  `treatmentID` int(11) NOT NULL,
  `treatment_type` varchar(10) NOT NULL,
  `treatment_date` date NOT NULL DEFAULT curdate(),
  `treatment_time` time NOT NULL DEFAULT curtime()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `unit_employee`
--

CREATE TABLE `unit_employee` (
  `employeeID` int(11) NOT NULL,
  `unitID` int(11) NOT NULL,
  `hours_per_week` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `vendor`
--

CREATE TABLE `vendor` (
  `regNo` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `contact_no` varchar(12) NOT NULL,
  `address` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vendor`
--

INSERT INTO `vendor` (`regNo`, `name`, `contact_no`, `address`) VALUES
(101, 'Tabrane Pharmaceuticals.', '0714578999', '1st Floor, Mill Road, Vavuniya.'),
(102, 'Hemas Pharmaceuticals (Pvt) Lt', '0771212100', 'No.4, Bambalapitiya.'),
(103, 'Navesta Pharmaceuticals.', '0712010990', 'Stanley Road, Jaffna.'),
(104, 'Astron Limited.', '0783939221', '1st Floor, 3rd Lane, Ampara.'),
(105, 'Slim Pharmaceuticals (Pvt) Ltd', '0753301122', 'Main Street, Kaduruwela.');

-- --------------------------------------------------------

--
-- Table structure for table `word`
--

CREATE TABLE `word` (
  `wordID` int(11) NOT NULL,
  `word_name` varchar(25) DEFAULT NULL,
  `managed_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `word`
--

INSERT INTO `word` (`wordID`, `word_name`, `managed_by`) VALUES
(101, 'M1', 1004),
(102, 'M2', 1013),
(103, 'F1', 1022),
(104, 'F2', 1014),
(105, 'M3', 1002);

-- --------------------------------------------------------

--
-- Table structure for table `word_employee`
--

CREATE TABLE `word_employee` (
  `employeeID` int(11) NOT NULL,
  `wordID` int(11) NOT NULL,
  `hours_per_week` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendent`
--
ALTER TABLE `attendent`
  ADD PRIMARY KEY (`employeeID`);

--
-- Indexes for table `bed`
--
ALTER TABLE `bed`
  ADD PRIMARY KEY (`bedID`),
  ADD KEY `wordID` (`wordID`);

--
-- Indexes for table `cleaner`
--
ALTER TABLE `cleaner`
  ADD PRIMARY KEY (`employeeID`);

--
-- Indexes for table `diagnose`
--
ALTER TABLE `diagnose`
  ADD PRIMARY KEY (`diagnosisCode`,`patientID`,`diagnosed_by`),
  ADD KEY `patientID` (`patientID`),
  ADD KEY `diagnosed_by` (`diagnosed_by`);

--
-- Indexes for table `diagnosis`
--
ALTER TABLE `diagnosis`
  ADD PRIMARY KEY (`diagnosisCode`);

--
-- Indexes for table `diagnostic_unit`
--
ALTER TABLE `diagnostic_unit`
  ADD PRIMARY KEY (`unitID`),
  ADD KEY `diagnostic_unit_ibfk_1` (`managed_by`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`employeeID`);

--
-- Indexes for table `drug`
--
ALTER TABLE `drug`
  ADD PRIMARY KEY (`drugCode`);

--
-- Indexes for table `emegency_contact`
--
ALTER TABLE `emegency_contact`
  ADD PRIMARY KEY (`patientID`,`first_name`,`last_name`) USING BTREE;

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employeeID`);

--
-- Indexes for table `insurance`
--
ALTER TABLE `insurance`
  ADD PRIMARY KEY (`patientID`);

--
-- Indexes for table `in_patient`
--
ALTER TABLE `in_patient`
  ADD PRIMARY KEY (`patientID`),
  ADD KEY `admit_by` (`admit_by`),
  ADD KEY `in_patient_ibfk_1` (`bedID`);

--
-- Indexes for table `in_patient_daily_record`
--
ALTER TABLE `in_patient_daily_record`
  ADD PRIMARY KEY (`patientID`,`recorded_date`,`recorded_time`),
  ADD KEY `recorded_by` (`recorded_by`);

--
-- Indexes for table `login_credentials`
--
ALTER TABLE `login_credentials`
  ADD PRIMARY KEY (`employeeID`);

--
-- Indexes for table `nurse`
--
ALTER TABLE `nurse`
  ADD PRIMARY KEY (`employeeID`);

--
-- Indexes for table `out_patient`
--
ALTER TABLE `out_patient`
  ADD PRIMARY KEY (`patientID`);

--
-- Indexes for table `out_patient_record`
--
ALTER TABLE `out_patient_record`
  ADD PRIMARY KEY (`patientID`,`recorded_date`,`recorded_time`),
  ADD KEY `recorded_by` (`recorded_by`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`patientID`);

--
-- Indexes for table `patient_admit`
--
ALTER TABLE `patient_admit`
  ADD PRIMARY KEY (`patientID`),
  ADD KEY `admited_by` (`admited_by`);

--
-- Indexes for table `patient_assign_to`
--
ALTER TABLE `patient_assign_to`
  ADD PRIMARY KEY (`patientID`),
  ADD KEY `wordID` (`wordID`);

--
-- Indexes for table `supply`
--
ALTER TABLE `supply`
  ADD PRIMARY KEY (`drugCode`,`regNo`,`supply_date`) USING BTREE,
  ADD KEY `regNo` (`regNo`);

--
-- Indexes for table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`testCode`),
  ADD KEY `diagnostic_unitID` (`diagnostic_unitID`);

--
-- Indexes for table `treat`
--
ALTER TABLE `treat`
  ADD PRIMARY KEY (`treatmentID`,`patientID`,`treated_by`),
  ADD KEY `patientID` (`patientID`),
  ADD KEY `treated_by` (`treated_by`);

--
-- Indexes for table `treatment`
--
ALTER TABLE `treatment`
  ADD PRIMARY KEY (`treatmentID`);

--
-- Indexes for table `unit_employee`
--
ALTER TABLE `unit_employee`
  ADD PRIMARY KEY (`employeeID`,`unitID`),
  ADD KEY `unitID` (`unitID`);

--
-- Indexes for table `vendor`
--
ALTER TABLE `vendor`
  ADD PRIMARY KEY (`regNo`);

--
-- Indexes for table `word`
--
ALTER TABLE `word`
  ADD PRIMARY KEY (`wordID`),
  ADD KEY `word_ibfk_1` (`managed_by`);

--
-- Indexes for table `word_employee`
--
ALTER TABLE `word_employee`
  ADD PRIMARY KEY (`employeeID`,`wordID`),
  ADD KEY `wordID` (`wordID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bed`
--
ALTER TABLE `bed`
  MODIFY `bedID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `diagnosis`
--
ALTER TABLE `diagnosis`
  MODIFY `diagnosisCode` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `diagnostic_unit`
--
ALTER TABLE `diagnostic_unit`
  MODIFY `unitID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `drug`
--
ALTER TABLE `drug`
  MODIFY `drugCode` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `employeeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1026;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `patientID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10013;

--
-- AUTO_INCREMENT for table `test`
--
ALTER TABLE `test`
  MODIFY `testCode` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `treatment`
--
ALTER TABLE `treatment`
  MODIFY `treatmentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `vendor`
--
ALTER TABLE `vendor`
  MODIFY `regNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `word`
--
ALTER TABLE `word`
  MODIFY `wordID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendent`
--
ALTER TABLE `attendent`
  ADD CONSTRAINT `attendent_ibfk_1` FOREIGN KEY (`employeeID`) REFERENCES `employee` (`employeeID`) ON DELETE CASCADE;

--
-- Constraints for table `bed`
--
ALTER TABLE `bed`
  ADD CONSTRAINT `bed_ibfk_1` FOREIGN KEY (`wordID`) REFERENCES `word` (`wordID`) ON DELETE SET NULL;

--
-- Constraints for table `cleaner`
--
ALTER TABLE `cleaner`
  ADD CONSTRAINT `cleaner_ibfk_1` FOREIGN KEY (`employeeID`) REFERENCES `employee` (`employeeID`) ON DELETE CASCADE;

--
-- Constraints for table `diagnose`
--
ALTER TABLE `diagnose`
  ADD CONSTRAINT `diagnose_ibfk_1` FOREIGN KEY (`diagnosisCode`) REFERENCES `diagnosis` (`diagnosisCode`),
  ADD CONSTRAINT `diagnose_ibfk_2` FOREIGN KEY (`patientID`) REFERENCES `patient` (`patientID`),
  ADD CONSTRAINT `diagnose_ibfk_3` FOREIGN KEY (`diagnosed_by`) REFERENCES `doctor` (`employeeID`);

--
-- Constraints for table `diagnostic_unit`
--
ALTER TABLE `diagnostic_unit`
  ADD CONSTRAINT `diagnostic_unit_ibfk_1` FOREIGN KEY (`managed_by`) REFERENCES `employee` (`employeeID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `doctor`
--
ALTER TABLE `doctor`
  ADD CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`employeeID`) REFERENCES `employee` (`employeeID`) ON DELETE CASCADE;

--
-- Constraints for table `emegency_contact`
--
ALTER TABLE `emegency_contact`
  ADD CONSTRAINT `emegency_contact_ibfk_1` FOREIGN KEY (`patientID`) REFERENCES `in_patient` (`patientID`) ON DELETE CASCADE;

--
-- Constraints for table `insurance`
--
ALTER TABLE `insurance`
  ADD CONSTRAINT `insurance_ibfk_1` FOREIGN KEY (`patientID`) REFERENCES `in_patient` (`patientID`) ON DELETE CASCADE;

--
-- Constraints for table `in_patient`
--
ALTER TABLE `in_patient`
  ADD CONSTRAINT `in_patient_ibfk_1` FOREIGN KEY (`bedID`) REFERENCES `bed` (`bedID`) ON DELETE NO ACTION,
  ADD CONSTRAINT `in_patient_ibfk_2` FOREIGN KEY (`admit_by`) REFERENCES `doctor` (`employeeID`) ON DELETE NO ACTION,
  ADD CONSTRAINT `in_patient_ibfk_3` FOREIGN KEY (`patientID`) REFERENCES `patient` (`patientID`) ON DELETE CASCADE;

--
-- Constraints for table `in_patient_daily_record`
--
ALTER TABLE `in_patient_daily_record`
  ADD CONSTRAINT `in_patient_daily_record_ibfk_1` FOREIGN KEY (`patientID`) REFERENCES `in_patient` (`patientID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `in_patient_daily_record_ibfk_2` FOREIGN KEY (`recorded_by`) REFERENCES `nurse` (`employeeID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `nurse`
--
ALTER TABLE `nurse`
  ADD CONSTRAINT `nurse_ibfk_1` FOREIGN KEY (`employeeID`) REFERENCES `employee` (`employeeID`) ON DELETE CASCADE;

--
-- Constraints for table `out_patient`
--
ALTER TABLE `out_patient`
  ADD CONSTRAINT `out_patient_ibfk_1` FOREIGN KEY (`patientID`) REFERENCES `patient` (`patientID`) ON DELETE CASCADE;

--
-- Constraints for table `out_patient_record`
--
ALTER TABLE `out_patient_record`
  ADD CONSTRAINT `out_patient_record_ibfk_1` FOREIGN KEY (`patientID`) REFERENCES `out_patient` (`patientID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `out_patient_record_ibfk_2` FOREIGN KEY (`recorded_by`) REFERENCES `nurse` (`employeeID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `patient_admit`
--
ALTER TABLE `patient_admit`
  ADD CONSTRAINT `patient_admit_ibfk_1` FOREIGN KEY (`patientID`) REFERENCES `patient` (`patientID`) ON DELETE NO ACTION,
  ADD CONSTRAINT `patient_admit_ibfk_2` FOREIGN KEY (`admited_by`) REFERENCES `doctor` (`employeeID`) ON DELETE NO ACTION;

--
-- Constraints for table `patient_assign_to`
--
ALTER TABLE `patient_assign_to`
  ADD CONSTRAINT `patient_assign_to_ibfk_1` FOREIGN KEY (`patientID`) REFERENCES `in_patient` (`patientID`) ON DELETE CASCADE,
  ADD CONSTRAINT `patient_assign_to_ibfk_2` FOREIGN KEY (`wordID`) REFERENCES `word` (`wordID`) ON DELETE NO ACTION;

--
-- Constraints for table `supply`
--
ALTER TABLE `supply`
  ADD CONSTRAINT `supply_ibfk_1` FOREIGN KEY (`drugCode`) REFERENCES `drug` (`drugCode`),
  ADD CONSTRAINT `supply_ibfk_2` FOREIGN KEY (`regNo`) REFERENCES `vendor` (`regNo`);

--
-- Constraints for table `test`
--
ALTER TABLE `test`
  ADD CONSTRAINT `test_ibfk_1` FOREIGN KEY (`diagnostic_unitID`) REFERENCES `diagnostic_unit` (`unitID`) ON DELETE NO ACTION;

--
-- Constraints for table `treat`
--
ALTER TABLE `treat`
  ADD CONSTRAINT `treat_ibfk_1` FOREIGN KEY (`treatmentID`) REFERENCES `treatment` (`treatmentID`),
  ADD CONSTRAINT `treat_ibfk_2` FOREIGN KEY (`patientID`) REFERENCES `patient` (`patientID`),
  ADD CONSTRAINT `treat_ibfk_3` FOREIGN KEY (`treated_by`) REFERENCES `doctor` (`employeeID`);

--
-- Constraints for table `unit_employee`
--
ALTER TABLE `unit_employee`
  ADD CONSTRAINT `unit_employee_ibfk_1` FOREIGN KEY (`employeeID`) REFERENCES `employee` (`employeeID`) ON DELETE CASCADE,
  ADD CONSTRAINT `unit_employee_ibfk_2` FOREIGN KEY (`unitID`) REFERENCES `diagnostic_unit` (`unitID`) ON DELETE CASCADE;

--
-- Constraints for table `word`
--
ALTER TABLE `word`
  ADD CONSTRAINT `word_ibfk_1` FOREIGN KEY (`managed_by`) REFERENCES `employee` (`employeeID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `word_employee`
--
ALTER TABLE `word_employee`
  ADD CONSTRAINT `word_employee_ibfk_1` FOREIGN KEY (`employeeID`) REFERENCES `employee` (`employeeID`) ON DELETE CASCADE,
  ADD CONSTRAINT `word_employee_ibfk_2` FOREIGN KEY (`wordID`) REFERENCES `word` (`wordID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
