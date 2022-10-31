SET sql_mode = '';
--
-- Table structure for table `acc_coa`
--

CREATE TABLE IF NOT EXISTS `acc_coa` (
  `HeadCode` varchar(50) NOT NULL,
  `HeadName` varchar(100) NOT NULL,
  `PHeadName` varchar(200) NOT NULL,
  `PHeadCode` varchar(50) DEFAULT NULL,
  `HeadLevel` int(11) NOT NULL,
  `IsActive` tinyint(1) NOT NULL,
  `IsTransaction` tinyint(1) NOT NULL,
  `IsGL` tinyint(1) NOT NULL,
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
  PRIMARY KEY (`HeadCode`),
  KEY `HeadName` (`HeadName`),
  KEY `customer_id` (`customer_id`),
  KEY `supplier_id` (`supplier_id`),
  KEY `service_id` (`service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `acc_coa`
--

INSERT INTO `acc_coa` (`HeadCode`, `HeadName`, `PHeadName`, `PHeadCode`, `HeadLevel`, `IsActive`, `IsTransaction`, `IsGL`, `HeadType`, `IsBudget`, `IsDepreciation`, `customer_id`, `supplier_id`, `bank_id`, `service_id`, `DepreciationRate`, `CreateBy`, `CreateDate`, `UpdateBy`, `UpdateDate`) VALUES
('1', 'Assets', 'COA', '0', 0, 1, 1, 1, 'A', 0, 0, NULL, NULL, NULL, NULL, 0.00, '1', '2021-11-17 09:50:20', '', '0000-00-00 00:00:00'),
('11', 'Current Assets', 'Assets', '1', 1, 1, 1, 1, 'A', 0, 0, NULL, NULL, NULL, NULL, 0.00, '1', '2021-11-17 08:27:49', '', '0000-00-00 00:00:00'),
('111', 'Cash In Boxes', 'Current Assets', '11', 2, 1, 1, 1, 'A', 0, 0, NULL, NULL, NULL, NULL, 0.00, '1', '2021-11-16 10:30:14', '', '0000-00-00 00:00:00'),
('111000001', 'Cash in hand', 'Cash In Boxes', NULL, 3, 1, 1, 0, 'A', 0, 0, NULL, NULL, NULL, NULL, 0.00, '2', '2022-01-25 10:48:46', '', '0000-00-00 00:00:00'),
('112', 'Cash in Banks', 'Current Assets', '11', 2, 1, 1, 1, 'A', 0, 0, NULL, NULL, NULL, NULL, 0.00, '1', '2021-11-16 10:30:19', '', '0000-00-00 00:00:00'),
('113', 'Account Receivable', 'Current Assets', '11', 2, 1, 1, 1, 'A', 0, 0, NULL, NULL, NULL, NULL, 0.00, '2', '2022-01-26 06:39:24', '', '0000-00-00 00:00:00'),
('1131', 'Customers', 'Account Receivable', '113', 3, 1, 1, 1, 'A', 0, 0, NULL, NULL, NULL, NULL, 0.00, '1', '2021-11-08 09:27:45', '', '0000-00-00 00:00:00'),
('113100000001', '1-walking customer', 'Customers', NULL, 4, 1, 1, 1, 'A', 0, 0, '1', NULL, NULL, NULL, 0.00, '2', '2022-01-25 12:44:37', '', '0000-00-00 00:00:00'),
('1132', 'Loan Receivable', 'Account Receivable', NULL, 3, 1, 1, 1, 'A', 0, 0, NULL, NULL, NULL, NULL, 0.00, '2', '2022-01-26 06:42:15', '', '0000-00-00 00:00:00'),
('114', 'Inventory accounts', 'Current Assets', '11', 2, 1, 1, 1, 'A', 0, 0, NULL, NULL, NULL, NULL, 0.00, '1', '2021-11-16 10:30:29', '', '0000-00-00 00:00:00'),
('1141', 'Inventory', 'Inventory accounts', '114', 3, 1, 1, 1, 'A', 0, 0, NULL, NULL, NULL, NULL, 0.00, '1', '2021-11-08 09:28:56', '', '0000-00-00 00:00:00'),
('12', 'Non-current assets', 'Assets', '1', 1, 1, 1, 1, 'A', 0, 0, NULL, NULL, NULL, NULL, 0.00, '1', '2021-11-16 10:32:23', '', '0000-00-00 00:00:00'),
('122', 'Service Receive', 'Non-current assets', NULL, 2, 1, 1, 1, 'A', 0, 0, NULL, NULL, NULL, NULL, 0.00, '2', '2021-12-20 06:26:39', '', '0000-00-00 00:00:00'),
('13', 'Fixed assets', 'Assets', '1', 1, 1, 1, 1, 'A', 0, 0, NULL, NULL, NULL, NULL, 0.00, '1', '2021-11-16 10:33:05', '', '0000-00-00 00:00:00'),
('2', 'Liabilities', 'COA', '0', 0, 1, 1, 1, 'L', 0, 0, NULL, NULL, NULL, NULL, 0.00, '1', '2021-11-17 09:50:55', '', '0000-00-00 00:00:00'),
('21', 'Current Liabilities', 'Liabilities', '2', 1, 1, 1, 1, 'L', 0, 0, NULL, NULL, NULL, NULL, 0.00, '1', '2021-11-16 10:33:15', '', '0000-00-00 00:00:00'),
('211', 'Accounts payable', 'Current Liabilities', '21', 2, 1, 1, 1, 'L', 0, 0, NULL, NULL, NULL, NULL, 0.00, '2', '2022-01-11 06:52:46', '', '0000-00-00 00:00:00'),
('2111', 'Suppliers', 'Accounts payable', '211', 3, 1, 1, 1, 'L', 0, 0, NULL, NULL, NULL, NULL, 0.00, '1', '2021-11-17 09:47:03', '', '0000-00-00 00:00:00'),
('2114', 'Value added tax ', 'Accounts payable', '211', 3, 1, 1, 1, 'L', 0, 0, NULL, NULL, NULL, NULL, 0.00, '1', '2021-11-08 10:08:56', '', '0000-00-00 00:00:00'),
('2116', 'Employee Ledger', 'Accounts payable', NULL, 3, 1, 1, 1, 'L', 0, 0, NULL, NULL, NULL, NULL, 0.00, '2', '2021-12-20 07:38:06', '', '0000-00-00 00:00:00'),
('22', 'Non-current liabilities', 'Liabilities', '2', 1, 1, 0, 0, 'L', 0, 0, NULL, NULL, NULL, NULL, 0.00, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
('3', 'Equity', 'COA', '0', 0, 1, 1, 1, 'O', 0, 0, NULL, NULL, NULL, NULL, 0.00, '2', '2022-01-26 07:38:15', '', '0000-00-00 00:00:00'),
('4', 'Expenses', 'COA', '0', 0, 1, 0, 0, 'E', 0, 0, NULL, NULL, NULL, NULL, 0.00, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
('41', 'Direct Expenses', 'Expenses', '4', 1, 1, 0, 0, 'E', 0, 0, NULL, NULL, NULL, NULL, 0.00, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
('42', 'Indirect Expenses', 'Expenses', '4', 1, 1, 0, 0, 'E', 0, 0, NULL, NULL, NULL, NULL, 0.00, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
('421', 'General and administrative expenses', 'Indirect Expenses', '42', 2, 1, 1, 1, 'E', 0, 0, NULL, NULL, NULL, NULL, 0.00, '1', '2021-11-16 10:34:37', '', '0000-00-00 00:00:00'),
('421001', 'Payroll', 'General and administrative expenses', NULL, 3, 1, 1, 1, 'E', 0, 0, NULL, NULL, NULL, NULL, 0.00, '2', '2021-12-20 07:10:48', '', '0000-00-00 00:00:00'),
('421001001', 'employee salary', 'Payroll', NULL, 4, 1, 1, 1, 'E', 0, 0, NULL, NULL, NULL, NULL, 0.00, '2', '2021-12-20 07:15:17', '', '0000-00-00 00:00:00'),
('421001002', 'Basic Salary', 'Payroll', NULL, 4, 1, 1, 1, 'E', 0, 0, NULL, NULL, NULL, NULL, 0.00, '2', '2022-01-11 06:58:42', '', '0000-00-00 00:00:00'),
('421005', 'Expenses of public utilities and services', 'General and administrative expenses', NULL, 3, 1, 1, 1, 'E', 0, 0, NULL, NULL, NULL, NULL, 0.00, '2', '2021-12-20 07:26:57', '', '0000-00-00 00:00:00'),
('5', 'Revenues', 'COA', '0', 0, 1, 0, 0, 'I', 0, 0, NULL, NULL, NULL, NULL, 0.00, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
('51', 'Sales revenue', 'Revenues', '5', 1, 1, 0, 0, 'I', 0, 0, NULL, NULL, NULL, NULL, 0.00, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
('511', ' sales', 'Sales revenue', '51', 2, 1, 1, 1, 'I', 0, 0, NULL, NULL, NULL, NULL, 0.00, '2', '2021-12-20 08:40:38', '', '0000-00-00 00:00:00'),
('511001', 'Product sales', ' sales', NULL, 3, 1, 1, 1, 'I', 0, 0, NULL, NULL, NULL, NULL, 0.00, '2', '2021-12-20 08:43:26', '', '0000-00-00 00:00:00'),
('511002', 'Service sales', ' sales', NULL, 3, 1, 1, 1, 'I', 0, 0, NULL, NULL, NULL, NULL, 0.00, '2', '2021-12-20 08:44:05', '', '0000-00-00 00:00:00'),
('52', 'Other revenue', 'Revenues', '5', 1, 1, 0, 0, 'I', 0, 0, NULL, NULL, NULL, NULL, 0.00, '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
('521', 'Discount Received', 'Other revenue', '52', 2, 1, 1, 1, 'I', 0, 0, NULL, NULL, NULL, NULL, 0.00, '1', '2021-11-15 05:42:02', '', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `acc_transaction`
--

CREATE TABLE IF NOT EXISTS `acc_transaction` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `VNo` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `Vtype` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `VDate` date DEFAULT NULL,
  `COAID` varchar(50) CHARACTER SET utf8 NOT NULL,
  `Narration` text CHARACTER SET utf8 DEFAULT NULL,
  `Debit` decimal(18,2) DEFAULT NULL,
  `Credit` decimal(18,2) DEFAULT NULL,
  `IsPosted` char(10) CHARACTER SET utf8 DEFAULT NULL,
  `is_opening` int(11) NOT NULL DEFAULT 0,
  `CreateBy` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `CreateDate` datetime DEFAULT NULL,
  `UpdateBy` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `UpdateDate` datetime DEFAULT NULL,
  `IsAppove` char(10) CHARACTER SET utf8 DEFAULT NULL,
  UNIQUE KEY `ID` (`ID`),
  KEY `COAID` (`COAID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `app_setting`
--

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

CREATE TABLE IF NOT EXISTS `closing_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `head_code` bigint(20) DEFAULT NULL,
  `opening_balance` decimal(10,2) NOT NULL DEFAULT 0.00,
  `amount_in` decimal(10,2) NOT NULL DEFAULT 0.00,
  `amount_out` decimal(10,2) NOT NULL DEFAULT 0.00,
  `closign_balance` decimal(10,2) NOT NULL DEFAULT 0.00,
  `datetime` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_id` varchar(20) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `company_information`
--

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
('1', 'Demo Company', 'demo@mail.com', 'Company Demo Address', '123456', 'https://www.demo.com/', '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `currency_tbl`
--

CREATE TABLE IF NOT EXISTS `currency_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `currency_name` varchar(50) NOT NULL,
  `icon` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `currency_tbl`
--

INSERT INTO `currency_tbl` (`id`, `currency_name`, `icon`) VALUES
(2, 'USD', '$');

-- --------------------------------------------------------

--
-- Table structure for table `customer_information`
--

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
  `city` text DEFAULT NULL,
  `state` text DEFAULT NULL,
  `zip` varchar(50) DEFAULT NULL,
  `country` varchar(250) DEFAULT NULL,
  `status` int(11) NOT NULL COMMENT '1=paid,2=credit',
  `create_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `create_by` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer_information`
--

INSERT INTO `customer_information` (`customer_id`, `customer_name`, `customer_address`, `address2`, `customer_mobile`, `customer_email`, `email_address`, `contact`, `phone`, `fax`, `city`, `state`, `zip`, `country`, `status`, `create_date`, `create_by`) VALUES
(1, 'walking customer', '', '', '', '', '', '', '', '', '', '', '', '', 1, '2022-01-25 08:50:20', '2');

-- --------------------------------------------------------

--
-- Table structure for table `daily_banking_add`
--

CREATE TABLE IF NOT EXISTS `daily_banking_add` (
  `banking_id` varchar(255) NOT NULL,
  `date` datetime DEFAULT NULL,
  `bank_id` varchar(100) DEFAULT NULL,
  `deposit_type` varchar(255) DEFAULT NULL,
  `transaction_type` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `daily_closing`
--

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

CREATE TABLE IF NOT EXISTS `designation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designation` varchar(150) NOT NULL,
  `details` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `email_config`
--

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
(1, 'ssmtp', 'ssl://ssmtp.gmail.com', '25', 'info@eholol.com', 'demo123456', 'html', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `employee_history`
--

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
  `image` text DEFAULT NULL,
  `country` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `zip` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `employee_salary_payment`
--

CREATE TABLE IF NOT EXISTS `employee_salary_payment` (
  `emp_sal_pay_id` int(11) NOT NULL AUTO_INCREMENT,
  `generate_id` int(11) NOT NULL,
  `employee_id` varchar(50) CHARACTER SET latin1 NOT NULL,
  `total_salary` decimal(18,2) NOT NULL DEFAULT 0.00,
  `total_working_minutes` varchar(50) CHARACTER SET latin1 NOT NULL,
  `working_period` varchar(50) CHARACTER SET latin1 NOT NULL,
  `payment_due` varchar(50) CHARACTER SET latin1 NOT NULL,
  `payment_date` varchar(50) CHARACTER SET latin1 NOT NULL,
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

CREATE TABLE IF NOT EXISTS `employee_salary_setup` (
  `e_s_s_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `employee_id` varchar(30) CHARACTER SET latin1 NOT NULL,
  `sal_type` varchar(30) NOT NULL,
  `salary_type_id` varchar(30) CHARACTER SET latin1 NOT NULL,
  `amount` decimal(12,2) NOT NULL DEFAULT 0.00,
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

CREATE TABLE IF NOT EXISTS `expense_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `expense_item_name` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE IF NOT EXISTS `invoice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_id` bigint(20) NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  `date` varchar(50) DEFAULT NULL,
  `total_amount` decimal(18,2) NOT NULL DEFAULT 0.00,
  `paid_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `due_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `prevous_due` decimal(20,2) NOT NULL DEFAULT 0.00,
  `shipping_cost` decimal(10,2) NOT NULL DEFAULT 0.00,
  `invoice` bigint(20) NOT NULL,
  `offline_invoice_no` bigint(20) DEFAULT NULL,
  `invoice_discount` decimal(10,2) DEFAULT 0.00 COMMENT 'invoice discount',
  `total_discount` decimal(10,2) DEFAULT 0.00 COMMENT 'total invoice discount',
  `total_vat_amnt` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT 'total invoice vat',
  `total_tax` decimal(10,2) DEFAULT 0.00,
  `sales_by` varchar(50) NOT NULL,
  `invoice_details` text NOT NULL,
  `is_credit` tinyint(4) DEFAULT NULL,
  `is_fixed` int(11) NOT NULL DEFAULT 0,
  `is_dynamic` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL,
  `bank_id` varchar(30) DEFAULT NULL,
  `payment_type` int(11) NOT NULL,
  `is_online` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  KEY `invoice_id` (`invoice_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_details`
--

CREATE TABLE IF NOT EXISTS `invoice_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_details_id` varchar(100) NOT NULL,
  `invoice_id` varchar(100) NOT NULL,
  `product_id` varchar(30) NOT NULL,
  `serial_no` varchar(30) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `quantity` decimal(10,2) DEFAULT NULL,
  `rate` decimal(10,2) DEFAULT NULL,
  `batch_id` varchar(30) DEFAULT NULL,
  `supplier_rate` float DEFAULT NULL,
  `total_price` decimal(12,2) DEFAULT NULL,
  `discount` decimal(10,2) DEFAULT NULL,
  `discount_per` varchar(15) DEFAULT NULL,
  `vat_amnt` decimal(10,2) DEFAULT NULL,
  `vat_amnt_per` varchar(15) DEFAULT NULL,
  `tax` decimal(10,2) DEFAULT NULL,
  `paid_amount` decimal(12,0) DEFAULT NULL,
  `due_amount` decimal(10,2) DEFAULT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_id` (`invoice_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

CREATE TABLE IF NOT EXISTS `language` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `phrase` text NOT NULL,
  `english` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1012 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `language`
--

INSERT INTO `language` (`id`, `phrase`, `english`) VALUES
(1, 'user_profile', 'User Profile'),
(2, 'setting', 'Setting'),
(3, 'language', 'Language'),
(4, 'manage_users', 'Manage Users'),
(5, 'add_user', 'Add User'),
(6, 'manage_company', 'Manage Company'),
(7, 'web_settings', 'Software Settings'),
(8, 'manage_accounts', 'Manage Accounts'),
(9, 'create_accounts', 'Create Account'),
(10, 'manage_bank', 'Manage Bank'),
(11, 'add_new_bank', 'Add New Bank'),
(12, 'settings', 'Settings'),
(13, 'closing_report', 'Closing Report'),
(14, 'closing', 'Closing'),
(15, 'cheque_manager', 'Cheque Manager'),
(16, 'accounts_summary', 'Accounts Summary'),
(17, 'expense', 'Expense'),
(18, 'income', 'Income'),
(19, 'accounts', 'Accounts'),
(20, 'stock_report', 'Stock Report'),
(21, 'stock', 'Stock'),
(22, 'pos_invoice', 'POS Sale'),
(23, 'manage_invoice', 'Manage Sale'),
(24, 'new_invoice', 'New Sale'),
(25, 'invoice', 'Sale'),
(26, 'manage_purchase', 'Manage Purchase'),
(27, 'add_purchase', 'Add Purchase'),
(28, 'purchase', 'Purchase'),
(29, 'paid_customer', 'Paid Customer'),
(30, 'manage_customer', 'Manage Customer'),
(31, 'add_customer', 'Add Customer'),
(32, 'customer', 'Customer'),
(33, 'supplier_payment_actual', 'Supplier Payment Ledger'),
(34, 'supplier_sales_summary', 'Supplier Sales Summary'),
(35, 'supplier_sales_details', 'Supplier Sales Details'),
(36, 'supplier_ledger', 'Supplier Ledger'),
(37, 'manage_supplier', 'Manage Supplier'),
(38, 'add_supplier', 'Add Supplier'),
(39, 'supplier', 'Supplier'),
(40, 'product_statement', 'Product Statement'),
(41, 'manage_product', 'Manage Product'),
(42, 'add_product', 'Add Product'),
(43, 'product', 'Product'),
(44, 'manage_category', 'Manage Category'),
(45, 'add_category', 'Add Category'),
(46, 'category', 'Category'),
(47, 'sales_report_product_wise', 'Sales Report (Product Wise)'),
(48, 'purchase_report', 'Purchase Report'),
(49, 'sales_report', 'Sales Report'),
(50, 'todays_report', 'Todays Report'),
(51, 'report', 'Report'),
(52, 'dashboard', 'Dashboard'),
(53, 'online', 'Online'),
(54, 'logout', 'Logout'),
(55, 'change_password', 'Change Password'),
(56, 'total_purchase', 'Total Purchase'),
(57, 'total_amount', 'Total Amount'),
(58, 'supplier_name', 'Supplier Name'),
(59, 'invoice_no', 'Invoice No'),
(60, 'purchase_date', 'Purchase Date'),
(61, 'todays_purchase_report', 'Todays Purchase Report'),
(62, 'total_sales', 'Total Sales'),
(63, 'customer_name', 'Customer Name'),
(64, 'sales_date', 'Sales Date'),
(65, 'todays_sales_report', 'Todays Sales Report'),
(66, 'home', 'Home'),
(67, 'todays_sales_and_purchase_report', 'Todays sales and purchase report'),
(68, 'total_ammount', 'Total Amount'),
(69, 'rate', 'Rate'),
(70, 'product_model', 'Product Model'),
(71, 'product_name', 'Product Name'),
(72, 'search', 'Search'),
(73, 'end_date', 'End Date'),
(74, 'start_date', 'Start Date'),
(75, 'total_purchase_report', 'Total Purchase Report'),
(76, 'total_sales_report', 'Total Sales Report'),
(77, 'total_seles', 'Total Sales'),
(78, 'all_stock_report', 'All Stock Report'),
(79, 'search_by_product', 'Search By Product'),
(80, 'date', 'Date'),
(81, 'print', 'Print'),
(82, 'stock_date', 'Stock Date'),
(83, 'print_date', 'Print Date'),
(84, 'sales', 'Sales'),
(85, 'price', 'Price'),
(86, 'sl', 'SL.'),
(87, 'add_new_category', 'Add new category'),
(88, 'category_name', 'Category Name'),
(89, 'save', 'Save'),
(90, 'delete', 'Delete'),
(91, 'update', 'Update'),
(92, 'action', 'Action'),
(93, 'manage_your_category', 'Manage your category '),
(94, 'category_edit', 'Category Edit'),
(95, 'status', 'Status'),
(96, 'active', 'Active'),
(97, 'inactive', 'Inactive'),
(98, 'save_changes', 'Save Changes'),
(99, 'save_and_add_another', 'Save And Add Another'),
(100, 'model', 'Model'),
(101, 'supplier_price', 'Supplier Price'),
(102, 'sell_price', 'Sale Price'),
(103, 'image', 'Image'),
(104, 'select_one', 'Select One'),
(105, 'details', 'Details'),
(106, 'new_product', 'New Product'),
(107, 'add_new_product', 'Add new product'),
(108, 'barcode', 'Barcode'),
(109, 'qr_code', 'Qr-Code'),
(110, 'product_details', 'Product Details'),
(111, 'manage_your_product', 'Manage your product'),
(112, 'product_edit', 'Product Edit'),
(113, 'edit_your_product', 'Edit your product'),
(114, 'cancel', 'Cancel'),
(115, 'incl_vat', 'Incl. Vat'),
(116, 'money', 'TK'),
(117, 'grand_total', 'Grand Total'),
(118, 'quantity', 'Qnty'),
(119, 'product_report', 'Product Report'),
(120, 'product_sales_and_purchase_report', 'Product sales and purchase report'),
(121, 'previous_stock', 'Previous Stock'),
(122, 'out', 'Out'),
(123, 'in', 'In'),
(124, 'to', 'To'),
(125, 'previous_balance', 'Previous Balance'),
(126, 'customer_address', 'Customer Address'),
(127, 'customer_mobile', 'Customer Mobile'),
(128, 'customer_email', 'Customer Email'),
(129, 'add_new_customer', 'Add new customer'),
(130, 'balance', 'Balance'),
(131, 'mobile', 'Mobile'),
(132, 'address', 'Address'),
(133, 'manage_your_customer', 'Manage your customer'),
(134, 'customer_edit', 'Customer Edit'),
(135, 'paid_customer_list', 'Paid Customer List'),
(136, 'ammount', 'Amount'),
(137, 'customer_ledger', 'Customer Ledger'),
(138, 'manage_customer_ledger', 'Manage Customer Ledger'),
(139, 'customer_information', 'Customer Information'),
(140, 'debit_ammount', 'Debit Amount'),
(141, 'credit_ammount', 'Credit Amount'),
(142, 'balance_ammount', 'Balance Amount'),
(143, 'receipt_no', 'Receipt NO'),
(144, 'description', 'Description'),
(145, 'debit', 'Debit'),
(146, 'credit', 'Credit'),
(147, 'item_information', 'Item Information'),
(148, 'total', 'Total'),
(149, 'please_select_supplier', 'Please Select Supplier'),
(150, 'submit', 'Submit'),
(151, 'submit_and_add_another', 'Submit And Add Another One'),
(152, 'add_new_item', 'Add New Item'),
(153, 'manage_your_purchase', 'Manage your purchase'),
(154, 'purchase_edit', 'Purchase Edit'),
(155, 'purchase_ledger', 'Purchase Ledger'),
(156, 'invoice_information', 'Sale Information'),
(157, 'paid_ammount', 'Paid Amount'),
(158, 'discount', 'Dis./Pcs.'),
(159, 'save_and_paid', 'Save And Paid'),
(160, 'payee_name', 'Payee Name'),
(161, 'manage_your_invoice', 'Manage your Sale'),
(162, 'invoice_edit', 'Sale Edit'),
(163, 'new_pos_invoice', 'New POS Sale'),
(164, 'add_new_pos_invoice', 'Add new pos Sale'),
(165, 'product_id', 'Product ID'),
(166, 'paid_amount', 'Paid Amount'),
(167, 'authorised_by', 'Authorised By'),
(168, 'checked_by', 'Checked By'),
(169, 'received_by', 'Received By'),
(170, 'prepared_by', 'Prepared By'),
(171, 'memo_no', 'Memo No'),
(172, 'website', 'Website'),
(173, 'email', 'Email'),
(174, 'invoice_details', 'Sale Details'),
(175, 'reset', 'Reset'),
(176, 'payment_account', 'Payment Account'),
(177, 'bank_name', 'Bank Name'),
(178, 'cheque_or_pay_order_no', 'Cheque/Pay Order No'),
(179, 'payment_type', 'Payment Type'),
(180, 'payment_from', 'Payment From'),
(181, 'payment_date', 'Payment Date'),
(182, 'add_income', 'Add Income'),
(183, 'cash', 'Cash'),
(184, 'cheque', 'Cheque'),
(185, 'pay_order', 'Pay Order'),
(186, 'payment_to', 'Payment To'),
(187, 'total_outflow_ammount', 'Total Expense Amount'),
(188, 'transections', 'Transections'),
(189, 'accounts_name', 'Accounts Name'),
(190, 'outflow_report', 'Expense Report'),
(191, 'inflow_report', 'Income Report'),
(192, 'all', 'All'),
(193, 'account', 'Account'),
(194, 'from', 'From'),
(195, 'account_summary_report', 'Account Summary Report'),
(196, 'search_by_date', 'Search By Date'),
(197, 'cheque_no', 'Cheque No'),
(198, 'name', 'Name'),
(199, 'closing_account', 'Closing Account'),
(200, 'close_your_account', 'Close your account'),
(201, 'last_day_closing', 'Last Day Closing'),
(202, 'cash_in', 'Cash In'),
(203, 'cash_out', 'Cash Out'),
(204, 'cash_in_hand', 'Cash In Hand'),
(205, 'add_new_bank', 'Add New Bank'),
(206, 'day_closing', 'Day Closing'),
(207, 'account_closing_report', 'Account Closing Report'),
(208, 'last_day_ammount', 'Last Day Amount'),
(209, 'adjustment', 'Adjustment'),
(210, 'pay_type', 'Pay Type'),
(211, 'customer_or_supplier', 'Customer,Supplier Or Others'),
(212, 'transection_id', 'Transections ID'),
(213, 'accounts_summary_report', 'Accounts Summary Report'),
(214, 'bank_list', 'Bank List'),
(215, 'bank_edit', 'Bank Edit'),
(216, 'debit_plus', 'Debit (+)'),
(217, 'credit_minus', 'Credit (-)'),
(218, 'account_name', 'Account Name'),
(219, 'account_type', 'Account Type'),
(220, 'account_real_name', 'Account Real Name'),
(221, 'manage_account', 'Manage Account'),
(222, 'company_name', 'Niha International'),
(223, 'edit_your_company_information', 'Edit your company information'),
(224, 'company_edit', 'Company Edit'),
(225, 'admin', 'Admin'),
(226, 'user', 'User'),
(227, 'password', 'Password'),
(228, 'last_name', 'Last Name'),
(229, 'first_name', 'First Name'),
(230, 'add_new_user_information', 'Add new user information'),
(231, 'user_type', 'User Type'),
(232, 'user_edit', 'User Edit'),
(233, 'rtr', 'RTR'),
(234, 'ltr', 'LTR'),
(235, 'ltr_or_rtr', 'LTR/RTR'),
(236, 'footer_text', 'Footer Text'),
(237, 'favicon', 'Favicon'),
(238, 'logo', 'Logo'),
(239, 'update_setting', 'Update Setting'),
(240, 'update_your_web_setting', 'Update your web setting'),
(241, 'login', 'Login'),
(242, 'your_strong_password', 'Your strong password'),
(243, 'your_unique_email', 'Your unique email'),
(244, 'please_enter_your_login_information', 'Please enter your login information.'),
(245, 'update_profile', 'Update Profile'),
(246, 'your_profile', 'Your Profile'),
(247, 're_type_password', 'Re-Type Password'),
(248, 'new_password', 'New Password'),
(249, 'old_password', 'Old Password'),
(250, 'new_information', 'New Information'),
(251, 'old_information', 'Old Information'),
(252, 'change_your_information', 'Change your information'),
(253, 'change_your_profile', 'Change your profile'),
(254, 'profile', 'Profile'),
(255, 'wrong_username_or_password', 'Wrong User Name Or Password !'),
(256, 'successfully_updated', 'Successfully Updated.'),
(257, 'blank_field_does_not_accept', 'Blank Field Does Not Accept !'),
(258, 'successfully_changed_password', 'Successfully changed password.'),
(259, 'you_are_not_authorised_person', 'You are not authorised person !'),
(260, 'password_and_repassword_does_not_match', 'Passwor and re-password does not match !'),
(261, 'new_password_at_least_six_character', 'New Password At Least 6 Character.'),
(262, 'you_put_wrong_email_address', 'You put wrong email address !'),
(263, 'cheque_ammount_asjusted', 'Cheque amount adjusted.'),
(264, 'successfully_payment_paid', 'Successfully Payment Paid.'),
(265, 'successfully_added', 'Successfully Added.'),
(266, 'successfully_updated_2_closing_ammount_not_changeale', 'Successfully Updated -2. Note: Closing Amount Not Changeable.'),
(267, 'successfully_payment_received', 'Successfully Payment Received.'),
(268, 'already_inserted', 'Already Inserted !'),
(269, 'successfully_delete', 'Successfully Delete.'),
(270, 'successfully_created', 'Successfully Created.'),
(271, 'logo_not_uploaded', 'Logo not uploaded !'),
(272, 'favicon_not_uploaded', 'Favicon not uploaded !'),
(273, 'supplier_mobile', 'Supplier Mobile'),
(274, 'supplier_address', 'Supplier Address'),
(275, 'supplier_details', 'Supplier Details'),
(276, 'add_new_supplier', 'Add New Supplier'),
(277, 'manage_suppiler', 'Manage Supplier'),
(278, 'manage_your_supplier', 'Manage your supplier'),
(279, 'manage_supplier_ledger', 'Manage supplier ledger'),
(280, 'invoice_id', 'Invoice ID'),
(281, 'deposite_id', 'Deposite ID'),
(282, 'supplier_actual_ledger', 'Supplier Payment Ledger'),
(283, 'supplier_information', 'Supplier Information'),
(284, 'event', 'Event'),
(285, 'add_new_income', 'Add New Income'),
(286, 'add_expese', 'Add Expense'),
(287, 'add_new_expense', 'Add New Expense'),
(288, 'total_inflow_ammount', 'Total Income Amount'),
(289, 'create_new_invoice', 'Create New Sale'),
(290, 'create_pos_invoice', 'Create POS Sale'),
(291, 'total_profit', 'Total Profit'),
(292, 'monthly_progress_report', 'Monthly Progress Report'),
(293, 'total_invoice', 'Total Sale'),
(294, 'account_summary', 'Account Summary'),
(295, 'total_supplier', 'Total Supplier'),
(296, 'total_product', 'Total Product'),
(297, 'total_customer', 'Total Customer'),
(298, 'supplier_edit', 'Supplier Edit'),
(299, 'add_new_invoice', 'Add New Sale'),
(300, 'add_new_purchase', 'Add new purchase'),
(301, 'currency', 'Currency'),
(302, 'currency_position', 'Currency Position'),
(303, 'left', 'Left'),
(304, 'right', 'Right'),
(305, 'add_tax', 'Add TAX'),
(306, 'manage_tax', 'Manage TAX'),
(307, 'add_new_tax', 'Add new TAX'),
(308, 'enter_tax', 'Enter TAX'),
(309, 'already_exists', 'Already Exists !'),
(310, 'successfully_inserted', 'Successfully Inserted.'),
(311, 'tax', 'TAX'),
(312, 'tax_edit', 'TAX Edit'),
(313, 'product_not_added', 'Product not added !'),
(314, 'total_tax', 'Total TAX'),
(315, 'manage_your_supplier_details', 'Manage your supplier details.'),
(316, 'invoice_description', 'Lorem Ipsum is sim ply dummy Lorem Ipsum is simply dummy Lorem Ipsum is simply dummy Lorem Ipsum is simply dummy Lorem Ipsum is simply dummy Lorem Ipsum is sim ply dummy Lorem Ipsum is simply dummy Lorem Ipsum is simply dummy Lorem Ipsum is simply dummy Lorem Ipsum is simply dummy'),
(317, 'thank_you_for_choosing_us', 'Thank you very much for choosing us.'),
(318, 'billing_date', 'Billing Date'),
(319, 'billing_to', 'Billing To'),
(320, 'billing_from', 'Billing From'),
(321, 'you_cant_delete_this_product', 'Sorry !!  You can\'t delete this product.This product already used in calculation system!'),
(322, 'old_customer', 'Old Customer'),
(323, 'new_customer', 'New Customer'),
(324, 'new_supplier', 'New Supplier'),
(325, 'old_supplier', 'Old Supplier'),
(326, 'credit_customer', 'Credit Customer'),
(327, 'account_already_exists', 'This Account Already Exists !'),
(328, 'edit_income', 'Edit Income'),
(329, 'you_are_not_access_this_part', 'You are not authorised person !'),
(330, 'account_edit', 'Account Edit'),
(331, 'due', 'Due'),
(332, 'expense_edit', 'Expense Edit'),
(333, 'please_select_customer', 'Please select customer !'),
(334, 'profit_report', 'Profit Report (Sale Wise)'),
(335, 'total_profit_report', 'Total profit report'),
(336, 'please_enter_valid_captcha', 'Please enter valid captcha.'),
(337, 'category_not_selected', 'Category not selected.'),
(338, 'supplier_not_selected', 'Supplier not selected.'),
(339, 'please_select_product', 'Please select product.'),
(340, 'product_model_already_exist', 'Product model already exist !'),
(341, 'invoice_logo', 'Sale Logo'),
(342, 'available_qnty', 'Av. Qnty.'),
(343, 'you_can_not_buy_greater_than_available_cartoon', 'You can not select grater than available cartoon !'),
(344, 'customer_details', 'Customer details'),
(345, 'manage_customer_details', 'Manage customer details.'),
(346, 'site_key', 'Captcha Site Key'),
(347, 'secret_key', 'Captcha Secret Key'),
(348, 'captcha', 'Captcha'),
(349, 'cartoon_quantity', 'Cartoon Quantity'),
(350, 'total_cartoon', 'Total Cartoon'),
(351, 'cartoon', 'Cartoon'),
(352, 'item_cartoon', 'Item/Cartoon'),
(353, 'product_and_supplier_did_not_match', 'Product and supplier did not match !'),
(354, 'if_you_update_purchase_first_select_supplier_then_product_and_then_quantity', 'If you update purchase,first select supplier then product and then update qnty.'),
(355, 'item', 'Item'),
(356, 'manage_your_credit_customer', 'Manage your credit customer'),
(357, 'total_quantity', 'Total Quantity'),
(358, 'quantity_per_cartoon', 'Quantity per cartoon'),
(359, 'barcode_qrcode_scan_here', 'Barcode or QR-code scan here'),
(360, 'synchronizer_setting', 'Synchronizer Setting'),
(361, 'data_synchronizer', 'Data Synchronizer'),
(362, 'hostname', 'Host name'),
(363, 'username', 'User Name'),
(364, 'ftp_port', 'FTP Port'),
(365, 'ftp_debug', 'FTP Debug'),
(366, 'project_root', 'Project Root'),
(367, 'please_try_again', 'Please try again'),
(368, 'save_successfully', 'Save successfully'),
(369, 'synchronize', 'Synchronize'),
(370, 'internet_connection', 'Internet Connection'),
(371, 'outgoing_file', 'Outgoing File'),
(372, 'incoming_file', 'Incoming File'),
(373, 'ok', 'Ok'),
(374, 'not_available', 'Not Available'),
(375, 'available', 'Available'),
(376, 'download_data_from_server', 'Download data from server'),
(377, 'data_import_to_database', 'Data import to database'),
(378, 'data_upload_to_server', 'Data uplod to server'),
(379, 'please_wait', 'Please Wait'),
(380, 'ooops_something_went_wrong', 'Oooops Something went wrong !'),
(381, 'upload_successfully', 'Upload successfully'),
(382, 'unable_to_upload_file_please_check_configuration', 'Unable to upload file please check configuration'),
(383, 'please_configure_synchronizer_settings', 'Please configure synchronizer settings'),
(384, 'download_successfully', 'Download successfully'),
(385, 'unable_to_download_file_please_check_configuration', 'Unable to download file please check configuration'),
(386, 'data_import_first', 'Data import past'),
(387, 'data_import_successfully', 'Data import successfully'),
(388, 'unable_to_import_data_please_check_config_or_sql_file', 'Unable to import data please check config or sql file'),
(389, 'total_sale_ctn', 'Total Sale Ctn'),
(390, 'in_qnty', 'In Qnty.'),
(391, 'out_qnty', 'Out Qnty.'),
(392, 'stock_report_supplier_wise', 'Stock Report (Supplier Wise)'),
(393, 'all_stock_report_supplier_wise', 'Stock Report (Suppler Wise)'),
(394, 'select_supplier', 'Select Supplier'),
(395, 'stock_report_product_wise', 'Stock Report (Product Wise)'),
(396, 'phone', 'Phone'),
(397, 'select_product', 'Select Product'),
(398, 'in_quantity', 'In Qnty.'),
(399, 'out_quantity', 'Out Qnty.'),
(400, 'in_taka', 'In TK.'),
(401, 'out_taka', 'Out TK.'),
(402, 'commission', 'Commission'),
(403, 'generate_commission', 'Generate Commssion'),
(404, 'commission_rate', 'Commission Rate'),
(405, 'total_ctn', 'Total Ctn.'),
(406, 'per_pcs_commission', 'Per PCS Commission'),
(407, 'total_commission', 'Total Commission'),
(408, 'enter', 'Enter'),
(409, 'please_add_walking_customer_for_default_customer', 'Please add \'Walking Customer\' for default customer.'),
(410, 'supplier_ammount', 'Supplier Amount'),
(411, 'my_sale_ammount', 'My Sale Amount'),
(412, 'signature_pic', 'Signature Picture'),
(413, 'branch', 'Branch'),
(414, 'ac_no', 'A/C Number'),
(415, 'ac_name', 'A/C Name'),
(416, 'bank_transaction', 'Bank Transaction'),
(417, 'bank', 'Bank'),
(418, 'withdraw_deposite_id', 'Withdraw / Deposite ID'),
(419, 'bank_ledger', 'Bank Ledger'),
(420, 'note_name', 'Note Name'),
(421, 'pcs', 'Pcs.'),
(422, '1', '1'),
(423, '2', '2'),
(424, '5', '5'),
(425, '10', '10'),
(426, '20', '20'),
(427, '50', '50'),
(428, '100', '100'),
(429, '500', '500'),
(430, '1000', '1000'),
(431, 'total_discount', 'Total Discount'),
(432, 'product_not_found', 'Product not found !'),
(433, 'this_is_not_credit_customer', 'This is not credit customer !'),
(434, 'personal_loan', 'Personal Loan'),
(435, 'add_person', 'Add Person'),
(436, 'add_loan', 'Add Loan'),
(437, 'add_payment', 'Add Payment'),
(438, 'manage_person', 'Manage Person'),
(439, 'personal_edit', 'Person Edit'),
(440, 'person_ledger', 'Person Ledger'),
(441, 'backup_restore', 'Backup '),
(442, 'database_backup', 'Database backup'),
(443, 'file_information', 'File information'),
(444, 'filename', 'Filename'),
(445, 'size', 'Size'),
(446, 'backup_date', 'Backup date'),
(447, 'backup_now', 'Backup now'),
(448, 'restore_now', 'Restore now'),
(449, 'are_you_sure', 'Are you sure ?'),
(450, 'download', 'Download'),
(451, 'backup_and_restore', 'Backup'),
(452, 'backup_successfully', 'Backup successfully'),
(453, 'delete_successfully', 'successfully Deleted'),
(454, 'stock_ctn', 'Stock/Qnt'),
(455, 'unit', 'Unit'),
(456, 'meter_m', 'Meter (M)'),
(457, 'piece_pc', 'Piece (Pc)'),
(458, 'kilogram_kg', 'Kilogram (Kg)'),
(459, 'stock_cartoon', 'Stock Cartoon'),
(460, 'add_product_csv', 'Add Product (CSV)'),
(461, 'import_product_csv', 'Import product (CSV)'),
(462, 'close', 'Close'),
(463, 'download_example_file', 'Download example file.'),
(464, 'upload_csv_file', 'Upload CSV File'),
(465, 'csv_file_informaion', 'CSV File Information'),
(466, 'out_of_stock', 'Out Of Stock'),
(467, 'others', 'Others'),
(468, 'full_paid', 'Full Paid'),
(469, 'successfully_saved', 'Your Data Successfully Saved'),
(470, 'manage_loan', 'Manage Loan'),
(471, 'receipt', 'Receipt'),
(472, 'payment', 'Payment'),
(473, 'cashflow', 'Daily Cash Flow'),
(474, 'signature', 'Signature'),
(475, 'supplier_reports', 'Supplier Reports'),
(476, 'generate', 'Generate'),
(477, 'todays_overview', 'Todays Overview'),
(478, 'last_sales', 'Last Sales'),
(479, 'manage_transaction', 'Manage Transaction'),
(480, 'daily_summary', 'Daily Summary'),
(481, 'daily_cash_flow', 'Daily Cash Flow'),
(482, 'custom_report', 'Custom Report'),
(483, 'transaction', 'Transaction'),
(484, 'receipt_amount', 'Receipt Amount'),
(485, 'transaction_details_datewise', 'Transaction Details Datewise'),
(486, 'cash_closing', 'Cash Closing'),
(487, 'you_can_not_buy_greater_than_available_qnty', 'You can not buy greater than available qnty.'),
(488, 'supplier_id', 'Supplier ID'),
(489, 'category_id', 'Category ID'),
(490, 'select_report', 'Select Report'),
(491, 'supplier_summary', 'Supplier summary'),
(492, 'sales_payment_actual', 'Sales payment actual'),
(493, 'today_already_closed', 'Today already closed.'),
(494, 'root_account', 'Root Account'),
(495, 'office', 'Office'),
(496, 'loan', 'Loan'),
(497, 'transaction_mood', 'Transaction Mood'),
(498, 'select_account', 'Select Account'),
(499, 'add_receipt', 'Add Receipt'),
(500, 'update_transaction', 'Update Transaction'),
(501, 'no_stock_found', 'No Stock Found !'),
(502, 'admin_login_area', 'Admin Login Area'),
(503, 'print_qr_code', 'Print QR Code'),
(504, 'discount_type', 'Discount Type'),
(505, 'discount_percentage', 'Discount'),
(506, 'fixed_dis', 'Fixed Dis.'),
(507, 'return', 'Return'),
(508, 'stock_return_list', 'Stock Return List'),
(509, 'wastage_return_list', 'Wastage Return List'),
(510, 'return_invoice', 'Sale Return'),
(511, 'sold_qty', 'Sold Qty'),
(512, 'ret_quantity', 'Return Qty'),
(513, 'deduction', 'Deduction'),
(514, 'check_return', 'Check Return'),
(515, 'reason', 'Reason'),
(516, 'usablilties', 'Usability'),
(517, 'adjs_with_stck', 'Adjust With Stock'),
(518, 'return_to_supplier', 'Return To Supplier'),
(519, 'wastage', 'Wastage'),
(520, 'to_deduction', 'Total Deduction '),
(521, 'nt_return', 'Net Return Amount'),
(522, 'return_list', 'Return List'),
(523, 'add_return', 'Add Return'),
(524, 'per_qty', 'Purchase Qty'),
(525, 'return_supplier', 'Supplier Return'),
(526, 'stock_purchase', 'Stock Purchase Price'),
(527, 'stock_sale', 'Stock Sale Price'),
(528, 'supplier_return', 'Supplier Return'),
(529, 'purchase_id', 'Purchase ID'),
(530, 'return_id', 'Return ID'),
(531, 'supplier_return_list', 'Supplier Return List'),
(532, 'c_r_slist', 'Stock Return Stock'),
(533, 'wastage_list', 'Wastage List'),
(534, 'please_input_correct_invoice_id', 'Please Input a Correct Sale ID'),
(535, 'please_input_correct_purchase_id', 'Please Input Your Correct  Purchase ID'),
(536, 'add_more', 'Add More'),
(537, 'prouct_details', 'Product Details'),
(538, 'prouct_detail', 'Product Details'),
(539, 'stock_return', 'Stock Return'),
(540, 'choose_transaction', 'Select Transaction'),
(541, 'transection_category', 'Select  Category'),
(542, 'transaction_categry', 'Select Category'),
(543, 'search_supplier', 'Search Supplier'),
(544, 'customer_id', 'Customer ID'),
(545, 'search_customer', 'Search Customer Invoice'),
(546, 'serial_no', 'SN'),
(547, 'item_discount', 'Item Discount'),
(548, 'invoice_discount', 'Sale Discount'),
(549, 'add_unit', 'Add Unit'),
(550, 'manage_unit', 'Manage Unit'),
(551, 'add_new_unit', 'Add New Unit'),
(552, 'unit_name', 'Unit Name'),
(553, 'payment_amount', 'Payment Amount'),
(554, 'manage_your_unit', 'Manage Your Unit'),
(555, 'unit_id', 'Unit ID'),
(556, 'unit_edit', 'Unit Edit'),
(557, 'vat', 'Vat'),
(558, 'sales_report_category_wise', 'Sales Report (Category wise)'),
(559, 'purchase_report_category_wise', 'Purchase Report (Category wise)'),
(560, 'category_wise_purchase_report', 'Category wise purchase report'),
(561, 'category_wise_sales_report', 'Category wise sales report'),
(562, 'best_sale_product', 'Best Sale Product'),
(563, 'all_best_sales_product', 'All Best Sales Products'),
(564, 'todays_customer_receipt', 'Todays Customer Receipt'),
(565, 'not_found', 'Record not found'),
(566, 'collection', 'Collection'),
(567, 'increment', 'Increment'),
(568, 'accounts_tree_view', 'Accounts Tree View'),
(569, 'debit_voucher', 'Debit Voucher'),
(570, 'voucher_no', 'Voucher No'),
(571, 'credit_account_head', 'Credit Account Head'),
(572, 'remark', 'Remark'),
(573, 'code', 'Code'),
(574, 'amount', 'Amount'),
(575, 'approved', 'Approved'),
(576, 'debit_account_head', 'Debit Account Head'),
(577, 'credit_voucher', 'Credit Voucher'),
(578, 'find', 'Find'),
(579, 'transaction_date', 'Transaction Date'),
(580, 'voucher_type', 'Voucher Type'),
(581, 'particulars', 'Particulars'),
(582, 'with_details', 'With Details'),
(583, 'general_ledger', 'General Ledger'),
(584, 'general_ledger_of', 'General ledger of'),
(585, 'pre_balance', 'Pre Balance'),
(586, 'current_balance', 'Current Balance'),
(587, 'to_date', 'To Date'),
(588, 'from_date', 'From Date'),
(589, 'trial_balance', 'Trial Balance'),
(590, 'authorized_signature', 'Authorized Signature'),
(591, 'chairman', 'Chairman'),
(592, 'total_income', 'Total Income'),
(593, 'statement_of_comprehensive_income', 'Statement of Comprehensive Income'),
(594, 'profit_loss', 'Profit Loss'),
(595, 'cash_flow_report', 'Cash Flow Report'),
(596, 'cash_flow_statement', 'Cash Flow Statement'),
(597, 'amount_in_dollar', 'Amount In Dollar'),
(598, 'opening_cash_and_equivalent', 'Opening Cash and Equivalent'),
(599, 'coa_print', 'Coa Print'),
(600, 'cash_flow', 'Cash Flow'),
(601, 'cash_book', 'Cash Book'),
(602, 'bank_book', 'Bank Book'),
(603, 'c_o_a', 'Chart of Account'),
(604, 'journal_voucher', 'Journal Voucher'),
(605, 'contra_voucher', 'Contra Voucher'),
(606, 'voucher_approval', 'Vouchar Approval'),
(607, 'supplier_payment', 'Supplier Payment'),
(608, 'customer_receive', 'Customer Receive'),
(609, 'gl_head', 'General Head'),
(610, 'account_code', 'Account Head'),
(611, 'opening_balance', 'Opening Balance'),
(612, 'head_of_account', 'Head of Account'),
(613, 'inventory_ledger', 'Inventory Ledger'),
(614, 'newpassword', 'New Password'),
(615, 'password_recovery', 'Password Recovery'),
(616, 'forgot_password', 'Forgot Password ??'),
(617, 'send', 'Send'),
(618, 'due_report', 'Due Report'),
(619, 'due_amount', 'Due Amount'),
(620, 'download_sample_file', 'Download Sample File'),
(621, 'customer_csv_upload', 'Customer Csv Upload'),
(622, 'csv_supplier', 'Csv Upload Supplier'),
(623, 'csv_upload_supplier', 'Csv Upload Supplier'),
(624, 'previous', 'Previous'),
(625, 'net_total', 'Net Total'),
(626, 'currency_list', 'Currency List'),
(627, 'currency_name', 'Currency Name'),
(628, 'currency_icon', 'Currency Symbol'),
(629, 'add_currency', 'Add Currency'),
(630, 'role_permission', 'Role Permission'),
(631, 'role_list', 'Role List'),
(632, 'user_assign_role', 'User Assign Role'),
(633, 'permission', 'Permission'),
(634, 'add_role', 'Add Role'),
(635, 'add_module', 'Add Module'),
(636, 'module_name', 'Module Name'),
(637, 'office_loan', 'Office Loan'),
(638, 'add_menu', 'Add Menu'),
(639, 'menu_name', 'Menu Name'),
(640, 'sl_no', 'Sl No'),
(641, 'create', 'Create'),
(642, 'read', 'Read'),
(643, 'role_name', 'Role Name'),
(644, 'qty', 'Quantity'),
(645, 'max_rate', 'Max Rate'),
(646, 'min_rate', 'Min Rate'),
(647, 'avg_rate', 'Average Rate'),
(648, 'role_permission_added_successfully', 'Role Permission Successfully Added'),
(649, 'update_successfully', 'Successfully Updated'),
(650, 'role_permission_updated_successfully', 'Role Permission Successfully Updated '),
(651, 'shipping_cost', 'Shipping Cost'),
(652, 'in_word', 'In Word '),
(653, 'shipping_cost_report', 'Shipping Cost Report'),
(654, 'cash_book_report', 'Cash Book Report'),
(655, 'inventory_ledger_report', 'Inventory Ledger Report'),
(656, 'trial_balance_with_opening_as_on', 'Trial Balance With Opening As On'),
(657, 'type', 'Type'),
(658, 'taka_only', 'Taka Only'),
(659, 'item_description', 'Desc'),
(660, 'sold_by', 'Sold By'),
(661, 'user_wise_sales_report', 'User Wise Sales Report'),
(662, 'user_name', 'User Name'),
(663, 'total_sold', 'Total Sold'),
(664, 'user_wise_sale_report', 'User Wise Sales Report'),
(665, 'barcode_or_qrcode', 'Barcode/QR-code'),
(666, 'category_csv_upload', 'Category Csv  Upload'),
(667, 'unit_csv_upload', 'Unit Csv Upload'),
(668, 'invoice_return_list', 'Sales Return list'),
(669, 'invoice_return', 'Sales Return'),
(670, 'tax_report', 'TAX Report'),
(671, 'select_tax', 'Select TAX'),
(672, 'hrm', 'HRM'),
(673, 'employee', 'Employee'),
(674, 'add_employee', 'Add Employee'),
(675, 'manage_employee', 'Manage Employee'),
(676, 'attendance', 'Attendance'),
(677, 'add_attendance', 'Attendance'),
(678, 'manage_attendance', 'Manage Attendance'),
(679, 'payroll', 'Payroll'),
(680, 'add_payroll', 'Payroll'),
(681, 'manage_payroll', 'Manage Payroll'),
(682, 'employee_type', 'Employee Type'),
(683, 'employee_designation', 'Employee Designation'),
(684, 'designation', 'Designation'),
(685, 'add_designation', 'Add Designation'),
(686, 'manage_designation', 'Manage Designation'),
(687, 'designation_update_form', 'Designation Update form'),
(688, 'picture', 'Picture'),
(689, 'country', 'Country'),
(690, 'blood_group', 'Blood Group'),
(691, 'address_line_1', 'Address Line 1'),
(692, 'address_line_2', 'Address Line 2'),
(693, 'zip', 'Zip code'),
(694, 'city', 'City'),
(695, 'hour_rate_or_salary', 'Houre Rate/Salary'),
(696, 'rate_type', 'Rate Type'),
(697, 'hourly', 'Hourly'),
(698, 'salary', 'Salary'),
(699, 'employee_update', 'Employee Update'),
(700, 'checkin', 'Check In'),
(701, 'employee_name', 'Employee Name'),
(702, 'checkout', 'Check Out'),
(703, 'confirm_clock', 'Confirm Clock'),
(704, 'stay', 'Stay Time'),
(705, 'sign_in', 'Sign In'),
(706, 'check_in', 'Check In'),
(707, 'single_checkin', 'Single Check In'),
(708, 'bulk_checkin', 'Bulk Check In'),
(709, 'successfully_checkout', 'Successfully Checkout'),
(710, 'attendance_report', 'Attendance Report'),
(711, 'datewise_report', 'Date Wise Report'),
(712, 'employee_wise_report', 'Employee Wise Report'),
(713, 'date_in_time_report', 'Date In Time Report'),
(714, 'request', 'Request'),
(715, 'sign_out', 'Sign Out'),
(716, 'work_hour', 'Work Hours'),
(717, 's_time', 'Start Time'),
(718, 'e_time', 'In Time'),
(719, 'salary_benefits_type', 'Benefits Type'),
(720, 'salary_benefits', 'Salary Benefits'),
(721, 'beneficial_list', 'Benefit List'),
(722, 'add_beneficial', 'Add Benefits'),
(723, 'add_benefits', 'Add Benefits'),
(724, 'benefits_list', 'Benefit List'),
(725, 'benefit_type', 'Benefit Type'),
(726, 'benefits', 'Benefit'),
(727, 'manage_benefits', 'Manage Benefits'),
(728, 'deduct', 'Deduct'),
(729, 'add', 'Add'),
(730, 'add_salary_setup', 'Add Salary Setup'),
(731, 'manage_salary_setup', 'Manage Salary Setup'),
(732, 'basic', 'Basic'),
(733, 'salary_type', 'Salary Type'),
(734, 'addition', 'Addition'),
(735, 'gross_salary', 'Gross Salary'),
(736, 'set', 'Set'),
(737, 'salary_generate', 'Salary Generate'),
(738, 'manage_salary_generate', 'Manage Salary Generate'),
(739, 'sal_name', 'Salary Name'),
(740, 'gdate', 'Generated Date'),
(741, 'generate_by', 'Generated By'),
(742, 'the_salary_of', 'The Salary of '),
(743, 'already_generated', ' Already Generated'),
(744, 'salary_month', 'Salary Month'),
(745, 'successfully_generated', 'Successfully Generated'),
(746, 'salary_payment', 'Salary Payment'),
(747, 'employee_salary_payment', 'Employee Salary Payment'),
(748, 'total_salary', 'Total Salary'),
(749, 'total_working_minutes', 'Total Working Hours'),
(750, 'working_period', 'Working Period'),
(751, 'paid_by', 'Paid By'),
(752, 'pay_now', 'Pay Now '),
(753, 'confirm', 'Confirm'),
(754, 'successfully_paid', 'Successfully Paid'),
(755, 'add_incometax', 'Add Income TAX'),
(756, 'setup_tax', 'Setup TAX'),
(757, 'start_amount', 'Start Amount'),
(758, 'end_amount', 'End Amount'),
(759, 'tax_rate', 'TAX Rate'),
(760, 'setup', 'Setup'),
(761, 'manage_income_tax', 'Manage Income TAX'),
(762, 'income_tax_updateform', 'Income TAX Update form'),
(763, 'positional_information', 'Positional Information'),
(764, 'personal_information', 'Personal Information'),
(765, 'timezone', 'Time Zone'),
(766, 'sms', 'SMS'),
(767, 'sms_configure', 'SMS Configure'),
(768, 'url', 'URL'),
(769, 'sender_id', 'Sender ID'),
(770, 'api_key', 'Api Key'),
(771, 'gui_pos', 'GUI POS'),
(772, 'manage_service', 'Manage Service'),
(773, 'service', 'Service'),
(774, 'add_service', 'Add Service'),
(775, 'service_edit', 'Service Edit'),
(776, 'service_csv_upload', 'Service CSV Upload'),
(777, 'service_name', 'Service Name'),
(778, 'charge', 'Charge'),
(779, 'service_invoice', 'Service Invoice'),
(780, 'service_discount', 'Service Discount'),
(781, 'hanging_over', 'ETD'),
(782, 'service_details', 'Service Details'),
(783, 'tax_settings', 'TAX Settings'),
(784, 'default_value', 'Default Value'),
(785, 'number_of_tax', 'Number of TAX'),
(786, 'please_select_employee', 'Please Select Employee'),
(787, 'manage_service_invoice', 'Manage Service Invoice'),
(788, 'update_service_invoice', 'Update Service Invoice'),
(789, 'customer_wise_tax_report', 'Customer Wise TAX Report'),
(790, 'service_id', 'Service Id'),
(791, 'invoice_wise_tax_report', 'Invoice Wise TAX Report'),
(792, 'reg_no', 'Reg No'),
(793, 'update_now', 'Update Now'),
(794, 'import', 'Import'),
(795, 'add_expense_item', 'Add Expense Item'),
(796, 'manage_expense_item', 'Manage Expense Item'),
(797, 'add_expense', 'Add Expense'),
(798, 'manage_expense', 'Manage Expense'),
(799, 'expense_statement', 'Expense Statement'),
(800, 'expense_type', 'Expense Type'),
(801, 'expense_item_name', 'Expense Item Name'),
(802, 'stock_purchase_price', 'Stock Purchase Price'),
(803, 'purchase_price', 'Purchase Price'),
(804, 'customer_advance', 'Customer Advance'),
(805, 'advance_type', 'Advance Type'),
(806, 'restore', 'Restore'),
(807, 'supplier_advance', 'Supplier Advance'),
(808, 'please_input_correct_invoice_no', 'Please Input Correct Invoice NO'),
(809, 'backup', 'Back Up'),
(810, 'app_setting', 'App Settings'),
(811, 'local_server_url', 'Local Server Url'),
(812, 'online_server_url', 'Online Server Url'),
(813, 'connet_url', 'Connected Hotspot Ip/url'),
(814, 'update_your_app_setting', 'Update Your App Setting'),
(815, 'select_category', 'Select Category'),
(816, 'mini_invoice', 'Mini Invoice'),
(817, 'purchase_details', 'Purchase Details'),
(818, 'disc', 'Dis %'),
(819, 'serial', 'Serial'),
(820, 'transaction_head', 'Transaction Head'),
(821, 'transaction_type', 'Transaction Type'),
(822, 'return_details', 'Return Details'),
(823, 'return_to_customer', 'Return To Customer'),
(824, 'sales_and_purchase_report_summary', 'Sales And Purchase Report Summary'),
(825, 'add_person_officeloan', 'Add Person (Office Loan)'),
(826, 'add_loan_officeloan', 'Add Loan (Office Loan)'),
(827, 'add_payment_officeloan', 'Add Payment (Office Loan)'),
(828, 'manage_loan_officeloan', 'Manage Loan (Office Loan)'),
(829, 'add_person_personalloan', 'Add Person (Personal Loan)'),
(830, 'add_loan_personalloan', 'Add Loan (Personal Loan)'),
(831, 'add_payment_personalloan', 'Add Payment (Personal Loan)'),
(832, 'manage_loan_personalloan', 'Manage Loan (Personal)'),
(833, 'hrm_management', 'Human Resource'),
(834, 'cash_adjustment', 'Cash Adjustment'),
(835, 'adjustment_type', 'Adjustment Type'),
(836, 'change', 'Change'),
(837, 'sale_by', 'Sale By'),
(838, 'salary_date', 'Salary Date'),
(839, 'earnings', 'Earnings'),
(840, 'total_addition', 'Total Addition'),
(841, 'total_deduction', 'Total Deduction'),
(842, 'net_salary', 'Net Salary'),
(843, 'ref_number', 'Reference Number'),
(844, 'name_of_bank', 'Name Of Bank'),
(845, 'salary_slip', 'Salary Slip'),
(846, 'basic_salary', 'Basic Salary'),
(847, 'return_from_customer', 'Return From Customer'),
(848, 'quotation', 'Quotation'),
(849, 'add_quotation', 'Add Quotation'),
(850, 'manage_quotation', 'Manage Quotation'),
(851, 'terms', 'Terms'),
(852, 'send_to_customer', 'Sent To Customer'),
(853, 'quotation_no', 'Quotation No'),
(854, 'quotation_date', 'Quotation Date'),
(855, 'total_service_tax', 'Total Service TAX'),
(856, 'totalservicedicount', 'Total Service Discount'),
(857, 'item_total', 'Item Total'),
(858, 'service_total', 'Service Total'),
(859, 'quot_description', 'Quotation Description'),
(860, 'sub_total', 'Sub Total'),
(861, 'mail_setting', 'Mail Setting'),
(862, 'mail_configuration', 'Mail Configuration'),
(863, 'mail', 'Mail'),
(864, 'protocol', 'Protocol'),
(865, 'smtp_host', 'SMTP Host'),
(866, 'smtp_port', 'SMTP Port'),
(867, 'sender_mail', 'Sender Mail'),
(868, 'mail_type', 'Mail Type'),
(869, 'html', 'HTML'),
(870, 'text', 'TEXT'),
(871, 'expiry_date', 'Expiry Date'),
(872, 'api_secret', 'Api Secret'),
(873, 'please_config_your_mail_setting', NULL),
(874, 'quotation_successfully_added', 'Quotation Successfully Added'),
(875, 'add_to_invoice', 'Add To Invoice'),
(876, 'added_to_invoice', 'Added To Invoice'),
(877, 'closing_balance', 'Closing Balance'),
(878, 'contact', 'Contact'),
(879, 'fax', 'Fax'),
(880, 'state', 'State'),
(881, 'discounts', 'Discount'),
(882, 'address1', 'Address1'),
(883, 'address2', 'Address2'),
(884, 'receive', 'Receive'),
(885, 'purchase_history', 'Purchase History'),
(886, 'cash_payment', 'Cash Payment'),
(887, 'bank_payment', 'Bank Payment'),
(888, 'do_you_want_to_print', 'Do You Want to Print'),
(889, 'yes', 'Yes'),
(890, 'no', 'No'),
(891, 'todays_sale', 'Today\'s Sales'),
(892, 'or', 'OR'),
(893, 'no_result_found', 'No Result Found'),
(894, 'add_service_quotation', 'Add Service Quotation'),
(895, 'add_to_invoice', 'Add To Invoice'),
(896, 'item_quotation', 'Item Quotation'),
(897, 'service_quotation', 'Service Quotation'),
(898, 'return_from', 'Return Form'),
(899, 'customer_return_list', 'Customer Return List'),
(900, 'pdf', 'Pdf'),
(901, 'note', 'Note'),
(902, 'update_debit_voucher', 'Update Debit Voucher'),
(903, 'update_credit_voucher', 'Update Credit voucher'),
(904, 'on', 'On'),
(905, '', ''),
(906, 'total_expenses', 'Total Expense'),
(907, 'already_exist', 'Already Exist'),
(908, 'checked_out', 'Checked Out'),
(909, 'update_salary_setup', 'Update Salary Setup'),
(910, 'employee_signature', 'Employee Signature'),
(911, 'payslip', 'Payslip'),
(912, 'exsisting_role', 'Existing Role'),
(913, 'filter', 'Filter'),
(914, 'testinput', NULL),
(915, 'update_quotation', 'Update Quotation'),
(916, 'quotation_successfully_updated', 'Quotation Successfully Updated'),
(917, 'successfully_approved', 'Successfully Approved'),
(918, 'expiry', 'Expiry'),
(919, 'user_list', 'User List'),
(920, 'assign_roleto_user', 'Assign Role To User'),
(921, 'assign_role_list', 'Assigned Role List'),
(922, 'application_settings', 'Application Settings'),
(923, 'company_list', 'Company List'),
(924, 'edit_company', 'Edit Company'),
(925, 'edit_user', 'Edit User'),
(926, 'edit_currency', 'Edit Currency'),
(927, 'mobile_no', 'Mobile No'),
(928, 'email_address', 'Email Address'),
(929, 'customer_list', 'Customer List'),
(930, 'advance_receipt', 'Advance Receipt'),
(931, 'supplier_list', 'Supplier List'),
(932, 'category_list', 'Category List'),
(933, 'no_record_found', 'No Record Found'),
(934, 'unit_list', 'Unit List'),
(935, 'edit_product', 'Edit Product'),
(936, 'payable_summary', 'Payable Summary'),
(937, 'pad_print', 'Pad Print'),
(938, 'pos_print', 'POS Print'),
(939, 'pos_invoice', 'POS Invoice'),
(940, 'employee_profile', 'Employee Profile'),
(941, 'edit_beneficials', 'Edit Beneficials'),
(942, 'edit_setup_update', 'Edit Salary Setup'),
(943, 'add_office_loan', 'Add Office Loan'),
(944, 'income_tax', 'Income TAX'),
(945, 'quotation_to_sale', 'Quotation To Sale'),
(946, 'quotation_edit', 'Edit Quotation'),
(947, 'edit_profile', 'Edit Profile'),
(948, 'edit_supplier', 'Edit Supplier'),
(949, 'edit_bank', 'Edit Bank'),
(950, 'balance_sheet', 'Balance Sheet'),
(951, 'salary_setup', 'Salary Setup'),
(952, 'account_head', 'Account Head'),
(953, 'add_invoice', 'Add Invoice'),
(954, 'general_ledger_report', 'General Ledger Report'),
(955, 'print_setting', 'Print Setting'),
(956, 'header', 'Header'),
(957, 'footer', 'Footer'),
(958, 'supplier_payment_receipt', 'Payment Receipt'),
(959, 'welcome_back', 'Welcome Back'),
(960, 'overwrite', 'Over Write'),
(961, 'module', 'Module'),
(962, 'purchase_key', 'Purchase Key'),
(963, 'buy_now', 'Buy Now'),
(964, 'module_list', 'Module List'),
(965, 'modules', 'Modules'),
(966, 'install', 'Install'),
(967, 'uninstall', 'Uninstall'),
(968, 'module_added_successfully', 'Module Added Successfully'),
(969, 'no_tables_are_registered_in_config', 'No table registered in config'),
(970, 'tables_are_not_available_in_database', 'Table Are not Available in Database'),
(971, 'addon', 'Add-ons'),
(972, 'generate_qr', 'Generate QR'),
(973, 'latestv', 'Latest Version'),
(974, 'Current Version', NULL),
(976, 'notesupdate', 'Note: If you want to update software,you Must have immediate previous version'),
(977, 'arabic', NULL),
(978, 'vat_no', 'VAT NO'),
(979, 'new_p_method', 'Add New Payment Method'),
(980, 'dis_val', 'Dis. Value'),
(981, 'vat_val', 'VAT Value'),
(982, 'ttl_val', 'Total VAT'),
(983, 'purchase_discount', 'Purchase Discount'),
(984, 'order_time', 'Order Time'),
(985, 'order_by', 'Order By'),
(986, 'terms_list', 'Sales Terms List'),
(987, 'terms_add', 'Add Sales Terms'),
(988, 'term_condi', 'Terms & Condition'),
(989, 'terms_update', 'Update Seles Terms'),
(990, 'add_payment_method', 'Add Payment Method'),
(991, 'payment_method_list', 'Payment Method List'),
(992, 'payment_method_name', 'Payment Method Name'),
(993, 'batch_no', 'Batch No'),
(994, 'total_with_vat', 'Total With VAT'),
(995, 'invoice_time', 'Invoice Time'),
(996, 'product_vat', 'Product VAT'),
(997, 'service_vat', 'Service VAT'),
(998, 'cr_no', 'CR NO'),
(999, 'service_payment', 'Service Payment'),
(1000, 'vat_tax_setting', 'VAT & TAX Setting'),
(1001, 'qty2', 'Qty'),
(1002, 'batch', 'Batch'),
(1003, 'disc', 'Disc'),
(1004, 'tot_price', 'Tot Price'),
(1005, 'tot_before_dis', 'Total Before Discount'),
(1006, 'tot_with_dis', 'Total with Discount'),
(1007, 'tax_vat', 'TAX Value'),
(1008, 'return_receipt_text', 'Please keep the receipt and bring it in case of return'),
(1009, 'invoice_qr_code', 'Invoice Qr-Code'),
(1010, 'sales_due', 'Today Sales Due'),
(1011, 'purchase_due', 'Today Purchase Due');

-- --------------------------------------------------------

--
-- Table structure for table `module`
--

CREATE TABLE IF NOT EXISTS `module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `directory` varchar(100) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
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
(10, 'bank', NULL, NULL, NULL, 1),
(11, 'tax', NULL, NULL, NULL, 1),
(12, 'hrm_management', NULL, NULL, NULL, 1),
(13, 'service', NULL, NULL, NULL, 1),
(15, 'setting', NULL, NULL, NULL, 1),
(16, 'quotation', NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `module_purchase_key`
--

CREATE TABLE IF NOT EXISTS `module_purchase_key` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identity` varchar(100) DEFAULT NULL,
  `purchase_key` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `payroll_tax_setup`
--

CREATE TABLE IF NOT EXISTS `payroll_tax_setup` (
  `tax_setup_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `start_amount` decimal(12,2) NOT NULL DEFAULT 0.00,
  `end_amount` decimal(12,2) NOT NULL DEFAULT 0.00,
  `rate` decimal(12,2) NOT NULL DEFAULT 0.00,
  `status` varchar(30) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`tax_setup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `personal_loan`
--

CREATE TABLE IF NOT EXISTS `personal_loan` (
  `per_loan_id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_id` varchar(30) NOT NULL,
  `person_id` varchar(30) NOT NULL,
  `debit` decimal(12,2) DEFAULT 0.00,
  `credit` decimal(12,2) NOT NULL DEFAULT 0.00,
  `date` varchar(30) NOT NULL,
  `details` varchar(100) NOT NULL,
  `status` int(11) NOT NULL COMMENT '1=no paid,2=paid',
  PRIMARY KEY (`per_loan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `person_information`
--

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

CREATE TABLE IF NOT EXISTS `person_ledger` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_id` varchar(50) NOT NULL,
  `person_id` varchar(50) NOT NULL,
  `date` varchar(50) NOT NULL,
  `debit` decimal(12,2) NOT NULL DEFAULT 0.00,
  `credit` decimal(12,2) NOT NULL DEFAULT 0.00,
  `details` text NOT NULL,
  `status` int(11) NOT NULL COMMENT '1=no paid,2=paid',
  PRIMARY KEY (`id`),
  KEY `person_id` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pesonal_loan_information`
--

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

CREATE TABLE IF NOT EXISTS `product_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `product_information`
--

CREATE TABLE IF NOT EXISTS `product_information` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` varchar(100) NOT NULL,
  `category_id` varchar(255) DEFAULT NULL,
  `product_name` varchar(255) NOT NULL,
  `price` float DEFAULT NULL,
  `unit` varchar(50) DEFAULT NULL,
  `tax` float DEFAULT NULL COMMENT 'Tax in %',
  `serial_no` varchar(200) DEFAULT NULL,
  `product_vat` float DEFAULT NULL,
  `product_model` varchar(100) DEFAULT NULL,
  `product_details` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `product_purchase`
--

CREATE TABLE IF NOT EXISTS `product_purchase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_id` bigint(20) NOT NULL,
  `chalan_no` varchar(100) NOT NULL,
  `supplier_id` bigint(20) NOT NULL,
  `grand_total_amount` decimal(12,2) NOT NULL DEFAULT 0.00,
  `paid_amount` decimal(10,2) DEFAULT 0.00,
  `due_amount` decimal(10,2) DEFAULT 0.00,
  `total_discount` decimal(10,2) DEFAULT NULL,
  `invoice_discount` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT 'sum of product discount',
  `total_vat_amnt` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT 'sum of product vat',
  `purchase_date` varchar(50) DEFAULT NULL,
  `purchase_details` text DEFAULT NULL,
  `status` int(11) NOT NULL,
  `bank_id` varchar(30) DEFAULT NULL,
  `payment_type` int(11) NOT NULL,
  `is_credit` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purchase_id` (`purchase_id`),
  KEY `supplier_id` (`supplier_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `product_purchase_details`
--

CREATE TABLE IF NOT EXISTS `product_purchase_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_detail_id` varchar(100) DEFAULT NULL,
  `purchase_id` bigint(20) DEFAULT NULL,
  `product_id` varchar(30) DEFAULT NULL,
  `quantity` decimal(10,2) DEFAULT NULL,
  `rate` decimal(10,2) DEFAULT NULL,
  `batch_id` varchar(30) DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `discount` float DEFAULT NULL COMMENT 'discount percentage',
  `discount_amnt` decimal(10,2) NOT NULL DEFAULT 0.00,
  `vat_amnt_per` decimal(10,2) NOT NULL DEFAULT 0.00,
  `vat_amnt` decimal(10,2) NOT NULL DEFAULT 0.00,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purchase_id` (`purchase_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `product_return`
--

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
  `product_rate` decimal(10,2) NOT NULL DEFAULT 0.00,
  `deduction` float NOT NULL,
  `total_deduct` decimal(10,2) NOT NULL DEFAULT 0.00,
  `total_tax` decimal(10,2) NOT NULL DEFAULT 0.00,
  `total_ret_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `net_total_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
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

CREATE TABLE IF NOT EXISTS `product_service` (
  `service_id` int(11) NOT NULL AUTO_INCREMENT,
  `service_name` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `charge` decimal(10,2) NOT NULL DEFAULT 0.00,
  `service_vat` float DEFAULT NULL,
  `is_fixed` int(11) NOT NULL DEFAULT 0,
  `is_dynamic` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `quotation`
--

CREATE TABLE IF NOT EXISTS `quotation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quotation_id` varchar(30) NOT NULL,
  `quot_description` text NOT NULL,
  `customer_id` varchar(30) NOT NULL,
  `quotdate` date NOT NULL,
  `expire_date` date DEFAULT NULL,
  `item_total_amount` decimal(12,2) NOT NULL,
  `item_total_dicount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `item_total_vat` double(10,2) NOT NULL DEFAULT 0.00,
  `item_total_tax` decimal(10,2) DEFAULT 0.00,
  `service_total_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `service_total_discount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `service_total_vat` double(10,2) NOT NULL DEFAULT 0.00,
  `service_total_tax` decimal(10,2) DEFAULT 0.00,
  `quot_dis_item` decimal(10,2) NOT NULL DEFAULT 0.00,
  `quot_dis_service` decimal(10,2) NOT NULL DEFAULT 0.00,
  `quot_no` varchar(50) NOT NULL,
  `is_fixed` int(11) NOT NULL DEFAULT 0,
  `is_dynamic` int(11) NOT NULL DEFAULT 0,
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

CREATE TABLE IF NOT EXISTS `quotation_service_used` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quot_id` varchar(20) NOT NULL,
  `service_id` int(11) NOT NULL,
  `qty` decimal(10,2) NOT NULL DEFAULT 0.00,
  `charge` decimal(10,2) NOT NULL DEFAULT 0.00,
  `discount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `discount_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `vat_per` decimal(10,2) DEFAULT 0.00,
  `vat_amnt` decimal(10,2) DEFAULT 0.00,
  `tax` decimal(10,2) DEFAULT 0.00,
  `total` decimal(10,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`id`),
  KEY `quot_id` (`quot_id`),
  KEY `service_id` (`service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `quotation_taxinfo`
--

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `role_permission`
--

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `salary_sheet_generate`
--

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

CREATE TABLE IF NOT EXISTS `salary_type` (
  `salary_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `sal_name` varchar(100) NOT NULL,
  `salary_type` varchar(50) NOT NULL,
  `status` varchar(30) NOT NULL,
  PRIMARY KEY (`salary_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sec_role`
--

CREATE TABLE IF NOT EXISTS `sec_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(100) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sec_userrole`
--

CREATE TABLE IF NOT EXISTS `sec_userrole` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `roleid` int(11) NOT NULL,
  `createby` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `createdate` datetime NOT NULL,
  UNIQUE KEY `ID` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `seles_termscondi`
--

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

CREATE TABLE IF NOT EXISTS `service_invoice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `voucher_no` varchar(30) NOT NULL,
  `date` date NOT NULL,
  `employee_id` varchar(100) DEFAULT NULL,
  `customer_id` varchar(30) NOT NULL,
  `total_amount` decimal(20,2) NOT NULL DEFAULT 0.00,
  `total_discount` decimal(20,2) NOT NULL DEFAULT 0.00,
  `invoice_discount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `total_vat_amnt` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT 'total invoice vat',
  `total_tax` decimal(10,2) DEFAULT 0.00,
  `paid_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `due_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `shipping_cost` decimal(10,2) NOT NULL DEFAULT 0.00,
  `previous` decimal(10,2) NOT NULL DEFAULT 0.00,
  `details` varchar(250) NOT NULL,
  `sales_by` varchar(20) DEFAULT NULL,
  `is_fixed` int(11) NOT NULL DEFAULT 0,
  `is_dynamic` int(11) NOT NULL DEFAULT 0,
  `is_credit` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `service_invoice_details`
--

CREATE TABLE IF NOT EXISTS `service_invoice_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` int(11) NOT NULL,
  `service_inv_id` varchar(30) NOT NULL,
  `qty` decimal(10,2) NOT NULL DEFAULT 0.00,
  `charge` decimal(10,2) NOT NULL DEFAULT 0.00,
  `discount` decimal(10,2) DEFAULT 0.00,
  `discount_amount` decimal(10,2) DEFAULT 0.00,
  `vat` decimal(10,2) DEFAULT 0.00,
  `vat_amnt` decimal(10,2) DEFAULT 0.00,
  `total` decimal(10,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`id`),
  KEY `service_id` (`service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sms_settings`
--

CREATE TABLE IF NOT EXISTS `sms_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `api_key` varchar(100) DEFAULT NULL,
  `api_secret` varchar(100) DEFAULT NULL,
  `from` varchar(100) DEFAULT NULL,
  `isinvoice` int(11) NOT NULL DEFAULT 0,
  `isservice` int(11) NOT NULL DEFAULT 0,
  `isreceive` int(11) NOT NULL DEFAULT 0,
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

CREATE TABLE IF NOT EXISTS `sub_module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 NOT NULL,
  `description` text CHARACTER SET utf8 DEFAULT NULL,
  `image` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `directory` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sub_module`
--

INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES
(1, 1, 'new_invoice', NULL, NULL, 'new_invoice', 1),
(2, 1, 'manage_invoice', NULL, NULL, 'manage_invoice', 1),
(3, 1, 'pos_invoice', NULL, NULL, 'gui_pos', 1),
(4, 2, 'add_customer', NULL, NULL, 'add_customer', 1),
(5, 2, 'manage_customer', NULL, NULL, 'manage_customer', 1),
(6, 2, 'credit_customer', NULL, NULL, 'credit_customer', 1),
(7, 2, 'paid_customer', NULL, NULL, 'paid_customer', 1),
(8, 2, 'customer_ledger', NULL, NULL, 'customer_ledger', 1),
(9, 2, 'customer_advance', NULL, NULL, 'customer_advance', 1),
(10, 3, 'category', NULL, NULL, 'category', 1),
(11, 3, 'manage_category', NULL, NULL, 'manage_category', 1),
(12, 3, 'unit', NULL, NULL, 'unit', 1),
(13, 3, 'manage_unit', NULL, NULL, 'manage_unit', 1),
(14, 3, 'add_product', NULL, NULL, 'create_product', 1),
(15, 3, 'import_product_csv', NULL, NULL, 'add_product_csv', 1),
(16, 3, 'manage_product', NULL, NULL, 'manage_product', 1),
(17, 4, 'add_supplier', NULL, NULL, 'add_supplier', 1),
(18, 4, 'manage_supplier', NULL, NULL, 'manage_supplier', 1),
(19, 4, 'supplier_ledger', NULL, NULL, 'supplier_ledger_report', 1),
(20, 4, 'supplier_advance', NULL, NULL, 'supplier_advance', 1),
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
(45, 9, 'supplier_payment', NULL, NULL, 'supplier_payment', 1),
(46, 9, 'customer_receive', NULL, NULL, 'customer_receive', 1),
(47, 9, 'opening_balance', NULL, NULL, 'opening_balance', 1),
(48, 9, 'debit_voucher', NULL, NULL, 'debit_voucher', 1),
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
(59, 9, 'cash_flow', NULL, NULL, 'cash_flow_report', 1),
(60, 9, 'coa_print', NULL, NULL, 'coa_print', 1),
(61, 10, 'add_new_bank', NULL, NULL, 'add_bank', 1),
(62, 10, 'manage_bank', NULL, NULL, 'bank_list', 1),
(63, 10, 'bank_transaction', NULL, NULL, 'bank_transaction', 1),
(64, 10, 'bank_ledger', NULL, NULL, 'bank_ledger', 1),
(65, 11, 'tax_settings', NULL, NULL, 'tax_settings', 1),
(66, 11, 'add_incometax', NULL, NULL, 'add_incometax', 1),
(67, 11, 'manage_income_tax', NULL, NULL, 'manage_income_tax', 1),
(68, 11, 'tax_report', NULL, NULL, 'tax_report', 1),
(69, 11, 'invoice_wise_tax_report', NULL, NULL, 'invoice_wise_tax_report', 1),
(70, 12, 'add_designation', NULL, NULL, 'add_designation', 1),
(71, 12, 'manage_designation', NULL, NULL, 'manage_designation', 1),
(72, 12, 'add_employee', NULL, NULL, 'add_employee', 1),
(73, 12, 'manage_employee', NULL, NULL, 'manage_employee', 1),
(74, 12, 'add_attendance', NULL, NULL, 'add_attendance', 1),
(75, 12, 'manage_attendance', NULL, NULL, 'manage_attendance', 1),
(76, 12, 'attendance_report', NULL, NULL, 'attendance_report', 1),
(77, 12, 'add_benefits', NULL, NULL, 'add_benefits', 1),
(78, 12, 'manage_benefits', NULL, NULL, 'manage_benefits', 1),
(79, 12, 'add_salary_setup', NULL, NULL, 'add_salary_setup', 1),
(80, 12, 'manage_salary_setup', NULL, NULL, 'manage_salary_setup', 1),
(81, 12, 'salary_generate', NULL, NULL, 'salary_generate', 1),
(82, 12, 'manage_salary_generate', NULL, NULL, 'manage_salary_generate', 1),
(83, 12, 'salary_payment', NULL, NULL, 'salary_payment', 1),
(84, 12, 'add_expense_item', NULL, NULL, 'add_expense_item', 1),
(85, 12, 'manage_expense_item', NULL, NULL, 'manage_expense_item', 1),
(86, 12, 'add_expense', NULL, NULL, 'add_expense', 1),
(87, 12, 'manage_expense', NULL, NULL, 'manage_expense', 1),
(88, 12, 'expense_statement', NULL, NULL, 'expense_statement', 1),
(89, 12, 'add_person_officeloan', NULL, NULL, 'add1_person', 1),
(90, 12, 'add_loan_officeloan', NULL, NULL, 'add_office_loan', 1),
(91, 12, 'add_payment_officeloan', NULL, NULL, 'add_loan_payment', 1),
(92, 12, 'manage_loan_officeloan', NULL, NULL, 'manage1_person', 1),
(93, 12, 'add_person_personalloan', NULL, NULL, 'add_person', 1),
(94, 12, 'add_loan_personalloan', NULL, NULL, 'add_loan', 1),
(95, 12, 'add_payment_personalloan', NULL, NULL, 'add_payment', 1),
(96, 12, 'manage_loan_personalloan', NULL, NULL, 'manage_person', 1),
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
(114, 15, 'sms_configure', NULL, NULL, 'sms_configure', 1),
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
(126, 9, 'payment_method_list', NULL, NULL, 'payment_method_list', 1);

-- --------------------------------------------------------

--
-- Table structure for table `supplier_information`
--

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
  `city` text DEFAULT NULL,
  `state` text DEFAULT NULL,
  `zip` varchar(50) DEFAULT NULL,
  `country` varchar(250) DEFAULT NULL,
  `details` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`supplier_id`),
  KEY `supplier_id` (`supplier_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `supplier_product`
--

CREATE TABLE IF NOT EXISTS `supplier_product` (
  `supplier_pr_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` varchar(30) CHARACTER SET utf8 NOT NULL,
  `products_model` varchar(30) CHARACTER SET latin1 DEFAULT NULL,
  `supplier_id` bigint(20) NOT NULL,
  `supplier_price` float DEFAULT NULL,
  PRIMARY KEY (`supplier_pr_id`),
  KEY `product_id` (`product_id`),
  KEY `supplier_id` (`supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `synchronizer_setting`
--

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

CREATE TABLE IF NOT EXISTS `tax_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `default_value` float NOT NULL,
  `tax_name` varchar(250) NOT NULL,
  `nt` int(11) NOT NULL,
  `reg_no` varchar(100) NOT NULL,
  `is_show` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE IF NOT EXISTS `units` (
  `unit_id` int(11) NOT NULL AUTO_INCREMENT,
  `unit_name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`unit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`unit_id`, `unit_name`, `status`) VALUES
(3, 'PCS', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(15) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `company_name` varchar(250) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `date_of_birth` varchar(255) DEFAULT NULL,
  `logo` varchar(250) DEFAULT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_id`, `last_name`, `first_name`, `company_name`, `address`, `phone`, `gender`, `date_of_birth`, `logo`, `status`) VALUES
(1, '1', 'User', 'Admin', NULL, NULL, NULL, NULL, NULL, 'assets/dist/img/profile_picture/profile.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_login`
--

CREATE TABLE IF NOT EXISTS `user_login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(15) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `user_type` int(11) DEFAULT NULL,
  `security_code` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_login`
--

INSERT INTO `user_login` (`id`, `user_id`, `username`, `password`, `user_type`, `security_code`, `status`) VALUES
(1, '1', 'admin@example.com', '41d99b369894eb1ec3f461135132d8bb', 1, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vat_tax_setting`
--

CREATE TABLE IF NOT EXISTS `vat_tax_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dynamic_tax` int(11) NOT NULL DEFAULT 0,
  `fixed_tax` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vat_tax_setting`
--

INSERT INTO `vat_tax_setting` (`id`, `dynamic_tax`, `fixed_tax`) VALUES
(1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `web_setting`
--

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
  `captcha` int(11) DEFAULT 1 COMMENT '0=active,1=inactive',
  `is_qr` int(11) NOT NULL,
  `site_key` varchar(250) DEFAULT NULL,
  `secret_key` varchar(250) DEFAULT NULL,
  `discount_type` int(11) DEFAULT 1,
  PRIMARY KEY (`setting_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `web_setting`
--

INSERT INTO `web_setting` (`setting_id`, `logo`, `invoice_logo`, `favicon`, `currency`, `timezone`, `currency_position`, `footer_text`, `language`, `rtr`, `captcha`, `is_qr`, `site_key`, `secret_key`, `discount_type`) VALUES
(1, '', '', '', '$', 'Asia/Dhaka', '0', 'Developed by  Bdtask', 'english', '0', 1, 1, '6LdiKhsUAAAAAMV4jQRmNYdZy2kXEuFe1HrdP5tt', '6LdiKhsUAAAAAMV4jQRmNYdZy2kXEuFe1HrdP5tt', 1);


INSERT INTO `language` (`id`, `phrase`, `english`) VALUES (NULL, 'delivery_note', 'Delivery note' );
ALTER TABLE `invoice` ADD `delivery_note` TEXT NULL AFTER `sales_by`;
UPDATE `language` SET `english` = 'Delivery Note' WHERE `language`.`phrase` = 'delivery_note';

-- after last update
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES (NULL, 'financial_year', 'Financial Year' );

INSERT INTO `language` (`id`, `phrase`, `english`) VALUES (NULL, 'close_financial_year', 'Close Financial Year' );
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES (NULL, 'create_financial_year', 'Create Financial Year' );
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES (NULL, 'year_closing', 'Year Closing' );
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES (NULL, 'financial_year_start_date', 'Financial Year Start' );
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES (NULL, 'financial_year_end_date', 'Financial Year End' );
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES (NULL, 'subaccount_list', 'Sub Account List' );
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES (NULL, 'subaccount_add', 'Sub Account Add' );
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES (NULL, 'subtype', 'Sub Type' );
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES (NULL, 'predefined_accounts', 'Predefined Accounts' );
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES (NULL, 'create_debit_voucher', 'Create Debit Voucher' );
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES (NULL, 'ledger_comment', 'Ledger Comment' );
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES (NULL, 'reverseHead', 'Reverse Account Name');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES (NULL, 'VNo', 'VNo');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES (NULL, 'ledgerComment', '	Ledger Comment');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES (NULL, 'create_credit_voucher', 'Create Credit Voucher');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES (NULL, 'create_contra_voucher', 'Create Contra Voucher');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES (NULL, 'create_journal_voucher', 'Create Journal Voucher');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES (NULL, 'reverse_account_head', 'Reverse Account Head');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES (NULL, 'bank_reconciliation', 'Bank Reconciliation');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES (NULL, 'day_book', 'Day Book');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES (NULL, 'sub_ledger', 'Sub Ledger');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES (NULL, 'income_statement_form', 'Income Statement');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES (NULL, 'year', 'Year');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES (NULL, 'expenditure_statement', 'Expenditure Statement');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES (NULL, 'profit_loss_report', 'Profit Loss');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES (NULL, 'fixedasset_schedule', 'Fixed Asset Schedule');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES (NULL, 'receipt_payment', 'Receipt & Payment');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES (NULL, 'cash_basis', 'Cash Basis');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES (NULL, 'accrual_basis', 'Accrual Basis');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES (NULL, 'bank_reconciliation_report', 'Bank Reconciliation Report');

ALTER TABLE `employee_salary_payment` ADD `salary_name` VARCHAR(100) NULL AFTER `payment_date`, ADD `payment_type` INT NULL AFTER `salary_name`, ADD `bank_name` VARCHAR(255) NULL AFTER `payment_type`;
ALTER TABLE `employee_salary_setup` ADD `is_percentage` INT NULL COMMENT 'all amount will add or deduct on percent if true ' AFTER `amount`;

CREATE TABLE `salary_setup_header` (
  `s_s_h_id` int(11) UNSIGNED NOT NULL,
  `employee_id` varchar(30) CHARACTER SET latin1 NOT NULL,
  `salary_payable` varchar(30) CHARACTER SET latin1 DEFAULT NULL,
  `absent_deduct` varchar(30) CHARACTER SET latin1 DEFAULT NULL,
  `tax_manager` varchar(30) CHARACTER SET latin1 NOT NULL,
  `status` varchar(30) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `salary_type` ADD `emp_sal_type` VARCHAR(50) NULL AFTER `status`, ADD `default_amount` VARCHAR(50) NULL AFTER `emp_sal_type`;

CREATE TABLE `gmb_salary_advance` --from main db

CREATE TABLE `gmb_salary_sheet_generate` --from main db

ALTER TABLE `gmb_salary_advance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;


ALTER TABLE `gmb_salary_sheet_generate`
  MODIFY `ssg_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

  CREATE TABLE IF NOT EXISTS `gmb_salary_generate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sal_month_year` varchar(11) NOT NULL,
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
  `net_salary` decimal(11,2) NOT NULL COMMENT 'after deduct net amount from gross salary',
  `createDate` date NOT NULL,
  `createBy` varchar(11) NOT NULL,
  `updateDate` date DEFAULT NULL,
  `updateBy` varchar(11) DEFAULT NULL,
  `medical_benefit` decimal(11,2) NOT NULL,
  `family_benefit` decimal(11,2) NOT NULL,
  `transportation_benefit` decimal(11,2) NOT NULL,
  `other_benefit` decimal(11,2) NOT NULL,
  `normal_working_hrs_month` decimal(20,2) NOT NULL,
  `actual_working_hrs_month` decimal(20,2) NOT NULL,
  `hourly_rate_basic` decimal(20,2) NOT NULL,
  `hourly_rate_trasport_allowance` decimal(20,2) NOT NULL,
  `basic_salary_pro_rated` decimal(20,2) NOT NULL,
  `transport_allowance_pro_rated` decimal(20,2) NOT NULL,
  `basic_transport_allowance` decimal(20,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

INSERT INTO `language` (`id`, `phrase`, `english`) VALUES (NULL, 'salary_advance_view', 'Salary Advance');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES (NULL, 'add_salary_advance', 'Add Salary Advance');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES (NULL, 'manage_salary_advance', 'Manage Salary Advance');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES (NULL, 'release_amount', 'Release Amount');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES (NULL, 'create_date', 'Create Date');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES (NULL, 'employee_salary_generate', 'Salary Generate');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES (NULL, 'approved_date', 'Approved Date');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES (NULL, 'approved_by', 'Approved By');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES (NULL, 'salar_month', 'Salary Month');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES (NULL, 'employee_salary_chart', 'Employee Salary Chart');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES (NULL, 'post', 'Post');
INSERT INTO `language` (`id`, `phrase`, `english`) VALUES (NULL, 'employee_salary_payment_view', 'Manage Employee Salary');
 

INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES
(null, 9, 'salary_advance_view', NULL, NULL, 'salary_advance_view', 1),
(null, 9, 'employee_salary_generate', NULL, NULL, 'employee_salary_generate', 1),
(null, 9, 'employee_salary_payment_view', NULL, NULL, 'employee_salary_payment_view', 1);


ALTER TABLE `invoice` ADD `ret_adjust_amnt` DECIMAL(10,2) NULL DEFAULT NULL AFTER `total_tax`;
ALTER TABLE `invoice_details` ADD `ret_invoice_id` BIGINT NULL DEFAULT NULL AFTER `invoice_id`;
ALTER TABLE `invoice` ADD `returnable_amount` DECIMAL(10,2) NULL DEFAULT NULL AFTER `ret_adjust_amnt`;
ALTER TABLE `web_setting` ADD `is_autoapprove_v` INT NOT NULL DEFAULT '0' AFTER `is_qr`;
