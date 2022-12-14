-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 05, 2022 at 04:21 PM
-- Server version: 5.7.31
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `helpful_shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_logs`
--

DROP TABLE IF EXISTS `activity_logs`;
CREATE TABLE IF NOT EXISTS `activity_logs` (
  `activity_id` int(11) NOT NULL,
  `user_id` varchar(11) COLLATE utf8_unicode_ci NOT NULL COMMENT 'for employee , it will save employee_id',
  `type` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT 'ticket, employee, attendnace etc.',
  `action` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'create, update, delete',
  `action_id` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `table_name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `form_data` text COLLATE utf8_unicode_ci,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1=created, 2=updated, 3=deleted	'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `app_setting`
--

DROP TABLE IF EXISTS `app_setting`;
CREATE TABLE IF NOT EXISTS `app_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `localhserver` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `onlineserver` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hotspot` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `app_setting`
--

INSERT INTO `app_setting` (`id`, `localhserver`, `onlineserver`, `hotspot`) VALUES
(1, 'https://demo.bdtask.com', 'https://demo.bdtask.com', 'https://demo.bdtask.com');

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
-- Table structure for table `company_information`
--

DROP TABLE IF EXISTS `company_information`;
CREATE TABLE IF NOT EXISTS `company_information` (
  `company_id` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `company_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  `mobile` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `website` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `vat_no` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cr_no` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `company_information`
--

INSERT INTO `company_information` (`company_id`, `company_name`, `email`, `address`, `mobile`, `website`, `vat_no`, `cr_no`, `status`) VALUES
('1', 'হেল্পফুল শপ', 'nuruddin099@gmail.com', 'ধাপ, রংপুর ', '01739911134', 'https://helpfulshopbd.com', '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `currency_tbl`
--

DROP TABLE IF EXISTS `currency_tbl`;
CREATE TABLE IF NOT EXISTS `currency_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `currency_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `icon` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
  `customer_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address2` text COLLATE utf8_unicode_ci NOT NULL,
  `customer_mobile` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_address` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fax` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` text COLLATE utf8_unicode_ci,
  `state` text COLLATE utf8_unicode_ci,
  `zip` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL COMMENT '1=paid,2=credit',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_by` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
-- Table structure for table `daily_closing`
--

DROP TABLE IF EXISTS `daily_closing`;
CREATE TABLE IF NOT EXISTS `daily_closing` (
  `closing_id` int(11) NOT NULL AUTO_INCREMENT,
  `last_day_closing` float NOT NULL,
  `cash_in` float NOT NULL,
  `cash_out` float NOT NULL,
  `date` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `amount` float NOT NULL,
  `adjustment` float DEFAULT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`closing_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_config`
--

DROP TABLE IF EXISTS `email_config`;
CREATE TABLE IF NOT EXISTS `email_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `protocol` text COLLATE utf8_unicode_ci NOT NULL,
  `smtp_host` text COLLATE utf8_unicode_ci NOT NULL,
  `smtp_port` text COLLATE utf8_unicode_ci NOT NULL,
  `smtp_user` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `smtp_pass` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `mailtype` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isinvoice` tinyint(4) NOT NULL,
  `isservice` tinyint(4) NOT NULL,
  `isquotation` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `email_config`
--

INSERT INTO `email_config` (`id`, `protocol`, `smtp_host`, `smtp_port`, `smtp_user`, `smtp_pass`, `mailtype`, `isinvoice`, `isservice`, `isquotation`) VALUES
(1, 'ssl', 'mail.waymarks.agency', '465', 'info@waymarks.agency', 'Mnbvcxz1!23', 'html', 1, 0, 0);

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
  `date` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
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
  `sales_by` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `delivery_note` text COLLATE utf8_unicode_ci,
  `invoice_details` text COLLATE utf8_unicode_ci NOT NULL,
  `is_credit` tinyint(4) DEFAULT NULL,
  `is_fixed` int(11) NOT NULL DEFAULT '0',
  `is_dynamic` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL,
  `bank_id` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`id`, `invoice_id`, `invoice`, `customer_id`, `date`, `total_amount`, `paid_amount`, `due_amount`, `prevous_due`, `shipping_cost`, `offline_invoice_no`, `invoice_discount`, `total_discount`, `total_vat_amnt`, `total_tax`, `ret_adjust_amnt`, `returnable_amount`, `sales_by`, `delivery_note`, `invoice_details`, `is_credit`, `is_fixed`, `is_dynamic`, `status`, `bank_id`, `payment_type`, `is_online`, `payment_method_id`, `added_on`, `added_by`, `edited_on`, `edited_by`, `warehouse_id`) VALUES
(1, 1, 1000001, 2, '2022-10-25', '1885.00', '1885.00', '0.00', '0.00', '80.00', NULL, '95.00', '0.00', '0.00', '0.00', NULL, NULL, '1', NULL, '', NULL, 0, 0, 1, NULL, 0, 1, 3, '2022-10-25 14:22:01', 1, NULL, NULL, 1),
(2, 2, 1000002, 3, '2022-10-25', '21680.00', '21680.00', '0.00', '0.00', '80.00', NULL, '2800.00', '0.00', '0.00', '0.00', NULL, NULL, '1', NULL, 'This is invoice details...', NULL, 0, 0, 1, NULL, 0, 1, 2, '2022-10-25 15:48:16', 1, '2022-10-25 17:57:48', 1, 2),
(3, 3, 1000003, 3, '2022-10-25', '7230.00', '7230.00', '0.00', '0.00', '80.00', NULL, '250.00', '0.00', '0.00', '0.00', NULL, NULL, '1', NULL, 'details here', NULL, 0, 0, 1, NULL, 0, 1, 3, '2022-10-25 15:51:32', 1, NULL, NULL, 2),
(4, 4, 1000004, 2, '2022-10-26', '10160.00', '10160.00', '0.00', '0.00', '80.00', NULL, '2520.00', '0.00', '0.00', '0.00', NULL, NULL, '1', NULL, '', NULL, 0, 0, 1, NULL, 0, 1, 3, '2022-10-26 09:37:00', 1, NULL, NULL, 2),
(5, 5, 1000005, 2, '2022-12-05', '6400.00', '6400.00', '0.00', '0.00', '80.00', NULL, '780.00', '0.00', '0.00', '0.00', NULL, NULL, '276843', NULL, '', NULL, 0, 0, 1, NULL, 0, 1, 3, '2022-12-05 19:28:02', 276843, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `invoice_details`
--

DROP TABLE IF EXISTS `invoice_details`;
CREATE TABLE IF NOT EXISTS `invoice_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_details_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `invoice_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ret_invoice_id` bigint(20) DEFAULT NULL,
  `product_id` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `serial_no` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quantity` decimal(10,2) DEFAULT NULL,
  `rate` decimal(10,2) DEFAULT NULL,
  `batch_id` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `supplier_rate` float DEFAULT NULL,
  `total_price` decimal(12,2) DEFAULT NULL,
  `discount` decimal(10,2) DEFAULT NULL,
  `discount_per` double(10,2) DEFAULT NULL,
  `vat_amnt` decimal(10,2) DEFAULT NULL,
  `vat_amnt_per` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tax` decimal(10,2) DEFAULT NULL,
  `paid_amount` decimal(12,0) DEFAULT NULL,
  `due_amount` decimal(10,2) DEFAULT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_id` (`invoice_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
(15, '413313543351984', '4', NULL, '19526545', NULL, NULL, '90.00', '140.00', NULL, NULL, '10080.00', '2520.00', 20.00, NULL, NULL, NULL, NULL, NULL, 1),
(16, '656395647285563', '5', NULL, '19526545', NULL, NULL, '10.00', '140.00', NULL, NULL, '1190.00', '210.00', 15.00, NULL, NULL, NULL, NULL, NULL, 1),
(17, '386542947213318', '5', NULL, '62560353', NULL, NULL, '30.00', '190.00', NULL, NULL, '5130.00', '570.00', 10.00, NULL, NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

DROP TABLE IF EXISTS `language`;
CREATE TABLE IF NOT EXISTS `language` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `phrase` text COLLATE utf8_unicode_ci NOT NULL,
  `english` text COLLATE utf8_unicode_ci,
  `bangla` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1104 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `language`
--

INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES
(1, 'user_profile', 'User Profile', 'ব্যবহারকারীর প্রোফাইল'),
(2, 'setting', 'Setting', 'স্থাপন'),
(3, 'language', 'Language', 'ভাষা'),
(4, 'manage_users', 'Manage Users', 'ব্যবহারকারীদের ম্যানেজ করুন'),
(5, 'add_user', 'Add User', 'ব্যবহারকারী যোগ করুন'),
(6, 'manage_company', 'Manage Company', 'কোম্পানি পরিচালনা করুন'),
(7, 'web_settings', 'Software Settings', 'সফ্টওয়্যার সেটিংস'),
(8, 'manage_accounts', 'Manage Accounts', 'অ্যাকাউন্ট পরিচালনা করুন'),
(9, 'create_accounts', 'Create Account', 'হিসাব তৈরি কর'),
(10, 'manage_bank', 'Manage Bank', 'ব্যাংক পরিচালনা করুন'),
(11, 'add_new_bank', 'Add New Bank', 'নতুন ব্যাংক যোগ করুন'),
(12, 'settings', 'Settings', 'সেটিংস'),
(13, 'closing_report', 'Closing Report', 'ক্লোজিং রিপোর্ট'),
(14, 'closing', 'Closing', 'বন্ধ'),
(15, 'cheque_manager', 'Cheque Manager', 'ম্যানেজার চেক করুন'),
(16, 'accounts_summary', 'Accounts Summary', 'অ্যাকাউন্টের সারাংশ'),
(17, 'expense', 'Expense', 'ব্যয়'),
(18, 'income', 'Income', 'আয়'),
(19, 'accounts', 'Accounts', 'হিসাব'),
(20, 'stock_report', 'Stock Report', 'স্টক রিপোর্ট'),
(21, 'stock', 'Stock', 'স্টক'),
(22, 'pos_invoice', 'POS Sale', 'POS বিক্রয়'),
(23, 'manage_invoice', 'Manage Sale', 'বিক্রয় পরিচালনা করুন'),
(24, 'new_invoice', 'New Sale', 'নতুন বিক্রয়'),
(25, 'invoice', 'Sale', 'বিক্রয়'),
(26, 'manage_purchase', 'Manage Purchase', 'ক্রয় পরিচালনা করুন'),
(27, 'add_purchase', 'Add Purchase', 'ক্রয় যোগ করুন'),
(28, 'purchase', 'Purchase', 'ক্রয়'),
(29, 'paid_customer', 'Paid Customer', 'প্রদত্ত গ্রাহক'),
(30, 'manage_customer', 'Manage Customer', 'গ্রাহক পরিচালনা করুন'),
(31, 'add_customer', 'Add Customer', 'গ্রাহক যোগ করুন'),
(32, 'customer', 'Customer', 'ক্রেতা'),
(33, 'supplier_payment_actual', 'Supplier Payment Ledger', 'সরবরাহকারী পেমেন্ট লেজার'),
(34, 'supplier_sales_summary', 'Supplier Sales Summary', 'সরবরাহকারী বিক্রয় সারাংশ'),
(35, 'supplier_sales_details', 'Supplier Sales Details', 'সরবরাহকারী বিক্রয় বিবরণ'),
(36, 'supplier_ledger', 'Supplier Ledger', 'সরবরাহকারী খাতা'),
(37, 'manage_supplier', 'Manage Supplier', 'সরবরাহকারী পরিচালনা করুন'),
(38, 'add_supplier', 'Add Supplier', 'সরবরাহকারী যোগ করুন'),
(39, 'supplier', 'Supplier', 'সরবরাহকারী'),
(40, 'product_statement', 'Product Statement', 'পণ্য বিবৃতি'),
(41, 'manage_product', 'Manage Product', 'পণ্য পরিচালনা করুন'),
(42, 'add_product', 'Add Product', 'পণ্য যোগ করুন'),
(43, 'product', 'Product', 'পণ্য'),
(44, 'manage_category', 'Manage Category', 'বিভাগ পরিচালনা করুন'),
(45, 'add_category', 'Add Category', 'বিভাগ যোগ করুন'),
(46, 'category', 'Category', 'শ্রেণী'),
(47, 'sales_report_product_wise', 'Sales Report (Product Wise)', 'বিক্রয় প্রতিবেদন (পণ্য অনুসারে)'),
(48, 'purchase_report', 'Purchase Report', 'ক্রয় প্রতিবেদন'),
(49, 'sales_report', 'Sales Report', 'বিক্রয় রিপোর্ট'),
(50, 'todays_report', 'Todays Report', 'আজকের প্রতিবেদন'),
(51, 'report', 'Report', 'রিপোর্ট'),
(52, 'dashboard', 'Dashboard', 'ড্যাশবোর্ড'),
(53, 'online', 'Online', 'অনলাইন'),
(54, 'logout', 'Logout', 'প্রস্থান'),
(55, 'change_password', 'Change Password', 'পাসওয়ার্ড পরিবর্তন করুন'),
(56, 'total_purchase', 'Total Purchase', 'মোট ক্রয়'),
(57, 'total_amount', 'Total Amount', 'সর্বমোট পরিমাণ'),
(58, 'supplier_name', 'Supplier Name', 'সরবরাহকারী নাম'),
(59, 'invoice_no', 'Invoice No', 'চালান নং'),
(60, 'purchase_date', 'Purchase Date', 'ক্রয় তারিখ'),
(61, 'todays_purchase_report', 'Todays Purchase Report', 'আজকের ক্রয় প্রতিবেদন'),
(62, 'total_sales', 'Total Sales', 'মোট বিক্রয়'),
(63, 'customer_name', 'Customer Name', 'ক্রেতার নাম'),
(64, 'sales_date', 'Sales Date', 'বিক্রয় তারিখ'),
(65, 'todays_sales_report', 'Todays Sales Report', 'আজকের বিক্রয় প্রতিবেদন'),
(66, 'home', 'Home', 'বাড়ি'),
(67, 'todays_sales_and_purchase_report', 'Todays sales and purchase report', 'আজকের বিক্রয় এবং ক্রয় প্রতিবেদন'),
(68, 'total_ammount', 'Total Amount', 'সর্বমোট পরিমাণ'),
(69, 'rate', 'Rate', 'হার'),
(70, 'product_model', 'Product Model', 'পণ্যের ধরণ'),
(71, 'product_name', 'Product Name', 'পণ্যের নাম'),
(72, 'search', 'Search', 'অনুসন্ধান করুন'),
(73, 'end_date', 'End Date', 'শেষ তারিখ'),
(74, 'start_date', 'Start Date', 'শুরুর তারিখ'),
(75, 'total_purchase_report', 'Total Purchase Report', 'মোট ক্রয় প্রতিবেদন'),
(76, 'total_sales_report', 'Total Sales Report', 'মোট বিক্রয় রিপোর্ট'),
(78, 'all_stock_report', 'All Stock Report', 'সমস্ত স্টক রিপোর্ট'),
(79, 'search_by_product', 'Search By Product', 'পণ্য দ্বারা অনুসন্ধান করুন'),
(80, 'date', 'Date', 'তারিখ'),
(81, 'print', 'Print', 'ছাপা'),
(82, 'stock_date', 'Stock Date', 'স্টক তারিখ'),
(83, 'print_date', 'Print Date', 'মুদ্রণ তারিখ'),
(84, 'sales', 'Sales', 'বিক্রয়'),
(85, 'price', 'Price', 'দাম'),
(86, 'sl', 'SL.', 'দাম. '),
(87, 'add_new_category', 'Add new category', 'নতুন বিভাগ যোগ করুন'),
(88, 'category_name', 'Category Name', 'বিভাগ নাম'),
(89, 'save', 'Save', 'সংরক্ষণ'),
(90, 'delete', 'Delete', 'মুছে ফেলা'),
(91, 'update', 'Update', 'হালনাগাদ'),
(92, 'action', 'Action', 'কর্ম'),
(93, 'manage_your_category', 'Manage your category ', 'আপনার বিভাগ পরিচালনা করুন'),
(94, 'category_edit', 'Category Edit', 'বিভাগ সম্পাদনা'),
(95, 'status', 'Status', 'স্ট্যাটাস'),
(96, 'active', 'Active', 'সক্রিয়'),
(97, 'inactive', 'Inactive', 'নিষ্ক্রিয়'),
(98, 'save_changes', 'Save Changes', 'পরিবর্তনগুলোর সংরক্ষন'),
(99, 'save_and_add_another', 'Save And Add Another', 'সংরক্ষণ করুন এবং অন্য যোগ করুন'),
(100, 'model', 'Model', 'মডেল'),
(101, 'supplier_price', 'Supplier Price', 'সরবরাহকারীর মূল্য'),
(102, 'sell_price', 'Sale Price', 'বিক্রয় মূল্য'),
(103, 'image', 'Image', 'ছবি'),
(104, 'select_one', 'Select One', 'একটা নির্বাচন করুন'),
(105, 'details', 'Details', 'বিস্তারিত'),
(106, 'new_product', 'New Product', 'নতুন পণ্য'),
(107, 'add_new_product', 'Add new product', 'নতুন পণ্য যোগ করুন'),
(108, 'barcode', 'Barcode', 'বারকোড'),
(109, 'qr_code', 'Qr-Code', 'Qr-কোড'),
(110, 'product_details', 'Product Details', 'পণ্যের বিবরণ'),
(111, 'manage_your_product', 'Manage your product', 'আপনার পণ্য পরিচালনা করুন'),
(112, 'product_edit', 'Product Edit', 'পণ্য সম্পাদনা'),
(113, 'edit_your_product', 'Edit your product', 'আপনার পণ্য সম্পাদনা করুন'),
(114, 'cancel', 'Cancel', 'বাতিল করুন'),
(115, 'incl_vat', 'Incl. Vat', 'বাতিল করুন. '),
(116, 'money', 'TK', 'টাকা'),
(117, 'grand_total', 'Grand Total', 'সর্বমোট'),
(118, 'quantity', 'Quantity', 'পরিমাণ'),
(119, 'product_report', 'Product Report', 'পণ্য রিপোর্ট'),
(120, 'product_sales_and_purchase_report', 'Product sales and purchase report', 'পণ্য বিক্রয় এবং ক্রয় প্রতিবেদন'),
(121, 'previous_stock', 'Previous Stock', 'পূর্ববর্তী স্টক'),
(122, 'out', 'Out', 'আউট'),
(123, 'in', 'In', 'ভিতরে'),
(124, 'to', 'To', 'প্রতি'),
(125, 'previous_balance', 'Previous Balance', 'পূর্বের হিসাব'),
(126, 'customer_address', 'Customer Address', 'গ্রাহকের ঠিকানা'),
(127, 'customer_mobile', 'Customer Mobile', 'গ্রাহক মোবাইল'),
(128, 'customer_email', 'Customer Email', 'গ্রাহক ইমেল'),
(129, 'add_new_customer', 'Add new customer', 'নতুন গ্রাহক যোগ করুন'),
(130, 'balance', 'Balance', 'ভারসাম্য'),
(131, 'mobile', 'Mobile', 'মুঠোফোন'),
(132, 'address', 'Address', 'ঠিকানা'),
(133, 'manage_your_customer', 'Manage your customer', 'আপনার গ্রাহক পরিচালনা করুন'),
(134, 'customer_edit', 'Customer Edit', 'গ্রাহক সম্পাদনা'),
(135, 'paid_customer_list', 'Paid Customer List', 'প্রদত্ত গ্রাহক তালিকা'),
(136, 'ammount', 'Amount', 'পরিমাণ'),
(137, 'customer_ledger', 'Customer Ledger', 'গ্রাহক লেজার'),
(138, 'manage_customer_ledger', 'Manage Customer Ledger', 'গ্রাহক লেজার পরিচালনা করুন'),
(139, 'customer_information', 'Customer Information', 'গ্রাহক তথ্য'),
(140, 'debit_ammount', 'Debit Amount', 'ডেবিট পরিমাণ'),
(141, 'credit_ammount', 'Credit Amount', 'ক্রেডিট পরিমাণ'),
(142, 'balance_ammount', 'Balance Amount', 'ভারসাম্য পরিমাণ'),
(143, 'receipt_no', 'Receipt NO', 'প্রাপ্তি কোন'),
(144, 'description', 'Description', 'বর্ণনা'),
(145, 'debit', 'Debit', 'ডেবিট'),
(146, 'credit', 'Credit', 'ক্রেডিট'),
(147, 'item_information', 'Item Information', 'আইটেম তথ্য'),
(148, 'total', 'Total', 'মোট'),
(149, 'please_select_supplier', 'Please Select Supplier', 'অনুগ্রহ করে সরবরাহকারী নির্বাচন করুন'),
(150, 'submit', 'Submit', 'জমা দিন'),
(151, 'submit_and_add_another', 'Submit And Add Another One', 'জমা দিন এবং অন্য একটি যোগ করুন'),
(152, 'add_new_item', 'Add New Item', 'নতুন আইটেম যোগ করুন'),
(153, 'manage_your_purchase', 'Manage your purchase', 'আপনার ক্রয় পরিচালনা করুন'),
(154, 'purchase_edit', 'Purchase Edit', 'ক্রয় সম্পাদনা করুন'),
(155, 'purchase_ledger', 'Purchase Ledger', 'ক্রয় লেজার'),
(156, 'invoice_information', 'Sale Information', 'বিক্রয় তথ্য'),
(157, 'paid_ammount', 'Paid Amount', 'দেওয়া পরিমাণ'),
(158, 'discount', 'Dis./Pcs.', 'দেওয়া পরিমাণ. . '),
(159, 'save_and_paid', 'Save And Paid', 'সংরক্ষণ করুন এবং অর্থপ্রদান করুন'),
(160, 'payee_name', 'Payee Name', 'পাওনাদারের নাম'),
(161, 'manage_your_invoice', 'Manage your Sale', 'আপনার বিক্রয় পরিচালনা করুন'),
(162, 'invoice_edit', 'Sale Edit', 'বিক্রয় সম্পাদনা'),
(163, 'new_pos_invoice', 'New POS Sale', 'নতুন POS বিক্রয়'),
(164, 'add_new_pos_invoice', 'Add new pos Sale', 'নতুন পোস্ট বিক্রয় যোগ করুন'),
(165, 'product_id', 'Product ID', 'পণ্য আইডি'),
(166, 'paid_amount', 'Paid Amount', 'দেওয়া পরিমাণ'),
(167, 'authorised_by', 'Authorised By', 'অনুমোদিত'),
(168, 'checked_by', 'Checked By', 'দ্বারা পরীক্ষিত'),
(169, 'received_by', 'Received By', 'গ্রহণকারী'),
(170, 'prepared_by', 'Prepared By', 'প্রস্তুতকারক'),
(171, 'memo_no', 'Memo No', 'মেমো নং'),
(172, 'website', 'Website', 'ওয়েবসাইট'),
(173, 'email', 'Email', 'ইমেইল'),
(174, 'invoice_details', 'Sale Details', 'বিক্রয় বিবরণ'),
(175, 'reset', 'Reset', 'রিসেট'),
(176, 'payment_account', 'Payment Account', 'টাকা পরিষদের অ্যাকাউন্ট'),
(177, 'bank_name', 'Bank Name', 'ব্যাংকের নাম'),
(178, 'cheque_or_pay_order_no', 'Cheque/Pay Order No', 'চেক/পে অর্ডার নম্বর'),
(179, 'payment_type', 'Payment Type', 'শোধের ধরণ'),
(180, 'payment_from', 'Payment From', 'থেকে পেমেন্ট'),
(181, 'payment_date', 'Payment Date', 'টাকা প্রদানের তারিখ'),
(182, 'add_income', 'Add Income', 'আয় যোগ করুন'),
(183, 'cash', 'Cash', 'নগদ'),
(184, 'cheque', 'Cheque', 'চেক করুন'),
(185, 'pay_order', 'Pay Order', 'পে অর্ডার'),
(186, 'payment_to', 'Payment To', 'পরিশোদ করা'),
(187, 'total_outflow_ammount', 'Total Expense Amount', 'মোট ব্যয়ের পরিমাণ'),
(188, 'transections', 'Transections', 'লেনদেন'),
(189, 'accounts_name', 'Accounts Name', 'অ্যাকাউন্টের নাম'),
(190, 'outflow_report', 'Expense Report', 'ব্যয় রিপোর্ট'),
(191, 'inflow_report', 'Income Report', 'আয় রিপোর্ট'),
(192, 'all', 'All', 'সব'),
(193, 'account', 'Account', 'হিসাব'),
(194, 'from', 'From', 'থেকে'),
(195, 'account_summary_report', 'Account Summary Report', 'অ্যাকাউন্ট সারাংশ রিপোর্ট'),
(196, 'search_by_date', 'Search By Date', 'তারিখ অনুসারে অনুসন্ধান করুন'),
(197, 'cheque_no', 'Cheque No', 'চেক নম্বর'),
(198, 'name', 'Name', 'নাম'),
(199, 'closing_account', 'Closing Account', 'অ্যাকাউন্ট বন্ধ করা হচ্ছে'),
(200, 'close_your_account', 'Close your account', 'আপনার অ্যাকাউন্ট বন্ধ করুন'),
(201, 'last_day_closing', 'Last Day Closing', 'শেষ দিনের সমাপনী'),
(202, 'cash_in', 'Cash In', 'টাকা ঢুকান'),
(203, 'cash_out', 'Cash Out', 'উত্তোলন'),
(204, 'cash_in_hand', 'Cash In Hand', 'হাতে নগদ'),
(205, 'add_new_bank', 'Add New Bank', 'নতুন ব্যাংক যোগ করুন'),
(206, 'day_closing', 'Day Closing', 'দিন বন্ধ'),
(207, 'account_closing_report', 'Account Closing Report', 'অ্যাকাউন্ট ক্লোজিং রিপোর্ট'),
(208, 'last_day_ammount', 'Last Day Amount', 'শেষ দিনের পরিমাণ'),
(209, 'adjustment', 'Adjustment', 'সামঞ্জস্য'),
(210, 'pay_type', 'Pay Type', 'পে টাইপ'),
(211, 'customer_or_supplier', 'Customer,Supplier Or Others', 'গ্রাহক, সরবরাহকারী বা অন্যদের'),
(212, 'transection_id', 'Transections ID', 'লেনদেন আইডি'),
(213, 'accounts_summary_report', 'Accounts Summary Report', 'অ্যাকাউন্টের সারাংশ রিপোর্ট'),
(214, 'bank_list', 'Bank List', 'ব্যাংক তালিকা'),
(215, 'bank_edit', 'Bank Edit', 'ব্যাংক সম্পাদনা'),
(216, 'debit_plus', 'Debit (+)', 'ডেবিট (+)'),
(217, 'credit_minus', 'Credit (-)', 'ক্রেডিট (-)'),
(218, 'account_name', 'Account Name', 'হিসাবের নাম'),
(219, 'account_type', 'Account Type', 'অ্যাকাউন্ট ধরন'),
(220, 'account_real_name', 'Account Real Name', 'অ্যাকাউন্টের আসল নাম'),
(221, 'manage_account', 'Manage Account', 'অ্যাকাউন্ট পরিচালনা'),
(222, 'company_name', 'Niha International', 'নিহা ইন্টারন্যাশনাল'),
(223, 'edit_your_company_information', 'Edit your company information', 'আপনার কোম্পানির তথ্য সম্পাদনা করুন'),
(224, 'company_edit', 'Company Edit', 'কোম্পানি সম্পাদনা'),
(225, 'admin', 'Admin', 'অ্যাডমিন'),
(226, 'user', 'User', 'ব্যবহারকারী'),
(227, 'password', 'Password', 'পাসওয়ার্ড'),
(228, 'last_name', 'Last Name', 'নামের শেষাংশ'),
(229, 'first_name', 'First Name', 'নামের প্রথম অংশ'),
(230, 'add_new_user_information', 'Add new user information', 'নতুন ব্যবহারকারীর তথ্য যোগ করুন'),
(231, 'user_type', 'User Type', 'ব্যবহারকারীর ধরন'),
(232, 'user_edit', 'User Edit', 'ব্যবহারকারী সম্পাদনা'),
(233, 'rtr', 'RTR', 'আরটিআর'),
(234, 'ltr', 'LTR', 'এলটিআর'),
(235, 'ltr_or_rtr', 'LTR/RTR', 'এলটিআর/আরটিআর'),
(236, 'footer_text', 'Footer Text', 'পাদচরণ'),
(237, 'favicon', 'Favicon', 'ফেভিকন'),
(238, 'logo', 'Logo', 'লোগো'),
(239, 'update_setting', 'Update Setting', 'সেটিং আপডেট করুন'),
(240, 'update_your_web_setting', 'Update your web setting', 'আপনার ওয়েব সেটিং আপডেট করুন'),
(241, 'login', 'Login', 'প্রবেশ করুন'),
(242, 'your_strong_password', 'Your strong password', 'আপনার শক্তিশালী পাসওয়ার্ড'),
(243, 'your_unique_email', 'Your unique email', 'আপনার অনন্য ইমেল'),
(244, 'please_enter_your_login_information', 'Please enter your login information.', 'আপনার অনন্য ইমেল. '),
(245, 'update_profile', 'Update Profile', 'প্রফাইল হালনাগাদ'),
(246, 'your_profile', 'Your Profile', 'তোমার প্রোফাইল'),
(247, 're_type_password', 'Re-Type Password', 'পাসওয়ার্ড পুনরায় টাইপ করুন'),
(248, 'new_password', 'New Password', 'নতুন পাসওয়ার্ড'),
(249, 'old_password', 'Old Password', 'পুরানো পাসওয়ার্ড'),
(250, 'new_information', 'New Information', 'নতুন তথ্য'),
(251, 'old_information', 'Old Information', 'পুরাতন তথ্য'),
(252, 'change_your_information', 'Change your information', 'আপনার তথ্য পরিবর্তন করুন'),
(253, 'change_your_profile', 'Change your profile', 'আপনার প্রোফাইল পরিবর্তন করুন'),
(254, 'profile', 'Profile', 'প্রোফাইল'),
(255, 'wrong_username_or_password', 'Wrong User Name Or Password !', 'ভুল ব্যবহারকারী নাম বা পাসওয়ার্ড !'),
(256, 'successfully_updated', 'Updated Successfully', 'সফলভাবে আপডেট করা হয়েছে৷'),
(257, 'blank_field_does_not_accept', 'Blank Field Does Not Accept !', 'খালি মাঠ মানায় না!'),
(258, 'successfully_changed_password', 'Password Changed Successfully', 'পাসওয়ার্ড সফলভাবে পরিবর্তন'),
(259, 'you_are_not_authorised_person', 'You are not authorised person !', 'আপনি অনুমোদিত ব্যক্তি নন!'),
(260, 'password_and_repassword_does_not_match', 'Passwor and re-password does not match !', 'পাসওয়ার্ড ও রি-পাসওয়ার্ড মিলছে না!'),
(261, 'new_password_at_least_six_character', 'New Password At Least 6 Character.', 'পাসওয়ার্ড ও রি-পাসওয়ার্ড মিলছে না!. '),
(262, 'you_put_wrong_email_address', 'You put wrong email address !', 'আপনি ভুল ইমেইল ঠিকানা দিয়েছেন!'),
(263, 'cheque_ammount_asjusted', 'Cheque amount adjusted.', 'আপনি ভুল ইমেইল ঠিকানা দিয়েছেন!. '),
(264, 'successfully_payment_paid', 'Successfully Payment Paid', 'সফলভাবে পেমেন্ট দেওয়া হয়েছে'),
(265, 'successfully_added', 'Successfully Added', 'সফলভাবে যোগ করা হয়েছে'),
(266, 'successfully_updated_2_closing_ammount_not_changeale', 'Successfully Updated -2. Note: Closing Amount Not Changeable.', '. . '),
(267, 'successfully_payment_received', 'Successfully Payment Received', 'সফলভাবে পেমেন্ট প্রাপ্ত হয়েছে'),
(268, 'already_inserted', 'Already Inserted !', 'ইতিমধ্যে ঢোকানো!'),
(269, 'successfully_delete', 'Successfully Delete.', 'ইতিমধ্যে ঢোকানো!. '),
(270, 'successfully_created', 'Successfully Created.', 'সফলভাবে পেমেন্ট প্রাপ্ত হয়েছে. '),
(271, 'logo_not_uploaded', 'Logo not uploaded !', 'লোগো আপলোড হয়নি!'),
(272, 'favicon_not_uploaded', 'Favicon not uploaded !', 'ফেভিকন আপলোড করা হয়নি!'),
(273, 'supplier_mobile', 'Supplier Mobile', 'সরবরাহকারী মোবাইল'),
(274, 'supplier_address', 'Supplier Address', 'সরবরাহকারীর ঠিকানা'),
(275, 'supplier_details', 'Supplier Details', 'সরবরাহকারীর বিবরণ'),
(276, 'add_new_supplier', 'Add New Supplier', 'নতুন সরবরাহকারী যোগ করুন'),
(277, 'manage_suppiler', 'Manage Supplier', 'সরবরাহকারী পরিচালনা করুন'),
(278, 'manage_your_supplier', 'Manage your supplier', 'আপনার সরবরাহকারী পরিচালনা করুন'),
(279, 'manage_supplier_ledger', 'Manage supplier ledger', 'সরবরাহকারী খাতা পরিচালনা করুন'),
(280, 'invoice_id', 'Invoice ID', 'চালান আইডি'),
(281, 'deposite_id', 'Deposite ID', 'ডিপোজিট আইডি'),
(282, 'supplier_actual_ledger', 'Supplier Payment Ledger', 'সরবরাহকারী পেমেন্ট লেজার'),
(283, 'supplier_information', 'Supplier Information', 'সরবরাহকারীর তথ্য'),
(284, 'event', 'Event', 'ঘটনা'),
(285, 'add_new_income', 'Add New Income', 'নতুন আয় যোগ করুন'),
(286, 'add_expese', 'Add Expense', 'খরচ যোগ করুন'),
(287, 'add_new_expense', 'Add New Expense', 'নতুন খরচ যোগ করুন'),
(288, 'total_inflow_ammount', 'Total Income Amount', 'মোট আয়ের পরিমাণ'),
(289, 'create_new_invoice', 'Create New Sale', 'নতুন বিক্রয় তৈরি করুন'),
(290, 'create_pos_invoice', 'Create POS Sale', 'POS বিক্রয় তৈরি করুন'),
(291, 'total_profit', 'Total Profit', 'সমস্ত লাভ'),
(292, 'monthly_progress_report', 'Monthly Progress Report', 'মাসিক অগ্রগতি রিপোর্ট'),
(293, 'total_invoice', 'Total Sale', 'মোট বিক্রয়'),
(294, 'account_summary', 'Account Summary', 'অ্যাকাউন্টের সারাংশ'),
(295, 'total_supplier', 'Total Supplier', 'মোট সরবরাহকারী'),
(296, 'total_product', 'Total Product', 'মোট পণ্য'),
(297, 'total_customer', 'Total Customer', 'মোট গ্রাহক'),
(298, 'supplier_edit', 'Supplier Edit', 'সরবরাহকারী সম্পাদনা'),
(299, 'add_new_invoice', 'Add New Sale', 'নতুন বিক্রয় যোগ করুন'),
(300, 'add_new_purchase', 'Add new purchase', 'নতুন ক্রয় যোগ করুন'),
(301, 'currency', 'Currency', 'মুদ্রা'),
(302, 'currency_position', 'Currency Position', 'মুদ্রার অবস্থান'),
(303, 'left', 'Left', 'বাম'),
(304, 'right', 'Right', 'ঠিক'),
(305, 'add_tax', 'Add TAX', 'ট্যাক্স যোগ করুন'),
(306, 'manage_tax', 'Manage TAX', 'ট্যাক্স পরিচালনা করুন'),
(307, 'add_new_tax', 'Add new TAX', 'নতুন ট্যাক্স যোগ করুন'),
(308, 'enter_tax', 'Enter TAX', 'TAX লিখুন'),
(309, 'already_exists', 'Already Exists !', 'আগে থেকেই আছে !'),
(310, 'successfully_inserted', 'Successfully Inserted.', 'আগে থেকেই আছে !. '),
(311, 'tax', 'TAX', 'ট্যাক্স'),
(312, 'tax_edit', 'TAX Edit', 'ট্যাক্স সম্পাদনা'),
(313, 'product_not_added', 'Product not added !', 'পণ্য যোগ করা হয়নি!'),
(314, 'total_tax', 'Total TAX', 'মোট ট্যাক্স'),
(315, 'manage_your_supplier_details', 'Manage your supplier details.', 'মোট ট্যাক্স. '),
(316, 'invoice_description', 'Lorem Ipsum is sim ply dummy Lorem Ipsum is simply dummy Lorem Ipsum is simply dummy Lorem Ipsum is simply dummy Lorem Ipsum is simply dummy Lorem Ipsum is sim ply dummy Lorem Ipsum is simply dummy Lorem Ipsum is simply dummy Lorem Ipsum is simply dummy Lorem Ipsum is simply dummy', 'Lorem Ipsum হল সিম প্লাই ডামি Lorem Ipsum হল শুধু ডামি Lorem Ipsum হল শুধু ডামি Lorem Ipsum হল ডামি Lorem Ipsum হল শুধু ডামি Lorem Ipsum হল সিম প্লাই ডামি Lorem Ipsum হল শুধু ডামি Lorem Ipsum হল ডামি Ipsum is Lorem Ipsum '),
(317, 'thank_you_for_choosing_us', 'Thank you very much for choosing us.', 'Lorem Ipsum হল সিম প্লাই ডামি Lorem Ipsum হল শুধু ডামি Lorem Ipsum হল শুধু ডামি Lorem Ipsum হল ডামি Lorem Ipsum হল শুধু ডামি Lorem Ipsum হল সিম প্লাই ডামি Lorem Ipsum হল শুধু ডামি Lorem Ipsum হল ডামি Ipsum is Lorem Ipsum . '),
(318, 'billing_date', 'Billing Date', 'বিলিং তারিখ'),
(319, 'billing_to', 'Billing To', 'বিলিং করতে'),
(320, 'billing_from', 'Billing From', 'থেকে বিলিং'),
(321, 'you_cant_delete_this_product', 'Sorry !!  You can\'t delete this product.This product already used in calculation system!', 'থেকে বিলিং. '),
(322, 'old_customer', 'Old Customer', 'পুরাতন গ্রাহক'),
(323, 'new_customer', 'New Customer', 'নতুন গ্রাহক'),
(324, 'new_supplier', 'New Supplier', 'নতুন সরবরাহকারী'),
(325, 'old_supplier', 'Old Supplier', 'পুরাতন সরবরাহকারী'),
(326, 'credit_customer', 'Credit Customer', 'ক্রেডিট গ্রাহক'),
(327, 'account_already_exists', 'This Account Already Exists !', 'এই অ্যাকাউন্টটি ইতিমধ্যেই বিদ্যমান !'),
(328, 'edit_income', 'Edit Income', 'আয় সম্পাদনা করুন'),
(329, 'you_are_not_access_this_part', 'You are not authorised person !', 'আপনি অনুমোদিত ব্যক্তি নন!'),
(330, 'account_edit', 'Account Edit', 'অ্যাকাউন্ট সম্পাদনা'),
(331, 'due', 'Due', 'বাকি'),
(332, 'expense_edit', 'Expense Edit', 'ব্যয় সম্পাদনা'),
(333, 'please_select_customer', 'Please select customer !', 'গ্রাহক নির্বাচন করুন!'),
(334, 'profit_report', 'Profit Report (Sale Wise)', 'লাভ রিপোর্ট (বিক্রয় অনুযায়ী)'),
(335, 'total_profit_report', 'Total profit report', 'মোট লাভ রিপোর্ট'),
(336, 'please_enter_valid_captcha', 'Please enter valid captcha.', 'মোট লাভ রিপোর্ট. '),
(337, 'category_not_selected', 'Category not selected', 'বিভাগ নির্বাচন করা হয়নি'),
(338, 'supplier_not_selected', 'Supplier not selected', 'সরবরাহকারী নির্বাচন করা হয়নি'),
(339, 'please_select_product', 'Please select product.', ''),
(340, 'product_model_already_exist', 'Product model already exist !', 'পণ্য মডেল ইতিমধ্যে বিদ্যমান!'),
(341, 'invoice_logo', 'Sale Logo', 'বিক্রয় লোগো'),
(342, 'available_qnty', 'Av. Qnty.', 'বিক্রয় লোগো. . '),
(343, 'you_can_not_buy_greater_than_available_cartoon', 'You can not select grater than available cartoon !', 'আপনি উপলব্ধ কার্টুনের চেয়ে বড় নির্বাচন করতে পারবেন না!'),
(344, 'customer_details', 'Customer details', 'গ্রাহক বিবরণ'),
(345, 'manage_customer_details', 'Manage customer details.', 'গ্রাহক বিবরণ. '),
(346, 'site_key', 'Captcha Site Key', 'ক্যাপচা সাইট কী'),
(347, 'secret_key', 'Captcha Secret Key', 'ক্যাপচা সিক্রেট কী'),
(348, 'captcha', 'Captcha', 'ক্যাপচা'),
(349, 'cartoon_quantity', 'Cartoon Quantity', 'কার্টুনের পরিমাণ'),
(350, 'total_cartoon', 'Total Cartoon', 'মোট কার্টুন'),
(351, 'cartoon', 'Cartoon', 'কার্টুন'),
(352, 'item_cartoon', 'Item/Cartoon', 'আইটেম/কার্টুন'),
(353, 'product_and_supplier_did_not_match', 'Product and supplier did not match !', 'পণ্য ও সরবরাহকারীর মিল নেই!'),
(354, 'if_you_update_purchase_first_select_supplier_then_product_and_then_quantity', 'If you update purchase,first select supplier then product and then update qnty.', 'পণ্য ও সরবরাহকারীর মিল নেই!. '),
(355, 'item', 'Item', 'আইটেম'),
(356, 'manage_your_credit_customer', 'Manage your credit customer', 'আপনার ক্রেডিট গ্রাহক পরিচালনা করুন'),
(357, 'total_quantity', 'Total Quantity', 'মোট পরিমাণ'),
(358, 'quantity_per_cartoon', 'Quantity per cartoon', 'কার্টুন প্রতি পরিমাণ'),
(359, 'barcode_qrcode_scan_here', 'Barcode or QR-code scan here', 'বারকোড বা QR-কোড এখানে স্ক্যান করুন'),
(360, 'synchronizer_setting', 'Synchronizer Setting', 'সিঙ্ক্রোনাইজার সেটিং'),
(361, 'data_synchronizer', 'Data Synchronizer', 'ডেটা সিঙ্ক্রোনাইজার'),
(362, 'hostname', 'Host name', 'হোস্টের নাম'),
(363, 'username', 'User Name', 'ব্যবহারকারীর নাম'),
(364, 'ftp_port', 'FTP Port', 'FTP পোর্ট'),
(365, 'ftp_debug', 'FTP Debug', 'FTP ডিবাগ'),
(366, 'project_root', 'Project Root', 'প্রকল্প রুট'),
(367, 'please_try_again', 'Please try again', 'অনুগ্রহপূর্বক আবার চেষ্টা করুন'),
(368, 'save_successfully', 'Saved successfully', 'সফলভাবে সংরক্ষিত'),
(369, 'synchronize', 'Synchronize', 'সিঙ্ক্রোনাইজ করুন'),
(370, 'internet_connection', 'Internet Connection', 'ইন্টারনেট সংযোগ'),
(371, 'outgoing_file', 'Outgoing File', 'বহির্গামী ফাইল'),
(372, 'incoming_file', 'Incoming File', 'ইনকামিং ফাইল'),
(373, 'ok', 'Ok', 'ঠিক আছে'),
(374, 'not_available', 'Not Available', 'পাওয়া যায় না'),
(375, 'available', 'Available', 'পাওয়া যায়'),
(376, 'download_data_from_server', 'Download data from server', 'সার্ভার থেকে ডাটা ডাউনলোড করুন'),
(377, 'data_import_to_database', 'Data import to database', 'ডাটাবেসে ডেটা আমদানি'),
(378, 'data_upload_to_server', 'Data uplod to server', 'সার্ভারে ডেটা আপলোড'),
(379, 'please_wait', 'Please Wait', 'অনুগ্রহপূর্বক অপেক্ষা করুন'),
(380, 'ooops_something_went_wrong', 'Oooops Something went wrong !', 'উফফ কিছু ভুল হয়েছে!'),
(381, 'upload_successfully', 'Uploaded successfully', 'সফলভাবে আপলোড করা হয়েছে৷'),
(382, 'unable_to_upload_file_please_check_configuration', 'Unable to upload file please check configuration', 'ফাইল আপলোড করতে অক্ষম দয়া করে কনফিগারেশন চেক করুন'),
(383, 'please_configure_synchronizer_settings', 'Please configure synchronizer settings', 'অনুগ্রহ করে সিঙ্ক্রোনাইজার সেটিংস কনফিগার করুন৷'),
(384, 'download_successfully', 'Download successfully', 'সফলভাবে ডাউনলোড করুন'),
(385, 'unable_to_download_file_please_check_configuration', 'Unable to download file please check configuration', 'ফাইল ডাউনলোড করতে অক্ষম অনুগ্রহ করে কনফিগারেশন চেক করুন'),
(386, 'data_import_first', 'Data import past', 'ডেটা আমদানি অতীত'),
(387, 'data_import_successfully', 'Data import successfully', 'ডেটা আমদানি সফলভাবে'),
(388, 'unable_to_import_data_please_check_config_or_sql_file', 'Unable to import data please check config or sql file', 'ডেটা আমদানি করতে অক্ষম অনুগ্রহ করে কনফিগার বা sql ফাইল চেক করুন'),
(389, 'total_sale_ctn', 'Total Sale Ctn', 'মোট বিক্রয় Ctn'),
(390, 'in_qnty', 'In Qnty.', 'ইন কোয়ান্টিটি'),
(391, 'out_qnty', 'Out Qnty', 'আউট কোয়ান্টিটি'),
(392, 'stock_report_supplier_wise', 'Stock Report (Supplier Wise)', 'স্টক রিপোর্ট (সরবরাহকারী অনুযায়ী)'),
(393, 'all_stock_report_supplier_wise', 'Stock Report (Suppler Wise)', 'স্টক রিপোর্ট (সাপ্লার ওয়াইজ)'),
(394, 'select_supplier', 'Select Supplier', 'সরবরাহকারী নির্বাচন করুন'),
(395, 'stock_report_product_wise', 'Stock Report (Product Wise)', 'স্টক রিপোর্ট (পণ্য অনুযায়ী)'),
(396, 'phone', 'Phone', 'ফোন'),
(397, 'select_product', 'Select Product', 'পণ্য নির্বাচন করুন'),
(398, 'in_quantity', 'In Qnty.', 'পণ্য নির্বাচন করুন. '),
(399, 'out_quantity', 'Out Qnty', 'আউট কোয়ান্টিটি'),
(400, 'in_taka', 'In TK', 'টাকায়'),
(401, 'out_taka', 'Out TK', 'আউট TK'),
(402, 'commission', 'Commission', 'কমিশন'),
(403, 'generate_commission', 'Generate Commssion', 'কমিশন তৈরি করুন'),
(404, 'commission_rate', 'Commission Rate', 'কমিশন হার'),
(405, 'total_ctn', 'Total Ctn.', 'কমিশন হার. '),
(406, 'per_pcs_commission', 'Per PCS Commission', 'প্রতি পিসিএস কমিশন'),
(407, 'total_commission', 'Total Commission', 'মোট কমিশন'),
(408, 'enter', 'Enter', 'প্রবেশ করুন'),
(409, 'please_add_walking_customer_for_default_customer', 'Please add \'Walking Customer\' for default customer.', 'প্রবেশ করুন. '),
(410, 'supplier_ammount', 'Supplier Amount', 'সরবরাহকারীর পরিমাণ'),
(411, 'my_sale_ammount', 'My Sale Amount', 'আমার বিক্রয় পরিমাণ'),
(412, 'signature_pic', 'Signature Picture', 'স্বাক্ষর ছবি'),
(413, 'branch', 'Branch', 'শাখা'),
(414, 'ac_no', 'A/C Number', 'A/C নম্বর'),
(415, 'ac_name', 'A/C Name', 'A/C নাম'),
(416, 'bank_transaction', 'Bank Transaction', 'ব্যাংক লেনদেন'),
(417, 'bank', 'Bank', 'ব্যাংক'),
(418, 'withdraw_deposite_id', 'Withdraw / Deposite ID', 'ID প্রত্যাহার / জমা দিন'),
(419, 'bank_ledger', 'Bank Ledger', 'ব্যাংক লেজার'),
(420, 'note_name', 'Note Name', 'নোট নাম'),
(421, 'pcs', 'Pcs.', 'নোট নাম. '),
(422, '1', '1', '1'),
(423, '2', '2', '2'),
(424, '5', '5', '5'),
(425, '10', '10', '10'),
(426, '20', '20', '20'),
(427, '50', '50', '50'),
(428, '100', '100', '100'),
(429, '500', '500', '500'),
(430, '1000', '1000', '1000'),
(431, 'total_discount', 'Total Discount', 'মোট ডিসকাউন্ট'),
(432, 'product_not_found', 'Product not found !', 'পণ্য পাওয়া যায়নি!'),
(433, 'this_is_not_credit_customer', 'This is not credit customer !', 'এই ক্রেডিট গ্রাহক নয়!'),
(434, 'personal_loan', 'Personal Loan', 'ব্যক্তিগত ঋণ'),
(435, 'add_person', 'Add Person', 'ব্যক্তি যোগ করুন'),
(436, 'add_loan', 'Add Loan', 'ঋণ যোগ করুন'),
(437, 'add_payment', 'Add Payment', 'পেমেন্ট যোগ করুন'),
(438, 'manage_person', 'Manage Person', 'ব্যক্তি পরিচালনা করুন'),
(439, 'personal_edit', 'Person Edit', 'ব্যক্তি সম্পাদনা'),
(440, 'person_ledger', 'Person Ledger', 'ব্যক্তি খাতা'),
(441, 'backup_restore', 'Backup ', 'ব্যাকআপ'),
(442, 'database_backup', 'Database backup', 'ডাটাবেস ব্যাকআপ'),
(443, 'file_information', 'File information', 'ফাইল তথ্য'),
(444, 'filename', 'Filename', 'ফাইলের নাম'),
(445, 'size', 'Size', 'আকার'),
(446, 'backup_date', 'Backup date', 'ব্যাকআপ তারিখ'),
(447, 'backup_now', 'Backup now', 'এখনি ব্যাকআপ করে নিন'),
(448, 'restore_now', 'Restore now', 'এখন পুনরুদ্ধার করুন'),
(449, 'are_you_sure', 'Are you sure ?', 'তুমি কি নিশ্চিত ?'),
(450, 'download', 'Download', 'ডাউনলোড করুন'),
(451, 'backup_and_restore', 'Backup', 'ব্যাকআপ'),
(452, 'backup_successfully', 'Backup successfully', 'সফলভাবে ব্যাকআপ'),
(453, 'delete_successfully', 'Deleted Successfully', 'সফলভাবে মুছে ফেলা হয়েছে৷'),
(454, 'stock_ctn', 'Stock/Qty', 'স্টক/পরিমাণ'),
(455, 'unit', 'Unit', 'ইউনিট'),
(456, 'meter_m', 'Meter (M)', 'মিটার (M)'),
(457, 'piece_pc', 'Piece (Pc)', 'টুকরা (পিসি)'),
(458, 'kilogram_kg', 'Kilogram (Kg)', 'কিলোগ্রাম (কেজি)'),
(459, 'stock_cartoon', 'Stock Cartoon', 'স্টক কার্টুন'),
(460, 'add_product_csv', 'Add Product (CSV)', 'পণ্য যোগ করুন (CSV)'),
(461, 'import_product_csv', 'Import product (CSV)', 'আমদানি পণ্য (CSV)'),
(462, 'close', 'Close', 'বন্ধ'),
(463, 'download_example_file', 'Download example file.', 'বন্ধ. '),
(464, 'upload_csv_file', 'Upload CSV File', 'CSV ফাইল আপলোড করুন'),
(465, 'csv_file_informaion', 'CSV File Information', 'CSV ফাইলের তথ্য'),
(466, 'out_of_stock', 'Out Of Stock', 'স্টক আউট'),
(467, 'others', 'Others', 'অন্যান্য'),
(468, 'full_paid', 'Full Paid', 'ফুল পেইড'),
(469, 'successfully_saved', 'Your Data Successfully Saved', 'আপনার ডেটা সফলভাবে সংরক্ষিত হয়েছে৷'),
(470, 'manage_loan', 'Manage Loan', 'ঋণ পরিচালনা করুন'),
(471, 'receipt', 'Receipt', 'প্রাপ্তি'),
(472, 'payment', 'Payment', 'পেমেন্ট'),
(473, 'cashflow', 'Daily Cash Flow', 'দৈনিক নগদ প্রবাহ'),
(474, 'signature', 'Signature', 'স্বাক্ষর'),
(475, 'supplier_reports', 'Supplier Reports', 'সরবরাহকারী রিপোর্ট'),
(476, 'generate', 'Generate', 'তৈরি করুন'),
(477, 'todays_overview', 'Todays Overview', 'আজকের ওভারভিউ'),
(478, 'last_sales', 'Last Sales', 'শেষ বিক্রয়'),
(479, 'manage_transaction', 'Manage Transaction', 'লেনদেন পরিচালনা করুন'),
(480, 'daily_summary', 'Daily Summary', 'দৈনিক সারাংশ'),
(481, 'daily_cash_flow', 'Daily Cash Flow', 'দৈনিক নগদ প্রবাহ'),
(482, 'custom_report', 'Custom Report', 'কাস্টম রিপোর্ট'),
(483, 'transaction', 'Transaction', 'লেনদেন'),
(484, 'receipt_amount', 'Receipt Amount', 'গৃহীত পরিমান'),
(485, 'transaction_details_datewise', 'Transaction Details Datewise', 'তারিখ অনুযায়ী লেনদেনের বিবরণ'),
(486, 'cash_closing', 'Cash Closing', 'নগদ বন্ধ'),
(487, 'you_can_not_buy_greater_than_available_qnty', 'You can not buy greater than available qnty.', 'নগদ বন্ধ. '),
(488, 'supplier_id', 'Supplier ID', 'সরবরাহকারী আইডি'),
(489, 'category_id', 'Category ID', 'বিভাগ আইডি'),
(490, 'select_report', 'Select Report', 'প্রতিবেদন নির্বাচন করুন'),
(491, 'supplier_summary', 'Supplier summary', 'সরবরাহকারীর সারাংশ'),
(492, 'sales_payment_actual', 'Sales payment actual', 'বিক্রয় পেমেন্ট প্রকৃত'),
(493, 'today_already_closed', 'Today already closed.', 'বিক্রয় পেমেন্ট প্রকৃত. '),
(494, 'root_account', 'Root Account', 'রুট অ্যাকাউন্ট'),
(495, 'office', 'Office', 'দপ্তর'),
(496, 'loan', 'Loan', 'ঋণ'),
(497, 'transaction_mood', 'Transaction Mood', 'লেনদেনের মেজাজ'),
(498, 'select_account', 'Select Account', 'নির্বাচন অ্যাকাউন্ট'),
(499, 'add_receipt', 'Add Receipt', 'রসিদ যোগ করুন'),
(500, 'update_transaction', 'Update Transaction', 'লেনদেন আপডেট করুন'),
(501, 'no_stock_found', 'No Stock Found !', 'কোন স্টক পাওয়া যায়নি!'),
(502, 'admin_login_area', 'Admin Login Area', 'অ্যাডমিন লগইন এলাকা'),
(503, 'print_qr_code', 'Print QR Code', 'QR কোড প্রিন্ট করুন'),
(504, 'discount_type', 'Discount Type', 'ডিসকাউন্ট টাইপ'),
(505, 'discount_percentage', 'Discount', 'ছাড়'),
(506, 'fixed_dis', 'Fixed Dis.', 'ছাড়. '),
(507, 'return', 'Return', 'প্রত্যাবর্তন'),
(508, 'stock_return_list', 'Stock Return List', 'স্টক রিটার্ন তালিকা'),
(509, 'wastage_return_list', 'Wastage Return List', 'অপব্যয় রিটার্ন তালিকা'),
(510, 'return_invoice', 'Sale Return', 'বিক্রয় রিটার্ন'),
(511, 'sold_qty', 'Sold Qty', 'বিক্রির পরিমাণ'),
(512, 'ret_quantity', 'Return Qty', 'পরিমাণ রিটার্ন'),
(513, 'deduction', 'Deduction', 'ডিডাকশন'),
(514, 'check_return', 'Check Return', 'রিটার্ন চেক করুন'),
(515, 'reason', 'Reason', 'কারণ'),
(516, 'usablilties', 'Usability', 'ব্যবহারযোগ্যতা'),
(517, 'adjs_with_stck', 'Adjust With Stock', 'স্টকের সাথে সামঞ্জস্য করুন'),
(518, 'return_to_supplier', 'Return To Supplier', 'সরবরাহকারীর কাছে ফিরে যান'),
(519, 'wastage', 'Wastage', 'অপচয়'),
(520, 'to_deduction', 'Total Deduction ', 'মোট ডিডাকশন'),
(521, 'nt_return', 'Net Return Amount', 'নেট রিটার্ন পরিমাণ'),
(522, 'return_list', 'Return List', 'ফিরতি তালিকা'),
(523, 'add_return', 'Add Return', 'রিটার্ন যোগ করুন'),
(524, 'per_qty', 'Purchase Qty', 'ক্রয় পরিমাণ'),
(525, 'return_supplier', 'Supplier Return', 'সরবরাহকারী রিটার্ন'),
(526, 'stock_purchase', 'Stock Purchase Price', 'স্টক ক্রয় মূল্য'),
(527, 'stock_sale', 'Stock Sale Price', 'স্টক বিক্রয় মূল্য'),
(528, 'supplier_return', 'Supplier Return', 'সরবরাহকারী রিটার্ন'),
(529, 'purchase_id', 'Purchase ID', 'আইডি ক্রয় করুন'),
(530, 'return_id', 'Return ID', 'রিটার্ন আইডি'),
(531, 'supplier_return_list', 'Supplier Return List', 'সরবরাহকারী রিটার্ন তালিকা'),
(532, 'c_r_slist', 'Stock Return Stock', 'স্টক রিটার্ন স্টক'),
(533, 'wastage_list', 'Wastage List', 'অপচয়ের তালিকা'),
(534, 'please_input_correct_invoice_id', 'Please Input a Correct Sale ID', 'অনুগ্রহ করে একটি সঠিক বিক্রয় আইডি ইনপুট করুন'),
(535, 'please_input_correct_purchase_id', 'Please Input Your Correct  Purchase ID', 'অনুগ্রহ করে আপনার সঠিক ক্রয় আইডি ইনপুট করুন'),
(536, 'add_more', 'Add More', 'আরো যোগ করো'),
(537, 'prouct_details', 'Product Details', 'পণ্যের বিবরণ'),
(538, 'prouct_detail', 'Product Details', 'পণ্যের বিবরণ'),
(539, 'stock_return', 'Stock Return', 'স্টক রিটার্ন'),
(540, 'choose_transaction', 'Select Transaction', 'লেনদেন নির্বাচন করুন'),
(541, 'transection_category', 'Select  Category', 'বিভাগ নির্বাচন করুন'),
(542, 'transaction_categry', 'Select Category', 'বিভাগ নির্বাচন করুন'),
(543, 'search_supplier', 'Search Supplier', 'অনুসন্ধান সরবরাহকারী'),
(544, 'customer_id', 'Customer ID', 'গ্রাহক আইডি'),
(545, 'search_customer', 'Search Customer Invoice', 'গ্রাহক চালান অনুসন্ধান করুন'),
(546, 'serial_no', 'SN', 'এসএন'),
(547, 'item_discount', 'Item Discount', 'আইটেম ডিসকাউন্ট'),
(548, 'invoice_discount', 'Sale Discount', 'বিক্রয় ডিসকাউন্ট'),
(549, 'add_unit', 'Add Unit', 'ইউনিট যোগ করুন'),
(550, 'manage_unit', 'Manage Unit', 'ইউনিট পরিচালনা করুন'),
(551, 'add_new_unit', 'Add New Unit', 'নতুন ইউনিট যোগ করুন'),
(552, 'unit_name', 'Unit Name', 'এককের নাম'),
(553, 'payment_amount', 'Payment Amount', 'পরিশোধিত অর্থ'),
(554, 'manage_your_unit', 'Manage Your Unit', 'আপনার ইউনিট পরিচালনা করুন'),
(555, 'unit_id', 'Unit ID', 'ইউনিট আইডি'),
(556, 'unit_edit', 'Unit Edit', 'ইউনিট সম্পাদনা'),
(557, 'vat', 'Vat', 'ভ্যাট'),
(558, 'sales_report_category_wise', 'Sales Report (Category wise)', 'বিক্রয় প্রতিবেদন (বিভাগ অনুযায়ী)'),
(559, 'purchase_report_category_wise', 'Purchase Report (Category wise)', 'ক্রয় প্রতিবেদন (বিভাগ অনুযায়ী)'),
(560, 'category_wise_purchase_report', 'Category wise purchase report', 'বিভাগ অনুযায়ী ক্রয় রিপোর্ট'),
(561, 'category_wise_sales_report', 'Category wise sales report', 'বিভাগ অনুযায়ী বিক্রয় রিপোর্ট'),
(562, 'best_sale_product', 'Best Sale Product', 'সেরা বিক্রয় পণ্য'),
(563, 'all_best_sales_product', 'All Best Sales Products', 'সব সেরা বিক্রয় পণ্য'),
(564, 'todays_customer_receipt', 'Todays Customer Receipt', 'আজকের গ্রাহক রসিদ'),
(565, 'not_found', 'Record not found', 'রেকর্ড পাওয়া যায়নি'),
(566, 'collection', 'Collection', 'সংগ্রহ'),
(567, 'increment', 'Increment', 'বৃদ্ধি'),
(568, 'accounts_tree_view', 'Accounts Tree View', 'অ্যাকাউন্টস ট্রি ভিউ'),
(569, 'debit_voucher', 'Debit Voucher', 'ডেবিট ভাউচার'),
(570, 'voucher_no', 'Voucher No', 'ভাউচার নং'),
(571, 'credit_account_head', 'Credit Account Head', 'ক্রেডিট অ্যাকাউন্ট প্রধান'),
(572, 'remark', 'Remark', 'মন্তব্য'),
(573, 'code', 'Code', 'কোড'),
(574, 'amount', 'Amount', 'পরিমাণ'),
(575, 'approved', 'Approved', 'অনুমোদিত'),
(576, 'debit_account_head', 'Debit Account Head', 'ডেবিট অ্যাকাউন্ট প্রধান'),
(577, 'credit_voucher', 'Credit Voucher', 'ক্রেডিট ভাউচার'),
(578, 'find', 'Find', 'অনুসন্ধান'),
(579, 'transaction_date', 'Transaction Date', 'লেনদেন তারিখ'),
(580, 'voucher_type', 'Voucher Type', 'ভাউচারের ধরন'),
(581, 'particulars', 'Particulars', 'বিশেষ'),
(582, 'with_details', 'With Details', 'বিস্তারিত সহ'),
(583, 'general_ledger', 'General Ledger', 'জেনারেল লেজার'),
(584, 'general_ledger_of', 'General ledger of', 'এর সাধারণ খাতা'),
(585, 'pre_balance', 'Pre Balance', 'প্রাক ব্যালেন্স'),
(586, 'current_balance', 'Current Balance', 'বর্তমান হিসাব'),
(587, 'to_date', 'To Date', 'এখন পর্যন্ত'),
(588, 'from_date', 'From Date', 'তারিখ হইতে'),
(589, 'trial_balance', 'Trial Balance', 'ট্রায়াল ব্যালেন্স'),
(590, 'authorized_signature', 'Authorized Signature', 'অনুমোদিত স্বাক্ষর'),
(591, 'chairman', 'Chairman', 'চেয়ারম্যান'),
(592, 'total_income', 'Total Income', 'মোট আয়'),
(593, 'statement_of_comprehensive_income', 'Statement of Comprehensive Income', 'ব্যাপক আয় বিবৃতি'),
(594, 'profit_loss', 'Profit Loss', 'লাভ ক্ষতি'),
(595, 'cash_flow_report', 'Cash Flow Report', 'নগদ প্রবাহ রিপোর্ট'),
(596, 'cash_flow_statement', 'Cash Flow Statement', 'ক্যাশ ফ্লো স্টেটমেন্ট'),
(597, 'amount_in_dollar', 'Amount In Dollar', 'ডলারে পরিমাণ'),
(598, 'opening_cash_and_equivalent', 'Opening Cash and Equivalent', 'নগদ ও সমতুল্য খোলা'),
(599, 'coa_print', 'Coa Print', 'Coa প্রিন্ট'),
(600, 'cash_flow', 'Cash Flow', 'নগদ প্রবাহ'),
(601, 'cash_book', 'Cash Book', 'নগদ বই'),
(602, 'bank_book', 'Bank Book', 'ব্যাংক বই'),
(603, 'c_o_a', 'Chart of Account', 'অ্যাকাউন্ট চার্ট'),
(604, 'journal_voucher', 'Journal Voucher', 'জার্নাল ভাউচার'),
(605, 'contra_voucher', 'Contra Voucher', 'কন্ট্রা ভাউচার'),
(606, 'voucher_approval', 'Vouchar Approval', 'ভাউচার অনুমোদন'),
(607, 'supplier_payment', 'Supplier Payment', 'সরবরাহকারী পেমেন্ট'),
(608, 'customer_receive', 'Customer Receive', 'গ্রাহক রিসিভ'),
(609, 'gl_head', 'General Head', 'জেনারেল হেড'),
(610, 'account_code', 'Account Head', 'হিসাব প্রধান'),
(611, 'opening_balance', 'Opening Balance', 'ওপেনিং ব্যালেন্স'),
(612, 'head_of_account', 'Head of Account', 'অ্যাকাউন্টের প্রধান'),
(613, 'inventory_ledger', 'Inventory Ledger', 'ইনভেন্টরি লেজার'),
(614, 'newpassword', 'New Password', 'নতুন পাসওয়ার্ড'),
(615, 'password_recovery', 'Password Recovery', 'পাসওয়ার্ড পুনরুদ্ধার'),
(616, 'forgot_password', 'Forgot Password ??', 'পাসওয়ার্ড ভুলে গেছেন ??'),
(617, 'send', 'Send', 'পাঠান'),
(618, 'due_report', 'Due Report', 'ডিউ রিপোর্ট'),
(619, 'due_amount', 'Due Amount', 'বাকি টাকা'),
(620, 'download_sample_file', 'Download Sample File', 'নমুনা ফাইল ডাউনলোড করুন'),
(621, 'customer_csv_upload', 'Customer Csv Upload', 'গ্রাহক Csv আপলোড'),
(622, 'csv_supplier', 'Csv Upload Supplier', 'Csv আপলোড সরবরাহকারী'),
(623, 'csv_upload_supplier', 'Csv Upload Supplier', 'Csv আপলোড সরবরাহকারী'),
(624, 'previous', 'Previous', 'আগে'),
(625, 'net_total', 'Net Total', 'সর্বমোট'),
(626, 'currency_list', 'Currency List', 'মুদ্রা তালিকা'),
(627, 'currency_name', 'Currency Name', 'মুদ্রার নাম'),
(628, 'currency_icon', 'Currency Symbol', 'মুদ্রার প্রতীক'),
(629, 'add_currency', 'Add Currency', 'মুদ্রা যোগ করুন'),
(630, 'role_permission', 'Role Permission', 'ভূমিকা অনুমতি'),
(631, 'role_list', 'Role List', 'ভূমিকা তালিকা'),
(632, 'user_assign_role', 'User Assign Role', 'ইউজার অ্যাসাইন রোল'),
(633, 'permission', 'Permission', 'অনুমতি'),
(634, 'add_role', 'Add Role', 'ভূমিকা যোগ করুন'),
(635, 'add_module', 'Add Module', 'মডিউল যোগ করুন'),
(636, 'module_name', 'Module Name', 'মডিউল নাম'),
(637, 'office_loan', 'Office Loan', 'অফিস লোন'),
(638, 'add_menu', 'Add Menu', 'মেনু যোগ করুন'),
(639, 'menu_name', 'Menu Name', 'মেনু নাম'),
(640, 'sl_no', 'Sl No', 'নং'),
(641, 'create', 'Create', 'সৃষ্টি'),
(642, 'read', 'Read', 'পড়ুন'),
(643, 'role_name', 'Role Name', 'নামভূমিকা'),
(644, 'qty', 'Quantity', 'পরিমাণ'),
(645, 'max_rate', 'Max Rate', 'সর্বোচ্চ হার'),
(646, 'min_rate', 'Min Rate', 'ন্যূনতম হার'),
(647, 'avg_rate', 'Average Rate', 'গড় হার'),
(648, 'role_permission_added_successfully', 'Role Permission Successfully Added', 'ভূমিকার অনুমতি সফলভাবে যোগ করা হয়েছে৷'),
(649, 'update_successfully', 'Updated Successfully', 'সফলভাবে আপডেট করা হয়েছে৷'),
(650, 'role_permission_updated_successfully', 'Role Permission Successfully Updated ', 'ভূমিকার অনুমতি সফলভাবে আপডেট করা হয়েছে৷'),
(651, 'shipping_cost', 'Shipping Cost', 'শিপিং খরচ'),
(652, 'in_word', 'In Word ', 'শব্দে'),
(653, 'shipping_cost_report', 'Shipping Cost Report', 'শিপিং খরচ রিপোর্ট'),
(654, 'cash_book_report', 'Cash Book Report', 'নগদ বই রিপোর্ট'),
(655, 'inventory_ledger_report', 'Inventory Ledger Report', 'ইনভেন্টরি লেজার রিপোর্ট'),
(656, 'trial_balance_with_opening_as_on', 'Trial Balance With Opening As On', 'চালু হিসাবে খোলার সাথে ট্রায়াল ব্যালেন্স'),
(657, 'type', 'Type', 'টাইপ'),
(658, 'taka_only', 'Taka Only', 'টাকা মাত্র'),
(659, 'item_description', 'Desc', 'বর্ণনা'),
(660, 'sold_by', 'Sold By', 'বিক্রিত'),
(661, 'user_wise_sales_report', 'User Wise Sales Report', 'ইউজার ওয়াইজ সেলস রিপোর্ট'),
(662, 'user_name', 'User Name', 'ব্যবহারকারীর নাম'),
(663, 'total_sold', 'Total Sold', 'মোট বিক্রি'),
(664, 'user_wise_sale_report', 'User Wise Sales Report', 'ইউজার ওয়াইজ সেলস রিপোর্ট'),
(665, 'barcode_or_qrcode', 'Barcode/QR-code', 'বারকোড/QR-কোড'),
(666, 'category_csv_upload', 'Category Csv  Upload', 'বিভাগ Csv আপলোড'),
(667, 'unit_csv_upload', 'Unit Csv Upload', 'ইউনিট Csv আপলোড'),
(668, 'invoice_return_list', 'Sales Return list', 'বিক্রয় রিটার্ন তালিকা'),
(669, 'invoice_return', 'Sales Return', 'বিক্রয় রিটার্ন'),
(670, 'tax_report', 'TAX Report', 'ট্যাক্স রিপোর্ট'),
(671, 'select_tax', 'Select TAX', 'TAX নির্বাচন করুন'),
(672, 'hrm', 'HRM', 'এইচআরএম'),
(673, 'employee', 'Employee', 'কর্মচারী'),
(674, 'add_employee', 'Add Employee', 'কর্মচারী যোগ করুন'),
(675, 'manage_employee', 'Manage Employee', 'কর্মচারী পরিচালনা করুন'),
(676, 'attendance', 'Attendance', 'উপস্থিতি'),
(677, 'add_attendance', 'Attendance', 'উপস্থিতি'),
(678, 'manage_attendance', 'Manage Attendance', 'উপস্থিতি পরিচালনা করুন'),
(679, 'payroll', 'Payroll', 'বেতন'),
(680, 'add_payroll', 'Payroll', 'বেতন'),
(681, 'manage_payroll', 'Manage Payroll', 'বেতন পরিচালনা করুন'),
(682, 'employee_type', 'Employee Type', 'কর্মচারীর ধরন'),
(683, 'employee_designation', 'Employee Designation', 'কর্মচারী পদবি'),
(684, 'designation', 'Designation', 'উপাধি'),
(685, 'add_designation', 'Add Designation', 'পদবী যোগ করুন'),
(686, 'manage_designation', 'Manage Designation', 'পদবী পরিচালনা করুন'),
(687, 'designation_update_form', 'Designation Update form', 'পদবী আপডেট ফর্ম'),
(688, 'picture', 'Picture', 'ছবি'),
(689, 'country', 'Country', 'দেশ'),
(690, 'blood_group', 'Blood Group', 'রক্তের গ্রুপ'),
(691, 'address_line_1', 'Address Line 1', 'ঠিকানা লাইন 1'),
(692, 'address_line_2', 'Address Line 2', 'ঠিকানা লাইন ২'),
(693, 'zip', 'Zip code', 'জিপ কোড'),
(694, 'city', 'City', 'শহর'),
(695, 'hour_rate_or_salary', 'Houre Rate/Salary', 'ঘন্টার হার/বেতন'),
(696, 'rate_type', 'Rate Type', 'হারের ধরন'),
(697, 'hourly', 'Hourly', 'ঘণ্টায়'),
(698, 'salary', 'Salary', 'বেতন'),
(699, 'employee_update', 'Employee Update', 'কর্মচারী আপডেট'),
(700, 'checkin', 'Check In', 'চেক ইন'),
(701, 'employee_name', 'Employee Name', 'কর্মকর্তার নাম'),
(702, 'checkout', 'Check Out', 'চেক আউট'),
(703, 'confirm_clock', 'Confirm Clock', 'ঘড়ি নিশ্চিত করুন'),
(704, 'stay', 'Stay Time', 'থাকার সময়'),
(705, 'sign_in', 'Sign In', 'সাইন ইন করুন'),
(706, 'check_in', 'Check In', 'চেক ইন'),
(707, 'single_checkin', 'Single Check In', 'একক চেক ইন'),
(708, 'bulk_checkin', 'Bulk Check In', 'বাল্ক চেক ইন'),
(709, 'successfully_checkout', 'Successfully Checkout', 'সফলভাবে চেকআউট'),
(710, 'attendance_report', 'Attendance Report', 'উপস্থিতি রিপোর্ট'),
(711, 'datewise_report', 'Date Wise Report', 'তারিখ অনুযায়ী রিপোর্ট'),
(712, 'employee_wise_report', 'Employee Wise Report', 'কর্মচারী ওয়াইজ রিপোর্ট'),
(713, 'date_in_time_report', 'Date In Time Report', 'সময় রিপোর্ট তারিখ'),
(714, 'request', 'Request', 'অনুরোধ'),
(715, 'sign_out', 'Sign Out', 'সাইন আউট'),
(716, 'work_hour', 'Work Hours', 'কার্য ঘন্টা'),
(717, 's_time', 'Start Time', 'সময় শুরু'),
(718, 'e_time', 'In Time', 'সময়ের মধ্যে'),
(719, 'salary_benefits_type', 'Benefits Type', 'সুবিধার ধরন'),
(720, 'salary_benefits', 'Salary Benefits', 'বেতন সুবিধা'),
(721, 'beneficial_list', 'Benefit List', 'সুবিধার তালিকা'),
(722, 'add_beneficial', 'Add Benefits', 'সুবিধা যোগ করুন'),
(723, 'add_benefits', 'Add Benefits', 'সুবিধা যোগ করুন'),
(724, 'benefits_list', 'Benefit List', 'সুবিধার তালিকা'),
(725, 'benefit_type', 'Benefit Type', 'সুবিধার ধরন'),
(726, 'benefits', 'Benefit', 'সুবিধা'),
(727, 'manage_benefits', 'Manage Benefits', 'সুবিধাগুলি পরিচালনা করুন'),
(728, 'deduct', 'Deduct', 'কাটুন'),
(729, 'add', 'Add', 'যোগ করুন'),
(730, 'add_salary_setup', 'Add Salary Setup', 'বেতন সেটআপ যোগ করুন'),
(731, 'manage_salary_setup', 'Manage Salary Setup', 'বেতন সেটআপ পরিচালনা করুন'),
(732, 'basic', 'Basic', 'মৌলিক'),
(733, 'salary_type', 'Salary Type', 'বেতনের ধরন'),
(734, 'addition', 'Addition', 'সংযোজন'),
(735, 'gross_salary', 'Gross Salary', 'মোট বেতন'),
(736, 'set', 'Set', 'সেট'),
(737, 'salary_generate', 'Salary Generate', 'বেতন জেনারেট'),
(738, 'manage_salary_generate', 'Manage Salary Generate', 'বেতন জেনারেট পরিচালনা করুন'),
(739, 'sal_name', 'Salary Name', 'বেতনের নাম'),
(740, 'gdate', 'Generated Date', 'উত্পন্ন তারিখ'),
(741, 'generate_by', 'Generated By', 'দ্বারা উত্পন্ন'),
(742, 'the_salary_of', 'The Salary of ', 'এর বেতন'),
(743, 'already_generated', ' Already Generated', 'ইতিমধ্যে উত্পন্ন'),
(744, 'salary_month', 'Salary Month', 'বেতন মাস'),
(745, 'successfully_generated', 'Successfully Generated', 'সফলভাবে তৈরি'),
(746, 'salary_payment', 'Salary Payment', 'বেতন প্রদান'),
(747, 'employee_salary_payment', 'Employee Salary Payment', 'কর্মচারী বেতন প্রদান'),
(748, 'total_salary', 'Total Salary', 'মোট বেতন'),
(749, 'total_working_minutes', 'Total Working Hours', 'মোট কাজের ঘন্টা'),
(750, 'working_period', 'Working Period', 'কাজ সময়ের'),
(751, 'paid_by', 'Paid By', 'দ্বারা পরিশোধ করা হয়'),
(752, 'pay_now', 'Pay Now ', 'এখন পরিশোধ করুন'),
(753, 'confirm', 'Confirm', 'নিশ্চিত করুন'),
(754, 'successfully_paid', 'Successfully Paid', 'সফলভাবে অর্থপ্রদান করা হয়েছে'),
(755, 'add_incometax', 'Add Income TAX', 'ইনকাম ট্যাক্স যোগ করুন'),
(756, 'setup_tax', 'Setup TAX', 'ট্যাক্স সেটআপ করুন'),
(757, 'start_amount', 'Start Amount', 'শুরু পরিমাণ'),
(758, 'end_amount', 'End Amount', 'শেষ পরিমাণ'),
(759, 'tax_rate', 'TAX Rate', 'করের হার'),
(760, 'setup', 'Setup', 'সেটআপ'),
(761, 'manage_income_tax', 'Manage Income TAX', 'আয়কর পরিচালনা করুন'),
(762, 'income_tax_updateform', 'Income TAX Update form', 'আয়কর আপডেট ফর্ম'),
(763, 'positional_information', 'Positional Information', 'অবস্থানগত তথ্য'),
(764, 'personal_information', 'Personal Information', 'ব্যক্তিগত তথ্য'),
(765, 'timezone', 'Time Zone', 'সময় অঞ্চল'),
(766, 'sms', 'SMS', 'খুদেবার্তা'),
(767, 'sms_configure', 'SMS Configure', 'এসএমএস কনফিগার করুন'),
(768, 'url', 'URL', 'URL'),
(769, 'sender_id', 'Sender ID', 'প্রেরকের আইডি'),
(770, 'api_key', 'Api Key', 'Api কী'),
(771, 'gui_pos', 'GUI POS', 'GUI POS'),
(772, 'manage_service', 'Manage Service', 'পরিষেবা পরিচালনা করুন'),
(773, 'service', 'Service', 'সেবা'),
(774, 'add_service', 'Add Service', 'পরিষেবা যোগ করুন'),
(775, 'service_edit', 'Service Edit', 'পরিষেবা সম্পাদনা'),
(776, 'service_csv_upload', 'Service CSV Upload', 'পরিষেবা CSV আপলোড'),
(777, 'service_name', 'Service Name', 'কাজের নাম'),
(778, 'charge', 'Charge', 'চার্জ'),
(779, 'service_invoice', 'Service Invoice', 'পরিষেবা চালান'),
(780, 'service_discount', 'Service Discount', 'সার্ভিস ডিসকাউন্ট'),
(781, 'hanging_over', 'ETD', 'ইটিডি'),
(782, 'service_details', 'Service Details', 'পরিষেবার বিবরণ'),
(783, 'tax_settings', 'TAX Settings', 'ট্যাক্স সেটিংস'),
(784, 'default_value', 'Default Value', 'ডিফল্ট মান'),
(785, 'number_of_tax', 'Number of TAX', 'ট্যাক্সের সংখ্যা'),
(786, 'please_select_employee', 'Please Select Employee', 'অনুগ্রহ করে কর্মচারী নির্বাচন করুন'),
(787, 'manage_service_invoice', 'Manage Service Invoice', 'পরিষেবা চালান পরিচালনা করুন'),
(788, 'update_service_invoice', 'Update Service Invoice', 'সার্ভিস ইনভয়েস আপডেট করুন'),
(789, 'customer_wise_tax_report', 'Customer Wise TAX Report', 'কাস্টমার ওয়াইজ ট্যাক্স রিপোর্ট'),
(790, 'service_id', 'Service Id', 'সার্ভিস আইডি'),
(791, 'invoice_wise_tax_report', 'Invoice Wise TAX Report', 'চালান অনুযায়ী ট্যাক্স রিপোর্ট'),
(792, 'reg_no', 'Reg No', 'রেজি নং'),
(793, 'update_now', 'Update Now', 'এখন হালনাগাদ করুন'),
(794, 'import', 'Import', 'আমদানি'),
(795, 'add_expense_item', 'Add Expense Item', 'ব্যয় আইটেম যোগ করুন'),
(796, 'manage_expense_item', 'Manage Expense Item', 'ব্যয় আইটেম পরিচালনা করুন'),
(797, 'add_expense', 'Add Expense', 'খরচ যোগ করুন'),
(798, 'manage_expense', 'Manage Expense', 'ব্যয় পরিচালনা করুন'),
(799, 'expense_statement', 'Expense Statement', 'ব্যয় বিবরণী'),
(800, 'expense_type', 'Expense Type', 'ব্যয়ের ধরন'),
(801, 'expense_item_name', 'Expense Item Name', 'ব্যয় আইটেমের নাম'),
(802, 'stock_purchase_price', 'Stock Purchase Price', 'স্টক ক্রয় মূল্য'),
(803, 'purchase_price', 'Purchase Price', 'ক্রয় মূল্য'),
(804, 'customer_advance', 'Customer Advance', 'গ্রাহক অগ্রিম'),
(805, 'advance_type', 'Advance Type', 'অগ্রিম প্রকার'),
(806, 'restore', 'Restore', 'পুনরুদ্ধার করুন'),
(807, 'supplier_advance', 'Supplier Advance', 'সরবরাহকারী অগ্রিম'),
(808, 'please_input_correct_invoice_no', 'Please Input Correct Invoice NO', 'অনুগ্রহ করে সঠিক চালান নম্বর ইনপুট করুন'),
(809, 'backup', 'Back Up', 'ব্যাক আপ'),
(810, 'app_setting', 'App Settings', 'অ্যাপ সেটিংস'),
(811, 'local_server_url', 'Local Server Url', 'স্থানীয় সার্ভার ইউআরএল'),
(812, 'online_server_url', 'Online Server Url', 'অনলাইন সার্ভার ইউআরএল'),
(813, 'connet_url', 'Connected Hotspot Ip/url', 'সংযুক্ত হটস্পট আইপি/ইউআরএল'),
(814, 'update_your_app_setting', 'Update Your App Setting', 'আপনার অ্যাপ সেটিং আপডেট করুন'),
(815, 'select_category', 'Select Category', 'বিভাগ নির্বাচন করুন'),
(816, 'mini_invoice', 'Mini Invoice', 'মিনি চালান'),
(817, 'purchase_details', 'Purchase Details', 'ক্রয় বিবরণ'),
(818, 'disc', 'Dis %', 'ডিস %'),
(819, 'serial', 'Serial', 'সিরিয়াল'),
(820, 'transaction_head', 'Transaction Head', 'লেনদেন প্রধান'),
(821, 'transaction_type', 'Transaction Type', 'লেনদেন প্রকার'),
(822, 'return_details', 'Return Details', 'বিবরণ ফেরত'),
(823, 'return_to_customer', 'Return To Customer', 'গ্রাহকের কাছে ফিরে যান'),
(824, 'sales_and_purchase_report_summary', 'Sales And Purchase Report Summary', 'বিক্রয় এবং ক্রয় রিপোর্ট সারাংশ'),
(825, 'add_person_officeloan', 'Add Person (Office Loan)', 'ব্যক্তি যোগ করুন (অফিস লোন)'),
(826, 'add_loan_officeloan', 'Add Loan (Office Loan)', 'লোন যোগ করুন (অফিস লোন)'),
(827, 'add_payment_officeloan', 'Add Payment (Office Loan)', 'পেমেন্ট যোগ করুন (অফিস লোন)'),
(828, 'manage_loan_officeloan', 'Manage Loan (Office Loan)', 'লোন পরিচালনা করুন (অফিস লোন)'),
(829, 'add_person_personalloan', 'Add Person (Personal Loan)', 'ব্যক্তি যোগ করুন (ব্যক্তিগত ঋণ)'),
(830, 'add_loan_personalloan', 'Add Loan (Personal Loan)', 'ঋণ যোগ করুন (ব্যক্তিগত ঋণ)'),
(831, 'add_payment_personalloan', 'Add Payment (Personal Loan)', 'পেমেন্ট যোগ করুন (ব্যক্তিগত ঋণ)'),
(832, 'manage_loan_personalloan', 'Manage Loan (Personal)', 'লোন পরিচালনা করুন (ব্যক্তিগত)');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES
(833, 'hrm_management', 'Human Resource', 'মানব সম্পদ'),
(834, 'cash_adjustment', 'Cash Adjustment', 'নগদ সমন্বয়'),
(835, 'adjustment_type', 'Adjustment Type', 'সমন্বয়ের ধরন'),
(836, 'change', 'Change', 'পরিবর্তন'),
(837, 'sale_by', 'Sale By', 'দ্বারা বিক্রয়'),
(838, 'salary_date', 'Salary Date', 'বেতনের তারিখ'),
(839, 'earnings', 'Earnings', 'আয়'),
(840, 'total_addition', 'Total Addition', 'মোট সংযোজন'),
(841, 'total_deduction', 'Total Deduction', 'মোট ডিডাকশন'),
(842, 'net_salary', 'Net Salary', 'মোট বেতন'),
(843, 'ref_number', 'Reference Number', 'পরিচিত সংখ্যা'),
(844, 'name_of_bank', 'Name Of Bank', 'ব্যাংকের নাম'),
(845, 'salary_slip', 'Salary Slip', 'বেতন পিছলানো'),
(846, 'basic_salary', 'Basic Salary', 'মূল বেতন'),
(847, 'return_from_customer', 'Return From Customer', 'গ্রাহক থেকে ফিরে'),
(848, 'quotation', 'Quotation', 'উদ্ধৃতি'),
(849, 'add_quotation', 'Add Quotation', 'উদ্ধৃতি যোগ করুন'),
(850, 'manage_quotation', 'Manage Quotation', 'উদ্ধৃতি পরিচালনা করুন'),
(851, 'terms', 'Terms', 'শর্তাবলী'),
(852, 'send_to_customer', 'Sent To Customer', 'গ্রাহকের কাছে পাঠানো হয়েছে'),
(853, 'quotation_no', 'Quotation No', 'উদ্ধৃতি নং'),
(854, 'quotation_date', 'Quotation Date', 'উদ্ধৃতি তারিখ'),
(855, 'total_service_tax', 'Total Service TAX', 'মোট পরিষেবা ট্যাক্স'),
(856, 'totalservicedicount', 'Total Service Discount', 'মোট পরিষেবা ছাড়'),
(857, 'item_total', 'Item Total', 'আইটেম মোট'),
(858, 'service_total', 'Service Total', 'পরিষেবা মোট'),
(859, 'quot_description', 'Quotation Description', 'উদ্ধৃতি বর্ণনা'),
(860, 'sub_total', 'Sub Total', 'উপ মোট'),
(861, 'mail_setting', 'Mail Setting', 'মেইল সেটিং'),
(862, 'mail_configuration', 'Mail Configuration', 'মেইল কনফিগারেশন'),
(863, 'mail', 'Mail', 'মেইল'),
(864, 'protocol', 'Protocol', 'প্রোটোকল'),
(865, 'smtp_host', 'SMTP Host', 'SMTP হোস্ট'),
(866, 'smtp_port', 'SMTP Port', 'SMTP পোর্ট'),
(867, 'sender_mail', 'Sender Mail', 'প্রেরক মেইল'),
(868, 'mail_type', 'Mail Type', 'মেইলের ধরন'),
(869, 'html', 'HTML', 'এইচটিএমএল'),
(870, 'text', 'TEXT', 'টেক্সট'),
(871, 'expiry_date', 'Expiry Date', 'মেয়াদ শেষ হওয়ার তারিখ'),
(872, 'api_secret', 'Api Secret', 'অপি সিক্রেট'),
(873, 'please_config_your_mail_setting', NULL, 'en'),
(874, 'quotation_successfully_added', 'Quotation Successfully Added', 'উদ্ধৃতি সফলভাবে যোগ করা হয়েছে'),
(875, 'add_to_invoice', 'Add To Invoice', 'চালান যোগ করুন'),
(876, 'added_to_invoice', 'Added To Invoice', 'চালান যোগ করা হয়েছে'),
(877, 'closing_balance', 'Closing Balance', 'অর্থ শেষ'),
(878, 'contact', 'Contact', 'যোগাযোগ'),
(879, 'fax', 'Fax', 'ফ্যাক্স'),
(880, 'state', 'State', 'রাষ্ট্র'),
(881, 'discounts', 'Discount', 'ছাড়'),
(882, 'address1', 'Address1', 'ঠিকানা 1'),
(883, 'address2', 'Address2', 'ঠিকানা ২'),
(884, 'receive', 'Receive', 'গ্রহণ করুন'),
(885, 'purchase_history', 'Purchase History', 'ক্রয় ইতিহাস'),
(886, 'cash_payment', 'Cash Payment', 'নগদে টাকা প্রদান'),
(887, 'bank_payment', 'Bank Payment', 'ব্যাংক পেমেন্ট'),
(888, 'do_you_want_to_print', 'Do You Want to Print', 'আপনি কি মুদ্রণ করতে চান'),
(889, 'yes', 'Yes', 'হ্যাঁ'),
(890, 'no', 'No', 'না'),
(891, 'todays_sale', 'Today\'s Sales', 'আজকের বিক্রয়'),
(892, 'or', 'OR', 'বা'),
(893, 'no_result_found', 'No Result Found', 'কোন ফলাফল পাওয়া যায়নি'),
(894, 'add_service_quotation', 'Add Service Quotation', 'পরিষেবা উদ্ধৃতি যোগ করুন'),
(895, 'add_to_invoice', 'Add To Invoice', 'চালান যোগ করুন'),
(896, 'item_quotation', 'Item Quotation', 'আইটেম উদ্ধৃতি'),
(897, 'service_quotation', 'Service Quotation', 'পরিষেবা উদ্ধৃতি'),
(898, 'return_from', 'Return Form', 'রিটার্ন ফর্ম'),
(899, 'customer_return_list', 'Customer Return List', 'গ্রাহক রিটার্ন তালিকা'),
(900, 'pdf', 'Pdf', 'পিডিএফ'),
(901, 'note', 'Note', 'বিঃদ্রঃ'),
(902, 'update_debit_voucher', 'Update Debit Voucher', 'ডেবিট ভাউচার আপডেট করুন'),
(903, 'update_credit_voucher', 'Update Credit voucher', 'ক্রেডিট ভাউচার আপডেট করুন'),
(904, 'on', 'On', 'চালু'),
(905, '', '', 'en'),
(906, 'total_expenses', 'Total Expense', 'সর্বমোট খরচ'),
(907, 'already_exist', 'Already Exist', 'আগে থেকেই আছে'),
(908, 'checked_out', 'Checked Out', 'চেক আউট'),
(909, 'update_salary_setup', 'Update Salary Setup', 'বেতন সেটআপ আপডেট করুন'),
(910, 'employee_signature', 'Employee Signature', 'কর্মচারীর স্বাক্ষর'),
(911, 'payslip', 'Payslip', 'পেস্লিপ'),
(912, 'exsisting_role', 'Existing Role', 'বিদ্যমান ভূমিকা'),
(913, 'filter', 'Filter', 'ছাঁকনি'),
(914, 'testinput', NULL, 'en'),
(915, 'update_quotation', 'Update Quotation', 'উদ্ধৃতি আপডেট করুন'),
(916, 'quotation_successfully_updated', 'Quotation Successfully Updated', 'উদ্ধৃতি সফলভাবে আপডেট করা হয়েছে৷'),
(917, 'successfully_approved', 'Successfully Approved', 'সফলভাবে অনুমোদিত'),
(918, 'expiry', 'Expiry', 'মেয়াদ শেষ'),
(919, 'user_list', 'User List', 'ব্যবহারকারীর তালিকা'),
(920, 'assign_roleto_user', 'Assign Role To User', 'ব্যবহারকারীকে ভূমিকা বরাদ্দ করুন'),
(921, 'assign_role_list', 'Assigned Role List', 'বরাদ্দকৃত ভূমিকা তালিকা'),
(922, 'application_settings', 'Application Settings', 'আবেদন নির্ধারণ'),
(923, 'company_list', 'Company List', 'কোম্পানির তালিকা'),
(924, 'edit_company', 'Edit Company', 'কোম্পানি সম্পাদনা করুন'),
(925, 'edit_user', 'Edit User', 'ব্যবহারকারী সম্পাদনা করুন'),
(926, 'edit_currency', 'Edit Currency', 'মুদ্রা সম্পাদনা করুন'),
(927, 'mobile_no', 'Mobile No', 'মোবাইল নাম্বার'),
(928, 'email_address', 'Email Address', 'ইমেইল ঠিকানা'),
(929, 'customer_list', 'Customer List', 'গ্রাহক তালিকা'),
(930, 'advance_receipt', 'Advance Receipt', 'অগ্রিম রসিদ'),
(931, 'supplier_list', 'Supplier List', 'সরবরাহকারী তালিকা'),
(932, 'category_list', 'Category List', 'বিভাগ তালিকা'),
(933, 'no_record_found', 'No Record Found', 'পাওয়া কোন রেকর্ড'),
(934, 'unit_list', 'Unit List', 'ইউনিট তালিকা'),
(935, 'edit_product', 'Edit Product', 'পণ্য সম্পাদনা করুন'),
(936, 'payable_summary', 'Payable Summary', 'প্রদেয় সারাংশ'),
(937, 'pad_print', 'Pad Print', 'প্যাড মুদ্রণ'),
(938, 'pos_print', 'POS Print', 'POS প্রিন্ট'),
(939, 'pos_invoice', 'POS Invoice', 'POS চালান'),
(940, 'employee_profile', 'Employee Profile', 'কর্মচারী প্রোফাইল'),
(941, 'edit_beneficials', 'Edit Beneficials', 'উপকারিতা সম্পাদনা করুন'),
(942, 'edit_setup_update', 'Edit Salary Setup', 'বেতন সেটআপ সম্পাদনা করুন'),
(943, 'add_office_loan', 'Add Office Loan', 'অফিস লোন যোগ করুন'),
(944, 'income_tax', 'Income TAX', 'আয়কর'),
(945, 'quotation_to_sale', 'Quotation To Sale', 'বিক্রয়ের জন্য উদ্ধৃতি'),
(946, 'quotation_edit', 'Edit Quotation', 'উদ্ধৃতি সম্পাদনা করুন'),
(947, 'edit_profile', 'Edit Profile', 'জীবন বৃত্তান্ত সম্পাদনা'),
(948, 'edit_supplier', 'Edit Supplier', 'সরবরাহকারী সম্পাদনা করুন'),
(949, 'edit_bank', 'Edit Bank', 'ব্যাংক সম্পাদনা করুন'),
(950, 'balance_sheet', 'Balance Sheet', 'ব্যালেন্স শীট'),
(951, 'salary_setup', 'Salary Setup', 'বেতন সেটআপ'),
(952, 'account_head', 'Account Head', 'হিসাব প্রধান'),
(953, 'add_invoice', 'Add Invoice', 'চালান যোগ করুন'),
(954, 'general_ledger_report', 'General Ledger Report', 'সাধারণ লেজার রিপোর্ট'),
(955, 'print_setting', 'Print Setting', 'প্রিন্ট সেটিং'),
(956, 'header', 'Header', 'হেডার'),
(957, 'footer', 'Footer', 'ফুটার'),
(958, 'supplier_payment_receipt', 'Payment Receipt', 'প্রাপ্তি রশিদ'),
(959, 'welcome_back', 'Welcome Back', 'ফিরে আসার জন্য স্বাগতম'),
(960, 'overwrite', 'Over Write', 'ওভাররাইট করুন'),
(961, 'module', 'Module', 'মডিউল'),
(962, 'purchase_key', 'Purchase Key', 'ক্রয় কী'),
(963, 'buy_now', 'Buy Now', 'এখন কেন'),
(964, 'module_list', 'Module List', 'মডিউল তালিকা'),
(965, 'modules', 'Modules', 'মডিউল'),
(966, 'install', 'Install', 'ইনস্টল করুন'),
(967, 'uninstall', 'Uninstall', 'আনইনস্টল করুন'),
(968, 'module_added_successfully', 'Module Added Successfully', 'মডিউল সফলভাবে যোগ করা হয়েছে৷'),
(969, 'no_tables_are_registered_in_config', 'No table registered in config', 'কনফিগারে নিবন্ধিত কোনো টেবিল নেই'),
(970, 'tables_are_not_available_in_database', 'Table Are not Available in Database', 'ডাটাবেসে টেবিল পাওয়া যায় না'),
(971, 'addon', 'Add-ons', 'অ্যাড-অন'),
(972, 'generate_qr', 'Generate QR', 'QR তৈরি করুন'),
(973, 'latestv', 'Latest Version', 'সর্বশেষ সংস্করণ'),
(974, 'Current Version', NULL, 'en'),
(976, 'notesupdate', 'Note: If you want to update software,you Must have immediate previous version', 'দ্রষ্টব্য: আপনি যদি সফ্টওয়্যার আপডেট করতে চান তবে আপনার অবিলম্বে পূর্ববর্তী সংস্করণ থাকতে হবে'),
(977, 'arabic', NULL, 'en'),
(978, 'vat_no', 'VAT NO', 'কর নাম্বার'),
(979, 'new_p_method', 'Add New Payment Method', 'নতুন পেমেন্ট পদ্ধতি যোগ করুন'),
(980, 'dis_val', 'Dis. Amount', 'ডিসকাউন্ট মূল্য'),
(981, 'vat_val', 'VAT Value', 'ভ্যাট মান'),
(982, 'ttl_val', 'Total VAT', 'মোট ভ্যাট'),
(983, 'purchase_discount', 'Purchase Discount', 'ক্রয় ডিসকাউন্ট'),
(984, 'order_time', 'Order Time', 'অর্ডার করার সময়'),
(985, 'order_by', 'Order By', 'দ্বারা আদেশ'),
(986, 'terms_list', 'Sales Terms List', 'বিক্রয় শর্তাবলী তালিকা'),
(987, 'terms_add', 'Add Sales Terms', 'বিক্রয় শর্তাবলী যোগ করুন'),
(988, 'term_condi', 'Terms & Condition', 'বিধি - নিষেধ এবং শর্তাবলী'),
(989, 'terms_update', 'Update Seles Terms', 'সেলস শর্তাবলী আপডেট করুন'),
(990, 'add_payment_method', 'Add Payment Method', 'পেমেন্ট পদ্ধতি যোগ করুন'),
(991, 'payment_method_list', 'Payment Method List', 'পেমেন্ট পদ্ধতি তালিকা'),
(992, 'payment_method_name', 'Payment Method Name', 'পেমেন্ট পদ্ধতির নাম'),
(993, 'batch_no', 'Batch No', 'ব্যাচ নাম্বার'),
(994, 'total_with_vat', 'Total With VAT', 'ভ্যাট সহ মোট'),
(995, 'invoice_time', 'Invoice Time', 'চালান সময়'),
(996, 'product_vat', 'Product VAT', 'পণ্য ভ্যাট'),
(997, 'service_vat', 'Service VAT', 'পরিষেবা ভ্যাট'),
(998, 'cr_no', 'CR NO', 'সিআর নং'),
(999, 'service_payment', 'Service Payment', 'সার্ভিস পেমেন্ট'),
(1000, 'vat_tax_setting', 'VAT & TAX Setting', 'ভ্যাট এবং ট্যাক্স সেটিং'),
(1001, 'qty2', 'Qty', 'পরিমাণ'),
(1002, 'batch', 'Batch', 'ব্যাচ'),
(1003, 'disc', 'Disc', 'ডিস্ক'),
(1004, 'tot_price', 'Tot Price', 'মোট মূল্য'),
(1005, 'tot_before_dis', 'Total Before Discount', 'ছাড়ের আগে মোট'),
(1006, 'tot_with_dis', 'Total with Discount', 'ডিসকাউন্ট সহ মোট'),
(1007, 'tax_vat', 'TAX Value', 'ট্যাক্স মান'),
(1008, 'return_receipt_text', 'Please keep the receipt and bring it in case of return', 'অনুগ্রহ করে রসিদটি রাখুন এবং ফেরত দেওয়ার ক্ষেত্রে তা নিয়ে আসুন'),
(1009, 'invoice_qr_code', 'Invoice Qr-Code', 'চালান Qr-কোড'),
(1010, 'sales_due', 'Today Sales Due', 'আজ সেলস ডিউ'),
(1011, 'purchase_due', 'Today Purchase Due', 'আজ কেনাকাটা বাকি'),
(1012, 'delivery_note', 'Delivery Note', 'চালান পত্র'),
(1013, 'financial_year', 'Financial Year', 'আর্থিক বছর'),
(1014, 'close_financial_year', 'Close Financial Year', 'আর্থিক বছর বন্ধ করুন'),
(1015, 'create_financial_year', 'Create Financial Year', 'আর্থিক বছর তৈরি করুন'),
(1016, 'year_closing', 'Year Closing', 'বছর সমাপ্তি'),
(1017, 'financial_year_start_date', 'Financial Year Start', 'আর্থিক বছর শুরু'),
(1018, 'financial_year_end_date', 'Financial Year End', 'আর্থিক বছরের শেষ'),
(1019, 'subaccount_list', 'Sub Account List', 'সাব অ্যাকাউন্ট তালিকা'),
(1020, 'subaccount_add', 'Sub Account Add', 'সাব অ্যাকাউন্ট যোগ করুন'),
(1021, 'subtype', 'Sub Type', 'সাব টাইপ'),
(1022, 'predefined_accounts', 'Predefined Accounts', 'পূর্বনির্ধারিত অ্যাকাউন্ট'),
(1023, 'create_debit_voucher', 'Create Debit Voucher', 'ডেবিট ভাউচার তৈরি করুন'),
(1024, 'ledger_comment', 'Ledger Comment', 'লেজার মন্তব্য'),
(1025, 'reverseHead', 'Reverse Account Name', 'অ্যাকাউন্ট নাম বিপরীত'),
(1026, 'VNo', 'VNo', 'VNo'),
(1027, 'ledgerComment', '	Ledger Comment', 'লেজার মন্তব্য'),
(1028, 'create_credit_voucher', 'Create Credit Voucher', 'ক্রেডিট ভাউচার তৈরি করুন'),
(1029, 'create_contra_voucher', 'Create Contra Voucher', 'কনট্রা ভাউচার তৈরি করুন'),
(1030, 'create_journal_voucher', 'Create Journal Voucher', 'জার্নাল ভাউচার তৈরি করুন'),
(1031, 'reverse_account_head', 'Reverse Account Head', 'রিভার্স অ্যাকাউন্ট হেড'),
(1032, 'bank_reconciliation', 'Bank Reconciliation', 'ব্যাংক পুনর্মিলন'),
(1033, 'day_book', 'Day Book', 'দিনের বই'),
(1034, 'sub_ledger', 'Sub Ledger', 'সাব লেজার'),
(1035, 'income_statement_form', 'Income Statement', 'আয় বিবৃতি'),
(1036, 'year', 'Year', 'বছর'),
(1037, 'expenditure_statement', 'Expenditure Statement', 'ব্যয় বিবরণী'),
(1038, 'profit_loss_report', 'Profit Loss', 'লাভ ক্ষতি'),
(1039, 'fixedasset_schedule', 'Fixed Asset Schedule', 'স্থায়ী সম্পদের সময়সূচী'),
(1040, 'receipt_payment', 'Receipt & Payment', 'রসিদ এবং অর্থপ্রদান'),
(1041, 'cash_basis', 'Cash Basis', 'নগদ ভিত্তি'),
(1042, 'accrual_basis', 'Accrual Basis', 'বৃদ্ধি ভিত্তিতে'),
(1043, 'bank_reconciliation_report', 'Bank Reconciliation Report', 'ব্যাংক পুনর্মিলন রিপোর্ট'),
(1044, 'salary_advance_view', 'Salary Advance', 'অগ্রিম বেতন'),
(1045, 'add_salary_advance', 'Add Salary Advance', 'বেতন অগ্রিম যোগ করুন'),
(1046, 'manage_salary_advance', 'Manage Salary Advance', 'বেতন অগ্রিম পরিচালনা করুন'),
(1047, 'release_amount', 'Release Amount', 'রিলিজ পরিমাণ'),
(1048, 'create_date', 'Create Date', 'তারিখ তৈরি করুন'),
(1049, 'employee_salary_generate', 'Salary Generate', 'বেতন জেনারেট'),
(1050, 'approved_date', 'Approved Date', 'অনুমোদিত তারিখ'),
(1051, 'approved_by', 'Approved By', 'দ্বারা স্বীকৃত'),
(1052, 'salar_month', 'Salary Month', 'বেতন মাস'),
(1053, 'employee_salary_chart', 'Employee Salary Chart', 'কর্মচারী বেতন চার্ট'),
(1054, 'post', 'Post', 'পোস্ট'),
(1055, 'employee_salary_payment_view', 'Manage Employee Salary', 'কর্মচারী বেতন পরিচালনা করুন'),
(1056, 'pay_by', 'Pay By', 'দ্বারা বেতন'),
(1057, 'bank_book_report', 'Bank Book Report Of', 'ব্যাংক বুক রিপোর্ট অফ'),
(1058, 'head_name', 'Head Name', 'মাথার নাম'),
(1059, 'head_code', 'Head Code', 'হেড কোড'),
(1060, 'voucher', 'Voucher', 'ভাউচার'),
(1061, 'sub_ledger_of', 'Sub Ledger of', 'এর সাব লেজার'),
(1062, 'fixed_assets_report', 'Fixed Assets Annual Report', 'স্থায়ী সম্পদের বার্ষিক প্রতিবেদন'),
(1063, 'opening_balance_fixed_assets', 'Opening Balance of Fixed Assets', 'স্থায়ী সম্পদের খোলার ব্যালেন্স'),
(1064, 'additions', 'Additions', 'সংযোজন'),
(1065, 'closing_balance_fixed_assets', 'Closing Balance of Fixed Assets', 'স্থায়ী সম্পদের ক্লোজিং ব্যালেন্স'),
(1066, 'depreciation_rate', 'Depreciation Rate', 'অবচয় হার'),
(1067, 'depreciation_value', 'Depreciation Value', 'অবচয় মান'),
(1068, 'opening_balance_accumulated_depreciation', 'Opening Balance of Accumulated Depreciation', 'সঞ্চিত অবচয়ের খোলার ব্যালেন্স'),
(1069, 'closing_balance_accumulated_depreciation', 'Closing Balance of Accumulated Depreciation', 'পুঞ্জীভূত অবচয়ের ভারসাম্য'),
(1070, 'written_down_value', 'Written Down Value', 'লিখিত মূল্য'),
(1071, 'unapproved', 'Unapproved', 'অননুমোদিত'),
(1072, 'check_no', 'Check No', 'চেক নম্বর'),
(1073, 'Total Liabilities Equity', 'total_liabilities_equity', 'মোট_দায়িত্ব_ইকুইটি'),
(1074, 'total_equity', 'Total Equity', 'মোট ইক্যুইটি'),
(1075, 'total_liabilities', 'Total Liabilities', 'মোট দায়'),
(1076, 'total_assets', 'Total Assets', 'মোট সম্পদ'),
(1077, 'cashinhand', 'Cash In Hand', 'হাতে নগদ'),
(1078, 'cash_bank', 'Cash At Bank', 'ব্যাংক এ নগদ'),
(1079, 'advance', 'Advance', 'অগ্রিম'),
(1080, 'view_employee_payment', 'Employee Payment List', 'কর্মচারী পেমেন্ট তালিকা'),
(1081, 'ret_item', 'Returned Item', 'ফেরত আইটেম'),
(1082, 'replaced_item', 'Replaced Item', 'প্রতিস্থাপিত আইটেম'),
(1083, 'adj_amount', 'Adjusted Amount', 'সামঞ্জস্য করা পরিমাণ'),
(1084, 'is_autoapprove_v', 'Auto Approve Invoice Voucher', 'অটো অ্যাপ্রুভ ইনভয়েস ভাউচার'),
(1085, 'cost_price', 'Cost Price', 'কেনা দাম'),
(1086, 'chalan_no', 'Chalan No', 'চলন নং'),
(1087, 'already_returned', 'This Invoice is Already Returned ', 'এই চালান ইতিমধ্যে ফেরত দেওয়া হয়েছে'),
(1088, 'warehouse', 'Warehouse', 'গুদাম'),
(1089, 'edit_warehouse', 'Edit Warehouse', 'গুদাম সম্পাদনা করুন'),
(1090, 'warehouse_name', 'Warehouse Name', 'গুদামের নাম'),
(1091, 'warehouse_list', 'Warehouse List', 'গুদাম তালিকা'),
(1092, 'writer', 'Writer', 'লেখক'),
(1093, 'publication', 'Publication', 'প্রকাশনা'),
(1094, 'edit_writer', 'Edit Writer', 'লেখক সম্পাদনা করুন'),
(1095, 'writer_name', 'Writer Name', 'লেখকের নাম'),
(1096, 'writer_list', 'Writer List', 'লেখকের তালিকা'),
(1097, 'publication_list', 'Publication List', 'প্রকাশনার তালিকা'),
(1098, 'edit_publication', 'Edit Publication', 'প্রকাশনা সম্পাদনা করুন'),
(1099, 'payment_method', 'Payment Method', 'মূল্যপরিশোধ পদ্ধতি'),
(1100, 'net_amount', 'Net Amount', 'নেট পরিমাণ'),
(1101, 'delivery_details', 'Delivery Details', 'প্রসবের বিবরণ'),
(1102, 'opening_stock', 'Opening Stock', 'খোলা স্টক'),
(1103, 'opening_quantity', 'Opening Quantity', 'খোলার পরিমাণ');

-- --------------------------------------------------------

--
-- Table structure for table `module`
--

DROP TABLE IF EXISTS `module`;
CREATE TABLE IF NOT EXISTS `module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `directory` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
  `identity` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `purchase_key` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_method`
--

DROP TABLE IF EXISTS `payment_method`;
CREATE TABLE IF NOT EXISTS `payment_method` (
  `payment_method_id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_method_name` varchar(155) COLLATE utf8_unicode_ci NOT NULL,
  `account_number` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`payment_method_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
  `category_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
  `product_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `writer_id` int(11) DEFAULT NULL,
  `publication_id` int(11) DEFAULT NULL,
  `product_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `supplier_price` double(10,2) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `unit` int(11) NOT NULL,
  `tax` float DEFAULT NULL COMMENT 'Tax in %',
  `serial_no` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_vat` float DEFAULT NULL,
  `product_model` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_details` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `added_on` datetime NOT NULL,
  `added_by` int(11) NOT NULL,
  `edited_on` datetime DEFAULT NULL,
  `edited_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
  `chalan_no` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `supplier_id` bigint(20) NOT NULL,
  `grand_total_amount` decimal(12,2) NOT NULL DEFAULT '0.00',
  `paid_amount` decimal(10,2) DEFAULT '0.00',
  `due_amount` decimal(10,2) DEFAULT '0.00',
  `total_discount` decimal(10,2) DEFAULT NULL,
  `invoice_discount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'sum of product discount',
  `total_vat_amnt` decimal(10,2) DEFAULT '0.00' COMMENT 'sum of product vat',
  `purchase_date` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `purchase_details` text COLLATE utf8_unicode_ci,
  `status` int(11) NOT NULL,
  `bank_id` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_purchase`
--

INSERT INTO `product_purchase` (`id`, `purchase_id`, `chalan_no`, `supplier_id`, `grand_total_amount`, `paid_amount`, `due_amount`, `total_discount`, `invoice_discount`, `total_vat_amnt`, `purchase_date`, `purchase_details`, `status`, `bank_id`, `payment_method_id`, `is_credit`, `added_on`, `added_by`, `edited_on`, `edited_by`, `warehouse_id`) VALUES
(1, 1, '2345643', 2, '37150.00', '37140.00', '10.00', NULL, '6350.00', '0.00', '2022-10-24', '', 1, NULL, 3, NULL, '2022-10-24 06:49:36', 1, '2022-10-24 10:01:59', 1, 1),
(2, 2, '29093092', 1, '24840.00', '24840.00', '0.00', NULL, '2760.00', '0.00', '2022-10-24', '', 1, NULL, 1, NULL, '2022-10-24 08:01:58', 1, NULL, NULL, 2),
(3, 3, '213122', 2, '13318.00', '13318.00', '0.00', NULL, '982.00', '0.00', '2022-10-24', '', 1, NULL, 2, NULL, '2022-10-24 10:51:40', 1, '2022-10-24 10:52:50', 1, 2),
(4, 4, '100092', 2, '57040.00', '57040.00', '0.00', NULL, '9660.00', '0.00', '2022-10-24', 'details', 1, NULL, 3, NULL, '2022-10-24 10:59:19', 1, '2022-10-24 11:00:04', 1, 2),
(5, 5, 'MSMSDN28', 1, '1008.00', '1008.00', '0.00', NULL, '432.00', '0.00', '2022-12-05', '', 1, NULL, 1, NULL, '2022-12-05 13:35:42', 276843, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_purchase_details`
--

DROP TABLE IF EXISTS `product_purchase_details`;
CREATE TABLE IF NOT EXISTS `product_purchase_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_detail_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `purchase_id` bigint(20) DEFAULT NULL,
  `product_id` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quantity` decimal(10,2) DEFAULT NULL,
  `rate` decimal(10,2) DEFAULT NULL,
  `batch_id` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
(24, 'OCN2168QZ9LZ7NA', 4, '62560353', '230.00', '130.00', NULL, NULL, '23920.00', 20, '5980.00', '0.00', '0.00', 1),
(25, '3UB8A8RMQTQDPWV', 5, '19526545', '12.00', '120.00', NULL, NULL, '1008.00', 30, '432.00', '0.00', '0.00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_return`
--

DROP TABLE IF EXISTS `product_return`;
CREATE TABLE IF NOT EXISTS `product_return` (
  `return_id` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `product_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `invoice_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `purchase_id` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_purchase` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `date_return` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `byy_qty` float NOT NULL,
  `ret_qty` float NOT NULL,
  `customer_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `supplier_id` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `product_rate` decimal(10,2) NOT NULL DEFAULT '0.00',
  `deduction` float NOT NULL,
  `total_deduct` decimal(10,2) NOT NULL DEFAULT '0.00',
  `total_tax` decimal(10,2) NOT NULL DEFAULT '0.00',
  `total_ret_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `net_total_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `reason` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `usablity` int(11) NOT NULL,
  KEY `product_id` (`product_id`),
  KEY `invoice_id` (`invoice_id`),
  KEY `purchase_id` (`purchase_id`),
  KEY `customer_id` (`customer_id`),
  KEY `supplier_id` (`supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_service`
--

DROP TABLE IF EXISTS `product_service`;
CREATE TABLE IF NOT EXISTS `product_service` (
  `service_id` int(11) NOT NULL AUTO_INCREMENT,
  `service_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `charge` decimal(10,2) NOT NULL DEFAULT '0.00',
  `service_vat` float DEFAULT NULL,
  `is_fixed` int(11) NOT NULL DEFAULT '0',
  `is_dynamic` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `publication`
--

DROP TABLE IF EXISTS `publication`;
CREATE TABLE IF NOT EXISTS `publication` (
  `publication_id` int(11) NOT NULL AUTO_INCREMENT,
  `publication_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`publication_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `publication`
--

INSERT INTO `publication` (`publication_id`, `publication_name`, `status`) VALUES
(1, 'সমকালীন', 1),
(2, 'বাতিঘর', 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=981 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
-- Table structure for table `sec_role`
--

DROP TABLE IF EXISTS `sec_role`;
CREATE TABLE IF NOT EXISTS `sec_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `seles_termscondi`
--

INSERT INTO `seles_termscondi` (`id`, `description`, `status`) VALUES
(5, 'Goods purchased without the original invoice are not to be returned or exchanged', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sms_settings`
--

DROP TABLE IF EXISTS `sms_settings`;
CREATE TABLE IF NOT EXISTS `sms_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `api_key` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `api_secret` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `from` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isinvoice` int(11) NOT NULL DEFAULT '0',
  `isservice` int(11) NOT NULL DEFAULT '0',
  `isreceive` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `image` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `directory` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
  `supplier_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address2` text COLLATE utf8_unicode_ci NOT NULL,
  `mobile` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `emailnumber` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_address` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fax` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` text COLLATE utf8_unicode_ci,
  `state` text COLLATE utf8_unicode_ci,
  `zip` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `details` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`supplier_id`),
  KEY `supplier_id` (`supplier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
  `product_id` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `products_model` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
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
  `hostname` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `port` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `debug` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `project_root` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tax_collection`
--

DROP TABLE IF EXISTS `tax_collection`;
CREATE TABLE IF NOT EXISTS `tax_collection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `customer_id` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `relation_id` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tax_settings`
--

DROP TABLE IF EXISTS `tax_settings`;
CREATE TABLE IF NOT EXISTS `tax_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `default_value` float NOT NULL,
  `tax_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `nt` int(11) NOT NULL,
  `reg_no` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `is_show` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

DROP TABLE IF EXISTS `units`;
CREATE TABLE IF NOT EXISTS `units` (
  `unit_id` int(11) NOT NULL AUTO_INCREMENT,
  `unit_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`unit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
  `user_id` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `company_name` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8_unicode_ci,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `date_of_birth` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logo` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
  `user_id` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_type` int(11) DEFAULT NULL,
  `security_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL DEFAULT '1' COMMENT '0=All',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
  `warehouse_name` varchar(155) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`warehouse_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `warehouse`
--

INSERT INTO `warehouse` (`warehouse_id`, `warehouse_name`) VALUES
(1, 'রংপুর'),
(2, 'ঢাকা');

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
(1, 'assets/img/icons/2022-12-04/efd0a728f796e7b7ddaae7eaf11e43ac.png', 'assets/img/icons/2022-12-04/848a1b1d0f0e2a642043a636ae8f3c24.jpg', 'assets/img/icons/2022-12-04/8e015760dc5655c2f5f90b9e4b50cb10.ico', '৳', 'Asia/Dhaka', '0', 'Developed by Sohel Rana', 'bangla', '0', 1, 1, 1, '6LdiKhsUAAAAAMV4jQRmNYdZy2kXEuFe1HrdP5tt', '6LdiKhsUAAAAAMV4jQRmNYdZy2kXEuFe1HrdP5tt', 1);

-- --------------------------------------------------------

--
-- Table structure for table `writer`
--

DROP TABLE IF EXISTS `writer`;
CREATE TABLE IF NOT EXISTS `writer` (
  `writer_id` int(11) NOT NULL AUTO_INCREMENT,
  `writer_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`writer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
