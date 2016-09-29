-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 29, 2016 at 02:13 PM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `test_crm`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchTree`( IN root CHAR(1) )
BEGIN
  DECLARE rows SMALLINT DEFAULT 0;
  DROP TABLE IF EXISTS reached;
  CREATE TABLE reached (
    site_Id CHAR(1) PRIMARY KEY
  ) ENGINE=HEAP;
  INSERT INTO reached VALUES (root);
  SET rows = ROW_COUNT();
  WHILE rows > 0 DO
    INSERT IGNORE INTO reached 
      SELECT DISTINCT s.site_Id 
      FROM site AS s 
      INNER JOIN reached AS r ON s.parent_Id = r.site_Id;
    SET rows = ROW_COUNT();
    DELETE FROM reached 
      WHERE site_Id = root;
  END WHILE;
  SELECT * FROM reached;
  DROP TABLE reached;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
`id` int(10) NOT NULL,
  `parent_id` int(10) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `name`) VALUES
(1, NULL, 'Electronics'),
(2, 1, 'Cameras and Photography'),
(3, 1, 'Computers and Tablets'),
(4, 1, 'Cell Phones and Accessories'),
(5, 1, 'TV and Audio'),
(6, 2, 'Digital Cameras'),
(7, 2, 'Camcorders'),
(8, 2, 'Accessories'),
(9, 3, 'Laptops'),
(10, 3, 'Desktops'),
(11, 3, 'Netbooks'),
(12, 3, 'Tablets'),
(13, 6, 'some_1'),
(14, 6, 'some_2');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
`category_id` int(10) NOT NULL,
  `category_name` varchar(50) NOT NULL,
  `parent_id` int(10) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`, `parent_id`) VALUES
(1, 'CEO', NULL),
(2, 'manager 1', 1),
(3, 'manager 2', 1),
(4, 'emp 1', 2),
(5, 'emp 2', 2),
(6, 'emp 3', 3),
(7, 'clerk_1', 4);

-- --------------------------------------------------------

--
-- Table structure for table `holidays`
--

CREATE TABLE IF NOT EXISTS `holidays` (
`id` int(11) NOT NULL,
  `holiday` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `holidays`
--

INSERT INTO `holidays` (`id`, `holiday`) VALUES
(2, '2016-01-26 00:00:00'),
(3, '2016-01-29 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `reached`
--

CREATE TABLE IF NOT EXISTS `reached` (
  `site_Id` char(1) NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `table_1`
--

CREATE TABLE IF NOT EXISTS `table_1` (
  `name` varchar(255) NOT NULL,
`id` int(11) NOT NULL,
  `id_parent` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `table_1`
--

INSERT INTO `table_1` (`name`, `id`, `id_parent`) VALUES
('Sachin R.', 1, 0),
('Aravind K.', 2, 1),
('Manasa R.', 3, 1),
('emp_1_under_arvind', 4, 2),
('emp_2_under_arvind', 5, 2),
('emp_3_under_arvind', 6, 2),
('emp_4_under_arvind', 7, 2),
('emp_1_under_manasa', 8, 3),
('emp_2_under_manasa', 9, 3),
('new_1', 10, 9),
('new_2', 11, 9);

-- --------------------------------------------------------

--
-- Table structure for table `t_employee`
--

CREATE TABLE IF NOT EXISTS `t_employee` (
`emp_id` bigint(20) unsigned NOT NULL,
  `emp_first_name` varchar(256) NOT NULL,
  `emp_middle_name` varchar(256) DEFAULT NULL,
  `emp_last_name` varchar(256) NOT NULL,
  `mobile` varchar(256) NOT NULL,
  `address` varchar(256) NOT NULL,
  `assign_id` bigint(20) unsigned DEFAULT NULL,
  `username` varchar(256) NOT NULL,
  `password` varchar(256) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_employee`
--

INSERT INTO `t_employee` (`emp_id`, `emp_first_name`, `emp_middle_name`, `emp_last_name`, `mobile`, `address`, `assign_id`, `username`, `password`) VALUES
(1, 'vijay', 'asa', 'fdfd', '2434232', 'dfd', NULL, 'vijay', 'khot');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
 ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `holidays`
--
ALTER TABLE `holidays`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reached`
--
ALTER TABLE `reached`
 ADD PRIMARY KEY (`site_Id`);

--
-- Indexes for table `table_1`
--
ALTER TABLE `table_1`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_employee`
--
ALTER TABLE `t_employee`
 ADD PRIMARY KEY (`emp_id`), ADD UNIQUE KEY `emp_id` (`emp_id`), ADD KEY `assign_id` (`assign_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
MODIFY `category_id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `holidays`
--
ALTER TABLE `holidays`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `table_1`
--
ALTER TABLE `table_1`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `t_employee`
--
ALTER TABLE `t_employee`
MODIFY `emp_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `t_employee`
--
ALTER TABLE `t_employee`
ADD CONSTRAINT `t_employee_ibfk_1` FOREIGN KEY (`assign_id`) REFERENCES `t_employee` (`emp_id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
