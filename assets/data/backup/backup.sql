#
# TABLE STRUCTURE FOR: activity_logs
#

DROP TABLE IF EXISTS `activity_logs`;

CREATE TABLE `activity_logs` (
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

#
# TABLE STRUCTURE FOR: app_setting
#

DROP TABLE IF EXISTS `app_setting`;

CREATE TABLE `app_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `localhserver` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `onlineserver` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hotspot` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `app_setting` (`id`, `localhserver`, `onlineserver`, `hotspot`) VALUES ('1', 'https://demo.bdtask.com', 'https://demo.bdtask.com', 'https://demo.bdtask.com');


#
# TABLE STRUCTURE FOR: bank_add
#

DROP TABLE IF EXISTS `bank_add`;

CREATE TABLE `bank_add` (
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

#
# TABLE STRUCTURE FOR: company_information
#

DROP TABLE IF EXISTS `company_information`;

CREATE TABLE `company_information` (
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

INSERT INTO `company_information` (`company_id`, `company_name`, `email`, `address`, `mobile`, `website`, `vat_no`, `cr_no`, `status`) VALUES ('1', 'হেল্পফুল শপ', 'nuruddin099@gmail.com', 'ধাপ, রংপুর ', '01739911134', 'https://helpfulshopbd.com', '', '', '1');


#
# TABLE STRUCTURE FOR: currency_tbl
#

DROP TABLE IF EXISTS `currency_tbl`;

CREATE TABLE `currency_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `currency_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `icon` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `currency_tbl` (`id`, `currency_name`, `icon`) VALUES ('2', 'USD', '$');
INSERT INTO `currency_tbl` (`id`, `currency_name`, `icon`) VALUES ('3', 'Tk.', '৳');


#
# TABLE STRUCTURE FOR: customer_information
#

DROP TABLE IF EXISTS `customer_information`;

CREATE TABLE `customer_information` (
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

INSERT INTO `customer_information` (`customer_id`, `customer_name`, `customer_address`, `address2`, `customer_mobile`, `customer_email`, `email_address`, `contact`, `phone`, `fax`, `city`, `state`, `zip`, `country`, `status`, `create_date`, `create_by`) VALUES ('1', 'Walk-in-customer', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2022-10-22 13:55:12', '1');
INSERT INTO `customer_information` (`customer_id`, `customer_name`, `customer_address`, `address2`, `customer_mobile`, `customer_email`, `email_address`, `contact`, `phone`, `fax`, `city`, `state`, `zip`, `country`, `status`, `create_date`, `create_by`) VALUES ('2', 'Maynul Haque', '', '', '', '', '', '', '', '', '', '', '', '', '1', '2022-10-24 16:42:35', '1');
INSERT INTO `customer_information` (`customer_id`, `customer_name`, `customer_address`, `address2`, `customer_mobile`, `customer_email`, `email_address`, `contact`, `phone`, `fax`, `city`, `state`, `zip`, `country`, `status`, `create_date`, `create_by`) VALUES ('3', 'Kibria', '', '', '', 'mdsohelranacse@gmail.com', '', '', '', '', '', '', '', '', '1', '2022-10-24 16:43:16', '1');
INSERT INTO `customer_information` (`customer_id`, `customer_name`, `customer_address`, `address2`, `customer_mobile`, `customer_email`, `email_address`, `contact`, `phone`, `fax`, `city`, `state`, `zip`, `country`, `status`, `create_date`, `create_by`) VALUES ('4', 'Maruf', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2022-10-24 16:43:47', NULL);


#
# TABLE STRUCTURE FOR: daily_closing
#

DROP TABLE IF EXISTS `daily_closing`;

CREATE TABLE `daily_closing` (
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

#
# TABLE STRUCTURE FOR: email_config
#

DROP TABLE IF EXISTS `email_config`;

CREATE TABLE `email_config` (
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

INSERT INTO `email_config` (`id`, `protocol`, `smtp_host`, `smtp_port`, `smtp_user`, `smtp_pass`, `mailtype`, `isinvoice`, `isservice`, `isquotation`) VALUES ('1', 'ssl', 'mail.waymarks.agency', '465', 'info@waymarks.agency', 'Mnbvcxz1!23', 'html', '1', '0', '0');


#
# TABLE STRUCTURE FOR: invoice
#

DROP TABLE IF EXISTS `invoice`;

CREATE TABLE `invoice` (
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `invoice` (`id`, `invoice_id`, `invoice`, `customer_id`, `date`, `total_amount`, `paid_amount`, `due_amount`, `prevous_due`, `shipping_cost`, `offline_invoice_no`, `invoice_discount`, `total_discount`, `total_vat_amnt`, `total_tax`, `ret_adjust_amnt`, `returnable_amount`, `sales_by`, `delivery_note`, `invoice_details`, `is_credit`, `is_fixed`, `is_dynamic`, `status`, `bank_id`, `payment_type`, `is_online`, `payment_method_id`, `added_on`, `added_by`, `edited_on`, `edited_by`, `warehouse_id`) VALUES ('1', '1', '1000001', '2', '2022-10-25', '1885.00', '1885.00', '0.00', '0.00', '80.00', NULL, '95.00', '0.00', '0.00', '0.00', NULL, NULL, '1', NULL, '', NULL, '0', '0', '1', NULL, '0', '1', '3', '2022-10-25 14:22:01', '1', NULL, NULL, '1');
INSERT INTO `invoice` (`id`, `invoice_id`, `invoice`, `customer_id`, `date`, `total_amount`, `paid_amount`, `due_amount`, `prevous_due`, `shipping_cost`, `offline_invoice_no`, `invoice_discount`, `total_discount`, `total_vat_amnt`, `total_tax`, `ret_adjust_amnt`, `returnable_amount`, `sales_by`, `delivery_note`, `invoice_details`, `is_credit`, `is_fixed`, `is_dynamic`, `status`, `bank_id`, `payment_type`, `is_online`, `payment_method_id`, `added_on`, `added_by`, `edited_on`, `edited_by`, `warehouse_id`) VALUES ('2', '2', '1000002', '3', '2022-10-25', '21680.00', '21680.00', '0.00', '0.00', '80.00', NULL, '2800.00', '0.00', '0.00', '0.00', NULL, NULL, '1', NULL, 'This is invoice details...', NULL, '0', '0', '1', NULL, '0', '1', '2', '2022-10-25 15:48:16', '1', '2022-10-25 17:57:48', '1', '1');
INSERT INTO `invoice` (`id`, `invoice_id`, `invoice`, `customer_id`, `date`, `total_amount`, `paid_amount`, `due_amount`, `prevous_due`, `shipping_cost`, `offline_invoice_no`, `invoice_discount`, `total_discount`, `total_vat_amnt`, `total_tax`, `ret_adjust_amnt`, `returnable_amount`, `sales_by`, `delivery_note`, `invoice_details`, `is_credit`, `is_fixed`, `is_dynamic`, `status`, `bank_id`, `payment_type`, `is_online`, `payment_method_id`, `added_on`, `added_by`, `edited_on`, `edited_by`, `warehouse_id`) VALUES ('3', '3', '1000003', '3', '2022-10-25', '7230.00', '7230.00', '0.00', '0.00', '80.00', NULL, '250.00', '0.00', '0.00', '0.00', NULL, NULL, '1', NULL, 'details here', NULL, '0', '0', '1', NULL, '0', '1', '3', '2022-10-25 15:51:32', '1', NULL, NULL, '1');
INSERT INTO `invoice` (`id`, `invoice_id`, `invoice`, `customer_id`, `date`, `total_amount`, `paid_amount`, `due_amount`, `prevous_due`, `shipping_cost`, `offline_invoice_no`, `invoice_discount`, `total_discount`, `total_vat_amnt`, `total_tax`, `ret_adjust_amnt`, `returnable_amount`, `sales_by`, `delivery_note`, `invoice_details`, `is_credit`, `is_fixed`, `is_dynamic`, `status`, `bank_id`, `payment_type`, `is_online`, `payment_method_id`, `added_on`, `added_by`, `edited_on`, `edited_by`, `warehouse_id`) VALUES ('4', '4', '1000004', '2', '2022-10-26', '10160.00', '10160.00', '0.00', '0.00', '80.00', NULL, '2520.00', '0.00', '0.00', '0.00', NULL, NULL, '1', NULL, '', NULL, '0', '0', '1', NULL, '0', '1', '3', '2022-10-26 09:37:00', '1', NULL, NULL, '1');


#
# TABLE STRUCTURE FOR: invoice_details
#

DROP TABLE IF EXISTS `invoice_details`;

CREATE TABLE `invoice_details` (
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `invoice_details` (`id`, `invoice_details_id`, `invoice_id`, `ret_invoice_id`, `product_id`, `serial_no`, `description`, `quantity`, `rate`, `batch_id`, `supplier_rate`, `total_price`, `discount`, `discount_per`, `vat_amnt`, `vat_amnt_per`, `tax`, `paid_amount`, `due_amount`, `status`) VALUES ('1', '942345588466997', '1', NULL, '16737744', NULL, NULL, '10.00', '190.00', NULL, NULL, '1805.00', '95.00', '5.00', NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `invoice_details` (`id`, `invoice_details_id`, `invoice_id`, `ret_invoice_id`, `product_id`, `serial_no`, `description`, `quantity`, `rate`, `batch_id`, `supplier_rate`, `total_price`, `discount`, `discount_per`, `vat_amnt`, `vat_amnt_per`, `tax`, `paid_amount`, `due_amount`, `status`) VALUES ('6', '967927656711557', '3', NULL, '19526545', NULL, NULL, '10.00', '140.00', NULL, NULL, '1260.00', '140.00', '10.00', NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `invoice_details` (`id`, `invoice_details_id`, `invoice_id`, `ret_invoice_id`, `product_id`, `serial_no`, `description`, `quantity`, `rate`, `batch_id`, `supplier_rate`, `total_price`, `discount`, `discount_per`, `vat_amnt`, `vat_amnt_per`, `tax`, `paid_amount`, `due_amount`, `status`) VALUES ('7', '692343763611841', '3', NULL, '62560353', NULL, NULL, '20.00', '190.00', NULL, NULL, '3800.00', '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `invoice_details` (`id`, `invoice_details_id`, `invoice_id`, `ret_invoice_id`, `product_id`, `serial_no`, `description`, `quantity`, `rate`, `batch_id`, `supplier_rate`, `total_price`, `discount`, `discount_per`, `vat_amnt`, `vat_amnt_per`, `tax`, `paid_amount`, `due_amount`, `status`) VALUES ('8', '798723762626449', '3', NULL, '69488303', NULL, NULL, '10.00', '220.00', NULL, NULL, '2090.00', '110.00', '5.00', NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `invoice_details` (`id`, `invoice_details_id`, `invoice_id`, `ret_invoice_id`, `product_id`, `serial_no`, `description`, `quantity`, `rate`, `batch_id`, `supplier_rate`, `total_price`, `discount`, `discount_per`, `vat_amnt`, `vat_amnt_per`, `tax`, `paid_amount`, `due_amount`, `status`) VALUES ('12', '217236857381553', '2', NULL, '69488303', NULL, NULL, '40.00', '220.00', NULL, NULL, '7920.00', '880.00', '10.00', NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `invoice_details` (`id`, `invoice_details_id`, `invoice_id`, `ret_invoice_id`, `product_id`, `serial_no`, `description`, `quantity`, `rate`, `batch_id`, `supplier_rate`, `total_price`, `discount`, `discount_per`, `vat_amnt`, `vat_amnt_per`, `tax`, `paid_amount`, `due_amount`, `status`) VALUES ('13', '551821841161292', '2', NULL, '16737744', NULL, NULL, '60.00', '190.00', NULL, NULL, '9690.00', '1710.00', '15.00', NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `invoice_details` (`id`, `invoice_details_id`, `invoice_id`, `ret_invoice_id`, `product_id`, `serial_no`, `description`, `quantity`, `rate`, `batch_id`, `supplier_rate`, `total_price`, `discount`, `discount_per`, `vat_amnt`, `vat_amnt_per`, `tax`, `paid_amount`, `due_amount`, `status`) VALUES ('14', '659265385538899', '2', NULL, '19526545', NULL, NULL, '30.00', '140.00', NULL, NULL, '3990.00', '210.00', '5.00', NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `invoice_details` (`id`, `invoice_details_id`, `invoice_id`, `ret_invoice_id`, `product_id`, `serial_no`, `description`, `quantity`, `rate`, `batch_id`, `supplier_rate`, `total_price`, `discount`, `discount_per`, `vat_amnt`, `vat_amnt_per`, `tax`, `paid_amount`, `due_amount`, `status`) VALUES ('15', '413313543351984', '4', NULL, '19526545', NULL, NULL, '90.00', '140.00', NULL, NULL, '10080.00', '2520.00', '20.00', NULL, NULL, NULL, NULL, NULL, '1');


#
# TABLE STRUCTURE FOR: language
#

DROP TABLE IF EXISTS `language`;

CREATE TABLE `language` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `phrase` text COLLATE utf8_unicode_ci NOT NULL,
  `english` text COLLATE utf8_unicode_ci,
  `bangla` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1104 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1', 'user_profile', 'User Profile', 'ব্যবহারকারীর প্রোফাইল');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('2', 'setting', 'Setting', 'স্থাপন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('3', 'language', 'Language', 'ভাষা');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('4', 'manage_users', 'Manage Users', 'ব্যবহারকারীদের ম্যানেজ করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('5', 'add_user', 'Add User', 'ব্যবহারকারী যোগ করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('6', 'manage_company', 'Manage Company', 'কোম্পানি পরিচালনা করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('7', 'web_settings', 'Software Settings', 'সফ্টওয়্যার সেটিংস');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('8', 'manage_accounts', 'Manage Accounts', 'অ্যাকাউন্ট পরিচালনা করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('9', 'create_accounts', 'Create Account', 'হিসাব তৈরি কর');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('10', 'manage_bank', 'Manage Bank', 'ব্যাংক পরিচালনা করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('11', 'add_new_bank', 'Add New Bank', 'নতুন ব্যাংক যোগ করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('12', 'settings', 'Settings', 'সেটিংস');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('13', 'closing_report', 'Closing Report', 'ক্লোজিং রিপোর্ট');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('14', 'closing', 'Closing', 'বন্ধ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('15', 'cheque_manager', 'Cheque Manager', 'ম্যানেজার চেক করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('16', 'accounts_summary', 'Accounts Summary', 'অ্যাকাউন্টের সারাংশ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('17', 'expense', 'Expense', 'ব্যয়');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('18', 'income', 'Income', 'আয়');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('19', 'accounts', 'Accounts', 'হিসাব');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('20', 'stock_report', 'Stock Report', 'স্টক রিপোর্ট');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('21', 'stock', 'Stock', 'স্টক');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('22', 'pos_invoice', 'POS Sale', 'POS বিক্রয়');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('23', 'manage_invoice', 'Manage Sale', 'বিক্রয় পরিচালনা করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('24', 'new_invoice', 'New Sale', 'নতুন বিক্রয়');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('25', 'invoice', 'Sale', 'বিক্রয়');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('26', 'manage_purchase', 'Manage Purchase', 'ক্রয় পরিচালনা করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('27', 'add_purchase', 'Add Purchase', 'ক্রয় যোগ করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('28', 'purchase', 'Purchase', 'ক্রয়');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('29', 'paid_customer', 'Paid Customer', 'প্রদত্ত গ্রাহক');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('30', 'manage_customer', 'Manage Customer', 'গ্রাহক পরিচালনা করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('31', 'add_customer', 'Add Customer', 'গ্রাহক যোগ করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('32', 'customer', 'Customer', 'ক্রেতা');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('33', 'supplier_payment_actual', 'Supplier Payment Ledger', 'সরবরাহকারী পেমেন্ট লেজার');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('34', 'supplier_sales_summary', 'Supplier Sales Summary', 'সরবরাহকারী বিক্রয় সারাংশ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('35', 'supplier_sales_details', 'Supplier Sales Details', 'সরবরাহকারী বিক্রয় বিবরণ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('36', 'supplier_ledger', 'Supplier Ledger', 'সরবরাহকারী খাতা');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('37', 'manage_supplier', 'Manage Supplier', 'সরবরাহকারী পরিচালনা করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('38', 'add_supplier', 'Add Supplier', 'সরবরাহকারী যোগ করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('39', 'supplier', 'Supplier', 'সরবরাহকারী');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('40', 'product_statement', 'Product Statement', 'পণ্য বিবৃতি');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('41', 'manage_product', 'Manage Product', 'পণ্য পরিচালনা করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('42', 'add_product', 'Add Product', 'পণ্য যোগ করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('43', 'product', 'Product', 'পণ্য');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('44', 'manage_category', 'Manage Category', 'বিভাগ পরিচালনা করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('45', 'add_category', 'Add Category', 'বিভাগ যোগ করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('46', 'category', 'Category', 'শ্রেণী');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('47', 'sales_report_product_wise', 'Sales Report (Product Wise)', 'বিক্রয় প্রতিবেদন (পণ্য অনুসারে)');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('48', 'purchase_report', 'Purchase Report', 'ক্রয় প্রতিবেদন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('49', 'sales_report', 'Sales Report', 'বিক্রয় রিপোর্ট');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('50', 'todays_report', 'Todays Report', 'আজকের প্রতিবেদন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('51', 'report', 'Report', 'রিপোর্ট');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('52', 'dashboard', 'Dashboard', 'ড্যাশবোর্ড');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('53', 'online', 'Online', 'অনলাইন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('54', 'logout', 'Logout', 'প্রস্থান');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('55', 'change_password', 'Change Password', 'পাসওয়ার্ড পরিবর্তন করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('56', 'total_purchase', 'Total Purchase', 'মোট ক্রয়');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('57', 'total_amount', 'Total Amount', 'সর্বমোট পরিমাণ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('58', 'supplier_name', 'Supplier Name', 'সরবরাহকারী নাম');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('59', 'invoice_no', 'Invoice No', 'চালান নং');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('60', 'purchase_date', 'Purchase Date', 'ক্রয় তারিখ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('61', 'todays_purchase_report', 'Todays Purchase Report', 'আজকের ক্রয় প্রতিবেদন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('62', 'total_sales', 'Total Sales', 'মোট বিক্রয়');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('63', 'customer_name', 'Customer Name', 'ক্রেতার নাম');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('64', 'sales_date', 'Sales Date', 'বিক্রয় তারিখ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('65', 'todays_sales_report', 'Todays Sales Report', 'আজকের বিক্রয় প্রতিবেদন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('66', 'home', 'Home', 'বাড়ি');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('67', 'todays_sales_and_purchase_report', 'Todays sales and purchase report', 'আজকের বিক্রয় এবং ক্রয় প্রতিবেদন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('68', 'total_ammount', 'Total Amount', 'সর্বমোট পরিমাণ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('69', 'rate', 'Rate', 'হার');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('70', 'product_model', 'Product Model', 'পণ্যের ধরণ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('71', 'product_name', 'Product Name', 'পণ্যের নাম');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('72', 'search', 'Search', 'অনুসন্ধান করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('73', 'end_date', 'End Date', 'শেষ তারিখ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('74', 'start_date', 'Start Date', 'শুরুর তারিখ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('75', 'total_purchase_report', 'Total Purchase Report', 'মোট ক্রয় প্রতিবেদন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('76', 'total_sales_report', 'Total Sales Report', 'মোট বিক্রয় রিপোর্ট');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('78', 'all_stock_report', 'All Stock Report', 'সমস্ত স্টক রিপোর্ট');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('79', 'search_by_product', 'Search By Product', 'পণ্য দ্বারা অনুসন্ধান করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('80', 'date', 'Date', 'তারিখ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('81', 'print', 'Print', 'ছাপা');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('82', 'stock_date', 'Stock Date', 'স্টক তারিখ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('83', 'print_date', 'Print Date', 'মুদ্রণ তারিখ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('84', 'sales', 'Sales', 'বিক্রয়');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('85', 'price', 'Price', 'দাম');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('86', 'sl', 'SL.', 'দাম. ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('87', 'add_new_category', 'Add new category', 'নতুন বিভাগ যোগ করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('88', 'category_name', 'Category Name', 'বিভাগ নাম');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('89', 'save', 'Save', 'সংরক্ষণ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('90', 'delete', 'Delete', 'মুছে ফেলা');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('91', 'update', 'Update', 'হালনাগাদ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('92', 'action', 'Action', 'কর্ম');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('93', 'manage_your_category', 'Manage your category ', 'আপনার বিভাগ পরিচালনা করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('94', 'category_edit', 'Category Edit', 'বিভাগ সম্পাদনা');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('95', 'status', 'Status', 'স্ট্যাটাস');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('96', 'active', 'Active', 'সক্রিয়');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('97', 'inactive', 'Inactive', 'নিষ্ক্রিয়');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('98', 'save_changes', 'Save Changes', 'পরিবর্তনগুলোর সংরক্ষন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('99', 'save_and_add_another', 'Save And Add Another', 'সংরক্ষণ করুন এবং অন্য যোগ করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('100', 'model', 'Model', 'মডেল');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('101', 'supplier_price', 'Supplier Price', 'সরবরাহকারীর মূল্য');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('102', 'sell_price', 'Sale Price', 'বিক্রয় মূল্য');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('103', 'image', 'Image', 'ছবি');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('104', 'select_one', 'Select One', 'একটা নির্বাচন করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('105', 'details', 'Details', 'বিস্তারিত');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('106', 'new_product', 'New Product', 'নতুন পণ্য');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('107', 'add_new_product', 'Add new product', 'নতুন পণ্য যোগ করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('108', 'barcode', 'Barcode', 'বারকোড');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('109', 'qr_code', 'Qr-Code', 'Qr-কোড');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('110', 'product_details', 'Product Details', 'পণ্যের বিবরণ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('111', 'manage_your_product', 'Manage your product', 'আপনার পণ্য পরিচালনা করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('112', 'product_edit', 'Product Edit', 'পণ্য সম্পাদনা');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('113', 'edit_your_product', 'Edit your product', 'আপনার পণ্য সম্পাদনা করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('114', 'cancel', 'Cancel', 'বাতিল করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('115', 'incl_vat', 'Incl. Vat', 'বাতিল করুন. ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('116', 'money', 'TK', 'টাকা');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('117', 'grand_total', 'Grand Total', 'সর্বমোট');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('118', 'quantity', 'Quantity', 'পরিমাণ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('119', 'product_report', 'Product Report', 'পণ্য রিপোর্ট');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('120', 'product_sales_and_purchase_report', 'Product sales and purchase report', 'পণ্য বিক্রয় এবং ক্রয় প্রতিবেদন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('121', 'previous_stock', 'Previous Stock', 'পূর্ববর্তী স্টক');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('122', 'out', 'Out', 'আউট');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('123', 'in', 'In', 'ভিতরে');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('124', 'to', 'To', 'প্রতি');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('125', 'previous_balance', 'Previous Balance', 'পূর্বের হিসাব');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('126', 'customer_address', 'Customer Address', 'গ্রাহকের ঠিকানা');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('127', 'customer_mobile', 'Customer Mobile', 'গ্রাহক মোবাইল');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('128', 'customer_email', 'Customer Email', 'গ্রাহক ইমেল');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('129', 'add_new_customer', 'Add new customer', 'নতুন গ্রাহক যোগ করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('130', 'balance', 'Balance', 'ভারসাম্য');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('131', 'mobile', 'Mobile', 'মুঠোফোন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('132', 'address', 'Address', 'ঠিকানা');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('133', 'manage_your_customer', 'Manage your customer', 'আপনার গ্রাহক পরিচালনা করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('134', 'customer_edit', 'Customer Edit', 'গ্রাহক সম্পাদনা');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('135', 'paid_customer_list', 'Paid Customer List', 'প্রদত্ত গ্রাহক তালিকা');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('136', 'ammount', 'Amount', 'পরিমাণ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('137', 'customer_ledger', 'Customer Ledger', 'গ্রাহক লেজার');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('138', 'manage_customer_ledger', 'Manage Customer Ledger', 'গ্রাহক লেজার পরিচালনা করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('139', 'customer_information', 'Customer Information', 'গ্রাহক তথ্য');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('140', 'debit_ammount', 'Debit Amount', 'ডেবিট পরিমাণ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('141', 'credit_ammount', 'Credit Amount', 'ক্রেডিট পরিমাণ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('142', 'balance_ammount', 'Balance Amount', 'ভারসাম্য পরিমাণ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('143', 'receipt_no', 'Receipt NO', 'প্রাপ্তি কোন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('144', 'description', 'Description', 'বর্ণনা');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('145', 'debit', 'Debit', 'ডেবিট');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('146', 'credit', 'Credit', 'ক্রেডিট');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('147', 'item_information', 'Item Information', 'আইটেম তথ্য');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('148', 'total', 'Total', 'মোট');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('149', 'please_select_supplier', 'Please Select Supplier', 'অনুগ্রহ করে সরবরাহকারী নির্বাচন করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('150', 'submit', 'Submit', 'জমা দিন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('151', 'submit_and_add_another', 'Submit And Add Another One', 'জমা দিন এবং অন্য একটি যোগ করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('152', 'add_new_item', 'Add New Item', 'নতুন আইটেম যোগ করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('153', 'manage_your_purchase', 'Manage your purchase', 'আপনার ক্রয় পরিচালনা করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('154', 'purchase_edit', 'Purchase Edit', 'ক্রয় সম্পাদনা করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('155', 'purchase_ledger', 'Purchase Ledger', 'ক্রয় লেজার');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('156', 'invoice_information', 'Sale Information', 'বিক্রয় তথ্য');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('157', 'paid_ammount', 'Paid Amount', 'দেওয়া পরিমাণ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('158', 'discount', 'Dis./Pcs.', 'দেওয়া পরিমাণ. . ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('159', 'save_and_paid', 'Save And Paid', 'সংরক্ষণ করুন এবং অর্থপ্রদান করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('160', 'payee_name', 'Payee Name', 'পাওনাদারের নাম');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('161', 'manage_your_invoice', 'Manage your Sale', 'আপনার বিক্রয় পরিচালনা করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('162', 'invoice_edit', 'Sale Edit', 'বিক্রয় সম্পাদনা');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('163', 'new_pos_invoice', 'New POS Sale', 'নতুন POS বিক্রয়');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('164', 'add_new_pos_invoice', 'Add new pos Sale', 'নতুন পোস্ট বিক্রয় যোগ করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('165', 'product_id', 'Product ID', 'পণ্য আইডি');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('166', 'paid_amount', 'Paid Amount', 'দেওয়া পরিমাণ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('167', 'authorised_by', 'Authorised By', 'অনুমোদিত');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('168', 'checked_by', 'Checked By', 'দ্বারা পরীক্ষিত');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('169', 'received_by', 'Received By', 'গ্রহণকারী');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('170', 'prepared_by', 'Prepared By', 'প্রস্তুতকারক');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('171', 'memo_no', 'Memo No', 'মেমো নং');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('172', 'website', 'Website', 'ওয়েবসাইট');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('173', 'email', 'Email', 'ইমেইল');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('174', 'invoice_details', 'Sale Details', 'বিক্রয় বিবরণ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('175', 'reset', 'Reset', 'রিসেট');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('176', 'payment_account', 'Payment Account', 'টাকা পরিষদের অ্যাকাউন্ট');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('177', 'bank_name', 'Bank Name', 'ব্যাংকের নাম');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('178', 'cheque_or_pay_order_no', 'Cheque/Pay Order No', 'চেক/পে অর্ডার নম্বর');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('179', 'payment_type', 'Payment Type', 'শোধের ধরণ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('180', 'payment_from', 'Payment From', 'থেকে পেমেন্ট');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('181', 'payment_date', 'Payment Date', 'টাকা প্রদানের তারিখ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('182', 'add_income', 'Add Income', 'আয় যোগ করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('183', 'cash', 'Cash', 'নগদ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('184', 'cheque', 'Cheque', 'চেক করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('185', 'pay_order', 'Pay Order', 'পে অর্ডার');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('186', 'payment_to', 'Payment To', 'পরিশোদ করা');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('187', 'total_outflow_ammount', 'Total Expense Amount', 'মোট ব্যয়ের পরিমাণ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('188', 'transections', 'Transections', 'লেনদেন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('189', 'accounts_name', 'Accounts Name', 'অ্যাকাউন্টের নাম');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('190', 'outflow_report', 'Expense Report', 'ব্যয় রিপোর্ট');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('191', 'inflow_report', 'Income Report', 'আয় রিপোর্ট');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('192', 'all', 'All', 'সব');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('193', 'account', 'Account', 'হিসাব');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('194', 'from', 'From', 'থেকে');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('195', 'account_summary_report', 'Account Summary Report', 'অ্যাকাউন্ট সারাংশ রিপোর্ট');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('196', 'search_by_date', 'Search By Date', 'তারিখ অনুসারে অনুসন্ধান করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('197', 'cheque_no', 'Cheque No', 'চেক নম্বর');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('198', 'name', 'Name', 'নাম');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('199', 'closing_account', 'Closing Account', 'অ্যাকাউন্ট বন্ধ করা হচ্ছে');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('200', 'close_your_account', 'Close your account', 'আপনার অ্যাকাউন্ট বন্ধ করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('201', 'last_day_closing', 'Last Day Closing', 'শেষ দিনের সমাপনী');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('202', 'cash_in', 'Cash In', 'টাকা ঢুকান');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('203', 'cash_out', 'Cash Out', 'উত্তোলন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('204', 'cash_in_hand', 'Cash In Hand', 'হাতে নগদ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('205', 'add_new_bank', 'Add New Bank', 'নতুন ব্যাংক যোগ করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('206', 'day_closing', 'Day Closing', 'দিন বন্ধ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('207', 'account_closing_report', 'Account Closing Report', 'অ্যাকাউন্ট ক্লোজিং রিপোর্ট');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('208', 'last_day_ammount', 'Last Day Amount', 'শেষ দিনের পরিমাণ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('209', 'adjustment', 'Adjustment', 'সামঞ্জস্য');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('210', 'pay_type', 'Pay Type', 'পে টাইপ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('211', 'customer_or_supplier', 'Customer,Supplier Or Others', 'গ্রাহক, সরবরাহকারী বা অন্যদের');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('212', 'transection_id', 'Transections ID', 'লেনদেন আইডি');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('213', 'accounts_summary_report', 'Accounts Summary Report', 'অ্যাকাউন্টের সারাংশ রিপোর্ট');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('214', 'bank_list', 'Bank List', 'ব্যাংক তালিকা');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('215', 'bank_edit', 'Bank Edit', 'ব্যাংক সম্পাদনা');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('216', 'debit_plus', 'Debit (+)', 'ডেবিট (+)');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('217', 'credit_minus', 'Credit (-)', 'ক্রেডিট (-)');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('218', 'account_name', 'Account Name', 'হিসাবের নাম');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('219', 'account_type', 'Account Type', 'অ্যাকাউন্ট ধরন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('220', 'account_real_name', 'Account Real Name', 'অ্যাকাউন্টের আসল নাম');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('221', 'manage_account', 'Manage Account', 'অ্যাকাউন্ট পরিচালনা');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('222', 'company_name', 'Niha International', 'নিহা ইন্টারন্যাশনাল');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('223', 'edit_your_company_information', 'Edit your company information', 'আপনার কোম্পানির তথ্য সম্পাদনা করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('224', 'company_edit', 'Company Edit', 'কোম্পানি সম্পাদনা');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('225', 'admin', 'Admin', 'অ্যাডমিন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('226', 'user', 'User', 'ব্যবহারকারী');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('227', 'password', 'Password', 'পাসওয়ার্ড');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('228', 'last_name', 'Last Name', 'নামের শেষাংশ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('229', 'first_name', 'First Name', 'নামের প্রথম অংশ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('230', 'add_new_user_information', 'Add new user information', 'নতুন ব্যবহারকারীর তথ্য যোগ করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('231', 'user_type', 'User Type', 'ব্যবহারকারীর ধরন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('232', 'user_edit', 'User Edit', 'ব্যবহারকারী সম্পাদনা');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('233', 'rtr', 'RTR', 'আরটিআর');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('234', 'ltr', 'LTR', 'এলটিআর');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('235', 'ltr_or_rtr', 'LTR/RTR', 'এলটিআর/আরটিআর');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('236', 'footer_text', 'Footer Text', 'পাদচরণ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('237', 'favicon', 'Favicon', 'ফেভিকন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('238', 'logo', 'Logo', 'লোগো');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('239', 'update_setting', 'Update Setting', 'সেটিং আপডেট করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('240', 'update_your_web_setting', 'Update your web setting', 'আপনার ওয়েব সেটিং আপডেট করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('241', 'login', 'Login', 'প্রবেশ করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('242', 'your_strong_password', 'Your strong password', 'আপনার শক্তিশালী পাসওয়ার্ড');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('243', 'your_unique_email', 'Your unique email', 'আপনার অনন্য ইমেল');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('244', 'please_enter_your_login_information', 'Please enter your login information.', 'আপনার অনন্য ইমেল. ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('245', 'update_profile', 'Update Profile', 'প্রফাইল হালনাগাদ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('246', 'your_profile', 'Your Profile', 'তোমার প্রোফাইল');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('247', 're_type_password', 'Re-Type Password', 'পাসওয়ার্ড পুনরায় টাইপ করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('248', 'new_password', 'New Password', 'নতুন পাসওয়ার্ড');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('249', 'old_password', 'Old Password', 'পুরানো পাসওয়ার্ড');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('250', 'new_information', 'New Information', 'নতুন তথ্য');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('251', 'old_information', 'Old Information', 'পুরাতন তথ্য');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('252', 'change_your_information', 'Change your information', 'আপনার তথ্য পরিবর্তন করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('253', 'change_your_profile', 'Change your profile', 'আপনার প্রোফাইল পরিবর্তন করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('254', 'profile', 'Profile', 'প্রোফাইল');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('255', 'wrong_username_or_password', 'Wrong User Name Or Password !', 'ভুল ব্যবহারকারী নাম বা পাসওয়ার্ড !');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('256', 'successfully_updated', 'Updated Successfully', 'সফলভাবে আপডেট করা হয়েছে৷');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('257', 'blank_field_does_not_accept', 'Blank Field Does Not Accept !', 'খালি মাঠ মানায় না!');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('258', 'successfully_changed_password', 'Password Changed Successfully', 'পাসওয়ার্ড সফলভাবে পরিবর্তন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('259', 'you_are_not_authorised_person', 'You are not authorised person !', 'আপনি অনুমোদিত ব্যক্তি নন!');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('260', 'password_and_repassword_does_not_match', 'Passwor and re-password does not match !', 'পাসওয়ার্ড ও রি-পাসওয়ার্ড মিলছে না!');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('261', 'new_password_at_least_six_character', 'New Password At Least 6 Character.', 'পাসওয়ার্ড ও রি-পাসওয়ার্ড মিলছে না!. ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('262', 'you_put_wrong_email_address', 'You put wrong email address !', 'আপনি ভুল ইমেইল ঠিকানা দিয়েছেন!');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('263', 'cheque_ammount_asjusted', 'Cheque amount adjusted.', 'আপনি ভুল ইমেইল ঠিকানা দিয়েছেন!. ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('264', 'successfully_payment_paid', 'Successfully Payment Paid', 'সফলভাবে পেমেন্ট দেওয়া হয়েছে');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('265', 'successfully_added', 'Successfully Added', 'সফলভাবে যোগ করা হয়েছে');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('266', 'successfully_updated_2_closing_ammount_not_changeale', 'Successfully Updated -2. Note: Closing Amount Not Changeable.', '. . ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('267', 'successfully_payment_received', 'Successfully Payment Received', 'সফলভাবে পেমেন্ট প্রাপ্ত হয়েছে');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('268', 'already_inserted', 'Already Inserted !', 'ইতিমধ্যে ঢোকানো!');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('269', 'successfully_delete', 'Successfully Delete.', 'ইতিমধ্যে ঢোকানো!. ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('270', 'successfully_created', 'Successfully Created.', 'সফলভাবে পেমেন্ট প্রাপ্ত হয়েছে. ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('271', 'logo_not_uploaded', 'Logo not uploaded !', 'লোগো আপলোড হয়নি!');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('272', 'favicon_not_uploaded', 'Favicon not uploaded !', 'ফেভিকন আপলোড করা হয়নি!');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('273', 'supplier_mobile', 'Supplier Mobile', 'সরবরাহকারী মোবাইল');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('274', 'supplier_address', 'Supplier Address', 'সরবরাহকারীর ঠিকানা');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('275', 'supplier_details', 'Supplier Details', 'সরবরাহকারীর বিবরণ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('276', 'add_new_supplier', 'Add New Supplier', 'নতুন সরবরাহকারী যোগ করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('277', 'manage_suppiler', 'Manage Supplier', 'সরবরাহকারী পরিচালনা করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('278', 'manage_your_supplier', 'Manage your supplier', 'আপনার সরবরাহকারী পরিচালনা করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('279', 'manage_supplier_ledger', 'Manage supplier ledger', 'সরবরাহকারী খাতা পরিচালনা করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('280', 'invoice_id', 'Invoice ID', 'চালান আইডি');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('281', 'deposite_id', 'Deposite ID', 'ডিপোজিট আইডি');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('282', 'supplier_actual_ledger', 'Supplier Payment Ledger', 'সরবরাহকারী পেমেন্ট লেজার');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('283', 'supplier_information', 'Supplier Information', 'সরবরাহকারীর তথ্য');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('284', 'event', 'Event', 'ঘটনা');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('285', 'add_new_income', 'Add New Income', 'নতুন আয় যোগ করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('286', 'add_expese', 'Add Expense', 'খরচ যোগ করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('287', 'add_new_expense', 'Add New Expense', 'নতুন খরচ যোগ করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('288', 'total_inflow_ammount', 'Total Income Amount', 'মোট আয়ের পরিমাণ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('289', 'create_new_invoice', 'Create New Sale', 'নতুন বিক্রয় তৈরি করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('290', 'create_pos_invoice', 'Create POS Sale', 'POS বিক্রয় তৈরি করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('291', 'total_profit', 'Total Profit', 'সমস্ত লাভ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('292', 'monthly_progress_report', 'Monthly Progress Report', 'মাসিক অগ্রগতি রিপোর্ট');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('293', 'total_invoice', 'Total Sale', 'মোট বিক্রয়');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('294', 'account_summary', 'Account Summary', 'অ্যাকাউন্টের সারাংশ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('295', 'total_supplier', 'Total Supplier', 'মোট সরবরাহকারী');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('296', 'total_product', 'Total Product', 'মোট পণ্য');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('297', 'total_customer', 'Total Customer', 'মোট গ্রাহক');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('298', 'supplier_edit', 'Supplier Edit', 'সরবরাহকারী সম্পাদনা');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('299', 'add_new_invoice', 'Add New Sale', 'নতুন বিক্রয় যোগ করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('300', 'add_new_purchase', 'Add new purchase', 'নতুন ক্রয় যোগ করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('301', 'currency', 'Currency', 'মুদ্রা');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('302', 'currency_position', 'Currency Position', 'মুদ্রার অবস্থান');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('303', 'left', 'Left', 'বাম');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('304', 'right', 'Right', 'ঠিক');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('305', 'add_tax', 'Add TAX', 'ট্যাক্স যোগ করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('306', 'manage_tax', 'Manage TAX', 'ট্যাক্স পরিচালনা করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('307', 'add_new_tax', 'Add new TAX', 'নতুন ট্যাক্স যোগ করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('308', 'enter_tax', 'Enter TAX', 'TAX লিখুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('309', 'already_exists', 'Already Exists !', 'আগে থেকেই আছে !');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('310', 'successfully_inserted', 'Successfully Inserted.', 'আগে থেকেই আছে !. ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('311', 'tax', 'TAX', 'ট্যাক্স');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('312', 'tax_edit', 'TAX Edit', 'ট্যাক্স সম্পাদনা');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('313', 'product_not_added', 'Product not added !', 'পণ্য যোগ করা হয়নি!');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('314', 'total_tax', 'Total TAX', 'মোট ট্যাক্স');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('315', 'manage_your_supplier_details', 'Manage your supplier details.', 'মোট ট্যাক্স. ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('316', 'invoice_description', 'Lorem Ipsum is sim ply dummy Lorem Ipsum is simply dummy Lorem Ipsum is simply dummy Lorem Ipsum is simply dummy Lorem Ipsum is simply dummy Lorem Ipsum is sim ply dummy Lorem Ipsum is simply dummy Lorem Ipsum is simply dummy Lorem Ipsum is simply dummy Lorem Ipsum is simply dummy', 'Lorem Ipsum হল সিম প্লাই ডামি Lorem Ipsum হল শুধু ডামি Lorem Ipsum হল শুধু ডামি Lorem Ipsum হল ডামি Lorem Ipsum হল শুধু ডামি Lorem Ipsum হল সিম প্লাই ডামি Lorem Ipsum হল শুধু ডামি Lorem Ipsum হল ডামি Ipsum is Lorem Ipsum ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('317', 'thank_you_for_choosing_us', 'Thank you very much for choosing us.', 'Lorem Ipsum হল সিম প্লাই ডামি Lorem Ipsum হল শুধু ডামি Lorem Ipsum হল শুধু ডামি Lorem Ipsum হল ডামি Lorem Ipsum হল শুধু ডামি Lorem Ipsum হল সিম প্লাই ডামি Lorem Ipsum হল শুধু ডামি Lorem Ipsum হল ডামি Ipsum is Lorem Ipsum . ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('318', 'billing_date', 'Billing Date', 'বিলিং তারিখ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('319', 'billing_to', 'Billing To', 'বিলিং করতে');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('320', 'billing_from', 'Billing From', 'থেকে বিলিং');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('321', 'you_cant_delete_this_product', 'Sorry !!  You can\'t delete this product.This product already used in calculation system!', 'থেকে বিলিং. ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('322', 'old_customer', 'Old Customer', 'পুরাতন গ্রাহক');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('323', 'new_customer', 'New Customer', 'নতুন গ্রাহক');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('324', 'new_supplier', 'New Supplier', 'নতুন সরবরাহকারী');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('325', 'old_supplier', 'Old Supplier', 'পুরাতন সরবরাহকারী');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('326', 'credit_customer', 'Credit Customer', 'ক্রেডিট গ্রাহক');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('327', 'account_already_exists', 'This Account Already Exists !', 'এই অ্যাকাউন্টটি ইতিমধ্যেই বিদ্যমান !');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('328', 'edit_income', 'Edit Income', 'আয় সম্পাদনা করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('329', 'you_are_not_access_this_part', 'You are not authorised person !', 'আপনি অনুমোদিত ব্যক্তি নন!');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('330', 'account_edit', 'Account Edit', 'অ্যাকাউন্ট সম্পাদনা');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('331', 'due', 'Due', 'বাকি');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('332', 'expense_edit', 'Expense Edit', 'ব্যয় সম্পাদনা');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('333', 'please_select_customer', 'Please select customer !', 'গ্রাহক নির্বাচন করুন!');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('334', 'profit_report', 'Profit Report (Sale Wise)', 'লাভ রিপোর্ট (বিক্রয় অনুযায়ী)');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('335', 'total_profit_report', 'Total profit report', 'মোট লাভ রিপোর্ট');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('336', 'please_enter_valid_captcha', 'Please enter valid captcha.', 'মোট লাভ রিপোর্ট. ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('337', 'category_not_selected', 'Category not selected', 'বিভাগ নির্বাচন করা হয়নি');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('338', 'supplier_not_selected', 'Supplier not selected', 'সরবরাহকারী নির্বাচন করা হয়নি');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('339', 'please_select_product', 'Please select product.', '');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('340', 'product_model_already_exist', 'Product model already exist !', 'পণ্য মডেল ইতিমধ্যে বিদ্যমান!');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('341', 'invoice_logo', 'Sale Logo', 'বিক্রয় লোগো');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('342', 'available_qnty', 'Av. Qnty.', 'বিক্রয় লোগো. . ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('343', 'you_can_not_buy_greater_than_available_cartoon', 'You can not select grater than available cartoon !', 'আপনি উপলব্ধ কার্টুনের চেয়ে বড় নির্বাচন করতে পারবেন না!');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('344', 'customer_details', 'Customer details', 'গ্রাহক বিবরণ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('345', 'manage_customer_details', 'Manage customer details.', 'গ্রাহক বিবরণ. ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('346', 'site_key', 'Captcha Site Key', 'ক্যাপচা সাইট কী');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('347', 'secret_key', 'Captcha Secret Key', 'ক্যাপচা সিক্রেট কী');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('348', 'captcha', 'Captcha', 'ক্যাপচা');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('349', 'cartoon_quantity', 'Cartoon Quantity', 'কার্টুনের পরিমাণ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('350', 'total_cartoon', 'Total Cartoon', 'মোট কার্টুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('351', 'cartoon', 'Cartoon', 'কার্টুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('352', 'item_cartoon', 'Item/Cartoon', 'আইটেম/কার্টুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('353', 'product_and_supplier_did_not_match', 'Product and supplier did not match !', 'পণ্য ও সরবরাহকারীর মিল নেই!');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('354', 'if_you_update_purchase_first_select_supplier_then_product_and_then_quantity', 'If you update purchase,first select supplier then product and then update qnty.', 'পণ্য ও সরবরাহকারীর মিল নেই!. ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('355', 'item', 'Item', 'আইটেম');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('356', 'manage_your_credit_customer', 'Manage your credit customer', 'আপনার ক্রেডিট গ্রাহক পরিচালনা করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('357', 'total_quantity', 'Total Quantity', 'মোট পরিমাণ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('358', 'quantity_per_cartoon', 'Quantity per cartoon', 'কার্টুন প্রতি পরিমাণ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('359', 'barcode_qrcode_scan_here', 'Barcode or QR-code scan here', 'বারকোড বা QR-কোড এখানে স্ক্যান করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('360', 'synchronizer_setting', 'Synchronizer Setting', 'সিঙ্ক্রোনাইজার সেটিং');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('361', 'data_synchronizer', 'Data Synchronizer', 'ডেটা সিঙ্ক্রোনাইজার');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('362', 'hostname', 'Host name', 'হোস্টের নাম');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('363', 'username', 'User Name', 'ব্যবহারকারীর নাম');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('364', 'ftp_port', 'FTP Port', 'FTP পোর্ট');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('365', 'ftp_debug', 'FTP Debug', 'FTP ডিবাগ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('366', 'project_root', 'Project Root', 'প্রকল্প রুট');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('367', 'please_try_again', 'Please try again', 'অনুগ্রহপূর্বক আবার চেষ্টা করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('368', 'save_successfully', 'Saved successfully', 'সফলভাবে সংরক্ষিত');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('369', 'synchronize', 'Synchronize', 'সিঙ্ক্রোনাইজ করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('370', 'internet_connection', 'Internet Connection', 'ইন্টারনেট সংযোগ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('371', 'outgoing_file', 'Outgoing File', 'বহির্গামী ফাইল');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('372', 'incoming_file', 'Incoming File', 'ইনকামিং ফাইল');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('373', 'ok', 'Ok', 'ঠিক আছে');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('374', 'not_available', 'Not Available', 'পাওয়া যায় না');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('375', 'available', 'Available', 'পাওয়া যায়');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('376', 'download_data_from_server', 'Download data from server', 'সার্ভার থেকে ডাটা ডাউনলোড করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('377', 'data_import_to_database', 'Data import to database', 'ডাটাবেসে ডেটা আমদানি');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('378', 'data_upload_to_server', 'Data uplod to server', 'সার্ভারে ডেটা আপলোড');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('379', 'please_wait', 'Please Wait', 'অনুগ্রহপূর্বক অপেক্ষা করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('380', 'ooops_something_went_wrong', 'Oooops Something went wrong !', 'উফফ কিছু ভুল হয়েছে!');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('381', 'upload_successfully', 'Uploaded successfully', 'সফলভাবে আপলোড করা হয়েছে৷');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('382', 'unable_to_upload_file_please_check_configuration', 'Unable to upload file please check configuration', 'ফাইল আপলোড করতে অক্ষম দয়া করে কনফিগারেশন চেক করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('383', 'please_configure_synchronizer_settings', 'Please configure synchronizer settings', 'অনুগ্রহ করে সিঙ্ক্রোনাইজার সেটিংস কনফিগার করুন৷');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('384', 'download_successfully', 'Download successfully', 'সফলভাবে ডাউনলোড করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('385', 'unable_to_download_file_please_check_configuration', 'Unable to download file please check configuration', 'ফাইল ডাউনলোড করতে অক্ষম অনুগ্রহ করে কনফিগারেশন চেক করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('386', 'data_import_first', 'Data import past', 'ডেটা আমদানি অতীত');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('387', 'data_import_successfully', 'Data import successfully', 'ডেটা আমদানি সফলভাবে');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('388', 'unable_to_import_data_please_check_config_or_sql_file', 'Unable to import data please check config or sql file', 'ডেটা আমদানি করতে অক্ষম অনুগ্রহ করে কনফিগার বা sql ফাইল চেক করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('389', 'total_sale_ctn', 'Total Sale Ctn', 'মোট বিক্রয় Ctn');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('390', 'in_qnty', 'In Qnty.', 'মোট বিক্রয় Ctn. ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('391', 'out_qnty', 'Out Qnty', 'আউট Qnty');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('392', 'stock_report_supplier_wise', 'Stock Report (Supplier Wise)', 'স্টক রিপোর্ট (সরবরাহকারী অনুযায়ী)');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('393', 'all_stock_report_supplier_wise', 'Stock Report (Suppler Wise)', 'স্টক রিপোর্ট (সাপ্লার ওয়াইজ)');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('394', 'select_supplier', 'Select Supplier', 'সরবরাহকারী নির্বাচন করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('395', 'stock_report_product_wise', 'Stock Report (Product Wise)', 'স্টক রিপোর্ট (পণ্য অনুযায়ী)');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('396', 'phone', 'Phone', 'ফোন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('397', 'select_product', 'Select Product', 'পণ্য নির্বাচন করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('398', 'in_quantity', 'In Qnty.', 'পণ্য নির্বাচন করুন. ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('399', 'out_quantity', 'Out Qnty', 'আউট Qnty');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('400', 'in_taka', 'In TK', 'টাকায়');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('401', 'out_taka', 'Out TK', 'আউট TK');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('402', 'commission', 'Commission', 'কমিশন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('403', 'generate_commission', 'Generate Commssion', 'কমিশন তৈরি করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('404', 'commission_rate', 'Commission Rate', 'কমিশন হার');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('405', 'total_ctn', 'Total Ctn.', 'কমিশন হার. ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('406', 'per_pcs_commission', 'Per PCS Commission', 'প্রতি পিসিএস কমিশন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('407', 'total_commission', 'Total Commission', 'মোট কমিশন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('408', 'enter', 'Enter', 'প্রবেশ করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('409', 'please_add_walking_customer_for_default_customer', 'Please add \'Walking Customer\' for default customer.', 'প্রবেশ করুন. ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('410', 'supplier_ammount', 'Supplier Amount', 'সরবরাহকারীর পরিমাণ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('411', 'my_sale_ammount', 'My Sale Amount', 'আমার বিক্রয় পরিমাণ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('412', 'signature_pic', 'Signature Picture', 'স্বাক্ষর ছবি');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('413', 'branch', 'Branch', 'শাখা');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('414', 'ac_no', 'A/C Number', 'A/C নম্বর');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('415', 'ac_name', 'A/C Name', 'A/C নাম');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('416', 'bank_transaction', 'Bank Transaction', 'ব্যাংক লেনদেন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('417', 'bank', 'Bank', 'ব্যাংক');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('418', 'withdraw_deposite_id', 'Withdraw / Deposite ID', 'ID প্রত্যাহার / জমা দিন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('419', 'bank_ledger', 'Bank Ledger', 'ব্যাংক লেজার');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('420', 'note_name', 'Note Name', 'নোট নাম');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('421', 'pcs', 'Pcs.', 'নোট নাম. ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('422', '1', '1', '1');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('423', '2', '2', '2');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('424', '5', '5', '5');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('425', '10', '10', '10');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('426', '20', '20', '20');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('427', '50', '50', '50');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('428', '100', '100', '100');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('429', '500', '500', '500');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('430', '1000', '1000', '1000');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('431', 'total_discount', 'Total Discount', 'মোট ডিসকাউন্ট');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('432', 'product_not_found', 'Product not found !', 'পণ্য পাওয়া যায়নি!');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('433', 'this_is_not_credit_customer', 'This is not credit customer !', 'এই ক্রেডিট গ্রাহক নয়!');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('434', 'personal_loan', 'Personal Loan', 'ব্যক্তিগত ঋণ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('435', 'add_person', 'Add Person', 'ব্যক্তি যোগ করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('436', 'add_loan', 'Add Loan', 'ঋণ যোগ করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('437', 'add_payment', 'Add Payment', 'পেমেন্ট যোগ করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('438', 'manage_person', 'Manage Person', 'ব্যক্তি পরিচালনা করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('439', 'personal_edit', 'Person Edit', 'ব্যক্তি সম্পাদনা');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('440', 'person_ledger', 'Person Ledger', 'ব্যক্তি খাতা');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('441', 'backup_restore', 'Backup ', 'ব্যাকআপ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('442', 'database_backup', 'Database backup', 'ডাটাবেস ব্যাকআপ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('443', 'file_information', 'File information', 'ফাইল তথ্য');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('444', 'filename', 'Filename', 'ফাইলের নাম');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('445', 'size', 'Size', 'আকার');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('446', 'backup_date', 'Backup date', 'ব্যাকআপ তারিখ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('447', 'backup_now', 'Backup now', 'এখনি ব্যাকআপ করে নিন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('448', 'restore_now', 'Restore now', 'এখন পুনরুদ্ধার করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('449', 'are_you_sure', 'Are you sure ?', 'তুমি কি নিশ্চিত ?');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('450', 'download', 'Download', 'ডাউনলোড করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('451', 'backup_and_restore', 'Backup', 'ব্যাকআপ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('452', 'backup_successfully', 'Backup successfully', 'সফলভাবে ব্যাকআপ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('453', 'delete_successfully', 'Deleted Successfully', 'সফলভাবে মুছে ফেলা হয়েছে৷');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('454', 'stock_ctn', 'Stock/Qty', 'স্টক/পরিমাণ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('455', 'unit', 'Unit', 'ইউনিট');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('456', 'meter_m', 'Meter (M)', 'মিটার (M)');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('457', 'piece_pc', 'Piece (Pc)', 'টুকরা (পিসি)');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('458', 'kilogram_kg', 'Kilogram (Kg)', 'কিলোগ্রাম (কেজি)');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('459', 'stock_cartoon', 'Stock Cartoon', 'স্টক কার্টুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('460', 'add_product_csv', 'Add Product (CSV)', 'পণ্য যোগ করুন (CSV)');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('461', 'import_product_csv', 'Import product (CSV)', 'আমদানি পণ্য (CSV)');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('462', 'close', 'Close', 'বন্ধ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('463', 'download_example_file', 'Download example file.', 'বন্ধ. ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('464', 'upload_csv_file', 'Upload CSV File', 'CSV ফাইল আপলোড করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('465', 'csv_file_informaion', 'CSV File Information', 'CSV ফাইলের তথ্য');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('466', 'out_of_stock', 'Out Of Stock', 'স্টক আউট');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('467', 'others', 'Others', 'অন্যান্য');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('468', 'full_paid', 'Full Paid', 'ফুল পেইড');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('469', 'successfully_saved', 'Your Data Successfully Saved', 'আপনার ডেটা সফলভাবে সংরক্ষিত হয়েছে৷');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('470', 'manage_loan', 'Manage Loan', 'ঋণ পরিচালনা করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('471', 'receipt', 'Receipt', 'প্রাপ্তি');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('472', 'payment', 'Payment', 'পেমেন্ট');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('473', 'cashflow', 'Daily Cash Flow', 'দৈনিক নগদ প্রবাহ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('474', 'signature', 'Signature', 'স্বাক্ষর');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('475', 'supplier_reports', 'Supplier Reports', 'সরবরাহকারী রিপোর্ট');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('476', 'generate', 'Generate', 'তৈরি করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('477', 'todays_overview', 'Todays Overview', 'আজকের ওভারভিউ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('478', 'last_sales', 'Last Sales', 'শেষ বিক্রয়');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('479', 'manage_transaction', 'Manage Transaction', 'লেনদেন পরিচালনা করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('480', 'daily_summary', 'Daily Summary', 'দৈনিক সারাংশ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('481', 'daily_cash_flow', 'Daily Cash Flow', 'দৈনিক নগদ প্রবাহ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('482', 'custom_report', 'Custom Report', 'কাস্টম রিপোর্ট');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('483', 'transaction', 'Transaction', 'লেনদেন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('484', 'receipt_amount', 'Receipt Amount', 'গৃহীত পরিমান');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('485', 'transaction_details_datewise', 'Transaction Details Datewise', 'তারিখ অনুযায়ী লেনদেনের বিবরণ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('486', 'cash_closing', 'Cash Closing', 'নগদ বন্ধ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('487', 'you_can_not_buy_greater_than_available_qnty', 'You can not buy greater than available qnty.', 'নগদ বন্ধ. ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('488', 'supplier_id', 'Supplier ID', 'সরবরাহকারী আইডি');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('489', 'category_id', 'Category ID', 'বিভাগ আইডি');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('490', 'select_report', 'Select Report', 'প্রতিবেদন নির্বাচন করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('491', 'supplier_summary', 'Supplier summary', 'সরবরাহকারীর সারাংশ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('492', 'sales_payment_actual', 'Sales payment actual', 'বিক্রয় পেমেন্ট প্রকৃত');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('493', 'today_already_closed', 'Today already closed.', 'বিক্রয় পেমেন্ট প্রকৃত. ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('494', 'root_account', 'Root Account', 'রুট অ্যাকাউন্ট');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('495', 'office', 'Office', 'দপ্তর');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('496', 'loan', 'Loan', 'ঋণ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('497', 'transaction_mood', 'Transaction Mood', 'লেনদেনের মেজাজ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('498', 'select_account', 'Select Account', 'নির্বাচন অ্যাকাউন্ট');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('499', 'add_receipt', 'Add Receipt', 'রসিদ যোগ করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('500', 'update_transaction', 'Update Transaction', 'লেনদেন আপডেট করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('501', 'no_stock_found', 'No Stock Found !', 'কোন স্টক পাওয়া যায়নি!');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('502', 'admin_login_area', 'Admin Login Area', 'অ্যাডমিন লগইন এলাকা');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('503', 'print_qr_code', 'Print QR Code', 'QR কোড প্রিন্ট করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('504', 'discount_type', 'Discount Type', 'ডিসকাউন্ট টাইপ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('505', 'discount_percentage', 'Discount', 'ছাড়');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('506', 'fixed_dis', 'Fixed Dis.', 'ছাড়. ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('507', 'return', 'Return', 'প্রত্যাবর্তন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('508', 'stock_return_list', 'Stock Return List', 'স্টক রিটার্ন তালিকা');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('509', 'wastage_return_list', 'Wastage Return List', 'অপব্যয় রিটার্ন তালিকা');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('510', 'return_invoice', 'Sale Return', 'বিক্রয় রিটার্ন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('511', 'sold_qty', 'Sold Qty', 'বিক্রির পরিমাণ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('512', 'ret_quantity', 'Return Qty', 'পরিমাণ রিটার্ন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('513', 'deduction', 'Deduction', 'ডিডাকশন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('514', 'check_return', 'Check Return', 'রিটার্ন চেক করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('515', 'reason', 'Reason', 'কারণ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('516', 'usablilties', 'Usability', 'ব্যবহারযোগ্যতা');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('517', 'adjs_with_stck', 'Adjust With Stock', 'স্টকের সাথে সামঞ্জস্য করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('518', 'return_to_supplier', 'Return To Supplier', 'সরবরাহকারীর কাছে ফিরে যান');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('519', 'wastage', 'Wastage', 'অপচয়');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('520', 'to_deduction', 'Total Deduction ', 'মোট ডিডাকশন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('521', 'nt_return', 'Net Return Amount', 'নেট রিটার্ন পরিমাণ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('522', 'return_list', 'Return List', 'ফিরতি তালিকা');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('523', 'add_return', 'Add Return', 'রিটার্ন যোগ করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('524', 'per_qty', 'Purchase Qty', 'ক্রয় পরিমাণ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('525', 'return_supplier', 'Supplier Return', 'সরবরাহকারী রিটার্ন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('526', 'stock_purchase', 'Stock Purchase Price', 'স্টক ক্রয় মূল্য');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('527', 'stock_sale', 'Stock Sale Price', 'স্টক বিক্রয় মূল্য');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('528', 'supplier_return', 'Supplier Return', 'সরবরাহকারী রিটার্ন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('529', 'purchase_id', 'Purchase ID', 'আইডি ক্রয় করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('530', 'return_id', 'Return ID', 'রিটার্ন আইডি');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('531', 'supplier_return_list', 'Supplier Return List', 'সরবরাহকারী রিটার্ন তালিকা');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('532', 'c_r_slist', 'Stock Return Stock', 'স্টক রিটার্ন স্টক');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('533', 'wastage_list', 'Wastage List', 'অপচয়ের তালিকা');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('534', 'please_input_correct_invoice_id', 'Please Input a Correct Sale ID', 'অনুগ্রহ করে একটি সঠিক বিক্রয় আইডি ইনপুট করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('535', 'please_input_correct_purchase_id', 'Please Input Your Correct  Purchase ID', 'অনুগ্রহ করে আপনার সঠিক ক্রয় আইডি ইনপুট করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('536', 'add_more', 'Add More', 'আরো যোগ করো');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('537', 'prouct_details', 'Product Details', 'পণ্যের বিবরণ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('538', 'prouct_detail', 'Product Details', 'পণ্যের বিবরণ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('539', 'stock_return', 'Stock Return', 'স্টক রিটার্ন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('540', 'choose_transaction', 'Select Transaction', 'লেনদেন নির্বাচন করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('541', 'transection_category', 'Select  Category', 'বিভাগ নির্বাচন করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('542', 'transaction_categry', 'Select Category', 'বিভাগ নির্বাচন করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('543', 'search_supplier', 'Search Supplier', 'অনুসন্ধান সরবরাহকারী');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('544', 'customer_id', 'Customer ID', 'গ্রাহক আইডি');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('545', 'search_customer', 'Search Customer Invoice', 'গ্রাহক চালান অনুসন্ধান করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('546', 'serial_no', 'SN', 'এসএন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('547', 'item_discount', 'Item Discount', 'আইটেম ডিসকাউন্ট');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('548', 'invoice_discount', 'Sale Discount', 'বিক্রয় ডিসকাউন্ট');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('549', 'add_unit', 'Add Unit', 'ইউনিট যোগ করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('550', 'manage_unit', 'Manage Unit', 'ইউনিট পরিচালনা করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('551', 'add_new_unit', 'Add New Unit', 'নতুন ইউনিট যোগ করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('552', 'unit_name', 'Unit Name', 'এককের নাম');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('553', 'payment_amount', 'Payment Amount', 'পরিশোধিত অর্থ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('554', 'manage_your_unit', 'Manage Your Unit', 'আপনার ইউনিট পরিচালনা করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('555', 'unit_id', 'Unit ID', 'ইউনিট আইডি');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('556', 'unit_edit', 'Unit Edit', 'ইউনিট সম্পাদনা');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('557', 'vat', 'Vat', 'ভ্যাট');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('558', 'sales_report_category_wise', 'Sales Report (Category wise)', 'বিক্রয় প্রতিবেদন (বিভাগ অনুযায়ী)');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('559', 'purchase_report_category_wise', 'Purchase Report (Category wise)', 'ক্রয় প্রতিবেদন (বিভাগ অনুযায়ী)');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('560', 'category_wise_purchase_report', 'Category wise purchase report', 'বিভাগ অনুযায়ী ক্রয় রিপোর্ট');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('561', 'category_wise_sales_report', 'Category wise sales report', 'বিভাগ অনুযায়ী বিক্রয় রিপোর্ট');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('562', 'best_sale_product', 'Best Sale Product', 'সেরা বিক্রয় পণ্য');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('563', 'all_best_sales_product', 'All Best Sales Products', 'সব সেরা বিক্রয় পণ্য');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('564', 'todays_customer_receipt', 'Todays Customer Receipt', 'আজকের গ্রাহক রসিদ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('565', 'not_found', 'Record not found', 'রেকর্ড পাওয়া যায়নি');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('566', 'collection', 'Collection', 'সংগ্রহ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('567', 'increment', 'Increment', 'বৃদ্ধি');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('568', 'accounts_tree_view', 'Accounts Tree View', 'অ্যাকাউন্টস ট্রি ভিউ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('569', 'debit_voucher', 'Debit Voucher', 'ডেবিট ভাউচার');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('570', 'voucher_no', 'Voucher No', 'ভাউচার নং');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('571', 'credit_account_head', 'Credit Account Head', 'ক্রেডিট অ্যাকাউন্ট প্রধান');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('572', 'remark', 'Remark', 'মন্তব্য');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('573', 'code', 'Code', 'কোড');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('574', 'amount', 'Amount', 'পরিমাণ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('575', 'approved', 'Approved', 'অনুমোদিত');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('576', 'debit_account_head', 'Debit Account Head', 'ডেবিট অ্যাকাউন্ট প্রধান');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('577', 'credit_voucher', 'Credit Voucher', 'ক্রেডিট ভাউচার');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('578', 'find', 'Find', 'অনুসন্ধান');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('579', 'transaction_date', 'Transaction Date', 'লেনদেন তারিখ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('580', 'voucher_type', 'Voucher Type', 'ভাউচারের ধরন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('581', 'particulars', 'Particulars', 'বিশেষ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('582', 'with_details', 'With Details', 'বিস্তারিত সহ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('583', 'general_ledger', 'General Ledger', 'জেনারেল লেজার');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('584', 'general_ledger_of', 'General ledger of', 'এর সাধারণ খাতা');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('585', 'pre_balance', 'Pre Balance', 'প্রাক ব্যালেন্স');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('586', 'current_balance', 'Current Balance', 'বর্তমান হিসাব');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('587', 'to_date', 'To Date', 'এখন পর্যন্ত');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('588', 'from_date', 'From Date', 'তারিখ হইতে');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('589', 'trial_balance', 'Trial Balance', 'ট্রায়াল ব্যালেন্স');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('590', 'authorized_signature', 'Authorized Signature', 'অনুমোদিত স্বাক্ষর');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('591', 'chairman', 'Chairman', 'চেয়ারম্যান');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('592', 'total_income', 'Total Income', 'মোট আয়');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('593', 'statement_of_comprehensive_income', 'Statement of Comprehensive Income', 'ব্যাপক আয় বিবৃতি');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('594', 'profit_loss', 'Profit Loss', 'লাভ ক্ষতি');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('595', 'cash_flow_report', 'Cash Flow Report', 'নগদ প্রবাহ রিপোর্ট');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('596', 'cash_flow_statement', 'Cash Flow Statement', 'ক্যাশ ফ্লো স্টেটমেন্ট');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('597', 'amount_in_dollar', 'Amount In Dollar', 'ডলারে পরিমাণ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('598', 'opening_cash_and_equivalent', 'Opening Cash and Equivalent', 'নগদ ও সমতুল্য খোলা');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('599', 'coa_print', 'Coa Print', 'Coa প্রিন্ট');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('600', 'cash_flow', 'Cash Flow', 'নগদ প্রবাহ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('601', 'cash_book', 'Cash Book', 'নগদ বই');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('602', 'bank_book', 'Bank Book', 'ব্যাংক বই');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('603', 'c_o_a', 'Chart of Account', 'অ্যাকাউন্ট চার্ট');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('604', 'journal_voucher', 'Journal Voucher', 'জার্নাল ভাউচার');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('605', 'contra_voucher', 'Contra Voucher', 'কন্ট্রা ভাউচার');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('606', 'voucher_approval', 'Vouchar Approval', 'ভাউচার অনুমোদন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('607', 'supplier_payment', 'Supplier Payment', 'সরবরাহকারী পেমেন্ট');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('608', 'customer_receive', 'Customer Receive', 'গ্রাহক রিসিভ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('609', 'gl_head', 'General Head', 'জেনারেল হেড');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('610', 'account_code', 'Account Head', 'হিসাব প্রধান');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('611', 'opening_balance', 'Opening Balance', 'ওপেনিং ব্যালেন্স');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('612', 'head_of_account', 'Head of Account', 'অ্যাকাউন্টের প্রধান');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('613', 'inventory_ledger', 'Inventory Ledger', 'ইনভেন্টরি লেজার');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('614', 'newpassword', 'New Password', 'নতুন পাসওয়ার্ড');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('615', 'password_recovery', 'Password Recovery', 'পাসওয়ার্ড পুনরুদ্ধার');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('616', 'forgot_password', 'Forgot Password ??', 'পাসওয়ার্ড ভুলে গেছেন ??');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('617', 'send', 'Send', 'পাঠান');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('618', 'due_report', 'Due Report', 'ডিউ রিপোর্ট');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('619', 'due_amount', 'Due Amount', 'বাকি টাকা');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('620', 'download_sample_file', 'Download Sample File', 'নমুনা ফাইল ডাউনলোড করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('621', 'customer_csv_upload', 'Customer Csv Upload', 'গ্রাহক Csv আপলোড');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('622', 'csv_supplier', 'Csv Upload Supplier', 'Csv আপলোড সরবরাহকারী');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('623', 'csv_upload_supplier', 'Csv Upload Supplier', 'Csv আপলোড সরবরাহকারী');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('624', 'previous', 'Previous', 'আগে');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('625', 'net_total', 'Net Total', 'সর্বমোট');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('626', 'currency_list', 'Currency List', 'মুদ্রা তালিকা');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('627', 'currency_name', 'Currency Name', 'মুদ্রার নাম');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('628', 'currency_icon', 'Currency Symbol', 'মুদ্রার প্রতীক');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('629', 'add_currency', 'Add Currency', 'মুদ্রা যোগ করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('630', 'role_permission', 'Role Permission', 'ভূমিকা অনুমতি');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('631', 'role_list', 'Role List', 'ভূমিকা তালিকা');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('632', 'user_assign_role', 'User Assign Role', 'ইউজার অ্যাসাইন রোল');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('633', 'permission', 'Permission', 'অনুমতি');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('634', 'add_role', 'Add Role', 'ভূমিকা যোগ করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('635', 'add_module', 'Add Module', 'মডিউল যোগ করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('636', 'module_name', 'Module Name', 'মডিউল নাম');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('637', 'office_loan', 'Office Loan', 'অফিস লোন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('638', 'add_menu', 'Add Menu', 'মেনু যোগ করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('639', 'menu_name', 'Menu Name', 'মেনু নাম');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('640', 'sl_no', 'Sl No', 'নং');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('641', 'create', 'Create', 'সৃষ্টি');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('642', 'read', 'Read', 'পড়ুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('643', 'role_name', 'Role Name', 'নামভূমিকা');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('644', 'qty', 'Quantity', 'পরিমাণ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('645', 'max_rate', 'Max Rate', 'সর্বোচ্চ হার');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('646', 'min_rate', 'Min Rate', 'ন্যূনতম হার');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('647', 'avg_rate', 'Average Rate', 'গড় হার');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('648', 'role_permission_added_successfully', 'Role Permission Successfully Added', 'ভূমিকার অনুমতি সফলভাবে যোগ করা হয়েছে৷');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('649', 'update_successfully', 'Updated Successfully', 'সফলভাবে আপডেট করা হয়েছে৷');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('650', 'role_permission_updated_successfully', 'Role Permission Successfully Updated ', 'ভূমিকার অনুমতি সফলভাবে আপডেট করা হয়েছে৷');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('651', 'shipping_cost', 'Shipping Cost', 'শিপিং খরচ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('652', 'in_word', 'In Word ', 'শব্দে');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('653', 'shipping_cost_report', 'Shipping Cost Report', 'শিপিং খরচ রিপোর্ট');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('654', 'cash_book_report', 'Cash Book Report', 'নগদ বই রিপোর্ট');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('655', 'inventory_ledger_report', 'Inventory Ledger Report', 'ইনভেন্টরি লেজার রিপোর্ট');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('656', 'trial_balance_with_opening_as_on', 'Trial Balance With Opening As On', 'চালু হিসাবে খোলার সাথে ট্রায়াল ব্যালেন্স');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('657', 'type', 'Type', 'টাইপ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('658', 'taka_only', 'Taka Only', 'টাকা মাত্র');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('659', 'item_description', 'Desc', 'বর্ণনা');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('660', 'sold_by', 'Sold By', 'বিক্রিত');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('661', 'user_wise_sales_report', 'User Wise Sales Report', 'ইউজার ওয়াইজ সেলস রিপোর্ট');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('662', 'user_name', 'User Name', 'ব্যবহারকারীর নাম');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('663', 'total_sold', 'Total Sold', 'মোট বিক্রি');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('664', 'user_wise_sale_report', 'User Wise Sales Report', 'ইউজার ওয়াইজ সেলস রিপোর্ট');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('665', 'barcode_or_qrcode', 'Barcode/QR-code', 'বারকোড/QR-কোড');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('666', 'category_csv_upload', 'Category Csv  Upload', 'বিভাগ Csv আপলোড');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('667', 'unit_csv_upload', 'Unit Csv Upload', 'ইউনিট Csv আপলোড');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('668', 'invoice_return_list', 'Sales Return list', 'বিক্রয় রিটার্ন তালিকা');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('669', 'invoice_return', 'Sales Return', 'বিক্রয় রিটার্ন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('670', 'tax_report', 'TAX Report', 'ট্যাক্স রিপোর্ট');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('671', 'select_tax', 'Select TAX', 'TAX নির্বাচন করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('672', 'hrm', 'HRM', 'এইচআরএম');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('673', 'employee', 'Employee', 'কর্মচারী');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('674', 'add_employee', 'Add Employee', 'কর্মচারী যোগ করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('675', 'manage_employee', 'Manage Employee', 'কর্মচারী পরিচালনা করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('676', 'attendance', 'Attendance', 'উপস্থিতি');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('677', 'add_attendance', 'Attendance', 'উপস্থিতি');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('678', 'manage_attendance', 'Manage Attendance', 'উপস্থিতি পরিচালনা করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('679', 'payroll', 'Payroll', 'বেতন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('680', 'add_payroll', 'Payroll', 'বেতন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('681', 'manage_payroll', 'Manage Payroll', 'বেতন পরিচালনা করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('682', 'employee_type', 'Employee Type', 'কর্মচারীর ধরন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('683', 'employee_designation', 'Employee Designation', 'কর্মচারী পদবি');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('684', 'designation', 'Designation', 'উপাধি');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('685', 'add_designation', 'Add Designation', 'পদবী যোগ করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('686', 'manage_designation', 'Manage Designation', 'পদবী পরিচালনা করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('687', 'designation_update_form', 'Designation Update form', 'পদবী আপডেট ফর্ম');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('688', 'picture', 'Picture', 'ছবি');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('689', 'country', 'Country', 'দেশ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('690', 'blood_group', 'Blood Group', 'রক্তের গ্রুপ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('691', 'address_line_1', 'Address Line 1', 'ঠিকানা লাইন 1');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('692', 'address_line_2', 'Address Line 2', 'ঠিকানা লাইন ২');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('693', 'zip', 'Zip code', 'জিপ কোড');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('694', 'city', 'City', 'শহর');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('695', 'hour_rate_or_salary', 'Houre Rate/Salary', 'ঘন্টার হার/বেতন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('696', 'rate_type', 'Rate Type', 'হারের ধরন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('697', 'hourly', 'Hourly', 'ঘণ্টায়');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('698', 'salary', 'Salary', 'বেতন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('699', 'employee_update', 'Employee Update', 'কর্মচারী আপডেট');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('700', 'checkin', 'Check In', 'চেক ইন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('701', 'employee_name', 'Employee Name', 'কর্মকর্তার নাম');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('702', 'checkout', 'Check Out', 'চেক আউট');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('703', 'confirm_clock', 'Confirm Clock', 'ঘড়ি নিশ্চিত করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('704', 'stay', 'Stay Time', 'থাকার সময়');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('705', 'sign_in', 'Sign In', 'সাইন ইন করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('706', 'check_in', 'Check In', 'চেক ইন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('707', 'single_checkin', 'Single Check In', 'একক চেক ইন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('708', 'bulk_checkin', 'Bulk Check In', 'বাল্ক চেক ইন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('709', 'successfully_checkout', 'Successfully Checkout', 'সফলভাবে চেকআউট');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('710', 'attendance_report', 'Attendance Report', 'উপস্থিতি রিপোর্ট');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('711', 'datewise_report', 'Date Wise Report', 'তারিখ অনুযায়ী রিপোর্ট');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('712', 'employee_wise_report', 'Employee Wise Report', 'কর্মচারী ওয়াইজ রিপোর্ট');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('713', 'date_in_time_report', 'Date In Time Report', 'সময় রিপোর্ট তারিখ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('714', 'request', 'Request', 'অনুরোধ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('715', 'sign_out', 'Sign Out', 'সাইন আউট');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('716', 'work_hour', 'Work Hours', 'কার্য ঘন্টা');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('717', 's_time', 'Start Time', 'সময় শুরু');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('718', 'e_time', 'In Time', 'সময়ের মধ্যে');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('719', 'salary_benefits_type', 'Benefits Type', 'সুবিধার ধরন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('720', 'salary_benefits', 'Salary Benefits', 'বেতন সুবিধা');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('721', 'beneficial_list', 'Benefit List', 'সুবিধার তালিকা');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('722', 'add_beneficial', 'Add Benefits', 'সুবিধা যোগ করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('723', 'add_benefits', 'Add Benefits', 'সুবিধা যোগ করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('724', 'benefits_list', 'Benefit List', 'সুবিধার তালিকা');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('725', 'benefit_type', 'Benefit Type', 'সুবিধার ধরন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('726', 'benefits', 'Benefit', 'সুবিধা');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('727', 'manage_benefits', 'Manage Benefits', 'সুবিধাগুলি পরিচালনা করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('728', 'deduct', 'Deduct', 'কাটুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('729', 'add', 'Add', 'যোগ করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('730', 'add_salary_setup', 'Add Salary Setup', 'বেতন সেটআপ যোগ করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('731', 'manage_salary_setup', 'Manage Salary Setup', 'বেতন সেটআপ পরিচালনা করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('732', 'basic', 'Basic', 'মৌলিক');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('733', 'salary_type', 'Salary Type', 'বেতনের ধরন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('734', 'addition', 'Addition', 'সংযোজন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('735', 'gross_salary', 'Gross Salary', 'মোট বেতন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('736', 'set', 'Set', 'সেট');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('737', 'salary_generate', 'Salary Generate', 'বেতন জেনারেট');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('738', 'manage_salary_generate', 'Manage Salary Generate', 'বেতন জেনারেট পরিচালনা করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('739', 'sal_name', 'Salary Name', 'বেতনের নাম');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('740', 'gdate', 'Generated Date', 'উত্পন্ন তারিখ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('741', 'generate_by', 'Generated By', 'দ্বারা উত্পন্ন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('742', 'the_salary_of', 'The Salary of ', 'এর বেতন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('743', 'already_generated', ' Already Generated', 'ইতিমধ্যে উত্পন্ন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('744', 'salary_month', 'Salary Month', 'বেতন মাস');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('745', 'successfully_generated', 'Successfully Generated', 'সফলভাবে তৈরি');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('746', 'salary_payment', 'Salary Payment', 'বেতন প্রদান');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('747', 'employee_salary_payment', 'Employee Salary Payment', 'কর্মচারী বেতন প্রদান');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('748', 'total_salary', 'Total Salary', 'মোট বেতন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('749', 'total_working_minutes', 'Total Working Hours', 'মোট কাজের ঘন্টা');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('750', 'working_period', 'Working Period', 'কাজ সময়ের');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('751', 'paid_by', 'Paid By', 'দ্বারা পরিশোধ করা হয়');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('752', 'pay_now', 'Pay Now ', 'এখন পরিশোধ করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('753', 'confirm', 'Confirm', 'নিশ্চিত করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('754', 'successfully_paid', 'Successfully Paid', 'সফলভাবে অর্থপ্রদান করা হয়েছে');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('755', 'add_incometax', 'Add Income TAX', 'ইনকাম ট্যাক্স যোগ করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('756', 'setup_tax', 'Setup TAX', 'ট্যাক্স সেটআপ করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('757', 'start_amount', 'Start Amount', 'শুরু পরিমাণ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('758', 'end_amount', 'End Amount', 'শেষ পরিমাণ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('759', 'tax_rate', 'TAX Rate', 'করের হার');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('760', 'setup', 'Setup', 'সেটআপ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('761', 'manage_income_tax', 'Manage Income TAX', 'আয়কর পরিচালনা করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('762', 'income_tax_updateform', 'Income TAX Update form', 'আয়কর আপডেট ফর্ম');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('763', 'positional_information', 'Positional Information', 'অবস্থানগত তথ্য');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('764', 'personal_information', 'Personal Information', 'ব্যক্তিগত তথ্য');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('765', 'timezone', 'Time Zone', 'সময় অঞ্চল');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('766', 'sms', 'SMS', 'খুদেবার্তা');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('767', 'sms_configure', 'SMS Configure', 'এসএমএস কনফিগার করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('768', 'url', 'URL', 'URL');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('769', 'sender_id', 'Sender ID', 'প্রেরকের আইডি');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('770', 'api_key', 'Api Key', 'Api কী');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('771', 'gui_pos', 'GUI POS', 'GUI POS');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('772', 'manage_service', 'Manage Service', 'পরিষেবা পরিচালনা করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('773', 'service', 'Service', 'সেবা');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('774', 'add_service', 'Add Service', 'পরিষেবা যোগ করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('775', 'service_edit', 'Service Edit', 'পরিষেবা সম্পাদনা');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('776', 'service_csv_upload', 'Service CSV Upload', 'পরিষেবা CSV আপলোড');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('777', 'service_name', 'Service Name', 'কাজের নাম');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('778', 'charge', 'Charge', 'চার্জ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('779', 'service_invoice', 'Service Invoice', 'পরিষেবা চালান');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('780', 'service_discount', 'Service Discount', 'সার্ভিস ডিসকাউন্ট');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('781', 'hanging_over', 'ETD', 'ইটিডি');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('782', 'service_details', 'Service Details', 'পরিষেবার বিবরণ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('783', 'tax_settings', 'TAX Settings', 'ট্যাক্স সেটিংস');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('784', 'default_value', 'Default Value', 'ডিফল্ট মান');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('785', 'number_of_tax', 'Number of TAX', 'ট্যাক্সের সংখ্যা');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('786', 'please_select_employee', 'Please Select Employee', 'অনুগ্রহ করে কর্মচারী নির্বাচন করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('787', 'manage_service_invoice', 'Manage Service Invoice', 'পরিষেবা চালান পরিচালনা করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('788', 'update_service_invoice', 'Update Service Invoice', 'সার্ভিস ইনভয়েস আপডেট করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('789', 'customer_wise_tax_report', 'Customer Wise TAX Report', 'কাস্টমার ওয়াইজ ট্যাক্স রিপোর্ট');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('790', 'service_id', 'Service Id', 'সার্ভিস আইডি');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('791', 'invoice_wise_tax_report', 'Invoice Wise TAX Report', 'চালান অনুযায়ী ট্যাক্স রিপোর্ট');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('792', 'reg_no', 'Reg No', 'রেজি নং');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('793', 'update_now', 'Update Now', 'এখন হালনাগাদ করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('794', 'import', 'Import', 'আমদানি');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('795', 'add_expense_item', 'Add Expense Item', 'ব্যয় আইটেম যোগ করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('796', 'manage_expense_item', 'Manage Expense Item', 'ব্যয় আইটেম পরিচালনা করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('797', 'add_expense', 'Add Expense', 'খরচ যোগ করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('798', 'manage_expense', 'Manage Expense', 'ব্যয় পরিচালনা করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('799', 'expense_statement', 'Expense Statement', 'ব্যয় বিবরণী');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('800', 'expense_type', 'Expense Type', 'ব্যয়ের ধরন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('801', 'expense_item_name', 'Expense Item Name', 'ব্যয় আইটেমের নাম');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('802', 'stock_purchase_price', 'Stock Purchase Price', 'স্টক ক্রয় মূল্য');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('803', 'purchase_price', 'Purchase Price', 'ক্রয় মূল্য');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('804', 'customer_advance', 'Customer Advance', 'গ্রাহক অগ্রিম');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('805', 'advance_type', 'Advance Type', 'অগ্রিম প্রকার');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('806', 'restore', 'Restore', 'পুনরুদ্ধার করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('807', 'supplier_advance', 'Supplier Advance', 'সরবরাহকারী অগ্রিম');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('808', 'please_input_correct_invoice_no', 'Please Input Correct Invoice NO', 'অনুগ্রহ করে সঠিক চালান নম্বর ইনপুট করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('809', 'backup', 'Back Up', 'ব্যাক আপ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('810', 'app_setting', 'App Settings', 'অ্যাপ সেটিংস');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('811', 'local_server_url', 'Local Server Url', 'স্থানীয় সার্ভার ইউআরএল');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('812', 'online_server_url', 'Online Server Url', 'অনলাইন সার্ভার ইউআরএল');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('813', 'connet_url', 'Connected Hotspot Ip/url', 'সংযুক্ত হটস্পট আইপি/ইউআরএল');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('814', 'update_your_app_setting', 'Update Your App Setting', 'আপনার অ্যাপ সেটিং আপডেট করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('815', 'select_category', 'Select Category', 'বিভাগ নির্বাচন করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('816', 'mini_invoice', 'Mini Invoice', 'মিনি চালান');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('817', 'purchase_details', 'Purchase Details', 'ক্রয় বিবরণ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('818', 'disc', 'Dis %', 'ডিস %');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('819', 'serial', 'Serial', 'সিরিয়াল');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('820', 'transaction_head', 'Transaction Head', 'লেনদেন প্রধান');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('821', 'transaction_type', 'Transaction Type', 'লেনদেন প্রকার');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('822', 'return_details', 'Return Details', 'বিবরণ ফেরত');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('823', 'return_to_customer', 'Return To Customer', 'গ্রাহকের কাছে ফিরে যান');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('824', 'sales_and_purchase_report_summary', 'Sales And Purchase Report Summary', 'বিক্রয় এবং ক্রয় রিপোর্ট সারাংশ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('825', 'add_person_officeloan', 'Add Person (Office Loan)', 'ব্যক্তি যোগ করুন (অফিস লোন)');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('826', 'add_loan_officeloan', 'Add Loan (Office Loan)', 'লোন যোগ করুন (অফিস লোন)');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('827', 'add_payment_officeloan', 'Add Payment (Office Loan)', 'পেমেন্ট যোগ করুন (অফিস লোন)');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('828', 'manage_loan_officeloan', 'Manage Loan (Office Loan)', 'লোন পরিচালনা করুন (অফিস লোন)');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('829', 'add_person_personalloan', 'Add Person (Personal Loan)', 'ব্যক্তি যোগ করুন (ব্যক্তিগত ঋণ)');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('830', 'add_loan_personalloan', 'Add Loan (Personal Loan)', 'ঋণ যোগ করুন (ব্যক্তিগত ঋণ)');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('831', 'add_payment_personalloan', 'Add Payment (Personal Loan)', 'পেমেন্ট যোগ করুন (ব্যক্তিগত ঋণ)');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('832', 'manage_loan_personalloan', 'Manage Loan (Personal)', 'লোন পরিচালনা করুন (ব্যক্তিগত)');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('833', 'hrm_management', 'Human Resource', 'মানব সম্পদ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('834', 'cash_adjustment', 'Cash Adjustment', 'নগদ সমন্বয়');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('835', 'adjustment_type', 'Adjustment Type', 'সমন্বয়ের ধরন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('836', 'change', 'Change', 'পরিবর্তন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('837', 'sale_by', 'Sale By', 'দ্বারা বিক্রয়');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('838', 'salary_date', 'Salary Date', 'বেতনের তারিখ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('839', 'earnings', 'Earnings', 'আয়');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('840', 'total_addition', 'Total Addition', 'মোট সংযোজন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('841', 'total_deduction', 'Total Deduction', 'মোট ডিডাকশন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('842', 'net_salary', 'Net Salary', 'মোট বেতন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('843', 'ref_number', 'Reference Number', 'পরিচিত সংখ্যা');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('844', 'name_of_bank', 'Name Of Bank', 'ব্যাংকের নাম');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('845', 'salary_slip', 'Salary Slip', 'বেতন পিছলানো');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('846', 'basic_salary', 'Basic Salary', 'মূল বেতন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('847', 'return_from_customer', 'Return From Customer', 'গ্রাহক থেকে ফিরে');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('848', 'quotation', 'Quotation', 'উদ্ধৃতি');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('849', 'add_quotation', 'Add Quotation', 'উদ্ধৃতি যোগ করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('850', 'manage_quotation', 'Manage Quotation', 'উদ্ধৃতি পরিচালনা করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('851', 'terms', 'Terms', 'শর্তাবলী');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('852', 'send_to_customer', 'Sent To Customer', 'গ্রাহকের কাছে পাঠানো হয়েছে');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('853', 'quotation_no', 'Quotation No', 'উদ্ধৃতি নং');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('854', 'quotation_date', 'Quotation Date', 'উদ্ধৃতি তারিখ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('855', 'total_service_tax', 'Total Service TAX', 'মোট পরিষেবা ট্যাক্স');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('856', 'totalservicedicount', 'Total Service Discount', 'মোট পরিষেবা ছাড়');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('857', 'item_total', 'Item Total', 'আইটেম মোট');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('858', 'service_total', 'Service Total', 'পরিষেবা মোট');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('859', 'quot_description', 'Quotation Description', 'উদ্ধৃতি বর্ণনা');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('860', 'sub_total', 'Sub Total', 'উপ মোট');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('861', 'mail_setting', 'Mail Setting', 'মেইল সেটিং');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('862', 'mail_configuration', 'Mail Configuration', 'মেইল কনফিগারেশন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('863', 'mail', 'Mail', 'মেইল');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('864', 'protocol', 'Protocol', 'প্রোটোকল');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('865', 'smtp_host', 'SMTP Host', 'SMTP হোস্ট');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('866', 'smtp_port', 'SMTP Port', 'SMTP পোর্ট');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('867', 'sender_mail', 'Sender Mail', 'প্রেরক মেইল');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('868', 'mail_type', 'Mail Type', 'মেইলের ধরন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('869', 'html', 'HTML', 'এইচটিএমএল');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('870', 'text', 'TEXT', 'টেক্সট');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('871', 'expiry_date', 'Expiry Date', 'মেয়াদ শেষ হওয়ার তারিখ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('872', 'api_secret', 'Api Secret', 'অপি সিক্রেট');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('873', 'please_config_your_mail_setting', NULL, 'en');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('874', 'quotation_successfully_added', 'Quotation Successfully Added', 'উদ্ধৃতি সফলভাবে যোগ করা হয়েছে');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('875', 'add_to_invoice', 'Add To Invoice', 'চালান যোগ করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('876', 'added_to_invoice', 'Added To Invoice', 'চালান যোগ করা হয়েছে');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('877', 'closing_balance', 'Closing Balance', 'অর্থ শেষ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('878', 'contact', 'Contact', 'যোগাযোগ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('879', 'fax', 'Fax', 'ফ্যাক্স');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('880', 'state', 'State', 'রাষ্ট্র');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('881', 'discounts', 'Discount', 'ছাড়');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('882', 'address1', 'Address1', 'ঠিকানা 1');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('883', 'address2', 'Address2', 'ঠিকানা ২');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('884', 'receive', 'Receive', 'গ্রহণ করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('885', 'purchase_history', 'Purchase History', 'ক্রয় ইতিহাস');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('886', 'cash_payment', 'Cash Payment', 'নগদে টাকা প্রদান');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('887', 'bank_payment', 'Bank Payment', 'ব্যাংক পেমেন্ট');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('888', 'do_you_want_to_print', 'Do You Want to Print', 'আপনি কি মুদ্রণ করতে চান');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('889', 'yes', 'Yes', 'হ্যাঁ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('890', 'no', 'No', 'না');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('891', 'todays_sale', 'Today\'s Sales', 'আজকের বিক্রয়');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('892', 'or', 'OR', 'বা');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('893', 'no_result_found', 'No Result Found', 'কোন ফলাফল পাওয়া যায়নি');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('894', 'add_service_quotation', 'Add Service Quotation', 'পরিষেবা উদ্ধৃতি যোগ করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('895', 'add_to_invoice', 'Add To Invoice', 'চালান যোগ করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('896', 'item_quotation', 'Item Quotation', 'আইটেম উদ্ধৃতি');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('897', 'service_quotation', 'Service Quotation', 'পরিষেবা উদ্ধৃতি');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('898', 'return_from', 'Return Form', 'রিটার্ন ফর্ম');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('899', 'customer_return_list', 'Customer Return List', 'গ্রাহক রিটার্ন তালিকা');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('900', 'pdf', 'Pdf', 'পিডিএফ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('901', 'note', 'Note', 'বিঃদ্রঃ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('902', 'update_debit_voucher', 'Update Debit Voucher', 'ডেবিট ভাউচার আপডেট করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('903', 'update_credit_voucher', 'Update Credit voucher', 'ক্রেডিট ভাউচার আপডেট করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('904', 'on', 'On', 'চালু');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('905', '', '', 'en');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('906', 'total_expenses', 'Total Expense', 'সর্বমোট খরচ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('907', 'already_exist', 'Already Exist', 'আগে থেকেই আছে');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('908', 'checked_out', 'Checked Out', 'চেক আউট');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('909', 'update_salary_setup', 'Update Salary Setup', 'বেতন সেটআপ আপডেট করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('910', 'employee_signature', 'Employee Signature', 'কর্মচারীর স্বাক্ষর');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('911', 'payslip', 'Payslip', 'পেস্লিপ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('912', 'exsisting_role', 'Existing Role', 'বিদ্যমান ভূমিকা');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('913', 'filter', 'Filter', 'ছাঁকনি');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('914', 'testinput', NULL, 'en');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('915', 'update_quotation', 'Update Quotation', 'উদ্ধৃতি আপডেট করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('916', 'quotation_successfully_updated', 'Quotation Successfully Updated', 'উদ্ধৃতি সফলভাবে আপডেট করা হয়েছে৷');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('917', 'successfully_approved', 'Successfully Approved', 'সফলভাবে অনুমোদিত');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('918', 'expiry', 'Expiry', 'মেয়াদ শেষ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('919', 'user_list', 'User List', 'ব্যবহারকারীর তালিকা');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('920', 'assign_roleto_user', 'Assign Role To User', 'ব্যবহারকারীকে ভূমিকা বরাদ্দ করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('921', 'assign_role_list', 'Assigned Role List', 'বরাদ্দকৃত ভূমিকা তালিকা');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('922', 'application_settings', 'Application Settings', 'আবেদন নির্ধারণ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('923', 'company_list', 'Company List', 'কোম্পানির তালিকা');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('924', 'edit_company', 'Edit Company', 'কোম্পানি সম্পাদনা করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('925', 'edit_user', 'Edit User', 'ব্যবহারকারী সম্পাদনা করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('926', 'edit_currency', 'Edit Currency', 'মুদ্রা সম্পাদনা করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('927', 'mobile_no', 'Mobile No', 'মোবাইল নাম্বার');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('928', 'email_address', 'Email Address', 'ইমেইল ঠিকানা');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('929', 'customer_list', 'Customer List', 'গ্রাহক তালিকা');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('930', 'advance_receipt', 'Advance Receipt', 'অগ্রিম রসিদ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('931', 'supplier_list', 'Supplier List', 'সরবরাহকারী তালিকা');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('932', 'category_list', 'Category List', 'বিভাগ তালিকা');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('933', 'no_record_found', 'No Record Found', 'পাওয়া কোন রেকর্ড');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('934', 'unit_list', 'Unit List', 'ইউনিট তালিকা');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('935', 'edit_product', 'Edit Product', 'পণ্য সম্পাদনা করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('936', 'payable_summary', 'Payable Summary', 'প্রদেয় সারাংশ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('937', 'pad_print', 'Pad Print', 'প্যাড মুদ্রণ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('938', 'pos_print', 'POS Print', 'POS প্রিন্ট');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('939', 'pos_invoice', 'POS Invoice', 'POS চালান');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('940', 'employee_profile', 'Employee Profile', 'কর্মচারী প্রোফাইল');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('941', 'edit_beneficials', 'Edit Beneficials', 'উপকারিতা সম্পাদনা করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('942', 'edit_setup_update', 'Edit Salary Setup', 'বেতন সেটআপ সম্পাদনা করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('943', 'add_office_loan', 'Add Office Loan', 'অফিস লোন যোগ করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('944', 'income_tax', 'Income TAX', 'আয়কর');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('945', 'quotation_to_sale', 'Quotation To Sale', 'বিক্রয়ের জন্য উদ্ধৃতি');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('946', 'quotation_edit', 'Edit Quotation', 'উদ্ধৃতি সম্পাদনা করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('947', 'edit_profile', 'Edit Profile', 'জীবন বৃত্তান্ত সম্পাদনা');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('948', 'edit_supplier', 'Edit Supplier', 'সরবরাহকারী সম্পাদনা করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('949', 'edit_bank', 'Edit Bank', 'ব্যাংক সম্পাদনা করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('950', 'balance_sheet', 'Balance Sheet', 'ব্যালেন্স শীট');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('951', 'salary_setup', 'Salary Setup', 'বেতন সেটআপ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('952', 'account_head', 'Account Head', 'হিসাব প্রধান');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('953', 'add_invoice', 'Add Invoice', 'চালান যোগ করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('954', 'general_ledger_report', 'General Ledger Report', 'সাধারণ লেজার রিপোর্ট');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('955', 'print_setting', 'Print Setting', 'প্রিন্ট সেটিং');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('956', 'header', 'Header', 'হেডার');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('957', 'footer', 'Footer', 'ফুটার');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('958', 'supplier_payment_receipt', 'Payment Receipt', 'প্রাপ্তি রশিদ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('959', 'welcome_back', 'Welcome Back', 'ফিরে আসার জন্য স্বাগতম');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('960', 'overwrite', 'Over Write', 'ওভাররাইট করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('961', 'module', 'Module', 'মডিউল');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('962', 'purchase_key', 'Purchase Key', 'ক্রয় কী');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('963', 'buy_now', 'Buy Now', 'এখন কেন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('964', 'module_list', 'Module List', 'মডিউল তালিকা');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('965', 'modules', 'Modules', 'মডিউল');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('966', 'install', 'Install', 'ইনস্টল করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('967', 'uninstall', 'Uninstall', 'আনইনস্টল করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('968', 'module_added_successfully', 'Module Added Successfully', 'মডিউল সফলভাবে যোগ করা হয়েছে৷');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('969', 'no_tables_are_registered_in_config', 'No table registered in config', 'কনফিগারে নিবন্ধিত কোনো টেবিল নেই');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('970', 'tables_are_not_available_in_database', 'Table Are not Available in Database', 'ডাটাবেসে টেবিল পাওয়া যায় না');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('971', 'addon', 'Add-ons', 'অ্যাড-অন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('972', 'generate_qr', 'Generate QR', 'QR তৈরি করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('973', 'latestv', 'Latest Version', 'সর্বশেষ সংস্করণ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('974', 'Current Version', NULL, 'en');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('976', 'notesupdate', 'Note: If you want to update software,you Must have immediate previous version', 'দ্রষ্টব্য: আপনি যদি সফ্টওয়্যার আপডেট করতে চান তবে আপনার অবিলম্বে পূর্ববর্তী সংস্করণ থাকতে হবে');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('977', 'arabic', NULL, 'en');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('978', 'vat_no', 'VAT NO', 'কর নাম্বার');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('979', 'new_p_method', 'Add New Payment Method', 'নতুন পেমেন্ট পদ্ধতি যোগ করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('980', 'dis_val', 'Dis. Amount', 'ডিসকাউন্ট মূল্য');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('981', 'vat_val', 'VAT Value', 'ভ্যাট মান');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('982', 'ttl_val', 'Total VAT', 'মোট ভ্যাট');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('983', 'purchase_discount', 'Purchase Discount', 'ক্রয় ডিসকাউন্ট');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('984', 'order_time', 'Order Time', 'অর্ডার করার সময়');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('985', 'order_by', 'Order By', 'দ্বারা আদেশ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('986', 'terms_list', 'Sales Terms List', 'বিক্রয় শর্তাবলী তালিকা');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('987', 'terms_add', 'Add Sales Terms', 'বিক্রয় শর্তাবলী যোগ করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('988', 'term_condi', 'Terms & Condition', 'বিধি - নিষেধ এবং শর্তাবলী');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('989', 'terms_update', 'Update Seles Terms', 'সেলস শর্তাবলী আপডেট করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('990', 'add_payment_method', 'Add Payment Method', 'পেমেন্ট পদ্ধতি যোগ করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('991', 'payment_method_list', 'Payment Method List', 'পেমেন্ট পদ্ধতি তালিকা');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('992', 'payment_method_name', 'Payment Method Name', 'পেমেন্ট পদ্ধতির নাম');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('993', 'batch_no', 'Batch No', 'ব্যাচ নাম্বার');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('994', 'total_with_vat', 'Total With VAT', 'ভ্যাট সহ মোট');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('995', 'invoice_time', 'Invoice Time', 'চালান সময়');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('996', 'product_vat', 'Product VAT', 'পণ্য ভ্যাট');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('997', 'service_vat', 'Service VAT', 'পরিষেবা ভ্যাট');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('998', 'cr_no', 'CR NO', 'সিআর নং');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('999', 'service_payment', 'Service Payment', 'সার্ভিস পেমেন্ট');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1000', 'vat_tax_setting', 'VAT & TAX Setting', 'ভ্যাট এবং ট্যাক্স সেটিং');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1001', 'qty2', 'Qty', 'পরিমাণ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1002', 'batch', 'Batch', 'ব্যাচ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1003', 'disc', 'Disc', 'ডিস্ক');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1004', 'tot_price', 'Tot Price', 'মোট মূল্য');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1005', 'tot_before_dis', 'Total Before Discount', 'ছাড়ের আগে মোট');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1006', 'tot_with_dis', 'Total with Discount', 'ডিসকাউন্ট সহ মোট');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1007', 'tax_vat', 'TAX Value', 'ট্যাক্স মান');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1008', 'return_receipt_text', 'Please keep the receipt and bring it in case of return', 'অনুগ্রহ করে রসিদটি রাখুন এবং ফেরত দেওয়ার ক্ষেত্রে তা নিয়ে আসুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1009', 'invoice_qr_code', 'Invoice Qr-Code', 'চালান Qr-কোড');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1010', 'sales_due', 'Today Sales Due', 'আজ সেলস ডিউ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1011', 'purchase_due', 'Today Purchase Due', 'আজ কেনাকাটা বাকি');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1012', 'delivery_note', 'Delivery Note', 'চালান পত্র');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1013', 'financial_year', 'Financial Year', 'আর্থিক বছর');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1014', 'close_financial_year', 'Close Financial Year', 'আর্থিক বছর বন্ধ করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1015', 'create_financial_year', 'Create Financial Year', 'আর্থিক বছর তৈরি করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1016', 'year_closing', 'Year Closing', 'বছর সমাপ্তি');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1017', 'financial_year_start_date', 'Financial Year Start', 'আর্থিক বছর শুরু');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1018', 'financial_year_end_date', 'Financial Year End', 'আর্থিক বছরের শেষ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1019', 'subaccount_list', 'Sub Account List', 'সাব অ্যাকাউন্ট তালিকা');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1020', 'subaccount_add', 'Sub Account Add', 'সাব অ্যাকাউন্ট যোগ করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1021', 'subtype', 'Sub Type', 'সাব টাইপ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1022', 'predefined_accounts', 'Predefined Accounts', 'পূর্বনির্ধারিত অ্যাকাউন্ট');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1023', 'create_debit_voucher', 'Create Debit Voucher', 'ডেবিট ভাউচার তৈরি করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1024', 'ledger_comment', 'Ledger Comment', 'লেজার মন্তব্য');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1025', 'reverseHead', 'Reverse Account Name', 'অ্যাকাউন্ট নাম বিপরীত');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1026', 'VNo', 'VNo', 'VNo');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1027', 'ledgerComment', '	Ledger Comment', 'লেজার মন্তব্য');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1028', 'create_credit_voucher', 'Create Credit Voucher', 'ক্রেডিট ভাউচার তৈরি করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1029', 'create_contra_voucher', 'Create Contra Voucher', 'কনট্রা ভাউচার তৈরি করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1030', 'create_journal_voucher', 'Create Journal Voucher', 'জার্নাল ভাউচার তৈরি করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1031', 'reverse_account_head', 'Reverse Account Head', 'রিভার্স অ্যাকাউন্ট হেড');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1032', 'bank_reconciliation', 'Bank Reconciliation', 'ব্যাংক পুনর্মিলন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1033', 'day_book', 'Day Book', 'দিনের বই');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1034', 'sub_ledger', 'Sub Ledger', 'সাব লেজার');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1035', 'income_statement_form', 'Income Statement', 'আয় বিবৃতি');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1036', 'year', 'Year', 'বছর');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1037', 'expenditure_statement', 'Expenditure Statement', 'ব্যয় বিবরণী');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1038', 'profit_loss_report', 'Profit Loss', 'লাভ ক্ষতি');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1039', 'fixedasset_schedule', 'Fixed Asset Schedule', 'স্থায়ী সম্পদের সময়সূচী');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1040', 'receipt_payment', 'Receipt & Payment', 'রসিদ এবং অর্থপ্রদান');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1041', 'cash_basis', 'Cash Basis', 'নগদ ভিত্তি');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1042', 'accrual_basis', 'Accrual Basis', 'বৃদ্ধি ভিত্তিতে');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1043', 'bank_reconciliation_report', 'Bank Reconciliation Report', 'ব্যাংক পুনর্মিলন রিপোর্ট');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1044', 'salary_advance_view', 'Salary Advance', 'অগ্রিম বেতন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1045', 'add_salary_advance', 'Add Salary Advance', 'বেতন অগ্রিম যোগ করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1046', 'manage_salary_advance', 'Manage Salary Advance', 'বেতন অগ্রিম পরিচালনা করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1047', 'release_amount', 'Release Amount', 'রিলিজ পরিমাণ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1048', 'create_date', 'Create Date', 'তারিখ তৈরি করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1049', 'employee_salary_generate', 'Salary Generate', 'বেতন জেনারেট');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1050', 'approved_date', 'Approved Date', 'অনুমোদিত তারিখ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1051', 'approved_by', 'Approved By', 'দ্বারা স্বীকৃত');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1052', 'salar_month', 'Salary Month', 'বেতন মাস');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1053', 'employee_salary_chart', 'Employee Salary Chart', 'কর্মচারী বেতন চার্ট');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1054', 'post', 'Post', 'পোস্ট');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1055', 'employee_salary_payment_view', 'Manage Employee Salary', 'কর্মচারী বেতন পরিচালনা করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1056', 'pay_by', 'Pay By', 'দ্বারা বেতন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1057', 'bank_book_report', 'Bank Book Report Of', 'ব্যাংক বুক রিপোর্ট অফ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1058', 'head_name', 'Head Name', 'মাথার নাম');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1059', 'head_code', 'Head Code', 'হেড কোড');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1060', 'voucher', 'Voucher', 'ভাউচার');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1061', 'sub_ledger_of', 'Sub Ledger of', 'এর সাব লেজার');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1062', 'fixed_assets_report', 'Fixed Assets Annual Report', 'স্থায়ী সম্পদের বার্ষিক প্রতিবেদন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1063', 'opening_balance_fixed_assets', 'Opening Balance of Fixed Assets', 'স্থায়ী সম্পদের খোলার ব্যালেন্স');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1064', 'additions', 'Additions', 'সংযোজন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1065', 'closing_balance_fixed_assets', 'Closing Balance of Fixed Assets', 'স্থায়ী সম্পদের ক্লোজিং ব্যালেন্স');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1066', 'depreciation_rate', 'Depreciation Rate', 'অবচয় হার');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1067', 'depreciation_value', 'Depreciation Value', 'অবচয় মান');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1068', 'opening_balance_accumulated_depreciation', 'Opening Balance of Accumulated Depreciation', 'সঞ্চিত অবচয়ের খোলার ব্যালেন্স');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1069', 'closing_balance_accumulated_depreciation', 'Closing Balance of Accumulated Depreciation', 'পুঞ্জীভূত অবচয়ের ভারসাম্য');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1070', 'written_down_value', 'Written Down Value', 'লিখিত মূল্য');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1071', 'unapproved', 'Unapproved', 'অননুমোদিত');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1072', 'check_no', 'Check No', 'চেক নম্বর');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1073', 'Total Liabilities Equity', 'total_liabilities_equity', 'মোট_দায়িত্ব_ইকুইটি');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1074', 'total_equity', 'Total Equity', 'মোট ইক্যুইটি');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1075', 'total_liabilities', 'Total Liabilities', 'মোট দায়');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1076', 'total_assets', 'Total Assets', 'মোট সম্পদ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1077', 'cashinhand', 'Cash In Hand', 'হাতে নগদ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1078', 'cash_bank', 'Cash At Bank', 'ব্যাংক এ নগদ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1079', 'advance', 'Advance', 'অগ্রিম');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1080', 'view_employee_payment', 'Employee Payment List', 'কর্মচারী পেমেন্ট তালিকা');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1081', 'ret_item', 'Returned Item', 'ফেরত আইটেম');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1082', 'replaced_item', 'Replaced Item', 'প্রতিস্থাপিত আইটেম');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1083', 'adj_amount', 'Adjusted Amount', 'সামঞ্জস্য করা পরিমাণ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1084', 'is_autoapprove_v', 'Auto Approve Invoice Voucher', 'অটো অ্যাপ্রুভ ইনভয়েস ভাউচার');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1085', 'cost_price', 'Cost Price', 'কেনা দাম');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1086', 'chalan_no', 'Chalan No', 'চলন নং');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1087', 'already_returned', 'This Invoice is Already Returned ', 'এই চালান ইতিমধ্যে ফেরত দেওয়া হয়েছে');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1088', 'warehouse', 'Warehouse', 'গুদাম');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1089', 'edit_warehouse', 'Edit Warehouse', 'গুদাম সম্পাদনা করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1090', 'warehouse_name', 'Warehouse Name', 'গুদামের নাম');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1091', 'warehouse_list', 'Warehouse List', 'গুদাম তালিকা');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1092', 'writer', 'Writer', 'লেখক');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1093', 'publication', 'Publication', 'প্রকাশনা');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1094', 'edit_writer', 'Edit Writer', 'লেখক সম্পাদনা করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1095', 'writer_name', 'Writer Name', 'লেখকের নাম');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1096', 'writer_list', 'Writer List', 'লেখকের তালিকা');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1097', 'publication_list', 'Publication List', 'প্রকাশনার তালিকা');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1098', 'edit_publication', 'Edit Publication', 'প্রকাশনা সম্পাদনা করুন');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1099', 'payment_method', 'Payment Method', 'মূল্যপরিশোধ পদ্ধতি');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1100', 'net_amount', 'Net Amount', 'থোক');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1101', 'delivery_details', 'Delivery Details', 'প্রসবের বিবরণ');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1102', 'opening_stock', 'Opening Stock', 'খোলা স্টক');
INSERT INTO `language` (`id`, `phrase`, `english`, `bangla`) VALUES ('1103', 'opening_quantity', 'Opening Quantity', 'খোলার পরিমাণ');


#
# TABLE STRUCTURE FOR: module
#

DROP TABLE IF EXISTS `module`;

CREATE TABLE `module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `directory` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `module` (`id`, `name`, `description`, `image`, `directory`, `status`) VALUES ('1', 'invoice', NULL, NULL, NULL, '1');
INSERT INTO `module` (`id`, `name`, `description`, `image`, `directory`, `status`) VALUES ('2', 'customer', NULL, NULL, NULL, '1');
INSERT INTO `module` (`id`, `name`, `description`, `image`, `directory`, `status`) VALUES ('3', 'product', NULL, NULL, NULL, '1');
INSERT INTO `module` (`id`, `name`, `description`, `image`, `directory`, `status`) VALUES ('4', 'supplier', NULL, NULL, NULL, '1');
INSERT INTO `module` (`id`, `name`, `description`, `image`, `directory`, `status`) VALUES ('5', 'purchase', NULL, NULL, NULL, '1');
INSERT INTO `module` (`id`, `name`, `description`, `image`, `directory`, `status`) VALUES ('6', 'stock', NULL, NULL, NULL, '1');
INSERT INTO `module` (`id`, `name`, `description`, `image`, `directory`, `status`) VALUES ('7', 'return', NULL, NULL, NULL, '1');
INSERT INTO `module` (`id`, `name`, `description`, `image`, `directory`, `status`) VALUES ('8', 'report', NULL, NULL, NULL, '1');
INSERT INTO `module` (`id`, `name`, `description`, `image`, `directory`, `status`) VALUES ('9', 'accounts', NULL, NULL, NULL, '1');
INSERT INTO `module` (`id`, `name`, `description`, `image`, `directory`, `status`) VALUES ('11', 'tax', NULL, NULL, NULL, '1');
INSERT INTO `module` (`id`, `name`, `description`, `image`, `directory`, `status`) VALUES ('12', 'hrm_management', NULL, NULL, NULL, '1');
INSERT INTO `module` (`id`, `name`, `description`, `image`, `directory`, `status`) VALUES ('13', 'service', NULL, NULL, NULL, '1');
INSERT INTO `module` (`id`, `name`, `description`, `image`, `directory`, `status`) VALUES ('15', 'setting', NULL, NULL, NULL, '1');
INSERT INTO `module` (`id`, `name`, `description`, `image`, `directory`, `status`) VALUES ('16', 'quotation', NULL, NULL, NULL, '1');


#
# TABLE STRUCTURE FOR: module_purchase_key
#

DROP TABLE IF EXISTS `module_purchase_key`;

CREATE TABLE `module_purchase_key` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identity` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `purchase_key` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# TABLE STRUCTURE FOR: opening_item_stock
#

DROP TABLE IF EXISTS `opening_item_stock`;

CREATE TABLE `opening_item_stock` (
  `stock_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL COMMENT 'from product_information',
  `quantity` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL COMMENT 'from warehouse',
  PRIMARY KEY (`stock_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `opening_item_stock` (`stock_id`, `product_id`, `quantity`, `warehouse_id`) VALUES ('2', '16737744', '30', '1');
INSERT INTO `opening_item_stock` (`stock_id`, `product_id`, `quantity`, `warehouse_id`) VALUES ('3', '62560353', '50', '1');
INSERT INTO `opening_item_stock` (`stock_id`, `product_id`, `quantity`, `warehouse_id`) VALUES ('8', '16737744', '54', '2');
INSERT INTO `opening_item_stock` (`stock_id`, `product_id`, `quantity`, `warehouse_id`) VALUES ('9', '62560353', '55', '2');
INSERT INTO `opening_item_stock` (`stock_id`, `product_id`, `quantity`, `warehouse_id`) VALUES ('10', '69488303', '90', '2');


#
# TABLE STRUCTURE FOR: payment_by_customer
#

DROP TABLE IF EXISTS `payment_by_customer`;

CREATE TABLE `payment_by_customer` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL COMMENT 'from customer_information',
  `payment_method_id` int(11) NOT NULL COMMENT 'from payment_method',
  `amount` double(10,2) NOT NULL,
  `added_on` datetime NOT NULL,
  `added_by` int(11) NOT NULL COMMENT 'from user_login	',
  `warehouse_id` int(11) NOT NULL COMMENT 'from warehouse',
  PRIMARY KEY (`payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# TABLE STRUCTURE FOR: payment_method
#

DROP TABLE IF EXISTS `payment_method`;

CREATE TABLE `payment_method` (
  `payment_method_id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_method_name` varchar(155) COLLATE utf8_unicode_ci NOT NULL,
  `account_number` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`payment_method_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `payment_method` (`payment_method_id`, `payment_method_name`, `account_number`) VALUES ('1', 'Cash', '');
INSERT INTO `payment_method` (`payment_method_id`, `payment_method_name`, `account_number`) VALUES ('2', 'Rocket', '017273823742');
INSERT INTO `payment_method` (`payment_method_id`, `payment_method_name`, `account_number`) VALUES ('3', 'Dutch Bangla Bank', '17326243848');


#
# TABLE STRUCTURE FOR: payment_to_supplier
#

DROP TABLE IF EXISTS `payment_to_supplier`;

CREATE TABLE `payment_to_supplier` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_id` int(11) NOT NULL COMMENT 'from supplier_information',
  `payment_method_id` int(11) NOT NULL COMMENT 'from payment_method',
  `amount` double(10,2) NOT NULL,
  `added_on` datetime NOT NULL,
  `added_by` int(11) NOT NULL COMMENT 'from user_login',
  `warehouse_id` int(11) NOT NULL COMMENT 'from warehouse',
  PRIMARY KEY (`payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# TABLE STRUCTURE FOR: print_setting
#

DROP TABLE IF EXISTS `print_setting`;

CREATE TABLE `print_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `header` int(11) NOT NULL,
  `footer` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `print_setting` (`id`, `header`, `footer`) VALUES ('1', '200', '100');


#
# TABLE STRUCTURE FOR: product_category
#

DROP TABLE IF EXISTS `product_category`;

CREATE TABLE `product_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `product_category` (`category_id`, `category_name`, `status`) VALUES ('1', 'ডিটেকটিভ, ইন্টেলিজেন্স ও সিক্রেট এজেন্সি', '1');
INSERT INTO `product_category` (`category_id`, `category_name`, `status`) VALUES ('2', 'ইসলামি বই: আত্ম-উন্নয়ন', '1');
INSERT INTO `product_category` (`category_id`, `category_name`, `status`) VALUES ('3', 'ইসলামি আদর্শ  ও মতবাদ', '1');


#
# TABLE STRUCTURE FOR: product_information
#

DROP TABLE IF EXISTS `product_information`;

CREATE TABLE `product_information` (
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

INSERT INTO `product_information` (`id`, `product_id`, `category_id`, `writer_id`, `publication_id`, `product_name`, `price`, `supplier_price`, `supplier_id`, `unit`, `tax`, `serial_no`, `product_vat`, `product_model`, `product_details`, `image`, `status`, `added_on`, `added_by`, `edited_on`, `edited_by`) VALUES ('1', '19526545', '1', '1', '1', 'Book name 1', '140', '120.00', '1', '4', '0', NULL, NULL, NULL, 'details here', './my-assets/image/product/2022-10-24/6f2283ee36e71e2fde7492716b94b1a3.jpg', '1', '2022-10-24 06:41:38', '1', '2022-10-24 06:44:22', '1');
INSERT INTO `product_information` (`id`, `product_id`, `category_id`, `writer_id`, `publication_id`, `product_name`, `price`, `supplier_price`, `supplier_id`, `unit`, `tax`, `serial_no`, `product_vat`, `product_model`, `product_details`, `image`, `status`, `added_on`, `added_by`, `edited_on`, `edited_by`) VALUES ('2', '16737744', '2', '1', '1', 'Book name 2', '190', '140.00', '2', '4', '0', NULL, NULL, NULL, '', 'my-assets/image/product.png', '1', '2022-10-24 06:44:47', '1', NULL, NULL);
INSERT INTO `product_information` (`id`, `product_id`, `category_id`, `writer_id`, `publication_id`, `product_name`, `price`, `supplier_price`, `supplier_id`, `unit`, `tax`, `serial_no`, `product_vat`, `product_model`, `product_details`, `image`, `status`, `added_on`, `added_by`, `edited_on`, `edited_by`) VALUES ('3', '62560353', '2', '1', '1', 'Book name 3', '190', '130.00', '2', '4', '0', NULL, NULL, NULL, '', 'my-assets/image/product.png', '1', '2022-10-24 06:45:14', '1', NULL, NULL);
INSERT INTO `product_information` (`id`, `product_id`, `category_id`, `writer_id`, `publication_id`, `product_name`, `price`, `supplier_price`, `supplier_id`, `unit`, `tax`, `serial_no`, `product_vat`, `product_model`, `product_details`, `image`, `status`, `added_on`, `added_by`, `edited_on`, `edited_by`) VALUES ('4', '69488303', '2', '1', '1', 'Book name 4', '220', '190.00', '2', '3', '0', NULL, NULL, NULL, '', 'my-assets/image/product.png', '1', '2022-10-24 06:45:37', '1', NULL, NULL);


#
# TABLE STRUCTURE FOR: product_purchase
#

DROP TABLE IF EXISTS `product_purchase`;

CREATE TABLE `product_purchase` (
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `product_purchase` (`id`, `purchase_id`, `chalan_no`, `supplier_id`, `grand_total_amount`, `paid_amount`, `due_amount`, `total_discount`, `invoice_discount`, `total_vat_amnt`, `purchase_date`, `purchase_details`, `status`, `bank_id`, `payment_method_id`, `is_credit`, `added_on`, `added_by`, `edited_on`, `edited_by`, `warehouse_id`) VALUES ('1', '1', '2345643', '2', '37150.00', '37140.00', '10.00', NULL, '6350.00', '0.00', '2022-10-24', '', '1', NULL, '3', NULL, '2022-10-24 06:49:36', '1', '2022-10-24 10:01:59', '1', '1');
INSERT INTO `product_purchase` (`id`, `purchase_id`, `chalan_no`, `supplier_id`, `grand_total_amount`, `paid_amount`, `due_amount`, `total_discount`, `invoice_discount`, `total_vat_amnt`, `purchase_date`, `purchase_details`, `status`, `bank_id`, `payment_method_id`, `is_credit`, `added_on`, `added_by`, `edited_on`, `edited_by`, `warehouse_id`) VALUES ('2', '2', '29093092', '1', '24840.00', '24840.00', '0.00', NULL, '2760.00', '0.00', '2022-10-24', '', '1', NULL, '1', NULL, '2022-10-24 08:01:58', '1', NULL, NULL, '1');
INSERT INTO `product_purchase` (`id`, `purchase_id`, `chalan_no`, `supplier_id`, `grand_total_amount`, `paid_amount`, `due_amount`, `total_discount`, `invoice_discount`, `total_vat_amnt`, `purchase_date`, `purchase_details`, `status`, `bank_id`, `payment_method_id`, `is_credit`, `added_on`, `added_by`, `edited_on`, `edited_by`, `warehouse_id`) VALUES ('3', '3', '213122', '2', '13318.00', '13318.00', '0.00', NULL, '982.00', '0.00', '2022-10-24', '', '1', NULL, '2', NULL, '2022-10-24 10:51:40', '1', '2022-10-24 10:52:50', '1', '1');
INSERT INTO `product_purchase` (`id`, `purchase_id`, `chalan_no`, `supplier_id`, `grand_total_amount`, `paid_amount`, `due_amount`, `total_discount`, `invoice_discount`, `total_vat_amnt`, `purchase_date`, `purchase_details`, `status`, `bank_id`, `payment_method_id`, `is_credit`, `added_on`, `added_by`, `edited_on`, `edited_by`, `warehouse_id`) VALUES ('4', '4', '100092', '2', '57040.00', '57040.00', '0.00', NULL, '9660.00', '0.00', '2022-10-24', 'details', '1', NULL, '3', NULL, '2022-10-24 10:59:19', '1', '2022-10-24 11:00:04', '1', '2');


#
# TABLE STRUCTURE FOR: product_purchase_details
#

DROP TABLE IF EXISTS `product_purchase_details`;

CREATE TABLE `product_purchase_details` (
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `product_purchase_details` (`id`, `purchase_detail_id`, `purchase_id`, `product_id`, `quantity`, `rate`, `batch_id`, `expiry_date`, `total_amount`, `discount`, `discount_amnt`, `vat_amnt_per`, `vat_amnt`, `status`) VALUES ('4', 'X6QPQM4ZLWXL1IU', '2', '19526545', '230.00', '120.00', NULL, NULL, '24840.00', '10', '2760.00', '0.00', '0.00', '1');
INSERT INTO `product_purchase_details` (`id`, `purchase_detail_id`, `purchase_id`, `product_id`, `quantity`, `rate`, `batch_id`, `expiry_date`, `total_amount`, `discount`, `discount_amnt`, `vat_amnt_per`, `vat_amnt`, `status`) VALUES ('8', 'LKFVJUDXD2DHFRD', '1', '69488303', '50.00', '190.00', NULL, NULL, '7600.00', '20', '1900.00', '0.00', '0.00', '1');
INSERT INTO `product_purchase_details` (`id`, `purchase_detail_id`, `purchase_id`, `product_id`, `quantity`, `rate`, `batch_id`, `expiry_date`, `total_amount`, `discount`, `discount_amnt`, `vat_amnt_per`, `vat_amnt`, `status`) VALUES ('9', 'UB2J7N7J3OZ2H7N', '1', '16737744', '150.00', '140.00', NULL, NULL, '17850.00', '15', '3150.00', '0.00', '0.00', '1');
INSERT INTO `product_purchase_details` (`id`, `purchase_detail_id`, `purchase_id`, `product_id`, `quantity`, `rate`, `batch_id`, `expiry_date`, `total_amount`, `discount`, `discount_amnt`, `vat_amnt_per`, `vat_amnt`, `status`) VALUES ('10', 'WG8B45GJI4TIAFW', '1', '62560353', '100.00', '130.00', NULL, NULL, '11700.00', '10', '1300.00', '0.00', '0.00', '1');
INSERT INTO `product_purchase_details` (`id`, `purchase_detail_id`, `purchase_id`, `product_id`, `quantity`, `rate`, `batch_id`, `expiry_date`, `total_amount`, `discount`, `discount_amnt`, `vat_amnt_per`, `vat_amnt`, `status`) VALUES ('17', 'C3V4I6A2Q6STHL1', '3', '69488303', '40.00', '190.00', NULL, NULL, '6992.00', '8', '608.00', '0.00', '0.00', '1');
INSERT INTO `product_purchase_details` (`id`, `purchase_detail_id`, `purchase_id`, `product_id`, `quantity`, `rate`, `batch_id`, `expiry_date`, `total_amount`, `discount`, `discount_amnt`, `vat_amnt_per`, `vat_amnt`, `status`) VALUES ('18', 'MW2CR1EOVRPNNDY', '3', '62560353', '30.00', '130.00', NULL, NULL, '3666.00', '6', '234.00', '0.00', '0.00', '1');
INSERT INTO `product_purchase_details` (`id`, `purchase_detail_id`, `purchase_id`, `product_id`, `quantity`, `rate`, `batch_id`, `expiry_date`, `total_amount`, `discount`, `discount_amnt`, `vat_amnt_per`, `vat_amnt`, `status`) VALUES ('19', '1OVYFOOQ4ZC85J9', '3', '16737744', '20.00', '140.00', NULL, NULL, '2660.00', '5', '140.00', '0.00', '0.00', '1');
INSERT INTO `product_purchase_details` (`id`, `purchase_detail_id`, `purchase_id`, `product_id`, `quantity`, `rate`, `batch_id`, `expiry_date`, `total_amount`, `discount`, `discount_amnt`, `vat_amnt_per`, `vat_amnt`, `status`) VALUES ('22', '3ZXBLZC89UIBR3Z', '4', '16737744', '100.00', '140.00', NULL, NULL, '12600.00', '10', '1400.00', '0.00', '0.00', '1');
INSERT INTO `product_purchase_details` (`id`, `purchase_detail_id`, `purchase_id`, `product_id`, `quantity`, `rate`, `batch_id`, `expiry_date`, `total_amount`, `discount`, `discount_amnt`, `vat_amnt_per`, `vat_amnt`, `status`) VALUES ('23', 'RXQEILZOONAPS39', '4', '69488303', '120.00', '190.00', NULL, NULL, '20520.00', '10', '2280.00', '0.00', '0.00', '1');
INSERT INTO `product_purchase_details` (`id`, `purchase_detail_id`, `purchase_id`, `product_id`, `quantity`, `rate`, `batch_id`, `expiry_date`, `total_amount`, `discount`, `discount_amnt`, `vat_amnt_per`, `vat_amnt`, `status`) VALUES ('24', 'OCN2168QZ9LZ7NA', '4', '62560353', '230.00', '130.00', NULL, NULL, '23920.00', '20', '5980.00', '0.00', '0.00', '1');


#
# TABLE STRUCTURE FOR: product_return
#

DROP TABLE IF EXISTS `product_return`;

CREATE TABLE `product_return` (
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

#
# TABLE STRUCTURE FOR: product_service
#

DROP TABLE IF EXISTS `product_service`;

CREATE TABLE `product_service` (
  `service_id` int(11) NOT NULL AUTO_INCREMENT,
  `service_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `charge` decimal(10,2) NOT NULL DEFAULT '0.00',
  `service_vat` float DEFAULT NULL,
  `is_fixed` int(11) NOT NULL DEFAULT '0',
  `is_dynamic` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# TABLE STRUCTURE FOR: publication
#

DROP TABLE IF EXISTS `publication`;

CREATE TABLE `publication` (
  `publication_id` int(11) NOT NULL AUTO_INCREMENT,
  `publication_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`publication_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `publication` (`publication_id`, `publication_name`, `status`) VALUES ('1', 'সমকালীন', '1');
INSERT INTO `publication` (`publication_id`, `publication_name`, `status`) VALUES ('2', 'বাতিঘর', '1');


#
# TABLE STRUCTURE FOR: role_permission
#

DROP TABLE IF EXISTS `role_permission`;

CREATE TABLE `role_permission` (
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

INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('873', '1', '1', '1', '1', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('874', '2', '1', '0', '1', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('875', '3', '1', '0', '1', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('876', '121', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('877', '122', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('878', '4', '1', '1', '1', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('879', '5', '1', '0', '1', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('880', '10', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('881', '11', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('882', '12', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('883', '13', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('884', '14', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('885', '15', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('886', '16', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('887', '144', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('888', '145', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('889', '17', '1', '1', '1', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('890', '18', '1', '0', '1', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('891', '21', '1', '1', '1', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('892', '22', '1', '0', '1', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('893', '23', '1', '0', '1', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('894', '24', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('895', '25', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('896', '26', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('897', '27', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('898', '28', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('899', '29', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('900', '30', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('901', '31', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('902', '32', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('903', '33', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('904', '34', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('905', '35', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('906', '36', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('907', '37', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('908', '38', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('909', '39', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('910', '40', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('911', '41', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('912', '42', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('913', '43', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('914', '44', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('915', '45', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('916', '46', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('917', '47', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('918', '48', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('919', '49', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('920', '50', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('921', '51', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('922', '52', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('923', '53', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('924', '54', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('925', '55', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('926', '56', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('927', '57', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('928', '58', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('929', '60', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('930', '123', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('931', '125', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('932', '126', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('933', '127', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('934', '128', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('935', '129', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('936', '130', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('937', '131', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('938', '132', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('939', '133', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('940', '134', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('941', '135', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('942', '136', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('943', '137', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('944', '138', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('945', '139', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('946', '140', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('947', '65', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('948', '124', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('949', '70', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('950', '71', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('951', '72', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('952', '73', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('953', '74', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('954', '75', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('955', '76', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('956', '141', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('957', '142', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('958', '143', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('959', '97', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('960', '98', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('961', '99', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('962', '100', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('963', '102', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('964', '103', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('965', '104', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('966', '105', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('967', '106', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('968', '107', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('969', '108', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('970', '109', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('971', '110', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('972', '111', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('973', '112', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('974', '113', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('975', '115', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('976', '116', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('977', '117', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('978', '118', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('979', '119', '1', '0', '0', '0', '0');
INSERT INTO `role_permission` (`id`, `fk_module_id`, `role_id`, `create`, `read`, `update`, `delete`) VALUES ('980', '120', '1', '0', '0', '0', '0');


#
# TABLE STRUCTURE FOR: sec_role
#

DROP TABLE IF EXISTS `sec_role`;

CREATE TABLE `sec_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `sec_role` (`id`, `type`) VALUES ('1', 'Store Manager');


#
# TABLE STRUCTURE FOR: sec_userrole
#

DROP TABLE IF EXISTS `sec_userrole`;

CREATE TABLE `sec_userrole` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `roleid` int(11) NOT NULL,
  `createby` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `createdate` datetime NOT NULL,
  UNIQUE KEY `ID` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `sec_userrole` (`id`, `user_id`, `roleid`, `createby`, `createdate`) VALUES ('1', '615419', '1', '1', '2022-06-16 03:49:43');
INSERT INTO `sec_userrole` (`id`, `user_id`, `roleid`, `createby`, `createdate`) VALUES ('2', '276843', '1', '1', '2022-10-25 04:11:27');


#
# TABLE STRUCTURE FOR: seles_termscondi
#

DROP TABLE IF EXISTS `seles_termscondi`;

CREATE TABLE `seles_termscondi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `seles_termscondi` (`id`, `description`, `status`) VALUES ('5', 'Goods purchased without the original invoice are not to be returned or exchanged', '1');


#
# TABLE STRUCTURE FOR: sms_settings
#

DROP TABLE IF EXISTS `sms_settings`;

CREATE TABLE `sms_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `api_key` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `api_secret` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `from` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isinvoice` int(11) NOT NULL DEFAULT '0',
  `isservice` int(11) NOT NULL DEFAULT '0',
  `isreceive` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `sms_settings` (`id`, `api_key`, `api_secret`, `from`, `isinvoice`, `isservice`, `isreceive`) VALUES ('1', '5d6db102011', '456452dfgdf', '8801645452', '0', '0', '0');


#
# TABLE STRUCTURE FOR: sub_module
#

DROP TABLE IF EXISTS `sub_module`;

CREATE TABLE `sub_module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `image` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `directory` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('1', '1', 'new_invoice', NULL, NULL, 'new_invoice', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('2', '1', 'manage_invoice', NULL, NULL, 'manage_invoice', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('3', '1', 'pos_invoice', NULL, NULL, 'gui_pos', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('4', '2', 'add_customer', NULL, NULL, 'add_customer', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('5', '2', 'manage_customer', NULL, NULL, 'manage_customer', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('6', '0', 'credit_customer', NULL, NULL, 'credit_customer', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('7', '0', 'paid_customer', NULL, NULL, 'paid_customer', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('8', '0', 'customer_ledger', NULL, NULL, 'customer_ledger', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('9', '0', 'customer_advance', NULL, NULL, 'customer_advance', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('10', '3', 'category', NULL, NULL, 'category', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('11', '3', 'manage_category', NULL, NULL, 'manage_category', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('12', '3', 'unit', NULL, NULL, 'unit', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('13', '3', 'manage_unit', NULL, NULL, 'manage_unit', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('14', '3', 'add_product', NULL, NULL, 'create_product', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('15', '3', 'import_product_csv', NULL, NULL, 'add_product_csv', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('16', '3', 'manage_product', NULL, NULL, 'manage_product', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('17', '4', 'add_supplier', NULL, NULL, 'add_supplier', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('18', '4', 'manage_supplier', NULL, NULL, 'manage_supplier', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('19', '0', 'supplier_ledger', NULL, NULL, 'supplier_ledger_report', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('20', '0', 'supplier_advance', NULL, NULL, 'supplier_advance', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('21', '5', 'add_purchase', NULL, NULL, 'add_purchase', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('22', '5', 'manage_purchase', NULL, NULL, 'manage_purchase', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('23', '6', 'stock_report', NULL, NULL, 'stock_report', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('24', '7', 'return', NULL, NULL, 'add_return', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('25', '7', 'stock_return_list', NULL, NULL, 'return_list', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('26', '7', 'supplier_return_list', NULL, NULL, 'supplier_return_list', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('27', '7', 'wastage_return_list', NULL, NULL, 'wastage_return_list', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('28', '8', 'closing', NULL, NULL, 'add_closing', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('29', '8', 'closing_report', NULL, NULL, 'closing_report', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('30', '8', 'todays_report', NULL, NULL, 'all_report', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('31', '8', 'todays_customer_receipt', NULL, NULL, 'todays_customer_receipt', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('32', '8', 'sales_report', NULL, NULL, 'todays_sales_report', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('33', '8', 'due_report', NULL, NULL, 'due_report', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('34', '8', 'purchase_report', NULL, NULL, 'todays_purchase_report', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('35', '8', 'purchase_report_category_wise', NULL, NULL, 'purchase_report_category_wise', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('36', '8', 'sales_report_product_wise', NULL, NULL, 'product_sales_reports_date_wise', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('37', '8', 'sales_report_category_wise', NULL, NULL, 'sales_report_category_wise', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('38', '8', 'shipping_cost_report', NULL, NULL, 'shipping_cost_report', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('39', '8', 'user_wise_sales_report', NULL, NULL, 'user_wise_sales_report', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('40', '8', 'invoice_return', NULL, NULL, 'invoice_return', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('41', '8', 'supplier_return', NULL, NULL, 'supplier_return', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('42', '8', 'tax_report', NULL, NULL, 'tax_report', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('43', '8', 'profit_report', NULL, NULL, 'profit_report', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('44', '9', 'c_o_a', NULL, NULL, 'show_tree', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('45', '9', 'subaccount_list', NULL, NULL, 'subaccount_list', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('46', '9', 'predefined_accounts', NULL, NULL, 'predefined_accounts', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('47', '9', 'financial_year', NULL, NULL, 'financial_year', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('48', '9', 'opening_balance', NULL, NULL, 'opening_balance', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('49', '9', 'credit_voucher', NULL, NULL, 'credit_voucher', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('50', '9', 'voucher_approval', NULL, NULL, 'aprove_v', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('51', '9', 'contra_voucher', NULL, NULL, 'contra_voucher', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('52', '9', 'journal_voucher', NULL, NULL, 'journal_voucher', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('53', '9', 'report', NULL, NULL, 'ac_report', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('54', '9', 'cash_book', NULL, NULL, 'cash_book', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('55', '9', 'Inventory_ledger', NULL, NULL, 'inventory_ledger', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('56', '9', 'bank_book', NULL, NULL, 'bank_book', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('57', '9', 'general_ledger', NULL, NULL, 'general_ledger', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('58', '9', 'trial_balance', NULL, NULL, 'trial_balance', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('60', '9', 'coa_print', NULL, NULL, 'coa_print', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('61', '0', 'add_new_bank', NULL, NULL, 'add_bank', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('62', '0', 'manage_bank', NULL, NULL, 'bank_list', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('63', '0', 'bank_transaction', NULL, NULL, 'bank_transaction', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('64', '0', 'bank_ledger', NULL, NULL, 'bank_ledger', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('65', '11', 'tax_settings', NULL, NULL, 'tax_settings', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('66', '0', 'add_incometax', NULL, NULL, 'add_incometax', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('67', '0', 'manage_income_tax', NULL, NULL, 'manage_income_tax', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('68', '0', 'tax_report', NULL, NULL, 'tax_report', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('69', '0', 'invoice_wise_tax_report', NULL, NULL, 'invoice_wise_tax_report', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('70', '12', 'add_designation', NULL, NULL, 'add_designation', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('71', '12', 'manage_designation', NULL, NULL, 'manage_designation', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('72', '12', 'add_employee', NULL, NULL, 'add_employee', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('73', '12', 'manage_employee', NULL, NULL, 'manage_employee', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('74', '12', 'add_attendance', NULL, NULL, 'add_attendance', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('75', '12', 'manage_attendance', NULL, NULL, 'manage_attendance', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('76', '12', 'attendance_report', NULL, NULL, 'attendance_report', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('77', '0', 'add_benefits', NULL, NULL, 'add_benefits', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('78', '0', 'manage_benefits', NULL, NULL, 'manage_benefits', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('79', '0', 'add_salary_setup', NULL, NULL, 'add_salary_setup', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('80', '0', 'manage_salary_setup', NULL, NULL, 'manage_salary_setup', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('81', '0', 'salary_generate', NULL, NULL, 'salary_generate', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('82', '0', 'manage_salary_generate', NULL, NULL, 'manage_salary_generate', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('83', '0', 'salary_payment', NULL, NULL, 'salary_payment', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('84', '0', 'add_expense_item', NULL, NULL, 'add_expense_item', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('85', '0', 'manage_expense_item', NULL, NULL, 'manage_expense_item', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('86', '0', 'add_expense', NULL, NULL, 'add_expense', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('87', '0', 'manage_expense', NULL, NULL, 'manage_expense', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('88', '0', 'expense_statement', NULL, NULL, 'expense_statement', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('89', '0', 'add_person_officeloan', NULL, NULL, 'add1_person', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('90', '0', 'add_loan_officeloan', NULL, NULL, 'add_office_loan', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('91', '0', 'add_payment_officeloan', NULL, NULL, 'add_loan_payment', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('92', '0', 'manage_loan_officeloan', NULL, NULL, 'manage1_person', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('93', '0', 'add_person_personalloan', NULL, NULL, 'add_person', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('94', '0', 'add_loan_personalloan', NULL, NULL, 'add_loan', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('95', '0', 'add_payment_personalloan', NULL, NULL, 'add_payment', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('96', '0', 'manage_loan_personalloan', NULL, NULL, 'manage_person', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('97', '13', 'add_service', NULL, NULL, 'create_service', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('98', '13', 'manage_service', NULL, NULL, 'manage_service', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('99', '13', 'service_invoice', NULL, NULL, 'service_invoice', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('100', '13', 'manage_service_invoice', NULL, NULL, 'manage_service_invoice', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('102', '15', 'manage_company', NULL, NULL, 'manage_company', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('103', '15', 'add_user', NULL, NULL, 'add_user', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('104', '15', 'manage_users', NULL, NULL, 'manage_user', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('105', '15', 'language', NULL, NULL, 'add_language', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('106', '15', 'currency', NULL, NULL, 'add_currency', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('107', '15', 'setting', NULL, NULL, 'soft_setting', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('108', '15', 'print_setting', NULL, NULL, 'print_setting', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('109', '15', 'mail_setting', NULL, NULL, 'mail_setting', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('110', '15', 'add_role', NULL, NULL, 'add_role', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('111', '15', 'role_list', NULL, NULL, 'role_list', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('112', '15', 'user_assign_role', NULL, NULL, 'user_assign', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('113', '15', 'Permission', NULL, NULL, NULL, '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('114', '0', 'sms_configure', NULL, NULL, 'sms_configure', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('115', '15', 'backup_restore', NULL, NULL, 'back_up', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('116', '15', 'import', NULL, NULL, 'sql_import', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('117', '15', 'restore', NULL, NULL, 'restore', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('118', '16', 'add_quotation', NULL, NULL, 'add_quotation', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('119', '16', 'manage_quotation', NULL, NULL, 'manage_quotation', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('120', '16', 'add_to_invoice', NULL, NULL, 'add_to_invoice', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('121', '1', 'terms_list', NULL, NULL, 'terms_list', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('122', '1', 'terms_add', NULL, NULL, 'terms_add', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('123', '9', 'service_payment', NULL, NULL, 'service_payment', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('124', '11', 'vat_tax_setting', NULL, NULL, 'vat_tax_setting', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('125', '9', 'add_payment_method', NULL, NULL, 'add_payment_method', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('126', '9', 'payment_method_list', NULL, NULL, 'payment_method_list', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('127', '9', 'debit_voucher', NULL, NULL, 'debit_voucher', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('128', '9', 'bank_reconciliation', NULL, NULL, 'bank_reconciliation', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('129', '9', 'supplier_payment', NULL, NULL, 'supplier_payment', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('130', '9', 'customer_receive', NULL, NULL, 'customer_receive', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('131', '9', 'cash_adjustment', NULL, NULL, 'cash_adjustment', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('132', '9', 'day_book', NULL, NULL, 'day_book', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('133', '9', 'sub_ledger', NULL, NULL, 'sub_ledger', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('134', '9', 'income_statement_form', NULL, NULL, 'income_statement_form', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('135', '9', 'expenditure_statement', NULL, NULL, 'expenditure_statement', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('136', '9', 'profit_loss_report', NULL, NULL, 'profit_loss_report', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('137', '9', 'balance_sheet', NULL, NULL, 'balance_sheet', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('138', '9', 'fixedasset_schedule', NULL, NULL, 'fixedasset_schedule', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('139', '9', 'receipt_payment', NULL, NULL, 'receipt_payment', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('140', '9', 'bank_reconciliation_report', NULL, NULL, 'bank_reconciliation_report', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('141', '12', 'salary_advance_view', NULL, NULL, 'salary_advance_view', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('142', '12', 'employee_salary_generate', NULL, NULL, 'employee_salary_generate', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('143', '12', 'employee_salary_payment_view', NULL, NULL, 'employee_salary_payment_view', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('144', '3', 'writer', NULL, NULL, 'writer', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('145', '3', 'publication', NULL, NULL, 'publication', '1');
INSERT INTO `sub_module` (`id`, `mid`, `name`, `description`, `image`, `directory`, `status`) VALUES ('146', '6', 'opening_stock', NULL, NULL, 'opening_stock', '1');


#
# TABLE STRUCTURE FOR: supplier_information
#

DROP TABLE IF EXISTS `supplier_information`;

CREATE TABLE `supplier_information` (
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

INSERT INTO `supplier_information` (`supplier_id`, `supplier_name`, `address`, `address2`, `mobile`, `emailnumber`, `email_address`, `contact`, `phone`, `fax`, `city`, `state`, `zip`, `country`, `details`, `status`) VALUES ('1', 'Imran Khan', '', '', '', '', '', '', '', '', '', '', '', '', NULL, '1');
INSERT INTO `supplier_information` (`supplier_id`, `supplier_name`, `address`, `address2`, `mobile`, `emailnumber`, `email_address`, `contact`, `phone`, `fax`, `city`, `state`, `zip`, `country`, `details`, `status`) VALUES ('2', 'Masihur Rahman', '', '', '', '', '', '', '', '', '', '', '', '', NULL, '1');


#
# TABLE STRUCTURE FOR: supplier_product
#

DROP TABLE IF EXISTS `supplier_product`;

CREATE TABLE `supplier_product` (
  `supplier_pr_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `products_model` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `supplier_id` bigint(20) NOT NULL,
  `supplier_price` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`supplier_pr_id`),
  KEY `product_id` (`product_id`),
  KEY `supplier_id` (`supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# TABLE STRUCTURE FOR: synchronizer_setting
#

DROP TABLE IF EXISTS `synchronizer_setting`;

CREATE TABLE `synchronizer_setting` (
  `id` int(11) NOT NULL,
  `hostname` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `port` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `debug` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `project_root` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# TABLE STRUCTURE FOR: tax_collection
#

DROP TABLE IF EXISTS `tax_collection`;

CREATE TABLE `tax_collection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `customer_id` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `relation_id` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# TABLE STRUCTURE FOR: tax_settings
#

DROP TABLE IF EXISTS `tax_settings`;

CREATE TABLE `tax_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `default_value` float NOT NULL,
  `tax_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `nt` int(11) NOT NULL,
  `reg_no` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `is_show` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# TABLE STRUCTURE FOR: units
#

DROP TABLE IF EXISTS `units`;

CREATE TABLE `units` (
  `unit_id` int(11) NOT NULL AUTO_INCREMENT,
  `unit_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`unit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `units` (`unit_id`, `unit_name`, `status`) VALUES ('3', 'Pieces', '1');
INSERT INTO `units` (`unit_id`, `unit_name`, `status`) VALUES ('4', 'KG', '1');


#
# TABLE STRUCTURE FOR: user_login
#

DROP TABLE IF EXISTS `user_login`;

CREATE TABLE `user_login` (
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

INSERT INTO `user_login` (`id`, `user_id`, `username`, `password`, `user_type`, `security_code`, `status`, `warehouse_id`) VALUES ('1', '1', 'mdsohelranacse@gmail.com', '82c1ab9f315f15ff53d5bba77c9a1884', '1', NULL, '1', '0');
INSERT INTO `user_login` (`id`, `user_id`, `username`, `password`, `user_type`, `security_code`, `status`, `warehouse_id`) VALUES ('2', '276843', 'samiul@gmail.com', '41d99b369894eb1ec3f461135132d8bb', '0', NULL, '1', '1');


#
# TABLE STRUCTURE FOR: users
#

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
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

INSERT INTO `users` (`id`, `user_id`, `last_name`, `first_name`, `company_name`, `address`, `phone`, `gender`, `date_of_birth`, `logo`, `status`) VALUES ('1', '1', 'User', 'Admin', NULL, NULL, NULL, NULL, NULL, 'assets/dist/img/profile_picture/profile.jpg', '1');
INSERT INTO `users` (`id`, `user_id`, `last_name`, `first_name`, `company_name`, `address`, `phone`, `gender`, `date_of_birth`, `logo`, `status`) VALUES ('2', '276843', 'Islam', 'Samiul', NULL, NULL, NULL, NULL, NULL, '', '1');


#
# TABLE STRUCTURE FOR: vat_tax_setting
#

DROP TABLE IF EXISTS `vat_tax_setting`;

CREATE TABLE `vat_tax_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dynamic_tax` int(11) NOT NULL DEFAULT '0',
  `fixed_tax` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `vat_tax_setting` (`id`, `dynamic_tax`, `fixed_tax`) VALUES ('1', '0', '1');


#
# TABLE STRUCTURE FOR: warehouse
#

DROP TABLE IF EXISTS `warehouse`;

CREATE TABLE `warehouse` (
  `warehouse_id` int(11) NOT NULL AUTO_INCREMENT,
  `warehouse_name` varchar(155) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`warehouse_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `warehouse` (`warehouse_id`, `warehouse_name`) VALUES ('1', 'রংপুর');
INSERT INTO `warehouse` (`warehouse_id`, `warehouse_name`) VALUES ('2', 'ঢাকা');


#
# TABLE STRUCTURE FOR: web_setting
#

DROP TABLE IF EXISTS `web_setting`;

CREATE TABLE `web_setting` (
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

INSERT INTO `web_setting` (`setting_id`, `logo`, `invoice_logo`, `favicon`, `currency`, `timezone`, `currency_position`, `footer_text`, `language`, `rtr`, `captcha`, `is_qr`, `is_autoapprove_v`, `site_key`, `secret_key`, `discount_type`) VALUES ('1', 'assets/img/icons/2022-12-04/efd0a728f796e7b7ddaae7eaf11e43ac.png', 'assets/img/icons/2022-12-04/848a1b1d0f0e2a642043a636ae8f3c24.jpg', 'assets/img/icons/2022-12-04/8e015760dc5655c2f5f90b9e4b50cb10.ico', '৳', 'Asia/Dhaka', '0', 'Developed by Sohel Rana', 'english', '0', '1', '1', '1', '6LdiKhsUAAAAAMV4jQRmNYdZy2kXEuFe1HrdP5tt', '6LdiKhsUAAAAAMV4jQRmNYdZy2kXEuFe1HrdP5tt', '1');


#
# TABLE STRUCTURE FOR: writer
#

DROP TABLE IF EXISTS `writer`;

CREATE TABLE `writer` (
  `writer_id` int(11) NOT NULL AUTO_INCREMENT,
  `writer_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`writer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `writer` (`writer_id`, `writer_name`, `status`) VALUES ('1', 'আরিফ আজাদ', '1');
INSERT INTO `writer` (`writer_id`, `writer_name`, `status`) VALUES ('2', 'সমরেশ মজুমদার', '1');


