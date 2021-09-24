-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 24, 2021 at 07:59 PM
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

-- --------------------------------------------------------

--
-- Table structure for table `bed`
--

CREATE TABLE `bed` (
  `bedID` int(11) NOT NULL,
  `wordID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `unit_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `employeeID` int(11) NOT NULL,
  `DEA_no` varchar(10) NOT NULL,
  `specility` varchar(100) DEFAULT NULL,
  `name` varchar(30) NOT NULL,
  `working_status` char(1) NOT NULL DEFAULT 'P',
  `contact_no` varchar(12) NOT NULL,
  `med_council_reg_no` varchar(10) NOT NULL,
  `medC_joined_date` date NOT NULL DEFAULT curdate(),
  `medC_resigned_date` date NOT NULL DEFAULT curdate()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
-- Table structure for table `insurence`
--

CREATE TABLE `insurence` (
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

-- --------------------------------------------------------

--
-- Table structure for table `non_medical_staff`
--

CREATE TABLE `non_medical_staff` (
  `employeeID` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `type` varchar(15) DEFAULT NULL,
  `working_status` char(1) NOT NULL DEFAULT 'F',
  `address` varchar(50) DEFAULT NULL,
  `contact_no` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `nurse`
--

CREATE TABLE `nurse` (
  `employeeID` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `med_council_reg_no` varchar(10) NOT NULL,
  `working_status` char(1) NOT NULL DEFAULT 'F',
  `address` varchar(50) NOT NULL,
  `contact_no` varchar(12) NOT NULL,
  `medC_joined_date` date NOT NULL DEFAULT curdate(),
  `medC_resigned_date` date NOT NULL DEFAULT curdate()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `out_patient`
--

CREATE TABLE `out_patient` (
  `patientID` int(11) NOT NULL,
  `arrived_date` date NOT NULL DEFAULT curdate(),
  `arrived_time` time NOT NULL DEFAULT curtime()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
-- Table structure for table `vendor`
--

CREATE TABLE `vendor` (
  `regNo` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `contact_no` varchar(12) NOT NULL,
  `address` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `word`
--

CREATE TABLE `word` (
  `wordID` int(11) NOT NULL,
  `word_name` varchar(25) DEFAULT NULL
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
  ADD PRIMARY KEY (`unitID`);

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
  ADD PRIMARY KEY (`patientID`);

--
-- Indexes for table `insurence`
--
ALTER TABLE `insurence`
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
-- Indexes for table `non_medical_staff`
--
ALTER TABLE `non_medical_staff`
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
  ADD PRIMARY KEY (`drugCode`,`regNo`),
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
-- Indexes for table `vendor`
--
ALTER TABLE `vendor`
  ADD PRIMARY KEY (`regNo`);

--
-- Indexes for table `word`
--
ALTER TABLE `word`
  ADD PRIMARY KEY (`wordID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bed`
--
ALTER TABLE `bed`
  MODIFY `bedID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `diagnosis`
--
ALTER TABLE `diagnosis`
  MODIFY `diagnosisCode` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `diagnostic_unit`
--
ALTER TABLE `diagnostic_unit`
  MODIFY `unitID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `employeeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `drug`
--
ALTER TABLE `drug`
  MODIFY `drugCode` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `non_medical_staff`
--
ALTER TABLE `non_medical_staff`
  MODIFY `employeeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10001;

--
-- AUTO_INCREMENT for table `nurse`
--
ALTER TABLE `nurse`
  MODIFY `employeeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1001;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `patientID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `test`
--
ALTER TABLE `test`
  MODIFY `testCode` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `treatment`
--
ALTER TABLE `treatment`
  MODIFY `treatmentID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vendor`
--
ALTER TABLE `vendor`
  MODIFY `regNo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `word`
--
ALTER TABLE `word`
  MODIFY `wordID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendent`
--
ALTER TABLE `attendent`
  ADD CONSTRAINT `attendent_ibfk_1` FOREIGN KEY (`employeeID`) REFERENCES `non_medical_staff` (`employeeID`) ON DELETE CASCADE;

--
-- Constraints for table `bed`
--
ALTER TABLE `bed`
  ADD CONSTRAINT `bed_ibfk_1` FOREIGN KEY (`wordID`) REFERENCES `word` (`wordID`) ON DELETE SET NULL;

--
-- Constraints for table `cleaner`
--
ALTER TABLE `cleaner`
  ADD CONSTRAINT `cleaner_ibfk_1` FOREIGN KEY (`employeeID`) REFERENCES `non_medical_staff` (`employeeID`) ON DELETE CASCADE;

--
-- Constraints for table `diagnose`
--
ALTER TABLE `diagnose`
  ADD CONSTRAINT `diagnose_ibfk_1` FOREIGN KEY (`diagnosisCode`) REFERENCES `diagnosis` (`diagnosisCode`),
  ADD CONSTRAINT `diagnose_ibfk_2` FOREIGN KEY (`patientID`) REFERENCES `patient` (`patientID`),
  ADD CONSTRAINT `diagnose_ibfk_3` FOREIGN KEY (`diagnosed_by`) REFERENCES `doctor` (`employeeID`);

--
-- Constraints for table `emegency_contact`
--
ALTER TABLE `emegency_contact`
  ADD CONSTRAINT `emegency_contact_ibfk_1` FOREIGN KEY (`patientID`) REFERENCES `in_patient` (`patientID`) ON DELETE CASCADE;

--
-- Constraints for table `insurence`
--
ALTER TABLE `insurence`
  ADD CONSTRAINT `insurence_ibfk_1` FOREIGN KEY (`patientID`) REFERENCES `in_patient` (`patientID`) ON DELETE CASCADE;

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
  ADD CONSTRAINT `in_patient_daily_record_ibfk_1` FOREIGN KEY (`patientID`) REFERENCES `in_patient` (`patientID`) ON DELETE CASCADE,
  ADD CONSTRAINT `in_patient_daily_record_ibfk_2` FOREIGN KEY (`recorded_by`) REFERENCES `nurse` (`employeeID`) ON DELETE NO ACTION;

--
-- Constraints for table `login_credentials`
--
ALTER TABLE `login_credentials`
  ADD CONSTRAINT `login_credentials_ibfk_1` FOREIGN KEY (`employeeID`) REFERENCES `doctor` (`employeeID`) ON DELETE CASCADE,
  ADD CONSTRAINT `login_credentials_ibfk_2` FOREIGN KEY (`employeeID`) REFERENCES `nurse` (`employeeID`) ON DELETE CASCADE,
  ADD CONSTRAINT `login_credentials_ibfk_3` FOREIGN KEY (`employeeID`) REFERENCES `non_medical_staff` (`employeeID`) ON DELETE CASCADE;

--
-- Constraints for table `out_patient`
--
ALTER TABLE `out_patient`
  ADD CONSTRAINT `out_patient_ibfk_1` FOREIGN KEY (`patientID`) REFERENCES `patient` (`patientID`) ON DELETE CASCADE;

--
-- Constraints for table `out_patient_record`
--
ALTER TABLE `out_patient_record`
  ADD CONSTRAINT `out_patient_record_ibfk_1` FOREIGN KEY (`patientID`) REFERENCES `out_patient` (`patientID`) ON DELETE CASCADE,
  ADD CONSTRAINT `out_patient_record_ibfk_2` FOREIGN KEY (`recorded_by`) REFERENCES `nurse` (`employeeID`) ON DELETE NO ACTION;

--
-- Constraints for table `patient_admit`
--
ALTER TABLE `patient_admit`
  ADD CONSTRAINT `patient_admit_ibfk_1` FOREIGN KEY (`patientID`) REFERENCES `in_patient` (`patientID`) ON DELETE NO ACTION,
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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
