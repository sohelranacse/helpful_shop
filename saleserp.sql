-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 31, 2022 at 06:52 AM
-- Server version: 5.7.31
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `saleserp`
--

-- --------------------------------------------------------

--
-- Table structure for table `acc_coa`
--

DROP TABLE IF EXISTS `acc_coa`;
CREATE TABLE IF NOT EXISTS `acc_coa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `HeadCode` int(11) NOT NULL,
  `HeadName` varchar(100) NOT NULL,
  `PHeadName` varchar(200) NOT NULL,
  `PHeadCode` varchar(50) DEFAULT NULL,
  `HeadLevel` int(11) NOT NULL,
  `IsActive` tinyint(1) NOT NULL,
  `IsTransaction` tinyint(1) NOT NULL,
  `IsGL` tinyint(1) NOT NULL,
  `isCashNature` int(11) NOT NULL DEFAULT '0',
  `isBankNature` int(11) NOT NULL DEFAULT '0',
  `HeadType` char(1) NOT NULL,
  `IsBudget` tinyint(1) NOT NULL,
  `IsDepreciation` tinyint(1) NOT NULL,
  `customer_id` varchar(50) DEFAULT NULL,
  `supplier_id` varchar(50) DEFAULT NULL,
  `bank_id` varchar(100) DEFAULT NULL,
  `service_id` varchar(50) DEFAULT NULL,
  `DepreciationRate` decimal(18,2) NOT NULL,
  `CreateBy` varchar(50) NOT NULL,
  `CreateDate` datetime NOT NULL,
  `UpdateBy` varchar(50) NOT NULL,
  `UpdateDate` datetime NOT NULL,
  `isSubType` int(11) NOT NULL DEFAULT '0',
  `subType` int(11) NOT NULL DEFAULT '1',
  `isStock` int(11) NOT NULL DEFAULT '0',
  `isFixedAssetSch` int(11) NOT NULL DEFAULT '0',
  `noteNo` varchar(20) DEFAULT NULL,
  `assetCode` varchar(20) DEFAULT NULL,
  `depCode` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `HeadCode` (`HeadCode`),
  KEY `HeadName` (`HeadName`),
  KEY `customer_id` (`customer_id`),
  KEY `supplier_id` (`supplier_id`),
  KEY `service_id` (`service_id`),
  KEY `PHeadName` (`PHeadName`),
  KEY `HeadLevel` (`HeadLevel`),
  KEY `IsTransaction` (`IsTransaction`),
  KEY `IsGL` (`IsGL`),
  KEY `IsBudget` (`IsBudget`),
  KEY `IsDepreciation` (`IsDepreciation`),
  KEY `isCashNature` (`isCashNature`),
  KEY `isBankNature` (`isBankNature`)
) ENGINE=InnoDB AUTO_INCREMENT=239 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `acc_coa`
--

INSERT INTO `acc_coa` (`id`, `HeadCode`, `HeadName`, `PHeadName`, `PHeadCode`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `isCashNature`, `isBankNature`, `HeadType`, `IsBudget`, `IsDepreciation`, `customer_id`, `supplier_id`, `bank_id`, `service_id`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`, `isSubType`, `subType`, `isStock`, `isFixedAssetSch`, `noteNo`, `assetCode`, `depCode`) VALUES
(8, 50202, 'Accounts Payable', 'Current Liabilities', '502', 3, 1, 0, 1, 0, 0, 'L', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-05-17 12:52:17', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL),
(10, 1, 'Assets', 'COA', '0', 1, 1, 0, 0, 0, 0, 'A', 0, 0, NULL, NULL, NULL, NULL, '0.00', '0', '0000-00-00 00:00:00', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, '', '', ''),
(13, 10201, 'Cash', 'Current Asset', '102', 3, 1, 0, 0, 0, 0, 'A', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-10 12:07:11', '0', '2015-10-15 15:57:55', 0, 1, 0, 0, NULL, NULL, NULL),
(15, 1020101, 'Cash In Hand', 'Cash', '10201', 4, 1, 1, 1, 1, 0, 'A', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-12 08:16:03', '0', '2016-05-23 12:05:43', 0, 1, 0, 0, NULL, NULL, NULL),
(16, 102, 'Current Asset', 'Assets', '1', 2, 1, 0, 0, 0, 0, 'A', 0, 0, NULL, NULL, NULL, NULL, '0.00', '0', '0000-00-00 00:00:00', '0', '2018-07-07 11:23:00', 0, 1, 0, 0, '', '', ''),
(17, 502, 'Current Liabilities', 'Liabilities', '5', 2, 1, 0, 0, 0, 0, 'L', 0, 0, NULL, NULL, NULL, NULL, '0.00', '0', '2014-08-30 13:18:20', '0', '2015-10-15 19:49:21', 0, 1, 0, 0, '', '', ''),
(23, 401, 'Cost of Goods Solds', 'Expenses', '4', 2, 1, 1, 1, 0, 0, 'E', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-02 10:28:34', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, '', '', ''),
(24, 2, 'Shareholder\'s Equity', 'COA', '0', 1, 1, 0, 0, 0, 0, 'L', 0, 0, NULL, NULL, NULL, NULL, '0.00', '0', '0000-00-00 00:00:00', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, '', '', ''),
(25, 4, 'Expenses', 'COA', '0', 1, 1, 0, 0, 0, 0, 'E', 0, 0, NULL, NULL, NULL, NULL, '0.00', '2', '2019-11-24 05:45:24', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, '', '', ''),
(26, 101, 'Fixed Assets', 'Assets', '1', 2, 1, 0, 0, 0, 0, 'A', 0, 0, NULL, NULL, NULL, NULL, '0.00', '0', '0000-00-00 00:00:00', '0', '2015-10-15 15:29:11', 0, 1, 0, 0, '', '', ''),
(27, 402, 'Over Head Cost', 'Expenses', '4', 2, 1, 1, 1, 0, 0, 'E', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-04 10:01:58', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, '', '', ''),
(29, 3, 'Income', 'COA', '0', 1, 1, 0, 0, 0, 0, 'I', 0, 0, NULL, NULL, NULL, NULL, '0.00', '0', '0000-00-00 00:00:00', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, '', '', ''),
(30, 5, 'Liabilities', 'COA', '0', 1, 1, 0, 0, 0, 0, 'L', 0, 0, NULL, NULL, NULL, NULL, '0.00', '0', '2013-07-04 12:32:07', '0', '2015-10-15 19:46:54', 0, 1, 0, 0, '', '', ''),
(31, 501, 'Long Term Liabilities', 'Liabilities', '5', 2, 1, 0, 0, 0, 0, 'L', 0, 0, NULL, NULL, NULL, NULL, '0.00', '0', '2014-08-30 13:18:20', '0', '2015-10-15 19:49:21', 0, 1, 0, 0, '', '', ''),
(33, 301, 'Direct Income', 'Income', '3', 2, 1, 1, 1, 0, 0, 'I', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-02 10:31:45', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, '', '', ''),
(35, 302, 'Indirect Income', 'Income', '3', 2, 1, 1, 1, 0, 0, 'I', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-02 10:55:45', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, '', '', ''),
(36, 5020201, 'Supplier Payable', 'Accounts Payable', '50202', 4, 1, 0, 1, 0, 0, 'L', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-05-17 12:52:44', '0', '0000-00-00 00:00:00', 1, 4, 0, 0, NULL, NULL, NULL),
(41, 10203, 'Prepaid Expenses', 'Current Asset', '102', 3, 1, 0, 0, 0, 0, 'A', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-10 06:45:19', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL),
(43, 10204, 'Inventory', 'Current Asset', '102', 3, 1, 0, 0, 0, 0, 'A', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-10 06:48:32', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL),
(44, 50203, 'Accrued Expenses', 'Current Liabilities', '502', 3, 1, 0, 0, 0, 0, 'L', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-10 06:50:20', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL),
(46, 50101, 'Long-Term Debt', 'Long Term Liabilities', '501', 3, 1, 0, 0, 0, 0, 'L', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-10 06:51:45', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL),
(47, 50102, 'Other Long-Term  Liabilities', 'Long Term Liabilities', '501', 3, 1, 0, 0, 0, 0, 'L', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-10 06:53:04', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL),
(48, 201, 'Equity', 'Shareholder\'s Equity', '2', 2, 1, 0, 0, 0, 0, 'L', 0, 0, NULL, NULL, NULL, NULL, '0.00', '0', '2022-04-10 06:56:38', '0', '2022-04-10 06:56:38', 0, 1, 0, 0, NULL, NULL, NULL),
(49, 20101, 'Equity Capital', 'Equity', '201', 3, 1, 0, 0, 0, 0, 'L', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-05-17 12:31:33', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL),
(50, 20102, 'Retained Earnings', 'Equity', '201', 3, 1, 0, 0, 0, 0, 'L', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-10 07:01:45', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL),
(51, 10101, 'Property & Equipment', 'Fixed Assets', '101', 3, 1, 0, 0, 0, 0, 'A', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-10 11:35:53', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL),
(52, 10102, 'Goodwills', 'Fixed Assets', '101', 3, 1, 0, 0, 0, 0, 'A', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-23 06:47:21', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL),
(53, 30101, 'Construction Income', 'Direct Income', '301', 3, 1, 0, 0, 0, 0, 'I', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-10 08:08:04', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL),
(54, 30102, 'Reimbursement Income', 'Direct Income', '301', 3, 1, 0, 0, 0, 0, 'I', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-10 08:09:02', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL),
(55, 40101, 'Cost of Goods Sold', 'Cost of Goods Solds', '401', 3, 1, 0, 0, 0, 0, 'E', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-10 08:13:52', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL),
(56, 40102, 'Job Expenses', 'Cost of Goods Solds', '401', 3, 1, 0, 0, 0, 0, 'E', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-10 08:14:18', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL),
(57, 40201, 'Automobile', 'Over Head Cost', '402', 3, 1, 0, 0, 0, 0, 'E', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-10 08:14:37', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL),
(58, 40202, 'Bank Service Charges', 'Over Head Cost', '402', 3, 1, 0, 0, 0, 0, 'E', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-10 08:15:32', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL),
(59, 40203, 'Insurance', 'Over Head Cost', '402', 3, 1, 0, 0, 0, 0, 'E', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-10 08:15:58', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL),
(60, 40204, 'Interest Expenses', 'Over Head Cost', '402', 3, 1, 0, 0, 0, 0, 'E', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-10 08:16:36', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL),
(61, 40205, 'Payroll Expenses', 'Over Head Cost', '402', 3, 1, 0, 0, 0, 0, 'E', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-10 08:17:08', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL),
(62, 40206, 'Postage', 'Over Head Cost', '402', 3, 1, 0, 0, 0, 0, 'E', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-10 08:17:26', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL),
(63, 40207, 'Professional Fees', 'Over Head Cost', '402', 3, 1, 0, 0, 0, 0, 'E', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-10 08:17:55', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL),
(64, 40208, 'Repairs', 'Over Head Cost', '402', 3, 1, 0, 0, 0, 0, 'E', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-10 08:18:38', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL),
(65, 40209, 'Tools and Macchnery', 'Over Head Cost', '402', 3, 1, 0, 0, 0, 0, 'E', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-10 08:28:02', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL),
(66, 40210, 'Utilities', 'Over Head Cost', '402', 3, 1, 0, 0, 0, 0, 'E', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-10 08:28:42', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL),
(67, 4021001, 'Electic Bill', 'Utilities', '40210', 4, 1, 0, 0, 0, 0, 'E', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-10 09:05:45', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL),
(68, 4021002, 'House Rent', 'Utilities', '40210', 4, 1, 0, 0, 0, 0, 'E', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-10 09:06:05', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL),
(69, 10205, 'Cash at Bank', 'Current Asset', '102', 3, 1, 0, 0, 0, 0, 'A', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-05-17 12:44:19', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL),
(75, 1010201, 'Goodwill', 'Goodwills', '10102', 4, 1, 0, 0, 0, 0, 'A', 0, 0, NULL, NULL, NULL, NULL, '15.00', '1', '2022-04-23 06:45:48', '0', '0000-00-00 00:00:00', 0, 1, 0, 1, NULL, 'GD001', NULL),
(77, 5020401, 'property sales', 'Unearned Revenue', '50204', 4, 1, 0, 0, 0, 0, 'L', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-10 11:40:48', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL),
(78, 5010101, 'Debts', 'Long-Term Debt', '50101', 4, 1, 0, 0, 0, 0, 'L', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-10 11:41:49', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL),
(79, 5010201, 'Other Long-Term  Liabilities', 'Other Long-Term  Liabilities', '50102', 4, 1, 0, 0, 0, 0, 'L', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-10 11:42:03', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL),
(80, 2010101, 'Capital Fund', 'Equity Capital', '20101', 4, 1, 0, 0, 0, 0, 'L', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-10 11:42:36', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL),
(81, 2010201, 'Current year Profit & Loss', 'Retained Earnings', '20102', 4, 1, 0, 0, 0, 0, 'L', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-10 11:42:53', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL),
(82, 2010202, 'Last year Profit & Loss', 'Retained Earnings', '20102', 4, 1, 0, 0, 0, 0, 'L', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-10 11:43:03', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL),
(84, 50201, 'Provisions', 'Current Liabilities', '502', 3, 1, 0, 0, 0, 0, 'L', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-10 11:46:00', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL),
(85, 5020104, 'Depreciation of Goodwill', 'Depreciations', '50205', 4, 1, 0, 0, 0, 0, 'L', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-23 06:47:07', '0', '0000-00-00 00:00:00', 0, 1, 0, 1, NULL, NULL, 'GD001'),
(86, 50204, 'Unearned Revenue', 'Current Liabilities', '502', 3, 1, 0, 0, 0, 0, 'L', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-05-17 12:53:09', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL),
(88, 10206, 'Advance', 'Current Asset', '102', 3, 1, 0, 0, 0, 0, 'A', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-11 11:56:56', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL),
(89, 1020601, 'Advance against Employee', 'Advance', '10206', 4, 1, 0, 0, 0, 0, 'A', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-11 11:57:18', '0', '0000-00-00 00:00:00', 1, 2, 0, 0, NULL, NULL, NULL),
(90, 1020602, 'Advance Against Customer', 'Advance', '10206', 4, 1, 0, 0, 0, 0, 'A', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-11 11:57:35', '0', '0000-00-00 00:00:00', 1, 3, 0, 0, NULL, NULL, NULL),
(91, 1020102, 'Petty Cash', 'Cash', '10201', 4, 1, 0, 0, 1, 0, 'A', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-12 08:16:19', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL),
(94, 40301, 'Purchase Account', 'Purchase Accounts', '402', 3, 1, 0, 0, 0, 0, 'E', 0, 0, NULL, NULL, NULL, NULL, '0.00', '0', '2022-04-16 10:31:43', '0', '2022-04-16 10:31:43', 0, 1, 0, 0, NULL, NULL, NULL),
(95, 4030102, 'Purchase', 'Purchase Account', '40201', 4, 1, 0, 0, 0, 0, 'E', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-16 10:33:59', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL),
(96, 30103, 'Sales Accounts', 'Direct Income', '301', 3, 1, 0, 0, 0, 0, 'I', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-16 10:34:37', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL),
(97, 3010301, 'Sales Account', 'Sales Accounts', '30103', 4, 1, 0, 0, 0, 0, 'I', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-16 10:34:57', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL),
(99, 4020501, 'Salary Expense', 'Payroll Expenses', '40205', 4, 1, 0, 0, 0, 0, 'E', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-20 06:24:08', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL),
(104, 5020102, 'Provision for npf contribution', 'Provisions', '50201', 4, 1, 0, 0, 0, 0, 'L', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-05-10 06:19:45', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL),
(106, 5020101, 'Provision for State Income Tax', 'Provisions', '50201', 4, 1, 0, 0, 0, 0, 'L', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-26 06:44:29', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL),
(107, 40211, 'State Income Tax', 'Over Head Cost', '402', 3, 1, 0, 0, 0, 0, 'E', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-26 06:44:46', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL),
(108, 4021101, 'State Income Tax', 'State Income Tax', '40211', 4, 1, 0, 0, 0, 0, 'E', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-04-26 06:45:00', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL),
(110, 40212, 'Employeer ICF Expense', 'Over Head Cost', '402', 3, 1, 0, 0, 0, 0, 'E', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-05-10 06:35:37', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL),
(111, 4021201, 'Employeer 1% ICF Expense', 'Employeer ICF Expense', '40212', 4, 1, 0, 0, 0, 0, 'E', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-05-17 11:34:02', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL),
(112, 50205, 'Depreciations', 'Current Liabilities', '502', 3, 1, 0, 0, 0, 0, 'L', 0, 0, NULL, NULL, NULL, NULL, '0.00', '0', '2022-05-10 09:35:15', '0', '2022-05-10 09:35:15', 0, 1, 0, 0, NULL, NULL, NULL),
(191, 4020502, 'Employee 5 % NPF Expenses', 'Payroll Expenses', '40205', 4, 1, 0, 0, 0, 0, 'E', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-05-17 11:32:14', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL),
(192, 4020503, 'Employee 10 % NPF Expenses', 'Payroll Expenses', '40205', 4, 1, 0, 0, 0, 0, 'E', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-05-17 11:32:36', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL),
(221, 50206, 'Aoounts pay by name supplier', 'Current Liabilities', '502', 3, 1, 0, 0, 0, 0, 'L', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-06-13 11:51:32', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL),
(229, 10208, 'Accounts Receivable', 'Current Asset', '102', 3, 1, 0, 0, 0, 0, 'A', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-06-16 07:05:42', '0', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL),
(230, 1020801, 'Customer Receivable', 'Accounts Receivable', '10208', 4, 1, 0, 0, 0, 0, 'A', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-06-16 07:07:17', '0', '0000-00-00 00:00:00', 1, 3, 0, 0, NULL, NULL, NULL),
(231, 1020802, 'Employee Receivable', 'Accounts Receivable', '10208', 4, 1, 0, 0, 0, 0, 'A', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-06-16 07:06:58', '0', '0000-00-00 00:00:00', 1, 2, 0, 0, NULL, NULL, NULL),
(232, 1020401, 'Inventory account', 'Inventory', '10204', 4, 1, 0, 0, 0, 0, 'A', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-06-15 07:53:16', '', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL),
(233, 4010101, 'Cost of Goods Sold Account', 'Cost of Goods Sold', '40101', 4, 1, 0, 0, 0, 0, 'E', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-06-15 08:58:18', '', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL),
(234, 30104, 'Service Accounts', 'Direct Income', '301', 3, 1, 0, 0, 0, 0, 'I', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-06-15 16:23:37', '', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL),
(235, 3010401, 'Service Account', 'Service Accounts', '30104', 4, 1, 0, 0, 0, 0, 'I', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-06-15 16:24:11', '', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL),
(238, 2116000001, '1-MDHossen', 'Employee Ledger', NULL, 4, 1, 1, 0, 0, 0, 'L', 0, 0, NULL, NULL, NULL, NULL, '0.00', '1', '2022-07-20 10:47:55', '', '0000-00-00 00:00:00', 0, 1, 0, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `acc_monthly_balance`
--

DROP TABLE IF EXISTS `acc_monthly_balance`;
CREATE TABLE IF NOT EXISTS `acc_monthly_balance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fyear` int(11) NOT NULL,
  `COAID` int(11) NOT NULL,
  `balance1` decimal(18,2) NOT NULL DEFAULT '0.00',
  `balance2` decimal(18,2) NOT NULL DEFAULT '0.00',
  `balance3` decimal(18,2) NOT NULL DEFAULT '0.00',
  `balance4` decimal(18,2) NOT NULL DEFAULT '0.00',
  `balance5` decimal(18,2) NOT NULL DEFAULT '0.00',
  `balance6` decimal(18,2) NOT NULL DEFAULT '0.00',
  `balance7` decimal(18,2) NOT NULL DEFAULT '0.00',
  `balance8` decimal(18,2) NOT NULL DEFAULT '0.00',
  `balance9` decimal(18,2) NOT NULL DEFAULT '0.00',
  `balance10` decimal(18,2) NOT NULL DEFAULT '0.00',
  `balance11` decimal(18,2) NOT NULL DEFAULT '0.00',
  `balance12` decimal(18,2) NOT NULL DEFAULT '0.00',
  `totalBalance` decimal(18,2) NOT NULL DEFAULT '0.00',
  `updatedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `acc_opening_balance`
--

DROP TABLE IF EXISTS `acc_opening_balance`;
CREATE TABLE IF NOT EXISTS `acc_opening_balance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fyear` int(11) NOT NULL,
  `COAID` int(11) NOT NULL,
  `subType` int(11) NOT NULL DEFAULT '1',
  `subCode` int(11) DEFAULT NULL,
  `Debit` decimal(10,0) NOT NULL,
  `Credit` decimal(10,0) NOT NULL,
  `openDate` date NOT NULL,
  `CreateBy` int(11) NOT NULL,
  `CreateDate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `COAID` (`COAID`),
  KEY `year` (`fyear`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `acc_predefine_account`
--

DROP TABLE IF EXISTS `acc_predefine_account`;
CREATE TABLE IF NOT EXISTS `acc_predefine_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cashCode` int(11) NOT NULL,
  `bankCode` int(11) NOT NULL,
  `advance` int(11) NOT NULL,
  `fixedAsset` int(11) NOT NULL,
  `purchaseCode` int(11) NOT NULL,
  `salesCode` int(11) NOT NULL,
  `serviceCode` int(11) NOT NULL,
  `customerCode` int(11) NOT NULL,
  `supplierCode` int(11) NOT NULL,
  `costs_of_good_solds` int(11) NOT NULL,
  `vat` int(11) NOT NULL,
  `tax` int(11) NOT NULL,
  `inventoryCode` int(11) NOT NULL,
  `CPLCode` int(11) NOT NULL,
  `LPLCode` int(11) NOT NULL,
  `salary_code` int(11) DEFAULT NULL,
  `emp_npf_contribution` int(11) DEFAULT NULL,
  `empr_npf_contribution` int(11) DEFAULT NULL,
  `emp_icf_contribution` int(11) DEFAULT NULL,
  `empr_icf_contribution` int(11) DEFAULT NULL,
  `prov_state_tax` int(11) NOT NULL,
  `state_tax` int(11) NOT NULL,
  `prov_npfcode` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `COAID` (`cashCode`),
  KEY `cashCode` (`cashCode`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `acc_predefine_account`
--

INSERT INTO `acc_predefine_account` (`id`, `cashCode`, `bankCode`, `advance`, `fixedAsset`, `purchaseCode`, `salesCode`, `serviceCode`, `customerCode`, `supplierCode`, `costs_of_good_solds`, `vat`, `tax`, `inventoryCode`, `CPLCode`, `LPLCode`, `salary_code`, `emp_npf_contribution`, `empr_npf_contribution`, `emp_icf_contribution`, `empr_icf_contribution`, `prov_state_tax`, `state_tax`, `prov_npfcode`) VALUES
(2, 10201, 10205, 10206, 101, 1020401, 3010301, 3010401, 1020801, 5020201, 4010101, 0, 4021101, 1020401, 2010201, 2010202, 4020501, 4020502, 4020503, 4021201, 0, 5020101, 4021101, 5020102);

-- --------------------------------------------------------

--
-- Table structure for table `acc_subcode`
--

DROP TABLE IF EXISTS `acc_subcode`;
CREATE TABLE IF NOT EXISTS `acc_subcode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subTypeId` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `referenceNo` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_by` int(11) NOT NULL,
  `created_date` date NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `subTypeId` (`subTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `acc_subcode`
--

INSERT INTO `acc_subcode` (`id`, `subTypeId`, `name`, `referenceNo`, `status`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES
(3, 3, 'walking customer', 2, 1, 0, '2022-07-20', 1, '2022-07-25 20:37:17'),
(4, 3, 'Walk-in-customer', 1, 1, 0, '2022-10-22', 0, '2022-10-22 07:55:12'),
(5, 4, 'Imran Khan', 1, 1, 0, '2022-10-22', 0, '2022-10-22 09:44:06'),
(6, 4, 'Masihur Rahman', 2, 1, 0, '2022-10-22', 0, '2022-10-22 10:00:08'),
(7, 3, 'Maynul Haque', 2, 1, 0, '2022-10-24', 0, '2022-10-24 10:42:35'),
(8, 3, 'Kibria', 3, 1, 0, '2022-10-24', 0, '2022-10-24 10:43:16'),
(9, 3, 'Maruf', 4, 1, 0, '2022-10-24', 0, '2022-10-24 10:43:47');

-- --------------------------------------------------------

--
-- Table structure for table `acc_subtype`
--

DROP TABLE IF EXISTS `acc_subtype`;
CREATE TABLE IF NOT EXISTS `acc_subtype` (
  `id` int(11) NOT NULL,
  `subtypeName` varchar(200) NOT NULL,
  `staus` int(11) NOT NULL DEFAULT '1',
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `acc_subtype`
--

INSERT INTO `acc_subtype` (`id`, `subtypeName`, `staus`, `created_by`, `created_date`) VALUES
(1, 'None', 1, 1, '2022-04-05 10:19:27'),
(2, 'Employee', 1, 1, '2022-04-06 08:14:48'),
(3, 'Customer', 1, 1, '2022-04-10 08:49:22'),
(4, 'Supplier', 1, 1, '2022-04-10 08:49:22'),
(6, 'Agent', 1, 1, '2022-04-10 08:50:12');

-- --------------------------------------------------------

--
-- Table structure for table `acc_transaction`
--

DROP TABLE IF EXISTS `acc_transaction`;
CREATE TABLE IF NOT EXISTS `acc_transaction` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `vid` int(11) NOT NULL,
  `fyear` int(11) NOT NULL,
  `VNo` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `Vtype` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `referenceNo` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VDate` date DEFAULT NULL,
  `COAID` varchar(50) CHARACTER SET utf8 NOT NULL,
  `Narration` text CHARACTER SET utf8,
  `chequeNo` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `chequeDate` date DEFAULT NULL,
  `isHonour` int(11) DEFAULT NULL,
  `ledgerComment` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `Debit` decimal(18,2) DEFAULT NULL,
  `Credit` decimal(18,2) DEFAULT NULL,
  `StoreID` int(11) NOT NULL DEFAULT '0',
  `IsPosted` char(10) CHARACTER SET utf8 DEFAULT NULL,
  `is_opening` int(11) NOT NULL DEFAULT '0',
  `CreateBy` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `CreateDate` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `UpdateDate` datetime DEFAULT NULL,
  `IsAppove` char(10) CHARACTER SET utf8 DEFAULT NULL,
  `RevCodde` bigint(20) NOT NULL,
  `subType` int(11) NOT NULL DEFAULT '1',
  `subCode` int(11) DEFAULT NULL,
  UNIQUE KEY `ID` (`ID`),
  KEY `COAID` (`COAID`),
  KEY `VNo` (`VNo`),
  KEY `RevCodde` (`RevCodde`),
  KEY `subType` (`subType`),
  KEY `subCode` (`subCode`),
  KEY `referenceNo` (`referenceNo`),
  KEY `vid` (`vid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `acc_vaucher`
--

DROP TABLE IF EXISTS `acc_vaucher`;
CREATE TABLE IF NOT EXISTS `acc_vaucher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fyear` int(11) NOT NULL,
  `VNo` varchar(50) NOT NULL,
  `Vtype` varchar(50) NOT NULL,
  `referenceNo` varchar(50) DEFAULT NULL,
  `VDate` date NOT NULL,
  `COAID` int(11) NOT NULL,
  `Narration` varchar(255) DEFAULT NULL,
  `chequeno` varchar(30) DEFAULT NULL,
  `chequeDate` date DEFAULT NULL,
  `isHonour` int(11) NOT NULL DEFAULT '0',
  `ledgerComment` varchar(255) DEFAULT NULL,
  `Debit` decimal(18,2) NOT NULL DEFAULT '0.00',
  `Credit` decimal(18,2) NOT NULL DEFAULT '0.00',
  `RevCodde` int(11) NOT NULL,
  `subType` int(11) NOT NULL DEFAULT '1',
  `subCode` int(11) DEFAULT NULL,
  `isApproved` int(11) NOT NULL DEFAULT '0',
  `CreateBy` int(11) NOT NULL,
  `CreateDate` datetime NOT NULL,
  `UpdateBy` int(11) DEFAULT NULL,
  `UpdateDate` datetime DEFAULT NULL,
  `approvedBy` int(11) DEFAULT NULL,
  `approvedDate` datetime DEFAULT NULL,
  `isyearClosed` tinyint(1) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0 = non yet transfer to transation,  1 = Tranfer to transition',
  PRIMARY KEY (`id`),
  KEY `VNo` (`VNo`),
  KEY `fyear` (`fyear`),
  KEY `VDate` (`VDate`),
  KEY `COAID` (`COAID`),
  KEY `RevCodde` (`RevCodde`),
  KEY `subType` (`subType`),
  KEY `subCode` (`subCode`),
  KEY `referenceNo` (`referenceNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `activity_logs`
--

DROP TABLE IF EXISTS `activity_logs`;
CREATE TABLE IF NOT EXISTS `activity_logs` (
  `activity_id` int(11) NOT NULL,
  `user_id` varchar(11) NOT NULL COMMENT 'for employee , it will save employee_id',
  `type` varchar(30) NOT NULL COMMENT 'ticket, employee, attendnace etc.',
  `action` varchar(15) NOT NULL COMMENT 'create, update, delete',
  `action_id` varchar(15) NOT NULL,
  `table_name` varchar(30) DEFAULT NULL,
  `slug` varchar(150) NOT NULL,
  `form_data` text,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1=created, 2=updated, 3=deleted	'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `app_setting`
--

DROP TABLE IF EXISTS `app_setting`;
CREATE TABLE IF NOT EXISTS `app_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `localhserver` varchar(250) DEFAULT NULL,
  `onlineserver` varchar(250) DEFAULT NULL,
  `hotspot` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `app_setting`
--

INSERT INTO `app_setting` (`id`, `localhserver`, `onlineserver`, `hotspot`) VALUES
(1, 'https://demo.bdtask.com', 'https://demo.bdtask.com', 'https://demo.bdtask.com');

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
CREATE TABLE IF NOT EXISTS `attendance` (
  `att_id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `sign_in` varchar(30) NOT NULL,
  `sign_out` varchar(30) NOT NULL,
  `staytime` varchar(30) NOT NULL,
  PRIMARY KEY (`att_id`),
  KEY `employee_id` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bank_add`
--

DROP TABLE IF EXISTS `bank_add`;
CREATE TABLE IF NOT EXISTS `bank_add` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bank_id` varchar(255) NOT NULL,
  `bank_name` varchar(255) NOT NULL,
  `ac_name` varchar(250) DEFAULT NULL,
  `ac_number` varchar(250) DEFAULT NULL,
  `branch` varchar(250) DEFAULT NULL,
  `signature_pic` varchar(250) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `closing_records`
--

DROP TABLE IF EXISTS `closing_records`;
CREATE TABLE IF NOT EXISTS `closing_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `head_code` bigint(20) DEFAULT NULL,
  `opening_balance` decimal(10,2) NOT NULL DEFAULT '0.00',
  `amount_in` decimal(10,2) NOT NULL DEFAULT '0.00',
  `amount_out` decimal(10,2) NOT NULL DEFAULT '0.00',
  `closign_balance` decimal(10,2) NOT NULL DEFAULT '0.00',
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` varchar(20) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `company_information`
--

DROP TABLE IF EXISTS `company_information`;
CREATE TABLE IF NOT EXISTS `company_information` (
  `company_id` varchar(250) NOT NULL,
  `company_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `website` varchar(50) NOT NULL,
  `vat_no` varchar(50) DEFAULT NULL,
  `cr_no` varchar(50) DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `company_information`
--

INSERT INTO `company_information` (`company_id`, `company_name`, `email`, `address`, `mobile`, `website`, `vat_no`, `cr_no`, `status`) VALUES
('1', 'Helpful shop', 'helpful@mail.com', 'Rangpur', '123456', 'https://helpful.com/', '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `currency_tbl`
--

DROP TABLE IF EXISTS `currency_tbl`;
CREATE TABLE IF NOT EXISTS `currency_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `currency_name` varchar(50) NOT NULL,
  `icon` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `currency_tbl`
--

INSERT INTO `currency_tbl` (`id`, `currency_name`, `icon`) VALUES
(2, 'USD', '$'),
(3, 'Tk.', '৳');

-- --------------------------------------------------------

--
-- Table structure for table `customer_information`
--

DROP TABLE IF EXISTS `customer_information`;
CREATE TABLE IF NOT EXISTS `customer_information` (
  `customer_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(255) DEFAULT NULL,
  `customer_address` varchar(255) DEFAULT NULL,
  `address2` text NOT NULL,
  `customer_mobile` varchar(100) DEFAULT NULL,
  `customer_email` varchar(100) DEFAULT NULL,
  `email_address` varchar(200) DEFAULT NULL,
  `contact` varchar(100) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `fax` varchar(100) DEFAULT NULL,
  `city` text,
  `state` text,
  `zip` varchar(50) DEFAULT NULL,
  `country` varchar(250) DEFAULT NULL,
  `status` int(11) NOT NULL COMMENT '1=paid,2=credit',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_by` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer_information`
--

INSERT INTO `customer_information` (`customer_id`, `customer_name`, `customer_address`, `address2`, `customer_mobile`, `customer_email`, `email_address`, `contact`, `phone`, `fax`, `city`, `state`, `zip`, `country`, `status`, `create_date`, `create_by`) VALUES
(1, 'Walk-in-customer', '', '', '', '', '', '', '', '', '', '', '', '', 1, '2022-10-22 07:55:12', '1'),
(2, 'Maynul Haque', '', '', '', '', '', '', '', '', '', '', '', '', 1, '2022-10-24 10:42:35', '1'),
(3, 'Kibria', '', '', '', 'mdsohelranacse@gmail.com', '', '', '', '', '', '', '', '', 1, '2022-10-24 10:43:16', '1'),
(4, 'Maruf', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2022-10-24 10:43:47', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `daily_banking_add`
--

DROP TABLE IF EXISTS `daily_banking_add`;
CREATE TABLE IF NOT EXISTS `daily_banking_add` (
  `banking_id` varchar(255) NOT NULL,
  `date` datetime DEFAULT NULL,
  `bank_id` varchar(100) DEFAULT NULL,
  `deposit_type` varchar(255) DEFAULT NULL,
  `transaction_type` varchar(255) DEFAULT NULL,
  `description` text,
  `amount` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `daily_closing`
--

DROP TABLE IF EXISTS `daily_closing`;
CREATE TABLE IF NOT EXISTS `daily_closing` (
  `closing_id` int(11) NOT NULL AUTO_INCREMENT,
  `last_day_closing` float NOT NULL,
  `cash_in` float NOT NULL,
  `cash_out` float NOT NULL,
  `date` varchar(250) NOT NULL,
  `amount` float NOT NULL,
  `adjustment` float DEFAULT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`closing_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `designation`
--

DROP TABLE IF EXISTS `designation`;
CREATE TABLE IF NOT EXISTS `designation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designation` varchar(150) NOT NULL,
  `details` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `designation`
--

INSERT INTO `designation` (`id`, `designation`, `details`) VALUES
(1, 'sales man', '');

-- --------------------------------------------------------

--
-- Table structure for table `email_config`
--

DROP TABLE IF EXISTS `email_config`;
CREATE TABLE IF NOT EXISTS `email_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `protocol` text NOT NULL,
  `smtp_host` text NOT NULL,
  `smtp_port` text NOT NULL,
  `smtp_user` varchar(35) NOT NULL,
  `smtp_pass` varchar(35) NOT NULL,
  `mailtype` varchar(30) DEFAULT NULL,
  `isinvoice` tinyint(4) NOT NULL,
  `isservice` tinyint(4) NOT NULL,
  `isquotation` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `email_config`
--

INSERT INTO `email_config` (`id`, `protocol`, `smtp_host`, `smtp_port`, `smtp_user`, `smtp_pass`, `mailtype`, `isinvoice`, `isservice`, `isquotation`) VALUES
(1, 'ssl', 'mail.waymarks.agency', '465', 'info@waymarks.agency', 'Mnbvcxz1!23', 'html', 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `employee_history`
--

DROP TABLE IF EXISTS `employee_history`;
CREATE TABLE IF NOT EXISTS `employee_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `designation` varchar(100) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `rate_type` int(11) NOT NULL,
  `hrate` float NOT NULL,
  `email` varchar(50) NOT NULL,
  `blood_group` varchar(10) NOT NULL,
  `address_line_1` text NOT NULL,
  `address_line_2` text NOT NULL,
  `image` text,
  `country` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `zip` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `employee_salary_payment`
--

DROP TABLE IF EXISTS `employee_salary_payment`;
CREATE TABLE IF NOT EXISTS `employee_salary_payment` (
  `emp_sal_pay_id` int(11) NOT NULL AUTO_INCREMENT,
  `generate_id` int(11) NOT NULL,
  `employee_id` varchar(50) CHARACTER SET latin1 NOT NULL,
  `total_salary` decimal(18,2) NOT NULL DEFAULT '0.00',
  `total_working_minutes` varchar(50) CHARACTER SET latin1 NOT NULL,
  `working_period` varchar(50) CHARACTER SET latin1 NOT NULL,
  `payment_due` varchar(50) CHARACTER SET latin1 NOT NULL,
  `payment_date` varchar(50) CHARACTER SET latin1 NOT NULL,
  `salary_name` varchar(100) DEFAULT NULL,
  `payment_type` int(11) DEFAULT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `paid_by` varchar(50) CHARACTER SET latin1 NOT NULL,
  `salary_month` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`emp_sal_pay_id`),
  KEY `employee_id` (`employee_id`),
  KEY `generate_id` (`generate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `employee_salary_setup`
--

DROP TABLE IF EXISTS `employee_salary_setup`;
CREATE TABLE IF NOT EXISTS `employee_salary_setup` (
  `e_s_s_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `employee_id` varchar(30) CHARACTER SET latin1 NOT NULL,
  `sal_type` varchar(30) NOT NULL,
  `salary_type_id` varchar(30) CHARACTER SET latin1 NOT NULL,
  `amount` decimal(12,2) NOT NULL DEFAULT '0.00',
  `is_percentage` int(11) DEFAULT NULL COMMENT 'all amount will add or deduct on percent if true ',
  `create_date` date DEFAULT NULL,
  `update_date` datetime(6) DEFAULT NULL,
  `update_id` varchar(30) CHARACTER SET latin1 NOT NULL,
  `gross_salary` float NOT NULL,
  PRIMARY KEY (`e_s_s_id`),
  KEY `employee_id` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `expense`
--

DROP TABLE IF EXISTS `expense`;
CREATE TABLE IF NOT EXISTS `expense` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `type` varchar(100) NOT NULL,
  `voucher_no` varchar(50) NOT NULL,
  `amount` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `expense_item`
--

DROP TABLE IF EXISTS `expense_item`;
CREATE TABLE IF NOT EXISTS `expense_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `expense_item_name` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `financial_year`
--

DROP TABLE IF EXISTS `financial_year`;
CREATE TABLE IF NOT EXISTS `financial_year` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `yearName` varchar(30) NOT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  `isCloseReq` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '2' COMMENT '1=active, 0=closed, 2=pending',
  `created_by` int(6) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int(6) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `gmb_salary_advance`
--

DROP TABLE IF EXISTS `gmb_salary_advance`;
CREATE TABLE IF NOT EXISTS `gmb_salary_advance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(50) NOT NULL,
  `salary_month` varchar(50) NOT NULL COMMENT 'for the month advance will be deducted',
  `amount` decimal(11,0) NOT NULL,
  `release_amount` decimal(11,0) DEFAULT '0',
  `paid` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'paid_to_employee',
  `CreateDate` date NOT NULL,
  `CreateBy` int(11) NOT NULL,
  `UpdateDate` date DEFAULT NULL,
  `UpdateBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `gmb_salary_generate`
--

DROP TABLE IF EXISTS `gmb_salary_generate`;
CREATE TABLE IF NOT EXISTS `gmb_salary_generate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sal_month_year` varchar(50) NOT NULL,
  `employee_id` varchar(11) NOT NULL,
  `tin_no` int(50) DEFAULT NULL COMMENT 'TIN No',
  `total_attendance` varchar(11) DEFAULT NULL COMMENT 'tagret_hours / days',
  `total_count` varchar(11) DEFAULT NULL COMMENT 'weorked_hours / days',
  `atten_allowance` decimal(11,2) DEFAULT NULL COMMENT 'based on taget hours / days',
  `gross` decimal(11,2) NOT NULL COMMENT 'from employee_file table',
  `basic` decimal(11,2) NOT NULL COMMENT 'from employee_file table',
  `transport` decimal(11,2) NOT NULL,
  `house_rent` decimal(11,2) DEFAULT NULL,
  `medical` decimal(11,2) DEFAULT NULL,
  `other_allowance` decimal(11,2) DEFAULT NULL,
  `gross_salary` decimal(11,2) NOT NULL COMMENT 'after adding all allowance with basic',
  `income_tax` decimal(11,2) DEFAULT NULL COMMENT 'from employee_file table it will convert to amount',
  `soc_sec_npf_tax` decimal(11,2) DEFAULT NULL COMMENT 'from employee_file table it will convert to amount',
  `employer_contribution` decimal(11,2) DEFAULT NULL COMMENT '10 % of basic if there soc.sec.tax available ',
  `icf_amount` decimal(11,0) NOT NULL COMMENT 'Id social security tax available',
  `loan_deduct` decimal(11,2) DEFAULT NULL,
  `loan_id` int(11) DEFAULT NULL COMMENT 'From grand_loan table',
  `salary_advance` decimal(11,2) DEFAULT NULL,
  `salary_adv_id` int(11) DEFAULT NULL COMMENT 'From gmb_salary_advance table',
  `lwp` decimal(11,2) DEFAULT NULL COMMENT 'leave without pay	',
  `pf` decimal(11,2) DEFAULT NULL COMMENT 'providend fund',
  `stamp` decimal(11,2) DEFAULT NULL COMMENT 'deduct type',
  `net_salary` decimal(11,2) DEFAULT NULL COMMENT 'after deduct net amount from gross salary',
  `createDate` date DEFAULT NULL,
  `createBy` varchar(11) NOT NULL,
  `updateDate` date DEFAULT NULL,
  `updateBy` varchar(11) DEFAULT NULL,
  `medical_benefit` decimal(11,2) DEFAULT NULL,
  `family_benefit` decimal(11,2) DEFAULT NULL,
  `transportation_benefit` decimal(11,2) DEFAULT NULL,
  `other_benefit` decimal(11,2) DEFAULT NULL,
  `normal_working_hrs_month` decimal(20,2) DEFAULT NULL,
  `actual_working_hrs_month` decimal(20,2) DEFAULT NULL,
  `hourly_rate_basic` decimal(20,2) DEFAULT NULL,
  `hourly_rate_trasport_allowance` decimal(20,2) DEFAULT NULL,
  `basic_salary_pro_rated` decimal(20,2) DEFAULT NULL,
  `transport_allowance_pro_rated` decimal(20,2) DEFAULT NULL,
  `basic_transport_allowance` decimal(20,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `gmb_salary_sheet_generate`
--

DROP TABLE IF EXISTS `gmb_salary_sheet_generate`;
CREATE TABLE IF NOT EXISTS `gmb_salary_sheet_generate` (
  `ssg_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `gdate` varchar(30) DEFAULT NULL,
  `start_date` varchar(30) NOT NULL,
  `end_date` varchar(30) NOT NULL,
  `generate_by` varchar(30) NOT NULL COMMENT 'user_id',
  `approved` tinyint(1) DEFAULT '0' COMMENT '1 = approved, 0= not approved',
  `approved_by` varchar(20) DEFAULT NULL,
  `approved_date` date DEFAULT NULL,
  PRIMARY KEY (`ssg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
CREATE TABLE IF NOT EXISTS `invoice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_id` bigint(20) NOT NULL,
  `invoice` bigint(20) NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  `date` varchar(50) DEFAULT NULL,
  `total_amount` decimal(18,2) NOT NULL DEFAULT '0.00',
  `paid_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `due_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `prevous_due` decimal(20,2) NOT NULL DEFAULT '0.00',
  `shipping_cost` decimal(10,2) NOT NULL DEFAULT '0.00',
  `offline_invoice_no` bigint(20) DEFAULT NULL,
  `invoice_discount` decimal(10,2) DEFAULT '0.00' COMMENT 'invoice discount',
  `total_discount` decimal(10,2) DEFAULT '0.00' COMMENT 'total invoice discount',
  `total_vat_amnt` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'total invoice vat',
  `total_tax` decimal(10,2) DEFAULT '0.00',
  `ret_adjust_amnt` decimal(10,2) DEFAULT NULL,
  `returnable_amount` decimal(10,2) DEFAULT NULL,
  `sales_by` varchar(50) NOT NULL,
  `delivery_note` text,
  `invoice_details` text NOT NULL,
  `is_credit` tinyint(4) DEFAULT NULL,
  `is_fixed` int(11) NOT NULL DEFAULT '0',
  `is_dynamic` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL,
  `bank_id` varchar(30) DEFAULT NULL,
  `payment_type` int(11) NOT NULL,
  `is_online` int(11) NOT NULL DEFAULT '1',
  `payment_method_id` int(11) NOT NULL,
  `added_on` datetime NOT NULL,
  `added_by` int(11) NOT NULL,
  `edited_on` datetime DEFAULT NULL,
  `edited_by` int(11) DEFAULT NULL,
  `warehouse_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  KEY `invoice_id` (`invoice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`id`, `invoice_id`, `invoice`, `customer_id`, `date`, `total_amount`, `paid_amount`, `due_amount`, `prevous_due`, `shipping_cost`, `offline_invoice_no`, `invoice_discount`, `total_discount`, `total_vat_amnt`, `total_tax`, `ret_adjust_amnt`, `returnable_amount`, `sales_by`, `delivery_note`, `invoice_details`, `is_credit`, `is_fixed`, `is_dynamic`, `status`, `bank_id`, `payment_type`, `is_online`, `payment_method_id`, `added_on`, `added_by`, `edited_on`, `edited_by`, `warehouse_id`) VALUES
(1, 1, 1000001, 2, '2022-10-25', '1885.00', '1885.00', '0.00', '0.00', '80.00', NULL, '95.00', '0.00', '0.00', '0.00', NULL, NULL, '1', NULL, '', NULL, 0, 0, 1, NULL, 0, 1, 3, '2022-10-25 14:22:01', 1, NULL, NULL, 1),
(2, 2, 1000002, 3, '2022-10-25', '21680.00', '21680.00', '0.00', '0.00', '80.00', NULL, '2800.00', '0.00', '0.00', '0.00', NULL, NULL, '1', NULL, 'This is invoice details...', NULL, 0, 0, 1, NULL, 0, 1, 2, '2022-10-25 15:48:16', 1, '2022-10-25 17:57:48', 1, 1),
(3, 3, 1000003, 3, '2022-10-25', '7230.00', '7230.00', '0.00', '0.00', '80.00', NULL, '250.00', '0.00', '0.00', '0.00', NULL, NULL, '1', NULL, 'details here', NULL, 0, 0, 1, NULL, 0, 1, 3, '2022-10-25 15:51:32', 1, NULL, NULL, 1),
(4, 4, 1000004, 2, '2022-10-26', '10160.00', '10160.00', '0.00', '0.00', '80.00', NULL, '2520.00', '0.00', '0.00', '0.00', NULL, NULL, '1', NULL, '', NULL, 0, 0, 1, NULL, 0, 1, 3, '2022-10-26 09:37:00', 1, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `invoice_details`
--

DROP TABLE IF EXISTS `invoice_details`;
CREATE TABLE IF NOT EXISTS `invoice_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_details_id` varchar(100) NOT NULL,
  `invoice_id` varchar(100) NOT NULL,
  `ret_invoice_id` bigint(20) DEFAULT NULL,
  `product_id` varchar(30) NOT NULL,
  `serial_no` varchar(30) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `quantity` decimal(10,2) DEFAULT NULL,
  `rate` decimal(10,2) DEFAULT NULL,
  `batch_id` varchar(30) DEFAULT NULL,
  `supplier_rate` float DEFAULT NULL,
  `total_price` decimal(12,2) DEFAULT NULL,
  `discount` decimal(10,2) DEFAULT NULL,
  `discount_per` double(10,2) DEFAULT NULL,
  `vat_amnt` decimal(10,2) DEFAULT NULL,
  `vat_amnt_per` varchar(15) DEFAULT NULL,
  `tax` decimal(10,2) DEFAULT NULL,
  `paid_amount` decimal(12,0) DEFAULT NULL,
  `due_amount` decimal(10,2) DEFAULT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_id` (`invoice_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `invoice_details`
--

INSERT INTO `invoice_details` (`id`, `invoice_details_id`, `invoice_id`, `ret_invoice_id`, `product_id`, `serial_no`, `description`, `quantity`, `rate`, `batch_id`, `supplier_rate`, `total_price`, `discount`, `discount_per`, `vat_amnt`, `vat_amnt_per`, `tax`, `paid_amount`, `due_amount`, `status`) VALUES
(1, '942345588466997', '1', NULL, '16737744', NULL, NULL, '10.00', '190.00', NULL, NULL, '1805.00', '95.00', 5.00, NULL, NULL, NULL, NULL, NULL, 1),
(6, '967927656711557', '3', NULL, '19526545', NULL, NULL, '10.00', '140.00', NULL, NULL, '1260.00', '140.00', 10.00, NULL, NULL, NULL, NULL, NULL, 1),
(7, '692343763611841', '3', NULL, '62560353', NULL, NULL, '20.00', '190.00', NULL, NULL, '3800.00', '0.00', 0.00, NULL, NULL, NULL, NULL, NULL, 1),
(8, '798723762626449', '3', NULL, '69488303', NULL, NULL, '10.00', '220.00', NULL, NULL, '2090.00', '110.00', 5.00, NULL, NULL, NULL, NULL, NULL, 1),
(12, '217236857381553', '2', NULL, '69488303', NULL, NULL, '40.00', '220.00', NULL, NULL, '7920.00', '880.00', 10.00, NULL, NULL, NULL, NULL, NULL, 1),
(13, '551821841161292', '2', NULL, '16737744', NULL, NULL, '60.00', '190.00', NULL, NULL, '9690.00', '1710.00', 15.00, NULL, NULL, NULL, NULL, NULL, 1),
(14, '659265385538899', '2', NULL, '19526545', NULL, NULL, '30.00', '140.00', NULL, NULL, '3990.00', '210.00', 5.00, NULL, NULL, NULL, NULL, NULL, 1),
(15, '413313543351984', '4', NULL, '19526545', NULL, NULL, '90.00', '140.00', NULL, NULL, '10080.00', '2520.00', 20.00, NULL, NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

DROP TABLE IF EXISTS `language`;
CREATE TABLE IF NOT EXISTS `language` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `phrase` text NOT NULL,
  `english` text,
  `bangla` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1104 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `language`
--

INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES
(1, 'user_profile', 'User Profile', NULL),
(2, 'setting', 'Setting', NULL),
(3, 'language', 'Language', NULL),
(4, 'manage_users', 'Manage Users', NULL),
(5, 'add_user', 'Add User', NULL),
(6, 'manage_company', 'Manage Company', NULL),
(7, 'web_settings', 'Software Settings', NULL),
(8, 'manage_accounts', 'Manage Accounts', NULL),
(9, 'create_accounts', 'Create Account', NULL),
(10, 'manage_bank', 'Manage Bank', NULL),
(11, 'add_new_bank', 'Add New Bank', NULL),
(12, 'settings', 'Settings', NULL),
(13, 'closing_report', 'Closing Report', NULL),
(14, 'closing', 'Closing', NULL),
(15, 'cheque_manager', 'Cheque Manager', NULL),
(16, 'accounts_summary', 'Accounts Summary', NULL),
(17, 'expense', 'Expense', NULL),
(18, 'income', 'Income', NULL),
(19, 'accounts', 'Accounts', NULL),
(20, 'stock_report', 'Stock Report', NULL),
(21, 'stock', 'Stock', NULL),
(22, 'pos_invoice', 'POS Sale', NULL),
(23, 'manage_invoice', 'Manage Sale', NULL),
(24, 'new_invoice', 'New Sale', NULL),
(25, 'invoice', 'Sale', NULL),
(26, 'manage_purchase', 'Manage Purchase', NULL),
(27, 'add_purchase', 'Add Purchase', NULL),
(28, 'purchase', 'Purchase', NULL),
(29, 'paid_customer', 'Paid Customer', NULL),
(30, 'manage_customer', 'Manage Customer', NULL),
(31, 'add_customer', 'Add Customer', NULL),
(32, 'customer', 'Customer', NULL),
(33, 'supplier_payment_actual', 'Supplier Payment Ledger', NULL),
(34, 'supplier_sales_summary', 'Supplier Sales Summary', NULL),
(35, 'supplier_sales_details', 'Supplier Sales Details', NULL),
(36, 'supplier_ledger', 'Supplier Ledger', NULL),
(37, 'manage_supplier', 'Manage Supplier', NULL),
(38, 'add_supplier', 'Add Supplier', NULL),
(39, 'supplier', 'Supplier', NULL),
(40, 'product_statement', 'Product Statement', NULL),
(41, 'manage_product', 'Manage Product', NULL),
(42, 'add_product', 'Add Product', NULL),
(43, 'product', 'Product', NULL),
(44, 'manage_category', 'Manage Category', NULL),
(45, 'add_category', 'Add Category', NULL),
(46, 'category', 'Category', NULL),
(47, 'sales_report_product_wise', 'Sales Report (Product Wise)', NULL),
(48, 'purchase_report', 'Purchase Report', NULL),
(49, 'sales_report', 'Sales Report', NULL),
(50, 'todays_report', 'Todays Report', NULL),
(51, 'report', 'Report', NULL),
(52, 'dashboard', 'Dashboard', NULL),
(53, 'online', 'Online', NULL),
(54, 'logout', 'Logout', NULL),
(55, 'change_password', 'Change Password', NULL),
(56, 'total_purchase', 'Total Purchase', NULL),
(57, 'total_amount', 'Total Amount', NULL),
(58, 'supplier_name', 'Supplier Name', NULL),
(59, 'invoice_no', 'Invoice No', NULL),
(60, 'purchase_date', 'Purchase Date', NULL),
(61, 'todays_purchase_report', 'Todays Purchase Report', NULL),
(62, 'total_sales', 'Total Sales', NULL),
(63, 'customer_name', 'Customer Name', NULL),
(64, 'sales_date', 'Sales Date', NULL),
(65, 'todays_sales_report', 'Todays Sales Report', NULL),
(66, 'home', 'Home', NULL),
(67, 'todays_sales_and_purchase_report', 'Todays sales and purchase report', NULL),
(68, 'total_ammount', 'Total Amount', NULL),
(69, 'rate', 'Rate', NULL),
(70, 'product_model', 'Product Model', NULL),
(71, 'product_name', 'Product Name', NULL),
(72, 'search', 'Search', NULL),
(73, 'end_date', 'End Date', NULL),
(74, 'start_date', 'Start Date', NULL),
(75, 'total_purchase_report', 'Total Purchase Report', NULL),
(76, 'total_sales_report', 'Total Sales Report', NULL),
(77, 'total_seles', 'Total Sales', NULL),
(78, 'all_stock_report', 'All Stock Report', NULL),
(79, 'search_by_product', 'Search By Product', NULL),
(80, 'date', 'Date', NULL),
(81, 'print', 'Print', NULL),
(82, 'stock_date', 'Stock Date', NULL),
(83, 'print_date', 'Print Date', NULL),
(84, 'sales', 'Sales', NULL),
(85, 'price', 'Price', NULL),
(86, 'sl', 'SL.', NULL),
(87, 'add_new_category', 'Add new category', NULL),
(88, 'category_name', 'Category Name', NULL),
(89, 'save', 'Save', NULL),
(90, 'delete', 'Delete', NULL),
(91, 'update', 'Update', NULL),
(92, 'action', 'Action', NULL),
(93, 'manage_your_category', 'Manage your category ', NULL),
(94, 'category_edit', 'Category Edit', NULL),
(95, 'status', 'Status', NULL),
(96, 'active', 'Active', NULL),
(97, 'inactive', 'Inactive', NULL),
(98, 'save_changes', 'Save Changes', NULL),
(99, 'save_and_add_another', 'Save And Add Another', NULL),
(100, 'model', 'Model', NULL),
(101, 'supplier_price', 'Supplier Price', NULL),
(102, 'sell_price', 'Sale Price', NULL),
(103, 'image', 'Image', NULL),
(104, 'select_one', 'Select One', NULL),
(105, 'details', 'Details', NULL),
(106, 'new_product', 'New Product', NULL),
(107, 'add_new_product', 'Add new product', NULL),
(108, 'barcode', 'Barcode', NULL),
(109, 'qr_code', 'Qr-Code', NULL),
(110, 'product_details', 'Product Details', NULL),
(111, 'manage_your_product', 'Manage your product', NULL),
(112, 'product_edit', 'Product Edit', NULL),
(113, 'edit_your_product', 'Edit your product', NULL),
(114, 'cancel', 'Cancel', NULL),
(115, 'incl_vat', 'Incl. Vat', NULL),
(116, 'money', 'TK', NULL),
(117, 'grand_total', 'Grand Total', NULL),
(118, 'quantity', 'Quantity', NULL),
(119, 'product_report', 'Product Report', NULL),
(120, 'product_sales_and_purchase_report', 'Product sales and purchase report', NULL),
(121, 'previous_stock', 'Previous Stock', NULL),
(122, 'out', 'Out', NULL),
(123, 'in', 'In', NULL),
(124, 'to', 'To', NULL),
(125, 'previous_balance', 'Previous Balance', NULL),
(126, 'customer_address', 'Customer Address', NULL),
(127, 'customer_mobile', 'Customer Mobile', NULL),
(128, 'customer_email', 'Customer Email', NULL),
(129, 'add_new_customer', 'Add new customer', NULL),
(130, 'balance', 'Balance', NULL),
(131, 'mobile', 'Mobile', NULL),
(132, 'address', 'Address', NULL),
(133, 'manage_your_customer', 'Manage your customer', NULL),
(134, 'customer_edit', 'Customer Edit', NULL),
(135, 'paid_customer_list', 'Paid Customer List', NULL),
(136, 'ammount', 'Amount', NULL),
(137, 'customer_ledger', 'Customer Ledger', NULL),
(138, 'manage_customer_ledger', 'Manage Customer Ledger', NULL),
(139, 'customer_information', 'Customer Information', NULL),
(140, 'debit_ammount', 'Debit Amount', NULL),
(141, 'credit_ammount', 'Credit Amount', NULL),
(142, 'balance_ammount', 'Balance Amount', NULL),
(143, 'receipt_no', 'Receipt NO', NULL),
(144, 'description', 'Description', NULL),
(145, 'debit', 'Debit', NULL),
(146, 'credit', 'Credit', NULL),
(147, 'item_information', 'Item Information', NULL),
(148, 'total', 'Total', NULL),
(149, 'please_select_supplier', 'Please Select Supplier', NULL),
(150, 'submit', 'Submit', NULL),
(151, 'submit_and_add_another', 'Submit And Add Another One', NULL),
(152, 'add_new_item', 'Add New Item', NULL),
(153, 'manage_your_purchase', 'Manage your purchase', NULL),
(154, 'purchase_edit', 'Purchase Edit', NULL),
(155, 'purchase_ledger', 'Purchase Ledger', NULL),
(156, 'invoice_information', 'Sale Information', NULL),
(157, 'paid_ammount', 'Paid Amount', NULL),
(158, 'discount', 'Dis./Pcs.', NULL),
(159, 'save_and_paid', 'Save And Paid', NULL),
(160, 'payee_name', 'Payee Name', NULL),
(161, 'manage_your_invoice', 'Manage your Sale', NULL),
(162, 'invoice_edit', 'Sale Edit', NULL),
(163, 'new_pos_invoice', 'New POS Sale', NULL),
(164, 'add_new_pos_invoice', 'Add new pos Sale', NULL),
(165, 'product_id', 'Product ID', NULL),
(166, 'paid_amount', 'Paid Amount', NULL),
(167, 'authorised_by', 'Authorised By', NULL),
(168, 'checked_by', 'Checked By', NULL),
(169, 'received_by', 'Received By', NULL),
(170, 'prepared_by', 'Prepared By', NULL),
(171, 'memo_no', 'Memo No', NULL),
(172, 'website', 'Website', NULL),
(173, 'email', 'Email', NULL),
(174, 'invoice_details', 'Sale Details', NULL),
(175, 'reset', 'Reset', NULL),
(176, 'payment_account', 'Payment Account', NULL),
(177, 'bank_name', 'Bank Name', NULL),
(178, 'cheque_or_pay_order_no', 'Cheque/Pay Order No', NULL),
(179, 'payment_type', 'Payment Type', NULL),
(180, 'payment_from', 'Payment From', NULL),
(181, 'payment_date', 'Payment Date', NULL),
(182, 'add_income', 'Add Income', NULL),
(183, 'cash', 'Cash', NULL),
(184, 'cheque', 'Cheque', NULL),
(185, 'pay_order', 'Pay Order', NULL),
(186, 'payment_to', 'Payment To', NULL),
(187, 'total_outflow_ammount', 'Total Expense Amount', NULL),
(188, 'transections', 'Transections', NULL),
(189, 'accounts_name', 'Accounts Name', NULL),
(190, 'outflow_report', 'Expense Report', NULL),
(191, 'inflow_report', 'Income Report', NULL),
(192, 'all', 'All', NULL),
(193, 'account', 'Account', NULL),
(194, 'from', 'From', NULL),
(195, 'account_summary_report', 'Account Summary Report', NULL),
(196, 'search_by_date', 'Search By Date', NULL),
(197, 'cheque_no', 'Cheque No', NULL),
(198, 'name', 'Name', NULL),
(199, 'closing_account', 'Closing Account', NULL),
(200, 'close_your_account', 'Close your account', NULL),
(201, 'last_day_closing', 'Last Day Closing', NULL),
(202, 'cash_in', 'Cash In', NULL),
(203, 'cash_out', 'Cash Out', NULL),
(204, 'cash_in_hand', 'Cash In Hand', NULL),
(205, 'add_new_bank', 'Add New Bank', NULL),
(206, 'day_closing', 'Day Closing', NULL),
(207, 'account_closing_report', 'Account Closing Report', NULL),
(208, 'last_day_ammount', 'Last Day Amount', NULL),
(209, 'adjustment', 'Adjustment', NULL),
(210, 'pay_type', 'Pay Type', NULL),
(211, 'customer_or_supplier', 'Customer,Supplier Or Others', NULL),
(212, 'transection_id', 'Transections ID', NULL),
(213, 'accounts_summary_report', 'Accounts Summary Report', NULL),
(214, 'bank_list', 'Bank List', NULL),
(215, 'bank_edit', 'Bank Edit', NULL),
(216, 'debit_plus', 'Debit (+)', NULL),
(217, 'credit_minus', 'Credit (-)', NULL),
(218, 'account_name', 'Account Name', NULL),
(219, 'account_type', 'Account Type', NULL),
(220, 'account_real_name', 'Account Real Name', NULL),
(221, 'manage_account', 'Manage Account', NULL),
(222, 'company_name', 'Niha International', NULL),
(223, 'edit_your_company_information', 'Edit your company information', NULL),
(224, 'company_edit', 'Company Edit', NULL),
(225, 'admin', 'Admin', NULL),
(226, 'user', 'User', NULL),
(227, 'password', 'Password', NULL),
(228, 'last_name', 'Last Name', NULL),
(229, 'first_name', 'First Name', NULL),
(230, 'add_new_user_information', 'Add new user information', NULL),
(231, 'user_type', 'User Type', NULL),
(232, 'user_edit', 'User Edit', NULL),
(233, 'rtr', 'RTR', NULL),
(234, 'ltr', 'LTR', NULL),
(235, 'ltr_or_rtr', 'LTR/RTR', NULL),
(236, 'footer_text', 'Footer Text', NULL),
(237, 'favicon', 'Favicon', NULL),
(238, 'logo', 'Logo', NULL),
(239, 'update_setting', 'Update Setting', NULL),
(240, 'update_your_web_setting', 'Update your web setting', NULL),
(241, 'login', 'Login', NULL),
(242, 'your_strong_password', 'Your strong password', NULL),
(243, 'your_unique_email', 'Your unique email', NULL),
(244, 'please_enter_your_login_information', 'Please enter your login information.', NULL),
(245, 'update_profile', 'Update Profile', NULL),
(246, 'your_profile', 'Your Profile', NULL),
(247, 're_type_password', 'Re-Type Password', NULL),
(248, 'new_password', 'New Password', NULL),
(249, 'old_password', 'Old Password', NULL),
(250, 'new_information', 'New Information', NULL),
(251, 'old_information', 'Old Information', NULL),
(252, 'change_your_information', 'Change your information', NULL),
(253, 'change_your_profile', 'Change your profile', NULL),
(254, 'profile', 'Profile', NULL),
(255, 'wrong_username_or_password', 'Wrong User Name Or Password !', NULL),
(256, 'successfully_updated', 'Updated Successfully', NULL),
(257, 'blank_field_does_not_accept', 'Blank Field Does Not Accept !', NULL),
(258, 'successfully_changed_password', 'Password Changed Successfully', NULL),
(259, 'you_are_not_authorised_person', 'You are not authorised person !', NULL),
(260, 'password_and_repassword_does_not_match', 'Passwor and re-password does not match !', NULL),
(261, 'new_password_at_least_six_character', 'New Password At Least 6 Character.', NULL),
(262, 'you_put_wrong_email_address', 'You put wrong email address !', NULL),
(263, 'cheque_ammount_asjusted', 'Cheque amount adjusted.', NULL),
(264, 'successfully_payment_paid', 'Successfully Payment Paid.', NULL),
(265, 'successfully_added', 'Successfully Added.', NULL),
(266, 'successfully_updated_2_closing_ammount_not_changeale', 'Successfully Updated -2. Note: Closing Amount Not Changeable.', NULL),
(267, 'successfully_payment_received', 'Successfully Payment Received.', NULL),
(268, 'already_inserted', 'Already Inserted !', NULL),
(269, 'successfully_delete', 'Successfully Delete.', NULL),
(270, 'successfully_created', 'Successfully Created.', NULL),
(271, 'logo_not_uploaded', 'Logo not uploaded !', NULL),
(272, 'favicon_not_uploaded', 'Favicon not uploaded !', NULL),
(273, 'supplier_mobile', 'Supplier Mobile', NULL),
(274, 'supplier_address', 'Supplier Address', NULL),
(275, 'supplier_details', 'Supplier Details', NULL),
(276, 'add_new_supplier', 'Add New Supplier', NULL),
(277, 'manage_suppiler', 'Manage Supplier', NULL),
(278, 'manage_your_supplier', 'Manage your supplier', NULL),
(279, 'manage_supplier_ledger', 'Manage supplier ledger', NULL),
(280, 'invoice_id', 'Invoice ID', NULL),
(281, 'deposite_id', 'Deposite ID', NULL),
(282, 'supplier_actual_ledger', 'Supplier Payment Ledger', NULL),
(283, 'supplier_information', 'Supplier Information', NULL),
(284, 'event', 'Event', NULL),
(285, 'add_new_income', 'Add New Income', NULL),
(286, 'add_expese', 'Add Expense', NULL),
(287, 'add_new_expense', 'Add New Expense', NULL),
(288, 'total_inflow_ammount', 'Total Income Amount', NULL),
(289, 'create_new_invoice', 'Create New Sale', NULL),
(290, 'create_pos_invoice', 'Create POS Sale', NULL),
(291, 'total_profit', 'Total Profit', NULL),
(292, 'monthly_progress_report', 'Monthly Progress Report', NULL),
(293, 'total_invoice', 'Total Sale', NULL),
(294, 'account_summary', 'Account Summary', NULL),
(295, 'total_supplier', 'Total Supplier', NULL),
(296, 'total_product', 'Total Product', NULL),
(297, 'total_customer', 'Total Customer', NULL),
(298, 'supplier_edit', 'Supplier Edit', NULL),
(299, 'add_new_invoice', 'Add New Sale', NULL),
(300, 'add_new_purchase', 'Add new purchase', NULL),
(301, 'currency', 'Currency', NULL),
(302, 'currency_position', 'Currency Position', NULL),
(303, 'left', 'Left', NULL),
(304, 'right', 'Right', NULL),
(305, 'add_tax', 'Add TAX', NULL),
(306, 'manage_tax', 'Manage TAX', NULL),
(307, 'add_new_tax', 'Add new TAX', NULL),
(308, 'enter_tax', 'Enter TAX', NULL),
(309, 'already_exists', 'Already Exists !', NULL),
(310, 'successfully_inserted', 'Successfully Inserted.', NULL),
(311, 'tax', 'TAX', NULL),
(312, 'tax_edit', 'TAX Edit', NULL),
(313, 'product_not_added', 'Product not added !', NULL),
(314, 'total_tax', 'Total TAX', NULL),
(315, 'manage_your_supplier_details', 'Manage your supplier details.', NULL),
(316, 'invoice_description', 'Lorem Ipsum is sim ply dummy Lorem Ipsum is simply dummy Lorem Ipsum is simply dummy Lorem Ipsum is simply dummy Lorem Ipsum is simply dummy Lorem Ipsum is sim ply dummy Lorem Ipsum is simply dummy Lorem Ipsum is simply dummy Lorem Ipsum is simply dummy Lorem Ipsum is simply dummy', NULL),
(317, 'thank_you_for_choosing_us', 'Thank you very much for choosing us.', NULL),
(318, 'billing_date', 'Billing Date', NULL),
(319, 'billing_to', 'Billing To', NULL),
(320, 'billing_from', 'Billing From', NULL),
(321, 'you_cant_delete_this_product', 'Sorry !!  You can\'t delete this product.This product already used in calculation system!', NULL),
(322, 'old_customer', 'Old Customer', NULL),
(323, 'new_customer', 'New Customer', NULL),
(324, 'new_supplier', 'New Supplier', NULL),
(325, 'old_supplier', 'Old Supplier', NULL),
(326, 'credit_customer', 'Credit Customer', NULL),
(327, 'account_already_exists', 'This Account Already Exists !', NULL),
(328, 'edit_income', 'Edit Income', NULL),
(329, 'you_are_not_access_this_part', 'You are not authorised person !', NULL),
(330, 'account_edit', 'Account Edit', NULL),
(331, 'due', 'Due', NULL),
(332, 'expense_edit', 'Expense Edit', NULL),
(333, 'please_select_customer', 'Please select customer !', NULL),
(334, 'profit_report', 'Profit Report (Sale Wise)', NULL),
(335, 'total_profit_report', 'Total profit report', NULL),
(336, 'please_enter_valid_captcha', 'Please enter valid captcha.', NULL),
(337, 'category_not_selected', 'Category not selected.', NULL),
(338, 'supplier_not_selected', 'Supplier not selected.', NULL),
(339, 'please_select_product', 'Please select product.', NULL),
(340, 'product_model_already_exist', 'Product model already exist !', NULL),
(341, 'invoice_logo', 'Sale Logo', NULL),
(342, 'available_qnty', 'Av. Qnty.', NULL),
(343, 'you_can_not_buy_greater_than_available_cartoon', 'You can not select grater than available cartoon !', NULL),
(344, 'customer_details', 'Customer details', NULL),
(345, 'manage_customer_details', 'Manage customer details.', NULL),
(346, 'site_key', 'Captcha Site Key', NULL),
(347, 'secret_key', 'Captcha Secret Key', NULL),
(348, 'captcha', 'Captcha', NULL),
(349, 'cartoon_quantity', 'Cartoon Quantity', NULL),
(350, 'total_cartoon', 'Total Cartoon', NULL),
(351, 'cartoon', 'Cartoon', NULL),
(352, 'item_cartoon', 'Item/Cartoon', NULL),
(353, 'product_and_supplier_did_not_match', 'Product and supplier did not match !', NULL),
(354, 'if_you_update_purchase_first_select_supplier_then_product_and_then_quantity', 'If you update purchase,first select supplier then product and then update qnty.', NULL),
(355, 'item', 'Item', NULL),
(356, 'manage_your_credit_customer', 'Manage your credit customer', NULL),
(357, 'total_quantity', 'Total Quantity', NULL),
(358, 'quantity_per_cartoon', 'Quantity per cartoon', NULL),
(359, 'barcode_qrcode_scan_here', 'Barcode or QR-code scan here', NULL),
(360, 'synchronizer_setting', 'Synchronizer Setting', NULL),
(361, 'data_synchronizer', 'Data Synchronizer', NULL),
(362, 'hostname', 'Host name', NULL),
(363, 'username', 'User Name', NULL),
(364, 'ftp_port', 'FTP Port', NULL),
(365, 'ftp_debug', 'FTP Debug', NULL),
(366, 'project_root', 'Project Root', NULL),
(367, 'please_try_again', 'Please try again', NULL),
(368, 'save_successfully', 'Saved successfully', NULL),
(369, 'synchronize', 'Synchronize', NULL),
(370, 'internet_connection', 'Internet Connection', NULL),
(371, 'outgoing_file', 'Outgoing File', NULL),
(372, 'incoming_file', 'Incoming File', NULL),
(373, 'ok', 'Ok', NULL),
(374, 'not_available', 'Not Available', NULL),
(375, 'available', 'Available', NULL),
(376, 'download_data_from_server', 'Download data from server', NULL),
(377, 'data_import_to_database', 'Data import to database', NULL),
(378, 'data_upload_to_server', 'Data uplod to server', NULL),
(379, 'please_wait', 'Please Wait', NULL),
(380, 'ooops_something_went_wrong', 'Oooops Something went wrong !', NULL),
(381, 'upload_successfully', 'Uploaded successfully', NULL),
(382, 'unable_to_upload_file_please_check_configuration', 'Unable to upload file please check configuration', NULL),
(383, 'please_configure_synchronizer_settings', 'Please configure synchronizer settings', NULL),
(384, 'download_successfully', 'Download successfully', NULL),
(385, 'unable_to_download_file_please_check_configuration', 'Unable to download file please check configuration', NULL),
(386, 'data_import_first', 'Data import past', NULL),
(387, 'data_import_successfully', 'Data import successfully', NULL),
(388, 'unable_to_import_data_please_check_config_or_sql_file', 'Unable to import data please check config or sql file', NULL),
(389, 'total_sale_ctn', 'Total Sale Ctn', NULL),
(390, 'in_qnty', 'In Qnty.', NULL),
(391, 'out_qnty', 'Out Qnty.', NULL),
(392, 'stock_report_supplier_wise', 'Stock Report (Supplier Wise)', NULL),
(393, 'all_stock_report_supplier_wise', 'Stock Report (Suppler Wise)', NULL),
(394, 'select_supplier', 'Select Supplier', NULL),
(395, 'stock_report_product_wise', 'Stock Report (Product Wise)', NULL),
(396, 'phone', 'Phone', NULL),
(397, 'select_product', 'Select Product', NULL),
(398, 'in_quantity', 'In Qnty.', NULL),
(399, 'out_quantity', 'Out Qnty.', NULL),
(400, 'in_taka', 'In TK.', NULL),
(401, 'out_taka', 'Out TK.', NULL),
(402, 'commission', 'Commission', NULL),
(403, 'generate_commission', 'Generate Commssion', NULL),
(404, 'commission_rate', 'Commission Rate', NULL),
(405, 'total_ctn', 'Total Ctn.', NULL),
(406, 'per_pcs_commission', 'Per PCS Commission', NULL),
(407, 'total_commission', 'Total Commission', NULL),
(408, 'enter', 'Enter', NULL),
(409, 'please_add_walking_customer_for_default_customer', 'Please add \'Walking Customer\' for default customer.', NULL),
(410, 'supplier_ammount', 'Supplier Amount', NULL),
(411, 'my_sale_ammount', 'My Sale Amount', NULL),
(412, 'signature_pic', 'Signature Picture', NULL),
(413, 'branch', 'Branch', NULL),
(414, 'ac_no', 'A/C Number', NULL),
(415, 'ac_name', 'A/C Name', NULL),
(416, 'bank_transaction', 'Bank Transaction', NULL),
(417, 'bank', 'Bank', NULL),
(418, 'withdraw_deposite_id', 'Withdraw / Deposite ID', NULL),
(419, 'bank_ledger', 'Bank Ledger', NULL),
(420, 'note_name', 'Note Name', NULL),
(421, 'pcs', 'Pcs.', NULL),
(422, '1', '1', NULL),
(423, '2', '2', NULL),
(424, '5', '5', NULL),
(425, '10', '10', NULL),
(426, '20', '20', NULL),
(427, '50', '50', NULL),
(428, '100', '100', NULL),
(429, '500', '500', NULL),
(430, '1000', '1000', NULL),
(431, 'total_discount', 'Total Discount', NULL),
(432, 'product_not_found', 'Product not found !', NULL),
(433, 'this_is_not_credit_customer', 'This is not credit customer !', NULL),
(434, 'personal_loan', 'Personal Loan', NULL),
(435, 'add_person', 'Add Person', NULL),
(436, 'add_loan', 'Add Loan', NULL),
(437, 'add_payment', 'Add Payment', NULL),
(438, 'manage_person', 'Manage Person', NULL),
(439, 'personal_edit', 'Person Edit', NULL),
(440, 'person_ledger', 'Person Ledger', NULL),
(441, 'backup_restore', 'Backup ', NULL),
(442, 'database_backup', 'Database backup', NULL),
(443, 'file_information', 'File information', NULL),
(444, 'filename', 'Filename', NULL),
(445, 'size', 'Size', NULL),
(446, 'backup_date', 'Backup date', NULL),
(447, 'backup_now', 'Backup now', NULL),
(448, 'restore_now', 'Restore now', NULL),
(449, 'are_you_sure', 'Are you sure ?', NULL),
(450, 'download', 'Download', NULL),
(451, 'backup_and_restore', 'Backup', NULL),
(452, 'backup_successfully', 'Backup successfully', NULL),
(453, 'delete_successfully', 'Deleted Successfully', NULL),
(454, 'stock_ctn', 'Stock/Qty', NULL),
(455, 'unit', 'Unit', NULL),
(456, 'meter_m', 'Meter (M)', NULL),
(457, 'piece_pc', 'Piece (Pc)', NULL),
(458, 'kilogram_kg', 'Kilogram (Kg)', NULL),
(459, 'stock_cartoon', 'Stock Cartoon', NULL),
(460, 'add_product_csv', 'Add Product (CSV)', NULL),
(461, 'import_product_csv', 'Import product (CSV)', NULL),
(462, 'close', 'Close', NULL),
(463, 'download_example_file', 'Download example file.', NULL),
(464, 'upload_csv_file', 'Upload CSV File', NULL),
(465, 'csv_file_informaion', 'CSV File Information', NULL),
(466, 'out_of_stock', 'Out Of Stock', NULL),
(467, 'others', 'Others', NULL),
(468, 'full_paid', 'Full Paid', NULL),
(469, 'successfully_saved', 'Your Data Successfully Saved', NULL),
(470, 'manage_loan', 'Manage Loan', NULL),
(471, 'receipt', 'Receipt', NULL),
(472, 'payment', 'Payment', NULL),
(473, 'cashflow', 'Daily Cash Flow', NULL),
(474, 'signature', 'Signature', NULL),
(475, 'supplier_reports', 'Supplier Reports', NULL),
(476, 'generate', 'Generate', NULL),
(477, 'todays_overview', 'Todays Overview', NULL),
(478, 'last_sales', 'Last Sales', NULL),
(479, 'manage_transaction', 'Manage Transaction', NULL),
(480, 'daily_summary', 'Daily Summary', NULL),
(481, 'daily_cash_flow', 'Daily Cash Flow', NULL),
(482, 'custom_report', 'Custom Report', NULL),
(483, 'transaction', 'Transaction', NULL),
(484, 'receipt_amount', 'Receipt Amount', NULL),
(485, 'transaction_details_datewise', 'Transaction Details Datewise', NULL),
(486, 'cash_closing', 'Cash Closing', NULL),
(487, 'you_can_not_buy_greater_than_available_qnty', 'You can not buy greater than available qnty.', NULL),
(488, 'supplier_id', 'Supplier ID', NULL),
(489, 'category_id', 'Category ID', NULL),
(490, 'select_report', 'Select Report', NULL),
(491, 'supplier_summary', 'Supplier summary', NULL),
(492, 'sales_payment_actual', 'Sales payment actual', NULL),
(493, 'today_already_closed', 'Today already closed.', NULL),
(494, 'root_account', 'Root Account', NULL),
(495, 'office', 'Office', NULL),
(496, 'loan', 'Loan', NULL),
(497, 'transaction_mood', 'Transaction Mood', NULL),
(498, 'select_account', 'Select Account', NULL),
(499, 'add_receipt', 'Add Receipt', NULL),
(500, 'update_transaction', 'Update Transaction', NULL),
(501, 'no_stock_found', 'No Stock Found !', NULL),
(502, 'admin_login_area', 'Admin Login Area', NULL),
(503, 'print_qr_code', 'Print QR Code', NULL),
(504, 'discount_type', 'Discount Type', NULL),
(505, 'discount_percentage', 'Discount', NULL),
(506, 'fixed_dis', 'Fixed Dis.', NULL),
(507, 'return', 'Return', NULL),
(508, 'stock_return_list', 'Stock Return List', NULL),
(509, 'wastage_return_list', 'Wastage Return List', NULL),
(510, 'return_invoice', 'Sale Return', NULL),
(511, 'sold_qty', 'Sold Qty', NULL),
(512, 'ret_quantity', 'Return Qty', NULL),
(513, 'deduction', 'Deduction', NULL),
(514, 'check_return', 'Check Return', NULL),
(515, 'reason', 'Reason', NULL),
(516, 'usablilties', 'Usability', NULL),
(517, 'adjs_with_stck', 'Adjust With Stock', NULL),
(518, 'return_to_supplier', 'Return To Supplier', NULL),
(519, 'wastage', 'Wastage', NULL),
(520, 'to_deduction', 'Total Deduction ', NULL),
(521, 'nt_return', 'Net Return Amount', NULL),
(522, 'return_list', 'Return List', NULL),
(523, 'add_return', 'Add Return', NULL),
(524, 'per_qty', 'Purchase Qty', NULL),
(525, 'return_supplier', 'Supplier Return', NULL),
(526, 'stock_purchase', 'Stock Purchase Price', NULL),
(527, 'stock_sale', 'Stock Sale Price', NULL),
(528, 'supplier_return', 'Supplier Return', NULL),
(529, 'purchase_id', 'Purchase ID', NULL),
(530, 'return_id', 'Return ID', NULL),
(531, 'supplier_return_list', 'Supplier Return List', NULL),
(532, 'c_r_slist', 'Stock Return Stock', NULL),
(533, 'wastage_list', 'Wastage List', NULL),
(534, 'please_input_correct_invoice_id', 'Please Input a Correct Sale ID', NULL),
(535, 'please_input_correct_purchase_id', 'Please Input Your Correct  Purchase ID', NULL),
(536, 'add_more', 'Add More', NULL),
(537, 'prouct_details', 'Product Details', NULL),
(538, 'prouct_detail', 'Product Details', NULL),
(539, 'stock_return', 'Stock Return', NULL),
(540, 'choose_transaction', 'Select Transaction', NULL),
(541, 'transection_category', 'Select  Category', NULL),
(542, 'transaction_categry', 'Select Category', NULL),
(543, 'search_supplier', 'Search Supplier', NULL),
(544, 'customer_id', 'Customer ID', NULL),
(545, 'search_customer', 'Search Customer Invoice', NULL),
(546, 'serial_no', 'SN', NULL),
(547, 'item_discount', 'Item Discount', NULL),
(548, 'invoice_discount', 'Sale Discount', NULL),
(549, 'add_unit', 'Add Unit', NULL),
(550, 'manage_unit', 'Manage Unit', NULL),
(551, 'add_new_unit', 'Add New Unit', NULL),
(552, 'unit_name', 'Unit Name', NULL),
(553, 'payment_amount', 'Payment Amount', NULL),
(554, 'manage_your_unit', 'Manage Your Unit', NULL),
(555, 'unit_id', 'Unit ID', NULL),
(556, 'unit_edit', 'Unit Edit', NULL),
(557, 'vat', 'Vat', NULL),
(558, 'sales_report_category_wise', 'Sales Report (Category wise)', NULL),
(559, 'purchase_report_category_wise', 'Purchase Report (Category wise)', NULL),
(560, 'category_wise_purchase_report', 'Category wise purchase report', NULL),
(561, 'category_wise_sales_report', 'Category wise sales report', NULL),
(562, 'best_sale_product', 'Best Sale Product', NULL),
(563, 'all_best_sales_product', 'All Best Sales Products', NULL),
(564, 'todays_customer_receipt', 'Todays Customer Receipt', NULL),
(565, 'not_found', 'Record not found', NULL),
(566, 'collection', 'Collection', NULL),
(567, 'increment', 'Increment', NULL),
(568, 'accounts_tree_view', 'Accounts Tree View', NULL),
(569, 'debit_voucher', 'Debit Voucher', NULL),
(570, 'voucher_no', 'Voucher No', NULL),
(571, 'credit_account_head', 'Credit Account Head', NULL),
(572, 'remark', 'Remark', NULL),
(573, 'code', 'Code', NULL),
(574, 'amount', 'Amount', NULL),
(575, 'approved', 'Approved', NULL),
(576, 'debit_account_head', 'Debit Account Head', NULL),
(577, 'credit_voucher', 'Credit Voucher', NULL),
(578, 'find', 'Find', NULL),
(579, 'transaction_date', 'Transaction Date', NULL),
(580, 'voucher_type', 'Voucher Type', NULL),
(581, 'particulars', 'Particulars', NULL),
(582, 'with_details', 'With Details', NULL),
(583, 'general_ledger', 'General Ledger', NULL),
(584, 'general_ledger_of', 'General ledger of', NULL),
(585, 'pre_balance', 'Pre Balance', NULL),
(586, 'current_balance', 'Current Balance', NULL),
(587, 'to_date', 'To Date', NULL),
(588, 'from_date', 'From Date', NULL),
(589, 'trial_balance', 'Trial Balance', NULL),
(590, 'authorized_signature', 'Authorized Signature', NULL),
(591, 'chairman', 'Chairman', NULL),
(592, 'total_income', 'Total Income', NULL),
(593, 'statement_of_comprehensive_income', 'Statement of Comprehensive Income', NULL),
(594, 'profit_loss', 'Profit Loss', NULL),
(595, 'cash_flow_report', 'Cash Flow Report', NULL),
(596, 'cash_flow_statement', 'Cash Flow Statement', NULL),
(597, 'amount_in_dollar', 'Amount In Dollar', NULL),
(598, 'opening_cash_and_equivalent', 'Opening Cash and Equivalent', NULL),
(599, 'coa_print', 'Coa Print', NULL),
(600, 'cash_flow', 'Cash Flow', NULL),
(601, 'cash_book', 'Cash Book', NULL),
(602, 'bank_book', 'Bank Book', NULL),
(603, 'c_o_a', 'Chart of Account', NULL),
(604, 'journal_voucher', 'Journal Voucher', NULL),
(605, 'contra_voucher', 'Contra Voucher', NULL),
(606, 'voucher_approval', 'Vouchar Approval', NULL),
(607, 'supplier_payment', 'Supplier Payment', NULL),
(608, 'customer_receive', 'Customer Receive', NULL),
(609, 'gl_head', 'General Head', NULL),
(610, 'account_code', 'Account Head', NULL),
(611, 'opening_balance', 'Opening Balance', NULL),
(612, 'head_of_account', 'Head of Account', NULL),
(613, 'inventory_ledger', 'Inventory Ledger', NULL),
(614, 'newpassword', 'New Password', NULL),
(615, 'password_recovery', 'Password Recovery', NULL),
(616, 'forgot_password', 'Forgot Password ??', NULL),
(617, 'send', 'Send', NULL),
(618, 'due_report', 'Due Report', NULL),
(619, 'due_amount', 'Due Amount', NULL),
(620, 'download_sample_file', 'Download Sample File', NULL),
(621, 'customer_csv_upload', 'Customer Csv Upload', NULL),
(622, 'csv_supplier', 'Csv Upload Supplier', NULL),
(623, 'csv_upload_supplier', 'Csv Upload Supplier', NULL),
(624, 'previous', 'Previous', NULL),
(625, 'net_total', 'Net Total', NULL),
(626, 'currency_list', 'Currency List', NULL),
(627, 'currency_name', 'Currency Name', NULL),
(628, 'currency_icon', 'Currency Symbol', NULL),
(629, 'add_currency', 'Add Currency', NULL),
(630, 'role_permission', 'Role Permission', NULL),
(631, 'role_list', 'Role List', NULL),
(632, 'user_assign_role', 'User Assign Role', NULL),
(633, 'permission', 'Permission', NULL),
(634, 'add_role', 'Add Role', NULL),
(635, 'add_module', 'Add Module', NULL),
(636, 'module_name', 'Module Name', NULL),
(637, 'office_loan', 'Office Loan', NULL),
(638, 'add_menu', 'Add Menu', NULL),
(639, 'menu_name', 'Menu Name', NULL),
(640, 'sl_no', 'Sl No', NULL),
(641, 'create', 'Create', NULL),
(642, 'read', 'Read', NULL),
(643, 'role_name', 'Role Name', NULL),
(644, 'qty', 'Quantity', NULL),
(645, 'max_rate', 'Max Rate', NULL),
(646, 'min_rate', 'Min Rate', NULL),
(647, 'avg_rate', 'Average Rate', NULL),
(648, 'role_permission_added_successfully', 'Role Permission Successfully Added', NULL),
(649, 'update_successfully', 'Updated Successfully', NULL),
(650, 'role_permission_updated_successfully', 'Role Permission Successfully Updated ', NULL),
(651, 'shipping_cost', 'Shipping Cost', NULL),
(652, 'in_word', 'In Word ', NULL),
(653, 'shipping_cost_report', 'Shipping Cost Report', NULL),
(654, 'cash_book_report', 'Cash Book Report', NULL),
(655, 'inventory_ledger_report', 'Inventory Ledger Report', NULL),
(656, 'trial_balance_with_opening_as_on', 'Trial Balance With Opening As On', NULL),
(657, 'type', 'Type', NULL),
(658, 'taka_only', 'Taka Only', NULL),
(659, 'item_description', 'Desc', NULL),
(660, 'sold_by', 'Sold By', NULL),
(661, 'user_wise_sales_report', 'User Wise Sales Report', NULL),
(662, 'user_name', 'User Name', NULL),
(663, 'total_sold', 'Total Sold', NULL),
(664, 'user_wise_sale_report', 'User Wise Sales Report', NULL),
(665, 'barcode_or_qrcode', 'Barcode/QR-code', NULL),
(666, 'category_csv_upload', 'Category Csv  Upload', NULL),
(667, 'unit_csv_upload', 'Unit Csv Upload', NULL),
(668, 'invoice_return_list', 'Sales Return list', NULL),
(669, 'invoice_return', 'Sales Return', NULL),
(670, 'tax_report', 'TAX Report', NULL),
(671, 'select_tax', 'Select TAX', NULL),
(672, 'hrm', 'HRM', NULL),
(673, 'employee', 'Employee', NULL),
(674, 'add_employee', 'Add Employee', NULL),
(675, 'manage_employee', 'Manage Employee', NULL),
(676, 'attendance', 'Attendance', NULL),
(677, 'add_attendance', 'Attendance', NULL),
(678, 'manage_attendance', 'Manage Attendance', NULL),
(679, 'payroll', 'Payroll', NULL),
(680, 'add_payroll', 'Payroll', NULL),
(681, 'manage_payroll', 'Manage Payroll', NULL),
(682, 'employee_type', 'Employee Type', NULL),
(683, 'employee_designation', 'Employee Designation', NULL),
(684, 'designation', 'Designation', NULL),
(685, 'add_designation', 'Add Designation', NULL),
(686, 'manage_designation', 'Manage Designation', NULL),
(687, 'designation_update_form', 'Designation Update form', NULL),
(688, 'picture', 'Picture', NULL),
(689, 'country', 'Country', NULL),
(690, 'blood_group', 'Blood Group', NULL),
(691, 'address_line_1', 'Address Line 1', NULL),
(692, 'address_line_2', 'Address Line 2', NULL),
(693, 'zip', 'Zip code', NULL),
(694, 'city', 'City', NULL),
(695, 'hour_rate_or_salary', 'Houre Rate/Salary', NULL),
(696, 'rate_type', 'Rate Type', NULL),
(697, 'hourly', 'Hourly', NULL),
(698, 'salary', 'Salary', NULL),
(699, 'employee_update', 'Employee Update', NULL),
(700, 'checkin', 'Check In', NULL),
(701, 'employee_name', 'Employee Name', NULL),
(702, 'checkout', 'Check Out', NULL),
(703, 'confirm_clock', 'Confirm Clock', NULL),
(704, 'stay', 'Stay Time', NULL),
(705, 'sign_in', 'Sign In', NULL),
(706, 'check_in', 'Check In', NULL),
(707, 'single_checkin', 'Single Check In', NULL),
(708, 'bulk_checkin', 'Bulk Check In', NULL),
(709, 'successfully_checkout', 'Successfully Checkout', NULL),
(710, 'attendance_report', 'Attendance Report', NULL),
(711, 'datewise_report', 'Date Wise Report', NULL),
(712, 'employee_wise_report', 'Employee Wise Report', NULL),
(713, 'date_in_time_report', 'Date In Time Report', NULL),
(714, 'request', 'Request', NULL),
(715, 'sign_out', 'Sign Out', NULL),
(716, 'work_hour', 'Work Hours', NULL),
(717, 's_time', 'Start Time', NULL),
(718, 'e_time', 'In Time', NULL),
(719, 'salary_benefits_type', 'Benefits Type', NULL),
(720, 'salary_benefits', 'Salary Benefits', NULL),
(721, 'beneficial_list', 'Benefit List', NULL),
(722, 'add_beneficial', 'Add Benefits', NULL),
(723, 'add_benefits', 'Add Benefits', NULL),
(724, 'benefits_list', 'Benefit List', NULL),
(725, 'benefit_type', 'Benefit Type', NULL),
(726, 'benefits', 'Benefit', NULL),
(727, 'manage_benefits', 'Manage Benefits', NULL),
(728, 'deduct', 'Deduct', NULL),
(729, 'add', 'Add', NULL),
(730, 'add_salary_setup', 'Add Salary Setup', NULL),
(731, 'manage_salary_setup', 'Manage Salary Setup', NULL),
(732, 'basic', 'Basic', NULL),
(733, 'salary_type', 'Salary Type', NULL),
(734, 'addition', 'Addition', NULL),
(735, 'gross_salary', 'Gross Salary', NULL),
(736, 'set', 'Set', NULL),
(737, 'salary_generate', 'Salary Generate', NULL),
(738, 'manage_salary_generate', 'Manage Salary Generate', NULL),
(739, 'sal_name', 'Salary Name', NULL),
(740, 'gdate', 'Generated Date', NULL),
(741, 'generate_by', 'Generated By', NULL),
(742, 'the_salary_of', 'The Salary of ', NULL),
(743, 'already_generated', ' Already Generated', NULL),
(744, 'salary_month', 'Salary Month', NULL),
(745, 'successfully_generated', 'Successfully Generated', NULL),
(746, 'salary_payment', 'Salary Payment', NULL),
(747, 'employee_salary_payment', 'Employee Salary Payment', NULL),
(748, 'total_salary', 'Total Salary', NULL),
(749, 'total_working_minutes', 'Total Working Hours', NULL),
(750, 'working_period', 'Working Period', NULL),
(751, 'paid_by', 'Paid By', NULL),
(752, 'pay_now', 'Pay Now ', NULL),
(753, 'confirm', 'Confirm', NULL),
(754, 'successfully_paid', 'Successfully Paid', NULL),
(755, 'add_incometax', 'Add Income TAX', NULL),
(756, 'setup_tax', 'Setup TAX', NULL),
(757, 'start_amount', 'Start Amount', NULL),
(758, 'end_amount', 'End Amount', NULL),
(759, 'tax_rate', 'TAX Rate', NULL),
(760, 'setup', 'Setup', NULL),
(761, 'manage_income_tax', 'Manage Income TAX', NULL),
(762, 'income_tax_updateform', 'Income TAX Update form', NULL),
(763, 'positional_information', 'Positional Information', NULL),
(764, 'personal_information', 'Personal Information', NULL),
(765, 'timezone', 'Time Zone', NULL),
(766, 'sms', 'SMS', NULL),
(767, 'sms_configure', 'SMS Configure', NULL),
(768, 'url', 'URL', NULL),
(769, 'sender_id', 'Sender ID', NULL),
(770, 'api_key', 'Api Key', NULL),
(771, 'gui_pos', 'GUI POS', NULL),
(772, 'manage_service', 'Manage Service', NULL),
(773, 'service', 'Service', NULL),
(774, 'add_service', 'Add Service', NULL),
(775, 'service_edit', 'Service Edit', NULL),
(776, 'service_csv_upload', 'Service CSV Upload', NULL),
(777, 'service_name', 'Service Name', NULL),
(778, 'charge', 'Charge', NULL),
(779, 'service_invoice', 'Service Invoice', NULL),
(780, 'service_discount', 'Service Discount', NULL),
(781, 'hanging_over', 'ETD', NULL),
(782, 'service_details', 'Service Details', NULL),
(783, 'tax_settings', 'TAX Settings', NULL),
(784, 'default_value', 'Default Value', NULL),
(785, 'number_of_tax', 'Number of TAX', NULL),
(786, 'please_select_employee', 'Please Select Employee', NULL),
(787, 'manage_service_invoice', 'Manage Service Invoice', NULL),
(788, 'update_service_invoice', 'Update Service Invoice', NULL),
(789, 'customer_wise_tax_report', 'Customer Wise TAX Report', NULL),
(790, 'service_id', 'Service Id', NULL),
(791, 'invoice_wise_tax_report', 'Invoice Wise TAX Report', NULL),
(792, 'reg_no', 'Reg No', NULL),
(793, 'update_now', 'Update Now', NULL),
(794, 'import', 'Import', NULL),
(795, 'add_expense_item', 'Add Expense Item', NULL),
(796, 'manage_expense_item', 'Manage Expense Item', NULL),
(797, 'add_expense', 'Add Expense', NULL),
(798, 'manage_expense', 'Manage Expense', NULL),
(799, 'expense_statement', 'Expense Statement', NULL),
(800, 'expense_type', 'Expense Type', NULL),
(801, 'expense_item_name', 'Expense Item Name', NULL),
(802, 'stock_purchase_price', 'Stock Purchase Price', NULL),
(803, 'purchase_price', 'Purchase Price', NULL),
(804, 'customer_advance', 'Customer Advance', NULL),
(805, 'advance_type', 'Advance Type', NULL),
(806, 'restore', 'Restore', NULL),
(807, 'supplier_advance', 'Supplier Advance', NULL),
(808, 'please_input_correct_invoice_no', 'Please Input Correct Invoice NO', NULL),
(809, 'backup', 'Back Up', NULL),
(810, 'app_setting', 'App Settings', NULL),
(811, 'local_server_url', 'Local Server Url', NULL),
(812, 'online_server_url', 'Online Server Url', NULL),
(813, 'connet_url', 'Connected Hotspot Ip/url', NULL),
(814, 'update_your_app_setting', 'Update Your App Setting', NULL),
(815, 'select_category', 'Select Category', NULL),
(816, 'mini_invoice', 'Mini Invoice', NULL),
(817, 'purchase_details', 'Purchase Details', NULL),
(818, 'disc', 'Dis %', NULL),
(819, 'serial', 'Serial', NULL),
(820, 'transaction_head', 'Transaction Head', NULL),
(821, 'transaction_type', 'Transaction Type', NULL),
(822, 'return_details', 'Return Details', NULL),
(823, 'return_to_customer', 'Return To Customer', NULL),
(824, 'sales_and_purchase_report_summary', 'Sales And Purchase Report Summary', NULL),
(825, 'add_person_officeloan', 'Add Person (Office Loan)', NULL),
(826, 'add_loan_officeloan', 'Add Loan (Office Loan)', NULL),
(827, 'add_payment_officeloan', 'Add Payment (Office Loan)', NULL),
(828, 'manage_loan_officeloan', 'Manage Loan (Office Loan)', NULL),
(829, 'add_person_personalloan', 'Add Person (Personal Loan)', NULL),
(830, 'add_loan_personalloan', 'Add Loan (Personal Loan)', NULL),
(831, 'add_payment_personalloan', 'Add Payment (Personal Loan)', NULL),
(832, 'manage_loan_personalloan', 'Manage Loan (Personal)', NULL),
(833, 'hrm_management', 'Human Resource', NULL),
(834, 'cash_adjustment', 'Cash Adjustment', NULL),
(835, 'adjustment_type', 'Adjustment Type', NULL),
(836, 'change', 'Change', NULL),
(837, 'sale_by', 'Sale By', NULL),
(838, 'salary_date', 'Salary Date', NULL),
(839, 'earnings', 'Earnings', NULL),
(840, 'total_addition', 'Total Addition', NULL),
(841, 'total_deduction', 'Total Deduction', NULL),
(842, 'net_salary', 'Net Salary', NULL),
(843, 'ref_number', 'Reference Number', NULL),
(844, 'name_of_bank', 'Name Of Bank', NULL),
(845, 'salary_slip', 'Salary Slip', NULL),
(846, 'basic_salary', 'Basic Salary', NULL),
(847, 'return_from_customer', 'Return From Customer', NULL),
(848, 'quotation', 'Quotation', NULL),
(849, 'add_quotation', 'Add Quotation', NULL),
(850, 'manage_quotation', 'Manage Quotation', NULL),
(851, 'terms', 'Terms', NULL),
(852, 'send_to_customer', 'Sent To Customer', NULL),
(853, 'quotation_no', 'Quotation No', NULL),
(854, 'quotation_date', 'Quotation Date', NULL),
(855, 'total_service_tax', 'Total Service TAX', NULL),
(856, 'totalservicedicount', 'Total Service Discount', NULL),
(857, 'item_total', 'Item Total', NULL),
(858, 'service_total', 'Service Total', NULL),
(859, 'quot_description', 'Quotation Description', NULL),
(860, 'sub_total', 'Sub Total', NULL),
(861, 'mail_setting', 'Mail Setting', NULL),
(862, 'mail_configuration', 'Mail Configuration', NULL),
(863, 'mail', 'Mail', NULL),
(864, 'protocol', 'Protocol', NULL),
(865, 'smtp_host', 'SMTP Host', NULL),
(866, 'smtp_port', 'SMTP Port', NULL),
(867, 'sender_mail', 'Sender Mail', NULL),
(868, 'mail_type', 'Mail Type', NULL),
(869, 'html', 'HTML', NULL),
(870, 'text', 'TEXT', NULL),
(871, 'expiry_date', 'Expiry Date', NULL),
(872, 'api_secret', 'Api Secret', NULL),
(873, 'please_config_your_mail_setting', NULL, NULL),
(874, 'quotation_successfully_added', 'Quotation Successfully Added', NULL),
(875, 'add_to_invoice', 'Add To Invoice', NULL),
(876, 'added_to_invoice', 'Added To Invoice', NULL),
(877, 'closing_balance', 'Closing Balance', NULL),
(878, 'contact', 'Contact', NULL),
(879, 'fax', 'Fax', NULL),
(880, 'state', 'State', NULL),
(881, 'discounts', 'Discount', NULL),
(882, 'address1', 'Address1', NULL),
(883, 'address2', 'Address2', NULL),
(884, 'receive', 'Receive', NULL),
(885, 'purchase_history', 'Purchase History', NULL),
(886, 'cash_payment', 'Cash Payment', NULL),
(887, 'bank_payment', 'Bank Payment', NULL),
(888, 'do_you_want_to_print', 'Do You Want to Print', NULL),
(889, 'yes', 'Yes', NULL),
(890, 'no', 'No', NULL),
(891, 'todays_sale', 'Today\'s Sales', NULL),
(892, 'or', 'OR', NULL),
(893, 'no_result_found', 'No Result Found', NULL),
(894, 'add_service_quotation', 'Add Service Quotation', NULL),
(895, 'add_to_invoice', 'Add To Invoice', NULL),
(896, 'item_quotation', 'Item Quotation', NULL),
(897, 'service_quotation', 'Service Quotation', NULL),
(898, 'return_from', 'Return Form', NULL),
(899, 'customer_return_list', 'Customer Return List', NULL),
(900, 'pdf', 'Pdf', NULL),
(901, 'note', 'Note', NULL),
(902, 'update_debit_voucher', 'Update Debit Voucher', NULL),
(903, 'update_credit_voucher', 'Update Credit voucher', NULL),
(904, 'on', 'On', NULL),
(905, '', '', NULL),
(906, 'total_expenses', 'Total Expense', NULL),
(907, 'already_exist', 'Already Exist', NULL),
(908, 'checked_out', 'Checked Out', NULL),
(909, 'update_salary_setup', 'Update Salary Setup', NULL),
(910, 'employee_signature', 'Employee Signature', NULL),
(911, 'payslip', 'Payslip', NULL),
(912, 'exsisting_role', 'Existing Role', NULL),
(913, 'filter', 'Filter', NULL),
(914, 'testinput', NULL, NULL),
(915, 'update_quotation', 'Update Quotation', NULL),
(916, 'quotation_successfully_updated', 'Quotation Successfully Updated', NULL),
(917, 'successfully_approved', 'Successfully Approved', NULL),
(918, 'expiry', 'Expiry', NULL),
(919, 'user_list', 'User List', NULL),
(920, 'assign_roleto_user', 'Assign Role To User', NULL),
(921, 'assign_role_list', 'Assigned Role List', NULL),
(922, 'application_settings', 'Application Settings', NULL),
(923, 'company_list', 'Company List', NULL),
(924, 'edit_company', 'Edit Company', NULL),
(925, 'edit_user', 'Edit User', NULL),
(926, 'edit_currency', 'Edit Currency', NULL),
(927, 'mobile_no', 'Mobile No', NULL),
(928, 'email_address', 'Email Address', NULL),
(929, 'customer_list', 'Customer List', NULL),
(930, 'advance_receipt', 'Advance Receipt', NULL),
(931, 'supplier_list', 'Supplier List', NULL),
(932, 'category_list', 'Category List', NULL),
(933, 'no_record_found', 'No Record Found', NULL),
(934, 'unit_list', 'Unit List', NULL),
(935, 'edit_product', 'Edit Product', NULL),
(936, 'payable_summary', 'Payable Summary', NULL),
(937, 'pad_print', 'Pad Print', NULL),
(938, 'pos_print', 'POS Print', NULL),
(939, 'pos_invoice', 'POS Invoice', NULL),
(940, 'employee_profile', 'Employee Profile', NULL),
(941, 'edit_beneficials', 'Edit Beneficials', NULL),
(942, 'edit_setup_update', 'Edit Salary Setup', NULL),
(943, 'add_office_loan', 'Add Office Loan', NULL),
(944, 'income_tax', 'Income TAX', NULL),
(945, 'quotation_to_sale', 'Quotation To Sale', NULL),
(946, 'quotation_edit', 'Edit Quotation', NULL),
(947, 'edit_profile', 'Edit Profile', NULL),
(948, 'edit_supplier', 'Edit Supplier', NULL),
(949, 'edit_bank', 'Edit Bank', NULL),
(950, 'balance_sheet', 'Balance Sheet', NULL),
(951, 'salary_setup', 'Salary Setup', NULL),
(952, 'account_head', 'Account Head', NULL),
(953, 'add_invoice', 'Add Invoice', NULL),
(954, 'general_ledger_report', 'General Ledger Report', NULL),
(955, 'print_setting', 'Print Setting', NULL),
(956, 'header', 'Header', NULL),
(957, 'footer', 'Footer', NULL),
(958, 'supplier_payment_receipt', 'Payment Receipt', NULL),
(959, 'welcome_back', 'Welcome Back', NULL),
(960, 'overwrite', 'Over Write', NULL),
(961, 'module', 'Module', NULL),
(962, 'purchase_key', 'Purchase Key', NULL),
(963, 'buy_now', 'Buy Now', NULL),
(964, 'module_list', 'Module List', NULL),
(965, 'modules', 'Modules', NULL),
(966, 'install', 'Install', NULL),
(967, 'uninstall', 'Uninstall', NULL),
(968, 'module_added_successfully', 'Module Added Successfully', NULL),
(969, 'no_tables_are_registered_in_config', 'No table registered in config', NULL),
(970, 'tables_are_not_available_in_database', 'Table Are not Available in Database', NULL),
(971, 'addon', 'Add-ons', NULL),
(972, 'generate_qr', 'Generate QR', NULL),
(973, 'latestv', 'Latest Version', NULL),
(974, 'Current Version', NULL, NULL),
(976, 'notesupdate', 'Note: If you want to update software,you Must have immediate previous version', NULL),
(977, 'arabic', NULL, NULL),
(978, 'vat_no', 'VAT NO', NULL),
(979, 'new_p_method', 'Add New Payment Method', NULL),
(980, 'dis_val', 'Dis. Amount', NULL),
(981, 'vat_val', 'VAT Value', NULL),
(982, 'ttl_val', 'Total VAT', NULL),
(983, 'purchase_discount', 'Purchase Discount', NULL),
(984, 'order_time', 'Order Time', NULL),
(985, 'order_by', 'Order By', NULL),
(986, 'terms_list', 'Sales Terms List', NULL),
(987, 'terms_add', 'Add Sales Terms', NULL),
(988, 'term_condi', 'Terms & Condition', NULL),
(989, 'terms_update', 'Update Seles Terms', NULL),
(990, 'add_payment_method', 'Add Payment Method', NULL),
(991, 'payment_method_list', 'Payment Method List', NULL),
(992, 'payment_method_name', 'Payment Method Name', NULL),
(993, 'batch_no', 'Batch No', NULL),
(994, 'total_with_vat', 'Total With VAT', NULL),
(995, 'invoice_time', 'Invoice Time', NULL),
(996, 'product_vat', 'Product VAT', NULL),
(997, 'service_vat', 'Service VAT', NULL),
(998, 'cr_no', 'CR NO', NULL),
(999, 'service_payment', 'Service Payment', NULL),
(1000, 'vat_tax_setting', 'VAT & TAX Setting', NULL),
(1001, 'qty2', 'Qty', NULL),
(1002, 'batch', 'Batch', NULL),
(1003, 'disc', 'Disc', NULL),
(1004, 'tot_price', 'Tot Price', NULL),
(1005, 'tot_before_dis', 'Total Before Discount', NULL),
(1006, 'tot_with_dis', 'Total with Discount', NULL),
(1007, 'tax_vat', 'TAX Value', NULL),
(1008, 'return_receipt_text', 'Please keep the receipt and bring it in case of return', NULL),
(1009, 'invoice_qr_code', 'Invoice Qr-Code', NULL),
(1010, 'sales_due', 'Today Sales Due', NULL),
(1011, 'purchase_due', 'Today Purchase Due', NULL),
(1012, 'delivery_note', 'Delivery Note', NULL),
(1013, 'financial_year', 'Financial Year', NULL),
(1014, 'close_financial_year', 'Close Financial Year', NULL),
(1015, 'create_financial_year', 'Create Financial Year', NULL),
(1016, 'year_closing', 'Year Closing', NULL),
(1017, 'financial_year_start_date', 'Financial Year Start', NULL),
(1018, 'financial_year_end_date', 'Financial Year End', NULL),
(1019, 'subaccount_list', 'Sub Account List', NULL),
(1020, 'subaccount_add', 'Sub Account Add', NULL),
(1021, 'subtype', 'Sub Type', NULL),
(1022, 'predefined_accounts', 'Predefined Accounts', NULL),
(1023, 'create_debit_voucher', 'Create Debit Voucher', NULL),
(1024, 'ledger_comment', 'Ledger Comment', NULL),
(1025, 'reverseHead', 'Reverse Account Name', NULL),
(1026, 'VNo', 'VNo', NULL),
(1027, 'ledgerComment', '	Ledger Comment', NULL),
(1028, 'create_credit_voucher', 'Create Credit Voucher', NULL),
(1029, 'create_contra_voucher', 'Create Contra Voucher', NULL),
(1030, 'create_journal_voucher', 'Create Journal Voucher', NULL),
(1031, 'reverse_account_head', 'Reverse Account Head', NULL),
(1032, 'bank_reconciliation', 'Bank Reconciliation', NULL),
(1033, 'day_book', 'Day Book', NULL),
(1034, 'sub_ledger', 'Sub Ledger', NULL),
(1035, 'income_statement_form', 'Income Statement', NULL),
(1036, 'year', 'Year', NULL),
(1037, 'expenditure_statement', 'Expenditure Statement', NULL),
(1038, 'profit_loss_report', 'Profit Loss', NULL),
(1039, 'fixedasset_schedule', 'Fixed Asset Schedule', NULL),
(1040, 'receipt_payment', 'Receipt & Payment', NULL),
(1041, 'cash_basis', 'Cash Basis', NULL),
(1042, 'accrual_basis', 'Accrual Basis', NULL),
(1043, 'bank_reconciliation_report', 'Bank Reconciliation Report', NULL),
(1044, 'salary_advance_view', 'Salary Advance', NULL),
(1045, 'add_salary_advance', 'Add Salary Advance', NULL),
(1046, 'manage_salary_advance', 'Manage Salary Advance', NULL),
(1047, 'release_amount', 'Release Amount', NULL),
(1048, 'create_date', 'Create Date', NULL),
(1049, 'employee_salary_generate', 'Salary Generate', NULL),
(1050, 'approved_date', 'Approved Date', NULL),
(1051, 'approved_by', 'Approved By', NULL),
(1052, 'salar_month', 'Salary Month', NULL),
(1053, 'employee_salary_chart', 'Employee Salary Chart', NULL),
(1054, 'post', 'Post', NULL),
(1055, 'employee_salary_payment_view', 'Manage Employee Salary', NULL),
(1056, 'pay_by', 'Pay By', NULL),
(1057, 'bank_book_report', 'Bank Book Report Of', NULL),
(1058, 'head_name', 'Head Name', NULL),
(1059, 'head_code', 'Head Code', NULL),
(1060, 'voucher', 'Voucher', NULL),
(1061, 'sub_ledger_of', 'Sub Ledger of', NULL),
(1062, 'fixed_assets_report', 'Fixed Assets Annual Report', NULL),
(1063, 'opening_balance_fixed_assets', 'Opening Balance of Fixed Assets', NULL),
(1064, 'additions', 'Additions', NULL),
(1065, 'closing_balance_fixed_assets', 'Closing Balance of Fixed Assets', NULL),
(1066, 'depreciation_rate', 'Depreciation Rate', NULL),
(1067, 'depreciation_value', 'Depreciation Value', NULL),
(1068, 'opening_balance_accumulated_depreciation', 'Opening Balance of Accumulated Depreciation', NULL),
(1069, 'closing_balance_accumulated_depreciation', 'Closing Balance of Accumulated Depreciation', NULL),
(1070, 'written_down_value', 'Written Down Value', NULL),
(1071, 'unapproved', 'Unapproved', NULL);
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES
(1072, 'check_no', 'Check No', NULL),
(1073, 'Total Liabilities Equity', 'total_liabilities_equity', NULL),
(1074, 'total_equity', 'Total Equity', NULL),
(1075, 'total_liabilities', 'Total Liabilities', NULL),
(1076, 'total_assets', 'Total Assets', NULL),
(1077, 'cashinhand', 'Cash In Hand', NULL),
(1078, 'cash_bank', 'Cash At Bank', NULL),
(1079, 'advance', 'Advance', NULL),
(1080, 'view_employee_payment', 'Employee Payment List', NULL),
(1081, 'ret_item', 'Returned Item', NULL),
(1082, 'replaced_item', 'Replaced Item', NULL),
(1083, 'adj_amount', 'Adjusted Amount', NULL),
(1084, 'is_autoapprove_v', 'Auto Approve Invoice Voucher', NULL),
(1085, 'cost_price', 'Cost Price', NULL),
(1086, 'chalan_no', 'Chalan No', NULL),
(1087, 'already_returned', 'This Invoice is Already Returned ', NULL),
(1088, 'warehouse', 'Warehouse', NULL),
(1089, 'edit_warehouse', 'Edit Warehouse', NULL),
(1090, 'warehouse_name', 'Warehouse Name', NULL),
(1091, 'warehouse_list', 'Warehouse List', NULL),
(1092, 'writer', 'Writer', NULL),
(1093, 'publication', 'Publication', NULL),
(1094, 'edit_writer', 'Edit Writer', NULL),
(1095, 'writer_name', 'Writer Name', NULL),
(1096, 'writer_list', 'Writer List', NULL),
(1097, 'publication_list', 'Publication List', NULL),
(1098, 'edit_publication', 'Edit Publication', NULL),
(1099, 'payment_method', 'Payment Method', NULL),
(1100, 'net_amount', 'Net Amount', NULL),
(1101, 'delivery_details', 'Delivery Details', NULL),
(1102, 'opening_stock', 'Opening Stock', NULL),
(1103, 'opening_quantity', 'Opening Quantity', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `module`
--

DROP TABLE IF EXISTS `module`;
CREATE TABLE IF NOT EXISTS `module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` text,
  `image` varchar(255) DEFAULT NULL,
  `directory` varchar(100) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `module`
--

INSERT INTO `module` (`id`, `name`, `description`, `image`, `directory`, `status`) VALUES
(1, 'invoice', NULL, NULL, NULL, 1),
(2, 'customer', NULL, NULL, NULL, 1),
(3, 'product', NULL, NULL, NULL, 1),
(4, 'supplier', NULL, NULL, NULL, 1),
(5, 'purchase', NULL, NULL, NULL, 1),
(6, 'stock', NULL, NULL, NULL, 1),
(7, 'return', NULL, NULL, NULL, 1),
(8, 'report', NULL, NULL, NULL, 1),
(9, 'accounts', NULL, NULL, NULL, 1),
(11, 'tax', NULL, NULL, NULL, 1),
(12, 'hrm_management', NULL, NULL, NULL, 1),
(13, 'service', NULL, NULL, NULL, 1),
(15, 'setting', NULL, NULL, NULL, 1),
(16, 'quotation', NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `module_purchase_key`
--

DROP TABLE IF EXISTS `module_purchase_key`;
CREATE TABLE IF NOT EXISTS `module_purchase_key` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identity` varchar(100) DEFAULT NULL,
  `purchase_key` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `opening_item_stock`
--

DROP TABLE IF EXISTS `opening_item_stock`;
CREATE TABLE IF NOT EXISTS `opening_item_stock` (
  `stock_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL COMMENT 'from product_information',
  `quantity` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL COMMENT 'from warehouse',
  PRIMARY KEY (`stock_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `opening_item_stock`
--

INSERT INTO `opening_item_stock` (`stock_id`, `product_id`, `quantity`, `warehouse_id`) VALUES
(2, 16737744, 30, 1),
(3, 62560353, 50, 1),
(8, 16737744, 54, 2),
(9, 62560353, 55, 2),
(10, 69488303, 90, 2);

-- --------------------------------------------------------

--
-- Table structure for table `payment_by_customer`
--

DROP TABLE IF EXISTS `payment_by_customer`;
CREATE TABLE IF NOT EXISTS `payment_by_customer` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL COMMENT 'from customer_information',
  `payment_method_id` int(11) NOT NULL COMMENT 'from payment_method',
  `amount` double(10,2) NOT NULL,
  `added_on` datetime NOT NULL,
  `added_by` int(11) NOT NULL COMMENT 'from user_login	',
  `warehouse_id` int(11) NOT NULL COMMENT 'from warehouse',
  PRIMARY KEY (`payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `payment_method`
--

DROP TABLE IF EXISTS `payment_method`;
CREATE TABLE IF NOT EXISTS `payment_method` (
  `payment_method_id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_method_name` varchar(155) NOT NULL,
  `account_number` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`payment_method_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payment_method`
--

INSERT INTO `payment_method` (`payment_method_id`, `payment_method_name`, `account_number`) VALUES
(1, 'Cash', ''),
(2, 'Rocket', '017273823742'),
(3, 'Dutch Bangla Bank', '17326243848');

-- --------------------------------------------------------

--
-- Table structure for table `payment_to_supplier`
--

DROP TABLE IF EXISTS `payment_to_supplier`;
CREATE TABLE IF NOT EXISTS `payment_to_supplier` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_id` int(11) NOT NULL COMMENT 'from supplier_information',
  `payment_method_id` int(11) NOT NULL COMMENT 'from payment_method',
  `amount` double(10,2) NOT NULL,
  `added_on` datetime NOT NULL,
  `added_by` int(11) NOT NULL COMMENT 'from user_login',
  `warehouse_id` int(11) NOT NULL COMMENT 'from warehouse',
  PRIMARY KEY (`payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `payroll_tax_setup`
--

DROP TABLE IF EXISTS `payroll_tax_setup`;
CREATE TABLE IF NOT EXISTS `payroll_tax_setup` (
  `tax_setup_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `start_amount` decimal(12,2) NOT NULL DEFAULT '0.00',
  `end_amount` decimal(12,2) NOT NULL DEFAULT '0.00',
  `rate` decimal(12,2) NOT NULL DEFAULT '0.00',
  `status` varchar(30) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`tax_setup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `personal_loan`
--

DROP TABLE IF EXISTS `personal_loan`;
CREATE TABLE IF NOT EXISTS `personal_loan` (
  `per_loan_id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_id` varchar(30) NOT NULL,
  `person_id` varchar(30) NOT NULL,
  `debit` decimal(12,2) DEFAULT '0.00',
  `credit` decimal(12,2) NOT NULL DEFAULT '0.00',
  `date` varchar(30) NOT NULL,
  `details` varchar(100) NOT NULL,
  `status` int(11) NOT NULL COMMENT '1=no paid,2=paid',
  PRIMARY KEY (`per_loan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `person_information`
--

DROP TABLE IF EXISTS `person_information`;
CREATE TABLE IF NOT EXISTS `person_information` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` varchar(50) NOT NULL,
  `person_name` varchar(50) NOT NULL,
  `person_phone` varchar(50) NOT NULL,
  `person_address` text NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `person_ledger`
--

DROP TABLE IF EXISTS `person_ledger`;
CREATE TABLE IF NOT EXISTS `person_ledger` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_id` varchar(50) NOT NULL,
  `person_id` varchar(50) NOT NULL,
  `date` varchar(50) NOT NULL,
  `debit` decimal(12,2) NOT NULL DEFAULT '0.00',
  `credit` decimal(12,2) NOT NULL DEFAULT '0.00',
  `details` text NOT NULL,
  `status` int(11) NOT NULL COMMENT '1=no paid,2=paid',
  PRIMARY KEY (`id`),
  KEY `person_id` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pesonal_loan_information`
--

DROP TABLE IF EXISTS `pesonal_loan_information`;
CREATE TABLE IF NOT EXISTS `pesonal_loan_information` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` varchar(50) NOT NULL,
  `person_name` varchar(50) NOT NULL,
  `person_phone` varchar(30) NOT NULL,
  `person_address` text NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `person_id` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `print_setting`
--

DROP TABLE IF EXISTS `print_setting`;
CREATE TABLE IF NOT EXISTS `print_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `header` int(11) NOT NULL,
  `footer` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `print_setting`
--

INSERT INTO `print_setting` (`id`, `header`, `footer`) VALUES
(1, 200, 100);

-- --------------------------------------------------------

--
-- Table structure for table `product_category`
--

DROP TABLE IF EXISTS `product_category`;
CREATE TABLE IF NOT EXISTS `product_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_category`
--

INSERT INTO `product_category` (`category_id`, `category_name`, `status`) VALUES
(1, 'ডিটেকটিভ, ইন্টেলিজেন্স ও সিক্রেট এজেন্সি', 1),
(2, 'ইসলামি বই: আত্ম-উন্নয়ন', 1),
(3, 'ইসলামি আদর্শ  ও মতবাদ', 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_information`
--

DROP TABLE IF EXISTS `product_information`;
CREATE TABLE IF NOT EXISTS `product_information` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` varchar(100) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `writer_id` int(11) DEFAULT NULL,
  `publication_id` int(11) DEFAULT NULL,
  `product_name` varchar(255) NOT NULL,
  `price` varchar(100) DEFAULT NULL,
  `supplier_price` double(10,2) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `unit` int(11) NOT NULL,
  `tax` float DEFAULT NULL COMMENT 'Tax in %',
  `serial_no` varchar(200) DEFAULT NULL,
  `product_vat` float DEFAULT NULL,
  `product_model` varchar(100) DEFAULT NULL,
  `product_details` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `added_on` datetime NOT NULL,
  `added_by` int(11) NOT NULL,
  `edited_on` datetime DEFAULT NULL,
  `edited_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_information`
--

INSERT INTO `product_information` (`id`, `product_id`, `category_id`, `writer_id`, `publication_id`, `product_name`, `price`, `supplier_price`, `supplier_id`, `unit`, `tax`, `serial_no`, `product_vat`, `product_model`, `product_details`, `image`, `status`, `added_on`, `added_by`, `edited_on`, `edited_by`) VALUES
(1, '19526545', 1, 1, 1, 'Book name 1', '140', 120.00, 1, 4, 0, NULL, NULL, NULL, 'details here', './my-assets/image/product/2022-10-24/6f2283ee36e71e2fde7492716b94b1a3.jpg', 1, '2022-10-24 06:41:38', 1, '2022-10-24 06:44:22', 1),
(2, '16737744', 2, 1, 1, 'Book name 2', '190', 140.00, 2, 4, 0, NULL, NULL, NULL, '', 'my-assets/image/product.png', 1, '2022-10-24 06:44:47', 1, NULL, NULL),
(3, '62560353', 2, 1, 1, 'Book name 3', '190', 130.00, 2, 4, 0, NULL, NULL, NULL, '', 'my-assets/image/product.png', 1, '2022-10-24 06:45:14', 1, NULL, NULL),
(4, '69488303', 2, 1, 1, 'Book name 4', '220', 190.00, 2, 3, 0, NULL, NULL, NULL, '', 'my-assets/image/product.png', 1, '2022-10-24 06:45:37', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_purchase`
--

DROP TABLE IF EXISTS `product_purchase`;
CREATE TABLE IF NOT EXISTS `product_purchase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_id` bigint(20) NOT NULL,
  `chalan_no` varchar(100) NOT NULL,
  `supplier_id` bigint(20) NOT NULL,
  `grand_total_amount` decimal(12,2) NOT NULL DEFAULT '0.00',
  `paid_amount` decimal(10,2) DEFAULT '0.00',
  `due_amount` decimal(10,2) DEFAULT '0.00',
  `total_discount` decimal(10,2) DEFAULT NULL,
  `invoice_discount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'sum of product discount',
  `total_vat_amnt` decimal(10,2) DEFAULT '0.00' COMMENT 'sum of product vat',
  `purchase_date` varchar(50) DEFAULT NULL,
  `purchase_details` text,
  `status` int(11) NOT NULL,
  `bank_id` varchar(30) DEFAULT NULL,
  `payment_method_id` int(11) NOT NULL,
  `is_credit` tinyint(4) DEFAULT NULL,
  `added_on` datetime NOT NULL,
  `added_by` int(11) NOT NULL,
  `edited_on` datetime DEFAULT NULL,
  `edited_by` int(11) DEFAULT NULL,
  `warehouse_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `purchase_id` (`purchase_id`),
  KEY `supplier_id` (`supplier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_purchase`
--

INSERT INTO `product_purchase` (`id`, `purchase_id`, `chalan_no`, `supplier_id`, `grand_total_amount`, `paid_amount`, `due_amount`, `total_discount`, `invoice_discount`, `total_vat_amnt`, `purchase_date`, `purchase_details`, `status`, `bank_id`, `payment_method_id`, `is_credit`, `added_on`, `added_by`, `edited_on`, `edited_by`, `warehouse_id`) VALUES
(1, 1, '2345643', 2, '37150.00', '37140.00', '10.00', NULL, '6350.00', '0.00', '2022-10-24', '', 1, NULL, 3, NULL, '2022-10-24 06:49:36', 1, '2022-10-24 10:01:59', 1, 1),
(2, 2, '29093092', 1, '24840.00', '24840.00', '0.00', NULL, '2760.00', '0.00', '2022-10-24', '', 1, NULL, 1, NULL, '2022-10-24 08:01:58', 1, NULL, NULL, 1),
(3, 3, '213122', 2, '13318.00', '13318.00', '0.00', NULL, '982.00', '0.00', '2022-10-24', '', 1, NULL, 2, NULL, '2022-10-24 10:51:40', 1, '2022-10-24 10:52:50', 1, 1),
(4, 4, '100092', 2, '57040.00', '57040.00', '0.00', NULL, '9660.00', '0.00', '2022-10-24', 'details', 1, NULL, 3, NULL, '2022-10-24 10:59:19', 1, '2022-10-24 11:00:04', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `product_purchase_details`
--

DROP TABLE IF EXISTS `product_purchase_details`;
CREATE TABLE IF NOT EXISTS `product_purchase_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_detail_id` varchar(100) NOT NULL,
  `purchase_id` bigint(20) DEFAULT NULL,
  `product_id` varchar(30) DEFAULT NULL,
  `quantity` decimal(10,2) DEFAULT NULL,
  `rate` decimal(10,2) DEFAULT NULL,
  `batch_id` varchar(30) DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `discount` float DEFAULT NULL COMMENT 'discount percentage',
  `discount_amnt` decimal(10,2) NOT NULL DEFAULT '0.00',
  `vat_amnt_per` decimal(10,2) DEFAULT '0.00',
  `vat_amnt` decimal(10,2) DEFAULT '0.00',
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purchase_id` (`purchase_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_purchase_details`
--

INSERT INTO `product_purchase_details` (`id`, `purchase_detail_id`, `purchase_id`, `product_id`, `quantity`, `rate`, `batch_id`, `expiry_date`, `total_amount`, `discount`, `discount_amnt`, `vat_amnt_per`, `vat_amnt`, `status`) VALUES
(4, 'X6QPQM4ZLWXL1IU', 2, '19526545', '230.00', '120.00', NULL, NULL, '24840.00', 10, '2760.00', '0.00', '0.00', 1),
(8, 'LKFVJUDXD2DHFRD', 1, '69488303', '50.00', '190.00', NULL, NULL, '7600.00', 20, '1900.00', '0.00', '0.00', 1),
(9, 'UB2J7N7J3OZ2H7N', 1, '16737744', '150.00', '140.00', NULL, NULL, '17850.00', 15, '3150.00', '0.00', '0.00', 1),
(10, 'WG8B45GJI4TIAFW', 1, '62560353', '100.00', '130.00', NULL, NULL, '11700.00', 10, '1300.00', '0.00', '0.00', 1),
(17, 'C3V4I6A2Q6STHL1', 3, '69488303', '40.00', '190.00', NULL, NULL, '6992.00', 8, '608.00', '0.00', '0.00', 1),
(18, 'MW2CR1EOVRPNNDY', 3, '62560353', '30.00', '130.00', NULL, NULL, '3666.00', 6, '234.00', '0.00', '0.00', 1),
(19, '1OVYFOOQ4ZC85J9', 3, '16737744', '20.00', '140.00', NULL, NULL, '2660.00', 5, '140.00', '0.00', '0.00', 1),
(22, '3ZXBLZC89UIBR3Z', 4, '16737744', '100.00', '140.00', NULL, NULL, '12600.00', 10, '1400.00', '0.00', '0.00', 1),
(23, 'RXQEILZOONAPS39', 4, '69488303', '120.00', '190.00', NULL, NULL, '20520.00', 10, '2280.00', '0.00', '0.00', 1),
(24, 'OCN2168QZ9LZ7NA', 4, '62560353', '230.00', '130.00', NULL, NULL, '23920.00', 20, '5980.00', '0.00', '0.00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_return`
--

DROP TABLE IF EXISTS `product_return`;
CREATE TABLE IF NOT EXISTS `product_return` (
  `return_id` varchar(30) CHARACTER SET latin1 NOT NULL,
  `product_id` varchar(20) CHARACTER SET latin1 NOT NULL,
  `invoice_id` varchar(20) CHARACTER SET latin1 NOT NULL,
  `purchase_id` varchar(30) CHARACTER SET latin1 DEFAULT NULL,
  `date_purchase` varchar(20) CHARACTER SET latin1 NOT NULL,
  `date_return` varchar(30) CHARACTER SET latin1 NOT NULL,
  `byy_qty` float NOT NULL,
  `ret_qty` float NOT NULL,
  `customer_id` varchar(20) CHARACTER SET latin1 NOT NULL,
  `supplier_id` varchar(30) CHARACTER SET latin1 NOT NULL,
  `product_rate` decimal(10,2) NOT NULL DEFAULT '0.00',
  `deduction` float NOT NULL,
  `total_deduct` decimal(10,2) NOT NULL DEFAULT '0.00',
  `total_tax` decimal(10,2) NOT NULL DEFAULT '0.00',
  `total_ret_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `net_total_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `reason` text CHARACTER SET latin1 NOT NULL,
  `usablity` int(11) NOT NULL,
  KEY `product_id` (`product_id`),
  KEY `invoice_id` (`invoice_id`),
  KEY `purchase_id` (`purchase_id`),
  KEY `customer_id` (`customer_id`),
  KEY `supplier_id` (`supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `product_service`
--

DROP TABLE IF EXISTS `product_service`;
CREATE TABLE IF NOT EXISTS `product_service` (
  `service_id` int(11) NOT NULL AUTO_INCREMENT,
  `service_name` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `charge` decimal(10,2) NOT NULL DEFAULT '0.00',
  `service_vat` float DEFAULT NULL,
  `is_fixed` int(11) NOT NULL DEFAULT '0',
  `is_dynamic` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `publication`
--

DROP TABLE IF EXISTS `publication`;
CREATE TABLE IF NOT EXISTS `publication` (
  `publication_id` int(11) NOT NULL AUTO_INCREMENT,
  `publication_name` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`publication_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `publication`
--

INSERT INTO `publication` (`publication_id`, `publication_name`, `status`) VALUES
(1, 'সমকালীন', 1),
(2, 'বাতিঘর', 1);

-- --------------------------------------------------------

--
-- Table structure for table `quotation`
--

DROP TABLE IF EXISTS `quotation`;
CREATE TABLE IF NOT EXISTS `quotation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quotation_id` varchar(30) NOT NULL,
  `quot_no` varchar(50) NOT NULL,
  `quot_description` text NOT NULL,
  `customer_id` varchar(30) NOT NULL,
  `quotdate` date NOT NULL,
  `expire_date` date DEFAULT NULL,
  `item_total_amount` decimal(12,2) NOT NULL,
  `item_total_dicount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `item_total_vat` double(10,2) NOT NULL DEFAULT '0.00',
  `item_total_tax` decimal(10,2) DEFAULT '0.00',
  `service_total_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `service_total_discount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `service_total_vat` double(10,2) NOT NULL DEFAULT '0.00',
  `service_total_tax` decimal(10,2) DEFAULT '0.00',
  `quot_dis_item` decimal(10,2) NOT NULL DEFAULT '0.00',
  `quot_dis_service` decimal(10,2) NOT NULL DEFAULT '0.00',
  `is_fixed` int(11) NOT NULL DEFAULT '0',
  `is_dynamic` int(11) NOT NULL DEFAULT '0',
  `create_by` varchar(30) NOT NULL,
  `create_date` date NOT NULL,
  `update_by` varchar(30) DEFAULT NULL,
  `update_date` date DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `cust_show` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `quot_no` (`quot_no`),
  KEY `quotation_id` (`quotation_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `quotation_service_used`
--

DROP TABLE IF EXISTS `quotation_service_used`;
CREATE TABLE IF NOT EXISTS `quotation_service_used` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quot_id` varchar(20) NOT NULL,
  `service_id` int(11) NOT NULL,
  `qty` decimal(10,2) NOT NULL DEFAULT '0.00',
  `charge` decimal(10,2) NOT NULL DEFAULT '0.00',
  `discount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `discount_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `vat_per` decimal(10,2) DEFAULT '0.00',
  `vat_amnt` decimal(10,2) DEFAULT '0.00',
  `tax` decimal(10,2) DEFAULT '0.00',
  `total` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `quot_id` (`quot_id`),
  KEY `service_id` (`service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `quotation_taxinfo`
--

DROP TABLE IF EXISTS `quotation_taxinfo`;
CREATE TABLE IF NOT EXISTS `quotation_taxinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `customer_id` int(11) NOT NULL,
  `relation_id` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `quot_products_used`
--

DROP TABLE IF EXISTS `quot_products_used`;
CREATE TABLE IF NOT EXISTS `quot_products_used` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quot_id` varchar(100) NOT NULL,
  `product_id` varchar(100) NOT NULL,
  `serial_no` varchar(30) DEFAULT NULL,
  `batch_id` varchar(10) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `used_qty` decimal(10,2) DEFAULT NULL,
  `rate` decimal(10,2) DEFAULT NULL,
  `supplier_rate` float DEFAULT NULL,
  `total_price` decimal(12,2) DEFAULT NULL,
  `discount` decimal(10,2) DEFAULT NULL,
  `discount_per` varchar(15) DEFAULT NULL,
  `vat_amnt` decimal(10,2) DEFAULT NULL,
  `vat_per` decimal(10,2) DEFAULT NULL,
  `tax` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `quot_id` (`quot_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `role_permission`
--

DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE IF NOT EXISTS `role_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_module_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `create` tinyint(1) DEFAULT NULL,
  `read` tinyint(1) DEFAULT NULL,
  `update` tinyint(1) DEFAULT NULL,
  `delete` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_module_id` (`fk_module_id`),
  KEY `fk_user_id` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=981 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `role_permission`
--

INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES
(873, 1, 1, 1, 1, 0, 0),
(874, 2, 1, 0, 1, 0, 0),
(875, 3, 1, 0, 1, 0, 0),
(876, 121, 1, 0, 0, 0, 0),
(877, 122, 1, 0, 0, 0, 0),
(878, 4, 1, 1, 1, 0, 0),
(879, 5, 1, 0, 1, 0, 0),
(880, 10, 1, 0, 0, 0, 0),
(881, 11, 1, 0, 0, 0, 0),
(882, 12, 1, 0, 0, 0, 0),
(883, 13, 1, 0, 0, 0, 0),
(884, 14, 1, 0, 0, 0, 0),
(885, 15, 1, 0, 0, 0, 0),
(886, 16, 1, 0, 0, 0, 0),
(887, 144, 1, 0, 0, 0, 0),
(888, 145, 1, 0, 0, 0, 0),
(889, 17, 1, 1, 1, 0, 0),
(890, 18, 1, 0, 1, 0, 0),
(891, 21, 1, 1, 1, 0, 0),
(892, 22, 1, 0, 1, 0, 0),
(893, 23, 1, 0, 1, 0, 0),
(894, 24, 1, 0, 0, 0, 0),
(895, 25, 1, 0, 0, 0, 0),
(896, 26, 1, 0, 0, 0, 0),
(897, 27, 1, 0, 0, 0, 0),
(898, 28, 1, 0, 0, 0, 0),
(899, 29, 1, 0, 0, 0, 0),
(900, 30, 1, 0, 0, 0, 0),
(901, 31, 1, 0, 0, 0, 0),
(902, 32, 1, 0, 0, 0, 0),
(903, 33, 1, 0, 0, 0, 0),
(904, 34, 1, 0, 0, 0, 0),
(905, 35, 1, 0, 0, 0, 0),
(906, 36, 1, 0, 0, 0, 0),
(907, 37, 1, 0, 0, 0, 0),
(908, 38, 1, 0, 0, 0, 0),
(909, 39, 1, 0, 0, 0, 0),
(910, 40, 1, 0, 0, 0, 0),
(911, 41, 1, 0, 0, 0, 0),
(912, 42, 1, 0, 0, 0, 0),
(913, 43, 1, 0, 0, 0, 0),
(914, 44, 1, 0, 0, 0, 0),
(915, 45, 1, 0, 0, 0, 0),
(916, 46, 1, 0, 0, 0, 0),
(917, 47, 1, 0, 0, 0, 0),
(918, 48, 1, 0, 0, 0, 0),
(919, 49, 1, 0, 0, 0, 0),
(920, 50, 1, 0, 0, 0, 0),
(921, 51, 1, 0, 0, 0, 0),
(922, 52, 1, 0, 0, 0, 0),
(923, 53, 1, 0, 0, 0, 0),
(924, 54, 1, 0, 0, 0, 0),
(925, 55, 1, 0, 0, 0, 0),
(926, 56, 1, 0, 0, 0, 0),
(927, 57, 1, 0, 0, 0, 0),
(928, 58, 1, 0, 0, 0, 0),
(929, 60, 1, 0, 0, 0, 0),
(930, 123, 1, 0, 0, 0, 0),
(931, 125, 1, 0, 0, 0, 0),
(932, 126, 1, 0, 0, 0, 0),
(933, 127, 1, 0, 0, 0, 0),
(934, 128, 1, 0, 0, 0, 0),
(935, 129, 1, 0, 0, 0, 0),
(936, 130, 1, 0, 0, 0, 0),
(937, 131, 1, 0, 0, 0, 0),
(938, 132, 1, 0, 0, 0, 0),
(939, 133, 1, 0, 0, 0, 0),
(940, 134, 1, 0, 0, 0, 0),
(941, 135, 1, 0, 0, 0, 0),
(942, 136, 1, 0, 0, 0, 0),
(943, 137, 1, 0, 0, 0, 0),
(944, 138, 1, 0, 0, 0, 0),
(945, 139, 1, 0, 0, 0, 0),
(946, 140, 1, 0, 0, 0, 0),
(947, 65, 1, 0, 0, 0, 0),
(948, 124, 1, 0, 0, 0, 0),
(949, 70, 1, 0, 0, 0, 0),
(950, 71, 1, 0, 0, 0, 0),
(951, 72, 1, 0, 0, 0, 0),
(952, 73, 1, 0, 0, 0, 0),
(953, 74, 1, 0, 0, 0, 0),
(954, 75, 1, 0, 0, 0, 0),
(955, 76, 1, 0, 0, 0, 0),
(956, 141, 1, 0, 0, 0, 0),
(957, 142, 1, 0, 0, 0, 0),
(958, 143, 1, 0, 0, 0, 0),
(959, 97, 1, 0, 0, 0, 0),
(960, 98, 1, 0, 0, 0, 0),
(961, 99, 1, 0, 0, 0, 0),
(962, 100, 1, 0, 0, 0, 0),
(963, 102, 1, 0, 0, 0, 0),
(964, 103, 1, 0, 0, 0, 0),
(965, 104, 1, 0, 0, 0, 0),
(966, 105, 1, 0, 0, 0, 0),
(967, 106, 1, 0, 0, 0, 0),
(968, 107, 1, 0, 0, 0, 0),
(969, 108, 1, 0, 0, 0, 0),
(970, 109, 1, 0, 0, 0, 0),
(971, 110, 1, 0, 0, 0, 0),
(972, 111, 1, 0, 0, 0, 0),
(973, 112, 1, 0, 0, 0, 0),
(974, 113, 1, 0, 0, 0, 0),
(975, 115, 1, 0, 0, 0, 0),
(976, 116, 1, 0, 0, 0, 0),
(977, 117, 1, 0, 0, 0, 0),
(978, 118, 1, 0, 0, 0, 0),
(979, 119, 1, 0, 0, 0, 0),
(980, 120, 1, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `salary_setup_header`
--

DROP TABLE IF EXISTS `salary_setup_header`;
CREATE TABLE IF NOT EXISTS `salary_setup_header` (
  `s_s_h_id` int(11) UNSIGNED NOT NULL,
  `employee_id` varchar(30) CHARACTER SET latin1 NOT NULL,
  `salary_payable` varchar(30) CHARACTER SET latin1 DEFAULT NULL,
  `absent_deduct` varchar(30) CHARACTER SET latin1 DEFAULT NULL,
  `tax_manager` varchar(30) CHARACTER SET latin1 NOT NULL,
  `status` varchar(30) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `salary_sheet_generate`
--

DROP TABLE IF EXISTS `salary_sheet_generate`;
CREATE TABLE IF NOT EXISTS `salary_sheet_generate` (
  `ssg_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET latin1 DEFAULT NULL,
  `gdate` varchar(30) DEFAULT NULL,
  `start_date` varchar(30) CHARACTER SET latin1 NOT NULL,
  `end_date` varchar(30) CHARACTER SET latin1 NOT NULL,
  `generate_by` varchar(30) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`ssg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `salary_type`
--

DROP TABLE IF EXISTS `salary_type`;
CREATE TABLE IF NOT EXISTS `salary_type` (
  `salary_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `sal_name` varchar(100) NOT NULL,
  `salary_type` varchar(50) NOT NULL,
  `status` varchar(30) NOT NULL,
  `emp_sal_type` varchar(50) DEFAULT NULL,
  `default_amount` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`salary_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sec_role`
--

DROP TABLE IF EXISTS `sec_role`;
CREATE TABLE IF NOT EXISTS `sec_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(100) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sec_role`
--

INSERT INTO `sec_role` (`id`, `type`) VALUES
(1, 'Store Manager');

-- --------------------------------------------------------

--
-- Table structure for table `sec_userrole`
--

DROP TABLE IF EXISTS `sec_userrole`;
CREATE TABLE IF NOT EXISTS `sec_userrole` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `roleid` int(11) NOT NULL,
  `createby` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `createdate` datetime NOT NULL,
  UNIQUE KEY `ID` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sec_userrole`
--

INSERT INTO `sec_userrole` (`id`, `user_id`, `roleid`, `createby`, `createdate`) VALUES
(1, '615419', 1, '1', '2022-06-16 03:49:43'),
(2, '276843', 1, '1', '2022-10-25 04:11:27');

-- --------------------------------------------------------

--
-- Table structure for table `seles_termscondi`
--

DROP TABLE IF EXISTS `seles_termscondi`;
CREATE TABLE IF NOT EXISTS `seles_termscondi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` text NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `seles_termscondi`
--

INSERT INTO `seles_termscondi` (`id`, `description`, `status`) VALUES
(5, 'Goods purchased without the original invoice are not to be returned or exchanged', 1);

-- --------------------------------------------------------

--
-- Table structure for table `service_invoice`
--

DROP TABLE IF EXISTS `service_invoice`;
CREATE TABLE IF NOT EXISTS `service_invoice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `voucher_no` varchar(30) NOT NULL,
  `date` date NOT NULL,
  `employee_id` varchar(100) DEFAULT NULL,
  `customer_id` varchar(30) NOT NULL,
  `total_amount` decimal(20,2) NOT NULL DEFAULT '0.00',
  `total_discount` decimal(20,2) NOT NULL DEFAULT '0.00',
  `invoice_discount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `total_vat_amnt` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'total invoice vat',
  `total_tax` decimal(10,2) DEFAULT '0.00',
  `paid_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `due_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `shipping_cost` decimal(10,2) NOT NULL DEFAULT '0.00',
  `previous` decimal(10,2) NOT NULL DEFAULT '0.00',
  `details` varchar(250) NOT NULL,
  `sales_by` varchar(20) DEFAULT NULL,
  `is_fixed` int(11) NOT NULL DEFAULT '0',
  `is_dynamic` int(11) NOT NULL DEFAULT '0',
  `is_credit` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `service_invoice_details`
--

DROP TABLE IF EXISTS `service_invoice_details`;
CREATE TABLE IF NOT EXISTS `service_invoice_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` int(11) NOT NULL,
  `service_inv_id` varchar(30) NOT NULL,
  `qty` decimal(10,2) NOT NULL DEFAULT '0.00',
  `charge` decimal(10,2) NOT NULL DEFAULT '0.00',
  `discount` decimal(10,2) DEFAULT '0.00',
  `discount_amount` decimal(10,2) DEFAULT '0.00',
  `vat` decimal(10,2) DEFAULT '0.00',
  `vat_amnt` decimal(10,2) DEFAULT '0.00',
  `total` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `service_id` (`service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sms_settings`
--

DROP TABLE IF EXISTS `sms_settings`;
CREATE TABLE IF NOT EXISTS `sms_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `api_key` varchar(100) DEFAULT NULL,
  `api_secret` varchar(100) DEFAULT NULL,
  `from` varchar(100) DEFAULT NULL,
  `isinvoice` int(11) NOT NULL DEFAULT '0',
  `isservice` int(11) NOT NULL DEFAULT '0',
  `isreceive` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sms_settings`
--

INSERT INTO `sms_settings` (`id`, `api_key`, `api_secret`, `from`, `isinvoice`, `isservice`, `isreceive`) VALUES
(1, '5d6db102011', '456452dfgdf', '8801645452', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sub_module`
--

DROP TABLE IF EXISTS `sub_module`;
CREATE TABLE IF NOT EXISTS `sub_module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 NOT NULL,
  `description` text CHARACTER SET utf8,
  `image` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `directory` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sub_module`
--

INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES
(1, 1, 'new_invoice', NULL, NULL, 'new_invoice', 1),
(2, 1, 'manage_invoice', NULL, NULL, 'manage_invoice', 1),
(3, 1, 'pos_invoice', NULL, NULL, 'gui_pos', 1),
(4, 2, 'add_customer', NULL, NULL, 'add_customer', 1),
(5, 2, 'manage_customer', NULL, NULL, 'manage_customer', 1),
(6, 0, 'credit_customer', NULL, NULL, 'credit_customer', 1),
(7, 0, 'paid_customer', NULL, NULL, 'paid_customer', 1),
(8, 0, 'customer_ledger', NULL, NULL, 'customer_ledger', 1),
(9, 0, 'customer_advance', NULL, NULL, 'customer_advance', 1),
(10, 3, 'category', NULL, NULL, 'category', 1),
(11, 3, 'manage_category', NULL, NULL, 'manage_category', 1),
(12, 3, 'unit', NULL, NULL, 'unit', 1),
(13, 3, 'manage_unit', NULL, NULL, 'manage_unit', 1),
(14, 3, 'add_product', NULL, NULL, 'create_product', 1),
(15, 3, 'import_product_csv', NULL, NULL, 'add_product_csv', 1),
(16, 3, 'manage_product', NULL, NULL, 'manage_product', 1),
(17, 4, 'add_supplier', NULL, NULL, 'add_supplier', 1),
(18, 4, 'manage_supplier', NULL, NULL, 'manage_supplier', 1),
(19, 0, 'supplier_ledger', NULL, NULL, 'supplier_ledger_report', 1),
(20, 0, 'supplier_advance', NULL, NULL, 'supplier_advance', 1),
(21, 5, 'add_purchase', NULL, NULL, 'add_purchase', 1),
(22, 5, 'manage_purchase', NULL, NULL, 'manage_purchase', 1),
(23, 6, 'stock_report', NULL, NULL, 'stock_report', 1),
(24, 7, 'return', NULL, NULL, 'add_return', 1),
(25, 7, 'stock_return_list', NULL, NULL, 'return_list', 1),
(26, 7, 'supplier_return_list', NULL, NULL, 'supplier_return_list', 1),
(27, 7, 'wastage_return_list', NULL, NULL, 'wastage_return_list', 1),
(28, 8, 'closing', NULL, NULL, 'add_closing', 1),
(29, 8, 'closing_report', NULL, NULL, 'closing_report', 1),
(30, 8, 'todays_report', NULL, NULL, 'all_report', 1),
(31, 8, 'todays_customer_receipt', NULL, NULL, 'todays_customer_receipt', 1),
(32, 8, 'sales_report', NULL, NULL, 'todays_sales_report', 1),
(33, 8, 'due_report', NULL, NULL, 'due_report', 1),
(34, 8, 'purchase_report', NULL, NULL, 'todays_purchase_report', 1),
(35, 8, 'purchase_report_category_wise', NULL, NULL, 'purchase_report_category_wise', 1),
(36, 8, 'sales_report_product_wise', NULL, NULL, 'product_sales_reports_date_wise', 1),
(37, 8, 'sales_report_category_wise', NULL, NULL, 'sales_report_category_wise', 1),
(38, 8, 'shipping_cost_report', NULL, NULL, 'shipping_cost_report', 1),
(39, 8, 'user_wise_sales_report', NULL, NULL, 'user_wise_sales_report', 1),
(40, 8, 'invoice_return', NULL, NULL, 'invoice_return', 1),
(41, 8, 'supplier_return', NULL, NULL, 'supplier_return', 1),
(42, 8, 'tax_report', NULL, NULL, 'tax_report', 1),
(43, 8, 'profit_report', NULL, NULL, 'profit_report', 1),
(44, 9, 'c_o_a', NULL, NULL, 'show_tree', 1),
(45, 9, 'subaccount_list', NULL, NULL, 'subaccount_list', 1),
(46, 9, 'predefined_accounts', NULL, NULL, 'predefined_accounts', 1),
(47, 9, 'financial_year', NULL, NULL, 'financial_year', 1),
(48, 9, 'opening_balance', NULL, NULL, 'opening_balance', 1),
(49, 9, 'credit_voucher', NULL, NULL, 'credit_voucher', 1),
(50, 9, 'voucher_approval', NULL, NULL, 'aprove_v', 1),
(51, 9, 'contra_voucher', NULL, NULL, 'contra_voucher', 1),
(52, 9, 'journal_voucher', NULL, NULL, 'journal_voucher', 1),
(53, 9, 'report', NULL, NULL, 'ac_report', 1),
(54, 9, 'cash_book', NULL, NULL, 'cash_book', 1),
(55, 9, 'Inventory_ledger', NULL, NULL, 'inventory_ledger', 1),
(56, 9, 'bank_book', NULL, NULL, 'bank_book', 1),
(57, 9, 'general_ledger', NULL, NULL, 'general_ledger', 1),
(58, 9, 'trial_balance', NULL, NULL, 'trial_balance', 1),
(60, 9, 'coa_print', NULL, NULL, 'coa_print', 1),
(61, 0, 'add_new_bank', NULL, NULL, 'add_bank', 1),
(62, 0, 'manage_bank', NULL, NULL, 'bank_list', 1),
(63, 0, 'bank_transaction', NULL, NULL, 'bank_transaction', 1),
(64, 0, 'bank_ledger', NULL, NULL, 'bank_ledger', 1),
(65, 11, 'tax_settings', NULL, NULL, 'tax_settings', 1),
(66, 0, 'add_incometax', NULL, NULL, 'add_incometax', 1),
(67, 0, 'manage_income_tax', NULL, NULL, 'manage_income_tax', 1),
(68, 0, 'tax_report', NULL, NULL, 'tax_report', 1),
(69, 0, 'invoice_wise_tax_report', NULL, NULL, 'invoice_wise_tax_report', 1),
(70, 12, 'add_designation', NULL, NULL, 'add_designation', 1),
(71, 12, 'manage_designation', NULL, NULL, 'manage_designation', 1),
(72, 12, 'add_employee', NULL, NULL, 'add_employee', 1),
(73, 12, 'manage_employee', NULL, NULL, 'manage_employee', 1),
(74, 12, 'add_attendance', NULL, NULL, 'add_attendance', 1),
(75, 12, 'manage_attendance', NULL, NULL, 'manage_attendance', 1),
(76, 12, 'attendance_report', NULL, NULL, 'attendance_report', 1),
(77, 0, 'add_benefits', NULL, NULL, 'add_benefits', 1),
(78, 0, 'manage_benefits', NULL, NULL, 'manage_benefits', 1),
(79, 0, 'add_salary_setup', NULL, NULL, 'add_salary_setup', 1),
(80, 0, 'manage_salary_setup', NULL, NULL, 'manage_salary_setup', 1),
(81, 0, 'salary_generate', NULL, NULL, 'salary_generate', 1),
(82, 0, 'manage_salary_generate', NULL, NULL, 'manage_salary_generate', 1),
(83, 0, 'salary_payment', NULL, NULL, 'salary_payment', 1),
(84, 0, 'add_expense_item', NULL, NULL, 'add_expense_item', 1),
(85, 0, 'manage_expense_item', NULL, NULL, 'manage_expense_item', 1),
(86, 0, 'add_expense', NULL, NULL, 'add_expense', 1),
(87, 0, 'manage_expense', NULL, NULL, 'manage_expense', 1),
(88, 0, 'expense_statement', NULL, NULL, 'expense_statement', 1),
(89, 0, 'add_person_officeloan', NULL, NULL, 'add1_person', 1),
(90, 0, 'add_loan_officeloan', NULL, NULL, 'add_office_loan', 1),
(91, 0, 'add_payment_officeloan', NULL, NULL, 'add_loan_payment', 1),
(92, 0, 'manage_loan_officeloan', NULL, NULL, 'manage1_person', 1),
(93, 0, 'add_person_personalloan', NULL, NULL, 'add_person', 1),
(94, 0, 'add_loan_personalloan', NULL, NULL, 'add_loan', 1),
(95, 0, 'add_payment_personalloan', NULL, NULL, 'add_payment', 1),
(96, 0, 'manage_loan_personalloan', NULL, NULL, 'manage_person', 1),
(97, 13, 'add_service', NULL, NULL, 'create_service', 1),
(98, 13, 'manage_service', NULL, NULL, 'manage_service', 1),
(99, 13, 'service_invoice', NULL, NULL, 'service_invoice', 1),
(100, 13, 'manage_service_invoice', NULL, NULL, 'manage_service_invoice', 1),
(102, 15, 'manage_company', NULL, NULL, 'manage_company', 1),
(103, 15, 'add_user', NULL, NULL, 'add_user', 1),
(104, 15, 'manage_users', NULL, NULL, 'manage_user', 1),
(105, 15, 'language', NULL, NULL, 'add_language', 1),
(106, 15, 'currency', NULL, NULL, 'add_currency', 1),
(107, 15, 'setting', NULL, NULL, 'soft_setting', 1),
(108, 15, 'print_setting', NULL, NULL, 'print_setting', 1),
(109, 15, 'mail_setting', NULL, NULL, 'mail_setting', 1),
(110, 15, 'add_role', NULL, NULL, 'add_role', 1),
(111, 15, 'role_list', NULL, NULL, 'role_list', 1),
(112, 15, 'user_assign_role', NULL, NULL, 'user_assign', 1),
(113, 15, 'Permission', NULL, NULL, NULL, 1),
(114, 0, 'sms_configure', NULL, NULL, 'sms_configure', 1),
(115, 15, 'backup_restore', NULL, NULL, 'back_up', 1),
(116, 15, 'import', NULL, NULL, 'sql_import', 1),
(117, 15, 'restore', NULL, NULL, 'restore', 1),
(118, 16, 'add_quotation', NULL, NULL, 'add_quotation', 1),
(119, 16, 'manage_quotation', NULL, NULL, 'manage_quotation', 1),
(120, 16, 'add_to_invoice', NULL, NULL, 'add_to_invoice', 1),
(121, 1, 'terms_list', NULL, NULL, 'terms_list', 1),
(122, 1, 'terms_add', NULL, NULL, 'terms_add', 1),
(123, 9, 'service_payment', NULL, NULL, 'service_payment', 1),
(124, 11, 'vat_tax_setting', NULL, NULL, 'vat_tax_setting', 1),
(125, 9, 'add_payment_method', NULL, NULL, 'add_payment_method', 1),
(126, 9, 'payment_method_list', NULL, NULL, 'payment_method_list', 1),
(127, 9, 'debit_voucher', NULL, NULL, 'debit_voucher', 1),
(128, 9, 'bank_reconciliation', NULL, NULL, 'bank_reconciliation', 1),
(129, 9, 'supplier_payment', NULL, NULL, 'supplier_payment', 1),
(130, 9, 'customer_receive', NULL, NULL, 'customer_receive', 1),
(131, 9, 'cash_adjustment', NULL, NULL, 'cash_adjustment', 1),
(132, 9, 'day_book', NULL, NULL, 'day_book', 1),
(133, 9, 'sub_ledger', NULL, NULL, 'sub_ledger', 1),
(134, 9, 'income_statement_form', NULL, NULL, 'income_statement_form', 1),
(135, 9, 'expenditure_statement', NULL, NULL, 'expenditure_statement', 1),
(136, 9, 'profit_loss_report', NULL, NULL, 'profit_loss_report', 1),
(137, 9, 'balance_sheet', NULL, NULL, 'balance_sheet', 1),
(138, 9, 'fixedasset_schedule', NULL, NULL, 'fixedasset_schedule', 1),
(139, 9, 'receipt_payment', NULL, NULL, 'receipt_payment', 1),
(140, 9, 'bank_reconciliation_report', NULL, NULL, 'bank_reconciliation_report', 1),
(141, 12, 'salary_advance_view', NULL, NULL, 'salary_advance_view', 1),
(142, 12, 'employee_salary_generate', NULL, NULL, 'employee_salary_generate', 1),
(143, 12, 'employee_salary_payment_view', NULL, NULL, 'employee_salary_payment_view', 1),
(144, 3, 'writer', NULL, NULL, 'writer', 1),
(145, 3, 'publication', NULL, NULL, 'publication', 1),
(146, 6, 'opening_stock', NULL, NULL, 'opening_stock', 1);

-- --------------------------------------------------------

--
-- Table structure for table `supplier_information`
--

DROP TABLE IF EXISTS `supplier_information`;
CREATE TABLE IF NOT EXISTS `supplier_information` (
  `supplier_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `supplier_name` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `address2` text NOT NULL,
  `mobile` varchar(100) DEFAULT NULL,
  `emailnumber` varchar(200) DEFAULT NULL,
  `email_address` varchar(200) DEFAULT NULL,
  `contact` varchar(100) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `fax` varchar(100) DEFAULT NULL,
  `city` text,
  `state` text,
  `zip` varchar(50) DEFAULT NULL,
  `country` varchar(250) DEFAULT NULL,
  `details` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`supplier_id`),
  KEY `supplier_id` (`supplier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `supplier_information`
--

INSERT INTO `supplier_information` (`supplier_id`, `supplier_name`, `address`, `address2`, `mobile`, `emailnumber`, `email_address`, `contact`, `phone`, `fax`, `city`, `state`, `zip`, `country`, `details`, `status`) VALUES
(1, 'Imran Khan', '', '', '', '', '', '', '', '', '', '', '', '', NULL, 1),
(2, 'Masihur Rahman', '', '', '', '', '', '', '', '', '', '', '', '', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `supplier_product`
--

DROP TABLE IF EXISTS `supplier_product`;
CREATE TABLE IF NOT EXISTS `supplier_product` (
  `supplier_pr_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` varchar(30) CHARACTER SET utf8 NOT NULL,
  `products_model` varchar(30) CHARACTER SET latin1 DEFAULT NULL,
  `supplier_id` bigint(20) NOT NULL,
  `supplier_price` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`supplier_pr_id`),
  KEY `product_id` (`product_id`),
  KEY `supplier_id` (`supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `synchronizer_setting`
--

DROP TABLE IF EXISTS `synchronizer_setting`;
CREATE TABLE IF NOT EXISTS `synchronizer_setting` (
  `id` int(11) NOT NULL,
  `hostname` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `port` varchar(10) NOT NULL,
  `debug` varchar(10) NOT NULL,
  `project_root` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tax_collection`
--

DROP TABLE IF EXISTS `tax_collection`;
CREATE TABLE IF NOT EXISTS `tax_collection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `customer_id` varchar(30) NOT NULL,
  `relation_id` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tax_settings`
--

DROP TABLE IF EXISTS `tax_settings`;
CREATE TABLE IF NOT EXISTS `tax_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `default_value` float NOT NULL,
  `tax_name` varchar(250) NOT NULL,
  `nt` int(11) NOT NULL,
  `reg_no` varchar(100) NOT NULL,
  `is_show` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

DROP TABLE IF EXISTS `units`;
CREATE TABLE IF NOT EXISTS `units` (
  `unit_id` int(11) NOT NULL AUTO_INCREMENT,
  `unit_name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`unit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`unit_id`, `unit_name`, `status`) VALUES
(3, 'Pieces', 1),
(4, 'KG', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(15) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `company_name` varchar(250) DEFAULT NULL,
  `address` text,
  `phone` varchar(20) DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `date_of_birth` varchar(255) DEFAULT NULL,
  `logo` varchar(250) DEFAULT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_id`, `last_name`, `first_name`, `company_name`, `address`, `phone`, `gender`, `date_of_birth`, `logo`, `status`) VALUES
(1, '1', 'User', 'Admin', NULL, NULL, NULL, NULL, NULL, 'assets/dist/img/profile_picture/profile.jpg', 1),
(2, '276843', 'Islam', 'Samiul', NULL, NULL, NULL, NULL, NULL, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_login`
--

DROP TABLE IF EXISTS `user_login`;
CREATE TABLE IF NOT EXISTS `user_login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(15) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `user_type` int(11) DEFAULT NULL,
  `security_code` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL DEFAULT '1' COMMENT '0=All',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_login`
--

INSERT INTO `user_login` (`id`, `user_id`, `username`, `password`, `user_type`, `security_code`, `status`, `warehouse_id`) VALUES
(1, '1', 'mdsohelranacse@gmail.com', '82c1ab9f315f15ff53d5bba77c9a1884', 1, NULL, 1, 0),
(2, '276843', 'samiul@gmail.com', '41d99b369894eb1ec3f461135132d8bb', 0, NULL, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vat_tax_setting`
--

DROP TABLE IF EXISTS `vat_tax_setting`;
CREATE TABLE IF NOT EXISTS `vat_tax_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dynamic_tax` int(11) NOT NULL DEFAULT '0',
  `fixed_tax` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vat_tax_setting`
--

INSERT INTO `vat_tax_setting` (`id`, `dynamic_tax`, `fixed_tax`) VALUES
(1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `warehouse`
--

DROP TABLE IF EXISTS `warehouse`;
CREATE TABLE IF NOT EXISTS `warehouse` (
  `warehouse_id` int(11) NOT NULL AUTO_INCREMENT,
  `warehouse_name` varchar(155) NOT NULL,
  PRIMARY KEY (`warehouse_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `warehouse`
--

INSERT INTO `warehouse` (`warehouse_id`, `warehouse_name`) VALUES
(1, 'Rangpur'),
(2, 'Dhaka');

-- --------------------------------------------------------

--
-- Table structure for table `web_setting`
--

DROP TABLE IF EXISTS `web_setting`;
CREATE TABLE IF NOT EXISTS `web_setting` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `logo` varchar(255) DEFAULT NULL,
  `invoice_logo` varchar(255) DEFAULT NULL,
  `favicon` varchar(255) DEFAULT NULL,
  `currency` varchar(10) DEFAULT NULL,
  `timezone` varchar(150) NOT NULL,
  `currency_position` varchar(10) DEFAULT NULL,
  `footer_text` varchar(255) DEFAULT NULL,
  `language` varchar(255) DEFAULT NULL,
  `rtr` varchar(255) DEFAULT NULL,
  `captcha` int(11) DEFAULT '1' COMMENT '0=active,1=inactive',
  `is_qr` int(11) NOT NULL,
  `is_autoapprove_v` int(11) NOT NULL DEFAULT '0',
  `site_key` varchar(250) DEFAULT NULL,
  `secret_key` varchar(250) DEFAULT NULL,
  `discount_type` int(11) DEFAULT '1',
  PRIMARY KEY (`setting_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `web_setting`
--

INSERT INTO `web_setting` (`setting_id`, `logo`, `invoice_logo`, `favicon`, `currency`, `timezone`, `currency_position`, `footer_text`, `language`, `rtr`, `captcha`, `is_qr`, `is_autoapprove_v`, `site_key`, `secret_key`, `discount_type`) VALUES
(1, '', '', '', '৳', 'Asia/Dhaka', '0', 'Developed by Sohel Rana', 'english', '0', 1, 1, 1, '6LdiKhsUAAAAAMV4jQRmNYdZy2kXEuFe1HrdP5tt', '6LdiKhsUAAAAAMV4jQRmNYdZy2kXEuFe1HrdP5tt', 1);

-- --------------------------------------------------------

--
-- Table structure for table `writer`
--

DROP TABLE IF EXISTS `writer`;
CREATE TABLE IF NOT EXISTS `writer` (
  `writer_id` int(11) NOT NULL AUTO_INCREMENT,
  `writer_name` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`writer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `writer`
--

INSERT INTO `writer` (`writer_id`, `writer_name`, `status`) VALUES
(1, 'আরিফ আজাদ', 1),
(2, 'সমরেশ মজুমদার', 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
